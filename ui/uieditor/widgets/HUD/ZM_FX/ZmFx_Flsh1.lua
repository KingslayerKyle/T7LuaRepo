-- 2681d157c330ab55b1815dea3b5ebea8
-- This hash is used for caching, delete to decompile the file again

CoD.ZmFx_Flsh1 = InheritFrom( LUI.UIElement )
CoD.ZmFx_Flsh1.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmFx_Flsh1 )
	self.id = "ZmFx_Flsh1"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 511 )
	self:setTopBottom( true, false, 0, 216 )
	
	local Flsh1 = LUI.UIImage.new()
	Flsh1:setLeftRight( true, true, 0, 0 )
	Flsh1:setTopBottom( true, true, 0, 0 )
	Flsh1:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	Flsh1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Flsh1:setShaderVector( 0, 0.1, 1, 0, 0 )
	Flsh1:setShaderVector( 1, 0.68, 0, 0, 0 )
	self:addElement( Flsh1 )
	self.Flsh1 = Flsh1
	
	local Flsh2Mask = LUI.UIImage.new()
	Flsh2Mask:setLeftRight( true, true, 0, 0 )
	Flsh2Mask:setTopBottom( true, true, 0, 0 )
	Flsh2Mask:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh2mask" ) )
	self:addElement( Flsh2Mask )
	self.Flsh2Mask = Flsh2Mask
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
