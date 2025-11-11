CoD.chooseCharacterVignette = InheritFrom( LUI.UIElement )
CoD.chooseCharacterVignette.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.chooseCharacterVignette )
	self.id = "chooseCharacterVignette"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1224 )
	self:setTopBottom( 0, 0, 0, 750 )
	
	local bottomRight = LUI.UIImage.new()
	bottomRight:setLeftRight( 1, 1, -612, 0 )
	bottomRight:setTopBottom( 1, 1, -375, 0 )
	bottomRight:setAlpha( 0.5 )
	bottomRight:setYRot( -180 )
	bottomRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	bottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( bottomRight )
	self.bottomRight = bottomRight
	
	local topRight = LUI.UIImage.new()
	topRight:setLeftRight( 1, 1, -612, 0 )
	topRight:setTopBottom( 1, 1, -750, -375 )
	topRight:setAlpha( 0.5 )
	topRight:setXRot( 180 )
	topRight:setYRot( -180 )
	topRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	topRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( topRight )
	self.topRight = topRight
	
	local bottomLeft = LUI.UIImage.new()
	bottomLeft:setLeftRight( 1, 1, -1224, -612 )
	bottomLeft:setTopBottom( 1, 1, -375, 0 )
	bottomLeft:setAlpha( 0.5 )
	bottomLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	bottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( bottomLeft )
	self.bottomLeft = bottomLeft
	
	local topLeft = LUI.UIImage.new()
	topLeft:setLeftRight( 1, 1, -1224, -612 )
	topLeft:setTopBottom( 1, 1, -750, -375 )
	topLeft:setAlpha( 0.5 )
	topLeft:setXRot( 180 )
	topLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	topLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( topLeft )
	self.topLeft = topLeft
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

