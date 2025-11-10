require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionWidgetBlur" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.AAR_PT_Numbers" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionNameWidget" )
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
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 84 )
	self.anyChildUsesUpdateState = true
	
	local ScoreboardFactionWidgetBlur = CoD.ScoreboardFactionWidgetBlur.new( menu, controller )
	ScoreboardFactionWidgetBlur:setLeftRight( true, true, 0, 0 )
	ScoreboardFactionWidgetBlur:setTopBottom( true, true, 0, 0 )
	ScoreboardFactionWidgetBlur:mergeStateConditions( {
		{
			stateName = "Frontend",
			condition = function ( menu, element, event )
				return not IsInGame()
			end
		}
	} )
	self:addElement( ScoreboardFactionWidgetBlur )
	self.ScoreboardFactionWidgetBlur = ScoreboardFactionWidgetBlur
	
	local IconGlowPanel = LUI.UIImage.new()
	IconGlowPanel:setLeftRight( false, false, -75.61, 94.5 )
	IconGlowPanel:setTopBottom( false, false, -68.39, 87.44 )
	IconGlowPanel:setRGB( 0, 0, 0 )
	IconGlowPanel:setAlpha( 0.3 )
	IconGlowPanel:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( IconGlowPanel )
	self.IconGlowPanel = IconGlowPanel
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( false, false, -65.5, 65.5 )
	FactionIcon:setTopBottom( false, false, -64.5, 64.5 )
	FactionIcon:setAlpha( 0.5 )
	FactionIcon:setScale( 1.2 )
	FactionIcon:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local Score0 = CoD.AAR_PT_Numbers.new( menu, controller )
	Score0:setLeftRight( true, false, -13.5, 211.5 )
	Score0:setTopBottom( true, false, 24, 79.05 )
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
	ScoreboardFactionNameWidget:setLeftRight( true, false, 2.02, 139.04 )
	ScoreboardFactionNameWidget:setTopBottom( true, false, 3, 29 )
	ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	self:addElement( ScoreboardFactionNameWidget )
	self.ScoreboardFactionNameWidget = ScoreboardFactionNameWidget
	
	local ffaEmblem = LUI.UIImage.new()
	ffaEmblem:setLeftRight( true, false, 0, 137 )
	ffaEmblem:setTopBottom( true, false, 0, 84 )
	ffaEmblem:setAlpha( 0 )
	self:addElement( ffaEmblem )
	self.ffaEmblem = ffaEmblem
	
	local ffaScore = CoD.AAR_PT_Numbers.new( menu, controller )
	ffaScore:setLeftRight( true, false, -13.5, 211.5 )
	ffaScore:setTopBottom( true, false, 24, 79.05 )
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
	ffaName:setLeftRight( true, false, 2.02, 139.04 )
	ffaName:setTopBottom( true, false, 3, 29 )
	ffaName:setAlpha( 0 )
	ffaName.FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	self:addElement( ffaName )
	self.ffaName = ffaName
	
	local FactionColor = LUI.UIImage.new()
	FactionColor:setLeftRight( true, false, 2.02, 234 )
	FactionColor:setTopBottom( true, false, 0, 4 )
	FactionColor:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	FactionColor:setAlpha( 0 )
	self:addElement( FactionColor )
	self.FactionColor = FactionColor
	
	local ScoreboardFFANameWidget = CoD.ScoreboardFFANameWidget.new( menu, controller )
	ScoreboardFFANameWidget:setLeftRight( true, false, 3.5, 230.5 )
	ScoreboardFFANameWidget:setTopBottom( true, false, 58, 84 )
	ScoreboardFFANameWidget:setAlpha( 0 )
	ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	self:addElement( ScoreboardFFANameWidget )
	self.ScoreboardFFANameWidget = ScoreboardFFANameWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( false, false, -63.97, 66.87 )
				self.FactionIcon:setTopBottom( false, false, -54.84, 73.89 )
				self.clipFinished( FactionIcon, {} )
				Score0:completeAnimation()
				self.Score0:setAlpha( 1 )
				self.clipFinished( Score0, {} )
				ScoreboardFactionNameWidget:completeAnimation()
				self.ScoreboardFactionNameWidget:setLeftRight( true, false, 2.02, 139.04 )
				self.ScoreboardFactionNameWidget:setTopBottom( true, false, 0, 26 )
				self.ScoreboardFactionNameWidget:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionNameWidget, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setAlpha( 0 )
				self.clipFinished( ffaScore, {} )
				ffaName:completeAnimation()
				self.ffaName:setAlpha( 0 )
				self.clipFinished( ffaName, {} )
				FactionColor:completeAnimation()
				self.FactionColor:setAlpha( 0 )
				self.clipFinished( FactionColor, {} )
				ScoreboardFFANameWidget:completeAnimation()
				self.ScoreboardFFANameWidget:setAlpha( 0 )
				self.clipFinished( ScoreboardFFANameWidget, {} )
			end
		},
		FFA = {
			DefaultClip = function ()
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
				self.ffaEmblem:setLeftRight( true, false, 1, 201.61 )
				self.ffaEmblem:setTopBottom( true, false, 85, 208 )
				self.ffaEmblem:setAlpha( 1 )
				self.clipFinished( ffaEmblem, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setLeftRight( true, false, -13.5, 211.5 )
				self.ffaScore:setTopBottom( true, false, 1, 56.05 )
				self.ffaScore:setAlpha( 1 )
				self.clipFinished( ffaScore, {} )
				ffaName:completeAnimation()
				self.ffaName:setLeftRight( true, false, 2.02, 139.04 )
				self.ffaName:setTopBottom( true, false, 58, 84 )
				self.ffaName:setAlpha( 0 )
				self.clipFinished( ffaName, {} )
				ScoreboardFFANameWidget:completeAnimation()
				ScoreboardFFANameWidget.FactionName:completeAnimation()
				self.ScoreboardFFANameWidget:setLeftRight( true, false, 1.5, 200 )
				self.ScoreboardFFANameWidget:setTopBottom( true, false, 58, 84 )
				self.ScoreboardFFANameWidget:setAlpha( 1 )
				self.ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
				self.clipFinished( ScoreboardFFANameWidget, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( false, false, -90.5, 90.5 )
				self.FactionIcon:setTopBottom( false, false, -57.24, 57.24 )
				self.clipFinished( FactionIcon, {} )
				Score0:completeAnimation()
				self.Score0:setAlpha( 1 )
				self.clipFinished( Score0, {} )
				ScoreboardFactionNameWidget:completeAnimation()
				self.ScoreboardFactionNameWidget:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionNameWidget, {} )
				ffaScore:completeAnimation()
				self.ffaScore:setAlpha( 0 )
				self.clipFinished( ffaScore, {} )
				ffaName:completeAnimation()
				self.ffaName:setAlpha( 0 )
				self.clipFinished( ffaName, {} )
				FactionColor:completeAnimation()
				self.FactionColor:setLeftRight( true, false, 0, 200 )
				self.FactionColor:setTopBottom( true, false, 0, 4 )
				self.FactionColor:setAlpha( 1 )
				self.clipFinished( FactionColor, {} )
				ScoreboardFFANameWidget:completeAnimation()
				self.ScoreboardFFANameWidget:setAlpha( 0 )
				self.clipFinished( ScoreboardFFANameWidget, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreboardFactionWidgetBlur:close()
		element.Score0:close()
		element.ScoreboardFactionNameWidget:close()
		element.ffaScore:close()
		element.ffaName:close()
		element.ScoreboardFFANameWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

