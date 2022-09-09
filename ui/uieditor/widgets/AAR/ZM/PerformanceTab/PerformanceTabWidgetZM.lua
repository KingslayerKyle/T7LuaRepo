-- 243a2339854c3f07f7ff74690e3131cf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtility.SetCurrLevelModels( controller, 1 )
	CoD.AARUtility.SetNextLevelModels( controller, 1 )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.AARUtility.DoXPBarAnimation( f2_arg0, f2_arg1 )
end

CoD.PerformanceTabWidgetZM = InheritFrom( LUI.UIElement )
CoD.PerformanceTabWidgetZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PerformanceTabWidgetZM )
	self.id = "PerformanceTabWidgetZM"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 526 )
	self.anyChildUsesUpdateState = true
	
	local Panel10 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel10:setLeftRight( false, false, -611, -210 )
	Panel10:setTopBottom( false, false, -263, 192.59 )
	Panel10:setRGB( 0.25, 0.25, 0.25 )
	Panel10.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel10 )
	self.Panel10 = Panel10
	
	local Panel20 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel20:setLeftRight( false, false, -207, 367 )
	Panel20:setTopBottom( false, false, -263, 192.59 )
	Panel20:setRGB( 0.25, 0.25, 0.25 )
	Panel20.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel20 )
	self.Panel20 = Panel20
	
	local Panel30 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel30:setLeftRight( false, false, 372.81, 607.62 )
	Panel30:setTopBottom( false, false, -263, 192.59 )
	Panel30:setRGB( 0.25, 0.25, 0.25 )
	Panel30.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel30 )
	self.Panel30 = Panel30
	
	local Panel40 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel40:setLeftRight( false, false, -611, 607.62 )
	Panel40:setTopBottom( false, false, 196.59, 263 )
	Panel40:setRGB( 0.25, 0.25, 0.25 )
	Panel40.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel40 )
	self.Panel40 = Panel40
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, -94.37, 625.63 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 55, 413 )
	CategoryListLine:setTopBottom( true, false, 192, 200 )
	CategoryListLine:setAlpha( 0.33 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 456, 980 )
	CategoryListLine0:setTopBottom( true, false, 192, 200 )
	CategoryListLine0:setAlpha( 0.33 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( true, false, 69.5, 1207.12 )
	XpBarContainer:setTopBottom( true, false, 459.59, 513.81 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local ScoreLabel = LUI.UIText.new()
	ScoreLabel:setLeftRight( true, false, 124.29, 324.29 )
	ScoreLabel:setTopBottom( true, false, 68, 93 )
	ScoreLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	ScoreLabel:setTTF( "fonts/default.ttf" )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local Kills = CoD.ScoreWidget.new( menu, controller )
	Kills:setLeftRight( true, false, 440.62, 620.39 )
	Kills:setTopBottom( true, false, 68, 151.5 )
	Kills.ScoreLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "kills", function ( model )
		local kills = Engine.GetModelValue( model )
		if kills then
			Kills.Score.Numbers:setText( Engine.Localize( kills ) )
		end
	end )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Assists = CoD.ScoreWidget.new( menu, controller )
	Assists:setLeftRight( true, false, 628.48, 808.25 )
	Assists:setTopBottom( true, false, 68, 151.5 )
	Assists.ScoreLabel:setText( Engine.Localize( "ZMUI_HEADSHOTS_CAPS" ) )
	Assists.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "ZMUI_HEADSHOTS_CAPS" ) )
	Assists:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "headshots", function ( model )
		local headshots = Engine.GetModelValue( model )
		if headshots then
			Assists.Score.Numbers:setText( Engine.Localize( headshots ) )
		end
	end )
	self:addElement( Assists )
	self.Assists = Assists
	
	local BestRound = CoD.BestWidgetContainer.new( menu, controller )
	BestRound:setLeftRight( true, false, 198.79, 249.79 )
	BestRound:setTopBottom( true, false, 291.63, 341.63 )
	BestRound:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestRoundIcon", function ( model )
		local showBestRoundIcon = Engine.GetModelValue( model )
		if showBestRoundIcon then
			BestRound.BestIconForKDR:setAlpha( showBestRoundIcon )
		end
	end )
	self:addElement( BestRound )
	self.BestRound = BestRound
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( true, false, 115.79, 332.79 )
	Score:setTopBottom( true, false, 93, 137 )
	Score:setTTF( "fonts/default.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "total_points", function ( model )
		local totalPoints = Engine.GetModelValue( model )
		if totalPoints then
			Score:setText( Engine.Localize( totalPoints ) )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	local Incaps = CoD.ScoreWidget.new( menu, controller )
	Incaps:setLeftRight( true, false, 628.48, 808.25 )
	Incaps:setTopBottom( true, false, 241.3, 324.61 )
	Incaps.ScoreLabel:setText( Engine.Localize( "ZMUI_REVIVES_CAPS" ) )
	Incaps.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "ZMUI_REVIVES_CAPS" ) )
	Incaps:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "revives", function ( model )
		local revives = Engine.GetModelValue( model )
		if revives then
			Incaps.Score.Numbers:setText( Engine.Localize( revives ) )
		end
	end )
	self:addElement( Incaps )
	self.Incaps = Incaps
	
	local CompletionTimeLabel = LUI.UIText.new()
	CompletionTimeLabel:setLeftRight( true, false, 124.29, 324.29 )
	CompletionTimeLabel:setTopBottom( true, false, 216.3, 241.3 )
	CompletionTimeLabel:setText( Engine.Localize( "MENU_SURVIVED_UNTIL_ROUND_CAPS" ) )
	CompletionTimeLabel:setTTF( "fonts/default.ttf" )
	CompletionTimeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletionTimeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletionTimeLabel )
	self.CompletionTimeLabel = CompletionTimeLabel
	
	local BestPoints = CoD.BestWidgetContainer.new( menu, controller )
	BestPoints:setLeftRight( true, false, 198.79, 249.79 )
	BestPoints:setTopBottom( true, false, 137, 187 )
	BestPoints:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local showBestScoreIcon = Engine.GetModelValue( model )
		if showBestScoreIcon then
			BestPoints.BestIconForKDR:setAlpha( showBestScoreIcon )
		end
	end )
	self:addElement( BestPoints )
	self.BestPoints = BestPoints
	
	local ScoreWidget1 = CoD.ScoreWidget.new( menu, controller )
	ScoreWidget1:setLeftRight( true, false, 818, 997.77 )
	ScoreWidget1:setTopBottom( true, false, 241.3, 324.61 )
	ScoreWidget1.ScoreLabel:setText( Engine.Localize( "ZMUI_DOWNS_CAPS" ) )
	ScoreWidget1.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "ZMUI_DOWNS_CAPS" ) )
	ScoreWidget1:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "downs", function ( model )
		local downs = Engine.GetModelValue( model )
		if downs then
			ScoreWidget1.Score.Numbers:setText( Engine.Localize( downs ) )
		end
	end )
	self:addElement( ScoreWidget1 )
	self.ScoreWidget1 = ScoreWidget1
	
	local ScoreWidget2 = CoD.ScoreWidget.new( menu, controller )
	ScoreWidget2:setLeftRight( true, false, 818, 997.77 )
	ScoreWidget2:setTopBottom( true, false, 68, 151.5 )
	ScoreWidget2.ScoreLabel:setText( Engine.Localize( "MENU_MELEE_KILLS_CAPS" ) )
	ScoreWidget2.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MELEE_KILLS_CAPS" ) )
	ScoreWidget2:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "meleeKills", function ( model )
		local meleeKills = Engine.GetModelValue( model )
		if meleeKills then
			ScoreWidget2.Score.Numbers:setText( Engine.Localize( meleeKills ) )
		end
	end )
	self:addElement( ScoreWidget2 )
	self.ScoreWidget2 = ScoreWidget2
	
	local Score0 = LUI.UIText.new()
	Score0:setLeftRight( true, false, 115.79, 332.79 )
	Score0:setTopBottom( true, false, 243.63, 287.63 )
	Score0:setTTF( "fonts/default.ttf" )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "rounds", function ( model )
		local rounds = Engine.GetModelValue( model )
		if rounds then
			Score0:setText( Engine.Localize( rounds ) )
		end
	end )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local CompletionTimeLabel0 = LUI.UIText.new()
	CompletionTimeLabel0:setLeftRight( true, false, 1030.21, 1230.21 )
	CompletionTimeLabel0:setTopBottom( true, false, 55.5, 80.5 )
	CompletionTimeLabel0:setText( Engine.Localize( "MENU_BGB_TOKENS_GAINED_THIS_GAME_CAPS" ) )
	CompletionTimeLabel0:setTTF( "fonts/default.ttf" )
	CompletionTimeLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletionTimeLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletionTimeLabel0 )
	self.CompletionTimeLabel0 = CompletionTimeLabel0
	
	local Score00 = LUI.UIText.new()
	Score00:setLeftRight( true, false, 1037.51, 1222.92 )
	Score00:setTopBottom( true, false, 87.75, 131.75 )
	Score00:setTTF( "fonts/default.ttf" )
	Score00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "bgbTokensGainedThisGame", function ( model )
		local bgbTokensGainedThisGame = Engine.GetModelValue( model )
		if bgbTokensGainedThisGame then
			Score00:setText( Engine.Localize( bgbTokensGainedThisGame ) )
		end
	end )
	self:addElement( Score00 )
	self.Score00 = Score00
	
	local vial = LUI.UIImage.new()
	vial:setLeftRight( true, false, 1030.21, 1210.21 )
	vial:setTopBottom( true, false, 30.95, 534.95 )
	vial:setScale( 0.5 )
	vial:setImage( RegisterImage( "uie_t7_hud_zm_vial" ) )
	self:addElement( vial )
	self.vial = vial
	
	local Revives00 = CoD.ScoreWidget.new( menu, controller )
	Revives00:setLeftRight( true, false, 440.62, 615.39 )
	Revives00:setTopBottom( true, false, 241.3, 324.61 )
	Revives00.ScoreLabel:setText( Engine.Localize( "MENU_BGBS_CHEWED_CAPS" ) )
	Revives00.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BGBS_CHEWED_CAPS" ) )
	Revives00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "pointsPerKill", function ( model )
		local pointsPerKill = Engine.GetModelValue( model )
		if pointsPerKill then
			Revives00.Score.Numbers:setText( Engine.Localize( pointsPerKill ) )
		end
	end )
	self:addElement( Revives00 )
	self.Revives00 = Revives00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				local Panel10Frame2 = function ( Panel10, event )
					if not event.interrupted then
						Panel10:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Panel10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel10, event )
					else
						Panel10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel10:completeAnimation()
				self.Panel10:setAlpha( 0 )
				Panel10Frame2( Panel10, {} )
				local Panel20Frame2 = function ( Panel20, event )
					local Panel20Frame3 = function ( Panel20, event )
						if not event.interrupted then
							Panel20:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Panel20:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Panel20, event )
						else
							Panel20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Panel20Frame3( Panel20, event )
						return 
					else
						Panel20:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Panel20:registerEventHandler( "transition_complete_keyframe", Panel20Frame3 )
					end
				end
				
				Panel20:completeAnimation()
				self.Panel20:setAlpha( 0 )
				Panel20Frame2( Panel20, {} )
				local Panel30Frame2 = function ( Panel30, event )
					local Panel30Frame3 = function ( Panel30, event )
						if not event.interrupted then
							Panel30:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Panel30:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Panel30, event )
						else
							Panel30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Panel30Frame3( Panel30, event )
						return 
					else
						Panel30:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Panel30:registerEventHandler( "transition_complete_keyframe", Panel30Frame3 )
					end
				end
				
				Panel30:completeAnimation()
				self.Panel30:setAlpha( 0 )
				Panel30Frame2( Panel30, {} )
				local Panel40Frame2 = function ( Panel40, event )
					local Panel40Frame3 = function ( Panel40, event )
						if not event.interrupted then
							Panel40:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Panel40:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Panel40, event )
						else
							Panel40:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Panel40Frame3( Panel40, event )
						return 
					else
						Panel40:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Panel40:registerEventHandler( "transition_complete_keyframe", Panel40Frame3 )
					end
				end
				
				Panel40:completeAnimation()
				self.Panel40:setAlpha( 0 )
				Panel40Frame2( Panel40, {} )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 0 )
				VignetteBackFrame2( VignetteBack, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					local CategoryListLineFrame3 = function ( CategoryListLine, event )
						if not event.interrupted then
							CategoryListLine:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						CategoryListLine:setAlpha( 0.33 )
						if event.interrupted then
							self.clipFinished( CategoryListLine, event )
						else
							CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CategoryListLineFrame3( CategoryListLine, event )
						return 
					else
						CategoryListLine:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", CategoryListLineFrame3 )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				CategoryListLineFrame2( CategoryListLine, {} )
				local CategoryListLine0Frame2 = function ( CategoryListLine0, event )
					local CategoryListLine0Frame3 = function ( CategoryListLine0, event )
						if not event.interrupted then
							CategoryListLine0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						CategoryListLine0:setAlpha( 0.33 )
						if event.interrupted then
							self.clipFinished( CategoryListLine0, event )
						else
							CategoryListLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CategoryListLine0Frame3( CategoryListLine0, event )
						return 
					else
						CategoryListLine0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						CategoryListLine0:registerEventHandler( "transition_complete_keyframe", CategoryListLine0Frame3 )
					end
				end
				
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				CategoryListLine0Frame2( CategoryListLine0, {} )
				local XpBarContainerFrame2 = function ( XpBarContainer, event )
					local XpBarContainerFrame3 = function ( XpBarContainer, event )
						if not event.interrupted then
							XpBarContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						XpBarContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( XpBarContainer, event )
						else
							XpBarContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarContainerFrame3( XpBarContainer, event )
						return 
					else
						XpBarContainer:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						XpBarContainer:registerEventHandler( "transition_complete_keyframe", XpBarContainerFrame3 )
					end
				end
				
				XpBarContainer:completeAnimation()
				self.XpBarContainer:setAlpha( 0 )
				XpBarContainerFrame2( XpBarContainer, {} )
			end
		},
		Offline = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local Panel10Frame2 = function ( Panel10, event )
					if not event.interrupted then
						Panel10:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Panel10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel10, event )
					else
						Panel10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel10:completeAnimation()
				self.Panel10:setAlpha( 0 )
				Panel10Frame2( Panel10, {} )
				local Panel20Frame2 = function ( Panel20, event )
					local Panel20Frame3 = function ( Panel20, event )
						if not event.interrupted then
							Panel20:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Panel20:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Panel20, event )
						else
							Panel20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Panel20Frame3( Panel20, event )
						return 
					else
						Panel20:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Panel20:registerEventHandler( "transition_complete_keyframe", Panel20Frame3 )
					end
				end
				
				Panel20:completeAnimation()
				self.Panel20:setAlpha( 0 )
				Panel20Frame2( Panel20, {} )
				local Panel30Frame2 = function ( Panel30, event )
					local Panel30Frame3 = function ( Panel30, event )
						if not event.interrupted then
							Panel30:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Panel30:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Panel30, event )
						else
							Panel30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Panel30Frame3( Panel30, event )
						return 
					else
						Panel30:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Panel30:registerEventHandler( "transition_complete_keyframe", Panel30Frame3 )
					end
				end
				
				Panel30:completeAnimation()
				self.Panel30:setAlpha( 0 )
				Panel30Frame2( Panel30, {} )
				local Panel40Frame2 = function ( Panel40, event )
					local Panel40Frame3 = function ( Panel40, event )
						if not event.interrupted then
							Panel40:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Panel40:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Panel40, event )
						else
							Panel40:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Panel40Frame3( Panel40, event )
						return 
					else
						Panel40:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Panel40:registerEventHandler( "transition_complete_keyframe", Panel40Frame3 )
					end
				end
				
				Panel40:completeAnimation()
				self.Panel40:setAlpha( 0 )
				Panel40Frame2( Panel40, {} )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 0 )
				VignetteBackFrame2( VignetteBack, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					local CategoryListLineFrame3 = function ( CategoryListLine, event )
						if not event.interrupted then
							CategoryListLine:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						CategoryListLine:setAlpha( 0.33 )
						if event.interrupted then
							self.clipFinished( CategoryListLine, event )
						else
							CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CategoryListLineFrame3( CategoryListLine, event )
						return 
					else
						CategoryListLine:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", CategoryListLineFrame3 )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				CategoryListLineFrame2( CategoryListLine, {} )
				local CategoryListLine0Frame2 = function ( CategoryListLine0, event )
					local CategoryListLine0Frame3 = function ( CategoryListLine0, event )
						if not event.interrupted then
							CategoryListLine0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						CategoryListLine0:setAlpha( 0.33 )
						if event.interrupted then
							self.clipFinished( CategoryListLine0, event )
						else
							CategoryListLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CategoryListLine0Frame3( CategoryListLine0, event )
						return 
					else
						CategoryListLine0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						CategoryListLine0:registerEventHandler( "transition_complete_keyframe", CategoryListLine0Frame3 )
					end
				end
				
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				CategoryListLine0Frame2( CategoryListLine0, {} )
				local XpBarContainerFrame2 = function ( XpBarContainer, event )
					local XpBarContainerFrame3 = function ( XpBarContainer, event )
						if not event.interrupted then
							XpBarContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						XpBarContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( XpBarContainer, event )
						else
							XpBarContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarContainerFrame3( XpBarContainer, event )
						return 
					else
						XpBarContainer:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						XpBarContainer:registerEventHandler( "transition_complete_keyframe", XpBarContainerFrame3 )
					end
				end
				
				XpBarContainer:completeAnimation()
				self.XpBarContainer:setAlpha( 0 )
				XpBarContainerFrame2( XpBarContainer, {} )

				CompletionTimeLabel0:completeAnimation()
				self.CompletionTimeLabel0:setAlpha( 0 )
				self.clipFinished( CompletionTimeLabel0, {} )

				Score00:completeAnimation()
				self.Score00:setAlpha( 0 )
				self.clipFinished( Score00, {} )

				vial:completeAnimation()
				self.vial:setAlpha( 0 )
				self.clipFinished( vial, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Offline",
			condition = function ( menu, element, event )
				return not IsLive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel10:close()
		element.Panel20:close()
		element.Panel30:close()
		element.Panel40:close()
		element.VignetteBack:close()
		element.XpBarContainer:close()
		element.Kills:close()
		element.Assists:close()
		element.BestRound:close()
		element.Incaps:close()
		element.BestPoints:close()
		element.ScoreWidget1:close()
		element.ScoreWidget2:close()
		element.Revives00:close()
		element.Score:close()
		element.Score0:close()
		element.Score00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
