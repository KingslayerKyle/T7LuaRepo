-- 88f119326a57fa0a8b88fc73bdf16db9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.PulseRifle.PulseRifleReticle_NumbersInt" )

CoD.PulseRifleReticle_Numbers = InheritFrom( LUI.UIElement )
CoD.PulseRifleReticle_Numbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PulseRifleReticle_Numbers )
	self.id = "PulseRifleReticle_Numbers"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 204 )
	BG:setTopBottom( true, false, 0, 96 )
	BG:setRGB( 0.66, 0.73, 0.31 )
	self:addElement( BG )
	self.BG = BG
	
	local PulseRifleReticleNumbersInt = CoD.PulseRifleReticle_NumbersInt.new( menu, controller )
	PulseRifleReticleNumbersInt:setLeftRight( true, false, 66.46, 222.46 )
	PulseRifleReticleNumbersInt:setTopBottom( true, false, -22, 122 )
	PulseRifleReticleNumbersInt:setRGB( 0, 0, 0 )
	PulseRifleReticleNumbersInt:setAlpha( 0.8 )
	PulseRifleReticleNumbersInt:setScale( 0.65 )
	PulseRifleReticleNumbersInt:linkToElementModel( self, nil, false, function ( model )
		PulseRifleReticleNumbersInt:setModel( model, controller )
	end )
	self:addElement( PulseRifleReticleNumbersInt )
	self.PulseRifleReticleNumbersInt = PulseRifleReticleNumbersInt
	
	local Element1Flipbook = LUI.UIImage.new()
	Element1Flipbook:setLeftRight( true, false, 102, 188 )
	Element1Flipbook:setTopBottom( true, false, 6.94, 12 )
	Element1Flipbook:setRGB( 0, 0, 0 )
	Element1Flipbook:setAlpha( 0.7 )
	Element1Flipbook:setImage( RegisterImage( "uie_t7_mp_hud_pulse_element_flipbook" ) )
	Element1Flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Element1Flipbook:setShaderVector( 0, 4, 0, 0, 0 )
	Element1Flipbook:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( Element1Flipbook )
	self.Element1Flipbook = Element1Flipbook
	
	local Digit0 = LUI.UIImage.new()
	Digit0:setLeftRight( true, false, 58, 102 )
	Digit0:setTopBottom( true, false, 5.33, 20 )
	Digit0:setRGB( 0, 0, 0 )
	Digit0:setAlpha( 0.5 )
	Digit0:setImage( RegisterImage( "uie_t7_mp_hud_pulse_element_ammo" ) )
	self:addElement( Digit0 )
	self.Digit0 = Digit0
	
	local Digit00 = LUI.UIImage.new()
	Digit00:setLeftRight( true, false, 57, 102 )
	Digit00:setTopBottom( true, false, 27.68, 72.32 )
	Digit00:setRGB( 0, 0, 0 )
	Digit00:setAlpha( 0.7 )
	Digit00:setImage( RegisterImage( "uie_t7_mp_hud_pulse_element2_flipbook" ) )
	self:addElement( Digit00 )
	self.Digit00 = Digit00
	
	local Digit01 = LUI.UIImage.new()
	Digit01:setLeftRight( true, false, 178, 204 )
	Digit01:setTopBottom( true, false, 0, 96 )
	Digit01:setRGB( 0, 0, 0 )
	Digit01:setAlpha( 0.7 )
	Digit01:setImage( RegisterImage( "uie_t7_mp_hud_pulse_element_edge" ) )
	self:addElement( Digit01 )
	self.Digit01 = Digit01
	
	local Digit010 = LUI.UIImage.new()
	Digit010:setLeftRight( true, false, -2, 24 )
	Digit010:setTopBottom( true, false, 0, 96 )
	Digit010:setRGB( 0, 0, 0 )
	Digit010:setAlpha( 0.5 )
	Digit010:setZRot( 180 )
	Digit010:setImage( RegisterImage( "uie_t7_mp_hud_pulse_element_edge" ) )
	self:addElement( Digit010 )
	self.Digit010 = Digit010
	
	local Digit0100 = LUI.UIImage.new()
	Digit0100:setLeftRight( true, false, 41.46, 67.46 )
	Digit0100:setTopBottom( true, false, 29.68, 98 )
	Digit0100:setRGB( 0, 0, 0 )
	Digit0100:setAlpha( 0.6 )
	Digit0100:setZRot( 180 )
	Digit0100:setImage( RegisterImage( "uie_t7_mp_hud_pulse_element_edge" ) )
	Digit0100:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Digit0100:setShaderVector( 0, 0.62, 0.03, 0.05, 0.2 )
	self:addElement( Digit0100 )
	self.Digit0100 = Digit0100
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PulseRifleReticleNumbersInt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
