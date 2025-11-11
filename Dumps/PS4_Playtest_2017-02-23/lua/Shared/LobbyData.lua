require( "lua.Shared.LuaDefine" )
require( "lua.Shared.LuaEnum" )
require( "lua.Shared.LuaUtils" )

local lobbyData = {}
local menusIndexTable = {}
local sounds = {
	Action = "action",
	LobbyClosed = "uin_lobby_closed",
	ClientsAddedToLobby = "uin_lobby_enter",
	ClientsRemovedFromLobby = "uin_lobby_exit",
	TimerTick = "uin_timer",
	ESportsTimerTick = "uin_timer_esports_beep",
	ESportsTimerTickLast = "uin_timer_esports_last_beep"
}
lobbyData.InitMenusIndexTable = function ()
	menusIndexTable = {}
	local lobbyMenus = Engine.GetAssetList( "lobbymenulist" )
	for index, menu in pairs( lobbyMenus ) do
		menusIndexTable[menu.id] = menu.name
	end
end

lobbyData.InitMenusIndexTable()
lobbyData.InitLobbyNav = function ()
	local menuMain = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	local lobbyNav = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav", true )
	Engine.SetModelValue( lobbyNav, menuMain.id )
	local roomModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true )
	Engine.SetModelValue( roomModel, menuMain.room )
	if LUI then
		CoD.MetricsUtility.LobbyInit()
	end
end

lobbyData.GetLobbyNavModel = function ()
	return Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
end

lobbyData.GetLobbyNav = function ()
	local navModel = lobbyData.GetLobbyNavModel()
	return Engine.GetModelValue( navModel )
end

lobbyData.GetCurrentMenuTarget = function ()
	local currentMenuId = Engine.GetLobbyUIScreen()
	return LobbyData.GetLobbyMenuByID( currentMenuId )
end

lobbyData.GetLobbyMenuByName = function ( menuName )
	if menuName == "mode_select" then
		return {
			name = "mode_select",
			id = 9999
		}
	elseif menuName == "director" then
		return {
			name = "director",
			id = 9999
		}
	else
		return Engine.GetAssetInfo( menuName )
	end
end

lobbyData.GetLobbyMenuByID = function ( menuID )
	local menuName = menusIndexTable[menuID]
	if menuName == nil then
		return nil
	else
		return LobbyData.GetLobbyMenuByName( menuName )
	end
end

lobbyData.SetLobbyNav = function ( target )
	local navModel = lobbyData.GetLobbyNavModel()
	if not navModel then
		lobbyData.InitLobbyNav()
		navModel = lobbyData.GetLobbyNavModel()
	end
	local currentTargetID = Engine.GetModelValue( navModel )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyData.SetLobbyNav. From: " .. tostring( currentTargetID ) .. " To: " .. tostring( target.id ) .. "\n" )
	Engine.SetModelValue( navModel, target.id )
	local headingKickerModeModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local f8_local0 = Engine.SetModelValue
	local f8_local1 = headingKickerModeModel
	if target.kicker then
		local f8_local2 = target.kicker
		local f8_local3 = Engine.Localize( target.kicker )
	end
	f8_local0( f8_local1, f8_local2 and f8_local3 or "" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
end

lobbyData.PartyPrivacyToString = function ( enumValue )
	local privacy = "MENU_PARTY_PRIVACY_CLOSED"
	if enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		privacy = "MENU_PARTY_PRIVACY_OPEN"
	elseif enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		privacy = "MENU_PARTY_PRIVACY_FRIENDS_ONLY"
	elseif enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		privacy = "MENU_PARTY_PRIVACY_INVITE_ONLY"
	elseif enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		privacy = "MENU_PARTY_PRIVACY_CLOSED"
	end
	return Engine.Localize( privacy )
end

lobbyData.PS4SkuList = {
	{
		name = "SceaEnFr",
		langs = {
			"en",
			"fr"
		},
		region = 0
	},
	{
		name = "SceaMsEn",
		langs = {
			"ms",
			"en"
		},
		region = 0
	},
	{
		name = "SceaBpEn",
		langs = {
			"bp",
			"en",
			"tc",
			"sc"
		},
		region = 0
	},
	{
		name = "SceeEnFr",
		langs = {
			"en",
			"fr"
		},
		region = 1
	},
	{
		name = "SceeGeEn",
		langs = {
			"ge",
			"en"
		},
		region = 1
	},
	{
		name = "SceeSpIt",
		langs = {
			"es",
			"it"
		},
		region = 1
	},
	{
		name = "SceeRuPo",
		langs = {
			"ru",
			"po"
		},
		region = 1
	},
	{
		name = "SceeArEa",
		langs = {
			"ar",
			"ea"
		},
		region = 1
	},
	{
		name = "ScejFjJa",
		langs = {
			"fj",
			"ja"
		},
		region = 2
	}
}
lobbyData.XBOXSkuList = {
	{
		name = "XboxEnFr",
		langs = {
			"en",
			"fr"
		},
		region = 0
	},
	{
		name = "XboxMsEn",
		langs = {
			"ms",
			"en"
		},
		region = 0
	},
	{
		name = "XboxBpEn",
		langs = {
			"bp",
			"en",
			"tc",
			"sc"
		},
		region = 0
	},
	{
		name = "XboxGeEn",
		langs = {
			"ge",
			"en"
		},
		region = 0
	},
	{
		name = "XboxSpIt",
		langs = {
			"es",
			"it"
		},
		region = 0
	},
	{
		name = "XboxRuPo",
		langs = {
			"ru",
			"po"
		},
		region = 0
	},
	{
		name = "XboxArEa",
		langs = {
			"ar",
			"ea"
		},
		region = 0
	},
	{
		name = "XboxFjJa",
		langs = {
			"fj",
			"ja"
		},
		region = 0
	},
	{
		name = "XboxInvalid",
		langs = {
			"en",
			"fr",
			"it",
			"de",
			"pt",
			"pl",
			"ru",
			"ja",
			"es",
			"zm"
		},
		region = 0
	}
}
for i, sku in ipairs( lobbyData.PS4SkuList ) do
	table.sort( sku.langs )
end
for i, sku in ipairs( lobbyData.XBOXSkuList ) do
	table.sort( sku.langs )
end
lobbyData.ButtonStates_ReevaluateDisabledState = function ()
	local model = Engine.GetModel( Engine.GetGlobalModel(), "ButtonStates.ReevaluateDisabledStates" )
	if model then
		local modelValue = Engine.GetModelValue( model )
		local newModelValue = not modelValue
		Engine.SetModelValue( model, newModelValue )
	end
end

lobbyData.Sounds = LuaReadOnlyTables.ReadOnlyTable( sounds )
LobbyData = LuaReadOnlyTables.ReadOnlyTable( lobbyData )
