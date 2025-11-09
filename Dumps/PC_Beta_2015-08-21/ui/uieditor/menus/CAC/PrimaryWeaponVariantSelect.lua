require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.CAC.GridItemVariantButton" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	Engine.CreateModel( f1_local0, "WeaponVariantList.numItemsToRemove" )
	Engine.CreateModel( f1_local0, "WeaponVariantList.curWeaponVariantName" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "close", function ()
		ClearSavedState( f2_arg0, f2_arg1 )
	end )
	f2_arg0.selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant:setState( "ShowVariant" )
end

LUI.createMenu.PrimaryWeaponVariantSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PrimaryWeaponVariantSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PrimaryWeaponVariantSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PRIMARY_WEAPON_CAPS" ) )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setDataSource( "WeaponVariantList" )
	selectionList:setWidgetType( CoD.GridItemVariantButton )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		FocusWeaponVariant( self, element, controller )
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
		SetWeaponVariant( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local attachmentList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 450, 754 )
	attachmentList:setTopBottom( true, false, 183, 215 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		SizeToSafeArea( element, controller )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( selectionList, "weaponItemIndex", true, function ( model )
		local weaponItemIndex = Engine.GetModelValue( model )
		if weaponItemIndex then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( GetItemNameFromIndex( weaponItemIndex ) ) )
		end
	end )
	selectMenuWidget:linkToElementModel( selectionList, "variantNameBig", true, function ( model )
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( variantNameBig ) )
		end
	end )
	attachmentList:linkToElementModel( selectionList, "listDataSource", true, function ( model )
		local listDataSource = Engine.GetModelValue( model )
		if listDataSource then
			attachmentList:setDataSource( listDataSource )
		end
	end )
	selectionList.navigation = {
		right = attachmentList
	}
	attachmentList.navigation = {
		left = selectionList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	selectionList.id = "selectionList"
	attachmentList.id = "attachmentList"
	feFooterContainer:setModel( self.buttonModel, controller )
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
		element.selectMenuWidget:close()
		element.selectionList:close()
		element.attachmentList:close()
		element.cacElemsSideListBoxes0:close()
		element.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrimaryWeaponVariantSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

