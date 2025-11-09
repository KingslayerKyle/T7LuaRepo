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
LUI.createMenu.PowerUpsArea = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "PowerUpsArea", controller )
	self:setOwner( controller )
	self.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.scaleContainer:setLeftRight( false, false, 0, 0 )
	self.scaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.scaleContainer )
	local powerUpContainerWidth = CoD.PowerUps.IconSize * 0.5
	local powerUpContainerHeight = CoD.PowerUps.IconSize + CoD.PowerUps.UpgradeIconSize + 10
	local powerUpIconContainer = nil
	self.powerUps = {}
	for i = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		powerUpIconContainer = LUI.UIElement.new()
		powerUpIconContainer:setLeftRight( false, false, -powerUpContainerWidth, powerUpContainerWidth )
		powerUpIconContainer:setTopBottom( false, true, -powerUpContainerHeight, 0 )
		powerUpIconContainer:registerEventHandler( "transition_complete_off_fade_out", CoD.PowerUps.PowerUpIcon_UpdatePosition )
		
		local powerUpIcon = LUI.UIImage.new()
		powerUpIcon:setLeftRight( true, true, 0, 0 )
		powerUpIcon:setTopBottom( false, true, -CoD.PowerUps.IconSize, 0 )
		powerUpIcon:setAlpha( 0 )
		powerUpIconContainer:addElement( powerUpIcon )
		powerUpIconContainer.powerUpIcon = powerUpIcon
		
		local upgradePowerUpIcon = LUI.UIImage.new()
		upgradePowerUpIcon:setLeftRight( false, false, -CoD.PowerUps.UpgradeIconSize / 2, CoD.PowerUps.UpgradeIconSize / 2 )
		upgradePowerUpIcon:setTopBottom( true, false, 0, CoD.PowerUps.UpgradeIconSize )
		upgradePowerUpIcon:setAlpha( 0 )
		powerUpIconContainer:addElement( upgradePowerUpIcon )
		powerUpIconContainer.upgradePowerUpIcon = upgradePowerUpIcon
		
		powerUpIconContainer.powerupId = nil
		self.scaleContainer:addElement( powerUpIconContainer )
		self.powerUps[i] = powerUpIconContainer
		self:registerEventHandler( CoD.PowerUps.ClientFieldNames[i].clientFieldName, CoD.PowerUps.Update )
		self:registerEventHandler( CoD.PowerUps.ClientFieldNames[i].clientFieldName .. "_ug", CoD.PowerUps.UpgradeUpdate )
	end
	self.activePowerUpCount = 0
	self:registerEventHandler( "hud_update_refresh", CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.PowerUps.UpdateVisibility )
	self:registerEventHandler( "powerups_update_position", CoD.PowerUps.UpdatePosition )
	self.visible = true
	return self
end

CoD.PowerUps.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_teamscore" )) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

CoD.PowerUps.Update = function ( self, event )
	CoD.PowerUps.UpdateState( self, event )
	CoD.PowerUps.UpdatePosition( self, event )
end

