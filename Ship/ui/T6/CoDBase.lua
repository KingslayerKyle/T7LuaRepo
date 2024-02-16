-- 1b37b1548c1a6c50b323b130b30c9d38
-- This hash is used for caching, delete to decompile the file again

if CoD == nil then
	CoD = {}
end
CoD.NullFunction = function ()
	
end

local f0_local0 = {
	__index = function ( f2_arg0, f2_arg1 )
		print( "LUI_NULL_FUNCTION: " .. f2_arg1 )
		return CoD.NullFunction
	end
}
if nil ~= Engine then
	setmetatable( Engine, f0_local0 )
end
require( "ui.T7.Utility.OverlayUtility" )
require( "lua.Shared.CoDShared" )
CoD.LANGUAGE_ENGLISH = 0
CoD.LANGUAGE_FRENCH = 1
CoD.LANGUAGE_FRENCHCANADIAN = 2
CoD.LANGUAGE_GERMAN = 3
CoD.LANGUAGE_AUSTRIAN = 4
CoD.LANGUAGE_ITALIAN = 5
CoD.LANGUAGE_SPANISH = 6
CoD.LANGUAGE_BRITISH = 7
CoD.LANGUAGE_RUSSIAN = 8
CoD.LANGUAGE_POLISH = 9
CoD.LANGUAGE_KOREAN = 10
CoD.LANGUAGE_JAPANESE = 11
CoD.LANGUAGE_CZECH = 12
CoD.LANGUAGE_FULLJAPANESE = 13
CoD.LANGUAGE_PORTUGUESE = 14
CoD.LANGUAGE_MEXICANSPANISH = 15
CoD.LANGUAGE_ARABIC = 16
CoD.LANGUAGE_TRADITIONALCHINESE = 17
CoD.LANGUAGE_SIMPLIFIEDCHINESE = 18
CoD.LANGUAGE_ENGLISHGERMAN = 19
CoD.LANGUAGE_ENGLISHJAPANESE = 20
CoD.LANGUAGE_HEBREW = 21
CoD.LANGUAGE_ENGLISHARABIC = 22
CoD.XC_LOCALE_UNITED_STATES = 36
CoD.UIMENU_NONE = 0
CoD.UIMENU_MAIN = 1
CoD.UIMENU_MAINLOBBY = 2
CoD.UIMENU_INGAME = 3
CoD.UIMENU_PREGAME = 4
CoD.UIMENU_POSTGAME = 5
CoD.UIMENU_WM_QUICKMESSAGE = 6
CoD.UIMENU_SCRIPT_POPUP = 7
CoD.UIMENU_SCOREBOARD = 8
CoD.UIMENU_GAMERCARD = 9
CoD.UIMENU_MUTEERROR = 10
CoD.UIMENU_SPLITSCREENGAMESETUP = 11
CoD.UIMENU_SYSTEMLINKJOINGAME = 12
CoD.UIMENU_PARTY = 13
CoD.UIMENU_LEAGUE_PARTY = 15
CoD.UIMENU_GAMELOBBY = 16
CoD.UIMENU_PRIVATELOBBY = 18
CoD.UIMENU_LEAGUELOBBY = 19
local f0_local1 = Engine.GetCurrentPlatform()
CoD.isDurango = f0_local1 == "durango"
CoD.isPC = f0_local1 == "pc"
CoD.isPS4 = f0_local1 == "orbis"
CoD.mapsStructTable = "maps"
CoD.mapsTable = Engine.GetGDTMapsTable()
CoD.codcasterTeamIdentityColorTable = "mp_codcaster_color_list"
CoD.codcasterTeamIdentityLogoTable = "mp_codcaster_logo_list"
CoD.completeCollectiblesAssetName = "completecollectibleslist"
CoD.NotEnoughLD = false
CoD.ZMDLCProductIDs = {
	PSNZMDLC1 = 100020,
	PSNZMDLC2 = 100021,
	PSNZMDLC3 = 100022,
	PSNZMDLC4 = 100023,
	XB1ZMDLC1 = 110020,
	XB1ZMDLC2 = 110021,
	XB1ZMDLC3 = 110022,
	XB1ZMDLC4 = 110023
}
CoD.DLCBits = {
	CONTENT_UNKNOWN = Enum.ContentFlagBits.CONTENT_UNKNOWN,
	CONTENT_ORIGINALMAPS = Enum.ContentFlagBits.CONTENT_ORIGINALMAPS,
	CONTENT_DLC0ZM = Enum.ContentFlagBits.CONTENT_DLC0ZM,
	CONTENT_DLC0MP = Enum.ContentFlagBits.CONTENT_DLC0MP,
	CONTENT_DLC1 = Enum.ContentFlagBits.CONTENT_DLC1,
	CONTENT_DLC2 = Enum.ContentFlagBits.CONTENT_DLC2,
	CONTENT_DLC3 = Enum.ContentFlagBits.CONTENT_DLC3,
	CONTENT_DLC4 = Enum.ContentFlagBits.CONTENT_DLC4,
	CONTENT_DLC5 = Enum.ContentFlagBits.CONTENT_DLC5,
	CONTENT_DLC1ZM = Enum.ContentFlagBits.CONTENT_DLC1ZM,
	CONTENT_DLC2ZM = Enum.ContentFlagBits.CONTENT_DLC2ZM,
	CONTENT_DLC3ZM = Enum.ContentFlagBits.CONTENT_DLC3ZM,
	CONTENT_DLC4ZM = Enum.ContentFlagBits.CONTENT_DLC4ZM,
	CONTENT_DLC6 = Enum.ContentFlagBits.CONTENT_DLC6
}
CoD.DLCFocus = 0
CoD.DLCNames = {
	[CoD.DLCBits.CONTENT_DLC0MP] = "MPUI_NUKETOWN_X",
	[CoD.DLCBits.CONTENT_DLC0ZM] = "ZMUI_FACTORY",
	[CoD.DLCBits.CONTENT_DLC1] = "MENU_DLC1_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC2] = "MENU_DLC2_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC3] = "MENU_DLC3_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC4] = "MENU_DLC4_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC5] = "MENU_DLC5_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC1ZM] = "MENU_DLC1ZM_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC2ZM] = "MENU_DLC2ZM_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC3ZM] = "MENU_DLC3ZM_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC4ZM] = "MENU_DLC4ZM_NAME_SHORT",
	[CoD.DLCBits.CONTENT_DLC6] = "MENU_DLC6_NAME_SHORT"
}
CoD.DLCImages = {
	[CoD.DLCBits.CONTENT_DLC0MP] = "t7_store_product_nuk3town",
	[CoD.DLCBits.CONTENT_DLC0ZM] = "t7_store_product_giant_zombie_map",
	[CoD.DLCBits.CONTENT_DLC1] = "t7_store_product_awakening",
	[CoD.DLCBits.CONTENT_DLC2] = "t7_store_product_eclipse",
	[CoD.DLCBits.CONTENT_DLC3] = "t7_store_product_descent",
	[CoD.DLCBits.CONTENT_DLC4] = "t7_store_product_salvation",
	[CoD.DLCBits.CONTENT_DLC5] = "t7_store_product_zmhd",
	[CoD.DLCBits.CONTENT_DLC1ZM] = "t7_store_product_der_eisendrache",
	[CoD.DLCBits.CONTENT_DLC2ZM] = "t7_store_product_zersubou_no_shima",
	[CoD.DLCBits.CONTENT_DLC3ZM] = "t7_store_product_gorod_krovi",
	[CoD.DLCBits.CONTENT_DLC4ZM] = "t7_store_product_revelations",
	[CoD.DLCBits.CONTENT_DLC6] = "t7_store_product_mphd"
}
CoD.DLCPackFromBit = {
	[CoD.DLCBits.CONTENT_DLC0ZM] = "DLC0ZM",
	[CoD.DLCBits.CONTENT_DLC1] = "DLC1",
	[CoD.DLCBits.CONTENT_DLC2] = "DLC2",
	[CoD.DLCBits.CONTENT_DLC3] = "DLC3",
	[CoD.DLCBits.CONTENT_DLC4] = "DLC4",
	[CoD.DLCBits.CONTENT_DLC5] = "DLC5",
	[CoD.DLCBits.CONTENT_DLC1ZM] = "DLC1ZM",
	[CoD.DLCBits.CONTENT_DLC2ZM] = "DLC2ZM",
	[CoD.DLCBits.CONTENT_DLC3ZM] = "DLC3ZM",
	[CoD.DLCBits.CONTENT_DLC4ZM] = "DLC4ZM",
	[CoD.DLCBits.CONTENT_DLC6] = "DLC6"
}
CoD.DLCIndexFromBit = {
	[CoD.DLCBits.CONTENT_DLC0ZM] = Enum.dlcIndex_t.CONTENT_DLC0ZM_INDEX,
	[CoD.DLCBits.CONTENT_DLC1] = Enum.dlcIndex_t.CONTENT_DLC1_INDEX,
	[CoD.DLCBits.CONTENT_DLC2] = Enum.dlcIndex_t.CONTENT_DLC2_INDEX,
	[CoD.DLCBits.CONTENT_DLC3] = Enum.dlcIndex_t.CONTENT_DLC3_INDEX,
	[CoD.DLCBits.CONTENT_DLC4] = Enum.dlcIndex_t.CONTENT_DLC4_INDEX,
	[CoD.DLCBits.CONTENT_DLC5] = Enum.dlcIndex_t.CONTENT_DLC5_INDEX,
	[CoD.DLCBits.CONTENT_DLC1ZM] = Enum.dlcIndex_t.CONTENT_DLC1ZM_INDEX,
	[CoD.DLCBits.CONTENT_DLC2ZM] = Enum.dlcIndex_t.CONTENT_DLC2ZM_INDEX,
	[CoD.DLCBits.CONTENT_DLC3ZM] = Enum.dlcIndex_t.CONTENT_DLC3ZM_INDEX,
	[CoD.DLCBits.CONTENT_DLC4ZM] = Enum.dlcIndex_t.CONTENT_DLC4ZM_INDEX,
	[CoD.DLCBits.CONTENT_DLC6] = Enum.dlcIndex_t.CONTENT_DLC6_INDEX
}
CoD.ProductFromBit = {
	[Enum.eModes.MODE_MULTIPLAYER] = {
		products = {
			[CoD.DLCBits.CONTENT_DLC1] = "dlc1",
			[CoD.DLCBits.CONTENT_DLC2] = "dlc2",
			[CoD.DLCBits.CONTENT_DLC3] = "dlc3",
			[CoD.DLCBits.CONTENT_DLC4] = "dlc4",
			[CoD.DLCBits.CONTENT_DLC6] = "dlc6"
		},
		known = 0
	},
	[Enum.eModes.MODE_ZOMBIES] = {
		products = {
			[CoD.DLCBits.CONTENT_DLC0ZM] = "giant",
			[CoD.DLCBits.CONTENT_DLC1] = "dlc1",
			[CoD.DLCBits.CONTENT_DLC2] = "dlc2",
			[CoD.DLCBits.CONTENT_DLC3] = "dlc3",
			[CoD.DLCBits.CONTENT_DLC4] = "dlc4",
			[CoD.DLCBits.CONTENT_DLC5] = "dlc5",
			[CoD.DLCBits.CONTENT_DLC1ZM] = "dlc1zm",
			[CoD.DLCBits.CONTENT_DLC2ZM] = "dlc2zm",
			[CoD.DLCBits.CONTENT_DLC3ZM] = "dlc3zm",
			[CoD.DLCBits.CONTENT_DLC4ZM] = "dlc4zm"
		},
		known = 0
	},
	[Enum.eModes.MODE_CAMPAIGN] = {
		products = {},
		known = 0
	},
	[Enum.eModes.MODE_INVALID] = {
		products = {},
		known = 0
	}
}
CoD.ContractWeaponTiers = {}
CoD.WeaponsNotInCP = {
	melee_boxing = true
}
CoD.LoginRewardCamo = true
CoD.LoginRewardTitle = "MENU_LOGIN_REWARD_SUMMER_CAMO_TITLE"
CoD.LoginRewardDesc = "MENU_LOGIN_REWARD_SUMMER_CAMO_DESC"
CoD.LoginRewardOverlayImage = "t7_crm_motd_watermelon_camo"
CoD.LoginRewardEntitlementString = "watermelon_camo"
CoD.LoginRewardItemReference = "mtl_t7_camo_summertime_wpn"
CoD.LoginRewardToastImage = "t7_callingcard_soldier_raft"
CoD.LoginRewardItemID = 2119987968
CoD.LoginRewardSKU = 90136
CoD.RewardRedeemBtnInfoList = {}
CoD.XPGROUPS = {
	DOUBLEXP_EVERYONE = 0,
	DOUBLEXP_PREORDER = 1,
	DOUBLEXP_GROUP_PARTY2 = 2,
	DOUBLEXP_GROUP_PARTY3 = 3,
	DOUBLEXP_GROUP_PARTY4 = 4,
	DOUBLEXP_GROUP_PARTY5 = 5,
	DOUBLEXP_GROUP_PARTY6 = 6,
	DOUBLEXP_GROUP_DLCALL = 7,
	DOUBLEXP_GROUP_DLCANY = 8,
	DOUBLEXP_GROUP_DLC0 = 9,
	DOUBLEXP_GROUP_DLC_FIRST = 9,
	DOUBLEXP_GROUP_DLCZM0 = 10,
	DOUBLEXP_GROUP_DLC1 = 11,
	DOUBLEXP_GROUP_DLC2 = 12,
	DOUBLEXP_GROUP_DLC3 = 13,
	DOUBLEXP_GROUP_DLC4 = 14,
	DOUBLEXP_GROUP_DLC5 = 15,
	DOUBLEXP_GROUP_DLCSEASONPASS = 16,
	DOUBLEXP_GROUP_DLC_LAST = 16,
	DOUBLEXP_GROUP_OWN_DLCALL = 17,
	DOUBLEXP_GROUP_OWN_DLCANY = 18,
	DOUBLEXP_GROUP_OWN_DLC0 = 19,
	DOUBLEXP_GROUP_OWN_DLC_FIRST = 19,
	DOUBLEXP_GROUP_OWN_DLCZM0 = 20,
	DOUBLEXP_GROUP_OWN_DLC1 = 21,
	DOUBLEXP_GROUP_OWN_DLC2 = 22,
	DOUBLEXP_GROUP_OWN_DLC3 = 23,
	DOUBLEXP_GROUP_OWN_DLC4 = 24,
	DOUBLEXP_GROUP_OWN_DLC5 = 25,
	DOUBLEXP_GROUP_OWN_DLCSEASONPASS = 26,
	DOUBLEXP_GROUP_OWN_DLC_LAST = 26,
	DOUBLEXP_GROUP_CE_NUKETOWN_2025 = 27,
	DOUBLEXP_GROUP_CE_NUKETOWN_Z = 28,
	DOUBLEXP_GROUP_CE_CAMO = 29,
	DOUBLEXP_GROUP_PHANTOM = 30,
	DOUBLEXP_GROUP_ZM_DORITOS_PROMO = 31,
	DOUBLEXP_GROUP_COUNT = 32
}
CoD.SpecialCallingCards = {
	{
		itemId = 90041,
		backgroundDescription = "EM_BACK_MP_bo4_preview"
	},
	{
		itemId = 90043,
		backgroundDescription = "EM_BACK_flying_bee"
	},
	{
		itemId = 90045,
		backgroundDescription = "EM_BACK_soldier_raft"
	}
}
CoD.TurnOnRedeemBtnFocus = function ( f3_arg0 )
	local f3_local0 = false
	for f3_local4, f3_local5 in pairs( CoD.RewardRedeemBtnInfoList ) do
		f3_local5.isFocus = false
		if f3_local5.redeemBtn.m_focusable and not f3_local0 then
			f3_local0 = true
			f3_local5.redeemBtn:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			f3_local5.isFocus = true
		end
	end
end

CoD.OrbisDurangoPCValue = function ( f4_arg0, f4_arg1, f4_arg2 )
	if CoD.isPS4 then
		local f4_local0 = f4_arg0
	end
	if CoD.isDurango then
		local f4_local1 = f4_arg1
	end
	if CoD.isPC then
		local f4_local2 = f4_arg2
	end
	return f4_local2 or f4_local1 or f4_local0 or nil
end

CoD.IsKnownDLC = function ( f5_arg0 )
	local f5_local0
	if f5_arg0 ~= nil then
		f5_local0 = CoD.BitUtility.IsBitwiseAndNonZero( CoD.GetKnownDLCBits(), f5_arg0 )
	else
		f5_local0 = false
	end
	return f5_local0
end

CoD.IsHiddenDLC = function ( f6_arg0 )
	return CoD.DLCPackFromBit[f6_arg0] and f6_local0 and not CoD.ProductIsKnown[f6_arg0]
end

CoD.ParseKnownDLC = function ()
	local f7_local0 = "gamedata/store/common/fpentitlement.csv"
	local f7_local1 = CoD.OrbisDurangoPCValue( 2, 3, 4 )
	local f7_local2 = 5
	CoD.ProductIsKnown = {}
	CoD.ProductBitFromId = {}
	local f7_local3 = function ( f8_arg0 )
		local f8_local0
		if f8_arg0 ~= nil and f8_arg0 ~= "" then
			f8_local0 = false
		else
			f8_local0 = true
		end
		return f8_local0
	end
	
	local f7_local4 = Engine.DvarInt( nil, "tu9_highestAvailableDLC" )
	for f7_local12, f7_local13 in pairs( CoD.ProductFromBit ) do
		for f7_local9, f7_local10 in pairs( f7_local13.products ) do
			CoD.ProductBitFromId[f7_local10] = f7_local9
			if CoD.ProductIsKnown[f7_local9] then
				f7_local13.known = f7_local13.known | f7_local9
			end
			if not f7_local3( Engine.TableLookup( nil, f7_local0, f7_local2, f7_local10, f7_local1 ) ) or f7_local10 == "dlc6" then
				local f7_local8 = CoD.DLCIndexFromBit[f7_local9]
				if f7_local8 and f7_local8 <= f7_local4 then
					CoD.ProductIsKnown[f7_local9] = true
					f7_local13.known = f7_local13.known | f7_local9
				end
			end
		end
	end
end

CoD.ParseKnownDLC()
CoD.GetRequiredDLCBitsFromPlaylist = function ( f9_arg0 )
	local f9_local0 = Engine.GetPlaylistInfoByID( f9_arg0 )
	if f9_local0 and f9_local0.playlist then
		return f9_local0.playlist.usedDLCMask
	else
		
	end
end

CoD.GetKnownDLCBits = function ()
	return CoD.ProductFromBit[Engine.CurrentSessionMode()].known
end

CoD.IsClientMissingDLC = function ( f11_arg0, f11_arg1 )
	if Engine.IsZombiesGame() then
		local f11_local0 = 16769535
		f11_arg0 = LuaUtils.UpdateZMDLCBits( f11_arg0 ) & f11_local0
		f11_arg1 = LuaUtils.UpdateZMDLCBits( f11_arg1 ) & f11_local0
	end
	return f11_arg0 ~= f11_arg0 & f11_arg1
end

CoD.GetMapDataFromMapID = function ( f12_arg0 )
	if f12_arg0 ~= nil then
		for f12_local3, f12_local4 in pairs( CoD.mapsTable ) do
			if f12_local4.unique_id == f12_arg0 then
				return f12_local4
			end
		end
	end
end

CoD.GetMapIDFromMapUniqueID = function ( f13_arg0 )
	if f13_arg0 ~= nil then
		for f13_local3, f13_local4 in pairs( CoD.mapsTable ) do
			if f13_local4.unique_id == f13_arg0 then
				return f13_local3
			end
		end
	end
end

CoD.GetMapValue = function ( f14_arg0, f14_arg1, f14_arg2 )
	if CoD.mapsTable[f14_arg0] ~= nil and CoD.mapsTable[f14_arg0][f14_arg1] ~= nil then
		return CoD.mapsTable[f14_arg0][f14_arg1]
	else
		return f14_arg2
	end
end

CoD.GetMapValueFromMapId = function ( f15_arg0, f15_arg1, f15_arg2 )
	if f15_arg0 ~= nil then
		for f15_local3, f15_local4 in pairs( CoD.mapsTable ) do
			if f15_local4.unique_id == f15_arg0 then
				return f15_local4[f15_arg1]
			end
		end
	end
	return f15_arg2
end

CoD.GetGameModeOnMapNameString = function ( f16_arg0, f16_arg1 )
	return Engine.Localize( "MENU_X_ON_X", Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f16_arg0, "name_ref" ), CoD.GetMapValue( f16_arg1, "mapName", f16_arg1 ) )
end

CoD.AllowGameType = function ( f17_arg0 )
	if f17_arg0 == "clean" then
		local f17_local0 = Dvar.fracture_enabled:exists()
		if f17_local0 then
			if Dvar.fracture_enabled:get() ~= 1 and Dvar.fracture_enabled:get() ~= "1" and Dvar.fracture_enabled:get() ~= true then
				f17_local0 = false
			else
				f17_local0 = true
			end
		end
		return f17_local0
	else
		return true
	end
end

CoD.profileKey_gametype = "gametype"
CoD.profileKey_map = "map"
CoD.profileKey_map_fr = "map_fr"
CoD.rankTable = "gamedata/tables/mp/mp_ranktable.csv"
CoD.rankIconTable = "gamedata/tables/mp/mp_rankicontable.csv"
CoD.paragonRankTable = "gamedata/tables/mp/mp_paragonranktable.csv"
CoD.attachmentTable = "gamedata/weapons/common/attachmentTable.csv"
CoD.backgroundsTable = "gamedata/emblems/backgrounds.csv"
CoD.didYouKnowTable = "gamedata/tables/mp/didYouKnow.csv"
CoD.fileShareTable = "gamedata/fileshare/fileshare_categories.csv"
CoD.musicPlayerTable = "gamedata/tables/common/music_player.csv"
CoD.rankIconTable_cp = "gamedata/tables/cp/cp_rankicontable.csv"
CoD.rankIconTable_mp = "gamedata/tables/mp/mp_rankicontable.csv"
CoD.rankIconTable_zm = "gamedata/tables/zm/zm_rankicontable.csv"
CoD.contractTable_mp = "gamedata/tables/mp/mp_contractTable.csv"
CoD.maxRankByMode = {}
CoD.maxRankByMode.CP = tonumber( Engine.TableLookup( 0, "gamedata/tables/cp/cp_ranktable.csv", 0, "maxrank", 1 ) )
CoD.maxRankByMode.MP = tonumber( Engine.TableLookup( 0, "gamedata/tables/mp/mp_ranktable.csv", 0, "maxrank", 1 ) )
CoD.maxRankByMode.ZM = tonumber( Engine.TableLookup( 0, "gamedata/tables/zm/zm_ranktable.csv", 0, "maxrank", 1 ) )
CoD.isSinglePlayer = false
if Engine.GetCurrentExe() == "singleplayer" then
	CoD.isSinglePlayer = true
	CoD.protoMapsTable = "gamedata/tables/sp/sp_prototypeMapsTable.csv"
	CoD.gameMode = "SP"
end
CoD.Shutdown = function ()
	if CoD.curLobbyTrack then
		Engine.StopSound( CoD.curLobbyTrack.alias )
	end
end

