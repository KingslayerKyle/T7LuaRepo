CoD.XpBar = InheritFrom( LUI.UIElement )
CoD.XpBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.XpBar )
	self.id = "XpBar"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 1386 )
	self:setTopBottom( 0, 0, 0, 18 )
	
	local XpBarBg = LUI.UIImage.new()
	XpBarBg:setLeftRight( 0, 1, 0, 0 )
	XpBarBg:setTopBottom( 0, 1, 0, 0 )
	XpBarBg:setRGB( 0.62, 0.62, 0.62 )
	XpBarBg:setAlpha( 0.28 )
	self:addElement( XpBarBg )
	self.XpBarBg = XpBarBg
	
	local XpBarEarnedXPBg = LUI.UIImage.new()
	XpBarEarnedXPBg:setLeftRight( 0, 1, 0, 0 )
	XpBarEarnedXPBg:setTopBottom( 0, 1, 0, 0 )
	XpBarEarnedXPBg:setRGB( 0.95, 0.91, 0.11 )
	XpBarEarnedXPBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	XpBarEarnedXPBg:setShaderVector( 0, 0.68, 0, 0, 0 )
	XpBarEarnedXPBg:setShaderVector( 1, 0, 0, 0, 0 )
	XpBarEarnedXPBg:setShaderVector( 2, 1, 0, 0, 0 )
	XpBarEarnedXPBg:setShaderVector( 3, 0, 0, 0, 0 )
	XpBarEarnedXPBg:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( XpBarEarnedXPBg )
	self.XpBarEarnedXPBg = XpBarEarnedXPBg
	
	local XpBarCurrXPBg = LUI.UIImage.new()
	XpBarCurrXPBg:setLeftRight( 0, 1, 0, 0 )
	XpBarCurrXPBg:setTopBottom( 0, 1, 0, 0 )
	XpBarCurrXPBg:setRGB( 1, 0.35, 0 )
	XpBarCurrXPBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	XpBarCurrXPBg:setShaderVector( 0, 0.74, 0, 0, 0 )
	XpBarCurrXPBg:setShaderVector( 1, 0, 0, 0, 0 )
	XpBarCurrXPBg:setShaderVector( 2, 1, 0, 0, 0 )
	XpBarCurrXPBg:setShaderVector( 3, 0, 0, 0, 0 )
	XpBarCurrXPBg:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( XpBarCurrXPBg )
	self.XpBarCurrXPBg = XpBarCurrXPBg
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

