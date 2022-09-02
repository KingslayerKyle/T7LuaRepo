-- f364b08aabc6afbef371e79f6d1201b5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardPingValue" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardRowDeathIconWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.AARScoreboardRowWidgetCP = InheritFrom( LUI.UIElement )
CoD.AARScoreboardRowWidgetCP.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AARScoreboardRowWidgetCP )
	self.id = "AARScoreboardRowWidgetCP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 853 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 0, -60 )
	BlackBar:setTopBottom( true, true, 0, 0 )
	BlackBar:setRGB( 0, 0, 0 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, true, 0, -60 )
	VSpanel:setTopBottom( true, true, 0, 0 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.45 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 23, 52 )
	Rank:setTopBottom( false, false, -12, 13 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( true, false, 52, 76 )
	RankIcon:setTopBottom( false, false, -12, 12 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 82.41, 352.5 )
	Gamertag:setTopBottom( false, false, -13.5, 11.5 )
	Gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ScoreColumn1 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1:setLeftRight( false, true, -493.09, -406.09 )
	ScoreColumn1:setTopBottom( true, true, 0, 0 )
	ScoreColumn1.Bg:setAlpha( 0.3 )
	ScoreColumn1.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn1.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2:setLeftRight( false, true, -406.09, -319.09 )
	ScoreColumn2:setTopBottom( true, true, 0, 0 )
	ScoreColumn2.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn2.Bg:setAlpha( 0 )
	ScoreColumn2.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3:setLeftRight( false, true, -319.09, -232.09 )
	ScoreColumn3:setTopBottom( true, true, 0, 0 )
	ScoreColumn3.Bg:setAlpha( 0.3 )
	ScoreColumn3.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn3.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn3 )
	self.ScoreColumn3 = ScoreColumn3
	
	local ScoreColumn4 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn4:setLeftRight( false, true, -232.09, -145.09 )
	ScoreColumn4:setTopBottom( true, true, 0, 0 )
	ScoreColumn4.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn4.Bg:setAlpha( 0 )
	ScoreColumn4.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn4.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn4 )
	self.ScoreColumn4 = ScoreColumn4
	
	local ScoreColumn5 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5:setLeftRight( false, true, -145.09, -62.09 )
	ScoreColumn5:setTopBottom( true, true, 0, 0 )
	ScoreColumn5.Bg:setAlpha( 0.3 )
	ScoreColumn5.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn5.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn5 )
	self.ScoreColumn5 = ScoreColumn5
	
	local PingBars = LUI.UIImage.new()
	PingBars:setLeftRight( false, true, -58.5, -36.67 )
	PingBars:setTopBottom( false, false, -11.34, 10.5 )
	PingBars:setAlpha( GetScoreboardPingBarAlpha( 1 ) )
	self:addElement( PingBars )
	self.PingBars = PingBars
	
	local PingValue = CoD.ScoreboardPingValue.new( menu, controller )
	PingValue:setLeftRight( false, true, -61, -25 )
	PingValue:setTopBottom( true, true, 0, 0 )
	PingValue:setAlpha( GetScoreboardPingValueAlpha( 1 ) )
	self:addElement( PingValue )
	self.PingValue = PingValue
	
	local VOIPImage = LUI.UIImage.new()
	VOIPImage:setLeftRight( true, false, 342, 363 )
	VOIPImage:setTopBottom( true, false, 2.5, 23.5 )
	VOIPImage:setAlpha( 0 )
	self:addElement( VOIPImage )
	self.VOIPImage = VOIPImage
	
	local ScoreboardRowDeathIconWidget = CoD.ScoreboardRowDeathIconWidget.new( menu, controller )
	ScoreboardRowDeathIconWidget:setLeftRight( true, false, 1, 24 )
	ScoreboardRowDeathIconWidget:setTopBottom( true, false, 1, 24 )
	ScoreboardRowDeathIconWidget:mergeStateConditions( {
		{
			stateName = "Dead",
			condition = function ( menu, element, event )
				return IsPlayerDead( element, controller )
			end
		}
	} )
	ScoreboardRowDeathIconWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "updateClientDeadStatus" ), function ( model )
		menu:updateElementState( ScoreboardRowDeathIconWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "updateClientDeadStatus"
		} )
	end )
	self:addElement( ScoreboardRowDeathIconWidget )
	self.ScoreboardRowDeathIconWidget = ScoreboardRowDeathIconWidget
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, -60 )
	FocusBarB:setTopBottom( false, true, -2, 2 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, -60 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.Rank:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			Rank:setText( Engine.Localize( GetScoreboardPlayerRank( controller, clientNum ) ) )
		end
	end )
	self.RankIcon:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			RankIcon:setImage( RegisterImage( GetScoreboardPlayerRankIcon( controller, clientNum ) ) )
		end
	end )
	self.Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			Gamertag:setText( GetClientName( controller, clientNum ) )
		end
	end )
	self.ScoreColumn1:linkToElementModel( self, "team", true, function ( model )
		local team = Engine.GetModelValue( model )
		if team then
			ScoreColumn1.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, team ) )
		end
	end )
	self.ScoreColumn1:linkToElementModel( self, "score", true, function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			ScoreColumn1.Text:setText( Engine.Localize( score ) )
		end
	end )
	self.ScoreColumn2:linkToElementModel( self, "kills", true, function ( model )
		local kills = Engine.GetModelValue( model )
		if kills then
			ScoreColumn2.Text:setText( Engine.Localize( kills ) )
		end
	end )
	self.ScoreColumn3:linkToElementModel( self, "team", true, function ( model )
		local team = Engine.GetModelValue( model )
		if team then
			ScoreColumn3.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, team ) )
		end
	end )
	self.ScoreColumn3:linkToElementModel( self, "assists", true, function ( model )
		local assists = Engine.GetModelValue( model )
		if assists then
			ScoreColumn3.Text:setText( Engine.Localize( assists ) )
		end
	end )
	self.ScoreColumn4:linkToElementModel( self, "deaths", true, function ( model )
		local deaths = Engine.GetModelValue( model )
		if deaths then
			ScoreColumn4.Text:setText( Engine.Localize( deaths ) )
		end
	end )
	self.ScoreColumn5:linkToElementModel( self, "team", true, function ( model )
		local team = Engine.GetModelValue( model )
		if team then
			ScoreColumn5.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, team ) )
		end
	end )
	self.ScoreColumn5:linkToElementModel( self, "revives", true, function ( model )
		local revives = Engine.GetModelValue( model )
		if revives then
			ScoreColumn5.Text:setText( Engine.Localize( revives ) )
		end
	end )
	self.PingBars:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )
		if ping then
			PingBars:setImage( RegisterImage( GetScoreboardPlayerPingBarImage( ping ) ) )
		end
	end )
	self.PingValue:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )
		if ping then
			PingValue.PingValue:setText( ping )
		end
	end )
	self.VOIPImage:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			VOIPImage:setupVoipImage( clientNum )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Rank:completeAnimation()
				self.Rank:setRGB( 1, 1, 1 )
				self.clipFinished( Rank, {} )

				RankIcon:completeAnimation()
				self.RankIcon:setRGB( 1, 1, 1 )
				self.clipFinished( RankIcon, {} )

				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
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

				ScoreColumn4:completeAnimation()

				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 1, 1 )
				self.ScoreColumn4.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn4, {} )

				ScoreColumn5:completeAnimation()

				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 1, 1 )
				self.ScoreColumn5.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn5, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Rank:completeAnimation()
				self.Rank:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Rank, {} )

				RankIcon:completeAnimation()
				self.RankIcon:setRGB( 1, 1, 1 )
				self.clipFinished( RankIcon, {} )

				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Gamertag, {} )

				ScoreColumn1:completeAnimation()

				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )

				ScoreColumn2:completeAnimation()

				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )

				ScoreColumn3:completeAnimation()

				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )

				ScoreColumn4:completeAnimation()

				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 1, 1 )
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )

				ScoreColumn5:completeAnimation()

				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 1, 1 )
				self.ScoreColumn5.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn5, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VSpanel:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5:close()
		element.PingValue:close()
		element.ScoreboardRowDeathIconWidget:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.Rank:close()
		element.RankIcon:close()
		element.Gamertag:close()
		element.PingBars:close()
		element.VOIPImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

