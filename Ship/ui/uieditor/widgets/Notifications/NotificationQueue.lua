-- 92d9b8e614a8080c8f061e2fedb50a9f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueue" )

local f0_local0 = 1.5
local f0_local1 = 250
local f0_local2 = 500
local f0_local3 = 0
local f0_local4 = 250
local f0_local5 = 0.75
local f0_local6 = 0.65
local f0_local7 = {
	CamoChallenges = "184 234 255",
	ReticleChallenges = "239 88 57",
	Challenges = "230 222 134",
	WeaponLevelUp = "107 42 187",
	RankUp = "69 218 255",
	SpecialistChallenges = "247 204 15",
	DailyContract = "168 162 124",
	WeeklyContract = "168 162 124",
	SideBetChallenges = "168 162 124",
	SpecialContract = "168 162 124"
}
local f0_local8 = {
	Medal = 3
}
local f0_local9 = {
	Medal = 2300,
	CamoChallenges = 2000,
	ReticleChallenges = 2000,
	Challenges = 2000,
	WeaponLevelUp = 2000,
	RankUp = 3000,
	SpecialistChallenges = 2000,
	TrialComplete = 3000,
	DailyContract = 2000,
	WeeklyContract = 2000,
	SideBetChallenges = 2000,
	SpecialContract = 2000
}
local f0_local10 = {
	Medal = 1,
	CamoChallenges = 2,
	ReticleChallenges = 3,
	Challenges = 4,
	WeaponLevelUp = 5,
	SpecialistChallenges = 6,
	RankUp = 7,
	TrialComplete = 8,
	DailyContract = 9,
	WeeklyContract = 10,
	SideBetChallenges = 11,
	SpecialContract = 12
}
local f0_local11 = function ( f1_arg0, f1_arg1 )
	if not IsMultiplayer() then
		return false
	else
		local f1_local0, f1_local1 = CoD.ChallengesUtility.GetChallengeRewardDisplayTier( f1_arg0.rewardInfo )
		local f1_local2, f1_local3 = CoD.ChallengesUtility.GetChallengeRewardDisplayTier( f1_arg1.rewardInfo )
		if f1_local1 == f1_local3 then
			return f1_local2 < f1_local0
		else
			return false
		end
	end
end

