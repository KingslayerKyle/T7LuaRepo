CoD.Zombie = {}
CoD.ZombieUtility = {}
CoD.Zombie.PlayerColors = {}
CoD.Zombie.TeamPlayerCount = 8
CoD.Zombie.PlayerColors[1] = {
	r = 1,
	g = 1,
	b = 1,
	a = 1
}
CoD.Zombie.PlayerColors[2] = {
	r = 0.49,
	g = 0.81,
	b = 0.93,
	a = 1
}
CoD.Zombie.PlayerColors[3] = {
	r = 0.96,
	g = 0.79,
	b = 0.31,
	a = 1
}
CoD.Zombie.PlayerColors[4] = {
	r = 0.51,
	g = 0.93,
	b = 0.53,
	a = 1
}
CoD.Zombie.GAMETYPE_ZCLASSIC = "zclassic"
CoD.Zombie.GAMETYPE_ZSTANDARD = "zstandard"
CoD.Zombie.GAMETYPE_ZGRIEF = "zgrief"
CoD.Zombie.GAMETYPE_ZCLEANSED = "zcleansed"
CoD.Zombie.GAMETYPE_ZMEAT = "zmeat"
CoD.Zombie.GAMETYPE_ZNML = "znml"
CoD.Zombie.GameTypes = {}
CoD.Zombie.GameTypes[1] = CoD.Zombie.GAMETYPE_ZCLASSIC
CoD.Zombie.GameTypes[2] = CoD.Zombie.GAMETYPE_ZSTANDARD
CoD.Zombie.GameTypes[3] = CoD.Zombie.GAMETYPE_ZGRIEF
CoD.Zombie.GameTypes[4] = CoD.Zombie.GAMETYPE_ZCLEANSED
CoD.Zombie.GameTypes[5] = CoD.Zombie.GAMETYPE_ZMEAT
CoD.Zombie.GameTypes[6] = CoD.Zombie.GAMETYPE_ZNML
CoD.Zombie.GAMETYPEGROUP_ZCLASSIC = "zclassic"
CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL = "zsurvival"
CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER = "zencounter"
CoD.Zombie.GameTypeGroups = {}
CoD.Zombie.GameTypeGroups[CoD.Zombie.GAMETYPE_ZCLASSIC] = {
	maxPlayers = 4,
	minPlayers = 1,
	maxLocalPlayers = 2,
	maxLocalSplitScreenPlayers = 4
}
CoD.Zombie.GameTypeGroups[CoD.Zombie.GAMETYPE_ZSTANDARD] = {
	maxPlayers = 4,
	minPlayers = 1,
	maxLocalPlayers = 2,
	maxLocalSplitScreenPlayers = 4
}
CoD.Zombie.GameTypeGroups[CoD.Zombie.GAMETYPE_ZGRIEF] = {
	maxPlayers = 8,
	minPlayers = 2,
	maxLocalPlayers = 2,
	maxLocalSplitScreenPlayers = 4,
	maxTeamPlayers = 4,
	minTeamPlayers = 1
}
CoD.Zombie.GameTypeGroups[CoD.Zombie.GAMETYPE_ZCLEANSED] = {
	maxPlayers = 4,
	minPlayers = 2,
	maxLocalPlayers = 2,
	maxLocalSplitScreenPlayers = 4,
	maxTeamPlayers = 1,
	minTeamPlayers = 1
}
CoD.Zombie.GameTypeGroups[CoD.Zombie.GAMETYPE_ZMEAT] = {
	maxPlayers = 8,
	minPlayers = 2,
	maxLocalPlayers = 2,
	maxLocalSplitScreenPlayers = 4,
	maxTeamPlayers = 4,
	minTeamPlayers = 1
}
CoD.Zombie.GameTypeGroups[CoD.Zombie.GAMETYPE_ZNML] = {
	maxPlayers = 8,
	minPlayers = 1,
	maxLocalPlayers = 2,
	maxLocalSplitScreenPlayers = 4,
	maxTeamPlayers = 4,
	minTeamPlayers = 1
}
CoD.Zombie.START_LOCATION_TRANSIT = "transit"
CoD.Zombie.START_LOCATION_FARM = "farm"
CoD.Zombie.START_LOCATION_TOWN = "town"
CoD.Zombie.START_LOCATION_DINER = "diner"
CoD.Zombie.START_LOCATION_TUNNEL = "tunnel"
CoD.Zombie.MAP_ZM_TRANSIT = "zm_transit"
CoD.Zombie.MAP_ZM_NUKED = "zm_nuked"
CoD.Zombie.MAP_ZM_HIGHRISE = "zm_highrise"
CoD.Zombie.MAP_ZM_TRANSIT_DR = "zm_transit_dr"
CoD.Zombie.MAP_ZM_TRANSIT_TM = "zm_transit_tm"
CoD.Zombie.MAP_ZM_PRISON = "zm_prison"
CoD.Zombie.MAP_ZM_BURIED = "zm_buried"
CoD.Zombie.MAP_ZM_TOMB = "zm_tomb"
CoD.Zombie.MAP_ZM_FACTORY = "zm_factory"
CoD.Zombie.MAP_ZM_ZOD = "zm_zod"
CoD.Zombie.Maps = {}
CoD.Zombie.Maps[1] = CoD.Zombie.MAP_ZM_TRANSIT
CoD.Zombie.Maps[2] = CoD.Zombie.MAP_ZM_NUKED
CoD.Zombie.Maps[3] = CoD.Zombie.MAP_ZM_HIGHRISE
CoD.Zombie.Maps[4] = CoD.Zombie.MAP_ZM_PRISON
CoD.Zombie.Maps[5] = CoD.Zombie.MAP_ZM_BURIED
CoD.Zombie.Maps[6] = CoD.Zombie.MAP_ZM_TOMB
CoD.Zombie.Maps[7] = CoD.Zombie.MAP_ZM_ZOD
CoD.Zombie.Maps[8] = CoD.Zombie.MAP_ZM_FACTORY
CoD.Zombie.DLC0Maps = {
	CoD.Zombie.MAP_ZM_NUKED
}
CoD.Zombie.DLC1Maps = {
	CoD.Zombie.MAP_ZM_HIGHRISE
}
CoD.Zombie.DLC2Maps = {
	CoD.Zombie.MAP_ZM_PRISON
}
CoD.Zombie.DLC3Maps = {
	CoD.Zombie.MAP_ZM_BURIED
}
CoD.Zombie.DLC4Maps = {
	CoD.Zombie.MAP_ZM_TOMB
}
CoD.Zombie.AllDLCMaps = {
	CoD.Zombie.MAP_ZM_NUKED,
	CoD.Zombie.MAP_ZM_HIGHRISE,
	CoD.Zombie.MAP_ZM_PRISON,
	CoD.Zombie.MAP_ZM_BURIED,
	CoD.Zombie.MAP_ZM_TOMB
}
CoD.Zombie.SideQuestMaps = {
	CoD.Zombie.MAP_ZM_TRANSIT,
	CoD.Zombie.MAP_ZM_HIGHRISE,
	CoD.Zombie.MAP_ZM_BURIED,
	CoD.Zombie.MAP_ZM_ZOD
}
CoD.Zombie.CharacterNameDisplayMaps = {
	CoD.Zombie.MAP_ZM_PRISON,
	CoD.Zombie.MAP_ZM_BURIED,
	CoD.Zombie.MAP_ZM_TOMB,
	CoD.Zombie.MAP_ZM_ZOD,
	CoD.Zombie.MAP_ZM_FACTORY
}
CoD.Zombie.PlayListCurrentSuperCategoryIndex = nil
CoD.Zombie.miniGameDisabled = true
CoD.Zombie.ZOD_CRAFTABLE_RITUAL_NONE_ENUM = 0
CoD.Zombie.ZOD_CRAFTABLE_RITUAL_BOXER_ENUM = 1
CoD.Zombie.ZOD_CRAFTABLE_RITUAL_DETECTIVE_ENUM = 2
CoD.Zombie.ZOD_CRAFTABLE_RITUAL_FEMME_ENUM = 3
CoD.Zombie.ZOD_CRAFTABLE_RITUAL_MAGICIAN_ENUM = 4
CoD.Zombie.ZOD_CRAFTABLE_RITUAL_BITS = 3
CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_NONE = 0
CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_DEMPSEY = 1
CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_NIKOLAI = 2
CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_RICHTOFEN = 3
CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_TAKEO = 4
CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE = "holder_of_"
CoD.Zombie.CLIENTFIELD_CHECK_BASE = "check_"
CoD.Zombie.MEMENTO_SUFFIX = "_memento"
CoD.Zombie.ZOD_CRAFTABLE_IDGUN = "idgun"
CoD.Zombie.ZOD_CRAFTABLE_PIECE_IDGUN_HEART = "part_heart"
CoD.Zombie.ZOD_CRAFTABLE_PIECE_IDGUN_SKELETON = "part_skeleton"
CoD.Zombie.ZOD_CRAFTABLE_PIECE_IDGUN_XENOMATTER = "part_xenomatter"
CoD.Zombie.ZOD_CRAFTABLE_SECOND_IDGUN = "second_idgun"
CoD.Zombie.ZOD_CRAFTABLE_PIECE_SECOND_IDGUN_HEART = "part_heart"
CoD.Zombie.ZOD_CRAFTABLE_PIECE_SECOND_IDGUN_SKELETON = "part_skeleton"
CoD.Zombie.ZOD_CRAFTABLE_PIECE_SECOND_IDGUN_XENOMATTER = "part_xenomatter"
CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX = "police_box"
CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX_FUSE_1 = "fuse_01"
CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX_FUSE_2 = "fuse_02"
CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX_FUSE_3 = "fuse_03"
CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY = "piece_riotshield_dolly"
CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR = "piece_riotshield_door"
CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP = "piece_riotshield_clamp"
CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY = "quest_key"
CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE = "quest_state_"
CoD.Zombie.CLIENTFIELD_QUEST_OWNER_BASE = "quest_owner_"
CoD.Zombie.CLIENTFIELD_WIDGET_QUEST_BASE = "widget_weap_quest_"
CoD.Zombie.ZOD_NAME_BOXER = "boxer"
CoD.Zombie.ZOD_NAME_DETECTIVE = "detective"
CoD.Zombie.ZOD_NAME_FEMME = "femme"
CoD.Zombie.ZOD_NAME_MAGICIAN = "magician"
CoD.Zombie.ZOD_NAME_PAP = "pap"
CoD.Zombie.CASTLE_NAME_DEMON = "demon"
CoD.Zombie.CASTLE_NAME_RUNE = "rune"
CoD.Zombie.CASTLE_NAME_STORM = "storm"
CoD.Zombie.CASTLE_NAME_WOLF = "wolf"
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_MEMENTO = 0
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO = 1
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_MEMENTO = 2
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_RELIC = 3
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_RELIC = 4
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_RELIC = 5
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_COUNT = 6
CoD.Zombie.USED_QUEST_KEY = "used_quest_key"
CoD.Zombie.USED_QUEST_KEY_LOCATION = "used_quest_key_location"
CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE = 0
CoD.Zombie.PLAYER_USED_QUEST_KEY_ZOD_NAME_BOXER = 1
CoD.Zombie.PLAYER_USED_QUEST_KEY_ZOD_NAME_DETECTIVE = 2
CoD.Zombie.PLAYER_USED_QUEST_KEY_ZOD_NAME_FEMME = 3
CoD.Zombie.PLAYER_USED_QUEST_KEY_ZOD_NAME_MAGICIAN = 4
CoD.Zombie.PLAYER_USED_QUEST_KEY_ZOD_NAME_PAP = 5
CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES = 6
CoD.Zombie.POD_SPRAYER_HINT_RANGE = "pod_sprayer_hint_range"
CoD.Zombie.POD_SPRAYER_HELD = "pod_sprayer_held"
CoD.Zombie.PLAYER_CHARACTER_IDENTITY = "player_character_identity"
CoD.Zombie.PLAYER_USING_SPRAYER = "player_using_sprayer"
CoD.Zombie.PLAYER_CRAFTED_FUSEBOX = "player_crafted_fusebox"
CoD.Zombie.PLAYER_CRAFTED_SHIELD = "player_crafted_shield"
CoD.Zombie.PLAYER_CRAFTED_IDGUN = "player_crafted_idgun"
CoD.Zombie.PLAYER_CRAFTED_GRAVITYSPIKES = "player_crafted_gravityspikes"
CoD.Zombie.WIDGET_QUEST_ITEMS = "widget_quest_items"
CoD.Zombie.WIDGET_IDGUN_PARTS = "widget_idgun_parts"
CoD.Zombie.WIDGET_ROCKETSHIELD_PARTS = "widget_shield_parts"
CoD.Zombie.WIDGET_FUSES = "widget_fuses"
CoD.Zombie.WIDGET_EGG = "widget_egg"
CoD.Zombie.WIDGET_SPRAYER = "widget_sprayer"
CoD.Zombie.WIDGET_GRAVITYSPIKE_PARTS = "widget_gravityspike_parts"
CoD.Zombie.PLAYER_SWORD_QUEST_EGG_STATE = "player_sword_quest_egg_state"
CoD.Zombie.PLAYER_SWORD_QUEST_COMPLETED_LEVEL_1 = "player_sword_quest_completed_level_1"
CoD.Zombie.CRAFTABLE_GRAVITYSPIKE = "gravityspike"
CoD.Zombie.CRAFTABLE_PART_GRAVITYSPIKE_BODY = "part_body"
CoD.Zombie.CRAFTABLE_PART_GRAVITYSPIKE_GUARDS = "part_guards"
CoD.Zombie.CRAFTABLE_PART_GRAVITYSPIKE_HANDLE = "part_handle"
CoD.Zombie.BOW_NAME_ICE = "ice"
CoD.Zombie.BOW_NAME_FIRE = "fire"
CoD.Zombie.BOW_NAME_WIND = "wind"
CoD.Zombie.BOW_NAME_LIGHTNING = "lightning"
CoD.Zombie.CRAFTABLE_BUCKET = "bucket"
CoD.Zombie.CRAFTABLE_BUCKET_SEED_1 = "seed_01"
CoD.Zombie.CRAFTABLE_BUCKET_SEED_2 = "seed_02"
CoD.Zombie.CRAFTABLE_BUCKET_SEED_3 = "seed_03"
CoD.Zombie.WIDGET_BUCKET_PARTS = "widget_bucket_parts"
CoD.Zombie.CRAFTABLE_GASMASK = "gaskmask"
CoD.Zombie.CRAFTABLE_PART_GASMASK_MASK = "part_visor"
CoD.Zombie.CRAFTABLE_PART_GASMASK_TUBE = "part_strap"
CoD.Zombie.CRAFTABLE_PART_GASMASK_CANISTER = "part_filter"
CoD.Zombie.WIDGET_GASMASK_PARTS = "widget_gasmask_parts"
CoD.Zombie.CRAFTABLE_MACHINETOOLS = "part_lever"
CoD.Zombie.CRAFTABLE_PART_MACHINETOOLS_WHEEL = "valveone"
CoD.Zombie.CRAFTABLE_PART_MACHINETOOLS_WRENCH = "valvetwo"
CoD.Zombie.CRAFTABLE_PART_MACHINETOOLS_GAUGE = "valvethree"
CoD.Zombie.WIDGET_MACHINETOOLS_PARTS = "widget_machinetools_parts"
CoD.Zombie.CRAFTABLE_WONDERWEAPON = "wonderweapon"
CoD.Zombie.CRAFTABLE_PART_WONDERWEAPON_TUBE = "part_wwi"
CoD.Zombie.CRAFTABLE_PART_WONDERWEAPON_FLASK = "part_wwii"
CoD.Zombie.CRAFTABLE_PART_WONDERWEAPON_PLANT = "part_wwiii"
CoD.Zombie.WIDGET_WONDERWEAPON_PARTS = "widget_wonderweapon_parts"
CoD.Zombie.UI_EGG_STATE_MISSING = 0
CoD.Zombie.UI_EGG_STATE_ACQUIRED = 1
CoD.Zombie.UI_EGG_STATE_1_CHARGE = 2
CoD.Zombie.UI_EGG_STATE_2_CHARGES = 3
CoD.Zombie.UI_EGG_STATE_3_CHARGES = 4
CoD.Zombie.UI_EGG_STATE_4_CHARGES = 5
CoD.Zombie.UI_EGG_STATE_IN_USE = 6
CoD.Zombie.UI_EGG_STATES = 7
CoD.Zombie.SingleTeamColor = {
	r = 0,
	g = 0.5,
	b = 1
}
CoD.Zombie.FullScreenSize = {
	w = 1280,
	h = 720,
	sw = 960
}
CoD.Zombie.SplitscreenMultiplier = 1.2
CoD.Zombie.OpenMenuEventMenuNames = {}
CoD.Zombie.OpenMenuEventMenuNames.PublicGameLobby = 1
CoD.Zombie.OpenMenuEventMenuNames.PrivateOnlineGameLobby = 1
CoD.Zombie.OpenMenuEventMenuNames.MainLobby = 1
CoD.Zombie.OpenMenuSelfMenuNames = {}
CoD.Zombie.OpenMenuSelfMenuNames.PublicGameLobby = 1
CoD.Zombie.OpenMenuSelfMenuNames.PrivateOnlineGameLobby = 1
CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH = "solomatch"
CoD.Zombie.GetUIMapName = function ()
	local mapRef = Engine.GetDvarString( "ui_mapname" )
	return CoD.Zombie.GetMapName( mapRef )
