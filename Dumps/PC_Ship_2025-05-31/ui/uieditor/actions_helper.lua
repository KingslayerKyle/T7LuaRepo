function SendClientScriptMenuChangeNotifyHelper( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = "closed"
	if f1_arg2 then
		f1_local0 = "opened"
	end
	if f1_arg3 then
		Engine.SendClientScriptNotify( f1_arg0, "menu_change" .. CoD.GetLocalClientAdjustedNum( f1_arg0 ), f1_arg1, f1_local0, f1_arg3 )
	else
		Engine.SendClientScriptNotify( f1_arg0, "menu_change" .. CoD.GetLocalClientAdjustedNum( f1_arg0 ), f1_arg1, f1_local0 )
	end
end

function CloseAllOccludingMenus( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.occludedBy
	while f2_local0 ~= nil do
		if f2_local0.occludedBy ~= nil or f2_local0.ignoreForcedClose then
			f2_local0 = f2_local0.occludedBy
		end
		local f2_local1 = f2_local0
		while f2_local1 ~= f2_arg0 do
			f2_local1 = GoBackToMenu( f2_local1, f2_arg1, f2_arg0.menuName )
		end
		return 
	end
end

function LobbyTheaterLaunchDemo( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	if Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) > 1 then
		LuaUtils.UI_ShowErrorMessageDialog( f3_arg2, "MENU_TOO_MANY_CLIENTS_FOR_THEATER" )
		return 
	end
	local f3_local0 = Engine.LobbyGetDemoInformation()
	if not f3_local0 then
		return 
	elseif f3_arg3 == nil then
		f3_arg3 = ""
	end
	if not Engine.IsMapValid( Dvar.ui_mapname:get() ) then
		LuaUtils.UI_ShowErrorMessageDialog( f3_arg2, "MENU_DLC_WARNING_MISSING_MAP_PACK_THEATER" )
		return 
	end
	f3_local0.controller = f3_arg2
	f3_local0.demoMode = f3_arg3
	Engine.LobbyUpdateDemoInformation( f3_local0 )
	if f3_local0.mainMode ~= Enum.eModes.MODE_INVALID then
		Engine.SwitchMode( f3_arg2, Engine.GetAbbreviationForMode( f3_local0.mainMode ) )
	end
	CoD.LobbyBase.LaunchDemo( f3_arg0, f3_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GetSessionModeFromPresenceActivity( f4_arg0 )
	if f4_arg0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY <= f4_arg0 and f4_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST <= f4_arg0 and f4_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return Enum.eModes.MODE_CAMPAIGN
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST <= f4_arg0 and f4_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST <= f4_arg0 and f4_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

function SetFocusToLoadoutWidgetAfterSetItem( f5_arg0 )
	if f5_arg0.weaponSlotTable and f5_arg0.currentActiveSlot and f5_arg0.weaponSlotTable[f5_arg0.currentActiveSlot] then
		local f5_local0 = f5_arg0.weaponSlotTable[f5_arg0.currentActiveSlot]
		if f5_local0 then
			if f5_local0.widget then
				f5_local0.widget:processEvent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			else
				f5_local0:dispatchEventToParent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			end
		end
	end
end

function OpenGenericPopup( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5, f6_arg6 )
	local f6_local0 = f6_arg0
	while f6_local0 and not f6_local0.openMenu do
		f6_local0 = f6_local0:getParent()
	end
	local f6_local1 = f6_local0:openPopup( f6_arg2, f6_arg1 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f6_arg1] then
		CoD.MenuNavigation[f6_arg1] = {}
	end
	table.insert( CoD.MenuNavigation[f6_arg1], {
		f6_local1.menuName
	} )
	if f6_arg3 and f6_arg3 ~= "" then
		f6_local1:setContent( Engine.Localize( f6_arg3 ) )
	end
	if f6_arg4 and f6_arg4 ~= "" then
		f6_local1:setSubContent( Engine.Localize( f6_arg4 ) )
	end
	if f6_arg5 and f6_arg5 ~= "" then
		f6_local1:setButton1Text( Engine.Localize( f6_arg5 ) )
	end
	local f6_local2 = f6_arg6
	if f6_arg6 and type( f6_arg6 ) == "string" and f6_arg6 ~= "" and _G[f6_arg6] then
		f6_local2 = _G[f6_arg6]
	end
	if type( f6_local2 ) == "function" then
		f6_local1:setButton1Action( f6_arg6 )
	end
	return f6_local1
end

function GetListItem( f7_arg0, f7_arg1 )
	local f7_local0 = {}
	while f7_arg1 and f7_arg1 ~= f7_arg0 do
		table.insert( f7_local0, f7_arg1 )
		f7_arg1 = f7_arg1:getParent()
	end
	if #f7_local0 >= 1 then
		return f7_local0[#f7_local0]
	else
		return initialElement
	end
end

function RemoveItemFromClassSlot( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = CoD.perController[f8_arg1].classNum
	local f8_local1 = CoD.perController[f8_arg1].classModel
	local f8_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( f8_local1, f8_arg0 ), "itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < f8_local2 then
		local f8_local3 = Engine.GetItemRef( f8_local2 )
		CoD.SetClassItem( f8_arg1, f8_local0, f8_arg0, CoD.CACUtility.EmptyItemIndex )
		if f8_local3 == "bonuscard_perk_1_greed" and not f8_arg2 then
			RemoveItemFromClassSlot( "specialty4", f8_arg1 )
		elseif f8_local3 == "bonuscard_perk_2_greed" and not f8_arg2 then
			RemoveItemFromClassSlot( "specialty5", f8_arg1 )
		elseif f8_local3 == "bonuscard_perk_3_greed" and not f8_arg2 then
			RemoveItemFromClassSlot( "specialty6", f8_arg1 )
		elseif LUI.startswith( f8_local3, "bonuscard_primary_gunfighter" ) then
			local f8_local4 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f8_local1 )
			RemoveItemFromClassSlot( "primaryattachment6", f8_arg1 )
			if f8_local4 < 2 then
				RemoveItemFromClassSlot( "primaryattachment5", f8_arg1 )
				if f8_local4 < 1 then
					RemoveItemFromClassSlot( "primaryattachment4", f8_arg1 )
				end
			end
		elseif f8_local3 == "bonuscard_secondary_gunfighter" then
			RemoveItemFromClassSlot( "secondaryattachment3", f8_arg1 )
		elseif f8_local3 == "bonuscard_overkill" then
			RemoveItemFromClassSlot( "secondary", f8_arg1 )
			if Engine.IsCampaignGame() then
				CoD.SetClassItem( f8_arg1, f8_local0, "secondary", tonumber( Engine.TableLookup( f8_arg1, CoD.statsTable, 4, "pistol_standard", 0 ) ) )
			end
		elseif f8_local3 == "bonuscard_two_tacticals" then
			RemoveItemFromClassSlot( "primarygadget", f8_arg1 )
		elseif f8_local3 == "bonuscard_danger_close" then
			if not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", f8_local1 ) then
				RemoveItemFromClassSlot( "primarygadgetattachment1", f8_arg1 )
			end
		elseif f8_arg0 == "primary" or f8_arg0 == "secondary" then
			for f8_local8, f8_local9 in ipairs( CoD.CACUtility.GetAttachmentListForSlot( f8_arg0 ) ) do
				RemoveItemFromClassSlot( f8_local9, f8_arg1 )
			end
			for f8_local8, f8_local9 in pairs( CoD.CACUtility.weaponOptionGroupNames ) do
				local f8_local10 = f8_arg0 .. f8_local9
				if Engine.GetModel( f8_local1, f8_local10 ) then
					CoD.SetClassItem( f8_arg1, f8_local0, f8_local10, CoD.CACUtility.EmptyItemIndex )
				end
			end
			for f8_local9, f8_local10 in ipairs( CoD.CACUtility.GetCACWeaponACVList( f8_arg0 ) ) do
				RemoveItemFromClassSlot( f8_local10, f8_arg1 )
			end
			CoD.SetClassItem( f8_arg1, f8_local0, f8_arg0 .. "paintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			CoD.SetClassItem( f8_arg1, f8_local0, f8_arg0 .. "paintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
			CoD.SetClassItem( f8_arg1, f8_local0, f8_arg0 .. CoD.CACUtility[f8_arg0 .. "WeaponPrestigeSlot"], CoD.CACUtility.EmptyItemIndex )
		elseif f8_arg0 == "primarygadget" or f8_arg0 == "secondarygadget" or f8_arg0 == "specialgadget" then
			local f8_local4 = CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
			if f8_arg0 == "secondarygadget" then
				f8_local4 = CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
			elseif f8_arg0 == "specialgadget" then
				f8_local4 = CoD.CACUtility.SpecialGadgetAttachmentSlotNameList
			end
			for f8_local8, f8_local9 in ipairs( f8_local4 ) do
				RemoveItemFromClassSlot( f8_local9, f8_arg1 )
			end
		elseif LUI.startswith( f8_arg0, "primaryattachment" ) or LUI.startswith( f8_arg0, "secondaryattachment" ) then
			local f8_local4 = "primary"
			if LUI.startswith( f8_arg0, "secondary" ) then
				f8_local4 = "secondary"
			end
			local f8_local5 = Engine.GetModel( f8_local1, f8_local4 .. ".itemIndex" )
			if f8_local5 then
				local f8_local7 = Engine.GetAttachmentRef( Engine.GetModelValue( f8_local5 ), f8_local2 )
				if f8_local7 then
					local f8_local8 = f8_local4 .. f8_local7
					if CoD.CACUtility.AttachmentHasCustomReticle( f8_local7 ) then
						f8_local8 = f8_local4 .. "reticle"
					end
					if Engine.GetModel( f8_local1, f8_local8 ) then
						CoD.SetClassItem( f8_arg1, f8_local0, f8_local8, CoD.CACUtility.EmptyItemIndex )
					end
				end
			end
			local f8_local6 = f8_arg0 .. "cosmeticvariant"
			if Engine.GetModel( f8_local1, f8_local6 ) then
				CoD.SetClassItem( f8_arg1, f8_local0, f8_local6, CoD.CACUtility.EmptyItemIndex )
			end
		end
		CoD.CACUtility.GetCustomClassModel( f8_arg1, f8_local0, f8_local1 )
		return true
	else
		return false
	end
end

function CanEquipMultiplePrimaryGunfighterWildcard( f9_arg0, f9_arg1 )
	if not LUI.startswith( f9_arg0, "bonuscard" ) then
		return false
	elseif Engine.GetItemRef( f9_arg1 ) == "bonuscard_primary_gunfighter" then
		return true
	else
		return false
	end
end

function AttemptAttachItem( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4, f10_arg5, f10_arg6 )
	local f10_local0 = CoD.perController[f10_arg1].classModel
	local f10_local1 = false
	local f10_local2 = nil
	if f10_arg0.getEquippedLoadoutSlot then
		f10_local2 = f10_arg0:getEquippedLoadoutSlot( f10_arg1, f10_arg5 )
	end
	local f10_local3 = Engine.GetModel( f10_arg2, "allocationSpent" )
	if not f10_local3 then
		f10_local3 = Engine.GetModel( f10_local0, "allocationSpent" )
	end
	local f10_local4 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f10_arg4, f10_arg1, f10_arg5 )
	for f10_local5 = 1, #f10_local4, 1 do
		local f10_local8 = f10_local4[f10_local5]
		if f10_local8 ~= "" and (not f10_local2 or f10_local2 ~= mutuallyExclusiveItemSlot) then
			if Engine.IsCampaignGame() and (f10_local8 == "primary" or f10_local8 == "secondary") then
				return true
			end
			RemoveItemFromClassSlot( f10_local8, f10_arg1 )
		end
	end
	local f10_local5 = CoD.GetClassItem( f10_arg1, f10_arg3, f10_arg4 )
	CoD.perController[f10_arg1].overCapacityItemIndex = nil
	local f10_local6 = false
	if CoD.CACUtility.EmptyItemIndex < f10_local5 or f10_local2 then
		f10_local6 = true
		if not f10_local2 then
			f10_local2 = f10_arg4
		end
		local f10_local7 = Engine.GetItemRef( f10_local5 )
		if f10_local7 == "bonuscard_perk_1_greed" then
			RemoveItemFromClassSlot( "specialty4", f10_arg1 )
		elseif f10_local7 == "bonuscard_perk_2_greed" then
			RemoveItemFromClassSlot( "specialty5", f10_arg1 )
		elseif f10_local7 == "bonuscard_perk_3_greed" then
			RemoveItemFromClassSlot( "specialty6", f10_arg1 )
		elseif f10_local7 == "bonuscard_primary_gunfighter" then
			local f10_local9 = CoD.CACUtility.SpecificWildcardEquippedCount( f10_local0, "bonuscard_primary_gunfighter" )
			RemoveItemFromClassSlot( "primaryattachment6", f10_arg1 )
			if f10_local9 <= 2 then
				RemoveItemFromClassSlot( "primaryattachment5", f10_arg1 )
				if f10_local9 <= 1 then
					RemoveItemFromClassSlot( "primaryattachment4", f10_arg1 )
				end
			end
		elseif f10_local7 == "bonuscard_secondary_gunfighter" then
			RemoveItemFromClassSlot( "secondaryattachment3", f10_arg1 )
		elseif f10_local7 == "bonuscard_overkill" then
			RemoveItemFromClassSlot( "secondary", f10_arg1 )
			if Engine.IsCampaignGame() then
				CoD.SetClassItem( f10_arg1, f10_arg3, "secondary", tonumber( Engine.TableLookup( f10_arg1, CoD.statsTable, 4, "pistol_standard", 0 ) ) )
			end
		elseif f10_local7 == "bonuscard_two_tacticals" then
			RemoveItemFromClassSlot( "primarygadget", f10_arg1 )
		elseif f10_local7 == "bonuscard_danger_close" and not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", f10_local0 ) then
			RemoveItemFromClassSlot( "primarygadgetattachment1", f10_arg1 )
		end
		RemoveItemFromClassSlot( f10_local2, f10_arg1, f10_local6 )
		RemoveItemFromClassSlot( f10_arg4, f10_arg1, false )
		f10_local5 = CoD.CACUtility.EmptyItemIndex
		f10_local1 = true
	end
	if not f10_local6 then
		if IsCampaign() or Engine.GetModelValue( f10_local3 ) < Engine.GetMaxAllocation( f10_arg1 ) then
			f10_local1 = true
		else
			CoD.perController[f10_arg1].overCapacityItemIndex = f10_arg5
			local f10_local9 = OpenPopup( f10_arg0, "OverCapacity", f10_arg1 )
			f10_local9.acceptData = {
				classNum = f10_arg3,
				slotName = f10_arg4,
				itemIndex = f10_arg5
			}
			return false
		end
	end
	if f10_local1 == true and CoD.CACUtility.EmptyItemIndex < f10_arg5 then
		f10_local7 = Engine.GetItemRef( f10_arg5 )
		if f10_local7 == "bonuscard_overkill" then
			RemoveItemFromClassSlot( "secondary", f10_arg1 )
			if Engine.IsCampaignGame() then
				local f10_local8 = CoD.GetClassItem( f10_arg1, f10_arg3, CoD.CACUtility.loadoutSlotNames.primaryWeapon )
				local f10_local10 = tonumber( Engine.TableLookup( f10_arg1, CoD.statsTable, 4, "smg_standard", 0 ) )
				if f10_local8 == f10_local10 then
					CoD.SetClassItem( f10_arg1, f10_arg3, "secondary", tonumber( Engine.TableLookup( f10_arg1, CoD.statsTable, 4, "ar_standard", 0 ) ) )
				else
					CoD.SetClassItem( f10_arg1, f10_arg3, "secondary", f10_local10 )
				end
			end
		elseif f10_local7 == "bonuscard_two_tacticals" then
			RemoveItemFromClassSlot( "primarygadget", f10_arg1 )
		end
		CoD.SetClassItem( f10_arg1, f10_arg3, f10_arg4, f10_arg5 )
	end
	if not f10_arg6 then
		CoD.CACUtility.GetCustomClassModel( f10_arg1, f10_arg3, f10_local0 )
	end
	return f10_local1
end

function ToggleGadgetMod( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg0.weaponSlotTable[f11_arg2]
	if not f11_local0 then
		return 
	end
	local f11_local1 = f11_local0.widget:getModel( f11_arg1, "weaponSlot" )
	local f11_local2 = f11_arg0:getModel()
	if f11_local1 and f11_local2 then
		local f11_local3 = Engine.GetModelValue( f11_local1 )
		local f11_local4, f11_local5, f11_local6 = CoD.CACUtility.GetCACSlotStatus( f11_arg1, f11_local2, f11_local3 )
		local f11_local7 = CoD.perController[f11_arg1].classNum
		local f11_local8 = false
		if f11_local4 == CoD.CACUtility.CACStatusAvailable.AVAILABLE then
			if f11_local5 then
				RemoveItemFromClassSlot( f11_local3, f11_arg1 )
				f11_arg0:playSound( "unequip_item" )
			else
				local f11_local9 = "primarygadget"
				if not LUI.startswith( f11_local3, f11_local9 ) then
					f11_local9 = "secondarygadget"
				end
				local f11_local10 = f11_arg0:getModel( f11_arg1, f11_local9 .. ".itemIndex" )
				if f11_local10 then
					local f11_local11 = Engine.GetModelValue( f11_local10 )
					local f11_local12 = Engine.GetNumGadgetAttachments( f11_local11, false )
					for f11_local13 = 1, f11_local12, 1 do
						if Engine.IsTakeTwoGadgetAttachment( f11_local11, f11_local13 ) then
							f11_local8 = AttemptAttachItem( f11_arg0, f11_arg1, f11_local2, f11_local7, f11_local3, f11_local13 )
							UpdateButtonPromptState( f11_arg0, element, f11_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
							f11_arg0:playSound( "equip_mod" )
						end
					end
				end
			end
			f11_arg0:processEvent( {
				name = "update_state",
				controller = f11_arg1
			} )
			f11_arg0:processEvent( {
				name = "update_button_prompts",
				controller = f11_arg1
			} )
			local f11_local9 = nil
			local f11_local10 = "select01"
			if LUI.startswith( f11_arg2, "primarygadgetattachment" ) then
				f11_local9 = Engine.GetWeaponString( f11_arg1, f11_local7, "primarygadget" )
			elseif LUI.startswith( f11_arg2, "secondarygadgetattachment" ) then
				f11_local9 = Engine.GetWeaponString( f11_arg1, f11_local7, "secondarygadget" )
			end
			if f11_local5 or f11_local8 == false then
				Engine.SendClientScriptNotify( f11_arg1, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f11_arg1 ) )
			elseif f11_local9 and f11_local9 ~= "" then
				Engine.SendClientScriptNotify( f11_arg1, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f11_arg1 ), f11_arg2, f11_local9, f11_local10 )
			end
		end
	end
end

function AttachWeaponVariant( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5, f12_arg6 )
	local f12_local0 = CoD.perController[f12_arg1].classModel
	local f12_local1 = CoD.perController[f12_arg1].classNum
	local f12_local2 = f12_arg3.weaponIndex
	local f12_local3 = f12_arg3.cacVariantIndex
	local f12_local4 = f12_arg3.attachmentVariant
	local f12_local5 = true
	if not IsProgressionEnabled( f12_arg1 ) or not f12_arg3.isVariantLinkBroken then
		CoD.SetClassItem( f12_arg1, f12_local1, f12_arg2 .. "gunsmithvariant", f12_local3 )
	end
	RemoveItemFromClassSlot( f12_arg2, f12_arg1 )
	AttemptAttachItem( f12_arg0, f12_arg1, f12_local0, f12_local1, f12_arg2, f12_local2, f12_local5 )
	CoD.SetClassItem( f12_arg1, f12_local1, f12_arg2 .. "camo", f12_arg3.camoIndex )
	CoD.SetClassItem( f12_arg1, f12_local1, f12_arg2 .. "reticle", f12_arg3.reticleIndex )
	local f12_local6 = f12_arg3.paintjobSlot
	if f12_local6 and f12_local6 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f12_arg3.paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		CoD.SetClassItem( f12_arg1, f12_local1, f12_arg2 .. "paintjobslot", f12_arg3.paintjobSlot )
		CoD.SetClassItem( f12_arg1, f12_local1, f12_arg2 .. "paintjobindex", f12_arg3.paintjobIndex )
	end
	for f12_local16, f12_local17 in ipairs( f12_arg5 ) do
		if not f12_local17.isLocked then
			local f12_local10 = nil
			for f12_local14, f12_local15 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( f12_local15, f12_arg1, f12_local0 ) then
					f12_local10 = f12_local15
					break
				end
			end
			if f12_local10 then
				AttemptAttachItem( f12_arg0, f12_arg1, f12_local0, f12_local1, f12_local10, f12_local17.itemIndex, f12_local5 )
			end
		end
	end
	for f12_local16, f12_local17 in ipairs( f12_arg4 ) do
		local f12_local10 = f12_arg2 .. "attachment" .. f12_local16
		if CoD.CACUtility.EmptyItemIndex < f12_local17 then
			AttemptAttachItem( f12_arg0, f12_arg1, f12_local0, f12_local1, f12_local10, f12_local17, f12_local5 )
			CoD.SetClassItem( f12_arg1, f12_local1, f12_local10 .. "cosmeticvariant", f12_local4[f12_local16] )
		end
	end
	CoD.CACUtility.GetCustomClassModel( f12_arg1, f12_local1, CoD.perController[f12_arg1].classModel )
end

function SetConfirmationInfoInternal( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = Engine.GetModelValue( f13_arg2 )
	local f13_local1 = Engine.GetModel( Engine.GetModelForController( f13_arg1 ), "UnlockTokenInfo" )
	Engine.SetModelValue( Engine.GetModel( f13_local1, "itemIndex" ), f13_local0 )
	local f13_local2 = Engine.GetModel( f13_local1, "xpBarInfo" )
	if f13_local2 then
		local f13_local3 = CoD.GetPlayerStats( f13_arg1 )
		local f13_local4 = f13_local3.PlayerStatsList.RANKXP.StatValue:get()
		local f13_local5 = f13_local3.PlayerStatsList.RANK.StatValue:get()
		local f13_local6 = f13_local3.PlayerStatsList.PLEVEL.StatValue:get()
		local f13_local7, f13_local8 = CoD.AARUtility.GetMinMaxXPForRank( f13_local5, f13_arg1 )
		if not f13_local8 then
			f13_local8 = f13_local4
		end
		local f13_local9, f13_local10 = CoD.AARUtility.GetLevelAndLevelIconForRank( f13_local5, f13_local6 )
		local f13_local11, f13_local12 = CoD.AARUtility.GetLevelAndLevelIconForRank( f13_local5 + 1, f13_local6 )
		if IsInParagonCapableGameMode() and f13_local6 == Engine.GetPrestigeCap() then
			f13_local4 = f13_local3.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			f13_local5 = f13_local3.PlayerStatsList.PARAGON_RANK.StatValue:get()
			f13_local7, f13_local8 = CoD.AARUtility.GetMinMaxXPForParagonRank( f13_local5, f13_arg1 )
			if not f13_local8 then
				f13_local8 = f13_local4
			end
			f13_local9 = Engine.GetParagonRankDisplayLevel( f13_local5 )
			f13_local11 = Engine.GetParagonRankDisplayLevel( f13_local5 + 1 )
			local f13_local13 = f13_local3.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
			if f13_local13 ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				f13_local10 = Engine.GetParagonIconById( f13_local13 )
				f13_local12 = f13_local10
			end
		end
		Engine.SetModelValue( Engine.GetModel( f13_local2, "rankXP" ), f13_local4 )
		Engine.SetModelValue( Engine.GetModel( f13_local2, "xpEarned" ), 0 )
		Engine.SetModelValue( Engine.GetModel( f13_local2, "xpNeeded" ), f13_local8 - f13_local4 )
		Engine.SetModelValue( Engine.GetModel( f13_local2, "currLevel" ), f13_local9 )
		Engine.SetModelValue( Engine.GetModel( f13_local2, "currLevelIcon" ), f13_local10 )
		Engine.SetModelValue( Engine.GetModel( f13_local2, "nextLevel" ), f13_local11 )
		Engine.SetModelValue( Engine.GetModel( f13_local2, "nextLevelIcon" ), f13_local12 )
	end
	CoD.perController[f13_arg1].UnlockTokenInfo = f13_local1
end

function SetWeaponOptionAsOldInternal( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	local f14_local0 = f14_arg1:getModel( f14_arg2, "weaponOptionSubIndex" )
	local f14_local1 = f14_arg1:getModel( f14_arg2, "weaponOptionType" )
	local f14_local2 = f14_arg1:getModel( f14_arg2, "unlockSessionMode" )
	if f14_local0 and f14_local1 and f14_local2 then
		local f14_local3 = Engine.GetModelValue( f14_local0 )
		local f14_local4 = Engine.GetModelValue( f14_local1 )
		local f14_local5 = Engine.GetModelValue( f14_local2 )
		if f14_local4 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and f14_local4 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID and f14_local3 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetWeaponOptionAsOld( f14_arg2, f14_arg3, Engine.GetWeaponOptionGroupIndex( f14_local3, f14_local4 ), f14_local5 )
			if f14_arg0.categoryTabs and f14_arg0.categoryTabs.Tabs.grid then
				local f14_local6 = f14_arg0.categoryTabs.Tabs.grid:getItemAt( f14_arg0.categoryTabs.Tabs.grid.savedActiveIndex + 1 )
				if f14_local6 then
					local f14_local7 = f14_local6:getModel( f14_arg2, "breadcrumbCount" )
					if f14_local7 then
						local f14_local8 = 0
						if f14_local6.filterEnum < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
							f14_local8 = Engine.WeaponOptionNewItemCount( f14_arg2, f14_arg3, f14_local4, f14_local6.filterEnum )
						else
							f14_local8 = Engine.WeaponOptionNewModeAgnosticItemCount( f14_arg2, f14_arg3, f14_local4, f14_local6.filterEnum )
						end
						Engine.SetModelValue( f14_local7, f14_local8 )
					end
				end
			end
		end
	end
end

function SetACVASOldInternal( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	Engine.SetACVItemOld( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
end

function GetCPDifficulty( f16_arg0, f16_arg1 )
	local f16_local0 = Engine.GetProfileVarInt( f16_arg0, f16_arg1 )
	if f16_local0 ~= 0 then
		return f16_local0 - 1
	else
		
	end
end

function SetCPDifficulty( f17_arg0, f17_arg1, f17_arg2 )
	Engine.SetProfileVar( f17_arg0, f17_arg1, f17_arg2 + 1 )
end

function SetHeroCardStateToDefault( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	local f18_local0 = GetListItem( f18_arg1, f18_arg2 )
	local f18_local1 = f18_local0.activeWidget
	f18_arg2:setState( "DefaultState", true )
	if f18_local1 then
		f18_local0:setActiveItem( f18_local1 )
	end
end

function NotifyScriptCharacterLoadoutChange( f19_arg0, f19_arg1 )
	local f19_local0 = "weapon"
	if f19_arg1 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		f19_local0 = "ability"
	end
	Engine.SendClientScriptNotify( f19_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f19_arg0 ), "changeFrozenMoment", f19_local0 )
end

function PreviewGesture_Internal( f20_arg0, f20_arg1 )
	Engine.SendClientScriptNotify( f20_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f20_arg0 ), "previewGesture", f20_arg1 )
end

function PreviewTaunt_Internal( f21_arg0, f21_arg1 )
	Engine.SendClientScriptNotify( f21_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f21_arg0 ), "previewTaunt", f21_arg1 )
end

function SetBrowseMode( f22_arg0 )
	CoD.SetEditorProperties( f22_arg0, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function EmblemEditor_SetLayerAndGroupCount( f23_arg0, f23_arg1 )
	local f23_local0 = CoD.perController[f23_arg0].totalLayers
	local f23_local1 = Engine.GetUsedLayerCount( f23_arg0, f23_arg1, f23_local0 )
	CoD.SetEditorProperties( f23_arg0, Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f23_local1, f23_local0 ), "layersUsedFraction" )
	CoD.SetEditorProperties( f23_arg0, f23_local1, "layersUsed" )
	local f23_local2 = CoD.perController[f23_arg0].totalGroups
	local f23_local3 = Engine.GetUsedGroupCount( f23_arg0, f23_arg1, f23_local2 )
	CoD.SetEditorProperties( f23_arg0, Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f23_local3, f23_local2 - 1 ), "groupsUsedFraction" )
	CoD.SetEditorProperties( f23_arg0, f23_local3, "groupsUsed" )
end

function EmblemEditor_SetScaleMode( f24_arg0, f24_arg1 )
	CoD.SetEditorProperties( f24_arg0, f24_arg1, "scaleMode" )
	Engine.ExecNow( f24_arg0, "emblemSetScaleMode " .. f24_arg1 )
end

function EmblemEditor_SetMaterialScaleMode( f25_arg0, f25_arg1 )
	CoD.SetEditorProperties( f25_arg0, f25_arg1, "materialScaleMode" )
	Engine.ExecNow( f25_arg0, "setMaterialScaleMode " .. f25_arg1 )
end

function EmblemEditor_GetLayerAndGroupIndex( f26_arg0, f26_arg1 )
	return Engine.GetModelValue( f26_arg0:getModel( f26_arg1, "layerIndex" ) ) .. " " .. Engine.GetModelValue( f26_arg0:getModel( f26_arg1, "groupIndex" ) )
end

function EmblemEditor_SetupDrawEmblem( f27_arg0, f27_arg1, f27_arg2 )
	f27_arg1.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( f27_arg0, EmblemEditor_GetLayerAndGroupIndex( f27_arg1, f27_arg0 ) ) )
	f27_arg2.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( f27_arg0, EmblemEditor_GetLayerAndGroupIndex( f27_arg2, f27_arg0 ) ) )
end

function EmblemEditor_SetSelectedLayerIndex( f28_arg0, f28_arg1 )
	local f28_local0 = f28_arg1:getModel( f28_arg0, "layerIndex" )
	if f28_local0 then
		CoD.perController[f28_arg0].selectedLayerIndex = Engine.GetModelValue( f28_local0 )
	end
end

function EmblemEditor_RecordComScoreEvent( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	local f29_local0 = 0
	if f29_arg0.occludedMenu and f29_arg0.occludedMenu.openTime then
		f29_local0 = Engine.milliseconds() - f29_arg0.occludedMenu.openTime
	end
	LUI.CoDMetrics.EmblemEvent( f29_arg1, f29_local0, Engine.GetEmblemSummaryString(), f29_arg2, f29_arg3 )
end

function EmblemChooseColor_SetupSelectedLayerColorModel( f30_arg0 )
	local f30_local0 = Engine.GetModelForController( f30_arg0 )
	local f30_local1 = Engine.GetSelectedLayerColor( f30_arg0 )
	local f30_local2 = CoD.ConvertColor( f30_local1.red, f30_local1.green, f30_local1.blue )
	local f30_local3 = Engine.GetModel( f30_local0, "Emblem.EmblemSelectedLayerColor" )
	Engine.SetModelValue( Engine.GetModel( f30_local3, "color" ), f30_local2 )
	Engine.SetModelValue( Engine.GetModel( f30_local3, "red" ), f30_local1.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f30_local3, "green" ), f30_local1.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f30_local3, "blue" ), f30_local1.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	local f30_local4 = Engine.GetSelectedLayerColor1( f30_arg0 )
	local f30_local5 = CoD.ConvertColor( f30_local4.red, f30_local4.green, f30_local4.blue )
	local f30_local6 = Engine.GetModel( f30_local0, "Emblem.EmblemSelectedLayerColor1" )
	Engine.SetModelValue( Engine.GetModel( f30_local6, "color" ), f30_local5 )
	Engine.SetModelValue( Engine.GetModel( f30_local6, "red" ), f30_local4.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f30_local6, "green" ), f30_local4.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f30_local6, "blue" ), f30_local4.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	CoD.SetNoColorDataModel( f30_arg0 )
end

function EmblemChooseColor_SetPointerPosition( f31_arg0, f31_arg1 )
	local f31_local0, f31_local1 = f31_arg0:getLocalSize()
	local f31_local2 = f31_local0 * f31_arg1
	f31_arg0.pointer:setLeftRight( true, false, f31_local2, f31_local2 + 2 )
end

function EmblemChooseColor_SetShaderParams( f32_arg0, f32_arg1 )
	local f32_local0 = CoD.GetSelectedColor( f32_arg0 )
	if f32_local0 ~= nil then
		f32_arg1.redBar.bar:setShaderVector( 0, 0, f32_local0.green, f32_local0.blue, 1 )
		f32_arg1.redBar.bar:setShaderVector( 1, 1, f32_local0.green, f32_local0.blue, 1 )
		EmblemChooseColor_SetPointerPosition( f32_arg1.redBar, f32_local0.red )
		f32_arg1.greenBar.bar:setShaderVector( 0, f32_local0.red, 0, f32_local0.blue, 1 )
		f32_arg1.greenBar.bar:setShaderVector( 1, f32_local0.red, 1, f32_local0.blue, 1 )
		EmblemChooseColor_SetPointerPosition( f32_arg1.greenBar, f32_local0.green )
		f32_arg1.blueBar.bar:setShaderVector( 0, f32_local0.red, f32_local0.green, 0, 1 )
		f32_arg1.blueBar.bar:setShaderVector( 1, f32_local0.red, f32_local0.green, 1, 1 )
		EmblemChooseColor_SetPointerPosition( f32_arg1.blueBar, f32_local0.blue )
	end
end

function EmblemChooseColor_GetColorMixerElement( f33_arg0, f33_arg1 )
	if CoD.GetEditorProperties( f33_arg1, "isGradientMode" ) == 0 then
		return f33_arg0.colorMixerContainer.colorMixer
	else
		return f33_arg0.colorGradientMixerContainer.colorMixer
	end
end

function EmblemChooseColor_GetGradientSliderElement( f34_arg0, f34_arg1 )
	return f34_arg0.colorGradientContainer.gradientSlider
end

function EmblemChooseColor_ModifyColorModelValue( f35_arg0, f35_arg1 )
	Engine.SetModelValue( f35_arg0, CoD.ClampColor( Engine.GetModelValue( f35_arg0 ) + f35_arg1, 0, 255 ) )
end

function EmblemChooseColor_SetColorModelValue( f36_arg0, f36_arg1 )
	Engine.SetModelValue( f36_arg0, CoD.ClampColor( f36_arg1, 0, 255 ) )
end

function EmblemChooseColor_SetLayerColor( f37_arg0, f37_arg1 )
	local f37_local0 = Engine.GetModelValue( f37_arg0:getModel( f37_arg1, "red" ) )
	local f37_local1 = Engine.GetModelValue( f37_arg0:getModel( f37_arg1, "green" ) )
	local f37_local2 = Engine.GetModelValue( f37_arg0:getModel( f37_arg1, "blue" ) )
	local f37_local3 = 1 / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
	Engine.ExecNow( f37_arg1, "emblemSetLayerColor " .. CoD.GetEditorProperties( f37_arg1, "colorNum" ) .. " " .. f37_local0 * f37_local3 .. " " .. f37_local1 * f37_local3 .. " " .. f37_local2 * f37_local3 )
end

function EmblemChooseColor_SetPreviewColorModel( f38_arg0, f38_arg1 )
	local f38_local0 = Engine.GetModelForController( f38_arg1 )
	local f38_local1 = CoD.GetSelectedColor( f38_arg1 )
	if f38_local1 ~= nil then
		Engine.SetModelValue( f38_arg0:getModel( f38_arg1, "color" ), CoD.ConvertColor( f38_local1.red, f38_local1.green, f38_local1.blue ) )
	end
end

function EmblemChooseColor_SetBarProperties( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
	EmblemChooseColor_SetLayerColor( f39_arg1, f39_arg3 )
	EmblemChooseColor_SetPreviewColorModel( f39_arg1, f39_arg3 )
	EmblemChooseColor_SetShaderParams( f39_arg3, f39_arg0 )
end

function EmblemGradient_SetupSwatchLastSavedColor( f40_arg0, f40_arg1, f40_arg2 )
	local f40_local0 = DataSources.EmblemSelectedLayerEdittingColor.getModel( f40_arg2 )
	f40_arg0.colorGradientSwatchContainer:setModel( f40_local0 )
	f40_arg0.colorGradientMixerContainer.colorMixer:setModel( f40_local0 )
end

function EmblemGradient_UpdateGradientVisuals( f41_arg0, f41_arg1 )
	local f41_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f41_arg0 ), "Emblem.EmblemSelectedLayerProperties.gradient_fill" ) ) / CoD.emblem.MAX_GRADIENT_SLIDER_VALUE
	local f41_local1 = Engine.GetSelectedLayerColor( f41_arg0 )
	local f41_local2 = Engine.GetSelectedLayerColor1( f41_arg0 )
	EmblemChooseColor_SetPointerPosition( f41_arg1, f41_local0 )
	if f41_local1 ~= nil and f41_local2 ~= nil then
		f41_arg1.bar:setShaderVector( 0, f41_local1.red, f41_local1.green, f41_local1.blue, f41_local1.alpha )
		f41_arg1.bar:setShaderVector( 1, f41_local2.red, f41_local2.green, f41_local2.blue, f41_local2.alpha )
		f41_arg1.bar:setShaderVector( 2, f41_local0, 0, 0, 0 )
	end
