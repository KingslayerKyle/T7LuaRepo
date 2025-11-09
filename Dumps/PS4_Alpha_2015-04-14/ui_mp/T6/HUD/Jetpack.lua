CoD.Jetpack = {}
CoD.Jetpack.Right = -80
CoD.Jetpack.Bottom = 100
CoD.Jetpack.Width = 30
CoD.Jetpack.Height = 250
LUI.createMenu.Jetpack = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "JetPack", controller )
	local fuelBacking = LUI.UIImage.new()
	fuelBacking:setLeftRight( false, true, CoD.Jetpack.Right - CoD.Jetpack.Width, CoD.Jetpack.Right )
	fuelBacking:setTopBottom( false, false, CoD.Jetpack.Bottom - CoD.Jetpack.Height, CoD.Jetpack.Bottom )
	fuelBacking:setImage( RegisterMaterial( "white" ) )
	fuelBacking:setAlpha( 0.2 )
	fuelBacking:setRGB( 0, 0, 0 )
	self.fuelBacking = fuelBacking
	self:addElement( fuelBacking )
	local fuelMeter = LUI.UIImage.new()
	fuelMeter:setLeftRight( false, true, CoD.Jetpack.Right - CoD.Jetpack.Width, CoD.Jetpack.Right )
	fuelMeter:setTopBottom( false, false, CoD.Jetpack.Bottom - CoD.Jetpack.Height, CoD.Jetpack.Bottom )
	fuelMeter:setImage( RegisterMaterial( "white" ) )
	fuelMeter:setAlpha( 0.5 )
	self.fuelMeter = fuelMeter
	self:addElement( fuelMeter )
	fuelMeter:setupJetpack()
	self:setAlpha( 0 )
	self:registerEventHandler( "hud_update_jetpack", CoD.Jetpack.Update )
	return self
end

CoD.Jetpack.Update = function ( self, event )
	if event.jetpack_active == true then
		self:setAlpha( 1 )
	else
		self:setAlpha( 0 )
	end
end

