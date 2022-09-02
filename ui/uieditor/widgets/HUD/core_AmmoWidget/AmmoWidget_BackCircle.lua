-- 089fb72008fde574e4347bf05008e0e4
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_BackCircle = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_BackCircle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_BackCircle )
	self.id = "AmmoWidget_BackCircle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 95 )
	self:setTopBottom( true, false, 0, 106 )
	
	local ImgBackCircleInner = LUI.UIImage.new()
	ImgBackCircleInner:setLeftRight( true, false, 10.25, 84.93 )
	ImgBackCircleInner:setTopBottom( true, false, 22, 97.66 )
	ImgBackCircleInner:setZoom( -2 )
	ImgBackCircleInner:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_backcircleinner" ) )
	self:addElement( ImgBackCircleInner )
	self.ImgBackCircleInner = ImgBackCircleInner
	
	local ImgBackCircleOutter = LUI.UIImage.new()
	ImgBackCircleOutter:setLeftRight( true, false, 0, 94.67 )
	ImgBackCircleOutter:setTopBottom( true, false, 12.34, 105.67 )
	ImgBackCircleOutter:setAlpha( 0.7 )
	ImgBackCircleOutter:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_backcircleoutter" ) )
	self:addElement( ImgBackCircleOutter )
	self.ImgBackCircleOutter = ImgBackCircleOutter
	
	local ImgBackCircleOutterLine = LUI.UIImage.new()
	ImgBackCircleOutterLine:setLeftRight( true, false, 46.01, 47.33 )
	ImgBackCircleOutterLine:setTopBottom( true, false, 1, 14.33 )
	ImgBackCircleOutterLine:setAlpha( 0.7 )
	ImgBackCircleOutterLine:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_backcircleoutterline" ) )
	self:addElement( ImgBackCircleOutterLine )
	self.ImgBackCircleOutterLine = ImgBackCircleOutterLine
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

