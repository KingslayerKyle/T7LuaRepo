require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.Lobby.Common.PartyPrivacySelector" )

LUI.createMenu.PartyPrivacyPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PartyPrivacyPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( true, false, -10, 1310 )
	overlayBg:setTopBottom( true, false, -19.5, 739.5 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0.5 )
	overlayBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local LobbyMemberBackingMask = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask:setLeftRight( false, false, -206, 206 )
	LobbyMemberBackingMask:setTopBottom( false, false, -113, 117.5 )
	LobbyMemberBackingMask:setRGB( 0.24, 0.29, 0.33 )
	self:addElement( LobbyMemberBackingMask )
	self.LobbyMemberBackingMask = LobbyMemberBackingMask
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, 434, -434 )
	LobbyMemberBackingMask0:setTopBottom( false, false, -113, 118 )
	LobbyMemberBackingMask0:setRGB( 0.27, 0.33, 0.39 )
	LobbyMemberBackingMask0:setAlpha( 0.59 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local PromptBack = CoD.buttonprompt_small.new( self, controller )
	PromptBack:setLeftRight( true, false, 552, 766 )
	PromptBack:setTopBottom( true, false, 478, 509 )
	PromptBack:setRGB( 1, 1, 1 )
	PromptBack.label:setText( Engine.Localize( "MENU_CANCEL" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptBack.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( true, false, 454, 668 )
	PromptSelect:setTopBottom( true, false, 478, 509 )
	PromptSelect:setRGB( 1, 1, 1 )
	PromptSelect.label:setText( Engine.Localize( "MENU_ACCEPT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local MaxPlayersSelector = CoD.PartyPrivacySelector.new( self, controller )
	MaxPlayersSelector:setLeftRight( true, false, 606, 716 )
	MaxPlayersSelector:setTopBottom( true, false, 390.5, 415.5 )
	MaxPlayersSelector:setRGB( 1, 1, 1 )
	MaxPlayersSelector:subscribeToGlobalModel( controller, "PartyPrivacy", "maxPlayers", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MaxPlayersSelector.PartyPrivacy:setText( Engine.Localize( modelValue ) )
		end
	end )
	MaxPlayersSelector.buttonPromptAddFunctions = {}
	MaxPlayersSelector.buttonPromptAddFunctions.left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	MaxPlayersSelector.buttonPromptAddFunctions.right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	MaxPlayersSelector:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "left" or event.button == "key_shortcut" and event.key == "LEFTARROW") and element:isInFocus() then
			LobbyPartyPrivacyMaxPlayers( self, element, controller, "left", self )
			return true
		elseif not self.occludedBy and (event.button == "right" or event.button == "key_shortcut" and event.key == "RIGHTARROW") and element:isInFocus() then
			LobbyPartyPrivacyMaxPlayers( self, element, controller, "right", self )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MaxPlayersSelector:registerEventHandler( "on_client_added", function ( element, event )
		local retVal = nil
		LobbyPartyPrivacyMaxPlayersOnClientAdded( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MaxPlayersSelector:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.left( self, element, event )
		element.buttonPromptAddFunctions.right( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	MaxPlayersSelector:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		self:removeButtonPrompt( "left", element )
		self:removeButtonPrompt( "right", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MaxPlayersSelector:mergeStateConditions( {
		{
			stateName = "LeftArrowDisabled",
			condition = function ( menu, element, event )
				return IsPlayerLimitAtMin()
			end
		},
		{
			stateName = "RightArrowDisabled",
			condition = function ( menu, element, event )
				return IsPlayerLimitAtMax()
			end
		}
	} )
	if MaxPlayersSelector.m_eventHandlers.on_client_removed then
		local currentEv = MaxPlayersSelector.m_eventHandlers.on_client_removed
		MaxPlayersSelector:registerEventHandler( "on_client_removed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		MaxPlayersSelector:registerEventHandler( "on_client_removed", LUI.UIElement.updateState )
	end
	MaxPlayersSelector:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy.maxPlayers" ), function ( model )
		self:updateElementState( MaxPlayersSelector, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PartyPrivacy.maxPlayers"
		} )
	end )
	self:addElement( MaxPlayersSelector )
	self.MaxPlayersSelector = MaxPlayersSelector
	
	local currentEv = LUI.UITightText.new()
	currentEv:setLeftRight( true, false, 468, 593 )
	currentEv:setTopBottom( true, false, 390.5, 415.5 )
	currentEv:setRGB( 0.87, 0.88, 0.78 )
	currentEv:setText( Engine.Localize( "MENU_PLAYER_LIMIT_CAPS" ) )
	currentEv:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( currentEv )
	self.MaxPlayersText = currentEv
	
	local PartyPrivacySelector = CoD.PartyPrivacySelector.new( self, controller )
	PartyPrivacySelector:setLeftRight( true, false, 606, 837 )
	PartyPrivacySelector:setTopBottom( true, false, 347.5, 374.75 )
	PartyPrivacySelector:setRGB( 1, 1, 1 )
	PartyPrivacySelector:subscribeToGlobalModel( controller, "PartyPrivacy", "privacy", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PartyPrivacySelector.PartyPrivacy:setText( Engine.Localize( PartyPrivacyCaps( modelValue ) ) )
		end
	end )
	PartyPrivacySelector.buttonPromptAddFunctions = {}
	PartyPrivacySelector.buttonPromptAddFunctions.left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	PartyPrivacySelector.buttonPromptAddFunctions.right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	PartyPrivacySelector:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "left" or event.button == "key_shortcut" and event.key == "LEFTARROW") and element:isInFocus() then
			LobbyPartyPrivacy( self, element, controller, "left", self )
			return true
		elseif not self.occludedBy and (event.button == "right" or event.button == "key_shortcut" and event.key == "RIGHTARROW") and element:isInFocus() then
			LobbyPartyPrivacy( self, element, controller, "right", self )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	PartyPrivacySelector:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.left( self, element, event )
		element.buttonPromptAddFunctions.right( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	PartyPrivacySelector:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		self:removeButtonPrompt( "left", element )
		self:removeButtonPrompt( "right", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( PartyPrivacySelector )
	self.PartyPrivacySelector = PartyPrivacySelector
	
	local PartyPrivacyText = LUI.UITightText.new()
	PartyPrivacyText:setLeftRight( true, false, 468, 602 )
	PartyPrivacyText:setTopBottom( true, false, 349.75, 374.75 )
	PartyPrivacyText:setRGB( 0.87, 0.88, 0.78 )
	PartyPrivacyText:setText( Engine.Localize( "MPUI_LOBBY_PRIVACY_CAPS" ) )
	PartyPrivacyText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( PartyPrivacyText )
	self.PartyPrivacyText = PartyPrivacyText
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( true, true, 459, -459 )
	txtDescription:setTopBottom( false, false, -51, -33 )
	txtDescription:setRGB( 1, 1, 1 )
	txtDescription:setAlpha( 0 )
	txtDescription:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtDescription:subscribeToGlobalModel( controller, "LobbyPromptTitle", "lobbyPromptDescription", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	local TitleLbl = LUI.UITightText.new()
	TitleLbl:setLeftRight( true, false, 454, 704 )
	TitleLbl:setTopBottom( true, false, 266, 309 )
	TitleLbl:setRGB( 0.87, 0.88, 0.78 )
	TitleLbl:setText( Engine.Localize( "MPUI_LOBBY_PRIVACY_CAPS" ) )
	TitleLbl:setTTF( "fonts/escom.ttf" )
	self:addElement( TitleLbl )
	self.TitleLbl = TitleLbl
	
	MaxPlayersSelector.navigation = {
		up = PartyPrivacySelector
	}
	PartyPrivacySelector.navigation = {
		down = MaxPlayersSelector
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			LobbyPartyPrivacySave( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MaxPlayersSelector.id = "MaxPlayersSelector"
	PartyPrivacySelector.id = "PartyPrivacySelector"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.PartyPrivacySelector:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.LobbyMemberBackingMask:close()
		self.LobbyMemberBackingMask0:close()
		self.PromptBack:close()
		self.PromptSelect:close()
		self.MaxPlayersSelector:close()
		self.PartyPrivacySelector:close()
		self.txtDescription:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

