-- deff0eacdb8269d83a94a9b2ed29fd6b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_Numbers" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_Main" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_2xpBadge" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_2xpWeaponBadge" )
require( "ui.uieditor.widgets.BlackMarket.DoubleLoot" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_2xpWeaponLabel" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.PrematchCountdownNumbers.Numbers.Numbers:setupPrematchTimer( f1_arg1 )
	if f1_arg1 then
		local f1_local0 = f1_arg1 - Engine.CurrentGameTime()
		if f1_local0 > 5000 then
			f1_arg0:registerEventHandler( "faction_start", function ( element )
				if CoD.IsShoutcaster( f1_arg2 ) then
					element:playClip( "ShowOnlyCodcasterFactionInfo" )
				else
					element:playClip( "Start" )
				end
				element.Glitch:playClip( "GlitchSmall2Slow" )
				return true
			end )
			f1_arg0:addElement( LUI.UITimer.new( f1_local0 - 5000, "faction_start", true ) )
		else
			if CoD.IsShoutcaster( f1_arg2 ) then
				f1_arg0:playClip( "ShowOnlyCodcasterFactionInfo" )
			else
				f1_arg0:playClip( "Start" )
			end
			f1_arg0.Glitch:playClip( "GlitchSmall2Slow" )
		end
	end
	f1_arg0.PrematchCountdownNumbers:playClip( "Start" )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	if not ShouldDisplayFactionIconAtPrematchCountdown( f3_arg1 ) then
		f3_arg0.FactionIcon:setAlpha( 0 )
		f3_arg0.FactionIcon0:setAlpha( 0 )
		f3_arg0.FactionName:setAlpha( 0 )
		f3_arg0.FactionIcon.setAlpha = CoD.NullFunction
		f3_arg0.FactionIcon0.setAlpha = CoD.NullFunction
		f3_arg0.FactionName.setAlpha = CoD.NullFunction
	end
	local f3_local0 = function ( f4_arg0, f4_arg1 )
		f4_arg0.Glitch:playClip( "GlitchSmall3" )
		f4_arg0:playClip( "ShowObjectiveHint" )
		f4_arg0:registerEventHandler( "clip_over", function ( element, event )
			local f5_local0 = Engine.GetRoundsPlayed( f3_arg1 )
			local f5_local1
			if f5_local0 ~= nil and f5_local0 ~= 0 then
				f5_local1 = false
			else
				f5_local1 = true
			end
			if f5_local1 and IsDoubleXP( f3_arg1 ) and IsDoubleWeaponXP( f3_arg1 ) then
				element:playClip( "ShowDoubleXPandWeaponXP" )
				element.Glitch:playClip( "GlitchSmall1" )
				element:registerEventHandler( "clip_over", function ( element, event )
					element:close()
				end )
			elseif f5_local1 and IsDoubleXP( f3_arg1 ) then
				element:playClip( "ShowDoubleXPIcon" )
				element.Glitch:playClip( "GlitchSmall1" )
				element:registerEventHandler( "clip_over", function ( element, event )
					element:close()
				end )
			elseif f5_local1 and IsDoubleWeaponXP( f3_arg1 ) then
				element:playClip( "ShowDoubleWeaponXPIcon" )
				element.Glitch:playClip( "GlitchSmall1" )
				element:registerEventHandler( "clip_over", function ( element, event )
					element:close()
				end )
			elseif f5_local1 and IsDoubleLootXP( f3_arg1 ) then
				element:playClip( "ShowDoubleLootIcon" )
				element.Glitch:playClip( "GlitchSmall1" )
				element:registerEventHandler( "clip_over", function ( element, event )
					element:close()
				end )
			else
				element:close()
			end
		end )
	end
	
	f3_arg0:subscribeToGlobalModel( f3_arg1, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "show_gametype_objective_hint" then
			local f10_local1 = {
				controller = f3_arg1,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}
			f3_arg0:setAlpha( 1 )
			f3_arg0.GameTypeHintText.MatchText:setText( Engine.Localize( Engine.GetIString( f10_local1.data[1], "CS_LOCALIZED_STRINGS" ) ) )
			f3_arg0.GameTypeIcon:setImage( RegisterImage( CoD.GetLoadingScreenGameTypeIconName() ) )
			if f3_arg0.playFactionInfoAnimation and CoDShared.IsGametypeTeamBased() then
				f3_arg0:playClip( "ShowOnlyFactionInfo" )
				f3_arg0.Glitch:playClip( "GlitchSmall3" )
				f3_arg0:registerEventHandler( "clip_over", f3_local0 )
			else
				f3_local0( f3_arg0, f10_local1 )
			end
		elseif modelValue == "prematch_timer_ended" then
			if not CoD.IsShoutcaster( f3_arg1 ) then
				f3_arg0:playClip( "Stop" )
			end
			f3_arg0.Glitch:playClip( "GlitchSmall2" )
			f3_arg0.PrematchCountdownNumbers:playClip( "Stop" )
			f3_arg0:registerEventHandler( "clip_over", function ( element, event )
				element:setAlpha( 0 )
				if IsDemoPlaying() then
					element:close()
				end
			end )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "isInPrematchPeriod" ), 0 )
		end
	end )
	f3_arg0.onPlayerSpawned = function ( f12_arg0 )
		if not IsInPrematchPeriod() then
			f12_arg0.playFactionInfoAnimation = true
		end
	end
	
	f3_arg0.setupCountdown = f0_local0
	f3_arg0:setState( "DefaultState" )
	f3_arg0.Glitch:playClip( "DefaultClip" )
	local f3_local1 = Engine.GetGametypeSetting( "prematchperiod" ) * 1000
	local f3_local2 = Engine.CurrentGameTime()
	local f3_local3 = 250
	if f3_local2 < f3_local1 then
		f3_local3 = f3_local1 - f3_local2
	end

	LUI.OverrideFunction_CallOriginalSecond( f3_arg0, "close", function ( element )
		local f13_local0 = element:getParent()
		f13_local0.PrematchCountdown = nil
	end )
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
	GlowPanel:setAlpha( 0 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local PrematchCountdownNumbers = CoD.PrematchCountdown_Numbers.new( menu, controller )
	PrematchCountdownNumbers:setLeftRight( true, true, 0, 0 )
	PrematchCountdownNumbers:setTopBottom( false, false, -30, 20 )
	PrematchCountdownNumbers:setAlpha( 0 )
	PrematchCountdownNumbers.MatchText.MatchText:setText( Engine.Localize( "MP_MATCH_STARTING_IN" ) )
	PrematchCountdownNumbers:registerEventHandler( "menu_opened", function ( element, event )
		local f15_local0 = nil
		PlayClipOnElement( self, {
			elementName = "PrematchCountdownNumbers",
			clipName = "Start"
		}, controller )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( PrematchCountdownNumbers )
	self.PrematchCountdownNumbers = PrematchCountdownNumbers
	
	local FactionIcon0 = LUI.UIImage.new()
	FactionIcon0:setLeftRight( true, false, 577, 705 )
	FactionIcon0:setTopBottom( true, false, 36, 164 )
	FactionIcon0:setRGB( 0, 0, 0 )
	FactionIcon0:setAlpha( 0 )
	FactionIcon0:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			FactionIcon0:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	self:addElement( FactionIcon0 )
	self.FactionIcon0 = FactionIcon0
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( true, false, 577, 705 )
	FactionIcon:setTopBottom( true, false, 36, 164 )
	FactionIcon:setAlpha( 0 )
	FactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	FactionIcon:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			FactionIcon:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local CodcasterFactionIcon = LUI.UIImage.new()
	CodcasterFactionIcon:setLeftRight( true, false, 541.76, 745.24 )
	CodcasterFactionIcon:setTopBottom( true, false, 36, 164 )
	CodcasterFactionIcon:setRGB( 0, 0, 0 )
	CodcasterFactionIcon:setAlpha( 0 )
	CodcasterFactionIcon:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			CodcasterFactionIcon:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	self:addElement( CodcasterFactionIcon )
	self.CodcasterFactionIcon = CodcasterFactionIcon
	
	local CodcasterFactionIconAdd = LUI.UIImage.new()
	CodcasterFactionIconAdd:setLeftRight( true, false, 541.76, 745.24 )
	CodcasterFactionIconAdd:setTopBottom( true, false, 36, 164 )
	CodcasterFactionIconAdd:setAlpha( 0 )
	CodcasterFactionIconAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CodcasterFactionIconAdd:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			CodcasterFactionIconAdd:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	self:addElement( CodcasterFactionIconAdd )
	self.CodcasterFactionIconAdd = CodcasterFactionIconAdd
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 576, 704 )
	GameTypeIcon:setTopBottom( true, false, 48.5, 176.5 )
	GameTypeIcon:setAlpha( 0 )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
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
	
	local GameTypeHintText = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	GameTypeHintText:setLeftRight( false, false, -207, 207 )
	GameTypeHintText:setTopBottom( true, false, 186, 218 )
	GameTypeHintText:setAlpha( 0 )
	GameTypeHintText.MatchText:setText( Engine.Localize( "OBJECTIVES_TDM_HINT" ) )
	GameTypeHintText.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameTypeHintText.MatchText:setLetterSpacing( 1 )
	self:addElement( GameTypeHintText )
	self.GameTypeHintText = GameTypeHintText
	
	local DoubleXPText = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	DoubleXPText:setLeftRight( false, false, -138.5, 145.5 )
	DoubleXPText:setTopBottom( true, false, 186.29, 218.5 )
	DoubleXPText:setAlpha( 0 )
	DoubleXPText.MatchText:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
	DoubleXPText.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	DoubleXPText.MatchText:setLetterSpacing( 1 )
	self:addElement( DoubleXPText )
	self.DoubleXPText = DoubleXPText
	
	local FactionName = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	FactionName:setLeftRight( false, false, -142, 142 )
	FactionName:setTopBottom( true, false, 186.29, 218.5 )
	FactionName:setAlpha( 0 )
	FactionName.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionName.MatchText:setLetterSpacing( 1 )
	FactionName:subscribeToGlobalModel( controller, "Factions", "playerFactionDisplayName", function ( model )
		local playerFactionDisplayName = Engine.GetModelValue( model )
		if playerFactionDisplayName then
			FactionName.MatchText:setText( Engine.Localize( playerFactionDisplayName ) )
		end
	end )
	self:addElement( FactionName )
	self.FactionName = FactionName
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				PrematchCountdownNumbers:completeAnimation()
				self.PrematchCountdownNumbers:setAlpha( 1 )
				self.clipFinished( PrematchCountdownNumbers, {} )

				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, 408, 880 )
				self.Glitch:setTopBottom( true, false, 218, 474 )
				self.clipFinished( Glitch, {} )

				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				self.clipFinished( PrematchCountdown2xpBadge, {} )
			end,
			Start = function ()
				self:setupElementClipCounter( 8 )

				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
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
				local FactionIcon0Frame2 = function ( FactionIcon0, event )
					local FactionIcon0Frame3 = function ( FactionIcon0, event )
						local FactionIcon0Frame4 = function ( FactionIcon0, event )
							local FactionIcon0Frame5 = function ( FactionIcon0, event )
								local FactionIcon0Frame6 = function ( FactionIcon0, event )
									local FactionIcon0Frame7 = function ( FactionIcon0, event )
										local FactionIcon0Frame8 = function ( FactionIcon0, event )
											local FactionIcon0Frame9 = function ( FactionIcon0, event )
												local FactionIcon0Frame10 = function ( FactionIcon0, event )
													local FactionIcon0Frame11 = function ( FactionIcon0, event )
														local FactionIcon0Frame12 = function ( FactionIcon0, event )
															if not event.interrupted then
																FactionIcon0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															end
															FactionIcon0:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( FactionIcon0, event )
															else
																FactionIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															FactionIcon0Frame12( FactionIcon0, event )
															return 
														else
															FactionIcon0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame12 )
														end
													end
													
													if event.interrupted then
														FactionIcon0Frame11( FactionIcon0, event )
														return 
													else
														FactionIcon0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														FactionIcon0:setAlpha( 0.41 )
														FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame11 )
													end
												end
												
												if event.interrupted then
													FactionIcon0Frame10( FactionIcon0, event )
													return 
												else
													FactionIcon0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame10 )
												end
											end
											
											if event.interrupted then
												FactionIcon0Frame9( FactionIcon0, event )
												return 
											else
												FactionIcon0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												FactionIcon0:setAlpha( 0.7 )
												FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame9 )
											end
										end
										
										if event.interrupted then
											FactionIcon0Frame8( FactionIcon0, event )
											return 
										else
											FactionIcon0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											FactionIcon0:setAlpha( 0.48 )
											FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame8 )
										end
									end
									
									if event.interrupted then
										FactionIcon0Frame7( FactionIcon0, event )
										return 
									else
										FactionIcon0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FactionIcon0:setAlpha( 0.42 )
										FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame7 )
									end
								end
								
								if event.interrupted then
									FactionIcon0Frame6( FactionIcon0, event )
									return 
								else
									FactionIcon0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame6 )
								end
							end
							
							if event.interrupted then
								FactionIcon0Frame5( FactionIcon0, event )
								return 
							else
								FactionIcon0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FactionIcon0:setAlpha( 0.7 )
								FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame5 )
							end
						end
						
						if event.interrupted then
							FactionIcon0Frame4( FactionIcon0, event )
							return 
						else
							FactionIcon0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							FactionIcon0:setAlpha( 0.4 )
							FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame4 )
						end
					end
					
					if event.interrupted then
						FactionIcon0Frame3( FactionIcon0, event )
						return 
					else
						FactionIcon0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame3 )
					end
				end
				
				FactionIcon0:completeAnimation()
				self.FactionIcon0:setAlpha( 0 )
				FactionIcon0Frame2( FactionIcon0, {} )
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

				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( false )
				self.Sound:playSound( "faction_in", controller )
				self.clipFinished( Sound, {} )

				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				self.clipFinished( PrematchCountdown2xpBadge, {} )
			end,
			Stop = function ()
				self:setupElementClipCounter( 8 )

				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
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
				local FactionIcon0Frame2 = function ( FactionIcon0, event )
					local FactionIcon0Frame3 = function ( FactionIcon0, event )
						local FactionIcon0Frame4 = function ( FactionIcon0, event )
							local FactionIcon0Frame5 = function ( FactionIcon0, event )
								local FactionIcon0Frame6 = function ( FactionIcon0, event )
									local FactionIcon0Frame7 = function ( FactionIcon0, event )
										local FactionIcon0Frame8 = function ( FactionIcon0, event )
											if not event.interrupted then
												FactionIcon0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											end
											FactionIcon0:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FactionIcon0, event )
											else
												FactionIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FactionIcon0Frame8( FactionIcon0, event )
											return 
										else
											FactionIcon0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											FactionIcon0:setAlpha( 0.3 )
											FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame8 )
										end
									end
									
									if event.interrupted then
										FactionIcon0Frame7( FactionIcon0, event )
										return 
									else
										FactionIcon0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										FactionIcon0:setAlpha( 0.15 )
										FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame7 )
									end
								end
								
								if event.interrupted then
									FactionIcon0Frame6( FactionIcon0, event )
									return 
								else
									FactionIcon0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									FactionIcon0:setAlpha( 0.37 )
									FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame6 )
								end
							end
							
							if event.interrupted then
								FactionIcon0Frame5( FactionIcon0, event )
								return 
							else
								FactionIcon0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FactionIcon0:setAlpha( 0.33 )
								FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame5 )
							end
						end
						
						if event.interrupted then
							FactionIcon0Frame4( FactionIcon0, event )
							return 
						else
							FactionIcon0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							FactionIcon0:setAlpha( 0.2 )
							FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame4 )
						end
					end
					
					if event.interrupted then
						FactionIcon0Frame3( FactionIcon0, event )
						return 
					else
						FactionIcon0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						FactionIcon0:setAlpha( 0.5 )
						FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame3 )
					end
				end
				
				FactionIcon0:completeAnimation()
				self.FactionIcon0:setAlpha( 1 )
				FactionIcon0Frame2( FactionIcon0, {} )
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

				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( false )
				self.Sound:playSound( "faction_out", controller )
				self.clipFinished( Sound, {} )

				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				self.clipFinished( PrematchCountdown2xpBadge, {} )
			end,
			ShowObjectiveHint = function ()
				self:setupElementClipCounter( 9 )

				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )

				PrematchCountdownNumbers:completeAnimation()
				self.PrematchCountdownNumbers:setAlpha( 0 )
				self.clipFinished( PrematchCountdownNumbers, {} )

				FactionIcon0:completeAnimation()
				self.FactionIcon0:setAlpha( 0 )
				self.clipFinished( FactionIcon0, {} )

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
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
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
							Sound:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							Sound:playSound( "obj_out", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 3950, false, false, CoD.TweenType.Linear )
						Sound:playSound( "0", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "obj_in", controller )
				SoundFrame2( Sound, {} )

				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				self.clipFinished( PrematchCountdown2xpBadge, {} )
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
			ShowOnlyFactionInfo = function ()
				self:setupElementClipCounter( 7 )

				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				local FactionIcon0Frame2 = function ( FactionIcon0, event )
					local FactionIcon0Frame3 = function ( FactionIcon0, event )
						local FactionIcon0Frame4 = function ( FactionIcon0, event )
							if not event.interrupted then
								FactionIcon0:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
							end
							FactionIcon0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FactionIcon0, event )
							else
								FactionIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FactionIcon0Frame4( FactionIcon0, event )
							return 
						else
							FactionIcon0:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
							FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame4 )
						end
					end
					
					if event.interrupted then
						FactionIcon0Frame3( FactionIcon0, event )
						return 
					else
						FactionIcon0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						FactionIcon0:setAlpha( 1 )
						FactionIcon0:registerEventHandler( "transition_complete_keyframe", FactionIcon0Frame3 )
					end
				end
				
				FactionIcon0:completeAnimation()
				self.FactionIcon0:setAlpha( 0 )
				FactionIcon0Frame2( FactionIcon0, {} )
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
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							Sound:playSound( "faction_out", controller )
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
							Sound:beginAnimation( "keyframe", 2319, false, false, CoD.TweenType.Linear )
							Sound:playSound( "0", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Sound:playSound( "faction_in", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "0", controller )
				SoundFrame2( Sound, {} )

				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				self.clipFinished( PrematchCountdown2xpBadge, {} )
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
				local f326_local5 = function ( f380_arg0, f380_arg1 )
					local f380_local0 = function ( f381_arg0, f381_arg1 )
						local f381_local0 = function ( f382_arg0, f382_arg1 )
							local f382_local0 = function ( f383_arg0, f383_arg1 )
								local f383_local0 = function ( f384_arg0, f384_arg1 )
									local f384_local0 = function ( f385_arg0, f385_arg1 )
										local f385_local0 = function ( f386_arg0, f386_arg1 )
											local f386_local0 = function ( f387_arg0, f387_arg1 )
												local f387_local0 = function ( f388_arg0, f388_arg1 )
													if not f388_arg1.interrupted then
														f388_arg0:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
													end
													f388_arg0:setLeftRight( false, false, 86, 214 )
													f388_arg0:setTopBottom( true, false, 48.5, 176.5 )
													f388_arg0:setAlpha( 0 )
													if f388_arg1.interrupted then
														self.clipFinished( f388_arg0, f388_arg1 )
													else
														f388_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f387_arg1.interrupted then
													f387_local0( f387_arg0, f387_arg1 )
													return 
												else
													f387_arg0:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Bounce )
													f387_arg0:setAlpha( 1 )
													f387_arg0:registerEventHandler( "transition_complete_keyframe", f387_local0 )
												end
											end
											
											if f386_arg1.interrupted then
												f386_local0( f386_arg0, f386_arg1 )
												return 
											else
												f386_arg0:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Bounce )
												f386_arg0:setAlpha( 0.2 )
												f386_arg0:registerEventHandler( "transition_complete_keyframe", f386_local0 )
											end
										end
										
										if f385_arg1.interrupted then
											f385_local0( f385_arg0, f385_arg1 )
											return 
										else
											f385_arg0:beginAnimation( "keyframe", 1160, false, false, CoD.TweenType.Linear )
											f385_arg0:registerEventHandler( "transition_complete_keyframe", f385_local0 )
										end
									end
									
									if f384_arg1.interrupted then
										f384_local0( f384_arg0, f384_arg1 )
										return 
									else
										f384_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										f384_arg0:setAlpha( 1 )
										f384_arg0:registerEventHandler( "transition_complete_keyframe", f384_local0 )
									end
								end
								
								if f383_arg1.interrupted then
									f383_local0( f383_arg0, f383_arg1 )
									return 
								else
									f383_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									f383_arg0:setAlpha( 0.2 )
									f383_arg0:registerEventHandler( "transition_complete_keyframe", f383_local0 )
								end
							end
							
							if f382_arg1.interrupted then
								f382_local0( f382_arg0, f382_arg1 )
								return 
							else
								f382_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								f382_arg0:setAlpha( 1 )
								f382_arg0:registerEventHandler( "transition_complete_keyframe", f382_local0 )
							end
						end
						
						if f381_arg1.interrupted then
							f381_local0( f381_arg0, f381_arg1 )
							return 
						else
							f381_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							f381_arg0:setAlpha( 0.2 )
							f381_arg0:registerEventHandler( "transition_complete_keyframe", f381_local0 )
						end
					end
					
					if f380_arg1.interrupted then
						f380_local0( f380_arg0, f380_arg1 )
						return 
					else
						f380_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f380_arg0:setAlpha( 1 )
						f380_arg0:registerEventHandler( "transition_complete_keyframe", f380_local0 )
					end
				end
				
				PrematchCountdown2xpWeaponBadge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				PrematchCountdown2xpWeaponBadge:setLeftRight( false, false, 86, 214 )
				PrematchCountdown2xpWeaponBadge:setTopBottom( true, false, 48.5, 176.5 )
				PrematchCountdown2xpWeaponBadge:setAlpha( 0 )
				PrematchCountdown2xpWeaponBadge:registerEventHandler( "transition_complete_keyframe", f326_local5 )
				local f326_local6 = function ( f389_arg0, f389_arg1 )
					local f389_local0 = function ( f390_arg0, f390_arg1 )
						local f390_local0 = function ( f391_arg0, f391_arg1 )
							local f391_local0 = function ( f392_arg0, f392_arg1 )
								local f392_local0 = function ( f393_arg0, f393_arg1 )
									local f393_local0 = function ( f394_arg0, f394_arg1 )
										local f394_local0 = function ( f395_arg0, f395_arg1 )
											local f395_local0 = function ( f396_arg0, f396_arg1 )
												local f396_local0 = function ( f397_arg0, f397_arg1 )
													local f397_local0 = function ( f398_arg0, f398_arg1 )
														local f398_local0 = function ( f399_arg0, f399_arg1 )
															local f399_local0 = function ( f400_arg0, f400_arg1 )
																if not f400_arg1.interrupted then
																	f400_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																f400_arg0:setLeftRight( false, true, -433.33, -398 )
																f400_arg0:setTopBottom( true, true, 106.75, -601.75 )
																f400_arg0:setAlpha( 0 )
																if f400_arg1.interrupted then
																	self.clipFinished( f400_arg0, f400_arg1 )
																else
																	f400_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if f399_arg1.interrupted then
																f399_local0( f399_arg0, f399_arg1 )
																return 
															else
																f399_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																f399_arg0:setAlpha( 0.3 )
																f399_arg0:registerEventHandler( "transition_complete_keyframe", f399_local0 )
															end
														end
														
														if f398_arg1.interrupted then
															f398_local0( f398_arg0, f398_arg1 )
															return 
														else
															f398_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															f398_arg0:setAlpha( 0.5 )
															f398_arg0:registerEventHandler( "transition_complete_keyframe", f398_local0 )
														end
													end
													
													if f397_arg1.interrupted then
														f397_local0( f397_arg0, f397_arg1 )
														return 
													else
														f397_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														f397_arg0:setAlpha( 0.4 )
														f397_arg0:registerEventHandler( "transition_complete_keyframe", f397_local0 )
													end
												end
												
												if f396_arg1.interrupted then
													f396_local0( f396_arg0, f396_arg1 )
													return 
												else
													f396_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f396_arg0:setAlpha( 0.5 )
													f396_arg0:registerEventHandler( "transition_complete_keyframe", f396_local0 )
												end
											end
											
											if f395_arg1.interrupted then
												f395_local0( f395_arg0, f395_arg1 )
												return 
											else
												f395_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f395_arg0:setAlpha( 0.3 )
												f395_arg0:registerEventHandler( "transition_complete_keyframe", f395_local0 )
											end
										end
										
										if f394_arg1.interrupted then
											f394_local0( f394_arg0, f394_arg1 )
											return 
										else
											f394_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											f394_arg0:setAlpha( 0.5 )
											f394_arg0:registerEventHandler( "transition_complete_keyframe", f394_local0 )
										end
									end
									
									if f393_arg1.interrupted then
										f393_local0( f393_arg0, f393_arg1 )
										return 
									else
										f393_arg0:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										f393_arg0:registerEventHandler( "transition_complete_keyframe", f393_local0 )
									end
								end
								
								if f392_arg1.interrupted then
									f392_local0( f392_arg0, f392_arg1 )
									return 
								else
									f392_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f392_arg0:setLeftRight( false, true, -433.33, -398 )
									f392_arg0:registerEventHandler( "transition_complete_keyframe", f392_local0 )
								end
							end
							
							if f391_arg1.interrupted then
								f391_local0( f391_arg0, f391_arg1 )
								return 
							else
								f391_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								f391_arg0:setLeftRight( false, true, -414, -378.67 )
								f391_arg0:registerEventHandler( "transition_complete_keyframe", f391_local0 )
							end
						end
						
						if f390_arg1.interrupted then
							f390_local0( f390_arg0, f390_arg1 )
							return 
						else
							f390_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f390_arg0:setLeftRight( false, true, -434, -398.67 )
							f390_arg0:setAlpha( 0.7 )
							f390_arg0:registerEventHandler( "transition_complete_keyframe", f390_local0 )
						end
					end
					
					if f389_arg1.interrupted then
						f389_local0( f389_arg0, f389_arg1 )
						return 
					else
						f389_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						f389_arg0:registerEventHandler( "transition_complete_keyframe", f389_local0 )
					end
				end
				
				DoubleWeaponXPTickRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				DoubleWeaponXPTickRight:setLeftRight( false, true, -183.33, -148 )
				DoubleWeaponXPTickRight:setTopBottom( true, true, 106.75, -601.75 )
				DoubleWeaponXPTickRight:setAlpha( 0 )
				DoubleWeaponXPTickRight:registerEventHandler( "transition_complete_keyframe", f326_local6 )
				local f326_local7 = function ( f401_arg0, f401_arg1 )
					local f401_local0 = function ( f402_arg0, f402_arg1 )
						local f402_local0 = function ( f403_arg0, f403_arg1 )
							local f403_local0 = function ( f404_arg0, f404_arg1 )
								local f404_local0 = function ( f405_arg0, f405_arg1 )
									local f405_local0 = function ( f406_arg0, f406_arg1 )
										local f406_local0 = function ( f407_arg0, f407_arg1 )
											local f407_local0 = function ( f408_arg0, f408_arg1 )
												local f408_local0 = function ( f409_arg0, f409_arg1 )
													local f409_local0 = function ( f410_arg0, f410_arg1 )
														local f410_local0 = function ( f411_arg0, f411_arg1 )
															local f411_local0 = function ( f412_arg0, f412_arg1 )
																if not f412_arg1.interrupted then
																	f412_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																f412_arg0:setLeftRight( false, true, -582.33, -547 )
																f412_arg0:setTopBottom( true, true, 106.75, -601.75 )
																f412_arg0:setAlpha( 0 )
																if f412_arg1.interrupted then
																	self.clipFinished( f412_arg0, f412_arg1 )
																else
																	f412_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if f411_arg1.interrupted then
																f411_local0( f411_arg0, f411_arg1 )
																return 
															else
																f411_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																f411_arg0:setAlpha( 0.5 )
																f411_arg0:registerEventHandler( "transition_complete_keyframe", f411_local0 )
															end
														end
														
														if f410_arg1.interrupted then
															f410_local0( f410_arg0, f410_arg1 )
															return 
														else
															f410_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															f410_arg0:setAlpha( 0.3 )
															f410_arg0:registerEventHandler( "transition_complete_keyframe", f410_local0 )
														end
													end
													
													if f409_arg1.interrupted then
														f409_local0( f409_arg0, f409_arg1 )
														return 
													else
														f409_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														f409_arg0:setAlpha( 0.4 )
														f409_arg0:registerEventHandler( "transition_complete_keyframe", f409_local0 )
													end
												end
												
												if f408_arg1.interrupted then
													f408_local0( f408_arg0, f408_arg1 )
													return 
												else
													f408_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f408_arg0:setAlpha( 0.5 )
													f408_arg0:registerEventHandler( "transition_complete_keyframe", f408_local0 )
												end
											end
											
											if f407_arg1.interrupted then
												f407_local0( f407_arg0, f407_arg1 )
												return 
											else
												f407_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f407_arg0:setAlpha( 0.3 )
												f407_arg0:registerEventHandler( "transition_complete_keyframe", f407_local0 )
											end
										end
										
										if f406_arg1.interrupted then
											f406_local0( f406_arg0, f406_arg1 )
											return 
										else
											f406_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											f406_arg0:setAlpha( 0.5 )
											f406_arg0:registerEventHandler( "transition_complete_keyframe", f406_local0 )
										end
									end
									
									if f405_arg1.interrupted then
										f405_local0( f405_arg0, f405_arg1 )
										return 
									else
										f405_arg0:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										f405_arg0:registerEventHandler( "transition_complete_keyframe", f405_local0 )
									end
								end
								
								if f404_arg1.interrupted then
									f404_local0( f404_arg0, f404_arg1 )
									return 
								else
									f404_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f404_arg0:setLeftRight( false, true, -582.33, -547 )
									f404_arg0:registerEventHandler( "transition_complete_keyframe", f404_local0 )
								end
							end
							
							if f403_arg1.interrupted then
								f403_local0( f403_arg0, f403_arg1 )
								return 
							else
								f403_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								f403_arg0:setLeftRight( false, true, -603, -567.67 )
								f403_arg0:registerEventHandler( "transition_complete_keyframe", f403_local0 )
							end
						end
						
						if f402_arg1.interrupted then
							f402_local0( f402_arg0, f402_arg1 )
							return 
						else
							f402_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f402_arg0:setLeftRight( false, true, -583, -547.67 )
							f402_arg0:setAlpha( 0.7 )
							f402_arg0:registerEventHandler( "transition_complete_keyframe", f402_local0 )
						end
					end
					
					if f401_arg1.interrupted then
						f401_local0( f401_arg0, f401_arg1 )
						return 
					else
						f401_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						f401_arg0:registerEventHandler( "transition_complete_keyframe", f401_local0 )
					end
				end
				
				DoubleWeaponXPTickLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				DoubleWeaponXPTickLeft:setLeftRight( false, true, -852, -816.67 )
				DoubleWeaponXPTickLeft:setTopBottom( true, true, 106.75, -601.75 )
				DoubleWeaponXPTickLeft:setAlpha( 0 )
				DoubleWeaponXPTickLeft:registerEventHandler( "transition_complete_keyframe", f326_local7 )
				local f326_local8 = function ( f413_arg0, f413_arg1 )
					local f413_local0 = function ( f414_arg0, f414_arg1 )
						local f414_local0 = function ( f415_arg0, f415_arg1 )
							local f415_local0 = function ( f416_arg0, f416_arg1 )
								local f416_local0 = function ( f417_arg0, f417_arg1 )
									local f417_local0 = function ( f418_arg0, f418_arg1 )
										local f418_local0 = function ( f419_arg0, f419_arg1 )
											local f419_local0 = function ( f420_arg0, f420_arg1 )
												local f420_local0 = function ( f421_arg0, f421_arg1 )
													local f421_local0 = function ( f422_arg0, f422_arg1 )
														local f422_local0 = function ( f423_arg0, f423_arg1 )
															local f423_local0 = function ( f424_arg0, f424_arg1 )
																local f424_local0 = function ( f425_arg0, f425_arg1 )
																	local f425_local0 = function ( f426_arg0, f426_arg1 )
																		local f426_local0 = function ( f427_arg0, f427_arg1 )
																			local f427_local0 = function ( f428_arg0, f428_arg1 )
																				if not f428_arg1.interrupted then
																					f428_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																				end
																				f428_arg0:setAlpha( 0 )
																				if f428_arg1.interrupted then
																					self.clipFinished( f428_arg0, f428_arg1 )
																				else
																					f428_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f427_arg1.interrupted then
																				f427_local0( f427_arg0, f427_arg1 )
																				return 
																			else
																				f427_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				f427_arg0:setAlpha( 0.45 )
																				f427_arg0:registerEventHandler( "transition_complete_keyframe", f427_local0 )
																			end
																		end
																		
																		if f426_arg1.interrupted then
																			f426_local0( f426_arg0, f426_arg1 )
																			return 
																		else
																			f426_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			f426_arg0:setAlpha( 0.34 )
																			f426_arg0:registerEventHandler( "transition_complete_keyframe", f426_local0 )
																		end
																	end
																	
																	if f425_arg1.interrupted then
																		f425_local0( f425_arg0, f425_arg1 )
																		return 
																	else
																		f425_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																		f425_arg0:setAlpha( 0.55 )
																		f425_arg0:registerEventHandler( "transition_complete_keyframe", f425_local0 )
																	end
																end
																
																if f424_arg1.interrupted then
																	f424_local0( f424_arg0, f424_arg1 )
																	return 
																else
																	f424_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	f424_arg0:setAlpha( 0.71 )
																	f424_arg0:registerEventHandler( "transition_complete_keyframe", f424_local0 )
																end
															end
															
															if f423_arg1.interrupted then
																f423_local0( f423_arg0, f423_arg1 )
																return 
															else
																f423_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																f423_arg0:setAlpha( 0.44 )
																f423_arg0:registerEventHandler( "transition_complete_keyframe", f423_local0 )
															end
														end
														
														if f422_arg1.interrupted then
															f422_local0( f422_arg0, f422_arg1 )
															return 
														else
															f422_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
															f422_arg0:setAlpha( 0.83 )
															f422_arg0:registerEventHandler( "transition_complete_keyframe", f422_local0 )
														end
													end
													
													if f421_arg1.interrupted then
														f421_local0( f421_arg0, f421_arg1 )
														return 
													else
														f421_arg0:beginAnimation( "keyframe", 1149, false, false, CoD.TweenType.Linear )
														f421_arg0:registerEventHandler( "transition_complete_keyframe", f421_local0 )
													end
												end
												
												if f420_arg1.interrupted then
													f420_local0( f420_arg0, f420_arg1 )
													return 
												else
													f420_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f420_arg0:setAlpha( 1 )
													f420_arg0:registerEventHandler( "transition_complete_keyframe", f420_local0 )
												end
											end
											
											if f419_arg1.interrupted then
												f419_local0( f419_arg0, f419_arg1 )
												return 
											else
												f419_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f419_arg0:registerEventHandler( "transition_complete_keyframe", f419_local0 )
											end
										end
										
										if f418_arg1.interrupted then
											f418_local0( f418_arg0, f418_arg1 )
											return 
										else
											f418_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f418_arg0:setAlpha( 0.76 )
											f418_arg0:registerEventHandler( "transition_complete_keyframe", f418_local0 )
										end
									end
									
									if f417_arg1.interrupted then
										f417_local0( f417_arg0, f417_arg1 )
										return 
									else
										f417_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f417_arg0:setAlpha( 1 )
										f417_arg0:registerEventHandler( "transition_complete_keyframe", f417_local0 )
									end
								end
								
								if f416_arg1.interrupted then
									f416_local0( f416_arg0, f416_arg1 )
									return 
								else
									f416_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f416_arg0:setAlpha( 0 )
									f416_arg0:registerEventHandler( "transition_complete_keyframe", f416_local0 )
								end
							end
							
							if f415_arg1.interrupted then
								f415_local0( f415_arg0, f415_arg1 )
								return 
							else
								f415_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f415_arg0:registerEventHandler( "transition_complete_keyframe", f415_local0 )
							end
						end
						
						if f414_arg1.interrupted then
							f414_local0( f414_arg0, f414_arg1 )
							return 
						else
							f414_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f414_arg0:setAlpha( 0.45 )
							f414_arg0:registerEventHandler( "transition_complete_keyframe", f414_local0 )
						end
					end
					
					if f413_arg1.interrupted then
						f413_local0( f413_arg0, f413_arg1 )
						return 
					else
						f413_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
						f413_arg0:setAlpha( 1 )
						f413_arg0:registerEventHandler( "transition_complete_keyframe", f413_local0 )
					end
				end
				
				DoubleWeaponXPLabel:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				DoubleWeaponXPLabel:setAlpha( 0 )
				DoubleWeaponXPLabel:registerEventHandler( "transition_complete_keyframe", f326_local8 )
			end,
			ShowOnlyCodcasterFactionInfo = function ()
				self:setupElementClipCounter( 7 )

				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				local CodcasterFactionIconFrame2 = function ( CodcasterFactionIcon, event )
					local CodcasterFactionIconFrame3 = function ( CodcasterFactionIcon, event )
						local CodcasterFactionIconFrame4 = function ( CodcasterFactionIcon, event )
							if not event.interrupted then
								CodcasterFactionIcon:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
							end
							CodcasterFactionIcon:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CodcasterFactionIcon, event )
							else
								CodcasterFactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CodcasterFactionIconFrame4( CodcasterFactionIcon, event )
							return 
						else
							CodcasterFactionIcon:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
							CodcasterFactionIcon:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconFrame4 )
						end
					end
					
					if event.interrupted then
						CodcasterFactionIconFrame3( CodcasterFactionIcon, event )
						return 
					else
						CodcasterFactionIcon:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						CodcasterFactionIcon:setAlpha( 1 )
						CodcasterFactionIcon:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconFrame3 )
					end
				end
				
				CodcasterFactionIcon:completeAnimation()
				self.CodcasterFactionIcon:setAlpha( 0 )
				CodcasterFactionIconFrame2( CodcasterFactionIcon, {} )
				local CodcasterFactionIconAddFrame2 = function ( CodcasterFactionIconAdd, event )
					local CodcasterFactionIconAddFrame3 = function ( CodcasterFactionIconAdd, event )
						local CodcasterFactionIconAddFrame4 = function ( CodcasterFactionIconAdd, event )
							local CodcasterFactionIconAddFrame5 = function ( CodcasterFactionIconAdd, event )
								local CodcasterFactionIconAddFrame6 = function ( CodcasterFactionIconAdd, event )
									local CodcasterFactionIconAddFrame7 = function ( CodcasterFactionIconAdd, event )
										local CodcasterFactionIconAddFrame8 = function ( CodcasterFactionIconAdd, event )
											local CodcasterFactionIconAddFrame9 = function ( CodcasterFactionIconAdd, event )
												local CodcasterFactionIconAddFrame10 = function ( CodcasterFactionIconAdd, event )
													local CodcasterFactionIconAddFrame11 = function ( CodcasterFactionIconAdd, event )
														local CodcasterFactionIconAddFrame12 = function ( CodcasterFactionIconAdd, event )
															local CodcasterFactionIconAddFrame13 = function ( CodcasterFactionIconAdd, event )
																local CodcasterFactionIconAddFrame14 = function ( CodcasterFactionIconAdd, event )
																	local CodcasterFactionIconAddFrame15 = function ( CodcasterFactionIconAdd, event )
																		local CodcasterFactionIconAddFrame16 = function ( CodcasterFactionIconAdd, event )
																			local CodcasterFactionIconAddFrame17 = function ( CodcasterFactionIconAdd, event )
																				if not event.interrupted then
																					CodcasterFactionIconAdd:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																				end
																				CodcasterFactionIconAdd:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( CodcasterFactionIconAdd, event )
																				else
																					CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				CodcasterFactionIconAddFrame17( CodcasterFactionIconAdd, event )
																				return 
																			else
																				CodcasterFactionIconAdd:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				CodcasterFactionIconAdd:setAlpha( 0.34 )
																				CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			CodcasterFactionIconAddFrame16( CodcasterFactionIconAdd, event )
																			return 
																		else
																			CodcasterFactionIconAdd:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			CodcasterFactionIconAdd:setAlpha( 0.24 )
																			CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		CodcasterFactionIconAddFrame15( CodcasterFactionIconAdd, event )
																		return 
																	else
																		CodcasterFactionIconAdd:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																		CodcasterFactionIconAdd:setAlpha( 0.44 )
																		CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame15 )
																	end
																end
																
																if event.interrupted then
																	CodcasterFactionIconAddFrame14( CodcasterFactionIconAdd, event )
																	return 
																else
																	CodcasterFactionIconAdd:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	CodcasterFactionIconAdd:setAlpha( 0.57 )
																	CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame14 )
																end
															end
															
															if event.interrupted then
																CodcasterFactionIconAddFrame13( CodcasterFactionIconAdd, event )
																return 
															else
																CodcasterFactionIconAdd:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																CodcasterFactionIconAdd:setAlpha( 0.35 )
																CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame13 )
															end
														end
														
														if event.interrupted then
															CodcasterFactionIconAddFrame12( CodcasterFactionIconAdd, event )
															return 
														else
															CodcasterFactionIconAdd:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
															CodcasterFactionIconAdd:setAlpha( 0.68 )
															CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame12 )
														end
													end
													
													if event.interrupted then
														CodcasterFactionIconAddFrame11( CodcasterFactionIconAdd, event )
														return 
													else
														CodcasterFactionIconAdd:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
														CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame11 )
													end
												end
												
												if event.interrupted then
													CodcasterFactionIconAddFrame10( CodcasterFactionIconAdd, event )
													return 
												else
													CodcasterFactionIconAdd:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													CodcasterFactionIconAdd:setAlpha( 1 )
													CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame10 )
												end
											end
											
											if event.interrupted then
												CodcasterFactionIconAddFrame9( CodcasterFactionIconAdd, event )
												return 
											else
												CodcasterFactionIconAdd:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame9 )
											end
										end
										
										if event.interrupted then
											CodcasterFactionIconAddFrame8( CodcasterFactionIconAdd, event )
											return 
										else
											CodcasterFactionIconAdd:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											CodcasterFactionIconAdd:setAlpha( 0.76 )
											CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame8 )
										end
									end
									
									if event.interrupted then
										CodcasterFactionIconAddFrame7( CodcasterFactionIconAdd, event )
										return 
									else
										CodcasterFactionIconAdd:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										CodcasterFactionIconAdd:setAlpha( 1 )
										CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame7 )
									end
								end
								
								if event.interrupted then
									CodcasterFactionIconAddFrame6( CodcasterFactionIconAdd, event )
									return 
								else
									CodcasterFactionIconAdd:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									CodcasterFactionIconAdd:setAlpha( 0.41 )
									CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame6 )
								end
							end
							
							if event.interrupted then
								CodcasterFactionIconAddFrame5( CodcasterFactionIconAdd, event )
								return 
							else
								CodcasterFactionIconAdd:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								CodcasterFactionIconAdd:setAlpha( 0.4 )
								CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame5 )
							end
						end
						
						if event.interrupted then
							CodcasterFactionIconAddFrame4( CodcasterFactionIconAdd, event )
							return 
						else
							CodcasterFactionIconAdd:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							CodcasterFactionIconAdd:setAlpha( 0.87 )
							CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame4 )
						end
					end
					
					if event.interrupted then
						CodcasterFactionIconAddFrame3( CodcasterFactionIconAdd, event )
						return 
					else
						CodcasterFactionIconAdd:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						CodcasterFactionIconAdd:setAlpha( 0.56 )
						CodcasterFactionIconAdd:registerEventHandler( "transition_complete_keyframe", CodcasterFactionIconAddFrame3 )
					end
				end
				
				CodcasterFactionIconAdd:completeAnimation()
				self.CodcasterFactionIconAdd:setAlpha( 0 )
				CodcasterFactionIconAddFrame2( CodcasterFactionIconAdd, {} )
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
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							if not event.interrupted then
								Sound:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							Sound:playSound( "faction_out", controller )
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
							Sound:beginAnimation( "keyframe", 2319, false, false, CoD.TweenType.Linear )
							Sound:playSound( "0", controller )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Sound:playSound( "faction_in", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "0", controller )
				SoundFrame2( Sound, {} )

				PrematchCountdown2xpBadge:completeAnimation()
				self.PrematchCountdown2xpBadge:setAlpha( 0 )
				self.clipFinished( PrematchCountdown2xpBadge, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GlowPanel:close()
		element.PrematchCountdownNumbers:close()
		element.GameTypeHintText:close()
		element.DoubleXPText:close()
		element.FactionName:close()
		element.Glitch:close()
		element.PrematchCountdown2xpBadge:close()
		element.PrematchCountdown2xpWeaponBadge:close()
		element.DoubleLoot:close()
		element.DoubleWeaponXPLabel:close()
		element.FactionIcon0:close()
		element.FactionIcon:close()
		element.CodcasterFactionIcon:close()
		element.CodcasterFactionIconAdd:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

