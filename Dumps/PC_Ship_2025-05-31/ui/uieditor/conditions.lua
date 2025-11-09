require( "ui.uieditor.conditions_helper" )

function AlwaysFalse()
	return false
end

function AlwaysTrue()
	return true
end

function IsVisibilityBitSet( f3_arg0, f3_arg1 )
	if Engine.IsVisibilityBitSet( f3_arg0, f3_arg1 ) then
		return true
	else
		return false
	end
end

function MediaManagerIsBuyMoreSlot()
	local f4_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isBuyMoreSlot", false ) )
	if f4_local0 == nil then
		return false
	else
		return f4_local0
	end
end

function IsMediaManager()
	local f5_local0 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isMediaManager" )
	if f5_local0 then
		return Engine.GetModelValue( f5_local0 ) == 1
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

function MediaManagerSlotsUsed( f7_arg0 )
	return (Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "slotsUsed", false ) ) or 0) > 0
end

function MediaManagerShouldHideItemPreview( f8_arg0 )
	if MediaManagerIsBuyMoreSlot() then
		return true
	elseif not MediaManagerSlotsUsed( f8_arg0 ) then
		return true
	else
		return false
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

function FileshareIsUploading()
	if Engine.GetModelValue( CoD.FileshareUtility.GetUploadingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsUploadingInError()
	if Engine.GetModelValue( CoD.FileshareUtility.GetUploadingModel() ) == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
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

function FileshareIsSteamAgreed()
	return CoD.SteamWorkshopUtility.GetPublishSteamAgreement()
end

function FilesharePublishToSteamDisabled( f19_arg0 )
	local f19_local0
	if FileshareIsSteamAgreed() then
		f19_local0 = not FileshareIsReady( f19_arg0 )
	else
		f19_local0 = true
	end
	return f19_local0
end

function FileshareShouldAllowDownload()
	return CoD.FileshareUtility.GetPublishAllowDownload()
end

function FileshareIsReady( f21_arg0 )
	local f21_local0 = CoD.FileshareUtility.IsFileshareReady( f21_arg0 )
	if f21_local0 == 0 then
		return false
	else
		return f21_local0 == 1
	end
end

function FileshareHasContent( f22_arg0, f22_arg1 )
	local f22_local0 = FileshareIsReady( f22_arg1 )
	if f22_local0 and f22_local0 == true then
		if CoD.FileshareUtility.GetItemsCount() == 0 then
			return false
		else
			return true
		end
	else
		return false
	end
end

function FileshareHasAtLeastThisManyItems( f23_arg0, f23_arg1, f23_arg2 )
	if not FileshareIsReady( f23_arg1 ) then
		return false
	else
		return f23_arg2 <= CoD.FileshareUtility.GetItemsCount()
	end
end

function FileshareIsQuotaLineDim( f24_arg0, f24_arg1 )
	return Engine.GetModelValue( f24_arg0:getModel( f24_arg1, "isDim" ) )
end

function FileshareIsPublicOrLeagueMatch( f25_arg0, f25_arg1 )
	local f25_local0 = "matchmakingMode"
	if IsSelfModelValueNil( f25_arg0, f25_arg1, f25_local0 ) then
		return false
	elseif IsSelfModelValueEqualToEnum( f25_arg0, f25_arg1, f25_local0, Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST ) or IsSelfModelValueEqualToEnum( f25_arg0, f25_arg1, f25_local0, Enum.eGameModes.MODE_GAME_LEAGUE ) then
		return true
	else
		return false
	end
end

function FileshareIsCommunityMode( f26_arg0, f26_arg1 )
	return CoD.FileshareUtility.GetIsCommunityMode( f26_arg1 )
end

function FileshareIsCheckingPageFetchThreshold( f27_arg0 )
	local f27_local0 = CoD.FileshareUtility.GetIsCommunityMode( f27_arg0 )
	if not f27_local0 then
		f27_local0 = CoD.FileshareUtility.GetIsGroupsMode( f27_arg0 )
		if not f27_local0 then
			f27_local0 = CoD.FileshareUtility.GetCurrentCategory() == "recentgames"
		end
	end
	return f27_local0
end

function FileshareShowNormalSizeIcons( f28_arg0, f28_arg1 )
	local f28_local0 = Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "isNormalSize", false ) )
	if f28_local0 == nil then
		return true
	else
		return f28_local0
	end
end

function FileshareIsElementNormalSizeIcon( f29_arg0, f29_arg1, f29_arg2 )
	local f29_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f29_local0 == "recent" or f29_local0 == "favorites" or f29_local0 == "featured" then
		f29_local0 = CoD.SafeGetModelValue( f29_arg0:getModel(), "fileCategory" )
	end
	if CoD.FileshareUtility.ShouldSetPreviewIconSizeShort( f29_local0 ) then
		return false
	else
		return true
	end
end

function FileshareShowcaseIsPublishMode( f30_arg0, f30_arg1 )
	return FileshareGetShowcasePublishMode( f30_arg1 ) == true
end

function IsFileshareCategoryFilm( f31_arg0, f31_arg1, f31_arg2 )
	return CoD.FileshareUtility.IsCategoryFilm( f31_arg2, f31_arg1 )
end

function IsFileshareCategoryClip( f32_arg0, f32_arg1, f32_arg2 )
	return CoD.FileshareUtility.IsCategoryClip( f32_arg2, f32_arg1 )
end

function IsFileshareCategoryScreenshot( f33_arg0, f33_arg1, f33_arg2 )
	return CoD.FileshareUtility.IsCategoryScreenshot( f33_arg2, f33_arg1 )
end

function FileshareHasCurrentScreenshot( f34_arg0 )
	return CoD.currentScreenshot ~= nil
end

function FilesshareCanShowVoteOptions( f35_arg0 )
	if CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" ) == Engine.GetXUID64( f35_arg0 ) then
		return false
	else
		return true
	end
end

function FileshareCanDownloadItem( f36_arg0 )
	if CoD.FileshareUtility.CanDownload( f36_arg0 ) == false then
		return false
	else
		local f36_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
		if f36_local0 == "clip" or f36_local0 == "screenshot" then
			return false
		else
			return CoD.FileshareUtility.SelectedItemReady()
		end
	end
end

function FileshareCanPublish( f37_arg0 )
	if not isFileshareFeatureEnabled() or IsUserContentRestricted( f37_arg0 ) then
		return false
	else
		return true
	end
end

function FileshareCanDeleteItem( f38_arg0 )
	if CoD.FileshareUtility.GetIsCommunityMode( f38_arg0 ) or CoD.FileshareUtility.GetIsGroupsMode( f38_arg0 ) then
		return false
	elseif FileshareIsCurrentUserContext( f38_arg0 ) then
		return true
	else
		return false
	end
end

function FileshareIsLocalCategory( f39_arg0 )
	local f39_local0 = CoD.FileshareUtility.GetCurrentCategory()
	local f39_local1
	if f39_local0 ~= "screenshot_private" and f39_local0 ~= "clip_private" then
		f39_local1 = false
	else
		f39_local1 = true
	end
	return f39_local1
end

function FileshareCanEditNameAndDescription( f40_arg0 )
	local f40_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if FileshareIsLocalCategory( f40_arg0 ) or f40_local0 == "clip" or f40_local0 == "screenshot" or f40_local0 == "customgame" then
		return false
	else
		return true
	end
end

function FileshareCanPublishItem( f41_arg0, f41_arg1, f41_arg2 )
	local f41_local0 = true
	local f41_local1 = f41_arg1:getModel()
	if not f41_local1 then
		return false
	end
	local f41_local2 = Engine.GetModel( f41_local1, "readOnly" )
	if f41_local2 then
		local f41_local3 = Engine.GetModelValue( f41_local2 )
		if f41_local3 and f41_local3 == 1 then
			f41_local0 = false
		end
	end
	return f41_local0
end

function FileshareCanShowShowcaseManager( f42_arg0 )
	if CoD.FileshareUtility.GetIsFullscreenMode( f42_arg0 ) == true then
		return false
	elseif CoD.FileshareUtility.GetIsCommunityMode( f42_arg0 ) or CoD.FileshareUtility.GetIsGroupsMode( f42_arg0 ) then
		return false
	elseif FileshareHasContent( nil, f42_arg0 ) == false then
		return false
	elseif FileshareIsLocalCategory( f42_arg0 ) then
		return false
	elseif FileshareIsCurrentUserContext( f42_arg0 ) then
		return true
	else
		return false
	end
end

function FileshareCanShowOptionsMenu( f43_arg0 )
	if CoD.FileshareUtility.GetCurrentCategory() == "recentgames" then
		return false
	elseif FileshareHasContent( nil, f43_arg0 ) == false then
		return false
	elseif FileshareIsReady( f43_arg0 ) == false then
		return false
	else
		return DoesHaveFileshareOptions( f43_arg0 )
	end
end

function FileshareCanShowDownloadsStats( f44_arg0 )
	return CoD.FileshareUtility.CanDownload( f44_arg0 )
end

function FileshareCanOpenDetailsView( f45_arg0, f45_arg1 )
	if FileshareHasContent( nil, f45_arg1 ) == false then
		return false
	else
		return CoD.FileshareUtility.SelectedItemReady()
	end
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

function FileshareIsCurrentUserContext( f47_arg0 )
	if Engine.GetXUID64( f47_arg0 ) == CoD.FileshareUtility.GetCurrentUser() then
		return true
	else
		return false
	end
end

function IsRecentGameBookmarked( f48_arg0 )
	local f48_local0 = CoD.GetPlayerStats( f48_arg0 )
	local f48_local1 = f48_local0.AfterActionReportStats.demoFileID:get()
	if f48_local1 ~= nil and f48_local1 ~= "0" then
		return Engine.IsRecentGameBookmarked( f48_arg0, f48_local1 )
	else
		return true
	end
end

function FileshareCanShowPlayerDetails( f49_arg0 )
	if CoD.FileshareUtility.GetIsCommunityMode( f49_arg0 ) or CoD.FileshareUtility.GetIsGroupsMode( f49_arg0 ) then
		return true
	else
		return false
	end
end

function FileshareShowcaseSlotsAvailable( f50_arg0 )
	local f50_local0 = CoD.FileshareUtility.GetCurrentQuota( f50_arg0 )
	if f50_local0 and f50_local0.categorySlotsAvailable then
		return f50_local0.categorySlotsAvailable > 0
	else
		return false
	end
end

function MediaManagerSlotsAvailable( f51_arg0, f51_arg1 )
	local f51_local0 = MediaManagerGetQuotaForCategory( f51_arg0, f51_arg1 )
	if f51_local0 and f51_local0.categorySlotsAvailable then
		return f51_local0.categorySlotsAvailable > 0
	else
		return false
	end
end

function FileshareIsReadyToUpload( f52_arg0 )
	if not FileshareIsReady( f52_arg0 ) or FileshareIsUploading() then
		return false
	else
		return true
	end
end

function FileshareIsReadyToPublish( f53_arg0 )
	if not FileshareIsReady( f53_arg0 ) or FileshareIsPublishing() or not Engine.FileshareIsReady( f53_arg0 ) then
		return false
	else
		return true
	end
end

function FileshareIsCategory( f54_arg0, f54_arg1 )
	return CoD.FileshareUtility.GetCurrentCategory() == f54_arg1
end

function FileshareIsSelectedItemCategory( f55_arg0, f55_arg1 )
	return CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" ) == f55_arg1
end

function FileshareCanBuyMoreSlots( f56_arg0 )
	if DoesPlayerHaveExtraSlotsItem( f56_arg0 ) then
		return false
	else
		return AreCodPointsEnabled( f56_arg0 )
	end
end

function IsInFileshare( f57_arg0 )
	if CoD.perController[f57_arg0].inFileshare then
		return CoD.perController[f57_arg0].inFileshare == true
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

function AllowGuestSplitScreenOnline()
	if Dvar.allowGuestSplitScreenOnline and Dvar.allowGuestSplitScreenOnline:get() == true then
		return true
	else
		return false
	end
end

function FileshareIsDetailsViewHiddenMode( f60_arg0 )
	return FileshareGetDetailsHiddenMode( f60_arg0 )
end

function FileshareDetailsViewAreArrowsHidden( f61_arg0 )
	local f61_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f61_local0 == "favorites" or f61_local0 == "featured" or f61_local0 == "recent" then
		return true
	else
		return FileshareIsDetailsViewHiddenMode( f61_arg0 )
	end
end

function FileshareDetailsViewCanMoveToNext( f62_arg0 )
	local f62_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f62_local0 == "favorites" or f62_local0 == "featured" or f62_local0 == "recent" then
		return false
	else
		local f62_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
		if f62_local1 and f62_local1 ~= CoD.FileshareUtility.GetItemsCount() - 1 then
			return true
		else
			return false
		end
	end
end

function FileshareDetailsViewCanMoveToPrevious( f63_arg0 )
	local f63_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f63_local0 == "favorites" or f63_local0 == "featured" or f63_local0 == "recent" then
		return false
	else
		local f63_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
		if f63_local1 and f63_local1 ~= 0 then
			return true
		else
			return false
		end
	end
end

function IsCustomGameCommunityOption()
	local f64_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "communityOption" ) )
	local f64_local1
	if f64_local0 == nil or f64_local0 == false then
		f64_local1 = false
	else
		f64_local1 = true
	end
	return f64_local1
end

function IsInCustomGames()
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "inCustomGames" ) ) == 1
end

function CustomGamesSlotsAvailable( f66_arg0, f66_arg1 )
	local f66_local0 = MediaManagerGetQuotaForCategory( f66_arg1, "customgame" )
	return f66_local0.categorySlotsAvailable > 0
end

function ShouldOpenMessageDialog( f67_arg0, f67_arg1 )
	if f67_arg0:getParent() == nil then
		return 
	end
	local f67_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f67_local0 ~= nil then
		if not CoD.isFrontend then
			local f67_local1 = Engine.GetModel( f67_local0, "controller" )
			if f67_local1 ~= nil and Engine.GetModelValue( f67_local1 ) ~= f67_arg1 then
				return false
			end
		end
		local f67_local1 = Engine.GetModel( f67_local0, "messagePending" )
		if f67_local1 ~= nil and Engine.GetModelValue( f67_local1 ) > 0 then
			return true
		end
	end
	return false
end

function IsLuaCodeVersionAtLeast( f68_arg0 )
	return f68_arg0 <= Engine.GetLuaCodeVersion()
end

function IsInDefaultState( f69_arg0 )
	return f69_arg0.currentState == "DefaultState"
end

function IsInDefaultStateOrStateNotSet( f70_arg0 )
	if not f70_arg0.currentState then
		return true
	else
		return f70_arg0.currentState == "DefaultState"
	end
end

function IsElementInState( f71_arg0, f71_arg1 )
	return f71_arg0.currentState == f71_arg1
end

function IsElementInAnyState( f72_arg0, ... )
	for f72_local3, f72_local4 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		if IsElementInState( f72_arg0, f72_local4 ) then
			return true
		end
	end
	return false
end

function IsChildElementInState( f73_arg0, f73_arg1, f73_arg2 )
	return f73_arg0[f73_arg1].currentState == f73_arg2
end

function IsMenuInState( f74_arg0, f74_arg1 )
	return f74_arg0.currentState == f74_arg1
end

function IsMenuModelValueEqualTo( f75_arg0, f75_arg1, f75_arg2 )
	local f75_local0 = f75_arg0:getModel()
	if f75_arg1 ~= "" and f75_local0 then
		f75_local0 = Engine.GetModel( f75_local0, f75_arg1 )
	end
	local f75_local1 = f75_local0 and Engine.GetModelValue( f75_local0 )
	local f75_local2
	if f75_local1 == nil or f75_local1 ~= f75_arg2 then
		f75_local2 = false
	else
		f75_local2 = true
	end
	return f75_local2
end

function IsSelfInState( f76_arg0, f76_arg1 )
	return f76_arg0.currentState == f76_arg1
end

function ShouldSwapCircleAndCross()
	return Engine.ShouldSwapCircleAndCross()
end

function IsWidthZero( f78_arg0 )
	return f78_arg0 == 0
end

function InSafehouseOrFrontend()
	local f79_local0 = CoD.isSafehouse
	if not f79_local0 then
		f79_local0 = CoD.isFrontend
	end
	return f79_local0
end

function InFrontend()
	return CoD.isFrontend
end

function InSafehouse()
	return CoD.isSafehouse
end

function IsFirstListElement( f82_arg0 )
	return f82_arg0:isFirstItem()
end

function IsLastListElement( f83_arg0 )
	return f83_arg0:isLastItem()
end

function IsListAtStart( f84_arg0, f84_arg1, f84_arg2 )
	local f84_local0 = f84_arg0[f84_arg1]
	if f84_local0 and f84_local0.activeWidget and (not f84_arg2 or not f84_arg2.list or f84_arg2.list == f84_local0) then
		return f84_local0.activeWidget:isFirstItem()
	else
		return false
	end
end

function IsListAtEnd( f85_arg0, f85_arg1, f85_arg2 )
	local f85_local0 = f85_arg0[f85_arg1]
	if f85_local0 and f85_local0.activeWidget and (not f85_arg2 or not f85_arg2.list or f85_arg2.list == f85_local0) then
		return f85_local0.activeWidget:isLastItem()
	else
		return false
	end
end

function ListElementHasElements( f86_arg0, f86_arg1 )
	local f86_local0 = f86_arg0[f86_arg1]
	if f86_local0 then
		local f86_local1 = f86_local0:getDataSource()
		if f86_local1 then
			return f86_local1.getCount( f86_local0 ) > 0
		end
	end
	return false
end

function ListHasElements( f87_arg0 )
	if f87_arg0.gridInfoTable then
		local f87_local0 = f87_arg0.gridInfoTable.parentGrid
		local f87_local1 = f87_local0:getDataSource()
		if f87_local1 then
			return f87_local1.getCount( f87_local0 ) > 0
		end
	end
	return false
end

function ListLoopEdgesEnabled( f88_arg0, f88_arg1 )
	local f88_local0 = f88_arg0[f88_arg1]
	if f88_local0 then
		return f88_local0.loopEdges
	else
		return false
	end
end

function HasListAction( f89_arg0, f89_arg1 )
	return f89_arg0:getModel( f89_arg1, "action" ) or f89_arg0.action
end

function IsElementInFocus( f90_arg0 )
	return f90_arg0:isInFocus()
end

function isClientListSlideFocus( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
	if not CoD.isPC then
		return IsWidgetInFocus( f91_arg0, f91_arg1, f91_arg2 )
	elseif f91_arg0.defaultNav and f91_arg0.defaultNav == "right" and IsWidgetInFocus( f91_arg0, f91_arg1, f91_arg2 ) then
		return true
	end
	return IsGamepad( f91_arg3 ) and IsWidgetInFocus( f91_arg0, f91_arg1, f91_arg2 )
end

function IsWidgetInFocus( f92_arg0, f92_arg1, f92_arg2 )
	if f92_arg0[f92_arg1] then
		if f92_arg2.idStack then
			local f92_local0 = f92_arg0[f92_arg1].id
			for f92_local4, f92_local5 in ipairs( f92_arg2.idStack ) do
				if f92_local5 == f92_local0 then
					return true
				end
			end
			return false
		elseif f92_arg2.id then
			return f92_arg0[f92_arg1]:hasChildWithID( f92_arg2.id )
		else
			return f92_arg0[f92_arg1]:doesElementOrChildHaveFocus()
		end
	else
		return false
	end
end

function IsFirstTimeSetup( f93_arg0, f93_arg1 )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	elseif Mods_IsUsingMods() then
		return false
	elseif not (not Engine.IsMultiplayerGame() or not IsLAN()) or Engine.IsInGame() then
		return false
	else
		return not Engine.IsFirstTimeComplete( f93_arg0, f93_arg1 )
	end
end

function IsMainFirstTimeSetup( f94_arg0 )
	if IsInGame() then
		return false
	elseif f94_arg0 > 0 then
		return false
	elseif Dvar.livestats_skipFirstTime:get() then
		return false
	else
		return Engine.GetProfileVarInt( f94_arg0, "com_first_time" ) ~= 0
	end
end

function TestAndSetFirstTimeMenu( f95_arg0, f95_arg1 )
	if Engine.GetProfileVarInt( f95_arg0, f95_arg1 ) == 0 then
		SetProfileVar( f95_arg0, f95_arg1, 1 )
		return true
	else
		
	end
end

function GrayOutReplayMissionButton( f96_arg0 )
	return false
end

function GrayOutMissionOverviewButton( f97_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
	if not modelValue or modelValue == "" then
		return true
	else
		
	end
end

function IsBooleanDvarSet( f98_arg0 )
	if Dvar[f98_arg0] then
		return Dvar[f98_arg0]:get() == true
	else
		return false
	end
end

function IsIntDvarNonZero( f99_arg0 )
	if Engine.DvarInt( nil, f99_arg0 ) ~= 0 then
		return true
	else
		return false
	end
end

function IsNumberDvarGreaterThanOrEqualTo( f100_arg0, f100_arg1 )
	if Dvar[f100_arg0] then
		local f100_local0 = Dvar[f100_arg0]:get()
		if type( f100_local0 ) == "number" and type( f100_arg1 ) == "number" then
			return f100_arg1 <= f100_local0
		end
	end
	return false
end

function IsDvarValueEqualTo( f101_arg0, f101_arg1 )
	if Dvar[f101_arg0] then
		return Dvar[f101_arg0]:get() == f101_arg1
	else
		return false
	end
end

function IsInGame()
	return Engine.IsInGame()
end

function GameEnded( f103_arg0 )
	return IsVisibilityBitSet( f103_arg0, Enum.UIVisibilityBit.BIT_GAME_ENDED )
end

function IsCurrentMenu( f104_arg0, f104_arg1 )
	if f104_arg0.menuName == f104_arg1 then
		return true
	else
		return false
	end
end

function PropertyIsTrue( f105_arg0, f105_arg1 )
	if f105_arg0 == nil then
		return false
	else
		return f105_arg0[f105_arg1] == true
	end
end

function IsElementPropertyValue( f106_arg0, f106_arg1, f106_arg2 )
	if f106_arg0 == nil then
		return false
	else
		return f106_arg0[f106_arg1] == f106_arg2
	end
end

function IsElementPropertyEnumValue( f107_arg0, f107_arg1, f107_arg2 )
	if f107_arg0 == nil then
		return false
	else
		return f107_arg0[f107_arg1] == f107_arg2
	end
end

function HasProperty( f108_arg0, f108_arg1 )
	if f108_arg0 == nil then
		return false
	else
		return f108_arg0[f108_arg1] ~= nil
	end
end

function ParentPropertyIsTrue( f109_arg0, f109_arg1 )
	if f109_arg0 == nil or f109_arg0:getParent() == nil then
		return false
	else
		local f109_local0 = f109_arg0:getParent()
		return f109_local0[f109_arg1] == true
	end
end

function IsPerControllerTablePropertyValue( f110_arg0, f110_arg1, f110_arg2 )
	return CoD.perController[f110_arg0][f110_arg1] == f110_arg2
end

function IsPerControllerTablePropertyEnumValue( f111_arg0, f111_arg1, f111_arg2 )
	return CoD.perController[f111_arg0][f111_arg1] == f111_arg2
end

function IsPerControllerTablePropertyEitherEnumValue( f112_arg0, f112_arg1, f112_arg2, f112_arg3 )
	local f112_local0
	if CoD.perController[f112_arg0][f112_arg1] ~= f112_arg2 and CoD.perController[f112_arg0][f112_arg1] ~= f112_arg3 then
		f112_local0 = false
	else
		f112_local0 = true
	end
	return f112_local0
end

function IsActiveLocalClientsCountEqualTo( f113_arg0 )
	return Engine.GetActiveLocalClientsCount() == f113_arg0
end

function IsTextWrapping( f114_arg0, f114_arg1 )
	if f114_arg1 == nil then
		return false
	else
		local f114_local0, f114_local1, f114_local2, f114_local3 = f114_arg1:getLocalLeftRight()
		local f114_local4 = f114_local3 - f114_local2
		local f114_local5, f114_local6 = f114_arg1:getTextWidthAndHeight()
		return f114_local4 < f114_local5
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
	local f119_local0 = Dvar.groups_enabled:get()
	if f119_local0 ~= nil and f119_local0 == true and not IsInGame() then
		return true
	else
		return false
	end
end

function IsGroupsBeta()
	return Engine.DvarBool( nil, "tu10_groupsBetaTag" )
end

function FetchingGroupPublicProfiles( f121_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f121_arg0 ), "groups.fetchGroupProfilesInProgress" ) )
end

function FetchingGroupInvitesInfo( f122_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f122_arg0 ), "groups.fetchGroupInvitesInProgress" ) )
	if not modelValue then
		modelValue = FetchingGroupPublicProfiles( f122_arg0 )
	end
	return modelValue
end

function FilteringGroupFriends( f123_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f123_arg0 ), "groups.filterGroupFriendsInProgress" ) )
end

function HideGroupInviteSummary( f124_arg0, f124_arg1 )
	local f124_local0
	if HasSelectedGroup( f124_arg0, f124_arg1 ) then
		f124_local0 = FetchingGroupInvitesInfo( f124_arg1 )
	else
		f124_local0 = true
	end
	return f124_local0
end

function HideGroupSummaryIfListEmpty( f125_arg0, f125_arg1, f125_arg2 )
	local f125_local0 = f125_arg0:findSibling( f125_arg2 )
	local f125_local1
	if HasSelectedGroup( f125_arg0, f125_arg1 ) then
		f125_local1 = FetchingGroupPublicProfiles( f125_arg1 )
		if not f125_local1 then
			local f125_local2 = f125_local0
			f125_local1 = not ListHasElements( f125_local0 )
		end
	else
		f125_local1 = f125_local2 and true
	end
	return f125_local1
end

function SelectingGroupEmblem( f126_arg0 )
	return CoD.perController[f126_arg0].selectingGroupEmblem
end

function SelectingGroupEmblemForGroupCreation( f127_arg0 )
	return CoD.perController[f127_arg0].selectingGroupEmblemForGroupCreation
end

function IsReadyUpVisible( f128_arg0, f128_arg1 )
	if IsGlobalModelValueEqualTo( f128_arg0, f128_arg1, "lobbyRoot.lobbyNav", LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id ) or IsGlobalModelValueEqualTo( f128_arg0, f128_arg1, "lobbyRoot.lobbyNav", LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id ) then
		return true
	else
		return false
	end
end

function ShouldOpenGroupAdminOptionsPopupForGroupMember( f129_arg0, f129_arg1 )
	local f129_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f129_arg1 ), "Social.selectedFriendXUID" ) )
	local f129_local1 = f129_local0 == Engine.GetXUID64( f129_arg1 )
	local f129_local2 = FetchGroupMembersResultsLoading( f129_arg1 )
	local f129_local3 = HasAdminPrivilege( f129_arg1, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_MEMBERS )
	if not f129_local3 then
		f129_local3 = HasAdminPrivilege( f129_arg1, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_BAN_MEMBERS )
		if not f129_local3 then
			f129_local3 = HasAdminPrivilege( f129_arg1, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_MANAGE_ADMINS )
		end
	end
	if f129_local3 and not f129_local1 and not f129_local2 and not IsGroupOwner( f129_arg1, f129_local0 ) then
		return true
	else
		
	end
end

function ShouldOpenGroupOptionsPopup( f130_arg0, f130_arg1 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f130_arg1 ), "groups.grouphqtabname" ) ) == "overview"
end

function CheckSelectedAdminPrivilege( f131_arg0, f131_arg1 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f131_arg0 ), "groups.currentAdminPrivileges" ) ) & 1 << f131_arg1 ~= 0
end

function IsGroupDataDirty( f132_arg0, f132_arg1 )
	return CoD.perController[f132_arg0].groupsDataDirty and CoD.perController[f132_arg0].groupsDataDirty[f132_arg1]
end

function HasAdminPrivilege( f133_arg0, f133_arg1 )
	local f133_local0 = f133_arg1
	if CoD.perController[f133_arg0].selectedGroup then
		local f133_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f133_arg0].selectedGroup, "groupId" ) )
		local f133_local2 = IsGroupOwner( f133_arg0 )
		if not f133_local2 then
			f133_local2 = Engine.GroupAdminHasPrivilege( f133_arg0, f133_local1, f133_local0 )
		end
		return f133_local2
	else
		return false
	end
end

function HasNoJoinRequests( f134_arg0 )
	if Engine.GetSelectedGroupApplicationsCount( f134_arg0 ) == 0 then
		return true
	else
		
	end
end

function IsGroupMemberFromElement( f135_arg0, f135_arg1 )
	if not f135_arg0:getModel() or not f135_arg0:getModel( f135_arg1, "groupId" ) then
		return false
	end
	local f135_local0 = Engine.GetModelValue( f135_arg0:getModel( f135_arg1, "groupId" ) )
	for f135_local4, f135_local5 in ipairs( Engine.GetGroupList( f135_arg1, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF ) ) do
		if f135_local5.groupId == f135_local0 then
			return true
		end
	end
end

function IsGroupMember( f136_arg0, f136_arg1 )
	local f136_local0 = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_INVALID
	if CoD.perController[f136_arg0].selectedGroup then
		local f136_local1 = Engine.GetXUID64( f136_arg0 )
		if f136_arg1 then
			f136_local1 = f136_arg1
		end
		f136_local0 = Engine.GetSelectedGroupMemberStatus( f136_arg0, f136_local1 )
	end
	local f136_local1
	if f136_local0 ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_MEMBER and f136_local0 ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN and f136_local0 ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER then
		f136_local1 = false
	else
		f136_local1 = true
	end
	return f136_local1
end

function IsGroupAdmin( f137_arg0, f137_arg1 )
	local f137_local0 = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_INVALID
	if CoD.perController[f137_arg0].selectedGroup then
		local f137_local1 = Engine.GetXUID64( f137_arg0 )
		if f137_arg1 then
			f137_local1 = f137_arg1
		end
		f137_local0 = Engine.GetSelectedGroupMemberStatus( f137_arg0, f137_local1 )
	end
	return f137_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN
end

function IsGroupOwner( f138_arg0, f138_arg1 )
	local f138_local0 = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_INVALID
	if CoD.perController[f138_arg0].selectedGroup then
		local f138_local1 = Engine.GetXUID64( f138_arg0 )
		if f138_arg1 then
			f138_local1 = f138_arg1
		end
		f138_local0 = Engine.GetSelectedGroupMemberStatus( f138_arg0, f138_local1 )
	end
	return f138_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER
end

function HasNoGroupAdmin( f139_arg0 )
	if Engine.GetSelectedGroupAdminsCount( f139_arg0 ) == 0 then
		return true
	else
		
	end
end

function HasNoGroupBannedMembers( f140_arg0 )
	if Engine.GetSelectedGroupBannedMembersCount( f140_arg0 ) == 0 then
		return true
	else
		
	end
end

function IsGroupListHeader( f141_arg0 )
	return f141_arg0.type == "header"
end

function DoesGroupListHaveSelectedIcon( f142_arg0 )
	local f142_local0
	if f142_arg0.showSelectedIcon == nil or f142_arg0.showSelectedIcon ~= true then
		f142_local0 = false
	else
		f142_local0 = true
	end
	return f142_local0
end

function IsProcessingGroupTask( f143_arg0 )
	local modelValue = Engine.GetModelValue( GetProcessingGroupTaskModel( f143_arg0 ) )
	local f143_local1
	if modelValue == nil or modelValue ~= true then
		f143_local1 = false
	else
		f143_local1 = true
	end
	return f143_local1
end

function CloseGroupsNotifyPopupAutomaticallyAfterEvent( f144_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f144_arg0 ), "groups.closeAutomaticallyAfterEvent" ) )
end

function SearchGroupResultsLoading( f145_arg0, f145_arg1 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f145_arg1 ), "groups.searchGroupsInProgress" ) )
end

function FetchGroupMembersResultsLoading( f146_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f146_arg0 ), "groups.fetchGroupMembersInProgress" ) )
end

function FetchGroupApplicationsResultsLoading( f147_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f147_arg0 ), "groups.fetchGroupApplicationsInProgress" ) )
end

function IsGroupEmblemEmpty( f148_arg0, f148_arg1 )
	local f148_local0 = nil
	if CoD.perController[f148_arg1].selectedGroup then
		f148_local0 = Engine.GetModel( CoD.perController[f148_arg1].selectedGroup, "groupId" )
	else
		f148_local0 = f148_arg0:getModel( f148_arg1, "groupId" )
	end
	if f148_local0 ~= nil then
		local f148_local1 = Engine.GetModelValue( f148_local0 )
		if f148_local1 ~= nil then
			return Engine.IsGroupEmblemEmpty( f148_arg1, f148_local1 )
		end
	end
	return true
end

function HasSelectedGroup( f149_arg0, f149_arg1 )
	return f149_arg0:getModel() and f149_arg0:getModel( f149_arg1, "groupId" )
end

function HideGroupSummary( f150_arg0, f150_arg1 )
	local f150_local0 = SearchGroupResultsLoading( f150_arg0, f150_arg1 )
	if not f150_local0 then
		f150_local0 = not HasSelectedGroup( f150_arg0, f150_arg1 )
	end
	return f150_local0
end

function CanSendGroupInvites( f151_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f151_arg0 ), "Social.selectedFriendXUID" ) )
	if Engine.GetLuaCodeVersion() >= 22 then
		return Engine.CanSendGroupInvites( f151_arg0, modelValue )
	else
		return Engine.CanSendGroupInvites( f151_arg0 )
	end
end

function HasPendingInvites( f152_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f152_arg0 ), "groups" ), "inviteCount" ) )
	local f152_local1
	if modelValue == nil or modelValue <= 0 then
		f152_local1 = false
	else
		f152_local1 = true
	end
	return f152_local1
end

function IsMemberOfAnyGroup( f153_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f153_arg0 ), "groups" ), "groupCount_self" ) )
	local f153_local1
	if modelValue == nil or modelValue <= 0 then
		f153_local1 = false
	else
		f153_local1 = true
	end
	return f153_local1
end

function IsGroupLeaderboardAvailable()
	local f154_local0, f154_local1, f154_local2, f154_local3, f154_local4, f154_local5 = Engine.GetGroupLeaderboardInfo()
	local f154_local6
	if f154_local5 ~= true or f154_local0 == nil or f154_local0 == "" then
		f154_local6 = false
	else
		f154_local6 = true
	end
	return f154_local6
end

function IsLeaderboardUpdating()
	local f155_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "isUpdating" ) )
	local f155_local1
	if f155_local0 == nil or f155_local0 ~= true then
		f155_local1 = false
	else
		f155_local1 = true
	end
	return f155_local1
end

function IsLeaderboardEmpty()
	local f156_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
	local f156_local1
	if f156_local0 ~= nil and f156_local0 ~= 0 then
		f156_local1 = false
	else
		f156_local1 = true
	end
	return f156_local1
end

function IsGroupLeaderboardMakerState( f157_arg0, f157_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f157_arg0 ), "groups" ), "leaderboardmaker" ), "state" ) ) == f157_arg1
end

function LeaderboardsDownForMaintanence()
	return Engine.DvarBool( nil, "dw_lbMaintanence" )
end

function IsLobbyLeaderboard( f159_arg0 )
	return CoD.perController[f159_arg0].isInLobbyLeaderboard == true
end

function IsFreerunLeaderboard( f160_arg0 )
	local f160_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f160_local0 then
		return false
	else
		return Engine.GetModelValue( f160_local0 ) == "freerun"
	end
end

function IsZMMapsLeaderboard( f161_arg0 )
	local f161_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f161_local0 then
		return false
	else
		return Engine.GetModelValue( f161_local0 ) == "zm_maps"
	end
end

function IsDOALeaderboard( f162_arg0 )
	local f162_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f162_local0 then
		return false
	else
		return Engine.GetModelValue( f162_local0 ) == "doa"
	end
end

function IsCustomLeaderboard( f163_arg0 )
	local f163_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f163_local0 then
		return false
	else
		return Engine.GetModelValue( f163_local0 ) == "custom"
	end
end

function IsCustomLeaderboardTab( f164_arg0, f164_arg1, f164_arg2 )
	return CoD.perController[f164_arg2].selectedLeaderboardTabId == "leaderboard_mp_custom"
end

function IsMPGameModeLeaderboard( f165_arg0 )
	local f165_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
	if not f165_local0 then
		return false
	else
		return string.sub( Engine.GetModelValue( f165_local0 ), 1, string.len( "LB_MP_GM_" ) ) == "LB_MP_GM_"
	end
end

function IsPlayerAGuest( f166_arg0 )
	return Engine.IsUserGuest( f166_arg0 )
end

function IsPlayerAllowedToPlayOnline( f167_arg0 )
	if Engine.IsPlusAuthorized( f167_arg0 ) == false then
		return false
	else
		return true
	end
end

function IsOutOfBounds( f168_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f168_arg0 ), "hudItems.outOfBoundsEndTime" ) )
	local f168_local1 = Engine.CurrentGameTime()
	if f168_local1 == nil then
		return false
	elseif modelValue == nil then
		return false
	elseif CoD.SafeGetModelValue( Engine.GetModelForController( f168_arg0 ), "displayTop3Players" ) == 1 then
		return false
	else
		return f168_local1 < modelValue
	end
end

function IsEnemyDetected( f169_arg0, f169_arg1, f169_arg2 )
	local f169_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f169_arg0 ), "hudItems.sixthsense" ) )
	local f169_local1 = 0
	if f169_local0 == nil then
		return false
	elseif f169_arg2 == nil or f169_arg2 == "" then
		f169_arg2 = "far"
	end
	local f169_local2 = 1
	if f169_arg2 == "close" then
		f169_local2 = 16
	end
	if f169_arg1 == "front" then
		f169_local1 = f169_local2 << 0
	elseif f169_arg1 == "back" then
		f169_local1 = f169_local2 << 1
	elseif f169_arg1 == "left" then
		f169_local1 = f169_local2 << 2
	elseif f169_arg1 == "right" then
		f169_local1 = f169_local2 << 3
	end
	return f169_local0 & f169_local1 ~= 0
end

function HidePersonalizePrompt( f170_arg0 )
	local f170_local0
	if not CoD.isPC or IsGamepad( f170_arg0 ) then
		f170_local0 = Dvar.ui_execdemo_gamescom:get()
	else
		f170_local0 = true
	end
	return f170_local0
end

function CACShowSelectPrompt( f171_arg0, f171_arg1, f171_arg2 )
	local f171_local0 = f171_arg1:getModel()
	local f171_local1 = f171_local0 and Engine.GetModel( f171_local0, "weaponSlot" )
	local f171_local2 = f171_local1 and Engine.GetModelValue( f171_local1 )
	if f171_local2 == nil or f171_arg2 == nil then
		return false
	else
		local f171_local3 = CoD.perController[f171_arg2].classModel
		if not (not LUI.startswith( f171_local2, "primarygadgetattachment" ) or CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f171_arg2 ) ~= "" or not CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f171_arg2 ) ~= "") or not (f171_local2 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f171_arg2 ) ~= "") or not (f171_local2 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f171_arg2 ) ~= "") or not (f171_local2 ~= "specialty6" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f171_arg2 ) ~= "") or not (f171_local2 ~= "secondaryattachment3" or CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f171_arg2 ) ~= "") or not (f171_local2 ~= "primaryattachment4" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f171_local3 ) ~= 0) or not (f171_local2 ~= "primaryattachment5" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f171_local3 ) > 1) or not (f171_local2 ~= "primaryattachment6" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f171_local3 ) > 2) or not (not LUI.startswith( f171_local2, "primaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "primary", f171_arg2, f171_local3 )) or not (not LUI.startswith( f171_local2, "secondaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "secondary", f171_arg2, f171_local3 ) and CoD.CACUtility.DoesWeaponHaveAnyAttachments( "secondary", f171_arg2, f171_local3 )) or LUI.startswith( f171_local2, "secondarygadgetattachment" ) and not CoD.CACUtility.ItemEquippedInSlot( "secondarygadget", f171_arg2, f171_local3 ) then
			local f171_local4, f171_local5, f171_local6 = CoD.CACUtility.GetCACSlotStatus( f171_arg2, f171_local3, f171_local2 )
			if f171_local4 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD and not IsElementInState( f171_arg1, "NotVisible" ) then
				return true
			else
				return false
			end
		else
			return true
		end
	end
end

function CACShowRemovePrompt( f172_arg0, f172_arg1 )
	local f172_local0 = f172_arg1:getModel()
	local f172_local1 = f172_local0 and Engine.GetModel( f172_local0, "itemIndex" )
	local f172_local2 = f172_local1 and Engine.GetModelValue( f172_local1 )
	if Engine.IsCampaignGame() then
		local f172_local3 = f172_local0 and Engine.GetModel( f172_local0, "weaponSlot" )
		local f172_local4 = f172_local3 and Engine.GetModelValue( f172_local3 )
		if f172_local4 == "primary" or f172_local4 == "secondary" then
			return false
		end
	end
	if f172_local2 ~= nil and f172_local2 > CoD.CACUtility.EmptyItemIndex then
		return true
	end
end

function CACShowRotatePrompt( f173_arg0, f173_arg1, f173_arg2 )
	local f173_local0 = f173_arg1:getModel()
	local f173_local1 = f173_local0 and Engine.GetModel( f173_local0, "weaponSlot" )
	local f173_local2 = f173_local1 and Engine.GetModelValue( f173_local1 )
	if f173_local2 == nil then
		local f173_local3 = f173_local0 and CoD.SafeGetModelValue( f173_local0, "itemIndex" )
		local f173_local4
		if f173_local3 == nil or f173_local3 <= 0 then
			f173_local4 = false
		else
			f173_local4 = true
		end
		return f173_local4
	elseif CACShowRemovePrompt( f173_arg0, f173_arg1 ) then
		return true
	end
	local f173_local3 = CACShowSelectPrompt( f173_arg0, f173_arg1, f173_arg2 )
	if f173_local3 then
		f173_local3 = LUI.startswith( f173_local2, "primaryattachment" )
		if not f173_local3 then
			f173_local3 = LUI.startswith( f173_local2, "secondaryattachment" )
		end
	end
	return f173_local3
end

function IsCACCustomClassCountDefault( f174_arg0 )
	return Engine.GetCustomClassCount( f174_arg0 ) == CoD.CACUtility.defaultCustomClassCount
end

function IsCACClassSetsCountDefault( f175_arg0 )
	return Engine.GetNumberOfClassSetsOwned( f175_arg0 ) == 1
end

function ShowCACExtraClassBreadcrumb( f176_arg0 )
	if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f176_arg0 ) then
		local f176_local0 = Engine.StorageGetBuffer( f176_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f176_local0 then
			return f176_local0.extraBools[0]:get() == 0
		end
	end
	return false
end

function IsCACSlotOvercapacity2by1AspectRatio( f177_arg0 )
	local f177_local0 = f177_arg0:getModel()
	if f177_local0 then
		local f177_local1 = Engine.GetModel( f177_local0, "itemSlot" )
		if f177_local1 then
			local f177_local2 = Engine.GetModelValue( f177_local1 )
			local f177_local3
			if f177_local2 ~= "primary" and f177_local2 ~= "secondary" then
				f177_local3 = false
			else
				f177_local3 = true
			end
			return f177_local3
		end
	end
	return false
end

function IsCACSlotOvercapacityWildcard( f178_arg0 )
	local f178_local0 = f178_arg0:getModel()
	if f178_local0 then
		local f178_local1 = Engine.GetModel( f178_local0, "itemSlot" )
		if f178_local1 then
			return LUI.startswith( Engine.GetModelValue( f178_local1 ), "bonuscard" )
		end
	end
	return false
end

function IsCACContextualWildcardOpen( f179_arg0 )
	if CoD.perController[f179_arg0].CACWildcardContextualMenu and not IsInPermanentUnlockMenu( f179_arg0 ) then
		return true
	else
		return false
	end
end

function IsCACCategoryWeapon( f180_arg0 )
	local f180_local0
	if CoD.perController[f180_arg0].weaponCategory ~= "primary" and CoD.perController[f180_arg0].weaponCategory ~= "secondary" then
		f180_local0 = false
	else
		f180_local0 = true
	end
	return f180_local0
end

function IsCACSlot2by1AspectRatio( f181_arg0 )
	local f181_local0 = f181_arg0:getModel()
	if f181_local0 then
		local f181_local1 = Engine.GetModel( f181_local0, "weaponSlot" )
		if f181_local1 then
			local f181_local2 = Engine.GetModelValue( f181_local1 )
			local f181_local3
			if f181_local2 ~= "primary" and f181_local2 ~= "secondary" then
				f181_local3 = false
			else
				f181_local3 = true
			end
			return f181_local3
		end
	end
	return false
end

function IsCACSlotInfopane2by1AspectRatio( f182_arg0 )
	local f182_local0 = f182_arg0:getModel()
	if f182_local0 then
		local f182_local1 = Engine.GetModel( f182_local0, "weaponSlot" )
		if f182_local1 then
			local f182_local2 = Engine.GetModelValue( f182_local1 )
			local f182_local3
			if f182_local2 ~= "primary" and f182_local2 ~= "secondary" then
				f182_local3 = LUI.startswith( f182_local2, "primaryattachment" )
				if not f182_local3 then
					f182_local3 = LUI.startswith( f182_local2, "secondaryattachment" )
				end
			else
				f182_local3 = true
			end
			return f182_local3
		end
	end
	return false
end

function IsCACItemBubbleGum( f183_arg0, f183_arg1, f183_arg2 )
	local f183_local0 = f183_arg1:getModel()
	if f183_local0 then
		local f183_local1 = Engine.GetModel( f183_local0, "itemIndex" )
		if f183_local1 and LuaUtils.FindItemInArray( CoD.CACUtility.BGBBuffGroups, Engine.GetItemGroup( Engine.GetModelValue( f183_local1 ), CoD.PrestigeUtility.GetPermanentUnlockMode() ) ) then
			return true
		end
	end
	return false
end

function IsCACItemConsumable( f184_arg0, f184_arg1, f184_arg2 )
	local f184_local0 = f184_arg1:getModel()
	if f184_local0 then
		local f184_local1 = Engine.GetModel( f184_local0, "itemIndex" )
		if f184_local1 then
			return CoD.CACUtility.IsItemConsumable( Engine.GetModelValue( f184_local1 ) )
		end
	end
	return false
end

function DoesCACItemHaveConsumablesRemaining( f185_arg0, f185_arg1, f185_arg2 )
	if not IsCACItemConsumable( f185_arg0, f185_arg1, f185_arg2 ) then
		return true
	end
	local f185_local0 = f185_arg1:getModel()
	if f185_local0 then
		local f185_local1 = Engine.GetModel( f185_local0, "itemIndex" )
		if f185_local1 then
			return GetConsumableCountFromIndex( f185_arg2, Engine.GetModelValue( f185_local1 ) ) > 0
		end
	end
	return false
end

function IsCACItemFromDLC( f186_arg0, f186_arg1, f186_arg2 )
	local f186_local0 = f186_arg1:getModel()
	if f186_local0 then
		local f186_local1 = Engine.GetModel( f186_local0, "dlcIndex" )
		if not f186_local1 then
			return false
		else
			return Engine.GetModelValue( f186_local1 ) > CoD.CONTENT_DLCZM0_INDEX
		end
	else
		return false
	end
end

function IsCACItemDLCPurchased( f187_arg0, f187_arg1, f187_arg2 )
	local f187_local0 = f187_arg1:getModel()
	if f187_local0 then
		local f187_local1 = Engine.GetModel( f187_local0, "dlcIndex" )
		if not f187_local1 then
			return false
		else
			local f187_local2 = Engine.GetModelValue( f187_local1 )
			if not f187_local2 or f187_local2 < CoD.CONTENT_DLC1_INDEX then
				return true
			else
				return Engine.HasEntitlementByOwnership( f187_arg2, "dlc" .. f187_local2 - CoD.CONTENT_DLCZM0_INDEX )
			end
		end
	else
		return false
	end
end

function IsCACItemContractLocked( f188_arg0, f188_arg1 )
	local f188_local0 = CoD.SafeGetModelValue( f188_arg0:getModel(), "ref" )
	if f188_local0 and CoD.ContractWeaponTiers[f188_local0] then
		return not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f188_local0] )
	else
		return false
	end
end

function IsCACItemEquipped( f189_arg0, f189_arg1, f189_arg2 )
	local f189_local0 = CoD.perController[f189_arg2].weaponCategory
	if LuaUtils.FindItemInArray( CoD.CACUtility.BGBBuffGroups, f189_local0 ) then
		return IsBubbleGumBuffEquipped( f189_arg0, f189_arg1, f189_arg2 )
	end
	local f189_local1 = CoD.CACUtility.GetSlotListWithSlot( f189_local0 )
	local f189_local2 = f189_arg1:getModel()
	if f189_local2 then
		local f189_local3 = Engine.GetModel( f189_local2, "itemIndex" )
		local f189_local4 = Engine.GetModel( f189_local2, "upgradeItemIndex" )
		local f189_local5 = f189_local3
		if f189_local4 and IsCACItemUpgraded( f189_arg0, f189_arg1, f189_arg2 ) then
			f189_local5 = f189_local4
		end
		if f189_local5 then
			local f189_local6 = Engine.GetModelValue( f189_local5 )
			for f189_local10, f189_local11 in ipairs( f189_local1 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f189_local11, f189_arg2 ) == f189_local6 then
					return true
				end
			end
		end
	end
	return false
end

function IsBubbleGumType( f190_arg0, f190_arg1, f190_arg2 )
	local f190_local0 = f190_arg0 and CoD.SafeGetModelValue( f190_arg0:getModel(), "itemIndex" )
	if f190_local0 then
		local f190_local1 = Engine.TableLookup( f190_arg1, "gamedata/stats/zm/zm_statsTable.csv", 0, f190_local0, 20 )
		if f190_local1 then
			return f190_arg2 == f190_local1
		end
	end
	return false
end

function IsCACWildcardEquipped( f191_arg0, f191_arg1, f191_arg2 )
	local f191_local0 = CoD.CACUtility.GetSlotListWithSlot( CoD.perController[f191_arg2].weaponCategory )
	local f191_local1 = f191_arg1:getModel()
	if f191_local1 then
		local f191_local2 = Engine.GetModel( f191_local1, "itemIndex" )
		if f191_local2 then
			local f191_local3 = Engine.GetModelValue( f191_local2 )
			for f191_local7, f191_local8 in ipairs( f191_local0 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f191_local8, f191_arg2 ) == f191_local3 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACWeaponEquippedForSlot( f192_arg0, f192_arg1, f192_arg2, f192_arg3 )
	local f192_local0 = f192_arg1:getModel( f192_arg2, "itemIndex" )
	local f192_local1 = f192_arg0:getModel()
	if f192_local0 then
		local f192_local2 = Engine.GetModel( f192_local1, f192_arg3 .. ".itemIndex" )
		if f192_local2 then
			local f192_local3 = Engine.GetModelValue( f192_local2 )
			local f192_local4 = Engine.GetModelValue( f192_local0 )
			local f192_local5 = Engine.GetAttachmentRef( f192_local3, f192_local4 )
			if f192_local4 > CoD.CACUtility.EmptyItemIndex then
				return true
			end
		end
	end
	return false
end

function IsCACCustomizationReticleAttachmentItemEquipped( f193_arg0, f193_arg1, f193_arg2, f193_arg3 )
	local f193_local0 = f193_arg1:getModel( f193_arg2, "itemIndex" )
	local f193_local1 = f193_arg0:getModel()
	if f193_local0 then
		local f193_local2 = Engine.GetModel( f193_local1, f193_arg3 .. ".itemIndex" )
		if f193_local2 then
			local f193_local3 = Engine.GetModelValue( f193_local2 )
			local f193_local4 = Engine.GetModelValue( f193_local0 )
			local f193_local5 = Engine.GetAttachmentRef( f193_local3, f193_local4 )
			if f193_local4 > CoD.CACUtility.EmptyItemIndex then
				return CoD.CACUtility.attachmentsWithCustReticle[f193_local5]
			end
		end
	end
	return false
end

function IsCACCustomizationDWAttachmentItemEquipped( f194_arg0, f194_arg1, f194_arg2 )
	local f194_local0 = f194_arg1:getModel( f194_arg2, "itemIndex" )
	local f194_local1 = CoD.SafeGetModelValue( f194_arg1:getModel(), "weaponSlot" )
	local f194_local2 = f194_local1 and CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f194_local1 )
	local f194_local3 = f194_arg0:getModel()
	if f194_local2 and f194_local0 then
		local f194_local4 = Engine.GetModel( f194_local3, f194_local2 .. ".itemIndex" )
		if f194_local4 then
			local f194_local5 = Engine.GetModelValue( f194_local4 )
			local f194_local6 = Engine.GetModelValue( f194_local0 )
			local f194_local7 = Engine.GetAttachmentRef( f194_local5, f194_local6 )
			if f194_local6 > CoD.CACUtility.EmptyItemIndex then
				return f194_local7 == "dw"
			end
		end
	end
	return false
end

function IsCACWeaponVariantEquipped( f195_arg0, f195_arg1, f195_arg2, f195_arg3 )
	if not Gunsmith_IsEnabled( f195_arg2, f195_arg3 ) then
		return false
	else
		local f195_local0 = f195_arg0:getModel()
		local f195_local1 = CoD.perController[f195_arg3].weaponCategory
		local f195_local2 = f195_arg1:getModel()
		return CoD.CACUtility.IsVariantEquippedToClass( f195_local0, f195_local1, CoD.SafeGetModelValue( f195_local2, "weaponItemIndex" ), CoD.SafeGetModelValue( f195_local2, "cacVariantIndex" ) )
	end
end

function IsSpecialContractCamo( f196_arg0, f196_arg1 )
	local f196_local0 = f196_arg0:getModel()
	if CoD.SafeGetModelValue( f196_local0, "weaponOptionTypeName" ) ~= "camo" then
		return false
	end
	local f196_local1 = Engine.TableLookup( f196_arg1, CoD.attachmentTable, 0, CoD.SafeGetModelValue( f196_local0, "itemIndex" ), 1, "camo", 22 )
	local f196_local2
	if f196_local1 == nil or f196_local1 == "" then
		f196_local2 = false
	else
		f196_local2 = true
	end
	return f196_local2
end

function ShouldHideClassifiedDescription( f197_arg0, f197_arg1 )
	local f197_local0 = f197_arg0:getModel()
	if not CoD.SafeGetModelValue( f197_local0, "isBMClassified" ) then
		return true
	else
		return CoD.BlackMarketUtility.IsLimitedEditionCamoBundleItem( CoD.SafeGetModelValue( f197_local0, "ref" ) )
	end
end

function ShouldHideClassifiedLimitedEditionCamoDescription( f198_arg0, f198_arg1 )
	local f198_local0 = f198_arg0:getModel()
	if not CoD.SafeGetModelValue( f198_local0, "isBMClassified" ) then
		return true
	else
		return not CoD.BlackMarketUtility.IsLimitedEditionCamoBundleItem( CoD.SafeGetModelValue( f198_local0, "ref" ) )
	end
end

function IsCACItemNew( f199_arg0, f199_arg1 )
	if not IsProgressionEnabled( f199_arg1 ) then
		return false
	end
	local f199_local0 = f199_arg0:getModel( f199_arg1, "itemIndex" )
	if f199_local0 then
		local f199_local1 = Engine.GetModelValue( f199_local0 )
		local f199_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if f199_local1 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( f199_arg1, f199_local1, f199_local2 )
		end
	end
	return false
end

function IsCACAttachmentNew( f200_arg0, f200_arg1, f200_arg2 )
	if not IsProgressionEnabled( f200_arg2 ) then
		return false
	end
	local f200_local0 = CoD.perController[f200_arg2].weaponCategory
	local f200_local1 = f200_arg1:getModel( f200_arg2, "itemIndex" )
	local f200_local2 = f200_arg0:getModel()
	if f200_local1 then
		local f200_local3 = "primary"
		if LUI.startswith( f200_local0, "secondaryattachment" ) then
			f200_local3 = "secondary"
		end
		local f200_local4 = Engine.GetModel( f200_local2, f200_local3 .. ".itemIndex" )
		if f200_local4 then
			return Engine.IsAttachmentNew( f200_arg2, Engine.GetModelValue( f200_local4 ), Engine.GetModelValue( f200_local1 ) )
		end
	end
	return false
end

function IsSpecialistNew( f201_arg0, f201_arg1, f201_arg2 )
	if not IsProgressionEnabled( f201_arg2 ) then
		return false
	end
	local f201_local0 = Engine.GetModelValue( f201_arg0:getModel( f201_arg2, "heroIndex" ) )
	local f201_local1 = Engine.CurrentSessionMode()
	if f201_local0 then
		local f201_local2 = Engine.GetLoadoutItemIndexForHero( f201_local1, f201_local0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		if f201_local2 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( f201_arg2, f201_local2 )
		end
	end
	return false
end

function IsCACAnyLoadoutSlotNew( f202_arg0, f202_arg1 )
	if not IsProgressionEnabled( f202_arg1 ) then
		return false
	else
		local f202_local0 = f202_arg0:getModel( f202_arg1, "weaponSlot" )
		if f202_local0 then
			local f202_local1 = Engine.GetModelValue( f202_local0 )
			if f202_local1 == "primarygadget" and CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", CoD.perController[f202_arg1].classModel ) then
				return false
			else
				return Engine.IsLoadoutSlotNew( f202_arg1, f202_local1 )
			end
		else
			return false
		end
	end
end

function IsCACSpecificLoadoutSlotNew( f203_arg0, f203_arg1, f203_arg2 )
	if not IsProgressionEnabled( f203_arg1 ) then
		return false
	else
		local f203_local0 = f203_arg0:getModel( f203_arg1, f203_arg2 .. ".weaponSlot" )
		if f203_local0 then
			return Engine.IsLoadoutSlotNew( f203_arg1, Engine.GetModelValue( f203_local0 ) )
		else
			return false
		end
	end
end

function ShouldDisplayWeaponGroupBreadcrumbCount( f204_arg0, f204_arg1 )
	if not IsProgressionEnabled( f204_arg1 ) then
		return false
	elseif IsInPermanentUnlockMenu( f204_arg1 ) then
		return false
	else
		local f204_local0 = f204_arg0:getModel( f204_arg1, "breadcrumbCount" )
		if f204_local0 then
			return Engine.GetModelValue( f204_local0 ) > 0
		else
			return false
		end
	end
end

function IsCACAnyOpticsNew( f205_arg0, f205_arg1, f205_arg2 )
	if not IsProgressionEnabled( f205_arg1 ) then
		return false
	else
		local f205_local0 = f205_arg0:getModel( f205_arg1, f205_arg2 .. ".itemindex" )
		if f205_local0 then
			return Engine.AreAnyOpticsNew( f205_arg1, Engine.GetModelValue( f205_local0 ) )
		else
			return false
		end
	end
end

function IsCACAnyAttachmentsNew( f206_arg0, f206_arg1, f206_arg2 )
	if not IsProgressionEnabled( f206_arg1 ) then
		return false
	else
		local f206_local0 = f206_arg0:getModel( f206_arg1, f206_arg2 .. ".itemindex" )
		if f206_local0 then
			return Engine.AreAnyNonOpticAttachmentsNew( f206_arg1, Engine.GetModelValue( f206_local0 ) )
		else
			return false
		end
	end
end

function IsCACAnythingInCACItemNew( f207_arg0 )
	if IsProgressionEnabled( f207_arg0 ) and Engine.IsAnythingInCACNew( f207_arg0 ) then
		return true
	elseif ShowCACExtraClassBreadcrumb( f207_arg0 ) then
		return true
	else
		return false
	end
end

function IsCACAnyScorestreaksNew( f208_arg0 )
	if not IsProgressionEnabled( f208_arg0 ) then
		return false
	else
		return Engine.WeaponGroupHasNewItem( f208_arg0, "killstreak" )
	end
end

function IsCACAnySpecialistsNew( f209_arg0 )
	if IsProgressionEnabled( f209_arg0 ) then
		if Engine.IsLoadoutSlotNew( f209_arg0, "herogadget" ) or Engine.IsLoadoutSlotNew( f209_arg0, "heroweapon" ) then
			return true
		elseif Engine.AreAnyCharacterCustomizationItemsNew( f209_arg0 ) then
			return true
		end
		local f209_local0 = Engine.CurrentSessionMode()
		local f209_local1 = Engine.GetHeroList( f209_local0 )
		for f209_local2 = 0, #f209_local1 - 1, 1 do
			local f209_local5 = Engine.GetHeroBundleInfo( f209_local0, f209_local2 )
			if CoD.CCUtility.GetTauntsAndGesturesNewCount( f209_arg0, f209_local2, f209_local5, f209_local0 ) > 0 then
				return true
			elseif CoD.CCUtility.GetTransmissionNewCount( f209_arg0, f209_local2, f209_local5 ) > 0 then
				return true
			end
		end
	end
	return false
end

function IsCACAnyPersonalizationOptionNew( f210_arg0, f210_arg1, f210_arg2, f210_arg3 )
	if not IsProgressionEnabled( f210_arg3 ) then
		return false
	elseif f210_arg0.menuName ~= "CustomClass" then
		return false
	end
	local f210_local0 = f210_arg1:getModel()
	if f210_local0 then
		local f210_local1 = CoD.SafeGetModelValue( f210_local0, "weaponSlot" )
		local f210_local2 = CoD.SafeGetModelValue( f210_local0, "itemIndex" )
		local f210_local3 = CoD.SafeGetModelValue( f210_local0, "attachmentIndex" )
		local f210_local4 = CoD.SafeGetModelValue( f210_local0, "weaponIndex" )
		if f210_local1 then
			if f210_local2 and f210_local2 > CoD.CACUtility.EmptyItemIndex and (f210_local1 == "primary" or f210_local1 == "secondary") then
				return Engine.IsWeaponOptionGroupNew( f210_arg3, f210_local2, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
			elseif f210_local3 and f210_local3 > CoD.CACUtility.EmptyItemIndex and (f210_local1 == "primaryattachment1" or f210_local1 == "secondaryattachment1") then
				return Engine.IsWeaponOptionGroupNew( f210_arg3, f210_local3, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE )
			elseif f210_local2 and f210_local2 > CoD.CACUtility.EmptyItemIndex and (LUI.startswith( f210_local1, "primaryattachment" ) or LUI.startswith( f210_local1, "secondaryattachment" )) then
				return Engine.IsAnyACVItemNew( f210_arg3, f210_local4, f210_local3, Engine.CurrentSessionMode() )
			end
		end
	end
	return false
end

function IsCACAnyCamoNew( f211_arg0, f211_arg1 )
	if not IsProgressionEnabled( f211_arg1 ) then
		return false
	elseif f211_arg0.isCamo == true and f211_arg0.weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		return Engine.IsWeaponOptionGroupNew( f211_arg1, f211_arg0.weaponItemIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
	else
		return false
	end
end

function IsCACAnyBubblegumNew( f212_arg0 )
	if not IsProgressionEnabled( f212_arg0 ) then
		return false
	end
	for f212_local3, f212_local4 in ipairs( CoD.CACUtility.BGBBuffGroups ) do
		if Engine.WeaponGroupHasNewItem( f212_arg0, f212_local4 ) then
			return true
		end
	end
	return false
end

function IsCACItemPurchased( f213_arg0, f213_arg1 )
	if not (not IsZombies() or CoD.PrestigeUtility.isInPermanentUnlockMenu) or not IsProgressionEnabled( f213_arg1 ) then
		return true
	end
	local f213_local0 = nil
	local f213_local1 = f213_arg0.itemIndex
	if not f213_local1 then
		f213_local0 = f213_arg0:getModel( f213_arg1, "itemIndex" )
		if f213_local0 then
			f213_local1 = Engine.GetModelValue( f213_local0 )
		end
	end
	if f213_local1 then
		return Engine.IsItemPurchased( f213_arg1, f213_local1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	end
	return false
end

function ShouldShowTokenIconOnItem( f214_arg0, f214_arg1, f214_arg2 )
	if Engine.IsZombiesGame() then
		return false
	else
		local f214_local0
		if not IsCACItemLocked( f214_arg0, f214_arg1, f214_arg2 ) and not IsCACItemPurchased( f214_arg1, f214_arg2 ) then
			f214_local0 = not IsCurrentMenuAttachmentMenu( f214_arg0 )
		else
			f214_local0 = false
		end
	end
	if Engine.IsCampaignGame() and not f214_local0 then
		f214_local0 = IsCACItemUpgradable( f214_arg0, f214_arg1, f214_arg2 )
	end
	return f214_local0
end

function IsCACItemUpgraded( f215_arg0, f215_arg1, f215_arg2 )
	if IsCACItemLocked( f215_arg0, f215_arg1, f215_arg2 ) then
		return false
	end
	local f215_local0 = f215_arg1.upgradeItemIndex
	if not f215_local0 then
		local f215_local1 = f215_arg1:getModel( f215_arg2, "upgradeItemIndex" )
		if f215_local1 then
			f215_local0 = Engine.GetModelValue( f215_local1 )
		end
	end
	if not f215_local0 then
		return false
	elseif not IsProgressionEnabled( f215_arg2 ) then
		return true
	end
	return Engine.IsItemPurchased( f215_arg2, f215_local0 )
end

function IsCACItemBanned( f216_arg0, f216_arg1, f216_arg2 )
	local f216_local0 = f216_arg1:getModel( f216_arg2, "itemIndex" )
	if f216_local0 then
		return Engine.GetItemRestrictionState( Engine.GetModelValue( f216_local0 ) ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
	else
		return false
	end
end

function IsCACItemUpgradable( f217_arg0, f217_arg1, f217_arg2 )
	if IsCACItemLocked( f217_arg0, f217_arg1, f217_arg2 ) then
		return false
	end
	local f217_local0 = f217_arg1.upgradeItemIndex
	if not f217_local0 then
		local f217_local1 = f217_arg1:getModel( f217_arg2, "upgradeItemIndex" )
		if f217_local1 then
			f217_local0 = Engine.GetModelValue( f217_local1 )
		end
	end
	if not f217_local0 then
		return false
	end
	return IsCACItemPurchased( f217_arg1, f217_arg2 ) and not IsCACItemUpgraded( f217_arg0, f217_arg1, f217_arg2 )
end

function IsCACSlotUpgradable( f218_arg0, f218_arg1, f218_arg2 )
	if not f218_arg1:getModel() then
		return false
	else
		local f218_local0 = GetUpgradableItemRef( f218_arg0, f218_arg1, f218_arg2 )
		if f218_local0 then
			return not LUI.endswith( f218_local0, "_pro" )
		else
			return false
		end
	end
end

function IsCACSlotUpgraded( f219_arg0, f219_arg1, f219_arg2 )
	if not f219_arg1:getModel() then
		return false
	else
		local f219_local0 = GetUpgradableItemRef( f219_arg0, f219_arg1, f219_arg2 )
		if f219_local0 then
			return LUI.endswith( f219_local0, "_pro" )
		else
			return false
		end
	end
end

function IsWeaponPrestigeLevelAtLeast( f220_arg0, f220_arg1, f220_arg2 )
	local f220_local0 = f220_arg0:getModel()
	if f220_local0 then
		local f220_local1 = CoD.SafeGetModelValue( f220_local0, "itemIndex" )
		return f220_local1 and f220_arg2 <= CoD.CACUtility.GetWeaponPLevel( f220_arg1, f220_local1 )
	else
		return false
	end
end

function IsCACHaveTokens( f221_arg0 )
	return Engine.GetCurrentTokens( f221_arg0, "weapon_smg", CoD.PrestigeUtility.GetPermanentUnlockMode() ) > 0
end

function ShouldCACDisplayTokens( f222_arg0 )
	if IsMultiplayer() then
		if IsLive() and not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) and not IsInGame() and not IsMaxPrestigeLevelForMode( f222_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
			return true
		end
	elseif IsCampaign() then
		if CoD.isSafehouse and not CoD.perController[f222_arg0].everythingUnlocked then
			return true
		end
	elseif IsFirstTimeSetup( f222_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
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

function IsProgressionEnabled( f224_arg0 )
	local f224_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if IsMultiplayer() and IsLive() and f224_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
		return true
	elseif CoD.PrestigeUtility.isInPermanentUnlockMenu and IsLive() and not Engine.IsInGame() then
		return true
	elseif IsCampaign() and not CoD.perController[f224_arg0].everythingUnlocked then
		return true
	elseif IsZombies() and IsLive() and not Engine.IsInGame() then
		return true
	else
		return false
	end
end

function IsClassAllocationInState( f225_arg0, f225_arg1 )
	return Engine.GetMaxAllocation( f225_arg0 ) == f225_arg1
end

function IsProgressionElementItemLocked( f226_arg0, f226_arg1, f226_arg2 )
	if not IsProgressionEnabled( f226_arg2 ) then
		return false
	else
		return f226_arg1.isLocked
	end
end

function IsCACItemLocked( f227_arg0, f227_arg1, f227_arg2 )
	if not IsProgressionEnabled( f227_arg2 ) then
		return false
	else
		return IsCACItemLockedHelper( f227_arg0, f227_arg1, f227_arg2 )
	end
end

function IsBGBItemLocked( f228_arg0, f228_arg1, f228_arg2 )
	local f228_local0 = CoD.SafeGetModelValue( f228_arg1:getModel(), "dlcIndex" )
	if not f228_local0 or f228_local0 < CoD.CONTENT_DLC1_INDEX then
		return IsProgressionEnabled( f228_arg2 ) and IsCACItemLockedHelper( f228_arg0, f228_arg1, f228_arg2 )
	elseif not Engine.HasEntitlementByOwnership( f228_arg2, "dlc" .. f228_local0 - CoD.CONTENT_DLCZM0_INDEX ) then
		if f228_local0 == CoD.CONTENT_DLC3_INDEX then
			return not Engine.HasEntitlementByOwnership( f228_arg2, "dlc3zm" )
		elseif f228_local0 == CoD.CONTENT_DLC4_INDEX then
			return not Engine.HasEntitlementByOwnership( f228_arg2, "dlc4zm" )
		else
			return true
		end
	else
		return false
	end
end

function IsCACItemLockedForGamesCom( f229_arg0, f229_arg1, f229_arg2 )
	if not IsProgressionEnabled( f229_arg2 ) and not IsGamesComBuild() then
		return false
	else
		return IsCACItemLockedHelper( f229_arg0, f229_arg1, f229_arg2 )
	end
end

function IsCACItemLockedForBeta( f230_arg0, f230_arg1, f230_arg2 )
	if not IsProgressionEnabled( f230_arg2 ) and not LuaUtils.IsBetaBuild() then
		return false
	else
		return IsCACItemLockedHelper( f230_arg0, f230_arg1, f230_arg2 )
	end
end

function IsCACItemLockedOrNotPurchased( f231_arg0, f231_arg1, f231_arg2 )
	local f231_local0 = IsCACItemLocked( f231_arg0, f231_arg1, f231_arg2 )
	if not f231_local0 then
		f231_local0 = not IsCACItemPurchased( f231_arg1, f231_arg2 )
	end
	return f231_local0
end

function IsItemRefLocked( f232_arg0, f232_arg1 )
	local f232_local0 = Engine.GetItemIndexFromReference( f232_arg1 )
	if f232_local0 then
		return Engine.IsItemLocked( f232_arg0, f232_local0 )
	else
		return true
	end
end

function IsNonAttachmentItemLocked( f233_arg0, f233_arg1 )
	if not IsProgressionEnabled( f233_arg0 ) then
		return false
	else
		local f233_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f233_local1 = Engine.GetItemIndexFromReference( f233_arg1, f233_local0 )
		if f233_local1 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemLocked( f233_arg0, f233_local1, f233_local0 )
		else
			return false
		end
	end
end

function IsCACItemMutuallyExclusiveWithSelection( f234_arg0, f234_arg1 )
	local f234_local0 = CoD.perController[f234_arg1].weaponCategory
	local f234_local1 = CoD.CACUtility.EmptyItemIndex
	local f234_local2 = f234_arg0:getModel( f234_arg1, "itemIndex" )
	if f234_local2 then
		f234_local1 = Engine.GetModelValue( f234_local2 )
	end
	if not f234_local0 then
		f234_local0 = Engine.GetLoadoutSlotForItem( f234_local1 )
	end
	if f234_local0 then
		local f234_local3 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f234_local0, f234_arg1, f234_local1 )
		for f234_local4 = 1, #f234_local3, 1 do
			if f234_local3[f234_local4] ~= "" then
				return true
			end
		end
	end
	return false
end

function IsMenuPreviewImageSquare( f235_arg0 )
	if f235_arg0.menuName == "PerkSelect" or f235_arg0.menuName == "LethalEquipmentSelect" or f235_arg0.menuName == "TacticalEquipmentSelect" or f235_arg0.menuName == "TacticalRigSelect" or f235_arg0.menuName == "WildcardSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuCybercoreOrRigMenu( f236_arg0 )
	if f236_arg0.menuName == "TacticalRigSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuEquipmentMenu( f237_arg0 )
	if f237_arg0.menuName == "PerkSelect" or f237_arg0.menuName == "LethalEquipmentSelect" or f237_arg0.menuName == "TacticalEquipmentSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuAttachmentMenu( f238_arg0 )
	if f238_arg0.menuName == "PrimaryAttachmentSelect" or f238_arg0.menuName == "PrimaryOpticSelect" or f238_arg0.menuName == "SecondaryAttachmentSelect" or f238_arg0.menuName == "SecondaryOpticSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponMenu( f239_arg0 )
	if f239_arg0.menuName == "PrimaryWeaponSelect" or f239_arg0.menuName == "SecondaryWeaponSelect" or f239_arg0.menuName == "WeaponBuildKits" or f239_arg0.menuName == "WeaponBuildKitsCustomizeVariant" or f239_arg0.menuName == "WeaponBuildKitsCategorySelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponType( f240_arg0 )
	if IsCurrentMenuAttachmentMenu( f240_arg0 ) or IsCurrentMenuWeaponMenu( f240_arg0 ) then
		return true
	else
		return false
	end
end

function IsMulticoreActivated( f241_arg0 )
	if Engine.IsCampaignGame() then
		local f241_local0 = IsInTrainingSim( f241_arg0 )
		local f241_local1 = Dvar.allItemsUnlocked:get()
		if not f241_local1 then
			f241_local1 = f241_local0 or not IsItemRefLocked( f241_arg0, "feature_multicore" )
		end
		return f241_local1
	else
		return false
	end
end

function IsInTrainingSim( f242_arg0 )
	if Engine.IsCampaignGame() then
		local f242_local0 = Engine.GetModel( Engine.GetModelForController( f242_arg0 ), "safehouse.inTrainingSim" )
		local f242_local1 = false
		if f242_local0 then
			f242_local1 = Engine.GetModelValue( f242_local0 ) > 0
		end
		return f242_local1
	else
		return false
	end
end

function IsCybercoreMenuDisabled( f243_arg0 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f243_arg0 ), "hudItems.cybercoreSelectMenuDisabled" ) == 1
end

function IsCybercoreItemEquipped( f244_arg0, f244_arg1, f244_arg2 )
	local f244_local0 = Engine.GetEquippedCybercore( f244_arg2 )
	local f244_local1 = f244_arg1:getModel( f244_arg2, "itemIndex" )
	if f244_local1 then
		return Engine.GetModelValue( f244_local1 ) == f244_local0
	else
		return false
	end
end

function IsCybercoreAbilityAvailable( f245_arg0, f245_arg1 )
	local f245_local0 = f245_arg0:getModel()
	if f245_local0 then
		if Engine.IsItemPurchased( f245_arg1, Engine.GetModelValue( Engine.GetModel( f245_local0, "baseItemIndex" ) ) ) then
			return true
		end
		local f245_local1 = Engine.GetModelValue( Engine.GetModel( f245_local0, "prereqItemIndex" ) )
		if f245_local1 ~= -1 then
			return Engine.IsItemPurchased( f245_arg1, f245_local1 )
		end
	end
	return false
end

function IsCybercoreAbilityPurchasable( f246_arg0, f246_arg1 )
	local f246_local0 = f246_arg0:getModel()
	if f246_local0 then
		return not Engine.IsItemPurchased( f246_arg1, Engine.GetModelValue( Engine.GetModel( f246_local0, "baseItemIndex" ) ) )
	else
		return false
	end
end

function IsCybercoreAbilityUpgradable( f247_arg0, f247_arg1 )
	local f247_local0 = f247_arg0:getModel()
	if f247_local0 then
		local f247_local1 = Engine.GetModelValue( Engine.GetModel( f247_local0, "baseItemIndex" ) )
		local f247_local2 = Engine.GetModelValue( Engine.GetModel( f247_local0, "upgradeItemIndex" ) )
		if Engine.IsItemPurchased( f247_arg1, f247_local1 ) and f247_local2 then
			return not Engine.IsItemPurchased( f247_arg1, f247_local2 )
		end
	end
	return false
end

function IsCybercoreAbilityUpgraded( f248_arg0, f248_arg1 )
	local f248_local0 = f248_arg0:getModel()
	if f248_local0 then
		local f248_local1 = Engine.GetModelValue( Engine.GetModel( f248_local0, "upgradeItemIndex" ) )
		if f248_local1 then
			return Engine.IsItemPurchased( f248_arg1, f248_local1 )
		else
			return true
		end
	else
		return false
	end
end

function IsBubbleGumPackClassSelectedBubbleGumPack( f249_arg0, f249_arg1 )
	local f249_local0 = f249_arg1:getModel()
	local f249_local1 = f249_arg0:getModel()
	if f249_local0 and f249_local1 and f249_local0 == f249_local1 then
		return true
	else
		return false
	end
end

function IsCurrentClassSelectedClass( f250_arg0, f250_arg1 )
	local f250_local0 = f250_arg1:getModel()
	local f250_local1 = f250_arg0:getModel()
	if f250_local0 and f250_local1 and f250_local0 == f250_local1 then
		return true
	else
		return false
	end
end

function IsCACSlotEquipped( f251_arg0, f251_arg1, f251_arg2 )
	if not f251_arg2 then
		return false
	end
	local f251_local0 = f251_arg1:getModel( f251_arg2, "customWeaponSlot" )
	local f251_local1 = nil
	if f251_local0 then
		f251_local1 = Engine.GetModelValue( f251_local0 )
	end
	if f251_local1 then
		local f251_local2 = f251_arg0:getModel( f251_arg2, f251_local1 )
		if f251_local2 then
			local f251_local3 = Engine.GetModel( f251_local2, "itemIndex" )
			if f251_local3 then
				local f251_local4 = Engine.GetModelValue( f251_local3 )
				local f251_local5, f251_local6 = string.find( f251_local1, "%." )
				return CoD.CACUtility.GetAttachedItemSlot( f251_arg0:getModel(), f251_local4, CoD.CACUtility.GetAttachmentListForSlot( string.sub( f251_local1, 0, f251_local5 - 1 ) ) ) ~= nil
			end
		end
	else
		local f251_local2 = f251_arg0:getModel()
		local f251_local3 = GetWeaponSlotModel( f251_arg0, f251_arg1, f251_arg2, f251_local2 )
		if f251_local3 then
			local f251_local4, f251_local5, f251_local6 = CoD.CACUtility.GetCACSlotStatus( f251_arg2, f251_local2, f251_local3 )
			return f251_local5
		end
	end
	return false
end

function IsSecondaryAttachmentEquippedWithNoPersonalization( f252_arg0, f252_arg1, f252_arg2 )
	if IsCACCustomizationDWAttachmentItemEquipped( f252_arg0, f252_arg1, f252_arg2 ) then
		return true
	elseif not IsLive() and IsCACSlotEquipped( f252_arg0, f252_arg1, f252_arg2 ) then
		return true
	else
		return false
	end
end

function IsCACSlotAvailable( f253_arg0, f253_arg1, f253_arg2 )
	local f253_local0 = f253_arg0:getModel()
	local f253_local1 = GetWeaponSlotModel( f253_arg0, f253_arg1, f253_arg2, f253_local0 )
	if f253_local1 then
		local f253_local2, f253_local3, f253_local4 = CoD.CACUtility.GetCACSlotStatus( f253_arg2, f253_local0, f253_local1 )
		return f253_local2 == CoD.CACUtility.CACStatusAvailable.AVAILABLE
	else
		return false
	end
end

function IsCACSecondLethalAvailable( f254_arg0, f254_arg1, f254_arg2 )
	if IsCACSlotAvailable( f254_arg0, f254_arg1, f254_arg2 ) then
		if not IsCACSpecificWildcardEquipped( f254_arg0, "bonuscard_danger_close" ) then
			return true
		elseif IsCACSpecificSlotEquipped( f254_arg0, f254_arg2, "primarygadget" ) then
			return true
		end
	end
	return false
end

function IsCACSlotNeedWildcard( f255_arg0, f255_arg1, f255_arg2 )
	local f255_local0 = GetWeaponSlotModel( f255_arg0, f255_arg1, f255_arg2, f255_arg0:getModel() )
	if f255_local0 and CoD.CACUtility.WildcardNeededForSlot( f255_arg2, f255_local0 ) then
		return true
	else
		return false
	end
end

function IsCACSlotCanEquipWildcard( f256_arg0, f256_arg1, f256_arg2 )
	local f256_local0 = GetWeaponSlotModel( f256_arg0, f256_arg1, f256_arg2, f256_arg0:getModel() )
	if f256_local0 then
		local f256_local1, f256_local2 = CoD.CACUtility.WildcardNeededForSlot( f256_arg2, f256_local0 )
		if f256_local1 then
			return f256_local2
		end
	end
	return false
end

function IsCACSlotWildcardLocked( f257_arg0, f257_arg1, f257_arg2 )
	local f257_local0 = GetWeaponSlotModel( f257_arg0, f257_arg1, f257_arg2, f257_arg0:getModel() )
	if f257_local0 then
		local f257_local1, f257_local2, f257_local3 = CoD.CACUtility.WildcardNeededForSlot( f257_arg2, f257_local0 )
		if f257_local1 then
			return f257_local3
		end
	end
	return false
end

function IsCACSlotWeaponForAttachmentEquipped( f258_arg0, f258_arg1, f258_arg2 )
	local f258_local0 = f258_arg1:getModel()
	local f258_local1 = f258_arg0:getModel()
	if f258_local0 then
		local f258_local2 = Engine.GetModel( f258_local0, "weaponSlot" )
		if f258_local2 then
			local f258_local3 = Engine.GetModelValue( f258_local2 )
			if LUI.startswith( f258_local3, "primaryattachment" ) then
				local f258_local4, f258_local5, f258_local6 = CoD.CACUtility.GetCACSlotStatus( f258_arg2, f258_local1, "primary" )
				return f258_local5
			elseif LUI.startswith( f258_local3, "secondaryattachment" ) then
				local f258_local4, f258_local5, f258_local6 = CoD.CACUtility.GetCACSlotStatus( f258_arg2, f258_local1, "secondary" )
				return f258_local5
			end
		end
	end
	return false
end

function IsCACSlotSpecificItemEquipped( f259_arg0, f259_arg1, f259_arg2 )
	local f259_local0 = f259_arg0:getModel( f259_arg1, "itemIndex" )
	if f259_local0 then
		local f259_local1 = Engine.GetModelValue( f259_local0 )
		if f259_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetItemRef( f259_local1 ) == f259_arg2 then
			return true
		end
	end
	return false
end

function IsCACEquippedWildcardItemCount( f260_arg0, f260_arg1, f260_arg2 )
	return f260_arg2 == CoD.CACUtility.SpecificWildcardEquippedCount( f260_arg0:getModel(), f260_arg1 )
end

function IsCACCountGreaterThanEquippedWildcardItem( f261_arg0, f261_arg1, f261_arg2 )
	return f261_arg2 <= CoD.CACUtility.SpecificWildcardEquippedCount( f261_arg0:getModel(), f261_arg1 )
end

function IsCACPrimaryGunfighterCountEqualTo( f262_arg0, f262_arg1 )
	return f262_arg1 == CoD.CACUtility.PrimaryGunfighterEquippedCount( f262_arg0:getModel() )
end

function IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( f263_arg0, f263_arg1 )
	return f263_arg1 <= CoD.CACUtility.PrimaryGunfighterEquippedCount( f263_arg0:getModel() )
end

function IsCACPrimaryAttachmentSlotLockedByWildcard( f264_arg0 )
	local f264_local0 = IsNonAttachmentItemLocked( f264_arg0, "bonuscard_primary_gunfighter" )
	if f264_local0 then
		f264_local0 = IsNonAttachmentItemLocked( f264_arg0, "bonuscard_primary_gunfighter_2" )
	end
	if f264_local0 then
		f264_local0 = IsNonAttachmentItemLocked( f264_arg0, "bonuscard_primary_gunfighter_3" )
	end
	return f264_local0
end

function IsCACAttachmentSlotVisible( f265_arg0, f265_arg1, f265_arg2, f265_arg3 )
	if IsCACSlotWeaponForAttachmentEquipped( f265_arg0, f265_arg1, f265_arg2 ) then
		return not IsCACCountGreaterThanEquippedWildcardItem( f265_arg0, "bonuscard_primary_gunfighter", f265_arg3 )
	else
		return IsCACCountGreaterThanEquippedWildcardItem( f265_arg0, "bonuscard_primary_gunfighter", 0 )
	end
end

function IsHintTextLeftAlign( f266_arg0, f266_arg1 )
	local f266_local0 = f266_arg0:getModel( f266_arg1, "weaponSlot" )
	if f266_local0 and LUI.startswith( Engine.GetModelValue( f266_local0 ), "primarygadget" ) then
		return true
	else
		return false
	end
end

function IsHintTextRightAlign( f267_arg0, f267_arg1 )
	local f267_local0 = f267_arg0:getModel( f267_arg1, "weaponSlot" )
	if f267_local0 then
		local f267_local1 = Engine.GetModelValue( f267_local0 )
		if f267_local1 == "primaryattachment3" or f267_local1 == "primaryattachment6" or f267_local1 == "secondaryattachment3" or f267_local1 == "specialty3" or f267_local1 == "specialty6" then
			return true
		end
	end
	return false
end

function IsCACSpecificWildcardEquipped( f268_arg0, f268_arg1 )
	local f268_local0 = f268_arg0:getModel()
	if f268_local0 then
		return CoD.CACUtility.IsBonusCardEquipped( f268_arg1, f268_local0 )
	else
		return false
	end
end

function IsCACSpecificSlotEquipped( f269_arg0, f269_arg1, f269_arg2 )
	local f269_local0 = f269_arg0:getModel()
	if f269_local0 then
		local f269_local1, f269_local2, f269_local3 = CoD.CACUtility.GetCACSlotStatus( f269_arg1, f269_local0, f269_arg2 )
		return f269_local2
	else
		return false
	end
end

function IsCACGadgetModAvailable( f270_arg0, f270_arg1, f270_arg2 )
	local f270_local0 = f270_arg0:getModel()
	if not f270_arg2 or not f270_local0 then
		return false
	end
	local f270_local1 = f270_arg1:getModel( f270_arg2, "weaponSlot" )
	if not f270_local1 then
		return false
	end
	local f270_local2 = Engine.GetModelValue( f270_local1 )
	local f270_local3 = "primarygadget"
	if LUI.startswith( f270_local2, "primarygadgetattachment" ) then
		f270_local3 = "primarygadget"
	elseif LUI.startswith( f270_local2, "secondarygadgetattachment" ) then
		f270_local3 = "secondarygadget"
	end
	if CoD.CACUtility.ItemEquippedInSlot( f270_local3, f270_arg2 ) then
		local f270_local4 = Engine.GetModel( f270_local0, f270_local3 .. ".cust" .. f270_local2 .. ".itemIndex" )
		if f270_local4 and Engine.GetModelValue( f270_local4 ) > CoD.CACUtility.EmptyItemIndex then
			return true
		end
	end
	return false
end

function IsCACThirdPrimaryAttachmentAvailable( f271_arg0 )
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( CoD.perController[f271_arg0].classModel ) >= 1
end

function IsCACFifthPrimaryAttachmentAvailable( f272_arg0 )
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( CoD.perController[f272_arg0].classModel ) >= 2
end

function IsCACTakeTwoPrimaryGadgetAttachmentEquipped( f273_arg0 )
	return SearchForTakeTwoGadgetMod( f273_arg0:getModel(), CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoSecondaryGadgetAttachmentEquipped( f274_arg0 )
	return SearchForTakeTwoGadgetMod( f274_arg0:getModel(), CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoPrimaryGadgetAttachment( f275_arg0, f275_arg1 )
	return IsTakeTwoGadgetAttachmentForSlot( f275_arg0:getModel(), f275_arg1:getModel(), "primarygadget" )
end

function IsCACTakeTwoSecondaryGadgetAttachment( f276_arg0, f276_arg1 )
	return IsTakeTwoGadgetAttachmentForSlot( f276_arg0:getModel(), f276_arg1:getModel(), "secondarygadget" )
end

function IsPrimaryWeaponAttachmentAvailable( f277_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "primary", f277_arg0 ) and GetNumberOfAttachmentsForSlot( "primary", f277_arg0 ) > 0
end

function IsSecondaryWeaponAttachmentAvailable( f278_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "secondary", f278_arg0 ) and GetNumberOfAttachmentsForSlot( "secondary", f278_arg0 ) > 0
end

function IsCACWeaponVariantAvailable( f279_arg0, f279_arg1 )
	if not Gunsmith_IsEnabled( f279_arg0, f279_arg1 ) then
		return false
	end
	local f279_local0 = f279_arg0:getModel()
	if f279_local0 then
		if CoD.perController[f279_arg1].weaponSlot and CoD.SafeGetModelValue( f279_local0, "loadoutSlot" ) ~= CoD.perController[f279_arg1].weaponSlot then
			return false
		end
		local f279_local1 = Engine.GetModel( f279_local0, "ref" )
		local f279_local2 = Engine.GetModel( f279_local0, "itemIndex" )
		if f279_local2 then
			local f279_local3 = Engine.GetModelValue( f279_local2 )
			local f279_local4 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f279_local3 )
			if #f279_local4 > 1 or #f279_local4 == 1 and CoD.CraftUtility.Gunsmith.AreMaxVariantSlotsUsed() then
				CoD.perController[f279_arg1].weaponIndexForVariant = f279_local3
				return true
			end
		end
	end
	return false
end

function IsBaseWeaponVariantIndex( f280_arg0, f280_arg1, f280_arg2 )
	local f280_local0 = f280_arg1:getModel( f280_arg2, "cacVariantIndex" )
	if f280_local0 then
		return Engine.GetModelValue( f280_local0 ) == 0
	else
		return false
	end
end

function IsCACSlotHasVariantName( f281_arg0 )
	local f281_local0 = f281_arg0:getModel()
	if f281_local0 then
		local f281_local1 = Engine.GetModel( f281_local0, "variantName" )
		if f281_local1 and Engine.GetModelValue( f281_local1 ) ~= "" then
			return true
		end
	end
	return false
end

function DoesWeaponVariantContainLockedItems( f282_arg0, f282_arg1, f282_arg2 )
	if IsProgressionEnabled( f282_arg2 ) and f282_arg1.weaponVariantInfo then
		return f282_arg1.weaponVariantInfo.hasLockedItems
	else
		return false
	end
end

function DoesWeaponVariantContainLockedAttachments( f283_arg0, f283_arg1, f283_arg2 )
	if IsProgressionEnabled( f283_arg2 ) and f283_arg1.weaponVariantInfo then
		return f283_arg1.weaponVariantInfo.hasLockedAttachments
	else
		return false
	end
end

function IsCACWeaponAttributeIncrease( f284_arg0, f284_arg1, f284_arg2 )
	if f284_arg0:getModel( f284_arg1, f284_arg2 ) then
		return WeaponAttributeCompare( Engine.GetModelValue( f284_arg0:getModel( f284_arg1, f284_arg2 ) ) )
	else
		return false
	end
end

function IsCACGunLevelMax( f285_arg0, f285_arg1, f285_arg2 )
	local f285_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f285_arg2, f285_arg1 )
	if f285_local0 == CoD.CACUtility.EmptyItemIndex then
		return false
	else
		return IsWeaponLevelMax( f285_local0, f285_arg2, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	end
end

function IsCACGunLevelExists( f286_arg0, f286_arg1, f286_arg2 )
	if not IsProgressionEnabled( f286_arg2 ) then
		return false
	else
		local f286_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f286_arg2, f286_arg1 )
		if Engine.IsCampaignGame() then
			local f286_local1 = CoD.GetAttachments( f286_local0 )
			if f286_local1 then
				f286_local1 = #CoD.GetAttachments( f286_local0 ) > 0
			end
			local f286_local2
			if f286_local0 ~= CoD.CACUtility.EmptyItemIndex then
				f286_local2 = f286_local1
			else
				f286_local2 = false
			end
			return f286_local2
		else
			return f286_local0 ~= CoD.CACUtility.EmptyItemIndex
		end
	end
end

function AllowWeaponPrestige( f287_arg0 )
	return IsMultiplayer() and IsProgressionEnabled( f287_arg0 ) or Dvar.ui_allowWeaponPrestige:get()
end

function CanPrestigeWeapon( f288_arg0, f288_arg1 )
	if IsArenaMode() then
		return false
	elseif not AllowWeaponPrestige( f288_arg1 ) then
		return false
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "WGSV_Category" ) == CoD.WGSV_Category.WEAPON then
		local f288_local0 = f288_arg0:getModel()
		if f288_local0 then
			return IsWeaponLevelMax( f288_local1, f288_arg1, Engine.CurrentSessionMode() ) and f288_local2 and CoD.CACUtility.GetWeaponPLevel( f288_arg1, f288_local1 ) < CoD.CACUtility.maxWeaponPrestige
		end
	end
	return false
end

function IsItemWeaponOptionNew( f289_arg0, f289_arg1 )
	if not IsProgressionEnabled( f289_arg1 ) then
		return false
	else
		local f289_local0 = CoD.perController[f289_arg1].classModel
		local f289_local1 = CoD.perController[f289_arg1].weaponCategory
		local f289_local2 = f289_arg0:getModel()
		local f289_local3 = CoD.SafeGetModelValue( f289_local2, "weaponOptionSubIndex" )
		local f289_local4 = CoD.SafeGetModelValue( f289_local2, "weaponOptionType" )
		if f289_local3 and f289_local4 and f289_local4 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and f289_local3 > CoD.CACUtility.EmptyItemIndex then
			local f289_local5 = Engine.GetModelValue( Engine.GetModel( f289_local0, f289_local1 .. ".itemIndex" ) )
			local f289_local6 = Engine.GetWeaponOptionGroupIndex( f289_local3, f289_local4 )
			if f289_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
				f289_local5 = Engine.GetItemAttachment( CoD.SafeGetModelValue( f289_local0, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f289_local1 ) .. ".itemIndex" ), f289_local5 )
			end
			return Engine.IsWeaponOptionNew( f289_arg1, f289_local5, f289_local6 )
		else
			return false
		end
	end
end

function IsItemWeaponOptionEquipped( f290_arg0, f290_arg1 )
	local f290_local0 = CoD.perController[f290_arg1].classModel
	local f290_local1 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[f290_arg1].weaponCategory )
	local f290_local2 = f290_arg0:getModel( f290_arg1, "weaponOptionTypeName" )
	local f290_local3 = f290_arg0:getModel( f290_arg1, "weaponOptionSubIndex" )
	local f290_local4 = f290_arg0:getModel( f290_arg1, "weaponOptionType" )
	if f290_local2 and f290_local3 and f290_local4 then
		local f290_local5 = Engine.GetModelValue( f290_local2 )
		local f290_local6 = Engine.GetModelValue( f290_local3 )
		if Engine.GetModelValue( f290_local4 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			if CoD.CACUtility.GetItemEquippedInSlot( f290_local1 .. "paintjobIndex", f290_arg1, f290_local0 ) == Engine.GetModelValue( f290_arg0:getModel( f290_arg1, "paintjobIndex" ) ) and CoD.CACUtility.GetItemEquippedInSlot( f290_local1 .. "paintjobSlot", f290_arg1, f290_local0 ) == Engine.GetModelValue( f290_arg0:getModel( f290_arg1, "paintjobSlot" ) ) then
				return true
			end
		elseif CoD.CACUtility.GetItemEquippedInSlot( f290_local1 .. f290_local5, f290_arg1 ) == f290_local6 then
			return true
		end
	end
	return false
end

function IsItemWeaponOptionLocked( f291_arg0, f291_arg1, f291_arg2 )
	if not IsCACPersonalizationProgressionEnabled( f291_arg1, f291_arg2 ) then
		return false
	end
	local f291_local0 = CoD.perController[f291_arg2].classModel
	local f291_local1 = CoD.perController[f291_arg2].weaponCategory
	local f291_local2 = Engine.GetModel( f291_local0, f291_local1 .. ".itemIndex" )
	local f291_local3 = f291_arg1:getModel( f291_arg2, "weaponOptionSubIndex" )
	local f291_local4 = f291_arg1:getModel( f291_arg2, "weaponOptionType" )
	if f291_local2 and f291_local3 and f291_local4 then
		local f291_local5 = Engine.GetModelValue( f291_local2 )
		local f291_local6 = Engine.GetModelValue( f291_local3 )
		local f291_local7 = Engine.GetModelValue( f291_local4 )
		local f291_local8 = Engine.GetWeaponOptionGroupIndex( f291_local6, f291_local7 )
		if f291_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local f291_local9 = CoD.SafeGetModelValue( f291_local0, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f291_local1 ) .. ".itemIndex" )
			if not f291_local9 then
				return true
			end
			f291_local5 = Engine.GetItemAttachment( f291_local9, f291_local5 )
		end
		if (f291_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f291_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f291_local6 == 0 then
			return false
		elseif f291_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if f291_local6 == 0 then
				return false
			end
			local f291_local10 = Engine.GetAttachmentRef( f291_local5, f291_local6 )
			for f291_local14, f291_local15 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f291_local10 == f291_local15 then
					local f291_local13
					if CoD.CACUtility.GetWeaponPLevel( f291_arg2, f291_local5 ) < f291_local14 then
						f291_local13 = not Dvar.allItemsUnlocked:get()
					else
						f291_local13 = false
					end
					return f291_local13
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( f291_arg2, f291_local5, f291_local8 )
	end
	return false
end

function GetUnlockSessionMode( f292_arg0, f292_arg1 )
	local f292_local0 = Enum.eModes.MODE_COUNT
	if not f292_arg0 then
		return f292_local0
	end
	local f292_local1 = f292_arg0:getModel( f292_arg1, "unlockSessionMode" )
	if not f292_local1 then
		f292_local1 = f292_arg0:getModel( f292_arg1, "challengeInfo.unlockSessionMode" )
	end
	if not f292_local1 then
		return f292_local0
	end
	return Engine.GetModelValue( f292_local1 )
end

function ShouldHideItemWeaponOptionInGunsmith( f293_arg0, f293_arg1 )
	local f293_local0 = f293_arg0:getModel( f293_arg1, "weaponOptionSubIndex" )
	local f293_local1 = f293_arg0:getModel( f293_arg1, "weaponOptionType" )
	if not f293_local0 or not f293_local1 then
		return true
	else
		local f293_local2 = GetUnlockSessionMode( f293_arg0, f293_arg1 )
		if f293_local2 == Enum.eModes.MODE_COUNT then
			return true
		elseif not IsLive() and (f293_local2 == Enum.eModes.MODE_MULTIPLAYER or f293_local2 == Enum.eModes.MODE_ZOMBIES) then
			return true
		else
			local f293_local3 = Engine.GetModelValue( f293_local0 )
			local f293_local4 = Engine.GetModelValue( f293_local1 )
			if (f293_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f293_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f293_local3 == 0 then
				return true
			else
				local f293_local5 = f293_arg0:getModel( f293_arg1, "filterMode" )
				if f293_local5 and Engine.GetModelValue( f293_local5 ) == "extras" then
					if f293_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
						return false
					else
						return true
					end
				else
					return false
				end
			end
		end
	end
end

function ShouldHideItemWeaponOption( f294_arg0, f294_arg1 )
	if not IsCACPersonalizationProgressionEnabled( f294_arg0, f294_arg1 ) then
		return true
	elseif CoD.SafeGetModelValue( f294_arg0:getModel(), "isChallengeClassified" ) == true then
		return true
	end
	local f294_local0 = f294_arg0:getModel( f294_arg1, "weaponOptionSubIndex" )
	local f294_local1 = f294_arg0:getModel( f294_arg1, "weaponOptionType" )
	if f294_local0 and f294_local1 then
		local f294_local2 = Engine.GetModelValue( f294_local0 )
		local f294_local3 = Engine.GetModelValue( f294_local1 )
		if (f294_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f294_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f294_local2 == 0 then
			return true
		elseif f294_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			return true
		end
	end
	local f294_local2 = f294_arg0:getModel( f294_arg1, "filterMode" )
	if f294_local2 and Engine.GetModelValue( f294_local2 ) == "extras" then
		if (f294_local1 and Engine.GetModelValue( f294_local1 )) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
			return false
		end
		return true
	end
	return false
end

function IsWeaponPrestigeItem( f295_arg0, f295_arg1 )
	local f295_local0 = f295_arg0:getModel( f295_arg1, "weaponOptionType" )
	if f295_local0 and Engine.GetModelValue( f295_local0 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
		return true
	else
		return false
	end
end

function IsCACPersonalizationProgressionEnabled( f296_arg0, f296_arg1 )
	local f296_local0 = nil
	if IsSpecialContractCamo( f296_arg0, f296_arg1 ) then
		return true
	elseif f296_arg0 then
		local f296_local1 = f296_arg0:getModel( f296_arg1, "unlockSessionMode" )
		if not f296_local1 then
			f296_local1 = f296_arg0:getModel( f296_arg1, "challengeInfo.unlockSessionMode" )
		end
		if f296_local1 then
			f296_local0 = Engine.GetModelValue( f296_local1 )
		end
		if f296_local0 and f296_local0 >= Enum.eModes.MODE_FIRST and f296_local0 < Enum.eModes.MODE_COUNT and (not (f296_local0 ~= Enum.eModes.MODE_CAMPAIGN and (f296_local0 ~= Enum.eModes.MODE_MULTIPLAYER or not IsLive() or IsMultiplayer() and Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ))) or f296_local0 == Enum.eModes.MODE_ZOMBIES and IsLive()) then
			return true
		end
	end
	return false
end

function IsClassOptionDisabled( f297_arg0, f297_arg1, f297_arg2 )
	local f297_local0 = CoD.perController[f297_arg2].classModel
	local f297_local1 = f297_arg1:getModel()
	if f297_local0 and f297_local1 and f297_local0 == f297_local1 then
		f297_arg1.disabled = true
		return true
	else
		return false
	end
end

function IsClassSetOptionDisabled( f298_arg0, f298_arg1, f298_arg2 )
	local f298_local0 = f298_arg1:getModel( f298_arg2, "classSetId" )
	if f298_local0 and Engine.GetModelValue( f298_local0 ) == Engine.GetCurrentClassSetIndex( f298_arg2 ) then
		return true
	else
		return false
	end
end

function IsCurrentItemClassified( f299_arg0, f299_arg1 )
	local f299_local0 = f299_arg0:getModel()
	if f299_local0 then
		local f299_local1 = Engine.GetModel( f299_local0, "isClassified" )
		if f299_local1 then
			return Engine.GetModelValue( f299_local1 )
		end
	end
	return false
end

function IsCurrentACVEquipped( f300_arg0, f300_arg1, f300_arg2 )
	local f300_local0 = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[f300_arg2].weaponCategory .. "cosmeticvariant", f300_arg2, f300_arg0:getModel() )
	local f300_local1 = f300_arg1:getModel( f300_arg2, "variantIndex" )
	if f300_local1 then
		return f300_local0 == Engine.GetModelValue( f300_local1 )
	else
		return false
	end
end

function IsCACACVItemNew( f301_arg0, f301_arg1 )
	if not IsProgressionEnabled( f301_arg1 ) then
		return false
	elseif CoD.SafeGetModelValue( f301_arg0:getModel(), "isBMClassified" ) == true then
		return false
	else
		local f301_local0 = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
		if f301_local0 and f301_arg0.attachmentRef and f301_arg0.variantIndex and f301_arg0.variantIndex > CoD.CACUtility.EmptyItemIndex then
			return IsACVItemNewHelper( f301_arg1, f301_local0, f301_arg0.attachmentTableIndex, f301_arg0.variantIndex, Enum.eModes.MODE_MULTIPLAYER )
		else
			return false
		end
	end
end

function IsClassSetsAvailableForCurrentGameMode()
	return AreCodPointsEnabled( 0 ) and Engine.IsClassSetsAvailableForCurrentGameMode()
end

function IsCallingCardBribeActive()
	return CoD.BlackMarketUtility.GetCurrentBribeString() == "MPUI_BM_BRIBE_CALLINGCARD"
end

function AreCodPointsEnabled( f304_arg0 )
	return IsLive() and IsBooleanDvarSet( "tu4_enableCodPoints" )
end

function ShouldOnlyShowVials( f305_arg0, f305_arg1 )
	return IsLootReady( f305_arg1 ) and not AreCodPointsEnabled( f305_arg1 )
end

function IsThermometerUnlockIndexGreaterThanorEqualTo( f306_arg0 )
	if f306_arg0 <= CoD.GetThermometerUnlockIndex() then
		return true
	else
		
	end
end

function IsThermometerProgressEqualTo( f307_arg0 )
	if CoD.GetThermometerProgress() == f307_arg0 then
		return true
	else
		
	end
end

function IsCommunityContractBreadCrumbActive( f308_arg0 )
	local f308_local0 = Engine.StorageGetBuffer( f308_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if Dvar.ui_enablePromoMenu:get() and f308_local0 and f308_local0.ui_community_contract_milestone and f308_local0.ui_seen_community_contract then
		if f308_local0.ui_seen_community_contract:get() == 0 then
			return true
		elseif f308_local0.ui_community_contract_milestone:get() ~= CoD.GetThermometerUnlockIndex() then
			return true
		end
	end
	return false
end

function IsTrifectaContractBreadcrumbActive( f309_arg0 )
	if not IsTrifectaBundleActive( f309_arg0 ) and not IsGrandSlamActive( f309_arg0 ) then
		return false
	else
		local f309_local0 = CoD.GetPlayerStats( f309_arg0 )
		if f309_local0 and f309_local0.extraBytes then
			return f309_local0.extraBytes[3]:get() < Engine.DvarInt( nil, "loot_trifecta_breadcrumb_index" )
		else
			
		end
	end
end

function IsBlackMarketBreadcrumbActive( f310_arg0 )
	local f310_local0 = CoD.GetPlayerStats( f310_arg0 )
	if f310_local0 and f310_local0.blackMarketShowBreadcrumb and f310_local0.blackMarketShowBreadcrumb:get() == 1 then
		return true
	else
		local f310_local1 = Engine.StorageGetBuffer( f310_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f310_local1 and f310_local1.ui_seen_new_contracts:get() == 0 then
			return true
		elseif IsExperimentPromotionActive( f310_arg0 ) then
			return true
		elseif IsTrifectaContractBreadcrumbActive( f310_arg0 ) then
			return true
		elseif IsNoDupesCrateActive( f310_arg0 ) then
			return true
		elseif Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" ) then
			return true
		else
			return false
		end
	end
end

function IsNewtonsCookbookBreadcrumbActive( f311_arg0 )
	if Engine.DvarBool( nil, "ui_cookbook_discount_active" ) then
		return true
	else
		return false
	end
end

function HasPlayerSeenLatestBlackMarketPromotion( f312_arg0 )
	if ShouldShowSeasonPassIncentiveOverlay( f312_arg0 ) then
		return false
	elseif IsCommunityContractBreadCrumbActive( f312_arg0 ) then
		return false
	else
		local f312_local0 = Engine.StorageGetBuffer( f312_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f312_local0 and f312_local0.ui_seen_new_contracts:get() == 0 then
			return false
		elseif IsExperimentPromotionActive( f312_arg0 ) then
			return false
		elseif IsTrifectaContractBreadcrumbActive( f312_arg0 ) then
			return false
		elseif IsNoDupesCrateActive( f312_arg0 ) then
			return false
		elseif Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" ) then
			return false
		elseif IsGrandSlamActive( f312_arg0 ) and Engine.IsLootReady( f312_arg0 ) and Engine.GetInventoryItemQuantity( f312_arg0, CoD.BlackMarketUtility.loot_grand_slam_drop_id ) == 0 then
			return false
		elseif 0 == CoD.BlackMarketUtility.CurrentPromotionIndex then
			return true
		else
			local f312_local1 = CoD.GetPlayerStats( f312_arg0 )
			if f312_local1 and f312_local1.extraBytes then
				return f312_local1.extraBytes[0]:get() == CoD.BlackMarketUtility.CurrentPromotionIndex
			else
				return true
			end
		end
	end
end

function IsExperimentPromotionActive( f313_arg0 )
	local f313_local0 = "gamedata/events/schedule.csv"
	if Engine.DvarBool( nil, "loot_experimentpromo_active" ) then
		local f313_local1 = Engine.DvarString( nil, "loot_experimentpromo_name" )
		local f313_local2 = Engine.DvarString( nil, "loot_experimentpromo_group" )
		if f313_local1 ~= "" and f313_local2 ~= "" then
			return CoDShared.IsInExperiment( f313_local1, f313_local2 )
		end
	end
	return false
end

function PurchaseExperimentCanShowStoreButton( f314_arg0, f314_arg1 )
	if (IsChildElementInState( f314_arg1, "BlackMarketCODPointContainerSmall", "DefaultState" ) or IsChildElementInState( f314_arg1, "BlackMarketCODPointContainerSmall", "HiddenForLootSale" )) and Engine.DvarBool( nil, "ui_purchaseExperiment" ) then
		return false
	else
		return true
	end
end

function IsPurchaseExperimentActive( f315_arg0, f315_arg1 )
	if Engine.DvarBool( nil, "ui_purchaseExperiment" ) then
		return true
	else
		return false
	end
end

function IsCodeBundlePromotionActive( f316_arg0 )
	if Engine.DvarBool( nil, "loot_code_bundle_active" ) and LuaUtils.GetSkuName() == "SceaEnFr" then
		return not Engine.HasEntitlementByOwnership( f316_arg0, "codemtx03" )
	else
		return false
	end
end

function CanAffordTradeAgain( f317_arg0, f317_arg1 )
	local f317_local0 = CoD.SafeGetModelValue( f317_arg0:getModel(), "itemCost" )
	if f317_local0 ~= nil and f317_local0 > 0 and f317_local0 <= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f317_arg1 ) then
		return true
	else
		local f317_local1 = CoD.SafeGetModelValue( f317_arg0:getModel(), "itemCODPointCost" )
		if f317_local1 ~= nil and f317_local1 > 0 and f317_local1 <= Engine.GetCoDPoints( f317_arg1 ) then
			return true
		else
			local f317_local2 = CoD.SafeGetModelValue( f317_arg0:getModel(), "itemBundleCost" )
			if f317_local2 ~= nil and f317_local2 > 0 and f317_local2 <= CoD.BlackMarketUtility.GetBundleCountForCurrentDropType( f317_arg1 ) then
				return true
			else
				return false
			end
		end
	end
end

function IsInventoryBusy( f318_arg0 )
	return Engine.IsInventoryBusy( f318_arg0 )
end

function CanAffordCrate( f319_arg0, f319_arg1 )
	local f319_local0 = CoD.BlackMarketUtility.GetCrateCODPointCost( f319_arg1 )
	if f319_local0 > 0 and f319_local0 <= Engine.GetCoDPoints( f319_arg0 ) then
		return true
	else
		local f319_local1 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( f319_arg1 )
		if f319_local1 > 0 and f319_local1 <= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f319_arg0 ) then
			return true
		else
			return false
		end
	end
end

function IsCurrentBundleCountGreaterThan( f320_arg0, f320_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBundleCount( f320_arg0 ) > 0
end

function HasSixPackCommonBundles( f321_arg0 )
	return CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f321_arg0 ) > 0
end

function HasDailyDoubleBundles( f322_arg0 )
	return CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f322_arg0 ) > 0
end

function HasBundleExperimentBundles( f323_arg0 )
	return CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f323_arg0 ) > 0
end

function HasNoDupesBundles( f324_arg0 )
	return CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f324_arg0 ) > 0
end

function HasCodeBundles( f325_arg0 )
	return CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f325_arg0 ) > 0
end

function HasWeapon3XBundles( f326_arg0 )
	return CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f326_arg0 ) > 0
end

function HasLimitedEditionCamoBundles( f327_arg0 )
	return CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f327_arg0 ) > 0
end

function BlackMarketListItemCanEquip( f328_arg0, f328_arg1 )
	local f328_local0 = CoD.SafeGetModelValue( f328_arg0:getModel(), "category" )
	if f328_local0 ~= "emblem" and f328_local0 ~= "calling_card" and f328_local0 ~= "specialist_outfit" and f328_local0 ~= "gesture" and f328_local0 ~= "taunt" then
		return false
	else
		local f328_local1 = CoD.SafeGetModelValue( f328_arg0:getModel(), "lockItemText" )
		if f328_local1 == nil or f328_local1 == "" then
			return true
		else
			
		end
	end
end

function BlackMarketHideMasterCallingCards()
	return IsJapaneseSku()
end

function IsItemBlackMarketWeapon( f330_arg0, f330_arg1 )
	if not (not IsZombies() or CoD.PrestigeUtility.isInPermanentUnlockMenu) or not IsProgressionEnabled( f330_arg1 ) then
		return true
	end
	local f330_local0 = nil
	local f330_local1 = f330_arg0.itemIndex
	if not f330_local1 then
		f330_local0 = f330_arg0:getModel( f330_arg1, "itemIndex" )
		if f330_local0 then
			f330_local1 = Engine.GetModelValue( f330_local0 )
		end
	end
	if f330_local1 then
		return CoD.BlackMarketUtility.IsBlackMarketItem( Engine.GetItemRef( f330_local1, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
	end
	return false
end

function CanShowWeaponStatsForCampaign( f331_arg0, f331_arg1 )
	local f331_local0 = f331_arg0:getModel( f331_arg1, "weaponIndex" )
	if f331_local0 then
		local f331_local1 = Engine.GetItemRef( Engine.GetModelValue( f331_local0 ), Enum.eModes.MODE_MULTIPLAYER )
		if f331_local1 ~= "" and f331_local1 ~= "melee_boxing" then
			return not CoD.BlackMarketUtility.IsBlackMarketItem( f331_local1 )
		end
	end
	return false
end

function HasEarnedWeaponContract( f332_arg0 )
	if Engine.AreStatsFetched( f332_arg0 ) and Engine.IsLootReady( f332_arg0 ) and Engine.GetInventoryItemQuantity( f332_arg0, Dvar.weapon_contract_incentive_id:get() ) >= Dvar.weapon_contract_max:get() then
		return true
	else
		return Engine.GetDStat( f332_arg0, "weaponContractData", "completeTimestamp" ) ~= 0
	end
end

function IsDailyContractComplete( f333_arg0 )
	local f333_local0 = CoD.GetContractStatValuesForIndex( f333_arg0, LuaUtils.BMContracts.dailyContractIndex )
	return f333_local0 and f333_local0.targetValue <= f333_local0.progress
end

function AreWeeklyContractsComplete( f334_arg0 )
	local f334_local0 = CoD.GetContractStatValuesForIndex( f334_arg0, LuaUtils.BMContracts.weeklyContractIndex1 )
	local f334_local1 = CoD.GetContractStatValuesForIndex( f334_arg0, LuaUtils.BMContracts.weeklyContractIndex2 )
	if not f334_local0 or not f334_local1 then
		return false
	else
		local f334_local2
		if f334_local0.targetValue > f334_local0.progress or f334_local1.targetValue > f334_local1.progress then
			f334_local2 = false
		else
			f334_local2 = true
		end
	end
	return f334_local2
end

function IsDailyContractValid( f335_arg0 )
	local f335_local0 = CoD.GetContractStatValuesForIndex( f335_arg0, LuaUtils.BMContracts.dailyContractIndex )
	return f335_local0 and f335_local0.index ~= 0
end

function IsIncompleteContractActive( f336_arg0 )
	local f336_local0 = CoD.GetContractStatValuesForIndex( f336_arg0, LuaUtils.BMContracts.specialContractIndex )
	if f336_local0 == nil or f336_local0.index == 0 then
		return not HasEarnedWeaponContract( f336_arg0 )
	else
		return not f336_local0.isAwardGiven
	end
end

function AreWeeklyContractsValid( f337_arg0 )
	local f337_local0 = CoD.GetContractStatValuesForIndex( f337_arg0, LuaUtils.BMContracts.weeklyContractIndex1 )
	local f337_local1 = CoD.GetContractStatValuesForIndex( f337_arg0, LuaUtils.BMContracts.weeklyContractIndex2 )
	if not f337_local0 or not f337_local1 then
		return false
	else
		local f337_local2
		if f337_local0.index == 0 or f337_local1.index == 0 then
			f337_local2 = false
		else
			f337_local2 = true
		end
	end
	return f337_local2
end

function IsProcessingBMContractRewardTask( f338_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f338_arg0 ), "bmRewards.processingTask" ) )
	local f338_local1
	if modelValue == nil or modelValue ~= true then
		f338_local1 = false
	else
		f338_local1 = true
	end
	return f338_local1
end

function IsLootItemFromCurrentContraband( f339_arg0, f339_arg1 )
	local f339_local0 = f339_arg0:getModel( f339_arg1, "drop" )
	if f339_local0 then
		local f339_local1 = Engine.GetModelValue( f339_local0 )
		local f339_local2 = LUI.splitString( Dvar.loot_mpItemVersions:get(), "," )
		if f339_local1 and #f339_local2 > 0 and tonumber( f339_local1 ) == tonumber( f339_local2[#f339_local2] ) then
			return true
		end
	end
	return false
end

function IsLimitedLootItem( f340_arg0, f340_arg1 )
	local f340_local0 = f340_arg0:getModel( f340_arg1, "emblem" )
	if f340_local0 then
		return CoD.BlackMarketUtility.IsLimitedBlackMarketItem( Engine.GetModelValue( f340_local0 ) )
	else
		return false
	end
end

function IsLimitedLootPromoActive( f341_arg0 )
	return Engine.DvarBool( nil, "loot_limitedTimeItemPromo_active" )
end

function DoesPlayerHaveCurrentLoginReward( f342_arg0 )
	local f342_local0 = 0
	if CoD.LoginRewardCamo == true then
		f342_local0 = Engine.GetLootItemQuantity( f342_arg0, CoD.LoginRewardItemReference, Enum.eModes.MODE_MULTIPLAYER )
	else
		f342_local0 = Engine.GetInventoryItemQuantity( f342_arg0, CoD.LoginRewardItemID )
	end
	if not f342_local0 or f342_local0 == 0 then
		return false
	else
		return true
	end
end

function ShouldShowLoginRewardPopup( f343_arg0 )
	return Engine.DvarBool( nil, "loot_loginReward_active" ) and not DoesPlayerHaveCurrentLoginReward( f343_arg0 )
end

function IsCryptokeyWidgetGenericReward( f344_arg0, f344_arg1, f344_arg2 )
	if f344_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return true
	elseif f344_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return true
	else
		return false
	end
end

function IsCryptokeyWidgetAvailable( f345_arg0, f345_arg1, f345_arg2 )
	if IsElementInState( f345_arg1, "SixPackCommon" ) and IsSixPackBundleInCooldown( f345_arg2 ) then
		return false
	elseif IsElementInState( f345_arg1, "DailyDouble" ) and IsDailyDoubleBundleInCooldown( f345_arg2 ) then
		return false
	else
		return true
	end
end

function IsDecryptionCrateGenericReward( f346_arg0, f346_arg1, f346_arg2 )
	if CoD.perController[f346_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return true
	elseif CoD.perController[f346_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return true
	else
		return false
	end
end

function IsGrandSlamReward( f347_arg0 )
	if CoD.perController[f347_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		return true
	elseif CoD.perController[f347_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		return true
	else
		
	end
end

function IsDecryptionCrateRare( f348_arg0, f348_arg1, f348_arg2 )
	if CoD.perController[f348_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE then
		return true
	elseif CoD.perController[f348_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE then
		return true
	else
		return false
	end
end

function HasGenericRewardBundles( f349_arg0 )
	if CoD.perController[f349_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f349_arg0 ) > 0
	elseif CoD.perController[f349_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f349_arg0 ) > 0
	else
		return false
	end
end

function HasGrandSlamRewardBundles( f350_arg0 )
	if CoD.perController[f350_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		return CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f350_arg0 ) > 0
	elseif CoD.perController[f350_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		return CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f350_arg0 ) > 0
	else
		return false
	end
end

function HasPlayerSeenZMHDPurchaseRewardPopup( f351_arg0 )
	local f351_local0 = Engine.StorageGetBuffer( f351_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f351_local0 then
		return f351_local0.extraBools[7]:get() == 1
	else
		return false
	end
end

function ShouldShowZMHDPurchaseRewardPopup( f352_arg0 )
	if Engine.DvarBool( nil, "zmhd_purchase_reward_popup_enabled" ) and not HasPlayerSeenZMHDPurchaseRewardPopup( f352_arg0 ) then
		return Engine.GetInventoryItemQuantity( f352_arg0, Engine.TableLookup( nil, "gamedata/store/common/fpentitlement.csv", 5, "dlc5", CoD.OrbisDurangoPCValue( 8, 7, 9 ) ) ) > 0
	else
		return false
	end
end

function ShouldShowZMDLCPurchaseRewardPopup( f353_arg0, f353_arg1 )
	local f353_local0 = false
	if ShouldShowZMDLC1PurchaseRewardPopup( f353_arg0 ) then
		f353_arg1.dlc1 = true
		f353_local0 = true
	end
	if ShouldShowZMDLC2PurchaseRewardPopup( f353_arg0 ) then
		f353_arg1.dlc2 = true
		f353_local0 = true
	end
	if ShouldShowZMDLC3PurchaseRewardPopup( f353_arg0 ) then
		f353_arg1.dlc3 = true
		f353_local0 = true
	end
	if ShouldShowZMDLC4PurchaseRewardPopup( f353_arg0 ) then
		f353_arg1.dlc4 = true
		f353_local0 = true
	end
	return f353_local0
end

function ShouldShowZMDLC1PurchaseRewardPopup( f354_arg0 )
	local f354_local0 = Engine.StorageGetBuffer( f354_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f354_local0 and f354_local0.extraBools[3]:get() == 0 and (Engine.GetInventoryItemQuantity( f354_arg0, CoD.ZMDLCProductIDs.PSNZMDLC1 ) > 0 or Engine.GetInventoryItemQuantity( f354_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC1 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMDLC2PurchaseRewardPopup( f355_arg0 )
	local f355_local0 = Engine.StorageGetBuffer( f355_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f355_local0 and f355_local0.extraBools[4]:get() == 0 and (Engine.GetInventoryItemQuantity( f355_arg0, CoD.ZMDLCProductIDs.PSNZMDLC2 ) > 0 or Engine.GetInventoryItemQuantity( f355_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC2 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMDLC3PurchaseRewardPopup( f356_arg0 )
	local f356_local0 = Engine.StorageGetBuffer( f356_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f356_local0 and f356_local0.extraBools[5]:get() == 0 and (Engine.GetInventoryItemQuantity( f356_arg0, CoD.ZMDLCProductIDs.PSNZMDLC3 ) > 0 or Engine.GetInventoryItemQuantity( f356_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC3 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMDLC4PurchaseRewardPopup( f357_arg0 )
	local f357_local0 = Engine.StorageGetBuffer( f357_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f357_local0 and f357_local0.extraBools[6]:get() == 0 and (Engine.GetInventoryItemQuantity( f357_arg0, CoD.ZMDLCProductIDs.PSNZMDLC4 ) > 0 or Engine.GetInventoryItemQuantity( f357_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC4 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMHDGobbleGumPopup( f358_arg0, f358_arg1 )
	local f358_local0 = ""
	local f358_local1 = 0
	if f358_arg1 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID then
		f358_local0 = "zmhd_gobblegum_popup_ps4_enabled"
		f358_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_SKU_ID
	elseif f358_arg1 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID then
		f358_local0 = "zmhd_gobblegum_popup_xb1_enabled"
		f358_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_SKU_ID
	end
	if Engine.DvarBool( nil, f358_local0 ) and Engine.IsLootReady( f358_arg0 ) then
		return Engine.GetInventoryItemQuantity( f358_arg0, f358_local1 ) == 0
	else
		return false
	end
end

function ShouldShowURMFirstTimePopup( f359_arg0 )
	return false
end

function ShouldShowDashboardMessage( f360_arg0 )
	if not IsDvarValueEqualTo( "ui_zmPlayerMessage", "1" ) then
		return false
	end
	local f360_local0 = 32
	if not Dvar.zm_dash_stats_dashboard_ratio:exists() or not Dvar.zm_dash_stats_dashboard_min_games:exists() then
		return false
	end
	local f360_local1 = Engine.StorageGetBuffer( f360_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if not f360_local1 then
		return false
	end
	local f360_local2 = f360_local1.dashboardingTrackingHistory.bufferFull:get()
	local f360_local3 = f360_local1.dashboardingTrackingHistory.currentDashboardingTrackingHistoryIndex:get()
	if f360_local2 == 0 and f360_local3 < tonumber( Dvar.zm_dash_stats_dashboard_min_games:get() ) then
		return false
	end
	local f360_local4 = f360_local0 - 1
	if f360_local2 == 0 then
		f360_local4 = f360_local3 - 1
	end
	local f360_local5 = 0
	for f360_local6 = 0, f360_local4, 1 do
		if f360_local1.dashboardingTrackingHistory.quitType[f360_local6]:get() == CoDShared.zmDashboardStatsQuitTypes.dashboard then
			f360_local5 = f360_local5 + 1
		end
	end
	return f360_local5 / (f360_local4 + 1) >= tonumber( Dvar.zm_dash_stats_dashboard_ratio:get() )
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

function Mods_Enabled()
	return LuaUtils.Mods_Enabled()
end

function Mods_IsUsingMods()
	return LuaUtils.Mods_IsUsingMods()
end

function Mods_UsingModsInternalName()
	if Mods_IsUsingMods() then
		return LuaUtils.Mods_UsingModsInternalName()
	else
		return ""
	end
end

function Mods_UsingModsUgcName()
	if Mods_IsUsingMods() then
		return LuaUtils.Mods_UsingModsUgcName()
	else
		return ""
	end
end

function Mods_IsUsingUsermap()
	return LuaUtils.Mods_IsUsingUsermap()
end

function Mods_UsingUsermapUgcName()
	return LuaUtils.Mods_UsingUsermapUgcName()
end

function AmICarryingEnemyFlag( f370_arg0 )
	local f370_local0 = Engine.GetPlayerNameForClientNum( f370_arg0, Engine.GetPredictedClientNum( f370_arg0 ) )
	if f370_local0 == "" then
		return false
	elseif CoD.IsShoutcaster( f370_arg0 ) then
		if f370_local0 == Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f370_arg0 ), "CTF.enemyFlagCarrier" ) ) then
			return true
		else
			return f370_local0 == Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f370_arg0 ), "CTF.friendlyFlagCarrier" ) )
		end
	end
	local f370_local1 = Engine.CreateModel( Engine.GetModelForController( f370_arg0 ), "CTF.enemyFlagCarrier" )
	local f370_local2
	if f370_local1 == nil or f370_local0 ~= Engine.GetModelValue( f370_local1 ) then
		f370_local2 = false
	else
		f370_local2 = true
	end
	return f370_local2
end

function AmICarryingBomb( f371_arg0 )
	if CoD.SafeGetModelValue( Engine.GetModelForController( f371_arg0 ), "Demolition.defending" ) == false then
		return true
	elseif CoD.SafeGetModelValue( Engine.GetModelForController( f371_arg0 ), "SearchAndDestroy.defending" ) == false and Engine.GetGametypeSetting( "multiBomb" ) == 1 and not Engine.IsVisibilityBitSet( f371_arg0, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ) and not Engine.IsVisibilityBitSet( f371_arg0, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ) then
		return true
	else
		return IsModelValueEqualTo( f371_arg0, "hudItems.SDBombClient", Engine.GetPredictedClientNum( f371_arg0 ) )
	end
end

function IsFractureCountMax( f372_arg0 )
	if IsGameTypeEqualToString( "clean" ) and IsModelValueEqualTo( f372_arg0, "hudItems.cleanCarryCount", 10 ) then
		return true
	else
		
	end
end

function IsPropHuntProp( f373_arg0 )
	return Engine.IsPropHuntProp( f373_arg0 )
end

function HasNetworkConnection()
	return Engine.CheckNetConnection() == true
end

function IsPlayerSignedInToLive( f375_arg0 )
	return Engine.IsSignedInToLive( f375_arg0 ) == true
end

function IsPlusAuthorized( f376_arg0 )
	return Engine.IsPlusAuthorized( f376_arg0 ) == true
end

function IsPlayerConnectedToCodServers( f377_arg0 )
	return Engine.IsDemonwareFetchingDone( f377_arg0 ) == true
end

function LobbyConnectedToDedicatedHost()
	return Engine.LobbyConnectedToDedicatedHost()
end

function IsDoubleXP( f379_arg0 )
	if Mods_IsUsingMods() then
		return false
	elseif not IsPublicOrLeagueGame() and (not IsZombies() or not IsLive()) then
		return false
	else
		local f379_local0 = Engine.GetXPScale( f379_arg0 )
		return f379_local0 and f379_local0 >= 2
	end
end

function IsDoubleWeaponXP( f380_arg0 )
	if Mods_IsUsingMods() then
		return false
	elseif not IsPublicOrLeagueGame() and (not IsZombies() or not IsLive()) then
		local f380_local0 = LobbyData.GetCurrentMenuTarget()
		if not f380_local0 or f380_local0.kicker ~= "MPUI_PUBLIC_MATCH_LOBBY" then
			return false
		end
	end
	local f380_local0 = Engine.GetGunXPScale( f380_arg0 )
	return f380_local0 and f380_local0 >= 2
end

function IsDoubleLootXP( f381_arg0 )
	if Mods_IsUsingMods() then
		return false
	elseif not IsPublicOrLeagueGame() then
		return false
	else
		local f381_local0 = Engine.GetCryptoScale( f381_arg0 )
		if not f381_local0 then
			return false
		else
			return tonumber( f381_local0 ) >= 2
		end
	end
end

function IsLootSaleActive( f382_arg0 )
	if not AreCodPointsEnabled( f382_arg0 ) then
		return false
	else
		local f382_local0 = Dvar.loot_salePercentOff:get()
		if not f382_local0 then
			return false
		else
			return tonumber( f382_local0 ) > 0
		end
	end
end

function IsBribeActive( f383_arg0 )
	return CoD.BlackMarketUtility.GetCurrentBribeTitle() ~= nil
end

function IsBundleActive( f384_arg0 )
	local f384_local0 = Dvar.loot_bundleActive:get()
	if not f384_local0 or tonumber( f384_local0 ) <= 0 then
		return false
	elseif 0 >= CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BUNDLE ) and not AreCodPointsEnabled( f384_arg0 ) then
		return false
	else
		return true
	end
end

function IsHundredBundleActive( f385_arg0 )
	local f385_local0 = Dvar.loot_rare100_enabled:get()
	if not f385_local0 or tonumber( f385_local0 ) <= 0 then
		return false
	else
		return true
	end
end

function IsRareBundle10for5Active( f386_arg0 )
	local f386_local0 = Dvar.rare_bundle_10for5_Active:get()
	if not f386_local0 or tonumber( f386_local0 ) <= 0 then
		return false
	else
		return true
	end
end

function IsRare20BundleActive( f387_arg0 )
	local f387_local0 = Dvar.rare_20bundle_active:get()
	if not f387_local0 or tonumber( f387_local0 ) <= 0 then
		return false
	else
		return true
	end
end

function IsRare20LDBundleActive( f388_arg0 )
	local f388_local0 = Dvar.rare_20ldbundle_active:get()
	if not f388_local0 or tonumber( f388_local0 ) <= 0 then
		return false
	else
		return true
	end
end

function IsRare15BundleActive( f389_arg0 )
	local f389_local0 = Dvar.rare_15bundle_active:get()
	if not f389_local0 or tonumber( f389_local0 ) <= 0 then
		return false
	else
		return true
	end
end

function HasHundredBundles( f390_arg0 )
	return CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f390_arg0 ) > 0
end

function HasRareBundle10for5s( f391_arg0 )
	return CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f391_arg0 ) > 0
end

function HasRare20Bundle( f392_arg0 )
	return CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f392_arg0 ) > 0
end

function HasRare20LDBundle( f393_arg0 )
	return CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f393_arg0 ) > 0
end

function HasRare15Bundle( f394_arg0 )
	return CoD.BlackMarketUtility.GetCurrentRare15BundleCount( f394_arg0 ) > 0
end

function HasOutfit3Bundle( f395_arg0 )
	return CoD.BlackMarketUtility.GetCurrentOutfit3BundleCount( f395_arg0 ) > 0
end

function IsBlackMarketItemHundredBundle( f396_arg0, f396_arg1 )
	return IsElementPropertyValue( f396_arg0, "supplyDropType", CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE )
end

function IsBlackMarketItemRareBundle10for5( f397_arg0, f397_arg1 )
	return IsElementPropertyValue( f397_arg0, "supplyDropType", CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 )
end

function IsBlackMarketItemRare20Bundle( f398_arg0, f398_arg1 )
	return IsElementPropertyValue( f398_arg0, "supplyDropType", CoD.BlackMarketUtility.DropTypes.RARE_20BUNDLE )
end

function IsTrifectaBundleActive( f399_arg0 )
	if not Dvar.loot_trifectaActive:get() then
		return false
	else
		return true
	end
end

function IsSixPackBundleActive( f400_arg0 )
	local f400_local0 = Engine.DvarBool( nil, "loot_sixPack_active" )
	if not f400_local0 then
		f400_local0 = CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f400_arg0 ) > 0
	end
	return f400_local0
end

function IsSixPackBundleInCooldown( f401_arg0 )
	local f401_local0 = Engine.StorageGetBuffer( f401_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f401_local0 then
		local f401_local1 = f401_local0.playerstatslist.ARENA_MAX_RANK.statvalue:getAsString()
		if Engine.IsInRange( Engine.GetServerUTCTimeStr(), f401_local1, Engine.StringIntegerAddition( f401_local1, tostring( Engine.DvarInt( nil, "loot_sixPack_cooloffSeconds" ) ) ) ) then
			return true
		end
	end
	local f401_local1 = Engine.GetInventoryItem( f401_arg0, Engine.DvarInt( nil, "loot_sixPack_consumable_id" ) )
	if f401_local1 and tonumber( Engine.StringIntegerSubtraction( f401_local1.expireTimeStr, Engine.GetServerUTCTimeStr() ) ) >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
		return true
	end
	return false
end

function IsDailyDoubleBundleActive( f402_arg0 )
	local f402_local0 = Engine.DvarBool( nil, "loot_dailyDouble_active" )
	if not f402_local0 then
		f402_local0 = CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f402_arg0 ) > 0
	end
	return f402_local0
end

function IsDailyDoubleBundleInCooldown( f403_arg0 )
	local f403_local0 = Engine.GetInventoryItem( f403_arg0, Engine.DvarInt( nil, "loot_dailyDouble_consumable_id" ) )
	if f403_local0 and tonumber( Engine.StringIntegerSubtraction( f403_local0.expireTimeStr, Engine.GetServerUTCTimeStr() ) ) >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
		return true
	else
		return false
	end
end

function IsBundleExperimentActive( f404_arg0 )
	local f404_local0 = Engine.DvarBool( nil, "loot_3pack_active" )
	if not f404_local0 then
		f404_local0 = CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f404_arg0 ) > 0
	end
	return f404_local0
end

function IsNoDupesCrateActive( f405_arg0 )
	return Engine.DvarBool( nil, "loot_noDupeRare_active" )
end

function IsNoDupesBundleActive( f406_arg0 )
	local f406_local0 = Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" )
	if not f406_local0 then
		f406_local0 = CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f406_arg0 ) > 0
	end
	return f406_local0
end

function IsNoDupesPromoActive( f407_arg0 )
	return Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" ) and not Engine.DvarBool( nil, "loot_nodupe_experiment_active" )
end

function IsGrandSlamActive( f408_arg0 )
	return Engine.DvarBool( nil, "loot_grandSlam_active" )
end

function IsKeysForVialsOfferActive( f409_arg0 )
	local f409_local0 = Dvar.loot_vialsFromKeysOffer:get()
	if f409_local0 then
		f409_local0 = tonumber( f409_local0 )
	end
	return f409_local0 and f409_local0 > 0
end

function ShouldHideOfflineNetworkPrompt( f410_arg0 )
	if IsLive() then
		return true
	elseif ShouldShowOfflineNormalMessage( f410_arg0 ) or ShouldShowOfflineVoluntaryMessage( f410_arg0 ) then
		return true
	elseif PlayGoIsStillDownloading( f410_arg0 ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNormalMessage( f411_arg0 )
	if not IsLive() then
		if not Engine.IsPlusAuthorized( f411_arg0 ) then
			return true
		elseif not Engine.IsSignedInToLive( f411_arg0 ) then
			return true
		end
	end
	return false
end

function ShouldShowOfflineVoluntaryMessage( f412_arg0 )
	if not IsLive() and Engine.IsPlusAuthorized( f412_arg0 ) and Engine.IsSignedInToLive( f412_arg0 ) and IsPlayerConnectedToCodServers( f412_arg0 ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNetworkErrorMessage( f413_arg0 )
	return not ShouldHideOfflineNetworkPrompt( f413_arg0 )
end

function IsLobbyLocked()
	return LuaUtils.LobbyIsLocked()
end

function IsPlayerJoinable( f415_arg0 )
	local f415_local0 = nil
	if f415_arg0.activeWidget ~= nil then
		f415_local0 = f415_arg0.activeWidget:getModel()
	else
		f415_local0 = f415_arg0:getModel()
	end
	if f415_local0 then
		f415_local0 = Engine.GetModel( f415_local0, "isJoinable" )
	end
	local f415_local1
	if not f415_local0 or Engine.GetModelValue( f415_local0 ) ~= 1 then
		f415_local1 = false
	else
		f415_local1 = true
	end
	return f415_local1
end

function ShouldLobbyListBeUp()
	local f416_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f416_local1
	if f416_local0 == LobbyData.UITargets.UI_MODESELECT.id or f416_local0 == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f416_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		f416_local1 = false
	else
		f416_local1 = true
	end
	return f416_local1
end

function ShouldShowQuickJoin()
	if IsLobbyNetworkModeLAN() then
		return false
	elseif Engine.DvarInt( nil, "live_social_quickjoin" ) == 0 then
		return false
	elseif Engine.GetQuickJoinPlayersCount( 0, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE ) == 0 then
		return false
	else
		return not ShouldLobbyListBeUp()
	end
end

function ShowHeaderKicker( f418_arg0 )
	return f418_arg0.showHeaderKicker == true
end

function ShowHeaderIcon( f419_arg0 )
	return f419_arg0.showHeaderIcon == true
end

function ShowHeaderEmblem( f420_arg0 )
	return f420_arg0.showHeaderEmblem == true
end

function IsFlyoutMenuOpen( f421_arg0, f421_arg1 )
	local f421_local0 = IsGlobalModelValueTrue( f421_arg0, f421_arg1, "GameSettingsFlyoutOpen" )
	if not f421_local0 then
		f421_local0 = IsGlobalModelValueTrue( f421_arg0, f421_arg1, "BonusModesFlyoutOpen" )
	end
	return f421_local0
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

function IsCPMapVoteHidden( f425_arg0 )
	if not IsCampaign() then
		return false
	else
		local f425_local0 = LobbyData.GetLobbyNav()
		if f425_local0 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f425_local0 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f425_local0 == LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id or f425_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f425_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f425_local0 == LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id or f425_local0 == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id or f425_local0 == LobbyData.UITargets.UI_DOALOBBYLANGAME.id or f425_local0 == LobbyData.UITargets.UI_DOALOBBYONLINE.id then
			return false
		else
			return not Engine.IsCPInProgress()
		end
	end
end

function IsMPMapVoteHidden( f426_arg0 )
	if not IsMultiplayer() then
		return false
	else
		return false
	end
end

function IsZMMapVoteHidden( f427_arg0 )
	if not IsZombies() then
		return false
	elseif LobbyData.GetLobbyNav() == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		return true
	else
		return false
	end
end

function PlayerIsReady( f428_arg0, f428_arg1, f428_arg2 )
	if not f428_arg0 or not f428_arg0:getModel() then
		return false
	else
		local f428_local0 = Engine.GetModel( f428_arg0:getModel(), "isReady" )
		return f428_local0 and Engine.GetModelValue( f428_local0 ) == true
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

function ShouldHideLobbyMemberRank()
	if not IsLive() or IsMainModeInvalidAndNotTheaterMode() then
		return true
	end
	local f431_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f431_local1
	if f431_local0 ~= LobbyData.UITargets.UI_MODESELECT.id and f431_local0 ~= LobbyData.UITargets.UI_DOALOBBYONLINE.id and f431_local0 ~= LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id and f431_local0 ~= LobbyData.UITargets.UI_DOALOBBYLANGAME.id and f431_local0 ~= LobbyData.UITargets.UI_DOALOBBYLANCUSTOMGAME.id then
		f431_local1 = false
	else
		f431_local1 = true
	end
	return f431_local1
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

function IsMPPublicMatchLobby()
	local f435_local0 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local f435_local1
	if f435_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id and f435_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		f435_local1 = false
	else
		f435_local1 = true
	end
	return f435_local1
end

function IsCustomLobby()
	local f436_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f436_local1
	if f436_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f436_local0 ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f436_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f436_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEMODGAME.id and f436_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		f436_local1 = false
	else
		f436_local1 = true
	end
	return f436_local1
end

function IsCustomMPLobby()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) ) == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id
end

function IsPublicLobby()
	local f438_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f438_local1
	if f438_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id and f438_local0 ~= LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id and f438_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f438_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f438_local1 = false
	else
		f438_local1 = true
	end
	return f438_local1
end

function IsGameLobby()
	local f439_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f439_local0 then
		local f439_local1 = LobbyData:UITargetFromId( f439_local0 )
		return f439_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME
	else
		
	end
end

function IsGameLobbyExcept( f440_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue then
		local f440_local1 = LobbyData:UITargetFromId( modelValue )
		local f440_local2 = f440_local1.name
		if f440_local2 then
			if f440_local1.name == f440_arg0 or f440_local1.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
				f440_local2 = false
			else
				f440_local2 = true
			end
		end
		return f440_local2
	else
		
	end
end

function ShouldShowCompetitiveSettingsSummary()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) ) == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id
end

function IsLobbyMode( f442_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue then
		local f442_local1 = LobbyData:UITargetFromId( modelValue )
		return f442_local1.lobbyMode == f442_arg0
	else
		
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
	local f449_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f449_local1
	if f449_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f449_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id and f449_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f449_local1 = false
	else
		f449_local1 = true
	end
	return f449_local1
end

function IsLobbyWithTeamAssignment()
	local f450_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f450_local1
	if f450_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f450_local0 ~= LobbyData.UITargets.UI_MPLOBBYLANGAME.id then
		f450_local1 = false
	else
		f450_local1 = true
	end
	return f450_local1
end

function IsTeamAssignment( f451_arg0 )
	return Engine.GetGametypeSetting( "teamAssignment" ) == f451_arg0
end

function CanMuteLobbyPlayerLAN( f452_arg0, f452_arg1 )
	return Engine.GetXUID64( f452_arg0 ) ~= CoD.SafeGetModelValue( f452_arg1:getModel(), "xuid" )
end

function IsPlayerMuted( f453_arg0, f453_arg1 )
	local f453_local0 = CoD.SafeGetModelValue( f453_arg1:getModel(), "xuid" )
	if f453_local0 then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return Engine.IsPlayerMuted( f453_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, f453_local0 )
		else
			return Engine.IsPlayerMuted( f453_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f453_local0 )
		end
	else
		return false
	end
end

function IsAddControllerTextItem( f454_arg0 )
	return f454_arg0.isAddControllerTextItem
end

function IsPlayerCountItem( f455_arg0 )
	return f455_arg0.isPlayerCountItem
end

function IsSelfItem( f456_arg0, f456_arg1 )
	local f456_local0 = f456_arg0:getModel( f456_arg1, "isLocal" )
	if f456_local0 ~= nil then
		return Engine.GetModelValue( f456_local0 ) == 1
	else
		return f456_arg0.isSelfItem
	end
end

function IsFriendItem( f457_arg0 )
	return f457_arg0.isFriendItem
end

function IsGroupsItem( f458_arg0 )
	return f458_arg0.isGroupsItem
end

function ShouldPlayLobbyFadeAnim( f459_arg0, f459_arg1 )
	return f459_arg0.previousMenuName and f459_local1 or f459_arg0.previousMenuName == "ModeSelect"
end

function ShouldShowAddController( f460_arg0, f460_arg1, f460_arg2 )
	return CoD.LobbyBase.SplitscreenControllersAllowed()
end

function ShouldDisableEditCodCasterSettingsButton( f461_arg0 )
	return false
end

function ShouldShowEditCodCasterSettingsButton( f462_arg0 )
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		return true
	else
		return false
	end
end

function ShouldShowDLCWidget( f463_arg0, f463_arg1 )
	if not ShowPurchasableMap( f463_arg0, f463_arg1 ) then
		return false
	elseif CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetDLCBits(), Engine.GetDLCBitForMapName( f463_arg1 ) ) then
		return false
	else
		return true
	end
end

function ShouldSquareOpenStore( f464_arg0, f464_arg1, f464_arg2 )
	local f464_local0 = false
	for f464_local4, f464_local5 in pairs( CoD.ProductFromBit[Enum.eModes.MODE_MULTIPLAYER].products ) do
		if ShowPurchasableMapForDLCBit( f464_arg1, f464_local4 ) and not CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetDLCBits(), f464_local4 ) then
			f464_local0 = true
			break
		end
	end
	if not f464_local0 then
		return false
	elseif IsMenuInState( f464_arg0, "DefaultState" ) then
		return true
	end
	return f464_arg0[f464_arg2] and not IsElementInState( f464_arg0[f464_arg2], "DefaultState" )
end

function IsLANServerBrowserEmpty()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" ), "count" ) ) == 0 then
		return true
	else
		return false
	end
end

function LANServerBrowserCheckFilterTest( f466_arg0, f466_arg1 )
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	elseif f466_arg0.currentFilter == f466_arg1 then
		return true
	elseif not f466_arg0.currentFilter and f466_arg1 == "all" then
		return true
	else
		return false
	end
end

function LobbyHas4PlayersOrLess()
	local f467_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f467_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	return f467_local0 <= 4
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

function PregameStateEqualToEnum( f473_arg0 )
	return Engine.GetLobbyPregameState() == f473_arg0
end

function CharacterLoadoutDrafted( f474_arg0, f474_arg1, f474_arg2 )
	if not CharacterDraftActive() then
		return false
	else
		local f474_local0 = f474_arg1:getModel()
		if f474_local0 then
			return Engine.CharacterLoadoutDrafted( Engine.GetModelValue( Engine.GetModel( f474_local0, "itemIndex" ) ), Engine.GetTeamForXUID( Engine.GetXUID64( f474_arg2 ) ) )
		else
			return false
		end
	end
end

function ItemIsBanned( f475_arg0, f475_arg1, f475_arg2 )
	local f475_local0 = CoD.CACUtility.GetItemInfoFromElement( f475_arg2, f475_arg1 )
	if f475_local0 then
		if CoD.CACUtility.ItemSlotBannedByBonuscard( f475_local0.loadoutSlot, f475_local0.itemIndex ) then
			return true
		elseif CoD.CACUtility.ItemSlotBannedByBonuscard( f475_local0.weaponSlot, f475_local0.itemIndex ) then
			return true
		elseif f475_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM or f475_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemVote( f475_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.IsItemIndexRestricted( f475_local0.itemIndex, false ) then
				return true
			end
		end
		if (f475_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT or f475_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetAttachmentVote( f475_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif f475_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemAttachmentVote( f475_local0.itemIndex, f475_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.GetAttachmentRestrictionState( f475_local0.attachmentIndex, f475_local0.itemIndex, false ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
				return true
			end
		end
		if f475_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f475_local0.itemGroup, f475_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		end
	end
	return false
end

function ItemIsBannedLobby( f476_arg0, f476_arg1, f476_arg2 )
	if ItemIsBanned( f476_arg0, f476_arg1, f476_arg2 ) then
		return LobbyData.GetLobbyNav() ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id
	else
		return false
	end
end

function ItemIsProtected( f477_arg0, f477_arg1, f477_arg2 )
	local f477_local0 = CoD.CACUtility.GetItemInfoFromElement( f477_arg2, f477_arg1 )
	if f477_local0 then
		if f477_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			return Engine.GetItemVote( f477_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f477_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			return Engine.GetAttachmentVote( f477_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f477_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( f477_local0.itemIndex, f477_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f477_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f477_local0.itemGroup, f477_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		end
	end
	return false
end

function ItemIsInRestrictionState( f478_arg0, f478_arg1, f478_arg2, f478_arg3 )
	local f478_local0 = CoD.CACUtility.GetItemInfoFromElement( f478_arg2, f478_arg1 )
	if f478_local0 then
		return f478_local0.restrictionState == f478_arg3
	else
		return false
	end
end

function ClassContainsRestrictedItems( f479_arg0, f479_arg1, f479_arg2 )
	if f479_arg1 and f479_arg1:getParent() then
		local f479_local0 = f479_arg1:getParent()
		if f479_local0.id == "BuyExtraSlotsBtn" then
			return false
		end
	end
	local f479_local0 = f479_arg1:getModel( f479_arg2, "classNum" )
	if f479_local0 then
		return CoD.CACUtility.ClassContainsRestrictedItems( f479_arg2, Engine.GetModelValue( f479_local0 ) )
	end
	return false
end

function ClassContainsRestrictedItemsLobby( f480_arg0, f480_arg1, f480_arg2 )
	if ClassContainsRestrictedItems( f480_arg0, f480_arg1, f480_arg2 ) then
		return LobbyData.GetLobbyNav() ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id
	else
		return false
	end
end

function AnyClassContainsRestrictedItems( f481_arg0, f481_arg1, f481_arg2 )
	return CoD.CACUtility.AnyClassContainsRestrictedItems( f481_arg2 )
end

function AnyEquippedScorestreaksBanned( f482_arg0, f482_arg1, f482_arg2 )
	return CoD.CACUtility.AnyEquippedScorestreaksBanned( f482_arg2 )
end

function AnyCACContentBanned( f483_arg0, f483_arg1, f483_arg2 )
	return CoD.CACUtility.AnyCACItemsBanned()
end

function AnyScorestreaksBanned( f484_arg0, f484_arg1, f484_arg2 )
	return CoD.CACUtility.AnyStreaksBanned()
end

function AnySpecialistBanned()
	return CoD.CACUtility.AnySpecialistBanned()
end

function EquippedSpecialistBanned( f486_arg0 )
	return CoD.CACUtility.EquippedSpecialistBanned( f486_arg0 )
end

function CanAffordRaidPurchase( f487_arg0, f487_arg1, f487_arg2 )
	return Engine.GetModelValue( f487_arg1:getModel( f487_arg2, "cost" ) ) <= Engine.GetModelValue( f487_arg0:getModel( f487_arg2, "bank" ) )
end

function RaidPurchaseItemDisabled( f488_arg0, f488_arg1, f488_arg2 )
	return f488_arg0:getModel( f488_arg2, "disable_" .. Engine.GetModelValue( f488_arg1:getModel( f488_arg2, "id" ) ) ) ~= nil
end

function RaidPurchaseAllowedForParent( f489_arg0, f489_arg1, f489_arg2 )
	return CanAffordRaidPurchase( f489_arg0, f489_arg1:getParent(), f489_arg2 ) and not RaidPurchaseItemDisabled( f489_arg0, f489_arg1:getParent(), f489_arg2 )
end

function RaidPurchaseAllowed( f490_arg0, f490_arg1, f490_arg2 )
	return CanAffordRaidPurchase( f490_arg0, f490_arg1, f490_arg2 ) and not RaidPurchaseItemDisabled( f490_arg0, f490_arg1, f490_arg2 )
end

function IsStoreAvailable()
	local f491_local0
	if not CoD.isZombie then
		f491_local0 = Engine.IsFFOTDFetched()
	else
		f491_local0 = false
	end
	return f491_local0
end

function IsPlayerDead( f492_arg0, f492_arg1 )
	local f492_local0 = f492_arg0:getModel( f492_arg1, "clientNum" )
	if f492_local0 then
		return Engine.IsPlayerDead( f492_arg1, Engine.GetModelValue( f492_local0 ) )
	else
		return false
	end
end

function IsPlayerInLastStand( f493_arg0, f493_arg1 )
	local f493_local0 = f493_arg0:getParent()
	local f493_local1 = f493_local0 and f493_local0:getModel( f493_arg1, "clientNum" )
	if f493_local1 then
		return Engine.IsPlayerInLastStand( f493_arg1, Engine.GetModelValue( f493_local1 ) )
	else
		return false
	end
end

function IsSplitscreenPlayAvailable()
	if AllowGuestSplitScreenOnline() == false and Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
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

function IsSplitscreenAndInGame( f499_arg0 )
	return Engine.IsSplitscreen()
end

function IsBGBUnlockedForOtherSplitscreenPlayers( f500_arg0, f500_arg1, f500_arg2 )
	local f500_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f500_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if CoD.isZombie and Engine.GetLobbyLocalClientCount( f500_local0 ) > 1 then
		for f500_local1 = 0, Engine.GetLobbyLocalClientCount( f500_local0 ) - 1, 1 do
			local f500_local4 = CoD.SafeGetModelValue( f500_arg1:getModel(), "dlcIndex" )
			if f500_local4 then
				if f500_local4 < CoD.CONTENT_DLC1_INDEX then
					break
				elseif f500_local1 ~= f500_arg2 and Engine.HasEntitlementByOwnership( f500_local1, "dlc" .. f500_local4 - CoD.CONTENT_DLCZM0_INDEX ) then
					return true
				end
			end
		end
	end
	return false
end

function GamepadsConnectedAny()
	return Engine.GamepadsConnectedCount() > 0
end

function GamepadsConnectedIsActive( f502_arg0 )
	return CoD.useController and Engine.GamepadsConnectedIsActive( f502_arg0 )
end

function HasPerksInAnySlot( f503_arg0 )
	local f503_local0 = Engine.GetModelForController( f503_arg0 )
	local f503_local1 = Engine.GetModelValue( Engine.CreateModel( f503_local0, "perks.perk0_count" ) )
	if f503_local1 ~= nil and f503_local1 > 0 then
		return true
	else
		f503_local1 = Engine.GetModelValue( Engine.CreateModel( f503_local0, "perks.perk1_count" ) )
		if f503_local1 ~= nil and f503_local1 > 0 then
			return true
		else
			f503_local1 = Engine.GetModelValue( Engine.CreateModel( f503_local0, "perks.perk2_count" ) )
			if f503_local1 ~= nil and f503_local1 > 0 then
				return true
			else
				return false
			end
		end
	end
end

function HasPerksInSlot0( f504_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f504_arg0 ), "perks.perk0_count" ) )
	local f504_local1
	if modelValue == nil or modelValue <= 0 then
		f504_local1 = false
	else
		f504_local1 = true
	end
	return f504_local1
end

function HasOnePerkInSlot0( f505_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f505_arg0 ), "perks.perk0_count" ) )
	local f505_local1
	if modelValue == nil or modelValue ~= 1 then
		f505_local1 = false
	else
		f505_local1 = true
	end
	return f505_local1
end

function HasTwoPerksInSlot0( f506_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f506_arg0 ), "perks.perk0_count" ) )
	local f506_local1
	if modelValue == nil or modelValue ~= 2 then
		f506_local1 = false
	else
		f506_local1 = true
	end
	return f506_local1
end

function HasPerksInSlot1( f507_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f507_arg0 ), "perks.perk1_count" ) )
	local f507_local1
	if modelValue == nil or modelValue <= 0 then
		f507_local1 = false
	else
		f507_local1 = true
	end
	return f507_local1
end

function HasOnePerkInSlot1( f508_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f508_arg0 ), "perks.perk1_count" ) )
	local f508_local1
	if modelValue == nil or modelValue ~= 1 then
		f508_local1 = false
	else
		f508_local1 = true
	end
	return f508_local1
end

function HasTwoPerksInSlot1( f509_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f509_arg0 ), "perks.perk1_count" ) )
	local f509_local1
	if modelValue == nil or modelValue ~= 2 then
		f509_local1 = false
	else
		f509_local1 = true
	end
	return f509_local1
end

function HasPerksInSlot2( f510_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f510_arg0 ), "perks.perk2_count" ) )
	local f510_local1
	if modelValue == nil or modelValue <= 0 then
		f510_local1 = false
	else
		f510_local1 = true
	end
	return f510_local1
end

function HasOnePerkInSlot2( f511_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f511_arg0 ), "perks.perk2_count" ) )
	local f511_local1
	if modelValue == nil or modelValue ~= 1 then
		f511_local1 = false
	else
		f511_local1 = true
	end
	return f511_local1
end

function HasTwoPerksInSlot2( f512_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f512_arg0 ), "perks.perk2_count" ) )
	local f512_local1
	if modelValue == nil or modelValue ~= 2 then
		f512_local1 = false
	else
		f512_local1 = true
	end
	return f512_local1
end

function IsGameTypeEqualToString( f513_arg0 )
	local f513_local0 = Engine.DvarString( nil, "g_gametype" )
	local f513_local1
	if f513_local0 == nil or f513_local0 ~= f513_arg0 then
		f513_local1 = false
	else
		f513_local1 = true
	end
	return f513_local1
end

function ShouldUseClassicHud( f514_arg0 )
	return Dvar.tu11_enableClassicMode:get()
end

function HideSpecialistAbilityContainer( f515_arg0 )
	local f515_local0 = IsGameTypeEqualToString( "gun" )
	if not f515_local0 then
		f515_local0 = IsGameTypeEqualToString( "prop" )
		if not f515_local0 then
			f515_local0 = ShouldUseClassicHud( f515_arg0 )
		end
	end
	return f515_local0
end

function IsTeamBasedGame( f516_arg0 )
	if IsInGame() then
		return CoDShared.IsGametypeTeamBased()
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType() )
	end
end

function IsTeamBasedOrInfect( f517_arg0 )
	if IsInGame() then
		return CoDShared.IsGametypeTeamBased( nil, true )
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType(), true )
	end
end

function HasMoreThanNPlayersOnATeam( f518_arg0 )
	local f518_local0 = tonumber( f518_arg0 )
	local f518_local1 = Engine.GetTeams()
	local f518_local2 = {}
	for f518_local6, f518_local7 in pairs( f518_local1.clientTeams ) do
		if not f518_local2[f518_local7.team] then
			f518_local2[f518_local7.team] = {}
		end
		table.insert( f518_local2[f518_local7.team], f518_local7 )
	end
	if IsTeamBasedGame( nil ) then
		if f518_local2[Enum.team_t.TEAM_ALLIES] and f518_local0 < #f518_local2[Enum.team_t.TEAM_ALLIES] then
			return true
		elseif f518_local2[Enum.team_t.TEAM_AXIS] and f518_local0 < #f518_local2[Enum.team_t.TEAM_AXIS] then
			return true
		end
	elseif f518_local2[Enum.team_t.TEAM_FREE] and f518_local0 < #f518_local2[Enum.team_t.TEAM_FREE] then
		return true
	end
	return false
end

function CanSwitchTeams()
	local f519_local0 = Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO
	local f519_local1 = Engine.GetUsedControllerCount() > 1
	local f519_local2
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		f519_local2 = not f519_local1
	else
		f519_local2 = false
	end
	if CoDShared.IsGametypeTeamBased() and not f519_local0 then
		return true
	elseif f519_local2 then
		return true
	else
		return false
	end
end

function IsSpectatingInvalidPlayer( f520_arg0 )
	if Engine.IsVisibilityBitSet( f520_arg0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f520_arg0 ), "deadSpectator.playerIndex" ) == Engine.GetClientNum( f520_arg0 )
	end
end

function IsPublicOrLeagueGame( f521_arg0 )
	local f521_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )
	if not f521_local0 then
		f521_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	end
	return f521_local0
end

function IsBombBasedGameMode()
	local f522_local0 = Engine.DvarString( nil, "g_gametype" )
	local f522_local1
	if f522_local0 == nil or f522_local0 ~= "sd" and f522_local0 ~= "sr" and f522_local0 ~= "dem" then
		f522_local1 = false
	else
		f522_local1 = true
	end
	return f522_local1
end

function IsGametypeSettingsValue( f523_arg0, f523_arg1 )
	return Engine.GetGametypeSetting( f523_arg0 ) == f523_arg1
end

function CustomClassesEnabled()
	return Engine.GetGametypeSetting( "disableCAC" ) == 0
end

function IsGametypeTeambased()
	return CoDShared.IsGametypeTeamBased()
end

function IsGametypeItemSettingDefault( f526_arg0 )
	local f526_local0 = f526_arg0:getModel()
	local f526_local1 = f526_arg0:getParent()
	if f526_local0 then
		local f526_local2 = Engine.GetModel( f526_local0, "itemIndex" )
		local f526_local3 = Engine.GetModel( f526_local0, "attachmentIndex" )
		local f526_local4 = Engine.GetModel( f526_local0, "weaponIndex" )
		local f526_local5 = Engine.GetModel( f526_local0, "setting" )
		local f526_local6 = Engine.GetModel( f526_local0, "tabWidget" )
		local f526_local7 = Engine.GetModel( f526_local0, "weaponGroups" )
		local f526_local8, f526_local9 = nil
		if f526_local2 then
			local f526_local10 = Engine.GetModelValue( f526_local2 )
			return Engine.GetItemRestrictionState( f526_local10 ) == Engine.GetItemRestrictionState( f526_local10, true )
		elseif f526_local5 then
			local f526_local10 = Engine.GetModelValue( f526_local5 )
			return Engine.GetGametypeSetting( f526_local10 ) == Engine.GetGametypeSetting( f526_local10, true )
		elseif f526_local3 and f526_local4 then
			local f526_local10 = Engine.GetModelValue( f526_local3 )
			local f526_local11 = Engine.GetModelValue( f526_local4 )
			return Engine.GetAttachmentRestrictionState( f526_local10, f526_local11, false ) == Engine.GetAttachmentRestrictionState( f526_local10, f526_local11, true )
		elseif f526_local3 and not f526_local7 then
			return not Engine.AttachmentRestrictionStateChangedForAnyWeapon( Engine.GetModelValue( f526_local3 ) )
		elseif f526_arg0:getParent() and f526_local6 then
			local f526_local10 = Engine.GetModelValue( f526_local6 )
			if f526_local10 then
				local f526_local11 = f526_local10
				if LUI.startswith( f526_local11, "CoD." ) then
					f526_local11 = string.sub( f526_local10, 5 )
				end
				return CoD.GameSettingsUtility.UpdateBreadCrumbNodes( f526_local11 )
			end
		elseif f526_arg0:getParent() then
			local f526_local10 = f526_arg0:getParent()
			local f526_local11 = f526_local10.actionParam
			if f526_local11 then
				for f526_local15, f526_local16 in pairs( f526_local11 ) do
					if CoD.GameSettingsUtility[f526_local16] and not CoD.GameSettingsUtility.UpdateBreadCrumbNodes( f526_local16 ) then
						return false
					end
				end
			end
		end
	end
	return true
end

function IsGametypeItemSettingDefaultNew( f527_arg0, f527_arg1 )
	if f527_arg0[f527_arg1] == nil then
		return false
	end
	local f527_local0 = f527_arg0[f527_arg1]
	if f527_local0 then
		local f527_local1 = f527_local0.activeWidget
		if f527_local1 and f527_local1.showChangeIndicator then
			return not f527_local1:showChangeIndicator( f527_local0, f527_arg0 )
		end
	end
	return IsGametypeItemSettingDefault( f527_arg0 )
end

function ShouldBootUpHUD( f528_arg0 )
	if not Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
		return false
	else
		return not f528_arg0.hasBooted
	end
end

function DamageFeedbackInStage( f529_arg0, f529_arg1 )
	if IsDemoPlaying() and (Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) or Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )) then
		return false
	else
		local f529_local0 = CoD.SafeGetModelValue( f529_arg0:getModel(), "damageFeedbackState" )
		if f529_local0 then
			return f529_local0 & Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_MASK == f529_arg1
		else
			return false
		end
	end
end

function DamageFeedbackFlagSet( f530_arg0, f530_arg1 )
	if IsDemoPlaying() and (Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) or Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )) then
		return false
	else
		local f530_local0 = CoD.SafeGetModelValue( f530_arg0:getModel(), "damageFeedbackState" )
		if f530_local0 then
			return CoD.BitUtility.IsBitSet( f530_local0 >> Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_NEXT_UNUSED_BIT, f530_arg1 )
		else
			return false
		end
	end
end

function IsWeaponClipGreaterThanOrEqualTo( f531_arg0, f531_arg1 )
	local f531_local0 = Engine.GetModel( Engine.GetModelForController( f531_arg0 ), "currentWeapon.clipMaxAmmo" )
	if f531_local0 == nil then
		return false
	else
		local f531_local1 = Engine.GetModelValue( f531_local0 )
		if f531_local1 == nil then
			return false
		else
			return f531_arg1 <= f531_local1
		end
	end
end

function IsWeaponClipPercentageLessThan( f532_arg0, f532_arg1 )
	local f532_local0 = DataSources.CurrentWeapon.getModel( f532_arg0 )
	if f532_local0 then
		local f532_local1 = CoD.SafeGetModelValue( f532_local0, "clipMaxAmmo" )
		local f532_local2 = CoD.SafeGetModelValue( f532_local0, "ammoInClip" )
		if f532_local1 and f532_local2 then
			return f532_local2 / f532_local1 < f532_arg1
		end
	end
	return false
end

function WeaponUsesAmmo( f533_arg0 )
	local f533_local0 = Engine.GetModelForController( f533_arg0 )
	local f533_local1 = Engine.GetModel( f533_local0, "currentWeapon.weapon" )
	if f533_local1 == nil then
		return false
	end
	local f533_local2 = Engine.GetModelValue( f533_local1 )
	if f533_local2 == nil then
		return false
	elseif IsZombies() and (Engine.IsUnlimitedAmmoWeapon( f533_local2 ) or CoD.SafeGetModelValue( f533_local0, "currentWeapon.equippedWeaponReference" ) == "hero_gravityspikes_melee_zm" or CoD.SafeGetModelValue( f533_local0, "currentWeapon.equippedWeaponReference" ) == "dragon_gauntlet_flamethrower_zm" or CoD.SafeGetModelValue( f533_local0, "currentWeapon.equippedWeaponReference" ) == "equip_gasmask_zm" or CoD.SafeGetModelValue( f533_local0, "currentWeapon.equippedWeaponReference" ) == "lower_equip_gasmask_zm" or CoD.SafeGetModelValue( f533_local0, "currentWeapon.equippedWeaponReference" ) == "equip_hacker_zm") then
		return false
	else
		local f533_local3
		if not Engine.IsWeaponType( f533_local2, "melee" ) and not Engine.IsWeaponType( f533_local2, "riotshield" ) then
			f533_local3 = not Engine.IsWeaponType( f533_local2, "grenade" )
		else
			f533_local3 = false
		end
	end
	return f533_local3
end

function WeaponHasAmmo( f534_arg0 )
	local f534_local0 = Engine.GetModelForController( f534_arg0 )
	local f534_local1 = Engine.GetModel( f534_local0, "currentWeapon.ammoStock" )
	local f534_local2 = Engine.GetModel( f534_local0, "currentWeapon.ammoInClip" )
	if f534_local1 == nil or f534_local2 == nil then
		return false
	else
		local f534_local3 = Engine.GetModelValue( f534_local1 )
		local f534_local4 = Engine.GetModelValue( f534_local2 )
		if f534_local3 == nil or f534_local4 == nil then
			return false
		else
			return f534_local3 + f534_local4 > 0
		end
	end
end

function IsInPrematchPeriod()
	return Engine.CurrentGameTime() < Engine.GetGametypeSetting( "prematchperiod" ) * 1000
end

function IsLowAmmoClip( f536_arg0 )
	local f536_local0 = Engine.IsAmmoClipLow( f536_arg0 )
	if f536_local0 then
		return f536_local0
	else
		return false
	end
end

function IsLowAmmoDWClip( f537_arg0 )
	local f537_local0 = Engine.IsDWAmmoClipLow( f537_arg0 )
	if f537_local0 then
		return f537_local0
	else
		return false
	end
end

function IsHeroWeaponGadgetCurrentWeapon( f538_arg0, f538_arg1 )
	local f538_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f538_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if not IsModelValueTrue( f538_arg1, "playerAbilities.playerGadget3.isInUse" ) then
		return false
	elseif Engine.isValidGadgetSlot( f538_local0 ) and Engine.IsGadgetCurrentWeapon( f538_arg1, f538_local0 ) then
		f538_arg0.wasHeroWeaponActivated = true
		return true
	else
		return false
	end
end

function IsHeroWeaponInUse( f539_arg0, f539_arg1 )
	local f539_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f539_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f539_local0 ) then
		if not (not Engine.IsGadgetCurrentWeapon( f539_arg1, f539_local0 ) or not IsModelValueGreaterThan( f539_arg1, "playerAbilities.playerGadget3.powerRatio", 0 )) or IsModelValueTrue( f539_arg1, "playerAbilities.playerGadget3.isInUse" ) then
			f539_arg0.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	else
		return false
	end
end

function IsHeroWeaponOrGadgetInUse( f540_arg0, f540_arg1 )
	if IsHeroWeaponInUse( f540_arg0, f540_arg1 ) then
		return true
	elseif not Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f540_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) ) then
		return false
	else
		return IsModelValueTrue( f540_arg1, "playerAbilities.playerGadget3.isInUse" )
	end
end

function IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( f541_arg0, f541_arg1 )
	if IsHeroWeaponOrGadgetInUse( f541_arg0, f541_arg1 ) then
		return true
	else
		local f541_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f541_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
		if Engine.isValidGadgetSlot( f541_local0 ) and Engine.IsGadgetContextualWeaponActive( f541_arg1, f541_local0 ) then
			f541_arg0.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	end
end

function IsHeroWeaponThiefGadget( f542_arg0 )
	return IsModelValueEqualTo( f542_arg0, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_THIEF" )
end

function UseHeroWeaponAmmoCounter( f543_arg0, f543_arg1 )
	local f543_local0 = IsHeroWeaponInUse( f543_arg0, f543_arg1 )
	if f543_local0 then
		if not IsModelValueEqualTo( f543_arg1, "playerAbilities.playerGadget3.name", "WEAPON_HERO_ARMBLADE" ) then
			f543_local0 = not IsModelValueEqualTo( f543_arg1, "playerAbilities.playerGadget3.name", "WEAPON_HERO_GRAVITYSPIKES" )
		else
			f543_local0 = false
		end
	end
	return f543_local0
end

function IsHeroGadgetInUse( f544_arg0, f544_arg1 )
	return IsModelValueTrue( f544_arg1, "playerAbilities.playerGadget3.isInUse" )
end

function IsHeroWeaponSpeedBurst( f545_arg0, f545_arg1 )
	return IsModelValueEqualTo( f545_arg1, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_SPEED_BURST" )
end

function HasPerk( f546_arg0, f546_arg1 )
	return IsModelValueEqualTo( f546_arg0, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_COMBAT_EFFICIENCY" ) and IsModelValueEqualTo( f546_arg0, "playerAbilities.playerGadget3.isInUse", true )
end

function IsHeroWeaponOrGadgetEnergyAtLeast( f547_arg0, f547_arg1 )
	local f547_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f547_arg0 ), "playerAbilities.playerGadget3.powerRatio" ) )
	if f547_local0 == nil then
		return false
	else
		return f547_arg1 <= f547_local0
	end
end

function IsBlackMarketSpecialistRouletteActive( f548_arg0 )
	local f548_local0 = IsModelValueEqualTo( f548_arg0, "playerAbilities.playerGadget3.rouletteStatus", 1 )
	if not f548_local0 then
		f548_local0 = IsModelValueEqualTo( f548_arg0, "playerAbilities.playerGadget3.rouletteStatus", 2 )
	end
	return f548_local0
end

function IsBlackMarketSpecialistRouletteInRespin( f549_arg0 )
	local f549_local0 = IsModelValueEqualTo( f549_arg0, "playerAbilities.playerGadget3.rouletteStatus", 1 )
	if not f549_local0 then
		f549_local0 = IsModelValueEqualTo( f549_arg0, "playerAbilities.playerGadget3.rouletteStatus", 3 )
	end
	return f549_local0
end

function IsBlackMarketSpecialistAnyAbilityActive( f550_arg0 )
	local f550_local0 = IsBlackMarketSpecialistRouletteActive( f550_arg0 )
	if not f550_local0 then
		f550_local0 = IsBlackMarketSpecialistThiefActive( f550_arg0 )
	end
	return f550_local0
end

function IsBlackMarketSpecialistThiefActive( f551_arg0 )
	local f551_local0 = IsModelValueEqualTo( f551_arg0, "playerAbilities.playerGadget3.thiefStatus", 1 )
	if not f551_local0 then
		f551_local0 = IsModelValueEqualTo( f551_arg0, "playerAbilities.playerGadget3.thiefStatus", 2 )
	end
	return f551_local0
end

function IsBlackMarketSpecialistThiefCoinActive( f552_arg0 )
	return not IsModelValueEqualTo( f552_arg0, "playerAbilities.playerGadget3.thiefWeaponStatus", 0 )
end

function IsCurrentWeaponReference( f553_arg0, f553_arg1 )
	local f553_local0 = f553_arg1 .. "_" .. CoD.gameMode:lower()
	local f553_local1 = Engine.GetModel( Engine.GetModelForController( f553_arg0 ), "currentWeapon.equippedWeaponReference" )
	local f553_local2 = f553_local1 and Engine.GetModelValue( f553_local1 )
	local f553_local3
	if f553_local2 == nil or f553_local2 ~= f553_local0 then
		f553_local3 = false
	else
		f553_local3 = true
	end
	return f553_local3
end

function IsCurrentWeaponMeleeSecondary( f554_arg0 )
	local f554_local0 = "_" .. CoD.gameMode:lower()
	local f554_local1 = Engine.GetModel( Engine.GetModelForController( f554_arg0 ), "currentWeapon.equippedWeaponReference" )
	local f554_local2 = f554_local1 and Engine.GetModelValue( f554_local1 )
	if f554_local2 == nil then
		return false
	elseif f554_local2 == "knife_loadout" .. f554_local0 then
		return true
	end
	for f554_local6, f554_local7 in ipairs( CoD.CACUtility.LootMeleeWeapons ) do
		if f554_local2 == f554_local7 .. f554_local0 then
			return true
		end
	end
	return false
end

function IsCurrentViewmodelWeaponName( f555_arg0, f555_arg1 )
	local f555_local0 = f555_arg1 .. "_" .. CoD.gameMode:lower()
	local f555_local1 = Engine.GetModel( Engine.GetModelForController( f555_arg0 ), "currentWeapon.viewmodelWeaponName" )
	local f555_local2 = f555_local1 and Engine.GetModelValue( f555_local1 )
	local f555_local3
	if f555_local2 == nil or f555_local2 ~= f555_local0 then
		f555_local3 = false
	else
		f555_local3 = true
	end
	return f555_local3
end

function IsCurrentViewmodelWeaponGamemodeHiddenAmmo( f556_arg0 )
	local f556_local0 = {
		"ball",
		"briefcase_bomb",
		"briefcase_bomb_defuse"
	}
	local f556_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f556_arg0 ), "currentWeapon.viewmodelWeaponName" )
	if f556_local1 then
		for f556_local5, f556_local6 in ipairs( f556_local0 ) do
			if f556_local1 == f556_local6 .. "_" .. CoD.gameMode:lower() then
				return true
			end
		end
	end
	return false
end

function IsHeroWeaponGadgetAmmoEmpty( f557_arg0, f557_arg1 )
	local f557_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f557_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	local f557_local1 = Engine.getHeldGadgetSlotForLoadoutGadget( f557_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if not (f557_local0 == -1 or not Engine.isValidGadgetSlot( f557_local0 )) or f557_local1 ~= -1 and Engine.isValidGadgetSlot( f557_local1 ) then
		local f557_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f557_arg1 ), "playerAbilities.playerGadget3.ammo" ) )
		if f557_local2 == nil or f557_local2 < 1 then
			f557_arg0.wasHeroWeaponActivated = false
			return true
		end
	end
	return false
end

function WasHeroWeaponGadgetActivated( f558_arg0 )
	local f558_local0
	if f558_arg0.wasHeroWeaponActivated ~= nil then
		f558_local0 = f558_arg0.wasHeroWeaponActivated
	else
		f558_local0 = false
	end
	return f558_local0
end

function isHeroVersion_2_0( f559_arg0, f559_arg1 )
	return Engine.isHeroVersion_2_0( f559_arg0, f559_arg1 )
end

function IsHeroWeaponOrSpecialGadgetAvailable( f560_arg0, f560_arg1 )
	if IsHeroWeaponGadgetAvailable( f560_arg0, f560_arg1 ) then
		return true
	end
	local f560_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f560_arg1 ), "playerAbilities.playerGadget3.powerRatio" ) )
	local f560_local1
	if f560_local0 == nil or f560_local0 < 1 then
		f560_local1 = false
	else
		f560_local1 = true
	end
	return f560_local1
end

function IsSpecialGadgetAvailable( f561_arg0 )
	local f561_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f561_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f561_local0 ) then
		return Engine.IsGadgetAvailable( f561_arg0, f561_local0 )
	else
		return false
	end
end

function IsHeroAbilityWeapon( f562_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f562_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON ) )
end

function IsHeroAbilityGadget( f563_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f563_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) )
end

function IsHeroWeaponGadgetAvailable( f564_arg0, f564_arg1 )
	local f564_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f564_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f564_local0 ) then
		if not Engine.IsGadgetAvailable( f564_arg1, f564_local0 ) then
			return false
		elseif isHeroVersion_2_0( f564_arg1, f564_local0 ) then
			return Engine.IsGadgetReady( f564_arg1, f564_local0 )
		else
			return not IsHeroWeaponGadgetAmmoEmpty( f564_arg0, f564_arg1 )
		end
	else
		return false
	end
end

function IsHeroWeaponGadgetActive( f565_arg0 )
	local f565_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f565_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f565_local0 ) then
		return Engine.isGadgetActive( f565_arg0, f565_local0 )
	else
		return false
	end
end

function PulseNoLethal( f566_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f566_arg0 ), "hudItems.pulseNoLethal" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f566_local1 = CoD.CACUtility
	if f566_local1 then
		f566_local1 = CoD.CACUtility.SelectedClassIndex[f566_arg0]
	end
	if f566_local1 ~= nil and Engine.GetClassItem( f566_arg0, f566_local1, "primarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoTactical( f567_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f567_arg0 ), "hudItems.pulseNoTactical" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f567_local1 = CoD.CACUtility
	if f567_local1 then
		f567_local1 = CoD.CACUtility.SelectedClassIndex[f567_arg0]
	end
	if f567_local1 ~= nil and Engine.GetClassItem( f567_arg0, f567_local1, "secondarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoAmmo( f568_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f568_arg0 ), "hudItems.pulseNoAmmo" ) )
	local f568_local1
	if modelValue == nil or modelValue <= 0 then
		f568_local1 = false
	else
		f568_local1 = true
	end
	return f568_local1
end

function IsStickyImageActive( f569_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f569_arg0 ), "hudItems.stickyImage" ) )
	local f569_local1 = modelValue
	local f569_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f569_local2 = false
	else
		f569_local2 = f569_local1 and true
	end
	return f569_local2
end

function IsShockImageBottomActive( f570_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f570_arg0 ), "hudItems.shockImageBottom" ) )
	local f570_local1 = modelValue
	local f570_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f570_local2 = false
	else
		f570_local2 = f570_local1 and true
	end
	return f570_local2
end

function IsShockImageRightActive( f571_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f571_arg0 ), "hudItems.shockImageRight" ) )
	local f571_local1 = modelValue
	local f571_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f571_local2 = false
	else
		f571_local2 = f571_local1 and true
	end
	return f571_local2
end

function IsShockImageLeftActive( f572_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f572_arg0 ), "hudItems.shockImageLeft" ) )
	local f572_local1 = modelValue
	local f572_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f572_local2 = false
	else
		f572_local2 = f572_local1 and true
	end
	return f572_local2
end

function IsShockImageTopActive( f573_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f573_arg0 ), "hudItems.shockImageTop" ) )
	local f573_local1 = modelValue
	local f573_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f573_local2 = false
	else
		f573_local2 = f573_local1 and true
	end
	return f573_local2
end

function IsArmorOverlayActive( f574_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f574_arg0 ), "hudItems.armorOverlay" ) )
	local f574_local1 = modelValue
	local f574_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f574_local2 = false
	else
		f574_local2 = f574_local1 and true
	end
	return f574_local2
end

function IsAnyKillstreakInRangeAvailable( f575_arg0, f575_arg1, f575_arg2 )
	local f575_local0 = Engine.GetModel( Engine.GetModelForController( f575_arg0 ), "killstreaks" )
	if not f575_local0 then
		return false
	end
	for f575_local1 = f575_arg1, f575_arg2, 1 do
		local f575_local4 = Engine.GetModel( f575_local0, "killstreak" .. f575_local1 .. ".rewardAmmo" )
		local f575_local5 = f575_local4 and Engine.GetModelValue( f575_local4 )
		if f575_local5 ~= nil and f575_local5 > 0 then
			return true
		end
	end
	return false
end

function HigherKillstreakHasAmmo( f576_arg0, f576_arg1 )
	local f576_local0 = f576_arg1:getParent()
	local f576_local1 = f576_local0 and f576_local0.gridInfoTable
	if f576_local1 == nil then
		return false
	else
		local f576_local2 = 3 - f576_local1.zeroBasedIndex
		if f576_local2 >= 3 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f576_arg0, f576_local2 + 1, 4 )
		end
	end
end

function LowerKillstreakHasAmmo( f577_arg0, f577_arg1 )
	local f577_local0 = f577_arg1:getParent()
	local f577_local1 = f577_local0 and f577_local0.gridInfoTable
	if f577_local1 == nil then
		return false
	else
		local f577_local2 = 3 - f577_local1.zeroBasedIndex
		if f577_local2 == 0 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f577_arg0, 0, f577_local2 - 1 )
		end
	end
end

function EarningTowardsThisKillstreak( f578_arg0, f578_arg1 )
	local f578_local0 = Engine.GetModel( Engine.GetModelForController( f578_arg0 ), "rewardMomentum" )
	local f578_local1 = Engine.GetModel( f578_arg1:getModel(), "momentumCost" )
	local f578_local2 = Engine.GetModel( Engine.GetModelForController( f578_arg0 ), "killstreaks" )
	if f578_arg1.gridInfoTable == nil then
		return false
	elseif not f578_local1 or not f578_local0 or not f578_local2 then
		return false
	end
	local f578_local3 = Engine.GetModelValue( f578_local1 )
	local f578_local4 = Engine.GetModelValue( f578_local0 )
	if f578_local4 == nil or f578_local3 == nil or f578_local3 < f578_local4 then
		return false
	end
	local f578_local5 = 3 - f578_arg1.gridInfoTable.zeroBasedIndex
	for f578_local6 = 0, f578_local5, 1 do
		local f578_local9 = CoD.SafeGetModelValue( f578_local2, "killstreak" .. f578_local6 .. ".momentumCost" )
		if f578_local9 and f578_local4 < f578_local9 then
			return f578_local6 == f578_local5
		end
	end
	return false
end

function IsAtLeastHalfGameScore( f579_arg0, f579_arg1 )
	local f579_local0 = Engine.GetModelForController( f579_arg0 )
	local f579_local1 = f579_local0 and Engine.GetModel( f579_local0, "gameScore.scoreLimit" )
	if f579_local1 then
		f579_local1 = Engine.GetModelValue( f579_local1 )
	end
	local f579_local2 = f579_local0 and Engine.GetModel( f579_local0, f579_arg1 )
	local f579_local3 = f579_local2 and Engine.GetModelValue( f579_local2 )
	local f579_local4
	if f579_local1 == nil or f579_local3 == nil or f579_local1 > f579_local3 * 2 then
		f579_local4 = false
	else
		f579_local4 = true
	end
	return f579_local4
end

function IsCursorHintActive( f580_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f580_arg0 ), "hudItems.showCursorHint" ) )
	local f580_local1
	if modelValue == nil or modelValue ~= true then
		f580_local1 = false
	else
		f580_local1 = true
	end
	return f580_local1
end

function IsGameTypeDOA()
	return CoDShared.IsGameTypeDOA()
end

function HideScoreMeterDueToGameType()
	local f582_local0 = Engine.DvarString( nil, "g_gametype" )
	local f582_local1
	if f582_local0 == nil or f582_local0 ~= "ctf" and f582_local0 ~= "dem" and f582_local0 ~= "sd" then
		f582_local1 = false
	else
		f582_local1 = true
	end
	return f582_local1
end

function HideCyberCoreWidget( f583_arg0 )
	if Engine.GetCurrentMap() == "cp_mi_eth_prologue" and not Engine.IsCampaignModeZombies() then
		local f583_local0 = Engine.GetPlayerStats( f583_arg0 )
		return f583_local0.highestMapReached:get() == 0
	else
		return false
	end
end

function IsMapName( f584_arg0 )
	return Engine.GetCurrentMap() == f584_arg0
end

function IsAnyMapName( ... )
	for f585_local3, f585_local4 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		if f585_local4 == Engine.GetCurrentMap() then
			return true
		end
	end
end

function IsClipAmmoOnesDigitEqualTo( f586_arg0, f586_arg1, f586_arg2 )
	local f586_local0 = f586_arg0:getModel()
	if f586_local0 then
		f586_local0 = Engine.GetModel( f586_local0, "ammoInClip" )
	end
	local f586_local1 = f586_local0 and Engine.GetModelValue( f586_local0 )
	if f586_local1 == nil then
		return false
	else
		return f586_local1 % 10 == f586_arg2
	end
end

function IsClipAmmoTensDigitEqualTo( f587_arg0, f587_arg1, f587_arg2 )
	local f587_local0 = f587_arg0:getModel()
	if f587_local0 then
		f587_local0 = Engine.GetModel( f587_local0, "ammoInClip" )
	end
	local f587_local1 = f587_local0 and Engine.GetModelValue( f587_local0 )
	if f587_local1 == nil then
		return false
	else
		return (f587_local1 % 100 - f587_local1 % 10) / 10 == f587_arg2
	end
end

function HasRoundLimit( f588_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f588_arg0 ), "gameScore.roundLimit" ) ) > 0
end

function IsSingleRound( f589_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f589_arg0 ), "gameScore.roundLimit" ) ) == 1
end

function IsZombieRoundOnesDigitEqualTo( f590_arg0, f590_arg1, f590_arg2 )
	local f590_local0 = f590_arg0:getModel()
	if f590_local0 then
		f590_local0 = Engine.GetModel( f590_local0, "roundsPlayed" )
	end
	local f590_local1 = f590_local0 and Engine.GetModelValue( f590_local0 )
	if f590_local1 == nil then
		return false
	else
		return (f590_local1 - Engine.GetGametypeSetting( "startRound" )) % 10 == f590_arg2
	end
end

function IsZombieRoundTensDigitEqualTo( f591_arg0, f591_arg1, f591_arg2 )
	local f591_local0 = f591_arg0:getModel()
	if f591_local0 then
		f591_local0 = Engine.GetModel( f591_local0, "roundsPlayed" )
	end
	local f591_local1 = f591_local0 and Engine.GetModelValue( f591_local0 )
	if f591_local1 == nil then
		return false
	else
		f591_local1 = f591_local1 - Engine.GetGametypeSetting( "startRound" )
		return (f591_local1 % 100 - f591_local1 % 10) / 10 == f591_arg2
	end
end

function IsZombieRoundHundredsDigitEqualTo( f592_arg0, f592_arg1, f592_arg2 )
	local f592_local0 = f592_arg0:getModel()
	if f592_local0 then
		f592_local0 = Engine.GetModel( f592_local0, "roundsPlayed" )
	end
	local f592_local1 = f592_local0 and Engine.GetModelValue( f592_local0 )
	if f592_local1 == nil then
		return false
	else
		f592_local1 = f592_local1 - Engine.GetGametypeSetting( "startRound" )
		return (f592_local1 % 1000 - f592_local1 % 100) / 100 == f592_arg2
	end
end

function IsParentListInFocus( f593_arg0 )
	if f593_arg0.gridInfoTable then
		local f593_local0 = f593_arg0.gridInfoTable.parentGrid
		if f593_local0 and f593_local0.hasListFocus then
			return true
		end
	end
	return false
end

function IsDisabled( f594_arg0, f594_arg1 )
	local f594_local0 = f594_arg0:getModel( f594_arg1, "disabledFunction" )
	if f594_local0 then
		local f594_local1 = Engine.GetModelValue( f594_local0 )
		if f594_local1 then
			f594_arg0.disabled = f594_local1()
			return f594_local1()
		end
	end
	local f594_local1 = f594_arg0:getModel( f594_arg1, "disabled" )
	if f594_local1 then
		f594_arg0.disabled = Engine.GetModelValue( f594_local1 )
	end
	return f594_arg0.disabled
end

function IsEnabledByGametypeSetting( f595_arg0, f595_arg1 )
	if f595_arg0.enabledWithGametypeSetting ~= nil then
		return Engine.GetGametypeSetting( f595_arg0.enabledWithGametypeSetting ) == 1
	else
		return true
	end
end

function IsSelected( f596_arg0, f596_arg1 )
	local f596_local0 = f596_arg0:getModel( f596_arg1, "selected" )
	if f596_local0 then
		f596_arg0.selected = Engine.GetModelValue( f596_local0 )
	end
	return f596_arg0.selected
end

function IsStartMenuItemEquipped( f597_arg0, f597_arg1 )
	local f597_local0 = f597_arg0:getModel()
	if f597_local0 then
		local f597_local1 = CoD.SafeGetModelValue( f597_local0, "itemIndex" )
		if f597_local1 then
			return CoD.perController[f597_arg1].startMenu_equippedIndex == f597_local1
		end
	end
	return false
end

function IsFirstItem( f598_arg0 )
	return f598_arg0.isFirstItem and f598_arg0:isFirstItem()
end

function ShouldDisplayButton( f599_arg0, f599_arg1 )
	local f599_local0 = f599_arg0:getModel( f599_arg1, "tabIcon" )
	if f599_local0 then
		return Engine.GetModelValue( f599_local0 ) ~= ""
	else
		return false
	end
end

function IsHeroLocked( f600_arg0, f600_arg1 )
	if CoD.SafeGetModelValue( f600_arg0:getModel(), "disabled" ) then
		return true
	else
		return false
	end
end

function CanSelectContractHeroItem( f601_arg0, f601_arg1 )
	if IsHeroLocked( f601_arg0, f601_arg1 ) then
		return false
	end
	local f601_local0 = IsSelfModelValueTrue( f601_arg0, f601_arg1, "isActivated" )
	if not f601_local0 then
		f601_local0 = Dvar.ui_enableAllHeroes
		if f601_local0 then
			f601_local0 = Dvar.ui_enableAllHeroes:get()
		end
	end
	return f601_local0
end

function AllowLootHero( f602_arg0 )
	if IsInPermanentUnlockMenu( f602_arg0 ) then
		return false
	elseif IsFirstTimeSetup( f602_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
		return false
	elseif IsLive() and Dvar.ui_enableAllHeroes:exists() and Dvar.ui_enableAllHeroes:get() then
		return true
	else
		local f602_local0 = Engine.StorageGetBuffer( f602_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if not f602_local0 or not f602_local0.TenthSpecialistContract then
			return false
		elseif f602_local0.blackjack_contract_count:get() <= 0 and f602_local0.TenthSpecialistContract.active:get() ~= 1 then
			return false
		elseif not IsMPPublicMatchLobby() then
			return false
		else
			return true
		end
	end
end

function IsCurrentBribeForSpecialist( f603_arg0 )
	return CoD.BlackMarketUtility.BribeSpecialistIndices[f603_local0] and CoD.BlackMarketUtility.BribeSpecialistIndices[f603_local0] == CoD.SafeGetModelValue( f603_arg0:getModel(), "heroIndex" )
end

function AllowSpecialistBribeWidget( f604_arg0 )
	local f604_local0 = LobbyData.GetLobbyNav()
	local f604_local1
	if f604_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id and f604_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f604_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id and f604_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
		f604_local1 = false
	else
		f604_local1 = true
	end
	return f604_local1
end

function IsDoubleDailyContract( f605_arg0 )
	return Dvar.daily_contract_cryptokey_reward_count:get() ~= 10
end

function IsDoubleDailyContract_NoValidation( f606_arg0 )
	return Dvar.daily_contract_cryptokey_reward_count:get() ~= 10
end

function CanSelfWidgetSelectContractHeroItem( f607_arg0, f607_arg1 )
	return CanSelectContractHeroItem( f607_arg0, f607_arg1 )
end

function CanSelfWidgetStartNewHeroContract( f608_arg0, f608_arg1 )
	return IsSelfModelValueGreaterThan( f608_arg0, f608_arg1, "contractsRemaining", 0 )
end

function IsHeroWeaponAbilityNotAvailable( f609_arg0, f609_arg1 )
	return IsLive() and f609_local2 or f609_local1
end

function IsEdittingHeroOption( f610_arg0 )
	return f610_arg0.currentMode ~= CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

function IsExploringTaunts( f611_arg0 )
	return f611_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.ExploringTaunts
end

function IsEdittingTaunt( f612_arg0 )
	return f612_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingTaunt
end

function IsEdittingGestureOption( f613_arg0 )
	return f613_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingGesture
end

function CurrentPlayerHasGesture( f614_arg0, f614_arg1 )
	local f614_local0 = Engine.CurrentSessionMode()
	local f614_local1 = Engine.GetEquippedHero( f614_arg0, f614_local0 )
	return CoD.CCUtility.TauntsData.GetGestureXAnim( Engine.GetHeroBundleInfo( f614_local0, f614_local1 ), f614_arg1, Engine.GetSelectedGestureForHero( f614_arg0, f614_local0, f614_local1, f614_arg1 ) ) ~= ""
end

function ShouldShowPromptForGesture( f615_arg0, f615_arg1 )
	if IsSplitscreenAndInGame( f615_arg0 ) then
		return true
	else
		return CurrentPlayerHasGesture( f615_arg0, f615_arg1 )
	end
end

function CurrentPlayerHasAnyGesture( f616_arg0 )
	local f616_local0 = Engine.CurrentSessionMode()
	local f616_local1 = Engine.GetEquippedHero( f616_arg0, f616_local0 )
	local f616_local2 = Engine.GetHeroBundleInfo( f616_local0, f616_local1 )
	for f616_local3 = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		if CoD.CCUtility.TauntsData.GetGestureXAnim( f616_local2, f616_local3, Engine.GetSelectedGestureForHero( f616_arg0, f616_local0, f616_local1, f616_local3 ) ) ~= "" then
			return true
		end
	end
	return false
end

function ShouldShowGesturePrompt( f617_arg0 )
	if IsSplitscreenAndInGame( f617_arg0 ) then
		return true
	else
		return CurrentPlayerHasAnyGesture( f617_arg0 )
	end
end

function IsHeroColorOption( f618_arg0 )
	return f618_arg0.isColorOption
end

function FirstTimeSetup_IsActive( f619_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f619_arg0 ), "firstTimeFlowState" ) ) ~= CoD.CCUtility.FirstTimeFlowState.None
end

function FirstTimeSetup_Overview( f620_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f620_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Overview
end

function FirstTimeSetup_ChangedCharacter( f621_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f621_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.SelectionChanged
end

function FirstTimeSetup_Complete( f622_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f622_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Complete
end

function IsCurrentSelectedHeroOption( f623_arg0, f623_arg1 )
	local f623_local0 = f623_arg0:getModel( f623_arg1, "optionIndex" )
	if f623_local0 then
		local f623_local1 = Engine.GetModelValue( f623_local0 )
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				return f623_local1 == CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				return f623_local1 == CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			return f623_local1 == CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			return f623_local1 == CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
		end
	end
	return false
end

function IsCurrentLockedHeroOption( f624_arg0, f624_arg1 )
	local f624_local0 = f624_arg0:getModel()
	if f624_local0 then
		if CoD.SafeGetModelValue( f624_local0, "isLocked" ) then
			return true
		elseif CoD.SafeGetModelValue( f624_local0, "isBMClassified" ) then
			return true
		end
	end
	return false
end

function IsCurrentNewHeroOption( f625_arg0, f625_arg1, f625_arg2 )
	if (IsCampaign() or IsMultiplayer()) and IsProgressionEnabled( f625_arg2 ) then
		local f625_local0 = f625_arg1:getModel( f625_arg2, "optionIndex" )
		if f625_local0 then
			local f625_local1 = Engine.GetModelValue( f625_local0 )
			local f625_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
			local f625_local3 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
			if f625_local2 ~= nil and f625_local3 ~= nil then
				return Engine.IsCharacterCustomizationItemNew( f625_arg2, f625_local2, f625_local3, f625_local1 )
			end
		end
	end
	return false
end

function ShouldHideItemHeroOption( f626_arg0, f626_arg1 )
	if not IsMultiplayer() or not IsProgressionEnabled( f626_arg1 ) then
		return true
	elseif CoD.SafeGetModelValue( f626_arg0:getModel(), "isColorOption" ) == true then
		return true
	end
	local f626_local0 = f626_arg0:getModel()
	if f626_local0 then
		if CoD.SafeGetModelValue( f626_local0, "optionIndex" ) == 1 then
			return true
		elseif IsSelfModelValueTrue( f626_arg0, f626_arg1, "isClassified" ) or not IsSelfModelValueNilOrZero( f626_arg0, f626_arg1, "isBMClassified" ) then
			return true
		end
	end
	return false
end

function IsCurrentTauntNew( f627_arg0, f627_arg1, f627_arg2 )
	if f627_arg1.index and f627_arg1.xanim and f627_arg1.tauntType then
		return Engine.IsTauntNew( f627_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f627_arg1.tauntType, f627_arg1.index, f627_arg1.xanim )
	else
		return false
	end
end

function IsCurrentGestureNew( f628_arg0, f628_arg1, f628_arg2 )
	if f628_arg1.index and f628_arg1.xanim and f628_arg1.heroName and f628_arg1.gestureType then
		local f628_local0 = Enum.eModes.MODE_MULTIPLAYER
		local f628_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		if f628_arg1.xanim ~= "" then
			return Engine.IsGestureNew( f628_arg2, f628_local0, f628_local1, f628_arg1.gestureType, f628_arg1.index, f628_arg1.xanim .. ";" .. f628_arg1.heroName )
		end
	end
	return false
end

function AreAnyTauntsGesturesInListNew( f629_arg0, f629_arg1, f629_arg2 )
	local f629_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f629_local1 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, f629_local0 )
	local f629_local2 = CoD.CCUtility.customizationMode
	if f629_arg0.tauntType then
		for f629_local3 = 0, CoD.CCUtility.TauntsData.GetTauntCount( f629_local1, f629_arg0.tauntType ) - 1, 1 do
			if Engine.IsTauntNew( f629_arg2, f629_local2, f629_local0, f629_arg0.tauntType, f629_local3, CoD.CCUtility.TauntsData.GetTauntXAnim( f629_local1, f629_arg0.tauntType, f629_local3 ) ) then
				return true
			end
		end
	elseif f629_arg0.gestureType then
		local f629_local3 = Engine.GetHeroList( f629_local2 )
		f629_local3 = f629_local3[f629_local0 + 1].assetName
		for f629_local4 = 0, CoD.CCUtility.TauntsData.GetGestureCount( f629_local1, f629_arg0.gestureType ) - 1, 1 do
			local f629_local7 = CoD.CCUtility.TauntsData.GetGestureXAnim( f629_local1, f629_arg0.gestureType, f629_local4 )
			if f629_local7 ~= "" and Engine.IsGestureNew( f629_arg2, f629_local2, f629_local0, f629_arg0.gestureType, f629_local4, f629_local7 .. ";" .. f629_local3 ) then
				return true
			end
		end
	end
	return false
end

function IsObjectiveActive( f630_arg0, f630_arg1 )
	local f630_local0 = f630_arg0:getModel( f630_arg1, "status" )
	if f630_local0 then
		local f630_local1
		if Engine.GetModelValue( f630_local0 ) ~= "current" and Engine.GetModelValue( f630_local0 ) ~= "active" then
			f630_local1 = false
		else
			f630_local1 = true
		end
		return f630_local1
	else
		return false
	end
end

function IsObjectiveComplete( f631_arg0, f631_arg1 )
	local f631_local0 = f631_arg0:getModel( f631_arg1, "status" )
	if f631_local0 then
		return Engine.GetModelValue( f631_local0 ) == "done"
	else
		return false
	end
end

function IsObjectiveFailed( f632_arg0, f632_arg1 )
	local f632_local0 = f632_arg0:getModel( f632_arg1, "status" )
	if f632_local0 then
		return Engine.GetModelValue( f632_local0 ) == "failed"
	else
		return false
	end
end

function IsObjectiveDescription( f633_arg0, f633_arg1 )
	local f633_local0 = f633_arg0:getModel( f633_arg1, "status" )
	if f633_local0 then
		return Engine.GetModelValue( f633_local0 ) == "description"
	else
		return false
	end
end

function IsObjectiveHidden( f634_arg0, f634_arg1 )
	if f634_arg0:getModel() == nil then
		return true
	else
		local f634_local0 = Engine.GetModel( f634_arg0:getModel(), "state" )
		local f634_local1 = f634_local0 and Engine.GetModelValue( f634_local0 )
		local f634_local2 = Engine.GetPredictedClientNum( f634_arg1 )
		if f634_local1 == nil or f634_local1 == CoD.OBJECTIVESTATE_INVISIBLE then
			return true
		else
			local f634_local3 = Engine.GetModel( f634_arg0:getModel(), "clientUseMask" )
			local f634_local4 = f634_local3 and Engine.GetModelValue( f634_local3 )
			if f634_local4 == nil or f634_local4 == 0 then
				return false
			else
				return f634_local4 & 1 << Engine.GetPredictedClientNum( f634_arg1 ) == 0
			end
		end
	end
end

function IsObjectiveRequirementLabelHidden( f635_arg0, f635_arg1 )
	local f635_local0 = Engine.GetModel( Engine.GetModelForController( f635_arg1 ), "interactivePrompt.activeObjectiveID" )
	if f635_local0 then
		f635_local0 = Engine.GetModelValue( f635_local0 )
	end
	if f635_local0 and f635_arg0.objIndex == f635_local0 then
		if f635_arg0.recenter then
			f635_arg0:recenter()
		end
		return false
	else
		return true
	end
end

function IsListSelectionMode( f636_arg0, f636_arg1 )
	return f636_arg0.currentMode == f636_arg1
end

function IsPaintJobCustomItem( f637_arg0, f637_arg1 )
	if DataSources.WeaponOptions.getCurrentFilterItem() == "paintjob" then
		local f637_local0 = f637_arg0:getModel( f637_arg1, "ref" )
		if f637_local0 and Engine.GetModelValue( f637_local0 ) == "paintshop_1" then
			return true
		end
	end
	return false
end

function IsPaintJobCustomListButton( f638_arg0, f638_arg1 )
	local f638_local0 = f638_arg0:getModel( f638_arg1, "type" )
	local f638_local1 = f638_arg0:getModel( f638_arg1, "paintjobSlot" )
	local f638_local2 = f638_arg0:getModel( f638_arg1, "paintjobIndex" )
	if f638_local0 and f638_local1 and f638_local2 then
		if Engine.GetModelValue( f638_local0 ) == "paintjob" and Engine.GetModelValue( f638_local1 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and Engine.GetModelValue( f638_local2 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			return true
		end
	end
	return false
end

function IsCPHeroWeapon( f639_arg0, f639_arg1 )
	if CoD.isCampaign then
		local f639_local0 = CoD.CACUtility.loadoutSlotNames
		local f639_local1 = CoD.perController[f639_arg1].classNum
		if f639_arg0.currentActiveSlot then
			local f639_local2 = f639_arg0.currentActiveSlot
			if (f639_local2 == f639_local0.primaryWeapon or f639_local2 == f639_local0.secondaryWeapon) and CoD.CACUtility.IsCPHeroWeapon( CoD.GetClassItem( f639_arg1, f639_local1, f639_local2 ) ) then
				return true
			end
		end
	end
	return false
end

function IsToggleVariantEnabled()
	return Dvar.gunsmith_enable_toggle_variant:exists() and Dvar.gunsmith_enable_toggle_variant:get()
end

function HasGlobalHintText( f641_arg0 )
	return DataSources.PerController.hasHintText( f641_arg0 )
end

function HasHintText( f642_arg0 )
	local f642_local0 = f642_arg0:getModel()
	if f642_local0 then
		local f642_local1 = Engine.GetModel( f642_local0, "hintText" )
		if f642_local1 then
			local f642_local2 = Engine.GetModelValue( f642_local1 )
			if f642_local2 ~= "" and f642_local2 ~= Engine.Localize( "" ) then
				return true
			end
		end
	end
	return false
end

function PDV_SlotHasCollectible( f643_arg0, f643_arg1 )
	local f643_local0 = f643_arg0:getModel( f643_arg1, "collectibleSlot" )
	if f643_local0 and Engine.GetCollectibleInBunkSlot( f643_arg1, Engine.GetModelValue( f643_local0 ) ) ~= nil then
		return true
	else
		return false
	end
end

function IsGunsmithItemWeaponOptionLocked( f644_arg0, f644_arg1, f644_arg2 )
	if not IsLive() then
		local f644_local0 = GetUnlockSessionMode( f644_arg1, f644_arg2 )
		if f644_local0 == Enum.eModes.MODE_MULTIPLAYER or f644_local0 == Enum.eModes.MODE_ZOMBIES then
			return false
		end
	end
	local f644_local0 = f644_arg1:getModel( f644_arg2, "weaponOptionSubIndex" )
	local f644_local1 = f644_arg1:getModel( f644_arg2, "weaponOptionType" )
	local f644_local2 = CoD.GetCustomization( f644_arg2, "weapon_index" )
	if f644_local0 and f644_local1 then
		local f644_local3 = Engine.GetModelValue( f644_local0 )
		local f644_local4 = Engine.GetModelValue( f644_local1 )
		local f644_local5 = Engine.GetWeaponOptionGroupIndex( f644_local3, f644_local4 )
		if f644_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local f644_local6 = CoD.perController[f644_arg2].gunsmithVariantModel
			if f644_local6 then
				local f644_local7 = Engine.GetModel( f644_local6, "attachment1" )
				if f644_local7 then
					f644_local2 = Engine.GetModelValue( f644_local7 )
				end
			end
		end
		if (f644_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f644_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f644_local3 == 0 then
			return false
		elseif f644_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if f644_local3 == 0 then
				return false
			end
			local f644_local6 = Engine.GetAttachmentRef( f644_local2, f644_local3 )
			for f644_local10, f644_local11 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f644_local6 == f644_local11 then
					return CoD.CACUtility.GetWeaponPLevel( f644_arg2, f644_local2 ) < f644_local10
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( f644_arg2, f644_local2, f644_local5 )
	end
	return false
end

function Gunsmith_OnState( f645_arg0, f645_arg1 )
	local f645_local0 = f645_arg0:getModel( f645_arg1, "param" )
	if f645_local0 then
		local f645_local1 = Engine.GetModelValue( f645_local0 )
		if f645_local1 then
			local f645_local2 = Engine.GetModel( Engine.GetGlobalModel(), f645_local1 )
			if f645_local2 then
				return Engine.GetModelValue( f645_local2 ) == 1
			end
		end
	end
end

function IsGunsmithCurrentACVEquipped( f646_arg0, f646_arg1, f646_arg2 )
	local f646_local0 = Engine.GetModelValue( CoD.perController[f646_arg2].gunsmithAttachmentVariantModel )
	local f646_local1 = f646_arg1:getModel( f646_arg2, "variantIndex" )
	if f646_local1 then
		return f646_local0 == Engine.GetModelValue( f646_local1 )
	else
		return false
	end
end

function IsGunsmithReticleAllowedForOptic( f647_arg0, f647_arg1, f647_arg2, f647_arg3 )
	local f647_local0 = CoD.perController[f647_arg2].gunsmithVariantModel
	if f647_local0 and f647_arg3 then
		local f647_local1 = Engine.GetModel( f647_local0, f647_arg3 )
		if f647_local1 then
			local f647_local2 = Engine.GetModelValue( f647_local1 )
			local f647_local3 = Engine.GetAttachmentRefByIndex( f647_local2 )
			if CoD.CACUtility.EmptyItemIndex < f647_local2 then
				return CoD.CACUtility.attachmentsWithCustReticle[f647_local3]
			end
		end
	end
	return false
end

function Gunsmith_DoesACVExistForAttachment( f648_arg0, f648_arg1, f648_arg2, f648_arg3 )
	local f648_local0 = CoD.perController[f648_arg2].gunsmithVariantModel
	local f648_local1 = CoD.SafeGetModelValue( f648_local0, "weaponIndex" )
	local f648_local2 = CoD.SafeGetModelValue( f648_local0, f648_arg3 )
	if f648_local1 and f648_local2 then
		local f648_local3 = Engine.GetAttachmentCosmeticVariantCountForAttachment( Engine.GetItemRef( f648_local1, Enum.eModes.MODE_MULTIPLAYER ), f648_local2 )
		if f648_local3 and f648_local3 > 0 then
			return true
		end
	end
	return false
end

function Gunsmith_DisablePaintjobVariantSlot( f649_arg0, f649_arg1 )
	if not Paintjobs_IsEnabled( f649_arg0, f649_arg1 ) or IsUserContentRestricted( f649_arg1 ) then
		return true
	else
		return false
	end
end

function ShouldHidePaintJobOptionInZM( f650_arg0, f650_arg1, f650_arg2 )
	if not IsLive() or IsUserContentRestricted( f650_arg2 ) then
		return true
	elseif CoD.CraftUtility.GetWeaponGroupName( f650_arg2 ) == "weapon_knife" then
		return true
	else
		return false
	end
end

function Gunsmith_IsEnabled( f651_arg0, f651_arg1 )
	if IsPlayerAGuest( f651_arg1 ) then
		return false
	elseif IsIntDvarNonZero( "gunsmith_enabled" ) and IsLive() then
		return true
	else
		return false
	end
end

function Gunsmith_ValidVariantNameEntered( f652_arg0, f652_arg1 )
	local f652_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f652_arg1 ), "Gunsmith.validVariantNameEntered" ) )
	if f652_local0 ~= nil and f652_local0 == true then
		f652_arg0:makeFocusableWithoutResettingNavigation()
		return true
	else
		f652_arg0:makeNotFocusable()
		return false
	end
end

function Gunsmith_IsVariantOccupied( f653_arg0, f653_arg1 )
	local f653_local0 = Engine.GetModel( f653_arg0:getModel(), "variantIndex" )
	if f653_local0 and CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( Engine.GetModelValue( f653_local0 ) ) then
		return true
	else
		return false
	end
end

function Gunsmith_IsAttachmentEquipped( f654_arg0, f654_arg1, f654_arg2 )
	local f654_local0 = f654_arg1:getModel()
	local f654_local1 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f654_arg2, CoD.perController[f654_arg2].gunsmithVariantModel )
	if f654_local0 then
		local f654_local2 = Engine.GetModel( f654_local0, "attachmentIndex" )
		if f654_local2 then
			local f654_local3 = Engine.GetModelValue( f654_local2 )
			for f654_local7, f654_local8 in ipairs( f654_local1 ) do
				if f654_local8 == f654_local3 then
					return true
				end
			end
		end
	end
	return false
end

function Gunsmith_IsItemMutuallyExclusiveWithSelection( f655_arg0, f655_arg1 )
	local f655_local0 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f655_arg1, CoD.perController[f655_arg1].gunsmithVariantModel )
	local f655_local1 = CoD.CACUtility.EmptyItemIndex
	local f655_local2 = f655_arg0:getModel( f655_arg1, "attachmentIndex" )
	local f655_local3 = CoD.GetCustomization( f655_arg1, "weapon_index" )
	if f655_local2 then
		f655_local1 = Engine.GetModelValue( f655_local2 )
		for f655_local7, f655_local8 in ipairs( f655_local0 ) do
			if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f655_local8 and f655_local1 ~= f655_local8 then
				return not Engine.AreAttachmentsCompatible( f655_local3, Engine.GetAttachmentIndexByAttachmentTableIndex( f655_local3, f655_local1, Enum.eModes.MODE_MULTIPLAYER ), Engine.GetAttachmentIndexByAttachmentTableIndex( f655_local3, f655_local8, Enum.eModes.MODE_MULTIPLAYER ), Enum.eModes.MODE_MULTIPLAYER )
			end
		end
	end
	return false
end

function Gunsmith_IsAttachmentNew( f656_arg0, f656_arg1, f656_arg2 )
	local f656_local0 = CoD.GetCustomization( f656_arg2, "weapon_index" )
	local f656_local1 = f656_arg1:getModel()
	if f656_local1 then
		local f656_local2 = Engine.GetModel( f656_local1, "attachmentIndex" )
		if f656_local2 then
			return Engine.IsAttachmentNew( f656_arg2, f656_local0, Engine.GetAttachmentIndexByAttachmentTableIndex( f656_local0, Engine.GetModelValue( f656_local2 ) ) )
		end
	end
	return false
end

function Gunsmith_IsCamoEquipped( f657_arg0, f657_arg1, f657_arg2 )
	local f657_local0 = f657_arg1:getModel()
	local f657_local1 = Engine.GetModelValue( f657_arg0:getModel() )
	if f657_local0 then
		local f657_local2 = Engine.GetModel( f657_local0, "itemIndex" )
		if f657_local2 and f657_local1 == Engine.GetModelValue( f657_local2 ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsReticleEquipped( f658_arg0, f658_arg1, f658_arg2 )
	local f658_local0 = f658_arg1:getModel()
	local f658_local1 = Engine.GetModelValue( f658_arg0:getModel() )
	if f658_local0 then
		local f658_local2 = Engine.GetModel( f658_local0, "weaponOptionSubIndex" )
		if f658_local2 and f658_local1 == Engine.GetModelValue( f658_local2 ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsCamoNew( f659_arg0, f659_arg1, f659_arg2 )
	local f659_local0 = CoD.GetCustomization( f659_arg2, "weapon_index" )
	local f659_local1 = f659_arg1:getModel()
	if f659_local1 then
		local f659_local2 = Engine.GetModel( f659_local1, "itemIndex" )
		if f659_local2 then
			return Engine.IsWeaponOptionNew( f659_arg2, f659_local0, Engine.GetModelValue( f659_local2 ) )
		end
	end
	return false
end

function Gunsmith_IsReticleNew( f660_arg0, f660_arg1, f660_arg2 )
	local f660_local0 = CoD.GetCustomization( f660_arg2, "weapon_index" )
	local f660_local1 = f660_arg1:getModel()
	local f660_local2 = CoD.perController[f660_arg2].gunsmithVariantModel
	if f660_local1 and f660_local2 then
		local f660_local3 = CoD.SafeGetModelValue( f660_local1, "weaponOptionSubIndex" )
		local f660_local4 = CoD.SafeGetModelValue( f660_local1, "weaponOptionType" )
		local f660_local5 = CoD.SafeGetModelValue( f660_local2, "attachment1" )
		if f660_local3 and f660_local4 and f660_local5 then
			return Engine.IsWeaponOptionNew( f660_arg2, f660_local5, Engine.GetWeaponOptionGroupIndex( f660_local3, f660_local4 ) )
		end
	end
	return false
end

function Gunsmith_IsACVItemNew( f661_arg0, f661_arg1 )
	local f661_local0 = CoD.GetCustomization( f661_arg1, "weapon_index" )
	local f661_local1 = f661_arg0.variantIndex
	local f661_local2 = f661_arg0.attachmentTableIndex
	if CoD.SafeGetModelValue( f661_arg0:getModel(), "isBMClassified" ) == true then
		return false
	elseif f661_local2 and f661_local1 and CoD.CACUtility.EmptyItemIndex < f661_local1 then
		return IsACVItemNewHelper( f661_arg1, f661_local0, f661_local2, f661_local1, Enum.eModes.MODE_MULTIPLAYER )
	else
		return false
	end
end

function Gunsmith_AnyOpticsNew( f662_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewOptics( f662_arg0, CoD.GetCustomization( f662_arg0, "weapon_index" ) )
end

function Gunsmith_AnyAttachmentsNew( f663_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments( f663_arg0, CoD.GetCustomization( f663_arg0, "weapon_index" ) )
end

function Gunsmith_AnyCamosNew( f664_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewCamos( f664_arg0, CoD.GetCustomization( f664_arg0, "weapon_index" ) )
end

function Gunsmith_AnyNewItemsForWeapon( f665_arg0, f665_arg1 )
	local f665_local0 = f665_arg0:getModel( f665_arg1, "itemIndex" )
	if f665_local0 then
		local f665_local1 = Engine.GetModelValue( f665_local0 )
		if f665_local1 > CoD.CACUtility.EmptyItemIndex then
			return CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( f665_arg1, f665_local1 )
		end
	end
	return false
end

function Gunsmith_AnyNewWeaponsOrAttachmentsForGroupButton( f666_arg0, f666_arg1 )
	local f666_local0 = Engine.GetModel( f666_arg0:getModel(), "categoryRef" )
	if f666_local0 then
		return CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( f666_arg1, Engine.GetModelValue( f666_local0 ) )
	else
		return false
	end
end

function Gunsmith_AnyNewWeaponsOrAttachments( f667_arg0 )
	for f667_local0 = 1, #CoD.Craft.WeaponGroupNames, 1 do
		if CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( f667_arg0, CoD.Craft.WeaponGroupNames[f667_local0].weapon_category ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsSpecialWeapon( f668_arg0, f668_arg1, f668_arg2 )
	local f668_local0 = CoD.CraftUtility.GetWeaponGroupName( f668_arg2 )
	local f668_local1 = false
	local f668_local2 = Engine.GetItemRef( CoD.GetCustomization( f668_arg2, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if f668_local0 == "weapon_launcher" or f668_local0 == "weapon_knife" or f668_local2 == "special_discgun" or f668_local2 == "knife_ballistic" then
		f668_local1 = true
	end
	return f668_local1
end

function Gunsmith_IsHandguns( f669_arg0, f669_arg1, f669_arg2 )
	local f669_local0 = CoD.CraftUtility.GetWeaponGroupName( f669_arg2 )
	local f669_local1 = Engine.GetItemRef( CoD.GetCustomization( f669_arg2, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if f669_local0 == "weapon_pistol" or f669_local0 == "weapon_special" and f669_local1 ~= "special_discgun" and f669_local1 ~= "knife_ballistic" then
		return true
	else
		return false
	end
end

function Gunsmith_IsSnipers( f670_arg0, f670_arg1, f670_arg2 )
	return CoD.CraftUtility.GetWeaponGroupName( f670_arg2 ) == "weapon_sniper"
end

function Gunsmith_IsLockedForDemo( f671_arg0, f671_arg1, f671_arg2 )
	local f671_local0 = f671_arg1:getModel()
	if f671_local0 then
		local f671_local1 = Engine.GetModel( f671_local0, "name" )
		if f671_local1 and Engine.GetModelValue( f671_local1 ) == "MP_CLASSIFIED" then
			return true
		end
	end
	return false
end

function Gunsmith_IsVariantCountEmpty( f672_arg0, f672_arg1 )
	local f672_local0 = f672_arg0:getModel( f672_arg1, "itemIndex" )
	if f672_local0 then
		local f672_local1 = Engine.GetModelValue( f672_local0 )
		if f672_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( f672_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function Gunsmith_IsSnapshotWeaponLevelMax( f673_arg0, f673_arg1, f673_arg2 )
	local f673_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f673_arg2, f673_arg1 )
	if f673_local0 == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	local f673_local1 = CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode()
	local f673_local2 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f673_local1 )
	local f673_local3 = 0
	local f673_local4 = Engine.GetGunCurrentRank( f673_arg2, f673_local0, f673_local1 )
	local f673_local5 = Engine.GetGunNextRank( f673_arg2, f673_local0, f673_local1 )
	local f673_local6 = Engine.GetGunCurrentRankXP( f673_arg2, f673_local0, f673_local1 )
	local f673_local7 = Engine.StorageGetBuffer( f673_arg2, f673_local2 )
	if f673_local7 then
		f673_local3 = f673_local7.ItemStats[f673_local0].xp:get()
	end
	local f673_local8
	if f673_local4 ~= f673_local5 or f673_local6 > f673_local3 then
		f673_local8 = false
	else
		f673_local8 = true
	end
	return f673_local8
end

function Gunsmith_IsSnapshotGunLevelExists( f674_arg0, f674_arg1, f674_arg2 )
	local f674_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f674_arg2, f674_arg1 )
	if Engine.IsCampaignGame() then
		local f674_local1 = CoD.GetAttachments( f674_local0 )
		if f674_local1 then
			f674_local1 = #CoD.GetAttachments( f674_local0 ) > 0
		end
		local f674_local2
		if f674_local0 ~= CoD.CACUtility.EmptyItemIndex then
			f674_local2 = f674_local1
		else
			f674_local2 = false
		end
		return f674_local2
	else
		return f674_local0 ~= CoD.CACUtility.EmptyItemIndex
	end
end

function Gunsmith_IsNewVariant( f675_arg0 )
	if CoD.perController[f675_arg0].emptyVariantSelected and CoD.perController[f675_arg0].emptyVariantSelected == true then
		return true
	else
		return false
	end
end

function Gunsmith_IsCurrentVariantChanged( f676_arg0 )
	if not Gunsmith_IsNewVariant( f676_arg0 ) then
		local f676_local0 = CoD.perController[f676_arg0].gunsmithVariantModel
		if f676_local0 and CoD.CraftUtility.Gunsmith.IsCurrentVariantChanged( f676_arg0, f676_local0 ) then
			return true
		end
	end
	return false
end

function IsAttachmentLockedInWeaponBuildKits( f677_arg0, f677_arg1 )
	if not IsProgressionEnabled( f677_arg1 ) then
		return false
	else
		local f677_local0 = CoD.GetCustomization( f677_arg1, "weapon_index" )
		local f677_local1 = f677_arg0:getModel( f677_arg1, "attachmentIndex" )
		if f677_local0 and f677_local1 then
			return IsItemAttachmentLocked( f677_arg1, f677_local0, Engine.GetAttachmentIndexByAttachmentTableIndex( f677_local0, Engine.GetModelValue( f677_local1 ), Enum.eModes.MODE_ZOMBIES ), "IALIWBK" )
		else
			
		end
	end
end

function IsAttachmentSlotLocked( f678_arg0, f678_arg1, f678_arg2 )
	if IsZombies() and not IsProgressionEnabled( f678_arg1 ) then
		return false
	end
	local f678_local0 = f678_arg0:getModel( f678_arg1, "weaponIndex" )
	if not f678_local0 then
		return false
	end
	local f678_local1 = Engine.IsAttachmentSlotLocked( f678_arg1, Engine.GetModelValue( f678_local0 ), f678_arg2 )
	if f678_local1 == nil then
		f678_local1 = false
	end
	return f678_local1
end

function IsGridOn( f679_arg0, f679_arg1 )
	return Engine.GetProfileVarInt( f679_arg0, f679_arg1 ) ~= 0
end

function Paintjobs_IsOccupied( f680_arg0, f680_arg1 )
	local f680_local0 = Engine.GetModel( f680_arg0:getModel(), "paintjobSlot" )
	local f680_local1 = Engine.GetModel( f680_arg0:getModel(), "paintjobIndex" )
	if f680_local0 and f680_local1 and CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( Engine.GetModelValue( f680_local0 ), Engine.GetModelValue( f680_local1 ) ) then
		return true
	else
		return false
	end
end

function Paintjobs_DisableGroupsFeature()
	return Dvar.ui_emblemDisableGroups.exists() and Dvar.ui_emblemDisableGroups:get()
end

function Paintjobs_IsCountGreaterThanZero( f682_arg0, f682_arg1 )
	local f682_local0 = f682_arg0:getModel( f682_arg1, "itemIndex" )
	if f682_local0 then
		local f682_local1 = Engine.GetModelValue( f682_local0 )
		if f682_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( f682_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function Paintjobs_IsEnabled( f683_arg0, f683_arg1 )
	if IsSplitscreenSafehouse() then
		return false
	elseif IsPlayerAGuest( f683_arg1 ) then
		return false
	elseif IsLive() then
		return true
	else
		return false
	end
end

function IsGroupSlotAvailable( f684_arg0 )
	local f684_local0 = Engine.GetModel( Engine.GetModelForController( f684_arg0 ), "Emblem.EmblemProperties.groupsUsed" )
	local f684_local1 = false
	if f684_local0 then
		f684_local1 = Engine.GetModelValue( f684_local0 ) < Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS - 1
	end
	return f684_local1
end

function IsEmptyLayerAvailable( f685_arg0 )
	local f685_local0 = Engine.GetModel( Engine.GetModelForController( f685_arg0 ), "Emblem.EmblemProperties.layersUsed" )
	local f685_local1 = false
	local f685_local2 = CoD.perController[f685_arg0].totalLayers
	if f685_local0 then
		f685_local1 = Engine.GetModelValue( f685_local0 ) < f685_local2
	end
	return f685_local1
end

function BrowseModeLinkedLayer( f686_arg0, f686_arg1, f686_arg2 )
	local f686_local0 = IsModelValueEqualToEnum( f686_arg2, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f686_local0 then
		f686_local0 = Emblems_IsLayerLinked( f686_arg1, f686_arg2 )
		if f686_local0 then
			f686_local0 = IsModelValueGreaterThanOrEqualTo( f686_arg2, "Emblem.EmblemProperties.linkedLayerCount", 2 )
			if f686_local0 then
				if not Emblem_IsLayerGrouped( f686_arg1, f686_arg2 ) then
					f686_local0 = IsGroupSlotAvailable( f686_arg2 )
					if f686_local0 then
						f686_local0 = not Paintjobs_DisableGroupsFeature()
					end
				else
					f686_local0 = false
				end
			end
		end
	end
	return f686_local0
end

function BrowseModeGroupedLayer( f687_arg0, f687_arg1, f687_arg2 )
	local f687_local0 = IsModelValueEqualToEnum( f687_arg2, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f687_local0 then
		f687_local0 = Emblem_IsLayerGrouped( f687_arg1, f687_arg2 )
		if f687_local0 then
			f687_local0 = not Paintjobs_DisableGroupsFeature()
		end
	end
	return f687_local0
end

function BrowseModeOneLayerLinked( f688_arg0, f688_arg1, f688_arg2 )
	local f688_local0 = IsBrowseMode( f688_arg2 )
	if f688_local0 then
		if not IsLayerEmpty( f688_arg0, f688_arg1, f688_arg2 ) then
			f688_local0 = Emblems_IsLayerLinked( f688_arg1, f688_arg2 )
			if f688_local0 then
				f688_local0 = not Paintjobs_DisableGroupsFeature()
			end
		else
			f688_local0 = false
		end
	end
	return f688_local0
end

function BrowseMode( f689_arg0, f689_arg1, f689_arg2 )
	local f689_local0 = IsBrowseMode( f689_arg2 )
	if f689_local0 then
		if not IsLayerEmpty( f689_arg0, f689_arg1, f689_arg2 ) then
			f689_local0 = not Paintjobs_DisableGroupsFeature()
		else
			f689_local0 = false
		end
	end
	return f689_local0
end

function GroupsDisabledMode( f690_arg0, f690_arg1, f690_arg2 )
	local f690_local0 = Paintjobs_DisableGroupsFeature()
	if f690_local0 then
		f690_local0 = IsBrowseMode( f690_arg2 )
		if f690_local0 then
			f690_local0 = not IsLayerEmpty( f690_arg0, f690_arg1, f690_arg2 )
		end
	end
	return f690_local0
end

function IsUserContentRestricted( f691_arg0 )
	return Engine.IsUserContentRestricted( f691_arg0 )
end

function IsUserChatRestricted( f692_arg0 )
	return Engine.IsUserChatRestricted( f692_arg0 )
end

function IsSplitscreenSafehouse()
	if CoD.isSafehouse and Engine.IsSplitscreen() then
		return true
	else
		return false
	end
end

function IsPaintshopButtonDisabled( f694_arg0 )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( f694_arg0 )
	end
end

function IsDataVaultEmblemButtonDisabled( f695_arg0 )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( f695_arg0 )
	end
end

function CraftItemIsReadOnly( f696_arg0, f696_arg1 )
	local f696_local0 = Engine.GetModel( f696_arg0:getModel(), "readOnly" )
	if f696_local0 and Engine.GetModelValue( f696_local0 ) == 1 then
		return true
	else
		return false
	end
end

function Challenges_IsCategoryLocked( f697_arg0, f697_arg1, f697_arg2 )
	local f697_local0 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f697_local0 then
		return returnTable
	end
	local f697_local1 = Engine.GetPlayerStats( f697_arg1, CoD.STATS_LOCATION_NORMAL, f697_local0.index )
	local f697_local2 = f697_local1.PlayerStatsList.RANK.StatValue:get()
	local f697_local3 = f697_local1.PlayerStatsList.PLEVEL.StatValue:get()
	local f697_local4, f697_local5 = nil
	local f697_local6 = Engine.GetChallengeInfoForImages( f697_arg1, f697_arg2, f697_local0.index )
	if #f697_local6 == 0 then
		if f697_arg0 ~= nil then
			f697_arg0:processEvent( {
				name = "set_unlock_instructions",
				rank = f697_local2,
				plevel = f697_local3,
				unlockRank = f697_local4,
				unlockPLevel = f697_local5,
				mode = f697_local0.index
			} )
		end
		return true
	end
	for f697_local14, f697_local15 in ipairs( f697_local6 ) do
		if f697_local15.currentChallengeRow ~= nil then
			return false
		end
		local f697_local10 = f697_local15.challengeRow
		if f697_local10 ~= nil then
			local f697_local11 = "gamedata/stats/" .. f697_local0.name .. "/statsmilestones" .. f697_local15.tableNum + 1 .. ".csv"
			local f697_local12 = tonumber( Engine.TableLookupGetColumnValueForRow( f697_local11, f697_local10, CoD.ChallengesUtility.UnlockRankCol ) )
			local f697_local13 = tonumber( Engine.TableLookupGetColumnValueForRow( f697_local11, f697_local10, CoD.ChallengesUtility.UnlockPLevelCol ) )
			if f697_local12 == nil then
				f697_local12 = 0
			end
			if f697_local13 == nil then
				f697_local13 = 0
			end
			if f697_local4 == nil or f697_local5 == nil then
				f697_local4 = f697_local12
				f697_local5 = f697_local13
			end
			if f697_local12 < f697_local4 then
				f697_local4 = f697_local12
			end
			if f697_local13 < f697_local5 then
				f697_local5 = f697_local13
			end
		end
	end
	if f697_local5 < f697_local3 then
		return false
	elseif f697_local3 == f697_local5 and f697_local4 <= f697_local2 then
		return false
	elseif f697_arg0 ~= nil then
		f697_arg0:processEvent( {
			name = "set_unlock_instructions",
			rank = f697_local2,
			plevel = f697_local3,
			unlockRank = f697_local4,
			unlockPLevel = f697_local5,
			mode = f697_local0.index
		} )
	end
	return true
end

function IsPercentTextAt100Percent( f698_arg0 )
	if type( f698_arg0 ) ~= "string" then
		return false
	else
		return f698_arg0 == Engine.Localize( "MPUI_PERCENT", 100 )
	end
end

function TextHeightGreaterThan( f699_arg0, f699_arg1, f699_arg2 )
	if f699_arg0[f699_arg1] == nil then
		return false
	else
		local f699_local0, f699_local1 = f699_arg0[f699_arg1]:getTextWidthAndHeight()
		return f699_arg2 < f699_local1
	end
end

function Emblems_CanEnterEmblemEditor( f700_arg0, f700_arg1 )
	if not CraftSlotsFullByStorageType( f700_arg1, Enum.StorageFileType.STORAGE_EMBLEMS ) then
		return true
	elseif not IsPreBuiltEmblemTab( f700_arg1 ) then
		return true
	else
		return false
	end
end

function Emblems_IsDefaultEmblemEquipped( f701_arg0, f701_arg1, f701_arg2 )
	local f701_local0 = f701_arg1:getModel( f701_arg2, "emblemIndex" )
	if f701_local0 then
		local f701_local1 = Engine.GetModelValue( f701_local0 )
		local f701_local2 = Engine.GetProfileVarInt( f701_arg2, "default_emblem_index" )
		if f701_local2 ~= CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX and f701_local2 == f701_local1 then
			return true
		end
	end
	return false
end

function Emblem_IsOccupied( f702_arg0, f702_arg1 )
	if f702_arg0:getModel() then
		local f702_local0 = Engine.GetModel( f702_arg0:getModel(), "emblemIndex" )
		if f702_local0 and CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( Engine.GetModelValue( f702_local0 ) ) then
			return true
		end
	end
	return false
end

function Emblems_IsEnabled( f703_arg0, f703_arg1 )
	if IsPlayerAGuest( f703_arg1 ) then
		return false
	else
		return true
	end
end

function CommunityOptionsEnabled()
	return true
end

function Emblems_IsLayerLinked( f705_arg0, f705_arg1 )
	local f705_local0 = f705_arg0:getModel( f705_arg1, "isLinked" )
	if f705_local0 then
		return Engine.GetModelValue( f705_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGrouped( f706_arg0, f706_arg1 )
	local f706_local0 = f706_arg0:getModel( f706_arg1, "isGrouped" )
	if f706_local0 then
		return Engine.GetModelValue( f706_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGroupedByLayerIndex( f707_arg0, f707_arg1 )
	local f707_local0 = CoD.GetCustomization( f707_arg1, "type" )
	if CoD.perController[f707_arg1].selectedLayerIndex ~= nil then
		local f707_local1 = Engine.GetSelectedLayerData( f707_arg1, CoD.perController[f707_arg1].selectedLayerIndex, f707_local0 )
		return f707_local1.isGrouped
	else
		return false
	end
end

function IsEmblemEmpty( f708_arg0 )
	return Engine.IsEmblemEmpty( f708_arg0, CoD.GetCustomization( f708_arg0, "type" ), CoD.perController[f708_arg0].totalLayers )
end

function Emblem_IsAnyLayerEmpty( f709_arg0 )
	local f709_local0 = CoD.perController[f709_arg0].totalLayers
	if f709_local0 == Engine.GetUsedLayerCount( f709_arg0, CoD.GetCustomization( f709_arg0, "type" ), f709_local0 ) then
		return false
	else
		return true
	end
end

function IsPaintjobAllSidesEmpty( f710_arg0 )
	local f710_local0 = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	return Engine.IsEmblemEmpty( f710_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP, f710_local0 ) and Engine.IsEmblemEmpty( f710_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, f710_local0 ) and Engine.IsEmblemEmpty( f710_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT, f710_local0 )
end

function IsLayerEmpty( f711_arg0, f711_arg1, f711_arg2 )
	if f711_arg0.layerCarousel ~= nil then
		local f711_local0 = f711_arg0.layerCarousel.currentStartRow
		f711_arg1 = f711_arg0.layerCarousel.layoutItems[f711_arg0.layerCarousel.currentStartRow][f711_arg0.layerCarousel.currentStartColumn]
	end
	if f711_arg1 then
		local f711_local0 = f711_arg1:getModel( f711_arg2, "layerIndex" )
		if not f711_local0 then
			return true
		elseif Engine.GetSelectedLayerIconID( f711_arg2, Engine.GetModelValue( f711_local0 ) ) == CoD.emblem.INVALID_ID then
			return true
		else
			return false
		end
	else
		return true
	end
end

function IsEditMode( f712_arg0 )
	return CoD.GetEditorProperties( f712_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT
end

function IsBrowseMode( f713_arg0 )
	return CoD.GetEditorProperties( f713_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
end

function IsClipboardEmpty( f714_arg0 )
	return CoD.GetEditorProperties( f714_arg0, "isClipboardEmpty" ) == CoD.emblem.CLIPBOARDSTATE.EMPTY
end

function IsClipboardEmblemGrouped( f715_arg0 )
	return Engine.IsClipboardEmblemGrouped()
end

function Emblem_HideClipboard( f716_arg0, f716_arg1 )
	if CoD.GetEditorProperties( f716_arg1, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT then
		return true
	elseif IsClipboardEmpty( f716_arg1 ) then
		return true
	else
		return false
	end
end

function Emblem_CanPastFromClipboard( f717_arg0, f717_arg1 )
	local f717_local0 = CoD.GetEditorProperties( f717_arg1, "editorMode" )
	local f717_local1 = IsGroupSlotAvailable( f717_arg1 )
	local f717_local2 = IsClipboardEmblemGrouped( f717_arg1 )
	if f717_local0 == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE then
		if not f717_local2 then
			return true
		elseif f717_local2 and f717_local1 then
			return true
		end
	end
	return false
end

function IsSelectedColorEmpty( f718_arg0, f718_arg1 )
	local f718_local0 = CoD.GetEditorProperties( f718_arg1, "colorNum" )
	local f718_local1 = CoD.GetEditorProperties( f718_arg1, "isColor0NoColor" )
	local f718_local2 = CoD.GetEditorProperties( f718_arg1, "isColor1NoColor" )
	if f718_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 and f718_local1 == 1 then
		return true
	elseif f718_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 and f718_local2 == 1 then
		return true
	else
		return false
	end
end

function Emblems_IsIconNew( f719_arg0, f719_arg1 )
	local f719_local0 = CoD.SafeGetModelValue( f719_arg0:getModel(), "iconID" )
	local f719_local1 = CoD.CraftUtility.GetDecalCategoryTypeByID( CoD.perController[f719_arg1].selectedDecalCategory )
	if f719_local0 and f719_local1 and f719_local1 == "BLACKMARKET" then
		return Engine.IsEmblemIconNew( f719_arg1, f719_local0 )
	else
		return false
	end
end

function Emblems_IsAnyEmblemNew( f720_arg0 )
	return CoD.CraftUtility.Emblems.IsAnyEmblemNew( f720_arg0 )
end

function Emblems_IsEmblemNew( f721_arg0, f721_arg1 )
	local f721_local0 = CoD.SafeGetModelValue( f721_arg0:getModel(), "emblemIndex" )
	if f721_local0 then
		if CoD.perController[f721_arg1].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
			f721_local0 = CoD.BlackMarketUtility.GetLootEmblemSortIndexFromEmblemId( f721_local0 )
		end
		return CoD.CraftUtility.Emblems.IsEmblemNew( f721_arg1, f721_local0, CoD.perController[f721_arg1].selectedEmblemTabStorageType )
	else
		return false
	end
end

function Emblems_IsMaterialNew( f722_arg0, f722_arg1 )
	local f722_local0 = CoD.SafeGetModelValue( f722_arg0:getModel(), "materialID" )
	local f722_local1 = CoD.CraftUtility.GetMaterialCategoryTypeByID( CoD.perController[f722_arg1].selectedMaterialCategory )
	if f722_local0 and f722_local1 and f722_local1 ~= "general" then
		return CoD.CraftUtility.Emblems.IsMaterialNew( f722_arg1, f722_local0 )
	else
		return false
	end
end

function CallingCards_IsEnabled( f723_arg0, f723_arg1 )
	if IsPlayerAGuest( f723_arg1 ) then
		return false
	else
		return true
	end
end

function CallingCards_IsGetPublicProfileComplete( f724_arg0, f724_arg1 )
	local f724_local0 = Engine.GetModel( Engine.GetModelForController( f724_arg1 ), "CallingCardsIdentity.GetPublicProfileComplete" )
	local f724_local1 = false
	if f724_local0 then
		f724_local1 = Engine.GetModelValue( f724_local0 )
	end
	return f724_local1
end

function CallingCards_IsNew( f725_arg0, f725_arg1 )
	local f725_local0 = CoD.SafeGetModelValue( f725_arg0:getModel(), "iconId" )
	if f725_local0 then
		return Engine.IsEmblemBackgroundNew( f725_arg1, f725_local0 )
	else
		return false
	end
end

function CallingCards_IsAnyNew( f726_arg0 )
	return Engine.IsAnyEmblemBackgroundNew( f726_arg0, BlackMarketHideMasterCallingCards() )
end

function IsViewingSideBetCallingCardSet( f727_arg0 )
	return CoD.perController[f727_arg0].BlackMarketUtility_CurrentCallingCardSetName == CoD.BlackMarketUtility.SideBetSetName
end

function CraftSlotsFullByStorageType( f728_arg0, f728_arg1 )
	if IsLive() and CoD.CraftUtility.GetTotalAllowedSlotsByFileType( f728_arg0, f728_arg1 ) <= CoD.CraftUtility.GetUsedSlotsByFileType( f728_arg0, f728_arg1 ) then
		return true
	else
		return false
	end
end

function IsPreBuiltEmblemTab( f729_arg0 )
	if CoD.perController[f729_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS or CoD.perController[f729_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
		return true
	else
		return false
	end
end

function IsEmblemEditor( f730_arg0 )
	return CoD.GetCustomization( f730_arg0, "type" ) == Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
end

function IsPaintshop( f731_arg0 )
	local f731_local0 = CoD.GetCustomization( f731_arg0, "type" )
	local f731_local1
	if f731_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT and f731_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP and f731_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT then
		f731_local1 = false
	else
		f731_local1 = true
	end
	return f731_local1
end

function IsMaxPrestigeLevel( f732_arg0 )
	return Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= CoD.PrestigeUtility.GetCurrentPLevel( f732_arg0 )
end

function IsMaxPrestigeLevelForMode( f733_arg0, f733_arg1 )
	return Engine.GetPrestigeCap( f733_arg1 ) <= CoD.PrestigeUtility.GetCurrentPLevel( f733_arg0, f733_arg1 )
end

function IsPrestigeLevelAtZero( f734_arg0 )
	return CoD.PrestigeUtility.GetCurrentPLevel( f734_arg0 ) == 0
end

function IsAtXPCap( f735_arg0 )
	local f735_local0 = Engine.GetPlayerStats( f735_arg0, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	return Engine.GetXPCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= f735_local0.PlayerStatsList.RANKXP.StatValue:get()
end

function IsPrestigeRewardSpent( f736_arg0, f736_arg1 )
	return Engine.IsPrestigeTokenSpentByType( f736_arg0, f736_arg1, CoD.PrestigeUtility.GetPrestigeGameMode() )
end

function IsInPermanentUnlockMenu( f737_arg0 )
	return CoD.PrestigeUtility.isInPermanentUnlockMenu
end

function IsInBubblegumSelectMenu( f738_arg0, f738_arg1 )
	return IsGlobalModelValueTrue( f738_arg0, f738_arg1, "inBubblegumBuffSelectMenu" )
end

function IsPermanentlyUnlocked( f739_arg0, f739_arg1 )
	local f739_local0 = nil
	local f739_local1 = f739_arg0.itemIndex
	local f739_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f739_local1 then
		f739_local0 = f739_arg0:getModel( f739_arg1, "itemIndex" )
		if f739_local0 then
			f739_local1 = Engine.GetModelValue( f739_local0 )
		end
	end
	if f739_local1 then
		if Engine.GetItemCost( f739_local1, f739_local2 ) == 0 then
			return true
		else
			return Engine.IsItemPermanentlyUnlocked( f739_arg1, f739_local1, f739_local2 )
		end
	else
		return false
	end
end

function HavePermanentUnlockTokens( f740_arg0 )
	return Engine.GetPermanentUnlockCount( f740_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() ) > 0
end

function PlayerGainedPrestigeMaster( f741_arg0, f741_arg1 )
	local f741_local0 = CoD.GetPlayerStats( f741_arg0, CoD.STATS_LOCATION_NORMAL, f741_arg1 )
	local f741_local1
	if Engine.GetXPCap( f741_arg1 ) > f741_local0.PlayerStatsList.RANKXP.StatValue:get() or f741_local0.PlayerStatsList.PLEVEL.StatValue:get() ~= Engine.GetPrestigeCap( f741_arg1 ) - 1 then
		f741_local1 = false
	else
		f741_local1 = true
	end
	return f741_local1
end

function IsGameModeParagonCapable( f742_arg0 )
	return LuaUtils.IsGameModeParagonCapable( f742_arg0 )
end

function IsInParagonCapableGameMode()
	return IsGameModeParagonCapable( Engine.CurrentSessionMode() )
end

function IsPrestigeMasterFromRankModel( f744_arg0, f744_arg1, f744_arg2 )
	local f744_local0 = f744_arg0:getModel()
	if f744_arg2 ~= "" and f744_local0 then
		f744_local0 = Engine.GetModel( f744_local0, f744_arg2 )
	end
	local f744_local1 = tonumber( f744_local0 and Engine.GetModelValue( f744_local0 ) )
	local f744_local2
	if f744_local1 == nil or f744_local1 <= CoD.MAX_RANK + 1 then
		f744_local2 = false
	else
		f744_local2 = true
	end
	return f744_local2
end

function CompetitiveSettingsEnabled( f745_arg0 )
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

function ArenaRankIncreased( f749_arg0 )
	local f749_local0 = Engine.GetPlaylistInfoByID( Engine.GetPlaylistID() )
	local f749_local1 = CoD.GetPlayerStats( f749_arg0 )
	return CoD.ArenaUtility.GetRank( f749_local1.arenaStats[f749_local0.playlist.arenaSlot].matchStartPoints:get() ) < CoD.ArenaUtility.GetRank( f749_local1.arenaStats[f749_local0.playlist.arenaSlot].points:get() )
end

function WonLastTeamBasedMatch( f750_arg0 )
	local f750_local0 = Engine.StorageGetBuffer( f750_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f750_local0 then
		return false
	else
		local f750_local1 = f750_local0.AfterActionReportStats
		local f750_local2 = f750_local1.alliesScore:get()
		local f750_local3 = f750_local1.axisScore:get()
		local f750_local4 = f750_local1.team:get()
		if f750_local4 ~= Enum.team_t.TEAM_ALLIES and f750_local4 ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif f750_local4 == Enum.team_t.TEAM_ALLIES then
			return f750_local3 < f750_local2
		else
			return f750_local2 < f750_local3
		end
	end
end

function LostLastTeamBasedMatch( f751_arg0 )
	local f751_local0 = Engine.StorageGetBuffer( f751_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f751_local0 then
		return false
	else
		local f751_local1 = f751_local0.AfterActionReportStats
		local f751_local2 = f751_local1.alliesScore:get()
		local f751_local3 = f751_local1.axisScore:get()
		local f751_local4 = f751_local1.team:get()
		if f751_local4 ~= Enum.team_t.TEAM_ALLIES and f751_local4 ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif f751_local4 == Enum.team_t.TEAM_ALLIES then
			return f751_local2 < f751_local3
		else
			return f751_local3 < f751_local2
		end
	end
end

function IsBetaSeason()
	local f752_local0 = Engine.GetCurrentArenaSeason()
	local f752_local1
	if f752_local0 < 0 or f752_local0 >= 2 then
		f752_local1 = false
	else
		f752_local1 = true
	end
	return f752_local1
end

function SelectedPlayerIsArenaMaster( f753_arg0, f753_arg1 )
	local f753_local0 = f753_arg0:getModel( f753_arg1, "arenaPoints" )
	if f753_local0 ~= nil then
		local f753_local1 = Engine.GetModelValue( f753_local0 )
		if f753_local1 ~= nil then
			return CoD.ArenaUtility.IsMaster( f753_local1 )
		end
	end
	return false
end

function ArenaChallengesEnabled()
	return Dvar.arena_enableArenaChallenges:get()
end

function IsParamModelEqualTo( f755_arg0, f755_arg1 )
	return f755_arg0 and Engine.GetModelValue( f755_arg0 ) == f755_arg1
end

function IsParamModelEqualToString( f756_arg0, f756_arg1 )
	return f756_arg0 and Engine.GetModelValue( f756_arg0 ) == f756_arg1
end

function IsModelParameterValueEnum( f757_arg0, f757_arg1 )
	return f757_arg0 and Engine.GetModelValue( f757_arg0 ) == f757_arg1
end

function IsModelValueNonEmptyString( f758_arg0, f758_arg1 )
	local f758_local0 = Engine.GetModel( Engine.GetModelForController( f758_arg0 ), f758_arg1 )
	local f758_local1 = f758_local0 and Engine.GetModelValue( f758_local0 )
	local f758_local2
	if f758_local1 == nil or f758_local1 == "" then
		f758_local2 = false
	else
		f758_local2 = true
	end
	return f758_local2
end

function IsModelValueTrue( f759_arg0, f759_arg1 )
	local f759_local0 = Engine.GetModel( Engine.GetModelForController( f759_arg0 ), f759_arg1 )
	local f759_local1 = f759_local0 and Engine.GetModelValue( f759_local0 )
	local f759_local2
	if f759_local1 == nil or f759_local1 ~= true then
		f759_local2 = false
	else
		f759_local2 = true
	end
	return f759_local2
end

function IsModelValueGreaterThan( f760_arg0, f760_arg1, f760_arg2 )
	local f760_local0 = Engine.GetModel( Engine.GetModelForController( f760_arg0 ), f760_arg1 )
	local f760_local1 = f760_local0 and Engine.GetModelValue( f760_local0 )
	local f760_local2
	if f760_local1 == nil or f760_arg2 >= f760_local1 then
		f760_local2 = false
	else
		f760_local2 = true
	end
	return f760_local2
end

function IsModelValueLessThan( f761_arg0, f761_arg1, f761_arg2 )
	local f761_local0 = Engine.GetModel( Engine.GetModelForController( f761_arg0 ), f761_arg1 )
	local f761_local1 = f761_local0 and Engine.GetModelValue( f761_local0 )
	local f761_local2
	if f761_local1 == nil or f761_local1 >= f761_arg2 then
		f761_local2 = false
	else
		f761_local2 = true
	end
	return f761_local2
end

function IsModelValueGreaterThanOrEqualTo( f762_arg0, f762_arg1, f762_arg2 )
	local f762_local0 = Engine.GetModel( Engine.GetModelForController( f762_arg0 ), f762_arg1 )
	local f762_local1 = f762_local0 and Engine.GetModelValue( f762_local0 )
	local f762_local2
	if f762_local1 == nil or f762_arg2 == nil or f762_arg2 > f762_local1 then
		f762_local2 = false
	else
		f762_local2 = true
	end
	return f762_local2
end

function IsModelValueLessThanOrEqualTo( f763_arg0, f763_arg1, f763_arg2 )
	local f763_local0 = Engine.GetModel( Engine.GetModelForController( f763_arg0 ), f763_arg1 )
	local f763_local1 = f763_local0 and Engine.GetModelValue( f763_local0 )
	local f763_local2
	if f763_local1 == nil or f763_local1 > f763_arg2 then
		f763_local2 = false
	else
		f763_local2 = true
	end
	return f763_local2
end

function IsModelValueEqualTo( f764_arg0, f764_arg1, f764_arg2 )
	local f764_local0 = Engine.GetModel( Engine.GetModelForController( f764_arg0 ), f764_arg1 )
	local f764_local1 = f764_local0 and Engine.GetModelValue( f764_local0 )
	local f764_local2
	if f764_local1 == nil or f764_local1 ~= f764_arg2 then
		f764_local2 = false
	else
		f764_local2 = true
	end
	return f764_local2
end

function IsModelValueEqualToEitherValue( f765_arg0, f765_arg1, f765_arg2, f765_arg3 )
	local f765_local0 = Engine.GetModel( Engine.GetModelForController( f765_arg0 ), f765_arg1 )
	local f765_local1 = f765_local0 and Engine.GetModelValue( f765_local0 )
	local f765_local2
	if f765_local1 == nil or f765_local1 ~= f765_arg2 and f765_local1 ~= f765_arg3 then
		f765_local2 = false
	else
		f765_local2 = true
	end
	return f765_local2
end

function IsModelValueEqualToEnum( f766_arg0, f766_arg1, f766_arg2 )
	local f766_local0 = Engine.GetModel( Engine.GetModelForController( f766_arg0 ), f766_arg1 )
	local f766_local1 = f766_local0 and Engine.GetModelValue( f766_local0 )
	local f766_local2
	if f766_local1 == nil or f766_local1 ~= f766_arg2 then
		f766_local2 = false
	else
		f766_local2 = true
	end
	return f766_local2
end

function IsModelValueEnumBitSet( f767_arg0, f767_arg1, f767_arg2 )
	local f767_local0 = Engine.GetModel( Engine.GetModelForController( f767_arg0 ), f767_arg1 )
	local f767_local1 = f767_local0 and Engine.GetModelValue( f767_local0 )
	local f767_local2
	if f767_local1 ~= nil then
		f767_local2 = CoD.BitUtility.IsBitSet( f767_local1, f767_arg2 )
	else
		f767_local2 = false
	end
	return f767_local2
end

function ModelValueStartsWith( f768_arg0, f768_arg1, f768_arg2 )
	local f768_local0 = Engine.GetModel( Engine.GetModelForController( f768_arg0 ), f768_arg1 )
	local f768_local1 = f768_local0 and Engine.GetModelValue( f768_local0 )
	local f768_local2
	if f768_local1 ~= nil then
		f768_local2 = LUI.startswith( f768_local1, f768_arg2 )
	else
		f768_local2 = false
	end
	return f768_local2
end

function ModelValueStartsWithAny( f769_arg0, f769_arg1, ... )
	local f769_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f769_arg0 ), f769_arg1 )
	if not f769_local0 then
		return false
	end
	for f769_local4, f769_local5 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		if LUI.startswith( f769_local0, f769_local5 ) then
			return true
		end
	end
	return false
end

function IsControllerModelValueEqualToSelfModelValue( f770_arg0, f770_arg1, f770_arg2, f770_arg3 )
	if not f770_arg0:getModel() then
		return false
	else
		local f770_local0 = Engine.GetModel( Engine.GetModelForController( f770_arg1 ), f770_arg2 )
		if not f770_local0 then
			return false
		else
			local f770_local1 = Engine.GetModel( f770_arg0:getModel(), f770_arg3 )
			if not f770_local1 then
				return false
			else
				return Engine.GetModelValue( f770_local0 ) == Engine.GetModelValue( f770_local1 )
			end
		end
	end
end

function IsControllerModelValueGreaterThanOrEqualToSelfModelValue( f771_arg0, f771_arg1, f771_arg2, f771_arg3 )
	if not f771_arg0:getModel() then
		return false
	else
		local f771_local0 = Engine.GetModel( Engine.GetModelForController( f771_arg1 ), f771_arg2 )
		if not f771_local0 then
			return false
		else
			local f771_local1 = Engine.GetModel( f771_arg0:getModel(), f771_arg3 )
			if not f771_local1 then
				return false
			else
				return Engine.GetModelValue( f771_local1 ) <= Engine.GetModelValue( f771_local0 )
			end
		end
	end
end

function IsControllerModelValueDefaultID64Value( f772_arg0, f772_arg1, f772_arg2 )
	local f772_local0 = Engine.GetModelForController( f772_arg1 )
	if f772_arg2 ~= "" and f772_local0 then
		f772_local0 = Engine.GetModel( f772_local0, f772_arg2 )
	end
	local f772_local1 = Engine.GetModelValue( f772_local0 )
	local f772_local2
	if f772_local1 == nil or f772_local1 ~= Engine.DefaultID64Value() then
		f772_local2 = false
	else
		f772_local2 = true
	end
	return f772_local2
end

function IsGlobalModelValueEqualToSelfModelValue( f773_arg0, f773_arg1, f773_arg2, f773_arg3 )
	if not f773_arg0:getModel() then
		return false
	else
		local f773_local0 = Engine.GetModel( Engine.GetGlobalModel(), f773_arg2 )
		if not f773_local0 then
			return false
		else
			local f773_local1 = Engine.GetModel( f773_arg0:getModel(), f773_arg3 )
			if not f773_local1 then
				return false
			else
				return Engine.GetModelValue( f773_local0 ) == Engine.GetModelValue( f773_local1 )
			end
		end
	end
end

function IsSelfModelValueNil( f774_arg0, f774_arg1, f774_arg2 )
	local f774_local0 = f774_arg0:getModel()
	if f774_arg2 ~= "" and f774_local0 then
		f774_local0 = Engine.GetModel( f774_local0, f774_arg2 )
	end
	return f774_local0 == nil
end

function IsSelfModelValueNilOrZero( f775_arg0, f775_arg1, f775_arg2 )
	local f775_local0 = f775_arg0:getModel()
	if f775_arg2 ~= "" and f775_local0 then
		f775_local0 = Engine.GetModel( f775_local0, f775_arg2 )
	end
	local f775_local1
	if f775_local0 ~= nil and (f775_local0 and Engine.GetModelValue( f775_local0 )) ~= 0 then
		f775_local1 = false
	else
		f775_local1 = true
	end
	return f775_local1
end

function IsSelfModelValueNonEmptyString( f776_arg0, f776_arg1, f776_arg2 )
	local f776_local0 = f776_arg0:getModel()
	if f776_arg2 ~= "" and f776_local0 then
		f776_local0 = Engine.GetModel( f776_local0, f776_arg2 )
	end
	local f776_local1 = f776_local0 and Engine.GetModelValue( f776_local0 )
	local f776_local2
	if f776_local1 == nil or f776_local1 == "" then
		f776_local2 = false
	else
		f776_local2 = true
	end
	return f776_local2
end

function IsSelfModelValueTrue( f777_arg0, f777_arg1, f777_arg2 )
	local f777_local0 = f777_arg0:getModel()
	if f777_arg2 ~= "" and f777_local0 then
		f777_local0 = Engine.GetModel( f777_local0, f777_arg2 )
	end
	local f777_local1 = f777_local0 and Engine.GetModelValue( f777_local0 )
	local f777_local2
	if f777_local1 == nil or f777_local1 ~= true then
		f777_local2 = false
	else
		f777_local2 = true
	end
	return f777_local2
end

function IsSelfEnumModelValueTrue( f778_arg0, f778_arg1, f778_arg2 )
	local f778_local0 = f778_arg0:getModel()
	if f778_arg2 ~= "" and f778_local0 then
		f778_local0 = Engine.GetModel( f778_local0, f778_arg2 )
	end
	local f778_local1 = f778_local0 and Engine.GetModelValue( f778_local0 )
	local f778_local2
	if f778_local1 == nil or f778_local1 ~= true then
		f778_local2 = false
	else
		f778_local2 = true
	end
	return f778_local2
end

function IsSelfModelValueGreaterThan( f779_arg0, f779_arg1, f779_arg2, f779_arg3 )
	local f779_local0 = f779_arg0:getModel()
	if f779_arg2 ~= "" and f779_local0 then
		f779_local0 = Engine.GetModel( f779_local0, f779_arg2 )
	end
	local f779_local1 = f779_local0 and Engine.GetModelValue( f779_local0 )
	local f779_local2
	if f779_local1 == nil or f779_arg3 >= f779_local1 then
		f779_local2 = false
	else
		f779_local2 = true
	end
	return f779_local2
end

function IsSelfModelValueLessThan( f780_arg0, f780_arg1, f780_arg2, f780_arg3 )
	local f780_local0 = f780_arg0:getModel()
	if f780_arg2 ~= "" and f780_local0 then
		f780_local0 = Engine.GetModel( f780_local0, f780_arg2 )
	end
	local f780_local1 = f780_local0 and Engine.GetModelValue( f780_local0 )
	local f780_local2
	if f780_local1 == nil or f780_local1 >= f780_arg3 then
		f780_local2 = false
	else
		f780_local2 = true
	end
	return f780_local2
end

function IsSelfModelValueGreaterThanOrEqualTo( f781_arg0, f781_arg1, f781_arg2, f781_arg3 )
	local f781_local0 = f781_arg0:getModel()
	if f781_arg2 ~= "" and f781_local0 then
		f781_local0 = Engine.GetModel( f781_local0, f781_arg2 )
	end
	local f781_local1 = f781_local0 and Engine.GetModelValue( f781_local0 )
	local f781_local2
	if f781_local1 == nil or f781_arg3 > f781_local1 then
		f781_local2 = false
	else
		f781_local2 = true
	end
	return f781_local2
end

function IsSelfModelValueLessThanOrEqualTo( f782_arg0, f782_arg1, f782_arg2, f782_arg3 )
	local f782_local0 = f782_arg0:getModel()
	if f782_arg2 ~= "" and f782_local0 then
		f782_local0 = Engine.GetModel( f782_local0, f782_arg2 )
	end
	local f782_local1 = f782_local0 and Engine.GetModelValue( f782_local0 )
	local f782_local2
	if f782_local1 == nil or f782_local1 > f782_arg3 then
		f782_local2 = false
	else
		f782_local2 = true
	end
	return f782_local2
end

function IsSelfModelValueEqualTo( f783_arg0, f783_arg1, f783_arg2, f783_arg3 )
	local f783_local0 = f783_arg0:getModel()
	if f783_arg2 ~= "" and f783_local0 then
		f783_local0 = Engine.GetModel( f783_local0, f783_arg2 )
	end
	local f783_local1 = f783_local0 and Engine.GetModelValue( f783_local0 )
	local f783_local2
	if f783_local1 == nil or f783_local1 ~= f783_arg3 then
		f783_local2 = false
	else
		f783_local2 = true
	end
	return f783_local2
end

function IsSelfModelValueEqualToEitherValue( f784_arg0, f784_arg1, f784_arg2, f784_arg3, f784_arg4 )
	local f784_local0 = f784_arg0:getModel()
	if f784_arg2 ~= "" and f784_local0 then
		f784_local0 = Engine.GetModel( f784_local0, f784_arg2 )
	end
	local f784_local1 = f784_local0 and Engine.GetModelValue( f784_local0 )
	local f784_local2
	if f784_local1 == nil or f784_local1 ~= f784_arg3 and f784_local1 ~= f784_arg4 then
		f784_local2 = false
	else
		f784_local2 = true
	end
	return f784_local2
end

function IsSelfModelValueEqualToAnyValue( f785_arg0, f785_arg1, f785_arg2, f785_arg3, f785_arg4, f785_arg5 )
	local f785_local0 = f785_arg0:getModel()
	if f785_arg2 ~= "" and f785_local0 then
		f785_local0 = Engine.GetModel( f785_local0, f785_arg2 )
	end
	local f785_local1 = f785_local0 and Engine.GetModelValue( f785_local0 )
	local f785_local2
	if f785_local1 == nil or f785_local1 ~= f785_arg3 and f785_local1 ~= f785_arg4 and f785_local1 ~= f785_arg5 then
		f785_local2 = false
	else
		f785_local2 = true
	end
	return f785_local2
end

function IsSelfModelValueEqualToAnyValue5( f786_arg0, f786_arg1, f786_arg2, f786_arg3, f786_arg4, f786_arg5, f786_arg6, f786_arg7 )
	local f786_local0 = f786_arg0:getModel()
	if f786_arg2 ~= "" and f786_local0 then
		f786_local0 = Engine.GetModel( f786_local0, f786_arg2 )
	end
	local f786_local1 = f786_local0 and Engine.GetModelValue( f786_local0 )
	local f786_local2
	if f786_local1 == nil or f786_local1 ~= f786_arg3 and f786_local1 ~= f786_arg4 and f786_local1 ~= f786_arg5 and f786_local1 ~= f786_arg6 and f786_local1 ~= f786_arg7 then
		f786_local2 = false
	else
		f786_local2 = true
	end
	return f786_local2
end

function IsSelfModelValueEqualToEnum( f787_arg0, f787_arg1, f787_arg2, f787_arg3 )
	local f787_local0 = f787_arg0:getModel()
	if f787_arg2 ~= "" and f787_local0 then
		f787_local0 = Engine.GetModel( f787_local0, f787_arg2 )
	end
	local f787_local1 = f787_local0 and Engine.GetModelValue( f787_local0 )
	local f787_local2
	if f787_local1 == nil or f787_local1 ~= f787_arg3 then
		f787_local2 = false
	else
		f787_local2 = true
	end
	return f787_local2
end

function IsSelfModelValueEqualToEnumOrSelfModelNil( f788_arg0, f788_arg1, f788_arg2, f788_arg3 )
	if f788_arg0:getModel() == nil then
		return true
	else
		return IsSelfModelValueEqualToEnum( f788_arg0, f788_arg1, f788_arg2, f788_arg3 )
	end
end

function IsSelfModelValueEqualToSelfTeam( f789_arg0, f789_arg1, f789_arg2 )
	local f789_local0 = CoD.GetTeamID( f789_arg1 )
	if f789_local0 == Enum.team_t.TEAM_SPECTATOR then
		if CoD.ShoutcasterProfileVarBool( f789_arg1, "shoutcaster_flip_scorepanel" ) then
			f789_local0 = Enum.team_t.TEAM_AXIS
		else
			f789_local0 = Enum.team_t.TEAM_ALLIES
		end
	end
	return IsSelfModelValueEqualTo( f789_arg0, f789_arg1, f789_arg2, f789_local0 )
end

function IsGlobalModelValueNonEmptyString( f790_arg0, f790_arg1, f790_arg2 )
	local f790_local0 = Engine.GetModel( Engine.GetGlobalModel(), f790_arg2 )
	local f790_local1 = f790_local0 and Engine.GetModelValue( f790_local0 )
	local f790_local2
	if f790_local1 == nil or f790_local1 == "" then
		f790_local2 = false
	else
		f790_local2 = true
	end
	return f790_local2
end

function IsGlobalModelValueTrue( f791_arg0, f791_arg1, f791_arg2 )
	local f791_local0 = Engine.GetModel( Engine.GetGlobalModel(), f791_arg2 )
	local f791_local1 = f791_local0 and Engine.GetModelValue( f791_local0 )
	local f791_local2
	if f791_local1 == nil or f791_local1 ~= true then
		f791_local2 = false
	else
		f791_local2 = true
	end
	return f791_local2
end

function IsGlobalModelValueEqualTo( f792_arg0, f792_arg1, f792_arg2, f792_arg3 )
	local f792_local0 = Engine.GetModel( Engine.GetGlobalModel(), f792_arg2 )
	local f792_local1 = f792_local0 and Engine.GetModelValue( f792_local0 )
	local f792_local2
	if f792_local1 == nil or f792_local1 ~= f792_arg3 then
		f792_local2 = false
	else
		f792_local2 = true
	end
	return f792_local2
end

function IsGlobalModelValueEqualToEnum( f793_arg0, f793_arg1, f793_arg2, f793_arg3 )
	local f793_local0 = Engine.GetModel( Engine.GetGlobalModel(), f793_arg2 )
	local f793_local1 = f793_local0 and Engine.GetModelValue( f793_local0 )
	local f793_local2
	if f793_local1 == nil or f793_local1 ~= f793_arg3 then
		f793_local2 = false
	else
		f793_local2 = true
	end
	return f793_local2
end

function IsGlobalModelValueGreaterThan( f794_arg0, f794_arg1, f794_arg2 )
	local f794_local0 = Engine.GetModel( Engine.GetGlobalModel(), f794_arg1 )
	local f794_local1 = f794_local0 and Engine.GetModelValue( f794_local0 )
	local f794_local2
	if f794_local1 == nil or f794_arg2 >= tonumber( f794_local1 ) then
		f794_local2 = false
	else
		f794_local2 = true
	end
	return f794_local2
end

function IsGlobalModelValueLessThan( f795_arg0, f795_arg1, f795_arg2 )
	local f795_local0 = Engine.GetModel( Engine.GetGlobalModel(), f795_arg1 )
	local f795_local1 = f795_local0 and Engine.GetModelValue( f795_local0 )
	local f795_local2
	if f795_local1 == nil or tonumber( f795_local1 ) >= f795_arg2 then
		f795_local2 = false
	else
		f795_local2 = true
	end
	return f795_local2
end

function IsSelfModelValueEnumBitSet( f796_arg0, f796_arg1, f796_arg2, f796_arg3 )
	local f796_local0 = f796_arg0:getModel()
	if f796_arg2 ~= "" and f796_local0 then
		f796_local0 = Engine.GetModel( f796_local0, f796_arg2 )
	end
	local f796_local1 = f796_local0 and Engine.GetModelValue( f796_local0 )
	local f796_local2
	if f796_local1 ~= nil then
		f796_local2 = CoD.BitUtility.IsBitSet( f796_local1, f796_arg3 )
	else
		f796_local2 = false
	end
	return f796_local2
end

function IsSelfModelValueMyXuid( f797_arg0, f797_arg1, f797_arg2 )
	local f797_local0 = f797_arg0:getModel()
	if f797_local0 then
		f797_local0 = Engine.GetModel( f797_local0, f797_arg2 )
	end
	local f797_local1 = f797_local0 and Engine.GetModelValue( f797_local0 )
	local f797_local2
	if f797_local1 == nil or f797_local1 ~= Engine.GetXUID64( f797_arg1 ) then
		f797_local2 = false
	else
		f797_local2 = true
	end
	return f797_local2
end

function IsSelfModelValueMyXuidOrAnyLocalPlayerOnGameOver( f798_arg0, f798_arg1, f798_arg2 )
	local f798_local0 = CoD.SafeGetModelValue( f798_arg0:getModel(), f798_arg2 )
	local f798_local1 = f798_arg1
	local f798_local2 = f798_arg1
	if IsInGame() and Engine.IsVisibilityBitSet( f798_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		f798_local1 = 0
		f798_local2 = Engine.GetMaxControllerCount() - 1
	end
	for f798_local3 = f798_local1, f798_local2, 1 do
		if Engine.IsControllerBeingUsed( f798_local3 ) and f798_local0 == Engine.GetXUID64( f798_local3 ) then
			return true
		end
	end
	return false
end

function IsDpadButton( f799_arg0 )
	local f799_local0 = f799_arg0 and Engine.GetModelValue( f799_arg0 )
	local f799_local1
	if f799_local0 ~= nil then
		f799_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f799_local0, Enum.LUIButtonFlags.FLAG_DPAD )
	else
		f799_local1 = true
	end
	return f799_local1
end

function IsRepeatButtonPress( f800_arg0 )
	local f800_local0 = f800_arg0 and Engine.GetModelValue( f800_arg0 )
	local f800_local1
	if f800_local0 ~= nil then
		f800_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f800_local0, Enum.LUIButtonFlags.FLAG_ISREPEAT )
	else
		f800_local1 = false
	end
	return f800_local1
end

function IsPartyLeaderStatusVisible()
	local f801_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f801_local0 then
		local f801_local1 = LobbyData:UITargetFromId( f801_local0 )
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and f801_local1.id == LobbyData.UITargets.UI_MODESELECT.id then
			return false
		elseif f801_local1.isAdvertised then
			return false
		else
			return true
		end
	else
		return false
	end
end

function ShowClientInRedForMissingDLC( f802_arg0, f802_arg1 )
	if not IsLobbyHost() then
		return false
	end
	local f802_local0 = CoD.SafeGetModelValue( f802_arg0:getModel(), "dlcBits" )
	if f802_local0 then
		if IsCustomLobby() then
			local f802_local1 = Engine.GetDLCBitForMapName( CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
			local f802_local2
			if f802_local1 then
				f802_local2 = not CoD.BitUtility.IsBitwiseAndNonZero( f802_local0, f802_local1 )
			else
				f802_local2 = true
			end
			return f802_local2
		elseif CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() and IsLobbyHost() then
			return CoD.IsClientMissingDLC( CoD.GetKnownDLCBits() & Engine.GetDLCBits(), f802_local0 )
		end
	end
	return false
end

function ShowMissingMapsListInLobbySlide( f803_arg0, f803_arg1 )
	local f803_local0 = CoD.SafeGetModelValue( f803_arg0:getModel(), "dlcBits" )
	if f803_local0 then
		if IsCustomLobby() then
			local f803_local1 = Engine.GetDLCBitForMapName( CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
			local f803_local2
			if f803_local1 then
				f803_local2 = not CoD.BitUtility.IsBitwiseAndNonZero( f803_local0, f803_local1 )
			else
				f803_local2 = true
			end
			return f803_local2
		elseif CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() then
			local f803_local3 = CoD.GetKnownDLCBits() & Engine.GetDLCBits()
			return f803_local3 ~= f803_local3 & f803_local0
		end
	end
	return false
end

function IsLobbyStatusVisible()
	local f804_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f804_local0 then
		local f804_local1 = LobbyData:UITargetFromId( f804_local0 )
		if f804_local1.isAdvertised then
			return true
		end
	end
	return false
end

function IsPartyPrivacyVisible()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		local f805_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
		if f805_local0 then
			local f805_local1 = LobbyData:UITargetFromId( f805_local0 )
			if f805_local1.isAdvertised == true then
				return false
			else
				return true
			end
		else
			return false
		end
	end
end

function IsSelfModelRankValueGreaterThan( f806_arg0, f806_arg1, f806_arg2 )
	local f806_local0 = f806_arg0:getModel()
	if f806_local0 then
		f806_local0 = Engine.GetModel( f806_local0, "rank" )
	end
	local f806_local1 = f806_local0 and Engine.GetModelValue( f806_local0 )
	local f806_local2
	if tonumber( f806_local1 ) == nil or f806_arg2 >= tonumber( f806_local1 ) then
		f806_local2 = false
	else
		f806_local2 = true
	end
	return f806_local2
end

function HasNumHessActive( f807_arg0, f807_arg1 )
	local f807_local0 = 0
	local f807_local1 = Engine.GetModel( Engine.GetModelForController( f807_arg0 ), "hudItems.hess1.type" )
	if f807_local1 ~= nil and Engine.GetModelValue( f807_local1 ) ~= 0 then
		f807_local0 = 1
	end
	local f807_local2 = Engine.GetModel( Engine.GetModelForController( f807_arg0 ), "hudItems.hess2.type" )
	if f807_local2 ~= nil and Engine.GetModelValue( f807_local2 ) ~= 0 then
		f807_local0 = f807_local0 + 1
	end
	return f807_local0 == f807_arg1
end

function CanUseSharedLoadouts( f808_arg0 )
	if not CoD.isCampaign then
		return false
	end
	local f808_local0 = Dvar.lobby_enableLoadoutDataStreamingInGame:get()
	local f808_local1 = 1
	local f808_local2 = Engine.GetModel( Engine.GetModelForController( f808_arg0 ), "ChooseClassCPClientMenu" )
	if f808_local2 then
		f808_local1 = Engine.GetModelValue( Engine.GetModel( f808_local2, "numActiveClients" ) )
	end
	local f808_local3
	if f808_local0 ~= true or f808_local1 <= 1 then
		f808_local3 = false
	else
		f808_local3 = true
	end
	return f808_local3
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
	local f812_local0 = Engine.LobbyGetDemoInformation()
	if f812_local0 and f812_local0.fileID ~= Engine.DefaultID64Value() then
		return true
	else
		return false
	end
end

function IsStartFilmButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not IsFilmReadyForPlayback() then
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
	elseif not IsFilmReadyForPlayback() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		local f814_local0 = Engine.LobbyGetDemoInformation()
		if not f814_local0.fileCategory or f814_local0.fileCategory ~= "film" and f814_local0.fileCategory ~= "recentgames" then
			return true
		else
			return false
		end
	end
end

function IsShoutcastFilmButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not IsFilmReadyForPlayback() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		local f815_local0 = Engine.LobbyGetDemoInformation()
		if not f815_local0.fileCategory or f815_local0.fileCategory ~= "film" and f815_local0.fileCategory ~= "recentgames" then
			return true
		else
			return false
		end
	end
end

function IsUploadClipButtonDisabled()
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

function IsDemoCreatingHighlightReel()
	local f822_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCreatingHighlightReel" )
	if f822_local0 then
		return Engine.GetModelValue( f822_local0 ) == true
	else
		return false
	end
end

function IsDemoCapturingScreenshot()
	local f823_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCapturingScreenshot" )
	if f823_local0 then
		return Engine.GetModelValue( f823_local0 ) == true
	else
		return false
	end
end

function IsDemoRestrictedBasicMode()
	return CoD.DemoUtility.IsRestrictedBasicMode()
end

function IsDemoContextBasicMode()
	return GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC
end

function IsDemoContextPlaybackMode()
	return GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK
end

function IsDemoContextDirectorMode()
	return GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_DIRECTOR
end

function IsDemoContextObjectLinkMode()
	return GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_OBJECT_LINK
end

function IsDemoContextLighterMode()
	return GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_LIGHTER
end

function IsDemoContextHighlightReelMode()
	return GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_HIGHLIGHT_REEL
end

function IsDemoContextBasicOrHighlightReelMode()
	local f831_local0 = IsDemoContextBasicMode()
	if not f831_local0 then
		f831_local0 = IsDemoContextHighlightReelMode()
	end
	return f831_local0
end

function ClipsAvailable( f832_arg0 )
	local f832_local0 = Engine.FileshareGetQuota( f832_arg0, "clip_private" )
	return f832_local0.categorySlotsAvailable > 0
end

function ShowOutOfClipsWarning( f833_arg0 )
	local f833_local0 = Dvar.tu9_noClipsWarning:exists()
	if f833_local0 then
		f833_local0 = Engine.DvarBool( nil, "tu9_noClipsWarning" )
		if f833_local0 then
			f833_local0 = not ClipsAvailable( f833_arg0 )
		end
	end
	return f833_local0
end

function ShouldAddDollyCameraMarker( f834_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif Engine.ProfileBool( f834_arg0, "demo_autoDollyRecord" ) then
		return false
	elseif IsGlobalModelValueGreaterThan( f834_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldStartAutoDollyCamera( f835_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not Engine.ProfileBool( f835_arg0, "demo_autoDollyRecord" ) then
		return false
	elseif IsGlobalModelValueGreaterThan( f835_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f835_arg0, "demo.isRecordingDollyCameraPath" ) then
		return false
	else
		return true
	end
end

function ShouldStopAutoDollyCamera( f836_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not Engine.ProfileBool( f836_arg0, "demo_autoDollyRecord" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f836_arg0, "demo.isRecordingDollyCameraPath" ) then
		return false
	else
		return true
	end
end

function ShouldEditDollyCameraMarker( f837_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif IsGlobalModelValueTrue( nil, f837_arg0, "demo.isRecordingDollyCameraPath" ) then
		return false
	elseif not IsGlobalModelValueGreaterThan( f837_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f837_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingDollyCameraMarker( f838_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f838_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f838_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningDollyCameraMarker( f839_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f839_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f839_arg0, "demo.isRepositioningDollyCamMarker" ) then
		return false
	else
		return true
	end
end

function IsFreeCameraLockedOnEntity( f840_arg0 )
	if not IsGlobalModelValueTrue( nil, f840_arg0, "demo.isFreeCameraLockedOnEntity" ) then
		return false
	else
		return true
	end
end

function CanFreeCameraLockOnEntity( f841_arg0 )
	if not IsGlobalModelValueTrue( nil, f841_arg0, "demo.isFreeCameraEntityLockOnAllowed" ) then
		return false
	elseif not IsGlobalModelValueGreaterThan( f841_arg0, "demo.highlightedFreeCameraLockOnEntity", 0 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f841_arg0, "demo.isFreeCameraLockedOnEntityActive" ) then
		return false
	else
		return true
	end
end

function ShouldAddLightmanMarker( f842_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif IsGlobalModelValueGreaterThan( f842_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldEditLightmanMarker( f843_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f843_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f843_arg0, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingLightmanMarker( f844_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f844_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f844_arg0, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningLightmanMarker( f845_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f845_arg0, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f845_arg0, "demo.isRepositioningLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsInLightmanColorPicker( f846_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f846_arg0, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f846_arg0, "demo.showLightmanColorPicker" ) then
		return false
	else
		return true
	end
end

function ReachedLowestLightmanFloatParamValue( f847_arg0, f847_arg1 )
	if not f847_arg0.btnId then
		return true
	end
	local f847_local0 = nil
	if f847_arg0.btnId == "lightmanlightintensity" then
		f847_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f847_arg0.btnId == "lightmanlightrange" then
		f847_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f847_local0 then
		return true
	elseif Engine.GetModelValue( f847_local0 ) < 0.19 then
		return true
	end
	return false
end

function ReachedHighestLightmanFloatParamValue( f848_arg0, f848_arg1 )
	if not f848_arg0.btnId then
		return true
	end
	local f848_local0 = nil
	if f848_arg0.btnId == "lightmanlightintensity" then
		f848_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f848_arg0.btnId == "lightmanlightrange" then
		f848_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f848_local0 then
		return true
	elseif Engine.GetModelValue( f848_local0 ) > 9.91 then
		return true
	end
	return false
end

function IsSegmentInSelectedState( f849_arg0, f849_arg1 )
	local f849_local0 = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
	if f849_local0 and f849_local0 == f849_arg0:getModel() then
		local f849_local1 = Engine.GetModel( f849_local0, "selected" )
		if f849_local1 then
			return Engine.GetModelValue( f849_local1 )
		end
	end
	return false
end

function IsTimelineEditorInMoveState( f850_arg0 )
	return CoD.DemoUtility.Timeline_GetSelectedSegmentModel() ~= nil
end

function SegmentCountGreaterThan( f851_arg0, f851_arg1 )
	return f851_arg1 < Engine.GetDemoSegmentCount()
end

function CanChangeSegmentTransition( f852_arg0, f852_arg1 )
	local f852_local0 = Engine.GetDemoSegmentCount()
	local f852_local1 = Engine.GetModel( f852_arg0:getModel(), "segmentNumber" )
	if f852_local1 then
		return Engine.GetModelValue( f852_local1 ) < f852_local0
	else
		return false
	end
end

function IsSegmentTransition( f853_arg0, f853_arg1, f853_arg2 )
	local f853_local0 = Engine.GetModel( f853_arg0:getModel(), "segmentNumber" )
	if f853_local0 then
		return tonumber( Engine.GetDemoSegmentInformation( Engine.GetModelValue( f853_local0 ) - 1, "transitionValue" ) ) == f853_arg2
	else
		return false
	end
end

function HideVehicleReticle( f854_arg0, f854_arg1, f854_arg2 )
	local f854_local0 = nil
	if f854_arg2.modelName == "vehicleType" then
		f854_local0 = f854_arg2.modelValue
	end
	if not f854_local0 then
		local f854_local1 = f854_arg0:getModel( f854_arg1, "vehicleType" )
		if f854_local1 then
			f854_local0 = Engine.GetModelValue( f854_local1 )
		end
	end
	return f854_local0 == "spawner_enemy_54i_vehicle_raps_suicide_player"
end

function VehicleHasEnemyLock( f855_arg0, f855_arg1 )
	local f855_local0 = IsSelfEnumModelValueTrue( f855_arg0, f855_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP )
	if not f855_local0 then
		f855_local0 = IsSelfEnumModelValueTrue( f855_arg0, f855_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN )
		if not f855_local0 then
			f855_local0 = IsSelfEnumModelValueTrue( f855_arg0, f855_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT )
			if not f855_local0 then
				f855_local0 = IsSelfEnumModelValueTrue( f855_arg0, f855_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT )
			end
		end
	end
	return f855_local0
end

function IsVehicleOfType( f856_arg0, ... )
	local f856_local0 = {
		n = select( "#", ... ),
		...
	}
	local f856_local1 = Engine.GetModel( Engine.GetModelForController( f856_arg0 ), "vehicle.vehicleType" )
	if f856_local1 then
		local f856_local2 = Engine.GetModelValue( f856_local1 )
		if f856_local2 then
			for f856_local6, f856_local7 in ipairs( f856_local0 ) do
				if string.find( f856_local2, "_" .. f856_local7 ) then
					return true
				end
			end
		end
	end
	return false
end

function IsSelfPlayerName( f857_arg0, f857_arg1 )
	local f857_local0 = f857_arg0:getModel( f857_arg1, "isSelfPlayerName" )
	local f857_local1 = false
	if f857_local0 then
		f857_local1 = Engine.GetModelValue( f857_local0 )
	end
	return f857_local1
end

function ShouldDisplayFactionIconAtPrematchCountdown( f858_arg0 )
	if not CoDShared.IsGametypeTeamBased() then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModel( Engine.GetModelForController( f858_arg0 ), "factions" ), "playerFactionDisplayName" ) ~= nil
	end
end

function MapVoteInState( f859_arg0 )
	local f859_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if f859_local0 == nil then
		return false
	end
	local f859_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f859_local1 then
		local f859_local2 = LobbyData:UITargetFromId( f859_local1 )
		if f859_local2.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
			return false
		end
	end
	return tonumber( f859_arg0 ) == Engine.GetModelValue( f859_local0 )
end

function MapVotePreviousSelectable()
	if not MapVoteInState( "1" ) then
		return false
	end
	local f860_local0 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f860_local0 = Enum.LobbyModule.LOBBY_MODULE_HOST
	end
	if Engine.GetPlaylistPrevCount( f860_local0 ) >= Dvar.lobbyMapVotePrevMapPlayCount:get() then
		return false
	end
	return true
end

function MapVoteTimerActive()
	local f861_local0 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f861_local0 == nil then
		return false
	end
	local f861_local1 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f861_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.TESTING then
		return false
	end
	local f861_local2 = Engine.GetModelValue( f861_local0 )
	local f861_local3
	if f861_local2 == nil or f861_local2 == 0 then
		f861_local3 = false
	else
		f861_local3 = true
	end
	return f861_local3
end

function IsScorestreakEquipped( f862_arg0, f862_arg1, f862_arg2 )
	local f862_local0 = f862_arg1:getModel( f862_arg2, "itemIndex" )
	if f862_local0 then
		local f862_local1 = Engine.GetModelValue( f862_local0 )
		if f862_local1 ~= CoD.CACUtility.EmptyItemIndex then
			return CoD.CACUtility.GetAttachedItemSlot( f862_arg0:getModel(), f862_local1, CoD.CACUtility.KillstreakNameList ) ~= nil
		end
	end
	return false
end

function IsValidScorestreakIndex( f863_arg0, f863_arg1 )
	local f863_local0 = f863_arg0:getModel( f863_arg1, "itemIndex" )
	if f863_local0 then
		return Engine.GetModelValue( f863_local0 ) ~= CoD.CACUtility.EmptyItemIndex
	else
		return false
	end
end

function IsGamepad( f864_arg0 )
	return CoD.useController and Engine.LastInput_Gamepad( f864_arg0 )
end

function IsMouse( f865_arg0 )
	return CoD.useMouse and Engine.LastInput_Mouse( f865_arg0 )
end

function IsDurangoGamepad( f866_arg0 )
	local f866_local0 = IsDurango()
	if not f866_local0 then
		f866_local0 = IsPC()
		if f866_local0 then
			f866_local0 = Engine.GamepadType( f866_arg0 ) == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO
		end
	end
	return f866_local0
end

function IsOrbisGamepad( f867_arg0 )
	local f867_local0
	if not IsOrbis() or Engine.LastInput_Vita( f867_arg0 ) then
		f867_local0 = IsPC()
		if f867_local0 then
			if Engine.GamepadType( f867_arg0 ) ~= Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
				f867_local0 = false
			else
				f867_local0 = true
			end
		end
	else
		f867_local0 = true
	end
	return f867_local0
end

function IsVitaGamepad( f868_arg0 )
	return IsOrbis() and Engine.LastInput_Vita( f868_arg0 )
end

function AutomaticallyOpenAAR( f869_arg0 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) > 1 or Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
		return false
	else
		local f869_local0 = CoD.GetPlayerStats( f869_arg0 )
		local f869_local1 = f869_local0.AfterActionReportStats.lobbyPopup:get()
		if f869_local1 == "summary" or f869_local1 == "promotion" then
			return true
		else
			
		end
	end
end

function WasCampaignSoloGame( f870_arg0 )
	return Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES ) == 1
end

function IsAARValid( f871_arg0 )
	if CoD.AARUtility.UseTestData() then
		return true
	end
	local f871_local0 = CoD.GetPlayerStats( f871_arg0, CoD.STATS_LOCATION_STABLE )
	if not f871_local0 or not f871_local0.PlayerStatsList or not f871_local0.PlayerStatsList.RANK or not f871_local0.PlayerStatsList.RANK.StatValue or not f871_local0.PlayerStatsList.RANK.StatValue:get() then
		return false
	end
	local f871_local1 = CoD.GetPlayerStats( f871_arg0 )
	if Engine.IsMultiplayerGame() and not IsArenaMode() then
		local f871_local2 = Engine.GetCurrentGameType()
		if f871_local2 == "" or not f871_local1.PlayerStatsByGameType or not f871_local1.PlayerStatsByGameType[f871_local2] then
			return false
		end
	end
	if f871_local1.AfterActionReportStats.lobbyPopup:get() == "summary" then
		return true
	end
	local f871_local2 = Engine.GetModel( Engine.GetModelForController( f871_arg0 ), "aarType" )
	if f871_local2 then
		local f871_local3 = Engine.GetModelValue( f871_local2 )
		local f871_local4
		if (not IsLAN() or f871_local3 ~= "lan") and (IsLAN() or f871_local3 ~= "custom" and f871_local3 ~= "public") then
			f871_local4 = false
		else
			f871_local4 = true
		end
		return f871_local4
	end
end

function CanShowAAR( f872_arg0 )
	local f872_local0 = Engine.IsMultiplayerGame()
	local f872_local1 = Engine.IsZombiesGame()
	if f872_local0 and CoD.mpFreshStartPerformed then
		return false
	elseif f872_local1 and CoD.zmFreshStartPerformed then
		return false
	elseif IsFreeRunLobby() then
		return false
	elseif IsInTheaterMode() then
		return false
	elseif not f872_local0 then
		local f872_local2 = f872_local1
	end
	local f872_local3 = CoD.AARUtility.UseTestData()
	if not f872_local3 then
		f872_local3 = f872_local2 and Engine.IsStableStatsBufferInitialized( f872_arg0 )
	end
	return f872_local3
end

function AnyRewardsEarnedDuringMatch( f873_arg0 )
	return CoD.AARUtility.AnyRewardsEarnedDuringMatch( f873_arg0 )
end

function HasFriends( f874_arg0 )
	return Engine.GetFriendsCount( f874_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function HasRecentPlayers( f875_arg0 )
	return Engine.GetRecentPlayersCount( f875_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function IsSocialPlayersListEmpty( f876_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
	if modelValue ~= nil then
		if modelValue == "friends" then
			return HasFriends( f876_arg0 )
		elseif modelValue == "recent" then
			return HasRecentPlayers( f876_arg0 )
		end
	end
	return false
end

function IsSocialGroupsTabOpen( f877_arg0 )
	return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "socialRoot.tab" ) == "groups"
end

function IsInTitle( f878_arg0, f878_arg1 )
	local f878_local0 = f878_arg0:getModel( f878_arg1, "activity" )
	if f878_local0 then
		local f878_local1 = Engine.GetModelValue( f878_local0 )
		if f878_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
			return false
		elseif f878_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
			return false
		end
	end
	return true
end

function IsJoinable( f879_arg0, f879_arg1 )
	if LuaUtils.LobbyIsLocked() then
		return false
	end
	local f879_local0 = CoD.SafeGetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" )
	local f879_local1 = f879_arg0:getModel( f879_arg1, "joinable" )
	if f879_local1 then
		local f879_local2 = Engine.GetModelValue( f879_local1 )
		if f879_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES then
			return true
		elseif f879_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY and f879_local0 ~= "recent" and f879_local0 ~= "groupMembers" then
			local f879_local3 = f879_arg0:getModel( f879_arg1, "friend" )
			if f879_local3 and Engine.GetModelValue( f879_local3 ) then
				return true
			end
		end
	end
	return false
end

function IsSocialPartyLeader( f880_arg0, f880_arg1 )
	local f880_local0 = f880_arg0:getModel( f880_arg1, "leader" )
	if (f880_local0 and Engine.GetModelValue( f880_local0 )) == 1 then
		return true
	else
		return false
	end
end

function IsSelectedFriendXuidEqualToControllerXuid( f881_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f881_arg0 ), "Social.selectedFriendXUID" ) ) == Engine.GetXUID64( f881_arg0 )
end

function ShouldHideJoinButton( f882_arg0, f882_arg1, f882_arg2 )
	local f882_local0 = PropertyIsTrue( f882_arg0, f882_arg2 )
	if not f882_local0 then
		f882_local0 = IsSelectedFriendXuidEqualToControllerXuid( f882_arg1 )
	end
	return f882_local0
end

function HideWinnersLabelsAndInfo( f883_arg0 )
	local f883_local0 = Engine.GetModel( Engine.GetModelForController( f883_arg0 ), "gameScore.draw" )
	local f883_local1 = Engine.GetGametypeSetting( "teamCount" ) < 2
	if f883_local0 then
		f883_local0 = Engine.GetModelValue( f883_local0 )
	end
	if f883_local0 or f883_local1 then
		return true
	else
		
	end
end

function IsScoreboardPingAsBars( f884_arg0, f884_arg1 )
	return Dvar.cg_ScoresPing_Interval:get() > 1
end

function ScoreboardVisible( f885_arg0 )
	local f885_local0 = Engine.IsVisibilityBitSet( f885_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f885_local0 then
		f885_local0 = IsModelValueEqualTo( f885_arg0, "forceScoreboard", 1 )
	end
	return f885_local0
end

function IsScoreboardPlayerMuted( f886_arg0, f886_arg1 )
	return Engine.IsPlayerMutedByClientNum( f886_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, CoD.SafeGetModelValue( f886_arg1:getModel(), "clientNum" ) )
end

function IsScoreboardPlayerCodCaster( f887_arg0, f887_arg1 )
	local f887_local0 = CoD.SafeGetModelValue( f887_arg1:getModel(), "clientNum" )
	if f887_local0 ~= nil and f887_local0 >= 0 then
		return Engine.GetTeamID( f887_arg0, f887_local0 ) == Enum.team_t.TEAM_SPECTATOR
	else
		return false
	end
end

function ScoreboardMuteButtonPromptHidden( f888_arg0, f888_arg1 )
	if not ScoreboardVisible( f888_arg1 ) then
		return true
	elseif CoD.IsShoutcaster( f888_arg1 ) then
		return true
	end
	local f888_local0 = Engine.GetModel( Engine.GetModelForController( f888_arg1 ), "scoreboardInfo.muteButtonPromptVisible" )
	if f888_local0 and not Engine.GetModelValue( f888_local0 ) then
		return true
	end
	local f888_local1 = CoD.SafeGetModelValue( f888_arg0:getModel(), "clientNum" )
	local f888_local2
	if f888_local1 ~= nil and Engine.GetMatchScoreboardClientXuid( f888_local1 ) ~= nil then
		f888_local2 = false
	else
		f888_local2 = true
	end
	return f888_local2
end

function ScoreboardCanShowGamerCard( f889_arg0, f889_arg1 )
	if not CoD.isDurango then
		return false
	else
		local f889_local0 = CoD.SafeGetModelValue( f889_arg0:getModel(), "clientNum" )
		if f889_local0 == nil or f889_local0 < 0 then
			return false
		else
			return Engine.GetMatchScoreboardClientXuid( f889_local0 ) ~= nil
		end
	end
end

function IsScoreboardPlayerSelf( f890_arg0, f890_arg1 )
	local f890_local0 = f890_arg0:getModel( f890_arg1, "clientNum" )
	if f890_local0 then
		if CoD.IsShoutcaster( f890_arg1 ) then
			return Engine.GetPredictedClientNum( f890_arg1 ) == Engine.GetModelValue( f890_local0 )
		end
		local f890_local1 = f890_arg1
		local f890_local2 = f890_arg1
		if IsInGame() and Engine.IsVisibilityBitSet( f890_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
			f890_local1 = 0
			f890_local2 = Engine.GetMaxControllerCount() - 1
		end
		for f890_local3 = f890_local1, f890_local2, 1 do
			if Engine.IsControllerBeingUsed( f890_local3 ) then
				if CoD.isPC then
					local f890_local6 = Engine.GetModelValue( f890_local0 )
					if f890_local6 and f890_local6 >= 0 then
						return Engine.GetMatchScoreboardClientXuid( f890_local6 ) == Engine.GetXUID64( f890_local3 )
					end
				end
				if string.gsub( GetScoreboardPlayerName( f890_local3, Engine.GetModelValue( f890_local0 ) ), "%[.+%]", "" ) == Engine.GetSelfGamertag( f890_local3 ) then
					return true
				end
			end
		end
	end
	return false
end

function ShowMatchBonus( f891_arg0, f891_arg1 )
	local f891_local0 = Engine.GetModelForController( f891_arg1 )
	local f891_local1 = Engine.GetModel( f891_local0, "gameScore.isRoundEnd" )
	local f891_local2 = Engine.GetModel( f891_local0, "gameScore.matchBonus" )
	local f891_local3 = 0
	if f891_local2 then
		f891_local3 = Engine.GetModelValue( f891_local2 )
	end
	local f891_local4
	if (f891_local1 and Engine.GetModelValue( f891_local1 )) or f891_local3 == 0 then
		f891_local4 = false
	else
		f891_local4 = true
	end
	return f891_local4
end

function IsVictory( f892_arg0 )
	local f892_local0 = Engine.GetModelForController( f892_arg0 )
	local f892_local1 = Engine.GetModel( f892_local0, "gameScore.isRoundEnd" )
	local f892_local2 = f892_local1 and Engine.GetModelValue( f892_local1 )
	local f892_local3 = Engine.GetModel( f892_local0, "gameScore.victory" )
	local f892_local4 = f892_local3 and Engine.GetModelValue( f892_local3 )
	local f892_local5
	if not f892_local2 then
		f892_local5 = f892_local4
	else
		f892_local5 = false
	end
	return f892_local5
end

function IsDefeat( f893_arg0 )
	local f893_local0 = Engine.GetModelForController( f893_arg0 )
	local f893_local1 = Engine.GetModel( f893_local0, "gameScore.isRoundEnd" )
	local f893_local2 = f893_local1 and Engine.GetModelValue( f893_local1 )
	local f893_local3 = Engine.GetModel( f893_local0, "gameScore.defeat" )
	local f893_local4 = f893_local3 and Engine.GetModelValue( f893_local3 )
	local f893_local5
	if not f893_local2 then
		f893_local5 = f893_local4
	else
		f893_local5 = false
	end
	return f893_local5
end

function IsStarterPack( f894_arg0 )
	return CoD.isPC and Engine.IsStarterPack()
end

function IsStarterPackMaxLevel( f895_arg0 )
	if IsStarterPack( f895_arg0 ) then
		local f895_local0 = CoD.GetPlayerStats( f895_arg0 )
		if f895_local0 then
			local f895_local1 = f895_local0.PlayerStatsList.RANK.StatValue:get()
			if f895_local1 and CoD.MAX_RANK_STARTER_PACK then
				return f895_local1 >= CoD.MAX_RANK_STARTER_PACK
			end
		end
	end
	return false
end

function IsStarterPackWatermarkHidden( f896_arg0, f896_arg1 )
	local f896_local0
	if IsStarterPack( f896_arg1 ) then
		f896_local0 = IsCurrentMenu( f896_arg0, "MPAAR" )
		if f896_local0 then
			f896_local0 = IsStarterPackMaxLevel( f896_arg1 )
		end
	else
		f896_local0 = true
	end
	return f896_local0
end

function IsStarterPackRestrictedButton( f897_arg0, f897_arg1 )
	return f897_arg0 and f897_arg0.starterPackUpgrade == true
end

function IsStarterPackNotAvailableButton( f898_arg0, f898_arg1 )
	return IsStarterPack( f898_arg1 ) and IsStarterPackRestrictedButton( f898_arg0, f898_arg1 ) or IsChunkDownloading( f898_arg0, f898_arg1 )
end

function IsChunksRestrictedButtonByParty( f899_arg0, f899_arg1 )
	if not f899_arg0 then
		return false
	end
	local f899_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f899_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f899_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f899_local0 )
	if #f899_local1.sessionClients == 1 then
		return false
	end
	for f899_local5, f899_local6 in ipairs( f899_local1.sessionClients ) do
		if PartyMemberMissingContent( f899_local6, f899_arg0.requiredChunk ) then
			return true
		end
	end
	return false
end

function IsStarterPackRestrictedButtonByParty( f900_arg0, f900_arg1 )
	if not f900_arg0 then
		return false
	end
	local f900_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f900_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f900_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f900_local0 )
	if #f900_local1.sessionClients == 1 then
		return false
	end
	local f900_local2 = IsStarterPackRestrictedButton( f900_arg0, f900_arg1 )
	for f900_local6, f900_local7 in ipairs( f900_local1.sessionClients ) do
		if f900_local2 and f900_local7.isStarterPack == 1 then
			return true
		end
	end
	return false
end

function IsRestrictedButtonByParty( f901_arg0, f901_arg1 )
	if not f901_arg0 then
		return false
	end
	local f901_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f901_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f901_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f901_local0 )
	if #f901_local1.sessionClients == 1 then
		return false
	end
	local f901_local2 = IsStarterPackRestrictedButton( f901_arg0, f901_arg1 )
	for f901_local6, f901_local7 in ipairs( f901_local1.sessionClients ) do
		if f901_local2 and f901_local7.isStarterPack == 1 then
			return true
		elseif PartyMemberMissingContent( f901_local7, f901_arg0.requiredChunk ) then
			return true
		end
	end
	return false
end

function IsChunkDownloading( f902_arg0, f902_arg1 )
	local f902_local0 = f902_arg0
	local f902_local1
	if IsGameModeOwned( f902_arg0.requiredChunk ) == true then
		f902_local1 = not IsGameModeInstalled( f902_arg1, f902_arg0.requiredChunk )
	else
		f902_local1 = false
	end
	return f902_local1
end

function IsFreeRunFinished( f903_arg0 )
	local f903_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f903_arg0 ), "FreeRun" ), "runState" )
	local f903_local1 = false
	if Engine.GetModelValue( f903_local0 ) == 2 then
		f903_local1 = true
	end
	return f903_local1
end

function ShouldShowFreerunTimeClips( f904_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f904_arg0 ), "FreeRun.freeRunInfo.bestTime" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	else
		return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f904_arg0 ), "FreeRun.runState" ) ) == CoD.FreerunUtility.FR_STATE_RUNNING
	end
end

function IsFreeRunMap( f905_arg0 )
	if CoD.mapsTable[f905_arg0] then
		local f905_local0
		if CoD.mapsTable[f905_arg0].isFreeRunMap == nil or CoD.mapsTable[f905_arg0].isFreeRunMap ~= true then
			f905_local0 = false
		else
			f905_local0 = true
		end
		return f905_local0
	else
		return false
	end
end

function IsFreeRunLobby()
	local f906_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f906_local0 == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f906_local0 == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		return true
	else
		return false
	end
end

function ShouldShowPartyPrivacy( f907_arg0 )
	local f907_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f907_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f907_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f907_local1 and f907_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f907_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f907_local2 ) then
		return false
	else
		local f907_local3 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
		if f907_local3.maxClients <= 1 then
			return false
		else
			return true
		end
	end
end

function ShouldShowLeaveParty( f908_arg0 )
	local f908_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f908_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f908_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f908_local1 and f908_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f908_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f908_local3 = Enum.LobbyModule.LOBBY_MODULE_HOST
	if Engine.IsLobbyHost( f908_local2 ) == false then
		f908_local3 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	end
	local f908_local4 = Engine.LobbyGetSessionClients( f908_local3, f908_local2 )
	if #f908_local4.sessionClients == 1 then
		return false
	end
	local f908_local5 = 0
	for f908_local9, f908_local10 in ipairs( f908_local4.sessionClients ) do
		if f908_local10.isLocal == 1 then
			f908_local5 = f908_local5 + 1
		end
	end
	if f908_local5 == #f908_local4.sessionClients then
		return false
	elseif LuaUtils.LobbyIsLocked() then
		return false
	end
	return true, f908_local3
end

function ShouldShowPromotePlayer( f909_arg0 )
	return false
end

function ShouldShowBootPlayer( f910_arg0 )
	local f910_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f910_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f910_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f910_local1 and f910_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f910_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f910_local2 ) then
		return false
	end
	local f910_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f910_local2 )
	if #f910_local3.sessionClients == 1 then
		return false
	end
	local f910_local4 = 0
	for f910_local8, f910_local9 in ipairs( f910_local3.sessionClients ) do
		if f910_local9.isLocal == 1 then
			f910_local4 = f910_local4 + 1
		end
	end
	if f910_local4 == #f910_local3.sessionClients then
		return false
	elseif LuaUtils.LobbyIsLocked() then
		return false
	end
	return true
end

function IsBleedOutVisible( f911_arg0, f911_arg1 )
	local f911_local0 = f911_arg0:getModel( f911_arg1, "stateFlags" )
	if f911_local0 then
		local f911_local1 = Engine.GetModelValue( f911_local0 )
		if f911_local1 ~= nil then
			return CoD.BitUtility.IsAnyBitSet( f911_local1, {
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT,
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED
			} )
		end
	end
	return false
end

function PaintshopEditAvailable( f912_arg0, f912_arg1 )
	if IsPC() and not IsPrimaryControllerIndex( f912_arg1 ) then
		return false
	else
		return true
	end
end

function DropDownListIsInUse( f913_arg0 )
	return f913_arg0.inUse
end

function CheckBoxOptionChecked( f914_arg0, f914_arg1 )
	local f914_local0 = nil
	if f914_arg1.menu then
		f914_local0 = f914_arg1.menu.m_ownerController
	else
		f914_local0 = f914_arg1.controller
	end
	local f914_local1 = f914_arg0:getModel()
	if f914_local1 then
		local f914_local2 = CoD.PCUtil.GetOptionInfo( f914_local1, f914_local0 )
		if type( f914_local2.currentValue ) == "number" then
			return math.abs( f914_local2.currentValue - f914_local2.highValue ) < 0.01
		elseif type( f914_local2.currentValue ) == "string" then
			return f914_local2.currentValue == f914_local2.highValue
		end
	end
	return false
end

function ShouldOpenGraphicsConfirm( f915_arg0, f915_arg1, f915_arg2 )
	return CoD.PCUtil.IsOptionsDirty( f915_arg2 )
end

function ShouldHideButtonPromptForPC( f916_arg0, f916_arg1, f916_arg2 )
	if CoD.isPC then
		local f916_local0 = CoD.PCUtil.GetElementModelValues( f916_arg0, {
			"Button",
			"Label"
		} )
		if f916_local0 and (f916_local0.Label == "" or f916_local0.Label == "MENU_SELECT" and f916_local0.Button == Enum.LUIButton.LUI_KEY_XBA_PSCROSS) then
			if f916_arg2 and (f916_arg2.menuName == "Scorestreaks" or f916_arg2.menuName == "StartMenu_Options_MusicTracks") then
				return false
			else
				return true
			end
		end
	end
	return false
end

function IsServerBrowserEnabled()
	local f917_local0 = Dvar.serverbrowser_show:get()
	if not f917_local0 then
		f917_local0 = Dvar.mods_enabled:get()
	end
	return f917_local0
end

function IsFilterActive( f918_arg0, f918_arg1 )
	local f918_local0 = false
	local f918_local1 = f918_arg0:getModel()
	if f918_local1 then
		local f918_local2 = Engine.GetModel( f918_local1, "attribute" )
		if f918_local2 then
			local f918_local3 = Engine.GetModelValue( f918_local2 )
			if f918_local3 == "any" then
				f918_local0 = not Engine.SteamServerBrowser_IsAnyAttributeFilterActive()
			else
				f918_local0 = Engine.SteamServerBrowser_IsAttributeFilterActive( f918_local3 )
			end
		else
			local f918_local3 = Engine.GetModelValue( Engine.GetModel( f918_local1, "type" ) )
			local f918_local4 = Engine.GetModelValue( Engine.GetModel( f918_local1, "id" ) )
			if f918_local4 == "any" then
				f918_local0 = not Engine.SteamServerBrowser_IsAnyFilterActive( f918_local3 )
			else
				f918_local0 = Engine.SteamServerBrowser_IsFilterActive( f918_local3, f918_local4 )
			end
		end
	end
	return f918_local0
end

function IsSteamServerBrowserEmpty()
	local f919_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListCount" ) )
	if f919_local0 == nil or f919_local0 == 0 then
		return true
	else
		return false
	end
end

function IsSteamServerBrowserUpdating()
	local f920_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListUpdatedCount" ) )
	return f920_local0 and f920_local0 > 0
end

function SteamServerSortMatchesHeaderAscending( f921_arg0 )
	if f921_arg0.ascendingSort then
		local f921_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListSortType" ) )
		if f921_local0 then
			return f921_arg0.ascendingSort == f921_local0
		end
	end
	return false
end

function SteamServerSortMatchesHeaderDescending( f922_arg0 )
	if f922_arg0.descendingSort then
		local f922_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListSortType" ) )
		if f922_local0 then
			return f922_arg0.descendingSort == f922_local0
		end
	end
	return false
end

function SteamServerIsCurrentServerTypeFavorites( f923_arg0 )
	if Engine.SteamServerBrowser_GetCurrentServerRequestType() == Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_FAVORITES then
		return true
	else
		return false
	end
end

function SteamServerIsCurrentServerTypeHistory( f924_arg0 )
	if Engine.SteamServerBrowser_GetCurrentServerRequestType() == Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_HISTORY then
		return true
	else
		return false
	end
end

function DropdownListIsInUse_Console( f925_arg0 )
	return f925_arg0.inUse
end

function ShouldShowMOTD( f926_arg0 )
	return Engine.ShouldShowMOTD( f926_arg0 )
end

function ShouldShowMtxCommsMOTD( f927_arg0 )
	if Dvar.ui_execdemo_beta:get() then
		return false
	elseif ShouldSkipMtxCommsMOTD( f927_arg0 ) then
		return false
	elseif Engine.GetMarketingMessage( f927_arg0, "motd" ) ~= nil then
		return true
	else
		return false
	end
end

function ShouldShowMtxCommsMOTDPopup( f928_arg0 )
	local f928_local0 = Engine.GetMarketingMessage( f928_arg0, "motd" )
	if ShouldSkipMtxCommsMOTD( f928_arg0 ) then
		return false
	elseif f928_local0 ~= nil and f928_local0.messageViewReported ~= true then
		return true
	else
		return false
	end
end

function ShouldSkipMtxCommsMOTD( f929_arg0 )
	local f929_local0 = Engine.GetMarketingMessage( f929_arg0, "motd" )
	if f929_local0 ~= nil and (f929_local0.action == "pass" or f929_local0.action == "skip") then
		return true
	else
		return false
	end
end

function FeaturedWidgetControllerVisible( f930_arg0 )
	local f930_local0 = Engine.GetFeaturedCardsData()
	if f930_local0 ~= nil and f930_local0.validCardsCount >= 2 then
		return true
	elseif (HasLiveEvent( f930_arg0 ) or IsExperimentPromotionActive( f930_arg0 )) and f930_local0.validCardsCount >= 1 then
		return true
	elseif HasLiveEvent( f930_arg0 ) and IsExperimentPromotionActive( f930_arg0 ) then
		return true
	elseif 1 == Dvar.ui_enableZMHDFeaturedCard:get() or Dvar.ui_enableZMHDFeaturedCard:get() == "1" then
		return true
	elseif CoD.isZombie then
		return true
	else
		return false
	end
end

function IsBubbleGumBuffEquipped( f931_arg0, f931_arg1, f931_arg2 )
	local f931_local0 = f931_arg1:getModel()
	if not f931_local0 then
		return false
	end
	local f931_local1 = Engine.GetModel( f931_local0, "itemIndex" )
	if not f931_local1 then
		return false
	end
	local f931_local2 = Engine.GetModelValue( f931_local1 )
	local f931_local3 = Engine.GetEquippedBubbleGumPack( f931_arg2 )
	for f931_local4 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f931_arg2, f931_local3, f931_local4 ) == f931_local2 then
			return true
		end
	end
	return false
end

function IsOutOfLobbyBubbleGum( f932_arg0, f932_arg1 )
	local f932_local0 = f932_arg0:getModel( f932_arg1, "itemIndex" )
	if not f932_local0 then
		return false
	elseif not CoD.CACUtility.IsItemConsumable( Engine.GetModelValue( f932_local0 ) ) then
		return false
	else
		local f932_local1 = f932_arg0:getModel( f932_arg1, "remaining" )
		if not f932_local1 then
			return false
		else
			return Engine.GetModelValue( f932_local1 ) == 0
		end
	end
end

function HasBGBTokensRemaining( f933_arg0, f933_arg1 )
	if Engine.GetZMVials( f933_arg1 ) > 0 == false then
		return false
	else
		return Engine.GetModelValue( f933_arg0:getModel( f933_arg1, "price" ) ) <= Engine.GetZMVials( f933_arg1 )
	end
end

function IsOwedVials( f934_arg0 )
	local f934_local0 = Engine.StorageGetBuffer( f934_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if not f934_local0 then
		return false
	elseif Dvar.tu5_enableVialsOwed:exists() then
		local f934_local1
		if f934_local0.vialsOwed:get() > 0 then
			f934_local1 = Dvar.tu5_enableVialsOwed:get()
		else
			f934_local1 = false
		end
		return f934_local1
	else
		return f934_local0.vialsOwed:get() > 0
	end
end

function HasSeenMegaChewFactoryFirstTimePopup( f935_arg0 )
	local f935_local0 = Engine.StorageGetBuffer( f935_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f935_local0 then
		return f935_local0.extraBools[0]:get() == 1
	else
		return false
	end
end

function HasSeenNewtonsCookbookFirstTimePopup( f936_arg0 )
	local f936_local0 = Engine.StorageGetBuffer( f936_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f936_local0 then
		return f936_local0.extraBools[2]:get() == 1
	else
		return false
	end
end

function HasGobbleGumCookbookUses( f937_arg0 )
	return CoD.BubbleGumBuffUtility.GetRecipeDistillCost() <= CoD.BubbleGumBuffUtility.GetTotalRemainingDistills( f937_arg0 )
end

function CanGetFreeGobblegumCookbookUses( f938_arg0 )
	local f938_local0
	if CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f938_arg0, CoD.BubbleGumBuffUtility.FREE_DISTILL ) >= CoD.BubbleGumBuffUtility.GetRecipeDistillCost() or CoD.BubbleGumBuffUtility.GetDistillCooldown( f938_arg0, CoD.BubbleGumBuffUtility.FREE_DISTILL ) > 0 then
		f938_local0 = false
	else
		f938_local0 = true
	end
	return f938_local0
end

function HasGobbleGumCookbookIngredients( f939_arg0 )
	local f939_local0 = Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f939_arg0 ), "haveAllIngredients" )
	return f939_local0 and Engine.GetModelValue( f939_local0 )
end

function ShowGobbleGumDistillTimer( f940_arg0, f940_arg1 )
	local f940_local0 = CoD.SafeGetModelValue( f940_arg0:getModel(), "distillID" )
	if f940_local0 then
		if f940_local0 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
			local f940_local1
			if CoD.BubbleGumBuffUtility.GetDistillCooldown( f940_arg1, f940_local0 ) <= 0 or CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f940_arg1, CoD.BubbleGumBuffUtility.FREE_DISTILL ) >= CoD.BubbleGumBuffUtility.GetRecipeDistillCost() then
				f940_local1 = false
			else
				f940_local1 = true
			end
			return f940_local1
		else
			return CoD.BubbleGumBuffUtility.GetDistillCooldown( f940_arg1, f940_local0 ) > 0
		end
	else
		return false
	end
end

function IsGobbleGumIngredientType( f941_arg0, f941_arg1, f941_arg2 )
	local f941_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f941_arg0, Engine.GetModelValue( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f941_arg0 ), "recipeIndex" ) ) )
	if f941_local0.ingredients[f941_arg1] then
		local f941_local1 = Engine.TableLookup( f941_arg0, "gamedata/stats/zm/zm_statsTable.csv", 0, f941_local0.ingredients[f941_arg1].itemIndex, 20 )
		if f941_local1 then
			return f941_arg2 == f941_local1
		end
	end
	return false
end

function IsGobbleGumResultType( f942_arg0, f942_arg1 )
	local f942_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f942_arg0, Engine.GetModelValue( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f942_arg0 ), "recipeIndex" ) ) )
	if f942_local0.result then
		local f942_local1 = Engine.TableLookup( f942_arg0, "gamedata/stats/zm/zm_statsTable.csv", 0, f942_local0.result.itemIndex, 20 )
		if f942_local1 then
			return f942_arg1 == f942_local1
		end
	end
	return false
end

function IsModelOnesDigitEqualTo( f943_arg0, f943_arg1, f943_arg2 )
	local f943_local0 = Engine.GetModelForController( f943_arg0 )
	if f943_local0 then
		f943_local0 = Engine.GetModel( f943_local0, f943_arg1 )
	end
	local f943_local1 = f943_local0 and Engine.GetModelValue( f943_local0 )
	if f943_local1 == nil then
		return false
	else
		return f943_local1 % 10 == f943_arg2
	end
end

function IsModelTensDigitEqualTo( f944_arg0, f944_arg1, f944_arg2 )
	local f944_local0 = Engine.GetModelForController( f944_arg0 )
	if f944_local0 then
		f944_local0 = Engine.GetModel( f944_local0, f944_arg1 )
	end
	local f944_local1 = f944_local0 and Engine.GetModelValue( f944_local0 )
	if f944_local1 == nil then
		return false
	else
		return (f944_local1 % 100 - f944_local1 % 10) / 10 == f944_arg2
	end
end

function IsModelHundredsDigitEqualTo( f945_arg0, f945_arg1, f945_arg2 )
	local f945_local0 = Engine.GetModelForController( f945_arg0 )
	if f945_local0 then
		f945_local0 = Engine.GetModel( f945_local0, f945_arg1 )
	end
	local f945_local1 = f945_local0 and Engine.GetModelValue( f945_local0 )
	if f945_local1 == nil then
		return false
	else
		return (f945_local1 % 1000 - f945_local1 % 100) / 100 == f945_arg2
	end
end

function IsConsumableCountOnesDigitEqualTo( f946_arg0, f946_arg1, f946_arg2 )
	local f946_local0 = f946_arg0:getModel()
	if f946_local0 then
		f946_local0 = Engine.GetModel( f946_local0, "itemIndex" )
	end
	local f946_local1 = f946_local0 and Engine.GetModelValue( f946_local0 )
	if f946_local1 == nil then
		return false
	else
		return GetConsumableCountFromIndex( f946_arg1, f946_local1 ) % 10 == f946_arg2
	end
end

function IsConsumableCountTensDigitEqualTo( f947_arg0, f947_arg1, f947_arg2 )
	local f947_local0 = f947_arg0:getModel()
	if f947_local0 then
		f947_local0 = Engine.GetModel( f947_local0, "itemIndex" )
	end
	local f947_local1 = f947_local0 and Engine.GetModelValue( f947_local0 )
	if f947_local1 == nil then
		return false
	else
		local f947_local2 = GetConsumableCountFromIndex( f947_arg1, f947_local1 )
		return (f947_local2 % 100 - f947_local2 % 10) / 10 == f947_arg2
	end
end

function IsConsumableCountHundredsDigitEqualTo( f948_arg0, f948_arg1, f948_arg2 )
	local f948_local0 = f948_arg0:getModel()
	if f948_local0 then
		f948_local0 = Engine.GetModel( f948_local0, "itemIndex" )
	end
	local f948_local1 = f948_local0 and Engine.GetModelValue( f948_local0 )
	if f948_local1 == nil then
		return false
	else
		local f948_local2 = GetConsumableCountFromIndex( f948_arg1, f948_local1 )
		return (f948_local2 % 1000 - f948_local2 % 100) / 100 == f948_arg2
	end
end

function IsConsumableCountGreaterThanOrEqualTo( f949_arg0, f949_arg1, f949_arg2 )
	local f949_local0 = f949_arg0:getModel()
	if f949_local0 then
		f949_local0 = Engine.GetModel( f949_local0, "itemIndex" )
	end
	local f949_local1 = f949_local0 and Engine.GetModelValue( f949_local0 )
	if f949_local1 == nil then
		return false
	else
		return f949_arg2 <= GetConsumableCountFromIndex( f949_arg1, f949_local1 )
	end
end

function IsShowcaseWeaponEquipped( f950_arg0, f950_arg1 )
	local f950_local0 = CoD.CCUtility.customizationMode
	local f950_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f950_local2 = Engine.GetModel( f950_arg0:getModel(), "itemIndex" )
	if not f950_local2 then
		return false
	else
		return Engine.GetModelValue( f950_local2 ) == Engine.GetHeroShowcaseWeaponAttribute( f950_arg1, f950_local0, f950_local1, "weaponIndex" )
	end
end

function InCharacterCustomizationMode( f951_arg0 )
	return CoD.CCUtility.customizationMode == f951_arg0
end

function CharacterHasAnyWeaponUnlocked( f952_arg0, f952_arg1 )
	if not IsProgressionEnabled( f952_arg0 ) and (not IsLive() or not IsFirstTimeSetup( f952_arg0, Enum.eModes.MODE_MULTIPLAYER )) then
		return true
	end
	local f952_local0 = f952_arg1.heroIndex
	if not f952_local0 then
		f952_local0 = CoD.SafeGetModelValue( f952_arg1:getModel(), "heroIndex" )
	end
	if not f952_local0 then
		return false
	elseif IsMultiplayer() then
		local f952_local1 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		local f952_local2 = f952_local1[f952_local0 + 1]
		if f952_local2 and CoDShared.IsLootHero( f952_local2 ) then
			return true
		end
	end
	for f952_local1 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f952_local4 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f952_local0, f952_local1 )
		if not Engine.IsItemLocked( f952_arg0, f952_local4.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.IsItemPurchased( f952_arg0, f952_local4.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) then
			return true
		end
	end
	return false
end

function IsCharacterBlackjack( f953_arg0, f953_arg1 )
	local f953_local0 = f953_arg1:getModel( f953_arg0, "heroIndex" )
	return f953_local0 and Engine.GetModelValue( f953_local0 ) == CoD.CCUtility.GetBlackjackHeroIndex()
end

function IsBlackjackContractActive( f954_arg0 )
	return Engine.ConsumableGet( f954_arg0, "blackjack", "consumed" ) < Engine.ConsumableGet( f954_arg0, "blackjack", "awarded" )
end

function IsCodPointsSaleActivated( f955_arg0, f955_arg1 )
	local f955_local0 = f955_arg0:getModel( f955_arg1, "metadata" )
	if f955_local0 then
		if Dvar.store_activateCPSale:exists() and Dvar.store_activateCPSale:get() == "1" and CoD.StoreUtility.IsCodPointSalePackage( Engine.GetModelValue( f955_local0 ) ) then
			return true
		end
	end
	return false
end

function ShouldDisplayDiscountedSeasonPass( f956_arg0, f956_arg1 )
	if not Dvar.store_seasonpassdiscount:exists() or Dvar.store_seasonpassdiscount:get() == "0" then
		return false
	else
		local f956_local0 = LuaUtils.GetSkuName()
		if f956_local0 == nil then
			return false
		elseif IsOrbis() and f956_local0 ~= "SceaEnFr" and f956_local0 ~= "SceaMsEn" and f956_local0 ~= "SceaBpEn" then
			return false
		elseif Engine.OwnSeasonPass( f956_arg1 ) then
			return false
		elseif not Engine.HasEntitlement( f956_arg1, "dlc1" ) then
			return false
		else
			return true
		end
	end
end

function ShouldShowInfiniteWarfareCategory( f957_arg0 )
	if IsOrbis() then
		if IsJapaneseSku() or IsChineseSku() then
			return false
		else
			return true
		end
	else
		return false
	end
end

function ShouldShowStrongholdCategory( f958_arg0 )
	if IsOrbis() then
		if IsChineseSku() then
			return false
		else
			return true
		end
	else
		return false
	end
end

function HideExtraSlotsPurchaseButton( f959_arg0, f959_arg1 )
	if CoD.perController[f959_arg1].selectedStoreCategory == "EXTRASLOTS" then
		return false
	else
		
	end
end

function HasStoreItems( f960_arg0 )
	if CoD.perController[f960_arg0].selectedStoreCategory then
		if CoD.perController[f960_arg0].selectedStoreCategory == "EXTRASLOTS" or CoD.perController[f960_arg0].selectedStoreCategory == "ESPORTS" or CoD.perController[f960_arg0].selectedStoreCategory == "EXTRAPACKS" or CoD.perController[f960_arg0].selectedStoreCategory == "OUTFITS" then
			return true
		else
			return #Engine.GetStoreProductsByCategory( f960_arg0, CoD.perController[f960_arg0].selectedStoreCategory ) > 0
		end
	else
		return false
	end
end

function HideProductNameAndDesc()
	return false
end

function IsLootReady( f962_arg0 )
	return Engine.IsLootReady( f962_arg0 )
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
	if not Dvar.live_store_enable:get() then
		return true
	else
		return not CoD.isPC
	end
end

function ShouldOpenGraphicsAndSoundOptions()
	if IsDurango() then
		return true
	else
		local f969_local0
		if Dvar.ui_execdemo:get() then
			f969_local0 = Dvar.ui_execdemo:get()
			if f969_local0 then
				f969_local0 = Dvar.ui_execdemo_beta:get()
			end
		else
			f969_local0 = true
		end
	end
	return f969_local0
end

function IsGamesComBuild()
	return LuaUtils.IsGamescomBuild()
end

function ShouldOpenNetworkOptions()
	return true
end

function IsBlackhatHacking( f972_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f972_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Hacking
end

function IsBlackhatBreaching( f973_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f973_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Breaching
end

function IsBrightnessSliderPipEmpty( f974_arg0 )
	local f974_local0 = f974_arg0.gridInfoTable.zeroBasedIndex
	local f974_local1 = f974_arg0.gridInfoTable.parentGrid.activeWidget
	local f974_local2 = 0
	if f974_local1 then
		f974_local2 = f974_local1.gridInfoTable.zeroBasedIndex
	end
	if f974_local2 < f974_local0 then
		return true
	else
		
	end
end

function IsAlertOverlay( f975_arg0, f975_arg1 )
	local f975_local0 = f975_arg0:getModel( f975_arg1, "categoryType" )
	if f975_local0 then
		local f975_local1 = Engine.GetModelValue( f975_local0 )
		local f975_local2
		if f975_local1 ~= CoD.OverlayUtility.OverlayTypes.Alert and f975_local1 ~= CoD.OverlayUtility.OverlayTypes.Error then
			f975_local2 = false
		else
			f975_local2 = true
		end
		return f975_local2
	else
		return false
	end
end

function HasOverlayBackAction( f976_arg0 )
	return f976_arg0[CoD.OverlayUtility.GoBackPropertyName] ~= nil
end

function HasOverlayContinueAction( f977_arg0 )
	return f977_arg0[CoD.OverlayUtility.ContinuePropertyName] ~= nil
end

function IsPrimaryControllerIndex( f978_arg0 )
	if Engine.GetPrimaryController() == f978_arg0 then
		return true
	else
		return false
	end
end

function IsCodCasterQuickSettingEnabled( f979_arg0, f979_arg1, f979_arg2 )
	if not f979_arg1.profileVar then
		return false
	else
		return CoD.ShoutcasterProfileVarBool( f979_arg2, f979_arg1.profileVar )
	end
end

function IsCodCaster( f980_arg0 )
	if CoD.IsShoutcaster( f980_arg0 ) then
		return true
	else
		return false
	end
end

function IsCodCasterProfileValueEqualTo( f981_arg0, f981_arg1, f981_arg2 )
	local f981_local0 = CoD.ShoutcasterProfileVarValue( f981_arg0, f981_arg1 )
	local f981_local1
	if f981_local0 == nil or f981_local0 ~= f981_arg2 then
		f981_local1 = false
	else
		f981_local1 = true
	end
	return f981_local1
end

function ShouldHideCodCasterHud( f982_arg0 )
	if not IsGlobalModelValueGreaterThan( f982_arg0, "scoreboard.team1.count", 0 ) and not IsGlobalModelValueGreaterThan( f982_arg0, "scoreboard.team2.count", 0 ) then
		return true
	else
		return false
	end
end

function IsCodCasterSpectatingPlayerInTeam( f983_arg0, f983_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f983_arg0 ), "deadSpectator.playerTeam" ) == f983_arg1
end

function ShouldPresentMOTDBanner( f984_arg0, f984_arg1 )
	local f984_local0 = false
	local f984_local1 = Engine.GetMarketingMessage( f984_arg0, "registration" )
	if f984_local1 ~= nil then
		local f984_local2 = f984_local1.action
		if f984_local2 == "registration" or f984_local2 == "opt-in" or LUI.startswith( f984_local2, "store" ) or f984_local2 == "blackmarket" or f984_local2 == "drmonty" or f984_local2 == "contracts" or f984_local2 == "promo" or f984_local2 == "expand" then
			return true
		end
		f984_local0 = true
	end
	if ShouldShowMtxCommsMOTDPopup( f984_arg0 ) then
		local f984_local2 = Engine.GetMarketingMessage( f984_arg0, "motd" )
		if f984_local2 == nil or not f984_local2.hasBanner then
			return false
		elseif f984_local0 == true then
			local f984_local3 = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" )
			Engine.SetModelValue( Engine.GetModel( f984_local3, "content_short" ), f984_local2.bannerTitle )
			Engine.SetModelValue( Engine.GetModel( f984_local3, "action" ), f984_local2.bannerAction )
			Engine.SetModelValue( Engine.GetModel( f984_local3, "image" ), f984_local2.bannerImage )
			Engine.SetModelValue( Engine.GetModel( f984_local3, "action_title" ), f984_local2.bannerActionString )
			Engine.SetModelValue( Engine.GetModel( f984_local3, "locationID" ), 1 )
		end
		return true
	end
	return false
end

function IsInventoryWidgetVisible( f985_arg0, f985_arg1 )
	return IsModelValueEqualTo( f985_arg0, "zmInventory." .. f985_arg1, 1 )
end

function IsInventoryPieceVisible( f986_arg0, f986_arg1 )
	return IsModelValueEqualTo( f986_arg0, "zmInventory." .. f986_arg1, 1 )
end

function IsEitherInventoryItemVisible( f987_arg0, f987_arg1, f987_arg2 )
	local f987_local0 = IsModelValueEqualTo( f987_arg0, "zmInventory." .. f987_arg1, 1 )
	if not f987_local0 then
		f987_local0 = IsModelValueEqualTo( f987_arg0, "zmInventory." .. f987_arg2, 1 )
	end
	return f987_local0
end

function IsAnyInventoryItemVisible3( f988_arg0, f988_arg1, f988_arg2, f988_arg3 )
	local f988_local0 = IsModelValueEqualTo( f988_arg0, "zmInventory." .. f988_arg1, 1 )
	if not f988_local0 then
		f988_local0 = IsModelValueEqualTo( f988_arg0, "zmInventory." .. f988_arg2, 1 )
		if not f988_local0 then
			f988_local0 = IsModelValueEqualTo( f988_arg0, "zmInventory." .. f988_arg3, 1 )
		end
	end
	return f988_local0
end

function IsAnyInventoryItemVisible4( f989_arg0, f989_arg1, f989_arg2, f989_arg3, f989_arg4 )
	local f989_local0 = IsModelValueEqualTo( f989_arg0, "zmInventory." .. f989_arg1, 1 )
	if not f989_local0 then
		f989_local0 = IsModelValueEqualTo( f989_arg0, "zmInventory." .. f989_arg2, 1 )
		if not f989_local0 then
			f989_local0 = IsModelValueEqualTo( f989_arg0, "zmInventory." .. f989_arg3, 1 )
			if not f989_local0 then
				f989_local0 = IsModelValueEqualTo( f989_arg0, "zmInventory." .. f989_arg4, 1 )
			end
		end
	end
	return f989_local0
end

function IsAnyInventoryModelGreaterThan3( f990_arg0, f990_arg1, f990_arg2, f990_arg3, f990_arg4, f990_arg5, f990_arg6 )
	local f990_local0 = IsModelValueGreaterThan( f990_arg0, "zmInventory." .. f990_arg1, f990_arg2 )
	if not f990_local0 then
		f990_local0 = IsModelValueGreaterThan( f990_arg0, "zmInventory." .. f990_arg3, f990_arg4 )
		if not f990_local0 then
			f990_local0 = IsModelValueGreaterThan( f990_arg0, "zmInventory." .. f990_arg5, f990_arg6 )
		end
	end
	return f990_local0
end

function FuseBoxVisible( f991_arg0, f991_arg1 )
	if CoD.Zombie[f991_arg1] then
		local f991_local0 = Engine.GetModel( Engine.GetModelForController( f991_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie[f991_arg1] )
		return f991_local0 and Engine.GetModelValue( f991_local0 ) == 1
	else
		
	end
end

function RocketShieldBlueprintPieceVisible( f992_arg0, f992_arg1 )
	if CoD.Zombie[f992_arg1] then
		local f992_local0 = Engine.GetModel( Engine.GetModelForController( f992_arg0 ), "zmInventory." .. CoD.Zombie[f992_arg1] )
		return f992_local0 and Engine.GetModelValue( f992_local0 ) == 1
	else
		
	end
end

function IDGunBlueprintPieceVisible( f993_arg0, f993_arg1 )
	if CoD.Zombie[f993_arg1] then
		local f993_local0 = Engine.GetModel( Engine.GetModelForController( f993_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie[f993_arg1] )
		return f993_local0 and Engine.GetModelValue( f993_local0 ) == 1
	else
		
	end
end

function SummonningKeyVisible( f994_arg0 )
	local f994_local0 = Engine.GetModel( Engine.GetModelForController( f994_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY )
	return f994_local0 and Engine.GetModelValue( f994_local0 ) == 1
end

function SummoningKeyBeingUsed( f995_arg0 )
	local f995_local0 = Engine.GetModel( Engine.GetModelForController( f995_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY )
	local f995_local1 = Engine.GetModelValue( f995_local0 )
	local f995_local2 = f995_local0
	local f995_local3
	if f995_local1 <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or f995_local1 >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES then
		f995_local3 = false
	else
		f995_local3 = f995_local2 and true
	end
	return f995_local3
end

function SummoningKeyBeingUsedByOtherPlayer( f996_arg0 )
	local f996_local0 = Engine.GetModel( Engine.GetModelForController( f996_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY )
	local f996_local1 = Engine.GetModelValue( f996_local0 )
	local f996_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f996_arg0 ), "zmInventory.player_character_identity" ) )
	local f996_local3 = f996_local0
	local f996_local4
	if f996_local1 <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or f996_local1 >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES or f996_local1 == f996_local2 then
		f996_local4 = false
	else
		f996_local4 = f996_local3 and true
	end
	return f996_local4
end

function SummoningKeyMissing( f997_arg0 )
	return (CheckMemento( f997_arg0, CoD.Zombie.ZOD_NAME_FEMME ) or CheckMemento( f997_arg0, CoD.Zombie.ZOD_NAME_DETECTIVE ) or CheckMemento( f997_arg0, CoD.Zombie.ZOD_NAME_BOXER ) or CheckMemento( f997_arg0, CoD.Zombie.ZOD_NAME_MAGICIAN )) and not SummonningKeyVisible( f997_arg0 )
end

function IsRitualItemInState( f998_arg0, f998_arg1, f998_arg2 )
	if CoD.Zombie[f998_arg1] and CoD.Zombie[f998_arg2] then
		local f998_local0 = Engine.GetModel( Engine.GetModelForController( f998_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie[f998_arg1] )
		return f998_local0 and Engine.GetModelValue( f998_local0 ) == CoD.Zombie[f998_arg2]
	else
		
	end
end

function IsRitualItemHeldBy( f999_arg0, f999_arg1, f999_arg2 )
	if CoD.Zombie[f999_arg1] and CoD.Zombie[f999_arg2] then
		local f999_local0 = Engine.GetModel( Engine.GetModelForController( f999_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie[f999_arg1] )
		return f999_local0 and Engine.GetModelValue( f999_local0 ) == CoD.Zombie[f999_arg2]
	else
		
	end
end

function IsRitualItemMissing( f1000_arg0, f1000_arg1 )
	if CoD.Zombie[f1000_arg1] then
		local f1000_local0 = Engine.GetModel( Engine.GetModelForController( f1000_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[f1000_arg1] .. CoD.Zombie.MEMENTO_SUFFIX )
		return f1000_local0 and Engine.GetModelValue( f1000_local0 ) == 1 and IsRitualItemInState( f1000_arg0, f1000_arg1, "CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_MEMENTO" )
	else
		
	end
end

function IsRitualItemBeingUsed( f1001_arg0, f1001_arg1 )
	if CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. f1001_arg1] then
		local f1001_local0 = Engine.GetModel( Engine.GetModelForController( f1001_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY_LOCATION )
		return f1001_local0 and Engine.GetModelValue( f1001_local0 ) == CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. f1001_arg1]
	else
		
	end
end

function IsRitualItemWithAnotherPlayer( f1002_arg0, f1002_arg1 )
	if CoD.Zombie[f1002_arg1] then
		local f1002_local0 = Engine.GetModel( Engine.GetModelForController( f1002_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[f1002_arg1] .. CoD.Zombie.MEMENTO_SUFFIX )
		return f1002_local0 and Engine.GetModelValue( f1002_local0 ) == 1 and not IsRitualItemHeldBy( f1002_arg0, f1002_arg1, CoD.Zombie.GetCharacterEnumString( Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f1002_arg0 ), "zmInventory.player_character_identity" ) ) ) )
	else
		
	end
end

function HasTalonSpikeItem( f1003_arg0, f1003_arg1 )
	local f1003_local0 = CoD.Zombie[f1003_arg1]
	if not f1003_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f1003_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_GRAVITYSPIKE .. "_" .. f1003_local0 ) == 1
	end
end

function ShowGasMaskPartsWidget( f1004_arg0 )
	local f1004_local0 = Engine.GetModel( Engine.GetModelForController( f1004_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_GASMASK_PARTS )
	return f1004_local0 and Engine.GetModelValue( f1004_local0 ) == 1
end

function HasGasMaskItem( f1005_arg0, f1005_arg1 )
	local f1005_local0 = CoD.Zombie[f1005_arg1]
	if not f1005_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f1005_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_GASMASK .. "_" .. f1005_local0 ) == 1
	end
end

function ShowMachineToolsPartsWidget( f1006_arg0 )
	local f1006_local0 = Engine.GetModel( Engine.GetModelForController( f1006_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_MACHINETOOLS_PARTS )
	return f1006_local0 and Engine.GetModelValue( f1006_local0 ) == 1
end

function HasMachineToolsItem( f1007_arg0, f1007_arg1 )
	local f1007_local0 = CoD.Zombie[f1007_arg1]
	if not f1007_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f1007_arg0 ), "zmInventory." .. f1007_local0 .. "_" .. CoD.Zombie.CRAFTABLE_MACHINETOOLS ) == 1
	end
end

function ShowWonderWeaponPartsWidget( f1008_arg0 )
	local f1008_local0 = Engine.GetModel( Engine.GetModelForController( f1008_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_WONDERWEAPON_PARTS )
	return f1008_local0 and Engine.GetModelValue( f1008_local0 ) == 1
end

function HasWonderWeaponItem( f1009_arg0, f1009_arg1 )
	local f1009_local0 = CoD.Zombie[f1009_arg1]
	if not f1009_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f1009_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_WONDERWEAPON .. "_" .. f1009_local0 ) == 1
	end
end

function ShowSkullPartsWidget( f1010_arg0 )
	local f1010_local0 = Engine.GetModel( Engine.GetModelForController( f1010_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_SKULL_PARTS )
	return f1010_local0 and Engine.GetModelValue( f1010_local0 ) == 1
end

function ShowBucketPartsWidget( f1011_arg0 )
	local f1011_local0 = Engine.GetModel( Engine.GetModelForController( f1011_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_BUCKET_PARTS )
	return f1011_local0 and Engine.GetModelValue( f1011_local0 ) == 1
end

function ShowingAnyBucketPart( f1012_arg0 )
	local f1012_local0 = Engine.IsVisibilityBitSet( f1012_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f1012_local0 then
		f1012_local0 = ShowBucketOrSeedWidget( f1012_arg0 )
	end
	return f1012_local0
end

function IsBucketAtLevel( f1013_arg0, f1013_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f1013_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_TYPE ) == f1013_arg1
end

function IsBucketWaterType( f1014_arg0, f1014_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f1014_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_WATER_TYPE ) == f1014_arg1
end

function IsBucketWaterLevel( f1015_arg0, f1015_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f1015_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_WATER_LEVEL ) == f1015_arg1
end

function ShowSeedPartsWidget( f1016_arg0 )
	local f1016_local0 = Engine.GetModel( Engine.GetModelForController( f1016_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_SEED_PARTS )
	return f1016_local0 and Engine.GetModelValue( f1016_local0 ) == 1
end

function ShowBucketOrSeedWidget( f1017_arg0 )
	local f1017_local0 = ShowBucketPartsWidget( f1017_arg0 )
	if not f1017_local0 then
		f1017_local0 = ShowSeedPartsWidget( f1017_arg0 )
	end
	return f1017_local0
end

function HasBucketSeedItem( f1018_arg0, f1018_arg1 )
	local f1018_local0 = CoD.Zombie[f1018_arg1]
	if not f1018_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f1018_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. f1018_local0 ) == 1
	end
end

function SprayerMissing( f1019_arg0 )
	local f1019_local0 = Engine.GetModel( Engine.GetModelForController( f1019_arg0 ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HINT_RANGE )
	local f1019_local1 = f1019_local0
	local f1019_local2
	if Engine.GetModelValue( f1019_local0 ) == 1 then
		f1019_local2 = not SprayerFound( f1019_arg0 )
	else
		f1019_local2 = false
	end
	return f1019_local2
end

function SprayerFound( f1020_arg0 )
	local f1020_local0 = Engine.GetModel( Engine.GetModelForController( f1020_arg0 ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HELD )
	return f1020_local0 and Engine.GetModelValue( f1020_local0 ) == 1
end

function SprayerInUse( f1021_arg0 )
	local f1021_local0 = Engine.GetModel( Engine.GetModelForController( f1021_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_USING_SPRAYER )
	return f1021_local0 and Engine.GetModelValue( f1021_local0 ) == 1
end

function ShowQuestItemsWidget( f1022_arg0 )
	local f1022_local0 = Engine.GetModel( Engine.GetModelForController( f1022_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_QUEST_ITEMS )
	return f1022_local0 and Engine.GetModelValue( f1022_local0 ) == 1
end

function ShowIDGunPartsWidget( f1023_arg0 )
	local f1023_local0 = Engine.GetModel( Engine.GetModelForController( f1023_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_IDGUN_PARTS )
	return f1023_local0 and Engine.GetModelValue( f1023_local0 ) == 1
end

function ShowRocketShieldPartsWidget( f1024_arg0 )
	local f1024_local0 = Engine.GetModel( Engine.GetModelForController( f1024_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_ROCKETSHIELD_PARTS )
	return f1024_local0 and Engine.GetModelValue( f1024_local0 ) == 1
end

function ShowGravitySpikePartsWidget( f1025_arg0 )
	local f1025_local0 = Engine.GetModel( Engine.GetModelForController( f1025_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_GRAVITYSPIKE_PARTS )
	return f1025_local0 and Engine.GetModelValue( f1025_local0 ) == 1
end

function ShowFuseBoxWidget( f1026_arg0 )
	local f1026_local0 = Engine.GetModel( Engine.GetModelForController( f1026_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_FUSES )
	return f1026_local0 and Engine.GetModelValue( f1026_local0 ) == 1
end

function ShowEggWidget( f1027_arg0 )
	local f1027_local0 = Engine.GetModel( Engine.GetModelForController( f1027_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_EGG )
	return f1027_local0 and Engine.GetModelValue( f1027_local0 ) == 1
end

function ShowSprayerWidget( f1028_arg0 )
	local f1028_local0 = Engine.GetModel( Engine.GetModelForController( f1028_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_SPRAYER )
	return f1028_local0 and Engine.GetModelValue( f1028_local0 ) == 1
end

function QuestEggInState( f1029_arg0, f1029_arg1 )
	if CoD.Zombie[f1029_arg1] then
		local f1029_local0 = Engine.GetModel( Engine.GetModelForController( f1029_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_EGG_STATE )
		return f1029_local0 and Engine.GetModelValue( f1029_local0 ) == CoD.Zombie[f1029_arg1]
	else
		
	end
end

function QuestEggQuest1Complete( f1030_arg0 )
	local f1030_local0 = Engine.GetModel( Engine.GetModelForController( f1030_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_COMPLETED_LEVEL_1 )
	return f1030_local0 and Engine.GetModelValue( f1030_local0 ) == 1
end

function ShowTrialsCompletedWidgetStalingrad( f1031_arg0 )
	local f1031_local0 = IsModelValueGreaterThan( f1031_arg0, "trialWidget.challenge1state", 0 )
	if not f1031_local0 then
		f1031_local0 = IsModelValueGreaterThan( f1031_arg0, "trialWidget.challenge2state", 0 )
		if not f1031_local0 then
			f1031_local0 = IsModelValueGreaterThan( f1031_arg0, "trialWidget.challenge3state", 0 )
		end
	end
	return f1031_local0
end

function IsGenesisEECompleted( f1032_arg0 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f1032_arg0 ), "GenesisEndGameEE" ) == 1
end

function ChatClientShow( f1033_arg0 )
	return CoD.isPC
end

function ChatClientEnabled( f1034_arg0 )
	return ChatClientShow( f1034_arg0 ) and Dvar.chatClientEnabled:get() == true
end

function ChatClientIsAvailable( f1035_arg0, f1035_arg1, f1035_arg2 )
	return ChatClientEnabled( f1035_arg2 ) and Engine.ChatClient_IsAvailable( f1035_arg2 )
end

function ChatClientIsChatting( f1036_arg0 )
	return ChatClientEnabled( f1036_arg0 ) and Engine.ChatClient_IsChatting( f1036_arg0 )
end

function ChatClientAnySubMenuOpen( f1037_arg0 )
	if not ChatClientShow( f1037_arg0 ) then
		return false
	end
	local f1037_local0 = false
	local f1037_local1 = CoD.ChatClientUtility.GetMenuInputChannelShowModel()
	if f1037_local1 ~= nil then
		f1037_local0 = Engine.GetModelValue( f1037_local1 ) > 0
	end
	if not f1037_local0 then
		f1037_local1 = CoD.ChatClientUtility.GetMenuSettingsShowModel()
		if f1037_local1 ~= nil then
			f1037_local0 = Engine.GetModelValue( f1037_local1 ) > 0
		end
	end
	return f1037_local0
end

function CharacterCustomization_IsEnabled( f1038_arg0 )
	if LuaUtils.IsGamescomBuild() or Dvar.ui_execdemo_beta:get() then
		return false
	else
		return true
	end
end

function IsArabicSku()
	if CoD.isPC then
		if Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_ENGLISHARABIC ) or Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_ARABIC ) then
			return true
		end
	elseif Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_ENGLISHARABIC ) and Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_ARABIC ) then
		return true
	end
	return false
end

function IsChineseSku()
	if CoD.isPC then
		if Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_TRADITIONALCHINESE ) or Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_SIMPLIFIEDCHINESE ) then
			return true
		end
	elseif Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_TRADITIONALCHINESE ) and Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_SIMPLIFIEDCHINESE ) then
		return true
	end
	return false
end

function IsJapaneseSku()
	if CoD.isPC then
		if Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_FULLJAPANESE ) or Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_JAPANESE ) then
			return true
		end
	elseif Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_FULLJAPANESE ) and Engine.IsLanguageSupportedInSKU( CoD.LANGUAGE_JAPANESE ) then
		return true
	end
	return false
end

function IsCurrentLanguageEnglish()
	local f1042_local0 = Dvar.loc_language:get()
	if f1042_local0 == CoD.LANGUAGE_ENGLISH or f1042_local0 == CoD.LANGUAGE_ENGLISHARABIC then
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

function IsCurrentLanguageFrench()
	if Dvar.loc_language:get() == CoD.LANGUAGE_FRENCH then
		return true
	else
		return false
	end
end

function IsCurrentLanguageJapanese()
	if Dvar.loc_language:get() == CoD.LANGUAGE_JAPANESE then
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

function IsCurrentLanguageReversed()
	return Engine.IsCurrentLanguageReversed()
end

function FeaturedCards_IsEnabled( f1049_arg0, f1049_arg1 )
	local f1049_local0 = LobbyData.GetLobbyNav()
	if f1049_local0 ~= LobbyData.UITargets.UI_MODESELECT.id and f1049_local0 ~= LobbyData.UITargets.UI_MPLOBBYMAIN.id and f1049_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		return false
	else
		local f1049_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true ), "Enabled", true ) )
		if HasLiveEvent( f1049_arg1 ) then
			return true
		elseif f1049_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
			return true
		elseif Dvar.ui_enableZMHDFeaturedCard:get() == 1 or Dvar.ui_enableZMHDFeaturedCard:get() == "1" then
			return true
		else
			local f1049_local2 = Engine.GetFeaturedCardsData()
			if Dvar.live_featuredEnabled:get() == false or f1049_local2.enabled == false then
				return false
			elseif f1049_local2.validCardsCount == 0 then
				return false
			else
				return true
			end
		end
	end
end

function ConnectionMeter_isEnabled( f1050_arg0, f1050_arg1 )
	if Dvar.ui_enableConnectionMetricGraphs:get() == 0 then
		return false
	elseif Engine.ProfileInt( f1050_arg1, "showConnectionMeter" ) ~= 1 then
		return false
	else
		return true
	end
end

function HighestMapReachedGreaterThan( f1051_arg0, f1051_arg1 )
	local f1051_local0 = CoD.GetPlayerStats( f1051_arg0 )
	local f1051_local1 = f1051_local0
	local f1051_local2 = f1051_local0.highestMapReached
	if f1051_local2 then
		f1051_local2 = f1051_local1 and f1051_local0.highestMapReached:get()
	end
	local f1051_local3
	if f1051_local2 == nil or f1051_arg1 >= f1051_local2 then
		f1051_local3 = false
	else
		f1051_local3 = true
	end
	return f1051_local3
end

function MissionRecordMapComplete( f1052_arg0, f1052_arg1 )
	if Engine.GetDStat( f1052_arg1, "PlayerStatsByMap", Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo.mapId" ) ), "hasBeenCompleted" ) == 1 then
		return true
	else
		return false
	end
end

function IsGameInstalled()
	local f1053_local0
	if not Engine.IsCpStillDownloading() then
		f1053_local0 = not Engine.IsMpStillDownloading()
	else
		f1053_local0 = false
	end
	return f1053_local0
end

function IsGameModeInstalled( f1054_arg0, f1054_arg1 )
	if f1054_arg1 == Enum.eModes.MODE_CAMPAIGN then
		return Engine.IsCpStillDownloading() == false
	elseif f1054_arg1 == Enum.eModes.MODE_MULTIPLAYER then
		return Engine.IsMpStillDownloading() == false
	elseif f1054_arg1 == Enum.eModes.MODE_ZOMBIES then
		return Engine.IsZmStillDownloading() == false
	else
		return false
	end
end

function PlayGoIsStillDownloading( f1055_arg0 )
	if CoD.isPC then
		return false
	elseif Engine.IsMpStillDownloading() or Engine.IsMpInitialStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsZmInitialStillDownloading() then
		return true
	else
		return false
	end
end

function ShouldShowCampaignResetOption( f1056_arg0 )
	return f1056_arg0 == Engine.GetPrimaryController()
end

function ZMDoubleXPWidgetVisible( f1057_arg0 )
	local f1057_local0 = IsZombies()
	if f1057_local0 then
		if not IsLAN() then
			if IsModelValueEqualTo( f1057_arg0, "doubleXPTimeRemaining", 0 ) then
				f1057_local0 = IsZMDoubleXPWeekend( f1057_arg0 )
			else
				f1057_local0 = true
			end
		else
			f1057_local0 = false
		end
	end
	return f1057_local0
end

function IsZMDoubleXPWeekend( f1058_arg0 )
	if Engine.IsInGame() then
		return Engine.IsDoubleXPWeekend( f1058_arg0 ) and IsDoubleXP( f1058_arg0 )
	end
	local f1058_local0 = Engine.GetPlaylistInfoByID( 150 )
	local f1058_local1 = LuaUtils.PlaylistRulesIncludes( f1058_local0, "xpGroups group_party2" )
	local f1058_local2 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f1058_local2 = Enum.LobbyModule.LOBBY_MODULE_HOST
	end
	local f1058_local3 = Engine.GetLobbyClientCount( f1058_local2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
	local f1058_local4 = Engine.GetLobbyClientCount( f1058_local2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_GUEST )
	local f1058_local5 = LuaUtils.PlaylistRulesIncludes( f1058_local0, "scr_xpscalezm 2" )
	if f1058_local5 then
		if f1058_local1 and f1058_local3 - f1058_local4 < 2 then
			f1058_local5 = false
		else
			f1058_local5 = true
		end
	end
	return f1058_local5
end

function IsZMDoubleVialActive( f1059_arg0 )
	if Engine.DvarBool( nil, "communityChallengeBonusAllowed" ) then
		if Engine.IsInGame() then
			return Engine.GetZMVialScale( f1059_arg0 ) > 1
		elseif Engine.CheckDoubleXPGroup( f1059_arg0, CoD.XPGROUPS.DOUBLEXP_GROUP_PARTY6 ) then
			return LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( 150 ), "scr_vialsAwardedScale 2.0" )
		else
			return false
		end
	elseif Engine.IsInGame() then
		return Engine.GetZMVialScale( f1059_arg0 ) > 1
	else
		return LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( 150 ), "scr_vialsAwardedScale 2.0" )
	end
end

function IsZMDoubleWeaponXP( f1060_arg0 )
	if Engine.IsInGame() then
		return IsDoubleWeaponXP( f1060_arg0 )
	else
		return LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( 150 ), "scr_gunxpscalezm 2" )
	end
end

function IsZMFreeGumPerRoundActive( f1061_arg0 )
	if Engine.IsInGame() then
		return Engine.DvarBool( f1061_arg0, "scr_firstGumFree" )
	else
		return LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( 150 ), "scr_firstGumFree 1" )
	end
end

function IsLiquidDiviniumSaleActive( f1062_arg0 )
	return Engine.DvarFloat( "loot_ld_salePercentOff" ) > 0
end

function IsLiquidDiviniumMegaBundleActive( f1063_arg0 )
	return Engine.DvarBool( nil, "loot_ld_mega_bundle_enabled" )
end

function IsLiquidDiviniumUltraRarePromoActive( f1064_arg0 )
	return Engine.DvarBool( nil, "loot_ld_ultra_rare_enabled" )
end

function IsUltraRareMegaGobblegumPromoActive( f1065_arg0 )
	if Engine.DvarBool( nil, "loot_ld_urm_gobblegum_enabled" ) then
		return Engine.GetInventoryItemQuantity( f1065_arg0, Engine.DvarInt( nil, "loot_ld_urm_purchase_sku" ) ) == 0
	else
		return false
	end
end

function ShouldShowLiquidDiviniumPromoBanner( f1066_arg0 )
	local f1066_local0 = AreCodPointsEnabled( f1066_arg0 )
	if f1066_local0 then
		f1066_local0 = IsLiquidDiviniumSaleActive( f1066_arg0 )
		if not f1066_local0 then
			f1066_local0 = IsLiquidDiviniumUltraRarePromoActive( f1066_arg0 )
			if not f1066_local0 then
				f1066_local0 = IsUltraRareMegaGobblegumPromoActive( f1066_arg0 )
				if not f1066_local0 then
					f1066_local0 = IsLiquidDiviniumMegaBundleActive( f1066_arg0 )
				end
			end
		end
	end
	return f1066_local0
end

function IsDistillCODPointsSaleActive( f1067_arg0 )
	return Engine.DvarFloat( "loot_distill_salePercentOff" ) > 0
end

function IsDistillLDSaleActive( f1068_arg0 )
	return Engine.DvarFloat( "ld_distill_salePercentOff" ) > 0
end

function EnableCombatRecordCompare( f1069_arg0 )
	return true
end

function IsCPCombatRecordLockedForSocialPlayerInfo( f1070_arg0, f1070_arg1 )
	local f1070_local0 = f1070_arg1:getModel( f1070_arg0, "cpRank" )
	if f1070_local0 then
		local f1070_local1 = Engine.GetModelValue( f1070_local0 )
		if f1070_local1 then
			return f1070_local1 < 1
		end
	end
	return false
end

function IsMPCombatRecordLockedForSocialPlayerInfo( f1071_arg0, f1071_arg1 )
	local f1071_local0 = 7
	local f1071_local1 = f1071_arg1:getModel( f1071_arg0, "mpRank" )
	local f1071_local2 = f1071_arg1:getModel( f1071_arg0, "mpPrestige" )
	if f1071_local1 and f1071_local2 then
		local f1071_local3 = Engine.GetModelValue( f1071_local1 )
		local f1071_local4 = Engine.GetModelValue( f1071_local2 )
		if f1071_local3 and f1071_local4 then
			local f1071_local5
			if f1071_local3 >= f1071_local0 or f1071_local4 >= 1 then
				f1071_local5 = false
			else
				f1071_local5 = true
			end
			return f1071_local5
		end
	end
	return false
end

function IsZMCombatRecordLockedForSocialPlayerInfo( f1072_arg0, f1072_arg1 )
	local f1072_local0 = 2
	local f1072_local1 = f1072_arg1:getModel( f1072_arg0, "zmRank" )
	local f1072_local2 = f1072_arg1:getModel( f1072_arg0, "zmPrestige" )
	if f1072_local1 and f1072_local2 then
		local f1072_local3 = Engine.GetModelValue( f1072_local1 )
		local f1072_local4 = Engine.GetModelValue( f1072_local2 )
		if f1072_local3 and f1072_local4 then
			local f1072_local5
			if f1072_local3 >= f1072_local0 or f1072_local4 >= 1 then
				f1072_local5 = false
			else
				f1072_local5 = true
			end
			return f1072_local5
		end
	end
	return false
end

function IsCampaignCombatRecordMode()
	return CoD.GetCombatRecordMode() == Enum.eModes.MODE_CAMPAIGN
end

function IsMultiplayerCombatRecordMode()
	return CoD.GetCombatRecordMode() == Enum.eModes.MODE_MULTIPLAYER
end

function IsZombiesCombatRecordMode()
	return CoD.GetCombatRecordMode() == Enum.eModes.MODE_ZOMBIES
end

function IsComparingStats( f1076_arg0 )
	local f1076_local0 = Engine.GetModel( Engine.GetModelForController( f1076_arg0 ), "CombatRecordComparing" )
	if not f1076_local0 or not Engine.GetModelValue( f1076_local0 ) then
		return false
	else
		local f1076_local1 = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" )
		if not f1076_local1 or Engine.GetModelValue( f1076_local1 ) then
			return false
		else
			local f1076_local2 = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" )
			if not f1076_local2 or not Engine.GetModelValue( f1076_local2 ) then
				return false
			else
				return true
			end
		end
	end
end

function IsCombatRecordForRemotePlayer()
	return CoD.CombatRecordOtherPlayerStats
end

function CombatRecordProfileSnapshotShouldShowSnapshot( f1078_arg0 )
	local f1078_local0 = DataSources.CombatRecordProfileSnapshot.getModel( f1078_arg0 )
	if f1078_local0 and CoD.SafeGetModelValue( f1078_local0, "fileId" ) ~= Engine.DefaultID64Value() then
		return true
	else
		return false
	end
end

function IsStorageValueAtLeast( f1079_arg0, f1079_arg1, f1079_arg2, f1079_arg3 )
	local f1079_local0 = CoD.SafeGetModelValue( DataSources.StorageGlobal.getModel( f1079_arg0 ), f1079_arg1 )
	if f1079_local0 then
		local f1079_local1 = StorageLookup( f1079_arg0, f1079_arg2, f1079_local0 )
		return f1079_local1 and f1079_arg3 <= tonumber( f1079_local1 )
	else
		return false
	end
end

function IsStorageValueEqualTo( f1080_arg0, f1080_arg1, f1080_arg2, f1080_arg3 )
	local f1080_local0 = CoD.SafeGetModelValue( DataSources.StorageGlobal.getModel( f1080_arg0 ), f1080_arg1 )
	if f1080_local0 then
		local f1080_local1 = StorageLookup( f1080_arg0, f1080_arg2, f1080_local0 )
		return f1080_local1 and tonumber( f1080_local1 ) == f1080_arg3
	else
		return false
	end
end

function CanOpenTwitch( f1081_arg0 )
	return false
end

function HasLiveEvent( f1082_arg0 )
	local f1082_local0 = CoD.SafeGetModelValue( DataSources.LiveEventViewer.getModel( f1082_arg0 ), "stream" )
	return f1082_local0 and f1082_local0 ~= ""
end

function IsMLGStream( f1083_arg0 )
	local f1083_local0 = CoD.SafeGetModelValue( DataSources.LiveEventViewer.getModel( f1083_arg0 ), "stream" )
	return f1083_local0 and LUI.startswith( f1083_local0, "mlg/" )
end

function HasLiveEventStreamQualities()
	local f1084_local0 = CoD.SafeGetModelValue( DataSources.LiveEventViewer.getModel(), "currentQuality" )
	return f1084_local0 and f1084_local0 ~= ""
end

function ElementHasText( f1085_arg0, f1085_arg1 )
	if f1085_arg0[f1085_arg1] and f1085_arg0[f1085_arg1].getText then
		local f1085_local0 = f1085_arg0[f1085_arg1]:getText()
		local f1085_local1 = f1085_local0
		local f1085_local2
		if f1085_local0 == "" or f1085_local0 == Engine.Localize( "" ) then
			f1085_local2 = false
		else
			f1085_local2 = f1085_local1 and true
		end
		return f1085_local2
	else
		
	end
end

function IsNotLobbyGameHostOrNotPrimaryController( f1086_arg0 )
	local f1086_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1086_local1 = Engine.GetPrimaryController() == f1086_arg0
	local f1086_local2
	if f1086_local0 then
		f1086_local2 = not f1086_local1
	else
		f1086_local2 = true
	end
	return f1086_local2
end

function DoesPlayerHaveExtraSlotsItem( f1087_arg0 )
	return Engine.GetInventoryItemQuantity( f1087_arg0, tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( CoD.StoreUtility.ExtraSlotsProductDesc, CoD.StoreUtility.InventoryItems.itemIdColumn ) ) ) > 0
end

function DoesPlayerHaveEsportsPackItem( f1088_arg0, f1088_arg1 )
	if IsPerControllerTablePropertyValue( f1088_arg1, "selectedStoreCategory", "ESPORTS" ) or IsPerControllerTablePropertyValue( f1088_arg1, "selectedStoreCategory", "EXTRAPACKS" ) then
		local f1088_local0 = f1088_arg0:getModel( f1088_arg1, "skuID" )
		if f1088_local0 then
			return Engine.GetInventoryItemQuantity( f1088_arg1, Engine.GetModelValue( f1088_local0 ) ) > 0
		end
	end
	return false
end

function DoesPlayerHaveExtraPackItem( f1089_arg0, f1089_arg1 )
	if IsPerControllerTablePropertyValue( f1089_arg1, "selectedStoreCategory", "EXTRAPACKS" ) then
		local f1089_local0 = f1089_arg0:getModel( f1089_arg1, "skuID" )
		if f1089_local0 then
			return Engine.GetInventoryItemQuantity( f1089_arg1, Engine.GetModelValue( f1089_local0 ) ) > 0
		end
	end
	return false
end

function DoesPlayerHaveOutfitItem( f1090_arg0, f1090_arg1 )
	if IsPerControllerTablePropertyValue( f1090_arg1, "selectedStoreCategory", "OUTFITS" ) then
		local f1090_local0 = f1090_arg0:getModel( f1090_arg1, "skuID" )
		if f1090_local0 then
			local f1090_local1 = tonumber( Engine.GetModelValue( f1090_local0 ) )
			for f1090_local6, f1090_local7 in ipairs( CoD.BlackMarketUtility.UniqueSpecialistOutfits ) do
				if f1090_local7.skuId == f1090_local1 or f1090_local7.skuContractId == f1090_local1 then
					local f1090_local5
					if Engine.GetInventoryItemQuantity( f1090_arg1, f1090_local7.bodyId ) <= 0 and Engine.GetInventoryItemQuantity( f1090_arg1, f1090_local7.contractId ) <= 0 then
						f1090_local5 = false
					else
						f1090_local5 = true
					end
					return f1090_local5
				end
			end
		end
	end
	return false
end

function ShouldShowLobbyEE()
	local f1091_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f1091_local1 = IsZombies()
	if f1091_local1 then
		if f1091_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id and f1091_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
			f1091_local1 = false
		else
			f1091_local1 = true
		end
	end
	return f1091_local1
end

function ShouldDeselectAllTracks( f1092_arg0 )
	local f1092_local0 = DataSources.MusicTracksBase.getCurrentFilterTotalSelectedModel( f1092_arg0 )
	local f1092_local1 = DataSources.MusicTracksBase.getCurrentFilterTotalCountModel( f1092_arg0 )
	return f1092_local1 and f1092_local0 and Engine.GetModelValue( f1092_local1 ) <= Engine.GetModelValue( f1092_local0 )
end

function IsSpecialContractAvailable( f1093_arg0, f1093_arg1, f1093_arg2 )
	if IsSelfModelValueTrue( f1093_arg1, f1093_arg2, "isGroupButton" ) then
		return true
	else
		local f1093_local0
		if not IsSelfModelValueTrue( f1093_arg1, f1093_arg2, "isComplete" ) then
			f1093_local0 = not IsControllerModelValueEqualToSelfModelValue( f1093_arg1, f1093_arg2, "CurrentSpecialContract.index", "index" )
		else
			f1093_local0 = false
		end
	end
	return f1093_local0
end

function IsSpecialContractActive( f1094_arg0, f1094_arg1, f1094_arg2 )
	if IsSelfModelValueTrue( f1094_arg1, f1094_arg2, "isGroupButton" ) and IsModelValueTrue( f1094_arg2, "CurrentSpecialContract.isComplete" ) then
		return false
	else
		return IsControllerModelValueEqualToSelfModelValue( f1094_arg1, f1094_arg2, "CurrentSpecialContract.index", "index" )
	end
end

function IsViewingSpecialContractCallingCardSet( f1095_arg0 )
	for f1095_local3, f1095_local4 in ipairs( CoD.ChallengesUtility.SpecialContractCategories ) do
		if f1095_local4 == CoD.perController[f1095_arg0].BlackMarketUtility_CurrentCallingCardSetName then
			return true
		end
	end
	return false
end

function IsShowcaseWeaponClassified( f1096_arg0, f1096_arg1, f1096_arg2 )
	if IsCACItemContractLocked( f1096_arg1, f1096_arg2 ) then
		return true
	else
		return IsSelfModelValueTrue( f1096_arg1, f1096_arg2, "isBMClassified" )
	end
end

function IsSpecialContractTimerActive( f1097_arg0, f1097_arg1, f1097_arg2 )
	local f1097_local0 = ""
	local f1097_local1 = f1097_arg1:getModel( f1097_arg2, "activeDvar" )
	if f1097_local1 then
		f1097_local0 = Engine.GetModelValue( f1097_local1 )
	end
	local f1097_local2
	if f1097_local0 ~= "" then
		f1097_local2 = Engine.DvarBool( nil, f1097_local0 )
	else
		f1097_local2 = false
	end
	return f1097_local2
end

function IsSpecialContractHidden( f1098_arg0, f1098_arg1, f1098_arg2 )
	if IsSelfModelValueTrue( f1098_arg1, f1098_arg2, "isComplete" ) or IsControllerModelValueEqualToSelfModelValue( f1098_arg1, f1098_arg2, "CurrentSpecialContract.index", "index" ) then
		return false
	else
		return IsSpecialContractTimerActive( f1098_arg0, f1098_arg1, f1098_arg2 )
	end
end

function ShouldShowGunMeter( f1099_arg0, f1099_arg1 )
	if Dvar.tu27_showGunMeter:get() and not CoD.BlackMarketUtility.NoGunMeter[CoD.perController[f1099_arg1].supplyDropType] then
		return true
	else
		return false
	end
end

function ShowPrivacySettingsButton( f1100_arg0 )
	if IsBooleanDvarSet( "live_useRegulation" ) and not Engine.IsUserGuest( f1100_arg0 ) and not IsInGame() and Engine.SessionModeIsMode( CoD.SESSIONMODE_ONLINE ) then
		if #Engine.GetUserRegulationPreference( f1100_arg0 ) > 0 then
			return true
		elseif #Engine.GetRegulations( f1100_arg0 ) > 0 then
			return true
		end
	end
	return false
end

function IsOnLastPrivacySettingsDescPage( f1101_arg0 )
	local f1101_local0 = DataSources.PrivacySettingManagementForm.getModel( f1101_arg0 )
	local f1101_local1 = tonumber( Engine.GetModelValue( Engine.GetModel( f1101_local0, "currentPage" ) ) ) or 0
	local f1101_local2 = tonumber( Engine.GetModelValue( Engine.GetModel( f1101_local0, "lastPage" ) ) ) or 0
	local f1101_local3
	if f1101_local2 > 1 and f1101_local2 > f1101_local1 then
		f1101_local3 = false
	else
		f1101_local3 = true
	end
	return f1101_local3
end

