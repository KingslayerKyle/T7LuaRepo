CoD.GenericUpdateBarWithLink = InheritFrom( LUI.UIElement )
CoD.GenericUpdateBarWithLink.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericUpdateBarWithLink )
	self.id = "GenericUpdateBarWithLink"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local barImage = LUI.UIImage.new()
	barImage:setLeftRight( 0, 1, 0, 0 )
	barImage:setTopBottom( 0, 1, 0, 0 )
	barImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	barImage:setShaderVector( 0, 1, 0, 0, 0 )
	barImage:setShaderVector( 1, 0, 0, 0, 0 )
	barImage:setShaderVector( 2, 1, 0, 0, 0 )
	barImage:setShaderVector( 3, 0, 0, 0, 0 )
	barImage:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( barImage )
	self.barImage = barImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

