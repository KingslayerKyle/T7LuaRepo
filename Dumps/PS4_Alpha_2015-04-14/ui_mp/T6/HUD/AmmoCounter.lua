CoD.AmmoCounter = {}
CoD.AmmoCounter.TextHeight = 28
CoD.AmmoCounter.LowAmmoFadeTime = 500
CoD.AmmoCounter.PulseDuration = 500
CoD.AmmoCounter.new = function ( defaultAnimationState )
	local self = LUI.UIElement.new( defaultAnimationState )
	self:registerAnimationState( "hide", {
		alphaMultiplier = 0
	} )
	self:registerAnimationState( "show", {
		alphaMultiplier = 1
	} )
	self:animateToState( "hide" )
	local ammoLabelTop = 36
	local ammoLabelHeight = 40
	local ammoLabelContainer = LUI.UIElement.new( {
		left = -90,
		top = ammoLabelTop,
		right = 10,
		bottom = ammoLabelTop + ammoLabelHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	self:addElement( ammoLabelContainer )
	local textHeight = CoD.AmmoCounter.TextHeight
	self.ammoLabel = LUI.UIText.new( {
		left = -1,
		top = -4,
		right = 0,
		bottom = 4,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	self.ammoLabel:setFont( CoD.fonts.Big )
	self.ammoLabel:registerAnimationState( "pulse_low", {
		alpha = 1
	} )
	self.ammoLabel:registerAnimationState( "pulse_high", {
		alpha = 0.5
	} )
	self.ammoLabel:registerEventHandler( "transition_complete_pulse_high", CoD.AmmoCounter.Ammo_PulseHigh )
	self.ammoLabel:registerEventHandler( "transition_complete_pulse_low", CoD.AmmoCounter.Ammo_PulseLow )
	ammoLabelContainer:addElement( self.ammoLabel )
	self:registerEventHandler( "hud_update_refresh", CoD.AmmoCounter.UpdateVisibility )
	self:registerEventHandler( "hud_update_weapon", CoD.AmmoCounter.UpdateVisibility )
	self:registerEventHandler( "hud_update_ammo", CoD.AmmoCounter.UpdateAmmo )
	return self
end

CoD.AmmoCounter.UpdateAmmo = function ( self, event )
	local ammoText = event.ammoInClip .. "/" .. event.ammoStock
	if event.ammoInDWClip then
		ammoText = event.ammoInDWClip .. " | " .. ammoText
	end
	self.ammoLabel:setText( ammoText )
	if event.lowClip and self.lowAmmo ~= true then
		self.lowAmmo = true
		if true == CoD.isZombie then
			self.ammoLabel:animateToState( "pulse_high", CoD.AmmoCounter.LowAmmoFadeTime )
		end
	elseif event.lowClip ~= true and self.lowAmmo == true then
		self.lowAmmo = nil
		if true == CoD.isZombie then
			self.ammoLabel:animateToState( "default", CoD.AmmoCounter.LowAmmoFadeTime )
		end
	end
end

CoD.AmmoCounter.ShouldHideAmmoCounter = function ( self, event )
	if self.weapon ~= nil then
		if Engine.IsWeaponType( self.weapon, "melee" ) then
			return true
		elseif CoD.isZombie == true and (event.inventorytype == 1 or event.inventorytype == 2) then
			return true
		elseif CoD.isZombie == true and (Engine.IsWeaponType( self.weapon, "gas" ) or Engine.IsOverheatWeapon( self.weapon )) then
			return true
		end
	end
	return false
end

CoD.AmmoCounter.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if event.weapon ~= nil then
		self.weapon = event.weapon
	end
	if CoD.AmmoCounter.ShouldHideAmmoCounter( self, event ) then
		if self.visible == true then
			self:animateToState( "hide" )
			self.visible = nil
		end
		self:dispatchEventToChildren( event )
	elseif self.visible ~= true then
		self:animateToState( "show" )
		self.visible = true
	end
end

CoD.AmmoCounter.Ammo_PulseHigh = function ( self, event )
	if event.interrupted ~= true then
		self:animateToState( "pulse_low", CoD.AmmoCounter.LowAmmoFadeTime, true, false )
	end
end

CoD.AmmoCounter.Ammo_PulseLow = function ( self, event )
	if event.interrupted ~= true then
		self:animateToState( "pulse_high", CoD.AmmoCounter.LowAmmoFadeTime, false, true )
	end
end

