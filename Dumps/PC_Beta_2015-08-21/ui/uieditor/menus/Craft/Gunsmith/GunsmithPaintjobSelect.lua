require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditor" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelectorItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithVariantModel )
	self.restoreState = function ( f2_arg0 )
		f2_arg0.paintjobsList:findItem( {
			paintjobIndex = Engine.GetModelValue( f2_arg0:getModel( controller, "paintjobIndex" ) ),
			paintjobSlot = Engine.GetModelValue( f2_arg0:getModel( controller, "paintjobSlot" ) )
		}, nil, true, nil )
	end
	
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.UpdateDataSource" ), function ( model )
		local f3_local0 = CoD.perController[controller].selectedpaintjobModel
		if f3_local0 then
			local f3_local1 = Engine.GetModelValue( Engine.GetModel( f3_local0, "paintjobIndex" ) )
			local f3_local2 = Engine.GetModelValue( Engine.GetModel( f3_local0, "paintjobSlot" ) )
			if self.paintjobsList ~= nil then
				self.paintjobsList:updateDataSource( true )
				self.paintjobsList:findItem( {
					paintjobIndex = f3_local1,
					paintjobSlot = f3_local2
				}, nil, true, nil )
			end
		end
	end )
end

LUI.createMenu.GunsmithPaintjobSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithPaintjobSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithPaintjobSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 448 )
	LeftPanel:setTopBottom( true, false, 85, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local WeaponListBacking = LUI.UIImage.new()
	WeaponListBacking:setLeftRight( true, false, 79.5, 441 )
	WeaponListBacking:setTopBottom( true, false, 123.5, 621.5 )
	WeaponListBacking:setRGB( 0.74, 0.82, 0.86 )
	WeaponListBacking:setAlpha( 0 )
	self:addElement( WeaponListBacking )
	self.WeaponListBacking = WeaponListBacking
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.25, 506.75 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -5.5, 140.5 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_PAINTJOBS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local paintjobsList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	paintjobsList:makeFocusable()
	paintjobsList:setLeftRight( true, false, 79.75, 417.75 )
	paintjobsList:setTopBottom( true, false, 123.5, 576.5 )
	paintjobsList:setDataSource( "PaintjobList" )
	paintjobsList:setWidgetType( CoD.PaintjobSelectorItem )
	paintjobsList:setHorizontalCount( 3 )
	paintjobsList:setVerticalCount( 4 )
	paintjobsList:setSpacing( 7 )
	paintjobsList:setVerticalScrollbar( CoD.verticalScrollbar )
	paintjobsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		Gunsmith_PaintjobSelector_GainFocus( self, element, controller )
		return f5_local0
	end )
	paintjobsList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f6_local0
	end )
	paintjobsList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not Paintjobs_IsOccupied( element, controller ) then
			PaintjobSelector_ChoosePaintjob( self, element, controller )
			OpenOverlay( self, "EmblemEditor", controller )
			return true
		elseif Paintjobs_IsOccupied( element, controller ) then
			Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( self, element, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not Paintjobs_IsOccupied( element, controller ) then
			return true
		elseif Paintjobs_IsOccupied( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if Paintjobs_IsOccupied( element, controller ) then
			PaintjobSelector_ChoosePaintjob( self, element, controller )
			OpenOverlay( self, "EmblemEditor", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_EDIT_PAINTJOB" )
		if Paintjobs_IsOccupied( element, controller ) then
			return true
		else
			return false
		end
	end, true )
	paintjobsList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Paintjobs_IsOccupied( element, controller )
			end
		}
	} )
	self:addElement( paintjobsList )
	self.paintjobsList = paintjobsList
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
	itemName:setLeftRight( true, false, 459.5, 840.5 )
	itemName:setTopBottom( true, false, 125.5, 159.5 )
	itemName:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_PAINTSHOP_WEAPON_PAINTJOBS_SMALL", controller, weaponIndex ) ) )
		end
	end )
	itemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( itemName )
	self.itemName = itemName
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.titleLabel:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_PAINTSHOP_WEAPON_PAINTJOBS", controller, weaponIndex ) ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_PAINTSHOP_WEAPON_PAINTJOBS", controller, weaponIndex ) ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	itemName:linkToElementModel( paintjobsList, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:linkToElementModel( paintjobsList, "paintjobName", true, function ( model )
		local paintjobName = Engine.GetModelValue( model )
		if paintjobName then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( paintjobName ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f22_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f22_local0 then
			f22_local0 = self:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	paintjobsList.id = "paintjobsList"
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
		self.paintjobsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.TitleDotsWidget0:close()
		element.cac3dTitleIntermediary0:close()
		element.ElemsSideList:close()
		element.paintjobsList:close()
		element.itemName:close()
		element.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithPaintjobSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

