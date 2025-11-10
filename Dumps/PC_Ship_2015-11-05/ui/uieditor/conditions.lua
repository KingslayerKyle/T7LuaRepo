function AlwaysFalse()
	return false
end

function AlwaysTrue()
	return true
end

function TestCondition()
	return true
end

function ConditionWithArguments( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4, f4_arg5, f4_arg6, f4_arg7 )
	return true
end

function IsVisibilityBitSet( f5_arg0, f5_arg1 )
	if Engine.IsVisibilityBitSet( f5_arg0, f5_arg1 ) then
		return true
	else
		return false
	end
end

function MediaManagerIsBuyMoreSlot()
	local f6_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isBuyMoreSlot", false ) )
	if f6_local0 == nil then
		return false
	else
		return f6_local0
	end
end

function IsMediaManager()
	local f7_local0 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isMediaManager" )
	if f7_local0 then
		return Engine.GetModelValue( f7_local0 ) == 1
	else
		return false
	end
end

function CanShowMediaManager()
	if IsTu1Build() == true then
		return false
	elseif CoD.isSafehouse then
		return false
	else
		return true
	end
end

function FileshareIsDeleting()
	if Engine.GetModelValue( CoD.FileshareUtility.GetDeletingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsDeletingInError()
	if Engine.GetModelValue( CoD.FileshareUtility.GetDeletingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsPublishing()
	if Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsPublishingInError()
	if Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsPublishingInSuccess()
	if Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_DONE then
		return true
	else
		return false
	end
end

function FileshareIsDownloading()
	if Engine.GetModelValue( CoD.FileshareUtility.GetDownloadingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsDownloadingInError()
	if Engine.GetModelValue( CoD.FileshareUtility.GetDownloadingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsDownloadingInSuccess()
	if Engine.GetModelValue( CoD.FileshareUtility.GetDownloadingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_DONE then
		return true
	else
		return false
	end
end

function FileshareIsSteamAgreed()
	return CoD.SteamWorkshopUtility.GetPublishSteamAgreement()
end

function FilesharePublishToSteamDisabled( f18_arg0 )
	local f18_local0
	if FileshareIsSteamAgreed() then
		f18_local0 = not FileshareIsReady( f18_arg0 )
	else
		f18_local0 = true
	end
	return f18_local0
end

function FileshareShouldAllowDownload()
	return CoD.FileshareUtility.GetPublishAllowDownload()
end

function FileshareIsReady( f20_arg0 )
	local f20_local0 = CoD.FileshareUtility.IsFileshareReady( f20_arg0 )
	if f20_local0 == 0 then
		return false
	else
		return f20_local0 == 1
	end
end

function FileshareHasContent( f21_arg0, f21_arg1 )
	local f21_local0 = CoD.FileshareUtility.IsFileshareReady( f21_arg1 )
	if f21_local0 == 1 or f21_local0 == true then
		if CoD.FileshareUtility.GetItemsCount() == 0 then
			return false
		else
			return true
		end
	else
		return false
	end
end

function FileshareIsQuotaLineDim( f22_arg0, f22_arg1 )
	return Engine.GetModelValue( f22_arg0:getModel( f22_arg1, "isDim" ) )
end

function FileshareIsCommunityMode( f23_arg0, f23_arg1 )
	return CoD.FileshareUtility.GetIsCommunityMode( f23_arg1 )
end

function FileshareShowNormalSizeIcons( f24_arg0, f24_arg1 )
	local f24_local0 = Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isNormalSize", false ) )
	if f24_local0 == nil then
		return true
	else
		return f24_local0
	end
end

function IsFileshareCategoryFilm( f25_arg0, f25_arg1, f25_arg2 )
	return CoD.FileshareUtility.IsCategoryFilm( f25_arg2, f25_arg1 )
end

function FilesshareCanShowVoteOptions( f26_arg0 )
	if CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" ) == Engine.GetXUID64( f26_arg0 ) then
		return false
	else
		return true
	end
end

function FileshareCanDownloadItem( f27_arg0 )
	return CoD.FileshareUtility.CanDownload( f27_arg0 )
end

function FileshareCanPublish( f28_arg0 )
	if not isFileshareFeatureEnabled() or IsUserContentRestricted( f28_arg0 ) then
		return false
	else
		return true
	end
end

function FileshareCanDeleteItem( f29_arg0 )
	if CoD.FileshareUtility.GetIsCommunityMode( f29_arg0 ) then
		return false
	elseif FileshareIsCurrentUserContext( f29_arg0 ) then
		return true
	else
		return false
	end
end

function FileshareCanShowShowcaseManager( f30_arg0 )
	if CoD.FileshareUtility.GetIsCommunityMode( f30_arg0 ) then
		return false
	elseif FileshareIsCurrentUserContext( f30_arg0 ) then
		return true
	else
		return false
	end
end

function FileshareCanShowOptionsMenu( f31_arg0 )
	if CoD.FileshareUtility.GetCurrentCategory() == "film" then
		return false
	else
		return true
	end
end

function FileshareCanShowDownloadsStats( f32_arg0 )
	return CoD.FileshareUtility.CanDownload( f32_arg0 )
end

function isFileshareFeatureEnabled()
	if IsTu1Build() == true then
		return false
	elseif CoD.isSafehouse then
		return false
	elseif Dvar.fileshare_enabled ~= nil and true == Dvar.fileshare_enabled:get() then
		return true
	else
		return false
	end
end

function FileshareIsCurrentUserContext( f34_arg0 )
	if Engine.GetXUID64( f34_arg0 ) == CoD.FileshareUtility.GetCurrentUser() then
		return true
	else
		return false
	end
end

function IsRecentGameBookmarked( f35_arg0 )
	local f35_local0 = CoD.GetPlayerStats( f35_arg0 )
	local f35_local1 = f35_local0.AfterActionReportStats.demoFileID:get()
	if f35_local1 ~= nil and f35_local1 ~= "0" then
		return Engine.IsRecentGameBookmarked( f35_arg0, f35_local1 )
	else
		return true
	end
end

function FileshareCanShowPlayerDetails( f36_arg0 )
	if CoD.FileshareUtility.GetIsCommunityMode( f36_arg0 ) then
		return true
	else
		return false
	end
end

function FileshareCanReportPlayer( f37_arg0 )
	if FileshareIsCurrentUserContext( f37_arg0 ) then
		return false
	else
		return true
	end
end

function FileshareShowcaseSlotsAvailable( f38_arg0 )
	local f38_local0 = CoD.FileshareUtility.GetCurrentQuota( f38_arg0 )
	if f38_local0 and f38_local0.categorySlotsAvailable then
		return f38_local0.categorySlotsAvailable > 0
	else
		return false
	end
end

function FileshareIsReadyToPublish( f39_arg0 )
	if not FileshareIsReady( f39_arg0 ) or FileshareIsPublishing() then
		return false
	else
		return true
	end
end

function FileshareCanBuyMoreSlots( f40_arg0 )
	return false
end

function IsInFileshare( f41_arg0 )
	if CoD.perController[f41_arg0].inFileshare then
		return CoD.perController[f41_arg0].inFileshare == true
	else
		return false
	end
end

function IsTu1Build()
	if Dvar.tu1_build and Dvar.tu1_build:get() == true then
		return true
	else
		return false
	end
end

function ShouldOpenMessageDialog( f43_arg0, f43_arg1 )
	if f43_arg0:getParent() == nil then
		return 
	end
	local f43_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f43_local0 ~= nil then
		if IsInGame() then
			local f43_local1 = Engine.GetModel( f43_local0, "controller" )
			if f43_local1 ~= nil and Engine.GetModelValue( f43_local1 ) ~= f43_arg1 then
				return false
			end
		end
		local f43_local1 = Engine.GetModel( f43_local0, "messagePending" )
		if f43_local1 ~= nil and Engine.GetModelValue( f43_local1 ) > 0 then
			return true
		end
	end
	return false
end

function IsLuaCodeVersionAtLeast( f44_arg0 )
	return f44_arg0 <= Engine.GetLuaCodeVersion()
end

function IsInDefaultState( f45_arg0 )
	return f45_arg0.currentState == "DefaultState"
end

function IsInDefaultStateOrStateNotSet( f46_arg0 )
	if not f46_arg0.currentState then
		return true
	else
		return f46_arg0.currentState == "DefaultState"
	end
end

function IsElementInState( f47_arg0, f47_arg1 )
	return f47_arg0.currentState == f47_arg1
end

function IsSiblingElementInState( f48_arg0, f48_arg1, f48_arg2 )
	return f48_arg0[f48_arg1].currentState == f48_arg2
end

function IsChildElementInState( f49_arg0, f49_arg1, f49_arg2 )
	return f49_arg0[f49_arg1].currentState == f49_arg2
end

function IsMenuInState( f50_arg0, f50_arg1 )
	return f50_arg0.currentState == f50_arg1
end

function IsMenuModelValueEqualTo( f51_arg0, f51_arg1, f51_arg2 )
	local f51_local0 = f51_arg0:getModel()
	if modelArg ~= "" and f51_local0 then
		f51_local0 = Engine.GetModel( f51_local0, f51_arg1 )
	end
	local f51_local1 = f51_local0 and Engine.GetModelValue( f51_local0 )
	local f51_local2
	if f51_local1 == nil or f51_local1 ~= f51_arg2 then
		f51_local2 = false
	else
		f51_local2 = true
	end
	return f51_local2
end

function IsSelfInState( f52_arg0, f52_arg1 )
	return f52_arg0.currentState == f52_arg1
end

function IsWidthZero( f53_arg0 )
	return f53_arg0 == 0
end

function InSafehouseOrFrontend()
	local f54_local0 = CoD.isSafehouse
	if not f54_local0 then
		f54_local0 = CoD.isFrontend
	end
	return f54_local0
end

function InFrontend()
	return CoD.isFrontend
end

function InSafehouse()
	return CoD.isSafehouse
end

function IsFirstListElement( f57_arg0 )
	return f57_arg0:isFirstItem()
end

function IsLastListElement( f58_arg0 )
	return f58_arg0:isLastItem()
end

function IsListAtStart( f59_arg0, f59_arg1, f59_arg2 )
	local f59_local0 = f59_arg0[f59_arg1]
	if f59_local0 and f59_local0.activeWidget and (not f59_arg2 or not f59_arg2.list or f59_arg2.list == f59_local0) then
		return f59_local0.activeWidget:isFirstItem()
	else
		return false
	end
end

function IsListAtEnd( f60_arg0, f60_arg1, f60_arg2 )
	local f60_local0 = f60_arg0[f60_arg1]
	if f60_local0 and f60_local0.activeWidget and (not f60_arg2 or not f60_arg2.list or f60_arg2.list == f60_local0) then
		return f60_local0.activeWidget:isLastItem()
	else
		return false
	end
end

function ListElementHasElements( f61_arg0, f61_arg1 )
	local f61_local0 = f61_arg0[f61_arg1]
	if f61_local0 then
		local f61_local1 = f61_local0:getDataSource()
		if f61_local1 then
			return f61_local1.getCount( f61_local0 ) > 0
		end
	end
	return false
end

function ListLoopEdgesEnabled( f62_arg0, f62_arg1 )
	local f62_local0 = f62_arg0[f62_arg1]
	if f62_local0 then
		return f62_local0.loopEdges
	else
		return false
	end
end

function HasListAction( f63_arg0, f63_arg1 )
	return f63_arg0:getModel( f63_arg1, "action" ) or f63_arg0.action
end

function IsElementInFocus( f64_arg0 )
	return f64_arg0:isInFocus()
end

function isClientListSlideFocus( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
	if not CoD.isPC then
		return IsWidgetInFocus( f65_arg0, f65_arg1, f65_arg2 )
	elseif f65_arg0.defaultNav and f65_arg0.defaultNav == "right" and IsWidgetInFocus( f65_arg0, f65_arg1, f65_arg2 ) then
		return true
	end
	return IsGamepad( f65_arg3 ) and IsWidgetInFocus( f65_arg0, f65_arg1, f65_arg2 )
end

function IsWidgetInFocus( f66_arg0, f66_arg1, f66_arg2 )
	if f66_arg0[f66_arg1] then
		if f66_arg2.idStack then
			local f66_local0 = f66_arg0[f66_arg1].id
			for f66_local4, f66_local5 in ipairs( f66_arg2.idStack ) do
				if f66_local5 == f66_local0 then
					return true
				end
			end
			return false
		elseif f66_arg2.id then
			return f66_arg0[f66_arg1]:hasChildWithID( f66_arg2.id )
		else
			return f66_arg0[f66_arg1]:doesElementOrChildHaveFocus()
		end
	else
		return false
	end
end

function IsFirstTimeSetup( f67_arg0, f67_arg1 )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	elseif not (not Engine.IsMultiplayerGame() or not IsLAN()) or Engine.IsInGame() then
		return false
	else
		return not Engine.IsFirstTimeComplete( f67_arg0, f67_arg1 )
	end
end

function IsMainFirstTimeSetup( f68_arg0 )
	if IsInGame() then
		return false
	elseif f68_arg0 > 0 then
		return false
	elseif Dvar.livestats_skipFirstTime:get() then
		return false
	else
		return Engine.GetProfileVarInt( f68_arg0, "com_first_time" ) ~= 0
	end
end

function TestAndSetFirstTimeMenu( f69_arg0, f69_arg1 )
	if Engine.GetProfileVarInt( f69_arg0, f69_arg1 ) == 0 then
		SetProfileVar( f69_arg0, f69_arg1, 1 )
		return true
	else
		
	end
end

function GrayOutReplayMissionButton( f70_arg0 )
	return false
end

function IsBooleanDvarSet( f71_arg0 )
	if Dvar[f71_arg0] then
		return Dvar[f71_arg0]:get() == true
	else
		return false
	end
end

function IsIntDvarNonZero( f72_arg0 )
	if Engine.DvarInt( nil, f72_arg0 ) ~= 0 then
		return true
	else
		return false
	end
end

function IsDvarValueEqualTo( f73_arg0, f73_arg1 )
	if Dvar[f73_arg0] then
		return Dvar[f73_arg0]:get() == f73_arg1
	else
		
	end
end

function IsInGame()
	return Engine.IsInGame()
end

function IsCurrentMenu( f75_arg0, f75_arg1 )
	if f75_arg0.menuName == f75_arg1 then
		return true
	else
		return false
	end
end

function PropertyIsTrue( f76_arg0, f76_arg1 )
	if f76_arg0 == nil then
		return false
	else
		return f76_arg0[f76_arg1] == true
	end
end

function IsElementPropertyValue( f77_arg0, f77_arg1, f77_arg2 )
	if f77_arg0 == nil then
		return false
	else
		return f77_arg0[f77_arg1] == f77_arg2
	end
end

function IsElementPropertyEnumValue( f78_arg0, f78_arg1, f78_arg2 )
	if f78_arg0 == nil then
		return false
	else
		return f78_arg0[f78_arg1] == f78_arg2
	end
end

function HasProperty( f79_arg0, f79_arg1 )
	if f79_arg0 == nil then
		return false
	else
		return f79_arg0[f79_arg1] ~= nil
	end
end

function ParentPropertyIsTrue( f80_arg0, f80_arg1 )
	if f80_arg0 == nil or f80_arg0:getParent() == nil then
		return false
	else
		local f80_local0 = f80_arg0:getParent()
		return f80_local0[f80_arg1] == true
	end
end

function IsPerControllerTablePropertyValue( f81_arg0, f81_arg1, f81_arg2 )
	return CoD.perController[f81_arg0][f81_arg1] == f81_arg2
end

function IsPerControllerTablePropertyEnumValue( f82_arg0, f82_arg1, f82_arg2 )
	return CoD.perController[f82_arg0][f82_arg1] == f82_arg2
end

function IsActiveLocalClientsCountEqualTo( f83_arg0 )
	return Engine.GetActiveLocalClientsCount() == f83_arg0
end

function IsTextWrapping( f84_arg0, f84_arg1 )
	if f84_arg1 == nil then
		return false
	else
		local f84_local0, f84_local1, f84_local2, f84_local3 = f84_arg1:getLocalLeftRight()
		local f84_local4 = f84_local3 - f84_local2
		local f84_local5, f84_local6 = f84_arg1:getTextWidthAndHeight()
		return f84_local4 < f84_local5
	end
end

function IsCampaign()
	return CoD.isCampaign
end

function IsCampaignZombies()
	return Engine.IsCampaignModeZombies()
end

function IsMultiplayer()
	return CoD.isMultiplayer
end

function IsZombies()
	return CoD.isZombie
end

function IsGroupsEnabled()
	local f89_local0 = Dvar.groups_enabled:get()
	if f89_local0 ~= nil and f89_local0 == true then
		return true
	else
		return false
	end
end

function IsGroupEmblemSelect( f90_arg0, f90_arg1 )
	if CoD.perController[f90_arg1].isGroupEmblemSelect then
		return CoD.perController[f90_arg1].isGroupEmblemSelect
	else
		return false
	end
end

function DoesHaveAdminRightsForGroup( f91_arg0, f91_arg1 )
	local f91_local0 = IsGroupOwner( f91_arg0, f91_arg1 )
	if not f91_local0 then
		f91_local0 = IsGroupAdmin( f91_arg0, f91_arg1 )
	end
	return f91_local0
end

local f0_local0 = function ( f92_arg0, f92_arg1 )
	return Engine.GetModelValue( f92_arg0:getModel( f92_arg1, "memberStatus" ) )
end

local f0_local1 = function ( f93_arg0 )
	return Engine.GetModelValue( Engine.GetModel( f93_arg0, "memberStatus" ) )
end

function IsNotAGroupMember( f94_arg0, f94_arg1 )
	local f94_local0 = nil
	if CoD.perController[f94_arg1].selectedGroup then
		f94_local0 = f0_local1( CoD.perController[f94_arg1].selectedGroup )
	elseif f94_arg0 then
		f94_local0 = f0_local0( f94_arg0, f94_arg1 )
	end
	return f94_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_NONE
end

function IsGroupMember( f95_arg0, f95_arg1 )
	local f95_local0 = nil
	if CoD.perController[f95_arg1].selectedGroup then
		f95_local0 = f0_local1( CoD.perController[f95_arg1].selectedGroup )
	elseif f95_arg0 then
		f95_local0 = f0_local0( f95_arg0, f95_arg1 )
	end
	return f95_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_MEMBER
end

function IsGroupAdmin( f96_arg0, f96_arg1 )
	local f96_local0 = nil
	if CoD.perController[f96_arg1].selectedGroup then
		f96_local0 = f0_local1( CoD.perController[f96_arg1].selectedGroup )
	elseif f96_arg0 then
		f96_local0 = f0_local0( f96_arg0, f96_arg1 )
	end
	return f96_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN
end

function IsGroupOwner( f97_arg0, f97_arg1 )
	local f97_local0 = nil
	if CoD.perController[f97_arg1].selectedGroup then
		f97_local0 = f0_local1( CoD.perController[f97_arg1].selectedGroup )
	elseif f97_arg0 then
		f97_local0 = f0_local0( f97_arg0, f97_arg1 )
	end
	return f97_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER
end

function IsGroupListHeader( f98_arg0 )
	return f98_arg0.type == "header"
end

function DoesGroupListHaveSelectedIcon( f99_arg0 )
	local f99_local0
	if f99_arg0.showSelectedIcon == nil or f99_arg0.showSelectedIcon ~= true then
		f99_local0 = false
	else
		f99_local0 = true
	end
	return f99_local0
end

function IsProcessingGroupTask( f100_arg0 )
	local modelValue = Engine.GetModelValue( GetProcessingGroupTaskModel( f100_arg0 ) )
	local f100_local1
	if modelValue == nil or modelValue ~= true then
		f100_local1 = false
	else
		f100_local1 = true
	end
	return f100_local1
end

function IsGroupEmblemEmpty( f101_arg0, f101_arg1 )
	local f101_local0 = nil
	if CoD.perController[f101_arg1].selectedGroup then
		f101_local0 = Engine.GetModel( CoD.perController[f101_arg1].selectedGroup, "groupId" )
	else
		f101_local0 = f101_arg0:getModel( f101_arg1, "groupId" )
	end
	if f101_local0 ~= nil then
		local f101_local1 = Engine.GetModelValue( f101_local0 )
		if f101_local1 ~= nil then
			return Engine.IsGroupEmblemEmpty( f101_arg1, f101_local1 )
		end
	end
	return true
end

function HasSelectedGroup( f102_arg0, f102_arg1 )
	local f102_local0 = nil
	if f102_arg0 ~= nil then
		if CoD.perController[f102_arg1].selectedGroup then
			f102_local0 = Engine.GetModel( CoD.perController[f102_arg1].selectedGroup, "groupId" )
		else
			f102_local0 = f102_arg0:getModel( f102_arg1, "groupId" )
		end
		if f102_local0 ~= nil then
			local f102_local1 = Engine.GetModelValue( f102_local0 )
			if f102_local1 ~= nil and f102_local1 ~= 0 then
				return true
			end
		end
	end
	return false
end

function HasPendingInvites( f103_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f103_arg0 ), "groups" ), "inviteCount" ) )
	local f103_local1
	if modelValue == nil or modelValue <= 0 then
		f103_local1 = false
	else
		f103_local1 = true
	end
	return f103_local1
end

function IsMemberOfAnyGroup( f104_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f104_arg0 ), "groups" ), "groupCount_self" ) )
	local f104_local1
	if modelValue == nil or modelValue <= 0 then
		f104_local1 = false
	else
		f104_local1 = true
	end
	return f104_local1
end

function IsGroupHeadquartersTabSelected( f105_arg0, f105_arg1 )
	local f105_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f105_arg0 ), "groups" ), "grouphqtabname" ) )
	if f105_local0 ~= nil and f105_local0 == f105_arg1 then
		return true
	else
		return false
	end
end

function IsGroupLeaderboardInitialized()
	local f106_local0, f106_local1, f106_local2, f106_local3, f106_local4 = Engine.GetGroupLeaderboardInfo()
	local f106_local5
	if f106_local4 == nil or f106_local4 ~= true then
		f106_local5 = false
	else
		f106_local5 = true
	end
	return f106_local5
end

function IsGroupLeaderboardAvailable()
	local f107_local0, f107_local1, f107_local2, f107_local3, f107_local4 = Engine.GetGroupLeaderboardInfo()
	local f107_local5
	if f107_local4 == nil or f107_local4 ~= true or f107_local0 == nil or f107_local0 <= 0 then
		f107_local5 = false
	else
		f107_local5 = true
	end
	return f107_local5
end

function IsLeaderboardUpdating()
	local f108_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "isUpdating" ) )
	local f108_local1
	if f108_local0 == nil or f108_local0 ~= true then
		f108_local1 = false
	else
		f108_local1 = true
	end
	return f108_local1
end

function IsLeaderboardEmpty()
	local f109_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
	local f109_local1
	if f109_local0 ~= nil and f109_local0 ~= 0 then
		f109_local1 = false
	else
		f109_local1 = true
	end
	return f109_local1
end

function IsGroupLeaderboardMakerState( f110_arg0, f110_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f110_arg0 ), "groups" ), "leaderboardmaker" ), "state" ) ) == f110_arg1
end

function IsFreerunLeaderboard( f111_arg0 )
	local f111_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f111_local0 then
		return false
	else
		return Engine.GetModelValue( f111_local0 ) == "freerun"
	end
end

function IsZMGlobalsLeaderboard( f112_arg0 )
	local f112_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f112_local0 then
		return false
	else
		return Engine.GetModelValue( f112_local0 ) == "zm_global"
	end
end

function IsZMMapsLeaderboard( f113_arg0 )
	local f113_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f113_local0 then
		return false
	else
		return Engine.GetModelValue( f113_local0 ) == "zm_maps"
	end
end

function IsPlayerAGuest( f114_arg0 )
	return Engine.IsGuest( f114_arg0 )
end

function IsPlayerAllowedToViewMatureContent( f115_arg0 )
	return Engine.IsContentRatingAllowed( f115_arg0 )
end

function IsPlayerAllowedToPlayMultiplayerGames()
	return not Engine.IsAnyControllerMPRestricted()
end

function IsOutOfBounds( f117_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f117_arg0 ), "hudItems.outOfBoundsEndTime" ) )
	local f117_local1 = Engine.CurrentGameTime()
	if f117_local1 == nil then
		return false
	elseif modelValue == nil then
		return false
	elseif CoD.SafeGetModelValue( Engine.GetModelForController( f117_arg0 ), "displayTop3Players" ) == 1 then
		return false
	else
		return f117_local1 < modelValue
	end
end

function IsEnemyDetected( f118_arg0, f118_arg1, f118_arg2 )
	local f118_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f118_arg0 ), "hudItems.sixthsense" ) )
	local f118_local1 = 0
	if f118_local0 == nil then
		return false
	elseif f118_arg2 == nil or f118_arg2 == "" then
		f118_arg2 = "far"
	end
	local f118_local2 = 1
	if f118_arg2 == "close" then
		f118_local2 = 16
	end
	if f118_arg1 == "front" then
		f118_local1 = f118_local2 << 0
	elseif f118_arg1 == "back" then
		f118_local1 = f118_local2 << 1
	elseif f118_arg1 == "left" then
		f118_local1 = f118_local2 << 2
	elseif f118_arg1 == "right" then
		f118_local1 = f118_local2 << 3
	end
	return f118_local0 & f118_local1 ~= 0
end

function AreAllItemsInGroupLocked( f119_arg0, f119_arg1 )
	if not IsProgressionEnabled( f119_arg0 ) then
		return false
	end
	for f119_local0 = 0, 255, 1 do
		if Engine.GetItemGroup( f119_local0 ) == f119_arg1 and not Engine.IsItemLocked( f119_arg0, f119_local0 ) then
			return false
		end
	end
	return true
end

function AreAllSecondaryItemsLocked( f120_arg0 )
	if not IsProgressionEnabled( f120_arg0 ) then
		return false
	end
	for f120_local0 = 0, 255, 1 do
		local f120_local3 = Engine.GetItemGroup( f120_local0 )
		if (f120_local3 == "weapon_pistol" or f120_local3 == "weapon_launcher" or f120_local3 == "weapon_knife") and not Engine.IsItemLocked( f120_arg0, f120_local0 ) then
			return false
		end
	end
	return true
end

function HidePersonalizePrompt( f121_arg0 )
	local f121_local0
	if not CoD.isPC or IsGamepad( f121_arg0 ) then
		f121_local0 = Dvar.ui_execdemo_gamescom:get()
	else
		f121_local0 = true
	end
	return f121_local0
end

function IsCACLockedForEveryone()
	return Engine.IsItemLockedForAll( "FEATURE_CREATE_A_CLASS" )
end

function CACShowSelectPrompt( f123_arg0, f123_arg1, f123_arg2 )
	local f123_local0 = f123_arg1:getModel()
	local f123_local1 = f123_local0 and Engine.GetModel( f123_local0, "weaponSlot" )
	local f123_local2 = f123_local1 and Engine.GetModelValue( f123_local1 )
	if f123_local2 == nil or f123_arg2 == nil then
		return false
	else
		local f123_local3 = CoD.perController[f123_arg2].classModel
		if not (not LUI.startswith( f123_local2, "primarygadgetattachment" ) or CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f123_arg2 ) ~= "" or not CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f123_arg2 ) ~= "") or not (f123_local2 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f123_arg2 ) ~= "") or not (f123_local2 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f123_arg2 ) ~= "") or not (f123_local2 ~= "specialty6" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f123_arg2 ) ~= "") or not (f123_local2 ~= "secondaryattachment3" or CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f123_arg2 ) ~= "") or not (f123_local2 ~= "primaryattachment4" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f123_local3 ) ~= 0) or not (f123_local2 ~= "primaryattachment5" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f123_local3 ) > 1) or not (f123_local2 ~= "primaryattachment6" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f123_local3 ) > 2) or not (not LUI.startswith( f123_local2, "primaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "primary", f123_arg2, f123_local3 )) or not (not LUI.startswith( f123_local2, "secondaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "secondary", f123_arg2, f123_local3 ) and CoD.CACUtility.DoesWeaponHaveAnyAttachments( "secondary", f123_arg2, f123_local3 )) or LUI.startswith( f123_local2, "secondarygadgetattachment" ) and not CoD.CACUtility.ItemEquippedInSlot( "secondarygadget", f123_arg2, f123_local3 ) then
			local f123_local4, f123_local5, f123_local6 = CoD.CACUtility.GetCACSlotStatus( f123_arg2, f123_local3, f123_local2 )
			if f123_local4 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD and not IsElementInState( f123_arg1, "NotVisible" ) then
				return true
			else
				return false
			end
		else
			return true
		end
	end
end

function CACShowRemovePrompt( f124_arg0, f124_arg1 )
	local f124_local0 = f124_arg1:getModel()
	local f124_local1 = f124_local0 and Engine.GetModel( f124_local0, "itemIndex" )
	local f124_local2 = f124_local1 and Engine.GetModelValue( f124_local1 )
	if Engine.IsCampaignGame() then
		local f124_local3 = f124_local0 and Engine.GetModel( f124_local0, "weaponSlot" )
		local f124_local4 = f124_local3 and Engine.GetModelValue( f124_local3 )
		if f124_local4 == "primary" or f124_local4 == "secondary" then
			return false
		end
	end
	if f124_local2 ~= nil and f124_local2 > CoD.CACUtility.EmptyItemIndex then
		return true
	end
end

function CACShowRotatePrompt( f125_arg0, f125_arg1, f125_arg2 )
	local f125_local0 = f125_arg1:getModel()
	local f125_local1 = f125_local0 and Engine.GetModel( f125_local0, "weaponSlot" )
	local f125_local2 = f125_local1 and Engine.GetModelValue( f125_local1 )
	if f125_local2 == nil then
		local f125_local3 = f125_local0 and CoD.SafeGetModelValue( f125_local0, "itemIndex" )
		local f125_local4
		if f125_local3 == nil or f125_local3 <= 0 then
			f125_local4 = false
		else
			f125_local4 = true
		end
		return f125_local4
	elseif CACShowRemovePrompt( f125_arg0, f125_arg1 ) then
		return true
	end
	local f125_local3 = CACShowSelectPrompt( f125_arg0, f125_arg1, f125_arg2 )
	if f125_local3 then
		f125_local3 = LUI.startswith( f125_local2, "primaryattachment" )
		if not f125_local3 then
			f125_local3 = LUI.startswith( f125_local2, "secondaryattachment" )
		end
	end
	return f125_local3
end

function IsCACCustomClassCountDefault( f126_arg0 )
	return Engine.GetCustomClassCount( f126_arg0 ) == CoD.CACUtility.defaultCustomClassCount
end

function IsCACSlotOvercapacity2by1AspectRatio( f127_arg0 )
	local f127_local0 = f127_arg0:getModel()
	if f127_local0 then
		local f127_local1 = Engine.GetModel( f127_local0, "itemSlot" )
		if f127_local1 then
			local f127_local2 = Engine.GetModelValue( f127_local1 )
			local f127_local3
			if f127_local2 ~= "primary" and f127_local2 ~= "secondary" then
				f127_local3 = false
			else
				f127_local3 = true
			end
			return f127_local3
		end
	end
	return false
end

function IsCACSlotOvercapacityWildcard( f128_arg0 )
	local f128_local0 = f128_arg0:getModel()
	if f128_local0 then
		local f128_local1 = Engine.GetModel( f128_local0, "itemSlot" )
		if f128_local1 then
			return LUI.startswith( Engine.GetModelValue( f128_local1 ), "bonuscard" )
		end
	end
	return false
end

function IsCACContextualWildcardOpen( f129_arg0 )
	if CoD.perController[f129_arg0].CACWildcardContextualMenu then
		return true
	else
		return false
	end
end

function IsCACUsingOverkill( f130_arg0 )
	local f130_local0 = f130_arg0:getModel()
	if f130_local0 then
		return CoD.CACUtility.IsBonusCardEquipped( "bonuscard_overkill", f130_local0 )
	else
		return false
	end
end

function IsCACEquippingSlot( f131_arg0, f131_arg1 )
	return CoD.perController[f131_arg0].weaponCategory == f131_arg1
end

function IsCACSlot2by1AspectRatio( f132_arg0 )
	local f132_local0 = f132_arg0:getModel()
	if f132_local0 then
		local f132_local1 = Engine.GetModel( f132_local0, "weaponSlot" )
		if f132_local1 then
			local f132_local2 = Engine.GetModelValue( f132_local1 )
			local f132_local3
			if f132_local2 ~= "primary" and f132_local2 ~= "secondary" then
				f132_local3 = false
			else
				f132_local3 = true
			end
			return f132_local3
		end
	end
	return false
end

function IsCACSlotInfopane2by1AspectRatio( f133_arg0 )
	local f133_local0 = f133_arg0:getModel()
	if f133_local0 then
		local f133_local1 = Engine.GetModel( f133_local0, "weaponSlot" )
		if f133_local1 then
			local f133_local2 = Engine.GetModelValue( f133_local1 )
			local f133_local3
			if f133_local2 ~= "primary" and f133_local2 ~= "secondary" then
				f133_local3 = LUI.startswith( f133_local2, "primaryattachment" )
				if not f133_local3 then
					f133_local3 = LUI.startswith( f133_local2, "secondaryattachment" )
				end
			else
				f133_local3 = true
			end
			return f133_local3
		end
	end
	return false
end

function IsCACItemBubbleGum( f134_arg0, f134_arg1, f134_arg2 )
	local f134_local0 = f134_arg1:getModel()
	if f134_local0 then
		local f134_local1 = Engine.GetModel( f134_local0, "itemIndex" )
		if f134_local1 then
			local f134_local2 = Engine.GetItemGroup( Engine.GetModelValue( f134_local1 ), CoD.PrestigeUtility.GetPermanentUnlockMode() )
			if f134_local2 == "bubblegum" or f134_local2 == "bubblegum_consumable" then
				return true
			end
		end
	end
	return false
end

function IsCACItemConsumable( f135_arg0, f135_arg1, f135_arg2 )
	local f135_local0 = f135_arg1:getModel()
	if f135_local0 then
		local f135_local1 = Engine.GetModel( f135_local0, "itemIndex" )
		if f135_local1 then
			return CoD.CACUtility.IsItemConsumable( Engine.GetModelValue( f135_local1 ) )
		end
	end
	return false
end

function DoesCACItemHaveConsumablesRemaining( f136_arg0, f136_arg1, f136_arg2 )
	if not IsCACItemConsumable( f136_arg0, f136_arg1, f136_arg2 ) then
		return true
	end
	local f136_local0 = f136_arg1:getModel()
	if f136_local0 then
		local f136_local1 = Engine.GetModel( f136_local0, "itemIndex" )
		if f136_local1 then
			return GetConsumableCountFromIndex( f136_arg2, Engine.GetModelValue( f136_local1 ) ) > 0
		end
	end
	return false
end

