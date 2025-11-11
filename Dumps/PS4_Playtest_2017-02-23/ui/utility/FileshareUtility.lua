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
	},
	{
		index = 4,
		fileshareCategory = "customgame",
		fileshareKey = "",
		fileshareVal = "",
		disabled = false,
		selectIndex = false
	},
	{
		index = 5,
		fileshareCategory = "screenshot",
		fileshareKey = "",
		fileshareVal = "",
		disabled = false,
		selectIndex = false
	},
	{
		index = 6,
		fileshareCategory = "clip",
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
	},
	UPLOADED_SCREENSHOT = {
		kicker = "MENU_FILESHARE_ACTION_UPLOADED_SCREENSHOT",
		description = "%s",
		functionIcon = "t7_icon_menu_simple_publish"
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
	"weaponName",
	"showGameTypeImage",
	"plusImageSrc",
	"codeIndex",
	"totalItems",
	"showDetailsViewSpinner"
}
CoD.FileshareUtility.Images = {
	paintjob = "uie_t7_mp_icon_header_paintshop",
	variant = "uie_t7_mp_icon_header_gunsmith",
	emblem = "uie_t7_mp_icon_header_emblem",
	film = "uie_t7_mp_icon_header_theater",
	screenshot = "uie_t7_mp_icon_header_screenshot",
	customgame = "uie_t7_mp_icon_header_customgames",
	screenshot_private = "uie_t7_mp_icon_header_screenshot",
	clip = "uie_t7_mp_icon_header_theater",
	clip_private = "uie_t7_mp_icon_header_theater"
}
CoD.FileshareUtility.LargeImages = {
	paintjob = "uie_t7_mp_icon_header_paintshop_large",
	variant = "uie_t7_mp_icon_header_gunsmith_large",
	emblem = "uie_t7_mp_icon_header_emblem_large",
	film = "uie_t7_mp_icon_header_theater_large",
	screenshot = "uie_t7_mp_icon_header_screenshot_large",
	customgame = "uie_t7_mp_icon_header_customgames_large",
	screenshot_private = "uie_t7_mp_icon_header_screenshot_large",
	clip = "uie_t7_mp_icon_header_theater_large",
	clip_private = "uie_t7_mp_icon_header_theater_large"
}
CoD.FileshareUtility.Colors = {
	paintjob = ColorSet.SelectedGreen,
	variant = ColorSet.CoreMartial,
	emblem = ColorSet.PlayerYellow,
	film = ColorSet.RewardWeaponLevel,
	screenshot = ColorSet.CoreChaos,
	customgame = ColorSet.Orange,
	screenshot_private = ColorSet.CoreChaos,
	clip = ColorSet.CodCasterFriendly,
	clip_private = ColorSet.CodCasterFriendly
}
CoD.FileshareUtility.GetRootModel = function ()
	local fileshareRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" )
	return fileshareRootModel
end

CoD.FileshareUtility.GetSelectedItemRootModel = function ()
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSelectedItem" )
	return model
end

CoD.FileshareUtility.GetDeletingModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isDeleting" )
	return model
end

CoD.FileshareUtility.GetPublishingModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isPublishing" )
	return model
end

CoD.FileshareUtility.GetUploadingModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isUploading" )
	return model
end

CoD.FileshareUtility.GetDownloadingModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isDownloading" )
	return model
end

CoD.FileshareUtility.GetReadyModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "ready" )
	return model
end

CoD.FileshareUtility.GetShowFileDetailsModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showFileDetails" )
	return model
end

CoD.FileshareUtility.GetShowPublishNewDetailsModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showPublishNewDetails" )
	return model
end

CoD.FileshareUtility.GetFileshareTypeModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "fileshareType" )
	return model
end

CoD.FileshareUtility.GetIsFullscreenModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isFullscreen" )
	return model
end

CoD.FileshareUtility.GetInShowcaseManagerModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "inShowcaseManager" )
	return model
end

CoD.FileshareUtility.GetInShowcaseBrowserModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "inShowcaseBrowser" )
	return model
end

CoD.FileshareUtility.GetShouldShowTabsModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "shouldShowTabs" )
	return model
end

CoD.FileshareUtility.GetItemsCountModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "itemsCount" )
	return model
end

CoD.FileshareUtility.InitModels = function ()
	Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCommunityDataType" )
	Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "PublishMode" )
	CoD.FileshareUtility.GetFileshareTypeModel()
end

CoD.FileshareUtility.IsFileshareReady = function ( controller )
	local readyModel = CoD.FileshareUtility.GetReadyModel()
	local isReady = Engine.GetModelValue( readyModel )
	return isReady
end

CoD.FileshareUtility.SetFileshareReady = function ( isReady )
	local readyModel = CoD.FileshareUtility.GetReadyModel()
	Engine.SetModelValue( readyModel, isReady )
end

CoD.FileshareUtility.SetDirty = function ()
	local fileshareRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" )
	local fileshareDirtyModel = Engine.CreateModel( fileshareRootModel, "dirty" )
	Engine.ForceNotifyModelSubscriptions( fileshareDirtyModel )
end

CoD.FileshareUtility.GetItemsCount = function ()
	local model = CoD.FileshareUtility.GetItemsCountModel()
	return Engine.GetModelValue( model )
end

CoD.FileshareUtility.SetItemsCount = function ( controller, count )
	local model = CoD.FileshareUtility.GetItemsCountModel()
	Engine.SetModelValue( model, count )
	ForceNotifyGlobalModel( controller, "fileshareRoot.itemsCount" )
end

CoD.FileshareUtility.GetIsCommunityMode = function ( controller )
	local model = CoD.FileshareUtility.GetFileshareTypeModel()
	local fileshareMode = Engine.GetModelValue( model )
	CoD.FileshareUtility.SetShouldShowTabs( fileshareMode == Enum.FileshareMode.FILESHARE_MODE_USER )
	return fileshareMode == Enum.FileshareMode.FILESHARE_MODE_COMMUNITY