end

CoD.Zombie.GetMapName = function ( mapRef )
	if mapRef == nil or mapRef == "" or string.find( mapRef, CoD.Zombie.MAP_ZM_TRANSIT ) ~= nil then
		mapRef = CoD.Zombie.MAP_ZM_TRANSIT
	end
	return mapRef
end

CoD.Zombie.GetDefaultGameTypeForMap = function ()
	local gametype = CoD.Zombie.GAMETYPE_ZCLASSIC
	return gametype
end

CoD.Zombie.GetDefaultGameTypeGroupForMap = function ()
	local gametypegroup = CoD.Zombie.GAMETYPEGROUP_ZCLASSIC
	return gametypegroup
end

CoD.Zombie.IsDLCMap = function ( dlcTable )
	local mapName = Dvar.ui_mapname:get()
	if mapName then
		if not dlcTable then
			dlcTable = CoD.Zombie.AllDLCMaps
		end
		for i = 1, #dlcTable, 1 do
			if mapName == dlcTable[i] then
				return true
			end
		end
	end
	return false
end

CoD.Zombie.IsSideQuestMap = function ( mapName )
	if not mapName then
		mapName = Dvar.ui_mapname:get()
	end
	if mapName then
		for i = 1, #CoD.Zombie.SideQuestMaps, 1 do
			if mapName == CoD.Zombie.SideQuestMaps[i] then
				return true
			end
		end
	end
	return false
