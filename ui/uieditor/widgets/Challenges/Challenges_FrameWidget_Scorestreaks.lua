-- 5ccd2c6bc4d24eb068783440a93ce977
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.menus.Challenges.Challenges_Scorestreaks" )
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
		if f2_local1 == "airassault" then
			f2_local2 = element.AirAssaultButton
		elseif f2_local1 == "groundassault" then
			f2_local2 = element.GroundAssaultButton
		elseif f2_local1 == "support" then
			f2_local2 = element.SupportButton
		elseif f2_local1 == "returnfire" then
			f2_local2 = element.ReturnFireButton
		end
		if f2_local2 then
			f2_local2:processEvent( {
				name = "gain_focus",
				controller = f1_arg1
			} )
		end
	end )
end

CoD.Challenges_FrameWidget_Scorestreaks = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_Scorestreaks.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_Scorestreaks )
	self.id = "Challenges_FrameWidget_Scorestreaks"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( true, true, 51, -88 )
	operationsTitle:setTopBottom( true, false, 30, 80 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_SCORESTREAKS_CAPS" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local scorestreaks = Engine.GetModelValue( model )
		if scorestreaks then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, scorestreaks ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local scorestreaks = Engine.GetModelValue( model )
		if scorestreaks then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( scorestreaks, 1 ), CoD.GetVectorComponentFromString( scorestreaks, 2 ), CoD.GetVectorComponentFromString( scorestreaks, 3 ), CoD.GetVectorComponentFromString( scorestreaks, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local scorestreaks = Engine.GetModelValue( model )
		if scorestreaks then
			operationsTitle.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( scorestreaks ) ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local AirAssaultButton = CoD.Challenges_Category_Button.new( menu, controller )
	AirAssaultButton:setLeftRight( true, false, 9, 385 )
	AirAssaultButton:setTopBottom( true, false, 117, 312 )
	AirAssaultButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_air" ) )
	AirAssaultButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	AirAssaultButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_AIR" ) )
	AirAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "airassault", function ( model )
		local airassault = Engine.GetModelValue( model )
		if airassault then
			AirAssaultButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, airassault ) )
		end
	end )
	AirAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "airassault", function ( model )
		local airassault = Engine.GetModelValue( model )
		if airassault then
			AirAssaultButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( airassault, 1 ), CoD.GetVectorComponentFromString( airassault, 2 ), CoD.GetVectorComponentFromString( airassault, 3 ), CoD.GetVectorComponentFromString( airassault, 4 ) )
		end
	end )
	AirAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "airassault", function ( model )
		local airassault = Engine.GetModelValue( model )
		if airassault then
			AirAssaultButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( airassault ) ) )
		end
	end )
	AirAssaultButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	AirAssaultButton:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( AirAssaultButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsElementInState( f12_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "airassault" )
			OpenPopup( self, "Challenges_Scorestreaks", f12_arg2 )
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
	AirAssaultButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "airassault" )
			end
		}
	} )
	self:addElement( AirAssaultButton )
	self.AirAssaultButton = AirAssaultButton
	
	local GroundAssaultButton = CoD.Challenges_Category_Button.new( menu, controller )
	GroundAssaultButton:setLeftRight( false, false, -188, 188 )
	GroundAssaultButton:setTopBottom( true, false, 117, 312 )
	GroundAssaultButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_ground" ) )
	GroundAssaultButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GroundAssaultButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GROUND" ) )
	GroundAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "groundassault", function ( model )
		local groundassault = Engine.GetModelValue( model )
		if groundassault then
			GroundAssaultButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, groundassault ) )
		end
	end )
	GroundAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "groundassault", function ( model )
		local groundassault = Engine.GetModelValue( model )
		if groundassault then
			GroundAssaultButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( groundassault, 1 ), CoD.GetVectorComponentFromString( groundassault, 2 ), CoD.GetVectorComponentFromString( groundassault, 3 ), CoD.GetVectorComponentFromString( groundassault, 4 ) )
		end
	end )
	GroundAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "groundassault", function ( model )
		local groundassault = Engine.GetModelValue( model )
		if groundassault then
			GroundAssaultButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( groundassault ) ) )
		end
	end )
	GroundAssaultButton:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	GroundAssaultButton:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( GroundAssaultButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if not IsElementInState( f20_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "groundassault" )
			OpenPopup( self, "Challenges_Scorestreaks", f20_arg2 )
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
	GroundAssaultButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "groundassault" )
			end
		}
	} )
	self:addElement( GroundAssaultButton )
	self.GroundAssaultButton = GroundAssaultButton
	
	local SupportButton = CoD.Challenges_Category_Button.new( menu, controller )
	SupportButton:setLeftRight( false, true, -384, -9 )
	SupportButton:setTopBottom( true, false, 117, 312 )
	SupportButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_support" ) )
	SupportButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	SupportButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SUPPORT" ) )
	SupportButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "support", function ( model )
		local support = Engine.GetModelValue( model )
		if support then
			SupportButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, support ) )
		end
	end )
	SupportButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "support", function ( model )
		local support = Engine.GetModelValue( model )
		if support then
			SupportButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( support, 1 ), CoD.GetVectorComponentFromString( support, 2 ), CoD.GetVectorComponentFromString( support, 3 ), CoD.GetVectorComponentFromString( support, 4 ) )
		end
	end )
	SupportButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "support", function ( model )
		local support = Engine.GetModelValue( model )
		if support then
			SupportButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( support ) ) )
		end
	end )
	SupportButton:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	SupportButton:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	menu:AddButtonCallbackFunction( SupportButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if not IsElementInState( f28_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "support" )
			OpenPopup( self, "Challenges_Scorestreaks", f28_arg2 )
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
	SupportButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "support" )
			end
		}
	} )
	self:addElement( SupportButton )
	self.SupportButton = SupportButton
	
	local ReturnFireButton = CoD.Challenges_Category_Button.new( menu, controller )
	ReturnFireButton:setLeftRight( true, false, 9, 385 )
	ReturnFireButton:setTopBottom( false, true, -200, -5 )
	ReturnFireButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_returnfire" ) )
	ReturnFireButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ReturnFireButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_RETURNFIRE" ) )
	ReturnFireButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "returnfire", function ( model )
		local returnfire = Engine.GetModelValue( model )
		if returnfire then
			ReturnFireButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, returnfire ) )
		end
	end )
	ReturnFireButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "returnfire", function ( model )
		local returnfire = Engine.GetModelValue( model )
		if returnfire then
			ReturnFireButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( returnfire, 1 ), CoD.GetVectorComponentFromString( returnfire, 2 ), CoD.GetVectorComponentFromString( returnfire, 3 ), CoD.GetVectorComponentFromString( returnfire, 4 ) )
		end
	end )
	ReturnFireButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "returnfire", function ( model )
		local returnfire = Engine.GetModelValue( model )
		if returnfire then
			ReturnFireButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( returnfire ) ) )
		end
	end )
	ReturnFireButton:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	ReturnFireButton:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	menu:AddButtonCallbackFunction( ReturnFireButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if not IsElementInState( f36_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "returnfire" )
			OpenPopup( self, "Challenges_Scorestreaks", f36_arg2 )
			return true
		else
			
		end
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f37_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	ReturnFireButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "returnfire" )
			end
		}
	} )
	self:addElement( ReturnFireButton )
	self.ReturnFireButton = ReturnFireButton
	
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
	
	AirAssaultButton.navigation = {
		right = GroundAssaultButton,
		down = ReturnFireButton
	}
	GroundAssaultButton.navigation = {
		left = AirAssaultButton,
		right = SupportButton
	}
	SupportButton.navigation = {
		left = GroundAssaultButton
	}
	ReturnFireButton.navigation = {
		up = AirAssaultButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	AirAssaultButton.id = "AirAssaultButton"
	GroundAssaultButton.id = "GroundAssaultButton"
	SupportButton.id = "SupportButton"
	ReturnFireButton.id = "ReturnFireButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.AirAssaultButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.operationsTitle:close()
		element.AirAssaultButton:close()
		element.GroundAssaultButton:close()
		element.SupportButton:close()
		element.ReturnFireButton:close()
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

