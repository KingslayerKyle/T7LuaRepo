require( "ui.uieditor.widgets.AAR.PerformanceTab.AAR_PT_Numbers" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionNameWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionWidgetBlur" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFFANameWidget" )

CoD.ScoreboardFactionWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardFactionWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ScoreboardFactionWidget )
	self.id = "ScoreboardFactionWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 126 )
	self.anyChildUsesUpdateState = true
	
	local ScoreboardFactionWidgetBlur = CoD.ScoreboardFactionWidgetBlur.new( menu, controller )
	ScoreboardFactionWidgetBlur:mergeStateConditions( {
		{
			stateName = "Frontend",
			condition = function ( menu, element, event )
				return not IsInGame()
			end
		}
	} )
	ScoreboardFactionWidgetBlur:setLeftRight( 0, 1, 0, 0 )
	ScoreboardFactionWidgetBlur:setTopBottom( 0, 1, 0, 0 )
	self:addElement( ScoreboardFactionWidgetBlur )
	self.ScoreboardFactionWidgetBlur = ScoreboardFactionWidgetBlur
	
	local IconGlowPanel = LUI.UIImage.new()
	IconGlowPanel:setLeftRight( 0.5, 0.5, -113, 142 )
	IconGlowPanel:setTopBottom( 0.5, 0.5, -103, 131 )
	IconGlowPanel:setRGB( 0, 0, 0 )
	IconGlowPanel:setAlpha( 0.3 )
	IconGlowPanel:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( IconGlowPanel )
	self.IconGlowPanel = IconGlowPanel
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( 0.5, 0.5, -98, 98 )
	FactionIcon:setTopBottom( 0.5, 0.5, -97, 97 )
	FactionIcon:setAlpha( 0.5 )
	FactionIcon:setScale( 1.2 )
	FactionIcon:setImage( RegisterImage( "t7_mp_hud_faction_icon_faction1" ) )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local Score0 = CoD.AAR_PT_Numbers.new( menu, controller )
	Score0:setLeftRight( 0, 0, -21, 317 )
	Score0:setTopBottom( 0, 0, 36, 119 )
	Score0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Score0:setShaderVector( 0, 0.2, 0, 0, 0 )
	Score0:setShaderVector( 1, 0, 0, 0, 0 )
	Score0:setShaderVector( 2, 0, 0, 0, 0 )
	Score0:setShaderVector( 3, 0, 0, 0, 0 )
	Score0:setShaderVector( 4, 0, 0, 0, 0 )
	Score0.Numbers:setRGB( 0.72, 0.75, 0.82 )
	Score0.Numbers:setText( Engine.Localize( "2150" ) )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local ScoreboardFactionNameWidget = CoD.ScoreboardFactionNameWidget.new( menu, controller )
	ScoreboardFactionNameWidget:setLeftRight( 0, 0, 3, 209 )
	ScoreboardFactionNameWidget:setTopBottom( 0, 0, 4.5, 43.5 )
	ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	self:addElement( ScoreboardFactionNameWidget )
	self.ScoreboardFactionNameWidget = ScoreboardFactionNameWidget
	
	local ffaEmblem = LUI.UIImage.new()
	ffaEmblem:setLeftRight( 0, 0, 0, 206 )
	ffaEmblem:setTopBottom( 0, 0, 0, 126 )
	ffaEmblem:setAlpha( 0 )
	self:addElement( ffaEmblem )
	self.ffaEmblem = ffaEmblem
	
	local ffaScore = CoD.AAR_PT_Numbers.new( menu, controller )
	ffaScore:setLeftRight( 0, 0, -21, 317 )
	ffaScore:setTopBottom( 0, 0, 36, 119 )
	ffaScore:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ffaScore:setShaderVector( 0, 0.2, 0, 0, 0 )
	ffaScore:setShaderVector( 1, 0, 0, 0, 0 )
	ffaScore:setShaderVector( 2, 0, 0, 0, 0 )
	ffaScore:setShaderVector( 3, 0, 0, 0, 0 )
	ffaScore:setShaderVector( 4, 0, 0, 0, 0 )
	ffaScore.Numbers:setRGB( 0.72, 0.75, 0.82 )
	ffaScore.Numbers:setText( Engine.Localize( "2150" ) )
	self:addElement( ffaScore )
	self.ffaScore = ffaScore
	
	local ffaName = CoD.ScoreboardFactionNameWidget.new( menu, controller )
	ffaName:setLeftRight( 0, 0, 3, 209 )
	ffaName:setTopBottom( 0, 0, 4.5, 43.5 )
	ffaName:setAlpha( 0 )
	ffaName.FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	self:addElement( ffaName )
	self.ffaName = ffaName
	
	local FactionColor = LUI.UIImage.new()
	FactionColor:setLeftRight( 0, 0, 3, 351 )
	FactionColor:setTopBottom( 0, 0, 0, 6 )
	FactionColor:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	FactionColor:setAlpha( 0 )
	self:addElement( FactionColor )
	self.FactionColor = FactionColor
	
	local ScoreboardFFANameWidget = CoD.ScoreboardFFANameWidget.new( menu, controller )
	ScoreboardFFANameWidget:setLeftRight( 0, 0, 6, 346 )
	ScoreboardFFANameWidget:setTopBottom( 0, 0, 86.5, 125.5 )
	ScoreboardFFANameWidget:setAlpha( 0 )
	ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	self:addElement( ScoreboardFFANameWidget )
	self.ScoreboardFFANameWidget = ScoreboardFFANameWidget
	
	self.resetProperties = function ()
		ScoreboardFactionNameWidget:completeAnimation()
		FactionIcon:completeAnimation()
		ffaScore:completeAnimation()
		ffaEmblem:completeAnimation()
		IconGlowPanel:completeAnimation()
		Score0:completeAnimation()
		ffaName:completeAnimation()
		ScoreboardFFANameWidget:completeAnimation()
		FactionColor:completeAnimation()
		ScoreboardFactionNameWidget:setLeftRight( 0, 0, 3, 209 )
		ScoreboardFactionNameWidget:setTopBottom( 0, 0, 4.5, 43.5 )
		ScoreboardFactionNameWidget:setAlpha( 1 )
		FactionIcon:setLeftRight( 0.5, 0.5, -98, 98 )
		FactionIcon:setTopBottom( 0.5, 0.5, -97, 97 )
		FactionIcon:setAlpha( 0.5 )
		ffaScore:setLeftRight( 0, 0, -21, 317 )
		ffaScore:setTopBottom( 0, 0, 36, 119 )
		ffaScore:setAlpha( 1 )
		ffaEmblem:setLeftRight( 0, 0, 0, 206 )
		ffaEmblem:setTopBottom( 0, 0, 0, 126 )
		ffaEmblem:setAlpha( 0 )
		IconGlowPanel:setAlpha( 0.3 )
		Score0:setAlpha( 1 )
		ffaName:setLeftRight( 0, 0, 3, 209 )
		ffaName:setTopBottom( 0, 0, 4.5, 43.5 )
		ScoreboardFFANameWidget:setLeftRight( 0, 0, 6, 346 )
		ScoreboardFFANameWidget:setTopBottom( 0, 0, 86.5, 125.5 )
		ScoreboardFFANameWidget:setAlpha( 0 )
		ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
		FactionColor:setLeftRight( 0, 0, 3, 351 )
		FactionColor:setTopBottom( 0, 0, 0, 6 )
		FactionColor:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( 0.5, 0.5, -96, 100 )
				self.FactionIcon:setTopBottom( 0.5, 0.5, -82.5, 110.5 )
				self.clipFinished( FactionIcon, {} )
				ScoreboardFactionNameWidget:completeAnimation()
				self.ScoreboardFactionNameWidget:setLeftRight( 0, 0, 3, 209 )
				self.ScoreboardFactionNameWidget:setTopBottom( 0, 0, 0.5, 39.5 )
				self.clipFinished( ScoreboardFactionNameWidget, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setAlpha( 0 )
				self.clipFinished( ffaScore, {} )
			end
		},
		FFA = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				IconGlowPanel:completeAnimation()
				self.IconGlowPanel:setAlpha( 0 )
				self.clipFinished( IconGlowPanel, {} )
				FactionIcon:completeAnimation()
				self.FactionIcon:setAlpha( 0 )
				self.clipFinished( FactionIcon, {} )
				Score0:completeAnimation()
				self.Score0:setAlpha( 0 )
				self.clipFinished( Score0, {} )
				ScoreboardFactionNameWidget:completeAnimation()
				self.ScoreboardFactionNameWidget:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionNameWidget, {} )
				ffaEmblem:completeAnimation()
				self.ffaEmblem:setLeftRight( 0, 0, 1.5, 302.5 )
				self.ffaEmblem:setTopBottom( 0, 0, 128, 312 )
				self.ffaEmblem:setAlpha( 1 )
				self.clipFinished( ffaEmblem, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setLeftRight( 0, 0, -21, 317 )
				self.ffaScore:setTopBottom( 0, 0, 1, 84 )
				self.clipFinished( ffaScore, {} )
				ffaName:completeAnimation()
				self.ffaName:setLeftRight( 0, 0, 3, 209 )
				self.ffaName:setTopBottom( 0, 0, 86.5, 125.5 )
				self.clipFinished( ffaName, {} )
				ScoreboardFFANameWidget:completeAnimation()
				ScoreboardFFANameWidget.FactionName:completeAnimation()
				self.ScoreboardFFANameWidget:setLeftRight( 0, 0, 2, 300 )
				self.ScoreboardFFANameWidget:setTopBottom( 0, 0, 86.5, 125.5 )
				self.ScoreboardFFANameWidget:setAlpha( 1 )
				self.ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
				self.clipFinished( ScoreboardFFANameWidget, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( 0.5, 0.5, -136, 136 )
				self.FactionIcon:setTopBottom( 0.5, 0.5, -86, 86 )
				self.clipFinished( FactionIcon, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setAlpha( 0 )
				self.clipFinished( ffaScore, {} )
				FactionColor:completeAnimation()
				self.FactionColor:setLeftRight( 0, 0, 0, 300 )
				self.FactionColor:setTopBottom( 0, 0, 0, 6 )
				self.FactionColor:setAlpha( 1 )
				self.clipFinished( FactionColor, {} )
			end
		},
		CodCasterAAR = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( 0.5, 0.5, -136, 136 )
				self.FactionIcon:setTopBottom( 0.5, 0.5, -86, 86 )
				self.clipFinished( FactionIcon, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setAlpha( 0 )
				self.clipFinished( ffaScore, {} )
				FactionColor:completeAnimation()
				self.FactionColor:setLeftRight( 0, 0, 0, 300 )
				self.FactionColor:setTopBottom( 0, 0, 0, 6 )
				self.clipFinished( FactionColor, {} )
			end
		},
		TeamCoDCaster = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( 0.5, 0.5, -96, 100 )
				self.FactionIcon:setTopBottom( 0.5, 0.5, -82.5, 110.5 )
				self.FactionIcon:setAlpha( 0 )
				self.clipFinished( FactionIcon, {} )
				ScoreboardFactionNameWidget:completeAnimation()
				self.ScoreboardFactionNameWidget:setLeftRight( 0, 0, 3, 209 )
				self.ScoreboardFactionNameWidget:setTopBottom( 0, 0, 0.5, 39.5 )
				self.clipFinished( ScoreboardFactionNameWidget, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setAlpha( 0 )
				self.clipFinished( ffaScore, {} )
				FactionColor:completeAnimation()
				self.FactionColor:setLeftRight( 0, 0, 0, 300 )
				self.FactionColor:setTopBottom( 0, 0, 0, 6 )
				self.clipFinished( FactionColor, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return not IsTeamBasedGame( controller )
			end
		},
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
			end
		},
		{
			stateName = "CodCasterAAR",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "TeamCoDCaster",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapPreviousGametype" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MapVote.mapVoteMapPreviousGametype"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ScoreboardFactionWidgetBlur:close()
		self.Score0:close()
		self.ScoreboardFactionNameWidget:close()
		self.ffaScore:close()
		self.ffaName:close()
		self.ScoreboardFFANameWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

