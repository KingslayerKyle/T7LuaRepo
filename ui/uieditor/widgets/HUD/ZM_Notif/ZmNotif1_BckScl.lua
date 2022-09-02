-- 006c04e51ecc94b71886e33a2e95274f
-- This hash is used for caching, delete to decompile the file again

CoD.ZmNotif1_BckScl = InheritFrom( LUI.UIElement )
CoD.ZmNotif1_BckScl.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.ZmNotif1_BckScl )
	self.id = "ZmNotif1_BckScl"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 203 )
	self:setTopBottom( true, false, 0, 49 )
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( false, false, -356, 356 )
	Image12:setTopBottom( false, false, -24.5, 24.5 )
	Image12:setRGB( 1, 0.46, 0.13 )
	Image12:setImage( RegisterImage( "uie_t7_zm_hud_notif_txtbacking" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image12:setShaderVector( 0, 3.76, 1, 0, 0 )
	Image12:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local SideMaskL2 = LUI.UIImage.new()
	SideMaskL2:setLeftRight( true, false, 0, 37.76 )
	SideMaskL2:setTopBottom( false, false, -24.5, 24.5 )
	SideMaskL2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( SideMaskL2 )
	self.SideMaskL2 = SideMaskL2
	
	local SideMaskL20 = LUI.UIImage.new()
	SideMaskL20:setLeftRight( false, true, -37.76, 0 )
	SideMaskL20:setTopBottom( false, false, -24.5, 24.5 )
	SideMaskL20:setYRot( 180 )
	SideMaskL20:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( SideMaskL20 )
	self.SideMaskL20 = SideMaskL20
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