CoD.curLobbyMusic = ""
CoD.curLobbyTrack = nil
CoD.musicTracks = {}
CoD.musicTracks.queue = {}
CoD.musicTracks.allowInLobbies = {
	"mp_frontend",
	"cp_frontend",
	"zm_frontend",
	"zm_cp_frontend",
	"free_run"
}
CoD.GetMusicTracks = function ()
	local f19_local0 = {}
	local f19_local1 = Engine.StorageGetBuffer( Engine.GetPrimaryController(), Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f19_local1 and f19_local1.snd_frontendTracksState:get() == Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON then
		local f19_local2 = Engine.GetTableRowCount( CoD.musicPlayerTable )
		for f19_local3 = 0, f19_local2 - 1, 1 do
			if f19_local1.snd_playMPFrontendMusicTrack[f19_local3]:get() == 1 then
				table.insert( f19_local0, {
					alias = Engine.TableLookup( nil, CoD.musicPlayerTable, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX, f19_local3, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_ALIAS ),
					loop = true
				} )
			end
		end
	end
	LuaUtils.shuffle( f19_local0 )
	return f19_local0
end

CoD.SetupMusicTracks = function ( f20_arg0 )
	CoD.musicTracks.queue = CoD.GetMusicTracks()
	if LUI.primaryRoot.musicTrackTimer and not f20_arg0 then
		if CoD.curLobbyTrack then
			Engine.StopSound( CoD.curLobbyTrack.alias )
		end
		CoD.NextMenuTrack()
	end
end

CoD.NextMenuTrack = function ( f21_arg0, f21_arg1 )
	CoD.curLobbyTrack = nil
	if #CoD.musicTracks.queue > 0 then
		CoD.curLobbyTrack = table.remove( CoD.musicTracks.queue, 1 )
		if CoD.curLobbyTrack.loop then
			table.insert( CoD.musicTracks.queue, CoD.curLobbyTrack )
		end
	end
	if CoD.curLobbyTrack then
		Engine.PlaySound( CoD.curLobbyTrack.alias )
		if not f21_arg1 and (f21_arg0 or #CoD.musicTracks.queue > 1) then
			local f21_local0 = Engine.TableLookup( nil, CoD.musicPlayerTable, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_ALIAS, CoD.curLobbyTrack.alias, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_TITLE )
			if f21_local0 ~= "" then
				CoD.OverlayUtility.ShowToast( "NewMusicTrack", Engine.Localize( "MENU_NOW_PLAYING" ), f21_local0, "t7_icon_toast_musictracks", nil, nil, nil )
			end
		end
	end
	if LUI.primaryRoot then
		local f21_local0 = 200
		if CoD.curLobbyTrack then
			f21_local0 = f21_local0 + Engine.GetSoundPlaybackTime( CoD.curLobbyTrack.alias )
		end
		if LUI.primaryRoot.musicTrackTimer then
			LUI.primaryRoot.musicTrackTimer.interval = f21_local0
			LUI.primaryRoot.musicTrackTimer:reset()
		else
			LUI.primaryRoot.musicTrackTimer = LUI.UITimer.newElementTimer( f21_local0, false, function ()
				CoD.NextMenuTrack()
			end )
			LUI.primaryRoot:addElement( LUI.primaryRoot.musicTrackTimer )
		end
	end
end

CoD.AddMusicTrack = function ( f23_arg0, f23_arg1 )
	if not CoD.curLobbyTrack or CoD.curLobbyTrack.alias ~= f23_arg0 then
		table.insert( CoD.musicTracks.queue, 1, {
			alias = f23_arg0,
			loop = f23_arg1
		} )
	else
		table.insert( CoD.musicTracks.queue, {
			alias = f23_arg0,
			loop = f23_arg1
		} )
	end
end

CoD.EndCurrentTrack = function ()
	if CoD.curLobbyTrack then
		Engine.StopSound( CoD.curLobbyTrack.alias )
		CoD.curLobbyTrack = nil
		if LUI.primaryRoot and LUI.primaryRoot.musicTrackTimer then
			LUI.primaryRoot.musicTrackTimer:close()
			LUI.primaryRoot.musicTrackTimer = nil
		end
	end
end

CoD.PlayMenuMusic_Internal = function ( f25_arg0, f25_arg1, f25_arg2 )
	if not f25_arg0 or CoD.curLobbyMusic == f25_arg0 and not f25_arg1 then
		return 
	end
	CoD.curLobbyMusic = f25_arg0
	local f25_local0 = Engine.GetPrimaryController()
	local f25_local1 = Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_DEFAULT
	local f25_local2 = LuaUtils.FindItemInArray( CoD.musicTracks.allowInLobbies, CoD.curLobbyMusic ) ~= nil
	local f25_local3 = Engine.StorageGetBuffer( f25_local0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f25_local3 then
		f25_local1 = f25_local3.snd_frontendTracksState:get()
		if f25_local1 == Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON and CoD.curLobbyTrack and f25_local2 and not f25_arg1 then
			return 
		end
	end
	if f25_local1 == Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_DEFAULT or not f25_local2 then
		CoD.EndCurrentTrack()
		Engine.PlayMenuMusic( CoD.curLobbyMusic )
	elseif f25_local1 == Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON then
		CoD.SetupMusicTracks( f25_arg2 )
		Engine.PlayMenuMusic( "" )
		if not f25_arg2 then
			CoD.EndCurrentTrack()
		end
		if not CoD.curLobbyTrack then
			CoD.NextMenuTrack( f25_arg1, not f25_arg1 )
		end
	else
		Engine.PlayMenuMusic( "" )
		CoD.EndCurrentTrack()
	end
end

CoD.PlayFrontendMusic = function ( f26_arg0 )
	if f26_arg0 == nil then
		f26_arg0 = "titlescreen"
		if CoD.isCampaign then
			f26_arg0 = "cp_frontend"
		elseif CoD.isMultiplayer then
			f26_arg0 = "mp_frontend"
		elseif CoD.isZombie then
			f26_arg0 = "zm_frontend"
		end
	end
	CoD.PlayMenuMusic_Internal( f26_arg0, false )
end

CoD.PlayFrontendMusicForLobby = function ( f27_arg0 )
	local f27_local0 = LobbyData:UITargetFromId( f27_arg0 )
	CoD.PlayMenuMusic_Internal( f27_local0 and f27_local0.menuMusic, false )
end

CoD.StopFrontendMusic = function ()
	Engine.PlayMenuMusic( "" )
	if CoD.curLobbyTrack then
		Engine.StopSound( CoD.curLobbyTrack.alias )
		CoD.curLobbyTrack = nil
		if LUI.primaryRoot and LUI.primaryRoot.musicTrackTimer then
			LUI.primaryRoot.musicTrackTimer:close()
			LUI.primaryRoot.musicTrackTimer = nil
		end
	end
end

CoD.ResetFrontendMusic = function ( f29_arg0 )
	CoD.PlayMenuMusic_Internal( CoD.curLobbyMusic, true, f29_arg0 )
end

CoD.rankTableCP = "gamedata/tables/cp/cp_ranktable.csv"
CoD.rankTableMP = "gamedata/tables/mp/mp_ranktable.csv"
CoD.rankTableZM = "gamedata/tables/zm/zm_ranktable.csv"
CoD.paragonRankTableMP = "gamedata/tables/mp/mp_paragonranktable.csv"
CoD.paragonRankTableZM = "gamedata/tables/zm/zm_paragonranktable.csv"
CoD.scoreInfoTableMP = "gamedata/tables/mp/scoreinfo.csv"
CoD.SetupMode = function ( f30_arg0 )
	CoD.isCampaign = false
	CoD.isMultiplayer = false
	CoD.isZombie = false
	CoD.isModeSelected = false
	CoD.isSafehouse = false
	CoD.gameModeEnum = nil
	if f30_arg0.abbreviation == nil then
		return 
	end
	CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
	if IsGameTypeDOA() then
		Engine.SetDvar( "ui_blocksaves", "1" )
	end
	CoD.UnlockablesTable = nil
	if Engine.IsMultiplayerGame() then
		CoD.isMultiplayer = true
		CoD.scoreInfoTable = CoD.scoreInfoTableMP
		CoD.rankTable = CoD.rankTableMP
		CoD.rankIconTable = CoD.rankIconTable_mp
		CoD.weaponAttributes = "gamedata/weapons/mp/mp_attributesTable.csv"
		CoD.statsMilestonePath = "gamedata/stats/mp/statsmilestones"
		CoD.statsTable = "gamedata/stats/mp/mp_statsTable.csv"
		CoD.gunLevelsTable = "gamedata/weapons/mp/mp_gunlevels.csv"
		CoD.emblemIconsTable = "gamedata/emblems/emblemIcons.csv"
		CoD.gameMode = "MP"
		CoD.profileKey_gametype = "gametype"
		CoD.profileKey_map = "map"
		CoD.isModeSelected = true
		CoD.gameModeEnum = Enum.eModes.MODE_MULTIPLAYER
	end
	if Engine.IsCampaignGame() then
		CoD.isCampaign = true
		CoD.protoMapsTable = "gamedata/tables/cp/cp_prototypeMapsTable.csv"
		CoD.rankTable = CoD.rankTableCP
		CoD.rankIconTable = CoD.rankIconTable_cp
		CoD.statsMilestonePath = "gamedata/stats/cp/statsmilestones"
		CoD.scoreInfoTable = "gamedata/tables/cp/scoreInfo.csv"
		CoD.statsTable = "gamedata/stats/cp/cp_statsTable.csv"
		CoD.weaponAttributes = "gamedata/weapons/cp/cp_attributesTable.csv"
		CoD.statsMilestone = "gamedata/stats/cp/statsmilestones1.csv"
		CoD.gunLevelsTable = "gamedata/weapons/cp/cp_gunlevels.csv"
		CoD.gameMode = "CP"
		CoD.isModeSelected = true
		local f30_local0 = CoD
		local f30_local1 = LUI.startswith
		local f30_local2 = Engine.GetCurrentMap()
		if not f30_local2 then
			f30_local2 = Dvar.ui_mapname:get()
		end
		f30_local0.isSafehouse = f30_local1( f30_local2, "cp_sh_" )
		CoD.profileKey_gametype = "gametype_cp"
		CoD.profileKey_map = "map_cp"
		CoD.gameModeEnum = Enum.eModes.MODE_CAMPAIGN
		if CoD.isSafehouse then
			Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f30_arg0.controller ), "safehouse" ), "inClientBunk" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" ), "" )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" ), "" )
		end
	end
	if Engine.IsZombiesGame() then
		CoD.isZombie = true
		CoD.rankTable = CoD.rankTableZM
		CoD.paragonRankTable = CoD.paragonRankTableZM
		CoD.rankIconTable = CoD.rankIconTable_zm
		CoD.statsMilestonePath = "gamedata/stats/zm/statsmilestones"
		CoD.profileKey_gametype = "gametype_zm"
		CoD.profileKey_map = "map_zm"
		CoD.gameMode = "ZM"
		CoD.isModeSelected = true
		CoD.gameModeEnum = Enum.eModes.MODE_ZOMBIES
		CoD.gunLevelsTable = "gamedata/weapons/zm/zm_gunlevels.csv"
		CoD.emblemIconsTable = "gamedata/emblems/emblemIcons.csv"
		CoD.statsTable = "gamedata/stats/zm/zm_statsTable.csv"
	end
	CoD.MAX_RANK = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, "maxrank", 1 ) )
	CoD.MAX_PRESTIGE = tonumber( Engine.TableLookup( 0, CoD.rankIconTable, 0, "maxprestige", 1 ) )
	CoD.MAX_RANKXP = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, CoD.MAX_RANK, 7 ) )
	CoD.MAX_PARAGON_RANK = tonumber( Engine.TableLookup( 0, CoD.paragonRankTable, 0, "maxrank", 1 ) )
	CoD.MAX_PARAGON_RANKXP = tonumber( Engine.TableLookup( 0, CoD.paragonRankTable, 0, CoD.MAX_PARAGON_RANK, 7 ) )
	CoD.MAX_RANK_STARTER_PACK = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, "maxrankstarterpack", 1 ) )
end

if CoD.perController == nil then
	CoD.perController = {}
	for f0_local2 = 0, 3, 1 do
		CoD.perController[f0_local2] = {}
	end
end
if CoD.fonts == nil then
	CoD.fonts = {}
end
CoD.getStatsMilestoneTable = function ( f31_arg0, f31_arg1 )
	if not f31_arg1 then
		f31_arg1 = Engine.CurrentSessionMode()
	end
	if f31_arg1 == Enum.eModes.MODE_CAMPAIGN then
		return "gamedata/stats/cp/statsmilestones" .. f31_arg0 .. ".csv"
	elseif f31_arg1 == Enum.eModes.MODE_MULTIPLAYER then
		return "gamedata/stats/mp/statsmilestones" .. f31_arg0 .. ".csv"
	elseif f31_arg1 == Enum.eModes.MODE_ZOMBIES then
		return "gamedata/stats/zm/statsmilestones" .. f31_arg0 .. ".csv"
	else
		
	end
end

if CoD.LANGUAGE_JAPANESE == Dvar.loc_language:get() or CoD.LANGUAGE_FULLJAPANESE == Dvar.loc_language:get() then
	CoD.fonts.Condensed = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/normalFont" )
	CoD.fonts.Default = CoD.fonts.Condensed
	CoD.fonts.Big = CoD.fonts.Condensed
	CoD.fonts.Morris = CoD.fonts.Condensed
	CoD.fonts.ExtraSmall = CoD.fonts.Condensed
	CoD.fonts.Italic = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/italicFont" )
	CoD.fonts.SmallItalic = CoD.fonts.Italic
else
	CoD.fonts.Default = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/smallFont" )
	CoD.fonts.Condensed = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/normalFont" )
	CoD.fonts.Italic = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/italicFont" )
	CoD.fonts.Big = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/bigFont" )
	CoD.fonts.Morris = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/extraBigFont" )
	CoD.fonts.ExtraSmall = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/extraSmallFont" )
	CoD.fonts.SmallItalic = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/smallItalicFont" )
end
CoD.fonts.Dist = RegisterFont( "fonts/distFont" )
LUI.DefaultFont = CoD.fonts.Default
CoD.textSize = {}
if CoD.LANGUAGE_RUSSIAN == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 20
	CoD.textSize.SmallItalic = 20
	CoD.textSize.Default = 21
	CoD.textSize.Italic = 21
	CoD.textSize.Condensed = 24
	CoD.textSize.Big = 36
	CoD.textSize.Morris = 42
elseif CoD.LANGUAGE_POLISH == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 16
	CoD.textSize.SmallItalic = 16
	CoD.textSize.Default = 19
	CoD.textSize.Italic = 21
	CoD.textSize.Condensed = 21
	CoD.textSize.Big = 32
	CoD.textSize.Morris = 42
elseif CoD.LANGUAGE_JAPANESE == Dvar.loc_language:get() or CoD.LANGUAGE_FULLJAPANESE == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 15
	CoD.textSize.SmallItalic = 15
	CoD.textSize.Default = 17
	CoD.textSize.Italic = 17
	CoD.textSize.Condensed = 22
	CoD.textSize.Big = 40
	CoD.textSize.Morris = 52
else
	CoD.textSize.ExtraSmall = 20
	CoD.textSize.SmallItalic = 20
	CoD.textSize.Default = 25
	CoD.textSize.Italic = 25
	CoD.textSize.Condensed = 30
	CoD.textSize.Big = 48
	CoD.textSize.Morris = 60
end
CoD.GetFontBasedOnSize = function ( f32_arg0 )
	local f32_local0 = LUI.ShallowCopy( CoD.textSize )
	f32_local0.SmallItalic = nil
	f32_local0.Italic = nil
	local f32_local1, f32_local2, f32_local3, f32_local4 = nil
	local f32_local5 = {}
	for f32_local9, f32_local10 in pairs( f32_local0 ) do
		table.insert( f32_local5, {
			name = f32_local9,
			size = f32_local10
		} )
	end
	table.sort( f32_local5, function ( f33_arg0, f33_arg1 )
		return f33_arg0.size < f33_arg1.size
	end )
	for f32_local9, f32_local10 in ipairs( f32_local5 ) do
		f32_local3 = f32_local10.name
		f32_local4 = f32_local10.size
		if not f32_local2 then
			f32_local2 = f32_local3
		end
		if f32_arg0 <= (f32_local4 + CoD.textSize[f32_local2]) / 2 then
			break
		end
		f32_local2 = f32_local3
	end
	if f32_local2 then
		return CoD.fonts[f32_local2]
	else
		
	end
end

CoD.buttonStrings = {}
CoD.buttonStrings.primary = "^BBUTTON_LUI_PRIMARY^"
CoD.buttonStrings.secondary = "^BBUTTON_LUI_SECONDARY^"
CoD.buttonStrings.alt1 = "^BBUTTON_LUI_ALT1^"
CoD.buttonStrings.alt2 = "^BBUTTON_LUI_ALT2^"
CoD.buttonStrings.select = "^BBUTTON_LUI_SELECT^"
CoD.buttonStrings.start = "^BBUTTON_LUI_START^"
CoD.buttonStrings.shoulderl = "^BBUTTON_LUI_SHOULDERL^"
CoD.buttonStrings.shoulderr = "^BBUTTON_LUI_SHOULDERR^"
CoD.buttonStrings.right_stick = "^BBUTTON_LUI_RIGHT_STICK^"
CoD.buttonStrings.left_stick_up = "^BBUTTON_LUI_LEFT_STICK_UP^"
CoD.buttonStrings.right_trigger = "^BBUTTON_LUI_RIGHT_TRIGGER^"
CoD.buttonStrings.left_trigger = "^BBUTTON_LUI_LEFT_TRIGGER^"
CoD.buttonStrings.dpad_all = "^BBUTTON_LUI_DPAD_ALL^"
CoD.buttonStrings.dpad_ud = "^BBUTTON_LUI_DPAD_UD^"
CoD.buttonStrings.dpad_lr = "^BBUTTON_LUI_DPAD_RL^"
CoD.buttonStrings.left = "^BBUTTON_LUI_DPAD_L^"
CoD.buttonStrings.up = "^BBUTTON_LUI_DPAD_U^"
CoD.buttonStrings.down = "^BBUTTON_LUI_DPAD_D^"
CoD.buttonStrings.right = "^BBUTTON_LUI_DPAD_R^"
CoD.buttonStrings.emblem_move = "^BBUTTON_EMBLEM_MOVE^"
CoD.buttonStrings.emblem_scale = "^BBUTTON_EMBLEM_SCALE^"
CoD.buttonStrings.right_stick_pressed = "^BBUTTON_LUI_RIGHT_STICK^"
if CoD.isPC == true then
	CoD.buttonStringsShortCut = {}
	CoD.buttonStringsShortCut.primary = "@KEY_ENTER"
	CoD.buttonStringsShortCut.secondary = "@KEY_ESC_SHORT"
	CoD.buttonStringsShortCut.alt1 = "unnasigned_alt1"
	CoD.buttonStringsShortCut.alt2 = "unnasigned_alt2"
	CoD.buttonStringsShortCut.select = "@KEY_TAB"
	CoD.buttonStringsShortCut.start = "unnasigned_start"
	CoD.buttonStringsShortCut.shoulderl = "^BBUTTON_CYCLE_LEFT^"
	CoD.buttonStringsShortCut.shoulderr = "^BBUTTON_CYCLE_RIGHT^"
	CoD.buttonStringsShortCut.right_stick = "+lookstick"
	CoD.buttonStringsShortCut.left_stick_up = "unnasigned_lsu"
	CoD.buttonStringsShortCut.right_trigger = "unnasigned_rt"
	CoD.buttonStringsShortCut.left_trigger = "unnasigned_lt"
	CoD.buttonStringsShortCut.dpad_all = "@KEY_ARROWS"
	CoD.buttonStringsShortCut.dpad_ud = "@KEY_UP_DOWN_ARROWS"
	CoD.buttonStringsShortCut.dpad_lr = "@KEY_LEFT_RIGHT_ARROWS"
	CoD.buttonStringsShortCut.left = "@KEY_LEFTARROW"
	CoD.buttonStringsShortCut.up = "@KEY_UPARROW"
	CoD.buttonStringsShortCut.down = "@KEY_DOWNARROW"
	CoD.buttonStringsShortCut.actiondown = "+actionslot 2"
	CoD.buttonStringsShortCut.actionup = "+actionslot 1"
	CoD.buttonStringsShortCut.actionleft = "+actionslot 3"
	CoD.buttonStringsShortCut.actionright = "+actionslot 4"
	CoD.buttonStringsShortCut.mouse = "^BBUTTON_MOUSE_CLICK^"
	CoD.buttonStringsShortCut.mouse1 = "^BBUTTON_MOUSE_LEFT^"
	CoD.buttonStringsShortCut.mouse2 = "^BBUTTON_MOUSE_RIGHT^"
	CoD.buttonStringsShortCut.mouse3 = "^BBUTTON_MOUSE_MIDDLE^"
	CoD.buttonStringsShortCut.mouse_edit = "^BBUTTON_MOUSE_EDIT^"
	CoD.buttonStringsShortCut.wheelup = "^BMOUSE_WHEEL_UP^"
	CoD.buttonStringsShortCut.wheeldown = "^BMOUSE_WHEEL_DOWN^"
	CoD.buttonStringsShortCut.space = "@KEY_SPACE"
	CoD.buttonStringsShortCut.backspace = "@KEY_BACKSPACE"
	CoD.buttonStringsShortCut.emblem_move = "^BBUTTON_EMBLEM_MOVE^"
	CoD.buttonStringsShortCut.emblem_scale = "^BBUTTON_EMBLEM_SCALE^"
end
CoD.white = {}
CoD.white.r = 1
CoD.white.g = 1
CoD.white.b = 1
CoD.red = {}
CoD.red.r = 0.73
CoD.red.g = 0.25
CoD.red.b = 0.25
CoD.brightRed = {}
CoD.brightRed.r = 1
CoD.brightRed.g = 0.19
CoD.brightRed.b = 0.19
CoD.yellow = {}
CoD.yellow.r = 1
CoD.yellow.g = 1
CoD.yellow.b = 0.5
CoD.yellowGlow = {}
CoD.yellowGlow.r = 0.9
CoD.yellowGlow.g = 0.69
CoD.yellowGlow.b = 0.2
CoD.green = {}
CoD.green.r = 0.42
CoD.green.g = 0.68
CoD.green.b = 0.46
CoD.brightGreen = {}
CoD.brightGreen.r = 0.42
CoD.brightGreen.g = 0.9
CoD.brightGreen.b = 0.46
CoD.blue = {}
CoD.blue.r = 0.35
CoD.blue.g = 0.63
CoD.blue.b = 0.75
CoD.blueGlow = {}
CoD.blueGlow.r = 0.68
CoD.blueGlow.g = 0.86
CoD.blueGlow.b = 1
CoD.lightBlue = {}
CoD.lightBlue.r = 0.15
CoD.lightBlue.g = 0.55
CoD.lightBlue.b = 1
CoD.greenBlue = {}
CoD.greenBlue.r = 0.26
CoD.greenBlue.g = 0.59
CoD.greenBlue.b = 0.54
CoD.visorBlue = {}
CoD.visorBlue.r = 0.63
CoD.visorBlue.g = 0.79
CoD.visorBlue.b = 0.78
CoD.visorDeepBlue = {}
CoD.visorDeepBlue.r = 0.23
CoD.visorDeepBlue.g = 0.37
CoD.visorDeepBlue.b = 0.36
CoD.visorBlue1 = {}
CoD.visorBlue1.r = 0.4
CoD.visorBlue1.g = 0.55
CoD.visorBlue1.b = 0.51
CoD.visorBlue2 = {}
CoD.visorBlue2.r = 0.4
CoD.visorBlue2.g = 0.55
CoD.visorBlue2.b = 0.51
CoD.visorBlue3 = {}
CoD.visorBlue3.r = 0.94
CoD.visorBlue3.g = 1
CoD.visorBlue3.b = 1
CoD.visorBlue4 = {}
CoD.visorBlue4.r = 0.91
CoD.visorBlue4.g = 1
CoD.visorBlue4.b = 0.98
CoD.offWhite = {}
CoD.offWhite.r = 1
CoD.offWhite.g = 1
CoD.offWhite.b = 1
CoD.gray = {}
CoD.gray.r = 0.39
CoD.gray.g = 0.38
CoD.gray.b = 0.36
CoD.offGray = {}
CoD.offGray.r = 0.27
CoD.offGray.g = 0.28
CoD.offGray.b = 0.24
CoD.black = {}
CoD.black.r = 0
CoD.black.g = 0
CoD.black.b = 0
CoD.orange = {}
CoD.orange.r = 0.96
CoD.orange.g = 0.58
CoD.orange.b = 0.11
CoD.trueOrange = {}
CoD.trueOrange.r = 1
CoD.trueOrange.g = 0.5
CoD.trueOrange.b = 0
CoD.BOIIOrange = {}
CoD.BOIIOrange.r = 1
CoD.BOIIOrange.g = 0.4
CoD.BOIIOrange.b = 0
CoD.playerYellow = {}
CoD.playerYellow.r = 0.92
CoD.playerYellow.g = 0.8
CoD.playerYellow.b = 0.31
CoD.playerBlue = {}
CoD.playerBlue.r = 0.35
CoD.playerBlue.g = 0.63
CoD.playerBlue.b = 0.9
CoD.playerRed = {}
CoD.playerRed.r = 0.73
CoD.playerRed.g = 0.25
CoD.playerRed.b = 0.25
CoD.ConsoleColors = {}
if IsLuaCodeVersionAtLeast( 18 ) then
	CoD.UpdateConsoleColors = function ( f34_arg0 )
		CoD.ConsoleColors[f34_arg0.controller] = f34_arg0.colors
	end
	
else
	for f0_local2 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		CoD.ConsoleColors[f0_local2] = {
			{
				r = 0,
				g = 0,
				b = 0,
				a = 1
			},
			{
				r = 1,
				g = 0.2,
				b = 0.2,
				a = 1
			},
			{
				r = 0,
				g = 1,
				b = 0,
				a = 1
			},
			{
				r = 1,
				g = 1,
				b = 0.5,
				a = 1
			},
			{
				r = 0,
				g = 0,
				b = 1,
				a = 1
			},
			{
				r = 0,
				g = 1,
				b = 1,
				a = 1
			},
			{
				r = 1,
				g = 0.36,
				b = 1,
				a = 1
			},
			{
				r = 1,
				g = 1,
				b = 1,
				a = 1
			},
			{
				r = 0.58,
				g = 0.84,
				b = 0.87,
				a = 1
			},
			{
				r = 0.87,
				g = 0.3,
				b = 0.19,
				a = 1
			},
			{
				r = 0.58,
				g = 0.84,
				b = 0.87,
				a = 1
			},
			{
				r = 0.87,
				g = 0.3,
				b = 0.19,
				a = 1
			}
		}
	end
end
CoD.DefaultConsoleColorIndex = 8
CoD.RTSColors = {}
CoD.RTSColors.red = {}
CoD.RTSColors.red.r = 0.6
CoD.RTSColors.red.g = 0
CoD.RTSColors.red.b = 0
CoD.RTSColors.blue = {}
CoD.RTSColors.blue.r = 0.23
CoD.RTSColors.blue.g = 0.86
CoD.RTSColors.blue.b = 0.85
CoD.RTSColors.magenta = {}
CoD.RTSColors.magenta.r = 0.85
CoD.RTSColors.magenta.g = 0.04
CoD.RTSColors.magenta.b = 0.36
CoD.RTSColors.yellow = {}
CoD.RTSColors.yellow.r = 0.8
CoD.RTSColors.yellow.g = 0.74
CoD.RTSColors.yellow.b = 0.21
CoD.MenuTitleColor = {}
CoD.MenuTitleColor.r = 0.71
CoD.MenuTitleColor.g = 0.76
CoD.MenuTitleColor.b = 0.78
if CoD.isSinglePlayer then
	CoD.DefaultTextColor = CoD.visorBlue4
	CoD.ButtonTextColor = CoD.visorBlue4
	CoD.DisabledTextColor = CoD.visorBlue1
	CoD.DisabledAlpha = 1
else
	CoD.DefaultTextColor = CoD.offWhite
	CoD.ButtonTextColor = {
		r = 0.71,
		g = 0.76,
		b = 0.78
	}
	CoD.DisabledTextColor = CoD.offWhite
	CoD.DisabledAlpha = 0.5
end
CoD.SCOREBOARD_SORT_DEFAULT = 0
CoD.SCOREBOARD_SORT_SCORE = 0
CoD.SCOREBOARD_SORT_ALPHABETICAL = 1
CoD.SCOREBOARD_SORT_CLIENTNUM = 2
CoD.teamColorFriendly = {}
local f0_local2 = CoD.teamColorFriendly
local f0_local3 = "r"
local f0_local4 = CoD.teamColorFriendly
local f0_local5 = "g"
local f0_local6 = CoD.teamColorFriendly
local f0_local7 = "b"
f0_local2[f0_local3], f0_local4[f0_local5], f0_local6[f0_local7] = Dvar.g_TeamColor_MyTeam:get()
CoD.teamColorEnemy = {}
f0_local2 = CoD.teamColorEnemy
f0_local3 = "r"
f0_local4 = CoD.teamColorEnemy
f0_local5 = "g"
f0_local6 = CoD.teamColorEnemy
f0_local7 = "b"
f0_local2[f0_local3], f0_local4[f0_local5], f0_local6[f0_local7] = Dvar.g_TeamColor_EnemyTeam:get()
CoD.teamColor = {}
CoD.teamColor[Enum.team_t.TEAM_FREE] = {}
CoD.teamColor[Enum.team_t.TEAM_FREE].r = 1
CoD.teamColor[Enum.team_t.TEAM_FREE].g = 1
CoD.teamColor[Enum.team_t.TEAM_FREE].b = 1
CoD.teamColor[Enum.team_t.TEAM_ALLIES] = {}
CoD.teamColor[Enum.team_t.TEAM_AXIS] = {}
CoD.teamColor[Enum.team_t.TEAM_NEUTRAL] = {}
if CoD.isZombie == true then
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].r = ColorSet.FactionAllies.r
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].g = ColorSet.FactionAllies.g
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].b = ColorSet.FactionAllies.b
	CoD.teamColor[Enum.team_t.TEAM_AXIS].r = ColorSet.FactionAxis.r
	CoD.teamColor[Enum.team_t.TEAM_AXIS].g = ColorSet.FactionAxis.g
	CoD.teamColor[Enum.team_t.TEAM_AXIS].b = ColorSet.FactionAxis.b
