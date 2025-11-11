require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentItemButtonND" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWarningWidget" )
require( "ui.uieditor.widgets.Gunsmith.GunSmithSubDescription" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithAttachmentModel )
	self.restoreState = function ( self )
		local attachmentModel = self:getModel()
		local variantAttachmentIndex = Engine.GetModelValue( attachmentModel )
		self.selectionList:findItem( {
			attachmentIndex = variantAttachmentIndex
		}, nil, true, nil )
	end
	
end

local Gunsmith_SetAttachmentMenuTitle = function ( controller, attachmentType )
	if attachmentType == nil then
		attachmentType = "attachment"
	end
	local attachmentTypeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" )
	local attachmentTitleModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.title" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local string_ref = "MENU_GUNSMITH_ATTACHMENT_SELECT_TITLE"
	if attachmentType == "optic" then
		string_ref = "MENU_GUNSMITH_OPTICS_SELECT_TITLE"
	end
	local attachmentTitle = Engine.Localize( LocalizeWeaponNameIntoString( string_ref, controller, weaponIndex ) )
	Engine.SetModelValue( attachmentTitleModel, attachmentTitle )
	Engine.SetModelValue( attachmentTypeModel, attachmentType )
end

local PostLoadFunc = function ( self, controller )
	Gunsmith_SetAttachmentMenuTitle( controller, CoD.perController[controller].gunsmithAttachmentType )
end

LUI.createMenu.GunsmithAttachmentSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithAttachmentSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithAttachmentSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 627 )
	LeftPanel:setTopBottom( 0, 0, 126, 1080 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( 0, 0, 148, 664 )
	GridItemButtonBackdropContainer3x4:setTopBottom( 0, 0, 218, 902 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
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
	selectionList:setLeftRight( 0, 0, 116.5, 622.5 )
	selectionList:setTopBottom( 0, 0, 206, 884 )
	selectionList:setWidgetType( CoD.GunsmithAttachmentItemButtonND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 10 )
	selectionList:setDataSource( "GunsmithWeaponAttachments" )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		Gunsmith_FocusAttachment( self, element, controller, false )
		SetHintText( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SelectAttachment( self, element, controller )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( 0, 0, 149, 1791 )
	GridItemButtonBackdropSymbols:setTopBottom( 0, 0, 218, 904 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( self, controller )
	WeaponNameWidget0:setLeftRight( 0, 0, 646, 1218 )
	WeaponNameWidget0:setTopBottom( 0, 0, 205.5, 256.5 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local GunSmithSubDescription0 = CoD.GunSmithSubDescription.new( self, controller )
	GunSmithSubDescription0:setLeftRight( 0, 0, 646, 1026 )
	GunSmithSubDescription0:setTopBottom( 0, 0, 262, 318 )
	self:addElement( GunSmithSubDescription0 )
	self.GunSmithSubDescription0 = GunSmithSubDescription0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	MenuFrame:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuFrame.titleLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local weaponAttributes = CoD.WeaponAttributes_Internal.new( self, controller )
	weaponAttributes:setLeftRight( 0, 0, 662, 1293 )
	weaponAttributes:setTopBottom( 0, 0, 831, 960 )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local warningMsg = CoD.GunsmithWarningWidget.new( self, controller )
	warningMsg:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return Gunsmith_IsNewVariant( controller )
			end
		}
	} )
	warningMsg:setLeftRight( 0, 0, 96, 646 )
	warningMsg:setTopBottom( 0, 0, 132, 168 )
	warningMsg.warningMsg.text:setText( Engine.Localize( "MENU_GUNSMITH_VARIANT_STATS_ATTACHMENT_WARNING" ) )
	self:addElement( warningMsg )
	self.warningMsg = warningMsg
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 1, 1, -1158, 0 )
	XCamMouseControl:setTopBottom( 0, 1, 335, -297 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	GunSmithSubDescription0:linkToElementModel( selectionList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GunSmithSubDescription0.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	weaponAttributes:linkToElementModel( selectionList, "weaponAttributes", false, function ( model )
		weaponAttributes:setModel( model, controller )
	end )
	self.resetProperties = function ()
		GridItemButtonBackdropSymbols:completeAnimation()
		GridItemButtonBackdropSymbols:setLeftRight( 0, 0, 149, 1791 )
		GridItemButtonBackdropSymbols:setTopBottom( 0, 0, 218, 904 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				GridItemButtonBackdropSymbols:completeAnimation()
				self.GridItemButtonBackdropSymbols:setLeftRight( 0, 0, 140, 1782 )
				self.GridItemButtonBackdropSymbols:setTopBottom( 0, 0, 218, 904 )
				self.clipFinished( GridItemButtonBackdropSymbols, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.GridItemButtonBackdropContainer3x4:close()
		self.selectionList:close()
		self.FEMenuLeftGraphics:close()
		self.GridItemButtonBackdropSymbols:close()
		self.WeaponNameWidget0:close()
		self.GunSmithSubDescription0:close()
		self.MenuFrame:close()
		self.weaponAttributes:close()
		self.warningMsg:close()
		self.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithAttachmentSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

