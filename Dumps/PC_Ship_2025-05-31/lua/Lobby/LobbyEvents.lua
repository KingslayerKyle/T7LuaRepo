Lobby.Events = {}
Lobby.Events.LastPumpTime = nil
Lobby.Events.LastActiveEvents = {}
Lobby.Events.CustomRules = {}
Lobby.Events.ExecEvents = function ( f1_arg0, f1_arg1 )
	for f1_local3, f1_local4 in pairs( f1_arg0 ) do
		Engine.ExecAutoEventRuleSet( f1_local3 .. f1_arg1 )
	end
end

Lobby.Events.GetPlatform = function ()
	if LuaUtils.isPS4 then
		return "ps4"
	elseif LuaUtils.isXbox then
		return "xbox"
	elseif LuaUtils.isPC then
		return "pc"
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE, "Autoevent: Platform not detected.'\n" )
		return "unknown"
	end
end

Lobby.Events.IsInCustomRule = function ( f3_arg0 )
	if f3_arg0 == nil or f3_arg0 == "" then
		return true
	elseif nil == Lobby.Events.CustomRules or Lobby.Events.CustomRules[f3_arg0] == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE, "Autoevent: Invalid custom rule '" .. f3_arg0 .. "'\n" )
		return false
	else
		return Lobby.Events.CustomRules[f3_arg0]()
	end
end

Lobby.Events.GetScheduledEvents = function ( f4_arg0, f4_arg1 )
	local f4_local0 = "events"
	local f4_local1 = "gamedata/events/schedule.csv"
	local f4_local2 = Engine.GetTableRowCount( f4_local1 )
	local f4_local3 = false
	for f4_local4 = 0, f4_local2 - 1, 1 do
		local f4_local7 = Engine.TableGetColumnValueForRow( f4_local1, f4_local4, 3 )
		local f4_local8 = Engine.TableGetColumnValueForRow( f4_local1, f4_local4, 4 )
		local f4_local9 = Engine.TableGetColumnValueForRow( f4_local1, f4_local4, 5 )
		local f4_local10 = Engine.TableGetColumnValueForRow( f4_local1, f4_local4, 6 )
		if f4_local7 == "all" or f4_local7 == Lobby.Events.GetPlatform() then
			local f4_local11 = Engine.TableGetColumnValueForRow( f4_local1, f4_local4, 0 )
			local f4_local12 = Engine.TableGetColumnValueForRow( f4_local1, f4_local4, 1 )
			local f4_local13 = Engine.TableGetColumnValueForRow( f4_local1, f4_local4, 2 )
			local f4_local14 = Engine.IsInRange( tostring( Engine.GetServerUTCTimeStr() ), f4_local12, f4_local13 )
			if f4_local11 == "double_vials_cc" and f4_local14 then
				if tonumber( Engine.TableLookup( nil, "gamedata/store/common/incentives.csv", 2, "bgbcc_tier1", 8 ) ) <= tonumber( Engine.GetCounterValue( "zm_bgb_consumed" ) ) then
					f4_local14 = true
				else
					f4_local14 = false
				end
			end
			if f4_local14 and (Engine.IsDedicatedServer() or f4_local8 == nil or f4_local8 == "" or CoDShared.IsInExperiment( f4_local8, f4_local9 )) and Lobby.Events.IsInCustomRule( f4_local10 ) then
				f4_arg0[f4_local11] = true
				if Lobby.Events.LastActiveEvents[f4_local11] == nil then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE, "Autoevent: ACTIVATING event '" .. f4_local11 .. "' [" .. Engine.GetServerUTCTimeStr() .. "]\n" )
					f4_local3 = true
				end
				local f4_local15 = Engine.StructTableLookupString( f4_local0, "name", f4_local11 .. "_ON", "timer_name" )
				if f4_local15 ~= nil and f4_local15 ~= "" then
					local f4_local16 = Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" )
					Engine.SetModelValue( Engine.CreateModel( f4_local16, f4_local15 ), LuaUtils.SecondsToTimeRemainingString( Engine.GetSecondsRemainingServer( f4_local13 ) + 1 ) )
					Engine.SetModelValue( Engine.CreateModel( f4_local16, f4_local15 .. "_red" ), Engine.GetSecondsRemainingServer( f4_local13 ) < 300 )
				end
			end
			f4_arg1[f4_local11] = true
		end
	end
	return changedOccured