function IsCACItemEquipped( f137_arg0, f137_arg1, f137_arg2 )
	local f137_local0 = CoD.perController[f137_arg2].weaponCategory
	if f137_local0 == "bubblegum" or f137_local0 == "bubblegum_consumable" then
		return IsBubbleGumBuffEquipped( f137_arg0, f137_arg1, f137_arg2 )
	end
	local f137_local1 = CoD.CACUtility.GetSlotListWithSlot( f137_local0 )
	local f137_local2 = f137_arg1:getModel()
	if f137_local2 then
		local f137_local3 = Engine.GetModel( f137_local2, "itemIndex" )
		local f137_local4 = Engine.GetModel( f137_local2, "upgradeItemIndex" )
		local f137_local5 = f137_local3
		if f137_local4 and IsCACItemUpgraded( f137_arg0, f137_arg1, f137_arg2 ) then
			f137_local5 = f137_local4
		end
		if f137_local5 then
			local f137_local6 = Engine.GetModelValue( f137_local5 )
			for f137_local10, f137_local11 in ipairs( f137_local1 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f137_local11, f137_arg2 ) == f137_local6 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACWildcardEquipped( f138_arg0, f138_arg1, f138_arg2 )
	local f138_local0 = CoD.CACUtility.GetSlotListWithSlot( CoD.perController[f138_arg2].weaponCategory )
	local f138_local1 = f138_arg1:getModel()
	if f138_local1 then
		local f138_local2 = Engine.GetModel( f138_local1, "itemIndex" )
		if f138_local2 then
			local f138_local3 = Engine.GetModelValue( f138_local2 )
			for f138_local7, f138_local8 in ipairs( f138_local0 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f138_local8, f138_arg2 ) == f138_local3 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACWeaponEquippedForSlot( f139_arg0, f139_arg1, f139_arg2, f139_arg3 )
	local f139_local0 = f139_arg1:getModel( f139_arg2, "itemIndex" )
	local f139_local1 = f139_arg0:getModel()
	if f139_local0 then
		local f139_local2 = Engine.GetModel( f139_local1, f139_arg3 .. ".itemIndex" )
		if f139_local2 then
			local f139_local3 = Engine.GetModelValue( f139_local2 )
			local f139_local4 = Engine.GetModelValue( f139_local0 )
			local f139_local5 = Engine.GetAttachmentRef( f139_local3, f139_local4 )
			if f139_local4 > CoD.CACUtility.EmptyItemIndex then
				return true
			end
		end
	end
	return false
end

function IsCACCustomizationReticleAttachmentItemEquipped( f140_arg0, f140_arg1, f140_arg2, f140_arg3 )
	local f140_local0 = f140_arg1:getModel( f140_arg2, "itemIndex" )
	local f140_local1 = f140_arg0:getModel()
	if f140_local0 then
		local f140_local2 = Engine.GetModel( f140_local1, f140_arg3 .. ".itemIndex" )
		if f140_local2 then
			local f140_local3 = Engine.GetModelValue( f140_local2 )
			local f140_local4 = Engine.GetModelValue( f140_local0 )
			local f140_local5 = Engine.GetAttachmentRef( f140_local3, f140_local4 )
			if f140_local4 > CoD.CACUtility.EmptyItemIndex then
				return CoD.CACUtility.attachmentsWithCustReticle[f140_local5]
			end
		end
	end
	return false
end

function IsCACCustomizationDWAttachmentItemEquipped( f141_arg0, f141_arg1, f141_arg2 )
	local f141_local0 = f141_arg1:getModel( f141_arg2, "itemIndex" )
	local f141_local1 = CoD.SafeGetModelValue( f141_arg1:getModel(), "weaponSlot" )
	local f141_local2 = f141_local1 and CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f141_local1 )
	local f141_local3 = f141_arg0:getModel()
	if f141_local2 and f141_local0 then
		local f141_local4 = Engine.GetModel( f141_local3, f141_local2 .. ".itemIndex" )
		if f141_local4 then
			local f141_local5 = Engine.GetModelValue( f141_local4 )
			local f141_local6 = Engine.GetModelValue( f141_local0 )
			local f141_local7 = Engine.GetAttachmentRef( f141_local5, f141_local6 )
			if f141_local6 > CoD.CACUtility.EmptyItemIndex then
				return f141_local7 == "dw"
			end
		end
	end
	return false
end

function IsCACItemNew( f142_arg0, f142_arg1 )
	if not IsProgressionEnabled( f142_arg1 ) then
		return false
	end
	local f142_local0 = f142_arg0:getModel( f142_arg1, "itemIndex" )
	if f142_local0 then
		local f142_local1 = Engine.GetModelValue( f142_local0 )
		local f142_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if f142_local1 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( f142_arg1, f142_local1, f142_local2 )
		end
	end
	return false
end

function IsCACAttachmentNew( f143_arg0, f143_arg1, f143_arg2 )
	if not IsProgressionEnabled( f143_arg2 ) then
		return false
	end
	local f143_local0 = CoD.perController[f143_arg2].weaponCategory
	local f143_local1 = f143_arg1:getModel( f143_arg2, "itemIndex" )
	local f143_local2 = f143_arg0:getModel()
	if f143_local1 then
		local f143_local3 = "primary"
		if LUI.startswith( f143_local0, "secondaryattachment" ) then
			f143_local3 = "secondary"
		end
		local f143_local4 = Engine.GetModel( f143_local2, f143_local3 .. ".itemIndex" )
		if f143_local4 then
			return Engine.IsAttachmentNew( f143_arg2, Engine.GetModelValue( f143_local4 ), Engine.GetModelValue( f143_local1 ) )
		end
	end
	return false
end

function IsSpecialistNew( f144_arg0, f144_arg1, f144_arg2 )
	if not IsProgressionEnabled( f144_arg2 ) then
		return false
	end
	local f144_local0 = Engine.GetModelValue( f144_arg0:getModel( f144_arg2, "heroIndex" ) )
	local f144_local1 = Engine.CurrentSessionMode()
	if f144_local0 then
		local f144_local2 = Engine.GetLoadoutItemIndexForHero( f144_local1, f144_local0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		if f144_local2 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( f144_arg2, f144_local2 )
		end
	end
	return false
end

function IsCACAnyLoadoutSlotNew( f145_arg0, f145_arg1 )
	if not IsProgressionEnabled( f145_arg1 ) then
		return false
	else
		local f145_local0 = f145_arg0:getModel( f145_arg1, "weaponSlot" )
		if f145_local0 then
			return Engine.IsLoadoutSlotNew( f145_arg1, Engine.GetModelValue( f145_local0 ) )
		else
			return false
		end
	end
end

function IsCACSpecificLoadoutSlotNew( f146_arg0, f146_arg1, f146_arg2 )
	if not IsProgressionEnabled( f146_arg1 ) then
		return false
	else
		local f146_local0 = f146_arg0:getModel( f146_arg1, f146_arg2 .. ".weaponSlot" )
		if f146_local0 then
			return Engine.IsLoadoutSlotNew( f146_arg1, Engine.GetModelValue( f146_local0 ) )
		else
			return false
		end
	end
end

function ShouldDisplayWeaponGroupBreadcrumbCount( f147_arg0, f147_arg1 )
	if not IsProgressionEnabled( f147_arg1 ) then
		return false
	elseif IsInPermanentUnlockMenu( f147_arg1 ) then
		return false
	else
		local f147_local0 = f147_arg0:getModel( f147_arg1, "breadcrumbCount" )
		if f147_local0 then
			return Engine.GetModelValue( f147_local0 ) > 0
		else
			return false
		end
	end
end

function IsCACAnyOpticsNew( f148_arg0, f148_arg1, f148_arg2 )
	if not IsProgressionEnabled( f148_arg1 ) then
		return false
	else
		local f148_local0 = f148_arg0:getModel( f148_arg1, f148_arg2 .. ".itemindex" )
		if f148_local0 then
			return Engine.AreAnyOpticsNew( f148_arg1, Engine.GetModelValue( f148_local0 ) )
		else
			return false
		end
	end
end

function IsCACAnyAttachmentsNew( f149_arg0, f149_arg1, f149_arg2 )
	if not IsProgressionEnabled( f149_arg1 ) then
		return false
	else
		local f149_local0 = f149_arg0:getModel( f149_arg1, f149_arg2 .. ".itemindex" )
		if f149_local0 then
			return Engine.AreAnyNonOpticAttachmentsNew( f149_arg1, Engine.GetModelValue( f149_local0 ) )
		else
			return false
		end
	end
end

function IsCACAnythingInCACItemNew( f150_arg0 )
	if IsProgressionEnabled( f150_arg0 ) then
		return Engine.IsAnythingInCACNew( f150_arg0 )
	else
		return false
	end
end

function IsCACAnyScorestreaksNew( f151_arg0 )
	if not IsProgressionEnabled( f151_arg0 ) then
		return false
	else
		return Engine.WeaponGroupHasNewItem( f151_arg0, "killstreak" )
	end
end

function IsCACAnySpecialistsNew( f152_arg0 )
	if IsProgressionEnabled( f152_arg0 ) then
		if Engine.IsLoadoutSlotNew( f152_arg0, "herogadget" ) or Engine.IsLoadoutSlotNew( f152_arg0, "heroweapon" ) then
			return true
		elseif Engine.AreAnyCharacterCustomizationItemsNew( f152_arg0 ) then
			return true
		end
		local f152_local0 = Engine.CurrentSessionMode()
		local f152_local1 = Engine.GetHeroList( f152_local0 )
		for f152_local2 = 0, #f152_local1 - 1, 1 do
			if CoD.CCUtility.GetTauntsAndGesturesNewCount( f152_arg0, f152_local2, Engine.GetHeroBundleInfo( f152_local0, f152_local2 ), f152_local0 ) > 0 then
				return true
			end
		end
	end
	return false
end

function IsCACAnyWeaponOptionNew( f153_arg0, f153_arg1 )
	if IsProgressionEnabled( f153_arg1 ) then
		local f153_local0 = f153_arg0:getModel( f153_arg1, "weaponOptionTypeName" )
		local f153_local1 = f153_arg0:getModel( f153_arg1, "weaponOptionSubIndex" )
		local f153_local2 = f153_arg0:getModel( f153_arg1, "weaponOptionType" )
		if f153_local0 and f153_local1 and f153_local2 then
			local f153_local3 = Engine.GetModelValue( f153_local0 )
			local f153_local4 = Engine.GetModelValue( f153_local1 )
			local f153_local5 = Engine.GetModelValue( f153_local2 )
			if f153_local5 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and f153_local4 > CoD.CACUtility.EmptyItemIndex then
				return Engine.IsWeaponOptionGroupNew( f153_arg1, f153_local4, f153_local5 )
			end
		end
	end
	return false
end

function IsCACAnyBubblegumNew( f154_arg0 )
	if not IsProgressionEnabled( f154_arg0 ) then
		return false
	end
	local f154_local0 = Engine.WeaponGroupHasNewItem( f154_arg0, "bubblegum" )
	if not f154_local0 then
		f154_local0 = Engine.WeaponGroupHasNewItem( f154_arg0, "bubblegum_consumable" )
	end
	return f154_local0
end

function IsCACItemPurchased( f155_arg0, f155_arg1 )
	if not (not IsZombies() or CoD.PrestigeUtility.isInPermanentUnlockMenu) or not IsProgressionEnabled( f155_arg1 ) then
		return true
	end
	local f155_local0 = nil
	local f155_local1 = f155_arg0.itemIndex
	if not f155_local1 then
		f155_local0 = f155_arg0:getModel( f155_arg1, "itemIndex" )
		if f155_local0 then
			f155_local1 = Engine.GetModelValue( f155_local0 )
		end
	end
	if f155_local1 then
		return Engine.IsItemPurchased( f155_arg1, f155_local1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	end
	return false
end

function ShouldShowTokenIconOnItem( f156_arg0, f156_arg1, f156_arg2 )
	if Engine.IsZombiesGame() then
		return false
	else
		local f156_local0
		if not IsCACItemLocked( f156_arg0, f156_arg1, f156_arg2 ) and not IsCACItemPurchased( f156_arg1, f156_arg2 ) then
			f156_local0 = not IsCurrentMenuAttachmentMenu( f156_arg0 )
		else
			f156_local0 = false
		end
	end
	if Engine.IsCampaignGame() and not f156_local0 then
		f156_local0 = IsCACItemUpgradable( f156_arg0, f156_arg1, f156_arg2 )
	end
	return f156_local0
end

function IsCACItemUpgraded( f157_arg0, f157_arg1, f157_arg2 )
	if IsCACItemLocked( f157_arg0, f157_arg1, f157_arg2 ) then
		return false
	end
	local f157_local0 = f157_arg1.upgradeItemIndex
	if not f157_local0 then
		local f157_local1 = f157_arg1:getModel( f157_arg2, "upgradeItemIndex" )
		if f157_local1 then
			f157_local0 = Engine.GetModelValue( f157_local1 )
		end
	end
	if not f157_local0 then
		return false
	elseif not IsProgressionEnabled( f157_arg2 ) then
		return true
	end
	return Engine.IsItemPurchased( f157_arg2, f157_local0 )
end

function IsCACItemBanned( f158_arg0, f158_arg1, f158_arg2 )
	local f158_local0 = f158_arg1:getModel( f158_arg2, "itemIndex" )
	if f158_local0 then
		return Engine.GetItemRestrictionState( Engine.GetModelValue( f158_local0 ) ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
	else
		return false
	end
end

function IsCACItemUpgradable( f159_arg0, f159_arg1, f159_arg2 )
	if IsCACItemLocked( f159_arg0, f159_arg1, f159_arg2 ) then
		return false
	end
	local f159_local0 = f159_arg1.upgradeItemIndex
	if not f159_local0 then
		local f159_local1 = f159_arg1:getModel( f159_arg2, "upgradeItemIndex" )
		if f159_local1 then
			f159_local0 = Engine.GetModelValue( f159_local1 )
		end
	end
	if not f159_local0 then
		return false
	end
	return IsCACItemPurchased( f159_arg1, f159_arg2 ) and not IsCACItemUpgraded( f159_arg0, f159_arg1, f159_arg2 )
end

local f0_local2 = function ( f160_arg0, f160_arg1, f160_arg2 )
	local f160_local0 = Engine.GetModel( f160_arg1:getModel(), "itemIndex" )
	if f160_local0 and Engine.GetModelValue( f160_local0 ) ~= 0 then
		local f160_local1 = Engine.GetModelValue( Engine.GetModel( f160_arg1:getModel(), "ref" ) )
		local f160_local2 = Engine.GetModelValue( Engine.GetModel( f160_arg1:getModel(), "weaponSlot" ) )
		if LUI.startswith( f160_local2, "cybercom_tacrig" ) or LUI.startswith( f160_local2, "cybercom_ability" ) then
			return f160_local1
		end
	end
end

function IsCACSlotUpgradable( f161_arg0, f161_arg1, f161_arg2 )
	if not f161_arg1:getModel() then
		return false
	else
		local f161_local0 = f0_local2( f161_arg0, f161_arg1, f161_arg2 )
		if f161_local0 then
			return not LUI.endswith( f161_local0, "_pro" )
		else
			return false
		end
	end
end

function IsCACSlotUpgraded( f162_arg0, f162_arg1, f162_arg2 )
	if not f162_arg1:getModel() then
		return false
	else
		local f162_local0 = f0_local2( f162_arg0, f162_arg1, f162_arg2 )
		if f162_local0 then
			return LUI.endswith( f162_local0, "_pro" )
		else
			return false
		end
	end
end

function IsWeaponPrestigeLevelAtLeast( f163_arg0, f163_arg1, f163_arg2 )
	local f163_local0 = f163_arg0:getModel()
	if f163_local0 then
		local f163_local1 = CoD.SafeGetModelValue( f163_local0, "itemIndex" )
		return f163_local1 and f163_arg2 <= CoD.CACUtility.GetWeaponPLevel( f163_arg1, f163_local1 )
	else
		return false
	end
end

function IsCACHaveTokens( f164_arg0 )
	return Engine.GetCurrentTokens( f164_arg0, "weapon_smg", CoD.PrestigeUtility.GetPermanentUnlockMode() ) > 0
end

function ShouldCACDisplayTokens( f165_arg0 )
	if IsMultiplayer() then
		if IsLive() and not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) and not IsInGame() then
			return true
		end
	elseif IsCampaign() then
		if CoD.isSafehouse and not CoD.perController[f165_arg0].everythingUnlocked then
			return true
		end
	elseif IsFirstTimeSetup( f165_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
		return true
	end
	return false
end

function IsCPAndInSafehouse()
	if IsCampaign() and CoD.isSafehouse then
		return true
	else
		return false
	end
end

function IsProgressionEnabled( f167_arg0 )
	if not (not IsMultiplayer() or not IsLive() or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )) or not (not CoD.PrestigeUtility.isInPermanentUnlockMenu or not IsLive() or Engine.IsInGame()) or not (not IsCampaign() or CoD.perController[f167_arg0].everythingUnlocked) or IsZombies() and IsLive() and not Engine.IsInGame() then
		return true
	else
		return false
	end
end

function IsClassAllocationInState( f168_arg0, f168_arg1 )
	return Engine.GetMaxAllocation( f168_arg0 ) == f168_arg1
end

function IsProgressionElementItemLocked( f169_arg0, f169_arg1, f169_arg2 )
	if not IsProgressionEnabled( f169_arg2 ) then
		return false
	else
		return f169_arg1.isLocked
	end
end

local f0_local3 = function ( f170_arg0, f170_arg1, f170_arg2 )
	local f170_local0 = CoD.perController[f170_arg2].classModel
	local f170_local1 = CoD.perController[f170_arg2].weaponCategory
	local f170_local2 = nil
	local f170_local3 = f170_arg1.itemIndex
	local f170_local4 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f170_local3 then
		f170_local2 = f170_arg1:getModel( f170_arg2, "itemIndex" )
		if f170_local2 then
			f170_local3 = Engine.GetModelValue( f170_local2 )
		end
	end
	if f170_local3 then
		if not f170_local1 then
			f170_local1 = Engine.GetLoadoutSlotForItem( f170_local3, f170_local4 )
		end
		if f170_local0 and f170_local1 and (LUI.startswith( f170_local1, "primaryattachment" ) or LUI.startswith( f170_local1, "secondaryattachment" )) then
			local f170_local5 = "primary"
			if LUI.startswith( f170_local1, "secondaryattachment" ) then
				f170_local5 = "secondary"
			end
			local f170_local6 = Engine.GetModel( f170_local0, f170_local5 .. ".itemIndex" )
			if f170_local6 then
				return Engine.IsItemAttachmentLocked( f170_arg2, Engine.GetModelValue( f170_local6 ), f170_local3, f170_local4 )
			end
		end
		return Engine.IsItemLocked( f170_arg2, f170_local3, f170_local4 )
	else
		return false
	end
end

function IsCACItemLocked( f171_arg0, f171_arg1, f171_arg2 )
	if not IsProgressionEnabled( f171_arg2 ) then
		return false
	else
		return f0_local3( f171_arg0, f171_arg1, f171_arg2 )
	end
end

function IsCACItemLockedForGamesCom( f172_arg0, f172_arg1, f172_arg2 )
	if not IsProgressionEnabled( f172_arg2 ) and not IsGamesComBuild() then
		return false
	else
		return f0_local3( f172_arg0, f172_arg1, f172_arg2 )
	end
end

function IsCACItemLockedForBeta( f173_arg0, f173_arg1, f173_arg2 )
	if not IsProgressionEnabled( f173_arg2 ) and not LuaUtils.IsBetaBuild() then
		return false
	else
		return f0_local3( f173_arg0, f173_arg1, f173_arg2 )
	end
end

function IsCACItemLockedOrNotPurchased( f174_arg0, f174_arg1, f174_arg2 )
	local f174_local0 = IsCACItemLocked( f174_arg0, f174_arg1, f174_arg2 )
	if not f174_local0 then
		f174_local0 = not IsCACItemPurchased( f174_arg1, f174_arg2 )
	end
	return f174_local0
end

function IsCACItemClassified( f175_arg0, f175_arg1, f175_arg2 )
	if not IsProgressionEnabled( f175_arg2 ) and not LuaUtils.IsBetaBuild() then
		return false
	elseif Engine.GetModelValue( f175_arg1:getModel( f175_arg2, "unlockLevel" ) ) >= 60 then
		return true
	else
		return false
	end
end

function IsItemRefLocked( f176_arg0, f176_arg1 )
	local f176_local0 = Engine.GetItemIndexFromReference( f176_arg1 )
	if f176_local0 then
		return Engine.IsItemLocked( f176_arg0, f176_local0 )
	else
		return true
	end
end

function IsNonAttachmentItemLocked( f177_arg0, f177_arg1 )
	if not IsProgressionEnabled( f177_arg0 ) then
		return false
	else
		local f177_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f177_local1 = Engine.GetItemIndexFromReference( f177_arg1, f177_local0 )
		if f177_local1 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemLocked( f177_arg0, f177_local1, f177_local0 )
		else
			return false
		end
	end
end

function IsNonAttachmentItemPurchased( f178_arg0, f178_arg1 )
	if not IsProgressionEnabled( f178_arg0 ) then
		return false
	else
		local f178_local0 = Engine.GetItemIndexFromReference( f178_arg1 )
		if f178_local0 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemPurchased( f178_arg0, f178_local0 )
		else
			return false
		end
	end
end

function IsCACItemMutuallyExclusiveWithSelection( f179_arg0, f179_arg1 )
	local f179_local0 = CoD.perController[f179_arg1].weaponCategory
	local f179_local1 = CoD.CACUtility.EmptyItemIndex
	local f179_local2 = f179_arg0:getModel( f179_arg1, "itemIndex" )
	if f179_local2 then
		f179_local1 = Engine.GetModelValue( f179_local2 )
	end
	if not f179_local0 then
		f179_local0 = Engine.GetLoadoutSlotForItem( f179_local1 )
	end
	if f179_local0 then
		local f179_local3 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f179_local0, f179_arg1, f179_local1 )
		for f179_local4 = 1, #f179_local3, 1 do
			if f179_local3[f179_local4] ~= "" then
				return true
			end
		end
	end
	return false
end

function IsMenuPreviewImageSquare( f180_arg0 )
	if f180_arg0.menuName == "PerkSelect" or f180_arg0.menuName == "LethalEquipmentSelect" or f180_arg0.menuName == "TacticalEquipmentSelect" or f180_arg0.menuName == "TacticalRigSelect" or f180_arg0.menuName == "WildcardSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuCybercoreOrRigMenu( f181_arg0 )
	if f181_arg0.menuName == "TacticalRigSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuEquipmentMenu( f182_arg0 )
	if f182_arg0.menuName == "PerkSelect" or f182_arg0.menuName == "LethalEquipmentSelect" or f182_arg0.menuName == "TacticalEquipmentSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuAttachmentMenu( f183_arg0 )
	if f183_arg0.menuName == "PrimaryAttachmentSelect" or f183_arg0.menuName == "PrimaryOpticSelect" or f183_arg0.menuName == "SecondaryAttachmentSelect" or f183_arg0.menuName == "SecondaryOpticSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponMenu( f184_arg0 )
	if f184_arg0.menuName == "PrimaryWeaponSelect" or f184_arg0.menuName == "SecondaryWeaponSelect" or f184_arg0.menuName == "WeaponBuildKits" or f184_arg0.menuName == "WeaponBuildKitsCustomizeVariant" or f184_arg0.menuName == "WeaponBuildKitsCategorySelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponType( f185_arg0 )
	if IsCurrentMenuAttachmentMenu( f185_arg0 ) or IsCurrentMenuWeaponMenu( f185_arg0 ) then
		return true
	else
		return false
	end
end

function IsMulticoreActivated( f186_arg0 )
	if Engine.IsCampaignGame() then
		local f186_local0 = IsInTrainingSim( f186_arg0 )
		local f186_local1 = Dvar.allItemsUnlocked:get()
		if not f186_local1 then
			f186_local1 = f186_local0 or not IsItemRefLocked( f186_arg0, "feature_multicore" )
		end
		return f186_local1
	else
		return false
	end
end

function IsInTrainingSim( f187_arg0 )
	if Engine.IsCampaignGame() then
		local f187_local0 = Engine.GetModel( Engine.GetModelForController( f187_arg0 ), "safehouse.inTrainingSim" )
		local f187_local1 = false
		if f187_local0 then
			f187_local1 = Engine.GetModelValue( f187_local0 ) > 0
		end
		return f187_local1
	else
		return false
	end
end

function IsMulticoreInMobileArmory( f188_arg0, f188_arg1 )
	if CoD.perController[f188_arg1].isInMobileArmory then
		return CoD.perController[f188_arg1].isInMobileArmory and IsMulticoreActivated( f188_arg1 )
	else
		return false
	end
end

function IsCybercoreMenuDisabled( f189_arg0 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f189_arg0 ), "hudItems.cybercoreSelectMenuDisabled" ) == 1
end

function IsCybercoreItemEquipped( f190_arg0, f190_arg1, f190_arg2 )
	local f190_local0 = Engine.GetEquippedCybercore( f190_arg2 )
	local f190_local1 = f190_arg1:getModel( f190_arg2, "itemIndex" )
	if f190_local1 then
		return Engine.GetModelValue( f190_local1 ) == f190_local0
	else
		return false
	end
end

function IsCybercoreAbilityAvailable( f191_arg0, f191_arg1 )
	local f191_local0 = f191_arg0:getModel()
	if f191_local0 then
		if Engine.IsItemPurchased( f191_arg1, Engine.GetModelValue( Engine.GetModel( f191_local0, "baseItemIndex" ) ) ) then
			return true
		end
		local f191_local1 = Engine.GetModelValue( Engine.GetModel( f191_local0, "prereqItemIndex" ) )
		if f191_local1 ~= -1 then
			return Engine.IsItemPurchased( f191_arg1, f191_local1 )
		end
	end
	return false
end

function IsCybercoreAbilityPurchasable( f192_arg0, f192_arg1 )
	local f192_local0 = f192_arg0:getModel()
	if f192_local0 then
		return not Engine.IsItemPurchased( f192_arg1, Engine.GetModelValue( Engine.GetModel( f192_local0, "baseItemIndex" ) ) )
	else
		return false
	end
end

function IsCybercoreAbilityUpgradable( f193_arg0, f193_arg1 )
	local f193_local0 = f193_arg0:getModel()
	if f193_local0 then
		local f193_local1 = Engine.GetModelValue( Engine.GetModel( f193_local0, "baseItemIndex" ) )
		local f193_local2 = Engine.GetModelValue( Engine.GetModel( f193_local0, "upgradeItemIndex" ) )
		if Engine.IsItemPurchased( f193_arg1, f193_local1 ) and f193_local2 then
			return not Engine.IsItemPurchased( f193_arg1, f193_local2 )
		end
	end
	return false
end

function IsCybercoreAbilityUpgraded( f194_arg0, f194_arg1 )
	local f194_local0 = f194_arg0:getModel()
	if f194_local0 then
		local f194_local1 = Engine.GetModelValue( Engine.GetModel( f194_local0, "upgradeItemIndex" ) )
		if f194_local1 then
			return Engine.IsItemPurchased( f194_arg1, f194_local1 )
		else
			return true
		end
	else
		return false
	end
end

function IsBubbleGumPackClassSelectedBubbleGumPack( f195_arg0, f195_arg1 )
	local f195_local0 = f195_arg1:getModel()
	local f195_local1 = f195_arg0:getModel()
	if f195_local0 and f195_local1 and f195_local0 == f195_local1 then
		return true
	else
		return false
	end
end

function IsCurrentClassSelectedClass( f196_arg0, f196_arg1 )
	local f196_local0 = f196_arg1:getModel()
	local f196_local1 = f196_arg0:getModel()
	if f196_local0 and f196_local1 and f196_local0 == f196_local1 then
		return true
	else
		return false
	end
end

function IsCurrentClassModelValueEqualToString( f197_arg0, f197_arg1, f197_arg2 )
	local f197_local0 = CoD.perController[f197_arg0].weaponCategory
	local f197_local1 = CoD.perController[f197_arg0].classModel
	local f197_local2 = f197_local1 and Engine.GetModel( f197_local1, f197_arg1 )
	local f197_local3 = f197_local2 and Engine.GetModelValue( f197_local2 )
	local f197_local4
	if f197_local3 == nil or f197_local3 ~= f197_arg2 then
		f197_local4 = false
	else
		f197_local4 = true
	end
	return f197_local4
end

function IsCACSlotHaveModel( f198_arg0 )
	local f198_local0 = f198_arg0:getModel()
	if f198_local0 then
		local f198_local1 = Engine.GetModel( f198_local0, "weaponSlot" )
		if f198_local1 then
			local f198_local2 = Engine.GetModelValue( f198_local1 )
			if f198_local2 == "primary" or f198_local2 == "secondary" or LUI.startswith( f198_local2, "primaryattachment" ) or LUI.startswith( f198_local2, "secondaryattachment" ) or f198_local2 == "primarygadget" or f198_local2 == "secondarygadget" or LUI.startswith( f198_local2, "primarygadgetattachment" ) or LUI.startswith( f198_local2, "secondarygadgetattachment" ) or LUI.startswith( f198_local2, "specialty" ) or LUI.startswith( f198_local2, "bonuscard" ) or f198_local2 == "cybercore" then
				return true
			end
		end
	end
	return false
end

local f0_local4 = function ( f199_arg0, f199_arg1, f199_arg2, f199_arg3 )
	if not f199_arg2 or not f199_arg3 then
		return nil
	else
		local f199_local0 = f199_arg1:getModel( f199_arg2, "weaponSlot" )
		if not f199_local0 then
			return nil
		else
			local f199_local1 = Engine.GetModelValue( f199_local0 )
			if not f199_local1 then
				return nil
			else
				return f199_local1
			end
		end
	end
end

function IsCACSlotEquipped( f200_arg0, f200_arg1, f200_arg2 )
	if not f200_arg2 then
		return false
	end
	local f200_local0 = f200_arg1:getModel( f200_arg2, "customWeaponSlot" )
	local f200_local1 = nil
	if f200_local0 then
		f200_local1 = Engine.GetModelValue( f200_local0 )
	end
	if f200_local1 then
		local f200_local2 = f200_arg0:getModel( f200_arg2, f200_local1 )
		if f200_local2 then
			local f200_local3 = Engine.GetModel( f200_local2, "itemIndex" )
			if f200_local3 then
				local f200_local4 = Engine.GetModelValue( f200_local3 )
				local f200_local5, f200_local6 = string.find( f200_local1, "%." )
				return CoD.CACUtility.GetAttachedItemSlot( f200_arg0:getModel(), f200_local4, CoD.CACUtility.GetAttachmentListForSlot( string.sub( f200_local1, 0, f200_local5 - 1 ) ) ) ~= nil
			end
		end
	else
		local f200_local2 = f200_arg0:getModel()
		local f200_local3 = f0_local4( f200_arg0, f200_arg1, f200_arg2, f200_local2 )
		if f200_local3 then
			local f200_local4, f200_local5, f200_local6 = CoD.CACUtility.GetCACSlotStatus( f200_arg2, f200_local2, f200_local3 )
			return f200_local5
		end
	end
	return false
end

function IsSecondaryAttachmentEquippedWithNoPersonalization( f201_arg0, f201_arg1, f201_arg2 )
	if IsCACCustomizationDWAttachmentItemEquipped( f201_arg0, f201_arg1, f201_arg2 ) then
		return true
	elseif not IsLive() and IsCACSlotEquipped( f201_arg0, f201_arg1, f201_arg2 ) then
		return true
	else
		return false
	end
end

function IsCACSlotAvailable( f202_arg0, f202_arg1, f202_arg2 )
	local f202_local0 = f202_arg0:getModel()
	local f202_local1 = f0_local4( f202_arg0, f202_arg1, f202_arg2, f202_local0 )
	if f202_local1 then
		local f202_local2, f202_local3, f202_local4 = CoD.CACUtility.GetCACSlotStatus( f202_arg2, f202_local0, f202_local1 )
		return f202_local2 == CoD.CACUtility.CACStatusAvailable.AVAILABLE
	else
		return false
	end
end

function IsCACSecondLethalAvailable( f203_arg0, f203_arg1, f203_arg2 )
	if IsCACSlotAvailable( f203_arg0, f203_arg1, f203_arg2 ) then
		if not IsCACSpecificWildcardEquipped( f203_arg0, "bonuscard_danger_close" ) then
			return true
		elseif IsCACSpecificSlotEquipped( f203_arg0, f203_arg2, "primarygadget" ) then
			return true
		end
	end
	return false
end

function IsCACSlotNeedWildcard( f204_arg0, f204_arg1, f204_arg2 )
	local f204_local0 = f0_local4( f204_arg0, f204_arg1, f204_arg2, f204_arg0:getModel() )
	if f204_local0 and CoD.CACUtility.WildcardNeededForSlot( f204_arg2, f204_local0 ) then
		return true
	else
		return false
	end
end

function IsCACSlotCanEquipWildcard( f205_arg0, f205_arg1, f205_arg2 )
	local f205_local0 = f0_local4( f205_arg0, f205_arg1, f205_arg2, f205_arg0:getModel() )
	if f205_local0 then
		local f205_local1, f205_local2 = CoD.CACUtility.WildcardNeededForSlot( f205_arg2, f205_local0 )
		if f205_local1 then
			return f205_local2
		end
	end
	return false
end

function IsCACSlotWildcardLocked( f206_arg0, f206_arg1, f206_arg2 )
	local f206_local0 = f0_local4( f206_arg0, f206_arg1, f206_arg2, f206_arg0:getModel() )
	if f206_local0 then
		local f206_local1, f206_local2, f206_local3 = CoD.CACUtility.WildcardNeededForSlot( f206_arg2, f206_local0 )
		if f206_local1 then
			return f206_local3
		end
	end
	return false
end

function IsCACAnyPerkEquipped( f207_arg0 )
	local f207_local0 = f207_arg0:getModel()
	if f207_local0 then
		return CoD.CACUtility.IsItemEquippedInAnySlot( f207_local0, CoD.CACUtility.CompletePerkSlotNameList )
	else
		return false
	end
end

function IsCACAnyWildcardEquipped( f208_arg0 )
	local f208_local0 = f208_arg0:getModel()
	if f208_local0 then
		return CoD.CACUtility.IsItemEquippedInAnySlot( f208_local0, CoD.CACUtility.BonuscardSlotNameList )
	else
		return false
	end
end

function IsCACSlotWeaponForAttachmentEquipped( f209_arg0, f209_arg1, f209_arg2 )
	local f209_local0 = f209_arg1:getModel()
	local f209_local1 = f209_arg0:getModel()
	if f209_local0 then
		local f209_local2 = Engine.GetModel( f209_local0, "weaponSlot" )
		if f209_local2 then
			local f209_local3 = Engine.GetModelValue( f209_local2 )
			if LUI.startswith( f209_local3, "primaryattachment" ) then
				local f209_local4, f209_local5, f209_local6 = CoD.CACUtility.GetCACSlotStatus( f209_arg2, f209_local1, "primary" )
				return f209_local5
			elseif LUI.startswith( f209_local3, "secondaryattachment" ) then
				local f209_local4, f209_local5, f209_local6 = CoD.CACUtility.GetCACSlotStatus( f209_arg2, f209_local1, "secondary" )
				return f209_local5
			end
		end
	end
	return false
end

function IsCACSlotSpecificItemEquipped( f210_arg0, f210_arg1, f210_arg2 )
	local f210_local0 = f210_arg0:getModel( f210_arg1, "itemIndex" )
	if f210_local0 then
		local f210_local1 = Engine.GetModelValue( f210_local0 )
		if f210_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetItemRef( f210_local1 ) == f210_arg2 then
			return true
		end
	end
	return false