end

CoD.FileshareUtility.SetShouldShowTabs = function ( shouldShow )
	local model = CoD.FileshareUtility.GetShouldShowTabsModel()
	if shouldShow == true then
		Engine.SetModelValue( model, 1 )
	else
		Engine.SetModelValue( model, 0 )
	end
end

CoD.FileshareUtility.GetIsUserMode = function ( controller )
	local model = CoD.FileshareUtility.GetFileshareTypeModel()
	local fileshareMode = Engine.GetModelValue( model )
	return fileshareMode == Enum.FileshareMode.FILESHARE_MODE_USER
end

CoD.FileshareUtility.SetFileshareMode = function ( controller, mode )
	local model = CoD.FileshareUtility.GetFileshareTypeModel()
	Engine.SetModelValue( model, mode )
end

CoD.FileshareUtility.GetIsGroupsMode = function ( controller )
	local model = CoD.FileshareUtility.GetFileshareTypeModel()
	local fileshareMode = Engine.GetModelValue( model )
	return fileshareMode == Enum.FileshareMode.FILESHARE_MODE_GROUPS
end

CoD.FileshareUtility.GetIsFullscreenMode = function ( controller )
	local model = CoD.FileshareUtility.GetIsFullscreenModel()
	local isFullscreenMode = Engine.GetModelValue( model )
	return isFullscreenMode == false
end

CoD.FileshareUtility.SetIsFullscreenMode = function ( controller, isFullscreenMode )
	local model = CoD.FileshareUtility.GetIsFullscreenModel()
	Engine.SetModelValue( model, isFullscreenMode == false )
end

CoD.FileshareUtility.GetInShowcaseManager = function ( controller )
	local model = CoD.FileshareUtility.GetInShowcaseManagerModel()
	local inShowcaseManager = Engine.GetModelValue( model )
	return inShowcaseManager == false
end

CoD.FileshareUtility.SetInShowcaseManager = function ( controller, inShowcaseManager )
	local model = CoD.FileshareUtility.GetInShowcaseManagerModel()
	Engine.SetModelValue( model, inShowcaseManager == false )
end

CoD.FileshareUtility.GetInShowcaseBrowser = function ( controller )
	local model = CoD.FileshareUtility.GetInShowcaseBrowserModel()
	local inShowcaseBrowser = Engine.GetModelValue( model )
	return inShowcaseBrowser == false
end

CoD.FileshareUtility.SetInShowcaseBrowser = function ( controller, inShowcaseBrowser )
	local model = CoD.FileshareUtility.GetInShowcaseBrowserModel()
	Engine.SetModelValue( model, inShowcaseBrowser == false )
end

CoD.FileshareUtility.SetCurrentCommunityDataType = function ( dataType )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCommunityDataType" )
	Engine.SetModelValue( model, dataType )
end

CoD.FileshareUtility.GetCurrentCommunityDataType = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCommunityDataType" )
	local dataType = Engine.GetModelValue( model )
	return dataType
end

CoD.FileshareUtility.SetCurrentGroupsDataType = function ( dataType )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentGroupsDataType" )
	Engine.SetModelValue( model, dataType )
end

CoD.FileshareUtility.GetCurrentGroupsDataType = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentGroupsDataType" )
	local dataType = Engine.GetModelValue( model )
	return dataType
end

CoD.FileshareUtility.SetCurrentCategory = function ( category )
	local categoryModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategory" )
	local categoryNameModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryName" )
	local categoryNameCapsModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameCaps" )
	local categoryNameSingleModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingle" )
	local categoryNameSingleCapsModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingleCaps" )
	if category == nil or category == "" then
		Engine.SetModelValue( categoryModel, "" )
		Engine.SetModelValue( categoryNameModel, "" )
		Engine.SetModelValue( categoryNameCapsModel, "" )
		Engine.SetModelValue( categoryNameSingleModel, "" )
		Engine.SetModelValue( categoryNameSingleCapsModel, "" )
	else
		local categoryLocName = Engine.TableLookup( CoD.fileShareTable, 8, 1, category )
		Engine.SetModelValue( categoryModel, category )
		Engine.SetModelValue( categoryNameModel, categoryLocName )
		Engine.SetModelValue( categoryNameCapsModel, categoryLocName .. "_CAPS" )
		Engine.SetModelValue( categoryNameSingleModel, categoryLocName .. "_SINGLE" )
		Engine.SetModelValue( categoryNameSingleCapsModel, categoryLocName .. "_SINGLE_CAPS" )
	end
end

CoD.FileshareUtility.GetCurrentCategory = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategory" )
	local category = Engine.GetModelValue( model )
	return category
end

CoD.FileshareUtility.ShouldSetPreviewIconSizeShort = function ( category )
	if category == "emblem" or category == "film" or category == "recentgames" or category == "clip" or category == "clip_private" or category == "customgame" or category == "private_screenshot" or category == "screenshot" then
		return true
	else
		return false
	end
end

CoD.FileshareUtility.SetPreviousCategory = function ( category )
	local categoryModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "previousCategory" )
	if category == nil or category == "" then
		Engine.SetModelValue( categoryModel, "" )
	else
		Engine.SetModelValue( categoryModel, category )
	end
end

CoD.FileshareUtility.GetPreviousCategory = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "previousCategory" )
	local category = Engine.GetModelValue( model )
	return category
end

CoD.FileshareUtility.SetCurrentFilter = function ( key, val )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterKey" )
	Engine.SetModelValue( model, key )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterVal" ), val )
end

CoD.FileshareUtility.GetCurrentFilter = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterKey" )
	local key = Engine.GetModelValue( model )
	local val = Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterVal" ) )
	if key == nil or val == nil then
		return "", ""
	else
		return key, val
	end
end

CoD.FileshareUtility.SetCurrentUser = function ( xuid )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentXuid" )
	Engine.SetModelValue( model, xuid )
end

