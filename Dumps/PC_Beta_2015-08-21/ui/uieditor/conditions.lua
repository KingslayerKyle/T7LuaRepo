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

function FileshareIsSteamAgreed()
	return CoD.SteamWorkshopUtility.GetPublishSteamAgreement()
end

function FilesharePublishToSteamDisabled( f12_arg0 )
	local f12_local0
	if FileshareIsSteamAgreed() then
		f12_local0 = not FileshareIsReady( f12_arg0 )
	else
		f12_local0 = true
	end
	return f12_local0
end

function FileshareShouldAllowDownload()
	return CoD.FileshareUtility.GetPublishAllowDownload()
end

function FileshareIsReady( f14_arg0 )
	if CoD.FileshareUtility.IsFileshareReady( f14_arg0 ) == 0 then
		return false
	else
		return true
	end
end

function FileshareIsQuotaLineDim( f15_arg0, f15_arg1 )
	return Engine.GetModelValue( f15_arg0:getModel( f15_arg1, "isDim" ) )
end

function ShouldOpenMessageDialog( f16_arg0 )
	if f16_arg0:getParent() == nil then
		return 
	end
	local f16_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f16_local0 ~= nil then
		local f16_local1 = Engine.GetModel( f16_local0, "messagePending" )
		if f16_local1 ~= nil and Engine.GetModelValue( f16_local1 ) > 0 then
			return true
		end
	end
	return false
end

function IsInDefaultState( f17_arg0 )
	return f17_arg0.currentState == "DefaultState"
end

function IsInDefaultStateOrStateNotSet( f18_arg0 )
	if not f18_arg0.currentState then
		return true
	else
		return f18_arg0.currentState == "DefaultState"
	end
end

function IsElementInState( f19_arg0, f19_arg1 )
	return f19_arg0.currentState == f19_arg1
end

function IsSiblingElementInState( f20_arg0, f20_arg1, f20_arg2 )
	return f20_arg0[f20_arg1].currentState == f20_arg2
end

function IsMenuInState( f21_arg0, f21_arg1 )
	return f21_arg0.currentState == f21_arg1
end

function IsSelfInState( f22_arg0, f22_arg1 )
	return f22_arg0.currentState == f22_arg1
end

function IsWidthZero( f23_arg0 )
	return f23_arg0 == 0
end

function IsFirstListElement( f24_arg0 )
	return f24_arg0:isFirstItem()
end

function IsLastListElement( f25_arg0 )
	return f25_arg0:isLastItem()
end

function IsListAtStart( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = f26_arg0[f26_arg1]
	if f26_local0 and f26_local0.activeWidget and (not f26_arg2 or not f26_arg2.list or f26_arg2.list == f26_local0) then
		return f26_local0.activeWidget:isFirstItem()
	else
		return false
	end
end

function IsListAtEnd( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = f27_arg0[f27_arg1]
	if f27_local0 and f27_local0.activeWidget and (not f27_arg2 or not f27_arg2.list or f27_arg2.list == f27_local0) then
		return f27_local0.activeWidget:isLastItem()
	else
		return false
	end
end

function ListElementHasElements( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = f28_arg0[f28_arg1]
	if f28_local0 then
		local f28_local1 = f28_local0:getDataSource()
		if f28_local1 then
			return f28_local1:getCount() > 0
		end
	end
	return false
end

function ListLoopEdgesEnabled( f29_arg0, f29_arg1 )
	local f29_local0 = f29_arg0[f29_arg1]
	if f29_local0 then
		return f29_local0.loopEdges
	else
		return false
	end
end

function IsElementInFocus( f30_arg0 )
	return f30_arg0:isInFocus()
end

function isClientListSlideFocus( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	if not CoD.isPC then
		return IsWidgetInFocus( f31_arg0, f31_arg1, f31_arg2 )
	elseif f31_arg0.defaultNav and f31_arg0.defaultNav == "right" and IsWidgetInFocus( f31_arg0, f31_arg1, f31_arg2 ) then
		return true
	end
	return IsGamepad( f31_arg3 ) and IsWidgetInFocus( f31_arg0, f31_arg1, f31_arg2 )
end

function IsWidgetInFocus( f32_arg0, f32_arg1, f32_arg2 )
	if f32_arg0[f32_arg1] then
		if f32_arg2.idStack then
			local f32_local0 = f32_arg0[f32_arg1].id
			for f32_local4, f32_local5 in ipairs( f32_arg2.idStack ) do
				if f32_local5 == f32_local0 then
					return true
				end
			end
			return false
		elseif f32_arg2.id then
			return f32_arg0[f32_arg1]:hasChildWithID( f32_arg2.id )
		else
			return f32_arg0[f32_arg1]:doesElementOrChildHaveFocus()
		end
	else
		return false
	end
end

function IsFirstTimeSetup( f33_arg0, f33_arg1 )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	elseif not (not Engine.IsMultiplayerGame() or not IsLAN()) or Engine.IsInGame() then
		return false
	else
		return not Engine.IsFirstTimeComplete( f33_arg0, f33_arg1 )
	end
end

function IsMainFirstTimeSetup( f34_arg0 )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	else
		return Engine.GetProfileVarInt( f34_arg0, "com_first_time" ) ~= 0
	end
end

function GrayOutReplayMissionButton( f35_arg0 )
	return false
end

function IsBooleanDvarSet( f36_arg0 )
	if Dvar[f36_arg0] then
		return Dvar[f36_arg0]:get() == true
	else
		return false
	end
end

function IsIntDvarNonZero( f37_arg0 )
	if Engine.DvarInt( nil, f37_arg0 ) ~= 0 then
		return true
	else
		return false
	end
end

function IsInGame()
	return Engine.IsInGame()
end

function IsCurrentMenu( f39_arg0, f39_arg1 )
	if f39_arg0.menuName == f39_arg1 then
		return true
	else
		return false
	end
end

function PropertyIsTrue( f40_arg0, f40_arg1 )
	if f40_arg0 == nil then
		return false
	else
		return f40_arg0[f40_arg1] == true
	end
end

function IsElementPropertyValue( f41_arg0, f41_arg1, f41_arg2 )
	if f41_arg0 == nil then
		return false
	else
		return f41_arg0[f41_arg1] == f41_arg2
	end
end

function IsElementPropertyEnumValue( f42_arg0, f42_arg1, f42_arg2 )
	if f42_arg0 == nil then
		return false
	else
		return f42_arg0[f42_arg1] == f42_arg2
	end
end

function HasProperty( f43_arg0, f43_arg1 )
	if f43_arg0 == nil then
		return false
	else
		return f43_arg0[f43_arg1] ~= nil
	end
end

function ParentPropertyIsTrue( f44_arg0, f44_arg1 )
	if f44_arg0 == nil or f44_arg0:getParent() == nil then
		return false
	else
		local f44_local0 = f44_arg0:getParent()
		return f44_local0[f44_arg1] == true
	end
end

function IsPerControllerTablePropertyValue( f45_arg0, f45_arg1, f45_arg2 )
	return CoD.perController[f45_arg0][f45_arg1] == f45_arg2
end

function IsPerControllerTablePropertyEnumValue( f46_arg0, f46_arg1, f46_arg2 )
	return CoD.perController[f46_arg0][f46_arg1] == f46_arg2
end

function IsActiveLocalClientsCountEqualTo( f47_arg0 )
	return Engine.GetActiveLocalClientsCount() == f47_arg0
end

function IsCampaign()
	return CoD.isCampaign
end

function IsMultiplayer()
	return CoD.isMultiplayer and not CoD.isCampaign
end

function IsZombies()
	return CoD.isZombie
end

function IsGroupsEnabled()
	local f51_local0 = Dvar.groups_enabled:get()
	if f51_local0 ~= nil and f51_local0 == true then
		return true
	else
		return false
	end
end

function DoesHaveAdminRightsForGroup( f52_arg0, f52_arg1 )
	local f52_local0 = IsGroupOwner( f52_arg0, f52_arg1 )
	if not f52_local0 then
		f52_local0 = IsGroupAdmin( f52_arg0, f52_arg1 )
	end
	return f52_local0
end

local f0_local0 = function ( f53_arg0, f53_arg1 )
	return Engine.GetModelValue( f53_arg0:getModel( f53_arg1, "memberStatus" ) )
end

local f0_local1 = function ( f54_arg0 )
	return Engine.GetModelValue( Engine.GetModel( f54_arg0, "memberStatus" ) )
end

function IsNotAGroupMember( f55_arg0, f55_arg1 )
	local f55_local0 = nil
	if CoD.perController[f55_arg1].selectedGroup then
		f55_local0 = f0_local1( CoD.perController[f55_arg1].selectedGroup )
	elseif f55_arg0 then
		f55_local0 = f0_local0( f55_arg0, f55_arg1 )
	end
	return f55_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_NONE
end

function IsGroupMember( f56_arg0, f56_arg1 )
	local f56_local0 = nil
	if CoD.perController[f56_arg1].selectedGroup then
		f56_local0 = f0_local1( CoD.perController[f56_arg1].selectedGroup )
	elseif f56_arg0 then
		f56_local0 = f0_local0( f56_arg0, f56_arg1 )
	end
	return f56_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_MEMBER
end

function IsGroupAdmin( f57_arg0, f57_arg1 )
	local f57_local0 = nil
	if CoD.perController[f57_arg1].selectedGroup then
		f57_local0 = f0_local1( CoD.perController[f57_arg1].selectedGroup )
	elseif f57_arg0 then
		f57_local0 = f0_local0( f57_arg0, f57_arg1 )
	end
	return f57_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN
end

function IsGroupOwner( f58_arg0, f58_arg1 )
	local f58_local0 = nil
	if CoD.perController[f58_arg1].selectedGroup then
		f58_local0 = f0_local1( CoD.perController[f58_arg1].selectedGroup )
	elseif f58_arg0 then
		f58_local0 = f0_local0( f58_arg0, f58_arg1 )
	end
	return f58_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER
end

function IsGroupListHeader( f59_arg0 )
	return f59_arg0.type == "header"
end

function DoesGroupListHaveSelectedIcon( f60_arg0 )
	local f60_local0
	if f60_arg0.showSelectedIcon == nil or f60_arg0.showSelectedIcon ~= true then
		f60_local0 = false
	else
		f60_local0 = true
	end
	return f60_local0
end

function IsProcessingGroupTask( f61_arg0 )
	local modelValue = Engine.GetModelValue( GetProcessingGroupTaskModel( f61_arg0 ) )
	local f61_local1
	if modelValue == nil or modelValue ~= true then
		f61_local1 = false
	else
		f61_local1 = true
	end
	return f61_local1
end

function IsGroupEmblemEmpty( f62_arg0, f62_arg1 )
	local f62_local0 = nil
	if CoD.perController[f62_arg1].selectedGroup then
		f62_local0 = Engine.GetModel( CoD.perController[f62_arg1].selectedGroup, "groupId" )
	else
		f62_local0 = f62_arg0:getModel( f62_arg1, "groupId" )
	end
	if f62_local0 ~= nil then
		local f62_local1 = Engine.GetModelValue( f62_local0 )
		if f62_local1 ~= nil then
			return Engine.IsGroupEmblemEmpty( f62_arg1, f62_local1 )
		end
	end
	return true
end

function HasSelectedGroup( f63_arg0, f63_arg1 )
	local f63_local0 = nil
	if f63_arg0 ~= nil then
		if CoD.perController[f63_arg1].selectedGroup then
			f63_local0 = Engine.GetModel( CoD.perController[f63_arg1].selectedGroup, "groupId" )
		else
			f63_local0 = f63_arg0:getModel( f63_arg1, "groupId" )
		end
		if f63_local0 ~= nil then
			local f63_local1 = Engine.GetModelValue( f63_local0 )
			if f63_local1 ~= nil and f63_local1 ~= 0 then
				return true
			end
		end
	end
	return false
end

function HasPendingInvites( f64_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f64_arg0 ), "groups" ), "inviteCount" ) )
	local f64_local1
	if modelValue == nil or modelValue <= 0 then
		f64_local1 = false
	else
		f64_local1 = true
	end
	return f64_local1
end

function IsMemberOfAnyGroup( f65_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f65_arg0 ), "groups" ), "groupCount_self" ) )
	local f65_local1
	if modelValue == nil or modelValue <= 0 then
		f65_local1 = false
	else
		f65_local1 = true
	end
	return f65_local1
end

function IsGroupHeadquartersTabSelected( f66_arg0, f66_arg1 )
	local f66_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f66_arg0 ), "groups" ), "grouphqtabname" ) )
	if f66_local0 ~= nil and f66_local0 == f66_arg1 then
		return true
	else
		return false
	end
end

function IsGroupLeaderboardInitialized()
	local f67_local0, f67_local1, f67_local2, f67_local3, f67_local4 = Engine.GetGroupLeaderboardInfo()
	local f67_local5
	if f67_local4 == nil or f67_local4 ~= true then
		f67_local5 = false
	else
		f67_local5 = true
	end
	return f67_local5
end

function IsGroupLeaderboardAvailable()
	local f68_local0, f68_local1, f68_local2, f68_local3, f68_local4 = Engine.GetGroupLeaderboardInfo()
	local f68_local5
	if f68_local4 == nil or f68_local4 ~= true or f68_local0 == nil or f68_local0 <= 0 then
		f68_local5 = false
	else
		f68_local5 = true
	end
	return f68_local5
end

function IsLeaderboardUpdating()
	local f69_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "isUpdating" ) )
	local f69_local1
	if f69_local0 == nil or f69_local0 ~= true then
		f69_local1 = false
	else
		f69_local1 = true
	end
	return f69_local1
end

function IsLeaderboardEmpty()
	local f70_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
	local f70_local1
	if f70_local0 ~= nil and f70_local0 ~= 0 then
		f70_local1 = false
	else
		f70_local1 = true
	end
	return f70_local1
end

function IsGroupLeaderboardMakerState( f71_arg0, f71_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f71_arg0 ), "groups" ), "leaderboardmaker" ), "state" ) ) == f71_arg1
end

function IsPlayerAGuest( f72_arg0 )
	return Engine.IsGuest( f72_arg0 )
end

function IsPlayerAllowedToViewMatureContent( f73_arg0 )
	return Engine.IsContentRatingAllowed( f73_arg0 )
end

function IsPlayerAllowedToPlayMultiplayerGames()
	return not Engine.IsAnyControllerMPRestricted()
end

function IsOutOfBounds( f75_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f75_arg0 ), "hudItems.outOfBoundsEndTime" ) )
	local f75_local1 = Engine.CurrentGameTime()
	if f75_local1 == nil then
		return false
	elseif modelValue == nil then
		return false
	elseif CoD.SafeGetModelValue( Engine.GetModelForController( f75_arg0 ), "displayTop3Players" ) == 1 then
		return false
	else
		return f75_local1 < modelValue
	end
end

function IsEnemyDetected( f76_arg0, f76_arg1, f76_arg2 )
	local f76_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f76_arg0 ), "hudItems.sixthsense" ) )
	local f76_local1 = 0
	if f76_local0 == nil then
		return false
	elseif f76_arg2 == nil or f76_arg2 == "" then
		f76_arg2 = "far"
	end
	local f76_local2 = 1
	if f76_arg2 == "close" then
		f76_local2 = 16
	end
	if f76_arg1 == "front" then
		f76_local1 = f76_local2 << 0
	elseif f76_arg1 == "back" then
		f76_local1 = f76_local2 << 1
	elseif f76_arg1 == "left" then
		f76_local1 = f76_local2 << 2
	elseif f76_arg1 == "right" then
		f76_local1 = f76_local2 << 3
	end
	return f76_local0 & f76_local1 ~= 0
end

function HidePersonalizePrompt( f77_arg0 )
	local f77_local0
	if not CoD.isPC or IsGamepad( f77_arg0 ) then
		f77_local0 = Dvar.ui_execdemo_gamescom:get()
	else
		f77_local0 = true
	end
	return f77_local0
end

function IsCACLockedForEveryone()
	return Engine.IsItemLockedForAll( "FEATURE_CREATE_A_CLASS" )
end

function CACShowSelectPrompt( f79_arg0, f79_arg1, f79_arg2 )
	local f79_local0 = f79_arg1:getModel()
	local f79_local1 = f79_local0 and Engine.GetModel( f79_local0, "weaponSlot" )
	local f79_local2 = f79_local1 and Engine.GetModelValue( f79_local1 )
	if f79_arg2 == nil and f79_arg0 ~= nil then
		f79_arg2 = f79_arg0.m_ownerController
	end
	if f79_local2 == nil or f79_arg2 == nil then
		return false
	else
		local f79_local3 = CoD.perController[f79_arg2].classModel
		if not ((not LUI.startswith( f79_local2, "primarygadgetattachment" ) or CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f79_arg2 ) ~= "") and (f79_local2 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f79_arg2 ) ~= "") and (f79_local2 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f79_arg2 ) ~= "") and (f79_local2 ~= "specialty6" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f79_arg2 ) ~= "") and (f79_local2 ~= "secondaryattachment3" or CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f79_arg2 ) ~= "") and (not (f79_local2 == "primaryattachment4" or f79_local2 == "primaryattachment5" or f79_local2 == "primaryattachment6") or CoD.CACUtility.SearchForBonusCard( "bonuscard_primary_gunfighter", f79_arg2 ) ~= "")) or not (not LUI.startswith( f79_local2, "primaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "primary", f79_arg2, f79_local3 )) or not (not LUI.startswith( f79_local2, "secondaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "secondary", f79_arg2, f79_local3 ) and CoD.CACUtility.DoesWeaponHaveAnyAttachments( "secondary", f79_arg2, f79_local3 )) or LUI.startswith( f79_local2, "secondarygadgetattachment" ) and not CoD.CACUtility.ItemEquippedInSlot( "secondarygadget", f79_arg2, f79_local3 ) then
			local f79_local4, f79_local5, f79_local6 = CoD.CACUtility.GetCACSlotStatus( f79_arg2, f79_local3, f79_local2 )
			if f79_local4 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD and not IsElementInState( f79_arg1, "NotVisible" ) then
				return true
			else
				return false
			end
		else
			return true
		end
	end
end

function CACShowRemovePrompt( f80_arg0, f80_arg1 )
	local f80_local0 = f80_arg1:getModel()
	local f80_local1 = f80_local0 and Engine.GetModel( f80_local0, "itemIndex" )
	local f80_local2 = f80_local1 and Engine.GetModelValue( f80_local1 )
	if f80_local2 ~= nil and f80_local2 > CoD.CACUtility.EmptyItemIndex then
		return true
	else
		
	end
end

function CACShowRotatePrompt( f81_arg0, f81_arg1, f81_arg2 )
	local f81_local0 = f81_arg1:getModel()
	local f81_local1 = f81_local0 and Engine.GetModel( f81_local0, "weaponSlot" )
	local f81_local2 = f81_local1 and Engine.GetModelValue( f81_local1 )
	if f81_local2 == nil then
		return false
	elseif CACShowRemovePrompt( f81_arg0, f81_arg1 ) then
		return true
	end
	local f81_local3 = CACShowSelectPrompt( f81_arg0, f81_arg1, f81_arg2 )
	if f81_local3 then
		f81_local3 = LUI.startswith( f81_local2, "primaryattachment" )
		if not f81_local3 then
			f81_local3 = LUI.startswith( f81_local2, "secondaryattachment" )
		end
	end
	return f81_local3
end

function IsCACSlotOvercapacity2by1AspectRatio( f82_arg0 )
	local f82_local0 = f82_arg0:getModel()
	if f82_local0 then
		local f82_local1 = Engine.GetModel( f82_local0, "itemSlot" )
		if f82_local1 then
			local f82_local2 = Engine.GetModelValue( f82_local1 )
			local f82_local3
			if f82_local2 ~= "primary" and f82_local2 ~= "secondary" then
				f82_local3 = false
			else
				f82_local3 = true
			end
			return f82_local3
		end
	end
	return false
end

function IsCACSlotOvercapacityWildcard( f83_arg0 )
	local f83_local0 = f83_arg0:getModel()
	if f83_local0 then
		local f83_local1 = Engine.GetModel( f83_local0, "itemSlot" )
		if f83_local1 then
			return LUI.startswith( Engine.GetModelValue( f83_local1 ), "bonuscard" )
		end
	end
	return false
end

function IsCACContextualWildcardOpen( f84_arg0 )
	if CoD.perController[f84_arg0].CACWildcardContextualMenu then
		return true
	else
		return false
	end
end

function IsCACUsingOverkill( f85_arg0 )
	local f85_local0 = f85_arg0:getModel()
	if f85_local0 then
		return CoD.CACUtility.IsBonusCardEquipped( "bonuscard_overkill", f85_local0 )
	else
		return false
	end
end

function IsCACEquippingSlot( f86_arg0, f86_arg1 )
	return CoD.perController[f86_arg0].weaponCategory == f86_arg1
end

function IsCACSlot2by1AspectRatio( f87_arg0 )
	local f87_local0 = f87_arg0:getModel()
	if f87_local0 then
		local f87_local1 = Engine.GetModel( f87_local0, "weaponSlot" )
		if f87_local1 then
			local f87_local2 = Engine.GetModelValue( f87_local1 )
			local f87_local3
			if f87_local2 ~= "primary" and f87_local2 ~= "secondary" then
				f87_local3 = false
			else
				f87_local3 = true
			end
			return f87_local3
		end
	end
	return false
end

function IsCACSlotInfopane2by1AspectRatio( f88_arg0 )
	local f88_local0 = f88_arg0:getModel()
	if f88_local0 then
		local f88_local1 = Engine.GetModel( f88_local0, "weaponSlot" )
		if f88_local1 then
			local f88_local2 = Engine.GetModelValue( f88_local1 )
			local f88_local3
			if f88_local2 ~= "primary" and f88_local2 ~= "secondary" then
				f88_local3 = LUI.startswith( f88_local2, "primaryattachment" )
				if not f88_local3 then
					f88_local3 = LUI.startswith( f88_local2, "secondaryattachment" )
				end
			else
				f88_local3 = true
			end
			return f88_local3
		end
	end
	return false
