require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.NemesisScoreWidget = InheritFrom( LUI.UIElement )
CoD.NemesisScoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NemesisScoreWidget )
	self.id = "NemesisScoreWidget"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 192 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local ScoreTitle = LUI.UIText.new()
	ScoreTitle:setLeftRight( 0, 1, 0, 0 )
	ScoreTitle:setTopBottom( 0, 0, 8, 36 )
	ScoreTitle:setAlpha( 0.7 )
	ScoreTitle:setText( Engine.Localize( "MENU_KILLED_CAPS" ) )
	ScoreTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreTitle:setLetterSpacing( 0.9 )
	ScoreTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreTitle )
	self.ScoreTitle = ScoreTitle
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( 0, 1, 0, 0 )
	Score:setTopBottom( 0, 0, 33, 79 )
	Score:setText( Engine.Localize( "7" ) )
	Score:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score )
	self.Score = Score
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, -4, 2 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 0, 4 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

