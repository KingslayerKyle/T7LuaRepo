require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.AARUtility.DoXPBarAnimation( f1_arg0, f1_arg1 )
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
	Panel20:setLeftRight( false, false, -207, 201 )
	Panel20:setTopBottom( false, false, -263, 192.59 )
	Panel20:setRGB( 0.25, 0.25, 0.25 )
	Panel20.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel20 )
	self.Panel20 = Panel20
	
	local Panel30 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel30:setLeftRight( false, false, 204, 607.62 )
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
	CategoryListLine0:setLeftRight( true, false, 456, 818 )
	CategoryListLine0:setTopBottom( true, false, 192, 200 )
	CategoryListLine0:setAlpha( 0.33 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( true, false, 70, 1207.62 )
	XpBarContainer:setTopBottom( true, false, 463.8, 518.01 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local MissionCompleteLabel = LUI.UIText.new()
	MissionCompleteLabel:setLeftRight( true, false, 124.29, 324.29 )
	MissionCompleteLabel:setTopBottom( true, false, 18.5, 55.5 )
	MissionCompleteLabel:setText( Engine.Localize( "ZMUI_ZOD_CAPS" ) )
	MissionCompleteLabel:setTTF( "fonts/default.ttf" )
	MissionCompleteLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionCompleteLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionCompleteLabel )
	self.MissionCompleteLabel = MissionCompleteLabel
	
	local ScoreLabel = LUI.UIText.new()
	ScoreLabel:setLeftRight( true, false, 124.29, 324.29 )
	ScoreLabel:setTopBottom( true, false, 68, 93 )
	ScoreLabel:setText( Engine.Localize( "MPUI_POINTS_CAPS" ) )
	ScoreLabel:setTTF( "fonts/default.ttf" )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local Kills = CoD.ScoreWidget.new( menu, controller )
	Kills:setLeftRight( true, false, 440.62, 557.39 )
	Kills:setTopBottom( true, false, 72.61, 151.5 )
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
	Assists:setLeftRight( true, false, 572.85, 693.62 )
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
	Score:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			Score:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	local Incaps = CoD.ScoreWidget.new( menu, controller )
	Incaps:setLeftRight( true, false, 572.85, 684.12 )
	Incaps:setTopBottom( true, false, 240.68, 324 )
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
	
	local Revives = CoD.ScoreWidget.new( menu, controller )
	Revives:setLeftRight( true, false, 440.62, 557.39 )
	Revives:setTopBottom( true, false, 240.68, 324 )
	Revives.ScoreLabel:setText( Engine.Localize( "MENU_TOTAL_SHOTS_CAPS" ) )
	Revives.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TOTAL_SHOTS_CAPS" ) )
	Revives:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "pointsPerKill", function ( model )
		local pointsPerKill = Engine.GetModelValue( model )
		if pointsPerKill then
			Revives.Score.Numbers:setText( Engine.Localize( pointsPerKill ) )
		end
	end )
	self:addElement( Revives )
	self.Revives = Revives
	
	local CollectiblesLabel = LUI.UIText.new()
	CollectiblesLabel:setLeftRight( true, false, 894.81, 1094.81 )
	CollectiblesLabel:setTopBottom( true, false, 60.11, 85.11 )
	CollectiblesLabel:setText( Engine.Localize( "MENU_FAV_BGB_CAPS" ) )
	CollectiblesLabel:setTTF( "fonts/default.ttf" )
	CollectiblesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CollectiblesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CollectiblesLabel )
	self.CollectiblesLabel = CollectiblesLabel
	
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
	ScoreWidget1:setLeftRight( true, false, 706.73, 818 )
	ScoreWidget1:setTopBottom( true, false, 240.68, 324 )
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
	ScoreWidget2:setLeftRight( true, false, 706.73, 827.5 )
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
	
	local BestStyle = CoD.BestWidgetContainer.new( menu, controller )
	BestStyle:setLeftRight( true, false, 994.81, 1045.81 )
	BestStyle:setTopBottom( true, false, 249, 299 )
	BestStyle:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestStyleIcon", function ( model )
		local showBestStyleIcon = Engine.GetModelValue( model )
		if showBestStyleIcon then
			BestStyle.BestIconForKDR:setAlpha( showBestStyleIcon )
		end
	end )
	self:addElement( BestStyle )
	self.BestStyle = BestStyle
	
	local StyleDesc = LUI.UIText.new()
	StyleDesc:setLeftRight( true, false, 894.81, 1154.59 )
	StyleDesc:setTopBottom( true, false, 176.1, 207.9 )
	StyleDesc:setTTF( "fonts/default.ttf" )
	StyleDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StyleDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	StyleDesc:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "playerStyleDesc", function ( model )
		local playerStyleDesc = Engine.GetModelValue( model )
		if playerStyleDesc then
			StyleDesc:setText( Engine.Localize( playerStyleDesc ) )
		end
	end )
	self:addElement( StyleDesc )
	self.StyleDesc = StyleDesc
	
	local StyleName = LUI.UIText.new()
	StyleName:setLeftRight( true, false, 894.81, 1094.81 )
	StyleName:setTopBottom( true, false, 112.05, 162 )
	StyleName:setTTF( "fonts/default.ttf" )
	StyleName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StyleName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	StyleName:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "playerStyleName", function ( model )
		local playerStyleName = Engine.GetModelValue( model )
		if playerStyleName then
			StyleName:setText( Engine.Localize( playerStyleName ) )
		end
	end )
	self:addElement( StyleName )
	self.StyleName = StyleName
	
	local Score0 = LUI.UIText.new()
	Score0:setLeftRight( true, false, 115.79, 332.79 )
	Score0:setTopBottom( true, false, 244.63, 288.63 )
	Score0:setTTF( "fonts/default.ttf" )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			Score0:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local Revives0 = CoD.ScoreWidget.new( menu, controller )
	Revives0:setLeftRight( true, false, 440.62, 557.39 )
	Revives0:setTopBottom( true, false, 240.68, 324 )
	Revives0.ScoreLabel:setText( Engine.Localize( "MENU_TOTAL_SHOTS_CAPS" ) )
	Revives0.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TOTAL_SHOTS_CAPS" ) )
	Revives0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "pointsPerKill", function ( model )
		local pointsPerKill = Engine.GetModelValue( model )
		if pointsPerKill then
			Revives0.Score.Numbers:setText( Engine.Localize( pointsPerKill ) )
		end
	end )
	self:addElement( Revives0 )
	self.Revives0 = Revives0
	
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
		}
	}
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
		element.Revives:close()
		element.BestPoints:close()
		element.ScoreWidget1:close()
		element.ScoreWidget2:close()
		element.BestStyle:close()
		element.Revives0:close()
		element.Score:close()
		element.StyleDesc:close()
		element.StyleName:close()
		element.Score0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

