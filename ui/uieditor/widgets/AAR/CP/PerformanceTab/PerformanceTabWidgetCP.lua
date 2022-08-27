-- bb4e820833c000cd114a5fcf32720a0d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_PerformanceCollectible" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtility.SetCurrLevelModels( controller, 1 )
	CoD.AARUtility.SetNextLevelModels( controller, 1 )
end

local PostLoadFunc = function ( self, controller, menu )
	CoD.AARUtility.DoXPBarAnimation( self, controller )
end

CoD.PerformanceTabWidgetCP = InheritFrom( LUI.UIElement )
CoD.PerformanceTabWidgetCP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerformanceTabWidgetCP )
	self.id = "PerformanceTabWidgetCP"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 526 )
	self.anyChildUsesUpdateState = true
	
	local Panel10 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel10:setLeftRight( true, false, -14, 374.38 )
	Panel10:setTopBottom( false, false, -265.13, 190.46 )
	Panel10:setRGB( 0.25, 0.25, 0.25 )
	Panel10.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel10 )
	self.Panel10 = Panel10
	
	local Panel20 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel20:setLeftRight( true, false, 377, 772.38 )
	Panel20:setTopBottom( false, false, -265.13, 190.46 )
	Panel20:setRGB( 0.25, 0.25, 0.25 )
	Panel20.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel20 )
	self.Panel20 = Panel20
	
	local Panel30 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel30:setLeftRight( true, false, 775, 1162.62 )
	Panel30:setTopBottom( false, false, -265.13, 190.46 )
	Panel30:setRGB( 0.25, 0.25, 0.25 )
	Panel30.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel30 )
	self.Panel30 = Panel30
	
	local Panel40 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel40:setLeftRight( false, false, -631, 587.62 )
	Panel40:setTopBottom( false, false, 191.58, 257.99 )
	Panel40:setRGB( 0.25, 0.25, 0.25 )
	Panel40.PanelAmmo0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel40 )
	self.Panel40 = Panel40
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, true, -65, 65 )
	VignetteBack:setTopBottom( true, false, -84.5, 635.5 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 5, 363 )
	CategoryListLine:setTopBottom( true, false, 262.3, 270.87 )
	CategoryListLine:setAlpha( 0.33 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 393, 755 )
	CategoryListLine0:setTopBottom( true, false, 262.3, 270.87 )
	CategoryListLine0:setAlpha( 0.33 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( true, false, 50, 1092.62 )
	XpBarContainer:setTopBottom( true, false, 456.79, 511 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local DifficultyImage = LUI.UIImage.new()
	DifficultyImage:setLeftRight( true, false, 113.78, 227.84 )
	DifficultyImage:setTopBottom( true, false, 322.3, 436.89 )
	DifficultyImage:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "difficulty", function ( model )
		local difficulty = Engine.GetModelValue( model )
		if difficulty then
			DifficultyImage:setImage( RegisterImage( DifficultyIconFromNumber( difficulty ) ) )
		end
	end )
	self:addElement( DifficultyImage )
	self.DifficultyImage = DifficultyImage
	
	local Kills = CoD.ScoreWidget.new( menu, controller )
	Kills:setLeftRight( true, false, 426, 562.77 )
	Kills:setTopBottom( true, false, 96.3, 225.66 )
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
	Assists:setLeftRight( true, false, 589.23, 726 )
	Assists:setTopBottom( true, false, 96.3, 225.66 )
	Assists.ScoreLabel:setText( Engine.Localize( "MPUI_ASSISTS_CAPS" ) )
	Assists.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_ASSISTS_CAPS" ) )
	Assists:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "assists", function ( model )
		local assists = Engine.GetModelValue( model )
		if assists then
			Assists.Score.Numbers:setText( Engine.Localize( assists ) )
		end
	end )
	self:addElement( Assists )
	self.Assists = Assists
	
	local BestCompletionTime = CoD.BestWidgetContainer.new( menu, controller )
	BestCompletionTime:setLeftRight( true, false, 108.78, 159.78 )
	BestCompletionTime:setTopBottom( true, false, 319.3, 369.87 )
	BestCompletionTime:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestDifficultyIcon", function ( model )
		local showBestDifficultyIcon = Engine.GetModelValue( model )
		if showBestDifficultyIcon then
			BestCompletionTime:setAlpha( showBestDifficultyIcon )
		end
	end )
	BestCompletionTime:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local showBestScoreIcon = Engine.GetModelValue( model )
		if showBestScoreIcon then
			BestCompletionTime.BestIconForKDR:setAlpha( showBestScoreIcon )
		end
	end )
	self:addElement( BestCompletionTime )
	self.BestCompletionTime = BestCompletionTime
	
	local Incaps = CoD.ScoreWidget.new( menu, controller )
	Incaps:setLeftRight( true, false, 589.23, 726 )
	Incaps:setTopBottom( true, false, 299.58, 427.44 )
	Incaps.ScoreLabel:setText( Engine.Localize( "MENU_INCAPS_CAPS" ) )
	Incaps.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_INCAPS_CAPS" ) )
	Incaps:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "incaps", function ( model )
		local incaps = Engine.GetModelValue( model )
		if incaps then
			Incaps.Score.Numbers:setText( Engine.Localize( incaps ) )
		end
	end )
	self:addElement( Incaps )
	self.Incaps = Incaps
	
	local Revives = CoD.ScoreWidget.new( menu, controller )
	Revives:setLeftRight( true, false, 426, 562.77 )
	Revives:setTopBottom( true, false, 299.58, 427.44 )
	Revives.ScoreLabel:setText( Engine.Localize( "MPUI_REVIVES_CAPS" ) )
	Revives.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_REVIVES_CAPS" ) )
	Revives:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "revives", function ( model )
		local revives = Engine.GetModelValue( model )
		if revives then
			Revives.Score.Numbers:setText( Engine.Localize( revives ) )
		end
	end )
	self:addElement( Revives )
	self.Revives = Revives
	
	local BestKills = CoD.BestWidgetContainer.new( menu, controller )
	BestKills:setLeftRight( true, false, 420.89, 471.89 )
	BestKills:setTopBottom( true, false, 124.8, 175.37 )
	BestKills:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKillsIcon", function ( model )
		local showBestKillsIcon = Engine.GetModelValue( model )
		if showBestKillsIcon then
			BestKills.BestIconForKDR:setAlpha( showBestKillsIcon )
		end
	end )
	self:addElement( BestKills )
	self.BestKills = BestKills
	
	local Collectibles = LUI.GridLayout.new( menu, controller, false, 0, 0, 7, 0, nil, nil, false, false, 0, 0, false, false )
	Collectibles:setLeftRight( true, false, 865.31, 1082.31 )
	Collectibles:setTopBottom( true, false, 128.44, 427.44 )
	Collectibles:setDataSource( "CollectiblesListAAR" )
	Collectibles:setWidgetType( CoD.MissionRecordVault_PerformanceCollectible )
	Collectibles:setHorizontalCount( 2 )
	Collectibles:setVerticalCount( 3 )
	Collectibles:setSpacing( 7 )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local BestAssists = CoD.BestWidgetContainer.new( menu, controller )
	BestAssists:setLeftRight( true, false, 584.12, 635.12 )
	BestAssists:setTopBottom( true, false, 124.8, 175.37 )
	BestAssists:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestAssistsIcon", function ( model )
		local showBestAssistsIcon = Engine.GetModelValue( model )
		if showBestAssistsIcon then
			BestAssists.BestIconForKDR:setAlpha( showBestAssistsIcon )
		end
	end )
	self:addElement( BestAssists )
	self.BestAssists = BestAssists
	
	local BestIncaps = CoD.BestWidgetContainer.new( menu, controller )
	BestIncaps:setLeftRight( true, false, 583.23, 634.23 )
	BestIncaps:setTopBottom( true, false, 328.5, 379.06 )
	BestIncaps:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestIncapsIcon", function ( model )
		local showBestIncapsIcon = Engine.GetModelValue( model )
		if showBestIncapsIcon then
			BestIncaps.BestIconForKDR:setAlpha( showBestIncapsIcon )
		end
	end )
	self:addElement( BestIncaps )
	self.BestIncaps = BestIncaps
	
	local BestRevives = CoD.BestWidgetContainer.new( menu, controller )
	BestRevives:setLeftRight( true, false, 420, 471 )
	BestRevives:setTopBottom( true, false, 328.5, 379.06 )
	BestRevives:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestRevivesIcon", function ( model )
		local showBestRevivesIcon = Engine.GetModelValue( model )
		if showBestRevivesIcon then
			BestRevives.BestIconForKDR:setAlpha( showBestRevivesIcon )
		end
	end )
	self:addElement( BestRevives )
	self.BestRevives = BestRevives
	
	local Kills0 = CoD.ScoreWidget.new( menu, controller )
	Kills0:setLeftRight( true, false, 50, 303.77 )
	Kills0:setTopBottom( true, false, 96, 225.66 )
	Kills0.ScoreLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Kills0.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Kills0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			Kills0.Score.Numbers:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( Kills0 )
	self.Kills0 = Kills0
	
	local BestWidgetContainer0 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer0:setLeftRight( true, false, 43.65, 94.65 )
	BestWidgetContainer0:setTopBottom( true, false, 126.8, 177.37 )
	BestWidgetContainer0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local showBestScoreIcon = Engine.GetModelValue( model )
		if showBestScoreIcon then
			BestWidgetContainer0.BestIconForKDR:setAlpha( showBestScoreIcon )
		end
	end )
	self:addElement( BestWidgetContainer0 )
	self.BestWidgetContainer0 = BestWidgetContainer0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 865.31, 1082.31 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, 93, 119 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local StartMenuIdentitySubTitle00 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle00:setLeftRight( true, false, 50, 147.63 )
	StartMenuIdentitySubTitle00:setTopBottom( true, false, 296, 322.56 )
	StartMenuIdentitySubTitle00.SubTitle:setText( Engine.Localize( "MENU_DIFFICULTY_CAPS" ) )
	StartMenuIdentitySubTitle00.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle00 )
	self.StartMenuIdentitySubTitle00 = StartMenuIdentitySubTitle00
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, false, -76.14, 469.86 )
	TitleBG:setTopBottom( true, false, 5, 75 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Subtitle = LUI.UITightText.new()
	Subtitle:setLeftRight( true, false, 9.86, 299.86 )
	Subtitle:setTopBottom( true, false, 50, 68 )
	Subtitle:setAlpha( 0.5 )
	Subtitle:setText( Engine.Localize( "MENU_MISSION_OVERVIEW_CAP" ) )
	Subtitle:setTTF( "fonts/escom.ttf" )
	Subtitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Subtitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	Subtitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	Subtitle:setShaderVector( 2, 1, 0, 0, 0 )
	Subtitle:setLetterSpacing( 1 )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local MissionRecordVaultHeading = CoD.MissionRecordVault_Heading.new( menu, controller )
	MissionRecordVaultHeading:setLeftRight( true, false, -9, 1281.62 )
	MissionRecordVaultHeading:setTopBottom( true, false, -3, 100 )
	MissionRecordVaultHeading.Title:setText( Engine.Localize( "MENU_MISSION_COMPLETE_CAPS" ) )
	self:addElement( MissionRecordVaultHeading )
	self.MissionRecordVaultHeading = MissionRecordVaultHeading
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Assists:completeAnimation()
				self.Assists:setAlpha( 1 )
				self.clipFinished( Assists, {} )
				Incaps:completeAnimation()
				self.Incaps:setAlpha( 1 )
				self.clipFinished( Incaps, {} )
				Revives:completeAnimation()
				self.Revives:setAlpha( 1 )
				self.clipFinished( Revives, {} )
				BestAssists:completeAnimation()
				self.BestAssists:setAlpha( 1 )
				self.clipFinished( BestAssists, {} )
				BestIncaps:completeAnimation()
				self.BestIncaps:setAlpha( 1 )
				self.clipFinished( BestIncaps, {} )
				BestRevives:completeAnimation()
				self.BestRevives:setAlpha( 1 )
				self.clipFinished( BestRevives, {} )
			end
		},
		Solo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				Panel20:completeAnimation()
				self.Panel20:setLeftRight( false, false, -197.69, 197.69 )
				self.Panel20:setTopBottom( false, false, -265.13, 190.46 )
				self.clipFinished( Panel20, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setLeftRight( true, false, 393.31, 755.31 )
				self.CategoryListLine0:setTopBottom( true, false, 261.87, 269.87 )
				self.clipFinished( CategoryListLine0, {} )
				Kills:completeAnimation()
				self.Kills:setLeftRight( true, false, 455.16, 700.54 )
				self.Kills:setTopBottom( true, false, 96.87, 225.22 )
				self.clipFinished( Kills, {} )
				Assists:completeAnimation()
				self.Assists:setAlpha( 0 )
				self.clipFinished( Assists, {} )
				Incaps:completeAnimation()
				self.Incaps:setLeftRight( true, false, 455.16, 700.54 )
				self.Incaps:setTopBottom( true, false, 301.56, 428.87 )
				self.clipFinished( Incaps, {} )
				Revives:completeAnimation()
				self.Revives:setLeftRight( true, false, 426.31, 563.08 )
				self.Revives:setTopBottom( true, false, 261.56, 388.87 )
				self.Revives:setAlpha( 0 )
				self.clipFinished( Revives, {} )
				BestKills:completeAnimation()
				self.BestKills:setLeftRight( true, false, 449.62, 500.62 )
				self.BestKills:setTopBottom( true, false, 126.2, 176.2 )
				self.clipFinished( BestKills, {} )
				BestAssists:completeAnimation()
				self.BestAssists:setLeftRight( true, false, 584.12, 635.12 )
				self.BestAssists:setTopBottom( true, false, 125.8, 176.37 )
				self.BestAssists:setAlpha( 0 )
				self.clipFinished( BestAssists, {} )
				BestIncaps:completeAnimation()
				self.BestIncaps:setLeftRight( true, false, 449.62, 500.62 )
				self.BestIncaps:setTopBottom( true, false, 330.22, 380.22 )
				self.clipFinished( BestIncaps, {} )
				BestRevives:completeAnimation()
				self.BestRevives:setLeftRight( true, false, 420.31, 471.31 )
				self.BestRevives:setTopBottom( true, false, 293.06, 343.06 )
				self.BestRevives:setAlpha( 0 )
				self.clipFinished( BestRevives, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Solo",
			condition = function ( menu, element, event )
				return WasCampaignSoloGame( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel10:close()
		element.Panel20:close()
		element.Panel30:close()
		element.Panel40:close()
		element.VignetteBack:close()
		element.XpBarContainer:close()
		element.Kills:close()
		element.Assists:close()
		element.BestCompletionTime:close()
		element.Incaps:close()
		element.Revives:close()
		element.BestKills:close()
		element.Collectibles:close()
		element.BestAssists:close()
		element.BestIncaps:close()
		element.BestRevives:close()
		element.Kills0:close()
		element.BestWidgetContainer0:close()
		element.StartMenuIdentitySubTitle0:close()
		element.StartMenuIdentitySubTitle00:close()
		element.MissionRecordVaultHeading:close()
		element.DifficultyImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

