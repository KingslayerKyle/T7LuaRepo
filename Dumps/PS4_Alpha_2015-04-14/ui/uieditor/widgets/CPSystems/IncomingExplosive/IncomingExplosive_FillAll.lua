require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosive_FillTriangle" )

CoD.IncomingExplosive_FillAll = InheritFrom( LUI.UIElement )
CoD.IncomingExplosive_FillAll.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IncomingExplosive_FillAll )
	self.id = "IncomingExplosive_FillAll"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 161 )
	self:setTopBottom( true, false, 0, 121 )
	self.anyChildUsesUpdateState = true
	
	local Fill1a = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill1a:setLeftRight( true, false, 23, 87 )
	Fill1a:setTopBottom( true, false, 0, 36 )
	Fill1a:setRGB( 1, 1, 1 )
	self:addElement( Fill1a )
	self.Fill1a = Fill1a
	
	local Fill1b = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill1b:setLeftRight( true, false, 74, 138 )
	Fill1b:setTopBottom( true, false, 0, 36 )
	Fill1b:setRGB( 1, 1, 1 )
	Fill1b:setYRot( -180 )
	Fill1b.Image00:setZoom( -100 )
	self:addElement( Fill1b )
	self.Fill1b = Fill1b
	
	local Fill2a = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill2a:setLeftRight( true, false, 97, 161 )
	Fill2a:setTopBottom( true, false, 41, 77 )
	Fill2a:setRGB( 1, 1, 1 )
	Fill2a:setZRot( -120 )
	self:addElement( Fill2a )
	self.Fill2a = Fill2a
	
	local Fill2b = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill2b:setLeftRight( true, false, 72, 136 )
	Fill2b:setTopBottom( true, false, 84.5, 120.5 )
	Fill2b:setRGB( 1, 1, 1 )
	Fill2b:setYRot( -180 )
	Fill2b:setZRot( -240 )
	Fill2b.Image00:setZoom( -100 )
	self:addElement( Fill2b )
	self.Fill2b = Fill2b
	
	local Fill3a = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill3a:setLeftRight( true, false, 0, 64 )
	Fill3a:setTopBottom( true, false, 41, 77 )
	Fill3a:setRGB( 1, 1, 1 )
	Fill3a:setYRot( -180 )
	Fill3a:setZRot( -120 )
	Fill3a.Image00:setZoom( -100 )
	self:addElement( Fill3a )
	self.Fill3a = Fill3a
	
	local Fill3b = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill3b:setLeftRight( true, false, 25, 89 )
	Fill3b:setTopBottom( true, false, 84.5, 120.5 )
	Fill3b:setRGB( 1, 1, 1 )
	Fill3b:setZRot( -240 )
	self:addElement( Fill3b )
	self.Fill3b = Fill3b
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 18.5, 142.5 )
	Image0:setTopBottom( true, false, 22.98, 122.98 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_elmtri" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Fill1a:completeAnimation()
				self.Fill1a:setAlpha( 0 )
				self.clipFinished( Fill1a, {} )
				Fill1b:completeAnimation()
				self.Fill1b:setAlpha( 0 )
				self.clipFinished( Fill1b, {} )
				Fill2a:completeAnimation()
				self.Fill2a:setAlpha( 0 )
				self.clipFinished( Fill2a, {} )
				Fill2b:completeAnimation()
				self.Fill2b:setAlpha( 0 )
				self.clipFinished( Fill2b, {} )
				Fill3a:completeAnimation()
				self.Fill3a:setAlpha( 0 )
				self.clipFinished( Fill3a, {} )
				Fill3b:completeAnimation()
				self.Fill3b:setAlpha( 0 )
				self.clipFinished( Fill3b, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Count3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local Fill1aFrame2 = function ( Fill1a, event )
					local Fill1aFrame3 = function ( Fill1a, event )
						local Fill1aFrame4 = function ( Fill1a, event )
							local Fill1aFrame5 = function ( Fill1a, event )
								local Fill1aFrame6 = function ( Fill1a, event )
									if not event.interrupted then
										Fill1a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									Fill1a:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Fill1a, event )
									else
										Fill1a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Fill1aFrame6( Fill1a, event )
									return 
								else
									Fill1a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill1aFrame5( Fill1a, event )
								return 
							else
								Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill1a:setAlpha( 0 )
								Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill1aFrame4( Fill1a, event )
							return 
						else
							Fill1a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill1aFrame3( Fill1a, event )
						return 
					else
						Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill1a:setAlpha( 0.5 )
						Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame3 )
					end
				end
				
				Fill1a:completeAnimation()
				self.Fill1a:setAlpha( 0 )
				Fill1aFrame2( Fill1a, {} )
				local Fill1bFrame2 = function ( Fill1b, event )
					local Fill1bFrame3 = function ( Fill1b, event )
						local Fill1bFrame4 = function ( Fill1b, event )
							local Fill1bFrame5 = function ( Fill1b, event )
								local Fill1bFrame6 = function ( Fill1b, event )
									local Fill1bFrame7 = function ( Fill1b, event )
										if not event.interrupted then
											Fill1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										Fill1b:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Fill1b, event )
										else
											Fill1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Fill1bFrame7( Fill1b, event )
										return 
									else
										Fill1b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill1bFrame6( Fill1b, event )
									return 
								else
									Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Fill1b:setAlpha( 0 )
									Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill1bFrame5( Fill1b, event )
								return 
							else
								Fill1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill1bFrame4( Fill1b, event )
							return 
						else
							Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill1b:setAlpha( 0.5 )
							Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill1bFrame3( Fill1b, event )
						return 
					else
						Fill1b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame3 )
					end
				end
				
				Fill1b:completeAnimation()
				self.Fill1b:setAlpha( 0 )
				Fill1bFrame2( Fill1b, {} )
				Fill2a:completeAnimation()
				self.Fill2a:setAlpha( 0 )
				self.clipFinished( Fill2a, {} )
				Fill2b:completeAnimation()
				self.Fill2b:setAlpha( 0 )
				self.clipFinished( Fill2b, {} )
				Fill3a:completeAnimation()
				self.Fill3a:setAlpha( 0 )
				self.clipFinished( Fill3a, {} )
				Fill3b:completeAnimation()
				self.Fill3b:setAlpha( 0 )
				self.clipFinished( Fill3b, {} )
			end
		},
		Count2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Fill1a:completeAnimation()
				self.Fill1a:setAlpha( 1 )
				self.clipFinished( Fill1a, {} )
				Fill1b:completeAnimation()
				self.Fill1b:setAlpha( 1 )
				self.clipFinished( Fill1b, {} )
				local Fill2aFrame2 = function ( Fill2a, event )
					local Fill2aFrame3 = function ( Fill2a, event )
						local Fill2aFrame4 = function ( Fill2a, event )
							local Fill2aFrame5 = function ( Fill2a, event )
								local Fill2aFrame6 = function ( Fill2a, event )
									if not event.interrupted then
										Fill2a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									Fill2a:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Fill2a, event )
									else
										Fill2a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Fill2aFrame6( Fill2a, event )
									return 
								else
									Fill2a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill2aFrame5( Fill2a, event )
								return 
							else
								Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill2a:setAlpha( 0 )
								Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill2aFrame4( Fill2a, event )
							return 
						else
							Fill2a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill2aFrame3( Fill2a, event )
						return 
					else
						Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill2a:setAlpha( 0.5 )
						Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame3 )
					end
				end
				
				Fill2a:completeAnimation()
				self.Fill2a:setAlpha( 0 )
				Fill2aFrame2( Fill2a, {} )
				local Fill2bFrame2 = function ( Fill2b, event )
					local Fill2bFrame3 = function ( Fill2b, event )
						local Fill2bFrame4 = function ( Fill2b, event )
							local Fill2bFrame5 = function ( Fill2b, event )
								local Fill2bFrame6 = function ( Fill2b, event )
									local Fill2bFrame7 = function ( Fill2b, event )
										if not event.interrupted then
											Fill2b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										Fill2b:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Fill2b, event )
										else
											Fill2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Fill2bFrame7( Fill2b, event )
										return 
									else
										Fill2b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill2bFrame6( Fill2b, event )
									return 
								else
									Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Fill2b:setAlpha( 0 )
									Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill2bFrame5( Fill2b, event )
								return 
							else
								Fill2b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill2bFrame4( Fill2b, event )
							return 
						else
							Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill2b:setAlpha( 0.5 )
							Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill2bFrame3( Fill2b, event )
						return 
					else
						Fill2b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame3 )
					end
				end
				
				Fill2b:completeAnimation()
				self.Fill2b:setAlpha( 0 )
				Fill2bFrame2( Fill2b, {} )
				Fill3a:completeAnimation()
				self.Fill3a:setAlpha( 0 )
				self.clipFinished( Fill3a, {} )
				Fill3b:completeAnimation()
				self.Fill3b:setAlpha( 0 )
				self.clipFinished( Fill3b, {} )
			end,
			Count1 = function ()
				self:setupElementClipCounter( 6 )
				Fill1a:completeAnimation()
				self.Fill1a:setAlpha( 1 )
				self.clipFinished( Fill1a, {} )
				Fill1b:completeAnimation()
				self.Fill1b:setAlpha( 1 )
				self.clipFinished( Fill1b, {} )
				Fill2a:completeAnimation()
				self.Fill2a:setAlpha( 1 )
				self.clipFinished( Fill2a, {} )
				Fill2b:completeAnimation()
				self.Fill2b:setAlpha( 1 )
				self.clipFinished( Fill2b, {} )
				local Fill3aFrame2 = function ( Fill3a, event )
					local Fill3aFrame3 = function ( Fill3a, event )
						local Fill3aFrame4 = function ( Fill3a, event )
							local Fill3aFrame5 = function ( Fill3a, event )
								local Fill3aFrame6 = function ( Fill3a, event )
									if not event.interrupted then
										Fill3a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									Fill3a:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Fill3a, event )
									else
										Fill3a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Fill3aFrame6( Fill3a, event )
									return 
								else
									Fill3a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill3aFrame5( Fill3a, event )
								return 
							else
								Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill3a:setAlpha( 0 )
								Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill3aFrame4( Fill3a, event )
							return 
						else
							Fill3a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill3aFrame3( Fill3a, event )
						return 
					else
						Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill3a:setAlpha( 0.5 )
						Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame3 )
					end
				end
				
				Fill3a:completeAnimation()
				self.Fill3a:setAlpha( 0 )
				Fill3aFrame2( Fill3a, {} )
				local Fill3bFrame2 = function ( Fill3b, event )
					local Fill3bFrame3 = function ( Fill3b, event )
						local Fill3bFrame4 = function ( Fill3b, event )
							local Fill3bFrame5 = function ( Fill3b, event )
								local Fill3bFrame6 = function ( Fill3b, event )
									local Fill3bFrame7 = function ( Fill3b, event )
										if not event.interrupted then
											Fill3b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										Fill3b:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Fill3b, event )
										else
											Fill3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Fill3bFrame7( Fill3b, event )
										return 
									else
										Fill3b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill3bFrame6( Fill3b, event )
									return 
								else
									Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Fill3b:setAlpha( 0 )
									Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill3bFrame5( Fill3b, event )
								return 
							else
								Fill3b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill3bFrame4( Fill3b, event )
							return 
						else
							Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill3b:setAlpha( 0.5 )
							Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill3bFrame3( Fill3b, event )
						return 
					else
						Fill3b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame3 )
					end
				end
				
				Fill3b:completeAnimation()
				self.Fill3b:setAlpha( 0 )
				Fill3bFrame2( Fill3b, {} )
			end
		},
		Count1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local Fill1aFrame2 = function ( Fill1a, event )
					local Fill1aFrame3 = function ( Fill1a, event )
						local Fill1aFrame4 = function ( Fill1a, event )
							local Fill1aFrame5 = function ( Fill1a, event )
								local Fill1aFrame6 = function ( Fill1a, event )
									local Fill1aFrame7 = function ( Fill1a, event )
										local Fill1aFrame8 = function ( Fill1a, event )
											local Fill1aFrame9 = function ( Fill1a, event )
												local Fill1aFrame10 = function ( Fill1a, event )
													if not event.interrupted then
														Fill1a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													end
													Fill1a:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Fill1a, event )
													else
														Fill1a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Fill1aFrame10( Fill1a, event )
													return 
												else
													Fill1a:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
													Fill1a:setAlpha( 0 )
													Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame10 )
												end
											end
											
											if event.interrupted then
												Fill1aFrame9( Fill1a, event )
												return 
											else
												Fill1a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame9 )
											end
										end
										
										if event.interrupted then
											Fill1aFrame8( Fill1a, event )
											return 
										else
											Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Fill1a:setAlpha( 1 )
											Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame8 )
										end
									end
									
									if event.interrupted then
										Fill1aFrame7( Fill1a, event )
										return 
									else
										Fill1a:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame7 )
									end
								end
								
								if event.interrupted then
									Fill1aFrame6( Fill1a, event )
									return 
								else
									Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Fill1a:setAlpha( 0 )
									Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill1aFrame5( Fill1a, event )
								return 
							else
								Fill1a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill1aFrame4( Fill1a, event )
							return 
						else
							Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill1a:setAlpha( 0.5 )
							Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill1aFrame3( Fill1a, event )
						return 
					else
						Fill1a:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Fill1a:setAlpha( 0 )
						Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame3 )
					end
				end
				
				Fill1a:completeAnimation()
				self.Fill1a:setAlpha( 1 )
				Fill1aFrame2( Fill1a, {} )
				local Fill1bFrame2 = function ( Fill1b, event )
					local Fill1bFrame3 = function ( Fill1b, event )
						local Fill1bFrame4 = function ( Fill1b, event )
							local Fill1bFrame5 = function ( Fill1b, event )
								local Fill1bFrame6 = function ( Fill1b, event )
									local Fill1bFrame7 = function ( Fill1b, event )
										local Fill1bFrame8 = function ( Fill1b, event )
											if not event.interrupted then
												Fill1b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											Fill1b:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( Fill1b, event )
											else
												Fill1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Fill1bFrame8( Fill1b, event )
											return 
										else
											Fill1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame8 )
										end
									end
									
									if event.interrupted then
										Fill1bFrame7( Fill1b, event )
										return 
									else
										Fill1b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Fill1b:setAlpha( 1 )
										Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill1bFrame6( Fill1b, event )
									return 
								else
									Fill1b:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill1bFrame5( Fill1b, event )
								return 
							else
								Fill1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill1b:setAlpha( 0 )
								Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill1bFrame4( Fill1b, event )
							return 
						else
							Fill1b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill1bFrame3( Fill1b, event )
						return 
					else
						Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill1b:setAlpha( 0.5 )
						Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame3 )
					end
				end
				
				Fill1b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Fill1b:setAlpha( 1 )
				Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame2 )
				local Fill2aFrame2 = function ( Fill2a, event )
					local Fill2aFrame3 = function ( Fill2a, event )
						local Fill2aFrame4 = function ( Fill2a, event )
							local Fill2aFrame5 = function ( Fill2a, event )
								local Fill2aFrame6 = function ( Fill2a, event )
									local Fill2aFrame7 = function ( Fill2a, event )
										local Fill2aFrame8 = function ( Fill2a, event )
											local Fill2aFrame9 = function ( Fill2a, event )
												local Fill2aFrame10 = function ( Fill2a, event )
													if not event.interrupted then
														Fill2a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													end
													Fill2a:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Fill2a, event )
													else
														Fill2a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Fill2aFrame10( Fill2a, event )
													return 
												else
													Fill2a:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
													Fill2a:setAlpha( 0 )
													Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame10 )
												end
											end
											
											if event.interrupted then
												Fill2aFrame9( Fill2a, event )
												return 
											else
												Fill2a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame9 )
											end
										end
										
										if event.interrupted then
											Fill2aFrame8( Fill2a, event )
											return 
										else
											Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Fill2a:setAlpha( 1 )
											Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame8 )
										end
									end
									
									if event.interrupted then
										Fill2aFrame7( Fill2a, event )
										return 
									else
										Fill2a:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame7 )
									end
								end
								
								if event.interrupted then
									Fill2aFrame6( Fill2a, event )
									return 
								else
									Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Fill2a:setAlpha( 0 )
									Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill2aFrame5( Fill2a, event )
								return 
							else
								Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill2aFrame4( Fill2a, event )
							return 
						else
							Fill2a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Fill2a:setAlpha( 0.5 )
							Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill2aFrame3( Fill2a, event )
						return 
					else
						Fill2a:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Fill2a:setAlpha( 0 )
						Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame3 )
					end
				end
				
				Fill2a:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				Fill2a:setAlpha( 1 )
				Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame2 )
				local Fill2bFrame2 = function ( Fill2b, event )
					local Fill2bFrame3 = function ( Fill2b, event )
						local Fill2bFrame4 = function ( Fill2b, event )
							local Fill2bFrame5 = function ( Fill2b, event )
								local Fill2bFrame6 = function ( Fill2b, event )
									local Fill2bFrame7 = function ( Fill2b, event )
										local Fill2bFrame8 = function ( Fill2b, event )
											if not event.interrupted then
												Fill2b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											Fill2b:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( Fill2b, event )
											else
												Fill2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Fill2bFrame8( Fill2b, event )
											return 
										else
											Fill2b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame8 )
										end
									end
									
									if event.interrupted then
										Fill2bFrame7( Fill2b, event )
										return 
									else
										Fill2b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Fill2b:setAlpha( 1 )
										Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill2bFrame6( Fill2b, event )
									return 
								else
									Fill2b:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill2bFrame5( Fill2b, event )
								return 
							else
								Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill2b:setAlpha( 0 )
								Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill2bFrame4( Fill2b, event )
							return 
						else
							Fill2b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill2bFrame3( Fill2b, event )
						return 
					else
						Fill2b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						Fill2b:setAlpha( 0.5 )
						Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame3 )
					end
				end
				
				Fill2b:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				Fill2b:setAlpha( 1 )
				Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame2 )
				local Fill3aFrame2 = function ( Fill3a, event )
					local Fill3aFrame3 = function ( Fill3a, event )
						local Fill3aFrame4 = function ( Fill3a, event )
							local Fill3aFrame5 = function ( Fill3a, event )
								local Fill3aFrame6 = function ( Fill3a, event )
									local Fill3aFrame7 = function ( Fill3a, event )
										if not event.interrupted then
											Fill3a:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										Fill3a:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Fill3a, event )
										else
											Fill3a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Fill3aFrame7( Fill3a, event )
										return 
									else
										Fill3a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Fill3a:setAlpha( 1 )
										Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame7 )
									end
								end
								
								if event.interrupted then
									Fill3aFrame6( Fill3a, event )
									return 
								else
									Fill3a:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill3aFrame5( Fill3a, event )
								return 
							else
								Fill3a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill3a:setAlpha( 0 )
								Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill3aFrame4( Fill3a, event )
							return 
						else
							Fill3a:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill3aFrame3( Fill3a, event )
						return 
					else
						Fill3a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						Fill3a:setAlpha( 0.5 )
						Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame3 )
					end
				end
				
				Fill3a:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				Fill3a:setAlpha( 1 )
				Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame2 )
				local Fill3bFrame2 = function ( Fill3b, event )
					local Fill3bFrame3 = function ( Fill3b, event )
						local Fill3bFrame4 = function ( Fill3b, event )
							local Fill3bFrame5 = function ( Fill3b, event )
								local Fill3bFrame6 = function ( Fill3b, event )
									local Fill3bFrame7 = function ( Fill3b, event )
										local Fill3bFrame8 = function ( Fill3b, event )
											local Fill3bFrame9 = function ( Fill3b, event )
												local Fill3bFrame10 = function ( Fill3b, event )
													if not event.interrupted then
														Fill3b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													end
													Fill3b:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Fill3b, event )
													else
														Fill3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Fill3bFrame10( Fill3b, event )
													return 
												else
													Fill3b:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
													Fill3b:setAlpha( 0 )
													Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame10 )
												end
											end
											
											if event.interrupted then
												Fill3bFrame9( Fill3b, event )
												return 
											else
												Fill3b:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame9 )
											end
										end
										
										if event.interrupted then
											Fill3bFrame8( Fill3b, event )
											return 
										else
											Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Fill3b:setAlpha( 1 )
											Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame8 )
										end
									end
									
									if event.interrupted then
										Fill3bFrame7( Fill3b, event )
										return 
									else
										Fill3b:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill3bFrame6( Fill3b, event )
									return 
								else
									Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Fill3b:setAlpha( 0 )
									Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill3bFrame5( Fill3b, event )
								return 
							else
								Fill3b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill3bFrame4( Fill3b, event )
							return 
						else
							Fill3b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Fill3b:setAlpha( 0.5 )
							Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill3bFrame3( Fill3b, event )
						return 
					else
						Fill3b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Fill3b:setAlpha( 0 )
						Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame3 )
					end
				end
				
				Fill3b:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				Fill3b:setAlpha( 1 )
				Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame2 )
				self.nextClip = "DefaultClip"
			end
		},
		Count0 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local Fill1aFrame2 = function ( Fill1a, event )
					local Fill1aFrame3 = function ( Fill1a, event )
						local Fill1aFrame4 = function ( Fill1a, event )
							local Fill1aFrame5 = function ( Fill1a, event )
								local Fill1aFrame6 = function ( Fill1a, event )
									local Fill1aFrame7 = function ( Fill1a, event )
										local Fill1aFrame8 = function ( Fill1a, event )
											local Fill1aFrame9 = function ( Fill1a, event )
												local Fill1aFrame10 = function ( Fill1a, event )
													local Fill1aFrame11 = function ( Fill1a, event )
														local Fill1aFrame12 = function ( Fill1a, event )
															local Fill1aFrame13 = function ( Fill1a, event )
																local Fill1aFrame14 = function ( Fill1a, event )
																	local Fill1aFrame15 = function ( Fill1a, event )
																		local Fill1aFrame16 = function ( Fill1a, event )
																			local Fill1aFrame17 = function ( Fill1a, event )
																				if not event.interrupted then
																					Fill1a:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				Fill1a:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( Fill1a, event )
																				else
																					Fill1a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				Fill1aFrame17( Fill1a, event )
																				return 
																			else
																				Fill1a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				Fill1a:setAlpha( 0.35 )
																				Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Fill1aFrame16( Fill1a, event )
																			return 
																		else
																			Fill1a:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Fill1aFrame15( Fill1a, event )
																		return 
																	else
																		Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Fill1a:setAlpha( 0 )
																		Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame15 )
																	end
																end
																
																if event.interrupted then
																	Fill1aFrame14( Fill1a, event )
																	return 
																else
																	Fill1a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	Fill1a:setAlpha( 0.44 )
																	Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame14 )
																end
															end
															
															if event.interrupted then
																Fill1aFrame13( Fill1a, event )
																return 
															else
																Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Fill1a:setAlpha( 0.5 )
																Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame13 )
															end
														end
														
														if event.interrupted then
															Fill1aFrame12( Fill1a, event )
															return 
														else
															Fill1a:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame12 )
														end
													end
													
													if event.interrupted then
														Fill1aFrame11( Fill1a, event )
														return 
													else
														Fill1a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Fill1a:setAlpha( 0 )
														Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame11 )
													end
												end
												
												if event.interrupted then
													Fill1aFrame10( Fill1a, event )
													return 
												else
													Fill1a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame10 )
												end
											end
											
											if event.interrupted then
												Fill1aFrame9( Fill1a, event )
												return 
											else
												Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Fill1a:setAlpha( 1 )
												Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame9 )
											end
										end
										
										if event.interrupted then
											Fill1aFrame8( Fill1a, event )
											return 
										else
											Fill1a:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame8 )
										end
									end
									
									if event.interrupted then
										Fill1aFrame7( Fill1a, event )
										return 
									else
										Fill1a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Fill1a:setAlpha( 0 )
										Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame7 )
									end
								end
								
								if event.interrupted then
									Fill1aFrame6( Fill1a, event )
									return 
								else
									Fill1a:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill1aFrame5( Fill1a, event )
								return 
							else
								Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill1a:setAlpha( 1 )
								Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill1aFrame4( Fill1a, event )
							return 
						else
							Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill1aFrame3( Fill1a, event )
						return 
					else
						Fill1a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill1a:setAlpha( 0.5 )
						Fill1a:registerEventHandler( "transition_complete_keyframe", Fill1aFrame3 )
					end
				end
				
				Fill1a:completeAnimation()
				self.Fill1a:setAlpha( 1 )
				Fill1aFrame2( Fill1a, {} )
				local Fill1bFrame2 = function ( Fill1b, event )
					local Fill1bFrame3 = function ( Fill1b, event )
						local Fill1bFrame4 = function ( Fill1b, event )
							local Fill1bFrame5 = function ( Fill1b, event )
								local Fill1bFrame6 = function ( Fill1b, event )
									local Fill1bFrame7 = function ( Fill1b, event )
										local Fill1bFrame8 = function ( Fill1b, event )
											local Fill1bFrame9 = function ( Fill1b, event )
												local Fill1bFrame10 = function ( Fill1b, event )
													local Fill1bFrame11 = function ( Fill1b, event )
														local Fill1bFrame12 = function ( Fill1b, event )
															local Fill1bFrame13 = function ( Fill1b, event )
																local Fill1bFrame14 = function ( Fill1b, event )
																	local Fill1bFrame15 = function ( Fill1b, event )
																		local Fill1bFrame16 = function ( Fill1b, event )
																			local Fill1bFrame17 = function ( Fill1b, event )
																				if not event.interrupted then
																					Fill1b:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				Fill1b:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( Fill1b, event )
																				else
																					Fill1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				Fill1bFrame17( Fill1b, event )
																				return 
																			else
																				Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				Fill1b:setAlpha( 0.35 )
																				Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Fill1bFrame16( Fill1b, event )
																			return 
																		else
																			Fill1b:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Fill1bFrame15( Fill1b, event )
																		return 
																	else
																		Fill1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		Fill1b:setAlpha( 0 )
																		Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame15 )
																	end
																end
																
																if event.interrupted then
																	Fill1bFrame14( Fill1b, event )
																	return 
																else
																	Fill1b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame14 )
																end
															end
															
															if event.interrupted then
																Fill1bFrame13( Fill1b, event )
																return 
															else
																Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Fill1b:setAlpha( 0.5 )
																Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame13 )
															end
														end
														
														if event.interrupted then
															Fill1bFrame12( Fill1b, event )
															return 
														else
															Fill1b:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame12 )
														end
													end
													
													if event.interrupted then
														Fill1bFrame11( Fill1b, event )
														return 
													else
														Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Fill1b:setAlpha( 0 )
														Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame11 )
													end
												end
												
												if event.interrupted then
													Fill1bFrame10( Fill1b, event )
													return 
												else
													Fill1b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame10 )
												end
											end
											
											if event.interrupted then
												Fill1bFrame9( Fill1b, event )
												return 
											else
												Fill1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Fill1b:setAlpha( 1 )
												Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame9 )
											end
										end
										
										if event.interrupted then
											Fill1bFrame8( Fill1b, event )
											return 
										else
											Fill1b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame8 )
										end
									end
									
									if event.interrupted then
										Fill1bFrame7( Fill1b, event )
										return 
									else
										Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Fill1b:setAlpha( 0 )
										Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill1bFrame6( Fill1b, event )
									return 
								else
									Fill1b:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill1bFrame5( Fill1b, event )
								return 
							else
								Fill1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Fill1b:setAlpha( 1 )
								Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill1bFrame4( Fill1b, event )
							return 
						else
							Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill1bFrame3( Fill1b, event )
						return 
					else
						Fill1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill1b:setAlpha( 0.5 )
						Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame3 )
					end
				end
				
				Fill1b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Fill1b:setAlpha( 1 )
				Fill1b:registerEventHandler( "transition_complete_keyframe", Fill1bFrame2 )
				local Fill2aFrame2 = function ( Fill2a, event )
					local Fill2aFrame3 = function ( Fill2a, event )
						local Fill2aFrame4 = function ( Fill2a, event )
							local Fill2aFrame5 = function ( Fill2a, event )
								local Fill2aFrame6 = function ( Fill2a, event )
									local Fill2aFrame7 = function ( Fill2a, event )
										local Fill2aFrame8 = function ( Fill2a, event )
											local Fill2aFrame9 = function ( Fill2a, event )
												local Fill2aFrame10 = function ( Fill2a, event )
													local Fill2aFrame11 = function ( Fill2a, event )
														local Fill2aFrame12 = function ( Fill2a, event )
															local Fill2aFrame13 = function ( Fill2a, event )
																local Fill2aFrame14 = function ( Fill2a, event )
																	local Fill2aFrame15 = function ( Fill2a, event )
																		local Fill2aFrame16 = function ( Fill2a, event )
																			local Fill2aFrame17 = function ( Fill2a, event )
																				if not event.interrupted then
																					Fill2a:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				Fill2a:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( Fill2a, event )
																				else
																					Fill2a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				Fill2aFrame17( Fill2a, event )
																				return 
																			else
																				Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				Fill2a:setAlpha( 0.35 )
																				Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Fill2aFrame16( Fill2a, event )
																			return 
																		else
																			Fill2a:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																			Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Fill2aFrame15( Fill2a, event )
																		return 
																	else
																		Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Fill2a:setAlpha( 0 )
																		Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame15 )
																	end
																end
																
																if event.interrupted then
																	Fill2aFrame14( Fill2a, event )
																	return 
																else
																	Fill2a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame14 )
																end
															end
															
															if event.interrupted then
																Fill2aFrame13( Fill2a, event )
																return 
															else
																Fill2a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																Fill2a:setAlpha( 0.5 )
																Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame13 )
															end
														end
														
														if event.interrupted then
															Fill2aFrame12( Fill2a, event )
															return 
														else
															Fill2a:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame12 )
														end
													end
													
													if event.interrupted then
														Fill2aFrame11( Fill2a, event )
														return 
													else
														Fill2a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Fill2a:setAlpha( 0 )
														Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame11 )
													end
												end
												
												if event.interrupted then
													Fill2aFrame10( Fill2a, event )
													return 
												else
													Fill2a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame10 )
												end
											end
											
											if event.interrupted then
												Fill2aFrame9( Fill2a, event )
												return 
											else
												Fill2a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Fill2a:setAlpha( 1 )
												Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame9 )
											end
										end
										
										if event.interrupted then
											Fill2aFrame8( Fill2a, event )
											return 
										else
											Fill2a:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame8 )
										end
									end
									
									if event.interrupted then
										Fill2aFrame7( Fill2a, event )
										return 
									else
										Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Fill2a:setAlpha( 0 )
										Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame7 )
									end
								end
								
								if event.interrupted then
									Fill2aFrame6( Fill2a, event )
									return 
								else
									Fill2a:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill2aFrame5( Fill2a, event )
								return 
							else
								Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill2a:setAlpha( 1 )
								Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill2aFrame4( Fill2a, event )
							return 
						else
							Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill2aFrame3( Fill2a, event )
						return 
					else
						Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill2a:setAlpha( 0.5 )
						Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame3 )
					end
				end
				
				Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Fill2a:setAlpha( 1 )
				Fill2a:registerEventHandler( "transition_complete_keyframe", Fill2aFrame2 )
				local Fill2bFrame2 = function ( Fill2b, event )
					local Fill2bFrame3 = function ( Fill2b, event )
						local Fill2bFrame4 = function ( Fill2b, event )
							local Fill2bFrame5 = function ( Fill2b, event )
								local Fill2bFrame6 = function ( Fill2b, event )
									local Fill2bFrame7 = function ( Fill2b, event )
										local Fill2bFrame8 = function ( Fill2b, event )
											local Fill2bFrame9 = function ( Fill2b, event )
												local Fill2bFrame10 = function ( Fill2b, event )
													local Fill2bFrame11 = function ( Fill2b, event )
														local Fill2bFrame12 = function ( Fill2b, event )
															local Fill2bFrame13 = function ( Fill2b, event )
																local Fill2bFrame14 = function ( Fill2b, event )
																	local Fill2bFrame15 = function ( Fill2b, event )
																		local Fill2bFrame16 = function ( Fill2b, event )
																			local Fill2bFrame17 = function ( Fill2b, event )
																				if not event.interrupted then
																					Fill2b:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				Fill2b:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( Fill2b, event )
																				else
																					Fill2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				Fill2bFrame17( Fill2b, event )
																				return 
																			else
																				Fill2b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				Fill2b:setAlpha( 0.35 )
																				Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Fill2bFrame16( Fill2b, event )
																			return 
																		else
																			Fill2b:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Fill2bFrame15( Fill2b, event )
																		return 
																	else
																		Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Fill2b:setAlpha( 0 )
																		Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame15 )
																	end
																end
																
																if event.interrupted then
																	Fill2bFrame14( Fill2b, event )
																	return 
																else
																	Fill2b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame14 )
																end
															end
															
															if event.interrupted then
																Fill2bFrame13( Fill2b, event )
																return 
															else
																Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Fill2b:setAlpha( 0.5 )
																Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame13 )
															end
														end
														
														if event.interrupted then
															Fill2bFrame12( Fill2b, event )
															return 
														else
															Fill2b:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame12 )
														end
													end
													
													if event.interrupted then
														Fill2bFrame11( Fill2b, event )
														return 
													else
														Fill2b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Fill2b:setAlpha( 0 )
														Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame11 )
													end
												end
												
												if event.interrupted then
													Fill2bFrame10( Fill2b, event )
													return 
												else
													Fill2b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame10 )
												end
											end
											
											if event.interrupted then
												Fill2bFrame9( Fill2b, event )
												return 
											else
												Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Fill2b:setAlpha( 1 )
												Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame9 )
											end
										end
										
										if event.interrupted then
											Fill2bFrame8( Fill2b, event )
											return 
										else
											Fill2b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame8 )
										end
									end
									
									if event.interrupted then
										Fill2bFrame7( Fill2b, event )
										return 
									else
										Fill2b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Fill2b:setAlpha( 0 )
										Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill2bFrame6( Fill2b, event )
									return 
								else
									Fill2b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill2bFrame5( Fill2b, event )
								return 
							else
								Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill2b:setAlpha( 1 )
								Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill2bFrame4( Fill2b, event )
							return 
						else
							Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill2bFrame3( Fill2b, event )
						return 
					else
						Fill2b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill2b:setAlpha( 0.5 )
						Fill2b:registerEventHandler( "transition_complete_keyframe", Fill2bFrame3 )
					end
				end
				
				Fill2b:completeAnimation()
				self.Fill2b:setAlpha( 1 )
				Fill2bFrame2( Fill2b, {} )
				local Fill3aFrame2 = function ( Fill3a, event )
					local Fill3aFrame3 = function ( Fill3a, event )
						local Fill3aFrame4 = function ( Fill3a, event )
							local Fill3aFrame5 = function ( Fill3a, event )
								local Fill3aFrame6 = function ( Fill3a, event )
									local Fill3aFrame7 = function ( Fill3a, event )
										local Fill3aFrame8 = function ( Fill3a, event )
											local Fill3aFrame9 = function ( Fill3a, event )
												local Fill3aFrame10 = function ( Fill3a, event )
													local Fill3aFrame11 = function ( Fill3a, event )
														local Fill3aFrame12 = function ( Fill3a, event )
															local Fill3aFrame13 = function ( Fill3a, event )
																local Fill3aFrame14 = function ( Fill3a, event )
																	local Fill3aFrame15 = function ( Fill3a, event )
																		local Fill3aFrame16 = function ( Fill3a, event )
																			local Fill3aFrame17 = function ( Fill3a, event )
																				if not event.interrupted then
																					Fill3a:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				Fill3a:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( Fill3a, event )
																				else
																					Fill3a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				Fill3aFrame17( Fill3a, event )
																				return 
																			else
																				Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				Fill3a:setAlpha( 0.35 )
																				Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Fill3aFrame16( Fill3a, event )
																			return 
																		else
																			Fill3a:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Fill3aFrame15( Fill3a, event )
																		return 
																	else
																		Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Fill3a:setAlpha( 0 )
																		Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame15 )
																	end
																end
																
																if event.interrupted then
																	Fill3aFrame14( Fill3a, event )
																	return 
																else
																	Fill3a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame14 )
																end
															end
															
															if event.interrupted then
																Fill3aFrame13( Fill3a, event )
																return 
															else
																Fill3a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																Fill3a:setAlpha( 0.5 )
																Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame13 )
															end
														end
														
														if event.interrupted then
															Fill3aFrame12( Fill3a, event )
															return 
														else
															Fill3a:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame12 )
														end
													end
													
													if event.interrupted then
														Fill3aFrame11( Fill3a, event )
														return 
													else
														Fill3a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Fill3a:setAlpha( 0 )
														Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame11 )
													end
												end
												
												if event.interrupted then
													Fill3aFrame10( Fill3a, event )
													return 
												else
													Fill3a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame10 )
												end
											end
											
											if event.interrupted then
												Fill3aFrame9( Fill3a, event )
												return 
											else
												Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Fill3a:setAlpha( 1 )
												Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame9 )
											end
										end
										
										if event.interrupted then
											Fill3aFrame8( Fill3a, event )
											return 
										else
											Fill3a:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame8 )
										end
									end
									
									if event.interrupted then
										Fill3aFrame7( Fill3a, event )
										return 
									else
										Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Fill3a:setAlpha( 0 )
										Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame7 )
									end
								end
								
								if event.interrupted then
									Fill3aFrame6( Fill3a, event )
									return 
								else
									Fill3a:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame6 )
								end
							end
							
							if event.interrupted then
								Fill3aFrame5( Fill3a, event )
								return 
							else
								Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill3a:setAlpha( 1 )
								Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame5 )
							end
						end
						
						if event.interrupted then
							Fill3aFrame4( Fill3a, event )
							return 
						else
							Fill3a:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame4 )
						end
					end
					
					if event.interrupted then
						Fill3aFrame3( Fill3a, event )
						return 
					else
						Fill3a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill3a:setAlpha( 0.5 )
						Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame3 )
					end
				end
				
				Fill3a:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Fill3a:setAlpha( 1 )
				Fill3a:registerEventHandler( "transition_complete_keyframe", Fill3aFrame2 )
				local Fill3bFrame2 = function ( Fill3b, event )
					local Fill3bFrame3 = function ( Fill3b, event )
						local Fill3bFrame4 = function ( Fill3b, event )
							local Fill3bFrame5 = function ( Fill3b, event )
								local Fill3bFrame6 = function ( Fill3b, event )
									local Fill3bFrame7 = function ( Fill3b, event )
										local Fill3bFrame8 = function ( Fill3b, event )
											local Fill3bFrame9 = function ( Fill3b, event )
												local Fill3bFrame10 = function ( Fill3b, event )
													local Fill3bFrame11 = function ( Fill3b, event )
														local Fill3bFrame12 = function ( Fill3b, event )
															local Fill3bFrame13 = function ( Fill3b, event )
																local Fill3bFrame14 = function ( Fill3b, event )
																	local Fill3bFrame15 = function ( Fill3b, event )
																		local Fill3bFrame16 = function ( Fill3b, event )
																			local Fill3bFrame17 = function ( Fill3b, event )
																				if not event.interrupted then
																					Fill3b:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				Fill3b:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( Fill3b, event )
																				else
																					Fill3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				Fill3bFrame17( Fill3b, event )
																				return 
																			else
																				Fill3b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				Fill3b:setAlpha( 0.35 )
																				Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Fill3bFrame16( Fill3b, event )
																			return 
																		else
																			Fill3b:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Fill3bFrame15( Fill3b, event )
																		return 
																	else
																		Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Fill3b:setAlpha( 0 )
																		Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame15 )
																	end
																end
																
																if event.interrupted then
																	Fill3bFrame14( Fill3b, event )
																	return 
																else
																	Fill3b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame14 )
																end
															end
															
															if event.interrupted then
																Fill3bFrame13( Fill3b, event )
																return 
															else
																Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Fill3b:setAlpha( 0.5 )
																Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame13 )
															end
														end
														
														if event.interrupted then
															Fill3bFrame12( Fill3b, event )
															return 
														else
															Fill3b:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame12 )
														end
													end
													
													if event.interrupted then
														Fill3bFrame11( Fill3b, event )
														return 
													else
														Fill3b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Fill3b:setAlpha( 0 )
														Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame11 )
													end
												end
												
												if event.interrupted then
													Fill3bFrame10( Fill3b, event )
													return 
												else
													Fill3b:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame10 )
												end
											end
											
											if event.interrupted then
												Fill3bFrame9( Fill3b, event )
												return 
											else
												Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Fill3b:setAlpha( 1 )
												Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame9 )
											end
										end
										
										if event.interrupted then
											Fill3bFrame8( Fill3b, event )
											return 
										else
											Fill3b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame8 )
										end
									end
									
									if event.interrupted then
										Fill3bFrame7( Fill3b, event )
										return 
									else
										Fill3b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Fill3b:setAlpha( 0 )
										Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame7 )
									end
								end
								
								if event.interrupted then
									Fill3bFrame6( Fill3b, event )
									return 
								else
									Fill3b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame6 )
								end
							end
							
							if event.interrupted then
								Fill3bFrame5( Fill3b, event )
								return 
							else
								Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Fill3b:setAlpha( 1 )
								Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame5 )
							end
						end
						
						if event.interrupted then
							Fill3bFrame4( Fill3b, event )
							return 
						else
							Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame4 )
						end
					end
					
					if event.interrupted then
						Fill3bFrame3( Fill3b, event )
						return 
					else
						Fill3b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Fill3b:setAlpha( 0.5 )
						Fill3b:registerEventHandler( "transition_complete_keyframe", Fill3bFrame3 )
					end
				end
				
				Fill3b:completeAnimation()
				self.Fill3b:setAlpha( 1 )
				Fill3bFrame2( Fill3b, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										if not event.interrupted then
											Image0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
										end
										Image0:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Image0, event )
										else
											Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
										Image0:setAlpha( 0.58 )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Bounce )
									Image0:setAlpha( 0 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
								Image0:setAlpha( 1 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
							Image0:setAlpha( 0 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						Image0:setAlpha( 1 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
			end
		},
		NotGrenade = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Fill1a:completeAnimation()
				self.Fill1a:setAlpha( 0 )
				self.clipFinished( Fill1a, {} )
				Fill1b:completeAnimation()
				self.Fill1b:setAlpha( 0 )
				self.clipFinished( Fill1b, {} )
				Fill2a:completeAnimation()
				self.Fill2a:setAlpha( 0 )
				self.clipFinished( Fill2a, {} )
				Fill2b:completeAnimation()
				self.Fill2b:setAlpha( 0 )
				self.clipFinished( Fill2b, {} )
				Fill3a:completeAnimation()
				self.Fill3a:setAlpha( 0 )
				self.clipFinished( Fill3a, {} )
				Fill3b:completeAnimation()
				self.Fill3b:setAlpha( 0 )
				self.clipFinished( Fill3b, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Count3",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "timeLeftPerc", 0.56 )
			end
		},
		{
			stateName = "Count2",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "timeLeftPerc", 0.33 )
			end
		},
		{
			stateName = "Count1",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "timeLeftPerc", 0 )
			end
		},
		{
			stateName = "Count0",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThanOrEqualTo( element, controller, "timeLeftPerc", 0 )
			end
		},
		{
			stateName = "NotGrenade",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "timeLeftPerc", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "timeLeftPerc"
		} )
	end )
	self.close = function ( self )
		self.Fill1a:close()
		self.Fill1b:close()
		self.Fill2a:close()
		self.Fill2b:close()
		self.Fill3a:close()
		self.Fill3b:close()
		CoD.IncomingExplosive_FillAll.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

