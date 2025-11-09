CoD.ScoreInfo_TimeSemi = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_TimeSemi.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_TimeSemi )
	self.id = "ScoreInfo_TimeSemi"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 84 )
	
	local ImgArc = LUI.UIImage.new()
	ImgArc:setLeftRight( true, true, 1.5, -1.17 )
	ImgArc:setTopBottom( true, true, 2, -2 )
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

