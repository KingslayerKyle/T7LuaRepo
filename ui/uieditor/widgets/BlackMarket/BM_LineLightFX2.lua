-- de08f4e1c24f9b18de233af5901abb65
-- This hash is used for caching, delete to decompile the file again

CoD.BM_LineLightFX2 = InheritFrom( LUI.UIElement )
CoD.BM_LineLightFX2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_LineLightFX2 )
	self.id = "BM_LineLightFX2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 431 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BribeWiresLights = LUI.UIImage.new()
	BribeWiresLights:setLeftRight( true, false, 0, 431.2 )
	BribeWiresLights:setTopBottom( true, false, 0, 119.78 )
	BribeWiresLights:setImage( RegisterImage( "uie_t7_blackmarket_bribe_wires_light" ) )
	self:addElement( BribeWiresLights )
	self.BribeWiresLights = BribeWiresLights
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( true, true, -245.94, -191.06 )
	Mask:setTopBottom( true, true, -344.82, 411.82 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setZRot( 90 )
	Mask:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_mask" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							if not f5_arg1.interrupted then
								f5_arg0:beginAnimation( "keyframe", 739, false, false, CoD.TweenType.Linear )
							end
							f5_arg0:setAlpha( 0 )
							if f5_arg1.interrupted then
								self.clipFinished( f5_arg0, f5_arg1 )
							else
								f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 1550, false, false, CoD.TweenType.Linear )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 1 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				BribeWiresLights:beginAnimation( "keyframe", 2029, false, false, CoD.TweenType.Linear )
				BribeWiresLights:setAlpha( 0 )
				BribeWiresLights:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						if not f7_arg1.interrupted then
							f7_arg0:beginAnimation( "keyframe", 2450, false, false, CoD.TweenType.Linear )
						end
						f7_arg0:setLeftRight( true, true, 194.06, 248.94 )
						f7_arg0:setTopBottom( true, true, -344.82, 411.82 )
						if f7_arg1.interrupted then
							self.clipFinished( f7_arg0, f7_arg1 )
						else
							f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 3539, true, true, CoD.TweenType.Linear )
						f6_arg0:setLeftRight( true, true, 194.06, 248.94 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				Mask:beginAnimation( "keyframe", 2019, false, false, CoD.TweenType.Linear )
				Mask:setLeftRight( true, true, -163.25, -108.37 )
				Mask:setTopBottom( true, true, -344.82, 411.82 )
				Mask:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

