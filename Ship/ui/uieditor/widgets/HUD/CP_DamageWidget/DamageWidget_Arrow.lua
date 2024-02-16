-- 94cf8df96ddbcc26f027ded70a8d3d63
-- This hash is used for caching, delete to decompile the file again

CoD.DamageWidget_Arrow = InheritFrom( LUI.UIElement )
CoD.DamageWidget_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_Arrow )
	self.id = "DamageWidget_Arrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 5 )
	self:setTopBottom( true, false, 0, 7 )
	
	local ImgArrow = LUI.UIImage.new()
	ImgArrow:setLeftRight( true, false, 0, 5.33 )
	ImgArrow:setTopBottom( true, false, 0, 6.67 )
	ImgArrow:setZRot( 180 )
	ImgArrow:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_arrow" ) )
	self:addElement( ImgArrow )
	self.ImgArrow = ImgArrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
