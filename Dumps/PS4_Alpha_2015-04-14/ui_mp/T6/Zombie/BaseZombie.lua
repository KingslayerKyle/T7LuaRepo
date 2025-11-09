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
CoD.Zombie.IsSurvivalUsingCIAModel = nil
CoD.Zombie.miniGameDisabled = true
CoD.Zombie.AllowRoundAnimation = 1
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
CoD.Zombie.UpdateCraftableState = function ( controller, list, element )
	if not element then
		return 
	end
	local newState = Engine.GetModelValue( element:getModel( controller, "state" ) )
	if newState == 0 then
		
	elseif newState == 1 then
		list:playClip( "ItemPickUp" )
		element.border:playClip( "PulseRed" )
		element.IconBg.grungeImage:setAlpha( 0.5 )
		element.IconBg.grungeImage:setRGB( element.color[1], element.color[2], element.color[3] )
		element:setState( "ItemPickUp" )
	end
end

CoD.Zombie.UpdateCraftable = function ( self, event )
	local controller = event.controller
	local list = self.shieldCraftableList
	local element = list.questList:findItem( nil, {
		clientFieldName = event.name
	}, false, nil )
	local newState = event.newValue
	Engine.SetModelValue( element:getModel( controller, "state" ), newState )
	CoD.Zombie.UpdateCraftableState( controller, list, element )
end

CoD.Zombie.ZodUpdateQuestState = function ( controller, list, element, inScoreboard )
	if not element then
		return 
	end
	local mapName = CoD.Zombie.GetUIMapName()
	local stateTable = CoD.Zombie.SideQuest.QuestStates[mapName]
	local newState = Engine.GetModelValue( element:getModel( controller, "state" ) )
	if element then
		list:playClip( "ItemPickUp" )
		if newState == stateTable.ITEM_DROPPED then
			element:setState( "ItemDrop" )
		else
			if inScoreboard ~= true then
				if newState ~= stateTable.NEED_RELIC then
					element.border:playClip( "DefaultClip" )
				else
					element.border:playClip( "PulseRed" )
				end
			end
			if newState == stateTable.HAVE_MEMENTO then
				Engine.SetModelValue( element:getModel( controller, "image" ), element.image1 )
				element:setState( "ItemPickUp" )
			elseif newState == stateTable.USED_MEMENTO then
				Engine.SetModelValue( element:getModel( controller, "image" ), element.image1 )
				element:setState( "ItemUsed" )
			elseif newState == stateTable.NEED_RELIC then
				Engine.SetModelValue( element:getModel( controller, "image" ), element.image2 )
				element:setState( "ItemDrop" )
			elseif newState == stateTable.HAVE_RELIC then
				Engine.SetModelValue( element:getModel( controller, "image" ), element.image2 )
				element:setState( "ItemPickUp" )
			elseif newState == stateTable.USED_RELIC then
				Engine.SetModelValue( element:getModel( controller, "image" ), element.image2 )
				element:setState( "ItemUsed" )
			end
		end
	end
end

CoD.Zombie.ZodUpdateQuest = function ( self, event )
	if event.oldValue ~= 0 or event.newValue ~= 0 then
		local list = self.questItemList
		local element = list.questList:findItem( nil, {
			clientFieldName = event.name
		}, false, nil )
		local controller = event.controller
		local newState = event.newValue
		local inScoreboard = false
		Engine.SetModelValue( element:getModel( controller, "state" ), newState )
		CoD.Zombie.ZodUpdateQuestState( controller, list, element, inScoreboard )
	end
end

CoD.Zombie.ZodUpdatePersistentIcon = function ( self, event )
	if event.newValue == 0 then
		self.persistentItem:setAlpha( 0 )
		CoD.Zombie.SideQuest.HasPersistentItem[CoD.Zombie.MAP_ZM_ZOD] = 0
	elseif event.newValue == 1 then
		self.persistentItem:setAlpha( 1 )
		self.persistentItem:setState( "ItemPickUp" )
		CoD.Zombie.SideQuest.HasPersistentItem[CoD.Zombie.MAP_ZM_ZOD] = 1
	end
end

CoD.Zombie.ZodItemHolderUpdate = function ( self, event )
	if event.oldValue == 0 and event.newValue == 0 then
		return 
	end
	local mapName = CoD.Zombie.GetUIMapName()
	local questItemCount = #CoD.Zombie.SideQuestDataSource[mapName]
	local clientFieldName = event.name
	local playerNum = event.newValue
	local prevPlayerNum = event.oldValue
	local controller = event.controller
	local clientNum = Engine.GetClientNum( controller ) + 1
	local clientFieldLength = string.len( CoD.Zombie.SideQuest.ItemHolderClientFieldName[mapName] ) + 1
	local itemName = string.sub( event.name, clientFieldLength )
	local list = self.questItemList
	local curElement = list.questList:findItem( nil, {
		name = itemName
	}, false, nil )
	if curElement then
		if playerNum == 0 then
			curElement.playerIDText:setText( "" )
			if prevPlayerNum == clientNum and self.heldItem1 then
				self.heldItem1:setAlpha( 0 )
				self.heldItem1:setState( "DefaultState" )
				self.heldItem1:setModel( nil )
			end
		else
			if playerNum == clientNum and self.heldItem1 then
				self.heldItem1:setModel( curElement:getModel() )
				self.heldItem1:setState( "ItemPickUp" )
				self.heldItem1:setAlpha( 1 )
			end
			curElement.playerIDText:setRGB( CoD.Zombie.PlayerColors[playerNum].r, CoD.Zombie.PlayerColors[playerNum].g, CoD.Zombie.PlayerColors[playerNum].b )
			curElement.playerIDText:setText( Engine.Localize( "ZMUI_PLAYER_NUM_" .. playerNum ) )
		end
		CoD.Zombie.SideQuest.PlayerPieceInfo[mapName][curElement.itemIndex] = playerNum
	end
