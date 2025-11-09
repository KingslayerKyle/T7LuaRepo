CoD.PowerUps = {}
CoD.PowerUps.IconSize = 48
CoD.PowerUps.UpgradeIconSize = 36
CoD.PowerUps.Spacing = 8
CoD.PowerUps.STATE_OFF = 0
CoD.PowerUps.STATE_ON = 1
CoD.PowerUps.STATE_FLASHING_OFF = 2
CoD.PowerUps.STATE_FLASHING_ON = 3
CoD.PowerUps.FLASHING_STAGE_DURATION = 500
CoD.PowerUps.MOVING_DURATION = 500
CoD.PowerUps.UpGradeIconColorRed = {
	r = 1,
	g = 0,
	b = 0
}
CoD.PowerUps.ClientFieldNames = {}
CoD.PowerUps.ClientFieldNames[1] = {
	clientFieldName = "powerup_instant_kill",
	material = RegisterMaterial( "specialty_instakill_zombies" )
}
CoD.PowerUps.ClientFieldNames[2] = {
	clientFieldName = "powerup_double_points",
	material = RegisterMaterial( "specialty_doublepoints_zombies" ),
	z_material = RegisterMaterial( "specialty_doublepoints_zombies_blue" )
}
CoD.PowerUps.ClientFieldNames[3] = {
	clientFieldName = "powerup_fire_sale",
	material = RegisterMaterial( "specialty_firesale_zombies" )
}
CoD.PowerUps.ClientFieldNames[4] = {
	clientFieldName = "powerup_bon_fire",
	material = RegisterMaterial( "zom_icon_bonfire" )
}
CoD.PowerUps.ClientFieldNames[5] = {
	clientFieldName = "powerup_mini_gun",
	material = RegisterMaterial( "zom_icon_minigun" )
}
CoD.PowerUps.ClientFieldNames[6] = {
	clientFieldName = "powerup_zombie_blood",
	material = RegisterMaterial( "specialty_zomblood_zombies" )
}
CoD.PowerUps.UpgradeClientFieldNames = {}
CoD.PowerUps.UpgradeClientFieldNames[1] = {
	clientFieldName = CoD.PowerUps.ClientFieldNames[1].clientFieldName .. "_ug",
	material = RegisterMaterial( "specialty_instakill_zombies" ),
	color = CoD.PowerUps.UpGradeIconColorRed
}
LUI.createMenu.PowerUpsArea = function ( f1_arg0 )
	local f1_local0 = CoD.Menu.NewSafeAreaFromState( "PowerUpsArea", f1_arg0 )
	f1_local0:setOwner( f1_arg0 )
	f1_local0.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	f1_local0.scaleContainer:setLeftRight( false, false, 0, 0 )
	f1_local0.scaleContainer:setTopBottom( false, true, 0, 0 )
	f1_local0:addElement( f1_local0.scaleContainer )
	local f1_local1 = CoD.PowerUps.IconSize * 0.5
	local f1_local2 = CoD.PowerUps.IconSize + CoD.PowerUps.UpgradeIconSize + 10
	local self = nil
	f1_local0.powerUps = {}
	for f1_local4 = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		self = LUI.UIElement.new()
		self:setLeftRight( false, false, -f1_local1, f1_local1 )
		self:setTopBottom( false, true, -f1_local2, 0 )
		self:registerEventHandler( "transition_complete_off_fade_out", CoD.PowerUps.PowerUpIcon_UpdatePosition )
		
		local powerUpIcon = LUI.UIImage.new()
		powerUpIcon:setLeftRight( true, true, 0, 0 )
		powerUpIcon:setTopBottom( false, true, -CoD.PowerUps.IconSize, 0 )
		powerUpIcon:setAlpha( 0 )
		self:addElement( powerUpIcon )
		self.powerUpIcon = powerUpIcon
		
		local upgradePowerUpIcon = LUI.UIImage.new()
		upgradePowerUpIcon:setLeftRight( false, false, -CoD.PowerUps.UpgradeIconSize / 2, CoD.PowerUps.UpgradeIconSize / 2 )
		upgradePowerUpIcon:setTopBottom( true, false, 0, CoD.PowerUps.UpgradeIconSize )
		upgradePowerUpIcon:setAlpha( 0 )
		self:addElement( upgradePowerUpIcon )
		self.upgradePowerUpIcon = upgradePowerUpIcon
		
		self.powerupId = nil
		f1_local0.scaleContainer:addElement( self )
		f1_local0.powerUps[f1_local4] = self
		f1_local0:registerEventHandler( CoD.PowerUps.ClientFieldNames[f1_local4].clientFieldName, CoD.PowerUps.Update )
		f1_local0:registerEventHandler( CoD.PowerUps.ClientFieldNames[f1_local4].clientFieldName .. "_ug", CoD.PowerUps.UpgradeUpdate )
	end
	f1_local0.activePowerUpCount = 0
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		CoD.PowerUps.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:registerEventHandler( "powerups_update_position", CoD.PowerUps.UpdatePosition )
	f1_local0.visible = true
	return f1_local0
