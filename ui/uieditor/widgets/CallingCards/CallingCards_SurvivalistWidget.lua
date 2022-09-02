-- 74f78aee171ce2fbd06f4f8c59344e20
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_SurvivalistWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_SurvivalistWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_SurvivalistWidget )
	self.id = "CallingCards_SurvivalistWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_survivalist_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local cloud4 = LUI.UIImage.new()
	cloud4:setLeftRight( true, false, 189.75, 369.75 )
	cloud4:setTopBottom( true, false, 0, 72 )
	cloud4:setImage( RegisterImage( "uie_t7_callingcard_survivalist_cloud4" ) )
	self:addElement( cloud4 )
	self.cloud4 = cloud4
	
	local cloud40 = LUI.UIImage.new()
	cloud40:setLeftRight( true, false, 210.75, 390.75 )
	cloud40:setTopBottom( true, false, 0, 72 )
	cloud40:setImage( RegisterImage( "uie_t7_callingcard_survivalist_cloud4" ) )
	self:addElement( cloud40 )
	self.cloud40 = cloud40
	
	local mountains = LUI.UIImage.new()
	mountains:setLeftRight( true, false, 0, 480 )
	mountains:setTopBottom( true, false, 0, 120 )
	mountains:setImage( RegisterImage( "uie_t7_callingcard_survivalist_mountain_flipbook" ) )
	mountains:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	mountains:setShaderVector( 0, 2, 0, 0, 0 )
	mountains:setShaderVector( 1, 7.17, 0, 0, 0 )
	self:addElement( mountains )
	self.mountains = mountains
	
	local cloud10 = LUI.UIImage.new()
	cloud10:setLeftRight( true, false, 228, 480 )
	cloud10:setTopBottom( true, false, 0, 120 )
	cloud10:setAlpha( 0 )
	cloud10:setImage( RegisterImage( "uie_t7_callingcard_survivalist_cloud1" ) )
	self:addElement( cloud10 )
	self.cloud10 = cloud10
	
	local cloud1 = LUI.UIImage.new()
	cloud1:setLeftRight( true, false, 221, 473 )
	cloud1:setTopBottom( true, false, 0, 120 )
	cloud1:setImage( RegisterImage( "uie_t7_callingcard_survivalist_cloud1" ) )
	self:addElement( cloud1 )
	self.cloud1 = cloud1
	
	local cloud2 = LUI.UIImage.new()
	cloud2:setLeftRight( true, false, 288, 480 )
	cloud2:setTopBottom( true, false, 0, 120 )
	cloud2:setImage( RegisterImage( "uie_t7_callingcard_survivalist_cloud2" ) )
	self:addElement( cloud2 )
	self.cloud2 = cloud2
	
	local cloud20 = LUI.UIImage.new()
	cloud20:setLeftRight( true, false, 313, 505 )
	cloud20:setTopBottom( true, false, 0, 120 )
	cloud20:setAlpha( 0.64 )
	cloud20:setImage( RegisterImage( "uie_t7_callingcard_survivalist_cloud2" ) )
	self:addElement( cloud20 )
	self.cloud20 = cloud20
	
	local man = LUI.UIImage.new()
	man:setLeftRight( true, false, 240, 480 )
	man:setTopBottom( true, false, 0, 120 )
	man:setImage( RegisterImage( "uie_t7_callingcard_survivalist_man" ) )
	self:addElement( man )
	self.man = man
	
	local car = LUI.UIImage.new()
	car:setLeftRight( true, false, 90, 276 )
	car:setTopBottom( true, false, 49.45, 120 )
	car:setImage( RegisterImage( "uie_t7_callingcard_survivalist_car" ) )
	self:addElement( car )
	self.car = car
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local cloud4Frame2 = function ( cloud4, event )
					local cloud4Frame3 = function ( cloud4, event )
						if not event.interrupted then
							cloud4:beginAnimation( "keyframe", 880, false, false, CoD.TweenType.Linear )
						end
						cloud4:setLeftRight( true, false, 180, 360 )
						cloud4:setTopBottom( true, false, 0, 72 )
						cloud4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( cloud4, event )
						else
							cloud4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cloud4Frame3( cloud4, event )
						return 
					else
						cloud4:beginAnimation( "keyframe", 2119, false, false, CoD.TweenType.Linear )
						cloud4:setLeftRight( true, false, 189.02, 369.02 )
						cloud4:registerEventHandler( "transition_complete_keyframe", cloud4Frame3 )
					end
				end
				
				cloud4:completeAnimation()
				self.cloud4:setLeftRight( true, false, 210.75, 390.75 )
				self.cloud4:setTopBottom( true, false, 0, 72 )
				self.cloud4:setAlpha( 1 )
				cloud4Frame2( cloud4, {} )
				local f2_local1 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setAlpha( 1 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cloud40:beginAnimation( "keyframe", 1450, false, false, CoD.TweenType.Linear )
				cloud40:setAlpha( 0 )
				cloud40:registerEventHandler( "transition_complete_keyframe", f2_local1 )

				cloud10:completeAnimation()
				self.cloud10:setAlpha( 1 )
				self.clipFinished( cloud10, {} )
				local cloud1Frame2 = function ( cloud1, event )
					local cloud1Frame3 = function ( cloud1, event )
						local cloud1Frame4 = function ( cloud1, event )
							local cloud1Frame5 = function ( cloud1, event )
								if not event.interrupted then
									cloud1:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
								end
								cloud1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( cloud1, event )
								else
									cloud1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								cloud1Frame5( cloud1, event )
								return 
							else
								cloud1:beginAnimation( "keyframe", 679, false, false, CoD.TweenType.Linear )
								cloud1:setAlpha( 1 )
								cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame5 )
							end
						end
						
						if event.interrupted then
							cloud1Frame4( cloud1, event )
							return 
						else
							cloud1:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
							cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame4 )
						end
					end
					
					if event.interrupted then
						cloud1Frame3( cloud1, event )
						return 
					else
						cloud1:beginAnimation( "keyframe", 939, false, false, CoD.TweenType.Linear )
						cloud1:setAlpha( 0 )
						cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame3 )
					end
				end
				
				cloud1:completeAnimation()
				self.cloud1:setAlpha( 1 )
				cloud1Frame2( cloud1, {} )
				local cloud2Frame2 = function ( cloud2, event )
					local cloud2Frame3 = function ( cloud2, event )
						local cloud2Frame4 = function ( cloud2, event )
							local cloud2Frame5 = function ( cloud2, event )
								local cloud2Frame6 = function ( cloud2, event )
									local cloud2Frame7 = function ( cloud2, event )
										if not event.interrupted then
											cloud2:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
										end
										cloud2:setLeftRight( true, false, 313, 505 )
										cloud2:setTopBottom( true, false, 0, 120 )
										cloud2:setAlpha( 0.64 )
										if event.interrupted then
											self.clipFinished( cloud2, event )
										else
											cloud2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										cloud2Frame7( cloud2, event )
										return 
									else
										cloud2:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
										cloud2:setAlpha( 1 )
										cloud2:registerEventHandler( "transition_complete_keyframe", cloud2Frame7 )
									end
								end
								
								if event.interrupted then
									cloud2Frame6( cloud2, event )
									return 
								else
									cloud2:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
									cloud2:setAlpha( 0 )
									cloud2:registerEventHandler( "transition_complete_keyframe", cloud2Frame6 )
								end
							end
							
							if event.interrupted then
								cloud2Frame5( cloud2, event )
								return 
							else
								cloud2:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
								cloud2:setAlpha( 1 )
								cloud2:registerEventHandler( "transition_complete_keyframe", cloud2Frame5 )
							end
						end
						
						if event.interrupted then
							cloud2Frame4( cloud2, event )
							return 
						else
							cloud2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							cloud2:setAlpha( 0 )
							cloud2:registerEventHandler( "transition_complete_keyframe", cloud2Frame4 )
						end
					end
					
					if event.interrupted then
						cloud2Frame3( cloud2, event )
						return 
					else
						cloud2:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						cloud2:setAlpha( 1 )
						cloud2:registerEventHandler( "transition_complete_keyframe", cloud2Frame3 )
					end
				end
				
				cloud2:completeAnimation()
				self.cloud2:setLeftRight( true, false, 313, 505 )
				self.cloud2:setTopBottom( true, false, 0, 120 )
				self.cloud2:setAlpha( 0.64 )
				cloud2Frame2( cloud2, {} )
				local cloud20Frame2 = function ( cloud20, event )
					local cloud20Frame3 = function ( cloud20, event )
						local cloud20Frame4 = function ( cloud20, event )
							local cloud20Frame5 = function ( cloud20, event )
								local cloud20Frame6 = function ( cloud20, event )
									if not event.interrupted then
										cloud20:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
									end
									cloud20:setLeftRight( true, false, 288, 480 )
									cloud20:setTopBottom( true, false, 0, 120 )
									cloud20:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( cloud20, event )
									else
										cloud20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									cloud20Frame6( cloud20, event )
									return 
								else
									cloud20:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
									cloud20:setAlpha( 1 )
									cloud20:registerEventHandler( "transition_complete_keyframe", cloud20Frame6 )
								end
							end
							
							if event.interrupted then
								cloud20Frame5( cloud20, event )
								return 
							else
								cloud20:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
								cloud20:setAlpha( 0 )
								cloud20:registerEventHandler( "transition_complete_keyframe", cloud20Frame5 )
							end
						end
						
						if event.interrupted then
							cloud20Frame4( cloud20, event )
							return 
						else
							cloud20:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							cloud20:setAlpha( 1 )
							cloud20:registerEventHandler( "transition_complete_keyframe", cloud20Frame4 )
						end
					end
					
					if event.interrupted then
						cloud20Frame3( cloud20, event )
						return 
					else
						cloud20:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						cloud20:registerEventHandler( "transition_complete_keyframe", cloud20Frame3 )
					end
				end
				
				cloud20:completeAnimation()
				self.cloud20:setLeftRight( true, false, 288, 480 )
				self.cloud20:setTopBottom( true, false, 0, 120 )
				self.cloud20:setAlpha( 0 )
				cloud20Frame2( cloud20, {} )
				local carFrame2 = function ( car, event )
					local carFrame3 = function ( car, event )
						local carFrame4 = function ( car, event )
							local carFrame5 = function ( car, event )
								local carFrame6 = function ( car, event )
									local carFrame7 = function ( car, event )
										local carFrame8 = function ( car, event )
											local carFrame9 = function ( car, event )
												local carFrame10 = function ( car, event )
													local carFrame11 = function ( car, event )
														if not event.interrupted then
															car:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
														end
														car:setLeftRight( true, false, 90, 276 )
														car:setTopBottom( true, false, 49.45, 120 )
														if event.interrupted then
															self.clipFinished( car, event )
														else
															car:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														carFrame11( car, event )
														return 
													else
														car:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
														car:setLeftRight( true, false, 84, 270 )
														car:registerEventHandler( "transition_complete_keyframe", carFrame11 )
													end
												end
												
												if event.interrupted then
													carFrame10( car, event )
													return 
												else
													car:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
													car:setLeftRight( true, false, 102, 288 )
													car:registerEventHandler( "transition_complete_keyframe", carFrame10 )
												end
											end
											
											if event.interrupted then
												carFrame9( car, event )
												return 
											else
												car:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
												car:setLeftRight( true, false, 91.5, 277.5 )
												car:registerEventHandler( "transition_complete_keyframe", carFrame9 )
											end
										end
										
										if event.interrupted then
											carFrame8( car, event )
											return 
										else
											car:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
											car:setLeftRight( true, false, 99.06, 285.06 )
											car:registerEventHandler( "transition_complete_keyframe", carFrame8 )
										end
									end
									
									if event.interrupted then
										carFrame7( car, event )
										return 
									else
										car:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										car:setLeftRight( true, false, 87.75, 273.75 )
										car:registerEventHandler( "transition_complete_keyframe", carFrame7 )
									end
								end
								
								if event.interrupted then
									carFrame6( car, event )
									return 
								else
									car:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
									car:setLeftRight( true, false, 96.75, 282.75 )
									car:registerEventHandler( "transition_complete_keyframe", carFrame6 )
								end
							end
							
							if event.interrupted then
								carFrame5( car, event )
								return 
							else
								car:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								car:setLeftRight( true, false, 84, 270 )
								car:registerEventHandler( "transition_complete_keyframe", carFrame5 )
							end
						end
						
						if event.interrupted then
							carFrame4( car, event )
							return 
						else
							car:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							car:setLeftRight( true, false, 91.5, 277.5 )
							car:registerEventHandler( "transition_complete_keyframe", carFrame4 )
						end
					end
					
					if event.interrupted then
						carFrame3( car, event )
						return 
					else
						car:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						car:setLeftRight( true, false, 84, 270 )
						car:registerEventHandler( "transition_complete_keyframe", carFrame3 )
					end
				end
				
				car:completeAnimation()
				self.car:setLeftRight( true, false, 90, 276 )
				self.car:setTopBottom( true, false, 49.45, 120 )
				carFrame2( car, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

