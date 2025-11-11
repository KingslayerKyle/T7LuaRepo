require( "ui.uieditor.menus.Craft.WeaponBuildKits.WeaponBuildKits" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsCategoryButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local PostLoadFunc = function ( self, controller )
	local categories = CoD.CraftUtility.WeaponGroupNames
	for index = 1, #categories, 1 do
		local category = categories[index]
		local listItem = self.categoryList:findItem( {
			categoryRef = category.weapon_category
		}, nil, false, nil )
		if listItem then
			local breadcrumbCountModel = Engine.GetModel( listItem:getModel(), "breadcrumbCount" )
			if breadcrumbCountModel then
				Engine.SetModelValue( breadcrumbCountModel, CoD.CraftUtility.Gunsmith.GetBreadcrumbCountForWeaponGroup( controller, category.weapon_category ) )
			end
		end
	end
end

LUI.createMenu.WeaponBuildKitsCategorySelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponBuildKitsCategorySelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCategorySelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local Smoke = LUI.UIImage.new()
	Smoke:setLeftRight( 0, 1, 0, 0 )
	Smoke:setTopBottom( 0, 1, 0, 0 )
	Smoke:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( Smoke )
	self.Smoke = Smoke
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local categoryList = LUI.UIList.new( self, controller, 22, 0, nil, false, false, 0, 0, false, false )
	categoryList:makeFocusable()
	categoryList:setLeftRight( 0, 0, 175.5, 1740.5 )
	categoryList:setTopBottom( 0, 0, 254, 894 )
	categoryList:setWidgetType( CoD.WeaponBuildKitsCategoryButton )
	categoryList:setHorizontalCount( 3 )
	categoryList:setVerticalCount( 2 )
	categoryList:setSpacing( 22 )
	categoryList:setDataSource( "WeaponBuildKitCategories" )
	categoryList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	categoryList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( categoryList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SelectWeaponBuildKitCategory( element, controller )
		NavigateToMenu( self, "WeaponBuildKits", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( categoryList )
	self.categoryList = categoryList
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( 0.5, 0.5, -784, 0 )
	highlightedDescription:setTopBottom( 0.5, 0.5, -343, -310 )
	highlightedDescription:setText( Engine.Localize( "ZMUI_CUSTOMIZE_FOR_WALL_BUYS_AND_MYSTERY_BOXES" ) )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "DefaultClip"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetPerControllerTableProperty( controller, "editingWeaponBuildKits", true )
		SetHeadingKickerText( "MENU_ZOMBIES" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if not IsLAN() then
			SetHeadingKickerText( "MENU_ZOMBIES" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		Gunsmith_Back( self, element, controller )
		SetPerControllerTableProperty( controller, "editingWeaponBuildKits", nil )
		SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
		ForceLobbyButtonUpdate( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	categoryList.id = "categoryList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.categoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.GenericMenuFrame0:close()
		self.categoryList:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCategorySelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

