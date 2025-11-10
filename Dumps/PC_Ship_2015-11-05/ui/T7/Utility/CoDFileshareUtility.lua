CoD.FileshareUtility = {}
CoD.FileshareUtility.PublishedPaintjobsTabs = {
	{
		index = 1,
		fileshareCategory = "paintjob",
		fileshareKey = "",
		fileshareVal = "",
		weapon_category = "",
		disabled = false,
		name = "MENU_ALL_CAPS",
		loadout_slot = ""
	},
	{
		index = 2,
		fileshareCategory = "paintjob",
		fileshareKey = "22",
		fileshareVal = "0",
		weapon_category = "weapon_smg",
		disabled = false,
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 3,
		fileshareCategory = "paintjob",
		fileshareKey = "22",
		fileshareVal = "1",
		weapon_category = "weapon_assault",
		disabled = false,
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 4,
		fileshareCategory = "paintjob",
		fileshareKey = "22",
		fileshareVal = "2",
		weapon_category = "weapon_cqb",
		disabled = false,
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 5,
		fileshareCategory = "paintjob",
		fileshareKey = "22",
		fileshareVal = "3",
		weapon_category = "weapon_lmg",
		disabled = false,
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 6,
		fileshareCategory = "paintjob",
		fileshareKey = "22",
		fileshareVal = "4",
		weapon_category = "weapon_sniper",
		disabled = false,
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 7,
		fileshareCategory = "paintjob",
		fileshareKey = "22",
		fileshareVal = "99",
		weapon_category = "secondary",
		disabled = false,
		name = "MPUI_WEAPON_SECONDARIES_CAPS",
		loadout_slot = "secondary"
	}
}
CoD.FileshareUtility.PublishedVariantsTabs = {
	{
		index = 1,
		fileshareCategory = "variant",
		fileshareKey = "",
		fileshareVal = "",
		weapon_category = "",
		disabled = false,
		name = "MENU_ALL_CAPS",
		loadout_slot = ""
	},
	{
		index = 2,
		fileshareCategory = "variant",
		fileshareKey = "22",
		fileshareVal = "0",
		weapon_category = "weapon_smg",
		disabled = false,
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 3,
		fileshareCategory = "variant",
		fileshareKey = "22",
		fileshareVal = "1",
		weapon_category = "weapon_assault",
		disabled = false,
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 4,
		fileshareCategory = "variant",
		fileshareKey = "22",
		fileshareVal = "2",
		weapon_category = "weapon_cqb",
		disabled = false,
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 5,
		fileshareCategory = "variant",
		fileshareKey = "22",
		fileshareVal = "3",
		weapon_category = "weapon_lmg",
		disabled = false,
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 6,
		fileshareCategory = "variant",
		fileshareKey = "22",
		fileshareVal = "4",
		weapon_category = "weapon_sniper",
		disabled = false,
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 7,
		fileshareCategory = "variant",
		fileshareKey = "22",
		fileshareVal = "99",
		weapon_category = "secondary",
		disabled = false,
		name = "MPUI_WEAPON_SECONDARIES_CAPS",
		loadout_slot = "secondary"
	}
}
CoD.FileshareUtility.ShowcaseManagerTabs = {
	{
		index = 1,
		fileshareCategory = "paintjob",
		fileshareKey = "",
		fileshareVal = "",
		disabled = false,
		selectIndex = true
	},
	{
		index = 2,
		fileshareCategory = "variant",
		fileshareKey = "",
		fileshareVal = "",
		disabled = false,
		selectIndex = false
	},
	{
		index = 3,
		fileshareCategory = "emblem",
		fileshareKey = "",
		fileshareVal = "",
		disabled = false,
		selectIndex = false
	}
}
CoD.FileshareUtility.CommunityTitles = {
	{
		dataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR,
		title = "MENU_MEDIA_POPULAR",
		kicker = "MENU_MEDIA_POPULAR"
	},
	{
		dataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT,
		title = "MENU_MEDIA_RECENT",
		kicker = "MENU_MEDIA_RECENT"
	},
	{
		dataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING,
		title = "MENU_MEDIA_TRENDING",
		kicker = "MENU_MEDIA_TRENDING"
	}
}
CoD.FileshareUtility.ToastTypes = {
	LIKE = {
		kicker = "MENU_FILESHARE_ACTION_LIKED",
		description = "%s",
		functionIcon = "uie_t7_icon_menu_options_like"
	},
	DISLIKE = {
		kicker = "MENU_FILESHARE_ACTION_DISLIKED",
		description = "%s",
		functionIcon = "uie_t7_icon_menu_options_dislike"
	},
	PUBLISH = {
		kicker = "MENU_FILESHARE_ACTION_PUBLISHED",
		description = "%s",
		functionIcon = "t7_icon_menu_simple_publish"
	},
	DELETE = {
		kicker = "MENU_FILESHARE_ACTION_DELETED",
		description = "%s",
		functionIcon = "t7_icon_menu_simple_delete"
	},
	DELETED_PUBLISH = {
		kicker = "MENU_FILESHARE_ACTION_DELETED_PUBLISHED",
		description = "%s",
		functionIcon = "t7_icon_menu_simple_delete"
	},
	DOWNLOAD = {
		kicker = "MENU_FILESHARE_ACTION_DOWNLOADED",
		description = "%s",
		functionIcon = "t7_icon_menu_options_download"
	},
	REPORT = {
		kicker = "MENU_FILESHARE_ACTION_REPORTED",
		description = "%s",
		functionIcon = "uie_t7_icon_error_overlays"
	},
	READONLY = {
		kicker = "MENU_FILESHARE_ACTION_DOWNLOADED_CONTENT",
		description = "MENU_FILESHARE_ACTION_CANNOT_EDIT",
		functionIcon = "uie_t7_icon_error_overlays"
	},
	ERROR = {
		kicker = "MENU_FILESHARE_ACTION_ERROR",
		description = "MENU_FILESHARE_ACTION_ERROR_DESC",
		functionIcon = "uie_t7_icon_error_overlays"
	}
}
CoD.FileshareUtility.FileProperties = {
	"fileId",
	"renderFileId",
	"fileSize",
	"fileCategory",
	"fileCategoryId",
	"fileSummarySize",
	"fileSlot",
	"fileCopiesMade",
	"isValid",
	"gameType",
	"gameTypeString",
	"gameTypeName",
	"gameTypeImage",
	"map",
	"mapString",
	"mapName",
	"playlistId",
	"mainMode",
	"matchmakingMode",
	"isLiveStream",
	"fileOriginId",
	"fileCreateTime",
	"fileAuthorXuid",
	"fileAuthorName",
	"fileName",
	"isNameModified",
	"fileDescription",
	"isDescriptionModified",
	"isPooled",
	"duration",
	"isBookmarked",
	"fileLikesCount",
	"fileDislikesCount",
	"fileViewsCount",
	"fileDownloadsCount",
	"isPublishNew",
	"fileImage",
	"showFileImage",
	"showPlusImage",
	"uiModelIndex",
	"weaponName"
}
CoD.FileshareUtility.Images = {
	paintjob = "uie_t7_mp_icon_header_paintshop",
	variant = "uie_t7_mp_icon_header_gunsmith",
	emblem = "uie_t7_mp_icon_header_emblem",
	film = "uie_t7_mp_icon_header_theater",
	screenshot = "uie_t7_mp_icon_header_screenshot",
	customgame = "uie_t7_mp_icon_header_customgames"
}
CoD.FileshareUtility.LargeImages = {
	paintjob = "uie_t7_mp_icon_header_paintshop_large",
	variant = "uie_t7_mp_icon_header_gunsmith_large",
	emblem = "uie_t7_mp_icon_header_emblem_large",
	film = "uie_t7_mp_icon_header_theater_large",
	screenshot = "uie_t7_mp_icon_header_screenshot_large",
	customgame = "uie_t7_mp_icon_header_customgames_large"
}
CoD.FileshareUtility.Colors = {
	paintjob = ColorSet.SelectedGreen,
	variant = ColorSet.CoreMartial,
	emblem = ColorSet.PlayerYellow,
	film = ColorSet.RewardWeaponLevel,
	screenshot = ColorSet.CoreChaos,
	customgame = ColorSet.Orange
}
CoD.FileshareUtility.GetRootModel = function ()
	return Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" )