CoD.PowerUps.UpdateState = function ( self, event )
	local powerUpIconContainer = nil
	local existedPowerUpIndex = CoD.PowerUps.GetExistingPowerUpIndex( self, event.name )
	if existedPowerUpIndex ~= nil then
		powerUpIconContainer = self.powerUps[existedPowerUpIndex]
		if event.newValue == CoD.PowerUps.STATE_ON then
			powerUpIconContainer.powerUpId = event.name
			powerUpIconContainer.powerUpIcon:setImage( CoD.PowerUps.GetMaterial( self, event.controller, event.name ) )
			powerUpIconContainer.powerUpIcon:setAlpha( 1 )
		elseif event.newValue == CoD.PowerUps.STATE_OFF then
			powerUpIconContainer.powerUpIcon:beginAnimation( "off_fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			powerUpIconContainer.powerUpIcon:setAlpha( 0 )
			powerUpIconContainer.upgradePowerUpIcon:beginAnimation( "off_fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			powerUpIconContainer.upgradePowerUpIcon:setAlpha( 0 )
			powerUpIconContainer.powerUpId = nil
			self.activePowerUpCount = self.activePowerUpCount - 1
		elseif event.newValue == CoD.PowerUps.STATE_FLASHING_OFF then
			powerUpIconContainer.powerUpIcon:beginAnimation( "fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			powerUpIconContainer.powerUpIcon:setAlpha( 0 )
		elseif event.newValue == CoD.PowerUps.STATE_FLASHING_ON then
			powerUpIconContainer.powerUpIcon:beginAnimation( "fade_in", CoD.PowerUps.FLASHING_STAGE_DURATION )
			powerUpIconContainer.powerUpIcon:setAlpha( 1 )
		end
	elseif event.newValue == CoD.PowerUps.STATE_ON or event.newValue == CoD.PowerUps.STATE_FLASHING_ON then
		local firstAvailableIndex = CoD.PowerUps.GetFirstAvailablePowerUpIndex( self )
		if firstAvailableIndex ~= nil then
			powerUpIconContainer = self.powerUps[firstAvailableIndex]
			powerUpIconContainer.powerUpId = event.name
			powerUpIconContainer.powerUpIcon:setImage( CoD.PowerUps.GetMaterial( self, event.controller, event.name ) )
			powerUpIconContainer.powerUpIcon:setAlpha( 1 )
			self.activePowerUpCount = self.activePowerUpCount + 1
		end
	end
end

CoD.PowerUps.UpgradeUpdate = function ( self, event )
	CoD.PowerUps.UpgradeUpdateState( self, event )
end

CoD.PowerUps.UpgradeUpdateState = function ( self, event )
	local upgradePowerUpIcon = nil
	local existedPowerUpIndex = CoD.PowerUps.GetExistingPowerUpIndex( self, string.sub( event.name, 0, -4 ) )
	if existedPowerUpIndex ~= nil then
		upgradePowerUpIcon = self.powerUps[existedPowerUpIndex].upgradePowerUpIcon
		if event.newValue == CoD.PowerUps.STATE_ON then
			upgradePowerUpIcon:setImage( CoD.PowerUps.GetUpgradeMaterial( self, event.name ) )
			upgradePowerUpIcon:setAlpha( 1 )
			CoD.PowerUps.SetUpgradeColor( upgradePowerUpIcon, event.name )
		elseif event.newValue == CoD.PowerUps.STATE_OFF then
			upgradePowerUpIcon:beginAnimation( "off_fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			upgradePowerUpIcon:setAlpha( 0 )
		elseif event.newValue == CoD.PowerUps.STATE_FLASHING_OFF then
			upgradePowerUpIcon:beginAnimation( "fade_out", CoD.PowerUps.FLASHING_STAGE_DURATION )
			upgradePowerUpIcon:setAlpha( 0 )
		elseif event.newValue == CoD.PowerUps.STATE_FLASHING_ON then
			upgradePowerUpIcon:beginAnimation( "fade_in", CoD.PowerUps.FLASHING_STAGE_DURATION )
			upgradePowerUpIcon:setAlpha( 1 )
		end
	end
end

CoD.PowerUps.GetMaterial = function ( self, controller, fieldName )
	local material = nil
	for i = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		if CoD.PowerUps.ClientFieldNames[i].clientFieldName == fieldName then
			material = CoD.PowerUps.ClientFieldNames[i].material
			if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE ) and CoD.PowerUps.ClientFieldNames[i].z_material then
				material = CoD.PowerUps.ClientFieldNames[i].z_material
				break
			end
		end
	end
	return material
end

CoD.PowerUps.GetUpgradeMaterial = function ( self, fieldName )
	local material = nil
	for i = 1, #CoD.PowerUps.UpgradeClientFieldNames, 1 do
		if CoD.PowerUps.UpgradeClientFieldNames[i].clientFieldName == fieldName then
			material = CoD.PowerUps.UpgradeClientFieldNames[i].material
			break
		end
	end
	return material
end

CoD.PowerUps.SetUpgradeColor = function ( self, fieldName )
	local color = nil
	for i = 1, #CoD.PowerUps.UpgradeClientFieldNames, 1 do
		if CoD.PowerUps.UpgradeClientFieldNames[i].clientFieldName == fieldName then
			if CoD.PowerUps.UpgradeClientFieldNames[i].color then
				self:setRGB( CoD.PowerUps.UpgradeClientFieldNames[i].color.r, CoD.PowerUps.UpgradeClientFieldNames[i].color.g, CoD.PowerUps.UpgradeClientFieldNames[i].color.b )
				break
			end
		end
	end
end

CoD.PowerUps.GetExistingPowerUpIndex = function ( self, powerUpId )
	for i = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		if self.powerUps[i].powerUpId == powerUpId then
			return i
		end
	end
	return nil
end

CoD.PowerUps.GetFirstAvailablePowerUpIndex = function ( self )
	for i = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		if not self.powerUps[i].powerUpId then
			return i
		end
	end
	return nil
end

CoD.PowerUps.PowerUpIcon_UpdatePosition = function ( icon, event )
	if event.interrupted ~= true then
		icon:dispatchEventToParent( {
			name = "powerups_update_position"
		} )
	end
end

CoD.PowerUps.UpdatePosition = function ( self, event )
	local currentPowerUp = nil
	local leftValue = 0
	local rightValue = 0
	local preLeftValue = nil
	for i = 1, #CoD.PowerUps.ClientFieldNames, 1 do
		currentPowerUp = self.powerUps[i]
		if currentPowerUp.powerUpId ~= nil then
			if not preLeftValue then
				leftValue = -(CoD.PowerUps.IconSize * 0.5 * self.activePowerUpCount + CoD.PowerUps.Spacing * 0.5 * (self.activePowerUpCount - 1))
			else
				leftValue = preLeftValue + CoD.PowerUps.IconSize + CoD.PowerUps.Spacing
			end
			rightValue = leftValue + CoD.PowerUps.IconSize
			currentPowerUp:beginAnimation( "move", CoD.PowerUps.MOVING_DURATION )
			currentPowerUp:setLeftRight( false, false, leftValue, rightValue )
			preLeftValue = leftValue
		end
	end
end

