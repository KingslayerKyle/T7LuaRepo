-- 80e83a6529581fcf89ca04c42e07f29d
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local ScoreTitle = LUI.UIText.new()
	ScoreTitle:setLeftRight( true, true, 0, 0 )
	ScoreTitle:setTopBottom( true, false, 5.06, 24.06 )
	ScoreTitle:setAlpha( 0.7 )
	ScoreTitle:setText( Engine.Localize( "MENU_KILLED_CAPS" ) )
	ScoreTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreTitle:setLetterSpacing( 0.9 )
	ScoreTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreTitle )
	self.ScoreTitle = ScoreTitle
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( true, true, 0, 0 )
	Score:setTopBottom( true, false, 21.5, 52.5 )
	Score:setText( Engine.Localize( "7" ) )
	Score:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score )
	self.Score = Score
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2.43, 1.57 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 0, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

