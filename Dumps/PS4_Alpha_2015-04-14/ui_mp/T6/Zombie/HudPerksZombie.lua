CoD.Perks = {}
if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
	CoD.Perks.TopStart = -180
elseif CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps ) then
	CoD.Perks.TopStart = -185
else
	CoD.Perks.TopStart = -140
end
CoD.Perks.IconSize = 36
CoD.Perks.Spacing = 8
CoD.Perks.STATE_NOTOWNED = 0
CoD.Perks.STATE_OWNED = 1
CoD.Perks.STATE_PAUSED = 2
CoD.Perks.STATE_TBD = 3
CoD.Perks.ClientFieldNames = {}
CoD.Perks.ClientFieldNames[1] = {
	clientFieldName = "perk_additional_primary_weapon",
	material = RegisterMaterial( "specialty_additionalprimaryweapon_zombies" )
}
CoD.Perks.ClientFieldNames[2] = {
	clientFieldName = "perk_dead_shot",
	material = RegisterMaterial( "specialty_ads_zombies" )
}
CoD.Perks.ClientFieldNames[3] = {
	clientFieldName = "perk_dive_to_nuke",
	material = RegisterMaterial( "specialty_divetonuke_zombies" )
}
CoD.Perks.ClientFieldNames[4] = {
	clientFieldName = "perk_doubletap2",
	material = RegisterMaterial( "specialty_doubletap_zombies" )
}
CoD.Perks.ClientFieldNames[5] = {
	clientFieldName = "perk_juggernaut",
	material = RegisterMaterial( "specialty_juggernaut_zombies" )
}
CoD.Perks.ClientFieldNames[6] = {
	clientFieldName = "perk_marathon",
	material = RegisterMaterial( "specialty_marathon_zombies" )
}
CoD.Perks.ClientFieldNames[7] = {
	clientFieldName = "perk_quick_revive",
	material = RegisterMaterial( "specialty_quickrevive_zombies" )
}
CoD.Perks.ClientFieldNames[8] = {
	clientFieldName = "perk_sleight_of_hand",
	material = RegisterMaterial( "specialty_fastreload_zombies" )
}
CoD.Perks.ClientFieldNames[9] = {
	clientFieldName = "perk_tombstone",
	material = RegisterMaterial( "specialty_tombstone_zombies" )
}
CoD.Perks.ClientFieldNames[10] = {
	clientFieldName = "perk_chugabud",
	material = RegisterMaterial( "specialty_chugabud_zombies" )
}
CoD.Perks.ClientFieldNames[11] = {
	clientFieldName = "perk_widows_wine",
	material = RegisterMaterial( "specialty_widows_wine_zombies" )
}
CoD.Perks.ClientFieldNames[12] = {
	clientFieldName = "perk_vulture",
	material = RegisterMaterial( "specialty_vulture_zombies" ),
	glowMaterial = RegisterMaterial( "zm_hud_stink_perk_glow" )
}
CoD.Perks.PulseDuration = 200
CoD.Perks.PulseScale = 1.3
CoD.Perks.PausedAlpha = 0.3
LUI.createMenu.PerksArea = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "PerksArea", controller )
	self:setOwner( controller )
	self.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.scaleContainer:setLeftRight( true, false, 10, 0 )
	self.scaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.scaleContainer )
	CoD.Perks.MeterBlackMaterial = RegisterMaterial( "zm_hud_stink_ani_black" )
	CoD.Perks.MeterGreenMaterial = RegisterMaterial( "zm_hud_stink_ani_green" )
	local perkLeft, perkRight = nil
	local perkTop = CoD.Perks.TopStart
	local perkBottom = perkTop + CoD.Perks.IconSize
	self.perks = {}
	for i = 1, #CoD.Perks.ClientFieldNames, 1 do
		perkLeft = (CoD.Perks.IconSize + CoD.Perks.Spacing) * (i - 1)
		perkRight = perkLeft + CoD.Perks.IconSize
		local perkIconContainer = LUI.UIElement.new()
		perkIconContainer:setLeftRight( true, false, perkLeft, perkRight )
		perkIconContainer:setTopBottom( false, true, perkTop, perkBottom )
		perkIconContainer:setScale( 1 )
		perkIconContainer.perkId = nil
		
		local perkIcon = LUI.UIImage.new()
		perkIcon:setLeftRight( true, true, 0, 0 )
		perkIcon:setTopBottom( true, true, 0, 0 )
		perkIcon:setAlpha( 0 )
		perkIconContainer:addElement( perkIcon )
		perkIconContainer.perkIcon = perkIcon
		
		perkIconContainer:registerEventHandler( "transition_complete_pulse", CoD.Perks.IconPulseFinish )
		self.scaleContainer:addElement( perkIconContainer )
		self.perks[i] = perkIconContainer
		self:registerEventHandler( CoD.Perks.ClientFieldNames[i].clientFieldName, CoD.Perks.Update )
	end
	self:registerEventHandler( "hud_update_refresh", CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD, CoD.Perks.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.Perks.UpdateVisibility )
	self.visible = true
	return self
