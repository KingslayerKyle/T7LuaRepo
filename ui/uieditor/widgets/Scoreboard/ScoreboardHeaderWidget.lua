-- ccabd72e3d1bc43a3cea05f557988d4f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardPingHeader" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardHeaderTitleWidget" )

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
	
	local ScoreColumn1Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1Header:setLeftRight( false, true, -433.5, -346.5 )
	ScoreColumn1Header:setTopBottom( true, false, 0, 32 )
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
	ScoreColumn2Header:setLeftRight( false, true, -346.5, -259.5 )
	ScoreColumn2Header:setTopBottom( true, false, 0, 32 )
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
	ScoreColumn3Header:setLeftRight( false, true, -258.5, -171.5 )
	ScoreColumn3Header:setTopBottom( true, false, 0, 32 )
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
	ScoreColumn4Header:setLeftRight( false, true, -172.5, -85.5 )
	ScoreColumn4Header:setTopBottom( true, false, 0, 32 )
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
	ScoreColumn5Header:setLeftRight( false, true, -88.5, -1.5 )
	ScoreColumn5Header:setTopBottom( true, false, 0, 32 )
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
	PingHeader:setLeftRight( false, true, 0, 36 )
	PingHeader:setTopBottom( true, false, 0, 32 )
	PingHeader:setAlpha( GetScoreboardPingBarAlpha( 1 ) )
	self:addElement( PingHeader )
	self.PingHeader = PingHeader
	
	local GameTimer = LUI.UITightText.new()
	GameTimer:setLeftRight( true, false, 9, 63 )
	GameTimer:setTopBottom( true, false, 7.5, 25.5 )
	GameTimer:setTTF( "fonts/escom.ttf" )
	GameTimer:setLetterSpacing( 0.5 )
	GameTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTimer:subscribeToGlobalModel( controller, "GameScore", "gameTimeEnd", function ( model )
		if Engine.GetModelValue( model ) then
			GameTimer:setupGameTimer()
		end
	end )
	GameTimer:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	local ScoreboardHeaderTitleWidget0 = CoD.ScoreboardHeaderTitleWidget.new( menu, controller )
	ScoreboardHeaderTitleWidget0:setLeftRight( true, false, 9, 303 )
	ScoreboardHeaderTitleWidget0:setTopBottom( true, false, 7, 25 )
	self:addElement( ScoreboardHeaderTitleWidget0 )
	self.ScoreboardHeaderTitleWidget0 = ScoreboardHeaderTitleWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GameTimer:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.clipFinished( GameTimer, {} )

				ScoreboardHeaderTitleWidget0:completeAnimation()
				self.ScoreboardHeaderTitleWidget0:setLeftRight( true, false, 9, 303 )
				self.ScoreboardHeaderTitleWidget0:setTopBottom( true, false, 7, 25 )
				self.clipFinished( ScoreboardHeaderTitleWidget0, {} )
			end
		},
		ShowTimer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GameTimer:completeAnimation()
				self.GameTimer:setLeftRight( true, false, 9, 63 )
				self.GameTimer:setTopBottom( true, false, 7, 25 )
				self.GameTimer:setAlpha( 1 )
				self.clipFinished( GameTimer, {} )

				ScoreboardHeaderTitleWidget0:completeAnimation()
				self.ScoreboardHeaderTitleWidget0:setLeftRight( true, false, 76, 370 )
				self.ScoreboardHeaderTitleWidget0:setTopBottom( true, false, 7, 25 )
				self.clipFinished( ScoreboardHeaderTitleWidget0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ShowTimer",
			condition = function ( menu, element, event )
				local f6_local0 = IsMultiplayer()
				if f6_local0 then
					f6_local0 = IsInGame()
					if f6_local0 then
						f6_local0 = IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 )
					end
				end
				return f6_local0
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Top3PlayerScoreBlurBox0:close()
		element.VSpanel:close()
		element.ScoreColumn1Header:close()
		element.ScoreColumn2Header:close()
		element.ScoreColumn3Header:close()
		element.ScoreColumn4Header:close()
		element.ScoreColumn5Header:close()
		element.PingHeader:close()
		element.ScoreboardHeaderTitleWidget0:close()
		element.GameTimer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