end

function PaintJobEditor_RecordComScoreEvent( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4, f42_arg5 )
	local f42_local0 = 0
	if f42_arg0.occludedMenu and f42_arg0.occludedMenu.openTime then
		f42_local0 = Engine.milliseconds() - f42_arg0.occludedMenu.openTime
	end
	LUI.CoDMetrics.PaintshopEvent( f42_arg1, f42_arg3, f42_local0, Engine.GetModelValue( Engine.GetModel( f42_arg2, "weaponIndex" ) ), Engine.GetModelValue( Engine.GetModel( f42_arg2, "paintjobName" ) ), Engine.GetPaintshopSummaryString(), f42_arg4, f42_arg5 )
end

function GroupNotifyPopupButtonAction( f43_arg0, f43_arg1, f43_arg2 )
	local f43_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f43_arg2 ), "groups" ), "notificationError" ) )
	if IsProcessingGroupTask( f43_arg2 ) then
		return 
	elseif not f43_local0 then
		if f43_arg0.onSuccessAction then
			f43_arg0:onSuccessAction( f43_arg1, f43_arg2 )
		end
	elseif f43_arg0.onFailureAction then
		f43_arg0:onFailureAction( f43_arg1, f43_arg2 )
	end
	GoBack( f43_arg0, f43_arg2 )
