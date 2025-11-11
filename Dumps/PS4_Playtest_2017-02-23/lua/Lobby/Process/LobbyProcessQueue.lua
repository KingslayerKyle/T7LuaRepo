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

Lobby.ProcessQueue.SetQueueEmptyModel = function ( queueEmpty )
	local lobbyRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot", true )
	local queueEmptyModel = Engine.CreateModel( lobbyRootModel, "queueEmpty", true )
	Engine.SetModelValue( queueEmptyModel, queueEmpty )
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
	Lobby.ProcessQueue.TaskHistory = {}
end

Lobby.ProcessQueue.IsQueueEmpty = function ()
	local head = Lobby.ProcessQueue.queue.head
	if head ~= nil then
		return false
	else
		return true
	end
end

Lobby.ProcessQueue.CopyProcess = function ( origProcess )
	local origProcessType = type( origProcess )
	local copyProcess = nil
	if origProcessType == "table" then
		copyProcess = {}
		local f7_local0 = next
		local f7_local1 = origProcess
		local f7_local2 = nil
		goto basicblock_6:
		local origProcessKey, origProcessValue = f7_local0( f7_local1, f7_local2 )
		while origProcessKey ~= nil do
			f7_local2 = origProcessKey
			if origProcessKey ~= "parent" then
				copyProcess[Lobby.ProcessQueue.CopyProcess( origProcessKey )] = Lobby.ProcessQueue.CopyProcess( origProcessValue )
			else
				copyProcess = origProcess
			end
		end
		setmetatable( copyProcess, Lobby.ProcessQueue.CopyProcess( getmetatable( origProcess ) ) )
	else
		copyProcess = origProcess
	end
	return copyProcess
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
	if process == nil then
		LuaUtils.LogQoS( "addtoqueue_nil", processName )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
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
	local head = Lobby.ProcessQueue.queue.head
	while head ~= nil do
		if head.state == Lobby.ProcessQueue.ACTIONSTATE.PENDING or head.state == Lobby.ProcessQueue.ACTIONSTATE.THROTTLED then
			if not Lobby.ProcessQueue.TaskHistory[head.name] then
				Lobby.ProcessQueue.TaskHistory[head.name] = {}
				Lobby.ProcessQueue.TaskHistory[head.name].count = 0
				Lobby.ProcessQueue.TaskHistory[head.name].lastRunTime = 0
			end
			if Lobby.ProcessQueue.TaskHistory[head.name].lastRunTime > 0 and head.throttle ~= nil and head.throttle > 0 then
				local currentTime = Engine.milliseconds()
				if currentTime < Lobby.ProcessQueue.TaskHistory[head.name].lastRunTime + head.throttle then
					if head.state == Lobby.ProcessQueue.ACTIONSTATE.PENDING then
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Throttling '" .. head.name .. "' [ID:" .. Lobby.ProcessQueue.actionId .. " for: " .. tostring( Lobby.ProcessQueue.TaskHistory[head.name].lastRunTime + head.throttle - currentTime ) .. " ms ]...\n" )
						head.state = Lobby.ProcessQueue.ACTIONSTATE.THROTTLED
					end
					return 
				end
			end
			head.state = Lobby.ProcessQueue.ACTIONSTATE.RUNNING
			head.actionId = Lobby.ProcessQueue.actionId
			head.startTime = Engine.milliseconds()
			Lobby.ProcessQueue.actionId = Lobby.ProcessQueue.actionId + 1
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Executing '" .. head.name .. "' [ID:" .. head.actionId .. "]...\n" )
			Lobby.Debug.AddDebugAction( head )
			if head.startFuncPtr ~= nil then
				head:startFuncPtr()
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] is asynchronous.\n" )
			Lobby.ProcessQueue.TaskHistory[head.name].count = Lobby.ProcessQueue.TaskHistory[head.name].count + 1
			Lobby.ProcessQueue.TaskHistory[head.name].lastRunTime = head.startTime
		end
		if head.state == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			if head.pumpFuncPtr ~= nil then
				head:pumpFuncPtr()
			end
			Lobby.Debug.UpdateProcessQueue()
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
			Lobby.Debug.UpdateProcessQueue()
		elseif head.state == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed with failure in " .. timeSpent .. "ms.\n" )
			if head.failure ~= nil and head.failure.isInterrupt == true then
				next = Lobby.ProcessQueue.CreateInterrupt( head, head.failure )
			else
				next = head.failure
			end
			Lobby.Debug.UpdateProcessQueue()
		elseif head.state == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed with error in " .. timeSpent .. "ms.\n" )
			if head.error ~= nil and head.error.isInterrupt == true then
				next = Lobby.ProcessQueue.CreateInterrupt( head, head.error )
			else
				next = head.error
			end
			Lobby.Debug.UpdateProcessQueue()
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
	if actionId <= Lobby.ProcessQueue.INVALID_ACTION_ID then
		Lobby.ProcessQueue.ProcessEvent( actionId, completeState, data )
		return 
	elseif head == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. completeStateTxt .. " event but the action queue is empty. actionId: " .. actionId .. ".\n" )
	else
		local message = "LobbyAction: task completed " .. completeStateTxt .. " event. Head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n"
		if completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYVM, message )
		elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "***********************************************************************\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, message )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "***********************************************************************\n" )
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, message )
		end
		if head.actionId ~= actionId then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "^6LobbyAction: mismatched task completed " .. completeStateTxt .. " event. Head: " .. head.name .. " was at actionId: " .. head.actionId .. " but we received actionId: " .. actionId .. ".\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			if Engine.IsShipBuild() == false then
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "Lobby process queue error occurred, please email your logs to codcoreonline@treyarch.com" )
			else
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, Engine.Localize( "EXE_LOBBY_PROCESS_QUEUE_ERROR", LuaUtils.ValueToHex( LuaEnum.ERROR_CODE.TASK_MISMATCHED ) ) )
			end
			return 
		elseif head.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING and (not head.canceled or head.canceled == false) then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "^6LobbyAction: received a task completed " .. completeStateTxt .. " event for non-running action queue head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			if Engine.IsShipBuild() == false then
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "Lobby process queue error occurred, please email your logs to codcoreonline@treyarch.com" )
			else
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, Engine.Localize( "EXE_LOBBY_PROCESS_QUEUE_ERROR", LuaUtils.ValueToHex( LuaEnum.ERROR_CODE.NONRUNNING_TASK ) ) )
			end
			return 
		end
		head.state = completeState
		head.retData = data
	end
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Success = function ( data )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.SUCCESS, "success", data )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Failure = function ( data )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.FAILURE, "failure", data )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Error = function ( data )
	Lobby.ProcessQueue.CompleteEvent( Lobby.ProcessQueue.ACTIONSTATE.ERROR, "error", data )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.Update = function ( data )
	local head = Lobby.ProcessQueue.queue.head
	local actionId = data.actionId
	if actionId <= Lobby.ProcessQueue.INVALID_ACTION_ID then
		Lobby.ProcessQueue.ProcessEvent( actionId, Lobby.ProcessQueue.ACTIONSTATE.UPDATE, data )
		return 
	elseif head == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: received an update but the action queue is empty. actionId: " .. actionId .. ".\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: Lobby.ProcessQueue.Update. Head:" .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
		if head.actionId ~= actionId then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: mismatched update. Head: " .. head.name .. " was at actionId: " .. head.actionId .. " but we received actionId: " .. actionId .. ".\n" )
		end
		if head.state ~= Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: received a update for non-running action queue head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
		end
		if head.updateFuncPtr == nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyAction: received a update for an action at head that doesn't have a head:updateFuncPtr() defined. Head: " .. head.name .. ", actionId: " .. head.actionId .. "\n" )
		end
		head:updateFuncPtr( data )
	end
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.ProcessQueue.eventHandlerActionId = Lobby.ProcessQueue.INVALID_ACTION_ID
Lobby.ProcessQueue.eventHandler = {}
Lobby.ProcessQueue.RegisterEventHandler = function ( callbackFunction, eventData )
	Lobby.ProcessQueue.eventHandlerActionId = Lobby.ProcessQueue.eventHandlerActionId + 1
	Lobby.ProcessQueue.eventHandler[Lobby.ProcessQueue.eventHandlerActionId] = {
		callbackFunction = callbackFunction,
		eventData = eventData
	}
	local actionId = Lobby.ProcessQueue.eventHandlerActionId * -1
	return actionId
end

Lobby.ProcessQueue.UnRegisterEventHandler = function ( actionId )
	if actionId == Lobby.ProcessQueue.INVALID_ACTION_ID then
		return false
	else
		actionId = math.abs( actionId )
		if Lobby.ProcessQueue.eventHandler[actionId] == nil then
			return false
		else
			Lobby.ProcessQueue.eventHandler[actionId] = nil
			return true
		end
	end
end

Lobby.ProcessQueue.ProcessEvent = function ( actionId, completeState, data )
	if actionId == Lobby.ProcessQueue.INVALID_ACTION_ID then
		return false
	else
		actionId = math.abs( actionId )
		if Lobby.ProcessQueue.eventHandler[actionId] == nil then
			return false
		elseif Lobby.ProcessQueue.eventHandler[actionId].callbackFunction( completeState, Lobby.ProcessQueue.eventHandler[actionId].eventData, data ) == false then
			return false
		else
			Lobby.ProcessQueue.eventHandler[actionId] = nil
			return true
		end
	end
end

