CoD.ConnBlip = InheritFrom( LUI.UIElement )
CoD.ConnBlip.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ConnBlip )
	self.id = "ConnBlip"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 9 )
	self:setTopBottom( true, false, 0, 8 )
	
	local imgServer = LUI.UIImage.new()
	imgServer:setLeftRight( true, false, 0, 9 )
	imgServer:setTopBottom( true, false, 0, 8 )
	imgServer:setRGB( 1, 0.61, 0 )
	imgServer:setAlpha( 0.51 )
	imgServer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgServer )
	self.imgServer = imgServer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				imgServer:completeAnimation()
				self.imgServer:setAlpha( 0.07 )
				self.clipFinished( imgServer, {} )
			end,
			DataTransmitted = function ()
				self:setupElementClipCounter( 1 )
				local imgServerFrame2 = function ( imgServer, event )
					local imgServerFrame3 = function ( imgServer, event )
						if not event.interrupted then
							imgServer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						imgServer:setRGB( 0, 1, 0.07 )
						imgServer:setAlpha( 0.09 )
						if event.interrupted then
							self.clipFinished( imgServer, event )
						else
							imgServer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						imgServerFrame3( imgServer, event )
						return 
					else
						imgServer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						imgServer:setAlpha( 0.4 )
						imgServer:registerEventHandler( "transition_complete_keyframe", imgServerFrame3 )
					end
				end
				
				imgServer:completeAnimation()
				self.imgServer:setRGB( 0, 1, 0.07 )
				self.imgServer:setAlpha( 0.07 )
				imgServerFrame2( imgServer, {} )
			end,
			ServerSilent = function ()
				self:setupElementClipCounter( 1 )
				local imgServerFrame2 = function ( imgServer, event )
					local imgServerFrame3 = function ( imgServer, event )
						if not event.interrupted then
							imgServer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						imgServer:setRGB( 1, 0.61, 0 )
						imgServer:setAlpha( 0.51 )
						if event.interrupted then
							self.clipFinished( imgServer, event )
						else
							imgServer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						imgServerFrame3( imgServer, event )
						return 
					else
						imgServer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						imgServer:setAlpha( 0.77 )
						imgServer:registerEventHandler( "transition_complete_keyframe", imgServerFrame3 )
					end
				end
				
				imgServer:completeAnimation()
				self.imgServer:setRGB( 1, 0.61, 0 )
				self.imgServer:setAlpha( 0.51 )
				imgServerFrame2( imgServer, {} )
				self.nextClip = "ServerSilent"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