end

CoD.Zombie.ZodScoreboardUpdate = function ( self, event )
	local questItemList = self.questItemList
	local persistentItem = self.persistentItem
	local shieldCraftableList = self.shieldCraftableList
	local controller = event.controller
	local clientNum = Engine.GetClientNum( controller ) + 1
	local mapName = CoD.Zombie.GetUIMapName()
	if questItemList then
		local rowTable = questItemList.questList.layoutItems[1]
		if rowTable then
			for index, element in ipairs( rowTable ) do
				local inScoreboard = true
				CoD.Zombie.ZodUpdateQuestState( controller, questItemList, element, inScoreboard )
				element.border:setState( "DefaultState" )
				local playerNum = CoD.Zombie.SideQuest.PlayerPieceInfo[mapName][index]
				if playerNum == 0 then
					element.playerIDText:setText( "" )
				end
				if playerNum == clientNum then
					element.border:setState( "CurrentItem" )
				end
				element.playerIDText:setRGB( CoD.Zombie.PlayerColors[playerNum].r, CoD.Zombie.PlayerColors[playerNum].g, CoD.Zombie.PlayerColors[playerNum].b )
				element.playerIDText:setText( Engine.Localize( "ZMUI_PLAYER_NUM_" .. playerNum ) )
			end
		end
	end
	if shieldCraftableList then
		local rowTable = shieldCraftableList.questList.layoutItems[1]
		if rowTable then
			for index, element in ipairs( rowTable ) do
				CoD.Zombie.UpdateCraftableState( controller, shieldCraftableList, element )
			end
		end
	end
	if persistentItem and 1 == CoD.Zombie.SideQuest.HasPersistentItem[CoD.Zombie.MAP_ZM_ZOD] then
		persistentItem:setState( "ItemPickUp" )
	end
end

CoD.Zombie.SideQuest = {
	QuestStates = {
		zm_zod = {
			ITEM_DROPPED = 0,
			HAVE_MEMENTO = 1,
			USED_MEMENTO = 2,
			NEED_RELIC = 3,
			HAVE_RELIC = 4,
			USED_RELIC = 5
		}
	},
	PlayerPieceInfo = {
		zm_zod = {
			0,
			0,
			0,
			0
		}
	},
	HasPersistentItem = {
		zm_zod = {
			0
		}
	},
	ItemHolderClientFieldName = {
		zm_zod = "holder_of_"
	}
}
CoD.Zombie.SideQuestDataSource = {
	zm_zod = {
		{
			models = {
				image = "uie_hud_zod_quest_memento_boxer",
				state = 0
			},
			properties = {
				name = "boxer",
				clientFieldName = "quest_state_boxer",
				image1 = "uie_hud_zod_quest_memento_boxer",
				image2 = "uie_hud_zod_quest_relic_boxer",
				itemIndex = 1
			}
		},
		{
			models = {
				image = "uie_hud_zod_quest_memento_detective",
				state = 0
			},
			properties = {
				name = "detective",
				clientFieldName = "quest_state_detective",
				image1 = "uie_hud_zod_quest_memento_detective",
				image2 = "uie_hud_zod_quest_relic_detective",
				itemIndex = 2
			}
		},
		{
			models = {
				image = "uie_hud_zod_quest_memento_femme",
				state = 0
			},
			properties = {
				name = "femme",
				clientFieldName = "quest_state_femme",
				image1 = "uie_hud_zod_quest_memento_femme",
				image2 = "uie_hud_zod_quest_relic_femme",
				itemIndex = 3
			}
		},
		{
			models = {
				image = "uie_hud_zod_quest_memento_magician",
				state = 0
			},
			properties = {
				name = "magician",
				clientFieldName = "quest_state_magician",
				image1 = "uie_hud_zod_quest_memento_magician",
				image2 = "uie_hud_zod_quest_relic_magician",
				itemIndex = 4
			}
		}
	}
}
CoD.Zombie.CraftablesDataSource = {
	zm_zod = {
		{
			models = {
				image = "zom_hud_icon_buildable_item_dolly",
				state = 0
			},
			properties = {
				name = "dolly",
				clientFieldName = "piece_riotshield_dolly",
				color = {
					0.07,
					0.68,
					0.19
				}
			}
		},
		{
			models = {
				image = "zom_hud_icon_buildable_item_cardoortif",
				state = 0
			},
			properties = {
				name = "door",
				clientFieldName = "piece_riotshield_door",
				color = {
					0.07,
					0.68,
					0.19
				}
			}
		},
		{
			models = {
				image = "zm_riotshield_icon",
				state = 0
			},
			properties = {
				name = "clamp",
				clientFieldName = "piece_riotshield_clamp",
				color = {
					0.07,
					0.68,
					0.19
				}
			}
		}
	}
}
CoD.Zombie.PersistentItemInfo = {
	zm_zod = {
		image = "uie_hud_zod_quest_key",
		clientFieldName = "quest_key"
	}
}