end

function IsCACItemConsumable( f89_arg0, f89_arg1, f89_arg2 )
	local f89_local0 = f89_arg1:getModel()
	if f89_local0 then
		local f89_local1 = Engine.GetModel( f89_local0, "itemIndex" )
		if f89_local1 then
			return Engine.GetItemGroup( Engine.GetModelValue( f89_local1 ) ) == "bubblegum_consumable"
		end
	end
	return false
end

function DoesCACItemHaveConsumablesRemaining( f90_arg0, f90_arg1, f90_arg2 )
	if not IsCACItemConsumable( f90_arg0, f90_arg1, f90_arg2 ) then
		return true
	end
	local f90_local0 = f90_arg1:getModel()
	if f90_local0 then
		local f90_local1 = Engine.GetModel( f90_local0, "itemIndex" )
		if f90_local1 then
			return GetConsumableCountFromIndex( f90_arg2, Engine.GetModelValue( f90_local1 ) ) > 0
		end
	end
	return false
end

function IsCACItemEquipped( f91_arg0, f91_arg1, f91_arg2 )
	local f91_local0 = CoD.perController[f91_arg2].weaponCategory
	if f91_local0 == "bubblegum" or f91_local0 == "bubblegum_consumable" then
		return IsBubbleGumBuffEquipped( f91_arg0, f91_arg1, f91_arg2 )
	end
	local f91_local1 = CoD.CACUtility.GetSlotListWithSlot( f91_local0 )
	local f91_local2 = f91_arg1:getModel()
	if f91_local2 then
		local f91_local3 = Engine.GetModel( f91_local2, "itemIndex" )
		if f91_local3 then
			local f91_local4 = Engine.GetModelValue( f91_local3 )
			for f91_local8, f91_local9 in ipairs( f91_local1 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f91_local9, f91_arg2 ) == f91_local4 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACWildcardEquipped( f92_arg0, f92_arg1, f92_arg2 )
	local f92_local0 = CoD.CACUtility.GetSlotListWithSlot( CoD.perController[f92_arg2].weaponCategory )
	local f92_local1 = f92_arg1:getModel()
	if f92_local1 then
		local f92_local2 = Engine.GetModel( f92_local1, "itemIndex" )
		if f92_local2 then
			local f92_local3 = Engine.GetModelValue( f92_local2 )
			for f92_local7, f92_local8 in ipairs( f92_local0 ) do
				if CoD.CACUtility.GetItemEquippedInSlot( f92_local8, f92_arg2 ) == f92_local3 then
					if Engine.GetItemRef( f92_local3 ) == "bonuscard_primary_gunfighter" then
						if IsCACEquippedWildcardItemCount( f92_arg0, "bonuscard_primary_gunfighter", 3 ) then
							return true
						end
						return false
					end
					return true
				end
			end
		end
	end
	return false
end

function IsCACItemNew( f93_arg0, f93_arg1 )
	if not IsProgressionEnabled() then
		return false
	else
		local f93_local0 = f93_arg0:getModel( f93_arg1, "itemIndex" )
		if f93_local0 then
			return Engine.IsItemNew( f93_arg1, Engine.GetModelValue( f93_local0 ) )
		else
			return false
		end
	end
end

function IsCACAttachmentNew( f94_arg0, f94_arg1, f94_arg2 )
	if not IsProgressionEnabled() then
		return false
	end
	local f94_local0 = CoD.perController[f94_arg2].weaponCategory
	local f94_local1 = f94_arg1:getModel( f94_arg2, "itemIndex" )
	local f94_local2 = f94_arg0:getModel()
	if f94_local1 then
		local f94_local3 = "primary"
		if LUI.startswith( f94_local0, "secondaryattachment" ) then
			f94_local3 = "secondary"
		end
		local f94_local4 = Engine.GetModel( f94_local2, f94_local3 .. ".itemIndex" )
		if f94_local4 then
			return Engine.IsAttachmentNew( f94_arg2, Engine.GetModelValue( f94_local4 ), Engine.GetModelValue( f94_local1 ) )
		end
	end
	return false
end

function IsCACAnyLoadoutSlotNew( f95_arg0, f95_arg1 )
	local f95_local0 = f95_arg0:getModel( f95_arg1, "weaponSlot" )
	if f95_local0 then
		local f95_local1 = Engine.GetModelValue( f95_local0 )
		if LUI.startswith( f95_local1, "specialty" ) then
			f95_local1 = "specialty"
		end
		return Engine.IsLoadoutSlotNew( f95_arg1, f95_local1 )
	else
		return false
	end
end

function IsCACAnyOpticsNew( f96_arg0, f96_arg1 )
	return false
end

function IsCACAnyAttachmentsNew( f97_arg0, f97_arg1 )
	return false
end

function IsCACItemPurchased( f98_arg0, f98_arg1 )
	if not IsProgressionEnabled() then
		return true
	end
	local f98_local0 = nil
	local f98_local1 = f98_arg0.itemIndex
	if not f98_local1 then
		f98_local0 = f98_arg0:getModel( f98_arg1, "itemIndex" )
		if f98_local0 then
			f98_local1 = Engine.GetModelValue( f98_local0 )
		end
	end
	if f98_local1 then
		return Engine.IsItemPurchased( f98_arg1, f98_local1 )
	end
	return false
end

function IsCACHaveTokens( f99_arg0 )
	return Engine.GetCurrentTokens( f99_arg0, "weapon_smg" ) > 0
end

function ShouldCACDisplayTokens( f100_arg0 )
	if IsMultiplayer() then
		if IsLive() and not IsInGame() then
			return true
		end
	elseif IsCampaign() then
		if CoD.isSafehouse then
			return true
		end
	elseif IsFirstTimeSetup( f100_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
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

function IsProgressionEnabled( f102_arg0 )
	if not (not IsMultiplayer() or not IsLive() or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )) or IsCampaign() or IsZombies() then
		return true
	else
		return false
	end
end

function IsClassAllocationInState( f103_arg0, f103_arg1 )
	return Engine.GetMaxAllocation( f103_arg0 ) == f103_arg1
end

function IsProgressionElementItemLocked( f104_arg0, f104_arg1, f104_arg2 )
	if not IsProgressionEnabled() then
		return false
	else
		return f104_arg1.isLocked
	end
end

local f0_local2 = function ( f105_arg0, f105_arg1, f105_arg2 )
	local f105_local0 = f105_arg0:getModel()
	local f105_local1 = CoD.perController[f105_arg2].weaponCategory
	local f105_local2 = nil
	local f105_local3 = f105_arg1.itemIndex
	if not f105_local3 then
		f105_local2 = f105_arg1:getModel( f105_arg2, "itemIndex" )
		if f105_local2 then
			f105_local3 = Engine.GetModelValue( f105_local2 )
		end
	end
	if f105_local3 then
		if not f105_local1 then
			f105_local1 = Engine.GetLoadoutSlotForItem( f105_local3 )
		end
		if f105_local0 and f105_local1 and (LUI.startswith( f105_local1, "primaryattachment" ) or LUI.startswith( f105_local1, "secondaryattachment" )) then
			local f105_local4 = "primary"
			if LUI.startswith( f105_local1, "secondaryattachment" ) then
				f105_local4 = "secondary"
			end
			local f105_local5 = Engine.GetModel( f105_local0, f105_local4 .. ".itemIndex" )
			if f105_local5 then
				return Engine.IsItemAttachmentLocked( f105_arg2, Engine.GetModelValue( f105_local5 ), f105_local3 )
			end
		end
		return Engine.IsItemLocked( f105_arg2, f105_local3 )
	else
		return false
	end
end

function IsCACItemLocked( f106_arg0, f106_arg1, f106_arg2 )
	if not IsProgressionEnabled() then
		return false
	else
		return f0_local2( f106_arg0, f106_arg1, f106_arg2 )
	end
end

function IsCACItemLockedForGamesCom( f107_arg0, f107_arg1, f107_arg2 )
	if not IsProgressionEnabled() and not IsGamesComBuild() then
		return false
	else
		return f0_local2( f107_arg0, f107_arg1, f107_arg2 )
	end
end

function IsCACItemLockedForBeta( f108_arg0, f108_arg1, f108_arg2 )
	if not IsProgressionEnabled() and not LuaUtils.IsBetaBuild() then
		return false
	else
		return f0_local2( f108_arg0, f108_arg1, f108_arg2 )
	end
end

function IsCACItemClassified( f109_arg0, f109_arg1, f109_arg2 )
	if not IsProgressionEnabled() and not LuaUtils.IsBetaBuild() then
		return false
	elseif Engine.GetModelValue( f109_arg1:getModel( f109_arg2, "unlockLevel" ) ) >= 60 then
		return true
	else
		return false
	end
end

function IsItemRefLocked( f110_arg0, f110_arg1 )
	local f110_local0 = Engine.GetItemIndexFromReference( f110_arg1 )
	if f110_local0 then
		return Engine.IsItemLocked( f110_arg0, f110_local0 )
	else
		return true
	end
end

function IsNonAttachmentItemLocked( f111_arg0, f111_arg1 )
	if not IsProgressionEnabled() then
		return false
	else
		local f111_local0 = Engine.GetItemIndex( f111_arg1 )
		if f111_local0 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemLocked( f111_arg0, f111_local0 )
		else
			return false
		end
	end
end

function IsNonAttachmentItemPurchased( f112_arg0, f112_arg1 )
	if not IsProgressionEnabled() then
		return false
	else
		local f112_local0 = Engine.GetItemIndex( f112_arg1 )
		if f112_local0 > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemPurchased( f112_arg0, f112_local0 )
		else
			return false
		end
	end
end

function IsCACItemMutuallyExclusiveWithSelection( f113_arg0, f113_arg1 )
	local f113_local0 = CoD.perController[f113_arg1].weaponCategory
	local f113_local1 = CoD.CACUtility.EmptyItemIndex
	local f113_local2 = f113_arg0:getModel( f113_arg1, "itemIndex" )
	if f113_local2 then
		f113_local1 = Engine.GetModelValue( f113_local2 )
	end
	if not f113_local0 then
		f113_local0 = Engine.GetLoadoutSlotForItem( f113_local1 )
	end
	if f113_local0 then
		return CoD.CACUtility.GetMutuallyExclusiveSlotName( f113_local0, f113_arg1, f113_local1 ) ~= ""
	else
		return false
	end
end

function IsMenuPreviewImageSquare( f114_arg0 )
	if f114_arg0.menuName == "PerkSelect" or f114_arg0.menuName == "LethalEquipmentSelect" or f114_arg0.menuName == "TacticalEquipmentSelect" or f114_arg0.menuName == "TacticalRigSelect" or f114_arg0.menuName == "WildcardSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuCybercoreOrRigMenu( f115_arg0 )
	if f115_arg0.menuName == "TacticalRigSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuEquipmentMenu( f116_arg0 )
	if f116_arg0.menuName == "PerkSelect" or f116_arg0.menuName == "LethalEquipmentSelect" or f116_arg0.menuName == "TacticalEquipmentSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuAttachmentMenu( f117_arg0 )
	if f117_arg0.menuName == "PrimaryAttachmentSelect" or f117_arg0.menuName == "PrimaryOpticSelect" or f117_arg0.menuName == "SecondaryAttachmentSelect" or f117_arg0.menuName == "SecondaryOpticSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponMenu( f118_arg0 )
	if f118_arg0.menuName == "PrimaryWeaponSelect" or f118_arg0.menuName == "SecondaryWeaponSelect" or f118_arg0.menuName == "WeaponBuildKits" or f118_arg0.menuName == "WeaponBuildKitsCustomizeVariant" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponType( f119_arg0 )
	if IsCurrentMenuAttachmentMenu( f119_arg0 ) or IsCurrentMenuWeaponMenu( f119_arg0 ) then
		return true
	else
		return false
	end
end

function IsMulticoreActivated( f120_arg0 )
	return not IsItemRefLocked( f120_arg0, "feature_multicore" )
end

function IsMulticoreInMobileArmory( f121_arg0, f121_arg1 )
	if CoD.perController[f121_arg1].isInMobileArmory then
		return CoD.perController[f121_arg1].isInMobileArmory and IsMulticoreActivated( f121_arg1 )
	else
		return false
	end
end

function IsCybercoreItemEquipped( f122_arg0, f122_arg1, f122_arg2 )
	local f122_local0 = Engine.GetEquippedCybercore( f122_arg2 )
	local f122_local1 = f122_arg1:getModel( f122_arg2, "itemIndex" )
	if f122_local1 then
		return Engine.GetModelValue( f122_local1 ) == f122_local0
	else
		return false
	end
end

function IsCybercoreAbilityAvailable( f123_arg0, f123_arg1 )
	local f123_local0 = f123_arg0:getModel()
	if f123_local0 then
		if Engine.IsItemPurchased( f123_arg1, Engine.GetModelValue( Engine.GetModel( f123_local0, "baseItemIndex" ) ) ) then
			return true
		end
		local f123_local1 = Engine.GetModelValue( Engine.GetModel( f123_local0, "prereqItemIndex" ) )
		if f123_local1 ~= -1 then
			return Engine.IsItemPurchased( f123_arg1, f123_local1 )
		end
	end
	return false
end

function IsCybercoreAbilityPurchasable( f124_arg0, f124_arg1 )
	local f124_local0 = f124_arg0:getModel()
	if f124_local0 then
		return not Engine.IsItemPurchased( f124_arg1, Engine.GetModelValue( Engine.GetModel( f124_local0, "baseItemIndex" ) ) )
	else
		return false
	end
end

function IsCybercoreAbilityUpgradable( f125_arg0, f125_arg1 )
	local f125_local0 = f125_arg0:getModel()
	if f125_local0 then
		local f125_local1 = Engine.GetModelValue( Engine.GetModel( f125_local0, "baseItemIndex" ) )
		local f125_local2 = Engine.GetModelValue( Engine.GetModel( f125_local0, "upgradeItemIndex" ) )
		if Engine.IsItemPurchased( f125_arg1, f125_local1 ) and f125_local2 then
			return not Engine.IsItemPurchased( f125_arg1, f125_local2 )
		end
	end
	return false
end

function IsCybercoreAbilityUpgraded( f126_arg0, f126_arg1 )
	local f126_local0 = f126_arg0:getModel()
	if f126_local0 then
		local f126_local1 = Engine.GetModelValue( Engine.GetModel( f126_local0, "upgradeItemIndex" ) )
		if f126_local1 then
			return Engine.IsItemPurchased( f126_arg1, f126_local1 )
		else
			return true
		end
	else
		return false
	end
end

function IsCurrentClassSelectedClass( f127_arg0, f127_arg1 )
	local f127_local0 = f127_arg1:getModel()
	local f127_local1 = f127_arg0:getModel()
	if f127_local0 and f127_local1 and f127_local0 == f127_local1 then
		return true
	else
		return false
	end
end

function IsCurrentClassModelValueEqualToString( f128_arg0, f128_arg1, f128_arg2 )
	local f128_local0 = CoD.perController[f128_arg0].weaponCategory
	local f128_local1 = CoD.perController[f128_arg0].classModel
	local f128_local2 = f128_local1 and Engine.GetModel( f128_local1, f128_arg1 )
	local f128_local3 = f128_local2 and Engine.GetModelValue( f128_local2 )
	local f128_local4
	if f128_local3 == nil or f128_local3 ~= f128_arg2 then
		f128_local4 = false
	else
		f128_local4 = true
	end
	return f128_local4
end

function IsCACSlotHaveModel( f129_arg0 )
	local f129_local0 = f129_arg0:getModel()
	if f129_local0 then
		local f129_local1 = Engine.GetModel( f129_local0, "weaponSlot" )
		if f129_local1 then
			local f129_local2 = Engine.GetModelValue( f129_local1 )
			if f129_local2 == "primary" or f129_local2 == "secondary" or LUI.startswith( f129_local2, "primaryattachment" ) or LUI.startswith( f129_local2, "secondaryattachment" ) or f129_local2 == "primarygadget" or f129_local2 == "secondarygadget" or LUI.startswith( f129_local2, "primarygadgetattachment" ) or LUI.startswith( f129_local2, "secondarygadgetattachment" ) or LUI.startswith( f129_local2, "specialty" ) or LUI.startswith( f129_local2, "bonuscard" ) or f129_local2 == "cybercore" then
				return true
			end
		end
	end
	return false
end

local f0_local3 = function ( f130_arg0, f130_arg1, f130_arg2, f130_arg3 )
	if not f130_arg2 or not f130_arg3 then
		return nil
	else
		local f130_local0 = f130_arg1:getModel( f130_arg2, "weaponSlot" )
		if not f130_local0 then
			return nil
		else
			local f130_local1 = Engine.GetModelValue( f130_local0 )
			if not f130_local1 then
				return nil
			else
				return f130_local1
			end
		end
	end
end

function IsCACSlotEquipped( f131_arg0, f131_arg1, f131_arg2 )
	if not f131_arg2 then
		return false
	end
	local f131_local0 = f131_arg1:getModel( f131_arg2, "customWeaponSlot" )
	local f131_local1 = nil
	if f131_local0 then
		f131_local1 = Engine.GetModelValue( f131_local0 )
	end
	if f131_local1 then
		local f131_local2 = f131_arg0:getModel( f131_arg2, f131_local1 )
		if f131_local2 then
			local f131_local3 = Engine.GetModel( f131_local2, "itemIndex" )
			if f131_local3 then
				local f131_local4 = Engine.GetModelValue( f131_local3 )
				local f131_local5, f131_local6 = string.find( f131_local1, "%." )
				return CoD.CACUtility.GetAttachedItemSlot( f131_arg0:getModel(), f131_local4, CoD.CACUtility.GetAttachmentListForSlot( string.sub( f131_local1, 0, f131_local5 - 1 ) ) ) ~= nil
			end
		end
	else
		local f131_local2 = f131_arg0:getModel()
		local f131_local3 = f0_local3( f131_arg0, f131_arg1, f131_arg2, f131_local2 )
		if f131_local3 then
			local f131_local4, f131_local5, f131_local6 = CoD.CACUtility.GetCACSlotStatus( f131_arg2, f131_local2, f131_local3 )
			return f131_local5
		end
	end
	return false
end

function IsCACSlotAvailable( f132_arg0, f132_arg1, f132_arg2 )
	local f132_local0 = f132_arg0:getModel()
	local f132_local1 = f0_local3( f132_arg0, f132_arg1, f132_arg2, f132_local0 )
	if f132_local1 then
		local f132_local2, f132_local3, f132_local4 = CoD.CACUtility.GetCACSlotStatus( f132_arg2, f132_local0, f132_local1 )
		return f132_local2 == CoD.CACUtility.CACStatusAvailable.AVAILABLE
	else
		return false
	end
end

function IsCACSlotNeedWildcard( f133_arg0, f133_arg1, f133_arg2 )
	local f133_local0 = f0_local3( f133_arg0, f133_arg1, f133_arg2, f133_arg0:getModel() )
	if f133_local0 and CoD.CACUtility.WildcardNeededForSlot( f133_arg2, f133_local0 ) then
		return true
	else
		return false
	end
end

function IsCACSlotCanEquipWildcard( f134_arg0, f134_arg1, f134_arg2 )
	local f134_local0 = f0_local3( f134_arg0, f134_arg1, f134_arg2, f134_arg0:getModel() )
	if f134_local0 then
		local f134_local1, f134_local2 = CoD.CACUtility.WildcardNeededForSlot( f134_arg2, f134_local0 )
		if f134_local1 then
			return f134_local2
		end
	end
	return false
end

function IsCACSlotWildcardLocked( f135_arg0, f135_arg1, f135_arg2 )
	local f135_local0 = f0_local3( f135_arg0, f135_arg1, f135_arg2, f135_arg0:getModel() )
	if f135_local0 then
		local f135_local1, f135_local2, f135_local3 = CoD.CACUtility.WildcardNeededForSlot( f135_arg2, f135_local0 )
		if f135_local1 then
			return f135_local3
		end
	end
	return false
end

function IsCACAnyPerkEquipped( f136_arg0 )
	local f136_local0 = f136_arg0:getModel()
	if f136_local0 then
		return CoD.CACUtility.IsItemEquippedInAnySlot( f136_local0, CoD.CACUtility.CompletePerkSlotNameList )
	else
		return false
	end
end

function IsCACAnyWildcardEquipped( f137_arg0 )
	local f137_local0 = f137_arg0:getModel()
	if f137_local0 then
		return CoD.CACUtility.IsItemEquippedInAnySlot( f137_local0, CoD.CACUtility.BonuscardSlotNameList )
	else
		return false
	end
end

function IsCACSlotWeaponForAttachmentEquipped( f138_arg0, f138_arg1, f138_arg2 )
	local f138_local0 = f138_arg1:getModel()
	local f138_local1 = f138_arg0:getModel()
	if f138_local0 then
		local f138_local2 = Engine.GetModel( f138_local0, "weaponSlot" )
		if f138_local2 then
			local f138_local3 = Engine.GetModelValue( f138_local2 )
			if LUI.startswith( f138_local3, "primaryattachment" ) then
				local f138_local4, f138_local5, f138_local6 = CoD.CACUtility.GetCACSlotStatus( f138_arg2, f138_local1, "primary" )
				return f138_local5
			elseif LUI.startswith( f138_local3, "secondaryattachment" ) then
				local f138_local4, f138_local5, f138_local6 = CoD.CACUtility.GetCACSlotStatus( f138_arg2, f138_local1, "secondary" )
				return f138_local5
			end
		end
	end
	return false
end

function IsCACSlotSpecificItemEquipped( f139_arg0, f139_arg1, f139_arg2 )
	local f139_local0 = f139_arg0:getModel( f139_arg1, "itemIndex" )
	if f139_local0 then
		local f139_local1 = Engine.GetModelValue( f139_local0 )
		if f139_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetItemRef( f139_local1 ) == f139_arg2 then
			return true
		end
	end
	return false