end

CoD.Perks.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_scorestreaks" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.m_inputDisabled = nil
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.m_inputDisabled = true
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.Perks.GetMaterial = function ( self, fieldName )
	local material = nil
	for i = 1, #CoD.Perks.ClientFieldNames, 1 do
		if CoD.Perks.ClientFieldNames[i].clientFieldName == fieldName then
			material = CoD.Perks.ClientFieldNames[i].material
			break
		end
	end
	return material
end

CoD.Perks.GetGlowMaterial = function ( self, fieldName )
	local material = nil
	for i = 1, #CoD.Perks.ClientFieldNames, 1 do
		if CoD.Perks.ClientFieldNames[i].clientFieldName == fieldName then
			if CoD.Perks.ClientFieldNames[i].glowMaterial then
				material = CoD.Perks.ClientFieldNames[i].glowMaterial
				break
			end
		end
	end
	return material
end

CoD.Perks.RemovePerkIcon = function ( self, perkIndex )
	local currentPerk, nextPerk = nil
	for i = perkIndex, #CoD.Perks.ClientFieldNames, 1 do
		currentPerk = self.perks[i]
		if not currentPerk.perkId then
			break
		elseif i ~= #CoD.Perks.ClientFieldNames then
			nextPerk = self.perks[i + 1]
		end
		if not nextPerk then
			currentPerk.perkIcon:setAlpha( 0 )
			if currentPerk.perkGlowIcon then
			
			else
				currentPerk.perkId = nil
				break
			end
			currentPerk.perkGlowIcon:setAlpha( 0 )
		elseif not nextPerk.perkId then
			currentPerk.perkIcon:setAlpha( 0 )
			if currentPerk.perkGlowIcon then
				currentPerk.perkGlowIcon:close()
				currentPerk.perkGlowIcon = nil
			end
			if currentPerk.meterContainer then
			
			else
				currentPerk.perkId = nil
				break
			end
			currentPerk.meterContainer:close()
			currentPerk.meterContainer = nil
		else
			currentPerk.perkIcon:setImage( CoD.Perks.GetMaterial( self, nextPerk.perkId ) )
			local glowIcon = CoD.Perks.GetGlowMaterial( self, nextPerk.perkId )
			if glowIcon and currentPerk.perkGlowIcon then
				currentPerk.perkGlowIcon:setImage( glowIcon )
			end
		end
		currentPerk.perkId = nextPerk.perkId
	end
end

