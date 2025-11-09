CoD.MapWidget_BarTop = InheritFrom( LUI.UIElement )
CoD.MapWidget_BarTop.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapWidget_BarTop )
	self.id = "MapWidget_BarTop"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 252 )
	self:setTopBottom( true, false, 0, 6 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 1, -3 )
	Image0:setAlpha( 0.8 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_bartop" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

