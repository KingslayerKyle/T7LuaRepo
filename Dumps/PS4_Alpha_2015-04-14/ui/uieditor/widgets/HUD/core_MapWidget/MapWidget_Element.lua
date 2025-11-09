CoD.MapWidget_Element = InheritFrom( LUI.UIElement )
CoD.MapWidget_Element.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapWidget_Element )
	self.id = "MapWidget_Element"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 21 )
	self:setTopBottom( true, false, 0, 12 )
	
	local ImgElement = LUI.UIImage.new()
	ImgElement:setLeftRight( true, false, 0, 21.33 )
	ImgElement:setTopBottom( true, false, 0, 12.33 )
	ImgElement:setRGB( 1, 1, 1 )
	ImgElement:setAlpha( 0 )
	ImgElement:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_elementbase" ) )
	ImgElement:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgElement )
	self.ImgElement = ImgElement
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

