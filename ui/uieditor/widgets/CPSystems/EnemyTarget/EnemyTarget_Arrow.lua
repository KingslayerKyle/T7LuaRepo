-- a296e215407e675be16b44bc9b35e82a
-- This hash is used for caching, delete to decompile the file again

CoD.EnemyTarget_Arrow = InheritFrom( LUI.UIElement )
CoD.EnemyTarget_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EnemyTarget_Arrow )
	self.id = "EnemyTarget_Arrow"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 7.5, -7.5 )
	Image0:setTopBottom( true, true, 4.5, -4.5 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newredarrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 7.5, -7.5 )
	Image00:setTopBottom( true, true, 4.5, -4.5 )
	Image00:setZoom( 75 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newredarrowblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

