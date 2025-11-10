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
	SpecialistChallenges = "247 204 15"
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
	SpecialistChallenges = 2000
}
local f0_local10 = {
	Medal = 1,
	CamoChallenges = 2,
	ReticleChallenges = 3,
	Challenges = 4,
	WeaponLevelUp = 5,
	SpecialistChallenges = 6,
	RankUp = 7
}
local f0_local11 = nil
local f0_local12 = {}
local f0_local13 = {}
local f0_local14 = {}
local f0_local15, f0_local16, f0_local17, f0_local18, f0_local19, f0_local20, f0_local21 = nil
local f0_local22 = "t7_hud_mp_notifications_xp_blue"
local f0_local23 = function ( f1_arg0, f1_arg1 )
	if CoD.IsShoutcaster( f1_arg1.controller ) and not CoD.ShoutcasterProfileVarBool( f1_arg1.controller, "shoutcaster_playernotifications" ) then
		f1_arg0:setAlpha( 0 )
	else
		f1_arg0:setAlpha( 1 )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	self.controller = controller
	self.menu = menu
	self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationQueue" ) )
	self.clearNotificationQueue = f0_local20
	self.availableNotificationModels = {}
	local f2_local0 = 0
	for f2_local4, f2_local5 in pairs( f0_local8 ) do
		if f2_local0 < f2_local5 then
			f2_local0 = f2_local5
		end
	end
	f2_local0 = f2_local0 + 1
	for f2_local1 = 1, f2_local0, 1 do
		table.insert( self.availableNotificationModels, Engine.CreateModel( self:getModel(), "Notification" .. f2_local1 ) )
	end
	self.notificationWidgetsBeingShown = {}
	self.notificationQueue = {}
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f3_local1 = {
			controller = controller,
			name = modelValue,
			data = CoD.GetScriptNotifyData( model )
		}
		if modelValue == "medal_received" then
			f0_local16( self, f3_local1 )
		elseif modelValue == "challenge_complete" then
			local f3_local2 = {
				challengeID = f3_local1.data[1],
				itemIndex = f3_local1.data[2],
				challengeType = f3_local1.data[3],
				tableNumber = f3_local1.data[4],
				row = f3_local1.data[5],
				maxVal = f3_local1.data[6],
				rewardXP = f3_local1.data[7],
				type = "Challenges"
			}
			if CoD.ChallengesUtility.IsSpecialistTransmissionChallenge( f3_local2.challengeType, f3_local2.tableNumber, f3_local2.row ) then
				return 
			end
			f0_local11( self, f3_local2 )
		elseif modelValue == "gun_level_complete" then
			f0_local11( self, {
				rank = f3_local1.data[1],
				itemIndex = f3_local1.data[2],
				attachmentIndex = f3_local1.data[3],
				rewardXP = f3_local1.data[4],
				type = "WeaponLevelUp"
			} )
		elseif modelValue == "rank_up" then
			f0_local11( self, {
				rank = f3_local1.data[1],
				prestige = f3_local1.data[2],
				unlockTokensAdded = f3_local1.data[3],
				type = "RankUp"
			} )
		elseif modelValue == "clear_notification_queue" then
			f0_local20( self )
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
				f0_local17( element )
			end )
		else
			event.notificationContainer:beginAnimation( "time_up", f0_local2 )
			event.notificationContainer:setAlpha( 0 )
			event.notificationContainer:registerEventHandler( "transition_complete_time_up", function ( element, event )
				f0_local17( element )
			end )
		end
	end )
	self:registerEventHandler( "queue_done_animating", function ( element, event )
		element.queueAnimating = nil
		f0_local19( element )
	end )
	f2_local1 = function ( f8_arg0 )
		f0_local23( self, {
			controller = controller
		} )
	end
	
	if IsMultiplayer() then
		f2_local2 = Engine.GetModelForController( controller )
		self:subscribeToModel( Engine.GetModel( f2_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), f2_local1 )
		self:subscribeToModel( Engine.GetModel( f2_local2, "CodCaster.profileSettingsUpdated" ), f2_local1 )
	end
end

