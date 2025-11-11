CoD.CallingCards_loot_BO1retro = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_BO1retro.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_BO1retro )
	self.id = "CallingCards_loot_BO1retro"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 720 )
	bg:setTopBottom( 0, 0, 0, 180 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( 0, 0, 102, 772 )
	Glow00:setTopBottom( 0, 0, -130, 378 )
	Glow00:setRGB( 0.9, 1, 0.85 )
	Glow00:setAlpha( 0.2 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	local mid = LUI.UIImage.new()
	mid:setLeftRight( 0, 0, 0, 720 )
	mid:setTopBottom( 0, 0, 0, 180 )
	mid:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_mid" ) )
	self:addElement( mid )
	self.mid = mid
	
	local glow1 = LUI.UIImage.new()
	glow1:setLeftRight( 0, 0, 338, 482 )
	glow1:setTopBottom( 0, 0, -2, 106 )
	glow1:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_glow1" ) )
	self:addElement( glow1 )
	self.glow1 = glow1
	
	local glow2 = LUI.UIImage.new()
	glow2:setLeftRight( 0, 0, 452, 596 )
	glow2:setTopBottom( 0, 0, 16, 124 )
	glow2:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_glow2" ) )
	self:addElement( glow2 )
	self.glow2 = glow2
	
	local glow3 = LUI.UIImage.new()
	glow3:setLeftRight( 0, 0, 422, 566 )
	glow3:setTopBottom( 0, 0, -27, 83 )
	glow3:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_glow3" ) )
	self:addElement( glow3 )
	self.glow3 = glow3
	
	local static1 = LUI.UIImage.new()
	static1:setLeftRight( 0, 0, 361, 451 )
	static1:setTopBottom( 0, 0, 1, 91 )
	static1:setRGB( 0.83, 1, 0.68 )
	static1:setAlpha( 0.8 )
	static1:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_static1" ) )
	static1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	static1:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( static1 )
	self.static1 = static1
	
	local static2 = LUI.UIImage.new()
	static2:setLeftRight( 0, 0, 479, 569 )
	static2:setTopBottom( 0, 0, 23, 113 )
	static2:setRGB( 0.83, 1, 0.68 )
	static2:setAlpha( 0.8 )
	static2:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_static2" ) )
	static2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	static2:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( static2 )
	self.static2 = static2
	
	local static3 = LUI.UIImage.new()
	static3:setLeftRight( 0, 0, 446, 536 )
	static3:setTopBottom( 0, 0, -23, 67 )
	static3:setRGB( 0.83, 1, 0.68 )
	static3:setAlpha( 0.8 )
	static3:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_static3" ) )
	static3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	static3:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( static3 )
	self.static3 = static3
	
	local face1 = LUI.UIImage.new()
	face1:setLeftRight( 0, 0, 365, 455 )
	face1:setTopBottom( 0, 0, 7, 97 )
	face1:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_face1" ) )
	self:addElement( face1 )
	self.face1 = face1
	
	local face2 = LUI.UIImage.new()
	face2:setLeftRight( 0, 0, 480, 570 )
	face2:setTopBottom( 0, 0, 7, 97 )
	face2:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_face2" ) )
	self:addElement( face2 )
	self.face2 = face2
	
	local face3 = LUI.UIImage.new()
	face3:setLeftRight( 0, 0, 446, 536 )
	face3:setTopBottom( 0, 0, -42, 48 )
	face3:setImage( RegisterImage( "uie_t7_loot_callingcard_bo1retro_face3" ) )
	self:addElement( face3 )
	self.face3 = face3
	
	local Glow000 = LUI.UIImage.new()
	Glow000:setLeftRight( 0, 0, 455, 1059 )
	Glow000:setTopBottom( 0, 0, -2, 595 )
	Glow000:setRGB( 1, 0, 0.06 )
	Glow000:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow000 )
	self.Glow000 = Glow000
	
	self.resetProperties = function ()
		Glow00:completeAnimation()
		face1:completeAnimation()
		face2:completeAnimation()
		face3:completeAnimation()
		static1:completeAnimation()
		static2:completeAnimation()
		static3:completeAnimation()
		glow1:completeAnimation()
		glow3:completeAnimation()
		glow2:completeAnimation()
		Glow000:completeAnimation()
		Glow00:setAlpha( 0.2 )
		face1:setAlpha( 1 )
		face2:setAlpha( 1 )
		face3:setAlpha( 1 )
		static1:setAlpha( 0.8 )
		static2:setAlpha( 0.8 )
		static3:setAlpha( 0.8 )
		glow1:setAlpha( 1 )
		glow3:setAlpha( 1 )
		glow2:setAlpha( 1 )
		Glow000:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							local Glow00Frame5 = function ( Glow00, event )
								local Glow00Frame6 = function ( Glow00, event )
									local Glow00Frame7 = function ( Glow00, event )
										local Glow00Frame8 = function ( Glow00, event )
											local Glow00Frame9 = function ( Glow00, event )
												if not event.interrupted then
													Glow00:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
												end
												Glow00:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow00, event )
												else
													Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Glow00Frame9( Glow00, event )
												return 
											else
												Glow00:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
												Glow00:setAlpha( 0.06 )
												Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame9 )
											end
										end
										
										if event.interrupted then
											Glow00Frame8( Glow00, event )
											return 
										else
											Glow00:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											Glow00:setAlpha( 0 )
											Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame8 )
										end
									end
									
									if event.interrupted then
										Glow00Frame7( Glow00, event )
										return 
									else
										Glow00:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
										Glow00:setAlpha( 0.04 )
										Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame7 )
									end
								end
								
								if event.interrupted then
									Glow00Frame6( Glow00, event )
									return 
								else
									Glow00:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									Glow00:setAlpha( 0 )
									Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame6 )
								end
							end
							
							if event.interrupted then
								Glow00Frame5( Glow00, event )
								return 
							else
								Glow00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame5 )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 0.11 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
				local glow1Frame2 = function ( glow1, event )
					local glow1Frame3 = function ( glow1, event )
						local glow1Frame4 = function ( glow1, event )
							local glow1Frame5 = function ( glow1, event )
								local glow1Frame6 = function ( glow1, event )
									local glow1Frame7 = function ( glow1, event )
										local glow1Frame8 = function ( glow1, event )
											local glow1Frame9 = function ( glow1, event )
												if not event.interrupted then
													glow1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												end
												glow1:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( glow1, event )
												else
													glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												glow1Frame9( glow1, event )
												return 
											else
												glow1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame9 )
											end
										end
										
										if event.interrupted then
											glow1Frame8( glow1, event )
											return 
										else
											glow1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											glow1:setAlpha( 0 )
											glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame8 )
										end
									end
									
									if event.interrupted then
										glow1Frame7( glow1, event )
										return 
									else
										glow1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame7 )
									end
								end
								
								if event.interrupted then
									glow1Frame6( glow1, event )
									return 
								else
									glow1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									glow1:setAlpha( 1 )
									glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame6 )
								end
							end
							
							if event.interrupted then
								glow1Frame5( glow1, event )
								return 
							else
								glow1:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
								glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame5 )
							end
						end
						
						if event.interrupted then
							glow1Frame4( glow1, event )
							return 
						else
							glow1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							glow1:setAlpha( 0 )
							glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame4 )
						end
					end
					
					if event.interrupted then
						glow1Frame3( glow1, event )
						return 
					else
						glow1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						glow1:setAlpha( 1 )
						glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame3 )
					end
				end
				
				glow1:completeAnimation()
				self.glow1:setAlpha( 0 )
				glow1Frame2( glow1, {} )
				local glow2Frame2 = function ( glow2, event )
					local glow2Frame3 = function ( glow2, event )
						local glow2Frame4 = function ( glow2, event )
							local glow2Frame5 = function ( glow2, event )
								local glow2Frame6 = function ( glow2, event )
									local glow2Frame7 = function ( glow2, event )
										if not event.interrupted then
											glow2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										glow2:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( glow2, event )
										else
											glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glow2Frame7( glow2, event )
										return 
									else
										glow2:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
										glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame7 )
									end
								end
								
								if event.interrupted then
									glow2Frame6( glow2, event )
									return 
								else
									glow2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									glow2:setAlpha( 0 )
									glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame6 )
								end
							end
							
							if event.interrupted then
								glow2Frame5( glow2, event )
								return 
							else
								glow2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame5 )
							end
						end
						
						if event.interrupted then
							glow2Frame4( glow2, event )
							return 
						else
							glow2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							glow2:setAlpha( 1 )
							glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame4 )
						end
					end
					
					if event.interrupted then
						glow2Frame3( glow2, event )
						return 
					else
						glow2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame3 )
					end
				end
				
				glow2:completeAnimation()
				self.glow2:setAlpha( 0 )
				glow2Frame2( glow2, {} )
				local glow3Frame2 = function ( glow3, event )
					local glow3Frame3 = function ( glow3, event )
						local glow3Frame4 = function ( glow3, event )
							if not event.interrupted then
								glow3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							end
							glow3:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( glow3, event )
							else
								glow3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							glow3Frame4( glow3, event )
							return 
						else
							glow3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							glow3:setAlpha( 0 )
							glow3:registerEventHandler( "transition_complete_keyframe", glow3Frame4 )
						end
					end
					
					if event.interrupted then
						glow3Frame3( glow3, event )
						return 
					else
						glow3:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						glow3:registerEventHandler( "transition_complete_keyframe", glow3Frame3 )
					end
				end
				
				glow3:completeAnimation()
				self.glow3:setAlpha( 1 )
				glow3Frame2( glow3, {} )
				local static1Frame2 = function ( static1, event )
					local static1Frame3 = function ( static1, event )
						local static1Frame4 = function ( static1, event )
							local static1Frame5 = function ( static1, event )
								local static1Frame6 = function ( static1, event )
									local static1Frame7 = function ( static1, event )
										local static1Frame8 = function ( static1, event )
											local static1Frame9 = function ( static1, event )
												local static1Frame10 = function ( static1, event )
													local static1Frame11 = function ( static1, event )
														if not event.interrupted then
															static1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
														end
														static1:setAlpha( 0.8 )
														if event.interrupted then
															self.clipFinished( static1, event )
														else
															static1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														static1Frame11( static1, event )
														return 
													else
														static1:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
														static1:registerEventHandler( "transition_complete_keyframe", static1Frame11 )
													end
												end
												
												if event.interrupted then
													static1Frame10( static1, event )
													return 
												else
													static1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													static1:setAlpha( 0 )
													static1:registerEventHandler( "transition_complete_keyframe", static1Frame10 )
												end
											end
											
											if event.interrupted then
												static1Frame9( static1, event )
												return 
											else
												static1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												static1:registerEventHandler( "transition_complete_keyframe", static1Frame9 )
											end
										end
										
										if event.interrupted then
											static1Frame8( static1, event )
											return 
										else
											static1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											static1:setAlpha( 0.8 )
											static1:registerEventHandler( "transition_complete_keyframe", static1Frame8 )
										end
									end
									
									if event.interrupted then
										static1Frame7( static1, event )
										return 
									else
										static1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										static1:registerEventHandler( "transition_complete_keyframe", static1Frame7 )
									end
								end
								
								if event.interrupted then
									static1Frame6( static1, event )
									return 
								else
									static1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									static1:setAlpha( 0 )
									static1:registerEventHandler( "transition_complete_keyframe", static1Frame6 )
								end
							end
							
							if event.interrupted then
								static1Frame5( static1, event )
								return 
							else
								static1:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
								static1:registerEventHandler( "transition_complete_keyframe", static1Frame5 )
							end
						end
						
						if event.interrupted then
							static1Frame4( static1, event )
							return 
						else
							static1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							static1:setAlpha( 0.8 )
							static1:registerEventHandler( "transition_complete_keyframe", static1Frame4 )
						end
					end
					
					if event.interrupted then
						static1Frame3( static1, event )
						return 
					else
						static1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						static1:setAlpha( 0 )
						static1:registerEventHandler( "transition_complete_keyframe", static1Frame3 )
					end
				end
				
				static1:completeAnimation()
				self.static1:setAlpha( 0.8 )
				static1Frame2( static1, {} )
				local static2Frame2 = function ( static2, event )
					local static2Frame3 = function ( static2, event )
						local static2Frame4 = function ( static2, event )
							local static2Frame5 = function ( static2, event )
								local static2Frame6 = function ( static2, event )
									local static2Frame7 = function ( static2, event )
										local static2Frame8 = function ( static2, event )
											local static2Frame9 = function ( static2, event )
												if not event.interrupted then
													static2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
												end
												static2:setAlpha( 0.8 )
												if event.interrupted then
													self.clipFinished( static2, event )
												else
													static2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												static2Frame9( static2, event )
												return 
											else
												static2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												static2:registerEventHandler( "transition_complete_keyframe", static2Frame9 )
											end
										end
										
										if event.interrupted then
											static2Frame8( static2, event )
											return 
										else
											static2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											static2:setAlpha( 0 )
											static2:registerEventHandler( "transition_complete_keyframe", static2Frame8 )
										end
									end
									
									if event.interrupted then
										static2Frame7( static2, event )
										return 
									else
										static2:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
										static2:registerEventHandler( "transition_complete_keyframe", static2Frame7 )
									end
								end
								
								if event.interrupted then
									static2Frame6( static2, event )
									return 
								else
									static2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									static2:setAlpha( 0.8 )
									static2:registerEventHandler( "transition_complete_keyframe", static2Frame6 )
								end
							end
							
							if event.interrupted then
								static2Frame5( static2, event )
								return 
							else
								static2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								static2:registerEventHandler( "transition_complete_keyframe", static2Frame5 )
							end
						end
						
						if event.interrupted then
							static2Frame4( static2, event )
							return 
						else
							static2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							static2:setAlpha( 0 )
							static2:registerEventHandler( "transition_complete_keyframe", static2Frame4 )
						end
					end
					
					if event.interrupted then
						static2Frame3( static2, event )
						return 
					else
						static2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						static2:registerEventHandler( "transition_complete_keyframe", static2Frame3 )
					end
				end
				
				static2:completeAnimation()
				self.static2:setAlpha( 0.8 )
				static2Frame2( static2, {} )
				local static3Frame2 = function ( static3, event )
					local static3Frame3 = function ( static3, event )
						local static3Frame4 = function ( static3, event )
							local static3Frame5 = function ( static3, event )
								local static3Frame6 = function ( static3, event )
									local static3Frame7 = function ( static3, event )
										if not event.interrupted then
											static3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										end
										static3:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( static3, event )
										else
											static3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										static3Frame7( static3, event )
										return 
									else
										static3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										static3:setAlpha( 0.8 )
										static3:registerEventHandler( "transition_complete_keyframe", static3Frame7 )
									end
								end
								
								if event.interrupted then
									static3Frame6( static3, event )
									return 
								else
									static3:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
									static3:registerEventHandler( "transition_complete_keyframe", static3Frame6 )
								end
							end
							
							if event.interrupted then
								static3Frame5( static3, event )
								return 
							else
								static3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								static3:setAlpha( 0 )
								static3:registerEventHandler( "transition_complete_keyframe", static3Frame5 )
							end
						end
						
						if event.interrupted then
							static3Frame4( static3, event )
							return 
						else
							static3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							static3:setAlpha( 0.8 )
							static3:registerEventHandler( "transition_complete_keyframe", static3Frame4 )
						end
					end
					
					if event.interrupted then
						static3Frame3( static3, event )
						return 
					else
						static3:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						static3:registerEventHandler( "transition_complete_keyframe", static3Frame3 )
					end
				end
				
				static3:completeAnimation()
				self.static3:setAlpha( 0 )
				static3Frame2( static3, {} )
				local face1Frame2 = function ( face1, event )
					local face1Frame3 = function ( face1, event )
						local face1Frame4 = function ( face1, event )
							local face1Frame5 = function ( face1, event )
								local face1Frame6 = function ( face1, event )
									local face1Frame7 = function ( face1, event )
										local face1Frame8 = function ( face1, event )
											local face1Frame9 = function ( face1, event )
												local face1Frame10 = function ( face1, event )
													local face1Frame11 = function ( face1, event )
														if not event.interrupted then
															face1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
														end
														face1:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( face1, event )
														else
															face1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														face1Frame11( face1, event )
														return 
													else
														face1:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
														face1:registerEventHandler( "transition_complete_keyframe", face1Frame11 )
													end
												end
												
												if event.interrupted then
													face1Frame10( face1, event )
													return 
												else
													face1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													face1:setAlpha( 1 )
													face1:registerEventHandler( "transition_complete_keyframe", face1Frame10 )
												end
											end
											
											if event.interrupted then
												face1Frame9( face1, event )
												return 
											else
												face1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												face1:registerEventHandler( "transition_complete_keyframe", face1Frame9 )
											end
										end
										
										if event.interrupted then
											face1Frame8( face1, event )
											return 
										else
											face1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											face1:setAlpha( 0 )
											face1:registerEventHandler( "transition_complete_keyframe", face1Frame8 )
										end
									end
									
									if event.interrupted then
										face1Frame7( face1, event )
										return 
									else
										face1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										face1:registerEventHandler( "transition_complete_keyframe", face1Frame7 )
									end
								end
								
								if event.interrupted then
									face1Frame6( face1, event )
									return 
								else
									face1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									face1:setAlpha( 1 )
									face1:registerEventHandler( "transition_complete_keyframe", face1Frame6 )
								end
							end
							
							if event.interrupted then
								face1Frame5( face1, event )
								return 
							else
								face1:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
								face1:registerEventHandler( "transition_complete_keyframe", face1Frame5 )
							end
						end
						
						if event.interrupted then
							face1Frame4( face1, event )
							return 
						else
							face1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							face1:setAlpha( 0 )
							face1:registerEventHandler( "transition_complete_keyframe", face1Frame4 )
						end
					end
					
					if event.interrupted then
						face1Frame3( face1, event )
						return 
					else
						face1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						face1:setAlpha( 1 )
						face1:registerEventHandler( "transition_complete_keyframe", face1Frame3 )
					end
				end
				
				face1:completeAnimation()
				self.face1:setAlpha( 0 )
				face1Frame2( face1, {} )
				local face2Frame2 = function ( face2, event )
					local face2Frame3 = function ( face2, event )
						local face2Frame4 = function ( face2, event )
							local face2Frame5 = function ( face2, event )
								local face2Frame6 = function ( face2, event )
									local face2Frame7 = function ( face2, event )
										local face2Frame8 = function ( face2, event )
											local face2Frame9 = function ( face2, event )
												if not event.interrupted then
													face2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
												end
												face2:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( face2, event )
												else
													face2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												face2Frame9( face2, event )
												return 
											else
												face2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												face2:registerEventHandler( "transition_complete_keyframe", face2Frame9 )
											end
										end
										
										if event.interrupted then
											face2Frame8( face2, event )
											return 
										else
											face2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											face2:setAlpha( 1 )
											face2:registerEventHandler( "transition_complete_keyframe", face2Frame8 )
										end
									end
									
									if event.interrupted then
										face2Frame7( face2, event )
										return 
									else
										face2:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
										face2:registerEventHandler( "transition_complete_keyframe", face2Frame7 )
									end
								end
								
								if event.interrupted then
									face2Frame6( face2, event )
									return 
								else
									face2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									face2:setAlpha( 0 )
									face2:registerEventHandler( "transition_complete_keyframe", face2Frame6 )
								end
							end
							
							if event.interrupted then
								face2Frame5( face2, event )
								return 
							else
								face2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								face2:registerEventHandler( "transition_complete_keyframe", face2Frame5 )
							end
						end
						
						if event.interrupted then
							face2Frame4( face2, event )
							return 
						else
							face2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							face2:setAlpha( 1 )
							face2:registerEventHandler( "transition_complete_keyframe", face2Frame4 )
						end
					end
					
					if event.interrupted then
						face2Frame3( face2, event )
						return 
					else
						face2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						face2:registerEventHandler( "transition_complete_keyframe", face2Frame3 )
					end
				end
				
				face2:completeAnimation()
				self.face2:setAlpha( 0 )
				face2Frame2( face2, {} )
				local face3Frame2 = function ( face3, event )
					local face3Frame3 = function ( face3, event )
						local face3Frame4 = function ( face3, event )
							local face3Frame5 = function ( face3, event )
								local face3Frame6 = function ( face3, event )
									local face3Frame7 = function ( face3, event )
										local face3Frame8 = function ( face3, event )
											local face3Frame9 = function ( face3, event )
												if not event.interrupted then
													face3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												end
												face3:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( face3, event )
												else
													face3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												face3Frame9( face3, event )
												return 
											else
												face3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												face3:setAlpha( 0 )
												face3:registerEventHandler( "transition_complete_keyframe", face3Frame9 )
											end
										end
										
										if event.interrupted then
											face3Frame8( face3, event )
											return 
										else
											face3:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
											face3:registerEventHandler( "transition_complete_keyframe", face3Frame8 )
										end
									end
									
									if event.interrupted then
										face3Frame7( face3, event )
										return 
									else
										face3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										face3:setAlpha( 1 )
										face3:registerEventHandler( "transition_complete_keyframe", face3Frame7 )
									end
								end
								
								if event.interrupted then
									face3Frame6( face3, event )
									return 
								else
									face3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									face3:setAlpha( 0 )
									face3:registerEventHandler( "transition_complete_keyframe", face3Frame6 )
								end
							end
							
							if event.interrupted then
								face3Frame5( face3, event )
								return 
							else
								face3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								face3:registerEventHandler( "transition_complete_keyframe", face3Frame5 )
							end
						end
						
						if event.interrupted then
							face3Frame4( face3, event )
							return 
						else
							face3:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							face3:setAlpha( 1 )
							face3:registerEventHandler( "transition_complete_keyframe", face3Frame4 )
						end
					end
					
					if event.interrupted then
						face3Frame3( face3, event )
						return 
					else
						face3:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						face3:setAlpha( 0.85 )
						face3:registerEventHandler( "transition_complete_keyframe", face3Frame3 )
					end
				end
				
				face3:completeAnimation()
				self.face3:setAlpha( 1 )
				face3Frame2( face3, {} )
				local Glow000Frame2 = function ( Glow000, event )
					local Glow000Frame3 = function ( Glow000, event )
						if not event.interrupted then
							Glow000:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
						end
						Glow000:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow000, event )
						else
							Glow000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow000Frame3( Glow000, event )
						return 
					else
						Glow000:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						Glow000:setAlpha( 1 )
						Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame3 )
					end
				end
				
				Glow000:completeAnimation()
				self.Glow000:setAlpha( 0 )
				Glow000Frame2( Glow000, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

