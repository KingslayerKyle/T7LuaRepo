CoD.BootWidget_Cent1 = InheritFrom( LUI.UIElement )
CoD.BootWidget_Cent1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BootWidget_Cent1 )
	self.id = "BootWidget_Cent1"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 256 )
	
	local imgCent1 = LUI.UIImage.new()
	imgCent1:setLeftRight( true, true, 0, 0 )
	imgCent1:setTopBottom( true, true, 240, 0 )
	imgCent1:setRGB( 1, 1, 1 )
	imgCent1:setImage( RegisterImage( "uie_t7_cp_hud_boot_center1" ) )
	imgCent1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgCent1 )
	self.imgCent1 = imgCent1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, -240 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_boot_center1" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

