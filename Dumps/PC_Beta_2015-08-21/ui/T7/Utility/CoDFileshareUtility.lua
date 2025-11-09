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
	return Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" )
end

CoD.FileshareUtility.GetDeletingModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isDeleting" )
end

CoD.FileshareUtility.GetPublishingModel = function ()
	return Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isPublishing" )
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

CoD.FileshareUtility.IsFileshareReady = function ( f7_arg0 )
	return Engine.GetModelValue( CoD.FileshareUtility.GetReadyModel() )
end

CoD.FileshareUtility.SetDirty = function ()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot" ), "dirty" ) )
end

CoD.FileshareUtility.SetCurrentCategory = function ( f9_arg0 )
	local f9_local0 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategory" )
	local f9_local1 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryName" )
	local f9_local2 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameCaps" )
	local f9_local3 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingle" )
	local f9_local4 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryNameSingleCaps" )
	if f9_arg0 == nil or f9_arg0 == "" then
		Engine.SetModelValue( f9_local0, "" )
		Engine.SetModelValue( f9_local1, "" )
		Engine.SetModelValue( f9_local2, "" )
		Engine.SetModelValue( f9_local3, "" )
		Engine.SetModelValue( f9_local4, "" )
	else
		local f9_local5 = Engine.TableLookup( 0, CoD.fileShareTable, 1, f9_arg0, 8 )
		Engine.SetModelValue( f9_local0, f9_arg0 )
		Engine.SetModelValue( f9_local1, f9_local5 )
		Engine.SetModelValue( f9_local2, f9_local5 .. "_CAPS" )
		Engine.SetModelValue( f9_local3, f9_local5 .. "_SINGLE" )
		Engine.SetModelValue( f9_local4, f9_local5 .. "_SINGLE_CAPS" )
	end
end

CoD.FileshareUtility.GetCurrentCategory = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategory" ) )
end

CoD.FileshareUtility.SetCurrentFilter = function ( f11_arg0, f11_arg1 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterKey" ), f11_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterVal" ), f11_arg1 )
end

CoD.FileshareUtility.GetCurrentFilter = function ()
	local f12_local0 = Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterKey" ) )
	local f12_local1 = Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentFilterVal" ) )
	if f12_local0 == nil or f12_local1 == nil then
		return "", ""
	else
		return f12_local0, f12_local1
	end
end

CoD.FileshareUtility.SetShowCreateButton = function ( f13_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showCreateButton" ), f13_arg0 )
end

CoD.FileshareUtility.GetShowCreateButton = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "showCreateButton" ) )
end

CoD.FileshareUtility.SelectedItemModel = nil
CoD.FileshareUtility.SetShowFileDetails = function ( f15_arg0 )
	local f15_local0 = CoD.FileshareUtility.GetShowFileDetailsModel()
	if f15_arg0 == true then
		Engine.SetModelValue( f15_local0, 1 )
	else
		Engine.SetModelValue( f15_local0, 0 )
	end
end

CoD.FileshareUtility.SetShowPublishNewDetails = function ( f16_arg0 )
	local f16_local0 = CoD.FileshareUtility.GetShowPublishNewDetailsModel()
	if f16_arg0 == true then
		Engine.SetModelValue( f16_local0, 1 )
	else
		Engine.SetModelValue( f16_local0, 0 )
	end
end

CoD.FileshareUtility.SetSelectedItem = function ( f17_arg0 )
	CoD.FileshareUtility.SelectedItemModel = f17_arg0
	if CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" ) == false then
		CoD.FileshareUtility.SetShowFileDetails( true )
		CoD.FileshareUtility.SetShowPublishNewDetails( false )
	else
		CoD.FileshareUtility.SetShowFileDetails( false )
		CoD.FileshareUtility.SetShowPublishNewDetails( true )
	end
end

CoD.FileshareUtility.GetSelectedItemProperty = function ( f18_arg0 )
	if f18_arg0 ~= nil and nil ~= CoD.FileshareUtility.SelectedItemModel then
		local f18_local0 = Engine.GetModel( CoD.FileshareUtility.SelectedItemModel, f18_arg0 )
		if f18_local0 ~= nil then
			return Engine.GetModelValue( f18_local0 )
		end
	end
	return nil