end

CoD.Zombie.IsCharacterNameDisplayMap = function ( mapName )
	if not mapName then
		mapName = Dvar.ui_mapname:get()
	end
	if mapName then
		for i = 1, #CoD.Zombie.CharacterNameDisplayMaps, 1 do
			if mapName == CoD.Zombie.CharacterNameDisplayMaps[i] then
				return true
			end
		end
	end
	return false
end

CoD.Zombie.ColorRichtofen = function ( self, time )
	self:beginAnimation( "color_rich", time )
	self:setRGB( CoD.Zombie.SideQuestStoryLine[1].color.r, CoD.Zombie.SideQuestStoryLine[1].color.g, CoD.Zombie.SideQuestStoryLine[1].color.b )
end

CoD.Zombie.ColorMaxis = function ( self, time )
	self:beginAnimation( "color_maxis", time )
	self:setRGB( CoD.Zombie.SideQuestStoryLine[2].color.r, CoD.Zombie.SideQuestStoryLine[2].color.g, CoD.Zombie.SideQuestStoryLine[2].color.b )
end

local playerBlue = {
	r = 0.35,
	g = 0.63,
	b = 0.9
}
CoD.Zombie.SideQuestStoryLine = {}
CoD.Zombie.SideQuestStoryLine[1] = {
	name = "Richtofen",
	color = playerBlue,
	colorFunction = CoD.Zombie.ColorRichtofen
}
CoD.Zombie.SideQuestStoryLine[2] = {
	name = "Maxis",
	color = ColorSet.Orange,
	colorFunction = CoD.Zombie.ColorMaxis
}
CoD.PlaylistCategoryFilter = nil
CoD.Zombie.InitInventoryUIModels = function ( controller )
	local currentMapId = Engine.GetCurrentMap()
	local perControllerModel = Engine.GetModelForController( controller )
	if currentMapId == "zm_castle" then
		CoD.Zombie.InventoryIcon = "t7_icon_inventory_dlc_fuse_small"
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_GRAVITYSPIKE .. "_" .. CoD.Zombie.CRAFTABLE_PART_GRAVITYSPIKE_BODY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_GRAVITYSPIKE .. "_" .. CoD.Zombie.CRAFTABLE_PART_GRAVITYSPIKE_GUARDS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_GRAVITYSPIKE .. "_" .. CoD.Zombie.CRAFTABLE_PART_GRAVITYSPIKE_HANDLE ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory.widget_gravityspike_parts" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.PLAYER_USING_SPRAYER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_SPRAYER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_FUSES ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_QUEST_ITEMS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.PLAYER_CHARACTER_IDENTITY ), 0 )
		for _, item in ipairs( {
			CoD.Zombie.CASTLE_NAME_DEMON,
			CoD.Zombie.CASTLE_NAME_RUNE,
			CoD.Zombie.CASTLE_NAME_STORM,
			CoD.Zombie.CASTLE_NAME_WOLF
		} ) do
			Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. item ), 0 )
			Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_OWNER_BASE .. item ), 0 )
			Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_WIDGET_QUEST_BASE .. item ), 0 )
		end
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.USED_QUEST_KEY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.USED_QUEST_KEY_LOCATION ), 0 )
		for clientIndex = 0, Dvar.com_maxclients:get() - 1, 1 do
			Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory.player" .. clientIndex .. "hasItem" ), 0 )
		end
	elseif currentMapId == "zm_island" then
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_BUCKET_PARTS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_SEED_1 ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_SEED_2 ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_SEED_3 ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_ROCKETSHIELD_PARTS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_GASMASK .. "_" .. CoD.Zombie.CRAFTABLE_PART_GASMASK_MASK ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_GASMASK .. "_" .. CoD.Zombie.CRAFTABLE_PART_GASMASK_TUBE ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_GASMASK .. "_" .. CoD.Zombie.CRAFTABLE_PART_GASMASK_CANISTER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_GASMASK_PARTS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_PART_MACHINETOOLS_WHEEL .. "_" .. CoD.Zombie.CRAFTABLE_MACHINETOOLS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_PART_MACHINETOOLS_WRENCH .. "_" .. CoD.Zombie.CRAFTABLE_MACHINETOOLS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_PART_MACHINETOOLS_GAUGE .. "_" .. CoD.Zombie.CRAFTABLE_MACHINETOOLS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_MACHINETOOLS_PARTS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_WONDERWEAPON .. "_" .. CoD.Zombie.CRAFTABLE_PART_WONDERWEAPON_TUBE ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_WONDERWEAPON .. "_" .. CoD.Zombie.CRAFTABLE_PART_WONDERWEAPON_FLASK ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.CRAFTABLE_WONDERWEAPON .. "_" .. CoD.Zombie.CRAFTABLE_PART_WONDERWEAPON_PLANT ), 0 )
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "zmInventory." .. CoD.Zombie.WIDGET_WONDERWEAPON_PARTS ), 0 )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_PIECE_IDGUN_HEART ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_PIECE_IDGUN_SKELETON ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_PIECE_IDGUN_XENOMATTER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_SECOND_IDGUN .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_PIECE_SECOND_IDGUN_HEART ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_SECOND_IDGUN .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_PIECE_SECOND_IDGUN_SKELETON ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_SECOND_IDGUN .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_PIECE_SECOND_IDGUN_XENOMATTER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX_FUSE_1 ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX_FUSE_2 ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX_FUSE_3 ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOLLY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_DOOR ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CRAFTABLE_PIECE_RIOTSHIELD_CLAMP ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie.ZOD_NAME_BOXER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie.ZOD_NAME_DETECTIVE ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie.ZOD_NAME_FEMME ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie.ZOD_NAME_MAGICIAN ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie.ZOD_NAME_PAP ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie.ZOD_NAME_BOXER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie.ZOD_NAME_DETECTIVE ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie.ZOD_NAME_FEMME ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie.ZOD_NAME_MAGICIAN ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie.ZOD_NAME_PAP ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie.ZOD_NAME_BOXER .. CoD.Zombie.MEMENTO_SUFFIX ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie.ZOD_NAME_DETECTIVE .. CoD.Zombie.MEMENTO_SUFFIX ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie.ZOD_NAME_FEMME .. CoD.Zombie.MEMENTO_SUFFIX ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie.ZOD_NAME_MAGICIAN .. CoD.Zombie.MEMENTO_SUFFIX ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY_LOCATION ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HINT_RANGE ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HELD ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_USING_SPRAYER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_CHARACTER_IDENTITY ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_CRAFTED_FUSEBOX ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_CRAFTED_SHIELD ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_CRAFTED_IDGUN ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_CRAFTED_GRAVITYSPIKES ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.WIDGET_QUEST_ITEMS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.WIDGET_IDGUN_PARTS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.WIDGET_ROCKETSHIELD_PARTS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.WIDGET_FUSES ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.WIDGET_EGG ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.WIDGET_SPRAYER ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.WIDGET_GRAVITYSPIKE_PARTS ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_EGG_STATE ), 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_COMPLETED_LEVEL_1 ), 0 )
	end