else
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].r = ColorSet.FactionAllies.r
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].g = ColorSet.FactionAllies.g
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].b = ColorSet.FactionAllies.b
	CoD.teamColor[Enum.team_t.TEAM_AXIS].r = ColorSet.FactionAxis.r
	CoD.teamColor[Enum.team_t.TEAM_AXIS].g = ColorSet.FactionAxis.g
	CoD.teamColor[Enum.team_t.TEAM_AXIS].b = ColorSet.FactionAxis.b
	CoD.teamColor[Enum.team_t.TEAM_NEUTRAL].r = 0.1
	CoD.teamColor[Enum.team_t.TEAM_NEUTRAL].g = 0.5
	CoD.teamColor[Enum.team_t.TEAM_NEUTRAL].b = 0.3
end
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR] = {}
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR].r = 0.75
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR].g = 0.75
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR].b = 0.75
CoD.GMLOC_ON = string.char( 20 )
CoD.GMLOC_OFF = string.char( 21 )
CoD.factionColor = {}
CoD.factionColor.seals = {}
CoD.factionColor.seals[Enum.team_t.TEAM_FREE] = CoD.teamColor[Enum.team_t.TEAM_FREE]
CoD.factionColor.seals[Enum.team_t.TEAM_ALLIES] = CoD.teamColor[Enum.team_t.TEAM_ALLIES]
CoD.factionColor.seals[Enum.team_t.TEAM_AXIS] = CoD.teamColor[Enum.team_t.TEAM_AXIS]
CoD.factionColor.seals[Enum.team_t.TEAM_NEUTRAL] = CoD.teamColor[Enum.team_t.TEAM_NEUTRAL]
CoD.factionColor.seals[Enum.team_t.TEAM_SPECTATOR] = CoD.teamColor[Enum.team_t.TEAM_SPECTATOR]
CoD.teamName = {}
CoD.teamName[Enum.team_t.TEAM_FREE] = Engine.Localize( "MPUI_AUTOASSIGN" )
CoD.teamName[Enum.team_t.TEAM_NEUTRAL] = "Neutral"
CoD.teamName[Enum.team_t.TEAM_SPECTATOR] = Engine.Localize( "MPUI_SHOUTCASTER" )
if not CoD.isMultiplayer then
	CoD.teamName[Enum.team_t.TEAM_NEUTRAL] = "NEUTRAL"
	CoD.teamName[Enum.team_t.TEAM_DEAD] = "DEAD"
end
CoD.TweenType = {
	Linear = 0,
	Elastic = 1,
	Back = 2,
	Bounce = 3
}
CoD.textAlpha = 0.7
CoD.textAlphaBlackDark = 0.7
CoD.textAlphaBlackLight = 0.2
CoD.frameSubtitleHeight = CoD.textSize.Default
CoD.frameSubtitleFont = CoD.fonts.Default
CoD.SDSafeWidth = 864
CoD.SDSafeHeight = 648
CoD.HDSafeWidth = 1152
CoD.HDSafeHeight = CoD.SDSafeHeight
CoD.HUDBaseColor = {
	r = 1,
	g = 1,
	b = 1
}
CoD.HUDAlphaEmpty = 0.6
CoD.HUDAlphaFull = 1
CoD.LEVEL_FIRST = "angola"
CoD.LEVEL_COOP_FIRST = "cp_mi_eth_prologue"
CoD.THUMBSTICK_DEFAULT = 0
CoD.THUMBSTICK_SOUTHPAW = 1
CoD.THUMBSTICK_LEGACY = 2
CoD.THUMBSTICK_LEGACYSOUTHPAW = 3
CoD.BUTTONS_DEFAULT = 0
CoD.BUTTONS_EXPERIMENTAL = 1
CoD.BUTTONS_LEFTY = 2
CoD.BUTTONS_NOMAD = 3
CoD.BUTTONS_CHARLIE = 4
CoD.BUTTONS_GUNSLINGER = 5
CoD.BUTTONS_BUMPERJUMPER = 6
CoD.BUTTONS_BUMPERTACTICAL = 7
CoD.BUTTONS_STICKMOVE = 8
CoD.TRIGGERS_DEFAULT = 0
CoD.TRIGGERS_FLIPPED = 1
CoD.START_GAME_CAMPAIGN = 0
CoD.START_GAME_MULTIPLAYER = 1
CoD.START_GAME_ZOMBIES = 2
CoD.DEMO_CONTROLLER_CONFIG_DEFAULT = 0
CoD.DEMO_CONTROLLER_CONFIG_DIGITAL = 1
CoD.DEMO_CONTROLLER_CONFIG_BADBOT = 2
CoD.PS3_INSTALL_NOT_PRESENT = 0
CoD.PS3_INSTALL_PRESENT = 1
CoD.PS3_INSTALL_UNAVAILABLE = 2
CoD.PS3_INSTALL_CORRUPT_OR_OUTDATED = 3
CoD.SENSITIVITY_1 = 0.4
CoD.SENSITIVITY_2 = 0.6
CoD.SENSITIVITY_3 = 0.8
CoD.SENSITIVITY_4 = 1
CoD.SENSITIVITY_5 = 1.2
CoD.SENSITIVITY_6 = 1.4
CoD.SENSITIVITY_7 = 1.6
CoD.SENSITIVITY_8 = 1.8
CoD.SENSITIVITY_9 = 2
CoD.SENSITIVITY_10 = 2.25
CoD.SENSITIVITY_11 = 2.5
CoD.SENSITIVITY_12 = 3
CoD.SENSITIVITY_13 = 3.5
CoD.SENSITIVITY_14 = 4
CoD.DIFFICULTY = {}
CoD.DIFFICULTY[0] = "MENU_RECRUIT"
CoD.DIFFICULTY[1] = "MENU_REGULAR"
CoD.DIFFICULTY[2] = "MENU_HARDENED"
CoD.DIFFICULTY[3] = "MENU_VETERAN"
CoD.DIFFICULTY[4] = "MENU_HEROIC"
CoD.DIFFICULTY_DESC = {}
CoD.DIFFICULTY_DESC[0] = "MENU_DIFF_RECRUIT_DESC"
CoD.DIFFICULTY_DESC[1] = "MENU_DIFF_REGULAR_DESC"
CoD.DIFFICULTY_DESC[2] = "MENU_DIFF_HARDENED_DESC"
CoD.DIFFICULTY_DESC[3] = "MENU_DIFF_VETERAN_DESC"
CoD.DIFFICULTY_DESC[4] = "MENU_DIFF_HEROIC_DESC"
CoD.DIFFICULTY_ICON = {}
CoD.DIFFICULTY_ICON[0] = "playlist_sp_recr"
CoD.DIFFICULTY_ICON[1] = "playlist_sp_reg"
CoD.DIFFICULTY_ICON[2] = "playlist_sp_hard"
CoD.DIFFICULTY_ICON[3] = "playlist_sp_vet"
CoD.DIFFICULTY_ICON[4] = "playlist_sp_real"
CoD.BRIGHTNESS_1 = 0.1
CoD.BRIGHTNESS_2 = 0.2
CoD.BRIGHTNESS_3 = 0.3
CoD.BRIGHTNESS_4 = 0.4
CoD.BRIGHTNESS_5 = 0.5
CoD.BRIGHTNESS_6 = 0.6
CoD.BRIGHTNESS_7 = 0.7
CoD.BRIGHTNESS_8 = 0.8
CoD.BRIGHTNESS_9 = 0.9
CoD.BRIGHTNESS_10 = 1
if CoD.isWIIU then
	CoD.BIND_PLAYER = 0
	CoD.BIND_PLAYER2 = 1
	CoD.BIND_VEHICLE = 2
	CoD.BIND_TWIST = 3
else
	CoD.BIND_PLAYER = 0
	CoD.BIND_VEHICLE = 1
end
CoD.SESSIONMODE_OFFLINE = 0
CoD.SESSIONMODE_SYSTEMLINK = 1
CoD.SESSIONMODE_ONLINE = 2
CoD.GAMEMODE_PUBLIC_MATCH = 0
CoD.GAMEMODE_PRIVATE_MATCH = 1
CoD.GAMEMODE_LOCAL_SPLITSCREEN = 2
CoD.GAMEMODE_LEAGUE_MATCH = 3
CoD.GAMEMODE_FREERUN = 4
CoD.GAMEMODE_THEATER = 5
CoD.GAMEMODE_MANUAL_PLAYLIST = 6
CoD.GAMEMODE_RTS = 7
CoD.OBJECTIVESTATE_EMPTY = 0
CoD.OBJECTIVESTATE_ACTIVE = 1
CoD.OBJECTIVESTATE_INVISIBLE = 2
CoD.OBJECTIVESTATE_DONE = 3
CoD.OBJECTIVESTATE_CURRENT = 4
CoD.OBJECTIVESTATE_FAILED = 5
CoD.FRIEND_NOTJOINABLE = 0
CoD.FRIEND_JOINABLE = 1
CoD.FRIEND_AUTOJOINABLE = 2
CoD.FRIEND_AUTOJOINED = 3
CoD.MaxPlayerListRows = 19
CoD.playerListType = {
	friend = 0,
	recentPlayer = 1,
	party = 2,
	platform = 3,
	facebook = 4,
	elite = 5,
	gameInvites = 6,
	clan = 7,
	friendRequest = 8,
	leagueFriend = 9,
	leaderboard = -1
}
CoD.STATS_LOCATION_NORMAL = 0
CoD.STATS_LOCATION_FORCE_NORMAL = 1
CoD.STATS_LOCATION_STABLE = 2
CoD.STATS_LOCATION_OTHERPLAYER = 3
CoD.MILESTONE_GLOBAL = 0
CoD.MILESTONE_WEAPON = 1
CoD.MILESTONE_GAMEMODE = 2
CoD.MILESTONE_GROUP = 3
CoD.MILESTONE_ATTACHMENTS = 4
CoD.MILESTONE_SPECIALIST = 5
CoD.MILESTONE_DAILY = 6
CoD.LB_FILTER_NONE = 0
CoD.LB_FILTER_FRIENDS = 1
CoD.LB_FILTER_LOBBY_MEMBERS = 2
CoD.LB_FILTER_ELITE = 3
CoD.LB_FILTER_FACEBOOK_FRIENDS = 4
CoD.REQUEST_MULTI_LB_READ_COMBAT_RECORD_DATA = 1
CoD.REQUEST_MULTI_LB_READ_MINI_LBS = 2
CoD.MaxMomentum = 0
CoD.SplitscreenMultiplier = 2
CoD.SplitscreenNotificationMultiplier = 1.5
if not CoD.LeaguesData then
	CoD.LeaguesData = {}
	CoD.LeaguesData.CurrentTeamInfo = {}
	CoD.LeaguesData.CurrentTeamSubdivisionInfo = {}
	CoD.LeaguesData.TeamSubdivisionInfo = {}
	CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus = {}
	CoD.LeaguesData.TeamSubdivisionInfo.data = {}
end
CoD.LeaguesData.LEAGUE_OUTCOME_BASE = 0
CoD.LeaguesData.LEAGUE_OUTCOME_WINNER = 1
CoD.LeaguesData.LEAGUE_OUTCOME_LOSER = 2
CoD.LeaguesData.LEAGUE_OUTCOME_PRE_LOSER = 3
CoD.LeaguesData.LEAGUE_OUTCOME_RESET = 4
CoD.LeaguesData.LEAGUE_OUTCOME_DRAW = 5
CoD.LeaguesData.LEAGUE_STAT_FLOAT_SKILL = 0
CoD.LeaguesData.LEAGUE_STAT_FLOAT_VARIANCE = 1
CoD.LeaguesData.LEAGUE_STAT_FLOAT_PLACEMENT_SKILL = 2
CoD.LeaguesData.LEAGUE_STAT_FLOAT_COUNT = 3
CoD.LeaguesData.LEAGUE_STAT_INT_RANKPOINTS = 0
CoD.LeaguesData.LEAGUE_STAT_INT_PLAYED = 1
CoD.LeaguesData.LEAGUE_STAT_INT_WINS = 2
CoD.LeaguesData.LEAGUE_STAT_INT_LOSSES = 3
CoD.LeaguesData.LEAGUE_STAT_INT_BONUS_USED = 4
CoD.LeaguesData.LEAGUE_STAT_INT_BONUS_TIME = 5
CoD.LeaguesData.LEAGUE_STAT_INT_STREAK = 6
CoD.LeaguesData.LEAGUE_STAT_INT_CAREER_WINS = 7
CoD.LeaguesData.LEAGUE_STAT_INT_COUNT = 8
CoD.PARTYHOST_STATE_NONE = 0
CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS = 1
CoD.PARTYHOST_STATE_MODIFYING_CAC = 2
CoD.PARTYHOST_STATE_MODIFYING_REWARDS = 3
CoD.PARTYHOST_STATE_VIEWING_PLAYERCARD = 4
CoD.PARTYHOST_STATE_SELECTING_PLAYLIST = 5
CoD.PARTYHOST_STATE_SELECTING_MAP = 6
CoD.PARTYHOST_STATE_SELECTING_GAMETYPE = 7
CoD.PARTYHOST_STATE_VIEWING_COD_TV = 8
CoD.PARTYHOST_STATE_COUNTDOWN_CANCELLED = 9
CoD.partyHostStateText = {}
CoD.partyHostStateText[CoD.PARTYHOST_STATE_NONE] = ""
CoD.partyHostStateText[CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS] = Engine.Localize( "MENU_EDITING_GAME_OPTIONS" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_MODIFYING_CAC] = Engine.Localize( "MENU_MODIFYING_CAC" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_MODIFYING_REWARDS] = Engine.Localize( "MENU_MODIFYING_REWARDS" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_VIEWING_PLAYERCARD] = Engine.Localize( "MENU_VIEWING_PLAYERCARD" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_SELECTING_PLAYLIST] = Engine.Localize( "MENU_VIEWING_PLAYLISTS" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_SELECTING_MAP] = Engine.Localize( "MENU_SELECTING_MAP" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_SELECTING_GAMETYPE] = Engine.Localize( "MENU_SELECTING_GAMETYPE" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_VIEWING_COD_TV] = Engine.Localize( "MENU_VIEWING_COD_TV" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_COUNTDOWN_CANCELLED] = Engine.Localize( "MENU_COUNTDOWN_CANCELLED" )
CoD.SESSION_REJOIN_CANCEL_JOIN_SESSION = 0
CoD.SESSION_REJOIN_CHECK_FOR_SESSION = 1
CoD.SESSION_REJOIN_JOIN_SESSION = 2
CoD.FEATURE_BAN_LIVE_MP = 1
CoD.FEATURE_BAN_LIVE_ZOMBIE = 2
CoD.FEATURE_BAN_LEADERBOARD_WRITE_MP = 3
CoD.FEATURE_BAN_LEADERBOARD_WRITE_ZOMBIE = 4
CoD.FEATURE_BAN_MP_SPLIT_SCREEN = 5
CoD.FEATURE_BAN_EMBLEM_EDITOR = 6
CoD.FEATURE_BAN_PIRACY = 7
CoD.FEATURE_BAN_PRESTIGE = 8
CoD.FEATURE_BAN_LIVE_STREAMING = 9
CoD.FEATURE_BAN_LIVE_STREAMING_CAMERA = 10
CoD.FEATURE_BAN_LEAGUES_GAMEPLAY = 11
CoD.FEATURE_BAN_HOSTING = 12
CoD.FEATURE_BAN_PRESTIGE_EXTRAS = 13
CoD.SYSINFO_VERSION_NUMBER = 0
CoD.SYSINFO_CONNECTIVITY_INFO = 1
CoD.SYSINFO_NAT_TYPE = 2
CoD.SYSINFO_CUSTOMER_SUPPORT_LINK = 3
CoD.SYSINFO_BANDWIDTH = 4
CoD.SYSINFO_IP_ADDRESS = 5
CoD.SYSINFO_EXTERNAL_IP_ADDRESS = 6
CoD.SYSINFO_INTERNAL_IP_ADDRESS = 7
CoD.SYSINFO_GEOGRAPHICAL_REGION = 8
CoD.SYSINFO_Q = 9
CoD.SYSINFO_CONSOLE_ID = 10
CoD.SYSINFO_MAC_ADDRESS = 11
CoD.SYSINFO_NAT_TYPE_LOBBY = 12
CoD.SYSINFO_CONNECTION_TYPE = 13
CoD.RECORD_EVENT_DW_EREG_ENTRY_ERROR = 46
CoD.RECORD_EVENT_RATE_MATCH = 400
CoD.RECORD_EVENT_VOTE_MTX = 425
CoD.CodCaster_TeamIdentity = {}
CoD.EMBLEM = 0
CoD.BACKING = 1
CoD.emblem = {}
CoD.emblem.INVALID_ID = -1
CoD.emblem.MAX_COLOR_COMPONENT_VALUE = 255
CoD.emblem.MAX_GRADIENT_SLIDER_VALUE = 100
CoD.emblem.CLIPBOARDSTATE = {
	FULL = 0,
	EMPTY = 1
}
CoD.emblem.ADDDECAL = {
	REPLACE = 0,
	INSERT = 1
}
CoD.Paintshop = {}
CoD.Paintshop.ChooseWeapon = {}
CoD.Paintshop.ChooseWeapon = {
	WEAPONLIST = 1,
	PAINTJOBS = 2
}
CoD.Paintshop.View = {}
CoD.Paintshop.View = {
	{
		view_name = "left",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT,
		view_string_ref = "MENU_PAINTSHOP_VIEW_LEFT",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	},
	{
		view_name = "top",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP,
		view_string_ref = "MENU_PAINTSHOP_VIEW_TOP",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	},
	{
		view_name = "right",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT,
		view_string_ref = "MENU_PAINTSHOP_VIEW_RIGHT",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	}
}
CoD.emblem.BlackMarketDecalCategory = 5
CoD.emblem.DECALTABS = {
	{
		type = "ICON",
		displayName = "MENU_EMBLEM_SELECTOR_ICONS_TAB",
		category = 1
	},
	{
		type = "PATTERNS",
		displayName = "MENU_EMBLEM_SELECTOR_PATTERNS_TAB",
		category = 2
	},
	{
		type = "TOOLS",
		displayName = "MENU_EMBLEM_SELECTOR_TOOLS_TAB",
		category = 3
	},
	{
		type = "TYPE",
		displayName = "MENU_EMBLEM_SELECTOR_TYPE_TAB",
		category = 4
	},
	{
		type = "BLACKMARKET",
		displayName = "MENU_BLACK_MARKET",
		category = 5
	}
}
CoD.emblem.BlackMarketEmblemCategory = 3
CoD.emblem.MaterialCategory = {
	{
		category = 1,
		type = "general",
		name = "MENU_EMBLEM_MATERIAL_GENERAL"
	},
	{
		category = 2,
		type = "camo",
		name = "MENU_EMBLEM_MATERIAL_CAMO"
	},
	{
		category = 3,
		type = "loot",
		name = "MENU_BLACK_MARKET"
	}
}
CoD.Craft = {}
CoD.Craft.WeaponGroupNames = {
	{
		index = 1,
		weapon_category = "weapon_smg",
		lowercaseName = "MPUI_SUB_MACHINE_GUNS",
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_smg"
	},
	{
		index = 2,
		weapon_category = "weapon_assault",
		lowercaseName = "MPUI_ASSAULT_RIFLES",
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_ar"
	},
	{
		index = 3,
		weapon_category = "weapon_cqb",
		lowercaseName = "MPUI_CQBS",
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_shotgun"
	},
	{
		index = 4,
		weapon_category = "weapon_lmg",
		lowercaseName = "MPUI_LIGHT_MACHINE_GUNS",
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_lmg"
	},
	{
		index = 5,
		weapon_category = "weapon_sniper",
		lowercaseName = "MPUI_SNIPER_RIFLES",
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_sniper"
	},
	{
		index = 6,
		weapon_category = "secondary",
		lowercaseName = "MPUI_WEAPON_SECONDARIES",
		name = "MPUI_WEAPON_SECONDARIES_CAPS",
		loadout_slot = "secondary",
		weapon_image = "t7_wpn_build_kit_pistol"
	}
}
CoD.Craft.PublishedPaintjobsGroupNames = {
	{
		index = 1,
		weapon_category = "",
		disabled = false,
		name = "MENU_ALL_CAPS",
		loadout_slot = ""
	},
	{
		index = 2,
		weapon_category = "weapon_smg",
		disabled = true,
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 3,
		weapon_category = "weapon_assault",
		disabled = true,
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 4,
		weapon_category = "weapon_cqb",
		disabled = true,
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 5,
		weapon_category = "weapon_lmg",
		disabled = true,
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 6,
		weapon_category = "weapon_sniper",
		disabled = true,
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 7,
		weapon_category = "weapon_launcher",
		disabled = true,
		name = "MPUI_WEAPON_LAUNCHER_CAPS",
		loadout_slot = "secondary"
	},
	{
		index = 8,
		weapon_category = "weapon_knife",
		disabled = true,
		name = "MPUI_WEAPON_KNIFE_CAPS",
		loadout_slot = "secondary"
	}
}
CoD.BubbleGumBuffs = {
	NumBuffsPerPack = 5,
	NumPacks = 10
}
CoD.StoreFeaturedCategory = "FEATURED"
CoD.CONTENT_DEV_MAP_INDEX = -1
CoD.CONTENT_ORIGINAL_MAP_INDEX = 0
CoD.CONTENT_DLC0_INDEX = 1
CoD.CONTENT_DLCZM0_INDEX = 2
CoD.CONTENT_DLC1_INDEX = 3
CoD.CONTENT_DLC2_INDEX = 4
CoD.CONTENT_DLC3_INDEX = 5
CoD.CONTENT_DLC4_INDEX = 6
CoD.CONTENT_DLC5_INDEX = 7
CoD.CONTENT_DLC6_INDEX = 12
CoD.CONTENT_MODS_INDEX = 999
CoD.DLC_CAMO_MENU_VIEWED = 0
CoD.DLC_BACKINGS_MENU_VIEWED = 1
CoD.DLC_RETICLES_MENU_VIEWED = 2
CoD.INGAMESTORE_MENU_VIEWED = 3
CoD.UI_SCREENSHOT_TYPE_SCREENSHOT = 0
CoD.UI_SCREENSHOT_TYPE_THUMBNAIL = 1
CoD.UI_SCREENSHOT_TYPE_MOTD = 2
CoD.UI_SCREENSHOT_TYPE_EMBLEM = 3
CoD.EntityType = {}
CoD.EntityType.ET_GENERAL = 0
CoD.EntityType.ET_PLAYER = 1
CoD.EntityType.ET_PLAYER_CORPSE = 2
CoD.EntityType.ET_ITEM = 3
CoD.EntityType.ET_MISSILE = 4
CoD.EntityType.ET_INVISIBLE = 5
CoD.EntityType.ET_SCRIPTMOVER = 6
CoD.EntityType.ET_SOUND_BLEND = 7
CoD.EntityType.ET_FX = 8
CoD.EntityType.ET_LOOP_FX = 9
CoD.EntityType.ET_PRIMARY_LIGHT = 10
CoD.EntityType.ET_TURRET = 11
CoD.EntityType.ET_HELICOPTER = 12
CoD.EntityType.ET_PLANE = 13
CoD.EntityType.ET_VEHICLE = 14
CoD.EntityType.ET_VEHICLE_CORPSE = 15
CoD.EntityType.ET_ACTOR = 16
CoD.EntityType.ET_ACTOR_SPAWNER = 17
CoD.EntityType.ET_ACTOR_CORPSE = 18
CoD.EntityType.ET_STREAMER_HINT = 19
CoD.EntityType.ET_ZBARRIER = 20
CoD.SupplyDrop = {}
CoD.SupplyDrop.SUPPLY_DROP_CRATE_STATE_NONE = 0
CoD.SupplyDrop.SUPPLY_DROP_CRATE_STATE_CAPTURE = 1
CoD.SupplyDrop.SUPPLY_DROP_CRATE_STATE_HACK = 2
CoD.SupplyDrop.SUPPLY_DROP_CRATE_STATE_DISARM = 3
CoD.IsLeagueOrCustomMatch = function ()
	local f35_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	if not f35_local0 then
		f35_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	end
	return f35_local0
end

CoD.SetupSafeAreaOverlay = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:setPriority( 100 )
	self:setRGB( 0, 0, 1 )
	self:setAlpha( 0.5 )
	if not CoD.isPC then
		self:setupSafeAreaBoundary()
	end
	return self
end

CoD.getClanTag = function ( f37_arg0 )
	if f37_arg0 == nil then
		return ""
	elseif Engine.CanViewContent() == false then
		return ""
	else
		return f37_arg0
	end
end

CoD.getPartyHostStateText = function ( f38_arg0 )
	return CoD.partyHostStateText[f38_arg0]
end

CoD.GetRankName = function ( f39_arg0, f39_arg1, f39_arg2 )
	if not f39_arg2 then
		f39_arg2 = Engine.CurrentSessionMode()
	end
	if f39_arg1 == 0 then
		return Engine.GetRankName( f39_arg0, f39_arg2 )
	elseif f39_arg1 == Engine.GetPrestigeCap( f39_arg2 ) then
		return Engine.Localize( "MENU_PRESTIGE_MASTER" )
	else
		return Engine.Localize( "MPUI_PRESTIGE_N", f39_arg1 )
	end
end

CoD.GetRankOrParagonIcon = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
	if f40_arg0 < 0 or f40_arg1 < 0 then
		return ""
	elseif IsGameModeParagonCapable( f40_arg3 ) and f40_arg1 == Engine.GetPrestigeCap( f40_arg3 ) and f40_arg2 ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
		return Engine.GetParagonIconById( f40_arg2, f40_arg3 )
	else
		return Engine.GetRankIcon( f40_arg0, f40_arg1, f40_arg3 )
	end
end

CoD.ModeStringToMode = function ( f41_arg0 )
	if f41_arg0 == "mp" then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif f41_arg0 == "cp" then
		return Enum.eModes.MODE_CAMPAIGN
	elseif f41_arg0 == "zm" then
		return Enum.eModes.MODE_ZOMBIES
	else
		return Enum.eModes.MODE_INVALID
	end
end

CoD.ModeToModeString = function ( f42_arg0 )
	if f42_arg0 == Enum.eModes.MODE_MULTIPLAYER then
		return "mp"
	elseif f42_arg0 == Enum.eModes.MODE_CAMPAIGN then
		return "cp"
	elseif f42_arg0 == Enum.eModes.MODE_ZOMBIES then
		return "zm"
	else
		
	end
end

CoD.WeaponOptionFilterStringToEnum = function ( f43_arg0 )
	if f43_arg0 == "zm" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM
	elseif f43_arg0 == "mp" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP
	elseif f43_arg0 == "cp" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM
	elseif f43_arg0 == "loot" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM
	else
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT
	end
end

