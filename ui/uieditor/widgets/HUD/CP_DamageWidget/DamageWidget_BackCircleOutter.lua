-- 588ea4866d42507397a13aac281dc0d3
-- This hash is used for caching, delete to decompile the file again

CoD.DamageWidget_BackCircleOutter = InheritFrom( LUI.UIElement )
CoD.DamageWidget_BackCircleOutter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_BackCircleOutter )
	self.id = "DamageWidget_BackCircleOutter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 107 )
	self:setTopBottom( true, false, 0, 104 )
	
	local ImgBackCircleOutter1 = LUI.UIImage.new()
	ImgBackCircleOutter1:setLeftRight( true, false, 53.34, 106.67 )
	ImgBackCircleOutter1:setTopBottom( true, false, 0, 50 )
	ImgBackCircleOutter1:setRGB( 0.19, 0.26, 0.29 )
	ImgBackCircleOutter1:setAlpha( 0.4 )
	ImgBackCircleOutter1:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_backcircleoutter" ) )
	ImgBackCircleOutter1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgBackCircleOutter1 )
	self.ImgBackCircleOutter1 = ImgBackCircleOutter1
	
	local ImgBackCircleOutter2 = LUI.UIImage.new()
	ImgBackCircleOutter2:setLeftRight( true, false, 53.33, 106.67 )
	ImgBackCircleOutter2:setTopBottom( true, false, 50, 103.34 )
	ImgBackCircleOutter2:setRGB( 0.19, 0.26, 0.29 )
	ImgBackCircleOutter2:setAlpha( 0.4 )
	ImgBackCircleOutter2:setXRot( -180 )
	ImgBackCircleOutter2:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_backcircleoutter" ) )
	ImgBackCircleOutter2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgBackCircleOutter2 )
	self.ImgBackCircleOutter2 = ImgBackCircleOutter2
	
	local ImgBackCircleOutter3 = LUI.UIImage.new()
	ImgBackCircleOutter3:setLeftRight( true, false, 0, 53.34 )
	ImgBackCircleOutter3:setTopBottom( true, false, 50, 103.34 )
	ImgBackCircleOutter3:setRGB( 0.19, 0.26, 0.29 )
	ImgBackCircleOutter3:setAlpha( 0.4 )
	ImgBackCircleOutter3:setXRot( -180 )
	ImgBackCircleOutter3:setYRot( -180 )
	ImgBackCircleOutter3:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_backcircleoutter" ) )
	ImgBackCircleOutter3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgBackCircleOutter3 )
	self.ImgBackCircleOutter3 = ImgBackCircleOutter3
	
	local ImgBackCircleOutter4 = LUI.UIImage.new()
	ImgBackCircleOutter4:setLeftRight( true, false, 0, 53.34 )
	ImgBackCircleOutter4:setTopBottom( true, false, 0, 50 )
	ImgBackCircleOutter4:setRGB( 0.19, 0.26, 0.29 )
	ImgBackCircleOutter4:setAlpha( 0.4 )
	ImgBackCircleOutter4:setYRot( -180 )
	ImgBackCircleOutter4:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_backcircleoutter" ) )
	ImgBackCircleOutter4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgBackCircleOutter4 )
	self.ImgBackCircleOutter4 = ImgBackCircleOutter4
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