CoD.FileshareUtility.GetCurrentUser = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentXuid" )
	local xuid = Engine.GetModelValue( model )
	return xuid
end

CoD.FileshareUtility.SetShowCreateButton = function ( shouldShow )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showCreateButton" )
	Engine.SetModelValue( model, shouldShow )
end

CoD.FileshareUtility.GetShowCreateButton = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showCreateButton" )
	local shouldShow = Engine.GetModelValue( model )
	return shouldShow
end

CoD.FileshareUtility.SelectedItemModel = nil
CoD.FileshareUtility.SetShowFileDetails = function ( shouldShow )
	local model = CoD.FileshareUtility.GetShowFileDetailsModel()
	if shouldShow == true then
		Engine.SetModelValue( model, 1 )
	else
		Engine.SetModelValue( model, 0 )
	end
end

CoD.FileshareUtility.SetShowPublishNewDetails = function ( shouldShow )
	local model = CoD.FileshareUtility.GetShowPublishNewDetailsModel()
	if shouldShow == true then
		Engine.SetModelValue( model, 1 )
	else
		Engine.SetModelValue( model, 0 )
	end
end

CoD.FileshareUtility.GetSelectedItem = function ()
	return CoD.FileshareUtility.SelectedItemModel
end

CoD.FileshareUtility.SetSelectedItem = function ( itemModel )
	CoD.FileshareUtility.SelectedItemModel = itemModel
	local isPublishNew = CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" )
	if isPublishNew == false then
		CoD.FileshareUtility.SetShowFileDetails( true )
		CoD.FileshareUtility.SetShowPublishNewDetails( false )
	else
		CoD.FileshareUtility.SetShowFileDetails( false )
		CoD.FileshareUtility.SetShowPublishNewDetails( true )
	end
	CoD.FileshareUtility.ResetFileshareSummary( itemModel )
	local shouldShowEmblem = 0
	if CoD.FileshareUtility.GetCurrentCategory() == "emblem" then
		shouldShowEmblem = 1
	end
	Engine.SetModelValue( Engine.CreateModel( itemModel, "shouldShowEmblem", false ), shouldShowEmblem )
end

CoD.FileshareUtility.GetSelectedItemProperty = function ( property )
	if property ~= nil and nil ~= CoD.FileshareUtility.SelectedItemModel then
		local propertyModel = Engine.GetModel( CoD.FileshareUtility.SelectedItemModel, property )
		if propertyModel ~= nil then
			local val = Engine.GetModelValue( propertyModel )
			return val
		end
	end
	return nil
end

CoD.FileshareUtility.SetupDefaultNameAndDescription = function ( elementModel )
	local categoryModel = Engine.GetModel( elementModel, "fileCategory" )
	if not categoryModel then
		return 
	end
	local categoryName = Engine.GetModelValue( categoryModel )
	if categoryName ~= "film" and categoryName ~= "clip" and categoryName ~= "clip_private" and categoryName ~= "screenshot" and categoryName ~= "screenshot_private" then
		return 
	end
	local mapName = Engine.GetModelValue( Engine.GetModel( elementModel, "mapName" ) )
	local gameType = Engine.GetModelValue( Engine.GetModel( elementModel, "gametypeName" ) )
	local mainMode = Engine.GetModelValue( Engine.GetModel( elementModel, "mainMode" ) )
	local fileNameModel = Engine.GetModel( elementModel, "fileName" )
	local fileName = Engine.GetModelValue( fileNameModel )
	if fileName == "" and mapName then
		if mainMode == Enum.eModes.MODE_ZOMBIES then
			local mapRef = CoD.BaseUtility.GetMapValue( mapName, "mapName", mapName )
			fileName = Engine.Localize( mapRef )
		else
			local gameTypeInfo = Engine.GetGameTypeInfo( gameType )
			local gametypeRef = gameTypeInfo.nameRef
			fileName = Engine.Localize( gametypeRef )
		end
		Engine.SetModelValue( fileNameModel, fileName )
	end
	local fileDescriptionModel = Engine.GetModel( elementModel, "fileDescription" )
	local fileDescription = Engine.GetModelValue( fileDescriptionModel )
	if fileDescription == "" and gameType and mapName then
		Engine.SetModelValue( fileDescriptionModel, CoD.BaseUtility.GetGameModeOnMapNameString( gameType, mapName ) )
	end
end

CoD.FileshareUtility.SelectedItemReady = function ()
	local renderFileId = CoD.FileshareUtility.GetSelectedItemProperty( "renderFileId" )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if renderFileId ~= fileId then
		return false
	else
		return true
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
CoD.FileshareUtility.InitFileshareSummaryModels = function ( itemModel )
	local itemSummaryModel = Engine.CreateModel( itemModel, "summary" )
	for _, val in ipairs( CoD.FileshareUtility.SummaryProperties ) do
		Engine.CreateModel( itemSummaryModel, val )
	end
end

CoD.FileshareUtility.GetFileshareSummaryItemModel = function ( itemModel, name )
	local itemSummaryModel = Engine.GetModel( itemModel, "summary" )
	if itemSummaryModel then
		local model = Engine.GetModel( itemSummaryModel, name )
		return model
	else
		return nil
	end
end

CoD.FileshareUtility.SetFileshareSummaryItem = function ( itemModel, name, value )
	local model = CoD.FileshareUtility.GetFileshareSummaryItemModel( itemModel, name )
	if model then
		Engine.SetModelValue( model, value )
	end
end

CoD.FileshareUtility.ResetFileshareSummary = function ( itemModel )
	local itemSummaryModel = Engine.GetModel( itemModel, "summary" )
	if not itemSummaryModel then
		CoD.FileshareUtility.InitFileshareSummaryModels( itemModel )
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "isValid", false )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "fileId", Engine.DefaultID64Value() )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "screenshotFileId", Engine.DefaultID64Value() )
end

