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
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 27 )
	
	local StringA = LUI.UITightText.new()
	StringA:setLeftRight( true, false, 65, 376.33 )
	StringA:setTopBottom( false, true, -24.5, -4.5 )
	StringA:setRGB( 0.87, 0.9, 0.9 )
	StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	StringA:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StringA:setLetterSpacing( 0.5 )
	self:addElement( StringA )
	self.StringA = StringA
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -84, -56 )
	Image3:setTopBottom( false, true, -4.5, -0.5 )
	Image3:setYRot( -180 )
	Image3:setZoom( 5 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StringA:completeAnimation()
				self.StringA:setAlpha( 0 )
				self.clipFinished( StringA, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
			end
		},
		AddControllerState_Play = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StringA:completeAnimation()
				self.StringA:setAlpha( 1 )
				self.StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLAY" ) )
				self.clipFinished( StringA, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				self.clipFinished( Image3, {} )
			end
		},
		AddControllerState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StringA:completeAnimation()
				self.StringA:setAlpha( 1 )
				self.StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
				self.clipFinished( StringA, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				self.clipFinished( Image3, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AddControllerState_Play",
			condition = function ( menu, element, event )
				return IsWaitingForSignInToPlaySplitscreen() and ShouldShowAddController( menu, element, controller )
			end
		},
		{
			stateName = "AddControllerState",
			condition = function ( menu, element, event )
				return ShouldShowAddController( menu, element, controller )
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
		local f1_local3 = self.m_eventHandlers.controller_inserted
		self:registerEventHandler( "controller_inserted", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local3( self, event )
		end )
	else
		self:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_removed then
		local f1_local3 = self.m_eventHandlers.controller_removed
		self:registerEventHandler( "controller_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local3( self, event )
		end )
	else
		self:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_start then
		local f1_local3 = self.m_eventHandlers.controller_used_start
		self:registerEventHandler( "controller_used_start", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local3( self, event )
		end )
	else
		self:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_stop then
		local f1_local3 = self.m_eventHandlers.controller_used_stop
		self:registerEventHandler( "controller_used_stop", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local3( self, event )
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

