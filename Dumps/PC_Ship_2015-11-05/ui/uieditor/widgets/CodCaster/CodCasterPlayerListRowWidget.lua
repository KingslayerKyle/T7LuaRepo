require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerListRowHighlight" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.CodCasterPlayerListRowWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerListRowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterPlayerListRowWidget )
	self.id = "CodCasterPlayerListRowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 307 )
	self:setTopBottom( true, false, 0, 20 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 0, 0 )
	BlackBar:setTopBottom( true, true, 0, 0 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0.7 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local highlight = CoD.CodCasterPlayerListRowHighlight.new( menu, controller )
	highlight:setLeftRight( true, false, -2, 318 )
	highlight:setTopBottom( true, false, -4, 23 )
	highlight:linkToElementModel( self, nil, false, function ( model )
		highlight:setModel( model, controller )
	end )
	self:addElement( highlight )
	self.highlight = highlight
	
	local focus = LUI.UIImage.new()
	focus:setLeftRight( true, false, -1, 335 )
	focus:setTopBottom( true, false, -4, 23 )
	focus:setAlpha( 0 )
	focus:setImage( RegisterImage( "uie_t7_codcaster_focusback" ) )
	self:addElement( focus )
	self.focus = focus
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, -2, 7 )
	arrow:setTopBottom( true, false, -4, 23 )
	arrow:setImage( RegisterImage( "uie_t7_codcaster_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 23, 211 )
	Gamertag:setTopBottom( true, false, 1, 20 )
	Gamertag:setRGB( 1, 0.84, 0 )
	Gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			Gamertag:setText( GetClientName( controller, clientNum ) )
		end
	end )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ScoreColumn1 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1:setLeftRight( false, true, -127, -70 )
	ScoreColumn1:setTopBottom( true, false, -1, 24 )
	ScoreColumn1:setAlpha( 0 )
	ScoreColumn1.Bg:setAlpha( 0 )
	ScoreColumn1.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn1:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local clientNumScoreInfoUpdated = Engine.GetModelValue( model )
		if clientNumScoreInfoUpdated then
			ScoreColumn1.Text:setText( Engine.Localize( GetScoreboardKDScoreColumn( controller, 1, 2, clientNumScoreInfoUpdated ) ) )
		end
	end )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2:setLeftRight( false, true, -70, -35 )
	ScoreColumn2:setTopBottom( true, false, -1, 24 )
	ScoreColumn2:setAlpha( 0 )
	ScoreColumn2.Bg:setAlpha( 0 )
	ScoreColumn2.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2:linkToElementModel( self, "currentStreak", true, function ( model )
		local currentStreak = Engine.GetModelValue( model )
		if currentStreak then
			ScoreColumn2.Text:setText( Engine.Localize( GetScoreboardCurrentStreak( controller, currentStreak ) ) )
		end
	end )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3:setLeftRight( false, true, -35, 0 )
	ScoreColumn3:setTopBottom( true, false, -1, 24 )
	ScoreColumn3:setAlpha( 0 )
	ScoreColumn3.Bg:setAlpha( 0 )
	ScoreColumn3.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn3:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local clientNumScoreInfoUpdated = Engine.GetModelValue( model )
		if clientNumScoreInfoUpdated then
			ScoreColumn3.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, clientNumScoreInfoUpdated ) ) )
		end
	end )
	self:addElement( ScoreColumn3 )
	self.ScoreColumn3 = ScoreColumn3
	
	local ScoreboardRowDeathIcon = LUI.UIImage.new()
	ScoreboardRowDeathIcon:setLeftRight( true, false, 3, 22 )
	ScoreboardRowDeathIcon:setTopBottom( true, false, 0, 19 )
	ScoreboardRowDeathIcon:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			ScoreboardRowDeathIcon:setupClientStatusImage( clientNum )
		end
	end )
	self:addElement( ScoreboardRowDeathIcon )
	self.ScoreboardRowDeathIcon = ScoreboardRowDeathIcon
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -2, 2 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local Score01 = LUI.UIText.new()
	Score01:setLeftRight( false, true, -112, -60 )
	Score01:setTopBottom( true, false, 1, 19 )
	Score01:setAlpha( 0.6 )
	Score01:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Score01:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score01:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score01:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local clientNumScoreInfoUpdated = Engine.GetModelValue( model )
		if clientNumScoreInfoUpdated then
			Score01:setText( Engine.Localize( GetScoreboardKDScoreColumn( controller, 1, 2, clientNumScoreInfoUpdated ) ) )
		end
	end )
	self:addElement( Score01 )
	self.Score01 = Score01
	
	local Score010 = LUI.UIText.new()
	Score010:setLeftRight( false, true, -62.5, -31 )
	Score010:setTopBottom( true, false, 1, 19 )
	Score010:setAlpha( 0.6 )
	Score010:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Score010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score010:linkToElementModel( self, "currentStreak", true, function ( model )
		local currentStreak = Engine.GetModelValue( model )
		if currentStreak then
			Score010:setText( Engine.Localize( GetScoreboardCurrentStreak( controller, currentStreak ) ) )
		end
	end )
	self:addElement( Score010 )
	self.Score010 = Score010
	
	local Score0100 = LUI.UIText.new()
	Score0100:setLeftRight( false, true, -32.25, -0.75 )
	Score0100:setTopBottom( true, false, 1, 19 )
	Score0100:setAlpha( 0.6 )
	Score0100:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Score0100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score0100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score0100:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local clientNumScoreInfoUpdated = Engine.GetModelValue( model )
		if clientNumScoreInfoUpdated then
			Score0100:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, clientNumScoreInfoUpdated ) ) )
		end
	end )
	self:addElement( Score0100 )
	self.Score0100 = Score0100
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				focus:completeAnimation()
				self.focus:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.focus:setAlpha( 0 )
				self.clipFinished( focus, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
				self.Gamertag:setAlpha( 0.6 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.ScoreColumn1.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.ScoreColumn2.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.ScoreColumn3.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn3, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				Score01:completeAnimation()
				self.Score01:setAlpha( 0.6 )
				self.clipFinished( Score01, {} )
				Score010:completeAnimation()
				self.Score010:setAlpha( 0.6 )
				self.clipFinished( Score010, {} )
				Score0100:completeAnimation()
				self.Score0100:setAlpha( 0.6 )
				self.clipFinished( Score0100, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				focus:completeAnimation()
				self.focus:setRGB( 1, 1, 1 )
				self.focus:setAlpha( 0.5 )
				self.clipFinished( focus, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
				self.Gamertag:setAlpha( 1 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.ScoreColumn1.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.ScoreColumn2.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.ScoreColumn3.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn3, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				Score01:completeAnimation()
				self.Score01:setAlpha( 1 )
				self.clipFinished( Score01, {} )
				Score010:completeAnimation()
				self.Score010:setAlpha( 1 )
				self.clipFinished( Score010, {} )
				Score0100:completeAnimation()
				self.Score0100:setAlpha( 1 )
				self.clipFinished( Score0100, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.clipFinished( highlight, {} )
				focus:completeAnimation()
				self.focus:setAlpha( 0 )
				self.clipFinished( focus, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0 )
				self.Gamertag:setAlpha( 1 )
				self.clipFinished( Gamertag, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				Score01:completeAnimation()
				self.Score01:setAlpha( 0.6 )
				self.clipFinished( Score01, {} )
				Score010:completeAnimation()
				self.Score010:setAlpha( 0.6 )
				self.clipFinished( Score010, {} )
				Score0100:completeAnimation()
				self.Score0100:setAlpha( 0.6 )
				self.clipFinished( Score0100, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.8 )
				self.clipFinished( BlackBar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.clipFinished( highlight, {} )
				focus:completeAnimation()
				self.focus:setRGB( 1, 1, 1 )
				self.focus:setAlpha( 0.5 )
				self.clipFinished( focus, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
				self.Gamertag:setAlpha( 1 )
				self.clipFinished( Gamertag, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				Score01:completeAnimation()
				self.Score01:setAlpha( 1 )
				self.clipFinished( Score01, {} )
				Score010:completeAnimation()
				self.Score010:setAlpha( 1 )
				self.clipFinished( Score010, {} )
				Score0100:completeAnimation()
				self.Score0100:setAlpha( 1 )
				self.clipFinished( Score0100, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	highlight.id = "highlight"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.highlight:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.highlight:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.Gamertag:close()
		element.ScoreboardRowDeathIcon:close()
		element.Score01:close()
		element.Score010:close()
		element.Score0100:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

