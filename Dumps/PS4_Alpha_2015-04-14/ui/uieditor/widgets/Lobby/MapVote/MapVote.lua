require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteItem" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteHeader" )

local SetupGainFocusEventHandler = function ( self )
	self:registerEventHandler( "gain_focus", function ( self, event )
		local widgetToSetFocus = self.MapVoteItemNext
		if event.button and event.button == "up" then
			widgetToSetFocus = self.MapVoteItemRandom
		end
		if self.m_focusable and widgetToSetFocus:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
end

local SetMapVoteNavigation = function ( self, menu )
	self.MapVoteItemNext.navigation = nil
	self.MapVoteItemNext.navigation = {}
	self.MapVoteItemNext.navigation.up = menu.LeftContainer
	self.MapVoteItemNext.navigation.down = self.MapVoteItemPrevious
	self.MapVoteItemPrevious.navigation = nil
	self.MapVoteItemPrevious.navigation = {}
	self.MapVoteItemPrevious.navigation.up = self.MapVoteItemNext
	self.MapVoteItemPrevious.navigation.down = self.MapVoteItemRandom
	self.MapVoteItemRandom.navigation = nil
	self.MapVoteItemRandom.navigation = {}
	self.MapVoteItemRandom.navigation.up = self.MapVoteItemPrevious
	self.MapVoteItemRandom.navigation.down = menu.LeftContainer
end

local PublicMatch = function ( self, controller, menu )
	local mapVoteModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	self:subscribeToModel( mapVoteModel, function ()
		local mapVoteModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
		local mapVote = Engine.GetModelValue( mapVoteModel )
		if mapVote == LobbyData.MAP_VOTE_STATE_HIDDEN then
			self:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self:makeNotFocusable()
		elseif mapVote == LobbyData.MAP_VOTE_STATE_VOTING then
			self:makeFocusable()
		elseif mapVote == LobbyData.MAP_VOTE_STATE_LOCKEDIN then
			self:makeNotFocusable()
			local mapVote2 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
			local next = Engine.GetModelValue( Engine.CreateModel( mapVote2, "mapVoteCountNext" ) )
			local prev = Engine.GetModelValue( Engine.CreateModel( mapVote2, "mapVoteCountPrevious" ) )
			local rand = Engine.GetModelValue( Engine.CreateModel( mapVote2, "mapVoteCountRandom" ) )
			local chooseCount = next
			local chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT
			if chooseCount < prev then
				chooseCount = prev
				chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS
			end
			if chooseCount < rand then
				chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM
			end
			if chosen == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
				self:setState( "MapVoteChosenNext" )
			elseif chosen == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
				self:setState( "MapVoteChosenPrevious" )
			elseif chosen == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
				self:setState( "MapVoteChosenRandom" )
			end
			self:setState( "SelectedMap" )
			self:makeNotFocusable()
			if self:getParent() then
				local f5_local0 = self:getParent()
				local leftContainer = f5_local0.LeftContainer
				if leftContainer then
					self:processEvent( {
						name = "lose_focus",
						controller = controller
					} )
					leftContainer:processEvent( {
						name = "gain_focus",
						controller = controller
					} )
				end
			end
		end
	end )
end

local CustomMatch = function ( self, controller, menu )
	self:makeNotFocusable()
end

local PreLoadMapImage = function ( self )
	local mapName = Dvar.ui_mapname:get()
	if self.mapName and mapName == self.mapName then
		return 
	else
		self.mapName = mapName
		local mapImageName = CoD.GetMapValue( mapName, "loadingImage", "black" )
		local mapImage = LUI.UIStreamedImage.new()
		mapImage.id = "mapImage"
		mapImage:setLeftRight( false, false, -640, 640 )
		mapImage:setTopBottom( false, false, -360, 360 )
		mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		mapImage:setImage( RegisterImage( mapImageName ) )
		mapImage:setAlpha( 0 )
		self:addElement( mapImage )
	end
end

local RefreshMapVote = function ( self, controller, menu )
	local lobbyNav = LobbyData.GetLobbyNav()
	if lobbyNav == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or lobbyNav == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or lobbyNav == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		PublicMatch( self, controller, menu )
	else
		CustomMatch( self, controller, menu )
	end
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "Lobby.lobbyStatus" )
end

