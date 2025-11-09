CoD.HUDShaker = {}
CoD.HUDShaker.new = function ( xRotScale, yRotScale )
	local self = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		zoom = 0
	} )
	self:setupHUDShaker( xRotScale, yRotScale )
	self:registerEventHandler( "view_damage", CoD.HUDShaker.ViewDamage )
	return self
end

CoD.HUDShaker.ViewDamage = function ( self, event )
	local damageMagnitude = CoD.VisorHud.Margin
	local xMagnitude = -event.x * damageMagnitude
	local yMagnitude = -event.y * damageMagnitude
	self:registerAnimationState( "damage", {
		leftAnchor = true,
		rightAnchor = true,
		left = xMagnitude,
		right = xMagnitude,
		topAnchor = true,
		bottomAnchor = true,
		top = yMagnitude,
		bottom = yMagnitude
	} )
	self:animateToState( "damage" )
	self:animateToState( "default", 500, false, true )
end

