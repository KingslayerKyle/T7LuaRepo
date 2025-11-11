require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Scoreboard.scoreboardPingBackground" )

local PostLoadFunc = function ( self, controller, menu )
	local isCoDCasterModel = Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" )
	self:subscribeToModel( isCoDCasterModel, function ( model )
		local teamModel = self:getModel( controller, "team" )
		if teamModel then
			teamModel:forceNotifySubscriptions()
		end
	end )
end

CoD.ScoreboardRowWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardRowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardRowWidget )
	self.id = "ScoreboardRowWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1279 )
	self:setTopBottom( 0, 0, 0, 37 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( 0, 1, 0, -90 )
	BlackBar:setTopBottom( 0, 1, 0, 0 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( 0, 1, 0, -90 )
	Top3PlayerScoreBlurBox0:setTopBottom( 0, 1, 0, 0 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( 0, 1, 0, -90 )
	VSpanel:setTopBottom( 0, 1, 0, 0 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.45 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0, 0, 34, 78 )
	Rank:setTopBottom( 0.5, 0.5, -16, 17 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setRGB( SetToParagonColorIfPrestigeMasterForScoreboard( controller, 255, 255, 255, modelValue ) )
		end
	end )
	Rank:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( Engine.Localize( GetScoreboardPlayerRank( controller, modelValue ) ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( 0, 0, 78, 114 )
	RankIcon:setTopBottom( 0.5, 0.5, -18, 18 )
	RankIcon:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIcon:setImage( RegisterImage( GetScoreboardPlayerRankIcon( controller, modelValue ) ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( 0, 0, 124, 503 )
	Gamertag:setTopBottom( 0.5, 0.5, -18, 15 )
	Gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gamertag:setText( GetClientNameAndClanTag( controller, modelValue ) )
		end
	end )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ScoreColumn1 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1:setLeftRight( 1, 1, -739, -609 )
	ScoreColumn1:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn1.Bg:setAlpha( 0.3 )
	ScoreColumn1.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn1.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn1:linkToElementModel( self, "team", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, modelValue ) )
		end
	end )
	ScoreColumn1:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 0, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2:setLeftRight( 1, 1, -609, -479 )
	ScoreColumn2:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn2.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn2.Bg:setAlpha( 0 )
	ScoreColumn2.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn2:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn2.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 1, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3:setLeftRight( 1, 1, -478, -348 )
	ScoreColumn3:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn3.Bg:setAlpha( 0.3 )
	ScoreColumn3.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn3.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn3:linkToElementModel( self, "team", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, modelValue ) )
		end
	end )
	ScoreColumn3:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn3 )
	self.ScoreColumn3 = ScoreColumn3
	
	local ScoreColumn4 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn4:setLeftRight( 1, 1, -348, -218 )
	ScoreColumn4:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn4.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn4.Bg:setAlpha( 0 )
	ScoreColumn4.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn4.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn4:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn4.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn4 )
	self.ScoreColumn4 = ScoreColumn4
	
	local ScoreColumn5 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5:setLeftRight( 1, 1, -217, -93 )
	ScoreColumn5:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn5.Bg:setAlpha( 0.3 )
	ScoreColumn5.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn5.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn5:linkToElementModel( self, "team", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn5.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, modelValue ) )
		end
	end )
	ScoreColumn5:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn5.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 4, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn5 )
	self.ScoreColumn5 = ScoreColumn5
	
	local pvBackground = LUI.UIImage.new()
	pvBackground:setLeftRight( 1, 1, -90, -36 )
	pvBackground:setTopBottom( 0, 1, 0, 0 )
	pvBackground:setRGB( 0.35, 0.3, 0.3 )
	pvBackground:setAlpha( GetScoreboardPingValueAlpha( 0.5 ) )
	self:addElement( pvBackground )
	self.pvBackground = pvBackground
	
	local scoreboardPingBackground = CoD.scoreboardPingBackground.new( menu, controller )
	scoreboardPingBackground:setLeftRight( 0, 0, 1189, 1243 )
	scoreboardPingBackground:setTopBottom( 0, 0, 0, 38 )
	scoreboardPingBackground:linkToElementModel( self, "ping", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			scoreboardPingBackground:setAlpha( GetScoreboardPingBarAlpha( modelValue ) )
		end
	end )
	scoreboardPingBackground:linkToElementModel( self, nil, false, function ( model )
		scoreboardPingBackground:setModel( model, controller )
	end )
	self:addElement( scoreboardPingBackground )
	self.scoreboardPingBackground = scoreboardPingBackground
	
	local PingText = LUI.UIText.new()
	PingText:setLeftRight( 1, 1, -90, -42 )
	PingText:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	PingText:setAlpha( GetScoreboardPingValueAlpha( 1 ) )
	PingText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PingText:linkToElementModel( self, "ping", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PingText:setText( modelValue )
		end
	end )
	self:addElement( PingText )
	self.PingText = PingText
	
	local VOIPImage = LUI.UIImage.new()
	VOIPImage:setLeftRight( 0, 0, 513, 545 )
	VOIPImage:setTopBottom( 0, 0, 4, 36 )
	VOIPImage:setAlpha( 0 )
	VOIPImage:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VOIPImage:setupVoipImage( modelValue )
		end
	end )
	self:addElement( VOIPImage )
	self.VOIPImage = VOIPImage
	
	local ScoreboardRowDeathIcon = LUI.UIImage.new()
	ScoreboardRowDeathIcon:setLeftRight( 0, 0, 0, 34 )
	ScoreboardRowDeathIcon:setTopBottom( 0, 0, 2, 36 )
	ScoreboardRowDeathIcon:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardRowDeathIcon:setupClientStatusImage( modelValue )
		end
	end )
	self:addElement( ScoreboardRowDeathIcon )
	self.ScoreboardRowDeathIcon = ScoreboardRowDeathIcon
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, -90 )
	FocusBarB:setTopBottom( 1, 1, -3, 3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, -90 )
	FocusBarT:setTopBottom( 0, 0, -3, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.resetProperties = function ()
		Rank:completeAnimation()
		Gamertag:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		ScoreColumn5:completeAnimation()
		ScoreColumn4:completeAnimation()
		ScoreColumn3:completeAnimation()
		ScoreColumn2:completeAnimation()
		ScoreColumn1:completeAnimation()
		Rank:setLeftRight( 0, 0, 34, 78 )
		Rank:setTopBottom( 0.5, 0.5, -16, 17 )
		Gamertag:setLeftRight( 0, 0, 124, 503 )
		Gamertag:setTopBottom( 0.5, 0.5, -18, 15 )
		Gamertag:setRGB( 1, 1, 1 )
		Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		ScoreColumn5.Text:setRGB( 1, 1, 1 )
		ScoreColumn5.Text:setAlpha( 1 )
		ScoreColumn4.Text:setRGB( 1, 1, 1 )
		ScoreColumn4.Text:setAlpha( 1 )
		ScoreColumn3.Text:setRGB( 1, 1, 1 )
		ScoreColumn3.Text:setAlpha( 1 )
		ScoreColumn2.Text:setRGB( 1, 1, 1 )
		ScoreColumn2.Text:setAlpha( 1 )
		ScoreColumn1.Text:setRGB( 1, 1, 1 )
		ScoreColumn1.Text:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 34, 78 )
				self.Rank:setTopBottom( 0.5, 0.5, -16.5, 15.5 )
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setLeftRight( 0, 0, 122.5, 502.5 )
				self.Gamertag:setTopBottom( 0.5, 0.5, -18, 15 )
				self.clipFinished( Gamertag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		IsCoDCaster = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 34, 78 )
				self.Rank:setTopBottom( 0.5, 0.5, -16.5, 15.5 )
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setLeftRight( 0, 0, 122.5, 502.5 )
				self.Gamertag:setTopBottom( 0.5, 0.5, -18, 15 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1.Text:setAlpha( 0 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2.Text:setAlpha( 0 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3.Text:setAlpha( 0 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4.Text:setAlpha( 0 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5.Text:setAlpha( 0 )
				self.clipFinished( ScoreColumn5, {} )
			end
		},
		FrontendArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Gamertag:completeAnimation()
				self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Gamertag, {} )
			end
		},
		Frontend = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		IsSelfArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn5, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Rank:completeAnimation()
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn5, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn5, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Rank:completeAnimation()
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn5, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		DefaultStateArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 34, 78 )
				self.Rank:setTopBottom( 0.5, 0.5, -16.5, 15.5 )
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setLeftRight( 0, 0, 122.5, 502.5 )
				self.Gamertag:setTopBottom( 0.5, 0.5, -18, 15 )
				self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( Gamertag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsCoDCaster",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerCodCaster( controller, element )
			end
		},
		{
			stateName = "FrontendArabic",
			condition = function ( menu, element, event )
				local f34_local0
				if not IsInGame() then
					f34_local0 = IsCurrentLanguageArabic()
				else
					f34_local0 = false
				end
				return f34_local0
			end
		},
		{
			stateName = "Frontend",
			condition = function ( menu, element, event )
				local f35_local0
				if not IsInGame() then
					f35_local0 = not IsCurrentLanguageArabic()
				else
					f35_local0 = false
				end
				return f35_local0
			end
		},
		{
			stateName = "IsSelfArabic",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( element, controller ) and IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( element, controller ) and not IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "DefaultStateArabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
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
	scoreboardPingBackground.id = "scoreboardPingBackground"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.scoreboardPingBackground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Top3PlayerScoreBlurBox0:close()
		self.VSpanel:close()
		self.ScoreColumn1:close()
		self.ScoreColumn2:close()
		self.ScoreColumn3:close()
		self.ScoreColumn4:close()
		self.ScoreColumn5:close()
		self.scoreboardPingBackground:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.Rank:close()
		self.RankIcon:close()
		self.Gamertag:close()
		self.PingText:close()
		self.VOIPImage:close()
		self.ScoreboardRowDeathIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

