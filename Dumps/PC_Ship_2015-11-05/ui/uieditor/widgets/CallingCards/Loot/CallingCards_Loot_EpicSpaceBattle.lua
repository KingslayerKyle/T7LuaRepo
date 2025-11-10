require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_Loot_EpicSpaceBattle = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_EpicSpaceBattle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_EpicSpaceBattle )
	self.id = "CallingCards_Loot_EpicSpaceBattle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Frame2 = LUI.UIImage.new()
	Frame2:setLeftRight( true, false, 0, 480 )
	Frame2:setTopBottom( true, false, 0, 120 )
	Frame2:setImage( RegisterImage( "uie_t7_callingcard_epicspacebattle_bg2" ) )
	self:addElement( Frame2 )
	self.Frame2 = Frame2
	
	local Frame1 = LUI.UIImage.new()
	Frame1:setLeftRight( true, false, 0, 480 )
	Frame1:setTopBottom( true, false, 0, 120 )
	Frame1:setImage( RegisterImage( "uie_t7_callingcard_epicspacebattle_bg1" ) )
	self:addElement( Frame1 )
	self.Frame1 = Frame1
	
	local flare = LUI.UIImage.new()
	flare:setLeftRight( true, false, 61, 312 )
	flare:setTopBottom( true, false, -29, 91 )
	flare:setImage( RegisterImage( "uie_t7_callingcard_epicspacebattle_lenseflare" ) )
	self:addElement( flare )
	self.flare = flare
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 258, 389.33 )
	Glow:setTopBottom( true, false, -154.35, 111.35 )
	Glow:setRGB( 1, 0.79, 0.35 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Frame2:completeAnimation()
				self.Frame2:setAlpha( 1 )
				self.clipFinished( Frame2, {} )
				local Frame1Frame2 = function ( Frame1, event )
					local Frame1Frame3 = function ( Frame1, event )
						local Frame1Frame4 = function ( Frame1, event )
							local Frame1Frame5 = function ( Frame1, event )
								local Frame1Frame6 = function ( Frame1, event )
									local Frame1Frame7 = function ( Frame1, event )
										local Frame1Frame8 = function ( Frame1, event )
											local Frame1Frame9 = function ( Frame1, event )
												if not event.interrupted then
													Frame1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												end
												Frame1:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( Frame1, event )
												else
													Frame1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Frame1Frame9( Frame1, event )
												return 
											else
												Frame1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												Frame1:setAlpha( 0 )
												Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame9 )
											end
										end
										
										if event.interrupted then
											Frame1Frame8( Frame1, event )
											return 
										else
											Frame1:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
											Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame8 )
										end
									end
									
									if event.interrupted then
										Frame1Frame7( Frame1, event )
										return 
									else
										Frame1:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
										Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame7 )
									end
								end
								
								if event.interrupted then
									Frame1Frame6( Frame1, event )
									return 
								else
									Frame1:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
									Frame1:setAlpha( 1 )
									Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame6 )
								end
							end
							
							if event.interrupted then
								Frame1Frame5( Frame1, event )
								return 
							else
								Frame1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Frame1:setAlpha( 0 )
								Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame5 )
							end
						end
						
						if event.interrupted then
							Frame1Frame4( Frame1, event )
							return 
						else
							Frame1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Frame1:setAlpha( 0.68 )
							Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame4 )
						end
					end
					
					if event.interrupted then
						Frame1Frame3( Frame1, event )
						return 
					else
						Frame1:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						Frame1:setAlpha( 0 )
						Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame3 )
					end
				end
				
				Frame1:completeAnimation()
				self.Frame1:setAlpha( 1 )
				Frame1Frame2( Frame1, {} )
				local flareFrame2 = function ( flare, event )
					local flareFrame3 = function ( flare, event )
						local flareFrame4 = function ( flare, event )
							local flareFrame5 = function ( flare, event )
								if not event.interrupted then
									flare:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								end
								flare:setAlpha( 1 )
								flare:setScale( 1 )
								if event.interrupted then
									self.clipFinished( flare, event )
								else
									flare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								flareFrame5( flare, event )
								return 
							else
								flare:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								flare:setAlpha( 0.93 )
								flare:registerEventHandler( "transition_complete_keyframe", flareFrame5 )
							end
						end
						
						if event.interrupted then
							flareFrame4( flare, event )
							return 
						else
							flare:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
							flare:setAlpha( 1 )
							flare:registerEventHandler( "transition_complete_keyframe", flareFrame4 )
						end
					end
					
					if event.interrupted then
						flareFrame3( flare, event )
						return 
					else
						flare:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
						flare:setAlpha( 0.91 )
						flare:registerEventHandler( "transition_complete_keyframe", flareFrame3 )
					end
				end
				
				flare:completeAnimation()
				self.flare:setAlpha( 1 )
				self.flare:setScale( 1 )
				flareFrame2( flare, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												if not event.interrupted then
													Glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												end
												Glow:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow, event )
												else
													Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 1 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 1 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.83 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