end

function OpenGroupsNotifyPopup( f44_arg0, f44_arg1, f44_arg2, f44_arg3, f44_arg4, f44_arg5, f44_arg6, f44_arg7, f44_arg8 )
	local f44_local0 = "MENU_OK"
	if f44_arg6 == nil then
		f44_arg6 = false
	end
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f44_arg2 ), "groups.closeAutomaticallyAfterEvent" ), f44_arg6 )
	if f44_arg3 then
		Engine.SetModelValue( GetProcessingGroupTaskModel( f44_arg2 ), true )
	end
	local f44_local1 = CoD.OverlayUtility.CreateOverlay( f44_arg2, f44_arg0, "GroupsNotificationPopup", f44_arg2, "$(groups.notificationTitle)", "$(groups.notificationMessage)", nil, f44_local0, function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
		GroupNotifyPopupButtonAction( f45_arg4, f45_arg1, f45_arg2 )
	end, function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
		GroupNotifyPopupButtonAction( f46_arg3, nil, f46_arg2 )
	end )
	f44_local1.onSuccessAction = f44_arg5
	f44_local1.onFailureAction = f44_arg7
	local f44_local2 = Engine.GetModel( Engine.GetModelForController( f44_arg2 ), "groups.eventUpdate" )
	local f44_local3 = Engine.GetModel( Engine.GetModelForController( f44_arg2 ), "groups.eventName" )
	f44_local1.skipDelay = f44_arg8
	if f44_arg3 then
		f44_local1:subscribeToModel( f44_local2, function ( model )
			if Engine.GetModelValue( f44_local3 ) == f44_arg4 then
				local f47_local0 = function ()
					Engine.SetModelValue( GetProcessingGroupTaskModel( f44_arg2 ), false )
					local f48_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f44_arg2 ), "groups.notificationError" ) )
					if f44_arg6 then
						if f48_local0 then
							Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f44_arg2 ), "groups.closeAutomaticallyAfterEvent" ), false )
							if f44_arg7 then
								f44_arg7( f44_local1, f44_arg1, f44_arg2 )
							end
						else
							local f48_local1 = GoBack( f44_local1, f44_arg2 )
							if f44_arg5 then
								f44_arg5( f48_local1, f44_arg1, f44_arg2 )
							end
						end
					end
				end
				
				if f44_local1.skipDelay then
					f47_local0()
				else
					f44_local1:addElement( LUI.UITimer.newElementTimer( 200, true, f47_local0 ) )
				end
			end
		end )
	end
	return f44_local1
