CoD.SelectionInfoWidgetItemBoxBack = InheritFrom( LUI.UIElement )
CoD.SelectionInfoWidgetItemBoxBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionInfoWidgetItemBoxBack )
	self.id = "SelectionInfoWidgetItemBoxBack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 717 )
	self:setTopBottom( true, false, 0, 333 )
	
	local CornerBack1 = LUI.UIImage.new()
	CornerBack1:setLeftRight( true, true, 0, -706.33 )
	CornerBack1:setTopBottom( false, true, -322.33, -333 )
	CornerBack1:setRGB( 1, 1, 1 )
	CornerBack1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerback" ) )
	CornerBack1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerBack1 )
	self.CornerBack1 = CornerBack1
	
	local CornerBack2 = LUI.UIImage.new()
	CornerBack2:setLeftRight( true, true, 0, -706.33 )
	CornerBack2:setTopBottom( false, true, -10.67, 0 )
	CornerBack2:setRGB( 1, 1, 1 )
	CornerBack2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerback" ) )
	CornerBack2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerBack2 )
	self.CornerBack2 = CornerBack2
	
	local CornerBack3 = LUI.UIImage.new()
	CornerBack3:setLeftRight( true, true, 717, -10.67 )
	CornerBack3:setTopBottom( true, false, 10.67, 0 )
	CornerBack3:setRGB( 1, 1, 1 )
	CornerBack3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerback" ) )
	CornerBack3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerBack3 )
	self.CornerBack3 = CornerBack3
	
	local CornerBack4 = LUI.UIImage.new()
	CornerBack4:setLeftRight( true, true, 717, -10.67 )
	CornerBack4:setTopBottom( false, true, -10.67, 0 )
	CornerBack4:setRGB( 1, 1, 1 )
	CornerBack4:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcornerback" ) )
	CornerBack4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CornerBack4 )
	self.CornerBack4 = CornerBack4
	
	local LineBackL = LUI.UIImage.new()
	LineBackL:setLeftRight( true, false, 0, 5.34 )
	LineBackL:setTopBottom( true, true, 14.33, -14.67 )
	LineBackL:setRGB( 1, 1, 1 )
	LineBackL:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineback" ) )
	LineBackL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineBackL )
	self.LineBackL = LineBackL
	
	local LineBackR = LUI.UIImage.new()
	LineBackR:setLeftRight( false, true, -5.34, 0 )
	LineBackR:setTopBottom( true, true, 14.33, -14.67 )
	LineBackR:setRGB( 1, 1, 1 )
	LineBackR:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineback" ) )
	LineBackR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineBackR )
	self.LineBackR = LineBackR
	
	local LineBackT = LUI.UIImage.new()
	LineBackT:setLeftRight( true, true, 11, -10 )
	LineBackT:setTopBottom( true, false, 0, 5.34 )
	LineBackT:setRGB( 1, 1, 1 )
	LineBackT:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinebackh" ) )
	LineBackT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineBackT )
	self.LineBackT = LineBackT
	
	local LineBackB = LUI.UIImage.new()
	LineBackB:setLeftRight( true, true, 11, -10 )
	LineBackB:setTopBottom( false, true, -5.34, 0 )
	LineBackB:setRGB( 1, 1, 1 )
	LineBackB:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinebackh" ) )
	LineBackB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineBackB )
	self.LineBackB = LineBackB
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

