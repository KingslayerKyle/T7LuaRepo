require( "lua.Lobby.LobbyDebug" )

Lobby.ProcessQueue = {}
Lobby.ProcessQueue.INVALID_ACTION_ID = 0
Lobby.ProcessQueue.EVENT_START_ERROR = -1
Lobby.ProcessQueue.ACTIONSTATE = {
	PENDING = 0,
	RUNNING = 1,
	SUCCESS = 2,
	FAILURE = 3,
	ERROR = 4,
	THROTTLED = 5
}
Lobby.ProcessQueue.queue = nil
Lobby.ProcessQueue.actionId = 1
Lobby.ProcessQueue.queueSize = 10
Lobby.ProcessQueue.ClearQueue = function ()
	Lobby.ProcessQueue.queue = {
		processName = "",
		head = nil,
		history = nil,
		interrupt = nil,
		cancellable = nil
	}
	Lobby.ProcessQueue.SetQueueEmptyModel( true )
end

Lobby.ProcessQueue.SetQueueEmptyModel = function ( f2_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot", true ), "queueEmpty", true ), f2_arg0 )
end

Lobby.ProcessQueue.ReplaceWith = function ( f3_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Lobby.ProcessQueue.queue.processName .. "', Replacing '" .. Lobby.ProcessQueue.queue.head.name .. "' with '" .. f3_arg0.name .. "' in process queue.\n" )
	f3_arg0.state = Lobby.ProcessQueue.ACTIONSTATE.PENDING
	Lobby.ProcessQueue.queue.head = f3_arg0
end

Lobby.ProcessQueue.CreateInterrupt = function ( f4_arg0, f4_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Lobby.ProcessQueue.queue.processName .. "', Replacing '" .. Lobby.ProcessQueue.queue.head.name .. "' with '" .. f4_arg0.name .. "' in process queue.\n" )
	local f4_local0 = f4_arg1:createFuncPtr( f4_arg0 )
	return f4_local0.head
end

Lobby.ProcessQueue.Init = function ()
	Lobby.ProcessQueue.ClearQueue()
	Lobby.ProcessQueue.TaskHistory = {}
end

Lobby.ProcessQueue.IsQueueEmpty = function ()
	if Lobby.ProcessQueue.queue.head ~= nil then
		return false
	else
		return true
	end
end

Lobby.ProcessQueue.GetQueueHead = function ()
	return Lobby.ProcessQueue.queue.head
end

Lobby.ProcessQueue.SetCancellable = function ( f8_arg0 )
	Lobby.ProcessQueue.queue.cancellable = f8_arg0
end

Lobby.ProcessQueue.GetCurrentRunningProcessName = function ()
	if Lobby.ProcessQueue.queue == nil or Lobby.ProcessQueue.queue.processName == nil then
		return ""
	else
		return Lobby.ProcessQueue.queue.processName
	end
end

Lobby.ProcessQueue.AddToQueue = function ( f10_arg0, f10_arg1 )
	if f10_arg1 == nil then
		LuaUtils.LogQoS( "addtoqueue_nil", f10_arg0 )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Lobby.ProcessQueue.ClearQueue()
		f10_arg1.head.state = Lobby.ProcessQueue.ACTIONSTATE.PENDING
		Lobby.ProcessQueue.queue.processName = f10_arg0
		Lobby.ProcessQueue.queue.history = f10_arg1.head
		Lobby.ProcessQueue.queue.head = f10_arg1.head
		Lobby.ProcessQueue.queue.interrupt = f10_arg1.interrupt
		Lobby.ProcessQueue.queue.cancellable = f10_arg1.cancellable
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE START****************\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process: '" .. f10_arg0 .. "', head action: '" .. f10_arg1.head.name .. "' to queue.\n" )
	elseif Lobby.ProcessQueue.queue.cancellable == true or f10_arg1.force == true then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE CHANGE****************\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process '" .. f10_arg0 .. "' when process '" .. Lobby.ProcessQueue.queue.processName .. "' is currently running.\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Will finish process '" .. Lobby.ProcessQueue.queue.processName .. "' current running action '" .. Lobby.ProcessQueue.queue.head.name .. "', then proceed with process '" .. f10_arg0 .. "'.\n" )
		LuaUtils.LogQoS( "lobby_queue", {
			runningProcess = Lobby.ProcessQueue.queue.processName,
			newProcess = f10_arg0
		} )
		LuaUtils.FlushQoS()
		Lobby.ProcessQueue.queue.processName = f10_arg0
		Lobby.ProcessQueue.queue.history = f10_arg1.head
		Lobby.Process.ForceAction( Lobby.ProcessQueue.queue.head, f10_arg1.head )
		Lobby.ProcessQueue.queue.interrupt = f10_arg1.interrupt
		if nil ~= Lobby.ProcessQueue.queue.head.cancelFuncPtr then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Cancelling action: '" .. Lobby.ProcessQueue.queue.head.name .. "'.\n" )
			Lobby.ProcessQueue.queue.head.canceled = true
			Lobby.ProcessQueue.queue.head:cancelFuncPtr()
		else
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "No cancel func (cancelFuncPtr) defined for action: '" .. Lobby.ProcessQueue.queue.head.name .. "'.\n" )
		end
	end
	Lobby.ProcessQueue.SetQueueEmptyModel( false )
	Lobby.Debug.AddDebugProcess()
	Lobby.ProcessQueue.Pump()
