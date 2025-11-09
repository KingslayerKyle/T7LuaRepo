require( "ui.uieditor.widgets.Common.common_PanelBox01" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.WinLossRatioWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.YellowLine" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.SPMGraphWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.KDRGraphWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidgetSmall" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.AARUtility.DoXPBarAnimation( f1_arg0, f1_arg1 )
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
	
	local commonPanelBox01 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox01:setLeftRight( true, false, 34, 360 )
	commonPanelBox01:setTopBottom( true, false, 12, 463 )
	commonPanelBox01.Backing:setAlpha( 0.05 )
	commonPanelBox01.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox01 )
	self.commonPanelBox01 = commonPanelBox01
	
	local commonPanelBox02 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox02:setLeftRight( true, false, 370, 803 )
	commonPanelBox02:setTopBottom( true, false, 12, 463 )
	commonPanelBox02.Backing:setAlpha( 0.05 )
	commonPanelBox02.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox02 )
	self.commonPanelBox02 = commonPanelBox02
	
	local commonPanelBox03 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox03:setLeftRight( true, false, 813, 1246 )
	commonPanelBox03:setTopBottom( true, false, 12, 463 )
	commonPanelBox03.Backing:setAlpha( 0.05 )
	commonPanelBox03.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox03 )
	self.commonPanelBox03 = commonPanelBox03
	
	local commonPanelBox04 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox04:setLeftRight( true, false, 33, 1246 )
	commonPanelBox04:setTopBottom( true, false, 466.59, 534 )
	commonPanelBox04.Backing:setAlpha( 0.25 )
	commonPanelBox04.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox04 )
	self.commonPanelBox04 = commonPanelBox04
	
	local KillsInfo = CoD.ScoreWidget.new( menu, controller )
	KillsInfo:setLeftRight( true, false, 885.96, 1021.96 )
	KillsInfo:setTopBottom( true, false, 40.3, 157.3 )
	KillsInfo.ScoreLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	KillsInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	KillsInfo:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "kills", function ( model )
		local kills = Engine.GetModelValue( model )
		if kills then
			KillsInfo.Score.Numbers:setText( Engine.Localize( kills ) )
		end
	end )
	self:addElement( KillsInfo )
	self.KillsInfo = KillsInfo
	
	local DeathsInfo = CoD.ScoreWidget.new( menu, controller )
	DeathsInfo:setLeftRight( true, false, 1051, 1187 )
	DeathsInfo:setTopBottom( true, false, 41, 158 )
	DeathsInfo.ScoreLabel:setText( Engine.Localize( "MPUI_DEATHS_CAPS" ) )
	DeathsInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_DEATHS_CAPS" ) )
	DeathsInfo:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "deaths", function ( model )
		local deaths = Engine.GetModelValue( model )
		if deaths then
			DeathsInfo.Score.Numbers:setText( Engine.Localize( deaths ) )
		end
	end )
	self:addElement( DeathsInfo )
	self.DeathsInfo = DeathsInfo
	
	local WinLossRatioWidget = CoD.WinLossRatioWidget.new( menu, controller )
	WinLossRatioWidget:setLeftRight( true, false, 97.5, 289.5 )
	WinLossRatioWidget:setTopBottom( true, false, 232.8, 424.8 )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "wins", function ( model )
		local wins = Engine.GetModelValue( model )
		if wins then
			WinLossRatioWidget.TotalWins:setText( Engine.Localize( wins ) )
		end
	end )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "losses", function ( model )
		local losses = Engine.GetModelValue( model )
		if losses then
			WinLossRatioWidget.TotalLosses:setText( Engine.Localize( losses ) )
		end
	end )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "lossesRingClockFrac", function ( model )
		local lossesRingClockFrac = Engine.GetModelValue( model )
		if lossesRingClockFrac then
			WinLossRatioWidget.LossesRing:setShaderVector( 0, CoD.GetVectorComponentFromString( lossesRingClockFrac, 1 ), CoD.GetVectorComponentFromString( lossesRingClockFrac, 2 ), CoD.GetVectorComponentFromString( lossesRingClockFrac, 3 ), CoD.GetVectorComponentFromString( lossesRingClockFrac, 4 ) )
		end
	end )
	WinLossRatioWidget:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "winLossRatio", function ( model )
		local winLossRatio = Engine.GetModelValue( model )
		if winLossRatio then
			WinLossRatioWidget.WinLossRatio:setText( Engine.Localize( winLossRatio ) )
		end
	end )
	self:addElement( WinLossRatioWidget )
	self.WinLossRatioWidget = WinLossRatioWidget
	
	local YellowLine = CoD.YellowLine.new( menu, controller )
	YellowLine:setLeftRight( true, false, 741.5, 743.5 )
	YellowLine:setTopBottom( true, false, 284.5, 408.5 )
	YellowLine:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestSPMIcon", function ( model )
		local showBestSPMIcon = Engine.GetModelValue( model )
		if showBestSPMIcon then
			YellowLine.YellowLine:setAlpha( showBestSPMIcon )
		end
	end )
	self:addElement( YellowLine )
	self.YellowLine = YellowLine
	
	local YellowLine0 = CoD.YellowLine.new( menu, controller )
	YellowLine0:setLeftRight( true, false, 1186.5, 1188.5 )
	YellowLine0:setTopBottom( true, false, 285.5, 409.5 )
	YellowLine0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local showBestKDRIcon = Engine.GetModelValue( model )
		if showBestKDRIcon then
			YellowLine0.YellowLine:setAlpha( showBestKDRIcon )
		end
	end )
	self:addElement( YellowLine0 )
	self.YellowLine0 = YellowLine0
	
	local SPMGraphWidget = CoD.SPMGraphWidget.new( menu, controller )
	SPMGraphWidget:setLeftRight( true, false, 385, 769 )
	SPMGraphWidget:setTopBottom( true, false, 234, 445 )
	self:addElement( SPMGraphWidget )
	self.SPMGraphWidget = SPMGraphWidget
	
	local KDRGraphWidget0 = CoD.KDRGraphWidget.new( menu, controller )
	KDRGraphWidget0:setLeftRight( true, false, 829, 1217 )
	KDRGraphWidget0:setTopBottom( true, false, 235, 441 )
	self:addElement( KDRGraphWidget0 )
	self.KDRGraphWidget0 = KDRGraphWidget0
	
	local StartMenuIdentitySubTitle00 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle00:setLeftRight( true, false, 883.96, 943.96 )
	StartMenuIdentitySubTitle00:setTopBottom( true, false, 218.8, 243.8 )
	StartMenuIdentitySubTitle00.SubTitle:setText( Engine.Localize( "MENU_KDRATIO_CAPS" ) )
	StartMenuIdentitySubTitle00.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle00 )
	self.StartMenuIdentitySubTitle00 = StartMenuIdentitySubTitle00
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 50, 344 )
	CategoryListLine:setTopBottom( true, false, 205, 213 )
	CategoryListLine:setAlpha( 0.15 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 386, 787 )
	CategoryListLine0:setTopBottom( true, false, 205, 213 )
	CategoryListLine0:setAlpha( 0.15 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( true, false, 89.5, 1196 )
	XpBarContainer:setTopBottom( true, false, 466.59, 530 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( GetAARXpEarned( controller, "XP Earned: 0" ) ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( GetAARXPNextLevel( controller, "Next Level: 43600 XP Needed" ) ) )
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local ScoreInfo = CoD.ScoreWidget.new( menu, controller )
	ScoreInfo:setLeftRight( true, false, 442.25, 744.5 )
	ScoreInfo:setTopBottom( true, false, 41.3, 158.3 )
	ScoreInfo.ScoreLabel:setText( Engine.Localize( "MPUI_SCORE_CAPS" ) )
	ScoreInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_SCORE_CAPS" ) )
	ScoreInfo:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			ScoreInfo.Score.Numbers:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( ScoreInfo )
	self.ScoreInfo = ScoreInfo
	
	local VictoryText = CoD.TitleWidgetSmall.new( menu, controller )
	VictoryText:setLeftRight( true, false, 154, 242 )
	VictoryText:setTopBottom( true, false, 173.29, 194.29 )
	VictoryText:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "outcome", function ( model )
		local outcome = Engine.GetModelValue( model )
		if outcome then
			VictoryText.SubTitle:setText( outcome )
		end
	end )
	self:addElement( VictoryText )
	self.VictoryText = VictoryText
	
	local BestWidgetContainer0 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer0:setLeftRight( true, false, 717, 768 )
	BestWidgetContainer0:setTopBottom( true, false, 405.5, 456.5 )
	BestWidgetContainer0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestSPMIcon", function ( model )
		local showBestSPMIcon = Engine.GetModelValue( model )
		if showBestSPMIcon then
			BestWidgetContainer0.BestIconForKDR:setAlpha( showBestSPMIcon )
		end
	end )
	self:addElement( BestWidgetContainer0 )
	self.BestWidgetContainer0 = BestWidgetContainer0
	
	local BestWidgetContainer00 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer00:setLeftRight( true, false, 1161.5, 1212.5 )
	BestWidgetContainer00:setTopBottom( true, false, 406.5, 456.5 )
	BestWidgetContainer00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local showBestKDRIcon = Engine.GetModelValue( model )
		if showBestKDRIcon then
			BestWidgetContainer00.BestIconForKDR:setAlpha( showBestKDRIcon )
		end
	end )
	self:addElement( BestWidgetContainer00 )
	self.BestWidgetContainer00 = BestWidgetContainer00
	
	local BestWidgetContainer01 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer01:setLeftRight( true, false, 435.46, 486.46 )
	BestWidgetContainer01:setTopBottom( true, false, 70, 120 )
	BestWidgetContainer01:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local showBestScoreIcon = Engine.GetModelValue( model )
		if showBestScoreIcon then
			BestWidgetContainer01.BestIconForKDR:setAlpha( showBestScoreIcon )
		end
	end )
	self:addElement( BestWidgetContainer01 )
	self.BestWidgetContainer01 = BestWidgetContainer01
	
	local BestWidgetContainer010 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer010:setLeftRight( true, false, 880.24, 931.24 )
	BestWidgetContainer010:setTopBottom( true, false, 69, 119 )
	BestWidgetContainer010:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKillsIcon", function ( model )
		local showBestKillsIcon = Engine.GetModelValue( model )
		if showBestKillsIcon then
			BestWidgetContainer010.BestIconForKDR:setAlpha( showBestKillsIcon )
		end
	end )
	self:addElement( BestWidgetContainer010 )
	self.BestWidgetContainer010 = BestWidgetContainer010
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 131.5, 259.5 )
	GameTypeIcon:setTopBottom( true, false, 23.29, 152.29 )
	GameTypeIcon:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeIcon", function ( model )
		local gameTypeIcon = Engine.GetModelValue( model )
		if gameTypeIcon then
			GameTypeIcon:setImage( RegisterImage( gameTypeIcon ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 829, 1230 )
	CategoryListLine00:setTopBottom( true, false, 205, 213 )
	CategoryListLine00:setAlpha( 0.15 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local TitleWidget0 = CoD.TitleWidget.new( menu, controller )
	TitleWidget0:setLeftRight( true, false, 61.5, 336.5 )
	TitleWidget0:setTopBottom( true, false, 143.29, 169.29 )
	TitleWidget0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeName", function ( model )
		local gameTypeName = Engine.GetModelValue( model )
		if gameTypeName then
			TitleWidget0.weaponNameLabel:setText( Engine.Localize( gameTypeName ) )
		end
	end )
	self:addElement( TitleWidget0 )
	self.TitleWidget0 = TitleWidget0
	
	local StartMenuIdentitySubTitle000 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle000:setLeftRight( true, false, 435.46, 553.46 )
	StartMenuIdentitySubTitle000:setTopBottom( true, false, 218.8, 243.8 )
	StartMenuIdentitySubTitle000.SubTitle:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE_CAPS" ) )
	StartMenuIdentitySubTitle000.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle000 )
	self.StartMenuIdentitySubTitle000 = StartMenuIdentitySubTitle000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 25 )
				local commonPanelBox01Frame2 = function ( commonPanelBox01, event )
					if not event.interrupted then
						commonPanelBox01:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					commonPanelBox01:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( commonPanelBox01, event )
					else
						commonPanelBox01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				commonPanelBox01:completeAnimation()
				self.commonPanelBox01:setAlpha( 0 )
				commonPanelBox01Frame2( commonPanelBox01, {} )
				local commonPanelBox02Frame2 = function ( commonPanelBox02, event )
					if not event.interrupted then
						commonPanelBox02:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
					end
					commonPanelBox02:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( commonPanelBox02, event )
					else
						commonPanelBox02:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				commonPanelBox02:completeAnimation()
				self.commonPanelBox02:setAlpha( 0 )
				commonPanelBox02Frame2( commonPanelBox02, {} )
				local commonPanelBox03Frame2 = function ( commonPanelBox03, event )
					local commonPanelBox03Frame3 = function ( commonPanelBox03, event )
						if not event.interrupted then
							commonPanelBox03:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						commonPanelBox03:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( commonPanelBox03, event )
						else
							commonPanelBox03:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						commonPanelBox03Frame3( commonPanelBox03, event )
						return 
					else
						commonPanelBox03:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						commonPanelBox03:registerEventHandler( "transition_complete_keyframe", commonPanelBox03Frame3 )
					end
				end
				
				commonPanelBox03:completeAnimation()
				self.commonPanelBox03:setAlpha( 0 )
				commonPanelBox03Frame2( commonPanelBox03, {} )
				local commonPanelBox04Frame2 = function ( commonPanelBox04, event )
					local commonPanelBox04Frame3 = function ( commonPanelBox04, event )
						if not event.interrupted then
							commonPanelBox04:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						commonPanelBox04:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( commonPanelBox04, event )
						else
							commonPanelBox04:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						commonPanelBox04Frame3( commonPanelBox04, event )
						return 
					else
						commonPanelBox04:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						commonPanelBox04:registerEventHandler( "transition_complete_keyframe", commonPanelBox04Frame3 )
					end
				end
				
				commonPanelBox04:completeAnimation()
				self.commonPanelBox04:setAlpha( 0 )
				commonPanelBox04Frame2( commonPanelBox04, {} )
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
				local f21_local22 = function ( f64_arg0, f64_arg1 )
					if not f64_arg1.interrupted then
						f64_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					f64_arg0:setAlpha( 0.33 )
					if f64_arg1.interrupted then
						self.clipFinished( f64_arg0, f64_arg1 )
					else
						f64_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine00:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				CategoryListLine00:setAlpha( 0 )
				CategoryListLine00:registerEventHandler( "transition_complete_keyframe", f21_local22 )
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
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.commonPanelBox01:close()
		element.commonPanelBox02:close()
		element.commonPanelBox03:close()
		element.commonPanelBox04:close()
		element.KillsInfo:close()
		element.DeathsInfo:close()
		element.WinLossRatioWidget:close()
		element.YellowLine:close()
		element.YellowLine0:close()
		element.SPMGraphWidget:close()
		element.KDRGraphWidget0:close()
		element.StartMenuIdentitySubTitle00:close()
		element.XpBarContainer:close()
		element.ScoreInfo:close()
		element.VictoryText:close()
		element.BestWidgetContainer0:close()
		element.BestWidgetContainer00:close()
		element.BestWidgetContainer01:close()
		element.BestWidgetContainer010:close()
		element.TitleWidget0:close()
		element.StartMenuIdentitySubTitle000:close()
		element.GameTypeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