end

CoD.FileshareUtility.UpdateCurrentQuota = function ( f19_arg0 )
	local f19_local0 = Engine.FileshareGetQuota( f19_arg0, CoD.FileshareUtility.GetCurrentCategory() )
	local f19_local1 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryQuota" )
	for f19_local5, f19_local6 in pairs( f19_local0 ) do
		Engine.SetModelValue( Engine.CreateModel( f19_local1, f19_local5 ), f19_local6 )
	end
end

CoD.FileshareUtility.PublishCallback = nil
CoD.FileshareUtility.SetPublishName = function ( f20_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishName" ), f20_arg0 )
end

CoD.FileshareUtility.GetPublishName = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishName" ) )
end

CoD.FileshareUtility.SetPublishDescription = function ( f22_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishDescription" ), f22_arg0 )
end

CoD.FileshareUtility.GetPublishDescription = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishDescription" ) )
end

CoD.FileshareUtility.SetPublishTags = function ( f24_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishTags" ), f24_arg0 )
end

CoD.FileshareUtility.GetPublishTags = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishTags" ) )
end

CoD.FileshareUtility.ResetPublishingModel = function ()
	Engine.SetModelValue( CoD.FileshareUtility.GetPublishingModel(), -1 )
end

CoD.FileshareUtility.SetPublishAllowDownload = function ( f27_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishAllowDownload" ), f27_arg0 )
end

CoD.FileshareUtility.GetPublishAllowDownload = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishAllowDownload" ) )
end

CoD.FileshareUtility.OpenPublishPrompt = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4 )
	CoD.FileshareUtility.SetCurrentCategory( f29_arg2 )
	CoD.FileshareUtility.PublishCallback = f29_arg4
	CoD.FileshareUtility.SetPublishName( f29_arg3 )
	CoD.FileshareUtility.SetPublishAllowDownload( true )
	CoD.FileshareUtility.ResetPublishingModel()
	local f29_local0 = Engine.FileshareGetQuota( f29_arg1, f29_arg2 )
	if f29_local0.categorySlotsAvailable > 0 then
		f29_arg0:openPopup( "FilesharePublish", f29_arg1 )
	else
		f29_arg0:openPopup( "FileshareSlotsFull", f29_arg1 )
	end
end

CoD.FileshareUtility.Publish = function ( f30_arg0 )
	if CoD.FileshareUtility.PublishCallback == nil then
		return 
	else
		CoD.FileshareUtility.PublishCallback( f30_arg0 )
	end
end

CoD.FileshareUtility.Delete = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5 )
	Engine.SetModelValue( CoD.FileshareUtility.GetDeletingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	if f31_arg5 ~= nil then
		f31_arg4.m_leaveParentOpenAfterDelete = f31_arg5
	end
	f31_arg4:openPopup( "FileshareOptionsDelete", f31_arg2 )
end

CoD.FileshareUtility.DeleteYes = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3, f32_arg4 )
	Engine.FileShareDelete( f32_arg2, CoD.FileshareUtility.GetSelectedItemProperty( "fileId" ) )
end

CoD.FileshareUtility.DeleteNo = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4 )
	GoBack( f33_arg4, f33_arg2 )
end

CoD.FileshareUtility.DeleteDone = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
	local f34_local0 = GoBack( f34_arg4, f34_arg2 )
	if f34_local0.m_leaveParentOpenAfterDelete ~= nil and f34_local0.m_leaveParentOpenAfterDelete == true then
		return 
	else
		GoBack( f34_local0, f34_arg2 )
	end
end

CoD.FileshareUtility.Download = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4 )
	
end

CoD.FileshareUtility.AllowDownload = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4 )
	
end

CoD.FileshareUtility.OpenShowcaseManager = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
	local f37_local0 = GoBack( f37_arg4, f37_arg2 )
	f37_local0:openPopup( "Fileshare_ShowcaseManager", f37_arg2 )
end

CoD.FileshareUtility.OpenBuySlots = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4 )
	
end

