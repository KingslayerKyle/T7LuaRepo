-- 0e1645d29bf303a63a49355f7f93b009
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_BackCircleOutter = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_BackCircleOutter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_BackCircleOutter )
	self.id = "AmmoWidget_BackCircleOutter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 95 )
	self:setTopBottom( true, false, 0, 93 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, -0.33 )
	Image0:setTopBottom( true, true, 0, 0.33 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_backcircleoutter" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