end

Lobby.ProcessQueue.ErrorShutdown = function ()
	if Lobby.ProcessQueue.queue.head ~= nil and Lobby.ProcessQueue.queue.head.cancelFuncPtr ~= nil then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Cancelling action: '" .. Lobby.ProcessQueue.queue.head.name .. "'.\n" )
		Lobby.ProcessQueue.queue.head.canceled = true
		Lobby.ProcessQueue.queue.head:cancelFuncPtr()
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
	Lobby.ProcessQueue.ClearQueue()
end

Lobby.ProcessQueue.Pump = function ()
	if not Engine.IsMainThreadOrProxy() then
		return 
	end
	local f12_local0 = Lobby.ProcessQueue.queue.head
	while f12_local0 ~= nil do
		if f12_local0.state == Lobby.ProcessQueue.ACTIONSTATE.PENDING or f12_local0.state == Lobby.ProcessQueue.ACTIONSTATE.THROTTLED then
			if not Lobby.ProcessQueue.TaskHistory[f12_local0.name] then
				Lobby.ProcessQueue.TaskHistory[f12_local0.name] = {}
				Lobby.ProcessQueue.TaskHistory[f12_local0.name].count = 0
				Lobby.ProcessQueue.TaskHistory[f12_local0.name].lastRunTime = 0
			end
			if Lobby.ProcessQueue.TaskHistory[f12_local0.name].lastRunTime > 0 and f12_local0.throttle ~= nil and f12_local0.throttle > 0 then
				local f12_local1 = Engine.milliseconds()
				if f12_local1 < Lobby.ProcessQueue.TaskHistory[f12_local0.name].lastRunTime + f12_local0.throttle then
					if f12_local0.state == Lobby.ProcessQueue.ACTIONSTATE.PENDING then
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Throttling '" .. f12_local0.name .. "' [ID:" .. Lobby.ProcessQueue.actionId .. " for: " .. tostring( Lobby.ProcessQueue.TaskHistory[f12_local0.name].lastRunTime + f12_local0.throttle - f12_local1 ) .. " ms ]...\n" )
						f12_local0.state = Lobby.ProcessQueue.ACTIONSTATE.THROTTLED
					end
					return 
				end
			end
			f12_local0.state = Lobby.ProcessQueue.ACTIONSTATE.RUNNING
			f12_local0.actionId = Lobby.ProcessQueue.actionId
			f12_local0.startTime = Engine.milliseconds()
			Lobby.ProcessQueue.actionId = Lobby.ProcessQueue.actionId + 1
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Executing '" .. f12_local0.name .. "' [ID:" .. f12_local0.actionId .. "]...\n" )
			Lobby.Debug.AddDebugAction( f12_local0 )
			if f12_local0.startFuncPtr ~= nil then
				f12_local0:startFuncPtr()
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f12_local0.name .. "' [ID:" .. f12_local0.actionId .. "] is asynchronous.\n" )
			Lobby.ProcessQueue.TaskHistory[f12_local0.name].count = Lobby.ProcessQueue.TaskHistory[f12_local0.name].count + 1
			Lobby.ProcessQueue.TaskHistory[f12_local0.name].lastRunTime = f12_local0.startTime
		end
		if f12_local0.state == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			if f12_local0.pumpFuncPtr ~= nil then
				f12_local0:pumpFuncPtr()
			end
			Lobby.Debug.UpdateProcessQueue()
			return 
		end
		local f12_local1 = nil
		local f12_local2 = -1
		if f12_local0.startTime ~= nil then
			f12_local2 = Engine.milliseconds() - f12_local0.startTime
		end
		if f12_local0.endFuncPtr ~= nil then
			f12_local0:endFuncPtr()
		end
		if f12_local0.state == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f12_local0.name .. "' [ID:" .. f12_local0.actionId .. "] completed successfully in " .. f12_local2 .. "ms.\n" )
			f12_local1 = f12_local0.success
			if f12_local0.success ~= nil and f12_local0.success.isInterrupt == true then
				f12_local1 = Lobby.ProcessQueue.CreateInterrupt( f12_local0, f12_local0.success )
			else
				f12_local1 = f12_local0.success
			end
			Lobby.Debug.UpdateProcessQueue()
		elseif f12_local0.state == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f12_local0.name .. "' [ID:" .. f12_local0.actionId .. "] completed with failure in " .. f12_local2 .. "ms.\n" )
			if f12_local0.failure ~= nil and f12_local0.failure.isInterrupt == true then
				f12_local1 = Lobby.ProcessQueue.CreateInterrupt( f12_local0, f12_local0.failure )
			else
				f12_local1 = f12_local0.failure
			end
			Lobby.Debug.UpdateProcessQueue()
		elseif f12_local0.state == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f12_local0.name .. "' [ID:" .. f12_local0.actionId .. "] completed with error in " .. f12_local2 .. "ms.\n" )
			if f12_local0.error ~= nil and f12_local0.error.isInterrupt == true then
				f12_local1 = Lobby.ProcessQueue.CreateInterrupt( f12_local0, f12_local0.error )
			else
				f12_local1 = f12_local0.error
			end
			Lobby.Debug.UpdateProcessQueue()
		end
		if f12_local1 ~= nil then
			Lobby.ProcessQueue.ReplaceWith( f12_local1 )
		else
			Lobby.ProcessQueue.ClearQueue()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Process tree complete.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE END****************\n" )
		end
		f12_local0 = Lobby.ProcessQueue.queue.head
	end