end

Lobby.Events.GetRotatingEvents = function ( f5_arg0, f5_arg1 )
	local f5_local0 = ""
	if Engine.GetCurrentRotatingEvent ~= nil then
		f5_local0 = Engine.GetCurrentRotatingEvent()
	end
	local f5_local1 = false
	if f5_local0 == nil or f5_local0 == "" then
		return 
	elseif f5_local0 ~= "rotation_pause_featured" then
		f5_arg0[f5_local0] = true
	end
	if Lobby.Events.LastActiveEvents[f5_local0] == nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE, "Autoevent: ACTIVATING event '" .. f5_local0 .. "' [" .. Engine.GetServerUTCTimeStr() .. "]\n" )
		f5_local1 = true
	end
	local f5_local2 = "gamedata/events/rotation.csv"
	local f5_local3 = Engine.GetTableRowCount( f5_local2 )
	for f5_local4 = 0, f5_local3 - 1, 1 do
		f5_arg1[Engine.TableGetColumnValueForRow( f5_local2, f5_local4, 0 )] = true
	end
	return changedOccured
end

Lobby.Events.ParseEvents = function ()
	local f6_local0 = {}
	local f6_local1 = {}
	local f6_local2 = Lobby.Events.GetScheduledEvents( f6_local0, f6_local1 )
	local f6_local3 = Lobby.Events.GetRotatingEvents( f6_local0, f6_local1 )
	Lobby.Events.ExecEvents( f6_local1, "_OFF" )
	Lobby.Events.ExecEvents( f6_local0, "_ON" )
	local f6_local4 = false
	for f6_local8, f6_local9 in pairs( Lobby.Events.LastActiveEvents ) do
		if f6_local0[f6_local8] == nil then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE, "Autoevent: DEACTIVATING event '" .. f6_local8 .. "' [" .. Engine.GetCurrentUTCTimeStr() .. "]\n" )
			f6_local4 = true
		end
	end
	if f6_local2 == true or f6_local3 == true or f6_local4 == true then
		f6_local6 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
		if not Engine.SetModelValue( f6_local6, 1 ) then
			Engine.ForceNotifyModelSubscriptions( f6_local6 )
		end
	end
	Lobby.Events.LastActiveEvents = f6_local0
end

Lobby.Events.ParseEventsSecure = function ()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE, "Autoevent: ParseEventsSecure not overridden by the ffotd. Autoevents are disabled.'\n" )
	end
end

Lobby.Events.Pump = function ()
	if Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsInGame() then
		return 
	elseif not Dvar.live_autoEventEnabled:get() then
		return 
	elseif Engine.DvarString( nil, "reward_retry_perform_action" ) == "1" then
		controller = tonumber( Engine.DvarString( nil, "reward_retry_controller" ) )
		if Engine.IsDemonwareFetchingDone( controller ) then
			LuaUtils.BuyWeaponContractIfNeeded( controller )
			LuaUtils.BuySpecialContractRewardsIfNeeded( controller )
			local f8_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "mp_loot_xp_due" )
			if f8_local0 then
				local f8_local1 = Engine.GetModelValue( f8_local0 )
				if f8_local1 then
					Engine.IncrementCurrency( controller, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_LOOT_XP, f8_local1 )
				end
			end
		end
		Engine.SetDvar( "reward_retry_perform_action", "0" )
	end
	if Engine.DvarInt( nil, "live_autoEventPumpTime" ) < Engine.milliseconds() then
		Engine.SetDvar( "live_autoEventPumpTime", Engine.milliseconds() + Dvar.live_autoEventPumpDelay:get() )
		Lobby.Events.ParseEventsSecure()
		Lobby.Events.LastPumpTime = Engine.milliseconds()
	end
end

