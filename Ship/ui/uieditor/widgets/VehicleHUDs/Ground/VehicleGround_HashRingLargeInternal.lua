-- 5575638538db162ecb8c4cdaae750d88
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_HashRingLargeInternal = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HashRingLargeInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HashRingLargeInternal )
	self.id = "VehicleGround_HashRingLargeInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 543 )
	self:setTopBottom( true, false, 0, 288 )
	
	local HashLarge = LUI.UIImage.new()
	HashLarge:setLeftRight( false, true, -96, 0 )
	HashLarge:setTopBottom( false, false, -144, 144 )
	HashLarge:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringlarge" ) )
	self:addElement( HashLarge )
	self.HashLarge = HashLarge
	
	local Null = LUI.UIImage.new()
	Null:setLeftRight( true, false, 0, 96 )
	Null:setTopBottom( false, false, -144, 144 )
	Null:setAlpha( 0 )
	Null:setYRot( -180 )
	self:addElement( Null )
	self.Null = Null
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
