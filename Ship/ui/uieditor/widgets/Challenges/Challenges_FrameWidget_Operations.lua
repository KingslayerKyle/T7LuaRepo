-- 5f166288e63fb5b6c467b162543e2e15
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.menus.Challenges.Challenges_Operations" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button_SM" )
require( "ui.uieditor.widgets.Challenges.Challenges_DarkOps_Button" )

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
		if f2_local1 == "bootcamp" then
			f2_local2 = element.BootcampButton
		elseif f2_local1 == "killer" then
			f2_local2 = element.KillerButton
		elseif f2_local1 == "humiliation" then
			f2_local2 = element.HumiliationButton
		elseif f2_local1 == "career" then
			f2_local2 = element.CareerButton
		elseif f2_local1 == "gamevictories" then
			f2_local2 = element.GameVictoriesButton
		elseif f2_local1 == "gameheroics" then
			f2_local2 = element.GameHeroicsButton
		elseif f2_local1 == "darkops" then
			f2_local2 = element.DarkOpsButton
		end
		if f2_local2 then
			f2_local2:processEvent( {
				name = "gain_focus",
				controller = f1_arg1
			} )
		end
	end )
end

CoD.Challenges_FrameWidget_Operations = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_Operations.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_Operations )
	self.id = "Challenges_FrameWidget_Operations"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( true, true, 51, -88 )
	operationsTitle:setTopBottom( true, false, 30, 80 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_OPERATIONS_CAPS" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local operations = Engine.GetModelValue( model )
		if operations then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, operations ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local operations = Engine.GetModelValue( model )
		if operations then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( operations, 1 ), CoD.GetVectorComponentFromString( operations, 2 ), CoD.GetVectorComponentFromString( operations, 3 ), CoD.GetVectorComponentFromString( operations, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local operations = Engine.GetModelValue( model )
		if operations then
			operationsTitle.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( operations ) ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local BootcampButton = CoD.Challenges_Category_Button.new( menu, controller )
	BootcampButton:setLeftRight( true, false, 9, 385 )
	BootcampButton:setTopBottom( true, false, 117, 312 )
	BootcampButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_bootcamp" ) )
	BootcampButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	BootcampButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_BOOTCAMP" ) )
	BootcampButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "bootcamp", function ( model )
		local bootcamp = Engine.GetModelValue( model )
		if bootcamp then
			BootcampButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, bootcamp ) )
		end
	end )
	BootcampButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "bootcamp", function ( model )
		local bootcamp = Engine.GetModelValue( model )
		if bootcamp then
			BootcampButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( bootcamp, 1 ), CoD.GetVectorComponentFromString( bootcamp, 2 ), CoD.GetVectorComponentFromString( bootcamp, 3 ), CoD.GetVectorComponentFromString( bootcamp, 4 ) )
		end
	end )
	BootcampButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "bootcamp", function ( model )
		local bootcamp = Engine.GetModelValue( model )
		if bootcamp then
			BootcampButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( bootcamp ) ) )
		end
	end )
	BootcampButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	BootcampButton:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( BootcampButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsElementInState( f12_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "bootcamp" )
			OpenPopup( self, "Challenges_Operations", f12_arg2 )
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
	BootcampButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "bootcamp" )
			end
		}
	} )
	self:addElement( BootcampButton )
	self.BootcampButton = BootcampButton
	
	local KillerButton = CoD.Challenges_Category_Button.new( menu, controller )
	KillerButton:setLeftRight( false, false, -188, 188 )
	KillerButton:setTopBottom( true, false, 117, 312 )
	KillerButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_killer" ) )
	KillerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	KillerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_KILLER" ) )
	KillerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killer", function ( model )
		local killer = Engine.GetModelValue( model )
		if killer then
			KillerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, killer ) )
		end
	end )
	KillerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killer", function ( model )
		local killer = Engine.GetModelValue( model )
		if killer then
			KillerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( killer, 1 ), CoD.GetVectorComponentFromString( killer, 2 ), CoD.GetVectorComponentFromString( killer, 3 ), CoD.GetVectorComponentFromString( killer, 4 ) )
		end
	end )
	KillerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killer", function ( model )
		local killer = Engine.GetModelValue( model )
		if killer then
			KillerButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( killer ) ) )
		end
	end )
	KillerButton:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	KillerButton:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( KillerButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if not IsElementInState( f20_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "killer" )
			OpenPopup( self, "Challenges_Operations", f20_arg2 )
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
	KillerButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "killer" )
			end
		}
	} )
	self:addElement( KillerButton )
	self.KillerButton = KillerButton
	
	local HumiliationButton = CoD.Challenges_Category_Button.new( menu, controller )
	HumiliationButton:setLeftRight( true, false, 9, 385 )
	HumiliationButton:setTopBottom( false, true, -200, -5 )
	HumiliationButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_humiliation" ) )
	HumiliationButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	HumiliationButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_HUMILIATION" ) )
	HumiliationButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "humiliation", function ( model )
		local humiliation = Engine.GetModelValue( model )
		if humiliation then
			HumiliationButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, humiliation ) )
		end
	end )
	HumiliationButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "humiliation", function ( model )
		local humiliation = Engine.GetModelValue( model )
		if humiliation then
			HumiliationButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( humiliation, 1 ), CoD.GetVectorComponentFromString( humiliation, 2 ), CoD.GetVectorComponentFromString( humiliation, 3 ), CoD.GetVectorComponentFromString( humiliation, 4 ) )
		end
	end )
	HumiliationButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "humiliation", function ( model )
		local humiliation = Engine.GetModelValue( model )
		if humiliation then
			HumiliationButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( humiliation ) ) )
		end
	end )
	HumiliationButton:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	HumiliationButton:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	menu:AddButtonCallbackFunction( HumiliationButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if not IsElementInState( f28_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "humiliation" )
			OpenPopup( self, "Challenges_Operations", f28_arg2 )
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
	HumiliationButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "humiliation" )
			end
		}
	} )
	self:addElement( HumiliationButton )
	self.HumiliationButton = HumiliationButton
	
	local CareerButton = CoD.Challenges_Category_Button.new( menu, controller )
	CareerButton:setLeftRight( false, false, -188, 188 )
	CareerButton:setTopBottom( false, true, -200, -5 )
	CareerButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_career" ) )
	CareerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CareerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_CAREER" ) )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "career", function ( model )
		local career = Engine.GetModelValue( model )
		if career then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, career ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "career", function ( model )
		local career = Engine.GetModelValue( model )
		if career then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( career, 1 ), CoD.GetVectorComponentFromString( career, 2 ), CoD.GetVectorComponentFromString( career, 3 ), CoD.GetVectorComponentFromString( career, 4 ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "career", function ( model )
		local career = Engine.GetModelValue( model )
		if career then
			CareerButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( career ) ) )
		end
	end )
	CareerButton:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	CareerButton:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	menu:AddButtonCallbackFunction( CareerButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if not IsElementInState( f36_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "career" )
			OpenPopup( self, "Challenges_Operations", f36_arg2 )
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
	CareerButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "career" )
			end
		}
	} )
	self:addElement( CareerButton )
	self.CareerButton = CareerButton
	
	local GameVictoriesButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	GameVictoriesButton:setLeftRight( false, true, -385, -9 )
	GameVictoriesButton:setTopBottom( true, false, 117, 243 )
	GameVictoriesButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_gamevictories" ) )
	GameVictoriesButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GameVictoriesButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GAMEVICTORIES" ) )
	GameVictoriesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gamevictories", function ( model )
		local gamevictories = Engine.GetModelValue( model )
		if gamevictories then
			GameVictoriesButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, gamevictories ) )
		end
	end )
	GameVictoriesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gamevictories", function ( model )
		local gamevictories = Engine.GetModelValue( model )
		if gamevictories then
			GameVictoriesButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( gamevictories, 1 ), CoD.GetVectorComponentFromString( gamevictories, 2 ), CoD.GetVectorComponentFromString( gamevictories, 3 ), CoD.GetVectorComponentFromString( gamevictories, 4 ) )
		end
	end )
	GameVictoriesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gamevictories", function ( model )
		local gamevictories = Engine.GetModelValue( model )
		if gamevictories then
			GameVictoriesButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( gamevictories ) ) )
		end
	end )
	GameVictoriesButton:registerEventHandler( "gain_focus", function ( element, event )
		local f42_local0 = nil
		if element.gainFocus then
			f42_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f42_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f42_local0
	end )
	GameVictoriesButton:registerEventHandler( "lose_focus", function ( element, event )
		local f43_local0 = nil
		if element.loseFocus then
			f43_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f43_local0 = element.super:loseFocus( event )
		end
		return f43_local0
	end )
	menu:AddButtonCallbackFunction( GameVictoriesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if not IsElementInState( f44_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "gamevictories" )
			OpenPopup( self, "Challenges_Operations", f44_arg2 )
			return true
		else
			
		end
	end, function ( f45_arg0, f45_arg1, f45_arg2 )
		CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f45_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	GameVictoriesButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "gamevictories" )
			end
		}
	} )
	self:addElement( GameVictoriesButton )
	self.GameVictoriesButton = GameVictoriesButton
	
	local GameHeroicsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	GameHeroicsButton:setLeftRight( false, true, -385, -9 )
	GameHeroicsButton:setTopBottom( true, false, 250.75, 377.75 )
	GameHeroicsButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_gameheroics" ) )
	GameHeroicsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GameHeroicsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GAMEHEROICS" ) )
	GameHeroicsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gameheroics", function ( model )
		local gameheroics = Engine.GetModelValue( model )
		if gameheroics then
			GameHeroicsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, gameheroics ) )
		end
	end )
	GameHeroicsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gameheroics", function ( model )
		local gameheroics = Engine.GetModelValue( model )
		if gameheroics then
			GameHeroicsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( gameheroics, 1 ), CoD.GetVectorComponentFromString( gameheroics, 2 ), CoD.GetVectorComponentFromString( gameheroics, 3 ), CoD.GetVectorComponentFromString( gameheroics, 4 ) )
		end
	end )
	GameHeroicsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gameheroics", function ( model )
		local gameheroics = Engine.GetModelValue( model )
		if gameheroics then
			GameHeroicsButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( gameheroics ) ) )
		end
	end )
	GameHeroicsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f50_local0 = nil
		if element.gainFocus then
			f50_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f50_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f50_local0
	end )
	GameHeroicsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f51_local0 = nil
		if element.loseFocus then
			f51_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f51_local0 = element.super:loseFocus( event )
		end
		return f51_local0
	end )
	menu:AddButtonCallbackFunction( GameHeroicsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
		if not IsElementInState( f52_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "gameheroics" )
			OpenPopup( self, "Challenges_Operations", f52_arg2 )
			return true
		else
			
		end
	end, function ( f53_arg0, f53_arg1, f53_arg2 )
		CoD.Menu.SetButtonLabel( f53_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f53_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	GameHeroicsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "gameheroics" )
			end
		}
	} )
	self:addElement( GameHeroicsButton )
	self.GameHeroicsButton = GameHeroicsButton
	
	local DarkOpsButton = CoD.Challenges_DarkOps_Button.new( menu, controller )
	DarkOpsButton:setLeftRight( false, true, -384, -9 )
	DarkOpsButton:setTopBottom( false, true, -134, -7 )
	DarkOpsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	DarkOpsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f55_local0 = nil
		if element.gainFocus then
			f55_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f55_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f55_local0
	end )
	DarkOpsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f56_local0 = nil
		if element.loseFocus then
			f56_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f56_local0 = element.super:loseFocus( event )
		end
		return f56_local0
	end )
	menu:AddButtonCallbackFunction( DarkOpsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		if not IsElementInState( f57_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "darkops" )
			OpenPopup( self, "Challenges_Operations", f57_arg2 )
			return true
		else
			
		end
	end, function ( f58_arg0, f58_arg1, f58_arg2 )
		CoD.Menu.SetButtonLabel( f58_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f58_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	DarkOpsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( DarkOpsButton )
	self.DarkOpsButton = DarkOpsButton
	
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
	Pixel200101:setTopBottom( true, false, 238.75, 242.75 )
	Pixel200101:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200101 )
	self.Pixel200101 = Pixel200101
	
	local Pixel2001001 = LUI.UIImage.new()
	Pixel2001001:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel2001001:setTopBottom( true, false, 251.75, 255.75 )
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
	
	local Pixel2001010 = LUI.UIImage.new()
	Pixel2001010:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel2001010:setTopBottom( true, false, 373.75, 377.75 )
	Pixel2001010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001010 )
	self.Pixel2001010 = Pixel2001010
	
	local Pixel20010010 = LUI.UIImage.new()
	Pixel20010010:setLeftRight( true, false, 1154.87, 1190.87 )
	Pixel20010010:setTopBottom( true, false, 386.75, 390.75 )
	Pixel20010010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010010 )
	self.Pixel20010010 = Pixel20010010
	
	BootcampButton.navigation = {
		right = KillerButton,
		down = HumiliationButton
	}
	KillerButton.navigation = {
		left = BootcampButton,
		right = {
			GameVictoriesButton,
			GameHeroicsButton
		},
		down = CareerButton
	}
	HumiliationButton.navigation = {
		up = BootcampButton,
		right = CareerButton
	}
	CareerButton.navigation = {
		left = HumiliationButton,
		up = KillerButton,
		right = GameHeroicsButton
	}
	GameVictoriesButton.navigation = {
		left = KillerButton,
		down = GameHeroicsButton
	}
	GameHeroicsButton.navigation = {
		left = {
			KillerButton,
			CareerButton
		},
		up = GameVictoriesButton,
		down = DarkOpsButton
	}
	DarkOpsButton.navigation = {
		left = CareerButton,
		up = GameHeroicsButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	BootcampButton.id = "BootcampButton"
	KillerButton.id = "KillerButton"
	HumiliationButton.id = "HumiliationButton"
	CareerButton.id = "CareerButton"
	GameVictoriesButton.id = "GameVictoriesButton"
	GameHeroicsButton.id = "GameHeroicsButton"
	DarkOpsButton.id = "DarkOpsButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.BootcampButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.operationsTitle:close()
		element.BootcampButton:close()
		element.KillerButton:close()
		element.HumiliationButton:close()
		element.CareerButton:close()
		element.GameVictoriesButton:close()
		element.GameHeroicsButton:close()
		element.DarkOpsButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
