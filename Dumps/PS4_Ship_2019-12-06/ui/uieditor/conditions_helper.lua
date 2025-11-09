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

function IsCACItemLockedHelper( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = CoD.perController[f9_arg2].classModel
	local f9_local1 = CoD.perController[f9_arg2].weaponCategory
	local f9_local2 = nil
	local f9_local3 = f9_arg1.itemIndex
	local f9_local4 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f9_local3 then
		f9_local2 = f9_arg1:getModel( f9_arg2, "itemIndex" )
		if f9_local2 then
			f9_local3 = Engine.GetModelValue( f9_local2 )
		end
	end
	if f9_local3 then
		if not f9_local1 then
			f9_local1 = Engine.GetLoadoutSlotForItem( f9_local3, f9_local4 )
		end
		if f9_local0 and f9_local1 and (LUI.startswith( f9_local1, "primaryattachment" ) or LUI.startswith( f9_local1, "secondaryattachment" )) then
			local f9_local5 = "primary"
			if LUI.startswith( f9_local1, "secondaryattachment" ) then
				f9_local5 = "secondary"
			end
			local f9_local6 = Engine.GetModel( f9_local0, f9_local5 .. ".itemIndex" )
			if f9_local6 then
				return Engine.IsItemAttachmentLocked( f9_arg2, Engine.GetModelValue( f9_local6 ), f9_local3, f9_local4 )
			end
		end
		if f9_local1 == "secondary" then
			local f9_local5 = Engine.GetItemRef( f9_local3 )
			if f9_local5 and CoD.ContractWeaponTiers[f9_local5] and not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f9_local5] ) then
				return true
			end
		end
		return Engine.IsItemLocked( f9_arg2, f9_local3, f9_local4 )
	else
		return false
	end
end

