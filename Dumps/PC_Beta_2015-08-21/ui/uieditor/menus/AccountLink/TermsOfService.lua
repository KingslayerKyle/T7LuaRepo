require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.menus.AccountLink.UmbrellaRegister" )

LUI.createMenu.TermsOfService = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TermsOfService" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TermsOfService.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local DialogBackground0 = CoD.DialogBackground.new( self, controller )
	DialogBackground0:setLeftRight( true, false, 64, 1216 )
	DialogBackground0:setTopBottom( true, false, 36, 684 )
	self:addElement( DialogBackground0 )
	self.DialogBackground0 = DialogBackground0
	
	local termsTitle = LUI.UITightText.new()
	termsTitle:setLeftRight( true, false, 446, 834 )
	termsTitle:setTopBottom( true, false, 72.02, 154.02 )
	termsTitle:setText( Engine.Localize( "ACCOUNT_LINK_TERMS" ) )
	termsTitle:setTTF( "fonts/default.ttf" )
	self:addElement( termsTitle )
	self.termsTitle = termsTitle
	
	local confirm = CoD.button.new( self, controller )
	confirm:setLeftRight( true, false, 757, 834 )
	confirm:setTopBottom( true, false, 614.11, 644.11 )
	confirm.buttoninternal0.Text0:setText( Engine.Localize( "MENU_ACCEPT" ) )
	confirm:registerEventHandler( "button_action", function ( element, event )
		local f2_local0 = nil
		GoBackAndOpenOverlayOnParent( self, "UmbrellaRegister", controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( confirm )
	self.confirm = confirm
	
	local button0 = CoD.button.new( self, controller )
	button0:setLeftRight( true, false, 446, 524 )
	button0:setTopBottom( true, false, 614.11, 644.11 )
	button0.buttoninternal0.Text0:setText( Engine.Localize( "MENU_DECLINE" ) )
	button0:registerEventHandler( "button_action", function ( element, event )
		local f3_local0 = nil
		GoBack( self, controller )
		AccountLink_SetAccountLinkViewed( self, element, controller )
		LobbyBeginPlay( self, event )
		PlaySoundSetSound( self, "action" )
		LoadSaveGameData( self, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( button0 )
	self.button0 = button0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 164, 1116 )
	TextBox0:setTopBottom( true, false, 154.02, 179.02 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "TermsOfService", "message", function ( model )
		local message = Engine.GetModelValue( model )
		if message then
			TextBox0:setText( Engine.Localize( message ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DialogBackground0:close()
		element.confirm:close()
		element.button0:close()
		element.TextBox0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TermsOfService.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

