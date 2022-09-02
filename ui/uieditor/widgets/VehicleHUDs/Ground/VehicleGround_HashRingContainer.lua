-- 0676cc371219ee2bd7ca88628742fa76
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashText" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashIcon" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashRingLarge" )

CoD.VehicleGround_HashRingContainer = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HashRingContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HashRingContainer )
	self.id = "VehicleGround_HashRingContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 262 )
	self:setTopBottom( true, false, 0, 288 )
	self.anyChildUsesUpdateState = true
	
	local HashSmall = LUI.UIImage.new()
	HashSmall:setLeftRight( true, false, 52, 108 )
	HashSmall:setTopBottom( true, false, 52, 236 )
	HashSmall:setAlpha( 0.4 )
	HashSmall:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringsmall" ) )
	HashSmall:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HashSmall )
	self.HashSmall = HashSmall
	
	local HashSmallArrow = LUI.UIImage.new()
	HashSmallArrow:setLeftRight( true, false, 52, 68 )
	HashSmallArrow:setTopBottom( true, false, 137, 153 )
	HashSmallArrow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringsmallarrow" ) )
	HashSmallArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HashSmallArrow )
	self.HashSmallArrow = HashSmallArrow
	
	local VehicleGroundHashText0 = CoD.VehicleGround_HashText.new( menu, controller )
	VehicleGroundHashText0:setLeftRight( true, false, 109.75, 215.75 )
	VehicleGroundHashText0:setTopBottom( true, false, 135, 161 )
	VehicleGroundHashText0:setAlpha( 0 )
	VehicleGroundHashText0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	VehicleGroundHashText0:setShaderVector( 0, 0.1, 0, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 1, 1, 0, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 2, 5, 7, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 3, 1, 1, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( VehicleGroundHashText0 )
	self.VehicleGroundHashText0 = VehicleGroundHashText0
	
	local VehicleGroundHashIcon0 = CoD.VehicleGround_HashIcon.new( menu, controller )
	VehicleGroundHashIcon0:setLeftRight( true, false, 199.75, 231.75 )
	VehicleGroundHashIcon0:setTopBottom( true, false, 137, 153 )
	self:addElement( VehicleGroundHashIcon0 )
	self.VehicleGroundHashIcon0 = VehicleGroundHashIcon0
	
	local VehicleGroundHashRingLarge00 = CoD.VehicleGround_HashRingLarge.new( menu, controller )
	VehicleGroundHashRingLarge00:setLeftRight( true, false, 0, 131 )
	VehicleGroundHashRingLarge00:setTopBottom( true, false, 0, 288 )
	VehicleGroundHashRingLarge00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VehicleGroundHashRingLarge00 )
	self.VehicleGroundHashRingLarge00 = VehicleGroundHashRingLarge00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundHashText0:close()
		element.VehicleGroundHashIcon0:close()
		element.VehicleGroundHashRingLarge00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