end

CoD.FileshareUtility.GetSelectedItemRootModel = function ()
	return Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSelectedItem" )
end

CoD.FileshareUtility.GetDeletingModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isDeleting" )
end

CoD.FileshareUtility.GetPublishingModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isPublishing" )
end

CoD.FileshareUtility.GetDownloadingModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isDownloading" )
end

CoD.FileshareUtility.GetReadyModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "ready" )
end

CoD.FileshareUtility.GetShowFileDetailsModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showFileDetails" )
end

CoD.FileshareUtility.GetShowPublishNewDetailsModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showPublishNewDetails" )
end

CoD.FileshareUtility.GetIsCommunityModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isCommunity" )
end

CoD.FileshareUtility.GetInShowcaseManagerModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "inShowcaseManager" )
end

CoD.FileshareUtility.GetInShowcaseBrowserModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "inShowcaseBrowser" )
end

CoD.FileshareUtility.GetShouldShowTabsModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "shouldShowTabs" )
end

CoD.FileshareUtility.GetItemsCountModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "itemsCount" )
end

CoD.FileshareUtility.IsFileshareReady = function ( f14_arg0 )
	return Engine.GetModelValue( CoD.FileshareUtility.GetReadyModel() )
end

CoD.FileshareUtility.SetFileshareReady = function ( f15_arg0 )
	Engine.SetModelValue( CoD.FileshareUtility.GetReadyModel(), f15_arg0 )
end

CoD.FileshareUtility.SetDirty = function ()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" ), "dirty" ) )
end

CoD.FileshareUtility.GetItemsCount = function ()
	return Engine.GetModelValue( CoD.FileshareUtility.GetItemsCountModel() )
end

CoD.FileshareUtility.SetItemsCount = function ( f18_arg0, f18_arg1 )
	Engine.SetModelValue( CoD.FileshareUtility.GetItemsCountModel(), f18_arg1 )
	ForceNotifyGlobalModel( f18_arg0, "fileshareRoot.itemsCount" )
end

CoD.FileshareUtility.GetIsCommunityMode = function ( f19_arg0 )
	local modelValue = Engine.GetModelValue( CoD.FileshareUtility.GetIsCommunityModel() )
	if modelValue ~= nil then
		CoD.FileshareUtility.SetShouldShowTabs( modelValue == false )
		return modelValue
	else
		CoD.FileshareUtility.SetShouldShowTabs( false )
		return false
	end
end

CoD.FileshareUtility.SetIsCommunityMode = function ( f20_arg0, f20_arg1 )
	Engine.SetModelValue( CoD.FileshareUtility.GetIsCommunityModel(), f20_arg1 )
end

CoD.FileshareUtility.SetShouldShowTabs = function ( f21_arg0 )
	local f21_local0 = CoD.FileshareUtility.GetShouldShowTabsModel()
	if f21_arg0 == true then
		Engine.SetModelValue( f21_local0, 1 )
	else
		Engine.SetModelValue( f21_local0, 0 )
	end
end

CoD.FileshareUtility.GetIsUserMode = function ( f22_arg0 )
	return Engine.GetModelValue( CoD.FileshareUtility.GetIsCommunityModel() ) == false
end

CoD.FileshareUtility.SetIsUserMode = function ( f23_arg0, f23_arg1 )
	Engine.SetModelValue( CoD.FileshareUtility.GetIsCommunityModel(), f23_arg1 == false )
end

CoD.FileshareUtility.GetInShowcaseManager = function ( f24_arg0 )
	return Engine.GetModelValue( CoD.FileshareUtility.GetInShowcaseManagerModel() ) == false
end

CoD.FileshareUtility.SetInShowcaseManager = function ( f25_arg0, f25_arg1 )
	Engine.SetModelValue( CoD.FileshareUtility.GetInShowcaseManagerModel(), f25_arg1 == false )
