-- 88bff112cc4d9f7c16a513458ef89fd1
-- This hash is used for caching, delete to decompile the file again

CoD.HorizontalCompassGroupMPContainer = InheritFrom( LUI.UIElement )
CoD.HorizontalCompassGroupMPContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HorizontalCompassGroupMPContainer )
	self.id = "HorizontalCompassGroupMPContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 268 )
	self:setTopBottom( true, false, 0, 38 )
	
	local HorizontalCompass = LUI.UIImage.new()
	HorizontalCompass:setLeftRight( true, true, 13.5, -13.5 )
	HorizontalCompass:setTopBottom( false, true, -28.5, -12.5 )
	HorizontalCompass:setupHorizontalCompass( 0.75 )
	HorizontalCompass:setImage( RegisterMaterial( "hud_horizontal_compass_minimap_t7" ) )
	HorizontalCompass:setShaderVector( 0, 0.6, 0, 0, 0 )
	self:addElement( HorizontalCompass )
	self.HorizontalCompass = HorizontalCompass
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

