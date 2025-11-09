require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchVignette" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_Numbers" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_Main" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconTitle" )

local SetupPrematchCountdown = function ( self, endTime )
	self.PrematchCountdownNumbers.Numbers.Numbers:setupPrematchTimer( endTime )
	self:playClip( "Start" )
	self.Glitch:playClip( "GlitchSmall2Slow" )
	self.PrematchCountdownNumbers:playClip( "Start" )
end

local UpdatePrematchCountdown = function ( self, event )
	local endTime = event.data[1]
	if endTime then
		self.PrematchCountdownNumbers.Numbers.Numbers:setupPrematchTimer( endTime )
	end
end

local PostLoadFunc = function ( self, controller )
	if not ShouldDisplayFactionIconAtPrematchCountdown( self ) then
		self.FactionIcon:close()
		self.FactionName:close()
	end
	local prematchTimerEnd = function ( element, event )
		self:playClip( "Stop" )
		self.Glitch:playClip( "GlitchSmall2" )
		self.PrematchCountdownNumbers:playClip( "Stop" )
		self:registerEventHandler( "clip_over", function ( self, event )
			self:setAlpha( 0 )
		end )
	end
	
	local playObjectiveHintAnimAndCloseSelf = function ( self, event )
		self.Glitch:playClip( "GlitchSmall3" )
		self:playClip( "ShowObjectiveHint" )
		self:registerEventHandler( "clip_over", function ( self, event )
			local xpScale = Engine.GetXPScale( controller )
			if xpScale and xpScale > 1 then
				self:playClip( "ShowDoubleXPIcon" )
				self.Glitch:playClip( "GlitchSmall1" )
				self:registerEventHandler( "clip_over", function ( self, event )
					self:close()
				end )
			else
				self:close()
			end
		end )
	end
	
	local showGameTypeObjectiveHint = function ( self, event )
		self:setAlpha( 1 )
		self.GameTypeHintText.MatchText:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
		self.GameTypeIcon:setImage( RegisterImage( CoD.GetLoadingScreenGameTypeIconName() ) )
		if self.playFactionInfoAnimation and not HUD_IsFFA() then
			self:playClip( "ShowOnlyFactionInfo" )
			self.Glitch:playClip( "GlitchSmall3" )
			self:registerEventHandler( "clip_over", playObjectiveHintAnimAndCloseSelf )
		else
			playObjectiveHintAnimAndCloseSelf( self, event )
		end
	end
	
	self:registerEventHandler( "player_spawned", function ( self, event )
		if not IsInPrematchPeriod() then
			self.playFactionInfoAnimation = true
		end
	end )
	self:registerEventHandler( "update_prematch_timer", UpdatePrematchCountdown )
	self:registerEventHandler( "show_gametype_objective_hint", showGameTypeObjectiveHint )
	self.PrematchCountdownNumbers.Numbers.Numbers:registerEventHandler( "prematch_timer_ended", prematchTimerEnd )
	self.setupCountdown = SetupPrematchCountdown
	self:setState( "DefaultState" )
	local prematchPeriod = Engine.GetGametypeSetting( "prematchperiod" ) * 1000
	local currentGameTime = Engine.CurrentGameTime()
	local vignetteFadeOutTime = 250
	if currentGameTime < prematchPeriod then
		vignetteFadeOutTime = prematchPeriod - currentGameTime
	end
	self.PrematchVignette:registerEventHandler( "begin_fade_in", function ( self, event )
		local fadeDuration = vignetteFadeOutTime - 250
		if fadeDuration > 0 then
			self.vignette:setRGB( 1, 1, 1 )
			self.vignette:beginAnimation( "fade_out", fadeDuration )
		else
			self.vignette:completeAnimation()
		end
		self.vignette:setRGB( 0, 0, 0 )
	end )
	self:addElement( LUI.UITimer.new( 250, "begin_fade_in", true, self.PrematchVignette ) )
end

