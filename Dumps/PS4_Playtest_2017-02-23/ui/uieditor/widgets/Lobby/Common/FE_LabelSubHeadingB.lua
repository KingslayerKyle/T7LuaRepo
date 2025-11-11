CoD.FE_LabelSubHeadingB = InheritFrom( LUI.UIElement )
CoD.FE_LabelSubHeadingB.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LabelSubHeadingB )
	self.id = "FE_LabelSubHeadingB"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 126 )
	self:setTopBottom( 0, 0, 0, 28 )
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( 0, 0, 0, 126 )
	Label1:setTopBottom( 0.5, 0.5, -12, 12 )
	Label1:setRGB( 0.58, 0.64, 0.65 )
	Label1:setText( Engine.Localize( "GAMES" ) )
	Label1:setTTF( "fonts/escom.ttf" )
	Label1:setLetterSpacing( 1 )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

