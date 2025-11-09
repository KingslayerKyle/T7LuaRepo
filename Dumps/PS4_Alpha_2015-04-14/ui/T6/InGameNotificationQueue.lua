CoD.InGameNotificationQueue = {}
CoD.InGameNotificationQueue.MedalNameColumn = 2
CoD.InGameNotificationQueue.MedalMaterialColumn = 3
CoD.InGameNotificationQueue.NotificationActive = false
CoD.InGameNotificationQueue.Queue = {}
CoD.InGameNotificationQueue.Priorities = {}
CoD.InGameNotificationQueue.Priorities.Rank = 8
CoD.InGameNotificationQueue.Priorities.Challenge = 8
CoD.InGameNotificationQueue.Priorities.GunLevel = 9
CoD.InGameNotificationQueue.Priorities.Medals = 10
CoD.InGameNotificationQueue.Priorities.Killstreaks = 20
CoD.InGameNotificationQueue.NotificationComplete = function ()
	CoD.InGameNotificationQueue.NotificationActive = false
	CoD.InGameNotificationQueue.PumpQueue()
end

CoD.InGameNotificationQueue.ClearQueue = function ( event )
	for index = 1, #CoD.InGameNotificationQueue.Queue, 1 do
		table.remove( CoD.InGameNotificationQueue.Queue, index )
	end
	CoD.InGameNotificationQueue.NotificationActive = false
end

CoD.InGameNotificationQueue.PumpQueue = function ()
	if CoD.InGameNotificationQueue.NotificationActive == false and #CoD.InGameNotificationQueue.Queue > 0 then
		local priority = -1
		local notificationIndex = -1
		for index = 1, #CoD.InGameNotificationQueue.Queue, 1 do
			if priority < CoD.InGameNotificationQueue.Queue[index].priority then
				priority = CoD.InGameNotificationQueue.Queue[index].priority
				notificationIndex = index
			end
		end
		if priority < 0 or notificationIndex < 1 then
			error( "Incorrect priority " .. priority .. " or notificationIndex " .. notificationIndex .. " in InGameNotificationQueue." )
		end
		local currentNotification = CoD.InGameNotificationQueue.Queue[notificationIndex]
		CoD.InGameNotificationQueue.NotificationActive = true
		table.remove( CoD.InGameNotificationQueue.Queue, notificationIndex )
		currentNotification.callback( currentNotification.notificationSelf, currentNotification.event )
	end
end

CoD.InGameNotificationQueue.AddToQueue = function ( self, priority, callback, event )
	local notificationEvent = {
		priority = priority,
		callback = callback,
		notificationSelf = self,
		event = event
	}
	table.insert( CoD.InGameNotificationQueue.Queue, notificationEvent )
	CoD.InGameNotificationQueue.PumpQueue()
end

CoD.InGameNotificationQueue.KillstreakReceived = function ( self, event )
	CoD.InGameNotificationQueue.AddToQueue( self, CoD.InGameNotificationQueue.Priorities.Killstreaks, CoD.InGameNotificationQueue.KillstreakNotify, event )
end

CoD.InGameNotificationQueue.KillstreakNotify = function ( self, event )
	local itemIndex = event.data[1]
	local informDialog = Engine.GetIString( event.data[2], "CS_LOCALIZED_STRINGS" )
	local nameText = Engine.GetItemName( itemIndex )
	local imageName = Engine.GetItemImage( itemIndex ) .. "_big"
	local perControllerModel = Engine.GetModelForController( event.controller )
	local killstreakNameModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedKillstreakName" )
	Engine.SetModelValue( killstreakNameModel, nameText )
	local killstreakImageModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedKillstreakImage" )
	Engine.SetModelValue( killstreakImageModel, imageName )
	self:playClip( "KillstreakEarned" )
	self:addElement( LUI.UITimer.new( 2500, "notification_complete", true ) )
end

CoD.InGameNotificationQueue.MedalReceived = function ( self, event )
	CoD.InGameNotificationQueue.AddToQueue( self, CoD.InGameNotificationQueue.Priorities.Medals, CoD.InGameNotificationQueue.MedalNotify, event )
