CoD.BMWire2 = InheritFrom( LUI.UIElement )
CoD.BMWire2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BMWire2 )
	self.id = "BMWire2"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 540 )
	
	local wires2 = LUI.UIImage.new()
	wires2:setLeftRight( 0, 0, 0, 180 )
	wires2:setTopBottom( 0, 0, 0, 540 )
	wires2:setAlpha( 0 )
	wires2:setImage( RegisterImage( "uie_t7_blackmarket_circuitanim_line2" ) )
	self:addElement( wires2 )
	self.wires2 = wires2
	
	local Mask0 = LUI.UIImage.new()
	Mask0:setLeftRight( 0, 0, -67, 290 )
	Mask0:setTopBottom( 0, 0, 0, 1094 )
	Mask0:setRGB( 0, 0, 0 )
	Mask0:setAlpha( 0 )
	Mask0:setImage( RegisterImage( "uie_t7_blackmarket_wireglowmask" ) )
	self:addElement( Mask0 )
	self.Mask0 = Mask0
	
	self.resetProperties = function ()
		wires2:completeAnimation()
		Mask0:completeAnimation()
		wires2:setAlpha( 0 )
		Mask0:setLeftRight( 0, 0, -67, 290 )
		Mask0:setTopBottom( 0, 0, 0, 1094 )
		Mask0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			circuitanim = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local wires2Frame2 = function ( wires2, event )
					local wires2Frame3 = function ( wires2, event )
						if not event.interrupted then
							wires2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						wires2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( wires2, event )
						else
							wires2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						wires2Frame3( wires2, event )
						return 
					else
						wires2:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
						wires2:registerEventHandler( "transition_complete_keyframe", wires2Frame3 )
					end
				end
				
				wires2:completeAnimation()
				self.wires2:setAlpha( 1 )
				wires2Frame2( wires2, {} )
				local Mask0Frame2 = function ( Mask0, event )
					local Mask0Frame3 = function ( Mask0, event )
						local Mask0Frame4 = function ( Mask0, event )
							if not event.interrupted then
								Mask0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							end
							Mask0:setLeftRight( 0, 0, -67, 290 )
							Mask0:setTopBottom( 0, 0, -564, 530 )
							Mask0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Mask0, event )
							else
								Mask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Mask0Frame4( Mask0, event )
							return 
						else
							Mask0:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
							Mask0:setTopBottom( 0, 0, -564, 530 )
							Mask0:registerEventHandler( "transition_complete_keyframe", Mask0Frame4 )
						end
					end
					
					if event.interrupted then
						Mask0Frame3( Mask0, event )
						return 
					else
						Mask0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						Mask0:registerEventHandler( "transition_complete_keyframe", Mask0Frame3 )
					end
				end
				
				Mask0:completeAnimation()
				self.Mask0:setLeftRight( 0, 0, -67, 290 )
				self.Mask0:setTopBottom( 0, 0, 0, 1094 )
				self.Mask0:setAlpha( 1 )
				Mask0Frame2( Mask0, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

