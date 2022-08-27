-- aa8e022fe13d405116d4686f34dd5580
-- This hash is used for caching, delete to decompile the file again

function IsCurrentLanguageTextEqualTo( f1_arg0 )
	local f1_local0 = Engine.GetLanguage()
	local f1_local1
	if f1_arg0 ~= f1_local0 and (f1_arg0 ~= "japanese" or f1_local0 ~= "fulljapanese") and (f1_arg0 ~= "arabic" or f1_local0 ~= "englisharabic") and (f1_arg0 ~= "chinese" or f1_local0 ~= "simplifiedchinese" and f1_local0 ~= "traditionalchinese") then
		f1_local1 = false
	else
		f1_local1 = true
	end
	return f1_local1
end

function GetKillsAndOrDestroyedStat( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg1
	if Engine.GetItemGroup( f2_arg0, CoD.GetCombatRecordMode() ) == "weapon_launcher" then
		f2_local0 = f2_arg1 + f2_arg2
	end
	return f2_local0
end

function GetSocialCachedValue( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetModel( Engine.GetGlobalModel(), f3_arg0 )
	return f3_local0 and Engine.GetModelValue( f3_local0 )
end

function GetAttachmentMenuSelectTitle( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = CoD.perController[f4_arg0].classModel
	local f4_local1 = Engine.Localize( f4_arg2 )
	if f4_local0 then
		local f4_local2 = Engine.GetModel( f4_local0, f4_arg1 )
		if f4_local2 then
			f4_local1 = Engine.GetModelValue( f4_local2 ) .. " " .. f4_local1
		end
	end
	return f4_local1
end

function GetRemoveItemString( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = f5_arg1
	local f5_local1 = Engine.GetModelForController( f5_arg0 )
	local f5_local2 = Engine.GetModel( f5_local1, "CACMenu.curWeaponVariantName" )
	local f5_local3 = Engine.GetModel( f5_local1, "CACMenu.numItemsToRemove" )
	local f5_local4 = Engine.MarkAsLocalize( Engine.GetModelValue( f5_local2 ) )
	local f5_local5 = Engine.GetModelValue( f5_local3 )
	if f5_local5 > 1 then
		f5_local0 = f5_arg2
	end
	return Engine.Localize( f5_local0, f5_local5, f5_local4 )
end

function GetMedalInfo( f6_arg0 )
	if f6_arg0 then
		return Engine.GetMedalInfo( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f6_arg0, CoD.AARUtility.medalrefCol ) )
	else
		
	end
end

function GetPresenceActivityString( f7_arg0 )
	local f7_local0 = tonumber( f7_arg0.activity )
	local f7_local1 = CoD.Presence.ActivityStrings[f7_local0]
	if f7_local1 ~= nil then
		local f7_local2 = CoD.GetMapValueFromMapId( f7_arg0.mapid, "mapName", "MENU_MAP" )
		if f7_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP then
			return Engine.Localize( f7_local1, f7_local2 )
		elseif f7_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP then
			return Engine.Localize( f7_local1, f7_local2 )
		elseif f7_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP then
			local f7_local3 = f7_arg0.gametype
			if f7_local3 == CoD.SocialUtility.GetFreerunGametypeId() then
				return Engine.Localize( "PRESENCE_RUNNING_ON_MAPNAME", Engine.Localize( f7_local2 ) )
			else
				local f7_local4
				if f7_local3 then
					f7_local4 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "id", tostring( f7_local3 ), "name_ref_caps" )
					if not f7_local4 then
					
					else
						return Engine.Localize( f7_local1, Engine.Localize( f7_local4 ), Engine.Localize( f7_local2 ) )
					end
				end
			end
			f7_local4 = ""
		elseif f7_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND then
			local f7_local3 = f7_arg0.difficulty
			if f7_local3 == nil or f7_local3 == 0 then
				f7_local3 = 1
			end
			return Engine.Localize( f7_local1, Engine.Localize( f7_local2 ), f7_local3 )
		else
			return Engine.Localize( f7_local1 )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function GetPresenceContextString( f8_arg0 )
	local f8_local0 = tonumber( f8_arg0.context )
	local f8_local1 = CoD.Presence.ContextStrings[f8_local0]
	if f8_local1 ~= nil then
		if f8_arg0.mapid == CoD.GetMapValue( "cp_doa_bo3", "unique_id", -1 ) then
			if f8_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
				return Engine.Localize( "PRESENCE_ZM_PRIVATE_GAME" )
			elseif f8_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
				return Engine.Localize( "PRESENCE_ZM_MATCHMADE_GAME" )
			end
		elseif f8_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
			return Engine.Localize( f8_local1, Engine.Localize( CoD.DIFFICULTY[f8_arg0.difficulty or 1] ) )
		elseif f8_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
			return Engine.Localize( f8_local1, Engine.Localize( CoD.DIFFICULTY[f8_arg0.difficulty or 1] ) )
		elseif f8_local0 == Enum.PresenceCtx.PRESENCE_CTX_MP_PUBLIC_MATCH then
			local f8_local2 = f8_arg0.playlist or 0
			if f8_local2 > 0 then
				local f8_local3 = Engine.GetPlaylistName( 0, f8_local2 )
				if f8_local3 ~= "" then
					local f8_local4 = Engine.GetPlaylistCategoryName( 0, f8_local2 )
					if f8_local4 ~= "" then
						return Engine.Localize( f8_local1, f8_local4, f8_local3 )
					end
				end
			end
			return Engine.Localize( "PRESENCE_PUBLIC_MATCH" )
		elseif f8_local0 == Enum.PresenceCtx.PRESENCE_CTX_MP_CUSTOM_GAMES then
			local f8_local2 = f8_arg0.gametype
			if f8_local2 == CoD.SocialUtility.GetFreerunGametypeId() then
				local f8_local4
				if f8_local2 then
					f8_local4 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "id", tostring( f8_local2 ), "name_ref" )
					if not f8_local4 then
					
					else
						return Engine.Localize( f8_local4 )
					end
				end
				f8_local4 = ""
			end
		end
		return Engine.Localize( f8_local1 )
	end
	return Engine.Localize( "NULL_EMPTY" )
end

function GetPresencePartyActivityString( f9_arg0, f9_arg1 )
	if f9_arg0 ~= nil and f9_arg1 ~= nil then
		if f9_arg0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
			return "MENU_OFFLINE"
		elseif f9_arg0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f9_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
			return Engine.Localize( "PRESENCE_MAIN_MENU_IN_PARTY", f9_arg1 )
		elseif f9_arg0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f9_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
			return Engine.Localize( "PRESENCE_CAMPAIGN_IN_PARTY", f9_arg1 )
		elseif f9_arg0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f9_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
			return Engine.Localize( "PRESENCE_MULTIPLAYER_IN_PARTY", f9_arg1 )
		elseif f9_arg0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f9_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
			return Engine.Localize( "PRESENCE_ZOMBIES_IN_PARTY", f9_arg1 )
		end
	end
	return Engine.Localize( "NULL_EMPTY" )
end

function GetPresencePrimaryGroupString( f10_arg0 )
	local f10_local0 = f10_arg0.primaryGroup
	if f10_local0 ~= nil and f10_local0 ~= "" then
		return Engine.Localize( "MENU_PRIMARY_GROUP_COLON" ) .. " " .. f10_local0
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function ShouldShowObjectiveForPlayer( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = Engine.DvarString( nil, "g_gametype" )
	if f11_local0 ~= nil then
		if f11_local0 == "ctf" then
			if Engine.GetObjectiveEntity( f11_arg0, f11_arg2.id ) == f11_arg1 then
				return true
			end
		elseif f11_local0 == "dom" then
			if Engine.GetObjectiveTeam( f11_arg0, f11_arg2.id ) == Engine.GetTeamID( f11_arg0, f11_arg1 ) then
				return false
			else
				return true
			end
		elseif f11_local0 == "dem" then
			return true
		elseif f11_local0 == "koth" then
			return true
		elseif f11_local0 == "sd" then
			return true
		elseif f11_local0 == "ball" then
			if Engine.GetObjectiveEntity( f11_arg0, f11_arg2.id ) == f11_arg1 then
				return true
			end
		elseif f11_local0 == "escort" and Engine.GetObjectiveTeam( f11_arg0, f11_arg2.id ) == Engine.GetTeamID( f11_arg0, f11_arg1 ) then
			return true
		end
	end
	return false
end

function ShouldShowColorForObjective( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = Engine.DvarString( nil, "g_gametype" )
	if f12_local0 ~= nil and f12_local0 == "ball" then
		return false
	else
		return true
	end
end

function ValidateEmblemBackground( f13_arg0, f13_arg1 )
	if not IsCommunityContractCallingCardById( f13_arg1 ) and Engine.IsEmblemBackgroundLocked( f13_arg0, f13_arg1 ) then
		local f13_local0 = 0
		if not IsLive() then
			if CoD.StoreUtility.IsCWLBackgroundAvailableOffline( f13_arg0, f13_arg1 ) then
				return f13_arg1
			end
			SetEmblemBackground_Internal( f13_arg0, f13_local0 )
			Engine.CommitProfileChanges( f13_arg0 )
		else
			SetEmblemBackground_Internal( f13_arg0, f13_local0 )
			UploadPublicProfile( nil, f13_arg0 )
		end
		return f13_local0
	else
		return f13_arg1
	end
end