CoD.WeaponOptionFilterToString = function ( f44_arg0 )
	if f44_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM then
		return "zm"
	elseif f44_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP then
		return "mp"
	elseif f44_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP then
		return "cp"
	elseif f44_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM then
		return "loot"
	elseif f44_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS then
		return "extras"
	else
		
	end
end

CoD.useController = true
if Engine.IsUsingCursor() == true then
	CoD.useController = false
end
CoD.useMouse = false
if CoD.isPC == true then
	CoD.useMouse = true
	CoD.useController = true
end
CoD.isOnlineGame = function ()
	if Engine.SessionMode_IsOnlineGame() then
		return true
	else
		return false
	end
end

CoD.isRankedGame = function ()
	local f46_local0
	if CoD.isOnlineGame() == true then
		f46_local0 = not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	else
		f46_local0 = false
	end
	return f46_local0
end

CoD.isHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

CoD.canLeaveGame = function ( f48_arg0 )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[f48_arg0 + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[f48_arg0 + 1] > 0 then
			return false
		end
		if CoD.isRankedGame() and CoD.isHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
			return false
		end
	end
	local f48_local0
	if not Engine.IsVisibilityBitSet( f48_arg0, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		f48_local0 = not Engine.IsVisibilityBitSet( f48_arg0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
	else
		f48_local0 = false
	end
	return f48_local0
end

CoD.resetGameModes = function ()
	if CoD.isSinglePlayer then
		Engine.ExecNow( nil, "exec gamedata/configs/common/default_xboxlive_sp.cfg" )
	else
		Engine.ExecNow( nil, "exec gamedata/configs/common/default_xboxlive.cfg" )
	end
	Engine.GameModeResetModes()
	Engine.Exec( nil, "freedemomemory" )
end

CoD.isPartyHost = function ()
	local f50_local0 = Engine.PrivatePartyHost()
	if not f50_local0 then
		f50_local0 = not Engine.InPrivateParty()
	end
	return f50_local0
end

CoD.isXuidPrivatePartyHost = function ( f51_arg0 )
	return Engine.InPrivateParty() and Engine.IsXuidPrivatePartyHost( f51_arg0 ) == true
end

CoD.separateNumberWithCommas = function ( f52_arg0 )
	local f52_local0 = string.format( "%.0f", f52_arg0 )
	local f52_local1 = string.len( f52_local0 )
	local f52_local2 = nil
	for f52_local3 = f52_local1, 1, -3 do
		local f52_local6 = f52_local3 - 2
		if f52_local6 < 1 then
			f52_local6 = 1
		end
		if f52_local2 == nil then
			f52_local2 = string.sub( f52_local0, f52_local6, f52_local3 )
		else
			f52_local2 = string.sub( f52_local0, f52_local6, f52_local3 ) .. "," .. f52_local2
		end
	end
	return f52_local2
end

CoD.GetLocalizedTierText = function ( f53_arg0, f53_arg1 )
	local f53_local0 = ""
	if f53_arg0 ~= nil and f53_arg1 ~= nil then
		local f53_local1, f53_local2 = false
		local f53_local3 = tonumber( Engine.TableLookupGetColumnValueForRow( f53_arg0, f53_arg1, 1 ) )
		if f53_local3 > 0 or tonumber( Engine.TableLookupGetColumnValueForRow( f53_arg0, f53_arg1 + 1, 1 ) ) == 1 then
			f53_local1 = true
		end
		if f53_local1 == true then
			f53_local0 = Engine.Localize( "CHALLENGE_TIER_" .. f53_local3 )
		end
	end
	return f53_local0
end

CoD.IsTieredChallenge = function ( f54_arg0, f54_arg1, f54_arg2 )
	if f54_arg1 ~= nil and f54_arg2 ~= nil then
		if tonumber( Engine.TableLookupGetColumnValueForRow( f54_arg1, f54_arg2, 1 ) ) > 0 or tonumber( Engine.TableLookupGetColumnValueForRow( f54_arg1, f54_arg2 + 1, 1 ) ) == 1 then
			return true
		end
	end
	return false
end

CoD.GetUnlockRankAndLevelForItemIndex = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
	local f55_local0 = Engine.GetItemUnlockLevel( f55_arg1, f55_arg3 )
	return Engine.Localize( f55_arg2, CoD.GetRankName( f55_local0, 0, f55_arg3 ), f55_local0 + 1 )
end

CoD.GetUnlockStringForItemIndex = function ( f56_arg0, f56_arg1, f56_arg2 )
	if not f56_arg2 then
		f56_arg2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	if not Engine.HasDLCForItem( f56_arg0, f56_arg1, f56_arg2 ) then
		local f56_local0 = Engine.GetDLCNameForItem( f56_arg1 )
		if f56_local0 then
			return Engine.Localize( "MENU_" .. f56_local0 .. "_REQUIRED_HINT" )
		end
	end
	return CoD.GetUnlockRankAndLevelForItemIndex( f56_arg0, f56_arg1, "MENU_UNLOCKED_AT", f56_arg2 )
end

CoD.GetUnlockLevelString = function ( f57_arg0, f57_arg1 )
	return CoD.GetUnlockStringForItemIndex( f57_arg0, Engine.GetItemIndex( f57_arg1 ) )
end

CoD.PrestigeAvail = function ( f58_arg0 )
	if IsStarterPack( f58_arg0 ) then
		return false
	end
	local f58_local0
	if tonumber( Engine.GetStatByName( f58_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) - 1 or tonumber( Engine.GetStatByName( f58_arg0, "RANKXP" ) ) < CoD.MAX_RANKXP then
		f58_local0 = false
	else
		f58_local0 = true
	end
	return f58_local0
end

CoD.PrestigeNext = function ( f59_arg0 )
	if IsStarterPack( f59_arg0 ) then
		return false
	end
	local f59_local0
	if tonumber( Engine.GetStatByName( f59_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) or tonumber( Engine.GetStatByName( f59_arg0, "RANK" ) ) ~= tonumber( CoD.MAX_RANK ) then
		f59_local0 = false
	else
		f59_local0 = true
	end
	return f59_local0
end

CoD.PrestigeNextLevelText = function ( f60_arg0 )
	local f60_local0 = tonumber( Engine.GetStatByName( f60_arg0, "PLEVEL" ) )
	local f60_local1 = tonumber( CoD.MAX_PRESTIGE )
	local f60_local2 = 1
	if f60_local1 - 1 <= f60_local0 then
		f60_local2 = ""
	end
	return f60_local2
end

CoD.PrestigeFinish = function ( f61_arg0 )
	return tonumber( Engine.GetStatByName( f61_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) - 1
end

CoD.CanRankUp = function ( f62_arg0 )
	local f62_local0 = tonumber( Engine.GetStatByName( f62_arg0, "RANK" ) )
	local f62_local1 = tonumber( CoD.MAX_RANK )
	local f62_local2 = tonumber( Engine.GetStatByName( f62_arg0, "PLEVEL" ) )
	local f62_local3 = tonumber( CoD.MAX_PRESTIGE )
	if IsStarterPack( f62_arg0 ) then
		local f62_local4
		if f62_local0 >= tonumber( CoD.MAX_RANK_STARTER_PACK ) or f62_local0 >= f62_local1 or f62_local2 ~= 0 then
			f62_local4 = false
		else
			f62_local4 = true
		end
		return f62_local4
	else
		local f62_local5
		if not (f62_local0 < f62_local1 or f62_local2 < f62_local3) or f62_local3 <= f62_local2 then
			f62_local5 = false
		else
			f62_local5 = true
		end
	end
	return f62_local5
end

CoD.GetMaxRankCap = function ( f63_arg0 )
	if IsStarterPack( f63_arg0 ) then
		return tonumber( CoD.MAX_RANK_STARTER_PACK )
	else
		return tonumber( CoD.MAX_RANK )
	end
end

CoD.SetupButtonLock = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4 )
	local f64_local0 = Engine.GetItemIndex( f64_arg2 )
	local f64_local1 = false
	if f64_arg1 == nil then
		if Engine.IsItemLockedForAll( f64_local0 ) then
			f64_local1 = true
		end
	elseif Engine.IsItemLocked( f64_arg1, f64_local0 ) then
		f64_local1 = true
	end
	if f64_local1 == true then
		f64_arg0:lock()
		f64_arg0.hintText = CoD.GetUnlockLevelString( f64_arg1, f64_arg2 )
	else
		f64_arg0.hintText = Engine.Localize( f64_arg3 )
		f64_arg0:registerEventHandler( "button_action", f64_arg4 )
	end
	f64_arg0.itemName = f64_arg2
end

CoD.CheckButtonLock = function ( f65_arg0, f65_arg1 )
	if f65_arg0.itemName == nil then
		return false
	end
	local f65_local0 = Engine.GetItemIndex( f65_arg0.itemName )
	local f65_local1 = false
	if f65_arg1 == nil then
		if Engine.IsItemLockedForAll( f65_local0 ) then
			f65_local1 = true
		end
	elseif Engine.IsItemLocked( f65_arg1, f65_local0 ) then
		f65_local1 = true
	end
	return f65_local1
end

CoD.canInviteToGame = function ( f66_arg0, f66_arg1 )
	if false then
		return false
	elseif CoD.isPC and Engine.IsFriendFromXUID( f66_arg0, f66_arg1 ) ~= true then
		return false
	elseif IsInTheaterMode() then
		return false
	elseif true == Dvar.partyPrivacyEnabled:get() and Engine.GetPartyPrivacy() == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		return false
	end
	local f66_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f66_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	return Engine.IsLobbyActive( f66_local0 ) and Engine.IsPlayerInvitable( f66_arg0, f66_arg1 ) and Engine.GetLobbyClientCount( f66_local0 ) < Engine.GetLobbyMaxClients( f66_local0 )
end

CoD.canJoinSession = function ( f67_arg0, f67_arg1 )
	if false then
		return false
	elseif Engine.IsMemberInParty( f67_arg0, f67_arg1 ) then
		return false
	else
		return Engine.GetPlayerJoinState( f67_arg0, f67_arg1 ) == CoD.FRIEND_JOINABLE
	end
end

CoD.isInTitle = function ( f68_arg0, f68_arg1 )
	return Engine.IsPlayerInTitle( f68_arg0, f68_arg1 )
end

CoD.canAutoJoinSession = function ( f69_arg0, f69_arg1 )
	return Engine.IsPlayerJoinable( f69_arg0, f69_arg1 ) == CoD.FRIEND_AUTOJOINABLE
end

CoD.canMutePlayer = function ( f70_arg0, f70_arg1 )
	local f70_local0 = Engine.GetXUID( f70_arg0 ) == f70_arg1
	local f70_local1 = Engine.IsPlayerInCurrentSession( f70_arg0, f70_arg1 )
	f70_local1 = f70_local1.inCurrentSession
	if f70_local0 then
		return false
	elseif not f70_local1 then
		return false
	else
		return true
	end
end

CoD.isPlayerMuted = function ( f71_arg0, f71_arg1 )
	return Engine.GetMutedStatus( f71_arg0, f71_arg1 ) == 1
end

CoD.canSendFriendRequest = function ( f72_arg0, f72_arg1 )
	if CoD.isPC then
		return false
	elseif Engine.IsGuestByXuid( f72_arg1 ) == true then
		return false
	else
		local f72_local0
		if Engine.GetXUID( f72_arg0 ) ~= f72_arg1 then
			f72_local0 = not Engine.IsFriendFromXUID( f72_arg0, f72_arg1 )
		else
			f72_local0 = false
		end
	end
	return f72_local0
end

CoD.isPlayerInLobby = function ( f73_arg0 )
	local f73_local0 = {}
	f73_local0 = Engine.GetPlayersInLobby()
	if f73_local0 == nil then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f73_arg0 ) then
			return true
		else
			return false
		end
	end
	for f73_local4, f73_local5 in pairs( f73_local0 ) do
		if f73_local5.xuid == f73_arg0 then
			return true
		end
	end
	return false
end

CoD.canKickPlayer = function ( f74_arg0, f74_arg1 )
	if Engine.IsGuestByXuid( f74_arg1 ) == true then
		return false
	elseif Engine.GetXUID( f74_arg0 ) == f74_arg1 then
		return false
	end
	local f74_local0 = Engine.InLobby()
	local f74_local1 = Engine.GameHost()
	local f74_local2 = Engine.IsInGame()
	local f74_local3
	if Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) ~= true and Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) ~= true then
		f74_local3 = false
	else
		f74_local3 = true
	end
	local f74_local4 = Engine.PrivatePartyHost()
	local f74_local5 = Engine.IsMemberInParty( f74_arg0, f74_arg1 ) == true
	local f74_local6 = CoD.isPlayerInLobby( f74_arg1 )
	if f74_local2 then
		return false
	elseif not f74_local6 then
		return false
	elseif f74_local0 and not f74_local3 then
		return false
	elseif f74_local0 and f74_local1 and f74_local3 then
		return true
	elseif not f74_local4 then
		return false
	elseif not f74_local5 then
		return false
	end
	return true
end

CoD.invitePlayer = function ( f75_arg0, f75_arg1, f75_arg2 )
	if CoD.canInviteToGame( f75_arg0, f75_arg1 ) then
		Engine.SendInviteByXuid( f75_arg0, f75_arg1, 0 )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.invitePlayerByGamertag = function ( f76_arg0, f76_arg1, f76_arg2 )
	if CoD.perController[f76_arg0].invites == nil then
		CoD.perController[f76_arg0].invites = {}
	end
	local f76_local0 = nil
	for f76_local4, f76_local5 in pairs( CoD.perController[f76_arg0].invites ) do
		if f76_local5.xuid == f76_arg1 then
			f76_local0 = f76_local5
			break
		end
	end
	if f76_local0 == nil then
		table.insert( CoD.perController[f76_arg0].invites, {
			xuid = f76_arg1,
			timestamp = Engine.seconds()
		} )
	elseif f76_local0.timestamp + 15 < Engine.seconds() then
		f76_local0.timestamp = Engine.seconds()
	else
		return 
	end
	if CoD.canInviteToGame( f76_arg0, f76_arg1 ) then
		Engine.LobbyVM_CallFunc( "Invite", {
			controller = f76_arg0,
			xuid = f76_arg1,
			gamertag = f76_arg2
		} )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.joinPlayer = function ( f77_arg0, f77_arg1 )
	if CoD.canJoinSession( f77_arg0, f77_arg1 ) then
		Engine.JoinPlayerSessionByXuid( f77_arg0, f77_arg1 )
	end
end

CoD.sendFriendRequest = function ( f78_arg0, f78_arg1 )
	if CoD.canSendFriendRequest( f78_arg0, f78_arg1 ) then
		if CoD.isXBOX then
			Engine.Exec( f78_arg0, "xaddfriend " .. f78_arg1 )
		elseif CoD.isPS3 or CoD.isWIIU then
			Engine.Exec( f78_arg0, "xaddfriend " .. f78_arg1 )
		end
	end
end

CoD.inviteAccepted = function ( f79_arg0, f79_arg1 )
	Engine.Exec( f79_arg1.controller, "disableallclients" )
	Engine.Exec( f79_arg1.controller, "setclientbeingusedandprimary" )
	Engine.ExecNow( f79_arg1.controller, "initiatedemonwareconnect" )
	local f79_local0 = CoD.OverlayUtility.CreateOverlay( controller, f79_arg0, "ConnectingToDemonware" )
	f79_local0.inviteAccepted = true
	f79_local0.callingMenu = f79_arg0
end

CoD.viewGamerCard = function ( f80_arg0, f80_arg1, f80_arg2, f80_arg3 )
	if CoD.isXBOX or CoD.isPC then
		Engine.Exec( f80_arg0, "xshowgamercard " .. tostring( f80_arg2 ) )
	elseif CoD.isPS3 then
		if f80_arg3 == CoD.playerListType.friend then
			Engine.Exec( f80_arg0, "xshowgamercard " .. f80_arg2 )
		elseif f80_arg3 == CoD.playerListType.recentPlayer then
			Engine.Exec( f80_arg0, "xshowrecentplayersgamercard " .. tostring( f80_arg2 ) )
		else
			Engine.Exec( f80_arg0, "xshowgamercardbyname " .. f80_arg1 )
		end
	end
end

CoD.acceptGameInvite = function ( f81_arg0, f81_arg1 )
	if CoD.isWIIU or CoD.isPC then
		Engine.Exec( f81_arg0, "acceptgameinvite " .. f81_arg1 )
	end
end

CoD.acceptFriendRequest = function ( f82_arg0, f82_arg1, f82_arg2 )
	if CoD.isWIIU then
		Engine.Exec( f82_arg0, "acceptfriendrequest " .. f82_arg1 .. " " .. f82_arg2 )
	end
end

CoD.IsLayerEmpty = function ( f83_arg0, f83_arg1 )
	if Engine.GetSelectedLayerIconID( f83_arg0, f83_arg1 ) == CoD.emblem.INVALID_ID then
		return true
	else
		return false
	end
end

CoD.SetCustomization = function ( f84_arg0, f84_arg1, f84_arg2 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Customization.getModel( f84_arg0 ), f84_arg2 ), f84_arg1 )
end

CoD.GetCustomization = function ( f85_arg0, f85_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( DataSources.Customization.getModel( f85_arg0 ), f85_arg1 ) )
end

CoD.SetEditorProperties = function ( f86_arg0, f86_arg1, f86_arg2 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.EmblemProperties.getModel( f86_arg0 ), f86_arg2 ), f86_arg1 )
end

CoD.GetEditorProperties = function ( f87_arg0, f87_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( DataSources.EmblemProperties.getModel( f87_arg0 ), f87_arg1 ) )
end

CoD.GetSelectedColor = function ( f88_arg0 )
	local f88_local0 = CoD.GetEditorProperties( f88_arg0, "isGradientMode" )
	local f88_local1 = CoD.GetEditorProperties( f88_arg0, "colorNum" )
	local f88_local2 = nil
	if f88_local1 ~= nil and f88_local0 ~= nil then
		if f88_local0 == 1 and f88_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return Engine.GetSelectedLayerColor1( f88_arg0 )
		else
			return Engine.GetSelectedLayerColor( f88_arg0 )
		end
	else
		return nil
	end
end

CoD.SetNoColorDataModel = function ( f89_arg0 )
	local f89_local0 = Engine.GetSelectedLayerColor( f89_arg0 )
	local f89_local1 = Engine.GetSelectedLayerColor1( f89_arg0 )
	CoD.SetEditorProperties( f89_arg0, 0, "isColor0NoColor" )
	CoD.SetEditorProperties( f89_arg0, 0, "isColor1NoColor" )
	if f89_local0.red == f89_local1.red and f89_local0.green == f89_local1.green and f89_local0.blue == f89_local1.blue then
		if f89_local0.alpha == 0 then
			CoD.SetEditorProperties( f89_arg0, 1, "isColor0NoColor" )
		end
		if f89_local1.alpha == 0 then
			CoD.SetEditorProperties( f89_arg0, 1, "isColor1NoColor" )
		end
	end
end

CoD.slotContainerAlpha = 0.04
CoD.nullSpecialtyName = "PERKS_NONE"
CoD.nullKillstreakName = "KILLSTREAK_NULL"
CoD.ChangeClassMenuName = "ChooseClass_InGame"
CoD.UnlockablesTable = nil
CoD.WeaponListSessionMode = nil
CoD.GenericCACSelectionPreLoadFunc = function ( f90_arg0, f90_arg1, f90_arg2, f90_arg3 )
	f90_arg0:setModel( CoD.perController[f90_arg1].classModel )
	if not f90_arg2 then
		f90_arg2 = CoD.perController[f90_arg1].weaponCategory
	end
	if f90_arg2 ~= "" then
		DataSources.Unlockables.setCurrentFilterItem( f90_arg2 )
	end
	f90_arg0.restoreState = function ()
		local f91_local0 = DataSources.Unlockables.getCurrentFilterItem()
		local f91_local1 = f90_arg0.selectionList.dataSource[f91_local0]
		f90_arg3 = f90_arg3 or f91_local0
		local f91_local2 = 0
		if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
			f91_local2 = Engine.GetModelValue( f90_arg0:getModel( f90_arg1, f90_arg3 .. ".itemIndex" ) )
		end
		local f91_local3 = CoD.perController[f90_arg1].CACSpecficModelValueFocusTable
		local f91_local4 = nil
		if f91_local3 then
			f91_local4 = f90_arg0.selectionList:findItem( f91_local3, nil, false, false )
		else
			f91_local4 = f90_arg0.selectionList:findItem( {
				itemIndex = f91_local2
			}, nil, false, false )
		end
		local f91_local5 = {
			name = "gain_focus",
			controller = f90_arg1
		}
		if f91_local4 then
			f91_local5.selectIndex = f91_local4.gridInfoTable.zeroBasedIndex
		end
		f90_arg0.selectionList:processEvent( f91_local5 )
		return true
	end
	
end

CoD.UpdateUnlockableTableBMItems = function ( f92_arg0, f92_arg1, f92_arg2 )
	if not f92_arg2 then
		f92_arg2 = Engine.CurrentSessionMode()
	end
	local f92_local0 = {}
	for f92_local14, f92_local15 in pairs( f92_arg1 ) do
		local f92_local9 = false
		for f92_local11, f92_local12 in ipairs( f92_local15 ) do
			if f92_local0[f92_local12] == nil then
				f92_local0[f92_local12] = false
				if CoD.SafeGetModelValue( f92_local12, "isBMItem" ) then
					local f92_local4 = CoD.SafeGetModelValue( f92_local12, "itemIndex" )
					local f92_local5 = false
					if f92_local4 then
						f92_local5 = CoD.BlackMarketUtility.IsItemLocked( f92_arg0, Engine.GetItemRef( f92_local4, f92_arg2 ) )
					end
					local f92_local6 = Engine.CreateModel( f92_local12, "isBMClassified" )
					if Engine.GetModelValue( f92_local6 ) ~= f92_local5 then
						f92_local0[f92_local12] = true
						Engine.SetModelValue( f92_local6, f92_local5 )
						local f92_local7 = Engine.CreateModel( f92_local12, "name" )
						local f92_local8 = Engine.CreateModel( f92_local12, "description" )
						if f92_local5 then
							Engine.SetModelValue( f92_local7, CoD.BlackMarketUtility.ClassifiedName( false ) )
							Engine.SetModelValue( f92_local8, "" )
						else
							Engine.SetModelValue( f92_local7, Engine.GetItemName( f92_local4, f92_arg2 ) )
							Engine.SetModelValue( f92_local8, Engine.GetItemDesc( f92_local4, f92_arg2 ) )
						end
						f92_local9 = true
					end
				end
				local f92_local4 = CoD.SafeGetModelValue( f92_local12, "ref" )
				if f92_local4 and CoD.ContractWeaponTiers[f92_local4] then
					local f92_local5 = Engine.CreateModel( f92_local12, "isContractClassified" )
					local f92_local6 = not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f92_local4] )
					if f92_local6 or Engine.GetModelValue( f92_local5 ) ~= f92_local6 then
						f92_local0[f92_local12] = true
						Engine.SetModelValue( f92_local5, f92_local6 )
						local f92_local7 = CoD.SafeGetModelValue( f92_local12, "itemIndex" )
						local f92_local8 = Engine.CreateModel( f92_local12, "name" )
						local f92_local10 = Engine.CreateModel( f92_local12, "description" )
						if f92_local6 then
							Engine.SetModelValue( f92_local8, CoD.BlackMarketUtility.ClassifiedName( false ) )
							Engine.SetModelValue( f92_local10, Engine.Localize( "MPUI_CONTRACT_ITEM_CLASSIFIED_DESC", "MENU_MELEE_WEAPON" ) )
						else
							Engine.SetModelValue( f92_local8, Engine.GetItemName( f92_local7, f92_arg2 ) )
							Engine.SetModelValue( f92_local10, Engine.GetItemDesc( f92_local7, f92_arg2 ) )
						end
						f92_local9 = true
					end
				end
			end
			if f92_local0[f92_local12] then
				f92_local9 = true
			end
		end
		if f92_local9 then
			table.sort( f92_local15, function ( f93_arg0, f93_arg1 )
				return CoD.UnlockablesDataSourceComparisonFunction( f92_arg0, f93_arg0, f93_arg1 )
			end )
		end
	end
end

CoD.GetCraftWeaponListTable = function ( f94_arg0, f94_arg1 )
	local f94_local0 = CoD.GetUnlockablesTable( f94_arg0, f94_arg1, Enum.eModes.MODE_MULTIPLAYER )
	CoD.UpdateUnlockableTableBMItems( f94_arg0, f94_local0, Enum.eModes.MODE_MULTIPLAYER )
	return f94_local0
end

