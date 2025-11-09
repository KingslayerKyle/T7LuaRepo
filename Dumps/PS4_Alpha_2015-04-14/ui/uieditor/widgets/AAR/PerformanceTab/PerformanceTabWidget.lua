require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.WinLossRatioWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.SPMGraphWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.KDRGraphWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidgetSmall" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )

local PostLoadFunc = function ( self, controller )
	local aarStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarStats" )
	local performanceTabStatsModel = Engine.GetModel( aarStatsModel, "performanceTabStats" )
	local xpEarnedDuringMatch = Engine.GetModelValue( Engine.GetModel( performanceTabStatsModel, "xpEarnedDuringMatch" ) )
	local xpNeededToLevelUp = Engine.GetModelValue( Engine.GetModel( performanceTabStatsModel, "xpNeededToLevelUp" ) )
	local minXPForCurrRank = Engine.GetModelValue( Engine.GetModel( performanceTabStatsModel, "minXPForCurrRank" ) )
	local maxXPForCurrRank = Engine.GetModelValue( Engine.GetModel( performanceTabStatsModel, "maxXPForCurrRank" ) )
	local rankXPBeforeMatch = Engine.GetModelValue( Engine.GetModel( performanceTabStatsModel, "rankXPBeforeMatch" ) )
	local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
	Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, xpNeededToLevelUp )
	local progressionBeforeMatch = (rankXPBeforeMatch - minXPForCurrRank) / math.max( 1, maxXPForCurrRank - minXPForCurrRank )
	local progressionInMatch = (xpEarnedDuringMatch + rankXPBeforeMatch - minXPForCurrRank) / math.max( 1, maxXPForCurrRank - minXPForCurrRank )
	local xpBar = self.XpBar
	local animTime = 700
	local delayTimer = LUI.UITimer.new( 500, "start_xp_bar_animation", true, self )
end

