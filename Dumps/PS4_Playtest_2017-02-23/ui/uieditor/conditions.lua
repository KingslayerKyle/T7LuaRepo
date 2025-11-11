require( "ui.uieditor.conditions_helper" )

function AlwaysFalse()
	return false
end

function AlwaysTrue()
	return true
end

function TestCondition()
	return true
end

function ConditionWithArguments( menu, element, event, arg1, expressionArg, booleanArg, menuName, enumValue )
	return true
end

function IsVisibilityBitSet( controller, enumValue )
	if Engine.IsVisibilityBitSet( controller, enumValue ) then
		return true
	else
		return false
	end
end

function MediaManagerIsBuyMoreSlot()
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local myModel = Engine.CreateModel( rootModel, "isBuyMoreSlot", false )
	local v = Engine.GetModelValue( myModel )
	if v == nil then
		return false
	else
		return v
	end
end

function IsMediaManager()
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local model = Engine.GetModel( rootModel, "isMediaManager" )
	if model then
		return Engine.GetModelValue( model ) == 1
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

function MediaManagerSlotsUsed( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local slotsUsedModel = Engine.CreateModel( rootModel, "slotsUsed", false )
	local slotsUsed = Engine.GetModelValue( slotsUsedModel )
	return (slotsUsed or 0) > 0
end

function FileshareIsDeleting()
	local deleteTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetDeletingModel() )
	if deleteTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsDeletingInError()
	local deleteTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetDeletingModel() )
	if deleteTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsPublishing()
	local publishTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() )
	if publishTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsPublishingInError()
	local publishTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() )
	if publishTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsPublishingInSuccess()
	local publishTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() )
	if publishTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_DONE then
		return true
	else
		return false
	end
end

function FileshareIsUploading()
	local uploadTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetUploadingModel() )
	if uploadTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsUploadingInError()
	local uploadTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetUploadingModel() )
	if uploadTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsUploadingInSuccess()
	local uploadTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetUploadingModel() )
	if uploadTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_DONE then
		return true
	else
		return false
	end
end

function FileshareIsDownloading()
	local downloadTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetDownloadingModel() )
	if downloadTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsDownloadingInError()
	local downloadTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetDownloadingModel() )
	if downloadTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsDownloadingInSuccess()
	local downloadTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetDownloadingModel() )
	if downloadTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_DONE then
		return true
	else
		return false
	end
end

function FileshareIsSteamAgreed()
	return CoD.SteamWorkshopUtility.GetPublishSteamAgreement()
end

function FilesharePublishToSteamDisabled( controller )
	local f22_local0
	if FileshareIsSteamAgreed() then
		f22_local0 = not FileshareIsReady( controller )
	else
		f22_local0 = true
	end
	return f22_local0
end

function FileshareShouldAllowDownload()
	local shouldAllowDownload = CoD.FileshareUtility.GetPublishAllowDownload()
	return shouldAllowDownload
end

function FileshareIsReady( controller )
	local isReady = CoD.FileshareUtility.IsFileshareReady( controller )
	if isReady == 0 then
		return false
	else
		return isReady == 1
	end
end

function FileshareHasContent( element, controller )
	local isReady = FileshareIsReady( controller )
	if isReady and isReady == true then
		local contentCount = CoD.FileshareUtility.GetItemsCount()
		if contentCount == 0 then
			return false
		else
			return true
		end
	else
		return false
	end
end

function FileshareIsQuotaLineDim( self, controller )
	local isDimModel = self:getModel( controller, "isDim" )
	local isDim = Engine.GetModelValue( isDimModel )
	return isDim
end

function FileshareIsMenuOccludedBy( self, controller, menu )
	return menu.occludedBy ~= nil
end

function FileshareIsCommunityMode( element, controller )
	return CoD.FileshareUtility.GetIsCommunityMode( controller )
end

function FileshareShowNormalSizeIcons( element, controller )
	local rootModel = CoD.FileshareUtility.GetRootModel()
	local myModel = Engine.CreateModel( rootModel, "isNormalSize", false )
	local v = Engine.GetModelValue( myModel )
	if v == nil then
		return true
	else
		return v
	end
end

function FileshareShowcaseIsPublishMode( element, controller )
	return FileshareGetShowcasePublishMode( controller ) == true
end

function IsFileshareCategoryFilm( self, element, controller )
	return CoD.FileshareUtility.IsCategoryFilm( controller, element )
end

function IsFileshareCategoryClip( self, element, controller )
	return CoD.FileshareUtility.IsCategoryClip( controller, element )
end

function FilesshareCanShowVoteOptions( controller )
	local authorXuid = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	if authorXuid == Engine.GetXUID64( controller ) then
		return false
	else
		return true
	end
end

function FileshareCanDownloadItem( controller )
	if CoD.FileshareUtility.CanDownload( controller ) == false then
		return false
	else
		return CoD.FileshareUtility.SelectedItemReady()
	end
end

function FileshareCanPublish( controller )
	if not isFileshareFeatureEnabled() or IsUserContentRestricted( controller ) then
		return false
	else
		return true
	end
end

function FileshareCanDeleteItem( controller )
	if CoD.FileshareUtility.GetIsCommunityMode( controller ) then
		return false
	elseif FileshareIsCurrentUserContext( controller ) then
		return true
	else
		return false
	end
end

function FileshareIsLocalCategory( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local f37_local0
	if category ~= "screenshot_private" and category ~= "clip_private" then
		f37_local0 = false
	else
		f37_local0 = true
	end
	return f37_local0
end

function FileshareCanEditNameAndDescription( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if FileshareIsLocalCategory( controller ) or category == "clip" or category == "screenshot" or category == "customgame" then
		return false
	else
		return true
	end
end

function FileshareCanPublishItem( self, element, controller )
	local publishEnabled = true
	local elementModel = element:getModel()
	if not elementModel then
		return false
	end
	local readOnlyModel = Engine.GetModel( elementModel, "readOnly" )
	if readOnlyModel then
		local readOnlyValue = Engine.GetModelValue( readOnlyModel )
		if readOnlyValue and readOnlyValue == 1 then
			publishEnabled = false
		end
	end
	return publishEnabled
end

function FileshareCanShowShowcaseManager( controller )
	if CoD.FileshareUtility.GetIsFullscreenMode( controller ) == true then
		return false
	elseif CoD.FileshareUtility.GetIsCommunityMode( controller ) then
		return false
	elseif FileshareHasContent( nil, controller ) == false then
		return false
	elseif FileshareIsLocalCategory( controller ) then
		return false
	elseif FileshareIsCurrentUserContext( controller ) then
		return true
	else
		return false
	end
end

function FileshareCanShowOptionsMenu( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "recentgames" then
		return false
	elseif FileshareHasContent( nil, controller ) == false then
		return false
	elseif FileshareIsReady( controller ) == false then
		return false
	else
		return true
	end
end

function FileshareCanShowDownloadsStats( controller )
	return CoD.FileshareUtility.CanDownload( controller )
end

function FileshareCanOpenDetailsView( element, controller )
	if FileshareHasContent( nil, controller ) == false then
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

function FileshareIsCurrentUserContext( controller )
	local xuid = Engine.GetXUID64( controller )
	if xuid == CoD.FileshareUtility.GetCurrentUser() then
		return true
	else
		return false
	end
end

function IsRecentGameBookmarked( controller )
	local currentStats = CoD.GetPlayerStats( controller )
	local aarStats = currentStats.AfterActionReportStats
	local demoFileID = aarStats.demoFileID:get()
	if demoFileID ~= nil and demoFileID ~= "0" then
		return Engine.IsRecentGameBookmarked( controller, demoFileID )
	else
		return true
	end
end

function FileshareCanShowPlayerDetails( controller )
	if CoD.FileshareUtility.GetIsCommunityMode( controller ) then
		return true
	else
		return false
	end
end

function FileshareCanReportPlayer( controller )
	if FileshareIsCurrentUserContext( controller ) then
		return false
	else
		return true
	end
end

function FileshareShowcaseSlotsAvailable( controller )
	local quota = CoD.FileshareUtility.GetCurrentQuota( controller )
	if quota and quota.categorySlotsAvailable then
		return quota.categorySlotsAvailable > 0
	else
		return false
	end
end

function MediaManagerSlotsAvailable( controller, category )
	local quota = Engine.MediaManagerGetQuota( controller, category )
	if quota and quota.categorySlotsAvailable then
		return quota.categorySlotsAvailable > 0
	else
		return false
	end
end

function FileshareIsReadyToUpload( controller )
	if not FileshareIsReady( controller ) or FileshareIsUploading() then
		return false
	else
		return true
	end
end

function FileshareIsReadyToPublish( controller )
	if not FileshareIsReady( controller ) or FileshareIsPublishing() or not Engine.FileshareIsReady( controller ) then
		return false
	else
		return true
	end
end

function FileshareIsCategory( controller, stringArg )
	return CoD.FileshareUtility.GetCurrentCategory() == stringArg
end

function FileshareCanBuyMoreSlots( controller )
	if DoesPlayerHaveExtraSlotsItem( controller ) then
		return false
	else
		return AreCodPointsEnabled( controller )
	end
end

function IsInFileshare( controller )
	if CoD.perController[controller].inFileshare then
		return CoD.perController[controller].inFileshare == true
	else
		return false
	end
end

function FileshareIsCustomGame( controller )
	return CoD.FileshareUtility.GetCurrentCategory() == "customgame"
end

function IsTu1Build()
	if Dvar.tu1_build and Dvar.tu1_build:get() == true then
		return true
	else
		return false
	end
end

function FileshareIsDetailsViewHiddenMode( controller )
	return FileshareGetDetailsHiddenMode( controller )
end

function FileshareDetailsViewCanMoveToNext( controller )
	local codeIndex = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
	local totalItems = CoD.FileshareUtility.GetItemsCount()
	if codeIndex and codeIndex ~= totalItems - 1 then
		return true
	else
		return false
	end
end

function FileshareDetailsViewCanMoveToPrevious( controller )
	local codeIndex = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
	if codeIndex and codeIndex ~= 0 then
		return true
	else
		return false
	end
end

function OfficialCustomGamesEnabled()
	return true
end

function IsCustomGameCommunityOption()
	local customGamesRoot = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local communityOption = Engine.GetModelValue( Engine.CreateModel( customGamesRoot, "communityOption" ) )
	local f62_local0
	if communityOption == nil or communityOption == false then
		f62_local0 = false
	else
		f62_local0 = true
	end
	return f62_local0
end

function IsInCustomGames()
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	return Engine.GetModelValue( Engine.CreateModel( root, "inCustomGames" ) ) == 1
end

function CustomGamesCanDelete( element, controller )
	local elementModel = element:getModel()
	local isOfficial = Engine.GetModelValue( elementModel, "isOfficial" )
	if isOfficial then
		return false
	else
		return true
	end
end

function CustomGamesCanPublish( element, controller )
	local elementModel = element:getModel()
	local isOfficial = Engine.GetModelValue( elementModel, "isOfficial" )
	if isOfficial then
		return false
	else
		return true
	end
end

function CustomGamesSlotsAvailable( element, controller )
	local quota = Engine.MediaManagerGetQuota( controller, "customgame" )
	return quota.categorySlotsAvailable > 0
end

function ShouldOpenMessageDialog( self, controller )
	if self:getParent() == nil then
		return 
	end
	local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if messageDialogModel ~= nil then
		if IsInGame() then
			local controllerModel = Engine.GetModel( messageDialogModel, "controller" )
			if controllerModel ~= nil and Engine.GetModelValue( controllerModel ) ~= controller then
				return false
			end
		end
		local messagePendingModel = Engine.GetModel( messageDialogModel, "messagePending" )
		if messagePendingModel ~= nil and Engine.GetModelValue( messagePendingModel ) > 0 then
			return true
		end
	end
	return false
end

function IsLuaCodeVersionAtLeast( expressionArg )
	return expressionArg <= Engine.GetLuaCodeVersion()
end

function IsInDefaultState( element )
	return element.currentState == "DefaultState"
end

function IsInDefaultStateOrStateNotSet( element )
	if not element.currentState then
		return true
	else
		return element.currentState == "DefaultState"
	end
end

function IsElementInState( element, stateName )
	return element.currentState == stateName
end

function IsElementInAnyState( element, ... )
	local vargs = {
		n = select( "#", ... ),
		...
	}
	for _, state in ipairs( vargs ) do
		if state == element.currentState then
			return true
		end
	end
	return false
end

function IsSiblingElementInState( menu, elementName, stateName )
	return menu[elementName].currentState == stateName
end

function IsChildElementInState( self, elementName, stateName )
	return self[elementName].currentState == stateName
end

function IsMenuInState( menu, stateName )
	return menu.currentState == stateName
end

function IsMenuModelValueEqualTo( menu, modelName, expressionArg )
	local model = menu:getModel()
	if modelName ~= "" and model then
		model = Engine.GetModel( model, modelName )
	end
	local f76_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f76_local1 = f76_local0 and modelValue
	local f76_local2
	if f76_local1 == nil or f76_local1 ~= expressionArg then
		f76_local2 = false
	else
		f76_local2 = true
	end
	return f76_local2
end

function IsSelfInState( self, stateName )
	return self.currentState == stateName
end

function ShouldSwapCircleAndCross()
	return Engine.ShouldSwapControllerCircleAndCross()
end

function IsWidthZero( expr_width )
	return expr_width == 0
end

function InSafehouseOrFrontend()
	local f80_local0 = CoD.isSafehouse
	if not f80_local0 then
		f80_local0 = CoD.isFrontend
	end
	return f80_local0
end

function InFrontend()
	return CoD.isFrontend
end

function InSafehouse()
	return CoD.isSafehouse
end

function IsFirstListElement( element )
	return element:isFirstItem()
end

function IsLastListElement( element )
	return element:isLastItem()
end

function IsListAtStart( self, listElementName, event )
	local listElement = self[listElementName]
	if listElement and listElement.activeWidget and (not event or not event.list or event.list == listElement) then
		return listElement.activeWidget:isFirstItem()
	else
		return false
	end
end

function IsListAtEnd( self, listElementName, event )
	local listElement = self[listElementName]
	if listElement and listElement.activeWidget and (not event or not event.list or event.list == listElement) then
		return listElement.activeWidget:isLastItem()
	else
		return false
	end
end

function ListElementHasElements( self, listElementName )
	local listElement = self[listElementName]
	if listElement then
		local dataSource = listElement:getDataSource()
		if dataSource then
			local itemCount = dataSource.getCount( listElement )
			return itemCount > 0
		end
	end
	return false
end

function ListElementHasDataSource( self, listElementName )
	local listElement = self[listElementName]
	if listElement then
		return listElement:getDataSource() ~= nil
	else
		return false
	end
end

function ListLoopEdgesEnabled( self, listElementName )
	local listElement = self[listElementName]
	if listElement then
		return listElement.loopEdges
	else
		return false
	end
end

function HasListAction( element, controller )
	local actionModel = element:getModel( controller, "action" )
	return actionModel or element.action
end

function IsElementInFocus( element )
	return element:isInFocus()
end

function isClientListSlideFocus( self, focusableElementName, event, controller )
	if not CoD.isPC then
		return IsWidgetInFocus( self, focusableElementName, event )
	elseif self.defaultNav and self.defaultNav == "right" and IsWidgetInFocus( self, focusableElementName, event ) then
		return true
	end
	return IsGamepad( controller ) and IsWidgetInFocus( self, focusableElementName, event )
end

function IsWidgetInFocus( self, focusableElementName, event )
	if self[focusableElementName] then
		if event.idStack then
			local elementId = self[focusableElementName].id
			for _, id in ipairs( event.idStack ) do
				if id == elementId then
					return true
				end
			end
			return false
		elseif event.id then
			return self[focusableElementName]:hasChildWithID( event.id )
		else
			return self[focusableElementName]:doesElementOrChildHaveFocus()
		end
	else
		return false
	end
end

function IsFirstTimeSetup( controller, enumValue )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	elseif not (not Engine.IsMultiplayerGame() or not IsLAN()) or Engine.IsInGame() then
		return false
	else
		return not Engine.IsFirstTimeComplete( controller, enumValue )
	end
end

function IsMainFirstTimeSetup( controller )
	return CoDShared.IsMainFirstTimeSetup( controller )
end

function TestAndSetFirstTimeMenu( controller, flagName )
	if Engine.GetProfileVarInt( controller, flagName ) == 0 then
		SetProfileVar( controller, flagName, 1 )
		return true
	else
		
	end
end

function GrayOutReplayMissionButton( controller )
	return false
end

function GrayOutMissionOverviewButton( controller )
	local currentMission = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
	if not currentMission or currentMission == "" then
		return true
	else
		
	end
end

function IsBooleanDvarSet( dvarName )
	if Dvar[dvarName] then
		return Dvar[dvarName]:get() == true
	else
		return false
	end
end

function IsIntDvarNonZero( dvarName )
	return CoDShared.IsIntDvarNonZero( dvarName )
end

function IsDvarValueEqualTo( dvarName, expressionArg )
	if Dvar[dvarName] then
		return Dvar[dvarName]:get() == expressionArg
	else
		
	end
end

function IsInGame()
	return CoDShared.IsInGame()
end

function GameEnded( controller )
	return IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
end

function IsCurrentMenu( menu, menuNameArg )
	if menu.menuName == menuNameArg then
		return true
	else
		return false
	end
end

function PropertyIsTrue( self, propertyName )
	if self == nil then
		return false
	else
		return self[propertyName] == true
	end
end

function IsSelfPropertyValue( self, propertyName, expressionArg )
	return self and self[propertyName] == expressionArg
end

function IsElementPropertyValue( element, propertyName, expressionArg )
	if element == nil then
		return false
	else
		return element[propertyName] == expressionArg
	end
end

function IsElementPropertyEnumValue( element, propertyName, enumValue )
	if element == nil then
		return false
	else
		return element[propertyName] == enumValue
	end
end

function HasProperty( element, propertyName )
	if element == nil then
		return false
	else
		return element[propertyName] ~= nil
	end
end

function HasParent( element )
	local f110_local0 = element
	local parent = element:getParent()
	return (f110_local0 and parent) ~= nil
end

function ParentPropertyIsTrue( element, propertyName )
	local f111_local0 = element
	local parent = element:getParent()
	local f111_local1 = f111_local0 and parent
	return f111_local1 and f111_local1[propertyName] == true
end

function ParentObjectivePropertyIsTrue( element, propertyName )
	return f112_local1.objective and f112_local2 and f112_local1.objective[propertyName] == true
end

function IsPerControllerTablePropertyValue( controller, propertyName, expressionArg )
	return CoD.perController[controller][propertyName] == expressionArg
end

function IsPerControllerTablePropertyEnumValue( controller, propertyName, enumValue )
	return CoD.perController[controller][propertyName] == enumValue
end

function IsPerControllerTablePropertyEitherEnumValue( controller, propertyName, enumValue1, enumValue2 )
	local f115_local0
	if CoD.perController[controller][propertyName] ~= enumValue1 and CoD.perController[controller][propertyName] ~= enumValue2 then
		f115_local0 = false
	else
		f115_local0 = true
	end
	return f115_local0
end

function IsActiveLocalClientsCountEqualTo( expressionArg )
	return Engine.GetActiveLocalClientsCount() == expressionArg
end

function IsTextWrapping( self, element )
	if element == nil then
		return false
	else
		local _, _, left, right = element:getLocalLeftRight()
		local width = right - left
		local textWidth, _ = element:getTextWidthAndHeight()
		return width < textWidth
	end
end

local emptyLoc = Engine.Localize( "" )
function IsTextEmpty( element )
	local f118_local0
	if element:getText() ~= "" and element:getText() ~= emptyLoc then
		f118_local0 = false
	else
		f118_local0 = true
	end
	return f118_local0
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

function IsAttackingTeam( controller )
	local team = CoD.TeamUtility.GetTeam( controller )
	local gametype = Dvar.ui_gametype:get()
	local f123_local0 = Engine.GetGlobalModel()
	local hudItemsModel = f123_local0.hudItems
	if hudItemsModel ~= nil and IsGametypeNewStyle() then
		local gameTypeModel = hudItemsModel.war
		if gameTypeModel ~= nil then
			local attackingTeamModel = gameTypeModel.attackingTeam
			if attackingTeamModel ~= nil then
				return team == attackingTeamModel:get()
			end
		end
	end
	return false
end

function IsNeutralGametype( controller )
	if Engine.GetGametypeSetting( "neutralZone" ) == 1 then
		return true
	else
		return false
	end
end

function IsObjectiveBasedGametype()
	local gameType = Engine.GetCurrentGameType()
	local f125_local0
	if gameType == "tdm" or gameType == "dm" then
		f125_local0 = false
	else
		f125_local0 = true
	end
	return f125_local0
end

function IsGroupsEnabled()
	local groupsEnabled = Dvar.groups_enabled:get()
	if groupsEnabled ~= nil and groupsEnabled == true then
		return true
	else
		return false
	end
end

function SelectingGroupEmblem( controller )
	return CoD.perController[controller].selectingGroupEmblem
end

function SelectingGroupEmblemForGroupCreation( controller )
	return CoD.perController[controller].selectingGroupEmblemForGroupCreation
end

function IsReadyUpVisible( element, controller )
	local f129_local0 = IsGlobalModelValueEqualTo
	local f129_local1 = element
	local f129_local2 = controller
	local f129_local3 = "lobbyRoot.lobbyNav"
	local f129_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
	if not f129_local0( f129_local1, f129_local2, f129_local3, f129_local4.id ) then
		f129_local0 = IsGlobalModelValueEqualTo
		f129_local1 = element
		f129_local2 = controller
		f129_local3 = "lobbyRoot.lobbyNav"
		f129_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
		if f129_local0( f129_local1, f129_local2, f129_local3, f129_local4.id ) then
		
		else
			return false
		end
	end
	if Dvar.lobby_readyUpPercentRequired:get() > 0 then
		return true
	end
	return false
end

function ShouldOpenGroupOptionsPopup( element, controller )
	local controllerModel = Engine.GetModelForController( controller )
	local groupHeadquartersTabNameModel = Engine.GetModel( controllerModel, "groups.grouphqtabname" )
	local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
	local controllerXuid = Engine.GetXUID64( controller )
	local f130_local0 = selectedXuid == controllerXuid
	if groupHeadquartersTabNameModel then
		local currTab = Engine.GetModelValue( groupHeadquartersTabNameModel )
		if not (currTab ~= "overview" or IsGroupOwner( nil, controller )) or currTab == "roster" and IsGroupOwner( nil, controller ) and not f130_local0 then
			return true
		end
	end
end

function DoesHaveAdminRightsForGroup( element, controller )
	local f131_local0 = IsGroupOwner( element, controller )
	if not f131_local0 then
		f131_local0 = IsGroupAdmin( element, controller )
	end
	return f131_local0
end

function IsGroupMember( element, controller )
	local memberStatus = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_NONE
	if CoD.perController[controller].selectedGroup then
		memberStatus = Engine.GetSelectedGroupMemberStatus( Engine.GetXUID64( controller ) )
	end
	local f132_local0
	if memberStatus ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_MEMBER and memberStatus ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN and memberStatus ~= Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER then
		f132_local0 = false
	else
		f132_local0 = true
	end
	return f132_local0
end

function IsGroupAdmin( element, controller )
	local memberStatus = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_NONE
	if CoD.perController[controller].selectedGroup then
		memberStatus = Engine.GetSelectedGroupMemberStatus( Engine.GetXUID64( controller ) )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN
end

function IsGroupOwner( element, controller )
	local memberStatus = Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_NONE
	if CoD.perController[controller].selectedGroup then
		memberStatus = Engine.GetSelectedGroupMemberStatus( Engine.GetXUID64( controller ) )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER
end

function IsGroupListHeader( element )
	return element.type == "header"
end

function DoesGroupListHaveSelectedIcon( element )
	local f136_local0
	if element.showSelectedIcon == nil or element.showSelectedIcon ~= true then
		f136_local0 = false
	else
		f136_local0 = true
	end
	return f136_local0
end

function IsProcessingGroupTask( controller )
	local processingGroupTaskModel = GetProcessingGroupTaskModel( controller )
	local isProcessing = Engine.GetModelValue( processingGroupTaskModel )
	local f137_local0
	if isProcessing == nil or isProcessing ~= true then
		f137_local0 = false
	else
		f137_local0 = true
	end
	return f137_local0
end

function IsGroupEmblemEmpty( element, controller )
	local groupIdModel = nil
	if CoD.perController[controller].selectedGroup then
		groupIdModel = Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" )
	else
		groupIdModel = element:getModel( controller, "groupId" )
	end
	if groupIdModel ~= nil then
		local groupId = Engine.GetModelValue( groupIdModel )
		if groupId ~= nil then
			return Engine.IsGroupEmblemEmpty( controller, groupId )
		end
	end
	return true
end

function HasSelectedGroup( element, controller )
	local groupIdModel = nil
	if element ~= nil then
		if CoD.perController[controller].selectedGroup then
			groupIdModel = Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" )
		end
		if groupIdModel ~= nil then
			local groupId = Engine.GetModelValue( groupIdModel )
			if groupId ~= nil and groupId ~= 0 then
				return true
			end
		end
	end
	return false
end

function HasPendingInvites( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupInviteCountModel = Engine.CreateModel( groupsModel, "inviteCount" )
	local inviteCount = Engine.GetModelValue( groupInviteCountModel )
	local f140_local0
	if inviteCount == nil or inviteCount <= 0 then
		f140_local0 = false
	else
		f140_local0 = true
	end
	return f140_local0
end

function IsMemberOfAnyGroup( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupCountModel = Engine.CreateModel( groupsModel, "groupCount_self" )
	local groupCount = Engine.GetModelValue( groupCountModel )
	local f141_local0
	if groupCount == nil or groupCount <= 0 then
		f141_local0 = false
	else
		f141_local0 = true
	end
	return f141_local0
end

function IsGroupHeadquartersTabSelected( controller, tabId )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local selectedGroupHeadquarterTabNameModel = Engine.CreateModel( groupsModel, "grouphqtabname" )
	local tabName = Engine.GetModelValue( selectedGroupHeadquarterTabNameModel )
	if tabName ~= nil and tabName == tabId then
		return true
	else
		return false
	end
end

function IsGroupLeaderboardInitialized()
	local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
	local f143_local0
	if isInitialized == nil or isInitialized ~= true then
		f143_local0 = false
	else
		f143_local0 = true
	end
	return f143_local0
end

function IsGroupLeaderboardAvailable()
	local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
	local f144_local0
	if isInitialized == nil or isInitialized ~= true or leaderboardIndex == nil or leaderboardIndex <= 0 then
		f144_local0 = false
	else
		f144_local0 = true
	end
	return f144_local0
end

function IsLeaderboardUpdating()
	local rowsBaseModel = DataSources.LeaderboardRows.getModel()
	local status = CoD.SafeGetModelValue( rowsBaseModel, "status" )
	return status == Enum.FetchListState.FETCH_LIST_STATE_FETCHING
end

function IsLeaderboardEmpty()
	return DataSources.LeaderboardRows.getCount() == 0
end

function IsGroupLeaderboardMakerState( controller, checkState )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local leaderboardMakerModel = Engine.CreateModel( groupsModel, "leaderboardmaker" )
	local leaderboardMakerState = Engine.CreateModel( leaderboardMakerModel, "state" )
	local state = Engine.GetModelValue( leaderboardMakerState )
	return state == checkState
end

function IsLobbyLeaderboard( controller )
	return CoD.perController[controller].isInLobbyLeaderboard == true
end

function IsFreerunLeaderboard( controller )
	local categoryNameModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not categoryNameModel then
		return false
	else
		local categoryName = Engine.GetModelValue( categoryNameModel )
		return categoryName == "freerun"
	end
end

function IsZMGlobalsLeaderboard( controller )
	local categoryNameModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not categoryNameModel then
		return false
	else
		local categoryName = Engine.GetModelValue( categoryNameModel )
		return categoryName == "zm_global"
	end
end

function IsZMMapsLeaderboard( controller )
	local categoryNameModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not categoryNameModel then
		return false
	else
		local categoryName = Engine.GetModelValue( categoryNameModel )
		return categoryName == "zm_maps"
	end
end

function IsDOALeaderboard( controller )
	local categoryNameModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not categoryNameModel then
		return false
	else
		local categoryName = Engine.GetModelValue( categoryNameModel )
		return categoryName == "doa"
	end
end

function IsMPGameModeLeaderboard( controller )
	local leaderboardDefModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
	if not leaderboardDefModel then
		return false
	else
		local leaderboardDef = Engine.GetModelValue( leaderboardDefModel )
		return string.sub( leaderboardDef, 1, string.len( "LB_MP_GM_" ) ) == "LB_MP_GM_"
	end
end

function IsPlayerAGuest( controller )
	return Engine.IsUserGuest( controller )
end

function IsPlayerAllowedToViewMatureContent( controller )
	return Engine.IsContentRatingAllowed( controller )
end

function IsPlayerAllowedToPlayOnline( controller )
	if Engine.IsPlusAuthorized( controller ) == false then
		return false
	else
		return true
	end
end

function IsOutOfBounds( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local oobEndTime = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.outOfBoundsEndTime" ) )
	local currentGameTime = Engine.CurrentGameTime()
	if currentGameTime == nil then
		return false
	elseif oobEndTime == nil then
		return false
	else
		local displayTop3Players = CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "displayTop3Players" )
		if displayTop3Players == 1 then
			return false
		else
			return currentGameTime < oobEndTime
		end
	end
end

function IsEnemyDetected( controller, direction, distance )
	local perControllerModel = Engine.GetModelForController( controller )
	local sixthsenseValue = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.sixthsense" ) )
	local mask = 0
	if sixthsenseValue == nil then
		return false
	elseif distance == nil or distance == "" then
		distance = "far"
	end
	local offset = 1
	if distance == "close" then
		offset = 16
	end
	if direction == "front" then
		mask = offset << 0
	elseif direction == "back" then
		mask = offset << 1
	elseif direction == "left" then
		mask = offset << 2
	elseif direction == "right" then
		mask = offset << 3
	end
	return sixthsenseValue & mask ~= 0
end

function AreAllItemsInGroupLocked( controller, stringArg )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	for itemIndex = 0, 255, 1 do
		local itemGroup = Engine.GetItemGroup( itemIndex )
		if itemGroup == stringArg and not Engine.IsItemLocked( controller, itemIndex ) then
			return false
		end
	end
	return true
end

function AreAllSecondaryItemsLocked( controller )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	for itemIndex = 0, 255, 1 do
		local itemGroup = Engine.GetItemGroup( itemIndex )
		if (itemGroup == "weapon_pistol" or itemGroup == "weapon_launcher" or itemGroup == "weapon_knife") and not Engine.IsItemLocked( controller, itemIndex ) then
			return false
		end
	end
	return true
end

function HidePersonalizePrompt( controller )
	local f161_local0
	if not CoD.isPC or IsGamepad( controller ) then
		f161_local0 = Dvar.ui_execdemo_gamescom:get()
	else
		f161_local0 = true
	end
	return f161_local0
end

function IsCACLockedForEveryone()
	return Engine.IsItemLockedForAll( "FEATURE_CREATE_A_CLASS" )
end

function CACShowSelectPrompt( self, element, controller )
	local elementModel = element:getModel()
	local f163_local0 = elementModel
	local slotModel = Engine.GetModel( elementModel, "weaponSlot" )
	local f163_local1 = f163_local0 and slotModel
	local f163_local2 = f163_local1
	local loadoutSlotName = Engine.GetModelValue( f163_local1 )
	local f163_local3 = f163_local2 and loadoutSlotName
	if f163_local3 == nil or controller == nil then
		return false
	else
		local classModel = CoD.perController[controller].classModel
		if not (not LUI.startswith( f163_local3, "primarygadgetattachment" ) or CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) ~= "" or not CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) ~= "") or not (f163_local3 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) ~= "") or not (f163_local3 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) ~= "") or not (f163_local3 ~= "specialty6" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= "") or not (f163_local3 ~= "secondaryattachment3" or CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= "") or not (f163_local3 ~= "primaryattachment4" or CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel ) ~= 0) or not (f163_local3 ~= "primaryattachment5" or CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel ) > 1) or not (f163_local3 ~= "primaryattachment6" or CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel ) > 2) or not (not LUI.startswith( f163_local3, "primaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "primary", controller, classModel )) or not (not LUI.startswith( f163_local3, "secondaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "secondary", controller, classModel ) and CoD.CACUtility.DoesWeaponHaveAnyAttachments( "secondary", controller, classModel )) or LUI.startswith( f163_local3, "secondarygadgetattachment" ) and not CoD.CACUtility.ItemEquippedInSlot( "secondarygadget", controller, classModel ) then
			local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, f163_local3 )
			if availability == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD and not IsElementInState( element, "NotVisible" ) then
				return true
			else
				return false
			end
		else
			return true
		end
	end
end

function CACShowRemovePrompt( self, element )
	local slotModel = element:getModel()
	local f164_local0 = slotModel
	local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
	local f164_local1 = f164_local0 and itemIndexModel
	local f164_local2 = f164_local1
	local itemIndex = Engine.GetModelValue( f164_local1 )
	local f164_local3 = f164_local2 and itemIndex
	if Engine.IsCampaignGame() then
		local f164_local4 = slotModel
		local loadoutSlotModel = Engine.GetModel( slotModel, "weaponSlot" )
		local f164_local5 = f164_local4 and loadoutSlotModel
		local f164_local6 = f164_local5
		local loadoutSlot = Engine.GetModelValue( f164_local5 )
		local f164_local7 = f164_local6 and loadoutSlot
		if f164_local7 == "primary" or f164_local7 == "secondary" then
			return false
		end
	end
	if f164_local3 ~= nil and f164_local3 > CoD.CACUtility.EmptyItemIndex then
		return true
	end
end

function CACShowRotatePrompt( self, element, controller )
	local elementModel = element:getModel()
	local f165_local0 = elementModel
	local slotModel = Engine.GetModel( elementModel, "weaponSlot" )
	local f165_local1 = f165_local0 and slotModel
	local f165_local2 = f165_local1
	local loadoutSlotName = Engine.GetModelValue( f165_local1 )
	local f165_local3 = f165_local2 and loadoutSlotName
	if f165_local3 == nil then
		local f165_local4 = elementModel
		local itemIndexValue = CoD.SafeGetModelValue( elementModel, "itemIndex" )
		local f165_local5 = f165_local4 and itemIndexValue
		local f165_local6
		if f165_local5 == nil or f165_local5 <= 0 then
			f165_local6 = false
		else
			f165_local6 = true
		end
		return f165_local6
	elseif CACShowRemovePrompt( self, element ) then
		return true
	end
	local f165_local5 = CACShowSelectPrompt( self, element, controller )
	if f165_local5 then
		f165_local5 = LUI.startswith( f165_local3, "primaryattachment" )
		if not f165_local5 then
			f165_local5 = LUI.startswith( f165_local3, "secondaryattachment" )
		end
	end
	return f165_local5
end

function IsCACCustomClassCountDefault( controller )
	local customClassCount = Engine.GetCustomClassCount( controller )
	return customClassCount == CoD.CACUtility.defaultCustomClassCount
end

function IsCACClassSetsCountDefault( controller )
	local defaultClassSets = 1
	local classSetsOwned = Engine.GetNumberOfClassSetsOwned( controller )
	return classSetsOwned == defaultClassSets
end

function ShowCACExtraClassBreadcrumb( controller )
	if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) then
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if stats then
			return stats.extraBools[0]:get() == 0
		end
	end
	return false