end

function IsCACEquippedWildcardItemCount( f211_arg0, f211_arg1, f211_arg2 )
	return f211_arg2 == CoD.CACUtility.SpecificWildcardEquippedCount( f211_arg0:getModel(), f211_arg1 )
end

function IsCACCountGreaterThanEquippedWildcardItem( f212_arg0, f212_arg1, f212_arg2 )
	return f212_arg2 <= CoD.CACUtility.SpecificWildcardEquippedCount( f212_arg0:getModel(), f212_arg1 )
end

function IsCACPrimaryGunfighterCountEqualTo( f213_arg0, f213_arg1 )
	return f213_arg1 == CoD.CACUtility.PrimaryGunfighterEquippedCount( f213_arg0:getModel() )
end

function IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( f214_arg0, f214_arg1 )
	return f214_arg1 <= CoD.CACUtility.PrimaryGunfighterEquippedCount( f214_arg0:getModel() )
end

function IsCACAttachmentSlotVisible( f215_arg0, f215_arg1, f215_arg2, f215_arg3 )
	if IsCACSlotWeaponForAttachmentEquipped( f215_arg0, f215_arg1, f215_arg2 ) then
		return not IsCACCountGreaterThanEquippedWildcardItem( f215_arg0, "bonuscard_primary_gunfighter", f215_arg3 )
	else
		return IsCACCountGreaterThanEquippedWildcardItem( f215_arg0, "bonuscard_primary_gunfighter", 0 )
	end
end

function IsHintTextLeftAlign( f216_arg0, f216_arg1 )
	local f216_local0 = f216_arg0:getModel( f216_arg1, "weaponSlot" )
	if f216_local0 and LUI.startswith( Engine.GetModelValue( f216_local0 ), "primarygadget" ) then
		return true
	else
		return false
	end
end

function IsHintTextRightAlign( f217_arg0, f217_arg1 )
	local f217_local0 = f217_arg0:getModel( f217_arg1, "weaponSlot" )
	if f217_local0 then
		local f217_local1 = Engine.GetModelValue( f217_local0 )
		if f217_local1 == "primaryattachment3" or f217_local1 == "primaryattachment6" or f217_local1 == "secondaryattachment3" or f217_local1 == "specialty3" or f217_local1 == "specialty6" then
			return true
		end
	end
	return false
end

function IsCACSlotAttachment( f218_arg0 )
	local f218_local0 = f218_arg0:getModel()
	if f218_local0 and Engine.GetModel( f218_local0, "weaponSlot" ) then
		local f218_local1 = Engine.GetModelValue( Engine.GetModel( f218_local0, "weaponSlot" ) )
		if LUI.startswith( f218_local1, "primaryattachment" ) or LUI.startswith( f218_local1, "secondaryattachment" ) then
			return true
		end
	end
	return false
end

function IsCACAnyGreedWildcardUnequipped( f219_arg0, f219_arg1 )
	local f219_local0 = f219_arg0:getModel( f219_arg1, "weaponSlot" )
	if f219_local0 then
		local f219_local1 = Engine.GetModelValue( f219_local0 )
		if f219_local1 == "specialty4" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f219_arg1 ) ~= ""
		elseif f219_local1 == "specialty5" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f219_arg1 ) ~= ""
		elseif f219_local1 == "specialty6" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f219_arg1 ) ~= ""
		end
	end
	return false
end

function IsCACSpecificWildcardEquipped( f220_arg0, f220_arg1 )
	local f220_local0 = f220_arg0:getModel()
	if f220_local0 then
		return CoD.CACUtility.IsBonusCardEquipped( f220_arg1, f220_local0 )
	else
		return false
	end
end

function IsCACSpecificSlotEquipped( f221_arg0, f221_arg1, f221_arg2 )
	local f221_local0 = f221_arg0:getModel()
	if f221_local0 then
		local f221_local1, f221_local2, f221_local3 = CoD.CACUtility.GetCACSlotStatus( f221_arg1, f221_local0, f221_arg2 )
		return f221_local2
	else
		return false
	end
end

local f0_local5 = function ( f222_arg0, f222_arg1 )
	if not f222_arg1 then
		return 0
	end
	local f222_local0 = CoD.perController[f222_arg1].classModel
	if f222_local0 then
		local f222_local1 = Engine.GetModel( f222_local0, f222_arg0 )
		if f222_local1 then
			local f222_local2 = Engine.GetModel( f222_local1, "itemIndex" )
			if f222_local2 then
				local f222_local3 = Engine.GetModelValue( f222_local2 )
				if f222_local3 ~= 0 then
					return Engine.GetNumAttachments( f222_local3 ) - 1
				end
			end
		end
	end
	return 0
end

function IsCACGadgetModAvailable( f223_arg0, f223_arg1, f223_arg2 )
	local f223_local0 = f223_arg0:getModel()
	if not f223_arg2 or not f223_local0 then
		return false
	end
	local f223_local1 = f223_arg1:getModel( f223_arg2, "weaponSlot" )
	if not f223_local1 then
		return false
	end
	local f223_local2 = Engine.GetModelValue( f223_local1 )
	local f223_local3 = "primarygadget"
	if LUI.startswith( f223_local2, "primarygadgetattachment" ) then
		f223_local3 = "primarygadget"
	elseif LUI.startswith( f223_local2, "secondarygadgetattachment" ) then
		f223_local3 = "secondarygadget"
	end
	if CoD.CACUtility.ItemEquippedInSlot( f223_local3, f223_arg2 ) then
		local f223_local4 = Engine.GetModel( f223_local0, f223_local3 .. ".cust" .. f223_local2 .. ".itemIndex" )
		if f223_local4 and Engine.GetModelValue( f223_local4 ) > CoD.CACUtility.EmptyItemIndex then
			return true
		end
	end
	return false
end

function IsCACSlotRequiresWildcard( f224_arg0, f224_arg1, f224_arg2 )
	local f224_local0 = f224_arg0:getModel()
	if not f224_arg2 or not f224_local0 then
		return false
	else
		local f224_local1 = f224_arg1:getModel( f224_arg2, "weaponSlot" )
		if not f224_local1 then
			return false
		else
			local f224_local2 = Engine.GetModelValue( f224_local1 )
			if not f224_local2 then
				return false
			else
				local f224_local3, f224_local4, f224_local5 = CoD.CACUtility.GetCACSlotStatus( f224_arg2, f224_local0, f224_local2 )
				return f224_local3 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	end
end

function IsCACThirdPrimaryAttachmentAvailable( f225_arg0 )
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( CoD.perController[f225_arg0].classModel ) >= 1
end

function IsCACFifthPrimaryAttachmentAvailable( f226_arg0 )
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( CoD.perController[f226_arg0].classModel ) >= 2
end

function IsCACSecondSecondaryAttachmentAvailable( f227_arg0 )
	return CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f227_arg0 ) ~= ""
end

local f0_local6 = function ( f228_arg0, f228_arg1, f228_arg2 )
	if f228_arg1 and f228_arg0 then
		local f228_local0 = Engine.GetModel( f228_arg1, "itemIndex" )
		local f228_local1 = Engine.GetModel( f228_arg0, f228_arg2 )
		if f228_local0 and f228_local1 then
			local f228_local2 = Engine.GetModel( f228_local1, "itemIndex" )
			if f228_local2 then
				local f228_local3 = Engine.GetModelValue( f228_local0 )
				local f228_local4 = Engine.GetModelValue( f228_local2 )
				if f228_local4 > CoD.CACUtility.EmptyItemIndex then
					return Engine.IsTakeTwoGadgetAttachment( f228_local4, f228_local3 )
				end
			end
		end
	end
	return false
end

local f0_local7 = function ( f229_arg0, f229_arg1 )
	if f229_arg0 then
		for f229_local4, f229_local5 in ipairs( f229_arg1 ) do
			local f229_local6 = Engine.GetModel( f229_arg0, f229_local5 )
			if f229_local6 then
				local f229_local3 = Engine.GetModel( f229_local6, "itemIndex" )
				if f229_local3 and Engine.GetModelValue( f229_local3 ) == 1 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACTakeTwoPrimaryGadgetAttachmentEquipped( f230_arg0 )
	return f0_local7( f230_arg0:getModel(), CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoSecondaryGadgetAttachmentEquipped( f231_arg0 )
	return f0_local7( f231_arg0:getModel(), CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoPrimaryGadgetAttachment( f232_arg0, f232_arg1 )
	return f0_local6( f232_arg0:getModel(), f232_arg1:getModel(), "primarygadget" )
end

function IsCACTakeTwoSecondaryGadgetAttachment( f233_arg0, f233_arg1 )
	return f0_local6( f233_arg0:getModel(), f233_arg1:getModel(), "secondarygadget" )
end

function IsPrimaryWeaponAttachmentAvailable( f234_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "primary", f234_arg0 ) and f0_local5( "primary", f234_arg0 ) > 0
end

function IsSecondaryWeaponAttachmentAvailable( f235_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "secondary", f235_arg0 ) and f0_local5( "secondary", f235_arg0 ) > 0
end

function IsItemSlotLockedByWildcardLocked( f236_arg0, f236_arg1, f236_arg2, f236_arg3 )
	f236_arg1.itemIndex = Engine.GetItemIndexFromReference( f236_arg3 )
	return IsCACItemLocked( f236_arg0, f236_arg1, f236_arg2 )
end

function IsPrimaryEquipmentModAvailable( f237_arg0, f237_arg1, f237_arg2 )
	return IsCACGadgetModAvailable( f237_arg0, f237_arg1, f237_arg2 )
end

function IsSecondaryEquipmentModAvailable( f238_arg0, f238_arg1, f238_arg2 )
	return IsCACGadgetModAvailable( f238_arg0, f238_arg1, f238_arg2 )
end

function IsPerk1PlusEquipped( f239_arg0, f239_arg1 )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty4", f239_arg1, f239_arg0:getModel() ) ~= 0
end

function IsPerk2PlusEquipped( f240_arg0, f240_arg1 )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty5", f240_arg1, f240_arg0:getModel() ) ~= 0
end

function IsPerk3PlusEquipped( f241_arg0, f241_arg1 )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty6", f241_arg1, f241_arg0:getModel() ) ~= 0
end

function IsCACInfopaneItemNameEmpty( f242_arg0, f242_arg1 )
	local f242_local0 = f242_arg0:getModel( f242_arg1, "name" )
	local f242_local1 = f242_arg0:getModel()
	if f242_local0 and Engine.GetModelValue( f242_local0 ) == "" then
		return true
	else
		return false
	end
end

function IsCACWeaponVariantAvailable( f243_arg0, f243_arg1 )
	if not Gunsmith_IsEnabled( f243_arg0, f243_arg1 ) then
		return false
	end
	local f243_local0 = f243_arg0:getModel()
	if f243_local0 then
		local f243_local1 = Engine.GetModel( f243_local0, "ref" )
		local f243_local2 = Engine.GetModel( f243_local0, "itemIndex" )
		if f243_local2 then
			local f243_local3 = Engine.GetModelValue( f243_local2 )
			local f243_local4 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f243_local3 )
			if #f243_local4 > 1 or #f243_local4 == 1 and CoD.CraftUtility.Gunsmith.AreMaxVariantSlotsUsed() then
				CoD.perController[f243_arg1].weaponIndexForVariant = f243_local3
				return true
			end
		end
	end
	return false
end

function IsBaseWeaponVariantIndex( f244_arg0, f244_arg1, f244_arg2 )
	local f244_local0 = f244_arg1:getModel( f244_arg2, "cacVariantIndex" )
	if f244_local0 then
		return Engine.GetModelValue( f244_local0 ) == 0
	else
		return false
	end
end

function IsCACSlotHasVariantName( f245_arg0 )
	local f245_local0 = f245_arg0:getModel()
	if f245_local0 then
		local f245_local1 = Engine.GetModel( f245_local0, "variantName" )
		if f245_local1 and Engine.GetModelValue( f245_local1 ) ~= "" then
			return true
		end
	end
	return false
end

function DoesWeaponVariantContainLockedItems( f246_arg0, f246_arg1, f246_arg2 )
	if IsProgressionEnabled( f246_arg2 ) and f246_arg1.weaponVariantInfo then
		return f246_arg1.weaponVariantInfo.hasLockedItems
	else
		return false
	end
end

function DoesWeaponVariantContainLockedAttachments( f247_arg0, f247_arg1, f247_arg2 )
	if IsProgressionEnabled( f247_arg2 ) and f247_arg1.weaponVariantInfo then
		return f247_arg1.weaponVariantInfo.hasLockedAttachments
	else
		return false
	end
end

local f0_local8 = function ( f248_arg0 )
	local f248_local0 = {}
	for f248_local4 in string.gmatch( f248_arg0, "[^,]+" ) do
		table.insert( f248_local0, tonumber( f248_local4 ) )
	end
	if #f248_local0 == 2 and f248_local0[1] < f248_local0[2] then
		return true
	else
		return false
	end
end

function IsCACWeaponAttributeIncrease( f249_arg0, f249_arg1, f249_arg2 )
	if f249_arg0:getModel( f249_arg1, f249_arg2 ) then
		return f0_local8( Engine.GetModelValue( f249_arg0:getModel( f249_arg1, f249_arg2 ) ) )
	else
		return false
	end
end

local f0_local9 = function ( f250_arg0, f250_arg1, f250_arg2 )
	local f250_local0
	if Engine.GetGunCurrentRank( f250_arg1, f250_arg0, f250_arg2 ) ~= Engine.GetGunNextRank( f250_arg1, f250_arg0, f250_arg2 ) or Engine.GetGunCurrentRankXP( f250_arg1, f250_arg0, f250_arg2 ) > CoD.CACUtility.GetCurrentWeaponXP( f250_arg1, f250_arg0, f250_arg2 ) then
		f250_local0 = false
	else
		f250_local0 = true
	end
	return f250_local0
end

function IsCACGunLevelMax( f251_arg0, f251_arg1, f251_arg2 )
	local f251_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f251_arg2, f251_arg1 )
	if f251_local0 == CoD.CACUtility.EmptyItemIndex then
		return false
	else
		return f0_local9( f251_local0, f251_arg2, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	end
end

function IsCACGunLevelExists( f252_arg0, f252_arg1, f252_arg2 )
	if not IsProgressionEnabled( f252_arg2 ) then
		return false
	else
		local f252_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f252_arg2, f252_arg1 )
		if Engine.IsCampaignGame() then
			local f252_local1 = CoD.GetAttachments( f252_local0 )
			if f252_local1 then
				f252_local1 = #CoD.GetAttachments( f252_local0 ) > 0
			end
			local f252_local2
			if f252_local0 ~= CoD.CACUtility.EmptyItemIndex then
				f252_local2 = f252_local1
			else
				f252_local2 = false
			end
			return f252_local2
		else
			return f252_local0 ~= CoD.CACUtility.EmptyItemIndex
		end
	end
end

function AllowWeaponPrestige( f253_arg0 )
	if IsLuaCodeVersionAtLeast( 9 ) then
		local f253_local0 = IsMultiplayer()
		local f253_local1 = IsProgressionEnabled( f253_arg0 )
	end
	return f253_local0 and f253_local1 or Dvar.ui_allowWeaponPrestige:get()
end

function CanPrestigeWeapon( f254_arg0, f254_arg1 )
	if not AllowWeaponPrestige( f254_arg1 ) then
		return false
	else
		local f254_local0 = f254_arg0:getModel()
		if f254_local0 then
			return f0_local9( f254_local1, f254_arg1, Engine.CurrentSessionMode() ) and f254_local2 and CoD.CACUtility.GetWeaponPLevel( f254_arg1, f254_local1 ) < CoD.CACUtility.maxWeaponPrestige
		else
			return false
		end
	end
end

function IsItemWeaponOptionNew( f255_arg0, f255_arg1 )
	if not IsProgressionEnabled( f255_arg1 ) then
		return false
	end
	local f255_local0 = CoD.perController[f255_arg1].classModel
	local f255_local1 = CoD.perController[f255_arg1].weaponCategory
	local f255_local2 = f255_arg0:getModel( f255_arg1, "weaponOptionSubIndex" )
	local f255_local3 = f255_arg0:getModel( f255_arg1, "weaponOptionType" )
	if f255_local2 and f255_local3 then
		local f255_local4 = Engine.GetModelValue( f255_local2 )
		local f255_local5 = Engine.GetModelValue( f255_local3 )
		if f255_local5 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and f255_local4 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsWeaponOptionNew( f255_arg1, Engine.GetModelValue( Engine.GetModel( f255_local0, f255_local1 .. ".itemIndex" ) ), Engine.GetWeaponOptionGroupIndex( f255_local4, f255_local5 ) )
		end
	end
	return false
end

function IsItemWeaponOptionEquipped( f256_arg0, f256_arg1 )
	local f256_local0 = CoD.perController[f256_arg1].classModel
	local f256_local1 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[f256_arg1].weaponCategory )
	local f256_local2 = f256_arg0:getModel( f256_arg1, "weaponOptionTypeName" )
	local f256_local3 = f256_arg0:getModel( f256_arg1, "weaponOptionSubIndex" )
	local f256_local4 = f256_arg0:getModel( f256_arg1, "weaponOptionType" )
	if f256_local2 and f256_local3 and f256_local4 then
		local f256_local5 = Engine.GetModelValue( f256_local2 )
		local f256_local6 = Engine.GetModelValue( f256_local3 )
		if Engine.GetModelValue( f256_local4 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			if CoD.CACUtility.GetItemEquippedInSlot( f256_local1 .. "paintjobIndex", f256_arg1, f256_local0 ) == Engine.GetModelValue( f256_arg0:getModel( f256_arg1, "paintjobIndex" ) ) and CoD.CACUtility.GetItemEquippedInSlot( f256_local1 .. "paintjobSlot", f256_arg1, f256_local0 ) == Engine.GetModelValue( f256_arg0:getModel( f256_arg1, "paintjobSlot" ) ) then
				return true
			end
		elseif CoD.CACUtility.GetItemEquippedInSlot( f256_local1 .. f256_local5, f256_arg1 ) == f256_local6 then
			return true
		end
	end
	return false
end

function IsItemWeaponOptionLocked( f257_arg0, f257_arg1, f257_arg2 )
	if not IsCACPersonalizationProgressionEnabled( f257_arg1, f257_arg2 ) then
		return false
	end
	local f257_local0 = CoD.perController[f257_arg2].classModel
	local f257_local1 = CoD.perController[f257_arg2].weaponCategory
	local f257_local2 = Engine.GetModel( f257_local0, f257_local1 .. ".itemIndex" )
	local f257_local3 = f257_arg1:getModel( f257_arg2, "weaponOptionSubIndex" )
	local f257_local4 = f257_arg1:getModel( f257_arg2, "weaponOptionType" )
	if f257_local2 and f257_local3 and f257_local4 then
		local f257_local5 = Engine.GetModelValue( f257_local2 )
		local f257_local6 = Engine.GetModelValue( f257_local3 )
		local f257_local7 = Engine.GetModelValue( f257_local4 )
		local f257_local8 = Engine.GetWeaponOptionGroupIndex( f257_local6, f257_local7 )
		if f257_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local f257_local9 = CoD.SafeGetModelValue( f257_local0, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f257_local1 ) .. ".itemIndex" )
			if not f257_local9 then
				return true
			end
			f257_local5 = Engine.GetItemAttachment( f257_local9, f257_local5 )
		end
		if (f257_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f257_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f257_local6 == 0 then
			return false
		elseif f257_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if f257_local6 == 0 then
				return false
			end
			local f257_local10 = Engine.GetAttachmentRef( f257_local5, f257_local6 )
			for f257_local14, f257_local15 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f257_local10 == f257_local15 then
					local f257_local13
					if CoD.CACUtility.GetWeaponPLevel( f257_arg2, f257_local5 ) < f257_local14 then
						f257_local13 = not Dvar.allItemsUnlocked:get()
					else
						f257_local13 = false
					end
					return f257_local13
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( f257_arg2, f257_local5, f257_local8 )
	end
	return false
end

function GetUnlockSessionMode( f258_arg0, f258_arg1 )
	local f258_local0 = Enum.eModes.MODE_COUNT
	if not f258_arg0 then
		return f258_local0
	end
	local f258_local1 = f258_arg0:getModel( f258_arg1, "unlockSessionMode" )
	if not f258_local1 then
		f258_local1 = f258_arg0:getModel( f258_arg1, "challengeInfo.unlockSessionMode" )
	end
	if not f258_local1 then
		return f258_local0
	end
	return Engine.GetModelValue( f258_local1 )
end

function ShouldHideItemWeaponOptionInGunsmith( f259_arg0, f259_arg1 )
	local f259_local0 = f259_arg0:getModel( f259_arg1, "weaponOptionSubIndex" )
	local f259_local1 = f259_arg0:getModel( f259_arg1, "weaponOptionType" )
	if not f259_local0 or not f259_local1 then
		return true
	else
		local f259_local2 = GetUnlockSessionMode( f259_arg0, f259_arg1 )
		if f259_local2 == Enum.eModes.MODE_COUNT then
			return true
		elseif not IsLive() and (f259_local2 == Enum.eModes.MODE_MULTIPLAYER or f259_local2 == Enum.eModes.MODE_ZOMBIES) then
			return true
		else
			local f259_local3 = Engine.GetModelValue( f259_local0 )
			local f259_local4 = Engine.GetModelValue( f259_local1 )
			if (f259_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f259_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f259_local3 == 0 then
				return true
			else
				return false
			end
		end
	end
end

function ShouldHideItemWeaponOption( f260_arg0, f260_arg1 )
	if not IsCACPersonalizationProgressionEnabled( f260_arg0, f260_arg1 ) then
		return true
	elseif CoD.SafeGetModelValue( f260_arg0:getModel(), "isChallengeClassified" ) == true then
		return true
	end
	local f260_local0 = f260_arg0:getModel( f260_arg1, "weaponOptionSubIndex" )
	local f260_local1 = f260_arg0:getModel( f260_arg1, "weaponOptionType" )
	if f260_local0 and f260_local1 then
		local f260_local2 = Engine.GetModelValue( f260_local0 )
		local f260_local3 = Engine.GetModelValue( f260_local1 )
		if (f260_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f260_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f260_local2 == 0 then
			return true
		elseif f260_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			return true
		end
	end
	return false
end

function IsWeaponPrestigeItem( f261_arg0, f261_arg1 )
	local f261_local0 = f261_arg0:getModel( f261_arg1, "weaponOptionType" )
	if f261_local0 and Engine.GetModelValue( f261_local0 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
		return true
	else
		return false
	end
end

function IsCACPersonalizationProgressionEnabled( f262_arg0, f262_arg1 )
	local f262_local0 = nil
	if f262_arg0 then
		local f262_local1 = f262_arg0:getModel( f262_arg1, "unlockSessionMode" )
		if not f262_local1 then
			f262_local1 = f262_arg0:getModel( f262_arg1, "challengeInfo.unlockSessionMode" )
		end
		if f262_local1 then
			f262_local0 = Engine.GetModelValue( f262_local1 )
		end
		if f262_local0 and f262_local0 >= Enum.eModes.MODE_FIRST and f262_local0 < Enum.eModes.MODE_COUNT and (not (f262_local0 ~= Enum.eModes.MODE_CAMPAIGN and (f262_local0 ~= Enum.eModes.MODE_MULTIPLAYER or not IsLive() or IsMultiplayer() and Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ))) or f262_local0 == Enum.eModes.MODE_ZOMBIES and IsLive()) then
			return true
		end
	end
	return false
end

function IsClassOptionDisabled( f263_arg0, f263_arg1, f263_arg2 )
	local f263_local0 = CoD.perController[f263_arg2].classModel
	local f263_local1 = f263_arg1:getModel()
	if f263_local0 and f263_local1 and f263_local0 == f263_local1 then
		f263_arg1.disabled = true
		return true
	else
		return false
	end
end

function IsCurrentItemClassified( f264_arg0, f264_arg1 )
	local f264_local0 = f264_arg0:getModel()
	if f264_local0 then
		local f264_local1 = Engine.GetModel( f264_local0, "isClassified" )
		if f264_local1 then
			return Engine.GetModelValue( f264_local1 )
		end
	end
	return false
end

function IsCurrentACVEquipped( f265_arg0, f265_arg1, f265_arg2 )
	local f265_local0 = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[f265_arg2].weaponCategory .. "cosmeticvariant", f265_arg2, f265_arg0:getModel() )
	local f265_local1 = f265_arg1:getModel( f265_arg2, "variantIndex" )
	if f265_local1 then
		return f265_local0 == Engine.GetModelValue( f265_local1 )
	else
		return false
	end
end

local f0_local10 = function ( f266_arg0, f266_arg1, f266_arg2, f266_arg3, f266_arg4 )
	return Engine.IsACVItemNew( f266_arg0, f266_arg1, f266_arg2, f266_arg3, f266_arg4 )
end

function IsCACACVItemNew( f267_arg0, f267_arg1 )
	if not IsProgressionEnabled( f267_arg1 ) then
		return false
	elseif CoD.SafeGetModelValue( f267_arg0:getModel(), "isBMClassified" ) == true then
		return false
	else
		local f267_local0 = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
		if f267_local0 and f267_arg0.attachmentRef and f267_arg0.variantIndex and f267_arg0.variantIndex > CoD.CACUtility.EmptyItemIndex then
			return f0_local10( f267_arg1, f267_local0, f267_arg0.attachmentRef, f267_arg0.variantIndex, Enum.eModes.MODE_MULTIPLAYER )
		else
			return false
		end
	end
end

function IsPC()
	return CoD.isPC
end

function IsOrbis()
	return CoD.isPS4
end

function IsDurango()
	return CoD.isDurango
end

function AmICarryingEnemyFlag( f271_arg0 )
	local f271_local0 = Engine.GetPlayerNameForClientNum( f271_arg0, Engine.GetPredictedClientNum( f271_arg0 ) )
	if f271_local0 == "" then
		return false
	end
	local f271_local1 = Engine.CreateModel( Engine.GetModelForController( f271_arg0 ), "CTF.enemyFlagCarrier" )
	local f271_local2
	if f271_local1 == nil or f271_local0 ~= Engine.GetModelValue( f271_local1 ) then
		f271_local2 = false
	else
		f271_local2 = true
	end
	return f271_local2
end

function IsFriendlyFlagHeld( f272_arg0 )
	local f272_local0 = Engine.CreateModel( Engine.GetModelForController( f272_arg0 ), "CTF.friendlyFlagCarrier" )
	if f272_local0 then
		f272_local0 = Engine.GetModel( f272_local0, "friendlyFlagCarrier" )
	end
	if event.friendlyCarrier then
		local f272_local1 = Engine.CreateModel( Engine.GetModelForController( f272_arg0 ), "CTF" )
		if f272_local1 then
			f272_local1 = Engine.GetModel( f272_local1, "enemyFlagCarrier" )
		end
		return true
	else
		return false
	end
end

function AmICarryingBomb( f273_arg0 )
	if CoD.SafeGetModelValue( Engine.GetModelForController( f273_arg0 ), "Demolition.defending" ) == false then
		return true
	else
		return IsModelValueEqualTo( f273_arg0, "hudItems.SDBombClient", Engine.GetPredictedClientNum( f273_arg0 ) )
	end
end

function HasNetworkConnection()
	return Engine.CheckNetConnection() == true
end

function IsPlayerSignedInToLive( f275_arg0 )
	return Engine.IsSignedInToLive( f275_arg0 ) == true
end

function IsPlusAuthorized( f276_arg0 )
	return Engine.IsPlusAuthorized( f276_arg0 ) == true
end

function IsPlayerConnectedToCodServers( f277_arg0 )
	return Engine.IsDemonwareFetchingDone( f277_arg0 ) == true
end

function ShouldHideOfflineNetworkPrompt( f278_arg0 )
	if IsLive() then
		return true
	elseif ShouldShowOfflineNormalMessage( f278_arg0 ) or ShouldShowOfflineVoluntaryMessage( f278_arg0 ) then
		return true
	elseif PlayGoIsStillDownloading( f278_arg0 ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNormalMessage( f279_arg0 )
	if not IsLive() then
		if not Engine.IsPlusAuthorized( f279_arg0 ) then
			return true
		elseif not Engine.IsSignedInToLive( f279_arg0 ) then
			return true
		end
	end
	return false
end

function ShouldShowOfflineVoluntaryMessage( f280_arg0 )
	if not IsLive() and Engine.IsPlusAuthorized( f280_arg0 ) and Engine.IsSignedInToLive( f280_arg0 ) and IsPlayerConnectedToCodServers( f280_arg0 ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNetworkErrorMessage( f281_arg0 )
	return not ShouldHideOfflineNetworkPrompt( f281_arg0 )
end

function IsLobbyLocked()
	return LuaUtils.LobbyIsLocked()
end

function IsPlayerJoinable( f283_arg0 )
	local f283_local0 = nil
	if f283_arg0.activeWidget ~= nil then
		f283_local0 = f283_arg0.activeWidget:getModel()
	else
		f283_local0 = f283_arg0:getModel()
	end
	if f283_local0 then
		f283_local0 = Engine.GetModel( f283_local0, "isJoinable" )
	end
	local f283_local1
	if not f283_local0 or Engine.GetModelValue( f283_local0 ) ~= 1 then
		f283_local1 = false
	else
		f283_local1 = true
	end
	return f283_local1
end

function IsSystemLinkLobby()
	return Engine.GetLobbyNetworkMode() == CoD.LOBBY.MODE_LAN
end

function ShouldLobbyListBeUp()
	local f285_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f285_local1
	if f285_local0 == LobbyData.UITargets.UI_MODESELECT.id or f285_local0 == LobbyData.UITargets.UI_MPLOBBYMAIN.id then
		f285_local1 = false
	else
		f285_local1 = true
	end
	return f285_local1
end

function ShouldShowQuickJoin()
	if IsLobbyNetworkModeLAN() then
		return false
	else
		return false
	end
end

function ShowHeaderKicker( f287_arg0 )
	return f287_arg0.showHeaderKicker == true
end

function ShowHeaderIcon( f288_arg0 )
	return f288_arg0.showHeaderIcon == true
end

function IsMP()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return true
	else
		return false
	end
end

function IsCP()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return true
	else
		return false
	end
end

function IsZM()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return true
	else
		return false
	end
end

function IsCPMapVoteHidden( f292_arg0 )
	if not IsCampaign() then
		return false
	else
		local f292_local0 = LobbyData.GetLobbyNav()
		if f292_local0 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f292_local0 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f292_local0 == LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id or f292_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f292_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f292_local0 == LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
			return false
		else
			return not Engine.IsCPInProgress()
		end
	end
end

function IsMPMapVoteHidden( f293_arg0 )
	if not IsMultiplayer() then
		return false
	else
		return false
	end
end

function IsZMMapVoteHidden( f294_arg0 )
	if not IsZombies() then
		return false
	elseif LobbyData.GetLobbyNav() == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		return true
	else
		return false
	end
end

function IsMainModeInvalid()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		return true
	else
		return false
	end
end

function IsMainModeInvalidAndNotTheaterMode()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID and not Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		return true
	else
		return false
	end
end

function IsLive()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ) ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return true
	else
		return false
	end
end

function IsLAN()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ) ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return true
	else
		return false
	end
end

function IsLocal()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ) ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL then
		return true
	else
		return false
	end
end

function IsCustomLobby()
	local f300_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f300_local1
	if f300_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f300_local0 ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f300_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f300_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		f300_local1 = false
	else
		f300_local1 = true
	end
	return f300_local1
end

function IsPublicLobby()
	local f301_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f301_local1
	if f301_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id and f301_local0 ~= LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id and f301_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f301_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f301_local1 = false
	else
		f301_local1 = true
	end
	return f301_local1
end

function IsGameLobby()
	local f302_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f302_local0 then
		local f302_local1 = LobbyData:UITargetFromId( f302_local0 )
		return f302_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME
	else
		
	end
end

function ShouldShowCompetitiveSettingsSummary()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) ) == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id
end

