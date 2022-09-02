-- ab7344a6fe86d1ef988952bf21a7faa0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.menus.Challenges.Challenges_Prestige" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button_SM" )

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
		if f2_local1 == "combathandling" then
			f2_local2 = element.CombatHandlingButton
		elseif f2_local1 == "combatefficiency" then
			f2_local2 = element.CombatEfficiencyButton
		elseif f2_local1 == "perks1" then
			f2_local2 = element.Perks1Button
		elseif f2_local1 == "perks2" then
			f2_local2 = element.Perks2Button
		elseif f2_local1 == "perks3" then
			f2_local2 = element.Perks3Button
		elseif f2_local1 == "lethals" then
			f2_local2 = element.LethalsButton
		elseif f2_local1 == "tacticals" then
			f2_local2 = element.TacticalsButton
		elseif f2_local1 == "wildcards" then
			f2_local2 = element.WildcardsButton
		end
		if f2_local2 then
			f2_local2:processEvent( {
				name = "gain_focus",
				controller = f1_arg1
			} )
		end
	end )
end

CoD.Challenges_FrameWidget_Prestige = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_Prestige.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_Prestige )
	self.id = "Challenges_FrameWidget_Prestige"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( true, true, 51, -88 )
	operationsTitle:setTopBottom( true, false, 30, 80 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_EMBLEM_BACKGROUND_PRESTIGETAB" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local prestige = Engine.GetModelValue( model )
		if prestige then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, prestige ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local prestige = Engine.GetModelValue( model )
		if prestige then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( prestige, 1 ), CoD.GetVectorComponentFromString( prestige, 2 ), CoD.GetVectorComponentFromString( prestige, 3 ), CoD.GetVectorComponentFromString( prestige, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local prestige = Engine.GetModelValue( model )
		if prestige then
			operationsTitle.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( prestige ) ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local CombatHandlingButton = CoD.Challenges_Category_Button.new( menu, controller )
	CombatHandlingButton:setLeftRight( true, false, 9, 385 )
	CombatHandlingButton:setTopBottom( true, false, 117, 312 )
	CombatHandlingButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_combat_handling" ) )
	CombatHandlingButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CombatHandlingButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBATHANDLING" ) )
	CombatHandlingButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combathandling", function ( model )
		local combathandling = Engine.GetModelValue( model )
		if combathandling then
			CombatHandlingButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, combathandling ) )
		end
	end )
	CombatHandlingButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combathandling", function ( model )
		local combathandling = Engine.GetModelValue( model )
		if combathandling then
			CombatHandlingButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( combathandling, 1 ), CoD.GetVectorComponentFromString( combathandling, 2 ), CoD.GetVectorComponentFromString( combathandling, 3 ), CoD.GetVectorComponentFromString( combathandling, 4 ) )
		end
	end )
	CombatHandlingButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combathandling", function ( model )
		local combathandling = Engine.GetModelValue( model )
		if combathandling then
			CombatHandlingButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( combathandling ) ) )
		end
	end )
	CombatHandlingButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	CombatHandlingButton:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( CombatHandlingButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsElementInState( f12_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "combathandling" )
			OpenPopup( self, "Challenges_Prestige", f12_arg2 )
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
	CombatHandlingButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "combathandling" )
			end
		}
	} )
	self:addElement( CombatHandlingButton )
	self.CombatHandlingButton = CombatHandlingButton
	
	local CombatEfficiencyButton = CoD.Challenges_Category_Button.new( menu, controller )
	CombatEfficiencyButton:setLeftRight( true, false, 9, 385 )
	CombatEfficiencyButton:setTopBottom( false, true, -200, -7 )
	CombatEfficiencyButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_combat_efficiency" ) )
	CombatEfficiencyButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CombatEfficiencyButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBATEFFICIENCY" ) )
	CombatEfficiencyButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combatefficiency", function ( model )
		local combatefficiency = Engine.GetModelValue( model )
		if combatefficiency then
			CombatEfficiencyButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, combatefficiency ) )
		end
	end )
	CombatEfficiencyButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combatefficiency", function ( model )
		local combatefficiency = Engine.GetModelValue( model )
		if combatefficiency then
			CombatEfficiencyButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( combatefficiency, 1 ), CoD.GetVectorComponentFromString( combatefficiency, 2 ), CoD.GetVectorComponentFromString( combatefficiency, 3 ), CoD.GetVectorComponentFromString( combatefficiency, 4 ) )
		end
	end )
	CombatEfficiencyButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combatefficiency", function ( model )
		local combatefficiency = Engine.GetModelValue( model )
		if combatefficiency then
			CombatEfficiencyButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( combatefficiency ) ) )
		end
	end )
	CombatEfficiencyButton:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	CombatEfficiencyButton:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( CombatEfficiencyButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if not IsElementInState( f20_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "combatefficiency" )
			OpenPopup( self, "Challenges_Prestige", f20_arg2 )
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
	CombatEfficiencyButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "combatefficiency" )
			end
		}
	} )
	self:addElement( CombatEfficiencyButton )
	self.CombatEfficiencyButton = CombatEfficiencyButton
	
	local Perks1Button = CoD.Challenges_Category_Button_SM.new( menu, controller )
	Perks1Button:setLeftRight( false, false, -188.5, 187.5 )
	Perks1Button:setTopBottom( true, false, 117, 243 )
	Perks1Button.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_perk_1" ) )
	Perks1Button.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	Perks1Button.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS1" ) )
	Perks1Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks1", function ( model )
		local perks1 = Engine.GetModelValue( model )
		if perks1 then
			Perks1Button.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, perks1 ) )
		end
	end )
	Perks1Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks1", function ( model )
		local perks1 = Engine.GetModelValue( model )
		if perks1 then
			Perks1Button.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( perks1, 1 ), CoD.GetVectorComponentFromString( perks1, 2 ), CoD.GetVectorComponentFromString( perks1, 3 ), CoD.GetVectorComponentFromString( perks1, 4 ) )
		end
	end )
	Perks1Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks1", function ( model )
		local perks1 = Engine.GetModelValue( model )
		if perks1 then
			Perks1Button.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( perks1 ) ) )
		end
	end )
	Perks1Button:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	Perks1Button:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	menu:AddButtonCallbackFunction( Perks1Button, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if not IsElementInState( f28_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "perks1" )
			OpenPopup( self, "Challenges_Prestige", f28_arg2 )
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
	Perks1Button:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "perks1" )
			end
		}
	} )
	self:addElement( Perks1Button )
	self.Perks1Button = Perks1Button
	
	local Perks2Button = CoD.Challenges_Category_Button_SM.new( menu, controller )
	Perks2Button:setLeftRight( false, false, -188.5, 187.5 )
	Perks2Button:setTopBottom( true, false, 251, 378 )
	Perks2Button.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_perk_2" ) )
	Perks2Button.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	Perks2Button.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS2" ) )
	Perks2Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks2", function ( model )
		local perks2 = Engine.GetModelValue( model )
		if perks2 then
			Perks2Button.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, perks2 ) )
		end
	end )
	Perks2Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks2", function ( model )
		local perks2 = Engine.GetModelValue( model )
		if perks2 then
			Perks2Button.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( perks2, 1 ), CoD.GetVectorComponentFromString( perks2, 2 ), CoD.GetVectorComponentFromString( perks2, 3 ), CoD.GetVectorComponentFromString( perks2, 4 ) )
		end
	end )
	Perks2Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks2", function ( model )
		local perks2 = Engine.GetModelValue( model )
		if perks2 then
			Perks2Button.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( perks2 ) ) )
		end
	end )
	Perks2Button:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	Perks2Button:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	menu:AddButtonCallbackFunction( Perks2Button, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if not IsElementInState( f36_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "perks2" )
			OpenPopup( self, "Challenges_Prestige", f36_arg2 )
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
	Perks2Button:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "perks2" )
			end
		}
	} )
	self:addElement( Perks2Button )
	self.Perks2Button = Perks2Button
	
	local Perks3Button = CoD.Challenges_Category_Button_SM.new( menu, controller )
	Perks3Button:setLeftRight( false, false, -187.5, 187.5 )
	Perks3Button:setTopBottom( false, true, -134, -7 )
	Perks3Button.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_perk_3" ) )
	Perks3Button.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	Perks3Button.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS3" ) )
	Perks3Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks3", function ( model )
		local perks3 = Engine.GetModelValue( model )
		if perks3 then
			Perks3Button.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, perks3 ) )
		end
	end )
	Perks3Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks3", function ( model )
		local perks3 = Engine.GetModelValue( model )
		if perks3 then
			Perks3Button.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( perks3, 1 ), CoD.GetVectorComponentFromString( perks3, 2 ), CoD.GetVectorComponentFromString( perks3, 3 ), CoD.GetVectorComponentFromString( perks3, 4 ) )
		end
	end )
	Perks3Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks3", function ( model )
		local perks3 = Engine.GetModelValue( model )
		if perks3 then
			Perks3Button.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( perks3 ) ) )
		end
	end )
	Perks3Button:registerEventHandler( "gain_focus", function ( element, event )
		local f42_local0 = nil
		if element.gainFocus then
			f42_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f42_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f42_local0
	end )
	Perks3Button:registerEventHandler( "lose_focus", function ( element, event )
		local f43_local0 = nil
		if element.loseFocus then
			f43_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f43_local0 = element.super:loseFocus( event )
		end
		return f43_local0
	end )
	menu:AddButtonCallbackFunction( Perks3Button, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if not IsElementInState( f44_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "perks3" )
			OpenPopup( self, "Challenges_Prestige", f44_arg2 )
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
	Perks3Button:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "perks3" )
			end
		}
	} )
	self:addElement( Perks3Button )
	self.Perks3Button = Perks3Button
	
	local LethalsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	LethalsButton:setLeftRight( false, true, -385, -9 )
	LethalsButton:setTopBottom( true, false, 117, 243 )
	LethalsButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_equipment_lethal" ) )
	LethalsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	LethalsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_LETHALS" ) )
	LethalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "lethals", function ( model )
		local lethals = Engine.GetModelValue( model )
		if lethals then
			LethalsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, lethals ) )
		end
	end )
	LethalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "lethals", function ( model )
		local lethals = Engine.GetModelValue( model )
		if lethals then
			LethalsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( lethals, 1 ), CoD.GetVectorComponentFromString( lethals, 2 ), CoD.GetVectorComponentFromString( lethals, 3 ), CoD.GetVectorComponentFromString( lethals, 4 ) )
		end
	end )
	LethalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "lethals", function ( model )
		local lethals = Engine.GetModelValue( model )
		if lethals then
			LethalsButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( lethals ) ) )
		end
	end )
	LethalsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f50_local0 = nil
		if element.gainFocus then
			f50_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f50_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f50_local0
	end )
	LethalsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f51_local0 = nil
		if element.loseFocus then
			f51_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f51_local0 = element.super:loseFocus( event )
		end
		return f51_local0
	end )
	menu:AddButtonCallbackFunction( LethalsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
		if not IsElementInState( f52_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "lethals" )
			OpenPopup( self, "Challenges_Prestige", f52_arg2 )
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
	LethalsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "lethals" )
			end
		}
	} )
	self:addElement( LethalsButton )
	self.LethalsButton = LethalsButton
	
	local TacticalsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	TacticalsButton:setLeftRight( false, true, -385, -9 )
	TacticalsButton:setTopBottom( true, false, 251, 378 )
	TacticalsButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_tactical" ) )
	TacticalsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	TacticalsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_TACTICALS" ) )
	TacticalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "tacticals", function ( model )
		local tacticals = Engine.GetModelValue( model )
		if tacticals then
			TacticalsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, tacticals ) )
		end
	end )
	TacticalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "tacticals", function ( model )
		local tacticals = Engine.GetModelValue( model )
		if tacticals then
			TacticalsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( tacticals, 1 ), CoD.GetVectorComponentFromString( tacticals, 2 ), CoD.GetVectorComponentFromString( tacticals, 3 ), CoD.GetVectorComponentFromString( tacticals, 4 ) )
		end
	end )
	TacticalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "tacticals", function ( model )
		local tacticals = Engine.GetModelValue( model )
		if tacticals then
			TacticalsButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( tacticals ) ) )
		end
	end )
	TacticalsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f58_local0 = nil
		if element.gainFocus then
			f58_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f58_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f58_local0
	end )
	TacticalsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f59_local0 = nil
		if element.loseFocus then
			f59_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f59_local0 = element.super:loseFocus( event )
		end
		return f59_local0
	end )
	menu:AddButtonCallbackFunction( TacticalsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3 )
		if not IsElementInState( f60_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "tacticals" )
			OpenPopup( self, "Challenges_Prestige", f60_arg2 )
			return true
		else
			
		end
	end, function ( f61_arg0, f61_arg1, f61_arg2 )
		CoD.Menu.SetButtonLabel( f61_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f61_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	TacticalsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "tacticals" )
			end
		}
	} )
	self:addElement( TacticalsButton )
	self.TacticalsButton = TacticalsButton
	
	local WildcardsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	WildcardsButton:setLeftRight( false, true, -384, -9 )
	WildcardsButton:setTopBottom( false, true, -134, -7 )
	WildcardsButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_wildcards" ) )
	WildcardsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	WildcardsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_WILDCARDS" ) )
	WildcardsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "wildcards", function ( model )
		local wildcards = Engine.GetModelValue( model )
		if wildcards then
			WildcardsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, wildcards ) )
		end
	end )
	WildcardsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "wildcards", function ( model )
		local wildcards = Engine.GetModelValue( model )
		if wildcards then
			WildcardsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( wildcards, 1 ), CoD.GetVectorComponentFromString( wildcards, 2 ), CoD.GetVectorComponentFromString( wildcards, 3 ), CoD.GetVectorComponentFromString( wildcards, 4 ) )
		end
	end )
	WildcardsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "wildcards", function ( model )
		local wildcards = Engine.GetModelValue( model )
		if wildcards then
			WildcardsButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( wildcards ) ) )
		end
	end )
	WildcardsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f66_local0 = nil
		if element.gainFocus then
			f66_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f66_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f66_local0
	end )
	WildcardsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f67_local0 = nil
		if element.loseFocus then
			f67_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f67_local0 = element.super:loseFocus( event )
		end
		return f67_local0
	end )
	menu:AddButtonCallbackFunction( WildcardsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3 )
		if not IsElementInState( f68_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "wildcards" )
			OpenPopup( self, "Challenges_Prestige", f68_arg2 )
			return true
		else
			
		end
	end, function ( f69_arg0, f69_arg1, f69_arg2 )
		CoD.Menu.SetButtonLabel( f69_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f69_arg0, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	WildcardsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "wildcards" )
			end
		}
	} )
	self:addElement( WildcardsButton )
	self.WildcardsButton = WildcardsButton
	
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
	
	CombatHandlingButton.navigation = {
		right = {
			Perks1Button,
			Perks2Button
		},
		down = CombatEfficiencyButton
	}
	CombatEfficiencyButton.navigation = {
		up = CombatHandlingButton,
		right = Perks2Button
	}
	Perks1Button.navigation = {
		left = CombatHandlingButton,
		right = LethalsButton,
		down = Perks2Button
	}
	Perks2Button.navigation = {
		left = {
			CombatHandlingButton,
			CombatEfficiencyButton
		},
		up = Perks1Button,
		right = TacticalsButton,
		down = Perks3Button
	}
	Perks3Button.navigation = {
		left = CombatEfficiencyButton,
		up = Perks2Button,
		right = WildcardsButton
	}
	LethalsButton.navigation = {
		left = Perks1Button,
		down = TacticalsButton
	}
	TacticalsButton.navigation = {
		left = Perks2Button,
		up = LethalsButton,
		down = WildcardsButton
	}
	WildcardsButton.navigation = {
		left = Perks3Button,
		up = TacticalsButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CombatHandlingButton.id = "CombatHandlingButton"
	CombatEfficiencyButton.id = "CombatEfficiencyButton"
	Perks1Button.id = "Perks1Button"
	Perks2Button.id = "Perks2Button"
	Perks3Button.id = "Perks3Button"
	LethalsButton.id = "LethalsButton"
	TacticalsButton.id = "TacticalsButton"
	WildcardsButton.id = "WildcardsButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CombatHandlingButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.operationsTitle:close()
		element.CombatHandlingButton:close()
		element.CombatEfficiencyButton:close()
		element.Perks1Button:close()
		element.Perks2Button:close()
		element.Perks3Button:close()
		element.LethalsButton:close()
		element.TacticalsButton:close()
		element.WildcardsButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