local f0_local12 = {
	CamoChallenges = f0_local11,
	ReticleChallenges = f0_local11,
	Challenges = f0_local11,
	SpecialistChallenges = f0_local11
}
local f0_local13 = nil
local f0_local14 = {}
local f0_local15 = {}
local f0_local16 = {}
local f0_local17, f0_local18, f0_local19, f0_local20, f0_local21, f0_local22, f0_local23, f0_local24 = nil
local f0_local25 = "t7_hud_mp_notifications_xp_blue"
local f0_local26 = function ( f2_arg0, f2_arg1 )
	if not (not CoD.IsShoutcaster( f2_arg1.controller ) or CoD.ShoutcasterProfileVarBool( f2_arg1.controller, "shoutcaster_playernotifications" )) or Engine.IsVisibilityBitSet( f2_arg0.controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) or Engine.IsVisibilityBitSet( f2_arg0.controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) then
		f2_arg0:setAlpha( 0 )
	else
		f2_arg0:setAlpha( 1 )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	self.controller = controller
	self.menu = menu
	self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationQueue" ) )
	self.clearNotificationQueue = f0_local23
	self.notificationQueueEmptyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationQueueEmpty" )
	Engine.SetModelValue( self.notificationQueueEmptyModel, true )
	self.availableNotificationModels = {}
	local f3_local0 = 0
	for f3_local4, f3_local5 in pairs( f0_local8 ) do
		if f3_local0 < f3_local5 then
			f3_local0 = f3_local5
		end
	end
	f3_local0 = f3_local0 + 1
	for f3_local1 = 1, f3_local0, 1 do
		table.insert( self.availableNotificationModels, Engine.CreateModel( self:getModel(), "Notification" .. f3_local1 ) )
	end
	self.notificationWidgetsBeingShown = {}
	self.notificationQueue = {}
	self.streamedImages = {}
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f4_local1 = {
			controller = controller,
			name = modelValue,
			data = CoD.GetScriptNotifyData( model )
		}
		if modelValue == "medal_received" then
			f0_local19( self, f4_local1 )
		elseif modelValue == "challenge_complete" then
			local f4_local2 = {
				challengeID = f4_local1.data[1],
				itemIndex = f4_local1.data[2],
				challengeType = f4_local1.data[3],
				tableNumber = f4_local1.data[4],
				row = f4_local1.data[5],
				maxVal = f4_local1.data[6],
				rewardXP = f4_local1.data[7],
				type = "Challenges"
			}
			if CoD.ChallengesUtility.IsSpecialistTransmissionChallenge( f4_local2.challengeType, f4_local2.tableNumber, f4_local2.row ) or CoD.ChallengesUtility.IsTerribleKnifeChallenge( f4_local2.challengeType, f4_local2.tableNumber, f4_local2.row ) or CoD.ChallengesUtility.IsHiddenPostShipChallenge( f4_local2.challengeType, f4_local2.tableNumber, f4_local2.row ) or CoD.ChallengesUtility.IsSpecialContractChallenge( f4_local2.challengeType, f4_local2.tableNumber, f4_local2.row ) then
				return 
			end
			f4_local2.rewardInfo = CoD.ChallengesUtility.GetChallengeRewardInfo( controller, f4_local2.tableNumber, f4_local2.row, f4_local2.challengeType, f4_local2.itemIndex, Engine.GetEquippedHero( controller, Engine.CurrentSessionMode() ) )
			if f4_local2.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
				local f4_local3 = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
				Engine.RecordDailyChallengeCompleted( controller, f4_local2.challengeID, f4_local3.PlayerStatsList.ZM_DAILY_CHALLENGE_START_TIME.statValue:get(), f4_local3.PlayerStatsList.ZM_DAILY_CHALLENGE_INGAME_TIME.statValue:get(), f4_local3.PlayerStatsList.ZM_DAILY_CHALLENGE_GAMES_PLAYED.statValue:get() )
			end
			f0_local17( self, f4_local2, {
				f4_local2.rewardInfo.icon
			} )
		elseif modelValue == "gun_level_complete" then
			f0_local13( self, {
				rank = f4_local1.data[1],
				itemIndex = f4_local1.data[2],
				attachmentIndex = f4_local1.data[3],
				rewardXP = f4_local1.data[4],
				type = "WeaponLevelUp"
			} )
		elseif modelValue == "rank_up" then
			f0_local13( self, {
				rank = f4_local1.data[1],
				prestige = f4_local1.data[2],
				unlockTokensAdded = f4_local1.data[3],
				type = "RankUp"
			} )
		elseif modelValue == "trial_complete" then
			f0_local13( self, {
				name = f4_local1.data[1],
				description = f4_local1.data[2],
				icon = f4_local1.data[3],
				type = "TrialComplete"
			} )
		elseif modelValue == "clear_notification_queue" then
			f0_local23( self )
		elseif modelValue == "mp_daily_challenge_complete" then
			f0_local13( self, {
				index = f4_local1.data[1],
				showRewards = f4_local1.data[2] ~= 0,
				type = "DailyContract"
			} )
		elseif modelValue == "mp_weekly_challenge_complete" then
			f0_local13( self, {
				index = f4_local1.data[1],
				showRewards = f4_local1.data[2] ~= 0,
				type = "WeeklyContract"
			} )
		elseif modelValue == "mp_special_contract_complete" then
			f0_local13( self, {
				index = f4_local1.data[1],
				showRewards = f4_local1.data[2] ~= 0,
				type = "SpecialContract"
			} )
		end
	end )
	self:registerEventHandler( "notification_time_up", function ( element, event )
		if event.notificationContainer.fadingOffQueue then
			return 
		end
		event.notificationContainer.timeUp = true
		if event.notificationContainer.widget:hasClip( "TimeUp" ) then
			event.notificationContainer.widget:playClip( "TimeUp" )
			event.notificationContainer.widget:registerEventHandler( "clip_over", function ( element, event )
				f0_local20( element )
			end )
		else
			event.notificationContainer:beginAnimation( "time_up", f0_local2 )
			event.notificationContainer:setAlpha( 0 )
			event.notificationContainer:registerEventHandler( "transition_complete_time_up", function ( element, event )
				f0_local20( element )
			end )
		end
	end )
	self:registerEventHandler( "queue_done_animating", function ( element, event )
		element.queueAnimating = nil
		f0_local22( element )
	end )
	f3_local1 = function ( f9_arg0 )
		f0_local26( self, {
			controller = controller
		} )
	end
	
	if IsMultiplayer() then
		f3_local2 = Engine.GetModelForController( controller )
		self:subscribeToModel( Engine.GetModel( f3_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f3_local1 )
		self:subscribeToModel( Engine.GetModel( f3_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f3_local1 )
		self:subscribeToModel( Engine.GetModel( f3_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), f3_local1 )
		self:subscribeToModel( Engine.GetModel( f3_local2, "CodCaster.profileSettingsUpdated" ), f3_local1 )
	end
end

f0_local13 = function ( f10_arg0, f10_arg1 )
	if Engine.IsVisibilityBitSet( f10_arg0.controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		return 
	end
	f10_arg1.priority = f0_local10[f10_arg1.type]
	local f10_local0 = 1
	while f10_local0 <= #f10_arg0.notificationQueue do
		local f10_local1 = f10_arg0.notificationQueue[f10_local0]
		if f10_arg1.priority < f10_local1.priority then
			break
		elseif f10_arg1.type == f10_local1.type and f0_local12[f10_arg1.type] and f0_local12[f10_arg1.type]( f10_arg1, f10_local1 ) then
			break
		end
		f10_local0 = f10_local0 + 1
	end
	table.insert( f10_arg0.notificationQueue, f10_local0, f10_arg1 )
	f0_local22( f10_arg0 )
end

f0_local17 = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = {}
	local f11_local1
	if f11_arg2 then
		f11_local1 = #f11_arg2
		if not f11_local1 then
		
		else
			local f11_local2 = false
			for f11_local7, f11_local8 in ipairs( f11_arg2 ) do
				if f11_local8 and f11_local8 ~= "" then
					f11_local2 = true
					local self = LUI.UIImage.new()
					f11_arg0.streamedImages[self] = true
					table.insert( f11_local0, self )
					self:setAlpha( 0 )
					self:setImage( RegisterImage( f11_local8 ) )
					self:setupUIStreamedImage( 4000 )
					self:registerEventHandler( "streamed_image_ready", function ( element, event )
						f11_arg0.streamedImages[self] = nil
						f11_local1 = f11_local1 - 1
						if f11_local1 == 0 then
							local f12_local0 = LUI.ShallowCopy( f11_arg1 )
							f12_local0.streamedImages = f11_local0
							f0_local13( f11_arg0, f12_local0 )
						end
					end )
					self:registerEventHandler( "streamed_image_timed_out", function ( element, event )
						for f13_local3, f13_local4 in ipairs( f11_local0 ) do
							f11_arg0.streamedImages[f13_local4] = nil
							f13_local4:close()
						end
					end )
					f11_arg0:addElement( self )
				end
			end
			if not f11_local2 then
				f0_local13( f11_arg0, f11_arg1 )
			end
		end
	end
	f11_local1 = 0
end

f0_local15.Medal = function ( f14_arg0, f14_arg1 )
	if not f14_arg0.numStacks then
		f14_arg0.numStacks = 2
	else
		f14_arg0.numStacks = f14_arg0.numStacks + 1
	end
	Engine.SetModelValue( Engine.CreateModel( f14_arg0.widget:getModel(), "subtitle" ), "x" .. f14_arg0.numStacks )
end

f0_local14.Medal = function ( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0, f15_local1, f15_local2, f15_local3 = f0_local18( f15_arg1.scoreInfoIndex )
	local f15_local4 = Engine.CreateModel( f15_arg2, "backing" )
	local f15_local5 = Engine.CreateModel( f15_arg2, "icon" )
	local f15_local6 = Engine.CreateModel( f15_arg2, "title" )
	local f15_local7 = Engine.CreateModel( f15_arg2, "subtitle" )
	Engine.SetModelValue( f15_local6, f15_local0 )
	Engine.SetModelValue( f15_local7, "" )
	Engine.SetModelValue( f15_local5, f15_local1 )
	Engine.SetModelValue( f15_local4, f15_local2 )
	return CoD[f15_local3].new( f15_arg0.menu, f15_arg0.controller )
end

f0_local14.WeaponLevelUp = function ( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = Engine.CreateModel( f16_arg2, "icon" )
	local f16_local1 = Engine.CreateModel( f16_arg2, "title" )
	local f16_local2 = Engine.CreateModel( f16_arg2, "subtitle" )
	local f16_local3 = Engine.CreateModel( f16_arg2, "color" )
	Engine.SetModelValue( f16_local1, Engine.Localize( Engine.GetItemName( f16_arg1.itemIndex ) ) )
	Engine.SetModelValue( f16_local2, Engine.Localize( "MPUI_LEVEL_N", f16_arg1.rank + 2 ) )
	Engine.SetModelValue( f16_local0, Engine.GetItemImage( f16_arg1.itemIndex ) .. "_pu" )
	Engine.SetModelValue( f16_local3, f0_local7[f16_arg1.type] )
	if f16_arg1.rewardXP and f16_arg1.rewardXP > 0 then
		f16_arg0.NotificationRewardQueue:addReward( f0_local7[f16_arg1.type], f0_local25, Engine.Localize( "RANK_XP", f16_arg1.rewardXP * Engine.GetXPScale( f16_arg0.controller ) ) )
	end
	local f16_local4 = f16_arg1.attachmentIndex
	if f16_local4 and f16_local4 ~= 0 then
		f16_arg0.NotificationRewardQueue:addReward( f0_local7[f16_arg1.type], Engine.GetAttachmentUniqueImageByAttachmentIndex( Engine.CurrentSessionMode(), f16_arg1.itemIndex, f16_local4 ) .. "_rwd", Engine.Localize( Engine.GetAttachmentNameByIndex( f16_local4 ) ) )
	end
	return CoD.WeaponLevelUpNotification.new( f16_arg0.menu, f16_arg0.controller )
end

f0_local14.RankUp = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = Engine.CreateModel( f17_arg2, "icon" )
	local f17_local1 = Engine.CreateModel( f17_arg2, "title" )
	local f17_local2 = Engine.CreateModel( f17_arg2, "subtitle" )
	local f17_local3 = Engine.CreateModel( f17_arg2, "color" )
	local f17_local4 = IsInParagonCapableGameMode()
	if f17_local4 then
		f17_local4 = f17_arg1.prestige == Engine.GetPrestigeCap()
	end
	local f17_local5 = ""
	local f17_local6 = ""
	if f17_local4 then
		f17_local5 = Engine.GetParagonRankDisplayLevel( f17_arg1.rank )
		local f17_local7 = Engine.GetDStat( f17_arg0.controller, "playerstatslist", "paragon_icon_id", "statvalue" )
		if f17_local7 ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
			f17_local6 = Engine.GetParagonIconById( f17_local7 )
		else
			f17_local6 = Engine.GetRankIcon( 0, f17_arg1.prestige )
		end
	else
		f17_local5 = Engine.GetRankDisplayLevel( f17_arg1.rank )
		f17_local6 = Engine.GetRankIcon( f17_arg1.rank, f17_arg1.prestige )
	end
	Engine.SetModelValue( f17_local1, Engine.Localize( CoD.GetRankName( f17_arg1.rank, f17_arg1.prestige ) ) )
	Engine.SetModelValue( f17_local2, Engine.Localize( "MPUI_LEVEL_N", f17_local5 ) )
	Engine.SetModelValue( f17_local0, GetRankIconLarge( f17_local6 ) )
	Engine.SetModelValue( f17_local3, f0_local7[f17_arg1.type] )
	if f17_arg1.unlockTokensAdded and f17_arg1.unlockTokensAdded ~= 0 then
		f17_arg0.NotificationRewardQueue:addReward( f0_local7[f17_arg1.type], "t7_hud_mp_token_reward", Engine.Localize( "MPUI_UNLOCK_TOKEN" ) )
	end
	if f17_arg1.rewardXP and f17_arg1.rewardXP > 0 then
		f17_arg0.NotificationRewardQueue:addReward( f0_local7[f17_arg1.type], f0_local25, Engine.Localize( "RANK_XP", f17_arg1.rewardXP * Engine.GetXPScale( f17_arg0.controller ) ) )
	end
	if not f17_local4 then
		local f17_local7 = Engine.GetUnlockedItemsForLevel( f17_arg0.controller, f17_arg1.rank )
		local f17_local8 = false
		for f17_local19, f17_local20 in ipairs( f17_local7 ) do
			if f17_local20.isHeroUnlocked then
				if f17_local20.loadoutType == "heroweapon" then
					local f17_local12 = Engine.CurrentSessionMode()
					for f17_local16, f17_local17 in ipairs( Engine.GetHeroList( f17_local12 ) ) do
						local f17_local18 = Engine.GetLoadoutInfoForHero( f17_local12, f17_local17.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
						if f17_local20.itemIndex == f17_local18.itemIndex then
							f17_arg0.NotificationRewardQueue:addReward( f0_local7[f17_arg1.type], f17_local17.defaultHeroRender, Engine.Localize( f17_local17.displayName ) )
						end
					end
				end
			end
			local f17_local12 = f17_local20.itemImage
			if not IsZombies() or f17_local20.loadoutType ~= "equippedbubblegumpack" then
				f17_local12 = f17_local12 .. "_rwd"
			end
			f17_arg0.NotificationRewardQueue:addReward( f0_local7[f17_arg1.type], f17_local12, Engine.Localize( f17_local20.itemName ) )
		end
	end
	return CoD.RankUpNotification.new( f17_arg0.menu, f17_arg0.controller )
end

f0_local14.Challenges = function ( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = f18_arg0.controller
	local f18_local1 = f18_arg1.rewardInfo
	local f18_local2 = Engine.CreateModel( f18_arg2, "icon" )
	local f18_local3 = Engine.CreateModel( f18_arg2, "title" )
	local f18_local4 = Engine.CreateModel( f18_arg2, "subtitle" )
	local f18_local5 = Engine.CreateModel( f18_arg2, "color" )
	local f18_local6 = nil
	if f18_local1.titleText then
		if f18_arg1.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS and f18_local1.reticleInfo then
			f18_arg1.type = "ReticleChallenges"
		end
		if f18_arg1.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST then
			f18_arg1.type = "SpecialistChallenges"
		end
		if f18_local1.camoInfo then
			f18_arg1.type = "CamoChallenges"
		end
		if f18_local1.emblemInfo and f18_local1.emblemInfo.category == "sidebet" then
			f18_arg1.type = "SideBetChallenges"
		end
		for f18_local10, f18_local11 in ipairs( {
			"vialInfo",
			"xpInfo",
			"transmissionInfo",
			"specialistInfo",
			"camoInfo",
			"emblemInfo",
			"reticleInfo"
		} ) do
			if f18_local1[f18_local11] then
				f18_arg0.NotificationRewardQueue:addReward( f0_local7[f18_arg1.type], f18_local1[f18_local11].image, f18_local1[f18_local11].displayString, f18_local1[f18_local11].rewardSize )
			end
		end
		Engine.SetModelValue( f18_local3, f18_local1.titleText )
		Engine.SetModelValue( f18_local4, f18_local1.subtitleText )
		Engine.SetModelValue( f18_local2, f18_local1.icon )
		Engine.SetModelValue( f18_local5, f0_local7[f18_arg1.type] )
		if IsMultiplayer() then
			f18_local7 = CoD.ChallengesUtility.GetChallengeRewardDisplayTier( f18_local1 )
			if f18_local1.specialistInfo then
				if f18_local7 == CoD.ChallengesUtility.SpecialistRewardTiers.CompletionEpic then
					f18_local6 = CoD.SpecialistCompletionEpicChallengeNotification
				elseif f18_local7 == CoD.ChallengesUtility.SpecialistRewardTiers.Epic then
					f18_local6 = CoD.SpecialistEpicChallengeNotification
				end
				f18_local6 = CoD.SpecialistChallengeNotification
			elseif f18_local1.camoInfo then
				if f18_local7 == CoD.ChallengesUtility.CamoRewardTiers.Diamond or f18_local7 == CoD.ChallengesUtility.CamoRewardTiers.DarkMatter then
					f18_local6 = CoD.CamoDiamondChallengeNotification
				elseif f18_local7 == CoD.ChallengesUtility.CamoRewardTiers.Gold then
					f18_local6 = CoD.CamoGoldChallengeNotification
				end
				f18_local6 = CoD.CamoChallengeNotification
			elseif f18_local1.reticleInfo then
				f18_local6 = CoD.ReticleChallengeNotification
			elseif f18_local1.emblemInfo then
				if f18_local1.emblemInfo.category == "sidebet" then
					f18_local6 = CoD.SideBetChallengeNotification
				elseif f18_local7 == CoD.ChallengesUtility.EmblemRewardTiers.Mastery then
					f18_local6 = CoD.MPChallengeMasteryNotification
				end
				f18_local6 = CoD.MPChallengeNotification
			end
			f18_local6 = CoD.MPChallengeNotification
		elseif IsZombies() then
			if f18_local1.camoInfo then
				f18_local6 = CoD.CamoChallengeNotification
			elseif f18_local1.reticleInfo then
				f18_local6 = CoD.ReticleChallengeNotification
			end
			f18_local6 = CoD.MPChallengeNotification
		end
	end
	if f18_local6 and f18_local6.new then
		return f18_local6.new( f18_arg0.menu, f18_arg0.controller )
	else
		return CoD.ChallengesNotification.new( f18_arg0.menu, f18_arg0.controller )
	end
end

f0_local14.TrialComplete = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = Engine.CreateModel( f19_arg2, "icon" )
	local f19_local1 = Engine.CreateModel( f19_arg2, "title" )
	local f19_local2 = Engine.CreateModel( f19_arg2, "subtitle" )
	f19_arg1.name = Engine.GetIString( f19_arg1.name, "CS_LOCALIZED_STRINGS" )
	f19_arg1.description = Engine.GetIString( f19_arg1.description, "CS_LOCALIZED_STRINGS" )
	f19_arg1.icon = f19_arg1.icon and GetChallengeIcon( f19_arg1.icon ) or "uie_t7_icon_zm_dlc_trials_active"
	Engine.SetModelValue( f19_local0, f19_arg1.icon )
	Engine.SetModelValue( f19_local1, Engine.Localize( f19_arg1.name ) )
	Engine.SetModelValue( f19_local2, Engine.Localize( f19_arg1.description ) )
	return CoD.TrialCompleteNotification.new( f19_arg0.menu, f19_arg0.controller )
end

f0_local14.DailyContract = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0 = Engine.CreateModel( f20_arg2, "title" )
	local f20_local1 = Engine.CreateModel( f20_arg2, "subtitle" )
	local f20_local2 = Engine.CreateModel( f20_arg2, "color" )
	local f20_local3 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f20_arg1.index, 2 )
	local f20_local4 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f20_arg1.index, 3 )
	local f20_local5 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f20_arg1.index, 4 )
	if f20_local5 == "" then
		f20_arg1.name = "CONTRACT_" .. f20_local4
	else
		f20_arg1.name = "CONTRACT_" .. f20_local5
	end
	f20_arg1.description = "CONTRACT_" .. f20_local4 .. "_DESC"
	Engine.SetModelValue( f20_local0, Engine.Localize( f20_arg1.name, f20_local3 ) )
	Engine.SetModelValue( f20_local1, Engine.Localize( f20_arg1.description, f20_local3 ) )
	Engine.SetModelValue( f20_local2, f0_local7[f20_arg1.type] )
	if f20_arg1.showRewards then
		f20_arg0.NotificationRewardQueue:addReward( f0_local7[f20_arg1.type], IsDoubleDailyContract( f20_arg0.controller ) and "uie_t7_icon_blackmarket_doubleloot_small" or "t7_icon_cryptokeys_rwd", Engine.Localize( "MPUI_BM_CRYPTOKEY_COUNT", Dvar.daily_contract_cryptokey_reward_count:get() ) )
	end
	return CoD.MPDailyContractNotification.new( f20_arg0.menu, f20_arg0.controller )
end

f0_local14.WeeklyContract = function ( f21_arg0, f21_arg1, f21_arg2 )
	local f21_local0 = Engine.CreateModel( f21_arg2, "title" )
	local f21_local1 = Engine.CreateModel( f21_arg2, "subtitle" )
	local f21_local2 = Engine.CreateModel( f21_arg2, "color" )
	local f21_local3 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f21_arg1.index, 2 )
	local f21_local4 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f21_arg1.index, 3 )
	local f21_local5 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f21_arg1.index, 4 )
	if f21_local5 == "" then
		f21_arg1.name = "CONTRACT_" .. f21_local4
	else
		f21_arg1.name = "CONTRACT_" .. f21_local5
	end
	f21_arg1.description = "CONTRACT_" .. f21_local4 .. "_DESC"
	Engine.SetModelValue( f21_local0, Engine.Localize( f21_arg1.name, f21_local3 ) )
	Engine.SetModelValue( f21_local1, Engine.Localize( f21_arg1.description, f21_local3 ) )
	Engine.SetModelValue( f21_local2, f0_local7[f21_arg1.type] )
	if f21_arg1.showRewards then
		f21_arg0.NotificationRewardQueue:addReward( f0_local7[f21_arg1.type], "uie_t7_icon_blackmarket_cryptokey", Engine.Localize( "MPUI_BM_CRYPTOKEY_COUNT", Dvar.weekly_contract_cryptokey_reward_count:get() ) )
		f21_arg0.NotificationRewardQueue:addReward( f0_local7[f21_arg1.type], "uie_t7_icon_blackmarket_cryptokey", Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACT" ) )
	end
	return CoD.MPWeeklyContractNotification.new( f21_arg0.menu, f21_arg0.controller )
end

f0_local14.SpecialContract = function ( f22_arg0, f22_arg1, f22_arg2 )
	local f22_local0 = Engine.CreateModel( f22_arg2, "title" )
	local f22_local1 = Engine.CreateModel( f22_arg2, "subtitle" )
	local f22_local2 = Engine.CreateModel( f22_arg2, "color" )
	local f22_local3 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f22_arg1.index, 2 )
	local f22_local4 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f22_arg1.index, 3 )
	local f22_local5 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f22_arg1.index, 4 )
	if f22_local5 == "" then
		f22_arg1.name = "CONTRACT_" .. f22_local4
	else
		f22_arg1.name = "CONTRACT_" .. f22_local5
	end
	f22_arg1.description = "CONTRACT_" .. f22_local4 .. "_DESC"
	Engine.SetModelValue( f22_local0, Engine.Localize( f22_arg1.name, f22_local3 ) )
	Engine.SetModelValue( f22_local1, Engine.Localize( f22_arg1.description, f22_local3 ) )
	Engine.SetModelValue( f22_local2, f0_local7[f22_arg1.type] )
	if f22_arg1.showRewards then
		local f22_local6 = CoD.getStatsMilestoneTable( 6, Enum.eModes.MODE_MULTIPLAYER )
		local f22_local7 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f22_arg1.index, 7 )
		local f22_local8 = Engine.TableLookup( nil, CoD.contractTable_mp, 0, f22_arg1.index, 8 )
		if f22_local7 ~= "" then
			f22_arg0.NotificationRewardQueue:addReward( f0_local7[f22_arg1.type], Engine.TableLookup( nil, CoD.backgroundsTable, 4, Engine.TableLookup( nil, f22_local6, 4, f22_local7, 12 ), 3 ), Engine.Localize( "MENU_CALLING_CARD" ), "CallingCard" )
		end
		if f22_local8 ~= "" then
			local f22_local9 = Engine.TableLookup( nil, f22_local6, 4, f22_local8, 9 )
			f22_arg0.NotificationRewardQueue:addReward( f0_local7[f22_arg1.type], Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f22_local9, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_IMAGE ), Engine.Localize( Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f22_local9, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME ) ) )
		end
	end
	return CoD.MPSpecialContractNotification.new( f22_arg0.menu, f22_arg0.controller )
