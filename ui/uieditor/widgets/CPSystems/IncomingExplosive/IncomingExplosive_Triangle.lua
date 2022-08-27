-- 4786fa3103fe6640e475e4683f141f29
-- This hash is used for caching, delete to decompile the file again

CoD.IncomingExplosive_Triangle = InheritFrom( LUI.UIElement )
CoD.IncomingExplosive_Triangle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IncomingExplosive_Triangle )
	self.id = "IncomingExplosive_Triangle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 100 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -65, 67 )
	Image0:setTopBottom( false, false, -64, 44 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_newtriangle" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, -65, 67 )
	Image00:setTopBottom( false, false, -64, 44 )
	Image00:setZoom( 100 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_newtriangleblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image01 = LUI.UIImage.new()
	Image01:setLeftRight( false, false, -65.72, 65.72 )
	Image01:setTopBottom( false, false, -66, 40 )
	Image01:setAlpha( 0 )
	Image01:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_elmtri" ) )
	Image01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image01 )
	self.Image01 = Image01
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

