CoD.ChatClientUtility = {}
CoD.ChatClientUtility.Properties = {}
CoD.ChatClientUtility.GetChannelFromString = function ( f1_arg0 )
	local f1_local0 = nil
	if f1_arg0 ~= nil then
		if f1_arg0 == "All" then
			f1_local0 = Enum.chatChannel_e.CHAT_CHANNEL_ALL
		elseif f1_arg0 == "Team" then
			f1_local0 = Enum.chatChannel_e.CHAT_CHANNEL_TEAM
		elseif f1_arg0 == "Party" then
			f1_local0 = Enum.chatChannel_e.CHAT_CHANNEL_PARTY
		end
		if f1_local0 ~= nil and f1_local0 ~= "" then
			return f1_local0
		end
	end
end

CoD.ChatClientUtility.ChannelStringGet = function ( f2_arg0 )
	return Engine.ChatClient_ChannelStringGet( f2_arg0 )
end

CoD.ChatClientUtility.GetChatClientGlobalModel = function ()
	return Engine.CreateModel( Engine.GetGlobalModel(), "ChatClientGlobal" )
end

CoD.ChatClientUtility.GetUpdateModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "update" )
end

CoD.ChatClientUtility.GetChatEntriesListModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "ChatClientEntriesList" )
end

CoD.ChatClientUtility.GetInputChannelModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputChannel" )
end

CoD.ChatClientUtility.GetFilterChannelModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "filterChannel" )
end

CoD.ChatClientUtility.GetInputTextModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputText" )
end

CoD.ChatClientUtility.GetInputChannelTextModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputChannelText" )
end

CoD.ChatClientUtility.GetInputChannelColorModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputChannelColor" )
end

CoD.ChatClientUtility.GetAllChannelModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "allChannel" )
end

CoD.ChatClientUtility.GetTeamChannelColorModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "teamChannelColor" )
end

CoD.ChatClientUtility.GetPartyChannelColorModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "partyChannelColor" )
end

CoD.ChatClientUtility.GetMenuInputChannelShowModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "menuInputChannelShow" )
end

CoD.ChatClientUtility.GetMenuSettingsShowModel = function ()
	return Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "menuSettingsShow" )
end

CoD.ChatClientUtility.ResetInputChannelSelectorMenu = function ()
	Engine.SetModelValue( CoD.ChatClientUtility.GetMenuInputChannelShowModel(), 0 )
end

CoD.ChatClientUtility.ResetSettingsMenu = function ()
	Engine.SetModelValue( CoD.ChatClientUtility.GetMenuSettingsShowModel(), 0 )
end

CoD.ChatClientUtility.ResetMenuShow = function ()
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
	CoD.ChatClientUtility.ResetSettingsMenu()
end

CoD.ChatClientUtility.ResetFilterChannelModels = function ( f19_arg0 )
	local f19_local0 = CoD.ChatClientUtility.GetChatClientGlobalModel()
	local f19_local1 = nil
	f19_local1 = Engine.CreateModel( f19_local0, "allChannel" )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "type" ), Enum.chatChannel_e.CHAT_CHANNEL_ALL )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "checked" ), Engine.ChatClient_FilterChannelGet( f19_arg0, Enum.chatChannel_e.CHAT_CHANNEL_ALL ) > 0 )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "color" ), Engine.ChatClient_ChannelColorGet( f19_arg0, Enum.chatChannel_e.CHAT_CHANNEL_ALL ) )
	f19_local1 = Engine.CreateModel( f19_local0, "teamChannel" )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "type" ), Enum.chatChannel_e.CHAT_CHANNEL_TEAM )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "checked" ), Engine.ChatClient_FilterChannelGet( f19_arg0, Enum.chatChannel_e.CHAT_CHANNEL_TEAM ) > 0 )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "color" ), Engine.ChatClient_ChannelColorGet( f19_arg0, Enum.chatChannel_e.CHAT_CHANNEL_TEAM ) )
	f19_local1 = Engine.CreateModel( f19_local0, "partyChannel" )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "type" ), Enum.chatChannel_e.CHAT_CHANNEL_PARTY )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "checked" ), Engine.ChatClient_FilterChannelGet( f19_arg0, Enum.chatChannel_e.CHAT_CHANNEL_PARTY ) > 0 )
	Engine.SetModelValue( Engine.CreateModel( f19_local1, "color" ), Engine.ChatClient_ChannelColorGet( f19_arg0, Enum.chatChannel_e.CHAT_CHANNEL_PARTY ) )
end

CoD.ChatClientUtility.ResetSettingsModels = function ( f20_arg0 )
	local f20_local0 = CoD.ChatClientUtility.GetChatClientGlobalModel()
	local f20_local1 = nil
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( f20_local0, "showTimestamps" ), "checked" ), Engine.ChatClient_ShowTimestampsGet( f20_arg0 ) )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( f20_local0, "showChannel" ), "checked" ), Engine.ChatClient_ShowChannelGet( f20_arg0 ) )
end

CoD.ChatClientUtility.ResetAllModels = function ( f21_arg0 )
	local f21_local0 = CoD.ChatClientUtility.GetChatClientGlobalModel()
	local f21_local1 = Engine.ChatClient_InputChannelGet( f21_arg0 )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelModel(), f21_local1 )
	Engine.SetModelValue( CoD.ChatClientUtility.GetFilterChannelModel(), Engine.ChatClient_FilterChannelGet( f21_arg0, Enum.chatChannel_e.CHAT_CHANNEL_COUNT ) )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), Engine.ChatClient_ChannelColorGet( f21_arg0, f21_local1 ) )
	CoD.ChatClientUtility.ResetMenuShow()
	CoD.ChatClientUtility.ResetFilterChannelModels( f21_arg0 )
	CoD.ChatClientUtility.ResetSettingsModels( f21_arg0 )
	return f21_local0
end

