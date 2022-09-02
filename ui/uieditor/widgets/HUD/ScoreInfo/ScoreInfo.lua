-- 98d4cfcef9b78216f5af7039a8da4ed9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_EnemyScorePanel" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_UserScorePanel" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelTimer" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelCircle" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BackCircleInner" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.StatusContainer" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_Timer" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.RoundsContainer" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.UserScoreContainer" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_EnemyScoreContainer" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_FactionContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "gameScore.gameTimeLow" ), 0 )
end

local PostLoadFunc = function ( f2_arg0 )
	f2_arg0:setupGameTimer()
end

CoD.ScoreInfo = InheritFrom( LUI.UIElement )
CoD.ScoreInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo )
	self.id = "ScoreInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 614 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local EnemyScorePanel = CoD.ScoreInfo_EnemyScorePanel.new( menu, controller )
	EnemyScorePanel:setLeftRight( true, false, 302.06, 461.06 )
	EnemyScorePanel:setTopBottom( true, false, 155.62, 192.62 )
	EnemyScorePanel:setZoom( -10 )
	self:addElement( EnemyScorePanel )
	self.EnemyScorePanel = EnemyScorePanel
	
	local UserScorePanel = CoD.ScoreInfo_UserScorePanel.new( menu, controller )
	UserScorePanel:setLeftRight( true, false, 304.2, 527.2 )
	UserScorePanel:setTopBottom( true, false, 121.12, 166.12 )
	UserScorePanel:setZoom( -10 )
	self:addElement( UserScorePanel )
	self.UserScorePanel = UserScorePanel
	
	local PanelTimer = CoD.ScoreInfo_PanelTimer.new( menu, controller )
	PanelTimer:setLeftRight( true, false, 234.67, 298.67 )
	PanelTimer:setTopBottom( true, false, 77.33, 117.33 )
	PanelTimer:setZoom( -15 )
	PanelTimer:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 ) and not IsModelValueEqualTo( controller, "gameScore.gameTimeLow", 1 )
			end
		},
		{
			stateName = "TimeLow",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 )
			end
		}
	} )
	PanelTimer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeEnd" ), function ( model )
		menu:updateElementState( PanelTimer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeEnd"
		} )
	end )
	PanelTimer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeLow" ), function ( model )
		menu:updateElementState( PanelTimer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeLow"
		} )
	end )
	self:addElement( PanelTimer )
	self.PanelTimer = PanelTimer
	
	local PanelCircle = CoD.ScoreInfo_PanelCircle.new( menu, controller )
	PanelCircle:setLeftRight( true, false, 222.67, 310.67 )
	PanelCircle:setTopBottom( true, false, 104.62, 192.62 )
	PanelCircle:setZoom( -10 )
	self:addElement( PanelCircle )
	self.PanelCircle = PanelCircle
	
	local BackCircleInner = CoD.DamageWidget_BackCircleInner.new( menu, controller )
	BackCircleInner:setLeftRight( true, false, 222.36, 308.99 )
	BackCircleInner:setTopBottom( true, false, 107.31, 190.62 )
	BackCircleInner:setAlpha( 0.2 )
	BackCircleInner:setZoom( -2 )
	BackCircleInner:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BackCircleInner:setShaderVector( 0, 0.1, 1, 0, 0 )
	BackCircleInner:setShaderVector( 1, 0, 0, 0, 0 )
	BackCircleInner:setShaderVector( 2, 0, 0, 0, 0 )
	BackCircleInner:setShaderVector( 3, 0, 0, 0, 0 )
	BackCircleInner:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BackCircleInner )
	self.BackCircleInner = BackCircleInner
	
	local PrimaryStatus = CoD.StatusContainer.new( menu, controller )
	PrimaryStatus:setLeftRight( true, false, 122, 412 )
	PrimaryStatus:setTopBottom( true, false, 192.62, 208.62 )
	PrimaryStatus:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	PrimaryStatus:setShaderVector( 0, 0, 0, 0, 0 )
	PrimaryStatus:setShaderVector( 1, 0, 0, 0, 0 )
	PrimaryStatus:setShaderVector( 2, 0, 0, 0, 0 )
	PrimaryStatus:setShaderVector( 3, 0, 0, 0, 0 )
	PrimaryStatus:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( PrimaryStatus )
	self.PrimaryStatus = PrimaryStatus
	
	local GameTimer = CoD.ScoreInfo_Timer.new( menu, controller )
	GameTimer:setLeftRight( true, false, 194.18, 339.16 )
	GameTimer:setTopBottom( true, false, 93.38, 174.12 )
	GameTimer:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 ) and not IsModelValueEqualTo( controller, "gameScore.gameTimeLow", 1 )
			end
		},
		{
			stateName = "TimeLow",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 )
			end
		}
	} )
	GameTimer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeEnd" ), function ( model )
		menu:updateElementState( GameTimer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeEnd"
		} )
	end )
	GameTimer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeLow" ), function ( model )
		menu:updateElementState( GameTimer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeLow"
		} )
	end )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	local RoundsContainer = CoD.RoundsContainer.new( menu, controller )
	RoundsContainer:setLeftRight( true, false, 301.06, 395.34 )
	RoundsContainer:setTopBottom( true, false, 74.63, 138 )
	RoundsContainer:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSingleRound( controller )
			end
		},
		{
			stateName = "Overtime",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_OVERTIME )
			end
		},
		{
			stateName = "Infected",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "infect" )
			end
		},
		{
			stateName = "RoundBasedNoLimit",
			condition = function ( menu, element, event )
				return not HasRoundLimit( controller )
			end
		},
		{
			stateName = "RoundBasedLimitedRounds",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	RoundsContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_OVERTIME ), function ( model )
		menu:updateElementState( RoundsContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_OVERTIME
		} )
	end )
	self:addElement( RoundsContainer )
	self.RoundsContainer = RoundsContainer
	
	local UserScore = CoD.UserScoreContainer.new( menu, controller )
	UserScore:setLeftRight( true, false, 304.2, 550.2 )
	UserScore:setTopBottom( true, false, 121.12, 166.12 )
	UserScore:setRGB( 0.8, 0.8, 0.8 )
	UserScore:setZoom( 3 )
	UserScore:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	UserScore:setShaderVector( 0, 0, 0, 0, 0 )
	UserScore:setShaderVector( 1, 1, 0, 0, 0 )
	UserScore:setShaderVector( 2, 10, -3, 0, 0 )
	UserScore:setShaderVector( 3, 2, 2, 0, 0 )
	UserScore:setShaderVector( 4, 0, 0, 0, 0 )
	UserScore:subscribeToGlobalModel( controller, "GameScore", nil, function ( model )
		UserScore:setModel( model, controller )
	end )
	self:addElement( UserScore )
	self.UserScore = UserScore
	
	local EnemyScore = CoD.ScoreInfo_EnemyScoreContainer.new( menu, controller )
	EnemyScore:setLeftRight( true, false, 302.06, 492.06 )
	EnemyScore:setTopBottom( true, false, 155.62, 192.62 )
	EnemyScore:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	EnemyScore:setShaderVector( 0, 0, 0, 0, 0 )
	EnemyScore:setShaderVector( 1, 1, 0, 0, 0 )
	EnemyScore:setShaderVector( 2, 5, -4, 0, 0 )
	EnemyScore:setShaderVector( 3, 2, 2, 0, 0 )
	EnemyScore:setShaderVector( 4, 0, 0, 0, 0 )
	EnemyScore:subscribeToGlobalModel( controller, "GameScore", nil, function ( model )
		EnemyScore:setModel( model, controller )
	end )
	self:addElement( EnemyScore )
	self.EnemyScore = EnemyScore
	
	local FactionContainer = CoD.ScoreInfo_FactionContainer.new( menu, controller )
	FactionContainer:setLeftRight( false, false, -75.8, -3.8 )
	FactionContainer:setTopBottom( false, false, -12.71, 59.96 )
	FactionContainer:subscribeToGlobalModel( controller, "Factions", "alliesFactionIcon", function ( model )
		local alliesFactionIcon = Engine.GetModelValue( model )
		if alliesFactionIcon then
			FactionContainer.factionalliesAdd:setImage( RegisterImage( alliesFactionIcon ) )
		end
	end )
	FactionContainer:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local axisFactionIcon = Engine.GetModelValue( model )
		if axisFactionIcon then
			FactionContainer.factionaxisAdd:setImage( RegisterImage( axisFactionIcon ) )
		end
	end )
	self:addElement( FactionContainer )
	self.FactionContainer = FactionContainer
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 305, 309 )
	Dot3:setTopBottom( true, false, 115, 119 )
	Dot3:setAlpha( 0.6 )
	Dot3:setZoom( 5 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot5 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot5:setLeftRight( true, false, 305, 309 )
	Dot5:setTopBottom( true, false, 186, 190 )
	Dot5:setAlpha( 0.6 )
	Dot5:setZoom( 5 )
	self:addElement( Dot5 )
	self.Dot5 = Dot5
	
	local Dot6 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot6:setLeftRight( true, false, 222, 226 )
	Dot6:setTopBottom( true, false, 115, 119 )
	Dot6:setAlpha( 0.6 )
	Dot6:setZoom( 5 )
	self:addElement( Dot6 )
	self.Dot6 = Dot6
	
	local Dot7 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot7:setLeftRight( true, false, 222, 226 )
	Dot7:setTopBottom( true, false, 186, 190 )
	Dot7:setAlpha( 0.6 )
	Dot7:setZoom( 5 )
	self:addElement( Dot7 )
	self.Dot7 = Dot7
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				EnemyScorePanel:completeAnimation()
				self.EnemyScorePanel:setAlpha( 0 )
				self.clipFinished( EnemyScorePanel, {} )

				UserScorePanel:completeAnimation()
				self.UserScorePanel:setAlpha( 0 )
				self.clipFinished( UserScorePanel, {} )

				PanelTimer:completeAnimation()
				self.PanelTimer:setAlpha( 0 )
				self.clipFinished( PanelTimer, {} )

				PanelCircle:completeAnimation()
				self.PanelCircle:setAlpha( 0 )
				self.clipFinished( PanelCircle, {} )

				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0 )
				self.BackCircleInner:setZoom( 10 )
				self.clipFinished( BackCircleInner, {} )

				PrimaryStatus:completeAnimation()
				self.PrimaryStatus:setAlpha( 0 )
				self.clipFinished( PrimaryStatus, {} )

				GameTimer:completeAnimation()

				GameTimer.Semi:completeAnimation()

				GameTimer.Line1:completeAnimation()

				GameTimer.Line2:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.GameTimer.Semi:setAlpha( 0 )
				self.GameTimer.Line1:setAlpha( 0 )
				self.GameTimer.Line2:setAlpha( 0 )
				self.clipFinished( GameTimer, {} )

				RoundsContainer:completeAnimation()
				self.RoundsContainer:setAlpha( 0 )
				self.clipFinished( RoundsContainer, {} )

				UserScore:completeAnimation()
				self.UserScore:setAlpha( 0 )
				self.clipFinished( UserScore, {} )

				EnemyScore:completeAnimation()
				self.EnemyScore:setAlpha( 0 )
				self.clipFinished( EnemyScore, {} )

				FactionContainer:completeAnimation()
				self.FactionContainer:setLeftRight( false, false, -76.33, -4.33 )
				self.FactionContainer:setTopBottom( false, false, -12.71, 59.96 )
				self.FactionContainer:setAlpha( 0 )
				self.clipFinished( FactionContainer, {} )

				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 220, 224 )
				self.Dot3:setTopBottom( true, false, 145, 149 )
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )

				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 220, 224 )
				self.Dot5:setTopBottom( true, false, 144.97, 148.97 )
				self.Dot5:setAlpha( 0 )
				self.clipFinished( Dot5, {} )

				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 222, 226 )
				self.Dot6:setTopBottom( true, false, 145, 149 )
				self.Dot6:setAlpha( 0 )
				self.clipFinished( Dot6, {} )

				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 222, 226 )
				self.Dot7:setTopBottom( true, false, 144.97, 148.97 )
				self.Dot7:setAlpha( 0 )
				self.clipFinished( Dot7, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 15 )

				local EnemyScorePanelFrame2 = function ( EnemyScorePanel, event )
					local EnemyScorePanelFrame3 = function ( EnemyScorePanel, event )
						local EnemyScorePanelFrame4 = function ( EnemyScorePanel, event )
							local EnemyScorePanelFrame5 = function ( EnemyScorePanel, event )
								local EnemyScorePanelFrame6 = function ( EnemyScorePanel, event )
									local EnemyScorePanelFrame7 = function ( EnemyScorePanel, event )
										if not event.interrupted then
											EnemyScorePanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
										end
										EnemyScorePanel:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( EnemyScorePanel, event )
										else
											EnemyScorePanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										EnemyScorePanelFrame7( EnemyScorePanel, event )
										return 
									else
										EnemyScorePanel:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										EnemyScorePanel:setAlpha( 1 )
										EnemyScorePanel:registerEventHandler( "transition_complete_keyframe", EnemyScorePanelFrame7 )
									end
								end
								
								if event.interrupted then
									EnemyScorePanelFrame6( EnemyScorePanel, event )
									return 
								else
									EnemyScorePanel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EnemyScorePanel:setAlpha( 0 )
									EnemyScorePanel:registerEventHandler( "transition_complete_keyframe", EnemyScorePanelFrame6 )
								end
							end
							
							if event.interrupted then
								EnemyScorePanelFrame5( EnemyScorePanel, event )
								return 
							else
								EnemyScorePanel:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								EnemyScorePanel:registerEventHandler( "transition_complete_keyframe", EnemyScorePanelFrame5 )
							end
						end
						
						if event.interrupted then
							EnemyScorePanelFrame4( EnemyScorePanel, event )
							return 
						else
							EnemyScorePanel:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							EnemyScorePanel:setAlpha( 0.5 )
							EnemyScorePanel:registerEventHandler( "transition_complete_keyframe", EnemyScorePanelFrame4 )
						end
					end
					
					if event.interrupted then
						EnemyScorePanelFrame3( EnemyScorePanel, event )
						return 
					else
						EnemyScorePanel:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						EnemyScorePanel:registerEventHandler( "transition_complete_keyframe", EnemyScorePanelFrame3 )
					end
				end
				
				EnemyScorePanel:completeAnimation()
				self.EnemyScorePanel:setAlpha( 0 )
				EnemyScorePanelFrame2( EnemyScorePanel, {} )
				local UserScorePanelFrame2 = function ( UserScorePanel, event )
					local UserScorePanelFrame3 = function ( UserScorePanel, event )
						local UserScorePanelFrame4 = function ( UserScorePanel, event )
							local UserScorePanelFrame5 = function ( UserScorePanel, event )
								local UserScorePanelFrame6 = function ( UserScorePanel, event )
									local UserScorePanelFrame7 = function ( UserScorePanel, event )
										if not event.interrupted then
											UserScorePanel:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
										end
										UserScorePanel:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( UserScorePanel, event )
										else
											UserScorePanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										UserScorePanelFrame7( UserScorePanel, event )
										return 
									else
										UserScorePanel:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										UserScorePanel:setAlpha( 1 )
										UserScorePanel:registerEventHandler( "transition_complete_keyframe", UserScorePanelFrame7 )
									end
								end
								
								if event.interrupted then
									UserScorePanelFrame6( UserScorePanel, event )
									return 
								else
									UserScorePanel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									UserScorePanel:setAlpha( 0 )
									UserScorePanel:registerEventHandler( "transition_complete_keyframe", UserScorePanelFrame6 )
								end
							end
							
							if event.interrupted then
								UserScorePanelFrame5( UserScorePanel, event )
								return 
							else
								UserScorePanel:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								UserScorePanel:registerEventHandler( "transition_complete_keyframe", UserScorePanelFrame5 )
							end
						end
						
						if event.interrupted then
							UserScorePanelFrame4( UserScorePanel, event )
							return 
						else
							UserScorePanel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							UserScorePanel:setAlpha( 0.5 )
							UserScorePanel:registerEventHandler( "transition_complete_keyframe", UserScorePanelFrame4 )
						end
					end
					
					if event.interrupted then
						UserScorePanelFrame3( UserScorePanel, event )
						return 
					else
						UserScorePanel:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						UserScorePanel:registerEventHandler( "transition_complete_keyframe", UserScorePanelFrame3 )
					end
				end
				
				UserScorePanel:completeAnimation()
				self.UserScorePanel:setAlpha( 0 )
				UserScorePanelFrame2( UserScorePanel, {} )
				local PanelTimerFrame2 = function ( PanelTimer, event )
					local PanelTimerFrame3 = function ( PanelTimer, event )
						local PanelTimerFrame4 = function ( PanelTimer, event )
							local PanelTimerFrame5 = function ( PanelTimer, event )
								local PanelTimerFrame6 = function ( PanelTimer, event )
									if not event.interrupted then
										PanelTimer:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									end
									PanelTimer:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( PanelTimer, event )
									else
										PanelTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PanelTimerFrame6( PanelTimer, event )
									return 
								else
									PanelTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PanelTimer:setAlpha( 0 )
									PanelTimer:registerEventHandler( "transition_complete_keyframe", PanelTimerFrame6 )
								end
							end
							
							if event.interrupted then
								PanelTimerFrame5( PanelTimer, event )
								return 
							else
								PanelTimer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								PanelTimer:registerEventHandler( "transition_complete_keyframe", PanelTimerFrame5 )
							end
						end
						
						if event.interrupted then
							PanelTimerFrame4( PanelTimer, event )
							return 
						else
							PanelTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PanelTimer:setAlpha( 0.5 )
							PanelTimer:registerEventHandler( "transition_complete_keyframe", PanelTimerFrame4 )
						end
					end
					
					if event.interrupted then
						PanelTimerFrame3( PanelTimer, event )
						return 
					else
						PanelTimer:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
						PanelTimer:registerEventHandler( "transition_complete_keyframe", PanelTimerFrame3 )
					end
				end
				
				PanelTimer:completeAnimation()
				self.PanelTimer:setAlpha( 0 )
				PanelTimerFrame2( PanelTimer, {} )
				local PanelCircleFrame2 = function ( PanelCircle, event )
					local PanelCircleFrame3 = function ( PanelCircle, event )
						local PanelCircleFrame4 = function ( PanelCircle, event )
							local PanelCircleFrame5 = function ( PanelCircle, event )
								local PanelCircleFrame6 = function ( PanelCircle, event )
									local PanelCircleFrame7 = function ( PanelCircle, event )
										if not event.interrupted then
											PanelCircle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										end
										PanelCircle:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( PanelCircle, event )
										else
											PanelCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										PanelCircleFrame7( PanelCircle, event )
										return 
									else
										PanelCircle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										PanelCircle:setAlpha( 1 )
										PanelCircle:registerEventHandler( "transition_complete_keyframe", PanelCircleFrame7 )
									end
								end
								
								if event.interrupted then
									PanelCircleFrame6( PanelCircle, event )
									return 
								else
									PanelCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PanelCircle:setAlpha( 0 )
									PanelCircle:registerEventHandler( "transition_complete_keyframe", PanelCircleFrame6 )
								end
							end
							
							if event.interrupted then
								PanelCircleFrame5( PanelCircle, event )
								return 
							else
								PanelCircle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								PanelCircle:registerEventHandler( "transition_complete_keyframe", PanelCircleFrame5 )
							end
						end
						
						if event.interrupted then
							PanelCircleFrame4( PanelCircle, event )
							return 
						else
							PanelCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PanelCircle:setAlpha( 0.5 )
							PanelCircle:registerEventHandler( "transition_complete_keyframe", PanelCircleFrame4 )
						end
					end
					
					if event.interrupted then
						PanelCircleFrame3( PanelCircle, event )
						return 
					else
						PanelCircle:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
						PanelCircle:registerEventHandler( "transition_complete_keyframe", PanelCircleFrame3 )
					end
				end
				
				PanelCircle:completeAnimation()
				self.PanelCircle:setAlpha( 0 )
				PanelCircleFrame2( PanelCircle, {} )
				local BackCircleInnerFrame2 = function ( BackCircleInner, event )
					local BackCircleInnerFrame3 = function ( BackCircleInner, event )
						local BackCircleInnerFrame4 = function ( BackCircleInner, event )
							local BackCircleInnerFrame5 = function ( BackCircleInner, event )
								local BackCircleInnerFrame6 = function ( BackCircleInner, event )
									local BackCircleInnerFrame7 = function ( BackCircleInner, event )
										local BackCircleInnerFrame8 = function ( BackCircleInner, event )
											local BackCircleInnerFrame9 = function ( BackCircleInner, event )
												local BackCircleInnerFrame10 = function ( BackCircleInner, event )
													local BackCircleInnerFrame11 = function ( BackCircleInner, event )
														local BackCircleInnerFrame12 = function ( BackCircleInner, event )
															if not event.interrupted then
																BackCircleInner:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
															end
															BackCircleInner:setAlpha( 0.2 )
															BackCircleInner:setZoom( -2 )
															if event.interrupted then
																self.clipFinished( BackCircleInner, event )
															else
																BackCircleInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															BackCircleInnerFrame12( BackCircleInner, event )
															return 
														else
															BackCircleInner:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															BackCircleInner:setAlpha( 0.2 )
															BackCircleInner:setZoom( -2 )
															BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame12 )
														end
													end
													
													if event.interrupted then
														BackCircleInnerFrame11( BackCircleInner, event )
														return 
													else
														BackCircleInner:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														BackCircleInner:setZoom( -1.08 )
														BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleInnerFrame10( BackCircleInner, event )
													return 
												else
													BackCircleInner:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													BackCircleInner:setAlpha( 0 )
													BackCircleInner:setZoom( 0.77 )
													BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleInnerFrame9( BackCircleInner, event )
												return 
											else
												BackCircleInner:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												BackCircleInner:setZoom( 1.69 )
												BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleInnerFrame8( BackCircleInner, event )
											return 
										else
											BackCircleInner:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											BackCircleInner:setAlpha( 0.2 )
											BackCircleInner:setZoom( 3.54 )
											BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleInnerFrame7( BackCircleInner, event )
										return 
									else
										BackCircleInner:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										BackCircleInner:setZoom( 4.46 )
										BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleInnerFrame6( BackCircleInner, event )
									return 
								else
									BackCircleInner:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BackCircleInner:setAlpha( 0 )
									BackCircleInner:setZoom( 6.31 )
									BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleInnerFrame5( BackCircleInner, event )
								return 
							else
								BackCircleInner:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								BackCircleInner:setZoom( 7.23 )
								BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleInnerFrame4( BackCircleInner, event )
							return 
						else
							BackCircleInner:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircleInner:setAlpha( 0.2 )
							BackCircleInner:setZoom( 9.08 )
							BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleInnerFrame3( BackCircleInner, event )
						return 
					else
						BackCircleInner:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame3 )
					end
				end
				
				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0 )
				self.BackCircleInner:setZoom( 10 )
				BackCircleInnerFrame2( BackCircleInner, {} )
				local PrimaryStatusFrame2 = function ( PrimaryStatus, event )
					local PrimaryStatusFrame3 = function ( PrimaryStatus, event )
						local PrimaryStatusFrame4 = function ( PrimaryStatus, event )
							local PrimaryStatusFrame5 = function ( PrimaryStatus, event )
								local PrimaryStatusFrame6 = function ( PrimaryStatus, event )
									local PrimaryStatusFrame7 = function ( PrimaryStatus, event )
										local PrimaryStatusFrame8 = function ( PrimaryStatus, event )
											local PrimaryStatusFrame9 = function ( PrimaryStatus, event )
												local PrimaryStatusFrame10 = function ( PrimaryStatus, event )
													local PrimaryStatusFrame11 = function ( PrimaryStatus, event )
														local PrimaryStatusFrame12 = function ( PrimaryStatus, event )
															if not event.interrupted then
																PrimaryStatus:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
															end
															PrimaryStatus:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( PrimaryStatus, event )
															else
																PrimaryStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															PrimaryStatusFrame12( PrimaryStatus, event )
															return 
														else
															PrimaryStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															PrimaryStatus:setAlpha( 1 )
															PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame12 )
														end
													end
													
													if event.interrupted then
														PrimaryStatusFrame11( PrimaryStatus, event )
														return 
													else
														PrimaryStatus:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame11 )
													end
												end
												
												if event.interrupted then
													PrimaryStatusFrame10( PrimaryStatus, event )
													return 
												else
													PrimaryStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PrimaryStatus:setAlpha( 0 )
													PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame10 )
												end
											end
											
											if event.interrupted then
												PrimaryStatusFrame9( PrimaryStatus, event )
												return 
											else
												PrimaryStatus:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame9 )
											end
										end
										
										if event.interrupted then
											PrimaryStatusFrame8( PrimaryStatus, event )
											return 
										else
											PrimaryStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											PrimaryStatus:setAlpha( 1 )
											PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame8 )
										end
									end
									
									if event.interrupted then
										PrimaryStatusFrame7( PrimaryStatus, event )
										return 
									else
										PrimaryStatus:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame7 )
									end
								end
								
								if event.interrupted then
									PrimaryStatusFrame6( PrimaryStatus, event )
									return 
								else
									PrimaryStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PrimaryStatus:setAlpha( 0 )
									PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame6 )
								end
							end
							
							if event.interrupted then
								PrimaryStatusFrame5( PrimaryStatus, event )
								return 
							else
								PrimaryStatus:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame5 )
							end
						end
						
						if event.interrupted then
							PrimaryStatusFrame4( PrimaryStatus, event )
							return 
						else
							PrimaryStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PrimaryStatus:setAlpha( 1 )
							PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame4 )
						end
					end
					
					if event.interrupted then
						PrimaryStatusFrame3( PrimaryStatus, event )
						return 
					else
						PrimaryStatus:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame3 )
					end
				end
				
				PrimaryStatus:completeAnimation()
				self.PrimaryStatus:setAlpha( 0 )
				PrimaryStatusFrame2( PrimaryStatus, {} )
				local GameTimerFrame2 = function ( GameTimer, event )
					local GameTimerFrame3 = function ( GameTimer, event )
						local GameTimerFrame4 = function ( GameTimer, event )
							local GameTimerFrame5 = function ( GameTimer, event )
								local GameTimerFrame6 = function ( GameTimer, event )
									local GameTimerFrame7 = function ( GameTimer, event )
										local GameTimerFrame8 = function ( GameTimer, event )
											local GameTimerFrame9 = function ( GameTimer, event )
												local GameTimerFrame10 = function ( GameTimer, event )
													local GameTimerFrame11 = function ( GameTimer, event )
														local GameTimerFrame12 = function ( GameTimer, event )
															local GameTimerFrame13 = function ( GameTimer, event )
																local GameTimerFrame14 = function ( GameTimer, event )
																	local GameTimerFrame15 = function ( GameTimer, event )
																		local GameTimerFrame16 = function ( GameTimer, event )
																			local GameTimerFrame17 = function ( GameTimer, event )
																				local GameTimerFrame18 = function ( GameTimer, event )
																					local GameTimerFrame19 = function ( GameTimer, event )
																						local GameTimerFrame20 = function ( GameTimer, event )
																							local GameTimerFrame21 = function ( GameTimer, event )
																								local GameTimerFrame22 = function ( GameTimer, event )
																									local GameTimerFrame23 = function ( GameTimer, event )
																										local GameTimerFrame24 = function ( GameTimer, event )
																											local GameTimerFrame25 = function ( GameTimer, event )
																												local GameTimerFrame26 = function ( GameTimer, event )
																													local GameTimerFrame27 = function ( GameTimer, event )
																														local GameTimerFrame28 = function ( GameTimer, event )
																															local GameTimerFrame29 = function ( GameTimer, event )
																																local GameTimerFrame30 = function ( GameTimer, event )
																																	local GameTimerFrame31 = function ( GameTimer, event )
																																		local GameTimerFrame32 = function ( GameTimer, event )
																																			local GameTimerFrame33 = function ( GameTimer, event )
																																				local GameTimerFrame34 = function ( GameTimer, event )
																																					local GameTimerFrame35 = function ( GameTimer, event )
																																						local GameTimerFrame36 = function ( GameTimer, event )
																																							if not event.interrupted then
																																								GameTimer:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
																																								GameTimer.Semi:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Linear )
																																								GameTimer.Line1:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Linear )
																																								GameTimer.Line2:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Linear )
																																							end
																																							GameTimer:setAlpha( 1 )
																																							GameTimer.Semi:setAlpha( 0.6 )
																																							GameTimer.Line1:setAlpha( 0.8 )
																																							GameTimer.Line2:setAlpha( 0.8 )
																																							if event.interrupted then
																																								self.clipFinished( GameTimer, event )
																																							else
																																								GameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							GameTimerFrame36( GameTimer, event )
																																							return 
																																						else
																																							GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							GameTimer.Line2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							GameTimer.Line2:setAlpha( 0.8 )
																																							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						GameTimerFrame35( GameTimer, event )
																																						return 
																																					else
																																						GameTimer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					GameTimerFrame34( GameTimer, event )
																																					return 
																																				else
																																					GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					GameTimer.Line2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					GameTimer.Line2:setAlpha( 0 )
																																					GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				GameTimerFrame33( GameTimer, event )
																																				return 
																																			else
																																				GameTimer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																				GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			GameTimerFrame32( GameTimer, event )
																																			return 
																																		else
																																			GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			GameTimer.Line2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			GameTimer.Line2:setAlpha( 0.8 )
																																			GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		GameTimerFrame31( GameTimer, event )
																																		return 
																																	else
																																		GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																		GameTimer.Line1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																		GameTimer.Line1:setAlpha( 0.8 )
																																		GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	GameTimerFrame30( GameTimer, event )
																																	return 
																																else
																																	GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																	GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																GameTimerFrame29( GameTimer, event )
																																return 
																															else
																																GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																GameTimer.Line2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																GameTimer.Line2:setAlpha( 0 )
																																GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															GameTimerFrame28( GameTimer, event )
																															return 
																														else
																															GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															GameTimer.Line1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															GameTimer.Line1:setAlpha( 0 )
																															GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														GameTimerFrame27( GameTimer, event )
																														return 
																													else
																														GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																														GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													GameTimerFrame26( GameTimer, event )
																													return 
																												else
																													GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													GameTimer.Line2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																													GameTimer.Line2:setAlpha( 0.8 )
																													GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												GameTimerFrame25( GameTimer, event )
																												return 
																											else
																												GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												GameTimer.Line1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												GameTimer.Line1:setAlpha( 0.8 )
																												GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											GameTimerFrame24( GameTimer, event )
																											return 
																										else
																											GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											GameTimer.Semi:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											GameTimer.Semi:setAlpha( 0.6 )
																											GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										GameTimerFrame23( GameTimer, event )
																										return 
																									else
																										GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									GameTimerFrame22( GameTimer, event )
																									return 
																								else
																									GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																									GameTimer.Line1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																									GameTimer.Line1:setAlpha( 0 )
																									GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								GameTimerFrame21( GameTimer, event )
																								return 
																							else
																								GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								GameTimer.Semi:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								GameTimer.Semi:setAlpha( 0 )
																								GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							GameTimerFrame20( GameTimer, event )
																							return 
																						else
																							GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						GameTimerFrame19( GameTimer, event )
																						return 
																					else
																						GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						GameTimer.Line1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																						GameTimer.Line1:setAlpha( 0.8 )
																						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					GameTimerFrame18( GameTimer, event )
																					return 
																				else
																					GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					GameTimer.Semi:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					GameTimer.Semi:setAlpha( 0.6 )
																					GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				GameTimerFrame17( GameTimer, event )
																				return 
																			else
																				GameTimer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																				GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GameTimerFrame16( GameTimer, event )
																			return 
																		else
																			GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			GameTimer.Semi:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																			GameTimer.Semi:setAlpha( 0 )
																			GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GameTimerFrame15( GameTimer, event )
																		return 
																	else
																		GameTimer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																		GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame15 )
																	end
																end
																
																if event.interrupted then
																	GameTimerFrame14( GameTimer, event )
																	return 
																else
																	GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	GameTimer.Semi:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	GameTimer.Semi:setAlpha( 0.6 )
																	GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame14 )
																end
															end
															
															if event.interrupted then
																GameTimerFrame13( GameTimer, event )
																return 
															else
																GameTimer:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame13 )
															end
														end
														
														if event.interrupted then
															GameTimerFrame12( GameTimer, event )
															return 
														else
															GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															GameTimer:setAlpha( 1 )
															GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame12 )
														end
													end
													
													if event.interrupted then
														GameTimerFrame11( GameTimer, event )
														return 
													else
														GameTimer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame11 )
													end
												end
												
												if event.interrupted then
													GameTimerFrame10( GameTimer, event )
													return 
												else
													GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													GameTimer:setAlpha( 0 )
													GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame10 )
												end
											end
											
											if event.interrupted then
												GameTimerFrame9( GameTimer, event )
												return 
											else
												GameTimer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame9 )
											end
										end
										
										if event.interrupted then
											GameTimerFrame8( GameTimer, event )
											return 
										else
											GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											GameTimer:setAlpha( 1 )
											GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame8 )
										end
									end
									
									if event.interrupted then
										GameTimerFrame7( GameTimer, event )
										return 
									else
										GameTimer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame7 )
									end
								end
								
								if event.interrupted then
									GameTimerFrame6( GameTimer, event )
									return 
								else
									GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									GameTimer:setAlpha( 0 )
									GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame6 )
								end
							end
							
							if event.interrupted then
								GameTimerFrame5( GameTimer, event )
								return 
							else
								GameTimer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame5 )
							end
						end
						
						if event.interrupted then
							GameTimerFrame4( GameTimer, event )
							return 
						else
							GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							GameTimer:setAlpha( 1 )
							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame4 )
						end
					end
					
					if event.interrupted then
						GameTimerFrame3( GameTimer, event )
						return 
					else
						GameTimer:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame3 )
					end
				end
				
				GameTimer:completeAnimation()

				GameTimer.Semi:completeAnimation()

				GameTimer.Line1:completeAnimation()

				GameTimer.Line2:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.GameTimer.Semi:setAlpha( 0 )
				self.GameTimer.Line1:setAlpha( 0 )
				self.GameTimer.Line2:setAlpha( 0 )
				GameTimerFrame2( GameTimer, {} )
				local RoundsContainerFrame2 = function ( RoundsContainer, event )
					local RoundsContainerFrame3 = function ( RoundsContainer, event )
						local RoundsContainerFrame4 = function ( RoundsContainer, event )
							local RoundsContainerFrame5 = function ( RoundsContainer, event )
								local RoundsContainerFrame6 = function ( RoundsContainer, event )
									local RoundsContainerFrame7 = function ( RoundsContainer, event )
										local RoundsContainerFrame8 = function ( RoundsContainer, event )
											local RoundsContainerFrame9 = function ( RoundsContainer, event )
												local RoundsContainerFrame10 = function ( RoundsContainer, event )
													local RoundsContainerFrame11 = function ( RoundsContainer, event )
														local RoundsContainerFrame12 = function ( RoundsContainer, event )
															if not event.interrupted then
																RoundsContainer:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
															end
															RoundsContainer:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( RoundsContainer, event )
															else
																RoundsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															RoundsContainerFrame12( RoundsContainer, event )
															return 
														else
															RoundsContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															RoundsContainer:setAlpha( 1 )
															RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame12 )
														end
													end
													
													if event.interrupted then
														RoundsContainerFrame11( RoundsContainer, event )
														return 
													else
														RoundsContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame11 )
													end
												end
												
												if event.interrupted then
													RoundsContainerFrame10( RoundsContainer, event )
													return 
												else
													RoundsContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													RoundsContainer:setAlpha( 0.2 )
													RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame10 )
												end
											end
											
											if event.interrupted then
												RoundsContainerFrame9( RoundsContainer, event )
												return 
											else
												RoundsContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame9 )
											end
										end
										
										if event.interrupted then
											RoundsContainerFrame8( RoundsContainer, event )
											return 
										else
											RoundsContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											RoundsContainer:setAlpha( 1 )
											RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame8 )
										end
									end
									
									if event.interrupted then
										RoundsContainerFrame7( RoundsContainer, event )
										return 
									else
										RoundsContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame7 )
									end
								end
								
								if event.interrupted then
									RoundsContainerFrame6( RoundsContainer, event )
									return 
								else
									RoundsContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									RoundsContainer:setAlpha( 0 )
									RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame6 )
								end
							end
							
							if event.interrupted then
								RoundsContainerFrame5( RoundsContainer, event )
								return 
							else
								RoundsContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame5 )
							end
						end
						
						if event.interrupted then
							RoundsContainerFrame4( RoundsContainer, event )
							return 
						else
							RoundsContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							RoundsContainer:setAlpha( 1 )
							RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame4 )
						end
					end
					
					if event.interrupted then
						RoundsContainerFrame3( RoundsContainer, event )
						return 
					else
						RoundsContainer:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
						RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame3 )
					end
				end
				
				RoundsContainer:completeAnimation()
				self.RoundsContainer:setAlpha( 0 )
				RoundsContainerFrame2( RoundsContainer, {} )
				local UserScoreFrame2 = function ( UserScore, event )
					local UserScoreFrame3 = function ( UserScore, event )
						local UserScoreFrame4 = function ( UserScore, event )
							local UserScoreFrame5 = function ( UserScore, event )
								local UserScoreFrame6 = function ( UserScore, event )
									local UserScoreFrame7 = function ( UserScore, event )
										local UserScoreFrame8 = function ( UserScore, event )
											local UserScoreFrame9 = function ( UserScore, event )
												local UserScoreFrame10 = function ( UserScore, event )
													local UserScoreFrame11 = function ( UserScore, event )
														local UserScoreFrame12 = function ( UserScore, event )
															if not event.interrupted then
																UserScore:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
															end
															UserScore:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( UserScore, event )
															else
																UserScore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															UserScoreFrame12( UserScore, event )
															return 
														else
															UserScore:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															UserScore:setAlpha( 1 )
															UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame12 )
														end
													end
													
													if event.interrupted then
														UserScoreFrame11( UserScore, event )
														return 
													else
														UserScore:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame11 )
													end
												end
												
												if event.interrupted then
													UserScoreFrame10( UserScore, event )
													return 
												else
													UserScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													UserScore:setAlpha( 0.2 )
													UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame10 )
												end
											end
											
											if event.interrupted then
												UserScoreFrame9( UserScore, event )
												return 
											else
												UserScore:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame9 )
											end
										end
										
										if event.interrupted then
											UserScoreFrame8( UserScore, event )
											return 
										else
											UserScore:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											UserScore:setAlpha( 1 )
											UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame8 )
										end
									end
									
									if event.interrupted then
										UserScoreFrame7( UserScore, event )
										return 
									else
										UserScore:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame7 )
									end
								end
								
								if event.interrupted then
									UserScoreFrame6( UserScore, event )
									return 
								else
									UserScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									UserScore:setAlpha( 0 )
									UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame6 )
								end
							end
							
							if event.interrupted then
								UserScoreFrame5( UserScore, event )
								return 
							else
								UserScore:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame5 )
							end
						end
						
						if event.interrupted then
							UserScoreFrame4( UserScore, event )
							return 
						else
							UserScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							UserScore:setAlpha( 0.5 )
							UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame4 )
						end
					end
					
					if event.interrupted then
						UserScoreFrame3( UserScore, event )
						return 
					else
						UserScore:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame3 )
					end
				end
				
				UserScore:completeAnimation()
				self.UserScore:setAlpha( 0 )
				UserScoreFrame2( UserScore, {} )
				local EnemyScoreFrame2 = function ( EnemyScore, event )
					local EnemyScoreFrame3 = function ( EnemyScore, event )
						local EnemyScoreFrame4 = function ( EnemyScore, event )
							local EnemyScoreFrame5 = function ( EnemyScore, event )
								local EnemyScoreFrame6 = function ( EnemyScore, event )
									local EnemyScoreFrame7 = function ( EnemyScore, event )
										local EnemyScoreFrame8 = function ( EnemyScore, event )
											local EnemyScoreFrame9 = function ( EnemyScore, event )
												local EnemyScoreFrame10 = function ( EnemyScore, event )
													local EnemyScoreFrame11 = function ( EnemyScore, event )
														local EnemyScoreFrame12 = function ( EnemyScore, event )
															if not event.interrupted then
																EnemyScore:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
															end
															EnemyScore:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( EnemyScore, event )
															else
																EnemyScore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															EnemyScoreFrame12( EnemyScore, event )
															return 
														else
															EnemyScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															EnemyScore:setAlpha( 1 )
															EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame12 )
														end
													end
													
													if event.interrupted then
														EnemyScoreFrame11( EnemyScore, event )
														return 
													else
														EnemyScore:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame11 )
													end
												end
												
												if event.interrupted then
													EnemyScoreFrame10( EnemyScore, event )
													return 
												else
													EnemyScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EnemyScore:setAlpha( 0 )
													EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame10 )
												end
											end
											
											if event.interrupted then
												EnemyScoreFrame9( EnemyScore, event )
												return 
											else
												EnemyScore:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame9 )
											end
										end
										
										if event.interrupted then
											EnemyScoreFrame8( EnemyScore, event )
											return 
										else
											EnemyScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EnemyScore:setAlpha( 1 )
											EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame8 )
										end
									end
									
									if event.interrupted then
										EnemyScoreFrame7( EnemyScore, event )
										return 
									else
										EnemyScore:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame7 )
									end
								end
								
								if event.interrupted then
									EnemyScoreFrame6( EnemyScore, event )
									return 
								else
									EnemyScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EnemyScore:setAlpha( 0 )
									EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame6 )
								end
							end
							
							if event.interrupted then
								EnemyScoreFrame5( EnemyScore, event )
								return 
							else
								EnemyScore:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame5 )
							end
						end
						
						if event.interrupted then
							EnemyScoreFrame4( EnemyScore, event )
							return 
						else
							EnemyScore:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EnemyScore:setAlpha( 0.5 )
							EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame4 )
						end
					end
					
					if event.interrupted then
						EnemyScoreFrame3( EnemyScore, event )
						return 
					else
						EnemyScore:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
						EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame3 )
					end
				end
				
				EnemyScore:completeAnimation()
				self.EnemyScore:setAlpha( 0 )
				EnemyScoreFrame2( EnemyScore, {} )
				local FactionContainerFrame2 = function ( FactionContainer, event )
					local FactionContainerFrame3 = function ( FactionContainer, event )
						if not event.interrupted then
							FactionContainer:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Bounce )
						end
						FactionContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FactionContainer, event )
						else
							FactionContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FactionContainerFrame3( FactionContainer, event )
						return 
					else
						FactionContainer:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						FactionContainer:registerEventHandler( "transition_complete_keyframe", FactionContainerFrame3 )
					end
				end
				
				FactionContainer:completeAnimation()
				self.FactionContainer:setAlpha( 0 )
				FactionContainerFrame2( FactionContainer, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							if not event.interrupted then
								Dot3:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							end
							Dot3:setLeftRight( true, false, 305, 309 )
							Dot3:setTopBottom( true, false, 115, 119 )
							Dot3:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot3, event )
							else
								Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 610, false, true, CoD.TweenType.Back )
							Dot3:setLeftRight( true, false, 305, 309 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot3:setTopBottom( true, false, 115, 119 )
						Dot3:setAlpha( 0.6 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 220, 224 )
				self.Dot3:setTopBottom( true, false, 145, 149 )
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot5Frame2 = function ( Dot5, event )
					local Dot5Frame3 = function ( Dot5, event )
						local Dot5Frame4 = function ( Dot5, event )
							if not event.interrupted then
								Dot5:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							end
							Dot5:setLeftRight( true, false, 305, 309 )
							Dot5:setTopBottom( true, false, 186, 190 )
							Dot5:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot5, event )
							else
								Dot5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot5Frame4( Dot5, event )
							return 
						else
							Dot5:beginAnimation( "keyframe", 610, false, true, CoD.TweenType.Back )
							Dot5:setLeftRight( true, false, 305, 309 )
							Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame4 )
						end
					end
					
					if event.interrupted then
						Dot5Frame3( Dot5, event )
						return 
					else
						Dot5:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot5:setTopBottom( true, false, 186, 190 )
						Dot5:setAlpha( 0.6 )
						Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame3 )
					end
				end
				
				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 220, 224 )
				self.Dot5:setTopBottom( true, false, 144.97, 148.97 )
				self.Dot5:setAlpha( 0 )
				Dot5Frame2( Dot5, {} )
				local Dot6Frame2 = function ( Dot6, event )
					local Dot6Frame3 = function ( Dot6, event )
						if not event.interrupted then
							Dot6:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						end
						Dot6:setLeftRight( true, false, 222, 226 )
						Dot6:setTopBottom( true, false, 115, 119 )
						Dot6:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot6, event )
						else
							Dot6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot6Frame3( Dot6, event )
						return 
					else
						Dot6:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot6:setTopBottom( true, false, 115, 119 )
						Dot6:setAlpha( 0.6 )
						Dot6:registerEventHandler( "transition_complete_keyframe", Dot6Frame3 )
					end
				end
				
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 222, 226 )
				self.Dot6:setTopBottom( true, false, 145, 149 )
				self.Dot6:setAlpha( 0 )
				Dot6Frame2( Dot6, {} )
				local Dot7Frame2 = function ( Dot7, event )
					local Dot7Frame3 = function ( Dot7, event )
						if not event.interrupted then
							Dot7:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						end
						Dot7:setLeftRight( true, false, 222, 226 )
						Dot7:setTopBottom( true, false, 186, 190 )
						Dot7:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot7, event )
						else
							Dot7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot7Frame3( Dot7, event )
						return 
					else
						Dot7:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot7:setTopBottom( true, false, 186, 190 )
						Dot7:setAlpha( 0.6 )
						Dot7:registerEventHandler( "transition_complete_keyframe", Dot7Frame3 )
					end
				end
				
				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 222, 226 )
				self.Dot7:setTopBottom( true, false, 144.97, 148.97 )
				self.Dot7:setAlpha( 0 )
				Dot7Frame2( Dot7, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				EnemyScorePanel:completeAnimation()
				self.EnemyScorePanel:setAlpha( 1 )
				self.clipFinished( EnemyScorePanel, {} )

				UserScorePanel:completeAnimation()
				self.UserScorePanel:setAlpha( 1 )
				self.clipFinished( UserScorePanel, {} )

				PanelTimer:completeAnimation()
				self.PanelTimer:setAlpha( 1 )
				self.clipFinished( PanelTimer, {} )

				PanelCircle:completeAnimation()
				self.PanelCircle:setAlpha( 1 )
				self.clipFinished( PanelCircle, {} )

				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0.2 )
				self.BackCircleInner:setZoom( -2 )
				self.clipFinished( BackCircleInner, {} )

				PrimaryStatus:completeAnimation()
				self.PrimaryStatus:setAlpha( 1 )
				self.clipFinished( PrimaryStatus, {} )

				GameTimer:completeAnimation()

				GameTimer.Semi:completeAnimation()

				GameTimer.Line1:completeAnimation()

				GameTimer.Line2:completeAnimation()
				self.GameTimer:setAlpha( 1 )
				self.GameTimer.Semi:setAlpha( 0.6 )
				self.GameTimer.Line1:setAlpha( 0.8 )
				self.GameTimer.Line2:setAlpha( 0.8 )
				self.clipFinished( GameTimer, {} )

				RoundsContainer:completeAnimation()
				self.RoundsContainer:setAlpha( 1 )
				self.clipFinished( RoundsContainer, {} )

				UserScore:completeAnimation()
				self.UserScore:setAlpha( 1 )
				self.clipFinished( UserScore, {} )

				EnemyScore:completeAnimation()
				self.EnemyScore:setAlpha( 1 )
				self.clipFinished( EnemyScore, {} )

				FactionContainer:completeAnimation()
				self.FactionContainer:setAlpha( 1 )
				self.clipFinished( FactionContainer, {} )

				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 305, 309 )
				self.Dot3:setTopBottom( true, false, 115, 119 )
				self.Dot3:setAlpha( 0.6 )
				self.clipFinished( Dot3, {} )

				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 305, 309 )
				self.Dot5:setTopBottom( true, false, 186, 190 )
				self.Dot5:setAlpha( 0.6 )
				self.clipFinished( Dot5, {} )

				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 222, 226 )
				self.Dot6:setTopBottom( true, false, 115, 119 )
				self.Dot6:setAlpha( 0.6 )
				self.clipFinished( Dot6, {} )

				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 222, 226 )
				self.Dot7:setTopBottom( true, false, 186, 190 )
				self.Dot7:setAlpha( 0.6 )
				self.clipFinished( Dot7, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 15 )

				local EnemyScorePanelFrame2 = function ( EnemyScorePanel, event )
					if not event.interrupted then
						EnemyScorePanel:beginAnimation( "keyframe", 349, true, false, CoD.TweenType.Bounce )
					end
					EnemyScorePanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EnemyScorePanel, event )
					else
						EnemyScorePanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EnemyScorePanel:completeAnimation()
				self.EnemyScorePanel:setAlpha( 1 )
				EnemyScorePanelFrame2( EnemyScorePanel, {} )
				local UserScorePanelFrame2 = function ( UserScorePanel, event )
					if not event.interrupted then
						UserScorePanel:beginAnimation( "keyframe", 349, true, false, CoD.TweenType.Bounce )
					end
					UserScorePanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UserScorePanel, event )
					else
						UserScorePanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UserScorePanel:completeAnimation()
				self.UserScorePanel:setAlpha( 1 )
				UserScorePanelFrame2( UserScorePanel, {} )
				local PanelTimerFrame2 = function ( PanelTimer, event )
					local PanelTimerFrame3 = function ( PanelTimer, event )
						if not event.interrupted then
							PanelTimer:beginAnimation( "keyframe", 239, true, false, CoD.TweenType.Bounce )
						end
						PanelTimer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelTimer, event )
						else
							PanelTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelTimerFrame3( PanelTimer, event )
						return 
					else
						PanelTimer:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						PanelTimer:registerEventHandler( "transition_complete_keyframe", PanelTimerFrame3 )
					end
				end
				
				PanelTimer:completeAnimation()
				self.PanelTimer:setAlpha( 1 )
				PanelTimerFrame2( PanelTimer, {} )
				local PanelCircleFrame2 = function ( PanelCircle, event )
					local PanelCircleFrame3 = function ( PanelCircle, event )
						if not event.interrupted then
							PanelCircle:beginAnimation( "keyframe", 259, true, false, CoD.TweenType.Bounce )
						end
						PanelCircle:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelCircle, event )
						else
							PanelCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelCircleFrame3( PanelCircle, event )
						return 
					else
						PanelCircle:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						PanelCircle:registerEventHandler( "transition_complete_keyframe", PanelCircleFrame3 )
					end
				end
				
				PanelCircle:completeAnimation()
				self.PanelCircle:setAlpha( 1 )
				PanelCircleFrame2( PanelCircle, {} )
				local BackCircleInnerFrame2 = function ( BackCircleInner, event )
					if not event.interrupted then
						BackCircleInner:beginAnimation( "keyframe", 349, true, false, CoD.TweenType.Bounce )
					end
					BackCircleInner:setAlpha( 0 )
					BackCircleInner:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( BackCircleInner, event )
					else
						BackCircleInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0.2 )
				self.BackCircleInner:setZoom( -2 )
				BackCircleInnerFrame2( BackCircleInner, {} )
				local PrimaryStatusFrame2 = function ( PrimaryStatus, event )
					local PrimaryStatusFrame3 = function ( PrimaryStatus, event )
						if not event.interrupted then
							PrimaryStatus:beginAnimation( "keyframe", 230, true, false, CoD.TweenType.Bounce )
						end
						PrimaryStatus:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PrimaryStatus, event )
						else
							PrimaryStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PrimaryStatusFrame3( PrimaryStatus, event )
						return 
					else
						PrimaryStatus:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						PrimaryStatus:registerEventHandler( "transition_complete_keyframe", PrimaryStatusFrame3 )
					end
				end
				
				PrimaryStatus:completeAnimation()
				self.PrimaryStatus:setAlpha( 1 )
				PrimaryStatusFrame2( PrimaryStatus, {} )
				local GameTimerFrame2 = function ( GameTimer, event )
					local GameTimerFrame3 = function ( GameTimer, event )
						if not event.interrupted then
							GameTimer:beginAnimation( "keyframe", 269, true, false, CoD.TweenType.Bounce )
							GameTimer.Semi:beginAnimation( "subkeyframe", 269, true, false, CoD.TweenType.Bounce )
							GameTimer.Line1:beginAnimation( "subkeyframe", 269, true, false, CoD.TweenType.Bounce )
							GameTimer.Line2:beginAnimation( "subkeyframe", 269, true, false, CoD.TweenType.Bounce )
						end
						GameTimer:setAlpha( 0 )
						GameTimer.Semi:setAlpha( 0 )
						GameTimer.Line1:setAlpha( 0 )
						GameTimer.Line2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GameTimer, event )
						else
							GameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GameTimerFrame3( GameTimer, event )
						return 
					else
						GameTimer:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame3 )
					end
				end
				
				GameTimer:completeAnimation()

				GameTimer.Semi:completeAnimation()

				GameTimer.Line1:completeAnimation()

				GameTimer.Line2:completeAnimation()
				self.GameTimer:setAlpha( 1 )
				self.GameTimer.Semi:setAlpha( 0.6 )
				self.GameTimer.Line1:setAlpha( 0.8 )
				self.GameTimer.Line2:setAlpha( 0.8 )
				GameTimerFrame2( GameTimer, {} )
				local RoundsContainerFrame2 = function ( RoundsContainer, event )
					local RoundsContainerFrame3 = function ( RoundsContainer, event )
						if not event.interrupted then
							RoundsContainer:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Bounce )
						end
						RoundsContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( RoundsContainer, event )
						else
							RoundsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RoundsContainerFrame3( RoundsContainer, event )
						return 
					else
						RoundsContainer:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						RoundsContainer:registerEventHandler( "transition_complete_keyframe", RoundsContainerFrame3 )
					end
				end
				
				RoundsContainer:completeAnimation()
				self.RoundsContainer:setAlpha( 1 )
				RoundsContainerFrame2( RoundsContainer, {} )
				local UserScoreFrame2 = function ( UserScore, event )
					local UserScoreFrame3 = function ( UserScore, event )
						if not event.interrupted then
							UserScore:beginAnimation( "keyframe", 260, true, false, CoD.TweenType.Bounce )
						end
						UserScore:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( UserScore, event )
						else
							UserScore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UserScoreFrame3( UserScore, event )
						return 
					else
						UserScore:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						UserScore:registerEventHandler( "transition_complete_keyframe", UserScoreFrame3 )
					end
				end
				
				UserScore:completeAnimation()
				self.UserScore:setAlpha( 1 )
				UserScoreFrame2( UserScore, {} )
				local EnemyScoreFrame2 = function ( EnemyScore, event )
					local EnemyScoreFrame3 = function ( EnemyScore, event )
						if not event.interrupted then
							EnemyScore:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Bounce )
						end
						EnemyScore:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( EnemyScore, event )
						else
							EnemyScore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EnemyScoreFrame3( EnemyScore, event )
						return 
					else
						EnemyScore:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						EnemyScore:registerEventHandler( "transition_complete_keyframe", EnemyScoreFrame3 )
					end
				end
				
				EnemyScore:completeAnimation()
				self.EnemyScore:setAlpha( 1 )
				EnemyScoreFrame2( EnemyScore, {} )
				local FactionContainerFrame2 = function ( FactionContainer, event )
					if not event.interrupted then
						FactionContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FactionContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FactionContainer, event )
					else
						FactionContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FactionContainer:completeAnimation()
				self.FactionContainer:setAlpha( 1 )
				FactionContainerFrame2( FactionContainer, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						if not event.interrupted then
							Dot3:beginAnimation( "keyframe", 139, true, false, CoD.TweenType.Linear )
						end
						Dot3:setLeftRight( true, false, 220, 224 )
						Dot3:setTopBottom( true, false, 145, 149 )
						Dot3:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot3, event )
						else
							Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 305, 309 )
				self.Dot3:setTopBottom( true, false, 115, 119 )
				self.Dot3:setAlpha( 0.6 )
				Dot3Frame2( Dot3, {} )
				local Dot5Frame2 = function ( Dot5, event )
					local Dot5Frame3 = function ( Dot5, event )
						if not event.interrupted then
							Dot5:beginAnimation( "keyframe", 139, true, false, CoD.TweenType.Linear )
						end
						Dot5:setLeftRight( true, false, 220, 224 )
						Dot5:setTopBottom( true, false, 144.97, 148.97 )
						Dot5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot5, event )
						else
							Dot5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot5Frame3( Dot5, event )
						return 
					else
						Dot5:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame3 )
					end
				end
				
				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 305, 309 )
				self.Dot5:setTopBottom( true, false, 186, 190 )
				self.Dot5:setAlpha( 0.6 )
				Dot5Frame2( Dot5, {} )
				local Dot6Frame2 = function ( Dot6, event )
					local Dot6Frame3 = function ( Dot6, event )
						if not event.interrupted then
							Dot6:beginAnimation( "keyframe", 139, true, false, CoD.TweenType.Linear )
						end
						Dot6:setLeftRight( true, false, 222, 226 )
						Dot6:setTopBottom( true, false, 145, 149 )
						Dot6:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot6, event )
						else
							Dot6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot6Frame3( Dot6, event )
						return 
					else
						Dot6:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						Dot6:registerEventHandler( "transition_complete_keyframe", Dot6Frame3 )
					end
				end
				
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 222, 226 )
				self.Dot6:setTopBottom( true, false, 115, 119 )
				self.Dot6:setAlpha( 0.6 )
				Dot6Frame2( Dot6, {} )
				local Dot7Frame2 = function ( Dot7, event )
					local Dot7Frame3 = function ( Dot7, event )
						if not event.interrupted then
							Dot7:beginAnimation( "keyframe", 139, true, false, CoD.TweenType.Linear )
						end
						Dot7:setLeftRight( true, false, 222, 226 )
						Dot7:setTopBottom( true, false, 144.97, 148.97 )
						Dot7:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot7, event )
						else
							Dot7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot7Frame3( Dot7, event )
						return 
					else
						Dot7:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						Dot7:registerEventHandler( "transition_complete_keyframe", Dot7Frame3 )
					end
				end
				
				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 222, 226 )
				self.Dot7:setTopBottom( true, false, 186, 190 )
				self.Dot7:setAlpha( 0.6 )
				Dot7Frame2( Dot7, {} )
			end
		},
		HudPause = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "HudStart" ) then
			PlayClipOnElement( self, {
				elementName = "FactionContainer",
				clipName = "Intro"
			}, controller )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EnemyScorePanel:close()
		element.UserScorePanel:close()
		element.PanelTimer:close()
		element.PanelCircle:close()
		element.BackCircleInner:close()
		element.PrimaryStatus:close()
		element.GameTimer:close()
		element.RoundsContainer:close()
		element.UserScore:close()
		element.EnemyScore:close()
		element.FactionContainer:close()
		element.Dot3:close()
		element.Dot5:close()
		element.Dot6:close()
		element.Dot7:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

