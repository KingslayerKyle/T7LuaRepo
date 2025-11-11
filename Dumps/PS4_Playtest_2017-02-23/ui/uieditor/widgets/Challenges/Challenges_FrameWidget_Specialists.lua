require( "ui.uieditor.menus.Challenges.Challenges_Specialists" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Button" )
require( "ui.uieditor.widgets.Challenges.Challenges_Category_Title" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
		if challengeCategory == "weapons" then
			focusButton = self.WeaponsButton
		elseif challengeCategory == "abilities" then
			focusButton = self.AbilitiesButton
		elseif challengeCategory == "killjoys" then
			focusButton = self.KilljoysButton
		end
		if focusButton then
			focusButton:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
	end )
end

CoD.Challenges_FrameWidget_Specialists = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_Specialists.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_Specialists )
	self.id = "Challenges_FrameWidget_Specialists"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( 0, 1, 76, -132 )
	operationsTitle:setTopBottom( 0, 0, 44.5, 119.5 )
	operationsTitle.titleText:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local WeaponsButton = CoD.Challenges_Category_Button.new( menu, controller )
	WeaponsButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "weapons" )
			end
		}
	} )
	WeaponsButton:setLeftRight( 0, 0, 14, 578 )
	WeaponsButton:setTopBottom( 0, 0, 176, 468 )
	WeaponsButton.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_weapons" ) )
	WeaponsButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	WeaponsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALISTWEAPONS" ) )
	WeaponsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "weapons", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponsButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	WeaponsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "weapons", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponsButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	WeaponsButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "weapons", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponsButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	WeaponsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	WeaponsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( WeaponsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "weapons" )
			OpenPopup( self, "Challenges_Specialists", controller, "", "" )
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
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local AbilitiesButton = CoD.Challenges_Category_Button.new( menu, controller )
	AbilitiesButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "abilities" )
			end
		}
	} )
	AbilitiesButton:setLeftRight( 0.5, 0.5, -282, 282 )
	AbilitiesButton:setTopBottom( 0, 0, 176, 468 )
	AbilitiesButton.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_abilities" ) )
	AbilitiesButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	AbilitiesButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALISTABILITIES" ) )
	AbilitiesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "abilities", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilitiesButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	AbilitiesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "abilities", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilitiesButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	AbilitiesButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "abilities", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilitiesButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	AbilitiesButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	AbilitiesButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( AbilitiesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "abilities" )
			OpenPopup( self, "Challenges_Specialists", controller, "", "" )
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
	self:addElement( AbilitiesButton )
	self.AbilitiesButton = AbilitiesButton
	
	local KilljoysButton = CoD.Challenges_Category_Button.new( menu, controller )
	KilljoysButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "killjoys" )
			end
		}
	} )
	KilljoysButton:setLeftRight( 1, 1, -576, -14 )
	KilljoysButton:setTopBottom( 0, 0, 176, 468 )
	KilljoysButton.CategoryIcon:setImage( RegisterImage( "t7_icons_challenges_mp_killjoys" ) )
	KilljoysButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	KilljoysButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALISTKILLJOYS" ) )
	KilljoysButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killjoys", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KilljoysButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	KilljoysButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killjoys", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KilljoysButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	KilljoysButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "killjoys", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KilljoysButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	KilljoysButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	KilljoysButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( KilljoysButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "killjoys" )
			OpenPopup( self, "Challenges_Specialists", controller, "", "" )
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
	self:addElement( KilljoysButton )
	self.KilljoysButton = KilljoysButton
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 588, -588 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 480, -8 )
	StartMenuframenoBG0:setAlpha( 0.25 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 1, 1164, -12 )
	StartMenuframenoBG00:setTopBottom( 0, 1, 480, -8 )
	StartMenuframenoBG00:setAlpha( 0.25 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local StartMenuframenoBG01 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG01:setLeftRight( 0, 1, 14, -1162 )
	StartMenuframenoBG01:setTopBottom( 0, 1, 480, -8 )
	StartMenuframenoBG01:setAlpha( 0.25 )
	self:addElement( StartMenuframenoBG01 )
	self.StartMenuframenoBG01 = StartMenuframenoBG01
	
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
	Pixel200101:setTopBottom( 0, 0, 460, 466 )
	Pixel200101:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200101 )
	self.Pixel200101 = Pixel200101
	
	local Pixel2001001 = LUI.UIImage.new()
	Pixel2001001:setLeftRight( 0, 0, 1732, 1786 )
	Pixel2001001:setTopBottom( 0, 0, 480, 486 )
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
	
	WeaponsButton.navigation = {
		right = AbilitiesButton
	}
	AbilitiesButton.navigation = {
		left = WeaponsButton,
		right = KilljoysButton
	}
	KilljoysButton.navigation = {
		left = AbilitiesButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	WeaponsButton.id = "WeaponsButton"
	AbilitiesButton.id = "AbilitiesButton"
	KilljoysButton.id = "KilljoysButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.WeaponsButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.operationsTitle:close()
		self.WeaponsButton:close()
		self.AbilitiesButton:close()
		self.KilljoysButton:close()
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG00:close()
		self.StartMenuframenoBG01:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

