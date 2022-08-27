-- 6138bdb68e8f6c5574cfda3d7cbbc02b
-- This hash is used for caching, delete to decompile the file again

CoD.BuildableIconBg = InheritFrom( LUI.UIElement )
CoD.BuildableIconBg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BuildableIconBg )
	self.id = "BuildableIconBg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local bgFill = LUI.UIImage.new()
	bgFill:setLeftRight( true, true, 0, 0 )
	bgFill:setTopBottom( true, true, 0, 0 )
	bgFill:setRGB( 0, 0, 0 )
	bgFill:setAlpha( 0.3 )
	self:addElement( bgFill )
	self.bgFill = bgFill
	
	local bgGradient = LUI.UIImage.new()
	bgGradient:setLeftRight( true, true, 2, -2 )
	bgGradient:setTopBottom( true, true, 1, -25 )
	bgGradient:setRGB( 0, 0, 0 )
	bgGradient:setImage( RegisterImage( "uie_mp_cac_grad_stretch" ) )
	self:addElement( bgGradient )
	self.bgGradient = bgGradient
	
	local backGlow = LUI.UIImage.new()
	backGlow:setLeftRight( true, true, 1, -1 )
	backGlow:setTopBottom( false, true, -61, -1 )
	backGlow:setAlpha( 0.05 )
	backGlow:setImage( RegisterImage( "uie_mp_cac_grad_stretch_add" ) )
	self:addElement( backGlow )
	self.backGlow = backGlow
	
	local frontGlow = LUI.UIImage.new()
	frontGlow:setLeftRight( true, true, 1, -1 )
	frontGlow:setTopBottom( false, true, -55, -25 )
	frontGlow:setAlpha( 0.05 )
	frontGlow:setImage( RegisterImage( "uie_mp_cac_grad_stretch_add_v2" ) )
	self:addElement( frontGlow )
	self.frontGlow = frontGlow
	
	local whiteGrad = LUI.UIImage.new()
	whiteGrad:setLeftRight( true, true, 5, -5 )
	whiteGrad:setTopBottom( true, false, 4, 44 )
	whiteGrad:setAlpha( 0.1 )
	whiteGrad:setImage( RegisterImage( "uie_mp_cac_grad_stretch" ) )
	self:addElement( whiteGrad )
	self.whiteGrad = whiteGrad
	
	local grungeImage = LUI.UIImage.new()
	grungeImage:setLeftRight( true, true, 5, -5 )
	grungeImage:setTopBottom( true, false, 4, 44 )
	grungeImage:setAlpha( 0 )
	self:addElement( grungeImage )
	self.grungeImage = grungeImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

