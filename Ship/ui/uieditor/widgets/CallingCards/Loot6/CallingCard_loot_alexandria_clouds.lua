-- 3adc9f266cf98b003dd75d4a729a6c1f
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_loot_alexandria_clouds = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_alexandria_clouds.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_loot_alexandria_clouds )
	self.id = "CallingCard_loot_alexandria_clouds"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 318 )
	self:setTopBottom( true, false, 0, 108 )
	
	local cloud1 = LUI.UIImage.new()
	cloud1:setLeftRight( true, false, 0, 276 )
	cloud1:setTopBottom( true, false, 0, 108 )
	cloud1:setAlpha( 0 )
	cloud1:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_cloud1" ) )
	self:addElement( cloud1 )
	self.cloud1 = cloud1
	
	local cloud2 = LUI.UIImage.new()
	cloud2:setLeftRight( true, false, 174, 318 )
	cloud2:setTopBottom( true, false, 5, 53 )
	cloud2:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_cloud2" ) )
	self:addElement( cloud2 )
	self.cloud2 = cloud2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local cloud1Frame2 = function ( cloud1, event )
					local cloud1Frame3 = function ( cloud1, event )
						local cloud1Frame4 = function ( cloud1, event )
							if not event.interrupted then
								cloud1:beginAnimation( "keyframe", 1870, false, false, CoD.TweenType.Linear )
							end
							cloud1:setLeftRight( true, false, 263, 539 )
							cloud1:setTopBottom( true, false, -6, 102 )
							cloud1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( cloud1, event )
							else
								cloud1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							cloud1Frame4( cloud1, event )
							return 
						else
							cloud1:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
							cloud1:setLeftRight( true, false, 212.36, 488.36 )
							cloud1:setTopBottom( true, false, -5.5, 102.5 )
							cloud1:setAlpha( 1 )
							cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame4 )
						end
					end
					
					if event.interrupted then
						cloud1Frame3( cloud1, event )
						return 
					else
						cloud1:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						cloud1:setLeftRight( true, false, 172.02, 448.02 )
						cloud1:setTopBottom( true, false, -5.1, 102.9 )
						cloud1:setAlpha( 0.6 )
						cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame3 )
					end
				end
				
				cloud1:completeAnimation()
				self.cloud1:setLeftRight( true, false, 162, 438 )
				self.cloud1:setTopBottom( true, false, -5, 103 )
				self.cloud1:setAlpha( 0 )
				cloud1Frame2( cloud1, {} )
				local f2_local1 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						local f7_local0 = function ( f8_arg0, f8_arg1 )
							if not f8_arg1.interrupted then
								f8_arg0:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
							end
							f8_arg0:setLeftRight( true, false, 467, 611 )
							f8_arg0:setTopBottom( true, false, 0, 48 )
							f8_arg0:setAlpha( 0 )
							if f8_arg1.interrupted then
								self.clipFinished( f8_arg0, f8_arg1 )
							else
								f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f7_arg1.interrupted then
							f7_local0( f7_arg0, f7_arg1 )
							return 
						else
							f7_arg0:beginAnimation( "keyframe", 4280, false, false, CoD.TweenType.Linear )
							f7_arg0:setLeftRight( true, false, 440.76, 584.76 )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						f6_arg0:setLeftRight( true, false, 355.03, 499.03 )
						f6_arg0:setAlpha( 0.56 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				cloud2:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				cloud2:setLeftRight( true, false, 336, 480 )
				cloud2:setTopBottom( true, false, 0, 48 )
				cloud2:setAlpha( 0 )
				cloud2:registerEventHandler( "transition_complete_keyframe", f2_local1 )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