function IsLobbyMode( f304_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue then
		local f304_local1 = LobbyData:UITargetFromId( modelValue )
		return f304_local1.lobbyMode == f304_arg0
	else
		
	end
end

function IsLobbyAdvertised()
	local f305_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f305_local0 then
		local f305_local1 = LobbyData:UITargetFromId( f305_local0 )
		return f305_local1.isAdvertised
	else
		return false
	end
end

function IsGameLobbyActive()
	return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
end

function IsLobbyNetworkModeLAN()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
end

function IsLobbyNetworkModeLive()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
end

function IsLobbyHost()
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	elseif Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	else
		return false
	end
end

function IsLobbyPrivateHost()
	return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
end

function IsLobbyGameHost()
	return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ShouldShowPlaylistName()
	local f312_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f312_local1
	if f312_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f312_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id and f312_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f312_local1 = false
	else
		f312_local1 = true
	end
	return f312_local1
end

function IsLobbyWithTeamAssignment()
	local f313_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f313_local1
	if f313_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f313_local0 ~= LobbyData.UITargets.UI_MPLOBBYLANGAME.id then
		f313_local1 = false
	else
		f313_local1 = true
	end
	return f313_local1
end

function IsTeamAssignment( f314_arg0 )
	return Engine.GetGametypeSetting( "teamAssignment" ) == f314_arg0
end

function IsAddControllerTextItem( f315_arg0 )
	return f315_arg0.isAddControllerTextItem
end

function IsPlayerCountItem( f316_arg0 )
	return f316_arg0.isPlayerCountItem
end

function IsSelfItem( f317_arg0, f317_arg1 )
	local f317_local0 = f317_arg0:getModel( f317_arg1, "isLocal" )
	if f317_local0 ~= nil then
		return Engine.GetModelValue( f317_local0 ) == 1
	else
		return f317_arg0.isSelfItem
	end
end

function IsParentPartyMemberItem( f318_arg0, f318_arg1 )
	local f318_local0 = f318_arg0:getModel( f318_arg1, "isMember" )
	if f318_local0 ~= nil then
		return Engine.GetModelValue( f318_local0 ) == 1
	else
		local f318_local1
		if f318_arg0:getParent() ~= nil then
			f318_local1 = f318_arg0:getParent()
			f318_local1 = f318_local1.isPartyMemberItem
		else
			f318_local1 = false
		end
	end
	return f318_local1
end

function IsPartyMemberItem( f319_arg0, f319_arg1 )
	local f319_local0 = f319_arg0:getModel( f319_arg1, "isMember" )
	if f319_local0 ~= nil then
		return Engine.GetModelValue( f319_local0 ) == 1
	else
		return f319_arg0.isPartyMemberItem
	end
end

function IsFriendItem( f320_arg0 )
	return f320_arg0.isFriendItem
end

function IsGroupsItem( f321_arg0 )
	return f321_arg0.isGroupsItem
end

function IsMorePlayingItem( f322_arg0 )
	return f322_arg0.isMorePlaying
end

function ShouldPlayLobbyFadeAnim( f323_arg0, f323_arg1 )
	return f323_arg0.previousMenuName and f323_local1 or f323_arg0.previousMenuName == "ModeSelect"
end

function ShouldShowAddController( f324_arg0, f324_arg1, f324_arg2 )
	return CoD.LobbyBase.SplitscreenControllersAllowed()
end

function ShouldDisableEditCodCasterSettingsButton( f325_arg0 )
	return false
end

function ShouldShowEditCodCasterSettingsButton( f326_arg0 )
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		return true
	else
		return false
	end
end

function IsLANServerBrowserEmpty()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" ), "count" ) ) == 0 then
		return true
	else
		return false
	end
end

function LANServerBrowserCheckFilterTest( f328_arg0, f328_arg1 )
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	elseif f328_arg0.currentFilter == f328_arg1 then
		return true
	elseif not f328_arg0.currentFilter and f328_arg1 == "all" then
		return true
	else
		return false
	end
end

function LobbyHas4PlayersOrLess()
	local f329_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f329_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	return f329_local0 <= 4
end

function PlayerListCountIsAtLeast1()
	return Engine.PartyGetPlayerCount() >= 1
end

function PlayerListCountIsAtLeast2()
	return Engine.PartyGetPlayerCount() >= 2
end

function PlayerListCountIsAtLeast3()
	return Engine.PartyGetPlayerCount() >= 3
end

function PlayerListCountIsAtLeast4()
	return Engine.PartyGetPlayerCount() >= 4
end

function PregameActive()
	return Engine.GetLobbyPregameState() ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE
end

function CharacterDraftActive()
	return Engine.GetLobbyPregameState() == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT
end

function ItemRestrictionVoteActive()
	return Engine.GetLobbyPregameState() == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE
end

function ItemRestrictionCACEditActive()
	return Engine.GetLobbyPregameState() == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT
end

function ItemRestrictionScorestreakEditActive()
	return Engine.GetLobbyPregameState() == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT
end

function PregameStateEqualToEnum( f339_arg0 )
	return Engine.GetLobbyPregameState() == f339_arg0
end

function CharacterLoadoutDrafted( f340_arg0, f340_arg1, f340_arg2 )
	if not CharacterDraftActive() then
		return false
	else
		local f340_local0 = f340_arg1:getModel()
		if f340_local0 then
			return Engine.CharacterLoadoutDrafted( Engine.GetModelValue( Engine.GetModel( f340_local0, "itemIndex" ) ), Engine.GetTeamForXUID( Engine.GetXUID64( f340_arg2 ) ) )
		else
			return false
		end
	end
end

function ItemIsBanned( f341_arg0, f341_arg1, f341_arg2 )
	local f341_local0 = CoD.CACUtility.GetItemInfoFromElement( f341_arg2, f341_arg1 )
	if f341_local0 then
		if CoD.CACUtility.ItemSlotBannedByBonuscard( f341_local0.loadoutSlot, f341_local0.itemIndex ) then
			return true
		elseif CoD.CACUtility.ItemSlotBannedByBonuscard( f341_local0.weaponSlot, f341_local0.itemIndex ) then
			return true
		elseif f341_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM or f341_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemVote( f341_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.IsItemIndexRestricted( f341_local0.itemIndex, false ) then
				return true
			end
		end
		if (f341_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT or f341_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetAttachmentVote( f341_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif f341_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemAttachmentVote( f341_local0.itemIndex, f341_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.GetAttachmentRestrictionState( f341_local0.attachmentIndex, f341_local0.itemIndex, false ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
				return true
			end
		end
		if f341_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f341_local0.itemGroup, f341_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		end
	end
	return false
end

function ItemIsProtected( f342_arg0, f342_arg1, f342_arg2 )
	local f342_local0 = CoD.CACUtility.GetItemInfoFromElement( f342_arg2, f342_arg1 )
	if f342_local0 then
		if f342_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			return Engine.GetItemVote( f342_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f342_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			return Engine.GetAttachmentVote( f342_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f342_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( f342_local0.itemIndex, f342_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f342_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f342_local0.itemGroup, f342_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		end
	end
	return false
end

function ItemIsInRestrictionState( f343_arg0, f343_arg1, f343_arg2, f343_arg3 )
	local f343_local0 = CoD.CACUtility.GetItemInfoFromElement( f343_arg2, f343_arg1 )
	if f343_local0 then
		return f343_local0.restrictionState == f343_arg3
	else
		return false
	end
end

function ClassContainsRestrictedItems( f344_arg0, f344_arg1, f344_arg2 )
	local f344_local0 = f344_arg1:getModel( f344_arg2, "classNum" )
	if f344_local0 then
		return CoD.CACUtility.ClassContainsRestrictedItems( f344_arg2, Engine.GetModelValue( f344_local0 ) )
	else
		return false
	end
end

function AnyClassContainsRestrictedItems( f345_arg0, f345_arg1, f345_arg2 )
	return CoD.CACUtility.AnyClassContainsRestrictedItems( f345_arg2 )
end

function AnyEquippedScorestreaksBanned( f346_arg0, f346_arg1, f346_arg2 )
	return CoD.CACUtility.AnyEquippedScorestreaksBanned( f346_arg2 )
end

function AnyCACContentBanned( f347_arg0, f347_arg1, f347_arg2 )
	return CoD.CACUtility.AnyCACItemsBanned()
end

function AnyScorestreaksBanned( f348_arg0, f348_arg1, f348_arg2 )
	return CoD.CACUtility.AnyStreaksBanned()
end

function CanAffordRaidPurchase( f349_arg0, f349_arg1, f349_arg2 )
	return Engine.GetModelValue( f349_arg1:getModel( f349_arg2, "cost" ) ) <= Engine.GetModelValue( f349_arg0:getModel( f349_arg2, "bank" ) )
end

function RaidPurchaseItemDisabled( f350_arg0, f350_arg1, f350_arg2 )
	return f350_arg0:getModel( f350_arg2, "disable_" .. Engine.GetModelValue( f350_arg1:getModel( f350_arg2, "id" ) ) ) ~= nil
end

function RaidPurchaseAllowedForParent( f351_arg0, f351_arg1, f351_arg2 )
	return CanAffordRaidPurchase( f351_arg0, f351_arg1:getParent(), f351_arg2 ) and not RaidPurchaseItemDisabled( f351_arg0, f351_arg1:getParent(), f351_arg2 )
end

function RaidPurchaseAllowed( f352_arg0, f352_arg1, f352_arg2 )
	return CanAffordRaidPurchase( f352_arg0, f352_arg1, f352_arg2 ) and not RaidPurchaseItemDisabled( f352_arg0, f352_arg1, f352_arg2 )
end

function IsStoreAvailable()
	local f353_local0
	if not CoD.isZombie then
		f353_local0 = Engine.IsFFOTDFetched()
	else
		f353_local0 = false
	end
	return f353_local0
end

function IsPlayerDead( f354_arg0, f354_arg1 )
	local f354_local0 = f354_arg0:getModel( f354_arg1, "clientNum" )
	if f354_local0 then
		return Engine.IsPlayerDead( f354_arg1, Engine.GetModelValue( f354_local0 ) )
	else
		return false
	end
end

function IsPlayerInLastStand( f355_arg0, f355_arg1 )
	local f355_local0 = f355_arg0:getParent()
	local f355_local1 = f355_local0 and f355_local0:getModel( f355_arg1, "clientNum" )
	if f355_local1 then
		return Engine.IsPlayerInLastStand( f355_arg1, Engine.GetModelValue( f355_local1 ) )
	else
		return false
	end
end

function PlayerListCountIs1( f356_arg0 )
	return DataSources.PlayerList.getCount( f356_arg0.playerScores ) <= 1
end

function PlayerListCountIs2( f357_arg0 )
	return DataSources.PlayerList.getCount( f357_arg0.playerScores ) == 2
end

function PlayerListCountIs3( f358_arg0 )
	return DataSources.PlayerList.getCount( f358_arg0.playerScores ) == 3
end

function PlayerListCountIs4( f359_arg0 )
	return DataSources.PlayerList.getCount( f359_arg0.playerScores ) >= 4
end

function PlayerHasAnObjective( f360_arg0, f360_arg1 )
	local f360_local0 = f360_arg0:getParent()
	f360_local0 = f360_local0:getModel( f360_arg1, "objectiveIcon" )
	if f360_local0 then
		return Engine.GetModelValue( f360_local0 ) ~= ""
	else
		return false
	end
end

function IsSplitscreenPlayAvailable()
	if IsTu1Build() == true and Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		return CoD.LobbyBase.SplitscreenPlayAvailable()
	end
end

function IsSplitscreenLobbyRoomAvailable()
	return CoD.LobbyBase.SplitscreenLobbyRoomAvailable()
end

function IsSplitscreenPlayerSignedIn()
	return Engine.GetUsedControllerCount() > 1
end

function IsThereRoomForAnotherSplitscreenPlayer()
	return Engine.GetUsedControllerCount() < Dvar.lobby_maxLocalPlayers:get()
end

function IsWaitingForSignInToPlaySplitscreen()
	return Engine.GetNonUsedControllerCount() > 0
end

function IsWaitingForAdditionalControllerToPlaySplitscreen()
	local f366_local0
	if not IsWaitingForSignInToPlaySplitscreen() then
		f366_local0 = IsThereRoomForAnotherSplitscreenPlayer()
	else
		f366_local0 = false
	end
	return f366_local0
end

function IsSplitscreenAndInGame( f367_arg0 )
	return Engine.IsSplitscreen()
end

function GamepadsConnectedAny()
	return Engine.GamepadsConnectedCount() > 0
end

function GamepadsConnectedIsActive( f369_arg0 )
	return CoD.useController and Engine.GamepadsConnectedIsActive( f369_arg0 )
end

function HasPerksInAnySlot( f370_arg0 )
	local f370_local0 = Engine.GetModelForController( f370_arg0 )
	local f370_local1 = Engine.GetModelValue( Engine.CreateModel( f370_local0, "perks.perk0_count" ) )
	if f370_local1 ~= nil and f370_local1 > 0 then
		return true
	else
		f370_local1 = Engine.GetModelValue( Engine.CreateModel( f370_local0, "perks.perk1_count" ) )
		if f370_local1 ~= nil and f370_local1 > 0 then
			return true
		else
			f370_local1 = Engine.GetModelValue( Engine.CreateModel( f370_local0, "perks.perk2_count" ) )
			if f370_local1 ~= nil and f370_local1 > 0 then
				return true
			else
				return false
			end
		end
	end
end

function HasPerksInSlot0( f371_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f371_arg0 ), "perks.perk0_count" ) )
	local f371_local1
	if modelValue == nil or modelValue <= 0 then
		f371_local1 = false
	else
		f371_local1 = true
	end
	return f371_local1
end

function HasOnePerkInSlot0( f372_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f372_arg0 ), "perks.perk0_count" ) )
	local f372_local1
	if modelValue == nil or modelValue ~= 1 then
		f372_local1 = false
	else
		f372_local1 = true
	end
	return f372_local1
end

function HasTwoPerksInSlot0( f373_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f373_arg0 ), "perks.perk0_count" ) )
	local f373_local1
	if modelValue == nil or modelValue ~= 2 then
		f373_local1 = false
	else
		f373_local1 = true
	end
	return f373_local1
end

function HasPerksInSlot1( f374_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f374_arg0 ), "perks.perk1_count" ) )
	local f374_local1
	if modelValue == nil or modelValue <= 0 then
		f374_local1 = false
	else
		f374_local1 = true
	end
	return f374_local1
end

function HasOnePerkInSlot1( f375_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f375_arg0 ), "perks.perk1_count" ) )
	local f375_local1
	if modelValue == nil or modelValue ~= 1 then
		f375_local1 = false
	else
		f375_local1 = true
	end
	return f375_local1
end

function HasTwoPerksInSlot1( f376_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f376_arg0 ), "perks.perk1_count" ) )
	local f376_local1
	if modelValue == nil or modelValue ~= 2 then
		f376_local1 = false
	else
		f376_local1 = true
	end
	return f376_local1
end

function HasPerksInSlot2( f377_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f377_arg0 ), "perks.perk2_count" ) )
	local f377_local1
	if modelValue == nil or modelValue <= 0 then
		f377_local1 = false
	else
		f377_local1 = true
	end
	return f377_local1
end

function HasOnePerkInSlot2( f378_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f378_arg0 ), "perks.perk2_count" ) )
	local f378_local1
	if modelValue == nil or modelValue ~= 1 then
		f378_local1 = false
	else
		f378_local1 = true
	end
	return f378_local1
end

function HasTwoPerksInSlot2( f379_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f379_arg0 ), "perks.perk2_count" ) )
	local f379_local1
	if modelValue == nil or modelValue ~= 2 then
		f379_local1 = false
	else
		f379_local1 = true
	end
	return f379_local1
end

function IsGameTypeEqualToString( f380_arg0 )
	local f380_local0 = Engine.DvarString( nil, "g_gametype" )
	local f380_local1
	if f380_local0 == nil or f380_local0 ~= f380_arg0 then
		f380_local1 = false
	else
		f380_local1 = true
	end
	return f380_local1
end

function IsTeamBasedGame( f381_arg0 )
	if IsInGame() then
		return CoDShared.IsGametypeTeamBased()
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType() )
	end
end

function HasMoreThanNPlayersOnATeam( f382_arg0 )
	local f382_local0 = tonumber( f382_arg0 )
	local f382_local1 = Engine.GetTeams()
	local f382_local2 = {}
	for f382_local6, f382_local7 in pairs( f382_local1.clientTeams ) do
		if not f382_local2[f382_local7.team] then
			f382_local2[f382_local7.team] = {}
		end
		table.insert( f382_local2[f382_local7.team], f382_local7 )
	end
	if IsTeamBasedGame( nil ) then
		if f382_local2[Enum.team_t.TEAM_ALLIES] and f382_local0 < #f382_local2[Enum.team_t.TEAM_ALLIES] then
			return true
		elseif f382_local2[Enum.team_t.TEAM_AXIS] and f382_local0 < #f382_local2[Enum.team_t.TEAM_AXIS] then
			return true
		end
	elseif f382_local2[Enum.team_t.TEAM_FREE] and f382_local0 < #f382_local2[Enum.team_t.TEAM_FREE] then
		return true
	end
	return false
end

function CanSwitchTeams()
	local f383_local0 = Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO
	local f383_local1 = Engine.GetUsedControllerCount() > 1
	local f383_local2
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		f383_local2 = not f383_local1
	else
		f383_local2 = false
	end
	if CoDShared.IsGametypeTeamBased() and not f383_local0 then
		return true
	elseif f383_local2 then
		return true
	else
		return false
	end
end

function IsSpectatingInvalidPlayer( f384_arg0 )
	if Engine.IsVisibilityBitSet( f384_arg0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f384_arg0 ), "deadSpectator.playerIndex" ) == Engine.GetClientNum( f384_arg0 )
	end
end

function IsPublicOrLeagueGame( f385_arg0 )
	local f385_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )
	if not f385_local0 then
		f385_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	end
	return f385_local0
end

function IsBombBasedGameMode()
	local f386_local0 = Engine.DvarString( nil, "g_gametype" )
	local f386_local1
	if f386_local0 == nil or f386_local0 ~= "sd" and f386_local0 ~= "sr" and f386_local0 ~= "dem" then
		f386_local1 = false
	else
		f386_local1 = true
	end
	return f386_local1
end

function IsGametypeSettingsValue( f387_arg0, f387_arg1 )
	return Engine.GetGametypeSetting( f387_arg0 ) == f387_arg1
end

function CustomClassesEnabled()
	return Engine.GetGametypeSetting( "disableCAC" ) == 0
end

function IsGametypeTeambased()
	return CoDShared.IsGametypeTeamBased()
end

function IsGametypeItemSettingDefault( f390_arg0 )
	local f390_local0 = f390_arg0:getModel()
	local f390_local1 = f390_arg0:getParent()
	if f390_local0 then
		local f390_local2 = Engine.GetModel( f390_local0, "itemIndex" )
		local f390_local3 = Engine.GetModel( f390_local0, "attachmentIndex" )
		local f390_local4 = Engine.GetModel( f390_local0, "weaponIndex" )
		local f390_local5 = Engine.GetModel( f390_local0, "setting" )
		local f390_local6 = Engine.GetModel( f390_local0, "tabWidget" )
		local f390_local7 = Engine.GetModel( f390_local0, "weaponGroups" )
		local f390_local8, f390_local9 = nil
		if f390_local2 then
			local f390_local10 = Engine.GetModelValue( f390_local2 )
			return Engine.GetItemRestrictionState( f390_local10 ) == Engine.GetItemRestrictionState( f390_local10, true )
		elseif f390_local5 then
			local f390_local10 = Engine.GetModelValue( f390_local5 )
			return Engine.GetGametypeSetting( f390_local10 ) == Engine.GetGametypeSetting( f390_local10, true )
		elseif f390_local3 and f390_local4 then
			local f390_local10 = Engine.GetModelValue( f390_local3 )
			local f390_local11 = Engine.GetModelValue( f390_local4 )
			return Engine.GetAttachmentRestrictionState( f390_local10, f390_local11, false ) == Engine.GetAttachmentRestrictionState( f390_local10, f390_local11, true )
		elseif f390_local3 and not f390_local7 then
			return not Engine.AttachmentRestrictionStateChangedForAnyWeapon( Engine.GetModelValue( f390_local3 ) )
		elseif f390_arg0:getParent() and f390_local6 then
			local f390_local10 = Engine.GetModelValue( f390_local6 )
			if f390_local10 then
				local f390_local11 = f390_local10
				if LUI.startswith( f390_local11, "CoD." ) then
					f390_local11 = string.sub( f390_local10, 5 )
				end
				return CoD.GameSettingsUtility.UpdateBreadCrumbNodes( f390_local11 )
			end
		elseif f390_arg0:getParent() then
			local f390_local10 = f390_arg0:getParent()
			local f390_local11 = f390_local10.actionParam
			if f390_local11 then
				for f390_local15, f390_local16 in pairs( f390_local11 ) do
					if CoD.GameSettingsUtility[f390_local16] and not CoD.GameSettingsUtility.UpdateBreadCrumbNodes( f390_local16 ) then
						return false
					end
				end
			end
		end
	end
	return true
end

function IsGametypeItemSettingDefaultNew( f391_arg0, f391_arg1 )
	if f391_arg0[f391_arg1] == nil then
		return false
	end
	local f391_local0 = f391_arg0[f391_arg1]
	if f391_local0 then
		local f391_local1 = f391_local0.activeWidget
		if f391_local1 and f391_local1.showChangeIndicator then
			return not f391_local1:showChangeIndicator( f391_local0, f391_arg0 )
		end
	end
	return IsGametypeItemSettingDefault( f391_arg0 )
end

function ShouldBootUpHUD( f392_arg0 )
	if not Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
		return false
	else
		return not f392_arg0.hasBooted
	end
end

function OverheatWeaponVisible( f393_arg0 )
	local f393_local0 = Engine.GetModel( Engine.GetModelForController( f393_arg0 ), "hudItems" )
	if f393_local0 and Engine.GetModelValue( Engine.CreateModel( f393_local0, "overheatWeaponVisible" ) ) then
		return true
	else
		
	end
end

function IsWeaponClipGreaterThanOrEqualTo( f394_arg0, f394_arg1 )
	local f394_local0 = Engine.GetModel( Engine.GetModelForController( f394_arg0 ), "currentWeapon.clipMaxAmmo" )
	if f394_local0 == nil then
		return false
	else
		local f394_local1 = Engine.GetModelValue( f394_local0 )
		if f394_local1 == nil then
			return false
		else
			return f394_arg1 <= f394_local1
		end
	end
end

function WeaponUsesAmmo( f395_arg0 )
	local f395_local0 = Engine.GetModel( Engine.GetModelForController( f395_arg0 ), "currentWeapon.weapon" )
	if f395_local0 == nil then
		return false
	end
	local f395_local1 = Engine.GetModelValue( f395_local0 )
	if f395_local1 == nil then
		return false
	else
		local f395_local2
		if not Engine.IsWeaponType( f395_local1, "melee" ) and not Engine.IsWeaponType( f395_local1, "riotshield" ) then
			f395_local2 = not Engine.IsWeaponType( f395_local1, "grenade" )
		else
			f395_local2 = false
		end
	end
	return f395_local2
end

function WeaponHasAmmo( f396_arg0 )
	local f396_local0 = Engine.GetModelForController( f396_arg0 )
	local f396_local1 = Engine.GetModel( f396_local0, "currentWeapon.ammoStock" )
	local f396_local2 = Engine.GetModel( f396_local0, "currentWeapon.ammoInClip" )
	if f396_local1 == nil or f396_local2 == nil then
		return false
	else
		local f396_local3 = Engine.GetModelValue( f396_local1 )
		local f396_local4 = Engine.GetModelValue( f396_local2 )
		if f396_local3 == nil or f396_local4 == nil then
			return false
		else
			return f396_local3 + f396_local4 > 0
		end
	end
end

function IsInPrematchPeriod()
	return Engine.CurrentGameTime() < Engine.GetGametypeSetting( "prematchperiod" ) * 1000
end

function IsLowAmmoClip( f398_arg0 )
	local f398_local0 = Engine.IsAmmoClipLow( f398_arg0 )
	if f398_local0 then
		return f398_local0
	else
		return false
	end
end

function IsLowAmmoDWClip( f399_arg0 )
	local f399_local0 = Engine.IsDWAmmoClipLow( f399_arg0 )
	if f399_local0 then
		return f399_local0
	else
		return false
	end
end

function IsHeroWeaponGadgetCurrentWeapon( f400_arg0, f400_arg1 )
	local f400_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f400_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if not IsModelValueTrue( f400_arg1, "playerAbilities.playerGadget3.isInUse" ) then
		return false
	elseif Engine.isValidGadgetSlot( f400_local0 ) and Engine.IsGadgetCurrentWeapon( f400_arg1, f400_local0 ) then
		f400_arg0.wasHeroWeaponActivated = true
		return true
	else
		return false
	end
end

function IsHeroWeaponInUse( f401_arg0, f401_arg1 )
	local f401_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f401_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f401_local0 ) then
		if not (not Engine.IsGadgetCurrentWeapon( f401_arg1, f401_local0 ) or not IsModelValueGreaterThan( f401_arg1, "playerAbilities.playerGadget3.powerRatio", 0 )) or IsModelValueTrue( f401_arg1, "playerAbilities.playerGadget3.isInUse" ) then
			f401_arg0.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	else
		return false
	end
end

function IsHeroWeaponOrGadgetInUse( f402_arg0, f402_arg1 )
	if IsHeroWeaponInUse( f402_arg0, f402_arg1 ) then
		return true
	elseif not Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f402_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) ) then
		return false
	else
		return IsModelValueTrue( f402_arg1, "playerAbilities.playerGadget3.isInUse" )
	end
end

function IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( f403_arg0, f403_arg1 )
	if IsHeroWeaponOrGadgetInUse( f403_arg0, f403_arg1 ) then
		return true
	else
		local f403_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f403_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
		if Engine.isValidGadgetSlot( f403_local0 ) and Engine.IsGadgetContextualWeaponActive( f403_arg1, f403_local0 ) then
			f403_arg0.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	end
end

function IsHeroGadgetInUse( f404_arg0, f404_arg1 )
	return IsModelValueTrue( f404_arg1, "playerAbilities.playerGadget3.isInUse" )
end

function IsHeroWeaponSpeedBurst( f405_arg0, f405_arg1 )
	return IsModelValueEqualTo( f405_arg1, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_SPEED_BURST" )
end

function HasPerk( f406_arg0, f406_arg1 )
	return IsModelValueEqualTo( f406_arg0, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_COMBAT_EFFICIENCY" ) and IsModelValueEqualTo( f406_arg0, "playerAbilities.playerGadget3.isInUse", true )
end

function IsHeroWeaponOrGadgetEnergyAtLeast( f407_arg0, f407_arg1 )
	local f407_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f407_arg0 ), "playerAbilities.playerGadget3.powerRatio" ) )
	if f407_local0 == nil then
		return false
	else
		return f407_arg1 <= f407_local0
	end
end

function IsCurrentWeaponReference( f408_arg0, f408_arg1 )
	local f408_local0 = f408_arg1 .. "_" .. CoD.gameMode:lower()
	local f408_local1 = Engine.GetModel( Engine.GetModelForController( f408_arg0 ), "currentWeapon.equippedWeaponReference" )
	local f408_local2 = f408_local1 and Engine.GetModelValue( f408_local1 )
	local f408_local3
	if f408_local2 == nil or f408_local2 ~= f408_local0 then
		f408_local3 = false
	else
		f408_local3 = true
	end
	return f408_local3
end

function IsCurrentViewmodelWeaponName( f409_arg0, f409_arg1 )
	local f409_local0 = f409_arg1 .. "_" .. CoD.gameMode:lower()
	local f409_local1 = Engine.GetModel( Engine.GetModelForController( f409_arg0 ), "currentWeapon.viewmodelWeaponName" )
	local f409_local2 = f409_local1 and Engine.GetModelValue( f409_local1 )
	local f409_local3
	if f409_local2 == nil or f409_local2 ~= f409_local0 then
		f409_local3 = false
	else
		f409_local3 = true
	end
	return f409_local3
end

function IsHeroWeaponGadgetAmmoEmpty( f410_arg0, f410_arg1 )
	local f410_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f410_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	local f410_local1 = Engine.getHeldGadgetSlotForLoadoutGadget( f410_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if not (f410_local0 == -1 or not Engine.isValidGadgetSlot( f410_local0 )) or f410_local1 ~= -1 and Engine.isValidGadgetSlot( f410_local1 ) then
		local f410_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f410_arg1 ), "playerAbilities.playerGadget3.ammo" ) )
		if f410_local2 == nil or f410_local2 < 1 then
			f410_arg0.wasHeroWeaponActivated = false
			return true
		end
	end
	return false
end

function IsPrimaryOffhandGadgetAmmoBased( f411_arg0 )
	local f411_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f411_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f411_local0 ) then
		return Engine.IsAmmoBasedGadget( f411_arg0, f411_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetAmmoBased( f412_arg0 )
	local f412_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f412_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f412_local0 ) then
		return Engine.IsAmmoBasedGadget( f412_arg0, f412_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetAmmoBased( f413_arg0 )
	local f413_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f413_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f413_local0 ) then
		return Engine.IsAmmoBasedGadget( f413_arg0, f413_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetAmmoBased( f414_arg0 )
	local f414_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f414_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f414_local0 ) then
		return Engine.IsAmmoBasedGadget( f414_arg0, f414_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetPowerBased( f415_arg0 )
	local f415_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f415_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f415_local0 ) then
		return Engine.IsPowerBasedGadget( f415_arg0, f415_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetPowerBased( f416_arg0 )
	local f416_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f416_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f416_local0 ) then
		return Engine.IsPowerBasedGadget( f416_arg0, f416_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetPowerBased( f417_arg0 )
	local f417_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f417_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f417_local0 ) then
		return Engine.IsPowerBasedGadget( f417_arg0, f417_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetPowerBased( f418_arg0 )
	local f418_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f418_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f418_local0 ) then
		return Engine.IsPowerBasedGadget( f418_arg0, f418_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetPowerBar( f419_arg0 )
	local f419_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f419_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f419_local0 ) then
		return Engine.IsPowerBarGadget( f419_arg0, f419_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetPowerBar( f420_arg0 )
	local f420_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f420_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f420_local0 ) then
		return Engine.IsPowerBarGadget( f420_arg0, f420_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetPowerBar( f421_arg0 )
	local f421_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f421_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f421_local0 ) then
		return Engine.IsPowerBarGadget( f421_arg0, f421_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetPowerBar( f422_arg0 )
	local f422_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f422_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f422_local0 ) then
		return Engine.IsPowerBarGadget( f422_arg0, f422_local0 )
	else
		return false
	end
end

function WasHeroWeaponGadgetActivated( f423_arg0 )
	local f423_local0
	if f423_arg0.wasHeroWeaponActivated ~= nil then
		f423_local0 = f423_arg0.wasHeroWeaponActivated
	else
		f423_local0 = false
	end
	return f423_local0
end

function isHeroVersion_2_0( f424_arg0, f424_arg1 )
	return Engine.isHeroVersion_2_0( f424_arg0, f424_arg1 )
end

function HeroVersion_2_0_ShouldUseInUseGadget( f425_arg0, f425_arg1 )
	local f425_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f425_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f425_local0 ) and isHeroVersion_2_0( f425_arg1, f425_local0 ) then
		return true
	else
		return not IsHeroWeaponGadgetCurrentWeapon( f425_arg0, f425_arg1 )
	end
end

function IsHeroWeaponOrSpecialGadgetAvailable( f426_arg0, f426_arg1 )
	if IsHeroWeaponGadgetAvailable( f426_arg0, f426_arg1 ) then
		return true
	end
	local f426_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f426_arg1 ), "playerAbilities.playerGadget3.powerRatio" ) )
	local f426_local1
	if f426_local0 == nil or f426_local0 < 1 then
		f426_local1 = false
	else
		f426_local1 = true
	end
	return f426_local1
end

function IsSpecialGadgetAvailable( f427_arg0 )
	local f427_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f427_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f427_local0 ) then
		return Engine.IsGadgetAvailable( f427_arg0, f427_local0 )
	else
		return false
	end
end

function IsHeroAbilityWeapon( f428_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f428_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON ) )
end

function IsHeroAbilityGadget( f429_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f429_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) )
end

function IsHeroWeaponGadgetAvailable( f430_arg0, f430_arg1 )
	local f430_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f430_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f430_local0 ) then
		if not Engine.IsGadgetAvailable( f430_arg1, f430_local0 ) then
			return false
		elseif isHeroVersion_2_0( f430_arg1, f430_local0 ) then
			return Engine.IsGadgetReady( f430_arg1, f430_local0 )
		else
			return not IsHeroWeaponGadgetAmmoEmpty( f430_arg0, f430_arg1 )
		end
	else
		return false
	end
end

function IsPrimaryOffhandGadgetFlickering( f431_arg0 )
	local f431_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f431_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f431_local0 ) then
		return Engine.IsGadgetFlickering( f431_arg0, f431_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetFlickering( f432_arg0 )
	local f432_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f432_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f432_local0 ) then
		return Engine.IsGadgetFlickering( f432_arg0, f432_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetFlickering( f433_arg0 )
	local f433_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f433_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f433_local0 ) then
		return Engine.IsGadgetFlickering( f433_arg0, f433_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetFlickering( f434_arg0 )
	local f434_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f434_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f434_local0 ) then
		return Engine.IsGadgetFlickering( f434_arg0, f434_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetActive( f435_arg0 )
	local f435_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f435_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f435_local0 ) then
		return Engine.isGadgetActive( f435_arg0, f435_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetActive( f436_arg0 )
	local f436_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f436_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f436_local0 ) then
		return Engine.isGadgetActive( f436_arg0, f436_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetActive( f437_arg0 )
	local f437_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f437_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f437_local0 ) then
		return Engine.isGadgetActive( f437_arg0, f437_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetActive( f438_arg0 )
	local f438_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f438_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f438_local0 ) then
		return Engine.isGadgetActive( f438_arg0, f438_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetCharging( f439_arg0 )
	local f439_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f439_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f439_local0 ) then
		return Engine.isGadgetCharging( f439_arg0, f439_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetCharging( f440_arg0 )
	local f440_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f440_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f440_local0 ) then
		return Engine.isGadgetCharging( f440_arg0, f440_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetCharging( f441_arg0 )
	local f441_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f441_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f441_local0 ) then
		return Engine.isGadgetCharging( f441_arg0, f441_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetCharging( f442_arg0 )
	local f442_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f442_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f442_local0 ) then
		return Engine.isGadgetCharging( f442_arg0, f442_local0 )
	else
		return false
	end
end

function PulseNoLethal( f443_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f443_arg0 ), "hudItems.pulseNoLethal" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f443_local1 = CoD.CACUtility
	if f443_local1 then
		f443_local1 = CoD.CACUtility.SelectedClassIndex[f443_arg0]
	end
	if f443_local1 ~= nil and Engine.GetClassItem( f443_arg0, f443_local1, "primarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoTactical( f444_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f444_arg0 ), "hudItems.pulseNoTactical" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f444_local1 = CoD.CACUtility
	if f444_local1 then
		f444_local1 = CoD.CACUtility.SelectedClassIndex[f444_arg0]
	end
	if f444_local1 ~= nil and Engine.GetClassItem( f444_arg0, f444_local1, "secondarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoAmmo( f445_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f445_arg0 ), "hudItems.pulseNoAmmo" ) )
	local f445_local1
	if modelValue == nil or modelValue <= 0 then
		f445_local1 = false
	else
		f445_local1 = true
	end
	return f445_local1
end

function IsStickyImageActive( f446_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f446_arg0 ), "hudItems.stickyImage" ) )
	local f446_local1 = modelValue
	local f446_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f446_local2 = false
	else
		f446_local2 = f446_local1 and true
	end
	return f446_local2
end

function IsShockImageBottomActive( f447_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f447_arg0 ), "hudItems.shockImageBottom" ) )
	local f447_local1 = modelValue
	local f447_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f447_local2 = false
	else
		f447_local2 = f447_local1 and true
	end
	return f447_local2
end

function IsShockImageRightActive( f448_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f448_arg0 ), "hudItems.shockImageRight" ) )
	local f448_local1 = modelValue
	local f448_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f448_local2 = false
	else
		f448_local2 = f448_local1 and true
	end
	return f448_local2
end

function IsShockImageLeftActive( f449_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f449_arg0 ), "hudItems.shockImageLeft" ) )
	local f449_local1 = modelValue
	local f449_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f449_local2 = false
	else
		f449_local2 = f449_local1 and true
	end
	return f449_local2
end

function IsShockImageTopActive( f450_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f450_arg0 ), "hudItems.shockImageTop" ) )
	local f450_local1 = modelValue
	local f450_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f450_local2 = false
	else
		f450_local2 = f450_local1 and true
	end
	return f450_local2
end

function IsArmorOverlayActive( f451_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f451_arg0 ), "hudItems.armorOverlay" ) )
	local f451_local1 = modelValue
	local f451_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f451_local2 = false
	else
		f451_local2 = f451_local1 and true
	end
	return f451_local2
end

function IsAnyKillstreakInRangeAvailable( f452_arg0, f452_arg1, f452_arg2 )
	local f452_local0 = Engine.GetModel( Engine.GetModelForController( f452_arg0 ), "killstreaks" )
	if not f452_local0 then
		return false
	end
	for f452_local1 = f452_arg1, f452_arg2, 1 do
		local f452_local4 = Engine.GetModel( f452_local0, "killstreak" .. f452_local1 .. ".rewardAmmo" )
		local f452_local5 = f452_local4 and Engine.GetModelValue( f452_local4 )
		if f452_local5 ~= nil and f452_local5 > 0 then
			return true
		end
	end
	return false
end

function HigherKillstreakHasAmmo( f453_arg0, f453_arg1 )
	local f453_local0 = f453_arg1:getParent()
	local f453_local1 = f453_local0 and f453_local0.gridInfoTable
	if f453_local1 == nil then
		return false
	else
		local f453_local2 = 3 - f453_local1.zeroBasedIndex
		if f453_local2 >= 3 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f453_arg0, f453_local2 + 1, 4 )
		end
	end
end

