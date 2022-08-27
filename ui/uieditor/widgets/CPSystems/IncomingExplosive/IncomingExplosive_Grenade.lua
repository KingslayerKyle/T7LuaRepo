-- e21e8607caccbb9fb10fdcd9b2b749ef
-- This hash is used for caching, delete to decompile the file again

CoD.IncomingExplosive_Grenade = InheritFrom( LUI.UIElement )
CoD.IncomingExplosive_Grenade.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IncomingExplosive_Grenade )
	self.id = "IncomingExplosive_Grenade"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 48 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 36 )
	Image0:setTopBottom( true, false, 0, 48 )
	Image0:setAlpha( RandomAddPercent( -30, 0 ) )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_newgrenade" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 0, 36 )
	Image00:setTopBottom( true, false, 0, 48 )
	Image00:setZoom( 100 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_newgrenadeblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image01 = LUI.UIImage.new()
	Image01:setLeftRight( true, false, 3.21, 32.79 )
	Image01:setTopBottom( true, false, 1, 47 )
	Image01:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_projgrenade" ) )
	Image01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image01 )
	self.Image01 = Image01
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