end

Lobby.ProcessQueue.CompleteEvent = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = Lobby.ProcessQueue.queue.head
	local f13_local1 = f13_arg2.actionId
	if f13_local1 <= Lobby.ProcessQueue.INVALID_ACTION_ID then
		Lobby.ProcessQueue.ProcessEvent( f13_local1, f13_arg0, f13_arg2 )
		return 
	elseif f13_local0 == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. f13_arg1 .. " event but the action queue is empty. actionId: " .. f13_local1 .. ".\n" )
	else
		local f13_local2 = "LobbyAction: task completed " .. f13_arg1 .. " event. Head: " .. f13_local0.name .. ", actionId: " .. f13_local0.actionId .. ".\n"
		if f13_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYVM, f13_local2 )
		elseif f13_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "***********************************************************************\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, f13_local2 )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "***********************************************************************\n" )
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, f13_local2 )
		end
		if f13_local0.actionId ~= f13_local1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "^6LobbyAction: mismatched task completed " .. f13_arg1 .. " event. Head: " .. f13_local0.name .. " was at actionId: " .. f13_local0.actionId .. " but we received actionId: " .. f13_local1 .. ".\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			if Engine.IsShipBuild() == false then
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "Lobby process queue error occurred, please email your logs to codcoreonline@treyarch.com" )
			else
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, Engine.Localize( "EXE_LOBBY_PROCESS_QUEUE_ERROR", LuaUtils.ValueToHex( LuaEnums.ERROR_CODE.TASK_MISMATCHED ) ) )
			end
			return 
		elseif f13_local0.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING and (not f13_local0.canceled or f13_local0.canceled == false) then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "^6LobbyAction: received a task completed " .. f13_arg1 .. " event for non-running action queue head: " .. f13_local0.name .. ", actionId: " .. f13_local0.actionId .. ".\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			if Engine.IsShipBuild() == false then
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "Lobby process queue error occurred, please email your logs to codcoreonline@treyarch.com" )
			else
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, Engine.Localize( "EXE_LOBBY_PROCESS_QUEUE_ERROR", LuaUtils.ValueToHex( LuaEnums.ERROR_CODE.NONRUNNING_TASK ) ) )
			end
			return 
		end
		f13_local0.state = f13_arg0
		f13_local0.retData = f13_arg2
	end
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Success = function ( f14_arg0 )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.SUCCESS, "success", f14_arg0 )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Failure = function ( f15_arg0 )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.FAILURE, "failure", f15_arg0 )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Error = function ( f16_arg0 )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.ERROR, "error", f16_arg0 )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Update = function ( f17_arg0 )
	local f17_local0 = Lobby.ProcessQueue.queue.head
	local f17_local1 = f17_arg0.actionId
	if f17_local1 <= Lobby.ProcessQueue.INVALID_ACTION_ID then
		Lobby.ProcessQueue.ProcessEvent( f17_local1, Lobby.ProcessQueue.ACTIONSTATE.UPDATE, f17_arg0 )
		return 
	elseif f17_local0 == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: received an update but the action queue is empty. actionId: " .. f17_local1 .. ".\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: Lobby.ProcessQueue.Update. Head:" .. f17_local0.name .. ", actionId: " .. f17_local0.actionId .. ".\n" )
		if f17_local0.actionId ~= f17_local1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: mismatched update. Head: " .. f17_local0.name .. " was at actionId: " .. f17_local0.actionId .. " but we received actionId: " .. f17_local1 .. ".\n" )
		end
		if f17_local0.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: received a update for non-running action queue head: " .. f17_local0.name .. ", actionId: " .. f17_local0.actionId .. ".\n" )
		end
		if f17_local0.updateFuncPtr == nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: received a update for an action at head that doesn't have a head:updateFuncPtr() defined. Head: " .. f17_local0.name .. ", actionId: " .. f17_local0.actionId .. "\n" )
		end
		f17_local0:updateFuncPtr( f17_arg0 )
	end
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.eventHandlerActionId = Lobby.ProcessQueue.INVALID_ACTION_ID
Lobby.ProcessQueue.eventHandler = {}
Lobby.ProcessQueue.RegisterEventHandler = function ( f18_arg0, f18_arg1 )
	Lobby.ProcessQueue.eventHandlerActionId = Lobby.ProcessQueue.eventHandlerActionId + 1
	Lobby.ProcessQueue.eventHandler[Lobby.ProcessQueue.eventHandlerActionId] = {
		callbackFunction = f18_arg0,
		eventData = f18_arg1
	}
	return Lobby.ProcessQueue.eventHandlerActionId * -1
end

Lobby.ProcessQueue.UnRegisterEventHandler = function ( f19_arg0 )
	if f19_arg0 == Lobby.ProcessQueue.INVALID_ACTION_ID then
		return false
	else
		f19_arg0 = math.abs( f19_arg0 )
		if Lobby.ProcessQueue.eventHandler[f19_arg0] == nil then
			return false
		else
			Lobby.ProcessQueue.eventHandler[f19_arg0] = nil
			return true
		end
	end
end

Lobby.ProcessQueue.ProcessEvent = function ( f20_arg0, f20_arg1, f20_arg2 )
	if f20_arg0 == Lobby.ProcessQueue.INVALID_ACTION_ID then
		return false
	else
		f20_arg0 = math.abs( f20_arg0 )
		if Lobby.ProcessQueue.eventHandler[f20_arg0] == nil then
			return false
		elseif Lobby.ProcessQueue.eventHandler[f20_arg0].callbackFunction( f20_arg1, Lobby.ProcessQueue.eventHandler[f20_arg0].eventData, f20_arg2 ) == false then
			return false
		else
			Lobby.ProcessQueue.eventHandler[f20_arg0] = nil
			return true
		end
	end
end

