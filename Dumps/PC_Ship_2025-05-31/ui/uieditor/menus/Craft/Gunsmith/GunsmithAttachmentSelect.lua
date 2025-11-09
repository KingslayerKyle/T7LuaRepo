require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentItemButtonND" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Gunsmith.GunSmithSubDescription" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWarningWidget" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithAttachmentModel )
	self.restoreState = function ( f2_arg0 )
		f2_arg0.selectionList:findItem( {
			attachmentIndex = Engine.GetModelValue( f2_arg0:getModel() )
		}, nil, true, nil )
	end
	
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	if f3_arg1 == nil then
		f3_arg1 = "attachment"
	end
	local f3_local0 = Engine.CreateModel( Engine.GetModelForController( f3_arg0 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" )
	local f3_local1 = Engine.CreateModel( Engine.GetModelForController( f3_arg0 ), "Gunsmith.GunsmithSelectedItemProperties.title" )
	local f3_local2 = CoD.GetCustomization( f3_arg0, "weapon_index" )
	local f3_local3 = "MENU_GUNSMITH_ATTACHMENT_SELECT_TITLE"
	if f3_arg1 == "optic" then
		f3_local3 = "MENU_GUNSMITH_OPTICS_SELECT_TITLE"
	end
	Engine.SetModelValue( f3_local1, Engine.Localize( LocalizeWeaponNameIntoString( f3_local3, "mp", f3_arg0, f3_local2 ) ) )
	Engine.SetModelValue( f3_local0, f3_arg1 )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f0_local1( f4_arg1, CoD.perController[f4_arg1].gunsmithAttachmentType )
end

LUI.createMenu.GunsmithAttachmentSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithAttachmentSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithAttachmentSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 418 )
	LeftPanel:setTopBottom( true, false, 84, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( true, false, 99, 443 )
	GridItemButtonBackdropContainer3x4:setTopBottom( true, false, 145.5, 601.5 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 137, 590 )
	selectionList:setWidgetType( CoD.GunsmithAttachmentItemButtonND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:setDataSource( "GunsmithWeaponAttachments" )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		Gunsmith_FocusAttachment( self, element, controller, false )
		SetHintText( self, element, controller )
		return f6_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SelectAttachment( self, element, controller )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Gunsmith_IsAttachmentEquipped( menu, element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return Gunsmith_IsItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 99, 1193.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 145.5, 602.5 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( self, controller )
	WeaponNameWidget0:setLeftRight( true, false, 431, 812 )
	WeaponNameWidget0:setTopBottom( true, false, 137, 171 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local GunSmithSubDescription0 = CoD.GunSmithSubDescription.new( self, controller )
	GunSmithSubDescription0:setLeftRight( true, false, 431, 684 )
	GunSmithSubDescription0:setTopBottom( true, false, 174.5, 211.5 )
	self:addElement( GunSmithSubDescription0 )
	self.GunSmithSubDescription0 = GunSmithSubDescription0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	MenuFrame:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			MenuFrame.titleLabel:setText( Engine.Localize( title ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local weaponAttributes = CoD.WeaponAttributes_Internal.new( self, controller )
	weaponAttributes:setLeftRight( true, false, 441, 862 )
	weaponAttributes:setTopBottom( true, false, 554, 640 )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local warningMsg = CoD.GunsmithWarningWidget.new( self, controller )
	warningMsg:setLeftRight( true, false, 64, 431 )
	warningMsg:setTopBottom( true, false, 88, 112 )
	warningMsg.warningMsg.text:setText( Engine.Localize( "MENU_GUNSMITH_VARIANT_STATS_ATTACHMENT_WARNING" ) )
	warningMsg:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return Gunsmith_IsNewVariant( controller )
			end
		}
	} )
	self:addElement( warningMsg )
	self.warningMsg = warningMsg
	
	local f5_local13 = nil
	if IsPC() then
		f5_local13 = CoD.XCamMouseControl.new( self, controller )
	else
		f5_local13 = LUI.UIElement.createFake()
	end
	f5_local13:setLeftRight( false, true, -836, -64 )
	f5_local13:setTopBottom( true, true, 214, -207 )
	if IsPC() then
		self:addElement( f5_local13 )
	end
	self.XCamMouseControl = f5_local13
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	GunSmithSubDescription0:linkToElementModel( selectionList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			GunSmithSubDescription0.weaponDescTextBox:setText( Engine.Localize( description ) )
		end
	end )
	weaponAttributes:linkToElementModel( selectionList, "weaponAttributes", false, function ( model )
		weaponAttributes:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GridItemButtonBackdropSymbols:completeAnimation()
				self.GridItemButtonBackdropSymbols:setLeftRight( true, false, 93.66, 1188.34 )
				self.GridItemButtonBackdropSymbols:setTopBottom( true, false, 145.5, 602.5 )
				self.clipFinished( GridItemButtonBackdropSymbols, {} )
				GunSmithSubDescription0:completeAnimation()
				self.GunSmithSubDescription0:setAlpha( 1 )
				self.clipFinished( GunSmithSubDescription0, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f20_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f20_local0 then
			f20_local0 = self:dispatchEventToChildren( event )
		end
		return f20_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
			return true
		else
			return false
		end
	end, false )
	selectionList.id = "selectionList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.GridItemButtonBackdropContainer3x4:close()
		element.selectionList:close()
		element.FEMenuLeftGraphics:close()
		element.GridItemButtonBackdropSymbols:close()
		element.WeaponNameWidget0:close()
		element.GunSmithSubDescription0:close()
		element.MenuFrame:close()
		element.weaponAttributes:close()
		element.warningMsg:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithAttachmentSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

