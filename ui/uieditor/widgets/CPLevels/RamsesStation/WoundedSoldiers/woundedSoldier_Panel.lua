-- e9ce92612abc70d97c8617b334dcfd79
-- This hash is used for caching, delete to decompile the file again

CoD.woundedSoldier_Panel = InheritFrom( LUI.UIElement )
CoD.woundedSoldier_Panel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.woundedSoldier_Panel )
	self.id = "woundedSoldier_Panel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 41 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 0, 0 )
	Image1:setTopBottom( true, true, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image1:setShaderVector( 0, 20, 20, 0, 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
