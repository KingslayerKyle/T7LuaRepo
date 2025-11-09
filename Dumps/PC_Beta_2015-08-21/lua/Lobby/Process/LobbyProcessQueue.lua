Lobby.ProcessQueue = {}
Lobby.ProcessQueue.ACTIONSTATE = {
	PENDING = 0,
	RUNNING = 1,
	SUCCESS = 2,
	FAILURE = 3,
	ERROR = 4,
	THROTTLED = 5
}
Lobby.ProcessQueue.queue = nil
Lobby.ProcessQueue.actionId = 0
Lobby.ProcessQueue.queueSize = 10
Lobby.ProcessQueue.ClearQueue = function ()
	Lobby.ProcessQueue.queue = {
		processName = "",
		head = nil,
		history = nil,
		interrupt = nil,
		cancellable = nil
	}
end

Lobby.ProcessQueue.ReplaceWith = function ( f2_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Lobby.ProcessQueue.queue.processName .. "', Replacing '" .. Lobby.ProcessQueue.queue.head.name .. "' with '" .. f2_arg0.name .. "' in process queue.\n" )
	f2_arg0.state = Lobby.ProcessQueue.ACTIONSTATE.PENDING
	Lobby.ProcessQueue.queue.head = f2_arg0
end

Lobby.ProcessQueue.CreateInterrupt = function ( f3_arg0, f3_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Lobby.ProcessQueue.queue.processName .. "', Replacing '" .. Lobby.ProcessQueue.queue.head.name .. "' with '" .. f3_arg0.name .. "' in process queue.\n" )
	local f3_local0 = f3_arg1:createFuncPtr( f3_arg0 )
	return f3_local0.head
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

Lobby.ProcessQueue.SetCancellable = function ( f7_arg0 )
	Lobby.ProcessQueue.queue.cancellable = f7_arg0
end

Lobby.ProcessQueue.GetCurrentRunningProcessName = function ()
	if Lobby.ProcessQueue.queue == nil or Lobby.ProcessQueue.queue.processName == nil then
		return ""
	else
		return Lobby.ProcessQueue.queue.processName
	end
end

Lobby.ProcessQueue.AddToQueue = function ( f9_arg0, f9_arg1 )
	if Lobby.ProcessQueue.IsQueueEmpty() then
		Lobby.ProcessQueue.ClearQueue()
		f9_arg1.head.state = Lobby.ProcessQueue.ACTIONSTATE.PENDING
		Lobby.ProcessQueue.queue.processName = f9_arg0
		Lobby.ProcessQueue.queue.history = f9_arg1.head
		Lobby.ProcessQueue.queue.head = f9_arg1.head
		Lobby.ProcessQueue.queue.interrupt = f9_arg1.interrupt
		Lobby.ProcessQueue.queue.cancellable = f9_arg1.cancellable
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE START****************\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process: '" .. f9_arg0 .. "', head action: '" .. f9_arg1.head.name .. "' to queue.\n" )
	elseif Lobby.ProcessQueue.queue.cancellable == true or f9_arg1.force == true then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE CHANGE****************\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process '" .. f9_arg0 .. "' when process '" .. Lobby.ProcessQueue.queue.processName .. "' is currently running.\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Will finish process '" .. Lobby.ProcessQueue.queue.processName .. "' current running action '" .. Lobby.ProcessQueue.queue.head.name .. "', then proceed with process '" .. f9_arg0 .. "'.\n" )
		LuaUtils.LogQoS( "lobby_queue", {
			runningProcess = Lobby.ProcessQueue.queue.processName,
			newProcess = f9_arg0
		} )
		LuaUtils.FlushQoS()
		Lobby.ProcessQueue.queue.processName = f9_arg0
		Lobby.ProcessQueue.queue.history = f9_arg1.head
		Lobby.Process.ForceAction( Lobby.ProcessQueue.queue.head, f9_arg1.head )
		Lobby.ProcessQueue.queue.interrupt = f9_arg1.interrupt
		if Lobby.ProcessQueue.queue.head.cancelFuncPtr ~= nil then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Cancelling action: '" .. Lobby.ProcessQueue.queue.head.name .. "'.\n" )
			Lobby.ProcessQueue.queue.head.canceled = true
			Lobby.ProcessQueue.queue.head:cancelFuncPtr()
		else
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "No cancel func (cancelFuncPtr) defined for action: '" .. Lobby.ProcessQueue.queue.head.name .. "'.\n" )
		end
	end
	Lobby.ProcessQueue.Pump()