end

function InitializeCreateGroup( f49_arg0, f49_arg1, f49_arg2 )
	local f49_local0 = Engine.GetModel( Engine.GetModelForController( f49_arg2 ), "groups.createGroup" )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "name" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "default_name" ), Engine.LocalizeWithoutLocsMarkers( "GROUPS_DEFAULT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "privacy" ), Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "default_description" ), Engine.LocalizeWithoutLocsMarkers( "GROUPS_DEFAULT_DESCRIPTION" ) )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "emblem" ), "uie_t7_medal_baked" )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "tooltip_title" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "tooltip_description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "friends_invited_count" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f49_local0, "friends_count" ), 0 )
	Engine.CreateModel( f49_local0, "createdGroupId" )
	Engine.ExecNow( f49_arg2, "emblemgetprofile" )
	Engine.SetGroupEmblemForGroupCreation( f49_arg2 )
end

function SetGroupLeaderboardInfo( f50_arg0, f50_arg1, f50_arg2, f50_arg3, f50_arg4, f50_arg5, f50_arg6, f50_arg7 )
	if not f50_arg7 then
		Engine.SetGroupLeaderboardInfo( f50_arg0, f50_arg1, f50_arg2, f50_arg3, f50_arg4, f50_arg5 )
	end
	local f50_local0 = function ( f51_arg0 )
		local f51_local0 = Engine.CreateModel( Engine.GetModelForController( f51_arg0 ), "groups.selectedGroup" )
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbDef" ), f50_arg1 )
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbTimeFrame" ), f50_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbHardcore" ), f50_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbArena" ), f50_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbSortType" ), f50_arg5 )
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbInitialized" ), f50_arg6 )
		local f51_local1 = ""
		if CoD.LeaderboardUtility.leaderboardInfo[f50_arg1] then
			f51_local1 = CoD.LeaderboardUtility.leaderboardInfo[f50_arg1].title
		end
		local f51_local2 = CoD.LeaderboardUtility.GetDurationFilterString( f50_arg2 ) or ""
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbTypeString" ), f51_local1 )
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbTimeFrameString" ), f51_local2 )
		local f51_local3 = "GROUPS_HARDCORE_CAPS"
		if not f50_arg3 then
			f51_local3 = ""
		end
		Engine.SetModelValue( Engine.CreateModel( f51_local0, "lbHardcoreString" ), f51_local3 )
	end
	
	f50_local0( f50_arg0 )
	if f50_arg0 ~= 0 then
		f50_local0( 0 )
	end