CoD.GetUnlockablesTable = function ( f95_arg0, f95_arg1, f95_arg2 )
	local f95_local0 = function ( f96_arg0 )
		if f96_arg0 then
			local f96_local0 = Engine.GetModel( f96_arg0, "group" )
			local f96_local1 = Engine.GetModel( f96_arg0, "image" )
			local f96_local2 = Engine.GetModel( f96_arg0, "loadoutSlot" )
			if f96_local0 and f96_local1 and f96_local2 then
				local f96_local3 = Engine.GetModelValue( f96_local1 )
				if f96_local3 and f96_local3 ~= CoD.CACUtility.DefaultClassItemImage then
					local f96_local4 = "_big"
					local f96_local5 = Engine.GetModelValue( f96_local0 )
					if f96_local5 == "weapon_grenade" then
						f96_local4 = "_256"
					elseif f96_local5 == "specialty" then
						f96_local4 = ""
					end
					Engine.SetModelValue( Engine.CreateModel( f96_arg0, "image_big" ), f96_local3 .. f96_local4 )
					local f96_local6 = Engine.GetModelValue( f96_local2 )
					if f96_local6 then
						local f96_local7 = ""
						if f96_local6 == "primary" or f96_local6 == "secondary" then
							f96_local7 = ""
						end
						Engine.SetModelValue( Engine.CreateModel( f96_arg0, "image" ), f96_local3 .. f96_local7 )
					end
				end
			end
		end
	end
	
	local f95_local1 = {}
	if not CoD.statsTable then
		CoD.statsTable = "gamedata/stats/mp/mp_statsTable.csv"
	end
	local f95_local2 = CoD.statsTable
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		if CoD.PrestigeUtility.GetPermanentUnlockMode() == Enum.eModes.MODE_ZOMBIES then
			CoD.statsTable = "gamedata/stats/zm/zm_statsTable.csv"
		elseif CoD.PrestigeUtility.GetPermanentUnlockMode() == Enum.eModes.MODE_MULTIPLAYER then
			CoD.statsTable = "gamedata/stats/mp/mp_statsTable.csv"
		end
	elseif f95_arg2 then
		if f95_arg2 == Enum.eModes.MODE_ZOMBIES then
			CoD.statsTable = "gamedata/stats/zm/zm_statsTable.csv"
		elseif f95_arg2 == Enum.eModes.MODE_MULTIPLAYER then
			CoD.statsTable = "gamedata/stats/mp/mp_statsTable.csv"
		else
			CoD.statsTable = "gamedata/stats/cp/cp_statsTable.csv"
		end
	end
	for f95_local3 = 0, 255, 1 do
		local f95_local6 = nil
		local f95_local7 = CoD.CACUtility.GetIdForItemRef( f95_local3 )
		local f95_local8 = CoD.BlackMarketUtility.IsBlackMarketItem( f95_local7 )
		if not CoD.isCampaign or CoD.isFrontend or not f95_local8 and not CoD.ContractWeaponTiers[f95_local7] and not CoD.WeaponsNotInCP[f95_local7] then
			if f95_arg2 ~= nil then
				CoD.WeaponListSessionMode = f95_arg2
				f95_local6 = Engine.GetUnlockableInfoModelByIndex( f95_local3, "CraftWeaponList." .. f95_local3, f95_arg2 )
			else
				local f95_local9 = CoD.PrestigeUtility.GetPermanentUnlockMode()
				CoD.WeaponListSessionMode = f95_local9
				f95_local6 = Engine.GetUnlockableInfoModelByIndex( f95_local3, "Unlockables." .. f95_local3, f95_local9 )
			end
		end
		local f95_local9 = true
		if CoD.isZombie then
			local f95_local10 = CoD.ProductBitFromId[CoD.CACUtility.GetDLCIdForBubbleGum( f95_local3 )]
			if CoD.IsHiddenDLC( f95_local10 ) and not Engine.HasDLCContent( CoD.DLCIndexFromBit[f95_local10] ) then
				f95_local9 = false
			end
		end
		if not Dvar.ui_enablePromoMenu:get() and CoD.ContractWeaponTiers[f95_local7] then
			f95_local9 = false
		end
		if f95_local9 and f95_local8 and CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f95_local7 ) then
			f95_local9 = false
		end
		if f95_local9 then
			f95_local0( f95_local6 )
			if f95_local6 and Engine.GetModelValue( Engine.GetModel( f95_local6, "allocation" ) ) >= 0 then
				if not f95_arg1 or f95_arg1( f95_local6 ) then
					if not f95_local1.filterList then
						f95_local1.filterList = {}
					end
					table.insert( f95_local1.filterList, f95_local6 )
				end
				local f95_local11 = Engine.GetModelValue( Engine.GetModel( f95_local6, "group" ) )
				if f95_local11 == "weapon_knuckles" or f95_local11 == "weapon_wrench" then
					f95_local11 = "weapon_knife"
				end
				if f95_local11 then
					if not f95_local1[f95_local11] then
						f95_local1[f95_local11] = {}
					end
					table.insert( f95_local1[f95_local11], f95_local6 )
				end
				local f95_local10 = Engine.GetModelValue( Engine.GetModel( f95_local6, "loadoutSlot" ) )
				if f95_local10 then
					if not f95_local1[f95_local10] then
						f95_local1[f95_local10] = {}
					end
					table.insert( f95_local1[f95_local10], f95_local6 )
				end
				Engine.SetModelValue( Engine.CreateModel( f95_local6, "itemType" ), Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM )
			end
		end
	end
	CoD.statsTable = f95_local2
	for f95_local12, f95_local6 in pairs( f95_local1 ) do
		table.sort( f95_local6, function ( f97_arg0, f97_arg1 )
			return CoD.UnlockablesDataSourceComparisonFunction( f95_arg0, f97_arg0, f97_arg1 )
		end )
	end
	return f95_local1
end

CoD.CodCaster_TeamIdentity.ColorList = nil
CoD.GetCodCasterTeamColorList = function ( f98_arg0 )
	local f98_local0 = {}
	local f98_local1 = Engine.CreateModel( Engine.GetModelForController( f98_arg0 ), "TeamIdentity.ColorList" )
	local f98_local2 = Engine.StructTableRowCount( CoD.codcasterTeamIdentityColorTable )
	for f98_local3 = 0, f98_local2 - 1, 1 do
		local f98_local6 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorR" )
		local f98_local7 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorG" )
		local f98_local8 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorB" )
		local f98_local9 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorRAccent" )
		local f98_local10 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorGAccent" )
		local f98_local11 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorBAccent" )
		local f98_local12 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorREffect" )
		local f98_local13 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorGEffect" )
		local f98_local14 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorBEffect" )
		local f98_local15 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorRObituaryFont" )
		local f98_local16 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorGObituaryFont" )
		local f98_local17 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f98_local3, "colorBObituaryFont" )
		local f98_local18 = Engine.CreateModel( f98_local1, "color_" .. f98_local3 )
		Engine.SetModelValue( Engine.CreateModel( f98_local18, "id" ), f98_local3 )
		Engine.SetModelValue( Engine.CreateModel( f98_local18, "color" ), string.format( "%d %d %d", f98_local6, f98_local7, f98_local8 ) )
		Engine.SetModelValue( Engine.CreateModel( f98_local18, "colorAccent" ), string.format( "%d %d %d", f98_local9, f98_local10, f98_local11 ) )
		Engine.SetModelValue( Engine.CreateModel( f98_local18, "colorEffect" ), string.format( "%d %d %d", f98_local12, f98_local13, f98_local14 ) )
		Engine.SetModelValue( Engine.CreateModel( f98_local18, "colorObituaryFont" ), string.format( "%d %d %d", f98_local15, f98_local16, f98_local17 ) )
		table.insert( f98_local0, f98_local18 )
	end
	return f98_local0
end

CoD.GetCodCasterTeamColorInformation = function ( f99_arg0, f99_arg1, f99_arg2 )
	if not CoD.CodCaster_TeamIdentity.ColorList then
		CoD.CodCaster_TeamIdentity.ColorList = CoD.GetCodCasterTeamColorList( f99_arg0 )
	end
	local f99_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f99_arg0 ), "TeamIdentity.ColorList" ), "color_" .. f99_arg1 )
	if not f99_local0 then
		return nil
	else
		local f99_local1 = Engine.GetModel( f99_local0, f99_arg2 )
		if not f99_local1 then
			return nil
		else
			return Engine.GetModelValue( f99_local1 )
		end
	end
end

CoD.CodCaster_TeamIdentity.LogoList = nil
CoD.GetCodCasterTeamLogoList = function ( f100_arg0 )
	local f100_local0 = {}
	local f100_local1 = Engine.CreateModel( Engine.GetModelForController( f100_arg0 ), "TeamIdentity.LogoList" )
	local f100_local2 = Engine.StructTableRowCount( CoD.codcasterTeamIdentityLogoTable )
	for f100_local3 = 0, f100_local2 - 1, 1 do
		local f100_local6 = Engine.StructTableLookupString( CoD.codcasterTeamIdentityLogoTable, "id", f100_local3, "logo_name" )
		local f100_local7 = Engine.StructTableLookupString( CoD.codcasterTeamIdentityLogoTable, "id", f100_local3, "logo_icon" )
		local f100_local8 = Engine.CreateModel( f100_local1, "logo_" .. f100_local3 )
		Engine.SetModelValue( Engine.CreateModel( f100_local8, "id" ), f100_local3 )
		Engine.SetModelValue( Engine.CreateModel( f100_local8, "name" ), f100_local6 )
		Engine.SetModelValue( Engine.CreateModel( f100_local8, "ref" ), f100_local7 )
		table.insert( f100_local0, f100_local8 )
	end
	return f100_local0
end

CoD.GetCodCasterTeamLogoInformation = function ( f101_arg0, f101_arg1, f101_arg2 )
	if not CoD.CodCaster_TeamIdentity.LogoList then
		CoD.CodCaster_TeamIdentity.LogoList = CoD.GetCodCasterTeamLogoList( f101_arg0 )
	end
	local f101_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f101_arg0 ), "TeamIdentity.LogoList" ), "logo_" .. f101_arg1 )
	if not f101_local0 then
		return nil
	else
		local f101_local1 = Engine.GetModel( f101_local0, f101_arg2 )
		if not f101_local1 then
			return nil
		else
			return Engine.GetModelValue( f101_local1 )
		end
	end
end

CoD.emblem.ColorList = nil
CoD.GetEmblemColorList = function ( f102_arg0 )
	local f102_local0 = {}
	local f102_local1 = Engine.CreateModel( Engine.GetModelForController( f102_arg0 ), "Emblem.EmblemColorList" )
	local f102_local2 = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_ROWS
	local f102_local3 = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_COLUMNS
	local f102_local4 = f102_local2 * f102_local3
	for f102_local5 = 0, f102_local4 - 1, 1 do
		local f102_local8, f102_local9, f102_local10 = Engine.GetEmblemSwatchColor( f102_local5 / f102_local3, f102_local5 % f102_local3 )
		local f102_local11 = Engine.CreateModel( f102_local1, "color_" .. f102_local5 )
		Engine.SetModelValue( Engine.CreateModel( f102_local11, "color" ), string.format( "%d %d %d", f102_local8, f102_local9, f102_local10 ) )
		table.insert( f102_local0, f102_local11 )
	end
	return f102_local0
end

CoD.GunsmithWeaponOptionsTable = nil
CoD.GetGunsmithWeaponOptionsTable = function ( f103_arg0, f103_arg1, f103_arg2 )
	local f103_local0 = {}
	CoD.GetWeaponOptionsTableForCategory( f103_arg0, f103_local0, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, CoD.GetCustomization( f103_arg0, "weapon_index" ), 0, false )
	return f103_local0
end

CoD.WeaponOptionsTable = nil
CoD.GetWeaponOptionsTableForCategory = function ( f104_arg0, f104_arg1, f104_arg2, f104_arg3, f104_arg4, f104_arg5 )
	local f104_local0 = function ( f105_arg0 )
		local f105_local0
		if f105_arg0 ~= "camo_gold" and f105_arg0 ~= "camo_diamond" and f105_arg0 ~= "camo_darkmatter" then
			f105_local0 = false
		else
			f105_local0 = true
		end
		return f105_local0
	end
	
	local f104_local1 = function ( f106_arg0, f106_arg1 )
		if not IsLive() then
			local f106_local0 = Engine.GetModelValue( Engine.GetModel( f106_arg1, "weaponOptionTypeName" ) )
			local f106_local1 = Engine.GetModelValue( Engine.GetModel( f106_arg1, "filterMode" ) )
			if f106_local0 and f106_local1 and f106_local0 == "camo" and f106_local1 == "extras" then
				local f106_local2 = Engine.GetModel( f106_arg1, "entitlementString" )
				local f106_local3 = f106_local2 and Engine.GetModelValue( f106_local2 )
				if f106_local3 and f106_local3 ~= "" and CoD.StoreUtility.IsCWLPackageEntitlement( f106_local3 ) and Engine.GetProfileVarInt( f106_arg0, f106_local3 ) == 1 then
					return true
				end
			end
		end
		return false
	end
	
	local f104_local2 = {}
	local f104_local3 = {}
	local f104_local4 = {}
	if CoD.CACUtility.EmptyItemIndex < f104_arg3 then
		local f104_local5 = Engine.GetItemRef( f104_arg3 )
		for f104_local6 = 0, Engine.GetNumWeaponOptionsForGroup( f104_arg2 ), 1 do
			local f104_local9 = Engine.GetWeaponOptionGroupIndex( f104_local6, f104_arg2 )
			local f104_local10, f104_local11 = false
			local f104_local12 = false
			if f104_arg2 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
				f104_local11 = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, f104_local9, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE )
				if IsProgressionEnabled( f104_arg0 ) and Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, f104_local9, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_WEAPONOPTION_FILTER ) == "mp" then
					if f104_local11 == "camo_darkmatter" then
						local f104_local13 = CoD.getStatsMilestoneTable( 1, Enum.eModes.MODE_MULTIPLAYER )
						local f104_local14 = Engine.TableFindRows( f104_local13, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM, "camo_darkmatter" )
						f104_local10 = true
						if f104_local14 then
							for f104_local18, f104_local19 in ipairs( f104_local14 ) do
								if not Engine.GetChallengeCompleteForChallengeIndex( Enum.eModes.MODE_MULTIPLAYER, f104_arg0, tonumber( Engine.TableLookupGetColumnValueForRow( f104_local13, f104_local19, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) ) ) then
									f104_local12 = true
								else
									f104_local10 = false
								end
							end
						end
						if not f104_local10 and CoD.BlackMarketUtility.IsBlackMarketItem( f104_local5 ) then
							local f104_local16 = tonumber( Engine.TableLookup( nil, CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_MULTIPLAYER ), Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM, "camo_diamond", Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE, f104_local5, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) )
							if not f104_local16 or not Engine.GetChallengeCompleteForChallengeIndex( Enum.eModes.MODE_MULTIPLAYER, f104_arg0, f104_local16 ) then
								f104_local16 = tonumber( Engine.TableLookup( nil, CoD.getStatsMilestoneTable( 5, Enum.eModes.MODE_MULTIPLAYER ), Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM, "camo_diamond", Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE, f104_local5, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) )
								if not f104_local16 or not Engine.GetChallengeCompleteForChallengeIndex( Enum.eModes.MODE_MULTIPLAYER, f104_arg0, f104_local16 ) then
									f104_local10 = true
								end
							end
						end
					end
				else
					f104_local10 = f104_local0( f104_local11 )
				end
			end
			if not f104_local10 then
				local f104_local20 = Engine.GetWeaponOptionsInfoModelByIndex( f104_arg0, f104_local9, "WeaponOptions", f104_arg3, f104_arg4 )
				if f104_local20 and f104_arg2 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and f104_local0( f104_local11 ) then
					local f104_local13 = Engine.GetModel( f104_local20, "unlockProgressAndTarget" )
					if f104_local13 then
						Engine.SetModelValue( f104_local13, "" )
					end
				end
				if f104_local20 and Engine.GetModelValue( Engine.GetModel( f104_local20, "allocation" ) ) >= 0 then
					local f104_local13 = Engine.GetModelValue( Engine.GetModel( f104_local20, "weaponOptionTypeName" ) )
					local f104_local14 = Engine.GetModelValue( Engine.GetModel( f104_local20, "weaponOptionSubIndex" ) )
					local f104_local15 = Engine.CreateModel( f104_local20, "rarityType" )
					local f104_local16 = Engine.CreateModel( f104_local15, "rarity" )
					local f104_local17 = Engine.CreateModel( f104_local15, "isBMClassified" )
					local f104_local18 = Engine.CreateModel( f104_local15, "duplicateCount" )
					if f104_local13 then
						if not f104_arg1[f104_local13] then
							f104_arg1[f104_local13] = {}
						end
						table.insert( f104_arg1[f104_local13], f104_local20 )
						Engine.SetModelValue( Engine.CreateModel( f104_local20, "isChallengeClassified" ), f104_local12 )
						Engine.SetModelValue( Engine.CreateModel( f104_local20, "isPackage" ), false )
						if f104_local14 == 0 and f104_arg5 and f104_arg5 == true then
							for f104_local19 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
								local f104_local23 = f104_local13 .. "_" .. CoD.WeaponOptionFilterToString( f104_local19 )
								if not f104_arg1[f104_local23] then
									f104_arg1[f104_local23] = {}
								end
								Engine.SetModelValue( Engine.CreateModel( f104_local20, "isBMClassified" ), false )
								table.insert( f104_arg1[f104_local23], f104_local20 )
							end
						end
						local f104_local19 = true
						if f104_local13 == "reticle" then
							if Engine.CurrentSessionMode() == Enum.eModes.MODE_COUNT then
								local f104_local21 = Enum.eModes.MODE_MULTIPLAYER
							end
							f104_local19 = Engine.TableLookup( f104_arg0, "gamedata/weapons/common/weaponOptions.csv", 2, Engine.GetAttachmentRefByIndex( f104_arg4 ), 0, f104_local14, 3 ) ~= ""
						end
						local f104_local21 = Engine.GetModelValue( Engine.GetModel( f104_local20, "filterMode" ) )
						if f104_local19 and f104_local21 and f104_local21 ~= "" then
							local f104_local22 = nil
							local f104_local24 = Engine.GetModelValue( Engine.GetModel( f104_local20, "ref" ) )
							if CoD.WeaponOptionFilterStringToEnum( f104_local21 ) == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM then
								f104_local22 = f104_local24 .. ";" .. f104_local5
								if f104_local13 == "reticle" then
									if CoD.perController[f104_arg0].customReticleAttachment then
										f104_local22 = CoD.perController[f104_arg0].customReticleAttachment .. "_" .. Engine.GetModelValue( Engine.GetModel( f104_local20, "weaponOptionSubIndex" ) )
									elseif CoD.perController[f104_arg0].editingWeaponBuildKits then
										local f104_local23 = CoD.SafeGetModelValue( Engine.GetModelForController( f104_arg0 ), "WeaponBuildKitVariant.attachment1" )
										if f104_local23 then
											f104_local22 = Engine.GetAttachmentRefByIndex( f104_local23 ) .. "_" .. Engine.GetModelValue( Engine.GetModel( f104_local20, "weaponOptionSubIndex" ) )
										end
									elseif CoD.perController[f104_arg0].gunsmithAttachmentModel then
										f104_local22 = Engine.GetAttachmentRefByIndex( Engine.GetModelValue( CoD.perController[f104_arg0].gunsmithAttachmentModel ) ) .. "_" .. Engine.GetModelValue( Engine.GetModel( f104_local20, "weaponOptionSubIndex" ) )
									end
								end
								local f104_local23 = CoD.BlackMarketUtility.IsItemLocked( f104_arg0, f104_local22 )
								if f104_local23 then
									Engine.SetModelValue( Engine.GetModel( f104_local20, "name" ), CoD.BlackMarketUtility.ClassifiedName() )
								end
								Engine.SetModelValue( Engine.CreateModel( f104_local20, "isBMClassified" ), f104_local23 )
								local f104_local25 = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f104_local22 )
								local f104_local26 = CoD.BlackMarketUtility.GetItemQuantity( f104_arg0, f104_local22 )
								Engine.SetModelValue( f104_local16, f104_local25 )
								Engine.SetModelValue( f104_local17, f104_local23 )
								Engine.SetModelValue( f104_local18, f104_local26 )
							else
								local f104_local23 = false
								if CoD.BlackMarketUtility.IsLimitedBlackMarketItem( f104_local24 ) then
									Engine.SetModelValue( Engine.CreateModel( f104_local20, "isLimitedItem" ), true )
									f104_local23 = CoD.BlackMarketUtility.IsItemLocked( f104_arg0, f104_local24 )
									if f104_local23 then
										Engine.SetModelValue( Engine.GetModel( f104_local20, "name" ), CoD.BlackMarketUtility.ClassifiedName() )
									end
								end
								Engine.SetModelValue( Engine.CreateModel( f104_local20, "isBMClassified" ), f104_local23 )
								Engine.SetModelValue( f104_local18, 0 )
							end
							local f104_local23 = f104_local13 .. "_" .. f104_local21
							if not f104_arg1[f104_local23] then
								f104_arg1[f104_local23] = {}
							end
							if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f104_local22 ) and (not CoD.BlackMarketUtility.IsHiddenLimitedBlackMarketItem( f104_arg0, f104_local24 ) or CoD.BlackMarketUtility.IsLimitedEditionCamoBundleItem( f104_local24 ) and not CoD.BlackMarketUtility.IsHiddenLimitedEditionCamoBundleItem( f104_arg0, f104_local24 )) then
								if not (f104_local13 ~= "reticle" or Engine.IsWeaponOptionLockedEntitlement( f104_arg0, f104_arg4, f104_local9 )) or not Engine.IsWeaponOptionLockedEntitlement( f104_arg0, CoD.CACUtility.ATTACHMENT_NONE, f104_local9 ) then
									local f104_local25 = Engine.GetModelValue( Engine.GetModel( f104_local20, "itemIndex" ) )
									local f104_local26 = true
									if f104_local13 == "camo" then
										local f104_local27 = Engine.TableLookup( f104_arg0, CoD.attachmentTable, 0, f104_local25, 1, f104_local13, 22 )
										if f104_local27 ~= nil and f104_local27 ~= "" then
											if not IsLive() then
												f104_local26 = false
											else
												local f104_local28 = CoD.GetContractStatValuesForIndex( f104_arg0, LuaUtils.BMContracts.specialContractIndex )
												if f104_local28 ~= nil then
													if tonumber( f104_local27 ) == f104_local28.index then
														local f104_local29 = f104_local28.targetValue
														Engine.SetModelValue( Engine.CreateModel( f104_local20, "unlockDescription" ), Engine.Localize( f104_local28.descRef, f104_local29 ) )
														Engine.SetModelValue( Engine.CreateModel( f104_local20, "unlockProgressAndTarget" ), f104_local28.progress .. " " .. f104_local29 )
													elseif Engine.GetDStatForMode( f104_arg0, Enum.eModes.MODE_MULTIPLAYER, "playerstatslist", Engine.TableLookup( nil, CoD.contractTable_mp, 0, f104_local27, 8 ), "statvalue" ) > 0 then
														local f104_local30 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f104_local27, 3 ) or ""
														local f104_local31 = tonumber( Engine.TableLookup( nil, CoD.contractTable_mp, 0, f104_local27, 2 ) )
														Engine.SetModelValue( Engine.CreateModel( f104_local20, "unlockDescription" ), Engine.Localize( "CONTRACT_" .. f104_local30 .. "_DESC", f104_local31 ) )
														Engine.SetModelValue( Engine.CreateModel( f104_local20, "unlockProgressAndTarget" ), f104_local31 .. " " .. f104_local31 )
													else
														Engine.SetModelValue( Engine.CreateModel( f104_local20, "unlockDescription" ), Engine.Localize( "MPUI_CONTRACT_NEED_TO_ACTIVATE", Engine.Localize( "CONTRACT_" .. Engine.TableLookup( nil, CoD.contractTable_mp, 0, f104_local27, 4 ) ) ) )
														Engine.SetModelValue( Engine.CreateModel( f104_local20, "unlockProgressAndTarget" ), "" )
													end
												end
											end
										end
									end
									if f104_local26 then
										table.insert( f104_arg1[f104_local23], f104_local20 )
									end
								end
								if f104_local13 == "camo" and Engine.IsWeaponOptionLockedEntitlement( f104_arg0, CoD.CACUtility.ATTACHMENT_NONE, f104_local9 ) then
									local f104_local25 = Engine.GetModel( f104_local20, "entitlementString" )
									local f104_local26 = f104_local25 and Engine.GetModelValue( f104_local25 )
									if f104_local26 and f104_local26 ~= "" then
										if not f104_local2[f104_local26] then
											f104_local2[f104_local26] = {}
											f104_local3[f104_local26] = ""
											f104_local4[f104_local26] = ""
										end
										local f104_local27 = Engine.GetModelValue( Engine.GetModel( f104_local20, "itemIndex" ) )
										local f104_local28 = Engine.GetModelValue( Engine.GetModel( f104_local20, "image" ) )
										table.insert( f104_local2[f104_local26], f104_local27 )
										if f104_local3[f104_local26] == "" then
											f104_local3[f104_local26] = f104_local3[f104_local26] .. tostring( f104_local27 )
											f104_local4[f104_local26] = f104_local4[f104_local26] .. f104_local28
										else
											f104_local3[f104_local26] = f104_local3[f104_local26] .. "," .. tostring( f104_local27 )
											f104_local4[f104_local26] = f104_local4[f104_local26] .. "," .. f104_local28
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	local f104_local5 = function ( f107_arg0, f107_arg1 )
		for f107_local3, f107_local4 in pairs( f107_arg0 ) do
			if LUI.endswith( f107_local3, f107_arg1 ) then
				return f107_local4
			end
		end
	end
	
	local f104_local7 = f104_local5( f104_arg1, CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM ) )
	if f104_local7 then
		table.sort( f104_local7, CoD.BlackMarketUtility.SortUnlocksModelWOSubIndex )
	end
	if f104_arg2 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
		local f104_local8 = f104_local5( f104_arg1, CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS ) )
		if f104_local8 and InFrontend() and AreCodPointsEnabled( f104_arg0 ) then
			local f104_local32 = {
				weaponOptionType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO,
				filterMode = "extras",
				weaponOptionTypeName = "camo",
				unlockSessionMode = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT,
				isBMClassified = false,
				isChallengeClassified = false
			}
			local f104_local9 = 0
			for f104_local20, f104_local13 in ipairs( CoD.StoreUtility.CWLPackages ) do
				if CoD.StoreUtility.IsInventoryItemVisible( f104_arg0, f104_local13 ) and not CoD.StoreUtility.IsInventoryItemPurchased( f104_arg0, f104_local13 ) then
					local f104_local14 = CoD.StoreUtility.GetInventoryItemValueByItemName( f104_local13, CoD.StoreUtility.InventoryItems.itemIdColumn )
					local f104_local15 = CoD.StoreUtility.GetInventoryItemValueByItemName( f104_local13, CoD.StoreUtility.InventoryItems.nameContextualColumn )
					local f104_local16 = CoD.StoreUtility.GetInventoryItemValueByItemName( f104_local13, CoD.StoreUtility.InventoryItems.imageCamoColumn )
					local f104_local17 = CoD.StoreUtility.GetInventoryItemValueByItemName( f104_local13, CoD.StoreUtility.InventoryItems.buttonLabelContextualColumn )
					local f104_local18 = function ( f108_arg0, f108_arg1, f108_arg2, f108_arg3, f108_arg4 )
						OpenBuyInventoryItemDialog( f108_arg0, f108_arg1, f108_arg2 )
					end
					
					if f104_local2[f104_local13] then
						local f104_local19 = f104_local2[f104_local13][1]
						local f104_local21 = Engine.CreateModel( Engine.GetModelForController( f104_arg0 ), "WeaponOptions.camo." .. tostring( f104_local19 ) )
						LUI.CreateModelAndInitialize( f104_local21, "name", Engine.Localize( f104_local15 .. "_SHORT" ) )
						LUI.CreateModelAndInitialize( f104_local21, "packageImage", f104_local16 )
						LUI.CreateModelAndInitialize( f104_local21, "itemIndex", f104_local19 )
						LUI.CreateModelAndInitialize( f104_local21, "weaponOptionSubIndex", f104_local19 )
						LUI.CreateModelAndInitialize( f104_local21, "packageCamoIndices", f104_local3[f104_local13] )
						LUI.CreateModelAndInitialize( f104_local21, "packageCamoImages", f104_local4[f104_local13] )
						LUI.CreateModelAndInitialize( f104_local21, "skuId", f104_local14 )
						LUI.CreateModelAndInitialize( f104_local21, "isPackage", true )
						LUI.CreateModelAndInitialize( f104_local21, "packageLabel", Engine.Localize( f104_local17 .. "_SHORT" ) )
						LUI.CreateModelsAndInitialize( f104_local21, f104_local32 )
						if f104_arg5 and f104_arg5 == true then
							table.insert( f104_local8, 2 + f104_local9, f104_local21 )
						else
							table.insert( f104_local8, 1 + f104_local9, f104_local21 )
						end
						f104_local9 = f104_local9 + 1
					end
				end
			end
		end
	end
