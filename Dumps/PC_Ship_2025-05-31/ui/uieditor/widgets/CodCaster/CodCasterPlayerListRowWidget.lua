require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerListRowHighlight" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerListHeroStatus" )

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "objectivesUpdated" ), function ( model )
		local f2_local0 = self:getModel()
		if f2_local0 then
			local f2_local1 = Engine.GetModel( f2_local0, "clientNum" )
			if f2_local1 then
				local f2_local2 = Engine.GetModelValue( f2_local1 )
				self.ObjectiveStatus:setImage( RegisterImage( GetPlayerListObjectiveImage( controller, f2_local2 ) ) )
				self.ObjectiveStatus:setRGB( GetPlayerListObjectiveColor( controller, f2_local2 ) )
			end
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		local f3_local0 = self:getModel()
		if f3_local0 and self.Gamertag then
			local f3_local1 = Engine.GetModel( f3_local0, "clientNum" )
			if f3_local1 then
				self.Gamertag:setText( CodcasterGetDisplayPlayerName( controller, Engine.GetModelValue( f3_local1 ) ) )
			end
		end
	end )
end

CoD.CodCasterPlayerListRowWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerListRowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CodCasterPlayerListRowWidget )
	self.id = "CodCasterPlayerListRowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 330 )
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
	
	local WhiteFlashBar = LUI.UIImage.new()
	WhiteFlashBar:setLeftRight( true, true, 0, 0 )
	WhiteFlashBar:setTopBottom( true, true, 0, 0 )
	WhiteFlashBar:setAlpha( 0.05 )
	self:addElement( WhiteFlashBar )
	self.WhiteFlashBar = WhiteFlashBar
	
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
			Gamertag:setText( CodcasterGetDisplayPlayerName( controller, clientNum ) )
		end
	end )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ScoreColumn1 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1:setLeftRight( false, true, -132, -75 )
	ScoreColumn1:setTopBottom( true, false, -1, 24 )
	ScoreColumn1:setAlpha( 0 )
	ScoreColumn1.Bg:setAlpha( 0 )
	ScoreColumn1.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn1.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn1:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local clientNumScoreInfoUpdated = Engine.GetModelValue( model )
		if clientNumScoreInfoUpdated then
			ScoreColumn1.Text:setText( Engine.Localize( GetScoreboardKDScoreColumn( controller, 1, 2, clientNumScoreInfoUpdated ) ) )
		end
	end )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2:setLeftRight( false, true, -75, -40 )
	ScoreColumn2:setTopBottom( true, false, -1, 24 )
	ScoreColumn2:setAlpha( 0 )
	ScoreColumn2.Bg:setAlpha( 0 )
	ScoreColumn2.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn2:linkToElementModel( self, "currentStreak", true, function ( model )
		local currentStreak = Engine.GetModelValue( model )
		if currentStreak then
			ScoreColumn2.Text:setText( Engine.Localize( GetScoreboardCurrentStreak( controller, currentStreak ) ) )
		end
	end )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3:setLeftRight( false, true, -40, -5 )
	ScoreColumn3:setTopBottom( true, false, -1, 24 )
	ScoreColumn3:setAlpha( 0 )
	ScoreColumn3.Bg:setAlpha( 0 )
	ScoreColumn3.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn3.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
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
	Score01:setLeftRight( false, true, -117, -65 )
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
	Score010:setLeftRight( false, true, -67.5, -36 )
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
	Score0100:setLeftRight( false, true, -37.25, -5.75 )
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
	
	local ObjectiveStatus = LUI.UIImage.new()
	ObjectiveStatus:setLeftRight( true, false, 3, 23 )
	ObjectiveStatus:setTopBottom( true, false, 0, 20 )
	ObjectiveStatus:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local clientNumScoreInfoUpdated = Engine.GetModelValue( model )
		if clientNumScoreInfoUpdated then
			ObjectiveStatus:setRGB( GetPlayerListObjectiveColor( controller, clientNumScoreInfoUpdated ) )
		end
	end )
	ObjectiveStatus:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local clientNumScoreInfoUpdated = Engine.GetModelValue( model )
		if clientNumScoreInfoUpdated then
			ObjectiveStatus:setImage( RegisterImage( GetPlayerListObjectiveImage( controller, clientNumScoreInfoUpdated ) ) )
		end
	end )
	self:addElement( ObjectiveStatus )
	self.ObjectiveStatus = ObjectiveStatus
	
	local CodCasterPlayerListHeroStatus = CoD.CodCasterPlayerListHeroStatus.new( menu, controller )
	CodCasterPlayerListHeroStatus:setLeftRight( false, true, -5, 0 )
	CodCasterPlayerListHeroStatus:setTopBottom( true, false, 0, 20 )
	CodCasterPlayerListHeroStatus:linkToElementModel( self, nil, false, function ( model )
		CodCasterPlayerListHeroStatus:setModel( model, controller )
	end )
	self:addElement( CodCasterPlayerListHeroStatus )
	self.CodCasterPlayerListHeroStatus = CodCasterPlayerListHeroStatus
	
	local GlowWhiteOver = LUI.UIImage.new()
	GlowWhiteOver:setLeftRight( true, false, 43, 72 )
	GlowWhiteOver:setTopBottom( true, false, -183.98, 204.98 )
	GlowWhiteOver:setAlpha( 0 )
	GlowWhiteOver:setZRot( -90 )
	GlowWhiteOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver )
	self.GlowWhiteOver = GlowWhiteOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
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
				WhiteFlashBar:completeAnimation()
				self.WhiteFlashBar:setAlpha( 0 )
				self.clipFinished( WhiteFlashBar, {} )
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
				self:setupElementClipCounter( 13 )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				focus:completeAnimation()
				self.focus:setRGB( 1, 1, 1 )
				self.focus:setAlpha( 0.7 )
				self.clipFinished( focus, {} )
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, -1, 8 )
				self.arrow:setTopBottom( true, false, -4, 23 )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				WhiteFlashBar:completeAnimation()
				self.WhiteFlashBar:setAlpha( 0.05 )
				self.clipFinished( WhiteFlashBar, {} )
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
				self:setupElementClipCounter( 11 )
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
				WhiteFlashBar:completeAnimation()
				self.WhiteFlashBar:setAlpha( 0.05 )
				self.clipFinished( WhiteFlashBar, {} )
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
				self:setupElementClipCounter( 12 )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.8 )
				self.clipFinished( BlackBar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.clipFinished( highlight, {} )
				focus:completeAnimation()
				self.focus:setRGB( 1, 1, 1 )
				self.focus:setAlpha( 0.7 )
				self.clipFinished( focus, {} )
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, -1, 8 )
				self.arrow:setTopBottom( true, false, -4, 23 )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				local WhiteFlashBarFrame2 = function ( WhiteFlashBar, event )
					local WhiteFlashBarFrame3 = function ( WhiteFlashBar, event )
						if not event.interrupted then
							WhiteFlashBar:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						WhiteFlashBar:setAlpha( 0.05 )
						if event.interrupted then
							self.clipFinished( WhiteFlashBar, event )
						else
							WhiteFlashBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WhiteFlashBarFrame3( WhiteFlashBar, event )
						return 
					else
						WhiteFlashBar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						WhiteFlashBar:setAlpha( 0.35 )
						WhiteFlashBar:registerEventHandler( "transition_complete_keyframe", WhiteFlashBarFrame3 )
					end
				end
				
				WhiteFlashBar:completeAnimation()
				self.WhiteFlashBar:setAlpha( 0.05 )
				WhiteFlashBarFrame2( WhiteFlashBar, {} )
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
				local GlowWhiteOverFrame2 = function ( GlowWhiteOver, event )
					local GlowWhiteOverFrame3 = function ( GlowWhiteOver, event )
						if not event.interrupted then
							GlowWhiteOver:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						GlowWhiteOver:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowWhiteOver, event )
						else
							GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowWhiteOverFrame3( GlowWhiteOver, event )
						return 
					else
						GlowWhiteOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowWhiteOver:setAlpha( 0.5 )
						GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", GlowWhiteOverFrame3 )
					end
				end
				
				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setAlpha( 0 )
				GlowWhiteOverFrame2( GlowWhiteOver, {} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
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
		element.CodCasterPlayerListHeroStatus:close()
		element.Gamertag:close()
		element.ScoreboardRowDeathIcon:close()
		element.Score01:close()
		element.Score010:close()
		element.Score0100:close()
		element.ObjectiveStatus:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

