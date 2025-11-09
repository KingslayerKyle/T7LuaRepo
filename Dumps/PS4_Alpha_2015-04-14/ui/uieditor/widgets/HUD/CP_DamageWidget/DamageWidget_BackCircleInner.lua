CoD.DamageWidget_BackCircleInner = InheritFrom( LUI.UIElement )
CoD.DamageWidget_BackCircleInner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_BackCircleInner )
	self.id = "DamageWidget_BackCircleInner"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 95 )
	
	local ImgBackCircleInner = LUI.UIImage.new()
	ImgBackCircleInner:setLeftRight( true, true, 3.5, -1.83 )
	ImgBackCircleInner:setTopBottom( true, true, 1.5, -1.5 )
	ImgBackCircleInner:setRGB( 1, 1, 1 )
	ImgBackCircleInner:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_backcircleinner" ) )
	ImgBackCircleInner:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgBackCircleInner )
	self.ImgBackCircleInner = ImgBackCircleInner
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