CoD.FileshareUtility.SetupFileShareSummary_MP = function ( itemModel, matchRecordData, event )
	local header = matchRecordData.header
	local players = matchRecordData.playerBuffer
	local xuid = event.xuid
	local controller = event.controller
	local teamCount, isDraw, winningTeam, gameType, playerTeam, playerPosition, playerIndex, playerKills, playerDeaths = nil
	local playerScore = 0
	local oppositionScore = 0
	local gameResultText, gameResultColor = nil
	if not header then
		return false
	end
	isDraw = header.isDraw:get()
	winningTeam = header.winningTeam:get()
	teamCount = header.teamCount:get()
	gameType = header.gameType:get()
	playerKills = 0
	playerDeaths = 0
	for i = 1, #players, 1 do
		local player = players[i - 1]
		if player.xuid:get() == xuid then
			playerIndex = i - 1
			playerTeam = player.team:get()
			playerPosition = player.position:get()
			playerScore = player.score:get()
			playerKills = player.kills:get()
			playerDeaths = player.deaths:get()
		end
		local otherScore = player.score:get()
		if oppositionScore < otherScore then
			oppositionScore = otherScore
		end
	end
	if teamCount > 1 then
		playerScore = 0
		oppositionScore = 0
		if playerTeam == Enum.team_t.TEAM_ALLIES then
			playerScore = header.alliesScore:get()
			oppositionScore = header.axisScore:get()
		elseif playerTeam == Enum.team_t.TEAM_AXIS then
			playerScore = header.axisScore:get()
			oppositionScore = header.alliesScore:get()
		end
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "playerScore", playerScore )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "oppositionScore", oppositionScore )
	local gray = {
		r = 0.39,
		g = 0.38,
		b = 0.36
	}
	local brightRed = {
		r = 1,
		g = 0.19,
		b = 0.19
	}
	local brightGreen = {
		r = 0.42,
		g = 0.9,
		b = 0.46
	}
	if teamCount == 1 then
		if playerPosition == nil then
			gameResultText = ""
			gameResultColor = gray
		elseif isDraw == 1 then
			gameResultText = Engine.Localize( "MENU_FILESHARE_DRAW" )
			gameResultColor = gray
		elseif playerPosition < 3 then
			gameResultText = Engine.Localize( "MENU_FILESHARE_VICTORY" )
			gameResultColor = brightGreen
		else
			gameResultText = Engine.Localize( "MENU_FILESHARE_DEFEAT" )
			gameResultColor = brightRed
		end
	elseif isDraw == 1 then
		gameResultText = Engine.Localize( "MENU_FILESHARE_DRAW" )
		gameResultColor = gray
	elseif playerTeam == winningTeam then
		gameResultText = Engine.Localize( "MENU_FILESHARE_VICTORY" )
		gameResultColor = brightGreen
	else
		gameResultText = Engine.Localize( "MENU_FILESHARE_DEFEAT" )
		gameResultColor = brightRed
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "gameResultText", gameResultText )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "gameResultColor", CoD.ColorUtility.ConvertColor( gameResultColor.r, gameResultColor.g, gameResultColor.b ) )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column1Header", Engine.Localize( "MENU_KILLS_CAPS" ) )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column1Value", playerKills )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column2Header", Engine.Localize( "MENU_DEATHS_CAPS" ) )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column2Value", playerDeaths )
	if not playerIndex then
		return false
	end
	local playerBuffer = players[playerIndex]
	local gameTypeStats = {
		captures = 0,
		returns = 0,
		destroys = 0,
		plants = 0,
		defuses = 0,
		throws = 0,
		defending = 0,
		objectiveTime = playerBuffer.objectiveTime:get(),
		escortTime = playerBuffer.escortTime:get()
	}
	if playerIndex ~= nil then
		local gameEvents = matchRecordData.gameEvents
		for i = 1, #gameEvents, 1 do
			local gameEvent = gameEvents[i - 1]
			if playerIndex == gameEvent.player:get() then
				local eventType = gameEvent.eventType
				gameTypeStats.captures = gameTypeStats.captures + eventType.capture:get()
				gameTypeStats.returns = gameTypeStats.returns + eventType["return"]:get()
				gameTypeStats.destroys = gameTypeStats.destroys + eventType.destroy:get()
				gameTypeStats.plants = gameTypeStats.plants + eventType.plant:get()
				gameTypeStats.defuses = gameTypeStats.defuses + eventType.defuse:get()
				gameTypeStats.throws = gameTypeStats.throws + eventType.throw:get()
				gameTypeStats.defending = gameTypeStats.defending + eventType.defending:get()
			end
		end
	end
	local column3Header, column3Value, f59_local2, f59_local3 = nil
	if gameType == "tdm" or gameType == "dm" then
		column3Header = Engine.Localize( "MPUI_RATIO_CAPS" )
		column3Value = CoD.GetKDRatio( playerBuffer.kills:get(), playerBuffer.deaths:get() )
		f59_local2 = Engine.Localize( "MPUI_ASSISTS_CAPS" )
		f59_local3 = playerBuffer.assists:get()
	elseif gameType == "dom" or gameType == "hq" then
		column3Header = Engine.Localize( "MPUI_CAPTURES_CAPS" )
		column3Value = gameTypeStats.captures
		f59_local2 = Engine.Localize( "MPUI_DEFENDS_CAPS" )
		f59_local3 = gameTypeStats.returns
	elseif gameType == "koth" then
		column3Header = Engine.ToUpper( Engine.Localize( "MPUI_OBJTIME" ) )
		column3Value = CoD.GetTimeText( gameTypeStats.objectiveTime * 1000 )
		f59_local2 = Engine.Localize( "MPUI_DEFENDS_CAPS" )
		f59_local3 = gameTypeStats.defending
	elseif gameType == "ctf" then
		column3Header = Engine.Localize( "MPUI_CAPTURES_CAPS" )
		column3Value = gameTypeStats.captures
		f59_local2 = Engine.Localize( "MPUI_RETURNS_CAPS" )
		f59_local3 = gameTypeStats.returns
	elseif gameType == "dem" or gameType == "sab" or gameType == "sd" then
		column3Header = Engine.Localize( "MPUI_PLANTS_CAPS" )
		column3Value = gameTypeStats.plants
		f59_local2 = Engine.Localize( "MPUI_DEFUSES_CAPS" )
		f59_local3 = gameTypeStats.defuses
	elseif gameType == "conf" then
		column3Header = Engine.Localize( "MPUI_KILLS_CONFIRMED_CAPS" )
		column3Value = gameTypeStats.captures
		f59_local2 = Engine.Localize( "MPUI_KILLS_DENIED_CAPS" )
		f59_local3 = gameTypeStats.returns
	elseif gameType == "ball" then
		column3Header = Engine.ToUpper( Engine.Localize( "MPUI_CARRIES" ) )
		column3Value = gameTypeStats.captures
		f59_local2 = Engine.ToUpper( Engine.Localize( "MPUI_THROWS" ) )
		f59_local3 = gameTypeStats.throws
	elseif gameType == "gun" then
		column3Header = Engine.ToUpper( Engine.Localize( "MPUI_STABS" ) )
		column3Value = gameTypeStats.captures
		f59_local2 = Engine.ToUpper( Engine.Localize( "MPUI_HUMILIATED" ) )
		f59_local3 = gameTypeStats.returns
	elseif gameType == "escort" then
		column3Header = Engine.ToUpper( Engine.Localize( "MPUI_ESCORTS" ) )
		column3Value = CoD.GetTimeText( gameTypeStats.escortTime * 1000 )
		f59_local2 = Engine.ToUpper( Engine.Localize( "MPUI_DISABLES" ) )
		f59_local3 = gameTypeStats.returns
	else
		return false
	end
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column3Header", column3Header )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column3Value", column3Value )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column4Header", f59_local2 )
	CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "column4Value", f59_local3 )
	return true
