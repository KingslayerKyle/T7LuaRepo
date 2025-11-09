CoD.CustomClassPlusSymbol = InheritFrom( LUI.UIElement )
CoD.CustomClassPlusSymbol.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomClassPlusSymbol )
	self.id = "CustomClassPlusSymbol"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -1, 1 )
	Image3:setTopBottom( false, false, -8, 8 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( false, false, -1, 1 )
	Image30:setTopBottom( false, false, -8, 8 )
	Image30:setRGB( 1, 1, 1 )
	Image30:setZRot( 90 )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

