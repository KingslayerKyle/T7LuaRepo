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
	self:setLeftRight( 0, 0, 0, 787 )
	self:setTopBottom( 0, 0, 0, 237 )
	
	local TitleDots1 = LUI.UIImage.new()
	TitleDots1:setLeftRight( 0, 0, 0, 80 )
	TitleDots1:setTopBottom( 0, 0, 93, 213 )
	TitleDots1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots1 )
	self.TitleDots1 = TitleDots1
	
	local TitleDots2 = LUI.UIImage.new()
	TitleDots2:setLeftRight( 0, 0, 79, 159 )
	TitleDots2:setTopBottom( 0, 0, 189, 69 )
	TitleDots2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots2 )
	self.TitleDots2 = TitleDots2
	
	local TitleDots3 = LUI.UIImage.new()
	TitleDots3:setLeftRight( 0, 0, 129, 209 )
	TitleDots3:setTopBottom( 0, 0, 94, 214 )
	TitleDots3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots3 )
	self.TitleDots3 = TitleDots3
	
	local TitleDots4 = LUI.UIImage.new()
	TitleDots4:setLeftRight( 0, 0, 186, 266 )
	TitleDots4:setTopBottom( 0, 0, 0, 120 )
	TitleDots4:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots4 )
	self.TitleDots4 = TitleDots4
	
	local TitleDots5 = LUI.UIImage.new()
	TitleDots5:setLeftRight( 0, 0, 239, 319 )
	TitleDots5:setTopBottom( 0, 0, 93, 213 )
	TitleDots5:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots5 )
	self.TitleDots5 = TitleDots5
	
	local TitleDots6 = LUI.UIImage.new()
	TitleDots6:setLeftRight( 0, 0, 317, 397 )
	TitleDots6:setTopBottom( 0, 0, 189, 69 )
	TitleDots6:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots6 )
	self.TitleDots6 = TitleDots6
	
	local TitleDots7 = LUI.UIImage.new()
	TitleDots7:setLeftRight( 0, 0, 370, 450 )
	TitleDots7:setTopBottom( 0, 0, 189, 69 )
	TitleDots7:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TitleDots7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleDots7 )
	self.TitleDots7 = TitleDots7
	
	local TItleDots8 = LUI.UIImage.new()
	TItleDots8:setLeftRight( 0, 0, 482, 562 )
	TItleDots8:setTopBottom( 0, 0, 93, 213 )
	TItleDots8:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titledots" ) )
	TItleDots8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TItleDots8 )
	self.TItleDots8 = TItleDots8
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 708, 788 )
	Image0:setTopBottom( 0, 0, 93, 213 )
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

