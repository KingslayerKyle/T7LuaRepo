require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_PerformanceCollectible" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 789 )
	self.anyChildUsesUpdateState = true
	
	local Panel10 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel10:setLeftRight( 0, 0, -21, 562 )
	Panel10:setTopBottom( 0.5, 0.5, -398, 285 )
	Panel10:setRGB( 0.25, 0.25, 0.25 )
	Panel10.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel10 )
	self.Panel10 = Panel10
	
	local Panel20 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel20:setLeftRight( 0, 0, 566, 1159 )
	Panel20:setTopBottom( 0.5, 0.5, -398, 285 )
	Panel20:setRGB( 0.25, 0.25, 0.25 )
	Panel20.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel20 )
	self.Panel20 = Panel20
	
	local Panel30 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel30:setLeftRight( 0, 0, 1163, 1744 )
	Panel30:setTopBottom( 0.5, 0.5, -398, 285 )
	Panel30:setRGB( 0.25, 0.25, 0.25 )
	Panel30.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel30 )
	self.Panel30 = Panel30
	
	local Panel40 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel40:setLeftRight( 0.5, 0.5, -947, 881 )
	Panel40:setTopBottom( 0.5, 0.5, 287, 387 )
	Panel40:setRGB( 0.25, 0.25, 0.25 )
	Panel40.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel40 )
	self.Panel40 = Panel40
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( 0, 1, -98, 98 )
	VignetteBack:setTopBottom( 0, 0, -127, 953 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 7, 544 )
	CategoryListLine:setTopBottom( 0, 0, 393, 406 )
	CategoryListLine:setAlpha( 0.33 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, 590, 1133 )
	CategoryListLine0:setTopBottom( 0, 0, 393, 406 )
	CategoryListLine0:setAlpha( 0.33 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( 0, 0, 75, 1639 )
	XpBarContainer:setTopBottom( 0, 0, 685, 766 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local DifficultyImage = LUI.UIImage.new()
	DifficultyImage:setLeftRight( 0, 0, 171, 342 )
	DifficultyImage:setTopBottom( 0, 0, 483, 655 )
	DifficultyImage:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "difficulty", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DifficultyImage:setImage( RegisterImage( DifficultyIconFromNumber( modelValue ) ) )
		end
	end )
	self:addElement( DifficultyImage )
	self.DifficultyImage = DifficultyImage
	
	local Kills = CoD.ScoreWidget.new( menu, controller )
	Kills:setLeftRight( 0, 0, 639, 844 )
	Kills:setTopBottom( 0, 0, 144, 338 )
	Kills.ScoreLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "kills", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Kills.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Assists = CoD.ScoreWidget.new( menu, controller )
	Assists:setLeftRight( 0, 0, 884, 1089 )
	Assists:setTopBottom( 0, 0, 144, 338 )
	Assists.ScoreLabel:setText( Engine.Localize( "MPUI_ASSISTS_CAPS" ) )
	Assists.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_ASSISTS_CAPS" ) )
	Assists:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "assists", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Assists.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Assists )
	self.Assists = Assists
	
	local BestCompletionTime = CoD.BestWidgetContainer.new( menu, controller )
	BestCompletionTime:setLeftRight( 0, 0, 163, 239 )
	BestCompletionTime:setTopBottom( 0, 0, 479, 555 )
	BestCompletionTime:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestDifficultyIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestCompletionTime:setAlpha( modelValue )
		end
	end )
	BestCompletionTime:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestCompletionTime.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestCompletionTime )
	self.BestCompletionTime = BestCompletionTime
	
	local Incaps = CoD.ScoreWidget.new( menu, controller )
	Incaps:setLeftRight( 0, 0, 884, 1089 )
	Incaps:setTopBottom( 0, 0, 449, 641 )
	Incaps.ScoreLabel:setText( Engine.Localize( "MENU_INCAPS_CAPS" ) )
	Incaps.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_INCAPS_CAPS" ) )
	Incaps:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "incaps", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Incaps.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Incaps )
	self.Incaps = Incaps
	
	local Revives = CoD.ScoreWidget.new( menu, controller )
	Revives:setLeftRight( 0, 0, 639, 844 )
	Revives:setTopBottom( 0, 0, 449, 641 )
	Revives.ScoreLabel:setText( Engine.Localize( "MPUI_REVIVES_CAPS" ) )
	Revives.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_REVIVES_CAPS" ) )
	Revives:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "revives", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Revives.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Revives )
	self.Revives = Revives
	
	local BestKills = CoD.BestWidgetContainer.new( menu, controller )
	BestKills:setLeftRight( 0, 0, 632, 708 )
	BestKills:setTopBottom( 0, 0, 187, 263 )
	BestKills:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKillsIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestKills.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestKills )
	self.BestKills = BestKills
	
	local Collectibles = LUI.GridLayout.new( menu, controller, false, 0, 0, 10, 0, nil, nil, false, false, 0, 0, false, false )
	Collectibles:setLeftRight( 0, 0, 1299, 1623 )
	Collectibles:setTopBottom( 0, 0, 193.5, 639.5 )
	Collectibles:setWidgetType( CoD.MissionRecordVault_PerformanceCollectible )
	Collectibles:setHorizontalCount( 2 )
	Collectibles:setVerticalCount( 3 )
	Collectibles:setSpacing( 10 )
	Collectibles:setDataSource( "CollectiblesListAAR" )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local BestAssists = CoD.BestWidgetContainer.new( menu, controller )
	BestAssists:setLeftRight( 0, 0, 876, 952 )
	BestAssists:setTopBottom( 0, 0, 187, 263 )
	BestAssists:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestAssistsIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestAssists.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestAssists )
	self.BestAssists = BestAssists
	
	local BestIncaps = CoD.BestWidgetContainer.new( menu, controller )
	BestIncaps:setLeftRight( 0, 0, 875, 951 )
	BestIncaps:setTopBottom( 0, 0, 493, 569 )
	BestIncaps:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestIncapsIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestIncaps.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestIncaps )
	self.BestIncaps = BestIncaps
	
	local BestRevives = CoD.BestWidgetContainer.new( menu, controller )
	BestRevives:setLeftRight( 0, 0, 630, 706 )
	BestRevives:setTopBottom( 0, 0, 493, 569 )
	BestRevives:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestRevivesIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestRevives.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestRevives )
	self.BestRevives = BestRevives
	
	local Kills0 = CoD.ScoreWidget.new( menu, controller )
	Kills0:setLeftRight( 0, 0, 75, 456 )
	Kills0:setTopBottom( 0, 0, 144, 338 )
	Kills0.ScoreLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Kills0.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Kills0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Kills0.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Kills0 )
	self.Kills0 = Kills0
	
	local BestWidgetContainer0 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer0:setLeftRight( 0, 0, 66, 142 )
	BestWidgetContainer0:setTopBottom( 0, 0, 190, 266 )
	BestWidgetContainer0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestWidgetContainer0.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestWidgetContainer0 )
	self.BestWidgetContainer0 = BestWidgetContainer0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 1298, 1623 )
	StartMenuIdentitySubTitle0:setTopBottom( 0, 0, 140, 179 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local StartMenuIdentitySubTitle00 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle00:setLeftRight( 0, 0, 75, 221 )
	StartMenuIdentitySubTitle00:setTopBottom( 0, 0, 444, 484 )
	StartMenuIdentitySubTitle00.SubTitle:setText( Engine.Localize( "MENU_DIFFICULTY_CAPS" ) )
	StartMenuIdentitySubTitle00.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle00 )
	self.StartMenuIdentitySubTitle00 = StartMenuIdentitySubTitle00
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( 0, 0, -114, 705 )
	TitleBG:setTopBottom( 0, 0, 7, 112 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Subtitle = LUI.UITightText.new()
	Subtitle:setLeftRight( 0, 0, 15, 450 )
	Subtitle:setTopBottom( 0, 0, 75, 102 )
	Subtitle:setAlpha( 0.5 )
	Subtitle:setText( Engine.Localize( "MENU_MISSION_OVERVIEW_CAP" ) )
	Subtitle:setTTF( "fonts/escom.ttf" )
	Subtitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Subtitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	Subtitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	Subtitle:setShaderVector( 2, 1, 0, 0, 0 )
	Subtitle:setLetterSpacing( 1 )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local MissionRecordVaultHeading = CoD.MissionRecordVault_Heading.new( menu, controller )
	MissionRecordVaultHeading:setLeftRight( 0, 0, -14, 1922 )
	MissionRecordVaultHeading:setTopBottom( 0, 0, -4, 150 )
	MissionRecordVaultHeading.Title:setText( Engine.Localize( "MENU_MISSION_COMPLETE_CAPS" ) )
	self:addElement( MissionRecordVaultHeading )
	self.MissionRecordVaultHeading = MissionRecordVaultHeading
	
	self.resetProperties = function ()
		Assists:completeAnimation()
		BestAssists:completeAnimation()
		BestRevives:completeAnimation()
		Revives:completeAnimation()
		BestIncaps:completeAnimation()
		Incaps:completeAnimation()
		Kills:completeAnimation()
		BestKills:completeAnimation()
		Panel20:completeAnimation()
		CategoryListLine0:completeAnimation()
		Assists:setAlpha( 1 )
		BestAssists:setLeftRight( 0, 0, 876, 952 )
		BestAssists:setTopBottom( 0, 0, 187, 263 )
		BestAssists:setAlpha( 1 )
		BestRevives:setLeftRight( 0, 0, 630, 706 )
		BestRevives:setTopBottom( 0, 0, 493, 569 )
		BestRevives:setAlpha( 1 )
		Revives:setLeftRight( 0, 0, 639, 844 )
		Revives:setTopBottom( 0, 0, 449, 641 )
		Revives:setAlpha( 1 )
		BestIncaps:setLeftRight( 0, 0, 875, 951 )
		BestIncaps:setTopBottom( 0, 0, 493, 569 )
		Incaps:setLeftRight( 0, 0, 884, 1089 )
		Incaps:setTopBottom( 0, 0, 449, 641 )
		Kills:setLeftRight( 0, 0, 639, 844 )
		Kills:setTopBottom( 0, 0, 144, 338 )
		BestKills:setLeftRight( 0, 0, 632, 708 )
		BestKills:setTopBottom( 0, 0, 187, 263 )
		Panel20:setLeftRight( 0, 0, 566, 1159 )
		Panel20:setTopBottom( 0.5, 0.5, -398, 285 )
		CategoryListLine0:setLeftRight( 0, 0, 590, 1133 )
		CategoryListLine0:setTopBottom( 0, 0, 393, 406 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Solo = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				Panel20:completeAnimation()
				self.Panel20:setLeftRight( 0.5, 0.5, -297, 296 )
				self.Panel20:setTopBottom( 0.5, 0.5, -398, 285 )
				self.clipFinished( Panel20, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setLeftRight( 0, 0, 590, 1133 )
				self.CategoryListLine0:setTopBottom( 0, 0, 392.5, 404.5 )
				self.clipFinished( CategoryListLine0, {} )
				Kills:completeAnimation()
				self.Kills:setLeftRight( 0, 0, 682.5, 1050.5 )
				self.Kills:setTopBottom( 0, 0, 145.5, 338.5 )
				self.clipFinished( Kills, {} )
				Assists:completeAnimation()
				self.Assists:setAlpha( 0 )
				self.clipFinished( Assists, {} )
				Incaps:completeAnimation()
				self.Incaps:setLeftRight( 0, 0, 682.5, 1050.5 )
				self.Incaps:setTopBottom( 0, 0, 452.5, 643.5 )
				self.clipFinished( Incaps, {} )
				Revives:completeAnimation()
				self.Revives:setLeftRight( 0, 0, 640, 845 )
				self.Revives:setTopBottom( 0, 0, 392.5, 583.5 )
				self.Revives:setAlpha( 0 )
				self.clipFinished( Revives, {} )
				BestKills:completeAnimation()
				self.BestKills:setLeftRight( 0, 0, 675, 751 )
				self.BestKills:setTopBottom( 0, 0, 189.5, 264.5 )
				self.clipFinished( BestKills, {} )
				BestAssists:completeAnimation()
				self.BestAssists:setLeftRight( 0, 0, 876, 952 )
				self.BestAssists:setTopBottom( 0, 0, 189, 265 )
				self.BestAssists:setAlpha( 0 )
				self.clipFinished( BestAssists, {} )
				BestIncaps:completeAnimation()
				self.BestIncaps:setLeftRight( 0, 0, 675, 751 )
				self.BestIncaps:setTopBottom( 0, 0, 495.5, 570.5 )
				self.clipFinished( BestIncaps, {} )
				BestRevives:completeAnimation()
				self.BestRevives:setLeftRight( 0, 0, 631, 707 )
				self.BestRevives:setTopBottom( 0, 0, 439.5, 514.5 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel10:close()
		self.Panel20:close()
		self.Panel30:close()
		self.Panel40:close()
		self.VignetteBack:close()
		self.XpBarContainer:close()
		self.Kills:close()
		self.Assists:close()
		self.BestCompletionTime:close()
		self.Incaps:close()
		self.Revives:close()
		self.BestKills:close()
		self.Collectibles:close()
		self.BestAssists:close()
		self.BestIncaps:close()
		self.BestRevives:close()
		self.Kills0:close()
		self.BestWidgetContainer0:close()
		self.StartMenuIdentitySubTitle0:close()
		self.StartMenuIdentitySubTitle00:close()
		self.MissionRecordVaultHeading:close()
		self.DifficultyImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

