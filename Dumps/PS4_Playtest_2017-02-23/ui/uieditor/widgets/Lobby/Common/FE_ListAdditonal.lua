CoD.FE_ListAdditonal = InheritFrom( LUI.UIElement )
CoD.FE_ListAdditonal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListAdditonal )
	self.id = "FE_ListAdditonal"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 40 )
	
	local StringA = LUI.UITightText.new()
	StringA:setLeftRight( 0, 0, 98, 565 )
	StringA:setTopBottom( 1, 1, -37, -7 )
	StringA:setRGB( 0.87, 0.9, 0.9 )
	StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	StringA:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StringA:setLetterSpacing( 0.5 )
	self:addElement( StringA )
	self.StringA = StringA
	
	self.resetProperties = function ()
		StringA:completeAnimation()
		StringA:setAlpha( 1 )
		StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StringA:completeAnimation()
				self.StringA:setAlpha( 0 )
				self.clipFinished( StringA, {} )
			end
		},
		AddControllerState_Play = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StringA:completeAnimation()
				self.StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLAY" ) )
				self.clipFinished( StringA, {} )
			end
		},
		AddControllerState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AddControllerState_Play",
			condition = function ( menu, element, event )
				return IsWaitingForSignInToPlaySplitscreen() and CoD.LobbyUtility.SplitscreenControllersAllowed()
			end
		},
		{
			stateName = "AddControllerState",
			condition = function ( menu, element, event )
				return CoD.LobbyUtility.SplitscreenControllersAllowed()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.platformUpdate"
		} )
	end )
	if self.m_eventHandlers.controller_inserted then
		local currentEv = self.m_eventHandlers.controller_inserted
		self:registerEventHandler( "controller_inserted", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_removed then
		local currentEv = self.m_eventHandlers.controller_removed
		self:registerEventHandler( "controller_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_start then
		local currentEv = self.m_eventHandlers.controller_used_start
		self:registerEventHandler( "controller_used_start", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_stop then
		local currentEv = self.m_eventHandlers.controller_used_stop
		self:registerEventHandler( "controller_used_stop", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_used_stop", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy.maxPlayers" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PartyPrivacy.maxPlayers"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.gameClient.update"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.privateClient.update"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

