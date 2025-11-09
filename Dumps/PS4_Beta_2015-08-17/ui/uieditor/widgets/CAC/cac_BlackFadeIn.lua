CoD.cac_BlackFadeIn = InheritFrom( LUI.UIElement )
CoD.cac_BlackFadeIn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_BlackFadeIn )
	self.id = "cac_BlackFadeIn"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 649 )
	
	local BlackImage = LUI.UIImage.new()
	BlackImage:setLeftRight( true, false, 0, 1280 )
	BlackImage:setTopBottom( true, false, 0, 649 )
	BlackImage:setRGB( 0, 0, 0 )
	BlackImage:setAlpha( 0 )
	self:addElement( BlackImage )
	self.BlackImage = BlackImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BlackImage:completeAnimation()
				self.BlackImage:setAlpha( 0 )
				self.clipFinished( BlackImage, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 1 )
				local BlackImageFrame2 = function ( BlackImage, event )
					local BlackImageFrame3 = function ( BlackImage, event )
						if not event.interrupted then
							BlackImage:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						end
						BlackImage:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BlackImage, event )
						else
							BlackImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackImageFrame3( BlackImage, event )
						return 
					else
						BlackImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						BlackImage:registerEventHandler( "transition_complete_keyframe", BlackImageFrame3 )
					end
				end
				
				BlackImage:completeAnimation()
				self.BlackImage:setAlpha( 1 )
				BlackImageFrame2( BlackImage, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

