CoD.GadgetIconFill = InheritFrom( LUI.UIElement )
CoD.GadgetIconFill.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GadgetIconFill )
	self.id = "GadgetIconFill"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local gadgetFillImage = LUI.UIImage.new()
	gadgetFillImage:setLeftRight( true, false, 0, 64 )
	gadgetFillImage:setTopBottom( false, true, -64, 0 )
	gadgetFillImage:setRGB( 1, 1, 1 )
	gadgetFillImage:setAlpha( 0.5 )
	gadgetFillImage:setImage( RegisterImage( "uie_menu_gadget_armor_64" ) )
	gadgetFillImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( gadgetFillImage )
	self.gadgetFillImage = gadgetFillImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

