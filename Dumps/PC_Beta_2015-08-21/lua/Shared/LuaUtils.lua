require( "lua.Shared.LuaReadOnlyTables" )
require( "lua.Shared.LobbyData" )

local f0_local0 = {
	Gunsmith = {},
	isPS4 = Engine.GetCurrentPlatform() == "orbis",
	isXbox = Engine.GetCurrentPlatform() == "durango",
	isPC = Engine.GetCurrentPlatform() == "pc",
	MessageDialogForceSubscriptionFire = function ()
		local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if f1_local0 == nil then
			return 
		else
			local f1_local1 = Engine.CreateModel( f1_local0, "messagePending" )
			local f1_local2 = Engine.GetModelValue( f1_local1 )
			if f1_local2 == 0 then
				return 
			else
				Engine.SetModelValue( f1_local1, f1_local2 + 1 )
			end
		end
	end,
	ShowMessageDialog = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		if f2_arg2 == nil then
			error( "Invalid message dialog message" )
			return 
		end
		local f2_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if f2_local0 == nil then
			return 
		end
		local f2_local1 = Engine.CreateModel( f2_local0, "messagePending" )
		local f2_local2 = Engine.CreateModel( f2_local0, "messageType" )
		local f2_local3 = Engine.CreateModel( f2_local0, "message" )
		local f2_local4 = Engine.CreateModel( f2_local0, "controller" )
		local f2_local5 = Engine.CreateModel( f2_local0, "anyControllerAllowed" )
		if f2_local1 == nil or f2_local2 == nil or f2_local3 == nil or f2_local4 == nil or f2_local5 == nil then
			return 
		end
		local f2_local6 = Engine.GetModelValue( f2_local1 ) + 1
		Engine.SetModelValue( f2_local2, f2_arg1 )
		Engine.SetModelValue( f2_local3, f2_arg2 )
		Engine.SetModelValue( f2_local1, f2_local6 )
		Engine.SetModelValue( f2_local4, 0 )
		Engine.SetModelValue( f2_local5, true )
		if f2_arg3 ~= nil then
			Engine.SetModelValue( Engine.CreateModel( f2_local0, "messageTitle" ), f2_arg3 )
		end
	end,
	UI_ShowInfoMessageDialog = function ( f3_arg0, f3_arg1, f3_arg2 )
		if f3_arg1 ~= nil then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowInfoMessageDialog: (" .. f3_arg1 .. ") - " .. Engine.Localize( f3_arg1 ) .. ".\n" )
		end
		f0_local0.ShowMessageDialog( f3_arg0, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO, f3_arg1, f3_arg2 )
	end,
	UI_ShowWarningMessageDialog = function ( f4_arg0, f4_arg1, f4_arg2 )
		if f4_arg1 ~= nil then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowWarningMessageDialog: (" .. f4_arg1 .. ") - " .. Engine.Localize( f4_arg1 ) .. ".\n" )
		end
		f0_local0.ShowMessageDialog( f4_arg0, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING, f4_arg1, f4_arg2 )
	end,
	UI_ShowErrorMessageDialog = function ( f5_arg0, f5_arg1, f5_arg2 )
		if f5_arg1 ~= nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowErrorMessageDialog: (" .. f5_arg1 .. ") - " .. Engine.Localize( f5_arg1 ) .. ".\n" )
		end
		f0_local0.ShowMessageDialog( f5_arg0, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR, f5_arg1, f5_arg2 )
	end,
	UI_ClearErrorMessageDialog = function ()
		local f6_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if f6_local0 ~= nil then
			local f6_local1 = Engine.GetModel( f6_local0, "messagePending" )
			if f6_local1 ~= nil and Engine.GetModelValue( f6_local1 ) > 0 then
				Engine.SetModelValue( f6_local1, 0 )
			end
			local f6_local2 = Engine.GetModel( f6_local0, "messageTitle" )
			if f6_local2 ~= nil then
				Engine.SetModelValue( f6_local2, "" )
			end
		end
	end,
	LogQoS = function ( f7_arg0, f7_arg1 )
		local f7_local0 = Engine.milliseconds()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS log: " .. f7_arg0 .. ", timestamp: " .. f7_local0 .. ".\n" )
		Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, "_timestamp", f7_local0 )
		Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, f7_arg0, f7_arg1 )
	end,
	FlushQoS = function ()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS flushing.\n" )
		Engine.FlushKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS )
	end
}
f0_local0.Gunsmith.InitializeBuffer = function ( f9_arg0 )
	local f9_local0 = #f9_arg0.variant
	for f9_local1 = 0, f9_local0 - 1, 1 do
		local f9_local4 = f9_arg0.variant[f9_local1]
		f9_local4.variantIndex:set( f9_local1 )
		f9_local4.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f9_local4.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

f0_local0.IsCPZMTarget = function ( f10_arg0 )
	if LobbyData.UITargets.UI_CP2LOBBYONLINE.id <= f10_arg0 and f10_arg0 <= LobbyData.UITargets.UI_CP2LOBBYLANGAME.id then
		return true
	else
		return false
	end
end

f0_local0.StartsWith = function ( f11_arg0, f11_arg1 )
	return string.sub( f11_arg0, 1, string.len( f11_arg1 ) ) == f11_arg1
end

f0_local0.EndsWith = function ( f12_arg0, f12_arg1 )
	return string.sub( f12_arg0, -string.len( f12_arg1 ) ) == f12_arg1
end

f0_local0.ForceLobbyButtonUpdate = function ()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" ) )
end

f0_local0.IsGamescomBuild = function ()
	if Dvar.ui_execdemo_gamescom:get() then
		return true
	elseif Dvar.ui_execdemo_gamescom_host:exists() and Dvar.ui_execdemo_gamescom_host:get() then
		return true
	else
		return false
	end
end

f0_local0.IsBetaBuild = function ()
	if Dvar.ui_execdemo_beta:get() then
		return true
	else
		return false
	end
end

LuaUtils = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
