CoD.cac_2lines = InheritFrom( LUI.UIElement )
CoD.cac_2lines.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_2lines )
	self.id = "cac_2lines"
	self.soundSet = "CAC_Overcapacity"
	self:setLeftRight( 0, 0, 0, 54 )
	self:setTopBottom( 0, 0, 0, 55 )
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, 0, 54 )
	Image40:setTopBottom( 0.5, 0.5, -27, -22 )
	Image40:setZRot( 180 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( 0, 0, 0, 54 )
	Image400:setTopBottom( 0.5, 0.5, 22, 27 )
	Image400:setZRot( 180 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

