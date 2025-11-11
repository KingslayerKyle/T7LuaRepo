require( "ui.uieditor.menus.Challenges.Challenges_CP_Stickerbooks" )
require( "ui.uieditor.menus.Challenges.Challenges_NearCompletion" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
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
		if challengeCategory == "missions" then
			focusButton = self.MissionsButton
		elseif challengeCategory == "tott" then
			focusButton = self.ToolsOfTheTradeButton
		elseif challengeCategory == "career" then
			focusButton = self.CareerButton
		end
		if focusButton then
			focusButton:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
	end )
end

CoD.Challenges_CP_Summary = InheritFrom( LUI.UIElement )
CoD.Challenges_CP_Summary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CP_Summary )
	self.id = "Challenges_CP_Summary"
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
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local MissionsButton = CoD.Challenges_Category_Button.new( menu, controller )
	MissionsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "missions" )
			end
		}
	} )
	MissionsButton:setLeftRight( 0, 0, 13, 574 )
	MissionsButton:setTopBottom( 0, 0, 176, 468 )
	MissionsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	MissionsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_CATEGORY_MISSIONS_CAPS" ) )
	MissionsButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "missions", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MissionsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	MissionsButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "missions", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MissionsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	MissionsButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "missions", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MissionsButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	MissionsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MissionsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MissionsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "missions" )
			OpenPopup( self, "Challenges_CP_Stickerbooks", controller, "", "" )
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
	self:addElement( MissionsButton )
	self.MissionsButton = MissionsButton
	
	local ToolsOfTheTradeButton = CoD.Challenges_Category_Button.new( menu, controller )
	ToolsOfTheTradeButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "tott" )
			end
		}
	} )
	ToolsOfTheTradeButton:setLeftRight( 0.5, 0.5, -282, 282 )
	ToolsOfTheTradeButton:setTopBottom( 0, 0, 176, 468 )
	ToolsOfTheTradeButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ToolsOfTheTradeButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_TOOLSOFTHETRADE" ) )
	ToolsOfTheTradeButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "tott", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ToolsOfTheTradeButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	ToolsOfTheTradeButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "tott", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ToolsOfTheTradeButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	ToolsOfTheTradeButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "tott", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ToolsOfTheTradeButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	ToolsOfTheTradeButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ToolsOfTheTradeButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ToolsOfTheTradeButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "tott" )
			OpenPopup( self, "Challenges_CP_Stickerbooks", controller, "", "" )
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
	self:addElement( ToolsOfTheTradeButton )
	self.ToolsOfTheTradeButton = ToolsOfTheTradeButton
	
	local CareerButton = CoD.Challenges_Category_Button.new( menu, controller )
	CareerButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "career" )
			end
		}
	} )
	CareerButton:setLeftRight( 1, 1, -575, -14 )
	CareerButton:setTopBottom( 0, 0, 176, 468 )
	CareerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CareerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_CAREER" ) )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "career", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "career", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "career", function ( model )
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
			OpenPopup( self, "Challenges_CP_Stickerbooks", controller, "", "" )
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
	
	local NearCompletionButton = CoD.Challenges_Summary_NearCompletion_SM.new( menu, controller )
	NearCompletionButton:mergeStateConditions( {
		{
			stateName = "AllChallengesComplete",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "ChallengesCPCategoryStats.cp", 1 )
			end
		}
	} )
	NearCompletionButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesCPCategoryStats.cp" ), function ( model )
		menu:updateElementState( NearCompletionButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChallengesCPCategoryStats.cp"
		} )
	end )
	NearCompletionButton:setLeftRight( 0, 0, 14, 1152 )
	NearCompletionButton:setTopBottom( 1, 1, -212, -92 )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "statPercent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "statFractionText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "iconId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionButton.NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "description", function ( model )
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
	
	MissionsButton.navigation = {
		right = ToolsOfTheTradeButton,
		down = NearCompletionButton
	}
	ToolsOfTheTradeButton.navigation = {
		left = MissionsButton,
		right = CareerButton,
		down = NearCompletionButton
	}
	CareerButton.navigation = {
		left = ToolsOfTheTradeButton
	}
	NearCompletionButton.navigation = {
		up = {
			MissionsButton,
			ToolsOfTheTradeButton
		}
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
				return IsModelValueTrue( controller, "noNearCompleteCP" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "noNearCompleteCP" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "noNearCompleteCP"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	MissionsButton.id = "MissionsButton"
	ToolsOfTheTradeButton.id = "ToolsOfTheTradeButton"
	CareerButton.id = "CareerButton"
	NearCompletionButton.id = "NearCompletionButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MissionsButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.operationsTitle:close()
		self.MissionsButton:close()
		self.ToolsOfTheTradeButton:close()
		self.CareerButton:close()
		self.NearCompletionButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