local PostLoadFunc = function ( self, controller, menu )
	self:makeNotFocusable()
	SetMapVoteNavigation( self, menu )
	SetupGainFocusEventHandler( self )
	RefreshMapVote( self, controller, menu )
	if self.lobbyNavSubscription then
		self:removeSubscription( self.lobbyNavSubscription )
	end
	self.lobbyNavSubscription = self:subscribeToModel( LobbyData.GetLobbyNavModel(), function ()
		RefreshMapVote( self, controller, menu )
	end, false )
	self:registerEventHandler( "preload_map_image", PreLoadMapImage )
end

CoD.MapVote = InheritFrom( LUI.UIElement )
CoD.MapVote.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVote )
	self.id = "MapVote"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 355 )
	self:setTopBottom( true, false, 0, 180 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( true, true, 0, -2 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanelShaderContainer.FEButtonPanel:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local MapVoteItemVoteDecided = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemVoteDecided:setLeftRight( true, false, 0, 355 )
	MapVoteItemVoteDecided:setTopBottom( true, false, 0, 178 )
	MapVoteItemVoteDecided:setRGB( 1, 1, 1 )
	MapVoteItemVoteDecided:setAlpha( 0 )
	MapVoteItemVoteDecided.VoteType:setAlpha( 0 )
	MapVoteItemVoteDecided.VoteType:setText( Engine.Localize( "" ) )
	MapVoteItemVoteDecided.voteCount:setAlpha( 0 )
	MapVoteItemVoteDecided.voteCount:setText( Engine.Localize( "" ) )
	MapVoteItemVoteDecided:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemVoteDecided.MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	MapVoteItemVoteDecided:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemVoteDecided.MapNameNew.btnDisplayTextStroke:setText( Engine.Localize( MapNameToLocalizedMapName( modelValue ) ) )
		end
	end )
	MapVoteItemVoteDecided:subscribeToGlobalModel( controller, "MapVote", "mapVoteGameModeNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemVoteDecided.GameModeNew.SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MapVoteItemVoteDecided )
	self.MapVoteItemVoteDecided = MapVoteItemVoteDecided
	
	local MapVoteItemRandom = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
	MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
	MapVoteItemRandom:setRGB( 1, 1, 1 )
	MapVoteItemRandom.MapImage:setImage( RegisterImage( "uie_lui_random_map_vote" ) )
	MapVoteItemRandom.VoteType:setAlpha( 1 )
	MapVoteItemRandom.VoteType:setText( Engine.Localize( "MPUI_RANDOM_CAPS" ) )
	MapVoteItemRandom.MapNameNew.btnDisplayTextStroke:setText( Engine.Localize( MapNameToLocalizedMapName( "MPUI_SECTOR_CAPS" ) ) )
	MapVoteItemRandom.GameModeNew.SubTitle:setText( Engine.Localize( "MENU_MODE_CLASSIFIED_CAPS" ) )
	MapVoteItemRandom:subscribeToGlobalModel( controller, "MapVote", "mapVoteCountRandom", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemRandom.voteCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapVoteItemRandom:registerEventHandler( "lobby_map_vote_random_chosen", function ( element, event )
		local retVal = nil
		PlayClip( self, "MapVoteChosenRandom", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MapVoteItemRandom:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyMapVoteSelectRandom( self, controller )
		PlaySoundSetSound( self, "menu_open" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( MapVoteItemRandom )
	self.MapVoteItemRandom = MapVoteItemRandom
	
	local MapVoteItemPrevious = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
	MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
	MapVoteItemPrevious:setRGB( 1, 1, 1 )
	MapVoteItemPrevious.VoteType:setAlpha( 1 )
	MapVoteItemPrevious.VoteType:setText( Engine.Localize( "MPUI_PREV_CAPS" ) )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapPrevious", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemPrevious.MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteCountPrevious", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemPrevious.voteCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapPrevious", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemPrevious.MapNameNew.btnDisplayTextStroke:setText( Engine.Localize( MapNameToLocalizedMapName( modelValue ) ) )
		end
	end )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteGameModePrevious", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemPrevious.GameModeNew.SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapVoteItemPrevious:registerEventHandler( "lobby_map_vote_previous_chosen", function ( element, event )
		local retVal = nil
		PlayClip( self, "MapVoteChosenPrevious", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MapVoteItemPrevious:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyMapVoteSelectPrevious( self, controller )
		PlaySoundSetSound( self, "menu_open" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( MapVoteItemPrevious )
	self.MapVoteItemPrevious = MapVoteItemPrevious
	
	local MapVoteItemNext = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemNext:setLeftRight( true, true, 0, 0 )
	MapVoteItemNext:setTopBottom( false, false, -90, -32 )
	MapVoteItemNext:setRGB( 1, 1, 1 )
	MapVoteItemNext.VoteType:setAlpha( 1 )
	MapVoteItemNext.VoteType:setText( Engine.Localize( "MPUI_NEXT_CAPS" ) )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemNext.MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteCountNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemNext.voteCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemNext.MapNameNew.btnDisplayTextStroke:setText( Engine.Localize( MapNameToLocalizedMapName( modelValue ) ) )
		end
	end )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteGameModeNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemNext.GameModeNew.SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapVoteItemNext:registerEventHandler( "lobby_map_vote_next_chosen", function ( element, event )
		local retVal = nil
		PlayClip( self, "MapVoteChosenNext", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MapVoteItemNext:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyMapVoteSelectNext( self, controller )
		PlaySoundSetSound( self, "menu_open" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( MapVoteItemNext )
	self.MapVoteItemNext = MapVoteItemNext
	
	local LoadingScreenPreloadHidden = LUI.UIImage.new()
	LoadingScreenPreloadHidden:setLeftRight( true, false, 0, 100 )
	LoadingScreenPreloadHidden:setTopBottom( true, false, 0, 100 )
	LoadingScreenPreloadHidden:setRGB( 1, 1, 1 )
	LoadingScreenPreloadHidden:setAlpha( 0 )
	LoadingScreenPreloadHidden:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	LoadingScreenPreloadHidden:setupUIStreamedImage( 0 )
	LoadingScreenPreloadHidden:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenPreloadHidden:setImage( RegisterImage( MapNameToMapLoadingImage( modelValue ) ) )
		end
	end )
	self:addElement( LoadingScreenPreloadHidden )
	self.LoadingScreenPreloadHidden = LoadingScreenPreloadHidden
	
	local FEListSubHeaderGlow0 = CoD.MapVoteHeader.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderGlow0:setTopBottom( true, false, -29, -6 )
	FEListSubHeaderGlow0:setRGB( 1, 1, 1 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local MapVoting = LUI.UITightText.new()
	MapVoting:setLeftRight( true, false, 12, 40.5 )
	MapVoting:setTopBottom( true, false, -28, -8 )
	MapVoting:setRGB( 0, 0, 0 )
	MapVoting:setZoom( 5 )
	MapVoting:setText( Engine.Localize( "MENU_VOTING_VOTE_STRING" ) )
	MapVoting:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MapVoting:setLetterSpacing( 0.5 )
	self:addElement( MapVoting )
	self.MapVoting = MapVoting
	
	local LobbyStatus = LUI.UITightText.new()
	LobbyStatus:setLeftRight( false, true, -38.5, -10 )
	LobbyStatus:setTopBottom( true, false, -28, -8 )
	LobbyStatus:setRGB( 0, 0, 0 )
	LobbyStatus:setZoom( 5 )
	LobbyStatus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LobbyStatus:setLetterSpacing( 0.5 )
	LobbyStatus:subscribeToGlobalModel( controller, "Lobby", "lobbyStatus", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatus:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LobbyStatus )
	self.LobbyStatus = LobbyStatus
	
	MapVoteItemVoteDecided.navigation = {
		left = {
			MapVoteItemNext,
			MapVoteItemPrevious,
			MapVoteItemRandom
		},
		up = MapVoteItemPrevious,
		down = MapVoteItemRandom
	}
	MapVoteItemRandom.navigation = {
		left = MapVoteItemVoteDecided,
		up = MapVoteItemVoteDecided
	}
	MapVoteItemPrevious.navigation = {
		left = MapVoteItemVoteDecided,
		up = MapVoteItemVoteDecided,
		down = MapVoteItemRandom
	}
	MapVoteItemNext.navigation = {
		left = MapVoteItemVoteDecided,
		down = MapVoteItemVoteDecided
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemNext:setTopBottom( false, false, -90, -32 )
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				LoadingScreenPreloadHidden:completeAnimation()
				self.LoadingScreenPreloadHidden:setAlpha( 0 )
				self.clipFinished( LoadingScreenPreloadHidden, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )
			end,
			MapVote = function ()
				self:setupElementClipCounter( 8 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
						end
						MapVoteItemRandom:setAlpha( 1 )
						MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
						MapVoteItemRandom.VoteType:setAlpha( 1 )
						MapVoteItemRandom.voteCount:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoteItemRandom, event )
						else
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						if not event.interrupted then
							MapVoteItemPrevious:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 210, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 210, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 210, false, false, CoD.TweenType.Linear )
						end
						MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
						MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
						MapVoteItemPrevious:setAlpha( 1 )
						MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
						MapVoteItemPrevious.VoteType:setAlpha( 1 )
						MapVoteItemPrevious.voteCount:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoteItemPrevious, event )
						else
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemPrevious.VoteType:completeAnimation()
				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setAlpha( 1 )
					MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemNext.VoteType:setAlpha( 1 )
					MapVoteItemNext.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemNext.VoteType:completeAnimation()
				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					local FEListSubHeaderGlow0Frame3 = function ( FEListSubHeaderGlow0, event )
						if not event.interrupted then
							FEListSubHeaderGlow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeaderGlow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeaderGlow0, event )
						else
							FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeaderGlow0Frame3( FEListSubHeaderGlow0, event )
						return 
					else
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						FEListSubHeaderGlow0:setAlpha( 1 )
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", FEListSubHeaderGlow0Frame3 )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					local MapVotingFrame3 = function ( MapVoting, event )
						if not event.interrupted then
							MapVoting:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						MapVoting:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoting, event )
						else
							MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVotingFrame3( MapVoting, event )
						return 
					else
						MapVoting:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MapVoting:registerEventHandler( "transition_complete_keyframe", MapVotingFrame3 )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				MapVotingFrame2( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					local LobbyStatusFrame3 = function ( LobbyStatus, event )
						if not event.interrupted then
							LobbyStatus:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						LobbyStatus:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyStatus, event )
						else
							LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyStatusFrame3( LobbyStatus, event )
						return 
					else
						LobbyStatus:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", LobbyStatusFrame3 )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				LobbyStatusFrame2( LobbyStatus, {} )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 9 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setAlpha( 1 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					if not event.interrupted then
						MapVoteItemPrevious:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
					MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
					MapVoteItemPrevious:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemPrevious, event )
					else
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setLeftRight( true, true, 0, 0 )
					MapVoteItemNext:setTopBottom( false, false, -90, -32 )
					MapVoteItemNext:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemNext:setTopBottom( false, false, -90, -32 )
				self.MapVoteItemNext:setAlpha( 0 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				LoadingScreenPreloadHidden:completeAnimation()
				self.LoadingScreenPreloadHidden:setAlpha( 0 )
				self.clipFinished( LoadingScreenPreloadHidden, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					if not event.interrupted then
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FEListSubHeaderGlow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow0, event )
					else
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				MapVotingFrame2( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				LobbyStatusFrame2( LobbyStatus, {} )
			end
		},
		MapVote = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 1 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemPrevious.VoteType:completeAnimation()
				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemNext.VoteType:completeAnimation()
				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				self.clipFinished( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				self.clipFinished( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end,
			MapVoteChosenNext = function ()
				self:setupElementClipCounter( 5 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								if not event.interrupted then
									MapVoteItemRandom:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemRandom:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MapVoteItemRandom, event )
								else
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.8 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								local MapVoteItemPreviousFrame6 = function ( MapVoteItemPrevious, event )
									if not event.interrupted then
										MapVoteItemPrevious:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemPrevious:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemPrevious, event )
									else
										MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemPreviousFrame6( MapVoteItemPrevious, event )
									return 
								else
									MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									MapVoteItemPrevious:setAlpha( 0.38 )
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0.75 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						if not event.interrupted then
							MapVoteItemNext:beginAnimation( "keyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemNext:setLeftRight( true, true, 0, 0 )
						MapVoteItemNext:setTopBottom( false, false, -90, 88 )
						MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemNext.VoteType:setAlpha( 0 )
						MapVoteItemNext.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemNext, event )
						else
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemNext.VoteType:completeAnimation()
				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemNext:setTopBottom( false, false, -90, -32 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end,
			MapVoteChosenPrevious = function ()
				self:setupElementClipCounter( 5 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								local MapVoteItemRandomFrame6 = function ( MapVoteItemRandom, event )
									local MapVoteItemRandomFrame7 = function ( MapVoteItemRandom, event )
										if not event.interrupted then
											MapVoteItemRandom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										end
										MapVoteItemRandom:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( MapVoteItemRandom, event )
										else
											MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										MapVoteItemRandomFrame7( MapVoteItemRandom, event )
										return 
									else
										MapVoteItemRandom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										MapVoteItemRandom:setAlpha( 0.3 )
										MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame7 )
									end
								end
								
								if event.interrupted then
									MapVoteItemRandomFrame6( MapVoteItemRandom, event )
									return 
								else
									MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									MapVoteItemRandom:setAlpha( 0.17 )
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.6 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						if not event.interrupted then
							MapVoteItemPrevious:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
						MapVoteItemPrevious:setTopBottom( false, false, -90, 88 )
						MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemPrevious.VoteType:setAlpha( 0 )
						MapVoteItemPrevious.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemPrevious, event )
						else
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemPrevious.VoteType:completeAnimation()
				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.5 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.88 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end,
			MapVoteChosenRandom = function ()
				self:setupElementClipCounter( 5 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
						MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
						MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemRandom.VoteType:setAlpha( 0 )
						MapVoteItemRandom.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemRandom, event )
						else
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								if not event.interrupted then
									MapVoteItemPrevious:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemPrevious:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MapVoteItemPrevious, event )
								else
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0.5 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:setAlpha( 0.9 )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.25 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.63 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemRandom.VoteType:setAlpha( 1 )
					MapVoteItemRandom.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 1 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					if not event.interrupted then
						MapVoteItemPrevious:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
						MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Bounce )
						MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Bounce )
						MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
					MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
					MapVoteItemPrevious:setAlpha( 0 )
					MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemPrevious.VoteType:setAlpha( 1 )
					MapVoteItemPrevious.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemPrevious, event )
					else
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemPrevious.VoteType:completeAnimation()
				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setAlpha( 0 )
					MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemNext.VoteType:setAlpha( 1 )
					MapVoteItemNext.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemNext.VoteType:completeAnimation()
				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					local FEListSubHeaderGlow0Frame3 = function ( FEListSubHeaderGlow0, event )
						if not event.interrupted then
							FEListSubHeaderGlow0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						FEListSubHeaderGlow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEListSubHeaderGlow0, event )
						else
							FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeaderGlow0Frame3( FEListSubHeaderGlow0, event )
						return 
					else
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Bounce )
						FEListSubHeaderGlow0:setAlpha( 0 )
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", FEListSubHeaderGlow0Frame3 )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				LobbyStatusFrame2( LobbyStatus, {} )
			end
		},
		SelectedMap = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					if not event.interrupted then
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					FEListSubHeaderGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow0, event )
					else
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				LobbyStatusFrame2( LobbyStatus, {} )
			end
		},
		MapVoteChosenNext = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 6 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								if not event.interrupted then
									MapVoteItemRandom:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemRandom:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MapVoteItemRandom, event )
								else
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.8 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								local MapVoteItemPreviousFrame6 = function ( MapVoteItemPrevious, event )
									if not event.interrupted then
										MapVoteItemPrevious:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemPrevious:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemPrevious, event )
									else
										MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemPreviousFrame6( MapVoteItemPrevious, event )
									return 
								else
									MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									MapVoteItemPrevious:setAlpha( 0.38 )
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0.75 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						if not event.interrupted then
							MapVoteItemNext:beginAnimation( "keyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemNext:setLeftRight( true, true, 0, 0 )
						MapVoteItemNext:setTopBottom( false, false, -90, 88 )
						MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemNext.VoteType:setAlpha( 0 )
						MapVoteItemNext.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemNext, event )
						else
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemNext.VoteType:completeAnimation()
				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemNext:setTopBottom( false, false, -90, -32 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end
		},
		MapVoteChosenPrevious = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 6 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								local MapVoteItemRandomFrame6 = function ( MapVoteItemRandom, event )
									local MapVoteItemRandomFrame7 = function ( MapVoteItemRandom, event )
										if not event.interrupted then
											MapVoteItemRandom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										end
										MapVoteItemRandom:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( MapVoteItemRandom, event )
										else
											MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										MapVoteItemRandomFrame7( MapVoteItemRandom, event )
										return 
									else
										MapVoteItemRandom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										MapVoteItemRandom:setAlpha( 0.3 )
										MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame7 )
									end
								end
								
								if event.interrupted then
									MapVoteItemRandomFrame6( MapVoteItemRandom, event )
									return 
								else
									MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									MapVoteItemRandom:setAlpha( 0.17 )
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.6 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						if not event.interrupted then
							MapVoteItemPrevious:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
						MapVoteItemPrevious:setTopBottom( false, false, -90, 88 )
						MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemPrevious.VoteType:setAlpha( 0 )
						MapVoteItemPrevious.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemPrevious, event )
						else
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemPrevious.VoteType:completeAnimation()
				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.5 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.88 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end
		},
		MapVoteChosenRandom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 6 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
						MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
						MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemRandom.VoteType:setAlpha( 0 )
						MapVoteItemRandom.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemRandom, event )
						else
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()
				MapVoteItemRandom.VoteType:completeAnimation()
				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								if not event.interrupted then
									MapVoteItemPrevious:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemPrevious:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MapVoteItemPrevious, event )
								else
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0.5 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:setAlpha( 0.9 )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.25 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.63 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "MapVote",
			condition = function ( menu, element, event )
				return MapVoteInState( "1" )
			end
		},
		{
			stateName = "SelectedMap",
			condition = function ( menu, element, event )
				return MapVoteInState( "2" )
			end
		},
		{
			stateName = "MapVoteChosenNext",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "MapVoteChosenPrevious",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "MapVoteChosenRandom",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.mapVote"
		} )
	end )
	MapVoteItemVoteDecided.id = "MapVoteItemVoteDecided"
	MapVoteItemRandom.id = "MapVoteItemRandom"
	MapVoteItemPrevious.id = "MapVoteItemPrevious"
	MapVoteItemNext.id = "MapVoteItemNext"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MapVoteItemVoteDecided:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.FEButtonPanelShaderContainer:close()
		self.MapVoteItemVoteDecided:close()
		self.MapVoteItemRandom:close()
		self.MapVoteItemPrevious:close()
		self.MapVoteItemNext:close()
		self.FEListSubHeaderGlow0:close()
		self.LoadingScreenPreloadHidden:close()
		self.LobbyStatus:close()
		CoD.MapVote.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