end

function IsCACEquippedWildcardItemCount( f140_arg0, f140_arg1, f140_arg2 )
	return f140_arg2 == CoD.CACUtility.SpecificWildcardEquippedCount( f140_arg0:getModel(), f140_arg1 )
end

function IsCACCountGreaterThanEquippedWildcardItem( f141_arg0, f141_arg1, f141_arg2 )
	return f141_arg2 <= CoD.CACUtility.SpecificWildcardEquippedCount( f141_arg0:getModel(), f141_arg1 )
end

function IsCACAttachmentSlotVisible( f142_arg0, f142_arg1, f142_arg2, f142_arg3 )
	if IsCACSlotWeaponForAttachmentEquipped( f142_arg0, f142_arg1, f142_arg2 ) then
		return not IsCACCountGreaterThanEquippedWildcardItem( f142_arg0, "bonuscard_primary_gunfighter", f142_arg3 )
	else
		return IsCACCountGreaterThanEquippedWildcardItem( f142_arg0, "bonuscard_primary_gunfighter", 0 )
	end
end

function IsHintTextLeftAlign( f143_arg0, f143_arg1 )
	local f143_local0 = f143_arg0:getModel( f143_arg1, "weaponSlot" )
	if f143_local0 and LUI.startswith( Engine.GetModelValue( f143_local0 ), "primarygadget" ) then
		return true
	else
		return false
	end
end

function IsHintTextRightAlign( f144_arg0, f144_arg1 )
	local f144_local0 = f144_arg0:getModel( f144_arg1, "weaponSlot" )
	if f144_local0 then
		local f144_local1 = Engine.GetModelValue( f144_local0 )
		if f144_local1 == "primaryattachment3" or f144_local1 == "primaryattachment6" or f144_local1 == "secondaryattachment3" or f144_local1 == "specialty3" or f144_local1 == "specialty6" then
			return true
		end
	end
	return false
end

function IsCACSlotAttachment( f145_arg0 )
	local f145_local0 = f145_arg0:getModel()
	if f145_local0 and Engine.GetModel( f145_local0, "weaponSlot" ) then
		local f145_local1 = Engine.GetModelValue( Engine.GetModel( f145_local0, "weaponSlot" ) )
		if LUI.startswith( f145_local1, "primaryattachment" ) or LUI.startswith( f145_local1, "secondaryattachment" ) then
			return true
		end
	end
	return false
end

function IsCACAnyGreedWildcardUnequipped( f146_arg0, f146_arg1 )
	local f146_local0 = f146_arg0:getModel( f146_arg1, "weaponSlot" )
	if f146_local0 then
		local f146_local1 = Engine.GetModelValue( f146_local0 )
		if f146_local1 == "specialty4" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f146_arg1 ) ~= ""
		elseif f146_local1 == "specialty5" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f146_arg1 ) ~= ""
		elseif f146_local1 == "specialty6" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f146_arg1 ) ~= ""
		end
	end
	return false
end

function IsCACSpecificWildcardEquipped( f147_arg0, f147_arg1 )
	local f147_local0 = f147_arg0:getModel()
	if f147_local0 then
		return CoD.CACUtility.IsBonusCardEquipped( f147_arg1, f147_local0 )
	else
		return false
	end
end

function IsCACSpecificSlotEquipped( f148_arg0, f148_arg1, f148_arg2 )
	local f148_local0 = f148_arg0:getModel()
	if f148_local0 then
		local f148_local1, f148_local2, f148_local3 = CoD.CACUtility.GetCACSlotStatus( f148_arg1, f148_local0, f148_arg2 )
		return f148_local2
	else
		return false
	end
end

local f0_local4 = function ( f149_arg0, f149_arg1 )
	if not f149_arg1 then
		return 0
	end
	local f149_local0 = CoD.perController[f149_arg1].classModel
	if f149_local0 then
		local f149_local1 = Engine.GetModel( f149_local0, f149_arg0 )
		if f149_local1 then
			local f149_local2 = Engine.GetModel( f149_local1, "itemIndex" )
			if f149_local2 then
				local f149_local3 = Engine.GetModelValue( f149_local2 )
				if f149_local3 ~= 0 then
					return Engine.GetNumAttachments( f149_local3 ) - 1
				end
			end
		end
	end
	return 0
end

function IsCACGadgetModAvailable( f150_arg0, f150_arg1, f150_arg2 )
	local f150_local0 = f150_arg0:getModel()
	if not f150_arg2 or not f150_local0 then
		return false
	end
	local f150_local1 = f150_arg1:getModel( f150_arg2, "weaponSlot" )
	if not f150_local1 then
		return false
	end
	local f150_local2 = Engine.GetModelValue( f150_local1 )
	local f150_local3 = "primarygadget"
	if LUI.startswith( f150_local2, "primarygadgetattachment" ) then
		f150_local3 = "primarygadget"
	elseif LUI.startswith( f150_local2, "secondarygadgetattachment" ) then
		f150_local3 = "secondarygadget"
	end
	if CoD.CACUtility.ItemEquippedInSlot( f150_local3, f150_arg2 ) then
		local f150_local4 = Engine.GetModel( f150_local0, f150_local3 .. ".cust" .. f150_local2 .. ".itemIndex" )
		if f150_local4 and Engine.GetModelValue( f150_local4 ) > CoD.CACUtility.EmptyItemIndex then
			return true
		end
	end
	return false
end

function IsCACSlotRequiresWildcard( f151_arg0, f151_arg1, f151_arg2 )
	local f151_local0 = f151_arg0:getModel()
	if not f151_arg2 or not f151_local0 then
		return false
	else
		local f151_local1 = f151_arg1:getModel( f151_arg2, "weaponSlot" )
		if not f151_local1 then
			return false
		else
			local f151_local2 = Engine.GetModelValue( f151_local1 )
			if not f151_local2 then
				return false
			else
				local f151_local3, f151_local4, f151_local5 = CoD.CACUtility.GetCACSlotStatus( f151_arg2, f151_local0, f151_local2 )
				return f151_local3 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	end
end

function IsCACThirdPrimaryAttachmentAvailable( f152_arg0 )
	return CoD.CACUtility.SearchForBonusCard( "bonuscard_primary_gunfighter", f152_arg0 ) ~= ""
end

function IsCACFifthPrimaryAttachmentAvailable( f153_arg0, f153_arg1 )
	return IsCACCountGreaterThanEquippedWildcardItem( f153_arg1, "bonuscard_primary_gunfighter", 2 )
end

function IsCACSecondSecondaryAttachmentAvailable( f154_arg0 )
	return CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f154_arg0 ) ~= ""
end

local f0_local5 = function ( f155_arg0, f155_arg1, f155_arg2 )
	if f155_arg1 and f155_arg0 then
		local f155_local0 = Engine.GetModel( f155_arg1, "itemIndex" )
		local f155_local1 = Engine.GetModel( f155_arg0, f155_arg2 )
		if f155_local0 and f155_local1 then
			local f155_local2 = Engine.GetModel( f155_local1, "itemIndex" )
			if f155_local2 then
				local f155_local3 = Engine.GetModelValue( f155_local0 )
				local f155_local4 = Engine.GetModelValue( f155_local2 )
				if f155_local4 > CoD.CACUtility.EmptyItemIndex then
					return Engine.IsTakeTwoGadgetAttachment( f155_local4, f155_local3 )
				end
			end
		end
	end
	return false
end

local f0_local6 = function ( f156_arg0, f156_arg1 )
	if f156_arg0 then
		for f156_local4, f156_local5 in ipairs( f156_arg1 ) do
			local f156_local6 = Engine.GetModel( f156_arg0, f156_local5 )
			if f156_local6 then
				local f156_local3 = Engine.GetModel( f156_local6, "itemIndex" )
				if f156_local3 and Engine.GetModelValue( f156_local3 ) == 1 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACTakeTwoPrimaryGadgetAttachmentEquipped( f157_arg0 )
	return f0_local6( f157_arg0:getModel(), CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoSecondaryGadgetAttachmentEquipped( f158_arg0 )
	return f0_local6( f158_arg0:getModel(), CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoPrimaryGadgetAttachment( f159_arg0, f159_arg1 )
	return f0_local5( f159_arg0:getModel(), f159_arg1:getModel(), "primarygadget" )
end

function IsCACTakeTwoSecondaryGadgetAttachment( f160_arg0, f160_arg1 )
	return f0_local5( f160_arg0:getModel(), f160_arg1:getModel(), "secondarygadget" )
end

function IsPrimaryWeaponAttachmentAvailable( f161_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "primary", f161_arg0 ) and f0_local4( "primary", f161_arg0 ) > 0
end

function IsSecondaryWeaponAttachmentAvailable( f162_arg0 )
	return CoD.CACUtility.ItemEquippedInSlot( "secondary", f162_arg0 ) and f0_local4( "secondary", f162_arg0 ) > 0
end

function IsItemSlotLockedByWildcardLocked( f163_arg0, f163_arg1, f163_arg2, f163_arg3 )
	f163_arg1.itemIndex = Engine.GetItemIndex( f163_arg3 )
	return IsCACItemLocked( f163_arg0, f163_arg1, f163_arg2 )
end

function IsPrimaryEquipmentModAvailable( f164_arg0, f164_arg1, f164_arg2 )
	return IsCACGadgetModAvailable( f164_arg0, f164_arg1, f164_arg2 )
end

function IsSecondaryEquipmentModAvailable( f165_arg0, f165_arg1, f165_arg2 )
	return IsCACGadgetModAvailable( f165_arg0, f165_arg1, f165_arg2 )
end

function IsPerk1PlusEquipped( f166_arg0, f166_arg1 )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty4", f166_arg1, f166_arg0:getModel() ) ~= 0
end

function IsPerk2PlusEquipped( f167_arg0, f167_arg1 )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty5", f167_arg1, f167_arg0:getModel() ) ~= 0
end

function IsPerk3PlusEquipped( f168_arg0, f168_arg1 )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty6", f168_arg1, f168_arg0:getModel() ) ~= 0
end

function IsCACInfopaneItemNameEmpty( f169_arg0, f169_arg1 )
	local f169_local0 = f169_arg0:getModel( f169_arg1, "name" )
	local f169_local1 = f169_arg0:getModel()
	if f169_local0 and Engine.GetModelValue( f169_local0 ) == "" then
		return true
	else
		return false
	end
end

function IsCACWeaponVariantAvailable( f170_arg0, f170_arg1 )
	if not Gunsmith_IsEnabled( f170_arg0, f170_arg1 ) then
		return false
	end
	local f170_local0 = f170_arg0:getModel()
	if f170_local0 then
		local f170_local1 = Engine.GetModel( f170_local0, "ref" )
		local f170_local2 = Engine.GetModel( f170_local0, "itemIndex" )
		if f170_local2 then
			local f170_local3 = Engine.GetModelValue( f170_local2 )
			if #CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f170_local3 ) > 1 then
				CoD.perController[f170_arg1].weaponIndexForVariant = f170_local3
				return true
			end
		end
	end
	return false
end

function IsBaseWeaponVariantIndex( f171_arg0, f171_arg1, f171_arg2 )
	local f171_local0 = f171_arg1:getModel( f171_arg2, "cacVariantIndex" )
	if f171_local0 then
		return Engine.GetModelValue( f171_local0 ) == 0
	else
		return false
	end
end

function IsCACSlotHasVariantName( f172_arg0 )
	local f172_local0 = f172_arg0:getModel()
	if f172_local0 then
		local f172_local1 = Engine.GetModel( f172_local0, "variantName" )
		if f172_local1 and Engine.GetModelValue( f172_local1 ) ~= "" then
			return true
		end
	end
	return false
end

local f0_local7 = function ( f173_arg0 )
	local f173_local0 = {}
	for f173_local4 in string.gmatch( f173_arg0, "[^,]+" ) do
		table.insert( f173_local0, tonumber( f173_local4 ) )
	end
	if #f173_local0 == 2 and f173_local0[1] < f173_local0[2] then
		return true
	else
		return false
	end
end

function IsCACWeaponAttributeIncrease( f174_arg0, f174_arg1, f174_arg2 )
	if f174_arg0:getModel( f174_arg1, f174_arg2 ) then
		return f0_local7( Engine.GetModelValue( f174_arg0:getModel( f174_arg1, f174_arg2 ) ) )
	else
		return false
	end
end

function IsCACGunLevelMax( f175_arg0, f175_arg1, f175_arg2 )
	local f175_local0 = CoD.CACUtility.GetGunLevelWeaponIndex( f175_arg2, f175_arg1 )
	if f175_local0 == CoD.CACUtility.EmptyItemIndex then
		return false
	else
		return Engine.GetGunCurrentRank( f175_arg2, f175_local0 ) == Engine.GetGunNextRank( f175_arg2, f175_local0 )
	end
end

function IsCACGunLevelExists( f176_arg0, f176_arg1, f176_arg2 )
	if not IsProgressionEnabled() then
		return false
	else
		return CoD.CACUtility.GetGunLevelWeaponIndex( f176_arg2, f176_arg1 ) ~= CoD.CACUtility.EmptyItemIndex
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

function AmICarryingEnemyFlag( f180_arg0 )
	local f180_local0 = Engine.GetPlayerNameForClientNum( f180_arg0, Engine.GetPredictedClientNum( f180_arg0 ) )
	if f180_local0 == "" then
		return false
	end
	local f180_local1 = Engine.CreateModel( Engine.GetModelForController( f180_arg0 ), "CTF.enemyFlagCarrier" )
	local f180_local2
	if f180_local1 == nil or f180_local0 ~= Engine.GetModelValue( f180_local1 ) then
		f180_local2 = false
	else
		f180_local2 = true
	end
	return f180_local2
end

function IsFriendlyFlagHeld( f181_arg0 )
	local f181_local0 = Engine.CreateModel( Engine.GetModelForController( f181_arg0 ), "CTF.friendlyFlagCarrier" )
	if f181_local0 then
		f181_local0 = Engine.GetModel( f181_local0, "friendlyFlagCarrier" )
	end
	if event.friendlyCarrier then
		local f181_local1 = Engine.CreateModel( Engine.GetModelForController( f181_arg0 ), "CTF" )
		if f181_local1 then
			f181_local1 = Engine.GetModel( f181_local1, "enemyFlagCarrier" )
		end
		return true
	else
		return false
	end
end

function AmICarryingBomb( f182_arg0 )
	if CoD.SafeGetModelValue( Engine.GetModelForController( f182_arg0 ), "Demolition.defending" ) == false then
		return true
	else
		return IsModelValueEqualTo( f182_arg0, "hudItems.SDBombClient", Engine.GetPredictedClientNum( f182_arg0 ) )
	end
end

function HasNetworkConnection()
	return Engine.CheckNetConnection() == true
end

function IsPlayerSignedInToLive( f184_arg0 )
	return Engine.IsSignedInToLive( f184_arg0 ) == true
end

function IsPlayerConnectedToCodServers( f185_arg0 )
	return Engine.IsDemonwareFetchingDone( f185_arg0 ) == true
end

function IsPlayerJoinable( f186_arg0 )
	local f186_local0 = nil
	if f186_arg0.activeWidget ~= nil then
		f186_local0 = f186_arg0.activeWidget:getModel()
	else
		f186_local0 = f186_arg0:getModel()
	end
	if f186_local0 then
		f186_local0 = Engine.GetModel( f186_local0, "isJoinable" )
	end
	local f186_local1
	if not f186_local0 or Engine.GetModelValue( f186_local0 ) ~= 1 then
		f186_local1 = false
	else
		f186_local1 = true
	end
	return f186_local1
end

function IsSystemLinkLobby()
	return Engine.GetLobbyNetworkMode() == CoD.LOBBY.MODE_LAN
end

function ShouldLobbyListBeUp()
	local f188_local0
	if IsMainModeInvalidAndNotTheaterMode() or Dvar.ui_execdemo_beta:get() then
		f188_local0 = Dvar.ui_execdemo_beta:get()
		if f188_local0 then
			f188_local0 = IsGameLobby()
			if not f188_local0 then
				f188_local0 = IsCustomLobby()
			end
		end
	else
		f188_local0 = true
	end
	return f188_local0
end

function ShowHeaderKicker( f189_arg0 )
	return f189_arg0.showHeaderKicker == true
end

function ShowHeaderIcon( f190_arg0 )
	return f190_arg0.showHeaderIcon == true
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
	local f199_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f199_local1
	if f199_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f199_local0 ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f199_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f199_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		f199_local1 = false
	else
		f199_local1 = true
	end
	return f199_local1
end

function IsGameLobby()
	local f200_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f200_local0 then
		local f200_local1 = LobbyData:UITargetFromId( f200_local0 )
		return f200_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME
	else
		
	end
end

function IsLobbyMode( f201_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue then
		local f201_local1 = LobbyData:UITargetFromId( modelValue )
		return f201_local1.lobbyMode == f201_arg0
	else
		
	end
end

function IsLobbyAdvertised()
	local f202_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f202_local0 then
		local f202_local1 = LobbyData:UITargetFromId( f202_local0 )
		return f202_local1.isAdvertised
	else
		return false
	end
end

function IsGameLobbyActive()
	return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
end

function IsLobbyNetworkModeLocal()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL
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
	local f210_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f210_local1
	if f210_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f210_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f210_local1 = false
	else
		f210_local1 = true
	end
	return f210_local1
end

function IsLobbyWithTeamAssignment()
	local f211_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	local f211_local1
	if f211_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f211_local0 ~= LobbyData.UITargets.UI_MPLOBBYLANGAME.id then
		f211_local1 = false
	else
		f211_local1 = true
	end
	return f211_local1
end

function IsTeamAssignment( f212_arg0 )
	return Engine.GetGametypeSetting( "teamAssignment" ) == f212_arg0
end

function IsAddControllerTextItem( f213_arg0 )
	return f213_arg0.isAddControllerTextItem
end

function IsPlayerCountItem( f214_arg0 )
	return f214_arg0.isPlayerCountItem
end

function IsSelfItem( f215_arg0, f215_arg1 )
	local f215_local0 = f215_arg0:getModel( f215_arg1, "isLocal" )
	if f215_local0 ~= nil then
		return Engine.GetModelValue( f215_local0 ) == 1
	else
		return f215_arg0.isSelfItem
	end
end

function IsParentPartyMemberItem( f216_arg0, f216_arg1 )
	local f216_local0 = f216_arg0:getModel( f216_arg1, "isMember" )
	if f216_local0 ~= nil then
		return Engine.GetModelValue( f216_local0 ) == 1
	else
		local f216_local1
		if f216_arg0:getParent() ~= nil then
			f216_local1 = f216_arg0:getParent()
			f216_local1 = f216_local1.isPartyMemberItem
		else
			f216_local1 = false
		end
	end
	return f216_local1
end

function IsPartyMemberItem( f217_arg0, f217_arg1 )
	local f217_local0 = f217_arg0:getModel( f217_arg1, "isMember" )
	if f217_local0 ~= nil then
		return Engine.GetModelValue( f217_local0 ) == 1
	else
		return f217_arg0.isPartyMemberItem
	end
end

function IsFriendItem( f218_arg0 )
	return f218_arg0.isFriendItem
end

function IsGroupsItem( f219_arg0 )
	return f219_arg0.isGroupsItem
end

function IsMorePlayingItem( f220_arg0 )
	return f220_arg0.isMorePlaying
end

function ShouldPlayLobbyFadeAnim( f221_arg0, f221_arg1 )
	return f221_arg0.previousMenuName and f221_local1 or f221_arg0.previousMenuName == "ModeSelect"
end

function ShouldShowAddController( f222_arg0, f222_arg1, f222_arg2 )
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	end
	local f222_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f222_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f222_local1
	if Engine.GetLobbyClientCount( f222_local0 ) >= Engine.GetLobbyMaxClients( f222_local0 ) or Engine.GetLobbyLocalClientCount( f222_local0 ) >= Dvar.lobby_maxLocalPlayers:get() then
		f222_local1 = false
	else
		f222_local1 = true
	end
	return f222_local1
end

function ShouldDisableEditCodCasterSettingsButton( f223_arg0 )
	if not IsCodCaster( f223_arg0 ) then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function ShouldShowEditCodCasterSettingsButton( f224_arg0 )
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

function LANServerBrowserCheckFilterTest( f226_arg0, f226_arg1 )
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	elseif f226_arg0.currentFilter == f226_arg1 then
		return true
	elseif not f226_arg0.currentFilter and f226_arg1 == "all" then
		return true
	else
		return false
	end
end

function LobbyHas4PlayersOrLess()
	local f227_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f227_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	return f227_local0 <= 4
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

function CharacterDraftEnabled()
	return Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1
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

function PregameStateEqualToEnum( f238_arg0 )
	return Engine.GetLobbyPregameState() == f238_arg0
end

function CharacterLoadoutDrafted( f239_arg0, f239_arg1, f239_arg2 )
	if not CharacterDraftActive() then
		return false
	else
		local f239_local0 = f239_arg1:getModel()
		if f239_local0 then
			return Engine.CharacterLoadoutDrafted( Engine.GetModelValue( Engine.GetModel( f239_local0, "itemIndex" ) ), Engine.GetTeamForXUID( Engine.GetXUID64( f239_arg2 ) ) )
		else
			return false
		end
	end
end

function ItemIsBanned( f240_arg0, f240_arg1, f240_arg2 )
	local f240_local0 = CoD.CACUtility.GetItemInfoFromElement( f240_arg2, f240_arg1 )
	if f240_local0 then
		if CoD.CACUtility.ItemSlotBannedByBonuscard( f240_local0.loadoutSlot, f240_local0.itemIndex ) then
			return true
		elseif CoD.CACUtility.ItemSlotBannedByBonuscard( f240_local0.weaponSlot, f240_local0.itemIndex ) then
			return true
		elseif (f240_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM or f240_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetItemVote( f240_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif (f240_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT or f240_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetAttachmentVote( f240_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif f240_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( f240_local0.itemIndex, f240_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		elseif f240_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f240_local0.itemGroup, f240_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		end
	end
	return false
end

function ItemIsProtected( f241_arg0, f241_arg1, f241_arg2 )
	local f241_local0 = CoD.CACUtility.GetItemInfoFromElement( f241_arg2, f241_arg1 )
	if f241_local0 then
		if f241_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			return Engine.GetItemVote( f241_local0.itemIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f241_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			return Engine.GetAttachmentVote( f241_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f241_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( f241_local0.itemIndex, f241_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif f241_local0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( f241_local0.itemGroup, f241_local0.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		end
	end
	return false
end

function ClassContainsRestrictedItems( f242_arg0, f242_arg1, f242_arg2 )
	local f242_local0 = f242_arg1:getModel( f242_arg2, "classNum" )
	if f242_local0 then
		local f242_local1 = Engine.GetModelValue( f242_local0 )
		if #CoD.CACUtility.GetAllRestrictedItems() == 0 then
			return false
		else
			return CoD.CACUtility.ClassContainsRestrictedItems( f242_arg2, f242_local1 )
		end
	else
		return false
	end
end

function AnyClassContainsRestrictedItems( f243_arg0, f243_arg1, f243_arg2 )
	return CoD.CACUtility.AnyClassContainsRestrictedItems( f243_arg2 )
end

function AnyEquippedScorestreaksBanned( f244_arg0, f244_arg1, f244_arg2 )
	return CoD.CACUtility.AnyEquippedScorestreaksBanned( f244_arg2 )
end

function AnyCACContentBanned( f245_arg0, f245_arg1, f245_arg2 )
	return CoD.CACUtility.AnyCACItemsBanned()
end

function AnyScorestreaksBanned( f246_arg0, f246_arg1, f246_arg2 )
	return CoD.CACUtility.AnyStreaksBanned()
end

function CanAffordRaidPurchase( f247_arg0, f247_arg1, f247_arg2 )
	return Engine.GetModelValue( f247_arg1:getModel( f247_arg2, "cost" ) ) <= Engine.GetModelValue( f247_arg0:getModel( f247_arg2, "bank" ) )
end

function RaidPurchaseItemDisabled( f248_arg0, f248_arg1, f248_arg2 )
	return f248_arg0:getModel( f248_arg2, "disable_" .. Engine.GetModelValue( f248_arg1:getModel( f248_arg2, "id" ) ) ) ~= nil
end

function RaidPurchaseAllowedForParent( f249_arg0, f249_arg1, f249_arg2 )
	return CanAffordRaidPurchase( f249_arg0, f249_arg1:getParent(), f249_arg2 ) and not RaidPurchaseItemDisabled( f249_arg0, f249_arg1:getParent(), f249_arg2 )
end

function RaidPurchaseAllowed( f250_arg0, f250_arg1, f250_arg2 )
	return CanAffordRaidPurchase( f250_arg0, f250_arg1, f250_arg2 ) and not RaidPurchaseItemDisabled( f250_arg0, f250_arg1, f250_arg2 )
end

function IsStoreAvailable()
	local f251_local0
	if not CoD.isZombie then
		f251_local0 = Engine.IsFFOTDFetched()
	else
		f251_local0 = false
	end
	return f251_local0
end

function IsPlayerDead( f252_arg0, f252_arg1 )
	local f252_local0 = f252_arg0:getModel( f252_arg1, "clientNum" )
	if f252_local0 then
		return Engine.IsPlayerDead( f252_arg1, Engine.GetModelValue( f252_local0 ) )
	else
		return false
	end
end

function IsPlayerInLastStand( f253_arg0, f253_arg1 )
	local f253_local0 = f253_arg0:getParent()
	local f253_local1 = f253_local0 and f253_local0:getModel( f253_arg1, "clientNum" )
	if f253_local1 then
		return Engine.IsPlayerInLastStand( f253_arg1, Engine.GetModelValue( f253_local1 ) )
	else
		return false
	end
end

function PlayerListCountIs1( f254_arg0 )
	return DataSources.PlayerList.getCount( f254_arg0.playerScores ) <= 1
end

function PlayerListCountIs2( f255_arg0 )
	return DataSources.PlayerList.getCount( f255_arg0.playerScores ) == 2
end

function PlayerListCountIs3( f256_arg0 )
	return DataSources.PlayerList.getCount( f256_arg0.playerScores ) == 3
end

function PlayerListCountIs4( f257_arg0 )
	return DataSources.PlayerList.getCount( f257_arg0.playerScores ) >= 4
end

function PlayerHasAnObjective( f258_arg0, f258_arg1 )
	local f258_local0 = f258_arg0:getParent()
	f258_local0 = f258_local0:getModel( f258_arg1, "objectiveIcon" )
	if f258_local0 then
		return Engine.GetModelValue( f258_local0 ) ~= ""
	else
		return false
	end
end

function IsThereRoomForAnotherSplitscreenPlayer()
	return Engine.GetUsedControllerCount() < 2
end

function IsWaitingForSignInToPlaySplitscreen()
	return Engine.GetNonUsedControllerCount() > 0
end

function IsWaitingForAdditionalControllerToPlaySplitscreen()
	local f261_local0
	if not IsWaitingForSignInToPlaySplitscreen() then
		f261_local0 = IsThereRoomForAnotherSplitscreenPlayer()
	else
		f261_local0 = false
	end
	return f261_local0
end

function HasPerksInAnySlot( f262_arg0 )
	local f262_local0 = Engine.GetModelForController( f262_arg0 )
	local f262_local1 = Engine.GetModelValue( Engine.CreateModel( f262_local0, "perks.perk0_count" ) )
	if f262_local1 ~= nil and f262_local1 > 0 then
		return true
	else
		f262_local1 = Engine.GetModelValue( Engine.CreateModel( f262_local0, "perks.perk1_count" ) )
		if f262_local1 ~= nil and f262_local1 > 0 then
			return true
		else
			f262_local1 = Engine.GetModelValue( Engine.CreateModel( f262_local0, "perks.perk2_count" ) )
			if f262_local1 ~= nil and f262_local1 > 0 then
				return true
			else
				return false
			end
		end
	end
end

function HasPerksInSlot0( f263_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f263_arg0 ), "perks.perk0_count" ) )
	local f263_local1
	if modelValue == nil or modelValue <= 0 then
		f263_local1 = false
	else
		f263_local1 = true
	end
	return f263_local1
end

function HasOnePerkInSlot0( f264_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f264_arg0 ), "perks.perk0_count" ) )
	local f264_local1
	if modelValue == nil or modelValue ~= 1 then
		f264_local1 = false
	else
		f264_local1 = true
	end
	return f264_local1
end

function HasTwoPerksInSlot0( f265_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f265_arg0 ), "perks.perk0_count" ) )
	local f265_local1
	if modelValue == nil or modelValue ~= 2 then
		f265_local1 = false
	else
		f265_local1 = true
	end
	return f265_local1
end

function HasPerksInSlot1( f266_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f266_arg0 ), "perks.perk1_count" ) )
	local f266_local1
	if modelValue == nil or modelValue <= 0 then
		f266_local1 = false
	else
		f266_local1 = true
	end
	return f266_local1
end

function HasOnePerkInSlot1( f267_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f267_arg0 ), "perks.perk1_count" ) )
	local f267_local1
	if modelValue == nil or modelValue ~= 1 then
		f267_local1 = false
	else
		f267_local1 = true
	end
	return f267_local1
end

function HasTwoPerksInSlot1( f268_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f268_arg0 ), "perks.perk1_count" ) )
	local f268_local1
	if modelValue == nil or modelValue ~= 2 then
		f268_local1 = false
	else
		f268_local1 = true
	end
	return f268_local1
