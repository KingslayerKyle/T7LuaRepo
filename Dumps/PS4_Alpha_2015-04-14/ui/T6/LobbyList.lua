require( "ui.T6.Playerlist" )
require( "ui.T6.Menus.SignInPopup" )

CoD.LobbyList = {}
CoD.LobbyList.AddSplitscreenRow = function ( self, text, allowJoin )
	local splitscreenRow = CoD.PlayerListRow.CreateSplitscreenRow( text, allowJoin )
	self.verticalList:addElement( splitscreenRow )
	self.rowCount = self.rowCount + 1
	return splitscreenRow
end

CoD.LobbyList.IsPrimaryControllerInList = function ( self )
	local controller = Engine.GetPrimaryController()
	local xuid = Engine.GetXUID( controller )
	return CoD.PlayerList.IsXuidInList( self, xuid )
end

CoD.LobbyList.ResetListAnimation = function ( self )
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
end

CoD.LobbyList.Update = function ( self, members, previousListsRowCount, setFocus, showCommonStatusRow )
	if self.splitscreenSignInRow ~= nil then
		self.splitscreenSignInRow:close()
		self.splitscreenSignInRow = nil
	end
	self:clearList()
	self.localPlayerCount = 0
	self.playerCount = 0
	self.rowCount = 0
	self:resetListAnimation()
	if self.splitscreenSignInAllowed == false then
		return 
	elseif Engine.PartyHostIsReadyToStart() == true then
		return 
	end
	local maxPlayers = Engine.DvarInt( nil, "party_maxplayers" )
	if members ~= nil and maxPlayers <= #members then
		return 
	end
	local usedControllers = Engine.GetUsedControllerCount()
	if self.maxLocalPlayers ~= nil and self.maxLocalPlayers <= usedControllers then
		return 
	end
	local rowText, allowJoin = nil
	local availableControllers = Engine.GetNonUsedControllerCount()
	if availableControllers > 0 then
		if usedControllers == 0 then
			rowText = Engine.Localize( "PLATFORM_FEEDER_PRIMARY_CONTROLLER_PLAY" )
		elseif true == Dvar.r_dualPlayEnable:get() and usedControllers >= 2 then
			rowText = Engine.Localize( "MPUI_SPLITSCREEN_DUALVIEW_RESTRICTION" )
		elseif true == CoD.isZombie and Dvar.r_stereo3DOn:get() and usedControllers >= 2 then
			rowText = Engine.Localize( "MPUI_SPLITSCREEN_3D_RESTRICTION" )
		else
			rowText = Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLAY" )
		end
		allowJoin = true
	else
		local maxControllers = Engine.GetMaxControllerCount()
		if usedControllers ~= nil and maxControllers ~= nil and maxControllers - usedControllers > 0 then
			rowText = Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" )
		end
	end
	if rowText ~= nil then
		self.splitscreenSignInRow = self:addSplitscreenRow( rowText, allowJoin )
		local listTop = CoD.PlayerListRow.Height * previousListsRowCount
		local listHeight = CoD.PlayerListRow.Height * self:getRowCount()
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = listTop,
			bottom = listTop + listHeight
		} )
		self:animateToState( "default" )
	end
end

CoD.LobbyList.SignClientIn = function ( self, controller, guest )
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
		if Engine.ProbationCheckInProbation( CoD.GAMEMODE_PUBLIC_MATCH, controller ) then
			self:dispatchEventToParent( {
				name = "sign_in_failed_probation",
				controller = controller,
				popup = "popup_public_inprobation"
			} )
			return 
		elseif Engine.ProbationCheckForProbation( CoD.GAMEMODE_PUBLIC_MATCH, controller ) then
			self:dispatchEventToParent( {
				name = "sign_in_failed_probation",
				controller = controller,
				popup = "popup_public_givenprobation"
			} )
			return 
		end
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		if Engine.ProbationCheckInProbation( CoD.GAMEMODE_LEAGUE_MATCH, controller ) then
			self:dispatchEventToParent( {
				name = "sign_in_failed_probation",
				controller = controller,
				popup = "popup_league_inprobation"
			} )
			return 
		elseif Engine.ProbationCheckForProbation( CoD.GAMEMODE_LEAGUE_MATCH, controller ) then
			self:dispatchEventToParent( {
				name = "sign_in_failed_probation",
				controller = controller,
				popup = "popup_league_givenprobation"
			} )
			return 
		end
	end
	if guest == true or guest == 1 then
		Engine.Exec( controller, "signclientin 1" )
	else
		Engine.Exec( controller, "signclientin" )
	end
