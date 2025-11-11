require( "ui.uieditor.widgets.Arena.ArenaMapVoteRuleItem" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )
require( "ui.uieditor.widgets.Freerun.FR_BestTime" )
require( "ui.uieditor.widgets.Freerun.FR_Difficulty" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteHeader" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteItem" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteNoDemoSelected" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteOfficial" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteResult" )

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
		local lobbyNav = LobbyData.GetLobbyNav()
		local f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
		if lobbyNav ~= f5_local0.id then
			f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
			if lobbyNav ~= f5_local0.id then
				f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
				if lobbyNav ~= f5_local0.id then
					f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
					if lobbyNav ~= f5_local0.id then
						return 
					end
				end
			end
		end
		local mapVoteModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
		local mapVote = Engine.GetModelValue( mapVoteModel )
		if mapVote == LuaEnum.MAP_VOTE_STATE.HIDDEN then
			self:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self:makeNotFocusable()
			self:setMouseDisabled( true )
		elseif mapVote == LuaEnum.MAP_VOTE_STATE.VOTING then
			self:makeFocusable()
			self:setMouseDisabled( false )
		elseif mapVote == LuaEnum.MAP_VOTE_STATE.LOCKEDIN then
			self:makeNotFocusable()
			self:setMouseDisabled( true )
			local mapVote2 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
			local next = Engine.GetModelValue( Engine.CreateModel( mapVote2, "mapVoteCountNext", true ) ) or 0
			local prev = Engine.GetModelValue( Engine.CreateModel( mapVote2, "mapVoteCountPrevious", true ) ) or 0
			local rand = Engine.GetModelValue( Engine.CreateModel( mapVote2, "mapVoteCountRandom", true ) ) or 0
			local chooseCount = next
			local chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT
			if chooseCount < prev then
				chooseCount = prev
				chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS
			end
			if chooseCount < rand then
				chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM
			end
			if not LuaUtils.IsArenaMode() then
				if chosen == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
					self:setState( "MapVoteChosenNext" )
				elseif chosen == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
					self:setState( "MapVoteChosenPrevious" )
				elseif chosen == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
					self:setState( "MapVoteChosenRandom" )
				end
			end
			self:setState( "SelectedMap" )
			self:makeNotFocusable()
			self:setMouseDisabled( true )
			if self:getParent() then
				local f5_local1 = self:getParent()
				local leftContainer = f5_local1.LeftContainer
				if leftContainer then
					self:processEvent( {
						name = "lose_focus",
						controller = controller
					} )
					if not leftContainer:getParent() or not IsMenuInState( leftContainer:getParent(), "Right" ) then
						leftContainer:processEvent( {
							name = "gain_focus",
							controller = controller
						} )
					end
				end
			end
		end
	end )
end

local CustomMatch = function ( self, controller, menu )
	self:makeNotFocusable()
	self:setMouseDisabled( true )
end

local PreLoadMapImage = function ( self )
	local mapName = Dvar.ui_mapname:get()
	if self.mapName and mapName == self.mapName then
		return 
	else
		self.mapName = mapName
		local mapImageName = MapNameToMapLoadingImage( controller, mapName )
		local mapImage = LUI.UIImage.new( 0.5, 0.5, 640, 640, 0.5, 0.5, -360, 360 )
		mapImage.id = "mapImage"
		mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		mapImage:setImage( RegisterImage( mapImageName ) )
		mapImage:setAlpha( 0 )
		self:addElement( mapImage )
	end
end

local RefreshMapVote = function ( self, controller, menu )
	local lobbyNav = LobbyData.GetLobbyNav()
	local f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if lobbyNav ~= f8_local0.id then
		f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
		if lobbyNav ~= f8_local0.id then
			f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
			if lobbyNav ~= f8_local0.id then
				f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
				if lobbyNav ~= f8_local0.id then
					f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
					if lobbyNav ~= f8_local0.id then
						f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
						if lobbyNav == f8_local0.id then
							PublicMatch( self, controller, menu )
						end
						f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
						if lobbyNav ~= f8_local0.id then
							f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
							if lobbyNav ~= f8_local0.id then
								f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
								if lobbyNav ~= f8_local0.id then
									f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
									if lobbyNav ~= f8_local0.id then
										f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
										if lobbyNav ~= f8_local0.id then
											f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_THEATER )
											if lobbyNav ~= f8_local0.id then
												f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
												if lobbyNav ~= f8_local0.id then
													f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
													if lobbyNav ~= f8_local0.id then
														f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
														if lobbyNav ~= f8_local0.id then
															f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_CUSTOM )
															if lobbyNav ~= f8_local0.id then
																f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_THEATER )
																if lobbyNav ~= f8_local0.id then
																	f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_ZM )
																	if lobbyNav ~= f8_local0.id then
																		f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
																		if lobbyNav ~= f8_local0.id then
																			f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
																			if lobbyNav == f8_local0.id then
																				CustomMatch( self, controller, menu )
																			end
																			self:setState( "DefaultState" )
																			self:makeNotFocusable()
																			self:setMouseDisabled( true )
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
						CustomMatch( self, controller, menu )
					end
				end
			end
		end
	end
	PublicMatch( self, controller, menu )
