function IsCurrentLanguageTextEqualTo( testLanguage )
	local currentLanguage = Engine.GetLanguage()
	local f1_local0
	if testLanguage ~= currentLanguage and (testLanguage ~= "japanese" or currentLanguage ~= "fulljapanese") and (testLanguage ~= "arabic" or currentLanguage ~= "englisharabic") and (testLanguage ~= "chinese" or currentLanguage ~= "simplifiedchinese" and currentLanguage ~= "traditionalchinese") then
		f1_local0 = false
	else
		f1_local0 = true
	end
	return f1_local0
end

function GetKillsAndOrDestroyedStat( itemIndex, killsStatValue, destroysStatValue )
	local statValue = killsStatValue
	local itemGroup = Engine.GetItemGroup( itemIndex, CoD.GetCombatRecordMode() )
	if itemGroup == "weapon_launcher" then
		statValue = killsStatValue + destroysStatValue
	end
	return statValue
end

function GetSocialCachedValue( modelPath, default )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelPath )
	local f3_local0 = model
	local value = Engine.GetModelValue( model )
	return f3_local0 and value
end

function GetAttachmentMenuSelectTitle( controller, weaponSlotModelName, attachmentOpticString )
	local classModel = CoD.perController[controller].classModel
	local localizedAttachmentTitle = Engine.Localize( attachmentOpticString )
	if classModel then
		local weaponNameModel = Engine.GetModel( classModel, weaponSlotModelName )
		if weaponNameModel then
			local weaponName = Engine.GetModelValue( weaponNameModel )
			localizedAttachmentTitle = weaponName .. " " .. localizedAttachmentTitle
		end
	end
	return localizedAttachmentTitle
end

function GetRemoveItemString( controller, singularString, pluralString )
	local removeString = singularString
	local perControllerModel = Engine.GetModelForController( controller )
	local currentVariantNameModel = Engine.GetModel( perControllerModel, "CACMenu.curWeaponVariantName" )
	local numOfItemsToRemoveModel = Engine.GetModel( perControllerModel, "CACMenu.numItemsToRemove" )
	local currentVariantName = Engine.GetModelValue( currentVariantNameModel )
	local numOfItemsToRemove = Engine.GetModelValue( numOfItemsToRemoveModel )
	if numOfItemsToRemove > 1 then
		removeString = pluralString
	end
	return Engine.Localize( removeString, numOfItemsToRemove, currentVariantName )
end

function GetMedalInfo( medalIndex )
	if medalIndex then
		local medalRef = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AARUtility.medalrefCol )
		return Engine.GetMedalInfo( medalRef )
	else
		
	end
end