end

CoD.FileshareUtility.GetInShowcaseBrowser = function ( f26_arg0 )
	return Engine.GetModelValue( CoD.FileshareUtility.GetInShowcaseBrowserModel() ) == false
end

CoD.FileshareUtility.SetInShowcaseBrowser = function ( f27_arg0, f27_arg1 )
	Engine.SetModelValue( CoD.FileshareUtility.GetInShowcaseBrowserModel(), f27_arg1 == false )
end

CoD.FileshareUtility.SetCurrentCommunityDataType = function ( f28_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCommunityDataType" ), f28_arg0 )
end

CoD.FileshareUtility.GetCurrentCommunityDataType = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCommunityDataType" ) )
end

CoD.FileshareUtility.SetCurrentCategory = function ( f30_arg0 )
	local f30_local0 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategory" )
	local f30_local1 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryName" )
	local f30_local2 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameCaps" )
	local f30_local3 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingle" )
	local f30_local4 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingleCaps" )
	if f30_arg0 == nil or f30_arg0 == "" then
		Engine.SetModelValue( f30_local0, "" )
		Engine.SetModelValue( f30_local1, "" )
		Engine.SetModelValue( f30_local2, "" )
		Engine.SetModelValue( f30_local3, "" )
		Engine.SetModelValue( f30_local4, "" )
	else
		local f30_local5 = Engine.TableLookup( 0, CoD.fileShareTable, 1, f30_arg0, 8 )
		Engine.SetModelValue( f30_local0, f30_arg0 )
		Engine.SetModelValue( f30_local1, f30_local5 )
		Engine.SetModelValue( f30_local2, f30_local5 .. "_CAPS" )
		Engine.SetModelValue( f30_local3, f30_local5 .. "_SINGLE" )
		Engine.SetModelValue( f30_local4, f30_local5 .. "_SINGLE_CAPS" )
	end
end

CoD.FileshareUtility.GetCurrentCategory = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategory" ) )
end

CoD.FileshareUtility.SetPreviousCategory = function ( f32_arg0 )
	local f32_local0 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "previousCategory" )
	if f32_arg0 == nil or f32_arg0 == "" then
		Engine.SetModelValue( f32_local0, "" )
	else
		Engine.SetModelValue( f32_local0, f32_arg0 )
	end
end

CoD.FileshareUtility.GetPreviousCategory = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "previousCategory" ) )
end

CoD.FileshareUtility.SetCurrentFilter = function ( f34_arg0, f34_arg1 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterKey" ), f34_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterVal" ), f34_arg1 )
end

CoD.FileshareUtility.GetCurrentFilter = function ()
	local f35_local0 = Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterKey" ) )
	local f35_local1 = Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterVal" ) )
	if f35_local0 == nil or f35_local1 == nil then
		return "", ""
	else
		return f35_local0, f35_local1
	end
end

CoD.FileshareUtility.SetCurrentUser = function ( f36_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentXuid" ), f36_arg0 )
end

CoD.FileshareUtility.GetCurrentUser = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentXuid" ) )
end

CoD.FileshareUtility.SetShowCreateButton = function ( f38_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showCreateButton" ), f38_arg0 )
end

CoD.FileshareUtility.GetShowCreateButton = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showCreateButton" ) )
end

CoD.FileshareUtility.SelectedItemModel = nil
CoD.FileshareUtility.SetShowFileDetails = function ( f40_arg0 )
	local f40_local0 = CoD.FileshareUtility.GetShowFileDetailsModel()
	if f40_arg0 == true then
		Engine.SetModelValue( f40_local0, 1 )
	else
		Engine.SetModelValue( f40_local0, 0 )
	end
end

CoD.FileshareUtility.SetShowPublishNewDetails = function ( f41_arg0 )
	local f41_local0 = CoD.FileshareUtility.GetShowPublishNewDetailsModel()
	if f41_arg0 == true then
		Engine.SetModelValue( f41_local0, 1 )
	else
		Engine.SetModelValue( f41_local0, 0 )
	end
end

CoD.FileshareUtility.GetSelectedItem = function ()
	return CoD.FileshareUtility.SelectedItemModel
end

CoD.FileshareUtility.SetSelectedItem = function ( f43_arg0 )
	CoD.FileshareUtility.SelectedItemModel = f43_arg0
	if CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" ) == false then
		CoD.FileshareUtility.SetShowFileDetails( true )
		CoD.FileshareUtility.SetShowPublishNewDetails( false )
	else
		CoD.FileshareUtility.SetShowFileDetails( false )
		CoD.FileshareUtility.SetShowPublishNewDetails( true )
	end
	CoD.FileshareUtility.ResetFileshareSummary( f43_arg0 )
	local f43_local0 = 0
	if CoD.FileshareUtility.GetCurrentCategory() == "emblem" then
		f43_local0 = 1
	end
	Engine.SetModelValue( Engine.CreateModel( f43_arg0, "shouldShowEmblem", false ), f43_local0 )
end

CoD.FileshareUtility.GetSelectedItemProperty = function ( f44_arg0 )
	if f44_arg0 ~= nil and nil ~= CoD.FileshareUtility.SelectedItemModel then
		local f44_local0 = Engine.GetModel( CoD.FileshareUtility.SelectedItemModel, f44_arg0 )
		if f44_local0 ~= nil then
			return Engine.GetModelValue( f44_local0 )
		end
	end
	return nil
end

CoD.FileshareUtility.SetupDefaultNameAndDescription = function ( f45_arg0 )
	local f45_local0 = Engine.GetModel( f45_arg0, "fileCategory" )
	if not f45_local0 then
		return 
	elseif Engine.GetModelValue( f45_local0 ) ~= "film" then
		return 
	end
	local f45_local1 = Engine.GetModelValue( Engine.GetModel( f45_arg0, "mapName" ) )
	local f45_local2 = Engine.GetModelValue( Engine.GetModel( f45_arg0, "gametypeName" ) )
	local f45_local3 = Engine.GetModelValue( Engine.GetModel( f45_arg0, "mainMode" ) )
	local f45_local4 = Engine.GetModel( f45_arg0, "fileName" )
	if Engine.GetModelValue( f45_local4 ) == "" then
		local f45_local5
		if f45_local3 == Enum.eModes.MODE_ZOMBIES then
			f45_local5 = Engine.Localize( CoD.GetMapValue( f45_local1, "mapName", f45_local1 ) )
		else
			f45_local5 = Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f45_local2, "name_ref" ) )
		end
		Engine.SetModelValue( f45_local4, f45_local5 )
	end
	local f45_local6 = Engine.GetModel( f45_arg0, "fileDescription" )
	if Engine.GetModelValue( f45_local6 ) == "" then
		Engine.SetModelValue( f45_local6, CoD.GetGameModeOnMapNameString( f45_local2, f45_local1 ) )
	end
