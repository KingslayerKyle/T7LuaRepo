-- 42d191b68851a3e8ac92a93ebeef3d76
-- This hash is used for caching, delete to decompile the file again

CoD.ElemssidelistLines_Medals = InheritFrom( LUI.UIElement )
CoD.ElemssidelistLines_Medals.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ElemssidelistLines_Medals )
	self.id = "ElemssidelistLines_Medals"
	self.soundSet = "CAC_PrimaryAttachment"
	self:setLeftRight( true, false, 0, 53 )
	self:setTopBottom( true, false, 0, 670 )
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 0.5, 5.5 )
	LineSide0:setTopBottom( true, false, 0, 252 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local pixelc0 = LUI.UIImage.new()
	pixelc0:setLeftRight( true, false, 0, 16 )
	pixelc0:setTopBottom( true, false, 177, 229 )
	pixelc0:setZoom( -5 )
	pixelc0:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0 )
	self.pixelc0 = pixelc0
	
	local pixelc1 = LUI.UIImage.new()
	pixelc1:setLeftRight( true, false, 0, 16 )
	pixelc1:setTopBottom( true, false, 332, 384 )
	pixelc1:setZoom( -5 )
	pixelc1:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc1 )
	self.pixelc1 = pixelc1
	
	local pixelc00 = LUI.UIImage.new()
	pixelc00:setLeftRight( true, false, 0, 16 )
	pixelc00:setTopBottom( true, false, 296, 348 )
	pixelc00:setZoom( -5 )
	pixelc00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00 )
	self.pixelc00 = pixelc00
	
	local pixelc10 = LUI.UIImage.new()
	pixelc10:setLeftRight( true, false, 0, 16 )
	pixelc10:setTopBottom( true, false, 469, 521 )
	pixelc10:setZoom( -5 )
	pixelc10:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc10 )
	self.pixelc10 = pixelc10
	
	local pixelc000 = LUI.UIImage.new()
	pixelc000:setLeftRight( true, false, 0, 16 )
	pixelc000:setTopBottom( true, false, 415, 467 )
	pixelc000:setZoom( -5 )
	pixelc000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000 )
	self.pixelc000 = pixelc000
	
	local pixelc100 = LUI.UIImage.new()
	pixelc100:setLeftRight( true, false, 0, 16 )
	pixelc100:setTopBottom( true, false, 584, 636 )
	pixelc100:setZoom( -5 )
	pixelc100:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc100 )
	self.pixelc100 = pixelc100
	
	local pixelc0000 = LUI.UIImage.new()
	pixelc0000:setLeftRight( true, false, 0, 16 )
	pixelc0000:setTopBottom( true, false, 584, 636 )
	pixelc0000:setZoom( -5 )
	pixelc0000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0000 )
	self.pixelc0000 = pixelc0000
	
	local pixelc01 = LUI.UIImage.new()
	pixelc01:setLeftRight( true, false, 0, 16 )
	pixelc01:setTopBottom( true, false, 164, 216 )
	pixelc01:setZoom( -5 )
	pixelc01:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc01 )
	self.pixelc01 = pixelc01
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 15.5, 23.5 )
	LineSide:setTopBottom( true, false, 0, 670 )
	LineSide:setAlpha( 0.27 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

