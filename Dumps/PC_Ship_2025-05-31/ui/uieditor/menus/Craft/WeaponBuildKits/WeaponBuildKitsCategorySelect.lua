require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.Craft.WeaponBuildKits.WeaponBuildKits" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsCategoryButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.Craft.WeaponGroupNames
	for f1_local1 = 1, #f1_local0, 1 do
		local f1_local4 = f1_local0[f1_local1]
		local f1_local5 = f1_arg0.categoryList:findItem( {
			categoryRef = f1_local4.weapon_category
		}, nil, false, nil )
		if f1_local5 then
			local f1_local6 = Engine.GetModel( f1_local5:getModel(), "breadcrumbCount" )
			if f1_local6 then
				Engine.SetModelValue( f1_local6, CoD.CraftUtility.Gunsmith.GetBreadcrumbCountForWeaponGroup( f1_arg1, f1_local4.weapon_category ) )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCategorySelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local Smoke = LUI.UIImage.new()
	Smoke:setLeftRight( true, true, 0, 0 )
	Smoke:setTopBottom( true, true, 0, 0 )
	Smoke:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( Smoke )
	self.Smoke = Smoke
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local categoryList = LUI.UIList.new( self, controller, 15, 0, nil, false, false, 0, 0, false, true )
	categoryList:makeFocusable()
	categoryList:setLeftRight( true, false, 117, 1161 )
	categoryList:setTopBottom( true, false, 169, 596 )
	categoryList:setDataSource( "WeaponBuildKitCategories" )
	categoryList:setWidgetType( CoD.WeaponBuildKitsCategoryButton )
	categoryList:setHorizontalCount( 3 )
	categoryList:setVerticalCount( 2 )
	categoryList:setSpacing( 15 )
	categoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	categoryList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( categoryList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SelectWeaponBuildKitCategory( element, controller )
		NavigateToMenu( self, "WeaponBuildKits", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( categoryList )
	self.categoryList = categoryList
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, -523, 0 )
	highlightedDescription:setTopBottom( false, false, -229, -207 )
	highlightedDescription:setText( Engine.Localize( "ZMUI_CUSTOMIZE_FOR_WALL_BUYS_AND_MYSTERY_BOXES" ) )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f8_local0 = nil
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
		if not f8_local0 then
			f8_local0 = self:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f9_local0 = nil
		if not IsLAN() then
			SetHeadingKickerText( "MENU_ZOMBIES" )
		end
		if not f9_local0 then
			f9_local0 = self:dispatchEventToChildren( event )
		end
		return f9_local0
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.GenericMenuFrame0:close()
		element.categoryList:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKitsCategorySelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