function GetWeaponSlotModel( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	if not f10_arg2 or not f10_arg3 then
		return nil
	else
		local f10_local0 = f10_arg1:getModel( f10_arg2, "weaponSlot" )
		if not f10_local0 then
			return nil
		else
			local f10_local1 = Engine.GetModelValue( f10_local0 )
			if not f10_local1 then
				return nil
			else
				return f10_local1
			end
		end
	end
end

function IsTakeTwoGadgetAttachmentForSlot( f11_arg0, f11_arg1, f11_arg2 )
	if f11_arg1 and f11_arg0 then
		local f11_local0 = Engine.GetModel( f11_arg1, "itemIndex" )
		local f11_local1 = Engine.GetModel( f11_arg0, f11_arg2 )
		if f11_local0 and f11_local1 then
			local f11_local2 = Engine.GetModel( f11_local1, "itemIndex" )
			if f11_local2 then
				local f11_local3 = Engine.GetModelValue( f11_local0 )
				local f11_local4 = Engine.GetModelValue( f11_local2 )
				if f11_local4 > CoD.CACUtility.EmptyItemIndex then
					return Engine.IsTakeTwoGadgetAttachment( f11_local4, f11_local3 )
				end
			end
		end
	end
	return false
end

function WeaponAttributeCompare( f12_arg0 )
	local f12_local0 = {}
	for f12_local4 in string.gmatch( f12_arg0, "[^,]+" ) do
		table.insert( f12_local0, tonumber( f12_local4 ) )
	end
	if #f12_local0 == 2 and f12_local0[1] < f12_local0[2] then
		return true
	else
		return false
	end
end

function IsWeaponLevelMax( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0
	if Engine.GetGunCurrentRank( f13_arg1, f13_arg0, f13_arg2 ) ~= Engine.GetGunNextRank( f13_arg1, f13_arg0, f13_arg2 ) or Engine.GetGunCurrentRankXP( f13_arg1, f13_arg0, f13_arg2 ) > CoD.CACUtility.GetCurrentWeaponXP( f13_arg1, f13_arg0, f13_arg2 ) then
		f13_local0 = false
	else
		f13_local0 = true
	end
	return f13_local0
end

function IsACVItemNewHelper( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	return Engine.IsACVItemNew( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
end

function GetNumberOfAttachmentsForSlot( f15_arg0, f15_arg1 )
	if not f15_arg1 then
		return 0
	end
	local f15_local0 = CoD.perController[f15_arg1].classModel
	if f15_local0 then
		local f15_local1 = Engine.GetModel( f15_local0, f15_arg0 )
		if f15_local1 then
			local f15_local2 = Engine.GetModel( f15_local1, "itemIndex" )
			if f15_local2 then
				local f15_local3 = Engine.GetModelValue( f15_local2 )
				if f15_local3 ~= 0 then
					return Engine.GetNumAttachments( f15_local3 ) - 1
				end
			end
		end
	end
	return 0
end

function SearchForTakeTwoGadgetMod( f16_arg0, f16_arg1 )
	if f16_arg0 then
		for f16_local4, f16_local5 in ipairs( f16_arg1 ) do
			local f16_local6 = Engine.GetModel( f16_arg0, f16_local5 )
			if f16_local6 then
				local f16_local3 = Engine.GetModel( f16_local6, "itemIndex" )
				if f16_local3 and Engine.GetModelValue( f16_local3 ) == 1 then
					return true
				end
			end
		end
	end
	return false
end

function IsFilmReadyForPlayback()
	local f17_local0 = Engine.LobbyGetDemoInformation()
	if f17_local0 and f17_local0.readyForPlayback then
		return true
	else
		return false
	end
end

function GetDemoContextMode()
	local f18_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
	if f18_local0 then
		return Engine.GetModelValue( f18_local0 )
	else
		return Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK
	end
end

function CheckMemento( f19_arg0, f19_arg1 )
	local f19_local0 = Engine.GetModel( Engine.GetModelForController( f19_arg0 ), "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. f19_arg1 .. CoD.Zombie.MEMENTO_SUFFIX )
	return f19_local0 and Engine.GetModelValue( f19_local0 ) == 1
end

function ShowPurchasableMapForDLCBit( f20_arg0, f20_arg1 )
	if CoD.IsHiddenDLC( f20_arg1 ) then
		return false
	elseif not CoD.IsKnownDLC( f20_arg1 ) then
		return false
	elseif PlayGoIsStillDownloading( f20_arg0 ) then
		return false
	else
		return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
end

function ShowPurchasableMap( f21_arg0, f21_arg1 )
	return ShowPurchasableMapForDLCBit( f21_arg0, Engine.GetDLCBitForMapName( f21_arg1 ) )
end

function DoesHaveFileshareOptions( f22_arg0 )
	if CoD.FileshareUtility.GetIsGroupsMode( f22_arg0 ) then
		if HasAdminPrivilege( f22_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_FAVORITE_SHOWCASE_CONTENT ) then
			return true
		elseif HasAdminPrivilege( f22_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_FEATURED_CONTENT ) then
			return true
		end
	end
	local f22_local0 = FileshareIsLocalCategory( f22_arg0 )
	local f22_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" ) == Engine.GetXUID64( f22_arg0 )
	if f22_local0 and CoD.FileshareUtility.GetCurrentCategory() == "clip_private" then
		return true
	elseif not f22_local0 then
		if FilesshareCanShowVoteOptions( f22_arg0 ) then
			return true
		elseif FileshareCanDownloadItem( f22_arg0 ) then
			return true
		elseif not f22_local1 then
			return true
		elseif FileshareCanShowShowcaseManager( f22_arg0 ) then
			return true
		end
	end
	if FileshareCanDeleteItem( f22_arg0 ) then
		return true
	end
	return false
end

function IsCommunityContractCallingCardById( f23_arg0 )
	return tonumber( Engine.TableLookup( nil, CoD.backgroundsTable, 1, f23_arg0, 12 ) ) == 1
end

