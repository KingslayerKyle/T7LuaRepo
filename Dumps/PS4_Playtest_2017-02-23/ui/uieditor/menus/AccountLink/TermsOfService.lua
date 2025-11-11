require( "ui.uieditor.menus.AccountLink.UmbrellaRegister" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )

LUI.createMenu.TermsOfService = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TermsOfService" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TermsOfService.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local DialogBackground0 = CoD.DialogBackground.new( self, controller )
	DialogBackground0:setLeftRight( 0, 0, 96, 1824 )
	DialogBackground0:setTopBottom( 0, 0, 54, 1026 )
	self:addElement( DialogBackground0 )
	self.DialogBackground0 = DialogBackground0
	
	local termsTitle = LUI.UITightText.new()
	termsTitle:setLeftRight( 0, 0, 669, 1251 )
	termsTitle:setTopBottom( 0, 0, 108, 231 )
	termsTitle:setText( Engine.Localize( "ACCOUNT_LINK_TERMS" ) )
	termsTitle:setTTF( "fonts/default.ttf" )
	self:addElement( termsTitle )
	self.termsTitle = termsTitle
	
	local confirm = CoD.button.new( self, controller )
	confirm:setLeftRight( 0, 0, 1135, 1251 )
	confirm:setTopBottom( 0, 0, 921.5, 966.5 )
	confirm.buttoninternal0.Text0:setText( Engine.Localize( "MENU_ACCEPT" ) )
	confirm:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	confirm:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( confirm, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBackAndOpenOverlayOnParent( self, "UmbrellaRegister", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( confirm )
	self.confirm = confirm
	
	local button0 = CoD.button.new( self, controller )
	button0:setLeftRight( 0, 0, 669, 786 )
	button0:setTopBottom( 0, 0, 921.5, 966.5 )
	button0.buttoninternal0.Text0:setText( Engine.Localize( "MENU_DECLINE" ) )
	button0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	button0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( button0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		AccountLink_SetAccountLinkViewed( self, element, controller )
		LobbyBeginPlay( self, controller )
		PlaySoundSetSound( self, "action" )
		LoadSaveGameData( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( button0 )
	self.button0 = button0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 246, 1674 )
	TextBox0:setTopBottom( 0, 0, 231, 268 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "TermsOfService", "message", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	confirm.navigation = {
		left = button0
	}
	button0.navigation = {
		right = confirm
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	confirm.id = "confirm"
	button0.id = "button0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.confirm:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DialogBackground0:close()
		self.confirm:close()
		self.button0:close()
		self.TextBox0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TermsOfService.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

