-- b7db165f600f2a5f504c740dced62a2c
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Pixel04FX = InheritFrom( LUI.UIElement )
CoD.BM_Pixel04FX.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Pixel04FX )
	self.id = "BM_Pixel04FX"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 380 )
	self:setTopBottom( true, false, 0, 476 )
	
	local Pixels01 = LUI.UIImage.new()
	Pixels01:setLeftRight( true, false, 0, 380 )
	Pixels01:setTopBottom( true, false, 0, 476 )
	Pixels01:setAlpha( 0.52 )
	Pixels01:setImage( RegisterImage( "uie_t7_blackmarket_backing_pixel01" ) )
	self:addElement( Pixels01 )
	self.Pixels01 = Pixels01
	
	local Pixels02 = LUI.UIImage.new()
	Pixels02:setLeftRight( true, false, 0, 380 )
	Pixels02:setTopBottom( true, false, 0, 476 )
	Pixels02:setAlpha( 0.52 )
	Pixels02:setImage( RegisterImage( "uie_t7_blackmarket_backing_pixel02" ) )
	self:addElement( Pixels02 )
	self.Pixels02 = Pixels02
	
	local Pixels03 = LUI.UIImage.new()
	Pixels03:setLeftRight( true, false, 0, 380 )
	Pixels03:setTopBottom( true, false, 0, 476 )
	Pixels03:setAlpha( 0.52 )
	Pixels03:setImage( RegisterImage( "uie_t7_blackmarket_backing_pixel03" ) )
	self:addElement( Pixels03 )
	self.Pixels03 = Pixels03
	
	local Pixels04 = LUI.UIImage.new()
	Pixels04:setLeftRight( true, false, 0, 380 )
	Pixels04:setTopBottom( true, false, 0, 476 )
	Pixels04:setAlpha( 0.52 )
	Pixels04:setImage( RegisterImage( "uie_t7_blackmarket_backing_pixel04" ) )
	self:addElement( Pixels04 )
	self.Pixels04 = Pixels04
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, 14.83, 366 )
	mask:setTopBottom( true, false, 14.44, 463.17 )
	mask:setRGB( 0, 0, 0 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_pixelanim_mask" ) )
	self:addElement( mask )
	self.mask = mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				Pixels01:completeAnimation()
				self.Pixels01:setAlpha( 0 )
				self.clipFinished( Pixels01, {} )

				Pixels02:completeAnimation()
				self.Pixels02:setAlpha( 0 )
				self.clipFinished( Pixels02, {} )

				Pixels03:completeAnimation()
				self.Pixels03:setAlpha( 0 )
				self.clipFinished( Pixels03, {} )
				local Pixels04Frame2 = function ( Pixels04, event )
					local Pixels04Frame3 = function ( Pixels04, event )
						local Pixels04Frame4 = function ( Pixels04, event )
							if not event.interrupted then
								Pixels04:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							end
							Pixels04:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Pixels04, event )
							else
								Pixels04:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Pixels04Frame4( Pixels04, event )
							return 
						else
							Pixels04:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Pixels04:setAlpha( 1 )
							Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame4 )
						end
					end
					
					if event.interrupted then
						Pixels04Frame3( Pixels04, event )
						return 
					else
						Pixels04:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame3 )
					end
				end
				
				Pixels04:completeAnimation()
				self.Pixels04:setAlpha( 0 )
				Pixels04Frame2( Pixels04, {} )
				local maskFrame2 = function ( mask, event )
					local maskFrame3 = function ( mask, event )
						if not event.interrupted then
							mask:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						end
						mask:setAlpha( 1 )
						mask:setScale( 1.5 )
						if event.interrupted then
							self.clipFinished( mask, event )
						else
							mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						maskFrame3( mask, event )
						return 
					else
						mask:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						mask:registerEventHandler( "transition_complete_keyframe", maskFrame3 )
					end
				end
				
				mask:completeAnimation()
				self.mask:setAlpha( 1 )
				self.mask:setScale( 1 )
				maskFrame2( mask, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