CoD.PrematchCountdown = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown )
	self.id = "PrematchCountdown"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( true, false, 495.5, 788 )
	GlowPanel:setTopBottom( true, false, -24.5, 268 )
	GlowPanel:setRGB( 1, 1, 1 )
	GlowPanel:setAlpha( 0 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local PrematchVignette = CoD.PrematchVignette.new( menu, controller )
	PrematchVignette:setLeftRight( true, false, 0, 1280 )
	PrematchVignette:setTopBottom( true, false, 0, 720 )
	PrematchVignette:setRGB( 1, 1, 1 )
	self:addElement( PrematchVignette )
	self.PrematchVignette = PrematchVignette
	
	local PrematchCountdownNumbers = CoD.PrematchCountdown_Numbers.new( menu, controller )
	PrematchCountdownNumbers:setLeftRight( true, true, 0, 0 )
	PrematchCountdownNumbers:setTopBottom( false, false, -30, 20 )
	PrematchCountdownNumbers:setRGB( 1, 1, 1 )
	PrematchCountdownNumbers:setAlpha( 0 )
	PrematchCountdownNumbers.MatchText.MatchText:setText( Engine.Localize( "MP_MATCH_STARTING_IN" ) )
	PrematchCountdownNumbers:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "PrematchCountdownNumbers",
			clipName = "Start"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( PrematchCountdownNumbers )
	self.PrematchCountdownNumbers = PrematchCountdownNumbers
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( true, false, 577, 705 )
	FactionIcon:setTopBottom( true, false, 36, 164 )
	FactionIcon:setRGB( 1, 1, 1 )
	FactionIcon:setAlpha( 0 )
	FactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	FactionIcon:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 576, 704 )
	GameTypeIcon:setTopBottom( true, false, 48.5, 176.5 )
	GameTypeIcon:setRGB( 1, 1, 1 )
	GameTypeIcon:setAlpha( 0 )
	GameTypeIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local DoubleXPIcon = LUI.UIImage.new()
	DoubleXPIcon:setLeftRight( true, false, 576, 704 )
	DoubleXPIcon:setTopBottom( true, false, 48.5, 176.5 )
	DoubleXPIcon:setRGB( 1, 1, 1 )
	DoubleXPIcon:setAlpha( 0 )
	DoubleXPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp" ) )
	DoubleXPIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( DoubleXPIcon )
	self.DoubleXPIcon = DoubleXPIcon
	
	local GameTypeHintText = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	GameTypeHintText:setLeftRight( false, false, -207, 207 )
	GameTypeHintText:setTopBottom( true, false, 186, 218 )
	GameTypeHintText:setRGB( 1, 1, 1 )
	GameTypeHintText:setAlpha( 0 )
	GameTypeHintText.FEButtonPanel0:setRGB( 0, 0, 0 )
	GameTypeHintText.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	GameTypeHintText.Glow:setRGB( 0.3, 0.23, 0.2 )
	GameTypeHintText.MatchText:setRGB( 0.96, 0.96, 1 )
	GameTypeHintText.MatchText:setText( Engine.Localize( "OBJECTIVES_TDM_HINT" ) )
	GameTypeHintText.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameTypeHintText.MatchText:setLetterSpacing( 1 )
	self:addElement( GameTypeHintText )
	self.GameTypeHintText = GameTypeHintText
	
	local DoubleXPText = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	DoubleXPText:setLeftRight( false, false, -142, 142 )
	DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
	DoubleXPText:setRGB( 1, 1, 1 )
	DoubleXPText:setAlpha( 0 )
	DoubleXPText.FEButtonPanel0:setRGB( 0, 0, 0 )
	DoubleXPText.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	DoubleXPText.Glow:setRGB( 0.3, 0.23, 0.2 )
	DoubleXPText.MatchText:setRGB( 0.96, 0.96, 1 )
	DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
	DoubleXPText.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	DoubleXPText.MatchText:setLetterSpacing( 1 )
	self:addElement( DoubleXPText )
	self.DoubleXPText = DoubleXPText
	
	local FactionName = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	FactionName:setLeftRight( false, false, -142, 142 )
	FactionName:setTopBottom( true, false, 186.29, 218.5 )
	FactionName:setRGB( 1, 1, 1 )
	FactionName:setAlpha( 0 )
	FactionName.FEButtonPanel0:setRGB( 0, 0, 0 )
	FactionName.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	FactionName.Glow:setRGB( 0.3, 0.23, 0.2 )
	FactionName.MatchText:setRGB( 0.96, 0.96, 1 )
	FactionName.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionName.MatchText:setLetterSpacing( 1 )
	FactionName:subscribeToGlobalModel( controller, "Factions", "playerFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionName.MatchText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FactionName )
	self.FactionName = FactionName
	
	local Glitch = CoD.fxGlitch1_Main.new( menu, controller )
	Glitch:setLeftRight( true, false, 405.75, 889.75 )
	Glitch:setTopBottom( true, false, 36, 318 )
	Glitch:setRGB( 1, 1, 1 )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	local FactionWidget = CoD.PrematchCountdown_IconTitle.new( menu, controller )
	FactionWidget:setLeftRight( false, false, -141.25, 142.75 )
	FactionWidget:setTopBottom( true, false, 36, 218.5 )
	FactionWidget:setRGB( 1, 1, 1 )
	FactionWidget:setAlpha( 0 )
	FactionWidget:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionWidget.ImageElement:setImage( RegisterImage( modelValue ) )
		end
	end )
	FactionWidget:subscribeToGlobalModel( controller, "Factions", "playerFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionWidget.StringElement.MatchText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FactionWidget )
	self.FactionWidget = FactionWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PrematchCountdownNumbers:completeAnimation()
				self.PrematchCountdownNumbers:setAlpha( 1 )
				self.clipFinished( PrematchCountdownNumbers, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 408, 880 )
				self.Glitch:setTopBottom( true, false, 218, 474 )
				self.clipFinished( Glitch, {} )
			end,
			Start = function ()
				self:setupElementClipCounter( 5 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					if not event.interrupted then
						GlowPanel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					GlowPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GlowPanel, event )
					else
						GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				GlowPanelFrame2( GlowPanel, {} )
				local PrematchCountdownNumbersFrame2 = function ( PrematchCountdownNumbers, event )
					if not event.interrupted then
						PrematchCountdownNumbers:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					PrematchCountdownNumbers:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrematchCountdownNumbers, event )
					else
						PrematchCountdownNumbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrematchCountdownNumbers:completeAnimation()
				self.PrematchCountdownNumbers:setAlpha( 1 )
				PrematchCountdownNumbersFrame2( PrematchCountdownNumbers, {} )
				local FactionIconFrame2 = function ( FactionIcon, event )
					local FactionIconFrame3 = function ( FactionIcon, event )
						local FactionIconFrame4 = function ( FactionIcon, event )
							local FactionIconFrame5 = function ( FactionIcon, event )
								local FactionIconFrame6 = function ( FactionIcon, event )
									local FactionIconFrame7 = function ( FactionIcon, event )
										local FactionIconFrame8 = function ( FactionIcon, event )
											local FactionIconFrame9 = function ( FactionIcon, event )
												local FactionIconFrame10 = function ( FactionIcon, event )
													local FactionIconFrame11 = function ( FactionIcon, event )
														local FactionIconFrame12 = function ( FactionIcon, event )
															if not event.interrupted then
																FactionIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															end
															FactionIcon:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( FactionIcon, event )
															else
																FactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															FactionIconFrame12( FactionIcon, event )
															return 
														else
															FactionIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame12 )
														end
													end
													
													if event.interrupted then
														FactionIconFrame11( FactionIcon, event )
														return 
													else
														FactionIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														FactionIcon:setAlpha( 0.72 )
														FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame11 )
													end
												end
												
												if event.interrupted then
													FactionIconFrame10( FactionIcon, event )
													return 
												else
													FactionIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame10 )
												end
											end
											
											if event.interrupted then
												FactionIconFrame9( FactionIcon, event )
												return 
											else
												FactionIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												FactionIcon:setAlpha( 1 )
												FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame9 )
											end
										end
										
										if event.interrupted then
											FactionIconFrame8( FactionIcon, event )
											return 
										else
											FactionIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame8 )
										end
									end
									
									if event.interrupted then
										FactionIconFrame7( FactionIcon, event )
										return 
									else
										FactionIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FactionIcon:setAlpha( 0.46 )
										FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame7 )
									end
								end
								
								if event.interrupted then
									FactionIconFrame6( FactionIcon, event )
									return 
								else
									FactionIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame6 )
								end
							end
							
							if event.interrupted then
								FactionIconFrame5( FactionIcon, event )
								return 
							else
								FactionIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FactionIcon:setAlpha( 1 )
								FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame5 )
							end
						end
						
						if event.interrupted then
							FactionIconFrame4( FactionIcon, event )
							return 
						else
							FactionIcon:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							FactionIcon:setAlpha( 0.52 )
							FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame4 )
						end
					end
					
					if event.interrupted then
						FactionIconFrame3( FactionIcon, event )
						return 
					else
						FactionIcon:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame3 )
					end
				end
				
				FactionIcon:completeAnimation()
				self.FactionIcon:setAlpha( 0 )
				FactionIconFrame2( FactionIcon, {} )
				local FactionNameFrame2 = function ( FactionName, event )
					local FactionNameFrame3 = function ( FactionName, event )
						local FactionNameFrame4 = function ( FactionName, event )
							local FactionNameFrame5 = function ( FactionName, event )
								local FactionNameFrame6 = function ( FactionName, event )
									local FactionNameFrame7 = function ( FactionName, event )
										local FactionNameFrame8 = function ( FactionName, event )
											local FactionNameFrame9 = function ( FactionName, event )
												local FactionNameFrame10 = function ( FactionName, event )
													local FactionNameFrame11 = function ( FactionName, event )
														local FactionNameFrame12 = function ( FactionName, event )
															if not event.interrupted then
																FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															FactionName:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( FactionName, event )
															else
																FactionName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															FactionNameFrame12( FactionName, event )
															return 
														else
															FactionName:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame12 )
														end
													end
													
													if event.interrupted then
														FactionNameFrame11( FactionName, event )
														return 
													else
														FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														FactionName:setAlpha( 0.73 )
														FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame11 )
													end
												end
												
												if event.interrupted then
													FactionNameFrame10( FactionName, event )
													return 
												else
													FactionName:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame10 )
												end
											end
											
											if event.interrupted then
												FactionNameFrame9( FactionName, event )
												return 
											else
												FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												FactionName:setAlpha( 1 )
												FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame9 )
											end
										end
										
										if event.interrupted then
											FactionNameFrame8( FactionName, event )
											return 
										else
											FactionName:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame8 )
										end
									end
									
									if event.interrupted then
										FactionNameFrame7( FactionName, event )
										return 
									else
										FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FactionName:setAlpha( 0.43 )
										FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame7 )
									end
								end
								
								if event.interrupted then
									FactionNameFrame6( FactionName, event )
									return 
								else
									FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame6 )
								end
							end
							
							if event.interrupted then
								FactionNameFrame5( FactionName, event )
								return 
							else
								FactionName:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FactionName:setAlpha( 1 )
								FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame5 )
							end
						end
						
						if event.interrupted then
							FactionNameFrame4( FactionName, event )
							return 
						else
							FactionName:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
							FactionName:setAlpha( 0.56 )
							FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame4 )
						end
					end
					
					if event.interrupted then
						FactionNameFrame3( FactionName, event )
						return 
					else
						FactionName:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame3 )
					end
				end
				
				FactionName:completeAnimation()
				self.FactionName:setAlpha( 0 )
				FactionNameFrame2( FactionName, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 408, 880 )
				self.Glitch:setTopBottom( true, false, 218, 474 )
				self.clipFinished( Glitch, {} )
			end,
			Stop = function ()
				self:setupElementClipCounter( 5 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					if not event.interrupted then
						GlowPanel:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
					end
					GlowPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowPanel, event )
					else
						GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 1 )
				GlowPanelFrame2( GlowPanel, {} )
				local PrematchCountdownNumbersFrame2 = function ( PrematchCountdownNumbers, event )
					local PrematchCountdownNumbersFrame3 = function ( PrematchCountdownNumbers, event )
						if not event.interrupted then
							PrematchCountdownNumbers:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						PrematchCountdownNumbers:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PrematchCountdownNumbers, event )
						else
							PrematchCountdownNumbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PrematchCountdownNumbersFrame3( PrematchCountdownNumbers, event )
						return 
					else
						PrematchCountdownNumbers:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						PrematchCountdownNumbers:registerEventHandler( "transition_complete_keyframe", PrematchCountdownNumbersFrame3 )
					end
				end
				
				PrematchCountdownNumbers:completeAnimation()
				self.PrematchCountdownNumbers:setAlpha( 1 )
				PrematchCountdownNumbersFrame2( PrematchCountdownNumbers, {} )
				local FactionIconFrame2 = function ( FactionIcon, event )
					local FactionIconFrame3 = function ( FactionIcon, event )
						local FactionIconFrame4 = function ( FactionIcon, event )
							local FactionIconFrame5 = function ( FactionIcon, event )
								local FactionIconFrame6 = function ( FactionIcon, event )
									local FactionIconFrame7 = function ( FactionIcon, event )
										local FactionIconFrame8 = function ( FactionIcon, event )
											if not event.interrupted then
												FactionIcon:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											end
											FactionIcon:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FactionIcon, event )
											else
												FactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FactionIconFrame8( FactionIcon, event )
											return 
										else
											FactionIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											FactionIcon:setAlpha( 0.4 )
											FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame8 )
										end
									end
									
									if event.interrupted then
										FactionIconFrame7( FactionIcon, event )
										return 
									else
										FactionIcon:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										FactionIcon:setAlpha( 0.25 )
										FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame7 )
									end
								end
								
								if event.interrupted then
									FactionIconFrame6( FactionIcon, event )
									return 
								else
									FactionIcon:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									FactionIcon:setAlpha( 0.4 )
									FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame6 )
								end
							end
							
							if event.interrupted then
								FactionIconFrame5( FactionIcon, event )
								return 
							else
								FactionIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FactionIcon:setAlpha( 0.66 )
								FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame5 )
							end
						end
						
						if event.interrupted then
							FactionIconFrame4( FactionIcon, event )
							return 
						else
							FactionIcon:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							FactionIcon:setAlpha( 0.4 )
							FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame4 )
						end
					end
					
					if event.interrupted then
						FactionIconFrame3( FactionIcon, event )
						return 
					else
						FactionIcon:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						FactionIcon:setAlpha( 0.77 )
						FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame3 )
					end
				end
				
				FactionIcon:completeAnimation()
				self.FactionIcon:setAlpha( 1 )
				FactionIconFrame2( FactionIcon, {} )
				local FactionNameFrame2 = function ( FactionName, event )
					local FactionNameFrame3 = function ( FactionName, event )
						local FactionNameFrame4 = function ( FactionName, event )
							local FactionNameFrame5 = function ( FactionName, event )
								local FactionNameFrame6 = function ( FactionName, event )
									if not event.interrupted then
										FactionName:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									end
									FactionName:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( FactionName, event )
									else
										FactionName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FactionNameFrame6( FactionName, event )
									return 
								else
									FactionName:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									FactionName:setAlpha( 0.42 )
									FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame6 )
								end
							end
							
							if event.interrupted then
								FactionNameFrame5( FactionName, event )
								return 
							else
								FactionName:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FactionName:setAlpha( 0.18 )
								FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame5 )
							end
						end
						
						if event.interrupted then
							FactionNameFrame4( FactionName, event )
							return 
						else
							FactionName:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							FactionName:setAlpha( 0.63 )
							FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame4 )
						end
					end
					
					if event.interrupted then
						FactionNameFrame3( FactionName, event )
						return 
					else
						FactionName:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame3 )
					end
				end
				
				FactionName:completeAnimation()
				self.FactionName:setAlpha( 1 )
				FactionNameFrame2( FactionName, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 408, 880 )
				self.Glitch:setTopBottom( true, false, 218, 474 )
				self.clipFinished( Glitch, {} )
			end,
			ShowObjectiveHint = function ()
				self:setupElementClipCounter( 7 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					local GlowPanelFrame3 = function ( GlowPanel, event )
						local GlowPanelFrame4 = function ( GlowPanel, event )
							local GlowPanelFrame5 = function ( GlowPanel, event )
								if not event.interrupted then
									GlowPanel:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
								end
								GlowPanel:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowPanel, event )
								else
									GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowPanelFrame5( GlowPanel, event )
								return 
							else
								GlowPanel:beginAnimation( "keyframe", 3230, false, false, CoD.TweenType.Linear )
								GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame5 )
							end
						end
						
						if event.interrupted then
							GlowPanelFrame4( GlowPanel, event )
							return 
						else
							GlowPanel:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
							GlowPanel:setAlpha( 1 )
							GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame4 )
						end
					end
					
					if event.interrupted then
						GlowPanelFrame3( GlowPanel, event )
						return 
					else
						GlowPanel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame3 )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				GlowPanelFrame2( GlowPanel, {} )
				PrematchVignette:completeAnimation()
				self.PrematchVignette:setAlpha( 1 )
				self.clipFinished( PrematchVignette, {} )
				PrematchCountdownNumbers:completeAnimation()
				self.PrematchCountdownNumbers:setAlpha( 0 )
				self.clipFinished( PrematchCountdownNumbers, {} )
				FactionIcon:completeAnimation()
				self.FactionIcon:setAlpha( 0 )
				self.clipFinished( FactionIcon, {} )
				local GameTypeIconFrame2 = function ( GameTypeIcon, event )
					local GameTypeIconFrame3 = function ( GameTypeIcon, event )
						local GameTypeIconFrame4 = function ( GameTypeIcon, event )
							local GameTypeIconFrame5 = function ( GameTypeIcon, event )
								local GameTypeIconFrame6 = function ( GameTypeIcon, event )
									local GameTypeIconFrame7 = function ( GameTypeIcon, event )
										local GameTypeIconFrame8 = function ( GameTypeIcon, event )
											local GameTypeIconFrame9 = function ( GameTypeIcon, event )
												local GameTypeIconFrame10 = function ( GameTypeIcon, event )
													local GameTypeIconFrame11 = function ( GameTypeIcon, event )
														local GameTypeIconFrame12 = function ( GameTypeIcon, event )
															local GameTypeIconFrame13 = function ( GameTypeIcon, event )
																local GameTypeIconFrame14 = function ( GameTypeIcon, event )
																	local GameTypeIconFrame15 = function ( GameTypeIcon, event )
																		local GameTypeIconFrame16 = function ( GameTypeIcon, event )
																			local GameTypeIconFrame17 = function ( GameTypeIcon, event )
																				if not event.interrupted then
																					GameTypeIcon:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
																				end
																				GameTypeIcon:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( GameTypeIcon, event )
																				else
																					GameTypeIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				GameTypeIconFrame17( GameTypeIcon, event )
																				return 
																			else
																				GameTypeIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				GameTypeIcon:setAlpha( 0.39 )
																				GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GameTypeIconFrame16( GameTypeIcon, event )
																			return 
																		else
																			GameTypeIcon:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																			GameTypeIcon:setAlpha( 0.18 )
																			GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GameTypeIconFrame15( GameTypeIcon, event )
																		return 
																	else
																		GameTypeIcon:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																		GameTypeIcon:setAlpha( 0.45 )
																		GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame15 )
																	end
																end
																
																if event.interrupted then
																	GameTypeIconFrame14( GameTypeIcon, event )
																	return 
																else
																	GameTypeIcon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	GameTypeIcon:setAlpha( 0.52 )
																	GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame14 )
																end
															end
															
															if event.interrupted then
																GameTypeIconFrame13( GameTypeIcon, event )
																return 
															else
																GameTypeIcon:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																GameTypeIcon:setAlpha( 0.28 )
																GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame13 )
															end
														end
														
														if event.interrupted then
															GameTypeIconFrame12( GameTypeIcon, event )
															return 
														else
															GameTypeIcon:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
															GameTypeIcon:setAlpha( 0.59 )
															GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame12 )
														end
													end
													
													if event.interrupted then
														GameTypeIconFrame11( GameTypeIcon, event )
														return 
													else
														GameTypeIcon:beginAnimation( "keyframe", 3009, false, false, CoD.TweenType.Linear )
														GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame11 )
													end
												end
												
												if event.interrupted then
													GameTypeIconFrame10( GameTypeIcon, event )
													return 
												else
													GameTypeIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													GameTypeIcon:setAlpha( 1 )
													GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame10 )
												end
											end
											
											if event.interrupted then
												GameTypeIconFrame9( GameTypeIcon, event )
												return 
											else
												GameTypeIcon:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame9 )
											end
										end
										
										if event.interrupted then
											GameTypeIconFrame8( GameTypeIcon, event )
											return 
										else
											GameTypeIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											GameTypeIcon:setAlpha( 0.68 )
											GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame8 )
										end
									end
									
									if event.interrupted then
										GameTypeIconFrame7( GameTypeIcon, event )
										return 
									else
										GameTypeIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame7 )
									end
								end
								
								if event.interrupted then
									GameTypeIconFrame6( GameTypeIcon, event )
									return 
								else
									GameTypeIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									GameTypeIcon:setAlpha( 1 )
									GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame6 )
								end
							end
							
							if event.interrupted then
								GameTypeIconFrame5( GameTypeIcon, event )
								return 
							else
								GameTypeIcon:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame5 )
							end
						end
						
						if event.interrupted then
							GameTypeIconFrame4( GameTypeIcon, event )
							return 
						else
							GameTypeIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							GameTypeIcon:setAlpha( 0.3 )
							GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame4 )
						end
					end
					
					if event.interrupted then
						GameTypeIconFrame3( GameTypeIcon, event )
						return 
					else
						GameTypeIcon:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						GameTypeIcon:setAlpha( 0.49 )
						GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame3 )
					end
				end
				
				GameTypeIcon:completeAnimation()
				self.GameTypeIcon:setAlpha( 0 )
				GameTypeIconFrame2( GameTypeIcon, {} )
				local GameTypeHintTextFrame2 = function ( GameTypeHintText, event )
					local GameTypeHintTextFrame3 = function ( GameTypeHintText, event )
						local GameTypeHintTextFrame4 = function ( GameTypeHintText, event )
							local GameTypeHintTextFrame5 = function ( GameTypeHintText, event )
								local GameTypeHintTextFrame6 = function ( GameTypeHintText, event )
									local GameTypeHintTextFrame7 = function ( GameTypeHintText, event )
										local GameTypeHintTextFrame8 = function ( GameTypeHintText, event )
											local GameTypeHintTextFrame9 = function ( GameTypeHintText, event )
												local GameTypeHintTextFrame10 = function ( GameTypeHintText, event )
													local GameTypeHintTextFrame11 = function ( GameTypeHintText, event )
														local GameTypeHintTextFrame12 = function ( GameTypeHintText, event )
															local GameTypeHintTextFrame13 = function ( GameTypeHintText, event )
																local GameTypeHintTextFrame14 = function ( GameTypeHintText, event )
																	local GameTypeHintTextFrame15 = function ( GameTypeHintText, event )
																		local GameTypeHintTextFrame16 = function ( GameTypeHintText, event )
																			local GameTypeHintTextFrame17 = function ( GameTypeHintText, event )
																				local GameTypeHintTextFrame18 = function ( GameTypeHintText, event )
																					local GameTypeHintTextFrame19 = function ( GameTypeHintText, event )
																						local GameTypeHintTextFrame20 = function ( GameTypeHintText, event )
																							local GameTypeHintTextFrame21 = function ( GameTypeHintText, event )
																								local GameTypeHintTextFrame22 = function ( GameTypeHintText, event )
																									local GameTypeHintTextFrame23 = function ( GameTypeHintText, event )
																										if not event.interrupted then
																											GameTypeHintText:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
																										end
																										GameTypeHintText:setAlpha( 0 )
																										if event.interrupted then
																											self.clipFinished( GameTypeHintText, event )
																										else
																											GameTypeHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										GameTypeHintTextFrame23( GameTypeHintText, event )
																										return 
																									else
																										GameTypeHintText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																										GameTypeHintText:setAlpha( 0.32 )
																										GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									GameTypeHintTextFrame22( GameTypeHintText, event )
																									return 
																								else
																									GameTypeHintText:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									GameTypeHintText:setAlpha( 0.13 )
																									GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								GameTypeHintTextFrame21( GameTypeHintText, event )
																								return 
																							else
																								GameTypeHintText:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
																								GameTypeHintText:setAlpha( 0.39 )
																								GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							GameTypeHintTextFrame20( GameTypeHintText, event )
																							return 
																						else
																							GameTypeHintText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																							GameTypeHintText:setAlpha( 0.64 )
																							GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						GameTypeHintTextFrame19( GameTypeHintText, event )
																						return 
																					else
																						GameTypeHintText:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																						GameTypeHintText:setAlpha( 0.35 )
																						GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					GameTypeHintTextFrame18( GameTypeHintText, event )
																					return 
																				else
																					GameTypeHintText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																					GameTypeHintText:setAlpha( 0.7 )
																					GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				GameTypeHintTextFrame17( GameTypeHintText, event )
																				return 
																			else
																				GameTypeHintText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				GameTypeHintText:setAlpha( 0.83 )
																				GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GameTypeHintTextFrame16( GameTypeHintText, event )
																			return 
																		else
																			GameTypeHintText:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																			GameTypeHintText:setAlpha( 0.45 )
																			GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GameTypeHintTextFrame15( GameTypeHintText, event )
																		return 
																	else
																		GameTypeHintText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																		GameTypeHintText:setAlpha( 0.88 )
																		GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	GameTypeHintTextFrame14( GameTypeHintText, event )
																	return 
																else
																	GameTypeHintText:beginAnimation( "keyframe", 3269, false, false, CoD.TweenType.Linear )
																	GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame14 )
																end
															end
															
															if event.interrupted then
																GameTypeHintTextFrame13( GameTypeHintText, event )
																return 
															else
																GameTypeHintText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																GameTypeHintText:setAlpha( 1 )
																GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame13 )
															end
														end
														
														if event.interrupted then
															GameTypeHintTextFrame12( GameTypeHintText, event )
															return 
														else
															GameTypeHintText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame12 )
														end
													end
													
													if event.interrupted then
														GameTypeHintTextFrame11( GameTypeHintText, event )
														return 
													else
														GameTypeHintText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														GameTypeHintText:setAlpha( 0.7 )
														GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame11 )
													end
												end
												
												if event.interrupted then
													GameTypeHintTextFrame10( GameTypeHintText, event )
													return 
												else
													GameTypeHintText:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame10 )
												end
											end
											
											if event.interrupted then
												GameTypeHintTextFrame9( GameTypeHintText, event )
												return 
											else
												GameTypeHintText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												GameTypeHintText:setAlpha( 1 )
												GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame9 )
											end
										end
										
										if event.interrupted then
											GameTypeHintTextFrame8( GameTypeHintText, event )
											return 
										else
											GameTypeHintText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame8 )
										end
									end
									
									if event.interrupted then
										GameTypeHintTextFrame7( GameTypeHintText, event )
										return 
									else
										GameTypeHintText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										GameTypeHintText:setAlpha( 0.5 )
										GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame7 )
									end
								end
								
								if event.interrupted then
									GameTypeHintTextFrame6( GameTypeHintText, event )
									return 
								else
									GameTypeHintText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame6 )
								end
							end
							
							if event.interrupted then
								GameTypeHintTextFrame5( GameTypeHintText, event )
								return 
							else
								GameTypeHintText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								GameTypeHintText:setAlpha( 1 )
								GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame5 )
							end
						end
						
						if event.interrupted then
							GameTypeHintTextFrame4( GameTypeHintText, event )
							return 
						else
							GameTypeHintText:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							GameTypeHintText:setAlpha( 0.57 )
							GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame4 )
						end
					end
					
					if event.interrupted then
						GameTypeHintTextFrame3( GameTypeHintText, event )
						return 
					else
						GameTypeHintText:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						GameTypeHintText:registerEventHandler( "transition_complete_keyframe", GameTypeHintTextFrame3 )
					end
				end
				
				GameTypeHintText:completeAnimation()
				self.GameTypeHintText:setAlpha( 0 )
				GameTypeHintTextFrame2( GameTypeHintText, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 405.75, 889.75 )
				self.Glitch:setTopBottom( true, false, 36, 318 )
				self.clipFinished( Glitch, {} )
			end,
			ShowDoubleXPIcon = function ()
				self:setupElementClipCounter( 4 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					local GlowPanelFrame3 = function ( GlowPanel, event )
						local GlowPanelFrame4 = function ( GlowPanel, event )
							if not event.interrupted then
								GlowPanel:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
							end
							GlowPanel:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowPanel, event )
							else
								GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowPanelFrame4( GlowPanel, event )
							return 
						else
							GlowPanel:beginAnimation( "keyframe", 1139, false, false, CoD.TweenType.Linear )
							GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame4 )
						end
					end
					
					if event.interrupted then
						GlowPanelFrame3( GlowPanel, event )
						return 
					else
						GlowPanel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						GlowPanel:setAlpha( 1 )
						GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame3 )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				GlowPanelFrame2( GlowPanel, {} )
				local DoubleXPIconFrame2 = function ( DoubleXPIcon, event )
					local DoubleXPIconFrame3 = function ( DoubleXPIcon, event )
						local DoubleXPIconFrame4 = function ( DoubleXPIcon, event )
							local DoubleXPIconFrame5 = function ( DoubleXPIcon, event )
								local DoubleXPIconFrame6 = function ( DoubleXPIcon, event )
									local DoubleXPIconFrame7 = function ( DoubleXPIcon, event )
										local DoubleXPIconFrame8 = function ( DoubleXPIcon, event )
											local DoubleXPIconFrame9 = function ( DoubleXPIcon, event )
												local DoubleXPIconFrame10 = function ( DoubleXPIcon, event )
													local DoubleXPIconFrame11 = function ( DoubleXPIcon, event )
														local DoubleXPIconFrame12 = function ( DoubleXPIcon, event )
															local DoubleXPIconFrame13 = function ( DoubleXPIcon, event )
																local DoubleXPIconFrame14 = function ( DoubleXPIcon, event )
																	local DoubleXPIconFrame15 = function ( DoubleXPIcon, event )
																		local DoubleXPIconFrame16 = function ( DoubleXPIcon, event )
																			local DoubleXPIconFrame17 = function ( DoubleXPIcon, event )
																				if not event.interrupted then
																					DoubleXPIcon:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																				end
																				DoubleXPIcon:setLeftRight( true, false, 576, 704 )
																				DoubleXPIcon:setTopBottom( true, false, 48.5, 176.5 )
																				DoubleXPIcon:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( DoubleXPIcon, event )
																				else
																					DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				DoubleXPIconFrame17( DoubleXPIcon, event )
																				return 
																			else
																				DoubleXPIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				DoubleXPIcon:setAlpha( 0.34 )
																				DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			DoubleXPIconFrame16( DoubleXPIcon, event )
																			return 
																		else
																			DoubleXPIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			DoubleXPIcon:setAlpha( 0.15 )
																			DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DoubleXPIconFrame15( DoubleXPIcon, event )
																		return 
																	else
																		DoubleXPIcon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																		DoubleXPIcon:setAlpha( 0.47 )
																		DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame15 )
																	end
																end
																
																if event.interrupted then
																	DoubleXPIconFrame14( DoubleXPIcon, event )
																	return 
																else
																	DoubleXPIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	DoubleXPIcon:setAlpha( 0.66 )
																	DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame14 )
																end
															end
															
															if event.interrupted then
																DoubleXPIconFrame13( DoubleXPIcon, event )
																return 
															else
																DoubleXPIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																DoubleXPIcon:setAlpha( 0.32 )
																DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPIconFrame12( DoubleXPIcon, event )
															return 
														else
															DoubleXPIcon:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
															DoubleXPIcon:setAlpha( 0.75 )
															DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPIconFrame11( DoubleXPIcon, event )
														return 
													else
														DoubleXPIcon:beginAnimation( "keyframe", 1339, false, false, CoD.TweenType.Linear )
														DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPIconFrame10( DoubleXPIcon, event )
													return 
												else
													DoubleXPIcon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													DoubleXPIcon:setAlpha( 1 )
													DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPIconFrame9( DoubleXPIcon, event )
												return 
											else
												DoubleXPIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												DoubleXPIcon:setAlpha( 0.53 )
												DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPIconFrame8( DoubleXPIcon, event )
											return 
										else
											DoubleXPIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											DoubleXPIcon:setAlpha( 0.52 )
											DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPIconFrame7( DoubleXPIcon, event )
										return 
									else
										DoubleXPIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPIconFrame6( DoubleXPIcon, event )
									return 
								else
									DoubleXPIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPIcon:setAlpha( 0.88 )
									DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPIconFrame5( DoubleXPIcon, event )
								return 
							else
								DoubleXPIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								DoubleXPIcon:setAlpha( 0.48 )
								DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPIconFrame4( DoubleXPIcon, event )
							return 
						else
							DoubleXPIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							DoubleXPIcon:setAlpha( 0.47 )
							DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPIconFrame3( DoubleXPIcon, event )
						return 
					else
						DoubleXPIcon:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						DoubleXPIcon:setAlpha( 0.6 )
						DoubleXPIcon:registerEventHandler( "transition_complete_keyframe", DoubleXPIconFrame3 )
					end
				end
				
				DoubleXPIcon:completeAnimation()
				self.DoubleXPIcon:setLeftRight( true, false, 576, 704 )
				self.DoubleXPIcon:setTopBottom( true, false, 48.5, 176.5 )
				self.DoubleXPIcon:setAlpha( 0 )
				DoubleXPIconFrame2( DoubleXPIcon, {} )
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
																				if not event.interrupted then
																					DoubleXPText:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																				end
																				DoubleXPText:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( DoubleXPText, event )
																				else
																					DoubleXPText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				DoubleXPTextFrame17( DoubleXPText, event )
																				return 
																			else
																				DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				DoubleXPText:setAlpha( 0.45 )
																				DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			DoubleXPTextFrame16( DoubleXPText, event )
																			return 
																		else
																			DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			DoubleXPText:setAlpha( 0.34 )
																			DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DoubleXPTextFrame15( DoubleXPText, event )
																		return 
																	else
																		DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																		DoubleXPText:setAlpha( 0.55 )
																		DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	DoubleXPTextFrame14( DoubleXPText, event )
																	return 
																else
																	DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	DoubleXPText:setAlpha( 0.71 )
																	DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame14 )
																end
															end
															
															if event.interrupted then
																DoubleXPTextFrame13( DoubleXPText, event )
																return 
															else
																DoubleXPText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																DoubleXPText:setAlpha( 0.44 )
																DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame13 )
															end
														end
														
														if event.interrupted then
															DoubleXPTextFrame12( DoubleXPText, event )
															return 
														else
															DoubleXPText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
															DoubleXPText:setAlpha( 0.83 )
															DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame12 )
														end
													end
													
													if event.interrupted then
														DoubleXPTextFrame11( DoubleXPText, event )
														return 
													else
														DoubleXPText:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
														DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame11 )
													end
												end
												
												if event.interrupted then
													DoubleXPTextFrame10( DoubleXPText, event )
													return 
												else
													DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													DoubleXPText:setAlpha( 1 )
													DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame10 )
												end
											end
											
											if event.interrupted then
												DoubleXPTextFrame9( DoubleXPText, event )
												return 
											else
												DoubleXPText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame9 )
											end
										end
										
										if event.interrupted then
											DoubleXPTextFrame8( DoubleXPText, event )
											return 
										else
											DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											DoubleXPText:setAlpha( 0.76 )
											DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame8 )
										end
									end
									
									if event.interrupted then
										DoubleXPTextFrame7( DoubleXPText, event )
										return 
									else
										DoubleXPText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame7 )
									end
								end
								
								if event.interrupted then
									DoubleXPTextFrame6( DoubleXPText, event )
									return 
								else
									DoubleXPText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DoubleXPText:setAlpha( 1 )
									DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame6 )
								end
							end
							
							if event.interrupted then
								DoubleXPTextFrame5( DoubleXPText, event )
								return 
							else
								DoubleXPText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame5 )
							end
						end
						
						if event.interrupted then
							DoubleXPTextFrame4( DoubleXPText, event )
							return 
						else
							DoubleXPText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							DoubleXPText:setAlpha( 0.45 )
							DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame4 )
						end
					end
					
					if event.interrupted then
						DoubleXPTextFrame3( DoubleXPText, event )
						return 
					else
						DoubleXPText:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						DoubleXPText:setAlpha( 0.95 )
						DoubleXPText:registerEventHandler( "transition_complete_keyframe", DoubleXPTextFrame3 )
					end
				end
				
				DoubleXPText:completeAnimation()
				self.DoubleXPText:setAlpha( 0 )
				DoubleXPTextFrame2( DoubleXPText, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 405.75, 889.75 )
				self.Glitch:setTopBottom( true, false, 36, 318 )
				self.clipFinished( Glitch, {} )
			end,
			ShowOnlyFactionInfo = function ()
				self:setupElementClipCounter( 5 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					local GlowPanelFrame3 = function ( GlowPanel, event )
						local GlowPanelFrame4 = function ( GlowPanel, event )
							if not event.interrupted then
								GlowPanel:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
							end
							GlowPanel:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowPanel, event )
							else
								GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowPanelFrame4( GlowPanel, event )
							return 
						else
							GlowPanel:beginAnimation( "keyframe", 1720, false, false, CoD.TweenType.Linear )
							GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame4 )
						end
					end
					
					if event.interrupted then
						GlowPanelFrame3( GlowPanel, event )
						return 
					else
						GlowPanel:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						GlowPanel:setAlpha( 1 )
						GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame3 )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				GlowPanelFrame2( GlowPanel, {} )
				local FactionIconFrame2 = function ( FactionIcon, event )
					local FactionIconFrame3 = function ( FactionIcon, event )
						local FactionIconFrame4 = function ( FactionIcon, event )
							local FactionIconFrame5 = function ( FactionIcon, event )
								local FactionIconFrame6 = function ( FactionIcon, event )
									local FactionIconFrame7 = function ( FactionIcon, event )
										local FactionIconFrame8 = function ( FactionIcon, event )
											local FactionIconFrame9 = function ( FactionIcon, event )
												local FactionIconFrame10 = function ( FactionIcon, event )
													local FactionIconFrame11 = function ( FactionIcon, event )
														local FactionIconFrame12 = function ( FactionIcon, event )
															local FactionIconFrame13 = function ( FactionIcon, event )
																local FactionIconFrame14 = function ( FactionIcon, event )
																	local FactionIconFrame15 = function ( FactionIcon, event )
																		local FactionIconFrame16 = function ( FactionIcon, event )
																			local FactionIconFrame17 = function ( FactionIcon, event )
																				local FactionIconFrame18 = function ( FactionIcon, event )
																					if not event.interrupted then
																						FactionIcon:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																					end
																					FactionIcon:setAlpha( 0 )
																					if event.interrupted then
																						self.clipFinished( FactionIcon, event )
																					else
																						FactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					FactionIconFrame18( FactionIcon, event )
																					return 
																				else
																					FactionIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					FactionIcon:setAlpha( 0.34 )
																					FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				FactionIconFrame17( FactionIcon, event )
																				return 
																			else
																				FactionIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				FactionIcon:setAlpha( 0.19 )
																				FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			FactionIconFrame16( FactionIcon, event )
																			return 
																		else
																			FactionIcon:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																			FactionIcon:setAlpha( 0.44 )
																			FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		FactionIconFrame15( FactionIcon, event )
																		return 
																	else
																		FactionIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		FactionIcon:setAlpha( 0.58 )
																		FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame15 )
																	end
																end
																
																if event.interrupted then
																	FactionIconFrame14( FactionIcon, event )
																	return 
																else
																	FactionIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	FactionIcon:setAlpha( 0.35 )
																	FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame14 )
																end
															end
															
															if event.interrupted then
																FactionIconFrame13( FactionIcon, event )
																return 
															else
																FactionIcon:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																FactionIcon:setAlpha( 0.68 )
																FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame13 )
															end
														end
														
														if event.interrupted then
															FactionIconFrame12( FactionIcon, event )
															return 
														else
															FactionIcon:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
															FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame12 )
														end
													end
													
													if event.interrupted then
														FactionIconFrame11( FactionIcon, event )
														return 
													else
														FactionIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														FactionIcon:setAlpha( 1 )
														FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame11 )
													end
												end
												
												if event.interrupted then
													FactionIconFrame10( FactionIcon, event )
													return 
												else
													FactionIcon:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame10 )
												end
											end
											
											if event.interrupted then
												FactionIconFrame9( FactionIcon, event )
												return 
											else
												FactionIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												FactionIcon:setAlpha( 0.76 )
												FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame9 )
											end
										end
										
										if event.interrupted then
											FactionIconFrame8( FactionIcon, event )
											return 
										else
											FactionIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame8 )
										end
									end
									
									if event.interrupted then
										FactionIconFrame7( FactionIcon, event )
										return 
									else
										FactionIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FactionIcon:setAlpha( 1 )
										FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame7 )
									end
								end
								
								if event.interrupted then
									FactionIconFrame6( FactionIcon, event )
									return 
								else
									FactionIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FactionIcon:setAlpha( 0.41 )
									FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame6 )
								end
							end
							
							if event.interrupted then
								FactionIconFrame5( FactionIcon, event )
								return 
							else
								FactionIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FactionIcon:setAlpha( 0.4 )
								FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame5 )
							end
						end
						
						if event.interrupted then
							FactionIconFrame4( FactionIcon, event )
							return 
						else
							FactionIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FactionIcon:setAlpha( 0.87 )
							FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame4 )
						end
					end
					
					if event.interrupted then
						FactionIconFrame3( FactionIcon, event )
						return 
					else
						FactionIcon:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						FactionIcon:setAlpha( 0.57 )
						FactionIcon:registerEventHandler( "transition_complete_keyframe", FactionIconFrame3 )
					end
				end
				
				FactionIcon:completeAnimation()
				self.FactionIcon:setAlpha( 0 )
				FactionIconFrame2( FactionIcon, {} )
				local FactionNameFrame2 = function ( FactionName, event )
					local FactionNameFrame3 = function ( FactionName, event )
						local FactionNameFrame4 = function ( FactionName, event )
							local FactionNameFrame5 = function ( FactionName, event )
								local FactionNameFrame6 = function ( FactionName, event )
									local FactionNameFrame7 = function ( FactionName, event )
										local FactionNameFrame8 = function ( FactionName, event )
											local FactionNameFrame9 = function ( FactionName, event )
												local FactionNameFrame10 = function ( FactionName, event )
													local FactionNameFrame11 = function ( FactionName, event )
														local FactionNameFrame12 = function ( FactionName, event )
															local FactionNameFrame13 = function ( FactionName, event )
																local FactionNameFrame14 = function ( FactionName, event )
																	local FactionNameFrame15 = function ( FactionName, event )
																		local FactionNameFrame16 = function ( FactionName, event )
																			local FactionNameFrame17 = function ( FactionName, event )
																				local FactionNameFrame18 = function ( FactionName, event )
																					local FactionNameFrame19 = function ( FactionName, event )
																						if not event.interrupted then
																							FactionName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																						end
																						FactionName:setAlpha( 0 )
																						if event.interrupted then
																							self.clipFinished( FactionName, event )
																						else
																							FactionName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						FactionNameFrame19( FactionName, event )
																						return 
																					else
																						FactionName:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																						FactionName:setAlpha( 0.21 )
																						FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					FactionNameFrame18( FactionName, event )
																					return 
																				else
																					FactionName:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					FactionName:setAlpha( 0.02 )
																					FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				FactionNameFrame17( FactionName, event )
																				return 
																			else
																				FactionName:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
																				FactionName:setAlpha( 0.28 )
																				FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			FactionNameFrame16( FactionName, event )
																			return 
																		else
																			FactionName:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			FactionName:setAlpha( 0.63 )
																			FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		FactionNameFrame15( FactionName, event )
																		return 
																	else
																		FactionName:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																		FactionName:setAlpha( 0.36 )
																		FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame15 )
																	end
																end
																
																if event.interrupted then
																	FactionNameFrame14( FactionName, event )
																	return 
																else
																	FactionName:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																	FactionName:setAlpha( 0.7 )
																	FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame14 )
																end
															end
															
															if event.interrupted then
																FactionNameFrame13( FactionName, event )
																return 
															else
																FactionName:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																FactionName:setAlpha( 0.94 )
																FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame13 )
															end
														end
														
														if event.interrupted then
															FactionNameFrame12( FactionName, event )
															return 
														else
															FactionName:beginAnimation( "keyframe", 1769, false, false, CoD.TweenType.Linear )
															FactionName:setAlpha( 1 )
															FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame12 )
														end
													end
													
													if event.interrupted then
														FactionNameFrame11( FactionName, event )
														return 
													else
														FactionName:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														FactionName:setAlpha( 0.64 )
														FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame11 )
													end
												end
												
												if event.interrupted then
													FactionNameFrame10( FactionName, event )
													return 
												else
													FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													FactionName:setAlpha( 1 )
													FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame10 )
												end
											end
											
											if event.interrupted then
												FactionNameFrame9( FactionName, event )
												return 
											else
												FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												FactionName:setAlpha( 0.64 )
												FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame9 )
											end
										end
										
										if event.interrupted then
											FactionNameFrame8( FactionName, event )
											return 
										else
											FactionName:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame8 )
										end
									end
									
									if event.interrupted then
										FactionNameFrame7( FactionName, event )
										return 
									else
										FactionName:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FactionName:setAlpha( 0.98 )
										FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame7 )
									end
								end
								
								if event.interrupted then
									FactionNameFrame6( FactionName, event )
									return 
								else
									FactionName:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame6 )
								end
							end
							
							if event.interrupted then
								FactionNameFrame5( FactionName, event )
								return 
							else
								FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FactionName:setAlpha( 0.41 )
								FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame5 )
							end
						end
						
						if event.interrupted then
							FactionNameFrame4( FactionName, event )
							return 
						else
							FactionName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FactionName:setAlpha( 0.85 )
							FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame4 )
						end
					end
					
					if event.interrupted then
						FactionNameFrame3( FactionName, event )
						return 
					else
						FactionName:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						FactionName:setAlpha( 0.45 )
						FactionName:registerEventHandler( "transition_complete_keyframe", FactionNameFrame3 )
					end
				end
				
				FactionName:completeAnimation()
				self.FactionName:setAlpha( 0 )
				FactionNameFrame2( FactionName, {} )
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 405.75, 889.75 )
				self.Glitch:setTopBottom( true, false, 36, 318 )
				self.clipFinished( Glitch, {} )
				FactionWidget:completeAnimation()
				self.FactionWidget:setAlpha( 0 )
				self.clipFinished( FactionWidget, {} )
			end
		}
	}
	self.close = function ( self )
		self.GlowPanel:close()
		self.PrematchVignette:close()
		self.PrematchCountdownNumbers:close()
		self.GameTypeHintText:close()
		self.DoubleXPText:close()
		self.FactionName:close()
		self.Glitch:close()
		self.FactionWidget:close()
		self.FactionIcon:close()
		CoD.PrematchCountdown.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

