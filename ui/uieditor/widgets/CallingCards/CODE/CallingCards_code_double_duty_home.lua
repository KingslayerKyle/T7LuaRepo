-- 42100b652b5d3b19909abd82cee3f890
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_code_double_duty_home = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_double_duty_home.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_code_double_duty_home )
	self.id = "CallingCards_code_double_duty_home"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local city = LUI.UIImage.new()
	city:setLeftRight( true, false, 0, 480 )
	city:setTopBottom( true, false, 0, 120 )
	city:setImage( RegisterImage( "uie_t7_callingcards_double_duty_city" ) )
	self:addElement( city )
	self.city = city
	
	local rays = LUI.UIImage.new()
	rays:setLeftRight( true, false, 0, 335 )
	rays:setTopBottom( true, false, 0, 120 )
	rays:setAlpha( 0 )
	rays:setImage( RegisterImage( "uie_t7_callingcards_double_duty_rays" ) )
	rays:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( rays )
	self.rays = rays
	
	local rays0 = LUI.UIImage.new()
	rays0:setLeftRight( true, false, 0, 335 )
	rays0:setTopBottom( true, false, 0, 120 )
	rays0:setAlpha( 0 )
	rays0:setImage( RegisterImage( "uie_t7_callingcards_double_duty_rays" ) )
	rays0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( rays0 )
	self.rays0 = rays0
	
	local rays1 = LUI.UIImage.new()
	rays1:setLeftRight( true, false, 0, 335 )
	rays1:setTopBottom( true, false, 0, 120 )
	rays1:setAlpha( 0 )
	rays1:setImage( RegisterImage( "uie_t7_callingcards_double_duty_rays" ) )
	rays1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( rays1 )
	self.rays1 = rays1
	
	local plane = LUI.UIImage.new()
	plane:setLeftRight( true, false, -52, 0 )
	plane:setTopBottom( true, false, 6.64, 34.64 )
	plane:setScale( 0.8 )
	plane:setImage( RegisterImage( "uie_t7_callingcards_double_duty_plane" ) )
	self:addElement( plane )
	self.plane = plane
	
	local flag = LUI.UIImage.new()
	flag:setLeftRight( true, false, 144.5, 164.5 )
	flag:setTopBottom( true, false, 14.64, 34.64 )
	flag:setImage( RegisterImage( "uie_t7_callingcards_double_duty_flag_flipbook" ) )
	flag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flag:setShaderVector( 0, 2, 1, 0, 0 )
	flag:setShaderVector( 1, 2.89, 0, 0, 0 )
	self:addElement( flag )
	self.flag = flag
	
	local businessman = LUI.UIImage.new()
	businessman:setLeftRight( true, false, 284, 396 )
	businessman:setTopBottom( true, false, 11, 122 )
	businessman:setImage( RegisterImage( "uie_t7_callingcards_double_duty_businessman" ) )
	self:addElement( businessman )
	self.businessman = businessman
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							local f5_local0 = function ( f6_arg0, f6_arg1 )
								local f6_local0 = function ( f7_arg0, f7_arg1 )
									local f7_local0 = function ( f8_arg0, f8_arg1 )
										local f8_local0 = function ( f9_arg0, f9_arg1 )
											local f9_local0 = function ( f10_arg0, f10_arg1 )
												if not f10_arg1.interrupted then
													f10_arg0:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
												end
												f10_arg0:setAlpha( 0 )
												if f10_arg1.interrupted then
													self.clipFinished( f10_arg0, f10_arg1 )
												else
													f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f9_arg1.interrupted then
												f9_local0( f9_arg0, f9_arg1 )
												return 
											else
												f9_arg0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
												f9_arg0:setAlpha( 0.32 )
												f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
											end
										end
										
										if f8_arg1.interrupted then
											f8_local0( f8_arg0, f8_arg1 )
											return 
										else
											f8_arg0:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
											f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
										end
									end
									
									if f7_arg1.interrupted then
										f7_local0( f7_arg0, f7_arg1 )
										return 
									else
										f7_arg0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										f7_arg0:setAlpha( 0 )
										f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
									end
								end
								
								if f6_arg1.interrupted then
									f6_local0( f6_arg0, f6_arg1 )
									return 
								else
									f6_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
									f6_arg0:setAlpha( 0.65 )
									f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
								end
							end
							
							if f5_arg1.interrupted then
								f5_local0( f5_arg0, f5_arg1 )
								return 
							else
								f5_arg0:beginAnimation( "keyframe", 1759, false, false, CoD.TweenType.Linear )
								f5_arg0:setAlpha( 0.32 )
								f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
							f4_arg0:setAlpha( 0 )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 0.67 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				rays:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				rays:setAlpha( 0 )
				rays:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local planeFrame2 = function ( plane, event )
					if not event.interrupted then
						plane:beginAnimation( "keyframe", 10060, false, false, CoD.TweenType.Linear )
					end
					plane:setLeftRight( true, false, 480, 532 )
					plane:setTopBottom( true, false, 6.64, 34.64 )
					if event.interrupted then
						self.clipFinished( plane, event )
					else
						plane:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				plane:completeAnimation()
				self.plane:setLeftRight( true, false, -52, 0 )
				self.plane:setTopBottom( true, false, 6.64, 34.64 )
				planeFrame2( plane, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