end

CoD.Zombie.CommonPreLoadHud = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.CreateModel( perControllerModel, "bgb_current" )
	Engine.CreateModel( perControllerModel, "bgb_display" )
	Engine.CreateModel( perControllerModel, "bgb_timer" )
	Engine.CreateModel( perControllerModel, "bgb_activations_remaining" )
	Engine.CreateModel( perControllerModel, "bgb_invalid_use" )
	Engine.CreateModel( perControllerModel, "bgb_one_shot_use" )
	Engine.CreateModel( perControllerModel, "zmhud.swordEnergy" )
	Engine.CreateModel( perControllerModel, "zmhud.swordState" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "fastRestart" ), function ( model )
		CoD.Zombie.InitInventoryUIModels( controller )
	end )
end

CoD.Zombie.CommonPostLoadHud = function ( self, controller, menu )
	local worldIndicatorModel = DataSources.WorldSpaceIndicators.getModel( controller )
	CoD.TacticalModeUtility.CreateShooterSpottedWidgets( self, controller )
	if worldIndicatorModel then
		local connectionChangeHandler = function ( bleedOutContainer )
			local bleedOutItem = bleedOutContainer:getFirstChild()
			while bleedOutItem do
				if LUI.startswith( bleedOutItem.id, "bleedOutItem" ) then
					local playerNameModel = bleedOutItem:getModel( controller, "playerName" )
					if playerNameModel then
						Engine.SetModelValue( playerNameModel, Engine.GetGamertagForClient( controller, bleedOutItem.bleedOutClient ) )
					end
				end
				bleedOutItem = bleedOutItem:getNextSibling()
			end
		end
		
		local bleedOutClient = 0
		local needAnother = true
		while needAnother do
			local bleedOutModel = Engine.CreateModel( worldIndicatorModel, "bleedOutModel" .. bleedOutClient )
			local playerNameModel = Engine.CreateModel( bleedOutModel, "playerName" )
			Engine.SetModelValue( playerNameModel, Engine.GetGamertagForClient( controller, bleedOutClient ) )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "prompt" ), "ZMUI_REVIVE" )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "clockPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "bleedOutPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "stateFlags" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "arrowAngle" ), 0 )
			local bleedOutItem = CoD.ZM_Revive.new( self, controller )
			bleedOutItem.bleedOutClient = bleedOutClient
			bleedOutItem.id = "bleedOutItem" .. bleedOutClient
			bleedOutItem:setLeftRight( true, false, 0, 0 )
			bleedOutItem:setTopBottom( true, false, 0, 0 )
			bleedOutItem:setModel( bleedOutModel )
			needAnother = bleedOutItem:setupBleedOutWidget( controller, bleedOutClient )
			bleedOutItem:processEvent( {
				name = "update_state",
				menu = self
			} )
			self.fullscreenContainer:addElement( bleedOutItem )
			self.fullscreenContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerConnected" ), function ( model )
				connectionChangeHandler( self.fullscreenContainer )
			end )
			bleedOutClient = bleedOutClient + 1
		end
	end
	self.m_inputDisabled = true
	if LUI.DEV ~= nil then
		if LUI.DEVHideButtonPrompts then
			self.CursorHint:setAlpha( 0 )
		end
		self:registerEventHandler( "hide_button_prompts", function ( self, event )
			self.CursorHint:setAlpha( event.show and 1 or 0 )
		end )
	end
