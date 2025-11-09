CoD.BootWidget_Plates1 = InheritFrom( LUI.UIElement )
CoD.BootWidget_Plates1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BootWidget_Plates1 )
	self.id = "BootWidget_Plates1"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1920 )
	self:setTopBottom( true, false, 0, 1080 )
	
	local Bimg10 = LUI.UIImage.new()
	Bimg10:setLeftRight( true, true, 0, 0 )
	Bimg10:setTopBottom( true, true, 0, 0 )
	Bimg10:setRGB( 1, 1, 1 )
	Bimg10:setAlpha( 0 )
	Bimg10:setZoom( -1200 )
	Bimg10:setImage( RegisterImage( "uie_t7_cp_hud_boot_1" ) )
	Bimg10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bimg10 )
	self.Bimg10 = Bimg10
	
	local Bimg1b0 = LUI.UIImage.new()
	Bimg1b0:setLeftRight( true, true, 0, 0 )
	Bimg1b0:setTopBottom( true, true, 0, 0 )
	Bimg1b0:setRGB( 1, 1, 1 )
	Bimg1b0:setAlpha( 0 )
	Bimg1b0:setZoom( -1000 )
	Bimg1b0:setImage( RegisterImage( "uie_t7_cp_hud_boot_1b" ) )
	Bimg1b0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bimg1b0 )
	self.Bimg1b0 = Bimg1b0
	
	local Bimg20 = LUI.UIImage.new()
	Bimg20:setLeftRight( true, true, 0, 0 )
	Bimg20:setTopBottom( true, true, 0, 0 )
	Bimg20:setRGB( 1, 1, 1 )
	Bimg20:setAlpha( 0 )
	Bimg20:setZoom( -800 )
	Bimg20:setImage( RegisterImage( "uie_t7_cp_hud_boot_2" ) )
	Bimg20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bimg20 )
	self.Bimg20 = Bimg20
	
	local Bimg2b0 = LUI.UIImage.new()
	Bimg2b0:setLeftRight( true, true, 0, 0 )
	Bimg2b0:setTopBottom( true, true, 0, 0 )
	Bimg2b0:setRGB( 1, 1, 1 )
	Bimg2b0:setAlpha( 0 )
	Bimg2b0:setZoom( -600 )
	Bimg2b0:setImage( RegisterImage( "uie_t7_cp_hud_boot_2b" ) )
	Bimg2b0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bimg2b0 )
	self.Bimg2b0 = Bimg2b0
	
	local Bimg30 = LUI.UIImage.new()
	Bimg30:setLeftRight( true, true, 0, 0 )
	Bimg30:setTopBottom( true, true, 0, 0 )
	Bimg30:setRGB( 1, 1, 1 )
	Bimg30:setAlpha( 0 )
	Bimg30:setZoom( -400 )
	Bimg30:setImage( RegisterImage( "uie_t7_cp_hud_boot_3" ) )
	Bimg30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bimg30 )
	self.Bimg30 = Bimg30
	
	local Bimg3b0 = LUI.UIImage.new()
	Bimg3b0:setLeftRight( true, true, 0, 0 )
	Bimg3b0:setTopBottom( true, true, 0, 0 )
	Bimg3b0:setRGB( 1, 1, 1 )
	Bimg3b0:setAlpha( 0 )
	Bimg3b0:setZoom( -200 )
	Bimg3b0:setImage( RegisterImage( "uie_t7_cp_hud_boot_3b" ) )
	Bimg3b0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bimg3b0 )
	self.Bimg3b0 = Bimg3b0
	
	local img1 = LUI.UIImage.new()
	img1:setLeftRight( true, true, 0, 0 )
	img1:setTopBottom( true, true, 0, 0 )
	img1:setRGB( 1, 1, 1 )
	img1:setImage( RegisterImage( "uie_t7_cp_hud_boot_1" ) )
	img1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img1 )
	self.img1 = img1
	
	local img1b = LUI.UIImage.new()
	img1b:setLeftRight( true, true, 0, 0 )
	img1b:setTopBottom( true, true, 0, 0 )
	img1b:setRGB( 1, 1, 1 )
	img1b:setZoom( 200 )
	img1b:setImage( RegisterImage( "uie_t7_cp_hud_boot_1b" ) )
	img1b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img1b )
	self.img1b = img1b
	
	local img2 = LUI.UIImage.new()
	img2:setLeftRight( true, true, 0, 0 )
	img2:setTopBottom( true, true, 0, 0 )
	img2:setRGB( 1, 1, 1 )
	img2:setZoom( 400 )
	img2:setImage( RegisterImage( "uie_t7_cp_hud_boot_2" ) )
	img2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img2 )
	self.img2 = img2
	
	local img2b = LUI.UIImage.new()
	img2b:setLeftRight( true, true, 0, 0 )
	img2b:setTopBottom( true, true, 0, 0 )
	img2b:setRGB( 1, 1, 1 )
	img2b:setZoom( 600 )
	img2b:setImage( RegisterImage( "uie_t7_cp_hud_boot_2b" ) )
	img2b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img2b )
	self.img2b = img2b
	
	local img3 = LUI.UIImage.new()
	img3:setLeftRight( true, true, 0, 0 )
	img3:setTopBottom( true, true, 0, 0 )
	img3:setRGB( 1, 1, 1 )
	img3:setZoom( 800 )
	img3:setImage( RegisterImage( "uie_t7_cp_hud_boot_3" ) )
	img3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img3 )
	self.img3 = img3
	
	local img3b = LUI.UIImage.new()
	img3b:setLeftRight( true, true, 0, 0 )
	img3b:setTopBottom( true, true, 0, 0 )
	img3b:setRGB( 1, 1, 1 )
	img3b:setZoom( 1000 )
	img3b:setImage( RegisterImage( "uie_t7_cp_hud_boot_3b" ) )
	img3b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img3b )
	self.img3b = img3b
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