end

function HasPerksInSlot2( f269_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f269_arg0 ), "perks.perk2_count" ) )
	local f269_local1
	if modelValue == nil or modelValue <= 0 then
		f269_local1 = false
	else
		f269_local1 = true
	end
	return f269_local1
end

function HasOnePerkInSlot2( f270_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f270_arg0 ), "perks.perk2_count" ) )
	local f270_local1
	if modelValue == nil or modelValue ~= 1 then
		f270_local1 = false
	else
		f270_local1 = true
	end
	return f270_local1
end

function HasTwoPerksInSlot2( f271_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f271_arg0 ), "perks.perk2_count" ) )
	local f271_local1
	if modelValue == nil or modelValue ~= 2 then
		f271_local1 = false
	else
		f271_local1 = true
	end
	return f271_local1
end

function IsGameTypeEqualToString( f272_arg0 )
	local f272_local0 = Engine.DvarString( nil, "g_gametype" )
	local f272_local1
	if f272_local0 == nil or f272_local0 ~= f272_arg0 then
		f272_local1 = false
	else
		f272_local1 = true
	end
	return f272_local1
end

function IsBombBasedGameMode()
	local f273_local0 = Engine.DvarString( nil, "g_gametype" )
	local f273_local1
	if f273_local0 == nil or f273_local0 ~= "sd" and f273_local0 ~= "sr" and f273_local0 ~= "dem" then
		f273_local1 = false
	else
		f273_local1 = true
	end
	return f273_local1
end

function IsGametypeSettingsValue( f274_arg0, f274_arg1 )
	return Engine.GetGametypeSetting( f274_arg0 ) == f274_arg1
end

function ShouldBootUpHUD( f275_arg0 )
	if not Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
		return false
	else
		return not f275_arg0.hasBooted
	end
end

function OverheatWeaponVisible( f276_arg0 )
	local f276_local0 = Engine.GetModel( Engine.GetModelForController( f276_arg0 ), "hudItems" )
	if f276_local0 and Engine.GetModelValue( Engine.CreateModel( f276_local0, "overheatWeaponVisible" ) ) then
		return true
	else
		
	end
end

function IsWeaponClipGreaterThanOrEqualTo( f277_arg0, f277_arg1 )
	local f277_local0 = Engine.GetModel( Engine.GetModelForController( f277_arg0 ), "currentWeapon.clipMaxAmmo" )
	if f277_local0 == nil then
		return false
	else
		local f277_local1 = Engine.GetModelValue( f277_local0 )
		if f277_local1 == nil then
			return false
		else
			return f277_arg1 <= f277_local1
		end
	end
end

function WeaponUsesAmmo( f278_arg0 )
	local f278_local0 = Engine.GetModel( Engine.GetModelForController( f278_arg0 ), "currentWeapon.weapon" )
	if f278_local0 == nil then
		return false
	end
	local f278_local1 = Engine.GetModelValue( f278_local0 )
	if f278_local1 == nil then
		return false
	else
		local f278_local2
		if not Engine.IsWeaponType( f278_local1, "melee" ) and not Engine.IsWeaponType( f278_local1, "riotshield" ) then
			f278_local2 = not Engine.IsWeaponType( f278_local1, "grenade" )
		else
			f278_local2 = false
		end
	end
	return f278_local2
end

function WeaponHasAmmo( f279_arg0 )
	local f279_local0 = Engine.GetModelForController( f279_arg0 )
	local f279_local1 = Engine.GetModel( f279_local0, "currentWeapon.ammoStock" )
	local f279_local2 = Engine.GetModel( f279_local0, "currentWeapon.ammoInClip" )
	if f279_local1 == nil or f279_local2 == nil then
		return false
	else
		local f279_local3 = Engine.GetModelValue( f279_local1 )
		local f279_local4 = Engine.GetModelValue( f279_local2 )
		if f279_local3 == nil or f279_local4 == nil then
			return false
		else
			return f279_local3 + f279_local4 > 0
		end
	end
end

function IsInPrematchPeriod()
	return Engine.CurrentGameTime() < Engine.GetGametypeSetting( "prematchperiod" ) * 1000
end

function IsLowAmmoClip( f281_arg0 )
	local f281_local0 = Engine.IsAmmoClipLow( f281_arg0 )
	if f281_local0 then
		return f281_local0
	else
		return false
	end
end

function IsLowAmmoDWClip( f282_arg0 )
	local f282_local0 = Engine.IsDWAmmoClipLow( f282_arg0 )
	if f282_local0 then
		return f282_local0
	else
		return false
	end
end

function IsHeroWeaponGadgetCurrentWeapon( f283_arg0, f283_arg1 )
	local f283_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f283_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if not IsModelValueTrue( f283_arg1, "playerAbilities.playerGadget3.isInUse" ) then
		return false
	elseif Engine.isValidGadgetSlot( f283_local0 ) and Engine.IsGadgetCurrentWeapon( f283_arg1, f283_local0 ) then
		f283_arg0.wasHeroWeaponActivated = true
		return true
	else
		return false
	end
end

function IsHeroWeaponOrGadgetInUse( f284_arg0, f284_arg1 )
	local f284_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f284_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f284_local0 ) then
		if Engine.IsGadgetCurrentWeapon( f284_arg1, f284_local0 ) or Engine.IsGadgetContextualWeaponActive( f284_arg1, f284_local0 ) then
			f284_arg0.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	elseif not Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f284_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) ) then
		return false
	else
		return IsModelValueTrue( f284_arg1, "playerAbilities.playerGadget3.isInUse" )
	end
end

function IsHeroGadgetInUse( f285_arg0, f285_arg1 )
	return IsModelValueTrue( f285_arg1, "playerAbilities.playerGadget3.isInUse" )
end

function IsHeroWeaponSpeedBurst( f286_arg0, f286_arg1 )
	return IsModelValueEqualTo( f286_arg1, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_SPEED_BURST" )
end

function HasPerk( f287_arg0, f287_arg1 )
	return IsModelValueEqualTo( f287_arg0, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_COMBAT_EFFICIENCY" ) and IsModelValueEqualTo( f287_arg0, "playerAbilities.playerGadget3.isInUse", true )
end

function IsHeroWeaponOrGadgetEnergyAtLeast( f288_arg0, f288_arg1 )
	local f288_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f288_arg0 ), "playerAbilities.playerGadget3.powerRatio" ) )
	if f288_local0 == nil then
		return false
	else
		return f288_arg1 <= f288_local0
	end
end

function IsCurrentWeaponReference( f289_arg0, f289_arg1 )
	local f289_local0 = f289_arg1 .. "_" .. CoD.gameMode:lower()
	local f289_local1 = Engine.GetModel( Engine.GetModelForController( f289_arg0 ), "currentWeapon.equippedWeaponReference" )
	local f289_local2 = f289_local1 and Engine.GetModelValue( f289_local1 )
	local f289_local3
	if f289_local2 == nil or f289_local2 ~= f289_local0 then
		f289_local3 = false
	else
		f289_local3 = true
	end
	return f289_local3
end

function IsCurrentViewmodelWeaponName( f290_arg0, f290_arg1 )
	local f290_local0 = f290_arg1 .. "_" .. CoD.gameMode:lower()
	local f290_local1 = Engine.GetModel( Engine.GetModelForController( f290_arg0 ), "currentWeapon.viewmodelWeaponName" )
	local f290_local2 = f290_local1 and Engine.GetModelValue( f290_local1 )
	local f290_local3
	if f290_local2 == nil or f290_local2 ~= f290_local0 then
		f290_local3 = false
	else
		f290_local3 = true
	end
	return f290_local3
end

function IsHeroWeaponGadgetAmmoEmpty( f291_arg0, f291_arg1 )
	local f291_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f291_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	local f291_local1 = Engine.getHeldGadgetSlotForLoadoutGadget( f291_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if not (f291_local0 == -1 or not Engine.isValidGadgetSlot( f291_local0 )) or f291_local1 ~= -1 and Engine.isValidGadgetSlot( f291_local1 ) then
		local f291_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f291_arg1 ), "playerAbilities.playerGadget3.ammo" ) )
		if f291_local2 == nil or f291_local2 < 1 then
			f291_arg0.wasHeroWeaponActivated = false
			return true
		end
	end
	return false
end

function IsPrimaryOffhandGadgetAmmoBased( f292_arg0 )
	local f292_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f292_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f292_local0 ) then
		return Engine.IsAmmoBasedGadget( f292_arg0, f292_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetAmmoBased( f293_arg0 )
	local f293_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f293_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f293_local0 ) then
		return Engine.IsAmmoBasedGadget( f293_arg0, f293_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetAmmoBased( f294_arg0 )
	local f294_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f294_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f294_local0 ) then
		return Engine.IsAmmoBasedGadget( f294_arg0, f294_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetAmmoBased( f295_arg0 )
	local f295_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f295_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f295_local0 ) then
		return Engine.IsAmmoBasedGadget( f295_arg0, f295_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetPowerBased( f296_arg0 )
	local f296_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f296_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f296_local0 ) then
		return Engine.IsPowerBasedGadget( f296_arg0, f296_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetPowerBased( f297_arg0 )
	local f297_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f297_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f297_local0 ) then
		return Engine.IsPowerBasedGadget( f297_arg0, f297_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetPowerBased( f298_arg0 )
	local f298_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f298_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f298_local0 ) then
		return Engine.IsPowerBasedGadget( f298_arg0, f298_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetPowerBased( f299_arg0 )
	local f299_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f299_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f299_local0 ) then
		return Engine.IsPowerBasedGadget( f299_arg0, f299_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetPowerBar( f300_arg0 )
	local f300_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f300_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f300_local0 ) then
		return Engine.IsPowerBarGadget( f300_arg0, f300_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetPowerBar( f301_arg0 )
	local f301_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f301_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f301_local0 ) then
		return Engine.IsPowerBarGadget( f301_arg0, f301_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetPowerBar( f302_arg0 )
	local f302_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f302_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f302_local0 ) then
		return Engine.IsPowerBarGadget( f302_arg0, f302_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetPowerBar( f303_arg0 )
	local f303_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f303_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f303_local0 ) then
		return Engine.IsPowerBarGadget( f303_arg0, f303_local0 )
	else
		return false
	end
end

function WasHeroWeaponGadgetActivated( f304_arg0 )
	local f304_local0
	if f304_arg0.wasHeroWeaponActivated ~= nil then
		f304_local0 = f304_arg0.wasHeroWeaponActivated
	else
		f304_local0 = false
	end
	return f304_local0
end

function isHeroVersion_2_0( f305_arg0, f305_arg1 )
	return Engine.isHeroVersion_2_0( f305_arg0, f305_arg1 )
end

function HeroVersion_2_0_ShouldUseInUseGadget( f306_arg0, f306_arg1 )
	local f306_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f306_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f306_local0 ) and isHeroVersion_2_0( f306_arg1, f306_local0 ) then
		return true
	else
		return not IsHeroWeaponGadgetCurrentWeapon( f306_arg0, f306_arg1 )
	end
end

function IsHeroWeaponOrSpecialGadgetAvailable( f307_arg0, f307_arg1 )
	if IsHeroWeaponGadgetAvailable( f307_arg0, f307_arg1 ) then
		return true
	end
	local f307_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f307_arg1 ), "playerAbilities.playerGadget3.powerRatio" ) )
	local f307_local1
	if f307_local0 == nil or f307_local0 < 1 then
		f307_local1 = false
	else
		f307_local1 = true
	end
	return f307_local1
end

function IsSpecialGadgetAvailable( f308_arg0 )
	local f308_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f308_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f308_local0 ) then
		return Engine.IsGadgetAvailable( f308_arg0, f308_local0 )
	else
		return false
	end
end

function IsHeroAbilityWeapon( f309_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f309_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON ) )
end

function IsHeroAbilityGadget( f310_arg0 )
	return Engine.isValidGadgetSlot( Engine.getHeldGadgetSlotForLoadoutGadget( f310_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL ) )
end

function IsHeroWeaponGadgetAvailable( f311_arg0, f311_arg1 )
	local f311_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f311_arg1, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f311_local0 ) then
		if not Engine.IsGadgetAvailable( f311_arg1, f311_local0 ) then
			return false
		elseif isHeroVersion_2_0( f311_arg1, f311_local0 ) then
			return Engine.IsGadgetReady( f311_arg1, f311_local0 )
		else
			return not IsHeroWeaponGadgetAmmoEmpty( f311_arg0, f311_arg1 )
		end
	else
		return false
	end
end

function IsPrimaryOffhandGadgetFlickering( f312_arg0 )
	local f312_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f312_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f312_local0 ) then
		return Engine.IsGadgetFlickering( f312_arg0, f312_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetFlickering( f313_arg0 )
	local f313_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f313_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f313_local0 ) then
		return Engine.IsGadgetFlickering( f313_arg0, f313_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetFlickering( f314_arg0 )
	local f314_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f314_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f314_local0 ) then
		return Engine.IsGadgetFlickering( f314_arg0, f314_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetFlickering( f315_arg0 )
	local f315_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f315_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f315_local0 ) then
		return Engine.IsGadgetFlickering( f315_arg0, f315_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetActive( f316_arg0 )
	local f316_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f316_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f316_local0 ) then
		return Engine.isGadgetActive( f316_arg0, f316_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetActive( f317_arg0 )
	local f317_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f317_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f317_local0 ) then
		return Engine.isGadgetActive( f317_arg0, f317_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetActive( f318_arg0 )
	local f318_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f318_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f318_local0 ) then
		return Engine.isGadgetActive( f318_arg0, f318_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetActive( f319_arg0 )
	local f319_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f319_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f319_local0 ) then
		return Engine.isGadgetActive( f319_arg0, f319_local0 )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetCharging( f320_arg0 )
	local f320_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f320_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( f320_local0 ) then
		return Engine.isGadgetCharging( f320_arg0, f320_local0 )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetCharging( f321_arg0 )
	local f321_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f321_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( f321_local0 ) then
		return Engine.isGadgetCharging( f321_arg0, f321_local0 )
	else
		return false
	end
end

function IsSpecialOffhandGadgetCharging( f322_arg0 )
	local f322_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f322_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( f322_local0 ) then
		return Engine.isGadgetCharging( f322_arg0, f322_local0 )
	else
		return false
	end
