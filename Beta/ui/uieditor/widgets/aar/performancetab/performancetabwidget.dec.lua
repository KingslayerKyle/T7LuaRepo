require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.WinLossRatioWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.SPMGraphWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.KDRGraphWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidgetSmall" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidget" )

local f0_local0 = require
local f0_local1 = "ui.uieditor.widgets.AAR.PerformanceTab.YellowLine"
f0_local0( f0_local1 )
f0_local0 = function ( controller, self, xpBar, startValue, endValue, endFunc )
	local animTime = CoD.AARUtility.XPBarAnimTime
	local performanceTabStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
	local xpNumberCountdownInterval = 5
	local xpNumberTimer = LUI.UITimer.new( xpNumberCountdownInterval, "count_down", false, self )
	xpNumberTimer.currentValue = startValue
	xpNumberTimer.minValue = endValue
	self.xpNumberTimer = xpNumberTimer
	local timeElapsed = 0
	self:registerEventHandler( "count_down", function ( eventOwner, event )
		timeElapsed = timeElapsed + event.timeElapsed
		xpNumberTimer.currentValue = math.floor( startValue - timeElapsed / animTime * startValue )
		if xpNumberTimer.currentValue < xpNumberTimer.minValue or animTime < timeElapsed then
			xpNumberTimer.currentValue = xpNumberTimer.minValue
			xpNumberTimer:close()
			if endFunc then
				endFunc()
			end
		end
		Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, xpNumberTimer.currentValue )
	end )
	self:addElement( self.xpNumberTimer )
end

f0_local1 = function ( controller, self, startRankXP, startRank, endRank, currRankXP )
	local animTime = CoD.AARUtility.XPBarAnimTime
	local xpBar = self.XpBarContainer.XpBar
	local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( startRank, controller )
	local startValue = (startRankXP - minXP) / math.max( 1, maxXP - minXP )
	local endValue = 1
	local endValueForCounter = 0
	local endXP = 0
	if startRank == endRank then
		endValue = (currRankXP - minXP) / math.max( 1, maxXP - minXP )
		endValueForCounter = maxXP - currRankXP
	end
	xpBar.XpBarCurrXPBg:setShaderVector( 0, startValue, 0, 0, 0 )
	xpBar.XpBarEarnedXPBg:setShaderVector( 0, startValue, 0, 0, 0 )
	xpBar.XpBarEarnedXPBg:beginAnimation( "animate_bar", animTime, true, true )
	xpBar.XpBarEarnedXPBg:setShaderVector( 0, endValue, 0, 0, 0 )
	Engine.PlaySound( "uin_aar_bar_fill_main" )
	f0_local0( controller, self, xpBar, maxXP - startRankXP, endValueForCounter, function ()
		Engine.PlaySound( "uin_aar_bar_fill_tail" )
		if endRank <= startRank then
			if Engine.IsCampaignGame() then
				CoD.AARUtilityCP.hasSeenXPBarAnim = true
			end
			return 
		else
			self.XpBarContainer:playClip( "Update" )
			self.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
				local newRank = math.min( CoD.MAX_RANK, startRank + 1 )
				local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( newRank, controller )
				CoD.AARUtility.SetCurrLevelModels( controller, newRank )
				CoD.AARUtility.SetNextLevelModels( controller, math.min( CoD.MAX_RANK, newRank + 1 ) )
				xpBar.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				xpBar.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				self.XpBarContainer:playClip( "FlashNextLevel" )
				self.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
					f0_local1( controller, self, minXP, newRank, endRank, currRankXP )
				end )
			end )
		end
	end )
end

