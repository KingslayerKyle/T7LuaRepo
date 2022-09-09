-- 5dacee583c897775586379ca598c073c
-- This hash is used for caching, delete to decompile the file again

CoD.woundedSoldier_EKG = InheritFrom( LUI.UIElement )
CoD.woundedSoldier_EKG.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.woundedSoldier_EKG )
	self.id = "woundedSoldier_EKG"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 193 )
	self:setTopBottom( true, false, 0, 67 )
	
	local Solid = LUI.UIImage.new()
	Solid:setLeftRight( true, false, 0, 193 )
	Solid:setTopBottom( true, false, 0, 67 )
	Solid:setRGB( 0, 0, 0 )
	self:addElement( Solid )
	self.Solid = Solid
	
	local EKGCritical = LUI.UIImage.new()
	EKGCritical:setLeftRight( true, false, 3.92, 187.75 )
	EKGCritical:setTopBottom( true, false, 3.67, 66.67 )
	EKGCritical:setRGB( 1, 0, 0.08 )
	EKGCritical:setImage( RegisterImage( "uie_ekg_signal2" ) )
	EKGCritical:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_ekg" ) )
	EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
	EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
	self:addElement( EKGCritical )
	self.EKGCritical = EKGCritical
	
	local EKGStable = LUI.UIImage.new()
	EKGStable:setLeftRight( true, false, 10.59, 182.42 )
	EKGStable:setTopBottom( true, false, 8.33, 44.34 )
	EKGStable:setRGB( 1, 0.06, 0 )
	EKGStable:setZoom( 39 )
	EKGStable:setImage( RegisterImage( "uie_ekg_signal" ) )
	EKGStable:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_ekg" ) )
	EKGStable:setShaderVector( 0, 1.33, 7.57, 1.58, 0.6 )
	EKGStable:setShaderVector( 1, 1.01, 2, -0.32, 0 )
	self:addElement( EKGStable )
	self.EKGStable = EKGStable
	
	local Grid1 = LUI.UIImage.new()
	Grid1:setLeftRight( true, false, 3.92, 190.42 )
	Grid1:setTopBottom( true, false, 3.67, 66.67 )
	Grid1:setRGB( 0, 0, 0 )
	Grid1:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_grid" ) )
	self:addElement( Grid1 )
	self.Grid1 = Grid1
	
	local Grid2 = LUI.UIImage.new()
	Grid2:setLeftRight( true, false, 6.59, 193.08 )
	Grid2:setTopBottom( true, false, 3.67, 66.67 )
	Grid2:setRGB( 0, 0, 0 )
	Grid2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_grid" ) )
	self:addElement( Grid2 )
	self.Grid2 = Grid2
	
	local SideMaskL = LUI.UIImage.new()
	SideMaskL:setLeftRight( true, false, 3.92, 41.84 )
	SideMaskL:setTopBottom( true, false, 3.67, 66.67 )
	SideMaskL:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( SideMaskL )
	self.SideMaskL = SideMaskL
	
	local SideMaskR = LUI.UIImage.new()
	SideMaskR:setLeftRight( true, false, 193.08, 156 )
	SideMaskR:setTopBottom( true, false, 3.67, 66.67 )
	SideMaskR:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( SideMaskR )
	self.SideMaskR = SideMaskR
	
	local EKG2 = LUI.UIImage.new()
	EKG2:setLeftRight( true, false, 9.84, 190.42 )
	EKG2:setTopBottom( true, false, 21.84, 35.17 )
	EKG2:setRGB( 0.75, 0, 0 )
	EKG2:setZoom( 10 )
	EKG2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_ekggraph" ) )
	EKG2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EKG2:setShaderVector( 0, 1, 1, 0, 0 )
	EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
	self:addElement( EKG2 )
	self.EKG2 = EKG2
	
	local EKG3 = LUI.UIImage.new()
	EKG3:setLeftRight( true, false, 12.84, 190.42 )
	EKG3:setTopBottom( true, false, 17.84, 25.84 )
	EKG3:setRGB( 1, 0, 0 )
	EKG3:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_ekggraph2" ) )
	EKG3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EKG3:setShaderVector( 0, 1, 1, 0, 0 )
	EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( EKG3 )
	self.EKG3 = EKG3
	
	local EKGBlur = LUI.UIImage.new()
	EKGBlur:setLeftRight( true, false, 6.59, 190.42 )
	EKGBlur:setTopBottom( true, false, 0, 67 )
	EKGBlur:setRGB( 0.24, 0, 0 )
	EKGBlur:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_ekggraph" ) )
	EKGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EKGBlur:setShaderVector( 0, 0, 1, 0, 0 )
	EKGBlur:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( EKGBlur )
	self.EKGBlur = EKGBlur
	
	local EKG4 = LUI.UIImage.new()
	EKG4:setLeftRight( true, false, 12.84, 190.42 )
	EKG4:setTopBottom( true, false, 40.34, 48.34 )
	EKG4:setRGB( 0.54, 0, 0 )
	EKG4:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_ekggraph2" ) )
	EKG4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EKG4:setShaderVector( 0, 1, 1, 0, 0 )
	EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( EKG4 )
	self.EKG4 = EKG4
	
	local SideMaskR2 = LUI.UIImage.new()
	SideMaskR2:setLeftRight( true, false, 193.08, 152.84 )
	SideMaskR2:setTopBottom( true, false, 3.67, 66.67 )
	SideMaskR2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( SideMaskR2 )
	self.SideMaskR2 = SideMaskR2
	
	local SideMaskL2 = LUI.UIImage.new()
	SideMaskL2:setLeftRight( true, false, 0, 37.76 )
	SideMaskL2:setTopBottom( true, false, 3.67, 66.67 )
	SideMaskL2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( SideMaskL2 )
	self.SideMaskL2 = SideMaskL2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
