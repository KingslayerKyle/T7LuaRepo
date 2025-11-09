CoD.CornerPixels = InheritFrom( LUI.UIElement )
CoD.CornerPixels.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CornerPixels )
	self.id = "CornerPixels"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 448 )
	self:setTopBottom( true, false, 0, 302 )
	
	local pixeloverlay = LUI.UIImage.new()
	pixeloverlay:setLeftRight( true, false, 0, 448 )
	pixeloverlay:setTopBottom( true, false, 0, 302 )
	pixeloverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( pixeloverlay )
	self.pixeloverlay = pixeloverlay
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