end

function IsCACSlotOvercapacity2by1AspectRatio( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "itemSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f169_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f169_local0 = false
			else
				f169_local0 = true
			end
			return f169_local0
		end
	end
	return false
end

function IsCACSlotOvercapacityWildcard( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "itemSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			return LUI.startswith( slotName, "bonuscard" )
		end
	end
	return false
end

function IsCACContextualWildcardOpen( controller )
	if CoD.perController[controller].CACWildcardContextualMenu and not IsInPermanentUnlockMenu( controller ) then
		return true
	else
		return false
	end
end

function IsCACUsingOverkill( menu )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsBonusCardEquipped( "bonuscard_overkill", classModel )
	else
		return false
	end
end

function IsCACEquippingSlot( controller, slotName )
	return CoD.perController[controller].weaponCategory == slotName
end

function IsCACCategoryWeapon( controller )
	local f174_local0
	if CoD.perController[controller].weaponCategory ~= "primary" and CoD.perController[controller].weaponCategory ~= "secondary" then
		f174_local0 = false
	else
		f174_local0 = true
	end
	return f174_local0
end

function IsCACSlot2by1AspectRatio( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "weaponSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f175_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f175_local0 = false
			else
				f175_local0 = true
			end
			return f175_local0
		end
	end
	return false
end

function IsCACSlotInfopane2by1AspectRatio( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "weaponSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f176_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f176_local0 = LUI.startswith( slotName, "primaryattachment" )
				if not f176_local0 then
					f176_local0 = LUI.startswith( slotName, "secondaryattachment" )
				end
			else
				f176_local0 = true
			end
			return f176_local0
		end
	end
	return false
end

function IsCACItemBubbleGum( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
			local itemGroup = Engine.GetItemGroup( itemIndex, mode )
			if itemGroup == "bubblegum" or itemGroup == "bubblegum_consumable" then
				return true
			end
		end
	end
	return false
end

function IsCACItemConsumable( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			return CoD.CACUtility.IsItemConsumable( itemIndex )
		end
	end
	return false
end

function DoesCACItemHaveConsumablesRemaining( menu, element, controller )
	if not IsCACItemConsumable( menu, element, controller ) then
		return true
	end
	local elementModel = element:getModel()
	if elementModel then
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			return GetConsumableCountFromIndex( controller, itemIndex ) > 0
		end
	end
	return false
end

function IsCACItemFromDLC( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local dlcIndexModel = Engine.GetModel( elementModel, "dlcIndex" )
		if not dlcIndexModel then
			return false
		else
			return Engine.GetModelValue( dlcIndexModel ) > Enum.dlcIndex_t.CONTENT_DLC0ZM_INDEX
		end
	else
		return false
	end
end

function IsCACItemDLCPurchased( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local dlcIndexModel = Engine.GetModel( elementModel, "dlcIndex" )
		if not dlcIndexModel then
			return false
		else
			local dlcIndex = Engine.GetModelValue( dlcIndexModel )
			if not dlcIndex or dlcIndex < Enum.dlcIndex_t.CONTENT_DLC1_INDEX then
				return true
			else
				return Engine.HasEntitlement( controller, "dlc" .. dlcIndex - Enum.dlcIndex_t.CONTENT_DLC0ZM_INDEX )
			end
		end
	else
		return false
	end
end

function IsCACItemEquipped( menu, element, controller )
	local weaponCategory = CoD.perController[controller].weaponCategory
	weaponCategory = weaponCategory or element.weaponCategory
	if weaponCategory == "bubblegum" or weaponCategory == "bubblegum_consumable" then
		return IsBubbleGumBuffEquipped( menu, element, controller )
	end
	local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( weaponCategory )
	local elementModel = element:getModel()
	if elementModel then
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		local upgradeItemIndexModel = Engine.GetModel( elementModel, "upgradeItemIndex" )
		local indexModel = itemIndexModel
		if upgradeItemIndexModel and IsCACItemUpgraded( menu, element, controller ) then
			indexModel = upgradeItemIndexModel
		end
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for _, slotName in ipairs( searchingSlots ) do
				if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller ) == itemIndex then
					return true
				end
			end
		end
	end
	return false
end

function IsLoadoutEscalationItemEquipped( menu, element, controller )
	local weaponCategory = element.weaponCategory
	if not weaponCategory then
		return false
	end
	local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( weaponCategory )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for _, slotName in ipairs( searchingSlots ) do
				if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller ) == itemIndex then
					return true
				end
			end
		end
	end
	return false
end

function IsBubbleGumType( element, controller, typeName )
	local f184_local0 = element
	local itemIndex = CoD.SafeGetModelValue( element:getModel(), "itemIndex" )
	local f184_local1 = f184_local0 and itemIndex
	if f184_local1 then
		local itemIndexColumn = 0
		local bgbLimitTypeColumn = 20
		local bgbLimitType = Engine.TableLookup( "gamedata/stats/zm/zm_statsTable.csv", bgbLimitTypeColumn, itemIndexColumn, f184_local1 )
		if bgbLimitType then
			return typeName == bgbLimitType
		end
	end
	return false
end

function IsCACWildcardEquipped( menu, element, controller )
	local weaponCategory = CoD.perController[controller].weaponCategory
	local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( weaponCategory )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for _, slotName in ipairs( searchingSlots ) do
				if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller ) == itemIndex then
					return true
				end
			end
		end
	end
	return false
end

function IsCACWeaponEquippedForSlot( menu, element, controller, slotNameArg )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local classModel = menu:getModel()
	if itemIndexModel then
		local weaponIndexModel = Engine.GetModel( classModel, slotNameArg .. ".itemIndex" )
		if weaponIndexModel then
			local weaponIndex = Engine.GetModelValue( weaponIndexModel )
			local attachmentIndex = Engine.GetModelValue( itemIndexModel )
			local attachmentRef = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
			if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
				return true
			end
		end
	end
	return false
end

function IsCACCustomizationReticleAttachmentItemEquipped( menu, element, controller, slotNameArg )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local classModel = menu:getModel()
	if itemIndexModel then
		local weaponIndexModel = Engine.GetModel( classModel, slotNameArg .. ".itemIndex" )
		if weaponIndexModel then
			local weaponIndex = Engine.GetModelValue( weaponIndexModel )
			local attachmentIndex = Engine.GetModelValue( itemIndexModel )
			local attachmentRef = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
			if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
				return CoD.CACUtility.attachmentsWithCustReticle[attachmentRef]
			end
		end
	end
	return false
end

function IsCACCustomizationDWAttachmentItemEquipped( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local weaponSlot = CoD.SafeGetModelValue( element:getModel(), "weaponSlot" )
	local f188_local0 = weaponSlot
	local slotName = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( weaponSlot )
	local f188_local1 = f188_local0 and slotName
	local classModel = menu:getModel()
	if f188_local1 and itemIndexModel then
		local weaponIndexModel = Engine.GetModel( classModel, f188_local1 .. ".itemIndex" )
		if weaponIndexModel then
			local weaponIndex = Engine.GetModelValue( weaponIndexModel )
			local attachmentIndex = Engine.GetModelValue( itemIndexModel )
			local attachmentRef = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
			if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
				return attachmentRef == "dw"
			end
		end
	end
	return false
end

function IsCACWeaponVariantEquipped( menu, self, element, controller )
	if not Gunsmith_IsEnabled( element, controller ) then
		return false
	else
		local classModel = menu:getModel()
		local loadoutSlot = CoD.perController[controller].weaponCategory
		local variantModel = self:getModel()
		local weaponItemIndex = CoD.SafeGetModelValue( variantModel, "weaponItemIndex" )
		local cacVariantIndex = CoD.SafeGetModelValue( variantModel, "cacVariantIndex" )
		return CoD.CACUtility.IsVariantEquippedToClass( classModel, loadoutSlot, weaponItemIndex, cacVariantIndex )
	end
end

function IsCACItemNew( element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( controller, itemIndex, mode )
		end
	end
	return false
end

function IsCACAttachmentNew( menu, element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	local weaponCategory = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local classModel = menu:getModel()
	if itemIndexModel then
		local slotName = "primary"
		if LUI.startswith( weaponCategory, "secondaryattachment" ) then
			slotName = "secondary"
		end
		local weaponIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
		if weaponIndexModel then
			local weaponIndex = Engine.GetModelValue( weaponIndexModel )
			local attachmentIndex = Engine.GetModelValue( itemIndexModel )
			return Engine.IsAttachmentNew( controller, weaponIndex, attachmentIndex )
		end
	end
	return false
end

function IsSpecialistNew( self, element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	local heroIndex = Engine.GetModelValue( self:getModel( controller, "heroIndex" ) )
	local mode = Engine.CurrentSessionMode()
	if heroIndex then
		local itemIndex = Engine.GetLoadoutItemIndexForHero( mode, heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemNew( controller, itemIndex )
		end
	end
	return false
end

function IsCACAnyLoadoutSlotNew( element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local loadoutSlotModel = element:getModel( controller, "weaponSlot" )
		if loadoutSlotModel then
			local loadoutSlot = Engine.GetModelValue( loadoutSlotModel )
			if loadoutSlot == "primarygadget" and CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", CoD.perController[controller].classModel ) then
				return false
			else
				return Engine.IsLoadoutSlotNew( controller, Engine.GetModelValue( loadoutSlotModel ) )
			end
		else
			return false
		end
	end
end

function IsCACSpecificLoadoutSlotNew( element, controller, specificLoadoutName )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local loadoutSlotModel = element:getModel( controller, specificLoadoutName .. ".weaponSlot" )
		if loadoutSlotModel then
			return Engine.IsLoadoutSlotNew( controller, Engine.GetModelValue( loadoutSlotModel ) )
		else
			return false
		end
	end
end

function ShouldDisplayWeaponGroupBreadcrumbCount( self, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	elseif IsInPermanentUnlockMenu( controller ) then
		return false
	else
		local breadcrumbWeaponGroupTabModel = self:getModel( controller, "breadcrumbCount" )
		if breadcrumbWeaponGroupTabModel then
			local breadcrumbCount = Engine.GetModelValue( breadcrumbWeaponGroupTabModel )
			return breadcrumbCount > 0
		else
			return false
		end
	end
end

function IsCACAnyOpticsNew( element, controller, specificLoadoutName )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local itemIndexModel = element:getModel( controller, specificLoadoutName .. ".itemindex" )
		if itemIndexModel then
			return Engine.AreAnyOpticsNew( controller, Engine.GetModelValue( itemIndexModel ) )
		else
			return false
		end
	end
end

function IsCACAnyAttachmentsNew( element, controller, specificLoadoutName )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local itemIndexModel = element:getModel( controller, specificLoadoutName .. ".itemindex" )
		if itemIndexModel then
			return Engine.AreAnyNonOpticAttachmentsNew( controller, Engine.GetModelValue( itemIndexModel ) )
		else
			return false
		end
	end
end

function IsCACAnythingInCACItemNew( controller )
	if IsProgressionEnabled( controller ) and Engine.IsAnythingInCACNew( controller ) then
		return true
	elseif ShowCACExtraClassBreadcrumb( controller ) then
		return true
	else
		return false
	end
end

function IsCACAnyScorestreaksNew( controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		return Engine.WeaponGroupHasNewItem( controller, "killstreak" )
	end
end

function IsCACAnySpecialistsNew( controller )
	if IsProgressionEnabled( controller ) then
		if Engine.IsLoadoutSlotNew( controller, "herogadget" ) or Engine.IsLoadoutSlotNew( controller, "heroweapon" ) then
			return true
		elseif Engine.AreAnyCharacterCustomizationItemsNew( controller ) then
			return true
		end
		local mode = Engine.CurrentSessionMode()
		local heroList = Engine.GetHeroList( mode )
		for _, hero in ipairs( heroList ) do
			local heroIndex = hero.bodyIndex
			local heroData = Engine.GetHeroBundleInfo( mode, heroIndex )
			local gesturesAndTauntsNewCount = CoD.PlayerRoleUtility.GetTauntsAndGesturesNewCount( controller, heroIndex, heroData, mode )
			if gesturesAndTauntsNewCount > 0 then
				return true
			end
			local transmissionsNewCount = CoD.PlayerRoleUtility.GetTransmissionNewCount( controller, heroIndex, heroData )
			if transmissionsNewCount > 0 then
				return true
			end
		end
	end
	return false
end

function IsCACAnyPersonalizationOptionNew( menu, self, element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	elseif menu.menuName ~= "CustomClass" then
		return false
	end
	local cacWidgetModel = self:getModel()
	if cacWidgetModel then
		local weaponSlotName = CoD.SafeGetModelValue( cacWidgetModel, "weaponSlot" )
		local itemIndex = CoD.SafeGetModelValue( cacWidgetModel, "itemIndex" )
		local attachmentTableIndex = CoD.SafeGetModelValue( cacWidgetModel, "attachmentIndex" )
		local weaponIndexForAttachment = CoD.SafeGetModelValue( cacWidgetModel, "weaponIndex" )
		if weaponSlotName then
			if itemIndex and itemIndex > CoD.CACUtility.EmptyItemIndex and (weaponSlotName == "primary" or weaponSlotName == "secondary") then
				return Engine.IsWeaponOptionGroupNew( controller, itemIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
			elseif attachmentTableIndex and attachmentTableIndex > CoD.CACUtility.EmptyItemIndex and (weaponSlotName == "primaryattachment1" or weaponSlotName == "secondaryattachment1") then
				return Engine.IsWeaponOptionGroupNew( controller, attachmentTableIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE )
			elseif itemIndex and itemIndex > CoD.CACUtility.EmptyItemIndex and (LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" )) then
				local mode = Engine.CurrentSessionMode()
				return Engine.IsAnyACVItemNew( controller, weaponIndexForAttachment, attachmentTableIndex, mode )
			end
		end
	end
	return false
end

function IsCACAnyCamoNew( self, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	elseif self.isCamo == true and self.weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		return Engine.IsWeaponOptionGroupNew( controller, self.weaponItemIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
	else
		return false
	end
end

function IsCACAnyBubblegumNew( controller )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	local f203_local0 = Engine.WeaponGroupHasNewItem( controller, "bubblegum" )
	if not f203_local0 then
		f203_local0 = Engine.WeaponGroupHasNewItem( controller, "bubblegum_consumable" )
	end
	return f203_local0
end

function CheckMegaChewFactoryShowBreadcrumb( controller )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	return stats.showMegaChewFactoryBreadcrumb and f204_local0 and stats.showMegaChewFactoryBreadcrumb:get() ~= 0
end

function IsCACItemPurchased( element, controller )
	if not (not IsZombies() or CoD.PrestigeUtility.isInPermanentUnlockMenu) or not IsProgressionEnabled( controller ) then
		return true
	end
	local itemIndexModel = nil
	local itemIndex = element.itemIndex
	if not itemIndex then
		itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			itemIndex = Engine.GetModelValue( itemIndexModel )
		end
	end
	if itemIndex then
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		return Engine.IsItemPurchased( controller, itemIndex, mode )
	end
	return false
end

function ShouldShowTokenIconOnItem( menu, element, controller )
	if Engine.IsZombiesGame() then
		return false
	else
		local f206_local0
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) then
			f206_local0 = not IsCurrentMenuAttachmentMenu( menu )
		else
			f206_local0 = false
		end
	end
	if Engine.IsCampaignGame() and not f206_local0 then
		f206_local0 = IsCACItemUpgradable( menu, element, controller )
	end
	return f206_local0
end

function IsCACItemUpgraded( menu, element, controller )
	if IsCACItemLocked( menu, element, controller ) then
		return false
	end
	local upgradeItemIndex = element.upgradeItemIndex
	if not upgradeItemIndex then
		local upgradeItemIndexModel = element:getModel( controller, "upgradeItemIndex" )
		if upgradeItemIndexModel then
			upgradeItemIndex = Engine.GetModelValue( upgradeItemIndexModel )
		end
	end
	if not upgradeItemIndex then
		return false
	elseif not IsProgressionEnabled( controller ) then
		return true
	end
	local isUpgradePurchased = Engine.IsItemPurchased( controller, upgradeItemIndex )
	return isUpgradePurchased
end

function IsCACItemBanned( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		return Engine.GetItemRestrictionState( itemIndex ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
	else
		return false
	end
end

function IsCACItemUpgradable( menu, element, controller )
	if IsCACItemLocked( menu, element, controller ) then
		return false
	end
	local upgradeItemIndex = element.upgradeItemIndex
	if not upgradeItemIndex then
		local upgradeItemIndexModel = element:getModel( controller, "upgradeItemIndex" )
		if upgradeItemIndexModel then
			upgradeItemIndex = Engine.GetModelValue( upgradeItemIndexModel )
		end
	end
	if not upgradeItemIndex then
		return false
	end
	local f209_local0 = IsCACItemPurchased( element, controller )
	if f209_local0 then
		local isUpgradeAvailable = not IsCACItemUpgraded( menu, element, controller )
	end
	return f209_local0
end

function IsCACSlotUpgradable( menu, element, controller )
	if not element:getModel() then
		return false
	else
		local itemRef = GetUpgradableItemRef( menu, element, controller )
		if itemRef then
			return not LUI.endswith( itemRef, "_pro" )
		else
			return false
		end
	end
end

function IsCACSlotUpgraded( menu, element, controller )
	if not element:getModel() then
		return false
	else
		local itemRef = GetUpgradableItemRef( menu, element, controller )
		if itemRef then
			return LUI.endswith( itemRef, "_pro" )
		else
			return false
		end
	end
end

function IsWeaponPrestigeLevelAtLeast( element, controller, expressionArg )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local elementModel = element:getModel()
		if elementModel then
			local itemIndex = CoD.SafeGetModelValue( elementModel, "itemIndex" )
			return itemIndex and expressionArg <= CoD.CACUtility.GetWeaponPLevel( controller, itemIndex )
		else
			return false
		end
	end
end

function IsCACHaveTokens( controller )
	local itemGroup = "weapon_smg"
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local tokenCount = Engine.GetCurrentTokens( controller, itemGroup, mode )
	return tokenCount > 0
end

function ShouldCACDisplayTokens( controller )
	if IsMultiplayer() then
		if IsLive() and not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL ) and not IsInGame() then
			return true
		end
	elseif IsCampaign() then
		if CoD.isSafehouse and not CoD.perController[controller].everythingUnlocked then
			return true
		end
	elseif IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
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

function IsProgressionEnabled( controller )
	if not (not IsMultiplayer() or not IsLive() or Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL )) or not (not CoD.PrestigeUtility.isInPermanentUnlockMenu or not IsLive() or Engine.IsInGame()) or not (not IsCampaign() or CoD.perController[controller].everythingUnlocked) or IsZombies() and IsLive() and not Engine.IsInGame() then
		return true
	else
		return false
	end
end

function IsClassAllocationInState( controller, expressionArg )
	local maxAllocation = Engine.GetMaxAllocation( controller )
	return maxAllocation == expressionArg
end

function IsProgressionElementItemLocked( menu, element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		return element.isLocked
	end
end

function IsCACItemLocked( menu, element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		return IsCACItemLockedHelper( menu, element, controller )
	end
end

function IsBGBItemLocked( menu, element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local dlcIndex = CoD.SafeGetModelValue( element:getModel(), "dlcIndex" )
		if not dlcIndex or dlcIndex < Enum.dlcIndex_t.CONTENT_DLC1_INDEX then
			return IsCACItemLockedHelper( menu, element, controller )
		else
			return not Engine.HasEntitlement( controller, "dlc" .. dlcIndex - Enum.dlcIndex_t.CONTENT_DLC0ZM_INDEX )
		end
	end
end

function IsCACItemLockedForGamesCom( menu, element, controller )
	if not IsProgressionEnabled( controller ) and not IsGamesComBuild() then
		return false
	else
		return IsCACItemLockedHelper( menu, element, controller )
	end
end

function IsCACItemLockedForBeta( menu, element, controller )
	if not IsProgressionEnabled( controller ) and not LuaUtils.IsBetaBuild() then
		return false
	else
		return IsCACItemLockedHelper( menu, element, controller )
	end
end

function IsCACItemLockedOrNotPurchased( menu, element, controller )
	local f223_local0 = IsCACItemLocked( menu, element, controller )
	if not f223_local0 then
		f223_local0 = not IsCACItemPurchased( element, controller )
	end
	return f223_local0
end

function IsCACItemClassified( menu, element, controller )
	if not IsProgressionEnabled( controller ) and not LuaUtils.IsBetaBuild() then
		return false
	else
		local unlockLevelModel = element:getModel( controller, "unlockLevel" )
		local unlockLevel = Engine.GetModelValue( unlockLevelModel )
		if unlockLevel >= 60 then
			return true
		else
			return false
		end
	end
end

function IsItemRefLocked( controller, expressionArg )
	local itemIndex = Engine.GetItemIndexFromReference( expressionArg )
	if itemIndex then
		return Engine.IsItemLocked( controller, itemIndex )
	else
		return true
	end
end

function IsNonAttachmentItemLocked( controller, itemRefArg )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local itemIndex = Engine.GetItemIndexFromReference( itemRefArg, mode )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemLocked( controller, itemIndex, mode )
		else
			return false
		end
	end
end

function IsNonAttachmentItemPurchased( controller, itemRefArg )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local itemIndex = Engine.GetItemIndexFromReference( itemRefArg )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemPurchased( controller, itemIndex )
		else
			return false
		end
	end
end

function IsCACItemMutuallyExclusiveWithSelection( element, controller )
	local category = CoD.perController[controller].weaponCategory
	local itemIndex = CoD.CACUtility.EmptyItemIndex
	local elementItemIndexModel = element:getModel( controller, "itemIndex" )
	if elementItemIndexModel then
		itemIndex = Engine.GetModelValue( elementItemIndexModel )
	end
	if not category then
		category = Engine.GetLoadoutSlotForItem( itemIndex )
	end
	if category then
		local mutuallyExclusiveSlotTable = CoD.CACUtility.GetMutuallyExclusiveSlotName( category, controller, itemIndex )
		for i = 1, #mutuallyExclusiveSlotTable, 1 do
			local mutuallyExlusiveItemSlot = mutuallyExclusiveSlotTable[i]
			if mutuallyExlusiveItemSlot ~= "" then
				return true
			end
		end
	end
	return false
end

function IsMenuPreviewImageSquare( menu )
	if menu.menuName == "PerkSelect" or menu.menuName == "LethalEquipmentSelect" or menu.menuName == "TacticalEquipmentSelect" or menu.menuName == "TacticalRigSelect" or menu.menuName == "WildcardSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuCybercoreOrRigMenu( menu )
	if menu.menuName == "TacticalRigSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuEquipmentMenu( menu )
	if menu.menuName == "PerkSelect" or menu.menuName == "LethalEquipmentSelect" or menu.menuName == "TacticalEquipmentSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuAttachmentMenu( menu )
	if menu.menuName == "PrimaryAttachmentSelect" or menu.menuName == "PrimaryOpticSelect" or menu.menuName == "SecondaryAttachmentSelect" or menu.menuName == "SecondaryOpticSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponMenu( menu )
	if menu.menuName == "PrimaryWeaponSelect" or menu.menuName == "SecondaryWeaponSelect" or menu.menuName == "WeaponBuildKits" or menu.menuName == "WeaponBuildKitsCustomizeVariant" or menu.menuName == "WeaponBuildKitsCategorySelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponType( menu )
	if IsCurrentMenuAttachmentMenu( menu ) or IsCurrentMenuWeaponMenu( menu ) then
		return true
	else
		return false
	end
end

function IsMulticoreActivated( controller )
	if Engine.IsCampaignGame() then
		local inTrainingSim = IsInTrainingSim( controller )
		local f235_local0 = inTrainingSim
		local f235_local1 = Dvar.allItemsUnlocked:get()
		if not f235_local1 then
			f235_local1 = f235_local0 or not IsItemRefLocked( controller, "feature_multicore" )
		end
		return f235_local1
	else
		return false
	end
end

function IsInTrainingSim( controller )
	if Engine.IsCampaignGame() then
		local inTrainingSimModel = Engine.GetModel( Engine.GetModelForController( controller ), "safehouse.inTrainingSim" )
		local inTrainingSim = false
		if inTrainingSimModel then
			inTrainingSim = Engine.GetModelValue( inTrainingSimModel ) > 0
		end
		return inTrainingSim
	else
		return false
	end
end

function IsMulticoreInMobileArmory( menu, controller )
	if CoD.perController[controller].isInMobileArmory then
		return CoD.perController[controller].isInMobileArmory and IsMulticoreActivated( controller )
	else
		return false
	end
end

function IsCybercoreMenuDisabled( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isDisabled = CoD.SafeGetModelValue( perControllerModel, "hudItems.cybercoreSelectMenuDisabled" )
	return isDisabled == 1
end

function IsCybercoreItemEquipped( menu, element, controller )
	local equippedCore = Engine.GetEquippedCybercore( controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		return itemIndex == equippedCore
	else
		return false
	end
end

function IsCybercoreAbilityAvailable( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
		if Engine.IsItemPurchased( controller, baseItemIndex ) then
			return true
		end
		local prereqItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "prereqItemIndex" ) )
		if prereqItemIndex ~= -1 then
			return Engine.IsItemPurchased( controller, prereqItemIndex )
		end
	end
	return false
end

function IsCybercoreAbilityPurchasable( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
		return not Engine.IsItemPurchased( controller, baseItemIndex )
	else
		return false
	end
end

function IsCybercoreAbilityUpgradable( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
		local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "upgradeItemIndex" ) )
		local basePurchased = Engine.IsItemPurchased( controller, baseItemIndex )
		if basePurchased and upgradeItemIndex then
			local upgradePurchased = Engine.IsItemPurchased( controller, upgradeItemIndex )
			return not upgradePurchased
		end
	end
	return false
end

function IsCybercoreAbilityUpgraded( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "upgradeItemIndex" ) )
		if upgradeItemIndex then
			return Engine.IsItemPurchased( controller, upgradeItemIndex )
		else
			return true
		end
	else
		return false
	end
end

function IsBubbleGumPackClassSelectedBubbleGumPack( menu, element )
	local elementModel = element:getModel()
	local menuModel = menu:getModel()
	if elementModel and menuModel and elementModel == menuModel then
		return true
	else
		return false
	end
end

function IsCurrentClassSelectedClass( menu, element )
	local elementModel = element:getModel()
	local menuModel = menu:getModel()
	if elementModel and menuModel and elementModel == menuModel then
		return true
	else
		return false
	end
end

function IsCurrentClassModelValueEqualToString( controller, modelArg, compareString )
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local f246_local0 = classModel
	local model = Engine.GetModel( classModel, modelArg )
	local f246_local1 = f246_local0 and model
	local f246_local2 = f246_local1
	local modelValue = Engine.GetModelValue( f246_local1 )
	local f246_local3 = f246_local2 and modelValue
	local f246_local4
	if f246_local3 == nil or f246_local3 ~= compareString then
		f246_local4 = false
	else
		f246_local4 = true
	end
	return f246_local4
end

function IsCACSlotHaveModel( element )
	local elementModel = element:getModel()
	if elementModel then
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( weaponSlotModel )
			if weaponSlotName == "primary" or weaponSlotName == "secondary" or LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" ) or weaponSlotName == "primarygadget" or weaponSlotName == "secondarygadget" or LUI.startswith( weaponSlotName, "primarygadgetattachment" ) or LUI.startswith( weaponSlotName, "secondarygadgetattachment" ) or LUI.startswith( weaponSlotName, "specialty" ) or LUI.startswith( weaponSlotName, "bonuscard" ) or weaponSlotName == "cybercore" then
				return true
			end
		end
	end
	return false
end

function IsCACSlotEquipped( menu, element, controller )
	if not controller then
		return false
	end
	local customModel = element:getModel( controller, "customWeaponSlot" )
	local customSlot = nil
	if customModel then
		customSlot = Engine.GetModelValue( customModel )
	end
	if customSlot then
		local elementModel = menu:getModel( controller, customSlot )
		if elementModel then
			local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
			if itemIndexModel then
				local itemIndex = Engine.GetModelValue( itemIndexModel )
				local separatorStartIndex, separatorEndIndex = string.find( customSlot, "%." )
				local parentSlot = string.sub( customSlot, 0, separatorStartIndex - 1 )
				local possibleSlotList = CoD.CACUtility.GetAttachmentListForSlot( parentSlot )
				return CoD.CACUtility.GetAttachedItemSlot( menu:getModel(), itemIndex, possibleSlotList ) ~= nil
			end
		end
	else
		local classModel = menu:getModel()
		if not classModel then
			classModel = CoD.perController[controller].classModel
		end
		local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
		if weaponSlot then
			local availability, equipped, separatorEndIndex = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
			return equipped
		end
	end
	return false
end

function IsSecondaryAttachmentEquippedWithNoPersonalization( menu, element, controller )
	if IsCACCustomizationDWAttachmentItemEquipped( menu, element, controller ) then
		return true
	elseif not IsLive() and IsCACSlotEquipped( menu, element, controller ) then
		return true
	else
		return false
	end
end

function IsCACSlotAvailable( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
		return availability == CoD.CACUtility.CACStatusAvailable.AVAILABLE
	else
		return false
	end
end

function IsCACSecondLethalAvailable( menu, element, controller )
	if IsCACSlotAvailable( menu, element, controller ) then
		if not IsCACSpecificWildcardEquipped( menu, "bonuscard_danger_close" ) then
			return true
		elseif IsCACSpecificSlotEquipped( menu, controller, "primarygadget" ) then
			return true
		end
	end
	return false
end

function IsCACSlotNeedWildcard( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local wildcardNeeded = CoD.CACUtility.WildcardNeededForSlot( controller, weaponSlot )
		if wildcardNeeded then
			return true
		end
	end
	return false
end

function IsCACSlotCanEquipWildcard( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local wildcardNeeded, isRequiredEquipped = CoD.CACUtility.WildcardNeededForSlot( controller, weaponSlot )
		if wildcardNeeded then
			return isRequiredEquipped
		end
	end
	return false
end

function IsCACSlotWildcardLocked( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local wildcardNeeded, isRequiredEquipped, isRequiredLocked = CoD.CACUtility.WildcardNeededForSlot( controller, weaponSlot )
		if wildcardNeeded then
			return isRequiredLocked
		end
	end
	return false
end

function IsCACAnyPerkEquipped( menu )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsItemEquippedInAnySlot( classModel, CoD.CACUtility.CompletePerkSlotNameList )
	else
		return false
	end
end

function IsCACAnyWildcardEquipped( menu )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsItemEquippedInAnySlot( classModel, CoD.CACUtility.BonuscardSlotNameList )
	else
		return false
	end
end

function IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local classModel = menu:getModel()
	if elementModel then
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( weaponSlotModel )
			if LUI.startswith( weaponSlotName, "primaryattachment" ) then
				local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, "primary" )
				return equipped
			elseif LUI.startswith( weaponSlotName, "secondaryattachment" ) then
				local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, "secondary" )
				return equipped
			end
		end
	end
	return false
end

function IsCACSlotSpecificItemEquipped( element, controller, specificItemName )
	local elementIndexModel = element:getModel( controller, "itemIndex" )
	if elementIndexModel then
		local itemIndex = Engine.GetModelValue( elementIndexModel )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			local itemRef = Engine.GetItemRef( itemIndex )
			if itemRef == specificItemName then
				return true
			end
		end
	end
	return false
end

function IsCACEquippedWildcardItemCount( menu, wildcardName, expressionArg )
	local classModel = menu:getModel()
	local count = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, wildcardName )
	return expressionArg == count
end

function IsCACCountGreaterThanEquippedWildcardItem( menu, wildcardName, expressionArg )
	local classModel = menu:getModel()
	local count = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, wildcardName )
	return expressionArg <= count
end

function IsCACPrimaryGunfighterCountEqualTo( menu, expressionArg )
	local classModel = menu:getModel()
	local count = CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel )
	return expressionArg == count
end

function IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( menu, expressionArg )
	local classModel = menu:getModel()
	local count = CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel )
	return expressionArg <= count
end

function IsCACPrimaryAttachmentSlotLockedByWildcard( controller )
	local isLocked = IsNonAttachmentItemLocked( controller, "bonuscard_primary_gunfighter" )
	if isLocked then
		isLocked = IsNonAttachmentItemLocked( controller, "bonuscard_primary_gunfighter_2" )
	end
	if isLocked then
		isLocked = IsNonAttachmentItemLocked( controller, "bonuscard_primary_gunfighter_3" )
	end
	return isLocked
end

function IsCACAttachmentSlotVisible( menu, element, controller, expressionArg )
	local isWeaponEquipped = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
	if isWeaponEquipped then
		return not IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", expressionArg )
	else
		return IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", 0 )
	end
end

function IsHintTextLeftAlign( element, controller )
	local slotModel = element:getModel( controller, "weaponSlot" )
	if slotModel then
		local slotName = Engine.GetModelValue( slotModel )
		if LUI.startswith( slotName, "primarygadget" ) then
			return true
		end
	end
	return false
end

function IsHintTextRightAlign( element, controller )
	local slotModel = element:getModel( controller, "weaponSlot" )
	if slotModel then
		local slotName = Engine.GetModelValue( slotModel )
		if slotName == "primaryattachment3" or slotName == "primaryattachment6" or slotName == "secondaryattachment3" or slotName == "specialty3" or slotName == "specialty6" then
			return true
		end
	end
	return false
end

function IsCACSlotAttachment( element )
	local elementModel = element:getModel()
	if elementModel then
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( Engine.GetModel( elementModel, "weaponSlot" ) )
			if LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" ) then
				return true
			end
		end
	end
	return false
end

function IsCACAnyGreedWildcardUnequipped( element, controller )
	local weaponSlotModel = element:getModel( controller, "weaponSlot" )
	if weaponSlotModel then
		local weaponSlot = Engine.GetModelValue( weaponSlotModel )
		if weaponSlot == "specialty4" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) ~= ""
		elseif weaponSlot == "specialty5" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) ~= ""
		elseif weaponSlot == "specialty6" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= ""
		end
	end
	return false
end

function IsCACSpecificWildcardEquipped( menu, wildcardName )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsBonusCardEquipped( wildcardName, classModel )
	else
		return false
	end
end

function IsCACSpecificSlotEquipped( menu, controller, slotName )
	local classModel = menu:getModel()
	if classModel then
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, slotName )
		return equipped
	else
		return false
	end
end

function IsCACGadgetModAvailable( menu, element, controller )
	local classModel = menu:getModel()
	if not controller or not classModel then
		return false
	end
	local weaponSlotModel = element:getModel( controller, "weaponSlot" )
	if not weaponSlotModel then
		return false
	end
	local slotName = Engine.GetModelValue( weaponSlotModel )
	local gadgetSlotName = "primarygadget"
	if LUI.startswith( slotName, "primarygadgetattachment" ) then
		gadgetSlotName = "primarygadget"
	elseif LUI.startswith( slotName, "secondarygadgetattachment" ) then
		gadgetSlotName = "secondarygadget"
	end
	if CoD.CACUtility.ItemEquippedInSlot( gadgetSlotName, controller ) then
		local indexModel = Engine.GetModel( classModel, gadgetSlotName .. ".cust" .. slotName .. ".itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			if itemIndex > CoD.CACUtility.EmptyItemIndex then
				return true
			end
		end
	end
	return false
end

function IsCACSlotRequiresWildcard( menu, element, controller )
	local classModel = menu:getModel()
	if not controller or not classModel then
		return false
	else
		local weaponSlotModel = element:getModel( controller, "weaponSlot" )
		if not weaponSlotModel then
			return false
		else
			local weaponSlot = Engine.GetModelValue( weaponSlotModel )
			if not weaponSlot then
				return false
			else
				local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
				return availability == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	end
end

function IsCACThirdPrimaryAttachmentAvailable( controller )
	local classModel = CoD.perController[controller].classModel
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel ) >= 1
end

function IsCACFifthPrimaryAttachmentAvailable( controller )
	local classModel = CoD.perController[controller].classModel
	return CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel ) >= 2
end

function IsCACSecondSecondaryAttachmentAvailable( controller )
	return CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= ""
end

function IsCACTakeTwoPrimaryGadgetAttachmentEquipped( menu )
	return SearchForTakeTwoGadgetMod( menu:getModel(), CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoSecondaryGadgetAttachmentEquipped( menu )
	return SearchForTakeTwoGadgetMod( menu:getModel(), CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoPrimaryGadgetAttachment( menu, element )
	return IsTakeTwoGadgetAttachmentForSlot( menu:getModel(), element:getModel(), "primarygadget" )
end

function IsCACTakeTwoSecondaryGadgetAttachment( menu, element )
	return IsTakeTwoGadgetAttachmentForSlot( menu:getModel(), element:getModel(), "secondarygadget" )
end

function IsPrimaryWeaponAttachmentAvailable( controller )
	return CoD.CACUtility.ItemEquippedInSlot( "primary", controller ) and GetNumberOfAttachmentsForSlot( "primary", controller ) > 0
end

function IsSecondaryWeaponAttachmentAvailable( controller )
	return CoD.CACUtility.ItemEquippedInSlot( "secondary", controller ) and GetNumberOfAttachmentsForSlot( "secondary", controller ) > 0
end

function IsItemSlotLockedByWildcardLocked( self, element, controller, bonusCardNameArg )
	element.itemIndex = Engine.GetItemIndexFromReference( bonusCardNameArg )
	return IsCACItemLocked( self, element, controller )
end

function IsPrimaryEquipmentModAvailable( menu, element, event )
	return IsCACGadgetModAvailable( menu, element, event )
end

function IsSecondaryEquipmentModAvailable( menu, element, event )
	return IsCACGadgetModAvailable( menu, element, event )
end

function IsPerk1PlusEquipped( menu, controller )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty4", controller, menu:getModel() ) ~= 0
end

function IsPerk2PlusEquipped( menu, controller )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty5", controller, menu:getModel() ) ~= 0
end

function IsPerk3PlusEquipped( menu, controller )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty6", controller, menu:getModel() ) ~= 0
end

function IsCACInfopaneItemNameEmpty( element, controller )
	local nameModel = element:getModel( controller, "name" )
	local elementModel = element:getModel()
	if nameModel and Engine.GetModelValue( nameModel ) == "" then
		return true
	else
		return false
	end
end

function IsCACWeaponVariantAvailable( element, controller )
	if not Gunsmith_IsEnabled( element, controller ) then
		return false
	end
	local elementModel = element:getModel()
	if elementModel then
		local weaponDefaultSlot = CoD.SafeGetModelValue( elementModel, "loadoutSlot" )
		if CoD.perController[controller].weaponSlot and weaponDefaultSlot ~= CoD.perController[controller].weaponSlot then
			return false
		end
		local refModel = Engine.GetModel( elementModel, "ref" )
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			local weaponVariantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( itemIndex )
			if #weaponVariantList > 1 or #weaponVariantList == 1 and CoD.CraftUtility.Gunsmith.AreMaxVariantSlotsUsed() then
				CoD.perController[controller].weaponIndexForVariant = itemIndex
				return true
			end
		end
	end
	return false
end

function IsBaseWeaponVariantIndex( self, element, controller )
	local cacVariantIndexModel = element:getModel( controller, "cacVariantIndex" )
	if cacVariantIndexModel then
		local cacVariantIndex = Engine.GetModelValue( cacVariantIndexModel )
		return cacVariantIndex == 0
	else
		return false
	end
end

function IsCACSlotHasVariantName( element )
	local slotModel = element:getModel()
	if slotModel then
		local variantModel = Engine.GetModel( slotModel, "variantName" )
		if variantModel and Engine.GetModelValue( variantModel ) ~= "" then
			return true
		end
	end
	return false
end

function DoesWeaponVariantContainLockedItems( self, element, controller )
	if IsProgressionEnabled( controller ) and element.weaponVariantInfo then
		return element.weaponVariantInfo.hasLockedItems
	else
		return false
	end
end

function DoesWeaponVariantContainLockedAttachments( self, element, controller )
	if IsProgressionEnabled( controller ) and element.weaponVariantInfo then
		return element.weaponVariantInfo.hasLockedAttachments
	else
		return false
	end
end

function IsCACWeaponAttributeIncrease( element, controller, attributeName )
	if element:getModel( controller, attributeName ) then
		local attributeValues = Engine.GetModelValue( element:getModel( controller, attributeName ) )
		return WeaponAttributeCompare( attributeValues )
	else
		return false
	end
end

function IsCACGunLevelMax( self, element, controller )
	local weaponIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller, element )
	if weaponIndex == CoD.CACUtility.EmptyItemIndex then
		return false
	else
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		return IsWeaponLevelMax( weaponIndex, controller, mode )
	end
end

function IsCACGunLevelExists( self, element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local weaponIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller, element )
		if Engine.IsCampaignGame() then
			local f296_local0 = CoD.CACUtility.GetAttachments( weaponIndex )
			if f296_local0 then
				f296_local0 = #CoD.CACUtility.GetAttachments( weaponIndex ) > 0
			end
			local f296_local1
			if weaponIndex ~= CoD.CACUtility.EmptyItemIndex then
				f296_local1 = f296_local0
			else
				f296_local1 = false
			end
			return f296_local1
		else
			return weaponIndex ~= CoD.CACUtility.EmptyItemIndex
		end
	end
end

function AllowWeaponPrestige( controller )
	return IsMultiplayer() and IsProgressionEnabled( controller ) or Dvar.ui_allowWeaponPrestige:get()
end

function CanPrestigeWeapon( element, controller )
	if IsArenaMode() then
		return false
	elseif not AllowWeaponPrestige( controller ) then
		return false
	end
	local weaponSelectionCategory = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "WGSV_Category" )
	if weaponSelectionCategory == CoD.WGSV_Category.WEAPON then
		local elementModel = element:getModel()
		if elementModel then
			return IsWeaponLevelMax( itemIndex, controller, Engine.CurrentSessionMode() ) and f298_local0 and CoD.CACUtility.GetWeaponPLevel( controller, itemIndex ) < CoD.CACUtility.maxWeaponPrestige
		end
	end
	return false
end

function IsItemWeaponOptionNew( element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local classModel = CoD.perController[controller].classModel
		local loadoutSlotName = CoD.perController[controller].weaponCategory
		local elementModel = element:getModel()
		local weaponOptionIndex = CoD.SafeGetModelValue( elementModel, "weaponOptionSubIndex" )
		local weaponOptionType = CoD.SafeGetModelValue( elementModel, "weaponOptionType" )
		if weaponOptionIndex and weaponOptionType and weaponOptionType ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and weaponOptionIndex > CoD.CACUtility.EmptyItemIndex then
			local itemIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" ) )
			local optionItemIndex = Engine.GetWeaponOptionGroupIndex( weaponOptionIndex, weaponOptionType )
			if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
				local weaponType = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
				local weaponIndex = CoD.SafeGetModelValue( classModel, weaponType .. ".itemIndex" )
				itemIndex = Engine.GetItemAttachment( weaponIndex, itemIndex )
			end
			return Engine.IsWeaponOptionNew( controller, itemIndex, optionItemIndex )
		else
			return false
		end
	end
end

function IsItemWeaponOptionEquipped( element, controller )
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[controller].weaponCategory )
	local weaponOptionNameModel = element:getModel( controller, "weaponOptionTypeName" )
	local weaponOptionIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if weaponOptionNameModel and weaponOptionIndexModel and weaponOptionTypeModel then
		local weaponOptionName = Engine.GetModelValue( weaponOptionNameModel )
		local weaponOptionIndex = Engine.GetModelValue( weaponOptionIndexModel )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
			if CoD.CACUtility.GetItemEquippedInSlot( loadoutSlotName .. "paintjobIndex", controller, classModel ) == paintjobIndex and CoD.CACUtility.GetItemEquippedInSlot( loadoutSlotName .. "paintjobSlot", controller, classModel ) == paintjobSlot then
				return true
			end
		elseif CoD.CACUtility.GetItemEquippedInSlot( loadoutSlotName .. weaponOptionName, controller ) == weaponOptionIndex then
			return true
		end
	end
	return false
end

function IsItemWeaponOptionLocked( menu, element, controller )
	if not IsCACPersonalizationProgressionEnabled( element, controller ) then
		return false
	end
	local classModel = CoD.perController[controller].classModel
	local weaponCategory = CoD.perController[controller].weaponCategory
	local itemIndexModel = Engine.GetModel( classModel, weaponCategory .. ".itemIndex" )
	local weaponOptionSubIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if itemIndexModel and weaponOptionSubIndexModel and weaponOptionTypeModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		local statIndex = Engine.GetModelValue( weaponOptionSubIndexModel )
		local groupIndex = Engine.GetModelValue( weaponOptionTypeModel )
		local weaponOptionIndex = Engine.GetWeaponOptionGroupIndex( statIndex, groupIndex )
		if groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local weaponType = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( weaponCategory )
			local weaponIndex = CoD.SafeGetModelValue( classModel, weaponType .. ".itemIndex" )
			if not weaponIndex then
				return true
			end
			itemIndex = Engine.GetItemAttachment( weaponIndex, itemIndex )
		end
		if (groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and statIndex == 0 then
			return false
		elseif groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if statIndex == 0 then
				return false
			end
			local ref = Engine.GetAttachmentRef( itemIndex, statIndex )
			for index, attachmentRef in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if ref == attachmentRef then
					local f301_local3
					if CoD.CACUtility.GetWeaponPLevel( controller, itemIndex ) < index then
						f301_local3 = not Dvar.allItemsUnlocked:get()
					else
						f301_local3 = false
					end
					return f301_local3
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( controller, itemIndex, weaponOptionIndex )
	end
	return false
end

function GetUnlockSessionMode( element, controller )
	local unlockSessionMode = Enum.eModes.MODE_COUNT
	if not element then
		return unlockSessionMode
	end
	local elementUnlockSessionModeModel = element:getModel( controller, "unlockSessionMode" )
	if not elementUnlockSessionModeModel then
		elementUnlockSessionModeModel = element:getModel( controller, "challengeInfo.unlockSessionMode" )
	end
	if not elementUnlockSessionModeModel then
		return unlockSessionMode
	end
	return Engine.GetModelValue( elementUnlockSessionModeModel )
end

function ShouldHideItemWeaponOptionInGunsmith( element, controller )
	local weaponOptionSubIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if not weaponOptionSubIndexModel or not weaponOptionTypeModel then
		return true
	else
		local unlockSessionMode = GetUnlockSessionMode( element, controller )
		if unlockSessionMode == Enum.eModes.MODE_COUNT then
			return true
		elseif not IsLive() and (unlockSessionMode == Enum.eModes.MODE_MULTIPLAYER or unlockSessionMode == Enum.eModes.MODE_ZOMBIES) then
			return true
		else
			local statIndex = Engine.GetModelValue( weaponOptionSubIndexModel )
			local groupIndex = Engine.GetModelValue( weaponOptionTypeModel )
			if (groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and statIndex == 0 then
				return true
			else
				return false
			end
		end
	end
end

function ShouldHideItemWeaponOption( element, controller )
	if not IsCACPersonalizationProgressionEnabled( element, controller ) then
		return true
	elseif CoD.SafeGetModelValue( element:getModel(), "isChallengeClassified" ) == true then
		return true
	end
	local weaponOptionSubIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if weaponOptionSubIndexModel and weaponOptionTypeModel then
		local statIndex = Engine.GetModelValue( weaponOptionSubIndexModel )
		local groupIndex = Engine.GetModelValue( weaponOptionTypeModel )
		if (groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and statIndex == 0 then
			return true
		elseif groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			return true
		end
	end
	return false
end

function IsWeaponPrestigeItem( element, controller )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if weaponOptionTypeModel then
		local groupIndex = Engine.GetModelValue( weaponOptionTypeModel )
		if groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			return true
		end
	end
	return false
end

function IsCACPersonalizationProgressionEnabled( element, controller )
	local unlockSessionMode = nil
	if element then
		local elementUnlockSessionModeModel = element:getModel( controller, "unlockSessionMode" )
		if not elementUnlockSessionModeModel then
			elementUnlockSessionModeModel = element:getModel( controller, "challengeInfo.unlockSessionMode" )
		end
		if elementUnlockSessionModeModel then
			unlockSessionMode = Engine.GetModelValue( elementUnlockSessionModeModel )
		end
		if unlockSessionMode and unlockSessionMode >= Enum.eModes.MODE_FIRST and unlockSessionMode < Enum.eModes.MODE_COUNT and (not (unlockSessionMode ~= Enum.eModes.MODE_CAMPAIGN and (unlockSessionMode ~= Enum.eModes.MODE_MULTIPLAYER or not IsLive() or IsMultiplayer() and Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL ))) or unlockSessionMode == Enum.eModes.MODE_ZOMBIES and IsLive()) then
			return true
		end
	end
	return false
end

function IsClassOptionDisabled( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local elementModel = element:getModel()
	if classModel and elementModel and classModel == elementModel then
		element.disabled = true
		return true
	else
		return false
	end
end

function IsClassSetOptionDisabled( self, element, controller )
	local selectedClassSetIndexModel = element:getModel( controller, "classSetId" )
	if selectedClassSetIndexModel then
		local selectedClassSetIndex = Engine.GetModelValue( selectedClassSetIndexModel )
		local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
		if selectedClassSetIndex == currentClassSetIndex then
			return true
		end
	end
	return false
end

function IsCurrentItemClassified( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local isClassifiedModel = Engine.GetModel( elementModel, "isClassified" )
		if isClassifiedModel then
			return Engine.GetModelValue( isClassifiedModel )
		end
	end
	return false
end

function IsCurrentACVEquipped( self, element, controller )
	local classModel = self:getModel()
	local loadoutSlotName = CoD.perController[controller].weaponCategory .. "cosmeticvariant"
	local equippedIndex = CoD.CACUtility.GetItemEquippedInSlot( loadoutSlotName, controller, classModel )
	local variantIndexModel = element:getModel( controller, "variantIndex" )
	if variantIndexModel then
		local variantIndex = Engine.GetModelValue( variantIndexModel )
		return equippedIndex == variantIndex
	else
		return false
	end
end

function IsCACACVItemNew( element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	elseif CoD.SafeGetModelValue( element:getModel(), "isBMClassified" ) == true then
		return false
	else
		local weaponIndex = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
		if weaponIndex and element.attachmentRef and element.variantIndex and element.variantIndex > CoD.CACUtility.EmptyItemIndex then
			local mode = Enum.eModes.MODE_MULTIPLAYER
			return IsACVItemNewHelper( controller, weaponIndex, element.attachmentTableIndex, element.variantIndex, mode )
		else
			return false
		end
	end
end

function IsClassSetsAvailableForCurrentGameMode()
	return AreCodPointsEnabled( 0 ) and Engine.IsClassSetsAvailableForCurrentGameMode()
end

function AreCodPointsEnabled( controller )
	return IsLive() and IsBooleanDvarSet( "tu4_enableCodPoints" )
end

function IsBlackMarketBreadcrumbActive( controller )
	return currentStats.blackMarketShowBreadcrumb and f314_local0 and currentStats.blackMarketShowBreadcrumb:get() == 1
end

function CanAffordTradeAgain( element, controller )
	local itemCost = CoD.SafeGetModelValue( element:getModel(), "itemCost" )
	if itemCost ~= nil and itemCost > 0 and itemCost <= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) then
		return true
	else
		local itemCODPointCost = CoD.SafeGetModelValue( element:getModel(), "itemCODPointCost" )
		if itemCODPointCost ~= nil and itemCODPointCost > 0 and itemCODPointCost <= Engine.GetCoDPoints( controller ) then
			return true
		else
			return false
		end
	end
end

function IsInventoryBusy( controller )
	return Engine.IsInventoryBusy( controller )
end

function CanAffordCrate( controller, exprCrateType )
	local codPointCost = CoD.BlackMarketUtility.GetCrateCODPointCost( exprCrateType )
	if codPointCost > 0 and codPointCost <= Engine.GetCoDPoints( controller ) then
		return true
	else
		local cryptoKeyCost = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( exprCrateType )
		if cryptoKeyCost > 0 and cryptoKeyCost <= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) then
			return true
		else
			return false
		end
	end
end

function BlackMarketListItemCanEquip( element, controller )
	local category = CoD.SafeGetModelValue( element:getModel(), "category" )
	if category ~= "emblem" and category ~= "calling_card" and category ~= "specialist_outfit" and category ~= "gesture" and category ~= "taunt" then
		return false
	else
		local lockItemText = CoD.SafeGetModelValue( element:getModel(), "lockItemText" )
		if lockItemText == nil or lockItemText == "" then
			return true
		else
			
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

function AmICarryingEnemyFlag( controller )
	local playerName = Engine.GetPlayerNameForClientNum( controller, Engine.GetPredictedClientNum( controller ) )
	if playerName == "" then
		return false
	elseif CoD.IsShoutcaster( controller ) then
		local enemyFlagCarrier = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" ) )
		if playerName == enemyFlagCarrier then
			return true
		else
			local friendlyFlagCarrier = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "CTF.friendlyFlagCarrier" ) )
			return playerName == friendlyFlagCarrier
		end
	end
	local flagCarrierModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" )
	local f322_local0
	if flagCarrierModel == nil or playerName ~= Engine.GetModelValue( flagCarrierModel ) then
		f322_local0 = false
	else
		f322_local0 = true
	end
	return f322_local0
end

function AmICarryingBomb( controller )
	if CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "Demolition.defending" ) == false then
		return true
	elseif CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "SearchAndDestroy.defending" ) == false and Engine.GetGametypeSetting( "multiBomb" ) == 1 and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ) then
		return true
	else
		return IsModelValueEqualTo( controller, "hudItems.SDBombClient", Engine.GetPredictedClientNum( controller ) )
	end
end

function HasNetworkConnection()
	return Engine.CheckNetConnection() == true
end

function IsPlayerSignedInToLive( controller )
	return Engine.IsSignedInToLive( controller ) == true
end

function IsPlusAuthorized( controller )
	return Engine.IsPlusAuthorized( controller ) == true
end

function IsPlayerConnectedToCodServers( controller )
	return Engine.IsDemonwareFetchingDone( controller ) == true
end

function LobbyConnectedToDedicatedHost()
	return Engine.LobbyConnectedToDedicatedHost()
end

function IsDoubleXP( controller )
	if not IsPublicOrLeagueGame() then
		return false
	else
		local xpScale = Engine.GetXPScale( controller )
		return xpScale and xpScale >= 2
	end
end

function IsDoubleWeaponXP( controller )
	if not IsPublicOrLeagueGame() then
		local currentMenuTarget = LobbyData.GetCurrentMenuTarget()
		if not currentMenuTarget or currentMenuTarget.kicker ~= "MPUI_PUBLIC_MATCH_LOBBY" then
			return false
		end
	end
	local xpScale = Engine.GetGunXPScale( controller )
	return xpScale and xpScale >= 2
end

function IsDoubleLootXP( controller )
	if not IsPublicOrLeagueGame() then
		return false
	else
		local lootXpMultiplier = Dvar.lootxp_multiplier:get()
		if not lootXpMultiplier then
			return false
		else
			return tonumber( lootXpMultiplier ) >= 2
		end
	end
end

function IsDoubleCryptoKeyBonus( controller )
	local cryptoKeyBonusMultiplier = Dvar.lootxp_bonus_multiplier:get()
	if not cryptoKeyBonusMultiplier then
		return false
	else
		return tonumber( cryptoKeyBonusMultiplier ) >= 2
	end
end

function IsLootSaleActive( controller )
	local lootSalePercentOff = Dvar.loot_salePercentOff:get()
	if not lootSalePercentOff then
		return false
	else
		return tonumber( lootSalePercentOff ) > 0
	end
end

function IsBribeActive( controller )
	if not AreCodPointsEnabled( controller ) then
		return false
	else
		return CoD.BlackMarketUtility.GetCurrentBribeTitle() ~= nil
	end
end

function ShouldHideOfflineNetworkPrompt( controller )
	if IsLive() then
		return true
	elseif ShouldShowOfflineNormalMessage( controller ) or ShouldShowOfflineVoluntaryMessage( controller ) then
		return true
	elseif PlayGoIsStillDownloading( controller ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNormalMessage( controller )
	if not IsLive() then
		if not Engine.IsPlusAuthorized( controller ) then
			return true
		elseif not Engine.IsSignedInToLive( controller ) then
			return true
		end
	end
	return false
end

function ShouldShowOfflineVoluntaryMessage( controller )
	if not IsLive() and Engine.IsPlusAuthorized( controller ) and Engine.IsSignedInToLive( controller ) and IsPlayerConnectedToCodServers( controller ) then
		return true
	else
		return false
	end
end

function ShouldShowOfflineNetworkErrorMessage( controller )
	return not ShouldHideOfflineNetworkPrompt( controller )
end

function IsLobbyLocked()
	return LuaUtils.LobbyIsLocked()
end

function IsPlayerJoinable( element )
	local joinableModel = nil
	if element.activeWidget ~= nil then
		joinableModel = element.activeWidget:getModel()
	else
		joinableModel = element:getModel()
	end
	if joinableModel then
		joinableModel = Engine.GetModel( joinableModel, "isJoinable" )
	end
	local f340_local0
	if not joinableModel or Engine.GetModelValue( joinableModel ) ~= 1 then
		f340_local0 = false
	else
		f340_local0 = true
	end
	return f340_local0
end

function IsSelfClient( controller, element )
	local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
	local myClientNum = Engine.GetClientNum( controller )
	return clientNum == myClientNum
end

function IsEnemyClient( controller, element )
	local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
	if clientNum == nil then
		return false
	else
		local clientTeam = Engine.GetLobbyTeamID( controller, clientNum )
		local myTeam = Engine.GetLobbyTeamID( controller, Engine.GetClientNum( controller ) )
		return myTeam ~= clientTeam
	end
end

function IsSelfPredictedClient( controller, element )
	local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
	local myPredictedClientNum = Engine.GetPredictedClientNum( controller )
	return clientNum == myPredictedClientNum
end

function IsOnlineGame()
	return CoD.isOnlineGame()
end

function IsSystemLinkLobby()
	return Engine.GetLobbyNetworkMode() == CoD.LOBBY.MODE_LAN
end

function ShouldLobbyListBeUp()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f346_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	if lobbyNav ~= f346_local0.id then
		f346_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
		if lobbyNav ~= f346_local0.id then
			f346_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
			if lobbyNav ~= f346_local0.id then
				f346_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
				if lobbyNav == f346_local0.id then
					f346_local0 = false
				end
				f346_local0 = true
			end
		end
	end
	f346_local0 = false
end

function ShouldLobbyListShowPrototypeMainButtons()
	if not IsFreeCursorActive() then
		return false
	end
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f347_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	if lobbyNav ~= f347_local0.id then
		f347_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
		if lobbyNav ~= f347_local0.id then
			f347_local0 = false
		end
	end
	f347_local0 = true
end

function ShouldShowQuickJoin()
	if IsLobbyNetworkModeLAN() then
		return false
	elseif Engine.GetDvarInt( "live_social_quickjoin" ) == 0 then
		return false
	elseif Engine.GetQuickJoinPlayersCount( 0, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE ) == 0 then
		return false
	else
		return not ShouldLobbyListBeUp()
	end
end

function ShowHeaderKicker( menu )
	return menu.showHeaderKicker == true
end

function ShowHeaderIcon( menu )
	return menu.showHeaderIcon == true
end

function IsFlyoutMenuOpen( element, controller )
	local f351_local0 = IsGlobalModelValueTrue( element, controller, "GameSettingsFlyoutOpen" )
	if not f351_local0 then
		f351_local0 = IsGlobalModelValueTrue( element, controller, "BonusModesFlyoutOpen" )
	end
	return f351_local0
end

function IsMP()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return true
	else
		return false
	end
end

function IsCP()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return true
	else
		return false
	end
end

function IsZM()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return true
	else
		return false
	end
end

function IsCPMapVoteHidden( controller )
	if not IsCampaign() then
		return false
	end
	local menuID = LobbyData.GetLobbyNav()
	local f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
	if menuID ~= f355_local0.id then
		f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
		if menuID ~= f355_local0.id then
			f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
			if menuID ~= f355_local0.id then
				f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
				if menuID ~= f355_local0.id then
					f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
					if menuID ~= f355_local0.id then
						f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2_CUSTOM )
						if menuID ~= f355_local0.id then
							f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
							if menuID ~= f355_local0.id then
								f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
								if menuID ~= f355_local0.id then
									f355_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
									if menuID == f355_local0.id then
									
									else
										return not Engine.IsCPInProgress()
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return false
end

function IsMPMapVoteHidden( controller )
	if not IsMultiplayer() then
		return false
	else
		return false
	end
end

function IsZMMapVoteHidden( controller )
	if not IsZombies() then
		return false
	else
		local menuID = LobbyData.GetLobbyNav()
		local f357_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
		if menuID == f357_local0.id then
			return true
		else
			return false
		end
	end
end

function PlayerIsReady( element, menu, controller )
	if not element or not element:getModel() then
		return false
	else
		local isReadyModel = Engine.GetModel( element:getModel(), "isReady" )
		return isReadyModel and Engine.GetModelValue( isReadyModel ) == true
	end
end

function IsMainModeInvalid()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		return true
	else
		return false
	end
end

function IsMainModeInvalidAndNotTheaterMode()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID and not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN ) then
		return true
	else
		return false
	end
end

function ShouldHideLobbyMemberRank()
	if not IsLive() or IsMainModeInvalidAndNotTheaterMode() then
		return true
	end
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f361_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	if lobbyNav ~= f361_local0.id then
		f361_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
		if lobbyNav ~= f361_local0.id then
			f361_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
			if lobbyNav ~= f361_local0.id then
				f361_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
				if lobbyNav ~= f361_local0.id then
					f361_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
					if lobbyNav ~= f361_local0.id then
						f361_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA_CUSTOM )
						if lobbyNav ~= f361_local0.id then
							f361_local0 = false
						end
					end
				end
			end
		end
	end
	f361_local0 = true
end

function IsLive()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return true
	else
		return false
	end
end

function IsLAN()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return true
	else
		return false
	end
end

function IsLocal()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL then
		return true
	else
		return false
	end
end

function IsCustomLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f365_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
	if lobbyNav ~= f365_local0.id then
		f365_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
		if lobbyNav ~= f365_local0.id then
			f365_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
			if lobbyNav ~= f365_local0.id then
				f365_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_CUSTOM )
				if lobbyNav ~= f365_local0.id then
					f365_local0 = false
				end
			end
		end
	end
	f365_local0 = true
end

function IsCustomMPLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f366_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
	return lobbyNav == f366_local0.id
end

function IsPublicLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f367_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
	if lobbyNav ~= f367_local0.id then
		f367_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
		if lobbyNav ~= f367_local0.id then
			f367_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
			if lobbyNav ~= f367_local0.id then
				f367_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
				if lobbyNav ~= f367_local0.id then
					f367_local0 = false
				end
			end
		end
	end
	f367_local0 = true
end

function IsGameLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		return menu.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME
	else
		
	end
end

function ShouldShowCompetitiveSettingsSummary()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f369_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA_STAGING )
	return lobbyNav == f369_local0.id
end

function IsLobbyMode( expressionArg )
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		return menu.lobbyMode == expressionArg
	else
		
	end
end

function IsLobbyAdvertised()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		return menu.isAdvertised
	else
		return false
	end
end

function IsGameLobbyActive()
	return Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function IsLobbyNetworkModeLAN()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
end

function IsLobbyNetworkModeLive()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
end

function IsLobbyHost()
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	elseif Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	else
		return false
	end
end

function IsLobbyHostOfLobbyType( lobbyType )
	return Engine.IsLobbyHost( lobbyType )
end

function IsLobbyHostOfCurrentMenu()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if not lobbyNav then
		return false
	else
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		if not menu then
			return false
		else
			return Engine.IsLobbyHost( menu.lobbyType )
		end
	end
end

function IsLobbyPrivateHost()
	return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
end

function IsLobbyGameHost()
	return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ShowTeams()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		return menu.showTeams or false
	else
		return false
	end
end

function ShouldShowPlaylistName()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f381_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if lobbyNav ~= f381_local0.id then
		f381_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
		if lobbyNav ~= f381_local0.id then
			f381_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
			if lobbyNav ~= f381_local0.id then
				f381_local0 = false
			end
		end
	end
	f381_local0 = true
end

function IsLobbyWithTeamAssignment()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f382_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
	if lobbyNav ~= f382_local0.id then
		f382_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
		if lobbyNav ~= f382_local0.id then
			f382_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
			if lobbyNav ~= f382_local0.id then
				f382_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
				if lobbyNav ~= f382_local0.id then
					f382_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
					if lobbyNav ~= f382_local0.id then
						f382_local0 = false
					end
				end
			end
		end
	end
	f382_local0 = true
end

function LobbyHasMatchStartButton()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f383_local0 = {}
	local f383_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
	f383_local1 = f383_local1.id
	local f383_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
	f383_local2 = f383_local2.id
	local f383_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
	f383_local3 = f383_local3.id
	local f383_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
	f383_local4 = f383_local4.id
	local f383_local5 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
	f383_local5 = f383_local5.id
	local f383_local6 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2_CUSTOM )
	f383_local6 = f383_local6.id
	local f383_local7 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
	f383_local7 = f383_local7.id
	local f383_local8 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
	f383_local8 = f383_local8.id
	local f383_local9 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
	f383_local9 = f383_local9.id
	local f383_local10 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
	f383_local10 = f383_local10.id
	local f383_local11 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
	f383_local11 = f383_local11.id
	local f383_local12 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	f383_local12 = f383_local12.id
	local f383_local13 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
	f383_local13 = f383_local13.id
	local f383_local14 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
	f383_local14 = f383_local14.id
	local f383_local15 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
	f383_local15 = f383_local15.id
	local f383_local16 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
	f383_local16 = f383_local16.id
	local f383_local17 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_ZM )
	f383_local17 = f383_local17.id
	local f383_local18 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
	f383_local18 = f383_local18.id
	local f383_local19 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_CUSTOM )
	f383_local19 = f383_local19.id
	local f383_local20 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_CP_CUSTOM )
	f383_local20 = f383_local20.id
	local f383_local21 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_MP_CUSTOM )
	f383_local21 = f383_local21.id
	f383_local0[1] = f383_local1
	f383_local0[2] = f383_local2
	f383_local0[3] = f383_local3
	f383_local0[4] = f383_local4
	f383_local0[5] = f383_local5
	f383_local0[6] = f383_local6
	f383_local0[7] = f383_local7
	f383_local0[8] = f383_local8
	f383_local0[9] = f383_local9
	f383_local0[10] = f383_local10
	f383_local0[11] = f383_local11
	f383_local0[12] = f383_local12
	f383_local0[13] = f383_local13
	f383_local0[14] = f383_local14
	f383_local0[15] = f383_local15
	f383_local0[16] = f383_local16
	f383_local0[17] = f383_local17
	f383_local0[18] = f383_local18
	f383_local0[19] = f383_local19
	f383_local0[20] = f383_local20
	f383_local0[21] = f383_local21
	return LuaUtils.FindItemInArray( f383_local0, lobbyNav )
end

function IsPartyLeader( controller )
	local model = nil
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		model = Engine.GetModel( DataSources.LobbyRoot.getModel( controller ), "gameClient.isHost" )
	else
		model = Engine.GetModel( DataSources.LobbyRoot.getModel( controller ), "privateClient.isHost" )
	end
	local isLeader = nil
	if model ~= nil then
		isLeader = Engine.GetModelValue( model )
	else
		isLeader = 1
	end
	return isLeader and isLeader ~= 0
end

function IsTeamAssignment( expressionArg )
	return Engine.GetGametypeSetting( "teamAssignment" ) == expressionArg
end

function IsAddControllerTextItem( element )
	return element.isAddControllerTextItem
end

function IsPlayerCountItem( element )
	return element.isPlayerCountItem
end

function IsSelfItem( element, controller )
	local isLocalModel = element:getModel( controller, "isLocal" )
	if isLocalModel ~= nil then
		local isLocal = Engine.GetModelValue( isLocalModel )
		return isLocal == 1
	else
		return element.isSelfItem
	end
end

function IsParentPartyMemberItem( element, controller )
	local isMemberModel = element:getModel( controller, "isMember" )
	if isMemberModel ~= nil then
		local isMember = Engine.GetModelValue( isMemberModel )
		return isMember == 1
	else
		local f389_local0
		if element:getParent() ~= nil then
			f389_local0 = element:getParent()
			f389_local0 = f389_local0.isPartyMemberItem
		else
			f389_local0 = false
		end
	end
	return f389_local0
end

function IsPartyMemberItem( element, controller )
	local isMemberModel = element:getModel( controller, "isMember" )
	if isMemberModel ~= nil then
		local isMember = Engine.GetModelValue( isMemberModel )
		return isMember == 1
	else
		return element.isPartyMemberItem
	end
end

function IsFriendItem( element )
	return element.isFriendItem
end

function IsGroupsItem( element )
	return element.isGroupsItem
end

function IsMorePlayingItem( element )
	return element.isMorePlaying
end

function ShouldPlayLobbyFadeAnim( menu, controller )
	return menu.previousMenuName and f394_local0 or menu.previousMenuName == "ModeSelect"
end

function ShouldDisableEditCodCasterSettingsButton( controller )
	return false
end

function ShouldShowEditCodCasterSettingsButton( controller )
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		return true
	else
		return false
	end
end

function ShouldShowDLCWidget( controller, oneOfTheMapIDs )
	if not ShowPurchasableMap( controller, oneOfTheMapIDs ) then
		return false
	elseif CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetDLCBits(), Engine.GetDLCBitForMapName( oneOfTheMapIDs ) ) then
		return false
	else
		return true
	end
end

function IsLobbyBot( element )
	local elementModel = element:getModel()
	local lobbyClientTypeModel = Engine.GetModel( elementModel, "lobbyClientType" )
	local lobbyClientType = Engine.GetModelValue( lobbyClientTypeModel )
	if lobbyClientType == Enum.LobbyClientType.LOBBY_CLIENT_TYPE_BOT_PERMANENT or lobbyClientType == Enum.LobbyClientType.LOBBY_CLIENT_TYPE_BOT_TEMP then
		return true
	else
		return false
	end
end

function IsLANServerBrowserEmpty()
	local serversModel = Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" )
	local countModel = Engine.GetModel( serversModel, "count" )
	local count = Engine.GetModelValue( countModel )
	if count == 0 then
		return true
	else
		return false
	end
end

function LANServerBrowserCheckFilterTest( menu, filterText )
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	elseif menu.currentFilter == filterText then
		return true
	elseif not menu.currentFilter and filterText == "all" then
		return true
	else
		return false
	end
end

function LobbyHas4PlayersOrLess()
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	return clientCount <= 4
end

function PregameActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE
end

function CharacterDraftActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT
end

function ItemRestrictionVoteActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE
end

function ItemRestrictionCACEditActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT
end

function ItemRestrictionScorestreakEditActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT
end

function PregameStateEqualToEnum( enumValue )
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == enumValue
end

function CharacterLoadoutDrafted( menu, element, controller )
	if not CharacterDraftActive() then
		return false
	else
		local elementModel = element:getModel()
		if elementModel then
			local xuid = Engine.GetXUID64( controller )
			local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
			local team = Engine.GetTeamForXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType, xuid )
			local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			return Engine.CharacterLoadoutDrafted( itemIndex, team )
		else
			return false
		end
	end
end

function ItemIsBanned( menu, element, controller )
	local itemInfo = CoD.CACUtility.GetItemInfoFromElement( controller, element )
	if itemInfo then
		if CoD.CACUtility.ItemSlotBannedByBonuscard( itemInfo.loadoutSlot, itemInfo.itemIndex ) then
			return true
		elseif CoD.CACUtility.ItemSlotBannedByBonuscard( itemInfo.weaponSlot, itemInfo.itemIndex ) then
			return true
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM or itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemVote( itemInfo.itemIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.IsItemIndexRestricted( itemInfo.itemIndex, false ) then
				return true
			end
		end
		if (itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT or itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetAttachmentVote( itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if Engine.GetItemAttachmentVote( itemInfo.itemIndex, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
				return true
			elseif Engine.GetAttachmentRestrictionState( itemInfo.attachmentIndex, itemInfo.itemIndex, false ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
				return true
			end
		end
		if itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( itemInfo.itemGroup, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		end
	end
	return false
end

function ItemIsProtected( menu, element, controller )
	local itemInfo = CoD.CACUtility.GetItemInfoFromElement( controller, element )
	if itemInfo then
		if itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			return Engine.GetItemVote( itemInfo.itemIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			return Engine.GetAttachmentVote( itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( itemInfo.itemIndex, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( itemInfo.itemGroup, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		end
	end
	return false
end

function ItemIsInRestrictionState( menu, element, controller, enumValue )
	local itemInfo = CoD.CACUtility.GetItemInfoFromElement( controller, element )
	if itemInfo then
		return itemInfo.restrictionState == enumValue
	else
		return false
	end
end

function ClassContainsRestrictedItems( menu, element, controller )
	if element and element:getParent() then
		local f412_local0 = element:getParent()
		if f412_local0.id == "BuyExtraSlotsBtn" then
			return false
		end
	end
	local classIndexModel = element:getModel( controller, "classNum" )
	if classIndexModel then
		local classIndex = Engine.GetModelValue( classIndexModel )
		return CoD.CACUtility.ClassContainsRestrictedItems( controller, classIndex )
	end
	return false
end

function AnyClassContainsRestrictedItems( menu, element, controller )
	return CoD.CACUtility.AnyClassContainsRestrictedItems( controller )
end

function AnyEquippedScorestreaksBanned( menu, element, controller )
	return CoD.CACUtility.AnyEquippedScorestreaksBanned( controller )
end

function AnyCACContentBanned( menu, element, controller )
	return CoD.CACUtility.AnyCACItemsBanned()
end

function AnyScorestreaksBanned( menu, element, controller )
	return CoD.CACUtility.AnyStreaksBanned()
end

function AnySpecialistBanned()
	return CoD.CACUtility.AnySpecialistBanned()
end

function EquippedSpecialistBanned( controller )
	return CoD.CACUtility.EquippedSpecialistBanned( controller )
end

function IsStoreAvailable()
	local f419_local0
	if not CoD.isZombie then
		f419_local0 = Engine.IsFFOTDFetched()
	else
		f419_local0 = false
	end
	return f419_local0
end

function IsPlayerDead( element, controller )
	local model = element:getModel( controller, "clientNum" )
	if model then
		return Engine.IsPlayerDead( controller, Engine.GetModelValue( model ) )
	else
		return false
	end
end

function SelfCharacterIndexIsValid( menu, element, controller )
	local clientNum = Engine.GetClientNum( controller )
	local f421_local0 = Engine.GetModelForClient( clientNum )
	f421_local0 = f421_local0:create( "characterIndex" )
	local characterIndex = f421_local0:get()
	if characterIndex == nil or characterIndex < 0 then
		return false
	end
	local heroList = Engine.GetHeroList( Engine.CurrentSessionMode() )
	for _, character in ipairs( heroList ) do
		if character.bodyIndex == characterIndex then
			return true
		end
	end
	return false
end

function CharacterIndexIsValid( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel == nil then
		return false
	end
	local f422_local0 = elementModel:create( "clientNum" )
	local clientNum = f422_local0:get()
	local clientModel = Engine.GetModelForClient( clientNum )
	if clientModel == nil then
		return false
	end
	local f422_local1 = clientModel:create( "characterIndex" )
	local characterIndex = f422_local1:get()
	if characterIndex == nil or characterIndex < 0 then
		return false
	end
	local heroList = Engine.GetHeroList( Engine.CurrentSessionMode() )
	for _, character in ipairs( heroList ) do
		if character.bodyIndex == characterIndex then
			return true
		end
	end
end

function PlayerRoleHasArmor( element, controller )
	local model = element:getModel( controller, "clientNum" )
	if model then
		local clientNum = Engine.GetModelValue( model )
		local renderOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
		if renderOptions ~= nil then
			local traits = nil
			traits = Engine.GetPlayerRoleTraits( controller, clientNum, Engine.CurrentSessionMode(), renderOptions.characterIndex )
			if traits ~= nil and traits.armorBarCount > 0 then
				return true
			end
		end
	end
	return false
end

function PlayerListCountIs1( element )
	return DataSources.PlayerList.getCount( element.playerScores ) <= 1
end

function PlayerListCountIs2( element )
	return DataSources.PlayerList.getCount( element.playerScores ) == 2
end

function PlayerListCountIs3( element )
	return DataSources.PlayerList.getCount( element.playerScores ) == 3
end

function PlayerListCountIs4( element )
	return DataSources.PlayerList.getCount( element.playerScores ) >= 4
end

function PlayerHasAnObjective( element, controller )
	local f428_local0 = element:getParent()
	local model = f428_local0:getModel( controller, "objectiveIcon" )
	if model then
		return Engine.GetModelValue( model ) ~= ""
	else
		return false
	end
end

function IsThereRoomForAnotherSplitscreenPlayer()
	local usedControllers = Engine.GetUsedControllerCount()
	return usedControllers < Dvar.lobby_maxLocalPlayers:get()
end

function IsWaitingForSignInToPlaySplitscreen()
	local availableControllers = Engine.GetNonUsedControllerCount()
	return availableControllers > 0
end

function IsWaitingForAdditionalControllerToPlaySplitscreen()
	local f431_local0
	if not IsWaitingForSignInToPlaySplitscreen() then
		f431_local0 = IsThereRoomForAnotherSplitscreenPlayer()
	else
		f431_local0 = false
	end
	return f431_local0
end

function IsSplitscreenAndInGame( controller )
	return Engine.IsSplitscreen()
end

function IsBGBUnlockedForOtherSplitscreenPlayers( menu, element, controller )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if CoD.isZombie and Engine.GetLobbyLocalClientCount( lobbyType ) > 1 then
		for currentControllerIndex = 0, Engine.GetLobbyLocalClientCount( lobbyType ) - 1, 1 do
			local dlcIndex = CoD.SafeGetModelValue( element:getModel(), "dlcIndex" )
			if dlcIndex then
				if dlcIndex < Enum.dlcIndex_t.CONTENT_DLC1_INDEX then
					break
				elseif currentControllerIndex ~= controller and Engine.HasEntitlement( currentControllerIndex, "dlc" .. dlcIndex - Enum.dlcIndex_t.CONTENT_DLC0ZM_INDEX ) then
					return true
				end
			end
		end
	end
	return false
end

function HasPerksInAnySlot( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	if perkCount ~= nil and perkCount > 0 then
		return true
	else
		perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
		if perkCount ~= nil and perkCount > 0 then
			return true
		else
			perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
			if perkCount ~= nil and perkCount > 0 then
				return true
			else
				return false
			end
		end
	end
end

function HasPerksInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f435_local0
	if perkCount == nil or perkCount <= 0 then
		f435_local0 = false
	else
		f435_local0 = true
	end
	return f435_local0
end

function HasOnePerkInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f436_local0
	if perkCount == nil or perkCount ~= 1 then
		f436_local0 = false
	else
		f436_local0 = true
	end
	return f436_local0
end

function HasTwoPerksInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f437_local0
	if perkCount == nil or perkCount ~= 2 then
		f437_local0 = false
	else
		f437_local0 = true
	end
	return f437_local0
end

function HasPerksInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f438_local0
	if perkCount == nil or perkCount <= 0 then
		f438_local0 = false
	else
		f438_local0 = true
	end
	return f438_local0
end

function HasOnePerkInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f439_local0
	if perkCount == nil or perkCount ~= 1 then
		f439_local0 = false
	else
		f439_local0 = true
	end
	return f439_local0
end

function HasTwoPerksInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f440_local0
	if perkCount == nil or perkCount ~= 2 then
		f440_local0 = false
	else
		f440_local0 = true
	end
	return f440_local0
end

function HasPerksInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f441_local0
	if perkCount == nil or perkCount <= 0 then
		f441_local0 = false
	else
		f441_local0 = true
	end
	return f441_local0
end

function HasOnePerkInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f442_local0
	if perkCount == nil or perkCount ~= 1 then
		f442_local0 = false
	else
		f442_local0 = true
	end
	return f442_local0
end

function HasTwoPerksInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f443_local0
	if perkCount == nil or perkCount ~= 2 then
		f443_local0 = false
	else
		f443_local0 = true
	end
	return f443_local0
end

function IsGameTypeEqualToString( stringArg )
	local gameType = Engine.GetDvarString( "g_gametype" )
	local f444_local0
	if gameType == nil or gameType ~= stringArg then
		f444_local0 = false
	else
		f444_local0 = true
	end
	return f444_local0
end

function IsGametypeNewStyle()
	local gameType = Engine.GetCurrentGameType()
	local newStyleGametypes = {
		"war",
		"strong",
		"infil",
		"payload"
	}
	return LuaUtils.FindItemInArray( newStyleGametypes, gameType )
end

function IsTeamBasedGame( controller )
	if IsInGame() then
		return CoDShared.IsGametypeTeamBased()
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType() )
	end
end

function HasMoreThanNPlayersOnATeam( stringArg )
	local playerCheck = tonumber( stringArg )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local clients = Engine.GetTeams( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	local teams = {}
	for clientIndex, client in pairs( clients.clientTeams ) do
		if not teams[client.team] then
			teams[client.team] = {}
		end
		table.insert( teams[client.team], client )
	end
	if IsTeamBasedGame( nil ) then
		if teams[Enum.team_t.TEAM_ALLIES] and playerCheck < #teams[Enum.team_t.TEAM_ALLIES] then
			return true
		elseif teams[Enum.team_t.TEAM_AXIS] and playerCheck < #teams[Enum.team_t.TEAM_AXIS] then
			return true
		end
	elseif teams[Enum.team_t.TEAM_FREE] and playerCheck < #teams[Enum.team_t.TEAM_FREE] then
		return true
	end
	return false
end

function CanSwitchTeams()
	local f448_local0 = Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnum.TEAM_ASSIGNMENT.AUTO
	local f448_local1 = Engine.GetUsedControllerCount() > 1
	local f448_local2
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		f448_local2 = not f448_local1
	else
		f448_local2 = false
	end
	local teamBased = CoDShared.IsGametypeTeamBased()
	if teamBased and not f448_local0 then
		return true
	elseif f448_local2 then
		return true
	else
		return false
	end
end

function IsSpectatingInvalidPlayer( controller )
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		return false
	else
		local playerBeingSpectated = CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" )
		local myClientNum = Engine.GetClientNum( controller )
		return playerBeingSpectated == myClientNum
	end
end

function IsPublicOrLeagueGame( controller )
	local f450_local0 = Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST )
	if not f450_local0 then
		f450_local0 = Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE )
	end
	return f450_local0
end

function IsBombBasedGameMode()
	local gameType = Engine.GetDvarString( "g_gametype" )
	local f451_local0
	if gameType == nil or gameType ~= "sd" and gameType ~= "sr" and gameType ~= "dem" then
		f451_local0 = false
	else
		f451_local0 = true
	end
	return f451_local0
end

function IsGametypeSettingsValue( gametypeSetting, expressionArg )
	return Engine.GetGametypeSetting( gametypeSetting ) == expressionArg
end

function IsSelfModelValueGreaterThanGametypeSettingsArray( element, controller, modelArg, gametypeSettingArg, indexModelArg )
	local model = element:getModel()
	if indexModelArg ~= "" and model then
		model = Engine.GetModel( model, indexModelArg )
	end
	local f453_local0 = model
	local index = Engine.GetModelValue( model )
	local f453_local1 = f453_local0 and index
	if f453_local1 ~= nil then
		local gametypeSettings = Engine.GetGametypeSettings()
		local gametypeSettingValue = gametypeSettings[gametypeSettingArg][f453_local1]:get()
		if gametypeSettingValue ~= nil then
			return IsSelfModelValueGreaterThan( element, controller, modelArg, gametypeSettingValue )
		end
	end
	return false
end

function IsSelfModelValueGreaterThanGametypeSettingsValue( element, controller, modelArg, gametypeSettingArg )
	local gametypeSettingValue = Engine.GetGametypeSetting( gametypeSettingArg )
	return IsSelfModelValueGreaterThan( element, controller, modelArg, gametypeSettingValue )
end

function PositionDraftMaxUniqueRolesEquals( numArg )
	local gametypeSettings = Engine.GetGametypeSettings()
	local heroList = Engine.GetHeroList( Engine.CurrentSessionMode() )
	for _, hero in pairs( heroList ) do
		if gametypeSettings.maxUniqueRolesPerTeam[hero.bodyIndex]:get() ~= tonumber( numArg ) then
			return false
		end
	end
	return true
end

function CustomClassesEnabled()
	return Engine.GetGametypeSetting( "disableCAC" ) == 0
end

function IsGametypeTeambased()
	return CoDShared.IsGametypeTeamBased()
end

function IsGametypeItemSettingDefault( element )
	local elementModel = element:getModel()
	local elementParent = element:getParent()
	if elementModel then
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		local attachmentIndexModel = Engine.GetModel( elementModel, "attachmentIndex" )
		local weaponIndexModel = Engine.GetModel( elementModel, "weaponIndex" )
		local settingModel = Engine.GetModel( elementModel, "setting" )
		local tabWidgetModel = Engine.GetModel( elementModel, "tabWidget" )
		local weaponGroupsModel = Engine.GetModel( elementModel, "weaponGroups" )
		local defaultValue, currentValue = nil
		if itemIndexModel then
			local itemIndexModelValue = Engine.GetModelValue( itemIndexModel )
			return Engine.GetItemRestrictionState( itemIndexModelValue ) == Engine.GetItemRestrictionState( itemIndexModelValue, true )
		elseif settingModel then
			local settingModelValue = Engine.GetModelValue( settingModel )
			return Engine.GetGametypeSetting( settingModelValue ) == Engine.GetGametypeSetting( settingModelValue, true )
		elseif attachmentIndexModel and weaponIndexModel then
			local attachmentIndexModelValue = Engine.GetModelValue( attachmentIndexModel )
			local weaponIndexModelValue = Engine.GetModelValue( weaponIndexModel )
			return Engine.GetAttachmentRestrictionState( attachmentIndexModelValue, weaponIndexModelValue, false ) == Engine.GetAttachmentRestrictionState( attachmentIndexModelValue, weaponIndexModelValue, true )
		elseif attachmentIndexModel and not weaponGroupsModel then
			local attachmentIndex = Engine.GetModelValue( attachmentIndexModel )
			return not Engine.AttachmentRestrictionStateChangedForAnyWeapon( attachmentIndex )
		elseif element:getParent() and tabWidgetModel then
			local tabWidgetModelValue = Engine.GetModelValue( tabWidgetModel )
			if tabWidgetModelValue then
				local menuName = tabWidgetModelValue
				if LUI.startswith( menuName, "CoD." ) then
					menuName = string.sub( tabWidgetModelValue, 5 )
				end
				return CoD.GameSettingsUtility.UpdateBreadCrumbNodes( menuName )
			end
		elseif element:getParent() then
			local button = element:getParent()
			local buttonMenus = button.actionParam
			if buttonMenus then
				for index, menuName in pairs( buttonMenus ) do
					if CoD.GameSettingsUtility[menuName] and not CoD.GameSettingsUtility.UpdateBreadCrumbNodes( menuName ) then
						return false
					end
				end
			end
		end
	end
	return true
end

function IsGametypeItemSettingDefaultNew( self, elementName )
	if self[elementName] == nil then
		return false
	end
	local element = self[elementName]
	if element then
		local activeWidget = element.activeWidget
		if activeWidget and activeWidget.showChangeIndicator then
			return not activeWidget:showChangeIndicator( element, self )
		end
	end
	return IsGametypeItemSettingDefault( self )
end

function IsTeamStageWin( controller )
	local f460_local0 = CoD.TeamUtility.GetTeamID( controller )
	local f460_local1 = Engine.GetGlobalModel()
	return f460_local0 == f460_local1.StageResults.winningTeam:get()
end

function ShouldBootUpHUD( menu )
	if not Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
		return false
	else
		return not menu.hasBooted
	end
end

function DamageFeedbackInStage( element, enumValue )
	local stageModelValue = CoD.SafeGetModelValue( element:getModel(), "damageFeedbackState" )
	if stageModelValue then
		return stageModelValue & Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_MASK == enumValue
	else
		return false
	end
end

function DamageFeedbackFlagSet( element, enumValue )
	local stageModelValue = CoD.SafeGetModelValue( element:getModel(), "damageFeedbackState" )
	if stageModelValue then
		return CoD.BitUtility.IsBitSet( stageModelValue >> Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_NEXT_UNUSED_BIT, enumValue )
	else
		return false
	end
end

function OverheatWeaponVisible( controller )
	local hudItemsModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems" )
	if hudItemsModel then
		local visibilityModel = Engine.CreateModel( hudItemsModel, "overheatWeaponVisible" )
		if Engine.GetModelValue( visibilityModel ) then
			return true
		end
	end
end

function IsWeaponClipGreaterThanOrEqualTo( controller, expressionArg )
	local perControllerModel = Engine.GetModelForController( controller )
	local model = Engine.GetModel( perControllerModel, "currentWeapon.clipMaxAmmo" )
	if model == nil then
		return false
	else
		local modelValue = Engine.GetModelValue( model )
		if modelValue == nil then
			return false
		else
			return expressionArg <= modelValue
		end
	end
end

function WeaponUsesAmmo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local weaponIndex = CoD.SafeGetModelValue( perControllerModel, "currentWeapon.weapon" )
	if weaponIndex == nil then
		return false
	elseif IsLuaCodeVersionAtLeast( 28 ) then
		local weaponRef = Engine.GetItemRef( weaponIndex )
		if IsZombies() and Engine.IsUnlimitedAmmoWeapon( weaponRef ) then
			return false
		else
			local f466_local0
			if not Engine.IsWeaponType( weaponRef, "melee" ) and not Engine.IsWeaponType( weaponRef, "riotshield" ) then
				f466_local0 = not Engine.IsWeaponType( weaponRef, "grenade" )
			else
				f466_local0 = false
			end
		end
		return f466_local0
	elseif IsZombies() and Engine.IsUnlimitedAmmoWeapon( weaponIndex ) then
		return false
	else
		local f466_local1
		if not Engine.IsWeaponType( weaponIndex, "melee" ) and not Engine.IsWeaponType( weaponIndex, "riotshield" ) then
			f466_local1 = not Engine.IsWeaponType( weaponIndex, "grenade" )
		else
			f466_local1 = false
		end
	end
	return f466_local1
end

function WeaponHasAmmo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local stockModel = Engine.GetModel( perControllerModel, "currentWeapon.ammoStock" )
	local clipModel = Engine.GetModel( perControllerModel, "currentWeapon.ammoInClip" )
	if stockModel == nil or clipModel == nil then
		return false
	else
		local stockModelValue = Engine.GetModelValue( stockModel )
		local clipModelValue = Engine.GetModelValue( clipModel )
		if stockModelValue == nil or clipModelValue == nil then
			return false
		else
			return stockModelValue + clipModelValue > 0
		end
	end
end

function IsInPrematchPeriod( controller )
	local prematchPeriod = Engine.GetGametypeSetting( "prematchperiod" ) * 1000
	local currentGameTime = Engine.CurrentGameTime()
	local f468_local0
	if currentGameTime >= prematchPeriod then
		f468_local0 = IsModelValueGreaterThanOrEqualTo( controller, "isInPrematchPeriod", 1 )
	else
		f468_local0 = true
	end
	return f468_local0
end

function IsLowAmmoClip( controller )
	local lowClip = Engine.IsAmmoClipLow( controller )
	if lowClip then
		return lowClip
	else
		return false
	end
end

function IsLowAmmoDWClip( controller )
	local lowClip = Engine.IsDWAmmoClipLow( controller )
	if lowClip then
		return lowClip
	else
		return false
	end
end

function IsHeroWeaponGadgetCurrentWeapon( menu, element, controller )
	return CoD.SafeGetModelValue( element:getModel(), "state" ) == Enum.WeaponGadgetStates.PLAYER_ABILITY_STATE_INUSE
end

function IsHeroWeaponInUse( menu, element, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return IsHeroWeaponGadgetCurrentWeapon( menu, element, controller )
	else
		return false
	end
end

function IsHeroWeaponOrGadgetInUse( menu, element, controller )
	if IsHeroWeaponInUse( menu, element, controller ) then
		return true
	else
		local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
		if not Engine.isValidGadgetSlot( slot ) then
			return false
		else
			return IsHeroWeaponGadgetCurrentWeapon( menu, element, controller )
		end
	end
end

function UseHeroWeaponAmmoCounter( menu, element, controller )
	if not IsHeroWeaponInUse( menu, element, controller ) then
		return false
	end
	local gadgetId = CoD.SafeGetModelValue( element:getModel(), "id" )
	local f474_local0
	if gadgetId ~= "hero_armblade" and gadgetId ~= "hero_gravityspikes" then
		f474_local0 = false
	else
		f474_local0 = true
	end
	return f474_local0
end

function IsHudIconRatioEqualTo( element, controller, enumValue )
	local weaponIndex = CoD.SafeGetModelValue( element:getModel(), "weapon" )
	if weaponIndex then
		local ref = Engine.GetItemRef( weaponIndex ) .. "_" .. CoD.gameMode:lower()
		return Engine.GetHudIconAspectRatioForWeapon( ref ) == enumValue
	else
		return enumValue == Enum.weaponIconRatioType_t.WEAPON_ICON_RATIO_2TO1
	end
end

function IsSpecificGadgetInUse( controller, element, gadgetId )
	local gadgetModel = element:getModel()
	local f476_local0
	if CoD.SafeGetModelValue( gadgetModel, "state" ) ~= Enum.WeaponGadgetStates.PLAYER_ABILITY_STATE_INUSE or CoD.SafeGetModelValue( gadgetModel, "id" ) ~= gadgetId then
		f476_local0 = false
	else
		f476_local0 = true
	end
	return f476_local0
end

function IsCurrentWeaponReference( controller, weaponReference )
	local weaponReferenceForMode = weaponReference .. "_" .. CoD.gameMode:lower()
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" )
	local f477_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f477_local1 = f477_local0 and modelValue
	local f477_local2
	if f477_local1 == nil or f477_local1 ~= weaponReferenceForMode then
		f477_local2 = false
	else
		f477_local2 = true
	end
	return f477_local2
end

function IsCurrentWeaponMeleeSecondary( controller )
	local suffix = "_" .. CoD.gameMode:lower()
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" )
	local f478_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f478_local1 = f478_local0 and modelValue
	if f478_local1 == nil then
		return false
	elseif f478_local1 == "knife_loadout" .. suffix then
		return true
	end
	for i, field in ipairs( CoD.CACUtility.LootMeleeWeapons ) do
		if f478_local1 == field .. suffix then
			return true
		end
	end
	return false
end

function IsCurrentViewmodelWeaponName( controller, weaponName )
	local weaponNameForMode = weaponName .. "_" .. CoD.gameMode:lower()
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" )
	local f479_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f479_local1 = f479_local0 and modelValue
	local f479_local2
	if f479_local1 == nil or f479_local1 ~= weaponNameForMode then
		f479_local2 = false
	else
		f479_local2 = true
	end
	return f479_local2
end

function IsCurrentViewmodelWeaponGamemodeHiddenAmmo( controller )
	local hiddenAmmoWeapons = {
		"ball",
		"briefcase_bomb",
		"briefcase_bomb_defuse",
		"gadget_disruptor",
		"gadget_group_revive_cp",
		"cryptopad",
		"syrette",
		"ai_tank_marker",
		"autoturret",
		"combat_robot_marker",
		"dart",
		"emp",
		"rcbomb",
		"sentinel"
	}
	local hiddenModeIndependentItems = {
		"none",
		"killstreak_remote"
	}
	local modelValue = CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" )
	if modelValue then
		for _, weaponName in ipairs( hiddenAmmoWeapons ) do
			local weaponNameForMode = weaponName .. "_" .. CoD.gameMode:lower()
			if modelValue == weaponNameForMode then
				return true
			end
		end
		for _, weaponName in ipairs( hiddenModeIndependentItems ) do
			if modelValue == weaponName then
				return true
			end
		end
	end
	return false
end

function IsPrimaryOffhandGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetPowerBased( controller )
	return Engine.IsPowerBasedGadget( controller, Enum.PlayerRoleButtonOverrideTypes.PRBO_FRAG )
end

function IsSecondaryOffhandGadgetPowerBased( controller )
	return Engine.IsPowerBasedGadget( controller, Enum.PlayerRoleButtonOverrideTypes.PRBO_SMOKE )
end

function IsSpecialOffhandGadgetPowerBased( controller )
	return Engine.IsPowerBasedGadget( controller, Enum.PlayerRoleButtonOverrideTypes.PRBO_SPECIAL_OFFHAND )
end

function IsHeroWeaponGadgetPowerBased( controller )
	return Engine.IsPowerBasedGadget( controller, Enum.PlayerRoleButtonOverrideTypes.PRBO_WEAPON_SWITCH_HERO )
end

function IsPrimaryOffhandGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function WasHeroWeaponGadgetActivated( menu )
	local f493_local0
	if menu.wasHeroWeaponActivated ~= nil then
		f493_local0 = menu.wasHeroWeaponActivated
	else
		f493_local0 = false
	end
	return f493_local0
end

function isHeroVersion_2_0( controller, slot )
	return Engine.isHeroVersion_2_0( controller, slot )
end

function HeroVersion_2_0_ShouldUseInUseGadget( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) and isHeroVersion_2_0( controller, slot ) then
		return true
	else
		return not IsHeroWeaponGadgetCurrentWeapon( menu, element, controller )
	end
end

function IsSpecialGadgetAvailable( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetAvailable( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsUsingSprintDecay()
	return Engine.UsingSprintDecay() and IsMultiplayer()
end

function IsHeroWeaponGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function PulseNoLethal( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local pulse = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.pulseNoLethal" ) )
	if pulse == nil or pulse <= 0 then
		return false
	end
	local f510_local0 = CoD.CACUtility
	if f510_local0 then
		local selectedClassNum = CoD.CACUtility.SelectedClassIndex[controller]
	end
	if f510_local0 ~= nil then
		local primaryGrenadeIndex = Engine.GetClassItem( controller, f510_local0, "primarygadget" )
		if primaryGrenadeIndex == CoD.CACUtility.EmptyItemIndex then
			return false
		end
	end
	return true
end

function PulseNoTactical( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local pulse = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.pulseNoTactical" ) )
	if pulse == nil or pulse <= 0 then
		return false
	end
	local f511_local0 = CoD.CACUtility
	if f511_local0 then
		local selectedClassNum = CoD.CACUtility.SelectedClassIndex[controller]
	end
	if f511_local0 ~= nil then
		local specialGrenadeIndex = Engine.GetClassItem( controller, f511_local0, "secondarygadget" )
		if specialGrenadeIndex == CoD.CACUtility.EmptyItemIndex then
			return false
		end
	end
	return true
end

function PulseNoAmmo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local pulse = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.pulseNoAmmo" ) )
	local f512_local0
	if pulse == nil or pulse <= 0 then
		f512_local0 = false
	else
		f512_local0 = true
	end
	return f512_local0
end

function IsStickyImageActive( controller )
	return CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "hudItems.stickyImage" ) == 1
end

function IsArmorOverlayActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local armorImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.armorOverlay" ) )
	local f514_local0 = armorImage
	local f514_local1
	if armorImage == "" or armorImage == "blacktransparent" then
		f514_local1 = false
	else
		f514_local1 = f514_local0 and true
	end
	return f514_local1
end

function ShouldPlayLevelUpHUD( controller )
	return CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "hudItems.shouldUpdateHUDLeveUp" )
end

function IsAnyKillstreakInRangeAvailable( controller, numArgStart, numArgEnd )
	local killstreaksModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks" )
	if not killstreaksModel then
		return false
	end
	for streak = numArgStart, numArgEnd, 1 do
		local killstreakModel = Engine.GetModel( killstreaksModel, "killstreak" .. streak .. ".rewardAmmo" )
		local f516_local2 = killstreakModel
		local streakAvailable = Engine.GetModelValue( killstreakModel )
		local f516_local3 = f516_local2 and streakAvailable
		if f516_local3 ~= nil and f516_local3 > 0 then
			return true
		end
	end
	return false
end

function HigherKillstreakHasAmmo( controller, element )
	local parent = element:getParent()
	local f517_local0 = parent
	local gridInfoTable = parent.gridInfoTable
	local f517_local1 = f517_local0 and gridInfoTable
	if f517_local1 == nil then
		return false
	else
		local index = 3 - f517_local1.zeroBasedIndex
		if index >= 3 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( controller, index + 1, 4 )
		end
	end
end

function LowerKillstreakHasAmmo( controller, element )
	local parent = element:getParent()
	local f518_local0 = parent
	local gridInfoTable = parent.gridInfoTable
	local f518_local1 = f518_local0 and gridInfoTable
	if f518_local1 == nil then
		return false
	else
		local index = 3 - f518_local1.zeroBasedIndex
		if index == 0 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( controller, 0, index - 1 )
		end
	end
end

function EarningTowardsThisKillstreak( controller, element )
	local rewardMomentumModel = Engine.GetModel( Engine.GetModelForController( controller ), "rewardMomentum" )
	local momentumCostModel = Engine.GetModel( element:getModel(), "momentumCost" )
	local killstreaksModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks" )
	if element.gridInfoTable == nil then
		return false
	elseif not momentumCostModel or not rewardMomentumModel or not killstreaksModel then
		return false
	end
	local momentumCost = Engine.GetModelValue( momentumCostModel )
	local rewardMomentum = Engine.GetModelValue( rewardMomentumModel )
	if rewardMomentum == nil or momentumCost == nil or momentumCost < rewardMomentum then
		return false
	end
	local index = 3 - element.gridInfoTable.zeroBasedIndex
	for killstreakIndex = 0, index, 1 do
		local killstreakMomentum = CoD.SafeGetModelValue( killstreaksModel, "killstreak" .. killstreakIndex .. ".momentumCost" )
		if killstreakMomentum and rewardMomentum < killstreakMomentum then
			return killstreakIndex == index
		end
	end
	return false
end

function IsAtLeastHalfGameScore( controller, modelArg )
	local controllerModel = Engine.GetModelForController( controller )
	local f520_local0 = controllerModel
	local scoreLimit = Engine.GetModel( controllerModel, "gameScore.scoreLimit" )
	local f520_local1 = f520_local0 and scoreLimit
	if f520_local1 then
		f520_local1 = Engine.GetModelValue( f520_local1 )
	end
	local f520_local2 = controllerModel
	local model = Engine.GetModel( controllerModel, modelArg )
	local f520_local3 = f520_local2 and model
	local f520_local4 = f520_local3
	local modelValue = Engine.GetModelValue( f520_local3 )
	local f520_local5 = f520_local4 and modelValue
	local f520_local6
	if f520_local1 == nil or f520_local5 == nil or f520_local1 > f520_local5 * 2 then
		f520_local6 = false
	else
		f520_local6 = true
	end
	return f520_local6
end

function IsCursorHintActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local showCursorHint = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.showCursorHint" ) )
	local f521_local0
	if showCursorHint == nil or showCursorHint ~= true then
		f521_local0 = false
	else
		f521_local0 = true
	end
	return f521_local0
end

function IsGameTypeDOA()
	return CoDShared.IsGameTypeDOA()
end

function HideScoreMeterDueToGameType()
	local actualGameType = Engine.GetDvarString( "g_gametype" )
	local f523_local0
	if actualGameType == nil or actualGameType ~= "ctf" and actualGameType ~= "dem" and actualGameType ~= "sd" then
		f523_local0 = false
	else
		f523_local0 = true
	end
	return f523_local0
end

function HideCyberCoreWidget( controller )
	if Engine.GetCurrentMap() == "cp_mi_eth_prologue" and not Engine.IsCampaignModeZombies() then
		local f524_local0 = Engine.GetPlayerStats( controller )
		return f524_local0.highestMapReached:get() == 0
	else
		return false
	end
end

function IsMapName( stringMap )
	return Engine.GetCurrentMap() == stringMap
end

function ShouldShowWaypointFrame( controller, self )
	if self.objective.neverShowProgress == 1 then
		return false
	else
		local myTeam = Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) )
		local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, self.objId, myTeam )
		local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, self.objId, myTeam )
		local playerUsing = CoD.HUDUtility.IsPlayerUsingWaypoint( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
		if not playerUsing and self.objective.alwaysShowProgress ~= 1 then
			return false
		else
			local f526_local0 = isPlayerTeamUsing
			local contested = isAnyOtherTeamUsing
			if f526_local0 and contested then
				return true
			else
				local progress = CoD.SafeGetModelValue( self:getModel(), "progress" )
				return progress and progress > 0
			end
		end
	end
end

function ShouldShowWaypointAsContested( controller, self )
	if GetObjectiveProperty( "neverShowContestedBorder", self.objective.id ) == 1 then
		return false
	else
		local myTeam = Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) )
		local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, self.objId, myTeam )
		local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, self.objId, myTeam )
		local f527_local0 = isPlayerTeamUsing
		local f527_local1 = isAnyOtherTeamUsing
		local contested = not self.never_contested
		return f527_local1 and f527_local0 and contested
	end
end

function ShouldShowWaypointAsPulsing( controller, self )
	local parent = self:getParent()
	if not parent or not parent.objective or parent.objective.pulse ~= 1 or not parent.objId then
		return false
	end
	local myTeam = Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) )
	local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, parent.objId, myTeam )
	local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, parent.objId, myTeam )
	local playerUsing = CoD.HUDUtility.IsPlayerUsingWaypoint( parent, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	if playerUsing then
		return false
	end
	local teamsUsing = Engine.ObjectiveGetTeamUsingCount( controller, parent.objId )
	local progress = CoD.SafeGetModelValue( parent:getModel(), "progress" )
	local f528_local0
	if progress == nil or progress <= 0 or teamsUsing ~= 1 then
		f528_local0 = false
	else
		f528_local0 = true
	end
	return f528_local0
end

function ShouldHideWaypoint( element, controller )
	if element.objective then
		if not IsObjectiveVisibleForMyTeam( controller, element.objId ) then
			return true
		elseif element.objective.requiredspecialty ~= "None" then
			if not Engine.PlayerHasPerkForName( controller, element.objective.requiredspecialty ) then
				if element.objective.requiredspecialty_invert == 0 then
					return true
				end
			elseif element.objective.requiredspecialty_invert == 1 then
				return true
			end
		end
		if element.objective.hideWhenPlayerIsWaypointEntity == 1 then
			return Engine.GetPredictedClientNum( controller ) == Engine.GetObjectiveEntity( controller, element.objId )
		elseif element.objective.requiredweapon ~= nil and element.objective.requiredweapon ~= "" and not Engine.PlayerHasWeaponForName( controller, element.objective.requiredweapon ) then
			return true
		end
	end
	local elementModel = element:getModel()
	if CoD.SafeGetModelValue( elementModel, "state" ) == Enum.objectiveState_t.OBJST_INVISIBLE then
		return true
	end
	return false
end

function ShouldShowMovie( controller )
	local mapName = Engine.GetCurrentMap()
	if CoD.isZombie then
		if Engine.IsDemoPlaying() or Engine.IsSplitscreen() then
			return false
		elseif Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
			local movie = CoD.BaseUtility.GetMapValue( mapName, "introMovie" )
			if movie ~= nil and not Engine.IsCinematicPlaying() then
				Engine.StartLoadingCinematic( movie )
			end
			return true
		else
			return false
		end
	elseif Dvar.ui_useloadingmovie:get() == true or CoD.isCampaign then
		if Engine.IsCampaignModeZombies() == true then
			mapName = mapName .. "_nightmares"
		end
		local movie = CoD.BaseUtility.GetMapValue( mapName, "introMovie" )
		if mapName ~= nil and mapName == "cp_sh_singapore" and Dvar.cp_queued_level:get() == "cp_mi_sing_blackstation" then
			movie = "CP_safehouse_load_loadingmovie"
		end
		if movie ~= nil and not Engine.IsCinematicPlaying() then
			Engine.StartLoadingCinematic( movie )
		end
		Engine.SetDvar( "ui_useloadingmovie", 0 )
	end
	if Dvar.art_review:get() ~= "1" and (CoD.isCampaign or CoD.isZombie) and Engine.IsCinematicStarted() then
		return true
	end
	return false
end

function IsRightStickInDegreeRange( controller, exprRangeStart, exprRangeEnd )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "RightStick.Degrees" )
	local f531_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f531_local1 = f531_local0 and modelValue
	local f531_local2
	if f531_local1 == nil or exprRangeStart >= f531_local1 or f531_local1 >= exprRangeEnd then
		f531_local2 = false
	else
		f531_local2 = true
	end
	return f531_local2
end

function HasRoundLimit( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local roundLimitModel = Engine.CreateModel( perControllerModel, "gameScore.roundLimit" )
	local roundLimit = Engine.GetModelValue( roundLimitModel )
	return roundLimit > 0
end

function IsSingleRound( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local roundLimitModel = Engine.CreateModel( perControllerModel, "gameScore.roundLimit" )
	local roundLimit = Engine.GetModelValue( roundLimitModel )
	return roundLimit == 1
end

function HasScoreLimit( controller )
	local gameType = Engine.GetCurrentGameType()
	if gameType == "infil" then
		return false
	elseif gameType == "strong" and Engine.GetGametypeSetting( "neutralZone" ) == 0 then
		return false
	end
	local scoreLimitModel = Engine.CreateModel( Engine.GetModelForController( controller ), "gameScore.scoreLimit" )
	local scoreLimit = scoreLimitModel:get()
	local f534_local0
	if scoreLimit == nil or scoreLimit <= 0 then
		f534_local0 = false
	else
		f534_local0 = true
	end
	return f534_local0
end

function IsYourTeamWinning( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local yourScoreModel = Engine.CreateModel( perControllerModel, "gameScore.yourScore" )
	local yourScore = Engine.GetModelValue( yourScoreModel )
	local enemyScoreModel = Engine.CreateModel( perControllerModel, "gameScore.enemyScore" )
	local enemyScore = Engine.GetModelValue( enemyScoreModel )
	if enemyScore and yourScore then
		return enemyScore < yourScore
	else
		
	end
end

function IsYourTeamLosing( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local yourScoreModel = Engine.CreateModel( perControllerModel, "gameScore.yourScore" )
	local yourScore = Engine.GetModelValue( yourScoreModel )
	local enemyScoreModel = Engine.CreateModel( perControllerModel, "gameScore.enemyScore" )
	local enemyScore = Engine.GetModelValue( enemyScoreModel )
	if enemyScore and yourScore then
		return yourScore < enemyScore
	else
		
	end
end

function IsZombieRoundEqualTo( element, controller, expressionArg )
	IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + expressionArg )
end

function IsZombieRoundOnesDigitEqualTo( element, controller, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, "roundsPlayed" )
	end
	local f538_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f538_local1 = f538_local0 and modelValue
	if f538_local1 == nil then
		return false
	else
		return (f538_local1 - Engine.GetGametypeSetting( "startRound" )) % 10 == expressionArg
	end
end

function IsZombieRoundTensDigitEqualTo( element, controller, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, "roundsPlayed" )
	end
	local f539_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f539_local1 = f539_local0 and modelValue
	if f539_local1 == nil then
		return false
	else
		f539_local1 = f539_local1 - Engine.GetGametypeSetting( "startRound" )
		local ones = f539_local1 % 10
		local tens = (f539_local1 % 100 - ones) / 10
		return tens == expressionArg
	end
end

function IsZombieRoundHundredsDigitEqualTo( element, controller, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, "roundsPlayed" )
	end
	local f540_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f540_local1 = f540_local0 and modelValue
	if f540_local1 == nil then
		return false
	else
		f540_local1 = f540_local1 - Engine.GetGametypeSetting( "startRound" )
		local tensAndOnes = f540_local1 % 100
		local hundreds = (f540_local1 % 1000 - tensAndOnes) / 100
		return hundreds == expressionArg
	end
end

function IsParentListInFocus( element )
	if element.gridInfoTable then
		local parentGrid = element.gridInfoTable.parentGrid
		if parentGrid and parentGrid.hasListFocus then
			return true
		end
	end
	return false
end

function IsDisabled( element, controller )
	local disabledFunctionModel = element:getModel( controller, "disabledFunction" )
	if disabledFunctionModel then
		local disabledFunction = Engine.GetModelValue( disabledFunctionModel )
		if disabledFunction then
			element.disabled = disabledFunction()
			return disabledFunction()
		end
	end
	local disabledModel = element:getModel( controller, "disabled" )
	if disabledModel then
		element.disabled = Engine.GetModelValue( disabledModel )
	end
	return element.disabled
end

function IsEnabledByGametypeSetting( element, controller )
	if element.enabledWithGametypeSetting ~= nil then
		return Engine.GetGametypeSetting( element.enabledWithGametypeSetting ) == 1
	else
		return true
	end
end

function IsSelected( element, controller )
	local selectedModel = element:getModel( controller, "selected" )
	if selectedModel then
		element.selected = Engine.GetModelValue( selectedModel )
	end
	return element.selected
end

function IsOddIndexItem( element )
	local parent = element:getParent()
	if parent == nil or parent.gridInfoTable == nil or parent.gridInfoTable.zeroBasedIndex == nil then
		return false
	else
		return parent.gridInfoTable.zeroBasedIndex % 2 == 1
	end
end

function IsStartMenuItemEquipped( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local itemIndex = CoD.SafeGetModelValue( elementModel, "itemIndex" )
		if itemIndex then
			return CoD.perController[controller].startMenu_equippedIndex == itemIndex
		end
	end
	return false
end

function ListHasElements( self )
	local f547_local0
	if self.layoutItems == nil or #self.layoutItems <= 0 then
		f547_local0 = false
	else
		f547_local0 = true
	end
	return f547_local0
end

function IsFirstItem( self )
	return self.isFirstItem and self:isFirstItem()
end

function IsLastItem( self )
	return self.isLastItem and self:isLastItem()
end

function ShouldDisplayButton( element, controller )
	local iconModel = element:getModel( controller, "tabIcon" )
	if iconModel then
		return Engine.GetModelValue( iconModel ) ~= ""
	else
		return false
	end
end

function IsHeroLocked( element, controller )
	local elementModel = element:getModel()
	local disabled = CoD.SafeGetModelValue( elementModel, "disabled" )
	if disabled then
		return true
	else
		return false
	end
end

function CanSelectContractHeroItem( element, controller )
	if IsHeroLocked( element, controller ) then
		return false
	end
	local f552_local0 = IsSelfModelValueTrue( element, controller, "isActivated" )
	if not f552_local0 then
		f552_local0 = IsSelfModelValueGreaterThan( element, controller, "contractsRemaining", 0 )
	end
	return f552_local0
end

function CanSelfWidgetSelectContractHeroItem( self, controller )
	return CanSelectContractHeroItem( self, controller )
end

function IsHeroWeaponAbilityNotAvailable( element, controller )
	return IsLive() and f554_local0 or isFirstTimeSetup
end

function IsHeroOnDisabledLoadoutItem( element )
	return element.disabled
end

function IsSmallHeroCategory( element )
	return element.categorySize == CoD.PlayerRoleUtility.Heroes.SmallCategory
end

function IsEdittingHeroOption( menu )
	return menu.currentMode ~= CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.ExploringOptions
end

function IsExploringTaunts( menu )
	return menu.currentMode == CoD.PlayerRoleUtility.TauntsData.Modes.ExploringTaunts
end

function IsEdittingTaunt( menu )
	return menu.currentMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingTaunt
end

function IsEdittingGestureOption( menu )
	return menu.currentMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingGesture
end

function IsEdittingGestureType( enumValue )
	return CoD.PlayerRoleUtility.TauntsData.EdittingTauntOrGestureType == enumValue
end

function CurrentPlayerHasGesture( controller, enumValue )
	local sessionMode = Engine.CurrentSessionMode()
	local selectedCharacter = Engine.GetEquippedHero( controller, sessionMode )
	local selectedGesture = Engine.GetSelectedGestureForHero( controller, sessionMode, selectedCharacter, enumValue )
	local heroData = Engine.GetHeroBundleInfo( sessionMode, selectedCharacter )
	return CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, enumValue, selectedGesture ) ~= ""
end

function CurrentPlayerHasAnyGesture( controller )
	local sessionMode = Engine.CurrentSessionMode()
	local selectedCharacter = Engine.GetEquippedHero( controller, sessionMode )
	local heroData = Engine.GetHeroBundleInfo( sessionMode, selectedCharacter )
	for i = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		local selectedGesture = Engine.GetSelectedGestureForHero( controller, sessionMode, selectedCharacter, i )
		if CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, i, selectedGesture ) ~= "" then
			return true
		end
	end
	return false
end

function IsHeroColorOption( element )
	return element.isColorOption
end

function IsLoadoutSelectionSlot( element )
	return element.equippedSlot ~= nil
end

function FirstTimeSetup_IsActive( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState ~= CoD.PlayerRoleUtility.FirstTimeFlowState.None
end

function FirstTimeSetup_Overview( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState == CoD.PlayerRoleUtility.FirstTimeFlowState.Overview
end

function FirstTimeSetup_ChangedCharacter( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState == CoD.PlayerRoleUtility.FirstTimeFlowState.SelectionChanged
end

function FirstTimeSetup_Complete( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState == CoD.PlayerRoleUtility.FirstTimeFlowState.Complete
end

function HeroUsingWeapon( self, controller )
	if self.equippedSlot then
		return self.equippedSlot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
	else
		local equippedModel = self:getModel( controller, "equippedSlot" )
		if equippedModel then
			return Engine.GetModelValue( equippedModel ) == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
		else
			return false
		end
	end
end

function IsEdittingLoadoutForHero()
	return CoD.PlayerRoleUtility.Heroes.edittingLoadoutForWidget ~= nil
end

function IsCurrentEdittingLoadForHeroWidget( self )
	return CoD.PlayerRoleUtility.Heroes.edittingLoadoutForWidget == self
end

function IsCurrentSelectedHeroOption( self, controller )
	local optionIndexModel = self:getModel( controller, "optionIndex" )
	if optionIndexModel then
		local optionIndex = Engine.GetModelValue( optionIndexModel )
		if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				return optionIndex == CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				return optionIndex == CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			return optionIndex == CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			return optionIndex == CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet + 1
		end
	end
	return false
end

function IsCurrentLockedHeroOption( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local isLockedModel = Engine.GetModel( elementModel, "isLocked" )
		if isLockedModel then
			return Engine.GetModelValue( isLockedModel )
		end
	end
	return false
end

function IsCurrentNewHeroOption( self, element, controller )
	if (IsCampaign() or IsMultiplayer()) and IsProgressionEnabled( controller ) then
		local optionIndexModel = element:getModel( controller, "optionIndex" )
		if optionIndexModel then
			local optionIndex = Engine.GetModelValue( optionIndexModel )
			local characterIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
			local characterItemType = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea
			if characterIndex ~= nil and characterItemType ~= nil then
				return Engine.IsCharacterCustomizationItemNew( controller, characterIndex, characterItemType, optionIndex )
			end
		end
	end
	return false
end

function ShouldDisplayHeroItemGroupBreadcrumbCount( self, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local breadcrumbWeaponCountModel = self:getModel( controller, "breadcrumbCount" )
		if breadcrumbWeaponCountModel then
			local breadcrumbCount = Engine.GetModelValue( breadcrumbWeaponCountModel )
			return breadcrumbCount > 0
		else
			return false
		end
	end
end

function ShouldHideItemHeroOption( element, controller )
	if not IsMultiplayer() or not IsProgressionEnabled( controller ) then
		return true
	elseif CoD.SafeGetModelValue( element:getModel(), "isColorOption" ) == true then
		return true
	end
	local elementModel = element:getModel()
	if elementModel then
		local optionIndex = CoD.SafeGetModelValue( elementModel, "optionIndex" )
		if optionIndex == 1 then
			return true
		elseif IsSelfModelValueTrue( element, controller, "isClassified" ) or not IsSelfModelValueNilOrZero( element, controller, "isBMClassified" ) then
			return true
		end
	end
	return false
end

function IsCurrentTauntNew( self, element, controller )
	if element.index and element.xanim and element.tauntType then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		return Engine.IsTauntNew( controller, mode, heroIndex, element.tauntType, element.index, element.xanim )
	else
		return false
	end
end

function IsCurrentGestureNew( self, element, controller )
	if element.index and element.xanim and element.heroName and element.gestureType then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		if element.xanim ~= "" then
			return Engine.IsGestureNew( controller, mode, heroIndex, element.gestureType, element.index, element.xanim .. ";" .. element.heroName )
		end
	end
	return false
end

function AreAnyTauntsGesturesInListNew( self, element, controller )
	local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	local heroData = Engine.GetHeroBundleInfo( CoD.PlayerRoleUtility.customizationMode, heroIndex )
	local mode = CoD.PlayerRoleUtility.customizationMode
	if self.tauntType then
		for i = 0, CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroData, self.tauntType ) - 1, 1 do
			local XAnimName = CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroData, self.tauntType, i )
			if Engine.IsTauntNew( controller, mode, heroIndex, self.tauntType, i, XAnimName ) then
				return true
			end
		end
	elseif self.gestureType then
		local heroList = Engine.GetHeroList( mode )
		local heroName = ""
		for _, hero in ipairs( heroList ) do
			if hero.bodyIndex == heroIndex then
				heroName = hero.assetName
				break
			end
		end
		for i = 0, CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroData, self.gestureType ) - 1, 1 do
			local XAnimName = CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, self.gestureType, i )
			if XAnimName ~= "" and Engine.IsGestureNew( controller, mode, heroIndex, self.gestureType, i, XAnimName .. ";" .. heroName ) then
				return true
			end
		end
	end
	return false
end

function IsObjectiveActive( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		local f581_local0
		if Engine.GetModelValue( statusModel ) ~= "current" and Engine.GetModelValue( statusModel ) ~= "active" then
			f581_local0 = false
		else
			f581_local0 = true
		end
		return f581_local0
	else
		return false
	end
end

function IsObjectiveComplete( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		return Engine.GetModelValue( statusModel ) == "done"
	else
		return false
	end
end

function IsObjectiveFailed( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		return Engine.GetModelValue( statusModel ) == "failed"
	else
		return false
	end
end

function IsObjectiveDescription( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		return Engine.GetModelValue( statusModel ) == "description"
	else
		return false
	end
end

function IsObjectiveRequirementLabelHidden( element, controller )
	local activeObjectiveID = Engine.GetModel( Engine.GetModelForController( controller ), "interactivePrompt.activeObjectiveID" )
	if activeObjectiveID then
		activeObjectiveID = Engine.GetModelValue( activeObjectiveID )
	end
	if activeObjectiveID and element.objId == activeObjectiveID then
		return false
	elseif element.objId then
		local myTeam = Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) )
		local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, element.objId, myTeam )
		local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, element.objId, myTeam )
		if CoD.HUDUtility.IsPlayerUsingWaypoint( element, controller, isPlayerTeamUsing, isAnyOtherTeamUsing ) then
			return false
		end
	end
	return true
end

function IsListSelectionMode( menu, expressionArg )
	return menu.currentMode == expressionArg
end

function IsAttachmentEqualTo( self, element, controller, attachment )
	local elementModel = element:getModel()
	if elementModel then
		local attachmentIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "itemIndex" ) )
		local attachmentTableIndex = element.attachmentTableIndex
		if attachmentTableIndex == nil and element:getParent() then
			local f587_local0 = element:getParent()
			attachmentTableIndex = f587_local0.attachmentTableIndex
		end
		if Engine.GetAttachmentRefByIndex( attachmentTableIndex ) == attachment then
			return true
		end
	end
	return false
end

function IsEquippedWeaponDW( element, controller, loadoutSlot )
	local classModel = CoD.perController[controller].classModel
	return CoD.CACUtility.DoesWeaponHaveDWInSlot( loadoutSlot, controller, classModel )
end

function IsPaintJobCustomItem( element, controller )
	local currentFilter = DataSources.WeaponOptions.getCurrentFilterItem()
	if currentFilter == "paintjob" then
		local refModel = element:getModel( controller, "ref" )
		if refModel then
			local refName = Engine.GetModelValue( refModel )
			if refName == "paintshop_1" then
				return true
			end
		end
	end
	return false
end

function IsPaintJobCustomListButton( element, controller )
	local typeModel = element:getModel( controller, "type" )
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	if typeModel and paintjobSlotModel and paintjobIndexModel then
		local typeName = Engine.GetModelValue( typeModel )
		local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
		local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
		if typeName == "paintjob" and paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			return true
		end
	end
	return false
end

function IsCPHeroWeapon( self, controller )
	if CoD.isCampaign then
		local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
		local classNum = CoD.perController[controller].classNum
		if self.currentActiveSlot then
			local loadoutSlotName = self.currentActiveSlot
			if loadoutSlotName == loadoutSlotNames.primaryWeapon or loadoutSlotName == loadoutSlotNames.secondaryWeapon then
				local itemIndex = CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotName )
				if CoD.CACUtility.IsCPHeroWeapon( itemIndex ) then
					return true
				end
			end
		end
	end
	return false
end

function IsToggleVariantEnabled()
	return Dvar.gunsmith_enable_toggle_variant:exists() and Dvar.gunsmith_enable_toggle_variant:get()
end

function HasGlobalHintText( controller )
	return DataSources.PerController.hasHintText( controller )
end

function HasHintText( element )
	local model = element:getModel()
	if model then
		local hintTextModel = Engine.GetModel( model, "hintText" )
		if hintTextModel and Engine.GetModelValue( hintTextModel ) ~= "" then
			return true
		end
	end
	return false
end

function PDV_IsDataVaultOpen( controller )
	return CoD.perController[controller].InspectingDataVault == true
end

function PDV_SelectingMap( menu )
	return menu.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_MISSION
end

function PDV_SelectingCollectible( menu )
	return menu.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE
end

function PDV_InspectingCollectible( menu )
	return menu.currentMode == CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE
end

function PDV_SlotHasCollectible( element, controller )
	local slotModel = element:getModel( controller, "collectibleSlot" )
	if slotModel and Engine.GetCollectibleInBunkSlot( controller, Engine.GetModelValue( slotModel ) ) ~= nil then
		return true
	else
		return false
	end
end

function IsGunsmithItemWeaponOptionLocked( menu, element, controller )
	if not IsLive() then
		local unlockSessionMode = GetUnlockSessionMode( element, controller )
		if unlockSessionMode == Enum.eModes.MODE_MULTIPLAYER or unlockSessionMode == Enum.eModes.MODE_ZOMBIES then
			return false
		end
	end
	local weaponOptionSubIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
	if weaponOptionSubIndexModel and weaponOptionTypeModel then
		local statIndex = Engine.GetModelValue( weaponOptionSubIndexModel )
		local groupIndex = Engine.GetModelValue( weaponOptionTypeModel )
		local weaponOptionIndex = Engine.GetWeaponOptionGroupIndex( statIndex, groupIndex )
		if groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			local variantModel = CoD.perController[controller].gunsmithVariantModel
			if variantModel then
				local opticModel = Engine.GetModel( variantModel, "attachment1" )
				if opticModel then
					itemIndex = Engine.GetModelValue( opticModel )
				end
			end
		end
		if (groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO or groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE) and statIndex == 0 then
			return false
		elseif groupIndex == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
			if statIndex == 0 then
				return false
			end
			local ref = Engine.GetAttachmentRef( itemIndex, statIndex )
			for index, attachmentRef in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if ref == attachmentRef then
					return CoD.CACUtility.GetWeaponPLevel( controller, itemIndex ) < index
				end
			end
			return false
		end
		return Engine.IsItemOptionLocked( controller, itemIndex, weaponOptionIndex )
	end
	return false
end

function Gunsmith_OnState( element, controller )
	local paramModel = element:getModel( controller, "param" )
	if paramModel then
		local modelName = Engine.GetModelValue( paramModel )
		if modelName then
			local model = Engine.GetModel( Engine.GetGlobalModel(), modelName )
			if model then
				local value = Engine.GetModelValue( model )
				return value == 1
			end
		end
	end
end

function IsGunsmithCurrentACVEquipped( self, element, controller )
	local attachmentVariantModel = CoD.perController[controller].gunsmithAttachmentVariantModel
	local equippedIndex = Engine.GetModelValue( attachmentVariantModel )
	local variantIndexModel = element:getModel( controller, "variantIndex" )
	if variantIndexModel then
		local variantIndex = Engine.GetModelValue( variantIndexModel )
		return equippedIndex == variantIndex
	else
		return false
	end
end

function IsGunsmithReticleAllowedForOptic( menu, element, controller, param )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if variantModel and param then
		local selectedAttachmentModel = Engine.GetModel( variantModel, param )
		if selectedAttachmentModel then
			local attachmentIndex = Engine.GetModelValue( selectedAttachmentModel )
			local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentIndex )
			if CoD.CACUtility.EmptyItemIndex < attachmentIndex then
				return CoD.CACUtility.attachmentsWithCustReticle[attachmentRef]
			end
		end
	end
	return false
end

function Gunsmith_DoesACVExistForAttachment( menu, element, controller, param )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local weaponIndex = CoD.SafeGetModelValue( variantModel, "weaponIndex" )
	local attachmentIndex = CoD.SafeGetModelValue( variantModel, param )
	if weaponIndex and attachmentIndex then
		local weaponRef = Engine.GetItemRef( weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
		local acvCount = Engine.GetAttachmentCosmeticVariantCountForAttachment( weaponRef, attachmentIndex )
		if acvCount and acvCount > 0 then
			return true
		end
	end
	return false
end

function Gunsmith_DisablePaintjobVariantSlot( element, controller )
	if not Paintjobs_IsEnabled( element, controller ) or IsUserContentRestricted( controller ) then
		return true
	else
		return false
	end
end

function ShouldHidePaintJobOptionInZM( menu, element, controller )
	if not IsLive() or IsUserContentRestricted( controller ) then
		return true
	else
		local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
		if groupName == "weapon_knife" then
			return true
		else
			return false
		end
	end
end

function Gunsmith_IsEnabled( element, controller )
	if IsPlayerAGuest( controller ) then
		return false
	elseif IsIntDvarNonZero( "gunsmith_enabled" ) and IsLive() then
		return true
	else
		return false
	end
end

function Gunsmith_CanSelectCamo( menu, element, controller )
	if element and element:getModel( controller, "locked" ) then
		return not Engine.GetModelValue( element:getModel( controller, "locked" ) )
	else
		return true
	end
end

function Gunsmith_ValidVariantNameEntered( element, controller )
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	local validVariantNameEntered = Engine.GetModelValue( validVariantNameModel )
	if validVariantNameEntered ~= nil and validVariantNameEntered == true then
		element:makeFocusableWithoutResettingNavigation()
		return true
	else
		element:makeNotFocusable()
		return false
	end
end

function Gunsmith_IsVariantOccupied( element, controller )
	local variantIndexModel = Engine.GetModel( element:getModel(), "variantIndex" )
	if variantIndexModel then
		local variantIndex = Engine.GetModelValue( variantIndexModel )
		if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( variantIndex ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsAttachmentEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local attachmentList = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( controller, CoD.perController[controller].gunsmithVariantModel )
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "attachmentIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for index, attachmentID in ipairs( attachmentList ) do
				if attachmentID == itemIndex then
					return true
				end
			end
		end
	end
	return false
end

function Gunsmith_IsItemMutuallyExclusiveWithSelection( element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local attachmentList = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( controller, variantModel )
	local itemIndex = CoD.CACUtility.EmptyItemIndex
	local itemIndexModel = element:getModel( controller, "attachmentIndex" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
		for _, attachmentIndex in ipairs( attachmentList ) do
			if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < attachmentIndex and itemIndex ~= attachmentIndex then
				local attachmentTableItemIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, itemIndex, Enum.eModes.MODE_MULTIPLAYER )
				local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, attachmentIndex, Enum.eModes.MODE_MULTIPLAYER )
				return not Engine.AreAttachmentsCompatible( weaponIndex, attachmentTableItemIndex, attachmentTableAttachmentIndex, Enum.eModes.MODE_MULTIPLAYER )
			end
		end
	end
	return false
end

function Gunsmith_IsAttachmentNew( menu, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "attachmentIndex" )
		if indexModel then
			local attachmentIndex = Engine.GetModelValue( indexModel )
			local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, attachmentIndex )
			return Engine.IsAttachmentNew( controller, weaponIndex, attachmentTableAttachmentIndex )
		end
	end
	return false
end

function Gunsmith_IsCamoEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local variantCamoModel = menu:getModel()
	local variantCamoIndex = Engine.GetModelValue( variantCamoModel )
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local camoIndex = Engine.GetModelValue( indexModel )
			if variantCamoIndex == camoIndex then
				return true
			end
		end
	end
	return false
end

function Gunsmith_IsReticleEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local variantReticleModel = menu:getModel()
	local variantReticleIndex = Engine.GetModelValue( variantReticleModel )
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "weaponOptionSubIndex" )
		if indexModel then
			local reticleIndex = Engine.GetModelValue( indexModel )
			if variantReticleIndex == reticleIndex then
				return true
			end
		end
	end
	return false
end

function Gunsmith_IsCamoNew( menu, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local camoIndex = Engine.GetModelValue( indexModel )
			return Engine.IsWeaponOptionNew( controller, weaponIndex, camoIndex )
		end
	end
	return false
end

function Gunsmith_IsReticleNew( menu, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local elementModel = element:getModel()
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if elementModel and variantModel then
		local weaponOptionIndex = CoD.SafeGetModelValue( elementModel, "weaponOptionSubIndex" )
		local weaponOptionType = CoD.SafeGetModelValue( elementModel, "weaponOptionType" )
		local opticIndex = CoD.SafeGetModelValue( variantModel, "attachment1" )
		if weaponOptionIndex and weaponOptionType and opticIndex then
			local optionItemIndex = Engine.GetWeaponOptionGroupIndex( weaponOptionIndex, weaponOptionType )
			return Engine.IsWeaponOptionNew( controller, opticIndex, optionItemIndex )
		end
	end
	return false
end

function Gunsmith_IsACVItemNew( element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local variantIndex = element.variantIndex
	local attachmentTableIndex = element.attachmentTableIndex
	if CoD.SafeGetModelValue( element:getModel(), "isBMClassified" ) == true then
		return false
	elseif attachmentTableIndex and variantIndex and CoD.CACUtility.EmptyItemIndex < variantIndex then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		return IsACVItemNewHelper( controller, weaponIndex, attachmentTableIndex, variantIndex, mode )
	else
		return false
	end
end

function Gunsmith_AnyOpticsNew( controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewOptics( controller, weaponIndex )
end

function Gunsmith_AnyAttachmentsNew( controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments( controller, weaponIndex )
end

function Gunsmith_AnyCamosNew( controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	return CoD.CraftUtility.Gunsmith.WeaponHasNewCamos( controller, weaponIndex )
end

function Gunsmith_AnyNewItemsForWeapon( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			return CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( controller, itemIndex )
		end
	end
	return false
end

function Gunsmith_AnyNewWeaponsOrAttachmentsForGroupButton( element, controller )
	local categoryModel = Engine.GetModel( element:getModel(), "categoryRef" )
	if categoryModel then
		return CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( controller, Engine.GetModelValue( categoryModel ) )
	else
		return false
	end
end

function Gunsmith_AnyNewWeaponsOrAttachments( controller )
	for index = 1, #CoD.CraftUtility.WeaponGroupNames, 1 do
		local weaponGroup = CoD.CraftUtility.WeaponGroupNames[index].weapon_category
		if CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup( controller, weaponGroup ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsSpecialWeapon( menu, element, controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	local isSpecialWeapon = false
	if groupName == "weapon_launcher" or groupName == "weapon_knife" then
		isSpecialWeapon = true
	end
	return isSpecialWeapon
end

function Gunsmith_IsHandguns( menu, element, controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	if groupName == "weapon_pistol" or groupName == "weapon_special" then
		return true
	else
		return false
	end
end

function Gunsmith_IsSnipers( menu, element, controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	return groupName == "weapon_sniper"
end

function Gunsmith_IsLockedForDemo( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local nameModel = Engine.GetModel( elementModel, "name" )
		if nameModel then
			local name = Engine.GetModelValue( nameModel )
			if name == "MP_CLASSIFIED" then
				return true
			end
		end
	end
	return false
end

function Gunsmith_IsVariantCountEmpty( element, controller )
	local weaponIndexModel = element:getModel( controller, "itemIndex" )
	if weaponIndexModel then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		if weaponIndex > CoD.CACUtility.EmptyItemIndex then
			local totalVariantCount = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( weaponIndex )
			if totalVariantCount <= 0 then
				return false
			end
		end
	end
	return true
end

function Gunsmith_IsSnapshotWeaponLevelMax( self, element, controller )
	local weaponIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller, element )
	if weaponIndex == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	local snapshotSessionMode = CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode()
	local statsStorageType = CoD.CraftUtility.Gunsmith.GetStatsStorageType( snapshotSessionMode )
	local currentWeaponXP = 0
	local gunCurrentRank = Engine.GetGunCurrentRank( controller, weaponIndex, snapshotSessionMode )
	local gunNextRank = Engine.GetGunNextRank( controller, weaponIndex, snapshotSessionMode )
	local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, weaponIndex, snapshotSessionMode )
	local stats = Engine.StorageGetBuffer( controller, statsStorageType )
	if stats then
		currentWeaponXP = stats.ItemStats[weaponIndex].xp:get()
	end
	local f630_local0
	if gunCurrentRank ~= gunNextRank or currentWeaponXPReq > currentWeaponXP then
		f630_local0 = false
	else
		f630_local0 = true
	end
	return f630_local0
end

function Gunsmith_IsSnapshotGunLevelExists( self, element, controller )
	local weaponIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller, element )
	if Engine.IsCampaignGame() then
		local f631_local0 = CoD.CACUtility.GetAttachments( weaponIndex )
		if f631_local0 then
			f631_local0 = #CoD.CACUtility.GetAttachments( weaponIndex ) > 0
		end
		local f631_local1
		if weaponIndex ~= CoD.CACUtility.EmptyItemIndex then
			f631_local1 = f631_local0
		else
			f631_local1 = false
		end
		return f631_local1
	else
		return weaponIndex ~= CoD.CACUtility.EmptyItemIndex
	end
end

function Gunsmith_IsNewVariant( controller )
	if CoD.perController[controller].emptyVariantSelected and CoD.perController[controller].emptyVariantSelected == true then
		return true
	else
		return false
	end
end

function Gunsmith_IsCurrentVariantChanged( controller )
	if not Gunsmith_IsNewVariant( controller ) then
		local variantModel = CoD.perController[controller].gunsmithVariantModel
		if variantModel and CoD.CraftUtility.Gunsmith.IsCurrentVariantChanged( controller, variantModel ) then
			return true
		end
	end
	return false
end

function IsAttachmentLockedInWeaponBuildKits( element, controller )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
		local attachmentIndexModel = element:getModel( controller, "attachmentIndex" )
		if itemIndex and attachmentIndexModel then
			local attachmentIndex = Engine.GetModelValue( attachmentIndexModel )
			local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( itemIndex, attachmentIndex, Enum.eModes.MODE_ZOMBIES )
			return Engine.IsItemAttachmentLocked( controller, itemIndex, attachmentTableAttachmentIndex )
		else
			
		end
	end
end

function IsAttachmentSlotLocked( element, controller, expressionArg )
	if IsZombies() and not IsProgressionEnabled( controller ) then
		return false
	end
	local itemIndexModel = element:getModel( controller, "weaponIndex" )
	if not itemIndexModel then
		return false
	end
	local itemIndex = Engine.GetModelValue( itemIndexModel )
	local returnValue = Engine.IsAttachmentSlotLocked( controller, itemIndex, expressionArg )
	if returnValue == nil then
		returnValue = false
	end
	return returnValue
end

function IsGridOn( controller, flagName )
	return Engine.GetProfileVarInt( controller, flagName ) ~= 0
end

function Paintjobs_IsOccupied( element, controller )
	local slotModel = Engine.GetModel( element:getModel(), "paintjobSlot" )
	local paintjobIndexModel = Engine.GetModel( element:getModel(), "paintjobIndex" )
	if slotModel and paintjobIndexModel then
		local slot = Engine.GetModelValue( slotModel )
		local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
		if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( slot, paintjobIndex ) then
			return true
		end
	end
	return false
end

function Paintjobs_DisableGroupsFeature()
	return Dvar.ui_emblemDisableGroups.exists() and Dvar.ui_emblemDisableGroups:get()
end

function Paintjobs_IsCountGreaterThanZero( element, controller )
	local weaponIndexModel = element:getModel( controller, "itemIndex" )
	if weaponIndexModel then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		if weaponIndex > CoD.CACUtility.EmptyItemIndex then
			local paintjobCount = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( weaponIndex )
			if paintjobCount <= 0 then
				return false
			end
		end
	end
	return true
end

function Paintjobs_IsEnabled( element, controller )
	if IsSplitscreenSafehouse() then
		return false
	elseif IsPlayerAGuest( controller ) then
		return false
	elseif IsLive() then
		return true
	else
		return false
	end
end

function IsGroupSlotAvailable( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsUsedModel = Engine.GetModel( perControllerModel, "Emblem.EmblemProperties.groupsUsed" )
	local isSlotAvailable = false
	if groupsUsedModel then
		isSlotAvailable = Engine.GetModelValue( groupsUsedModel ) < Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS - 1
	end
	return isSlotAvailable
end

function IsEmptyLayerAvailable( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local layersUsedModel = Engine.GetModel( perControllerModel, "Emblem.EmblemProperties.layersUsed" )
	local isEmptyLayerAvailable = false
	local totalLayers = CoD.perController[controller].totalLayers
	if layersUsedModel then
		isEmptyLayerAvailable = Engine.GetModelValue( layersUsedModel ) < totalLayers
	end
	return isEmptyLayerAvailable
end

function BrowseModeLinkedLayer( self, element, controller )
	local f643_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f643_local0 then
		f643_local0 = Emblems_IsLayerLinked( element, controller )
		if f643_local0 then
			f643_local0 = IsModelValueGreaterThanOrEqualTo( controller, "Emblem.EmblemProperties.linkedLayerCount", 2 )
			if f643_local0 then
				if not Emblem_IsLayerGrouped( element, controller ) then
					f643_local0 = IsGroupSlotAvailable( controller )
					if f643_local0 then
						f643_local0 = not Paintjobs_DisableGroupsFeature()
					end
				else
					f643_local0 = false
				end
			end
		end
	end
	return f643_local0
end

function BrowseModeGroupedLayer( self, element, controller )
	local f644_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
	if f644_local0 then
		f644_local0 = Emblem_IsLayerGrouped( element, controller )
		if f644_local0 then
			local returnValue = not Paintjobs_DisableGroupsFeature()
		end
	end
	return f644_local0
end

function BrowseModeOneLayerLinked( self, element, controller )
	local f645_local0 = IsBrowseMode( controller )
	if f645_local0 then
		if not IsLayerEmpty( self, element, controller ) then
			f645_local0 = Emblems_IsLayerLinked( element, controller )
			if f645_local0 then
				f645_local0 = not Paintjobs_DisableGroupsFeature()
			end
		else
			f645_local0 = false
		end
	end
	return f645_local0
end

function BrowseMode( self, element, controller )
	local f646_local0 = IsBrowseMode( controller )
	if f646_local0 then
		if not IsLayerEmpty( self, element, controller ) then
			f646_local0 = not Paintjobs_DisableGroupsFeature()
		else
			f646_local0 = false
		end
	end
	return f646_local0
end

function GroupsDisabledMode( self, element, controller )
	local f647_local0 = Paintjobs_DisableGroupsFeature()
	if f647_local0 then
		f647_local0 = IsBrowseMode( controller )
		if f647_local0 then
			local returnValue = not IsLayerEmpty( self, element, controller )
		end
	end
	return f647_local0
end

function IsUserContentRestricted( controller )
	return Engine.IsUserContentRestricted( controller )
end

function IsSplitscreenSafehouse()
	if CoD.isSafehouse and Engine.IsSplitscreen() then
		return true
	else
		return false
	end
end

function IsPaintshopButtonDisabled( controller )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( controller )
	end
end

function IsDataVaultEmblemButtonDisabled( controller )
	if IsSplitscreenSafehouse() then
		return true
	else
		return Engine.IsUserContentRestricted( controller )
	end
end

function CraftItemIsReadOnly( element, controller )
	local readOnlyModel = Engine.GetModel( element:getModel(), "readOnly" )
	if readOnlyModel then
		local readOnly = Engine.GetModelValue( readOnlyModel )
		if readOnly == 1 then
			return true
		end
	end
	return false
end

function Challenges_IsCategoryLocked( element, controller, categoryArg )
	local gameModeInfo = CoD.ChallengesUtility.GetGameModeInfo()
	if not gameModeInfo then
		return returnTable
	end
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, gameModeInfo.index )
	local rank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local plevel = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local unlockRank, unlockPLevel = nil
	local challengeInfo = Engine.GetChallengeInfoForImages( controller, categoryArg, gameModeInfo.index )
	if #challengeInfo == 0 then
		if element ~= nil then
			element:processEvent( {
				name = "set_unlock_instructions",
				rank = rank,
				plevel = plevel,
				unlockRank = unlockRank,
				unlockPLevel = unlockPLevel,
				mode = gameModeInfo.index
			} )
		end
		return true
	end
	for _, currInfo in ipairs( challengeInfo ) do
		if currInfo.currentChallengeRow ~= nil then
			return false
		end
		local challengeRow = currInfo.challengeRow
		if challengeRow ~= nil then
			local tableName = "gamedata/stats/" .. gameModeInfo.name .. "/statsmilestones" .. currInfo.tableNum + 1 .. ".csv"
			local rowUnlockRank = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.UnlockRankCol ) )
			local rowUnlockPLevel = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.UnlockPLevelCol ) )
			if rowUnlockRank == nil then
				rowUnlockRank = 0
			end
			if rowUnlockPLevel == nil then
				rowUnlockPLevel = 0
			end
			if unlockRank == nil or unlockPLevel == nil then
				unlockRank = rowUnlockRank
				unlockPLevel = rowUnlockPLevel
			end
			if rowUnlockRank < unlockRank then
				unlockRank = rowUnlockRank
			end
			if rowUnlockPLevel < unlockPLevel then
				unlockPLevel = rowUnlockPLevel
			end
		end
	end
	if unlockRank <= rank and unlockPLevel <= plevel then
		return false
	elseif element ~= nil then
		element:processEvent( {
			name = "set_unlock_instructions",
			rank = rank,
			plevel = plevel,
			unlockRank = unlockRank,
			unlockPLevel = unlockPLevel,
			mode = gameModeInfo.index
		} )
	end
	return true
end

function Challenges_MP_IsDarkOpsAvailable( element, controller )
	local challengeInfo = Engine.GetChallengeInfoForImages( controller, "darkops", Enum.eModes.MODE_MULTIPLAYER )
	for _, currInfo in ipairs( challengeInfo ) do
		if not currInfo.isLocked then
			return true
		end
	end
	return false
end

function IsPercentTextAt100Percent( expressionArg_text )
	if type( expressionArg_text ) ~= "string" then
		return false
	else
		return expressionArg_text == Engine.Localize( "MPUI_PERCENT", 100 )
	end
end

function TextHeightGreaterThan( self, elementName, expressionArg )
	if self[elementName] == nil then
		return false
	else
		local textWidth, textHeight = self[elementName]:getTextWidthAndHeight()
		return expressionArg < textHeight
	end
end

function Emblems_CanEnterEmblemEditor( element, controller )
	if not CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_EMBLEMS ) then
		return true
	elseif not IsPreBuiltEmblemTab( controller ) then
		return true
	else
		return false
	end
end

function Emblems_IsDefaultEmblemEquipped( menu, element, controller )
	local emblemIndexModel = element:getModel( controller, "emblemIndex" )
	if emblemIndexModel then
		local emblemIndex = Engine.GetModelValue( emblemIndexModel )
		local selectedDefaultEmblemIndex = Engine.GetProfileVarInt( controller, "default_emblem_index" )
		if selectedDefaultEmblemIndex ~= CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX and selectedDefaultEmblemIndex == emblemIndex then
			return true
		end
	end
	return false
end

function Emblem_IsOccupied( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local emblemIndexModel = Engine.GetModel( element:getModel(), "emblemIndex" )
		if emblemIndexModel then
			local emblemIndex = Engine.GetModelValue( emblemIndexModel )
			if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( emblemIndex ) then
				return true
			end
		end
	end
	return false
end

function Emblems_IsEnabled( element, controller )
	if IsPlayerAGuest( controller ) then
		return false
	else
		return true
	end
end

function CommunityOptionsEnabled()
	return true
end

function Emblems_IsLayerLinked( element, controller )
	local isLinkedModel = element:getModel( controller, "isLinked" )
	if isLinkedModel then
		local isLayerLinked = Engine.GetModelValue( isLinkedModel )
		return isLayerLinked
	else
		return false
	end
end

function Emblem_IsLayerGrouped( element, controller )
	local isGroupedModel = element:getModel( controller, "isGrouped" )
	if isGroupedModel then
		return Engine.GetModelValue( isGroupedModel )
	else
		return false
	end
end

function Emblem_IsLayerGroupedByLayerIndex( element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	if CoD.perController[controller].selectedLayerIndex ~= nil then
		local layerIndex = CoD.perController[controller].selectedLayerIndex
		local layerData = Engine.GetSelectedLayerData( controller, layerIndex, customizationType )
		return layerData.isGrouped
	else
		return false
	end
end

function IsEmblemEmpty( controller )
	local totalLayers = CoD.perController[controller].totalLayers
	local customizationType = CoD.GetCustomization( controller, "type" )
	return Engine.IsEmblemEmpty( controller, customizationType, totalLayers )
end

function Emblem_IsAnyLayerEmpty( controller )
	local totalLayers = CoD.perController[controller].totalLayers
	local customizationType = CoD.GetCustomization( controller, "type" )
	local totalUsedLayers = Engine.GetUsedLayerCount( controller, customizationType, totalLayers )
	if totalLayers == totalUsedLayers then
		return false
	else
		return true
	end
end

function IsPaintjobAllSidesEmpty( controller )
	local totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	local isLeftSideEmpty = Engine.IsEmblemEmpty( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, totalLayers )
	local isTopSideEmpty = Engine.IsEmblemEmpty( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP, totalLayers )
	local isRightSideEmpty = Engine.IsEmblemEmpty( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT, totalLayers )
	local f667_local0 = isLeftSideEmpty
	local f667_local1 = isTopSideEmpty
	local isPaintjobEmpty = isRightSideEmpty
	return f667_local1 and f667_local0 and isPaintjobEmpty
end

function IsLayerEmpty( self, element, controller )
	if self.layerCarousel ~= nil then
		local row = self.layerCarousel.currentStartRow
		local column = self.layerCarousel.currentStartColumn
		element = self.layerCarousel.layoutItems[row][column]
	end
	if element then
		local layerIndexModel = element:getModel( controller, "layerIndex" )
		if not layerIndexModel then
			return true
		else
			local index = Engine.GetModelValue( layerIndexModel )
			local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, index )
			if selectedLayerIconID == CoD.CraftUtility.EMBLEM_INVALID_ID then
				return true
			else
				return false
			end
		end
	else
		return true
	end
end

function IsEditMode( controller )
	local customizationEditorMode = CoD.GetEditorProperties( controller, "editorMode" )
	return customizationEditorMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT
end

function IsBrowseMode( controller )
	local customizationEditorMode = CoD.GetEditorProperties( controller, "editorMode" )
	return customizationEditorMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
end

function IsClipboardEmpty( controller )
	return CoD.GetEditorProperties( controller, "isClipboardEmpty" ) == CoD.CraftUtility.EMBLEM_CLIPBOARDSTATE.EMPTY
end

function IsClipboardEmblemGrouped( controller )
	return Engine.IsClipboardEmblemGrouped()
end

function Emblem_HideClipboard( element, controller )
	local editorMode = CoD.GetEditorProperties( controller, "editorMode" )
	if editorMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT then
		return true
	elseif IsClipboardEmpty( controller ) then
		return true
	else
		return false
	end
end

function Emblem_CanPastFromClipboard( element, controller )
	local editorMode = CoD.GetEditorProperties( controller, "editorMode" )
	local isGroupSlotAvailable = IsGroupSlotAvailable( controller )
	local isClipboardEmblemGrouped = IsClipboardEmblemGrouped( controller )
	if editorMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE then
		if not isClipboardEmblemGrouped then
			return true
		elseif isClipboardEmblemGrouped and isGroupSlotAvailable then
			return true
		end
	end
	return false
end

function IsSelectedColorEmpty( element, controller )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
	local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
	if colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 and isColor0NoColor == 1 then
		return true
	elseif colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 and isColor1NoColor == 1 then
		return true
	else
		return false
	end
end

function Emblems_IsIconNew( element, controller )
	local iconID = CoD.SafeGetModelValue( element:getModel(), "iconID" )
	local iconType = CoD.CraftUtility.GetDecalCategoryTypeByID( CoD.perController[controller].selectedDecalCategory )
	if iconID and iconType and iconType == "BLACKMARKET" then
		return Engine.IsEmblemIconNew( controller, iconID )
	else
		return false
	end
end

function Emblems_IsAnyEmblemNew( controller )
	return CoD.CraftUtility.Emblems.IsAnyEmblemNew( controller )
end

function Emblems_IsEmblemNew( element, controller )
	local emblemIndex = CoD.SafeGetModelValue( element:getModel(), "emblemIndex" )
	if emblemIndex then
		return CoD.CraftUtility.Emblems.IsEmblemNew( controller, emblemIndex, CoD.perController[controller].selectedEmblemTabStorageType )
	else
		return false
	end
end

function Emblems_IsMaterialNew( element, controller )
	local materialID = CoD.SafeGetModelValue( element:getModel(), "materialID" )
	local materialType = CoD.CraftUtility.GetMaterialCategoryTypeByID( CoD.perController[controller].selectedMaterialCategory )
	if materialID and materialType and materialType ~= "general" then
		return CoD.CraftUtility.Emblems.IsMaterialNew( controller, materialID )
	else
		return false
	end
end

function CallingCards_IsEnabled( element, controller )
	if IsPlayerAGuest( controller ) then
		return false
	else
		return true
	end
end

function CallingCards_IsDataDownloaded( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local dataDownloadedModel = Engine.GetModel( perControllerModel, "CallingCardsIdentity.DataDownloaded" )
	local dataDownloaded = false
	if dataDownloadedModel then
		dataDownloaded = Engine.GetModelValue( dataDownloadedModel )
	end
	return dataDownloaded
end

function CallingCards_IsGetPublicProfileComplete( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local getPublicProfileCompleteModel = Engine.GetModel( perControllerModel, "CallingCardsIdentity.GetPublicProfileComplete" )
	local gotPublicProfile = false
	if getPublicProfileCompleteModel then
		gotPublicProfile = Engine.GetModelValue( getPublicProfileCompleteModel )
	end
	return gotPublicProfile
end

function CallingCards_IsNew( element, controller )
	local iconId = CoD.SafeGetModelValue( element:getModel(), "iconId" )
	if iconId then
		return Engine.IsEmblemBackgroundNew( controller, iconId )
	else
		return false
	end
end

function CallingCards_IsAnyNew( controller )
	return Engine.IsAnyEmblemBackgroundNew( controller )
end

function CraftSlotsFullByStorageType( controller, enumValue )
	if IsLive() then
		local usedSlots = CoD.CraftUtility.GetUsedSlotsByFileType( controller, enumValue )
		local allowedSlots = CoD.CraftUtility.GetTotalAllowedSlotsByFileType( controller, enumValue )
		if allowedSlots <= usedSlots then
			return true
		end
	end
	return false
end

function IsPreBuiltEmblemTab( controller )
	if CoD.perController[controller].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS or CoD.perController[controller].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
		return true
	else
		return false
	end
end

function IsEmblemEditor( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	return customizationType == Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
end

function IsPaintshop( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	local f688_local0
	if customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT and customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP and customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT then
		f688_local0 = false
	else
		f688_local0 = true
	end
	return f688_local0
end

function IsMaxPrestigeLevel( controller )
	local plevel = CoD.PrestigeUtility.GetCurrentPLevel( controller )
	return Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= plevel
end

function IsMaxPrestigeLevelForMode( controller, enumValue )
	local plevel = CoD.PrestigeUtility.GetCurrentPLevel( controller, enumValue )
	return Engine.GetPrestigeCap( enumValue ) <= plevel
end

function IsPrestigeLevelAtZero( controller )
	local plevel = CoD.PrestigeUtility.GetCurrentPLevel( controller )
	return plevel == 0
end

function IsAtXPCap( controller )
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	local rankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
	return Engine.GetXPCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) <= rankXP
end

function IsPrestigeRewardSpent( controller, enumValue )
	return Engine.IsPrestigeTokenSpentByType( controller, enumValue, CoD.PrestigeUtility.GetPrestigeGameMode() )
end

function IsInPermanentUnlockMenu( controller )
	return CoD.PrestigeUtility.isInPermanentUnlockMenu
end

function IsInBubblegumSelectMenu( element, controller )
	return IsGlobalModelValueTrue( element, controller, "inBubblegumBuffSelectMenu" )
end

function IsPermanentlyUnlocked( element, controller )
	local itemIndexModel = nil
	local itemIndex = element.itemIndex
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not itemIndex then
		itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			itemIndex = Engine.GetModelValue( itemIndexModel )
		end
	end
	if itemIndex then
		local itemCost = Engine.GetItemCost( itemIndex, mode )
		if itemCost == 0 then
			return true
		else
			return Engine.IsItemPermanentlyUnlocked( controller, itemIndex, mode )
		end
	else
		return false
	end
end

function HavePermanentUnlockTokens( controller )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local tokenCount = Engine.GetPermanentUnlockCount( controller, mode )
	return tokenCount > 0
end

function PlayerGainedPrestigeMaster( controller, mode )
	local statsAfterMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, mode )
	local xpCap = Engine.GetXPCap( mode )
	local prestigeCap = Engine.GetPrestigeCap( mode )
	local xpAfter = statsAfterMatch.PlayerStatsList.RANKXP.StatValue:get()
	local plevel = statsAfterMatch.PlayerStatsList.PLEVEL.StatValue:get()
	local f698_local0
	if xpCap > xpAfter or plevel ~= prestigeCap - 1 then
		f698_local0 = false
	else
		f698_local0 = true
	end
	return f698_local0
end

function IsGameModeParagonCapable( enumValue )
	return LuaUtils.IsGameModeParagonCapable( enumValue )
end

function IsInParagonCapableGameMode()
	return IsGameModeParagonCapable( Engine.CurrentSessionMode() )
end

function IsPrestigeMasterFromRankModel( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local modelValue = tonumber( model and Engine.GetModelValue( model ) )
	local f701_local0
	if modelValue == nil or modelValue <= CoD.MAX_RANK + 1 then
		f701_local0 = false
	else
		f701_local0 = true
	end
	return f701_local0
end

function CompetitiveSettingsEnabled( controller )
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f702_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
	if lobbyNav ~= f702_local0.id then
		f702_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
		if lobbyNav == f702_local0.id then
		
		else
			return false
		end
	end
	if (Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1 then
		return true
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

function IsArenaStarInvisible( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	end
	local model = parent:getModel( controller, "levelStars" )
	local index = tonumber( indexStr )
	local f706_local0
	if model and Engine.GetModelValue( model ) >= index then
		f706_local0 = false
	else
		f706_local0 = true
	end
	return f706_local0
end

function IsArenaStarInactive( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	end
	local levelModel = parent:getModel( controller, "levelStars" )
	local earnedModel = parent:getModel( controller, "earnedStars" )
	local index = tonumber( indexStr )
	local f707_local0 = levelModel
	local f707_local1 = earnedModel
	local f707_local2
	if index > Engine.GetModelValue( levelModel ) or Engine.GetModelValue( earnedModel ) >= index then
		f707_local2 = false
	else
		f707_local2 = f707_local1 and f707_local0 and true
	end
	return f707_local2
end

function IsArenaStarEarned( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	else
		local earnedModel = parent:getModel( controller, "earnedStars" )
		local index = tonumber( indexStr )
		return earnedModel and index <= Engine.GetModelValue( earnedModel )
	end
end

function ArenaRankIncreased( controller )
	local playlistId = Engine.GetPlaylistID()
	local playlistInfo = Engine.GetPlaylistInfoByID( playlistId )
	local playerStats = CoD.GetPlayerStats( controller )
	local previousPoints = playerStats.arenaStats[playlistInfo.playlist.arenaSlot].matchStartPoints:get()
	local previousRank = CoD.ArenaUtility.GetRank( previousPoints )
	local currentPoints = playerStats.arenaStats[playlistInfo.playlist.arenaSlot].points:get()
	local currentRank = CoD.ArenaUtility.GetRank( currentPoints )
	return previousRank < currentRank
end

function WonLastTeamBasedMatch( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not stats then
		return false
	else
		local aarStats = stats.AfterActionReportStats
		local alliesScore = aarStats.alliesScore:get()
		local axisScore = aarStats.axisScore:get()
		local team = aarStats.team:get()
		if team ~= Enum.team_t.TEAM_ALLIES and team ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif team == Enum.team_t.TEAM_ALLIES then
			return axisScore < alliesScore
		else
			return alliesScore < axisScore
		end
	end
end

function LostLastTeamBasedMatch( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not stats then
		return false
	else
		local aarStats = stats.AfterActionReportStats
		local alliesScore = aarStats.alliesScore:get()
		local axisScore = aarStats.axisScore:get()
		local team = aarStats.team:get()
		if team ~= Enum.team_t.TEAM_ALLIES and team ~= Enum.team_t.TEAM_AXIS then
			return false
		elseif team == Enum.team_t.TEAM_ALLIES then
			return alliesScore < axisScore
		else
			return axisScore < alliesScore
		end
	end
end

function IsBetaSeason()
	local season = Engine.GetCurrentArenaSeason()
	local f712_local0
	if season < 0 or season >= 2 then
		f712_local0 = false
	else
		f712_local0 = true
	end
	return f712_local0
end

function SelectedPlayerIsArenaMaster( element, controller )
	local arenaPointsModel = element:getModel( controller, "arenaPoints" )
	if arenaPointsModel ~= nil then
		local arenaPoints = Engine.GetModelValue( arenaPointsModel )
		if arenaPoints ~= nil then
			return CoD.ArenaUtility.IsMaster( arenaPoints )
		end
	end
	return false
end

function IsParamModelEqualTo( model, expressionArg )
	return model and Engine.GetModelValue( model ) == expressionArg
end

function IsParamModelEqualToString( model, stringArg )
	return model and Engine.GetModelValue( model ) == stringArg
end

function IsModelParameterValueEnum( model, enumValue )
	return model and Engine.GetModelValue( model ) == enumValue
end

function IsModelValueNonEmptyString( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f717_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f717_local1 = f717_local0 and modelValue
	local f717_local2
	if f717_local1 == nil or f717_local1 == "" then
		f717_local2 = false
	else
		f717_local2 = true
	end
	return f717_local2
end

function IsModelValueTrue( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f718_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f718_local1 = f718_local0 and modelValue
	local f718_local2
	if f718_local1 == nil or f718_local1 ~= true then
		f718_local2 = false
	else
		f718_local2 = true
	end
	return f718_local2
end

function IsModelValueGreaterThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f719_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f719_local1 = f719_local0 and modelValue
	local f719_local2
	if f719_local1 == nil or expressionArg >= f719_local1 then
		f719_local2 = false
	else
		f719_local2 = true
	end
	return f719_local2
end

function IsModelValueLessThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f720_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f720_local1 = f720_local0 and modelValue
	local f720_local2
	if f720_local1 == nil or f720_local1 >= expressionArg then
		f720_local2 = false
	else
		f720_local2 = true
	end
	return f720_local2
end

function IsModelValueGreaterThanOrEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f721_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f721_local1 = f721_local0 and modelValue
	local f721_local2
	if f721_local1 == nil or expressionArg > f721_local1 then
		f721_local2 = false
	else
		f721_local2 = true
	end
	return f721_local2
end

function IsModelValueLessThanOrEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f722_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f722_local1 = f722_local0 and modelValue
	local f722_local2
	if f722_local1 == nil or f722_local1 > expressionArg then
		f722_local2 = false
	else
		f722_local2 = true
	end
	return f722_local2
end

function IsModelValueEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f723_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f723_local1 = f723_local0 and modelValue
	local f723_local2
	if f723_local1 == nil or f723_local1 ~= expressionArg then
		f723_local2 = false
	else
		f723_local2 = true
	end
	return f723_local2
end

function IsModelValueEqualToEitherValue( controller, modelArg, expressionArg, expressionArg2 )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f724_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f724_local1 = f724_local0 and modelValue
	local f724_local2
	if f724_local1 == nil or f724_local1 ~= expressionArg and f724_local1 ~= expressionArg2 then
		f724_local2 = false
	else
		f724_local2 = true
	end
	return f724_local2
end

function IsModelValueEqualToEnum( controller, modelArg, enumValue )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f725_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f725_local1 = f725_local0 and modelValue
	local f725_local2
	if f725_local1 == nil or f725_local1 ~= enumValue then
		f725_local2 = false
	else
		f725_local2 = true
	end
	return f725_local2
end

function IsModelValueEnumBitSet( controller, modelArg, enumValue )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f726_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f726_local1 = f726_local0 and modelValue
	local f726_local2
	if f726_local1 ~= nil then
		f726_local2 = CoD.BitUtility.IsBitSet( f726_local1, enumValue )
	else
		f726_local2 = false
	end
	return f726_local2
end

function IsButtonModelValueEqualTo( controller, enumValue, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. enumValue )
	local f727_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f727_local1 = f727_local0 and modelValue
	local f727_local2
	if f727_local1 == nil or f727_local1 ~= expressionArg then
		f727_local2 = false
	else
		f727_local2 = true
	end
	return f727_local2
end

function AreButtonModelValueBitsSet( controller, enumValue, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. enumValue )
	local f728_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f728_local1 = f728_local0 and modelValue
	local f728_local2
	if f728_local1 == nil or f728_local1 & expressionArg ~= expressionArg then
		f728_local2 = false
	else
		f728_local2 = true
	end
	return f728_local2
end

function ModelValueStartsWith( controller, modelArg, stringArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f729_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f729_local1 = f729_local0 and modelValue
	local f729_local2
	if f729_local1 ~= nil then
		f729_local2 = LUI.startswith( f729_local1, stringArg )
	else
		f729_local2 = false
	end
	return f729_local2
end

function IsControllerModelValueEqualToSelfModelValue( element, controller, modelArgController, modelArgSelf )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local perControllerModel = Engine.GetModel( Engine.GetModelForController( controller ), modelArgController )
		if not perControllerModel then
			return false
		else
			local selfModel = Engine.GetModel( element:getModel(), modelArgSelf )
			if not selfModel then
				return false
			else
				local perControllerModelValue = Engine.GetModelValue( perControllerModel )
				local selfModelValue = Engine.GetModelValue( selfModel )
				return perControllerModelValue == selfModelValue
			end
		end
	end
end

function IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, modelArgController, modelArgSelf )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local perControllerModel = Engine.GetModel( Engine.GetModelForController( controller ), modelArgController )
		if not perControllerModel then
			return false
		else
			local selfModel = Engine.GetModel( element:getModel(), modelArgSelf )
			if not selfModel then
				return false
			else
				local perControllerModelValue = Engine.GetModelValue( perControllerModel )
				local selfModelValue = Engine.GetModelValue( selfModel )
				return selfModelValue <= perControllerModelValue
			end
		end
	end
end

function IsClientModelValueNonEmptyString( controller, modelArg )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f732_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f732_local1 = f732_local0 and modelValue
	local f732_local2
	if f732_local1 == nil or f732_local1 == "" then
		f732_local2 = false
	else
		f732_local2 = true
	end
	return f732_local2
end

function IsClientModelValueTrue( controller, modelArg )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f733_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f733_local1 = f733_local0 and modelValue
	local f733_local2
	if f733_local1 == nil or f733_local1 ~= true then
		f733_local2 = false
	else
		f733_local2 = true
	end
	return f733_local2
end

function IsClientModelValueGreaterThan( controller, modelArg, expressionArg )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f734_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f734_local1 = f734_local0 and modelValue
	local f734_local2
	if f734_local1 == nil or expressionArg >= f734_local1 then
		f734_local2 = false
	else
		f734_local2 = true
	end
	return f734_local2
end

function IsClientModelValueLessThan( controller, modelArg, expressionArg )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f735_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f735_local1 = f735_local0 and modelValue
	local f735_local2
	if f735_local1 == nil or f735_local1 >= expressionArg then
		f735_local2 = false
	else
		f735_local2 = true
	end
	return f735_local2
end

function IsClientModelValueGreaterThanOrEqualTo( controller, modelArg, expressionArg )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f736_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f736_local1 = f736_local0 and modelValue
	local f736_local2
	if f736_local1 == nil or expressionArg > f736_local1 then
		f736_local2 = false
	else
		f736_local2 = true
	end
	return f736_local2
end

function IsClientModelValueLessThanOrEqualTo( controller, modelArg, expressionArg )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f737_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f737_local1 = f737_local0 and modelValue
	local f737_local2
	if f737_local1 == nil or f737_local1 > expressionArg then
		f737_local2 = false
	else
		f737_local2 = true
	end
	return f737_local2
end

function IsClientModelValueEqualTo( controller, modelArg, expressionArg )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f738_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f738_local1 = f738_local0 and modelValue
	local f738_local2
	if f738_local1 == nil or f738_local1 ~= expressionArg then
		f738_local2 = false
	else
		f738_local2 = true
	end
	return f738_local2
end

function IsClientModelValueEqualToEitherValue( controller, modelArg, expressionArg, expressionArg2 )
	local clientNum = Engine.GetClientNum( controller )
	local model = Engine.GetModel( Engine.GetModelForClient( clientNum ), modelArg )
	local f739_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f739_local1 = f739_local0 and modelValue
	local f739_local2
	if f739_local1 == nil or f739_local1 ~= expressionArg and f739_local1 ~= expressionArg2 then
		f739_local2 = false
	else
		f739_local2 = true
	end
	return f739_local2
end

function IsGlobalModelValueEqualToSelfModelValue( element, controller, modelArgGlobal, modelArgSelf )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local globalModel = Engine.GetModel( Engine.GetGlobalModel(), modelArgGlobal )
		if not globalModel then
			return false
		else
			local selfModel = Engine.GetModel( element:getModel(), modelArgSelf )
			if not selfModel then
				return false
			else
				local globalModelValue = Engine.GetModelValue( globalModel )
				local selfModelValue = Engine.GetModelValue( selfModel )
				return globalModelValue == selfModelValue
			end
		end
	end
end

function IsGlobalModelValueEqualToSelfTeam( controller, modelArgGlobal )
	local selfTeam = CoD.TeamUtility.GetTeamID( controller )
	if selfTeam == Enum.team_t.TEAM_SPECTATOR then
		if CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
			selfTeam = Enum.team_t.TEAM_AXIS
		else
			selfTeam = Enum.team_t.TEAM_ALLIES
		end
	end
	return IsGlobalModelValueEqualTo( nil, nil, modelArgGlobal, selfTeam )
end

function IsSelfModelValueNil( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	return model == nil
end

function IsSelfModelValueNilOrZero( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f743_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f743_local1
	if model ~= nil and (f743_local0 and modelValue) ~= 0 then
		f743_local1 = false
	else
		f743_local1 = true
	end
	return f743_local1
end

function IsSelfModelValueNonEmptyString( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f744_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f744_local1 = f744_local0 and modelValue
	local f744_local2
	if f744_local1 == nil or f744_local1 == "" then
		f744_local2 = false
	else
		f744_local2 = true
	end
	return f744_local2
end

function IsSelfModelValueTrue( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f745_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f745_local1 = f745_local0 and modelValue
	local f745_local2
	if f745_local1 == nil or f745_local1 ~= true then
		f745_local2 = false
	else
		f745_local2 = true
	end
	return f745_local2
end

function IsSelfEnumModelValueTrue( element, controller, enumValue )
	local model = element:getModel()
	if enumValue ~= "" and model then
		model = Engine.GetModel( model, enumValue )
	end
	local f746_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f746_local1 = f746_local0 and modelValue
	local f746_local2
	if f746_local1 == nil or f746_local1 ~= true then
		f746_local2 = false
	else
		f746_local2 = true
	end
	return f746_local2
end

function IsSelfModelValueGreaterThan( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f747_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f747_local1 = f747_local0 and modelValue
	local f747_local2
	if f747_local1 == nil or expressionArg >= f747_local1 then
		f747_local2 = false
	else
		f747_local2 = true
	end
	return f747_local2
end

function IsSelfModelValueLessThan( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f748_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f748_local1 = f748_local0 and modelValue
	local f748_local2
	if f748_local1 == nil or f748_local1 >= expressionArg then
		f748_local2 = false
	else
		f748_local2 = true
	end
	return f748_local2
end

function IsSelfModelValueGreaterThanOrEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f749_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f749_local1 = f749_local0 and modelValue
	local f749_local2
	if f749_local1 == nil or expressionArg > f749_local1 then
		f749_local2 = false
	else
		f749_local2 = true
	end
	return f749_local2
end

function IsSelfModelValueLessThanOrEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f750_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f750_local1 = f750_local0 and modelValue
	local f750_local2
	if f750_local1 == nil or f750_local1 > expressionArg then
		f750_local2 = false
	else
		f750_local2 = true
	end
	return f750_local2
end

function IsSelfModelValueEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f751_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f751_local1 = f751_local0 and modelValue
	local f751_local2
	if f751_local1 == nil or f751_local1 ~= expressionArg then
		f751_local2 = false
	else
		f751_local2 = true
	end
	return f751_local2
end

function IsSelfModelValueInRange( element, controller, modelArg, numArgStart, numArgEnd )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f752_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f752_local1 = f752_local0 and modelValue
	local f752_local2
	if f752_local1 == nil or tonumber( numArgStart ) > f752_local1 or f752_local1 > tonumber( numArgEnd ) then
		f752_local2 = false
	else
		f752_local2 = true
	end
	return f752_local2
end

function IsSelfModelValueBetween( element, controller, modelArg, numArgStart, numArgEnd )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f753_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f753_local1 = f753_local0 and modelValue
	local f753_local2
	if f753_local1 == nil or tonumber( numArgStart ) >= f753_local1 or f753_local1 >= tonumber( numArgEnd ) then
		f753_local2 = false
	else
		f753_local2 = true
	end
	return f753_local2
end

function IsSelfModelValueEqualToEitherValue( element, controller, modelArg, expressionArg, expressionArg2 )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f754_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f754_local1 = f754_local0 and modelValue
	local f754_local2
	if f754_local1 == nil or f754_local1 ~= expressionArg and f754_local1 ~= expressionArg2 then
		f754_local2 = false
	else
		f754_local2 = true
	end
	return f754_local2
end

function IsSelfModelValueEqualToAnyValue( element, controller, modelArg, expressionArg, expressionArg2, expressionArg3 )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f755_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f755_local1 = f755_local0 and modelValue
	local f755_local2
	if f755_local1 == nil or f755_local1 ~= expressionArg and f755_local1 ~= expressionArg2 and f755_local1 ~= expressionArg3 then
		f755_local2 = false
	else
		f755_local2 = true
	end
	return f755_local2
end

function IsSelfModelValueEqualToAnyValue4( element, controller, modelArg, expressionArg, expressionArg2, expressionArg3, expressionArg4 )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f756_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f756_local1 = f756_local0 and modelValue
	local f756_local2
	if f756_local1 == nil or f756_local1 ~= expressionArg and f756_local1 ~= expressionArg2 and f756_local1 ~= expressionArg3 and f756_local1 ~= expressionArg4 then
		f756_local2 = false
	else
		f756_local2 = true
	end
	return f756_local2
end

function IsSelfModelValueEqualToAnyValue5( element, controller, modelArg, expressionArg, expressionArg2, expressionArg3, expressionArg4, expressionArg5 )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f757_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f757_local1 = f757_local0 and modelValue
	local f757_local2
	if f757_local1 == nil or f757_local1 ~= expressionArg and f757_local1 ~= expressionArg2 and f757_local1 ~= expressionArg3 and f757_local1 ~= expressionArg4 and f757_local1 ~= expressionArg5 then
		f757_local2 = false
	else
		f757_local2 = true
	end
	return f757_local2
end

function IsSelfModelValueEqualToEnum( element, controller, modelArg, enumValue )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f758_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f758_local1 = f758_local0 and modelValue
	local f758_local2
	if f758_local1 == nil or f758_local1 ~= enumValue then
		f758_local2 = false
	else
		f758_local2 = true
	end
	return f758_local2
end

function IsSelfModelValueEqualToEnumOrSelfModelNil( element, controller, modelArg, enumValue )
	if element:getModel() == nil then
		return true
	else
		return IsSelfModelValueEqualToEnum( element, controller, modelArg, enumValue )
	end
end

function IsSelfModelValueEqualToSelfTeam( element, controller, modelArg )
	local selfTeam = CoD.TeamUtility.GetTeamID( controller )
	if selfTeam == Enum.team_t.TEAM_SPECTATOR then
		if CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
			selfTeam = Enum.team_t.TEAM_AXIS
		else
			selfTeam = Enum.team_t.TEAM_ALLIES
		end
	end
	return IsSelfModelValueEqualTo( element, controller, modelArg, selfTeam )
end

function IsGlobalDataSourceModelValueNonEmptyString( controller, dataSourceName, modelPath )
	local f761_local0 = DataSources[dataSourceName]
	if f761_local0 then
		f761_local0 = DataSources[dataSourceName].getModel
		if f761_local0 then
			local dataSourceModel = DataSources[dataSourceName].getModel( controller )
		end
	end
	local f761_local1 = f761_local0
	local model = f761_local0[modelPath]
	local f761_local2 = f761_local1 and model
	local f761_local3 = f761_local2
	local modelValue = Engine.GetModelValue( f761_local2 )
	local f761_local4 = f761_local3 and modelValue
	local f761_local5
	if f761_local4 == nil or f761_local4 == "" then
		f761_local5 = false
	else
		f761_local5 = true
	end
	return f761_local5
end

function IsGlobalDataSourceModelValueTrue( controller, dataSourceName, modelPath )
	local f762_local0 = DataSources[dataSourceName]
	if f762_local0 then
		f762_local0 = DataSources[dataSourceName].getModel
		if f762_local0 then
			local dataSourceModel = DataSources[dataSourceName].getModel( controller )
		end
	end
	local f762_local1 = f762_local0
	local model = f762_local0[modelPath]
	local f762_local2 = f762_local1 and model
	local f762_local3 = f762_local2
	local modelValue = Engine.GetModelValue( f762_local2 )
	local f762_local4 = f762_local3 and modelValue
	local f762_local5
	if f762_local4 == nil or f762_local4 ~= true then
		f762_local5 = false
	else
		f762_local5 = true
	end
	return f762_local5
end

function IsGlobalDataSourceModelValueEqualTo( controller, dataSourceName, modelPath, expressionArg )
	local f763_local0 = DataSources[dataSourceName]
	if f763_local0 then
		f763_local0 = DataSources[dataSourceName].getModel
		if f763_local0 then
			local dataSourceModel = DataSources[dataSourceName].getModel( controller )
		end
	end
	local f763_local1 = f763_local0
	local model = f763_local0[modelPath]
	local f763_local2 = f763_local1 and model
	local f763_local3 = f763_local2
	local modelValue = Engine.GetModelValue( f763_local2 )
	local f763_local4 = f763_local3 and modelValue
	local f763_local5
	if f763_local4 == nil or f763_local4 ~= expressionArg then
		f763_local5 = false
	else
		f763_local5 = true
	end
	return f763_local5
end

function IsGlobalDataSourceModelValueEqualToEnum( controller, dataSourceName, modelPath, enumValue )
	local f764_local0 = DataSources[dataSourceName]
	if f764_local0 then
		f764_local0 = DataSources[dataSourceName].getModel
		if f764_local0 then
			local dataSourceModel = DataSources[dataSourceName].getModel( controller )
		end
	end
	local f764_local1 = f764_local0
	local model = f764_local0[modelPath]
	local f764_local2 = f764_local1 and model
	local f764_local3 = f764_local2
	local modelValue = Engine.GetModelValue( f764_local2 )
	local f764_local4 = f764_local3 and modelValue
	local f764_local5
	if f764_local4 == nil or f764_local4 ~= enumValue then
		f764_local5 = false
	else
		f764_local5 = true
	end
	return f764_local5
end

function IsGlobalDataSourceModelValueGreaterThan( controller, dataSourceName, modelPath, expressionArg )
	local f765_local0 = DataSources[dataSourceName]
	if f765_local0 then
		f765_local0 = DataSources[dataSourceName].getModel
		if f765_local0 then
			local dataSourceModel = DataSources[dataSourceName].getModel( controller )
		end
	end
	local f765_local1 = f765_local0
	local model = f765_local0[modelPath]
	local f765_local2 = f765_local1 and model
	local f765_local3 = f765_local2
	local modelValue = Engine.GetModelValue( f765_local2 )
	local f765_local4 = f765_local3 and modelValue
	local f765_local5
	if f765_local4 == nil or expressionArg >= tonumber( f765_local4 ) then
		f765_local5 = false
	else
		f765_local5 = true
	end
	return f765_local5
end

function IsGlobalDataSourceModelValueLessThan( controller, dataSourceName, modelPath, expressionArg )
	local f766_local0 = DataSources[dataSourceName]
	if f766_local0 then
		f766_local0 = DataSources[dataSourceName].getModel
		if f766_local0 then
			local dataSourceModel = DataSources[dataSourceName].getModel( controller )
		end
	end
	local f766_local1 = f766_local0
	local model = f766_local0[modelPath]
	local f766_local2 = f766_local1 and model
	local f766_local3 = f766_local2
	local modelValue = Engine.GetModelValue( f766_local2 )
	local f766_local4 = f766_local3 and modelValue
	local f766_local5
	if f766_local4 == nil or tonumber( f766_local4 ) >= expressionArg then
		f766_local5 = false
	else
		f766_local5 = true
	end
	return f766_local5
end

function IsGlobalModelValueNonEmptyString( element, controller, modelArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f767_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f767_local1 = f767_local0 and modelValue
	local f767_local2
	if f767_local1 == nil or f767_local1 == "" then
		f767_local2 = false
	else
		f767_local2 = true
	end
	return f767_local2
end

function IsGlobalModelValueTrue( element, controller, modelArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f768_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f768_local1 = f768_local0 and modelValue
	local f768_local2
	if f768_local1 == nil or f768_local1 ~= true then
		f768_local2 = false
	else
		f768_local2 = true
	end
	return f768_local2
end

function IsGlobalModelValueEqualTo( element, controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f769_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f769_local1 = f769_local0 and modelValue
	local f769_local2
	if f769_local1 == nil or f769_local1 ~= expressionArg then
		f769_local2 = false
	else
		f769_local2 = true
	end
	return f769_local2
end

function IsGlobalModelValueEqualToEnum( element, controller, modelArg, enumValue )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f770_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f770_local1 = f770_local0 and modelValue
	local f770_local2
	if f770_local1 == nil or f770_local1 ~= enumValue then
		f770_local2 = false
	else
		f770_local2 = true
	end
	return f770_local2
end

function IsGlobalModelValueGreaterThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f771_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f771_local1 = f771_local0 and modelValue
	local f771_local2
	if f771_local1 == nil or expressionArg >= tonumber( f771_local1 ) then
		f771_local2 = false
	else
		f771_local2 = true
	end
	return f771_local2
end

function IsGlobalModelValueLessThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f772_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f772_local1 = f772_local0 and modelValue
	local f772_local2
	if f772_local1 == nil or tonumber( f772_local1 ) >= expressionArg then
		f772_local2 = false
	else
		f772_local2 = true
	end
	return f772_local2
end

function IsSelfModelValueBitSet( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f773_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f773_local1 = f773_local0 and modelValue
	local f773_local2
	if f773_local1 ~= nil then
		f773_local2 = CoD.BitUtility.IsBitSet( f773_local1, expressionArg )
	else
		f773_local2 = false
	end
	return f773_local2
end

function IsSelfModelValueEnumBitSet( element, controller, modelArg, enumValue )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f774_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f774_local1 = f774_local0 and modelValue
	local f774_local2
	if f774_local1 ~= nil then
		f774_local2 = CoD.BitUtility.IsBitSet( f774_local1, enumValue )
	else
		f774_local2 = false
	end
	return f774_local2
end

function IsSelfModelValueEnumFlagSet( element, controller, modelArg, enumValue )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f775_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f775_local1 = f775_local0 and modelValue
	local f775_local2
	if f775_local1 == nil or f775_local1 & enumValue == 0 then
		f775_local2 = false
	else
		f775_local2 = true
	end
	return f775_local2
end

function IsSelfModelValueMyXuid( element, controller, modelArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f776_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f776_local1 = f776_local0 and modelValue
	local f776_local2
	if f776_local1 == nil or f776_local1 ~= Engine.GetXUID64( controller ) then
		f776_local2 = false
	else
		f776_local2 = true
	end
	return f776_local2
end

function IsSelfModelValueMyXuidOrAnyLocalPlayerOnGameOver( element, controller, modelArg )
	local modelValue = CoD.SafeGetModelValue( element:getModel(), modelArg )
	local startController = controller
	local endController = controller
	if IsInGame() and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		startController = 0
		endController = Engine.GetMaxControllerCount() - 1
	end
	for loopController = startController, endController, 1 do
		if Engine.IsControllerBeingUsed( loopController ) and modelValue == Engine.GetXUID64( loopController ) then
			return true
		end
	end
	return false
end

function IsPrimaryButton( event )
	local f778_local0
	if event.button == "primary" then
		f778_local0 = event.down
	else
		f778_local0 = false
	end
	return f778_local0
end

function IsDpadButton( model )
	local f779_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f779_local1 = f779_local0 and modelValue
	local f779_local2
	if f779_local1 ~= nil then
		f779_local2 = CoD.BitUtility.IsBitwiseAndNonZero( f779_local1, Enum.LUIButtonFlags.FLAG_DPAD )
	else
		f779_local2 = true
	end
	return f779_local2
end

function IsRepeatButtonPress( model )
	local f780_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f780_local1 = f780_local0 and modelValue
	local f780_local2
	if f780_local1 ~= nil then
		f780_local2 = CoD.BitUtility.IsBitwiseAndNonZero( f780_local1, Enum.LUIButtonFlags.FLAG_ISREPEAT )
	else
		f780_local2 = false
	end
	return f780_local2
end

function IsPartyLeaderStatusVisible()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
			local f781_local0 = menu.id
			local f781_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
			if f781_local0 == f781_local1.id then
				return false
			end
		end
		if menu.isAdvertised then
			return false
		else
			return true
		end
	else
		return false
	end
end

function ShowClientInRedForMissingDLC( element, controller )
	if not IsLobbyHost() then
		return false
	end
	local dlcBits = CoD.SafeGetModelValue( element:getModel(), "dlcBits" )
	if dlcBits then
		if IsCustomLobby() then
			local nextMap = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
			local dlcBit = Engine.GetDLCBitForMapName( nextMap )
			local f782_local0
			if dlcBit then
				f782_local0 = not CoD.BitUtility.IsBitwiseAndNonZero( dlcBits, dlcBit )
			else
				f782_local0 = true
			end
			return f782_local0
		elseif CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() and IsLobbyHost() then
			local bitsToComplainAbout = CoD.BaseUtility.GetKnownDLCBits() & Engine.GetDLCBits()
			return bitsToComplainAbout ~= bitsToComplainAbout & dlcBits
		end
	end
	return false
end

function ShowMissingMapsListInLobbySlide( element, controller )
	local dlcBits = CoD.SafeGetModelValue( element:getModel(), "dlcBits" )
	if dlcBits then
		if IsCustomLobby() then
			local nextMap = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
			local dlcBit = Engine.GetDLCBitForMapName( nextMap )
			local f783_local0
			if dlcBit then
				f783_local0 = not CoD.BitUtility.IsBitwiseAndNonZero( dlcBits, dlcBit )
			else
				f783_local0 = true
			end
			return f783_local0
		elseif CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() then
			local bitsToComplainAbout = CoD.BaseUtility.GetKnownDLCBits() & Engine.GetDLCBits()
			return bitsToComplainAbout ~= bitsToComplainAbout & dlcBits
		end
	end
	return false
end

function IsLobbyStatusVisible()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		if menu.isAdvertised then
			return true
		end
	end
	return false
end

function IsPartyPrivacyVisible()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
		local lobbyNav = Engine.GetModelValue( lobbyNavModel )
		if lobbyNav then
			local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
			if menu.isAdvertised == true then
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
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	if clientCount == maxPlayers or maxPlayers == 1 then
		return true
	else
		return false
	end
end

function IsSelfModelRankValueGreaterThan( element, controller, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, "rank" )
	end
	local f787_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f787_local1 = f787_local0 and modelValue
	local f787_local2
	if tonumber( f787_local1 ) == nil or expressionArg >= tonumber( f787_local1 ) then
		f787_local2 = false
	else
		f787_local2 = true
	end
	return f787_local2
end

function IsPlayerLimitAtMax()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	if currentMenu.maxClients <= maxPlayers then
		return true
	else
		return false
	end
end

function ShowCPInstructionText( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	return Engine.GetIString( perControllerModel.hudItems.cpInstructionText:get(), "CS_LOCALIZED_STRINGS" ) ~= ""
end

function ShowCPNotificationText( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	return perControllerModel.hudItems.showCPNotificationText:get() ~= 0
end

function HasNumHessActive( controller, expressionArg )
	local numActiveHess = 0
	local hess1typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess1.type" )
	if hess1typeModel ~= nil and Engine.GetModelValue( hess1typeModel ) ~= 0 then
		numActiveHess = 1
	end
	local hess2typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess2.type" )
	if hess2typeModel ~= nil and Engine.GetModelValue( hess2typeModel ) ~= 0 then
		numActiveHess = numActiveHess + 1
	end
	return numActiveHess == expressionArg
end

function AreKillstreaksEnabled()
	return Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1
end

function IsEnemyObjectiveComplete( self, element, controller )
	if element.gridInfoTable then
		local objectiveIndex = element.gridInfoTable.zeroBasedIndex + 1
		local objectiveModel = Engine.GetModel( Engine.GetGlobalModel(), "hudItems.cpObjectiveUiData.enemyObjectiveComplete" .. tostring( objectiveIndex ) )
		if objectiveModel then
			return objectiveModel:get() == true
		end
	end
	return false
end

function CanUseSharedLoadouts( controller )
	if not CoD.isCampaign or IsIntDvarNonZero( "mp_prototype" ) then
		return false
	end
	local sharedLoadoutsEnabled = Dvar.lobby_enableLoadoutDataStreamingInGame:get()
	local numCPClients = 1
	local cpClientLoadoutMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
	if cpClientLoadoutMenuModel then
		numCPClients = Engine.GetModelValue( Engine.GetModel( cpClientLoadoutMenuModel, "numActiveClients" ) )
	end
	local f794_local0
	if sharedLoadoutsEnabled ~= true or numCPClients <= 1 then
		f794_local0 = false
	else
		f794_local0 = true
	end
	return f794_local0
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
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local info = Engine.LobbyGetDemoInformation( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	if info and info.fileID ~= Engine.DefaultID64Value() then
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
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
		local info = Engine.LobbyGetDemoInformation( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
		if not info.fileCategory or info.fileCategory ~= "film" and info.fileCategory ~= "recentgames" then
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
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
		local info = Engine.LobbyGetDemoInformation( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
		if not info.fileCategory or info.fileCategory ~= "film" and info.fileCategory ~= "recentgames" then
			return true
		else
			return false
		end
	end
end

function IsUploadClipButtonDisabled()
	local isClipPlaying = Engine.IsDemoClipPlaying()
	local isClipRecording = Engine.IsDemoClipRecording()
	local segmentCount = Engine.GetDemoSegmentCount()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	if isClipPlaying or isClipRecording or segmentCount <= 0 or isRepositioningCameraMarker then
		return true
	else
		return false
	end
end

function IsManageSegmentsButtonDisabled()
	local isClipPlaying = Engine.IsDemoClipPlaying()
	local isClipRecording = Engine.IsDemoClipRecording()
	local segmentCount = Engine.GetDemoSegmentCount()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	if isClipPlaying or isClipRecording or segmentCount <= 0 or isRepositioningCameraMarker then
		return true
	else
		return false
	end
end

function IsCustomizeHighlightReelButtonDisabled()
	local isClipRecording = Engine.IsDemoClipRecording()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isInLobby = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if isClipRecording or isRepositioningCameraMarker or not isGameHost or not isInLobby then
		return true
	else
		return false
	end
end

function IsJumpToStartButtonDisabled()
	local isClipRecording = Engine.IsDemoClipRecording()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isInLobby = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if isClipRecording or isRepositioningCameraMarker or not isGameHost or not isInLobby then
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
	local model = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCreatingHighlightReel" )
	if model then
		return Engine.GetModelValue( model ) == true
	else
		return false
	end
end

function IsDemoCapturingScreenshot()
	local model = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCapturingScreenshot" )
	if model then
		return Engine.GetModelValue( model ) == true
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
	local f818_local0 = IsDemoContextBasicMode()
	if not f818_local0 then
		f818_local0 = IsDemoContextHighlightReelMode()
	end
	return f818_local0
end

function ReachedLowestTimeScale()
	local minValue = 0.1
	local currentTimeScale = CoD.DemoUtility.GetRoundedTimeScale()
	if currentTimeScale <= minValue then
		return true
	else
		return false
	end
end

function ReachedHighestTimeScale()
	local maxValue = Dvar.demo_maxTimeScale:get()
	local currentTimeScale = CoD.DemoUtility.GetRoundedTimeScale()
	if maxValue <= currentTimeScale then
		return true
	else
		return false
	end
end

function ShouldAddDollyCameraMarker( controller )
	if not IsDemoContextDirectorMode() then
		return false
	elseif IsGlobalModelValueGreaterThan( controller, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldEditDollyCameraMarker( controller )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( controller, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, controller, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingDollyCameraMarker( controller )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( controller, "demo.highlightedDollyCamMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.editingDollyCameraMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningDollyCameraMarker( controller )
	if not IsDemoContextDirectorMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.editingDollyCameraMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.isRepositioningDollyCamMarker" ) then
		return false
	else
		return true
	end
end

function IsFreeCameraLockedOnEntity( controller )
	if not IsGlobalModelValueTrue( nil, controller, "demo.isFreeCameraLockedOnEntity" ) then
		return false
	else
		return true
	end
end

function CanFreeCameraLockOnEntity( controller )
	if not IsGlobalModelValueTrue( nil, controller, "demo.isFreeCameraEntityLockOnAllowed" ) then
		return false
	elseif not IsGlobalModelValueGreaterThan( controller, "demo.highlightedFreeCameraLockOnEntity", 0 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, controller, "demo.isFreeCameraLockedOnEntityActive" ) then
		return false
	else
		return true
	end
end

function ShouldAddLightmanMarker( controller )
	if not IsDemoContextLighterMode() then
		return false
	elseif IsGlobalModelValueGreaterThan( controller, "demo.highlightedLightmanMarker", -1 ) then
		return false
	else
		return true
	end
end

function ShouldEditLightmanMarker( controller )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( controller, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif IsGlobalModelValueTrue( nil, controller, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsEditingLightmanMarker( controller )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueGreaterThan( controller, "demo.highlightedLightmanMarker", -1 ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.editingLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsRepositioningLightmanMarker( controller )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.isRepositioningLightmanMarker" ) then
		return false
	else
		return true
	end
end

function IsInLightmanColorPicker( controller )
	if not IsDemoContextLighterMode() then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.editingLightmanMarker" ) then
		return false
	elseif not IsGlobalModelValueTrue( nil, controller, "demo.showLightmanColorPicker" ) then
		return false
	else
		return true
	end
end

function ReachedLowestLightmanFloatParamValue( element, controller )
	if not element.btnId then
		return true
	end
	local currentValueModel = nil
	if element.btnId == "lightmanlightintensity" then
		currentValueModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif element.btnId == "lightmanlightrange" then
		currentValueModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not currentValueModel then
		return true
	elseif Engine.GetModelValue( currentValueModel ) < 0.19 then
		return true
	end
	return false
end

function ReachedHighestLightmanFloatParamValue( element, controller )
	if not element.btnId then
		return true
	end
	local currentValueModel = nil
	if element.btnId == "lightmanlightintensity" then
		currentValueModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif element.btnId == "lightmanlightrange" then
		currentValueModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not currentValueModel then
		return true
	elseif Engine.GetModelValue( currentValueModel ) > 9.91 then
		return true
	end
	return false
end

function IsSegmentInSelectedState( element, controller )
	local selectedSegmentModel = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
	if selectedSegmentModel and selectedSegmentModel == element:getModel() then
		local model = Engine.GetModel( selectedSegmentModel, "selected" )
		if model then
			local isSelected = Engine.GetModelValue( model )
			return isSelected
		end
	end
	return false
end

function IsTimelineEditorInMoveState( controller )
	local selectedSegmentModel = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
	return selectedSegmentModel ~= nil
end

function SegmentCountGreaterThan( controller, expressionArg )
	local segmentCount = Engine.GetDemoSegmentCount()
	return expressionArg < segmentCount
end

function CanChangeSegmentTransition( element, controller )
	local segmentCount = Engine.GetDemoSegmentCount()
	local segmentNumberModel = Engine.GetModel( element:getModel(), "segmentNumber" )
	if segmentNumberModel then
		local segmentNumber = Engine.GetModelValue( segmentNumberModel )
		return segmentNumber < segmentCount
	else
		return false
	end
end

function IsSegmentTransition( element, controller, enumValue )
	local segmentNumberModel = Engine.GetModel( element:getModel(), "segmentNumber" )
	if segmentNumberModel then
		local segmentIndex = Engine.GetModelValue( segmentNumberModel ) - 1
		local transitionValue = tonumber( Engine.GetDemoSegmentInformation( segmentIndex, "transitionValue" ) )
		return transitionValue == enumValue
	else
		return false
	end
end

function HideVehicleReticle( self, controller, event )
	local vehicleType = nil
	if event.modelName == "vehicleType" then
		vehicleType = event.modelValue
	end
	if not vehicleType then
		local vehicleTypeModel = self:getModel( controller, "vehicleType" )
		if vehicleTypeModel then
			vehicleType = Engine.GetModelValue( vehicleTypeModel )
		end
	end
	return vehicleType == "spawner_enemy_54i_vehicle_raps_suicide_player"
end

function VehicleHasEnemyLock( element, controller )
	local f840_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP )
	if not f840_local0 then
		f840_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN )
		if not f840_local0 then
			f840_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT )
			if not f840_local0 then
				f840_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT )
			end
		end
	end
	return f840_local0
end

function IsVehicleRAPS( controller )
	return IsVehicleOfType( controller, "raps" )
end

function IsVehicleOfType( controller, ... )
	local vargs = {
		n = select( "#", ... ),
		...
	}
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "vehicle.vehicleType" )
	if model then
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			for _, vehicleType in ipairs( vargs ) do
				if string.find( modelValue, "_" .. vehicleType ) then
					return true
				end
			end
		end
	end
	return false
end

function IsSelfPlayerName( element, controller )
	local model = element:getModel( controller, "isSelfPlayerName" )
	local modelValue = false
	if model then
		modelValue = Engine.GetModelValue( model )
	end
	return modelValue
end

function ShouldDisplayFactionIconAtPrematchCountdown()
	return CoDShared.IsGametypeTeamBased()
end

function MapVoteInState( state )
	local mapVoteModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if mapVoteModel == nil then
		return false
	end
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		if menu.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME and menu.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			return false
		end
	end
	local currentState = Engine.GetModelValue( mapVoteModel )
	return tonumber( state ) == currentState
end

function MapVotePreviousSelectable()
	if not MapVoteInState( "1" ) then
		return false
	end
	local lobbyModule = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	end
	if Engine.GetPlaylistPrevCount( lobbyModule, Enum.LobbyType.LOBBY_TYPE_GAME ) >= Dvar.lobbyMapVotePrevMapPlayCount:get() then
		return false
	end
	return true
end

function MapVoteTimerActive()
	local timerActiveModel = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if timerActiveModel == nil then
		return false
	end
	local currentMenuId = LobbyData.GetLobbyNav()
	local menu = LobbyData.GetLobbyMenuByID( currentMenuId )
	if menu.lobbyTimerType == LuaEnum.TIMER_TYPE.TESTING then
		return false
	end
	local active = Engine.GetModelValue( timerActiveModel )
	local f847_local0
	if active == nil or active == 0 then
		f847_local0 = false
	else
		f847_local0 = true
	end
	return f847_local0
end

function IsScorestreakEquipped( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			return CoD.CACUtility.GetAttachedItemSlot( menu:getModel(), itemIndex, CoD.CACUtility.KillstreakNameList ) ~= nil
		end
	end
	return false
end

function IsValidScorestreakIndex( self, controller )
	local itemIndexModel = self:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		return itemIndex ~= CoD.CACUtility.EmptyItemIndex
	else
		return false
	end
end

function IsGamepad( controller )
	return CoD.useController and Engine.LastInput_Gamepad()
end

function IsMouse( controller )
	return CoD.useMouse and Engine.LastInput_Mouse()
end

function IsDurangoGamepad( controller )
	local f852_local0 = IsDurango()
	if not f852_local0 then
		f852_local0 = IsPC()
		if f852_local0 then
			f852_local0 = IsGamepad( controller )
			if f852_local0 then
				f852_local0 = Engine.GamepadType( controller ) == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO
			end
		end
	end
	return f852_local0
end

function IsOrbisGamepad( controller )
	local f853_local0
	if not IsOrbis() or Engine.LastInput_Vita( controller ) then
		f853_local0 = IsPC()
		if f853_local0 then
			f853_local0 = IsGamepad( controller )
			if f853_local0 then
				if Engine.GamepadType( controller ) ~= Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
					f853_local0 = false
				else
					f853_local0 = true
				end
			end
		end
	else
		f853_local0 = true
	end
	return f853_local0
end

function IsVitaGamepad( controller )
	return IsOrbis() and Engine.LastInput_Vita( controller )
end

function AutomaticallyOpenAAR( controller )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) > 1 or Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
		return false
	else
		local stats = CoD.GetPlayerStats( controller )
		local value = stats.AfterActionReportStats.lobbyPopup:get()
		if value == "summary" or value == "promotion" then
			return true
		else
			
		end
	end
end

function WasCampaignSoloGame( controller )
	return Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES ) == 1
end

function IsAARValid( controller )
	if CoD.AARUtility.UseTestData() then
		return true
	else
		local statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
		if not statsBeforeMatch or not statsBeforeMatch.PlayerStatsList or not statsBeforeMatch.PlayerStatsList.RANK or not statsBeforeMatch.PlayerStatsList.RANK.StatValue or not statsBeforeMatch.PlayerStatsList.RANK.StatValue:get() then
			return false
		else
			local f857_local0 = CoD.GetPlayerStats( controller )
			if f857_local0.AfterActionReportStats.lobbyPopup:get() == "summary" then
				return true
			else
				local aarTypeModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarType" )
				if aarTypeModel then
					local aarType = Engine.GetModelValue( aarTypeModel )
					local f857_local1
					if (not IsLAN() or aarType ~= "lan") and (IsLAN() or aarType ~= "custom" and aarType ~= "public") then
						f857_local1 = false
					else
						f857_local1 = true
					end
					return f857_local1
				else
					
				end
			end
		end
	end
end

function CanShowAAR( controller )
	local isMultiplayer = Engine.IsMultiplayerGame()
	local isZombies = Engine.IsZombiesGame()
	if IsFreeRunLobby() then
		return false
	elseif IsInTheaterMode() then
		return false
	elseif not isMultiplayer then
		local f858_local0 = isZombies
	end
	local f858_local1 = CoD.AARUtility.UseTestData()
	if not f858_local1 then
		f858_local1 = f858_local0 and Engine.IsStableStatsBufferInitialized( controller )
	end
	return f858_local1
end

function AnyRewardsEarnedDuringMatch( controller )
	return CoD.AARUtility.AnyRewardsEarnedDuringMatch( controller )
end

function HasFriends( controller )
	local numFriends = Engine.GetFriendsCount( controller, Enum.PresenceFilter.PRESENCE_FILTER_ALL )
	return numFriends > 0
end

function HasRecentPlayers( controller )
	local numFriends = Engine.GetRecentPlayersCount( controller, Enum.PresenceFilter.PRESENCE_FILTER_ALL )
	return numFriends > 0
end

function IsSocialPlayersListEmpty( controller )
	local socialRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	local tabModel = Engine.CreateModel( socialRootModel, "tab" )
	local selectedTab = Engine.GetModelValue( tabModel )
	if selectedTab ~= nil then
		if selectedTab == "friends" then
			return HasFriends( controller )
		elseif selectedTab == "recent" then
			return HasRecentPlayers( controller )
		end
	end
	return false
end

function IsOffline( self, controller )
	local activityModel = self:getModel( controller, "activity" )
	if activityModel then
		local value = Engine.GetModelValue( activityModel )
	elseif value == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return true
	end
	return false
end

function IsInTitle( self, controller )
	local activityModel = self:getModel( controller, "activity" )
	if activityModel then
		local value = Engine.GetModelValue( activityModel )
		if value == Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
			return false
		elseif value == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
			return false
		end
	end
	return true
end

function IsJoinable( self, controller )
	if LuaUtils.LobbyIsLocked() then
		return false
	end
	local joinableModel = self:getModel( controller, "joinable" )
	if joinableModel then
		local joinable = Engine.GetModelValue( joinableModel )
		if joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES then
			return true
		elseif joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
			local friendModel = self:getModel( controller, "friend" )
			if friendModel then
				local friend = Engine.GetModelValue( friendModel )
				if friend then
					return true
				end
			end
		end
	end
	return false
end

function IsSocialPartyLeader( self, controller )
	local isPartyLeaderModel = self:getModel( controller, "leader" )
	local f866_local0 = isPartyLeaderModel
	local isPartyLeader = Engine.GetModelValue( isPartyLeaderModel )
	if (f866_local0 and isPartyLeader) == 1 then
		return true
	else
		return false
	end
end

function HideWinnersLabelsAndInfo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isDrawModel = Engine.GetModel( perControllerModel, "gameScore.draw" )
	local f867_local0 = Engine.GetGametypeSetting( "teamCount" ) < 2
	if isDrawModel then
		isDrawModel = Engine.GetModelValue( isDrawModel )
	end
	if isDrawModel or f867_local0 then
		return true
	else
		
	end
end

function IsOutcomeVictory( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f868_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f868_local1 = f868_local0 and isRoundEnd
	local victoryModel = Engine.GetModel( perControllerModel, "gameScore.victory" )
	local f868_local2 = victoryModel
	local victory = Engine.GetModelValue( victoryModel )
	local f868_local3 = f868_local2 and victory
	local f868_local4
	if not f868_local1 then
		f868_local4 = f868_local3
	else
		f868_local4 = false
	end
	return f868_local4
end

function IsOutcomeDefeat( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f869_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f869_local1 = f869_local0 and isRoundEnd
	local defeatModel = Engine.GetModel( perControllerModel, "gameScore.defeat" )
	local f869_local2 = defeatModel
	local defeat = Engine.GetModelValue( defeatModel )
	local f869_local3 = f869_local2 and defeat
	local f869_local4
	if not f869_local1 then
		f869_local4 = f869_local3
	else
		f869_local4 = false
	end
	return f869_local4
end

function IsScoreboardPingAsBars( element, controller )
	return Dvar.cg_ScoresPing_Interval:get() > 1
end

function ScoreboardVisible( controller )
	local f871_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f871_local0 then
		f871_local0 = IsModelValueEqualTo( controller, "forceScoreboard", 1 )
	end
	return f871_local0
end

function IsScoreboardPlayerMuted( controller, element )
	local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
	return Engine.IsPlayerMutedByClientNum( controller, Enum.LobbyType.LOBBY_TYPE_GAME, clientNum )
end

function IsScoreboardPlayerCodCaster( controller, element )
	local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
	if clientNum ~= nil and clientNum >= 0 then
		local team = Engine.GetTeamID( controller, clientNum )
		return team == Enum.team_t.TEAM_SPECTATOR
	else
		return false
	end
end

function ScoreboardMuteButtonPromptHidden( element, controller )
	if not ScoreboardVisible( controller ) then
		return true
	elseif CoD.IsShoutcaster( controller ) then
		return true
	end
	local scoreboardButtonPromptVisibleModel = Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" )
	if scoreboardButtonPromptVisibleModel and not Engine.GetModelValue( scoreboardButtonPromptVisibleModel ) then
		return true
	end
	local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
	local f874_local0
	if clientNum ~= nil and Engine.GetMatchScoreboardClientXuid( clientNum ) ~= nil then
		f874_local0 = false
	else
		f874_local0 = true
	end
	return f874_local0
end

function ScoreboardCanShowGamerCard( element, controller )
	if not CoD.isDurango then
		return false
	else
		local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
		if clientNum == nil or clientNum < 0 then
			return false
		else
			return Engine.GetMatchScoreboardClientXuid( clientNum ) ~= nil
		end
	end
end

function IsScoreboardPlayerSelf( element, controller )
	local model = element:getModel( controller, "clientNum" )
	if model then
		if CoD.IsShoutcaster( controller ) then
			local myClientNum = Engine.GetPredictedClientNum( controller )
			return myClientNum == Engine.GetModelValue( model )
		end
		local startController = controller
		local endController = controller
		if IsInGame() and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
			startController = 0
			endController = Engine.GetMaxControllerCount() - 1
		end
		for loopController = startController, endController, 1 do
			if Engine.IsControllerBeingUsed( loopController ) then
				if CoD.isPC then
					local myClientNum = Engine.GetClientNum( loopController )
					if myClientNum and myClientNum >= 0 and myClientNum == Engine.GetModelValue( model ) then
						return true
					end
				end
				if string.gsub( GetScoreboardPlayerName( loopController, Engine.GetModelValue( model ) ), "%[.+%]", "" ) == Engine.GetSelfGamertag( loopController ) then
					return true
				end
			end
		end
	end
	return false
end

function ShowMatchBonus( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local matchBonusModel = Engine.GetModel( perControllerModel, "gameScore.matchBonus" )
	local matchBonus = 0
	if matchBonusModel then
		matchBonus = Engine.GetModelValue( matchBonusModel )
	end
	local f877_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f877_local1
	if (f877_local0 and isRoundEnd) or matchBonus == 0 then
		f877_local1 = false
	else
		f877_local1 = true
	end
	return f877_local1
end

function IsVictory( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f878_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f878_local1 = f878_local0 and isRoundEnd
	local victoryModel = Engine.GetModel( perControllerModel, "gameScore.victory" )
	local f878_local2 = victoryModel
	local isVictory = Engine.GetModelValue( victoryModel )
	local f878_local3 = f878_local2 and isVictory
	local f878_local4
	if not f878_local1 then
		f878_local4 = f878_local3
	else
		f878_local4 = false
	end
	return f878_local4
end

function IsDefeat( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f879_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f879_local1 = f879_local0 and isRoundEnd
	local defeatModel = Engine.GetModel( perControllerModel, "gameScore.defeat" )
	local f879_local2 = defeatModel
	local isDefeat = Engine.GetModelValue( defeatModel )
	local f879_local3 = f879_local2 and isDefeat
	local f879_local4
	if not f879_local1 then
		f879_local4 = f879_local3
	else
		f879_local4 = false
	end
	return f879_local4
end

function IsStarterPack( controller )
	return CoD.isPC and Engine.IsStarterPack()
end

function IsFreeRunPreStart( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local freeRunModel = Engine.GetModel( perControllerModel, "FreeRun" )
	local stateModel = Engine.GetModel( freeRunModel, "runState" )
	local isPreMatch = false
	if Engine.GetModelValue( stateModel ) == 0 then
		isPreMatch = true
	end
	return isPreMatch
end

function IsFreeRunPreStarted( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local freeRunModel = Engine.GetModel( perControllerModel, "FreeRun" )
	local stateModel = Engine.GetModel( freeRunModel, "runState" )
	local isStarted = false
	if Engine.GetModelValue( stateModel ) == 1 then
		isStarted = true
	end
	return isStarted
end

function IsFreeRunFinished( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local freeRunModel = Engine.GetModel( perControllerModel, "FreeRun" )
	local stateModel = Engine.GetModel( freeRunModel, "runState" )
	local isFinished = false
	if Engine.GetModelValue( stateModel ) == 2 then
		isFinished = true
	end
	return isFinished
end

function ShouldShowFreerunTimeClips( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local bestTimeModel = Engine.GetModel( perControllerModel, "FreeRun.freeRunInfo.bestTime" )
	local bestTime = Engine.GetModelValue( bestTimeModel )
	if bestTime == nil or bestTime <= 0 then
		return false
	else
		local stateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.runState" )
		local state = Engine.GetModelValue( stateModel )
		return state == CoD.FreerunUtility.FR_STATE_RUNNING
	end
end

function IsFreeRunMap( mapName )
	if CoD.MapUtility.MapsTable[mapName] then
		local f885_local0
		if CoD.MapUtility.MapsTable[mapName].isFreeRunMap == nil or CoD.MapUtility.MapsTable[mapName].isFreeRunMap ~= true then
			f885_local0 = false
		else
			f885_local0 = true
		end
		return f885_local0
	else
		return false
	end
end

function IsFreeRunLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f886_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
	if lobbyNav ~= f886_local0.id then
		f886_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
		if lobbyNav == f886_local0.id then
		
		else
			return false
		end
	end
	return true
end

function ShouldShowPartyPrivacy( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local partyLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		partyLobby = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( partyLobby ) then
		return false
	else
		local currentMenuIdx = Engine.GetLobbyUIScreen()
		local currentMenu = LobbyData.GetLobbyMenuByID( currentMenuIdx )
		local maxPlayers = currentMenu.maxClients
		if maxPlayers <= 1 then
			return false
		else
			return true
		end
	end
end

function ShouldShowLeaveParty( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local partyLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		partyLobby = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local partyList = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, partyLobby )
	if #partyList.sessionClients == 1 then
		return false
	end
	local localPlayerCount = 0
	for index, client in ipairs( partyList.sessionClients ) do
		if client.isLocal == true then
			localPlayerCount = localPlayerCount + 1
		end
	end
	if localPlayerCount == #partyList.sessionClients then
		return false
	elseif LuaUtils.LobbyIsLocked() then
		return false
	end
	return true
end

function ShouldShowPromotePlayer( controller )
	return false
end

function ShouldShowBootPlayer( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local partyLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		partyLobby = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( partyLobby ) then
		return false
	end
	local partyList = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, partyLobby )
	if #partyList.sessionClients == 1 then
		return false
	end
	local localPlayerCount = 0
	for index, client in ipairs( partyList.sessionClients ) do
		if client.isLocal == true then
			localPlayerCount = localPlayerCount + 1
		end
	end
	if localPlayerCount == #partyList.sessionClients then
		return false
	elseif LuaUtils.LobbyIsLocked() then
		return false
	end
	return true
end

function IsBleedOutVisible( element, controller )
	local stateFlagModel = element:getModel( controller, "stateFlags" )
	if stateFlagModel then
		local stateFlags = Engine.GetModelValue( stateFlagModel )
		if stateFlags ~= nil then
			return CoD.BitUtility.IsAnyBitSet( stateFlags, {
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT,
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED
			} )
		end
	end
	return false
end

function DropDownListIsInUse( element )
	return element.inUse
end

function CheckBoxOptionChecked( element, event )
	local controller = nil
	if event.menu then
		controller = event.menu.m_ownerController
	else
		controller = event.controller
	end
	local model = element:getModel()
	if model then
		local optionInfo = CoD.PCUtil.GetOptionInfo( model, controller )
		if type( optionInfo.currentValue ) == "number" then
			return math.abs( optionInfo.currentValue - optionInfo.highValue ) < 0.01
		elseif type( optionInfo.currentValue ) == "string" then
			return optionInfo.currentValue == optionInfo.highValue
		end
	end
	return false
end

function MouseButtonEnabled( element )
	return element.handleMouseButton ~= false
end

function ShouldOpenGraphicsConfirm( menu, element, controller )
	return CoD.PCUtil.IsOptionsDirty( controller )
end

function ShouldHideButtonPromptForPC( element, controller )
	if CoD.isPC then
		local values = CoD.PCUtil.GetElementModelValues( element, {
			"Button",
			"Label"
		} )
		if values and values.Label == "MENU_SELECT" and values.Button == Enum.LUIButton.LUI_KEY_XBA_PSCROSS then
			element:setState( "dummy" )
			return true
		end
	end
	return false
end

function DropdownListIsInUse_Console( element )
	return element.inUse
end

function ShouldShowMOTD( controller )
	return Engine.ShouldShowMOTD( controller )
end

function ShouldShowMtxCommsMOTD( controller )
	if Dvar.ui_execdemo_beta:get() then
		return 
	else
		local data = Engine.GetMarketingMessage( controller, "motd" )
		if data ~= nil then
			return true
		else
			return false
		end
	end
end

function ShouldShowMtxCommsMOTDPopup( controller )
	return CoDShared.ShouldShowMtxCommsMOTDPopup( controller )
end

function FeaturedWidgetVisible( controller )
	local f901_local0 = IsMainModeInvalidAndNotTheaterMode()
	if f901_local0 then
		if not IsLAN() then
			f901_local0 = not ShouldShowMtxCommsMOTD( controller )
		else
			f901_local0 = false
		end
	end
	return f901_local0
end

function FeaturedWidgetControllerVisible( controller )
	local cardsData = Engine.GetFeaturedCardsData()
	if cardsData ~= nil and cardsData.validCardsCount >= 2 then
		return true
	elseif HasLiveEvent( controller ) and cardsData.validCardsCount >= 1 then
		return true
	else
		return false
	end
end

function IsBubbleGumBuffEquipped( menu, element, controller )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	end
	local indexModel = Engine.GetModel( elementModel, "itemIndex" )
	if not indexModel then
		return false
	end
	local itemIndex = Engine.GetModelValue( indexModel )
	local bgbPackIndex = Engine.GetEquippedBubbleGumPack( controller )
	for bgbIndex = 0, CoD.BGBUtility.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( controller, bgbPackIndex, bgbIndex ) == itemIndex then
			return true
		end
	end
	return false
end

function IsOutOfLobbyBubbleGum( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if not itemIndexModel then
		return false
	else
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if not CoD.CACUtility.IsItemConsumable( itemIndex ) then
			return false
		else
			local numRemainingModel = element:getModel( controller, "remaining" )
			if not numRemainingModel then
				return false
			else
				local numRemaining = Engine.GetModelValue( numRemainingModel )
				return numRemaining == 0
			end
		end
	end
end

function HasBGBTokensRemaining( element, controller )
	if Engine.GetZMVials( controller ) > 0 == false then
		return false
	else
		local machinePriceModel = element:getModel( controller, "price" )
		local machinePrice = Engine.GetModelValue( machinePriceModel )
		return machinePrice <= Engine.GetZMVials( controller )
	end
end

function IsOwedVials( controller )
	local currentStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if not currentStats then
		return false
	elseif Dvar.tu5_enableVialsOwed:exists() then
		local f906_local0
		if currentStats.vialsOwed:get() > 0 then
			f906_local0 = Dvar.tu5_enableVialsOwed:get()
		else
			f906_local0 = false
		end
		return f906_local0
	else
		return currentStats.vialsOwed:get() > 0
	end
end

function IsShowcaseWeaponEquipped( element, controller )
	local mode = CoD.PlayerRoleUtility.customizationMode
	local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	local weaponIndexModel = Engine.GetModel( element:getModel(), "itemIndex" )
	if not weaponIndexModel then
		return false
	else
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		local equippedWeaponIndex = Engine.GetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "weaponIndex" )
		return weaponIndex == equippedWeaponIndex
	end
end

function InCharacterCustomizationMode( enumValue )
	return CoD.PlayerRoleUtility.customizationMode == enumValue
end

function CharacterHasAnyWeaponUnlocked( controller, element )
	if not IsProgressionEnabled( controller ) and (not IsLive() or not IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )) then
		return true
	end
	local heroIndex = element.heroIndex
	if not heroIndex then
		heroIndex = CoD.SafeGetModelValue( element:getModel(), "heroIndex" )
	end
	if not heroIndex then
		return false
	end
	for i = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, heroIndex, i )
		if not Engine.IsItemLocked( controller, loadoutSlotInfo.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.IsItemPurchased( controller, loadoutSlotInfo.itemIndex, Enum.eModes.MODE_MULTIPLAYER ) then
			return true
		end
	end
	return false
end

function HideExtraSlotsPurchaseButton( self, controller )
	if CoD.perController[controller].selectedStoreCategory == "EXTRASLOTS" then
		return false
	else
		
	end
end

function HasStoreItems( controller )
	if CoD.perController[controller].selectedStoreCategory then
		if CoD.perController[controller].selectedStoreCategory == "EXTRASLOTS" then
			return true
		else
			local products = Engine.GetStoreProductsByCategory( controller, CoD.perController[controller].selectedStoreCategory )
			return #products > 0
		end
	else
		return false
	end
end

function HidePurchaseAndPrice()
	if IsOrbis() or IsBooleanDvarSet( "live_store_hideprice" ) then
		return true
	else
		return false
	end
end

function HideProductNameAndDesc()
	return false
end

function IsLootReady( controller )
	return Engine.IsLootReady( controller )
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
		local f921_local0
		if Dvar.ui_execdemo:get() then
			f921_local0 = Dvar.ui_execdemo:get()
			if f921_local0 then
				f921_local0 = Dvar.ui_execdemo_beta:get()
			end
		else
			f921_local0 = true
		end
	end
	return f921_local0
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

function IsBlackhatHacking( controller )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Hacking
end

function IsBlackhatBreaching( controller )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Breaching
end

function IsBrightnessSliderPipEmpty( element )
	local elementsIndex = element.gridInfoTable.zeroBasedIndex
	local currentlyFocusedElement = element.gridInfoTable.parentGrid.activeWidget
	local currentlyFocusedElementIndex = 0
	if currentlyFocusedElement then
		currentlyFocusedElementIndex = currentlyFocusedElement.gridInfoTable.zeroBasedIndex
	end
	if currentlyFocusedElementIndex < elementsIndex then
		return true
	else
		
	end
end

function IsAlertOverlay( self, controller )
	local typeModel = self:getModel( controller, "categoryType" )
	if typeModel then
		local type = Engine.GetModelValue( typeModel )
		local f929_local0
		if type ~= CoD.OverlayUtility.OverlayTypes.Alert and type ~= CoD.OverlayUtility.OverlayTypes.Error then
			f929_local0 = false
		else
			f929_local0 = true
		end
		return f929_local0
	else
		return false
	end
end

function HasOverlayBackAction( menu )
	return menu[CoD.OverlayUtility.GoBackPropertyName] ~= nil
end

function HasOverlayContinueAction( menu )
	return menu[CoD.OverlayUtility.ContinuePropertyName] ~= nil
end

function IsPrimaryControllerIndex( controller )
	if Engine.GetPrimaryController() == controller then
		return true
	else
		return false
	end
end

function IsTriggersFlipped( controller )
	return Engine.GetProfileVarInt( controller, "flipped_control_config" ) == 1
end

function IsCodCasterQuickSettingEnabled( menu, element, controller )
	if not element.profileVar then
		return false
	else
		return CoD.ShoutcasterProfileVarBool( controller, element.profileVar )
	end
end

function IsCodCaster( controller )
	if CoD.IsShoutcaster( controller ) then
		return true
	else
		return false
	end
end

function IsCodCasterProfileValueEqualTo( controller, profileVarName, expressionArg )
	local profileVarValue = CoD.ShoutcasterProfileVarValue( controller, profileVarName )
	local f936_local0
	if profileVarValue == nil or profileVarValue ~= expressionArg then
		f936_local0 = false
	else
		f936_local0 = true
	end
	return f936_local0
end

function ShouldHideCodCasterHud( controller )
	if not IsGlobalModelValueGreaterThan( controller, "scoreboard.team1.count", 0 ) and not IsGlobalModelValueGreaterThan( controller, "scoreboard.team2.count", 0 ) then
		return true
	else
		return false
	end
end

function ShouldPresentRegistration( controller )
	local data = Engine.GetMarketingMessage( controller, "registration" )
	if data == nil or data.messageViewReported == true then
		return false
	else
		local action = data.action
		if action == "registration" then
			return true
		elseif action == "opt-in" then
			return true
		else
			return false
		end
	end
end

function ShouldPresentMOTDBanner( controller, overlay )
	local invalidMarketingMessageProvided = false
	local marketingData = Engine.GetMarketingMessage( controller, "registration" )
	if marketingData ~= nil then
		local marketingAction = marketingData.action
		if marketingAction == "registration" or marketingAction == "opt-in" or marketingAction == "store" or marketingAction == "blackmarket" or marketingAction == "drmonty" or marketingAction == "expand" then
			return true
		end
		invalidMarketingMessageProvided = true
	end
	if ShouldShowMtxCommsMOTDPopup( controller ) then
		local motdData = Engine.GetMarketingMessage( controller, "motd" )
		if motdData == nil or not motdData.hasBanner then
			return false
		elseif invalidMarketingMessageProvided == true then
			local model = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" )
			Engine.SetModelValue( Engine.GetModel( model, "content_short" ), motdData.bannerTitle )
			Engine.SetModelValue( Engine.GetModel( model, "action" ), motdData.bannerAction )
			Engine.SetModelValue( Engine.GetModel( model, "image" ), motdData.bannerImage )
			Engine.SetModelValue( Engine.GetModel( model, "action_title" ), motdData.bannerActionString )
			Engine.SetModelValue( Engine.GetModel( model, "locationID" ), 1 )
		end
		return true
	end
	return false
end

function FuseBoxVisible( controller, fuseStr )
	if CoD.Zombie[fuseStr] then
		local modelPath = "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie[fuseStr]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == 1
	else
		
	end
end

function RocketShieldBlueprintPieceVisible( controller, pieceStr )
	if CoD.Zombie[pieceStr] then
		local modelPath = "zmInventory." .. CoD.Zombie[pieceStr]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == 1
	else
		
	end
end

function CastleRocketShieldBlueprintPieceVisible( controller, pieceStr )
	if CoD.Zombie[pieceStr] then
		local modelPath = "zmInventory." .. CoD.Zombie[pieceStr]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == 1
	else
		
	end
end

function IDGunBlueprintPieceVisible( controller, pieceStr )
	if CoD.Zombie[pieceStr] then
		local modelPath = "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie[pieceStr]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == 1
	else
		
	end
end

function SummonningKeyVisible( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function SummoningKeyBeingUsed( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.USED_QUEST_KEY
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	local modelValue = Engine.GetModelValue( model )
	local f945_local0 = model
	local f945_local1
	if modelValue <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or modelValue >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES then
		f945_local1 = false
	else
		f945_local1 = f945_local0 and true
	end
	return f945_local1
end

function SummoningKeyBeingUsedByOtherPlayer( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.USED_QUEST_KEY
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	local modelValue = Engine.GetModelValue( model )
	local characterIdentity = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_character_identity" ) )
	local f946_local0 = model
	local f946_local1
	if modelValue <= CoD.Zombie.PLAYER_USED_QUEST_KEY_NONE or modelValue >= CoD.Zombie.PLAYER_USED_QUEST_KEY_STATES or modelValue == characterIdentity then
		f946_local1 = false
	else
		f946_local1 = f946_local0 and true
	end
	return f946_local1
end

function SummoningKeyMissing( controller )
	local checkBoxer = CheckMemento( controller, CoD.Zombie.ZOD_NAME_BOXER )
	local checkDetective = CheckMemento( controller, CoD.Zombie.ZOD_NAME_DETECTIVE )
	local checkFemme = CheckMemento( controller, CoD.Zombie.ZOD_NAME_FEMME )
	local checkMagician = CheckMemento( controller, CoD.Zombie.ZOD_NAME_MAGICIAN )
	local f947_local0 = checkBoxer
	local f947_local1 = checkDetective
	local f947_local2 = checkFemme
	local check = checkMagician
	return (f947_local2 or f947_local1 or f947_local0 or check) and not SummonningKeyVisible( controller )
end

function IsRitualItemInState( controller, characterName, stateName )
	if CoD.Zombie[characterName] and CoD.Zombie[stateName] then
		local modelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie[characterName]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == CoD.Zombie[stateName]
	else
		
	end
end

function IsRitualItemHeldBy( controller, ritualItemCharacter, characterEnum )
	if CoD.Zombie[ritualItemCharacter] and CoD.Zombie[characterEnum] then
		local modelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie[ritualItemCharacter]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == CoD.Zombie[characterEnum]
	else
		
	end
end

function IsRitualItemMissing( controller, ritualItemCharacter )
	if CoD.Zombie[ritualItemCharacter] then
		local checkModelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[ritualItemCharacter] .. CoD.Zombie.MEMENTO_SUFFIX
		local checkModel = Engine.GetModel( Engine.GetModelForController( controller ), checkModelPath )
		return checkModel and Engine.GetModelValue( checkModel ) == 1 and IsRitualItemInState( controller, ritualItemCharacter, "CLIENTFIELD_ZOD_UI_QUEST_STATE_NEED_MEMENTO" )
	else
		
	end
end

function IsRitualItemBeingUsed( controller, ritualItemCharacter )
	if CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. ritualItemCharacter] then
		local modelPath = "zmInventory." .. CoD.Zombie.USED_QUEST_KEY_LOCATION
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == CoD.Zombie["PLAYER_USED_QUEST_KEY_" .. ritualItemCharacter]
	else
		
	end
end

function IsRitualItemWithAnotherPlayer( controller, ritualItemCharacter )
	if CoD.Zombie[ritualItemCharacter] then
		local checkModelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. CoD.Zombie[ritualItemCharacter] .. CoD.Zombie.MEMENTO_SUFFIX
		local checkModel = Engine.GetModel( Engine.GetModelForController( controller ), checkModelPath )
		local f952_local0 = checkModel and Engine.GetModelValue( checkModel ) == 1
		local characterIdentity = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_character_identity" ) )
		return f952_local0 and not IsRitualItemHeldBy( controller, ritualItemCharacter, CoD.Zombie.GetCharacterEnumString( characterIdentity ) )
	else
		
	end
end

function HasTalonSpikeItem( controller, itemId )
	local itemPartIdString = CoD.Zombie[itemId]
	if not itemPartIdString then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CRAFTABLE_GRAVITYSPIKE .. "_" .. itemPartIdString ) == 1
	end
end

function ShowGasMaskPartsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_GASMASK_PARTS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function HasGasMaskItem( controller, itemId )
	local itemPartIdString = CoD.Zombie[itemId]
	if not itemPartIdString then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CRAFTABLE_GASMASK .. "_" .. itemPartIdString ) == 1
	end
end

function ShowMachineToolsPartsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_MACHINETOOLS_PARTS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function HasMachineToolsItem( controller, itemId )
	local itemPartIdString = CoD.Zombie[itemId]
	if not itemPartIdString then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "zmInventory." .. itemPartIdString .. "_" .. CoD.Zombie.CRAFTABLE_MACHINETOOLS ) == 1
	end
end

function ShowWonderWeaponPartsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_WONDERWEAPON_PARTS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function HasWonderWeaponItem( controller, itemId )
	local itemPartIdString = CoD.Zombie[itemId]
	if not itemPartIdString then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CRAFTABLE_WONDERWEAPON .. "_" .. itemPartIdString ) == 1
	end
end

function ShowBucketPartsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_BUCKET_PARTS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function HasBucketSeedItem( controller, itemId )
	local itemPartIdString = CoD.Zombie[itemId]
	if not itemPartIdString then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "zmInventory." .. CoD.Zombie.CRAFTABLE_BUCKET .. "_" .. itemPartIdString ) == 1
	end
end

function SprayerMissing( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.POD_SPRAYER_HINT_RANGE
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	local f962_local0 = model
	local f962_local1
	if Engine.GetModelValue( model ) == 1 then
		f962_local1 = not SprayerFound( controller )
	else
		f962_local1 = false
	end
	return f962_local1
end

function SprayerFound( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.POD_SPRAYER_HELD
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function SprayerInUse( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.PLAYER_USING_SPRAYER
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ShowQuestItemsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_QUEST_ITEMS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ShowIDGunPartsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_IDGUN_PARTS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ShowRocketShieldPartsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_ROCKETSHIELD_PARTS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ShowGravitySpikePartsWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_GRAVITYSPIKE_PARTS
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ShowFuseBoxWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_FUSES
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ShowEggWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_EGG
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ShowSprayerWidget( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.WIDGET_SPRAYER
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function QuestEggInState( controller, state )
	if CoD.Zombie[state] then
		local modelPath = "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_EGG_STATE
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == CoD.Zombie[state]
	else
		
	end
end

function QuestEggQuest1Complete( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.PLAYER_SWORD_QUEST_COMPLETED_LEVEL_1
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function ChatClientShow( controller )
	return CoD.isPC
end

function ChatClientEnabled( controller )
	return ChatClientShow( controller ) and Dvar.chatClientEnabled:get() == true
end

function ChatClientIsAvailable( self, element, controller )
	return ChatClientEnabled( controller ) and Engine.ChatClient_IsAvailable( controller )
end

function ChatClientIsChatting( controller )
	return ChatClientEnabled( controller ) and Engine.ChatClient_IsChatting( controller )
end

function ChatClientAnySubMenuOpen( controller )
	if not ChatClientShow( controller ) then
		return false
	end
	local open = false
	local model = CoD.ChatClientUtility.GetMenuInputChannelShowModel()
	if model ~= nil then
		local modelValue = Engine.GetModelValue( model )
		open = modelValue > 0
	end
	if not open then
		model = CoD.ChatClientUtility.GetMenuSettingsShowModel()
		if model ~= nil then
			local modelValue = Engine.GetModelValue( model )
			open = modelValue > 0
		end
	end
	return open
end

function CharacterCustomization_IsEnabled( controller )
	if LuaUtils.IsGamescomBuild() or Dvar.ui_execdemo_beta:get() then
		return false
	else
		return true
	end
end

function IsArabicSku()
	if Engine.IsLanguageSupportedInSKU( Enum.language_t.LANGUAGE_ENGLISHARABIC ) and Engine.IsLanguageSupportedInSKU( Enum.language_t.LANGUAGE_ARABIC ) then
		return true
	else
		return false
	end
end

function IsChineseSku()
	if Engine.IsLanguageSupportedInSKU( Enum.language_t.LANGUAGE_TRADITIONALCHINESE ) and Engine.IsLanguageSupportedInSKU( Enum.language_t.LANGUAGE_SIMPLIFIEDCHINESE ) then
		return true
	else
		return false
	end
end

function IsJapaneseSku()
	if Engine.IsLanguageSupportedInSKU( Enum.language_t.LANGUAGE_FULLJAPANESE ) and Engine.IsLanguageSupportedInSKU( Enum.language_t.LANGUAGE_JAPANESE ) then
		return true
	else
		return false
	end
end

function IsCurrentLanguageEnglish()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == Enum.language_t.LANGUAGE_ENGLISH or currentLanguage == Enum.language_t.LANGUAGE_ENGLISHARABIC then
		return true
	else
		return false
	end
end

function IsCurrentTextLanguageEnglish()
	return CoDShared.IsCurrentTextLanguageEnglish()
end

function IsCurrentLanguageArabic()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == Enum.language_t.LANGUAGE_ARABIC then
		return true
	else
		return false
	end
end

function IsCurrentLanguageFrench()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == Enum.language_t.LANGUAGE_FRENCH then
		return true
	else
		return false
	end
end

function ShouldDisplayLanguageSelectionScreen()
	if IsArabicSku() or IsJapaneseSku() then
		return true
	elseif IsChineseSku() then
		local systemLanguage = Dvar.loc_systemLanguage:get()
		if systemLanguage ~= Enum.language_t.LANGUAGE_PORTUGUESE then
			return true
		end
	end
	return false
end

function ShouldDisplayFirstTimeLanguageSelectionScreen( controller )
	if Engine.GetCountLanguagesInSKU() and Engine.GetCountLanguagesInSKU() > 1 then
		local systemLanguage = Dvar.loc_systemLanguage:get()
		if Engine.IsLanguageSupportedInSKU and Engine.IsLanguageSupportedInSKU( systemLanguage ) then
			return false
		else
			local languageSaved = Dvar.loc_languageSaved:get()
			if languageSaved then
				return false
			else
				return ShouldDisplayLanguageSelectionScreen()
			end
		end
	else
		return false
	end
end

function IsCurrentLanguageReversed()
	return Engine.IsCurrentLanguageReversed()
end

function IsFeaturedCardButtonPressed( event )
	local f990_local0
	if event.button == "alt1" then
		f990_local0 = event.down
	else
		f990_local0 = false
	end
	return f990_local0
end

function FeaturedCards_IsEnabled( element, controller )
	local menuID = LobbyData.GetLobbyNav()
	local f991_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
	if menuID ~= f991_local0.id then
		f991_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
		if menuID ~= f991_local0.id then
			return false
		end
	end
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true )
	local myModel = Engine.CreateModel( rootModel, "Enabled", true )
	local v = Engine.GetModelValue( myModel )
	if HasLiveEvent( controller ) then
		return true
	end
	local cardsData = Engine.GetFeaturedCardsData()
	if Dvar.live_featuredEnabled:get() == false or cardsData.enabled == false then
		return false
	elseif cardsData.validCardsCount == 0 then
		return false
	end
	return true
end

function FeaturedCards_Update( element, controller )
	return true
end

function ConnectionMeter_isEnabled( element, controller )
	if Dvar.ui_enableConnectionMetricGraphs:get() == 0 then
		return false
	elseif Engine.ProfileInt( controller, "showConnectionMeter" ) ~= 1 then
		return false
	else
		return true
	end
end

function HighestMapReachedGreaterThan( controller, expressionArg )
	local currentStats = CoD.GetPlayerStats( controller )
	local f994_local0 = currentStats
	local f994_local1 = currentStats.highestMapReached
	if f994_local1 then
		local highestMapReached = currentStats.highestMapReached:get()
		f994_local1 = f994_local0 and highestMapReached
	end
	local f994_local2
	if f994_local1 == nil or expressionArg >= f994_local1 then
		f994_local2 = false
	else
		f994_local2 = true
	end
	return f994_local2
end

function MissionRecordMapComplete( element, controller )
	local mapname = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo.mapId" ) )
	local completed = Engine.GetDStat( controller, "PlayerStatsByMap", mapname, "hasBeenCompleted" )
	if completed == 1 then
		return true
	else
		return false
	end
end

function IsGameInstalled()
	return CoDShared.IsGameInstalled()
end

function IsGameModeInstalled( controllerIndex, enumValue )
	if enumValue == Enum.eModes.MODE_CAMPAIGN then
		return Engine.IsCpStillDownloading() == false
	elseif enumValue == Enum.eModes.MODE_MULTIPLAYER then
		return Engine.IsMpStillDownloading() == false
	elseif enumValue == Enum.eModes.MODE_ZOMBIES then
		return Engine.IsZmStillDownloading() == false
	else
		return false
	end
end

function PlayGoIsStillDownloading( controller )
	if Engine.IsMpStillDownloading() or Engine.IsMpInitialStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsZmInitialStillDownloading() then
		return true
	else
		return false
	end
end

function ShouldShowCampaignResetOption( controller )
	return controller == Engine.GetPrimaryController()
end

function ZMDoubleXPWidgetVisible( controller )
	local f1000_local0 = IsZombies()
	if f1000_local0 then
		if not IsLAN() then
			f1000_local0 = not IsModelValueEqualTo( controller, "doubleXPTimeRemaining", 0 )
		else
			f1000_local0 = false
		end
	end
	if IsInGame() then
		return f1000_local0
	elseif Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 and Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) <= 1 then
		local f1000_local1 = false
	else
		local splitscreen = true
	end
	return f1000_local0 and not f1000_local1
end

function IsZMDoubleXPWeekend( controller )
	return Engine.IsDoubleXPWeekend( controller )
end

function EnableCombatRecordCompare( controller )
	return true
end

function IsCPCombatRecordLockedForSocialPlayerInfo( controller, element )
	local rankModel = element:getModel( controller, "cpRank" )
	if rankModel then
		local rank = Engine.GetModelValue( rankModel )
		if rank then
			return rank < 1
		end
	end
	return false
end

function IsMPCombatRecordLockedForSocialPlayerInfo( controller, element )
	local minRank = 7
	local rankModel = element:getModel( controller, "mpRank" )
	local prestigeModel = element:getModel( controller, "mpPrestige" )
	if rankModel and prestigeModel then
		local rank = Engine.GetModelValue( rankModel )
		local prestige = Engine.GetModelValue( prestigeModel )
		if rank and prestige then
			local f1004_local0
			if rank >= minRank or prestige >= 1 then
				f1004_local0 = false
			else
				f1004_local0 = true
			end
			return f1004_local0
		end
	end
	return false
end

function IsZMCombatRecordLockedForSocialPlayerInfo( controller, element )
	local minRank = 2
	local rankModel = element:getModel( controller, "zmRank" )
	local prestigeModel = element:getModel( controller, "zmPrestige" )
	if rankModel and prestigeModel then
		local rank = Engine.GetModelValue( rankModel )
		local prestige = Engine.GetModelValue( prestigeModel )
		if rank and prestige then
			local f1005_local0
			if rank >= minRank or prestige >= 1 then
				f1005_local0 = false
			else
				f1005_local0 = true
			end
			return f1005_local0
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

function IsComparingStats( controller )
	local combatRecordComparingModel = Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" )
	if not combatRecordComparingModel or not Engine.GetModelValue( combatRecordComparingModel ) then
		return false
	else
		local otherPlayerStatsInProgressModel = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" )
		if not otherPlayerStatsInProgressModel or Engine.GetModelValue( otherPlayerStatsInProgressModel ) then
			return false
		else
			local otherPlayerStatsSuccessModel = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" )
			if not otherPlayerStatsSuccessModel or not Engine.GetModelValue( otherPlayerStatsSuccessModel ) then
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

function IsStorageValueAtLeast( controller, storageArea, path, expressionArg )
	local storageBase = DataSources.StorageGlobal.getModel( controller )
	local storageModelValue = CoD.SafeGetModelValue( storageBase, storageArea )
	if storageModelValue then
		local storageLookup = StorageLookup( controller, path, storageModelValue )
		return storageLookup and expressionArg <= tonumber( storageLookup )
	else
		return false
	end
end

function IsStorageValueEqualTo( controller, storageArea, path, expressionArg )
	local storageBase = DataSources.StorageGlobal.getModel( controller )
	local storageModelValue = CoD.SafeGetModelValue( storageBase, storageArea )
	if storageModelValue then
		local storageLookup = StorageLookup( controller, path, storageModelValue )
		return storageLookup and tonumber( storageLookup ) == expressionArg
	else
		return false
	end
end

function HasLiveEvent( controller )
	local liveEventModel = DataSources.LiveEventViewer.getModel( controller )
	local stream = CoD.SafeGetModelValue( liveEventModel, "stream" )
	return stream and stream ~= ""
end

function IsMLGStream( controller )
	local liveEventModel = DataSources.LiveEventViewer.getModel( controller )
	local stream = CoD.SafeGetModelValue( liveEventModel, "stream" )
	return stream and LUI.startswith( stream, "mlg/" )
end

function ElementHasText( self, elementName )
	if self[elementName] and self[elementName].getText then
		local text = self[elementName]:getText()
		local f1015_local0 = text
		local f1015_local1
		if text == "" or text == Engine.Localize( "" ) then
			f1015_local1 = false
		else
			f1015_local1 = f1015_local0 and true
		end
		return f1015_local1
	else
		
	end
end

function IsNotLobbyGameHostOrNotPrimaryController( controller )
	local isLobbyHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1016_local0 = Engine.GetPrimaryController() == controller
	local f1016_local1
	if isLobbyHost then
		f1016_local1 = not f1016_local0
	else
		f1016_local1 = true
	end
	return f1016_local1
end

function DoesPlayerHaveExtraSlotsItem( controller )
	if Dvar.extra_slots_id:exists() and Dvar.extra_slots_id:get() then
		local skuId = Dvar.extra_slots_id:get()
		return Engine.GetInventoryItemQuantity( controller, skuId ) > 0
	else
		return false
	end
end

function IsFreeCursorPrototypeBuild( controller )
	return IsFreeCursorActive( controller ) and IsIntDvarNonZero( "mp_prototype" )
end

function CursorInputEnabledForBuild( controller )
	return Engine.IsUsingCursor()
end

function IsFreeCursorActive( controller )
	return Engine.IsUsingCursor() and IsBooleanDvarSet( "ui_usingFreeCursor" )
end

function AnyContextualButtonPrompts( self )
	local f1021_local0 = self:getModel()
	local buttonsModel = f1021_local0.buttonPrompts:get()
	if buttonsModel then
		for i = 0, Enum.LUIButton.LUI_BUTTON_COUNT - 1, 1 do
			local buttonModel = buttonsModel[i]
			if buttonModel and buttonModel:get() ~= Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS then
				local flagsModel = buttonModel.flags
				local labelModel = buttonModel.Label
				if flagsModel and labelModel and labelModel:get() ~= "" and labelModel:get() ~= emptyLoc and flagsModel:get() & Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ~= 0 then
					return true
				end
			end
		end
	end
	return false
end

function IsFreeCursorOnLeftOfScreen( controller )
	if Engine.UsingFreeCursor() and IsLuaCodeVersionAtLeast( 26 ) then
		local f1022_local0 = DataSources.FreeCursor.getModel( controller )
		local x, y = f1022_local0.position:get()
		local sX, xY = Engine.GetScreenSize( controller )
		return x < sX / 2
	else
		return false
	end
end

function IsFreeCursorOnTopOfScreen( controller )
	if Engine.UsingFreeCursor() and IsLuaCodeVersionAtLeast( 26 ) then
		local f1023_local0 = DataSources.FreeCursor.getModel( controller )
		local x, y = f1023_local0.position:get()
		local sX, xY = Engine.GetScreenSize( controller )
		return y < xY / 2
	else
		return false
	end
end

function AmICarryingBriefcase( controller )
	return IsGlobalDataSourceModelValueEqualTo( controller, "CPGamePlayBundleData", "briefcaseClient", Engine.GetPredictedClientNum( controller ) )
end

function IsPlayerStatEqualToElementModel( controller, statPath, element, modelPath )
	local stats = Engine.GetPlayerStats( controller )
	if stats then
		stats = LUI.getTableFromPath( statPath, stats )
	end
	if stats then
		local model = element:getModel()
		model = model and model[modelPath]
		if model then
			return stats:get() == model:get()
		end
	end
end

function IsPlayerStatEqualToElementProperty( controller, statPath, element, propertyPath )
	local stats = Engine.GetPlayerStats( controller )
	if stats then
		stats = LUI.getTableFromPath( statPath, stats )
	end
	if stats then
		local propertyValue = LUI.getTableFromPath( propertyPath, element )
		return stats:get() == propertyValue
	else
		
	end
end

