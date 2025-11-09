CoD.DamageWidget_SemiCircle = InheritFrom( LUI.UIElement )
CoD.DamageWidget_SemiCircle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_SemiCircle )
	self.id = "DamageWidget_SemiCircle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 21 )
	self:setTopBottom( true, false, 0, 80 )
	
	local ImgArc = LUI.UIImage.new()
	ImgArc:setLeftRight( false, false, -10.5, 10.83 )
	ImgArc:setTopBottom( true, false, 0, 80 )
	ImgArc:setRGB( 1, 1, 1 )
	ImgArc:setAlpha( 0.55 )
	ImgArc:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_semicircle" ) )
	ImgArc:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgArc )
	self.ImgArc = ImgArc
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

