LUI.createMenu.codfu_roundbanner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_roundbanner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Round = LUI.UIText.new()
	Round:setLeftRight( true, false, 458, 822 )
	Round:setTopBottom( true, false, 320, 400 )
	Round:setRGB( 1, 1, 1 )
	Round:setText( Engine.Localize( "MENU_ROUND" ) )
	Round:setTTF( "fonts/GatewayA2.ttf" )
	Round:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Round:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Round )
	self.Round = Round
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowBanner = function ()
				self:setupElementClipCounter( 1 )
				local RoundFrame2 = function ( Round, event )
					if not event.interrupted then
						Round:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Round:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Round, event )
					else
						Round:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Round:completeAnimation()
				self.Round:setAlpha( 0 )
				RoundFrame2( Round, {} )
			end,
			HideBanner = function ()
				self:setupElementClipCounter( 1 )
				local RoundFrame2 = function ( Round, event )
					if not event.interrupted then
						Round:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Round:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Round, event )
					else
						Round:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Round:completeAnimation()
				self.Round:setAlpha( 1 )
				RoundFrame2( Round, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local controller = event.controller or controller
		local retVal = nil
		LockInput( self, controller, false )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		controller = controller,
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

