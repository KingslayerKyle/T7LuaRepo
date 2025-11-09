CoD.CallingCards_zmhd_master = InheritFrom( LUI.UIElement )
CoD.CallingCards_zmhd_master.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_zmhd_master )
	self.id = "CallingCards_zmhd_master"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_zmhd_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ember = LUI.UIImage.new()
	ember:setLeftRight( true, false, -77.5, 557.5 )
	ember:setTopBottom( true, false, 0, 158.75 )
	ember:setAlpha( 0.55 )
	ember:setImage( RegisterImage( "uie_t7_callingcard_zmhd_ember" ) )
	ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ember:setShaderVector( 0, 1, 1, 0, 0 )
	ember:setShaderVector( 1, 0.1, 0, 0, 0 )
	self:addElement( ember )
	self.ember = ember
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( true, false, -77.5, 557.5 )
	smoke:setTopBottom( true, false, -19.38, 139.38 )
	smoke:setAlpha( 0.55 )
	smoke:setImage( RegisterImage( "uie_t7_callingcard_zmhd_smoke" ) )
	smoke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	smoke:setShaderVector( 0, 1, 1, 0, 0 )
	smoke:setShaderVector( 1, 0.1, 0, 0, 0 )
	self:addElement( smoke )
	self.smoke = smoke
	
	local smoke0 = LUI.UIImage.new()
	smoke0:setLeftRight( true, false, -94.5, 1100.5 )
	smoke0:setTopBottom( true, false, -126.38, 172.38 )
	smoke0:setAlpha( 0.55 )
	smoke0:setImage( RegisterImage( "uie_t7_callingcard_zmhd_smoke" ) )
	smoke0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	smoke0:setShaderVector( 0, 1, 1, 0, 0 )
	smoke0:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( smoke0 )
	self.smoke0 = smoke0
	
	local heads2 = LUI.UIImage.new()
	heads2:setLeftRight( true, false, 0, 480 )
	heads2:setTopBottom( true, false, 0, 120 )
	heads2:setImage( RegisterImage( "uie_t7_callingcard_zmhd_heads" ) )
	self:addElement( heads2 )
	self.heads2 = heads2
	
	local EMBER2c = LUI.UIImage.new()
	EMBER2c:setLeftRight( true, false, 240, 720 )
	EMBER2c:setTopBottom( true, false, -238, 422 )
	EMBER2c:setAlpha( 0.3 )
	EMBER2c:setYRot( 1 )
	EMBER2c:setZRot( 90 )
	EMBER2c:setScale( 0.7 )
	EMBER2c:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c:setShaderVector( 1, 0, 0.04, 0, 0 )
	self:addElement( EMBER2c )
	self.EMBER2c = EMBER2c
	
	local EMBER2b = LUI.UIImage.new()
	EMBER2b:setLeftRight( true, false, -141, 339 )
	EMBER2b:setTopBottom( true, false, -238, 422 )
	EMBER2b:setAlpha( 0.4 )
	EMBER2b:setYRot( 1 )
	EMBER2b:setZRot( 90 )
	EMBER2b:setScale( 0.7 )
	EMBER2b:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2b:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2b:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2b:setShaderVector( 1, 0, 0.03, 0, 0 )
	self:addElement( EMBER2b )
	self.EMBER2b = EMBER2b
	
	local EMBER2 = LUI.UIImage.new()
	EMBER2:setLeftRight( true, false, 0, 480 )
	EMBER2:setTopBottom( true, false, -263, 397 )
	EMBER2:setYRot( 1 )
	EMBER2:setZRot( 90 )
	EMBER2:setImage( RegisterImage( "uie_callingcards_cwl_ember2" ) )
	EMBER2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2:setShaderVector( 1, 0, 0.05, 0, 0 )
	self:addElement( EMBER2 )
	self.EMBER2 = EMBER2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

