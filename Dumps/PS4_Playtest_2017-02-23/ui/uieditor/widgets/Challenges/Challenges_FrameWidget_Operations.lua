require( "ui.uieditor.menus.Challenges.Challenges_Operations" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button_SM" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_DarkOps_Button" )

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
		if challengeCategory == "bootcamp" then
			focusButton = self.BootcampButton
		elseif challengeCategory == "killer" then
			focusButton = self.KillerButton
		elseif challengeCategory == "humiliation" then
			focusButton = self.HumiliationButton
		elseif challengeCategory == "career" then
			focusButton = self.CareerButton
		elseif challengeCategory == "gamevictories" then
			focusButton = self.GameVictoriesButton
		elseif challengeCategory == "gameheroics" then
			focusButton = self.GameHeroicsButton
		elseif challengeCategory == "darkops" then
			focusButton = self.DarkOpsButton
		end
		if focusButton then
			focusButton:processEvent( {
				name = "gain_focus",
				controller = controller
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
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( 0, 1, 76, -132 )
	operationsTitle:setTopBottom( 0, 0, 44.5, 119.5 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_OPERATIONS_CAPS" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local BootcampButton = CoD.Challenges_Category_Button.new( menu, controller )
	BootcampButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "bootcamp" )
			end
		}
	} )
	BootcampButton:setLeftRight( 0, 0, 14, 578 )
	BootcampButton:setTopBottom( 0, 0, 176, 468 )
	BootcampButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_bootcamp" ) )
	BootcampButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	BootcampButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_BOOTCAMP" ) )
	BootcampButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "bootcamp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BootcampButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	BootcampButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "bootcamp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BootcampButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	BootcampButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "bootcamp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BootcampButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	BootcampButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BootcampButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BootcampButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "bootcamp" )
			OpenPopup( self, "Challenges_Operations", controller, "", "" )
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
	self:addElement( BootcampButton )
	self.BootcampButton = BootcampButton
	
	local KillerButton = CoD.Challenges_Category_Button.new( menu, controller )
	KillerButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "killer" )
			end
		}
	} )
	KillerButton:setLeftRight( 0.5, 0.5, -282, 282 )
	KillerButton:setTopBottom( 0, 0, 176, 468 )
	KillerButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_killer" ) )
	KillerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	KillerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_KILLER" ) )
	KillerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killer", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KillerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	KillerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killer", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KillerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	KillerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killer", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KillerButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	KillerButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	KillerButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( KillerButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "killer" )
			OpenPopup( self, "Challenges_Operations", controller, "", "" )
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
	self:addElement( KillerButton )
	self.KillerButton = KillerButton
	
	local HumiliationButton = CoD.Challenges_Category_Button.new( menu, controller )
	HumiliationButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "humiliation" )
			end
		}
	} )
	HumiliationButton:setLeftRight( 0, 0, 14, 578 )
	HumiliationButton:setTopBottom( 1, 1, -300, -8 )
	HumiliationButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_humiliation" ) )
	HumiliationButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	HumiliationButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_HUMILIATION" ) )
	HumiliationButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "humiliation", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HumiliationButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	HumiliationButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "humiliation", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HumiliationButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	HumiliationButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "humiliation", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HumiliationButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	HumiliationButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	HumiliationButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( HumiliationButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "humiliation" )
			OpenPopup( self, "Challenges_Operations", controller, "", "" )
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
	self:addElement( HumiliationButton )
	self.HumiliationButton = HumiliationButton
	
	local CareerButton = CoD.Challenges_Category_Button.new( menu, controller )
	CareerButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "career" )
			end
		}
	} )
	CareerButton:setLeftRight( 0.5, 0.5, -282, 282 )
	CareerButton:setTopBottom( 1, 1, -300, -8 )
	CareerButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_career" ) )
	CareerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CareerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_CAREER" ) )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "career", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "career", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "career", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CareerButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	CareerButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CareerButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CareerButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "career" )
			OpenPopup( self, "Challenges_Operations", controller, "", "" )
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
	self:addElement( CareerButton )
	self.CareerButton = CareerButton
	
	local GameVictoriesButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	GameVictoriesButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "gamevictories" )
			end
		}
	} )
	GameVictoriesButton:setLeftRight( 1, 1, -578, -14 )
	GameVictoriesButton:setTopBottom( 0, 0, 175, 364 )
	GameVictoriesButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_gamevictories" ) )
	GameVictoriesButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GameVictoriesButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GAMEVICTORIES" ) )
	GameVictoriesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gamevictories", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameVictoriesButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	GameVictoriesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gamevictories", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameVictoriesButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	GameVictoriesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gamevictories", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameVictoriesButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	GameVictoriesButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	GameVictoriesButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( GameVictoriesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "gamevictories" )
			OpenPopup( self, "Challenges_Operations", controller, "", "" )
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
	self:addElement( GameVictoriesButton )
	self.GameVictoriesButton = GameVictoriesButton
	
	local GameHeroicsButton = CoD.Challenges_Category_Button_SM.new( menu, controller )
	GameHeroicsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "gameheroics" )
			end
		}
	} )
	GameHeroicsButton:setLeftRight( 1, 1, -578, -14 )
	GameHeroicsButton:setTopBottom( 0, 0, 376, 566 )
	GameHeroicsButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_gameheroics" ) )
	GameHeroicsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GameHeroicsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GAMEHEROICS" ) )
	GameHeroicsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gameheroics", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameHeroicsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	GameHeroicsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gameheroics", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameHeroicsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	GameHeroicsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "gameheroics", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameHeroicsButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	GameHeroicsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	GameHeroicsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( GameHeroicsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "gameheroics" )
			OpenPopup( self, "Challenges_Operations", controller, "", "" )
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
	self:addElement( GameHeroicsButton )
	self.GameHeroicsButton = GameHeroicsButton
	
	local DarkOpsButton = CoD.Challenges_DarkOps_Button.new( menu, controller )
	DarkOpsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DarkOpsButton:setLeftRight( 1, 1, -576, -14 )
	DarkOpsButton:setTopBottom( 1, 1, -201, -11 )
	DarkOpsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	DarkOpsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	DarkOpsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( DarkOpsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "darkops" )
			OpenPopup( self, "Challenges_Operations", controller, "", "" )
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
	self:addElement( DarkOpsButton )
	self.DarkOpsButton = DarkOpsButton
	
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BootcampButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.operationsTitle:close()
		self.BootcampButton:close()
		self.KillerButton:close()
		self.HumiliationButton:close()
		self.CareerButton:close()
		self.GameVictoriesButton:close()
		self.GameHeroicsButton:close()
		self.DarkOpsButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