function LowerKillstreakHasAmmo( f454_arg0, f454_arg1 )
	local f454_local0 = f454_arg1:getParent()
	local f454_local1 = f454_local0 and f454_local0.gridInfoTable
	if f454_local1 == nil then
		return false
	else
		local f454_local2 = 3 - f454_local1.zeroBasedIndex
		if f454_local2 == 0 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f454_arg0, 0, f454_local2 - 1 )
		end
	end
end

function EarningTowardsThisKillstreak( f455_arg0, f455_arg1 )
	local f455_local0 = Engine.GetModel( Engine.GetModelForController( f455_arg0 ), "rewardMomentum" )
	local f455_local1 = Engine.GetModel( f455_arg1:getModel(), "momentumCost" )
	local f455_local2 = Engine.GetModel( Engine.GetModelForController( f455_arg0 ), "killstreaks" )
	if f455_arg1.gridInfoTable == nil then
		return false
	elseif not f455_local1 or not f455_local0 or not f455_local2 then
		return false
	else
		local f455_local3 = Engine.GetModelValue( f455_local1 )
		local f455_local4 = Engine.GetModelValue( f455_local0 )
		if f455_local4 == nil or f455_local3 == nil or f455_local3 < f455_local4 then
			return false
		else
			local f455_local5 = 3 - f455_arg1.gridInfoTable.zeroBasedIndex
			if f455_local5 == 0 then
				return true
			else
				local f455_local6 = Engine.GetModel( f455_local2, "killstreak" .. f455_local5 - 1 .. ".momentumCost" )
				local f455_local7 = f455_local6 and Engine.GetModelValue( f455_local6 )
				if f455_local7 == nil or f455_local4 < f455_local7 then
					return false
				else
					return true
				end
			end
		end
	end
end

function IsAtLeastHalfGameScore( f456_arg0, f456_arg1 )
	local f456_local0 = Engine.GetModelForController( f456_arg0 )
	local f456_local1 = f456_local0 and Engine.GetModel( f456_local0, "gameScore.scoreLimit" )
	if f456_local1 then
		f456_local1 = Engine.GetModelValue( f456_local1 )
	end
	local f456_local2 = f456_local0 and Engine.GetModel( f456_local0, f456_arg1 )
	local f456_local3 = f456_local2 and Engine.GetModelValue( f456_local2 )
	local f456_local4
	if f456_local1 == nil or f456_local3 == nil or f456_local1 > f456_local3 * 2 then
		f456_local4 = false
	else
		f456_local4 = true
	end
	return f456_local4
end

function IsCursorHintActive( f457_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f457_arg0 ), "hudItems.showCursorHint" ) )
	local f457_local1
	if modelValue == nil or modelValue ~= true then
		f457_local1 = false
	else
		f457_local1 = true
	end
	return f457_local1
end

function IsGameTypeDOA()
	local f458_local0
	if (Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "doa") and (nil == Engine.GetCurrentMap() or Engine.GetCurrentMap() ~= "cp_doa_bo3") then
		f458_local0 = false
	else
		f458_local0 = true
	end
	return f458_local0
end

function HideScoreMeterDueToGameType()
	local f459_local0 = Engine.DvarString( nil, "g_gametype" )
	local f459_local1
	if f459_local0 == nil or f459_local0 ~= "ctf" and f459_local0 ~= "dem" and f459_local0 ~= "sd" then
		f459_local1 = false
	else
		f459_local1 = true
	end
	return f459_local1
end

function HideCyberCoreWidget( f460_arg0 )
	if Engine.GetCurrentMap() == "cp_mi_eth_prologue" and not Engine.IsCampaignModeZombies() then
		local f460_local0 = Engine.GetPlayerStats( f460_arg0 )
		return f460_local0.highestMapReached:get() == 0
	else
		return false
	end
end

function IsMapName( f461_arg0 )
	return Engine.GetCurrentMap() == f461_arg0
end

function HasRoundLimit( f462_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f462_arg0 ), "gameScore.roundLimit" ) ) > 0
end

function IsSingleRound( f463_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f463_arg0 ), "gameScore.roundLimit" ) ) == 1
end

function IsYourTeamWinning( f464_arg0 )
	local f464_local0 = Engine.GetModelForController( f464_arg0 )
	local f464_local1 = Engine.GetModelValue( Engine.CreateModel( f464_local0, "gameScore.yourScore" ) )
	local f464_local2 = Engine.GetModelValue( Engine.CreateModel( f464_local0, "gameScore.enemyScore" ) )
	if f464_local2 and f464_local1 then
		return f464_local2 < f464_local1
	else
		
	end
end

function IsYourTeamLosing( f465_arg0 )
	local f465_local0 = Engine.GetModelForController( f465_arg0 )
	local f465_local1 = Engine.GetModelValue( Engine.CreateModel( f465_local0, "gameScore.yourScore" ) )
	local f465_local2 = Engine.GetModelValue( Engine.CreateModel( f465_local0, "gameScore.enemyScore" ) )
	if f465_local2 and f465_local1 then
		return f465_local1 < f465_local2
	else
		
	end
end

function IsZombieRoundEqualTo( f466_arg0, f466_arg1, f466_arg2 )
	IsSelfModelValueEqualTo( f466_arg0, f466_arg1, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + f466_arg2 )
end

function IsZombieRoundOnesDigitEqualTo( f467_arg0, f467_arg1, f467_arg2 )
	local f467_local0 = f467_arg0:getModel()
	if f467_local0 then
		f467_local0 = Engine.GetModel( f467_local0, "roundsPlayed" )
	end
	local f467_local1 = f467_local0 and Engine.GetModelValue( f467_local0 )
	if f467_local1 == nil then
		return false
	else
		return (f467_local1 - Engine.GetGametypeSetting( "startRound" )) % 10 == f467_arg2
	end
end

function IsZombieRoundTensDigitEqualTo( f468_arg0, f468_arg1, f468_arg2 )
	local f468_local0 = f468_arg0:getModel()
	if f468_local0 then
		f468_local0 = Engine.GetModel( f468_local0, "roundsPlayed" )
	end
	local f468_local1 = f468_local0 and Engine.GetModelValue( f468_local0 )
	if f468_local1 == nil then
		return false
	else
		f468_local1 = f468_local1 - Engine.GetGametypeSetting( "startRound" )
		return (f468_local1 % 100 - f468_local1 % 10) / 10 == f468_arg2
	end
end

function IsParentListInFocus( f469_arg0 )
	local f469_local0 = f469_arg0.gridInfoTable.parentGrid
	if f469_local0 and f469_local0.hasListFocus then
		return true
	else
		return false
	end
end

function IsDisabled( f470_arg0, f470_arg1 )
	local f470_local0 = f470_arg0:getModel( f470_arg1, "disabledFunction" )
	if f470_local0 then
		local f470_local1 = Engine.GetModelValue( f470_local0 )
		if f470_local1 then
			f470_arg0.disabled = f470_local1()
			return f470_local1()
		end
	end
	local f470_local1 = f470_arg0:getModel( f470_arg1, "disabled" )
	if f470_local1 then
		f470_arg0.disabled = Engine.GetModelValue( f470_local1 )
	end
	return f470_arg0.disabled
end

function IsEnabledByGametypeSetting( f471_arg0, f471_arg1 )
	if f471_arg0.enabledWithGametypeSetting ~= nil then
		return Engine.GetGametypeSetting( f471_arg0.enabledWithGametypeSetting ) == 1
	else
		return true
	end
end

function IsSelected( f472_arg0, f472_arg1 )
	local f472_local0 = f472_arg0:getModel( f472_arg1, "selected" )
	if f472_local0 then
		f472_arg0.selected = Engine.GetModelValue( f472_local0 )
	end
	return f472_arg0.selected
end

function IsOddIndexItem( f473_arg0 )
	local f473_local0 = f473_arg0:getParent()
	if f473_local0 == nil or f473_local0.gridInfoTable == nil or f473_local0.gridInfoTable.zeroBasedIndex == nil then
		return false
	else
		return f473_local0.gridInfoTable.zeroBasedIndex % 2 == 1
	end
end

function IsStartMenuItemEquipped( f474_arg0, f474_arg1 )
	local f474_local0 = f474_arg0:getModel()
	if f474_local0 then
		local f474_local1 = CoD.SafeGetModelValue( f474_local0, "itemIndex" )
		if f474_local1 then
			return CoD.perController[f474_arg1].startMenu_equippedIndex == f474_local1
		end
	end
	return false
end

function ListHasElements( f475_arg0 )
	local f475_local0
	if f475_arg0.layoutItems == nil or #f475_arg0.layoutItems <= 0 then
		f475_local0 = false
	else
		f475_local0 = true
	end
	return f475_local0
end

function IsFirstItem( f476_arg0 )
	return f476_arg0.isFirstItem and f476_arg0:isFirstItem()
end

function IsLastItem( f477_arg0 )
	return f477_arg0.isLastItem and f477_arg0:isLastItem()
end

function ShouldDisplayButton( f478_arg0, f478_arg1 )
	local f478_local0 = f478_arg0:getModel( f478_arg1, "tabIcon" )
	if f478_local0 then
		return Engine.GetModelValue( f478_local0 ) ~= ""
	else
		return false
	end
end

function IsHeroLocked( f479_arg0, f479_arg1 )
	local f479_local0 = f479_arg0:getModel( f479_arg1, "disabled" )
	if not f479_local0 or Engine.GetModelValue( f479_local0 ) then
		return true
	else
		return false
	end
end

function IsHeroWeaponAbilityNotAvailable( f480_arg0, f480_arg1 )
	return IsLive() and f480_local2 or f480_local1
end

function IsHeroOnDisabledLoadoutItem( f481_arg0 )
	return f481_arg0.disabled
end

function IsSmallHeroCategory( f482_arg0 )
	return f482_arg0.categorySize == CoD.CCUtility.Heroes.SmallCategory
end

function IsEdittingHeroOption( f483_arg0 )
	return f483_arg0.currentMode ~= CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

function IsExploringTaunts( f484_arg0 )
	return f484_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.ExploringTaunts
end

function IsEdittingTaunt( f485_arg0 )
	return f485_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingTaunt
end

function IsEdittingGestureOption( f486_arg0 )
	return f486_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingGesture
end

function IsEdittingGestureType( f487_arg0 )
	return CoD.CCUtility.TauntsData.EdittingTauntOrGestureType == f487_arg0
end

function CurrentPlayerHasGesture( f488_arg0, f488_arg1 )
	local f488_local0 = Engine.CurrentSessionMode()
	local f488_local1 = Engine.GetEquippedHero( f488_arg0, f488_local0 )
	return CoD.CCUtility.TauntsData.GetGestureXAnim( Engine.GetHeroBundleInfo( f488_local0, f488_local1 ), f488_arg1, Engine.GetSelectedGestureForHero( f488_arg0, f488_local0, f488_local1, f488_arg1 ) ) ~= ""
end

function CurrentPlayerHasAnyGesture( f489_arg0 )
	local f489_local0 = Engine.CurrentSessionMode()
	local f489_local1 = Engine.GetEquippedHero( f489_arg0, f489_local0 )
	local f489_local2 = Engine.GetHeroBundleInfo( f489_local0, f489_local1 )
	for f489_local3 = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		if CoD.CCUtility.TauntsData.GetGestureXAnim( f489_local2, f489_local3, Engine.GetSelectedGestureForHero( f489_arg0, f489_local0, f489_local1, f489_local3 ) ) ~= "" then
			return true
		end
	end
	return false
end

function IsHeroColorOption( f490_arg0 )
	return f490_arg0.isColorOption
end

function IsLoadoutSelectionSlot( f491_arg0 )
	return f491_arg0.equippedSlot ~= nil
end

function FirstTimeSetup_IsActive( f492_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f492_arg0 ), "firstTimeFlowState" ) ) ~= CoD.CCUtility.FirstTimeFlowState.None
end

function FirstTimeSetup_Overview( f493_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f493_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Overview
end

function FirstTimeSetup_ChangedCharacter( f494_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f494_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.SelectionChanged
end

function FirstTimeSetup_Complete( f495_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f495_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Complete
end

function HeroUsingWeapon( f496_arg0, f496_arg1 )
	if f496_arg0.equippedSlot then
		return f496_arg0.equippedSlot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
	else
		local f496_local0 = f496_arg0:getModel( f496_arg1, "equippedSlot" )
		if f496_local0 then
			return Engine.GetModelValue( f496_local0 ) == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
		else
			return false
		end
	end
end

function IsEdittingLoadoutForHero()
	return CoD.CCUtility.Heroes.edittingLoadoutForWidget ~= nil
end

function IsCurrentEdittingLoadForHeroWidget( f498_arg0 )
	return CoD.CCUtility.Heroes.edittingLoadoutForWidget == f498_arg0
end

function IsCurrentSelectedHeroOption( f499_arg0, f499_arg1 )
	local f499_local0 = f499_arg0:getModel( f499_arg1, "optionIndex" )
	if f499_local0 then
		local f499_local1 = Engine.GetModelValue( f499_local0 )
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				return f499_local1 == CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				return f499_local1 == CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			return f499_local1 == CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			return f499_local1 == CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
		end
	end
	return false
end

function IsCurrentLockedHeroOption( f500_arg0, f500_arg1 )
	local f500_local0 = f500_arg0:getModel()
	if f500_local0 then
		local f500_local1 = Engine.GetModel( f500_local0, "isLocked" )
		if f500_local1 then
			return Engine.GetModelValue( f500_local1 )
		end
	end
	return false
end

function IsCurrentNewHeroOption( f501_arg0, f501_arg1, f501_arg2 )
	if IsMultiplayer() and IsProgressionEnabled( f501_arg2 ) then
		local f501_local0 = f501_arg1:getModel( f501_arg2, "optionIndex" )
		if f501_local0 then
			local f501_local1 = Engine.GetModelValue( f501_local0 )
			if f501_local1 ~= 1 then
				local f501_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
				local f501_local3 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
				if f501_local2 ~= nil and f501_local3 ~= nil then
					return Engine.IsCharacterCustomizationItemNew( f501_arg2, f501_local2, f501_local3, f501_local1 )
				end
			end
		end
	end
	return false
end

function ShouldDisplayHeroItemGroupBreadcrumbCount( f502_arg0, f502_arg1 )
	if not IsProgressionEnabled( f502_arg1 ) then
		return false
	else
		local f502_local0 = f502_arg0:getModel( f502_arg1, "breadcrumbCount" )
		if f502_local0 then
			return Engine.GetModelValue( f502_local0 ) > 0
		else
			return false
		end
	end
end

function ShouldHideItemHeroOption( f503_arg0, f503_arg1 )
	if not IsMultiplayer() or not IsProgressionEnabled( f503_arg1 ) then
		return true
	elseif CoD.SafeGetModelValue( f503_arg0:getModel(), "isColorOption" ) == true then
		return true
	end
	local f503_local0 = f503_arg0:getModel()
	if f503_local0 then
		if CoD.SafeGetModelValue( f503_local0, "optionIndex" ) == 1 then
			return true
		elseif IsSelfModelValueTrue( f503_arg0, f503_arg1, "isClassified" ) or not IsSelfModelValueNilOrZero( f503_arg0, f503_arg1, "isBMClassified" ) then
			return true
		end
	end
	return false
end

function IsCurrentTauntNew( f504_arg0, f504_arg1, f504_arg2 )
	if f504_arg1.index and f504_arg1.xanim and f504_arg1.tauntType then
		return Engine.IsTauntNew( f504_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f504_arg1.tauntType, f504_arg1.index, f504_arg1.xanim )
	else
		return false
	end
end

function IsCurrentGestureNew( f505_arg0, f505_arg1, f505_arg2 )
	if f505_arg1.index and f505_arg1.xanim and f505_arg1.heroName and f505_arg1.gestureType then
		local f505_local0 = Enum.eModes.MODE_MULTIPLAYER
		local f505_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		if f505_arg1.xanim ~= "" then
			return Engine.IsGestureNew( f505_arg2, f505_local0, f505_local1, f505_arg1.gestureType, f505_arg1.index, f505_arg1.xanim .. ";" .. f505_arg1.heroName )
		end
	end
	return false
end

function AreAnyTauntsGesturesInListNew( f506_arg0, f506_arg1, f506_arg2 )
	local f506_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f506_local1 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, f506_local0 )
	local f506_local2 = CoD.CCUtility.customizationMode
	if f506_arg0.tauntType then
		for f506_local3 = 0, CoD.CCUtility.TauntsData.GetTauntCount( f506_local1, f506_arg0.tauntType ) - 1, 1 do
			if Engine.IsTauntNew( f506_arg2, f506_local2, f506_local0, f506_arg0.tauntType, f506_local3, CoD.CCUtility.TauntsData.GetTauntXAnim( f506_local1, f506_arg0.tauntType, f506_local3 ) ) then
				return true
			end
		end
	elseif f506_arg0.gestureType then
		local f506_local3 = Engine.GetHeroList( f506_local2 )
		local f506_local4 = CoD.BlackMarketUtility.GetSpecialistNameForHeroAssetName( f506_local3[f506_local0 + 1].assetName )
		for f506_local5 = 0, CoD.CCUtility.TauntsData.GetGestureCount( f506_local1, f506_arg0.gestureType ) - 1, 1 do
			local f506_local8 = CoD.CCUtility.TauntsData.GetGestureXAnim( f506_local1, f506_arg0.gestureType, f506_local5 )
			if f506_local8 ~= "" and Engine.IsGestureNew( f506_arg2, f506_local2, f506_local0, f506_arg0.gestureType, f506_local5, f506_local8 .. ";" .. f506_local4 ) then
				return true
			end
		end
	end
	return false
end

function IsObjectiveActive( f507_arg0, f507_arg1 )
	local f507_local0 = f507_arg0:getModel( f507_arg1, "status" )
	if f507_local0 then
		local f507_local1
		if Engine.GetModelValue( f507_local0 ) ~= "current" and Engine.GetModelValue( f507_local0 ) ~= "active" then
			f507_local1 = false
		else
			f507_local1 = true
		end
		return f507_local1
	else
		return false
	end
end

function IsObjectiveComplete( f508_arg0, f508_arg1 )
	local f508_local0 = f508_arg0:getModel( f508_arg1, "status" )
	if f508_local0 then
		return Engine.GetModelValue( f508_local0 ) == "done"
	else
		return false
	end
end

function IsObjectiveFailed( f509_arg0, f509_arg1 )
	local f509_local0 = f509_arg0:getModel( f509_arg1, "status" )
	if f509_local0 then
		return Engine.GetModelValue( f509_local0 ) == "failed"
	else
		return false
	end
end

function IsObjectiveDescription( f510_arg0, f510_arg1 )
	local f510_local0 = f510_arg0:getModel( f510_arg1, "status" )
	if f510_local0 then
		return Engine.GetModelValue( f510_local0 ) == "description"
	else
		return false
	end
end

function IsObjectiveHidden( f511_arg0, f511_arg1 )
	if f511_arg0:getModel() == nil then
		return true
	else
		local f511_local0 = Engine.GetModel( f511_arg0:getModel(), "state" )
		local f511_local1 = f511_local0 and Engine.GetModelValue( f511_local0 )
		local f511_local2 = Engine.GetPredictedClientNum( f511_arg1 )
		if f511_local1 == nil or f511_local1 == CoD.OBJECTIVESTATE_INVISIBLE then
			return true
		else
			local f511_local3 = Engine.GetModel( f511_arg0:getModel(), "clientUseMask" )
			local f511_local4 = f511_local3 and Engine.GetModelValue( f511_local3 )
			if f511_local4 == nil or f511_local4 == 0 then
				return false
			else
				return f511_local4 & 1 << Engine.GetPredictedClientNum( f511_arg1 ) == 0
			end
		end
	end
end

function IsObjectiveRequirementLabelHidden( f512_arg0, f512_arg1 )
	local f512_local0 = Engine.GetModel( Engine.GetModelForController( f512_arg1 ), "interactivePrompt.activeObjectiveID" )
	if f512_local0 then
		f512_local0 = Engine.GetModelValue( f512_local0 )
	end
	if f512_local0 and f512_arg0.objIndex == f512_local0 then
		if f512_arg0.recenter then
			f512_arg0:recenter()
		end
		return false
	else
		return true
	end
end

function IsListSelectionMode( f513_arg0, f513_arg1 )
	return f513_arg0.currentMode == f513_arg1
end

function IsAttachmentEqualTo( f514_arg0, f514_arg1, f514_arg2, f514_arg3 )
	local f514_local0 = f514_arg1:getModel()
	if f514_local0 then
		local f514_local1 = Engine.GetModelValue( Engine.GetModel( f514_local0, "itemIndex" ) )
		local f514_local2 = f514_arg1.attachmentTableIndex
		if f514_local2 == nil and f514_arg1:getParent() then
			local f514_local3 = f514_arg1:getParent()
			f514_local2 = f514_local3.attachmentTableIndex
		end
		if Engine.GetAttachmentRefByIndex( f514_local2 ) == f514_arg3 then
			return true
		end
	end
	return false
end

function IsEquippedWeaponDW( f515_arg0, f515_arg1, f515_arg2 )
	return CoD.CACUtility.DoesWeaponHaveDWInSlot( f515_arg2, f515_arg1, CoD.perController[f515_arg1].classModel )
end

function IsPaintJobCustomItem( f516_arg0, f516_arg1 )
	if DataSources.WeaponOptions.getCurrentFilterItem() == "paintjob" then
		local f516_local0 = f516_arg0:getModel( f516_arg1, "ref" )
		if f516_local0 and Engine.GetModelValue( f516_local0 ) == "paintshop_1" then
			return true
		end
	end
	return false
end

function IsPaintJobCustomListButton( f517_arg0, f517_arg1 )
	local f517_local0 = f517_arg0:getModel( f517_arg1, "type" )
	local f517_local1 = f517_arg0:getModel( f517_arg1, "paintjobSlot" )
	local f517_local2 = f517_arg0:getModel( f517_arg1, "paintjobIndex" )
	if f517_local0 and f517_local1 and f517_local2 then
		if Engine.GetModelValue( f517_local0 ) == "paintjob" and Engine.GetModelValue( f517_local1 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and Engine.GetModelValue( f517_local2 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			return true
		end
	end
	return false
end

function IsCPHeroWeapon( f518_arg0, f518_arg1 )
	if CoD.isCampaign then
		local f518_local0 = CoD.CACUtility.loadoutSlotNames
		local f518_local1 = CoD.perController[f518_arg1].classNum
		if f518_arg0.currentActiveSlot then
			local f518_local2 = f518_arg0.currentActiveSlot
			if (f518_local2 == f518_local0.primaryWeapon or f518_local2 == f518_local0.secondaryWeapon) and CoD.CACUtility.IsCPHeroWeapon( CoD.GetClassItem( f518_arg1, f518_local1, f518_local2 ) ) then
				return true
			end
		end
	end
	return false
end

function IsToggleVariantEnabled()
	return Dvar.gunsmith_enable_toggle_variant:exists() and Dvar.gunsmith_enable_toggle_variant:get()
end

function HasGlobalHintText( f520_arg0 )
	return DataSources.PerController.hasHintText( f520_arg0 )
end

function HasHintText( f521_arg0 )
	local f521_local0 = f521_arg0:getModel()
	if f521_local0 then
		local f521_local1 = Engine.GetModel( f521_local0, "hintText" )
		if f521_local1 then
			local f521_local2 = Engine.GetModelValue( f521_local1 )
			if f521_local2 ~= "" and f521_local2 ~= Engine.Localize( "" ) then
				return true
			end
		end
	end
	return false
end

function PDV_IsDataVaultOpen( f522_arg0 )
	return CoD.perController[f522_arg0].InspectingDataVault == true
end

function PDV_SelectingMap( f523_arg0 )
	return f523_arg0.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_MISSION
end

function PDV_SelectingCollectible( f524_arg0 )
	return f524_arg0.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE
end

function PDV_InspectingCollectible( f525_arg0 )
	return f525_arg0.currentMode == CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE
end

function PDV_SlotHasCollectible( f526_arg0, f526_arg1 )
	local f526_local0 = f526_arg0:getModel( f526_arg1, "collectibleSlot" )
	if f526_local0 and Engine.GetCollectibleInBunkSlot( f526_arg1, Engine.GetModelValue( f526_local0 ) ) ~= nil then
		return true
	else
		return false
	end
end

function IsGunsmithItemWeaponOptionLocked( f527_arg0, f527_arg1, f527_arg2 )
	if not IsLive() then
		local f527_local0 = GetUnlockSessionMode( f527_arg1, f527_arg2 )
		if f527_local0 == Enum.eModes.MODE_MULTIPLAYER or f527_local0 == Enum.eModes.MODE_ZOMBIES then
			return false
		end
	end
	local f527_local0 = f527_arg1:getModel( f527_arg2, "weaponOptionSubIndex" )
	local f527_local1 = f527_arg1:getModel( f527_arg2, "weaponOptionType" )
	local f527_local2 = CoD.GetCustomization( f527_arg2, "weapon_index" )
	if f527_local0 and f527_local1 then
		local f527_local3 = Engine.GetModelValue( f527_local0 )
		local f527_local4 = Engine.GetModelValue( f527_local1 )
		local f527_local5 = Engine.GetWeaponOptionGroupIndex( f527_local3, f527_local4 )
		if f527_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local f527_local6 = CoD.perController[f527_arg2].gunsmithVariantModel
			if f527_local6 then
				local f527_local7 = Engine.GetModel( f527_local6, "attachment1" )
				if f527_local7 then
					f527_local2 = Engine.GetModelValue( f527_local7 )
				end
			end
		end
		if (f527_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f527_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f527_local3 == 0 then
			return false
		elseif f527_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if f527_local3 == 0 then
				return false
			end
			local f527_local6 = Engine.GetAttachmentRef( f527_local2, f527_local3 )
			for f527_local10, f527_local11 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f527_local6 == f527_local11 then
					return CoD.CACUtility.GetWeaponPLevel( f527_arg2, f527_local2 ) < f527_local10
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( f527_arg2, f527_local2, f527_local5 )
	end
	return false
end

function Gunsmith_OnState( f528_arg0, f528_arg1 )
	local f528_local0 = f528_arg0:getModel( f528_arg1, "param" )
	if f528_local0 then
		local f528_local1 = Engine.GetModelValue( f528_local0 )
		if f528_local1 then
			local f528_local2 = Engine.GetModel( Engine.GetGlobalModel(), f528_local1 )
			if f528_local2 then
				return Engine.GetModelValue( f528_local2 ) == 1
			end
		end
	end
end

function IsGunsmithCurrentACVEquipped( f529_arg0, f529_arg1, f529_arg2 )
	local f529_local0 = Engine.GetModelValue( CoD.perController[f529_arg2].gunsmithAttachmentVariantModel )
	local f529_local1 = f529_arg1:getModel( f529_arg2, "variantIndex" )
	if f529_local1 then
		return f529_local0 == Engine.GetModelValue( f529_local1 )
	else
		return false
	end
end

function IsGunsmithReticleAllowedForOptic( f530_arg0, f530_arg1, f530_arg2, f530_arg3 )
	local f530_local0 = CoD.perController[f530_arg2].gunsmithVariantModel
	if f530_local0 and f530_arg3 then
		local f530_local1 = Engine.GetModel( f530_local0, f530_arg3 )
		if f530_local1 then
			local f530_local2 = Engine.GetModelValue( f530_local1 )
			local f530_local3 = Engine.GetAttachmentRefByIndex( f530_local2 )
			if CoD.CACUtility.EmptyItemIndex < f530_local2 then
				return CoD.CACUtility.attachmentsWithCustReticle[f530_local3]
			end
		end
	end
	return false
end

function Gunsmith_DisablePaintjobVariantSlot( f531_arg0, f531_arg1 )
	if not Paintjobs_IsEnabled( f531_arg0, f531_arg1 ) or IsUserContentRestricted( f531_arg1 ) then
		return true
	else
		return false
	end
end

function ShouldHidePaintJobOptionInZM( f532_arg0, f532_arg1, f532_arg2 )
	if not IsLive() or IsUserContentRestricted( f532_arg2 ) then
		return true
	elseif CoD.CraftUtility.GetWeaponGroupName( f532_arg2 ) == "weapon_knife" then
		return true
	else
		return false
	end
end

function Gunsmith_IsEnabled( f533_arg0, f533_arg1 )
	if IsIntDvarNonZero( "gunsmith_enabled" ) and IsLive() then
		return true
	else
		return false
	end
end

function Gunsmith_CanSelectCamo( f534_arg0, f534_arg1, f534_arg2 )
	if f534_arg1 and f534_arg1:getModel( f534_arg2, "locked" ) then
		return not Engine.GetModelValue( f534_arg1:getModel( f534_arg2, "locked" ) )
	else
		return true
	end
end

function Gunsmith_ValidVariantNameEntered( f535_arg0, f535_arg1 )
	local f535_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f535_arg1 ), "Gunsmith.validVariantNameEntered" ) )
	if f535_local0 ~= nil and f535_local0 == true then
		f535_arg0:makeFocusableWithoutResettingNavigation()
		return true
	else
		f535_arg0:makeNotFocusable()
		return false
	end
end

function Gunsmith_IsVariantOccupied( f536_arg0, f536_arg1 )
	local f536_local0 = Engine.GetModel( f536_arg0:getModel(), "variantIndex" )
	if f536_local0 and CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( Engine.GetModelValue( f536_local0 ) ) then
		return true
	else
		return false
	end
end

function Gunsmith_IsAttachmentEquipped( f537_arg0, f537_arg1, f537_arg2 )
	local f537_local0 = f537_arg1:getModel()
	local f537_local1 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f537_arg2, CoD.perController[f537_arg2].gunsmithVariantModel )
	if f537_local0 then
		local f537_local2 = Engine.GetModel( f537_local0, "attachmentIndex" )
		if f537_local2 then
			local f537_local3 = Engine.GetModelValue( f537_local2 )
			for f537_local7, f537_local8 in ipairs( f537_local1 ) do
				if f537_local8 == f537_local3 then
					return true
				end
			end
		end
	end
	return false
end

function Gunsmith_IsItemMutuallyExclusiveWithSelection( f538_arg0, f538_arg1 )
	local f538_local0 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f538_arg1, CoD.perController[f538_arg1].gunsmithVariantModel )
	local f538_local1 = CoD.CACUtility.EmptyItemIndex
	local f538_local2 = f538_arg0:getModel( f538_arg1, "attachmentIndex" )
	local f538_local3 = CoD.GetCustomization( f538_arg1, "weapon_index" )
	if f538_local2 then
		f538_local1 = Engine.GetModelValue( f538_local2 )
		for f538_local7, f538_local8 in ipairs( f538_local0 ) do
			if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f538_local8 and f538_local1 ~= f538_local8 then
				return not Engine.AreAttachmentsCompatible( f538_local3, Engine.GetAttachmentIndexByAttachmentTableIndex( f538_local3, f538_local1, Enum.eModes.MODE_MULTIPLAYER ), Engine.GetAttachmentIndexByAttachmentTableIndex( f538_local3, f538_local8, Enum.eModes.MODE_MULTIPLAYER ), Enum.eModes.MODE_MULTIPLAYER )
			end
		end
	end
	return false
end

function Gunsmith_IsAttachmentNew( f539_arg0, f539_arg1, f539_arg2 )
	local f539_local0 = CoD.GetCustomization( f539_arg2, "weapon_index" )
	local f539_local1 = f539_arg1:getModel()
	if f539_local1 then
		local f539_local2 = Engine.GetModel( f539_local1, "attachmentIndex" )
		if f539_local2 then
			return Engine.IsAttachmentNew( f539_arg2, f539_local0, Engine.GetAttachmentIndexByAttachmentTableIndex( f539_local0, Engine.GetModelValue( f539_local2 ) ) )
		end
	end
	return false
end

