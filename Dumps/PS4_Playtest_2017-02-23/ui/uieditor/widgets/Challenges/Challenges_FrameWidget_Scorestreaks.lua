require( "ui.uieditor.menus.Challenges.Challenges_Scorestreaks" )
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
		if challengeCategory == "airassault" then
			focusButton = self.AirAssaultButton
		elseif challengeCategory == "groundassault" then
			focusButton = self.GroundAssaultButton
		elseif challengeCategory == "support" then
			focusButton = self.SupportButton
		elseif challengeCategory == "returnfire" then
			focusButton = self.ReturnFireButton
		end
		if focusButton then
			focusButton:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
	end )
end

CoD.Challenges_FrameWidget_Scorestreaks = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_Scorestreaks.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_Scorestreaks )
	self.id = "Challenges_FrameWidget_Scorestreaks"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local operationsTitle = CoD.Challenges_Category_Title.new( menu, controller )
	operationsTitle:setLeftRight( 0, 1, 76, -132 )
	operationsTitle:setTopBottom( 0, 0, 44.5, 119.5 )
	operationsTitle.titleText:setText( Engine.Localize( "MENU_SCORESTREAKS_CAPS" ) )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	operationsTitle:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			operationsTitle.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( operationsTitle )
	self.operationsTitle = operationsTitle
	
	local AirAssaultButton = CoD.Challenges_Category_Button.new( menu, controller )
	AirAssaultButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "airassault" )
			end
		}
	} )
	AirAssaultButton:setLeftRight( 0, 0, 14, 578 )
	AirAssaultButton:setTopBottom( 0, 0, 176, 468 )
	AirAssaultButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_air" ) )
	AirAssaultButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	AirAssaultButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_AIR" ) )
	AirAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "airassault", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AirAssaultButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	AirAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "airassault", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AirAssaultButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	AirAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "airassault", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AirAssaultButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	AirAssaultButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	AirAssaultButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( AirAssaultButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "airassault" )
			OpenPopup( self, "Challenges_Scorestreaks", controller, "", "" )
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
	self:addElement( AirAssaultButton )
	self.AirAssaultButton = AirAssaultButton
	
	local GroundAssaultButton = CoD.Challenges_Category_Button.new( menu, controller )
	GroundAssaultButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "groundassault" )
			end
		}
	} )
	GroundAssaultButton:setLeftRight( 0.5, 0.5, -282, 282 )
	GroundAssaultButton:setTopBottom( 0, 0, 176, 468 )
	GroundAssaultButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_ground" ) )
	GroundAssaultButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	GroundAssaultButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_GROUND" ) )
	GroundAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "groundassault", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroundAssaultButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	GroundAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "groundassault", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroundAssaultButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	GroundAssaultButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "groundassault", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroundAssaultButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	GroundAssaultButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	GroundAssaultButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( GroundAssaultButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "groundassault" )
			OpenPopup( self, "Challenges_Scorestreaks", controller, "", "" )
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
	self:addElement( GroundAssaultButton )
	self.GroundAssaultButton = GroundAssaultButton
	
	local SupportButton = CoD.Challenges_Category_Button.new( menu, controller )
	SupportButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "support" )
			end
		}
	} )
	SupportButton:setLeftRight( 1, 1, -576, -14 )
	SupportButton:setTopBottom( 0, 0, 176, 468 )
	SupportButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_support" ) )
	SupportButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	SupportButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_SUPPORT" ) )
	SupportButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "support", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SupportButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	SupportButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "support", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SupportButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	SupportButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "support", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SupportButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	SupportButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	SupportButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( SupportButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "support" )
			OpenPopup( self, "Challenges_Scorestreaks", controller, "", "" )
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
	self:addElement( SupportButton )
	self.SupportButton = SupportButton
	
	local ReturnFireButton = CoD.Challenges_Category_Button.new( menu, controller )
	ReturnFireButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Challenges_IsCategoryLocked( element, controller, "returnfire" )
			end
		}
	} )
	ReturnFireButton:setLeftRight( 0, 0, 14, 578 )
	ReturnFireButton:setTopBottom( 1, 1, -300, -8 )
	ReturnFireButton.CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_returnfire" ) )
	ReturnFireButton.UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	ReturnFireButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_RETURNFIRE" ) )
	ReturnFireButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "returnfire", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ReturnFireButton.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	ReturnFireButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "returnfire", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ReturnFireButton.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	ReturnFireButton:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "returnfire", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ReturnFireButton.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	ReturnFireButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ReturnFireButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ReturnFireButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			SetGlobalModelValue( "challengeCategory", "returnfire" )
			OpenPopup( self, "Challenges_Scorestreaks", controller, "", "" )
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
	self:addElement( ReturnFireButton )
	self.ReturnFireButton = ReturnFireButton
	
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
	
	AirAssaultButton.navigation = {
		right = GroundAssaultButton,
		down = ReturnFireButton
	}
	GroundAssaultButton.navigation = {
		left = AirAssaultButton,
		right = SupportButton
	}
	SupportButton.navigation = {
		left = GroundAssaultButton
	}
	ReturnFireButton.navigation = {
		up = AirAssaultButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	AirAssaultButton.id = "AirAssaultButton"
	GroundAssaultButton.id = "GroundAssaultButton"
	SupportButton.id = "SupportButton"
	ReturnFireButton.id = "ReturnFireButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.AirAssaultButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.operationsTitle:close()
		self.AirAssaultButton:close()
		self.GroundAssaultButton:close()
		self.SupportButton:close()
		self.ReturnFireButton:close()
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

