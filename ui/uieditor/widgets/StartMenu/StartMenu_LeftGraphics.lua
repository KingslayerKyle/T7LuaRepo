-- 243aa2147ec54ab3d177d3f4169f25da
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_LeftGraphics = InheritFrom( LUI.UIElement )
CoD.StartMenu_LeftGraphics.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_LeftGraphics )
	self.id = "StartMenu_LeftGraphics"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 599 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 33, 35 )
	LineSide:setTopBottom( true, false, -83, 569 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

