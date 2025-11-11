require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidgetContainer" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtility.SetCurrLevelModels( controller, 1 )
	CoD.AARUtility.SetNextLevelModels( controller, 1 )
end

local PostLoadFunc = function ( self, controller )
	CoD.AARUtility.DoXPBarAnimation( self, controller )
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 789 )
	self.anyChildUsesUpdateState = true
	
	local Panel10 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel10:setLeftRight( 0.5, 0.5, -917, -315 )
	Panel10:setTopBottom( 0.5, 0.5, -394, 289 )
	Panel10:setRGB( 0.25, 0.25, 0.25 )
	Panel10.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel10 )
	self.Panel10 = Panel10
	
	local Panel20 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel20:setLeftRight( 0.5, 0.5, -311, 550 )
	Panel20:setTopBottom( 0.5, 0.5, -394, 289 )
	Panel20:setRGB( 0.25, 0.25, 0.25 )
	Panel20.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel20 )
	self.Panel20 = Panel20
	
	local Panel30 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel30:setLeftRight( 0.5, 0.5, 559, 911 )
	Panel30:setTopBottom( 0.5, 0.5, -394, 289 )
	Panel30:setRGB( 0.25, 0.25, 0.25 )
	Panel30.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel30 )
	self.Panel30 = Panel30
	
	local Panel40 = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	Panel40:setLeftRight( 0.5, 0.5, -917, 911 )
	Panel40:setTopBottom( 0.5, 0.5, 295, 395 )
	Panel40:setRGB( 0.25, 0.25, 0.25 )
	Panel40.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( Panel40 )
	self.Panel40 = Panel40
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( 0, 0, 0, 1920 )
	VignetteBack:setTopBottom( 0, 0, -142, 938 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 83, 620 )
	CategoryListLine:setTopBottom( 0, 0, 288, 300 )
	CategoryListLine:setAlpha( 0.33 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, 684, 1470 )
	CategoryListLine0:setTopBottom( 0, 0, 288, 300 )
	CategoryListLine0:setAlpha( 0.33 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( 0, 0, 104, 1810 )
	XpBarContainer:setTopBottom( 0, 0, 690, 771 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	XpBarContainer:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "xpBarInfo", function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local ScoreLabel = LUI.UIText.new()
	ScoreLabel:setLeftRight( 0, 0, 186, 486 )
	ScoreLabel:setTopBottom( 0, 0, 102, 140 )
	ScoreLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	ScoreLabel:setTTF( "fonts/default.ttf" )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local Kills = CoD.ScoreWidget.new( menu, controller )
	Kills:setLeftRight( 0, 0, 661, 931 )
	Kills:setTopBottom( 0, 0, 102, 227 )
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
	Assists:setLeftRight( 0, 0, 943, 1213 )
	Assists:setTopBottom( 0, 0, 102, 227 )
	Assists.ScoreLabel:setText( Engine.Localize( "ZMUI_HEADSHOTS_CAPS" ) )
	Assists.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "ZMUI_HEADSHOTS_CAPS" ) )
	Assists:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "headshots", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Assists.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Assists )
	self.Assists = Assists
	
	local BestRound = CoD.BestWidgetContainer.new( menu, controller )
	BestRound:setLeftRight( 0, 0, 298, 374 )
	BestRound:setTopBottom( 0, 0, 437.5, 512.5 )
	BestRound:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestRoundIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestRound.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestRound )
	self.BestRound = BestRound
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( 0, 0, 173, 499 )
	Score:setTopBottom( 0, 0, 139, 205 )
	Score:setTTF( "fonts/default.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "total_points", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	local Incaps = CoD.ScoreWidget.new( menu, controller )
	Incaps:setLeftRight( 0, 0, 943, 1213 )
	Incaps:setTopBottom( 0, 0, 362, 487 )
	Incaps.ScoreLabel:setText( Engine.Localize( "ZMUI_REVIVES_CAPS" ) )
	Incaps.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "ZMUI_REVIVES_CAPS" ) )
	Incaps:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "revives", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Incaps.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Incaps )
	self.Incaps = Incaps
	
	local CompletionTimeLabel = LUI.UIText.new()
	CompletionTimeLabel:setLeftRight( 0, 0, 186, 486 )
	CompletionTimeLabel:setTopBottom( 0, 0, 324, 362 )
	CompletionTimeLabel:setText( Engine.Localize( "MENU_SURVIVED_UNTIL_ROUND_CAPS" ) )
	CompletionTimeLabel:setTTF( "fonts/default.ttf" )
	CompletionTimeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletionTimeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletionTimeLabel )
	self.CompletionTimeLabel = CompletionTimeLabel
	
	local BestPoints = CoD.BestWidgetContainer.new( menu, controller )
	BestPoints:setLeftRight( 0, 0, 298, 374 )
	BestPoints:setTopBottom( 0, 0, 205.5, 280.5 )
	BestPoints:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestScoreIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestPoints.BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestPoints )
	self.BestPoints = BestPoints
	
	local ScoreWidget1 = CoD.ScoreWidget.new( menu, controller )
	ScoreWidget1:setLeftRight( 0, 0, 1227, 1497 )
	ScoreWidget1:setTopBottom( 0, 0, 362, 487 )
	ScoreWidget1.ScoreLabel:setText( Engine.Localize( "ZMUI_DOWNS_CAPS" ) )
	ScoreWidget1.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "ZMUI_DOWNS_CAPS" ) )
	ScoreWidget1:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "downs", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreWidget1.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreWidget1 )
	self.ScoreWidget1 = ScoreWidget1
	
	local ScoreWidget2 = CoD.ScoreWidget.new( menu, controller )
	ScoreWidget2:setLeftRight( 0, 0, 1227, 1497 )
	ScoreWidget2:setTopBottom( 0, 0, 102, 227 )
	ScoreWidget2.ScoreLabel:setText( Engine.Localize( "MENU_MELEE_KILLS_CAPS" ) )
	ScoreWidget2.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MELEE_KILLS_CAPS" ) )
	ScoreWidget2:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "meleeKills", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreWidget2.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreWidget2 )
	self.ScoreWidget2 = ScoreWidget2
	
	local Score0 = LUI.UIText.new()
	Score0:setLeftRight( 0, 0, 173, 499 )
	Score0:setTopBottom( 0, 0, 365, 431 )
	Score0:setTTF( "fonts/default.ttf" )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score0:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "rounds", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Score0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local CompletionTimeLabel0 = LUI.UIText.new()
	CompletionTimeLabel0:setLeftRight( 0, 0, 1545, 1845 )
	CompletionTimeLabel0:setTopBottom( 0, 0, 83, 121 )
	CompletionTimeLabel0:setText( Engine.Localize( "MENU_BGB_TOKENS_GAINED_THIS_GAME_CAPS" ) )
	CompletionTimeLabel0:setTTF( "fonts/default.ttf" )
	CompletionTimeLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletionTimeLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletionTimeLabel0 )
	self.CompletionTimeLabel0 = CompletionTimeLabel0
	
	local Score00 = LUI.UIText.new()
	Score00:setLeftRight( 0, 0, 1556, 1834 )
	Score00:setTopBottom( 0, 0, 132, 198 )
	Score00:setTTF( "fonts/default.ttf" )
	Score00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "bgbTokensGainedThisGame", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Score00:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Score00 )
	self.Score00 = Score00
	
	local vial = LUI.UIImage.new()
	vial:setLeftRight( 0, 0, 1545, 1815 )
	vial:setTopBottom( 0, 0, 46, 802 )
	vial:setScale( 0.5 )
	vial:setImage( RegisterImage( "uie_t7_hud_zm_vial" ) )
	self:addElement( vial )
	self.vial = vial
	
	local Revives00 = CoD.ScoreWidget.new( menu, controller )
	Revives00:setLeftRight( 0, 0, 661, 923 )
	Revives00:setTopBottom( 0, 0, 362, 487 )
	Revives00.ScoreLabel:setText( Engine.Localize( "MENU_BGBS_CHEWED_CAPS" ) )
	Revives00.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BGBS_CHEWED_CAPS" ) )
	Revives00:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "pointsPerKill", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Revives00.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Revives00 )
	self.Revives00 = Revives00
	
	self.resetProperties = function ()
		Panel10:completeAnimation()
		VignetteBack:completeAnimation()
		XpBarContainer:completeAnimation()
		CategoryListLine0:completeAnimation()
		CategoryListLine:completeAnimation()
		Panel40:completeAnimation()
		Panel30:completeAnimation()
		Panel20:completeAnimation()
		vial:completeAnimation()
		Score00:completeAnimation()
		CompletionTimeLabel0:completeAnimation()
		Panel10:setAlpha( 1 )
		VignetteBack:setAlpha( 1 )
		XpBarContainer:setAlpha( 1 )
		CategoryListLine0:setAlpha( 0.33 )
		CategoryListLine:setAlpha( 0.33 )
		Panel40:setAlpha( 1 )
		Panel30:setAlpha( 1 )
		Panel20:setAlpha( 1 )
		vial:setAlpha( 1 )
		Score00:setAlpha( 1 )
		CompletionTimeLabel0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel10:close()
		self.Panel20:close()
		self.Panel30:close()
		self.Panel40:close()
		self.VignetteBack:close()
		self.XpBarContainer:close()
		self.Kills:close()
		self.Assists:close()
		self.BestRound:close()
		self.Incaps:close()
		self.BestPoints:close()
		self.ScoreWidget1:close()
		self.ScoreWidget2:close()
		self.Revives00:close()
		self.Score:close()
		self.Score0:close()
		self.Score00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

