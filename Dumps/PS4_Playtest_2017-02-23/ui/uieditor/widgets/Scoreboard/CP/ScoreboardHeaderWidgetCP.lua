require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardPingHeader" )

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
	self:setLeftRight( 0, 0, 0, 1125 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, -20 )
	Panel:setTopBottom( 0, 1, 0, 0 )
	Panel:setRGB( 0.6, 0.6, 0.6 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local ScoreColumn1Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1Header:setLeftRight( 1, 1, -667, -537 )
	ScoreColumn1Header:setTopBottom( 0, 0, 0, 48 )
	ScoreColumn1Header:setAlpha( 0.9 )
	ScoreColumn1Header:setScale( LanguageOverrideNumber( "fulljapanese", 0.7, LanguageOverrideNumber( "japanese", 0.7, 1 ) ) )
	ScoreColumn1Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn1Header.Bg:setAlpha( 0 )
	ScoreColumn1Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn1Header.Text:setAlpha( 0.7 )
	ScoreColumn1Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 0, "Score" ) ) )
	ScoreColumn1Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn1Header.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn1Header )
	self.ScoreColumn1Header = ScoreColumn1Header
	
	local ScoreColumn2Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2Header:setLeftRight( 1, 1, -533, -403 )
	ScoreColumn2Header:setTopBottom( 0, 0, 0, 48 )
	ScoreColumn2Header:setAlpha( 0.9 )
	ScoreColumn2Header:setScale( LanguageOverrideNumber( "fulljapanese", 0.7, LanguageOverrideNumber( "japanese", 0.7, 1 ) ) )
	ScoreColumn2Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn2Header.Bg:setAlpha( 0 )
	ScoreColumn2Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn2Header.Text:setAlpha( 0.7 )
	ScoreColumn2Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 1, "Score" ) ) )
	ScoreColumn2Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2Header.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn2Header )
	self.ScoreColumn2Header = ScoreColumn2Header
	
	local ScoreColumn3Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3Header:setLeftRight( 1, 1, -404, -274 )
	ScoreColumn3Header:setTopBottom( 0, 0, 0, 48 )
	ScoreColumn3Header:setAlpha( 0.9 )
	ScoreColumn3Header:setScale( LanguageOverrideNumber( "fulljapanese", 0.7, LanguageOverrideNumber( "japanese", 0.7, 1 ) ) )
	ScoreColumn3Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn3Header.Bg:setAlpha( 0 )
	ScoreColumn3Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn3Header.Text:setAlpha( 0.7 )
	ScoreColumn3Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 2, "Score" ) ) )
	ScoreColumn3Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn3Header.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn3Header )
	self.ScoreColumn3Header = ScoreColumn3Header
	
	local ScoreColumn4Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn4Header:setLeftRight( 1, 1, -275, -145 )
	ScoreColumn4Header:setTopBottom( 0, 0, 0, 48 )
	ScoreColumn4Header:setAlpha( 0.8 )
	ScoreColumn4Header:setScale( LanguageOverrideNumber( "fulljapanese", 0.7, LanguageOverrideNumber( "japanese", 0.7, 1 ) ) )
	ScoreColumn4Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn4Header.Bg:setAlpha( 0 )
	ScoreColumn4Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn4Header.Text:setAlpha( 0.7 )
	ScoreColumn4Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 3, "Score" ) ) )
	ScoreColumn4Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn4Header.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn4Header )
	self.ScoreColumn4Header = ScoreColumn4Header
	
	local ScoreColumn5Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5Header:setLeftRight( 1, 1, -148, -15 )
	ScoreColumn5Header:setTopBottom( 0, 0, 0, 48 )
	ScoreColumn5Header:setAlpha( 0.9 )
	ScoreColumn5Header:setScale( LanguageOverrideNumber( "fulljapanese", 0.7, LanguageOverrideNumber( "japanese", 0.7, 1 ) ) )
	ScoreColumn5Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn5Header.Bg:setAlpha( 0 )
	ScoreColumn5Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn5Header.Text:setAlpha( 0.7 )
	ScoreColumn5Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 4, "Score" ) ) )
	ScoreColumn5Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn5Header.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn5Header )
	self.ScoreColumn5Header = ScoreColumn5Header
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 18, 526 )
	Title:setTopBottom( 0, 0, 10, 38 )
	Title:setAlpha( 0.8 )
	Title:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER_CP" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setLetterSpacing( 2 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local PingHeader = CoD.ScoreboardPingHeader.new( menu, controller )
	PingHeader:setLeftRight( 1, 1, -22, 36 )
	PingHeader:setTopBottom( 0, 0, 0, 48 )
	PingHeader:setAlpha( GetScoreboardPingValueAlpha( 1 ) )
	self:addElement( PingHeader )
	self.PingHeader = PingHeader
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
		self.ScoreColumn1Header:close()
		self.ScoreColumn2Header:close()
		self.ScoreColumn3Header:close()
		self.ScoreColumn4Header:close()
		self.ScoreColumn5Header:close()
		self.PingHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

