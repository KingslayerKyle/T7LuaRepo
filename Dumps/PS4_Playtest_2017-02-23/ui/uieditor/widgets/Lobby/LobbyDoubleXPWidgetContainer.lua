require( "ui.uieditor.widgets.ZMPromotional.ZM_Promo_DoubleXPWidget" )

CoD.LobbyDoubleXPWidgetContainer = InheritFrom( LUI.UIElement )
CoD.LobbyDoubleXPWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyDoubleXPWidgetContainer )
	self.id = "LobbyDoubleXPWidgetContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 780 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	local ZMPromoDoubleXPWidget = CoD.ZM_Promo_DoubleXPWidget.new( menu, controller )
	ZMPromoDoubleXPWidget:mergeStateConditions( {
		{
			stateName = "VisibleNoLines",
			condition = function ( menu, element, event )
				local f2_local0 = ZMDoubleXPWidgetVisible( controller )
				if f2_local0 then
					if not IsZMDoubleXPWeekend( controller ) then
						f2_local0 = IsGlobalModelValueEqualTo
						local f2_local1 = element
						local f2_local2 = controller
						local f2_local3 = "lobbyRoot.lobbyNav"
						local f2_local4 = LobbyData.GetLobbyMenuByName( "online_zm" )
						f2_local0 = f2_local0( f2_local1, f2_local2, f2_local3, f2_local4.id )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ZMDoubleXPWidgetVisible( controller ) and not IsZMDoubleXPWeekend( controller )
			end
		},
		{
			stateName = "GreyedOut",
			condition = function ( menu, element, event )
				return ZMDoubleXPWidgetVisible( controller ) and IsZMDoubleXPWeekend( controller )
			end
		}
	} )
	ZMPromoDoubleXPWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( ZMPromoDoubleXPWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	ZMPromoDoubleXPWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy.maxPlayers" ), function ( model )
		menu:updateElementState( ZMPromoDoubleXPWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PartyPrivacy.maxPlayers"
		} )
	end )
	ZMPromoDoubleXPWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" ), function ( model )
		menu:updateElementState( ZMPromoDoubleXPWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.gameClient.update"
		} )
	end )
	ZMPromoDoubleXPWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		menu:updateElementState( ZMPromoDoubleXPWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.privateClient.update"
		} )
	end )
	if ZMPromoDoubleXPWidget.m_eventHandlers.controller_inserted then
		local currentEv = ZMPromoDoubleXPWidget.m_eventHandlers.controller_inserted
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_inserted", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if ZMPromoDoubleXPWidget.m_eventHandlers.controller_removed then
		local currentEv = ZMPromoDoubleXPWidget.m_eventHandlers.controller_removed
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_start then
		local currentEv = ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_start
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_start", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_stop then
		local currentEv = ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_stop
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_stop", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_stop", LUI.UIElement.updateState )
	end
	ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 79, 285 )
	ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 603.5, 738.5 )
	ZMPromoDoubleXPWidget:setYRot( 25 )
	self:addElement( ZMPromoDoubleXPWidget )
	self.ZMPromoDoubleXPWidget = ZMPromoDoubleXPWidget
	
	self.resetProperties = function ()
		ZMPromoDoubleXPWidget:completeAnimation()
		ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 79, 285 )
		ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 603.5, 738.5 )
		ZMPromoDoubleXPWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 48, 254 )
				self.ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 603.5, 738.5 )
				self.ZMPromoDoubleXPWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMTheaterLobby = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 75.5, 284.5 )
				self.ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 603.5, 738.5 )
				self.ZMPromoDoubleXPWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMMainLobby = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local ZMPromoDoubleXPWidgetFrame2 = function ( ZMPromoDoubleXPWidget, event )
					local ZMPromoDoubleXPWidgetFrame3 = function ( ZMPromoDoubleXPWidget, event )
						if not event.interrupted then
							ZMPromoDoubleXPWidget:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						end
						ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 75, 281 )
						ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 371.5, 506.5 )
						ZMPromoDoubleXPWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZMPromoDoubleXPWidget, event )
						else
							ZMPromoDoubleXPWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZMPromoDoubleXPWidgetFrame3( ZMPromoDoubleXPWidget, event )
						return 
					else
						ZMPromoDoubleXPWidget:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZMPromoDoubleXPWidget:registerEventHandler( "transition_complete_keyframe", ZMPromoDoubleXPWidgetFrame3 )
					end
				end
				
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 75, 281 )
				self.ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 371.5, 506.5 )
				self.ZMPromoDoubleXPWidget:setAlpha( 0 )
				ZMPromoDoubleXPWidgetFrame2( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMPrivateLobby = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 75, 281 )
				self.ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 557.5, 692.5 )
				self.clipFinished( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMPublicLobby = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( 0, 0, 75, 281 )
				self.ZMPromoDoubleXPWidget:setTopBottom( 0, 0, 527.5, 662.5 )
				self.clipFinished( ZMPromoDoubleXPWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ZMTheaterLobby",
			condition = function ( menu, element, event )
				return IsZombies() and IsInTheaterMode()
			end
		},
		{
			stateName = "ZMMainLobby",
			condition = function ( menu, element, event )
				local f22_local0 = IsZombies()
				if f22_local0 then
					if not IsCustomLobby() then
						f22_local0 = not IsPublicLobby()
					else
						f22_local0 = false
					end
				end
				return f22_local0
			end
		},
		{
			stateName = "ZMPrivateLobby",
			condition = function ( menu, element, event )
				return IsZombies() and IsCustomLobby()
			end
		},
		{
			stateName = "ZMPublicLobby",
			condition = function ( menu, element, event )
				return IsZombies() and IsPublicLobby()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ZMPromoDoubleXPWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

