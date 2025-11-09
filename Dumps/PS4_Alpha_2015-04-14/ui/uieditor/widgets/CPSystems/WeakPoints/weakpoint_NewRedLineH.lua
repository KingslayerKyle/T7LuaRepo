CoD.weakpoint_NewRedLineH = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewRedLineH.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.weakpoint_NewRedLineH )
	self.id = "weakpoint_NewRedLineH"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 8 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -1224.5, 1224.5 )
	Image0:setTopBottom( false, false, -4, 4 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newreddash" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image0:setShaderVector( 0, 300, 1, 0, 0 )
	Image0:setShaderVector( 1, 6.02, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