end

CoD.FileshareUtility.SummaryProperties = {
	"isValid",
	"fileId",
	"playerScore",
	"oppositionScore",
	"gameResultText",
	"gameResultColor",
	"column1Header",
	"column1Value",
	"column2Header",
	"column2Value",
	"column3Header",
	"column3Value",
	"column4Header",
	"column4Value"
}
CoD.FileshareUtility.InitFileshareSummaryModels = function ( f46_arg0 )
	local f46_local0 = Engine.CreateModel( f46_arg0, "summary" )
	for f46_local4, f46_local5 in ipairs( CoD.FileshareUtility.SummaryProperties ) do
		Engine.CreateModel( f46_local0, f46_local5 )
	end
end

CoD.FileshareUtility.GetFileshareSummaryItemModel = function ( f47_arg0, f47_arg1 )
	local f47_local0 = Engine.GetModel( f47_arg0, "summary" )
	if f47_local0 then
		return Engine.GetModel( f47_local0, f47_arg1 )
	else
		return nil
	end
end

CoD.FileshareUtility.SetFileshareSummaryItem = function ( f48_arg0, f48_arg1, f48_arg2 )
	local f48_local0 = CoD.FileshareUtility.GetFileshareSummaryItemModel( f48_arg0, f48_arg1 )
	if f48_local0 then
		Engine.SetModelValue( f48_local0, f48_arg2 )
	end
end

CoD.FileshareUtility.ResetFileshareSummary = function ( f49_arg0 )
	if not Engine.GetModel( f49_arg0, "summary" ) then
		CoD.FileshareUtility.InitFileshareSummaryModels( f49_arg0 )
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( f49_arg0, "isValid", false )
	CoD.FileshareUtility.SetFileshareSummaryItem( f49_arg0, "fileId", Engine.DefaultID64Value() )
end

