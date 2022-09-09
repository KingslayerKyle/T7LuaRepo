-- 36f1ae347866874487a22614b6d5c078
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_IrisOutterThin = InheritFrom( LUI.UIElement )
CoD.VehicleGround_IrisOutterThin.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_IrisOutterThin )
	self.id = "VehicleGround_IrisOutterThin"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1421 )
	self:setTopBottom( true, false, 0, 943 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -20, 224.75 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutterthin" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -244.75, 0 )
	Image1:setTopBottom( true, true, 0, 0 )
	Image1:setZRot( -180 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutterthin" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
