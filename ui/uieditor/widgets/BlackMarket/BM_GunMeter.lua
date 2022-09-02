-- 2383d15a3c36890b3ff4d06add0d33f0
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToGlobalModel( controller, "CryptoKeyProgress", "gunMeterProgress", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.FillAnimation:setShaderVector( 2, 0, modelValue, 0, 0 )
		end
	end )
end

CoD.BM_GunMeter = InheritFrom( LUI.UIElement )
CoD.BM_GunMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_GunMeter )
	self.id = "BM_GunMeter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 101 )
	
	local Meter = LUI.UIImage.new()
	Meter:setLeftRight( true, false, 41, 282 )
	Meter:setTopBottom( false, false, -208, 208 )
	Meter:setZRot( 90 )
	Meter:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_mainbar" ) )
	self:addElement( Meter )
	self.Meter = Meter
	
	local FillAnimation = LUI.UIImage.new()
	FillAnimation:setLeftRight( true, false, 104, 208 )
	FillAnimation:setTopBottom( false, false, -200.25, 200.25 )
	FillAnimation:setZRot( 90 )
	FillAnimation:setScale( 0.8 )
	FillAnimation:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_fillbar" ) )
	FillAnimation:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	FillAnimation:setShaderVector( 0, 0, 1, 0, 0 )
	FillAnimation:setShaderVector( 1, 0, 0, 0, 0 )
	FillAnimation:setShaderVector( 2, 0, 1, 0, 0 )
	FillAnimation:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( FillAnimation )
	self.FillAnimation = FillAnimation
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

