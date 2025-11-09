require( "ui.T6.Menus.PrivateGameLobby" )

CoD.SplitscreenGameLobby = {}
CoD.SplitscreenGameLobby.PopulateButtons = function ( self )
	CoD.PrivateGameLobby.PopulateButtons( self )
	if self.body ~= nil then
		if self.body.switchLobbiesButton ~= nil then
			self.body.switchLobbiesButton:close()
		end
		if self.body.barracksButton ~= nil then
			self.body.barracksButton:close()
		end
		if self.body.liveStreamingButton ~= nil then
			self.body.liveStreamingButton:close()
		end
		if self.body.startMatchButton ~= nil and CoD.isZombie == true then
			local members = CoD.SplitscreenGameLobby.GetLocalMembers()
			if CoD.SplitscreenGameLobby.ShouldDisableStartMatchButton_Zombie( #members ) == true then
				self.body.startMatchButton:disable()
			else
				self.body.startMatchButton:enable()
			end
		end
		if not self:restoreState() and CoD.useController == true then
			self.body.startMatchButton:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

CoD.SplitscreenGameLobby.PopulateButtonPaneElements = function ( self )
	CoD.PrivateLocalGameLobby.PopulateButtons( self )
end

CoD.SplitscreenGameLobby.ShouldDisableStartMatchButton_Zombie = function ( memberCount )
	local gametype = Engine.DvarString( nil, "ui_gametype" )
	if CoD.Zombie.GameTypeGroups[gametype].maxPlayers < memberCount or memberCount < CoD.Zombie.GameTypeGroups[gametype].minPlayers then
		return true
	else
		return false
	end
end

CoD.SplitscreenGameLobby.UpdateStartMatchButton_Zombie = function ( self, event )
	local memberCount = 0
	if event.members ~= nil then
		memberCount = #event.members
	end
	if CoD.SplitscreenGameLobby.ShouldDisableStartMatchButton_Zombie( memberCount ) == true then
		self.buttonPane.body.startMatchButton:disable()
	else
		self.buttonPane.body.startMatchButton:enable()
	end
end

LUI.createMenu.SplitscreenGameLobby = function ( controller )
	local splitscreenGameLobby = CoD.PrivateGameLobby.New( "SplitscreenGameLobby", controller )
	if CoD.isMultiplayer then
		splitscreenGameLobby:setPreviousMenu( "MainMenu" )
	end
	splitscreenGameLobby:addTitle( Engine.Localize( "MENU_LOCAL_CAPS" ) )
	splitscreenGameLobby.populateButtonPaneElements = CoD.SplitscreenGameLobby.PopulateButtonPaneElements
	splitscreenGameLobby.populateButtons = CoD.SplitscreenGameLobby.PopulateButtons
	splitscreenGameLobby:updatePanelFunctions()
	local lobbyList = splitscreenGameLobby.lobbyPane.body.lobbyList
	lobbyList:registerEventHandler( "stats_downloaded", CoD.SplitscreenGameLobby.DoNothing )
	if CoD.isZombie == true then
		splitscreenGameLobby:registerEventHandler( "update_start_match_button", CoD.SplitscreenGameLobby.UpdateStartMatchButton_Zombie )
		lobbyList.menu = splitscreenGameLobby
	end
	CoD.SplitscreenGameLobby.PopulateButtons( splitscreenGameLobby.buttonPane )
	CoD.Lobby.RemovePartyPrivacyButton( splitscreenGameLobby )
	splitscreenGameLobby.panelManager:setSlidingAllowed( false )
	return splitscreenGameLobby
end

CoD.SplitscreenGameLobby.StartMatch = function ( self, event )
	Engine.StartServer( event.controller )
end

CoD.SplitscreenGameLobby.GetLocalMembers = function ()
	local usedControllerCount = Engine.GetUsedControllerCount()
	local availableControllerCount = Engine.GetNonUsedControllerCount()
	local maxControllerCount = Engine.GetMaxControllerCount()
	local members = {}
	local usedControllers = 0
	for controllerIndex = 0, maxControllerCount - 1, 1 do
		if Engine.IsControllerUsed( controllerIndex ) == true then
			local member = {
				background = RegisterMaterial( "menu_mp_lobby_bar_name" ),
				xuid = Engine.GetXUID64( controllerIndex ),
				gamertag = Engine.GetGamertagForController( controllerIndex ),
				team = 0,
				clientNum = Engine.GetLocalClientNum( controllerIndex )
			}
			table.insert( members, member )
			usedControllers = usedControllers + 1
		end
		if usedControllers == usedControllerCount then
			break
		end
	end
	table.sort( members, CoD.SplitscreenGameLobby.MemberComparisonFunction )
	return members
end

CoD.SplitscreenGameLobby.MemberComparisonFunction = function ( a, b )
	if a.clientNum ~= b.clientNum then
		return a.clientNum < b.clientNum
	else
		return a.gamertag:lower() < b.gamertag:lower()
	end
end

CoD.SplitscreenGameLobby.DoNothing = function ( self, event )
	
end