CoD.AARUtility.DoXPBarAnimation = function ( self, controller )
	local useTestData = CoD.AARUtility.UseTestData()
	if Engine.IsCampaignGame() then
		useTestData = CoD.AARUtilityCP.UseTestData()
		if CoD.AARUtilityCP.hasSeenXPBarAnim == true then
			local currentStats = CoD.GetPlayerStats( controller )
			local currRank = currentStats.PlayerStatsList.RANK.StatValue:get()
			local currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
			local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( currRank, controller )
			local endValue = (currRankXP - minXP) / math.max( 1, maxXP - minXP )
			local performanceTabStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
			local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
			local xpBar = self.XpBarContainer.XpBar
			Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, maxXP - currRankXP )
			xpBar.XpBarCurrXPBg:setShaderVector( 0, endValue, 0, 0, 0 )
			xpBar.XpBarEarnedXPBg:setShaderVector( 0, endValue, 0, 0, 0 )
			CoD.AARUtility.SetCurrLevelModels( controller, currRank )
			CoD.AARUtility.SetNextLevelModels( controller, currRank + 1 )
			return 
		end
	end
	local singlePromotion = CoD.AARUtility.TestSinglePromotion()
	local multiplePromotions = CoD.AARUtility.TestMultiplePromotions()
	local currRankXP, minXP, maxXP, endValue = nil
	if not useTestData then
		local statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
		if Engine.IsCampaignGame() then
			statsBeforeMatch = CoD.GetPlayerStats( controller )
		end
		currRankXP = statsBeforeMatch.PlayerStatsList.RANK.StatValue:get()
		minXP = statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get()
		local currentStats = CoD.GetPlayerStats( controller )
		endValue = currentStats.PlayerStatsList.RANK.StatValue:get()
		maxXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
	end
	local performanceTabStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpBar = self.XpBarContainer.XpBar
	if useTestData then
		if multiplePromotions then
			currRankXP = 4
			minXP = 20250
			maxXP = 35500
			endValue = 6
		elseif singlePromotion then
			currRankXP = 5
			minXP = 28500
			maxXP = 35500
			endValue = 6
		else
			currRankXP = 5
			minXP = 28500
			maxXP = 31500
			endValue = 5
		end
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "xpEarnedDuringMatch" ), maxXP - minXP )
	end
	local actuallyAnimate = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ) )
	if not actuallyAnimate then
		CoD.AARUtility.SetCurrLevelModels( controller, endValue )
		local nextRank = endValue + 1
		if CoD.MAX_RANK < nextRank then
			nextRank = endValue
		end
		CoD.AARUtility.SetNextLevelModels( controller, nextRank )
		local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( endValue, controller )
		local currXPFrac = (maxXP - minXP) / math.max( 1, maxXP - minXP )
		xpBar.XpBarCurrXPBg:setShaderVector( 0, currXPFrac, 0, 0, 0 )
		xpBar.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
	else
		local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( currRankXP, controller )
		local progressionAtStart = (minXP - minXP) / math.max( 1, maxXP - minXP )
		xpBar.XpBarCurrXPBg:setShaderVector( 0, progressionAtStart, 0, 0, 0 )
		xpBar.XpBarEarnedXPBg:setShaderVector( 0, progressionAtStart, 0, 0, 0 )
		CoD.AARUtility.SetCurrLevelModels( controller, currRankXP )
		CoD.AARUtility.SetNextLevelModels( controller, math.min( CoD.MAX_RANK, currRankXP + 1 ) )
		local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
		Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, maxXP - minXP )
		local delayTimer = LUI.UITimer.new( 1000, "start_xp_bar_animation", true, self )
		self:registerEventHandler( "start_xp_bar_animation", function ()
			f0_local1( controller, self, minXP, currRankXP, endValue, maxXP )
		end )
		self:addElement( delayTimer )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ), false )
	end
end

local PostLoadFunc = function ( self, controller )
	CoD.AARUtility.DoXPBarAnimation( self, controller )
end

