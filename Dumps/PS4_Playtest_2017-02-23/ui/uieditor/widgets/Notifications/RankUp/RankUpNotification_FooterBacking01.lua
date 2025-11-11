CoD.RankUpNotification_FooterBacking01 = InheritFrom( LUI.UIElement )
CoD.RankUpNotification_FooterBacking01.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification_FooterBacking01 )
	self.id = "RankUpNotification_FooterBacking01"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 69 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 24 )
	Image0:setTopBottom( 0, 0, 0, 48 )
	Image0:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_left" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 1, 24, -24 )
	Image1:setTopBottom( 0, 0, 0, 48 )
	Image1:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_stretch" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 1, 1, -24, 0 )
	Image2:setTopBottom( 0, 0, 0, 48 )
	Image2:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_right" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

