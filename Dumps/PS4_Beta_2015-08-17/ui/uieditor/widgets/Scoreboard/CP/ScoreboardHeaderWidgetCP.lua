require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

CoD.ScoreboardHeaderWidgetCP = InheritFrom( LUI.UIElement )
CoD.ScoreboardHeaderWidgetCP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardHeaderWidgetCP )
	self.id = "ScoreboardHeaderWidgetCP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 802 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 30 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0.6, 0.6, 0.6 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local ScoreColumn1Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1Header:setLeftRight( false, true, -433.5, -346.5 )
	ScoreColumn1Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn1Header:setAlpha( 0.8 )
	ScoreColumn1Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn1Header.Bg:setAlpha( 0 )
	ScoreColumn1Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn1Header.Text:setAlpha( 0.7 )
	ScoreColumn1Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 0, "Score" ) ) )
	ScoreColumn1Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn1Header )
	self.ScoreColumn1Header = ScoreColumn1Header
	
	local ScoreColumn2Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2Header:setLeftRight( false, true, -346.5, -259.5 )
	ScoreColumn2Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn2Header:setAlpha( 0.8 )
	ScoreColumn2Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn2Header.Bg:setAlpha( 0 )
	ScoreColumn2Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn2Header.Text:setAlpha( 0.7 )
	ScoreColumn2Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 1, "Score" ) ) )
	ScoreColumn2Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn2Header )
	self.ScoreColumn2Header = ScoreColumn2Header
	
	local ScoreColumn3Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3Header:setLeftRight( false, true, -258.5, -171.5 )
	ScoreColumn3Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn3Header:setAlpha( 0.8 )
	ScoreColumn3Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn3Header.Bg:setAlpha( 0 )
	ScoreColumn3Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn3Header.Text:setAlpha( 0.7 )
	ScoreColumn3Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 2, "Score" ) ) )
	ScoreColumn3Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn3Header )
	self.ScoreColumn3Header = ScoreColumn3Header
	
	local ScoreColumn4Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn4Header:setLeftRight( false, true, -172.5, -85.5 )
	ScoreColumn4Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn4Header:setAlpha( 0.8 )
	ScoreColumn4Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn4Header.Bg:setAlpha( 0 )
	ScoreColumn4Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn4Header.Text:setAlpha( 0.7 )
	ScoreColumn4Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 3, "Score" ) ) )
	ScoreColumn4Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn4Header )
	self.ScoreColumn4Header = ScoreColumn4Header
	
	local ScoreColumn5Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5Header:setLeftRight( false, true, -88.5, 0 )
	ScoreColumn5Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn5Header:setAlpha( 0.8 )
	ScoreColumn5Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn5Header.Bg:setAlpha( 0 )
	ScoreColumn5Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn5Header.Text:setAlpha( 0.7 )
	ScoreColumn5Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 4, "Score" ) ) )
	ScoreColumn5Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn5Header )
	self.ScoreColumn5Header = ScoreColumn5Header
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
		self.ScoreColumn1Header:close()
		self.ScoreColumn2Header:close()
		self.ScoreColumn3Header:close()
		self.ScoreColumn4Header:close()
		self.ScoreColumn5Header:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

