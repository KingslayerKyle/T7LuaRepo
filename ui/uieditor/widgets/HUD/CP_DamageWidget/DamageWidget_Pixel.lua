-- 17d365c15773c275ec2012094b0d0f66
-- This hash is used for caching, delete to decompile the file again

CoD.DamageWidget_Pixel = InheritFrom( LUI.UIElement )
CoD.DamageWidget_Pixel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_Pixel )
	self.id = "DamageWidget_Pixel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 7 )
	self:setTopBottom( true, false, 0, 1 )
	
	local ImgPixel = LUI.UIImage.new()
	ImgPixel:setLeftRight( true, true, 0, 0 )
	ImgPixel:setTopBottom( true, true, 0, 0 )
	ImgPixel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgPixel )
	self.ImgPixel = ImgPixel
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