end

function IsHeroWeaponGadgetCharging( f323_arg0 )
	local f323_local0 = Engine.getHeldGadgetSlotForLoadoutGadget( f323_arg0, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( f323_local0 ) then
		return Engine.isGadgetCharging( f323_arg0, f323_local0 )
	else
		return false
	end
end

function PulseNoLethal( f324_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f324_arg0 ), "hudItems.pulseNoLethal" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f324_local1 = CoD.T6ChangeClass
	if f324_local1 then
		f324_local1 = CoD.T6ChangeClass.SelectedClassIndex[f324_arg0]
	end
	if f324_local1 ~= nil and Engine.GetClassItem( f324_arg0, f324_local1, "primarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoTactical( f325_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f325_arg0 ), "hudItems.pulseNoTactical" ) )
	if modelValue == nil or modelValue <= 0 then
		return false
	end
	local f325_local1 = CoD.T6ChangeClass
	if f325_local1 then
		f325_local1 = CoD.T6ChangeClass.SelectedClassIndex[f325_arg0]
	end
	if f325_local1 ~= nil and Engine.GetClassItem( f325_arg0, f325_local1, "secondarygadget" ) == CoD.CACUtility.EmptyItemIndex then
		return false
	end
	return true
end

function PulseNoAmmo( f326_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f326_arg0 ), "hudItems.pulseNoAmmo" ) )
	local f326_local1
	if modelValue == nil or modelValue <= 0 then
		f326_local1 = false
	else
		f326_local1 = true
	end
	return f326_local1
end

function IsStickyImageActive( f327_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f327_arg0 ), "hudItems.stickyImage" ) )
	local f327_local1 = modelValue
	local f327_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f327_local2 = false
	else
		f327_local2 = f327_local1 and true
	end
	return f327_local2
end

function IsShockImageBottomActive( f328_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f328_arg0 ), "hudItems.shockImageBottom" ) )
	local f328_local1 = modelValue
	local f328_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f328_local2 = false
	else
		f328_local2 = f328_local1 and true
	end
	return f328_local2
end

function IsShockImageRightActive( f329_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f329_arg0 ), "hudItems.shockImageRight" ) )
	local f329_local1 = modelValue
	local f329_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f329_local2 = false
	else
		f329_local2 = f329_local1 and true
	end
	return f329_local2
end

function IsShockImageLeftActive( f330_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f330_arg0 ), "hudItems.shockImageLeft" ) )
	local f330_local1 = modelValue
	local f330_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f330_local2 = false
	else
		f330_local2 = f330_local1 and true
	end
	return f330_local2
end

function IsShockImageTopActive( f331_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f331_arg0 ), "hudItems.shockImageTop" ) )
	local f331_local1 = modelValue
	local f331_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f331_local2 = false
	else
		f331_local2 = f331_local1 and true
	end
	return f331_local2
end

function IsArmorOverlayActive( f332_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f332_arg0 ), "hudItems.armorOverlay" ) )
	local f332_local1 = modelValue
	local f332_local2
	if modelValue == "" or modelValue == "blacktransparent" then
		f332_local2 = false
	else
		f332_local2 = f332_local1 and true
	end
	return f332_local2
end

function IsAnyKillstreakInRangeAvailable( f333_arg0, f333_arg1, f333_arg2 )
	local f333_local0 = Engine.GetModel( Engine.GetModelForController( f333_arg0 ), "killstreaks" )
	if not f333_local0 then
		return false
	end
	for f333_local1 = f333_arg1, f333_arg2, 1 do
		local f333_local4 = Engine.GetModel( f333_local0, "killstreak" .. f333_local1 .. ".rewardAmmo" )
		local f333_local5 = f333_local4 and Engine.GetModelValue( f333_local4 )
		if f333_local5 ~= nil and f333_local5 > 0 then
			return true
		end
	end
	return false
end

function HigherKillstreakHasAmmo( f334_arg0, f334_arg1 )
	local f334_local0 = f334_arg1:getParent()
	local f334_local1 = f334_local0 and f334_local0.gridInfoTable
	if f334_local1 == nil then
		return false
	else
		local f334_local2 = 3 - f334_local1.zeroBasedIndex
		if f334_local2 >= 3 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f334_arg0, f334_local2 + 1, 4 )
		end
	end
end

function LowerKillstreakHasAmmo( f335_arg0, f335_arg1 )
	local f335_local0 = f335_arg1:getParent()
	local f335_local1 = f335_local0 and f335_local0.gridInfoTable
	if f335_local1 == nil then
		return false
	else
		local f335_local2 = 3 - f335_local1.zeroBasedIndex
		if f335_local2 == 0 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( f335_arg0, 0, f335_local2 - 1 )
		end
	end
end

function EarningTowardsThisKillstreak( f336_arg0, f336_arg1 )
	local f336_local0 = Engine.GetModel( Engine.GetModelForController( f336_arg0 ), "rewardMomentum" )
	local f336_local1 = Engine.GetModel( f336_arg1:getModel(), "momentumCost" )
	local f336_local2 = Engine.GetModel( Engine.GetModelForController( f336_arg0 ), "killstreaks" )
	if f336_arg1.gridInfoTable == nil then
		return false
	elseif not f336_local1 or not f336_local0 or not f336_local2 then
		return false
	else
		local f336_local3 = Engine.GetModelValue( f336_local1 )
		local f336_local4 = Engine.GetModelValue( f336_local0 )
		if f336_local4 == nil or f336_local3 == nil or f336_local3 < f336_local4 then
			return false
		else
			local f336_local5 = 3 - f336_arg1.gridInfoTable.zeroBasedIndex
			if f336_local5 == 0 then
				return true
			else
				local f336_local6 = Engine.GetModel( f336_local2, "killstreak" .. f336_local5 - 1 .. ".momentumCost" )
				local f336_local7 = f336_local6 and Engine.GetModelValue( f336_local6 )
				if f336_local7 == nil or f336_local4 < f336_local7 then
					return false
				else
					return true
				end
			end
		end
	end
end

function IsAtLeastHalfGameScore( f337_arg0, f337_arg1 )
	local f337_local0 = Engine.GetModelForController( f337_arg0 )
	local f337_local1 = f337_local0 and Engine.GetModel( f337_local0, "gameScore.scoreLimit" )
	if f337_local1 then
		f337_local1 = Engine.GetModelValue( f337_local1 )
	end
	local f337_local2 = f337_local0 and Engine.GetModel( f337_local0, f337_arg1 )
	local f337_local3 = f337_local2 and Engine.GetModelValue( f337_local2 )
	local f337_local4
	if f337_local1 == nil or f337_local3 == nil or f337_local1 > f337_local3 * 2 then
		f337_local4 = false
	else
		f337_local4 = true
	end
	return f337_local4
end

function IsCursorHintActive( f338_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f338_arg0 ), "hudItems.showCursorHint" ) )
	local f338_local1
	if modelValue == nil or modelValue ~= true then
		f338_local1 = false
	else
		f338_local1 = true
	end
	return f338_local1
end

function IsGameTypeDOA()
	local f339_local0
	if Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "doa" then
		f339_local0 = false
	else
		f339_local0 = true
	end
	return f339_local0
end

function HideScoreMeterDueToGameType()
	local f340_local0 = Engine.DvarString( nil, "g_gametype" )
	local f340_local1
	if f340_local0 == nil or f340_local0 ~= "ctf" and f340_local0 ~= "dem" and f340_local0 ~= "sd" then
		f340_local1 = false
	else
		f340_local1 = true
	end
	return f340_local1
end

function IsGameTypeCodfu( f341_arg0, f341_arg1, f341_arg2 )
	local f341_local0
	if Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "codfu" then
		f341_local0 = false
	else
		f341_local0 = true
	end
	return f341_local0
end

function HasRoundLimit( f342_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f342_arg0 ), "gameScore.roundLimit" ) ) > 0
end

function IsSingleRound( f343_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f343_arg0 ), "gameScore.roundLimit" ) ) == 1
end

function IsYourTeamWinning( f344_arg0 )
	local f344_local0 = Engine.GetModelForController( f344_arg0 )
	local f344_local1 = Engine.GetModelValue( Engine.CreateModel( f344_local0, "gameScore.yourScore" ) )
	local f344_local2 = Engine.GetModelValue( Engine.CreateModel( f344_local0, "gameScore.enemyScore" ) )
	if f344_local2 and f344_local1 then
		return f344_local2 < f344_local1
	else
		
	end
end

function IsYourTeamLosing( f345_arg0 )
	local f345_local0 = Engine.GetModelForController( f345_arg0 )
	local f345_local1 = Engine.GetModelValue( Engine.CreateModel( f345_local0, "gameScore.yourScore" ) )
	local f345_local2 = Engine.GetModelValue( Engine.CreateModel( f345_local0, "gameScore.enemyScore" ) )
	if f345_local2 and f345_local1 then
		return f345_local1 < f345_local2
	else
		
	end
end

function IsZombieRoundEqualTo( f346_arg0, f346_arg1, f346_arg2 )
	IsSelfModelValueEqualTo( f346_arg0, f346_arg1, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + f346_arg2 )
end

function IsZombieRoundOnesDigitEqualTo( f347_arg0, f347_arg1, f347_arg2 )
	local f347_local0 = f347_arg0:getModel()
	if f347_local0 then
		f347_local0 = Engine.GetModel( f347_local0, "roundsPlayed" )
	end
	local f347_local1 = f347_local0 and Engine.GetModelValue( f347_local0 )
	if f347_local1 == nil then
		return false
	else
		return (f347_local1 - Engine.GetGametypeSetting( "startRound" )) % 10 == f347_arg2
	end
end

function IsZombieRoundTensDigitEqualTo( f348_arg0, f348_arg1, f348_arg2 )
	local f348_local0 = f348_arg0:getModel()
	if f348_local0 then
		f348_local0 = Engine.GetModel( f348_local0, "roundsPlayed" )
	end
	local f348_local1 = f348_local0 and Engine.GetModelValue( f348_local0 )
	if f348_local1 == nil then
		return false
	else
		f348_local1 = f348_local1 - Engine.GetGametypeSetting( "startRound" )
		return (f348_local1 % 100 - f348_local1 % 10) / 10 == f348_arg2
	end
end

function IsParentListInFocus( f349_arg0 )
	local f349_local0 = f349_arg0.gridInfoTable.parentGrid
	if f349_local0 and f349_local0.hasListFocus then
		return true
	else
		return false
	end
end

function IsDisabled( f350_arg0, f350_arg1 )
	local f350_local0 = f350_arg0:getModel( f350_arg1, "disabledFunction" )
	if f350_local0 then
		local f350_local1 = Engine.GetModelValue( f350_local0 )
		if f350_local1 then
			f350_arg0.disabled = f350_local1()
			return f350_local1()
		end
	end
	local f350_local1 = f350_arg0:getModel( f350_arg1, "disabled" )
	if f350_local1 then
		f350_arg0.disabled = Engine.GetModelValue( f350_local1 )
	end
	return f350_arg0.disabled
end

function IsEnabledByGametypeSetting( f351_arg0, f351_arg1 )
	if f351_arg0.enabledWithGametypeSetting ~= nil then
		return Engine.GetGametypeSetting( f351_arg0.enabledWithGametypeSetting ) == 1
	else
		return true
	end
end

function IsSelected( f352_arg0, f352_arg1 )
	local f352_local0 = f352_arg0:getModel( f352_arg1, "selected" )
	if f352_local0 then
		f352_arg0.selected = Engine.GetModelValue( f352_local0 )
	end
	return f352_arg0.selected
end

function IsOddIndexItem( f353_arg0 )
	local f353_local0 = f353_arg0:getParent()
	if f353_local0 == nil or f353_local0.gridInfoTable == nil or f353_local0.gridInfoTable.zeroBasedIndex == nil then
		return false
	else
		return f353_local0.gridInfoTable.zeroBasedIndex % 2 == 1
	end
end

function ListHasElements( f354_arg0 )
	local f354_local0
	if f354_arg0.layoutItems == nil or #f354_arg0.layoutItems <= 0 then
		f354_local0 = false
	else
		f354_local0 = true
	end
	return f354_local0
end

function IsFirstItem( f355_arg0 )
	return f355_arg0.isFirstItem and f355_arg0:isFirstItem()
end

function IsLastItem( f356_arg0 )
	return f356_arg0.isLastItem and f356_arg0:isLastItem()
end

function ShouldDisplayButton( f357_arg0, f357_arg1 )
	local f357_local0 = f357_arg0:getModel( f357_arg1, "tabIcon" )
	if f357_local0 then
		return Engine.GetModelValue( f357_local0 ) ~= ""
	else
		return false
	end
end

function IsHeroLocked( f358_arg0, f358_arg1 )
	local f358_local0 = f358_arg0:getModel( f358_arg1, "disabled" )
	if not f358_local0 or Engine.GetModelValue( f358_local0 ) then
		return true
	else
		return false
	end
end

function IsHeroWeaponAbilityNotAvailable( f359_arg0, f359_arg1 )
	return IsLive() and f359_local2 or f359_local1
end

function IsHeroOnDisabledLoadoutItem( f360_arg0 )
	return f360_arg0.disabled
end

function IsSmallHeroCategory( f361_arg0 )
	return f361_arg0.categorySize == CoD.CCUtility.Heroes.SmallCategory
end

function IsEdittingHeroOption( f362_arg0 )
	return f362_arg0.currentMode ~= CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

function IsHeroColorOption( f363_arg0 )
	return f363_arg0.isColorOption
end

function IsLoadoutSelectionSlot( f364_arg0 )
	return f364_arg0.equippedSlot ~= nil
end

function FirstTimeSetup_IsActive( f365_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f365_arg0 ), "firstTimeFlowState" ) ) ~= CoD.CCUtility.FirstTimeFlowState.None
end

function FirstTimeSetup_Overview( f366_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f366_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Overview
end

function FirstTimeSetup_ChangedCharacter( f367_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f367_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.SelectionChanged
end

function FirstTimeSetup_Complete( f368_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f368_arg0 ), "firstTimeFlowState" ) ) == CoD.CCUtility.FirstTimeFlowState.Complete
end

function HeroUsingWeapon( f369_arg0, f369_arg1 )
	if f369_arg0.equippedSlot then
		return f369_arg0.equippedSlot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
	else
		local f369_local0 = f369_arg0:getModel( f369_arg1, "equippedSlot" )
		if f369_local0 then
			return Engine.GetModelValue( f369_local0 ) == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
		else
			return false
		end
	end
end

function IsEdittingLoadoutForHero()
	return CoD.CCUtility.Heroes.edittingLoadoutForWidget ~= nil
end

function IsCurrentEdittingLoadForHeroWidget( f371_arg0 )
	return CoD.CCUtility.Heroes.edittingLoadoutForWidget == f371_arg0
end

function IsCurrentSelectedHeroOption( f372_arg0, f372_arg1 )
	local f372_local0 = f372_arg0:getModel( f372_arg1, "optionIndex" )
	if f372_local0 then
		local f372_local1 = Engine.GetModelValue( f372_local0 )
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				return f372_local1 == CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				return f372_local1 == CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			return f372_local1 == CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			return f372_local1 == CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
		end
	end
	return false
end

function IsObjectiveActive( f373_arg0, f373_arg1 )
	local f373_local0 = f373_arg0:getModel( f373_arg1, "status" )
	if f373_local0 then
		local f373_local1
		if Engine.GetModelValue( f373_local0 ) ~= "current" and Engine.GetModelValue( f373_local0 ) ~= "active" then
			f373_local1 = false
		else
			f373_local1 = true
		end
		return f373_local1
	else
		return false
	end
end

function IsObjectiveComplete( f374_arg0, f374_arg1 )
	local f374_local0 = f374_arg0:getModel( f374_arg1, "status" )
	if f374_local0 then
		return Engine.GetModelValue( f374_local0 ) == "done"
	else
		return false
	end
end

function IsObjectiveFailed( f375_arg0, f375_arg1 )
	local f375_local0 = f375_arg0:getModel( f375_arg1, "status" )
	if f375_local0 then
		return Engine.GetModelValue( f375_local0 ) == "failed"
	else
		return false
	end
end

function IsObjectiveDescription( f376_arg0, f376_arg1 )
	local f376_local0 = f376_arg0:getModel( f376_arg1, "status" )
	if f376_local0 then
		return Engine.GetModelValue( f376_local0 ) == "description"
	else
		return false
	end
end

function IsObjectiveHidden( f377_arg0, f377_arg1 )
	if f377_arg0:getModel() == nil then
		return true
	else
		local f377_local0 = Engine.GetModel( f377_arg0:getModel(), "state" )
		local f377_local1 = f377_local0 and Engine.GetModelValue( f377_local0 )
		local f377_local2 = Engine.GetPredictedClientNum( f377_arg1 )
		if f377_local1 == nil or f377_local1 == CoD.OBJECTIVESTATE_INVISIBLE then
			return true
		else
			local f377_local3 = Engine.GetModel( f377_arg0:getModel(), "clientUseMask" )
			local f377_local4 = f377_local3 and Engine.GetModelValue( f377_local3 )
			if f377_local4 == nil or f377_local4 == 0 then
				return false
			else
				return f377_local4 & 1 << Engine.GetPredictedClientNum( f377_arg1 ) == 0
			end
		end
	end
end

function IsObjectiveRequirementLabelHidden( f378_arg0, f378_arg1 )
	local f378_local0 = Engine.GetModel( Engine.GetModelForController( f378_arg1 ), "interactivePrompt.activeObjectiveID" )
	if f378_local0 then
		f378_local0 = Engine.GetModelValue( f378_local0 )
	end
	if f378_local0 and f378_arg0.objIndex == f378_local0 then
		if f378_arg0.recenter then
			f378_arg0:recenter()
		end
		return false
	else
		return true
	end
end

function IsListSelectionMode( f379_arg0, f379_arg1 )
	return f379_arg0.currentMode == f379_arg1
end

function IsPaintJobCustomItem( f380_arg0, f380_arg1 )
	if DataSources.WeaponOptions.getCurrentFilterItem() == "paintjob" then
		local f380_local0 = f380_arg0:getModel( f380_arg1, "ref" )
		if f380_local0 and Engine.GetModelValue( f380_local0 ) == "paintshop_1" then
			return true
		end
	end
	return false
end

function IsPaintJobCustomListButton( f381_arg0, f381_arg1 )
	local f381_local0 = f381_arg0:getModel( f381_arg1, "type" )
	local f381_local1 = f381_arg0:getModel( f381_arg1, "paintjobSlot" )
	local f381_local2 = f381_arg0:getModel( f381_arg1, "paintjobIndex" )
	if f381_local0 and f381_local1 and f381_local2 then
		if Engine.GetModelValue( f381_local0 ) == "paintjob" and Engine.GetModelValue( f381_local1 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and Engine.GetModelValue( f381_local2 ) ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			return true
		end
	end
	return false
end

function HasGlobalHintText( f382_arg0 )
	return DataSources.PerController.hasHintText( f382_arg0 )
end

function HasHintText( f383_arg0 )
	local f383_local0 = f383_arg0:getModel()
	if f383_local0 then
		local f383_local1 = Engine.GetModel( f383_local0, "hintText" )
		if f383_local1 and Engine.GetModelValue( f383_local1 ) ~= "" then
			return true
		end
	end
	return false
end

function PDV_IsDataVaultOpen( f384_arg0 )
	return CoD.perController[f384_arg0].InspectingDataVault == true
end

function PDV_SelectingMap( f385_arg0 )
	return f385_arg0.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_MISSION
end

function PDV_SelectingCollectible( f386_arg0 )
	return f386_arg0.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE
end

function PDV_InspectingCollectible( f387_arg0 )
	return f387_arg0.currentMode == CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE
end

function PDV_SlotHasCollectible( f388_arg0, f388_arg1 )
	local f388_local0 = f388_arg0:getModel( f388_arg1, "collectibleSlot" )
	if f388_local0 and Engine.GetCollectibleInBunkSlot( f388_arg1, Engine.GetModelValue( f388_local0 ) ) ~= nil then
		return true
	else
		return false
	end
end

function Gunsmith_IsEnabled( f389_arg0, f389_arg1 )
	if Dvar.ui_execdemo_beta:get() then
		return false
	end
	local f389_local0 = Engine.GetModelForController( f389_arg1 )
	local f389_local1 = Engine.GetModel( f389_local0, "Gunsmith.DataDownloaded" )
	local f389_local2 = Engine.GetModel( f389_local0, "Paintshop.DataDownloaded" )
	local f389_local3 = false
	local f389_local4 = false
	if f389_local1 and f389_local2 then
		f389_local3 = Engine.GetModelValue( f389_local1 )
		f389_local4 = Engine.GetModelValue( f389_local2 )
	end
	if Dvar.storage_offline:get() == false and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	end
	return f389_local4 and f389_local3 and IsIntDvarNonZero( "gunsmith_enabled" )
end

function Gunsmith_ValidVariantNameEntered( f390_arg0, f390_arg1 )
	local f390_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f390_arg1 ), "Gunsmith.validVariantNameEntered" ) )
	if f390_local0 ~= nil and f390_local0 == true then
		f390_arg0:makeFocusableWithoutResettingNavigation()
		return true
	else
		f390_arg0:makeNotFocusable()
		return false
	end
end

function Gunsmith_IsVariantOccupied( f391_arg0, f391_arg1 )
	local f391_local0 = Engine.GetModel( f391_arg0:getModel(), "variantIndex" )
	if f391_local0 and CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( Engine.GetModelValue( f391_local0 ) ) then
		return true
	else
		return false
	end
end

function Gunsmith_IsAttachmentEquipped( f392_arg0, f392_arg1, f392_arg2 )
	local f392_local0 = f392_arg1:getModel()
	local f392_local1 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f392_arg2, CoD.perController[f392_arg2].gunsmithVariantModel )
	if f392_local0 then
		local f392_local2 = Engine.GetModel( f392_local0, "attachmentIndex" )
		if f392_local2 then
			local f392_local3 = Engine.GetModelValue( f392_local2 )
			for f392_local7, f392_local8 in ipairs( f392_local1 ) do
				if f392_local8 == f392_local3 then
					return true
				end
			end
		end
	end
	return false