end

CoD.InGameNotificationQueue.MedalNotify = function ( self, event )
	local medalIndex = event.data[1]
	local medalName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.InGameNotificationQueue.MedalNameColumn )
	local medalMaterialName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.InGameNotificationQueue.MedalMaterialColumn )
	local perControllerModel = Engine.GetModelForController( event.controller )
	local medalNameModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedMedalName" )
	Engine.SetModelValue( medalNameModel, medalName )
	local medalImageModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedMedalImage" )
	Engine.SetModelValue( medalImageModel, medalMaterialName )
	self:playClip( "MedalEarned" )
	self:addElement( LUI.UITimer.new( 1950, "notification_complete", true ) )
end

CoD.InGameNotificationQueue.GunLevelComplete = function ( self, event )
	CoD.InGameNotificationQueue.AddToQueue( self, CoD.InGameNotificationQueue.Priorities.GunLevel, CoD.InGameNotificationQueue.GunLevelNotify, event )
end

CoD.InGameNotificationQueue.GunLevelNotify = function ( self, event )
	local attachmentIndex = event.data[3]
	local rewardXP = event.data[4]
	local itemIndex = event.data[2]
	local rankId = event.data[1]
	if attachmentIndex == 0 and rewardXP == 0 then
		CoD.InGameNotificationQueue.NotificationComplete()
		return 
	end
	local gunLevelMaterialName = nil
	if attachmentIndex ~= 0 then
		gunLevelMaterialName = Engine.GetAttachmentImageByIndex( attachmentIndex )
	else
		gunLevelMaterialName = Engine.GetItemImage( itemIndex )
	end
	local itemName = Engine.GetItemName( itemIndex )
	local weaponName = Engine.Localize( itemName )
	local perControllerModel = Engine.GetModelForController( event.controller )
	local gunLevelWeaponNameModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedGunLevelWeaponName" )
	Engine.SetModelValue( gunLevelWeaponNameModel, weaponName )
	local gunLevelAttachRewardTextModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedGunLevelAttachRewardText" )
	if attachmentIndex ~= 0 then
		local attachmentText = Engine.Localize( "RANK_GUN_UNLOCK_ATT", Engine.Localize( Engine.GetAttachmentNameByIndex( attachmentIndex ) ) )
		Engine.SetModelValue( gunLevelAttachRewardTextModel, attachmentText )
	elseif rewardXP ~= 0 then
		local rewardText = Engine.Localize( "RANK_XP", rewardXP )
		Engine.SetModelValue( gunLevelAttachRewardTextModel, rewardText )
	end
	local gunLevelWeaponImageModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedGunLevelWeaponImage" )
	Engine.SetModelValue( gunLevelWeaponImageModel, gunLevelMaterialName )
	self:playClip( "GunLevelEarned" )
	self:addElement( LUI.UITimer.new( 1800, "notification_complete", true ) )
end

CoD.InGameNotificationQueue.RankUp = function ( self, event )
	CoD.InGameNotificationQueue.AddToQueue( self, CoD.InGameNotificationQueue.Priorities.Rank, CoD.InGameNotificationQueue.RankUpNotify, event )
end

CoD.InGameNotificationQueue.RankUpNotify = function ( self, event )
	local rankID = event.data[1]
	local prestige = event.data[2]
	local rankMaterialLowRes = Engine.TableLookup( nil, CoD.rankIconTable, 0, rankID, prestige + 1 )
	local rankMaterialName = rankMaterialLowRes .. "_128"
	local rankFullNameColumn = 5
	local newRankTitle = Engine.TableLookup( event.controller, CoD.rankTable, 0, rankID, rankFullNameColumn )
	local perControllerModel = Engine.GetModelForController( event.controller )
	local rankUpNameModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedRankUpName" )
	Engine.SetModelValue( rankUpNameModel, newRankTitle )
	local rankUpImageModel = Engine.GetModel( perControllerModel, "inGameNotifications.earnedRankUpImage" )
	Engine.SetModelValue( rankUpImageModel, rankMaterialName )
	self:playClip( "RankUpEarned" )
	self:addElement( LUI.UITimer.new( 2100, "notification_complete", true ) )
