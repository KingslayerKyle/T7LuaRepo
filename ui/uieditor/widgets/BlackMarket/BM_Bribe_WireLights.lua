-- b1b0ec88bfd8deb5bfb3017da452737b
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Bribe_WireLights = InheritFrom( LUI.UIElement )
CoD.BM_Bribe_WireLights.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Bribe_WireLights )
	self.id = "BM_Bribe_WireLights"
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

				local BribeWiresLightsFrame2 = function ( BribeWiresLights, event )
					local BribeWiresLightsFrame3 = function ( BribeWiresLights, event )
						local BribeWiresLightsFrame4 = function ( BribeWiresLights, event )
							if not event.interrupted then
								BribeWiresLights:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							end
							BribeWiresLights:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BribeWiresLights, event )
							else
								BribeWiresLights:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BribeWiresLightsFrame4( BribeWiresLights, event )
							return 
						else
							BribeWiresLights:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							BribeWiresLights:setAlpha( 0 )
							BribeWiresLights:registerEventHandler( "transition_complete_keyframe", BribeWiresLightsFrame4 )
						end
					end
					
					if event.interrupted then
						BribeWiresLightsFrame3( BribeWiresLights, event )
						return 
					else
						BribeWiresLights:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						BribeWiresLights:registerEventHandler( "transition_complete_keyframe", BribeWiresLightsFrame3 )
					end
				end
				
				BribeWiresLights:completeAnimation()
				self.BribeWiresLights:setAlpha( 1 )
				BribeWiresLightsFrame2( BribeWiresLights, {} )
				local f2_local1 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						if not f7_arg1.interrupted then
							f7_arg0:beginAnimation( "keyframe", 6029, false, false, CoD.TweenType.Linear )
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
						f6_arg0:beginAnimation( "keyframe", 1970, true, false, CoD.TweenType.Linear )
						f6_arg0:setLeftRight( true, true, 194.06, 248.94 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				Mask:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Mask:setLeftRight( true, true, -245.94, -191.06 )
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