function Gunsmith_IsCamoEquipped( f540_arg0, f540_arg1, f540_arg2 )
	local f540_local0 = f540_arg1:getModel()
	local f540_local1 = Engine.GetModelValue( f540_arg0:getModel() )
	if f540_local0 then
		local f540_local2 = Engine.GetModel( f540_local0, "itemIndex" )
		if f540_local2 and f540_local1 == Engine.GetModelValue( f540_local2 ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsReticleEquipped( f541_arg0, f541_arg1, f541_arg2 )
	local f541_local0 = f541_arg1:getModel()
	local f541_local1 = Engine.GetModelValue( f541_arg0:getModel() )
	if f541_local0 then
		local f541_local2 = Engine.GetModel( f541_local0, "weaponOptionSubIndex" )
		if f541_local2 and f541_local1 == Engine.GetModelValue( f541_local2 ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsCamoNew( f542_arg0, f542_arg1, f542_arg2 )
	local f542_local0 = CoD.GetCustomization( f542_arg2, "weapon_index" )
	local f542_local1 = f542_arg1:getModel()
	if f542_local1 then
		local f542_local2 = Engine.GetModel( f542_local1, "itemIndex" )
		if f542_local2 then
			return Engine.IsWeaponOptionNew( f542_arg2, f542_local0, Engine.GetModelValue( f542_local2 ) )
		end
	end
	return false
end

function Gunsmith_IsReticleNew( f543_arg0, f543_arg1, f543_arg2 )
	local f543_local0 = CoD.GetCustomization( f543_arg2, "weapon_index" )
	local f543_local1 = f543_arg1:getModel()
	if f543_local1 then
		local f543_local2 = Engine.GetModel( f543_local1, "weaponOptionSubIndex" )
		local f543_local3 = f543_arg1:getModel( f543_arg2, "weaponOptionType" )
		if f543_local2 and f543_local3 then
			return Engine.IsWeaponOptionNew( f543_arg2, f543_local0, Engine.GetWeaponOptionGroupIndex( Engine.GetModelValue( f543_local2 ), Engine.GetModelValue( f543_local3 ) ) )
		end
	end
	return false
end

function Gunsmith_IsACVItemNew( f544_arg0, f544_arg1 )
	local f544_local0 = CoD.GetCustomization( f544_arg1, "weapon_index" )
	local f544_local1 = f544_arg0.attachmentRef
	local f544_local2 = f544_arg0.variantIndex
	if CoD.SafeGetModelValue( f544_arg0:getModel(), "isBMClassified" ) == true then
		return false
	elseif f544_local1 and f544_local2 and CoD.CACUtility.EmptyItemIndex < f544_local2 then
		return f0_local10( f544_arg1, f544_local0, f544_local1, f544_local2, Enum.eModes.MODE_MULTIPLAYER )
	else
		return false
	end
end

function Gunsmith_AnyOpticsNew( f545_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewOptics( f545_arg0, CoD.GetCustomization( f545_arg0, "weapon_index" ) )
end

function Gunsmith_AnyAttachmentsNew( f546_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments( f546_arg0, CoD.GetCustomization( f546_arg0, "weapon_index" ) )
end

function Gunsmith_AnyCamosNew( f547_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewCamos( f547_arg0, CoD.GetCustomization( f547_arg0, "weapon_index" ) )
end

function Gunsmith_AnyNewItemsForWeapon( f548_arg0, f548_arg1 )
	local f548_local0 = f548_arg0:getModel( f548_arg1, "itemIndex" )
	if f548_local0 then
		local f548_local1 = Engine.GetModelValue( f548_local0 )
		if f548_local1 > CoD.CACUtility.EmptyItemIndex then
			return CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( f548_arg1, f548_local1 )
		end
	end
	return false
end

function Gunsmith_AnyNewWeaponsOrAttachmentsForGroupButton( f549_arg0, f549_arg1 )
	local f549_local0 = Engine.GetModel( f549_arg0:getModel(), "categoryRef" )
	if f549_local0 then
		return CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( f549_arg1, Engine.GetModelValue( f549_local0 ) )
	else
		return false
	end
end

function Gunsmith_AnyNewWeaponsOrAttachments( f550_arg0 )
	for f550_local0 = 1, #CoD.Craft.WeaponGroupNames, 1 do
		if CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( f550_arg0, CoD.Craft.WeaponGroupNames[f550_local0].weapon_category ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsSpecialWeapon( f551_arg0, f551_arg1, f551_arg2 )
	local f551_local0 = CoD.CraftUtility.GetWeaponGroupName( f551_arg2 )
	local f551_local1 = false
	if f551_local0 == "weapon_launcher" or f551_local0 == "weapon_knife" then
		f551_local1 = true
	end
	return f551_local1
end

function Gunsmith_IsHandguns( f552_arg0, f552_arg1, f552_arg2 )
	return CoD.CraftUtility.GetWeaponGroupName( f552_arg2 ) == "weapon_pistol"
end

function Gunsmith_IsSnipers( f553_arg0, f553_arg1, f553_arg2 )
	return CoD.CraftUtility.GetWeaponGroupName( f553_arg2 ) == "weapon_sniper"
end

function Gunsmith_IsLockedForDemo( f554_arg0, f554_arg1, f554_arg2 )
	local f554_local0 = f554_arg1:getModel()
	if f554_local0 then
		local f554_local1 = Engine.GetModel( f554_local0, "name" )
		if f554_local1 and Engine.GetModelValue( f554_local1 ) == "MP_CLASSIFIED" then
			return true
		end
	end
	return false
end

function Gunsmith_IsVariantCountEmpty( f555_arg0, f555_arg1 )
	local f555_local0 = f555_arg0:getModel( f555_arg1, "itemIndex" )
	if f555_local0 then
		local f555_local1 = Engine.GetModelValue( f555_local0 )
		if f555_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( f555_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function Gunsmith_IsSnapshotWeaponLevelMax( f556_arg0, f556_arg1, f556_arg2 )
	local f556_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f556_arg2, f556_arg1 )
	if f556_local0 == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	local f556_local1 = CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode()
	local f556_local2 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f556_local1 )
	local f556_local3 = 0
	local f556_local4 = Engine.GetGunCurrentRank( f556_arg2, f556_local0, f556_local1 )
	local f556_local5 = Engine.GetGunNextRank( f556_arg2, f556_local0, f556_local1 )
	local f556_local6 = Engine.GetGunCurrentRankXP( f556_arg2, f556_local0, f556_local1 )
	local f556_local7 = Engine.StorageGetBuffer( f556_arg2, f556_local2 )
	if f556_local7 then
		f556_local3 = f556_local7.ItemStats[f556_local0].xp:get()
	end
	local f556_local8
	if f556_local4 ~= f556_local5 or f556_local6 > f556_local3 then
		f556_local8 = false
	else
		f556_local8 = true
	end
	return f556_local8
end

function Gunsmith_IsSnapshotGunLevelExists( f557_arg0, f557_arg1, f557_arg2 )
	local f557_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f557_arg2, f557_arg1 )
	if Engine.IsCampaignGame() then
		local f557_local1 = CoD.GetAttachments( f557_local0 )
		if f557_local1 then
			f557_local1 = #CoD.GetAttachments( f557_local0 ) > 0
		end
		local f557_local2
		if f557_local0 ~= CoD.CACUtility.EmptyItemIndex then
			f557_local2 = f557_local1
		else
			f557_local2 = false
		end
		return f557_local2
	else
		return f557_local0 ~= CoD.CACUtility.EmptyItemIndex
	end
end

function Gunsmith_IsNewVariant( f558_arg0 )
	if CoD.perController[f558_arg0].emptyVariantSelected and CoD.perController[f558_arg0].emptyVariantSelected == true then
		return true
	else
		return false
	end
end

function Gunsmith_IsCurrentVariantChanged( f559_arg0 )
	if not Gunsmith_IsNewVariant( f559_arg0 ) then
		local f559_local0 = CoD.perController[f559_arg0].gunsmithVariantModel
		if f559_local0 and CoD.CraftUtility.Gunsmith.IsCurrentVariantChanged( f559_arg0, f559_local0 ) then
			return true
		end
	end
	return false
end

function IsAttachmentLockedInWeaponBuildKits( f560_arg0, f560_arg1 )
	if not IsProgressionEnabled( f560_arg1 ) then
		return false
	else
		local f560_local0 = CoD.GetCustomization( f560_arg1, "weapon_index" )
		local f560_local1 = f560_arg0:getModel( f560_arg1, "attachmentIndex" )
		if f560_local0 and f560_local1 then
			return Engine.IsItemAttachmentLocked( f560_arg1, f560_local0, Engine.GetAttachmentIndexByAttachmentTableIndex( f560_local0, Engine.GetModelValue( f560_local1 ), Enum.eModes.MODE_ZOMBIES ) )
		else
			
		end
	end
end

function IsAttachmentSlotLocked( f561_arg0, f561_arg1, f561_arg2 )
	if IsZombies() and not IsProgressionEnabled( f561_arg1 ) then
		return false
	end
	local f561_local0 = f561_arg0:getModel( f561_arg1, "weaponIndex" )
	if not f561_local0 then
		return false
	end
	local f561_local1 = Engine.IsAttachmentSlotLocked( f561_arg1, Engine.GetModelValue( f561_local0 ), f561_arg2 )
	if f561_local1 == nil then
		f561_local1 = false
	end
	return f561_local1
end

function IsGridOn( f562_arg0, f562_arg1 )
	return Engine.GetProfileVarInt( f562_arg0, f562_arg1 ) ~= 0
end

function Paintjobs_IsOccupied( f563_arg0, f563_arg1 )
	local f563_local0 = Engine.GetModel( f563_arg0:getModel(), "paintjobSlot" )
	local f563_local1 = Engine.GetModel( f563_arg0:getModel(), "paintjobIndex" )
	if f563_local0 and f563_local1 and CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( Engine.GetModelValue( f563_local0 ), Engine.GetModelValue( f563_local1 ) ) then
		return true
	else
		return false
	end
end

function Paintjobs_DisableGroupsFeature()
	return Dvar.ui_emblemDisableGroups.exists() and Dvar.ui_emblemDisableGroups:get()
end

function Paintjobs_IsCountGreaterThanZero( f565_arg0, f565_arg1 )
	local f565_local0 = f565_arg0:getModel( f565_arg1, "itemIndex" )
	if f565_local0 then
		local f565_local1 = Engine.GetModelValue( f565_local0 )
		if f565_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( f565_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function Paintjobs_IsEnabled( f566_arg0, f566_arg1 )
	if IsSplitscreenSafehouse() then
		return false
	elseif IsLive() then
		return true
	else
		return false
	end
end

function IsGroupSlotAvailable( f567_arg0 )
	local f567_local0 = Engine.GetModel( Engine.GetModelForController( f567_arg0 ), "Emblem.EmblemProperties.groupsUsed" )
	local f567_local1 = false
	if f567_local0 then
		f567_local1 = Engine.GetModelValue( f567_local0 ) < Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS - 1
	end
	return f567_local1
end

function BrowseModeLinkedLayer( f568_arg0, f568_arg1, f568_arg2 )
	local f568_local0 = IsModelValueEqualToEnum( f568_arg2, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f568_local0 then
		f568_local0 = Emblems_IsLayerLinked( f568_arg1, f568_arg2 )
		if f568_local0 then
			f568_local0 = IsModelValueGreaterThanOrEqualTo( f568_arg2, "Emblem.EmblemProperties.linkedLayerCount", 2 )
			if f568_local0 then
				if not Emblem_IsLayerGrouped( f568_arg1, f568_arg2 ) then
					f568_local0 = IsGroupSlotAvailable( f568_arg2 )
					if f568_local0 then
						f568_local0 = not Paintjobs_DisableGroupsFeature()
					end
				else
					f568_local0 = false
				end
			end
		end
	end
	return f568_local0
end

function BrowseModeGroupedLayer( f569_arg0, f569_arg1, f569_arg2 )
	local f569_local0 = IsModelValueEqualToEnum( f569_arg2, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f569_local0 then
		f569_local0 = Emblem_IsLayerGrouped( f569_arg1, f569_arg2 )
		if f569_local0 then
			f569_local0 = not Paintjobs_DisableGroupsFeature()
		end
	end
	return f569_local0
end

function BrowseModeOneLayerLinked( f570_arg0, f570_arg1, f570_arg2 )
	local f570_local0 = IsBrowseMode( f570_arg2 )
	if f570_local0 then
		if not IsLayerEmpty( f570_arg0, f570_arg1, f570_arg2 ) then
			f570_local0 = Emblems_IsLayerLinked( f570_arg1, f570_arg2 )
			if f570_local0 then
				f570_local0 = not Paintjobs_DisableGroupsFeature()
			end
		else
			f570_local0 = false
		end
	end
	return f570_local0
end

function BrowseMode( f571_arg0, f571_arg1, f571_arg2 )
	local f571_local0 = IsBrowseMode( f571_arg2 )
	if f571_local0 then
		if not IsLayerEmpty( f571_arg0, f571_arg1, f571_arg2 ) then
			f571_local0 = not Paintjobs_DisableGroupsFeature()
		else
			f571_local0 = false
		end
	end
	return f571_local0
end

function GroupsDisabledMode( f572_arg0, f572_arg1, f572_arg2 )
	local f572_local0 = Paintjobs_DisableGroupsFeature()
	if f572_local0 then
		f572_local0 = IsBrowseMode( f572_arg2 )
		if f572_local0 then
			f572_local0 = not IsLayerEmpty( f572_arg0, f572_arg1, f572_arg2 )
		end
	end
	return f572_local0
end

function IsUserContentRestricted( f573_arg0 )
	return Engine.IsUserContentRestricted( f573_arg0 )
end

function IsSplitscreenSafehouse()
	if CoD.isSafehouse and Engine.IsSplitscreen() then
		return true
	else
		return false
	end
end

function IsPaintshopButtonDisabled( f575_arg0 )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( f575_arg0 )
	end
end

function IsDataVaultEmblemButtonDisabled( f576_arg0 )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( f576_arg0 )
	end
end

function CraftItemIsReadOnly( f577_arg0, f577_arg1 )
	local f577_local0 = Engine.GetModel( f577_arg0:getModel(), "readOnly" )
	if f577_local0 and Engine.GetModelValue( f577_local0 ) == 1 then
		return true
	else
		return false
	end
end

function Challenges_IsCategoryLocked( f578_arg0, f578_arg1, f578_arg2 )
	local f578_local0 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f578_local0 then
		return returnTable
	end
	local f578_local1 = Engine.GetPlayerStats( f578_arg1, CoD.STATS_LOCATION_NORMAL, f578_local0.index )
	local f578_local2 = f578_local1.PlayerStatsList.RANK.StatValue:get()
	local f578_local3 = f578_local1.PlayerStatsList.PLEVEL.StatValue:get()
	local f578_local4, f578_local5 = nil
	local f578_local6 = Engine.GetChallengeInfoForImages( f578_arg1, f578_arg2, f578_local0.index )
	if #f578_local6 == 0 then
		if f578_arg0 ~= nil then
			f578_arg0:processEvent( {
				name = "set_unlock_instructions",
				rank = f578_local2,
				plevel = f578_local3,
				unlockRank = f578_local4,
				unlockPLevel = f578_local5,
				mode = f578_local0.index
			} )
		end
		return true
	end
	for f578_local14, f578_local15 in ipairs( f578_local6 ) do
		if f578_local15.currentChallengeRow ~= nil then
			return false
		end
		local f578_local10 = f578_local15.challengeRow
		if f578_local10 ~= nil then
			local f578_local11 = "gamedata/stats/" .. f578_local0.name .. "/statsmilestones" .. f578_local15.tableNum + 1 .. ".csv"
			local f578_local12 = tonumber( Engine.TableLookupGetColumnValueForRow( f578_local11, f578_local10, CoD.ChallengesUtility.UnlockRankCol ) )
			local f578_local13 = tonumber( Engine.TableLookupGetColumnValueForRow( f578_local11, f578_local10, CoD.ChallengesUtility.UnlockPLevelCol ) )
			if f578_local12 == nil then
				f578_local12 = 0
			end
			if f578_local13 == nil then
				f578_local13 = 0
			end
			if f578_local4 == nil or f578_local5 == nil then
				f578_local4 = f578_local12
				f578_local5 = f578_local13
			end
			if f578_local12 < f578_local4 then
				f578_local4 = f578_local12
			end
			if f578_local13 < f578_local5 then
				f578_local5 = f578_local13
			end
		end
	end
	if f578_local4 <= f578_local2 and f578_local5 <= f578_local3 then
		return false
	elseif f578_arg0 ~= nil then
		f578_arg0:processEvent( {
			name = "set_unlock_instructions",
			rank = f578_local2,
			plevel = f578_local3,
			unlockRank = f578_local4,
			unlockPLevel = f578_local5,
			mode = f578_local0.index
		} )
	end
	return true
end

function Challenges_MP_IsDarkOpsAvailable( f579_arg0, f579_arg1 )
	for f579_local3, f579_local4 in ipairs( Engine.GetChallengeInfoForImages( f579_arg1, "darkops", Enum.eModes.MODE_MULTIPLAYER ) ) do
		if not f579_local4.isLocked then
			return true
		end
	end
	return false
end

function IsPercentTextAt100Percent( f580_arg0 )
	if type( f580_arg0 ) ~= "string" then
		return false
	else
		return f580_arg0 == Engine.Localize( "MPUI_PERCENT", 100 )
	end
end

function TextHeightGreaterThan( f581_arg0, f581_arg1, f581_arg2 )
	if f581_arg0[f581_arg1] == nil then
		return false
	else
		local f581_local0, f581_local1 = f581_arg0[f581_arg1]:getTextWidthAndHeight()
		return f581_arg2 < f581_local1
	end
end

function Emblems_IsDefaultEmblemEquipped( f582_arg0, f582_arg1, f582_arg2 )
	local f582_local0 = f582_arg1:getModel( f582_arg2, "emblemIndex" )
	if f582_local0 then
		local f582_local1 = Engine.GetModelValue( f582_local0 )
		local f582_local2 = Engine.GetProfileVarInt( f582_arg2, "default_emblem_index" )
		if f582_local2 ~= CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX and f582_local2 == f582_local1 then
			return true
		end
	end
	return false
end

function Emblem_IsOccupied( f583_arg0, f583_arg1 )
	if f583_arg0:getModel() then
		local f583_local0 = Engine.GetModel( f583_arg0:getModel(), "emblemIndex" )
		if f583_local0 and CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( Engine.GetModelValue( f583_local0 ) ) then
			return true
		end
	end
	return false
end

function Emblems_IsEnabled( f584_arg0, f584_arg1 )
	return true
end

function CommunityOptionsEnabled()
	return true
end

function Emblems_IsLayerLinked( f586_arg0, f586_arg1 )
	local f586_local0 = f586_arg0:getModel( f586_arg1, "isLinked" )
	if f586_local0 then
		return Engine.GetModelValue( f586_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGrouped( f587_arg0, f587_arg1 )
	local f587_local0 = f587_arg0:getModel( f587_arg1, "isGrouped" )
	if f587_local0 then
		return Engine.GetModelValue( f587_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGroupedByLayerIndex( f588_arg0, f588_arg1 )
	local f588_local0 = CoD.GetCustomization( f588_arg1, "type" )
	if CoD.perController[f588_arg1].selectedLayerIndex ~= nil then
		local f588_local1 = Engine.GetSelectedLayerData( f588_arg1, CoD.perController[f588_arg1].selectedLayerIndex, f588_local0 )
		return f588_local1.isGrouped
	else
		return false
	end
end

function IsEmblemEmpty( f589_arg0 )
	return Engine.IsEmblemEmpty( f589_arg0, CoD.GetCustomization( f589_arg0, "type" ), CoD.perController[f589_arg0].totalLayers )
end

function Emblem_IsAnyLayerEmpty( f590_arg0 )
	local f590_local0 = CoD.perController[f590_arg0].totalLayers
	if f590_local0 == Engine.GetUsedLayerCount( f590_arg0, CoD.GetCustomization( f590_arg0, "type" ), f590_local0 ) then
		return false
	else
		return true
	end
end

function IsPaintjobAllSidesEmpty( f591_arg0 )
	local f591_local0 = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	return Engine.IsEmblemEmpty( f591_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP, f591_local0 ) and Engine.IsEmblemEmpty( f591_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, f591_local0 ) and Engine.IsEmblemEmpty( f591_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT, f591_local0 )
end

function IsLayerEmpty( f592_arg0, f592_arg1, f592_arg2 )
	if f592_arg0.layerCarousel ~= nil then
		local f592_local0 = f592_arg0.layerCarousel.currentStartRow
		f592_arg1 = f592_arg0.layerCarousel.layoutItems[f592_arg0.layerCarousel.currentStartRow][f592_arg0.layerCarousel.currentStartColumn]
	end
	if f592_arg1 then
		local f592_local0 = f592_arg1:getModel( f592_arg2, "layerIndex" )
		if not f592_local0 then
			return true
		elseif Engine.GetSelectedLayerIconID( f592_arg2, Engine.GetModelValue( f592_local0 ) ) == CoD.emblem.INVALID_ID then
			return true
		else
			return false
		end
	else
		return true
	end
end

function IsEditMode( f593_arg0 )
	return CoD.GetEditorProperties( f593_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT
end

function IsBrowseMode( f594_arg0 )
	return CoD.GetEditorProperties( f594_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
end

function IsClipboardEmpty( f595_arg0 )
	return CoD.GetEditorProperties( f595_arg0, "isClipboardEmpty" ) == CoD.emblem.CLIPBOARDSTATE.EMPTY
end

function IsClipboardEmblemGrouped( f596_arg0 )
	return Engine.IsClipboardEmblemGrouped()
end

function Emblem_HideClipboard( f597_arg0, f597_arg1 )
	if CoD.GetEditorProperties( f597_arg1, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT then
		return true
	elseif IsClipboardEmpty( f597_arg1 ) then
		return true
	else
		return false
	end
end

function Emblem_CanPastFromClipboard( f598_arg0, f598_arg1 )
	local f598_local0 = CoD.GetEditorProperties( f598_arg1, "editorMode" )
	local f598_local1 = IsGroupSlotAvailable( f598_arg1 )
	local f598_local2 = IsClipboardEmblemGrouped( f598_arg1 )
	if f598_local0 == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE then
		if not f598_local2 then
			return true
		elseif f598_local2 and f598_local1 then
			return true
		end
	end
	return false
end

function IsSelectedColorEmpty( f599_arg0, f599_arg1 )
	local f599_local0 = CoD.GetEditorProperties( f599_arg1, "colorNum" )
	local f599_local1 = CoD.GetEditorProperties( f599_arg1, "isColor0NoColor" )
	local f599_local2 = CoD.GetEditorProperties( f599_arg1, "isColor1NoColor" )
	if f599_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 and f599_local1 == 1 then
		return true
	elseif f599_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 and f599_local2 == 1 then
		return true
	else
		return false
	end
end

function Emblems_IsIconNew( f600_arg0, f600_arg1 )
	local f600_local0 = CoD.SafeGetModelValue( f600_arg0:getModel(), "iconID" )
	if f600_local0 then
		return Engine.IsEmblemIconNew( f600_arg1, f600_local0 )
	else
		return false
	end
end

function Emblems_IsAnyEmblemNew( f601_arg0 )
	return CoD.CraftUtility.Emblems.IsAnyEmblemNew( f601_arg0 )
end

function Emblems_IsEmblemNew( f602_arg0, f602_arg1 )
	local f602_local0 = CoD.SafeGetModelValue( f602_arg0:getModel(), "emblemIndex" )
	if f602_local0 then
		return CoD.CraftUtility.Emblems.IsEmblemNew( f602_arg1, f602_local0, CoD.perController[f602_arg1].selectedEmblemTabStorageType )
	else
		return false
	end
end

function Emblems_IsMaterialNew( f603_arg0, f603_arg1 )
	local f603_local0 = CoD.SafeGetModelValue( f603_arg0:getModel(), "materialID" )
	if f603_local0 then
		return CoD.CraftUtility.Emblems.IsMaterialNew( f603_arg1, f603_local0 )
	else
		return false
	end
end

function CallingCards_IsEnabled( f604_arg0, f604_arg1 )
	return true
end

function CallingCards_IsDataDownloaded( f605_arg0, f605_arg1 )
	local f605_local0 = Engine.GetModel( Engine.GetModelForController( f605_arg1 ), "CallingCardsIdentity.DataDownloaded" )
	local f605_local1 = false
	if f605_local0 then
		f605_local1 = Engine.GetModelValue( f605_local0 )
	end
	return f605_local1
end

function CallingCards_IsGetPublicProfileComplete( f606_arg0, f606_arg1 )
	local f606_local0 = Engine.GetModel( Engine.GetModelForController( f606_arg1 ), "CallingCardsIdentity.GetPublicProfileComplete" )
	local f606_local1 = false
	if f606_local0 then
		f606_local1 = Engine.GetModelValue( f606_local0 )
	end
	return f606_local1
end

function CallingCards_IsNew( f607_arg0, f607_arg1 )
	local f607_local0 = CoD.SafeGetModelValue( f607_arg0:getModel(), "iconId" )
	if f607_local0 then
		return Engine.IsEmblemBackgroundNew( f607_arg1, f607_local0 )
	else
		return false
	end
end

function CallingCards_IsAnyNew( f608_arg0 )
	return Engine.IsAnyEmblemBackgroundNew( f608_arg0 )
end

function CraftSlotsFullByStorageType( f609_arg0, f609_arg1 )
	if IsLive() and CoD.CraftUtility.GetTotalAllowedSlotsByFileType( f609_arg0, f609_arg1 ) <= CoD.CraftUtility.GetUsedSlotsByFileType( f609_arg0, f609_arg1 ) then
		return true
	else
		return false
	end
end

function IsPreBuiltEmblemTab( f610_arg0 )
	if CoD.perController[f610_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS or CoD.perController[f610_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
		return true
	else
		return false
	end
end

function IsEmblemEditor( f611_arg0 )
	return CoD.GetCustomization( f611_arg0, "type" ) == Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
end

function IsPaintshop( f612_arg0 )
	local f612_local0 = CoD.GetCustomization( f612_arg0, "type" )
	local f612_local1
	if f612_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT and f612_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP and f612_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT then
		f612_local1 = false
	else
		f612_local1 = true
	end
	return f612_local1
end

function IsMaxPrestigeLevel( f613_arg0 )
	return Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= CoD.PrestigeUtility.GetCurrentPLevel( f613_arg0 )
end

function IsPrestigeLevelAtZero( f614_arg0 )
	return CoD.PrestigeUtility.GetCurrentPLevel( f614_arg0 ) == 0
end

function IsAtXPCap( f615_arg0 )
	local f615_local0 = Engine.GetPlayerStats( f615_arg0, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	return Engine.GetXPCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= f615_local0.PlayerStatsList.RANKXP.StatValue:get()
end

function IsPrestigeRewardSpent( f616_arg0, f616_arg1 )
	return Engine.IsPrestigeTokenSpentByType( f616_arg0, f616_arg1, CoD.PrestigeUtility.GetPrestigeGameMode() )
end

function IsInPermanentUnlockMenu( f617_arg0 )
	return CoD.PrestigeUtility.isInPermanentUnlockMenu
end

function IsInBubblegumSelectMenu( f618_arg0, f618_arg1 )
	return IsGlobalModelValueTrue( f618_arg0, f618_arg1, "inBubblegumBuffSelectMenu" )
end

function IsPermanentlyUnlocked( f619_arg0, f619_arg1 )
	local f619_local0 = nil
	local f619_local1 = f619_arg0.itemIndex
	local f619_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f619_local1 then
		f619_local0 = f619_arg0:getModel( f619_arg1, "itemIndex" )
		if f619_local0 then
			f619_local1 = Engine.GetModelValue( f619_local0 )
		end
	end
	if f619_local1 then
		if Engine.GetItemCost( f619_local1, f619_local2 ) == 0 then
			return true
		else
			return Engine.IsItemPermanentlyUnlocked( f619_arg1, f619_local1, f619_local2 )
		end
	else
		return false
	end
end

function HavePermanentUnlockTokens( f620_arg0 )
	return Engine.GetPermanentUnlockCount( f620_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() ) > 0
end

function PlayerGainedPrestigeMaster( f621_arg0 )
	local f621_local0 = CoD.GetPlayerStats( f621_arg0, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	local f621_local1
	if Engine.GetXPCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) > f621_local0.PlayerStatsList.RANKXP.StatValue:get() or f621_local0.PlayerStatsList.PLEVEL.StatValue:get() ~= Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) - 1 then
		f621_local1 = false
	else
		f621_local1 = true
	end
	return f621_local1
end

function CompetitiveSettingsEnabled( f622_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or modelValue == LobbyData.UITargets.UI_MPLOBBYLANGAME.id then
		if (Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1 then
			return true
		end
	end
	return false
end

function CharacterDraftEnabled()
	return Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1
end

function PregameItemVoteEnabled()
	return Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1
end

function IsArenaMode()
	return LuaUtils.IsArenaMode()
end

function IsArenaStarInvisible( f626_arg0, f626_arg1, f626_arg2 )
	local f626_local0 = f626_arg0:getParent()
	if f626_local0 == nil then
		return false
	end
	local f626_local1 = f626_local0:getModel( f626_arg1, "levelStars" )
	local f626_local2
	if f626_local1 and Engine.GetModelValue( f626_local1 ) >= tonumber( f626_arg2 ) then
		f626_local2 = false
	else
		f626_local2 = true
	end
	return f626_local2
end

function IsArenaStarInactive( f627_arg0, f627_arg1, f627_arg2 )
	local f627_local0 = f627_arg0:getParent()
	if f627_local0 == nil then
		return false
	end
	local f627_local1 = f627_local0:getModel( f627_arg1, "levelStars" )
	local f627_local2 = f627_local0:getModel( f627_arg1, "earnedStars" )
	local f627_local3 = tonumber( f627_arg2 )
	local f627_local4 = f627_local1
	local f627_local5 = f627_local2
	local f627_local6
	if f627_local3 > Engine.GetModelValue( f627_local1 ) or Engine.GetModelValue( f627_local2 ) >= f627_local3 then
		f627_local6 = false
	else
		f627_local6 = f627_local5 and f627_local4 and true
	end
	return f627_local6
end

function IsArenaStarEarned( f628_arg0, f628_arg1, f628_arg2 )
	local f628_local0 = f628_arg0:getParent()
	if f628_local0 == nil then
		return false
	else
		local f628_local1 = f628_local0:getModel( f628_arg1, "earnedStars" )
		return f628_local1 and tonumber( f628_arg2 ) <= Engine.GetModelValue( f628_local1 )
	end
end

function ArenaRankIncreased( f629_arg0 )
	local f629_local0 = Engine.GetPlaylistInfoByID( Engine.GetPlaylistID() )
	local f629_local1 = CoD.GetPlayerStats( f629_arg0 )
	return CoD.ArenaUtility.GetRank( f629_local1.arenaStats[f629_local0.playlist.arenaSlot].matchStartPoints:get() ) < CoD.ArenaUtility.GetRank( f629_local1.arenaStats[f629_local0.playlist.arenaSlot].points:get() )
end

function WonLastTeamBasedMatch( f630_arg0 )
	local f630_local0 = Engine.StorageGetBuffer( f630_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f630_local0 then
		return false
	else
		local f630_local1 = f630_local0.AfterActionReportStats
		local f630_local2 = f630_local1.alliesScore:get()
		local f630_local3 = f630_local1.axisScore:get()
		local f630_local4 = f630_local1.team:get()
		if f630_local4 ~= Enum.team_t.TEAM_ALLIES and f630_local4 ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif f630_local4 == Enum.team_t.TEAM_ALLIES then
			return f630_local3 < f630_local2
		else
			return f630_local2 < f630_local3
		end
	end
end

function LostLastTeamBasedMatch( f631_arg0 )
	local f631_local0 = Engine.StorageGetBuffer( f631_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f631_local0 then
		return false
	else
		local f631_local1 = f631_local0.AfterActionReportStats
		local f631_local2 = f631_local1.alliesScore:get()
		local f631_local3 = f631_local1.axisScore:get()
		local f631_local4 = f631_local1.team:get()
		if f631_local4 ~= Enum.team_t.TEAM_ALLIES and f631_local4 ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif f631_local4 == Enum.team_t.TEAM_ALLIES then
			return f631_local2 < f631_local3
		else
			return f631_local3 < f631_local2
		end
	end
end

function IsBetaSeason()
	local f632_local0 = Engine.GetCurrentArenaSeason()
	local f632_local1
	if f632_local0 > 0 or f632_local0 >= 2 then
		f632_local1 = false
	else
		f632_local1 = true
	end
	return f632_local1
end

function IsParamModelEqualTo( f633_arg0, f633_arg1 )
	return f633_arg0 and Engine.GetModelValue( f633_arg0 ) == f633_arg1
end

function IsParamModelEqualToString( f634_arg0, f634_arg1 )
	return f634_arg0 and Engine.GetModelValue( f634_arg0 ) == f634_arg1
end

function IsModelParameterValueEnum( f635_arg0, f635_arg1 )
	return f635_arg0 and Engine.GetModelValue( f635_arg0 ) == f635_arg1
end

function IsModelValueNonEmptyString( f636_arg0, f636_arg1 )
	local f636_local0 = Engine.GetModel( Engine.GetModelForController( f636_arg0 ), f636_arg1 )
	local f636_local1 = f636_local0 and Engine.GetModelValue( f636_local0 )
	local f636_local2
	if f636_local1 == nil or f636_local1 == "" then
		f636_local2 = false
	else
		f636_local2 = true
	end
	return f636_local2
end

function IsModelValueTrue( f637_arg0, f637_arg1 )
	local f637_local0 = Engine.GetModel( Engine.GetModelForController( f637_arg0 ), f637_arg1 )
	local f637_local1 = f637_local0 and Engine.GetModelValue( f637_local0 )
	local f637_local2
	if f637_local1 == nil or f637_local1 ~= true then
		f637_local2 = false
	else
		f637_local2 = true
	end
	return f637_local2
end

function IsModelValueGreaterThan( f638_arg0, f638_arg1, f638_arg2 )
	local f638_local0 = Engine.GetModel( Engine.GetModelForController( f638_arg0 ), f638_arg1 )
	local f638_local1 = f638_local0 and Engine.GetModelValue( f638_local0 )
	local f638_local2
	if f638_local1 == nil or f638_arg2 >= f638_local1 then
		f638_local2 = false
	else
		f638_local2 = true
	end
	return f638_local2
end

function IsModelValueLessThan( f639_arg0, f639_arg1, f639_arg2 )
	local f639_local0 = Engine.GetModel( Engine.GetModelForController( f639_arg0 ), f639_arg1 )
	local f639_local1 = f639_local0 and Engine.GetModelValue( f639_local0 )
	local f639_local2
	if f639_local1 == nil or f639_local1 >= f639_arg2 then
		f639_local2 = false
	else
		f639_local2 = true
	end
	return f639_local2
end

function IsModelValueGreaterThanOrEqualTo( f640_arg0, f640_arg1, f640_arg2 )
	local f640_local0 = Engine.GetModel( Engine.GetModelForController( f640_arg0 ), f640_arg1 )
	local f640_local1 = f640_local0 and Engine.GetModelValue( f640_local0 )
	local f640_local2
	if f640_local1 == nil or f640_arg2 > f640_local1 then
		f640_local2 = false
	else
		f640_local2 = true
	end
	return f640_local2
end

function IsModelValueLessThanOrEqualTo( f641_arg0, f641_arg1, f641_arg2 )
	local f641_local0 = Engine.GetModel( Engine.GetModelForController( f641_arg0 ), f641_arg1 )
	local f641_local1 = f641_local0 and Engine.GetModelValue( f641_local0 )
	local f641_local2
	if f641_local1 == nil or f641_local1 > f641_arg2 then
		f641_local2 = false
	else
		f641_local2 = true
	end
	return f641_local2
end

function IsModelValueEqualTo( f642_arg0, f642_arg1, f642_arg2 )
	local f642_local0 = Engine.GetModel( Engine.GetModelForController( f642_arg0 ), f642_arg1 )
	local f642_local1 = f642_local0 and Engine.GetModelValue( f642_local0 )
	local f642_local2
	if f642_local1 == nil or f642_local1 ~= f642_arg2 then
		f642_local2 = false
	else
		f642_local2 = true
	end
	return f642_local2
end

function IsModelValueEqualToEitherValue( f643_arg0, f643_arg1, f643_arg2, f643_arg3 )
	local f643_local0 = Engine.GetModel( Engine.GetModelForController( f643_arg0 ), f643_arg1 )
	local f643_local1 = f643_local0 and Engine.GetModelValue( f643_local0 )
	local f643_local2
	if f643_local1 == nil or f643_local1 ~= f643_arg2 and f643_local1 ~= f643_arg3 then
		f643_local2 = false
	else
		f643_local2 = true
	end
	return f643_local2
end

function IsModelValueEqualToEnum( f644_arg0, f644_arg1, f644_arg2 )
	local f644_local0 = Engine.GetModel( Engine.GetModelForController( f644_arg0 ), f644_arg1 )
	local f644_local1 = f644_local0 and Engine.GetModelValue( f644_local0 )
	local f644_local2
	if f644_local1 == nil or f644_local1 ~= f644_arg2 then
		f644_local2 = false
	else
		f644_local2 = true
	end
	return f644_local2
end

function IsModelValueEnumBitSet( f645_arg0, f645_arg1, f645_arg2 )
	local f645_local0 = Engine.GetModel( Engine.GetModelForController( f645_arg0 ), f645_arg1 )
	local f645_local1 = f645_local0 and Engine.GetModelValue( f645_local0 )
	local f645_local2
	if f645_local1 ~= nil then
		f645_local2 = CoD.BitUtility.IsBitSet( f645_local1, f645_arg2 )
	else
		f645_local2 = false
	end
	return f645_local2
end

function ModelValueStartsWith( f646_arg0, f646_arg1, f646_arg2 )
	local f646_local0 = Engine.GetModel( Engine.GetModelForController( f646_arg0 ), f646_arg1 )
	local f646_local1 = f646_local0 and Engine.GetModelValue( f646_local0 )
	local f646_local2
	if f646_local1 ~= nil then
		f646_local2 = LUI.startswith( f646_local1, f646_arg2 )
	else
		f646_local2 = false
	end
	return f646_local2
end

function IsControllerModelValueEqualToSelfModelValue( f647_arg0, f647_arg1, f647_arg2, f647_arg3 )
	if not f647_arg0:getModel() then
		return false
	else
		local f647_local0 = Engine.GetModel( Engine.GetModelForController( f647_arg1 ), f647_arg2 )
		if not f647_local0 then
			return false
		else
			local f647_local1 = Engine.GetModel( f647_arg0:getModel(), f647_arg3 )
			if not f647_local1 then
				return false
			else
				return Engine.GetModelValue( f647_local0 ) == Engine.GetModelValue( f647_local1 )
			end
		end
	end
end

function IsControllerModelValueGreaterThanOrEqualToSelfModelValue( f648_arg0, f648_arg1, f648_arg2, f648_arg3 )
	if not f648_arg0:getModel() then
		return false
	else
		local f648_local0 = Engine.GetModel( Engine.GetModelForController( f648_arg1 ), f648_arg2 )
		if not f648_local0 then
			return false
		else
			local f648_local1 = Engine.GetModel( f648_arg0:getModel(), f648_arg3 )
			if not f648_local1 then
				return false
			else
				return Engine.GetModelValue( f648_local1 ) <= Engine.GetModelValue( f648_local0 )
			end
		end
	end
end

function IsGlobalModelValueEqualToSelfModelValue( f649_arg0, f649_arg1, f649_arg2, f649_arg3 )
	if not f649_arg0:getModel() then
		return false
	else
		local f649_local0 = Engine.GetModel( Engine.GetGlobalModel(), f649_arg2 )
		if not f649_local0 then
			return false
		else
			local f649_local1 = Engine.GetModel( f649_arg0:getModel(), f649_arg3 )
			if not f649_local1 then
				return false
			else
				return Engine.GetModelValue( f649_local0 ) == Engine.GetModelValue( f649_local1 )
			end
		end
	end
end

function IsSelfModelValueNil( f650_arg0, f650_arg1, f650_arg2 )
	local f650_local0 = f650_arg0:getModel()
	if f650_arg2 ~= "" and f650_local0 then
		f650_local0 = Engine.GetModel( f650_local0, f650_arg2 )
	end
	return f650_local0 == nil
end

function IsSelfModelValueNilOrZero( f651_arg0, f651_arg1, f651_arg2 )
	local f651_local0 = f651_arg0:getModel()
	if f651_arg2 ~= "" and f651_local0 then
		f651_local0 = Engine.GetModel( f651_local0, f651_arg2 )
	end
	local f651_local1
	if f651_local0 ~= nil and (f651_local0 and Engine.GetModelValue( f651_local0 )) ~= 0 then
		f651_local1 = false
	else
		f651_local1 = true
	end
	return f651_local1
end

function IsSelfModelValueNonEmptyString( f652_arg0, f652_arg1, f652_arg2 )
	local f652_local0 = f652_arg0:getModel()
	if f652_arg2 ~= "" and f652_local0 then
		f652_local0 = Engine.GetModel( f652_local0, f652_arg2 )
	end
	local f652_local1 = f652_local0 and Engine.GetModelValue( f652_local0 )
	local f652_local2
	if f652_local1 == nil or f652_local1 == "" then
		f652_local2 = false
	else
		f652_local2 = true
	end
	return f652_local2
end

function IsSelfModelValueTrue( f653_arg0, f653_arg1, f653_arg2 )
	local f653_local0 = f653_arg0:getModel()
	if f653_arg2 ~= "" and f653_local0 then
		f653_local0 = Engine.GetModel( f653_local0, f653_arg2 )
	end
	local f653_local1 = f653_local0 and Engine.GetModelValue( f653_local0 )
	local f653_local2
	if f653_local1 == nil or f653_local1 ~= true then
		f653_local2 = false
	else
		f653_local2 = true
	end
	return f653_local2
end

function IsSelfEnumModelValueTrue( f654_arg0, f654_arg1, f654_arg2 )
	local f654_local0 = f654_arg0:getModel()
	if f654_arg2 ~= "" and f654_local0 then
		f654_local0 = Engine.GetModel( f654_local0, f654_arg2 )
	end
	local f654_local1 = f654_local0 and Engine.GetModelValue( f654_local0 )
	local f654_local2
	if f654_local1 == nil or f654_local1 ~= true then
		f654_local2 = false
	else
		f654_local2 = true
	end
	return f654_local2
end

function IsSelfModelValueGreaterThan( f655_arg0, f655_arg1, f655_arg2, f655_arg3 )
	local f655_local0 = f655_arg0:getModel()
	if f655_arg2 ~= "" and f655_local0 then
		f655_local0 = Engine.GetModel( f655_local0, f655_arg2 )
	end
	local f655_local1 = f655_local0 and Engine.GetModelValue( f655_local0 )
	local f655_local2
	if f655_local1 == nil or f655_arg3 >= f655_local1 then
		f655_local2 = false
	else
		f655_local2 = true
	end
	return f655_local2
end

function IsSelfModelValueLessThan( f656_arg0, f656_arg1, f656_arg2, f656_arg3 )
	local f656_local0 = f656_arg0:getModel()
	if f656_arg2 ~= "" and f656_local0 then
		f656_local0 = Engine.GetModel( f656_local0, f656_arg2 )
	end
	local f656_local1 = f656_local0 and Engine.GetModelValue( f656_local0 )
	local f656_local2
	if f656_local1 == nil or f656_local1 >= f656_arg3 then
		f656_local2 = false
	else
		f656_local2 = true
	end
	return f656_local2
end

function IsSelfModelValueGreaterThanOrEqualTo( f657_arg0, f657_arg1, f657_arg2, f657_arg3 )
	local f657_local0 = f657_arg0:getModel()
	if f657_arg2 ~= "" and f657_local0 then
		f657_local0 = Engine.GetModel( f657_local0, f657_arg2 )
	end
	local f657_local1 = f657_local0 and Engine.GetModelValue( f657_local0 )
	local f657_local2
	if f657_local1 == nil or f657_arg3 > f657_local1 then
		f657_local2 = false
	else
		f657_local2 = true
	end
	return f657_local2
end

function IsSelfModelValueLessThanOrEqualTo( f658_arg0, f658_arg1, f658_arg2, f658_arg3 )
	local f658_local0 = f658_arg0:getModel()
	if f658_arg2 ~= "" and f658_local0 then
		f658_local0 = Engine.GetModel( f658_local0, f658_arg2 )
	end
	local f658_local1 = f658_local0 and Engine.GetModelValue( f658_local0 )
	local f658_local2
	if f658_local1 == nil or f658_local1 > f658_arg3 then
		f658_local2 = false
	else
		f658_local2 = true
	end
	return f658_local2
end

function IsSelfModelValueEqualTo( f659_arg0, f659_arg1, f659_arg2, f659_arg3 )
	local f659_local0 = f659_arg0:getModel()
	if f659_arg2 ~= "" and f659_local0 then
		f659_local0 = Engine.GetModel( f659_local0, f659_arg2 )
	end
	local f659_local1 = f659_local0 and Engine.GetModelValue( f659_local0 )
	local f659_local2
	if f659_local1 == nil or f659_local1 ~= f659_arg3 then
		f659_local2 = false
	else
		f659_local2 = true
	end
	return f659_local2
end

function IsSelfModelValueEqualToEitherValue( f660_arg0, f660_arg1, f660_arg2, f660_arg3, f660_arg4 )
	local f660_local0 = f660_arg0:getModel()
	if f660_arg2 ~= "" and f660_local0 then
		f660_local0 = Engine.GetModel( f660_local0, f660_arg2 )
	end
	local f660_local1 = f660_local0 and Engine.GetModelValue( f660_local0 )
	local f660_local2
	if f660_local1 == nil or f660_local1 ~= f660_arg3 and f660_local1 ~= f660_arg4 then
		f660_local2 = false
	else
		f660_local2 = true
	end
	return f660_local2
end

function IsSelfModelValueEqualToAnyValue( f661_arg0, f661_arg1, f661_arg2, f661_arg3, f661_arg4, f661_arg5 )
	local f661_local0 = f661_arg0:getModel()
	if f661_arg2 ~= "" and f661_local0 then
		f661_local0 = Engine.GetModel( f661_local0, f661_arg2 )
	end
	local f661_local1 = f661_local0 and Engine.GetModelValue( f661_local0 )
	local f661_local2
	if f661_local1 == nil or f661_local1 ~= f661_arg3 and f661_local1 ~= f661_arg4 and f661_local1 ~= f661_arg5 then
		f661_local2 = false
	else
		f661_local2 = true
	end
	return f661_local2
end

function IsSelfModelValueEqualToAnyValue4( f662_arg0, f662_arg1, f662_arg2, f662_arg3, f662_arg4, f662_arg5, f662_arg6 )
	local f662_local0 = f662_arg0:getModel()
	if f662_arg2 ~= "" and f662_local0 then
		f662_local0 = Engine.GetModel( f662_local0, f662_arg2 )
	end
	local f662_local1 = f662_local0 and Engine.GetModelValue( f662_local0 )
	local f662_local2
	if f662_local1 == nil or f662_local1 ~= f662_arg3 and f662_local1 ~= f662_arg4 and f662_local1 ~= f662_arg5 and f662_local1 ~= f662_arg6 then
		f662_local2 = false
	else
		f662_local2 = true
	end
	return f662_local2
end

function IsSelfModelValueEqualToEnum( f663_arg0, f663_arg1, f663_arg2, f663_arg3 )
	local f663_local0 = f663_arg0:getModel()
	if f663_arg2 ~= "" and f663_local0 then
		f663_local0 = Engine.GetModel( f663_local0, f663_arg2 )
	end
	local f663_local1 = f663_local0 and Engine.GetModelValue( f663_local0 )
	local f663_local2
	if f663_local1 == nil or f663_local1 ~= f663_arg3 then
		f663_local2 = false
	else
		f663_local2 = true
	end
	return f663_local2
end

function IsSelfModelValueEqualToEnumOrSelfModelNil( f664_arg0, f664_arg1, f664_arg2, f664_arg3 )
	if f664_arg0:getModel() == nil then
		return true
	else
		return IsSelfModelValueEqualToEnum( f664_arg0, f664_arg1, f664_arg2, f664_arg3 )
	end
end

function IsGlobalModelValueNonEmptyString( f665_arg0, f665_arg1, f665_arg2 )
	local f665_local0 = Engine.GetModel( Engine.GetGlobalModel(), f665_arg2 )
	local f665_local1 = f665_local0 and Engine.GetModelValue( f665_local0 )
	local f665_local2
	if f665_local1 == nil or f665_local1 == "" then
		f665_local2 = false
	else
		f665_local2 = true
	end
	return f665_local2
end

function IsGlobalModelValueTrue( f666_arg0, f666_arg1, f666_arg2 )
	local f666_local0 = Engine.GetModel( Engine.GetGlobalModel(), f666_arg2 )
	local f666_local1 = f666_local0 and Engine.GetModelValue( f666_local0 )
	local f666_local2
	if f666_local1 == nil or f666_local1 ~= true then
		f666_local2 = false
	else
		f666_local2 = true
	end
	return f666_local2
end

function IsGlobalModelValueEqualTo( f667_arg0, f667_arg1, f667_arg2, f667_arg3 )
	local f667_local0 = Engine.GetModel( Engine.GetGlobalModel(), f667_arg2 )
	local f667_local1 = f667_local0 and Engine.GetModelValue( f667_local0 )
	local f667_local2
	if f667_local1 == nil or f667_local1 ~= f667_arg3 then
		f667_local2 = false
	else
		f667_local2 = true
	end
	return f667_local2
end

function IsGlobalModelValueEqualToEnum( f668_arg0, f668_arg1, f668_arg2, f668_arg3 )
	local f668_local0 = Engine.GetModel( Engine.GetGlobalModel(), f668_arg2 )
	local f668_local1 = f668_local0 and Engine.GetModelValue( f668_local0 )
	local f668_local2
	if f668_local1 == nil or f668_local1 ~= f668_arg3 then
		f668_local2 = false
	else
		f668_local2 = true
	end
	return f668_local2
end

function IsGlobalModelValueGreaterThan( f669_arg0, f669_arg1, f669_arg2 )
	local f669_local0 = Engine.GetModel( Engine.GetGlobalModel(), f669_arg1 )
	local f669_local1 = f669_local0 and Engine.GetModelValue( f669_local0 )
	local f669_local2
	if f669_local1 == nil or f669_arg2 >= tonumber( f669_local1 ) then
		f669_local2 = false
	else
		f669_local2 = true
	end
	return f669_local2
end

function IsSelfModelValueEnumBitSet( f670_arg0, f670_arg1, f670_arg2, f670_arg3 )
	local f670_local0 = f670_arg0:getModel()
	if f670_arg2 ~= "" and f670_local0 then
		f670_local0 = Engine.GetModel( f670_local0, f670_arg2 )
	end
	local f670_local1 = f670_local0 and Engine.GetModelValue( f670_local0 )
	local f670_local2
	if f670_local1 ~= nil then
		f670_local2 = CoD.BitUtility.IsBitSet( f670_local1, f670_arg3 )
	else
		f670_local2 = false
	end
	return f670_local2
end

function IsSelfModelValueMyXuid( f671_arg0, f671_arg1, f671_arg2 )
	local f671_local0 = f671_arg0:getModel()
	if f671_local0 then
		f671_local0 = Engine.GetModel( f671_local0, f671_arg2 )
	end
	local f671_local1 = f671_local0 and Engine.GetModelValue( f671_local0 )
	local f671_local2
	if f671_local1 == nil or f671_local1 ~= Engine.GetXUID64( f671_arg1 ) then
		f671_local2 = false
	else
		f671_local2 = true
	end
	return f671_local2
end

function IsPrimaryButton( f672_arg0 )
	local f672_local0
	if f672_arg0.button == "primary" then
		f672_local0 = f672_arg0.down
	else
		f672_local0 = false
	end
	return f672_local0
end

function IsDpadButton( f673_arg0 )
	local f673_local0 = f673_arg0 and Engine.GetModelValue( f673_arg0 )
	local f673_local1
	if f673_local0 ~= nil then
		f673_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f673_local0, Enum.LUIButtonFlags.FLAG_DPAD )
	else
		f673_local1 = true
	end
	return f673_local1
end

function IsRepeatButtonPress( f674_arg0 )
	local f674_local0 = f674_arg0 and Engine.GetModelValue( f674_arg0 )
	local f674_local1
	if f674_local0 ~= nil then
		f674_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f674_local0, Enum.LUIButtonFlags.FLAG_ISREPEAT )
	else
		f674_local1 = false
	end
	return f674_local1
end

function IsPartyLeaderStatusVisible()
	local f675_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f675_local0 then
		local f675_local1 = LobbyData:UITargetFromId( f675_local0 )
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and f675_local1.id == LobbyData.UITargets.UI_MODESELECT.id then
			return false
		elseif f675_local1.isAdvertised then
			return false
		else
			return true
		end
	else
		return false
	end
end

function IsLobbyStatusVisible()
	local f676_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f676_local0 then
		local f676_local1 = LobbyData:UITargetFromId( f676_local0 )
		if f676_local1.isAdvertised then
			return true
		end
	end
	return false
end

function IsPartyPrivacyVisible()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		local f677_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
		if f677_local0 then
			local f677_local1 = LobbyData:UITargetFromId( f677_local0 )
			if f677_local1.isAdvertised == true then
				return false
			else
				return true
			end
		else
			return false
		end
	end
end

function IsPlayerLimitAtMin()
	local f678_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f678_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local f678_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" ) )
	if f678_local0 == f678_local1 or f678_local1 == 1 then
		return true
	else
		return false
	end
end

function IsPlayerLimitAtMax()
	local f679_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f679_local0.maxClients <= Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" ) ) then
		return true
	else
		return false
	end
end

function HasNumHessActive( f680_arg0, f680_arg1 )
	local f680_local0 = 0
	local f680_local1 = Engine.GetModel( Engine.GetModelForController( f680_arg0 ), "hudItems.hess1.type" )
	if f680_local1 ~= nil and Engine.GetModelValue( f680_local1 ) ~= 0 then
		f680_local0 = 1
	end
	local f680_local2 = Engine.GetModel( Engine.GetModelForController( f680_arg0 ), "hudItems.hess2.type" )
	if f680_local2 ~= nil and Engine.GetModelValue( f680_local2 ) ~= 0 then
		f680_local0 = f680_local0 + 1
	end
	return f680_local0 == f680_arg1
end

function AreKillstreaksEnabled()
	return Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1
end

function CanUseSharedLoadouts( f682_arg0 )
	if not CoD.isCampaign then
		return false
	end
	local f682_local0 = Dvar.lobby_enableLoadoutDataStreamingInGame:get()
	local f682_local1 = 1
	local f682_local2 = Engine.GetModel( Engine.GetModelForController( f682_arg0 ), "ChooseClassCPClientMenu" )
	if f682_local2 then
		f682_local1 = Engine.GetModelValue( Engine.GetModel( f682_local2, "numActiveClients" ) )
	end
	local f682_local3
	if f682_local0 ~= true or f682_local1 <= 1 then
		f682_local3 = false
	else
		f682_local3 = true
	end
	return f682_local3
end

function IsInTheaterMode()
	if not IsGameLobbyActive() then
		return false
	elseif not IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_THEATER ) then
		return false
	else
		return true
	end
end

function LobbyModeTheater()
	return IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_THEATER )
end

function IsFilmNotSelected()
	return not IsFilmSelected()
end

function IsFilmSelected()
	local f686_local0 = Engine.LobbyGetDemoInformation()
	if f686_local0 and f686_local0.fileID ~= Engine.DefaultID64Value() then
		return true
	else
		return false
	end
end

local f0_local11 = function ()
	local f687_local0 = Engine.LobbyGetDemoInformation()
	if f687_local0 and f687_local0.readyForPlayback then
		return true
	else
		return false
	end
end

function IsStartFilmButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not f0_local11() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsCreateHighlightReelButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not f0_local11() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsShoutcastFilmButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not f0_local11() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsUploadClipButtonDisabled()
	if Engine.IsDemoClipPlaying() or Engine.IsDemoClipRecording() or Engine.GetDemoSegmentCount() <= 0 or Engine.IsRepositioningCameraMarker() then
		return true
	else
		return false
	end
end

function IsManageSegmentsButtonDisabled()
	if Engine.IsDemoClipPlaying() or Engine.IsDemoClipRecording() or Engine.GetDemoSegmentCount() <= 0 or Engine.IsRepositioningCameraMarker() then
		return true
	else
		return false
	end
end

function IsCustomizeHighlightReelButtonDisabled()
	if Engine.IsDemoClipRecording() or Engine.IsRepositioningCameraMarker() or not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) or not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return true
	else
		return false
	end
end

function IsJumpToStartButtonDisabled()
	if Engine.IsDemoClipRecording() or Engine.IsRepositioningCameraMarker() or not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) or not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return true
	else
		return false
	end
end

function IsDemoPlaying()
	return Engine.IsDemoPlaying()
end

function IsDemoClipPlaying()
	return Engine.IsDemoClipPlaying()
end

function IsDemoClipPreviewRunning()
	return Engine.IsDemoClipPreviewRunning()
end

local f0_local12 = function ()
	local f698_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
	if f698_local0 then
		return Engine.GetModelValue( f698_local0 )
	else
		return Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK
	end
end

function IsDemoRestrictedBasicMode()
	return CoD.DemoUtility.IsRestrictedBasicMode()
end

function IsDemoContextBasicMode()
	return f0_local12() == Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC
end

function IsDemoContextPlaybackMode()
	return f0_local12() == Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK
end

function IsDemoContextDirectorMode()
	return f0_local12() == Enum.demoContextMode.DEMO_CONTEXT_MODE_DIRECTOR
end

function IsDemoContextObjectLinkMode()
	return f0_local12() == Enum.demoContextMode.DEMO_CONTEXT_MODE_OBJECT_LINK
end

function IsDemoContextLighterMode()
	return f0_local12() == Enum.demoContextMode.DEMO_CONTEXT_MODE_LIGHTER
end

function ReachedLowestTimeScale()
	if 0.1 >= CoD.DemoUtility.GetRoundedTimeScale() then
		return true
	else
		return false
	end
end

function ReachedHighestTimeScale()
	if Dvar.demo_maxTimeScale:get() <= CoD.DemoUtility.GetRoundedTimeScale() then
		return true
	else
		return false
	end
end

function ShouldAddDollyCameraMarker( f707_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif IsGlobalModelValueGreaterThan( f707_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldEditDollyCameraMarker( f708_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f708_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f708_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingDollyCameraMarker( f709_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f709_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f709_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningDollyCameraMarker( f710_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f710_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f710_arg0, "demo.isRepositioningDollyCamMarker" ) then
		return false
	else
		return true
	end
end

function IsFreeCameraLockedOnEntity( f711_arg0 )
	if not IsGlobalModelValueTrue( nil, f711_arg0, "demo.isFreeCameraLockedOnEntity" ) then
		return false
	else
		return true
	end
end

function CanFreeCameraLockOnEntity( f712_arg0 )
	if not IsGlobalModelValueTrue( nil, f712_arg0, "demo.isFreeCameraEntityLockOnAllowed" ) then
		return false
	elseif not IsGlobalModelValueGreaterThan( f712_arg0, "demo.highlightedFreeCameraLockOnEntity", 0 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f712_arg0, "demo.isFreeCameraLockedOnEntityActive" ) then
		return false
	else
		return true
	end
end

function ShouldAddLightmanMarker( f713_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif IsGlobalModelValueGreaterThan( f713_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldEditLightmanMarker( f714_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f714_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f714_arg0, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingLightmanMarker( f715_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f715_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f715_arg0, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningLightmanMarker( f716_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f716_arg0, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f716_arg0, "demo.isRepositioningLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsInLightmanColorPicker( f717_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f717_arg0, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f717_arg0, "demo.showLightmanColorPicker" ) then
		return false
	else
		return true
	end
end

function ReachedLowestLightmanFloatParamValue( f718_arg0, f718_arg1 )
	if not f718_arg0.btnId then
		return true
	end
	local f718_local0 = nil
	if f718_arg0.btnId == "lightmanlightintensity" then
		f718_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f718_arg0.btnId == "lightmanlightrange" then
		f718_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f718_local0 then
		return true
	elseif Engine.GetModelValue( f718_local0 ) < 0.19 then
		return true
	end
	return false
end

function ReachedHighestLightmanFloatParamValue( f719_arg0, f719_arg1 )
	if not f719_arg0.btnId then
		return true
	end
	local f719_local0 = nil
	if f719_arg0.btnId == "lightmanlightintensity" then
		f719_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f719_arg0.btnId == "lightmanlightrange" then
		f719_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f719_local0 then
		return true
	elseif Engine.GetModelValue( f719_local0 ) > 9.91 then
		return true
	end
	return false
end

function IsSegmentInSelectedState( f720_arg0, f720_arg1 )
	local f720_local0 = CoD.Timeline_GetSelectedSegmentModel()
	if f720_local0 and f720_local0 == f720_arg0:getModel() then
		local f720_local1 = Engine.GetModel( f720_local0, "selected" )
		if f720_local1 then
			return Engine.GetModelValue( f720_local1 )
		end
	end
	return false
end

function IsSegmentSelectedForMove( f721_arg0, f721_arg1 )
	return false
end

function SegmentCountGreaterThan( f722_arg0, f722_arg1 )
	return f722_arg1 < Engine.GetDemoSegmentCount()
end

function HideVehicleReticle( f723_arg0, f723_arg1, f723_arg2 )
	local f723_local0 = nil
	if f723_arg2.modelName == "vehicleType" then
		f723_local0 = f723_arg2.modelValue
	end
	if not f723_local0 then
		local f723_local1 = f723_arg0:getModel( f723_arg1, "vehicleType" )
		if f723_local1 then
			f723_local0 = Engine.GetModelValue( f723_local1 )
		end
	end
	return f723_local0 == "spawner_enemy_54i_vehicle_raps_suicide_player"
end

function VehicleHasEnemyLock( f724_arg0, f724_arg1 )
	local f724_local0 = IsSelfEnumModelValueTrue( f724_arg0, f724_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP )
	if not f724_local0 then
		f724_local0 = IsSelfEnumModelValueTrue( f724_arg0, f724_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN )
		if not f724_local0 then
			f724_local0 = IsSelfEnumModelValueTrue( f724_arg0, f724_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT )
			if not f724_local0 then
				f724_local0 = IsSelfEnumModelValueTrue( f724_arg0, f724_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT )
			end
		end
	end
	return f724_local0
end

function IsVehicleRAPS( f725_arg0 )
	return IsVehicleOfType( f725_arg0, "raps" )
end

function IsVehicleOfType( f726_arg0, ... )
	local f726_local0 = {
		n = select( "#", ... ),
		...
	}
	local f726_local1 = Engine.GetModel( Engine.GetModelForController( f726_arg0 ), "vehicle.vehicleType" )
	if f726_local1 then
		local f726_local2 = Engine.GetModelValue( f726_local1 )
		if f726_local2 then
			for f726_local6, f726_local7 in ipairs( f726_local0 ) do
				if string.find( f726_local2, "_" .. f726_local7 ) then
					return true
				end
			end
		end
	end
	return false
end

function IsSelfPlayerName( f727_arg0, f727_arg1 )
	local f727_local0 = f727_arg0:getModel( f727_arg1, "isSelfPlayerName" )
	local f727_local1 = false
	if f727_local0 then
		f727_local1 = Engine.GetModelValue( f727_local0 )
	end
	return f727_local1
end

function ShouldDisplayFactionIconAtPrematchCountdown()
	return CoDShared.IsGametypeTeamBased()
end

function MapVoteInState( f729_arg0 )
	local f729_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if f729_local0 == nil then
		return false
	end
	local f729_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f729_local1 then
		local f729_local2 = LobbyData:UITargetFromId( f729_local1 )
		if f729_local2.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
			return false
		end
	end
	return tonumber( f729_arg0 ) == Engine.GetModelValue( f729_local0 )
end

function MapVoteTimerActive()
	local f730_local0 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f730_local0 == nil then
		return false
	end
	local f730_local1 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f730_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.TESTING then
		return false
	end
	local f730_local2 = Engine.GetModelValue( f730_local0 )
	local f730_local3
	if f730_local2 == nil or f730_local2 == 0 then
		f730_local3 = false
	else
		f730_local3 = true
	end
	return f730_local3
end

function IsScorestreakEquipped( f731_arg0, f731_arg1, f731_arg2 )
	local f731_local0 = f731_arg1:getModel( f731_arg2, "itemIndex" )
	if f731_local0 then
		local f731_local1 = Engine.GetModelValue( f731_local0 )
		if f731_local1 ~= CoD.CACUtility.EmptyItemIndex then
			return CoD.CACUtility.GetAttachedItemSlot( f731_arg0:getModel(), f731_local1, CoD.CACUtility.KillstreakNameList ) ~= nil
		end
	end
	return false
end

function IsValidScorestreakIndex( f732_arg0, f732_arg1 )
	local f732_local0 = f732_arg0:getModel( f732_arg1, "itemIndex" )
	if f732_local0 then
		return Engine.GetModelValue( f732_local0 ) ~= CoD.CACUtility.EmptyItemIndex
	else
		return false
	end
end

function IsGamepad( f733_arg0 )
	return CoD.useController and Engine.LastInput_Gamepad( f733_arg0 )
end

function IsMouse( f734_arg0 )
	return CoD.useMouse and Engine.LastInput_Mouse( f734_arg0 )
end

function IsDurangoGamepad( f735_arg0 )
	local f735_local0 = IsDurango()
	if not f735_local0 then
		f735_local0 = IsPC()
		if f735_local0 then
			f735_local0 = Engine.GamepadType( f735_arg0 ) == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO
		end
	end
	return f735_local0
end

function IsOrbisGamepad( f736_arg0 )
	local f736_local0
	if not IsOrbis() or Engine.LastInput_Vita( f736_arg0 ) then
		f736_local0 = IsPC()
		if f736_local0 then
			if Engine.GamepadType( f736_arg0 ) ~= Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
				f736_local0 = false
			else
				f736_local0 = true
			end
		end
	else
		f736_local0 = true
	end
	return f736_local0
end

function IsVitaGamepad( f737_arg0 )
	return IsOrbis() and Engine.LastInput_Vita( f737_arg0 )
end

function AutomaticallyOpenAAR( f738_arg0 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) > 1 or Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
		return false
	else
		local f738_local0 = CoD.GetPlayerStats( f738_arg0 )
		local f738_local1 = f738_local0.AfterActionReportStats.lobbyPopup:get()
		if f738_local1 == "summary" or f738_local1 == "promotion" then
			return true
		else
			
		end
	end
end

function WasCampaignSoloGame( f739_arg0 )
	return Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES ) == 1
end

function IsAARValid( f740_arg0 )
	if CoD.AARUtility.UseTestData() then
		return true
	else
		local f740_local0 = CoD.GetPlayerStats( f740_arg0, CoD.STATS_LOCATION_STABLE )
		if not f740_local0 or not f740_local0.PlayerStatsList or not f740_local0.PlayerStatsList.RANK or not f740_local0.PlayerStatsList.RANK.StatValue or not f740_local0.PlayerStatsList.RANK.StatValue:get() then
			return false
		else
			local f740_local1 = CoD.GetPlayerStats( f740_arg0 )
			if f740_local1.AfterActionReportStats.lobbyPopup:get() == "summary" then
				return true
			else
				f740_local1 = Engine.GetModel( Engine.GetModelForController( f740_arg0 ), "aarType" )
				if f740_local1 then
					local f740_local2 = Engine.GetModelValue( f740_local1 )
					local f740_local3
					if (not IsLAN() or f740_local2 ~= "lan") and (IsLAN() or f740_local2 ~= "custom" and f740_local2 ~= "public") then
						f740_local3 = false
					else
						f740_local3 = true
					end
					return f740_local3
				else
					
				end
			end
		end
	end
end

function CanShowAAR( f741_arg0 )
	local f741_local0 = Engine.IsMultiplayerGame()
	local f741_local1 = Engine.IsZombiesGame()
	if IsFreeRunLobby() then
		return false
	elseif IsInTheaterMode() then
		return false
	elseif not f741_local0 then
		local f741_local2 = f741_local1
	end
	local f741_local3 = CoD.AARUtility.UseTestData()
	if not f741_local3 then
		f741_local3 = f741_local2 and Engine.IsStableStatsBufferInitialized( f741_arg0 )
	end
	return f741_local3
end

function AnyRewardsEarnedDuringMatch( f742_arg0 )
	return CoD.AARUtility.AnyRewardsEarnedDuringMatch( f742_arg0 )
end

function HasFriends( f743_arg0 )
	return Engine.GetFriendsCount( f743_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function HasRecentPlayers( f744_arg0 )
	return Engine.GetRecentPlayersCount( f744_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function IsSocialPlayersListEmpty( f745_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
	if modelValue ~= nil then
		if modelValue == "friends" then
			return HasFriends( f745_arg0 )
		elseif modelValue == "recent" then
			return HasRecentPlayers( f745_arg0 )
		end
	end
	return false
end

function IsOffline( f746_arg0, f746_arg1 )
	local f746_local0 = f746_arg0:getModel( f746_arg1, "activity" )
	if f746_local0 then
		local f746_local1 = Engine.GetModelValue( f746_local0 )
	elseif value == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return true
	end
	return false
end

function IsInTitle( f747_arg0, f747_arg1 )
	local f747_local0 = f747_arg0:getModel( f747_arg1, "activity" )
	if f747_local0 then
		local f747_local1 = Engine.GetModelValue( f747_local0 )
		if f747_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
			return false
		elseif f747_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
			return false
		end
	end
	return true
end

function IsJoinable( f748_arg0, f748_arg1 )
	if LuaUtils.LobbyIsLocked() then
		return false
	end
	local f748_local0 = f748_arg0:getModel( f748_arg1, "joinable" )
	if f748_local0 then
		local f748_local1 = Engine.GetModelValue( f748_local0 )
		if f748_local1 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES then
			return true
		elseif f748_local1 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
			local f748_local2 = f748_arg0:getModel( f748_arg1, "friend" )
			if f748_local2 and Engine.GetModelValue( f748_local2 ) then
				return true
			end
		end
	end
	return false
end

function IsSocialPartyLeader( f749_arg0, f749_arg1 )
	local f749_local0 = f749_arg0:getModel( f749_arg1, "leader" )
	if (f749_local0 and Engine.GetModelValue( f749_local0 )) == 1 then
		return true
	else
		return false
	end
end

function HideWinnersLabelsAndInfo( f750_arg0 )
	local f750_local0 = Engine.GetModel( Engine.GetModelForController( f750_arg0 ), "gameScore.draw" )
	local f750_local1 = Engine.GetGametypeSetting( "teamCount" ) < 2
	if f750_local0 then
		f750_local0 = Engine.GetModelValue( f750_local0 )
	end
	if f750_local0 or f750_local1 then
		return true
	else
		
	end
end

function IsOutcomeVictory( f751_arg0 )
	local f751_local0 = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f751_local1 = f751_local0 and Engine.GetModelValue( f751_local0 )
	local f751_local2 = Engine.GetModel( perControllerModel, "gameScore.victory" )
	local f751_local3 = f751_local2 and Engine.GetModelValue( f751_local2 )
	local f751_local4
	if not f751_local1 then
		f751_local4 = f751_local3
	else
		f751_local4 = false
	end
	return f751_local4
end

function IsOutcomeDefeat( f752_arg0 )
	local f752_local0 = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f752_local1 = f752_local0 and Engine.GetModelValue( f752_local0 )
	local f752_local2 = Engine.GetModel( perControllerModel, "gameScore.defeat" )
	local f752_local3 = f752_local2 and Engine.GetModelValue( f752_local2 )
	local f752_local4
	if not f752_local1 then
		f752_local4 = f752_local3
	else
		f752_local4 = false
	end
	return f752_local4
end

function IsScoreboardPingAsBars( f753_arg0, f753_arg1 )
	return Dvar.cg_ScoresPing_Interval:get() > 1
end

function ScoreboardVisible( f754_arg0 )
	local f754_local0 = Engine.IsVisibilityBitSet( f754_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f754_local0 then
		f754_local0 = IsModelValueEqualTo( f754_arg0, "forceScoreboard", 1 )
	end
	return f754_local0
end

function IsScoreboardPlayerMuted( f755_arg0, f755_arg1 )
	return Engine.IsPlayerMutedByClientNum( f755_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, CoD.SafeGetModelValue( f755_arg1:getModel(), "clientNum" ) )
end

function ScoreboardMuteButtonPromptHidden( f756_arg0, f756_arg1 )
	if not ScoreboardVisible( f756_arg1 ) then
		return true
	elseif CoD.IsShoutcaster( f756_arg1 ) then
		return true
	end
	local f756_local0 = Engine.GetModel( Engine.GetModelForController( f756_arg1 ), "scoreboardInfo.muteButtonPromptVisible" )
	if f756_local0 and not Engine.GetModelValue( f756_local0 ) then
		return true
	end
	local f756_local1 = CoD.SafeGetModelValue( f756_arg0:getModel(), "clientNum" )
	local f756_local2
	if f756_local1 ~= nil and Engine.GetMatchScoreboardClientXuid( f756_local1 ) ~= nil then
		f756_local2 = false
	else
		f756_local2 = true
	end
	return f756_local2
end

function ScoreboardCanShowGamerCard( f757_arg0, f757_arg1 )
	if not CoD.isDurango then
		return false
	else
		local f757_local0 = CoD.SafeGetModelValue( f757_arg0:getModel(), "clientNum" )
		if f757_local0 == nil or f757_local0 < 0 then
			return false
		else
			return Engine.GetMatchScoreboardClientXuid( f757_local0 ) ~= nil
		end
	end
end

function IsScoreboardPlayerSelf( f758_arg0, f758_arg1 )
	local f758_local0 = f758_arg0:getModel( f758_arg1, "clientNum" )
	if f758_local0 then
		if CoD.IsShoutcaster( f758_arg1 ) then
			return Engine.GetPredictedClientNum( f758_arg1 ) == Engine.GetModelValue( f758_local0 )
		elseif CoD.isPC then
			local f758_local1 = Engine.GetModelValue( f758_local0 )
			if f758_local1 and f758_local1 >= 0 then
				return Engine.GetMatchScoreboardClientXuid( f758_local1 ) == Engine.GetXUID64( f758_arg1 )
			end
		else
			return string.gsub( GetScoreboardPlayerName( f758_arg1, Engine.GetModelValue( f758_local0 ) ), "%[.+%]", "" ) == Engine.GetSelfGamertag( f758_arg1 )
		end
	end
	return false
end

function ShowMatchBonus( f759_arg0, f759_arg1 )
	local f759_local0 = Engine.GetModelForController( f759_arg1 )
	local f759_local1 = Engine.GetModel( f759_local0, "gameScore.isRoundEnd" )
	local f759_local2 = Engine.GetModel( f759_local0, "gameScore.matchBonus" )
	local f759_local3 = 0
	if f759_local2 then
		f759_local3 = Engine.GetModelValue( f759_local2 )
	end
	local f759_local4
	if (f759_local1 and Engine.GetModelValue( f759_local1 )) or f759_local3 == 0 then
		f759_local4 = false
	else
		f759_local4 = true
	end
	return f759_local4
end

function IsVictory( f760_arg0 )
	local f760_local0 = Engine.GetModelForController( f760_arg0 )
	local f760_local1 = Engine.GetModel( f760_local0, "gameScore.isRoundEnd" )
	local f760_local2 = f760_local1 and Engine.GetModelValue( f760_local1 )
	local f760_local3 = Engine.GetModel( f760_local0, "gameScore.victory" )
	local f760_local4 = f760_local3 and Engine.GetModelValue( f760_local3 )
	local f760_local5
	if not f760_local2 then
		f760_local5 = f760_local4
	else
		f760_local5 = false
	end
	return f760_local5
end

function IsDefeat( f761_arg0 )
	local f761_local0 = Engine.GetModelForController( f761_arg0 )
	local f761_local1 = Engine.GetModel( f761_local0, "gameScore.isRoundEnd" )
	local f761_local2 = f761_local1 and Engine.GetModelValue( f761_local1 )
	local f761_local3 = Engine.GetModel( f761_local0, "gameScore.defeat" )
	local f761_local4 = f761_local3 and Engine.GetModelValue( f761_local3 )
	local f761_local5
	if not f761_local2 then
		f761_local5 = f761_local4
	else
		f761_local5 = false
	end
	return f761_local5
end

function IsStarterPack( f762_arg0 )
	return CoD.isPC and Engine.IsStarterPack()
end

function IsFreeRunPreStart( f763_arg0 )
	local f763_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f763_arg0 ), "FreeRun" ), "runState" )
	local f763_local1 = false
	if Engine.GetModelValue( f763_local0 ) == 0 then
		f763_local1 = true
	end
	return f763_local1
end

function IsFreeRunPreStarted( f764_arg0 )
	local f764_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f764_arg0 ), "FreeRun" ), "runState" )
	local f764_local1 = false
	if Engine.GetModelValue( f764_local0 ) == 1 then
		f764_local1 = true
	end
	return f764_local1
end

function IsFreeRunFinished( f765_arg0 )
	local f765_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f765_arg0 ), "FreeRun" ), "runState" )
	local f765_local1 = false
	if Engine.GetModelValue( f765_local0 ) == 2 then
		f765_local1 = true
	end
	return f765_local1
end

function ShouldShowFreerunTimeClips( f766_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f766_arg0 ), "FreeRun.freeRunInfo.bestTime" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	else
		return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f766_arg0 ), "FreeRun.runState" ) ) == CoD.FreerunUtility.FR_STATE_RUNNING
	end
end

function IsFreeRunMap( f767_arg0 )
	if CoD.mapsTable[f767_arg0] then
		local f767_local0
		if CoD.mapsTable[f767_arg0].isFreeRunMap == nil or CoD.mapsTable[f767_arg0].isFreeRunMap ~= true then
			f767_local0 = false
		else
			f767_local0 = true
		end
		return f767_local0
	else
		return false
	end
end

function IsFreeRunLobby()
	local f768_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f768_local0 == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f768_local0 == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		return true
	else
		return false
	end
end

function ShouldShowPartyPrivacy( f769_arg0 )
	local f769_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f769_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f769_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f769_local1 and f769_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f769_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f769_local2 ) then
		return false
	else
		local f769_local3 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
		if f769_local3.maxClients <= 1 then
			return false
		else
			return true
		end
	end
end

function ShouldShowLeaveParty( f770_arg0 )
	local f770_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f770_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f770_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f770_local1 and f770_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f770_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f770_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f770_local2 )
	if #f770_local3.sessionClients == 1 then
		return false
	end
	local f770_local4 = 0
	for f770_local8, f770_local9 in ipairs( f770_local3.sessionClients ) do
		if f770_local9.isLocal == true then
			f770_local4 = f770_local4 + 1
		end
	end
	if f770_local4 == #f770_local3.sessionClients then
		return false
	end
	return true
end

function ShouldShowPromotePlayer( f771_arg0 )
	return false
end

function ShouldShowBootPlayer( f772_arg0 )
	local f772_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f772_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f772_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f772_local1 and f772_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f772_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f772_local2 ) then
		return false
	end
	local f772_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f772_local2 )
	if #f772_local3.sessionClients == 1 then
		return false
	end
	local f772_local4 = 0
	for f772_local8, f772_local9 in ipairs( f772_local3.sessionClients ) do
		if f772_local9.isLocal == true then
			f772_local4 = f772_local4 + 1
		end
	end
	if f772_local4 == #f772_local3.sessionClients then
		return false
	end
	return true
end

function IsBleedOutVisible( f773_arg0, f773_arg1 )
	local f773_local0 = f773_arg0:getModel( f773_arg1, "stateFlags" )
	if f773_local0 then
		local f773_local1 = Engine.GetModelValue( f773_local0 )
		if f773_local1 ~= nil then
			return CoD.BitUtility.IsAnyBitSet( f773_local1, {
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT,
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED
			} )
		end
	end
	return false
end

function DropDownListIsInUse( f774_arg0 )
	return f774_arg0.inUse
end

function CheckBoxOptionChecked( f775_arg0, f775_arg1 )
	local f775_local0 = nil
	if f775_arg1.menu then
		f775_local0 = f775_arg1.menu.m_ownerController
	else
		f775_local0 = f775_arg1.controller
	end
	local f775_local1 = f775_arg0:getModel()
	if f775_local1 then
		local f775_local2 = CoD.PCUtil.GetOptionInfo( f775_local1, f775_local0 )
		if type( f775_local2.currentValue ) == "number" then
			return math.abs( f775_local2.currentValue - f775_local2.highValue ) < 0.01
		elseif type( f775_local2.currentValue ) == "string" then
			return f775_local2.currentValue == f775_local2.highValue
		end
	end
	return false
end

function MouseButtonEnabled( f776_arg0 )
	return f776_arg0.handleMouseButton ~= false
end

function ShouldOpenGraphicsConfirm( f777_arg0, f777_arg1, f777_arg2 )
	return CoD.PCUtil.IsOptionsDirty( f777_arg2 )
end

function ShouldHideButtonPromptForPC( f778_arg0, f778_arg1 )
	if CoD.isPC then
		local f778_local0 = CoD.PCUtil.GetElementModelValues( f778_arg0, {
			"Button",
			"Label"
		} )
		if f778_local0 and (f778_local0.Label == "" or f778_local0.Label == "MENU_SELECT" and f778_local0.Button == Enum.LUIButton.LUI_KEY_XBA_PSCROSS) then
			return true
		end
	end
	return false
end

function DropdownListIsInUse_Console( f779_arg0 )
	return f779_arg0.inUse
end

function ShouldShowMOTD( f780_arg0 )
	return Engine.ShouldShowMOTD( f780_arg0 )
end

function ShouldShowMtxCommsMOTD( f781_arg0 )
	if Dvar.ui_execdemo_beta:get() then
		return 
	elseif Engine.GetMarketingMessage( f781_arg0, "motd" ) ~= nil then
		return true
	else
		return false
	end
end

function ShouldShowMtxCommsMOTDPopup( f782_arg0 )
	local f782_local0 = Engine.GetMarketingMessage( f782_arg0, "motd" )
	if f782_local0 ~= nil and f782_local0.messageViewReported ~= true then
		return true
	else
		return false
	end
end

function FeaturedWidgetVisible( f783_arg0 )
	local f783_local0 = IsMainModeInvalidAndNotTheaterMode()
	if f783_local0 then
		if not IsLAN() then
			f783_local0 = not ShouldShowMtxCommsMOTD( f783_arg0 )
		else
			f783_local0 = false
		end
	end
	return f783_local0
end

function FeaturedWidgetControllerVisible( f784_arg0 )
	local f784_local0 = Engine.GetFeaturedCardsData()
	if f784_local0 ~= nil and f784_local0.validCardsCount >= 2 then
		return true
	else
		return false
	end
end

function IsBubbleGumBuffEquipped( f785_arg0, f785_arg1, f785_arg2 )
	local f785_local0 = f785_arg1:getModel()
	if not f785_local0 then
		return false
	end
	local f785_local1 = Engine.GetModel( f785_local0, "itemIndex" )
	if not f785_local1 then
		return false
	end
	local f785_local2 = Engine.GetModelValue( f785_local1 )
	local f785_local3 = Engine.GetEquippedBubbleGumPack( f785_arg2 )
	for f785_local4 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f785_arg2, f785_local3, f785_local4 ) == f785_local2 then
			return true
		end
	end
	return false
end

function IsLobbyBubbleGumConsumable( f786_arg0, f786_arg1, f786_arg2 )
	local f786_local0 = f786_arg0:getModel( f786_arg1, "bgb" .. f786_arg2 .. "ItemIndex" )
	if not f786_local0 then
		return false
	else
		return CoD.CACUtility.IsItemConsumable( Engine.GetModelValue( f786_local0 ) )
	end
end

local f0_local13 = function ( f787_arg0, f787_arg1, f787_arg2, f787_arg3 )
	local f787_local0 = f787_arg0:getModel( f787_arg1, f787_arg2 )
	if not f787_local0 then
		return false
	elseif not CoD.CACUtility.IsItemConsumable( Engine.GetModelValue( f787_local0 ) ) then
		return false
	else
		local f787_local1 = f787_arg0:getModel( f787_arg1, f787_arg3 )
		if not f787_local1 then
			return false
		else
			return Engine.GetModelValue( f787_local1 ) == 0
		end
	end
end

function IsOutOfLobbyBubbleGum1( f788_arg0, f788_arg1 )
	return f0_local13( f788_arg0, f788_arg1, "bgb1ItemIndex", "bgb1Remaining" )
end

function IsOutOfLobbyBubbleGum2( f789_arg0, f789_arg1 )
	return f0_local13( f789_arg0, f789_arg1, "bgb2ItemIndex", "bgb2Remaining" )
end

function IsOutOfLobbyBubbleGum3( f790_arg0, f790_arg1 )
	return f0_local13( f790_arg0, f790_arg1, "bgb3ItemIndex", "bgb3Remaining" )
end

function IsOutOfLobbyBubbleGum4( f791_arg0, f791_arg1 )
	return f0_local13( f791_arg0, f791_arg1, "bgb4ItemIndex", "bgb4Remaining" )
end

function IsOutOfLobbyBubbleGum5( f792_arg0, f792_arg1 )
	return f0_local13( f792_arg0, f792_arg1, "bgb5ItemIndex", "bgb5Remaining" )
end

function HasBGBTokensRemaining( f793_arg0, f793_arg1 )
	if Engine.GetZMVials( f793_arg1 ) > 0 == false then
		return false
	else
		return Engine.GetModelValue( f793_arg0:getModel( f793_arg1, "price" ) ) <= Engine.GetZMVials( f793_arg1 )
	end
end

function IsShowcaseWeaponEquipped( f794_arg0, f794_arg1 )
	local f794_local0 = CoD.CCUtility.customizationMode
	local f794_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f794_local2 = Engine.GetModel( f794_arg0:getModel(), "itemIndex" )
	if not f794_local2 then
		return false
	else
		return Engine.GetModelValue( f794_local2 ) == Engine.GetHeroShowcaseWeaponAttribute( f794_arg1, f794_local0, f794_local1, "weaponIndex" )
	end
end

function InCharacterCustomizationMode( f795_arg0 )
	return CoD.CCUtility.customizationMode == f795_arg0
end

function CharacterHasAnyWeaponUnlocked( f796_arg0, f796_arg1 )
	if not IsProgressionEnabled( f796_arg0 ) and (not IsLive() or not IsFirstTimeSetup( f796_arg0, Enum.eModes.MODE_MULTIPLAYER )) then
		return true
	end
	local f796_local0 = f796_arg1.heroIndex
	if not f796_local0 then
		f796_local0 = CoD.SafeGetModelValue( f796_arg1:getModel(), "heroIndex" )
	end
	if not f796_local0 then
		return false
	end
	for f796_local1 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f796_local4 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f796_local0, f796_local1 )
		if not Engine.IsItemLocked( f796_arg0, f796_local4.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.IsItemPurchased( f796_arg0, f796_local4.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) then
			return true
		end
	end
	return false
end

function HasStoreItems( f797_arg0 )
	return #Engine.GetStoreProductsByCategory( f797_arg0, CoD.SelectedStoreCategory ) > 0
end

function HidePurchaseAndPrice()
	if IsOrbis() or IsBooleanDvarSet( "live_store_hideprice" ) then
		return true
	else
		return false
	end
end

function IsDemoBuild()
	return Dvar.ui_execdemo:get()
end

function IsDemoBuildCP()
	return Dvar.ui_execdemo_cp:get()
end

function IsDemoBuildBeta()
	return Dvar.ui_execdemo_beta:get()
end

function DisableStore()
	if not Dvar.live_store_enable:get() then
		return true
	elseif CoD.isPC then
		return true
	elseif IsOrbis() and Dvar.live_store_disable_lang:exists() and Dvar.live_store_disable_lang:get() == Dvar.loc_availableLanguages:get() and Dvar.live_store_disable_region:exists() and Dvar.live_store_disable_region:get() == Engine.GetSkuRegion() then
		return true
	else
		return false
	end
end

function DisableBlackMarket()
	return false
end

function DisableSteamStore()
	return not CoD.isPC
end

function ShouldOpenGraphicsAndSoundOptions()
	if IsDurango() then
		return true
	else
		local f805_local0
		if Dvar.ui_execdemo:get() then
			f805_local0 = Dvar.ui_execdemo:get()
			if f805_local0 then
				f805_local0 = Dvar.ui_execdemo_beta:get()
			end
		else
			f805_local0 = true
		end
	end
	return f805_local0
end

function ShouldOpenSocialOptions()
	return false
end

function ShouldOpenMutingOptions()
	return not Dvar.ui_execdemo_gamescom:get()
end

function IsGamesComBuild()
	return LuaUtils.IsGamescomBuild()
end

function ShouldOpenNetworkOptions()
	return true
end

function IsBlackhatHacking( f810_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f810_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Hacking
end

function IsBlackhatBreaching( f811_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f811_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Breaching
end

function IsBrightnessSliderPipEmpty( f812_arg0 )
	local f812_local0 = f812_arg0.gridInfoTable.zeroBasedIndex
	local f812_local1 = f812_arg0.gridInfoTable.parentGrid.activeWidget
	local f812_local2 = 0
	if f812_local1 then
		f812_local2 = f812_local1.gridInfoTable.zeroBasedIndex
	end
	if f812_local2 < f812_local0 then
		return true
	else
		
	end
end

function IsAlertOverlay( f813_arg0, f813_arg1 )
	local f813_local0 = f813_arg0:getModel( f813_arg1, "categoryType" )
	if f813_local0 then
		local f813_local1 = Engine.GetModelValue( f813_local0 )
		local f813_local2
		if f813_local1 ~= CoD.OverlayUtility.OverlayTypes.Alert and f813_local1 ~= CoD.OverlayUtility.OverlayTypes.Error then
			f813_local2 = false
		else
			f813_local2 = true
		end
		return f813_local2
	else
		return false
	end
end

function HasOverlayBackAction( f814_arg0 )
	return f814_arg0[CoD.OverlayUtility.GoBackPropertyName] ~= nil
end

function HasOverlayContinueAction( f815_arg0 )
	return f815_arg0[CoD.OverlayUtility.ContinuePropertyName] ~= nil
end

function IsPrimaryControllerIndex( f816_arg0 )
	if Engine.GetPrimaryController() == f816_arg0 then
		return true
	else
		return false
	end
end

function IsTriggersFlipped( f817_arg0 )
	return Engine.GetProfileVarInt( f817_arg0, "flipped_control_config" ) == 1
end

function IsCodCasterQuickSettingEnabled( f818_arg0, f818_arg1, f818_arg2 )
	if not f818_arg1.profileVar then
		return false
	else
		return CoD.ShoutcasterProfileVarBool( f818_arg2, f818_arg1.profileVar )
	end
end

function IsCodCaster( f819_arg0 )
	if CoD.IsShoutcaster( f819_arg0 ) then
		return true
	else
		return false
	end
end

function IsCodCasterProfileValueEqualTo( f820_arg0, f820_arg1, f820_arg2 )
	local f820_local0 = CoD.ShoutcasterProfileVarValue( f820_arg0, f820_arg1 )
	local f820_local1
	if f820_local0 == nil or f820_local0 ~= f820_arg2 then
		f820_local1 = false
	else
		f820_local1 = true
	end
	return f820_local1
end

function ShouldHideCodCasterHud( f821_arg0 )
	if not IsGlobalModelValueGreaterThan( f821_arg0, "scoreboard.team1.count", 0 ) and not IsGlobalModelValueGreaterThan( f821_arg0, "scoreboard.team2.count", 0 ) then
		return true
	else
		return false
	end
end

function ShouldPresentRegistration( f822_arg0 )
	local f822_local0 = Engine.GetMarketingMessage( f822_arg0, "registration" )
	if f822_local0 == nil or f822_local0.messageViewReported == true then
		return false
	else
		local f822_local1 = f822_local0.action
		if f822_local1 == "registration" then
			return true
		elseif f822_local1 == "opt-in" then
			return true
		else
			return false
		end
	end
end

function ShouldPresentMOTDBanner( f823_arg0, f823_arg1 )
	if ShouldShowMtxCommsMOTDPopup( f823_arg0 ) then
		local f823_local0 = Engine.GetMarketingMessage( f823_arg0, "motd" )
		if f823_local0 == nil or not f823_local0.hasBanner then
			return false
		else
			return true
		end
	else
		return false
	end
end

function FuseBoxVisible( f824_arg0, f824_arg1 )
	if CoD.Zombie[f824_arg1] then
		local f824_local0 = Engine.GetModel( Engine.GetModelForController( f824_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie[f824_arg1] )
		return f824_local0 and Engine.GetModelValue( f824_local0 ) == 1
	else
		
	end
end

function RocketShieldBlueprintPieceVisible( f825_arg0, f825_arg1 )
	if CoD.Zombie[f825_arg1] then
		local f825_local0 = Engine.GetModel( Engine.GetModelForController( f825_arg0 ), "zmInventory." .. CoD.Zombie[f825_arg1] )
		return f825_local0 and Engine.GetModelValue( f825_local0 ) == 1
	else
		
	end
end

function IDGunBlueprintPieceVisible( f826_arg0, f826_arg1 )
	if CoD.Zombie[f826_arg1] then
		local f826_local0 = Engine.GetModel( Engine.GetModelForController( f826_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie[f826_arg1] )
		return f826_local0 and Engine.GetModelValue( f826_local0 ) == 1
	else
		
	end
end

function SummonningKeyVisible( f827_arg0 )
	local f827_local0 = Engine.GetModel( Engine.GetModelForController( f827_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY )
	return f827_local0 and Engine.GetModelValue( f827_local0 ) == 1
end

function SummoningKeyBeingUsed( f828_arg0 )
	local f828_local0 = Engine.GetModel( Engine.GetModelForController( f828_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY )
	local f828_local1 = Engine.GetModelValue( f828_local0 )
	local f828_local2 = f828_local0
	local f828_local3
	if f828_local1 <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or f828_local1 >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES then
		f828_local3 = false
	else
		f828_local3 = f828_local2 and true
	end
	return f828_local3
end

function SummoningKeyBeingUsedByOtherPlayer( f829_arg0 )
	local f829_local0 = Engine.GetModel( Engine.GetModelForController( f829_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY )
	local f829_local1 = Engine.GetModelValue( f829_local0 )
	local f829_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f829_arg0 ), "zmInventory.player_character_identity" ) )
	local f829_local3 = f829_local0
	local f829_local4
	if f829_local1 <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or f829_local1 >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES or f829_local1 == f829_local2 then
		f829_local4 = false
	else
		f829_local4 = f829_local3 and true
	end
	return f829_local4
end

local f0_local14 = function ( f830_arg0, f830_arg1 )
	local f830_local0 = Engine.GetModel( Engine.GetModelForController( f830_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. f830_arg1 .. CoD.Zombie.MEMENTO_SUFFIX )
	return f830_local0 and Engine.GetModelValue( f830_local0 ) == 1
end

function SummoningKeyMissing( f831_arg0 )
	return (f0_local14( f831_arg0, CoD.Zombie.ZOD_NAME_FEMME ) or f0_local14( f831_arg0, CoD.Zombie.ZOD_NAME_DETECTIVE ) or f0_local14( f831_arg0, CoD.Zombie.ZOD_NAME_BOXER ) or f0_local14( f831_arg0, CoD.Zombie.ZOD_NAME_MAGICIAN )) and not SummonningKeyVisible( f831_arg0 )
end

function IsRitualItemInState( f832_arg0, f832_arg1, f832_arg2 )
	if CoD.Zombie[f832_arg1] and CoD.Zombie[f832_arg2] then
		local f832_local0 = Engine.GetModel( Engine.GetModelForController( f832_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie[f832_arg1] )
		return f832_local0 and Engine.GetModelValue( f832_local0 ) == CoD.Zombie[f832_arg2]
	else
		
	end
end

function IsRitualItemHeldBy( f833_arg0, f833_arg1, f833_arg2 )
	if CoD.Zombie[f833_arg1] and CoD.Zombie[f833_arg2] then
		local f833_local0 = Engine.GetModel( Engine.GetModelForController( f833_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie[f833_arg1] )
		return f833_local0 and Engine.GetModelValue( f833_local0 ) == CoD.Zombie[f833_arg2]
	else
		
	end
end

function IsRitualItemMissing( f834_arg0, f834_arg1 )
	if CoD.Zombie[f834_arg1] then
		local f834_local0 = Engine.GetModel( Engine.GetModelForController( f834_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[f834_arg1] .. CoD.Zombie.MEMENTO_SUFFIX )
		return f834_local0 and Engine.GetModelValue( f834_local0 ) == 1 and IsRitualItemInState( f834_arg0, f834_arg1, "CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_MEMENTO" )
	else
		
	end
end

function IsRitualItemBeingUsed( f835_arg0, f835_arg1 )
	if CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. f835_arg1] then
		local f835_local0 = Engine.GetModel( Engine.GetModelForController( f835_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY_LOCATION )
		return f835_local0 and Engine.GetModelValue( f835_local0 ) == CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. f835_arg1]
	else
		
	end
end

function IsRitualItemWithAnotherPlayer( f836_arg0, f836_arg1 )
	if CoD.Zombie[f836_arg1] then
		local f836_local0 = Engine.GetModel( Engine.GetModelForController( f836_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[f836_arg1] .. CoD.Zombie.MEMENTO_SUFFIX )
		return f836_local0 and Engine.GetModelValue( f836_local0 ) == 1 and not IsRitualItemHeldBy( f836_arg0, f836_arg1, CoD.Zombie.GetCharacterEnumString( Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f836_arg0 ), "zmInventory.player_character_identity" ) ) ) )
	else
		
	end
end

function SprayerMissing( f837_arg0 )
	local f837_local0 = Engine.GetModel( Engine.GetModelForController( f837_arg0 ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HINT_RANGE )
	local f837_local1 = f837_local0
	local f837_local2
	if Engine.GetModelValue( f837_local0 ) == 1 then
		f837_local2 = not SprayerFound( f837_arg0 )
	else
		f837_local2 = false
	end
	return f837_local2
end

function SprayerFound( f838_arg0 )
	local f838_local0 = Engine.GetModel( Engine.GetModelForController( f838_arg0 ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HELD )
	return f838_local0 and Engine.GetModelValue( f838_local0 ) == 1
end

function SprayerInUse( f839_arg0 )
	local f839_local0 = Engine.GetModel( Engine.GetModelForController( f839_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_USING_SPRAYER )
	return f839_local0 and Engine.GetModelValue( f839_local0 ) == 1
end

function ShowQuestItemsWidget( f840_arg0 )
	local f840_local0 = Engine.GetModel( Engine.GetModelForController( f840_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_QUEST_ITEMS )
	return f840_local0 and Engine.GetModelValue( f840_local0 ) == 1
end

function ShowIDGunPartsWidget( f841_arg0 )
	local f841_local0 = Engine.GetModel( Engine.GetModelForController( f841_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_IDGUN_PARTS )
	return f841_local0 and Engine.GetModelValue( f841_local0 ) == 1
end

function ShowRocketShieldPartsWidget( f842_arg0 )
	local f842_local0 = Engine.GetModel( Engine.GetModelForController( f842_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_ROCKETSHIELD_PARTS )
	return f842_local0 and Engine.GetModelValue( f842_local0 ) == 1
end

function ShowFuseBoxWidget( f843_arg0 )
	local f843_local0 = Engine.GetModel( Engine.GetModelForController( f843_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_FUSES )
	return f843_local0 and Engine.GetModelValue( f843_local0 ) == 1
end

function ShowEggWidget( f844_arg0 )
	local f844_local0 = Engine.GetModel( Engine.GetModelForController( f844_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_EGG )
	return f844_local0 and Engine.GetModelValue( f844_local0 ) == 1
end

function ShowSprayerWidget( f845_arg0 )
	local f845_local0 = Engine.GetModel( Engine.GetModelForController( f845_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_SPRAYER )
	return f845_local0 and Engine.GetModelValue( f845_local0 ) == 1
end

function QuestEggInState( f846_arg0, f846_arg1 )
	if CoD.Zombie[f846_arg1] then
		local f846_local0 = Engine.GetModel( Engine.GetModelForController( f846_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_EGG_STATE )
		return f846_local0 and Engine.GetModelValue( f846_local0 ) == CoD.Zombie[f846_arg1]
	else
		
	end
end

function QuestEggQuest1Complete( f847_arg0 )
	local f847_local0 = Engine.GetModel( Engine.GetModelForController( f847_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_COMPLETED_LEVEL_1 )
	return f847_local0 and Engine.GetModelValue( f847_local0 ) == 1
end

function ChatClientShow( f848_arg0 )
	return CoD.isPC
end

function ChatClientEnabled( f849_arg0 )
	return ChatClientShow( f849_arg0 ) and Dvar.chatClientEnabled:get() == true
end

function ChatClientIsAvailable( f850_arg0, f850_arg1, f850_arg2 )
	return ChatClientEnabled( f850_arg2 ) and Engine.ChatClient_IsAvailable( f850_arg2 )
end

function ChatClientIsChatting( f851_arg0 )
	return ChatClientEnabled( f851_arg0 ) and Engine.ChatClient_IsChatting( f851_arg0 )
end

function ChatClientAnySubMenuOpen( f852_arg0 )
	if not ChatClientShow( f852_arg0 ) then
		return false
	end
	local f852_local0 = false
	local f852_local1 = CoD.ChatClientUtility.GetMenuInputChannelShowModel()
	if f852_local1 ~= nil then
		f852_local0 = Engine.GetModelValue( f852_local1 ) > 0
	end
	if not f852_local0 then
		f852_local1 = CoD.ChatClientUtility.GetMenuSettingsShowModel()
		if f852_local1 ~= nil then
			f852_local0 = Engine.GetModelValue( f852_local1 ) > 0
		end
	end
	return f852_local0
end

function CharacterCustomization_IsEnabled( f853_arg0 )
	if LuaUtils.IsGamescomBuild() or Dvar.ui_execdemo_beta:get() then
		return false
	else
		return true
	end
end

function IsArabicSku()
	if Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_ENGLISHARABIC ) and Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_ARABIC ) then
		return true
	else
		return false
	end
end

function IsChineseSku()
	if Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_TRADITIONALCHINESE ) and Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_SIMPLIFIEDCHINESE ) then
		return true
	else
		return false
	end
end

function IsJapaneseSku()
	if Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_FULLJAPANESE ) and Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_JAPANESE ) then
		return true
	else
		return false
	end
end

function IsCurrentLanguageEnglish()
	local f857_local0 = Dvar.loc_language:get()
	if f857_local0 == CoD.LANGUAGE_ENGLISH or f857_local0 == CoD.LANGUAGE_ENGLISHARABIC then
		return true
	else
		return false
	end
end

function IsCurrentTextLanguageEnglish()
	if Dvar.loc_language:get() == CoD.LANGUAGE_ENGLISH then
		return true
	else
		return false
	end
end

function IsCurrentLanguageArabic()
	if Dvar.loc_language:get() == CoD.LANGUAGE_ARABIC then
		return true
	else
		return false
	end
end

function ShouldDisplayLanguageSelectionScreen()
	if IsArabicSku() or IsJapaneseSku() then
		return true
	elseif IsChineseSku() and Dvar.loc_systemLanguage:get() ~= CoD.LANGUAGE_PORTUGUESE then
		return true
	else
		return false
	end
end

function ShouldDisplayFirstTimeLanguageSelectionScreen( f861_arg0 )
	if Engine.GetCountLanguagesInSKU() and Engine.GetCountLanguagesInSKU() > 1 then
		if Engine.IsLanguageSupportedInSKU and Engine.IsLanguageSupportedInSKU( Dvar.loc_systemLanguage:get() ) then
			return false
		elseif Dvar.loc_languageSaved:get() then
			return false
		else
			return ShouldDisplayLanguageSelectionScreen()
		end
	else
		return false
	end
end

function IsCurrentLanguageReversed()
	return Engine.IsCurrentLanguageReversed()
end

function IsFeaturedCardButtonPressed( f863_arg0 )
	local f863_local0
	if f863_arg0.button == "alt1" then
		f863_local0 = f863_arg0.down
	else
		f863_local0 = false
	end
	return f863_local0
end

function FeaturedCards_IsEnabled( f864_arg0, f864_arg1 )
	local f864_local0 = LobbyData.GetLobbyNav()
	if f864_local0 ~= LobbyData.UITargets.UI_MODESELECT.id and f864_local0 ~= LobbyData.UITargets.UI_MPLOBBYMAIN.id then
		return false
	else
		local f864_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true ), "Enabled", true ) )
		local f864_local2 = Engine.GetFeaturedCardsData()
		if Dvar.live_featuredEnabled:get() == false or f864_local2.enabled == false then
			return false
		elseif f864_local2.validCardsCount == 0 then
			return false
		else
			return true
		end
	end
end

function FeaturedCards_Update( f865_arg0, f865_arg1 )
	return true
end

function ConnectionMeter_isEnabled( f866_arg0, f866_arg1 )
	if Dvar.ui_enableConnectionMetricGraphs:get() == 0 then
		return false
	elseif Engine.ProfileInt( f866_arg1, "showConnectionMeter" ) ~= 1 then
		return false
	else
		return true
	end
end

function HighestMapReachedGreaterThan( f867_arg0, f867_arg1 )
	local f867_local0 = CoD.GetPlayerStats( f867_arg0 )
	local f867_local1 = f867_local0
	local f867_local2 = f867_local0.highestMapReached
	if f867_local2 then
		f867_local2 = f867_local1 and f867_local0.highestMapReached:get()
	end
	local f867_local3
	if f867_local2 == nil or f867_arg1 >= f867_local2 then
		f867_local3 = false
	else
		f867_local3 = true
	end
	return f867_local3
end

function MissionRecordMapComplete( f868_arg0, f868_arg1 )
	if Engine.GetDStat( f868_arg1, "PlayerStatsByMap", Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo.mapId" ) ), "hasBeenCompleted" ) == 1 then
		return true
	else
		return false
	end
end

function IsGameInstalled()
	local f869_local0
	if not Engine.IsCpStillDownloading() then
		f869_local0 = not Engine.IsMpStillDownloading()
	else
		f869_local0 = false
	end
	return f869_local0
end

function IsGameModeInstalled( f870_arg0, f870_arg1 )
	if f870_arg1 == Enum.eModes.MODE_CAMPAIGN then
		return Engine.IsCpStillDownloading() == false
	elseif f870_arg1 == Enum.eModes.MODE_MULTIPLAYER then
		return Engine.IsMpStillDownloading() == false
	elseif f870_arg1 == Enum.eModes.MODE_ZOMBIES then
		return Engine.IsZmStillDownloading() == false
	else
		return false
	end
end

function PlayGoIsStillDownloading( f871_arg0 )
	if CoD.isPC then
		return false
	elseif Engine.IsMpStillDownloading() or Engine.IsMpInitialStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsZmInitialStillDownloading() then
		return true
	else
		return false
	end
end

function ShouldShowCampaignResetOption( f872_arg0 )
	return f872_arg0 == Engine.GetPrimaryController()
end

function ZMDoubleXPWidgetVisible( f873_arg0 )
	local f873_local0 = IsZombies()
	if f873_local0 then
		if not IsLAN() then
			f873_local0 = not IsModelValueEqualTo( f873_arg0, "doubleXPTimeRemaining", 0 )
		else
			f873_local0 = false
		end
	end
	if IsInGame() then
		return f873_local0
	else
		local f873_local1
		if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 and Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) <= 1 then
			f873_local1 = false
		else
			f873_local1 = true
		end
	end
	return f873_local0 and not f873_local1
end

function IsZMDoubleXPWeekend( f874_arg0 )
	return Engine.IsDoubleXPWeekend( f874_arg0 )
end

function IsCampaignCombatRecordMode()
	return CoD.GetCombatRecordMode() == Enum.eModes.MODE_CAMPAIGN
end

function IsStorageValueAtLeast( f876_arg0, f876_arg1, f876_arg2, f876_arg3 )
	local f876_local0 = CoD.SafeGetModelValue( DataSources.StorageGlobal.getModel( f876_arg0 ), f876_arg1 )
	if f876_local0 then
		local f876_local1 = StorageLookup( f876_arg0, f876_arg2, f876_local0 )
		return f876_local1 and f876_arg3 <= tonumber( f876_local1 )
	else
		return false
	end
end

