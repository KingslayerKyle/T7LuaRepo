-- 5b22126b27db6d8cf387090b10babc45
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.menus.Challenges.Challenges_ZM_Stickerbooks" )
require( "ui.uieditor.widgets.Challenges.Challenges_Summary_NearCompletion_SM" )
require( "ui.uieditor.menus.Challenges.Challenges_NearCompletion" )
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
		if f2_local1 == "zombiehunter" then
			f2_local2 = element.ZombieHunterButton
		elseif f2_local1 == "survivalist" then
			f2_local2 = element.SurvivalistButton
		elseif f2_local1 == "gumgobbler" then
			f2_local2 = element.GumGobblerButton
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
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( true, true, 51, -88 )
	operationsTitle:setTopBottom( true, false, 30, 80 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_TOTAL_COMPLETION" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local zm = Engine.GetModelValue( model )
		if zm then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, zm ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local zm = Engine.GetModelValue( model )
		if zm then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( zm, 1 ), CoD.GetVectorComponentFromString( zm, 2 ), CoD.GetVectorComponentFromString( zm, 3 ), CoD.GetVectorComponentFromString( zm, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zm", function ( model )
		local zm = Engine.GetModelValue( model )
		if zm then
			operationsTitle.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( zm ) ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local ZombieHunterButton = CoD.Challenges_Category_Button.new( menu, controller )
	ZombieHunterButton:setLeftRight( true, false, 9, 385 )
	ZombieHunterButton:setTopBottom( true, false, 117, 312 )
	ZombieHunterButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_zm_zombiehunter" ) )
	ZombieHunterButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ZombieHunterButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_ZOMBIEHUNTER" ) )
	ZombieHunterButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zombiehunter", function ( model )
		local zombiehunter = Engine.GetModelValue( model )
		if zombiehunter then
			ZombieHunterButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, zombiehunter ) )
		end
	end )
	ZombieHunterButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zombiehunter", function ( model )
		local zombiehunter = Engine.GetModelValue( model )
		if zombiehunter then
			ZombieHunterButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( zombiehunter, 1 ), CoD.GetVectorComponentFromString( zombiehunter, 2 ), CoD.GetVectorComponentFromString( zombiehunter, 3 ), CoD.GetVectorComponentFromString( zombiehunter, 4 ) )
		end
	end )
	ZombieHunterButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "zombiehunter", function ( model )
		local zombiehunter = Engine.GetModelValue( model )
		if zombiehunter then
			ZombieHunterButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( zombiehunter ) ) )
		end
	end )
	ZombieHunterButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	ZombieHunterButton:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( ZombieHunterButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsElementInState( f12_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "zombiehunter" )
			OpenPopup( self, "Challenges_ZM_Stickerbooks", f12_arg2 )
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
	ZombieHunterButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "zombiehunter" )
			end
		}
	} )
	self:addElement( ZombieHunterButton )
	self.ZombieHunterButton = ZombieHunterButton
	
	local SurvivalistButton = CoD.Challenges_Category_Button.new( menu, controller )
	SurvivalistButton:setLeftRight( false, false, -188, 188 )
	SurvivalistButton:setTopBottom( true, false, 117, 312 )
	SurvivalistButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_zm_survivalist" ) )
	SurvivalistButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	SurvivalistButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SURVIVALIST" ) )
	SurvivalistButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "survivalist", function ( model )
		local survivalist = Engine.GetModelValue( model )
		if survivalist then
			SurvivalistButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, survivalist ) )
		end
	end )
	SurvivalistButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "survivalist", function ( model )
		local survivalist = Engine.GetModelValue( model )
		if survivalist then
			SurvivalistButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( survivalist, 1 ), CoD.GetVectorComponentFromString( survivalist, 2 ), CoD.GetVectorComponentFromString( survivalist, 3 ), CoD.GetVectorComponentFromString( survivalist, 4 ) )
		end
	end )
	SurvivalistButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "survivalist", function ( model )
		local survivalist = Engine.GetModelValue( model )
		if survivalist then
			SurvivalistButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( survivalist ) ) )
		end
	end )
	SurvivalistButton:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	SurvivalistButton:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( SurvivalistButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if not IsElementInState( f20_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "survivalist" )
			OpenPopup( self, "Challenges_ZM_Stickerbooks", f20_arg2 )
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
	SurvivalistButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "survivalist" )
			end
		}
	} )
	self:addElement( SurvivalistButton )
	self.SurvivalistButton = SurvivalistButton
	
	local GumGobblerButton = CoD.Challenges_Category_Button.new( menu, controller )
	GumGobblerButton:setLeftRight( false, true, -384, -9 )
	GumGobblerButton:setTopBottom( true, false, 117, 312 )
	GumGobblerButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_zm_gumgobbler" ) )
	GumGobblerButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GumGobblerButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GUMGOBBLER" ) )
	GumGobblerButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "gumgobbler", function ( model )
		local gumgobbler = Engine.GetModelValue( model )
		if gumgobbler then
			GumGobblerButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, gumgobbler ) )
		end
	end )
	GumGobblerButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "gumgobbler", function ( model )
		local gumgobbler = Engine.GetModelValue( model )
		if gumgobbler then
			GumGobblerButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( gumgobbler, 1 ), CoD.GetVectorComponentFromString( gumgobbler, 2 ), CoD.GetVectorComponentFromString( gumgobbler, 3 ), CoD.GetVectorComponentFromString( gumgobbler, 4 ) )
		end
	end )
	GumGobblerButton:subscribeToGlobalModel( controller, "ChallengesZMCategoryStats", "gumgobbler", function ( model )
		local gumgobbler = Engine.GetModelValue( model )
		if gumgobbler then
			GumGobblerButton.PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( gumgobbler ) ) )
		end
	end )
	GumGobblerButton:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	GumGobblerButton:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	menu:AddButtonCallbackFunction( GumGobblerButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if not IsElementInState( f28_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "gumgobbler" )
			OpenPopup( self, "Challenges_ZM_Stickerbooks", f28_arg2 )
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
	GumGobblerButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "gumgobbler" )
			end
		}
	} )
	self:addElement( GumGobblerButton )
	self.GumGobblerButton = GumGobblerButton
	
	local NearCompletionButton = CoD.Challenges_Summary_NearCompletion_SM.new( menu, controller )
	NearCompletionButton:setLeftRight( true, false, 9, 749 )
	NearCompletionButton:setTopBottom( false, true, -141.5, -61.5 )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "statPercent", function ( model )
		local statPercent = Engine.GetModelValue( model )
		if statPercent then
			NearCompletionButton.NearCompletionWidget.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( statPercent, 1 ), CoD.GetVectorComponentFromString( statPercent, 2 ), CoD.GetVectorComponentFromString( statPercent, 3 ), CoD.GetVectorComponentFromString( statPercent, 4 ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "statFractionText", function ( model )
		local statFractionText = Engine.GetModelValue( model )
		if statFractionText then
			NearCompletionButton.NearCompletionWidget.ProgressFraction:setText( Engine.Localize( statFractionText ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "iconId", function ( model )
		local iconId = Engine.GetModelValue( model )
		if iconId then
			NearCompletionButton.NearCompletionWidget.ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( iconId ) ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			NearCompletionButton.NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( title ) )
		end
	end )
	NearCompletionButton:subscribeToGlobalModel( controller, "ChallengesZMNearCompletion", "description", function ( model )
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
	menu:AddButtonCallbackFunction( NearCompletionButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		if not IsElementInState( f38_arg0, "AllChallengesComplete" ) then
			OpenPopup( self, "Challenges_NearCompletion", f38_arg2 )
			return true
		else
			
		end
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f39_arg0, "AllChallengesComplete" ) then
			return true
		else
			return false
		end
	end, false )
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
	
	local DarkOpsButton = CoD.Challenges_DarkOps_Button.new( menu, controller )
	DarkOpsButton:setLeftRight( false, true, -384, -9 )
	DarkOpsButton:setTopBottom( false, true, -141.5, -14.5 )
	DarkOpsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	DarkOpsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f42_local0 = nil
		if element.gainFocus then
			f42_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f42_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f42_local0
	end )
	DarkOpsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f43_local0 = nil
		if element.loseFocus then
			f43_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f43_local0 = element.super:loseFocus( event )
		end
		return f43_local0
	end )
	menu:AddButtonCallbackFunction( DarkOpsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if not IsElementInState( f44_arg0, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "darkops" )
			OpenPopup( self, "Challenges_ZM_Stickerbooks", f44_arg2 )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ZombieHunterButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.operationsTitle:close()
		element.ZombieHunterButton:close()
		element.SurvivalistButton:close()
		element.GumGobblerButton:close()
		element.NearCompletionButton:close()
		element.DarkOpsButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

