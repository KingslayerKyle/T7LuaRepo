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
		fileshareVal = "6",
		weapon_category = "weapon_launcher",
		disabled = false,
		name = "MPUI_WEAPON_LAUNCHER_CAPS",
		loadout_slot = "secondary"
	},
	{
		index = 8,
		fileshareCategory = "paintjob",
		fileshareKey = "22",
		fileshareVal = "7",
		weapon_category = "weapon_knife",
		disabled = false,
		name = "MPUI_WEAPON_KNIFE_CAPS",
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
		fileshareVal = "6",
		weapon_category = "weapon_launcher",
		disabled = false,
		name = "MPUI_WEAPON_LAUNCHER_CAPS",
		loadout_slot = "secondary"
	},
	{
		index = 8,
		fileshareCategory = "variant",
		fileshareKey = "22",
		fileshareVal = "7",
		weapon_category = "weapon_knife",
		disabled = false,
		name = "MPUI_WEAPON_KNIFE_CAPS",
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
CoD.FileshareUtility.FileProperties = {
	"fileSize",
	"fileId",
	"fileSlot",
	"fileCategory",
	"fileName",
	"fileDescription",
	"fileAuthorName",
	"fileAuthorXuid",
	"fileCreateTime",
	"fileOriginId",
	"fileSummarySize",
	"isPublishNew",
	"fileImage",
	"showFileImage",
	"showPlusImage"
}
CoD.FileshareUtility.GetRootModel = function ()
	local fileshareRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" )
	return fileshareRootModel
end

CoD.FileshareUtility.GetDeletingModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isDeleting" )
	return model
end

CoD.FileshareUtility.GetPublishingModel = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isPublishing" )
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

CoD.FileshareUtility.IsFileshareReady = function ( controller )
	local readyModel = CoD.FileshareUtility.GetReadyModel()
	local isReady = Engine.GetModelValue( readyModel )
	return isReady
end

CoD.FileshareUtility.SetDirty = function ()
	local fileshareRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" )
	local fileshareDirtyModel = Engine.CreateModel( fileshareRootModel, "dirty" )
	Engine.ForceNotifyModelSubscriptions( fileshareDirtyModel )
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
		local categoryLocName = Engine.TableLookup( 0, CoD.fileShareTable, 1, category, 8 )
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

CoD.FileshareUtility.UpdateCurrentQuota = function ( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local quotas = Engine.FileshareGetQuota( controller, category )
	local currentQuotaModel = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryQuota" )
	for key, val in pairs( quotas ) do
		local model = Engine.CreateModel( currentQuotaModel, key )
		Engine.SetModelValue( model, val )
	end
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

CoD.FileshareUtility.OpenPublishPrompt = function ( menu, controller, category, initialItemName, publishActionCallback )
	CoD.FileshareUtility.SetCurrentCategory( category )
	CoD.FileshareUtility.PublishCallback = publishActionCallback
	CoD.FileshareUtility.SetPublishName( initialItemName )
	CoD.FileshareUtility.SetPublishAllowDownload( true )
	CoD.FileshareUtility.ResetPublishingModel()
	local quota = Engine.FileshareGetQuota( controller, category )
	if quota.categorySlotsAvailable > 0 then
		menu:openPopup( "FilesharePublish", controller )
	else
		menu:openPopup( "FileshareSlotsFull", controller )
	end
end

CoD.FileshareUtility.Publish = function ( controller )
	if CoD.FileshareUtility.PublishCallback == nil then
		return 
	else
		CoD.FileshareUtility.PublishCallback( controller )
	end
end

CoD.FileshareUtility.Delete = function ( self, element, controller, param, menu, leaveParentOpen )
	Engine.SetModelValue( CoD.FileshareUtility.GetDeletingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	if leaveParentOpen ~= nil then
		menu.m_leaveParentOpenAfterDelete = leaveParentOpen
	end
	menu:openPopup( "FileshareOptionsDelete", controller )
end

CoD.FileshareUtility.DeleteYes = function ( self, element, controller, param, menu )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	Engine.FileShareDelete( controller, fileId )
end

CoD.FileshareUtility.DeleteNo = function ( self, element, controller, param, menu )
	GoBack( menu, controller )
end

CoD.FileshareUtility.DeleteDone = function ( self, element, controller, param, menu )
	local parent = GoBack( menu, controller )
	if parent.m_leaveParentOpenAfterDelete ~= nil and parent.m_leaveParentOpenAfterDelete == true then
		return 
	else
		GoBack( parent, controller )
	end
end

CoD.FileshareUtility.Download = function ( self, element, controller, param, menu )
	
end

CoD.FileshareUtility.AllowDownload = function ( self, element, controller, param, menu )
	
end

CoD.FileshareUtility.OpenShowcaseManager = function ( self, element, controller, param, menu )
	local parentMenu = GoBack( menu, controller )
	parentMenu:openPopup( "Fileshare_ShowcaseManager", controller )
end

CoD.FileshareUtility.OpenBuySlots = function ( self, element, controller, param, menu )
	
end

