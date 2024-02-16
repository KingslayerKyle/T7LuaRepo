CoD.Zombie = {}
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
CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE = "holder_of_"
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
CoD.Zombie.ZOD_NAME_BOXER = "boxer"
CoD.Zombie.ZOD_NAME_DETECTIVE = "detective"
CoD.Zombie.ZOD_NAME_FEMME = "femme"
CoD.Zombie.ZOD_NAME_MAGICIAN = "magician"
CoD.Zombie.ZOD_NAME_PAP = "pap"
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_MEMENTO = 0
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_MEMENTO = 1
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_MEMENTO = 2
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_RELIC = 3
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_GOT_RELIC = 4
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_USED_RELIC = 5
CoD.Zombie.CLIENTFIELD_ZOD_UI_QUEST_STATE_COUNT = 6
CoD.Zombie.GameOptions = {
	{
		id = "zmDifficulty",
		name = "ZMUI_DIFFICULTY_CAPS",
		hintText = "ZMUI_DIFFICULTY_DESC",
		labels = {
			"ZMUI_DIFFICULTY_EASY_CAPS",
			"ZMUI_DIFFICULTY_NORMAL_CAPS"
		},
		values = {
			0,
			1
		},
		gameTypes = {
			CoD.Zombie.GAMETYPE_ZCLASSIC,
			CoD.Zombie.GAMETYPE_ZSTANDARD,
			CoD.Zombie.GAMETYPE_ZGRIEF
		}
	},
	{
		id = "startRound",
		name = "ZMUI_STARTING_ROUND_CAPS",
		hintText = "ZMUI_STARTING_ROUND_DESC",
		labels = {
			"1",
			"5",
			"10",
			"15",
			"20"
		},
		values = {
			1,
			5,
			10,
			15,
			20
		},
		gameTypes = {
			CoD.Zombie.GAMETYPE_ZSTANDARD,
			CoD.Zombie.GAMETYPE_ZGRIEF
		}
	},
	{
		id = "magic",
		name = "ZMUI_MAGIC_CAPS",
		hintText = "ZMUI_MAGIC_DESC",
		labels = {
			"MENU_ENABLED_CAPS",
			"MENU_DISABLED_CAPS"
		},
		values = {
			1,
			0
		},
		gameTypes = {
			CoD.Zombie.GAMETYPE_ZSTANDARD,
			CoD.Zombie.GAMETYPE_ZGRIEF
		}
	},
	{
		id = "headshotsonly",
		name = "ZMUI_HEADSHOTS_ONLY_CAPS",
		hintText = "ZMUI_HEADSHOTS_ONLY_DESC",
		labels = {
			"MENU_DISABLED_CAPS",
			"MENU_ENABLED_CAPS"
		},
		values = {
			0,
			1
		},
		gameTypes = {
			CoD.Zombie.GAMETYPE_ZSTANDARD,
			CoD.Zombie.GAMETYPE_ZGRIEF
		}
	},
	{
		id = "allowdogs",
		name = "ZMUI_DOGS_CAPS",
		hintText = "ZMUI_DOGS_DESC",
		labels = {
			"MENU_DISABLED_CAPS",
			"MENU_ENABLED_CAPS"
		},
		values = {
			0,
			1
		},
		gameTypes = {
			CoD.Zombie.GAMETYPE_ZSTANDARD
		},
		maps = {
			CoD.Zombie.MAP_ZM_TRANSIT
		}
	},
	{
		id = "cleansedLoadout",
		name = "ZMUI_CLEANSED_LOADOUT_CAPS",
		hintText = "ZMUI_CLEANSED_LOADOUT_DESC",
		labels = {
			"ZMUI_CLEANSED_LOADOUT_SHOTGUN_CAPS",
			"ZMUI_CLEANSED_LOADOUT_GUN_GAME_CAPS"
		},
		values = {
			0,
			1
		},
		gameTypes = {
			CoD.Zombie.GAMETYPE_ZCLEANSED
		}
	}
}
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
	local mapRef = Engine.DvarString( nil, "ui_mapname" )
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

CoD.Zombie.SideQuestStoryLine = {}
CoD.Zombie.SideQuestStoryLine[1] = {
	name = "Richtofen",
	color = CoD.playerBlue,
	colorFunction = CoD.Zombie.ColorRichtofen
}
CoD.Zombie.SideQuestStoryLine[2] = {
	name = "Maxis",
	color = CoD.BOIIOrange,
	colorFunction = CoD.Zombie.ColorMaxis
}
CoD.PlaylistCategoryFilter = nil
CoD.Zombie.InitInventoryUIModels = function ( controller )
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
end