local f0_local0 = function ( f50_arg0, f50_arg1, f50_arg2 )
	local f50_local0 = f50_arg1.header
	local f50_local1 = f50_arg1.playerBuffer
	local f50_local2 = f50_arg2.xuid
	local f50_local3 = f50_arg2.controller
	local f50_local4, f50_local5, f50_local6, f50_local7, f50_local8, f50_local9, f50_local10, f50_local11, f50_local12 = nil
	local f50_local13 = 0
	local f50_local14 = 0
	local f50_local15, f50_local16 = nil
	if not f50_local0 then
		return false
	end
	f50_local5 = f50_local0.isDraw:get()
	f50_local6 = f50_local0.winningTeam:get()
	f50_local4 = f50_local0.teamCount:get()
	f50_local7 = f50_local0.gameType:get()
	f50_local11 = 0
	f50_local12 = 0
	for f50_local17 = 1, #f50_local1, 1 do
		local f50_local20 = f50_local1[f50_local17 - 1]
		if f50_local20.xuid:get() == f50_local2 then
			f50_local10 = f50_local17 - 1
			f50_local8 = f50_local20.team:get()
			f50_local9 = f50_local20.position:get()
			f50_local13 = f50_local20.score:get()
			f50_local11 = f50_local20.kills:get()
			f50_local12 = f50_local20.deaths:get()
		end
		local f50_local21 = f50_local20.score:get()
		if f50_local14 < f50_local21 then
			f50_local14 = f50_local21
		end
	end
	if f50_local4 > 1 then
		f50_local13 = 0
		f50_local14 = 0
		if f50_local8 == Enum.team_t.TEAM_ALLIES then
			f50_local13 = f50_local0.alliesScore:get()
			f50_local14 = f50_local0.axisScore:get()
		elseif f50_local8 == Enum.team_t.TEAM_AXIS then
			f50_local13 = f50_local0.axisScore:get()
			f50_local14 = f50_local0.alliesScore:get()
		end
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "playerScore", f50_local13 )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "oppositionScore", f50_local14 )
	if f50_local4 == 1 then
		if f50_local9 == nil then
			f50_local15 = ""
			f50_local16 = CoD.gray
		elseif f50_local5 == 1 then
			f50_local15 = Engine.Localize( "MENU_FILESHARE_DRAW" )
			f50_local16 = CoD.gray
		elseif f50_local9 < 3 then
			f50_local15 = Engine.Localize( "MENU_FILESHARE_VICTORY" )
			f50_local16 = CoD.brightGreen
		else
			f50_local15 = Engine.Localize( "MENU_FILESHARE_DEFEAT" )
			f50_local16 = CoD.brightRed
		end
	elseif f50_local5 == 1 then
		f50_local15 = Engine.Localize( "MENU_FILESHARE_DRAW" )
		f50_local16 = CoD.gray
	elseif f50_local8 == f50_local6 then
		f50_local15 = Engine.Localize( "MENU_FILESHARE_VICTORY" )
		f50_local16 = CoD.brightGreen
	else
		f50_local15 = Engine.Localize( "MENU_FILESHARE_DEFEAT" )
		f50_local16 = CoD.brightRed
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "gameResultText", f50_local15 )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "gameResultColor", CoD.ConvertColor( f50_local16.r, f50_local16.g, f50_local16.b ) )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column1Header", Engine.Localize( "MENU_KILLS_CAPS" ) )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column1Value", f50_local11 )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column2Header", Engine.Localize( "MENU_DEATHS_CAPS" ) )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column2Value", f50_local12 )
	if not f50_local10 then
		return false
	end
	local f50_local17 = f50_local1[f50_local10]
	local f50_local18 = {
		captures = 0,
		returns = 0,
		destroys = 0,
		plants = 0,
		defuses = 0,
		throws = 0,
		defending = 0,
		objectiveTime = f50_local17.objectiveTime:get(),
		escortTime = f50_local17.escortTime:get()
	}
	if f50_local10 ~= nil then
		local f50_local19 = f50_arg1.gameEvents
		for f50_local22 = 1, #f50_local19, 1 do
			local f50_local23 = f50_local19[f50_local22 - 1]
			if f50_local10 == f50_local23.player:get() then
				local f50_local24 = f50_local23.eventType
				f50_local18.captures = f50_local18.captures + f50_local24.capture:get()
				f50_local18.returns = f50_local18.returns + f50_local24["return"]:get()
				f50_local18.destroys = f50_local18.destroys + f50_local24.destroy:get()
				f50_local18.plants = f50_local18.plants + f50_local24.plant:get()
				f50_local18.defuses = f50_local18.defuses + f50_local24.defuse:get()
				f50_local18.throws = f50_local18.throws + f50_local24.throw:get()
				f50_local18.defending = f50_local18.defending + f50_local24.defending:get()
			end
		end
	end
	local f50_local19, f50_local22, f50_local20, f50_local21 = nil
	if f50_local7 == "tdm" or f50_local7 == "dm" then
		f50_local19 = Engine.Localize( "MPUI_RATIO_CAPS" )
		f50_local22 = CoD.GetKDRatio( f50_local17.kills:get(), f50_local17.deaths:get() )
		f50_local20 = Engine.Localize( "MPUI_ASSISTS_CAPS" )
		f50_local21 = f50_local17.assists:get()
	elseif f50_local7 == "dom" or f50_local7 == "hq" then
		f50_local19 = Engine.Localize( "MPUI_CAPTURES_CAPS" )
		f50_local22 = f50_local18.captures
		f50_local20 = Engine.Localize( "MPUI_DEFENDS_CAPS" )
		f50_local21 = f50_local18.returns
	elseif f50_local7 == "koth" then
		f50_local19 = Engine.ToUpper( Engine.Localize( "MPUI_OBJTIME" ) )
		f50_local22 = CoD.GetTimeText( f50_local18.objectiveTime * 1000 )
		f50_local20 = Engine.Localize( "MPUI_DEFENDS_CAPS" )
		f50_local21 = f50_local18.defending
	elseif f50_local7 == "ctf" then
		f50_local19 = Engine.Localize( "MPUI_CAPTURES_CAPS" )
		f50_local22 = f50_local18.captures
		f50_local20 = Engine.Localize( "MPUI_RETURNS_CAPS" )
		f50_local21 = f50_local18.returns
	elseif f50_local7 == "dem" or f50_local7 == "sab" or f50_local7 == "sd" then
		f50_local19 = Engine.Localize( "MPUI_PLANTS_CAPS" )
		f50_local22 = f50_local18.plants
		f50_local20 = Engine.Localize( "MPUI_DEFUSES_CAPS" )
		f50_local21 = f50_local18.defuses
	elseif f50_local7 == "conf" then
		f50_local19 = Engine.Localize( "MPUI_KILLS_CONFIRMED_CAPS" )
		f50_local22 = f50_local18.captures
		f50_local20 = Engine.Localize( "MPUI_KILLS_DENIED_CAPS" )
		f50_local21 = f50_local18.returns
	elseif f50_local7 == "ball" then
		f50_local19 = Engine.ToUpper( Engine.Localize( "MPUI_CARRIES" ) )
		f50_local22 = f50_local18.captures
		f50_local20 = Engine.ToUpper( Engine.Localize( "MPUI_THROWS" ) )
		f50_local21 = f50_local18.throws
	elseif f50_local7 == "gun" then
		f50_local19 = Engine.ToUpper( Engine.Localize( "MPUI_STABS" ) )
		f50_local22 = f50_local18.captures
		f50_local20 = Engine.ToUpper( Engine.Localize( "MPUI_HUMILIATED" ) )
		f50_local21 = f50_local18.returns
	elseif f50_local7 == "escort" then
		f50_local19 = Engine.ToUpper( Engine.Localize( "MPUI_ESCORTS" ) )
		f50_local22 = CoD.GetTimeText( f50_local18.escortTime * 1000 )
		f50_local20 = Engine.ToUpper( Engine.Localize( "MPUI_DISABLES" ) )
		f50_local21 = f50_local18.returns
	else
		return false
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column3Header", f50_local19 )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column3Value", f50_local22 )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column4Header", f50_local20 )
	CoD.FileshareUtility.SetFileshareSummaryItem( f50_arg0, "column4Value", f50_local21 )
	return true
end

CoD.FileshareUtility.SetupFileShareSummary = function ( f51_arg0, f51_arg1 )
	if not f51_arg1.isValid then
		return 
	elseif f51_arg1.fileId ~= CoD.FileshareUtility.GetSelectedItemProperty( "fileId" ) then
		return 
	else
		local f51_local0 = f51_arg1.xuid
		if f51_local0 == nil or f51_local0 == "" then
			return 
		else
			local f51_local1 = Engine.GetMatchRecordStats( f51_arg1.controller )
			if f51_local1 == nil then
				return 
			else
				local f51_local2 = nil
				if CoD.isMultiplayer then
					if not f0_local0( f51_arg0, f51_local1, f51_arg1 ) then
						return 
					else
						CoD.FileshareUtility.SetFileshareSummaryItem( f51_arg0, "isValid", f51_arg1.isValid )
						CoD.FileshareUtility.SetFileshareSummaryItem( f51_arg0, "fileId", f51_arg1.fileId )
					end
				else
					return 
				end
			end
		end
	end
end

