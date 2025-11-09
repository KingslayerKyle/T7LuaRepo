local PostLoadFunc = function ( self )
	local oldClose = self.close
	self.close = function ( self )
		self:playClip( "Close" )
		self:registerEventHandler( "clip_over", oldClose )
	end
	
end

LUI.createMenu.FadeToBlack = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FadeToBlack" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, false, 0, 1280 )
	Fullscreen:setTopBottom( true, false, 0, 720 )
	Fullscreen:setRGB( 1, 1, 1 )
	Fullscreen:setAlpha( 0 )
	Fullscreen:setImage( RegisterImage( "uie_default_black_0" ) )
	Fullscreen:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local FullscreenFrame2 = function ( Fullscreen, event )
					if not event.interrupted then
						Fullscreen:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Fullscreen:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Fullscreen, event )
					else
						Fullscreen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 0 )
				FullscreenFrame2( Fullscreen, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 1 )
				local FullscreenFrame2 = function ( Fullscreen, event )
					if not event.interrupted then
						Fullscreen:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Fullscreen:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fullscreen, event )
					else
						Fullscreen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 1 )
				FullscreenFrame2( Fullscreen, {} )
			end
		}
	}
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

