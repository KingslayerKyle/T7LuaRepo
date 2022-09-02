-- 2d12addd99e2f4d394319ad5c1e5aa2f
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Wires1 = InheritFrom( LUI.UIElement )
CoD.BM_Wires1.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Wires1 )
	self.id = "BM_Wires1"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 360 )
	
	local wires = LUI.UIImage.new()
	wires:setLeftRight( true, false, 0, 120 )
	wires:setTopBottom( true, false, 0, 360 )
	wires:setAlpha( 0 )
	wires:setImage( RegisterImage( "uie_t7_blackmarket_circuitanim_line1" ) )
	self:addElement( wires )
	self.wires = wires
	
	local Mask0 = LUI.UIImage.new()
	Mask0:setLeftRight( true, false, -11, 227 )
	Mask0:setTopBottom( true, false, 0, 818.03 )
	Mask0:setRGB( 0, 0, 0 )
	Mask0:setAlpha( 0 )
	Mask0:setImage( RegisterImage( "uie_t7_blackmarket_wireglowmask" ) )
	self:addElement( Mask0 )
	self.Mask0 = Mask0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				wires:completeAnimation()
				self.wires:setAlpha( 0 )
				self.clipFinished( wires, {} )

				Mask0:completeAnimation()
				self.Mask0:setAlpha( 0 )
				self.clipFinished( Mask0, {} )
			end,
			circuitanim = function ()
				self:setupElementClipCounter( 2 )

				local wiresFrame2 = function ( wires, event )
					local wiresFrame3 = function ( wires, event )
						if not event.interrupted then
							wires:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						wires:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( wires, event )
						else
							wires:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						wiresFrame3( wires, event )
						return 
					else
						wires:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
						wires:registerEventHandler( "transition_complete_keyframe", wiresFrame3 )
					end
				end
				
				wires:completeAnimation()
				self.wires:setAlpha( 1 )
				wiresFrame2( wires, {} )
				local Mask0Frame2 = function ( Mask0, event )
					local Mask0Frame3 = function ( Mask0, event )
						if not event.interrupted then
							Mask0:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						end
						Mask0:setLeftRight( true, false, -45, 193 )
						Mask0:setTopBottom( true, false, -473.03, 345 )
						Mask0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Mask0, event )
						else
							Mask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Mask0Frame3( Mask0, event )
						return 
					else
						Mask0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Mask0:registerEventHandler( "transition_complete_keyframe", Mask0Frame3 )
					end
				end
				
				Mask0:completeAnimation()
				self.Mask0:setLeftRight( true, false, -45, 193 )
				self.Mask0:setTopBottom( true, false, 0, 818.03 )
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

