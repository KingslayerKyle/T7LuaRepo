-- d1df6df00fff84477c120242917c56f8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideArenaWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideInfoWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideGamerCardWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideEmblemWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideMissingMapsWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideCommonGroupsWidget" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideSocialInfoWidget" )

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
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LobbySlideArenaWidget0 = CoD.LobbySlideArenaWidget.new( menu, controller )
	LobbySlideArenaWidget0:setLeftRight( false, true, -321, -1 )
	LobbySlideArenaWidget0:setTopBottom( true, false, 457.5, 547.5 )
	LobbySlideArenaWidget0:setYRot( -25 )
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
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			rank.rankIcon.imgSolid:setImage( RegisterImage( GetRankIconLarge( rankIcon ) ) )
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
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			playercard.FELabelSubHeadingE0:setAlpha( HideIfEmptyString( clanTag ) )
		end
	end )
	playercard:linkToElementModel( self, "clanTag", true, function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			playercard.FELabelSubHeadingE0.Label0:setText( StringAsClanTag( clanTag ) )
		end
	end )
	playercard:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			playercard.FELabelSubHeadingE1.Label0:setText( Engine.Localize( gamertag ) )
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
		local xuid = Engine.GetModelValue( model )
		if xuid then
			LobbySlideEmblemWidget.EmblemAdd.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( LobbySlideEmblemWidget )
	self.LobbySlideEmblemWidget = LobbySlideEmblemWidget
	
	local LobbySlideMissingMapsWidget = CoD.LobbySlideMissingMapsWidget.new( menu, controller )
	LobbySlideMissingMapsWidget:setLeftRight( false, true, -321, -1 )
	LobbySlideMissingMapsWidget:setTopBottom( true, false, 579.82, 639.82 )
	LobbySlideMissingMapsWidget:setYRot( -25 )
	LobbySlideMissingMapsWidget:linkToElementModel( self, nil, false, function ( model )
		LobbySlideMissingMapsWidget:setModel( model, controller )
	end )
	self:addElement( LobbySlideMissingMapsWidget )
	self.LobbySlideMissingMapsWidget = LobbySlideMissingMapsWidget
	
	local LobbySlideCommonGroupsWidget = CoD.LobbySlideCommonGroupsWidget.new( menu, controller )
	LobbySlideCommonGroupsWidget:setLeftRight( true, false, -1, 319 )
	LobbySlideCommonGroupsWidget:setTopBottom( true, false, 647.82, 754.82 )
	LobbySlideCommonGroupsWidget:setYRot( -25 )
	LobbySlideCommonGroupsWidget:linkToElementModel( self, nil, false, function ( model )
		LobbySlideCommonGroupsWidget:setModel( model, controller )
	end )
	self:addElement( LobbySlideCommonGroupsWidget )
	self.LobbySlideCommonGroupsWidget = LobbySlideCommonGroupsWidget
	
	local LobbySlideSocialInfoWidget = CoD.LobbySlideSocialInfoWidget.new( menu, controller )
	LobbySlideSocialInfoWidget:setLeftRight( true, false, -1, 319 )
	LobbySlideSocialInfoWidget:setTopBottom( true, false, 577.82, 667.82 )
	LobbySlideSocialInfoWidget:setYRot( -25 )
	LobbySlideSocialInfoWidget:linkToElementModel( self, nil, false, function ( model )
		LobbySlideSocialInfoWidget:setModel( model, controller )
	end )
	LobbySlideSocialInfoWidget:linkToElementModel( self, "partyActivityString", true, function ( model )
		local partyActivityString = Engine.GetModelValue( model )
		if partyActivityString then
			LobbySlideSocialInfoWidget.presence:setText( Engine.Localize( partyActivityString ) )
		end
	end )
	self:addElement( LobbySlideSocialInfoWidget )
	self.LobbySlideSocialInfoWidget = LobbySlideSocialInfoWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )

				rank:completeAnimation()
				self.rank:setAlpha( 1 )
				self.clipFinished( rank, {} )

				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )

				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setLeftRight( false, true, -321, -1 )
				self.LobbySlideMissingMapsWidget:setTopBottom( true, false, 457.5, 517.5 )
				self.LobbySlideMissingMapsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setLeftRight( true, false, -1, 319 )
				self.LobbySlideCommonGroupsWidget:setTopBottom( true, false, 523.5, 599.5 )
				self.LobbySlideCommonGroupsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setLeftRight( true, false, 0, 320 )
				self.LobbySlideSocialInfoWidget:setTopBottom( true, false, 453.5, 543.5 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
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
				self:setupElementClipCounter( 7 )

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

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
			end
		},
		RankInfoHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )

				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )

				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )

				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setLeftRight( false, true, -321, -1 )
				self.LobbySlideMissingMapsWidget:setTopBottom( true, false, 579.82, 642.82 )
				self.LobbySlideMissingMapsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setLeftRight( true, false, 0, 320 )
				self.LobbySlideCommonGroupsWidget:setTopBottom( true, false, 391.82, 556.82 )
				self.LobbySlideCommonGroupsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setLeftRight( true, false, 0, 320 )
				self.LobbySlideSocialInfoWidget:setTopBottom( true, false, 323.82, 413.82 )
				self.LobbySlideSocialInfoWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
			end
		},
		Lan = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )

				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )

				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )

				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
			end
		},
		Arena = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setLeftRight( false, true, -321, -1 )
				self.LobbySlideArenaWidget0:setTopBottom( true, false, 458, 548 )
				self.LobbySlideArenaWidget0:setAlpha( 1 )
				self.clipFinished( LobbySlideArenaWidget0, {} )

				rank:completeAnimation()
				self.rank:setAlpha( 1 )
				self.clipFinished( rank, {} )

				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )

				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setLeftRight( false, true, -321, -1 )
				self.LobbySlideMissingMapsWidget:setTopBottom( true, false, 564.82, 624.82 )
				self.LobbySlideMissingMapsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setLeftRight( true, false, 0, 320 )
				self.LobbySlideCommonGroupsWidget:setTopBottom( true, false, 645.82, 743.82 )
				self.LobbySlideCommonGroupsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setLeftRight( true, false, -1, 319 )
				self.LobbySlideSocialInfoWidget:setTopBottom( true, false, 561.82, 651.82 )
				self.LobbySlideSocialInfoWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )

				local LobbySlideArenaWidget0Frame2 = function ( LobbySlideArenaWidget0, event )
					local LobbySlideArenaWidget0Frame3 = function ( LobbySlideArenaWidget0, event )
						local LobbySlideArenaWidget0Frame4 = function ( LobbySlideArenaWidget0, event )
							if not event.interrupted then
								LobbySlideArenaWidget0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							LobbySlideArenaWidget0:setLeftRight( false, true, -320, 0 )
							LobbySlideArenaWidget0:setTopBottom( true, false, 444.5, 534.5 )
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
				self.LobbySlideArenaWidget0:setLeftRight( false, true, -320, 0 )
				self.LobbySlideArenaWidget0:setTopBottom( true, false, 444.5, 534.5 )
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
				self:setupElementClipCounter( 7 )

				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )

				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )

				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )

				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setLeftRight( false, true, -321, -1 )
				self.LobbySlideMissingMapsWidget:setTopBottom( true, false, 343.5, 403.5 )
				self.LobbySlideMissingMapsWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setLeftRight( true, false, -1, 319 )
				self.LobbySlideCommonGroupsWidget:setTopBottom( true, false, 420, 585 )
				self.LobbySlideCommonGroupsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setLeftRight( true, false, -1, 319 )
				self.LobbySlideSocialInfoWidget:setTopBottom( true, false, 340.5, 430.5 )
				self.LobbySlideSocialInfoWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
			end
		},
		FreeRun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )

				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )

				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )

				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setLeftRight( true, false, -1, 319 )
				self.LobbySlideSocialInfoWidget:setTopBottom( true, false, 342.5, 432.5 )
				self.LobbySlideSocialInfoWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
			end
		},
		Theater = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				LobbySlideArenaWidget0:completeAnimation()
				self.LobbySlideArenaWidget0:setAlpha( 0 )
				self.clipFinished( LobbySlideArenaWidget0, {} )

				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )

				playercard:completeAnimation()
				self.playercard:setAlpha( 1 )
				self.clipFinished( playercard, {} )

				LobbySlideEmblemWidget:completeAnimation()
				self.LobbySlideEmblemWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideEmblemWidget, {} )

				LobbySlideMissingMapsWidget:completeAnimation()
				self.LobbySlideMissingMapsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideMissingMapsWidget, {} )

				LobbySlideCommonGroupsWidget:completeAnimation()
				self.LobbySlideCommonGroupsWidget:setAlpha( 0 )
				self.clipFinished( LobbySlideCommonGroupsWidget, {} )

				LobbySlideSocialInfoWidget:completeAnimation()
				self.LobbySlideSocialInfoWidget:setLeftRight( true, false, -1, 319 )
				self.LobbySlideSocialInfoWidget:setTopBottom( true, false, 342.5, 432.5 )
				self.LobbySlideSocialInfoWidget:setAlpha( 1 )
				self.clipFinished( LobbySlideSocialInfoWidget, {} )
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
	LobbySlideArenaWidget0.id = "LobbySlideArenaWidget0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.LobbySlideArenaWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbySlideArenaWidget0:close()
		element.rank:close()
		element.playercard:close()
		element.LobbySlideEmblemWidget:close()
		element.LobbySlideMissingMapsWidget:close()
		element.LobbySlideCommonGroupsWidget:close()
		element.LobbySlideSocialInfoWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
