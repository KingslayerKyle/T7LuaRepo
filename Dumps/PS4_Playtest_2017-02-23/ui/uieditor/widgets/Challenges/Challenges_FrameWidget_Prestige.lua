require( "ui.uieditor.menus.Challenges.Challenges_Prestige" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button_SM" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "set_selected_button", function ( self, event )
		local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		if challengeCategoryModel == nil then
			return 
		end
		local challengeCategory = Engine.GetModelValue( challengeCategoryModel )
		if challengeCategory == nil then
			return 
		end
		self:dispatchEventToChildren( {
			name = "lose_focus",
			controller = controller
		} )
		local focusButton = nil
		if challengeCategory == "combathandling" then
			focusButton = self.CombatHandlingButton
		elseif challengeCategory == "combatefficiency" then
			focusButton = self.CombatEfficiencyButton
		elseif challengeCategory == "perks1" then
			focusButton = self.Perks1Button
		elseif challengeCategory == "perks2" then
			focusButton = self.Perks2Button
		elseif challengeCategory == "perks3" then
			focusButton = self.Perks3Button
		elseif challengeCategory == "lethals" then
			focusButton = self.LethalsButton
		elseif challengeCategory == "tacticals" then
			focusButton = self.TacticalsButton
		elseif challengeCategory == "wildcards" then
			focusButton = self.WildcardsButton
		end
		if focusButton then
			focusButton:processEvent( {
				name = "gain_focus",
				controller = controller
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
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( 0, 1, 76, -132 )
	operationsTitle:setTopBottom( 0, 0, 44.5, 119.5 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_EMBLEM_BACKGROUND_PRESTIGETAB" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local CombatHandlingButton = CoD.Challenges_Category_Button.new( menu, controller )
	CombatHandlingButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "combathandling" )
			end
		}
	} )
	CombatHandlingButton:setLeftRight( 0, 0, 14, 578 )
	CombatHandlingButton:setTopBottom( 0, 0, 176, 468 )
	CombatHandlingButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_combat_handling" ) )
	CombatHandlingButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CombatHandlingButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBATHANDLING" ) )
	CombatHandlingButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combathandling", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatHandlingButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	CombatHandlingButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combathandling", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatHandlingButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CombatHandlingButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combathandling", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatHandlingButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	CombatHandlingButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CombatHandlingButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CombatHandlingButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "combathandling" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CombatHandlingButton )
	self.CombatHandlingButton = CombatHandlingButton
	
	local CombatEfficiencyButton = CoD.Challenges_Category_Button.new( menu, controller )
	CombatEfficiencyButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "combatefficiency" )
			end
		}
	} )
	CombatEfficiencyButton:setLeftRight( 0, 0, 14, 578 )
	CombatEfficiencyButton:setTopBottom( 1, 1, -300, -10 )
	CombatEfficiencyButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_combat_efficiency" ) )
	CombatEfficiencyButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CombatEfficiencyButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBATEFFICIENCY" ) )
	CombatEfficiencyButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combatefficiency", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatEfficiencyButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	CombatEfficiencyButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combatefficiency", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatEfficiencyButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CombatEfficiencyButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "combatefficiency", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatEfficiencyButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	CombatEfficiencyButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CombatEfficiencyButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CombatEfficiencyButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "combatefficiency" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CombatEfficiencyButton )
	self.CombatEfficiencyButton = CombatEfficiencyButton
	
	local Perks1Button = CoD.Challenges_Category_Button_SM.new( menu, controller )
	Perks1Button:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "perks1" )
			end
		}
	} )
	Perks1Button:setLeftRight( 0.5, 0.5, -283, 281 )
	Perks1Button:setTopBottom( 0, 0, 175, 364 )
	Perks1Button.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_perks1" ) )
	Perks1Button.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	Perks1Button.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS1" ) )
	Perks1Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks1Button.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	Perks1Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks1Button.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Perks1Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks1Button.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	Perks1Button:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Perks1Button:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Perks1Button, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "perks1" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Perks1Button )
	self.Perks1Button = Perks1Button
	
	local Perks2Button = CoD.Challenges_Category_Button_SM.new( menu, controller )
	Perks2Button:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "perks2" )
			end
		}
	} )
	Perks2Button:setLeftRight( 0.5, 0.5, -283, 281 )
	Perks2Button:setTopBottom( 0, 0, 377, 567 )
	Perks2Button.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_perks2" ) )
	Perks2Button.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	Perks2Button.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS2" ) )
	Perks2Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks2Button.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	Perks2Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks2Button.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Perks2Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks2Button.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	Perks2Button:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Perks2Button:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Perks2Button, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "perks2" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Perks2Button )
	self.Perks2Button = Perks2Button
	
	local Perks3Button = CoD.Challenges_Category_Button_SM.new( menu, controller )
	Perks3Button:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "perks3" )
			end
		}
	} )
	Perks3Button:setLeftRight( 0.5, 0.5, -281, 281 )
	Perks3Button:setTopBottom( 1, 1, -201, -11 )
	Perks3Button.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_perks3" ) )
	Perks3Button.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	Perks3Button.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS3" ) )
	Perks3Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks3Button.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	Perks3Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks3Button.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Perks3Button:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "perks3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Perks3Button.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	Perks3Button:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Perks3Button:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Perks3Button, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "perks3" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Perks3Button )
	self.Perks3Button = Perks3Button
	
	local LethalsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	LethalsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "lethals" )
			end
		}
	} )
	LethalsButton:setLeftRight( 1, 1, -578, -14 )
	LethalsButton:setTopBottom( 0, 0, 175, 364 )
	LethalsButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_equipment_lethal" ) )
	LethalsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	LethalsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_LETHALS" ) )
	LethalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "lethals", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	LethalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "lethals", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	LethalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "lethals", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalsButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	LethalsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	LethalsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( LethalsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "lethals" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( LethalsButton )
	self.LethalsButton = LethalsButton
	
	local TacticalsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	TacticalsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "tacticals" )
			end
		}
	} )
	TacticalsButton:setLeftRight( 1, 1, -578, -14 )
	TacticalsButton:setTopBottom( 0, 0, 377, 567 )
	TacticalsButton.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_tacticals" ) )
	TacticalsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	TacticalsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_TACTICALS" ) )
	TacticalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "tacticals", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	TacticalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "tacticals", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	TacticalsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "tacticals", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalsButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	TacticalsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	TacticalsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( TacticalsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "tacticals" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( TacticalsButton )
	self.TacticalsButton = TacticalsButton
	
	local WildcardsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	WildcardsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "wildcards" )
			end
		}
	} )
	WildcardsButton:setLeftRight( 1, 1, -576, -14 )
	WildcardsButton:setTopBottom( 1, 1, -201, -11 )
	WildcardsButton.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_wildcards" ) )
	WildcardsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	WildcardsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_WILDCARDS" ) )
	WildcardsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "wildcards", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WildcardsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	WildcardsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "wildcards", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WildcardsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	WildcardsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "wildcards", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WildcardsButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	WildcardsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	WildcardsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( WildcardsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "wildcards" )
			OpenPopup( self, "Challenges_Prestige", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( WildcardsButton )
	self.WildcardsButton = WildcardsButton
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( 0, 0, -44, 10 )
	Pixel2001:setTopBottom( 0, 0, 175, 181 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( 0, 0, -44, 10 )
	Pixel20010:setTopBottom( 0, 0, 460, 466 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel200100 = LUI.UIImage.new()
	Pixel200100:setLeftRight( 0, 0, -44, 10 )
	Pixel200100:setTopBottom( 0, 0, 480, 486 )
	Pixel200100:setYRot( -180 )
	Pixel200100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200100 )
	self.Pixel200100 = Pixel200100
	
	local Pixel2001000 = LUI.UIImage.new()
	Pixel2001000:setLeftRight( 0, 0, -44, 10 )
	Pixel2001000:setTopBottom( 0, 0, 765, 771 )
	Pixel2001000:setYRot( -180 )
	Pixel2001000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001000 )
	self.Pixel2001000 = Pixel2001000
	
	local Pixel20011 = LUI.UIImage.new()
	Pixel20011:setLeftRight( 0, 0, 1732, 1786 )
	Pixel20011:setTopBottom( 0, 0, 175, 181 )
	Pixel20011:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20011 )
	self.Pixel20011 = Pixel20011
	
	local Pixel200101 = LUI.UIImage.new()
	Pixel200101:setLeftRight( 0, 0, 1732, 1786 )
	Pixel200101:setTopBottom( 0, 0, 358, 364 )
	Pixel200101:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200101 )
	self.Pixel200101 = Pixel200101
	
	local Pixel2001001 = LUI.UIImage.new()
	Pixel2001001:setLeftRight( 0, 0, 1732, 1786 )
	Pixel2001001:setTopBottom( 0, 0, 378, 384 )
	Pixel2001001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001001 )
	self.Pixel2001001 = Pixel2001001
	
	local Pixel20010000 = LUI.UIImage.new()
	Pixel20010000:setLeftRight( 0, 0, 1732, 1786 )
	Pixel20010000:setTopBottom( 0, 0, 765, 771 )
	Pixel20010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010000 )
	self.Pixel20010000 = Pixel20010000
	
	local Pixel2001010 = LUI.UIImage.new()
	Pixel2001010:setLeftRight( 0, 0, 1732, 1786 )
	Pixel2001010:setTopBottom( 0, 0, 561, 567 )
	Pixel2001010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001010 )
	self.Pixel2001010 = Pixel2001010
	
	local Pixel20010010 = LUI.UIImage.new()
	Pixel20010010:setLeftRight( 0, 0, 1732, 1786 )
	Pixel20010010:setTopBottom( 0, 0, 580, 586 )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CombatHandlingButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.operationsTitle:close()
		self.CombatHandlingButton:close()
		self.CombatEfficiencyButton:close()
		self.Perks1Button:close()
		self.Perks2Button:close()
		self.Perks3Button:close()
		self.LethalsButton:close()
		self.TacticalsButton:close()
		self.WildcardsButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

