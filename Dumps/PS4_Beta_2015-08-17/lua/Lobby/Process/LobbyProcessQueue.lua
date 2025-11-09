Lobby.ProcessQueue = {}
Lobby.ProcessQueue.ACTIONSTATE = {
	PENDING = 0,
	RUNNING = 1,
	SUCCESS = 2,
	FAILURE = 3,
	ERROR = 4
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

Lobby.ProcessQueue.ReplaceWith = function ( action )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Lobby.ProcessQueue.queue.processName .. "', Replacing '" .. Lobby.ProcessQueue.queue.head.name .. "' with '" .. action.name .. "' in process queue.\n" )
	action.state = Lobby.ProcessQueue.ACTIONSTATE.PENDING
	Lobby.ProcessQueue.queue.head = action
end

Lobby.ProcessQueue.CreateInterrupt = function ( action, interrupt )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Lobby.ProcessQueue.queue.processName .. "', Replacing '" .. Lobby.ProcessQueue.queue.head.name .. "' with '" .. action.name .. "' in process queue.\n" )
	local process = interrupt:createFuncPtr( action )
	return process.head
end

Lobby.ProcessQueue.Init = function ()
	Lobby.ProcessQueue.ClearQueue()
end

Lobby.ProcessQueue.IsQueueEmpty = function ()
	local head = Lobby.ProcessQueue.queue.head
	if head ~= nil then
		return false
	else
		return true
	end
end

Lobby.ProcessQueue.GetQueueHead = function ()
	return Lobby.ProcessQueue.queue.head
end

Lobby.ProcessQueue.SetCancellable = function ( cancellable )
	Lobby.ProcessQueue.queue.cancellable = cancellable
end

Lobby.ProcessQueue.GetCurrentRunningProcessName = function ()
	if Lobby.ProcessQueue.queue == nil or Lobby.ProcessQueue.queue.processName == nil then
		return ""
	else
		return Lobby.ProcessQueue.queue.processName
	end
end

Lobby.ProcessQueue.AddToQueue = function ( processName, process )
	if Lobby.ProcessQueue.IsQueueEmpty() then
		Lobby.ProcessQueue.ClearQueue()
		process.head.state = Lobby.ProcessQueue.ACTIONSTATE.PENDING
		Lobby.ProcessQueue.queue.processName = processName
		Lobby.ProcessQueue.queue.history = process.head
		Lobby.ProcessQueue.queue.head = process.head
		Lobby.ProcessQueue.queue.interrupt = process.interrupt
		Lobby.ProcessQueue.queue.cancellable = process.cancellable
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE START****************\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process: '" .. processName .. "', head action: '" .. process.head.name .. "' to queue.\n" )
	elseif Lobby.ProcessQueue.queue.cancellable == true or process.force == true then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE CHANGE****************\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process '" .. processName .. "' when process '" .. Lobby.ProcessQueue.queue.processName .. "' is currently running.\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Will finish process '" .. Lobby.ProcessQueue.queue.processName .. "' current running action '" .. Lobby.ProcessQueue.queue.head.name .. "', then proceed with process '" .. processName .. "'.\n" )
		local data = {
			runningProcess = Lobby.ProcessQueue.queue.processName,
			newProcess = processName
		}
		LuaUtils.LogQoS( "lobby_queue", data )
		LuaUtils.FlushQoS()
		Lobby.ProcessQueue.queue.processName = processName
		Lobby.ProcessQueue.queue.history = process.head
		Lobby.Process.ForceAction( Lobby.ProcessQueue.queue.head, process.head )
		Lobby.ProcessQueue.queue.interrupt = process.interrupt
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
	local head = Lobby.ProcessQueue.queue.head
	while head ~= nil do
		if head.state == Lobby.ProcessQueue.ACTIONSTATE.PENDING then
			head.state = Lobby.ProcessQueue.ACTIONSTATE.RUNNING
			head.actionId = Lobby.ProcessQueue.actionId
			head.startTime = Engine.milliseconds()
			Lobby.ProcessQueue.actionId = Lobby.ProcessQueue.actionId + 1
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Executing '" .. head.name .. "' [ID:" .. head.actionId .. "]...\n" )
			if head.startFuncPtr ~= nil then
				head:startFuncPtr()
			end
			if head.state == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] is asynchronous.\n" )
			end
		end
		if head.state == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			if head.pumpFuncPtr ~= nil then
				head:pumpFuncPtr()
			end
			return 
		end
		local next = nil
		local timeSpent = -1
		if head.startTime ~= nil then
			timeSpent = Engine.milliseconds() - head.startTime
		end
		if head.endFuncPtr ~= nil then
			head:endFuncPtr()
		end
		if head.state == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed successfully in " .. timeSpent .. "ms.\n" )
			next = head.success
			if head.success ~= nil and head.success.isInterrupt == true then
				next = Lobby.ProcessQueue.CreateInterrupt( head, head.success )
			else
				next = head.success
			end
		elseif head.state == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed with failure in " .. timeSpent .. "ms.\n" )
			if head.failure ~= nil and head.failure.isInterrupt == true then
				next = Lobby.ProcessQueue.CreateInterrupt( head, head.failure )
			else
				next = head.failure
			end
		elseif head.state == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed with error in " .. timeSpent .. "ms.\n" )
			if head.error ~= nil and head.error.isInterrupt == true then
				next = Lobby.ProcessQueue.CreateInterrupt( head, head.error )
			else
				next = head.error
			end
		end
		if next ~= nil then
			Lobby.ProcessQueue.ReplaceWith( next )
		else
			Lobby.ProcessQueue.ClearQueue()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Process tree complete.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE END****************\n" )
		end
		head = Lobby.ProcessQueue.queue.head
	end
