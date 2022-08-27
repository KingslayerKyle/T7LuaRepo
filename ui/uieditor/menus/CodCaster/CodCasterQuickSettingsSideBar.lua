-- f7a7d7531a61ac09ad1335ec917a6797
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterQuickSettingsListButton" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disableBlur = true
	f1_arg0.disableDarkenElement = true
	f1_arg0.animateInFromOffset = -225
end

LUI.hudMenuType.CodCasterQuickSettingsSideBar = "hud"
LUI.createMenu.CodCasterQuickSettingsSideBar = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CodCasterQuickSettingsSideBar" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCasterQuickSettingsSideBar.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, -11, 289 )
	black:setTopBottom( true, false, 0, 720 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.92 )
	self:addElement( black )
	self.black = black
	
	local texture = LUI.UIImage.new()
	texture:setLeftRight( true, false, -11, 289 )
	texture:setTopBottom( true, false, 0, 720 )
	texture:setAlpha( 0.75 )
	texture:setImage( RegisterImage( "uie_t7_codcaster_texturebacking" ) )
	self:addElement( texture )
	self.texture = texture
	
	local titlebacking = LUI.UIImage.new()
	titlebacking:setLeftRight( true, false, -11, 289 )
	titlebacking:setTopBottom( true, false, 0, 72.05 )
	titlebacking:setImage( RegisterImage( "uie_t7_codcaster_quicksetting" ) )
	self:addElement( titlebacking )
	self.titlebacking = titlebacking
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 65, 277 )
	Title:setTopBottom( true, false, 46.02, 66.02 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( LocalizeToUpperString( "CODCASTER_QUICK_SETTINGS" ) )
	Title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Title )
	self.Title = Title
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 70, 279 )
	Desc:setTopBottom( true, false, 389, 407 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local ButtonList = LUI.UIList.new( f2_local1, controller, 4, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 42, 282 )
	ButtonList:setTopBottom( true, false, 83.02, 367.02 )
	ButtonList:setWidgetType( CoD.CodCasterQuickSettingsListButton )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setSpacing( 4 )
	ButtonList:setDataSource( "CodCasterQuickSettingsButtonList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_NONE )
		return f3_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	f2_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		ToggleCodCasterQuickSettings( self, f5_arg0, f5_arg2, "" )
		ToggleControllerModelValueNumber( f5_arg2, "CodCaster.profileSettingsUpdated" )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	f2_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_NONE, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		ToggleCodCasterQuickSettings( self, f7_arg0, f7_arg2, "" )
		ToggleControllerModelValueNumber( f7_arg2, "CodCaster.profileSettingsUpdated" )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	Desc:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			Desc:setText( Engine.Localize( hintText ) )
		end
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "Q", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsRepeatButtonPress( f10_arg3 ) then
			ToggleControllerModelValueNumber( f10_arg2, "CodCaster.showQuickSettingsSideBar" )
			SaveShoutcasterSettings( self, f10_arg0, f10_arg2 )
			GoBack( self, f10_arg2 )
			SetLuiKeyCatcher( false )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "Q", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		ToggleControllerModelValueNumber( f12_arg2, "CodCaster.showQuickSettingsSidebar" )
		SaveShoutcasterSettings( self, f12_arg0, f12_arg2 )
		GoBack( self, f12_arg2 )
		SetLuiKeyCatcher( false )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	ButtonList.id = "ButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCasterQuickSettingsSideBar.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