CoD.Perks.Update = function ( self, event )
	local currentPerk = nil
	for i = 1, #CoD.Perks.ClientFieldNames, 1 do
		currentPerk = self.perks[i]
		if event.newValue == CoD.Perks.STATE_OWNED then
			if not currentPerk.perkId then
				currentPerk.perkId = event.name
				currentPerk.perkIcon:setImage( CoD.Perks.GetMaterial( self, event.name ) )
				currentPerk.perkIcon:setAlpha( 1 )
				if currentPerk.perkId == "perk_vulture" then
				
				else
					local glowIcon = CoD.Perks.GetGlowMaterial( self, event.name )
					if glowIcon and currentPerk.perkGlowIcon then
						currentPerk.perkGlowIcon:setImage( glowIcon )
						break
					end
				end
				CoD.Perks.AddGlowIcon( self, currentPerk )
				CoD.Perks.AddVultureMeter( self, currentPerk )
			elseif currentPerk.perkId == event.name then
				currentPerk:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				currentPerk:setScale( CoD.Perks.PulseScale )
				currentPerk.perkIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				currentPerk.perkIcon:setAlpha( 1 )
				if currentPerk.perkGlowIcon then
					currentPerk.perkGlowIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
					break
				end
			end
		end
		if event.newValue == CoD.Perks.STATE_NOTOWNED then
			if currentPerk.perkId == event.name then
				CoD.Perks.RemovePerkIcon( self, i )
				break
			end
		end
		if event.newValue == CoD.Perks.STATE_PAUSED then
			if currentPerk.perkId == event.name then
				currentPerk:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				currentPerk:setScale( CoD.Perks.PulseScale )
				currentPerk.perkIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				currentPerk.perkIcon:setAlpha( CoD.Perks.PausedAlpha )
				if currentPerk.perkGlowIcon then
					currentPerk.perkGlowIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
					currentPerk.perkGlowIcon:setAlpha( 0 )
					break
				end
			end
		end
		if event.newValue == CoD.Perks.STATE_TBD then
			
		end
	end
end

CoD.Perks.IconPulseFinish = function ( perkIcon, event )
	if event.interrupted ~= true then
		perkIcon:beginAnimation( "pulse_done", CoD.Perks.PulseDuration )
		perkIcon:setScale( 1 )
	end
end

CoD.Perks.AddGlowIcon = function ( self, currentPerk )
	if not currentPerk.perkGlowIcon then
		local perkGlowIcon = LUI.UIImage.new()
		perkGlowIcon:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		perkGlowIcon:setTopBottom( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		perkGlowIcon:setAlpha( 0 )
		currentPerk:addElement( perkGlowIcon )
		currentPerk.perkGlowIcon = perkGlowIcon
	end
end

CoD.Perks.AddVultureMeter = function ( self, currentPerk )
	if not currentPerk.meterContainer then
		local meterContainerTop = CoD.Perks.TopStart + CoD.Perks.IconSize * 2
		local meterContainerBottom = -CoD.Perks.IconSize
		
		local meterContainer = LUI.UIElement.new()
		meterContainer:setLeftRight( true, false, 0, CoD.Perks.IconSize )
		meterContainer:setTopBottom( false, true, meterContainerTop + 5, meterContainerBottom + 5 )
		meterContainer:setAlpha( 0 )
		meterContainer:setPriority( -10 )
		currentPerk:addElement( meterContainer )
		currentPerk.meterContainer = meterContainer
		
		local meterBlackImage = LUI.UIImage.new()
		meterBlackImage:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		meterBlackImage:setTopBottom( true, true, 0, 0 )
		meterBlackImage:setImage( CoD.Perks.MeterBlackMaterial )
		meterContainer:addElement( meterBlackImage )
		local meterGreenImage = LUI.UIImage.new()
		meterGreenImage:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		meterGreenImage:setTopBottom( true, true, 0, 0 )
		meterGreenImage:setImage( CoD.Perks.MeterGreenMaterial )
		meterContainer:addElement( meterGreenImage )
		currentPerk:registerEventHandler( "vulture_perk_disease_meter", CoD.Perks.UpdateVultureDiseaseMeter )
	end
end

CoD.Perks.UpdateVultureDiseaseMeter = function ( self, event )
	local value = event.newValue
	if self.meterContainer then
		self.meterContainer:setAlpha( value )
	end
	if self.perkGlowIcon then
		self.perkGlowIcon:setAlpha( value )
	end
end

