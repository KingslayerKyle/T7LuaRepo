CoD.DoubleJump = {}
CoD.DoubleJump.Left = -114
CoD.DoubleJump.Bottom = -30
CoD.DoubleJump.Width = 230
CoD.DoubleJump.Height = 28
CoD.DoubleJump.Border = 3
CoD.DoubleJump.Alpha = 1
LUI.createMenu.DoubleJump = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "DoubleJump", controller )
	local fuelMeter = LUI.UIImage.new()
	fuelMeter:setLeftRight( false, false, CoD.DoubleJump.Left, CoD.DoubleJump.Left + CoD.DoubleJump.Width )
	fuelMeter:setTopBottom( false, true, CoD.DoubleJump.Bottom - CoD.DoubleJump.Height, CoD.DoubleJump.Bottom )
	fuelMeter:setImage( RegisterMaterial( "white" ) )
	fuelMeter:setAlpha( CoD.DoubleJump.Alpha )
	self.fuelMeter = fuelMeter
	self:addElement( fuelMeter )
	fuelMeter:setupDoubleJump()
	if Engine.DvarBool( nil, "doublejump_hud" ) then
		self:setAlpha( CoD.DoubleJump.Alpha )
	else
		self:setAlpha( 0 )
	end
	return self
end

