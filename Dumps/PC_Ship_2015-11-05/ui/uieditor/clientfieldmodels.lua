local f0_local0 = 1
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
	local f0_local1 = 4
	for f0_local2 = 0, f0_local1 - 1, 1 do
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local2 .. ".score_cf_damage", Enum.UIModelClientFieldType.CF_COUNTER, 3, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local2 .. ".score_cf_death_normal", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local2 .. ".score_cf_death_torso", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local2 .. ".score_cf_death_neck", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local2 .. ".score_cf_death_head", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
		Engine.RegisterClientUIModelField( "PlayerList.client" .. f0_local2 .. ".score_cf_death_melee", Enum.UIModelClientFieldType.CF_COUNTER, 2, f0_local0 )
	end
end
