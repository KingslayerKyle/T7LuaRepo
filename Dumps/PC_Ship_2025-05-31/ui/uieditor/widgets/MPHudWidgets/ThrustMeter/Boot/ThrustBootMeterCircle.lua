require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.Boot.ThrustMeterDotsBoot" )

CoD.ThrustBootMeterCircle = InheritFrom( LUI.UIElement )
CoD.ThrustBootMeterCircle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustBootMeterCircle )
	self.id = "ThrustBootMeterCircle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 291 )
	self:setTopBottom( true, false, 0, 311 )
	
	local HashCircle = LUI.UIImage.new()
	HashCircle:setLeftRight( true, true, 0, 0 )
	HashCircle:setTopBottom( true, true, 10.5, -9.83 )
	HashCircle:setRGB( 0.67, 0.83, 1 )
	HashCircle:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hashcircle" ) )
	HashCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HashCircle:setShaderVector( 0, 1, 0, 0, 0 )
	HashCircle:setShaderVector( 1, 0.5, 0, 0, 0 )
	HashCircle:setShaderVector( 2, 0.5, 0, 0, 0 )
	HashCircle:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( HashCircle )
	self.HashCircle = HashCircle
	
	local ThrustMeterDotsBoot = CoD.ThrustMeterDotsBoot.new( menu, controller )
	ThrustMeterDotsBoot:setLeftRight( true, false, 76.17, 214.17 )
	ThrustMeterDotsBoot:setTopBottom( true, false, 275, 311 )
	ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
	ThrustMeterDotsBoot.fill:setShaderVector( 1, 0.5, 0, 0, 0 )
	ThrustMeterDotsBoot.fill:setShaderVector( 2, -2.84, 0, 0, 0 )
	self:addElement( ThrustMeterDotsBoot )
	self.ThrustMeterDotsBoot = ThrustMeterDotsBoot
	
	local ThrustMeterDotsHidden = CoD.ThrustMeterDotsBoot.new( menu, controller )
	ThrustMeterDotsHidden:setLeftRight( true, false, 76.17, 214.17 )
	ThrustMeterDotsHidden:setTopBottom( true, false, 0, 36 )
	ThrustMeterDotsHidden:setAlpha( 0 )
	ThrustMeterDotsHidden:setZRot( 180 )
	ThrustMeterDotsHidden.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
	ThrustMeterDotsHidden.fill:setShaderVector( 1, 0.5, 0, 0, 0 )
	ThrustMeterDotsHidden.fill:setShaderVector( 2, -2.84, 0, 0, 0 )
	self:addElement( ThrustMeterDotsHidden )
	self.ThrustMeterDotsHidden = ThrustMeterDotsHidden
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ThrustMeterDotsBoot:close()
		element.ThrustMeterDotsHidden:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

