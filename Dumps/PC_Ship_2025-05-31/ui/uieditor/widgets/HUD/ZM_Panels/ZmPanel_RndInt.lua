CoD.ZmPanel_RndInt = InheritFrom( LUI.UIElement )
CoD.ZmPanel_RndInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmPanel_RndInt )
	self.id = "ZmPanel_RndInt"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 224 )
	self:setTopBottom( true, false, 0, 200 )
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 224 )
	Image4:setTopBottom( true, false, 0, 200 )
	Image4:setImage( RegisterImage( "uie_t7_zm_hud_panel_rnd" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image4:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