end

function OpenCreateGroupMenu( f52_arg0, f52_arg1, f52_arg2 )
	NavigateToMenu( f52_arg0:getParentMenu(), "CreateGroup", true, f52_arg2 )
end

function GroupsSocialChangeTabFrameWidget( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
	if not f53_arg3 then
		return 
	end
	local f53_local0 = Engine.GetModel( Engine.GetModelForController( f53_arg2 ), "groups.frameWidget" )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f53_arg2 ), "groups.frameType" ), f53_arg3 )
	if f53_arg3 == "main" then
		local f53_local1 = "CoD.GroupsSocialMainFrameWidget"
		if IsUserContentRestricted( f53_arg2 ) or IsUserChatRestricted( f53_arg2 ) then
			f53_local1 = "CoD.GroupsSocialMainFrameWidgetDisabled"
		end
		Engine.SetModelValue( f53_local0, f53_local1 )
	elseif f53_arg3 == "members" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupMembers" )
		Engine.SetModelValue( f53_local0, "CoD.GroupsSocialMembersFrameWidget" )
	elseif f53_arg3 == "invites" then
		Engine.SetModelValue( f53_local0, "CoD.GroupsSocialInvitesFrameWidget" )
	end
end

function ResetGroupDirtyData( f54_arg0 )
	CoD.perController[f54_arg0].groupsDataDirty = {}
end

function MarkGroupDataDirty( f55_arg0, f55_arg1, f55_arg2 )
	if not CoD.perController[f55_arg0].groupsDataDirty then
		CoD.perController[f55_arg0].groupsDataDirty = {}
	end
	CoD.perController[f55_arg0].groupsDataDirty[f55_arg1] = f55_arg2
end

