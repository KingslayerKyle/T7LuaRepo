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

function FileshareIsDetailsViewHiddenMode( f59_arg0 )
	return FileshareGetDetailsHiddenMode( f59_arg0 )
end

function FileshareDetailsViewAreArrowsHidden( f60_arg0 )
	local f60_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f60_local0 == "favorites" or f60_local0 == "featured" or f60_local0 == "recent" then
		return true
	else
		return FileshareIsDetailsViewHiddenMode( f60_arg0 )
	end
end

function FileshareDetailsViewCanMoveToNext( f61_arg0 )
	local f61_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f61_local0 == "favorites" or f61_local0 == "featured" or f61_local0 == "recent" then
		return false
	else
		local f61_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
		if f61_local1 and f61_local1 ~= CoD.FileshareUtility.GetItemsCount() - 1 then
			return true
		else
			return false
		end
	end
end

function FileshareDetailsViewCanMoveToPrevious( f62_arg0 )
	local f62_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f62_local0 == "favorites" or f62_local0 == "featured" or f62_local0 == "recent" then
		return false
	else
		local f62_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
		if f62_local1 and f62_local1 ~= 0 then
			return true
		else
			return false
		end
	end
end

function IsCustomGameCommunityOption()
	local f63_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "communityOption" ) )
	local f63_local1
	if f63_local0 == nil or f63_local0 == false then
		f63_local1 = false
	else
		f63_local1 = true
	end
	return f63_local1
end

function IsInCustomGames()
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "inCustomGames" ) ) == 1
end

function CustomGamesSlotsAvailable( f65_arg0, f65_arg1 )
	local f65_local0 = MediaManagerGetQuotaForCategory( f65_arg1, "customgame" )
	return f65_local0.categorySlotsAvailable > 0
end

function ShouldOpenMessageDialog( f66_arg0, f66_arg1 )
	if f66_arg0:getParent() == nil then
		return 
	end
	local f66_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f66_local0 ~= nil then
		if not CoD.isFrontend then
			local f66_local1 = Engine.GetModel( f66_local0, "controller" )
			if f66_local1 ~= nil and Engine.GetModelValue( f66_local1 ) ~= f66_arg1 then
				return false
			end
		end
		local f66_local1 = Engine.GetModel( f66_local0, "messagePending" )
		if f66_local1 ~= nil and Engine.GetModelValue( f66_local1 ) > 0 then
			return true
		end
	end
	return false
end

function IsLuaCodeVersionAtLeast( f67_arg0 )
	return f67_arg0 <= Engine.GetLuaCodeVersion()
end

function IsInDefaultState( f68_arg0 )
	return f68_arg0.currentState == "DefaultState"
end

function IsInDefaultStateOrStateNotSet( f69_arg0 )
	if not f69_arg0.currentState then
		return true
	else
		return f69_arg0.currentState == "DefaultState"
	end
end

function IsElementInState( f70_arg0, f70_arg1 )
	return f70_arg0.currentState == f70_arg1
end

function IsElementInAnyState( f71_arg0, ... )
	for f71_local3, f71_local4 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		if IsElementInState( f71_arg0, f71_local4 ) then
			return true
		end
	end
	return false
end

function IsChildElementInState( f72_arg0, f72_arg1, f72_arg2 )
	return f72_arg0[f72_arg1].currentState == f72_arg2
end

function IsMenuInState( f73_arg0, f73_arg1 )
	return f73_arg0.currentState == f73_arg1
end

function IsMenuModelValueEqualTo( f74_arg0, f74_arg1, f74_arg2 )
	local f74_local0 = f74_arg0:getModel()
	if f74_arg1 ~= "" and f74_local0 then
		f74_local0 = Engine.GetModel( f74_local0, f74_arg1 )
	end
	local f74_local1 = f74_local0 and Engine.GetModelValue( f74_local0 )
	local f74_local2
	if f74_local1 == nil or f74_local1 ~= f74_arg2 then
		f74_local2 = false
	else
		f74_local2 = true
	end
	return f74_local2
end

function IsSelfInState( f75_arg0, f75_arg1 )
	return f75_arg0.currentState == f75_arg1
end

function ShouldSwapCircleAndCross()
	return Engine.ShouldSwapCircleAndCross()
end

function IsWidthZero( f77_arg0 )
	return f77_arg0 == 0
end

function InSafehouseOrFrontend()
	local f78_local0 = CoD.isSafehouse
	if not f78_local0 then
		f78_local0 = CoD.isFrontend
	end
	return f78_local0
end

function InFrontend()
	return CoD.isFrontend
end

function InSafehouse()
	return CoD.isSafehouse
end

function IsFirstListElement( f81_arg0 )
	return f81_arg0:isFirstItem()
end

function IsLastListElement( f82_arg0 )
	return f82_arg0:isLastItem()
end

function IsListAtStart( f83_arg0, f83_arg1, f83_arg2 )
	local f83_local0 = f83_arg0[f83_arg1]
	if f83_local0 and f83_local0.activeWidget and (not f83_arg2 or not f83_arg2.list or f83_arg2.list == f83_local0) then
		return f83_local0.activeWidget:isFirstItem()
	else
		return false
	end
end

function IsListAtEnd( f84_arg0, f84_arg1, f84_arg2 )
	local f84_local0 = f84_arg0[f84_arg1]
	if f84_local0 and f84_local0.activeWidget and (not f84_arg2 or not f84_arg2.list or f84_arg2.list == f84_local0) then
		return f84_local0.activeWidget:isLastItem()
	else
		return false
	end
end

function ListElementHasElements( f85_arg0, f85_arg1 )
	local f85_local0 = f85_arg0[f85_arg1]
	if f85_local0 then
		local f85_local1 = f85_local0:getDataSource()
		if f85_local1 then
			return f85_local1.getCount( f85_local0 ) > 0
		end
	end
	return false
end

function ListHasElements( f86_arg0 )
	if f86_arg0.gridInfoTable then
		local f86_local0 = f86_arg0.gridInfoTable.parentGrid
		local f86_local1 = f86_local0:getDataSource()
		if f86_local1 then
			return f86_local1.getCount( f86_local0 ) > 0
		end
	end
	return false
end

function ListLoopEdgesEnabled( f87_arg0, f87_arg1 )
	local f87_local0 = f87_arg0[f87_arg1]
	if f87_local0 then
		return f87_local0.loopEdges
	else
		return false
	end
end

function HasListAction( f88_arg0, f88_arg1 )
	return f88_arg0:getModel( f88_arg1, "action" ) or f88_arg0.action
end

function IsElementInFocus( f89_arg0 )
	return f89_arg0:isInFocus()
end

function isClientListSlideFocus( f90_arg0, f90_arg1, f90_arg2, f90_arg3 )
	if not CoD.isPC then
		return IsWidgetInFocus( f90_arg0, f90_arg1, f90_arg2 )
	elseif f90_arg0.defaultNav and f90_arg0.defaultNav == "right" and IsWidgetInFocus( f90_arg0, f90_arg1, f90_arg2 ) then
		return true
	end
	return IsGamepad( f90_arg3 ) and IsWidgetInFocus( f90_arg0, f90_arg1, f90_arg2 )
end

function IsWidgetInFocus( f91_arg0, f91_arg1, f91_arg2 )
	if f91_arg0[f91_arg1] then
		if f91_arg2.idStack then
			local f91_local0 = f91_arg0[f91_arg1].id
			for f91_local4, f91_local5 in ipairs( f91_arg2.idStack ) do
				if f91_local5 == f91_local0 then
					return true
				end
			end
			return false
		elseif f91_arg2.id then
			return f91_arg0[f91_arg1]:hasChildWithID( f91_arg2.id )
		else
			return f91_arg0[f91_arg1]:doesElementOrChildHaveFocus()
		end
	else
		return false
	end
end

function IsFirstTimeSetup( f92_arg0, f92_arg1 )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	elseif not (not Engine.IsMultiplayerGame() or not IsLAN()) or Engine.IsInGame() then
		return false
	else
		return not Engine.IsFirstTimeComplete( f92_arg0, f92_arg1 )
	end
end

function IsMainFirstTimeSetup( f93_arg0 )
	if IsInGame() then
		return false
	elseif f93_arg0 > 0 then
		return false
	elseif Dvar.livestats_skipFirstTime:get() then
		return false
	else
		return Engine.GetProfileVarInt( f93_arg0, "com_first_time" ) ~= 0
	end
end

function TestAndSetFirstTimeMenu( f94_arg0, f94_arg1 )
	if Engine.GetProfileVarInt( f94_arg0, f94_arg1 ) == 0 then
		SetProfileVar( f94_arg0, f94_arg1, 1 )
		return true
	else
		
	end
end

function GrayOutReplayMissionButton( f95_arg0 )
	return false
end

function GrayOutMissionOverviewButton( f96_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
	if not modelValue or modelValue == "" then
		return true
	else
		
	end
end

function IsBooleanDvarSet( f97_arg0 )
	if Dvar[f97_arg0] then
		return Dvar[f97_arg0]:get() == true
	else
		return false
	end
end

function IsIntDvarNonZero( f98_arg0 )
	if Engine.DvarInt( nil, f98_arg0 ) ~= 0 then
		return true
	else
		return false
	end
end

function IsNumberDvarGreaterThanOrEqualTo( f99_arg0, f99_arg1 )
	if Dvar[f99_arg0] then
		local f99_local0 = Dvar[f99_arg0]:get()
		if type( f99_local0 ) == "number" and type( f99_arg1 ) == "number" then
			return f99_arg1 <= f99_local0
		end
	end
	return false
end

function IsDvarValueEqualTo( f100_arg0, f100_arg1 )
	if Dvar[f100_arg0] then
		return Dvar[f100_arg0]:get() == f100_arg1
	else
		return false
	end
end

function IsInGame()
	return Engine.IsInGame()
end

function GameEnded( f102_arg0 )
	return IsVisibilityBitSet( f102_arg0, Enum.UIVisibilityBit.BIT_GAME_ENDED )
end

function IsCurrentMenu( f103_arg0, f103_arg1 )
	if f103_arg0.menuName == f103_arg1 then
		return true
	else
		return false
	end
end

function PropertyIsTrue( f104_arg0, f104_arg1 )
	if f104_arg0 == nil then
		return false
	else
		return f104_arg0[f104_arg1] == true
	end
end

function IsElementPropertyValue( f105_arg0, f105_arg1, f105_arg2 )
	if f105_arg0 == nil then
		return false
	else
		return f105_arg0[f105_arg1] == f105_arg2
	end
end

function IsElementPropertyEnumValue( f106_arg0, f106_arg1, f106_arg2 )
	if f106_arg0 == nil then
		return false
	else
		return f106_arg0[f106_arg1] == f106_arg2
	end
end

function HasProperty( f107_arg0, f107_arg1 )
	if f107_arg0 == nil then
		return false
	else
		return f107_arg0[f107_arg1] ~= nil
	end
end

function ParentPropertyIsTrue( f108_arg0, f108_arg1 )
	if f108_arg0 == nil or f108_arg0:getParent() == nil then
		return false
	else
		local f108_local0 = f108_arg0:getParent()
		return f108_local0[f108_arg1] == true
	end
end

function IsPerControllerTablePropertyValue( f109_arg0, f109_arg1, f109_arg2 )
	return CoD.perController[f109_arg0][f109_arg1] == f109_arg2
end

function IsPerControllerTablePropertyEnumValue( f110_arg0, f110_arg1, f110_arg2 )
	return CoD.perController[f110_arg0][f110_arg1] == f110_arg2
end

function IsPerControllerTablePropertyEitherEnumValue( f111_arg0, f111_arg1, f111_arg2, f111_arg3 )
	local f111_local0
	if CoD.perController[f111_arg0][f111_arg1] ~= f111_arg2 and CoD.perController[f111_arg0][f111_arg1] ~= f111_arg3 then
		f111_local0 = false
	else
		f111_local0 = true
	end
	return f111_local0
end

function IsActiveLocalClientsCountEqualTo( f112_arg0 )
	return Engine.GetActiveLocalClientsCount() == f112_arg0
end

function IsTextWrapping( f113_arg0, f113_arg1 )
	if f113_arg1 == nil then
		return false
	else
		local f113_local0, f113_local1, f113_local2, f113_local3 = f113_arg1:getLocalLeftRight()
		local f113_local4 = f113_local3 - f113_local2
		local f113_local5, f113_local6 = f113_arg1:getTextWidthAndHeight()
		return f113_local4 < f113_local5
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
	local f118_local0 = Dvar.groups_enabled:get()
	if f118_local0 ~= nil and f118_local0 == true and not IsInGame() then
		return true
	else
		return false
	end
end

function IsGroupsBeta()
	return Engine.DvarBool( nil, "tu10_groupsBetaTag" )
end

function FetchingGroupPublicProfiles( f120_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f120_arg0 ), "groups.fetchGroupProfilesInProgress" ) )
end

function FetchingGroupInvitesInfo( f121_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f121_arg0 ), "groups.fetchGroupInvitesInProgress" ) )
	if not modelValue then
		modelValue = FetchingGroupPublicProfiles( f121_arg0 )
	end
	return modelValue
end

function FilteringGroupFriends( f122_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f122_arg0 ), "groups.filterGroupFriendsInProgress" ) )
end

function HideGroupInviteSummary( f123_arg0, f123_arg1 )
	local f123_local0
	if HasSelectedGroup( f123_arg0, f123_arg1 ) then
		f123_local0 = FetchingGroupInvitesInfo( f123_arg1 )
	else
		f123_local0 = true
	end
	return f123_local0
end

function HideGroupSummaryIfListEmpty( f124_arg0, f124_arg1, f124_arg2 )
	local f124_local0 = f124_arg0:findSibling( f124_arg2 )
	local f124_local1
	if HasSelectedGroup( f124_arg0, f124_arg1 ) then
		f124_local1 = FetchingGroupPublicProfiles( f124_arg1 )
		if not f124_local1 then
			local f124_local2 = f124_local0
			f124_local1 = not ListHasElements( f124_local0 )
		end
	else
		f124_local1 = f124_local2 and true
	end
	return f124_local1
end

function SelectingGroupEmblem( f125_arg0 )
	return CoD.perController[f125_arg0].selectingGroupEmblem
end

function SelectingGroupEmblemForGroupCreation( f126_arg0 )
	return CoD.perController[f126_arg0].selectingGroupEmblemForGroupCreation
end

function IsReadyUpVisible( f127_arg0, f127_arg1 )
	if IsGlobalModelValueEqualTo( f127_arg0, f127_arg1, "lobbyRoot.lobbyNav", LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id ) or IsGlobalModelValueEqualTo( f127_arg0, f127_arg1, "lobbyRoot.lobbyNav", LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id ) then
		return true
	else
		return false
	end
end

function ShouldOpenGroupAdminOptionsPopupForGroupMember( f128_arg0, f128_arg1 )
	local f128_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f128_arg1 ), "Social.selectedFriendXUID" ) )
	local f128_local1 = f128_local0 == Engine.GetXUID64( f128_arg1 )
	local f128_local2 = FetchGroupMembersResultsLoading( f128_arg1 )
	local f128_local3 = HasAdminPrivilege( f128_arg1, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_MEMBERS )
	if not f128_local3 then
		f128_local3 = HasAdminPrivilege( f128_arg1, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_BAN_MEMBERS )
		if not f128_local3 then
			f128_local3 = HasAdminPrivilege( f128_arg1, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_MANAGE_ADMINS )
		end
	end
	if f128_local3 and not f128_local1 and not f128_local2 and not IsGroupOwner( f128_arg1, f128_local0 ) then
		return true
	else
		
	end
end

function ShouldOpenGroupOptionsPopup( f129_arg0, f129_arg1 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f129_arg1 ), "groups.grouphqtabname" ) ) == "overview"
end

function CheckSelectedAdminPrivilege( f130_arg0, f130_arg1 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f130_arg0 ), "groups.currentAdminPrivileges" ) ) & 1 << f130_arg1 ~= 0
end

function IsGroupDataDirty( f131_arg0, f131_arg1 )
	return CoD.perController[f131_arg0].groupsDataDirty and CoD.perController[f131_arg0].groupsDataDirty[f131_arg1]
end

function HasAdminPrivilege( f132_arg0, f132_arg1 )
	local f132_local0 = f132_arg1
	if CoD.perController[f132_arg0].selectedGroup then
		local f132_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f132_arg0].selectedGroup, "groupId" ) )
		local f132_local2 = IsGroupOwner( f132_arg0 )
		if not f132_local2 then
			f132_local2 = Engine.GroupAdminHasPrivilege( f132_arg0, f132_local1, f132_local0 )
		end
		return f132_local2
	else
		return false
	end
end

function HasNoJoinRequests( f133_arg0 )
	if Engine.GetSelectedGroupApplicationsCount( f133_arg0 ) == 0 then
		return true
	else
		
	end
end

function IsGroupMemberFromElement( f134_arg0, f134_arg1 )
	if not f134_arg0:getModel() or not f134_arg0:getModel( f134_arg1, "groupId" ) then
		return false
	end
	local f134_local0 = Engine.GetModelValue( f134_arg0:getModel( f134_arg1, "groupId" ) )
	for f134_local4, f134_local5 in ipairs( Engine.GetGroupList( f134_arg1, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF ) ) do
		if f134_local5.groupId == f134_local0 then
			return true
		end
	end
end

function IsGroupMember( f135_arg0, f135_arg1 )
	local f135_local0 = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_INVALID
	if CoD.perController[f135_arg0].selectedGroup then
		local f135_local1 = Engine.GetXUID64( f135_arg0 )
		if f135_arg1 then
			f135_local1 = f135_arg1
		end
		f135_local0 = Engine.GetSelectedGroupMemberStatus( f135_arg0, f135_local1 )
	end
	local f135_local1
	if f135_local0 ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_MEMBER and f135_local0 ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN and f135_local0 ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER then
		f135_local1 = false
	else
		f135_local1 = true
	end
	return f135_local1
end

function IsGroupAdmin( f136_arg0, f136_arg1 )
	local f136_local0 = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_INVALID
	if CoD.perController[f136_arg0].selectedGroup then
		local f136_local1 = Engine.GetXUID64( f136_arg0 )
		if f136_arg1 then
			f136_local1 = f136_arg1
		end
		f136_local0 = Engine.GetSelectedGroupMemberStatus( f136_arg0, f136_local1 )
	end
	return f136_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN
end

function IsGroupOwner( f137_arg0, f137_arg1 )
	local f137_local0 = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_INVALID
	if CoD.perController[f137_arg0].selectedGroup then
		local f137_local1 = Engine.GetXUID64( f137_arg0 )
		if f137_arg1 then
			f137_local1 = f137_arg1
		end
		f137_local0 = Engine.GetSelectedGroupMemberStatus( f137_arg0, f137_local1 )
	end
	return f137_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER
end

function HasNoGroupAdmin( f138_arg0 )
	if Engine.GetSelectedGroupAdminsCount( f138_arg0 ) == 0 then
		return true
	else
		
	end
end

function HasNoGroupBannedMembers( f139_arg0 )
	if Engine.GetSelectedGroupBannedMembersCount( f139_arg0 ) == 0 then
		return true
	else
		
	end
end

function IsGroupListHeader( f140_arg0 )
	return f140_arg0.type == "header"
end

function DoesGroupListHaveSelectedIcon( f141_arg0 )
	local f141_local0
	if f141_arg0.showSelectedIcon == nil or f141_arg0.showSelectedIcon ~= true then
		f141_local0 = false
	else
		f141_local0 = true
	end
	return f141_local0
end

function IsProcessingGroupTask( f142_arg0 )
	local modelValue = Engine.GetModelValue( GetProcessingGroupTaskModel( f142_arg0 ) )
	local f142_local1
	if modelValue == nil or modelValue ~= true then
		f142_local1 = false
	else
		f142_local1 = true
	end
	return f142_local1
end

function CloseGroupsNotifyPopupAutomaticallyAfterEvent( f143_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f143_arg0 ), "groups.closeAutomaticallyAfterEvent" ) )
end

function SearchGroupResultsLoading( f144_arg0, f144_arg1 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f144_arg1 ), "groups.searchGroupsInProgress" ) )
end

function FetchGroupMembersResultsLoading( f145_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f145_arg0 ), "groups.fetchGroupMembersInProgress" ) )
end

function FetchGroupApplicationsResultsLoading( f146_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f146_arg0 ), "groups.fetchGroupApplicationsInProgress" ) )
end

function IsGroupEmblemEmpty( f147_arg0, f147_arg1 )
	local f147_local0 = nil
	if CoD.perController[f147_arg1].selectedGroup then
		f147_local0 = Engine.GetModel( CoD.perController[f147_arg1].selectedGroup, "groupId" )
	else
		f147_local0 = f147_arg0:getModel( f147_arg1, "groupId" )
	end
	if f147_local0 ~= nil then
		local f147_local1 = Engine.GetModelValue( f147_local0 )
		if f147_local1 ~= nil then
			return Engine.IsGroupEmblemEmpty( f147_arg1, f147_local1 )
		end
	end
	return true
end

function HasSelectedGroup( f148_arg0, f148_arg1 )
	return f148_arg0:getModel() and f148_arg0:getModel( f148_arg1, "groupId" )
end

function HideGroupSummary( f149_arg0, f149_arg1 )
	local f149_local0 = SearchGroupResultsLoading( f149_arg0, f149_arg1 )
	if not f149_local0 then
		f149_local0 = not HasSelectedGroup( f149_arg0, f149_arg1 )
	end
	return f149_local0
end

function CanSendGroupInvites( f150_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f150_arg0 ), "Social.selectedFriendXUID" ) )
	if Engine.GetLuaCodeVersion() >= 22 then
		return Engine.CanSendGroupInvites( f150_arg0, modelValue )
	else
		return Engine.CanSendGroupInvites( f150_arg0 )
	end
end

function HasPendingInvites( f151_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f151_arg0 ), "groups" ), "inviteCount" ) )
	local f151_local1
	if modelValue == nil or modelValue <= 0 then
		f151_local1 = false
	else
		f151_local1 = true
	end
	return f151_local1
end

function IsMemberOfAnyGroup( f152_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f152_arg0 ), "groups" ), "groupCount_self" ) )
	local f152_local1
	if modelValue == nil or modelValue <= 0 then
		f152_local1 = false
	else
		f152_local1 = true
	end
	return f152_local1
end

function IsGroupLeaderboardAvailable()
	local f153_local0, f153_local1, f153_local2, f153_local3, f153_local4, f153_local5 = Engine.GetGroupLeaderboardInfo()
	local f153_local6
	if f153_local5 ~= true or f153_local0 == nil or f153_local0 == "" then
		f153_local6 = false
	else
		f153_local6 = true
	end
	return f153_local6
end

function IsLeaderboardUpdating()
	local f154_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "isUpdating" ) )
	local f154_local1
	if f154_local0 == nil or f154_local0 ~= true then
		f154_local1 = false
	else
		f154_local1 = true
	end
	return f154_local1
end

function IsLeaderboardEmpty()
	local f155_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
	local f155_local1
	if f155_local0 ~= nil and f155_local0 ~= 0 then
		f155_local1 = false
	else
		f155_local1 = true
	end
	return f155_local1
end

function IsGroupLeaderboardMakerState( f156_arg0, f156_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f156_arg0 ), "groups" ), "leaderboardmaker" ), "state" ) ) == f156_arg1
end

function LeaderboardsDownForMaintanence()
	return Engine.DvarBool( nil, "dw_lbMaintanence" )
end

function IsLobbyLeaderboard( f158_arg0 )
	return CoD.perController[f158_arg0].isInLobbyLeaderboard == true
end

function IsFreerunLeaderboard( f159_arg0 )
	local f159_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f159_local0 then
		return false
	else
		return Engine.GetModelValue( f159_local0 ) == "freerun"
	end
end

function IsZMMapsLeaderboard( f160_arg0 )
	local f160_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f160_local0 then
		return false
	else
		return Engine.GetModelValue( f160_local0 ) == "zm_maps"
	end
end

function IsDOALeaderboard( f161_arg0 )
	local f161_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f161_local0 then
		return false
	else
		return Engine.GetModelValue( f161_local0 ) == "doa"
	end
end

function IsCustomLeaderboard( f162_arg0 )
	local f162_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f162_local0 then
		return false
	else
		return Engine.GetModelValue( f162_local0 ) == "custom"
	end
end

function IsCustomLeaderboardTab( f163_arg0, f163_arg1, f163_arg2 )
	return CoD.perController[f163_arg2].selectedLeaderboardTabId == "leaderboard_mp_custom"
end

function IsMPGameModeLeaderboard( f164_arg0 )
	local f164_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
	if not f164_local0 then
		return false
	else
		return string.sub( Engine.GetModelValue( f164_local0 ), 1, string.len( "LB_MP_GM_" ) ) == "LB_MP_GM_"
	end
end

function IsPlayerAGuest( f165_arg0 )
	return Engine.IsUserGuest( f165_arg0 )
end

function IsPlayerAllowedToPlayOnline( f166_arg0 )
	if Engine.IsPlusAuthorized( f166_arg0 ) == false then
		return false
	else
		return true
	end
end

function IsOutOfBounds( f167_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f167_arg0 ), "hudItems.outOfBoundsEndTime" ) )
	local f167_local1 = Engine.CurrentGameTime()
	if f167_local1 == nil then
		return false
	elseif modelValue == nil then
		return false
	elseif CoD.SafeGetModelValue( Engine.GetModelForController( f167_arg0 ), "displayTop3Players" ) == 1 then
		return false
	else
		return f167_local1 < modelValue
	end
end

function IsEnemyDetected( f168_arg0, f168_arg1, f168_arg2 )
	local f168_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f168_arg0 ), "hudItems.sixthsense" ) )
	local f168_local1 = 0
	if f168_local0 == nil then
		return false
	elseif f168_arg2 == nil or f168_arg2 == "" then
		f168_arg2 = "far"
	end
	local f168_local2 = 1
	if f168_arg2 == "close" then
		f168_local2 = 16
	end
	if f168_arg1 == "front" then
		f168_local1 = f168_local2 << 0
	elseif f168_arg1 == "back" then
		f168_local1 = f168_local2 << 1
	elseif f168_arg1 == "left" then
		f168_local1 = f168_local2 << 2
	elseif f168_arg1 == "right" then
		f168_local1 = f168_local2 << 3
	end
	return f168_local0 & f168_local1 ~= 0
end

function HidePersonalizePrompt( f169_arg0 )
	local f169_local0
	if not CoD.isPC or IsGamepad( f169_arg0 ) then
		f169_local0 = Dvar.ui_execdemo_gamescom:get()
	else
		f169_local0 = true
	end
	return f169_local0
end

function CACShowSelectPrompt( f170_arg0, f170_arg1, f170_arg2 )
	local f170_local0 = f170_arg1:getModel()
	local f170_local1 = f170_local0 and Engine.GetModel( f170_local0, "weaponSlot" )
	local f170_local2 = f170_local1 and Engine.GetModelValue( f170_local1 )
	if f170_local2 == nil or f170_arg2 == nil then
		return false
	else
		local f170_local3 = CoD.perController[f170_arg2].classModel
		if not (not LUI.startswith( f170_local2, "primarygadgetattachment" ) or CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f170_arg2 ) ~= "" or not CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f170_arg2 ) ~= "") or not (f170_local2 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f170_arg2 ) ~= "") or not (f170_local2 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f170_arg2 ) ~= "") or not (f170_local2 ~= "specialty6" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f170_arg2 ) ~= "") or not (f170_local2 ~= "secondaryattachment3" or CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f170_arg2 ) ~= "") or not (f170_local2 ~= "primaryattachment4" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f170_local3 ) ~= 0) or not (f170_local2 ~= "primaryattachment5" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f170_local3 ) > 1) or not (f170_local2 ~= "primaryattachment6" or CoD.CACUtility.PrimaryGunfighterEquippedCount( f170_local3 ) > 2) or not (not LUI.startswith( f170_local2, "primaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "primary", f170_arg2, f170_local3 )) or not (not LUI.startswith( f170_local2, "secondaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "secondary", f170_arg2, f170_local3 ) and CoD.CACUtility.DoesWeaponHaveAnyAttachments( "secondary", f170_arg2, f170_local3 )) or LUI.startswith( f170_local2, "secondarygadgetattachment" ) and not CoD.CACUtility.ItemEquippedInSlot( "secondarygadget", f170_arg2, f170_local3 ) then
			local f170_local4, f170_local5, f170_local6 = CoD.CACUtility.GetCACSlotStatus( f170_arg2, f170_local3, f170_local2 )
			if f170_local4 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD and not IsElementInState( f170_arg1, "NotVisible" ) then
				return true
			else
				return false
			end
		else
			return true
		end
	end
end

function CACShowRemovePrompt( f171_arg0, f171_arg1 )
	local f171_local0 = f171_arg1:getModel()
	local f171_local1 = f171_local0 and Engine.GetModel( f171_local0, "itemIndex" )
	local f171_local2 = f171_local1 and Engine.GetModelValue( f171_local1 )
	if Engine.IsCampaignGame() then
		local f171_local3 = f171_local0 and Engine.GetModel( f171_local0, "weaponSlot" )
		local f171_local4 = f171_local3 and Engine.GetModelValue( f171_local3 )
		if f171_local4 == "primary" or f171_local4 == "secondary" then
			return false
		end
	end
	if f171_local2 ~= nil and f171_local2 > CoD.CACUtility.EmptyItemIndex then
		return true
	end
end

function CACShowRotatePrompt( f172_arg0, f172_arg1, f172_arg2 )
	local f172_local0 = f172_arg1:getModel()
	local f172_local1 = f172_local0 and Engine.GetModel( f172_local0, "weaponSlot" )
	local f172_local2 = f172_local1 and Engine.GetModelValue( f172_local1 )
	if f172_local2 == nil then
		local f172_local3 = f172_local0 and CoD.SafeGetModelValue( f172_local0, "itemIndex" )
		local f172_local4
		if f172_local3 == nil or f172_local3 <= 0 then
			f172_local4 = false
		else
			f172_local4 = true
		end
		return f172_local4
	elseif CACShowRemovePrompt( f172_arg0, f172_arg1 ) then
		return true
	end
	local f172_local3 = CACShowSelectPrompt( f172_arg0, f172_arg1, f172_arg2 )
	if f172_local3 then
		f172_local3 = LUI.startswith( f172_local2, "primaryattachment" )
		if not f172_local3 then
			f172_local3 = LUI.startswith( f172_local2, "secondaryattachment" )
		end
	end
	return f172_local3
end

function IsCACCustomClassCountDefault( f173_arg0 )
	return Engine.GetCustomClassCount( f173_arg0 ) == CoD.CACUtility.defaultCustomClassCount
end

function IsCACClassSetsCountDefault( f174_arg0 )
	return Engine.GetNumberOfClassSetsOwned( f174_arg0 ) == 1
end

function ShowCACExtraClassBreadcrumb( f175_arg0 )
	if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f175_arg0 ) then
		local f175_local0 = Engine.StorageGetBuffer( f175_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f175_local0 then
			return f175_local0.extraBools[0]:get() == 0
		end
	end
	return false
end

function IsCACSlotOvercapacity2by1AspectRatio( f176_arg0 )
	local f176_local0 = f176_arg0:getModel()
	if f176_local0 then
		local f176_local1 = Engine.GetModel( f176_local0, "itemSlot" )
		if f176_local1 then
			local f176_local2 = Engine.GetModelValue( f176_local1 )
			local f176_local3
			if f176_local2 ~= "primary" and f176_local2 ~= "secondary" then
				f176_local3 = false
			else
				f176_local3 = true
			end
			return f176_local3
		end
	end
	return false
end

function IsCACSlotOvercapacityWildcard( f177_arg0 )
	local f177_local0 = f177_arg0:getModel()
	if f177_local0 then
		local f177_local1 = Engine.GetModel( f177_local0, "itemSlot" )
		if f177_local1 then
			return LUI.startswith( Engine.GetModelValue( f177_local1 ), "bonuscard" )
		end
	end
	return false
end

function IsCACContextualWildcardOpen( f178_arg0 )
	if CoD.perController[f178_arg0].CACWildcardContextualMenu and not IsInPermanentUnlockMenu( f178_arg0 ) then
		return true
	else
		return false
	end
end

function IsCACCategoryWeapon( f179_arg0 )
	local f179_local0
	if CoD.perController[f179_arg0].weaponCategory ~= "primary" and CoD.perController[f179_arg0].weaponCategory ~= "secondary" then
		f179_local0 = false
	else
		f179_local0 = true
	end
	return f179_local0
end

function IsCACSlot2by1AspectRatio( f180_arg0 )
	local f180_local0 = f180_arg0:getModel()
	if f180_local0 then
		local f180_local1 = Engine.GetModel( f180_local0, "weaponSlot" )
		if f180_local1 then
			local f180_local2 = Engine.GetModelValue( f180_local1 )
			local f180_local3
			if f180_local2 ~= "primary" and f180_local2 ~= "secondary" then
				f180_local3 = false
			else
				f180_local3 = true
			end
			return f180_local3
		end
	end
	return false
end

function IsCACSlotInfopane2by1AspectRatio( f181_arg0 )
	local f181_local0 = f181_arg0:getModel()
	if f181_local0 then
		local f181_local1 = Engine.GetModel( f181_local0, "weaponSlot" )
		if f181_local1 then
			local f181_local2 = Engine.GetModelValue( f181_local1 )
			local f181_local3
			if f181_local2 ~= "primary" and f181_local2 ~= "secondary" then
				f181_local3 = LUI.startswith( f181_local2, "primaryattachment" )
				if not f181_local3 then
					f181_local3 = LUI.startswith( f181_local2, "secondaryattachment" )
				end
			else
				f181_local3 = true
			end
			return f181_local3
		end
	end
	return false
end

function IsCACItemBubbleGum( f182_arg0, f182_arg1, f182_arg2 )
	local f182_local0 = f182_arg1:getModel()
	if f182_local0 then
		local f182_local1 = Engine.GetModel( f182_local0, "itemIndex" )
		if f182_local1 and LuaUtils.FindItemInArray( CoD.CACUtility.BGBBuffGroups, Engine.GetItemGroup( Engine.GetModelValue( f182_local1 ), CoD.PrestigeUtility.GetPermanentUnlockMode() ) ) then
			return true
		end
	end
	return false
end

function IsCACItemConsumable( f183_arg0, f183_arg1, f183_arg2 )
	local f183_local0 = f183_arg1:getModel()
	if f183_local0 then
		local f183_local1 = Engine.GetModel( f183_local0, "itemIndex" )
		if f183_local1 then
			return CoD.CACUtility.IsItemConsumable( Engine.GetModelValue( f183_local1 ) )
		end
	end
	return false
end

function DoesCACItemHaveConsumablesRemaining( f184_arg0, f184_arg1, f184_arg2 )
	if not IsCACItemConsumable( f184_arg0, f184_arg1, f184_arg2 ) then
		return true
	end
	local f184_local0 = f184_arg1:getModel()
	if f184_local0 then
		local f184_local1 = Engine.GetModel( f184_local0, "itemIndex" )
		if f184_local1 then
			return GetConsumableCountFromIndex( f184_arg2, Engine.GetModelValue( f184_local1 ) ) > 0
		end
	end
	return false
end

function IsCACItemFromDLC( f185_arg0, f185_arg1, f185_arg2 )
	local f185_local0 = f185_arg1:getModel()
	if f185_local0 then
		local f185_local1 = Engine.GetModel( f185_local0, "dlcIndex" )
		if not f185_local1 then
			return false
		else
			return Engine.GetModelValue( f185_local1 ) > CoD.CONTENT_DLCZM0_INDEX
		end
	else
		return false
	end
end

function IsCACItemDLCPurchased( f186_arg0, f186_arg1, f186_arg2 )
	local f186_local0 = f186_arg1:getModel()
	if f186_local0 then
		local f186_local1 = Engine.GetModel( f186_local0, "dlcIndex" )
		if not f186_local1 then
			return false
		else
			local f186_local2 = Engine.GetModelValue( f186_local1 )
			if not f186_local2 or f186_local2 < CoD.CONTENT_DLC1_INDEX then
				return true
			else
				return Engine.HasEntitlementByOwnership( f186_arg2, "dlc" .. f186_local2 - CoD.CONTENT_DLCZM0_INDEX )
			end
		end
	else
		return false
	end
end

function IsCACItemContractLocked( f187_arg0, f187_arg1 )
	local f187_local0 = CoD.SafeGetModelValue( f187_arg0:getModel(), "ref" )
	if f187_local0 and CoD.ContractWeaponTiers[f187_local0] then
		return not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f187_local0] )
	else
		return false
	end
end

function IsCACItemEquipped( f188_arg0, f188_arg1, f188_arg2 )
	local f188_local0 = CoD.perController[f188_arg2].weaponCategory
	if LuaUtils.FindItemInArray( CoD.CACUtility.BGBBuffGroups, f188_local0 ) then
		return IsBubbleGumBuffEquipped( f188_arg0, f188_arg1, f188_arg2 )
	end
	local f188_local1 = CoD.CACUtility.GetSlotListWithSlot( f188_local0 )
	local f188_local2 = f188_arg1:getModel()
	if f188_local2 then
		local f188_local3 = Engine.GetModel( f188_local2, "itemIndex" )
		local f188_local4 = Engine.GetModel( f188_local2, "upgradeItemIndex" )
		local f188_local5 = f188_local3
		if f188_local4 and IsCACItemUpgraded( f188_arg0, f188_arg1, f188_arg2 ) then
			f188_local5 = f188_local4
		end
		if f188_local5 then
			local f188_local6 = Engine.GetModelValue( f188_local5 )
			for f188_local10, f188_local11 in ipairs( f188_local1 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f188_local11, f188_arg2 ) == f188_local6 then
					return true
				end
			end
		end
	end
	return false
end

function IsBubbleGumType( f189_arg0, f189_arg1, f189_arg2 )
	local f189_local0 = f189_arg0 and CoD.SafeGetModelValue( f189_arg0:getModel(), "itemIndex" )
	if f189_local0 then
		local f189_local1 = Engine.TableLookup( f189_arg1, "gamedata/stats/zm/zm_statsTable.csv", 0, f189_local0, 20 )
		if f189_local1 then
			return f189_arg2 == f189_local1
		end
	end
	return false
end

function IsCACWildcardEquipped( f190_arg0, f190_arg1, f190_arg2 )
	local f190_local0 = CoD.CACUtility.GetSlotListWithSlot( CoD.perController[f190_arg2].weaponCategory )
	local f190_local1 = f190_arg1:getModel()
	if f190_local1 then
		local f190_local2 = Engine.GetModel( f190_local1, "itemIndex" )
		if f190_local2 then
			local f190_local3 = Engine.GetModelValue( f190_local2 )
			for f190_local7, f190_local8 in ipairs( f190_local0 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f190_local8, f190_arg2 ) == f190_local3 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACWeaponEquippedForSlot( f191_arg0, f191_arg1, f191_arg2, f191_arg3 )
	local f191_local0 = f191_arg1:getModel( f191_arg2, "itemIndex" )
	local f191_local1 = f191_arg0:getModel()
	if f191_local0 then
		local f191_local2 = Engine.GetModel( f191_local1, f191_arg3 .. ".itemIndex" )
		if f191_local2 then
			local f191_local3 = Engine.GetModelValue( f191_local2 )
			local f191_local4 = Engine.GetModelValue( f191_local0 )
			local f191_local5 = Engine.GetAttachmentRef( f191_local3, f191_local4 )
			if f191_local4 > CoD.CACUtility.EmptyItemIndex then
				return true
			end
		end
	end
	return false
end

function IsCACCustomizationReticleAttachmentItemEquipped( f192_arg0, f192_arg1, f192_arg2, f192_arg3 )
	local f192_local0 = f192_arg1:getModel( f192_arg2, "itemIndex" )
	local f192_local1 = f192_arg0:getModel()
	if f192_local0 then
		local f192_local2 = Engine.GetModel( f192_local1, f192_arg3 .. ".itemIndex" )
		if f192_local2 then
			local f192_local3 = Engine.GetModelValue( f192_local2 )
			local f192_local4 = Engine.GetModelValue( f192_local0 )
			local f192_local5 = Engine.GetAttachmentRef( f192_local3, f192_local4 )
			if f192_local4 > CoD.CACUtility.EmptyItemIndex then
				return CoD.CACUtility.attachmentsWithCustReticle[f192_local5]
			end
		end
	end
	return false
end

function IsCACCustomizationDWAttachmentItemEquipped( f193_arg0, f193_arg1, f193_arg2 )
	local f193_local0 = f193_arg1:getModel( f193_arg2, "itemIndex" )
	local f193_local1 = CoD.SafeGetModelValue( f193_arg1:getModel(), "weaponSlot" )
	local f193_local2 = f193_local1 and CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f193_local1 )
	local f193_local3 = f193_arg0:getModel()
	if f193_local2 and f193_local0 then
		local f193_local4 = Engine.GetModel( f193_local3, f193_local2 .. ".itemIndex" )
		if f193_local4 then
			local f193_local5 = Engine.GetModelValue( f193_local4 )
			local f193_local6 = Engine.GetModelValue( f193_local0 )
			local f193_local7 = Engine.GetAttachmentRef( f193_local5, f193_local6 )
			if f193_local6 > CoD.CACUtility.EmptyItemIndex then
				return f193_local7 == "dw"
			end
		end
	end
	return false
end

function IsCACWeaponVariantEquipped( f194_arg0, f194_arg1, f194_arg2, f194_arg3 )
	if not Gunsmith_IsEnabled( f194_arg2, f194_arg3 ) then
		return false
	else
		local f194_local0 = f194_arg0:getModel()
		local f194_local1 = CoD.perController[f194_arg3].weaponCategory
		local f194_local2 = f194_arg1:getModel()
		return CoD.CACUtility.IsVariantEquippedToClass( f194_local0, f194_local1, CoD.SafeGetModelValue( f194_local2, "weaponItemIndex" ), CoD.SafeGetModelValue( f194_local2, "cacVariantIndex" ) )
	end
end

function IsSpecialContractCamo( f195_arg0, f195_arg1 )
	local f195_local0 = f195_arg0:getModel()
	if CoD.SafeGetModelValue( f195_local0, "weaponOptionTypeName" ) ~= "camo" then
		return false
	end
	local f195_local1 = Engine.TableLookup( f195_arg1, CoD.attachmentTable, 0, CoD.SafeGetModelValue( f195_local0, "itemIndex" ), 1, "camo", 22 )
	local f195_local2
	if f195_local1 == nil or f195_local1 == "" then
		f195_local2 = false
	else
		f195_local2 = true
	end
	return f195_local2
end

function ShouldHideClassifiedDescription( f196_arg0, f196_arg1 )
	local f196_local0 = f196_arg0:getModel()
	if not CoD.SafeGetModelValue( f196_local0, "isBMClassified" ) then
		return true
	else
		return CoD.BlackMarketUtility.IsLimitedEditionCamoBundleItem( CoD.SafeGetModelValue( f196_local0, "ref" ) )
	end
end

function ShouldHideClassifiedLimitedEditionCamoDescription( f197_arg0, f197_arg1 )
	local f197_local0 = f197_arg0:getModel()
	if not CoD.SafeGetModelValue( f197_local0, "isBMClassified" ) then
		return true
	else
		return not CoD.BlackMarketUtility.IsLimitedEditionCamoBundleItem( CoD.SafeGetModelValue( f197_local0, "ref" ) )
	end
end

function IsCACItemNew( f198_arg0, f198_arg1 )
	if not IsProgressionEnabled( f198_arg1 ) then
		return false
	end
	local f198_local0 = f198_arg0:getModel( f198_arg1, "itemIndex" )
	if f198_local0 then
		local f198_local1 = Engine.GetModelValue( f198_local0 )
		local f198_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if f198_local1 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( f198_arg1, f198_local1, f198_local2 )
		end
	end
	return false
end

function IsCACAttachmentNew( f199_arg0, f199_arg1, f199_arg2 )
	if not IsProgressionEnabled( f199_arg2 ) then
		return false
	end
	local f199_local0 = CoD.perController[f199_arg2].weaponCategory
	local f199_local1 = f199_arg1:getModel( f199_arg2, "itemIndex" )
	local f199_local2 = f199_arg0:getModel()
	if f199_local1 then
		local f199_local3 = "primary"
		if LUI.startswith( f199_local0, "secondaryattachment" ) then
			f199_local3 = "secondary"
		end
		local f199_local4 = Engine.GetModel( f199_local2, f199_local3 .. ".itemIndex" )
		if f199_local4 then
			return Engine.IsAttachmentNew( f199_arg2, Engine.GetModelValue( f199_local4 ), Engine.GetModelValue( f199_local1 ) )
		end
	end
	return false
end

function IsSpecialistNew( f200_arg0, f200_arg1, f200_arg2 )
	if not IsProgressionEnabled( f200_arg2 ) then
		return false
	end
	local f200_local0 = Engine.GetModelValue( f200_arg0:getModel( f200_arg2, "heroIndex" ) )
	local f200_local1 = Engine.CurrentSessionMode()
	if f200_local0 then
		local f200_local2 = Engine.GetLoadoutItemIndexForHero( f200_local1, f200_local0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		if f200_local2 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( f200_arg2, f200_local2 )
		end
	end
	return false
end

function IsCACAnyLoadoutSlotNew( f201_arg0, f201_arg1 )
	if not IsProgressionEnabled( f201_arg1 ) then
		return false
	else
		local f201_local0 = f201_arg0:getModel( f201_arg1, "weaponSlot" )
		if f201_local0 then
			local f201_local1 = Engine.GetModelValue( f201_local0 )
			if f201_local1 == "primarygadget" and CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", CoD.perController[f201_arg1].classModel ) then
				return false
			else
				return Engine.IsLoadoutSlotNew( f201_arg1, f201_local1 )
			end
		else
			return false
		end
	end
end

function IsCACSpecificLoadoutSlotNew( f202_arg0, f202_arg1, f202_arg2 )
	if not IsProgressionEnabled( f202_arg1 ) then
		return false
	else
		local f202_local0 = f202_arg0:getModel( f202_arg1, f202_arg2 .. ".weaponSlot" )
		if f202_local0 then
			return Engine.IsLoadoutSlotNew( f202_arg1, Engine.GetModelValue( f202_local0 ) )
		else
			return false
		end
	end
end

function ShouldDisplayWeaponGroupBreadcrumbCount( f203_arg0, f203_arg1 )
	if not IsProgressionEnabled( f203_arg1 ) then
		return false
	elseif IsInPermanentUnlockMenu( f203_arg1 ) then
		return false
	else
		local f203_local0 = f203_arg0:getModel( f203_arg1, "breadcrumbCount" )
		if f203_local0 then
			return Engine.GetModelValue( f203_local0 ) > 0
		else
			return false
		end
	end
end

function IsCACAnyOpticsNew( f204_arg0, f204_arg1, f204_arg2 )
	if not IsProgressionEnabled( f204_arg1 ) then
		return false
	else
		local f204_local0 = f204_arg0:getModel( f204_arg1, f204_arg2 .. ".itemindex" )
		if f204_local0 then
			return Engine.AreAnyOpticsNew( f204_arg1, Engine.GetModelValue( f204_local0 ) )
		else
			return false
		end
	end
end

function IsCACAnyAttachmentsNew( f205_arg0, f205_arg1, f205_arg2 )
	if not IsProgressionEnabled( f205_arg1 ) then
		return false
	else
		local f205_local0 = f205_arg0:getModel( f205_arg1, f205_arg2 .. ".itemindex" )
		if f205_local0 then
			return Engine.AreAnyNonOpticAttachmentsNew( f205_arg1, Engine.GetModelValue( f205_local0 ) )
		else
			return false
		end
	end
end

function IsCACAnythingInCACItemNew( f206_arg0 )
	if IsProgressionEnabled( f206_arg0 ) and Engine.IsAnythingInCACNew( f206_arg0 ) then
		return true
	elseif ShowCACExtraClassBreadcrumb( f206_arg0 ) then
		return true
	else
		return false
	end
end

function IsCACAnyScorestreaksNew( f207_arg0 )
	if not IsProgressionEnabled( f207_arg0 ) then
		return false
	else
		return Engine.WeaponGroupHasNewItem( f207_arg0, "killstreak" )
	end
end

function IsCACAnySpecialistsNew( f208_arg0 )
	if IsProgressionEnabled( f208_arg0 ) then
		if Engine.IsLoadoutSlotNew( f208_arg0, "herogadget" ) or Engine.IsLoadoutSlotNew( f208_arg0, "heroweapon" ) then
			return true
		elseif Engine.AreAnyCharacterCustomizationItemsNew( f208_arg0 ) then
			return true
		end
		local f208_local0 = Engine.CurrentSessionMode()
		local f208_local1 = Engine.GetHeroList( f208_local0 )
		for f208_local2 = 0, #f208_local1 - 1, 1 do
			local f208_local5 = Engine.GetHeroBundleInfo( f208_local0, f208_local2 )
			if CoD.CCUtility.GetTauntsAndGesturesNewCount( f208_arg0, f208_local2, f208_local5, f208_local0 ) > 0 then
				return true
			elseif CoD.CCUtility.GetTransmissionNewCount( f208_arg0, f208_local2, f208_local5 ) > 0 then
				return true
			end
		end
	end
	return false
end

function IsCACAnyPersonalizationOptionNew( f209_arg0, f209_arg1, f209_arg2, f209_arg3 )
	if not IsProgressionEnabled( f209_arg3 ) then
		return false
	elseif f209_arg0.menuName ~= "CustomClass" then
		return false
	end
	local f209_local0 = f209_arg1:getModel()
	if f209_local0 then
		local f209_local1 = CoD.SafeGetModelValue( f209_local0, "weaponSlot" )
		local f209_local2 = CoD.SafeGetModelValue( f209_local0, "itemIndex" )
		local f209_local3 = CoD.SafeGetModelValue( f209_local0, "attachmentIndex" )
		local f209_local4 = CoD.SafeGetModelValue( f209_local0, "weaponIndex" )
		if f209_local1 then
			if f209_local2 and f209_local2 > CoD.CACUtility.EmptyItemIndex and (f209_local1 == "primary" or f209_local1 == "secondary") then
				return Engine.IsWeaponOptionGroupNew( f209_arg3, f209_local2, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
			elseif f209_local3 and f209_local3 > CoD.CACUtility.EmptyItemIndex and (f209_local1 == "primaryattachment1" or f209_local1 == "secondaryattachment1") then
				return Engine.IsWeaponOptionGroupNew( f209_arg3, f209_local3, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE )
			elseif f209_local2 and f209_local2 > CoD.CACUtility.EmptyItemIndex and (LUI.startswith( f209_local1, "primaryattachment" ) or LUI.startswith( f209_local1, "secondaryattachment" )) then
				return Engine.IsAnyACVItemNew( f209_arg3, f209_local4, f209_local3, Engine.CurrentSessionMode() )
			end
		end
	end
	return false
end

function IsCACAnyCamoNew( f210_arg0, f210_arg1 )
	if not IsProgressionEnabled( f210_arg1 ) then
		return false
	elseif f210_arg0.isCamo == true and f210_arg0.weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		return Engine.IsWeaponOptionGroupNew( f210_arg1, f210_arg0.weaponItemIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
	else
		return false
	end
end

function IsCACAnyBubblegumNew( f211_arg0 )
	if not IsProgressionEnabled( f211_arg0 ) then
		return false
	end
	for f211_local3, f211_local4 in ipairs( CoD.CACUtility.BGBBuffGroups ) do
		if Engine.WeaponGroupHasNewItem( f211_arg0, f211_local4 ) then
			return true
		end
	end
	return false
end

function IsCACItemPurchased( f212_arg0, f212_arg1 )
	if not (not IsZombies() or CoD.PrestigeUtility.isInPermanentUnlockMenu) or not IsProgressionEnabled( f212_arg1 ) then
		return true
	end
	local f212_local0 = nil
	local f212_local1 = f212_arg0.itemIndex
	if not f212_local1 then
		f212_local0 = f212_arg0:getModel( f212_arg1, "itemIndex" )
		if f212_local0 then
			f212_local1 = Engine.GetModelValue( f212_local0 )
		end
	end
	if f212_local1 then
		return Engine.IsItemPurchased( f212_arg1, f212_local1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	end
	return false
end

function ShouldShowTokenIconOnItem( f213_arg0, f213_arg1, f213_arg2 )
	if Engine.IsZombiesGame() then
		return false
	else
		local f213_local0
		if not IsCACItemLocked( f213_arg0, f213_arg1, f213_arg2 ) and not IsCACItemPurchased( f213_arg1, f213_arg2 ) then
			f213_local0 = not IsCurrentMenuAttachmentMenu( f213_arg0 )
		else
			f213_local0 = false
		end
	end
	if Engine.IsCampaignGame() and not f213_local0 then
		f213_local0 = IsCACItemUpgradable( f213_arg0, f213_arg1, f213_arg2 )
	end
	return f213_local0
end

function IsCACItemUpgraded( f214_arg0, f214_arg1, f214_arg2 )
	if IsCACItemLocked( f214_arg0, f214_arg1, f214_arg2 ) then
		return false
	end
	local f214_local0 = f214_arg1.upgradeItemIndex
	if not f214_local0 then
		local f214_local1 = f214_arg1:getModel( f214_arg2, "upgradeItemIndex" )
		if f214_local1 then
			f214_local0 = Engine.GetModelValue( f214_local1 )
		end
	end
	if not f214_local0 then
		return false
	elseif not IsProgressionEnabled( f214_arg2 ) then
		return true
	end
	return Engine.IsItemPurchased( f214_arg2, f214_local0 )
end

function IsCACItemBanned( f215_arg0, f215_arg1, f215_arg2 )
	local f215_local0 = f215_arg1:getModel( f215_arg2, "itemIndex" )
	if f215_local0 then
		return Engine.GetItemRestrictionState( Engine.GetModelValue( f215_local0 ) ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
	else
		return false
	end
end

function IsCACItemUpgradable( f216_arg0, f216_arg1, f216_arg2 )
	if IsCACItemLocked( f216_arg0, f216_arg1, f216_arg2 ) then
		return false
	end
	local f216_local0 = f216_arg1.upgradeItemIndex
	if not f216_local0 then
		local f216_local1 = f216_arg1:getModel( f216_arg2, "upgradeItemIndex" )
		if f216_local1 then
			f216_local0 = Engine.GetModelValue( f216_local1 )
		end
	end
	if not f216_local0 then
		return false
	end
	return IsCACItemPurchased( f216_arg1, f216_arg2 ) and not IsCACItemUpgraded( f216_arg0, f216_arg1, f216_arg2 )
end

function IsCACSlotUpgradable( f217_arg0, f217_arg1, f217_arg2 )
	if not f217_arg1:getModel() then
		return false
	else
		local f217_local0 = GetUpgradableItemRef( f217_arg0, f217_arg1, f217_arg2 )
		if f217_local0 then
			return not LUI.endswith( f217_local0, "_pro" )
		else
			return false
		end
	end
end

function IsCACSlotUpgraded( f218_arg0, f218_arg1, f218_arg2 )
	if not f218_arg1:getModel() then
		return false
	else
		local f218_local0 = GetUpgradableItemRef( f218_arg0, f218_arg1, f218_arg2 )
		if f218_local0 then
			return LUI.endswith( f218_local0, "_pro" )
		else
			return false
		end
	end
end

function IsWeaponPrestigeLevelAtLeast( f219_arg0, f219_arg1, f219_arg2 )
	local f219_local0 = f219_arg0:getModel()
	if f219_local0 then
		local f219_local1 = CoD.SafeGetModelValue( f219_local0, "itemIndex" )
		return f219_local1 and f219_arg2 <= CoD.CACUtility.GetWeaponPLevel( f219_arg1, f219_local1 )
	else
		return false
	end
end

function IsCACHaveTokens( f220_arg0 )
	return Engine.GetCurrentTokens( f220_arg0, "weapon_smg", CoD.PrestigeUtility.GetPermanentUnlockMode() ) > 0
end

function ShouldCACDisplayTokens( f221_arg0 )
	if IsMultiplayer() then
		if IsLive() and not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) and not IsInGame() and not IsMaxPrestigeLevelForMode( f221_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
			return true
		end
	elseif IsCampaign() then
		if CoD.isSafehouse and not CoD.perController[f221_arg0].everythingUnlocked then
			return true
		end
	elseif IsFirstTimeSetup( f221_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
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

function IsProgressionEnabled( f223_arg0 )
	if not (not IsMultiplayer() or not IsLive() or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )) or not (not CoD.PrestigeUtility.isInPermanentUnlockMenu or not IsLive() or Engine.IsInGame()) or not (not IsCampaign() or CoD.perController[f223_arg0].everythingUnlocked) or IsZombies() and IsLive() and not Engine.IsInGame() then
		return true
	else
		return false
	end
end

function IsClassAllocationInState( f224_arg0, f224_arg1 )
	return Engine.GetMaxAllocation( f224_arg0 ) == f224_arg1
end

function IsProgressionElementItemLocked( f225_arg0, f225_arg1, f225_arg2 )
	if not IsProgressionEnabled( f225_arg2 ) then
		return false
	else
		return f225_arg1.isLocked
	end
end

function IsCACItemLocked( f226_arg0, f226_arg1, f226_arg2 )
	if not IsProgressionEnabled( f226_arg2 ) then
		return false
	else
		return IsCACItemLockedHelper( f226_arg0, f226_arg1, f226_arg2 )
	end
end

function IsBGBItemLocked( f227_arg0, f227_arg1, f227_arg2 )
	local f227_local0 = CoD.SafeGetModelValue( f227_arg1:getModel(), "dlcIndex" )
	if not f227_local0 or f227_local0 < CoD.CONTENT_DLC1_INDEX then
		return IsProgressionEnabled( f227_arg2 ) and IsCACItemLockedHelper( f227_arg0, f227_arg1, f227_arg2 )
	else
		return not Engine.HasEntitlementByOwnership( f227_arg2, "dlc" .. f227_local0 - CoD.CONTENT_DLCZM0_INDEX )
	end
end

function IsCACItemLockedForGamesCom( f228_arg0, f228_arg1, f228_arg2 )
	if not IsProgressionEnabled( f228_arg2 ) and not IsGamesComBuild() then
		return false
	else
		return IsCACItemLockedHelper( f228_arg0, f228_arg1, f228_arg2 )
	end
end

function IsCACItemLockedForBeta( f229_arg0, f229_arg1, f229_arg2 )
	if not IsProgressionEnabled( f229_arg2 ) and not LuaUtils.IsBetaBuild() then
		return false
	else
		return IsCACItemLockedHelper( f229_arg0, f229_arg1, f229_arg2 )
	end
end

function IsCACItemLockedOrNotPurchased( f230_arg0, f230_arg1, f230_arg2 )
	local f230_local0 = IsCACItemLocked( f230_arg0, f230_arg1, f230_arg2 )
	if not f230_local0 then
		f230_local0 = not IsCACItemPurchased( f230_arg1, f230_arg2 )
	end
	return f230_local0
end

function IsItemRefLocked( f231_arg0, f231_arg1 )
	local f231_local0 = Engine.GetItemIndexFromReference( f231_arg1 )
	if f231_local0 then
		return Engine.IsItemLocked( f231_arg0, f231_local0 )
	else
		return true
	end
end

function IsNonAttachmentItemLocked( f232_arg0, f232_arg1 )
	if not IsProgressionEnabled( f232_arg0 ) then
		return false
	else
		local f232_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f232_local1 = Engine.GetItemIndexFromReference( f232_arg1, f232_local0 )
		if f232_local1 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemLocked( f232_arg0, f232_local1, f232_local0 )
		else
			return false
		end
	end
end

function IsCACItemMutuallyExclusiveWithSelection( f233_arg0, f233_arg1 )
	local f233_local0 = CoD.perController[f233_arg1].weaponCategory
	local f233_local1 = CoD.CACUtility.EmptyItemIndex
	local f233_local2 = f233_arg0:getModel( f233_arg1, "itemIndex" )
	if f233_local2 then
		f233_local1 = Engine.GetModelValue( f233_local2 )
	end
	if not f233_local0 then
		f233_local0 = Engine.GetLoadoutSlotForItem( f233_local1 )
	end
	if f233_local0 then
		local f233_local3 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f233_local0, f233_arg1, f233_local1 )
		for f233_local4 = 1, #f233_local3, 1 do
			if f233_local3[f233_local4] ~= "" then
				return true
			end
		end
	end
	return false
end

function IsMenuPreviewImageSquare( f234_arg0 )
	if f234_arg0.menuName == "PerkSelect" or f234_arg0.menuName == "LethalEquipmentSelect" or f234_arg0.menuName == "TacticalEquipmentSelect" or f234_arg0.menuName == "TacticalRigSelect" or f234_arg0.menuName == "WildcardSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuCybercoreOrRigMenu( f235_arg0 )
	if f235_arg0.menuName == "TacticalRigSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuEquipmentMenu( f236_arg0 )
	if f236_arg0.menuName == "PerkSelect" or f236_arg0.menuName == "LethalEquipmentSelect" or f236_arg0.menuName == "TacticalEquipmentSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuAttachmentMenu( f237_arg0 )
	if f237_arg0.menuName == "PrimaryAttachmentSelect" or f237_arg0.menuName == "PrimaryOpticSelect" or f237_arg0.menuName == "SecondaryAttachmentSelect" or f237_arg0.menuName == "SecondaryOpticSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponMenu( f238_arg0 )
	if f238_arg0.menuName == "PrimaryWeaponSelect" or f238_arg0.menuName == "SecondaryWeaponSelect" or f238_arg0.menuName == "WeaponBuildKits" or f238_arg0.menuName == "WeaponBuildKitsCustomizeVariant" or f238_arg0.menuName == "WeaponBuildKitsCategorySelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponType( f239_arg0 )
	if IsCurrentMenuAttachmentMenu( f239_arg0 ) or IsCurrentMenuWeaponMenu( f239_arg0 ) then
		return true
	else
		return false
	end
end

function IsMulticoreActivated( f240_arg0 )
	if Engine.IsCampaignGame() then
		local f240_local0 = IsInTrainingSim( f240_arg0 )
		local f240_local1 = Dvar.allItemsUnlocked:get()
		if not f240_local1 then
			f240_local1 = f240_local0 or not IsItemRefLocked( f240_arg0, "feature_multicore" )
		end
		return f240_local1
	else
		return false
	end
end

function IsInTrainingSim( f241_arg0 )
	if Engine.IsCampaignGame() then
		local f241_local0 = Engine.GetModel( Engine.GetModelForController( f241_arg0 ), "safehouse.inTrainingSim" )
		local f241_local1 = false
		if f241_local0 then
			f241_local1 = Engine.GetModelValue( f241_local0 ) > 0
		end
		return f241_local1
	else
		return false
	end
end

function IsCybercoreMenuDisabled( f242_arg0 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f242_arg0 ), "hudItems.cybercoreSelectMenuDisabled" ) == 1
end

function IsCybercoreItemEquipped( f243_arg0, f243_arg1, f243_arg2 )
	local f243_local0 = Engine.GetEquippedCybercore( f243_arg2 )
	local f243_local1 = f243_arg1:getModel( f243_arg2, "itemIndex" )
	if f243_local1 then
		return Engine.GetModelValue( f243_local1 ) == f243_local0
	else
		return false
	end
end

function IsCybercoreAbilityAvailable( f244_arg0, f244_arg1 )
	local f244_local0 = f244_arg0:getModel()
	if f244_local0 then
		if Engine.IsItemPurchased( f244_arg1, Engine.GetModelValue( Engine.GetModel( f244_local0, "baseItemIndex" ) ) ) then
			return true
		end
		local f244_local1 = Engine.GetModelValue( Engine.GetModel( f244_local0, "prereqItemIndex" ) )
		if f244_local1 ~= -1 then
			return Engine.IsItemPurchased( f244_arg1, f244_local1 )
		end
	end
	return false
end

function IsCybercoreAbilityPurchasable( f245_arg0, f245_arg1 )
	local f245_local0 = f245_arg0:getModel()
	if f245_local0 then
		return not Engine.IsItemPurchased( f245_arg1, Engine.GetModelValue( Engine.GetModel( f245_local0, "baseItemIndex" ) ) )
	else
		return false
	end
end

function IsCybercoreAbilityUpgradable( f246_arg0, f246_arg1 )
	local f246_local0 = f246_arg0:getModel()
	if f246_local0 then
		local f246_local1 = Engine.GetModelValue( Engine.GetModel( f246_local0, "baseItemIndex" ) )
		local f246_local2 = Engine.GetModelValue( Engine.GetModel( f246_local0, "upgradeItemIndex" ) )
		if Engine.IsItemPurchased( f246_arg1, f246_local1 ) and f246_local2 then
			return not Engine.IsItemPurchased( f246_arg1, f246_local2 )
		end
	end
	return false
end

function IsCybercoreAbilityUpgraded( f247_arg0, f247_arg1 )
	local f247_local0 = f247_arg0:getModel()
	if f247_local0 then
		local f247_local1 = Engine.GetModelValue( Engine.GetModel( f247_local0, "upgradeItemIndex" ) )
		if f247_local1 then
			return Engine.IsItemPurchased( f247_arg1, f247_local1 )
		else
			return true
		end
	else
		return false
	end
end

function IsBubbleGumPackClassSelectedBubbleGumPack( f248_arg0, f248_arg1 )
	local f248_local0 = f248_arg1:getModel()
	local f248_local1 = f248_arg0:getModel()
	if f248_local0 and f248_local1 and f248_local0 == f248_local1 then
		return true
	else
		return false
	end
end

function IsCurrentClassSelectedClass( f249_arg0, f249_arg1 )
	local f249_local0 = f249_arg1:getModel()
	local f249_local1 = f249_arg0:getModel()
	if f249_local0 and f249_local1 and f249_local0 == f249_local1 then
		return true
	else
		return false
	end
end

function IsCACSlotEquipped( f250_arg0, f250_arg1, f250_arg2 )
	if not f250_arg2 then
		return false
	end
	local f250_local0 = f250_arg1:getModel( f250_arg2, "customWeaponSlot" )
	local f250_local1 = nil
	if f250_local0 then
		f250_local1 = Engine.GetModelValue( f250_local0 )
	end
	if f250_local1 then
		local f250_local2 = f250_arg0:getModel( f250_arg2, f250_local1 )
		if f250_local2 then
			local f250_local3 = Engine.GetModel( f250_local2, "itemIndex" )
			if f250_local3 then
				local f250_local4 = Engine.GetModelValue( f250_local3 )
				local f250_local5, f250_local6 = string.find( f250_local1, "%." )
				return CoD.CACUtility.GetAttachedItemSlot( f250_arg0:getModel(), f250_local4, CoD.CACUtility.GetAttachmentListForSlot( string.sub( f250_local1, 0, f250_local5 - 1 ) ) ) ~= nil
			end
		end
	else
		local f250_local2 = f250_arg0:getModel()
		local f250_local3 = GetWeaponSlotModel( f250_arg0, f250_arg1, f250_arg2, f250_local2 )
		if f250_local3 then
			local f250_local4, f250_local5, f250_local6 = CoD.CACUtility.GetCACSlotStatus( f250_arg2, f250_local2, f250_local3 )
			return f250_local5
		end
	end
	return false
end

function IsSecondaryAttachmentEquippedWithNoPersonalization( f251_arg0, f251_arg1, f251_arg2 )
	if IsCACCustomizationDWAttachmentItemEquipped( f251_arg0, f251_arg1, f251_arg2 ) then
		return true
	elseif not IsLive() and IsCACSlotEquipped( f251_arg0, f251_arg1, f251_arg2 ) then
		return true
	else
		return false
	end
end

function IsCACSlotAvailable( f252_arg0, f252_arg1, f252_arg2 )
	local f252_local0 = f252_arg0:getModel()
	local f252_local1 = GetWeaponSlotModel( f252_arg0, f252_arg1, f252_arg2, f252_local0 )
	if f252_local1 then
		local f252_local2, f252_local3, f252_local4 = CoD.CACUtility.GetCACSlotStatus( f252_arg2, f252_local0, f252_local1 )
		return f252_local2 == CoD.CACUtility.CACStatusAvailable.AVAILABLE
	else
		return false
	end
end

function IsCACSecondLethalAvailable( f253_arg0, f253_arg1, f253_arg2 )
	if IsCACSlotAvailable( f253_arg0, f253_arg1, f253_arg2 ) then
		if not IsCACSpecificWildcardEquipped( f253_arg0, "bonuscard_danger_close" ) then
			return true
		elseif IsCACSpecificSlotEquipped( f253_arg0, f253_arg2, "primarygadget" ) then
			return true
		end
	end
	return false
end

function IsCACSlotNeedWildcard( f254_arg0, f254_arg1, f254_arg2 )
	local f254_local0 = GetWeaponSlotModel( f254_arg0, f254_arg1, f254_arg2, f254_arg0:getModel() )
	if f254_local0 and CoD.CACUtility.WildcardNeededForSlot( f254_arg2, f254_local0 ) then
		return true
	else
		return false
	end
end

function IsCACSlotCanEquipWildcard( f255_arg0, f255_arg1, f255_arg2 )
	local f255_local0 = GetWeaponSlotModel( f255_arg0, f255_arg1, f255_arg2, f255_arg0:getModel() )
	if f255_local0 then
		local f255_local1, f255_local2 = CoD.CACUtility.WildcardNeededForSlot( f255_arg2, f255_local0 )
		if f255_local1 then
			return f255_local2
		end
	end
	return false
end

function IsCACSlotWildcardLocked( f256_arg0, f256_arg1, f256_arg2 )
	local f256_local0 = GetWeaponSlotModel( f256_arg0, f256_arg1, f256_arg2, f256_arg0:getModel() )
	if f256_local0 then
		local f256_local1, f256_local2, f256_local3 = CoD.CACUtility.WildcardNeededForSlot( f256_arg2, f256_local0 )
		if f256_local1 then
			return f256_local3
		end
	end
	return false
end

function IsCACSlotWeaponForAttachmentEquipped( f257_arg0, f257_arg1, f257_arg2 )
	local f257_local0 = f257_arg1:getModel()
	local f257_local1 = f257_arg0:getModel()
	if f257_local0 then
		local f257_local2 = Engine.GetModel( f257_local0, "weaponSlot" )
		if f257_local2 then
			local f257_local3 = Engine.GetModelValue( f257_local2 )
			if LUI.startswith( f257_local3, "primaryattachment" ) then
				local f257_local4, f257_local5, f257_local6 = CoD.CACUtility.GetCACSlotStatus( f257_arg2, f257_local1, "primary" )
				return f257_local5
			elseif LUI.startswith( f257_local3, "secondaryattachment" ) then
				local f257_local4, f257_local5, f257_local6 = CoD.CACUtility.GetCACSlotStatus( f257_arg2, f257_local1, "secondary" )
				return f257_local5
			end
		end
	end
	return false
end

function IsCACSlotSpecificItemEquipped( f258_arg0, f258_arg1, f258_arg2 )
	local f258_local0 = f258_arg0:getModel( f258_arg1, "itemIndex" )
	if f258_local0 then
		local f258_local1 = Engine.GetModelValue( f258_local0 )
		if f258_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetItemRef( f258_local1 ) == f258_arg2 then
			return true
		end
	end
	return false
end

function IsCACEquippedWildcardItemCount( f259_arg0, f259_arg1, f259_arg2 )
	return f259_arg2 == CoD.CACUtility.SpecificWildcardEquippedCount( f259_arg0:getModel(), f259_arg1 )
end

function IsCACCountGreaterThanEquippedWildcardItem( f260_arg0, f260_arg1, f260_arg2 )
	return f260_arg2 <= CoD.CACUtility.SpecificWildcardEquippedCount( f260_arg0:getModel(), f260_arg1 )
end

function IsCACPrimaryGunfighterCountEqualTo( f261_arg0, f261_arg1 )
	return f261_arg1 == CoD.CACUtility.PrimaryGunfighterEquippedCount( f261_arg0:getModel() )
end

function IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( f262_arg0, f262_arg1 )
	return f262_arg1 <= CoD.CACUtility.PrimaryGunfighterEquippedCount( f262_arg0:getModel() )
end

function IsCACPrimaryAttachmentSlotLockedByWildcard( f263_arg0 )
	local f263_local0 = IsNonAttachmentItemLocked( f263_arg0, "bonuscard_primary_gunfighter" )
	if f263_local0 then
		f263_local0 = IsNonAttachmentItemLocked( f263_arg0, "bonuscard_primary_gunfighter_2" )
	end
	if f263_local0 then
		f263_local0 = IsNonAttachmentItemLocked( f263_arg0, "bonuscard_primary_gunfighter_3" )
	end
	return f263_local0
end

function IsCACAttachmentSlotVisible( f264_arg0, f264_arg1, f264_arg2, f264_arg3 )
	if IsCACSlotWeaponForAttachmentEquipped( f264_arg0, f264_arg1, f264_arg2 ) then
		return not IsCACCountGreaterThanEquippedWildcardItem( f264_arg0, "bonuscard_primary_gunfighter", f264_arg3 )
	else
		return IsCACCountGreaterThanEquippedWildcardItem( f264_arg0, "bonuscard_primary_gunfighter", 0 )
	end
end

function IsHintTextLeftAlign( f265_arg0, f265_arg1 )
	local f265_local0 = f265_arg0:getModel( f265_arg1, "weaponSlot" )
	if f265_local0 and LUI.startswith( Engine.GetModelValue( f265_local0 ), "primarygadget" ) then
		return true
	else
		return false
	end
end

function IsHintTextRightAlign( f266_arg0, f266_arg1 )
	local f266_local0 = f266_arg0:getModel( f266_arg1, "weaponSlot" )
	if f266_local0 then
		local f266_local1 = Engine.GetModelValue( f266_local0 )
		if f266_local1 == "primaryattachment3" or f266_local1 == "primaryattachment6" or f266_local1 == "secondaryattachment3" or f266_local1 == "specialty3" or f266_local1 == "specialty6" then
			return true
		end
	end
	return false
end

function IsCACSpecificWildcardEquipped( f267_arg0, f267_arg1 )
	local f267_local0 = f267_arg0:getModel()
	if f267_local0 then
		return CoD.CACUtility.IsBonusCardEquipped( f267_arg1, f267_local0 )
	else
		return false
	end
end

function IsCACSpecificSlotEquipped( f268_arg0, f268_arg1, f268_arg2 )
	local f268_local0 = f268_arg0:getModel()
	if f268_local0 then
		local f268_local1, f268_local2, f268_local3 = CoD.CACUtility.GetCACSlotStatus( f268_arg1, f268_local0, f268_arg2 )
		return f268_local2
	else
		return false
	end
end

function IsCACGadgetModAvailable( f269_arg0, f269_arg1, f269_arg2 )
	local f269_local0 = f269_arg0:getModel()
	if not f269_arg2 or not f269_local0 then
		return false
	end
	local f269_local1 = f269_arg1:getModel( f269_arg2, "weaponSlot" )
	if not f269_local1 then
		return false
	end
	local f269_local2 = Engine.GetModelValue( f269_local1 )
	local f269_local3 = "primarygadget"
	if LUI.startswith( f269_local2, "primarygadgetattachment" ) then
		f269_local3 = "primarygadget"
	elseif LUI.startswith( f269_local2, "secondarygadgetattachment" ) then
		f269_local3 = "secondarygadget"
	end
	if CoD.CACUtility.ItemEquippedInSlot( f269_local3, f269_arg2 ) then
		local f269_local4 = Engine.GetModel( f269_local0, f269_local3 .. ".cust" .. f269_local2 .. ".itemIndex" )
		if f269_local4 and Engine.GetModelValue( f269_local4 ) > CoD.CACUtility.EmptyItemIndex then
			return true
		end
	end
	return false
end

function IsCACThirdPrimaryAttachmentAvailable( f270_arg0 )
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( CoD.perController[f270_arg0].classModel ) >= 1
end

function IsCACFifthPrimaryAttachmentAvailable( f271_arg0 )
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( CoD.perController[f271_arg0].classModel ) >= 2
end

function IsCACTakeTwoPrimaryGadgetAttachmentEquipped( f272_arg0 )
	return SearchForTakeTwoGadgetMod( f272_arg0:getModel(), CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoSecondaryGadgetAttachmentEquipped( f273_arg0 )
	return SearchForTakeTwoGadgetMod( f273_arg0:getModel(), CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoPrimaryGadgetAttachment( f274_arg0, f274_arg1 )
	return IsTakeTwoGadgetAttachmentForSlot( f274_arg0:getModel(), f274_arg1:getModel(), "primarygadget" )
end

function IsCACTakeTwoSecondaryGadgetAttachment( f275_arg0, f275_arg1 )
	return IsTakeTwoGadgetAttachmentForSlot( f275_arg0:getModel(), f275_arg1:getModel(), "secondarygadget" )
end

function IsPrimaryWeaponAttachmentAvailable( f276_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "primary", f276_arg0 ) and GetNumberOfAttachmentsForSlot( "primary", f276_arg0 ) > 0
end

function IsSecondaryWeaponAttachmentAvailable( f277_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "secondary", f277_arg0 ) and GetNumberOfAttachmentsForSlot( "secondary", f277_arg0 ) > 0
end

function IsCACWeaponVariantAvailable( f278_arg0, f278_arg1 )
	if not Gunsmith_IsEnabled( f278_arg0, f278_arg1 ) then
		return false
	end
	local f278_local0 = f278_arg0:getModel()
	if f278_local0 then
		if CoD.perController[f278_arg1].weaponSlot and CoD.SafeGetModelValue( f278_local0, "loadoutSlot" ) ~= CoD.perController[f278_arg1].weaponSlot then
			return false
		end
		local f278_local1 = Engine.GetModel( f278_local0, "ref" )
		local f278_local2 = Engine.GetModel( f278_local0, "itemIndex" )
		if f278_local2 then
			local f278_local3 = Engine.GetModelValue( f278_local2 )
			local f278_local4 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f278_local3 )
			if #f278_local4 > 1 or #f278_local4 == 1 and CoD.CraftUtility.Gunsmith.AreMaxVariantSlotsUsed() then
				CoD.perController[f278_arg1].weaponIndexForVariant = f278_local3
				return true
			end
		end
	end
	return false
end

function IsBaseWeaponVariantIndex( f279_arg0, f279_arg1, f279_arg2 )
	local f279_local0 = f279_arg1:getModel( f279_arg2, "cacVariantIndex" )
	if f279_local0 then
		return Engine.GetModelValue( f279_local0 ) == 0
	else
		return false
	end
end

function IsCACSlotHasVariantName( f280_arg0 )
	local f280_local0 = f280_arg0:getModel()
	if f280_local0 then
		local f280_local1 = Engine.GetModel( f280_local0, "variantName" )
		if f280_local1 and Engine.GetModelValue( f280_local1 ) ~= "" then
			return true
		end
	end
	return false
end

function DoesWeaponVariantContainLockedItems( f281_arg0, f281_arg1, f281_arg2 )
	if IsProgressionEnabled( f281_arg2 ) and f281_arg1.weaponVariantInfo then
		return f281_arg1.weaponVariantInfo.hasLockedItems
	else
		return false
	end
end

function DoesWeaponVariantContainLockedAttachments( f282_arg0, f282_arg1, f282_arg2 )
	if IsProgressionEnabled( f282_arg2 ) and f282_arg1.weaponVariantInfo then
		return f282_arg1.weaponVariantInfo.hasLockedAttachments
	else
		return false
	end
end

function IsCACWeaponAttributeIncrease( f283_arg0, f283_arg1, f283_arg2 )
	if f283_arg0:getModel( f283_arg1, f283_arg2 ) then
		return WeaponAttributeCompare( Engine.GetModelValue( f283_arg0:getModel( f283_arg1, f283_arg2 ) ) )
	else
		return false
	end
end

function IsCACGunLevelMax( f284_arg0, f284_arg1, f284_arg2 )
	local f284_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f284_arg2, f284_arg1 )
	if f284_local0 == CoD.CACUtility.EmptyItemIndex then
		return false
	else
		return IsWeaponLevelMax( f284_local0, f284_arg2, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	end
end

function IsCACGunLevelExists( f285_arg0, f285_arg1, f285_arg2 )
	if not IsProgressionEnabled( f285_arg2 ) then
		return false
	else
		local f285_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f285_arg2, f285_arg1 )
		if Engine.IsCampaignGame() then
			local f285_local1 = CoD.GetAttachments( f285_local0 )
			if f285_local1 then
				f285_local1 = #CoD.GetAttachments( f285_local0 ) > 0
			end
			local f285_local2
			if f285_local0 ~= CoD.CACUtility.EmptyItemIndex then
				f285_local2 = f285_local1
			else
				f285_local2 = false
			end
			return f285_local2
		else
			return f285_local0 ~= CoD.CACUtility.EmptyItemIndex
		end
	end
end

function AllowWeaponPrestige( f286_arg0 )
	return IsMultiplayer() and IsProgressionEnabled( f286_arg0 ) or Dvar.ui_allowWeaponPrestige:get()
end

function CanPrestigeWeapon( f287_arg0, f287_arg1 )
	if IsArenaMode() then
		return false
	elseif not AllowWeaponPrestige( f287_arg1 ) then
		return false
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "WGSV_Category" ) == CoD.WGSV_Category.WEAPON then
		local f287_local0 = f287_arg0:getModel()
		if f287_local0 then
			return IsWeaponLevelMax( f287_local1, f287_arg1, Engine.CurrentSessionMode() ) and f287_local2 and CoD.CACUtility.GetWeaponPLevel( f287_arg1, f287_local1 ) < CoD.CACUtility.maxWeaponPrestige
		end
	end
	return false
end

function IsItemWeaponOptionNew( f288_arg0, f288_arg1 )
	if not IsProgressionEnabled( f288_arg1 ) then
		return false
	else
		local f288_local0 = CoD.perController[f288_arg1].classModel
		local f288_local1 = CoD.perController[f288_arg1].weaponCategory
		local f288_local2 = f288_arg0:getModel()
		local f288_local3 = CoD.SafeGetModelValue( f288_local2, "weaponOptionSubIndex" )
		local f288_local4 = CoD.SafeGetModelValue( f288_local2, "weaponOptionType" )
		if f288_local3 and f288_local4 and f288_local4 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and f288_local3 > CoD.CACUtility.EmptyItemIndex then
			local f288_local5 = Engine.GetModelValue( Engine.GetModel( f288_local0, f288_local1 .. ".itemIndex" ) )
			local f288_local6 = Engine.GetWeaponOptionGroupIndex( f288_local3, f288_local4 )
			if f288_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
				f288_local5 = Engine.GetItemAttachment( CoD.SafeGetModelValue( f288_local0, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f288_local1 ) .. ".itemIndex" ), f288_local5 )
			end
			return Engine.IsWeaponOptionNew( f288_arg1, f288_local5, f288_local6 )
		else
			return false
		end
	end
end

function IsItemWeaponOptionEquipped( f289_arg0, f289_arg1 )
	local f289_local0 = CoD.perController[f289_arg1].classModel
	local f289_local1 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[f289_arg1].weaponCategory )
	local f289_local2 = f289_arg0:getModel( f289_arg1, "weaponOptionTypeName" )
	local f289_local3 = f289_arg0:getModel( f289_arg1, "weaponOptionSubIndex" )
	local f289_local4 = f289_arg0:getModel( f289_arg1, "weaponOptionType" )
	if f289_local2 and f289_local3 and f289_local4 then
		local f289_local5 = Engine.GetModelValue( f289_local2 )
		local f289_local6 = Engine.GetModelValue( f289_local3 )
		if Engine.GetModelValue( f289_local4 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			if CoD.CACUtility.GetItemEquippedInSlot( f289_local1 .. "paintjobIndex", f289_arg1, f289_local0 ) == Engine.GetModelValue( f289_arg0:getModel( f289_arg1, "paintjobIndex" ) ) and CoD.CACUtility.GetItemEquippedInSlot( f289_local1 .. "paintjobSlot", f289_arg1, f289_local0 ) == Engine.GetModelValue( f289_arg0:getModel( f289_arg1, "paintjobSlot" ) ) then
				return true
			end
		elseif CoD.CACUtility.GetItemEquippedInSlot( f289_local1 .. f289_local5, f289_arg1 ) == f289_local6 then
			return true
		end
	end
	return false
end

function IsItemWeaponOptionLocked( f290_arg0, f290_arg1, f290_arg2 )
	if not IsCACPersonalizationProgressionEnabled( f290_arg1, f290_arg2 ) then
		return false
	end
	local f290_local0 = CoD.perController[f290_arg2].classModel
	local f290_local1 = CoD.perController[f290_arg2].weaponCategory
	local f290_local2 = Engine.GetModel( f290_local0, f290_local1 .. ".itemIndex" )
	local f290_local3 = f290_arg1:getModel( f290_arg2, "weaponOptionSubIndex" )
	local f290_local4 = f290_arg1:getModel( f290_arg2, "weaponOptionType" )
	if f290_local2 and f290_local3 and f290_local4 then
		local f290_local5 = Engine.GetModelValue( f290_local2 )
		local f290_local6 = Engine.GetModelValue( f290_local3 )
		local f290_local7 = Engine.GetModelValue( f290_local4 )
		local f290_local8 = Engine.GetWeaponOptionGroupIndex( f290_local6, f290_local7 )
		if f290_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local f290_local9 = CoD.SafeGetModelValue( f290_local0, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f290_local1 ) .. ".itemIndex" )
			if not f290_local9 then
				return true
			end
			f290_local5 = Engine.GetItemAttachment( f290_local9, f290_local5 )
		end
		if (f290_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f290_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f290_local6 == 0 then
			return false
		elseif f290_local7 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if f290_local6 == 0 then
				return false
			end
			local f290_local10 = Engine.GetAttachmentRef( f290_local5, f290_local6 )
			for f290_local14, f290_local15 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f290_local10 == f290_local15 then
					local f290_local13
					if CoD.CACUtility.GetWeaponPLevel( f290_arg2, f290_local5 ) < f290_local14 then
						f290_local13 = not Dvar.allItemsUnlocked:get()
					else
						f290_local13 = false
					end
					return f290_local13
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( f290_arg2, f290_local5, f290_local8 )
	end
	return false
end

function GetUnlockSessionMode( f291_arg0, f291_arg1 )
	local f291_local0 = Enum.eModes.MODE_COUNT
	if not f291_arg0 then
		return f291_local0
	end
	local f291_local1 = f291_arg0:getModel( f291_arg1, "unlockSessionMode" )
	if not f291_local1 then
		f291_local1 = f291_arg0:getModel( f291_arg1, "challengeInfo.unlockSessionMode" )
	end
	if not f291_local1 then
		return f291_local0
	end
	return Engine.GetModelValue( f291_local1 )
end

function ShouldHideItemWeaponOptionInGunsmith( f292_arg0, f292_arg1 )
	local f292_local0 = f292_arg0:getModel( f292_arg1, "weaponOptionSubIndex" )
	local f292_local1 = f292_arg0:getModel( f292_arg1, "weaponOptionType" )
	if not f292_local0 or not f292_local1 then
		return true
	else
		local f292_local2 = GetUnlockSessionMode( f292_arg0, f292_arg1 )
		if f292_local2 == Enum.eModes.MODE_COUNT then
			return true
		elseif not IsLive() and (f292_local2 == Enum.eModes.MODE_MULTIPLAYER or f292_local2 == Enum.eModes.MODE_ZOMBIES) then
			return true
		else
			local f292_local3 = Engine.GetModelValue( f292_local0 )
			local f292_local4 = Engine.GetModelValue( f292_local1 )
			if (f292_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f292_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f292_local3 == 0 then
				return true
			else
				local f292_local5 = f292_arg0:getModel( f292_arg1, "filterMode" )
				if f292_local5 and Engine.GetModelValue( f292_local5 ) == "extras" then
					if f292_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
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

function ShouldHideItemWeaponOption( f293_arg0, f293_arg1 )
	if not IsCACPersonalizationProgressionEnabled( f293_arg0, f293_arg1 ) then
		return true
	elseif CoD.SafeGetModelValue( f293_arg0:getModel(), "isChallengeClassified" ) == true then
		return true
	end
	local f293_local0 = f293_arg0:getModel( f293_arg1, "weaponOptionSubIndex" )
	local f293_local1 = f293_arg0:getModel( f293_arg1, "weaponOptionType" )
	if f293_local0 and f293_local1 then
		local f293_local2 = Engine.GetModelValue( f293_local0 )
		local f293_local3 = Engine.GetModelValue( f293_local1 )
		if (f293_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f293_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f293_local2 == 0 then
			return true
		elseif f293_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			return true
		end
	end
	local f293_local2 = f293_arg0:getModel( f293_arg1, "filterMode" )
	if f293_local2 and Engine.GetModelValue( f293_local2 ) == "extras" then
		if (f293_local1 and Engine.GetModelValue( f293_local1 )) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
			return false
		end
		return true
	end
	return false
end

function IsWeaponPrestigeItem( f294_arg0, f294_arg1 )
	local f294_local0 = f294_arg0:getModel( f294_arg1, "weaponOptionType" )
	if f294_local0 and Engine.GetModelValue( f294_local0 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
		return true
	else
		return false
	end
end

function IsCACPersonalizationProgressionEnabled( f295_arg0, f295_arg1 )
	local f295_local0 = nil
	if IsSpecialContractCamo( f295_arg0, f295_arg1 ) then
		return true
	elseif f295_arg0 then
		local f295_local1 = f295_arg0:getModel( f295_arg1, "unlockSessionMode" )
		if not f295_local1 then
			f295_local1 = f295_arg0:getModel( f295_arg1, "challengeInfo.unlockSessionMode" )
		end
		if f295_local1 then
			f295_local0 = Engine.GetModelValue( f295_local1 )
		end
		if f295_local0 and f295_local0 >= Enum.eModes.MODE_FIRST and f295_local0 < Enum.eModes.MODE_COUNT and (not (f295_local0 ~= Enum.eModes.MODE_CAMPAIGN and (f295_local0 ~= Enum.eModes.MODE_MULTIPLAYER or not IsLive() or IsMultiplayer() and Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ))) or f295_local0 == Enum.eModes.MODE_ZOMBIES and IsLive()) then
			return true
		end
	end
	return false
end

function IsClassOptionDisabled( f296_arg0, f296_arg1, f296_arg2 )
	local f296_local0 = CoD.perController[f296_arg2].classModel
	local f296_local1 = f296_arg1:getModel()
	if f296_local0 and f296_local1 and f296_local0 == f296_local1 then
		f296_arg1.disabled = true
		return true
	else
		return false
	end
end

function IsClassSetOptionDisabled( f297_arg0, f297_arg1, f297_arg2 )
	local f297_local0 = f297_arg1:getModel( f297_arg2, "classSetId" )
	if f297_local0 and Engine.GetModelValue( f297_local0 ) == Engine.GetCurrentClassSetIndex( f297_arg2 ) then
		return true
	else
		return false
	end
end

function IsCurrentItemClassified( f298_arg0, f298_arg1 )
	local f298_local0 = f298_arg0:getModel()
	if f298_local0 then
		local f298_local1 = Engine.GetModel( f298_local0, "isClassified" )
		if f298_local1 then
			return Engine.GetModelValue( f298_local1 )
		end
	end
	return false
end

function IsCurrentACVEquipped( f299_arg0, f299_arg1, f299_arg2 )
	local f299_local0 = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[f299_arg2].weaponCategory .. "cosmeticvariant", f299_arg2, f299_arg0:getModel() )
	local f299_local1 = f299_arg1:getModel( f299_arg2, "variantIndex" )
	if f299_local1 then
		return f299_local0 == Engine.GetModelValue( f299_local1 )
	else
		return false
	end
end

function IsCACACVItemNew( f300_arg0, f300_arg1 )
	if not IsProgressionEnabled( f300_arg1 ) then
		return false
	elseif CoD.SafeGetModelValue( f300_arg0:getModel(), "isBMClassified" ) == true then
		return false
	else
		local f300_local0 = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
		if f300_local0 and f300_arg0.attachmentRef and f300_arg0.variantIndex and f300_arg0.variantIndex > CoD.CACUtility.EmptyItemIndex then
			return IsACVItemNewHelper( f300_arg1, f300_local0, f300_arg0.attachmentTableIndex, f300_arg0.variantIndex, Enum.eModes.MODE_MULTIPLAYER )
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

function AreCodPointsEnabled( f303_arg0 )
	return IsLive() and IsBooleanDvarSet( "tu4_enableCodPoints" )
end

function ShouldOnlyShowVials( f304_arg0, f304_arg1 )
	return IsLootReady( f304_arg1 ) and not AreCodPointsEnabled( f304_arg1 )
end

function IsThermometerUnlockIndexGreaterThanorEqualTo( f305_arg0 )
	if f305_arg0 <= CoD.GetThermometerUnlockIndex() then
		return true
	else
		
	end
end

function IsThermometerProgressEqualTo( f306_arg0 )
	if CoD.GetThermometerProgress() == f306_arg0 then
		return true
	else
		
	end
end

function IsCommunityContractBreadCrumbActive( f307_arg0 )
	local f307_local0 = Engine.StorageGetBuffer( f307_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if Dvar.ui_enablePromoMenu:get() and f307_local0 and f307_local0.ui_community_contract_milestone and f307_local0.ui_seen_community_contract then
		if f307_local0.ui_seen_community_contract:get() == 0 then
			return true
		elseif f307_local0.ui_community_contract_milestone:get() ~= CoD.GetThermometerUnlockIndex() then
			return true
		end
	end
	return false
end

function IsTrifectaContractBreadcrumbActive( f308_arg0 )
	if not IsTrifectaBundleActive( f308_arg0 ) and not IsGrandSlamActive( f308_arg0 ) then
		return false
	else
		local f308_local0 = CoD.GetPlayerStats( f308_arg0 )
		if f308_local0 and f308_local0.extraBytes then
			return f308_local0.extraBytes[3]:get() < Engine.DvarInt( nil, "loot_trifecta_breadcrumb_index" )
		else
			
		end
	end
end

function IsBlackMarketBreadcrumbActive( f309_arg0 )
	local f309_local0 = CoD.GetPlayerStats( f309_arg0 )
	if f309_local0 and f309_local0.blackMarketShowBreadcrumb and f309_local0.blackMarketShowBreadcrumb:get() == 1 then
		return true
	else
		local f309_local1 = Engine.StorageGetBuffer( f309_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f309_local1 and f309_local1.ui_seen_new_contracts:get() == 0 then
			return true
		elseif IsExperimentPromotionActive( f309_arg0 ) then
			return true
		elseif IsTrifectaContractBreadcrumbActive( f309_arg0 ) then
			return true
		elseif IsNoDupesCrateActive( f309_arg0 ) then
			return true
		elseif Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" ) then
			return true
		else
			return false
		end
	end
end

function HasPlayerSeenLatestBlackMarketPromotion( f310_arg0 )
	if ShouldShowSeasonPassIncentiveOverlay( f310_arg0 ) then
		return false
	elseif IsCommunityContractBreadCrumbActive( f310_arg0 ) then
		return false
	else
		local f310_local0 = Engine.StorageGetBuffer( f310_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f310_local0 and f310_local0.ui_seen_new_contracts:get() == 0 then
			return false
		elseif IsExperimentPromotionActive( f310_arg0 ) then
			return false
		elseif IsTrifectaContractBreadcrumbActive( f310_arg0 ) then
			return false
		elseif IsNoDupesCrateActive( f310_arg0 ) then
			return false
		elseif Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" ) then
			return false
		elseif IsGrandSlamActive( f310_arg0 ) and Engine.IsLootReady( f310_arg0 ) and Engine.GetInventoryItemQuantity( f310_arg0, CoD.BlackMarketUtility.loot_grand_slam_drop_id ) == 0 then
			return false
		elseif 0 == CoD.BlackMarketUtility.CurrentPromotionIndex then
			return true
		else
			local f310_local1 = CoD.GetPlayerStats( f310_arg0 )
			if f310_local1 and f310_local1.extraBytes then
				return f310_local1.extraBytes[0]:get() == CoD.BlackMarketUtility.CurrentPromotionIndex
			else
				return true
			end
		end
	end
end

function IsExperimentPromotionActive( f311_arg0 )
	local f311_local0 = "gamedata/events/schedule.csv"
	if Engine.DvarBool( nil, "loot_experimentpromo_active" ) then
		local f311_local1 = Engine.DvarString( nil, "loot_experimentpromo_name" )
		local f311_local2 = Engine.DvarString( nil, "loot_experimentpromo_group" )
		if f311_local1 ~= "" and f311_local2 ~= "" then
			return CoDShared.IsInExperiment( f311_local1, f311_local2 )
		end
	end
	return false
end

function PurchaseExperimentCanShowStoreButton( f312_arg0, f312_arg1 )
	if (IsChildElementInState( f312_arg1, "BlackMarketCODPointContainerSmall", "DefaultState" ) or IsChildElementInState( f312_arg1, "BlackMarketCODPointContainerSmall", "HiddenForLootSale" )) and Engine.DvarBool( nil, "ui_purchaseExperiment" ) then
		return false
	else
		return true
	end
end

function IsPurchaseExperimentActive( f313_arg0, f313_arg1 )
	if Engine.DvarBool( nil, "ui_purchaseExperiment" ) then
		return true
	else
		return false
	end
end

function IsCodeBundlePromotionActive( f314_arg0 )
	if Engine.DvarBool( nil, "loot_code_bundle_active" ) and LuaUtils.GetSkuName() == "SceaEnFr" then
		return not Engine.HasEntitlementByOwnership( f314_arg0, "codemtx03" )
	else
		return false
	end
end

function CanAffordTradeAgain( f315_arg0, f315_arg1 )
	local f315_local0 = CoD.SafeGetModelValue( f315_arg0:getModel(), "itemCost" )
	if f315_local0 ~= nil and f315_local0 > 0 and f315_local0 <= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f315_arg1 ) then
		return true
	else
		local f315_local1 = CoD.SafeGetModelValue( f315_arg0:getModel(), "itemCODPointCost" )
		if f315_local1 ~= nil and f315_local1 > 0 and f315_local1 <= Engine.GetCoDPoints( f315_arg1 ) then
			return true
		else
			local f315_local2 = CoD.SafeGetModelValue( f315_arg0:getModel(), "itemBundleCost" )
			if f315_local2 ~= nil and f315_local2 > 0 and f315_local2 <= CoD.BlackMarketUtility.GetBundleCountForCurrentDropType( f315_arg1 ) then
				return true
			else
				return false
			end
		end
	end
end

function IsInventoryBusy( f316_arg0 )
	return Engine.IsInventoryBusy( f316_arg0 )
end

function CanAffordCrate( f317_arg0, f317_arg1 )
	local f317_local0 = CoD.BlackMarketUtility.GetCrateCODPointCost( f317_arg1 )
	if f317_local0 > 0 and f317_local0 <= Engine.GetCoDPoints( f317_arg0 ) then
		return true
	else
		local f317_local1 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( f317_arg1 )
		if f317_local1 > 0 and f317_local1 <= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f317_arg0 ) then
			return true
		else
			return false
		end
	end
end

function IsCurrentBundleCountGreaterThan( f318_arg0, f318_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBundleCount( f318_arg0 ) > 0
end

function HasSixPackCommonBundles( f319_arg0 )
	return CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f319_arg0 ) > 0
end

function HasDailyDoubleBundles( f320_arg0 )
	return CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f320_arg0 ) > 0
end

function HasBundleExperimentBundles( f321_arg0 )
	return CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f321_arg0 ) > 0
end

function HasNoDupesBundles( f322_arg0 )
	return CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f322_arg0 ) > 0
end

function HasCodeBundles( f323_arg0 )
	return CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f323_arg0 ) > 0
end

function HasWeapon3XBundles( f324_arg0 )
	return CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f324_arg0 ) > 0
end

function HasLimitedEditionCamoBundles( f325_arg0 )
	return CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f325_arg0 ) > 0
end

function BlackMarketListItemCanEquip( f326_arg0, f326_arg1 )
	local f326_local0 = CoD.SafeGetModelValue( f326_arg0:getModel(), "category" )
	if f326_local0 ~= "emblem" and f326_local0 ~= "calling_card" and f326_local0 ~= "specialist_outfit" and f326_local0 ~= "gesture" and f326_local0 ~= "taunt" then
		return false
	else
		local f326_local1 = CoD.SafeGetModelValue( f326_arg0:getModel(), "lockItemText" )
		if f326_local1 == nil or f326_local1 == "" then
			return true
		else
			
		end
	end
end

function BlackMarketHideMasterCallingCards()
	return IsJapaneseSku()
end

function IsItemBlackMarketWeapon( f328_arg0, f328_arg1 )
	if not (not IsZombies() or CoD.PrestigeUtility.isInPermanentUnlockMenu) or not IsProgressionEnabled( f328_arg1 ) then
		return true
	end
	local f328_local0 = nil
	local f328_local1 = f328_arg0.itemIndex
	if not f328_local1 then
		f328_local0 = f328_arg0:getModel( f328_arg1, "itemIndex" )
		if f328_local0 then
			f328_local1 = Engine.GetModelValue( f328_local0 )
		end
	end
	if f328_local1 then
		return CoD.BlackMarketUtility.IsBlackMarketItem( Engine.GetItemRef( f328_local1, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
	end
	return false
end

function CanShowWeaponStatsForCampaign( f329_arg0, f329_arg1 )
	local f329_local0 = f329_arg0:getModel( f329_arg1, "weaponIndex" )
	if f329_local0 then
		local f329_local1 = Engine.GetItemRef( Engine.GetModelValue( f329_local0 ), Enum.eModes.MODE_MULTIPLAYER )
		if f329_local1 ~= "" and f329_local1 ~= "melee_boxing" then
			return not CoD.BlackMarketUtility.IsBlackMarketItem( f329_local1 )
		end
	end
	return false
end

function HasEarnedWeaponContract( f330_arg0 )
	if Engine.AreStatsFetched( f330_arg0 ) and Engine.IsLootReady( f330_arg0 ) and Engine.GetInventoryItemQuantity( f330_arg0, Dvar.weapon_contract_incentive_id:get() ) >= Dvar.weapon_contract_max:get() then
		return true
	else
		return Engine.GetDStat( f330_arg0, "weaponContractData", "completeTimestamp" ) ~= 0
	end
end

function IsDailyContractComplete( f331_arg0 )
	local f331_local0 = CoD.GetContractStatValuesForIndex( f331_arg0, LuaUtils.BMContracts.dailyContractIndex )
	return f331_local0 and f331_local0.targetValue <= f331_local0.progress
end

function AreWeeklyContractsComplete( f332_arg0 )
	local f332_local0 = CoD.GetContractStatValuesForIndex( f332_arg0, LuaUtils.BMContracts.weeklyContractIndex1 )
	local f332_local1 = CoD.GetContractStatValuesForIndex( f332_arg0, LuaUtils.BMContracts.weeklyContractIndex2 )
	if not f332_local0 or not f332_local1 then
		return false
	else
		local f332_local2
		if f332_local0.targetValue > f332_local0.progress or f332_local1.targetValue > f332_local1.progress then
			f332_local2 = false
		else
			f332_local2 = true
		end
	end
	return f332_local2
end

function IsDailyContractValid( f333_arg0 )
	local f333_local0 = CoD.GetContractStatValuesForIndex( f333_arg0, LuaUtils.BMContracts.dailyContractIndex )
	return f333_local0 and f333_local0.index ~= 0
end

function IsIncompleteContractActive( f334_arg0 )
	local f334_local0 = CoD.GetContractStatValuesForIndex( f334_arg0, LuaUtils.BMContracts.specialContractIndex )
	if f334_local0 == nil or f334_local0.index == 0 then
		return not HasEarnedWeaponContract( f334_arg0 )
	else
		return not f334_local0.isAwardGiven
	end
end

function AreWeeklyContractsValid( f335_arg0 )
	local f335_local0 = CoD.GetContractStatValuesForIndex( f335_arg0, LuaUtils.BMContracts.weeklyContractIndex1 )
	local f335_local1 = CoD.GetContractStatValuesForIndex( f335_arg0, LuaUtils.BMContracts.weeklyContractIndex2 )
	if not f335_local0 or not f335_local1 then
		return false
	else
		local f335_local2
		if f335_local0.index == 0 or f335_local1.index == 0 then
			f335_local2 = false
		else
			f335_local2 = true
		end
	end
	return f335_local2
end

function IsProcessingBMContractRewardTask( f336_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f336_arg0 ), "bmRewards.processingTask" ) )
	local f336_local1
	if modelValue == nil or modelValue ~= true then
		f336_local1 = false
	else
		f336_local1 = true
	end
	return f336_local1
end

function IsLootItemFromCurrentContraband( f337_arg0, f337_arg1 )
	local f337_local0 = f337_arg0:getModel( f337_arg1, "drop" )
	if f337_local0 then
		local f337_local1 = Engine.GetModelValue( f337_local0 )
		local f337_local2 = LUI.splitString( Dvar.loot_mpItemVersions:get(), "," )
		if f337_local1 and #f337_local2 > 0 and tonumber( f337_local1 ) == tonumber( f337_local2[#f337_local2] ) then
			return true
		end
	end
	return false
end

function IsLimitedLootItem( f338_arg0, f338_arg1 )
	local f338_local0 = f338_arg0:getModel( f338_arg1, "emblem" )
	if f338_local0 then
		return CoD.BlackMarketUtility.IsLimitedBlackMarketItem( Engine.GetModelValue( f338_local0 ) )
	else
		return false
	end
end

function IsLimitedLootPromoActive( f339_arg0 )
	return Engine.DvarBool( nil, "loot_limitedTimeItemPromo_active" )
end

function DoesPlayerHaveCurrentLoginReward( f340_arg0 )
	local f340_local0 = Engine.GetLootItemQuantity( f340_arg0, CoD.LoginRewardItemReference, Enum.eModes.MODE_MULTIPLAYER )
	if not f340_local0 or f340_local0 == 0 then
		return false
	else
		return true
	end
end

function ShouldShowLoginRewardPopup( f341_arg0 )
	return Engine.DvarBool( nil, "loot_loginReward_active" ) and not DoesPlayerHaveCurrentLoginReward( f341_arg0 )
end

function IsCryptokeyWidgetGenericReward( f342_arg0, f342_arg1, f342_arg2 )
	if f342_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return true
	elseif f342_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return true
	else
		return false
	end
end

function IsCryptokeyWidgetAvailable( f343_arg0, f343_arg1, f343_arg2 )
	if IsElementInState( f343_arg1, "SixPackCommon" ) and IsSixPackBundleInCooldown( f343_arg2 ) then
		return false
	elseif IsElementInState( f343_arg1, "DailyDouble" ) and IsDailyDoubleBundleInCooldown( f343_arg2 ) then
		return false
	else
		return true
	end
end

function IsDecryptionCrateGenericReward( f344_arg0, f344_arg1, f344_arg2 )
	if CoD.perController[f344_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return true
	elseif CoD.perController[f344_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return true
	else
		return false
	end
end

function IsGrandSlamReward( f345_arg0 )
	if CoD.perController[f345_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		return true
	elseif CoD.perController[f345_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		return true
	else
		
	end
end

function IsDecryptionCrateRare( f346_arg0, f346_arg1, f346_arg2 )
	if CoD.perController[f346_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE then
		return true
	elseif CoD.perController[f346_arg2].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE then
		return true
	else
		return false
	end
end

function HasGenericRewardBundles( f347_arg0 )
	if CoD.perController[f347_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f347_arg0 ) > 0
	elseif CoD.perController[f347_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f347_arg0 ) > 0
	else
		return false
	end
end

function HasGrandSlamRewardBundles( f348_arg0 )
	if CoD.perController[f348_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		return CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f348_arg0 ) > 0
	elseif CoD.perController[f348_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		return CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f348_arg0 ) > 0
	else
		return false
	end
end

function HasPlayerSeenZMHDPurchaseRewardPopup( f349_arg0 )
	local f349_local0 = Engine.StorageGetBuffer( f349_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f349_local0 then
		return f349_local0.extraBools[7]:get() == 1
	else
		return false
	end
end

function ShouldShowZMHDPurchaseRewardPopup( f350_arg0 )
	if Engine.DvarBool( nil, "zmhd_purchase_reward_popup_enabled" ) and not HasPlayerSeenZMHDPurchaseRewardPopup( f350_arg0 ) then
		return Engine.GetInventoryItemQuantity( f350_arg0, Engine.TableLookup( nil, "gamedata/store/common/fpentitlement.csv", 5, "dlc5", CoD.OrbisDurangoPCValue( 8, 7, 9 ) ) ) > 0
	else
		return false
	end
end

function ShouldShowZMDLCPurchaseRewardPopup( f351_arg0, f351_arg1 )
	local f351_local0 = false
	if ShouldShowZMDLC1PurchaseRewardPopup( f351_arg0 ) then
		f351_arg1.dlc1 = true
		f351_local0 = true
	end
	if ShouldShowZMDLC2PurchaseRewardPopup( f351_arg0 ) then
		f351_arg1.dlc2 = true
		f351_local0 = true
	end
	if ShouldShowZMDLC3PurchaseRewardPopup( f351_arg0 ) then
		f351_arg1.dlc3 = true
		f351_local0 = true
	end
	if ShouldShowZMDLC4PurchaseRewardPopup( f351_arg0 ) then
		f351_arg1.dlc4 = true
		f351_local0 = true
	end
	return f351_local0
end

function ShouldShowZMDLC1PurchaseRewardPopup( f352_arg0 )
	local f352_local0 = Engine.StorageGetBuffer( f352_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f352_local0 and f352_local0.extraBools[3]:get() == 0 and (Engine.GetInventoryItemQuantity( f352_arg0, CoD.ZMDLCProductIDs.PSNZMDLC1 ) > 0 or Engine.GetInventoryItemQuantity( f352_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC1 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMDLC2PurchaseRewardPopup( f353_arg0 )
	local f353_local0 = Engine.StorageGetBuffer( f353_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f353_local0 and f353_local0.extraBools[4]:get() == 0 and (Engine.GetInventoryItemQuantity( f353_arg0, CoD.ZMDLCProductIDs.PSNZMDLC2 ) > 0 or Engine.GetInventoryItemQuantity( f353_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC2 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMDLC3PurchaseRewardPopup( f354_arg0 )
	local f354_local0 = Engine.StorageGetBuffer( f354_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f354_local0 and f354_local0.extraBools[5]:get() == 0 and (Engine.GetInventoryItemQuantity( f354_arg0, CoD.ZMDLCProductIDs.PSNZMDLC3 ) > 0 or Engine.GetInventoryItemQuantity( f354_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC3 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMDLC4PurchaseRewardPopup( f355_arg0 )
	local f355_local0 = Engine.StorageGetBuffer( f355_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f355_local0 and f355_local0.extraBools[6]:get() == 0 and (Engine.GetInventoryItemQuantity( f355_arg0, CoD.ZMDLCProductIDs.PSNZMDLC4 ) > 0 or Engine.GetInventoryItemQuantity( f355_arg0, CoD.ZMDLCProductIDs.XB1ZMDLC4 ) > 0) then
		return true
	else
		return false
	end
end

function ShouldShowZMHDGobbleGumPopup( f356_arg0, f356_arg1 )
	local f356_local0 = ""
	local f356_local1 = 0
	if f356_arg1 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID then
		f356_local0 = "zmhd_gobblegum_popup_ps4_enabled"
		f356_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_SKU_ID
	elseif f356_arg1 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID then
		f356_local0 = "zmhd_gobblegum_popup_xb1_enabled"
		f356_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_SKU_ID
	end
	if Engine.DvarBool( nil, f356_local0 ) and Engine.IsLootReady( f356_arg0 ) then
		return Engine.GetInventoryItemQuantity( f356_arg0, f356_local1 ) == 0
	else
		return false
	end
end

function ShouldShowURMFirstTimePopup( f357_arg0 )
	return false
end

function ShouldShowDashboardMessage( f358_arg0 )
	if not IsDvarValueEqualTo( "ui_zmPlayerMessage", "1" ) then
		return false
	end
	local f358_local0 = 32
	if not Dvar.zm_dash_stats_dashboard_ratio:exists() or not Dvar.zm_dash_stats_dashboard_min_games:exists() then
		return false
	end
	local f358_local1 = Engine.StorageGetBuffer( f358_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if not f358_local1 then
		return false
	end
	local f358_local2 = f358_local1.dashboardingTrackingHistory.bufferFull:get()
	local f358_local3 = f358_local1.dashboardingTrackingHistory.currentDashboardingTrackingHistoryIndex:get()
	if f358_local2 == 0 and f358_local3 < tonumber( Dvar.zm_dash_stats_dashboard_min_games:get() ) then
		return false
	end
	local f358_local4 = f358_local0 - 1
	if f358_local2 == 0 then
		f358_local4 = f358_local3 - 1
	end
	local f358_local5 = 0
	for f358_local6 = 0, f358_local4, 1 do
		if f358_local1.dashboardingTrackingHistory.quitType[f358_local6]:get() == CoDShared.zmDashboardStatsQuitTypes.dashboard then
			f358_local5 = f358_local5 + 1
		end
	end
	return f358_local5 / (f358_local4 + 1) >= tonumber( Dvar.zm_dash_stats_dashboard_ratio:get() )
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

function AmICarryingEnemyFlag( f362_arg0 )
	local f362_local0 = Engine.GetPlayerNameForClientNum( f362_arg0, Engine.GetPredictedClientNum( f362_arg0 ) )
	if f362_local0 == "" then
		return false
	elseif CoD.IsShoutcaster( f362_arg0 ) then
		if f362_local0 == Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f362_arg0 ), "CTF.enemyFlagCarrier" ) ) then
			return true
		else
			return f362_local0 == Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f362_arg0 ), "CTF.friendlyFlagCarrier" ) )
		end
	end
	local f362_local1 = Engine.CreateModel( Engine.GetModelForController( f362_arg0 ), "CTF.enemyFlagCarrier" )
	local f362_local2
	if f362_local1 == nil or f362_local0 ~= Engine.GetModelValue( f362_local1 ) then
		f362_local2 = false
	else
		f362_local2 = true
	end
	return f362_local2
end

function AmICarryingBomb( f363_arg0 )
	if CoD.SafeGetModelValue( Engine.GetModelForController( f363_arg0 ), "Demolition.defending" ) == false then
		return true
	elseif CoD.SafeGetModelValue( Engine.GetModelForController( f363_arg0 ), "SearchAndDestroy.defending" ) == false and Engine.GetGametypeSetting( "multiBomb" ) == 1 and not Engine.IsVisibilityBitSet( f363_arg0, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ) and not Engine.IsVisibilityBitSet( f363_arg0, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ) then
		return true
	else
		return IsModelValueEqualTo( f363_arg0, "hudItems.SDBombClient", Engine.GetPredictedClientNum( f363_arg0 ) )
	end
end

function IsFractureCountMax( f364_arg0 )
	if IsGameTypeEqualToString( "clean" ) and IsModelValueEqualTo( f364_arg0, "hudItems.cleanCarryCount", 10 ) then
		return true
	else
		
	end
end

function HasNetworkConnection()
	return Engine.CheckNetConnection() == true
end

function IsPlayerSignedInToLive( f366_arg0 )
	return Engine.IsSignedInToLive( f366_arg0 ) == true
end

function IsPlusAuthorized( f367_arg0 )
	return Engine.IsPlusAuthorized( f367_arg0 ) == true
end

function IsPlayerConnectedToCodServers( f368_arg0 )
	return Engine.IsDemonwareFetchingDone( f368_arg0 ) == true
end

function LobbyConnectedToDedicatedHost()
	return Engine.LobbyConnectedToDedicatedHost()
end

function IsDoubleXP( f370_arg0 )
	if not IsPublicOrLeagueGame() and (not IsZombies() or not IsLive()) then
		return false
	else
		local f370_local0 = Engine.GetXPScale( f370_arg0 )
		return f370_local0 and f370_local0 >= 2
	end
end

function IsDoubleWeaponXP( f371_arg0 )
	if not IsPublicOrLeagueGame() and (not IsZombies() or not IsLive()) then
		local f371_local0 = LobbyData.GetCurrentMenuTarget()
		if not f371_local0 or f371_local0.kicker ~= "MPUI_PUBLIC_MATCH_LOBBY" then
			return false
		end
	end
	local f371_local0 = Engine.GetGunXPScale( f371_arg0 )
	return f371_local0 and f371_local0 >= 2
end

function IsDoubleLootXP( f372_arg0 )
	if not IsPublicOrLeagueGame() then
		return false
	else
		local f372_local0 = Dvar.lootxp_multiplier:get()
		if not f372_local0 then
			return false
		else
			return tonumber( f372_local0 ) >= 2
		end
	end
end

function IsLootSaleActive( f373_arg0 )
	if not AreCodPointsEnabled( f373_arg0 ) then
		return false
	else
		local f373_local0 = Dvar.loot_salePercentOff:get()
		if not f373_local0 then
			return false
		else
			return tonumber( f373_local0 ) > 0
		end
	end
end

function IsBribeActive( f374_arg0 )
	return CoD.BlackMarketUtility.GetCurrentBribeTitle() ~= nil
end

function IsBundleActive( f375_arg0 )
	local f375_local0 = Dvar.loot_bundleActive:get()
	if not f375_local0 or tonumber( f375_local0 ) <= 0 then
		return false
	elseif 0 >= CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BUNDLE ) and not AreCodPointsEnabled( f375_arg0 ) then
		return false
	else
		return true
	end
end

function IsHundredBundleActive( f376_arg0 )
	local f376_local0 = Dvar.loot_rare100_enabled:get()
	if not f376_local0 or tonumber( f376_local0 ) <= 0 then
		return false
	else
		return true
	end
end

function IsRareBundle10for5Active( f377_arg0 )
	local f377_local0 = Dvar.rare_bundle_10for5_Active:get()
	if not f377_local0 or tonumber( f377_local0 ) <= 0 then
		return false
	else
		return true
	end
end

function HasHundredBundles( f378_arg0 )
	return CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f378_arg0 ) > 0
end

function HasRareBundle10for5s( f379_arg0 )
	return CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f379_arg0 ) > 0
end

function IsBlackMarketItemHundredBundle( f380_arg0, f380_arg1 )
	return IsElementPropertyValue( f380_arg0, "supplyDropType", CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE )
end

function IsBlackMarketItemRareBundle10for5( f381_arg0, f381_arg1 )
	return IsElementPropertyValue( f381_arg0, "supplyDropType", CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 )
end

function IsTrifectaBundleActive( f382_arg0 )
	if not Dvar.loot_trifectaActive:get() then
		return false
	else
		return true
	end
end

function IsSixPackBundleActive( f383_arg0 )
	local f383_local0 = Engine.DvarBool( nil, "loot_sixPack_active" )
	if not f383_local0 then
		f383_local0 = CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f383_arg0 ) > 0
	end
	return f383_local0
end

function IsSixPackBundleInCooldown( f384_arg0 )
	local f384_local0 = Engine.StorageGetBuffer( f384_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f384_local0 then
		local f384_local1 = f384_local0.playerstatslist.ARENA_MAX_RANK.statvalue:getAsString()
		if Engine.IsInRange( Engine.GetServerUTCTimeStr(), f384_local1, Engine.StringIntegerAddition( f384_local1, tostring( Engine.DvarInt( nil, "loot_sixPack_cooloffSeconds" ) ) ) ) then
			return true
		end
	end
	local f384_local1 = Engine.GetInventoryItem( f384_arg0, Engine.DvarInt( nil, "loot_sixPack_consumable_id" ) )
	if f384_local1 and tonumber( Engine.StringIntegerSubtraction( f384_local1.expireTimeStr, Engine.GetServerUTCTimeStr() ) ) >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
		return true
	end
	return false
end

function IsDailyDoubleBundleActive( f385_arg0 )
	local f385_local0 = Engine.DvarBool( nil, "loot_dailyDouble_active" )
	if not f385_local0 then
		f385_local0 = CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f385_arg0 ) > 0
	end
	return f385_local0
end

function IsDailyDoubleBundleInCooldown( f386_arg0 )
	local f386_local0 = Engine.GetInventoryItem( f386_arg0, Engine.DvarInt( nil, "loot_dailyDouble_consumable_id" ) )
	if f386_local0 and tonumber( Engine.StringIntegerSubtraction( f386_local0.expireTimeStr, Engine.GetServerUTCTimeStr() ) ) >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
		return true
	else
		return false
	end
end

function IsBundleExperimentActive( f387_arg0 )
	local f387_local0 = Engine.DvarBool( nil, "loot_3pack_active" )
	if not f387_local0 then
		f387_local0 = CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f387_arg0 ) > 0
	end
	return f387_local0
end

function IsNoDupesCrateActive( f388_arg0 )
	return Engine.DvarBool( nil, "loot_noDupeRare_active" )
end

function IsNoDupesBundleActive( f389_arg0 )
	local f389_local0 = Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" )
	if not f389_local0 then
		f389_local0 = CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f389_arg0 ) > 0
	end
	return f389_local0
end

function IsNoDupesPromoActive( f390_arg0 )
	return Engine.DvarBool( nil, "loot_noDupeRare20Bundle_active" ) and not Engine.DvarBool( nil, "loot_nodupe_experiment_active" )
end

function IsGrandSlamActive( f391_arg0 )
	return Engine.DvarBool( nil, "loot_grandSlam_active" )
end

function IsKeysForVialsOfferActive( f392_arg0 )
	local f392_local0 = Dvar.loot_vialsFromKeysOffer:get()
	if f392_local0 then
		f392_local0 = tonumber( f392_local0 )
	end
	return f392_local0 and f392_local0 > 0
end

function ShouldHideOfflineNetworkPrompt( f393_arg0 )
	if IsLive() then
		return true
	elseif ShouldShowOfflineNormalMessage( f393_arg0 ) or ShouldShowOfflineVoluntaryMessage( f393_arg0 ) then
		return true
	elseif PlayGoIsStillDownloading( f393_arg0 ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNormalMessage( f394_arg0 )
	if not IsLive() then
		if not Engine.IsPlusAuthorized( f394_arg0 ) then
			return true
		elseif not Engine.IsSignedInToLive( f394_arg0 ) then
			return true
		end
	end
	return false
end

function ShouldShowOfflineVoluntaryMessage( f395_arg0 )
	if not IsLive() and Engine.IsPlusAuthorized( f395_arg0 ) and Engine.IsSignedInToLive( f395_arg0 ) and IsPlayerConnectedToCodServers( f395_arg0 ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNetworkErrorMessage( f396_arg0 )
	return not ShouldHideOfflineNetworkPrompt( f396_arg0 )
end

function IsLobbyLocked()
	return LuaUtils.LobbyIsLocked()
end

function IsPlayerJoinable( f398_arg0 )
	local f398_local0 = nil
	if f398_arg0.activeWidget ~= nil then
		f398_local0 = f398_arg0.activeWidget:getModel()
	else
		f398_local0 = f398_arg0:getModel()
	end
	if f398_local0 then
		f398_local0 = Engine.GetModel( f398_local0, "isJoinable" )
	end
	local f398_local1
	if not f398_local0 or Engine.GetModelValue( f398_local0 ) ~= 1 then
		f398_local1 = false
	else
		f398_local1 = true
	end
	return f398_local1
end

function ShouldLobbyListBeUp()
	local f399_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f399_local1
	if f399_local0 == LobbyData.UITargets.UI_MODESELECT.id or f399_local0 == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f399_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		f399_local1 = false
	else
		f399_local1 = true
	end
	return f399_local1
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

function ShowHeaderKicker( f401_arg0 )
	return f401_arg0.showHeaderKicker == true
end

function ShowHeaderIcon( f402_arg0 )
	return f402_arg0.showHeaderIcon == true
end

function ShowHeaderEmblem( f403_arg0 )
	return f403_arg0.showHeaderEmblem == true
end

function IsFlyoutMenuOpen( f404_arg0, f404_arg1 )
	local f404_local0 = IsGlobalModelValueTrue( f404_arg0, f404_arg1, "GameSettingsFlyoutOpen" )
	if not f404_local0 then
		f404_local0 = IsGlobalModelValueTrue( f404_arg0, f404_arg1, "BonusModesFlyoutOpen" )
	end
	return f404_local0
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

function IsCPMapVoteHidden( f408_arg0 )
	if not IsCampaign() then
		return false
	else
		local f408_local0 = LobbyData.GetLobbyNav()
		if f408_local0 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f408_local0 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f408_local0 == LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id or f408_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f408_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f408_local0 == LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id or f408_local0 == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id or f408_local0 == LobbyData.UITargets.UI_DOALOBBYLANGAME.id or f408_local0 == LobbyData.UITargets.UI_DOALOBBYONLINE.id then
			return false
		else
			return not Engine.IsCPInProgress()
		end
	end
end

function IsMPMapVoteHidden( f409_arg0 )
	if not IsMultiplayer() then
		return false
	else
		return false
	end
end

function IsZMMapVoteHidden( f410_arg0 )
	if not IsZombies() then
		return false
	elseif LobbyData.GetLobbyNav() == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		return true
	else
		return false
	end
end

function PlayerIsReady( f411_arg0, f411_arg1, f411_arg2 )
	if not f411_arg0 or not f411_arg0:getModel() then
		return false
	else
		local f411_local0 = Engine.GetModel( f411_arg0:getModel(), "isReady" )
		return f411_local0 and Engine.GetModelValue( f411_local0 ) == true
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
	local f414_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f414_local1
	if f414_local0 ~= LobbyData.UITargets.UI_MODESELECT.id and f414_local0 ~= LobbyData.UITargets.UI_DOALOBBYONLINE.id and f414_local0 ~= LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id and f414_local0 ~= LobbyData.UITargets.UI_DOALOBBYLANGAME.id and f414_local0 ~= LobbyData.UITargets.UI_DOALOBBYLANCUSTOMGAME.id then
		f414_local1 = false
	else
		f414_local1 = true
	end
	return f414_local1
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
	local f418_local0 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local f418_local1
	if f418_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id and f418_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		f418_local1 = false
	else
		f418_local1 = true
	end
	return f418_local1
end

function IsCustomLobby()
	local f419_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f419_local1
	if f419_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f419_local0 ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f419_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f419_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		f419_local1 = false
	else
		f419_local1 = true
	end
	return f419_local1
end

function IsCustomMPLobby()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) ) == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id
end

function IsPublicLobby()
	local f421_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f421_local1
	if f421_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id and f421_local0 ~= LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id and f421_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f421_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f421_local1 = false
	else
		f421_local1 = true
	end
	return f421_local1
end

function IsGameLobby()
	local f422_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f422_local0 then
		local f422_local1 = LobbyData:UITargetFromId( f422_local0 )
		return f422_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME
	else
		
	end
end

function IsGameLobbyExcept( f423_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue then
		local f423_local1 = LobbyData:UITargetFromId( modelValue )
		local f423_local2 = f423_local1.name
		if f423_local2 then
			if f423_local1.name == f423_arg0 or f423_local1.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
				f423_local2 = false
			else
				f423_local2 = true
			end
		end
		return f423_local2
	else
		
	end
end

function ShouldShowCompetitiveSettingsSummary()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) ) == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id
end

function IsLobbyMode( f425_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue then
		local f425_local1 = LobbyData:UITargetFromId( modelValue )
		return f425_local1.lobbyMode == f425_arg0
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
	local f432_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f432_local1
	if f432_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f432_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id and f432_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f432_local1 = false
	else
		f432_local1 = true
	end
	return f432_local1
end

function IsLobbyWithTeamAssignment()
	local f433_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f433_local1
	if f433_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f433_local0 ~= LobbyData.UITargets.UI_MPLOBBYLANGAME.id then
		f433_local1 = false
	else
		f433_local1 = true
	end
	return f433_local1
end

function IsTeamAssignment( f434_arg0 )
	return Engine.GetGametypeSetting( "teamAssignment" ) == f434_arg0
end

function CanMuteLobbyPlayerLAN( f435_arg0, f435_arg1 )
	return Engine.GetXUID64( f435_arg0 ) ~= CoD.SafeGetModelValue( f435_arg1:getModel(), "xuid" )
end

function IsPlayerMuted( f436_arg0, f436_arg1 )
	local f436_local0 = CoD.SafeGetModelValue( f436_arg1:getModel(), "xuid" )
	if f436_local0 then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return Engine.IsPlayerMuted( f436_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, f436_local0 )
		else
			return Engine.IsPlayerMuted( f436_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f436_local0 )
		end
	else
		return false
	end
end

function IsAddControllerTextItem( f437_arg0 )
	return f437_arg0.isAddControllerTextItem
end

function IsPlayerCountItem( f438_arg0 )
	return f438_arg0.isPlayerCountItem
end

function IsSelfItem( f439_arg0, f439_arg1 )
	local f439_local0 = f439_arg0:getModel( f439_arg1, "isLocal" )
	if f439_local0 ~= nil then
		return Engine.GetModelValue( f439_local0 ) == 1
	else
		return f439_arg0.isSelfItem
	end
end

function IsFriendItem( f440_arg0 )
	return f440_arg0.isFriendItem
end

function IsGroupsItem( f441_arg0 )
	return f441_arg0.isGroupsItem
end

function ShouldPlayLobbyFadeAnim( f442_arg0, f442_arg1 )
	return f442_arg0.previousMenuName and f442_local1 or f442_arg0.previousMenuName == "ModeSelect"
end

function ShouldShowAddController( f443_arg0, f443_arg1, f443_arg2 )
	return CoD.LobbyBase.SplitscreenControllersAllowed()
end

function ShouldDisableEditCodCasterSettingsButton( f444_arg0 )
	return false
end

function ShouldShowEditCodCasterSettingsButton( f445_arg0 )
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		return true
	else
		return false
	end
end

function ShouldShowDLCWidget( f446_arg0, f446_arg1 )
	if not ShowPurchasableMap( f446_arg0, f446_arg1 ) then
		return false
	elseif CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetDLCBits(), Engine.GetDLCBitForMapName( f446_arg1 ) ) then
		return false
	else
		return true
	end
end

function ShouldSquareOpenStore( f447_arg0, f447_arg1, f447_arg2 )
	local f447_local0 = false
	for f447_local4, f447_local5 in pairs( CoD.ProductFromBit[Enum.eModes.MODE_MULTIPLAYER].products ) do
		if ShowPurchasableMapForDLCBit( f447_arg1, f447_local4 ) and not CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetDLCBits(), f447_local4 ) then
			f447_local0 = true
			break
		end
	end
	if not f447_local0 then
		return false
	elseif IsMenuInState( f447_arg0, "DefaultState" ) then
		return true
	end
	return f447_arg0[f447_arg2] and not IsElementInState( f447_arg0[f447_arg2], "DefaultState" )
end

function IsLANServerBrowserEmpty()
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" ), "count" ) ) == 0 then
		return true
	else
		return false
	end
end

function LANServerBrowserCheckFilterTest( f449_arg0, f449_arg1 )
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	elseif f449_arg0.currentFilter == f449_arg1 then
		return true
	elseif not f449_arg0.currentFilter and f449_arg1 == "all" then
		return true
	else
		return false
	end
end

function LobbyHas4PlayersOrLess()
	local f450_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f450_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	return f450_local0 <= 4
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

function PregameStateEqualToEnum( f456_arg0 )
	return Engine.GetLobbyPregameState() == f456_arg0
end

function CharacterLoadoutDrafted( f457_arg0, f457_arg1, f457_arg2 )
	if not CharacterDraftActive() then
		return false
	else
		local f457_local0 = f457_arg1:getModel()
		if f457_local0 then
			return Engine.CharacterLoadoutDrafted( Engine.GetModelValue( Engine.GetModel( f457_local0, "itemIndex" ) ), Engine.GetTeamForXUID( Engine.GetXUID64( f457_arg2 ) ) )
		else
			return false
		end
	end
end

function ItemIsBanned( f458_arg0, f458_arg1, f458_arg2 )
	local f458_local0 = CoD.CACUtility.GetItemInfoFromElement( f458_arg2, f458_arg1 )
	if f458_local0 then
		if CoD.CACUtility.ItemSlotBannedByBonuscard( f458_local0.loadoutSlot, f458_local0.itemIndex ) then
			return true
		elseif CoD.CACUtility.ItemSlotBannedByBonuscard( f458_local0.weaponSlot, f458_local0.itemIndex ) then
			return true
		elseif f458_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM or f458_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemVote( f458_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.IsItemIndexRestricted( f458_local0.itemIndex, false ) then
				return true
			end
		end
		if (f458_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT or f458_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetAttachmentVote( f458_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif f458_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemAttachmentVote( f458_local0.itemIndex, f458_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.GetAttachmentRestrictionState( f458_local0.attachmentIndex, f458_local0.itemIndex, false ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
				return true
			end
		end
		if f458_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f458_local0.itemGroup, f458_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		end
	end
	return false
end

function ItemIsProtected( f459_arg0, f459_arg1, f459_arg2 )
	local f459_local0 = CoD.CACUtility.GetItemInfoFromElement( f459_arg2, f459_arg1 )
	if f459_local0 then
		if f459_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			return Engine.GetItemVote( f459_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f459_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			return Engine.GetAttachmentVote( f459_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f459_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( f459_local0.itemIndex, f459_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f459_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f459_local0.itemGroup, f459_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		end
	end
	return false
end

function ItemIsInRestrictionState( f460_arg0, f460_arg1, f460_arg2, f460_arg3 )
	local f460_local0 = CoD.CACUtility.GetItemInfoFromElement( f460_arg2, f460_arg1 )
	if f460_local0 then
		return f460_local0.restrictionState == f460_arg3
	else
		return false
	end
end

function ClassContainsRestrictedItems( f461_arg0, f461_arg1, f461_arg2 )
	if f461_arg1 and f461_arg1:getParent() then
		local f461_local0 = f461_arg1:getParent()
		if f461_local0.id == "BuyExtraSlotsBtn" then
			return false
		end
	end
	local f461_local0 = f461_arg1:getModel( f461_arg2, "classNum" )
	if f461_local0 then
		return CoD.CACUtility.ClassContainsRestrictedItems( f461_arg2, Engine.GetModelValue( f461_local0 ) )
	end
	return false
end

function AnyClassContainsRestrictedItems( f462_arg0, f462_arg1, f462_arg2 )
	return CoD.CACUtility.AnyClassContainsRestrictedItems( f462_arg2 )
end

function AnyEquippedScorestreaksBanned( f463_arg0, f463_arg1, f463_arg2 )
	return CoD.CACUtility.AnyEquippedScorestreaksBanned( f463_arg2 )
end

function AnyCACContentBanned( f464_arg0, f464_arg1, f464_arg2 )
	return CoD.CACUtility.AnyCACItemsBanned()
end

function AnyScorestreaksBanned( f465_arg0, f465_arg1, f465_arg2 )
	return CoD.CACUtility.AnyStreaksBanned()
end

function AnySpecialistBanned()
	return CoD.CACUtility.AnySpecialistBanned()
end

function EquippedSpecialistBanned( f467_arg0 )
	return CoD.CACUtility.EquippedSpecialistBanned( f467_arg0 )
end

function CanAffordRaidPurchase( f468_arg0, f468_arg1, f468_arg2 )
	return Engine.GetModelValue( f468_arg1:getModel( f468_arg2, "cost" ) ) <= Engine.GetModelValue( f468_arg0:getModel( f468_arg2, "bank" ) )
end

function RaidPurchaseItemDisabled( f469_arg0, f469_arg1, f469_arg2 )
	return f469_arg0:getModel( f469_arg2, "disable_" .. Engine.GetModelValue( f469_arg1:getModel( f469_arg2, "id" ) ) ) ~= nil
end

function RaidPurchaseAllowedForParent( f470_arg0, f470_arg1, f470_arg2 )
	return CanAffordRaidPurchase( f470_arg0, f470_arg1:getParent(), f470_arg2 ) and not RaidPurchaseItemDisabled( f470_arg0, f470_arg1:getParent(), f470_arg2 )
end

function RaidPurchaseAllowed( f471_arg0, f471_arg1, f471_arg2 )
	return CanAffordRaidPurchase( f471_arg0, f471_arg1, f471_arg2 ) and not RaidPurchaseItemDisabled( f471_arg0, f471_arg1, f471_arg2 )
end

function IsStoreAvailable()
	local f472_local0
	if not CoD.isZombie then
		f472_local0 = Engine.IsFFOTDFetched()
	else
		f472_local0 = false
	end
	return f472_local0
end

function IsPlayerDead( f473_arg0, f473_arg1 )
	local f473_local0 = f473_arg0:getModel( f473_arg1, "clientNum" )
	if f473_local0 then
		return Engine.IsPlayerDead( f473_arg1, Engine.GetModelValue( f473_local0 ) )
	else
		return false
	end
end

function IsPlayerInLastStand( f474_arg0, f474_arg1 )
	local f474_local0 = f474_arg0:getParent()
	local f474_local1 = f474_local0 and f474_local0:getModel( f474_arg1, "clientNum" )
	if f474_local1 then
		return Engine.IsPlayerInLastStand( f474_arg1, Engine.GetModelValue( f474_local1 ) )
	else
		return false
	end
end

function IsThereRoomForAnotherSplitscreenPlayer()
	return Engine.GetUsedControllerCount() < Dvar.lobby_maxLocalPlayers:get()
end

function IsWaitingForSignInToPlaySplitscreen()
	return Engine.GetNonUsedControllerCount() > 0
end

function IsSplitscreenAndInGame( f477_arg0 )
	return Engine.IsSplitscreen()
end

function IsBGBUnlockedForOtherSplitscreenPlayers( f478_arg0, f478_arg1, f478_arg2 )
	local f478_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f478_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if CoD.isZombie and Engine.GetLobbyLocalClientCount( f478_local0 ) > 1 then
		for f478_local1 = 0, Engine.GetLobbyLocalClientCount( f478_local0 ) - 1, 1 do
			local f478_local4 = CoD.SafeGetModelValue( f478_arg1:getModel(), "dlcIndex" )
			if f478_local4 then
				if f478_local4 < CoD.CONTENT_DLC1_INDEX then
					break
				elseif f478_local1 ~= f478_arg2 and Engine.HasEntitlementByOwnership( f478_local1, "dlc" .. f478_local4 - CoD.CONTENT_DLCZM0_INDEX ) then
					return true
				end
			end
		end
	end
	return false
end

function HasPerksInAnySlot( f479_arg0 )
	local f479_local0 = Engine.GetModelForController( f479_arg0 )
	local f479_local1 = Engine.GetModelValue( Engine.CreateModel( f479_local0, "perks.perk0_count" ) )
	if f479_local1 ~= nil and f479_local1 > 0 then
		return true
	else
		f479_local1 = Engine.GetModelValue( Engine.CreateModel( f479_local0, "perks.perk1_count" ) )
		if f479_local1 ~= nil and f479_local1 > 0 then
			return true
		else
			f479_local1 = Engine.GetModelValue( Engine.CreateModel( f479_local0, "perks.perk2_count" ) )
			if f479_local1 ~= nil and f479_local1 > 0 then
				return true
			else
				return false
			end
		end
	end
end

function HasPerksInSlot0( f480_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f480_arg0 ), "perks.perk0_count" ) )
	local f480_local1
	if modelValue == nil or modelValue <= 0 then
		f480_local1 = false
	else
		f480_local1 = true
	end
	return f480_local1
end

function HasOnePerkInSlot0( f481_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f481_arg0 ), "perks.perk0_count" ) )
	local f481_local1
	if modelValue == nil or modelValue ~= 1 then
		f481_local1 = false
	else
		f481_local1 = true
	end
	return f481_local1
end

function HasTwoPerksInSlot0( f482_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f482_arg0 ), "perks.perk0_count" ) )
	local f482_local1
	if modelValue == nil or modelValue ~= 2 then
		f482_local1 = false
	else
		f482_local1 = true
	end
	return f482_local1
end

function HasPerksInSlot1( f483_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f483_arg0 ), "perks.perk1_count" ) )
	local f483_local1
	if modelValue == nil or modelValue <= 0 then
		f483_local1 = false
	else
		f483_local1 = true
	end
	return f483_local1
end

function HasOnePerkInSlot1( f484_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f484_arg0 ), "perks.perk1_count" ) )
	local f484_local1
	if modelValue == nil or modelValue ~= 1 then
		f484_local1 = false
	else
		f484_local1 = true
	end
	return f484_local1
end

function HasTwoPerksInSlot1( f485_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f485_arg0 ), "perks.perk1_count" ) )
	local f485_local1
	if modelValue == nil or modelValue ~= 2 then
		f485_local1 = false
	else
		f485_local1 = true
	end
	return f485_local1
end

function HasPerksInSlot2( f486_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f486_arg0 ), "perks.perk2_count" ) )
	local f486_local1
	if modelValue == nil or modelValue <= 0 then
		f486_local1 = false
	else
		f486_local1 = true
	end
	return f486_local1
end

function HasOnePerkInSlot2( f487_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f487_arg0 ), "perks.perk2_count" ) )
	local f487_local1
	if modelValue == nil or modelValue ~= 1 then
		f487_local1 = false
	else
		f487_local1 = true
	end
	return f487_local1
end

function HasTwoPerksInSlot2( f488_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f488_arg0 ), "perks.perk2_count" ) )
	local f488_local1
	if modelValue == nil or modelValue ~= 2 then
		f488_local1 = false
	else
		f488_local1 = true
	end
	return f488_local1
end

function IsGameTypeEqualToString( f489_arg0 )
	local f489_local0 = Engine.DvarString( nil, "g_gametype" )
	local f489_local1
	if f489_local0 == nil or f489_local0 ~= f489_arg0 then
		f489_local1 = false
	else
		f489_local1 = true
	end
	return f489_local1
end

function ShouldUseClassicHud( f490_arg0 )
	return Dvar.tu11_enableClassicMode:get()
end

function HideSpecialistAbilityContainer( f491_arg0 )
	local f491_local0 = IsGameTypeEqualToString( "gun" )
	if not f491_local0 then
		f491_local0 = ShouldUseClassicHud( f491_arg0 )
	end
	return f491_local0
end

function IsTeamBasedGame( f492_arg0 )
	if IsInGame() then
		return CoDShared.IsGametypeTeamBased()
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType() )
	end
end

function IsTeamBasedOrInfect( f493_arg0 )
	if IsInGame() then
		return CoDShared.IsGametypeTeamBased( nil, true )
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType(), true )
	end
end

function HasMoreThanNPlayersOnATeam( f494_arg0 )
	local f494_local0 = tonumber( f494_arg0 )
	local f494_local1 = Engine.GetTeams()
	local f494_local2 = {}
	for f494_local6, f494_local7 in pairs( f494_local1.clientTeams ) do
		if not f494_local2[f494_local7.team] then
			f494_local2[f494_local7.team] = {}
		end
		table.insert( f494_local2[f494_local7.team], f494_local7 )
	end
	if IsTeamBasedGame( nil ) then
		if f494_local2[Enum.team_t.TEAM_ALLIES] and f494_local0 < #f494_local2[Enum.team_t.TEAM_ALLIES] then
			return true
		elseif f494_local2[Enum.team_t.TEAM_AXIS] and f494_local0 < #f494_local2[Enum.team_t.TEAM_AXIS] then
			return true
		end
	elseif f494_local2[Enum.team_t.TEAM_FREE] and f494_local0 < #f494_local2[Enum.team_t.TEAM_FREE] then
		return true
	end
	return false
end

function CanSwitchTeams()
	local f495_local0 = Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO
	local f495_local1 = Engine.GetUsedControllerCount() > 1
	local f495_local2
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		f495_local2 = not f495_local1
	else
		f495_local2 = false
	end
	if CoDShared.IsGametypeTeamBased() and not f495_local0 then
		return true
	elseif f495_local2 then
		return true
	else
		return false
	end
end

function IsSpectatingInvalidPlayer( f496_arg0 )
	if Engine.IsVisibilityBitSet( f496_arg0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f496_arg0 ), "deadSpectator.playerIndex" ) == Engine.GetClientNum( f496_arg0 )
	end
end

function IsPublicOrLeagueGame( f497_arg0 )
	local f497_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )
	if not f497_local0 then
		f497_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	end
	return f497_local0
end

function IsBombBasedGameMode()
	local f498_local0 = Engine.DvarString( nil, "g_gametype" )
	local f498_local1
	if f498_local0 == nil or f498_local0 ~= "sd" and f498_local0 ~= "sr" and f498_local0 ~= "dem" then
		f498_local1 = false
	else
		f498_local1 = true
	end
	return f498_local1
end

function IsGametypeSettingsValue( f499_arg0, f499_arg1 )
	return Engine.GetGametypeSetting( f499_arg0 ) == f499_arg1
end

function CustomClassesEnabled()
	return Engine.GetGametypeSetting( "disableCAC" ) == 0
end

function IsGametypeTeambased()
	return CoDShared.IsGametypeTeamBased()
end

function IsGametypeItemSettingDefault( f502_arg0 )
	local f502_local0 = f502_arg0:getModel()
	local f502_local1 = f502_arg0:getParent()
	if f502_local0 then
		local f502_local2 = Engine.GetModel( f502_local0, "itemIndex" )
		local f502_local3 = Engine.GetModel( f502_local0, "attachmentIndex" )
		local f502_local4 = Engine.GetModel( f502_local0, "weaponIndex" )
		local f502_local5 = Engine.GetModel( f502_local0, "setting" )
		local f502_local6 = Engine.GetModel( f502_local0, "tabWidget" )
		local f502_local7 = Engine.GetModel( f502_local0, "weaponGroups" )
		local f502_local8, f502_local9 = nil
		if f502_local2 then
			local f502_local10 = Engine.GetModelValue( f502_local2 )
			return Engine.GetItemRestrictionState( f502_local10 ) == Engine.GetItemRestrictionState( f502_local10, true )
		elseif f502_local5 then
			local f502_local10 = Engine.GetModelValue( f502_local5 )
			return Engine.GetGametypeSetting( f502_local10 ) == Engine.GetGametypeSetting( f502_local10, true )
		elseif f502_local3 and f502_local4 then
			local f502_local10 = Engine.GetModelValue( f502_local3 )
			local f502_local11 = Engine.GetModelValue( f502_local4 )
			return Engine.GetAttachmentRestrictionState( f502_local10, f502_local11, false ) == Engine.GetAttachmentRestrictionState( f502_local10, f502_local11, true )
		elseif f502_local3 and not f502_local7 then
			return not Engine.AttachmentRestrictionStateChangedForAnyWeapon( Engine.GetModelValue( f502_local3 ) )
		elseif f502_arg0:getParent() and f502_local6 then
			local f502_local10 = Engine.GetModelValue( f502_local6 )
			if f502_local10 then
				local f502_local11 = f502_local10
				if LUI.startswith( f502_local11, "CoD." ) then
					f502_local11 = string.sub( f502_local10, 5 )
				end
				return CoD.GameSettingsUtility.UpdateBreadCrumbNodes( f502_local11 )
			end
		elseif f502_arg0:getParent() then
			local f502_local10 = f502_arg0:getParent()
			local f502_local11 = f502_local10.actionParam
			if f502_local11 then
				for f502_local15, f502_local16 in pairs( f502_local11 ) do
					if CoD.GameSettingsUtility[f502_local16] and not CoD.GameSettingsUtility.UpdateBreadCrumbNodes( f502_local16 ) then
						return false
					end
				end
			end
		end
	end
	return true
end

function IsGametypeItemSettingDefaultNew( f503_arg0, f503_arg1 )
	if f503_arg0[f503_arg1] == nil then
		return false
	end
	local f503_local0 = f503_arg0[f503_arg1]
	if f503_local0 then
		local f503_local1 = f503_local0.activeWidget
		if f503_local1 and f503_local1.showChangeIndicator then
			return not f503_local1:showChangeIndicator( f503_local0, f503_arg0 )
		end
	end
	return IsGametypeItemSettingDefault( f503_arg0 )
end

function ShouldBootUpHUD( f504_arg0 )
	if not Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
		return false
	else
		return not f504_arg0.hasBooted
	end
end

function DamageFeedbackInStage( f505_arg0, f505_arg1 )
	if IsDemoPlaying() and (Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) or Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )) then
		return false
	else
		local f505_local0 = CoD.SafeGetModelValue( f505_arg0:getModel(), "damageFeedbackState" )
		if f505_local0 then
			return f505_local0 & Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_MASK == f505_arg1
		else
			return false
		end
	end
end

function DamageFeedbackFlagSet( f506_arg0, f506_arg1 )
	if IsDemoPlaying() and (Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) or Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )) then
		return false
	else
		local f506_local0 = CoD.SafeGetModelValue( f506_arg0:getModel(), "damageFeedbackState" )
		if f506_local0 then
			return CoD.BitUtility.IsBitSet( f506_local0 >> Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_NEXT_UNUSED_BIT, f506_arg1 )
		else
			return false
		end
	end
end

function IsWeaponClipGreaterThanOrEqualTo( f507_arg0, f507_arg1 )
	local f507_local0 = Engine.GetModel( Engine.GetModelForController( f507_arg0 ), "currentWeapon.clipMaxAmmo" )
	if f507_local0 == nil then
		return false
	else
		local f507_local1 = Engine.GetModelValue( f507_local0 )
		if f507_local1 == nil then
			return false
		else
			return f507_arg1 <= f507_local1
		end
	end
end

function IsWeaponClipPercentageLessThan( f508_arg0, f508_arg1 )
	local f508_local0 = DataSources.CurrentWeapon.getModel( f508_arg0 )
	if f508_local0 then
		local f508_local1 = CoD.SafeGetModelValue( f508_local0, "clipMaxAmmo" )
		local f508_local2 = CoD.SafeGetModelValue( f508_local0, "ammoInClip" )
		if f508_local1 and f508_local2 then
			return f508_local2 / f508_local1 < f508_arg1
		end
	end
	return false
end

function WeaponUsesAmmo( f509_arg0 )
	local f509_local0 = Engine.GetModelForController( f509_arg0 )
	local f509_local1 = Engine.GetModel( f509_local0, "currentWeapon.weapon" )
	if f509_local1 == nil then
		return false
	end
	local f509_local2 = Engine.GetModelValue( f509_local1 )
	if f509_local2 == nil then
		return false
	elseif IsZombies() and (Engine.IsUnlimitedAmmoWeapon( f509_local2 ) or CoD.SafeGetModelValue( f509_local0, "currentWeapon.equippedWeaponReference" ) == "hero_gravityspikes_melee_zm" or CoD.SafeGetModelValue( f509_local0, "currentWeapon.equippedWeaponReference" ) == "dragon_gauntlet_flamethrower_zm" or CoD.SafeGetModelValue( f509_local0, "currentWeapon.equippedWeaponReference" ) == "equip_gasmask_zm" or CoD.SafeGetModelValue( f509_local0, "currentWeapon.equippedWeaponReference" ) == "lower_equip_gasmask_zm" or CoD.SafeGetModelValue( f509_local0, "currentWeapon.equippedWeaponReference" ) == "equip_hacker_zm") then
		return false
	else
		local f509_local3
		if not Engine.IsWeaponType( f509_local2, "melee" ) and not Engine.IsWeaponType( f509_local2, "riotshield" ) then
			f509_local3 = not Engine.IsWeaponType( f509_local2, "grenade" )
		else
			f509_local3 = false
		end
	end
	return f509_local3
end

function WeaponHasAmmo( f510_arg0 )
	local f510_local0 = Engine.GetModelForController( f510_arg0 )
	local f510_local1 = Engine.GetModel( f510_local0, "currentWeapon.ammoStock" )
	local f510_local2 = Engine.GetModel( f510_local0, "currentWeapon.ammoInClip" )
	if f510_local1 == nil or f510_local2 == nil then
		return false
	else
		local f510_local3 = Engine.GetModelValue( f510_local1 )
		local f510_local4 = Engine.GetModelValue( f510_local2 )
		if f510_local3 == nil or f510_local4 == nil then
			return false
		else
			return f510_local3 + f510_local4 > 0
		end
	end
end

function IsInPrematchPeriod()
	return Engine.CurrentGameTime() < Engine.GetGametypeSetting( "prematchperiod" ) * 1000
end

function IsLowAmmoClip( f512_arg0 )
	local f512_local0 = Engine.IsAmmoClipLow( f512_arg0 )
	if f512_local0 then
		return f512_local0
	else
		return false
	end
end

function IsLowAmmoDWClip( f513_arg0 )
	local f513_local0 = Engine.IsDWAmmoClipLow( f513_arg0 )
	if f513_local0 then
		return f513_local0
	else
		return false
	end
end

function IsHeroWeaponGadgetCurrentWeapon( f514_arg0, f514_arg1 )
	local f514_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f514_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if not IsModelValueTrue( f514_arg1, "playerAbilities.playerGadget3.isInUse" ) then
		return false
	elseif Engine.isValidGadgetSlot( f514_local0 ) and Engine.IsGadgetCurrentWeapon( f514_arg1, f514_local0 ) then
		f514_arg0.wasHeroWeaponActivated = true
		return true
	else
		return false
	end
end

function IsHeroWeaponInUse( f515_arg0, f515_arg1 )
	local f515_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f515_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f515_local0 ) then
		if not (not Engine.IsGadgetCurrentWeapon( f515_arg1, f515_local0 ) or not IsModelValueGreaterThan( f515_arg1, "playerAbilities.playerGadget3.powerRatio", 0 )) or IsModelValueTrue( f515_arg1, "playerAbilities.playerGadget3.isInUse" ) then
			f515_arg0.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	else
		return false
	end
end

function IsHeroWeaponOrGadgetInUse( f516_arg0, f516_arg1 )
	if IsHeroWeaponInUse( f516_arg0, f516_arg1 ) then
		return true
	elseif not Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f516_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) ) then
		return false
	else
		return IsModelValueTrue( f516_arg1, "playerAbilities.playerGadget3.isInUse" )
	end
end

function IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( f517_arg0, f517_arg1 )
	if IsHeroWeaponOrGadgetInUse( f517_arg0, f517_arg1 ) then
		return true
	else
		local f517_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f517_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
		if Engine.isValidGadgetSlot( f517_local0 ) and Engine.IsGadgetContextualWeaponActive( f517_arg1, f517_local0 ) then
			f517_arg0.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	end
end

function IsHeroWeaponThiefGadget( f518_arg0 )
	return IsModelValueEqualTo( f518_arg0, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_THIEF" )
end

function UseHeroWeaponAmmoCounter( f519_arg0, f519_arg1 )
	local f519_local0 = IsHeroWeaponInUse( f519_arg0, f519_arg1 )
	if f519_local0 then
		if not IsModelValueEqualTo( f519_arg1, "playerAbilities.playerGadget3.name", "WEAPON_HERO_ARMBLADE" ) then
			f519_local0 = not IsModelValueEqualTo( f519_arg1, "playerAbilities.playerGadget3.name", "WEAPON_HERO_GRAVITYSPIKES" )
		else
			f519_local0 = false
		end
	end
	return f519_local0
end

function IsHeroGadgetInUse( f520_arg0, f520_arg1 )
	return IsModelValueTrue( f520_arg1, "playerAbilities.playerGadget3.isInUse" )
end

function IsHeroWeaponSpeedBurst( f521_arg0, f521_arg1 )
	return IsModelValueEqualTo( f521_arg1, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_SPEED_BURST" )
end

function HasPerk( f522_arg0, f522_arg1 )
	return IsModelValueEqualTo( f522_arg0, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_COMBAT_EFFICIENCY" ) and IsModelValueEqualTo( f522_arg0, "playerAbilities.playerGadget3.isInUse", true )
end

function IsHeroWeaponOrGadgetEnergyAtLeast( f523_arg0, f523_arg1 )
	local f523_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f523_arg0 ), "playerAbilities.playerGadget3.powerRatio" ) )
	if f523_local0 == nil then
		return false
	else
		return f523_arg1 <= f523_local0
	end
end

function IsBlackMarketSpecialistRouletteActive( f524_arg0 )
	local f524_local0 = IsModelValueEqualTo( f524_arg0, "playerAbilities.playerGadget3.rouletteStatus", 1 )
	if not f524_local0 then
		f524_local0 = IsModelValueEqualTo( f524_arg0, "playerAbilities.playerGadget3.rouletteStatus", 2 )
	end
	return f524_local0
end

function IsBlackMarketSpecialistRouletteInRespin( f525_arg0 )
	local f525_local0 = IsModelValueEqualTo( f525_arg0, "playerAbilities.playerGadget3.rouletteStatus", 1 )
	if not f525_local0 then
		f525_local0 = IsModelValueEqualTo( f525_arg0, "playerAbilities.playerGadget3.rouletteStatus", 3 )
	end
	return f525_local0
end

function IsBlackMarketSpecialistAnyAbilityActive( f526_arg0 )
	local f526_local0 = IsBlackMarketSpecialistRouletteActive( f526_arg0 )
	if not f526_local0 then
		f526_local0 = IsBlackMarketSpecialistThiefActive( f526_arg0 )
	end
	return f526_local0
end

function IsBlackMarketSpecialistThiefActive( f527_arg0 )
	local f527_local0 = IsModelValueEqualTo( f527_arg0, "playerAbilities.playerGadget3.thiefStatus", 1 )
	if not f527_local0 then
		f527_local0 = IsModelValueEqualTo( f527_arg0, "playerAbilities.playerGadget3.thiefStatus", 2 )
	end
	return f527_local0
end

function IsBlackMarketSpecialistThiefCoinActive( f528_arg0 )
	return not IsModelValueEqualTo( f528_arg0, "playerAbilities.playerGadget3.thiefWeaponStatus", 0 )
end

function IsCurrentWeaponReference( f529_arg0, f529_arg1 )
	local f529_local0 = f529_arg1 .. "_" .. CoD.gameMode:lower()
	local f529_local1 = Engine.GetModel( Engine.GetModelForController( f529_arg0 ), "currentWeapon.equippedWeaponReference" )
	local f529_local2 = f529_local1 and Engine.GetModelValue( f529_local1 )
	local f529_local3
	if f529_local2 == nil or f529_local2 ~= f529_local0 then
		f529_local3 = false
	else
		f529_local3 = true
	end
	return f529_local3
end

function IsCurrentWeaponMeleeSecondary( f530_arg0 )
	local f530_local0 = "_" .. CoD.gameMode:lower()
	local f530_local1 = Engine.GetModel( Engine.GetModelForController( f530_arg0 ), "currentWeapon.equippedWeaponReference" )
	local f530_local2 = f530_local1 and Engine.GetModelValue( f530_local1 )
	if f530_local2 == nil then
		return false
	elseif f530_local2 == "knife_loadout" .. f530_local0 then
		return true
	end
	for f530_local6, f530_local7 in ipairs( CoD.CACUtility.LootMeleeWeapons ) do
		if f530_local2 == f530_local7 .. f530_local0 then
			return true
		end
	end
	return false
end

function IsCurrentViewmodelWeaponName( f531_arg0, f531_arg1 )
	local f531_local0 = f531_arg1 .. "_" .. CoD.gameMode:lower()
	local f531_local1 = Engine.GetModel( Engine.GetModelForController( f531_arg0 ), "currentWeapon.viewmodelWeaponName" )
	local f531_local2 = f531_local1 and Engine.GetModelValue( f531_local1 )
	local f531_local3
	if f531_local2 == nil or f531_local2 ~= f531_local0 then
		f531_local3 = false
	else
		f531_local3 = true
	end
	return f531_local3
end

function IsCurrentViewmodelWeaponGamemodeHiddenAmmo( f532_arg0 )
	local f532_local0 = {
		"ball",
		"briefcase_bomb",
		"briefcase_bomb_defuse"
	}
	local f532_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f532_arg0 ), "currentWeapon.viewmodelWeaponName" )
	if f532_local1 then
		for f532_local5, f532_local6 in ipairs( f532_local0 ) do
			if f532_local1 == f532_local6 .. "_" .. CoD.gameMode:lower() then
				return true
			end
		end
	end
	return false
end

function IsHeroWeaponGadgetAmmoEmpty( f533_arg0, f533_arg1 )
	local f533_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f533_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	local f533_local1 = Engine.getHeldGadgetSlotForLoadoutGadget( f533_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if not (f533_local0 == -1 or not Engine.isValidGadgetSlot( f533_local0 )) or f533_local1 ~= -1 and Engine.isValidGadgetSlot( f533_local1 ) then
		local f533_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f533_arg1 ), "playerAbilities.playerGadget3.ammo" ) )
		if f533_local2 == nil or f533_local2 < 1 then
			f533_arg0.wasHeroWeaponActivated = false
			return true
		end
	end
	return false
end

function WasHeroWeaponGadgetActivated( f534_arg0 )
	local f534_local0
	if f534_arg0.wasHeroWeaponActivated ~= nil then
		f534_local0 = f534_arg0.wasHeroWeaponActivated
	else
		f534_local0 = false
	end
	return f534_local0
end

function isHeroVersion_2_0( f535_arg0, f535_arg1 )
	return Engine.isHeroVersion_2_0( f535_arg0, f535_arg1 )
end

function IsHeroWeaponOrSpecialGadgetAvailable( f536_arg0, f536_arg1 )
	if IsHeroWeaponGadgetAvailable( f536_arg0, f536_arg1 ) then
		return true
	end
	local f536_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f536_arg1 ), "playerAbilities.playerGadget3.powerRatio" ) )
	local f536_local1
	if f536_local0 == nil or f536_local0 < 1 then
		f536_local1 = false
	else
		f536_local1 = true
	end
	return f536_local1
end

function IsSpecialGadgetAvailable( f537_arg0 )
	local f537_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f537_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f537_local0 ) then
		return Engine.IsGadgetAvailable( f537_arg0, f537_local0 )
	else
		return false
	end
end

function IsHeroAbilityWeapon( f538_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f538_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON ) )
end

function IsHeroAbilityGadget( f539_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f539_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) )
end

function IsHeroWeaponGadgetAvailable( f540_arg0, f540_arg1 )
	local f540_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f540_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f540_local0 ) then
		if not Engine.IsGadgetAvailable( f540_arg1, f540_local0 ) then
			return false
		elseif isHeroVersion_2_0( f540_arg1, f540_local0 ) then
			return Engine.IsGadgetReady( f540_arg1, f540_local0 )
		else
			return not IsHeroWeaponGadgetAmmoEmpty( f540_arg0, f540_arg1 )
		end
	else
		return false
	end
end

function IsHeroWeaponGadgetActive( f541_arg0 )
	local f541_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f541_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f541_local0 ) then
		return Engine.isGadgetActive( f541_arg0, f541_local0 )
	else
		return false
	end
end

function PulseNoLethal( f542_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f542_arg0 ), "hudItems.pulseNoLethal" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f542_local1 = CoD.CACUtility
	if f542_local1 then
		f542_local1 = CoD.CACUtility.SelectedClassIndex[f542_arg0]
	end
	if f542_local1 ~= nil and Engine.GetClassItem( f542_arg0, f542_local1, "primarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoTactical( f543_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f543_arg0 ), "hudItems.pulseNoTactical" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f543_local1 = CoD.CACUtility
	if f543_local1 then
		f543_local1 = CoD.CACUtility.SelectedClassIndex[f543_arg0]
	end
	if f543_local1 ~= nil and Engine.GetClassItem( f543_arg0, f543_local1, "secondarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoAmmo( f544_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f544_arg0 ), "hudItems.pulseNoAmmo" ) )
	local f544_local1
	if modelValue == nil or modelValue <= 0 then
		f544_local1 = false
	else
		f544_local1 = true
	end
	return f544_local1
end

function IsStickyImageActive( f545_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f545_arg0 ), "hudItems.stickyImage" ) )
	local f545_local1 = modelValue
	local f545_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f545_local2 = false
	else
		f545_local2 = f545_local1 and true
	end
	return f545_local2
end

function IsShockImageBottomActive( f546_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f546_arg0 ), "hudItems.shockImageBottom" ) )
	local f546_local1 = modelValue
	local f546_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f546_local2 = false
	else
		f546_local2 = f546_local1 and true
	end
	return f546_local2
end

function IsShockImageRightActive( f547_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f547_arg0 ), "hudItems.shockImageRight" ) )
	local f547_local1 = modelValue
	local f547_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f547_local2 = false
	else
		f547_local2 = f547_local1 and true
	end
	return f547_local2
end

function IsShockImageLeftActive( f548_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f548_arg0 ), "hudItems.shockImageLeft" ) )
	local f548_local1 = modelValue
	local f548_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f548_local2 = false
	else
		f548_local2 = f548_local1 and true
	end
	return f548_local2
end

function IsShockImageTopActive( f549_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f549_arg0 ), "hudItems.shockImageTop" ) )
	local f549_local1 = modelValue
	local f549_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f549_local2 = false
	else
		f549_local2 = f549_local1 and true
	end
	return f549_local2
end

function IsArmorOverlayActive( f550_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f550_arg0 ), "hudItems.armorOverlay" ) )
	local f550_local1 = modelValue
	local f550_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f550_local2 = false
	else
		f550_local2 = f550_local1 and true
	end
	return f550_local2
end

function IsAnyKillstreakInRangeAvailable( f551_arg0, f551_arg1, f551_arg2 )
	local f551_local0 = Engine.GetModel( Engine.GetModelForController( f551_arg0 ), "killstreaks" )
	if not f551_local0 then
		return false
	end
	for f551_local1 = f551_arg1, f551_arg2, 1 do
		local f551_local4 = Engine.GetModel( f551_local0, "killstreak" .. f551_local1 .. ".rewardAmmo" )
		local f551_local5 = f551_local4 and Engine.GetModelValue( f551_local4 )
		if f551_local5 ~= nil and f551_local5 > 0 then
			return true
		end
	end
	return false
end

function HigherKillstreakHasAmmo( f552_arg0, f552_arg1 )
	local f552_local0 = f552_arg1:getParent()
	local f552_local1 = f552_local0 and f552_local0.gridInfoTable
	if f552_local1 == nil then
		return false
	else
		local f552_local2 = 3 - f552_local1.zeroBasedIndex
		if f552_local2 >= 3 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f552_arg0, f552_local2 + 1, 4 )
		end
	end
end

function LowerKillstreakHasAmmo( f553_arg0, f553_arg1 )
	local f553_local0 = f553_arg1:getParent()
	local f553_local1 = f553_local0 and f553_local0.gridInfoTable
	if f553_local1 == nil then
		return false
	else
		local f553_local2 = 3 - f553_local1.zeroBasedIndex
		if f553_local2 == 0 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f553_arg0, 0, f553_local2 - 1 )
		end
	end
end

function EarningTowardsThisKillstreak( f554_arg0, f554_arg1 )
	local f554_local0 = Engine.GetModel( Engine.GetModelForController( f554_arg0 ), "rewardMomentum" )
	local f554_local1 = Engine.GetModel( f554_arg1:getModel(), "momentumCost" )
	local f554_local2 = Engine.GetModel( Engine.GetModelForController( f554_arg0 ), "killstreaks" )
	if f554_arg1.gridInfoTable == nil then
		return false
	elseif not f554_local1 or not f554_local0 or not f554_local2 then
		return false
	end
	local f554_local3 = Engine.GetModelValue( f554_local1 )
	local f554_local4 = Engine.GetModelValue( f554_local0 )
	if f554_local4 == nil or f554_local3 == nil or f554_local3 < f554_local4 then
		return false
	end
	local f554_local5 = 3 - f554_arg1.gridInfoTable.zeroBasedIndex
	for f554_local6 = 0, f554_local5, 1 do
		local f554_local9 = CoD.SafeGetModelValue( f554_local2, "killstreak" .. f554_local6 .. ".momentumCost" )
		if f554_local9 and f554_local4 < f554_local9 then
			return f554_local6 == f554_local5
		end
	end
	return false
end

function IsAtLeastHalfGameScore( f555_arg0, f555_arg1 )
	local f555_local0 = Engine.GetModelForController( f555_arg0 )
	local f555_local1 = f555_local0 and Engine.GetModel( f555_local0, "gameScore.scoreLimit" )
	if f555_local1 then
		f555_local1 = Engine.GetModelValue( f555_local1 )
	end
	local f555_local2 = f555_local0 and Engine.GetModel( f555_local0, f555_arg1 )
	local f555_local3 = f555_local2 and Engine.GetModelValue( f555_local2 )
	local f555_local4
	if f555_local1 == nil or f555_local3 == nil or f555_local1 > f555_local3 * 2 then
		f555_local4 = false
	else
		f555_local4 = true
	end
	return f555_local4
end

function IsCursorHintActive( f556_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f556_arg0 ), "hudItems.showCursorHint" ) )
	local f556_local1
	if modelValue == nil or modelValue ~= true then
		f556_local1 = false
	else
		f556_local1 = true
	end
	return f556_local1
end

function IsGameTypeDOA()
	return CoDShared.IsGameTypeDOA()
end

function HideScoreMeterDueToGameType()
	local f558_local0 = Engine.DvarString( nil, "g_gametype" )
	local f558_local1
	if f558_local0 == nil or f558_local0 ~= "ctf" and f558_local0 ~= "dem" and f558_local0 ~= "sd" then
		f558_local1 = false
	else
		f558_local1 = true
	end
	return f558_local1
end

function HideCyberCoreWidget( f559_arg0 )
	if Engine.GetCurrentMap() == "cp_mi_eth_prologue" and not Engine.IsCampaignModeZombies() then
		local f559_local0 = Engine.GetPlayerStats( f559_arg0 )
		return f559_local0.highestMapReached:get() == 0
	else
		return false
	end
end

function IsMapName( f560_arg0 )
	return Engine.GetCurrentMap() == f560_arg0
end

function IsAnyMapName( ... )
	for f561_local3, f561_local4 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		if f561_local4 == Engine.GetCurrentMap() then
			return true
		end
	end
end

function IsClipAmmoOnesDigitEqualTo( f562_arg0, f562_arg1, f562_arg2 )
	local f562_local0 = f562_arg0:getModel()
	if f562_local0 then
		f562_local0 = Engine.GetModel( f562_local0, "ammoInClip" )
	end
	local f562_local1 = f562_local0 and Engine.GetModelValue( f562_local0 )
	if f562_local1 == nil then
		return false
	else
		return f562_local1 % 10 == f562_arg2
	end
end

function IsClipAmmoTensDigitEqualTo( f563_arg0, f563_arg1, f563_arg2 )
	local f563_local0 = f563_arg0:getModel()
	if f563_local0 then
		f563_local0 = Engine.GetModel( f563_local0, "ammoInClip" )
	end
	local f563_local1 = f563_local0 and Engine.GetModelValue( f563_local0 )
	if f563_local1 == nil then
		return false
	else
		return (f563_local1 % 100 - f563_local1 % 10) / 10 == f563_arg2
	end
end

function HasRoundLimit( f564_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f564_arg0 ), "gameScore.roundLimit" ) ) > 0
end

function IsSingleRound( f565_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f565_arg0 ), "gameScore.roundLimit" ) ) == 1
end

function IsZombieRoundOnesDigitEqualTo( f566_arg0, f566_arg1, f566_arg2 )
	local f566_local0 = f566_arg0:getModel()
	if f566_local0 then
		f566_local0 = Engine.GetModel( f566_local0, "roundsPlayed" )
	end
	local f566_local1 = f566_local0 and Engine.GetModelValue( f566_local0 )
	if f566_local1 == nil then
		return false
	else
		return (f566_local1 - Engine.GetGametypeSetting( "startRound" )) % 10 == f566_arg2
	end
end

function IsZombieRoundTensDigitEqualTo( f567_arg0, f567_arg1, f567_arg2 )
	local f567_local0 = f567_arg0:getModel()
	if f567_local0 then
		f567_local0 = Engine.GetModel( f567_local0, "roundsPlayed" )
	end
	local f567_local1 = f567_local0 and Engine.GetModelValue( f567_local0 )
	if f567_local1 == nil then
		return false
	else
		f567_local1 = f567_local1 - Engine.GetGametypeSetting( "startRound" )
		return (f567_local1 % 100 - f567_local1 % 10) / 10 == f567_arg2
	end
end

function IsZombieRoundHundredsDigitEqualTo( f568_arg0, f568_arg1, f568_arg2 )
	local f568_local0 = f568_arg0:getModel()
	if f568_local0 then
		f568_local0 = Engine.GetModel( f568_local0, "roundsPlayed" )
	end
	local f568_local1 = f568_local0 and Engine.GetModelValue( f568_local0 )
	if f568_local1 == nil then
		return false
	else
		f568_local1 = f568_local1 - Engine.GetGametypeSetting( "startRound" )
		return (f568_local1 % 1000 - f568_local1 % 100) / 100 == f568_arg2
	end
end

function IsParentListInFocus( f569_arg0 )
	if f569_arg0.gridInfoTable then
		local f569_local0 = f569_arg0.gridInfoTable.parentGrid
		if f569_local0 and f569_local0.hasListFocus then
			return true
		end
	end
	return false
end

function IsDisabled( f570_arg0, f570_arg1 )
	local f570_local0 = f570_arg0:getModel( f570_arg1, "disabledFunction" )
	if f570_local0 then
		local f570_local1 = Engine.GetModelValue( f570_local0 )
		if f570_local1 then
			f570_arg0.disabled = f570_local1()
			return f570_local1()
		end
	end
	local f570_local1 = f570_arg0:getModel( f570_arg1, "disabled" )
	if f570_local1 then
		f570_arg0.disabled = Engine.GetModelValue( f570_local1 )
	end
	return f570_arg0.disabled
end

function IsEnabledByGametypeSetting( f571_arg0, f571_arg1 )
	if f571_arg0.enabledWithGametypeSetting ~= nil then
		return Engine.GetGametypeSetting( f571_arg0.enabledWithGametypeSetting ) == 1
	else
		return true
	end
end

function IsSelected( f572_arg0, f572_arg1 )
	local f572_local0 = f572_arg0:getModel( f572_arg1, "selected" )
	if f572_local0 then
		f572_arg0.selected = Engine.GetModelValue( f572_local0 )
	end
	return f572_arg0.selected
end

function IsStartMenuItemEquipped( f573_arg0, f573_arg1 )
	local f573_local0 = f573_arg0:getModel()
	if f573_local0 then
		local f573_local1 = CoD.SafeGetModelValue( f573_local0, "itemIndex" )
		if f573_local1 then
			return CoD.perController[f573_arg1].startMenu_equippedIndex == f573_local1
		end
	end
	return false
end

function IsFirstItem( f574_arg0 )
	return f574_arg0.isFirstItem and f574_arg0:isFirstItem()
end

function ShouldDisplayButton( f575_arg0, f575_arg1 )
	local f575_local0 = f575_arg0:getModel( f575_arg1, "tabIcon" )
	if f575_local0 then
		return Engine.GetModelValue( f575_local0 ) ~= ""
	else
		return false
	end
end

function IsHeroLocked( f576_arg0, f576_arg1 )
	if CoD.SafeGetModelValue( f576_arg0:getModel(), "disabled" ) then
		return true
	else
		return false
	end
end

function CanSelectContractHeroItem( f577_arg0, f577_arg1 )
	if IsHeroLocked( f577_arg0, f577_arg1 ) then
		return false
	end
	local f577_local0 = IsSelfModelValueTrue( f577_arg0, f577_arg1, "isActivated" )
	if not f577_local0 then
		f577_local0 = Dvar.ui_enableAllHeroes
		if f577_local0 then
			f577_local0 = Dvar.ui_enableAllHeroes:get()
		end
	end
	return f577_local0
end

function AllowLootHero( f578_arg0 )
	if IsInPermanentUnlockMenu( f578_arg0 ) then
		return false
	elseif IsFirstTimeSetup( f578_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
		return false
	elseif IsLive() and Dvar.ui_enableAllHeroes:exists() and Dvar.ui_enableAllHeroes:get() then
		return true
	else
		local f578_local0 = Engine.StorageGetBuffer( f578_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if not f578_local0 or not f578_local0.TenthSpecialistContract then
			return false
		elseif f578_local0.blackjack_contract_count:get() <= 0 and f578_local0.TenthSpecialistContract.active:get() ~= 1 then
			return false
		elseif not IsMPPublicMatchLobby() then
			return false
		else
			return true
		end
	end
end

function IsCurrentBribeForSpecialist( f579_arg0 )
	return CoD.BlackMarketUtility.BribeSpecialistIndices[f579_local0] and CoD.BlackMarketUtility.BribeSpecialistIndices[f579_local0] == CoD.SafeGetModelValue( f579_arg0:getModel(), "heroIndex" )
end

function AllowSpecialistBribeWidget( f580_arg0 )
	local f580_local0 = LobbyData.GetLobbyNav()
	local f580_local1
	if f580_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id and f580_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f580_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id and f580_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
		f580_local1 = false
	else
		f580_local1 = true
	end
	return f580_local1
end

function IsDoubleDailyContract( f581_arg0 )
	return Dvar.daily_contract_cryptokey_reward_count:get() ~= 10
end

function IsDoubleDailyContract_NoValidation( f582_arg0 )
	return Dvar.daily_contract_cryptokey_reward_count:get() ~= 10
end

function CanSelfWidgetSelectContractHeroItem( f583_arg0, f583_arg1 )
	return CanSelectContractHeroItem( f583_arg0, f583_arg1 )
end

function CanSelfWidgetStartNewHeroContract( f584_arg0, f584_arg1 )
	return IsSelfModelValueGreaterThan( f584_arg0, f584_arg1, "contractsRemaining", 0 )
end

function IsHeroWeaponAbilityNotAvailable( f585_arg0, f585_arg1 )
	return IsLive() and f585_local2 or f585_local1
end

function IsEdittingHeroOption( f586_arg0 )
	return f586_arg0.currentMode ~= CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

function IsExploringTaunts( f587_arg0 )
	return f587_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.ExploringTaunts
end

function IsEdittingTaunt( f588_arg0 )
	return f588_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingTaunt
end

function IsEdittingGestureOption( f589_arg0 )
	return f589_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingGesture
end

function CurrentPlayerHasGesture( f590_arg0, f590_arg1 )
	local f590_local0 = Engine.CurrentSessionMode()
	local f590_local1 = Engine.GetEquippedHero( f590_arg0, f590_local0 )
	return CoD.CCUtility.TauntsData.GetGestureXAnim( Engine.GetHeroBundleInfo( f590_local0, f590_local1 ), f590_arg1, Engine.GetSelectedGestureForHero( f590_arg0, f590_local0, f590_local1, f590_arg1 ) ) ~= ""
end

function ShouldShowPromptForGesture( f591_arg0, f591_arg1 )
	if IsSplitscreenAndInGame( f591_arg0 ) then
		return true
	else
		return CurrentPlayerHasGesture( f591_arg0, f591_arg1 )
	end
end

function CurrentPlayerHasAnyGesture( f592_arg0 )
	local f592_local0 = Engine.CurrentSessionMode()
	local f592_local1 = Engine.GetEquippedHero( f592_arg0, f592_local0 )
	local f592_local2 = Engine.GetHeroBundleInfo( f592_local0, f592_local1 )
	for f592_local3 = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		if CoD.CCUtility.TauntsData.GetGestureXAnim( f592_local2, f592_local3, Engine.GetSelectedGestureForHero( f592_arg0, f592_local0, f592_local1, f592_local3 ) ) ~= "" then
			return true
		end
	end
	return false
end

function ShouldShowGesturePrompt( f593_arg0 )
	if IsSplitscreenAndInGame( f593_arg0 ) then
		return true
	else
		return CurrentPlayerHasAnyGesture( f593_arg0 )
	end
end

function IsHeroColorOption( f594_arg0 )
	return f594_arg0.isColorOption
end

function FirstTimeSetup_IsActive( f595_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f595_arg0 ), "firstTimeFlowState" ) ) ~= CoD.CCUtility.FirstTimeFlowState.None
end

function FirstTimeSetup_Overview( f596_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f596_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Overview
end

function FirstTimeSetup_ChangedCharacter( f597_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f597_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.SelectionChanged
end

function FirstTimeSetup_Complete( f598_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f598_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Complete
end

function IsCurrentSelectedHeroOption( f599_arg0, f599_arg1 )
	local f599_local0 = f599_arg0:getModel( f599_arg1, "optionIndex" )
	if f599_local0 then
		local f599_local1 = Engine.GetModelValue( f599_local0 )
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				return f599_local1 == CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				return f599_local1 == CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			return f599_local1 == CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			return f599_local1 == CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
		end
	end
	return false
end

function IsCurrentLockedHeroOption( f600_arg0, f600_arg1 )
	local f600_local0 = f600_arg0:getModel()
	if f600_local0 then
		if CoD.SafeGetModelValue( f600_local0, "isLocked" ) then
			return true
		elseif CoD.SafeGetModelValue( f600_local0, "isBMClassified" ) then
			return true
		end
	end
	return false
end

function IsCurrentNewHeroOption( f601_arg0, f601_arg1, f601_arg2 )
	if (IsCampaign() or IsMultiplayer()) and IsProgressionEnabled( f601_arg2 ) then
		local f601_local0 = f601_arg1:getModel( f601_arg2, "optionIndex" )
		if f601_local0 then
			local f601_local1 = Engine.GetModelValue( f601_local0 )
			local f601_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
			local f601_local3 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
			if f601_local2 ~= nil and f601_local3 ~= nil then
				return Engine.IsCharacterCustomizationItemNew( f601_arg2, f601_local2, f601_local3, f601_local1 )
			end
		end
	end
	return false
end

function ShouldHideItemHeroOption( f602_arg0, f602_arg1 )
	if not IsMultiplayer() or not IsProgressionEnabled( f602_arg1 ) then
		return true
	elseif CoD.SafeGetModelValue( f602_arg0:getModel(), "isColorOption" ) == true then
		return true
	end
	local f602_local0 = f602_arg0:getModel()
	if f602_local0 then
		if CoD.SafeGetModelValue( f602_local0, "optionIndex" ) == 1 then
			return true
		elseif IsSelfModelValueTrue( f602_arg0, f602_arg1, "isClassified" ) or not IsSelfModelValueNilOrZero( f602_arg0, f602_arg1, "isBMClassified" ) then
			return true
		end
	end
	return false
end

function IsCurrentTauntNew( f603_arg0, f603_arg1, f603_arg2 )
	if f603_arg1.index and f603_arg1.xanim and f603_arg1.tauntType then
		return Engine.IsTauntNew( f603_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f603_arg1.tauntType, f603_arg1.index, f603_arg1.xanim )
	else
		return false
	end
end

function IsCurrentGestureNew( f604_arg0, f604_arg1, f604_arg2 )
	if f604_arg1.index and f604_arg1.xanim and f604_arg1.heroName and f604_arg1.gestureType then
		local f604_local0 = Enum.eModes.MODE_MULTIPLAYER
		local f604_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		if f604_arg1.xanim ~= "" then
			return Engine.IsGestureNew( f604_arg2, f604_local0, f604_local1, f604_arg1.gestureType, f604_arg1.index, f604_arg1.xanim .. ";" .. f604_arg1.heroName )
		end
	end
	return false
end

function AreAnyTauntsGesturesInListNew( f605_arg0, f605_arg1, f605_arg2 )
	local f605_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f605_local1 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, f605_local0 )
	local f605_local2 = CoD.CCUtility.customizationMode
	if f605_arg0.tauntType then
		for f605_local3 = 0, CoD.CCUtility.TauntsData.GetTauntCount( f605_local1, f605_arg0.tauntType ) - 1, 1 do
			if Engine.IsTauntNew( f605_arg2, f605_local2, f605_local0, f605_arg0.tauntType, f605_local3, CoD.CCUtility.TauntsData.GetTauntXAnim( f605_local1, f605_arg0.tauntType, f605_local3 ) ) then
				return true
			end
		end
	elseif f605_arg0.gestureType then
		local f605_local3 = Engine.GetHeroList( f605_local2 )
		f605_local3 = f605_local3[f605_local0 + 1].assetName
		for f605_local4 = 0, CoD.CCUtility.TauntsData.GetGestureCount( f605_local1, f605_arg0.gestureType ) - 1, 1 do
			local f605_local7 = CoD.CCUtility.TauntsData.GetGestureXAnim( f605_local1, f605_arg0.gestureType, f605_local4 )
			if f605_local7 ~= "" and Engine.IsGestureNew( f605_arg2, f605_local2, f605_local0, f605_arg0.gestureType, f605_local4, f605_local7 .. ";" .. f605_local3 ) then
				return true
			end
		end
	end
	return false
end

function IsObjectiveActive( f606_arg0, f606_arg1 )
	local f606_local0 = f606_arg0:getModel( f606_arg1, "status" )
	if f606_local0 then
		local f606_local1
		if Engine.GetModelValue( f606_local0 ) ~= "current" and Engine.GetModelValue( f606_local0 ) ~= "active" then
			f606_local1 = false
		else
			f606_local1 = true
		end
		return f606_local1
	else
		return false
	end
end

function IsObjectiveComplete( f607_arg0, f607_arg1 )
	local f607_local0 = f607_arg0:getModel( f607_arg1, "status" )
	if f607_local0 then
		return Engine.GetModelValue( f607_local0 ) == "done"
	else
		return false
	end
end

function IsObjectiveFailed( f608_arg0, f608_arg1 )
	local f608_local0 = f608_arg0:getModel( f608_arg1, "status" )
	if f608_local0 then
		return Engine.GetModelValue( f608_local0 ) == "failed"
	else
		return false
	end
end

function IsObjectiveDescription( f609_arg0, f609_arg1 )
	local f609_local0 = f609_arg0:getModel( f609_arg1, "status" )
	if f609_local0 then
		return Engine.GetModelValue( f609_local0 ) == "description"
	else
		return false
	end
end

function IsObjectiveHidden( f610_arg0, f610_arg1 )
	if f610_arg0:getModel() == nil then
		return true
	else
		local f610_local0 = Engine.GetModel( f610_arg0:getModel(), "state" )
		local f610_local1 = f610_local0 and Engine.GetModelValue( f610_local0 )
		local f610_local2 = Engine.GetPredictedClientNum( f610_arg1 )
		if f610_local1 == nil or f610_local1 == CoD.OBJECTIVESTATE_INVISIBLE then
			return true
		else
			local f610_local3 = Engine.GetModel( f610_arg0:getModel(), "clientUseMask" )
			local f610_local4 = f610_local3 and Engine.GetModelValue( f610_local3 )
			if f610_local4 == nil or f610_local4 == 0 then
				return false
			else
				return f610_local4 & 1 << Engine.GetPredictedClientNum( f610_arg1 ) == 0
			end
		end
	end
end

function IsObjectiveRequirementLabelHidden( f611_arg0, f611_arg1 )
	local f611_local0 = Engine.GetModel( Engine.GetModelForController( f611_arg1 ), "interactivePrompt.activeObjectiveID" )
	if f611_local0 then
		f611_local0 = Engine.GetModelValue( f611_local0 )
	end
	if f611_local0 and f611_arg0.objIndex == f611_local0 then
		if f611_arg0.recenter then
			f611_arg0:recenter()
		end
		return false
	else
		return true
	end
end

function IsListSelectionMode( f612_arg0, f612_arg1 )
	return f612_arg0.currentMode == f612_arg1
end

function IsPaintJobCustomItem( f613_arg0, f613_arg1 )
	if DataSources.WeaponOptions.getCurrentFilterItem() == "paintjob" then
		local f613_local0 = f613_arg0:getModel( f613_arg1, "ref" )
		if f613_local0 and Engine.GetModelValue( f613_local0 ) == "paintshop_1" then
			return true
		end
	end
	return false
end

function IsPaintJobCustomListButton( f614_arg0, f614_arg1 )
	local f614_local0 = f614_arg0:getModel( f614_arg1, "type" )
	local f614_local1 = f614_arg0:getModel( f614_arg1, "paintjobSlot" )
	local f614_local2 = f614_arg0:getModel( f614_arg1, "paintjobIndex" )
	if f614_local0 and f614_local1 and f614_local2 then
		if Engine.GetModelValue( f614_local0 ) == "paintjob" and Engine.GetModelValue( f614_local1 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and Engine.GetModelValue( f614_local2 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			return true
		end
	end
	return false
end

function IsCPHeroWeapon( f615_arg0, f615_arg1 )
	if CoD.isCampaign then
		local f615_local0 = CoD.CACUtility.loadoutSlotNames
		local f615_local1 = CoD.perController[f615_arg1].classNum
		if f615_arg0.currentActiveSlot then
			local f615_local2 = f615_arg0.currentActiveSlot
			if (f615_local2 == f615_local0.primaryWeapon or f615_local2 == f615_local0.secondaryWeapon) and CoD.CACUtility.IsCPHeroWeapon( CoD.GetClassItem( f615_arg1, f615_local1, f615_local2 ) ) then
				return true
			end
		end
	end
	return false
end

function IsToggleVariantEnabled()
	return Dvar.gunsmith_enable_toggle_variant:exists() and Dvar.gunsmith_enable_toggle_variant:get()
end

function HasGlobalHintText( f617_arg0 )
	return DataSources.PerController.hasHintText( f617_arg0 )
end

function HasHintText( f618_arg0 )
	local f618_local0 = f618_arg0:getModel()
	if f618_local0 then
		local f618_local1 = Engine.GetModel( f618_local0, "hintText" )
		if f618_local1 and Engine.GetModelValue( f618_local1 ) ~= "" then
			return true
		end
	end
	return false
end

function PDV_SlotHasCollectible( f619_arg0, f619_arg1 )
	local f619_local0 = f619_arg0:getModel( f619_arg1, "collectibleSlot" )
	if f619_local0 and Engine.GetCollectibleInBunkSlot( f619_arg1, Engine.GetModelValue( f619_local0 ) ) ~= nil then
		return true
	else
		return false
	end
end

function IsGunsmithItemWeaponOptionLocked( f620_arg0, f620_arg1, f620_arg2 )
	if not IsLive() then
		local f620_local0 = GetUnlockSessionMode( f620_arg1, f620_arg2 )
		if f620_local0 == Enum.eModes.MODE_MULTIPLAYER or f620_local0 == Enum.eModes.MODE_ZOMBIES then
			return false
		end
	end
	local f620_local0 = f620_arg1:getModel( f620_arg2, "weaponOptionSubIndex" )
	local f620_local1 = f620_arg1:getModel( f620_arg2, "weaponOptionType" )
	local f620_local2 = CoD.GetCustomization( f620_arg2, "weapon_index" )
	if f620_local0 and f620_local1 then
		local f620_local3 = Engine.GetModelValue( f620_local0 )
		local f620_local4 = Engine.GetModelValue( f620_local1 )
		local f620_local5 = Engine.GetWeaponOptionGroupIndex( f620_local3, f620_local4 )
		if f620_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local f620_local6 = CoD.perController[f620_arg2].gunsmithVariantModel
			if f620_local6 then
				local f620_local7 = Engine.GetModel( f620_local6, "attachment1" )
				if f620_local7 then
					f620_local2 = Engine.GetModelValue( f620_local7 )
				end
			end
		end
		if (f620_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or f620_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and f620_local3 == 0 then
			return false
		elseif f620_local4 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if f620_local3 == 0 then
				return false
			end
			local f620_local6 = Engine.GetAttachmentRef( f620_local2, f620_local3 )
			for f620_local10, f620_local11 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f620_local6 == f620_local11 then
					return CoD.CACUtility.GetWeaponPLevel( f620_arg2, f620_local2 ) < f620_local10
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( f620_arg2, f620_local2, f620_local5 )
	end
	return false
end

function Gunsmith_OnState( f621_arg0, f621_arg1 )
	local f621_local0 = f621_arg0:getModel( f621_arg1, "param" )
	if f621_local0 then
		local f621_local1 = Engine.GetModelValue( f621_local0 )
		if f621_local1 then
			local f621_local2 = Engine.GetModel( Engine.GetGlobalModel(), f621_local1 )
			if f621_local2 then
				return Engine.GetModelValue( f621_local2 ) == 1
			end
		end
	end
end

function IsGunsmithCurrentACVEquipped( f622_arg0, f622_arg1, f622_arg2 )
	local f622_local0 = Engine.GetModelValue( CoD.perController[f622_arg2].gunsmithAttachmentVariantModel )
	local f622_local1 = f622_arg1:getModel( f622_arg2, "variantIndex" )
	if f622_local1 then
		return f622_local0 == Engine.GetModelValue( f622_local1 )
	else
		return false
	end
end

function IsGunsmithReticleAllowedForOptic( f623_arg0, f623_arg1, f623_arg2, f623_arg3 )
	local f623_local0 = CoD.perController[f623_arg2].gunsmithVariantModel
	if f623_local0 and f623_arg3 then
		local f623_local1 = Engine.GetModel( f623_local0, f623_arg3 )
		if f623_local1 then
			local f623_local2 = Engine.GetModelValue( f623_local1 )
			local f623_local3 = Engine.GetAttachmentRefByIndex( f623_local2 )
			if CoD.CACUtility.EmptyItemIndex < f623_local2 then
				return CoD.CACUtility.attachmentsWithCustReticle[f623_local3]
			end
		end
	end
	return false
end

function Gunsmith_DoesACVExistForAttachment( f624_arg0, f624_arg1, f624_arg2, f624_arg3 )
	local f624_local0 = CoD.perController[f624_arg2].gunsmithVariantModel
	local f624_local1 = CoD.SafeGetModelValue( f624_local0, "weaponIndex" )
	local f624_local2 = CoD.SafeGetModelValue( f624_local0, f624_arg3 )
	if f624_local1 and f624_local2 then
		local f624_local3 = Engine.GetAttachmentCosmeticVariantCountForAttachment( Engine.GetItemRef( f624_local1, Enum.eModes.MODE_MULTIPLAYER ), f624_local2 )
		if f624_local3 and f624_local3 > 0 then
			return true
		end
	end
	return false
end

function Gunsmith_DisablePaintjobVariantSlot( f625_arg0, f625_arg1 )
	if not Paintjobs_IsEnabled( f625_arg0, f625_arg1 ) or IsUserContentRestricted( f625_arg1 ) then
		return true
	else
		return false
	end
end

function ShouldHidePaintJobOptionInZM( f626_arg0, f626_arg1, f626_arg2 )
	if not IsLive() or IsUserContentRestricted( f626_arg2 ) then
		return true
	elseif CoD.CraftUtility.GetWeaponGroupName( f626_arg2 ) == "weapon_knife" then
		return true
	else
		return false
	end
end

function Gunsmith_IsEnabled( f627_arg0, f627_arg1 )
	if IsPlayerAGuest( f627_arg1 ) then
		return false
	elseif IsIntDvarNonZero( "gunsmith_enabled" ) and IsLive() then
		return true
	else
		return false
	end
end

function Gunsmith_ValidVariantNameEntered( f628_arg0, f628_arg1 )
	local f628_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f628_arg1 ), "Gunsmith.validVariantNameEntered" ) )
	if f628_local0 ~= nil and f628_local0 == true then
		f628_arg0:makeFocusableWithoutResettingNavigation()
		return true
	else
		f628_arg0:makeNotFocusable()
		return false
	end
end

function Gunsmith_IsVariantOccupied( f629_arg0, f629_arg1 )
	local f629_local0 = Engine.GetModel( f629_arg0:getModel(), "variantIndex" )
	if f629_local0 and CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( Engine.GetModelValue( f629_local0 ) ) then
		return true
	else
		return false
	end
end

function Gunsmith_IsAttachmentEquipped( f630_arg0, f630_arg1, f630_arg2 )
	local f630_local0 = f630_arg1:getModel()
	local f630_local1 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f630_arg2, CoD.perController[f630_arg2].gunsmithVariantModel )
	if f630_local0 then
		local f630_local2 = Engine.GetModel( f630_local0, "attachmentIndex" )
		if f630_local2 then
			local f630_local3 = Engine.GetModelValue( f630_local2 )
			for f630_local7, f630_local8 in ipairs( f630_local1 ) do
				if f630_local8 == f630_local3 then
					return true
				end
			end
		end
	end
	return false
end

function Gunsmith_IsItemMutuallyExclusiveWithSelection( f631_arg0, f631_arg1 )
	local f631_local0 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f631_arg1, CoD.perController[f631_arg1].gunsmithVariantModel )
	local f631_local1 = CoD.CACUtility.EmptyItemIndex
	local f631_local2 = f631_arg0:getModel( f631_arg1, "attachmentIndex" )
	local f631_local3 = CoD.GetCustomization( f631_arg1, "weapon_index" )
	if f631_local2 then
		f631_local1 = Engine.GetModelValue( f631_local2 )
		for f631_local7, f631_local8 in ipairs( f631_local0 ) do
			if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f631_local8 and f631_local1 ~= f631_local8 then
				return not Engine.AreAttachmentsCompatible( f631_local3, Engine.GetAttachmentIndexByAttachmentTableIndex( f631_local3, f631_local1, Enum.eModes.MODE_MULTIPLAYER ), Engine.GetAttachmentIndexByAttachmentTableIndex( f631_local3, f631_local8, Enum.eModes.MODE_MULTIPLAYER ), Enum.eModes.MODE_MULTIPLAYER )
			end
		end
	end
	return false
end

function Gunsmith_IsAttachmentNew( f632_arg0, f632_arg1, f632_arg2 )
	local f632_local0 = CoD.GetCustomization( f632_arg2, "weapon_index" )
	local f632_local1 = f632_arg1:getModel()
	if f632_local1 then
		local f632_local2 = Engine.GetModel( f632_local1, "attachmentIndex" )
		if f632_local2 then
			return Engine.IsAttachmentNew( f632_arg2, f632_local0, Engine.GetAttachmentIndexByAttachmentTableIndex( f632_local0, Engine.GetModelValue( f632_local2 ) ) )
		end
	end
	return false
end

function Gunsmith_IsCamoEquipped( f633_arg0, f633_arg1, f633_arg2 )
	local f633_local0 = f633_arg1:getModel()
	local f633_local1 = Engine.GetModelValue( f633_arg0:getModel() )
	if f633_local0 then
		local f633_local2 = Engine.GetModel( f633_local0, "itemIndex" )
		if f633_local2 and f633_local1 == Engine.GetModelValue( f633_local2 ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsReticleEquipped( f634_arg0, f634_arg1, f634_arg2 )
	local f634_local0 = f634_arg1:getModel()
	local f634_local1 = Engine.GetModelValue( f634_arg0:getModel() )
	if f634_local0 then
		local f634_local2 = Engine.GetModel( f634_local0, "weaponOptionSubIndex" )
		if f634_local2 and f634_local1 == Engine.GetModelValue( f634_local2 ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsCamoNew( f635_arg0, f635_arg1, f635_arg2 )
	local f635_local0 = CoD.GetCustomization( f635_arg2, "weapon_index" )
	local f635_local1 = f635_arg1:getModel()
	if f635_local1 then
		local f635_local2 = Engine.GetModel( f635_local1, "itemIndex" )
		if f635_local2 then
			return Engine.IsWeaponOptionNew( f635_arg2, f635_local0, Engine.GetModelValue( f635_local2 ) )
		end
	end
	return false
end

function Gunsmith_IsReticleNew( f636_arg0, f636_arg1, f636_arg2 )
	local f636_local0 = CoD.GetCustomization( f636_arg2, "weapon_index" )
	local f636_local1 = f636_arg1:getModel()
	local f636_local2 = CoD.perController[f636_arg2].gunsmithVariantModel
	if f636_local1 and f636_local2 then
		local f636_local3 = CoD.SafeGetModelValue( f636_local1, "weaponOptionSubIndex" )
		local f636_local4 = CoD.SafeGetModelValue( f636_local1, "weaponOptionType" )
		local f636_local5 = CoD.SafeGetModelValue( f636_local2, "attachment1" )
		if f636_local3 and f636_local4 and f636_local5 then
			return Engine.IsWeaponOptionNew( f636_arg2, f636_local5, Engine.GetWeaponOptionGroupIndex( f636_local3, f636_local4 ) )
		end
	end
	return false
end

function Gunsmith_IsACVItemNew( f637_arg0, f637_arg1 )
	local f637_local0 = CoD.GetCustomization( f637_arg1, "weapon_index" )
	local f637_local1 = f637_arg0.variantIndex
	local f637_local2 = f637_arg0.attachmentTableIndex
	if CoD.SafeGetModelValue( f637_arg0:getModel(), "isBMClassified" ) == true then
		return false
	elseif f637_local2 and f637_local1 and CoD.CACUtility.EmptyItemIndex < f637_local1 then
		return IsACVItemNewHelper( f637_arg1, f637_local0, f637_local2, f637_local1, Enum.eModes.MODE_MULTIPLAYER )
	else
		return false
	end
end

function Gunsmith_AnyOpticsNew( f638_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewOptics( f638_arg0, CoD.GetCustomization( f638_arg0, "weapon_index" ) )
end

function Gunsmith_AnyAttachmentsNew( f639_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments( f639_arg0, CoD.GetCustomization( f639_arg0, "weapon_index" ) )
end

function Gunsmith_AnyCamosNew( f640_arg0 )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewCamos( f640_arg0, CoD.GetCustomization( f640_arg0, "weapon_index" ) )
end

function Gunsmith_AnyNewItemsForWeapon( f641_arg0, f641_arg1 )
	local f641_local0 = f641_arg0:getModel( f641_arg1, "itemIndex" )
	if f641_local0 then
		local f641_local1 = Engine.GetModelValue( f641_local0 )
		if f641_local1 > CoD.CACUtility.EmptyItemIndex then
			return CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( f641_arg1, f641_local1 )
		end
	end
	return false
end

function Gunsmith_AnyNewWeaponsOrAttachmentsForGroupButton( f642_arg0, f642_arg1 )
	local f642_local0 = Engine.GetModel( f642_arg0:getModel(), "categoryRef" )
	if f642_local0 then
		return CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( f642_arg1, Engine.GetModelValue( f642_local0 ) )
	else
		return false
	end
end

function Gunsmith_AnyNewWeaponsOrAttachments( f643_arg0 )
	for f643_local0 = 1, #CoD.Craft.WeaponGroupNames, 1 do
		if CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( f643_arg0, CoD.Craft.WeaponGroupNames[f643_local0].weapon_category ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsSpecialWeapon( f644_arg0, f644_arg1, f644_arg2 )
	local f644_local0 = CoD.CraftUtility.GetWeaponGroupName( f644_arg2 )
	local f644_local1 = false
	local f644_local2 = Engine.GetItemRef( CoD.GetCustomization( f644_arg2, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if f644_local0 == "weapon_launcher" or f644_local0 == "weapon_knife" or f644_local2 == "special_discgun" or f644_local2 == "knife_ballistic" then
		f644_local1 = true
	end
	return f644_local1
end

function Gunsmith_IsHandguns( f645_arg0, f645_arg1, f645_arg2 )
	local f645_local0 = CoD.CraftUtility.GetWeaponGroupName( f645_arg2 )
	local f645_local1 = Engine.GetItemRef( CoD.GetCustomization( f645_arg2, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if f645_local0 == "weapon_pistol" or f645_local0 == "weapon_special" and f645_local1 ~= "special_discgun" and f645_local1 ~= "knife_ballistic" then
		return true
	else
		return false
	end
end

function Gunsmith_IsSnipers( f646_arg0, f646_arg1, f646_arg2 )
	return CoD.CraftUtility.GetWeaponGroupName( f646_arg2 ) == "weapon_sniper"
end

function Gunsmith_IsLockedForDemo( f647_arg0, f647_arg1, f647_arg2 )
	local f647_local0 = f647_arg1:getModel()
	if f647_local0 then
		local f647_local1 = Engine.GetModel( f647_local0, "name" )
		if f647_local1 and Engine.GetModelValue( f647_local1 ) == "MP_CLASSIFIED" then
			return true
		end
	end
	return false
end

function Gunsmith_IsVariantCountEmpty( f648_arg0, f648_arg1 )
	local f648_local0 = f648_arg0:getModel( f648_arg1, "itemIndex" )
	if f648_local0 then
		local f648_local1 = Engine.GetModelValue( f648_local0 )
		if f648_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( f648_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function Gunsmith_IsSnapshotWeaponLevelMax( f649_arg0, f649_arg1, f649_arg2 )
	local f649_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f649_arg2, f649_arg1 )
	if f649_local0 == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	local f649_local1 = CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode()
	local f649_local2 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f649_local1 )
	local f649_local3 = 0
	local f649_local4 = Engine.GetGunCurrentRank( f649_arg2, f649_local0, f649_local1 )
	local f649_local5 = Engine.GetGunNextRank( f649_arg2, f649_local0, f649_local1 )
	local f649_local6 = Engine.GetGunCurrentRankXP( f649_arg2, f649_local0, f649_local1 )
	local f649_local7 = Engine.StorageGetBuffer( f649_arg2, f649_local2 )
	if f649_local7 then
		f649_local3 = f649_local7.ItemStats[f649_local0].xp:get()
	end
	local f649_local8
	if f649_local4 ~= f649_local5 or f649_local6 > f649_local3 then
		f649_local8 = false
	else
		f649_local8 = true
	end
	return f649_local8
end

function Gunsmith_IsSnapshotGunLevelExists( f650_arg0, f650_arg1, f650_arg2 )
	local f650_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f650_arg2, f650_arg1 )
	if Engine.IsCampaignGame() then
		local f650_local1 = CoD.GetAttachments( f650_local0 )
		if f650_local1 then
			f650_local1 = #CoD.GetAttachments( f650_local0 ) > 0
		end
		local f650_local2
		if f650_local0 ~= CoD.CACUtility.EmptyItemIndex then
			f650_local2 = f650_local1
		else
			f650_local2 = false
		end
		return f650_local2
	else
		return f650_local0 ~= CoD.CACUtility.EmptyItemIndex
	end
end

function Gunsmith_IsNewVariant( f651_arg0 )
	if CoD.perController[f651_arg0].emptyVariantSelected and CoD.perController[f651_arg0].emptyVariantSelected == true then
		return true
	else
		return false
	end
end

function Gunsmith_IsCurrentVariantChanged( f652_arg0 )
	if not Gunsmith_IsNewVariant( f652_arg0 ) then
		local f652_local0 = CoD.perController[f652_arg0].gunsmithVariantModel
		if f652_local0 and CoD.CraftUtility.Gunsmith.IsCurrentVariantChanged( f652_arg0, f652_local0 ) then
			return true
		end
	end
	return false
end

function IsAttachmentLockedInWeaponBuildKits( f653_arg0, f653_arg1 )
	if not IsProgressionEnabled( f653_arg1 ) then
		return false
	else
		local f653_local0 = CoD.GetCustomization( f653_arg1, "weapon_index" )
		local f653_local1 = f653_arg0:getModel( f653_arg1, "attachmentIndex" )
		if f653_local0 and f653_local1 then
			return Engine.IsItemAttachmentLocked( f653_arg1, f653_local0, Engine.GetAttachmentIndexByAttachmentTableIndex( f653_local0, Engine.GetModelValue( f653_local1 ), Enum.eModes.MODE_ZOMBIES ) )
		else
			
		end
	end
end

function IsAttachmentSlotLocked( f654_arg0, f654_arg1, f654_arg2 )
	if IsZombies() and not IsProgressionEnabled( f654_arg1 ) then
		return false
	end
	local f654_local0 = f654_arg0:getModel( f654_arg1, "weaponIndex" )
	if not f654_local0 then
		return false
	end
	local f654_local1 = Engine.IsAttachmentSlotLocked( f654_arg1, Engine.GetModelValue( f654_local0 ), f654_arg2 )
	if f654_local1 == nil then
		f654_local1 = false
	end
	return f654_local1
end

function IsGridOn( f655_arg0, f655_arg1 )
	return Engine.GetProfileVarInt( f655_arg0, f655_arg1 ) ~= 0
end

function Paintjobs_IsOccupied( f656_arg0, f656_arg1 )
	local f656_local0 = Engine.GetModel( f656_arg0:getModel(), "paintjobSlot" )
	local f656_local1 = Engine.GetModel( f656_arg0:getModel(), "paintjobIndex" )
	if f656_local0 and f656_local1 and CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( Engine.GetModelValue( f656_local0 ), Engine.GetModelValue( f656_local1 ) ) then
		return true
	else
		return false
	end
end

function Paintjobs_DisableGroupsFeature()
	return Dvar.ui_emblemDisableGroups.exists() and Dvar.ui_emblemDisableGroups:get()
end

function Paintjobs_IsCountGreaterThanZero( f658_arg0, f658_arg1 )
	local f658_local0 = f658_arg0:getModel( f658_arg1, "itemIndex" )
	if f658_local0 then
		local f658_local1 = Engine.GetModelValue( f658_local0 )
		if f658_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( f658_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function Paintjobs_IsEnabled( f659_arg0, f659_arg1 )
	if IsSplitscreenSafehouse() then
		return false
	elseif IsPlayerAGuest( f659_arg1 ) then
		return false
	elseif IsLive() then
		return true
	else
		return false
	end
end

function IsGroupSlotAvailable( f660_arg0 )
	local f660_local0 = Engine.GetModel( Engine.GetModelForController( f660_arg0 ), "Emblem.EmblemProperties.groupsUsed" )
	local f660_local1 = false
	if f660_local0 then
		f660_local1 = Engine.GetModelValue( f660_local0 ) < Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS - 1
	end
	return f660_local1
end

function IsEmptyLayerAvailable( f661_arg0 )
	local f661_local0 = Engine.GetModel( Engine.GetModelForController( f661_arg0 ), "Emblem.EmblemProperties.layersUsed" )
	local f661_local1 = false
	local f661_local2 = CoD.perController[f661_arg0].totalLayers
	if f661_local0 then
		f661_local1 = Engine.GetModelValue( f661_local0 ) < f661_local2
	end
	return f661_local1
end

function BrowseModeLinkedLayer( f662_arg0, f662_arg1, f662_arg2 )
	local f662_local0 = IsModelValueEqualToEnum( f662_arg2, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f662_local0 then
		f662_local0 = Emblems_IsLayerLinked( f662_arg1, f662_arg2 )
		if f662_local0 then
			f662_local0 = IsModelValueGreaterThanOrEqualTo( f662_arg2, "Emblem.EmblemProperties.linkedLayerCount", 2 )
			if f662_local0 then
				if not Emblem_IsLayerGrouped( f662_arg1, f662_arg2 ) then
					f662_local0 = IsGroupSlotAvailable( f662_arg2 )
					if f662_local0 then
						f662_local0 = not Paintjobs_DisableGroupsFeature()
					end
				else
					f662_local0 = false
				end
			end
		end
	end
	return f662_local0
end

function BrowseModeGroupedLayer( f663_arg0, f663_arg1, f663_arg2 )
	local f663_local0 = IsModelValueEqualToEnum( f663_arg2, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f663_local0 then
		f663_local0 = Emblem_IsLayerGrouped( f663_arg1, f663_arg2 )
		if f663_local0 then
			f663_local0 = not Paintjobs_DisableGroupsFeature()
		end
	end
	return f663_local0
end

function BrowseModeOneLayerLinked( f664_arg0, f664_arg1, f664_arg2 )
	local f664_local0 = IsBrowseMode( f664_arg2 )
	if f664_local0 then
		if not IsLayerEmpty( f664_arg0, f664_arg1, f664_arg2 ) then
			f664_local0 = Emblems_IsLayerLinked( f664_arg1, f664_arg2 )
			if f664_local0 then
				f664_local0 = not Paintjobs_DisableGroupsFeature()
			end
		else
			f664_local0 = false
		end
	end
	return f664_local0
end

function BrowseMode( f665_arg0, f665_arg1, f665_arg2 )
	local f665_local0 = IsBrowseMode( f665_arg2 )
	if f665_local0 then
		if not IsLayerEmpty( f665_arg0, f665_arg1, f665_arg2 ) then
			f665_local0 = not Paintjobs_DisableGroupsFeature()
		else
			f665_local0 = false
		end
	end
	return f665_local0
end

function GroupsDisabledMode( f666_arg0, f666_arg1, f666_arg2 )
	local f666_local0 = Paintjobs_DisableGroupsFeature()
	if f666_local0 then
		f666_local0 = IsBrowseMode( f666_arg2 )
		if f666_local0 then
			f666_local0 = not IsLayerEmpty( f666_arg0, f666_arg1, f666_arg2 )
		end
	end
	return f666_local0
end

function IsUserContentRestricted( f667_arg0 )
	return Engine.IsUserContentRestricted( f667_arg0 )
end

function IsUserChatRestricted( f668_arg0 )
	return Engine.IsUserChatRestricted( f668_arg0 )
end

function IsSplitscreenSafehouse()
	if CoD.isSafehouse and Engine.IsSplitscreen() then
		return true
	else
		return false
	end
end

function IsPaintshopButtonDisabled( f670_arg0 )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( f670_arg0 )
	end
end

function IsDataVaultEmblemButtonDisabled( f671_arg0 )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( f671_arg0 )
	end
end

function CraftItemIsReadOnly( f672_arg0, f672_arg1 )
	local f672_local0 = Engine.GetModel( f672_arg0:getModel(), "readOnly" )
	if f672_local0 and Engine.GetModelValue( f672_local0 ) == 1 then
		return true
	else
		return false
	end
end

function Challenges_IsCategoryLocked( f673_arg0, f673_arg1, f673_arg2 )
	local f673_local0 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f673_local0 then
		return returnTable
	end
	local f673_local1 = Engine.GetPlayerStats( f673_arg1, CoD.STATS_LOCATION_NORMAL, f673_local0.index )
	local f673_local2 = f673_local1.PlayerStatsList.RANK.StatValue:get()
	local f673_local3 = f673_local1.PlayerStatsList.PLEVEL.StatValue:get()
	local f673_local4, f673_local5 = nil
	local f673_local6 = Engine.GetChallengeInfoForImages( f673_arg1, f673_arg2, f673_local0.index )
	if #f673_local6 == 0 then
		if f673_arg0 ~= nil then
			f673_arg0:processEvent( {
				name = "set_unlock_instructions",
				rank = f673_local2,
				plevel = f673_local3,
				unlockRank = f673_local4,
				unlockPLevel = f673_local5,
				mode = f673_local0.index
			} )
		end
		return true
	end
	for f673_local14, f673_local15 in ipairs( f673_local6 ) do
		if f673_local15.currentChallengeRow ~= nil then
			return false
		end
		local f673_local10 = f673_local15.challengeRow
		if f673_local10 ~= nil then
			local f673_local11 = "gamedata/stats/" .. f673_local0.name .. "/statsmilestones" .. f673_local15.tableNum + 1 .. ".csv"
			local f673_local12 = tonumber( Engine.TableLookupGetColumnValueForRow( f673_local11, f673_local10, CoD.ChallengesUtility.UnlockRankCol ) )
			local f673_local13 = tonumber( Engine.TableLookupGetColumnValueForRow( f673_local11, f673_local10, CoD.ChallengesUtility.UnlockPLevelCol ) )
			if f673_local12 == nil then
				f673_local12 = 0
			end
			if f673_local13 == nil then
				f673_local13 = 0
			end
			if f673_local4 == nil or f673_local5 == nil then
				f673_local4 = f673_local12
				f673_local5 = f673_local13
			end
			if f673_local12 < f673_local4 then
				f673_local4 = f673_local12
			end
			if f673_local13 < f673_local5 then
				f673_local5 = f673_local13
			end
		end
	end
	if f673_local5 < f673_local3 then
		return false
	elseif f673_local3 == f673_local5 and f673_local4 <= f673_local2 then
		return false
	elseif f673_arg0 ~= nil then
		f673_arg0:processEvent( {
			name = "set_unlock_instructions",
			rank = f673_local2,
			plevel = f673_local3,
			unlockRank = f673_local4,
			unlockPLevel = f673_local5,
			mode = f673_local0.index
		} )
	end
	return true
end

function IsPercentTextAt100Percent( f674_arg0 )
	if type( f674_arg0 ) ~= "string" then
		return false
	else
		return f674_arg0 == Engine.Localize( "MPUI_PERCENT", 100 )
	end
end

function TextHeightGreaterThan( f675_arg0, f675_arg1, f675_arg2 )
	if f675_arg0[f675_arg1] == nil then
		return false
	else
		local f675_local0, f675_local1 = f675_arg0[f675_arg1]:getTextWidthAndHeight()
		return f675_arg2 < f675_local1
	end
end

function Emblems_CanEnterEmblemEditor( f676_arg0, f676_arg1 )
	if not CraftSlotsFullByStorageType( f676_arg1, Enum.StorageFileType.STORAGE_EMBLEMS ) then
		return true
	elseif not IsPreBuiltEmblemTab( f676_arg1 ) then
		return true
	else
		return false
	end
end

function Emblems_IsDefaultEmblemEquipped( f677_arg0, f677_arg1, f677_arg2 )
	local f677_local0 = f677_arg1:getModel( f677_arg2, "emblemIndex" )
	if f677_local0 then
		local f677_local1 = Engine.GetModelValue( f677_local0 )
		local f677_local2 = Engine.GetProfileVarInt( f677_arg2, "default_emblem_index" )
		if f677_local2 ~= CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX and f677_local2 == f677_local1 then
			return true
		end
	end
	return false
end

function Emblem_IsOccupied( f678_arg0, f678_arg1 )
	if f678_arg0:getModel() then
		local f678_local0 = Engine.GetModel( f678_arg0:getModel(), "emblemIndex" )
		if f678_local0 and CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( Engine.GetModelValue( f678_local0 ) ) then
			return true
		end
	end
	return false
end

function Emblems_IsEnabled( f679_arg0, f679_arg1 )
	if IsPlayerAGuest( f679_arg1 ) then
		return false
	else
		return true
	end
end

function CommunityOptionsEnabled()
	return true
end

function Emblems_IsLayerLinked( f681_arg0, f681_arg1 )
	local f681_local0 = f681_arg0:getModel( f681_arg1, "isLinked" )
	if f681_local0 then
		return Engine.GetModelValue( f681_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGrouped( f682_arg0, f682_arg1 )
	local f682_local0 = f682_arg0:getModel( f682_arg1, "isGrouped" )
	if f682_local0 then
		return Engine.GetModelValue( f682_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGroupedByLayerIndex( f683_arg0, f683_arg1 )
	local f683_local0 = CoD.GetCustomization( f683_arg1, "type" )
	if CoD.perController[f683_arg1].selectedLayerIndex ~= nil then
		local f683_local1 = Engine.GetSelectedLayerData( f683_arg1, CoD.perController[f683_arg1].selectedLayerIndex, f683_local0 )
		return f683_local1.isGrouped
	else
		return false
	end
end

function IsEmblemEmpty( f684_arg0 )
	return Engine.IsEmblemEmpty( f684_arg0, CoD.GetCustomization( f684_arg0, "type" ), CoD.perController[f684_arg0].totalLayers )
end

function Emblem_IsAnyLayerEmpty( f685_arg0 )
	local f685_local0 = CoD.perController[f685_arg0].totalLayers
	if f685_local0 == Engine.GetUsedLayerCount( f685_arg0, CoD.GetCustomization( f685_arg0, "type" ), f685_local0 ) then
		return false
	else
		return true
	end
end

function IsPaintjobAllSidesEmpty( f686_arg0 )
	local f686_local0 = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	return Engine.IsEmblemEmpty( f686_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP, f686_local0 ) and Engine.IsEmblemEmpty( f686_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, f686_local0 ) and Engine.IsEmblemEmpty( f686_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT, f686_local0 )
end

function IsLayerEmpty( f687_arg0, f687_arg1, f687_arg2 )
	if f687_arg0.layerCarousel ~= nil then
		local f687_local0 = f687_arg0.layerCarousel.currentStartRow
		f687_arg1 = f687_arg0.layerCarousel.layoutItems[f687_arg0.layerCarousel.currentStartRow][f687_arg0.layerCarousel.currentStartColumn]
	end
	if f687_arg1 then
		local f687_local0 = f687_arg1:getModel( f687_arg2, "layerIndex" )
		if not f687_local0 then
			return true
		elseif Engine.GetSelectedLayerIconID( f687_arg2, Engine.GetModelValue( f687_local0 ) ) == CoD.emblem.INVALID_ID then
			return true
		else
			return false
		end
	else
		return true
	end
end

function IsEditMode( f688_arg0 )
	return CoD.GetEditorProperties( f688_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT
end

function IsBrowseMode( f689_arg0 )
	return CoD.GetEditorProperties( f689_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
end

function IsClipboardEmpty( f690_arg0 )
	return CoD.GetEditorProperties( f690_arg0, "isClipboardEmpty" ) == CoD.emblem.CLIPBOARDSTATE.EMPTY
end

function IsClipboardEmblemGrouped( f691_arg0 )
	return Engine.IsClipboardEmblemGrouped()
end

function Emblem_HideClipboard( f692_arg0, f692_arg1 )
	if CoD.GetEditorProperties( f692_arg1, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT then
		return true
	elseif IsClipboardEmpty( f692_arg1 ) then
		return true
	else
		return false
	end
end

function Emblem_CanPastFromClipboard( f693_arg0, f693_arg1 )
	local f693_local0 = CoD.GetEditorProperties( f693_arg1, "editorMode" )
	local f693_local1 = IsGroupSlotAvailable( f693_arg1 )
	local f693_local2 = IsClipboardEmblemGrouped( f693_arg1 )
	if f693_local0 == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE then
		if not f693_local2 then
			return true
		elseif f693_local2 and f693_local1 then
			return true
		end
	end
	return false
end

function IsSelectedColorEmpty( f694_arg0, f694_arg1 )
	local f694_local0 = CoD.GetEditorProperties( f694_arg1, "colorNum" )
	local f694_local1 = CoD.GetEditorProperties( f694_arg1, "isColor0NoColor" )
	local f694_local2 = CoD.GetEditorProperties( f694_arg1, "isColor1NoColor" )
	if f694_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 and f694_local1 == 1 then
		return true
	elseif f694_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 and f694_local2 == 1 then
		return true
	else
		return false
	end
end

function Emblems_IsIconNew( f695_arg0, f695_arg1 )
	local f695_local0 = CoD.SafeGetModelValue( f695_arg0:getModel(), "iconID" )
	local f695_local1 = CoD.CraftUtility.GetDecalCategoryTypeByID( CoD.perController[f695_arg1].selectedDecalCategory )
	if f695_local0 and f695_local1 and f695_local1 == "BLACKMARKET" then
		return Engine.IsEmblemIconNew( f695_arg1, f695_local0 )
	else
		return false
	end
end

function Emblems_IsAnyEmblemNew( f696_arg0 )
	return CoD.CraftUtility.Emblems.IsAnyEmblemNew( f696_arg0 )
end

function Emblems_IsEmblemNew( f697_arg0, f697_arg1 )
	local f697_local0 = CoD.SafeGetModelValue( f697_arg0:getModel(), "emblemIndex" )
	if f697_local0 then
		if CoD.perController[f697_arg1].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
			f697_local0 = CoD.BlackMarketUtility.GetLootEmblemSortIndexFromEmblemId( f697_local0 )
		end
		return CoD.CraftUtility.Emblems.IsEmblemNew( f697_arg1, f697_local0, CoD.perController[f697_arg1].selectedEmblemTabStorageType )
	else
		return false
	end
end

function Emblems_IsMaterialNew( f698_arg0, f698_arg1 )
	local f698_local0 = CoD.SafeGetModelValue( f698_arg0:getModel(), "materialID" )
	local f698_local1 = CoD.CraftUtility.GetMaterialCategoryTypeByID( CoD.perController[f698_arg1].selectedMaterialCategory )
	if f698_local0 and f698_local1 and f698_local1 ~= "general" then
		return CoD.CraftUtility.Emblems.IsMaterialNew( f698_arg1, f698_local0 )
	else
		return false
	end
end

function CallingCards_IsEnabled( f699_arg0, f699_arg1 )
	if IsPlayerAGuest( f699_arg1 ) then
		return false
	else
		return true
	end
end

function CallingCards_IsGetPublicProfileComplete( f700_arg0, f700_arg1 )
	local f700_local0 = Engine.GetModel( Engine.GetModelForController( f700_arg1 ), "CallingCardsIdentity.GetPublicProfileComplete" )
	local f700_local1 = false
	if f700_local0 then
		f700_local1 = Engine.GetModelValue( f700_local0 )
	end
	return f700_local1
end

function CallingCards_IsNew( f701_arg0, f701_arg1 )
	local f701_local0 = CoD.SafeGetModelValue( f701_arg0:getModel(), "iconId" )
	if f701_local0 then
		return Engine.IsEmblemBackgroundNew( f701_arg1, f701_local0 )
	else
		return false
	end
end

function CallingCards_IsAnyNew( f702_arg0 )
	return Engine.IsAnyEmblemBackgroundNew( f702_arg0, BlackMarketHideMasterCallingCards() )
end

function IsViewingSideBetCallingCardSet( f703_arg0 )
	return CoD.perController[f703_arg0].BlackMarketUtility_CurrentCallingCardSetName == CoD.BlackMarketUtility.SideBetSetName
end

function CraftSlotsFullByStorageType( f704_arg0, f704_arg1 )
	if IsLive() and CoD.CraftUtility.GetTotalAllowedSlotsByFileType( f704_arg0, f704_arg1 ) <= CoD.CraftUtility.GetUsedSlotsByFileType( f704_arg0, f704_arg1 ) then
		return true
	else
		return false
	end
end

function IsPreBuiltEmblemTab( f705_arg0 )
	if CoD.perController[f705_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS or CoD.perController[f705_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
		return true
	else
		return false
	end
end

function IsEmblemEditor( f706_arg0 )
	return CoD.GetCustomization( f706_arg0, "type" ) == Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
end

function IsPaintshop( f707_arg0 )
	local f707_local0 = CoD.GetCustomization( f707_arg0, "type" )
	local f707_local1
	if f707_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT and f707_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP and f707_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT then
		f707_local1 = false
	else
		f707_local1 = true
	end
	return f707_local1
end

function IsMaxPrestigeLevel( f708_arg0 )
	return Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= CoD.PrestigeUtility.GetCurrentPLevel( f708_arg0 )
end

function IsMaxPrestigeLevelForMode( f709_arg0, f709_arg1 )
	return Engine.GetPrestigeCap( f709_arg1 ) <= CoD.PrestigeUtility.GetCurrentPLevel( f709_arg0, f709_arg1 )
end

function IsPrestigeLevelAtZero( f710_arg0 )
	return CoD.PrestigeUtility.GetCurrentPLevel( f710_arg0 ) == 0
end

function IsAtXPCap( f711_arg0 )
	local f711_local0 = Engine.GetPlayerStats( f711_arg0, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	return Engine.GetXPCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= f711_local0.PlayerStatsList.RANKXP.StatValue:get()
end

function IsPrestigeRewardSpent( f712_arg0, f712_arg1 )
	return Engine.IsPrestigeTokenSpentByType( f712_arg0, f712_arg1, CoD.PrestigeUtility.GetPrestigeGameMode() )
end

function IsInPermanentUnlockMenu( f713_arg0 )
	return CoD.PrestigeUtility.isInPermanentUnlockMenu
end

function IsInBubblegumSelectMenu( f714_arg0, f714_arg1 )
	return IsGlobalModelValueTrue( f714_arg0, f714_arg1, "inBubblegumBuffSelectMenu" )
end

function IsPermanentlyUnlocked( f715_arg0, f715_arg1 )
	local f715_local0 = nil
	local f715_local1 = f715_arg0.itemIndex
	local f715_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f715_local1 then
		f715_local0 = f715_arg0:getModel( f715_arg1, "itemIndex" )
		if f715_local0 then
			f715_local1 = Engine.GetModelValue( f715_local0 )
		end
	end
	if f715_local1 then
		if Engine.GetItemCost( f715_local1, f715_local2 ) == 0 then
			return true
		else
			return Engine.IsItemPermanentlyUnlocked( f715_arg1, f715_local1, f715_local2 )
		end
	else
		return false
	end
end

function HavePermanentUnlockTokens( f716_arg0 )
	return Engine.GetPermanentUnlockCount( f716_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() ) > 0
end

function PlayerGainedPrestigeMaster( f717_arg0, f717_arg1 )
	local f717_local0 = CoD.GetPlayerStats( f717_arg0, CoD.STATS_LOCATION_NORMAL, f717_arg1 )
	local f717_local1
	if Engine.GetXPCap( f717_arg1 ) > f717_local0.PlayerStatsList.RANKXP.StatValue:get() or f717_local0.PlayerStatsList.PLEVEL.StatValue:get() ~= Engine.GetPrestigeCap( f717_arg1 ) - 1 then
		f717_local1 = false
	else
		f717_local1 = true
	end
	return f717_local1
end

function IsGameModeParagonCapable( f718_arg0 )
	return LuaUtils.IsGameModeParagonCapable( f718_arg0 )
end

function IsInParagonCapableGameMode()
	return IsGameModeParagonCapable( Engine.CurrentSessionMode() )
end

function IsPrestigeMasterFromRankModel( f720_arg0, f720_arg1, f720_arg2 )
	local f720_local0 = f720_arg0:getModel()
	if f720_arg2 ~= "" and f720_local0 then
		f720_local0 = Engine.GetModel( f720_local0, f720_arg2 )
	end
	local f720_local1 = tonumber( f720_local0 and Engine.GetModelValue( f720_local0 ) )
	local f720_local2
	if f720_local1 == nil or f720_local1 <= CoD.MAX_RANK + 1 then
		f720_local2 = false
	else
		f720_local2 = true
	end
	return f720_local2
end

function CompetitiveSettingsEnabled( f721_arg0 )
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

function ArenaRankIncreased( f725_arg0 )
	local f725_local0 = Engine.GetPlaylistInfoByID( Engine.GetPlaylistID() )
	local f725_local1 = CoD.GetPlayerStats( f725_arg0 )
	return CoD.ArenaUtility.GetRank( f725_local1.arenaStats[f725_local0.playlist.arenaSlot].matchStartPoints:get() ) < CoD.ArenaUtility.GetRank( f725_local1.arenaStats[f725_local0.playlist.arenaSlot].points:get() )
end

function WonLastTeamBasedMatch( f726_arg0 )
	local f726_local0 = Engine.StorageGetBuffer( f726_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f726_local0 then
		return false
	else
		local f726_local1 = f726_local0.AfterActionReportStats
		local f726_local2 = f726_local1.alliesScore:get()
		local f726_local3 = f726_local1.axisScore:get()
		local f726_local4 = f726_local1.team:get()
		if f726_local4 ~= Enum.team_t.TEAM_ALLIES and f726_local4 ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif f726_local4 == Enum.team_t.TEAM_ALLIES then
			return f726_local3 < f726_local2
		else
			return f726_local2 < f726_local3
		end
	end
end

function LostLastTeamBasedMatch( f727_arg0 )
	local f727_local0 = Engine.StorageGetBuffer( f727_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f727_local0 then
		return false
	else
		local f727_local1 = f727_local0.AfterActionReportStats
		local f727_local2 = f727_local1.alliesScore:get()
		local f727_local3 = f727_local1.axisScore:get()
		local f727_local4 = f727_local1.team:get()
		if f727_local4 ~= Enum.team_t.TEAM_ALLIES and f727_local4 ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif f727_local4 == Enum.team_t.TEAM_ALLIES then
			return f727_local2 < f727_local3
		else
			return f727_local3 < f727_local2
		end
	end
end

function IsBetaSeason()
	local f728_local0 = Engine.GetCurrentArenaSeason()
	local f728_local1
	if f728_local0 < 0 or f728_local0 >= 2 then
		f728_local1 = false
	else
		f728_local1 = true
	end
	return f728_local1
end

function SelectedPlayerIsArenaMaster( f729_arg0, f729_arg1 )
	local f729_local0 = f729_arg0:getModel( f729_arg1, "arenaPoints" )
	if f729_local0 ~= nil then
		local f729_local1 = Engine.GetModelValue( f729_local0 )
		if f729_local1 ~= nil then
			return CoD.ArenaUtility.IsMaster( f729_local1 )
		end
	end
	return false
end

function ArenaChallengesEnabled()
	return Dvar.arena_enableArenaChallenges:get()
end

function IsParamModelEqualTo( f731_arg0, f731_arg1 )
	return f731_arg0 and Engine.GetModelValue( f731_arg0 ) == f731_arg1
end

function IsParamModelEqualToString( f732_arg0, f732_arg1 )
	return f732_arg0 and Engine.GetModelValue( f732_arg0 ) == f732_arg1
end

function IsModelParameterValueEnum( f733_arg0, f733_arg1 )
	return f733_arg0 and Engine.GetModelValue( f733_arg0 ) == f733_arg1
end

function IsModelValueNonEmptyString( f734_arg0, f734_arg1 )
	local f734_local0 = Engine.GetModel( Engine.GetModelForController( f734_arg0 ), f734_arg1 )
	local f734_local1 = f734_local0 and Engine.GetModelValue( f734_local0 )
	local f734_local2
	if f734_local1 == nil or f734_local1 == "" then
		f734_local2 = false
	else
		f734_local2 = true
	end
	return f734_local2
end

function IsModelValueTrue( f735_arg0, f735_arg1 )
	local f735_local0 = Engine.GetModel( Engine.GetModelForController( f735_arg0 ), f735_arg1 )
	local f735_local1 = f735_local0 and Engine.GetModelValue( f735_local0 )
	local f735_local2
	if f735_local1 == nil or f735_local1 ~= true then
		f735_local2 = false
	else
		f735_local2 = true
	end
	return f735_local2
end

function IsModelValueGreaterThan( f736_arg0, f736_arg1, f736_arg2 )
	local f736_local0 = Engine.GetModel( Engine.GetModelForController( f736_arg0 ), f736_arg1 )
	local f736_local1 = f736_local0 and Engine.GetModelValue( f736_local0 )
	local f736_local2
	if f736_local1 == nil or f736_arg2 >= f736_local1 then
		f736_local2 = false
	else
		f736_local2 = true
	end
	return f736_local2
end

function IsModelValueLessThan( f737_arg0, f737_arg1, f737_arg2 )
	local f737_local0 = Engine.GetModel( Engine.GetModelForController( f737_arg0 ), f737_arg1 )
	local f737_local1 = f737_local0 and Engine.GetModelValue( f737_local0 )
	local f737_local2
	if f737_local1 == nil or f737_local1 >= f737_arg2 then
		f737_local2 = false
	else
		f737_local2 = true
	end
	return f737_local2
end

function IsModelValueGreaterThanOrEqualTo( f738_arg0, f738_arg1, f738_arg2 )
	local f738_local0 = Engine.GetModel( Engine.GetModelForController( f738_arg0 ), f738_arg1 )
	local f738_local1 = f738_local0 and Engine.GetModelValue( f738_local0 )
	local f738_local2
	if f738_local1 == nil or f738_arg2 == nil or f738_arg2 > f738_local1 then
		f738_local2 = false
	else
		f738_local2 = true
	end
	return f738_local2
end

function IsModelValueLessThanOrEqualTo( f739_arg0, f739_arg1, f739_arg2 )
	local f739_local0 = Engine.GetModel( Engine.GetModelForController( f739_arg0 ), f739_arg1 )
	local f739_local1 = f739_local0 and Engine.GetModelValue( f739_local0 )
	local f739_local2
	if f739_local1 == nil or f739_local1 > f739_arg2 then
		f739_local2 = false
	else
		f739_local2 = true
	end
	return f739_local2
end

function IsModelValueEqualTo( f740_arg0, f740_arg1, f740_arg2 )
	local f740_local0 = Engine.GetModel( Engine.GetModelForController( f740_arg0 ), f740_arg1 )
	local f740_local1 = f740_local0 and Engine.GetModelValue( f740_local0 )
	local f740_local2
	if f740_local1 == nil or f740_local1 ~= f740_arg2 then
		f740_local2 = false
	else
		f740_local2 = true
	end
	return f740_local2
end

function IsModelValueEqualToEitherValue( f741_arg0, f741_arg1, f741_arg2, f741_arg3 )
	local f741_local0 = Engine.GetModel( Engine.GetModelForController( f741_arg0 ), f741_arg1 )
	local f741_local1 = f741_local0 and Engine.GetModelValue( f741_local0 )
	local f741_local2
	if f741_local1 == nil or f741_local1 ~= f741_arg2 and f741_local1 ~= f741_arg3 then
		f741_local2 = false
	else
		f741_local2 = true
	end
	return f741_local2
end

function IsModelValueEqualToEnum( f742_arg0, f742_arg1, f742_arg2 )
	local f742_local0 = Engine.GetModel( Engine.GetModelForController( f742_arg0 ), f742_arg1 )
	local f742_local1 = f742_local0 and Engine.GetModelValue( f742_local0 )
	local f742_local2
	if f742_local1 == nil or f742_local1 ~= f742_arg2 then
		f742_local2 = false
	else
		f742_local2 = true
	end
	return f742_local2
end

function IsModelValueEnumBitSet( f743_arg0, f743_arg1, f743_arg2 )
	local f743_local0 = Engine.GetModel( Engine.GetModelForController( f743_arg0 ), f743_arg1 )
	local f743_local1 = f743_local0 and Engine.GetModelValue( f743_local0 )
	local f743_local2
	if f743_local1 ~= nil then
		f743_local2 = CoD.BitUtility.IsBitSet( f743_local1, f743_arg2 )
	else
		f743_local2 = false
	end
	return f743_local2
end

function ModelValueStartsWith( f744_arg0, f744_arg1, f744_arg2 )
	local f744_local0 = Engine.GetModel( Engine.GetModelForController( f744_arg0 ), f744_arg1 )
	local f744_local1 = f744_local0 and Engine.GetModelValue( f744_local0 )
	local f744_local2
	if f744_local1 ~= nil then
		f744_local2 = LUI.startswith( f744_local1, f744_arg2 )
	else
		f744_local2 = false
	end
	return f744_local2
end

function ModelValueStartsWithAny( f745_arg0, f745_arg1, ... )
	local f745_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f745_arg0 ), f745_arg1 )
	if not f745_local0 then
		return false
	end
	for f745_local4, f745_local5 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		if LUI.startswith( f745_local0, f745_local5 ) then
			return true
		end
	end
	return false
end

function IsControllerModelValueEqualToSelfModelValue( f746_arg0, f746_arg1, f746_arg2, f746_arg3 )
	if not f746_arg0:getModel() then
		return false
	else
		local f746_local0 = Engine.GetModel( Engine.GetModelForController( f746_arg1 ), f746_arg2 )
		if not f746_local0 then
			return false
		else
			local f746_local1 = Engine.GetModel( f746_arg0:getModel(), f746_arg3 )
			if not f746_local1 then
				return false
			else
				return Engine.GetModelValue( f746_local0 ) == Engine.GetModelValue( f746_local1 )
			end
		end
	end
end

function IsControllerModelValueGreaterThanOrEqualToSelfModelValue( f747_arg0, f747_arg1, f747_arg2, f747_arg3 )
	if not f747_arg0:getModel() then
		return false
	else
		local f747_local0 = Engine.GetModel( Engine.GetModelForController( f747_arg1 ), f747_arg2 )
		if not f747_local0 then
			return false
		else
			local f747_local1 = Engine.GetModel( f747_arg0:getModel(), f747_arg3 )
			if not f747_local1 then
				return false
			else
				return Engine.GetModelValue( f747_local1 ) <= Engine.GetModelValue( f747_local0 )
			end
		end
	end
end

function IsControllerModelValueDefaultID64Value( f748_arg0, f748_arg1, f748_arg2 )
	local f748_local0 = Engine.GetModelForController( f748_arg1 )
	if f748_arg2 ~= "" and f748_local0 then
		f748_local0 = Engine.GetModel( f748_local0, f748_arg2 )
	end
	local f748_local1 = Engine.GetModelValue( f748_local0 )
	local f748_local2
	if f748_local1 == nil or f748_local1 ~= Engine.DefaultID64Value() then
		f748_local2 = false
	else
		f748_local2 = true
	end
	return f748_local2
end

function IsGlobalModelValueEqualToSelfModelValue( f749_arg0, f749_arg1, f749_arg2, f749_arg3 )
	if not f749_arg0:getModel() then
		return false
	else
		local f749_local0 = Engine.GetModel( Engine.GetGlobalModel(), f749_arg2 )
		if not f749_local0 then
			return false
		else
			local f749_local1 = Engine.GetModel( f749_arg0:getModel(), f749_arg3 )
			if not f749_local1 then
				return false
			else
				return Engine.GetModelValue( f749_local0 ) == Engine.GetModelValue( f749_local1 )
			end
		end
	end
end

function IsSelfModelValueNil( f750_arg0, f750_arg1, f750_arg2 )
	local f750_local0 = f750_arg0:getModel()
	if f750_arg2 ~= "" and f750_local0 then
		f750_local0 = Engine.GetModel( f750_local0, f750_arg2 )
	end
	return f750_local0 == nil
end

function IsSelfModelValueNilOrZero( f751_arg0, f751_arg1, f751_arg2 )
	local f751_local0 = f751_arg0:getModel()
	if f751_arg2 ~= "" and f751_local0 then
		f751_local0 = Engine.GetModel( f751_local0, f751_arg2 )
	end
	local f751_local1
	if f751_local0 ~= nil and (f751_local0 and Engine.GetModelValue( f751_local0 )) ~= 0 then
		f751_local1 = false
	else
		f751_local1 = true
	end
	return f751_local1
end

function IsSelfModelValueNonEmptyString( f752_arg0, f752_arg1, f752_arg2 )
	local f752_local0 = f752_arg0:getModel()
	if f752_arg2 ~= "" and f752_local0 then
		f752_local0 = Engine.GetModel( f752_local0, f752_arg2 )
	end
	local f752_local1 = f752_local0 and Engine.GetModelValue( f752_local0 )
	local f752_local2
	if f752_local1 == nil or f752_local1 == "" then
		f752_local2 = false
	else
		f752_local2 = true
	end
	return f752_local2
end

function IsSelfModelValueTrue( f753_arg0, f753_arg1, f753_arg2 )
	local f753_local0 = f753_arg0:getModel()
	if f753_arg2 ~= "" and f753_local0 then
		f753_local0 = Engine.GetModel( f753_local0, f753_arg2 )
	end
	local f753_local1 = f753_local0 and Engine.GetModelValue( f753_local0 )
	local f753_local2
	if f753_local1 == nil or f753_local1 ~= true then
		f753_local2 = false
	else
		f753_local2 = true
	end
	return f753_local2
end

function IsSelfEnumModelValueTrue( f754_arg0, f754_arg1, f754_arg2 )
	local f754_local0 = f754_arg0:getModel()
	if f754_arg2 ~= "" and f754_local0 then
		f754_local0 = Engine.GetModel( f754_local0, f754_arg2 )
	end
	local f754_local1 = f754_local0 and Engine.GetModelValue( f754_local0 )
	local f754_local2
	if f754_local1 == nil or f754_local1 ~= true then
		f754_local2 = false
	else
		f754_local2 = true
	end
	return f754_local2
end

function IsSelfModelValueGreaterThan( f755_arg0, f755_arg1, f755_arg2, f755_arg3 )
	local f755_local0 = f755_arg0:getModel()
	if f755_arg2 ~= "" and f755_local0 then
		f755_local0 = Engine.GetModel( f755_local0, f755_arg2 )
	end
	local f755_local1 = f755_local0 and Engine.GetModelValue( f755_local0 )
	local f755_local2
	if f755_local1 == nil or f755_arg3 >= f755_local1 then
		f755_local2 = false
	else
		f755_local2 = true
	end
	return f755_local2
end

function IsSelfModelValueLessThan( f756_arg0, f756_arg1, f756_arg2, f756_arg3 )
	local f756_local0 = f756_arg0:getModel()
	if f756_arg2 ~= "" and f756_local0 then
		f756_local0 = Engine.GetModel( f756_local0, f756_arg2 )
	end
	local f756_local1 = f756_local0 and Engine.GetModelValue( f756_local0 )
	local f756_local2
	if f756_local1 == nil or f756_local1 >= f756_arg3 then
		f756_local2 = false
	else
		f756_local2 = true
	end
	return f756_local2
end

function IsSelfModelValueGreaterThanOrEqualTo( f757_arg0, f757_arg1, f757_arg2, f757_arg3 )
	local f757_local0 = f757_arg0:getModel()
	if f757_arg2 ~= "" and f757_local0 then
		f757_local0 = Engine.GetModel( f757_local0, f757_arg2 )
	end
	local f757_local1 = f757_local0 and Engine.GetModelValue( f757_local0 )
	local f757_local2
	if f757_local1 == nil or f757_arg3 > f757_local1 then
		f757_local2 = false
	else
		f757_local2 = true
	end
	return f757_local2
end

function IsSelfModelValueLessThanOrEqualTo( f758_arg0, f758_arg1, f758_arg2, f758_arg3 )
	local f758_local0 = f758_arg0:getModel()
	if f758_arg2 ~= "" and f758_local0 then
		f758_local0 = Engine.GetModel( f758_local0, f758_arg2 )
	end
	local f758_local1 = f758_local0 and Engine.GetModelValue( f758_local0 )
	local f758_local2
	if f758_local1 == nil or f758_local1 > f758_arg3 then
		f758_local2 = false
	else
		f758_local2 = true
	end
	return f758_local2
end

function IsSelfModelValueEqualTo( f759_arg0, f759_arg1, f759_arg2, f759_arg3 )
	local f759_local0 = f759_arg0:getModel()
	if f759_arg2 ~= "" and f759_local0 then
		f759_local0 = Engine.GetModel( f759_local0, f759_arg2 )
	end
	local f759_local1 = f759_local0 and Engine.GetModelValue( f759_local0 )
	local f759_local2
	if f759_local1 == nil or f759_local1 ~= f759_arg3 then
		f759_local2 = false
	else
		f759_local2 = true
	end
	return f759_local2
end

function IsSelfModelValueEqualToEitherValue( f760_arg0, f760_arg1, f760_arg2, f760_arg3, f760_arg4 )
	local f760_local0 = f760_arg0:getModel()
	if f760_arg2 ~= "" and f760_local0 then
		f760_local0 = Engine.GetModel( f760_local0, f760_arg2 )
	end
	local f760_local1 = f760_local0 and Engine.GetModelValue( f760_local0 )
	local f760_local2
	if f760_local1 == nil or f760_local1 ~= f760_arg3 and f760_local1 ~= f760_arg4 then
		f760_local2 = false
	else
		f760_local2 = true
	end
	return f760_local2
end

function IsSelfModelValueEqualToAnyValue( f761_arg0, f761_arg1, f761_arg2, f761_arg3, f761_arg4, f761_arg5 )
	local f761_local0 = f761_arg0:getModel()
	if f761_arg2 ~= "" and f761_local0 then
		f761_local0 = Engine.GetModel( f761_local0, f761_arg2 )
	end
	local f761_local1 = f761_local0 and Engine.GetModelValue( f761_local0 )
	local f761_local2
	if f761_local1 == nil or f761_local1 ~= f761_arg3 and f761_local1 ~= f761_arg4 and f761_local1 ~= f761_arg5 then
		f761_local2 = false
	else
		f761_local2 = true
	end
	return f761_local2
end

function IsSelfModelValueEqualToAnyValue5( f762_arg0, f762_arg1, f762_arg2, f762_arg3, f762_arg4, f762_arg5, f762_arg6, f762_arg7 )
	local f762_local0 = f762_arg0:getModel()
	if f762_arg2 ~= "" and f762_local0 then
		f762_local0 = Engine.GetModel( f762_local0, f762_arg2 )
	end
	local f762_local1 = f762_local0 and Engine.GetModelValue( f762_local0 )
	local f762_local2
	if f762_local1 == nil or f762_local1 ~= f762_arg3 and f762_local1 ~= f762_arg4 and f762_local1 ~= f762_arg5 and f762_local1 ~= f762_arg6 and f762_local1 ~= f762_arg7 then
		f762_local2 = false
	else
		f762_local2 = true
	end
	return f762_local2
end

function IsSelfModelValueEqualToEnum( f763_arg0, f763_arg1, f763_arg2, f763_arg3 )
	local f763_local0 = f763_arg0:getModel()
	if f763_arg2 ~= "" and f763_local0 then
		f763_local0 = Engine.GetModel( f763_local0, f763_arg2 )
	end
	local f763_local1 = f763_local0 and Engine.GetModelValue( f763_local0 )
	local f763_local2
	if f763_local1 == nil or f763_local1 ~= f763_arg3 then
		f763_local2 = false
	else
		f763_local2 = true
	end
	return f763_local2
end

function IsSelfModelValueEqualToEnumOrSelfModelNil( f764_arg0, f764_arg1, f764_arg2, f764_arg3 )
	if f764_arg0:getModel() == nil then
		return true
	else
		return IsSelfModelValueEqualToEnum( f764_arg0, f764_arg1, f764_arg2, f764_arg3 )
	end
end

function IsSelfModelValueEqualToSelfTeam( f765_arg0, f765_arg1, f765_arg2 )
	local f765_local0 = CoD.GetTeamID( f765_arg1 )
	if f765_local0 == Enum.team_t.TEAM_SPECTATOR then
		if CoD.ShoutcasterProfileVarBool( f765_arg1, "shoutcaster_flip_scorepanel" ) then
			f765_local0 = Enum.team_t.TEAM_AXIS
		else
			f765_local0 = Enum.team_t.TEAM_ALLIES
		end
	end
	return IsSelfModelValueEqualTo( f765_arg0, f765_arg1, f765_arg2, f765_local0 )
end

function IsGlobalModelValueNonEmptyString( f766_arg0, f766_arg1, f766_arg2 )
	local f766_local0 = Engine.GetModel( Engine.GetGlobalModel(), f766_arg2 )
	local f766_local1 = f766_local0 and Engine.GetModelValue( f766_local0 )
	local f766_local2
	if f766_local1 == nil or f766_local1 == "" then
		f766_local2 = false
	else
		f766_local2 = true
	end
	return f766_local2
end

function IsGlobalModelValueTrue( f767_arg0, f767_arg1, f767_arg2 )
	local f767_local0 = Engine.GetModel( Engine.GetGlobalModel(), f767_arg2 )
	local f767_local1 = f767_local0 and Engine.GetModelValue( f767_local0 )
	local f767_local2
	if f767_local1 == nil or f767_local1 ~= true then
		f767_local2 = false
	else
		f767_local2 = true
	end
	return f767_local2
end

function IsGlobalModelValueEqualTo( f768_arg0, f768_arg1, f768_arg2, f768_arg3 )
	local f768_local0 = Engine.GetModel( Engine.GetGlobalModel(), f768_arg2 )
	local f768_local1 = f768_local0 and Engine.GetModelValue( f768_local0 )
	local f768_local2
	if f768_local1 == nil or f768_local1 ~= f768_arg3 then
		f768_local2 = false
	else
		f768_local2 = true
	end
	return f768_local2
end

function IsGlobalModelValueEqualToEnum( f769_arg0, f769_arg1, f769_arg2, f769_arg3 )
	local f769_local0 = Engine.GetModel( Engine.GetGlobalModel(), f769_arg2 )
	local f769_local1 = f769_local0 and Engine.GetModelValue( f769_local0 )
	local f769_local2
	if f769_local1 == nil or f769_local1 ~= f769_arg3 then
		f769_local2 = false
	else
		f769_local2 = true
	end
	return f769_local2
end

function IsGlobalModelValueGreaterThan( f770_arg0, f770_arg1, f770_arg2 )
	local f770_local0 = Engine.GetModel( Engine.GetGlobalModel(), f770_arg1 )
	local f770_local1 = f770_local0 and Engine.GetModelValue( f770_local0 )
	local f770_local2
	if f770_local1 == nil or f770_arg2 >= tonumber( f770_local1 ) then
		f770_local2 = false
	else
		f770_local2 = true
	end
	return f770_local2
end

function IsGlobalModelValueLessThan( f771_arg0, f771_arg1, f771_arg2 )
	local f771_local0 = Engine.GetModel( Engine.GetGlobalModel(), f771_arg1 )
	local f771_local1 = f771_local0 and Engine.GetModelValue( f771_local0 )
	local f771_local2
	if f771_local1 == nil or tonumber( f771_local1 ) >= f771_arg2 then
		f771_local2 = false
	else
		f771_local2 = true
	end
	return f771_local2
end

function IsSelfModelValueEnumBitSet( f772_arg0, f772_arg1, f772_arg2, f772_arg3 )
	local f772_local0 = f772_arg0:getModel()
	if f772_arg2 ~= "" and f772_local0 then
		f772_local0 = Engine.GetModel( f772_local0, f772_arg2 )
	end
	local f772_local1 = f772_local0 and Engine.GetModelValue( f772_local0 )
	local f772_local2
	if f772_local1 ~= nil then
		f772_local2 = CoD.BitUtility.IsBitSet( f772_local1, f772_arg3 )
	else
		f772_local2 = false
	end
	return f772_local2
end

function IsSelfModelValueMyXuid( f773_arg0, f773_arg1, f773_arg2 )
	local f773_local0 = f773_arg0:getModel()
	if f773_local0 then
		f773_local0 = Engine.GetModel( f773_local0, f773_arg2 )
	end
	local f773_local1 = f773_local0 and Engine.GetModelValue( f773_local0 )
	local f773_local2
	if f773_local1 == nil or f773_local1 ~= Engine.GetXUID64( f773_arg1 ) then
		f773_local2 = false
	else
		f773_local2 = true
	end
	return f773_local2
end

function IsSelfModelValueMyXuidOrAnyLocalPlayerOnGameOver( f774_arg0, f774_arg1, f774_arg2 )
	local f774_local0 = CoD.SafeGetModelValue( f774_arg0:getModel(), f774_arg2 )
	local f774_local1 = f774_arg1
	local f774_local2 = f774_arg1
	if IsInGame() and Engine.IsVisibilityBitSet( f774_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		f774_local1 = 0
		f774_local2 = Engine.GetMaxControllerCount() - 1
	end
	for f774_local3 = f774_local1, f774_local2, 1 do
		if Engine.IsControllerBeingUsed( f774_local3 ) and f774_local0 == Engine.GetXUID64( f774_local3 ) then
			return true
		end
	end
	return false
end

function IsDpadButton( f775_arg0 )
	local f775_local0 = f775_arg0 and Engine.GetModelValue( f775_arg0 )
	local f775_local1
	if f775_local0 ~= nil then
		f775_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f775_local0, Enum.LUIButtonFlags.FLAG_DPAD )
	else
		f775_local1 = true
	end
	return f775_local1
end

function IsRepeatButtonPress( f776_arg0 )
	local f776_local0 = f776_arg0 and Engine.GetModelValue( f776_arg0 )
	local f776_local1
	if f776_local0 ~= nil then
		f776_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f776_local0, Enum.LUIButtonFlags.FLAG_ISREPEAT )
	else
		f776_local1 = false
	end
	return f776_local1
end

function IsPartyLeaderStatusVisible()
	local f777_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f777_local0 then
		local f777_local1 = LobbyData:UITargetFromId( f777_local0 )
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and f777_local1.id == LobbyData.UITargets.UI_MODESELECT.id then
			return false
		elseif f777_local1.isAdvertised then
			return false
		else
			return true
		end
	else
		return false
	end
end

function ShowClientInRedForMissingDLC( f778_arg0, f778_arg1 )
	if not IsLobbyHost() then
		return false
	end
	local f778_local0 = CoD.SafeGetModelValue( f778_arg0:getModel(), "dlcBits" )
	if f778_local0 then
		if IsCustomLobby() then
			local f778_local1 = Engine.GetDLCBitForMapName( CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
			local f778_local2
			if f778_local1 then
				f778_local2 = not CoD.BitUtility.IsBitwiseAndNonZero( f778_local0, f778_local1 )
			else
				f778_local2 = true
			end
			return f778_local2
		elseif CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() and IsLobbyHost() then
			local f778_local3 = CoD.GetKnownDLCBits() & Engine.GetDLCBits()
			return f778_local3 ~= f778_local3 & f778_local0
		end
	end
	return false
end

function ShowMissingMapsListInLobbySlide( f779_arg0, f779_arg1 )
	local f779_local0 = CoD.SafeGetModelValue( f779_arg0:getModel(), "dlcBits" )
	if f779_local0 then
		if IsCustomLobby() then
			local f779_local1 = Engine.GetDLCBitForMapName( CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
			local f779_local2
			if f779_local1 then
				f779_local2 = not CoD.BitUtility.IsBitwiseAndNonZero( f779_local0, f779_local1 )
			else
				f779_local2 = true
			end
			return f779_local2
		elseif CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() then
			local f779_local3 = CoD.GetKnownDLCBits() & Engine.GetDLCBits()
			return f779_local3 ~= f779_local3 & f779_local0
		end
	end
	return false
end

function IsLobbyStatusVisible()
	local f780_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f780_local0 then
		local f780_local1 = LobbyData:UITargetFromId( f780_local0 )
		if f780_local1.isAdvertised then
			return true
		end
	end
	return false
end

function IsPartyPrivacyVisible()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		local f781_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
		if f781_local0 then
			local f781_local1 = LobbyData:UITargetFromId( f781_local0 )
			if f781_local1.isAdvertised == true then
				return false
			else
				return true
			end
		else
			return false
		end
	end
end

function IsSelfModelRankValueGreaterThan( f782_arg0, f782_arg1, f782_arg2 )
	local f782_local0 = f782_arg0:getModel()
	if f782_local0 then
		f782_local0 = Engine.GetModel( f782_local0, "rank" )
	end
	local f782_local1 = f782_local0 and Engine.GetModelValue( f782_local0 )
	local f782_local2
	if tonumber( f782_local1 ) == nil or f782_arg2 >= tonumber( f782_local1 ) then
		f782_local2 = false
	else
		f782_local2 = true
	end
	return f782_local2
end

function HasNumHessActive( f783_arg0, f783_arg1 )
	local f783_local0 = 0
	local f783_local1 = Engine.GetModel( Engine.GetModelForController( f783_arg0 ), "hudItems.hess1.type" )
	if f783_local1 ~= nil and Engine.GetModelValue( f783_local1 ) ~= 0 then
		f783_local0 = 1
	end
	local f783_local2 = Engine.GetModel( Engine.GetModelForController( f783_arg0 ), "hudItems.hess2.type" )
	if f783_local2 ~= nil and Engine.GetModelValue( f783_local2 ) ~= 0 then
		f783_local0 = f783_local0 + 1
	end
	return f783_local0 == f783_arg1
end

function CanUseSharedLoadouts( f784_arg0 )
	if not CoD.isCampaign then
		return false
	end
	local f784_local0 = Dvar.lobby_enableLoadoutDataStreamingInGame:get()
	local f784_local1 = 1
	local f784_local2 = Engine.GetModel( Engine.GetModelForController( f784_arg0 ), "ChooseClassCPClientMenu" )
	if f784_local2 then
		f784_local1 = Engine.GetModelValue( Engine.GetModel( f784_local2, "numActiveClients" ) )
	end
	local f784_local3
	if f784_local0 ~= true or f784_local1 <= 1 then
		f784_local3 = false
	else
		f784_local3 = true
	end
	return f784_local3
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
	local f788_local0 = Engine.LobbyGetDemoInformation()
	if f788_local0 and f788_local0.fileID ~= Engine.DefaultID64Value() then
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
		local f790_local0 = Engine.LobbyGetDemoInformation()
		if not f790_local0.fileCategory or f790_local0.fileCategory ~= "film" and f790_local0.fileCategory ~= "recentgames" then
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
		local f791_local0 = Engine.LobbyGetDemoInformation()
		if not f791_local0.fileCategory or f791_local0.fileCategory ~= "film" and f791_local0.fileCategory ~= "recentgames" then
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
	local f798_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCreatingHighlightReel" )
	if f798_local0 then
		return Engine.GetModelValue( f798_local0 ) == true
	else
		return false
	end
end

function IsDemoCapturingScreenshot()
	local f799_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCapturingScreenshot" )
	if f799_local0 then
		return Engine.GetModelValue( f799_local0 ) == true
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
	local f807_local0 = IsDemoContextBasicMode()
	if not f807_local0 then
		f807_local0 = IsDemoContextHighlightReelMode()
	end
	return f807_local0
end

function ClipsAvailable( f808_arg0 )
	local f808_local0 = Engine.FileshareGetQuota( f808_arg0, "clip_private" )
	return f808_local0.categorySlotsAvailable > 0
end

function ShowOutOfClipsWarning( f809_arg0 )
	local f809_local0 = Dvar.tu9_noClipsWarning:exists()
	if f809_local0 then
		f809_local0 = Engine.DvarBool( nil, "tu9_noClipsWarning" )
		if f809_local0 then
			f809_local0 = not ClipsAvailable( f809_arg0 )
		end
	end
	return f809_local0
end

function ShouldAddDollyCameraMarker( f810_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif Engine.ProfileBool( f810_arg0, "demo_autoDollyRecord" ) then
		return false
	elseif IsGlobalModelValueGreaterThan( f810_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldStartAutoDollyCamera( f811_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not Engine.ProfileBool( f811_arg0, "demo_autoDollyRecord" ) then
		return false
	elseif IsGlobalModelValueGreaterThan( f811_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f811_arg0, "demo.isRecordingDollyCameraPath" ) then
		return false
	else
		return true
	end
end

function ShouldStopAutoDollyCamera( f812_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not Engine.ProfileBool( f812_arg0, "demo_autoDollyRecord" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f812_arg0, "demo.isRecordingDollyCameraPath" ) then
		return false
	else
		return true
	end
end

function ShouldEditDollyCameraMarker( f813_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif IsGlobalModelValueTrue( nil, f813_arg0, "demo.isRecordingDollyCameraPath" ) then
		return false
	elseif not IsGlobalModelValueGreaterThan( f813_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f813_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingDollyCameraMarker( f814_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f814_arg0, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f814_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningDollyCameraMarker( f815_arg0 )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f815_arg0, "demo.editingDollyCameraMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f815_arg0, "demo.isRepositioningDollyCamMarker" ) then
		return false
	else
		return true
	end
end

function IsFreeCameraLockedOnEntity( f816_arg0 )
	if not IsGlobalModelValueTrue( nil, f816_arg0, "demo.isFreeCameraLockedOnEntity" ) then
		return false
	else
		return true
	end
end

function CanFreeCameraLockOnEntity( f817_arg0 )
	if not IsGlobalModelValueTrue( nil, f817_arg0, "demo.isFreeCameraEntityLockOnAllowed" ) then
		return false
	elseif not IsGlobalModelValueGreaterThan( f817_arg0, "demo.highlightedFreeCameraLockOnEntity", 0 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f817_arg0, "demo.isFreeCameraLockedOnEntityActive" ) then
		return false
	else
		return true
	end
end

function ShouldAddLightmanMarker( f818_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif IsGlobalModelValueGreaterThan( f818_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldEditLightmanMarker( f819_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f819_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, f819_arg0, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingLightmanMarker( f820_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( f820_arg0, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f820_arg0, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningLightmanMarker( f821_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f821_arg0, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f821_arg0, "demo.isRepositioningLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsInLightmanColorPicker( f822_arg0 )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, f822_arg0, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, f822_arg0, "demo.showLightmanColorPicker" ) then
		return false
	else
		return true
	end
end

function ReachedLowestLightmanFloatParamValue( f823_arg0, f823_arg1 )
	if not f823_arg0.btnId then
		return true
	end
	local f823_local0 = nil
	if f823_arg0.btnId == "lightmanlightintensity" then
		f823_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f823_arg0.btnId == "lightmanlightrange" then
		f823_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f823_local0 then
		return true
	elseif Engine.GetModelValue( f823_local0 ) < 0.19 then
		return true
	end
	return false
end

function ReachedHighestLightmanFloatParamValue( f824_arg0, f824_arg1 )
	if not f824_arg0.btnId then
		return true
	end
	local f824_local0 = nil
	if f824_arg0.btnId == "lightmanlightintensity" then
		f824_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f824_arg0.btnId == "lightmanlightrange" then
		f824_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f824_local0 then
		return true
	elseif Engine.GetModelValue( f824_local0 ) > 9.91 then
		return true
	end
	return false
end

function IsSegmentInSelectedState( f825_arg0, f825_arg1 )
	local f825_local0 = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
	if f825_local0 and f825_local0 == f825_arg0:getModel() then
		local f825_local1 = Engine.GetModel( f825_local0, "selected" )
		if f825_local1 then
			return Engine.GetModelValue( f825_local1 )
		end
	end
	return false
end

function IsTimelineEditorInMoveState( f826_arg0 )
	return CoD.DemoUtility.Timeline_GetSelectedSegmentModel() ~= nil
end

function SegmentCountGreaterThan( f827_arg0, f827_arg1 )
	return f827_arg1 < Engine.GetDemoSegmentCount()
end

function CanChangeSegmentTransition( f828_arg0, f828_arg1 )
	local f828_local0 = Engine.GetDemoSegmentCount()
	local f828_local1 = Engine.GetModel( f828_arg0:getModel(), "segmentNumber" )
	if f828_local1 then
		return Engine.GetModelValue( f828_local1 ) < f828_local0
	else
		return false
	end
end

function IsSegmentTransition( f829_arg0, f829_arg1, f829_arg2 )
	local f829_local0 = Engine.GetModel( f829_arg0:getModel(), "segmentNumber" )
	if f829_local0 then
		return tonumber( Engine.GetDemoSegmentInformation( Engine.GetModelValue( f829_local0 ) - 1, "transitionValue" ) ) == f829_arg2
	else
		return false
	end
end

function HideVehicleReticle( f830_arg0, f830_arg1, f830_arg2 )
	local f830_local0 = nil
	if f830_arg2.modelName == "vehicleType" then
		f830_local0 = f830_arg2.modelValue
	end
	if not f830_local0 then
		local f830_local1 = f830_arg0:getModel( f830_arg1, "vehicleType" )
		if f830_local1 then
			f830_local0 = Engine.GetModelValue( f830_local1 )
		end
	end
	return f830_local0 == "spawner_enemy_54i_vehicle_raps_suicide_player"
end

function VehicleHasEnemyLock( f831_arg0, f831_arg1 )
	local f831_local0 = IsSelfEnumModelValueTrue( f831_arg0, f831_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP )
	if not f831_local0 then
		f831_local0 = IsSelfEnumModelValueTrue( f831_arg0, f831_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN )
		if not f831_local0 then
			f831_local0 = IsSelfEnumModelValueTrue( f831_arg0, f831_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT )
			if not f831_local0 then
				f831_local0 = IsSelfEnumModelValueTrue( f831_arg0, f831_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT )
			end
		end
	end
	return f831_local0
end

function IsVehicleOfType( f832_arg0, ... )
	local f832_local0 = {
		n = select( "#", ... ),
		...
	}
	local f832_local1 = Engine.GetModel( Engine.GetModelForController( f832_arg0 ), "vehicle.vehicleType" )
	if f832_local1 then
		local f832_local2 = Engine.GetModelValue( f832_local1 )
		if f832_local2 then
			for f832_local6, f832_local7 in ipairs( f832_local0 ) do
				if string.find( f832_local2, "_" .. f832_local7 ) then
					return true
				end
			end
		end
	end
	return false
end

function IsSelfPlayerName( f833_arg0, f833_arg1 )
	local f833_local0 = f833_arg0:getModel( f833_arg1, "isSelfPlayerName" )
	local f833_local1 = false
	if f833_local0 then
		f833_local1 = Engine.GetModelValue( f833_local0 )
	end
	return f833_local1
end

function ShouldDisplayFactionIconAtPrematchCountdown( f834_arg0 )
	if not CoDShared.IsGametypeTeamBased() then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModel( Engine.GetModelForController( f834_arg0 ), "factions" ), "playerFactionDisplayName" ) ~= nil
	end
end

function MapVoteInState( f835_arg0 )
	local f835_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if f835_local0 == nil then
		return false
	end
	local f835_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f835_local1 then
		local f835_local2 = LobbyData:UITargetFromId( f835_local1 )
		if f835_local2.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
			return false
		end
	end
	return tonumber( f835_arg0 ) == Engine.GetModelValue( f835_local0 )
end

function MapVotePreviousSelectable()
	if not MapVoteInState( "1" ) then
		return false
	end
	local f836_local0 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f836_local0 = Enum.LobbyModule.LOBBY_MODULE_HOST
	end
	if Engine.GetPlaylistPrevCount( f836_local0 ) >= Dvar.lobbyMapVotePrevMapPlayCount:get() then
		return false
	end
	return true
end

function MapVoteTimerActive()
	local f837_local0 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f837_local0 == nil then
		return false
	end
	local f837_local1 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f837_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.TESTING then
		return false
	end
	local f837_local2 = Engine.GetModelValue( f837_local0 )
	local f837_local3
	if f837_local2 == nil or f837_local2 == 0 then
		f837_local3 = false
	else
		f837_local3 = true
	end
	return f837_local3
end

function IsScorestreakEquipped( f838_arg0, f838_arg1, f838_arg2 )
	local f838_local0 = f838_arg1:getModel( f838_arg2, "itemIndex" )
	if f838_local0 then
		local f838_local1 = Engine.GetModelValue( f838_local0 )
		if f838_local1 ~= CoD.CACUtility.EmptyItemIndex then
			return CoD.CACUtility.GetAttachedItemSlot( f838_arg0:getModel(), f838_local1, CoD.CACUtility.KillstreakNameList ) ~= nil
		end
	end
	return false
end

function IsValidScorestreakIndex( f839_arg0, f839_arg1 )
	local f839_local0 = f839_arg0:getModel( f839_arg1, "itemIndex" )
	if f839_local0 then
		return Engine.GetModelValue( f839_local0 ) ~= CoD.CACUtility.EmptyItemIndex
	else
		return false
	end
end

function IsGamepad( f840_arg0 )
	return CoD.useController and Engine.LastInput_Gamepad()
end

function IsMouse( f841_arg0 )
	return CoD.useMouse and Engine.LastInput_Mouse()
end

function IsDurangoGamepad( f842_arg0 )
	local f842_local0 = IsDurango()
	if not f842_local0 then
		f842_local0 = IsPC()
		if f842_local0 then
			f842_local0 = IsGamepad( f842_arg0 )
			if f842_local0 then
				f842_local0 = Engine.GamepadType( f842_arg0 ) == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO
			end
		end
	end
	return f842_local0
end

function IsOrbisGamepad( f843_arg0 )
	local f843_local0
	if not IsOrbis() or Engine.LastInput_Vita( f843_arg0 ) then
		f843_local0 = IsPC()
		if f843_local0 then
			f843_local0 = IsGamepad( f843_arg0 )
			if f843_local0 then
				if Engine.GamepadType( f843_arg0 ) ~= Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
					f843_local0 = false
				else
					f843_local0 = true
				end
			end
		end
	else
		f843_local0 = true
	end
	return f843_local0
end

function IsVitaGamepad( f844_arg0 )
	return IsOrbis() and Engine.LastInput_Vita( f844_arg0 )
end

function AutomaticallyOpenAAR( f845_arg0 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) > 1 or Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
		return false
	else
		local f845_local0 = CoD.GetPlayerStats( f845_arg0 )
		local f845_local1 = f845_local0.AfterActionReportStats.lobbyPopup:get()
		if f845_local1 == "summary" or f845_local1 == "promotion" then
			return true
		else
			
		end
	end
end

function WasCampaignSoloGame( f846_arg0 )
	return Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES ) == 1
end

function IsAARValid( f847_arg0 )
	if CoD.AARUtility.UseTestData() then
		return true
	end
	local f847_local0 = CoD.GetPlayerStats( f847_arg0, CoD.STATS_LOCATION_STABLE )
	if not f847_local0 or not f847_local0.PlayerStatsList or not f847_local0.PlayerStatsList.RANK or not f847_local0.PlayerStatsList.RANK.StatValue or not f847_local0.PlayerStatsList.RANK.StatValue:get() then
		return false
	end
	local f847_local1 = CoD.GetPlayerStats( f847_arg0 )
	if Engine.IsMultiplayerGame() and not IsArenaMode() then
		local f847_local2 = Engine.GetCurrentGameType()
		if f847_local2 == "" or not f847_local1.PlayerStatsByGameType or not f847_local1.PlayerStatsByGameType[f847_local2] then
			return false
		end
	end
	if f847_local1.AfterActionReportStats.lobbyPopup:get() == "summary" then
		return true
	end
	local f847_local2 = Engine.GetModel( Engine.GetModelForController( f847_arg0 ), "aarType" )
	if f847_local2 then
		local f847_local3 = Engine.GetModelValue( f847_local2 )
		local f847_local4
		if (not IsLAN() or f847_local3 ~= "lan") and (IsLAN() or f847_local3 ~= "custom" and f847_local3 ~= "public") then
			f847_local4 = false
		else
			f847_local4 = true
		end
		return f847_local4
	end
end

function CanShowAAR( f848_arg0 )
	local f848_local0 = Engine.IsMultiplayerGame()
	local f848_local1 = Engine.IsZombiesGame()
	if f848_local0 and CoD.mpFreshStartPerformed then
		return false
	elseif f848_local1 and CoD.zmFreshStartPerformed then
		return false
	elseif IsFreeRunLobby() then
		return false
	elseif IsInTheaterMode() then
		return false
	elseif not f848_local0 then
		local f848_local2 = f848_local1
	end
	local f848_local3 = CoD.AARUtility.UseTestData()
	if not f848_local3 then
		f848_local3 = f848_local2 and Engine.IsStableStatsBufferInitialized( f848_arg0 )
	end
	return f848_local3
end

function AnyRewardsEarnedDuringMatch( f849_arg0 )
	return CoD.AARUtility.AnyRewardsEarnedDuringMatch( f849_arg0 )
end

function HasFriends( f850_arg0 )
	return Engine.GetFriendsCount( f850_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function HasRecentPlayers( f851_arg0 )
	return Engine.GetRecentPlayersCount( f851_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function IsSocialPlayersListEmpty( f852_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
	if modelValue ~= nil then
		if modelValue == "friends" then
			return HasFriends( f852_arg0 )
		elseif modelValue == "recent" then
			return HasRecentPlayers( f852_arg0 )
		end
	end
	return false
end

function IsSocialGroupsTabOpen( f853_arg0 )
	return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "socialRoot.tab" ) == "groups"
end

function IsInTitle( f854_arg0, f854_arg1 )
	local f854_local0 = f854_arg0:getModel( f854_arg1, "activity" )
	if f854_local0 then
		local f854_local1 = Engine.GetModelValue( f854_local0 )
		if f854_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
			return false
		elseif f854_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
			return false
		end
	end
	return true
end

function IsJoinable( f855_arg0, f855_arg1 )
	if LuaUtils.LobbyIsLocked() then
		return false
	end
	local f855_local0 = CoD.SafeGetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" )
	local f855_local1 = f855_arg0:getModel( f855_arg1, "joinable" )
	if f855_local1 then
		local f855_local2 = Engine.GetModelValue( f855_local1 )
		if f855_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES then
			return true
		elseif f855_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY and f855_local0 ~= "recent" and f855_local0 ~= "groupMembers" then
			local f855_local3 = f855_arg0:getModel( f855_arg1, "friend" )
			if f855_local3 and Engine.GetModelValue( f855_local3 ) then
				return true
			end
		end
	end
	return false
end

function IsSocialPartyLeader( f856_arg0, f856_arg1 )
	local f856_local0 = f856_arg0:getModel( f856_arg1, "leader" )
	if (f856_local0 and Engine.GetModelValue( f856_local0 )) == 1 then
		return true
	else
		return false
	end
end

function IsSelectedFriendXuidEqualToControllerXuid( f857_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f857_arg0 ), "Social.selectedFriendXUID" ) ) == Engine.GetXUID64( f857_arg0 )
end

function ShouldHideJoinButton( f858_arg0, f858_arg1, f858_arg2 )
	local f858_local0 = PropertyIsTrue( f858_arg0, f858_arg2 )
	if not f858_local0 then
		f858_local0 = IsSelectedFriendXuidEqualToControllerXuid( f858_arg1 )
	end
	return f858_local0
end

function HideWinnersLabelsAndInfo( f859_arg0 )
	local f859_local0 = Engine.GetModel( Engine.GetModelForController( f859_arg0 ), "gameScore.draw" )
	local f859_local1 = Engine.GetGametypeSetting( "teamCount" ) < 2
	if f859_local0 then
		f859_local0 = Engine.GetModelValue( f859_local0 )
	end
	if f859_local0 or f859_local1 then
		return true
	else
		
	end
end

function IsScoreboardPingAsBars( f860_arg0, f860_arg1 )
	return Dvar.cg_ScoresPing_Interval:get() > 1
end

function ScoreboardVisible( f861_arg0 )
	local f861_local0 = Engine.IsVisibilityBitSet( f861_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f861_local0 then
		f861_local0 = IsModelValueEqualTo( f861_arg0, "forceScoreboard", 1 )
	end
	return f861_local0
end

function IsScoreboardPlayerMuted( f862_arg0, f862_arg1 )
	return Engine.IsPlayerMutedByClientNum( f862_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, CoD.SafeGetModelValue( f862_arg1:getModel(), "clientNum" ) )
end

function IsScoreboardPlayerCodCaster( f863_arg0, f863_arg1 )
	local f863_local0 = CoD.SafeGetModelValue( f863_arg1:getModel(), "clientNum" )
	if f863_local0 ~= nil and f863_local0 >= 0 then
		return Engine.GetTeamID( f863_arg0, f863_local0 ) == Enum.team_t.TEAM_SPECTATOR
	else
		return false
	end
end

function ScoreboardMuteButtonPromptHidden( f864_arg0, f864_arg1 )
	if not ScoreboardVisible( f864_arg1 ) then
		return true
	elseif CoD.IsShoutcaster( f864_arg1 ) then
		return true
	end
	local f864_local0 = Engine.GetModel( Engine.GetModelForController( f864_arg1 ), "scoreboardInfo.muteButtonPromptVisible" )
	if f864_local0 and not Engine.GetModelValue( f864_local0 ) then
		return true
	end
	local f864_local1 = CoD.SafeGetModelValue( f864_arg0:getModel(), "clientNum" )
	local f864_local2
	if f864_local1 ~= nil and Engine.GetMatchScoreboardClientXuid( f864_local1 ) ~= nil then
		f864_local2 = false
	else
		f864_local2 = true
	end
	return f864_local2
end

function ScoreboardCanShowGamerCard( f865_arg0, f865_arg1 )
	if not CoD.isDurango then
		return false
	else
		local f865_local0 = CoD.SafeGetModelValue( f865_arg0:getModel(), "clientNum" )
		if f865_local0 == nil or f865_local0 < 0 then
			return false
		else
			return Engine.GetMatchScoreboardClientXuid( f865_local0 ) ~= nil
		end
	end
end

function IsScoreboardPlayerSelf( f866_arg0, f866_arg1 )
	local f866_local0 = f866_arg0:getModel( f866_arg1, "clientNum" )
	if f866_local0 then
		if CoD.IsShoutcaster( f866_arg1 ) then
			return Engine.GetPredictedClientNum( f866_arg1 ) == Engine.GetModelValue( f866_local0 )
		end
		local f866_local1 = f866_arg1
		local f866_local2 = f866_arg1
		if IsInGame() and Engine.IsVisibilityBitSet( f866_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
			f866_local1 = 0
			f866_local2 = Engine.GetMaxControllerCount() - 1
		end
		for f866_local3 = f866_local1, f866_local2, 1 do
			if Engine.IsControllerBeingUsed( f866_local3 ) then
				if CoD.isPC then
					local f866_local6 = Engine.GetClientNum( f866_local3 )
					if f866_local6 and f866_local6 >= 0 and f866_local6 == Engine.GetModelValue( f866_local0 ) then
						return true
					end
				end
				if string.gsub( GetScoreboardPlayerName( f866_local3, Engine.GetModelValue( f866_local0 ) ), "%[.+%]", "" ) == Engine.GetSelfGamertag( f866_local3 ) then
					return true
				end
			end
		end
	end
	return false
end

function ShowMatchBonus( f867_arg0, f867_arg1 )
	local f867_local0 = Engine.GetModelForController( f867_arg1 )
	local f867_local1 = Engine.GetModel( f867_local0, "gameScore.isRoundEnd" )
	local f867_local2 = Engine.GetModel( f867_local0, "gameScore.matchBonus" )
	local f867_local3 = 0
	if f867_local2 then
		f867_local3 = Engine.GetModelValue( f867_local2 )
	end
	local f867_local4
	if (f867_local1 and Engine.GetModelValue( f867_local1 )) or f867_local3 == 0 then
		f867_local4 = false
	else
		f867_local4 = true
	end
	return f867_local4
end

function IsVictory( f868_arg0 )
	local f868_local0 = Engine.GetModelForController( f868_arg0 )
	local f868_local1 = Engine.GetModel( f868_local0, "gameScore.isRoundEnd" )
	local f868_local2 = f868_local1 and Engine.GetModelValue( f868_local1 )
	local f868_local3 = Engine.GetModel( f868_local0, "gameScore.victory" )
	local f868_local4 = f868_local3 and Engine.GetModelValue( f868_local3 )
	local f868_local5
	if not f868_local2 then
		f868_local5 = f868_local4
	else
		f868_local5 = false
	end
	return f868_local5
end

function IsDefeat( f869_arg0 )
	local f869_local0 = Engine.GetModelForController( f869_arg0 )
	local f869_local1 = Engine.GetModel( f869_local0, "gameScore.isRoundEnd" )
	local f869_local2 = f869_local1 and Engine.GetModelValue( f869_local1 )
	local f869_local3 = Engine.GetModel( f869_local0, "gameScore.defeat" )
	local f869_local4 = f869_local3 and Engine.GetModelValue( f869_local3 )
	local f869_local5
	if not f869_local2 then
		f869_local5 = f869_local4
	else
		f869_local5 = false
	end
	return f869_local5
end

function IsStarterPack( f870_arg0 )
	return CoD.isPC and Engine.IsStarterPack()
end

function IsFreeRunFinished( f871_arg0 )
	local f871_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f871_arg0 ), "FreeRun" ), "runState" )
	local f871_local1 = false
	if Engine.GetModelValue( f871_local0 ) == 2 then
		f871_local1 = true
	end
	return f871_local1
end

function ShouldShowFreerunTimeClips( f872_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f872_arg0 ), "FreeRun.freeRunInfo.bestTime" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	else
		return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f872_arg0 ), "FreeRun.runState" ) ) == CoD.FreerunUtility.FR_STATE_RUNNING
	end
end

function IsFreeRunMap( f873_arg0 )
	if CoD.mapsTable[f873_arg0] then
		local f873_local0
		if CoD.mapsTable[f873_arg0].isFreeRunMap == nil or CoD.mapsTable[f873_arg0].isFreeRunMap ~= true then
			f873_local0 = false
		else
			f873_local0 = true
		end
		return f873_local0
	else
		return false
	end
end

function IsFreeRunLobby()
	local f874_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f874_local0 == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f874_local0 == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		return true
	else
		return false
	end
end

function ShouldShowPartyPrivacy( f875_arg0 )
	local f875_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f875_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f875_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f875_local1 and f875_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f875_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f875_local2 ) then
		return false
	else
		local f875_local3 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
		if f875_local3.maxClients <= 1 then
			return false
		else
			return true
		end
	end
end

function ShouldShowLeaveParty( f876_arg0 )
	local f876_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f876_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f876_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f876_local1 and f876_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f876_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f876_local3 = Enum.LobbyModule.LOBBY_MODULE_HOST
	if Engine.IsLobbyHost( f876_local2 ) == false then
		f876_local3 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	end
	local f876_local4 = Engine.LobbyGetSessionClients( f876_local3, f876_local2 )
	if #f876_local4.sessionClients == 1 then
		return false
	end
	local f876_local5 = 0
	for f876_local9, f876_local10 in ipairs( f876_local4.sessionClients ) do
		if f876_local10.isLocal == 1 then
			f876_local5 = f876_local5 + 1
		end
	end
	if f876_local5 == #f876_local4.sessionClients then
		return false
	elseif LuaUtils.LobbyIsLocked() then
		return false
	end
	return true, f876_local3
end

function ShouldShowPromotePlayer( f877_arg0 )
	return false
end

function ShouldShowBootPlayer( f878_arg0 )
	local f878_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f878_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f878_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f878_local1 and f878_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f878_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f878_local2 ) then
		return false
	end
	local f878_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f878_local2 )
	if #f878_local3.sessionClients == 1 then
		return false
	end
	local f878_local4 = 0
	for f878_local8, f878_local9 in ipairs( f878_local3.sessionClients ) do
		if f878_local9.isLocal == 1 then
			f878_local4 = f878_local4 + 1
		end
	end
	if f878_local4 == #f878_local3.sessionClients then
		return false
	elseif LuaUtils.LobbyIsLocked() then
		return false
	end
	return true
end

function IsBleedOutVisible( f879_arg0, f879_arg1 )
	local f879_local0 = f879_arg0:getModel( f879_arg1, "stateFlags" )
	if f879_local0 then
		local f879_local1 = Engine.GetModelValue( f879_local0 )
		if f879_local1 ~= nil then
			return CoD.BitUtility.IsAnyBitSet( f879_local1, {
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT,
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED
			} )
		end
	end
	return false
end

function DropDownListIsInUse( f880_arg0 )
	return f880_arg0.inUse
end

function CheckBoxOptionChecked( f881_arg0, f881_arg1 )
	local f881_local0 = nil
	if f881_arg1.menu then
		f881_local0 = f881_arg1.menu.m_ownerController
	else
		f881_local0 = f881_arg1.controller
	end
	local f881_local1 = f881_arg0:getModel()
	if f881_local1 then
		local f881_local2 = CoD.PCUtil.GetOptionInfo( f881_local1, f881_local0 )
		if type( f881_local2.currentValue ) == "number" then
			return math.abs( f881_local2.currentValue - f881_local2.highValue ) < 0.01
		elseif type( f881_local2.currentValue ) == "string" then
			return f881_local2.currentValue == f881_local2.highValue
		end
	end
	return false
end

function ShouldOpenGraphicsConfirm( f882_arg0, f882_arg1, f882_arg2 )
	return CoD.PCUtil.IsOptionsDirty( f882_arg2 )
end

function ShouldHideButtonPromptForPC( f883_arg0, f883_arg1 )
	if CoD.isPC then
		local f883_local0 = CoD.PCUtil.GetElementModelValues( f883_arg0, {
			"Button",
			"Label"
		} )
		if f883_local0 and f883_local0.Label == "MENU_SELECT" and f883_local0.Button == Enum.LUIButton.LUI_KEY_XBA_PSCROSS then
			f883_arg0:setState( "dummy" )
			return true
		end
	end
	return false
end

function DropdownListIsInUse_Console( f884_arg0 )
	return f884_arg0.inUse
end

function ShouldShowMOTD( f885_arg0 )
	return Engine.ShouldShowMOTD( f885_arg0 )
end

function ShouldShowMtxCommsMOTD( f886_arg0 )
	if Dvar.ui_execdemo_beta:get() then
		return false
	elseif ShouldSkipMtxCommsMOTD( f886_arg0 ) then
		return false
	elseif Engine.GetMarketingMessage( f886_arg0, "motd" ) ~= nil then
		return true
	else
		return false
	end
end

function ShouldShowMtxCommsMOTDPopup( f887_arg0 )
	local f887_local0 = Engine.GetMarketingMessage( f887_arg0, "motd" )
	if ShouldSkipMtxCommsMOTD( f887_arg0 ) then
		return false
	elseif f887_local0 ~= nil and f887_local0.messageViewReported ~= true then
		return true
	else
		return false
	end
end

function ShouldSkipMtxCommsMOTD( f888_arg0 )
	local f888_local0 = Engine.GetMarketingMessage( f888_arg0, "motd" )
	if f888_local0 ~= nil and (f888_local0.action == "pass" or f888_local0.action == "skip") then
		return true
	else
		return false
	end
end

function FeaturedWidgetControllerVisible( f889_arg0 )
	local f889_local0 = Engine.GetFeaturedCardsData()
	if f889_local0 ~= nil and f889_local0.validCardsCount >= 2 then
		return true
	elseif (HasLiveEvent( f889_arg0 ) or IsExperimentPromotionActive( f889_arg0 )) and f889_local0.validCardsCount >= 1 then
		return true
	elseif HasLiveEvent( f889_arg0 ) and IsExperimentPromotionActive( f889_arg0 ) then
		return true
	elseif 1 == Dvar.ui_enableZMHDFeaturedCard:get() or Dvar.ui_enableZMHDFeaturedCard:get() == "1" then
		return true
	elseif CoD.isZombie then
		return true
	else
		return false
	end
end

function IsBubbleGumBuffEquipped( f890_arg0, f890_arg1, f890_arg2 )
	local f890_local0 = f890_arg1:getModel()
	if not f890_local0 then
		return false
	end
	local f890_local1 = Engine.GetModel( f890_local0, "itemIndex" )
	if not f890_local1 then
		return false
	end
	local f890_local2 = Engine.GetModelValue( f890_local1 )
	local f890_local3 = Engine.GetEquippedBubbleGumPack( f890_arg2 )
	for f890_local4 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f890_arg2, f890_local3, f890_local4 ) == f890_local2 then
			return true
		end
	end
	return false
end

function IsOutOfLobbyBubbleGum( f891_arg0, f891_arg1 )
	local f891_local0 = f891_arg0:getModel( f891_arg1, "itemIndex" )
	if not f891_local0 then
		return false
	elseif not CoD.CACUtility.IsItemConsumable( Engine.GetModelValue( f891_local0 ) ) then
		return false
	else
		local f891_local1 = f891_arg0:getModel( f891_arg1, "remaining" )
		if not f891_local1 then
			return false
		else
			return Engine.GetModelValue( f891_local1 ) == 0
		end
	end
end

function HasBGBTokensRemaining( f892_arg0, f892_arg1 )
	if Engine.GetZMVials( f892_arg1 ) > 0 == false then
		return false
	else
		return Engine.GetModelValue( f892_arg0:getModel( f892_arg1, "price" ) ) <= Engine.GetZMVials( f892_arg1 )
	end
end

function IsOwedVials( f893_arg0 )
	local f893_local0 = Engine.StorageGetBuffer( f893_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if not f893_local0 then
		return false
	elseif Dvar.tu5_enableVialsOwed:exists() then
		local f893_local1
		if f893_local0.vialsOwed:get() > 0 then
			f893_local1 = Dvar.tu5_enableVialsOwed:get()
		else
			f893_local1 = false
		end
		return f893_local1
	else
		return f893_local0.vialsOwed:get() > 0
	end
end

function HasSeenMegaChewFactoryFirstTimePopup( f894_arg0 )
	local f894_local0 = Engine.StorageGetBuffer( f894_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f894_local0 then
		return f894_local0.extraBools[0]:get() == 1
	else
		return false
	end
end

function HasSeenNewtonsCookbookFirstTimePopup( f895_arg0 )
	local f895_local0 = Engine.StorageGetBuffer( f895_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f895_local0 then
		return f895_local0.extraBools[2]:get() == 1
	else
		return false
	end
end

function HasGobbleGumCookbookUses( f896_arg0 )
	return CoD.BubbleGumBuffUtility.GetRecipeDistillCost() <= CoD.BubbleGumBuffUtility.GetTotalRemainingDistills( f896_arg0 )
end

function CanGetFreeGobblegumCookbookUses( f897_arg0 )
	local f897_local0
	if CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f897_arg0, CoD.BubbleGumBuffUtility.FREE_DISTILL ) >= CoD.BubbleGumBuffUtility.GetRecipeDistillCost() or CoD.BubbleGumBuffUtility.GetDistillCooldown( f897_arg0, CoD.BubbleGumBuffUtility.FREE_DISTILL ) > 0 then
		f897_local0 = false
	else
		f897_local0 = true
	end
	return f897_local0
end

function HasGobbleGumCookbookIngredients( f898_arg0 )
	local f898_local0 = Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f898_arg0 ), "haveAllIngredients" )
	return f898_local0 and Engine.GetModelValue( f898_local0 )
end

function ShowGobbleGumDistillTimer( f899_arg0, f899_arg1 )
	local f899_local0 = CoD.SafeGetModelValue( f899_arg0:getModel(), "distillID" )
	if f899_local0 then
		if f899_local0 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
			local f899_local1
			if CoD.BubbleGumBuffUtility.GetDistillCooldown( f899_arg1, f899_local0 ) <= 0 or CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f899_arg1, CoD.BubbleGumBuffUtility.FREE_DISTILL ) >= CoD.BubbleGumBuffUtility.GetRecipeDistillCost() then
				f899_local1 = false
			else
				f899_local1 = true
			end
			return f899_local1
		else
			return CoD.BubbleGumBuffUtility.GetDistillCooldown( f899_arg1, f899_local0 ) > 0
		end
	else
		return false
	end
end

function IsGobbleGumIngredientType( f900_arg0, f900_arg1, f900_arg2 )
	local f900_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f900_arg0, Engine.GetModelValue( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f900_arg0 ), "recipeIndex" ) ) )
	if f900_local0.ingredients[f900_arg1] then
		local f900_local1 = Engine.TableLookup( f900_arg0, "gamedata/stats/zm/zm_statsTable.csv", 0, f900_local0.ingredients[f900_arg1].itemIndex, 20 )
		if f900_local1 then
			return f900_arg2 == f900_local1
		end
	end
	return false
end

function IsGobbleGumResultType( f901_arg0, f901_arg1 )
	local f901_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f901_arg0, Engine.GetModelValue( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f901_arg0 ), "recipeIndex" ) ) )
	if f901_local0.result then
		local f901_local1 = Engine.TableLookup( f901_arg0, "gamedata/stats/zm/zm_statsTable.csv", 0, f901_local0.result.itemIndex, 20 )
		if f901_local1 then
			return f901_arg1 == f901_local1
		end
	end
	return false
end

function IsModelOnesDigitEqualTo( f902_arg0, f902_arg1, f902_arg2 )
	local f902_local0 = Engine.GetModelForController( f902_arg0 )
	if f902_local0 then
		f902_local0 = Engine.GetModel( f902_local0, f902_arg1 )
	end
	local f902_local1 = f902_local0 and Engine.GetModelValue( f902_local0 )
	if f902_local1 == nil then
		return false
	else
		return f902_local1 % 10 == f902_arg2
	end
end

function IsModelTensDigitEqualTo( f903_arg0, f903_arg1, f903_arg2 )
	local f903_local0 = Engine.GetModelForController( f903_arg0 )
	if f903_local0 then
		f903_local0 = Engine.GetModel( f903_local0, f903_arg1 )
	end
	local f903_local1 = f903_local0 and Engine.GetModelValue( f903_local0 )
	if f903_local1 == nil then
		return false
	else
		return (f903_local1 % 100 - f903_local1 % 10) / 10 == f903_arg2
	end
end

function IsModelHundredsDigitEqualTo( f904_arg0, f904_arg1, f904_arg2 )
	local f904_local0 = Engine.GetModelForController( f904_arg0 )
	if f904_local0 then
		f904_local0 = Engine.GetModel( f904_local0, f904_arg1 )
	end
	local f904_local1 = f904_local0 and Engine.GetModelValue( f904_local0 )
	if f904_local1 == nil then
		return false
	else
		return (f904_local1 % 1000 - f904_local1 % 100) / 100 == f904_arg2
	end
end

function IsConsumableCountOnesDigitEqualTo( f905_arg0, f905_arg1, f905_arg2 )
	local f905_local0 = f905_arg0:getModel()
	if f905_local0 then
		f905_local0 = Engine.GetModel( f905_local0, "itemIndex" )
	end
	local f905_local1 = f905_local0 and Engine.GetModelValue( f905_local0 )
	if f905_local1 == nil then
		return false
	else
		return GetConsumableCountFromIndex( f905_arg1, f905_local1 ) % 10 == f905_arg2
	end
end

function IsConsumableCountTensDigitEqualTo( f906_arg0, f906_arg1, f906_arg2 )
	local f906_local0 = f906_arg0:getModel()
	if f906_local0 then
		f906_local0 = Engine.GetModel( f906_local0, "itemIndex" )
	end
	local f906_local1 = f906_local0 and Engine.GetModelValue( f906_local0 )
	if f906_local1 == nil then
		return false
	else
		local f906_local2 = GetConsumableCountFromIndex( f906_arg1, f906_local1 )
		return (f906_local2 % 100 - f906_local2 % 10) / 10 == f906_arg2
	end
end

function IsConsumableCountHundredsDigitEqualTo( f907_arg0, f907_arg1, f907_arg2 )
	local f907_local0 = f907_arg0:getModel()
	if f907_local0 then
		f907_local0 = Engine.GetModel( f907_local0, "itemIndex" )
	end
	local f907_local1 = f907_local0 and Engine.GetModelValue( f907_local0 )
	if f907_local1 == nil then
		return false
	else
		local f907_local2 = GetConsumableCountFromIndex( f907_arg1, f907_local1 )
		return (f907_local2 % 1000 - f907_local2 % 100) / 100 == f907_arg2
	end
end

function IsConsumableCountGreaterThanOrEqualTo( f908_arg0, f908_arg1, f908_arg2 )
	local f908_local0 = f908_arg0:getModel()
	if f908_local0 then
		f908_local0 = Engine.GetModel( f908_local0, "itemIndex" )
	end
	local f908_local1 = f908_local0 and Engine.GetModelValue( f908_local0 )
	if f908_local1 == nil then
		return false
	else
		return f908_arg2 <= GetConsumableCountFromIndex( f908_arg1, f908_local1 )
	end
end

function IsShowcaseWeaponEquipped( f909_arg0, f909_arg1 )
	local f909_local0 = CoD.CCUtility.customizationMode
	local f909_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f909_local2 = Engine.GetModel( f909_arg0:getModel(), "itemIndex" )
	if not f909_local2 then
		return false
	else
		return Engine.GetModelValue( f909_local2 ) == Engine.GetHeroShowcaseWeaponAttribute( f909_arg1, f909_local0, f909_local1, "weaponIndex" )
	end
end

function InCharacterCustomizationMode( f910_arg0 )
	return CoD.CCUtility.customizationMode == f910_arg0
end

function CharacterHasAnyWeaponUnlocked( f911_arg0, f911_arg1 )
	if not IsProgressionEnabled( f911_arg0 ) and (not IsLive() or not IsFirstTimeSetup( f911_arg0, Enum.eModes.MODE_MULTIPLAYER )) then
		return true
	end
	local f911_local0 = f911_arg1.heroIndex
	if not f911_local0 then
		f911_local0 = CoD.SafeGetModelValue( f911_arg1:getModel(), "heroIndex" )
	end
	if not f911_local0 then
		return false
	elseif IsMultiplayer() then
		local f911_local1 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		local f911_local2 = f911_local1[f911_local0 + 1]
		if f911_local2 and CoDShared.IsLootHero( f911_local2 ) then
			return true
		end
	end
	for f911_local1 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f911_local4 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f911_local0, f911_local1 )
		if not Engine.IsItemLocked( f911_arg0, f911_local4.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.IsItemPurchased( f911_arg0, f911_local4.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) then
			return true
		end
	end
	return false
end

function IsCharacterBlackjack( f912_arg0, f912_arg1 )
	local f912_local0 = f912_arg1:getModel( f912_arg0, "heroIndex" )
	return f912_local0 and Engine.GetModelValue( f912_local0 ) == CoD.CCUtility.GetBlackjackHeroIndex()
end

function IsBlackjackContractActive( f913_arg0 )
	return Engine.ConsumableGet( f913_arg0, "blackjack", "consumed" ) < Engine.ConsumableGet( f913_arg0, "blackjack", "awarded" )
end

function IsCodPointsSaleActivated( f914_arg0, f914_arg1 )
	local f914_local0 = f914_arg0:getModel( f914_arg1, "metadata" )
	if f914_local0 then
		if Dvar.store_activateCPSale:exists() and Dvar.store_activateCPSale:get() == "1" and CoD.StoreUtility.IsCodPointSalePackage( Engine.GetModelValue( f914_local0 ) ) then
			return true
		end
	end
	return false
end

function ShouldDisplayDiscountedSeasonPass( f915_arg0, f915_arg1 )
	if not Dvar.store_seasonpassdiscount:exists() or Dvar.store_seasonpassdiscount:get() == "0" then
		return false
	else
		local f915_local0 = LuaUtils.GetSkuName()
		if f915_local0 == nil then
			return false
		elseif IsOrbis() and f915_local0 ~= "SceaEnFr" and f915_local0 ~= "SceaMsEn" and f915_local0 ~= "SceaBpEn" then
			return false
		elseif Engine.OwnSeasonPass( f915_arg1 ) then
			return false
		elseif not Engine.HasEntitlement( f915_arg1, "dlc1" ) then
			return false
		else
			return true
		end
	end
end

function ShouldShowInfiniteWarfareCategory( f916_arg0 )
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

function ShouldShowStrongholdCategory( f917_arg0 )
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

function HideExtraSlotsPurchaseButton( f918_arg0, f918_arg1 )
	if CoD.perController[f918_arg1].selectedStoreCategory == "EXTRASLOTS" then
		return false
	else
		
	end
end

function HasStoreItems( f919_arg0 )
	if CoD.perController[f919_arg0].selectedStoreCategory then
		if CoD.perController[f919_arg0].selectedStoreCategory == "EXTRASLOTS" or CoD.perController[f919_arg0].selectedStoreCategory == "ESPORTS" then
			return true
		else
			return #Engine.GetStoreProductsByCategory( f919_arg0, CoD.perController[f919_arg0].selectedStoreCategory ) > 0
		end
	else
		return false
	end
end

function HideProductNameAndDesc()
	return false
end

function IsLootReady( f921_arg0 )
	return Engine.IsLootReady( f921_arg0 )
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
		local f928_local0
		if Dvar.ui_execdemo:get() then
			f928_local0 = Dvar.ui_execdemo:get()
			if f928_local0 then
				f928_local0 = Dvar.ui_execdemo_beta:get()
			end
		else
			f928_local0 = true
		end
	end
	return f928_local0
end

function IsGamesComBuild()
	return LuaUtils.IsGamescomBuild()
end

function ShouldOpenNetworkOptions()
	return true
end

function IsBlackhatHacking( f931_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f931_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Hacking
end

function IsBlackhatBreaching( f932_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f932_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Breaching
end

function IsBrightnessSliderPipEmpty( f933_arg0 )
	local f933_local0 = f933_arg0.gridInfoTable.zeroBasedIndex
	local f933_local1 = f933_arg0.gridInfoTable.parentGrid.activeWidget
	local f933_local2 = 0
	if f933_local1 then
		f933_local2 = f933_local1.gridInfoTable.zeroBasedIndex
	end
	if f933_local2 < f933_local0 then
		return true
	else
		
	end
end

function IsAlertOverlay( f934_arg0, f934_arg1 )
	local f934_local0 = f934_arg0:getModel( f934_arg1, "categoryType" )
	if f934_local0 then
		local f934_local1 = Engine.GetModelValue( f934_local0 )
		local f934_local2
		if f934_local1 ~= CoD.OverlayUtility.OverlayTypes.Alert and f934_local1 ~= CoD.OverlayUtility.OverlayTypes.Error then
			f934_local2 = false
		else
			f934_local2 = true
		end
		return f934_local2
	else
		return false
	end
end

function HasOverlayBackAction( f935_arg0 )
	return f935_arg0[CoD.OverlayUtility.GoBackPropertyName] ~= nil
end

function HasOverlayContinueAction( f936_arg0 )
	return f936_arg0[CoD.OverlayUtility.ContinuePropertyName] ~= nil
end

function IsPrimaryControllerIndex( f937_arg0 )
	if Engine.GetPrimaryController() == f937_arg0 then
		return true
	else
		return false
	end
end

function IsCodCasterQuickSettingEnabled( f938_arg0, f938_arg1, f938_arg2 )
	if not f938_arg1.profileVar then
		return false
	else
		return CoD.ShoutcasterProfileVarBool( f938_arg2, f938_arg1.profileVar )
	end
end

function IsCodCaster( f939_arg0 )
	if CoD.IsShoutcaster( f939_arg0 ) then
		return true
	else
		return false
	end
end

function IsCodCasterProfileValueEqualTo( f940_arg0, f940_arg1, f940_arg2 )
	local f940_local0 = CoD.ShoutcasterProfileVarValue( f940_arg0, f940_arg1 )
	local f940_local1
	if f940_local0 == nil or f940_local0 ~= f940_arg2 then
		f940_local1 = false
	else
		f940_local1 = true
	end
	return f940_local1
end

function ShouldHideCodCasterHud( f941_arg0 )
	if not IsGlobalModelValueGreaterThan( f941_arg0, "scoreboard.team1.count", 0 ) and not IsGlobalModelValueGreaterThan( f941_arg0, "scoreboard.team2.count", 0 ) then
		return true
	else
		return false
	end
end

function IsCodCasterSpectatingPlayerInTeam( f942_arg0, f942_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f942_arg0 ), "deadSpectator.playerTeam" ) == f942_arg1
end

function ShouldPresentMOTDBanner( f943_arg0, f943_arg1 )
	local f943_local0 = false
	local f943_local1 = Engine.GetMarketingMessage( f943_arg0, "registration" )
	if f943_local1 ~= nil then
		local f943_local2 = f943_local1.action
		if f943_local2 == "registration" or f943_local2 == "opt-in" or LUI.startswith( f943_local2, "store" ) or f943_local2 == "blackmarket" or f943_local2 == "drmonty" or f943_local2 == "contracts" or f943_local2 == "promo" or f943_local2 == "expand" then
			return true
		end
		f943_local0 = true
	end
	if ShouldShowMtxCommsMOTDPopup( f943_arg0 ) then
		local f943_local2 = Engine.GetMarketingMessage( f943_arg0, "motd" )
		if f943_local2 == nil or not f943_local2.hasBanner then
			return false
		elseif f943_local0 == true then
			local f943_local3 = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" )
			Engine.SetModelValue( Engine.GetModel( f943_local3, "content_short" ), f943_local2.bannerTitle )
			Engine.SetModelValue( Engine.GetModel( f943_local3, "action" ), f943_local2.bannerAction )
			Engine.SetModelValue( Engine.GetModel( f943_local3, "image" ), f943_local2.bannerImage )
			Engine.SetModelValue( Engine.GetModel( f943_local3, "action_title" ), f943_local2.bannerActionString )
			Engine.SetModelValue( Engine.GetModel( f943_local3, "locationID" ), 1 )
		end
		return true
	end
	return false
end

function IsInventoryWidgetVisible( f944_arg0, f944_arg1 )
	return IsModelValueEqualTo( f944_arg0, "zmInventory." .. f944_arg1, 1 )
end

function IsInventoryPieceVisible( f945_arg0, f945_arg1 )
	return IsModelValueEqualTo( f945_arg0, "zmInventory." .. f945_arg1, 1 )
end

function IsEitherInventoryItemVisible( f946_arg0, f946_arg1, f946_arg2 )
	local f946_local0 = IsModelValueEqualTo( f946_arg0, "zmInventory." .. f946_arg1, 1 )
	if not f946_local0 then
		f946_local0 = IsModelValueEqualTo( f946_arg0, "zmInventory." .. f946_arg2, 1 )
	end
	return f946_local0
end

function IsAnyInventoryItemVisible3( f947_arg0, f947_arg1, f947_arg2, f947_arg3 )
	local f947_local0 = IsModelValueEqualTo( f947_arg0, "zmInventory." .. f947_arg1, 1 )
	if not f947_local0 then
		f947_local0 = IsModelValueEqualTo( f947_arg0, "zmInventory." .. f947_arg2, 1 )
		if not f947_local0 then
			f947_local0 = IsModelValueEqualTo( f947_arg0, "zmInventory." .. f947_arg3, 1 )
		end
	end
	return f947_local0
end

function IsAnyInventoryItemVisible4( f948_arg0, f948_arg1, f948_arg2, f948_arg3, f948_arg4 )
	local f948_local0 = IsModelValueEqualTo( f948_arg0, "zmInventory." .. f948_arg1, 1 )
	if not f948_local0 then
		f948_local0 = IsModelValueEqualTo( f948_arg0, "zmInventory." .. f948_arg2, 1 )
		if not f948_local0 then
			f948_local0 = IsModelValueEqualTo( f948_arg0, "zmInventory." .. f948_arg3, 1 )
			if not f948_local0 then
				f948_local0 = IsModelValueEqualTo( f948_arg0, "zmInventory." .. f948_arg4, 1 )
			end
		end
	end
	return f948_local0
end

function IsAnyInventoryModelGreaterThan3( f949_arg0, f949_arg1, f949_arg2, f949_arg3, f949_arg4, f949_arg5, f949_arg6 )
	local f949_local0 = IsModelValueGreaterThan( f949_arg0, "zmInventory." .. f949_arg1, f949_arg2 )
	if not f949_local0 then
		f949_local0 = IsModelValueGreaterThan( f949_arg0, "zmInventory." .. f949_arg3, f949_arg4 )
		if not f949_local0 then
			f949_local0 = IsModelValueGreaterThan( f949_arg0, "zmInventory." .. f949_arg5, f949_arg6 )
		end
	end
	return f949_local0
end

function FuseBoxVisible( f950_arg0, f950_arg1 )
	if CoD.Zombie[f950_arg1] then
		local f950_local0 = Engine.GetModel( Engine.GetModelForController( f950_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie[f950_arg1] )
		return f950_local0 and Engine.GetModelValue( f950_local0 ) == 1
	else
		
	end
end

function RocketShieldBlueprintPieceVisible( f951_arg0, f951_arg1 )
	if CoD.Zombie[f951_arg1] then
		local f951_local0 = Engine.GetModel( Engine.GetModelForController( f951_arg0 ), "zmInventory." .. CoD.Zombie[f951_arg1] )
		return f951_local0 and Engine.GetModelValue( f951_local0 ) == 1
	else
		
	end
end

function IDGunBlueprintPieceVisible( f952_arg0, f952_arg1 )
	if CoD.Zombie[f952_arg1] then
		local f952_local0 = Engine.GetModel( Engine.GetModelForController( f952_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie[f952_arg1] )
		return f952_local0 and Engine.GetModelValue( f952_local0 ) == 1
	else
		
	end
end

function SummonningKeyVisible( f953_arg0 )
	local f953_local0 = Engine.GetModel( Engine.GetModelForController( f953_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY )
	return f953_local0 and Engine.GetModelValue( f953_local0 ) == 1
end

function SummoningKeyBeingUsed( f954_arg0 )
	local f954_local0 = Engine.GetModel( Engine.GetModelForController( f954_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY )
	local f954_local1 = Engine.GetModelValue( f954_local0 )
	local f954_local2 = f954_local0
	local f954_local3
	if f954_local1 <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or f954_local1 >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES then
		f954_local3 = false
	else
		f954_local3 = f954_local2 and true
	end
	return f954_local3
end

function SummoningKeyBeingUsedByOtherPlayer( f955_arg0 )
	local f955_local0 = Engine.GetModel( Engine.GetModelForController( f955_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY )
	local f955_local1 = Engine.GetModelValue( f955_local0 )
	local f955_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f955_arg0 ), "zmInventory.player_character_identity" ) )
	local f955_local3 = f955_local0
	local f955_local4
	if f955_local1 <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or f955_local1 >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES or f955_local1 == f955_local2 then
		f955_local4 = false
	else
		f955_local4 = f955_local3 and true
	end
	return f955_local4
end

function SummoningKeyMissing( f956_arg0 )
	return (CheckMemento( f956_arg0, CoD.Zombie.ZOD_NAME_FEMME ) or CheckMemento( f956_arg0, CoD.Zombie.ZOD_NAME_DETECTIVE ) or CheckMemento( f956_arg0, CoD.Zombie.ZOD_NAME_BOXER ) or CheckMemento( f956_arg0, CoD.Zombie.ZOD_NAME_MAGICIAN )) and not SummonningKeyVisible( f956_arg0 )
end

function IsRitualItemInState( f957_arg0, f957_arg1, f957_arg2 )
	if CoD.Zombie[f957_arg1] and CoD.Zombie[f957_arg2] then
		local f957_local0 = Engine.GetModel( Engine.GetModelForController( f957_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie[f957_arg1] )
		return f957_local0 and Engine.GetModelValue( f957_local0 ) == CoD.Zombie[f957_arg2]
	else
		
	end
end

function IsRitualItemHeldBy( f958_arg0, f958_arg1, f958_arg2 )
	if CoD.Zombie[f958_arg1] and CoD.Zombie[f958_arg2] then
		local f958_local0 = Engine.GetModel( Engine.GetModelForController( f958_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie[f958_arg1] )
		return f958_local0 and Engine.GetModelValue( f958_local0 ) == CoD.Zombie[f958_arg2]
	else
		
	end
end

function IsRitualItemMissing( f959_arg0, f959_arg1 )
	if CoD.Zombie[f959_arg1] then
		local f959_local0 = Engine.GetModel( Engine.GetModelForController( f959_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[f959_arg1] .. CoD.Zombie.MEMENTO_SUFFIX )
		return f959_local0 and Engine.GetModelValue( f959_local0 ) == 1 and IsRitualItemInState( f959_arg0, f959_arg1, "CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_MEMENTO" )
	else
		
	end
end

function IsRitualItemBeingUsed( f960_arg0, f960_arg1 )
	if CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. f960_arg1] then
		local f960_local0 = Engine.GetModel( Engine.GetModelForController( f960_arg0 ), "zmInventory." .. CoD.Zombie.USED_QUEST_KEY_LOCATION )
		return f960_local0 and Engine.GetModelValue( f960_local0 ) == CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. f960_arg1]
	else
		
	end
end

function IsRitualItemWithAnotherPlayer( f961_arg0, f961_arg1 )
	if CoD.Zombie[f961_arg1] then
		local f961_local0 = Engine.GetModel( Engine.GetModelForController( f961_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[f961_arg1] .. CoD.Zombie.MEMENTO_SUFFIX )
		return f961_local0 and Engine.GetModelValue( f961_local0 ) == 1 and not IsRitualItemHeldBy( f961_arg0, f961_arg1, CoD.Zombie.GetCharacterEnumString( Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f961_arg0 ), "zmInventory.player_character_identity" ) ) ) )
	else
		
	end
end

function HasTalonSpikeItem( f962_arg0, f962_arg1 )
	local f962_local0 = CoD.Zombie[f962_arg1]
	if not f962_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f962_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_GRAVITYSPIKE .. "_" .. f962_local0 ) == 1
	end
end

function ShowGasMaskPartsWidget( f963_arg0 )
	local f963_local0 = Engine.GetModel( Engine.GetModelForController( f963_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_GASMASK_PARTS )
	return f963_local0 and Engine.GetModelValue( f963_local0 ) == 1
end

function HasGasMaskItem( f964_arg0, f964_arg1 )
	local f964_local0 = CoD.Zombie[f964_arg1]
	if not f964_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f964_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_GASMASK .. "_" .. f964_local0 ) == 1
	end
end

function ShowMachineToolsPartsWidget( f965_arg0 )
	local f965_local0 = Engine.GetModel( Engine.GetModelForController( f965_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_MACHINETOOLS_PARTS )
	return f965_local0 and Engine.GetModelValue( f965_local0 ) == 1
end

function HasMachineToolsItem( f966_arg0, f966_arg1 )
	local f966_local0 = CoD.Zombie[f966_arg1]
	if not f966_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f966_arg0 ), "zmInventory." .. f966_local0 .. "_" .. CoD.Zombie.CRAFTABLE_MACHINETOOLS ) == 1
	end
end

function ShowWonderWeaponPartsWidget( f967_arg0 )
	local f967_local0 = Engine.GetModel( Engine.GetModelForController( f967_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_WONDERWEAPON_PARTS )
	return f967_local0 and Engine.GetModelValue( f967_local0 ) == 1
end

function HasWonderWeaponItem( f968_arg0, f968_arg1 )
	local f968_local0 = CoD.Zombie[f968_arg1]
	if not f968_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f968_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_WONDERWEAPON .. "_" .. f968_local0 ) == 1
	end
end

function ShowSkullPartsWidget( f969_arg0 )
	local f969_local0 = Engine.GetModel( Engine.GetModelForController( f969_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_SKULL_PARTS )
	return f969_local0 and Engine.GetModelValue( f969_local0 ) == 1
end

function ShowBucketPartsWidget( f970_arg0 )
	local f970_local0 = Engine.GetModel( Engine.GetModelForController( f970_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_BUCKET_PARTS )
	return f970_local0 and Engine.GetModelValue( f970_local0 ) == 1
end

function ShowingAnyBucketPart( f971_arg0 )
	local f971_local0 = Engine.IsVisibilityBitSet( f971_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f971_local0 then
		f971_local0 = ShowBucketOrSeedWidget( f971_arg0 )
	end
	return f971_local0
end

function IsBucketAtLevel( f972_arg0, f972_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f972_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_TYPE ) == f972_arg1
end

function IsBucketWaterType( f973_arg0, f973_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f973_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_WATER_TYPE ) == f973_arg1
end

function IsBucketWaterLevel( f974_arg0, f974_arg1 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f974_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. CoD.Zombie.CRAFTABLE_BUCKET_WATER_LEVEL ) == f974_arg1
end

function ShowSeedPartsWidget( f975_arg0 )
	local f975_local0 = Engine.GetModel( Engine.GetModelForController( f975_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_SEED_PARTS )
	return f975_local0 and Engine.GetModelValue( f975_local0 ) == 1
end

function ShowBucketOrSeedWidget( f976_arg0 )
	local f976_local0 = ShowBucketPartsWidget( f976_arg0 )
	if not f976_local0 then
		f976_local0 = ShowSeedPartsWidget( f976_arg0 )
	end
	return f976_local0
end

function HasBucketSeedItem( f977_arg0, f977_arg1 )
	local f977_local0 = CoD.Zombie[f977_arg1]
	if not f977_local0 then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( f977_arg0 ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. f977_local0 ) == 1
	end
end

function SprayerMissing( f978_arg0 )
	local f978_local0 = Engine.GetModel( Engine.GetModelForController( f978_arg0 ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HINT_RANGE )
	local f978_local1 = f978_local0
	local f978_local2
	if Engine.GetModelValue( f978_local0 ) == 1 then
		f978_local2 = not SprayerFound( f978_arg0 )
	else
		f978_local2 = false
	end
	return f978_local2
end

function SprayerFound( f979_arg0 )
	local f979_local0 = Engine.GetModel( Engine.GetModelForController( f979_arg0 ), "zmInventory." .. CoD.Zombie.POD_SPRAYER_HELD )
	return f979_local0 and Engine.GetModelValue( f979_local0 ) == 1
end

function SprayerInUse( f980_arg0 )
	local f980_local0 = Engine.GetModel( Engine.GetModelForController( f980_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_USING_SPRAYER )
	return f980_local0 and Engine.GetModelValue( f980_local0 ) == 1
end

function ShowQuestItemsWidget( f981_arg0 )
	local f981_local0 = Engine.GetModel( Engine.GetModelForController( f981_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_QUEST_ITEMS )
	return f981_local0 and Engine.GetModelValue( f981_local0 ) == 1
end

function ShowIDGunPartsWidget( f982_arg0 )
	local f982_local0 = Engine.GetModel( Engine.GetModelForController( f982_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_IDGUN_PARTS )
	return f982_local0 and Engine.GetModelValue( f982_local0 ) == 1
end

function ShowRocketShieldPartsWidget( f983_arg0 )
	local f983_local0 = Engine.GetModel( Engine.GetModelForController( f983_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_ROCKETSHIELD_PARTS )
	return f983_local0 and Engine.GetModelValue( f983_local0 ) == 1
end

function ShowGravitySpikePartsWidget( f984_arg0 )
	local f984_local0 = Engine.GetModel( Engine.GetModelForController( f984_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_GRAVITYSPIKE_PARTS )
	return f984_local0 and Engine.GetModelValue( f984_local0 ) == 1
end

function ShowFuseBoxWidget( f985_arg0 )
	local f985_local0 = Engine.GetModel( Engine.GetModelForController( f985_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_FUSES )
	return f985_local0 and Engine.GetModelValue( f985_local0 ) == 1
end

function ShowEggWidget( f986_arg0 )
	local f986_local0 = Engine.GetModel( Engine.GetModelForController( f986_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_EGG )
	return f986_local0 and Engine.GetModelValue( f986_local0 ) == 1
end

function ShowSprayerWidget( f987_arg0 )
	local f987_local0 = Engine.GetModel( Engine.GetModelForController( f987_arg0 ), "zmInventory." .. CoD.Zombie.WIDGET_SPRAYER )
	return f987_local0 and Engine.GetModelValue( f987_local0 ) == 1
end

function QuestEggInState( f988_arg0, f988_arg1 )
	if CoD.Zombie[f988_arg1] then
		local f988_local0 = Engine.GetModel( Engine.GetModelForController( f988_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_EGG_STATE )
		return f988_local0 and Engine.GetModelValue( f988_local0 ) == CoD.Zombie[f988_arg1]
	else
		
	end
end

function QuestEggQuest1Complete( f989_arg0 )
	local f989_local0 = Engine.GetModel( Engine.GetModelForController( f989_arg0 ), "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_COMPLETED_LEVEL_1 )
	return f989_local0 and Engine.GetModelValue( f989_local0 ) == 1
end

function ShowTrialsCompletedWidgetStalingrad( f990_arg0 )
	local f990_local0 = IsModelValueGreaterThan( f990_arg0, "trialWidget.challenge1state", 0 )
	if not f990_local0 then
		f990_local0 = IsModelValueGreaterThan( f990_arg0, "trialWidget.challenge2state", 0 )
		if not f990_local0 then
			f990_local0 = IsModelValueGreaterThan( f990_arg0, "trialWidget.challenge3state", 0 )
		end
	end
	return f990_local0
end

function IsGenesisEECompleted( f991_arg0 )
	return CoD.SafeGetModelValue( Engine.GetModelForController( f991_arg0 ), "GenesisEndGameEE" ) == 1
end

function ChatClientShow( f992_arg0 )
	return CoD.isPC
end

function ChatClientEnabled( f993_arg0 )
	return ChatClientShow( f993_arg0 ) and Dvar.chatClientEnabled:get() == true
end

function ChatClientIsAvailable( f994_arg0, f994_arg1, f994_arg2 )
	return ChatClientEnabled( f994_arg2 ) and Engine.ChatClient_IsAvailable( f994_arg2 )
end

function ChatClientIsChatting( f995_arg0 )
	return ChatClientEnabled( f995_arg0 ) and Engine.ChatClient_IsChatting( f995_arg0 )
end

function ChatClientAnySubMenuOpen( f996_arg0 )
	if not ChatClientShow( f996_arg0 ) then
		return false
	end
	local f996_local0 = false
	local f996_local1 = CoD.ChatClientUtility.GetMenuInputChannelShowModel()
	if f996_local1 ~= nil then
		f996_local0 = Engine.GetModelValue( f996_local1 ) > 0
	end
	if not f996_local0 then
		f996_local1 = CoD.ChatClientUtility.GetMenuSettingsShowModel()
		if f996_local1 ~= nil then
			f996_local0 = Engine.GetModelValue( f996_local1 ) > 0
		end
	end
	return f996_local0
end

function CharacterCustomization_IsEnabled( f997_arg0 )
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
	local f1001_local0 = Dvar.loc_language:get()
	if f1001_local0 == CoD.LANGUAGE_ENGLISH or f1001_local0 == CoD.LANGUAGE_ENGLISHARABIC then
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

function FeaturedCards_IsEnabled( f1008_arg0, f1008_arg1 )
	local f1008_local0 = LobbyData.GetLobbyNav()
	if f1008_local0 ~= LobbyData.UITargets.UI_MODESELECT.id and f1008_local0 ~= LobbyData.UITargets.UI_MPLOBBYMAIN.id and f1008_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		return false
	else
		local f1008_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true ), "Enabled", true ) )
		if HasLiveEvent( f1008_arg1 ) then
			return true
		elseif f1008_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
			return true
		elseif Dvar.ui_enableZMHDFeaturedCard:get() == 1 or Dvar.ui_enableZMHDFeaturedCard:get() == "1" then
			return true
		else
			local f1008_local2 = Engine.GetFeaturedCardsData()
			if Dvar.live_featuredEnabled:get() == false or f1008_local2.enabled == false then
				return false
			elseif f1008_local2.validCardsCount == 0 then
				return false
			else
				return true
			end
		end
	end
end

function ConnectionMeter_isEnabled( f1009_arg0, f1009_arg1 )
	if Dvar.ui_enableConnectionMetricGraphs:get() == 0 then
		return false
	elseif Engine.ProfileInt( f1009_arg1, "showConnectionMeter" ) ~= 1 then
		return false
	else
		return true
	end
end

function HighestMapReachedGreaterThan( f1010_arg0, f1010_arg1 )
	local f1010_local0 = CoD.GetPlayerStats( f1010_arg0 )
	local f1010_local1 = f1010_local0
	local f1010_local2 = f1010_local0.highestMapReached
	if f1010_local2 then
		f1010_local2 = f1010_local1 and f1010_local0.highestMapReached:get()
	end
	local f1010_local3
	if f1010_local2 == nil or f1010_arg1 >= f1010_local2 then
		f1010_local3 = false
	else
		f1010_local3 = true
	end
	return f1010_local3
end

function MissionRecordMapComplete( f1011_arg0, f1011_arg1 )
	if Engine.GetDStat( f1011_arg1, "PlayerStatsByMap", Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo.mapId" ) ), "hasBeenCompleted" ) == 1 then
		return true
	else
		return false
	end
end

function IsGameInstalled()
	local f1012_local0
	if not Engine.IsCpStillDownloading() then
		f1012_local0 = not Engine.IsMpStillDownloading()
	else
		f1012_local0 = false
	end
	return f1012_local0
end

function IsGameModeInstalled( f1013_arg0, f1013_arg1 )
	if f1013_arg1 == Enum.eModes.MODE_CAMPAIGN then
		return Engine.IsCpStillDownloading() == false
	elseif f1013_arg1 == Enum.eModes.MODE_MULTIPLAYER then
		return Engine.IsMpStillDownloading() == false
	elseif f1013_arg1 == Enum.eModes.MODE_ZOMBIES then
		return Engine.IsZmStillDownloading() == false
	else
		return false
	end
end

function PlayGoIsStillDownloading( f1014_arg0 )
	if Engine.IsMpStillDownloading() or Engine.IsMpInitialStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsZmInitialStillDownloading() then
		return true
	else
		return false
	end
end

function ShouldShowCampaignResetOption( f1015_arg0 )
	return f1015_arg0 == Engine.GetPrimaryController()
end

function ZMDoubleXPWidgetVisible( f1016_arg0 )
	local f1016_local0 = IsZombies()
	if f1016_local0 then
		if not IsLAN() then
			if IsModelValueEqualTo( f1016_arg0, "doubleXPTimeRemaining", 0 ) then
				f1016_local0 = IsZMDoubleXPWeekend( f1016_arg0 )
			else
				f1016_local0 = true
			end
		else
			f1016_local0 = false
		end
	end
	return f1016_local0
end

function IsZMDoubleXPWeekend( f1017_arg0 )
	if Engine.IsInGame() then
		return Engine.IsDoubleXPWeekend( f1017_arg0 ) and IsDoubleXP( f1017_arg0 )
	end
	local f1017_local0 = Engine.GetPlaylistInfoByID( 150 )
	local f1017_local1 = LuaUtils.PlaylistRulesIncludes( f1017_local0, "xpGroups group_party2" )
	local f1017_local2 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f1017_local2 = Enum.LobbyModule.LOBBY_MODULE_HOST
	end
	local f1017_local3 = Engine.GetLobbyClientCount( f1017_local2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
	local f1017_local4 = Engine.GetLobbyClientCount( f1017_local2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_GUEST )
	local f1017_local5 = LuaUtils.PlaylistRulesIncludes( f1017_local0, "scr_xpscalezm 2" )
	if f1017_local5 then
		if f1017_local1 and f1017_local3 - f1017_local4 < 2 then
			f1017_local5 = false
		else
			f1017_local5 = true
		end
	end
	return f1017_local5
end

function IsZMDoubleVialActive( f1018_arg0 )
	if Engine.IsInGame() then
		return Engine.DvarFloat( "scr_vialsAwardedScale" ) > 1
	else
		return LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( 150 ), "scr_vialsAwardedScale 2.0" )
	end
end

function IsZMDoubleWeaponXP( f1019_arg0 )
	if Engine.IsInGame() then
		return IsDoubleWeaponXP( f1019_arg0 )
	else
		return LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( 150 ), "scr_gunxpscalezm 2" )
	end
end

function IsZMFreeGumPerRoundActive( f1020_arg0 )
	if Engine.IsInGame() then
		return Engine.DvarBool( f1020_arg0, "scr_firstGumFree" )
	else
		return LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( 150 ), "scr_firstGumFree 1" )
	end
end

function IsLiquidDiviniumSaleActive( f1021_arg0 )
	return Engine.DvarFloat( "loot_ld_salePercentOff" ) > 0
end

function IsLiquidDiviniumMegaBundleActive( f1022_arg0 )
	return Engine.DvarBool( nil, "loot_ld_mega_bundle_enabled" )
end

function IsLiquidDiviniumUltraRarePromoActive( f1023_arg0 )
	return Engine.DvarBool( nil, "loot_ld_ultra_rare_enabled" )
end

function IsUltraRareMegaGobblegumPromoActive( f1024_arg0 )
	if Engine.DvarBool( nil, "loot_ld_urm_gobblegum_enabled" ) then
		return Engine.GetInventoryItemQuantity( f1024_arg0, Engine.DvarInt( nil, "loot_ld_urm_purchase_sku" ) ) == 0
	else
		return false
	end
end

function ShouldShowLiquidDiviniumPromoBanner( f1025_arg0 )
	local f1025_local0 = AreCodPointsEnabled( f1025_arg0 )
	if f1025_local0 then
		f1025_local0 = IsLiquidDiviniumSaleActive( f1025_arg0 )
		if not f1025_local0 then
			f1025_local0 = IsLiquidDiviniumUltraRarePromoActive( f1025_arg0 )
			if not f1025_local0 then
				f1025_local0 = IsUltraRareMegaGobblegumPromoActive( f1025_arg0 )
				if not f1025_local0 then
					f1025_local0 = IsLiquidDiviniumMegaBundleActive( f1025_arg0 )
				end
			end
		end
	end
	return f1025_local0
end

function IsDistillCODPointsSaleActive( f1026_arg0 )
	return Engine.DvarFloat( "loot_distill_salePercentOff" ) > 0
end

function IsDistillLDSaleActive( f1027_arg0 )
	return Engine.DvarFloat( "ld_distill_salePercentOff" ) > 0
end

function EnableCombatRecordCompare( f1028_arg0 )
	return true
end

function IsCPCombatRecordLockedForSocialPlayerInfo( f1029_arg0, f1029_arg1 )
	local f1029_local0 = f1029_arg1:getModel( f1029_arg0, "cpRank" )
	if f1029_local0 then
		local f1029_local1 = Engine.GetModelValue( f1029_local0 )
		if f1029_local1 then
			return f1029_local1 < 1
		end
	end
	return false
end

function IsMPCombatRecordLockedForSocialPlayerInfo( f1030_arg0, f1030_arg1 )
	local f1030_local0 = 7
	local f1030_local1 = f1030_arg1:getModel( f1030_arg0, "mpRank" )
	local f1030_local2 = f1030_arg1:getModel( f1030_arg0, "mpPrestige" )
	if f1030_local1 and f1030_local2 then
		local f1030_local3 = Engine.GetModelValue( f1030_local1 )
		local f1030_local4 = Engine.GetModelValue( f1030_local2 )
		if f1030_local3 and f1030_local4 then
			local f1030_local5
			if f1030_local3 >= f1030_local0 or f1030_local4 >= 1 then
				f1030_local5 = false
			else
				f1030_local5 = true
			end
			return f1030_local5
		end
	end
	return false
end

function IsZMCombatRecordLockedForSocialPlayerInfo( f1031_arg0, f1031_arg1 )
	local f1031_local0 = 2
	local f1031_local1 = f1031_arg1:getModel( f1031_arg0, "zmRank" )
	local f1031_local2 = f1031_arg1:getModel( f1031_arg0, "zmPrestige" )
	if f1031_local1 and f1031_local2 then
		local f1031_local3 = Engine.GetModelValue( f1031_local1 )
		local f1031_local4 = Engine.GetModelValue( f1031_local2 )
		if f1031_local3 and f1031_local4 then
			local f1031_local5
			if f1031_local3 >= f1031_local0 or f1031_local4 >= 1 then
				f1031_local5 = false
			else
				f1031_local5 = true
			end
			return f1031_local5
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

function IsComparingStats( f1035_arg0 )
	local f1035_local0 = Engine.GetModel( Engine.GetModelForController( f1035_arg0 ), "CombatRecordComparing" )
	if not f1035_local0 or not Engine.GetModelValue( f1035_local0 ) then
		return false
	else
		local f1035_local1 = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" )
		if not f1035_local1 or Engine.GetModelValue( f1035_local1 ) then
			return false
		else
			local f1035_local2 = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" )
			if not f1035_local2 or not Engine.GetModelValue( f1035_local2 ) then
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

function CombatRecordProfileSnapshotShouldShowSnapshot( f1037_arg0 )
	local f1037_local0 = DataSources.CombatRecordProfileSnapshot.getModel( f1037_arg0 )
	if f1037_local0 and CoD.SafeGetModelValue( f1037_local0, "fileId" ) ~= Engine.DefaultID64Value() then
		return true
	else
		return false
	end
end

function IsStorageValueAtLeast( f1038_arg0, f1038_arg1, f1038_arg2, f1038_arg3 )
	local f1038_local0 = CoD.SafeGetModelValue( DataSources.StorageGlobal.getModel( f1038_arg0 ), f1038_arg1 )
	if f1038_local0 then
		local f1038_local1 = StorageLookup( f1038_arg0, f1038_arg2, f1038_local0 )
		return f1038_local1 and f1038_arg3 <= tonumber( f1038_local1 )
	else
		return false
	end
end

function IsStorageValueEqualTo( f1039_arg0, f1039_arg1, f1039_arg2, f1039_arg3 )
	local f1039_local0 = CoD.SafeGetModelValue( DataSources.StorageGlobal.getModel( f1039_arg0 ), f1039_arg1 )
	if f1039_local0 then
		local f1039_local1 = StorageLookup( f1039_arg0, f1039_arg2, f1039_local0 )
		return f1039_local1 and tonumber( f1039_local1 ) == f1039_arg3
	else
		return false
	end
end

function CanOpenTwitch( f1040_arg0 )
	return false
end

function HasLiveEvent( f1041_arg0 )
	local f1041_local0 = CoD.SafeGetModelValue( DataSources.LiveEventViewer.getModel( f1041_arg0 ), "stream" )
	return f1041_local0 and f1041_local0 ~= ""
end

function IsMLGStream( f1042_arg0 )
	local f1042_local0 = CoD.SafeGetModelValue( DataSources.LiveEventViewer.getModel( f1042_arg0 ), "stream" )
	return f1042_local0 and LUI.startswith( f1042_local0, "mlg/" )
end

function HasLiveEventStreamQualities()
	local f1043_local0 = CoD.SafeGetModelValue( DataSources.LiveEventViewer.getModel(), "currentQuality" )
	return f1043_local0 and f1043_local0 ~= ""
end

function ElementHasText( f1044_arg0, f1044_arg1 )
	if f1044_arg0[f1044_arg1] and f1044_arg0[f1044_arg1].getText then
		local f1044_local0 = f1044_arg0[f1044_arg1]:getText()
		local f1044_local1 = f1044_local0
		local f1044_local2
		if f1044_local0 == "" or f1044_local0 == Engine.Localize( "" ) then
			f1044_local2 = false
		else
			f1044_local2 = f1044_local1 and true
		end
		return f1044_local2
	else
		
	end
end

function IsNotLobbyGameHostOrNotPrimaryController( f1045_arg0 )
	local f1045_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1045_local1 = Engine.GetPrimaryController() == f1045_arg0
	local f1045_local2
	if f1045_local0 then
		f1045_local2 = not f1045_local1
	else
		f1045_local2 = true
	end
	return f1045_local2
end

function DoesPlayerHaveExtraSlotsItem( f1046_arg0 )
	return Engine.GetInventoryItemQuantity( f1046_arg0, tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( CoD.StoreUtility.ExtraSlotsProductDesc, CoD.StoreUtility.InventoryItems.itemIdColumn ) ) ) > 0
end

function DoesPlayerHaveEsportsPackItem( f1047_arg0, f1047_arg1 )
	if IsPerControllerTablePropertyValue( f1047_arg1, "selectedStoreCategory", "ESPORTS" ) then
		local f1047_local0 = f1047_arg0:getModel( f1047_arg1, "skuID" )
		if f1047_local0 then
			return Engine.GetInventoryItemQuantity( f1047_arg1, Engine.GetModelValue( f1047_local0 ) ) > 0
		end
	end
	return false
end

function ShouldShowLobbyEE()
	local f1048_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f1048_local1 = IsZombies()
	if f1048_local1 then
		if f1048_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id and f1048_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
			f1048_local1 = false
		else
			f1048_local1 = true
		end
	end
	return f1048_local1
end

function ShouldDeselectAllTracks( f1049_arg0 )
	local f1049_local0 = DataSources.MusicTracksBase.getCurrentFilterTotalSelectedModel( f1049_arg0 )
	local f1049_local1 = DataSources.MusicTracksBase.getCurrentFilterTotalCountModel( f1049_arg0 )
	return f1049_local1 and f1049_local0 and Engine.GetModelValue( f1049_local1 ) <= Engine.GetModelValue( f1049_local0 )
end

function IsSpecialContractAvailable( f1050_arg0, f1050_arg1, f1050_arg2 )
	if IsSelfModelValueTrue( f1050_arg1, f1050_arg2, "isGroupButton" ) then
		return true
	else
		local f1050_local0
		if not IsSelfModelValueTrue( f1050_arg1, f1050_arg2, "isComplete" ) then
			f1050_local0 = not IsControllerModelValueEqualToSelfModelValue( f1050_arg1, f1050_arg2, "CurrentSpecialContract.index", "index" )
		else
			f1050_local0 = false
		end
	end
	return f1050_local0
end

function IsSpecialContractActive( f1051_arg0, f1051_arg1, f1051_arg2 )
	if IsSelfModelValueTrue( f1051_arg1, f1051_arg2, "isGroupButton" ) and IsModelValueTrue( f1051_arg2, "CurrentSpecialContract.isComplete" ) then
		return false
	else
		return IsControllerModelValueEqualToSelfModelValue( f1051_arg1, f1051_arg2, "CurrentSpecialContract.index", "index" )
	end
end

function IsViewingSpecialContractCallingCardSet( f1052_arg0 )
	for f1052_local3, f1052_local4 in ipairs( CoD.ChallengesUtility.SpecialContractCategories ) do
		if f1052_local4 == CoD.perController[f1052_arg0].BlackMarketUtility_CurrentCallingCardSetName then
			return true
		end
	end
	return false
end

function IsShowcaseWeaponClassified( f1053_arg0, f1053_arg1, f1053_arg2 )
	if IsCACItemContractLocked( f1053_arg1, f1053_arg2 ) then
		return true
	else
		return IsSelfModelValueTrue( f1053_arg1, f1053_arg2, "isBMClassified" )
	end
end

function IsSpecialContractTimerActive( f1054_arg0, f1054_arg1, f1054_arg2 )
	local f1054_local0 = ""
	local f1054_local1 = f1054_arg1:getModel( f1054_arg2, "activeDvar" )
	if f1054_local1 then
		f1054_local0 = Engine.GetModelValue( f1054_local1 )
	end
	local f1054_local2
	if f1054_local0 ~= "" then
		f1054_local2 = Engine.DvarBool( nil, f1054_local0 )
	else
		f1054_local2 = false
	end
	return f1054_local2
end

function IsSpecialContractHidden( f1055_arg0, f1055_arg1, f1055_arg2 )
	if IsSelfModelValueTrue( f1055_arg1, f1055_arg2, "isComplete" ) or IsControllerModelValueEqualToSelfModelValue( f1055_arg1, f1055_arg2, "CurrentSpecialContract.index", "index" ) then
		return false
	else
		return IsSpecialContractTimerActive( f1055_arg0, f1055_arg1, f1055_arg2 )
	end
end

