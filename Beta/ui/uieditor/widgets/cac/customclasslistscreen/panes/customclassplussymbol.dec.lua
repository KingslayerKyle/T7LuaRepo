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
	Image3:setAlpha( 0 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( false, false, -1, 1 )
	Image30:setTopBottom( false, false, -8, 8 )
	Image30:setAlpha( 0 )
	Image30:setZRot( 90 )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local emptyLayerIcon = LUI.UIImage.new()
	emptyLayerIcon:setLeftRight( false, false, -12, 12 )
	emptyLayerIcon:setTopBottom( false, false, -12, 12 )
	emptyLayerIcon:setImage( RegisterImage( "uie_img_t7_menu_customclass_plus" ) )
	self:addElement( emptyLayerIcon )
	self.emptyLayerIcon = emptyLayerIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