end

CoD.PowerUps.UpdateVisibility = function ( f15_arg0, f15_arg1 )
	if Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and (not CoD.IsShoutcaster( f15_arg1 ) or CoD.ShoutcasterProfileVarBool( f15_arg1, "shoutcaster_teamscore" )) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( f15_arg1, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) then
		if not f15_arg0.visible then
			f15_arg0:setAlpha( 1 )
			f15_arg0.visible = true
		end
	elseif f15_arg0.visible then
		f15_arg0:setAlpha( 0 )
		f15_arg0.visible = nil
	end
end

CoD.PowerUps.Update = function ( f16_arg0, f16_arg1 )
	CoD.PowerUps.UpdateState( f16_arg0, f16_arg1 )
	CoD.PowerUps.UpdatePosition( f16_arg0, f16_arg1 )
end

CoD.PowerUps.UpdateState = function ( f17_arg0, f17_arg1 )
	local f17_local0 = nil
	local f17_local1 = CoD.PowerUps.GetExistingPowerUpIndex( f17_arg0, f17_arg1.name )
	if f17_local1 ~= nil then
		f17_local0 = f17_arg0.powerUps[f17_local1]
		if f17_arg1.newValue == CoD.PowerUps.STATE_ON then
			f17_local0.powerUpId = f17_arg1.name
			f17_local0.powerUpIcon:setImage( CoD.PowerUps.GetMaterial( f17_arg0, f17_arg1.controller, f17_arg1.name ) )
			f17_local0.powerUpIcon:setAlpha( 1 )
		elseif f17_arg1.newValue == CoD.PowerUps.STATE_OFF then
			f17_local0.powerUpIcon:beginAnimation( "off_fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			f17_local0.powerUpIcon:setAlpha( 0 )
			f17_local0.upgradePowerUpIcon:beginAnimation( "off_fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			f17_local0.upgradePowerUpIcon:setAlpha( 0 )
			f17_local0.powerUpId = nil
			f17_arg0.activePowerUpCount = f17_arg0.activePowerUpCount - 1
		elseif f17_arg1.newValue == CoD.PowerUps.STATE_FLASHING_OFF then
			f17_local0.powerUpIcon:beginAnimation( "fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			f17_local0.powerUpIcon:setAlpha( 0 )
		elseif f17_arg1.newValue == CoD.PowerUps.STATE_FLASHING_ON then
			f17_local0.powerUpIcon:beginAnimation( "fade_in", CoD.PowerUps.FLASHING_STAGE_DURATION )
			f17_local0.powerUpIcon:setAlpha( 1 )
		end
	elseif f17_arg1.newValue == CoD.PowerUps.STATE_ON or f17_arg1.newValue == CoD.PowerUps.STATE_FLASHING_ON then
		local f17_local2 = CoD.PowerUps.GetFirstAvailablePowerUpIndex( f17_arg0 )
		if f17_local2 ~= nil then
			f17_local0 = f17_arg0.powerUps[f17_local2]
			f17_local0.powerUpId = f17_arg1.name
			f17_local0.powerUpIcon:setImage( CoD.PowerUps.GetMaterial( f17_arg0, f17_arg1.controller, f17_arg1.name ) )
			f17_local0.powerUpIcon:setAlpha( 1 )
			f17_arg0.activePowerUpCount = f17_arg0.activePowerUpCount + 1
		end
	end
end

CoD.PowerUps.UpgradeUpdate = function ( f18_arg0, f18_arg1 )
	CoD.PowerUps.UpgradeUpdateState( f18_arg0, f18_arg1 )
end

CoD.PowerUps.UpgradeUpdateState = function ( f19_arg0, f19_arg1 )
	local f19_local0 = nil
	local f19_local1 = CoD.PowerUps.GetExistingPowerUpIndex( f19_arg0, string.sub( f19_arg1.name, 0, -4 ) )
	if f19_local1 ~= nil then
		f19_local0 = f19_arg0.powerUps[f19_local1].upgradePowerUpIcon
		if f19_arg1.newValue == CoD.PowerUps.STATE_ON then
			f19_local0:setImage( CoD.PowerUps.GetUpgradeMaterial( f19_arg0, f19_arg1.name ) )
			f19_local0:setAlpha( 1 )
			CoD.PowerUps.SetUpgradeColor( f19_local0, f19_arg1.name )
		elseif f19_arg1.newValue == CoD.PowerUps.STATE_OFF then
			f19_local0:beginAnimation( "off_fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			f19_local0:setAlpha( 0 )
		elseif f19_arg1.newValue == CoD.PowerUps.STATE_FLASHING_OFF then
			f19_local0:beginAnimation( "fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			f19_local0:setAlpha( 0 )
		elseif f19_arg1.newValue == CoD.PowerUps.STATE_FLASHING_ON then
			f19_local0:beginAnimation( "fade_in", CoD.PowerUps.FLASHING_STAGE_DURATION )
			f19_local0:setAlpha( 1 )
		end
	end
end

CoD.PowerUps.GetMaterial = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0 = nil
	for f20_local1 = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		if CoD.PowerUps.ClientFieldNames[f20_local1].clientFieldName == f20_arg2 then
			f20_local0 = CoD.PowerUps.ClientFieldNames[f20_local1].material
			if Engine.IsVisibilityBitSet( f20_arg1, Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE ) and CoD.PowerUps.ClientFieldNames[f20_local1].z_material then
				f20_local0 = CoD.PowerUps.ClientFieldNames[f20_local1].z_material
				break
			end
		end
	end
	return f20_local0
end

CoD.PowerUps.GetUpgradeMaterial = function ( f21_arg0, f21_arg1 )
	local f21_local0 = nil
	for f21_local1 = 1, #CoD.PowerUps.UpgradeClientFieldNames, 1 do
		if CoD.PowerUps.UpgradeClientFieldNames[f21_local1].clientFieldName == f21_arg1 then
			f21_local0 = CoD.PowerUps.UpgradeClientFieldNames[f21_local1].material
			break
		end
	end
	return f21_local0
end

CoD.PowerUps.SetUpgradeColor = function ( f22_arg0, f22_arg1 )
	local f22_local0 = nil
	for f22_local1 = 1, #CoD.PowerUps.UpgradeClientFieldNames, 1 do
		if CoD.PowerUps.UpgradeClientFieldNames[f22_local1].clientFieldName == f22_arg1 then
			if CoD.PowerUps.UpgradeClientFieldNames[f22_local1].color then
				f22_arg0:setRGB( CoD.PowerUps.UpgradeClientFieldNames[f22_local1].color.r, CoD.PowerUps.UpgradeClientFieldNames[f22_local1].color.g, CoD.PowerUps.UpgradeClientFieldNames[f22_local1].color.b )
				break
			end
		end
	end
end

CoD.PowerUps.GetExistingPowerUpIndex = function ( f23_arg0, f23_arg1 )
	for f23_local0 = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		if f23_arg0.powerUps[f23_local0].powerUpId == f23_arg1 then
			return f23_local0
		end
	end
	return nil
end

CoD.PowerUps.GetFirstAvailablePowerUpIndex = function ( f24_arg0 )
	for f24_local0 = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		if not f24_arg0.powerUps[f24_local0].powerUpId then
			return f24_local0
		end
	end
	return nil
end

CoD.PowerUps.PowerUpIcon_UpdatePosition = function ( f25_arg0, f25_arg1 )
	if f25_arg1.interrupted ~= true then
		f25_arg0:dispatchEventToParent( {
			name = "powerups_update_position"
		} )
	end
end

CoD.PowerUps.UpdatePosition = function ( f26_arg0, f26_arg1 )
	local f26_local0 = nil
	local f26_local1 = 0
	local f26_local2 = 0
	local f26_local3 = nil
	for f26_local4 = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		f26_local0 = f26_arg0.powerUps[f26_local4]
		if f26_local0.powerUpId ~= nil then
			if not f26_local3 then
				f26_local1 = -(CoD.PowerUps.IconSize * 0.5 * f26_arg0.activePowerUpCount + CoD.PowerUps.Spacing * 0.5 * (f26_arg0.activePowerUpCount - 1))
			else
				f26_local1 = f26_local3 + CoD.PowerUps.IconSize + CoD.PowerUps.Spacing
			end
			f26_local2 = f26_local1 + CoD.PowerUps.IconSize
			f26_local0:beginAnimation( "move", CoD.PowerUps.MOVING_DURATION )
			f26_local0:setLeftRight( false, false, f26_local1, f26_local2 )
			f26_local3 = f26_local1
		end
	end
end