CoD.FileshareUtility.UpdateCurrentQuota = function ( f52_arg0 )
	local f52_local0 = Engine.FileshareGetQuota( f52_arg0, CoD.FileshareUtility.GetCurrentCategory() )
	local f52_local1 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryQuota" )
	if f52_local0 ~= nil then
		Engine.SetModelValue( f52_local1, f52_local0.categorySlotsAvailable )
	end
end

CoD.FileshareUtility.GetCurrentQuota = function ( f53_arg0 )
	return Engine.FileshareGetQuota( f53_arg0, CoD.FileshareUtility.GetCurrentCategory() )
end

CoD.FileshareUtility.PublishCallback = nil
CoD.FileshareUtility.SetPublishName = function ( f54_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishName" ), f54_arg0 )
end

CoD.FileshareUtility.GetPublishName = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishName" ) )
end

CoD.FileshareUtility.SetPublishDescription = function ( f56_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishDescription" ), f56_arg0 )
end

CoD.FileshareUtility.GetPublishDescription = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishDescription" ) )
end

CoD.FileshareUtility.SetPublishTags = function ( f58_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishTags" ), f58_arg0 )
end

CoD.FileshareUtility.GetPublishTags = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishTags" ) )
end

CoD.FileshareUtility.ResetPublishingModel = function ()
	Engine.SetModelValue( CoD.FileshareUtility.GetPublishingModel(), -1 )
end

CoD.FileshareUtility.SetPublishAllowDownload = function ( f61_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishAllowDownload" ), f61_arg0 )
end

CoD.FileshareUtility.GetPublishAllowDownload = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishAllowDownload" ) )
end

CoD.FileshareUtility.OpenPublishPrompt = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4 )
	CoD.FileshareUtility.SetCurrentCategory( f63_arg2 )
	CoD.FileshareUtility.PublishCallback = f63_arg4
	CoD.FileshareUtility.SetPublishName( f63_arg3 )
	CoD.FileshareUtility.SetPublishAllowDownload( true )
	CoD.FileshareUtility.ResetPublishingModel()
	CoD.FileshareUtility.SetNotificationItemModel( f63_arg3 )
	local f63_local0 = Engine.GetXUID64( f63_arg1 )
	local f63_local1 = CoD.FileshareUtility.IsFileshareReady( f63_arg1 )
	if f63_local1 == 0 or f63_local1 == false or CoD.FileshareUtility.GetCurrentUser() ~= f63_local0 then
		CoD.FileshareUtility.FetchContentForUser( f63_arg1, f63_local0 )
		CoD.FileshareUtility.SetFileshareReady( false )
	end
	OpenPopup( f63_arg0, "FilesharePublish", f63_arg1 )
end

CoD.FileshareUtility.Publish = function ( f64_arg0 )
	if CoD.FileshareUtility.PublishCallback == nil then
		return 
	else
		CoD.FileshareUtility.PublishCallback( f64_arg0 )
	end
end

CoD.FileshareUtility.Delete = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4, f65_arg5 )
	if FileshareIsCurrentUserContext( f65_arg2 ) == false then
		return 
	end
	Engine.SetModelValue( CoD.FileshareUtility.GetDeletingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	if f65_arg5 ~= nil then
		f65_arg4.m_leaveParentOpenAfterDelete = f65_arg5
	end
	f65_arg4:openPopup( "FileshareOptionsDelete", f65_arg2 )
end

CoD.FileshareUtility.DeleteYes = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
	if FileshareIsCurrentUserContext( f66_arg2 ) == false then
		return 
	else
		CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
		Engine.FileShareDelete( f66_arg2, CoD.FileshareUtility.GetSelectedItemProperty( "fileId" ) )
	end
end

CoD.FileshareUtility.DeleteNo = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
	GoBack( f67_arg4, f67_arg2 )
end

CoD.FileshareUtility.DeleteDone = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
	local f68_local0 = GoBack( f68_arg4, f68_arg2 )
	if f68_local0.m_leaveParentOpenAfterDelete ~= nil and f68_local0.m_leaveParentOpenAfterDelete == true then
		return 
	else
		GoBack( f68_local0, f68_arg2 )
	end
end

CoD.FileshareUtility.DownloadCallback = nil
CoD.FileshareUtility.SetDownloadFileId = function ( f69_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileId" ), f69_arg0 )
end

CoD.FileshareUtility.GetDownloadFileId = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileId" ) )
end

CoD.FileshareUtility.SetDownloadFileName = function ( f71_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileName" ), f71_arg0 )
end

CoD.FileshareUtility.GetDownloadFileName = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileName" ) )
end

CoD.FileshareUtility.ResetDownloadingModel = function ()
	Engine.SetModelValue( CoD.FileshareUtility.GetDownloadingModel(), -1 )
end

CoD.FileshareUtility.OpenDownloadPrompt = function ( f74_arg0, f74_arg1, f74_arg2 )
	local f74_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f74_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileName" )
	local f74_local2 = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	if CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" ) then
		return 0
	end
	CoD.FileshareUtility.SetCurrentCategory( f74_local2 )
	CoD.FileshareUtility.DownloadCallback = f74_arg2
	CoD.FileshareUtility.SetDownloadFileId( f74_local0 )
	CoD.FileshareUtility.SetDownloadFileName( f74_local1 )
	CoD.FileshareUtility.ResetDownloadingModel()
	CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
	local f74_local3 = Engine.MediaManagerGetQuota( f74_arg1, f74_local2 )
	local f74_local4 = f74_local3.categorySlotsAvailable
	local f74_local5 = GoBack( f74_arg0, f74_arg1 )
	if f74_local4 > 0 then
		OpenOverlay( f74_local5, "FileshareDownload", f74_arg1 )
	else
		OpenOverlay( f74_local5, "MediaManagerSlotsFull", f74_arg1 )
	end
end

CoD.FileshareUtility.GetLocalStorageType = function ( f75_arg0 )
	if f75_arg0 == "paintjob" then
		return Enum.StorageFileType.STORAGE_PAINTJOBS
	elseif f75_arg0 == "variant" then
		return Enum.StorageFileType.STORAGE_GUNSMITH
	elseif f75_arg0 == "emblem" then
		return Enum.StorageFileType.STORAGE_EMBLEMS
	else
		
	end
end

CoD.FileshareUtility.DownloadAction = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3, f76_arg4 )
	Engine.SetModelValue( CoD.FileshareUtility.GetDownloadingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	CoD.FileshareUtility.OpenDownloadPrompt( f76_arg4, f76_arg2, CoD.FileshareUtility.DownloadActionCallback )
end

CoD.FileshareUtility.Download = function ( f77_arg0 )
	if CoD.FileshareUtility.DownloadCallback == nil then
		return 
	else
		CoD.FileshareUtility.DownloadCallback( f77_arg0 )
	end
end

CoD.FileshareUtility.DownloadActionCallback = function ( f78_arg0 )
	Engine.FileshareDownload( f78_arg0, CoD.FileshareUtility.GetCurrentCategory(), CoD.FileshareUtility.GetDownloadFileId(), CoD.FileshareUtility.GetDownloadFileName(), CoD.FileshareUtility.GetIsCommunityMode( f78_arg0 ) )
end

CoD.FileshareUtility.CanDownload = function ( f79_arg0 )
	if Dvar.fileshare_enabled ~= nil and Dvar.fileshare_enabled:get() == false then
		return false
	end
	local f79_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	local f79_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	local f79_local2 = Engine.GetXUID64( f79_arg0 )
	if Dvar.fileshareAllowDownload ~= nil and Dvar.fileshareAllowDownload:get() == false then
		return false
	elseif f79_local2 ~= f79_local1 and Dvar.fileshareAllowDownloadingOthersFiles ~= nil and Dvar.fileshareAllowDownloadingOthersFiles:get() == false then
		return false
	elseif f79_local0 == "paintjob" then
		if Dvar.fileshareAllowPaintjobDownload ~= nil and Dvar.fileshareAllowPaintjobDownload:get() == false then
			return false
		end
	elseif f79_local0 == "variant" then
		if Dvar.fileshareAllowVariantDownload ~= nil and Dvar.fileshareAllowVariantDownload:get() == false then
			return false
		end
	elseif f79_local0 == "emblem" and Dvar.fileshareAllowEmblemDownload ~= nil and Dvar.fileshareAllowEmblemDownload:get() == false then
		return false
	end
	return true
end

CoD.FileshareUtility.FetchContentForUser = function ( f80_arg0, f80_arg1 )
	Engine.FileshareFetchForUser( f80_arg0, f80_arg1 )
	CoD.FileshareUtility.SetCurrentUser( f80_arg1 )
end

CoD.FileshareUtility.ReportLike = function ( f81_arg0, f81_arg1, f81_arg2 )
	local f81_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f81_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	local f81_local2 = CoD.FileshareUtility.GetSelectedItemProperty( "uiModelIndex" )
	CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
	Engine.FileshareReportVote( f81_arg2, f81_local1, f81_local0, f81_local2, true )
end

CoD.FileshareUtility.ReportDislike = function ( f82_arg0, f82_arg1, f82_arg2 )
	local f82_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f82_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	local f82_local2 = CoD.FileshareUtility.GetSelectedItemProperty( "uiModelIndex" )
	CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
	Engine.FileshareReportVote( f82_arg2, f82_local1, f82_local0, f82_local2, false )
end

CoD.FileshareUtility.AllowDownload = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3, f83_arg4 )
	
end

CoD.FileshareUtility.OpenShowcaseManager = function ( f84_arg0, f84_arg1, f84_arg2, f84_arg3, f84_arg4 )
	if FileshareIsCurrentUserContext( f84_arg2 ) == false then
		return 
	else
		CoD.FileshareUtility.SetShowCreateButton( FileshareCanBuyMoreSlots( f84_arg2 ) )
		GoBackAndOpenOverlayOnParent( f84_arg4, "Fileshare_ShowcaseManager", f84_arg2 )
	end
end

CoD.FileshareUtility.OpenBuySlots = function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3, f85_arg4 )
	OpenStore( f85_arg0, f85_arg1, f85_arg2, "Fileshare", f85_arg4 )
end

CoD.FileshareUtility.GetCategoryImage = function ( f86_arg0 )
	local f86_local0 = CoD.FileshareUtility.Images[f86_arg0]
	if f86_local0 == nil then
		return ""
	else
		return f86_local0
	end
end

CoD.FileshareUtility.GetCategoryLargeImage = function ( f87_arg0 )
	local f87_local0 = CoD.FileshareUtility.LargeImages[f87_arg0]
	if f87_local0 == nil then
		return ""
	else
		return f87_local0
	end
end

CoD.FileshareUtility.GetCategoryColor = function ( f88_arg0 )
	local f88_local0 = CoD.FileshareUtility.Colors[f88_arg0]
	return string.format( "%d %d %d", f88_local0.r * 255, f88_local0.g * 255, f88_local0.b * 255 )
end

CoD.FileshareUtility.GetCurrentCommunityMenuTitle = function ()
	local f89_local0 = CoD.FileshareUtility.GetCurrentCommunityDataType()
	for f89_local4, f89_local5 in ipairs( CoD.FileshareUtility.CommunityTitles ) do
		if f89_local5.dataType == f89_local0 then
			return f89_local5.title
		end
	end
	return ""
end

CoD.FileshareUtility.GetCurrentCommunityMenuKicker = function ()
	local f90_local0 = CoD.FileshareUtility.GetCurrentCommunityDataType()
	for f90_local4, f90_local5 in ipairs( CoD.FileshareUtility.CommunityTitles ) do
		if f90_local5.dataType == f90_local0 then
			return f90_local5.kicker
		end
	end
	return ""
end

CoD.FileshareUtility.ProcessUIIndex = function ( f91_arg0, f91_arg1, f91_arg2 )
	local f91_local0 = CoD.FileshareUtility.GetIsCommunityMode( f91_arg0 )
	local f91_local1, f91_local2 = CoD.FileshareUtility.GetCurrentFilter()
	Engine.FileshareProcessUIIndex( f91_arg0, f91_arg1, f91_arg2, f91_local0, f91_local1, f91_local2 )
end

CoD.FileshareUtility.GetCategoryCurrentPage = function ( f92_arg0 )
	local f92_local0 = Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "pagination" ), "currentPages" ), f92_arg0 )
	if f92_local0 == nil then
		return 0
	end
	local f92_local1 = Engine.GetModelValue( f92_local0 )
	if f92_local1 == nil then
		f92_local1 = 0
	end
	return f92_local1