end

function Gunsmith_IsItemMutuallyExclusiveWithSelection( f393_arg0, f393_arg1 )
	local f393_local0 = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f393_arg1, CoD.perController[f393_arg1].gunsmithVariantModel )
	local f393_local1 = CoD.CACUtility.EmptyItemIndex
	local f393_local2 = f393_arg0:getModel( f393_arg1, "attachmentIndex" )
	local f393_local3 = CoD.GetCustomization( f393_arg1, "weapon_index" )
	if f393_local2 then
		f393_local1 = Engine.GetModelValue( f393_local2 )
		for f393_local7, f393_local8 in ipairs( f393_local0 ) do
			if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f393_local8 and f393_local1 ~= f393_local8 then
				return not Engine.AreAttachmentsCompatible( f393_local3, Engine.GetAttachmentIndexByAttachmentTableIndex( f393_local3, f393_local1, Enum.eModes.MODE_MULTIPLAYER ), Engine.GetAttachmentIndexByAttachmentTableIndex( f393_local3, f393_local8, Enum.eModes.MODE_MULTIPLAYER ), Enum.eModes.MODE_MULTIPLAYER )
			end
		end
	end
	return false
end

function Gunsmith_IsCamoEquipped( f394_arg0, f394_arg1, f394_arg2 )
	local f394_local0 = f394_arg1:getModel()
	local f394_local1 = Engine.GetModelValue( f394_arg0:getModel() )
	if f394_local0 then
		local f394_local2 = Engine.GetModel( f394_local0, "itemIndex" )
		if f394_local2 and f394_local1 == Engine.GetModelValue( f394_local2 ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsSpecialWeapon( f395_arg0, f395_arg1, f395_arg2 )
	local f395_local0 = CoD.CraftUtility.GetWeaponGroupName( f395_arg2 )
	local f395_local1 = false
	if f395_local0 == "weapon_launcher" or f395_local0 == "weapon_knife" then
		f395_local1 = true
	end
	return f395_local1
end

function Gunsmith_IsHandguns( f396_arg0, f396_arg1, f396_arg2 )
	return CoD.CraftUtility.GetWeaponGroupName( f396_arg2 ) == "weapon_pistol"
end

function Gunsmith_IsLockedForDemo( f397_arg0, f397_arg1, f397_arg2 )
	local f397_local0 = f397_arg1:getModel()
	if f397_local0 then
		local f397_local1 = Engine.GetModel( f397_local0, "name" )
		if f397_local1 and Engine.GetModelValue( f397_local1 ) == "MP_CLASSIFIED" then
			return true
		end
	end
	return false
end

function Gunsmith_IsVariantCountEmpty( f398_arg0, f398_arg1 )
	local f398_local0 = f398_arg0:getModel( f398_arg1, "itemIndex" )
	if f398_local0 then
		local f398_local1 = Engine.GetModelValue( f398_local0 )
		if f398_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( f398_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function IsAttachmentLockedInWeaponBuildKits( f399_arg0, f399_arg1 )
	local f399_local0 = CoD.GetCustomization( f399_arg1, "weapon_index" )
	local f399_local1 = f399_arg0:getModel( f399_arg1, "attachmentIndex" )
	if f399_local0 and f399_local1 then
		return Engine.IsItemAttachmentLocked( f399_arg1, f399_local0, Engine.GetAttachmentIndexByAttachmentTableIndex( f399_local0, Engine.GetModelValue( f399_local1 ), Enum.eModes.MODE_ZOMBIES ) )
	else
		
	end
end

function IsAttachmentSlotLocked( f400_arg0, f400_arg1, f400_arg2 )
	local f400_local0 = f400_arg0:getModel( f400_arg1, "weaponIndex" )
	if not f400_local0 then
		return false
	end
	local f400_local1 = Engine.IsAttachmentSlotLocked( f400_arg1, Engine.GetModelValue( f400_local0 ), f400_arg2 )
	if f400_local1 == nil then
		f400_local1 = false
	end
	return f400_local1
end

function Paintjobs_IsOccupied( f401_arg0, f401_arg1 )
	local f401_local0 = Engine.GetModel( f401_arg0:getModel(), "paintjobSlot" )
	local f401_local1 = Engine.GetModel( f401_arg0:getModel(), "paintjobIndex" )
	if f401_local0 and f401_local1 and CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( Engine.GetModelValue( f401_local0 ), Engine.GetModelValue( f401_local1 ) ) then
		return true
	else
		return false
	end
end

function Paintjobs_SlotsFull()
	if CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs() <= CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs() then
		return true
	else
		return false
	end
end

function Paintjobs_IsCountGreaterThanZero( f403_arg0, f403_arg1 )
	local f403_local0 = f403_arg0:getModel( f403_arg1, "itemIndex" )
	if f403_local0 then
		local f403_local1 = Engine.GetModelValue( f403_local0 )
		if f403_local1 > CoD.CACUtility.EmptyItemIndex and CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( f403_local1 ) <= 0 then
			return false
		end
	end
	return true
end

function Paintjobs_IsFeatureDisabled( f404_arg0, f404_arg1 )
	local f404_local0
	if Paintjobs_IsEnabled( f404_arg0, f404_arg1 ) then
		f404_local0 = CoD.isPC
		if f404_local0 then
			f404_local0 = Dvar.ui_execdemo_beta:get()
		end
	else
		f404_local0 = true
	end
	return f404_local0
end

function Paintjobs_IsEnabled( f405_arg0, f405_arg1 )
	if Dvar.storage_offline:get() == false and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	elseif Engine.IsUserContentRestricted( f405_arg1 ) then
		return false
	else
		return Paintjobs_IsDataDownloaded( f405_arg0, f405_arg1 )
	end
end

function Paintjobs_IsDataDownloaded( f406_arg0, f406_arg1 )
	local f406_local0 = Engine.GetModel( Engine.GetModelForController( f406_arg1 ), "Paintshop.DataDownloaded" )
	local f406_local1 = false
	if f406_local0 then
		f406_local1 = Engine.GetModelValue( f406_local0 )
	end
	return f406_local1
end

function Paintjobs_ValidPaintjobNameEntered( f407_arg0, f407_arg1 )
	local f407_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f407_arg1 ), "Paintshop.validPaintjobNameEntered" ) )
	if f407_local0 ~= nil and f407_local0 == true then
		f407_arg0:makeFocusableWithoutResettingNavigation()
		return true
	else
		f407_arg0:makeNotFocusable()
		return false
	end
end

function Emblem_IsOccupied( f408_arg0, f408_arg1 )
	local f408_local0 = Engine.GetModel( f408_arg0:getModel(), "emblemIndex" )
	if f408_local0 and CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( Engine.GetModelValue( f408_local0 ) ) then
		return true
	else
		return false
	end
end

function Emblem_IsLayerInBrowseMode( f409_arg0, f409_arg1 )
	if CoD.GetEditorProperties( f409_arg1, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE then
		local f409_local0 = CoD.GetEditorProperties( f409_arg1, "linkedLayerCount" )
		if not Emblem_IsLayerGrouped( f409_arg0, f409_arg1 ) then
			if not Emblems_IsLayerLinked( f409_arg0, f409_arg1 ) then
				return true
			elseif Emblems_IsLayerLinked( f409_arg0, f409_arg1 ) and f409_local0 < 2 then
				return true
			end
		end
		return false
	else
		return false
	end
end

function Emblems_ValidEmblemNameEntered( f410_arg0, f410_arg1 )
	local f410_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f410_arg1 ), "Emblem.validEmblemNameEntered" ) )
	if f410_local0 ~= nil and f410_local0 == true then
		return true
	else
		return false
	end
end

function Emblems_IsEnabled( f411_arg0, f411_arg1 )
	if Dvar.ui_execdemo_beta:get() then
		return false
	elseif Dvar.storage_offline:get() == false and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		return Emblems_IsDataDownloaded( f411_arg0, f411_arg1 )
	end
end

function Emblems_IsDataDownloaded( f412_arg0, f412_arg1 )
	local f412_local0 = Engine.GetModel( Engine.GetModelForController( f412_arg1 ), "Emblem.DataDownloaded" )
	local f412_local1 = false
	if f412_local0 then
		f412_local1 = Engine.GetModelValue( f412_local0 )
	end
	return f412_local1
end

