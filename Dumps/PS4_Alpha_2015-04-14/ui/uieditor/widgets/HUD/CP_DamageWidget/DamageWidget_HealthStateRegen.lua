CoD.DamageWidget_HealthStateRegen = InheritFrom( LUI.UIElement )
CoD.DamageWidget_HealthStateRegen.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_HealthStateRegen )
	self.id = "DamageWidget_HealthStateRegen"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 58 )
	
	local ImgStateShape = LUI.UIImage.new()
	ImgStateShape:setLeftRight( true, false, 0, 47.33 )
	ImgStateShape:setTopBottom( true, false, 0, 57.33 )
	ImgStateShape:setRGB( 1, 1, 1 )
	ImgStateShape:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfill" ) )
	ImgStateShape:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
	ImgStateShape:setShaderVector( 0, 0.4, 0, 0, 0 )
	ImgStateShape:setShaderVector( 1, 1, 0, 0, 0 )
	ImgStateShape:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( ImgStateShape )
	self.ImgStateShape = ImgStateShape
	
	local ImgStateShape0 = LUI.UIImage.new()
	ImgStateShape0:setLeftRight( true, false, 0, 47.33 )
	ImgStateShape0:setTopBottom( true, false, 0, 57.33 )
	ImgStateShape0:setRGB( 1, 1, 1 )
	ImgStateShape0:setAlpha( 0 )
	ImgStateShape0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfill" ) )
	ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
	ImgStateShape0:setShaderVector( 0, 10, 0, 0, 0 )
	ImgStateShape0:setShaderVector( 1, 1, 0, 0, 0 )
	ImgStateShape0:setShaderVector( 2, 0.5, 0, 0, 0 )
	self:addElement( ImgStateShape0 )
	self.ImgStateShape0 = ImgStateShape0
	
	local ImageGlitch1 = LUI.UIImage.new()
	ImageGlitch1:setLeftRight( true, false, -27, 24 )
	ImageGlitch1:setTopBottom( true, false, 47.92, 49.92 )
	ImageGlitch1:setRGB( 1, 1, 1 )
	ImageGlitch1:setAlpha( 0 )
	ImageGlitch1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ImageGlitch1 )
	self.ImageGlitch1 = ImageGlitch1
	
	local ImageGlitch2 = LUI.UIImage.new()
	ImageGlitch2:setLeftRight( true, false, -27, 24 )
	ImageGlitch2:setTopBottom( true, false, 6.92, 8.92 )
	ImageGlitch2:setRGB( 1, 1, 1 )
	ImageGlitch2:setAlpha( 0 )
	ImageGlitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ImageGlitch2 )
	self.ImageGlitch2 = ImageGlitch2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 1, 1 )
				self.ImgStateShape:setAlpha( 0 )
				self.clipFinished( ImgStateShape, {} )
				ImgStateShape0:completeAnimation()
				self.ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_mesh" ) )
				self.ImgStateShape0:setShaderVector( 0, 0.5, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 1, 0, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 2, 4, 0, 0, 0 )
				self.clipFinished( ImgStateShape0, {} )
				ImageGlitch1:completeAnimation()
				self.ImageGlitch1:setAlpha( 0 )
				self.clipFinished( ImageGlitch1, {} )
				ImageGlitch2:completeAnimation()
				self.ImageGlitch2:setAlpha( 0 )
				self.clipFinished( ImageGlitch2, {} )
			end
		},
		Regen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					local ImgStateShapeFrame3 = function ( ImgStateShape, event )
						local ImgStateShapeFrame4 = function ( ImgStateShape, event )
							local ImgStateShapeFrame5 = function ( ImgStateShape, event )
								local ImgStateShapeFrame6 = function ( ImgStateShape, event )
									if not event.interrupted then
										ImgStateShape:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									ImgStateShape:setAlpha( 0 )
									ImgStateShape:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
									ImgStateShape:setShaderVector( 0, 3, 0, 0, 0 )
									ImgStateShape:setShaderVector( 1, -1, 0, 0, 0 )
									ImgStateShape:setShaderVector( 2, 0, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( ImgStateShape, event )
									else
										ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ImgStateShapeFrame6( ImgStateShape, event )
									return 
								else
									ImgStateShape:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									ImgStateShape:setAlpha( 0 )
									ImgStateShape:setShaderVector( 1, -1, 0, 0, 0 )
									ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgStateShapeFrame5( ImgStateShape, event )
								return 
							else
								ImgStateShape:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ImgStateShape:setAlpha( 0.82 )
								ImgStateShape:setShaderVector( 1, 0.14, 0, 0, 0 )
								ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgStateShapeFrame4( ImgStateShape, event )
							return 
						else
							ImgStateShape:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ImgStateShape:setAlpha( 0 )
							ImgStateShape:setShaderVector( 1, 0.29, 0, 0, 0 )
							ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShapeFrame3( ImgStateShape, event )
						return 
					else
						ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ImgStateShape:setShaderVector( 1, 0.71, 0, 0, 0 )
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame3 )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setAlpha( 1 )
				self.ImgStateShape:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
				self.ImgStateShape:setShaderVector( 0, 3, 0, 0, 0 )
				self.ImgStateShape:setShaderVector( 1, 1, 0, 0, 0 )
				self.ImgStateShape:setShaderVector( 2, 0, 0, 0, 0 )
				ImgStateShapeFrame2( ImgStateShape, {} )
				local ImgStateShape0Frame2 = function ( ImgStateShape0, event )
					local ImgStateShape0Frame3 = function ( ImgStateShape0, event )
						local ImgStateShape0Frame4 = function ( ImgStateShape0, event )
							if not event.interrupted then
								ImgStateShape0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							ImgStateShape0:setRGB( 1, 1, 1 )
							ImgStateShape0:setAlpha( 0 )
							ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
							ImgStateShape0:setShaderVector( 0, 10, 0, 0, 0 )
							ImgStateShape0:setShaderVector( 1, -0.94, 0, 0, 0 )
							ImgStateShape0:setShaderVector( 2, 0.25, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( ImgStateShape0, event )
							else
								ImgStateShape0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ImgStateShape0Frame4( ImgStateShape0, event )
							return 
						else
							ImgStateShape0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							ImgStateShape0:setAlpha( 0 )
							ImgStateShape0:setShaderVector( 1, -0.77, 0, 0, 0 )
							ImgStateShape0:registerEventHandler( "transition_complete_keyframe", ImgStateShape0Frame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShape0Frame3( ImgStateShape0, event )
						return 
					else
						ImgStateShape0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ImgStateShape0:setShaderVector( 1, 0.43, 0, 0, 0 )
						ImgStateShape0:registerEventHandler( "transition_complete_keyframe", ImgStateShape0Frame3 )
					end
				end
				
				ImgStateShape0:completeAnimation()
				self.ImgStateShape0:setRGB( 1, 1, 1 )
				self.ImgStateShape0:setAlpha( 1 )
				self.ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
				self.ImgStateShape0:setShaderVector( 0, 10, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 1, 0.95, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 2, 0.25, 0, 0, 0 )
				ImgStateShape0Frame2( ImgStateShape0, {} )
				local ImageGlitch1Frame2 = function ( ImageGlitch1, event )
					local ImageGlitch1Frame3 = function ( ImageGlitch1, event )
						local ImageGlitch1Frame4 = function ( ImageGlitch1, event )
							local ImageGlitch1Frame5 = function ( ImageGlitch1, event )
								local ImageGlitch1Frame6 = function ( ImageGlitch1, event )
									local ImageGlitch1Frame7 = function ( ImageGlitch1, event )
										local ImageGlitch1Frame8 = function ( ImageGlitch1, event )
											if not event.interrupted then
												ImageGlitch1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											ImageGlitch1:setLeftRight( true, false, 41.67, 45.67 )
											ImageGlitch1:setTopBottom( true, false, 14.16, 18.17 )
											ImageGlitch1:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( ImageGlitch1, event )
											else
												ImageGlitch1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ImageGlitch1Frame8( ImageGlitch1, event )
											return 
										else
											ImageGlitch1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											ImageGlitch1:setLeftRight( true, false, 41.67, 45.67 )
											ImageGlitch1:setTopBottom( true, false, 14.16, 18.17 )
											ImageGlitch1:setAlpha( 1 )
											ImageGlitch1:registerEventHandler( "transition_complete_keyframe", ImageGlitch1Frame8 )
										end
									end
									
									if event.interrupted then
										ImageGlitch1Frame7( ImageGlitch1, event )
										return 
									else
										ImageGlitch1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										ImageGlitch1:setLeftRight( true, false, 4.67, 19 )
										ImageGlitch1:setTopBottom( true, false, 52.92, 53.92 )
										ImageGlitch1:registerEventHandler( "transition_complete_keyframe", ImageGlitch1Frame7 )
									end
								end
								
								if event.interrupted then
									ImageGlitch1Frame6( ImageGlitch1, event )
									return 
								else
									ImageGlitch1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ImageGlitch1:setAlpha( 0 )
									ImageGlitch1:registerEventHandler( "transition_complete_keyframe", ImageGlitch1Frame6 )
								end
							end
							
							if event.interrupted then
								ImageGlitch1Frame5( ImageGlitch1, event )
								return 
							else
								ImageGlitch1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ImageGlitch1:setLeftRight( true, false, 4.66, 19 )
								ImageGlitch1:setTopBottom( true, false, 52.92, 53.92 )
								ImageGlitch1:setAlpha( 1 )
								ImageGlitch1:registerEventHandler( "transition_complete_keyframe", ImageGlitch1Frame5 )
							end
						end
						
						if event.interrupted then
							ImageGlitch1Frame4( ImageGlitch1, event )
							return 
						else
							ImageGlitch1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ImageGlitch1:setTopBottom( true, false, 47.92, 49.92 )
							ImageGlitch1:registerEventHandler( "transition_complete_keyframe", ImageGlitch1Frame4 )
						end
					end
					
					if event.interrupted then
						ImageGlitch1Frame3( ImageGlitch1, event )
						return 
					else
						ImageGlitch1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ImageGlitch1:setAlpha( 0 )
						ImageGlitch1:registerEventHandler( "transition_complete_keyframe", ImageGlitch1Frame3 )
					end
				end
				
				ImageGlitch1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				ImageGlitch1:setLeftRight( true, false, -27, 24 )
				ImageGlitch1:setTopBottom( true, false, 47.92, 49.92 )
				ImageGlitch1:setAlpha( 1 )
				ImageGlitch1:registerEventHandler( "transition_complete_keyframe", ImageGlitch1Frame2 )
				local ImageGlitch2Frame2 = function ( ImageGlitch2, event )
					local ImageGlitch2Frame3 = function ( ImageGlitch2, event )
						local ImageGlitch2Frame4 = function ( ImageGlitch2, event )
							local ImageGlitch2Frame5 = function ( ImageGlitch2, event )
								local ImageGlitch2Frame6 = function ( ImageGlitch2, event )
									local ImageGlitch2Frame7 = function ( ImageGlitch2, event )
										local ImageGlitch2Frame8 = function ( ImageGlitch2, event )
											if not event.interrupted then
												ImageGlitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											ImageGlitch2:setLeftRight( true, false, 41.67, 45.67 )
											ImageGlitch2:setTopBottom( true, false, 38.17, 42.17 )
											ImageGlitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( ImageGlitch2, event )
											else
												ImageGlitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ImageGlitch2Frame8( ImageGlitch2, event )
											return 
										else
											ImageGlitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											ImageGlitch2:setLeftRight( true, false, 41.67, 45.67 )
											ImageGlitch2:setTopBottom( true, false, 38.17, 42.17 )
											ImageGlitch2:setAlpha( 1 )
											ImageGlitch2:registerEventHandler( "transition_complete_keyframe", ImageGlitch2Frame8 )
										end
									end
									
									if event.interrupted then
										ImageGlitch2Frame7( ImageGlitch2, event )
										return 
									else
										ImageGlitch2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										ImageGlitch2:setLeftRight( true, false, 23.67, 36.67 )
										ImageGlitch2:setTopBottom( true, false, 8.17, 45.17 )
										ImageGlitch2:registerEventHandler( "transition_complete_keyframe", ImageGlitch2Frame7 )
									end
								end
								
								if event.interrupted then
									ImageGlitch2Frame6( ImageGlitch2, event )
									return 
								else
									ImageGlitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ImageGlitch2:setAlpha( 0 )
									ImageGlitch2:registerEventHandler( "transition_complete_keyframe", ImageGlitch2Frame6 )
								end
							end
							
							if event.interrupted then
								ImageGlitch2Frame5( ImageGlitch2, event )
								return 
							else
								ImageGlitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ImageGlitch2:setLeftRight( true, false, 23.67, 36.67 )
								ImageGlitch2:setTopBottom( true, false, 8.16, 45.17 )
								ImageGlitch2:setAlpha( 1 )
								ImageGlitch2:registerEventHandler( "transition_complete_keyframe", ImageGlitch2Frame5 )
							end
						end
						
						if event.interrupted then
							ImageGlitch2Frame4( ImageGlitch2, event )
							return 
						else
							ImageGlitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ImageGlitch2:setTopBottom( true, false, 6.92, 8.92 )
							ImageGlitch2:registerEventHandler( "transition_complete_keyframe", ImageGlitch2Frame4 )
						end
					end
					
					if event.interrupted then
						ImageGlitch2Frame3( ImageGlitch2, event )
						return 
					else
						ImageGlitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ImageGlitch2:setAlpha( 0 )
						ImageGlitch2:registerEventHandler( "transition_complete_keyframe", ImageGlitch2Frame3 )
					end
				end
				
				ImageGlitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				ImageGlitch2:setLeftRight( true, false, -27, 24 )
				ImageGlitch2:setTopBottom( true, false, 6.92, 8.92 )
				ImageGlitch2:setAlpha( 1 )
				ImageGlitch2:registerEventHandler( "transition_complete_keyframe", ImageGlitch2Frame2 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

