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
	self:setLeftRight( true, false, 0, 117 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0, 117 )
	Label0:setTopBottom( true, false, 0, 32 )
	Label0:setRGB( 0.58, 0.64, 0.65 )
	Label0:setText( Engine.Localize( "LEVEL 53" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