function SetGroupsNotifyInformation( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
	local f56_local0 = Engine.GetModelForController( f56_arg0 )
	Engine.SetModelValue( Engine.GetModel( f56_local0, "groups.notificationTitle" ), f56_arg1 )
	Engine.SetModelValue( Engine.GetModel( f56_local0, "groups.notificationMessage" ), f56_arg2 )
	Engine.SetModelValue( Engine.GetModel( f56_local0, "groups.notificationError" ), f56_arg3 )
end

function ValidateCreateGroupInformation( f57_arg0, f57_arg1, f57_arg2 )
	local f57_local0 = Engine.GetModelForController( f57_arg2 )
	local f57_local1 = Engine.GetModelValue( Engine.GetModel( f57_local0, "groups.createGroup.name" ) )
	local f57_local2 = Engine.GetModelValue( Engine.GetModel( f57_local0, "groups.createGroup.description" ) )
	if f57_local1 == "" then
		OpenGenericSmallPopup( f57_arg0, f57_arg2, "GROUPS_MISSING_GROUP_NAME_TITLE", "GROUPS_MISSING_GROUP_NAME_TEXT", nil, "MENU_OK" )
		return false
	else
		return true
	end
end

function Leaderboard_MoveUp_Friends( f58_arg0, f58_arg1, f58_arg2 )
	SelectAboveItemIfPossible( f58_arg0, f58_arg1, f58_arg2 )
end

function Leaderboard_MoveUp_All( f59_arg0, f59_arg1, f59_arg2 )
	if SelectAboveItemIfPossible( f59_arg0, f59_arg1, f59_arg2 ) then
		return 
	elseif not f59_arg1:getModel() then
		return 
	end
	local f59_local0 = tonumber( Engine.GetModelValue( Engine.GetModel( f59_arg1:getModel(), "position" ) ) )
	if f59_local0 > 1 then
		CoD.perController[f59_arg2].pivotPosition = f59_local0 - 1
		CoD.perController[f59_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.BOTTOM
		Engine.GetLeaderboardRow( f59_arg2, f59_local0 - 1, CoD.GetCombatRecordMode() )
	end
end

function Leaderboard_MoveDown_Friends( f60_arg0, f60_arg1, f60_arg2 )
	SelectBelowItemIfPossible( f60_arg0, f60_arg1, f60_arg2 )
end

function Leaderboard_MoveDown_All( f61_arg0, f61_arg1, f61_arg2 )
	if SelectBelowItemIfPossible( f61_arg0, f61_arg1, f61_arg2 ) then
		return 
	elseif not f61_arg1:getModel() then
		return 
	end
	local f61_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
	local f61_local1 = tonumber( Engine.GetModelValue( Engine.GetModel( f61_arg1:getModel(), "position" ) ) )
	if f61_local1 < f61_local0 then
		CoD.perController[f61_arg2].pivotPosition = f61_local1 + 1
		CoD.perController[f61_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
		Engine.GetLeaderboardRow( f61_arg2, f61_local1 + 1, CoD.GetCombatRecordMode() )
	end
end

function Leaderboard_PageUp_Friends( f62_arg0, f62_arg1, f62_arg2 )
	local f62_local0 = GetListItem( f62_arg0, f62_arg1 )
	local f62_local1 = nil
	if f62_local0.activeWidget ~= nil then
		local f62_local2 = f62_local0.vCount
		local f62_local3 = f62_local0.activeWidget.gridInfoTable.gridRowIndex
		if f62_local3 == 1 then
			return 
		end
		f62_local1 = f62_local0:getItemAtPosition( math.max( f62_local3 - f62_local2, 1 ), 1, true )
	end
	if f62_local1 then
		f62_local0:setActiveItem( f62_local1 )
	end
end

function Leaderboard_PageUp_All( f63_arg0, f63_arg1, f63_arg2 )
	local f63_local0 = GetListItem( f63_arg0, f63_arg1 )
	local f63_local1 = nil
	if not f63_local0.activeWidget then
		return 
	else
		local f63_local2 = f63_local0.vCount
		local f63_local3 = f63_local0.activeWidget.gridInfoTable.gridRowIndex - f63_local2
		if f63_local3 > 0 then
			f63_local0:setActiveItem( f63_local0:getItemAtPosition( f63_local3, 1, true ) )
			return 
		elseif not f63_arg1:getModel() then
			return 
		else
			local f63_local4 = tonumber( Engine.GetModelValue( Engine.GetModel( f63_arg1:getModel(), "position" ) ) )
			local f63_local5 = f63_local4 - f63_local2
			if f63_local4 == 1 then
				return 
			elseif f63_local5 < 1 then
				f63_local0:setActiveItem( f63_local0:getItemAtPosition( 1, 1, true ) )
				return 
			else
				CoD.perController[f63_arg2].pivotPosition = f63_local5
				CoD.perController[f63_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
				Engine.GetLeaderboardRow( f63_arg2, f63_local5, CoD.GetCombatRecordMode() )
			end
		end
	end
end

function Leaderboard_PageDown_Friends( f64_arg0, f64_arg1, f64_arg2 )
	local f64_local0 = GetListItem( f64_arg0, f64_arg1 )
	local f64_local1 = nil
	if f64_local0.activeWidget ~= nil then
		local f64_local2 = f64_local0.vCount
		local f64_local3 = f64_local0.activeWidget.gridInfoTable.gridRowIndex
		if f64_local3 == f64_local0.requestedRowCount then
			return 
		end
		f64_local1 = f64_local0:getItemAtPosition( math.min( f64_local3 + f64_local2, f64_local0.requestedRowCount ), 1, true )
	end
	if f64_local1 then
		f64_local0:setActiveItem( f64_local1 )
	end
end

function Leaderboard_PageDown_All( f65_arg0, f65_arg1, f65_arg2 )
	local f65_local0 = GetListItem( f65_arg0, f65_arg1 )
	local f65_local1 = nil
	if not f65_local0.activeWidget then
		return 
	else
		local f65_local2 = f65_local0.vCount
		local f65_local3 = f65_local0.activeWidget.gridInfoTable.gridRowIndex + f65_local2
		if f65_local3 <= f65_local0.requestedRowCount then
			f65_local0:setActiveItem( f65_local0:getItemAtPosition( f65_local3, 1, true ) )
			return 
		elseif not f65_arg1:getModel() then
			return 
		else
			local f65_local4 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
			local f65_local5 = tonumber( Engine.GetModelValue( Engine.GetModel( f65_arg1:getModel(), "position" ) ) )
			local f65_local6 = f65_local5 + f65_local2
			if f65_local5 == f65_local4 then
				return 
			elseif f65_local4 < f65_local6 then
				f65_local0:setActiveItem( f65_local0:getItemAtPosition( f65_local0.requestedRowCount, 1, true ) )
				return 
			else
				CoD.perController[f65_arg2].pivotPosition = f65_local6
				CoD.perController[f65_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.BOTTOM
				Engine.GetLeaderboardRow( f65_arg2, f65_local6, CoD.GetCombatRecordMode() )
			end
		end
	end
end

function Leaderboard_GoToTopOfList_Friends( f66_arg0, f66_arg1, f66_arg2 )
	local f66_local0 = GetListItem( f66_arg0, f66_arg1 )
	local f66_local1 = f66_local0:getItemAtPosition( 1, 1, true )
	if f66_local1 == f66_arg1 then
		return 
	elseif f66_local1 then
		f66_local0:setActiveItem( f66_local1 )
	end
end

function Leaderboard_GoToTopOfList_All( f67_arg0, f67_arg1, f67_arg2 )
	local f67_local0 = GetListItem( f67_arg0, f67_arg1 )
	local f67_local1 = f67_local0:getItemAtPosition( 1, 1, true )
	if tonumber( Engine.GetModelValue( Engine.GetModel( f67_local1:getModel(), "position" ) ) ) == 1 then
		if f67_local1 ~= f67_arg1 then
			f67_local0:setActiveItem( f67_local1 )
		end
		return 
	else
		CoD.perController[f67_arg2].pivotPosition = 1
		CoD.perController[f67_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
		Engine.GetLeaderboardRow( f67_arg2, 1, CoD.GetCombatRecordMode() )
	end
end

function Gunsmith_ClearItemName( f68_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f68_arg0 ), "Gunsmith.GunsmithSelectedItemProperties.itemName" ), "" )
end

function Gunsmith_RecordComScoreEvent( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4, f69_arg5 )
	local f69_local0 = 0
	if f69_arg0.occludedMenu and f69_arg0.occludedMenu.openTime then
		f69_local0 = Engine.milliseconds() - f69_arg0.occludedMenu.openTime
	end
	local f69_local1 = Engine.GetModelValue( Engine.GetModel( f69_arg2, "variantName" ) )
	local f69_local2 = Engine.GetModelValue( Engine.GetModel( f69_arg2, "weaponIndex" ) )
	local f69_local3 = CoD.CraftUtility.GetDDLRoot( f69_arg1, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f69_local4 = ""
	local f69_local5 = Engine.GetModelValue( Engine.GetModel( f69_arg2, "variantIndex" ) )
	local f69_local6 = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( f69_arg1, CoD.perController[f69_arg1].gunsmithVariantModel )
	for f69_local7 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f69_local10 = f69_local6.baseAttachmentList[f69_local7]
		if 0 < f69_local10 then
			if 0 < string.len( f69_local4 ) then
				f69_local4 = f69_local4 .. ","
			end
			f69_local4 = f69_local4 .. f69_local10
		end
	end
	LUI.CoDMetrics.GunsmithEvent( f69_arg1, f69_arg3, f69_local0, f69_local2, f69_local1, f69_local4, f69_arg4, f69_arg5 )
end

function Store_UpdatePSStoreIconCount( f70_arg0, f70_arg1 )
	if CoD.perController[f70_arg0].psStoreIconCount == nil then
		CoD.perController[f70_arg0].psStoreIconCount = 0
	end
	CoD.perController[f70_arg0].psStoreIconCount = math.max( CoD.perController[f70_arg0].psStoreIconCount + f70_arg1, 0 )
end

function ShouldUnloadMod( f71_arg0 )
	if Mods_IsUsingMods() and f71_arg0 and f71_arg0.unloadMod == true then
		return true
	else
		return false
	end
end

function CheckNavRestrictions( f72_arg0, f72_arg1, f72_arg2, f72_arg3 )
	if IsChunkDownloading( f72_arg1, f72_arg2 ) then
		OpenGenericSmallPopup( f72_arg0, f72_arg2, "PLATFORM_INSTALLATION_NEEDED", Engine.Localize( "PLATFORM_DOWNLOADING_CONTENT" ), "starterpack_install_dialog_pc", "MENU_OK" )
		return true
	elseif IsStarterPack( f72_arg2 ) and IsStarterPackRestrictedButton( f72_arg1, f72_arg2 ) then
		StarterParckPurchase( f72_arg0, f72_arg2, f72_arg3 )
		return true
	elseif IsStarterPackRestrictedButtonByParty( f72_arg1, f72_arg2 ) then
		OpenGenericSmallPopup( f72_arg0, f72_arg2, "MENU_WARNING", Engine.Localize( "PLATFORM_STARTER_PACK_MEMBER_MISSING_CONTENT" ), "starterpack_attention_dialog_pc", "MENU_OK" )
		return true
	elseif IsChunksRestrictedButtonByParty( f72_arg1, f72_arg2 ) then
		OpenGenericSmallPopup( f72_arg0, f72_arg2, "MENU_WARNING", Engine.Localize( "PLATFORM_MEMBER_MISSING_CONTENT" ), "starterpack_attention_dialog_pc", "MENU_OK" )
		return true
	elseif ShouldUnloadMod( f72_arg1 ) then
		CoD.ModsUtility.NeedToUnload( f72_arg0, f72_arg2, f72_arg3 )
		return true
	else
		return false
	end
end

function SelectLiveEventQuality_Internal( f73_arg0 )
	if f73_arg0 and f73_arg0 ~= Dvar.hls_quality:get() then
		Dvar.hls_quality:set( f73_arg0 )
		CoD.LiveEventUpdateCurrentFeed()
		local f73_local0 = DataSources.LiveEventViewer.getModel()
		if f73_local0 then
			local f73_local1 = Engine.GetModel( f73_local0, "stream" )
			if f73_local1 then
				Engine.ForceNotifyModelSubscriptions( f73_local1 )
			end
		end
		local f73_local1 = DataSources.VoDViewer.getModel()
		if f73_local1 then
			local f73_local2 = Engine.GetModel( f73_local1, "stream" )
			if f73_local2 then
				Engine.ForceNotifyModelSubscriptions( f73_local2 )
			end
		end
	end
end

function CallingCard_TrackCWLEquip( f74_arg0, f74_arg1 )
	if IsLive() and IsPerControllerTablePropertyValue( f74_arg0, "uploadProfile", true ) then
		local f74_local0 = Engine.GetEmblemBackgroundId()
		if CoD.StoreUtility.DoesInventoryItemExistsByName( Engine.TableLookup( nil, CoD.backgroundsTable, 1, f74_local0, 10 ) ) then
			LUI.CoDMetrics.InventoryItemEquipped( f74_arg0, Engine.TableLookup( nil, CoD.backgroundsTable, 1, f74_local0, 3 ), f74_local0, f74_arg1 )
		end
	end
end

function SetEmblemBackground_Internal( f75_arg0, f75_arg1 )
	if IsLive() then
		if f75_arg1 ~= Engine.GetEmblemBackgroundId() then
			Engine.ExecNow( f75_arg0, "emblemSelectBackground " .. f75_arg1 )
			CoD.perController[f75_arg0].uploadProfile = true
			Engine.ExecNow( f75_arg0, "emblemSetProfile" )
		end
	else
		Engine.ExecNow( f75_arg0, "emblemSelectBackground " .. f75_arg1 )
		Engine.SetProfileVar( f75_arg0, "default_background_index", f75_arg1 )
		Engine.ExecNow( f75_arg0, "invalidateEmblemComponent" )
	end
end

function FileshareCategorySelectorCategoryChanged( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
	if f76_arg1 ~= nil and f76_arg1 ~= "" then
		CoD.FileshareUtility.SetCurrentCategory( f76_arg1 )
	else
		CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	end
	if CoD.FileshareUtility.GetIsGroupsMode( f76_arg0 ) then
		local f76_local0 = Enum.FileshareGroupsDataType.FILESHARE_GROUPS_DATA_RECENT
		if f76_arg1 == "favorites" then
			f76_local0 = Enum.FileshareGroupsDataType.FILESHARE_GROUPS_DATA_FAVORITE
		elseif f76_arg1 == "featured" then
			f76_local0 = Enum.FileshareGroupsDataType.FILESHARE_GROUPS_DATA_FEATURED
		end
		Engine.FileshareFetchGroupContent( f76_arg0, f76_arg1, f76_local0 )
	elseif CoD.FileshareUtility.GetIsCommunityMode( f76_arg0 ) then
		Engine.FileshareFetchCommunityContent( f76_arg0, f76_arg1, f76_arg2 )
	elseif CoD.FileshareUtility.GetIsUserMode( f76_arg0 ) then
		local f76_local0 = CoD.FileshareUtility.GetCurrentUser()
		if f76_arg2 == Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT_GAMES then
			Engine.FileshareFetchCommunityContent( f76_arg0, CoD.FileshareUtility.RenameToFileshareTableCategory( f76_arg1 ), f76_arg2, f76_local0 )
		else
			CoD.FileshareUtility.FetchContentForUser( f76_arg0, f76_local0 )
		end
	end
	if f76_arg1 ~= CoD.FileshareUtility.GetPreviousCategory() or f76_arg3 == true then
		ResetThumbnailViewer( f76_arg0 )
		CoD.FileshareUtility.SetDirty()
	end
	CoD.FileshareUtility.ProcessUIIndex( f76_arg0, f76_arg1, 0 )
	CoD.FileshareUtility.SetPreviousCategory( f76_arg1 )
	if CoD.FileshareUtility.ShouldSetPreviewIconSizeShort( f76_arg1 ) then
		FileshareSetPreviewIconSizeShort()
	else
		FileshareSetPreviewIconSizeNormal()
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
end

function OpenShowcaseCustomGames( f77_arg0, f77_arg1, f77_arg2, f77_arg3, f77_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "customgame" )
	CoD.FileshareUtility.SetCurrentCategory( "customgame" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f77_local0 = false
	if FileshareIsCurrentUserContext( f77_arg2 ) and CoD.FileshareUtility.GetIsCommunityMode( f77_arg2 ) == false then
		f77_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f77_local0 )
	OpenOverlay( f77_arg0, "MyShowcase_CustomGames", f77_arg2 )
end

function OpenShowcaseScreenshots( f78_arg0, f78_arg1, f78_arg2, f78_arg3, f78_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "screenshot" )
	CoD.FileshareUtility.SetCurrentCategory( "screenshot" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f78_local0 = false
	if FileshareIsCurrentUserContext( f78_arg2 ) then
		f78_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f78_local0 )
	PreserveThumbnails( f78_arg2, true )
	OpenOverlay( f78_arg0, "MyShowcase_Screenshots", f78_arg2 )
	PreserveThumbnails( f78_arg2, false )
end

function OpenShowcaseRecentGames( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "recentgames" )
	CoD.FileshareUtility.SetCurrentCategory( "recentgames" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f79_local0 = false
	if FileshareIsCurrentUserContext( f79_arg2 ) then
		f79_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	OpenOverlay( f79_arg4, "MyShowcase_RecentGames", f79_arg2 )
end

function OpenShowcaseClips( f80_arg0, f80_arg1, f80_arg2, f80_arg3, f80_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "clip" )
	CoD.FileshareUtility.SetCurrentCategory( "clip" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f80_local0 = false
	if FileshareIsCurrentUserContext( f80_arg2 ) then
		f80_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f80_local0 )
	PreserveThumbnails( f80_arg2, true )
	OpenOverlay( f80_arg4, "MyShowcase_Clips", f80_arg2 )
	PreserveThumbnails( f80_arg2, false )
end

function OpenShowcaseLocalClips( f81_arg0, f81_arg1, f81_arg2, f81_arg3, f81_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "clip_private" )
	CoD.FileshareUtility.SetCurrentCategory( "clip_private" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f81_local0 = false
	if FileshareIsCurrentUserContext( f81_arg2 ) then
		f81_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	PreserveThumbnails( f81_arg2, true )
	OpenOverlay( f81_arg4, "MyShowcase_Clips", f81_arg2 )
	PreserveThumbnails( f81_arg2, false )
end

function PublishClip( f82_arg0, f82_arg1 )
	local f82_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f82_local1 = CoD.FileshareUtility.GetPublishName()
	local f82_local2 = CoD.FileshareUtility.GetPublishDescription()
	if Engine.SetupTransferData( f82_arg0, "clip_private", f82_local0, CoD.FileshareUtility.GetIsCommunityMode( f82_arg0 ) ) then
		Engine.PublishClip( f82_arg0, "clip", f82_local0, f82_local1, f82_local2 )
	else
		GoBack( f82_arg1, f82_arg0 )
		FileshareShowErrorToast( f82_arg1, nil, f82_arg0 )
	end
end

function PublishScreenshot( f83_arg0, f83_arg1 )
	local f83_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f83_local1 = CoD.FileshareUtility.GetPublishName()
	local f83_local2 = CoD.FileshareUtility.GetPublishDescription()
	if Engine.SetupTransferData( f83_arg0, "screenshot_private", f83_local0, CoD.FileshareUtility.GetIsCommunityMode( f83_arg0 ) ) then
		Engine.PublishScreenshot( f83_arg0, "screenshot", f83_local0, f83_local1, f83_local2 )
	else
		GoBack( f83_arg1, f83_arg0 )
		FileshareShowErrorToast( f83_arg1, nil, f83_arg0 )
	end
end

function FileshareUpdateDetailsViewModel( f84_arg0, f84_arg1, f84_arg2, f84_arg3 )
	local f84_local0 = CoD.FileshareUtility.GetCurrentCategory()
	local f84_local1, f84_local2 = CoD.FileshareUtility.GetCurrentFilter()
	local f84_local3 = nil
	if CoD.FileshareUtility.GetIsCommunityMode( f84_arg2 ) or CoD.FileshareUtility.GetIsGroupsMode( f84_arg2 ) then
		f84_local3 = Engine.FileshareGetCommunitySlotData( f84_arg2, f84_local0, f84_local1, f84_local2, f84_arg3 )
	else
		f84_local3 = Engine.FileshareGetSlotData( f84_arg2, f84_local0, f84_local1, f84_local2, f84_arg3 )
	end
	if CoD.FileshareUtility.GetIsGroupsMode( f84_arg2 ) then
		f84_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
	end
	local f84_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSelectedItem", false )
	for f84_local8, f84_local9 in ipairs( CoD.FileshareUtility.FileProperties ) do
		if f84_local3[f84_local9] ~= nil then
			Engine.SetModelValue( Engine.CreateModel( f84_local4, f84_local9 ), f84_local3[f84_local9] )
		end
	end
	Engine.SetModelValue( Engine.CreateModel( f84_local4, "codeIndex" ), f84_arg3 )
	f84_local6 = Engine.CreateModel( f84_local4, "showDetailsViewSpinner" )
	if Engine.GetModelValue( Engine.CreateModel( f84_local4, "renderFileId" ) ) == Engine.GetModelValue( Engine.CreateModel( f84_local4, "fileId" ) ) then
		Engine.SetModelValue( f84_local6, 0 )
	elseif f84_local0 ~= "emblem" then
		Engine.SetModelValue( f84_local6, 1 )
	end
	f84_local9 = ""
	if f84_local3.weaponIndex ~= nil then
		f84_local9 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f84_local3.weaponIndex ) ) )
	end
	Engine.SetModelValue( Engine.CreateModel( f84_local4, "weaponName" ), f84_local9 )
	CoD.FileshareUtility.SetSelectedItem( f84_local4 )
	f84_arg0:setModel( f84_local4, f84_arg2 )
	FileshareSetSelectedItem( f84_arg0, f84_arg1, f84_arg2, "true" )
	CoD.FileshareUtility.ProcessUIIndex( f84_arg2, f84_local0, f84_arg3 )
end

function MediaManagerGetQuotaForCategory( f85_arg0, f85_arg1 )
	local f85_local0 = nil
	if f85_arg1 == "screenshot_private" or f85_arg1 == "clip_private" then
		f85_local0 = Engine.FileshareGetQuota( f85_arg0, f85_arg1 )
	else
		f85_local0 = Engine.MediaManagerGetQuota( f85_arg0, f85_arg1 )
	end
	return f85_local0
end

function MediaManagerUpdateSlotsUsed( f86_arg0, f86_arg1 )
	if f86_arg1 then
		local f86_local0 = MediaManagerGetQuotaForCategory( f86_arg0, f86_arg1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "slotsUsed", false ), f86_local0.categorySlotsUsed )
	end
end

function MediaManagerSetSlotModel( f87_arg0, f87_arg1, f87_arg2, f87_arg3 )
	local f87_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local f87_local1 = Engine.CreateModel( f87_local0, "isBuyMoreSlot", false )
	local f87_local2 = Engine.CreateModel( f87_local0, "createTime", false )
	local f87_local3 = Engine.CreateModel( f87_local0, "authorName", false )
	Engine.SetModelValue( f87_local1, f87_arg1 )
	Engine.SetModelValue( f87_local2, f87_arg2 )
	Engine.SetModelValue( f87_local3, f87_arg3 )
	ForceNotifyGlobalModel( f87_arg0, "MediaManager.createTime" )
	ForceNotifyGlobalModel( f87_arg0, "MediaManager.authorName" )
end

function MediaManagerFetchPaintjobsData( f88_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f88_arg0 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	local f88_local0 = CoD.CraftUtility.Paintjobs.ParseDDL( f88_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function MediaManagerFetchVariantsData( f89_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f89_arg0 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local f89_local0 = CoD.CraftUtility.Gunsmith.ParseDDL( f89_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
end

function ShowcaseSetSelectedFriendXUID( f90_arg0, f90_arg1, f90_arg2, f90_arg3 )
	local f90_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorName" )
	local f90_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	local f90_local2 = Engine.GetPlayerInfo( f90_arg2, f90_local1 )
	local f90_local3 = Engine.GetModelForController( f90_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f90_local3, "Social.selectedFriendXUID" ), f90_local1 )
	Engine.SetModelValue( Engine.CreateModel( f90_local3, "Social.selectedFriendGamertag" ), f90_local0 )
	local f90_local4 = Engine.CreateModel( f90_local3, "Social.hideSelectedFriendShowcase" )
	if f90_arg3 ~= nil then
		Engine.SetModelValue( f90_local4, f90_arg3 )
	else
		Engine.SetModelValue( f90_local4, false )
	end
end

function AddGroupShowcaseItemToUnfeaturedList( f91_arg0, f91_arg1 )
	if not CoD.groupUnfeaturedList then
		CoD.groupUnfeaturedList = {}
	end
	local f91_local0 = tostring( f91_arg0 )
	if not CoD.groupUnfeaturedList[f91_local0] then
		CoD.groupUnfeaturedList[f91_local0] = {}
	end
	for f91_local4, f91_local5 in ipairs( CoD.groupUnfeaturedList[f91_local0] ) do
		if f91_local5 == f91_arg1 then
			return 
		end
	end
	table.insert( CoD.groupUnfeaturedList[f91_local0], f91_arg1 )
end

function RemoveGroupShowcaseItemFromUnfeaturedList( f92_arg0, f92_arg1 )
	local f92_local0 = tostring( f92_arg0 )
	if CoD.groupUnfeaturedList and CoD.groupUnfeaturedList[f92_local0] then
		for f92_local4, f92_local5 in ipairs( CoD.groupUnfeaturedList[f92_local0] ) do
			if f92_local5 == f92_arg1 then
				table.remove( CoD.groupUnfeaturedList[f92_local0], f92_local4 )
				break
			end
		end
	end
end

function LoginRewardConfirmationAction( f93_arg0 )
	if not DoesPlayerHaveCurrentLoginReward( f93_arg0 ) then
		local f93_local0 = 1
		local f93_local1 = CoD.attachmentTable
		local f93_local2 = "overgrowth_camo"
		local f93_local3 = 21
		local f93_local4 = 6
		local f93_local5 = 4
		local f93_local6 = 7
		local f93_local7 = Engine.StorageGetBuffer( f93_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		for f93_local11, f93_local12 in pairs( CoD.LoginRewardReceivedStatPath ) do
			f93_local7 = f93_local7[f93_local12]
		end
		f93_local7:set( f93_local0 )
		Engine.StorageWrite( f93_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		CoD.OverlayUtility.ShowToast( "LootBonusCamo", Engine.Localize( Engine.TableLookup( nil, f93_local1, f93_local3, f93_local2, f93_local6 ) ), Engine.Localize( "MPUI_CAMO" ), Engine.TableLookup( nil, f93_local1, f93_local3, f93_local2, f93_local4 ), nil, nil, nil )
	end
end

function SetNextPreStartPopup( f94_arg0, f94_arg1 )
	if f94_arg1 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f94_arg0 ), "PreStart.NextPopup" ), f94_arg1 )
	end
end

function ProceedToNextPreStartPopup( f95_arg0, f95_arg1, f95_arg2 )
	local f95_local0 = Engine.CreateModel( Engine.GetModelForController( f95_arg1 ), "PreStart.NextPopup" )
	local f95_local1 = Engine.GetModelValue( f95_local0 )
	Engine.SetModelValue( f95_local0, "" )
	if f95_local1 == "LoginReward" then
		OpenLoginRewardPopup( GoBack( f95_arg2, f95_arg1 ), f95_arg1 )
		return 
	elseif f95_local1 == "ZMHDPurchaseReward" then
		OpenZMHDPurchaseRewardPopup( GoBack( f95_arg2, f95_arg1 ), f95_arg1 )
		return 
	elseif f95_local1 == "ZMHDGobbleGumPS4" then
		OpenZMHDGobbleGumPopup( GoBack( f95_arg2, f95_arg1 ), f95_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID )
		return 
	elseif f95_local1 == "ZMHDGobbleGumXB1" then
		OpenZMHDGobbleGumPopup( GoBack( f95_arg2, f95_arg1 ), f95_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID )
		return 
	elseif f95_local1 == "URMFirstTime" then
		OpenURMFirstTimePopup( GoBack( f95_arg2, f95_arg1 ), f95_arg1 )
		return 
	else
		Close( f95_arg0, f95_arg1 )
	end
end