end

local RefreshFreerunData = function ( self, controller )
	local selectedMapIDModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" )
	local selectedMapId = Engine.GetModelValue( selectedMapIDModel )
	self.FRDifficulty.SubTitle:setText( Engine.Localize( GetDifficultyForSelectedFreerunMap( controller, selectedMapId ) ) )
	self.FRBestTime.BestTimeValueText:setText( Engine.Localize( GetBestTimeForSelectedFreerunMap( controller, selectedMapId ) ) )
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
	local selectedMapIdModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" )
	Engine.SetModelValue( selectedMapIdModel, Dvar.ui_mapname:get() )
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
	Engine.CreateModel( mapVote, "mapVoteCountNext" )
	Engine.CreateModel( mapVote, "mapVoteCountPrevious" )
	Engine.CreateModel( mapVote, "mapVoteCountRandom" )
	Engine.CreateModel( mapVote, "mapVoteGameModeNext" )
	Engine.CreateModel( mapVote, "mapVoteGameModePrevious" )
	Engine.CreateModel( mapVote, "mapVoteMapNext" )
	Engine.CreateModel( mapVote, "mapVoteMapPrevious" )
	Engine.CreateModel( mapVote, "mapVoteMapPreviousGametype" )
	Engine.CreateModel( mapVote, "timerActive" )
	Engine.CreateModel( mapVote, "mapVoteCustomGameName" )
end

