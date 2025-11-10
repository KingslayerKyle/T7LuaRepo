CoD.cac_WpnLvlMeter = InheritFrom( LUI.UIElement )
CoD.cac_WpnLvlMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_WpnLvlMeter )
	self.id = "cac_WpnLvlMeter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Meter = LUI.UIImage.new()
	Meter:setLeftRight( true, false, 0, 180 )
	Meter:setTopBottom( true, false, 0, 32 )
	Meter:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterfill" ) )
	Meter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Meter:setShaderVector( 0, 0.65, 0, 0, 0 )
	Meter:setShaderVector( 1, 0, 0, 0, 0 )
	Meter:setShaderVector( 2, 1, 0, 0, 0 )
	Meter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Meter )
	self.Meter = Meter
	
	local middleBar = LUI.UIImage.new()
	middleBar:setLeftRight( true, false, -3.31, 180 )
	middleBar:setTopBottom( true, false, 16, 17 )
	middleBar:setRGB( 0, 0, 0 )
	middleBar:setAlpha( 0.5 )
	self:addElement( middleBar )
	self.middleBar = middleBar
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

