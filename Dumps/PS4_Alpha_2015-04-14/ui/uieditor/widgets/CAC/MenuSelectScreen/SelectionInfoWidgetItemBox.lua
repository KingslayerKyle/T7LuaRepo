require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectionInfoWidgetItemBoxFore" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectionInfoWidgetItemBoxBack" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectionInfoWidgetItemBoxSpinner" )

CoD.SelectionInfoWidgetItemBox = InheritFrom( LUI.UIElement )
CoD.SelectionInfoWidgetItemBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionInfoWidgetItemBox )
	self.id = "SelectionInfoWidgetItemBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 625 )
	self.anyChildUsesUpdateState = true
	
	local SelectionInfoWidgetItemBoxFore = CoD.SelectionInfoWidgetItemBoxFore.new( menu, controller )
	SelectionInfoWidgetItemBoxFore:setLeftRight( true, false, 0, 720.34 )
	SelectionInfoWidgetItemBoxFore:setTopBottom( true, false, 146, 480 )
	SelectionInfoWidgetItemBoxFore:setRGB( 1, 1, 1 )
	self:addElement( SelectionInfoWidgetItemBoxFore )
	self.SelectionInfoWidgetItemBoxFore = SelectionInfoWidgetItemBoxFore
	
	local SelectionInfoWidgetItemBoxBack = CoD.SelectionInfoWidgetItemBoxBack.new( menu, controller )
	SelectionInfoWidgetItemBoxBack:setLeftRight( true, false, 1, 718 )
	SelectionInfoWidgetItemBoxBack:setTopBottom( true, false, 147, 480 )
	SelectionInfoWidgetItemBoxBack:setRGB( 1, 1, 1 )
	SelectionInfoWidgetItemBoxBack:setAlpha( 0 )
	SelectionInfoWidgetItemBoxBack:setZoom( -300 )
	self:addElement( SelectionInfoWidgetItemBoxBack )
	self.SelectionInfoWidgetItemBoxBack = SelectionInfoWidgetItemBoxBack
	
	local LineDistance1 = LUI.UIImage.new()
	LineDistance1:setLeftRight( true, false, 1, 6.34 )
	LineDistance1:setTopBottom( true, false, 47, 247 )
	LineDistance1:setRGB( 1, 1, 1 )
	LineDistance1:setAlpha( 0 )
	LineDistance1:setYRot( 90 )
	LineDistance1:setZRot( 270 )
	LineDistance1:setZoom( -150 )
	LineDistance1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinedistance" ) )
	LineDistance1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDistance1 )
	self.LineDistance1 = LineDistance1
	
	local LineDistance2 = LUI.UIImage.new()
	LineDistance2:setLeftRight( true, false, 715, 720.34 )
	LineDistance2:setTopBottom( true, false, 47.5, 247.5 )
	LineDistance2:setRGB( 1, 1, 1 )
	LineDistance2:setAlpha( 0 )
	LineDistance2:setYRot( 90 )
	LineDistance2:setZRot( 270 )
	LineDistance2:setZoom( -150 )
	LineDistance2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinedistance" ) )
	LineDistance2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDistance2 )
	self.LineDistance2 = LineDistance2
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -150.92, 157.67 )
	Image2:setTopBottom( false, false, 31.36, 300.5 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setAlpha( 0 )
	Image2:setXRot( -90 )
	Image2:setZoom( -160 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcircletop" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local SelectionInfoWidgetItemBoxSpinner0 = CoD.SelectionInfoWidgetItemBoxSpinner.new( menu, controller )
	SelectionInfoWidgetItemBoxSpinner0:setLeftRight( true, false, 334.11, 393.5 )
	SelectionInfoWidgetItemBoxSpinner0:setTopBottom( true, false, 447.81, 507.19 )
	SelectionInfoWidgetItemBoxSpinner0:setRGB( 0.49, 0.49, 0.49 )
	SelectionInfoWidgetItemBoxSpinner0:setAlpha( 0 )
	SelectionInfoWidgetItemBoxSpinner0:setXRot( 90 )
	SelectionInfoWidgetItemBoxSpinner0:setZoom( -125 )
	self:addElement( SelectionInfoWidgetItemBoxSpinner0 )
	self.SelectionInfoWidgetItemBoxSpinner0 = SelectionInfoWidgetItemBoxSpinner0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 1, 6.34 )
	Image0:setTopBottom( true, false, 377.5, 577.5 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setYRot( 90 )
	Image0:setZRot( 270 )
	Image0:setZoom( -150 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinedistance" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 715, 720.34 )
	Image3:setTopBottom( true, false, 378, 578 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setAlpha( 0 )
	Image3:setYRot( 90 )
	Image3:setZRot( 270 )
	Image3:setZoom( -150 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlinedistance" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -150.92, 157.67 )
	Image1:setTopBottom( false, false, -297.64, -28.5 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setAlpha( 0 )
	Image1:setXRot( -90 )
	Image1:setZoom( -160 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxcircletop" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local SelectionInfoWidgetItemBoxSpinner1 = CoD.SelectionInfoWidgetItemBoxSpinner.new( menu, controller )
	SelectionInfoWidgetItemBoxSpinner1:setLeftRight( true, false, 334.11, 393.5 )
	SelectionInfoWidgetItemBoxSpinner1:setTopBottom( true, false, 119.81, 179.19 )
	SelectionInfoWidgetItemBoxSpinner1:setRGB( 0.49, 0.49, 0.49 )
	SelectionInfoWidgetItemBoxSpinner1:setAlpha( 0 )
	SelectionInfoWidgetItemBoxSpinner1:setXRot( 90 )
	SelectionInfoWidgetItemBoxSpinner1:setZoom( -125 )
	self:addElement( SelectionInfoWidgetItemBoxSpinner1 )
	self.SelectionInfoWidgetItemBoxSpinner1 = SelectionInfoWidgetItemBoxSpinner1
	
	self.close = function ( self )
		self.SelectionInfoWidgetItemBoxFore:close()
		self.SelectionInfoWidgetItemBoxBack:close()
		self.SelectionInfoWidgetItemBoxSpinner0:close()
		self.SelectionInfoWidgetItemBoxSpinner1:close()
		CoD.SelectionInfoWidgetItemBox.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

