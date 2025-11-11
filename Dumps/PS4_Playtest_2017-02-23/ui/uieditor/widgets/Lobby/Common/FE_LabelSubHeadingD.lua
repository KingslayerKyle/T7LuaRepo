CoD.FE_LabelSubHeadingD = InheritFrom( LUI.UIElement )
CoD.FE_LabelSubHeadingD.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LabelSubHeadingD )
	self.id = "FE_LabelSubHeadingD"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 183 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 0, 183 )
	Label0:setTopBottom( 0, 0, 4, 43 )
	Label0:setText( Engine.Localize( "LEVEL 999" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

