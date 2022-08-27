-- 1cfa7e582f98bb1735862c79c493b9f8
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 100 )
	
	local barImage = LUI.UIImage.new()
	barImage:setLeftRight( true, true, 0, 0 )
	barImage:setTopBottom( true, true, 0, 0 )
	barImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	barImage:setShaderVector( 0, 1, 0, 0, 0 )
	barImage:setShaderVector( 1, 0, 0, 0, 0 )
	barImage:setShaderVector( 2, 1, 0, 0, 0 )
	barImage:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( barImage )
	self.barImage = barImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

