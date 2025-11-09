CoD.SelectionInfoWidgetItemBoxFore = InheritFrom( LUI.UIElement )
CoD.SelectionInfoWidgetItemBoxFore.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionInfoWidgetItemBoxFore )
	self.id = "SelectionInfoWidgetItemBoxFore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 334 )
	
	local CornerFore1 = LUI.UIImage.new()
	CornerFore1:setLeftRight( true, false, 1, 9 )
	CornerFore1:setTopBottom( true, true, 325, -1 )
	CornerFore1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerfore" ) )
	CornerFore1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerFore1 )
	self.CornerFore1 = CornerFore1
	
	local CornerFore2 = LUI.UIImage.new()
	CornerFore2:setLeftRight( true, false, 1, 9 )
	CornerFore2:setTopBottom( true, true, 9, -333 )
	CornerFore2:setRGB( 1, 1, 1 )
	CornerFore2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerfore" ) )
	CornerFore2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerFore2 )
	self.CornerFore2 = CornerFore2
	
	local CornerFore3 = LUI.UIImage.new()
	CornerFore3:setLeftRight( false, true, -2, -10 )
	CornerFore3:setTopBottom( true, true, 325, -1 )
	CornerFore3:setRGB( 1, 1, 1 )
	CornerFore3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerfore" ) )
	CornerFore3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerFore3 )
	self.CornerFore3 = CornerFore3
	
	local CornerFore4 = LUI.UIImage.new()
	CornerFore4:setLeftRight( false, true, -2, -10 )
	CornerFore4:setTopBottom( true, true, 9, -333 )
	CornerFore4:setRGB( 1, 1, 1 )
	CornerFore4:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerfore" ) )
	CornerFore4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerFore4 )
	self.CornerFore4 = CornerFore4
	
	local LineForeL = LUI.UIImage.new()
	LineForeL:setLeftRight( true, false, 0, 5.34 )
	LineForeL:setTopBottom( true, true, 14.33, -13.33 )
	LineForeL:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinefore" ) )
	LineForeL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineForeL )
	self.LineForeL = LineForeL
	
	local LineForeR = LUI.UIImage.new()
	LineForeR:setLeftRight( false, true, -5, 0.34 )
	LineForeR:setTopBottom( true, true, 14.33, -13.33 )
	LineForeR:setRGB( 1, 1, 1 )
	LineForeR:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinefore" ) )
	LineForeR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineForeR )
	self.LineForeR = LineForeR
	
	local LineForeT = LUI.UIImage.new()
	LineForeT:setLeftRight( true, true, 12.83, -13.83 )
	LineForeT:setTopBottom( true, true, 0, -331.33 )
	LineForeT:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	LineForeT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineForeT )
	self.LineForeT = LineForeT
	
	local LineForeB = LUI.UIImage.new()
	LineForeB:setLeftRight( true, true, 12.83, -13.83 )
	LineForeB:setTopBottom( true, true, 331.33, 0 )
	LineForeB:setRGB( 1, 1, 1 )
	LineForeB:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	LineForeB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineForeB )
	self.LineForeB = LineForeB
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

