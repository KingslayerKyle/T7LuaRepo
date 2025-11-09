require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_PerformanceCollectible" )

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
	
	local timeImage = LUI.UIImage.new()
	timeImage:setLeftRight( true, false, 153.45, 295.14 )
	timeImage:setTopBottom( true, false, 256.34, 394.05 )
	timeImage:setImage( RegisterImage( "uie_t7_menu_cp_vault_timer" ) )
	self:addElement( timeImage )
	self.timeImage = timeImage
	
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
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local MissionCompleteLabel = LUI.UIText.new()
	MissionCompleteLabel:setLeftRight( true, false, 124.29, 324.29 )
	MissionCompleteLabel:setTopBottom( true, false, 18.5, 55.5 )
	MissionCompleteLabel:setText( Engine.Localize( "MENU_MISSION_COMPLETE_CAPS" ) )
	MissionCompleteLabel:setTTF( "fonts/default.ttf" )
	MissionCompleteLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionCompleteLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionCompleteLabel )
	self.MissionCompleteLabel = MissionCompleteLabel
	
	local ScoreLabel = LUI.UIText.new()
	ScoreLabel:setLeftRight( true, false, 124.29, 324.29 )
	ScoreLabel:setTopBottom( true, false, 68, 93 )
	ScoreLabel:setText( Engine.Localize( "SCORE" ) )
	ScoreLabel:setTTF( "fonts/default.ttf" )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local Kills = CoD.ScoreWidget.new( menu, controller )
	Kills:setLeftRight( true, false, 489, 625.77 )
	Kills:setTopBottom( true, false, 37, 154 )
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
	Assists:setLeftRight( true, false, 652.23, 789 )
	Assists:setTopBottom( true, false, 37, 154 )
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
	BestCompletionTime:setLeftRight( true, false, 198.79, 249.79 )
	BestCompletionTime:setTopBottom( true, false, 351.02, 401.02 )
	BestCompletionTime:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local showBestScoreIcon = Engine.GetModelValue( model )
		if showBestScoreIcon then
			BestCompletionTime.BestIconForKDR:setAlpha( showBestScoreIcon )
		end
	end )
	self:addElement( BestCompletionTime )
	self.BestCompletionTime = BestCompletionTime
	
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
	Incaps:setLeftRight( true, false, 652.23, 789 )
	Incaps:setTopBottom( true, false, 249.7, 366.7 )
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
	Revives:setLeftRight( true, false, 489, 625.77 )
	Revives:setTopBottom( true, false, 249.7, 366.7 )
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
	
	local CollectiblesLabel = LUI.UIText.new()
	CollectiblesLabel:setLeftRight( true, false, 937.31, 1137.31 )
	CollectiblesLabel:setTopBottom( true, false, 37, 62 )
	CollectiblesLabel:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	CollectiblesLabel:setTTF( "fonts/default.ttf" )
	CollectiblesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CollectiblesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CollectiblesLabel )
	self.CollectiblesLabel = CollectiblesLabel
	
	local CompletionTimeLabel = LUI.UIText.new()
	CompletionTimeLabel:setLeftRight( true, false, 124.29, 324.29 )
	CompletionTimeLabel:setTopBottom( true, false, 240.63, 265.63 )
	CompletionTimeLabel:setText( Engine.Localize( "MENU_COMPLETION_TIME_CAPS" ) )
	CompletionTimeLabel:setTTF( "fonts/default.ttf" )
	CompletionTimeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletionTimeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletionTimeLabel )
	self.CompletionTimeLabel = CompletionTimeLabel
	
	local CompletionTime = LUI.UIText.new()
	CompletionTime:setLeftRight( true, false, 161.29, 287.29 )
	CompletionTime:setTopBottom( true, false, 308.2, 342.2 )
	CompletionTime:setTTF( "fonts/default.ttf" )
	CompletionTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletionTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CompletionTime:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "completionTime", function ( model )
		local completionTime = Engine.GetModelValue( model )
		if completionTime then
			CompletionTime:setText( Engine.Localize( NumberAsTime( completionTime ) ) )
		end
	end )
	self:addElement( CompletionTime )
	self.CompletionTime = CompletionTime
	
	local BestKills = CoD.BestWidgetContainer.new( menu, controller )
	BestKills:setLeftRight( true, false, 531.89, 582.89 )
	BestKills:setTopBottom( true, false, 137, 187 )
	BestKills:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKillsIcon", function ( model )
		local showBestKillsIcon = Engine.GetModelValue( model )
		if showBestKillsIcon then
			BestKills.BestIconForKDR:setAlpha( showBestKillsIcon )
		end
	end )
	self:addElement( BestKills )
	self.BestKills = BestKills
	
	local BestWidgetContainer0 = CoD.BestWidgetContainer.new( menu, controller )
	BestWidgetContainer0:setLeftRight( true, false, 198.79, 249.79 )
	BestWidgetContainer0:setTopBottom( true, false, 137, 187 )
	BestWidgetContainer0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local showBestScoreIcon = Engine.GetModelValue( model )
		if showBestScoreIcon then
			BestWidgetContainer0.BestIconForKDR:setAlpha( showBestScoreIcon )
		end
	end )
	self:addElement( BestWidgetContainer0 )
	self.BestWidgetContainer0 = BestWidgetContainer0
	
	local Collectibles = LUI.GridLayout.new( menu, controller, false, 0, 0, 7, 0, nil, nil, false, false, 0, 0, false, false )
	Collectibles:setLeftRight( true, false, 937.31, 1154.31 )
	Collectibles:setTopBottom( true, false, 71.5, 370.5 )
	Collectibles:setDataSource( "CollectiblesList" )
	Collectibles:setWidgetType( CoD.MissionRecordVault_PerformanceCollectible )
	Collectibles:setHorizontalCount( 2 )
	Collectibles:setVerticalCount( 3 )
	Collectibles:setSpacing( 7 )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local BestKills0 = CoD.BestWidgetContainer.new( menu, controller )
	BestKills0:setLeftRight( true, false, 695.12, 746.12 )
	BestKills0:setTopBottom( true, false, 137, 187 )
	BestKills0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestAssistsIcon", function ( model )
		local showBestAssistsIcon = Engine.GetModelValue( model )
		if showBestAssistsIcon then
			BestKills0.BestIconForKDR:setAlpha( showBestAssistsIcon )
		end
	end )
	self:addElement( BestKills0 )
	self.BestKills0 = BestKills0
	
	local BestKills1 = CoD.BestWidgetContainer.new( menu, controller )
	BestKills1:setLeftRight( true, false, 695.12, 746.12 )
	BestKills1:setTopBottom( true, false, 351.02, 401.02 )
	BestKills1:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestIncapsIcon", function ( model )
		local showBestIncapsIcon = Engine.GetModelValue( model )
		if showBestIncapsIcon then
			BestKills1.BestIconForKDR:setAlpha( showBestIncapsIcon )
		end
	end )
	self:addElement( BestKills1 )
	self.BestKills1 = BestKills1
	
	local BestIncaps = CoD.BestWidgetContainer.new( menu, controller )
	BestIncaps:setLeftRight( true, false, 531.89, 582.89 )
	BestIncaps:setTopBottom( true, false, 351.02, 401.02 )
	BestIncaps:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestRevivesIcon", function ( model )
		local showBestRevivesIcon = Engine.GetModelValue( model )
		if showBestRevivesIcon then
			BestIncaps.BestIconForKDR:setAlpha( showBestRevivesIcon )
		end
	end )
	self:addElement( BestIncaps )
	self.BestIncaps = BestIncaps
	
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
		element.BestCompletionTime:close()
		element.Incaps:close()
		element.Revives:close()
		element.BestKills:close()
		element.BestWidgetContainer0:close()
		element.Collectibles:close()
		element.BestKills0:close()
		element.BestKills1:close()
		element.BestIncaps:close()
		element.Score:close()
		element.CompletionTime:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

