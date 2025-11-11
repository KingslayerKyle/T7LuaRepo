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
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 540 )
	
	local wires = LUI.UIImage.new()
	wires:setLeftRight( 0, 0, 0, 180 )
	wires:setTopBottom( 0, 0, 0, 540 )
	wires:setAlpha( 0 )
	wires:setImage( RegisterImage( "uie_t7_blackmarket_circuitanim_line1" ) )
	self:addElement( wires )
	self.wires = wires
	
	local Mask0 = LUI.UIImage.new()
	Mask0:setLeftRight( 0, 0, -17, 340 )
	Mask0:setTopBottom( 0, 0, 0, 1227 )
	Mask0:setRGB( 0, 0, 0 )
	Mask0:setAlpha( 0 )
	Mask0:setImage( RegisterImage( "uie_t7_blackmarket_wireglowmask" ) )
	self:addElement( Mask0 )
	self.Mask0 = Mask0
	
	self.resetProperties = function ()
		wires:completeAnimation()
		Mask0:completeAnimation()
		wires:setAlpha( 0 )
		Mask0:setLeftRight( 0, 0, -17, 340 )
		Mask0:setTopBottom( 0, 0, 0, 1227 )
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
						Mask0:setLeftRight( 0, 0, -67, 290 )
						Mask0:setTopBottom( 0, 0, -710, 517 )
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
				self.Mask0:setLeftRight( 0, 0, -67, 290 )
				self.Mask0:setTopBottom( 0, 0, 0, 1227 )
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

