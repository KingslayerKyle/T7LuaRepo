-- 4d5ec9cb5d13f892c79ba486f18749f7
-- This hash is used for caching, delete to decompile the file again

CoD.WeaponLevelUpNotification_FooterBacking01 = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification_FooterBacking01.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification_FooterBacking01 )
	self.id = "WeaponLevelUpNotification_FooterBacking01"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 46 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 16 )
	Image0:setTopBottom( true, false, 0, 32 )
	Image0:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_left" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 16, -16 )
	Image1:setTopBottom( true, false, 0, 32 )
	Image1:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_stretch" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -16, 0 )
	Image2:setTopBottom( true, false, 0, 32 )
	Image2:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_right" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

