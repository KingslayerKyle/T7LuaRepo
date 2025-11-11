require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.ScoreboardPingHeader = InheritFrom( LUI.UIElement )
CoD.ScoreboardPingHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardPingHeader )
	self.id = "ScoreboardPingHeader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 54 )
	self:setTopBottom( 0, 0, 0, 57 )
	
	local Top3PlayerScoreBlurBox00 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox00:setLeftRight( 0, 1, 0, 0 )
	Top3PlayerScoreBlurBox00:setTopBottom( 0, 1, 0, 0 )
	Top3PlayerScoreBlurBox00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	Top3PlayerScoreBlurBox00:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox00 )
	self.Top3PlayerScoreBlurBox00 = Top3PlayerScoreBlurBox00
	
	local VSpanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel0:setLeftRight( 0, 1, 0, 0 )
	VSpanel0:setTopBottom( 0, 1, 0, 0 )
	VSpanel0:setRGB( 0, 0, 0 )
	VSpanel0:setAlpha( 0.45 )
	self:addElement( VSpanel0 )
	self.VSpanel0 = VSpanel0
	
	local ScoreColumn5Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5Header:setLeftRight( 1, 1, -92, 38 )
	ScoreColumn5Header:setTopBottom( 0, 0, 0, 48 )
	ScoreColumn5Header:setAlpha( 0 )
	ScoreColumn5Header:setScale( LanguageOverrideNumber( "fulljapanese", 0.7, LanguageOverrideNumber( "japanese", 0.7, 1 ) ) )
	ScoreColumn5Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn5Header.Bg:setAlpha( 0 )
	ScoreColumn5Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn5Header.Text:setAlpha( 0.7 )
	ScoreColumn5Header.Text:setText( Engine.Localize( "CGAME_SB_PING" ) )
	ScoreColumn5Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn5Header.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn5Header )
	self.ScoreColumn5Header = ScoreColumn5Header
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Top3PlayerScoreBlurBox00:close()
		self.VSpanel0:close()
		self.ScoreColumn5Header:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

