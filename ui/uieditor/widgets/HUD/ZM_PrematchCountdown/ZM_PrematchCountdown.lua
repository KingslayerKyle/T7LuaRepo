-- d659d924f7f0e55b2d9195d98906ff58
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_Numbers" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_Main" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_2xpBadge" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_2xpWeaponBadge" )
require( "ui.uieditor.widgets.BlackMarket.DoubleLoot" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_2xpWeaponLabel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_FirstGumFree" )

CoD.ZM_PrematchCountdown = InheritFrom( LUI.UIElement )
CoD.ZM_PrematchCountdown.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_PrematchCountdown )
	self.id = "ZM_PrematchCountdown"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( true, false, 495.5, 788 )
	GlowPanel:setTopBottom( true, false, -24.5, 268 )
	GlowPanel:setAlpha( 0 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local PrematchCountdownNumbers = CoD.PrematchCountdown_Numbers.new( menu, controller )
	PrematchCountdownNumbers:setLeftRight( true, true, 0, 0 )
	PrematchCountdownNumbers:setTopBottom( false, false, -30, 20 )
	PrematchCountdownNumbers:setAlpha( 0 )
	PrematchCountdownNumbers.MatchText.MatchText:setText( Engine.Localize( "MP_MATCH_STARTING_IN" ) )
	PrematchCountdownNumbers:registerEventHandler( "menu_opened", function ( element, event )
		local f2_local0 = nil
		if not IsZombies() then
			PlayClipOnElement( self, {
				elementName = "PrematchCountdownNumbers",
				clipName = "Start"
			}, controller )
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( PrematchCountdownNumbers )
	self.PrematchCountdownNumbers = PrematchCountdownNumbers
	
	local DoubleXPTickLeft = LUI.UIImage.new()
	DoubleXPTickLeft:setLeftRight( false, true, -727.67, -692.33 )
	DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
	DoubleXPTickLeft:setRGB( 0, 0, 0 )
	DoubleXPTickLeft:setAlpha( 0 )
	DoubleXPTickLeft:setZRot( 180 )
	DoubleXPTickLeft:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_tick" ) )
	self:addElement( DoubleXPTickLeft )
	self.DoubleXPTickLeft = DoubleXPTickLeft
	
	local DoubleXPTickRight = LUI.UIImage.new()
	DoubleXPTickRight:setLeftRight( false, true, -578.67, -543.33 )
	DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
	DoubleXPTickRight:setRGB( 0, 0, 0 )
	DoubleXPTickRight:setAlpha( 0 )
	DoubleXPTickRight:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_tick" ) )
	self:addElement( DoubleXPTickRight )
	self.DoubleXPTickRight = DoubleXPTickRight
	
	local DoubleXPText = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	DoubleXPText:setLeftRight( false, false, -138.5, 145.5 )
	DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
	DoubleXPText:setAlpha( 0 )
	DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
	DoubleXPText.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	DoubleXPText.MatchText:setLetterSpacing( 1 )
	self:addElement( DoubleXPText )
	self.DoubleXPText = DoubleXPText
	
	local Glitch = CoD.fxGlitch1_Main.new( menu, controller )
	Glitch:setLeftRight( true, false, 405.75, 889.75 )
	Glitch:setTopBottom( true, false, 36, 318 )
	Glitch:setAlpha( 0 )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( true, false, -58, -10 )
	Sound:setTopBottom( true, false, 48.5, 94.5 )
	self:addElement( Sound )
	self.Sound = Sound
	
	local PrematchCountdown2xpBadge = CoD.PrematchCountdown_2xpBadge.new( menu, controller )
	PrematchCountdown2xpBadge:setLeftRight( false, false, -214, -86 )
	PrematchCountdown2xpBadge:setTopBottom( true, false, 48.5, 176.5 )
	PrematchCountdown2xpBadge:setAlpha( 0 )
	self:addElement( PrematchCountdown2xpBadge )
	self.PrematchCountdown2xpBadge = PrematchCountdown2xpBadge
	
	local PrematchCountdown2xpWeaponBadge = CoD.PrematchCountdown_2xpWeaponBadge.new( menu, controller )
	PrematchCountdown2xpWeaponBadge:setLeftRight( false, false, 86, 214 )
	PrematchCountdown2xpWeaponBadge:setTopBottom( true, false, 48.5, 176.5 )
	PrematchCountdown2xpWeaponBadge:setAlpha( 0 )
	self:addElement( PrematchCountdown2xpWeaponBadge )
	self.PrematchCountdown2xpWeaponBadge = PrematchCountdown2xpWeaponBadge
	
	local DoubleLoot = CoD.DoubleLoot.new( menu, controller )
	DoubleLoot:setLeftRight( true, false, 604.67, 684.67 )
	DoubleLoot:setTopBottom( true, false, 72.5, 152.5 )
	DoubleLoot:setAlpha( 0 )
	DoubleLoot:setScale( 1.5 )
	self:addElement( DoubleLoot )
	self.DoubleLoot = DoubleLoot
	
	local DoubleWeaponXPTickRight = LUI.UIImage.new()
	DoubleWeaponXPTickRight:setLeftRight( false, true, -433.33, -398 )
	DoubleWeaponXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
	DoubleWeaponXPTickRight:setRGB( 0, 0, 0 )
	DoubleWeaponXPTickRight:setAlpha( 0 )
	DoubleWeaponXPTickRight:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_tick" ) )
	self:addElement( DoubleWeaponXPTickRight )
	self.DoubleWeaponXPTickRight = DoubleWeaponXPTickRight
	
	local DoubleWeaponXPTickLeft = LUI.UIImage.new()
	DoubleWeaponXPTickLeft:setLeftRight( false, true, -582.33, -547 )
	DoubleWeaponXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
	DoubleWeaponXPTickLeft:setRGB( 0, 0, 0 )
	DoubleWeaponXPTickLeft:setAlpha( 0 )
	DoubleWeaponXPTickLeft:setZRot( 180 )
	DoubleWeaponXPTickLeft:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_tick" ) )
	self:addElement( DoubleWeaponXPTickLeft )
	self.DoubleWeaponXPTickLeft = DoubleWeaponXPTickLeft
	
	local DoubleWeaponXPLabel = CoD.PrematchCountdown_2xpWeaponLabel.new( menu, controller )
	DoubleWeaponXPLabel:setLeftRight( false, false, 34, 266 )
	DoubleWeaponXPLabel:setTopBottom( true, false, 186.29, 218.5 )
	DoubleWeaponXPLabel:setAlpha( 0 )
	DoubleWeaponXPLabel.MatchText:setText( Engine.Localize( "MENU_DOUBLE_WEAPON_XP" ) )
	DoubleWeaponXPLabel.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	DoubleWeaponXPLabel.MatchText:setLetterSpacing( 1 )
	self:addElement( DoubleWeaponXPLabel )
	self.DoubleWeaponXPLabel = DoubleWeaponXPLabel
	
	local PrematchCountdownFirstGumFree = CoD.PrematchCountdown_FirstGumFree.new( menu, controller )
	PrematchCountdownFirstGumFree:setLeftRight( false, false, -64, 64 )
	PrematchCountdownFirstGumFree:setTopBottom( true, false, 48.5, 176.5 )
	PrematchCountdownFirstGumFree:setAlpha( 0 )
	self:addElement( PrematchCountdownFirstGumFree )
	self.PrematchCountdownFirstGumFree = PrematchCountdownFirstGumFree
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowDoubleXPIcon = function ()
				self:setupElementClipCounter( 7 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				local DoubleXPTickLeftFrame2 = function ( DoubleXPTickLeft, event )
					local DoubleXPTickLeftFrame3 = function ( DoubleXPTickLeft, event )
						local DoubleXPTickLeftFrame4 = function ( DoubleXPTickLeft, event )
							local DoubleXPTickLeftFrame5 = function ( DoubleXPTickLeft, event )
								local DoubleXPTickLeftFrame6 = function ( DoubleXPTickLeft, event )
									local DoubleXPTickLeftFrame7 = function ( DoubleXPTickLeft, event )
										local DoubleXPTickLeftFrame8 = function ( DoubleXPTickLeft, event )
											local DoubleXPTickLeftFrame9 = function ( DoubleXPTickLeft, event )
												local DoubleXPTickLeftFrame10 = function ( DoubleXPTickLeft, event )
													local DoubleXPTickLeftFrame11 = function ( DoubleXPTickLeft, event )
														local DoubleXPTickLeftFrame12 = function ( DoubleXPTickLeft, event )
															local DoubleXPTickLeftFrame13 = function ( DoubleXPTickLeft, event )
																if not event.interrupted then
																	DoubleXPTickLeft:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickLeft:setLeftRight( false, true, -731, -695.67 )
																DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickLeft:setAlpha( 0 )
																DoubleXPTickLeft:setScale( 1 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickLeft, event )
																else
																	DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickLeftFrame13( DoubleXPTickLeft, event )
																return 
															else
																DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickLeft:setAlpha( 0.3 )
																DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickLeftFrame12( DoubleXPTickLeft, event )
															return 
														else
															DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickLeft:setAlpha( 0.2 )
															DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickLeftFrame11( DoubleXPTickLeft, event )
														return 
													else
														DoubleXPTickLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickLeft:setAlpha( 0.4 )
														DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickLeftFrame10( DoubleXPTickLeft, event )
													return 
												else
													DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickLeft:setAlpha( 0.5 )
													DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickLeftFrame9( DoubleXPTickLeft, event )
												return 
											else
												DoubleXPTickLeft:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickLeft:setAlpha( 0.3 )
												DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickLeftFrame8( DoubleXPTickLeft, event )
											return 
										else
											DoubleXPTickLeft:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickLeft:setAlpha( 0.5 )
											DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickLeftFrame7( DoubleXPTickLeft, event )
										return 
									else
										DoubleXPTickLeft:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickLeftFrame6( DoubleXPTickLeft, event )
									return 
								else
									DoubleXPTickLeft:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickLeft:setLeftRight( false, true, -731, -695.67 )
									DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickLeftFrame5( DoubleXPTickLeft, event )
								return 
							else
								DoubleXPTickLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickLeft:setLeftRight( false, true, -753, -717.67 )
								DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickLeftFrame4( DoubleXPTickLeft, event )
							return 
						else
							DoubleXPTickLeft:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickLeft:setLeftRight( false, true, -728, -692.67 )
							DoubleXPTickLeft:setAlpha( 0.7 )
							DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickLeftFrame3( DoubleXPTickLeft, event )
						return 
					else
						DoubleXPTickLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame3 )
					end
				end
				
				DoubleXPTickLeft:completeAnimation()
				self.DoubleXPTickLeft:setLeftRight( false, true, -992, -956.67 )
				self.DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickLeft:setAlpha( 0 )
				self.DoubleXPTickLeft:setScale( 1 )
				DoubleXPTickLeftFrame2( DoubleXPTickLeft, {} )
				local DoubleXPTickRightFrame2 = function ( DoubleXPTickRight, event )
					local DoubleXPTickRightFrame3 = function ( DoubleXPTickRight, event )
						local DoubleXPTickRightFrame4 = function ( DoubleXPTickRight, event )
							local DoubleXPTickRightFrame5 = function ( DoubleXPTickRight, event )
								local DoubleXPTickRightFrame6 = function ( DoubleXPTickRight, event )
									local DoubleXPTickRightFrame7 = function ( DoubleXPTickRight, event )
										local DoubleXPTickRightFrame8 = function ( DoubleXPTickRight, event )
											local DoubleXPTickRightFrame9 = function ( DoubleXPTickRight, event )
												local DoubleXPTickRightFrame10 = function ( DoubleXPTickRight, event )
													local DoubleXPTickRightFrame11 = function ( DoubleXPTickRight, event )
														local DoubleXPTickRightFrame12 = function ( DoubleXPTickRight, event )
															local DoubleXPTickRightFrame13 = function ( DoubleXPTickRight, event )
																if not event.interrupted then
																	DoubleXPTickRight:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickRight:setLeftRight( false, true, -582, -546.67 )
																DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickRight:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickRight, event )
																else
																	DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickRightFrame13( DoubleXPTickRight, event )
																return 
															else
																DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickRight:setAlpha( 0.3 )
																DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickRightFrame12( DoubleXPTickRight, event )
															return 
														else
															DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickRight:setAlpha( 0.2 )
															DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickRightFrame11( DoubleXPTickRight, event )
														return 
													else
														DoubleXPTickRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickRight:setAlpha( 0.4 )
														DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickRightFrame10( DoubleXPTickRight, event )
													return 
												else
													DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickRight:setAlpha( 0.5 )
													DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickRightFrame9( DoubleXPTickRight, event )
												return 
											else
												DoubleXPTickRight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickRight:setAlpha( 0.3 )
												DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickRightFrame8( DoubleXPTickRight, event )
											return 
										else
											DoubleXPTickRight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickRight:setAlpha( 0.5 )
											DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickRightFrame7( DoubleXPTickRight, event )
										return 
									else
										DoubleXPTickRight:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickRightFrame6( DoubleXPTickRight, event )
									return 
								else
									DoubleXPTickRight:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickRight:setLeftRight( false, true, -582, -546.67 )
									DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickRightFrame5( DoubleXPTickRight, event )
								return 
							else
								DoubleXPTickRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickRight:setLeftRight( false, true, -564, -528.67 )
								DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickRightFrame4( DoubleXPTickRight, event )
							return 
						else
							DoubleXPTickRight:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickRight:setLeftRight( false, true, -579, -543.67 )
							DoubleXPTickRight:setAlpha( 0.7 )
							DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickRightFrame3( DoubleXPTickRight, event )
						return 
					else
						DoubleXPTickRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame3 )
					end
				end
				
				DoubleXPTickRight:completeAnimation()
				self.DoubleXPTickRight:setLeftRight( false, true, -323.33, -288 )
				self.DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickRight:setAlpha( 0 )
				DoubleXPTickRightFrame2( DoubleXPTickRight, {} )
				local DoubleXPTextFrame2 = function ( DoubleXPText, event )
					local DoubleXPTextFrame3 = function ( DoubleXPText, event )
						local DoubleXPTextFrame4 = function ( DoubleXPText, event )
							local DoubleXPTextFrame5 = function ( DoubleXPText, event )
								local DoubleXPTextFrame6 = function ( DoubleXPText, event )
									local DoubleXPTextFrame7 = function ( DoubleXPText, event )
										local DoubleXPTextFrame8 = function ( DoubleXPText, event )
											local DoubleXPTextFrame9 = function ( DoubleXPText, event )
												local DoubleXPTextFrame10 = function ( DoubleXPText, event )
													local DoubleXPTextFrame11 = function ( DoubleXPText, event )
														local DoubleXPTextFrame12 = function ( DoubleXPText, event )
															local DoubleXPTextFrame13 = function ( DoubleXPText, event )
																local DoubleXPTextFrame14 = function ( DoubleXPText, event )
																	local DoubleXPTextFrame15 = function ( DoubleXPText, event )
																		local DoubleXPTextFrame16 = function ( DoubleXPText, event )
																			local DoubleXPTextFrame17 = function ( DoubleXPText, event )
																				local DoubleXPTextFrame18 = function ( DoubleXPText, event )
																					if not event.interrupted then
																						DoubleXPText:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																						DoubleXPText.MatchText:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Linear )
																					end
																					DoubleXPText:setAlpha( 0 )
																					DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
																					if event.interrupted then
																						self.clipFinished( DoubleXPText, event )
																					else
																						DoubleXPText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					DoubleXPTextFrame18( DoubleXPText, event )
																					return 
																				else
																					DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					DoubleXPText:setAlpha( 0.45 )
																					DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				DoubleXPTextFrame17( DoubleXPText, event )
																				return 
																			else
																				DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				DoubleXPText:setAlpha( 0.34 )
																				DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			DoubleXPTextFrame16( DoubleXPText, event )
																			return 
																		else
																			DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																			DoubleXPText:setAlpha( 0.55 )
																			DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DoubleXPTextFrame15( DoubleXPText, event )
																		return 
																	else
																		DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		DoubleXPText:setAlpha( 0.71 )
																		DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	DoubleXPTextFrame14( DoubleXPText, event )
																	return 
																else
																	DoubleXPText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	DoubleXPText:setAlpha( 0.44 )
																	DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame14 )
																end
															end
															
															if event.interrupted then
																DoubleXPTextFrame13( DoubleXPText, event )
																return 
															else
																DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																DoubleXPText:setAlpha( 0.83 )
																DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTextFrame12( DoubleXPText, event )
															return 
														else
															DoubleXPText:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
															DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTextFrame11( DoubleXPText, event )
														return 
													else
														DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														DoubleXPText:setAlpha( 1 )
														DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTextFrame10( DoubleXPText, event )
													return 
												else
													DoubleXPText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTextFrame9( DoubleXPText, event )
												return 
											else
												DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPText:setAlpha( 0.76 )
												DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTextFrame8( DoubleXPText, event )
											return 
										else
											DoubleXPText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTextFrame7( DoubleXPText, event )
										return 
									else
										DoubleXPText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										DoubleXPText:setAlpha( 1 )
										DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTextFrame6( DoubleXPText, event )
									return 
								else
									DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTextFrame5( DoubleXPText, event )
								return 
							else
								DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DoubleXPText:setAlpha( 0.45 )
								DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTextFrame4( DoubleXPText, event )
							return 
						else
							DoubleXPText:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							DoubleXPText:setAlpha( 0.95 )
							DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTextFrame3( DoubleXPText, event )
						return 
					else
						DoubleXPText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame3 )
					end
				end
				
				DoubleXPText:completeAnimation()
				DoubleXPText.MatchText:completeAnimation()
				self.DoubleXPText:setAlpha( 0 )
				self.DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
				DoubleXPTextFrame2( DoubleXPText, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 405.75, 889.75 )
				self.Glitch:setTopBottom( true, false, 36, 318 )
				self.clipFinished( Glitch, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							end
							Sound:playSound( "0", controller )
							if event.interrupted then
								self.clipFinished( Sound, event )
							else
								Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SoundFrame4( Sound, event )
							return 
						else
							Sound:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Sound:playSound( "xp_out", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 1450, false, false, CoD.TweenType.Linear )
						Sound:playSound( "0", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "xp_in", controller )
				SoundFrame2( Sound, {} )
				local PrematchCountdown2xpBadgeFrame2 = function ( PrematchCountdown2xpBadge, event )
					local PrematchCountdown2xpBadgeFrame3 = function ( PrematchCountdown2xpBadge, event )
						local PrematchCountdown2xpBadgeFrame4 = function ( PrematchCountdown2xpBadge, event )
							local PrematchCountdown2xpBadgeFrame5 = function ( PrematchCountdown2xpBadge, event )
								local PrematchCountdown2xpBadgeFrame6 = function ( PrematchCountdown2xpBadge, event )
									local PrematchCountdown2xpBadgeFrame7 = function ( PrematchCountdown2xpBadge, event )
										local PrematchCountdown2xpBadgeFrame8 = function ( PrematchCountdown2xpBadge, event )
											local PrematchCountdown2xpBadgeFrame9 = function ( PrematchCountdown2xpBadge, event )
												local PrematchCountdown2xpBadgeFrame10 = function ( PrematchCountdown2xpBadge, event )
													if not event.interrupted then
														PrematchCountdown2xpBadge:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
													end
													PrematchCountdown2xpBadge:setLeftRight( false, false, -64, 64 )
													PrematchCountdown2xpBadge:setTopBottom( true, false, 48.5, 176.5 )
													PrematchCountdown2xpBadge:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( PrematchCountdown2xpBadge, event )
													else
														PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PrematchCountdown2xpBadgeFrame10( PrematchCountdown2xpBadge, event )
													return 
												else
													PrematchCountdown2xpBadge:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
													PrematchCountdown2xpBadge:setAlpha( 1 )
													PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame10 )
												end
											end
											
											if event.interrupted then
												PrematchCountdown2xpBadgeFrame9( PrematchCountdown2xpBadge, event )
												return 
											else
												PrematchCountdown2xpBadge:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
												PrematchCountdown2xpBadge:setAlpha( 0.2 )
												PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame9 )
											end
										end
										
										if event.interrupted then
											PrematchCountdown2xpBadgeFrame8( PrematchCountdown2xpBadge, event )
											return 
										else
											PrematchCountdown2xpBadge:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
											PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame8 )
										end
									end
									
									if event.interrupted then
										PrematchCountdown2xpBadgeFrame7( PrematchCountdown2xpBadge, event )
										return 
									else
										PrematchCountdown2xpBadge:beginAnimation( "keyframe", 139, false, true, CoD.TweenType.Bounce )
										PrematchCountdown2xpBadge:setAlpha( 1 )
										PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame7 )
									end
								end
								
								if event.interrupted then
									PrematchCountdown2xpBadgeFrame6( PrematchCountdown2xpBadge, event )
									return 
								else
									PrematchCountdown2xpBadge:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Bounce )
									PrematchCountdown2xpBadge:setAlpha( 0.2 )
									PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame6 )
								end
							end
							
							if event.interrupted then
								PrematchCountdown2xpBadgeFrame5( PrematchCountdown2xpBadge, event )
								return 
							else
								PrematchCountdown2xpBadge:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Bounce )
								PrematchCountdown2xpBadge:setAlpha( 1 )
								PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame5 )
							end
						end
						
						if event.interrupted then
							PrematchCountdown2xpBadgeFrame4( PrematchCountdown2xpBadge, event )
							return 
						else
							PrematchCountdown2xpBadge:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							PrematchCountdown2xpBadge:setAlpha( 0.2 )
							PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame4 )
						end
					end
					
					if event.interrupted then
						PrematchCountdown2xpBadgeFrame3( PrematchCountdown2xpBadge, event )
						return 
					else
						PrematchCountdown2xpBadge:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PrematchCountdown2xpBadge:setAlpha( 1 )
						PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame3 )
					end
				end
				
				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setLeftRight( false, false, -64, 64 )
				self.PrematchCountdown2xpBadge:setTopBottom( true, false, 48.5, 176.5 )
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				PrematchCountdown2xpBadgeFrame2( PrematchCountdown2xpBadge, {} )
			end,
			ShowDoubleLootIcon = function ()
				self:setupElementClipCounter( 8 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				local DoubleXPTickLeftFrame2 = function ( DoubleXPTickLeft, event )
					local DoubleXPTickLeftFrame3 = function ( DoubleXPTickLeft, event )
						local DoubleXPTickLeftFrame4 = function ( DoubleXPTickLeft, event )
							local DoubleXPTickLeftFrame5 = function ( DoubleXPTickLeft, event )
								local DoubleXPTickLeftFrame6 = function ( DoubleXPTickLeft, event )
									local DoubleXPTickLeftFrame7 = function ( DoubleXPTickLeft, event )
										local DoubleXPTickLeftFrame8 = function ( DoubleXPTickLeft, event )
											local DoubleXPTickLeftFrame9 = function ( DoubleXPTickLeft, event )
												local DoubleXPTickLeftFrame10 = function ( DoubleXPTickLeft, event )
													local DoubleXPTickLeftFrame11 = function ( DoubleXPTickLeft, event )
														local DoubleXPTickLeftFrame12 = function ( DoubleXPTickLeft, event )
															local DoubleXPTickLeftFrame13 = function ( DoubleXPTickLeft, event )
																if not event.interrupted then
																	DoubleXPTickLeft:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickLeft:setLeftRight( false, true, -727, -691.67 )
																DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickLeft:setAlpha( 0 )
																DoubleXPTickLeft:setScale( 1 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickLeft, event )
																else
																	DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickLeftFrame13( DoubleXPTickLeft, event )
																return 
															else
																DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickLeft:setAlpha( 0.3 )
																DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickLeftFrame12( DoubleXPTickLeft, event )
															return 
														else
															DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickLeft:setAlpha( 0.2 )
															DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickLeftFrame11( DoubleXPTickLeft, event )
														return 
													else
														DoubleXPTickLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickLeft:setAlpha( 0.4 )
														DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickLeftFrame10( DoubleXPTickLeft, event )
													return 
												else
													DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickLeft:setAlpha( 0.5 )
													DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickLeftFrame9( DoubleXPTickLeft, event )
												return 
											else
												DoubleXPTickLeft:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickLeft:setAlpha( 0.3 )
												DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickLeftFrame8( DoubleXPTickLeft, event )
											return 
										else
											DoubleXPTickLeft:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickLeftFrame7( DoubleXPTickLeft, event )
										return 
									else
										DoubleXPTickLeft:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickLeftFrame6( DoubleXPTickLeft, event )
									return 
								else
									DoubleXPTickLeft:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickLeftFrame5( DoubleXPTickLeft, event )
								return 
							else
								DoubleXPTickLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickLeft:setLeftRight( false, true, -727, -691.67 )
								DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickLeftFrame4( DoubleXPTickLeft, event )
							return 
						else
							DoubleXPTickLeft:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickLeft:setLeftRight( false, true, -728, -692.67 )
							DoubleXPTickLeft:setAlpha( 0.5 )
							DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickLeftFrame3( DoubleXPTickLeft, event )
						return 
					else
						DoubleXPTickLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame3 )
					end
				end
				
				DoubleXPTickLeft:completeAnimation()
				self.DoubleXPTickLeft:setLeftRight( false, true, -992, -956.67 )
				self.DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickLeft:setAlpha( 0 )
				self.DoubleXPTickLeft:setScale( 1 )
				DoubleXPTickLeftFrame2( DoubleXPTickLeft, {} )
				local DoubleXPTickRightFrame2 = function ( DoubleXPTickRight, event )
					local DoubleXPTickRightFrame3 = function ( DoubleXPTickRight, event )
						local DoubleXPTickRightFrame4 = function ( DoubleXPTickRight, event )
							local DoubleXPTickRightFrame5 = function ( DoubleXPTickRight, event )
								local DoubleXPTickRightFrame6 = function ( DoubleXPTickRight, event )
									local DoubleXPTickRightFrame7 = function ( DoubleXPTickRight, event )
										local DoubleXPTickRightFrame8 = function ( DoubleXPTickRight, event )
											local DoubleXPTickRightFrame9 = function ( DoubleXPTickRight, event )
												local DoubleXPTickRightFrame10 = function ( DoubleXPTickRight, event )
													local DoubleXPTickRightFrame11 = function ( DoubleXPTickRight, event )
														local DoubleXPTickRightFrame12 = function ( DoubleXPTickRight, event )
															local DoubleXPTickRightFrame13 = function ( DoubleXPTickRight, event )
																if not event.interrupted then
																	DoubleXPTickRight:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickRight:setLeftRight( false, true, -579, -543.67 )
																DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickRight:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickRight, event )
																else
																	DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickRightFrame13( DoubleXPTickRight, event )
																return 
															else
																DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickRight:setAlpha( 0.3 )
																DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickRightFrame12( DoubleXPTickRight, event )
															return 
														else
															DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickRight:setAlpha( 0.2 )
															DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickRightFrame11( DoubleXPTickRight, event )
														return 
													else
														DoubleXPTickRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickRight:setAlpha( 0.4 )
														DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickRightFrame10( DoubleXPTickRight, event )
													return 
												else
													DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickRight:setAlpha( 0.5 )
													DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickRightFrame9( DoubleXPTickRight, event )
												return 
											else
												DoubleXPTickRight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickRight:setAlpha( 0.3 )
												DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickRightFrame8( DoubleXPTickRight, event )
											return 
										else
											DoubleXPTickRight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickRightFrame7( DoubleXPTickRight, event )
										return 
									else
										DoubleXPTickRight:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickRightFrame6( DoubleXPTickRight, event )
									return 
								else
									DoubleXPTickRight:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickRightFrame5( DoubleXPTickRight, event )
								return 
							else
								DoubleXPTickRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickRightFrame4( DoubleXPTickRight, event )
							return 
						else
							DoubleXPTickRight:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickRight:setLeftRight( false, true, -579, -543.67 )
							DoubleXPTickRight:setAlpha( 0.5 )
							DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickRightFrame3( DoubleXPTickRight, event )
						return 
					else
						DoubleXPTickRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame3 )
					end
				end
				
				DoubleXPTickRight:completeAnimation()
				self.DoubleXPTickRight:setLeftRight( false, true, -323.33, -288 )
				self.DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickRight:setAlpha( 0 )
				DoubleXPTickRightFrame2( DoubleXPTickRight, {} )
				local DoubleXPTextFrame2 = function ( DoubleXPText, event )
					local DoubleXPTextFrame3 = function ( DoubleXPText, event )
						local DoubleXPTextFrame4 = function ( DoubleXPText, event )
							local DoubleXPTextFrame5 = function ( DoubleXPText, event )
								local DoubleXPTextFrame6 = function ( DoubleXPText, event )
									local DoubleXPTextFrame7 = function ( DoubleXPText, event )
										local DoubleXPTextFrame8 = function ( DoubleXPText, event )
											local DoubleXPTextFrame9 = function ( DoubleXPText, event )
												local DoubleXPTextFrame10 = function ( DoubleXPText, event )
													local DoubleXPTextFrame11 = function ( DoubleXPText, event )
														local DoubleXPTextFrame12 = function ( DoubleXPText, event )
															local DoubleXPTextFrame13 = function ( DoubleXPText, event )
																local DoubleXPTextFrame14 = function ( DoubleXPText, event )
																	local DoubleXPTextFrame15 = function ( DoubleXPText, event )
																		local DoubleXPTextFrame16 = function ( DoubleXPText, event )
																			local DoubleXPTextFrame17 = function ( DoubleXPText, event )
																				local DoubleXPTextFrame18 = function ( DoubleXPText, event )
																					local DoubleXPTextFrame19 = function ( DoubleXPText, event )
																						if not event.interrupted then
																							DoubleXPText:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																							DoubleXPText.MatchText:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Linear )
																						end
																						DoubleXPText:setAlpha( 0 )
																						DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLELOOT" ) )
																						if event.interrupted then
																							self.clipFinished( DoubleXPText, event )
																						else
																							DoubleXPText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						DoubleXPTextFrame19( DoubleXPText, event )
																						return 
																					else
																						DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						DoubleXPText:setAlpha( 0.45 )
																						DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					DoubleXPTextFrame18( DoubleXPText, event )
																					return 
																				else
																					DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					DoubleXPText:setAlpha( 0.34 )
																					DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				DoubleXPTextFrame17( DoubleXPText, event )
																				return 
																			else
																				DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																				DoubleXPText:setAlpha( 0.55 )
																				DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			DoubleXPTextFrame16( DoubleXPText, event )
																			return 
																		else
																			DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			DoubleXPText:setAlpha( 0.71 )
																			DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DoubleXPTextFrame15( DoubleXPText, event )
																		return 
																	else
																		DoubleXPText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																		DoubleXPText:setAlpha( 0.44 )
																		DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	DoubleXPTextFrame14( DoubleXPText, event )
																	return 
																else
																	DoubleXPText:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																	DoubleXPText:setAlpha( 0.83 )
																	DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame14 )
																end
															end
															
															if event.interrupted then
																DoubleXPTextFrame13( DoubleXPText, event )
																return 
															else
																DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																DoubleXPText:setAlpha( 0.98 )
																DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTextFrame12( DoubleXPText, event )
															return 
														else
															DoubleXPText:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
															DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTextFrame11( DoubleXPText, event )
														return 
													else
														DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														DoubleXPText:setAlpha( 1 )
														DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTextFrame10( DoubleXPText, event )
													return 
												else
													DoubleXPText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTextFrame9( DoubleXPText, event )
												return 
											else
												DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPText:setAlpha( 0.76 )
												DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTextFrame8( DoubleXPText, event )
											return 
										else
											DoubleXPText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTextFrame7( DoubleXPText, event )
										return 
									else
										DoubleXPText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										DoubleXPText:setAlpha( 1 )
										DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTextFrame6( DoubleXPText, event )
									return 
								else
									DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTextFrame5( DoubleXPText, event )
								return 
							else
								DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DoubleXPText:setAlpha( 0.45 )
								DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTextFrame4( DoubleXPText, event )
							return 
						else
							DoubleXPText:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							DoubleXPText:setAlpha( 0.95 )
							DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTextFrame3( DoubleXPText, event )
						return 
					else
						DoubleXPText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame3 )
					end
				end
				
				DoubleXPText:completeAnimation()
				DoubleXPText.MatchText:completeAnimation()
				self.DoubleXPText:setAlpha( 0 )
				self.DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLELOOT" ) )
				DoubleXPTextFrame2( DoubleXPText, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 405.75, 889.75 )
				self.Glitch:setTopBottom( true, false, 36, 318 )
				self.clipFinished( Glitch, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							end
							Sound:playSound( "0", controller )
							if event.interrupted then
								self.clipFinished( Sound, event )
							else
								Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SoundFrame4( Sound, event )
							return 
						else
							Sound:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Sound:playSound( "xp_out", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 1450, false, false, CoD.TweenType.Linear )
						Sound:playSound( "0", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "xp_in", controller )
				SoundFrame2( Sound, {} )
				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				self.clipFinished( PrematchCountdown2xpBadge, {} )
				local DoubleLootFrame2 = function ( DoubleLoot, event )
					local DoubleLootFrame3 = function ( DoubleLoot, event )
						local DoubleLootFrame4 = function ( DoubleLoot, event )
							local DoubleLootFrame5 = function ( DoubleLoot, event )
								local DoubleLootFrame6 = function ( DoubleLoot, event )
									local DoubleLootFrame7 = function ( DoubleLoot, event )
										local DoubleLootFrame8 = function ( DoubleLoot, event )
											local DoubleLootFrame9 = function ( DoubleLoot, event )
												local DoubleLootFrame10 = function ( DoubleLoot, event )
													if not event.interrupted then
														DoubleLoot:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
													end
													DoubleLoot:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( DoubleLoot, event )
													else
														DoubleLoot:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													DoubleLootFrame10( DoubleLoot, event )
													return 
												else
													DoubleLoot:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
													DoubleLoot:setAlpha( 0.92 )
													DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleLootFrame9( DoubleLoot, event )
												return 
											else
												DoubleLoot:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
												DoubleLoot:setAlpha( 0.13 )
												DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleLootFrame8( DoubleLoot, event )
											return 
										else
											DoubleLoot:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
											DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleLootFrame7( DoubleLoot, event )
										return 
									else
										DoubleLoot:beginAnimation( "keyframe", 139, false, true, CoD.TweenType.Bounce )
										DoubleLoot:setAlpha( 1 )
										DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleLootFrame6( DoubleLoot, event )
									return 
								else
									DoubleLoot:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Bounce )
									DoubleLoot:setAlpha( 0.25 )
									DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleLootFrame5( DoubleLoot, event )
								return 
							else
								DoubleLoot:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Bounce )
								DoubleLoot:setAlpha( 1 )
								DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleLootFrame4( DoubleLoot, event )
							return 
						else
							DoubleLoot:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							DoubleLoot:setAlpha( 0.25 )
							DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleLootFrame3( DoubleLoot, event )
						return 
					else
						DoubleLoot:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DoubleLoot:setAlpha( 1 )
						DoubleLoot:registerEventHandler( "transition_complete_keyframe", DoubleLootFrame3 )
					end
				end
				
				DoubleLoot:completeAnimation()
				self.DoubleLoot:setAlpha( 0 )
				DoubleLootFrame2( DoubleLoot, {} )
			end,
			ShowDoubleWeaponXPIcon = function ()
				self:setupElementClipCounter( 7 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				local DoubleXPTickLeftFrame2 = function ( DoubleXPTickLeft, event )
					local DoubleXPTickLeftFrame3 = function ( DoubleXPTickLeft, event )
						local DoubleXPTickLeftFrame4 = function ( DoubleXPTickLeft, event )
							local DoubleXPTickLeftFrame5 = function ( DoubleXPTickLeft, event )
								local DoubleXPTickLeftFrame6 = function ( DoubleXPTickLeft, event )
									local DoubleXPTickLeftFrame7 = function ( DoubleXPTickLeft, event )
										local DoubleXPTickLeftFrame8 = function ( DoubleXPTickLeft, event )
											local DoubleXPTickLeftFrame9 = function ( DoubleXPTickLeft, event )
												local DoubleXPTickLeftFrame10 = function ( DoubleXPTickLeft, event )
													local DoubleXPTickLeftFrame11 = function ( DoubleXPTickLeft, event )
														local DoubleXPTickLeftFrame12 = function ( DoubleXPTickLeft, event )
															local DoubleXPTickLeftFrame13 = function ( DoubleXPTickLeft, event )
																if not event.interrupted then
																	DoubleXPTickLeft:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickLeft:setLeftRight( false, true, -733, -697.67 )
																DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickLeft:setAlpha( 0 )
																DoubleXPTickLeft:setScale( 1 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickLeft, event )
																else
																	DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickLeftFrame13( DoubleXPTickLeft, event )
																return 
															else
																DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickLeft:setAlpha( 0.3 )
																DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickLeftFrame12( DoubleXPTickLeft, event )
															return 
														else
															DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickLeft:setAlpha( 0.2 )
															DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickLeftFrame11( DoubleXPTickLeft, event )
														return 
													else
														DoubleXPTickLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickLeft:setAlpha( 0.4 )
														DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickLeftFrame10( DoubleXPTickLeft, event )
													return 
												else
													DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickLeft:setAlpha( 0.5 )
													DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickLeftFrame9( DoubleXPTickLeft, event )
												return 
											else
												DoubleXPTickLeft:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickLeft:setAlpha( 0.3 )
												DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickLeftFrame8( DoubleXPTickLeft, event )
											return 
										else
											DoubleXPTickLeft:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickLeft:setAlpha( 0.5 )
											DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickLeftFrame7( DoubleXPTickLeft, event )
										return 
									else
										DoubleXPTickLeft:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickLeftFrame6( DoubleXPTickLeft, event )
									return 
								else
									DoubleXPTickLeft:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickLeft:setLeftRight( false, true, -733, -697.67 )
									DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickLeftFrame5( DoubleXPTickLeft, event )
								return 
							else
								DoubleXPTickLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickLeft:setLeftRight( false, true, -753, -717.67 )
								DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickLeftFrame4( DoubleXPTickLeft, event )
							return 
						else
							DoubleXPTickLeft:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickLeft:setLeftRight( false, true, -733, -697.67 )
							DoubleXPTickLeft:setAlpha( 0.7 )
							DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickLeftFrame3( DoubleXPTickLeft, event )
						return 
					else
						DoubleXPTickLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame3 )
					end
				end
				
				DoubleXPTickLeft:completeAnimation()
				self.DoubleXPTickLeft:setLeftRight( false, true, -992, -956.67 )
				self.DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickLeft:setAlpha( 0 )
				self.DoubleXPTickLeft:setScale( 1 )
				DoubleXPTickLeftFrame2( DoubleXPTickLeft, {} )
				local DoubleXPTickRightFrame2 = function ( DoubleXPTickRight, event )
					local DoubleXPTickRightFrame3 = function ( DoubleXPTickRight, event )
						local DoubleXPTickRightFrame4 = function ( DoubleXPTickRight, event )
							local DoubleXPTickRightFrame5 = function ( DoubleXPTickRight, event )
								local DoubleXPTickRightFrame6 = function ( DoubleXPTickRight, event )
									local DoubleXPTickRightFrame7 = function ( DoubleXPTickRight, event )
										local DoubleXPTickRightFrame8 = function ( DoubleXPTickRight, event )
											local DoubleXPTickRightFrame9 = function ( DoubleXPTickRight, event )
												local DoubleXPTickRightFrame10 = function ( DoubleXPTickRight, event )
													local DoubleXPTickRightFrame11 = function ( DoubleXPTickRight, event )
														local DoubleXPTickRightFrame12 = function ( DoubleXPTickRight, event )
															local DoubleXPTickRightFrame13 = function ( DoubleXPTickRight, event )
																if not event.interrupted then
																	DoubleXPTickRight:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickRight:setLeftRight( false, true, -584, -548.67 )
																DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickRight:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickRight, event )
																else
																	DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickRightFrame13( DoubleXPTickRight, event )
																return 
															else
																DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickRight:setAlpha( 0.3 )
																DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickRightFrame12( DoubleXPTickRight, event )
															return 
														else
															DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickRight:setAlpha( 0.2 )
															DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickRightFrame11( DoubleXPTickRight, event )
														return 
													else
														DoubleXPTickRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickRight:setAlpha( 0.4 )
														DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickRightFrame10( DoubleXPTickRight, event )
													return 
												else
													DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickRight:setAlpha( 0.5 )
													DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickRightFrame9( DoubleXPTickRight, event )
												return 
											else
												DoubleXPTickRight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickRight:setAlpha( 0.3 )
												DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickRightFrame8( DoubleXPTickRight, event )
											return 
										else
											DoubleXPTickRight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickRight:setAlpha( 0.5 )
											DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickRightFrame7( DoubleXPTickRight, event )
										return 
									else
										DoubleXPTickRight:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickRightFrame6( DoubleXPTickRight, event )
									return 
								else
									DoubleXPTickRight:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickRight:setLeftRight( false, true, -584, -548.67 )
									DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickRightFrame5( DoubleXPTickRight, event )
								return 
							else
								DoubleXPTickRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickRight:setLeftRight( false, true, -564, -528.67 )
								DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickRightFrame4( DoubleXPTickRight, event )
							return 
						else
							DoubleXPTickRight:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickRight:setLeftRight( false, true, -584, -548.67 )
							DoubleXPTickRight:setAlpha( 0.7 )
							DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickRightFrame3( DoubleXPTickRight, event )
						return 
					else
						DoubleXPTickRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame3 )
					end
				end
				
				DoubleXPTickRight:completeAnimation()
				self.DoubleXPTickRight:setLeftRight( false, true, -323.33, -288 )
				self.DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickRight:setAlpha( 0 )
				DoubleXPTickRightFrame2( DoubleXPTickRight, {} )
				local DoubleXPTextFrame2 = function ( DoubleXPText, event )
					local DoubleXPTextFrame3 = function ( DoubleXPText, event )
						local DoubleXPTextFrame4 = function ( DoubleXPText, event )
							local DoubleXPTextFrame5 = function ( DoubleXPText, event )
								local DoubleXPTextFrame6 = function ( DoubleXPText, event )
									local DoubleXPTextFrame7 = function ( DoubleXPText, event )
										local DoubleXPTextFrame8 = function ( DoubleXPText, event )
											local DoubleXPTextFrame9 = function ( DoubleXPText, event )
												local DoubleXPTextFrame10 = function ( DoubleXPText, event )
													local DoubleXPTextFrame11 = function ( DoubleXPText, event )
														local DoubleXPTextFrame12 = function ( DoubleXPText, event )
															local DoubleXPTextFrame13 = function ( DoubleXPText, event )
																local DoubleXPTextFrame14 = function ( DoubleXPText, event )
																	local DoubleXPTextFrame15 = function ( DoubleXPText, event )
																		local DoubleXPTextFrame16 = function ( DoubleXPText, event )
																			local DoubleXPTextFrame17 = function ( DoubleXPText, event )
																				local DoubleXPTextFrame18 = function ( DoubleXPText, event )
																					if not event.interrupted then
																						DoubleXPText:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																						DoubleXPText.MatchText:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Linear )
																					end
																					DoubleXPText:setLeftRight( false, false, -142, 142 )
																					DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
																					DoubleXPText:setAlpha( 0 )
																					DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_WEAPON_XP" ) )
																					if event.interrupted then
																						self.clipFinished( DoubleXPText, event )
																					else
																						DoubleXPText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					DoubleXPTextFrame18( DoubleXPText, event )
																					return 
																				else
																					DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					DoubleXPText:setAlpha( 0.45 )
																					DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				DoubleXPTextFrame17( DoubleXPText, event )
																				return 
																			else
																				DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				DoubleXPText:setAlpha( 0.34 )
																				DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			DoubleXPTextFrame16( DoubleXPText, event )
																			return 
																		else
																			DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																			DoubleXPText:setAlpha( 0.55 )
																			DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DoubleXPTextFrame15( DoubleXPText, event )
																		return 
																	else
																		DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		DoubleXPText:setAlpha( 0.71 )
																		DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	DoubleXPTextFrame14( DoubleXPText, event )
																	return 
																else
																	DoubleXPText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	DoubleXPText:setAlpha( 0.44 )
																	DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame14 )
																end
															end
															
															if event.interrupted then
																DoubleXPTextFrame13( DoubleXPText, event )
																return 
															else
																DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																DoubleXPText:setAlpha( 0.83 )
																DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTextFrame12( DoubleXPText, event )
															return 
														else
															DoubleXPText:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
															DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTextFrame11( DoubleXPText, event )
														return 
													else
														DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														DoubleXPText:setAlpha( 1 )
														DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTextFrame10( DoubleXPText, event )
													return 
												else
													DoubleXPText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTextFrame9( DoubleXPText, event )
												return 
											else
												DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPText:setAlpha( 0.76 )
												DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTextFrame8( DoubleXPText, event )
											return 
										else
											DoubleXPText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTextFrame7( DoubleXPText, event )
										return 
									else
										DoubleXPText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										DoubleXPText:setAlpha( 1 )
										DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTextFrame6( DoubleXPText, event )
									return 
								else
									DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTextFrame5( DoubleXPText, event )
								return 
							else
								DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DoubleXPText:setAlpha( 0.45 )
								DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTextFrame4( DoubleXPText, event )
							return 
						else
							DoubleXPText:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							DoubleXPText:setAlpha( 0.95 )
							DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTextFrame3( DoubleXPText, event )
						return 
					else
						DoubleXPText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame3 )
					end
				end
				
				DoubleXPText:completeAnimation()
				DoubleXPText.MatchText:completeAnimation()
				self.DoubleXPText:setLeftRight( false, false, -142, 142 )
				self.DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
				self.DoubleXPText:setAlpha( 0 )
				self.DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_WEAPON_XP" ) )
				DoubleXPTextFrame2( DoubleXPText, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 405.75, 889.75 )
				self.Glitch:setTopBottom( true, false, 36, 318 )
				self.clipFinished( Glitch, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							end
							Sound:playSound( "0", controller )
							if event.interrupted then
								self.clipFinished( Sound, event )
							else
								Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SoundFrame4( Sound, event )
							return 
						else
							Sound:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Sound:playSound( "xp_out", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 1450, false, false, CoD.TweenType.Linear )
						Sound:playSound( "0", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "xp_in", controller )
				SoundFrame2( Sound, {} )
				local PrematchCountdown2xpWeaponBadgeFrame2 = function ( PrematchCountdown2xpWeaponBadge, event )
					local PrematchCountdown2xpWeaponBadgeFrame3 = function ( PrematchCountdown2xpWeaponBadge, event )
						local PrematchCountdown2xpWeaponBadgeFrame4 = function ( PrematchCountdown2xpWeaponBadge, event )
							local PrematchCountdown2xpWeaponBadgeFrame5 = function ( PrematchCountdown2xpWeaponBadge, event )
								local PrematchCountdown2xpWeaponBadgeFrame6 = function ( PrematchCountdown2xpWeaponBadge, event )
									local PrematchCountdown2xpWeaponBadgeFrame7 = function ( PrematchCountdown2xpWeaponBadge, event )
										local PrematchCountdown2xpWeaponBadgeFrame8 = function ( PrematchCountdown2xpWeaponBadge, event )
											local PrematchCountdown2xpWeaponBadgeFrame9 = function ( PrematchCountdown2xpWeaponBadge, event )
												local PrematchCountdown2xpWeaponBadgeFrame10 = function ( PrematchCountdown2xpWeaponBadge, event )
													if not event.interrupted then
														PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Back )
													end
													PrematchCountdown2xpWeaponBadge:setLeftRight( false, false, -64, 64 )
													PrematchCountdown2xpWeaponBadge:setTopBottom( true, false, 48.5, 176.5 )
													PrematchCountdown2xpWeaponBadge:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( PrematchCountdown2xpWeaponBadge, event )
													else
														PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PrematchCountdown2xpWeaponBadgeFrame10( PrematchCountdown2xpWeaponBadge, event )
													return 
												else
													PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
													PrematchCountdown2xpWeaponBadge:setAlpha( 1 )
													PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame10 )
												end
											end
											
											if event.interrupted then
												PrematchCountdown2xpWeaponBadgeFrame9( PrematchCountdown2xpWeaponBadge, event )
												return 
											else
												PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
												PrematchCountdown2xpWeaponBadge:setAlpha( 0.2 )
												PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame9 )
											end
										end
										
										if event.interrupted then
											PrematchCountdown2xpWeaponBadgeFrame8( PrematchCountdown2xpWeaponBadge, event )
											return 
										else
											PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
											PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame8 )
										end
									end
									
									if event.interrupted then
										PrematchCountdown2xpWeaponBadgeFrame7( PrematchCountdown2xpWeaponBadge, event )
										return 
									else
										PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 139, false, true, CoD.TweenType.Bounce )
										PrematchCountdown2xpWeaponBadge:setAlpha( 1 )
										PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame7 )
									end
								end
								
								if event.interrupted then
									PrematchCountdown2xpWeaponBadgeFrame6( PrematchCountdown2xpWeaponBadge, event )
									return 
								else
									PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Bounce )
									PrematchCountdown2xpWeaponBadge:setAlpha( 0.2 )
									PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame6 )
								end
							end
							
							if event.interrupted then
								PrematchCountdown2xpWeaponBadgeFrame5( PrematchCountdown2xpWeaponBadge, event )
								return 
							else
								PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Bounce )
								PrematchCountdown2xpWeaponBadge:setAlpha( 1 )
								PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame5 )
							end
						end
						
						if event.interrupted then
							PrematchCountdown2xpWeaponBadgeFrame4( PrematchCountdown2xpWeaponBadge, event )
							return 
						else
							PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							PrematchCountdown2xpWeaponBadge:setAlpha( 0.2 )
							PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame4 )
						end
					end
					
					if event.interrupted then
						PrematchCountdown2xpWeaponBadgeFrame3( PrematchCountdown2xpWeaponBadge, event )
						return 
					else
						PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PrematchCountdown2xpWeaponBadge:setAlpha( 1 )
						PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpWeaponBadgeFrame3 )
					end
				end
				
				PrematchCountdown2xpWeaponBadge:completeAnimation()
				self.PrematchCountdown2xpWeaponBadge:setLeftRight( false, false, -64, 64 )
				self.PrematchCountdown2xpWeaponBadge:setTopBottom( true, false, 48.5, 176.5 )
				self.PrematchCountdown2xpWeaponBadge:setAlpha( 0 )
				PrematchCountdown2xpWeaponBadgeFrame2( PrematchCountdown2xpWeaponBadge, {} )
			end,
			ShowDoubleXPandWeaponXP = function ()
				self:setupElementClipCounter( 11 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				local DoubleXPTickLeftFrame2 = function ( DoubleXPTickLeft, event )
					local DoubleXPTickLeftFrame3 = function ( DoubleXPTickLeft, event )
						local DoubleXPTickLeftFrame4 = function ( DoubleXPTickLeft, event )
							local DoubleXPTickLeftFrame5 = function ( DoubleXPTickLeft, event )
								local DoubleXPTickLeftFrame6 = function ( DoubleXPTickLeft, event )
									local DoubleXPTickLeftFrame7 = function ( DoubleXPTickLeft, event )
										local DoubleXPTickLeftFrame8 = function ( DoubleXPTickLeft, event )
											local DoubleXPTickLeftFrame9 = function ( DoubleXPTickLeft, event )
												local DoubleXPTickLeftFrame10 = function ( DoubleXPTickLeft, event )
													local DoubleXPTickLeftFrame11 = function ( DoubleXPTickLeft, event )
														local DoubleXPTickLeftFrame12 = function ( DoubleXPTickLeft, event )
															local DoubleXPTickLeftFrame13 = function ( DoubleXPTickLeft, event )
																if not event.interrupted then
																	DoubleXPTickLeft:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickLeft:setLeftRight( false, true, -883, -847.67 )
																DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickLeft:setAlpha( 0 )
																DoubleXPTickLeft:setScale( 1 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickLeft, event )
																else
																	DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickLeftFrame13( DoubleXPTickLeft, event )
																return 
															else
																DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickLeft:setAlpha( 0.3 )
																DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickLeftFrame12( DoubleXPTickLeft, event )
															return 
														else
															DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickLeft:setAlpha( 0.2 )
															DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickLeftFrame11( DoubleXPTickLeft, event )
														return 
													else
														DoubleXPTickLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickLeft:setAlpha( 0.4 )
														DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickLeftFrame10( DoubleXPTickLeft, event )
													return 
												else
													DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickLeft:setAlpha( 0.5 )
													DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickLeftFrame9( DoubleXPTickLeft, event )
												return 
											else
												DoubleXPTickLeft:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickLeft:setAlpha( 0.3 )
												DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickLeftFrame8( DoubleXPTickLeft, event )
											return 
										else
											DoubleXPTickLeft:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickLeft:setAlpha( 0.5 )
											DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickLeftFrame7( DoubleXPTickLeft, event )
										return 
									else
										DoubleXPTickLeft:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickLeftFrame6( DoubleXPTickLeft, event )
									return 
								else
									DoubleXPTickLeft:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickLeft:setLeftRight( false, true, -883, -847.67 )
									DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickLeftFrame5( DoubleXPTickLeft, event )
								return 
							else
								DoubleXPTickLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickLeft:setLeftRight( false, true, -903, -867.67 )
								DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickLeftFrame4( DoubleXPTickLeft, event )
							return 
						else
							DoubleXPTickLeft:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickLeft:setLeftRight( false, true, -883, -847.67 )
							DoubleXPTickLeft:setAlpha( 0.7 )
							DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickLeftFrame3( DoubleXPTickLeft, event )
						return 
					else
						DoubleXPTickLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame3 )
					end
				end
				
				DoubleXPTickLeft:completeAnimation()
				self.DoubleXPTickLeft:setLeftRight( false, true, -1142, -1106.67 )
				self.DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickLeft:setAlpha( 0 )
				self.DoubleXPTickLeft:setScale( 1 )
				DoubleXPTickLeftFrame2( DoubleXPTickLeft, {} )
				local DoubleXPTickRightFrame2 = function ( DoubleXPTickRight, event )
					local DoubleXPTickRightFrame3 = function ( DoubleXPTickRight, event )
						local DoubleXPTickRightFrame4 = function ( DoubleXPTickRight, event )
							local DoubleXPTickRightFrame5 = function ( DoubleXPTickRight, event )
								local DoubleXPTickRightFrame6 = function ( DoubleXPTickRight, event )
									local DoubleXPTickRightFrame7 = function ( DoubleXPTickRight, event )
										local DoubleXPTickRightFrame8 = function ( DoubleXPTickRight, event )
											local DoubleXPTickRightFrame9 = function ( DoubleXPTickRight, event )
												local DoubleXPTickRightFrame10 = function ( DoubleXPTickRight, event )
													local DoubleXPTickRightFrame11 = function ( DoubleXPTickRight, event )
														local DoubleXPTickRightFrame12 = function ( DoubleXPTickRight, event )
															local DoubleXPTickRightFrame13 = function ( DoubleXPTickRight, event )
																if not event.interrupted then
																	DoubleXPTickRight:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickRight:setLeftRight( false, true, -734, -698.67 )
																DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickRight:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickRight, event )
																else
																	DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickRightFrame13( DoubleXPTickRight, event )
																return 
															else
																DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickRight:setAlpha( 0.3 )
																DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickRightFrame12( DoubleXPTickRight, event )
															return 
														else
															DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickRight:setAlpha( 0.2 )
															DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickRightFrame11( DoubleXPTickRight, event )
														return 
													else
														DoubleXPTickRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickRight:setAlpha( 0.4 )
														DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickRightFrame10( DoubleXPTickRight, event )
													return 
												else
													DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickRight:setAlpha( 0.5 )
													DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickRightFrame9( DoubleXPTickRight, event )
												return 
											else
												DoubleXPTickRight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickRight:setAlpha( 0.3 )
												DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickRightFrame8( DoubleXPTickRight, event )
											return 
										else
											DoubleXPTickRight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickRight:setAlpha( 0.5 )
											DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickRightFrame7( DoubleXPTickRight, event )
										return 
									else
										DoubleXPTickRight:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickRightFrame6( DoubleXPTickRight, event )
									return 
								else
									DoubleXPTickRight:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickRight:setLeftRight( false, true, -734, -698.67 )
									DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickRightFrame5( DoubleXPTickRight, event )
								return 
							else
								DoubleXPTickRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickRight:setLeftRight( false, true, -714, -678.67 )
								DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickRightFrame4( DoubleXPTickRight, event )
							return 
						else
							DoubleXPTickRight:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Bounce )
							DoubleXPTickRight:setLeftRight( false, true, -734, -698.67 )
							DoubleXPTickRight:setAlpha( 0.7 )
							DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickRightFrame3( DoubleXPTickRight, event )
						return 
					else
						DoubleXPTickRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame3 )
					end
				end
				
				DoubleXPTickRight:completeAnimation()
				self.DoubleXPTickRight:setLeftRight( false, true, -473.33, -438 )
				self.DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickRight:setAlpha( 0 )
				DoubleXPTickRightFrame2( DoubleXPTickRight, {} )
				local DoubleXPTextFrame2 = function ( DoubleXPText, event )
					local DoubleXPTextFrame3 = function ( DoubleXPText, event )
						local DoubleXPTextFrame4 = function ( DoubleXPText, event )
							local DoubleXPTextFrame5 = function ( DoubleXPText, event )
								local DoubleXPTextFrame6 = function ( DoubleXPText, event )
									local DoubleXPTextFrame7 = function ( DoubleXPText, event )
										local DoubleXPTextFrame8 = function ( DoubleXPText, event )
											local DoubleXPTextFrame9 = function ( DoubleXPText, event )
												local DoubleXPTextFrame10 = function ( DoubleXPText, event )
													local DoubleXPTextFrame11 = function ( DoubleXPText, event )
														local DoubleXPTextFrame12 = function ( DoubleXPText, event )
															local DoubleXPTextFrame13 = function ( DoubleXPText, event )
																local DoubleXPTextFrame14 = function ( DoubleXPText, event )
																	local DoubleXPTextFrame15 = function ( DoubleXPText, event )
																		local DoubleXPTextFrame16 = function ( DoubleXPText, event )
																			local DoubleXPTextFrame17 = function ( DoubleXPText, event )
																				local DoubleXPTextFrame18 = function ( DoubleXPText, event )
																					if not event.interrupted then
																						DoubleXPText:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																						DoubleXPText.MatchText:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Linear )
																					end
																					DoubleXPText:setLeftRight( false, false, -292, -8 )
																					DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
																					DoubleXPText:setAlpha( 0 )
																					DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
																					if event.interrupted then
																						self.clipFinished( DoubleXPText, event )
																					else
																						DoubleXPText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					DoubleXPTextFrame18( DoubleXPText, event )
																					return 
																				else
																					DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					DoubleXPText:setAlpha( 0.45 )
																					DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				DoubleXPTextFrame17( DoubleXPText, event )
																				return 
																			else
																				DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				DoubleXPText:setAlpha( 0.34 )
																				DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			DoubleXPTextFrame16( DoubleXPText, event )
																			return 
																		else
																			DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																			DoubleXPText:setAlpha( 0.55 )
																			DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DoubleXPTextFrame15( DoubleXPText, event )
																		return 
																	else
																		DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		DoubleXPText:setAlpha( 0.71 )
																		DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	DoubleXPTextFrame14( DoubleXPText, event )
																	return 
																else
																	DoubleXPText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	DoubleXPText:setAlpha( 0.44 )
																	DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame14 )
																end
															end
															
															if event.interrupted then
																DoubleXPTextFrame13( DoubleXPText, event )
																return 
															else
																DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																DoubleXPText:setAlpha( 0.83 )
																DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTextFrame12( DoubleXPText, event )
															return 
														else
															DoubleXPText:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
															DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTextFrame11( DoubleXPText, event )
														return 
													else
														DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														DoubleXPText:setAlpha( 1 )
														DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTextFrame10( DoubleXPText, event )
													return 
												else
													DoubleXPText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTextFrame9( DoubleXPText, event )
												return 
											else
												DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPText:setAlpha( 0.76 )
												DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTextFrame8( DoubleXPText, event )
											return 
										else
											DoubleXPText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTextFrame7( DoubleXPText, event )
										return 
									else
										DoubleXPText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										DoubleXPText:setAlpha( 1 )
										DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTextFrame6( DoubleXPText, event )
									return 
								else
									DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTextFrame5( DoubleXPText, event )
								return 
							else
								DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DoubleXPText:setAlpha( 0.45 )
								DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTextFrame4( DoubleXPText, event )
							return 
						else
							DoubleXPText:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							DoubleXPText:setAlpha( 0.95 )
							DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTextFrame3( DoubleXPText, event )
						return 
					else
						DoubleXPText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame3 )
					end
				end
				
				DoubleXPText:completeAnimation()
				DoubleXPText.MatchText:completeAnimation()
				self.DoubleXPText:setLeftRight( false, false, -292, -8 )
				self.DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
				self.DoubleXPText:setAlpha( 0 )
				self.DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
				DoubleXPTextFrame2( DoubleXPText, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 405.75, 889.75 )
				self.Glitch:setTopBottom( true, false, 36, 318 )
				self.clipFinished( Glitch, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							end
							Sound:playSound( "0", controller )
							if event.interrupted then
								self.clipFinished( Sound, event )
							else
								Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SoundFrame4( Sound, event )
							return 
						else
							Sound:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Sound:playSound( "xp_out", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 1450, false, false, CoD.TweenType.Linear )
						Sound:playSound( "0", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "xp_in", controller )
				SoundFrame2( Sound, {} )
				local PrematchCountdown2xpBadgeFrame2 = function ( PrematchCountdown2xpBadge, event )
					local PrematchCountdown2xpBadgeFrame3 = function ( PrematchCountdown2xpBadge, event )
						local PrematchCountdown2xpBadgeFrame4 = function ( PrematchCountdown2xpBadge, event )
							local PrematchCountdown2xpBadgeFrame5 = function ( PrematchCountdown2xpBadge, event )
								local PrematchCountdown2xpBadgeFrame6 = function ( PrematchCountdown2xpBadge, event )
									local PrematchCountdown2xpBadgeFrame7 = function ( PrematchCountdown2xpBadge, event )
										local PrematchCountdown2xpBadgeFrame8 = function ( PrematchCountdown2xpBadge, event )
											local PrematchCountdown2xpBadgeFrame9 = function ( PrematchCountdown2xpBadge, event )
												local PrematchCountdown2xpBadgeFrame10 = function ( PrematchCountdown2xpBadge, event )
													if not event.interrupted then
														PrematchCountdown2xpBadge:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
													end
													PrematchCountdown2xpBadge:setLeftRight( false, false, -214, -86 )
													PrematchCountdown2xpBadge:setTopBottom( true, false, 48.5, 176.5 )
													PrematchCountdown2xpBadge:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( PrematchCountdown2xpBadge, event )
													else
														PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PrematchCountdown2xpBadgeFrame10( PrematchCountdown2xpBadge, event )
													return 
												else
													PrematchCountdown2xpBadge:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
													PrematchCountdown2xpBadge:setAlpha( 1 )
													PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame10 )
												end
											end
											
											if event.interrupted then
												PrematchCountdown2xpBadgeFrame9( PrematchCountdown2xpBadge, event )
												return 
											else
												PrematchCountdown2xpBadge:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
												PrematchCountdown2xpBadge:setAlpha( 0.2 )
												PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame9 )
											end
										end
										
										if event.interrupted then
											PrematchCountdown2xpBadgeFrame8( PrematchCountdown2xpBadge, event )
											return 
										else
											PrematchCountdown2xpBadge:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
											PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame8 )
										end
									end
									
									if event.interrupted then
										PrematchCountdown2xpBadgeFrame7( PrematchCountdown2xpBadge, event )
										return 
									else
										PrematchCountdown2xpBadge:beginAnimation( "keyframe", 139, false, true, CoD.TweenType.Bounce )
										PrematchCountdown2xpBadge:setAlpha( 1 )
										PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame7 )
									end
								end
								
								if event.interrupted then
									PrematchCountdown2xpBadgeFrame6( PrematchCountdown2xpBadge, event )
									return 
								else
									PrematchCountdown2xpBadge:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Bounce )
									PrematchCountdown2xpBadge:setAlpha( 0.2 )
									PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame6 )
								end
							end
							
							if event.interrupted then
								PrematchCountdown2xpBadgeFrame5( PrematchCountdown2xpBadge, event )
								return 
							else
								PrematchCountdown2xpBadge:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Bounce )
								PrematchCountdown2xpBadge:setAlpha( 1 )
								PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame5 )
							end
						end
						
						if event.interrupted then
							PrematchCountdown2xpBadgeFrame4( PrematchCountdown2xpBadge, event )
							return 
						else
							PrematchCountdown2xpBadge:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							PrematchCountdown2xpBadge:setAlpha( 0.2 )
							PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame4 )
						end
					end
					
					if event.interrupted then
						PrematchCountdown2xpBadgeFrame3( PrematchCountdown2xpBadge, event )
						return 
					else
						PrematchCountdown2xpBadge:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PrematchCountdown2xpBadge:setAlpha( 1 )
						PrematchCountdown2xpBadge:registerEventHandler( "transition_complete_keyframe", PrematchCountdown2xpBadgeFrame3 )
					end
				end
				
				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setLeftRight( false, false, -214, -86 )
				self.PrematchCountdown2xpBadge:setTopBottom( true, false, 48.5, 176.5 )
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				PrematchCountdown2xpBadgeFrame2( PrematchCountdown2xpBadge, {} )
				local f167_local5 = function ( f221_arg0, f221_arg1 )
					local f221_local0 = function ( f222_arg0, f222_arg1 )
						local f222_local0 = function ( f223_arg0, f223_arg1 )
							local f223_local0 = function ( f224_arg0, f224_arg1 )
								local f224_local0 = function ( f225_arg0, f225_arg1 )
									local f225_local0 = function ( f226_arg0, f226_arg1 )
										local f226_local0 = function ( f227_arg0, f227_arg1 )
											local f227_local0 = function ( f228_arg0, f228_arg1 )
												local f228_local0 = function ( f229_arg0, f229_arg1 )
													if not f229_arg1.interrupted then
														f229_arg0:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
													end
													f229_arg0:setLeftRight( false, false, 86, 214 )
													f229_arg0:setTopBottom( true, false, 48.5, 176.5 )
													f229_arg0:setAlpha( 0 )
													if f229_arg1.interrupted then
														self.clipFinished( f229_arg0, f229_arg1 )
													else
														f229_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f228_arg1.interrupted then
													f228_local0( f228_arg0, f228_arg1 )
													return 
												else
													f228_arg0:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Bounce )
													f228_arg0:setAlpha( 1 )
													f228_arg0:registerEventHandler( "transition_complete_keyframe", f228_local0 )
												end
											end
											
											if f227_arg1.interrupted then
												f227_local0( f227_arg0, f227_arg1 )
												return 
											else
												f227_arg0:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Bounce )
												f227_arg0:setAlpha( 0.2 )
												f227_arg0:registerEventHandler( "transition_complete_keyframe", f227_local0 )
											end
										end
										
										if f226_arg1.interrupted then
											f226_local0( f226_arg0, f226_arg1 )
											return 
										else
											f226_arg0:beginAnimation( "keyframe", 1160, false, false, CoD.TweenType.Linear )
											f226_arg0:registerEventHandler( "transition_complete_keyframe", f226_local0 )
										end
									end
									
									if f225_arg1.interrupted then
										f225_local0( f225_arg0, f225_arg1 )
										return 
									else
										f225_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										f225_arg0:setAlpha( 1 )
										f225_arg0:registerEventHandler( "transition_complete_keyframe", f225_local0 )
									end
								end
								
								if f224_arg1.interrupted then
									f224_local0( f224_arg0, f224_arg1 )
									return 
								else
									f224_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									f224_arg0:setAlpha( 0.2 )
									f224_arg0:registerEventHandler( "transition_complete_keyframe", f224_local0 )
								end
							end
							
							if f223_arg1.interrupted then
								f223_local0( f223_arg0, f223_arg1 )
								return 
							else
								f223_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								f223_arg0:setAlpha( 1 )
								f223_arg0:registerEventHandler( "transition_complete_keyframe", f223_local0 )
							end
						end
						
						if f222_arg1.interrupted then
							f222_local0( f222_arg0, f222_arg1 )
							return 
						else
							f222_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							f222_arg0:setAlpha( 0.2 )
							f222_arg0:registerEventHandler( "transition_complete_keyframe", f222_local0 )
						end
					end
					
					if f221_arg1.interrupted then
						f221_local0( f221_arg0, f221_arg1 )
						return 
					else
						f221_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f221_arg0:setAlpha( 1 )
						f221_arg0:registerEventHandler( "transition_complete_keyframe", f221_local0 )
					end
				end
				
				PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				PrematchCountdown2xpWeaponBadge:setLeftRight( false, false, 86, 214 )
				PrematchCountdown2xpWeaponBadge:setTopBottom( true, false, 48.5, 176.5 )
				PrematchCountdown2xpWeaponBadge:setAlpha( 0 )
				PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", f167_local5 )
				local f167_local6 = function ( f230_arg0, f230_arg1 )
					local f230_local0 = function ( f231_arg0, f231_arg1 )
						local f231_local0 = function ( f232_arg0, f232_arg1 )
							local f232_local0 = function ( f233_arg0, f233_arg1 )
								local f233_local0 = function ( f234_arg0, f234_arg1 )
									local f234_local0 = function ( f235_arg0, f235_arg1 )
										local f235_local0 = function ( f236_arg0, f236_arg1 )
											local f236_local0 = function ( f237_arg0, f237_arg1 )
												local f237_local0 = function ( f238_arg0, f238_arg1 )
													local f238_local0 = function ( f239_arg0, f239_arg1 )
														local f239_local0 = function ( f240_arg0, f240_arg1 )
															local f240_local0 = function ( f241_arg0, f241_arg1 )
																if not f241_arg1.interrupted then
																	f241_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																f241_arg0:setLeftRight( false, true, -433.33, -398 )
																f241_arg0:setTopBottom( true, true, 106.75, -601.75 )
																f241_arg0:setAlpha( 0 )
																if f241_arg1.interrupted then
																	self.clipFinished( f241_arg0, f241_arg1 )
																else
																	f241_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if f240_arg1.interrupted then
																f240_local0( f240_arg0, f240_arg1 )
																return 
															else
																f240_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																f240_arg0:setAlpha( 0.3 )
																f240_arg0:registerEventHandler( "transition_complete_keyframe", f240_local0 )
															end
														end
														
														if f239_arg1.interrupted then
															f239_local0( f239_arg0, f239_arg1 )
															return 
														else
															f239_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															f239_arg0:setAlpha( 0.5 )
															f239_arg0:registerEventHandler( "transition_complete_keyframe", f239_local0 )
														end
													end
													
													if f238_arg1.interrupted then
														f238_local0( f238_arg0, f238_arg1 )
														return 
													else
														f238_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														f238_arg0:setAlpha( 0.4 )
														f238_arg0:registerEventHandler( "transition_complete_keyframe", f238_local0 )
													end
												end
												
												if f237_arg1.interrupted then
													f237_local0( f237_arg0, f237_arg1 )
													return 
												else
													f237_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f237_arg0:setAlpha( 0.5 )
													f237_arg0:registerEventHandler( "transition_complete_keyframe", f237_local0 )
												end
											end
											
											if f236_arg1.interrupted then
												f236_local0( f236_arg0, f236_arg1 )
												return 
											else
												f236_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f236_arg0:setAlpha( 0.3 )
												f236_arg0:registerEventHandler( "transition_complete_keyframe", f236_local0 )
											end
										end
										
										if f235_arg1.interrupted then
											f235_local0( f235_arg0, f235_arg1 )
											return 
										else
											f235_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											f235_arg0:setAlpha( 0.5 )
											f235_arg0:registerEventHandler( "transition_complete_keyframe", f235_local0 )
										end
									end
									
									if f234_arg1.interrupted then
										f234_local0( f234_arg0, f234_arg1 )
										return 
									else
										f234_arg0:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										f234_arg0:registerEventHandler( "transition_complete_keyframe", f234_local0 )
									end
								end
								
								if f233_arg1.interrupted then
									f233_local0( f233_arg0, f233_arg1 )
									return 
								else
									f233_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f233_arg0:setLeftRight( false, true, -433.33, -398 )
									f233_arg0:registerEventHandler( "transition_complete_keyframe", f233_local0 )
								end
							end
							
							if f232_arg1.interrupted then
								f232_local0( f232_arg0, f232_arg1 )
								return 
							else
								f232_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								f232_arg0:setLeftRight( false, true, -414, -378.67 )
								f232_arg0:registerEventHandler( "transition_complete_keyframe", f232_local0 )
							end
						end
						
						if f231_arg1.interrupted then
							f231_local0( f231_arg0, f231_arg1 )
							return 
						else
							f231_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f231_arg0:setLeftRight( false, true, -434, -398.67 )
							f231_arg0:setAlpha( 0.7 )
							f231_arg0:registerEventHandler( "transition_complete_keyframe", f231_local0 )
						end
					end
					
					if f230_arg1.interrupted then
						f230_local0( f230_arg0, f230_arg1 )
						return 
					else
						f230_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						f230_arg0:registerEventHandler( "transition_complete_keyframe", f230_local0 )
					end
				end
				
				DoubleWeaponXPTickRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				DoubleWeaponXPTickRight:setLeftRight( false, true, -183.33, -148 )
				DoubleWeaponXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
				DoubleWeaponXPTickRight:setAlpha( 0 )
				DoubleWeaponXPTickRight:registerEventHandler( "transition_complete_keyframe", f167_local6 )
				local f167_local7 = function ( f242_arg0, f242_arg1 )
					local f242_local0 = function ( f243_arg0, f243_arg1 )
						local f243_local0 = function ( f244_arg0, f244_arg1 )
							local f244_local0 = function ( f245_arg0, f245_arg1 )
								local f245_local0 = function ( f246_arg0, f246_arg1 )
									local f246_local0 = function ( f247_arg0, f247_arg1 )
										local f247_local0 = function ( f248_arg0, f248_arg1 )
											local f248_local0 = function ( f249_arg0, f249_arg1 )
												local f249_local0 = function ( f250_arg0, f250_arg1 )
													local f250_local0 = function ( f251_arg0, f251_arg1 )
														local f251_local0 = function ( f252_arg0, f252_arg1 )
															local f252_local0 = function ( f253_arg0, f253_arg1 )
																if not f253_arg1.interrupted then
																	f253_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																f253_arg0:setLeftRight( false, true, -582.33, -547 )
																f253_arg0:setTopBottom( true, true, 106.75, -601.75 )
																f253_arg0:setAlpha( 0 )
																if f253_arg1.interrupted then
																	self.clipFinished( f253_arg0, f253_arg1 )
																else
																	f253_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if f252_arg1.interrupted then
																f252_local0( f252_arg0, f252_arg1 )
																return 
															else
																f252_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																f252_arg0:setAlpha( 0.5 )
																f252_arg0:registerEventHandler( "transition_complete_keyframe", f252_local0 )
															end
														end
														
														if f251_arg1.interrupted then
															f251_local0( f251_arg0, f251_arg1 )
															return 
														else
															f251_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															f251_arg0:setAlpha( 0.3 )
															f251_arg0:registerEventHandler( "transition_complete_keyframe", f251_local0 )
														end
													end
													
													if f250_arg1.interrupted then
														f250_local0( f250_arg0, f250_arg1 )
														return 
													else
														f250_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														f250_arg0:setAlpha( 0.4 )
														f250_arg0:registerEventHandler( "transition_complete_keyframe", f250_local0 )
													end
												end
												
												if f249_arg1.interrupted then
													f249_local0( f249_arg0, f249_arg1 )
													return 
												else
													f249_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f249_arg0:setAlpha( 0.5 )
													f249_arg0:registerEventHandler( "transition_complete_keyframe", f249_local0 )
												end
											end
											
											if f248_arg1.interrupted then
												f248_local0( f248_arg0, f248_arg1 )
												return 
											else
												f248_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f248_arg0:setAlpha( 0.3 )
												f248_arg0:registerEventHandler( "transition_complete_keyframe", f248_local0 )
											end
										end
										
										if f247_arg1.interrupted then
											f247_local0( f247_arg0, f247_arg1 )
											return 
										else
											f247_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											f247_arg0:setAlpha( 0.5 )
											f247_arg0:registerEventHandler( "transition_complete_keyframe", f247_local0 )
										end
									end
									
									if f246_arg1.interrupted then
										f246_local0( f246_arg0, f246_arg1 )
										return 
									else
										f246_arg0:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										f246_arg0:registerEventHandler( "transition_complete_keyframe", f246_local0 )
									end
								end
								
								if f245_arg1.interrupted then
									f245_local0( f245_arg0, f245_arg1 )
									return 
								else
									f245_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f245_arg0:setLeftRight( false, true, -582.33, -547 )
									f245_arg0:registerEventHandler( "transition_complete_keyframe", f245_local0 )
								end
							end
							
							if f244_arg1.interrupted then
								f244_local0( f244_arg0, f244_arg1 )
								return 
							else
								f244_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								f244_arg0:setLeftRight( false, true, -603, -567.67 )
								f244_arg0:registerEventHandler( "transition_complete_keyframe", f244_local0 )
							end
						end
						
						if f243_arg1.interrupted then
							f243_local0( f243_arg0, f243_arg1 )
							return 
						else
							f243_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f243_arg0:setLeftRight( false, true, -583, -547.67 )
							f243_arg0:setAlpha( 0.7 )
							f243_arg0:registerEventHandler( "transition_complete_keyframe", f243_local0 )
						end
					end
					
					if f242_arg1.interrupted then
						f242_local0( f242_arg0, f242_arg1 )
						return 
					else
						f242_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						f242_arg0:registerEventHandler( "transition_complete_keyframe", f242_local0 )
					end
				end
				
				DoubleWeaponXPTickLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				DoubleWeaponXPTickLeft:setLeftRight( false, true, -852, -816.67 )
				DoubleWeaponXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
				DoubleWeaponXPTickLeft:setAlpha( 0 )
				DoubleWeaponXPTickLeft:registerEventHandler( "transition_complete_keyframe", f167_local7 )
				local f167_local8 = function ( f254_arg0, f254_arg1 )
					local f254_local0 = function ( f255_arg0, f255_arg1 )
						local f255_local0 = function ( f256_arg0, f256_arg1 )
							local f256_local0 = function ( f257_arg0, f257_arg1 )
								local f257_local0 = function ( f258_arg0, f258_arg1 )
									local f258_local0 = function ( f259_arg0, f259_arg1 )
										local f259_local0 = function ( f260_arg0, f260_arg1 )
											local f260_local0 = function ( f261_arg0, f261_arg1 )
												local f261_local0 = function ( f262_arg0, f262_arg1 )
													local f262_local0 = function ( f263_arg0, f263_arg1 )
														local f263_local0 = function ( f264_arg0, f264_arg1 )
															local f264_local0 = function ( f265_arg0, f265_arg1 )
																local f265_local0 = function ( f266_arg0, f266_arg1 )
																	local f266_local0 = function ( f267_arg0, f267_arg1 )
																		local f267_local0 = function ( f268_arg0, f268_arg1 )
																			local f268_local0 = function ( f269_arg0, f269_arg1 )
																				if not f269_arg1.interrupted then
																					f269_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																				end
																				f269_arg0:setAlpha( 0 )
																				if f269_arg1.interrupted then
																					self.clipFinished( f269_arg0, f269_arg1 )
																				else
																					f269_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f268_arg1.interrupted then
																				f268_local0( f268_arg0, f268_arg1 )
																				return 
																			else
																				f268_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				f268_arg0:setAlpha( 0.45 )
																				f268_arg0:registerEventHandler( "transition_complete_keyframe", f268_local0 )
																			end
																		end
																		
																		if f267_arg1.interrupted then
																			f267_local0( f267_arg0, f267_arg1 )
																			return 
																		else
																			f267_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			f267_arg0:setAlpha( 0.34 )
																			f267_arg0:registerEventHandler( "transition_complete_keyframe", f267_local0 )
																		end
																	end
																	
																	if f266_arg1.interrupted then
																		f266_local0( f266_arg0, f266_arg1 )
																		return 
																	else
																		f266_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																		f266_arg0:setAlpha( 0.55 )
																		f266_arg0:registerEventHandler( "transition_complete_keyframe", f266_local0 )
																	end
																end
																
																if f265_arg1.interrupted then
																	f265_local0( f265_arg0, f265_arg1 )
																	return 
																else
																	f265_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	f265_arg0:setAlpha( 0.71 )
																	f265_arg0:registerEventHandler( "transition_complete_keyframe", f265_local0 )
																end
															end
															
															if f264_arg1.interrupted then
																f264_local0( f264_arg0, f264_arg1 )
																return 
															else
																f264_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																f264_arg0:setAlpha( 0.44 )
																f264_arg0:registerEventHandler( "transition_complete_keyframe", f264_local0 )
															end
														end
														
														if f263_arg1.interrupted then
															f263_local0( f263_arg0, f263_arg1 )
															return 
														else
															f263_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
															f263_arg0:setAlpha( 0.83 )
															f263_arg0:registerEventHandler( "transition_complete_keyframe", f263_local0 )
														end
													end
													
													if f262_arg1.interrupted then
														f262_local0( f262_arg0, f262_arg1 )
														return 
													else
														f262_arg0:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
														f262_arg0:registerEventHandler( "transition_complete_keyframe", f262_local0 )
													end
												end
												
												if f261_arg1.interrupted then
													f261_local0( f261_arg0, f261_arg1 )
													return 
												else
													f261_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f261_arg0:setAlpha( 1 )
													f261_arg0:registerEventHandler( "transition_complete_keyframe", f261_local0 )
												end
											end
											
											if f260_arg1.interrupted then
												f260_local0( f260_arg0, f260_arg1 )
												return 
											else
												f260_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f260_arg0:registerEventHandler( "transition_complete_keyframe", f260_local0 )
											end
										end
										
										if f259_arg1.interrupted then
											f259_local0( f259_arg0, f259_arg1 )
											return 
										else
											f259_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f259_arg0:setAlpha( 0.76 )
											f259_arg0:registerEventHandler( "transition_complete_keyframe", f259_local0 )
										end
									end
									
									if f258_arg1.interrupted then
										f258_local0( f258_arg0, f258_arg1 )
										return 
									else
										f258_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f258_arg0:setAlpha( 1 )
										f258_arg0:registerEventHandler( "transition_complete_keyframe", f258_local0 )
									end
								end
								
								if f257_arg1.interrupted then
									f257_local0( f257_arg0, f257_arg1 )
									return 
								else
									f257_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f257_arg0:setAlpha( 0 )
									f257_arg0:registerEventHandler( "transition_complete_keyframe", f257_local0 )
								end
							end
							
							if f256_arg1.interrupted then
								f256_local0( f256_arg0, f256_arg1 )
								return 
							else
								f256_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f256_arg0:registerEventHandler( "transition_complete_keyframe", f256_local0 )
							end
						end
						
						if f255_arg1.interrupted then
							f255_local0( f255_arg0, f255_arg1 )
							return 
						else
							f255_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f255_arg0:setAlpha( 0.45 )
							f255_arg0:registerEventHandler( "transition_complete_keyframe", f255_local0 )
						end
					end
					
					if f254_arg1.interrupted then
						f254_local0( f254_arg0, f254_arg1 )
						return 
					else
						f254_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
						f254_arg0:setAlpha( 1 )
						f254_arg0:registerEventHandler( "transition_complete_keyframe", f254_local0 )
					end
				end
				
				DoubleWeaponXPLabel:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				DoubleWeaponXPLabel:setAlpha( 0 )
				DoubleWeaponXPLabel:registerEventHandler( "transition_complete_keyframe", f167_local8 )
			end,
			ShowFirstGumFree = function ()
				self:setupElementClipCounter( 6 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				local DoubleXPTickLeftFrame2 = function ( DoubleXPTickLeft, event )
					local DoubleXPTickLeftFrame3 = function ( DoubleXPTickLeft, event )
						local DoubleXPTickLeftFrame4 = function ( DoubleXPTickLeft, event )
							local DoubleXPTickLeftFrame5 = function ( DoubleXPTickLeft, event )
								local DoubleXPTickLeftFrame6 = function ( DoubleXPTickLeft, event )
									local DoubleXPTickLeftFrame7 = function ( DoubleXPTickLeft, event )
										local DoubleXPTickLeftFrame8 = function ( DoubleXPTickLeft, event )
											local DoubleXPTickLeftFrame9 = function ( DoubleXPTickLeft, event )
												local DoubleXPTickLeftFrame10 = function ( DoubleXPTickLeft, event )
													local DoubleXPTickLeftFrame11 = function ( DoubleXPTickLeft, event )
														local DoubleXPTickLeftFrame12 = function ( DoubleXPTickLeft, event )
															local DoubleXPTickLeftFrame13 = function ( DoubleXPTickLeft, event )
																if not event.interrupted then
																	DoubleXPTickLeft:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickLeft:setLeftRight( false, true, -733, -697.67 )
																DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickLeft:setAlpha( 0 )
																DoubleXPTickLeft:setScale( 1 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickLeft, event )
																else
																	DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickLeftFrame13( DoubleXPTickLeft, event )
																return 
															else
																DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickLeft:setAlpha( 0.3 )
																DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickLeftFrame12( DoubleXPTickLeft, event )
															return 
														else
															DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickLeft:setAlpha( 0.2 )
															DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickLeftFrame11( DoubleXPTickLeft, event )
														return 
													else
														DoubleXPTickLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickLeft:setAlpha( 0.4 )
														DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickLeftFrame10( DoubleXPTickLeft, event )
													return 
												else
													DoubleXPTickLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickLeft:setAlpha( 0.5 )
													DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickLeftFrame9( DoubleXPTickLeft, event )
												return 
											else
												DoubleXPTickLeft:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickLeft:setAlpha( 0.3 )
												DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickLeftFrame8( DoubleXPTickLeft, event )
											return 
										else
											DoubleXPTickLeft:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickLeft:setAlpha( 0.5 )
											DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickLeftFrame7( DoubleXPTickLeft, event )
										return 
									else
										DoubleXPTickLeft:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickLeftFrame6( DoubleXPTickLeft, event )
									return 
								else
									DoubleXPTickLeft:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickLeft:setLeftRight( false, true, -733, -697.67 )
									DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickLeftFrame5( DoubleXPTickLeft, event )
								return 
							else
								DoubleXPTickLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickLeft:setLeftRight( false, true, -753, -717.67 )
								DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickLeftFrame4( DoubleXPTickLeft, event )
							return 
						else
							DoubleXPTickLeft:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							DoubleXPTickLeft:setLeftRight( false, true, -733, -697.67 )
							DoubleXPTickLeft:setAlpha( 0.7 )
							DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickLeftFrame3( DoubleXPTickLeft, event )
						return 
					else
						DoubleXPTickLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickLeft:registerEventHandler( "transition_complete_keyframe", DoubleXPTickLeftFrame3 )
					end
				end
				
				DoubleXPTickLeft:completeAnimation()
				self.DoubleXPTickLeft:setLeftRight( false, true, -992, -956.67 )
				self.DoubleXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickLeft:setAlpha( 0 )
				self.DoubleXPTickLeft:setScale( 1 )
				DoubleXPTickLeftFrame2( DoubleXPTickLeft, {} )
				local DoubleXPTickRightFrame2 = function ( DoubleXPTickRight, event )
					local DoubleXPTickRightFrame3 = function ( DoubleXPTickRight, event )
						local DoubleXPTickRightFrame4 = function ( DoubleXPTickRight, event )
							local DoubleXPTickRightFrame5 = function ( DoubleXPTickRight, event )
								local DoubleXPTickRightFrame6 = function ( DoubleXPTickRight, event )
									local DoubleXPTickRightFrame7 = function ( DoubleXPTickRight, event )
										local DoubleXPTickRightFrame8 = function ( DoubleXPTickRight, event )
											local DoubleXPTickRightFrame9 = function ( DoubleXPTickRight, event )
												local DoubleXPTickRightFrame10 = function ( DoubleXPTickRight, event )
													local DoubleXPTickRightFrame11 = function ( DoubleXPTickRight, event )
														local DoubleXPTickRightFrame12 = function ( DoubleXPTickRight, event )
															local DoubleXPTickRightFrame13 = function ( DoubleXPTickRight, event )
																if not event.interrupted then
																	DoubleXPTickRight:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DoubleXPTickRight:setLeftRight( false, true, -584, -548.67 )
																DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
																DoubleXPTickRight:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( DoubleXPTickRight, event )
																else
																	DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DoubleXPTickRightFrame13( DoubleXPTickRight, event )
																return 
															else
																DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																DoubleXPTickRight:setAlpha( 0.3 )
																DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTickRightFrame12( DoubleXPTickRight, event )
															return 
														else
															DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															DoubleXPTickRight:setAlpha( 0.2 )
															DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTickRightFrame11( DoubleXPTickRight, event )
														return 
													else
														DoubleXPTickRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														DoubleXPTickRight:setAlpha( 0.4 )
														DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTickRightFrame10( DoubleXPTickRight, event )
													return 
												else
													DoubleXPTickRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DoubleXPTickRight:setAlpha( 0.5 )
													DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTickRightFrame9( DoubleXPTickRight, event )
												return 
											else
												DoubleXPTickRight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPTickRight:setAlpha( 0.3 )
												DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTickRightFrame8( DoubleXPTickRight, event )
											return 
										else
											DoubleXPTickRight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											DoubleXPTickRight:setAlpha( 0.5 )
											DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTickRightFrame7( DoubleXPTickRight, event )
										return 
									else
										DoubleXPTickRight:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTickRightFrame6( DoubleXPTickRight, event )
									return 
								else
									DoubleXPTickRight:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPTickRight:setLeftRight( false, true, -584, -548.67 )
									DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTickRightFrame5( DoubleXPTickRight, event )
								return 
							else
								DoubleXPTickRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DoubleXPTickRight:setLeftRight( false, true, -564, -528.67 )
								DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTickRightFrame4( DoubleXPTickRight, event )
							return 
						else
							DoubleXPTickRight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							DoubleXPTickRight:setLeftRight( false, true, -584, -548.67 )
							DoubleXPTickRight:setAlpha( 0.7 )
							DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTickRightFrame3( DoubleXPTickRight, event )
						return 
					else
						DoubleXPTickRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPTickRight:registerEventHandler( "transition_complete_keyframe", DoubleXPTickRightFrame3 )
					end
				end
				
				DoubleXPTickRight:completeAnimation()
				self.DoubleXPTickRight:setLeftRight( false, true, -323.33, -288 )
				self.DoubleXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
				self.DoubleXPTickRight:setAlpha( 0 )
				DoubleXPTickRightFrame2( DoubleXPTickRight, {} )
				local DoubleXPTextFrame2 = function ( DoubleXPText, event )
					local DoubleXPTextFrame3 = function ( DoubleXPText, event )
						local DoubleXPTextFrame4 = function ( DoubleXPText, event )
							local DoubleXPTextFrame5 = function ( DoubleXPText, event )
								local DoubleXPTextFrame6 = function ( DoubleXPText, event )
									local DoubleXPTextFrame7 = function ( DoubleXPText, event )
										local DoubleXPTextFrame8 = function ( DoubleXPText, event )
											local DoubleXPTextFrame9 = function ( DoubleXPText, event )
												local DoubleXPTextFrame10 = function ( DoubleXPText, event )
													local DoubleXPTextFrame11 = function ( DoubleXPText, event )
														local DoubleXPTextFrame12 = function ( DoubleXPText, event )
															local DoubleXPTextFrame13 = function ( DoubleXPText, event )
																local DoubleXPTextFrame14 = function ( DoubleXPText, event )
																	local DoubleXPTextFrame15 = function ( DoubleXPText, event )
																		local DoubleXPTextFrame16 = function ( DoubleXPText, event )
																			local DoubleXPTextFrame17 = function ( DoubleXPText, event )
																				local DoubleXPTextFrame18 = function ( DoubleXPText, event )
																					if not event.interrupted then
																						DoubleXPText:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																						DoubleXPText.MatchText:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Linear )
																					end
																					DoubleXPText:setLeftRight( false, false, -142, 142 )
																					DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
																					DoubleXPText:setAlpha( 0 )
																					DoubleXPText.MatchText:setText( Engine.Localize( "ZMUI_FIRST_GOBBLEGUM_FREE" ) )
																					if event.interrupted then
																						self.clipFinished( DoubleXPText, event )
																					else
																						DoubleXPText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					DoubleXPTextFrame18( DoubleXPText, event )
																					return 
																				else
																					DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					DoubleXPText:setAlpha( 0.45 )
																					DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				DoubleXPTextFrame17( DoubleXPText, event )
																				return 
																			else
																				DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				DoubleXPText:setAlpha( 0.34 )
																				DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			DoubleXPTextFrame16( DoubleXPText, event )
																			return 
																		else
																			DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																			DoubleXPText:setAlpha( 0.55 )
																			DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DoubleXPTextFrame15( DoubleXPText, event )
																		return 
																	else
																		DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		DoubleXPText:setAlpha( 0.71 )
																		DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	DoubleXPTextFrame14( DoubleXPText, event )
																	return 
																else
																	DoubleXPText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	DoubleXPText:setAlpha( 0.44 )
																	DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame14 )
																end
															end
															
															if event.interrupted then
																DoubleXPTextFrame13( DoubleXPText, event )
																return 
															else
																DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																DoubleXPText:setAlpha( 0.83 )
																DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTextFrame12( DoubleXPText, event )
															return 
														else
															DoubleXPText:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
															DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTextFrame11( DoubleXPText, event )
														return 
													else
														DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														DoubleXPText:setAlpha( 1 )
														DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTextFrame10( DoubleXPText, event )
													return 
												else
													DoubleXPText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTextFrame9( DoubleXPText, event )
												return 
											else
												DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DoubleXPText:setAlpha( 0.76 )
												DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTextFrame8( DoubleXPText, event )
											return 
										else
											DoubleXPText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTextFrame7( DoubleXPText, event )
										return 
									else
										DoubleXPText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										DoubleXPText:setAlpha( 1 )
										DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTextFrame6( DoubleXPText, event )
									return 
								else
									DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTextFrame5( DoubleXPText, event )
								return 
							else
								DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DoubleXPText:setAlpha( 0.45 )
								DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTextFrame4( DoubleXPText, event )
							return 
						else
							DoubleXPText:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							DoubleXPText:setAlpha( 0.95 )
							DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTextFrame3( DoubleXPText, event )
						return 
					else
						DoubleXPText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame3 )
					end
				end
				
				DoubleXPText:completeAnimation()
				DoubleXPText.MatchText:completeAnimation()
				self.DoubleXPText:setLeftRight( false, false, -142, 142 )
				self.DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
				self.DoubleXPText:setAlpha( 0 )
				self.DoubleXPText.MatchText:setText( Engine.Localize( "ZMUI_FIRST_GOBBLEGUM_FREE" ) )
				DoubleXPTextFrame2( DoubleXPText, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							end
							Sound:playSound( "0", controller )
							if event.interrupted then
								self.clipFinished( Sound, event )
							else
								Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SoundFrame4( Sound, event )
							return 
						else
							Sound:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Sound:playSound( "xp_out", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 1450, false, false, CoD.TweenType.Linear )
						Sound:playSound( "0", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "xp_in", controller )
				SoundFrame2( Sound, {} )
				local PrematchCountdownFirstGumFreeFrame2 = function ( PrematchCountdownFirstGumFree, event )
					local PrematchCountdownFirstGumFreeFrame3 = function ( PrematchCountdownFirstGumFree, event )
						local PrematchCountdownFirstGumFreeFrame4 = function ( PrematchCountdownFirstGumFree, event )
							local PrematchCountdownFirstGumFreeFrame5 = function ( PrematchCountdownFirstGumFree, event )
								local PrematchCountdownFirstGumFreeFrame6 = function ( PrematchCountdownFirstGumFree, event )
									local PrematchCountdownFirstGumFreeFrame7 = function ( PrematchCountdownFirstGumFree, event )
										local PrematchCountdownFirstGumFreeFrame8 = function ( PrematchCountdownFirstGumFree, event )
											local PrematchCountdownFirstGumFreeFrame9 = function ( PrematchCountdownFirstGumFree, event )
												local PrematchCountdownFirstGumFreeFrame10 = function ( PrematchCountdownFirstGumFree, event )
													if not event.interrupted then
														PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													end
													PrematchCountdownFirstGumFree:setLeftRight( false, false, -64, 64 )
													PrematchCountdownFirstGumFree:setTopBottom( true, false, 48.5, 176.5 )
													PrematchCountdownFirstGumFree:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( PrematchCountdownFirstGumFree, event )
													else
														PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PrematchCountdownFirstGumFreeFrame10( PrematchCountdownFirstGumFree, event )
													return 
												else
													PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
													PrematchCountdownFirstGumFree:setAlpha( 1 )
													PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame10 )
												end
											end
											
											if event.interrupted then
												PrematchCountdownFirstGumFreeFrame9( PrematchCountdownFirstGumFree, event )
												return 
											else
												PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
												PrematchCountdownFirstGumFree:setAlpha( 0.2 )
												PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame9 )
											end
										end
										
										if event.interrupted then
											PrematchCountdownFirstGumFreeFrame8( PrematchCountdownFirstGumFree, event )
											return 
										else
											PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
											PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame8 )
										end
									end
									
									if event.interrupted then
										PrematchCountdownFirstGumFreeFrame7( PrematchCountdownFirstGumFree, event )
										return 
									else
										PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PrematchCountdownFirstGumFree:setAlpha( 1 )
										PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame7 )
									end
								end
								
								if event.interrupted then
									PrematchCountdownFirstGumFreeFrame6( PrematchCountdownFirstGumFree, event )
									return 
								else
									PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
									PrematchCountdownFirstGumFree:setAlpha( 0.2 )
									PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame6 )
								end
							end
							
							if event.interrupted then
								PrematchCountdownFirstGumFreeFrame5( PrematchCountdownFirstGumFree, event )
								return 
							else
								PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								PrematchCountdownFirstGumFree:setAlpha( 1 )
								PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame5 )
							end
						end
						
						if event.interrupted then
							PrematchCountdownFirstGumFreeFrame4( PrematchCountdownFirstGumFree, event )
							return 
						else
							PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							PrematchCountdownFirstGumFree:setAlpha( 0.2 )
							PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame4 )
						end
					end
					
					if event.interrupted then
						PrematchCountdownFirstGumFreeFrame3( PrematchCountdownFirstGumFree, event )
						return 
					else
						PrematchCountdownFirstGumFree:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PrematchCountdownFirstGumFree:setAlpha( 1 )
						PrematchCountdownFirstGumFree:registerEventHandler( "transition_complete_keyframe", PrematchCountdownFirstGumFreeFrame3 )
					end
				end
				
				PrematchCountdownFirstGumFree:completeAnimation()
				self.PrematchCountdownFirstGumFree:setLeftRight( false, false, -64, 64 )
				self.PrematchCountdownFirstGumFree:setTopBottom( true, false, 48.5, 176.5 )
				self.PrematchCountdownFirstGumFree:setAlpha( 0 )
				PrematchCountdownFirstGumFreeFrame2( PrematchCountdownFirstGumFree, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f324_local0 = self
		if IsParamModelEqualToString( model, "play_promo_anim" ) and not IsDoubleWeaponXP( controller ) and IsZMDoubleXPWeekend( controller ) then
			PlayClip( self, "ShowDoubleXPIcon", controller )
		elseif IsParamModelEqualToString( model, "play_promo_anim" ) and IsDoubleWeaponXP( controller ) and not IsZMDoubleXPWeekend( controller ) then
			PlayClip( self, "ShowDoubleWeaponXPIcon", controller )
		elseif IsParamModelEqualToString( model, "play_promo_anim" ) and IsDoubleWeaponXP( controller ) and IsZMDoubleXPWeekend( controller ) then
			PlayClip( self, "ShowDoubleXPandWeaponXP", controller )
		elseif IsParamModelEqualToString( model, "play_promo_anim" ) and IsZMFreeGumPerRoundActive( controller ) then
			PlayClip( self, "ShowFirstGumFree", controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GlowPanel:close()
		element.PrematchCountdownNumbers:close()
		element.DoubleXPText:close()
		element.Glitch:close()
		element.PrematchCountdown2xpBadge:close()
		element.PrematchCountdown2xpWeaponBadge:close()
		element.DoubleLoot:close()
		element.DoubleWeaponXPLabel:close()
		element.PrematchCountdownFirstGumFree:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

