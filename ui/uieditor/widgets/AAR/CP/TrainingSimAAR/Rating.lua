-- 17a9c7ef88ea4c2d3a3a1c5fc6da3268
-- This hash is used for caching, delete to decompile the file again

CoD.Rating = InheritFrom( LUI.UIElement )
CoD.Rating.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Rating )
	self.id = "Rating"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 192 )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -39, 231 )
	Glow:setTopBottom( true, false, -39, 231 )
	Glow:setRGB( 0.24, 0.24, 0.26 )
	Glow:setAlpha( 0.4 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local WinsRing = LUI.UIImage.new()
	WinsRing:setLeftRight( true, false, 0, 192 )
	WinsRing:setTopBottom( true, false, 0, 192 )
	WinsRing:setRGB( 0.95, 0.91, 0.11 )
	WinsRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringback" ) )
	self:addElement( WinsRing )
	self.WinsRing = WinsRing
	
	local LossesRing = LUI.UIImage.new()
	LossesRing:setLeftRight( true, false, 0, 192 )
	LossesRing:setTopBottom( true, false, 0, 192 )
	LossesRing:setRGB( 0.15, 0.15, 0.15 )
	LossesRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringfore" ) )
	LossesRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	LossesRing:setShaderVector( 0, 0.37, 0, 0, 0 )
	LossesRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	LossesRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	LossesRing:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( LossesRing )
	self.LossesRing = LossesRing
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

