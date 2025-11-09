require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.menus.Challenges.Challenges_CP_Stickerbooks" )
require( "ui.uieditor.widgets.Challenges.Challenges_Summary_NearCompletion_SM" )
require( "ui.uieditor.menus.Challenges.Challenges_NearCompletion" )

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
		if f2_local1 == "missions" then
			f2_local2 = element.MissionsButton
		elseif f2_local1 == "tott" then
			f2_local2 = element.ToolsOfTheTradeButton
		elseif f2_local1 == "career" then
			f2_local2 = element.CareerButton
		end
		if f2_local2 then
			f2_local2:processEvent( {
				name = "gain_focus",
				controller = f1_arg1
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
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( true, true, 51, -88 )
	operationsTitle:setTopBottom( true, false, 30, 80 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_TOTAL_COMPLETION" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local cp = Engine.GetModelValue( model )
		if cp then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, cp ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local cp = Engine.GetModelValue( model )
		if cp then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( cp, 1 ), CoD.GetVectorComponentFromString( cp, 2 ), CoD.GetVectorComponentFromString( cp, 3 ), CoD.GetVectorComponentFromString( cp, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "cp", function ( model )
		local cp = Engine.GetModelValue( model )
		if cp then
			operationsTitle.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( cp ) ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local MissionsButton = CoD.Challenges_Category_Button.new( menu, controller )
	MissionsButton:setLeftRight( true, false, 9, 383 )
	MissionsButton:setTopBottom( true, false, 117, 312 )
	MissionsButton.CategoryIcon:setImage( RegisterImage( "uie_barracks_ass_bootcamp" ) )
	MissionsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	MissionsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_CATEGORY_MISSIONS_CAPS" ) )
	MissionsButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "missions", function ( model )
		local missions = Engine.GetModelValue( model )
		if missions then
			MissionsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, missions ) )
		end
	end )
	MissionsButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "missions", function ( model )
		local missions = Engine.GetModelValue( model )
		if missions then
			MissionsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( missions, 1 ), CoD.GetVectorComponentFromString( missions, 2 ), CoD.GetVectorComponentFromString( missions, 3 ), CoD.GetVectorComponentFromString( missions, 4 ) )
		end
	end )
	MissionsButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "missions", function ( model )
		local missions = Engine.GetModelValue( model )
		if missions then
			MissionsButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( missions ) ) )
		end
	end )
	MissionsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	MissionsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( MissionsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "missions" )
			OpenPopup( self, "Challenges_CP_Stickerbooks", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	MissionsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "missions" )
			end
		}
	} )
	self:addElement( MissionsButton )
	self.MissionsButton = MissionsButton
	
	local ToolsOfTheTradeButton = CoD.Challenges_Category_Button.new( menu, controller )
	ToolsOfTheTradeButton:setLeftRight( false, false, -188, 188 )
	ToolsOfTheTradeButton:setTopBottom( true, false, 117, 312 )
	ToolsOfTheTradeButton.CategoryIcon:setImage( RegisterImage( "uie_barracks_ass_killer" ) )
	ToolsOfTheTradeButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ToolsOfTheTradeButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_TOOLSOFTHETRADE" ) )
	ToolsOfTheTradeButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "tott", function ( model )
		local tott = Engine.GetModelValue( model )
		if tott then
			ToolsOfTheTradeButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, tott ) )
		end
	end )
	ToolsOfTheTradeButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "tott", function ( model )
		local tott = Engine.GetModelValue( model )
		if tott then
			ToolsOfTheTradeButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( tott, 1 ), CoD.GetVectorComponentFromString( tott, 2 ), CoD.GetVectorComponentFromString( tott, 3 ), CoD.GetVectorComponentFromString( tott, 4 ) )
		end
	end )
	ToolsOfTheTradeButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "tott", function ( model )
		local tott = Engine.GetModelValue( model )
		if tott then
			ToolsOfTheTradeButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( tott ) ) )
		end
	end )
	ToolsOfTheTradeButton:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	ToolsOfTheTradeButton:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( ToolsOfTheTradeButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "tott" )
			OpenPopup( self, "Challenges_CP_Stickerbooks", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	ToolsOfTheTradeButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "tott" )
			end
		}
	} )
	self:addElement( ToolsOfTheTradeButton )
	self.ToolsOfTheTradeButton = ToolsOfTheTradeButton
	
	local CareerButton = CoD.Challenges_Category_Button.new( menu, controller )
	CareerButton:setLeftRight( false, true, -383, -9 )
	CareerButton:setTopBottom( true, false, 117, 312 )
	CareerButton.CategoryIcon:setImage( RegisterImage( "uie_barracks_ass_humiliation" ) )
	CareerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	CareerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_CAREER" ) )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "career", function ( model )
		local career = Engine.GetModelValue( model )
		if career then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, career ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "career", function ( model )
		local career = Engine.GetModelValue( model )
		if career then
			CareerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( career, 1 ), CoD.GetVectorComponentFromString( career, 2 ), CoD.GetVectorComponentFromString( career, 3 ), CoD.GetVectorComponentFromString( career, 4 ) )
		end
	end )
	CareerButton:subscribeToGlobalModel( controller, "ChallengesCPCategoryStats", "career", function ( model )
		local career = Engine.GetModelValue( model )
		if career then
			CareerButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( career ) ) )
		end
	end )
	CareerButton:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	CareerButton:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	menu:AddButtonCallbackFunction( CareerButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "career" )
			OpenPopup( self, "Challenges_CP_Stickerbooks", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disabled" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	
	local NearCompletionButton = CoD.Challenges_Summary_NearCompletion_SM.new( menu, controller )
	NearCompletionButton:setLeftRight( true, false, 9, 768 )
	NearCompletionButton:setTopBottom( false, true, -141.5, -61.5 )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "statPercent", function ( model )
		local statPercent = Engine.GetModelValue( model )
		if statPercent then
			NearCompletionButton.NearCompletionWidget.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( statPercent, 1 ), CoD.GetVectorComponentFromString( statPercent, 2 ), CoD.GetVectorComponentFromString( statPercent, 3 ), CoD.GetVectorComponentFromString( statPercent, 4 ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "statFractionText", function ( model )
		local statFractionText = Engine.GetModelValue( model )
		if statFractionText then
			NearCompletionButton.NearCompletionWidget.ProgressFraction:setText( Engine.Localize( statFractionText ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "iconId", function ( model )
		local iconId = Engine.GetModelValue( model )
		if iconId then
			NearCompletionButton.NearCompletionWidget.ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( iconId ) ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			NearCompletionButton.NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( title ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesCPNearCompletion", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			NearCompletionButton.NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( description ) )
		end
	end )
	NearCompletionButton:registerEventHandler( "gain_focus", function ( element, event )
		local f36_local0 = nil
		if element.gainFocus then
			f36_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f36_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f36_local0
	end )
	NearCompletionButton:registerEventHandler( "lose_focus", function ( element, event )
		local f37_local0 = nil
		if element.loseFocus then
			f37_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f37_local0 = element.super:loseFocus( event )
		end
		return f37_local0
	end )
	menu:AddButtonCallbackFunction( NearCompletionButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			OpenPopup( self, "Challenges_NearCompletion", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
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
	self:addElement( NearCompletionButton )
	self.NearCompletionButton = NearCompletionButton
	
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NearCompletionButton:completeAnimation()
				self.NearCompletionButton:setAlpha( 1 )
				self.clipFinished( NearCompletionButton, {} )
			end
		},
		NoNearComplete = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.operationsTitle:close()
		element.MissionsButton:close()
		element.ToolsOfTheTradeButton:close()
		element.CareerButton:close()
		element.NearCompletionButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

