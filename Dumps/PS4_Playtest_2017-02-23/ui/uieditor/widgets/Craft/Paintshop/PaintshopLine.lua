CoD.PaintshopLine = InheritFrom( LUI.UIElement )
CoD.PaintshopLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopLine )
	self.id = "PaintshopLine"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1722 )
	self:setTopBottom( 0, 0, 0, 6 )
	
	local topline = LUI.UIImage.new()
	topline:setLeftRight( 0, 1, 0, 0 )
	topline:setTopBottom( 0.5, 0.5, -3, 3 )
	topline:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	topline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( topline )
	self.topline = topline
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

