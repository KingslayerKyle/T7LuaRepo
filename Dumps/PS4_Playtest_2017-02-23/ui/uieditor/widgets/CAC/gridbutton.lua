CoD.GridButton = InheritFrom( LUI.UIElement )
CoD.GridButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridButton )
	self.id = "GridButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 192 )
	self:setTopBottom( 0, 0, 0, 229 )
	
	local buttonImage = LUI.UIImage.new()
	buttonImage:setLeftRight( 0, 0, 0, 192 )
	buttonImage:setTopBottom( 0, 0, 38, 230 )
	self:addElement( buttonImage )
	self.buttonImage = buttonImage
	
	local buttonName = LUI.UITightText.new()
	buttonName:setLeftRight( 0, 0, 0, 45 )
	buttonName:setTopBottom( 0, 0, 0, 38 )
	buttonName:setText( Engine.Localize( "MENU_NEW" ) )
	buttonName:setTTF( "fonts/default.ttf" )
	self:addElement( buttonName )
	self.buttonName = buttonName
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

