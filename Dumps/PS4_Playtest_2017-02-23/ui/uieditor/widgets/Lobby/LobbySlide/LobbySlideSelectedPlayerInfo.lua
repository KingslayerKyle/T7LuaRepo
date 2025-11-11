require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideArenaWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideEmblemWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideGamerCardWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideInfoWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideMissingMapsWidget" )

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
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 814 )
	self.anyChildUsesUpdateState = true
	
	local LobbySlideArenaWidget0 = CoD.LobbySlideArenaWidget.new( menu, controller )
	LobbySlideArenaWidget0:setLeftRight( 1, 1, -482, -2 )
	LobbySlideArenaWidget0:setTopBottom( 0, 0, 686.5, 821.5 )
	LobbySlideArenaWidget0:setYRot( -25 )
	LobbySlideArenaWidget0:linkToElementModel( self, nil, false, function ( model )
		LobbySlideArenaWidget0:setModel( model, controller )
	end )
	self:addElement( LobbySlideArenaWidget0 )
	self.LobbySlideArenaWidget0 = LobbySlideArenaWidget0
	
	local rank = CoD.LobbySlideInfoWidget.new( menu, controller )
	rank:setLeftRight( 1, 1, -480, 0 )
	rank:setTopBottom( 0, 0, 515.5, 650.5 )
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
	playercard:setLeftRight( 1, 1, -480, 0 )
	playercard:setTopBottom( 0, 0, 362, 482 )
	playercard:setYRot( -25 )
	playercard:linkToElementModel( self, nil, false, function ( model )
		playercard:setModel( model, controller )
	end )
	playercard:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playercard.FELabelSubHeadingE0:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	playercard:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playercard.FELabelSubHeadingE0.Label0:setText( StringAsClanTag( modelValue ) )
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
	LobbySlideEmblemWidget:setLeftRight( 0, 0, 0, 480 )
	LobbySlideEmblemWidget:setTopBottom( 0, 0, 55, 349 )
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
	
	local LobbySlideMissingMapsWidget = CoD.LobbySlideMissingMapsWidget.new( menu, controller )
	LobbySlideMissingMapsWidget:setLeftRight( 1, 1, -482, -2 )
	LobbySlideMissingMapsWidget:setTopBottom( 0, 0, 870, 960 )
	LobbySlideMissingMapsWidget:setAlpha( 0 )
	LobbySlideMissingMapsWidget:setYRot( -25 )
	LobbySlideMissingMapsWidget:linkToElementModel( self, nil, false, function ( model )
		LobbySlideMissingMapsWidget:setModel( model, controller )
	end )
	self:addElement( LobbySlideMissingMapsWidget )
	self.LobbySlideMissingMapsWidget = LobbySlideMissingMapsWidget
	
	LobbySlideArenaWidget0.navigation = {
		up = playercard
	}
	playercard.navigation = {
		down = LobbySlideArenaWidget0
	}
	self.resetProperties = function ()
		rank:completeAnimation()
		LobbySlideArenaWidget0:completeAnimation()
		LobbySlideMissingMapsWidget:completeAnimation()
		playercard:completeAnimation()
		LobbySlideEmblemWidget:completeAnimation()
		rank:setAlpha( 0.94 )
		LobbySlideArenaWidget0:setLeftRight( 1, 1, -482, -2 )
		LobbySlideArenaWidget0:setTopBottom( 0, 0, 686.5, 821.5 )
		LobbySlideArenaWidget0:setAlpha( 1 )
		LobbySlideMissingMapsWidget:setLeftRight( 1, 1, -482, -2 )
		LobbySlideMissingMapsWidget:setTopBottom( 0, 0, 870, 960 )
		LobbySlideMissingMapsWidget:setAlpha( 0 )
		playercard:setAlpha( 1 )
		LobbySlideEmblemWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 1 )
				self.clipFinished( rank, {} )
				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setLeftRight( 1, 1, -482, -2 )
				self.LobbySlideMissingMapsWidget:setTopBottom( 0, 0, 686, 776 )
				self.LobbySlideMissingMapsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )
			end,
			Intro = function ()
				self.resetProperties()
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
				self.resetProperties()
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
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
			end
		},
		Lan = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
			end
		},
		Arena = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				rank:completeAnimation()
				self.rank:setAlpha( 1 )
				self.clipFinished( rank, {} )
				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setLeftRight( 1, 1, -482, -2 )
				self.LobbySlideMissingMapsWidget:setTopBottom( 0, 0, 832, 922 )
				self.LobbySlideMissingMapsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LobbySlideArenaWidget0Frame2 = function ( LobbySlideArenaWidget0, event )
					local LobbySlideArenaWidget0Frame3 = function ( LobbySlideArenaWidget0, event )
						local LobbySlideArenaWidget0Frame4 = function ( LobbySlideArenaWidget0, event )
							if not event.interrupted then
								LobbySlideArenaWidget0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							LobbySlideArenaWidget0:setLeftRight( 1, 1, -480, 0 )
							LobbySlideArenaWidget0:setTopBottom( 0, 0, 666.5, 801.5 )
							LobbySlideArenaWidget0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LobbySlideArenaWidget0, event )
							else
								LobbySlideArenaWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LobbySlideArenaWidget0Frame4( LobbySlideArenaWidget0, event )
							return 
						else
							LobbySlideArenaWidget0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
							LobbySlideArenaWidget0:setAlpha( 1 )
							LobbySlideArenaWidget0:registerEventHandler( "transition_complete_keyframe", LobbySlideArenaWidget0Frame4 )
						end
					end
					
					if event.interrupted then
						LobbySlideArenaWidget0Frame3( LobbySlideArenaWidget0, event )
						return 
					else
						LobbySlideArenaWidget0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						LobbySlideArenaWidget0:registerEventHandler( "transition_complete_keyframe", LobbySlideArenaWidget0Frame3 )
					end
				end
				
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setLeftRight( 1, 1, -480, 0 )
				self.LobbySlideArenaWidget0:setTopBottom( 0, 0, 666.5, 801.5 )
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				LobbySlideArenaWidget0Frame2( LobbySlideArenaWidget0, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
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
							playercard:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
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
						LobbySlideEmblemWidget:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
			end
		},
		Custom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setLeftRight( 1, 1, -482, -2 )
				self.LobbySlideMissingMapsWidget:setTopBottom( 0, 0, 515, 605 )
				self.LobbySlideMissingMapsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )
			end
		},
		FreeRun = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
			end
		},
		Theater = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
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
				return IsMainModeInvalid()
			end
		},
		{
			stateName = "Lan",
			condition = function ( menu, element, event )
				return not IsLive()
			end
		},
		{
			stateName = "Arena",
			condition = function ( menu, element, event )
				return IsArenaMode()
			end
		},
		{
			stateName = "Custom",
			condition = function ( menu, element, event )
				return IsCustomLobby()
			end
		},
		{
			stateName = "FreeRun",
			condition = function ( menu, element, event )
				return IsFreeRunLobby()
			end
		},
		{
			stateName = "Theater",
			condition = function ( menu, element, event )
				return LobbyModeTheater()
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LobbySlideArenaWidget0.id = "LobbySlideArenaWidget0"
	playercard.id = "playercard"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbySlideArenaWidget0:close()
		self.rank:close()
		self.playercard:close()
		self.LobbySlideEmblemWidget:close()
		self.LobbySlideMissingMapsWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

