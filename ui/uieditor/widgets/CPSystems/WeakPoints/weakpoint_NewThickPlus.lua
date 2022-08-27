-- d6fa1f581c5c454717ea2e7b18fa4b49
-- This hash is used for caching, delete to decompile the file again

CoD.weakpoint_NewThickPlus = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewThickPlus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewThickPlus )
	self.id = "weakpoint_NewThickPlus"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 25 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -12.25, 11.75 )
	Image0:setTopBottom( false, false, -7.84, 8.16 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newthickplus" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, -12.25, 12.25 )
	Image00:setTopBottom( false, false, -8.16, 8.16 )
	Image00:setZoom( 50 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newthickplusblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