end

CoD.FileshareUtility.SetupFileShareSummary = function ( itemModel, event )
	if not event.isValid then
		return 
	else
		local selectedItemFileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
		if event.fileId ~= selectedItemFileId then
			return 
		else
			local xuid = event.xuid
			if xuid == nil or xuid == "" then
				return 
			else
				local controller = event.controller
				local matchRecordData = Engine.GetMatchRecordStats( controller )
				if matchRecordData == nil then
					return 
				else
					local result = nil
					if CoD.isMultiplayer then
						if not CoD.FileshareUtility.SetupFileShareSummary_MP( itemModel, matchRecordData, event ) then
							return 
						end
						CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "isValid", event.isValid )
						CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "fileId", event.fileId )
						if CoD.FileshareUtility.GetSelectedItemProperty( "currentCategory" ) == "screenshot" then
							CoD.FileshareUtility.SetFileshareSummaryItem( itemModel, "screenshotFileId", event.fileId )
						end
					else
						return 
					end
				end
			end
		end
	end
end

CoD.FileshareUtility.UpdateCurrentQuota = function ( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local quota = Engine.FileshareGetQuota( controller, category )
	local currentQuotaModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryQuota" )
	if quota ~= nil then
		Engine.SetModelValue( currentQuotaModel, quota.categorySlotsAvailable )
	end
end

CoD.FileshareUtility.GetCurrentQuota = function ( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local quota = Engine.FileshareGetQuota( controller, category )
	return quota
end

CoD.FileshareUtility.PublishCallback = nil
CoD.FileshareUtility.SetPublishName = function ( name )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishName" )
	Engine.SetModelValue( model, name )
end

CoD.FileshareUtility.GetPublishName = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishName" )
	return Engine.GetModelValue( model )
end

CoD.FileshareUtility.SetPublishDescription = function ( name )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishDescription" )
	Engine.SetModelValue( model, name )
end

CoD.FileshareUtility.GetPublishDescription = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishDescription" )
	return Engine.GetModelValue( model )
end

CoD.FileshareUtility.SetPublishTags = function ( name )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishTags" )
	Engine.SetModelValue( model, name )
end

CoD.FileshareUtility.GetPublishTags = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishTags" )
	return Engine.GetModelValue( model )
end

CoD.FileshareUtility.ResetPublishingModel = function ()
	local model = CoD.FileshareUtility.GetPublishingModel()
	Engine.SetModelValue( model, -1 )
end

CoD.FileshareUtility.SetPublishAllowDownload = function ( shouldAllowDownload )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishAllowDownload" )
	Engine.SetModelValue( model, shouldAllowDownload )
end

CoD.FileshareUtility.GetPublishAllowDownload = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishAllowDownload" )
	return Engine.GetModelValue( model )
end

CoD.FileshareUtility.OpenPublishPrompt = function ( menu, controller, category, initialItemName, initialItemDescription, publishActionCallback )
	CoD.FileshareUtility.SetCurrentCategory( category )
	CoD.FileshareUtility.PublishCallback = publishActionCallback
	CoD.FileshareUtility.SetPublishName( initialItemName )
	CoD.FileshareUtility.SetPublishDescription( initialItemDescription )
	CoD.FileshareUtility.SetPublishAllowDownload( true )
	CoD.FileshareUtility.ResetPublishingModel()
	CoD.FileshareUtility.SetNotificationItemModel( initialItemName )
	local xuid = Engine.GetXUID64( controller )
	local isReady = CoD.FileshareUtility.IsFileshareReady( controller )
	if isReady == 0 or isReady == false or CoD.FileshareUtility.GetCurrentUser() ~= xuid then
		CoD.FileshareUtility.FetchContentForUser( controller, xuid )
		CoD.FileshareUtility.SetFileshareReady( false )
	end
	OpenPopup( menu, "FilesharePublish", controller )
end

CoD.FileshareUtility.Publish = function ( controller )
	if CoD.FileshareUtility.PublishCallback == nil then
		return 
	else
		CoD.FileshareUtility.PublishCallback( controller )
	end
end

CoD.FileshareUtility.ResetUploadingModel = function ()
	local model = CoD.FileshareUtility.GetUploadingModel()
	Engine.SetModelValue( model, -1 )
end

CoD.FileshareUtility.OpenPrivateUploadPopup = function ( menu, controller, category, uploadActionCallback )
	CoD.FileshareUtility.SetCurrentCategory( category )
	CoD.FileshareUtility.UploadCallback = uploadActionCallback
	CoD.FileshareUtility.SetPublishAllowDownload( false )
	CoD.FileshareUtility.ResetUploadingModel()
	local xuid = Engine.GetXUID64( controller )
	local isReady = CoD.FileshareUtility.IsFileshareReady( controller )
	if isReady == 0 or isReady == false or CoD.FileshareUtility.GetCurrentUser() ~= xuid then
		CoD.FileshareUtility.FetchContentForUser( controller, xuid )
		CoD.FileshareUtility.SetDirty()
	end
	OpenPopup( menu, "DemoFileshareUpload", controller )
end

CoD.FileshareUtility.PrivateUpload = function ( controller )
	if CoD.FileshareUtility.UploadCallback == nil then
		return 
	else
		CoD.FileshareUtility.UploadCallback( controller )
	end
end

CoD.FileshareUtility.Delete = function ( self, element, controller, param, menu, leaveParentOpen )
	if FileshareIsCurrentUserContext( controller ) == false then
		return 
	end
	Engine.SetModelValue( CoD.FileshareUtility.GetDeletingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	if leaveParentOpen ~= nil then
		menu.m_leaveParentOpenAfterDelete = leaveParentOpen
	end
	if false == CoD.FileshareUtility.SelectedItemReady() and not FileshareIsLocalCategory( controller ) and not CoD.FileshareUtility.GetCurrentCategory() == "customgame" and not CoD.FileshareUtility.GetCurrentCategory() == "screenshot" and not CoD.FileshareUtility.GetCurrentCategory() == "clip" then
		return 
	end
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "screenshot_private" or category == "screenshot" or category == "clip" or category == "clip_private" then
		OpenPopup( menu, "FileshareOptionsDelete_Screenshot", controller )
	else
		menu:openPopup( "FileshareOptionsDelete", controller )
	end
end

CoD.FileshareUtility.DeleteYes = function ( self, element, controller, param, menu )
	if FileshareIsCurrentUserContext( controller ) == false then
		return 
	else
		CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
		local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
		Engine.FileShareDelete( controller, fileId )
	end
end

CoD.FileshareUtility.DeleteNo = function ( self, element, controller, param, menu )
	GoBack( menu, controller )
end

CoD.FileshareUtility.DeleteDone = function ( self, element, controller, param, menu )
	local parent = GoBack( menu, controller )
	if parent.m_leaveParentOpenAfterDelete ~= nil and parent.m_leaveParentOpenAfterDelete == true then
		return 
	else
		CoD.FileshareUtility.UpdateCurrentQuota( controller )
	end
end

CoD.FileshareUtility.DownloadCallback = nil
CoD.FileshareUtility.SetDownloadFileId = function ( fileId )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileId" )
	Engine.SetModelValue( model, fileId )
end

CoD.FileshareUtility.GetDownloadFileId = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileId" )
	return Engine.GetModelValue( model )
end

CoD.FileshareUtility.SetDownloadFileName = function ( fileName )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileName" )
	Engine.SetModelValue( model, fileName )
end

CoD.FileshareUtility.GetDownloadFileName = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "downloadFileName" )
	return Engine.GetModelValue( model )
end

CoD.FileshareUtility.ResetDownloadingModel = function ()
	local model = CoD.FileshareUtility.GetDownloadingModel()
	Engine.SetModelValue( model, -1 )
end

CoD.FileshareUtility.OpenDownloadPrompt = function ( menu, controller, downloadActionCallback )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local fileName = CoD.FileshareUtility.GetSelectedItemProperty( "fileName" )
	local fileCategory = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	local isPublishNew = CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" )
	if isPublishNew then
		return 0
	end
	CoD.FileshareUtility.SetCurrentCategory( fileCategory )
	CoD.FileshareUtility.DownloadCallback = downloadActionCallback
	CoD.FileshareUtility.SetDownloadFileId( fileId )
	CoD.FileshareUtility.SetDownloadFileName( fileName )
	CoD.FileshareUtility.ResetDownloadingModel()
	CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
	local quota = Engine.MediaManagerGetQuota( controller, fileCategory )
	local slotsAvailable = quota.categorySlotsAvailable
	local parent = GoBack( menu, controller )
	if slotsAvailable > 0 then
		OpenOverlay( parent, "FileshareDownload", controller )
	else
		OpenOverlay( parent, "MediaManagerSlotsFull", controller )
	end
end

CoD.FileshareUtility.GetLocalStorageType = function ( fileCategory )
	if fileCategory == "paintjob" then
		return Enum.StorageFileType.STORAGE_PAINTJOBS
	elseif fileCategory == "variant" then
		return Enum.StorageFileType.STORAGE_GUNSMITH
	elseif fileCategory == "emblem" then
		return Enum.StorageFileType.STORAGE_EMBLEMS
	else
		
	end
end

CoD.FileshareUtility.DownloadAction = function ( self, element, controller, param, menu )
	Engine.SetModelValue( CoD.FileshareUtility.GetDownloadingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	CoD.FileshareUtility.OpenDownloadPrompt( menu, controller, CoD.FileshareUtility.DownloadActionCallback )
end

CoD.FileshareUtility.Download = function ( controller )
	if CoD.FileshareUtility.DownloadCallback == nil then
		return 
	else
		CoD.FileshareUtility.DownloadCallback( controller )
	end
end

CoD.FileshareUtility.DownloadActionCallback = function ( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local fileId = CoD.FileshareUtility.GetDownloadFileId()
	local fileName = CoD.FileshareUtility.GetDownloadFileName()
	local isCommunity = CoD.FileshareUtility.GetIsCommunityMode( controller )
	Engine.FileshareDownload( controller, category, fileId, fileName, isCommunity )
end

CoD.FileshareUtility.CanDownload = function ( controller )
	if Dvar.fileshare_enabled ~= nil and Dvar.fileshare_enabled:get() == false then
		return false
	end
	local fileCategory = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	local fileAuthorXuid = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	local xuid = Engine.GetXUID64( controller )
	if Dvar.fileshareAllowDownload ~= nil and Dvar.fileshareAllowDownload:get() == false then
		return false
	elseif xuid ~= fileAuthorXuid and Dvar.fileshareAllowDownloadingOthersFiles ~= nil and Dvar.fileshareAllowDownloadingOthersFiles:get() == false then
		return false
	elseif fileCategory == "paintjob" then
		if Dvar.fileshareAllowPaintjobDownload ~= nil and Dvar.fileshareAllowPaintjobDownload:get() == false then
			return false
		end
	elseif fileCategory == "variant" then
		if Dvar.fileshareAllowVariantDownload ~= nil and Dvar.fileshareAllowVariantDownload:get() == false then
			return false
		end
	elseif fileCategory == "emblem" and Dvar.fileshareAllowEmblemDownload ~= nil and Dvar.fileshareAllowEmblemDownload:get() == false then
		return false
	end
	return true
end

CoD.FileshareUtility.FetchContentForUser = function ( controller, xuid )
	Engine.FileshareFetchForUser( controller, xuid )
	CoD.FileshareUtility.SetCurrentUser( xuid )
end

CoD.FileshareUtility.ReportLike = function ( self, element, controller )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local fileCategory = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	local uiModelIndex = CoD.FileshareUtility.GetSelectedItemProperty( "uiModelIndex" )
	CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
	Engine.FileshareReportVote( controller, fileCategory, fileId, uiModelIndex, true )
end

CoD.FileshareUtility.ReportDislike = function ( self, element, controller )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local fileCategory = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	local uiModelIndex = CoD.FileshareUtility.GetSelectedItemProperty( "uiModelIndex" )
	CoD.FileshareUtility.SetNotificationItem( CoD.FileshareUtility.GetSelectedItem() )
	Engine.FileshareReportVote( controller, fileCategory, fileId, uiModelIndex, false )
end

CoD.FileshareUtility.AllowDownload = function ( self, element, controller, param, menu )
	
end

CoD.FileshareUtility.OpenShowcaseManager = function ( self, element, controller, param, menu )
	if FileshareIsCurrentUserContext( controller ) == false then
		return 
	else
		CoD.FileshareUtility.SetShowCreateButton( FileshareCanBuyMoreSlots( controller ) )
		GoBackAndOpenOverlayOnParent( menu, "Fileshare_ShowcaseManager", controller )
	end
end

CoD.FileshareUtility.OpenBuySlots = function ( self, element, controller, param, menu )
	OpenBuyExtraSlotsPackDialog( self, element, controller )
end

CoD.FileshareUtility.GetCategoryImage = function ( category )
	local image = CoD.FileshareUtility.Images[category]
	if image == nil then
		return ""
	else
		return image
	end
end

CoD.FileshareUtility.GetCategoryLargeImage = function ( category )
	local image = CoD.FileshareUtility.LargeImages[category]
	if image == nil then
		return ""
	else
		return image
	end
end

CoD.FileshareUtility.GetCategoryColor = function ( category )
	local color = CoD.FileshareUtility.Colors[category]
	return string.format( "%d %d %d", color.r * 255, color.g * 255, color.b * 255 )
end

CoD.FileshareUtility.GetCurrentCommunityMenuTitle = function ()
	local type = CoD.FileshareUtility.GetCurrentCommunityDataType()
	local titleInfo = CoD.FileshareUtility.CommunityTitles
	for _, title in ipairs( titleInfo ) do
		if title.dataType == type then
			return title.title
		end
	end
	return ""
end

CoD.FileshareUtility.GetCurrentCommunityMenuKicker = function ()
	local type = CoD.FileshareUtility.GetCurrentCommunityDataType()
	local titleInfo = CoD.FileshareUtility.CommunityTitles
	for _, title in ipairs( titleInfo ) do
		if title.dataType == type then
			return title.kicker
		end
	end
	return ""
end

CoD.FileshareUtility.ProcessUIIndex = function ( controller, fileCategory, index )
	local isCommunity = CoD.FileshareUtility.GetIsCommunityMode( controller )
	local key, val = CoD.FileshareUtility.GetCurrentFilter()
	Engine.FileshareProcessUIIndex( controller, fileCategory, index, isCommunity, key, val )
end

CoD.FileshareUtility.GetCategoryCurrentPage = function ( category )
	local paginationModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "pagination" )
	local currentPagesModel = Engine.CreateModel( paginationModel, "currentPages" )
	local categoryModel = Engine.CreateModel( currentPagesModel, category )
	if categoryModel == nil then
		return 0
	end
	local categoryPageValue = Engine.GetModelValue( categoryModel )
	if categoryPageValue == nil then
		categoryPageValue = 0
	end
	return categoryPageValue
end

CoD.FileshareUtility.SetCategoryCurrentPage = function ( controller, category, itemIndex )
	if category == nil or itemIndex == nil then
		return 
	else
		local paginationModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "pagination" )
		local currentPagesModel = Engine.CreateModel( paginationModel, "currentPages" )
		local categoryModel = Engine.CreateModel( currentPagesModel, category )
	end
end

CoD.FileshareUtility.LoadTheaterFile = function ( self, element, controller, param, menu )
	local model = element:getModel()
	local info = {
		controller = controller,
		map = Engine.GetModelValue( Engine.GetModel( model, "mapName" ) ),
		gametype = Engine.GetModelValue( Engine.GetModel( model, "gameTypeName" ) ),
		isPooled = Engine.GetModelValue( Engine.GetModel( model, "isPooled" ) ),
		fileID = Engine.GetModelValue( Engine.GetModel( model, "fileId" ) ),
		fileSize = Engine.GetModelValue( Engine.GetModel( model, "fileSize" ) ),
		fileName = "film.demo",
		authorXUID = Engine.GetModelValue( Engine.GetModel( model, "fileAuthorXuid" ) ),
		authorName = Engine.GetModelValue( Engine.GetModel( model, "fileAuthorName" ) ),
		mainMode = Engine.GetModelValue( Engine.GetModel( model, "mainMode" ) ),
		isLiveStream = Engine.GetModelValue( Engine.GetModel( model, "isLiveStream" ) ),
		duration = Engine.GetModelValue( Engine.GetModel( model, "duration" ) ),
		fileCategory = Engine.GetModelValue( Engine.GetModel( model, "fileCategory" ) ),
		demoMode = ""
	}
	Engine.SetDvar( "ui_mapname", info.map )
	Engine.SetDvar( "ui_gametype", info.gametype )
	Engine.SetDvar( "ui_demoname", info.fileName )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	Engine.LobbyUpdateDemoInformation( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, info )
	CoD.MetricsUtility.WatchVideoEvent( controller, info )
end

CoD.FileshareUtility.IsCategoryFilm = function ( controller, element )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local categoryModel = Engine.GetModel( elementModel, "fileCategory" )
		if categoryModel then
			local category = Engine.GetModelValue( categoryModel )
			local f107_local0
			if category ~= "film" and category ~= "recentgames" and category ~= "film_private" then
				f107_local0 = false
			else
				f107_local0 = true
			end
			return f107_local0
		else
			return false
		end
	end
end

CoD.FileshareUtility.IsCategoryClip = function ( controller, element )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local categoryModel = Engine.GetModel( elementModel, "fileCategory" )
		if categoryModel then
			local category = Engine.GetModelValue( categoryModel )
			local f108_local0
			if category ~= "clip" and category ~= "clip_private" then
				f108_local0 = false
			else
				f108_local0 = true
			end
			return f108_local0
		else
			return false
		end
	end
end

CoD.FileshareUtility.IsCategoryScreenshot = function ( controller, element )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local categoryModel = Engine.GetModel( elementModel, "fileCategory" )
		if categoryModel then
			local category = Engine.GetModelValue( categoryModel )
			local f109_local0
			if category ~= "screenshot" and category ~= "screenshot_private" then
				f109_local0 = false
			else
				f109_local0 = true
			end
			return f109_local0
		else
			return false
		end
	end
end

CoD.FileshareUtility.IsCategoryCustomGames = function ( controller, element )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local categoryModel = Engine.GetModel( elementModel, "fileCategory" )
		if categoryModel then
			local category = Engine.GetModelValue( categoryModel )
			local f110_local0
			if category ~= "customgame" and category ~= "customgame_private" then
				f110_local0 = false
			else
				f110_local0 = true
			end
			return f110_local0
		else
			return false
		end
	end
end

CoD.FileshareUtility.NotificationItemModel = nil
CoD.FileshareUtility.SetNotificationItemModel = function ( fileName )
	local tempItem = Engine.CreateModel( Engine.GetGlobalModel(), "toastItem" )
	if tempItem then
		Engine.SetModelValue( Engine.CreateModel( tempItem, "fileName" ), fileName )
		CoD.FileshareUtility.SetNotificationItem( tempItem )
	end
end

CoD.FileshareUtility.SetNotificationItem = function ( item )
	CoD.FileshareUtility.NotificationItemModel = item
end

CoD.FileshareUtility.GetNotificationItem = function ()
	return CoD.FileshareUtility.NotificationItemModel
end

CoD.FileshareUtility.ShowToast = function ( controller, toast )
	local notificationItemModel = CoD.FileshareUtility.GetNotificationItem()
	if notificationItemModel == nil then
		return 
	else
		local fileNameModel = Engine.GetModel( notificationItemModel, "fileName" )
		local fileName = Engine.GetModelValue( fileNameModel )
		local category = CoD.FileshareUtility.GetCurrentCategory()
		local categoryNameSingleModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingle" )
		local categoryName = Engine.GetModelValue( categoryNameSingleModel )
		local kicker = Engine.Localize( toast.kicker ) .. " " .. Engine.Localize( categoryName )
		local description = string.format( toast.description, fileName )
		local contentIcon = CoD.FileshareUtility.GetCategoryImage( category )
		local functionIcon = toast.functionIcon
		CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, contentIcon, functionIcon )
	end
end

CoD.FileshareUtility.ShowToastForSelectedItem = function ( controller, toast )
	if toast == nil then
		return 
	else
		local fileName = CoD.FileshareUtility.GetSelectedItemProperty( "fileName" )
		local categoryNameSingleModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingle" )
		local categoryName = Engine.GetModelValue( categoryNameSingleModel )
		local category = CoD.FileshareUtility.GetCurrentCategory()
		if category == nil or categoryName == nil then
			return 
		else
			local kicker = Engine.Localize( toast.kicker ) .. " " .. Engine.Localize( categoryName )
			local description = string.format( toast.description, fileName )
			local contentIcon = CoD.FileshareUtility.GetCategoryImage( category )
			local functionIcon = toast.functionIcon
			CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, contentIcon, functionIcon )
		end
	end
end

CoD.FileshareUtility.ShowSimpleToast = function ( controller, toast )
	if toast == nil then
		return 
	else
		local kicker = Engine.Localize( toast.kicker )
		local description = Engine.Localize( toast.description )
		local icon = toast.functionIcon
		CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, icon, icon )
	end
end

CoD.FileshareUtility.ReportView = function ( controller, uiIndex )
	local category = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategoryId" )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local fileAuthorXuid = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	local xuid = Engine.GetXUID64( controller )
	if category and fileId and fileAuthorXuid ~= xuid then
		Engine.FileshareReportView( controller, category, fileId, uiIndex )
	end
end

