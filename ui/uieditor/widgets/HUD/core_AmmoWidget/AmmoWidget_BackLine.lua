-- 3c659f9f82f1400dbcf9851c30fa75a9
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_BackLine = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_BackLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_BackLine )
	self.id = "AmmoWidget_BackLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 149 )
	self:setTopBottom( true, false, 0, 3 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0.33 )
	Image0:setTopBottom( false, false, -1.5, 1.17 )
	Image0:setRGB( 0.24, 0.49, 0.65 )
	Image0:setAlpha( 0.3 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_backline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