f0_local11 = function ( f9_arg0, f9_arg1 )
	if Engine.IsVisibilityBitSet( f9_arg0.controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		return 
	end
	f9_arg1.priority = f0_local10[f9_arg1.type]
	local f9_local0 = 1
	while f9_local0 <= #f9_arg0.notificationQueue do
		if f9_arg1.priority < f9_arg0.notificationQueue[f9_local0].priority then
			break
		end
		f9_local0 = f9_local0 + 1
	end
	table.insert( f9_arg0.notificationQueue, f9_local0, f9_arg1 )
	f0_local19( f9_arg0 )
end

f0_local13.Medal = function ( f10_arg0, f10_arg1 )
	if not f10_arg0.numStacks then
		f10_arg0.numStacks = 2
	else
		f10_arg0.numStacks = f10_arg0.numStacks + 1
	end
	Engine.SetModelValue( Engine.CreateModel( f10_arg0.widget:getModel(), "subtitle" ), "x" .. f10_arg0.numStacks )
end

f0_local12.Medal = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0, f11_local1, f11_local2, f11_local3 = f0_local15( f11_arg1.scoreInfoIndex )
	local f11_local4 = Engine.CreateModel( f11_arg2, "backing" )
	local f11_local5 = Engine.CreateModel( f11_arg2, "icon" )
	local f11_local6 = Engine.CreateModel( f11_arg2, "title" )
	local f11_local7 = Engine.CreateModel( f11_arg2, "subtitle" )
	Engine.SetModelValue( f11_local6, f11_local0 )
	Engine.SetModelValue( f11_local7, "" )
	Engine.SetModelValue( f11_local5, f11_local1 )
	Engine.SetModelValue( f11_local4, f11_local2 )
	return CoD[f11_local3].new( f11_arg0.menu, f11_arg0.controller )
end

f0_local12.WeaponLevelUp = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = Engine.CreateModel( f12_arg2, "icon" )
	local f12_local1 = Engine.CreateModel( f12_arg2, "title" )
	local f12_local2 = Engine.CreateModel( f12_arg2, "subtitle" )
	local f12_local3 = Engine.CreateModel( f12_arg2, "color" )
	Engine.SetModelValue( f12_local1, Engine.Localize( Engine.GetItemName( f12_arg1.itemIndex ) ) )
	Engine.SetModelValue( f12_local2, Engine.Localize( "MPUI_LEVEL_N", f12_arg1.rank + 2 ) )
	Engine.SetModelValue( f12_local0, Engine.GetItemImage( f12_arg1.itemIndex ) .. "_pu" )
	Engine.SetModelValue( f12_local3, f0_local7[f12_arg1.type] )
	if f12_arg1.rewardXP and f12_arg1.rewardXP > 0 then
		f12_arg0.NotificationRewardQueue:addReward( f0_local7[f12_arg1.type], f0_local22, Engine.Localize( "RANK_XP", f12_arg1.rewardXP ) )
	end
	local f12_local4 = f12_arg1.attachmentIndex
	if f12_local4 and f12_local4 ~= 0 then
		f12_arg0.NotificationRewardQueue:addReward( f0_local7[f12_arg1.type], Engine.GetAttachmentUniqueImageByAttachmentIndex( Engine.CurrentSessionMode(), f12_arg1.itemIndex, f12_local4 ) .. "_rwd", Engine.Localize( Engine.GetAttachmentNameByIndex( f12_local4 ) ) )
	end
	return CoD.WeaponLevelUpNotification.new( f12_arg0.menu, f12_arg0.controller )
end

f0_local12.RankUp = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = Engine.CreateModel( f13_arg2, "icon" )
	local f13_local1 = Engine.CreateModel( f13_arg2, "title" )
	local f13_local2 = Engine.CreateModel( f13_arg2, "subtitle" )
	local f13_local3 = Engine.CreateModel( f13_arg2, "color" )
	Engine.SetModelValue( f13_local1, Engine.Localize( CoD.GetRankName( f13_arg1.rank, f13_arg1.prestige ) ) )
	Engine.SetModelValue( f13_local2, Engine.Localize( "MPUI_LEVEL_N", f13_arg1.rank + 1 ) )
	Engine.SetModelValue( f13_local0, GetRankIconLarge( Engine.GetRankIcon( f13_arg1.rank, f13_arg1.prestige ) ) )
	Engine.SetModelValue( f13_local3, f0_local7[f13_arg1.type] )
	if f13_arg1.unlockTokensAdded and f13_arg1.unlockTokensAdded ~= 0 then
		f13_arg0.NotificationRewardQueue:addReward( f0_local7[f13_arg1.type], "t7_hud_mp_token_reward", Engine.Localize( "MPUI_UNLOCK_TOKEN" ) )
	end
	if f13_arg1.rewardXP and f13_arg1.rewardXP > 0 then
		f13_arg0.NotificationRewardQueue:addReward( f0_local7[f13_arg1.type], f0_local22, Engine.Localize( "RANK_XP", f13_arg1.rewardXP ) )
	end
	local f13_local4 = Engine.GetUnlockedItemsForLevel( f13_arg0.controller, f13_arg1.rank )
	local f13_local5 = false
	for f13_local16, f13_local17 in ipairs( f13_local4 ) do
		if f13_local17.isHeroUnlocked then
			if f13_local17.loadoutType == "heroweapon" then
				local f13_local9 = Engine.CurrentSessionMode()
				for f13_local13, f13_local14 in ipairs( Engine.GetHeroList( f13_local9 ) ) do
					local f13_local15 = Engine.GetLoadoutInfoForHero( f13_local9, f13_local14.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					if f13_local17.itemIndex == f13_local15.itemIndex then
						f13_arg0.NotificationRewardQueue:addReward( f0_local7[f13_arg1.type], f13_local14.defaultHeroRender, Engine.Localize( f13_local14.displayName ) )
					end
				end
			end
		end
		local f13_local9 = f13_local17.itemImage
		if not IsZombies() or f13_local17.loadoutType ~= "equippedbubblegumpack" then
			f13_local9 = f13_local9 .. "_rwd"
		end
		f13_arg0.NotificationRewardQueue:addReward( f0_local7[f13_arg1.type], f13_local9, Engine.Localize( f13_local17.itemName ) )
	end
	return CoD.RankUpNotification.new( f13_arg0.menu, f13_arg0.controller )
end

f0_local12.Challenges = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = f14_arg0.controller
	local f14_local1 = CoD.ChallengesUtility.GetChallengeRewardInfo( f14_local0, f14_arg1.tableNumber, f14_arg1.row, f14_arg1.challengeType, f14_arg1.itemIndex, Engine.GetEquippedHero( f14_local0, Engine.CurrentSessionMode() ) )
	local f14_local2 = Engine.CreateModel( f14_arg2, "icon" )
	local f14_local3 = Engine.CreateModel( f14_arg2, "title" )
	local f14_local4 = Engine.CreateModel( f14_arg2, "subtitle" )
	local f14_local5 = Engine.CreateModel( f14_arg2, "color" )
	local f14_local6 = nil
	if f14_local1.titleText then
		if f14_arg1.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS and f14_local1.reticleInfo then
			f14_arg1.type = "ReticleChallenges"
		end
		if f14_arg1.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST then
			f14_arg1.type = "SpecialistChallenges"
		end
		if f14_local1.camoInfo then
			f14_arg1.type = "CamoChallenges"
		end
		for f14_local10, f14_local11 in ipairs( {
			"xpInfo",
			"specialistInfo",
			"camoInfo",
			"emblemInfo",
			"reticleInfo"
		} ) do
			if f14_local1[f14_local11] then
				f14_arg0.NotificationRewardQueue:addReward( f0_local7[f14_arg1.type], f14_local1[f14_local11].image, f14_local1[f14_local11].displayString, f14_local1[f14_local11].rewardSize )
			end
		end
		Engine.SetModelValue( f14_local3, f14_local1.titleText )
		Engine.SetModelValue( f14_local4, f14_local1.subtitleText )
		Engine.SetModelValue( f14_local2, f14_local1.icon )
		Engine.SetModelValue( f14_local5, f0_local7[f14_arg1.type] )
		if IsMultiplayer() then
			if f14_local1.specialistInfo then
				if f14_local1.specialistInfo.unlockItemIndex == 9 then
					f14_local6 = CoD.SpecialistCompletionEpicChallengeNotification
				elseif f14_local1.specialistInfo.unlockItemIndex == 8 then
					f14_local6 = CoD.SpecialistEpicChallengeNotification
				end
				f14_local6 = CoD.SpecialistChallengeNotification
			elseif f14_local1.camoInfo then
				if f14_local1.camoInfo.camoRef == "camo_diamond" or f14_local1.camoInfo.camoRef == "camo_darkmatter" then
					f14_local6 = CoD.CamoDiamondChallengeNotification
				elseif f14_local1.camoInfo.camoRef == "camo_gold" then
					f14_local6 = CoD.CamoGoldChallengeNotification
				end
				f14_local6 = CoD.CamoChallengeNotification
			elseif f14_local1.reticleInfo then
				f14_local6 = CoD.ReticleChallengeNotification
			elseif f14_local1.emblemInfo then
				if f14_local1.emblemInfo.isMastery then
					f14_local6 = CoD.MPChallengeMasteryNotification
				end
				f14_local6 = CoD.MPChallengeNotification
			end
			f14_local6 = CoD.MPChallengeNotification
		elseif IsZombies() then
			if f14_local1.camoInfo then
				f14_local6 = CoD.CamoChallengeNotification
			elseif f14_local1.reticleInfo then
				f14_local6 = CoD.ReticleChallengeNotification
			end
			f14_local6 = CoD.MPChallengeNotification
		end
	end
	if f14_local6 and f14_local6.new then
		return f14_local6.new( f14_arg0.menu, f14_arg0.controller )
	else
		return CoD.ChallengesNotification.new( f14_arg0.menu, f14_arg0.controller )
	end
end

f0_local14.Medal = function ( f15_arg0, f15_arg1 )
	return f15_arg0.scoreInfoIndex == f15_arg1.scoreInfoIndex
end

f0_local15 = function ( f16_arg0 )
	local f16_local0 = 2
	local f16_local1 = 3
	local f16_local2 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f16_arg0, f16_local0 )
	local f16_local3 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f16_arg0, f16_local1 )
	local f16_local4 = Engine.GetMedalInfo( f16_local3 )
	if f16_local4 then
		return f16_local2, f16_local4.iconSmall, f16_local4.backingSmall, f16_local4.widget
	else
		return f16_local2, f16_local3, "", "BO2Medal"
	end
