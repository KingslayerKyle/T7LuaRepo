require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.AAR_PT_Numbers" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionNameWidget" )

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
	self:setLeftRight( true, false, 0, 234 )
	self:setTopBottom( true, false, 0, 84 )
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( true, true, 0, 0 )
	Top3PlayerScoreBlurBox0:setTopBottom( true, true, 0, 0 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local BlackFrame = LUI.UIImage.new()
	BlackFrame:setLeftRight( true, true, 0, 0 )
	BlackFrame:setTopBottom( true, true, 0, 0 )
	BlackFrame:setRGB( 0, 0, 0 )
	BlackFrame:setAlpha( 0 )
	self:addElement( BlackFrame )
	self.BlackFrame = BlackFrame
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, true, 0, 0 )
	VSpanel:setTopBottom( true, true, 0, 0 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.45 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local IconGlowPanel = LUI.UIImage.new()
	IconGlowPanel:setLeftRight( false, false, -75.61, 94.5 )
	IconGlowPanel:setTopBottom( false, false, -68.39, 87.44 )
	IconGlowPanel:setRGB( 0, 0, 0 )
	IconGlowPanel:setAlpha( 0.3 )
	IconGlowPanel:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( IconGlowPanel )
	self.IconGlowPanel = IconGlowPanel
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( false, false, -63.97, 66.87 )
	FactionIcon:setTopBottom( false, false, -54.84, 73.89 )
	FactionIcon:setAlpha( 0.5 )
	FactionIcon:setScale( 1.2 )
	FactionIcon:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( true, false, 9, 89 )
	Score:setTopBottom( true, false, 0, 48 )
	Score:setAlpha( 0 )
	Score:setText( Engine.Localize( "200" ) )
	Score:setTTF( "fonts/default.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score )
	self.Score = Score
	
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
	
	local FactionColor = LUI.UIImage.new()
	FactionColor:setLeftRight( true, false, 2.02, 234 )
	FactionColor:setTopBottom( true, false, 0, 4 )
	FactionColor:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	FactionColor:setAlpha( 0 )
	self:addElement( FactionColor )
	self.FactionColor = FactionColor
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( false, false, -63.97, 66.87 )
				self.FactionIcon:setTopBottom( false, false, -54.84, 73.89 )
				self.clipFinished( FactionIcon, {} )
				ScoreboardFactionNameWidget:completeAnimation()
				self.ScoreboardFactionNameWidget:setLeftRight( true, false, 2.02, 139.04 )
				self.ScoreboardFactionNameWidget:setTopBottom( true, false, 0, 26 )
				self.clipFinished( ScoreboardFactionNameWidget, {} )
				FactionColor:completeAnimation()
				self.FactionColor:setAlpha( 0 )
				self.clipFinished( FactionColor, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FactionIcon:completeAnimation()
				self.FactionIcon:setLeftRight( false, false, -100.98, 103 )
				self.FactionIcon:setTopBottom( true, false, -12.84, 115.89 )
				self.clipFinished( FactionIcon, {} )
				FactionColor:completeAnimation()
				self.FactionColor:setAlpha( 1 )
				self.clipFinished( FactionColor, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Top3PlayerScoreBlurBox0:close()
		self.VSpanel:close()
		self.Score0:close()
		self.ScoreboardFactionNameWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