end

f0_local16.Medal = function ( f23_arg0, f23_arg1 )
	return f23_arg0.scoreInfoIndex == f23_arg1.scoreInfoIndex
end

f0_local18 = function ( f24_arg0 )
	local f24_local0 = 2
	local f24_local1 = 3
	local f24_local2 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f24_arg0, f24_local0 )
	local f24_local3 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f24_arg0, f24_local1 )
	local f24_local4 = Engine.GetMedalInfo( f24_local3 )
	if f24_local4 then
		return f24_local2, f24_local4.iconSmall, f24_local4.backingSmall, f24_local4.widget
	else
		return f24_local2, f24_local3, "", "BO2Medal"
	end
end

f0_local19 = function ( f25_arg0, f25_arg1 )
	local f25_local0 = f25_arg1.data[1]
	local f25_local1, f25_local2, f25_local3, f25_local4 = f0_local18( f25_local0 )
	f0_local17( f25_arg0, {
		scoreInfoIndex = f25_local0,
		type = "Medal"
	}, {
		f25_local2,
		f25_local3
	} )
end

f0_local24 = function ( f26_arg0, f26_arg1 )
	f26_arg1.widget:close()
	f26_arg1:close()
	table.insert( f26_arg0.availableNotificationModels, f26_arg1.widget:getModel() )
