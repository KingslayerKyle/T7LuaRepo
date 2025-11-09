CoD.EACJumpHeightLine = InheritFrom( LUI.UIElement )
CoD.EACJumpHeightLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EACJumpHeightLine )
	self.id = "EACJumpHeightLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 163 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -32, 32 )
	Image0:setTopBottom( true, false, 0, 48 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchortop" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -32, 32 )
	Image1:setTopBottom( true, true, 48, -27 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchormiddle" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -32, 32 )
	Image2:setTopBottom( false, true, -27, -0.33 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchorbase" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

