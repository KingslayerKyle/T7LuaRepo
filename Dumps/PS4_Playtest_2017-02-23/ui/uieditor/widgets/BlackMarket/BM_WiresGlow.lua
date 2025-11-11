CoD.BM_WiresGlow = InheritFrom( LUI.UIElement )
CoD.BM_WiresGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_WiresGlow )
	self.id = "BM_WiresGlow"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 324 )
	self:setTopBottom( 0, 0, 0, 630 )
	
	local wires2 = LUI.UIImage.new()
	wires2:setLeftRight( 0.5, 0.5, -162, 162 )
	wires2:setTopBottom( 0, 0, 0, 630 )
	wires2:setAlpha( 0 )
	wires2:setImage( RegisterImage( "uie_t7_blackmarket_wireglow" ) )
	self:addElement( wires2 )
	self.wires2 = wires2
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( 0, 0, -17, 340 )
	Mask:setTopBottom( 0, 0, -902, 621 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setImage( RegisterImage( "uie_t7_blackmarket_wireglowmask" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	self.resetProperties = function ()
		Mask:completeAnimation()
		wires2:completeAnimation()
		Mask:setLeftRight( 0, 0, -17, 340 )
		Mask:setTopBottom( 0, 0, -902, 621 )
		Mask:setAlpha( 1 )
		wires2:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Mask:completeAnimation()
				self.Mask:setAlpha( 0 )
				self.clipFinished( Mask, {} )
			end,
			circuitanim = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local wires2Frame2 = function ( wires2, event )
					local wires2Frame3 = function ( wires2, event )
						local wires2Frame4 = function ( wires2, event )
							if not event.interrupted then
								wires2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							end
							wires2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( wires2, event )
							else
								wires2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							wires2Frame4( wires2, event )
							return 
						else
							wires2:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Linear )
							wires2:registerEventHandler( "transition_complete_keyframe", wires2Frame4 )
						end
					end
					
					if event.interrupted then
						wires2Frame3( wires2, event )
						return 
					else
						wires2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						wires2:setAlpha( 1 )
						wires2:registerEventHandler( "transition_complete_keyframe", wires2Frame3 )
					end
				end
				
				wires2:completeAnimation()
				self.wires2:setAlpha( 0 )
				wires2Frame2( wires2, {} )
				local MaskFrame2 = function ( Mask, event )
					local MaskFrame3 = function ( Mask, event )
						if not event.interrupted then
							Mask:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						end
						Mask:setLeftRight( 0, 0, -17, 340 )
						Mask:setTopBottom( 0, 0, -902, 621 )
						if event.interrupted then
							self.clipFinished( Mask, event )
						else
							Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MaskFrame3( Mask, event )
						return 
					else
						Mask:beginAnimation( "keyframe", 759, false, true, CoD.TweenType.Linear )
						Mask:setTopBottom( 0, 0, -782, 591 )
						Mask:registerEventHandler( "transition_complete_keyframe", MaskFrame3 )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( 0, 0, -17, 340 )
				self.Mask:setTopBottom( 0, 0, -0.5, 1417.5 )
				MaskFrame2( Mask, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