end

CoD.FileshareUtility.SetCategoryCurrentPage = function ( f93_arg0, f93_arg1, f93_arg2 )
	if f93_arg1 == nil or f93_arg2 == nil then
		return 
	else
		local f93_local0 = Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "pagination" ), "currentPages" ), f93_arg1 )
	end
end

CoD.FileshareUtility.LoadTheaterFile = function ( f94_arg0, f94_arg1, f94_arg2, f94_arg3, f94_arg4 )
	local f94_local0 = f94_arg1:getModel()
	local f94_local1 = {
		controller = f94_arg2,
		map = Engine.GetModelValue( Engine.GetModel( f94_local0, "mapName" ) ),
		gametype = Engine.GetModelValue( Engine.GetModel( f94_local0, "gameTypeName" ) ),
		isPooled = Engine.GetModelValue( Engine.GetModel( f94_local0, "isPooled" ) ),
		fileID = Engine.GetModelValue( Engine.GetModel( f94_local0, "fileId" ) ),
		fileSize = Engine.GetModelValue( Engine.GetModel( f94_local0, "fileSize" ) ),
		fileName = "film.demo",
		authorXUID = Engine.GetModelValue( Engine.GetModel( f94_local0, "fileAuthorXuid" ) ),
		authorName = Engine.GetModelValue( Engine.GetModel( f94_local0, "fileAuthorName" ) ),
		mainMode = Engine.GetModelValue( Engine.GetModel( f94_local0, "mainMode" ) ),
		isLiveStream = Engine.GetModelValue( Engine.GetModel( f94_local0, "isLiveStream" ) ),
		duration = Engine.GetModelValue( Engine.GetModel( f94_local0, "duration" ) ),
		demoMode = ""
	}
	Engine.SetDvar( "ui_mapname", f94_local1.map )
	Engine.SetDvar( "ui_gametype", f94_local1.gametype )
	Engine.SetDvar( "ui_demoname", f94_local1.fileName )
	Engine.LobbyUpdateDemoInformation( f94_local1 )
	LUI.CoDMetrics.WatchVideoEvent( f94_arg2, f94_local1 )