local PostLoadFunc = function ( self, controller, menu )
	self:makeNotFocusable()
	self:setMouseDisabled( true )
	SetMapVoteNavigation( self, menu )
	SetupGainFocusEventHandler( self )
	RefreshMapVote( self, controller, menu )
	if self.lobbyNavSubscription then
		self:removeSubscription( self.lobbyNavSubscription )
	end
	self.lobbyNavSubscription = self:subscribeToModel( LobbyData.GetLobbyNavModel(), function ()
		RefreshMapVote( self, controller, menu )
		RefreshFreerunData( self, controller )
	end, false )
	self:registerEventHandler( "preload_map_image", PreLoadMapImage )
	if self.customGameSubscription then
		self:removeSubscription( self.customGameSubscription )
	end
	local mapVote = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	local customGameNameModel = Engine.GetModel( mapVote, "mapVoteCustomGameName" )
	self.customGameSubscription = self:subscribeToModel( customGameNameModel, function ()
		local mapVoteGameModeNextModel = Engine.GetModel( mapVote, "mapVoteGameModeNext" )
		Engine.ForceNotifyModelSubscriptions( mapVoteGameModeNextModel )
	end, false )
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
	self:setLeftRight( 0, 0, 0, 532 )
	self:setTopBottom( 0, 0, 0, 270 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MapVoteItemVoteDecided = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemVoteDecided:setLeftRight( 0, 1, 0, 0 )
	MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -135, 132 )
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
			MapVoteItemVoteDecided.MapNameNew.btnDisplayTextStroke:setText( MapNameToLocalizedMapName( modelValue ) )
		end
	end )
	MapVoteItemVoteDecided:subscribeToGlobalModel( controller, "MapVote", "mapVoteGameModeNext", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVoteItemVoteDecided.GameModeNew.SubTitle:setText( Engine.Localize( PrependCustomGameName( modelValue ) ) )
		end
	end )
	self:addElement( MapVoteItemVoteDecided )
	self.MapVoteItemVoteDecided = MapVoteItemVoteDecided
	
	local MapVoteItemRandom = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
	MapVoteItemRandom:setTopBottom( 0.5, 0.5, 45, 132 )
	MapVoteItemRandom:setScale( 0.85 )
	MapVoteItemRandom.MapImage:setImage( RegisterImage( "uie_lui_random_map_vote" ) )
	MapVoteItemRandom.VoteType:setAlpha( 1 )
	MapVoteItemRandom.VoteType:setText( Engine.Localize( "MPUI_RANDOM_CAPS" ) )
	MapVoteItemRandom.MapNameNew.btnDisplayTextStroke:setText( LocalizeToUpperString( "MENU_CLASSIFIED" ) )
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
	MapVoteItemRandom:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MapVoteItemRandom:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MapVoteItemRandom, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LobbyMapVoteSelectRandom( self, controller )
		PlaySoundSetSound( self, "menu_open" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MapVoteItemRandom )
	self.MapVoteItemRandom = MapVoteItemRandom
	
	local MapVoteItemPrevious = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemPrevious:mergeStateConditions( {
		{
			stateName = "Unselectable",
			condition = function ( menu, element, event )
				return not MapVotePreviousSelectable()
			end
		}
	} )
	MapVoteItemPrevious:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ), function ( model )
		menu:updateElementState( MapVoteItemPrevious, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.mapVote"
		} )
	end )
	MapVoteItemPrevious:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( MapVoteItemPrevious, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
	MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -32, 55 )
	MapVoteItemPrevious:setScale( 0.85 )
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
			MapVoteItemPrevious.MapNameNew.btnDisplayTextStroke:setText( MapNameToLocalizedMapName( modelValue ) )
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
	MapVoteItemPrevious:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MapVoteItemPrevious:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MapVoteItemPrevious, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LobbyMapVoteSelectPrevious( self, controller )
		PlaySoundSetSound( self, "menu_open" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MapVoteItemPrevious )
	self.MapVoteItemPrevious = MapVoteItemPrevious
	
	local MapVoteItemNext = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
	MapVoteItemNext:setTopBottom( 0.5, 0.5, -108, -21 )
	MapVoteItemNext:setScale( 0.85 )
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
			MapVoteItemNext.MapNameNew.btnDisplayTextStroke:setText( MapNameToLocalizedMapName( modelValue ) )
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
	MapVoteItemNext:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MapVoteItemNext:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MapVoteItemNext, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LobbyMapVoteSelectNext( self, controller )
		PlaySoundSetSound( self, "menu_open" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MapVoteItemNext )
	self.MapVoteItemNext = MapVoteItemNext
	
	local FEListSubHeaderGlow0 = CoD.MapVoteHeader.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( 0, 1, 0, -78 )
	FEListSubHeaderGlow0:setTopBottom( 0, 0, -10, 24 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local MapVoting = LUI.UITightText.new()
	MapVoting:setLeftRight( 0, 0, 18, 61 )
	MapVoting:setTopBottom( 0, 0, -9, 21 )
	MapVoting:setRGB( 0, 0, 0 )
	MapVoting:setText( Engine.Localize( "MENU_VOTING_VOTE_STRING" ) )
	MapVoting:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MapVoting:setLetterSpacing( 0.5 )
	self:addElement( MapVoting )
	self.MapVoting = MapVoting
	
	local LobbyStatus = LUI.UITightText.new()
	LobbyStatus:setLeftRight( 1, 1, -142, -99 )
	LobbyStatus:setTopBottom( 0, 0, -9, 21 )
	LobbyStatus:setRGB( 0, 0, 0 )
	LobbyStatus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LobbyStatus:setLetterSpacing( 0.5 )
	LobbyStatus:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatus", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatus:setText( modelValue )
		end
	end )
	self:addElement( LobbyStatus )
	self.LobbyStatus = LobbyStatus
	
	local FRBestTime = CoD.FR_BestTime.new( menu, controller )
	FRBestTime:setLeftRight( 0, 0, 249, 455 )
	FRBestTime:setTopBottom( 0, 0, 173.5, 266.5 )
	FRBestTime:subscribeToGlobalModel( controller, "LobbyRoot", "selectedMapId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FRBestTime.BestTimeValueText:setText( Engine.Localize( GetBestTimeForSelectedFreerunMap( controller, modelValue ) ) )
		end
	end )
	self:addElement( FRBestTime )
	self.FRBestTime = FRBestTime
	
	local FRDifficulty = CoD.FR_Difficulty.new( menu, controller )
	FRDifficulty:setLeftRight( 0, 0, 15, 246 )
	FRDifficulty:setTopBottom( 0, 0, 225, 258 )
	FRDifficulty:subscribeToGlobalModel( controller, "LobbyRoot", "selectedMapId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FRDifficulty.SubTitle:setText( Engine.Localize( GetDifficultyForSelectedFreerunMap( controller, modelValue ) ) )
		end
	end )
	self:addElement( FRDifficulty )
	self.FRDifficulty = FRDifficulty
	
	local ArenaRules = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	ArenaRules:makeFocusable()
	ArenaRules:setLeftRight( 0, 0, 0, 454 )
	ArenaRules:setTopBottom( 0, 0, -94, -18 )
	ArenaRules:setWidgetType( CoD.ArenaMapVoteRuleItem )
	ArenaRules:setVerticalCount( 2 )
	ArenaRules:setSpacing( 8 )
	ArenaRules:setDataSource( "ArenaActiveRules" )
	self:addElement( ArenaRules )
	self.ArenaRules = ArenaRules
	
	local MapVoteNoDemoSelected = CoD.MapVoteNoDemoSelected.new( menu, controller )
	MapVoteNoDemoSelected:setLeftRight( 0, 0, 0, 454 )
	MapVoteNoDemoSelected:setTopBottom( 0, 0, 27, 253 )
	self:addElement( MapVoteNoDemoSelected )
	self.MapVoteNoDemoSelected = MapVoteNoDemoSelected
	
	local MapVoteResult = CoD.MapVoteResult.new( menu, controller )
	MapVoteResult:setLeftRight( 0, 0, 0, 454 )
	MapVoteResult:setTopBottom( 0, 0, 27, 255 )
	self:addElement( MapVoteResult )
	self.MapVoteResult = MapVoteResult
	
	local FileshareSpinner = CoD.FileshareSpinner.new( menu, controller )
	FileshareSpinner:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	FileshareSpinner:setLeftRight( 0, 0, 179, 275 )
	FileshareSpinner:setTopBottom( 0, 0, 66, 162 )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local DownloadPercent = LUI.UIText.new()
	DownloadPercent:setLeftRight( 0, 0, 39, 412 )
	DownloadPercent:setTopBottom( 0, 0, 149, 187 )
	DownloadPercent:setTTF( "fonts/default.ttf" )
	DownloadPercent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DownloadPercent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	DownloadPercent:subscribeToGlobalModel( controller, "LobbyRoot", "theaterDownloadPercent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DownloadPercent:setText( FileshareGetDownloadProgress( modelValue ) )
		end
	end )
	self:addElement( DownloadPercent )
	self.DownloadPercent = DownloadPercent
	
	local MapVoteOfficial = CoD.MapVoteOfficial.new( menu, controller )
	MapVoteOfficial:setLeftRight( 0, 0, 288, 452 )
	MapVoteOfficial:setTopBottom( 0, 0, 44, 88 )
	self:addElement( MapVoteOfficial )
	self.MapVoteOfficial = MapVoteOfficial
	
	MapVoteItemVoteDecided.navigation = {
		left = {
			MapVoteItemNext,
			MapVoteItemPrevious,
			MapVoteItemRandom
		},
		up = MapVoteItemNext,
		down = MapVoteItemPrevious
	}
	MapVoteItemRandom.navigation = {
		up = MapVoteItemVoteDecided,
		right = MapVoteItemVoteDecided
	}
	MapVoteItemPrevious.navigation = {
		up = MapVoteItemVoteDecided,
		right = MapVoteItemVoteDecided,
		down = MapVoteItemRandom
	}
	MapVoteItemNext.navigation = {
		up = ArenaRules,
		right = MapVoteItemVoteDecided,
		down = MapVoteItemVoteDecided
	}
	ArenaRules.navigation = {
		down = MapVoteItemVoteDecided
	}
	self.resetProperties = function ()
		LobbyStatus:completeAnimation()
		MapVoting:completeAnimation()
		FEListSubHeaderGlow0:completeAnimation()
		MapVoteItemNext:completeAnimation()
		MapVoteItemPrevious:completeAnimation()
		MapVoteItemRandom:completeAnimation()
		FRDifficulty:completeAnimation()
		FRBestTime:completeAnimation()
		ArenaRules:completeAnimation()
		MapVoteNoDemoSelected:completeAnimation()
		MapVoteResult:completeAnimation()
		DownloadPercent:completeAnimation()
		FileshareSpinner:completeAnimation()
		MapVoteOfficial:completeAnimation()
		MapVoteItemVoteDecided:completeAnimation()
		LobbyStatus:setAlpha( 1 )
		MapVoting:setAlpha( 1 )
		FEListSubHeaderGlow0:setLeftRight( 0, 1, 0, -78 )
		FEListSubHeaderGlow0:setTopBottom( 0, 0, -10, 24 )
		FEListSubHeaderGlow0:setAlpha( 1 )
		MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
		MapVoteItemNext:setTopBottom( 0.5, 0.5, -108, -21 )
		MapVoteItemNext:setAlpha( 1 )
		MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
		MapVoteItemNext.VoteType:setAlpha( 1 )
		MapVoteItemNext.voteCount:setAlpha( 1 )
		MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
		MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -32, 55 )
		MapVoteItemPrevious:setAlpha( 1 )
		MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
		MapVoteItemPrevious.VoteType:setAlpha( 1 )
		MapVoteItemPrevious.voteCount:setAlpha( 1 )
		MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
		MapVoteItemRandom:setTopBottom( 0.5, 0.5, 45, 132 )
		MapVoteItemRandom:setAlpha( 1 )
		MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
		MapVoteItemRandom.VoteType:setAlpha( 1 )
		MapVoteItemRandom.voteCount:setAlpha( 1 )
		FRDifficulty:setAlpha( 1 )
		FRBestTime:setAlpha( 1 )
		ArenaRules:setAlpha( 1 )
		MapVoteNoDemoSelected:setAlpha( 1 )
		MapVoteResult:setLeftRight( 0, 0, 0, 454 )
		MapVoteResult:setTopBottom( 0, 0, 27, 255 )
		MapVoteResult:setAlpha( 1 )
		DownloadPercent:setAlpha( 1 )
		FileshareSpinner:setAlpha( 1 )
		MapVoteOfficial:setAlpha( 1 )
		MapVoteItemVoteDecided:setLeftRight( 0, 1, 0, 0 )
		MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -135, 132 )
		MapVoteItemVoteDecided:setAlpha( 0 )
		MapVoteItemVoteDecided:setScale( 1 )
		MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		CPHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		MPHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		ZMHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -45, 42 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemNext:setTopBottom( 0.5, 0.5, -135, -48 )
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			MapVote = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
						end
						MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemRandom:setTopBottom( 0.5, 0.5, 45, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, 45, 132 )
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
						MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -32, 55 )
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
				self.MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -32, 55 )
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
					MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemNext:setTopBottom( 0.5, 0.5, -108, -21 )
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
				self.MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemNext:setTopBottom( 0.5, 0.5, -108, -21 )
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
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				ArenaRulesFrame2( ArenaRules, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					local MapVoteOfficialFrame3 = function ( MapVoteOfficial, event )
						if not event.interrupted then
							MapVoteOfficial:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						MapVoteOfficial:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoteOfficial, event )
						else
							MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteOfficialFrame3( MapVoteOfficial, event )
						return 
					else
						MapVoteOfficial:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", MapVoteOfficialFrame3 )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
					MapVoteItemVoteDecided:setAlpha( 1 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, 45, 132 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					if not event.interrupted then
						MapVoteItemPrevious:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -45, 42 )
					MapVoteItemPrevious:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemPrevious, event )
					else
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -45, 42 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemNext:setTopBottom( 0.5, 0.5, -135, -48 )
					MapVoteItemNext:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemNext:setTopBottom( 0.5, 0.5, -135, -48 )
				self.MapVoteItemNext:setAlpha( 0 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					local FEListSubHeaderGlow0Frame3 = function ( FEListSubHeaderGlow0, event )
						if not event.interrupted then
							FEListSubHeaderGlow0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeaderGlow0:setLeftRight( 0, 1, 0, -78 )
						FEListSubHeaderGlow0:setTopBottom( 0, 0, -10, 24 )
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
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FEListSubHeaderGlow0:setAlpha( 0.99 )
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", FEListSubHeaderGlow0Frame3 )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( 0, 1, 0, -78 )
				self.FEListSubHeaderGlow0:setTopBottom( 0, 0, -10, 24 )
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
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRBestTime:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				ArenaRulesFrame2( ArenaRules, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					if not event.interrupted then
						MapVoteOfficial:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					MapVoteOfficial:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteOfficial, event )
					else
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end
		},
		MapVote = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				MapVoteItemRandom:completeAnimation()
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.clipFinished( MapVoteItemNext, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
			end,
			MapVoteChosenNext = function ()
				self.resetProperties()
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
						MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemNext:setTopBottom( 0.5, 0.5, -122, 145 )
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
				self.MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemNext:setTopBottom( 0.5, 0.5, -108, -21 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
			end,
			MapVoteChosenPrevious = function ()
				self.resetProperties()
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
						MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -32, 55 )
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
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
			end,
			MapVoteChosenRandom = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, 45, 132 )
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
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemRandom:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					if not event.interrupted then
						MapVoteItemPrevious:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemPrevious:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemPrevious, event )
					else
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
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
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					if not event.interrupted then
						MapVoteOfficial:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					MapVoteOfficial:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteOfficial, event )
					else
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 1 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end
		},
		SelectedMap = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					if not event.interrupted then
						MapVoteOfficial:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MapVoteOfficial:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteOfficial, event )
					else
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 1 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end
		},
		MapVoteChosenNext = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
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
						MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemNext:setTopBottom( 0.5, 0.5, -122, 145 )
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
				self.MapVoteItemNext:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemNext:setTopBottom( 0.5, 0.5, -108, -21 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
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
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		MapVoteChosenPrevious = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
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
						MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemPrevious:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemPrevious:setTopBottom( 0.5, 0.5, -32, 55 )
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
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		MapVoteChosenRandom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
						MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, 45, 132 )
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
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		DemoSelectedDownloading = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		NoDemoSelected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		GameResult = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setLeftRight( 0, 0, 0, 454 )
				self.MapVoteResult:setTopBottom( 0, 0, 27, 265 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		DemoSelectedFinished = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )
				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
					MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()
				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( 0, 1, -40, -40 )
				self.MapVoteItemVoteDecided:setTopBottom( 0.5, 0.5, -122, 145 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
					MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				self.MapVoteItemRandom:setLeftRight( 0, 1, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( 0.5, 0.5, -135, 132 )
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
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CPHidden",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		},
		{
			stateName = "MPHidden",
			condition = function ( menu, element, event )
				return IsMPMapVoteHidden( controller )
			end
		},
		{
			stateName = "ZMHidden",
			condition = function ( menu, element, event )
				return IsZMMapVoteHidden( controller )
			end
		},
		{
			stateName = "MapVote",
			condition = function ( menu, element, event )
				return MapVoteInState( "1" ) and not IsInTheaterMode()
			end
		},
		{
			stateName = "SelectedMap",
			condition = function ( menu, element, event )
				return MapVoteInState( "2" ) and not IsInTheaterMode()
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
		},
		{
			stateName = "DemoSelectedDownloading",
			condition = function ( menu, element, event )
				local f226_local0 = IsInTheaterMode()
				if f226_local0 then
					f226_local0 = IsFilmSelected()
					if f226_local0 then
						f226_local0 = not IsGlobalModelValueGreaterThan( controller, "lobbyRoot.theaterDownloadPercent", 99 )
					end
				end
				return f226_local0
			end
		},
		{
			stateName = "NoDemoSelected",
			condition = function ( menu, element, event )
				return IsInTheaterMode() and not IsFilmSelected()
			end
		},
		{
			stateName = "GameResult",
			condition = function ( menu, element, event )
				return MapVoteInState( "3" ) and not IsInTheaterMode()
			end
		},
		{
			stateName = "DemoSelectedFinished",
			condition = function ( menu, element, event )
				local f229_local0 = IsInTheaterMode()
				if f229_local0 then
					f229_local0 = IsFilmSelected()
					if f229_local0 then
						f229_local0 = IsGlobalModelValueGreaterThan( controller, "lobbyRoot.theaterDownloadPercent", 99 )
					end
				end
				return f229_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.mapVote"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.theaterDataDownloaded"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.theaterDownloadPercent"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsInDefaultState( element ) then
			DisableMouseButton( self, controller )
		else
			EnableMouseButton( self, controller )
		end
	end )
	MapVoteItemVoteDecided.id = "MapVoteItemVoteDecided"
	MapVoteItemRandom.id = "MapVoteItemRandom"
	MapVoteItemPrevious.id = "MapVoteItemPrevious"
	MapVoteItemNext.id = "MapVoteItemNext"
	ArenaRules.id = "ArenaRules"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MapVoteItemVoteDecided:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MapVoteItemVoteDecided:close()
		self.MapVoteItemRandom:close()
		self.MapVoteItemPrevious:close()
		self.MapVoteItemNext:close()
		self.FEListSubHeaderGlow0:close()
		self.FRBestTime:close()
		self.FRDifficulty:close()
		self.ArenaRules:close()
		self.MapVoteNoDemoSelected:close()
		self.MapVoteResult:close()
		self.FileshareSpinner:close()
		self.MapVoteOfficial:close()
		self.LobbyStatus:close()
		self.DownloadPercent:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