function Emblems_IsLayerLinked( f413_arg0, f413_arg1 )
	local f413_local0 = f413_arg0:getModel( f413_arg1, "isLinked" )
	if f413_local0 then
		return Engine.GetModelValue( f413_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGrouped( f414_arg0, f414_arg1 )
	local f414_local0 = f414_arg0:getModel( f414_arg1, "isGrouped" )
	if f414_local0 then
		return Engine.GetModelValue( f414_local0 )
	else
		return false
	end
end

function Emblem_IsLayerGroupedByLayerIndex( f415_arg0, f415_arg1 )
	local f415_local0 = CoD.GetCustomization( f415_arg1, "type" )
	if CoD.perController[f415_arg1].selectedLayerIndex ~= nil then
		local f415_local1 = Engine.GetSelectedLayerData( f415_arg1, CoD.perController[f415_arg1].selectedLayerIndex, f415_local0 )
		return f415_local1.isGrouped
	else
		return false
	end
end

function IsEmblemEmpty( f416_arg0 )
	return Engine.IsEmblemEmpty( f416_arg0, CoD.GetCustomization( f416_arg0, "type" ), CoD.perController[f416_arg0].totalLayers )
end

function IsLayerEmpty( f417_arg0, f417_arg1, f417_arg2 )
	if f417_arg0.layerCarousel ~= nil then
		local f417_local0 = f417_arg0.layerCarousel.currentStartRow
		f417_arg1 = f417_arg0.layerCarousel.layoutItems[f417_arg0.layerCarousel.currentStartRow][f417_arg0.layerCarousel.currentStartColumn]
	end
	if f417_arg1 then
		local f417_local0 = f417_arg1:getModel( f417_arg2, "layerIndex" )
		if not f417_local0 then
			return true
		elseif Engine.GetSelectedLayerIconID( f417_arg2, Engine.GetModelValue( f417_local0 ) ) == CoD.emblem.INVALID_ID then
			return true
		else
			return false
		end
	else
		return true
	end
end

function IsEditMode( f418_arg0 )
	return CoD.GetEditorProperties( f418_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT
end

function IsBrowseMode( f419_arg0 )
	return CoD.GetEditorProperties( f419_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
end

function IsClipboardEmpty( f420_arg0 )
	return CoD.GetEditorProperties( f420_arg0, "isClipboardEmpty" ) == CoD.emblem.CLIPBOARDSTATE.EMPTY
end

function IsSelectedColorEmpty( f421_arg0, f421_arg1 )
	local f421_local0 = CoD.GetEditorProperties( f421_arg1, "colorNum" )
	local f421_local1 = CoD.GetEditorProperties( f421_arg1, "isColor0NoColor" )
	local f421_local2 = CoD.GetEditorProperties( f421_arg1, "isColor1NoColor" )
	if f421_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 and f421_local1 == 1 then
		return true
	elseif f421_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 and f421_local2 == 1 then
		return true
	else
		return false
	end
end

function IsEmblemEditor( f422_arg0 )
	return CoD.GetCustomization( f422_arg0, "type" ) == Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
end

function IsPaintshop( f423_arg0 )
	local f423_local0 = CoD.GetCustomization( f423_arg0, "type" )
	local f423_local1
	if f423_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT and f423_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP and f423_local0 ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT then
		f423_local1 = false
	else
		f423_local1 = true
	end
	return f423_local1
end

function IsArenaStarInvisible( f424_arg0, f424_arg1, f424_arg2 )
	local f424_local0 = f424_arg0:getParent()
	if f424_local0 == nil then
		return false
	end
	local f424_local1 = f424_local0:getModel( f424_arg1, "levelStars" )
	local f424_local2
	if f424_local1 and Engine.GetModelValue( f424_local1 ) >= tonumber( f424_arg2 ) then
		f424_local2 = false
	else
		f424_local2 = true
	end
	return f424_local2
end

function IsArenaStarInactive( f425_arg0, f425_arg1, f425_arg2 )
	local f425_local0 = f425_arg0:getParent()
	if f425_local0 == nil then
		return false
	end
	local f425_local1 = f425_local0:getModel( f425_arg1, "levelStars" )
	local f425_local2 = f425_local0:getModel( f425_arg1, "earnedStars" )
	local f425_local3 = tonumber( f425_arg2 )
	local f425_local4 = f425_local1
	local f425_local5 = f425_local2
	local f425_local6
	if f425_local3 > Engine.GetModelValue( f425_local1 ) or Engine.GetModelValue( f425_local2 ) >= f425_local3 then
		f425_local6 = false
	else
		f425_local6 = f425_local5 and f425_local4 and true
	end
	return f425_local6
end

function IsArenaStarEarned( f426_arg0, f426_arg1, f426_arg2 )
	local f426_local0 = f426_arg0:getParent()
	if f426_local0 == nil then
		return false
	else
		local f426_local1 = f426_local0:getModel( f426_arg1, "earnedStars" )
		return f426_local1 and tonumber( f426_arg2 ) <= Engine.GetModelValue( f426_local1 )
	end
end

function IsParamModelEqualTo( f427_arg0, f427_arg1 )
	return f427_arg0 and Engine.GetModelValue( f427_arg0 ) == f427_arg1
end

function IsParamModelEqualToString( f428_arg0, f428_arg1 )
	return f428_arg0 and Engine.GetModelValue( f428_arg0 ) == f428_arg1
end

function IsModelParameterValueEnum( f429_arg0, f429_arg1 )
	return f429_arg0 and Engine.GetModelValue( f429_arg0 ) == f429_arg1
end

function IsModelValueNil( f430_arg0, f430_arg1 )
	return Engine.GetModel( Engine.GetModelForController( f430_arg0 ), f430_arg1 ) == nil
end

function IsModelValueNonEmptyString( f431_arg0, f431_arg1 )
	local f431_local0 = Engine.GetModel( Engine.GetModelForController( f431_arg0 ), f431_arg1 )
	local f431_local1 = f431_local0 and Engine.GetModelValue( f431_local0 )
	local f431_local2
	if f431_local1 == nil or f431_local1 == "" then
		f431_local2 = false
	else
		f431_local2 = true
	end
	return f431_local2
end

function IsModelValueTrue( f432_arg0, f432_arg1 )
	local f432_local0 = Engine.GetModel( Engine.GetModelForController( f432_arg0 ), f432_arg1 )
	local f432_local1 = f432_local0 and Engine.GetModelValue( f432_local0 )
	local f432_local2
	if f432_local1 == nil or f432_local1 ~= true then
		f432_local2 = false
	else
		f432_local2 = true
	end
	return f432_local2
end

function IsModelValueGreaterThan( f433_arg0, f433_arg1, f433_arg2 )
	local f433_local0 = Engine.GetModel( Engine.GetModelForController( f433_arg0 ), f433_arg1 )
	local f433_local1 = f433_local0 and Engine.GetModelValue( f433_local0 )
	local f433_local2
	if f433_local1 == nil or f433_arg2 >= f433_local1 then
		f433_local2 = false
	else
		f433_local2 = true
	end
	return f433_local2
end

function IsModelValueLessThan( f434_arg0, f434_arg1, f434_arg2 )
	local f434_local0 = Engine.GetModel( Engine.GetModelForController( f434_arg0 ), f434_arg1 )
	local f434_local1 = f434_local0 and Engine.GetModelValue( f434_local0 )
	local f434_local2
	if f434_local1 == nil or f434_local1 >= f434_arg2 then
		f434_local2 = false
	else
		f434_local2 = true
	end
	return f434_local2
end

function IsModelValueGreaterThanOrEqualTo( f435_arg0, f435_arg1, f435_arg2 )
	local f435_local0 = Engine.GetModel( Engine.GetModelForController( f435_arg0 ), f435_arg1 )
	local f435_local1 = f435_local0 and Engine.GetModelValue( f435_local0 )
	local f435_local2
	if f435_local1 == nil or f435_arg2 > f435_local1 then
		f435_local2 = false
	else
		f435_local2 = true
	end
	return f435_local2
end

function IsModelValueLessThanOrEqualTo( f436_arg0, f436_arg1, f436_arg2 )
	local f436_local0 = Engine.GetModel( Engine.GetModelForController( f436_arg0 ), f436_arg1 )
	local f436_local1 = f436_local0 and Engine.GetModelValue( f436_local0 )
	local f436_local2
	if f436_local1 == nil or f436_local1 > f436_arg2 then
		f436_local2 = false
	else
		f436_local2 = true
	end
	return f436_local2
end

function IsModelValueEqualTo( f437_arg0, f437_arg1, f437_arg2 )
	local f437_local0 = Engine.GetModel( Engine.GetModelForController( f437_arg0 ), f437_arg1 )
	local f437_local1 = f437_local0 and Engine.GetModelValue( f437_local0 )
	local f437_local2
	if f437_local1 == nil or f437_local1 ~= f437_arg2 then
		f437_local2 = false
	else
		f437_local2 = true
	end
	return f437_local2
end

function IsModelValueEqualToEnum( f438_arg0, f438_arg1, f438_arg2 )
	local f438_local0 = Engine.GetModel( Engine.GetModelForController( f438_arg0 ), f438_arg1 )
	local f438_local1 = f438_local0 and Engine.GetModelValue( f438_local0 )
	local f438_local2
	if f438_local1 == nil or f438_local1 ~= f438_arg2 then
		f438_local2 = false
	else
		f438_local2 = true
	end
	return f438_local2
end

function IsModelValueEnumBitSet( f439_arg0, f439_arg1, f439_arg2 )
	local f439_local0 = Engine.GetModel( Engine.GetModelForController( f439_arg0 ), f439_arg1 )
	local f439_local1 = f439_local0 and Engine.GetModelValue( f439_local0 )
	local f439_local2
	if f439_local1 ~= nil then
		f439_local2 = CoD.BitUtility.IsBitSet( f439_local1, f439_arg2 )
	else
		f439_local2 = false
	end
	return f439_local2
end

function ModelValueStartsWith( f440_arg0, f440_arg1, f440_arg2 )
	local f440_local0 = Engine.GetModel( Engine.GetModelForController( f440_arg0 ), f440_arg1 )
	local f440_local1 = f440_local0 and Engine.GetModelValue( f440_local0 )
	local f440_local2
	if f440_local1 ~= nil then
		f440_local2 = LUI.startswith( f440_local1, f440_arg2 )
	else
		f440_local2 = false
	end
	return f440_local2
end

function IsControllerModelValueEqualToSelfModelValue( f441_arg0, f441_arg1, f441_arg2, f441_arg3 )
	if not f441_arg0:getModel() then
		return false
	else
		local f441_local0 = Engine.GetModel( Engine.GetModelForController( f441_arg1 ), f441_arg2 )
		if not f441_local0 then
			return false
		else
			local f441_local1 = Engine.GetModel( f441_arg0:getModel(), f441_arg3 )
			if not f441_local1 then
				return false
			else
				return Engine.GetModelValue( f441_local0 ) == Engine.GetModelValue( f441_local1 )
			end
		end
	end
end

function IsGlobalModelValueEqualToSelfModelValue( f442_arg0, f442_arg1, f442_arg2, f442_arg3 )
	if not f442_arg0:getModel() then
		return false
	else
		local f442_local0 = Engine.GetModel( Engine.GetGlobalModel(), f442_arg2 )
		if not f442_local0 then
			return false
		else
			local f442_local1 = Engine.GetModel( f442_arg0:getModel(), f442_arg3 )
			if not f442_local1 then
				return false
			else
				return Engine.GetModelValue( f442_local0 ) == Engine.GetModelValue( f442_local1 )
			end
		end
	end
end

function IsSelfModelValueNil( f443_arg0, f443_arg1, f443_arg2 )
	local f443_local0 = f443_arg0:getModel()
	if f443_arg2 ~= "" and f443_local0 then
		f443_local0 = Engine.GetModel( f443_local0, f443_arg2 )
	end
	return f443_local0 == nil
end

function IsSelfModelValueNilOrZero( f444_arg0, f444_arg1, f444_arg2 )
	local f444_local0 = f444_arg0:getModel()
	if f444_arg2 ~= "" and f444_local0 then
		f444_local0 = Engine.GetModel( f444_local0, f444_arg2 )
	end
	local f444_local1
	if f444_local0 ~= nil and (f444_local0 and Engine.GetModelValue( f444_local0 )) ~= 0 then
		f444_local1 = false
	else
		f444_local1 = true
	end
	return f444_local1
end

function IsSelfModelValueNonEmptyString( f445_arg0, f445_arg1, f445_arg2 )
	local f445_local0 = f445_arg0:getModel()
	if f445_arg2 ~= "" and f445_local0 then
		f445_local0 = Engine.GetModel( f445_local0, f445_arg2 )
	end
	local f445_local1 = f445_local0 and Engine.GetModelValue( f445_local0 )
	local f445_local2
	if f445_local1 == nil or f445_local1 == "" then
		f445_local2 = false
	else
		f445_local2 = true
	end
	return f445_local2
end

function IsSelfModelValueTrue( f446_arg0, f446_arg1, f446_arg2 )
	local f446_local0 = f446_arg0:getModel()
	if f446_arg2 ~= "" and f446_local0 then
		f446_local0 = Engine.GetModel( f446_local0, f446_arg2 )
	end
	local f446_local1 = f446_local0 and Engine.GetModelValue( f446_local0 )
	local f446_local2
	if f446_local1 == nil or f446_local1 ~= true then
		f446_local2 = false
	else
		f446_local2 = true
	end
	return f446_local2
end

function IsSelfEnumModelValueTrue( f447_arg0, f447_arg1, f447_arg2 )
	local f447_local0 = f447_arg0:getModel()
	if f447_arg2 ~= "" and f447_local0 then
		f447_local0 = Engine.GetModel( f447_local0, f447_arg2 )
	end
	local f447_local1 = f447_local0 and Engine.GetModelValue( f447_local0 )
	local f447_local2
	if f447_local1 == nil or f447_local1 ~= true then
		f447_local2 = false
	else
		f447_local2 = true
	end
	return f447_local2
end

function IsSelfModelValueGreaterThan( f448_arg0, f448_arg1, f448_arg2, f448_arg3 )
	local f448_local0 = f448_arg0:getModel()
	if f448_arg2 ~= "" and f448_local0 then
		f448_local0 = Engine.GetModel( f448_local0, f448_arg2 )
	end
	local f448_local1 = f448_local0 and Engine.GetModelValue( f448_local0 )
	local f448_local2
	if f448_local1 == nil or f448_arg3 >= f448_local1 then
		f448_local2 = false
	else
		f448_local2 = true
	end
	return f448_local2
end

function IsSelfModelValueLessThan( f449_arg0, f449_arg1, f449_arg2, f449_arg3 )
	local f449_local0 = f449_arg0:getModel()
	if f449_arg2 ~= "" and f449_local0 then
		f449_local0 = Engine.GetModel( f449_local0, f449_arg2 )
	end
	local f449_local1 = f449_local0 and Engine.GetModelValue( f449_local0 )
	local f449_local2
	if f449_local1 == nil or f449_local1 >= f449_arg3 then
		f449_local2 = false
	else
		f449_local2 = true
	end
	return f449_local2
end

function IsSelfModelValueGreaterThanOrEqualTo( f450_arg0, f450_arg1, f450_arg2, f450_arg3 )
	local f450_local0 = f450_arg0:getModel()
	if f450_arg2 ~= "" and f450_local0 then
		f450_local0 = Engine.GetModel( f450_local0, f450_arg2 )
	end
	local f450_local1 = f450_local0 and Engine.GetModelValue( f450_local0 )
	local f450_local2
	if f450_local1 == nil or f450_arg3 > f450_local1 then
		f450_local2 = false
	else
		f450_local2 = true
	end
	return f450_local2
end

function IsSelfModelValueLessThanOrEqualTo( f451_arg0, f451_arg1, f451_arg2, f451_arg3 )
	local f451_local0 = f451_arg0:getModel()
	if f451_arg2 ~= "" and f451_local0 then
		f451_local0 = Engine.GetModel( f451_local0, f451_arg2 )
	end
	local f451_local1 = f451_local0 and Engine.GetModelValue( f451_local0 )
	local f451_local2
	if f451_local1 == nil or f451_local1 > f451_arg3 then
		f451_local2 = false
	else
		f451_local2 = true
	end
	return f451_local2
end

function IsSelfModelValueEqualTo( f452_arg0, f452_arg1, f452_arg2, f452_arg3 )
	local f452_local0 = f452_arg0:getModel()
	if f452_arg2 ~= "" and f452_local0 then
		f452_local0 = Engine.GetModel( f452_local0, f452_arg2 )
	end
	local f452_local1 = f452_local0 and Engine.GetModelValue( f452_local0 )
	local f452_local2
	if f452_local1 == nil or f452_local1 ~= f452_arg3 then
		f452_local2 = false
	else
		f452_local2 = true
	end
	return f452_local2
end

function IsSelfModelValueEqualToEnum( f453_arg0, f453_arg1, f453_arg2, f453_arg3 )
	local f453_local0 = f453_arg0:getModel()
	if f453_arg2 ~= "" and f453_local0 then
		f453_local0 = Engine.GetModel( f453_local0, f453_arg2 )
	end
	local f453_local1 = f453_local0 and Engine.GetModelValue( f453_local0 )
	local f453_local2
	if f453_local1 == nil or f453_local1 ~= f453_arg3 then
		f453_local2 = false
	else
		f453_local2 = true
	end
	return f453_local2
end

function IsSelfModelValueEqualToEnumOrSelfModelNil( f454_arg0, f454_arg1, f454_arg2, f454_arg3 )
	if f454_arg0:getModel() == nil then
		return true
	else
		return IsSelfModelValueEqualToEnum( f454_arg0, f454_arg1, f454_arg2, f454_arg3 )
	end
end

function IsGlobalModelValueNonEmptyString( f455_arg0, f455_arg1, f455_arg2 )
	local f455_local0 = Engine.GetModel( Engine.GetGlobalModel(), f455_arg2 )
	local f455_local1 = f455_local0 and Engine.GetModelValue( f455_local0 )
	local f455_local2
	if f455_local1 == nil or f455_local1 == "" then
		f455_local2 = false
	else
		f455_local2 = true
	end
	return f455_local2
end

function IsGlobalModelValueTrue( f456_arg0, f456_arg1, f456_arg2 )
	local f456_local0 = Engine.GetModel( Engine.GetGlobalModel(), f456_arg2 )
	local f456_local1 = f456_local0 and Engine.GetModelValue( f456_local0 )
	local f456_local2
	if f456_local1 == nil or f456_local1 ~= true then
		f456_local2 = false
	else
		f456_local2 = true
	end
	return f456_local2
end

function IsGlobalModelValueEqualTo( f457_arg0, f457_arg1, f457_arg2, f457_arg3 )
	local f457_local0 = Engine.GetModel( Engine.GetGlobalModel(), f457_arg2 )
	local f457_local1 = f457_local0 and Engine.GetModelValue( f457_local0 )
	local f457_local2
	if f457_local1 == nil or f457_local1 ~= f457_arg3 then
		f457_local2 = false
	else
		f457_local2 = true
	end
	return f457_local2
end

function IsGlobalModelValueEqualToEnum( f458_arg0, f458_arg1, f458_arg2, f458_arg3 )
	local f458_local0 = Engine.GetModel( Engine.GetGlobalModel(), f458_arg2 )
	local f458_local1 = f458_local0 and Engine.GetModelValue( f458_local0 )
	local f458_local2
	if f458_local1 == nil or f458_local1 ~= f458_arg3 then
		f458_local2 = false
	else
		f458_local2 = true
	end
	return f458_local2
end

function IsGlobalModelValueGreaterThan( f459_arg0, f459_arg1, f459_arg2 )
	local f459_local0 = Engine.GetModel( Engine.GetGlobalModel(), f459_arg1 )
	local f459_local1 = f459_local0 and Engine.GetModelValue( f459_local0 )
	local f459_local2
	if f459_local1 == nil or f459_arg2 >= tonumber( f459_local1 ) then
		f459_local2 = false
	else
		f459_local2 = true
	end
	return f459_local2
end

function IsSelfModelValueEnumBitSet( f460_arg0, f460_arg1, f460_arg2, f460_arg3 )
	local f460_local0 = f460_arg0:getModel()
	if f460_arg2 ~= "" and f460_local0 then
		f460_local0 = Engine.GetModel( f460_local0, f460_arg2 )
	end
	local f460_local1 = f460_local0 and Engine.GetModelValue( f460_local0 )
	local f460_local2
	if f460_local1 ~= nil then
		f460_local2 = CoD.BitUtility.IsBitSet( f460_local1, f460_arg3 )
	else
		f460_local2 = false
	end
	return f460_local2
end

function IsSelfModelValueMyXuid( f461_arg0, f461_arg1, f461_arg2 )
	local f461_local0 = f461_arg0:getModel()
	if f461_local0 then
		f461_local0 = Engine.GetModel( f461_local0, f461_arg2 )
	end
	local f461_local1 = f461_local0 and Engine.GetModelValue( f461_local0 )
	local f461_local2
	if f461_local1 == nil or f461_local1 ~= Engine.GetXUID64( f461_arg1 ) then
		f461_local2 = false
	else
		f461_local2 = true
	end
	return f461_local2
end

function IsPrimaryButton( f462_arg0 )
	local f462_local0
	if f462_arg0.button == "primary" then
		f462_local0 = f462_arg0.down
	else
		f462_local0 = false
	end
	return f462_local0
end

function IsDpadButton( f463_arg0 )
	local f463_local0 = f463_arg0 and Engine.GetModelValue( f463_arg0 )
	local f463_local1
	if f463_local0 ~= nil then
		f463_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f463_local0, Enum.LUIButtonFlags.FLAG_DPAD )
	else
		f463_local1 = true
	end
	return f463_local1
end

function IsRepeatButtonPress( f464_arg0 )
	local f464_local0 = f464_arg0 and Engine.GetModelValue( f464_arg0 )
	local f464_local1
	if f464_local0 ~= nil then
		f464_local1 = CoD.BitUtility.IsBitwiseAndNonZero( f464_local0, Enum.LUIButtonFlags.FLAG_ISREPEAT )
	else
		f464_local1 = false
	end
	return f464_local1
end

function IsPartyLeaderStatusVisible()
	local f465_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f465_local0 then
		local f465_local1 = LobbyData:UITargetFromId( f465_local0 )
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and f465_local1.id == LobbyData.UITargets.UI_MODESELECT.id then
			return false
		elseif f465_local1.isAdvertised then
			return false
		else
			return true
		end
	else
		return false
	end
end

function IsLobbyStatusVisible()
	local f466_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f466_local0 then
		local f466_local1 = LobbyData:UITargetFromId( f466_local0 )
		if f466_local1.isAdvertised then
			return true
		end
	end
	return false
end

function IsPartyPrivacyVisible()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		local f467_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
		if f467_local0 then
			local f467_local1 = LobbyData:UITargetFromId( f467_local0 )
			if f467_local1.isAdvertised == true then
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
	local f468_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f468_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local f468_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" ) )
	if f468_local0 == f468_local1 or f468_local1 == 1 then
		return true
	else
		return false
	end
end

function IsPlayerLimitAtMax()
	local f469_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f469_local0.maxClients <= Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" ) ) then
		return true
	else
		return false
	end
end

function HasNumHessActive( f470_arg0, f470_arg1 )
	local f470_local0 = 0
	local f470_local1 = Engine.GetModel( Engine.GetModelForController( f470_arg0 ), "hudItems.hess1.type" )
	if f470_local1 ~= nil and Engine.GetModelValue( f470_local1 ) ~= 0 then
		f470_local0 = 1
	end
	local f470_local2 = Engine.GetModel( Engine.GetModelForController( f470_arg0 ), "hudItems.hess2.type" )
	if f470_local2 ~= nil and Engine.GetModelValue( f470_local2 ) ~= 0 then
		f470_local0 = f470_local0 + 1
	end
	return f470_local0 == f470_arg1
end

function AreKillstreaksEnabled()
	return Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1
end

local f0_local8 = function ()
	local f472_local0 = Engine.LobbyGetDemoInformation()
	if f472_local0 and f472_local0.fileID ~= Engine.DefaultID64Value() then
		return true
	else
		return false
	end
end

local f0_local9 = function ()
	local f473_local0 = Engine.LobbyGetDemoInformation()
	if f473_local0 and f473_local0.readyForPlayback then
		return true
	else
		return false
	end
end

function IsStartFilmButtonDisabled()
	if not f0_local8() then
		return true
	elseif not f0_local9() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsCreateHighlightReelButtonDisabled()
	if not f0_local8() then
		return true
	elseif not f0_local9() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsShoutcastFilmButtonDisabled()
	if not f0_local8() then
		return true
	elseif not f0_local9() then
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

function IsDollyCameraPictureWindowVisible( f482_arg0 )
	if not Engine.IsDemoPlaying() then
		return false
	elseif Engine.IsVisibilityBitSet( f482_arg0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) then
		return false
	elseif not Engine.IsDemoCameraEditMode() then
		return false
	elseif Engine.GetDollyCamMarkerCount() <= 0 then
		return false
	elseif Engine.IsDemoClipPreviewRunning() then
		return false
	else
		return true
	end
end

function IsSegmentInSelectedState( f483_arg0, f483_arg1 )
	local f483_local0 = GetSelectedSegmentModel()
	if f483_local0 and f483_local0 == f483_arg0:getModel() then
		local f483_local1 = Engine.GetModel( f483_local0, "selected" )
		if f483_local1 then
			return Engine.GetModelValue( f483_local1 )
		end
	end
	return false
end

function IsSegmentSelectedForMove( f484_arg0, f484_arg1 )
	return GetSelectedSegmentModel() ~= nil
end

function IsInTheaterMode()
	if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
		return true
	else
		return false
	end
end

function HideVehicleReticle( f486_arg0, f486_arg1, f486_arg2 )
	local f486_local0 = nil
	if f486_arg2.modelName == "vehicleType" then
		f486_local0 = f486_arg2.modelValue
	end
	if not f486_local0 then
		local f486_local1 = f486_arg0:getModel( f486_arg1, "vehicleType" )
		if f486_local1 then
			f486_local0 = Engine.GetModelValue( f486_local1 )
		end
	end
	return f486_local0 == "spawner_enemy_54i_vehicle_raps_suicide_player"
end

function VehicleHasEnemyLock( f487_arg0, f487_arg1 )
	local f487_local0 = IsSelfEnumModelValueTrue( f487_arg0, f487_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP )
	if not f487_local0 then
		f487_local0 = IsSelfEnumModelValueTrue( f487_arg0, f487_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN )
		if not f487_local0 then
			f487_local0 = IsSelfEnumModelValueTrue( f487_arg0, f487_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT )
			if not f487_local0 then
				f487_local0 = IsSelfEnumModelValueTrue( f487_arg0, f487_arg1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT )
			end
		end
	end
	return f487_local0
end

function IsSelfPlayerName( f488_arg0, f488_arg1 )
	local f488_local0 = f488_arg0:getModel( f488_arg1, "isSelfPlayerName" )
	local f488_local1 = false
	if f488_local0 then
		f488_local1 = Engine.GetModelValue( f488_local0 )
	end
	return f488_local1
end

function ShouldDisplayFactionIconAtPrematchCountdown()
	return CoD.IsGametypeTeamBased()
end

function MapVoteInState( f490_arg0 )
	local f490_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if f490_local0 == nil then
		return false
	end
	local f490_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if f490_local1 then
		local f490_local2 = LobbyData:UITargetFromId( f490_local1 )
		if f490_local2.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
			return false
		end
	end
	return tonumber( f490_arg0 ) == Engine.GetModelValue( f490_local0 )
end

function MapVoteTimerActive()
	local f491_local0 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f491_local0 == nil then
		return false
	end
	local f491_local1 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f491_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.TESTING then
		return false
	end
	local f491_local2 = Engine.GetModelValue( f491_local0 )
	local f491_local3
	if f491_local2 == nil or f491_local2 == 0 then
		f491_local3 = false
	else
		f491_local3 = true
	end
	return f491_local3
end

function IsScorestreakEquipped( f492_arg0, f492_arg1, f492_arg2 )
	local f492_local0 = f492_arg1:getModel( f492_arg2, "itemIndex" )
	if f492_local0 then
		local f492_local1 = Engine.GetModelValue( f492_local0 )
		if f492_local1 ~= CoD.CACUtility.EmptyItemIndex then
			return CoD.CACUtility.GetAttachedItemSlot( f492_arg0:getModel(), f492_local1, CoD.CACUtility.KillstreakNameList ) ~= nil
		end
	end
	return false
end

function IsValidScorestreakIndex( f493_arg0, f493_arg1 )
	local f493_local0 = f493_arg0:getModel( f493_arg1, "itemIndex" )
	if f493_local0 then
		return Engine.GetModelValue( f493_local0 ) ~= CoD.CACUtility.EmptyItemIndex
	else
		return false
	end
end

function IsGamepad( f494_arg0 )
	return CoD.useController and Engine.LastInput_Gamepad()
end

function IsMouse( f495_arg0 )
	return CoD.useMouse and Engine.LastInput_Mouse()
end

function IsDurangoGamepad( f496_arg0 )
	local f496_local0 = IsDurango()
	if not f496_local0 then
		f496_local0 = IsPC()
		if f496_local0 then
			f496_local0 = Engine.GamepadType( 0 ) == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO
		end
	end
	return f496_local0
end

function IsOrbisGamepad( f497_arg0 )
	local f497_local0 = IsOrbis()
	if not f497_local0 then
		f497_local0 = IsPC()
		if f497_local0 then
			f497_local0 = Engine.GamepadType( 0 ) == Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS
		end
	end
	return f497_local0
end

function AutomaticallyOpenAAR( f498_arg0 )
	local f498_local0 = CoD.GetPlayerStats( f498_arg0 )
	if f498_local0.AfterActionReportStats.lobbyPopup:get() == "summary" then
		return true
	else
		
	end
end

function IsAARValid( f499_arg0 )
	if Engine.IsMultiplayerGame() then
		if CoD.AARUtility.UseTestData() then
			return true
		else
			local f499_local0 = CoD.GetPlayerStats( f499_arg0 )
			if f499_local0.AfterActionReportStats.lobbyPopup:get() == "summary" then
				return true
			else
				f499_local0 = Engine.GetModel( Engine.GetModelForController( f499_arg0 ), "aarType" )
				if f499_local0 then
					local f499_local1 = Engine.GetModelValue( f499_local0 )
					local f499_local2
					if (not IsLAN() or f499_local1 ~= "lan") and (IsLAN() or f499_local1 ~= "custom" and f499_local1 ~= "public") then
						f499_local2 = false
					else
						f499_local2 = true
					end
					return f499_local2
				else
					
				end
			end
		end
	else
		return true
	end
end

function CanShowAAR( f500_arg0 )
	local f500_local0 = Engine.IsMultiplayerGame()
	local f500_local1 = Engine.IsZombiesGame()
	if not f500_local0 then
		local f500_local2 = f500_local1
	end
	local f500_local3 = CoD.AARUtility.UseTestData()
	if not f500_local3 then
		f500_local3 = f500_local2 and Engine.IsStableStatsBufferInitialized( f500_arg0 )
	end
	return f500_local3
end

function HasFriends( f501_arg0 )
	return Engine.GetFriendsCount( f501_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function HasRecentPlayers( f502_arg0 )
	return Engine.GetRecentPlayersCount( f502_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ALL ) > 0
end

function IsSocialPlayersListEmpty( f503_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
	if modelValue ~= nil then
		if modelValue == "friends" then
			return HasFriends( f503_arg0 )
		elseif modelValue == "recent" then
			return HasRecentPlayers( f503_arg0 )
		end
	end
	return false
end

function IsOffline( f504_arg0, f504_arg1 )
	local f504_local0 = f504_arg0:getModel( f504_arg1, "activity" )
	if f504_local0 then
		local f504_local1 = Engine.GetModelValue( f504_local0 )
	elseif value == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return true
	end
	return false
end

function IsInTitle( f505_arg0, f505_arg1 )
	local f505_local0 = f505_arg0:getModel( f505_arg1, "activity" )
	if f505_local0 then
		local f505_local1 = Engine.GetModelValue( f505_local0 )
		if f505_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
			return false
		elseif f505_local1 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
			return false
		end
	end
	return true
end

function IsJoinable( f506_arg0, f506_arg1 )
	local f506_local0 = f506_arg0:getModel( f506_arg1, "joinable" )
	if f506_local0 then
		local f506_local1 = Engine.GetModelValue( f506_local0 )
		if f506_local1 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES then
			return true
		elseif f506_local1 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
			local f506_local2 = f506_arg0:getModel( f506_arg1, "friend" )
			if f506_local2 and Engine.GetModelValue( f506_local2 ) then
				return true
			end
		end
	end
	return false
end

function IsUserContentRestricted( f507_arg0 )
	return Engine.IsUserContentRestricted( f507_arg0 )
end

function IsSocialPartyLeader( f508_arg0, f508_arg1 )
	local f508_local0 = f508_arg0:getModel( f508_arg1, "leader" )
	if (f508_local0 and Engine.GetModelValue( f508_local0 )) == 1 then
		return true
	else
		return false
	end
end

function HideWinnersLabelsAndInfo( f509_arg0 )
	local f509_local0 = Engine.GetModel( Engine.GetModelForController( f509_arg0 ), "gameScore.draw" )
	local f509_local1 = Engine.GetGametypeSetting( "teamCount" ) < 2
	if f509_local0 then
		f509_local0 = Engine.GetModelValue( f509_local0 )
	end
	if f509_local0 or f509_local1 then
		return true
	else
		
	end
end

function IsOutcomeVictory( f510_arg0 )
	local f510_local0 = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f510_local1 = f510_local0 and Engine.GetModelValue( f510_local0 )
	local f510_local2 = Engine.GetModel( perControllerModel, "gameScore.victory" )
	local f510_local3 = f510_local2 and Engine.GetModelValue( f510_local2 )
	local f510_local4
	if not f510_local1 then
		f510_local4 = f510_local3
	else
		f510_local4 = false
	end
	return f510_local4
end

function IsOutcomeDefeat( f511_arg0 )
	local f511_local0 = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f511_local1 = f511_local0 and Engine.GetModelValue( f511_local0 )
	local f511_local2 = Engine.GetModel( perControllerModel, "gameScore.defeat" )
	local f511_local3 = f511_local2 and Engine.GetModelValue( f511_local2 )
	local f511_local4
	if not f511_local1 then
		f511_local4 = f511_local3
	else
		f511_local4 = false
	end
	return f511_local4
end

function IsScoreboardPingAsBars( f512_arg0, f512_arg1 )
	return Dvar.cg_ScoresPing_Interval:get() > 1
end

function ScoreboardVisible( f513_arg0 )
	local f513_local0 = Engine.IsVisibilityBitSet( f513_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f513_local0 then
		f513_local0 = IsModelValueEqualTo( f513_arg0, "forceScoreboard", 1 )
	end
	return f513_local0
end

function IsScoreboardPlayerMuted( f514_arg0, f514_arg1 )
	return Engine.IsPlayerMutedByClientNum( f514_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, CoD.SafeGetModelValue( f514_arg1:getModel(), "clientNum" ) )
end

function ScoreboardMuteButtonPromptHidden( f515_arg0 )
	if not ScoreboardVisible( f515_arg0 ) then
		return true
	elseif CoD.IsShoutcaster( f515_arg0 ) then
		return true
	else
		local f515_local0 = Engine.GetModel( Engine.GetModelForController( f515_arg0 ), "scoreboardInfo.muteButtonPromptVisible" )
		if f515_local0 and not Engine.GetModelValue( f515_local0 ) then
			return true
		else
			
		end
	end
end

function ScoreboardCanShowGamerCard( f516_arg0, f516_arg1 )
	if not CoD.isDurango then
		return false
	else
		return CoD.SafeGetModelValue( f516_arg0:getModel(), "clientNum" ) >= 0
	end
end

function IsScoreboardPlayerSelf( f517_arg0, f517_arg1 )
	local f517_local0 = f517_arg0:getModel( f517_arg1, "clientNum" )
	if f517_local0 then
		if CoD.IsShoutcaster( f517_arg1 ) then
			return Engine.GetPredictedClientNum( f517_arg1 ) == Engine.GetModelValue( f517_local0 )
		elseif CoD.isPC then
			local f517_local1 = Engine.GetClientNum( f517_arg1 )
			local f517_local2 = f517_local1
			local f517_local3
			if f517_local1 < 0 or f517_local1 ~= Engine.GetModelValue( f517_local0 ) then
				f517_local3 = false
			else
				f517_local3 = f517_local2 and true
			end
			return f517_local3
		else
			return string.gsub( GetScoreboardPlayerName( f517_arg1, Engine.GetModelValue( f517_local0 ) ), "%[.+%]", "" ) == Engine.GetSelfGamertag( f517_arg1 )
		end
	else
		return false
	end
end

function ShowMatchBonus( f518_arg0, f518_arg1 )
	local f518_local0 = Engine.GetModelForController( f518_arg1 )
	local f518_local1 = Engine.GetModel( f518_local0, "gameScore.isRoundEnd" )
	local f518_local2 = Engine.GetModel( f518_local0, "gameScore.matchBonus" )
	local f518_local3 = 0
	if f518_local2 then
		f518_local3 = Engine.GetModelValue( f518_local2 )
	end
	local f518_local4
	if (f518_local1 and Engine.GetModelValue( f518_local1 )) or f518_local3 == 0 then
		f518_local4 = false
	else
		f518_local4 = true
	end
	return f518_local4
end

function IsVictory( f519_arg0 )
	local f519_local0 = Engine.GetModelForController( f519_arg0 )
	local f519_local1 = Engine.GetModel( f519_local0, "gameScore.isRoundEnd" )
	local f519_local2 = f519_local1 and Engine.GetModelValue( f519_local1 )
	local f519_local3 = Engine.GetModel( f519_local0, "gameScore.victory" )
	local f519_local4 = f519_local3 and Engine.GetModelValue( f519_local3 )
	local f519_local5
	if not f519_local2 then
		f519_local5 = f519_local4
	else
		f519_local5 = false
	end
	return f519_local5
end

function IsDefeat( f520_arg0 )
	local f520_local0 = Engine.GetModelForController( f520_arg0 )
	local f520_local1 = Engine.GetModel( f520_local0, "gameScore.isRoundEnd" )
	local f520_local2 = f520_local1 and Engine.GetModelValue( f520_local1 )
	local f520_local3 = Engine.GetModel( f520_local0, "gameScore.defeat" )
	local f520_local4 = f520_local3 and Engine.GetModelValue( f520_local3 )
	local f520_local5
	if not f520_local2 then
		f520_local5 = f520_local4
	else
		f520_local5 = false
	end
	return f520_local5
end

function IsStarterPack( f521_arg0 )
	return CoD.isPC and Engine.IsStarterPack()
end

function IsFreeRunPreStart( f522_arg0 )
	local f522_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f522_arg0 ), "FreeRun" ), "runState" )
	local f522_local1 = false
	if Engine.GetModelValue( f522_local0 ) == 0 then
		f522_local1 = true
	end
	return f522_local1
end

function IsFreeRunPreStarted( f523_arg0 )
	local f523_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f523_arg0 ), "FreeRun" ), "runState" )
	local f523_local1 = false
	if Engine.GetModelValue( f523_local0 ) == 1 then
		f523_local1 = true
	end
	return f523_local1
