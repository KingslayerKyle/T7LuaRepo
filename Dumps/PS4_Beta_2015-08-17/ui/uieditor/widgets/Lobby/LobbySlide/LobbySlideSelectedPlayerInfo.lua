require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideArenaWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideInfoWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideGamerCardWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideEmblemWidget" )

CoD.LobbySlideSelectedPlayerInfo = InheritFrom( LUI.UIElement )
CoD.LobbySlideSelectedPlayerInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideSelectedPlayerInfo )
	self.id = "LobbySlideSelectedPlayerInfo"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 543 )
	self.anyChildUsesUpdateState = true
	
	local LobbySlideArenaWidget0 = CoD.LobbySlideArenaWidget.new( menu, controller )
	LobbySlideArenaWidget0:setLeftRight( false, true, -320, 0 )
	LobbySlideArenaWidget0:setTopBottom( true, false, 448, 538 )
	LobbySlideArenaWidget0:setAlpha( 0 )
	LobbySlideArenaWidget0:setYRot( -25 )
	LobbySlideArenaWidget0.ListHeader.btnDisplayTextStroke:setText( Engine.Localize( "ALL TIME HIGH" ) )
	LobbySlideArenaWidget0:linkToElementModel( self, nil, false, function ( model )
		LobbySlideArenaWidget0:setModel( model, controller )
	end )
	self:addElement( LobbySlideArenaWidget0 )
	self.LobbySlideArenaWidget0 = LobbySlideArenaWidget0
	
	local rank = CoD.LobbySlideInfoWidget.new( menu, controller )
	rank:setLeftRight( false, true, -320, 0 )
	rank:setTopBottom( true, false, 343.5, 433.5 )
	rank:setAlpha( 0.94 )
	rank:setYRot( -25 )
	rank:linkToElementModel( self, nil, false, function ( model )
		rank:setModel( model, controller )
	end )
	rank:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rank.rankIcon.imgSolid:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	self:addElement( rank )
	self.rank = rank
	
	local playercard = CoD.LobbySlideGamerCardWidget.new( menu, controller )
	playercard:setLeftRight( false, true, -320, 0 )
	playercard:setTopBottom( true, false, 241.5, 321.5 )
	playercard:setYRot( -25 )
	playercard:linkToElementModel( self, nil, false, function ( model )
		playercard:setModel( model, controller )
	end )
	playercard:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playercard.FELabelSubHeadingE0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	playercard:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playercard.FELabelSubHeadingE1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( playercard )
	self.playercard = playercard
	
	local LobbySlideEmblemWidget = CoD.LobbySlideEmblemWidget.new( menu, controller )
	LobbySlideEmblemWidget:setLeftRight( true, false, 0, 320 )
	LobbySlideEmblemWidget:setTopBottom( true, false, 37, 233 )
	LobbySlideEmblemWidget:setYRot( -25 )
	LobbySlideEmblemWidget:linkToElementModel( self, nil, false, function ( model )
		LobbySlideEmblemWidget:setModel( model, controller )
	end )
	LobbySlideEmblemWidget:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbySlideEmblemWidget.EmblemAdd.emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( LobbySlideEmblemWidget )
	self.LobbySlideEmblemWidget = LobbySlideEmblemWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				rank:completeAnimation()
				self.rank:setAlpha( 1 )
				self.clipFinished( rank, {} )
				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )
				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 3 )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local playercardFrame2 = function ( playercard, event )
					local playercardFrame3 = function ( playercard, event )
						if not event.interrupted then
							playercard:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Bounce )
						end
						playercard:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( playercard, event )
						else
							playercard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						playercardFrame3( playercard, event )
						return 
					else
						playercard:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						playercard:registerEventHandler( "transition_complete_keyframe", playercardFrame3 )
					end
				end
				
				playercard:completeAnimation()
				self.playercard:setAlpha( 0 )
				playercardFrame2( playercard, {} )
				local LobbySlideEmblemWidgetFrame2 = function ( LobbySlideEmblemWidget, event )
					if not event.interrupted then
						LobbySlideEmblemWidget:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbySlideEmblemWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbySlideEmblemWidget, event )
					else
						LobbySlideEmblemWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 0 )
				LobbySlideEmblemWidgetFrame2( LobbySlideEmblemWidget, {} )
			end,
			Outro = function ()
				self:setupElementClipCounter( 3 )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 1 )
				rankFrame2( rank, {} )
				local playercardFrame2 = function ( playercard, event )
					local playercardFrame3 = function ( playercard, event )
						if not event.interrupted then
							playercard:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Bounce )
						end
						playercard:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( playercard, event )
						else
							playercard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						playercardFrame3( playercard, event )
						return 
					else
						playercard:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						playercard:registerEventHandler( "transition_complete_keyframe", playercardFrame3 )
					end
				end
				
				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				playercardFrame2( playercard, {} )
				local LobbySlideEmblemWidgetFrame2 = function ( LobbySlideEmblemWidget, event )
					if not event.interrupted then
						LobbySlideEmblemWidget:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbySlideEmblemWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbySlideEmblemWidget, event )
					else
						LobbySlideEmblemWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				LobbySlideEmblemWidgetFrame2( LobbySlideEmblemWidget, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
				playercard:completeAnimation()
				self.playercard:setAlpha( 0 )
				self.clipFinished( playercard, {} )
				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideEmblemWidget, {} )
			end
		},
		RankInfoHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )
				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )
			end
		},
		Lan = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
				playercard:completeAnimation()
				self.playercard:setLeftRight( false, true, -320, 0 )
				self.playercard:setTopBottom( true, false, 242.5, 322.5 )
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )
				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "RankInfoHidden",
			condition = function ( menu, element, event )
				return IsMainModeInvalidAndNotTheaterMode()
			end
		},
		{
			stateName = "Lan",
			condition = function ( menu, element, event )
				return IsLAN()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbySlideArenaWidget0:close()
		self.rank:close()
		self.playercard:close()
		self.LobbySlideEmblemWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