end

Lobby.ProcessQueue.ErrorShutdown = function ()
	if Lobby.ProcessQueue.queue.head ~= nil and Lobby.ProcessQueue.queue.head.cancelFuncPtr ~= nil then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Cancelling action: '" .. Lobby.ProcessQueue.queue.head.name .. "'.\n" )
		Lobby.ProcessQueue.queue.head.canceled = true
		Lobby.ProcessQueue.queue.head:cancelFuncPtr()
	end
	Engine.LuiVM_Event( "lobby_spinner_popup", {
		openPopup = false,
		actionId = -1
	} )
	Lobby.ProcessQueue.ClearQueue()
end

Lobby.ProcessQueue.Pump = function ()
	local f11_local0 = Lobby.ProcessQueue.queue.head
	while f11_local0 ~= nil do
		if f11_local0.state == Lobby.ProcessQueue.ACTIONSTATE.PENDING or f11_local0.state == Lobby.ProcessQueue.ACTIONSTATE.THROTTLED then
			if not Lobby.ProcessQueue.TaskHistory[f11_local0.name] then
				Lobby.ProcessQueue.TaskHistory[f11_local0.name] = {}
				Lobby.ProcessQueue.TaskHistory[f11_local0.name].count = 0
				Lobby.ProcessQueue.TaskHistory[f11_local0.name].lastRunTime = 0
			end
			if Lobby.ProcessQueue.TaskHistory[f11_local0.name].lastRunTime > 0 and f11_local0.throttle ~= nil and f11_local0.throttle > 0 then
				local f11_local1 = Engine.milliseconds()
				if f11_local1 < Lobby.ProcessQueue.TaskHistory[f11_local0.name].lastRunTime + f11_local0.throttle then
					if f11_local0.state == Lobby.ProcessQueue.ACTIONSTATE.PENDING then
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Throttling '" .. f11_local0.name .. "' [ID:" .. Lobby.ProcessQueue.actionId .. " for: " .. tostring( Lobby.ProcessQueue.TaskHistory[f11_local0.name].lastRunTime + f11_local0.throttle - f11_local1 ) .. " ms ]...\n" )
						f11_local0.state = Lobby.ProcessQueue.ACTIONSTATE.THROTTLED
					end
					return 
				end
			end
			f11_local0.actionId = Lobby.ProcessQueue.actionId
			f11_local0.startTime = Engine.milliseconds()
			f11_local0.state = Lobby.ProcessQueue.ACTIONSTATE.RUNNING
			Lobby.ProcessQueue.actionId = Lobby.ProcessQueue.actionId + 1
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Executing '" .. f11_local0.name .. "' [ID:" .. f11_local0.actionId .. "]...\n" )
			if f11_local0.startFuncPtr ~= nil then
				f11_local0:startFuncPtr()
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f11_local0.name .. "' [ID:" .. f11_local0.actionId .. "] is asynchronous.\n" )
			Lobby.ProcessQueue.TaskHistory[f11_local0.name].count = Lobby.ProcessQueue.TaskHistory[f11_local0.name].count + 1
			Lobby.ProcessQueue.TaskHistory[f11_local0.name].lastRunTime = f11_local0.startTime
		end
		if f11_local0.state == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			if f11_local0.pumpFuncPtr ~= nil then
				f11_local0:pumpFuncPtr()
			end
			return 
		end
		local f11_local1 = nil
		local f11_local2 = -1
		if f11_local0.startTime ~= nil then
			f11_local2 = Engine.milliseconds() - f11_local0.startTime
		end
		if f11_local0.endFuncPtr ~= nil then
			f11_local0:endFuncPtr()
		end
		if f11_local0.state == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f11_local0.name .. "' [ID:" .. f11_local0.actionId .. "] completed successfully in " .. f11_local2 .. "ms.\n" )
			f11_local1 = f11_local0.success
			if f11_local0.success ~= nil and f11_local0.success.isInterrupt == true then
				f11_local1 = Lobby.ProcessQueue.CreateInterrupt( f11_local0, f11_local0.success )
			else
				f11_local1 = f11_local0.success
			end
		elseif f11_local0.state == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f11_local0.name .. "' [ID:" .. f11_local0.actionId .. "] completed with failure in " .. f11_local2 .. "ms.\n" )
			if f11_local0.failure ~= nil and f11_local0.failure.isInterrupt == true then
				f11_local1 = Lobby.ProcessQueue.CreateInterrupt( f11_local0, f11_local0.failure )
			else
				f11_local1 = f11_local0.failure
			end
		elseif f11_local0.state == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. f11_local0.name .. "' [ID:" .. f11_local0.actionId .. "] completed with error in " .. f11_local2 .. "ms.\n" )
			if f11_local0.error ~= nil and f11_local0.error.isInterrupt == true then
				f11_local1 = Lobby.ProcessQueue.CreateInterrupt( f11_local0, f11_local0.error )
			else
				f11_local1 = f11_local0.error
			end
		end
		if f11_local1 ~= nil then
			Lobby.ProcessQueue.ReplaceWith( f11_local1 )
		else
			Lobby.ProcessQueue.ClearQueue()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Process tree complete.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE END****************\n" )
		end
		f11_local0 = Lobby.ProcessQueue.queue.head
	end