end

CoD.GetWeaponOptionsTable = function ( f109_arg0, f109_arg1, f109_arg2 )
	local f109_local0 = {}
	local f109_local1 = CoD.perController[f109_arg0].classModel
	local f109_local2 = CoD.perController[f109_arg0].weaponCategory
	local f109_local3 = Engine.GetModel( f109_local1, f109_local2 .. ".itemIndex" )
	local f109_local4 = 0
	if f109_local3 then
		CoD.GetWeaponOptionsTableForCategory( f109_arg0, f109_local0, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, Engine.GetModelValue( f109_local3 ), f109_local4, true )
	end
	local f109_local5 = Engine.GetModel( Engine.GetModelForController( f109_arg0 ), "WeaponOptions" )
	local f109_local6 = Engine.CreateModel( f109_local5, "paintjob" )
	if not f109_local0.paintjob then
		f109_local0.paintjob = {}
	end
	local f109_local7 = function ( f110_arg0, f110_arg1, f110_arg2, f110_arg3, f110_arg4, f110_arg5, f110_arg6, f110_arg7 )
		local f110_local0 = Engine.CreateModel( f110_arg0, f110_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "image" ), f110_arg1 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "itemIndex" ), f110_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "name" ), f110_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "ref" ), f110_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "weaponOptionTypeName" ), f110_arg5 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "weaponOptionType" ), Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "weaponOptionSubIndex" ), f110_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "paintjobIndex" ), f110_arg6 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "paintjobSlot" ), f110_arg7 )
		Engine.SetModelValue( Engine.CreateModel( f110_local0, "paintjobSlotAndIndex" ), f110_arg7 .. " " .. f110_arg6 )
		LUI.CreateModelAndInitialize( Engine.CreateModel( f110_local0, "rarityType" ), "rarity", "" )
		LUI.CreateModelAndInitialize( f110_local0, "unlockSessionMode", Enum.eModes.MODE_INVALID )
		table.insert( f109_local0[f110_arg5], f110_local0 )
	end
	
	if f109_local3 then
		local f109_local8 = CoD.CraftUtility.Paintjobs.GetCACPaintjobList( Engine.GetModelValue( f109_local3 ) )
		f109_local7( f109_local6, "menu_cac_none", 0, "MPUI_NONE", "paintshop_0", "paintjob", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		for f109_local9 = 1, #f109_local8, 1 do
			f109_local7( f109_local6, "blacktransparent", f109_local9, Engine.MarkAsLocalize( f109_local8[f109_local9].paintjobName ), "paintshop_1", "paintjob", f109_local8[f109_local9].paintjobIndex, f109_local8[f109_local9].paintjobSlot )
		end
	end
	if AllowWeaponPrestige( f109_arg0 ) and (f109_local2 == "primary" or f109_local2 == "secondary") then
		local f109_local12 = Engine.CreateModel( f109_local5, "mpPrestigeAttachments" )
		local f109_local8 = CoD.CACUtility[f109_local2 .. "WeaponPrestigeSlot"]
		f109_local0[f109_local8] = {}
		local f109_local9 = function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3 )
			local f111_local0 = Engine.CreateModel( f109_local12, f111_arg0 )
			LUI.CreateModelAndInitialize( f111_local0, "ref", f111_arg2 )
			LUI.CreateModelAndInitialize( f111_local0, "name", Engine.GetAttachmentName( f111_arg1, f111_arg3 ) )
			local f111_local1 = "blacktransparent"
			if f111_arg3 ~= CoD.CACUtility.EmptyItemIndex then
				f111_local1 = Engine.GetAttachmentImage( f111_arg1, f111_arg3 )
			end
			local f111_local2 = false
			local f111_local3 = 0
			for f111_local7, f111_local8 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f111_arg2 == f111_local8 then
					f111_local3 = f111_local7
					f111_local2 = CoD.CACUtility.GetWeaponPLevel( f109_arg0, f111_arg1 ) < f111_local7
					break
				end
			end
			f111_local4 = ""
			if f111_local2 then
				f111_local4 = Engine.Localize( "MENU_REQUIRES_WEAPON_PRESTIGE", f111_arg0 )
			elseif f111_arg2 == CoD.CACUtility.mpPrestigeAttachments[1] then
				f111_local4 = Engine.Localize( "MENU_WEAPON_PRESTIGE_CLAN_TAG", Engine.GetItemName( f111_arg1 ) )
			elseif f111_arg2 == CoD.CACUtility.mpPrestigeAttachments[2] then
				f111_local4 = Engine.Localize( "MENU_WEAPON_PRESTIGE_KILL_COUNTER", Engine.GetItemName( f111_arg1 ) )
			end
			LUI.CreateModelAndInitialize( f111_local0, "image", f111_local1 )
			LUI.CreateModelAndInitialize( f111_local0, "itemIndex", f111_arg3 )
			LUI.CreateModelAndInitialize( f111_local0, "weaponOptionTypeName", f109_local8 )
			LUI.CreateModelAndInitialize( f111_local0, "weaponOptionType", Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID )
			LUI.CreateModelAndInitialize( f111_local0, "weaponOptionSubIndex", f111_arg3 )
			LUI.CreateModelAndInitialize( f111_local0, "description", f111_local4 )
			LUI.CreateModelAndInitialize( f111_local0, "allocation", Engine.GetAttachmentAllocationCost( f111_arg3 ) )
			LUI.CreateModelAndInitialize( f111_local0, "type", f109_local8 )
			LUI.CreateModelAndInitialize( f111_local0, "unlockSessionMode", Enum.eModes.MODE_MULTIPLAYER )
			LUI.CreateModelAndInitialize( Engine.CreateModel( f111_local0, "rarityType" ), "rarity", "" )
			table.insert( f109_local0[f109_local8], f111_local0 )
		end
		
		if f109_local3 then
			local f109_local10 = Engine.GetModelValue( f109_local3 )
			f109_local9( 0, f109_local10, "", CoD.CACUtility.EmptyItemIndex )
			for f109_local15, f109_local16 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				local f109_local17 = Engine.GetAttachmentIndexByAttachmentTableIndex( f109_local10, Engine.GetAttachmentIndexByRef( f109_local16 ) )
				if f109_local17 and CoD.CACUtility.EmptyItemIndex < f109_local17 then
					f109_local9( f109_local15, f109_local10, f109_local16, f109_local17 )
				end
			end
			if #f109_local0[f109_local8] < 2 then
				f109_local0[f109_local8] = {}
			end
		end
	end
	return f109_local0
end

CoD.OpenCACMenu = function ( f112_arg0, f112_arg1 )
	CoD.perController[f112_arg1].enableClassOptions = true
	return OpenOverlay( f112_arg0, "chooseClass", f112_arg1 )
end

CoD.OpenCACMenuEditClass = function ( f113_arg0, f113_arg1 )
	CoD.perController[f113_arg1].enableClassOptions = false
	return OpenOverlay( f113_arg0, "chooseClass", f113_arg1 )
end

CoD.AddClassItemData = function ( f114_arg0, f114_arg1, f114_arg2, f114_arg3 )
	if f114_arg1 ~= nil and f114_arg1 > 0 then
		local f114_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f114_local1 = Engine.GetItemAllocationCost( f114_arg1, f114_local0 )
		if f114_local1 >= 0 then
			table.insert( f114_arg0, {
				name = Engine.GetItemName( f114_arg1, f114_local0 ),
				description = Engine.GetItemDesc( f114_arg1, f114_local0 ),
				ref = Engine.GetItemRef( f114_arg1, f114_local0 ),
				cost = f114_local1,
				momentumCost = Engine.GetItemMomentumCost( f114_arg1, f114_local0 ),
				itemIndex = f114_arg1,
				count = f114_arg2,
				loadoutSlot = f114_arg3
			} )
		end
	end
end

CoD.AddClassAttachmentData = function ( f115_arg0, f115_arg1, f115_arg2 )
	if f115_arg1 ~= nil and f115_arg1 > 0 and f115_arg2 ~= nil and f115_arg2 > 0 then
		local f115_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f115_local1 = Engine.GetAttachmentAllocationCost( f115_arg1, f115_arg2, f115_local0 )
		if f115_local1 >= 0 then
			table.insert( f115_arg0, {
				name = Engine.GetAttachmentNameByIndex( f115_arg2 ),
				description = Engine.GetAttachmentDesc( f115_arg1, f115_arg2, f115_local0 ),
				cost = f115_local1,
				weaponIndex = f115_arg1,
				attachmentIndex = f115_arg2,
				count = 1
			} )
		end
	end
end

CoD.GetAttachments = function ( f116_arg0 )
	local f116_local0 = Engine.GetNumAttachments( f116_arg0 )
	if f116_local0 == nil then
		return nil
	end
	local f116_local1 = {}
	for f116_local2 = 1, f116_local0 - 1, 1 do
		table.insert( f116_local1, {
			weaponItemIndex = f116_arg0,
			attachmentIndex = f116_local2
		} )
	end
	return f116_local1
end

CoD.GetClassItem = function ( f117_arg0, f117_arg1, f117_arg2 )
	return Engine.GetClassItem( f117_arg0, f117_arg1, f117_arg2, CoD.PrestigeUtility.GetPermanentUnlockMode() )
end

CoD.SetClassItem = function ( f118_arg0, f118_arg1, f118_arg2, f118_arg3, f118_arg4 )
	Engine.SetClassItem( f118_arg0, f118_arg1, f118_arg2, f118_arg3 )
	if f118_arg4 ~= nil then
		Engine.SetClassItem( f118_arg0, f118_arg1, f118_arg2 .. "count", f118_arg4 )
	end
end

CoD.RemoveItemFromClass = function ( f119_arg0, f119_arg1, f119_arg2 )
	for f119_local3, f119_local4 in pairs( CoD.CACUtility.loadoutSlotNames ) do
		if f119_arg2 == CoD.GetClassItem( f119_arg0, f119_arg1, f119_local4 ) then
			CoD.SetClassItem( f119_arg0, f119_arg1, f119_local4, CoD.CACUtility.EmptyItemIndex )
		end
	end
end

CoD.HowManyInClassSlot = function ( f120_arg0, f120_arg1 )
	for f120_local3, f120_local4 in pairs( f120_arg1 ) do
		if f120_local4.itemIndex == f120_arg0 then
			if f120_local4.count == nil then
				return 1
			end
			return f120_local4.count
		end
	end
	return 0
end

CoD.IsWeapon = function ( f121_arg0 )
	local f121_local0 = Engine.GetLoadoutSlotForItem( f121_arg0 )
	local f121_local1 = CoD.CACUtility.loadoutSlotNames
	if f121_local0 and (f121_local0 == f121_local1.primaryWeapon or f121_local0 == f121_local1.secondaryWeapon) then
		return true
	else
		return false
	end
end

CoD.IsSecondaryWeapon = function ( f122_arg0 )
	local f122_local0 = Engine.GetLoadoutSlotForItem( f122_arg0 )
	if f122_local0 and f122_local0 == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		return true
	else
		return false
	end
end

CoD.IsPerk = function ( f123_arg0 )
	local f123_local0 = Engine.GetLoadoutSlotForItem( f123_arg0 )
	if f123_local0 and string.find( f123_local0, "specialty" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsReward = function ( f124_arg0 )
	local f124_local0 = Engine.GetLoadoutSlotForItem( f124_arg0 )
	if f124_local0 and string.find( f124_local0, "killstreak" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsGrenade = function ( f125_arg0 )
	local f125_local0 = Engine.GetLoadoutSlotForItem( f125_arg0 )
	local f125_local1 = CoD.CACUtility.loadoutSlotNames
	if f125_local0 and (f125_local0 == f125_local1.primaryGrenade or f125_local0 == f125_local1.specialGrenade) then
		return true
	else
		return false
	end
end

CoD.IsLethalGrenade = function ( f126_arg0 )
	local f126_local0 = Engine.GetLoadoutSlotForItem( f126_arg0 )
	if f126_local0 and f126_local0 == CoD.CACUtility.loadoutSlotNames.primaryGrenade then
		return true
	else
		return false
	end
end

CoD.IsTacticalGrenade = function ( f127_arg0 )
	local f127_local0 = Engine.GetLoadoutSlotForItem( f127_arg0 )
	if f127_local0 and f127_local0 == CoD.CACUtility.loadoutSlotNames.specialGrenade then
		return true
	else
		return false
	end
end

CoD.IsBonusCard = function ( f128_arg0 )
	local f128_local0 = Engine.GetItemGroup( f128_arg0 )
	if f128_local0 and string.find( f128_local0, "bonuscard" ) == 1 then
		return true
	else
		return false
	end
end

CoD.GetItemMaterialNameWidthAndHeight = function ( f129_arg0, f129_arg1 )
	local f129_local0 = Engine.GetItemImage( f129_arg0 )
	local f129_local1 = 128
	local f129_local2 = 128
	if CoD.IsWeapon( f129_arg0 ) then
		f129_local1 = f129_local2 * 2
		if f129_arg1 == true then
			f129_local0 = f129_local0 .. "_big"
		end
	elseif CoD.IsBonusCard( f129_arg0 ) then
		f129_local1 = f129_local2 * 2
	elseif CoD.IsReward( f129_arg0 ) then
		if f129_arg1 == true then
			f129_local0 = f129_local0 .. "_menu"
		end
	elseif f129_arg1 == true then
		f129_local0 = f129_local0 .. "_256"
	end
	return f129_local0, f129_local1, f129_local2
end

CoD.SumClassItemCosts = function ( f130_arg0 )
	local f130_local0 = 0
	for f130_local5, f130_local6 in pairs( f130_arg0 ) do
		local f130_local4 = 1
		if f130_local6.count ~= nil then
			f130_local4 = f130_local6.count
		end
		f130_local0 = f130_local0 + f130_local6.cost * f130_local4
	end
	return f130_local0
end

CoD.CACItemComparisonFunction = function ( f131_arg0, f131_arg1 )
	return Engine.GetItemAllocationCost( f131_arg0 ) < Engine.GetItemAllocationCost( f131_arg1 )
end

CoD.CACAttachmentComparisonFunction = function ( f132_arg0, f132_arg1 )
	return Engine.GetAttachmentAllocationCost( f132_arg0.weaponItemIndex, f132_arg0.attachmentIndex ) < Engine.GetAttachmentAllocationCost( f132_arg1.weaponItemIndex, f132_arg1.attachmentIndex )
end

CoD.CACAttachmentComparisonDataSourceFunction = function ( f133_arg0, f133_arg1 )
	local f133_local0 = {}
	local f133_local1 = {}
	f133_local0.weaponItemIndex = f133_arg0.weaponItemIndex
	f133_local0.attachmentIndex = Engine.GetModelValue( Engine.GetModel( f133_arg0.model, "itemIndex" ) )
	f133_local1.weaponItemIndex = f133_arg1.weaponItemIndex
	f133_local1.attachmentIndex = Engine.GetModelValue( Engine.GetModel( f133_arg1.model, "itemIndex" ) )
	return Engine.GetAttachmentAllocationCost( f133_local0.weaponItemIndex, f133_local0.attachmentIndex ) < Engine.GetAttachmentAllocationCost( f133_local1.weaponItemIndex, f133_local1.attachmentIndex )
end

CoD.CACRewardComparisonFunction = function ( f134_arg0, f134_arg1 )
	local f134_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f134_local1 = Engine.GetItemAllocationCost( f134_arg0, f134_local0 )
	local f134_local2 = Engine.GetItemAllocationCost( f134_arg1, f134_local0 )
	if f134_local1 == f134_local2 then
		return Engine.GetItemMomentumCost( f134_arg0, f134_local0 ) < Engine.GetItemMomentumCost( f134_arg1, f134_local0 )
	else
		return f134_local1 < f134_local2
	end
end

CoD.GetFactionColor = function ( f135_arg0, f135_arg1 )
	return CoD.factionColor[f135_arg0][f135_arg1]
end

CoD.GetFaction = function ()
	return "seals"
end

CoD.GetTeamColor = function ( f137_arg0, f137_arg1 )
	if CoD.IsShoutcaster( f137_arg0 ) and CoD.ShoutcasterProfileVarBool( f137_arg0, "shoutcaster_flip_scorepanel" ) then
		if f137_arg1 == Enum.team_t.TEAM_ALLIES then
			f137_arg1 = Enum.team_t.TEAM_AXIS
		elseif f137_arg1 == Enum.team_t.TEAM_AXIS then
			f137_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f137_arg1 )
end

CoD.GetTeamID = function ( f138_arg0 )
	local f138_local0 = Engine.GetTeamIDByXUID( Engine.GetXUID64( f138_arg0 ) )
	if f138_local0 then
		return f138_local0
	end
	local f138_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if f138_local1 and f138_local1.sessionClients then
		for f138_local5, f138_local6 in ipairs( f138_local1.sessionClients ) do
			local f138_local7 = f138_local6.team
			if Engine.GetXUID64( f138_arg0 ) == f138_local6.xuid then
				return f138_local7
			end
		end
		
	end
	return Enum.team_t.TEAM_BAD
end

CoD.GetDefaultTeamName = function ( f139_arg0 )
	if f139_arg0 == Enum.team_t.TEAM_ALLIES then
		return "MPUI_ALLIES"
	elseif f139_arg0 == Enum.team_t.TEAM_AXIS then
		return "MPUI_AXIS"
	elseif CoD.isMultiplayer or CoD.isCampaign then
		if f139_arg0 == Enum.team_t.TEAM_SPECTATOR then
			return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
		elseif f139_arg0 == Enum.team_t.TEAM_FREE then
			return CoD.teamName[Enum.team_t.TEAM_FREE]
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if f139_arg0 == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
				return Dvar.g_customTeamName_Allies:get()
			elseif f139_arg0 == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
				return Dvar.g_customTeamName_Axis:get()
			end
		end
		return Engine.GetFactionForTeam( f139_arg0 )
	elseif f139_arg0 == Enum.team_t.TEAM_ALLIES then
		return Dvar.g_TeamName_Allies:get()
	elseif f139_arg0 == Enum.team_t.TEAM_AXIS then
		return Dvar.g_TeamName_Axis:get()
	elseif f139_arg0 == Enum.team_t.TEAM_SPECTATOR then
		return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
	else
		return CoD.teamName[f139_arg0]
	end
end

CoD.GetDefaultTeamFactionColor = function ( f140_arg0 )
	local f140_local0 = ColorSet.CodCaster
	if f140_arg0 == Enum.team_t.TEAM_ALLIES then
		f140_local0 = ColorSet.FactionAllies
	elseif f140_arg0 == Enum.team_t.TEAM_AXIS then
		f140_local0 = ColorSet.FactionAxis
	elseif f140_arg0 == Enum.team_t.TEAM_SPECTATOR then
		f140_local0 = ColorSet.CodCaster
	end
	return string.format( "%d %d %d", f140_local0.r * 255, f140_local0.g * 255, f140_local0.b * 255 )
end

CoD.GetDefaultTeamFactionIcon = function ( f141_arg0 )
	if f141_arg0 == Enum.team_t.TEAM_ALLIES then
		return "faction_allies"
	elseif f141_arg0 == Enum.team_t.TEAM_AXIS then
		return "faction_axis"
	else
		return ""
	end
end

function ShouldUseCustomTeamIdentity( f142_arg0 )
	if not CoD.IsShoutcaster( f142_arg0 ) then
		return false
	elseif not CoD.ShoutcasterProfileVarBool( f142_arg0, "shoutcaster_fe_team_identity" ) then
		return false
	else
		return true
	end
end

f0_local2 = function ( f143_arg0 )
	if not CoD.IsShoutcaster( f143_arg0 ) then
		return false
	elseif CoD.ShoutcasterProfileVarBool( f143_arg0, "shoutcaster_team_identity" ) then
		return false
	else
		return true
	end
end

f0_local3 = function ( f144_arg0 )
	if f144_arg0 == "team2" then
		return Engine.Localize( "CODCASTER_TEAM2" )
	else
		return Engine.Localize( "CODCASTER_TEAM1" )
	end
end

CoD.GetCodCasterTeamName = function ( f145_arg0, f145_arg1 )
	local f145_local0 = nil
	if f145_arg1 == Enum.team_t.TEAM_ALLIES then
		f145_local0 = "team1"
	elseif f145_arg1 == Enum.team_t.TEAM_AXIS then
		f145_local0 = "team2"
	end
	if f145_local0 then
		local f145_local1 = CoD.ShoutcasterProfileVarValue( f145_arg0, "shoutcaster_fe_" .. f145_local0 .. "_name" )
		if f145_local1 ~= nil then
			if f145_local1 == "" then
				return f0_local3( f145_local0 )
			else
				return f145_local1
			end
		end
	end
	return Engine.Localize( CoD.GetDefaultTeamName( f145_arg1 ) )
end

CoD.GetCodCasterTeamColor = function ( f146_arg0, f146_arg1 )
	local f146_local0 = nil
	if f146_arg1 == Enum.team_t.TEAM_ALLIES then
		f146_local0 = "team1"
	elseif f146_arg1 == Enum.team_t.TEAM_AXIS then
		f146_local0 = "team2"
	end
	if f146_local0 then
		local f146_local1 = CoD.GetCodCasterTeamColorInformation( f146_arg0, CoD.ShoutcasterProfileVarValue( f146_arg0, "shoutcaster_fe_" .. f146_local0 .. "_color" ), "color" )
		if f146_local1 ~= nil then
			return f146_local1
		end
	end
	return CoD.GetDefaultTeamFactionColor( f146_arg1 )
end

CoD.GetCodCasterTeamEffectColor = function ( f147_arg0, f147_arg1 )
	local f147_local0 = nil
	if f147_arg1 == Enum.team_t.TEAM_ALLIES then
		f147_local0 = "team1"
	elseif f147_arg1 == Enum.team_t.TEAM_AXIS then
		f147_local0 = "team2"
	end
	if f147_local0 then
		local f147_local1 = CoD.GetCodCasterTeamColorInformation( f147_arg0, CoD.ShoutcasterProfileVarValue( f147_arg0, "shoutcaster_fe_" .. f147_local0 .. "_color" ), "colorEffect" )
		if f147_local1 ~= nil then
			return f147_local1
		end
	end
	return CoD.GetDefaultTeamFactionColor( f147_arg1 )
end

CoD.GetCodCasterTeamObituaryFontColor = function ( f148_arg0, f148_arg1 )
	local f148_local0 = nil
	if f148_arg1 == Enum.team_t.TEAM_ALLIES then
		f148_local0 = "team1"
	elseif f148_arg1 == Enum.team_t.TEAM_AXIS then
		f148_local0 = "team2"
	end
	if f148_local0 then
		local f148_local1 = CoD.GetCodCasterTeamColorInformation( f148_arg0, CoD.ShoutcasterProfileVarValue( f148_arg0, "shoutcaster_fe_" .. f148_local0 .. "_color" ), "colorObituaryFont" )
		if f148_local1 ~= nil then
			return f148_local1
		end
	end
	return CoD.GetDefaultTeamFactionColor( f148_arg1 )
end

CoD.GetDefaultCodCasterFactionIcon = function ( f149_arg0 )
	if f149_arg0 == Enum.team_t.TEAM_ALLIES then
		return "uie_t7_codcaster_faction1"
	elseif f149_arg0 == Enum.team_t.TEAM_AXIS then
		return "uie_t7_codcaster_faction2"
	else
		return ""
	end
end

CoD.GetCodCasterFactionIcon = function ( f150_arg0, f150_arg1 )
	local f150_local0 = nil
	if f150_arg1 == Enum.team_t.TEAM_ALLIES then
		f150_local0 = "team1"
	elseif f150_arg1 == Enum.team_t.TEAM_AXIS then
		f150_local0 = "team2"
	end
	if f150_local0 then
		local f150_local1 = CoD.GetCodCasterTeamLogoInformation( f150_arg0, CoD.ShoutcasterProfileVarValue( f150_arg0, "shoutcaster_fe_" .. f150_local0 .. "_icon" ), "ref" )
		if f150_local1 ~= nil then
			return f150_local1
		end
	end
	return CoD.GetDefaultCodCasterFactionIcon( f150_arg1 )
end

CoD.GetTeamName = function ( f151_arg0 )
	local f151_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f151_local0 ) then
		if ShouldUseCustomTeamIdentity( f151_local0 ) then
			return CoD.GetCodCasterTeamName( f151_local0, f151_arg0 )
		else
			return Engine.Localize( CoD.GetDefaultTeamName( f151_arg0 ) )
		end
	else
		return CoD.GetDefaultTeamName( f151_arg0 )
	end
end

CoD.GetTeamFactionColor = function ( f152_arg0 )
	local f152_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f152_local0 ) then
		if ShouldUseCustomTeamIdentity( f152_local0 ) then
			return CoD.GetCodCasterTeamColor( f152_local0, f152_arg0 )
		end
		local f152_local1 = ColorSet.CodCaster
		if f152_arg0 == Enum.team_t.TEAM_ALLIES then
			f152_local1 = CoD.GetColorBlindColorForPlayer( f152_local0, "FriendlyBlue" )
		elseif f152_arg0 == Enum.team_t.TEAM_SPECTATOR then
			f152_local1 = ColorSet.CodCaster
		else
			f152_local1 = CoD.GetColorBlindColorForPlayer( f152_local0, "EnemyOrange" )
		end
		return string.format( "%d %d %d", f152_local1.r * 255, f152_local1.g * 255, f152_local1.b * 255 )
	else
		return CoD.GetDefaultTeamFactionColor( f152_arg0 )
	end
end

CoD.GetTeamFactionColorEffect = function ( f153_arg0 )
	local f153_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f153_local0 ) then
		if ShouldUseCustomTeamIdentity( f153_local0 ) then
			return CoD.GetCodCasterTeamEffectColor( f153_local0, f153_arg0 )
		else
			return CoD.GetTeamFactionColor( f153_arg0 )
		end
	else
		return CoD.GetDefaultTeamFactionColor( f153_arg0 )
	end
end

CoD.GetTeamFactionColorObituaryFont = function ( f154_arg0 )
	local f154_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f154_local0 ) then
		if ShouldUseCustomTeamIdentity( f154_local0 ) then
			return CoD.GetCodCasterTeamObituaryFontColor( f154_local0, f154_arg0 )
		else
			return CoD.GetTeamFactionColor( f154_arg0 )
		end
	else
		return CoD.GetDefaultTeamFactionColor( f154_arg0 )
	end
end

CoD.GetTeamFactionIcon = function ( f155_arg0 )
	local f155_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f155_local0 ) then
		if f0_local2( f155_local0 ) then
			return "blacktransparent"
		elseif ShouldUseCustomTeamIdentity( f155_local0 ) then
			return CoD.GetCodCasterFactionIcon( f155_local0, f155_arg0 )
		else
			return CoD.GetDefaultCodCasterFactionIcon( f155_arg0 )
		end
	else
		return CoD.GetDefaultTeamFactionIcon( f155_arg0 )
	end