end

CoD.LobbyList.SignIn = function ( self, event )
	if self.splitscreenSignInRow ~= nil and self.splitscreenSignInRow.allowJoin == true then
		CoD.LobbyList.SignClientIn( self, event.controller, false )
	end
end

CoD.LobbyList.SignInLocal = function ( self, event )
	if CoD.LobbyList.IsOfflineGame() and self.splitscreenSignInRow ~= nil and self.splitscreenSignInRow.allowJoin == true then
		CoD.LobbyList.SignClientIn( self, event.controller, false )
	end
end

CoD.LobbyList.GuestSignIn = function ( self, event )
	if self.splitscreenSignInRow ~= nil and self.splitscreenSignInRow.allowJoin == true then
		CoD.LobbyList.SignClientIn( self, event.controller, true )
	end
end

CoD.LobbyList.IsOfflineGame = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true or Engine.SessionMode_IsSystemlinkGame() then
		return true
	else
		return false
	end
end

CoD.LobbyList.UnusedGamepadButton = function ( self, event )
	local usedControllerCount = Engine.GetUsedControllerCount()
	if event.button == "primary" and event.down == true and not Engine.IsControllerBeingUsed( event.controller ) and (self.maxLocalPlayers == nil or usedControllerCount < self.maxLocalPlayers) and self.splitscreenSignInRow ~= nil and self.splitscreenSignInRow.allowJoin == true and (true ~= Dvar.r_dualPlayEnable:get() or usedControllerCount < 2) and (true ~= CoD.isZombie or not Dvar.r_stereo3DOn:get() or usedControllerCount < 2) then
		if true == CoD.LobbyList.IsOfflineGame() and Engine.IsSignedIn( event.controller ) then
			CoD.LobbyList.SignClientIn( self, event.controller, Engine.IsGuest( event.controller ) )
		elseif Engine.IsSignedInToLive( event.controller ) then
			CoD.LobbyList.SignClientIn( self, event.controller, Engine.IsGuest( event.controller ) )
		elseif not CoD.isWIIU then
			if CoD.isPS4 then
				if true == CoD.LobbyList.IsOfflineGame() then
					Engine.Exec( event.controller, "xsigninguest" )
				else
					self:dispatchEventToParent( {
						name = "open_sign_in",
						controller = event.controller
					} )
				end
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
				Engine.Exec( event.controller, "xsigninlive" )
			else
				Engine.Exec( event.controller, "xsignin" )
			end
		end
		return true
	else
		
	end
end

CoD.LobbyList.SetSplitscreenSignInAllowed = function ( self, splitscreenSignInAllowed )
	self.splitscreenSignInAllowed = splitscreenSignInAllowed
end

CoD.LobbyList.New = function ( defaultAnimationState, statusText, listName, parentId, teamMask, maxLocalPlayers )
	local lobbyList = CoD.PlayerList.New( defaultAnimationState, false, statusText, listName, parentId, teamMask )
	lobbyList.addSplitscreenRow = CoD.LobbyList.AddSplitscreenRow
	lobbyList.setSplitscreenSignInAllowed = CoD.LobbyList.SetSplitscreenSignInAllowed
	lobbyList.update = CoD.LobbyList.Update
	lobbyList.resetListAnimation = CoD.LobbyList.ResetListAnimation
	lobbyList.maxLocalPlayers = 0
	if maxLocalPlayers ~= nil then
		lobbyList.maxLocalPlayers = maxLocalPlayers
	end
	lobbyList:registerEventHandler( "unused_gamepad_button", CoD.LobbyList.UnusedGamepadButton )
	lobbyList:registerEventHandler( "signed_into_live", CoD.LobbyList.SignIn )
	lobbyList:registerEventHandler( "signed_in_local", CoD.LobbyList.SignInLocal )
	lobbyList:registerEventHandler( "stats_downloaded", CoD.LobbyList.SignIn )
	lobbyList:registerEventHandler( "guest_signed_into_live", CoD.LobbyList.GuestSignIn )
	return lobbyList
end

