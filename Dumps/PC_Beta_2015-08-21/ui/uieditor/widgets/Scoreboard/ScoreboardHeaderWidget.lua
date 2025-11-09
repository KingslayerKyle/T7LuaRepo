require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardPingHeader" )

CoD.ScoreboardHeaderWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardHeaderWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardHeaderWidget )
	self.id = "ScoreboardHeaderWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 868 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( true, true, 0.5, 0.5 )
	Top3PlayerScoreBlurBox0:setTopBottom( true, true, 0, 0 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 0, 0 )
	BlackBar:setTopBottom( true, true, 0, 0 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, true, 0.5, 0.5 )
	VSpanel:setTopBottom( true, true, 0, 0 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.45 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local GametypeAndMapName = LUI.UIText.new()
	GametypeAndMapName:setLeftRight( true, false, 9, 325 )
	GametypeAndMapName:setTopBottom( true, false, 7.5, 26.5 )
	GametypeAndMapName:setRGB( 0.88, 0.89, 0.93 )
	GametypeAndMapName:setAlpha( 0.8 )
	GametypeAndMapName:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER" ) )
	GametypeAndMapName:setTTF( "fonts/escom.ttf" )
	GametypeAndMapName:setLetterSpacing( 2 )
	GametypeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GametypeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GametypeAndMapName )
	self.GametypeAndMapName = GametypeAndMapName
	
	local ScoreColumn1Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1Header:setLeftRight( false, true, -433.5, -346.5 )
	ScoreColumn1Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn1Header:setAlpha( 0.9 )
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
	ScoreColumn2Header:setAlpha( 0.9 )
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
	ScoreColumn3Header:setAlpha( 0.9 )
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
	ScoreColumn4Header:setAlpha( 0.9 )
	ScoreColumn4Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn4Header.Bg:setAlpha( 0 )
	ScoreColumn4Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn4Header.Text:setAlpha( 0.7 )
	ScoreColumn4Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 3, "Score" ) ) )
	ScoreColumn4Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn4Header )
	self.ScoreColumn4Header = ScoreColumn4Header
	
	local ScoreColumn5Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5Header:setLeftRight( false, true, -88.5, -1.5 )
	ScoreColumn5Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn5Header:setAlpha( 0.9 )
	ScoreColumn5Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn5Header.Bg:setAlpha( 0 )
	ScoreColumn5Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn5Header.Text:setAlpha( 0.7 )
	ScoreColumn5Header.Text:setText( Engine.Localize( GetScoreboardColumnName( controller, 4, "Score" ) ) )
	ScoreColumn5Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn5Header )
	self.ScoreColumn5Header = ScoreColumn5Header
	
	local PingHeader = CoD.ScoreboardPingHeader.new( menu, controller )
	PingHeader:setLeftRight( false, true, 0, 34 )
	PingHeader:setTopBottom( true, false, 0, 32 )
	PingHeader:setAlpha( GetScoreboardPingValueAlpha( 0.8 ) )
	self:addElement( PingHeader )
	self.PingHeader = PingHeader
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Top3PlayerScoreBlurBox0:close()
		element.VSpanel:close()
		element.ScoreColumn1Header:close()
		element.ScoreColumn2Header:close()
		element.ScoreColumn3Header:close()
		element.ScoreColumn4Header:close()
		element.ScoreColumn5Header:close()
		element.PingHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

