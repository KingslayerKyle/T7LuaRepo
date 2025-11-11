require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.KDRGraphWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.SPMGraphWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidgetSmall" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.WinLossRatioWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.YellowLine" )
require( "ui.uieditor.widgets.Common.common_PanelBox01" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 825 )
	self.anyChildUsesUpdateState = true
	
	local commonPanelBox01 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox01:setLeftRight( 0, 0, 51, 540 )
	commonPanelBox01:setTopBottom( 0, 0, 18, 694 )
	commonPanelBox01.Backing:setAlpha( 0.05 )
	commonPanelBox01.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox01 )
	self.commonPanelBox01 = commonPanelBox01
	
	local commonPanelBox02 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox02:setLeftRight( 0, 0, 555, 1205 )
	commonPanelBox02:setTopBottom( 0, 0, 18, 694 )
	commonPanelBox02.Backing:setAlpha( 0.05 )
	commonPanelBox02.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox02 )
	self.commonPanelBox02 = commonPanelBox02
	
	local commonPanelBox03 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox03:setLeftRight( 0, 0, 1219, 1869 )
	commonPanelBox03:setTopBottom( 0, 0, 18, 694 )
	commonPanelBox03.Backing:setAlpha( 0.05 )
	commonPanelBox03.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox03 )
	self.commonPanelBox03 = commonPanelBox03
	
	local commonPanelBox04 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox04:setLeftRight( 0, 0, 49, 1869 )
	commonPanelBox04:setTopBottom( 0, 0, 700, 801 )
	commonPanelBox04.Backing:setAlpha( 0.25 )
	commonPanelBox04.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox04 )
	self.commonPanelBox04 = commonPanelBox04
	
	local KillsInfo = CoD.ScoreWidget.new( menu, controller )
	KillsInfo:setLeftRight( 0, 0, 1329, 1533 )
	KillsInfo:setTopBottom( 0, 0, 60, 236 )
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
	DeathsInfo:setLeftRight( 0, 0, 1576, 1780 )
	DeathsInfo:setTopBottom( 0, 0, 61, 237 )
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
	WinLossRatioWidget:setLeftRight( 0, 0, 146, 434 )
	WinLossRatioWidget:setTopBottom( 0, 0, 349, 637 )
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
	
	local YellowLine = CoD.YellowLine.new( menu, controller )
	YellowLine:setLeftRight( 0, 0, 1112.5, 1115.5 )
	YellowLine:setTopBottom( 0, 0, 427, 613 )
	YellowLine:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestSPMIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			YellowLine.YellowLine:setAlpha( modelValue )
		end
	end )
	self:addElement( YellowLine )
	self.YellowLine = YellowLine
	
	local YellowLine0 = CoD.YellowLine.new( menu, controller )
	YellowLine0:setLeftRight( 0, 0, 1779.5, 1782.5 )
	YellowLine0:setTopBottom( 0, 0, 428, 614 )
	YellowLine0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			YellowLine0.YellowLine:setAlpha( modelValue )
		end
	end )
	self:addElement( YellowLine0 )
	self.YellowLine0 = YellowLine0
	
	local SPMGraphWidget = CoD.SPMGraphWidget.new( menu, controller )
	SPMGraphWidget:setLeftRight( 0, 0, 578, 1154 )
	SPMGraphWidget:setTopBottom( 0, 0, 351, 667 )
	self:addElement( SPMGraphWidget )
	self.SPMGraphWidget = SPMGraphWidget
	
	local KDRGraphWidget0 = CoD.KDRGraphWidget.new( menu, controller )
	KDRGraphWidget0:setLeftRight( 0, 0, 1243, 1825 )
	KDRGraphWidget0:setTopBottom( 0, 0, 352.5, 661.5 )
	self:addElement( KDRGraphWidget0 )
	self.KDRGraphWidget0 = KDRGraphWidget0
	
	local StartMenuIdentitySubTitle00 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle00:setLeftRight( 0, 0, 1326, 1416 )
	StartMenuIdentitySubTitle00:setTopBottom( 0, 0, 328, 366 )
	StartMenuIdentitySubTitle00.SubTitle:setText( Engine.Localize( "MENU_KDRATIO_CAPS" ) )
	StartMenuIdentitySubTitle00.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle00 )
	self.StartMenuIdentitySubTitle00 = StartMenuIdentitySubTitle00
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 75, 516 )
	CategoryListLine:setTopBottom( 0, 0, 308, 320 )
	CategoryListLine:setAlpha( 0.15 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, 579, 1181 )
	CategoryListLine0:setTopBottom( 0, 0, 308, 320 )
	CategoryListLine0:setAlpha( 0.15 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( 0, 0, 134, 1794 )
	XpBarContainer:setTopBottom( 0, 0, 700, 795 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local ScoreInfo = CoD.ScoreWidget.new( menu, controller )
	ScoreInfo:setLeftRight( 0, 0, 664, 1117 )
	ScoreInfo:setTopBottom( 0, 0, 62, 238 )
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
	VictoryText:setLeftRight( 0, 0, 231, 363 )
	VictoryText:setTopBottom( 0, 0, 260, 292 )
	VictoryText:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "outcome", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VictoryText.SubTitle:setText( modelValue )
		end
	end )
	self:addElement( VictoryText )
	self.VictoryText = VictoryText
	
	local BestWidgetContainer0 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer0:setLeftRight( 0, 0, 1076, 1152 )
	BestWidgetContainer0:setTopBottom( 0, 0, 608, 684 )
	BestWidgetContainer0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestSPMIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer0.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer0 )
	self.BestWidgetContainer0 = BestWidgetContainer0
	
	local BestWidgetContainer00 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer00:setLeftRight( 0, 0, 1742, 1818 )
	BestWidgetContainer00:setTopBottom( 0, 0, 609.5, 684.5 )
	BestWidgetContainer00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer00.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer00 )
	self.BestWidgetContainer00 = BestWidgetContainer00
	
	local BestWidgetContainer01 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer01:setLeftRight( 0, 0, 653, 729 )
	BestWidgetContainer01:setTopBottom( 0, 0, 104.5, 179.5 )
	BestWidgetContainer01:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer01.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer01 )
	self.BestWidgetContainer01 = BestWidgetContainer01
	
	local BestWidgetContainer010 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer010:setLeftRight( 0, 0, 1321, 1397 )
	BestWidgetContainer010:setTopBottom( 0, 0, 103.5, 178.5 )
	BestWidgetContainer010:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKillsIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer010.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer010 )
	self.BestWidgetContainer010 = BestWidgetContainer010
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( 0, 0, 197, 389 )
	GameTypeIcon:setTopBottom( 0, 0, 35, 229 )
	GameTypeIcon:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( 0, 0, 1243, 1845 )
	CategoryListLine00:setTopBottom( 0, 0, 308, 320 )
	CategoryListLine00:setAlpha( 0.15 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local TitleWidget0 = CoD.TitleWidget.new( menu, controller )
	TitleWidget0:setLeftRight( 0, 0, 92, 504 )
	TitleWidget0:setTopBottom( 0, 0, 215, 254 )
	TitleWidget0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "gameTypeName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleWidget0 )
	self.TitleWidget0 = TitleWidget0
	
	local StartMenuIdentitySubTitle000 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle000:setLeftRight( 0, 0, 653, 830 )
	StartMenuIdentitySubTitle000:setTopBottom( 0, 0, 328, 366 )
	StartMenuIdentitySubTitle000.SubTitle:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE_CAPS" ) )
	StartMenuIdentitySubTitle000.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle000 )
	self.StartMenuIdentitySubTitle000 = StartMenuIdentitySubTitle000
	
	self.resetProperties = function ()
		VictoryText:completeAnimation()
		XpBarContainer:completeAnimation()
		TitleWidget0:completeAnimation()
		CategoryListLine0:completeAnimation()
		CategoryListLine:completeAnimation()
		StartMenuIdentitySubTitle00:completeAnimation()
		KDRGraphWidget0:completeAnimation()
		SPMGraphWidget:completeAnimation()
		WinLossRatioWidget:completeAnimation()
		DeathsInfo:completeAnimation()
		KillsInfo:completeAnimation()
		ScoreInfo:completeAnimation()
		GameTypeIcon:completeAnimation()
		BestWidgetContainer010:completeAnimation()
		BestWidgetContainer01:completeAnimation()
		BestWidgetContainer00:completeAnimation()
		BestWidgetContainer0:completeAnimation()
		StartMenuIdentitySubTitle000:completeAnimation()
		YellowLine:completeAnimation()
		YellowLine0:completeAnimation()
		commonPanelBox01:completeAnimation()
		commonPanelBox02:completeAnimation()
		commonPanelBox03:completeAnimation()
		commonPanelBox04:completeAnimation()
		CategoryListLine00:completeAnimation()
		VictoryText:setAlpha( 1 )
		XpBarContainer:setAlpha( 1 )
		TitleWidget0:setAlpha( 1 )
		CategoryListLine0:setAlpha( 0.15 )
		CategoryListLine:setAlpha( 0.15 )
		StartMenuIdentitySubTitle00:setAlpha( 1 )
		KDRGraphWidget0:setAlpha( 1 )
		SPMGraphWidget:setAlpha( 1 )
		WinLossRatioWidget:setAlpha( 1 )
		DeathsInfo:setAlpha( 1 )
		KillsInfo:setAlpha( 1 )
		ScoreInfo:setAlpha( 1 )
		GameTypeIcon:setAlpha( 1 )
		BestWidgetContainer010:setAlpha( 1 )
		BestWidgetContainer01:setAlpha( 1 )
		BestWidgetContainer00:setAlpha( 1 )
		BestWidgetContainer0:setAlpha( 1 )
		StartMenuIdentitySubTitle000:setAlpha( 1 )
		YellowLine:setAlpha( 1 )
		YellowLine0:setAlpha( 1 )
		commonPanelBox01:setAlpha( 1 )
		commonPanelBox02:setAlpha( 1 )
		commonPanelBox03:setAlpha( 1 )
		commonPanelBox04:setAlpha( 1 )
		CategoryListLine00:setAlpha( 0.15 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.commonPanelBox01:close()
		self.commonPanelBox02:close()
		self.commonPanelBox03:close()
		self.commonPanelBox04:close()
		self.KillsInfo:close()
		self.DeathsInfo:close()
		self.WinLossRatioWidget:close()
		self.YellowLine:close()
		self.YellowLine0:close()
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
		self.GameTypeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

