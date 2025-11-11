Lobby.Scheduler = {}
Lobby.Scheduler.LastPumpTime = nil
Lobby.Scheduler.LastActiveEvents = {}
Lobby.Scheduler.ExecEvents = function ( events, postFix )
	for eventName, _ in pairs( events ) do
		Engine.ExecPlaylistEventRules( eventName, postFix )
	end
end

Lobby.Scheduler.ParseEvents = function ()
	local eventSchedule = Engine.GetPlaylistEventSchedule()
	if not eventSchedule then
		return 
	end
	local numScheduledEvents = eventSchedule.numEntries
	local inactiveEvents = {}
	local activeEvents = {}
	local changeOccured = false
	for i = 1, eventSchedule.numEntries, 1 do
		local scheduleEntry = eventSchedule[i]
		if scheduleEntry.isEnabledForPlatform == true then
			local eventName = scheduleEntry.event.name
			local startTime = scheduleEntry.startTime
			local endTime = scheduleEntry.endTime
			local now = tostring( Engine.GetServerUTCTimeStr() )
			if Engine.IsInRange( now, startTime, endTime ) then
				activeEvents[eventName] = true
				if Lobby.Scheduler.LastActiveEvents[eventName] == nil then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE, "Autoevent: ACTIVATING event '" .. eventName .. "' [" .. Engine.GetServerUTCTimeStr() .. "]\n" )
					changeOccured = true
				end
				local timerName = scheduleEntry.event.timerName
				if timerName ~= nil and timerName ~= "" then
					local autoEventModel = Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" )
					local timeRemainingModel = Engine.CreateModel( autoEventModel, timerName )
					Engine.SetModelValue( timeRemainingModel, LuaUtils.SecondsToTimeRemainingString( Engine.GetSecondsRemainingServer( endTime ) + 1 ) )
					local isAlmostExpiredModel = Engine.CreateModel( autoEventModel, timerName .. "_red" )
					Engine.SetModelValue( isAlmostExpiredModel, Engine.GetSecondsRemainingServer( endTime ) < 300 )
				end
			end
			inactiveEvents[eventName] = true
		end
	end
	for eventName, _ in pairs( Lobby.Scheduler.LastActiveEvents ) do
		if activeEvents[eventName] == nil then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE, "Autoevent: DEACTIVATING event '" .. eventName .. "' [" .. Engine.GetCurrentUTCTimeStr() .. "]\n" )
			changeOccured = true
		end
	end
	Lobby.Scheduler.ExecEvents( inactiveEvents, "off" )
	Lobby.Scheduler.ExecEvents( activeEvents, "on" )
	if changeOccured == true then
		local autoEventModel = Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" )
		local cycledModel = Engine.CreateModel( autoEventModel, "cycled" )
		if not Engine.SetModelValue( cycledModel, 1 ) then
			Engine.ForceNotifyModelSubscriptions( cycledModel )
		end
	end
	Lobby.Scheduler.LastActiveEvents = activeEvents
end

Lobby.Scheduler.ParseEventsSecure = function ()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE, "Autoevent: ParseEventsSecure not overridden by the ffotd. Autoevents are disabled.'\n" )
	end
end

Lobby.Scheduler.Pump = function ()
	if Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsInGame() then
		return 
	elseif not Dvar.live_autoEventEnabled:get() then
		return 
	elseif Engine.GetDvarString( "reward_retry_perform_action" ) == "1" then
		controller = tonumber( Engine.GetDvarString( "reward_retry_controller" ) )
		if Engine.IsDemonwareFetchingDone( controller ) then
			if LuaUtils.IsWeaponContractNeeded( controller ) then
				LuaUtils.BuyWeaponContractIfNeeded( controller )
			end
			if (Engine.GetCryptokeysDue( controller ) or 0) > 0 then
				Engine.RetryCryptokeysDue( controller )
			end
		end
		Engine.SetDvar( "reward_retry_perform_action", "0" )
	end
	if Engine.GetDvarInt( "live_autoEventPumpTime" ) < Engine.milliseconds() then
		Engine.SetDvar( "live_autoEventPumpTime", Engine.milliseconds() + Dvar.live_autoEventPumpDelay:get() )
		Lobby.Scheduler.ParseEventsSecure()
		Lobby.Scheduler.LastPumpTime = Engine.milliseconds()
	end
end