end

function IsFreeRunFinished( f524_arg0 )
	local f524_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f524_arg0 ), "FreeRun" ), "runState" )
	local f524_local1 = false
	if Engine.GetModelValue( f524_local0 ) == 2 then
		f524_local1 = true
	end
	return f524_local1
end

function ShouldShowPartyPrivacy( f525_arg0 )
	local f525_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f525_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f525_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f525_local1 and f525_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f525_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f525_local2 ) then
		return false
	else
		return true
	end
end

function ShouldShowLeaveParty( f526_arg0 )
	local f526_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f526_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f526_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f526_local1 and f526_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f526_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f526_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, f526_local2 )
	if #f526_local3.sessionClients == 1 then
		return false
	end
	local f526_local4 = 0
	for f526_local8, f526_local9 in ipairs( f526_local3.sessionClients ) do
		if f526_local9.isLocal == true then
			f526_local4 = f526_local4 + 1
		end
	end
	if f526_local4 == #f526_local3.sessionClients then
		return false
	end
	return true
end

function ShouldShowPromotePlayer( f527_arg0 )
	local f527_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f527_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f527_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f527_local1 and f527_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f527_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f527_local2 ) then
		return false
	end
	local f527_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f527_local2 )
	if #f527_local3.sessionClients == 1 then
		return false
	end
	local f527_local4 = 0
	for f527_local8, f527_local9 in ipairs( f527_local3.sessionClients ) do
		if f527_local9.isLocal == true then
			f527_local4 = f527_local4 + 1
		end
	end
	if f527_local4 == #f527_local3.sessionClients then
		return false
	end
	return true
end

function ShouldShowBootPlayer( f528_arg0 )
	local f528_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f528_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f528_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f528_local1 and f528_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f528_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( f528_local2 ) then
		return false
	end
	local f528_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f528_local2 )
	if #f528_local3.sessionClients == 1 then
		return false
	end
	local f528_local4 = 0
	for f528_local8, f528_local9 in ipairs( f528_local3.sessionClients ) do
		if f528_local9.isLocal == true then
			f528_local4 = f528_local4 + 1
		end
	end
	if f528_local4 == #f528_local3.sessionClients then
		return false
	end
	return true
end

function IsBleedOutVisible( f529_arg0, f529_arg1 )
	local f529_local0 = f529_arg0:getModel( f529_arg1, "stateFlags" )
	if f529_local0 then
		local f529_local1 = Engine.GetModelValue( f529_local0 )
		if f529_local1 ~= nil then
			return CoD.BitUtility.IsAnyBitSet( f529_local1, {
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT,
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED
			} )
		end
	end
	return false
end

function DropDownListIsInUse( f530_arg0 )
	return f530_arg0.inUse
end

function CheckBoxOptionChecked( f531_arg0, f531_arg1 )
	local f531_local0 = nil
	if f531_arg1.menu then
		f531_local0 = f531_arg1.menu.m_ownerController
	else
		f531_local0 = f531_arg1.controller
	end
	local f531_local1 = f531_arg0:getModel()
	if f531_local1 then
		local f531_local2 = CoD.PCUtil.GetOptionInfo( f531_local1, f531_local0 )
		if type( f531_local2.currentValue ) == "number" then
			return math.abs( f531_local2.currentValue - f531_local2.highValue ) < 0.01
		elseif type( f531_local2.currentValue ) == "string" then
			return f531_local2.currentValue == f531_local2.highValue
		end
	end
	return false
end

function MouseButtonEnabled( f532_arg0 )
	return f532_arg0.handleMouseButton ~= false
end

function ShouldOpenGraphicsConfirm( f533_arg0, f533_arg1, f533_arg2 )
	return CoD.PCUtil.IsOptionsDirty( f533_arg2 )
end

function ShouldHideButtonPromptForPC( f534_arg0, f534_arg1 )
	if CoD.isPC then
		local f534_local0 = CoD.PCUtil.GetElementModelValues( f534_arg0, {
			"Button",
			"Label"
		} )
		if f534_local0 and f534_local0.Label == "MENU_SELECT" and f534_local0.Button == Enum.LUIButton.LUI_KEY_XBA_PSCROSS then
			f534_arg0:setState( "dummy" )
			return true
		end
	end
	return false
end

function ShouldHideForPCBeta( f535_arg0, f535_arg1 )
	if CoD.isPC then
		return Dvar.ui_execdemo_beta:get()
	else
		return false
	end
end

function DropdownListIsInUse_Console( f536_arg0 )
	return f536_arg0.inUse
end

function ShouldShowMOTD( f537_arg0 )
	return Engine.ShouldShowMOTD( f537_arg0 )
end

function ShouldShowMtxCommsMOTD( f538_arg0 )
	if Dvar.ui_execdemo_beta:get() then
		return 
	elseif Engine.GetMarketingMessage( f538_arg0, "motd" ) ~= nil then
		return true
	else
		return false
	end
end

function ShouldShowMtxCommsMOTDPopup( f539_arg0 )
	if Dvar.ui_execdemo_beta:get() and IsFirstTimeSetup( f539_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
		return false
	else
		local f539_local0 = Engine.GetMarketingMessage( f539_arg0, "motd" )
		if f539_local0 ~= nil and f539_local0.messageViewReported ~= true then
			return true
		else
			return false
		end
	end
end

function FeaturedWidgetVisible( f540_arg0 )
	local f540_local0 = IsMainModeInvalidAndNotTheaterMode()
	if f540_local0 then
		if not IsLAN() then
			f540_local0 = not ShouldShowMtxCommsMOTD( f540_arg0 )
		else
			f540_local0 = false
		end
	end
	return f540_local0
end

function FeaturedWidgetControllerVisible( f541_arg0 )
	local f541_local0 = Engine.GetFeaturedCardsData()
	if f541_local0 and f541_local0.validCardsCount >= 2 then
		return true
	else
		return false
	end
end

function IsBubbleGumBuffEquipped( f542_arg0, f542_arg1, f542_arg2 )
	local f542_local0 = f542_arg1:getModel()
	if not f542_local0 then
		return false
	end
	local f542_local1 = Engine.GetModel( f542_local0, "itemIndex" )
	if not f542_local1 then
		return false
	end
	local f542_local2 = Engine.GetModelValue( f542_local1 )
	local f542_local3 = Engine.GetEquippedBubbleGumPack( f542_arg2 )
	for f542_local4 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f542_arg2, f542_local3, f542_local4 ) == f542_local2 then
			return true
		end
	end
	return false
end

function HasBGBTokensRemaining( f543_arg0, f543_arg1 )
	if Engine.GetBGBTokensRemaining( f543_arg1 ) > 0 == false then
		return false
	else
		return Engine.GetModelValue( f543_arg0:getModel( f543_arg1, "price" ) ) <= Engine.GetBGBTokensRemaining( f543_arg1 )
	end
end

function HasStoreItems( f544_arg0 )
	return #Engine.GetStoreProductsByCategory( f544_arg0, "BETA" ) > 0
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
	local f549_local0
	if Dvar.ui_execdemo_beta:get() and Dvar.live_store_enable:exists() then
		f549_local0 = not Dvar.live_store_enable:get()
	else
		f549_local0 = true
	end
	return f549_local0
end

function DisableSteamStore()
	return not CoD.isPC
end

function ShouldOpenGraphicsAndSoundOptions()
	if IsDurango() then
		return true
	else
		local f551_local0
		if Dvar.ui_execdemo:get() then
			f551_local0 = Dvar.ui_execdemo:get()
			if f551_local0 then
				f551_local0 = Dvar.ui_execdemo_beta:get()
			end
		else
			f551_local0 = true
		end
	end
	return f551_local0
end

function ShouldOpenSocialOptions()
	if IsDurango() then
		return true
	else
		return not Dvar.ui_execdemo:get()
	end
end

function ShouldOpenMutingOptions()
	return not Dvar.ui_execdemo_gamescom:get()
end

function IsGamesComBuild()
	return LuaUtils.IsGamescomBuild()
end

function IsBetaBuild()
	return LuaUtils.IsBetaBuild()
end

function ShouldOpenNetworkOptions()
	return true
end

function IsBlackhatHacking( f557_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f557_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Hacking
end

function IsBlackhatBreaching( f558_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f558_arg0 ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Breaching
end

function IsBrightnessSliderPipEmpty( f559_arg0 )
	local f559_local0 = f559_arg0.gridInfoTable.zeroBasedIndex
	local f559_local1 = f559_arg0.gridInfoTable.parentGrid.activeWidget
	local f559_local2 = 0
	if f559_local1 then
		f559_local2 = f559_local1.gridInfoTable.zeroBasedIndex
	end
	if f559_local2 < f559_local0 then
		return true
	else
		
	end
end

function IsAlertOverlay( f560_arg0, f560_arg1 )
	local f560_local0 = f560_arg0:getModel( f560_arg1, "categoryType" )
	if f560_local0 then
		local f560_local1 = Engine.GetModelValue( f560_local0 )
		local f560_local2
		if f560_local1 ~= CoD.OverlayUtility.OverlayTypes.Alert and f560_local1 ~= CoD.OverlayUtility.OverlayTypes.Error then
			f560_local2 = false
		else
			f560_local2 = true
		end
		return f560_local2
	else
		return false
	end
end

function HasOverlayBackAction( f561_arg0 )
	return f561_arg0[CoD.OverlayUtility.GoBackPropertyName] ~= nil
end

function IsPrimaryControllerIndex( f562_arg0 )
	if Engine.GetPrimaryController() == f562_arg0 then
		return true
	else
		return false
	end
end

function IsTriggersFlipped( f563_arg0 )
	return Engine.GetProfileVarInt( f563_arg0, "flipped_control_config" ) == 1
end

function IsCodCasterQuickSettingEnabled( f564_arg0, f564_arg1, f564_arg2 )
	if not f564_arg1.profileVar then
		return false
	else
		return CoD.ShoutcasterProfileVarBool( f564_arg2, f564_arg1.profileVar )
	end
end

function IsCodCaster( f565_arg0 )
	if CoD.IsShoutcaster( f565_arg0 ) then
		return true
	else
		return false
	end
end

function IsCodCasterProfileValueEqualTo( f566_arg0, f566_arg1, f566_arg2 )
	local f566_local0 = CoD.ShoutcasterProfileVarValue( f566_arg0, f566_arg1 )
	local f566_local1
	if f566_local0 == nil or f566_local0 ~= f566_arg2 then
		f566_local1 = false
	else
		f566_local1 = true
	end
	return f566_local1
end

function ShouldPresentRegistration( f567_arg0 )
	if Engine.ShouldPresentRegistration then
		if Engine.ShouldPresentRegistration( f567_arg0 ) then
			local f567_local0 = Engine.GetRegistrationStatus( f567_arg0 )
			local f567_local1 = Engine.GetMarketingMessage( f567_arg0, "registration" )
			if f567_local1 == nil or f567_local1.messageViewReported == true then
				return false
			else
				local f567_local2 = f567_local1.action
				if f567_local2 == "registration" and f567_local0 == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_NEW_USER then
					return true
				elseif f567_local2 == "opt-in" and f567_local0 == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_OPTED_OUT then
					return true
				else
					return false
				end
			end
		else
			return false
		end
	else
		return false
	end
end

function ShouldPresentMOTDBanner( f568_arg0, f568_arg1 )
	local f568_local0 = false
	local f568_local1 = Engine.GetMarketingMessage( f568_arg0, "registration" )
	if f568_local1 ~= nil and f568_local1.messageViewReported == false then
		local f568_local2 = f568_local1.action
		if f568_local2 == "registration" or f568_local2 == "opt-in" then
			if Engine.ShouldPresentRegistration( f568_arg0 ) then
				local f568_local3 = Engine.GetRegistrationStatus( f568_arg0 )
				if f568_local2 == "registration" and f568_local3 == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_NEW_USER then
					return true
				elseif f568_local2 == "opt-in" and f568_local3 == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_OPTED_OUT then
					return true
				end
			end
		elseif f568_local2 == "store" then
			return true
		end
		f568_local0 = true
	end
	if ShouldShowMtxCommsMOTDPopup( f568_arg0 ) then
		local f568_local2 = Engine.GetMarketingMessage( f568_arg0, "motd" )
		if f568_local2 == nil or not f568_local2.hasBanner then
			return false
		elseif f568_local0 == true then
			local f568_local3 = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" )
			Engine.SetModelValue( Engine.GetModel( f568_local3, "content_short" ), f568_local2.bannerTitle )
			Engine.SetModelValue( Engine.GetModel( f568_local3, "action" ), f568_local2.bannerAction )
			Engine.SetModelValue( Engine.GetModel( f568_local3, "image" ), f568_local2.bannerImage )
			Engine.SetModelValue( Engine.GetModel( f568_local3, "action_title" ), f568_local2.bannerActionString )
			Engine.SetModelValue( Engine.GetModel( f568_local3, "locationID" ), 1 )
		end
		return true
	end
	return false
end

function FuseBoxVisible( f569_arg0, f569_arg1 )
	if CoD.Zombie[f569_arg1] then
		local f569_local0 = Engine.GetModel( Engine.GetModelForController( f569_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie[f569_arg1] )
		return f569_local0 and Engine.GetModelValue( f569_local0 ) == 1
	else
		
	end
end

function RocketShieldBlueprintPieceVisible( f570_arg0, f570_arg1 )
	if CoD.Zombie[f570_arg1] then
		local f570_local0 = Engine.GetModel( Engine.GetModelForController( f570_arg0 ), "zmInventory." .. CoD.Zombie[f570_arg1] )
		return f570_local0 and Engine.GetModelValue( f570_local0 ) == 1
	else
		
	end
end

function IDGunBlueprintPieceVisible( f571_arg0, f571_arg1 )
	if CoD.Zombie[f571_arg1] then
		local f571_local0 = Engine.GetModel( Engine.GetModelForController( f571_arg0 ), "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie[f571_arg1] )
		return f571_local0 and Engine.GetModelValue( f571_local0 ) == 1
	else
		
	end
end

function SummonningKeyVisible( f572_arg0 )
	local f572_local0 = Engine.GetModel( Engine.GetModelForController( f572_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY )
	return f572_local0 and Engine.GetModelValue( f572_local0 ) == 1
end

function IsRitualItemInState( f573_arg0, f573_arg1, f573_arg2 )
	if CoD.Zombie[f573_arg1] and CoD.Zombie[f573_arg2] then
		local f573_local0 = Engine.GetModel( Engine.GetModelForController( f573_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie[f573_arg1] )
		return f573_local0 and Engine.GetModelValue( f573_local0 ) == CoD.Zombie[f573_arg2]
	else
		
	end
end

function IsRitualItemHeldBy( f574_arg0, f574_arg1, f574_arg2 )
	if CoD.Zombie[f574_arg1] and CoD.Zombie[f574_arg2] then
		local f574_local0 = Engine.GetModel( Engine.GetModelForController( f574_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie[f574_arg1] )
		return f574_local0 and Engine.GetModelValue( f574_local0 ) == CoD.Zombie[f574_arg2]
	else
		
	end
end

function ChatClientIsChatting( f575_arg0 )
	return Engine.ChatClient_IsChatting( f575_arg0 )
end

function ChatClientIsAvailable( f576_arg0, f576_arg1, f576_arg2 )
	return ChatClientEnabled( f576_arg2 ) and Engine.ChatClient_IsAvailable( f576_arg2 )
end

function ChatClientEnabled( f577_arg0 )
	return CoD.isPC and Dvar.ui_execdemo_gamescom:get() == false
end

function ChatClientAnySubMenuOpen( f578_arg0 )
	if not ChatClientEnabled( f578_arg0 ) then
		return false
	end
	local f578_local0 = false
	local f578_local1 = CoD.ChatClientUtility.GetMenuInputChannelShowModel()
	if f578_local1 ~= nil then
		f578_local0 = Engine.GetModelValue( f578_local1 ) > 0
	end
	if not f578_local0 then
		f578_local1 = CoD.ChatClientUtility.GetMenuSettingsShowModel()
		if f578_local1 ~= nil then
			f578_local0 = Engine.GetModelValue( f578_local1 ) > 0
		end
	end
	return f578_local0
end

function CharacterCustomization_IsEnabled( f579_arg0 )
	if LuaUtils.IsGamescomBuild() or Dvar.ui_execdemo_beta:get() then
		return false
	else
		return true
	end
end

function IsArabicSku()
	return false
end

function IsChineseSku()
	return false
end

function IsJapaneseSku()
	return false
end

function IsCurrentLanguageEnglish()
	return true
end

function ShouldDisplayLanguageSelectionScreen()
	local f584_local0 = IsArabicSku()
	if not f584_local0 then
		f584_local0 = IsChineseSku()
		if not f584_local0 then
			f584_local0 = IsJapaneseSku()
		end
	end
	return f584_local0
end

function IsFeaturedCardButtonPressed( f585_arg0 )
	local f585_local0
	if f585_arg0.button == "alt1" then
		f585_local0 = f585_arg0.down
	else
		f585_local0 = false
	end
	return f585_local0
end

function FeaturedCards_IsEnabled( f586_arg0, f586_arg1 )
	if Dvar.live_featuredEnabled == nil or Dvar.live_featuredEnabled ~= nil and Dvar.live_featuredEnabled:get() == false then
		return false
	else
		local f586_local0 = Engine.GetFeaturedCardsData()
		if f586_local0 == nil or f586_local0.enabled == false then
			return false
		else
			return true
		end
	end
end

function FeaturedCards_Update( f587_arg0, f587_arg1 )
	return true
end

function ConnectionMeter_isEnabled( f588_arg0, f588_arg1 )
	if Dvar.ui_enableConnectionMetricGraphs:get() == 0 then
		return false
	else
		return true
	end
end

