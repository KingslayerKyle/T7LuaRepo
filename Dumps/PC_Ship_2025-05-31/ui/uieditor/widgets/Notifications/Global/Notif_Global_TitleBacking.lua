CoD.Notif_Global_TitleBacking = InheritFrom( LUI.UIElement )
CoD.Notif_Global_TitleBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notif_Global_TitleBacking )
	self.id = "Notif_Global_TitleBacking"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 40 )
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 32 )
	left:setTopBottom( true, false, 0, 40 )
	left:setImage( RegisterImage( "uie_t7_hud_notif_global_titlebacking_left" ) )
	self:addElement( left )
	self.left = left
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -32, 0 )
	right:setTopBottom( true, false, 0, 40 )
	right:setImage( RegisterImage( "uie_t7_hud_notif_global_titlebacking_right" ) )
	self:addElement( right )
	self.right = right
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 32, -32 )
	Image0:setTopBottom( true, false, 0, 40 )
	Image0:setImage( RegisterImage( "uie_t7_hud_notif_global_titlebacking_center" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

