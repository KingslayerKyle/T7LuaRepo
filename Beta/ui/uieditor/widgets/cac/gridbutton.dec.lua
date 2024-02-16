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
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 153 )
	
	local buttonImage = LUI.UIImage.new()
	buttonImage:setLeftRight( true, false, 0, 128 )
	buttonImage:setTopBottom( true, false, 25, 153 )
	self:addElement( buttonImage )
	self.buttonImage = buttonImage
	
	local buttonName = LUI.UITightText.new()
	buttonName:setLeftRight( true, false, 0, 30 )
	buttonName:setTopBottom( true, false, 0, 25 )
	buttonName:setText( Engine.Localize( "MENU_NEW" ) )
	buttonName:setTTF( "fonts/default.ttf" )
	self:addElement( buttonName )
	self.buttonName = buttonName
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

