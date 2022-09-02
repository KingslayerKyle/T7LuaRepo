-- d2db35b33376a15882925de5e83956a0
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 216 )
	self:setTopBottom( true, false, 0, 420 )
	
	local wires2 = LUI.UIImage.new()
	wires2:setLeftRight( false, false, -108, 108 )
	wires2:setTopBottom( true, false, 0, 420 )
	wires2:setAlpha( 0 )
	wires2:setImage( RegisterImage( "uie_t7_blackmarket_wireglow" ) )
	self:addElement( wires2 )
	self.wires2 = wires2
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( true, false, -11, 227 )
	Mask:setTopBottom( true, false, -601, 414.03 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setImage( RegisterImage( "uie_t7_blackmarket_wireglowmask" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				wires2:completeAnimation()
				self.wires2:setAlpha( 0 )
				self.clipFinished( wires2, {} )

				Mask:completeAnimation()
				self.Mask:setAlpha( 0 )
				self.clipFinished( Mask, {} )
			end,
			circuitanim = function ()
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
						Mask:setLeftRight( true, false, -11, 227 )
						Mask:setTopBottom( true, false, -601, 414.03 )
						Mask:setAlpha( 1 )
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
						Mask:setTopBottom( true, false, -521, 394.03 )
						Mask:registerEventHandler( "transition_complete_keyframe", MaskFrame3 )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( true, false, -11, 227 )
				self.Mask:setTopBottom( true, false, 0, 945.03 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

