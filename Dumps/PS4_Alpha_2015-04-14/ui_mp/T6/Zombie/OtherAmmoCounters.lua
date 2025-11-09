CoD.OtherAmmoCounters = {}
CoD.OtherAmmoCounters.TextHeight = 28
CoD.OtherAmmoCounters.LowAmmoFadeTime = 500
CoD.OtherAmmoCounters.PulseDuration = 500
CoD.OtherAmmoCounters.NormalColor = {
	r = 1,
	g = 1,
	b = 1
}
CoD.OtherAmmoCounters.OverheatColor = {
	r = 1,
	g = 0,
	b = 0
}
CoD.OtherAmmoCounters.LowFuelColor = {
	r = 1,
	g = 1,
	b = 0
}
CoD.OtherAmmoCounters.new = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:setAlpha( 0 )
	local ammoLabelTop = 36
	local ammoLabelHeight = 40
	local ammoLabelContainer = LUI.UIElement.new()
	ammoLabelContainer:setLeftRight( true, false, -90, 10 )
	ammoLabelContainer:setTopBottom( true, false, ammoLabelTop, ammoLabelTop + ammoLabelHeight )
	self:addElement( ammoLabelContainer )
	local textHeight = CoD.OtherAmmoCounters.TextHeight
	self.ammoLabel = LUI.UIText.new()
	self.ammoLabel:setLeftRight( false, true, -1, 0 )
	self.ammoLabel:setTopBottom( true, true, -4, 4 )
	self.ammoLabel:setFont( CoD.fonts.Big )
	self.ammoLabel:registerEventHandler( "transition_complete_pulse_high", CoD.OtherAmmoCounters.Ammo_PulseHigh )
	self.ammoLabel:registerEventHandler( "transition_complete_pulse_low", CoD.OtherAmmoCounters.Ammo_PulseLow )
	ammoLabelContainer:addElement( self.ammoLabel )
	self:registerEventHandler( "hud_update_refresh", CoD.OtherAmmoCounters.UpdateVisibility )
	self:registerEventHandler( "hud_update_weapon", CoD.OtherAmmoCounters.UpdateVisibility )
	self:registerEventHandler( "hud_update_overheat", CoD.OtherAmmoCounters.UpdateHeat )
	self:registerEventHandler( "hud_update_fuel", CoD.OtherAmmoCounters.UpdateFuel )
	return self
end

CoD.OtherAmmoCounters.UpdateHeat = function ( self, event )
	local ammoText = event.heatPercent .. "%"
	self.ammoLabel:setText( ammoText )
	if event.overheat and self.overheat ~= true then
		self.overheat = true
		self.ammoLabel:beginAnimation( "pulse_high", CoD.OtherAmmoCounters.LowAmmoFadeTime )
		self.ammoLabel:setAlpha( 0.5 )
	elseif event.overheat ~= true and self.overheat == true then
		self.overheat = nil
		self.ammoLabel:beingAnimation( "default", CoD.OtherAmmoCounters.LowAmmoFadeTime )
		self.ammoLabel:setAlpha( 1 )
	end
	if event.overheat then
		self.ammoLabel:setRGB( CoD.OtherAmmoCounters.OverheatColor.r, CoD.OtherAmmoCounters.OverheatColor.g, CoD.OtherAmmoCounters.OverheatColor.b )
	else
		self.ammoLabel:setRGB( CoD.OtherAmmoCounters.NormalColor.r, CoD.OtherAmmoCounters.NormalColor.g, CoD.OtherAmmoCounters.NormalColor.b )
	end
end

CoD.OtherAmmoCounters.UpdateFuel = function ( self, event )
	local ammoText = event.fuelPercent .. "%"
	self.ammoLabel:setText( ammoText )
	if event.lowFuel and self.lowFuel ~= true then
		self.lowFuel = true
	elseif event.lowFuel ~= true and self.lowFuel == true then
		self.lowFuel = nil
		self.ammoLabel:animateToState( "default", CoD.OtherAmmoCounters.LowAmmoFadeTime )
		self.ammoLabel:setAlpha( 1 )
	end
	if event.lowFuel then
		self.ammoLabel:setRGB( CoD.OtherAmmoCounters.LowFuelColor.r, CoD.OtherAmmoCounters.LowFuelColor.g, CoD.OtherAmmoCounters.LowFuelColor.b )
	else
		self.ammoLabel:setRGB( CoD.OtherAmmoCounters.NormalColor.r, CoD.OtherAmmoCounters.NormalColor.g, CoD.OtherAmmoCounters.NormalColor.b )
	end
end

CoD.OtherAmmoCounters.ShouldHideAmmoCounter = function ( self, event )
	if self.weapon ~= nil then
		if Engine.IsWeaponType( self.weapon, "melee" ) then
			return true
		elseif CoD.isZombie == true and (event.inventorytype == 1 or event.inventorytype == 2) then
			return true
		elseif CoD.isZombie == true and (Engine.IsWeaponType( self.weapon, "gas" ) or Engine.IsOverheatWeapon( self.weapon )) then
			return false
		end
	end
	return true
end

CoD.OtherAmmoCounters.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if event.weapon ~= nil then
		self.weapon = event.weapon
	end
	if CoD.OtherAmmoCounters.ShouldHideAmmoCounter( self, event ) then
		if self.visible == true then
			self:beginAnimation( "hide" )
			self:setAlpha( 0 )
			self.visible = nil
		end
		self:dispatchEventToChildren( event )
	elseif self.visible ~= true then
		self:beginAnimation( "show" )
		self:setAlpha( 1 )
		self.visible = true
	end
end

CoD.OtherAmmoCounters.Ammo_PulseHigh = function ( self, event )
	if event.interrupted ~= true then
		self:beginAnimation( "pluse_low", CoD.OtherAmmoCounters.LowAmmoFadeTime, true, false )
		self:setAlpha( 1 )
	end
end

CoD.OtherAmmoCounters.Ammo_PulseLow = function ( self, event )
	if event.interrupted ~= true then
		self:beginAnimation( "pulse_high", CoD.OtherAmmoCounters.LowAmmoFadeTime, false, true )
		self:setAlpha( 0.5 )
	end
end