end

f0_local16 = function ( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg1.data[1]
	local f17_local1, f17_local2, f17_local3, f17_local4 = f0_local15( f17_local0 )
	local self = LUI.UIImage.new()
	self:setAlpha( 0 )
	self:setImage( RegisterImage( f17_local2 ) )
	self:setupUIStreamedImage( 4000 )
	self:registerEventHandler( "streamed_image_ready", function ( self, event )
		self:close()
		f0_local11( f17_arg0, {
			scoreInfoIndex = f17_local0,
			type = "Medal"
		} )
	end )
	self:registerEventHandler( "streamed_image_timed_out", function ( self, event )
		self:close()
	end )
	f17_arg0:addElement( self )
end

f0_local21 = function ( f20_arg0, f20_arg1 )
	f20_arg1.widget:close()
	f20_arg1:close()
	table.insert( f20_arg0.availableNotificationModels, f20_arg1.widget:getModel() )
end

f0_local17 = function ( f21_arg0 )
	f0_local21( f21_arg0, table.remove( f21_arg0.notificationWidgetsBeingShown, 1 ) )
	f0_local19( f21_arg0 )
end

f0_local18 = function ( f22_arg0 )
	if #f22_arg0.notificationQueue == 0 then
		return false
	elseif #f22_arg0.notificationWidgetsBeingShown == 0 then
		return true
	else
		local f22_local0 = f22_arg0.notificationQueue[1]
		if f22_local0.type ~= f22_arg0.notificationWidgetsBeingShown[1].notification.type then
			return false
		elseif f0_local14[f22_local0.type] and f0_local14[f22_local0.type]( f22_arg0.notificationWidgetsBeingShown[#f22_arg0.notificationWidgetsBeingShown].notification, f22_local0 ) then
			return true
		elseif f22_arg0.queueAnimating then
			return false
		elseif f0_local8[f22_local0.type] then
			return true
		else
			return false
		end
	end
end

f0_local19 = function ( f23_arg0 )
	if not f0_local18( f23_arg0 ) then
		return 
	end
	local f23_local0 = table.remove( f23_arg0.notificationQueue, 1 )
	local f23_local1 = f23_arg0.notificationWidgetsBeingShown[#f23_arg0.notificationWidgetsBeingShown]
	if f23_local1 and not f23_local1.timeUp and f0_local13[f23_local0.type] and f0_local14[f23_local0.type]( f23_local1.notification, f23_local0 ) then
		f0_local13[f23_local0.type]( f23_local1, f23_local0 )
		f23_local1.timeUpTimer:reset()
		f23_local1.widget:playClip( "Combined" )
		return 
	end
	local f23_local2 = table.remove( f23_arg0.availableNotificationModels )
	local f23_local3 = f0_local12[f23_local0.type]( f23_arg0, f23_local0, f23_local2 )
	local f23_local4, f23_local5 = f23_local3:getLocalSize()
	f23_local3:setLeftRight( false, false, -f23_local4 / 2, f23_local4 / 2 )
	f23_local3:setTopBottom( true, false, 0, f23_local5 )
	f23_local3:setModel( f23_local2 )
	f23_local3:setState( "DefaultState" )
	local self = LUI.UIElement.new()
	self:setLeftRight( false, false, 0, 0 )
	self:setTopBottom( true, false, f0_local3, f0_local3 )
	self:setAlpha( 1 )
	self:setScale( 1 )
	self.notification = f23_local0
	self.widget = f23_local3
	self:addElement( f23_local3 )
	self.timeUpTimer = LUI.UITimer.new( f0_local9[f23_local0.type], {
		name = "notification_time_up",
		notificationContainer = self
	}, true, f23_arg0 )
	self:addElement( self.timeUpTimer )
	table.insert( f23_arg0.notificationWidgetsBeingShown, self )
	f23_arg0:addElement( self )
	if #f23_arg0.notificationWidgetsBeingShown > 1 then
		local f23_local7, f23_local8 = f23_local3:getLocalSize()
		f23_local5 = f23_local8
		f23_local7 = f23_local7 / 2
		for f23_local8 = #f23_arg0.notificationWidgetsBeingShown - 1, 1, -1 do
			local f23_local11 = f23_arg0.notificationWidgetsBeingShown[f23_local8]
			f23_local4, f23_local5 = f23_local11.widget:getLocalSize()
			f23_local7 = f23_local7 + f23_local4 / 2 * f0_local6
			f23_local11:beginAnimation( "notification_queue_move", f0_local4, true, true )
			f23_local11:setLeftRight( false, false, f23_local7, f23_local7 )
			f23_local11:setAlpha( f0_local5 )
			f23_local11:setScale( f0_local6 )
			f23_local7 = f23_local7 + f23_local4 / 2 * f0_local6
		end
		if f0_local8[f23_local0.type] < #f23_arg0.notificationWidgetsBeingShown then
			f23_arg0.notificationWidgetsBeingShown[1].timeUpTimer:close()
			f23_arg0.notificationWidgetsBeingShown[1]:setAlpha( 0 )
			f23_arg0.notificationWidgetsBeingShown[1]:setScale( 0 )
			f23_arg0.notificationWidgetsBeingShown[1].fadingOffQueue = true
			f23_arg0.notificationWidgetsBeingShown[1]:registerEventHandler( "transition_complete_notification_queue_move", function ( element, event )
				f0_local17( f23_arg0 )
			end )
		end
	end
	f23_arg0:addElement( LUI.UITimer.new( f0_local4, "queue_done_animating", true, f23_arg0 ) )
	f23_arg0.queueAnimating = true
end

f0_local20 = function ( f25_arg0 )
	f25_arg0.notificationQueue = {}
	for f25_local3, f25_local4 in ipairs( f25_arg0.notificationWidgetsBeingShown ) do
		f0_local21( f25_arg0, f25_local4 )
	end
	f25_arg0.notificationWidgetsBeingShown = {}
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotificationRewardQueue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