end

CoD.FileshareUtility.IsCategoryFilm = function ( f95_arg0, f95_arg1 )
	local f95_local0 = f95_arg1:getModel()
	if not f95_local0 then
		return false
	else
		local f95_local1 = Engine.GetModel( f95_local0, "fileCategoryId" )
		if f95_local1 then
			return Engine.GetModelValue( f95_local1 ) == 10
		else
			return false
		end
	end
end

CoD.FileshareUtility.NotificationItemModel = nil
CoD.FileshareUtility.SetNotificationItemModel = function ( f96_arg0 )
	local f96_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "toastItem" )
	if f96_local0 then
		Engine.SetModelValue( Engine.CreateModel( f96_local0, "fileName" ), f96_arg0 )
		CoD.FileshareUtility.SetNotificationItem( f96_local0 )
	end
end

CoD.FileshareUtility.SetNotificationItem = function ( f97_arg0 )
	CoD.FileshareUtility.NotificationItemModel = f97_arg0
end

CoD.FileshareUtility.GetNotificationItem = function ()
	return CoD.FileshareUtility.NotificationItemModel
end

CoD.FileshareUtility.ShowToast = function ( f99_arg0, f99_arg1 )
	local f99_local0 = CoD.FileshareUtility.GetNotificationItem()
	if f99_local0 == nil then
		return 
	else
		local f99_local1 = Engine.GetModelValue( Engine.GetModel( f99_local0, "fileName" ) )
		local f99_local2 = CoD.FileshareUtility.GetCurrentCategory()
		CoD.OverlayUtility.ShowToast( "Fileshare", Engine.Localize( f99_arg1.kicker ) .. " " .. Engine.Localize( f99_local2 ), string.format( f99_arg1.description, f99_local1 ), CoD.FileshareUtility.GetCategoryImage( f99_local2 ), f99_arg1.functionIcon )
	end
end

CoD.FileshareUtility.ShowToastForSelectedItem = function ( f100_arg0, f100_arg1 )
	if f100_arg1 == nil then
		return 
	else
		local f100_local0 = CoD.FileshareUtility.GetCurrentCategory()
		if f100_local0 == nil then
			return 
		else
			local f100_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "currentCategoryNameSingle" )
			CoD.OverlayUtility.ShowToast( "Fileshare", Engine.Localize( f100_arg1.kicker ) .. " " .. Engine.Localize( f100_local0 ), string.format( f100_arg1.description, CoD.FileshareUtility.GetSelectedItemProperty( "fileName" ) ), CoD.FileshareUtility.GetCategoryImage( f100_local0 ), f100_arg1.functionIcon )
		end
	end
end

CoD.FileshareUtility.ShowSimpleToast = function ( f101_arg0, f101_arg1 )
	if f101_arg1 == nil then
		return 
	else
		local f101_local0 = Engine.Localize( f101_arg1.kicker )
		local f101_local1 = Engine.Localize( f101_arg1.description )
		local f101_local2 = f101_arg1.functionIcon
		CoD.OverlayUtility.ShowToast( "Fileshare", f101_local0, f101_local1, f101_local2, f101_local2 )
	end
end

CoD.FileshareUtility.ReportView = function ( f102_arg0, f102_arg1 )
	local f102_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategoryId" )
	local f102_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f102_local0 and f102_local1 and CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" ) ~= Engine.GetXUID64( f102_arg0 ) then
		Engine.FileshareReportView( f102_arg0, f102_local0, f102_local1, f102_arg1 )
	end
end

