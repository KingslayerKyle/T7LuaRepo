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
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	local ZMPromoDoubleXPWidget = CoD.ZM_Promo_DoubleXPWidget.new( menu, controller )
	ZMPromoDoubleXPWidget:setLeftRight( true, false, 52.55, 189.55 )
	ZMPromoDoubleXPWidget:setTopBottom( true, false, 402.51, 492.51 )
	ZMPromoDoubleXPWidget:setYRot( 25 )
	ZMPromoDoubleXPWidget:mergeStateConditions( {
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
		local f1_local2 = ZMPromoDoubleXPWidget.m_eventHandlers.controller_inserted
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_inserted", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local2( element, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if ZMPromoDoubleXPWidget.m_eventHandlers.controller_removed then
		local f1_local2 = ZMPromoDoubleXPWidget.m_eventHandlers.controller_removed
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_removed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local2( element, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_start then
		local f1_local2 = ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_start
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_start", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local2( element, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_stop then
		local f1_local2 = ZMPromoDoubleXPWidget.m_eventHandlers.controller_used_stop
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_stop", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local2( element, event )
		end )
	else
		ZMPromoDoubleXPWidget:registerEventHandler( "controller_used_stop", LUI.UIElement.updateState )
	end
	self:addElement( ZMPromoDoubleXPWidget )
	self.ZMPromoDoubleXPWidget = ZMPromoDoubleXPWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( true, false, 32, 169 )
				self.ZMPromoDoubleXPWidget:setTopBottom( true, false, 402.51, 492.51 )
				self.ZMPromoDoubleXPWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMTheaterLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( true, false, 50, 189.55 )
				self.ZMPromoDoubleXPWidget:setTopBottom( true, false, 402.51, 492.51 )
				self.ZMPromoDoubleXPWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMMainLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ZMPromoDoubleXPWidgetFrame2 = function ( ZMPromoDoubleXPWidget, event )
					local ZMPromoDoubleXPWidgetFrame3 = function ( ZMPromoDoubleXPWidget, event )
						if not event.interrupted then
							ZMPromoDoubleXPWidget:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						end
						ZMPromoDoubleXPWidget:setLeftRight( true, false, 50, 187 )
						ZMPromoDoubleXPWidget:setTopBottom( true, false, 438.51, 528.51 )
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
				self.ZMPromoDoubleXPWidget:setLeftRight( true, false, 50, 187 )
				self.ZMPromoDoubleXPWidget:setTopBottom( true, false, 438.51, 528.51 )
				self.ZMPromoDoubleXPWidget:setAlpha( 0 )
				ZMPromoDoubleXPWidgetFrame2( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMPrivateLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( true, false, 50, 187 )
				self.ZMPromoDoubleXPWidget:setTopBottom( true, false, 371.51, 461.51 )
				self.ZMPromoDoubleXPWidget:setAlpha( 1 )
				self.clipFinished( ZMPromoDoubleXPWidget, {} )
			end
		},
		ZMPublicLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoDoubleXPWidget:completeAnimation()
				self.ZMPromoDoubleXPWidget:setLeftRight( true, false, 50, 187 )
				self.ZMPromoDoubleXPWidget:setTopBottom( true, false, 351.51, 441.51 )
				self.ZMPromoDoubleXPWidget:setAlpha( 1 )
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
				local f20_local0 = IsZombies()
				if f20_local0 then
					if not IsCustomLobby() then
						f20_local0 = not IsPublicLobby()
					else
						f20_local0 = false
					end
				end
				return f20_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMPromoDoubleXPWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