end

CoD.GetTeamNameCaps = function ( f156_arg0 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		if f156_arg0 == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Allies:get() )
		elseif f156_arg0 == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Axis:get() )
		end
	end
	if CoD.IsShoutcaster( Engine.GetPrimaryController() ) then
		local f156_local0 = CoD.GetTeamName( f156_arg0 )
		if f156_local0 ~= "" then
			return Engine.ToUpper( f156_local0 )
		else
			return f156_local0
		end
	end
	local f156_local0 = CoD.GetTeamName( f156_arg0 ) .. "_CAPS"
	if f156_arg0 == Enum.team_t.TEAM_SPECTATOR then
		f156_local0 = "MPUI_SHOUTCASTER_SHORT_CAPS"
	end
	return Engine.Localize( f156_local0 )
end

CoD.GetColorFromFormattedColorString = function ( f157_arg0 )
	local f157_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f157_arg0 )
	if #f157_local0 ~= 3 then
		return 
	end
	local f157_local1 = 1
	for f157_local2 = 1, #f157_local0, 1 do
		if f157_local0[f157_local2] > 1 then
			f157_local0[f157_local2] = f157_local0[f157_local2] * 0
		else
			f157_local0[f157_local2] = f157_local0[f157_local2] * 1
		end
	end
	return {
		r = f157_local0[1],
		g = f157_local0[2],
		b = f157_local0[3]
	}
end

CoD.ExplodeColor = function ( f158_arg0 )
	if not f158_arg0 then
		f158_arg0 = {}
	end
	return f158_arg0.r or 0, f158_arg0.g or 0, f158_arg0.b or 0
end

CoD.UpdateColorSet = function ( f159_arg0, f159_arg1 )
	if not ColorSet[f159_arg0] then
		return 
	else
		local f159_local0 = CoD.GetColorFromFormattedColorString( f159_arg1 )
		ColorSet[f159_arg0] = f159_local0
		Engine.UpdateColorSet( f159_arg0, f159_local0 )
	end
end

CoD.GetColorSetFriendlyColor = function ( f160_arg0, f160_arg1 )
	local f160_local0 = ColorSet.White
	if CoD.IsShoutcaster( f160_arg0 ) then
		if f160_arg1 == Enum.team_t.TEAM_ALLIES then
			f160_local0 = ColorSet.CodCasterFactionAllies
		elseif f160_arg1 == Enum.team_t.TEAM_AXIS then
			f160_local0 = ColorSet.CodCasterFactionAxis
		end
	else
		f160_local0 = CoD.GetColorBlindColorForPlayer( f160_arg0, "FriendlyBlue" )
	end
	return f160_local0
end

CoD.GetColorSetEnemyColor = function ( f161_arg0, f161_arg1 )
	local f161_local0 = ColorSet.White
	if CoD.IsShoutcaster( f161_arg0 ) then
		if f161_arg1 == Enum.team_t.TEAM_ALLIES then
			f161_local0 = ColorSet.CodCasterFactionAllies
		elseif f161_arg1 == Enum.team_t.TEAM_AXIS then
			f161_local0 = ColorSet.CodCasterFactionAxis
		end
	else
		f161_local0 = CoD.GetColorBlindColorForPlayer( f161_arg0, "EnemyOrange" )
	end
	return f161_local0
end

CoD.GetColorSetFriendlyOrShoutCasterColor = function ( f162_arg0 )
	local f162_local0 = nil
	if CoD.IsShoutcaster( f162_arg0 ) then
		f162_local0 = ColorSet.CodCasterFactionAllies
	else
		f162_local0 = CoD.GetColorBlindColorForPlayer( f162_arg0, "FriendlyBlue" )
	end
	return f162_local0
end

CoD.GetColorSetEnemyOrShoutCasterColor = function ( f163_arg0 )
	local f163_local0 = nil
	if CoD.IsShoutcaster( f163_arg0 ) then
		f163_local0 = ColorSet.CodCasterFactionAxis
	else
		f163_local0 = CoD.GetColorBlindColorForPlayer( f163_arg0, "EnemyOrange" )
	end
	return f163_local0
end

CoD.GetColorSetFriendlyOrShoutCasterAltColor = function ( f164_arg0 )
	local f164_local0 = nil
	if CoD.IsShoutcaster( f164_arg0 ) then
		f164_local0 = ColorSet.CodCasterFactionAlliesObituaryFont
	else
		f164_local0 = CoD.GetColorBlindColorForPlayer( f164_arg0, "FriendlyBlue" )
	end
	return f164_local0
end

CoD.GetColorSetEnemyOrShoutCasterAltColor = function ( f165_arg0 )
	local f165_local0 = nil
	if CoD.IsShoutcaster( f165_arg0 ) then
		f165_local0 = ColorSet.CodCasterFactionAxisObituaryFont
	else
		f165_local0 = CoD.GetColorBlindColorForPlayer( f165_arg0, "EnemyOrange" )
	end
	return f165_local0
end

CoD.GetLoadingScreenGameTypeIconName = function ()
	return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "image" )
end

CoD.GetGameTypeIconName = function ()
	return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "image" )
end

CoD.IsSpectatingAllowed = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
		return false
	elseif Engine.GetGametypeSetting( "allowSpectating" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsTeamChangeAllowed = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
		return false
	elseif Engine.GetGametypeSetting( "allowInGameTeamChange" ) == 1 then
		return true
	else
		return false
	end
end

CoD.GetAnimationStateForUserSafeArea = function ( f170_arg0 )
	local f170_local0, f170_local1 = Engine.GetUserSafeArea()
	return {
		leftAnchor = false,
		rightAnchor = false,
		left = -f170_local0 / 2,
		right = f170_local0 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -f170_local1 / 2,
		bottom = f170_local1 / 2
	}
end

CoD.GetDefaultAnimationState = function ()
	return {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
end

CoD.ShowNewLoadingScreen = function ()
	return Engine.IsMultiplayerGame()
end

CoD.ShowNewScoreboard = function ()
	if Engine.IsMultiplayerGame() and Dvar.ui_gametype:get() == "fr" then
		return false
	else
		return true
	end
end

CoD.AddDebugBackground = function ( f174_arg0, f174_arg1 )
	local f174_local0 = 1
	local f174_local1 = 1
	local f174_local2 = 1
	local f174_local3 = 0.25
	if f174_arg1 ~= nil then
		f174_local0 = f174_arg1.r
		f174_local1 = f174_arg1.g
		f174_local2 = f174_arg1.b
		f174_local3 = f174_arg1.a
	end
	f174_arg0:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		red = f174_local0,
		green = f174_local1,
		blue = f174_local2,
		alpha = f174_local3
	} ) )
end

CoD.SetPreviousAllocation = function ( f175_arg0 )
	local f175_local0 = Engine.GetCustomClass( f175_arg0, CoD.perController[f175_arg0].classNum )
	CoD.previousAllocationAmount = f175_local0.allocationSpent
end

CoD.SetupBarracksLock = function ( f176_arg0 )
	f176_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_BARRACKS_DESC", "ZMUI_LEADERBOARDS_DESC" ) )
end

CoD.SetupBarracksNew = function ( f177_arg0 )
	f177_arg0:registerEventHandler( "barracks_closed", CoD.SetupBarracksNew )
	f177_arg0:showNewIcon( Engine.IsAnyEmblemIconNew( Engine.GetPrimaryController() ) )
end

CoD.SetupMatchmakingLock = function ( f178_arg0 )
	f178_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_PLAYER_MATCH_DESC", "ZMUI_PLAYER_MATCH_DESC" ) )
end

CoD.SetupCustomGamesLock = function ( f179_arg0 )
	if Engine.IsBetaBuild() then
		f179_arg0:lock()
		f179_arg0.hintText = Engine.Localize( "FEATURE_CUSTOM_GAMES_LOCKED" )
	else
		f179_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_CUSTOM_MATCH_DESC", "ZMUI_CUSTOM_MATCH_DESC" ) )
	end
end

CoD.IsShoutcaster = function ( f180_arg0 )
	if Engine.IsDemoPlaying() then
		if Engine.IsDemoShoutcaster() then
			return true
		end
	else
		local f180_local0 = Engine.GetModel( Engine.GetModelForController( f180_arg0 ), "factions.isCoDCaster" )
		local f180_local1 = true
		if f180_local0 then
			local f180_local2 = Engine.GetModelValue( f180_local0 )
			if f180_local2 ~= nil then
				f180_local1 = f180_local2
			end
		end
		if f180_local1 and (CoD.GetTeamID( f180_arg0 ) == Enum.team_t.TEAM_SPECTATOR or Engine.IsShoutcaster( f180_arg0 )) then
			return true
		end
	end
	return false
end

CoD.GetPlayerStats = function ( f181_arg0, f181_arg1 )
	if f181_arg1 then
		return Engine.GetPlayerStats( f181_arg0, f181_arg1 )
	else
		return Engine.GetPlayerStats( f181_arg0 )
	end
end

CoD.ExeProfileVarBool = function ( f182_arg0, f182_arg1 )
	local f182_local0 = Engine.GetPlayerCommonGamerProfile( f182_arg0 )
	if f182_local0 ~= nil and f182_local0[f182_arg1] ~= nil and f182_local0[f182_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.GetColorBlindSafeColorForSetting = function ( f183_arg0, f183_arg1 )
	local f183_local0 = f183_arg0
	if f183_arg1 == Enum.ColorVisionDeficiencies.CVD_DEUTERANOMALY then
		f183_local0 = f183_local0 .. "_Deuteranopia"
	elseif f183_arg1 == Enum.ColorVisionDeficiencies.CVD_PROTANOMALY then
		f183_local0 = f183_local0 .. "_Protanopia"
	elseif f183_arg1 == Enum.ColorVisionDeficiencies.CVD_TRITANOMALY then
		f183_local0 = f183_local0 .. "_Tritanopia"
	end
	local f183_local1 = ColorSet[f183_local0]
	if not f183_local1 then
		f183_local1 = ColorSet[f183_arg0]
	end
	return f183_local1
end

CoD.GetColorBlindColorForPlayer = function ( f184_arg0, f184_arg1, f184_arg2 )
	if not IsLuaCodeVersionAtLeast( 17 ) then
		return ColorSet[f184_arg1]
	end
	local f184_local0 = Enum.ColorVisionDeficiencies.CVD_OFF
	local f184_local1 = Engine.GetPlayerCommonGamerProfile( f184_arg0 )
	if f184_local1 ~= nil and f184_local1.colorBlindMode ~= nil then
		f184_local0 = f184_local1.colorBlindMode:get()
		if f184_arg2 ~= nil then
			f184_arg2.setting = f184_local0
		end
	end
	return CoD.GetColorBlindSafeColorForSetting( f184_arg1, f184_local0 )
end

CoD.ShoutcasterProfileVarBool = function ( f185_arg0, f185_arg1 )
	local f185_local0 = Engine.StorageGetBuffer( f185_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f185_local0 ~= nil and f185_local0[f185_arg1] ~= nil and f185_local0[f185_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ShoutcasterProfileVarValue = function ( f186_arg0, f186_arg1 )
	local f186_local0 = Engine.StorageGetBuffer( f186_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f186_local0 ~= nil and f186_local0[f186_arg1] ~= nil then
		return f186_local0[f186_arg1]:get()
	else
		return nil
	end
end

CoD.SetShoutcasterProfileVarValue = function ( f187_arg0, f187_arg1, f187_arg2 )
	local f187_local0 = Engine.StorageGetBuffer( f187_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f187_local0 ~= nil and f187_local0[f187_arg1] ~= nil then
		f187_local0[f187_arg1]:set( f187_arg2 )
	end
	local f187_local1 = Engine.CreateModel( Engine.GetModelForController( f187_arg0 ), "CodCaster.profileSettingsUpdated" )
	if f187_local1 then
		Engine.ForceNotifyModelSubscriptions( f187_local1 )
	end
end

CoD.SetupTeamIdentityInformation = function ( f188_arg0, f188_arg1, f188_arg2 )
	local f188_local0 = DataSources.TeamIdentityInformation.getModel( f188_arg1, f188_arg2 )
	local f188_local1 = Enum.team_t.TEAM_ALLIES
	if f188_arg2 == "team2" then
		f188_local1 = Enum.team_t.TEAM_AXIS
	end
	local f188_local2 = CoD.GetDefaultTeamName( f188_local1 )
	local f188_local3 = CoD.GetDefaultCodCasterFactionIcon( f188_local1 )
	local f188_local4 = ""
	local f188_local5 = CoD.GetDefaultTeamFactionColor( f188_local1 )
	if CoD.ShoutcasterProfileVarBool( f188_arg1, "shoutcaster_fe_team_identity" ) then
		if CoD.ShoutcasterProfileVarValue( f188_arg1, "shoutcaster_fe_" .. f188_arg2 .. "_name" ) == "" then
			f188_local2 = f0_local3( f188_arg2 )
		end
		f188_local3 = CoD.GetCodCasterTeamLogoInformation( f188_arg1, CoD.ShoutcasterProfileVarValue( f188_arg1, "shoutcaster_fe_" .. f188_arg2 .. "_icon" ), "ref" )
		f188_local4 = CoD.GetCodCasterTeamLogoInformation( f188_arg1, CoD.ShoutcasterProfileVarValue( f188_arg1, "shoutcaster_fe_" .. f188_arg2 .. "_icon" ), "name" )
		f188_local5 = CoD.GetCodCasterTeamColorInformation( f188_arg1, CoD.ShoutcasterProfileVarValue( f188_arg1, "shoutcaster_fe_" .. f188_arg2 .. "_color" ), "color" )
	end
	Engine.SetModelValue( Engine.CreateModel( f188_local0, "teamName" ), f188_local2 )
	Engine.SetModelValue( Engine.CreateModel( f188_local0, "teamLogo" ), f188_local3 )
	Engine.SetModelValue( Engine.CreateModel( f188_local0, "teamLogoName" ), f188_local4 )
	Engine.SetModelValue( Engine.CreateModel( f188_local0, "teamColor" ), f188_local5 )
end

CoD.IsInOvertime = function ( f189_arg0 )
	if Enum.UIVisibilityBit.BIT_OVERTIME and Engine.IsVisibilityBitSet( f189_arg0, Enum.UIVisibilityBit.BIT_OVERTIME ) then
		return true
	else
		return false
	end
end

CoD.MPZM = function ( f190_arg0, f190_arg1 )
	if CoD.isZombie == true then
		return f190_arg1
	else
		return f190_arg0
	end
end

CoD.SPMPZM = function ( f191_arg0, f191_arg1, f191_arg2 )
	if CoD.isSinglePlayer == true then
		return f191_arg0
	elseif CoD.isZombie == true then
		return f191_arg2
	elseif CoD.isMultiplayer == true then
		return f191_arg1
	else
		return nil
	end
end

CoD.CPMPZM = function ( f192_arg0, f192_arg1, f192_arg2 )
	if CoD.isCampaign == true then
		return f192_arg0
	elseif CoD.isMultiplayer == true then
		return f192_arg1
	elseif CoD.isZombie == true then
		return f192_arg2
	else
		return nil
	end
end

CoD.CPMPZMINV = function ( f193_arg0, f193_arg1, f193_arg2, f193_arg3 )
	if CoD.isCampaign == true then
		return f193_arg0
	elseif CoD.isMultiplayer == true then
		return f193_arg1
	elseif CoD.isZombie == true then
		return f193_arg2
	else
		return f193_arg3
	end
end

CoD.pairsByKeys = function ( f194_arg0, f194_arg1 )
	local f194_local0 = {}
	for f194_local4, f194_local5 in pairs( f194_arg0 ) do
		table.insert( f194_local0, f194_local4 )
	end
	table.sort( f194_local0, f194_arg1 )
	f194_local1 = 0
	return function ()
		f194_local1 = f194_local1 + 1
		if f194_local0[f194_local1] == nil then
			return nil
		else
			return f194_local0[f194_local1], f194_arg0[f194_local0[f194_local1]]
		end
	end
	
end

CoD.UnlockablesDataSourceComparisonFunction = function ( f196_arg0, f196_arg1, f196_arg2 )
	local f196_local0 = CoD.SafeGetModelValue( f196_arg1, "isBMClassified" )
	local f196_local1 = CoD.SafeGetModelValue( f196_arg2, "isBMClassified" )
	if f196_local0 and not f196_local1 then
		return false
	elseif not f196_local0 and f196_local1 then
		return true
	end
	local f196_local2 = CoD.SafeGetModelValue( f196_arg1, "isContractClassified" )
	local f196_local3 = CoD.SafeGetModelValue( f196_arg2, "isContractClassified" )
	if f196_local2 and not f196_local3 then
		return false
	elseif not f196_local2 and f196_local3 then
		return true
	end
	local f196_local4 = CoD.SafeGetModelValue( f196_arg1, "itemIndex" )
	local f196_local5 = CoD.SafeGetModelValue( f196_arg2, "itemIndex" )
	if CoD.isZombie then
		if LuaUtils.FindItemInArray( CoD.CACUtility.BGBBuffGroups, CoD.SafeGetModelValue( f196_arg1, "group" ) ) and LuaUtils.FindItemInArray( CoD.CACUtility.BGBBuffGroups, CoD.SafeGetModelValue( f196_arg2, "group" ) ) then
			local f196_local6 = CoD.CACUtility.GetDLCIdForBubbleGum( f196_local4 )
			local f196_local7 = CoD.CACUtility.GetDLCIdForBubbleGum( f196_local5 )
			if f196_local6 ~= f196_local7 then
				local f196_local8
				if f196_local6 ~= "" then
					f196_local8 = Engine.HasEntitlement( f196_arg0, f196_local6 )
				else
					f196_local8 = true
				end
				local f196_local9
				if f196_local7 ~= "" then
					f196_local9 = Engine.HasEntitlement( f196_arg0, f196_local7 )
				else
					f196_local9 = true
				end
				if f196_local8 and not f196_local9 then
					return true
				elseif f196_local9 and not f196_local8 then
					return false
				elseif not f196_local8 and not f196_local9 then
					return CoD.SafeGetModelValue( f196_arg1, "dlcIndex" ) < CoD.SafeGetModelValue( f196_arg2, "dlcIndex" )
				end
			end
		end
	end
	local f196_local10 = CoD.WeaponListSessionMode
	local f196_local11, f196_local6 = nil
	if f196_local10 ~= nil then
		f196_local11 = Engine.GetItemSortKey( f196_local4, f196_local10 )
		f196_local6 = Engine.GetItemSortKey( f196_local5, f196_local10 )
	else
		f196_local11 = Engine.GetItemSortKey( f196_local4 )
		f196_local6 = Engine.GetItemSortKey( f196_local5 )
	end
	if f196_local11 == f196_local6 then
		return f196_local4 < f196_local5
	end
	return f196_local11 < f196_local6
end

CoD.UnlockablesComparisonFunction = function ( f197_arg0, f197_arg1 )
	local f197_local0 = Engine.GetItemSortKey( f197_arg0 )
	local f197_local1 = Engine.GetItemSortKey( f197_arg1 )
	if f197_local0 == f197_local1 then
		return f197_arg0 < f197_arg1
	else
		return f197_local0 < f197_local1
	end
end

CoD.GetUnlockablesByGroupName = function ( f198_arg0 )
	local f198_local0 = Engine.GetUnlockablesByGroupName( f198_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	table.sort( f198_local0, CoD.UnlockablesComparisonFunction )
	return f198_local0
end

CoD.GetUnlockablesBySlotName = function ( f199_arg0 )
	local f199_local0 = Engine.GetUnlockablesBySlotName( f199_arg0 )
	table.sort( f199_local0, CoD.UnlockablesComparisonFunction )
	return f199_local0
end

CoD.ShouldShowWeaponLevel = function ()
	return not Engine.AreAllItemsFree()
end

CoD.GetCenteredImage = function ( f201_arg0, f201_arg1, f201_arg2, f201_arg3 )
	local self = nil
	if f201_arg3 then
		self = LUI.UIStreamedImage.new( nil, nil, true )
	else
		self = LUI.UIImage.new()
	end
	self:setLeftRight( false, false, -f201_arg0 / 2, f201_arg0 / 2 )
	self:setTopBottom( false, false, -f201_arg1 / 2, f201_arg1 / 2 )
	if f201_arg2 then
		self:setImage( RegisterMaterial( f201_arg2 ) )
	end
	return self
end

CoD.GetStretchedImage = function ( f202_arg0, f202_arg1 )
	local self = nil
	if f202_arg1 then
		self = LUI.UIStreamedImage.new( nil, nil, true )
	else
		self = LUI.UIImage.new()
	end
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	if f202_arg0 then
		self:setImage( RegisterMaterial( f202_arg0 ) )
	end
	return self
end

CoD.GetTextElem = function ( f203_arg0, f203_arg1, f203_arg2, f203_arg3, f203_arg4 )
	local f203_local0 = "Default"
	local f203_local1 = LUI.Alignment.Center
	local f203_local2 = 0
	if f203_arg1 then
		f203_local1 = LUI.Alignment[f203_arg1]
	end
	if f203_arg0 then
		f203_local0 = f203_arg0
	end
	if f203_arg4 then
		f203_local2 = f203_arg4
	end
	local f203_local3 = CoD.fonts[f203_local0]
	local f203_local4 = CoD.textSize[f203_local0]
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f203_local2, f203_local2 + f203_local4 )
	self:setFont( f203_local3 )
	self:setAlignment( f203_local1 )
	if f203_arg2 then
		self:setText( f203_arg2 )
	end
	if f203_arg3 then
		self:setRGB( f203_arg3.r, f203_arg3.g, f203_arg3.b )
	end
	return self
end

CoD.GetInformationContainer = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	
	local infoContainerBackground = LUI.UIImage.new()
	infoContainerBackground:setLeftRight( true, true, 1, -1 )
	infoContainerBackground:setTopBottom( true, true, 1, -1 )
	infoContainerBackground:setRGB( 0, 0, 0 )
	infoContainerBackground:setAlpha( 0.4 )
	self:addElement( infoContainerBackground )
	self.infoContainerBackground = infoContainerBackground
	
	local infoContainerBackgroundGrad = LUI.UIImage.new()
	infoContainerBackgroundGrad:setLeftRight( true, true, 3, -3 )
	infoContainerBackgroundGrad:setTopBottom( true, true, 3, -3 )
	infoContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	infoContainerBackgroundGrad:setAlpha( 0.1 )
	self:addElement( infoContainerBackgroundGrad )
	self.infoContainerBackgroundGrad = infoContainerBackgroundGrad
	
	local imageContainer = LUI.UIElement.new()
	imageContainer:setLeftRight( true, true, 3, -3 )
	imageContainer:setTopBottom( true, true, 3, -3 )
	self:addElement( imageContainer )
	self.imageContainer = imageContainer
	
	self.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	self:addElement( self.border )
	return self
end

CoD.ModifyTextForReadability = function ( f205_arg0 )
	if f205_arg0 == nil then
		return f205_arg0
	elseif Dvar.loc_language:get() ~= CoD.LANGUAGE_JAPANESE and Dvar.loc_language:get() ~= CoD.LANGUAGE_FULLJAPANESE then
		f205_arg0 = string.gsub( string.gsub( f205_arg0, "0", "^BFONT_NUMBER_ZERO^" ), "I", "^BFONT_CAPITAL_I^" )
	end
	return f205_arg0
end

CoD.GetSpinnerWaitingOnEvent = function ( f206_arg0, f206_arg1 )
	local f206_local0 = 64
	if f206_arg1 then
		f206_local0 = f206_arg1
	end
	local f206_local1 = CoD.GetCenteredImage( f206_local0, f206_local0, "lui_loader" )
	f206_local1:registerEventHandler( f206_arg0, function ( element, event )
		element:close()
	end )
	return f206_local1
end

CoD.GetZombieGameTypeName = function ( f208_arg0, f208_arg1 )
	if CoD.isZombie then
		local f208_local0 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f208_arg0, "name_ref" )
		local f208_local1 = Engine.Localize( f208_local0 )
		if f208_arg1 ~= nil then
			f208_local0 = f208_local0 .. "_" .. f208_arg1
			local f208_local2 = Engine.Localize( f208_local0 )
			if string.match( f208_local2, f208_local0 ) == nil then
				f208_local1 = f208_local2
			end
		end
		return f208_local1
	else
		
	end
end

CoD.GetZombieGameTypeDescription = function ( f209_arg0, f209_arg1 )
	if CoD.isZombie then
		local f209_local0 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f209_arg0, "description" )
		local f209_local1 = Engine.Localize( f209_local0 )
		if f209_arg1 ~= nil then
			f209_local0 = string.gsub( f209_local0, "_CAPS", "" ) .. "_" .. f209_arg1 .. "_CAPS"
			local f209_local2 = Engine.Localize( f209_local0 )
			if string.match( f209_local2, f209_local0 ) == nil then
				f209_local1 = f209_local2
			end
		end
		return f209_local1
	else
		
	end
end

CoD.NormalizeColor = function ( f210_arg0 )
	local f210_local0 = {}
	local f210_local1 = 1
	for f210_local5 in string.gmatch( f210_arg0, "[^%s]+" ) do
		f210_local0[f210_local1] = tonumber( f210_local5 ) / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
		f210_local1 = f210_local1 + 1
	end
	return f210_local0
end

CoD.ConvertColor = function ( f211_arg0, f211_arg1, f211_arg2 )
	return string.format( "%d %d %d", f211_arg0 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, f211_arg1 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, f211_arg2 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
end

CoD.ClampColor = function ( f212_arg0, f212_arg1, f212_arg2 )
	if f212_arg2 < f212_arg0 then
		f212_arg0 = f212_arg2
	elseif f212_arg0 < f212_arg1 then
		f212_arg0 = f212_arg1
	end
	return f212_arg0
end

CoD.LerpColor = function ( f213_arg0, f213_arg1, f213_arg2 )
	f213_arg2 = math.min( math.max( 0, f213_arg2 ), 1 )
	return {
		r = f213_arg0.r * (1 - f213_arg2) + f213_arg1.r * f213_arg2,
		g = f213_arg0.g * (1 - f213_arg2) + f213_arg1.g * f213_arg2,
		b = f213_arg0.b * (1 - f213_arg2) + f213_arg1.b * f213_arg2
	}
end

CoD.BaseN = function ( f214_arg0, f214_arg1 )
	local f214_local0 = math.floor( f214_arg0 )
	if not f214_arg1 or f214_arg1 == 10 then
		return tostring( f214_local0 )
	end
	local f214_local1 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local f214_local2 = {}
	local f214_local3 = ""
	if f214_local0 < 0 then
		f214_local3 = "-"
		f214_local0 = -f214_local0
		repeat
			local f214_local4 = f214_local0 % f214_arg1 + 1
			f214_local0 = math.floor( f214_local0 / f214_arg1 )
			table.insert( f214_local2, 1, f214_local1:sub( f214_local4, f214_local4 ) )
		until f214_local0 == 0
		return f214_local3 .. table.concat( f214_local2, "" )
	end
	local f214_local4 = f214_local0 % f214_arg1 + 1
	f214_local0 = math.floor( f214_local0 / f214_arg1 )
	table.insert( f214_local2, 1, f214_local1:sub( f214_local4, f214_local4 ) )
end

CoD.GetNumValuesFromSpaceSeparatedString = function ( f215_arg0 )
	local f215_local0 = {}
	for f215_local4 in string.gmatch( f215_arg0, "%d+%.*%d*" ) do
		table.insert( f215_local0, tonumber( f215_local4 ) )
	end
	return f215_local0
end

CoD.GetVectorComponentFromString = function ( f216_arg0, f216_arg1 )
	if type( f216_arg0 ) == "string" then
		local f216_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f216_arg0 )
		if f216_arg1 > 0 and f216_arg1 <= #f216_local0 then
			return f216_local0[f216_arg1]
		else
			return 0
		end
	elseif f216_arg1 == 1 then
		return f216_arg0
	else
		return 0
	end
end

CoD.SwapFocusableElements = function ( f217_arg0, f217_arg1, f217_arg2 )
	if f217_arg1 then
		f217_arg1:processEvent( {
			name = "lose_focus",
			controller = f217_arg0
		} )
		f217_arg1:makeNotFocusable()
	end
	if f217_arg2 then
		f217_arg2:makeFocusableWithoutResettingNavigation()
		f217_arg2:processEvent( {
			name = "gain_focus",
			controller = f217_arg0
		} )
	end
end

CoD.CopyModelValue = function ( f218_arg0, f218_arg1, f218_arg2, f218_arg3, f218_arg4 )
	local f218_local0 = f218_arg1:getModel( f218_arg0, f218_arg2 )
	local f218_local1 = f218_arg3:getModel( f218_arg0, f218_arg4 )
	if f218_local0 and f218_local1 then
		Engine.SetModelValue( f218_local1, Engine.GetModelValue( f218_local0 ) )
	end
end

CoD.GetTimeText = function ( f219_arg0 )
	local f219_local0 = f219_arg0
	local f219_local1 = math.floor( f219_local0 / 60000 )
	return string.format( "%d:%02d", f219_local1, (f219_local0 - f219_local1 * 60 * 1000) / 1000 )
end

CoD.GetKDRatio = function ( f220_arg0, f220_arg1 )
	local f220_local0 = 0
	if f220_arg1 <= 0 then
		return f220_arg0
	else
		local f220_local1, f220_local2 = math.modf( f220_arg0 / f220_arg1 )
		return f220_local1 .. "." .. math.floor( f220_local2 * 100 )
	end
end

CoD.GetRandomPlayerCardBackingForPlayer = function ( f221_arg0 )
	if not CoD.RandomPlayerCardsImageNames then
		CoD.RandomPlayerCardsImageNames = {
			"uie_t7_icon_callingcard_temp1_lrg",
			"uie_t7_icon_callingcard_temp2_lrg",
			"uie_t7_icon_callingcard_temp3_lrg",
			"uie_t7_icon_callingcard_temp4_lrg"
		}
	end
	if not CoD.RandomPlayerCardMapping then
		CoD.RandomPlayerCardMapping = {}
	end
	local f221_local0 = 1
	if not CoD.RandomPlayerCardMapping[f221_arg0] then
		CoD.RandomPlayerCardMapping[f221_arg0] = math.random( 1, 2 )
	end
	return CoD.RandomPlayerCardsImageNames[CoD.RandomPlayerCardMapping[f221_arg0]]
end

CoD.SafeGetModelValue = function ( f222_arg0, f222_arg1 )
	local f222_local0 = f222_arg0 and Engine.GetModel( f222_arg0, f222_arg1 )
	return f222_local0 and Engine.GetModelValue( f222_local0 )
end

CoD.GetScriptNotifyData = function ( f223_arg0 )
	local f223_local0 = f223_arg0 and Engine.GetModel( f223_arg0, "numArgs" )
	local f223_local1 = f223_local0 and Engine.GetModelValue( f223_local0 )
	local f223_local2 = nil
	if f223_local1 ~= nil and f223_local1 > 0 then
		f223_local2 = {}
	end
	for f223_local3 = 1, f223_local1, 1 do
		table.insert( f223_local2, CoD.SafeGetModelValue( f223_arg0, "arg" .. f223_local3 ) )
	end
	return f223_local2
end

CoD.GetContractStatValuesForIndex = function ( f224_arg0, f224_arg1, f224_arg2, f224_arg3, f224_arg4 )
	if not f224_arg2 then
		f224_arg2 = Engine.StorageGetBuffer( f224_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	end
	if not f224_arg2 then
		return nil
	end
	local f224_local0 = f224_arg2.contracts
	if f224_arg3 then
		f224_local0 = f224_arg2.contractsAAR
	end
	if not f224_local0 or #f224_local0 <= f224_arg1 then
		return nil
	end
	local f224_local1 = f224_local0[f224_arg1]
	local f224_local2 = {
		isActive = f224_local1.active:get(),
		isAwardGiven = f224_local1.award_given:get() == 1,
		index = f224_local1.index:get(),
		progress = f224_local1.progress:get()
	}
	local f224_local3 = tonumber( Engine.TableLookup( f224_arg0, CoD.contractTable_mp, 0, f224_local2.index, 2 ) )
	if not f224_local3 then
		f224_local3 = 0
	end
	f224_local2.targetValue = f224_local3
	f224_local3 = tonumber( Engine.TableLookup( f224_arg0, CoD.contractTable_mp, 0, f224_local2.index, 6 ) )
	if not f224_local3 then
		f224_local3 = 0
	end
	f224_local2.cost = f224_local3
	f224_local3 = Engine.TableLookup( f224_arg0, CoD.contractTable_mp, 0, f224_local2.index, 3 )
	local f224_local4 = Engine.TableLookup( f224_arg0, CoD.contractTable_mp, 0, f224_local2.index, 4 )
	local f224_local5 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f224_local2.index, 7 )
	local f224_local6 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f224_local2.index, 8 )
	local f224_local7 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f224_local2.index, 14 )
	local f224_local8 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f224_local2.index, 15 )
	if f224_local3 == "" then
		f224_local3 = "NULL"
	end
	f224_local2.descRef = "CONTRACT_" .. f224_local3 .. "_DESC"
	if f224_local4 ~= "" then
		f224_local3 = f224_local4
	end
	f224_local2.titleRef = "CONTRACT_" .. f224_local3
	f224_local2.category = ""
	f224_local2.image = ""
	f224_local2.backgroundId = 0
	f224_local2.camoName = ""
	if f224_local5 ~= "" then
		f224_local2.backgroundId = tonumber( Engine.TableLookup( nil, CoD.backgroundsTable, 4, Engine.TableLookup( nil, CoD.getStatsMilestoneTable( 6, Enum.eModes.MODE_MULTIPLAYER ), 4, f224_local5, 12 ), 1 ) )
		f224_local2.category = "calling_card"
	elseif f224_local6 ~= "" then
		local f224_local9 = Engine.TableLookup( nil, CoD.getStatsMilestoneTable( 6, Enum.eModes.MODE_MULTIPLAYER ), 4, f224_local6, 9 )
		f224_local2.image = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f224_local9, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_IMAGE )
		f224_local2.camoName = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f224_local9, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME )
		f224_local2.category = "camo"
		if f224_arg4 then
			f224_local2.image = f224_local2.image .. "_menu"
		end
	end
	if f224_local7 ~= "" then
		f224_local2.image = f224_local7
	end
	if f224_local8 ~= "" then
		f224_local2.category = f224_local8
	end
	return f224_local2
