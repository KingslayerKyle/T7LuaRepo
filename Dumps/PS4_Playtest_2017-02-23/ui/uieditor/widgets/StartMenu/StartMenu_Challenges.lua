require( "ui.uieditor.menus.Challenges.Challenges" )
require( "ui.uieditor.menus.Challenges.Challenges_CP" )
require( "ui.uieditor.menus.Challenges.Challenges_ZM" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Challenges_Button" )

local PostLoadFunc = function ( self, controller )
	local noNearCompleteCPModel = Engine.GetModel( Engine.GetModelForController( controller ), "noNearCompleteCP" )
	if noNearCompleteCPModel ~= nil and Engine.GetModelValue( noNearCompleteCPModel ) == true then
		self.CP:setState( "NoNearComplete" )
		local t = self.CP.currentState
	end
	local noNearCompleteMPModel = Engine.GetModel( Engine.GetModelForController( controller ), "noNearCompleteMP" )
	if noNearCompleteMPModel ~= nil and Engine.GetModelValue( noNearCompleteMPModel ) == true then
		self.MP:setState( "NoNearComplete" )
	end
	local noNearCompleteZMModel = Engine.GetModel( Engine.GetModelForController( controller ), "noNearCompleteZM" )
	if noNearCompleteZMModel ~= nil and Engine.GetModelValue( noNearCompleteZMModel ) == true then
		self.ZM:setState( "NoNearComplete" )
	end
end

CoD.StartMenu_Challenges = InheritFrom( LUI.UIElement )
CoD.StartMenu_Challenges.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Challenges )
	self.id = "StartMenu_Challenges"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CP = CoD.StartMenu_Challenges_Button.new( menu, controller )
	CP:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoNearComplete",
			condition = function ( menu, element, event )
				return IsElementInState( element, "NoNearComplete" )
			end
		}
	} )
	CP:setLeftRight( 0, 0, 13.5, 562.5 )
	CP:setTopBottom( 0, 1, 20, -268 )
	CP.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	CP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_COMPLETE_CAMPAIGN_CHALLENGES" ) )
	CP:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", nil, function ( model )
		CP:setModel( model, controller )
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.PercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.PercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.PercentComplete.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "statPercent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.NearCompletionWidget.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "statFractionText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.NearCompletionWidget.ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "iconId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.NearCompletionWidget.ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CP.NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	CP:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CP:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeGameMode", "cp" )
			OpenOverlay( self, "Challenges_CP", controller, "", "" )
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
	self:addElement( CP )
	self.CP = CP
	
	local MP = CoD.StartMenu_Challenges_Button.new( menu, controller )
	MP:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoNearComplete",
			condition = function ( menu, element, event )
				return IsElementInState( element, "NoNearComplete" )
			end
		}
	} )
	MP:setLeftRight( 0, 0, 575.5, 1124.5 )
	MP:setTopBottom( 0, 1, 20, -268 )
	MP.SessionName:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	MP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_COMPLETE_MULTIPLAYER_CHALLENGES" ) )
	MP:subscribeToGlobalModel( controller, "ChallengesMPNearCompletion", nil, function ( model )
		MP:setModel( model, controller )
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.PercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.PercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.PercentComplete.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPNearCompletion", "statPercent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.NearCompletionWidget.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPNearCompletion", "statFractionText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.NearCompletionWidget.ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPNearCompletion", "iconId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.NearCompletionWidget.ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPNearCompletion", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "ChallengesMPNearCompletion", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MP.NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	MP:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MP:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeGameMode", "mp" )
			OpenOverlay( self, "Challenges", controller, "", "" )
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
	self:addElement( MP )
	self.MP = MP
	
	local ZM = CoD.StartMenu_Challenges_Button.new( menu, controller )
	ZM:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoNearComplete",
			condition = function ( menu, element, event )
				return IsElementInState( element, "NoNearComplete" )
			end
		}
	} )
	ZM:setLeftRight( 0, 1, 1138, -38 )
	ZM:setTopBottom( 0, 1, 20, -268 )
	ZM.SessionName:setText( Engine.Localize( "MENU_ZOMBIES_CAPS" ) )
	ZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_COMPLETE_ZOMBIES_CHALLENGES" ) )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", nil, function ( model )
		ZM:setModel( model, controller )
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.PercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.PercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.PercentComplete.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "statPercent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.NearCompletionWidget.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "statFractionText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.NearCompletionWidget.ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "iconId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.NearCompletionWidget.ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZM.NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	ZM:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ZM:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ZM, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeGameMode", "zm" )
			OpenOverlay( self, "Challenges_ZM", controller, "", "" )
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
	self:addElement( ZM )
	self.ZM = ZM
	
	CP.navigation = {
		right = MP
	}
	MP.navigation = {
		left = CP,
		right = ZM
	}
	ZM.navigation = {
		left = MP
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CP.id = "CP"
	MP.id = "MP"
	ZM.id = "ZM"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MP:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CP:close()
		self.MP:close()
		self.ZM:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

