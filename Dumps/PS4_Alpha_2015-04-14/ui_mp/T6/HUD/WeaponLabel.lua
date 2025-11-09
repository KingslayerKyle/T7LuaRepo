CoD.WeaponLabel = {}
CoD.WeaponLabel.TextHeight = 32
CoD.WeaponLabel.FadeTime = 2000
CoD.WeaponLabel.new = function ( defaultAnimationState )
	local self = LUI.UIElement.new( defaultAnimationState )
	local textHeight = CoD.WeaponLabel.TextHeight
	self.weaponLabel = LUI.UIText.new( {
		left = -1,
		top = -textHeight / 2,
		right = 0,
		bottom = textHeight / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		alphaMultiplier = 1
	} )
	self.weaponLabel:setFont( CoD.fonts.Big )
	self.weaponLabel:registerAnimationState( "fade_out", {
		alphaMultiplier = 0
	} )
	self:addElement( self.weaponLabel )
	self:registerEventHandler( "hud_update_weapon_select", CoD.WeaponLabel.UpdateWeapon )
	return self
end

CoD.WeaponLabel.UpdateWeapon = function ( self, event )
	self.weaponLabel:animateToState( "default" )
	if CoD.isZombie == true then
		self.weaponLabel:setText( Engine.Localize( event.weaponDisplayName ) )
	else
		self.weaponLabel:setText( Engine.ToUpper( Engine.Localize( event.weaponDisplayName ) ) )
	end
	self.weaponLabel:animateToState( "fade_out", CoD.WeaponLabel.FadeTime )
end

