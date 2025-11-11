CoD.AARMedalsListWidget = InheritFrom( LUI.UIElement )
CoD.AARMedalsListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AARMedalsListWidget )
	self.id = "AARMedalsListWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 112 )
	
	local medalIcon = LUI.UIImage.new()
	medalIcon:setLeftRight( 0, 0, 0, 112 )
	medalIcon:setTopBottom( 0, 1, 0, 0 )
	self:addElement( medalIcon )
	self.medalIcon = medalIcon
	
	local medalNameLabel = LUI.UITightText.new()
	medalNameLabel:setLeftRight( 0, 0, 127, 184 )
	medalNameLabel:setTopBottom( 0, 1, 41.5, -34.5 )
	medalNameLabel:setText( Engine.Localize( "MPUI_KILLER" ) )
	medalNameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( medalNameLabel )
	self.medalNameLabel = medalNameLabel
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