end

CoD.InGameNotificationQueue.ChallengeComplete = function ( self, event )
	CoD.InGameNotificationQueue.AddToQueue( self, CoD.InGameNotificationQueue.Priorities.Challenge, CoD.InGameNotificationQueue.ChallengeCompleteNotify, event )
end

CoD.InGameNotificationQueue.ChallengeCompleteNotify = function ( self, event )
	CoD.InGameNotificationQueue.NotificationComplete()
end

CoD.InGameNotificationQueue.PlayerCallout = function ( self, event )
	local controller = event.controller
	local perControllerModel = Engine.GetModelForController( controller )
	local message = Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" )
	local calloutPlayerData = Engine.GetCalloutPlayerData( controller, event.data[2] )
	local namePlateModel = Engine.GetModel( perControllerModel, "namePlate" )
	local headingModel = Engine.GetModel( namePlateModel, "playerCalloutHeading" )
	Engine.SetModelValue( headingModel, message )
	local playerNameModel = Engine.GetModel( namePlateModel, "playerCalloutPlayerName" )
	Engine.SetModelValue( playerNameModel, calloutPlayerData.playerName )
	local clanTagModel = Engine.GetModel( namePlateModel, "playerCalloutClanTag" )
	Engine.SetModelValue( clanTagModel, calloutPlayerData.clanTag )
	local rankIconModel = Engine.GetModel( namePlateModel, "playerCalloutRankIcon" )
	Engine.SetModelValue( rankIconModel, calloutPlayerData.rankIcon )
	local rankModel = Engine.GetModel( namePlateModel, "playerCalloutRank" )
	Engine.SetModelValue( rankModel, calloutPlayerData.rank )
	local heroModel = Engine.GetModel( namePlateModel, "playerXuid" )
	Engine.SetModelValue( heroModel, calloutPlayerData.xuid )
	local selectedBgModel = Engine.GetModel( namePlateModel, "playerCalloutSelectedBg" )
	local useServer = 1
	if Engine.GetXUID( controller ) == calloutPlayerData.xuid then
		useServer = 0
	end
	local materialName = Engine.EmblemPlayerBackgroundMaterial( controller, calloutPlayerData.xuid, useServer )
	if not materialName then
		Engine.SetModelValue( selectedBgModel, "emblem_bg_default" )
	else
		Engine.SetModelValue( selectedBgModel, materialName )
	end
end

CoD.InGameNotificationQueue.PlayerObituaryCallout = function ( self, event )
	local controller = event.controller
	local perControllerModel = Engine.GetModelForController( controller )
	local headingModel = Engine.GetModel( perControllerModel, "namePlate.playerObitCalloutHeading" )
	Engine.SetModelValue( headingModel, event.killString )
	local playerNameModel = Engine.GetModel( perControllerModel, "namePlate.playerObitCalloutPlayerName" )
	Engine.SetModelValue( playerNameModel, event.playerName )
	local clanTagModel = Engine.GetModel( perControllerModel, "namePlate.playerObitCalloutClanTag" )
	Engine.SetModelValue( clanTagModel, event.clanTag )
	local rankIconModel = Engine.GetModel( perControllerModel, "namePlate.playerObitCalloutRankIcon" )
	Engine.SetModelValue( rankIconModel, event.rankIcon )
	local rankModel = Engine.GetModel( perControllerModel, "namePlate.playerObitCalloutRank" )
	Engine.SetModelValue( rankModel, event.rank )
	local selectedBgModel = Engine.GetModel( perControllerModel, "namePlate.playerObitCalloutSelectedBg" )
	local useServer = 1
	if Engine.GetXUID( controller ) == event.xuid then
		useServer = 0
	end
	local materialName = Engine.EmblemPlayerBackgroundMaterial( controller, event.xuid, useServer )
	if not materialName then
		Engine.SetModelValue( selectedBgModel, "emblem_bg_default" )
	else
		Engine.SetModelValue( selectedBgModel, materialName )
	end
end