CoD.PerformanceTabWidget = InheritFrom( LUI.UIElement )
CoD.PerformanceTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerformanceTabWidget )
	self.id = "PerformanceTabWidget"
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
	VignetteBack:setRGB( 1, 1, 1 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 150.67, 321.34 )
	GameTypeIcon:setTopBottom( true, false, 13.67, 184.34 )
	GameTypeIcon:setRGB( 1, 1, 1 )
	GameTypeIcon:setAlpha( 0.45 )
	GameTypeIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	GameTypeIcon:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local ScoreInfo = CoD.ScoreWidget.new( menu, controller )
	ScoreInfo:setLeftRight( true, false, 485.5, 783.5 )
	ScoreInfo:setTopBottom( true, false, 37, 154 )
	ScoreInfo:setRGB( 1, 1, 1 )
	ScoreInfo.ScoreLabel:setText( Engine.Localize( "MPUI_SCORE_CAPS" ) )
	ScoreInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_SCORE_CAPS" ) )
	ScoreInfo:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreInfo.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreInfo )
	self.ScoreInfo = ScoreInfo
	
	local KillsInfo = CoD.ScoreWidget.new( menu, controller )
	KillsInfo:setLeftRight( true, false, 892, 1028.77 )
	KillsInfo:setTopBottom( true, false, 37, 154 )
	KillsInfo:setRGB( 1, 1, 1 )
	KillsInfo.ScoreLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	KillsInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	KillsInfo:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "kills", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KillsInfo.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( KillsInfo )
	self.KillsInfo = KillsInfo
	
	local DeathsInfo = CoD.ScoreWidget.new( menu, controller )
	DeathsInfo:setLeftRight( true, false, 1055.23, 1192 )
	DeathsInfo:setTopBottom( true, false, 37, 154 )
	DeathsInfo:setRGB( 1, 1, 1 )
	DeathsInfo.ScoreLabel:setText( Engine.Localize( "MPUI_DEATHS_CAPS" ) )
	DeathsInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_DEATHS_CAPS" ) )
	DeathsInfo:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "deaths", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DeathsInfo.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( DeathsInfo )
	self.DeathsInfo = DeathsInfo
	
	local WinLossRatioWidget = CoD.WinLossRatioWidget.new( menu, controller )
	WinLossRatioWidget:setLeftRight( true, false, 136, 328 )
	WinLossRatioWidget:setTopBottom( true, false, 223.01, 415.01 )
	WinLossRatioWidget:setRGB( 1, 1, 1 )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "wins", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinLossRatioWidget.TotalWins:setText( Engine.Localize( modelValue ) )
		end
	end )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "losses", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinLossRatioWidget.TotalLosses:setText( Engine.Localize( modelValue ) )
		end
	end )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "lossesRingClockFrac", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinLossRatioWidget.LossesRing:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "winLossRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinLossRatioWidget.WinLossRatio:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WinLossRatioWidget )
	self.WinLossRatioWidget = WinLossRatioWidget
	
	local SPMGraphWidget = CoD.SPMGraphWidget.new( menu, controller )
	SPMGraphWidget:setLeftRight( true, false, 429.5, 812.92 )
	SPMGraphWidget:setTopBottom( true, false, 236, 447 )
	SPMGraphWidget:setRGB( 1, 1, 1 )
	self:addElement( SPMGraphWidget )
	self.SPMGraphWidget = SPMGraphWidget
	
	local KDRGraphWidget0 = CoD.KDRGraphWidget.new( menu, controller )
	KDRGraphWidget0:setLeftRight( true, false, 834.62, 1214.62 )
	KDRGraphWidget0:setTopBottom( true, false, 235.51, 441.51 )
	KDRGraphWidget0:setRGB( 1, 1, 1 )
	self:addElement( KDRGraphWidget0 )
	self.KDRGraphWidget0 = KDRGraphWidget0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 485.5, 573.5 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, 225.51, 251.51 )
	StartMenuIdentitySubTitle0:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle0.SubTitle:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE_CAPS" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local StartMenuIdentitySubTitle00 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle00:setLeftRight( true, false, 891.89, 979.89 )
	StartMenuIdentitySubTitle00:setTopBottom( true, false, 225.51, 251.51 )
	StartMenuIdentitySubTitle00:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle00.SubTitle:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle00.SubTitle:setText( Engine.Localize( "MENU_KDRATIO_CAPS" ) )
	StartMenuIdentitySubTitle00.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle00 )
	self.StartMenuIdentitySubTitle00 = StartMenuIdentitySubTitle00
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 55, 413 )
	CategoryListLine:setTopBottom( true, false, 192, 200 )
	CategoryListLine:setRGB( 1, 1, 1 )
	CategoryListLine:setAlpha( 0.33 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 456, 818 )
	CategoryListLine0:setTopBottom( true, false, 192, 200 )
	CategoryListLine0:setRGB( 1, 1, 1 )
	CategoryListLine0:setAlpha( 0.33 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 865, 1220 )
	CategoryListLine00:setTopBottom( true, false, 192, 200 )
	CategoryListLine00:setRGB( 1, 1, 1 )
	CategoryListLine00:setAlpha( 0.33 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local TitleWidget0 = CoD.TitleWidget.new( menu, controller )
	TitleWidget0:setLeftRight( true, false, 99.5, 379.5 )
	TitleWidget0:setTopBottom( true, false, 71, 105 )
	TitleWidget0:setRGB( 1, 1, 1 )
	TitleWidget0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleWidget0 )
	self.TitleWidget0 = TitleWidget0
	
	local XpBarContainer0 = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer0:setLeftRight( true, false, 70, 1207.62 )
	XpBarContainer0:setTopBottom( true, false, 463.8, 518.01 )
	XpBarContainer0:setRGB( 1, 1, 1 )
	XpBarContainer0.StartMenuIdentitySubTitle01.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer0.Glow0:setRGB( 0.25, 0.06, 0 )
	self:addElement( XpBarContainer0 )
	self.XpBarContainer0 = XpBarContainer0
	
	local VictoryText = CoD.TitleWidgetSmall.new( menu, controller )
	VictoryText:setLeftRight( true, false, 192, 280 )
	VictoryText:setTopBottom( true, false, 108, 133 )
	VictoryText:setRGB( 1, 1, 1 )
	VictoryText.SubTitle:setRGB( 1, 1, 1 )
	VictoryText:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "outcome", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VictoryText.SubTitle:setText( modelValue )
		end
	end )
	self:addElement( VictoryText )
	self.VictoryText = VictoryText
	
	local BestWidgetContainer0 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer0:setLeftRight( true, false, 481.5, 532.5 )
	BestWidgetContainer0:setTopBottom( true, false, 283.63, 333.63 )
	BestWidgetContainer0:setRGB( 1, 1, 1 )
	BestWidgetContainer0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestSPMIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer0.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer0 )
	self.BestWidgetContainer0 = BestWidgetContainer0
	
	local BestWidgetContainer00 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer00:setLeftRight( true, false, 885.89, 936.89 )
	BestWidgetContainer00:setTopBottom( true, false, 283.63, 333.63 )
	BestWidgetContainer00:setRGB( 1, 1, 1 )
	BestWidgetContainer00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer00.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer00 )
	self.BestWidgetContainer00 = BestWidgetContainer00
	
	local BestWidgetContainer01 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer01:setLeftRight( true, false, 479.5, 530.5 )
	BestWidgetContainer01:setTopBottom( true, false, 65, 115 )
	BestWidgetContainer01:setRGB( 1, 1, 1 )
	BestWidgetContainer01:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer01.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer01 )
	self.BestWidgetContainer01 = BestWidgetContainer01
	
	local BestWidgetContainer010 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer010:setLeftRight( true, false, 886.5, 937.5 )
	BestWidgetContainer010:setTopBottom( true, false, 65, 115 )
	BestWidgetContainer010:setRGB( 1, 1, 1 )
	BestWidgetContainer010:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKillsIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer010.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer010 )
	self.BestWidgetContainer010 = BestWidgetContainer010
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 24 )
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
				local GameTypeIconFrame2 = function ( GameTypeIcon, event )
					local GameTypeIconFrame3 = function ( GameTypeIcon, event )
						if not event.interrupted then
							GameTypeIcon:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Bounce )
						end
						GameTypeIcon:setAlpha( 0.45 )
						if event.interrupted then
							self.clipFinished( GameTypeIcon, event )
						else
							GameTypeIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GameTypeIconFrame3( GameTypeIcon, event )
						return 
					else
						GameTypeIcon:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame3 )
					end
				end
				
				GameTypeIcon:completeAnimation()
				self.GameTypeIcon:setAlpha( 0 )
				GameTypeIconFrame2( GameTypeIcon, {} )
				local ScoreInfoFrame2 = function ( ScoreInfo, event )
					local ScoreInfoFrame3 = function ( ScoreInfo, event )
						if not event.interrupted then
							ScoreInfo:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						ScoreInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScoreInfo, event )
						else
							ScoreInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreInfoFrame3( ScoreInfo, event )
						return 
					else
						ScoreInfo:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						ScoreInfo:registerEventHandler( "transition_complete_keyframe", ScoreInfoFrame3 )
					end
				end
				
				ScoreInfo:completeAnimation()
				self.ScoreInfo:setAlpha( 0 )
				ScoreInfoFrame2( ScoreInfo, {} )
				local KillsInfoFrame2 = function ( KillsInfo, event )
					local KillsInfoFrame3 = function ( KillsInfo, event )
						if not event.interrupted then
							KillsInfo:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						KillsInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( KillsInfo, event )
						else
							KillsInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KillsInfoFrame3( KillsInfo, event )
						return 
					else
						KillsInfo:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						KillsInfo:registerEventHandler( "transition_complete_keyframe", KillsInfoFrame3 )
					end
				end
				
				KillsInfo:completeAnimation()
				self.KillsInfo:setAlpha( 0 )
				KillsInfoFrame2( KillsInfo, {} )
				local DeathsInfoFrame2 = function ( DeathsInfo, event )
					local DeathsInfoFrame3 = function ( DeathsInfo, event )
						if not event.interrupted then
							DeathsInfo:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						DeathsInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DeathsInfo, event )
						else
							DeathsInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DeathsInfoFrame3( DeathsInfo, event )
						return 
					else
						DeathsInfo:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						DeathsInfo:registerEventHandler( "transition_complete_keyframe", DeathsInfoFrame3 )
					end
				end
				
				DeathsInfo:completeAnimation()
				self.DeathsInfo:setAlpha( 0 )
				DeathsInfoFrame2( DeathsInfo, {} )
				local WinLossRatioWidgetFrame2 = function ( WinLossRatioWidget, event )
					local WinLossRatioWidgetFrame3 = function ( WinLossRatioWidget, event )
						if not event.interrupted then
							WinLossRatioWidget:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						WinLossRatioWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinLossRatioWidget, event )
						else
							WinLossRatioWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinLossRatioWidgetFrame3( WinLossRatioWidget, event )
						return 
					else
						WinLossRatioWidget:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						WinLossRatioWidget:registerEventHandler( "transition_complete_keyframe", WinLossRatioWidgetFrame3 )
					end
				end
				
				WinLossRatioWidget:completeAnimation()
				self.WinLossRatioWidget:setAlpha( 0 )
				WinLossRatioWidgetFrame2( WinLossRatioWidget, {} )
				local SPMGraphWidgetFrame2 = function ( SPMGraphWidget, event )
					local SPMGraphWidgetFrame3 = function ( SPMGraphWidget, event )
						if not event.interrupted then
							SPMGraphWidget:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						SPMGraphWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SPMGraphWidget, event )
						else
							SPMGraphWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SPMGraphWidgetFrame3( SPMGraphWidget, event )
						return 
					else
						SPMGraphWidget:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						SPMGraphWidget:registerEventHandler( "transition_complete_keyframe", SPMGraphWidgetFrame3 )
					end
				end
				
				SPMGraphWidget:completeAnimation()
				self.SPMGraphWidget:setAlpha( 0 )
				SPMGraphWidgetFrame2( SPMGraphWidget, {} )
				local KDRGraphWidget0Frame2 = function ( KDRGraphWidget0, event )
					local KDRGraphWidget0Frame3 = function ( KDRGraphWidget0, event )
						if not event.interrupted then
							KDRGraphWidget0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						KDRGraphWidget0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( KDRGraphWidget0, event )
						else
							KDRGraphWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KDRGraphWidget0Frame3( KDRGraphWidget0, event )
						return 
					else
						KDRGraphWidget0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						KDRGraphWidget0:registerEventHandler( "transition_complete_keyframe", KDRGraphWidget0Frame3 )
					end
				end
				
				KDRGraphWidget0:completeAnimation()
				self.KDRGraphWidget0:setAlpha( 0 )
				KDRGraphWidget0Frame2( KDRGraphWidget0, {} )
				local StartMenuIdentitySubTitle0Frame2 = function ( StartMenuIdentitySubTitle0, event )
					local StartMenuIdentitySubTitle0Frame3 = function ( StartMenuIdentitySubTitle0, event )
						if not event.interrupted then
							StartMenuIdentitySubTitle0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						StartMenuIdentitySubTitle0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( StartMenuIdentitySubTitle0, event )
						else
							StartMenuIdentitySubTitle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						StartMenuIdentitySubTitle0Frame3( StartMenuIdentitySubTitle0, event )
						return 
					else
						StartMenuIdentitySubTitle0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						StartMenuIdentitySubTitle0:registerEventHandler( "transition_complete_keyframe", StartMenuIdentitySubTitle0Frame3 )
					end
				end
				
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 0 )
				StartMenuIdentitySubTitle0Frame2( StartMenuIdentitySubTitle0, {} )
				local StartMenuIdentitySubTitle00Frame2 = function ( StartMenuIdentitySubTitle00, event )
					local StartMenuIdentitySubTitle00Frame3 = function ( StartMenuIdentitySubTitle00, event )
						if not event.interrupted then
							StartMenuIdentitySubTitle00:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						StartMenuIdentitySubTitle00:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( StartMenuIdentitySubTitle00, event )
						else
							StartMenuIdentitySubTitle00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						StartMenuIdentitySubTitle00Frame3( StartMenuIdentitySubTitle00, event )
						return 
					else
						StartMenuIdentitySubTitle00:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						StartMenuIdentitySubTitle00:registerEventHandler( "transition_complete_keyframe", StartMenuIdentitySubTitle00Frame3 )
					end
				end
				
				StartMenuIdentitySubTitle00:completeAnimation()
				self.StartMenuIdentitySubTitle00:setAlpha( 0 )
				StartMenuIdentitySubTitle00Frame2( StartMenuIdentitySubTitle00, {} )
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
				local CategoryListLine00Frame2 = function ( CategoryListLine00, event )
					local CategoryListLine00Frame3 = function ( CategoryListLine00, event )
						if not event.interrupted then
							CategoryListLine00:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						CategoryListLine00:setAlpha( 0.33 )
						if event.interrupted then
							self.clipFinished( CategoryListLine00, event )
						else
							CategoryListLine00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CategoryListLine00Frame3( CategoryListLine00, event )
						return 
					else
						CategoryListLine00:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						CategoryListLine00:registerEventHandler( "transition_complete_keyframe", CategoryListLine00Frame3 )
					end
				end
				
				CategoryListLine00:completeAnimation()
				self.CategoryListLine00:setAlpha( 0 )
				CategoryListLine00Frame2( CategoryListLine00, {} )
				local TitleWidget0Frame2 = function ( TitleWidget0, event )
					local TitleWidget0Frame3 = function ( TitleWidget0, event )
						if not event.interrupted then
							TitleWidget0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						TitleWidget0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TitleWidget0, event )
						else
							TitleWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TitleWidget0Frame3( TitleWidget0, event )
						return 
					else
						TitleWidget0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						TitleWidget0:registerEventHandler( "transition_complete_keyframe", TitleWidget0Frame3 )
					end
				end
				
				TitleWidget0:completeAnimation()
				self.TitleWidget0:setAlpha( 0 )
				TitleWidget0Frame2( TitleWidget0, {} )
				local XpBarContainer0Frame2 = function ( XpBarContainer0, event )
					local XpBarContainer0Frame3 = function ( XpBarContainer0, event )
						if not event.interrupted then
							XpBarContainer0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						XpBarContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( XpBarContainer0, event )
						else
							XpBarContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarContainer0Frame3( XpBarContainer0, event )
						return 
					else
						XpBarContainer0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						XpBarContainer0:registerEventHandler( "transition_complete_keyframe", XpBarContainer0Frame3 )
					end
				end
				
				XpBarContainer0:completeAnimation()
				self.XpBarContainer0:setAlpha( 0 )
				XpBarContainer0Frame2( XpBarContainer0, {} )
				local VictoryTextFrame2 = function ( VictoryText, event )
					local VictoryTextFrame3 = function ( VictoryText, event )
						if not event.interrupted then
							VictoryText:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
						end
						VictoryText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VictoryText, event )
						else
							VictoryText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VictoryTextFrame3( VictoryText, event )
						return 
					else
						VictoryText:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						VictoryText:registerEventHandler( "transition_complete_keyframe", VictoryTextFrame3 )
					end
				end
				
				VictoryText:completeAnimation()
				self.VictoryText:setAlpha( 0 )
				VictoryTextFrame2( VictoryText, {} )
				local BestWidgetContainer0Frame2 = function ( BestWidgetContainer0, event )
					local BestWidgetContainer0Frame3 = function ( BestWidgetContainer0, event )
						if not event.interrupted then
							BestWidgetContainer0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						BestWidgetContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BestWidgetContainer0, event )
						else
							BestWidgetContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BestWidgetContainer0Frame3( BestWidgetContainer0, event )
						return 
					else
						BestWidgetContainer0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						BestWidgetContainer0:registerEventHandler( "transition_complete_keyframe", BestWidgetContainer0Frame3 )
					end
				end
				
				BestWidgetContainer0:completeAnimation()
				self.BestWidgetContainer0:setAlpha( 0 )
				BestWidgetContainer0Frame2( BestWidgetContainer0, {} )
				local BestWidgetContainer00Frame2 = function ( BestWidgetContainer00, event )
					local BestWidgetContainer00Frame3 = function ( BestWidgetContainer00, event )
						if not event.interrupted then
							BestWidgetContainer00:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Bounce )
						end
						BestWidgetContainer00:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BestWidgetContainer00, event )
						else
							BestWidgetContainer00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BestWidgetContainer00Frame3( BestWidgetContainer00, event )
						return 
					else
						BestWidgetContainer00:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						BestWidgetContainer00:registerEventHandler( "transition_complete_keyframe", BestWidgetContainer00Frame3 )
					end
				end
				
				BestWidgetContainer00:completeAnimation()
				self.BestWidgetContainer00:setAlpha( 0 )
				BestWidgetContainer00Frame2( BestWidgetContainer00, {} )
				local BestWidgetContainer01Frame2 = function ( BestWidgetContainer01, event )
					local BestWidgetContainer01Frame3 = function ( BestWidgetContainer01, event )
						if not event.interrupted then
							BestWidgetContainer01:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						BestWidgetContainer01:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BestWidgetContainer01, event )
						else
							BestWidgetContainer01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BestWidgetContainer01Frame3( BestWidgetContainer01, event )
						return 
					else
						BestWidgetContainer01:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						BestWidgetContainer01:registerEventHandler( "transition_complete_keyframe", BestWidgetContainer01Frame3 )
					end
				end
				
				BestWidgetContainer01:completeAnimation()
				self.BestWidgetContainer01:setAlpha( 0 )
				BestWidgetContainer01Frame2( BestWidgetContainer01, {} )
				local BestWidgetContainer010Frame2 = function ( BestWidgetContainer010, event )
					local BestWidgetContainer010Frame3 = function ( BestWidgetContainer010, event )
						if not event.interrupted then
							BestWidgetContainer010:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						BestWidgetContainer010:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BestWidgetContainer010, event )
						else
							BestWidgetContainer010:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BestWidgetContainer010Frame3( BestWidgetContainer010, event )
						return 
					else
						BestWidgetContainer010:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						BestWidgetContainer010:registerEventHandler( "transition_complete_keyframe", BestWidgetContainer010Frame3 )
					end
				end
				
				BestWidgetContainer010:completeAnimation()
				self.BestWidgetContainer010:setAlpha( 0 )
				BestWidgetContainer010Frame2( BestWidgetContainer010, {} )
			end
		}
	}
	self.close = function ( self )
		self.Panel10:close()
		self.Panel20:close()
		self.Panel30:close()
		self.Panel40:close()
		self.VignetteBack:close()
		self.ScoreInfo:close()
		self.KillsInfo:close()
		self.DeathsInfo:close()
		self.WinLossRatioWidget:close()
		self.SPMGraphWidget:close()
		self.KDRGraphWidget0:close()
		self.StartMenuIdentitySubTitle0:close()
		self.StartMenuIdentitySubTitle00:close()
		self.TitleWidget0:close()
		self.XpBarContainer0:close()
		self.VictoryText:close()
		self.BestWidgetContainer0:close()
		self.BestWidgetContainer00:close()
		self.BestWidgetContainer01:close()
		self.BestWidgetContainer010:close()
		self.GameTypeIcon:close()
		CoD.PerformanceTabWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