local PreLoadFunc = function ( self, controller )
	CoD.AARUtility.SetCurrLevelModels( controller, 1 )
	CoD.AARUtility.SetNextLevelModels( controller, 1 )
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
	self:setTopBottom( true, false, 0, 550 )
	self.anyChildUsesUpdateState = true
	
	local Panel10 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel10:setLeftRight( false, false, -611, -278 )
	Panel10:setTopBottom( false, false, -259, 196.59 )
	Panel10:setRGB( 0.25, 0.25, 0.25 )
	Panel10.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel10 )
	self.Panel10 = Panel10
	
	local Panel20 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel20:setLeftRight( false, false, -274, 166 )
	Panel20:setTopBottom( false, false, -259, 196.59 )
	Panel20:setRGB( 0.25, 0.25, 0.25 )
	Panel20.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel20 )
	self.Panel20 = Panel20
	
	local Panel30 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel30:setLeftRight( false, false, 170, 607.62 )
	Panel30:setTopBottom( false, false, -259, 196.59 )
	Panel30:setRGB( 0.25, 0.25, 0.25 )
	Panel30.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel30 )
	self.Panel30 = Panel30
	
	local Panel40 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel40:setLeftRight( false, false, -611, 607.62 )
	Panel40:setTopBottom( false, false, 198.59, 268 )
	Panel40:setRGB( 0.25, 0.25, 0.25 )
	Panel40.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel40 )
	self.Panel40 = Panel40
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, false, -3, 1277 )
	VignetteBack:setTopBottom( true, false, -97, 623 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local KillsInfo = CoD.ScoreWidget.new( menu, controller )
	KillsInfo:setLeftRight( true, false, 892.96, 1028.96 )
	KillsInfo:setTopBottom( true, false, 36.3, 153.3 )
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
	DeathsInfo:setLeftRight( true, false, 1058, 1194 )
	DeathsInfo:setTopBottom( true, false, 37, 154 )
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
	WinLossRatioWidget:setLeftRight( true, false, 97.5, 289.5 )
	WinLossRatioWidget:setTopBottom( true, false, 231.8, 423.8 )
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
	SPMGraphWidget:setLeftRight( true, false, 392, 776 )
	SPMGraphWidget:setTopBottom( true, false, 233, 444 )
	self:addElement( SPMGraphWidget )
	self.SPMGraphWidget = SPMGraphWidget
	
	local KDRGraphWidget0 = CoD.KDRGraphWidget.new( menu, controller )
	KDRGraphWidget0:setLeftRight( true, false, 836, 1224 )
	KDRGraphWidget0:setTopBottom( true, false, 234, 440 )
	self:addElement( KDRGraphWidget0 )
	self.KDRGraphWidget0 = KDRGraphWidget0
	
	local StartMenuIdentitySubTitle00 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle00:setLeftRight( true, false, 890.96, 950.96 )
	StartMenuIdentitySubTitle00:setTopBottom( true, false, 217.8, 242.8 )
	StartMenuIdentitySubTitle00.SubTitle:setText( Engine.Localize( "MENU_KDRATIO_CAPS" ) )
	StartMenuIdentitySubTitle00.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle00 )
	self.StartMenuIdentitySubTitle00 = StartMenuIdentitySubTitle00
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 53.38, 342 )
	CategoryListLine:setTopBottom( true, false, 192, 200 )
	CategoryListLine:setAlpha( 0.33 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 384, 783.92 )
	CategoryListLine0:setTopBottom( true, false, 192, 200 )
	CategoryListLine0:setAlpha( 0.33 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( true, false, 77, 1196 )
	XpBarContainer:setTopBottom( true, false, 473.59, 537 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local ScoreInfo = CoD.ScoreWidget.new( menu, controller )
	ScoreInfo:setLeftRight( true, false, 449.25, 751.5 )
	ScoreInfo:setTopBottom( true, false, 37.3, 154.3 )
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
	
	local VictoryText = CoD.TitleWidgetSmall.new( menu, controller )
	VictoryText:setLeftRight( true, false, 149.5, 237.5 )
	VictoryText:setTopBottom( true, false, 165.29, 186.29 )
	VictoryText:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "outcome", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VictoryText.SubTitle:setText( modelValue )
		end
	end )
	self:addElement( VictoryText )
	self.VictoryText = VictoryText
	
	local BestWidgetContainer0 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer0:setLeftRight( true, false, 724, 775 )
	BestWidgetContainer0:setTopBottom( true, false, 404.5, 455.5 )
	BestWidgetContainer0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestSPMIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer0.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer0 )
	self.BestWidgetContainer0 = BestWidgetContainer0
	
	local BestWidgetContainer00 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer00:setLeftRight( true, false, 1168.5, 1219.5 )
	BestWidgetContainer00:setTopBottom( true, false, 405.5, 455.5 )
	BestWidgetContainer00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer00.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer00 )
	self.BestWidgetContainer00 = BestWidgetContainer00
	
	local BestWidgetContainer01 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer01:setLeftRight( true, false, 442.46, 493.46 )
	BestWidgetContainer01:setTopBottom( true, false, 66, 116 )
	BestWidgetContainer01:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer01.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer01 )
	self.BestWidgetContainer01 = BestWidgetContainer01
	
	local BestWidgetContainer010 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer010:setLeftRight( true, false, 887.24, 938.24 )
	BestWidgetContainer010:setTopBottom( true, false, 65, 115 )
	BestWidgetContainer010:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKillsIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer010.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer010 )
	self.BestWidgetContainer010 = BestWidgetContainer010
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 131.5, 259.5 )
	GameTypeIcon:setTopBottom( true, false, 19.29, 148.29 )
	GameTypeIcon:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 829, 1228.92 )
	CategoryListLine00:setTopBottom( true, false, 192, 200 )
	CategoryListLine00:setAlpha( 0.33 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local TitleWidget0 = CoD.TitleWidget.new( menu, controller )
	TitleWidget0:setLeftRight( true, false, 61.5, 336.5 )
	TitleWidget0:setTopBottom( true, false, 139.29, 165.29 )
	TitleWidget0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleWidget0 )
	self.TitleWidget0 = TitleWidget0
	
	local StartMenuIdentitySubTitle000 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle000:setLeftRight( true, false, 442.46, 560.46 )
	StartMenuIdentitySubTitle000:setTopBottom( true, false, 217.8, 242.8 )
	StartMenuIdentitySubTitle000.SubTitle:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE_CAPS" ) )
	StartMenuIdentitySubTitle000.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle000 )
	self.StartMenuIdentitySubTitle000 = StartMenuIdentitySubTitle000
	
	local YellowLine = CoD.YellowLine.new( menu, controller )
	YellowLine:setLeftRight( true, false, 748.5, 750.5 )
	YellowLine:setTopBottom( true, false, 283.5, 407.5 )
	YellowLine:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestSPMIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			YellowLine.YellowLine:setAlpha( modelValue )
		end
	end )
	self:addElement( YellowLine )
	self.YellowLine = YellowLine
	
	local YellowLine0 = CoD.YellowLine.new( menu, controller )
	YellowLine0:setLeftRight( true, false, 1193.5, 1195.5 )
	YellowLine0:setTopBottom( true, false, 284.5, 408.5 )
	YellowLine0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			YellowLine0.YellowLine:setAlpha( modelValue )
		end
	end )
	self:addElement( YellowLine0 )
	self.YellowLine0 = YellowLine0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
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
					if not event.interrupted then
						Panel20:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
					end
					Panel20:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel20, event )
					else
						Panel20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
							KDRGraphWidget0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
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
						KDRGraphWidget0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						KDRGraphWidget0:registerEventHandler( "transition_complete_keyframe", KDRGraphWidget0Frame3 )
					end
				end
				
				KDRGraphWidget0:completeAnimation()
				self.KDRGraphWidget0:setAlpha( 0 )
				KDRGraphWidget0Frame2( KDRGraphWidget0, {} )
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
				local GameTypeIconFrame2 = function ( GameTypeIcon, event )
					local GameTypeIconFrame3 = function ( GameTypeIcon, event )
						if not event.interrupted then
							GameTypeIcon:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Bounce )
						end
						GameTypeIcon:setAlpha( 1 )
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
				local CategoryListLine00Frame2 = function ( CategoryListLine00, event )
					if not event.interrupted then
						CategoryListLine00:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					CategoryListLine00:setAlpha( 0.33 )
					if event.interrupted then
						self.clipFinished( CategoryListLine00, event )
					else
						CategoryListLine00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine00:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				CategoryListLine00:setAlpha( 0 )
				CategoryListLine00:registerEventHandler( "transition_complete_keyframe", CategoryListLine00Frame2 )
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
				local StartMenuIdentitySubTitle000Frame2 = function ( StartMenuIdentitySubTitle000, event )
					local StartMenuIdentitySubTitle000Frame3 = function ( StartMenuIdentitySubTitle000, event )
						if not event.interrupted then
							StartMenuIdentitySubTitle000:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						end
						StartMenuIdentitySubTitle000:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( StartMenuIdentitySubTitle000, event )
						else
							StartMenuIdentitySubTitle000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						StartMenuIdentitySubTitle000Frame3( StartMenuIdentitySubTitle000, event )
						return 
					else
						StartMenuIdentitySubTitle000:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						StartMenuIdentitySubTitle000:registerEventHandler( "transition_complete_keyframe", StartMenuIdentitySubTitle000Frame3 )
					end
				end
				
				StartMenuIdentitySubTitle000:completeAnimation()
				self.StartMenuIdentitySubTitle000:setAlpha( 0 )
				StartMenuIdentitySubTitle000Frame2( StartMenuIdentitySubTitle000, {} )
				local YellowLineFrame2 = function ( YellowLine, event )
					local YellowLineFrame3 = function ( YellowLine, event )
						if not event.interrupted then
							YellowLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						YellowLine:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( YellowLine, event )
						else
							YellowLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						YellowLineFrame3( YellowLine, event )
						return 
					else
						YellowLine:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						YellowLine:registerEventHandler( "transition_complete_keyframe", YellowLineFrame3 )
					end
				end
				
				YellowLine:completeAnimation()
				self.YellowLine:setAlpha( 0 )
				YellowLineFrame2( YellowLine, {} )
				local YellowLine0Frame2 = function ( YellowLine0, event )
					local YellowLine0Frame3 = function ( YellowLine0, event )
						if not event.interrupted then
							YellowLine0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						YellowLine0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( YellowLine0, event )
						else
							YellowLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						YellowLine0Frame3( YellowLine0, event )
						return 
					else
						YellowLine0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						YellowLine0:registerEventHandler( "transition_complete_keyframe", YellowLine0Frame3 )
					end
				end
				
				YellowLine0:completeAnimation()
				self.YellowLine0:setAlpha( 0 )
				YellowLine0Frame2( YellowLine0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel10:close()
		self.Panel20:close()
		self.Panel30:close()
		self.Panel40:close()
		self.VignetteBack:close()
		self.KillsInfo:close()
		self.DeathsInfo:close()
		self.WinLossRatioWidget:close()
		self.SPMGraphWidget:close()
		self.KDRGraphWidget0:close()
		self.StartMenuIdentitySubTitle00:close()
		self.XpBarContainer:close()
		self.ScoreInfo:close()
		self.VictoryText:close()
		self.BestWidgetContainer0:close()
		self.BestWidgetContainer00:close()
		self.BestWidgetContainer01:close()
		self.BestWidgetContainer010:close()
		self.TitleWidget0:close()
		self.StartMenuIdentitySubTitle000:close()
		self.YellowLine:close()
		self.YellowLine0:close()
		self.GameTypeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

