CoD.AmmoWidgetMP_HeldItemSquare = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_HeldItemSquare.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_HeldItemSquare )
	self.id = "AmmoWidgetMP_HeldItemSquare"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 35.7 )
	Image0:setTopBottom( true, false, 0, 31.5 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									if not event.interrupted then
										Image0:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
									end
									Image0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Image0, event )
									else
										Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Bounce )
									Image0:setAlpha( 0.2 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								Image0:setAlpha( 0 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 1 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				self.nextClip = "DefaultClip"
			end,
			ItemHeld = function ()
				self:setupElementClipCounter( 0 )
				self.nextClip = "ItemHeld"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

