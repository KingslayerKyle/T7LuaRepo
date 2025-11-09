require( "ui.uieditor.widgets.ZMPromotional.ZM_PromoIconList" )

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
	
	local ZMPromoIconList = CoD.ZM_PromoIconList.new( menu, controller )
	ZMPromoIconList:setLeftRight( true, false, 58, 260 )
	ZMPromoIconList:setTopBottom( true, false, 420.01, 475.01 )
	ZMPromoIconList:setYRot( 25 )
	self:addElement( ZMPromoIconList )
	self.ZMPromoIconList = ZMPromoIconList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoIconList:completeAnimation()
				self.ZMPromoIconList:setAlpha( 0 )
				self.clipFinished( ZMPromoIconList, {} )
			end
		},
		ZMTheaterLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoIconList:completeAnimation()
				self.ZMPromoIconList:setAlpha( 0 )
				self.clipFinished( ZMPromoIconList, {} )
			end
		},
		ZMMainLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ZMPromoIconListFrame2 = function ( ZMPromoIconList, event )
					local ZMPromoIconListFrame3 = function ( ZMPromoIconList, event )
						if not event.interrupted then
							ZMPromoIconList:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						end
						ZMPromoIconList:setLeftRight( true, false, 58, 260 )
						ZMPromoIconList:setTopBottom( true, false, 265.01, 320.01 )
						ZMPromoIconList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZMPromoIconList, event )
						else
							ZMPromoIconList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZMPromoIconListFrame3( ZMPromoIconList, event )
						return 
					else
						ZMPromoIconList:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ZMPromoIconList:registerEventHandler( "transition_complete_keyframe", ZMPromoIconListFrame3 )
					end
				end
				
				ZMPromoIconList:completeAnimation()
				self.ZMPromoIconList:setLeftRight( true, false, 58, 260 )
				self.ZMPromoIconList:setTopBottom( true, false, 265.01, 320.01 )
				self.ZMPromoIconList:setAlpha( 0 )
				ZMPromoIconListFrame2( ZMPromoIconList, {} )
			end
		},
		ZMPrivateLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoIconList:completeAnimation()
				self.ZMPromoIconList:setLeftRight( true, false, 58, 260 )
				self.ZMPromoIconList:setTopBottom( true, false, 405.01, 460.01 )
				self.ZMPromoIconList:setScale( 0.8 )
				self.clipFinished( ZMPromoIconList, {} )
			end
		},
		ZMPublicLobby = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromoIconList:completeAnimation()
				self.ZMPromoIconList:setLeftRight( true, false, 58, 260 )
				self.ZMPromoIconList:setTopBottom( true, false, 369.01, 424.01 )
				self.clipFinished( ZMPromoIconList, {} )
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
				local f10_local0 = IsZombies()
				if f10_local0 then
					if not IsCustomLobby() then
						f10_local0 = not IsPublicLobby()
					else
						f10_local0 = false
					end
				end
				return f10_local0
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
		element.ZMPromoIconList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

