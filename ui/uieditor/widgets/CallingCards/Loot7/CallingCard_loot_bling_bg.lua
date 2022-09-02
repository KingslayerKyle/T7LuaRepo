-- b8dc550e1ad97829eb7eb5066fb5c8b3
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_loot_bling_bg = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_bling_bg.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_loot_bling_bg )
	self.id = "CallingCard_loot_bling_bg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, -120, 240 )
	Image0:setImage( RegisterImage( "uie_lt_callingcard_bling_bgscroll" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	Image0:setShaderVector( 0, 0, 1, 0, 0 )
	Image0:setShaderVector( 1, 0, 0, 0, 0 )
	Image0:setShaderVector( 2, 0, 1, 0, 0 )
	Image0:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 71, 551 )
	Image00:setTopBottom( true, false, -324, 36 )
	Image00:setImage( RegisterImage( "uie_lt_callingcard_bling_bgscroll" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	Image00:setShaderVector( 0, 0, 1, 0, 0 )
	Image00:setShaderVector( 1, 0, 0, 0, 0 )
	Image00:setShaderVector( 2, 0, 1, 0, 0 )
	Image00:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							if not event.interrupted then
								Image0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							end
							Image0:setLeftRight( true, false, -83, 397 )
							Image0:setTopBottom( true, false, 88, 448 )
							Image0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image0, event )
							else
								Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							Image0:setLeftRight( true, false, -83, 397 )
							Image0:setTopBottom( true, false, 88, 448 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( true, false, -40, 440 )
						Image0:setTopBottom( true, false, -25, 335 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 0, 480 )
				self.Image0:setTopBottom( true, false, -120, 240 )
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
				local Image00Frame2 = function ( Image00, event )
					local Image00Frame3 = function ( Image00, event )
						local Image00Frame4 = function ( Image00, event )
							local Image00Frame5 = function ( Image00, event )
								if not event.interrupted then
									Image00:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
								end
								Image00:setLeftRight( true, false, 0, 480 )
								Image00:setTopBottom( true, false, -120, 240 )
								Image00:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Image00, event )
								else
									Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image00Frame5( Image00, event )
								return 
							else
								Image00:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
								Image00:setLeftRight( true, false, 53.33, 533.33 )
								Image00:setTopBottom( true, false, -267.83, 92.18 )
								Image00:setAlpha( 1 )
								Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame5 )
							end
						end
						
						if event.interrupted then
							Image00Frame4( Image00, event )
							return 
						else
							Image00:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							Image00:setLeftRight( true, false, 79, 559 )
							Image00:setTopBottom( true, false, -339, 21 )
							Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame4 )
						end
					end
					
					if event.interrupted then
						Image00Frame3( Image00, event )
						return 
					else
						Image00:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						Image00:setLeftRight( true, false, 80.32, 560.32 )
						Image00:setTopBottom( true, false, -343.62, 16.38 )
						Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame3 )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 85, 565 )
				self.Image00:setTopBottom( true, false, -360, 0 )
				self.Image00:setAlpha( 0 )
				Image00Frame2( Image00, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

