-- 08d24f1681ddf9fd7e0365125f1c4b36
-- This hash is used for caching, delete to decompile the file again

CoD.TitleDotsWidget = InheritFrom( LUI.UIElement )
CoD.TitleDotsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TitleDotsWidget )
	self.id = "TitleDotsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 525 )
	self:setTopBottom( true, false, 0, 158 )
	
	local TitleDots1 = LUI.UIImage.new()
	TitleDots1:setLeftRight( true, false, 0, 53.34 )
	TitleDots1:setTopBottom( true, false, 62, 142 )
	TitleDots1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots1 )
	self.TitleDots1 = TitleDots1
	
	local TitleDots2 = LUI.UIImage.new()
	TitleDots2:setLeftRight( true, false, 52.34, 105.68 )
	TitleDots2:setTopBottom( true, false, 126.33, 46.33 )
	TitleDots2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots2 )
	self.TitleDots2 = TitleDots2
	
	local TitleDots3 = LUI.UIImage.new()
	TitleDots3:setLeftRight( true, false, 85.68, 139.02 )
	TitleDots3:setTopBottom( true, false, 63, 143 )
	TitleDots3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots3 )
	self.TitleDots3 = TitleDots3
	
	local TitleDots4 = LUI.UIImage.new()
	TitleDots4:setLeftRight( true, false, 124, 177.34 )
	TitleDots4:setTopBottom( true, false, 0, 80 )
	TitleDots4:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots4 )
	self.TitleDots4 = TitleDots4
	
	local TitleDots5 = LUI.UIImage.new()
	TitleDots5:setLeftRight( true, false, 159, 212.34 )
	TitleDots5:setTopBottom( true, false, 62, 142 )
	TitleDots5:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots5 )
	self.TitleDots5 = TitleDots5
	
	local TitleDots6 = LUI.UIImage.new()
	TitleDots6:setLeftRight( true, false, 211.34, 264.68 )
	TitleDots6:setTopBottom( true, false, 126.33, 46.33 )
	TitleDots6:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots6 )
	self.TitleDots6 = TitleDots6
	
	local TitleDots7 = LUI.UIImage.new()
	TitleDots7:setLeftRight( true, false, 246.34, 299.68 )
	TitleDots7:setTopBottom( true, false, 126.33, 46.33 )
	TitleDots7:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots7 )
	self.TitleDots7 = TitleDots7
	
	local TItleDots8 = LUI.UIImage.new()
	TItleDots8:setLeftRight( true, false, 321, 374.34 )
	TItleDots8:setTopBottom( true, false, 62, 142 )
	TItleDots8:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TItleDots8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TItleDots8 )
	self.TItleDots8 = TItleDots8
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 472, 525.34 )
	Image0:setTopBottom( true, false, 62, 142 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

