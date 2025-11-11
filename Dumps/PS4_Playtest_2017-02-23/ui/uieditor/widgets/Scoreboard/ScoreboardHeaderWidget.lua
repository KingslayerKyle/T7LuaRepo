require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardHeaderTitleWidget" )
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
	self:setLeftRight( 0, 0, 0, 1302 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( 0, 1, 1, 1 )
	Top3PlayerScoreBlurBox0:setTopBottom( 0, 1, 0, 0 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( 0, 1, 0, 0 )
	BlackBar:setTopBottom( 0, 1, 0, 0 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( 0, 1, 1, 1 )
	VSpanel:setTopBottom( 0, 1, 0, 0 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.45 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local ScoreColumn1Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1Header:setLeftRight( 1, 1, -650, -520 )
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
	ScoreColumn2Header:setLeftRight( 1, 1, -519, -389 )
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
	ScoreColumn3Header:setLeftRight( 1, 1, -387, -257 )
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
	ScoreColumn4Header:setLeftRight( 1, 1, -259, -129 )
	ScoreColumn4Header:setTopBottom( 0, 0, 0, 48 )
	ScoreColumn4Header:setAlpha( 0.9 )
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
	ScoreColumn5Header:setLeftRight( 1, 1, -133, -3 )
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
	
	local PingHeader = CoD.ScoreboardPingHeader.new( menu, controller )
	PingHeader:setLeftRight( 1, 1, 0, 54 )
	PingHeader:setTopBottom( 0, 0, 0, 48 )
	PingHeader:setAlpha( GetScoreboardPingBarAlpha( 1 ) )
	self:addElement( PingHeader )
	self.PingHeader = PingHeader
	
	local GameTimer = LUI.UITightText.new()
	GameTimer:setLeftRight( 0, 0, 13, 94 )
	GameTimer:setTopBottom( 0, 0, 11, 38 )
	GameTimer:setTTF( "fonts/escom.ttf" )
	GameTimer:setLetterSpacing( 0.5 )
	GameTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTimer:subscribeToGlobalModel( controller, "GameScore", "gameTimeEnd", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTimer:setupGameTimer()
		end
	end )
	GameTimer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	local ScoreboardHeaderTitleWidget0 = CoD.ScoreboardHeaderTitleWidget.new( menu, controller )
	ScoreboardHeaderTitleWidget0:setLeftRight( 0, 0, 13.5, 454.5 )
	ScoreboardHeaderTitleWidget0:setTopBottom( 0, 0, 10.5, 37.5 )
	self:addElement( ScoreboardHeaderTitleWidget0 )
	self.ScoreboardHeaderTitleWidget0 = ScoreboardHeaderTitleWidget0
	
	self.resetProperties = function ()
		GameTimer:completeAnimation()
		ScoreboardHeaderTitleWidget0:completeAnimation()
		GameTimer:setLeftRight( 0, 0, 13, 94 )
		GameTimer:setTopBottom( 0, 0, 11, 38 )
		GameTimer:setAlpha( 1 )
		ScoreboardHeaderTitleWidget0:setLeftRight( 0, 0, 13.5, 454.5 )
		ScoreboardHeaderTitleWidget0:setTopBottom( 0, 0, 10.5, 37.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				GameTimer:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.clipFinished( GameTimer, {} )
			end
		},
		ShowTimer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				GameTimer:completeAnimation()
				self.GameTimer:setLeftRight( 0, 0, 13, 94 )
				self.GameTimer:setTopBottom( 0, 0, 10, 37 )
				self.clipFinished( GameTimer, {} )
				ScoreboardHeaderTitleWidget0:completeAnimation()
				self.ScoreboardHeaderTitleWidget0:setLeftRight( 0, 0, 113.5, 554.5 )
				self.ScoreboardHeaderTitleWidget0:setTopBottom( 0, 0, 10.5, 37.5 )
				self.clipFinished( ScoreboardHeaderTitleWidget0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowTimer",
			condition = function ( menu, element, event )
				local f7_local0 = IsMultiplayer()
				if f7_local0 then
					f7_local0 = IsInGame()
					if f7_local0 then
						f7_local0 = IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 )
					end
				end
				return f7_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeEnd" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeEnd"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Top3PlayerScoreBlurBox0:close()
		self.VSpanel:close()
		self.ScoreColumn1Header:close()
		self.ScoreColumn2Header:close()
		self.ScoreColumn3Header:close()
		self.ScoreColumn4Header:close()
		self.ScoreColumn5Header:close()
		self.PingHeader:close()
		self.ScoreboardHeaderTitleWidget0:close()
		self.GameTimer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

