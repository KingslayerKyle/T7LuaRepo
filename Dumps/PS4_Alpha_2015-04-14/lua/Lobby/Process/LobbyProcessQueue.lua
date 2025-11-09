Lobby.ProcessQueue = {}
local ActionState = {
	PENDING = 0,
	RUNNING = 1,
	SUCCESS = 2,
	FAILURE = 3,
	ERROR = 4
}
local Queue = nil
local ActionId = 0
local QueueSize = 10
local ClearQueue = function ()
	Queue = {
		processName = "",
		head = nil,
		history = nil,
		interrupt = nil
	}
end

local ReplaceWith = function ( action )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Queue.processName .. "', Replacing '" .. Queue.head.name .. "' with '" .. action.name .. "' in process queue.\n" )
	action.state = ActionState.PENDING
	Queue.head = action
end

local CreateInterrupt = function ( action, interrupt )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Process: '" .. Queue.processName .. "', Replacing '" .. Queue.head.name .. "' with '" .. action.name .. "' in process queue.\n" )
	local process = interrupt:createFuncPtr( action )
	return process.head
end

Lobby.ProcessQueue.Init = function ()
	ClearQueue()
end

Lobby.ProcessQueue.IsQueueEmpty = function ()
	local head = Queue.head
	if head ~= nil then
		return false
	else
		return true
	end
end

Lobby.ProcessQueue.GetQueueHead = function ()
	return Queue.head
end

Lobby.ProcessQueue.GetCurrentRunningProcessName = function ()
	if Queue == nil or Queue.processName == nil then
		return ""
	else
		return Queue.processName
	end
end

Lobby.ProcessQueue.AddToQueue = function ( processName, process )
	if not Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE CHANGE****************\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process '" .. processName .. "' when process '" .. Queue.processName .. "' is currently running.\n" )
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Will finish process '" .. Queue.processName .. "' current running action '" .. Queue.head.name .. "', then proceed with process '" .. processName .. "'.\n" )
		Queue.processName = processName
		Queue.history = process.head
		Lobby.Process.ForceAction( Queue.head, process.head )
		Queue.interrupt = process.interrupt
		if Queue.head.cancelFuncPtr ~= nil then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Cancelling action: '" .. Queue.head.name .. "'.\n" )
			Queue.head:cancelFuncPtr()
		else
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "No cancel func (cancelFuncPtr) defined for action: '" .. Queue.head.name .. "'.\n" )
		end
	else
		ClearQueue()
		process.head.state = ActionState.PENDING
		Queue.processName = processName
		Queue.history = process.head
		Queue.head = process.head
		Queue.interrupt = process.interrupt
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE START****************\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyProcessQueue: Adding process: '" .. processName .. "', head action: '" .. process.head.name .. "' to queue.\n" )
	end
	Lobby.ProcessQueue.Pump()
end

Lobby.ProcessQueue.ErrorShutdown = function ()
	if Queue.head ~= nil and Queue.head.cancelFuncPtr ~= nil then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Cancelling action: '" .. Queue.head.name .. "'.\n" )
		Queue.head:cancelFuncPtr()
	end
	Engine.LuiVM_Event( "lobby_spinner_popup", {
		openPopup = false,
		actionId = -1
	} )
	ClearQueue()
end

Lobby.ProcessQueue.Pump = function ()
	local head = Queue.head
	while head ~= nil do
		if head.state == ActionState.PENDING then
			head.state = ActionState.RUNNING
			head.actionId = ActionId
			head.startTime = Engine.milliseconds()
			ActionId = ActionId + 1
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Executing '" .. head.name .. "' [ID:" .. head.actionId .. "]...\n" )
			if head.startFuncPtr ~= nil then
				head:startFuncPtr()
			end
			if head.state == ActionState.RUNNING then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] is asynchronous.\n" )
			end
		end
		if head.state == ActionState.RUNNING then
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
		if head.state == ActionState.SUCCESS then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed successfully in " .. timeSpent .. "ms.\n" )
			next = head.success
			if head.success ~= nil and head.success.isInterrupt == true then
				next = CreateInterrupt( head, head.success )
			else
				next = head.success
			end
		elseif head.state == ActionState.FAILURE then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed with failure in " .. timeSpent .. "ms.\n" )
			if head.failure ~= nil and head.failure.isInterrupt == true then
				next = CreateInterrupt( head, head.failure )
			else
				next = head.failure
			end
		elseif head.state == ActionState.ERROR then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: '" .. head.name .. "' [ID:" .. head.actionId .. "] completed with error in " .. timeSpent .. "ms.\n" )
			if head.error ~= nil and head.error.isInterrupt == true then
				next = CreateInterrupt( head, head.error )
			else
				next = head.error
			end
		end
		if next ~= nil then
			ReplaceWith( next )
		else
			ClearQueue()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Process tree complete.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "****************PROCESS QUEUE END****************\n" )
		end
		head = Queue.head
	end
end

local CompleteEvent = function ( completeState, completeStateTxt, data )
	local head = Queue.head
	local actionId = data.actionId
	if head == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. completeStateTxt .. " event but the action queue is empty. actionId: " .. actionId .. ".\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: task completed " .. completeStateTxt .. " event. Head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
		if head.actionId ~= actionId then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: mismatched task completed " .. completeStateTxt .. " event. Head: " .. head.name .. " was at actionId: " .. head.actionId .. " but we received actionId: " .. actionId .. ".\n" )
			error( "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			return 
		elseif head.state ~= ActionState.RUNNING then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "^6LobbyAction: received a task completed " .. completeStateTxt .. " event for non-running action queue head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
			error( "LOBBY VM ERROR: Please copy full log and email to codcoreonline@treyarch.com" )
			return 
		end
		head.state = completeState
		head.retData = data
	end
end

Lobby.ProcessQueue.Success = function ( data )
	CompleteEvent( ActionState.SUCCESS, "success", data )
end

Lobby.ProcessQueue.Failure = function ( data )
	CompleteEvent( ActionState.FAILURE, "failure", data )
end

Lobby.ProcessQueue.Error = function ( data )
	CompleteEvent( ActionState.ERROR, "error", data )
end

Lobby.ProcessQueue.Update = function ( data )
	local head = Queue.head
	local actionId = data.actionId
	if head == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received an update but the action queue is empty. actionId: " .. actionId .. ".\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: Lobby.ProcessQueue.Update. Head:" .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
		if head.actionId ~= actionId then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: mismatched update. Head: " .. head.name .. " was at actionId: " .. head.actionId .. " but we received actionId: " .. actionId .. ".\n" )
		end
		if head.state ~= ActionState.RUNNING then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received a update for non-running action queue head: " .. head.name .. ", actionId: " .. head.actionId .. ".\n" )
		end
		if head.updateFuncPtr == nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: received a update for an action at head that doesn't have a head:updateFuncPtr() defined. Head: " .. head.name .. ", actionId: " .. head.actionId .. "\n" )
		end
		head:updateFuncPtr( data )
	end
end