end

Lobby.ProcessQueue.CompleteEvent = function ( completeState, completeStateTxt, data )
	local head = Lobby.ProcessQueue.queue.head
	local actionId = data.actionId
	if actionId == -1 then
		return 
	elseif head == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. completeStateTxt .. " event but the action queue is empty. actionId: " .. actionId .. ".\n" )
	else
		local message = "LobbyAction: task completed " .. completeStateTxt .. " event. Head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n"
		if completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, message )
		elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "***********************************************************************\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, message )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "***********************************************************************\n" )
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, message )
		end
		if head.actionId ~= actionId then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: mismatched task completed " .. completeStateTxt .. " event. Head: " .. head.name .. " was at actionId: " .. head.actionId .. " but we received actionId: " .. actionId .. ".\n" )
			error( "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			return 
		elseif head.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING and (not head.canceled or head.canceled == false) then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. completeStateTxt .. " event for non-running action queue head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
			error( "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			return 
		end
		head.state = completeState
		head.retData = data
	end
end

Lobby.ProcessQueue.Success = function ( data )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.SUCCESS, "success", data )
end

Lobby.ProcessQueue.Failure = function ( data )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.FAILURE, "failure", data )
end

Lobby.ProcessQueue.Error = function ( data )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.ERROR, "error", data )
end

Lobby.ProcessQueue.Update = function ( data )
	local head = Lobby.ProcessQueue.queue.head
	local actionId = data.actionId
	if actionId == -1 then
		return 
	elseif head == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received an update but the action queue is empty. actionId: " .. actionId .. ".\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Lobby.ProcessQueue.Update. Head:" .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
		if head.actionId ~= actionId then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: mismatched update. Head: " .. head.name .. " was at actionId: " .. head.actionId .. " but we received actionId: " .. actionId .. ".\n" )
		end
		if head.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received a update for non-running action queue head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
		end
		if head.updateFuncPtr == nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received a update for an action at head that doesn't have a head:updateFuncPtr() defined. Head: " .. head.name .. ", actionId: " .. head.actionId .. "\n" )
		end
		head:updateFuncPtr( data )
	end
end

Lobby.ProcessQueue.Init()