end

CoD.GetCombatRecordStatForPath = function ( f225_arg0, f225_arg1 )
	local f225_local0 = f225_arg0
	if not f225_local0 then
		return 
	end
	for f225_local4 in string.gmatch( f225_arg1, "[%w_]+" ) do
		f225_local0 = f225_local0[f225_local4]
		if not f225_local0 then
			return 
		end
	end
	f225_local1 = f225_local0.statValue
	if not f225_local1 then
		return f225_local0:get()
	elseif CoD.CombatRecordMode == "public" then
		f225_local2 = f225_local0.arenaValue
		if f225_local2 then
			return f225_local1:get() - f225_local2:get()
		end
	elseif CoD.CombatRecordMode == "arena" then
		f225_local2 = f225_local0.arenaValue
		if f225_local2 then
			return f225_local2:get()
		end
	end
	return f225_local1:get()
end

CoD.GetCombatRecordStatForPathOrZero = function ( f226_arg0, f226_arg1 )
	local f226_local0 = CoD.GetCombatRecordStatForPath( f226_arg0, f226_arg1 )
	if f226_local0 == nil then
		return 0
	else
		return f226_local0
	end
end

CoD.GetCombatRecordMode = function ()
	local f227_local0 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" )
	if f227_local0 == "cp" then
		return Enum.eModes.MODE_CAMPAIGN
	elseif f227_local0 == "zm" or f227_local0 == "doa" then
		return Enum.eModes.MODE_ZOMBIES
	else
		return Enum.eModes.MODE_MULTIPLAYER
	end
end

CoD.GetCombatRecordModeAbbreviation = function ()
	local f228_local0 = CoD.GetCombatRecordMode()
	if f228_local0 == Enum.eModes.MODE_MULTIPLAYER then
		return "mp"
	elseif f228_local0 == Enum.eModes.MODE_CAMPAIGN then
		return "cp"
	elseif f228_local0 == Enum.eModes.MODE_ZOMBIES then
		return "mp"
	else
		
	end
end

CoD.GetCombatRecordStats = function ( f229_arg0 )
	if CoD.CombatRecordOtherPlayerStats then
		return Engine.GetOtherPlayerStatsBuffer()
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
		return Engine.StorageGetBuffer( f229_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "zm" then
		return Engine.StorageGetBuffer( f229_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	else
		return Engine.StorageGetBuffer( f229_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	end
end

CoD.GetCombatRecordComparisonStats = function ( f230_arg0 )
	if CoD.CombatRecordOtherPlayerStats then
		if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
			return Engine.StorageGetBuffer( f230_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
		elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "zm" then
			return Engine.StorageGetBuffer( f230_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		else
			return Engine.StorageGetBuffer( f230_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		end
	else
		return Engine.GetOtherPlayerStatsBuffer()
	end
end

CoD.GetDisplayRatioFromTwoStats = function ( f231_arg0, f231_arg1 )
	if f231_arg0 and f231_arg1 then
		local f231_local0 = nil
		if f231_arg1 == 0 then
			f231_arg1 = 1
		end
		f231_local0 = f231_arg0 / f231_arg1
		if f231_local0 >= 100 then
			return math.floor( f231_local0 + 0.5 )
		else
			return string.format( "%.2f", math.floor( f231_local0 * 100 + 0.5 ) / 100 )
		end
	else
		return ""
	end
end

CoD.GetLocalClientAdjustedNum = function ( f232_arg0 )
	if CoD.isFrontend then
		return 0
	else
		return Engine.GetLocalClientNum( f232_arg0 )
	end
end

CoD.LiveEventUpdateCurrentFeed = function ()
	if not DataSources then
		return 
	end
	local f233_local0 = Dvar.hls_quality:get()
	for f233_local6, f233_local7 in ipairs( CoD.LiveEventQualities ) do
		if f233_local7.qualityId == f233_local0 then
			local f233_local4 = DataSources.LiveEventViewer.getModel()
			if f233_local4 then
				local f233_local5 = Engine.GetModel( f233_local4, "currentQuality" )
				if f233_local5 then
					Engine.SetModelValue( f233_local5, f233_local7.display )
				end
			end
		end
	end
end

CoD.StartLiveEventFromData = function ( f234_arg0 )
	StartLiveEvent( f234_arg0.controller, f234_arg0.liveEventStreamerIndex )
end

CoD.LiveEventAutoDetectQuality = {
	qualityId = "autodetect",
	display = Engine.Localize( "MENU_MLG_QUALITY_AUTODETECT" )
}
CoD.LiveEventNewQualities = function ( f235_arg0 )
	CoD.LiveEventQualities = {
		CoD.LiveEventAutoDetectQuality
	}
	local f235_local0 = {
		[CoD.LiveEventAutoDetectQuality.qualityId] = true
	}
	if not f235_arg0.availableQualities or f235_arg0.availableQualities == "" then
		CoD.LiveEventUpdateCurrentFeed()
		return 
	end
	local f235_local1 = "720"
	local f235_local2 = false
	local f235_local3 = false
	for f235_local12, f235_local13 in ipairs( LUI.splitString( f235_arg0.availableQualities, ";" ) ) do
		if f235_local13 ~= "" then
			local f235_local7 = LUI.splitString( f235_local13, "," )
			if #f235_local7 == 2 then
				local f235_local8 = LUI.splitString( f235_local7[2], "x" )
				if #f235_local8 == 2 then
					local f235_local9 = f235_local7[1]
					local f235_local10 = f235_local8[2]
					if not f235_local0[f235_local9] then
						f235_local0[f235_local9] = true
						local f235_local11 = nil
						if f235_local2 and IsMLGStream( Engine.GetPrimaryController() ) then
							f235_local2 = false
							f235_local3 = true
							f235_local11 = Engine.Localize( "MENU_MLG_QUALITY_BEST" )
						else
							f235_local11 = Engine.Localize( "MENU_MLG_QUALITY_NP", f235_local10 )
							if not f235_local3 and f235_local10 == f235_local1 then
								f235_local2 = true
							end
						end
						table.insert( CoD.LiveEventQualities, {
							qualityId = f235_local9,
							display = f235_local11
						} )
					end
				end
			end
			if #f235_local7 == 1 then
				local f235_local8 = f235_local7[1]
				if not f235_local0[f235_local8] then
					f235_local0[f235_local8] = true
					table.insert( CoD.LiveEventQualities, {
						qualityId = f235_local8,
						display = Engine.Localize( "MENU_VOD_QUALITY_" .. f235_local8 )
					} )
				end
			end
		end
	end
	if not f235_local0[Dvar.hls_quality:get()] then
		SelectLiveEventQuality_Internal( CoD.LiveEventAutoDetectQuality.qualityId )
	end
	CoD.LiveEventUpdateCurrentFeed()
	if DataSources and DataSources.LiveEventViewerQualities.Update then
		DataSources.LiveEventViewerQualities.Update()
	end
end

CoD.setupHorizontalScrollingWidget = function ( f236_arg0, f236_arg1 )
	local f236_local0 = function ( f237_arg0, f237_arg1, f237_arg2 )
		f237_arg0.textBox:beginAnimation( "move", f237_arg2 or 0 )
		f237_arg0.currentXOffset = f237_arg1
		f237_arg0.updatingScroll = true
		if IsCurrentLanguageReversed() then
			f237_arg0.textBox:setLeftRight( false, true, f237_arg0.currentXOffset - f237_arg0.totalTextWidth, f237_arg0.currentXOffset )
		else
			f237_arg0.textBox:setLeftRight( true, false, -f237_arg0.currentXOffset, f237_arg0.totalTextWidth - f237_arg0.currentXOffset )
		end
		f237_arg0.updatingScroll = false
	end
	
	local f236_local1 = function ( f238_arg0 )
		f236_local0( f238_arg0, 0 )
	end
	
	f236_arg0.autoScrollStartDelay = 2500
	f236_arg0.autoScrollSpeed = 0.4
	f236_arg0.autoScrollEndDelay = 2500
	f236_arg0.rightStickScrollSpeed = 0.7
	f236_arg0.allowAutoScrolling = true
	f236_arg0.allowRightStickScrolling = false
	local f236_local2 = 100
	local f236_local3 = 0
	local f236_local4 = 0
	local f236_local5 = true
	f236_arg0.currentXOffset = 0
	f236_arg0.scrollDistance = 0
	local f236_local6 = function ()
		f236_local4 = 0
		f236_local3 = 0
		f236_local5 = true
	end
	
	f236_local6()
	local f236_local7 = function ()
		local f240_local0 = f236_arg0:getWidth()
		f236_arg0.totalAreaWidth = f240_local0
		f236_arg0.totalTextWidth = f236_arg0.textBox:getTextWidth()
		local f240_local1, f240_local2 = f236_arg0.textBox:getLocalSize()
		f236_arg0.textLineWidth = f240_local1
		f236_arg0.scrollDistance = f236_arg0.totalTextWidth - f240_local0
		f236_local1( f236_arg0 )
		f236_local6()
	end
	
	SetupAutoHorizontalAlignArabicText( f236_arg0.textBox )
	LUI.OverrideFunction_CallOriginalFirst( f236_arg0.textBox, "setText", f236_local7 )
	f236_arg0:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		f236_local7()
		if not f236_arg0.updateTimer then
			local f241_local0 = Engine.GetModel( Engine.GetModelForController( f236_arg1 ), "RightStick" )
			local f241_local1 = nil
			if f241_local0 then
				f241_local1 = Engine.GetModel( f241_local0, "X" )
			end
			f236_arg0.updateTimer = LUI.UITimer.newElementTimer( f236_local2, false, function ( f242_arg0 )
				local f242_local0 = 0
				if f236_arg0.allowRightStickScrolling and f241_local1 then
					f242_local0 = -Engine.GetModelValue( f241_local1 ) * f236_arg0.rightStickScrollSpeed / f242_arg0.timeElapsed * 1000
				end
				if math.abs( f242_local0 ) > 0.05 then
					f236_local3 = 0
					f236_local5 = true
				elseif f236_local5 then
					f242_local0 = 0
					f236_local3 = f236_local3 + f242_arg0.timeElapsed
					if f236_arg0.autoScrollStartDelay <= f236_local3 then
						f236_local5 = false
					end
				end
				if not f236_local5 and 0 < f236_arg0.autoScrollSpeed and f236_arg0.allowAutoScrolling then
					f242_local0 = f236_arg0.autoScrollSpeed / f242_arg0.timeElapsed * 1000
				end
				local f242_local1 = math.max( math.min( f236_arg0.currentXOffset + f242_local0, f236_arg0.scrollDistance ), 0 )
				local f242_local2 = f236_local2
				if f236_arg0.scrollDistance <= f242_local1 and not f236_local5 and f236_arg0.allowAutoScrolling then
					f236_local4 = f236_local4 + f242_arg0.timeElapsed
					if f236_arg0.autoScrollEndDelay <= f236_local4 then
						f236_local6()
						f242_local1 = 0
						f242_local2 = 0
					end
				end
				f236_local0( f236_arg0, f242_local1, f242_local2 )
			end )
			f236_arg0:addElement( f236_arg0.updateTimer )
		end
	end ) )
end

CoD.incentivesTable = "gamedata/store/common/incentives.csv"
CoD.GetPromoUnlockValue = function ( f243_arg0 )
	return Engine.TableLookup( nil, CoD.incentivesTable, 2, f243_arg0, 8 )
end

CoD.GetThermometerMilestoneTier = function ( f244_arg0 )
	local f244_local0 = 1
	local f244_local1 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier1" ) )
	local f244_local2 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier2" ) )
	local f244_local3 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier3" ) )
	local f244_local4 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier4" ) )
	if f244_local4 and f244_local4 <= f244_arg0 then
		f244_local0 = 5
	elseif f244_local3 and f244_local3 < f244_arg0 then
		f244_local0 = 4
	elseif f244_local2 and f244_local2 < f244_arg0 then
		f244_local0 = 3
	elseif f244_local1 and f244_local1 < f244_arg0 then
		f244_local0 = 2
	end
	return f244_local0
end

CoD.CalculateThermometerProgress = function ( f245_arg0 )
	local f245_local0 = 0
	local f245_local1 = 0
	local f245_local2 = 0
	local f245_local3 = 1
	local f245_local4 = CoD.GetThermometerMilestoneTier( f245_arg0 )
	local f245_local5 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier1" ) )
	local f245_local6 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier2" ) )
	local f245_local7 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier3" ) )
	local f245_local8 = tonumber( CoD.GetPromoUnlockValue( "bgbcc_tier4" ) )
	if not (f245_local4 ~= 1 or not f245_local5) or f245_local4 == 2 and f245_local5 and not f245_local6 then
		f245_local1 = 0
		f245_local0 = f245_local5
	elseif f245_local4 == 2 and f245_local5 and f245_local6 then
		f245_local1 = f245_local5
		f245_local0 = f245_local6
	elseif f245_local4 == 3 and f245_local6 and f245_local7 then
		f245_local1 = f245_local6
		f245_local0 = f245_local7
	elseif (f245_local4 == 4 or f245_local4 == 5) and f245_local7 and f245_local8 then
		f245_local1 = f245_local7
		f245_local0 = f245_local8
	end
	if 0 < f245_local0 - f245_local1 then
		f245_local2 = ((f245_local4 - 1) * f245_local3 + (f245_arg0 - f245_local1) / (f245_local0 - f245_local1) * f245_local3) / 4
	end
	return math.min( f245_local2, 1 )
end

CoD.GetThermometerProgress = function ()
	if Dvar.ui_enablePromoMenu:get() then
		if Dvar.ui_promoThermometerPercent:exists() and Dvar.ui_promoThermometerPercent:get() > 0 then
			return Dvar.ui_promoThermometerPercent:get()
		else
			return math.floor( CoD.CalculateThermometerProgress( tonumber( Engine.GetCounterValue( "zm_bgb_consumed" ) ) ) * 10000 ) / 10000
		end
	else
		return 0
	end
end

CoD.GetThermometerUnlockIndex = function ()
	if Dvar.ui_enablePromoMenu:get() then
		if Dvar.ui_promoItemUnlockIndex:exists() and Dvar.ui_promoItemUnlockIndex:get() > 0 then
			return Dvar.ui_promoItemUnlockIndex:get()
		else
			return CoD.GetThermometerMilestoneTier( tonumber( Engine.GetCounterValue( "zm_bgb_consumed" ) ) ) - 1
		end
	else
		return 0
	end
end

CoD.setupVerticalScrollingTextWidget = function ( f248_arg0, f248_arg1 )
	local f248_local0 = function ( f249_arg0, f249_arg1, f249_arg2 )
		f249_arg0.textBox:beginAnimation( "move", f249_arg2 or 0 )
		f249_arg0.currentYOffset = f249_arg1
		f249_arg0.updatingScroll = true
		f249_arg0.textBox:setTopBottom( true, false, -f249_arg0.currentYOffset, f249_arg0.textLineHeight - f249_arg0.currentYOffset )
		f249_arg0.updatingScroll = false
	end
	
	local f248_local1 = function ( f250_arg0 )
		f248_local0( f250_arg0, 0 )
	end
	
	f248_arg0.autoScrollStartDelay = 5000
	f248_arg0.autoScrollSpeed = 0.4
	f248_arg0.autoScrollEndDelay = 3000
	f248_arg0.rightStickScrollSpeed = 0.7
	f248_arg0.allowAutoScrolling = true
	f248_arg0.allowRightStickScrolling = true
	local f248_local2 = 100
	local f248_local3 = 0
	local f248_local4 = 0
	local f248_local5 = true
	f248_arg0.currentYOffset = 0
	f248_arg0.scrollDistance = 0
	local f248_local6 = function ()
		f248_local4 = 0
		f248_local3 = 0
		f248_local5 = true
	end
	
	f248_local6()
	local f248_local7 = function ()
		local f252_local0, f252_local1 = f248_arg0:getLocalSize()
		f248_arg0.totalAreaHeight = f252_local1
		f248_arg0.totalTextHeight = f248_arg0.textBox:getTextHeightForWidth( f252_local0 )
		local f252_local2, f252_local3 = f248_arg0.textBox:getLocalSize()
		f248_arg0.textLineHeight = f252_local3
		f248_arg0.scrollDistance = f248_arg0.totalTextHeight - f252_local1
		f248_local1( f248_arg0 )
		f248_local6()
	end
	
	LUI.OverrideFunction_CallOriginalFirst( f248_arg0.textBox, "setText", f248_local7 )
	f248_arg0:registerEventHandler( "menu_loaded", function ()
		f248_local7()
		if not f248_arg0.updateTimer then
			local f253_local0 = Engine.GetModel( Engine.GetModelForController( f248_arg1 ), "RightStick" )
			local f253_local1 = nil
			if f253_local0 then
				f253_local1 = Engine.GetModel( f253_local0, "Y" )
			end
			f248_arg0.updateTimer = LUI.UITimer.newElementTimer( f248_local2, false, function ( f254_arg0 )
				local f254_local0 = 0
				if f248_arg0.allowRightStickScrolling and f253_local1 then
					f254_local0 = -Engine.GetModelValue( f253_local1 ) * f248_arg0.rightStickScrollSpeed / f254_arg0.timeElapsed * 1000
				end
				if math.abs( f254_local0 ) > 0.05 then
					f248_local3 = 0
					f248_local5 = true
				elseif f248_local5 then
					f254_local0 = 0
					f248_local3 = f248_local3 + f254_arg0.timeElapsed
					if f248_arg0.autoScrollStartDelay <= f248_local3 then
						f248_local5 = false
					end
				end
				if not f248_local5 and 0 < f248_arg0.autoScrollSpeed and f248_arg0.allowAutoScrolling then
					f254_local0 = f248_arg0.autoScrollSpeed / f254_arg0.timeElapsed * 1000
				end
				local f254_local1 = math.max( math.min( f248_arg0.currentYOffset + f254_local0, f248_arg0.scrollDistance ), 0 )
				local f254_local2 = f248_local2
				if f248_arg0.scrollDistance <= f254_local1 and not f248_local5 and f248_arg0.allowAutoScrolling then
					f248_local4 = f248_local4 + f254_arg0.timeElapsed
					if f248_arg0.autoScrollEndDelay <= f248_local4 then
						f248_local6()
						f254_local1 = 0
						f254_local2 = 0
					end
				end
				f248_local0( f248_arg0, f254_local1, f254_local2 )
			end )
			f248_arg0:addElement( f248_arg0.updateTimer )
		end
	end )
end

CoD.ReplaceElementWithNothing = function ( f255_arg0, f255_arg1 )
	if f255_arg0[f255_arg1] then
		f255_arg0[f255_arg1]:close()
		f255_arg0[f255_arg1] = LUI.UIElement.new()
		f255_arg0:addElement( f255_arg0[f255_arg1] )
	end
end

require( "ui.T6.Border" )
require( "ui.T6.ButtonLayoutOptions" )
require( "ui.T6.ButtonList" )
require( "ui.T6.ButtonPrompt" )
require( "ui.T6.CoDMenu" )
require( "ui.T6.CoDMetrics" )
require( "ui.T6.DvarLeftRightSelector" )
require( "ui.T6.DvarLeftRightSlider" )
require( "ui.T6.HintText" )
require( "ui.T6.Popup" )
require( "ui.T6.SplitscreenScaler" )
require( "ui.T6.StickLayoutOptions" )
if CoD.isPC then
	require( "ui.T6.Menus.KeyboardTextField" )
end
CoD.disableRewards = true
