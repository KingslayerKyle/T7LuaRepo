function GetMemberStatusFromElement( f1_arg0, f1_arg1 )
	return Engine.GetModelValue( f1_arg0:getModel( f1_arg1, "memberStatus" ) )
end

function GetMemberStatusFromModel( f2_arg0 )
	return Engine.GetModelValue( Engine.GetModel( f2_arg0, "memberStatus" ) )
end

function GetUpgradableItemRef( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = Engine.GetModel( f3_arg1:getModel(), "itemIndex" )
	if f3_local0 and Engine.GetModelValue( f3_local0 ) ~= 0 then
		local f3_local1 = Engine.GetModelValue( Engine.GetModel( f3_arg1:getModel(), "ref" ) )
		local f3_local2 = Engine.GetModelValue( Engine.GetModel( f3_arg1:getModel(), "weaponSlot" ) )
		if LUI.startswith( f3_local2, "cybercom_tacrig" ) or LUI.startswith( f3_local2, "cybercom_ability" ) then
			return f3_local1
		end
	end
end

function IsSeasonPassIncentiveExploitPossible( f4_arg0 )
	local f4_local0 = Engine.StorageGetBuffer( f4_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if AreCodPointsEnabled( f4_arg0 ) and f4_local0 then
		local f4_local1 = Dvar.enable_season_pass_incentive:get()
		if f4_local1 then
			f4_local1 = Dvar.enable_sp_exploit_check:get()
			if f4_local1 then
				f4_local1 = Engine.HasEntitlement( f4_arg0, "seasonpass" )
				if f4_local1 then
					if Engine.HasEntitlementByOwnership( f4_arg0, "seasonpass" ) or Engine.GetInventoryItemQuantity( f4_arg0, Dvar.season_pass_incentive_id:get() ) ~= 0 or f4_local0.spIncentiveExploitMsgSeen:get() ~= 0 then
						f4_local1 = false
					else
						f4_local1 = true
					end
				end
			end
		end
		return f4_local1
	else
		return false
	end
end

function ShouldShowSeasonPassIncentiveOverlay( f5_arg0 )
	local f5_local0 = Engine.StorageGetBuffer( f5_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f5_local0 then
		local f5_local1 = Dvar.enable_season_pass_incentive:get()
		if f5_local1 then
			if Engine.GetInventoryItemQuantity( f5_arg0, Dvar.season_pass_incentive_id:get() ) <= 0 or f5_local0.spIncentiveMsgSeen:get() ~= 0 then
				f5_local1 = false
			else
				f5_local1 = true
			end
		end
		return f5_local1
	else
		return false
	end
end

function ShouldShowDigitalIncentiveOverlay( f6_arg0 )
	local f6_local0 = Engine.StorageGetBuffer( f6_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if AreCodPointsEnabled( f6_arg0 ) and f6_local0 then
		local f6_local1 = Dvar.enable_digital_incentive:get()
		if f6_local1 then
			if Engine.GetInventoryItemQuantity( f6_arg0, Dvar.digital_incentive_id:get() ) <= 0 or f6_local0.digitalIncentiveMsgSeen:get() ~= 0 then
				f6_local1 = false
			else
				f6_local1 = true
			end
		end
		return f6_local1
	else
		return false
	end
end

function ShouldShowRetailIncentiveOverlay( f7_arg0 )
	local f7_local0 = Engine.StorageGetBuffer( f7_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if AreCodPointsEnabled( f7_arg0 ) and f7_local0 then
		local f7_local1 = Dvar.enable_retail_incentive:get()
		if f7_local1 then
			if Engine.GetInventoryItemQuantity( f7_arg0, Dvar.retail_incentive_id:get() ) <= 0 or f7_local0.retailIncentiveMsgSeen:get() ~= 0 then
				f7_local1 = false
			else
				f7_local1 = true
			end
		end
		return f7_local1
	else
		return false
	end
end

function ShouldShowInitialCodPointsOverlay( f8_arg0 )
	local f8_local0 = Engine.StorageGetBuffer( f8_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if AreCodPointsEnabled( f8_arg0 ) and f8_local0 then
		local f8_local1
		if Engine.GetInventoryItemQuantity( f8_arg0, Dvar.initial_cod_points_id:get() ) <= 0 or f8_local0.codPointMsgSeen:get() ~= 0 then
			f8_local1 = false
		else
			f8_local1 = true
		end
		return f8_local1
	else
		return false
	end
end

function IsItemAttachmentLocked( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	if 44 < f9_arg2 then
		if f9_arg4 ~= nil then
			local f9_local0 = f9_arg4
		end
		DebugPrint( "IsItemAttachmentLocked controller=" .. f9_arg0 .. " weaponIndex=" .. f9_arg1 .. " itemIndex=" .. f9_arg2 .. " debugID=" .. f9_arg3 .. " mode=" .. (f9_local0 or "") )
	end
	if f9_arg4 == nil then
		return Engine.IsItemAttachmentLocked( f9_arg0, f9_arg1, f9_arg2 )
	else
		return Engine.IsItemAttachmentLocked( f9_arg0, f9_arg1, f9_arg2, f9_arg4 )
	end
end

function IsCACItemLockedHelper( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = CoD.perController[f10_arg2].classModel
	local f10_local1 = CoD.perController[f10_arg2].weaponCategory
	local f10_local2 = nil
	local f10_local3 = f10_arg1.itemIndex
	local f10_local4 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f10_local3 then
		f10_local2 = f10_arg1:getModel( f10_arg2, "itemIndex" )
		if f10_local2 then
			f10_local3 = Engine.GetModelValue( f10_local2 )
		end
	end
	if f10_local3 then
		if not f10_local1 then
			f10_local1 = Engine.GetLoadoutSlotForItem( f10_local3, f10_local4 )
		end
		if f10_local0 and f10_local1 and (LUI.startswith( f10_local1, "primaryattachment" ) or LUI.startswith( f10_local1, "secondaryattachment" )) then
			local f10_local5 = "primary"
			if LUI.startswith( f10_local1, "secondaryattachment" ) then
				f10_local5 = "secondary"
			end
			local f10_local6 = Engine.GetModel( f10_local0, f10_local5 .. ".itemIndex" )
			if f10_local6 then
				return IsItemAttachmentLocked( f10_arg2, Engine.GetModelValue( f10_local6 ), f10_local3, "ICACILH", f10_local4 )
			end
		end
		if f10_local1 == "secondary" then
			local f10_local5 = Engine.GetItemRef( f10_local3 )
			if f10_local5 and CoD.ContractWeaponTiers[f10_local5] and not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f10_local5] ) then
				return true
			end
		end
		return Engine.IsItemLocked( f10_arg2, f10_local3, f10_local4 )
	else
		return false
	end
end

function GetWeaponSlotModel( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	if not f11_arg2 or not f11_arg3 then
		return nil
	else
		local f11_local0 = f11_arg1:getModel( f11_arg2, "weaponSlot" )
		if not f11_local0 then
			return nil
		else
			local f11_local1 = Engine.GetModelValue( f11_local0 )
			if not f11_local1 then
				return nil
			else
				return f11_local1
			end
		end
	end
end

function IsTakeTwoGadgetAttachmentForSlot( f12_arg0, f12_arg1, f12_arg2 )
	if f12_arg1 and f12_arg0 then
		local f12_local0 = Engine.GetModel( f12_arg1, "itemIndex" )
		local f12_local1 = Engine.GetModel( f12_arg0, f12_arg2 )
		if f12_local0 and f12_local1 then
			local f12_local2 = Engine.GetModel( f12_local1, "itemIndex" )
			if f12_local2 then
				local f12_local3 = Engine.GetModelValue( f12_local0 )
				local f12_local4 = Engine.GetModelValue( f12_local2 )
				if f12_local4 > CoD.CACUtility.EmptyItemIndex then
					return Engine.IsTakeTwoGadgetAttachment( f12_local4, f12_local3 )
				end
			end
		end
	end
	return false
end

function WeaponAttributeCompare( f13_arg0 )
	local f13_local0 = {}
	for f13_local4 in string.gmatch( f13_arg0, "[^,]+" ) do
		table.insert( f13_local0, tonumber( f13_local4 ) )
	end
	if #f13_local0 == 2 and f13_local0[1] < f13_local0[2] then
		return true
	else
		return false
	end
end

function IsWeaponLevelMax( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0
	if Engine.GetGunCurrentRank( f14_arg1, f14_arg0, f14_arg2 ) ~= Engine.GetGunNextRank( f14_arg1, f14_arg0, f14_arg2 ) or Engine.GetGunCurrentRankXP( f14_arg1, f14_arg0, f14_arg2 ) > CoD.CACUtility.GetCurrentWeaponXP( f14_arg1, f14_arg0, f14_arg2 ) then
		f14_local0 = false
	else
		f14_local0 = true
	end
	return f14_local0
end

function IsACVItemNewHelper( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	return Engine.IsACVItemNew( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
end

function GetNumberOfAttachmentsForSlot( f16_arg0, f16_arg1 )
	if not f16_arg1 then
		return 0
	end
	local f16_local0 = CoD.perController[f16_arg1].classModel
	if f16_local0 then
		local f16_local1 = Engine.GetModel( f16_local0, f16_arg0 )
		if f16_local1 then
			local f16_local2 = Engine.GetModel( f16_local1, "itemIndex" )
			if f16_local2 then
				local f16_local3 = Engine.GetModelValue( f16_local2 )
				if f16_local3 ~= 0 then
					return Engine.GetNumAttachments( f16_local3 ) - 1
				end
			end
		end
	end
	return 0
end

function SearchForTakeTwoGadgetMod( f17_arg0, f17_arg1 )
	if f17_arg0 then
		for f17_local4, f17_local5 in ipairs( f17_arg1 ) do
			local f17_local6 = Engine.GetModel( f17_arg0, f17_local5 )
			if f17_local6 then
				local f17_local3 = Engine.GetModel( f17_local6, "itemIndex" )
				if f17_local3 and Engine.GetModelValue( f17_local3 ) == 1 then
					return true
				end
			end
		end
	end
	return false
end

function IsFilmReadyForPlayback()
	local f18_local0 = Engine.LobbyGetDemoInformation()
	if f18_local0 and f18_local0.readyForPlayback then
		return true
	else
		return false
	end
end

function GetDemoContextMode()
	local f19_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
	if f19_local0 then
		return Engine.GetModelValue( f19_local0 )
	else
		return Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK
	end
end

function CheckMemento( f20_arg0, f20_arg1 )
	local f20_local0 = Engine.GetModel( Engine.GetModelForController( f20_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. f20_arg1 .. CoD.Zombie.MEMENTO_SUFFIX )
	return f20_local0 and Engine.GetModelValue( f20_local0 ) == 1
end

function ShowPurchasableMapForDLCBit( f21_arg0, f21_arg1 )
	if CoD.IsHiddenDLC( f21_arg1 ) then
		return false
	elseif not CoD.IsKnownDLC( f21_arg1 ) then
		return false
	elseif PlayGoIsStillDownloading( f21_arg0 ) then
		return false
	else
		return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
end

function ShowPurchasableMap( f22_arg0, f22_arg1 )
	return ShowPurchasableMapForDLCBit( f22_arg0, Engine.GetDLCBitForMapName( f22_arg1 ) )
end

function PartyMemberMissingContent( f23_arg0, f23_arg1 )
	if f23_arg1 == Enum.eModes.MODE_MULTIPLAYER then
		return f23_arg0.mpChunkStatus ~= 3
	elseif f23_arg1 == Enum.eModes.MODE_CAMPAIGN then
		return f23_arg0.cpChunkStatus ~= 3
	elseif f23_arg1 == Enum.eModes.MODE_ZOMBIES then
		return f23_arg0.zmChunkStatus ~= 3
	else
		return false
	end
end

function IsGameModeOwned( f24_arg0 )
	if f24_arg0 == Enum.eModes.MODE_CAMPAIGN then
		return Engine.IsCpOwned() == true
	elseif f24_arg0 == Enum.eModes.MODE_MULTIPLAYER then
		return Engine.IsMpOwned() == true
	elseif f24_arg0 == Enum.eModes.MODE_ZOMBIES then
		return Engine.IsZmOwned() == true
	else
		return false
	end
end

function DoesHaveFileshareOptions( f25_arg0 )
	if CoD.FileshareUtility.GetIsGroupsMode( f25_arg0 ) then
		if HasAdminPrivilege( f25_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_FAVORITE_SHOWCASE_CONTENT ) then
			return true
		elseif HasAdminPrivilege( f25_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_FEATURED_CONTENT ) then
			return true
		end
	end
	local f25_local0 = FileshareIsLocalCategory( f25_arg0 )
	local f25_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" ) == Engine.GetXUID64( f25_arg0 )
	if f25_local0 and CoD.FileshareUtility.GetCurrentCategory() == "clip_private" then
		return true
	elseif not f25_local0 then
		if FilesshareCanShowVoteOptions( f25_arg0 ) then
			return true
		elseif FileshareCanDownloadItem( f25_arg0 ) then
			return true
		elseif not f25_local1 then
			return true
		elseif FileshareCanShowShowcaseManager( f25_arg0 ) then
			return true
		end
	end
	if FileshareCanDeleteItem( f25_arg0 ) then
		return true
	end
	return false
end

function IsCommunityContractCallingCardById( f26_arg0 )
	return tonumber( Engine.TableLookup( nil, CoD.backgroundsTable, 1, f26_arg0, 12 ) ) == 1
end

