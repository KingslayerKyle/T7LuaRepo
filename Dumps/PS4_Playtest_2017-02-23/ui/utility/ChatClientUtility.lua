CoD.ChatClientUtility = {}
CoD.ChatClientUtility.Properties = {}
CoD.ChatClientUtility.GetChannelFromString = function ( stringArg )
	local channel = nil
	if stringArg ~= nil then
		if stringArg == "All" then
			channel = Enum.chatChannel_e.CHAT_CHANNEL_ALL
		elseif stringArg == "Team" then
			channel = Enum.chatChannel_e.CHAT_CHANNEL_TEAM
		elseif stringArg == "Party" then
			channel = Enum.chatChannel_e.CHAT_CHANNEL_PARTY
		end
		if channel ~= nil and channel ~= "" then
			return channel
		end
	end
end

CoD.ChatClientUtility.ChannelStringGet = function ( channel )
	return Engine.ChatClient_ChannelStringGet( channel )
end

CoD.ChatClientUtility.GetChatClientGlobalModel = function ()
	local chatClientRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "ChatClientGlobal" )
	return chatClientRootModel
end

CoD.ChatClientUtility.GetUpdateModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "update" )
	return model
end

CoD.ChatClientUtility.GetChatEntriesListModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "ChatClientEntriesList" )
	return model
end

CoD.ChatClientUtility.GetInputChannelModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputChannel" )
	return model
end

CoD.ChatClientUtility.GetFilterChannelModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "filterChannel" )
	return model
end

CoD.ChatClientUtility.GetInputTextModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputText" )
	return model
end

CoD.ChatClientUtility.GetInputChannelTextModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputChannelText" )
	return model
end

CoD.ChatClientUtility.GetInputChannelColorModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "inputChannelColor" )
	return model
end

CoD.ChatClientUtility.GetAllChannelModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "allChannel" )
	return model
end

CoD.ChatClientUtility.GetTeamChannelColorModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "teamChannelColor" )
	return model
end

CoD.ChatClientUtility.GetPartyChannelColorModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "partyChannelColor" )
	return model
end

CoD.ChatClientUtility.GetMenuInputChannelShowModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "menuInputChannelShow" )
	return model
end

CoD.ChatClientUtility.GetMenuSettingsShowModel = function ()
	local model = Engine.CreateModel( CoD.ChatClientUtility.GetChatClientGlobalModel(), "menuSettingsShow" )
	return model
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

CoD.ChatClientUtility.ResetFilterChannelModels = function ( controller )
	local model = CoD.ChatClientUtility.GetChatClientGlobalModel()
	local filterChannelModel = nil
	filterChannelModel = Engine.CreateModel( model, "allChannel" )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "type" ), Enum.chatChannel_e.CHAT_CHANNEL_ALL )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "checked" ), Engine.ChatClient_FilterChannelGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_ALL ) > 0 )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "color" ), Engine.ChatClient_ChannelColorGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_ALL ) )
	filterChannelModel = Engine.CreateModel( model, "teamChannel" )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "type" ), Enum.chatChannel_e.CHAT_CHANNEL_TEAM )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "checked" ), Engine.ChatClient_FilterChannelGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_TEAM ) > 0 )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "color" ), Engine.ChatClient_ChannelColorGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_TEAM ) )
	filterChannelModel = Engine.CreateModel( model, "partyChannel" )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "type" ), Enum.chatChannel_e.CHAT_CHANNEL_PARTY )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "checked" ), Engine.ChatClient_FilterChannelGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_PARTY ) > 0 )
	Engine.SetModelValue( Engine.CreateModel( filterChannelModel, "color" ), Engine.ChatClient_ChannelColorGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_PARTY ) )
end

CoD.ChatClientUtility.ResetSettingsModels = function ( controller )
	local model = CoD.ChatClientUtility.GetChatClientGlobalModel()
	local settingsModel = nil
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( model, "showTimestamps" ), "checked" ), Engine.ChatClient_ShowTimestampsGet( controller ) )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( model, "showChannel" ), "checked" ), Engine.ChatClient_ShowChannelGet( controller ) )
end

CoD.ChatClientUtility.ResetAllModels = function ( controller )
	local model = CoD.ChatClientUtility.GetChatClientGlobalModel()
	local inputChannel = Engine.ChatClient_InputChannelGet( controller )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelModel(), inputChannel )
	Engine.SetModelValue( CoD.ChatClientUtility.GetFilterChannelModel(), Engine.ChatClient_FilterChannelGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_COUNT ) )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
	local channelColor = Engine.ChatClient_ChannelColorGet( controller, inputChannel )
	Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), channelColor )
	CoD.ChatClientUtility.ResetMenuShow()
	CoD.ChatClientUtility.ResetFilterChannelModels( controller )
	CoD.ChatClientUtility.ResetSettingsModels( controller )
	return model
end

CoD.ChatClientUtility.UpdateOptionsModels = function ( controller )
	Engine.SetModelValue( CoD.ChatClientUtility.GetFilterChannelModel(), Engine.ChatClient_FilterChannelGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_COUNT ) )
	CoD.ChatClientUtility.ResetMenuShow()
	CoD.ChatClientUtility.ResetFilterChannelModels( controller )
	CoD.ChatClientUtility.ResetSettingsModels( controller )
	Engine.Exec( controller, "chatClientUpdate" )
end