end

f0_local20 = function ( f27_arg0 )
	f0_local24( f27_arg0, table.remove( f27_arg0.notificationWidgetsBeingShown, 1 ) )
	f0_local22( f27_arg0 )
end

f0_local21 = function ( f28_arg0 )
	if #f28_arg0.availableNotificationModels == 0 then
		return false
	elseif #f28_arg0.notificationQueue == 0 then
		return false
	elseif #f28_arg0.notificationWidgetsBeingShown == 0 then
		return true
	else
		local f28_local0 = f28_arg0.notificationQueue[1]
		if f28_local0.type ~= f28_arg0.notificationWidgetsBeingShown[1].notification.type then
			return false
		elseif f0_local16[f28_local0.type] and f0_local16[f28_local0.type]( f28_arg0.notificationWidgetsBeingShown[#f28_arg0.notificationWidgetsBeingShown].notification, f28_local0 ) then
			return true
		elseif f28_arg0.queueAnimating then
			return false
		elseif f0_local8[f28_local0.type] then
			return true
		else
			return false
		end
	end
end

f0_local22 = function ( f29_arg0 )
	if not f0_local21( f29_arg0 ) then
		if #f29_arg0.notificationWidgetsBeingShown == 0 then
			Engine.SetModelValue( f29_arg0.notificationQueueEmptyModel, true )
		end
		return 
	end
	Engine.SetModelValue( f29_arg0.notificationQueueEmptyModel, false )
	local f29_local0 = table.remove( f29_arg0.notificationQueue, 1 )
	local f29_local1 = f29_arg0.notificationWidgetsBeingShown[#f29_arg0.notificationWidgetsBeingShown]
	if f29_local1 and not f29_local1.timeUp and f0_local15[f29_local0.type] and f0_local16[f29_local0.type]( f29_local1.notification, f29_local0 ) then
		f0_local15[f29_local0.type]( f29_local1, f29_local0 )
		f29_local1.timeUpTimer:reset()
		f29_local1.widget:playClip( "Combined" )
		return 
	elseif f29_local0.streamedImages then
		for f29_local5, self in ipairs( f29_local0.streamedImages ) do
			self:close()
		end
		f29_local0.streamedImages = {}
	end
	local f29_local2 = table.remove( f29_arg0.availableNotificationModels )
	local f29_local3 = f0_local14[f29_local0.type]( f29_arg0, f29_local0, f29_local2 )
	local f29_local4, f29_local5 = f29_local3:getLocalSize()
	f29_local3:setLeftRight( false, false, -f29_local4 / 2, f29_local4 / 2 )
	f29_local3:setTopBottom( true, false, 0, f29_local5 )
	f29_local3:setModel( f29_local2 )
	f29_local3:processEvent( {
		name = "update_state",
		controller = f29_arg0.controller,
		menu = f29_arg0.menu
	} )
	local self = LUI.UIElement.new()

	self:setLeftRight( false, false, 0, 0 )
	self:setTopBottom( true, false, f0_local3, f0_local3 )
	self:setAlpha( 1 )
	self:setScale( 1 )
	self.notification = f29_local0
	self.widget = f29_local3
	self:addElement( f29_local3 )
	self.timeUpTimer = LUI.UITimer.new( f0_local9[f29_local0.type], {
		name = "notification_time_up",
		notificationContainer = self
	}, true, f29_arg0 )
	self:addElement( self.timeUpTimer )
	table.insert( f29_arg0.notificationWidgetsBeingShown, self )
	f29_arg0:addElement( self )
	if #f29_arg0.notificationWidgetsBeingShown > 1 then
		local f29_local7, f29_local8 = f29_local3:getLocalSize()
		f29_local5 = f29_local8
		f29_local7 = f29_local7 / 2
		for f29_local8 = #f29_arg0.notificationWidgetsBeingShown - 1, 1, -1 do
			local f29_local11 = f29_arg0.notificationWidgetsBeingShown[f29_local8]
			f29_local4, f29_local5 = f29_local11.widget:getLocalSize()
			f29_local7 = f29_local7 + f29_local4 / 2 * f0_local6
			f29_local11:beginAnimation( "notification_queue_move", f0_local4, true, true )
			f29_local11:setLeftRight( false, false, f29_local7, f29_local7 )
			f29_local11:setAlpha( f0_local5 )
			f29_local11:setScale( f0_local6 )
			f29_local7 = f29_local7 + f29_local4 / 2 * f0_local6
		end
		if f0_local8[f29_local0.type] < #f29_arg0.notificationWidgetsBeingShown then
			f29_arg0.notificationWidgetsBeingShown[1].timeUpTimer:close()
			f29_arg0.notificationWidgetsBeingShown[1]:setAlpha( 0 )
			f29_arg0.notificationWidgetsBeingShown[1]:setScale( 0 )
			f29_arg0.notificationWidgetsBeingShown[1].fadingOffQueue = true
			f29_arg0.notificationWidgetsBeingShown[1]:registerEventHandler( "transition_complete_notification_queue_move", function ( element, event )
				f0_local20( f29_arg0 )
			end )
		end
	end
	f29_arg0:addElement( LUI.UITimer.new( f0_local4, "queue_done_animating", true, f29_arg0 ) )
	f29_arg0.queueAnimating = true
end

f0_local23 = function ( f31_arg0 )
	for f31_local8, f31_local9 in pairs( f31_arg0.notificationQueue ) do
		if f31_local9.streamedImages then
			for f31_local6, f31_local7 in ipairs( f31_local9.streamedImages ) do
				f31_local7:close()
			end
		end
	end
	f31_arg0.notificationQueue = {}
	Engine.SetModelValue( f31_arg0.notificationQueueEmptyModel, true )
	for f31_local8, f31_local9 in ipairs( f31_arg0.notificationWidgetsBeingShown ) do
		f0_local24( f31_arg0, f31_local9 )
	end
	f31_arg0.notificationWidgetsBeingShown = {}
	for f31_local8, f31_local9 in pairs( f31_arg0.streamedImages ) do
		f31_local8:close()
	end
	f31_arg0.streamedImages = {}
end

CoD.NotificationQueue = InheritFrom( LUI.UIElement )
CoD.NotificationQueue.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.NotificationQueue )
	self.id = "NotificationQueue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local NotificationRewardQueue = CoD.NotificationRewardQueue.new( menu, controller )
	NotificationRewardQueue:setLeftRight( false, true, -596, -20 )
	NotificationRewardQueue:setTopBottom( true, false, 142, 340 )
	self:addElement( NotificationRewardQueue )
	self.NotificationRewardQueue = NotificationRewardQueue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				NotificationRewardQueue:completeAnimation()
				self.NotificationRewardQueue:setAlpha( 1 )
				self.clipFinished( NotificationRewardQueue, {} )
			end
		},
		MPSplitscreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				NotificationRewardQueue:completeAnimation()
				self.NotificationRewardQueue:setAlpha( 0 )
				self.clipFinished( NotificationRewardQueue, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "MPSplitscreen",
			condition = function ( menu, element, event )
				return IsMultiplayer() and IsSplitscreenAndInGame( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotificationRewardQueue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