end

Lobby.ProcessQueue.CompleteEvent = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = Lobby.ProcessQueue.queue.head
	local f12_local1 = f12_arg2.actionId
	if f12_local1 == -1 then
		return 
	elseif f12_local0 == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. f12_arg1 .. " event but the action queue is empty. actionId: " .. f12_local1 .. ".\n" )
	else
		local f12_local2 = "LobbyAction: task completed " .. f12_arg1 .. " event. Head: " .. f12_local0.name .. ", actionId: " .. f12_local0.actionId .. ".\n"
		if f12_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, f12_local2 )
		elseif f12_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "***********************************************************************\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, f12_local2 )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "***********************************************************************\n" )
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, f12_local2 )
		end
		if f12_local0.actionId ~= f12_local1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: mismatched task completed " .. f12_arg1 .. " event. Head: " .. f12_local0.name .. " was at actionId: " .. f12_local0.actionId .. " but we received actionId: " .. f12_local1 .. ".\n" )
			error( "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			return 
		elseif f12_local0.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING and (not f12_local0.canceled or f12_local0.canceled == false) then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. f12_arg1 .. " event for non-running action queue head: " .. f12_local0.name .. ", actionId: " .. f12_local0.actionId .. ".\n" )
			error( "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			return 
		end
		f12_local0.state = f12_arg0
		f12_local0.retData = f12_arg2
	end
end

Lobby.ProcessQueue.Success = function ( f13_arg0 )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.SUCCESS, "success", f13_arg0 )
end

Lobby.ProcessQueue.Failure = function ( f14_arg0 )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.FAILURE, "failure", f14_arg0 )
end

Lobby.ProcessQueue.Error = function ( f15_arg0 )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.ERROR, "error", f15_arg0 )
end

Lobby.ProcessQueue.Update = function ( f16_arg0 )
	local f16_local0 = Lobby.ProcessQueue.queue.head
	local f16_local1 = f16_arg0.actionId
	if f16_local1 == -1 then
		return 
	elseif f16_local0 == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received an update but the action queue is empty. actionId: " .. f16_local1 .. ".\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Lobby.ProcessQueue.Update. Head:" .. f16_local0.name .. ", actionId: " .. f16_local0.actionId .. ".\n" )
		if f16_local0.actionId ~= f16_local1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: mismatched update. Head: " .. f16_local0.name .. " was at actionId: " .. f16_local0.actionId .. " but we received actionId: " .. f16_local1 .. ".\n" )
		end
		if f16_local0.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received a update for non-running action queue head: " .. f16_local0.name .. ", actionId: " .. f16_local0.actionId .. ".\n" )
		end
		if f16_local0.updateFuncPtr == nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received a update for an action at head that doesn't have a head:updateFuncPtr() defined. Head: " .. f16_local0.name .. ", actionId: " .. f16_local0.actionId .. "\n" )
		end
		f16_local0:updateFuncPtr( f16_arg0 )
	end
end

Lobby.ProcessQueue.Init()
