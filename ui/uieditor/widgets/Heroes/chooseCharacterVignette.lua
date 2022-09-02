-- 93468fee178795718c1627ad86bc698b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	
	local bottomRight = LUI.UIImage.new()
	bottomRight:setLeftRight( false, true, -408, 0 )
	bottomRight:setTopBottom( false, true, -250, 0 )
	bottomRight:setAlpha( 0.5 )
	bottomRight:setYRot( -180 )
	bottomRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	bottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( bottomRight )
	self.bottomRight = bottomRight
	
	local topRight = LUI.UIImage.new()
	topRight:setLeftRight( false, true, -408, 0 )
	topRight:setTopBottom( false, true, -500, -250 )
	topRight:setAlpha( 0.5 )
	topRight:setXRot( 180 )
	topRight:setYRot( -180 )
	topRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	topRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( topRight )
	self.topRight = topRight
	
	local bottomLeft = LUI.UIImage.new()
	bottomLeft:setLeftRight( false, true, -816, -408 )
	bottomLeft:setTopBottom( false, true, -250, 0 )
	bottomLeft:setAlpha( 0.5 )
	bottomLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	bottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( bottomLeft )
	self.bottomLeft = bottomLeft
	
	local topLeft = LUI.UIImage.new()
	topLeft:setLeftRight( false, true, -816, -408 )
	topLeft:setTopBottom( false, true, -500, -250 )
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

