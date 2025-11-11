require( "ui.uieditor.menus.Challenges.Challenges_NearCompletion" )
require( "ui.uieditor.menus.Challenges.Challenges_ZM_Stickerbooks" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_DarkOps_Button" )
require( "ui.uieditor.widgets.Challenges.Challenges_Summary_NearCompletion_SM" )

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
		if challengeCategory == "zombiehunter" then
			focusButton = self.ZombieHunterButton
		elseif challengeCategory == "survivalist" then
			focusButton = self.SurvivalistButton
		elseif challengeCategory == "gumgobbler" then
			focusButton = self.GumGobblerButton
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

CoD.Challenges_ZM_Summary = InheritFrom( LUI.UIElement )
CoD.Challenges_ZM_Summary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_ZM_Summary )
	self.id = "Challenges_ZM_Summary"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( 0, 1, 76, -132 )
	operationsTitle:setTopBottom( 0, 0, 44.5, 119.5 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_TOTAL_COMPLETION" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local ZombieHunterButton = CoD.Challenges_Category_Button.new( menu, controller )
	ZombieHunterButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "zombiehunter" )
			end
		}
	} )
	ZombieHunterButton:setLeftRight( 0, 0, 14, 578 )
	ZombieHunterButton:setTopBottom( 0, 0, 176, 468 )
	ZombieHunterButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_zm_zombiehunter" ) )
	ZombieHunterButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ZombieHunterButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_ZOMBIEHUNTER" ) )
	ZombieHunterButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zombiehunter", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZombieHunterButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	ZombieHunterButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zombiehunter", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZombieHunterButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	ZombieHunterButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zombiehunter", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZombieHunterButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	ZombieHunterButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ZombieHunterButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ZombieHunterButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "zombiehunter" )
			OpenPopup( self, "Challenges_ZM_Stickerbooks", controller, "", "" )
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
	self:addElement( ZombieHunterButton )
	self.ZombieHunterButton = ZombieHunterButton
	
	local SurvivalistButton = CoD.Challenges_Category_Button.new( menu, controller )
	SurvivalistButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "survivalist" )
			end
		}
	} )
	SurvivalistButton:setLeftRight( 0.5, 0.5, -282, 282 )
	SurvivalistButton:setTopBottom( 0, 0, 176, 468 )
	SurvivalistButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_zm_survivalist" ) )
	SurvivalistButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	SurvivalistButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SURVIVALIST" ) )
	SurvivalistButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "survivalist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SurvivalistButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	SurvivalistButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "survivalist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SurvivalistButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	SurvivalistButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "survivalist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SurvivalistButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	SurvivalistButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	SurvivalistButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( SurvivalistButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "survivalist" )
			OpenPopup( self, "Challenges_ZM_Stickerbooks", controller, "", "" )
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
	self:addElement( SurvivalistButton )
	self.SurvivalistButton = SurvivalistButton
	
	local GumGobblerButton = CoD.Challenges_Category_Button.new( menu, controller )
	GumGobblerButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "gumgobbler" )
			end
		}
	} )
	GumGobblerButton:setLeftRight( 1, 1, -576, -14 )
	GumGobblerButton:setTopBottom( 0, 0, 176, 468 )
	GumGobblerButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_zm_gumgobbler" ) )
	GumGobblerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GumGobblerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GUMGOBBLER" ) )
	GumGobblerButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "gumgobbler", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GumGobblerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	GumGobblerButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "gumgobbler", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GumGobblerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	GumGobblerButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "gumgobbler", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GumGobblerButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	GumGobblerButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	GumGobblerButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( GumGobblerButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "gumgobbler" )
			OpenPopup( self, "Challenges_ZM_Stickerbooks", controller, "", "" )
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
	self:addElement( GumGobblerButton )
	self.GumGobblerButton = GumGobblerButton
	
	local NearCompletionButton = CoD.Challenges_Summary_NearCompletion_SM.new( menu, controller )
	NearCompletionButton:mergeStateConditions( {
		{
			stateName = "AllChallengesComplete",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "ChallengesZMCategoryStats.zm", 1 )
			end
		}
	} )
	NearCompletionButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesZMCategoryStats.zm" ), function ( model )
		menu:updateElementState( NearCompletionButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChallengesZMCategoryStats.zm"
		} )
	end )
	NearCompletionButton:setLeftRight( 0, 0, 13, 1123 )
	NearCompletionButton:setTopBottom( 1, 1, -212, -92 )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "statPercent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "statFractionText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "iconId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	NearCompletionButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	NearCompletionButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( NearCompletionButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			OpenPopup( self, "Challenges_NearCompletion", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( NearCompletionButton )
	self.NearCompletionButton = NearCompletionButton
	
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
	
	local Pixel20011 = LUI.UIImage.new()
	Pixel20011:setLeftRight( 0, 0, 1732, 1786 )
	Pixel20011:setTopBottom( 0, 0, 175, 181 )
	Pixel20011:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20011 )
	self.Pixel20011 = Pixel20011
	
	local Pixel200101 = LUI.UIImage.new()
	Pixel200101:setLeftRight( 0, 0, 1732, 1786 )
	Pixel200101:setTopBottom( 0, 0, 460, 466 )
	Pixel200101:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200101 )
	self.Pixel200101 = Pixel200101
	
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
	DarkOpsButton:setTopBottom( 1, 1, -212, -22 )
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
			OpenPopup( self, "Challenges_ZM_Stickerbooks", controller, "", "" )
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
	
	ZombieHunterButton.navigation = {
		right = SurvivalistButton,
		down = NearCompletionButton
	}
	SurvivalistButton.navigation = {
		left = ZombieHunterButton,
		right = GumGobblerButton,
		down = NearCompletionButton
	}
	GumGobblerButton.navigation = {
		left = SurvivalistButton,
		down = DarkOpsButton
	}
	NearCompletionButton.navigation = {
		up = {
			ZombieHunterButton,
			SurvivalistButton
		},
		right = DarkOpsButton
	}
	DarkOpsButton.navigation = {
		left = NearCompletionButton,
		up = GumGobblerButton
	}
	self.resetProperties = function ()
		NearCompletionButton:completeAnimation()
		NearCompletionButton:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoNearComplete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				NearCompletionButton:completeAnimation()
				self.NearCompletionButton:setAlpha( 0 )
				self.clipFinished( NearCompletionButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoNearComplete",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "noNearCompleteZM" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "noNearCompleteZM" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "noNearCompleteZM"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ZombieHunterButton.id = "ZombieHunterButton"
	SurvivalistButton.id = "SurvivalistButton"
	GumGobblerButton.id = "GumGobblerButton"
	NearCompletionButton.id = "NearCompletionButton"
	DarkOpsButton.id = "DarkOpsButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ZombieHunterButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.operationsTitle:close()
		self.ZombieHunterButton:close()
		self.SurvivalistButton:close()
		self.GumGobblerButton:close()
		self.NearCompletionButton:close()
		self.DarkOpsButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

