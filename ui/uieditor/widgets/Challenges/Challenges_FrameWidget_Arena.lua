-- 0c36356afaa51cee006e3f7f979e6b06
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.menus.Challenges.Challenges_Arena" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "set_selected_button", function ( element, event )
		local f2_local0 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		if f2_local0 == nil then
			return 
		end
		local f2_local1 = Engine.GetModelValue( f2_local0 )
		if f2_local1 == nil then
			return 
		end
		element:dispatchEventToChildren( {
			name = "lose_focus",
			controller = f1_arg1
		} )
		local f2_local2 = nil
		if f2_local1 == "arenavet" then
			f2_local2 = element.ArenaVetButton
		elseif f2_local1 == "arenabest" then
			f2_local2 = element.ArenaBestButton
		end
		if f2_local2 then
			f2_local2:processEvent( {
				name = "gain_focus",
				controller = f1_arg1
			} )
		end
	end )
end

CoD.Challenges_FrameWidget_Arena = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_Arena.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_Arena )
	self.id = "Challenges_FrameWidget_Arena"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local arenaTitle = LUI.UIText.new()
	arenaTitle:setLeftRight( true, true, 9, -9 )
	arenaTitle:setTopBottom( true, false, 38, 72 )
	arenaTitle:setText( Engine.Localize( "MENU_ARENA_CAPS" ) )
	arenaTitle:setTTF( "fonts/escom.ttf" )
	arenaTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	arenaTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( arenaTitle )
	self.arenaTitle = arenaTitle
	
	local ArenaVetButton = CoD.Challenges_Category_Button.new( menu, controller )
	ArenaVetButton:setLeftRight( true, false, 9, 385 )
	ArenaVetButton:setTopBottom( true, false, 117, 509.75 )
	ArenaVetButton.CategoryIcon:setScale( 1.3 )
	ArenaVetButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_arena_seasonvet" ) )
	ArenaVetButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0, 0, 0, 0 )
	ArenaVetButton.PercentCompleteWidget.percentText:setText( Engine.Localize( "" ) )
	ArenaVetButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ArenaVetButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_ARENAVET" ) )
	ArenaVetButton:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	ArenaVetButton:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( ArenaVetButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		SetGlobalModelValue( "challengeCategory", "arenavet" )
		OpenPopup( self, "Challenges_Arena", f6_arg2, "", "" )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	ArenaVetButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "HideCompletionWidget",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ArenaVetButton )
	self.ArenaVetButton = ArenaVetButton
	
	local ArenaBestButton = CoD.Challenges_Category_Button.new( menu, controller )
	ArenaBestButton:setLeftRight( false, false, -188, 188 )
	ArenaBestButton:setTopBottom( true, false, 117, 509.75 )
	ArenaBestButton.CategoryIcon:setScale( 1.3 )
	ArenaBestButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_arena_bestranked" ) )
	ArenaBestButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0, 0, 0, 0 )
	ArenaBestButton.PercentCompleteWidget.percentText:setText( Engine.Localize( "" ) )
	ArenaBestButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ArenaBestButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_ARENABEST" ) )
	ArenaBestButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	ArenaBestButton:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( ArenaBestButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		SetGlobalModelValue( "challengeCategory", "arenabest" )
		OpenPopup( self, "Challenges_Arena", f12_arg2, "", "" )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	ArenaBestButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "HideCompletionWidget",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ArenaBestButton )
	self.ArenaBestButton = ArenaBestButton
	
	local StartMenuframenoBG02 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG02:setLeftRight( false, true, -384, -9 )
	StartMenuframenoBG02:setTopBottom( true, false, 117, 509.75 )
	StartMenuframenoBG02:setAlpha( 0.25 )
	self:addElement( StartMenuframenoBG02 )
	self.StartMenuframenoBG02 = StartMenuframenoBG02
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, -29.13, 6.87 )
	Pixel2001:setTopBottom( true, false, 116.75, 120.75 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local Pixel2001000 = LUI.UIImage.new()
	Pixel2001000:setLeftRight( true, false, -29.13, 6.87 )
	Pixel2001000:setTopBottom( true, false, 509.75, 513.75 )
	Pixel2001000:setYRot( -180 )
	Pixel2001000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001000 )
	self.Pixel2001000 = Pixel2001000
	
	local Pixel20011 = LUI.UIImage.new()
	Pixel20011:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel20011:setTopBottom( true, false, 116.75, 120.75 )
	Pixel20011:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20011 )
	self.Pixel20011 = Pixel20011
	
	local Pixel20010000 = LUI.UIImage.new()
	Pixel20010000:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel20010000:setTopBottom( true, false, 509.75, 513.75 )
	Pixel20010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010000 )
	self.Pixel20010000 = Pixel20010000
	
	ArenaVetButton.navigation = {
		right = ArenaBestButton
	}
	ArenaBestButton.navigation = {
		left = ArenaVetButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ArenaVetButton.id = "ArenaVetButton"
	ArenaBestButton.id = "ArenaBestButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ArenaVetButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ArenaVetButton:close()
		element.ArenaBestButton:close()
		element.StartMenuframenoBG02:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