function GetPresenceActivityString( info )
	local enumVal = tonumber( info.activity )
	local locstr = CoD.LobbyUtility.Presence.ActivityStrings[enumVal]
	if locstr ~= nil then
		local mapNameStringRef = CoD.BaseUtility.GetMapValueFromMapId( info.mapid, "mapName", "MENU_MAP" )
		if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP then
			return Engine.Localize( locstr, mapNameStringRef )
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP then
			return Engine.Localize( locstr, mapNameStringRef )
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP then
			local gametype = info.gametype
			local freerunGametypeId = CoD.SocialUtility.GetFreerunGametypeId()
			if gametype == freerunGametypeId then
				return Engine.Localize( "PRESENCE_RUNNING_ON_MAPNAME", Engine.Localize( mapNameStringRef ) )
			end
			local gameTypeName = Engine.GetGameTypeNameForID( gametype )
			local gameTypeInfo = Engine.GetGameTypeInfo( gameTypeName )
			if gameTypeInfo then
				local f7_local0 = gameTypeInfo.nameRefCaps
				if not f7_local0 then
				
				else
					return Engine.Localize( locstr, Engine.Localize( f7_local0 ), Engine.Localize( mapNameStringRef ) )
				end
			end
			local gameTypeStringRef = ""
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND then
			local difficulty = info.difficulty
			if difficulty == nil or difficulty == 0 then
				difficulty = 1
			end
			return Engine.Localize( locstr, Engine.Localize( mapNameStringRef ), difficulty )
		else
			return Engine.Localize( locstr )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function GetPresenceContextString( info )
	local enumVal = tonumber( info.context )
	local locstr = CoD.LobbyUtility.Presence.ContextStrings[enumVal]
	if locstr ~= nil then
		if info.mapid == CoD.BaseUtility.GetMapValue( "cp_doa_bo3", "unique_id", -1 ) then
			if enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
				return Engine.Localize( "PRESENCE_ZM_PRIVATE_GAME" )
			elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
				return Engine.Localize( "PRESENCE_ZM_MATCHMADE_GAME" )
			end
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
			local difficulty = info.difficulty or 1
			return Engine.Localize( locstr, Engine.Localize( CoD.CPUtility.DIFFICULTY[difficulty] ) )
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
			local difficulty = info.difficulty or 1
			return Engine.Localize( locstr, Engine.Localize( CoD.CPUtility.DIFFICULTY[difficulty] ) )
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_MP_PUBLIC_MATCH then
			local playlistId = info.playlist or 0
			if playlistId > 0 then
				local playlistName = Engine.GetPlaylistName( 0, playlistId )
				if playlistName ~= "" then
					local playlistCategoryName = Engine.GetPlaylistCategoryName( 0, playlistId )
					if playlistCategoryName ~= "" then
						return Engine.Localize( locstr, playlistCategoryName, playlistName )
					end
				end
			end
			return Engine.Localize( "PRESENCE_PUBLIC_MATCH" )
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_MP_CUSTOM_GAMES then
			local gametype = info.gametype
			local freerunGametypeId = CoD.SocialUtility.GetFreerunGametypeId()
			if gametype == freerunGametypeId then
				local gameTypeName = Engine.GetGameTypeNameForID( gametype )
				local gameTypeInfo = Engine.GetGameTypeInfo( gameTypeName )
				if gameTypeInfo then
					local f8_local0 = gameTypeInfo.nameRef
					if not f8_local0 then
					
					else
						return Engine.Localize( f8_local0 )
					end
				end
				local gameTypeStringRef = ""
			end
		end
		return Engine.Localize( locstr )
	end
	return Engine.Localize( "NULL_EMPTY" )
end

function ShouldShowObjectiveForPlayer( controller, clientNum, objective )
	local gameType = Engine.GetDvarString( "g_gametype" )
	if gameType ~= nil then
		if gameType == "ctf" then
			if Engine.GetObjectiveEntity( controller, objective.id ) == clientNum then
				return true
			end
		elseif gameType == "dom" then
			local objectiveTeam = Engine.GetObjectiveTeam( controller, objective.id )
			local clientTeam = Engine.GetTeamID( controller, clientNum )
			if objectiveTeam == clientTeam then
				return false
			else
				return true
			end
		elseif gameType == "dem" then
			return true
		elseif gameType == "koth" then
			return true
		elseif gameType == "sd" then
			return true
		elseif gameType == "ball" then
			if Engine.GetObjectiveEntity( controller, objective.id ) == clientNum then
				return true
			end
		elseif gameType == "escort" then
			local objectiveTeam = Engine.GetObjectiveTeam( controller, objective.id )
			local clientTeam = Engine.GetTeamID( controller, clientNum )
			if objectiveTeam == clientTeam then
				return true
			end
		end
	end
	return false
end

function ShouldShowColorForObjective( controller, clientNum, objective )
	local gameType = Engine.GetDvarString( "g_gametype" )
	if gameType ~= nil and gameType == "ball" then
		return false
	else
		return true
	end
end

function ValidateEmblemBackground( controller, emblemId )
	if Engine.IsEmblemBackgroundLocked( controller, emblemId ) then
		local newBackgroundId = 0
		SetEmblemBackground_Internal( controller, newBackgroundId )
		if not IsLive() then
			Engine.CommitProfileChanges( controller )
		else
			UploadPublicProfile( nil, controller )
		end
		return newBackgroundId
	else
		return emblemId
	end
end

function GetNumberOfBarsForHealth( controller )
	local clientNum = Engine.GetClientNum( controller )
	local renderOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
	local f12_local0 = renderOptions
	local traits = Engine.GetPlayerRoleTraits( controller, clientNum, Engine.CurrentSessionMode(), renderOptions.characterIndex )
	local f12_local1 = f12_local0 and traits
	local healthPerBar = Dvar.cg_healthPerBar:get()
	local numBars = 100 / healthPerBar
	if f12_local1 then
		numBars = f12_local1.spawnHealth / healthPerBar
	end
	return numBars
end

