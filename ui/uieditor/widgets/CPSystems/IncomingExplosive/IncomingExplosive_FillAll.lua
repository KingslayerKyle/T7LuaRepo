-- f2cb396c6d738e3e16cec3afaf16dbba
-- This hash is used for caching, delete to decompile the file again

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
	self:addElement( Fill1a )
	self.Fill1a = Fill1a
	
	local Fill1b = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill1b:setLeftRight( true, false, 74, 138 )
	Fill1b:setTopBottom( true, false, 0, 36 )
	Fill1b:setYRot( -180 )
	Fill1b.Image00:setZoom( -100 )
	self:addElement( Fill1b )
	self.Fill1b = Fill1b
	
	local Fill2a = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill2a:setLeftRight( true, false, 97, 161 )
	Fill2a:setTopBottom( true, false, 41, 77 )
	Fill2a:setZRot( -120 )
	self:addElement( Fill2a )
	self.Fill2a = Fill2a
	
	local Fill2b = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill2b:setLeftRight( true, false, 72, 136 )
	Fill2b:setTopBottom( true, false, 84.5, 120.5 )
	Fill2b:setYRot( -180 )
	Fill2b:setZRot( -240 )
	Fill2b.Image00:setZoom( -100 )
	self:addElement( Fill2b )
	self.Fill2b = Fill2b
	
	local Fill3a = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill3a:setLeftRight( true, false, 0, 64 )
	Fill3a:setTopBottom( true, false, 41, 77 )
	Fill3a:setYRot( -180 )
	Fill3a:setZRot( -120 )
	Fill3a.Image00:setZoom( -100 )
	self:addElement( Fill3a )
	self.Fill3a = Fill3a
	
	local Fill3b = CoD.IncomingExplosive_FillTriangle.new( menu, controller )
	Fill3b:setLeftRight( true, false, 25, 89 )
	Fill3b:setTopBottom( true, false, 84.5, 120.5 )
	Fill3b:setZRot( -240 )
	self:addElement( Fill3b )
	self.Fill3b = Fill3b
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 18.5, 142.5 )
	Image0:setTopBottom( true, false, 22.98, 122.98 )
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
				local f40_local1 = function ( f50_arg0, f50_arg1 )
					local f50_local0 = function ( f51_arg0, f51_arg1 )
						local f51_local0 = function ( f52_arg0, f52_arg1 )
							local f52_local0 = function ( f53_arg0, f53_arg1 )
								local f53_local0 = function ( f54_arg0, f54_arg1 )
									local f54_local0 = function ( f55_arg0, f55_arg1 )
										local f55_local0 = function ( f56_arg0, f56_arg1 )
											if not f56_arg1.interrupted then
												f56_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											f56_arg0:setAlpha( 1 )
											if f56_arg1.interrupted then
												self.clipFinished( f56_arg0, f56_arg1 )
											else
												f56_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f55_arg1.interrupted then
											f55_local0( f55_arg0, f55_arg1 )
											return 
										else
											f55_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
										end
									end
									
									if f54_arg1.interrupted then
										f54_local0( f54_arg0, f54_arg1 )
										return 
									else
										f54_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f54_arg0:setAlpha( 1 )
										f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
									end
								end
								
								if f53_arg1.interrupted then
									f53_local0( f53_arg0, f53_arg1 )
									return 
								else
									f53_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
								end
							end
							
							if f52_arg1.interrupted then
								f52_local0( f52_arg0, f52_arg1 )
								return 
							else
								f52_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f52_arg0:setAlpha( 0 )
								f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
							end
						end
						
						if f51_arg1.interrupted then
							f51_local0( f51_arg0, f51_arg1 )
							return 
						else
							f51_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
						end
					end
					
					if f50_arg1.interrupted then
						f50_local0( f50_arg0, f50_arg1 )
						return 
					else
						f50_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f50_arg0:setAlpha( 0.5 )
						f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
					end
				end
				
				Fill1b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Fill1b:setAlpha( 1 )
				Fill1b:registerEventHandler( "transition_complete_keyframe", f40_local1 )
				local f40_local2 = function ( f57_arg0, f57_arg1 )
					local f57_local0 = function ( f58_arg0, f58_arg1 )
						local f58_local0 = function ( f59_arg0, f59_arg1 )
							local f59_local0 = function ( f60_arg0, f60_arg1 )
								local f60_local0 = function ( f61_arg0, f61_arg1 )
									local f61_local0 = function ( f62_arg0, f62_arg1 )
										local f62_local0 = function ( f63_arg0, f63_arg1 )
											local f63_local0 = function ( f64_arg0, f64_arg1 )
												local f64_local0 = function ( f65_arg0, f65_arg1 )
													if not f65_arg1.interrupted then
														f65_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													end
													f65_arg0:setAlpha( 1 )
													if f65_arg1.interrupted then
														self.clipFinished( f65_arg0, f65_arg1 )
													else
														f65_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f64_arg1.interrupted then
													f64_local0( f64_arg0, f64_arg1 )
													return 
												else
													f64_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
													f64_arg0:setAlpha( 0 )
													f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
												end
											end
											
											if f63_arg1.interrupted then
												f63_local0( f63_arg0, f63_arg1 )
												return 
											else
												f63_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
											end
										end
										
										if f62_arg1.interrupted then
											f62_local0( f62_arg0, f62_arg1 )
											return 
										else
											f62_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f62_arg0:setAlpha( 1 )
											f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
										end
									end
									
									if f61_arg1.interrupted then
										f61_local0( f61_arg0, f61_arg1 )
										return 
									else
										f61_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
									end
								end
								
								if f60_arg1.interrupted then
									f60_local0( f60_arg0, f60_arg1 )
									return 
								else
									f60_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f60_arg0:setAlpha( 0 )
									f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
								end
							end
							
							if f59_arg1.interrupted then
								f59_local0( f59_arg0, f59_arg1 )
								return 
							else
								f59_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
							end
						end
						
						if f58_arg1.interrupted then
							f58_local0( f58_arg0, f58_arg1 )
							return 
						else
							f58_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f58_arg0:setAlpha( 0.5 )
							f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
						end
					end
					
					if f57_arg1.interrupted then
						f57_local0( f57_arg0, f57_arg1 )
						return 
					else
						f57_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f57_arg0:setAlpha( 0 )
						f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
					end
				end
				
				Fill2a:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				Fill2a:setAlpha( 1 )
				Fill2a:registerEventHandler( "transition_complete_keyframe", f40_local2 )
				local f40_local3 = function ( f66_arg0, f66_arg1 )
					local f66_local0 = function ( f67_arg0, f67_arg1 )
						local f67_local0 = function ( f68_arg0, f68_arg1 )
							local f68_local0 = function ( f69_arg0, f69_arg1 )
								local f69_local0 = function ( f70_arg0, f70_arg1 )
									local f70_local0 = function ( f71_arg0, f71_arg1 )
										local f71_local0 = function ( f72_arg0, f72_arg1 )
											if not f72_arg1.interrupted then
												f72_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											f72_arg0:setAlpha( 1 )
											if f72_arg1.interrupted then
												self.clipFinished( f72_arg0, f72_arg1 )
											else
												f72_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f71_arg1.interrupted then
											f71_local0( f71_arg0, f71_arg1 )
											return 
										else
											f71_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
										end
									end
									
									if f70_arg1.interrupted then
										f70_local0( f70_arg0, f70_arg1 )
										return 
									else
										f70_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f70_arg0:setAlpha( 1 )
										f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
									end
								end
								
								if f69_arg1.interrupted then
									f69_local0( f69_arg0, f69_arg1 )
									return 
								else
									f69_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
								end
							end
							
							if f68_arg1.interrupted then
								f68_local0( f68_arg0, f68_arg1 )
								return 
							else
								f68_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f68_arg0:setAlpha( 0 )
								f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
							end
						end
						
						if f67_arg1.interrupted then
							f67_local0( f67_arg0, f67_arg1 )
							return 
						else
							f67_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
						end
					end
					
					if f66_arg1.interrupted then
						f66_local0( f66_arg0, f66_arg1 )
						return 
					else
						f66_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f66_arg0:setAlpha( 0.5 )
						f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
					end
				end
				
				Fill2b:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				Fill2b:setAlpha( 1 )
				Fill2b:registerEventHandler( "transition_complete_keyframe", f40_local3 )
				local f40_local4 = function ( f73_arg0, f73_arg1 )
					local f73_local0 = function ( f74_arg0, f74_arg1 )
						local f74_local0 = function ( f75_arg0, f75_arg1 )
							local f75_local0 = function ( f76_arg0, f76_arg1 )
								local f76_local0 = function ( f77_arg0, f77_arg1 )
									local f77_local0 = function ( f78_arg0, f78_arg1 )
										if not f78_arg1.interrupted then
											f78_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										f78_arg0:setAlpha( 1 )
										if f78_arg1.interrupted then
											self.clipFinished( f78_arg0, f78_arg1 )
										else
											f78_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f77_arg1.interrupted then
										f77_local0( f77_arg0, f77_arg1 )
										return 
									else
										f77_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f77_arg0:setAlpha( 1 )
										f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
									end
								end
								
								if f76_arg1.interrupted then
									f76_local0( f76_arg0, f76_arg1 )
									return 
								else
									f76_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
								end
							end
							
							if f75_arg1.interrupted then
								f75_local0( f75_arg0, f75_arg1 )
								return 
							else
								f75_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f75_arg0:setAlpha( 0 )
								f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
							end
						end
						
						if f74_arg1.interrupted then
							f74_local0( f74_arg0, f74_arg1 )
							return 
						else
							f74_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
						end
					end
					
					if f73_arg1.interrupted then
						f73_local0( f73_arg0, f73_arg1 )
						return 
					else
						f73_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f73_arg0:setAlpha( 0.5 )
						f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
					end
				end
				
				Fill3a:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				Fill3a:setAlpha( 1 )
				Fill3a:registerEventHandler( "transition_complete_keyframe", f40_local4 )
				local f40_local5 = function ( f79_arg0, f79_arg1 )
					local f79_local0 = function ( f80_arg0, f80_arg1 )
						local f80_local0 = function ( f81_arg0, f81_arg1 )
							local f81_local0 = function ( f82_arg0, f82_arg1 )
								local f82_local0 = function ( f83_arg0, f83_arg1 )
									local f83_local0 = function ( f84_arg0, f84_arg1 )
										local f84_local0 = function ( f85_arg0, f85_arg1 )
											local f85_local0 = function ( f86_arg0, f86_arg1 )
												local f86_local0 = function ( f87_arg0, f87_arg1 )
													if not f87_arg1.interrupted then
														f87_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													end
													f87_arg0:setAlpha( 1 )
													if f87_arg1.interrupted then
														self.clipFinished( f87_arg0, f87_arg1 )
													else
														f87_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f86_arg1.interrupted then
													f86_local0( f86_arg0, f86_arg1 )
													return 
												else
													f86_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
													f86_arg0:setAlpha( 0 )
													f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
												end
											end
											
											if f85_arg1.interrupted then
												f85_local0( f85_arg0, f85_arg1 )
												return 
											else
												f85_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
											end
										end
										
										if f84_arg1.interrupted then
											f84_local0( f84_arg0, f84_arg1 )
											return 
										else
											f84_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f84_arg0:setAlpha( 1 )
											f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
										end
									end
									
									if f83_arg1.interrupted then
										f83_local0( f83_arg0, f83_arg1 )
										return 
									else
										f83_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
									end
								end
								
								if f82_arg1.interrupted then
									f82_local0( f82_arg0, f82_arg1 )
									return 
								else
									f82_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f82_arg0:setAlpha( 0 )
									f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
								end
							end
							
							if f81_arg1.interrupted then
								f81_local0( f81_arg0, f81_arg1 )
								return 
							else
								f81_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
							end
						end
						
						if f80_arg1.interrupted then
							f80_local0( f80_arg0, f80_arg1 )
							return 
						else
							f80_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f80_arg0:setAlpha( 0.5 )
							f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
						end
					end
					
					if f79_arg1.interrupted then
						f79_local0( f79_arg0, f79_arg1 )
						return 
					else
						f79_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f79_arg0:setAlpha( 0 )
						f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
					end
				end
				
				Fill3b:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				Fill3b:setAlpha( 1 )
				Fill3b:registerEventHandler( "transition_complete_keyframe", f40_local5 )

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
				local f88_local1 = function ( f105_arg0, f105_arg1 )
					local f105_local0 = function ( f106_arg0, f106_arg1 )
						local f106_local0 = function ( f107_arg0, f107_arg1 )
							local f107_local0 = function ( f108_arg0, f108_arg1 )
								local f108_local0 = function ( f109_arg0, f109_arg1 )
									local f109_local0 = function ( f110_arg0, f110_arg1 )
										local f110_local0 = function ( f111_arg0, f111_arg1 )
											local f111_local0 = function ( f112_arg0, f112_arg1 )
												local f112_local0 = function ( f113_arg0, f113_arg1 )
													local f113_local0 = function ( f114_arg0, f114_arg1 )
														local f114_local0 = function ( f115_arg0, f115_arg1 )
															local f115_local0 = function ( f116_arg0, f116_arg1 )
																local f116_local0 = function ( f117_arg0, f117_arg1 )
																	local f117_local0 = function ( f118_arg0, f118_arg1 )
																		local f118_local0 = function ( f119_arg0, f119_arg1 )
																			local f119_local0 = function ( f120_arg0, f120_arg1 )
																				if not f120_arg1.interrupted then
																					f120_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				f120_arg0:setAlpha( 0 )
																				if f120_arg1.interrupted then
																					self.clipFinished( f120_arg0, f120_arg1 )
																				else
																					f120_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f119_arg1.interrupted then
																				f119_local0( f119_arg0, f119_arg1 )
																				return 
																			else
																				f119_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				f119_arg0:setAlpha( 0.35 )
																				f119_arg0:registerEventHandler( "transition_complete_keyframe", f119_local0 )
																			end
																		end
																		
																		if f118_arg1.interrupted then
																			f118_local0( f118_arg0, f118_arg1 )
																			return 
																		else
																			f118_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			f118_arg0:registerEventHandler( "transition_complete_keyframe", f118_local0 )
																		end
																	end
																	
																	if f117_arg1.interrupted then
																		f117_local0( f117_arg0, f117_arg1 )
																		return 
																	else
																		f117_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		f117_arg0:setAlpha( 0 )
																		f117_arg0:registerEventHandler( "transition_complete_keyframe", f117_local0 )
																	end
																end
																
																if f116_arg1.interrupted then
																	f116_local0( f116_arg0, f116_arg1 )
																	return 
																else
																	f116_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	f116_arg0:registerEventHandler( "transition_complete_keyframe", f116_local0 )
																end
															end
															
															if f115_arg1.interrupted then
																f115_local0( f115_arg0, f115_arg1 )
																return 
															else
																f115_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																f115_arg0:setAlpha( 0.5 )
																f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
															end
														end
														
														if f114_arg1.interrupted then
															f114_local0( f114_arg0, f114_arg1 )
															return 
														else
															f114_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
														end
													end
													
													if f113_arg1.interrupted then
														f113_local0( f113_arg0, f113_arg1 )
														return 
													else
														f113_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														f113_arg0:setAlpha( 0 )
														f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
													end
												end
												
												if f112_arg1.interrupted then
													f112_local0( f112_arg0, f112_arg1 )
													return 
												else
													f112_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
												end
											end
											
											if f111_arg1.interrupted then
												f111_local0( f111_arg0, f111_arg1 )
												return 
											else
												f111_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f111_arg0:setAlpha( 1 )
												f111_arg0:registerEventHandler( "transition_complete_keyframe", f111_local0 )
											end
										end
										
										if f110_arg1.interrupted then
											f110_local0( f110_arg0, f110_arg1 )
											return 
										else
											f110_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f110_arg0:registerEventHandler( "transition_complete_keyframe", f110_local0 )
										end
									end
									
									if f109_arg1.interrupted then
										f109_local0( f109_arg0, f109_arg1 )
										return 
									else
										f109_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f109_arg0:setAlpha( 0 )
										f109_arg0:registerEventHandler( "transition_complete_keyframe", f109_local0 )
									end
								end
								
								if f108_arg1.interrupted then
									f108_local0( f108_arg0, f108_arg1 )
									return 
								else
									f108_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f108_arg0:registerEventHandler( "transition_complete_keyframe", f108_local0 )
								end
							end
							
							if f107_arg1.interrupted then
								f107_local0( f107_arg0, f107_arg1 )
								return 
							else
								f107_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f107_arg0:setAlpha( 1 )
								f107_arg0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
							end
						end
						
						if f106_arg1.interrupted then
							f106_local0( f106_arg0, f106_arg1 )
							return 
						else
							f106_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f106_arg0:registerEventHandler( "transition_complete_keyframe", f106_local0 )
						end
					end
					
					if f105_arg1.interrupted then
						f105_local0( f105_arg0, f105_arg1 )
						return 
					else
						f105_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f105_arg0:setAlpha( 0.5 )
						f105_arg0:registerEventHandler( "transition_complete_keyframe", f105_local0 )
					end
				end
				
				Fill1b:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Fill1b:setAlpha( 1 )
				Fill1b:registerEventHandler( "transition_complete_keyframe", f88_local1 )
				local f88_local2 = function ( f121_arg0, f121_arg1 )
					local f121_local0 = function ( f122_arg0, f122_arg1 )
						local f122_local0 = function ( f123_arg0, f123_arg1 )
							local f123_local0 = function ( f124_arg0, f124_arg1 )
								local f124_local0 = function ( f125_arg0, f125_arg1 )
									local f125_local0 = function ( f126_arg0, f126_arg1 )
										local f126_local0 = function ( f127_arg0, f127_arg1 )
											local f127_local0 = function ( f128_arg0, f128_arg1 )
												local f128_local0 = function ( f129_arg0, f129_arg1 )
													local f129_local0 = function ( f130_arg0, f130_arg1 )
														local f130_local0 = function ( f131_arg0, f131_arg1 )
															local f131_local0 = function ( f132_arg0, f132_arg1 )
																local f132_local0 = function ( f133_arg0, f133_arg1 )
																	local f133_local0 = function ( f134_arg0, f134_arg1 )
																		local f134_local0 = function ( f135_arg0, f135_arg1 )
																			local f135_local0 = function ( f136_arg0, f136_arg1 )
																				if not f136_arg1.interrupted then
																					f136_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				f136_arg0:setAlpha( 0 )
																				if f136_arg1.interrupted then
																					self.clipFinished( f136_arg0, f136_arg1 )
																				else
																					f136_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f135_arg1.interrupted then
																				f135_local0( f135_arg0, f135_arg1 )
																				return 
																			else
																				f135_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				f135_arg0:setAlpha( 0.35 )
																				f135_arg0:registerEventHandler( "transition_complete_keyframe", f135_local0 )
																			end
																		end
																		
																		if f134_arg1.interrupted then
																			f134_local0( f134_arg0, f134_arg1 )
																			return 
																		else
																			f134_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																			f134_arg0:registerEventHandler( "transition_complete_keyframe", f134_local0 )
																		end
																	end
																	
																	if f133_arg1.interrupted then
																		f133_local0( f133_arg0, f133_arg1 )
																		return 
																	else
																		f133_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		f133_arg0:setAlpha( 0 )
																		f133_arg0:registerEventHandler( "transition_complete_keyframe", f133_local0 )
																	end
																end
																
																if f132_arg1.interrupted then
																	f132_local0( f132_arg0, f132_arg1 )
																	return 
																else
																	f132_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	f132_arg0:registerEventHandler( "transition_complete_keyframe", f132_local0 )
																end
															end
															
															if f131_arg1.interrupted then
																f131_local0( f131_arg0, f131_arg1 )
																return 
															else
																f131_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																f131_arg0:setAlpha( 0.5 )
																f131_arg0:registerEventHandler( "transition_complete_keyframe", f131_local0 )
															end
														end
														
														if f130_arg1.interrupted then
															f130_local0( f130_arg0, f130_arg1 )
															return 
														else
															f130_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															f130_arg0:registerEventHandler( "transition_complete_keyframe", f130_local0 )
														end
													end
													
													if f129_arg1.interrupted then
														f129_local0( f129_arg0, f129_arg1 )
														return 
													else
														f129_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f129_arg0:setAlpha( 0 )
														f129_arg0:registerEventHandler( "transition_complete_keyframe", f129_local0 )
													end
												end
												
												if f128_arg1.interrupted then
													f128_local0( f128_arg0, f128_arg1 )
													return 
												else
													f128_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													f128_arg0:registerEventHandler( "transition_complete_keyframe", f128_local0 )
												end
											end
											
											if f127_arg1.interrupted then
												f127_local0( f127_arg0, f127_arg1 )
												return 
											else
												f127_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f127_arg0:setAlpha( 1 )
												f127_arg0:registerEventHandler( "transition_complete_keyframe", f127_local0 )
											end
										end
										
										if f126_arg1.interrupted then
											f126_local0( f126_arg0, f126_arg1 )
											return 
										else
											f126_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											f126_arg0:registerEventHandler( "transition_complete_keyframe", f126_local0 )
										end
									end
									
									if f125_arg1.interrupted then
										f125_local0( f125_arg0, f125_arg1 )
										return 
									else
										f125_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f125_arg0:setAlpha( 0 )
										f125_arg0:registerEventHandler( "transition_complete_keyframe", f125_local0 )
									end
								end
								
								if f124_arg1.interrupted then
									f124_local0( f124_arg0, f124_arg1 )
									return 
								else
									f124_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f124_arg0:registerEventHandler( "transition_complete_keyframe", f124_local0 )
								end
							end
							
							if f123_arg1.interrupted then
								f123_local0( f123_arg0, f123_arg1 )
								return 
							else
								f123_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f123_arg0:setAlpha( 1 )
								f123_arg0:registerEventHandler( "transition_complete_keyframe", f123_local0 )
							end
						end
						
						if f122_arg1.interrupted then
							f122_local0( f122_arg0, f122_arg1 )
							return 
						else
							f122_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f122_arg0:registerEventHandler( "transition_complete_keyframe", f122_local0 )
						end
					end
					
					if f121_arg1.interrupted then
						f121_local0( f121_arg0, f121_arg1 )
						return 
					else
						f121_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f121_arg0:setAlpha( 0.5 )
						f121_arg0:registerEventHandler( "transition_complete_keyframe", f121_local0 )
					end
				end
				
				Fill2a:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Fill2a:setAlpha( 1 )
				Fill2a:registerEventHandler( "transition_complete_keyframe", f88_local2 )
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
				local f88_local4 = function ( f153_arg0, f153_arg1 )
					local f153_local0 = function ( f154_arg0, f154_arg1 )
						local f154_local0 = function ( f155_arg0, f155_arg1 )
							local f155_local0 = function ( f156_arg0, f156_arg1 )
								local f156_local0 = function ( f157_arg0, f157_arg1 )
									local f157_local0 = function ( f158_arg0, f158_arg1 )
										local f158_local0 = function ( f159_arg0, f159_arg1 )
											local f159_local0 = function ( f160_arg0, f160_arg1 )
												local f160_local0 = function ( f161_arg0, f161_arg1 )
													local f161_local0 = function ( f162_arg0, f162_arg1 )
														local f162_local0 = function ( f163_arg0, f163_arg1 )
															local f163_local0 = function ( f164_arg0, f164_arg1 )
																local f164_local0 = function ( f165_arg0, f165_arg1 )
																	local f165_local0 = function ( f166_arg0, f166_arg1 )
																		local f166_local0 = function ( f167_arg0, f167_arg1 )
																			local f167_local0 = function ( f168_arg0, f168_arg1 )
																				if not f168_arg1.interrupted then
																					f168_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																				end
																				f168_arg0:setAlpha( 0 )
																				if f168_arg1.interrupted then
																					self.clipFinished( f168_arg0, f168_arg1 )
																				else
																					f168_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f167_arg1.interrupted then
																				f167_local0( f167_arg0, f167_arg1 )
																				return 
																			else
																				f167_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				f167_arg0:setAlpha( 0.35 )
																				f167_arg0:registerEventHandler( "transition_complete_keyframe", f167_local0 )
																			end
																		end
																		
																		if f166_arg1.interrupted then
																			f166_local0( f166_arg0, f166_arg1 )
																			return 
																		else
																			f166_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
																		end
																	end
																	
																	if f165_arg1.interrupted then
																		f165_local0( f165_arg0, f165_arg1 )
																		return 
																	else
																		f165_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		f165_arg0:setAlpha( 0 )
																		f165_arg0:registerEventHandler( "transition_complete_keyframe", f165_local0 )
																	end
																end
																
																if f164_arg1.interrupted then
																	f164_local0( f164_arg0, f164_arg1 )
																	return 
																else
																	f164_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	f164_arg0:registerEventHandler( "transition_complete_keyframe", f164_local0 )
																end
															end
															
															if f163_arg1.interrupted then
																f163_local0( f163_arg0, f163_arg1 )
																return 
															else
																f163_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																f163_arg0:setAlpha( 0.5 )
																f163_arg0:registerEventHandler( "transition_complete_keyframe", f163_local0 )
															end
														end
														
														if f162_arg1.interrupted then
															f162_local0( f162_arg0, f162_arg1 )
															return 
														else
															f162_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															f162_arg0:registerEventHandler( "transition_complete_keyframe", f162_local0 )
														end
													end
													
													if f161_arg1.interrupted then
														f161_local0( f161_arg0, f161_arg1 )
														return 
													else
														f161_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f161_arg0:setAlpha( 0 )
														f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
													end
												end
												
												if f160_arg1.interrupted then
													f160_local0( f160_arg0, f160_arg1 )
													return 
												else
													f160_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
												end
											end
											
											if f159_arg1.interrupted then
												f159_local0( f159_arg0, f159_arg1 )
												return 
											else
												f159_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f159_arg0:setAlpha( 1 )
												f159_arg0:registerEventHandler( "transition_complete_keyframe", f159_local0 )
											end
										end
										
										if f158_arg1.interrupted then
											f158_local0( f158_arg0, f158_arg1 )
											return 
										else
											f158_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
										end
									end
									
									if f157_arg1.interrupted then
										f157_local0( f157_arg0, f157_arg1 )
										return 
									else
										f157_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f157_arg0:setAlpha( 0 )
										f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
									end
								end
								
								if f156_arg1.interrupted then
									f156_local0( f156_arg0, f156_arg1 )
									return 
								else
									f156_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f156_arg0:registerEventHandler( "transition_complete_keyframe", f156_local0 )
								end
							end
							
							if f155_arg1.interrupted then
								f155_local0( f155_arg0, f155_arg1 )
								return 
							else
								f155_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f155_arg0:setAlpha( 1 )
								f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
							end
						end
						
						if f154_arg1.interrupted then
							f154_local0( f154_arg0, f154_arg1 )
							return 
						else
							f154_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
						end
					end
					
					if f153_arg1.interrupted then
						f153_local0( f153_arg0, f153_arg1 )
						return 
					else
						f153_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f153_arg0:setAlpha( 0.5 )
						f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
					end
				end
				
				Fill3a:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Fill3a:setAlpha( 1 )
				Fill3a:registerEventHandler( "transition_complete_keyframe", f88_local4 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Fill1a:close()
		element.Fill1b:close()
		element.Fill2a:close()
		element.Fill2b:close()
		element.Fill3a:close()
		element.Fill3b:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

