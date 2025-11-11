CoD.StartMenu_ImageContainer = InheritFrom( LUI.UIElement )
CoD.StartMenu_ImageContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_ImageContainer )
	self.id = "StartMenu_ImageContainer"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 445 )
	self:setTopBottom( 0, 0, 0, 205 )
	
	local ImageContainer = LUI.UIImage.new()
	ImageContainer:setLeftRight( 0, 1, 0, 0 )
	ImageContainer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

