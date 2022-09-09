-- 0c10006fc7e4db1a6264cebfa1958b41
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.menus.Challenges.Challenges_Specialists" )
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
		if f2_local1 == "weapons" then
			f2_local2 = element.WeaponsButton
		elseif f2_local1 == "abilities" then
			f2_local2 = element.AbilitiesButton
		elseif f2_local1 == "killjoys" then
			f2_local2 = element.KilljoysButton
		end
		if f2_local2 then
			f2_local2:processEvent( {
				name = "gain_focus",
				controller = f1_arg1
			} )
		end
	end )
end

CoD.Challenges_FrameWidget_Specialists = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_Specialists.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_Specialists )
	self.id = "Challenges_FrameWidget_Specialists"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( true, true, 51, -88 )
	operationsTitle:setTopBottom( true, false, 30, 80 )
	operationsTitle.titleText:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local specialist = Engine.GetModelValue( model )
		if specialist then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, specialist ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local specialist = Engine.GetModelValue( model )
		if specialist then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( specialist, 1 ), CoD.GetVectorComponentFromString( specialist, 2 ), CoD.GetVectorComponentFromString( specialist, 3 ), CoD.GetVectorComponentFromString( specialist, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local specialist = Engine.GetModelValue( model )
		if specialist then
			operationsTitle.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( specialist ) ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local WeaponsButton = CoD.Challenges_Category_Button.new( menu, controller )
	WeaponsButton:setLeftRight( true, false, 9, 385 )
	WeaponsButton:setTopBottom( true, false, 117, 312 )
	WeaponsButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_specialist_weapons" ) )
	WeaponsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	WeaponsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALISTWEAPONS" ) )
	WeaponsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "weapons", function ( model )
		local weapons = Engine.GetModelValue( model )
		if weapons then
			WeaponsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, weapons ) )
		end
	end )
	WeaponsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "weapons", function ( model )
		local weapons = Engine.GetModelValue( model )
		if weapons then
			WeaponsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( weapons, 1 ), CoD.GetVectorComponentFromString( weapons, 2 ), CoD.GetVectorComponentFromString( weapons, 3 ), CoD.GetVectorComponentFromString( weapons, 4 ) )
		end
	end )
	WeaponsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "weapons", function ( model )
		local weapons = Engine.GetModelValue( model )
		if weapons then
			WeaponsButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( weapons ) ) )
		end
	end )
	WeaponsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	WeaponsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( WeaponsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsElementInState( f12_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "weapons" )
			OpenPopup( self, "Challenges_Specialists", f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f13_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	WeaponsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "weapons" )
			end
		}
	} )
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local AbilitiesButton = CoD.Challenges_Category_Button.new( menu, controller )
	AbilitiesButton:setLeftRight( false, false, -188, 188 )
	AbilitiesButton:setTopBottom( true, false, 117, 312 )
	AbilitiesButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_specialist_abilities" ) )
	AbilitiesButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	AbilitiesButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALISTABILITIES" ) )
	AbilitiesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "abilities", function ( model )
		local abilities = Engine.GetModelValue( model )
		if abilities then
			AbilitiesButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, abilities ) )
		end
	end )
	AbilitiesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "abilities", function ( model )
		local abilities = Engine.GetModelValue( model )
		if abilities then
			AbilitiesButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( abilities, 1 ), CoD.GetVectorComponentFromString( abilities, 2 ), CoD.GetVectorComponentFromString( abilities, 3 ), CoD.GetVectorComponentFromString( abilities, 4 ) )
		end
	end )
	AbilitiesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "abilities", function ( model )
		local abilities = Engine.GetModelValue( model )
		if abilities then
			AbilitiesButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( abilities ) ) )
		end
	end )
	AbilitiesButton:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	AbilitiesButton:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( AbilitiesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if not IsElementInState( f20_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "abilities" )
			OpenPopup( self, "Challenges_Specialists", f20_arg2 )
			return true
		else
			
		end
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f21_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	AbilitiesButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "abilities" )
			end
		}
	} )
	self:addElement( AbilitiesButton )
	self.AbilitiesButton = AbilitiesButton
	
	local KilljoysButton = CoD.Challenges_Category_Button.new( menu, controller )
	KilljoysButton:setLeftRight( false, true, -384, -9 )
	KilljoysButton:setTopBottom( true, false, 117, 312 )
	KilljoysButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_specialist_killjoy" ) )
	KilljoysButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	KilljoysButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALISTKILLJOYS" ) )
	KilljoysButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killjoys", function ( model )
		local killjoys = Engine.GetModelValue( model )
		if killjoys then
			KilljoysButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, killjoys ) )
		end
	end )
	KilljoysButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killjoys", function ( model )
		local killjoys = Engine.GetModelValue( model )
		if killjoys then
			KilljoysButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( killjoys, 1 ), CoD.GetVectorComponentFromString( killjoys, 2 ), CoD.GetVectorComponentFromString( killjoys, 3 ), CoD.GetVectorComponentFromString( killjoys, 4 ) )
		end
	end )
	KilljoysButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killjoys", function ( model )
		local killjoys = Engine.GetModelValue( model )
		if killjoys then
			KilljoysButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( killjoys ) ) )
		end
	end )
	KilljoysButton:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	KilljoysButton:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	menu:AddButtonCallbackFunction( KilljoysButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if not IsElementInState( f28_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "killjoys" )
			OpenPopup( self, "Challenges_Specialists", f28_arg2 )
			return true
		else
			
		end
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f29_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	KilljoysButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "killjoys" )
			end
		}
	} )
	self:addElement( KilljoysButton )
	self.KilljoysButton = KilljoysButton
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 392, -392 )
	StartMenuframenoBG0:setTopBottom( true, true, 320, -6 )
	StartMenuframenoBG0:setAlpha( 0.25 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 776, -8 )
	StartMenuframenoBG00:setTopBottom( true, true, 320, -6 )
	StartMenuframenoBG00:setAlpha( 0.25 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local StartMenuframenoBG01 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG01:setLeftRight( true, true, 9, -775 )
	StartMenuframenoBG01:setTopBottom( true, true, 320, -6 )
	StartMenuframenoBG01:setAlpha( 0.25 )
	self:addElement( StartMenuframenoBG01 )
	self.StartMenuframenoBG01 = StartMenuframenoBG01
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, -29.13, 6.87 )
	Pixel2001:setTopBottom( true, false, 116.75, 120.75 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( true, false, -29.13, 6.87 )
	Pixel20010:setTopBottom( true, false, 306.75, 310.75 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel200100 = LUI.UIImage.new()
	Pixel200100:setLeftRight( true, false, -29.13, 6.87 )
	Pixel200100:setTopBottom( true, false, 319.75, 323.75 )
	Pixel200100:setYRot( -180 )
	Pixel200100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200100 )
	self.Pixel200100 = Pixel200100
	
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
	
	local Pixel200101 = LUI.UIImage.new()
	Pixel200101:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel200101:setTopBottom( true, false, 306.75, 310.75 )
	Pixel200101:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200101 )
	self.Pixel200101 = Pixel200101
	
	local Pixel2001001 = LUI.UIImage.new()
	Pixel2001001:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel2001001:setTopBottom( true, false, 319.75, 323.75 )
	Pixel2001001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001001 )
	self.Pixel2001001 = Pixel2001001
	
	local Pixel20010000 = LUI.UIImage.new()
	Pixel20010000:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel20010000:setTopBottom( true, false, 509.75, 513.75 )
	Pixel20010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010000 )
	self.Pixel20010000 = Pixel20010000
	
	WeaponsButton.navigation = {
		right = AbilitiesButton
	}
	AbilitiesButton.navigation = {
		left = WeaponsButton,
		right = KilljoysButton
	}
	KilljoysButton.navigation = {
		left = AbilitiesButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	WeaponsButton.id = "WeaponsButton"
	AbilitiesButton.id = "AbilitiesButton"
	KilljoysButton.id = "KilljoysButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.WeaponsButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.operationsTitle:close()
		element.WeaponsButton:close()
		element.AbilitiesButton:close()
		element.KilljoysButton:close()
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG00:close()
		element.StartMenuframenoBG01:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