end

CoD.Zombie.GetCharacterEnumString = function ( enumValue )
	if enumValue == 0 then
		return "ZOD_CRAFTABLE_RITUAL_NONE_ENUM"
	elseif enumValue == 1 then
		return "ZOD_CRAFTABLE_RITUAL_BOXER_ENUM"
	elseif enumValue == 2 then
		return "ZOD_CRAFTABLE_RITUAL_DETECTIVE_ENUM"
	elseif enumValue == 3 then
		return "ZOD_CRAFTABLE_RITUAL_FEMME_ENUM"
	elseif enumValue == 4 then
		return "ZOD_CRAFTABLE_RITUAL_MAGICIAN_ENUM"
	else
		
	end
end

CoD.ZombieUtility.PowerUps = {}
CoD.ZombieUtility.PowerUps.STATE_OFF = 0
CoD.ZombieUtility.PowerUps.STATE_ON = 1
CoD.ZombieUtility.PowerUps.STATE_FLASHING_OFF = 2
CoD.ZombieUtility.PowerUps.STATE_FLASHING_ON = 3
CoD.ZombieUtility.PowerUps.ClientFieldNames = {}
CoD.ZombieUtility.PowerUps.ClientFieldNames[1] = {
	clientFieldName = "powerup_instant_kill",
	image = "specialty_instakill_zombies"
}
CoD.ZombieUtility.PowerUps.ClientFieldNames[2] = {
	clientFieldName = "powerup_double_points",
	image = "specialty_2x_zombies"
}
CoD.ZombieUtility.PowerUps.ClientFieldNames[3] = {
	clientFieldName = "powerup_fire_sale",
	image = "specialty_firesale_zombies"
}
CoD.ZombieUtility.PowerUps.ClientFieldNames[4] = {
	clientFieldName = "powerup_mini_gun",
	image = "t7_hud_zm_powerup_deathmachine"
}
DataSources.PowerUps = {
	prepare = function ( controller, list, filter )
		list.model = Engine.CreateModel( Engine.GetModelForController( controller ), "ZMPowerUps" )
		if not list.eventHandlersRegistered then
			local getListIndex = function ( clientFieldName )
				for i, clientField in ipairs( CoD.ZombieUtility.PowerUps.ClientFieldNames ) do
					if clientField.clientFieldName == clientFieldName then
						return i
					end
				end
				return 0
			end
			
			local updatePowerUp = function ( self, event )
				list.clientFieldStates[event.name] = event.newValue
				local index = getListIndex( event.name )
				if index > 0 then
					list.models[index].state:set( event.newValue )
				end
				list:updateDataSource()
			end
			
			list.eventHandlersRegistered = true
			list.clientFieldStates = {}
			list.models = {}
			for i, clientField in ipairs( CoD.ZombieUtility.PowerUps.ClientFieldNames ) do
				list:registerEventHandler( clientField.clientFieldName, updatePowerUp )
				list.models[i] = Engine.CreateModel( list.model, i )
				list.clientFieldStates[clientField.clientFieldName] = CoD.ZombieUtility.PowerUps.STATE_OFF
				local f18_local3 = list.models[i]:create( "image" )
				f18_local3:set( clientField.image )
				f18_local3 = list.models[i]:create( "state" )
				f18_local3:set( CoD.ZombieUtility.PowerUps.STATE_OFF )
			end
		end
	end,
	getCount = function ( list )
		local count = 0
		for _, clientField in ipairs( CoD.ZombieUtility.PowerUps.ClientFieldNames ) do
			if list.clientFieldStates[clientField.clientFieldName] ~= CoD.ZombieUtility.PowerUps.STATE_OFF then
				count = count + 1
			end
		end
		return count
	end,
	getItem = function ( controller, list, index )
		local count = 0
		for i, clientField in ipairs( CoD.ZombieUtility.PowerUps.ClientFieldNames ) do
			if list.clientFieldStates[clientField.clientFieldName] ~= CoD.ZombieUtility.PowerUps.STATE_OFF and count + 1 == index then
				return list.models[i]
			end
		end
		return nil
	end
}
