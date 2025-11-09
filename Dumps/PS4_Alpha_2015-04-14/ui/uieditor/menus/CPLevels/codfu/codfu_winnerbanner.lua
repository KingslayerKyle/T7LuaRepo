LUI.createMenu.codfu_winnerbanner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_winnerbanner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Winner = LUI.UIText.new()
	Winner:setLeftRight( true, false, 458, 822 )
	Winner:setTopBottom( true, false, 320, 400 )
	Winner:setRGB( 1, 1, 1 )
	Winner:setText( Engine.Localize( "MENU_WINNER" ) )
	Winner:setTTF( "fonts/GatewayA2.ttf" )
	Winner:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Winner:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Winner )
	self.Winner = Winner
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowWinnerBanner = function ()
				self:setupElementClipCounter( 1 )
				local WinnerFrame2 = function ( Winner, event )
					if not event.interrupted then
						Winner:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Winner:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Winner, event )
					else
						Winner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Winner:completeAnimation()
				self.Winner:setAlpha( 0 )
				WinnerFrame2( Winner, {} )
			end,
			HideWinnerBanner = function ()
				self:setupElementClipCounter( 1 )
				local WinnerFrame2 = function ( Winner, event )
					if not event.interrupted then
						Winner:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Winner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Winner, event )
					else
						Winner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Winner:completeAnimation()
				self.Winner:setAlpha( 1 )
				WinnerFrame2( Winner, {} )
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

