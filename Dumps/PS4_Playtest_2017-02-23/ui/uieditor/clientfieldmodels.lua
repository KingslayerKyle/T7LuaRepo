local VERSION_SHIP = 1
local VERSION_TU5 = 5000
CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
if Engine.IsScrSystemActive( "gadget_resurrect" ) and not CoD.isFrontend and not CoD.isZombie then
	Engine.RegisterClientUIModelField( "hudItems.rejack.activationWindowEntered", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.rejack.rejackActivated", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
end
if Engine.IsScrSystemActive( "weaponobjects" ) then
	Engine.RegisterClientUIModelField( "hudItems.proximityAlarm", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
end
if Engine.IsScrSystemActive( "cryptopad" ) then
	Engine.RegisterClientUIModelField( "hudItems.vehicleHack.mode", Enum.UIModelClientFieldType.CF_INT, 11, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.vehicleHack.level", Enum.UIModelClientFieldType.CF_INT, 5, VERSION_SHIP )
end
if not CoD.isFrontend then
	Engine.RegisterClientUIModelField( "hudItems.killcamAllowRespawn", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
end
if CoD.isMultiplayer and not CoD.isFrontend then
	Engine.RegisterClientUIModelField( "hudItems.hideOutcomeUI", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.remoteKillstreakActivated", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.captureCrateState", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_TU5 )
	Engine.RegisterClientUIModelField( "hudItems.captureCrateTotalTime", Enum.UIModelClientFieldType.CF_INT, 13, VERSION_TU5 )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.progress", Enum.UIModelClientFieldType.CF_FLOAT, 5, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.level", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.unlockTokens", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.majorSlot1.level", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.majorSlot2.level", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.generalSlot1.level", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.generalSlot2.level", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.generalSlot3.level", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.generalSlot4.level", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.lplevel.disableUI", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
end
if CoD.isSafehouse then
	Engine.RegisterClientUIModelField( "safehouse.inClientBunk", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "safehouse.inTrainingSim", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
end
if Engine.IsScrSystemActive( "cp_abilities" ) then
	Engine.RegisterClientUIModelField( "playerAbilities.inRange", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
end
if Engine.IsScrSystemActive( "laststand" ) then
	Engine.RegisterClientUIModelField( "hudItems.laststand.progress", Enum.UIModelClientFieldType.CF_FLOAT, 5, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.laststand.reviver", Enum.UIModelClientFieldType.CF_INT, 5, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.laststand.widgetState", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.laststand.beingRevived", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.laststand.attackerNum", Enum.UIModelClientFieldType.CF_INT, 4, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.laststand.attackerWeapon", Enum.UIModelClientFieldType.CF_INT, 10, VERSION_SHIP )
end
if CoD.isCampaign and not CoD.isFrontend then
	Engine.RegisterClientUIModelField( "hudItems.cybercoreSelectMenuDisabled", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.playerInCombat", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "playerAbilities.repulsorIndicatorDirection", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "playerAbilities.repulsorIndicatorIntensity", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "playerAbilities.proximityIndicatorDirection", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "playerAbilities.proximityIndicatorIntensity", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "serverDifficulty", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "vehicle.vehicleAttackMode", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.companionOrder", Enum.UIModelClientFieldType.CF_INT, Engine.GetObjectiveBitCount() or 7, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.forceShowObjectiveInfo", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
end
if Engine.IsScrSystemActive( "aquifer_util" ) then
	Engine.RegisterClientUIModelField( "vehicle.weaponIndex", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "vehicle.lockOn", Enum.UIModelClientFieldType.CF_FLOAT, 8, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "vehicle.showLandHint", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "vehicle.showAimHint", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hackUpload.percent", Enum.UIModelClientFieldType.CF_FLOAT, 8, VERSION_SHIP )
end
if not CoD.isFrontend and not CoD.isCampaign and CoD.isZombie then
	Engine.RegisterClientUIModelField( "hudItems.doublePointsActive", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "player_lives", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "zmhud.swordEnergy", Enum.UIModelClientFieldType.CF_FLOAT, 7, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "zmhud.swordState", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.showDpadUp", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.showDpadDown", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.showDpadLeft", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "hudItems.showDpadRight", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	local MAX_CLIENTS_ZM = 4
	for i = 0, MAX_CLIENTS_ZM - 1, 1 do
		Engine.RegisterClientUIModelField( "PlayerList.client" .. i .. ".score_cf_damage", Enum.UIModelClientFieldType.CF_COUNTER, 3, VERSION_SHIP )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. i .. ".score_cf_death_normal", Enum.UIModelClientFieldType.CF_COUNTER, 2, VERSION_SHIP )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. i .. ".score_cf_death_torso", Enum.UIModelClientFieldType.CF_COUNTER, 2, VERSION_SHIP )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. i .. ".score_cf_death_neck", Enum.UIModelClientFieldType.CF_COUNTER, 2, VERSION_SHIP )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. i .. ".score_cf_death_head", Enum.UIModelClientFieldType.CF_COUNTER, 2, VERSION_SHIP )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. i .. ".score_cf_death_melee", Enum.UIModelClientFieldType.CF_COUNTER, 2, VERSION_SHIP )
	end
end
Engine.RegisterClientUIModelField( "vehicle.ammo", Enum.UIModelClientFieldType.CF_INT, 8, VERSION_SHIP )
Engine.RegisterClientUIModelField( "vehicle.ammo2", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
Engine.RegisterClientUIModelField( "vehicle.collisionWarning", Enum.UIModelClientFieldType.CF_INT, 2, VERSION_SHIP )
Engine.RegisterClientUIModelField( "vehicle.enemyInReticle", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
Engine.RegisterClientUIModelField( "vehicle.missileRepulsed", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
if not CoD.isFrontend and CoD.isMultiplayer then
	Engine.RegisterClientUIModelField( "PositionDraft.autoSelected", Enum.UIModelClientFieldType.CF_INT, 1, VERSION_SHIP )
	Engine.RegisterClientUIModelField( "PositionDraft.stage", Enum.UIModelClientFieldType.CF_INT, 3, VERSION_SHIP )
end
