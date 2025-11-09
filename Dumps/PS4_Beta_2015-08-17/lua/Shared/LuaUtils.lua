require( "lua.Shared.LuaReadOnlyTables" )
require( "lua.Shared.LobbyData" )

local utils = {
	Gunsmith = {},
	MessageDialogForceSubscriptionFire = function ()
		local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if messageDialogModel == nil then
			return 
		else
			local messagePendingModel = Engine.CreateModel( messageDialogModel, "messagePending" )
			local messagePending = Engine.GetModelValue( messagePendingModel )
			if messagePending == 0 then
				return 
			else
				Engine.SetModelValue( messagePendingModel, messagePending + 1 )
			end
		end
	end,
	ShowMessageDialog = function ( controller, messageType, message, title )
		if message == nil then
			error( "Invalid message dialog message" )
			return 
		end
		local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if messageDialogModel == nil then
			return 
		end
		local messagePendingModel = Engine.CreateModel( messageDialogModel, "messagePending" )
		local messageTypeModel = Engine.CreateModel( messageDialogModel, "messageType" )
		local messageModel = Engine.CreateModel( messageDialogModel, "message" )
		local messageControllerModel = Engine.CreateModel( messageDialogModel, "controller" )
		local anyControllerAllowedModel = Engine.CreateModel( messageDialogModel, "anyControllerAllowed" )
		if messagePendingModel == nil or messageTypeModel == nil or messageModel == nil or messageControllerModel == nil or anyControllerAllowedModel == nil then
			return 
		end
		local messagePending = Engine.GetModelValue( messagePendingModel )
		messagePending = messagePending + 1
		Engine.SetModelValue( messageTypeModel, messageType )
		Engine.SetModelValue( messageModel, message )
		Engine.SetModelValue( messagePendingModel, messagePending )
		Engine.SetModelValue( messageControllerModel, 0 )
		Engine.SetModelValue( anyControllerAllowedModel, true )
		if title ~= nil then
			local messageTitleModel = Engine.CreateModel( messageDialogModel, "messageTitle" )
			Engine.SetModelValue( messageTitleModel, title )
		end
	end,
	UI_ShowInfoMessageDialog = function ( controller, message, title )
		if message ~= nil then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowInfoMessageDialog: (" .. message .. ") - " .. Engine.Localize( message ) .. ".\n" )
		end
		utils.ShowMessageDialog( controller, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO, message, title )
	end,
	UI_ShowWarningMessageDialog = function ( controller, message, title )
		if message ~= nil then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowWarningMessageDialog: (" .. message .. ") - " .. Engine.Localize( message ) .. ".\n" )
		end
		utils.ShowMessageDialog( controller, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING, message, title )
	end,
	UI_ShowErrorMessageDialog = function ( controller, message, title )
		if message ~= nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowErrorMessageDialog: (" .. message .. ") - " .. Engine.Localize( message ) .. ".\n" )
		end
		utils.ShowMessageDialog( controller, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR, message, title )
	end,
	UI_ClearErrorMessageDialog = function ()
		local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if messageDialogModel ~= nil then
			local messagePendingModel = Engine.GetModel( messageDialogModel, "messagePending" )
			if messagePendingModel ~= nil and Engine.GetModelValue( messagePendingModel ) > 0 then
				Engine.SetModelValue( messagePendingModel, 0 )
			end
			local messageTitleModel = Engine.GetModel( messageDialogModel, "messageTitle" )
			if messageTitleModel ~= nil then
				Engine.SetModelValue( messageTitleModel, "" )
			end
		end
	end,
	LogQoS = function ( name, data )
		local timestamp = Engine.milliseconds()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS log: " .. name .. ", timestamp: " .. timestamp .. ".\n" )
		Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, "_timestamp", timestamp )
		Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, name, data )
	end,
	FlushQoS = function ()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS flushing.\n" )
		Engine.FlushKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS )
	end
}
utils.Gunsmith.InitializeBuffer = function ( rootState )
	local totalVariants = #rootState.variant
	for index = 0, totalVariants - 1, 1 do
		local variantState = rootState.variant[index]
		variantState.variantIndex:set( index )
		variantState.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		variantState.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

utils.IsCPZMTarget = function ( toTargetId )
	if LobbyData.UITargets.UI_CP2LOBBYONLINE.id <= toTargetId and toTargetId <= LobbyData.UITargets.UI_CP2LOBBYLANGAME.id then
		return true
	else
		return false
	end
end

utils.StartsWith = function ( str, start )
	return string.sub( str, 1, string.len( start ) ) == start
end

utils.EndsWith = function ( str, endStr )
	return string.sub( str, -string.len( endStr ) ) == endStr
end

utils.ForceLobbyButtonUpdate = function ()
	local buttonupdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
	Engine.ForceNotifyModelSubscriptions( buttonupdateModel )
end

utils.IsGamescomBuild = function ()
	if Dvar.ui_execdemo_gamescom:get() then
		return true
	elseif Dvar.ui_execdemo_gamescom_host:exists() and Dvar.ui_execdemo_gamescom_host:get() then
		return true
	else
		return false
	end
end

utils.IsBetaBuild = function ()
	if Dvar.ui_execdemo_beta:get() then
		return true
	else
		return false
	end
end

LuaUtils = LuaReadOnlyTables.ReadOnlyTable( utils )
