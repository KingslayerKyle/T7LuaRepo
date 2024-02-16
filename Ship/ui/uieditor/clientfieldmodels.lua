-- 9d82122d014167b298d7b1f947be954c
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = 1
local f0_local1 = 1000
local f0_local2 = 2000
local f0_local3 = 3000
local f0_local4 = 4000
local f0_local5 = 5000
local f0_local6 = 6000
local f0_local7 = 6001
local f0_local8 = 7000
local f0_local9 = 8000
local f0_local10 = 9000
local f0_local11 = 9001
local f0_local12 = 10000
local f0_local13 = 11000
local f0_local14 = 11001
local f0_local15 = 12000
local f0_local16 = 13000
local f0_local17 = 14000
local f0_local18 = 15000
local f0_local19 = 15001
local f0_local20 = 16000
local f0_local21 = 17000
local f0_local22 = 18000
local f0_local23 = 19000
local f0_local24 = 20000
local f0_local25 = 21000
local f0_local26 = 27000
local f0_local27 = f0_local5
local f0_local28 = f0_local10
local f0_local29 = f0_local15
local f0_local30 = f0_local18
local f0_local31 = f0_local25
CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
if not CoD.isFrontend and not CoD.isZombie then
	Engine.RegisterClientUIModelField( "hudItems.rejack.activationWindowEntered", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.rejack.rejackActivated", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
end
if Engine.IsScrSystemActive( "weaponobjects" ) then
	Engine.RegisterClientUIModelField( "hudItems.proximityAlarm", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
end
if CoD.isMultiplayer and not CoD.isFrontend then
	Engine.RegisterClientUIModelField( "hudItems.killcamAllowRespawn", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.hideOutcomeUI", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.remoteKillstreakActivated", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.captureCrateState", Enum.UIModelClientFieldType.CF_INT, 2, f0_local5 )
	Engine.RegisterClientUIModelField( "hudItems.captureCrateTotalTime", Enum.UIModelClientFieldType.CF_INT, 13, f0_local5 )
	if Dvar.ui_gametype:get() == "clean" then
		Engine.RegisterClientUIModelField( "hudItems.cleanCarryCount", Enum.UIModelClientFieldType.CF_INT, 4, f0_local15 )
		Engine.RegisterClientUIModelField( "hudItems.cleanCarryFull", Enum.UIModelClientFieldType.CF_INT, 1, f0_local15 )
	end
end
if CoD.isSafehouse then
	Engine.RegisterClientUIModelField( "safehouse.inClientBunk", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "safehouse.inTrainingSim", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
end
if Engine.IsScrSystemActive( "cybercom" ) then
	Engine.RegisterClientUIModelField( "playerAbilities.inRange", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
end
if CoD.isCampaign and not CoD.isFrontend then
	Engine.RegisterClientUIModelField( "hudItems.cybercoreSelectMenuDisabled", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.playerInCombat", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "playerAbilities.repulsorIndicatorDirection", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "playerAbilities.repulsorIndicatorIntensity", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "playerAbilities.proximityIndicatorDirection", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "playerAbilities.proximityIndicatorIntensity", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "serverDifficulty", Enum.UIModelClientFieldType.CF_INT, 3, f0_local0 )
end
if Engine.IsScrSystemActive( "aquifer_util" ) then
	Engine.RegisterClientUIModelField( "vehicle.weaponIndex", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "vehicle.lockOn", Enum.UIModelClientFieldType.CF_FLOAT, 8, f0_local0 )
	Engine.RegisterClientUIModelField( "vehicle.showLandHint", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "vehicle.showAimHint", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hackUpload.percent", Enum.UIModelClientFieldType.CF_FLOAT, 8, f0_local0 )
end
if not CoD.isFrontend and not CoD.isCampaign and CoD.isZombie then
	Engine.RegisterClientUIModelField( "hudItems.doublePointsActive", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "player_lives", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "zmhud.swordEnergy", Enum.UIModelClientFieldType.CF_FLOAT, 7, f0_local0 )
	Engine.RegisterClientUIModelField( "zmhud.swordState", Enum.UIModelClientFieldType.CF_INT, 2, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.showDpadUp", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.showDpadDown", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.showDpadLeft", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	Engine.RegisterClientUIModelField( "hudItems.showDpadRight", Enum.UIModelClientFieldType.CF_INT, 1, f0_local0 )
	local f0_local32 = 4
	for f0_local33 = 0, f0_local32 - 1, 1 do
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local33 .. ".score_cf_damage", Enum.UIModelClientFieldType.CF_COUNTER, 3, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local33 .. ".score_cf_death_normal", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local33 .. ".score_cf_death_torso", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local33 .. ".score_cf_death_neck", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local33 .. ".score_cf_death_head", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local33 .. ".score_cf_death_melee", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
	end
	if Engine.GetCurrentMap() == "zm_island" then
		Engine.RegisterClientUIModelField( "hudItems.showDpadRight_Spider", Enum.UIModelClientFieldType.CF_INT, 1, f0_local28 )
	end
	if Engine.GetCurrentMap() == "zm_stalingrad" then
		Engine.RegisterClientUIModelField( "trialWidget.icon", Enum.UIModelClientFieldType.CF_INT, 2, f0_local29 )
		Engine.RegisterClientUIModelField( "trialWidget.challenge1state", Enum.UIModelClientFieldType.CF_INT, 2, f0_local29 )
		Engine.RegisterClientUIModelField( "trialWidget.challenge2state", Enum.UIModelClientFieldType.CF_INT, 2, f0_local29 )
		Engine.RegisterClientUIModelField( "trialWidget.challenge3state", Enum.UIModelClientFieldType.CF_INT, 2, f0_local29 )
	end
	if Engine.GetCurrentMap() == "zm_genesis" then
		Engine.RegisterClientUIModelField( "trialWidget.icon", Enum.UIModelClientFieldType.CF_INT, 2, f0_local29 )
	end
	if Engine.GetCurrentMap() == "zm_island" or Engine.GetCurrentMap() == "zm_stalingrad" or Engine.GetCurrentMap() == "zm_genesis" then
		Engine.RegisterClientUIModelField( "trialWidget.visible", Enum.UIModelClientFieldType.CF_INT, 1, f0_local28 )
		Engine.RegisterClientUIModelField( "trialWidget.progress", Enum.UIModelClientFieldType.CF_FLOAT, 7, f0_local28 )
	end
end
