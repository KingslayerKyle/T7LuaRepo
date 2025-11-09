LUI.createMenu.codfu_drawbanner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_drawbanner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Draw = LUI.UIText.new()
	Draw:setLeftRight( true, false, 458, 822 )
	Draw:setTopBottom( true, false, 320, 400 )
	Draw:setRGB( 1, 1, 1 )
	Draw:setText( Engine.Localize( "MENU_DRAW" ) )
	Draw:setTTF( "fonts/GatewayA2.ttf" )
	Draw:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Draw:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Draw )
	self.Draw = Draw
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowDrawBanner = function ()
				self:setupElementClipCounter( 1 )
				local DrawFrame2 = function ( Draw, event )
					if not event.interrupted then
						Draw:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Draw:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Draw, event )
					else
						Draw:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Draw:completeAnimation()
				self.Draw:setAlpha( 0 )
				DrawFrame2( Draw, {} )
			end,
			HideDrawBanner = function ()
				self:setupElementClipCounter( 1 )
				local DrawFrame2 = function ( Draw, event )
					if not event.interrupted then
						Draw:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Draw:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Draw, event )
					else
						Draw:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Draw:completeAnimation()
				self.Draw:setAlpha( 1 )
				DrawFrame2( Draw, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( element, event )
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
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

