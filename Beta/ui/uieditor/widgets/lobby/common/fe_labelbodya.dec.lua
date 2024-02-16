CoD.FE_LabelBodyA = InheritFrom( LUI.UIElement )
CoD.FE_LabelBodyA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LabelBodyA )
	self.id = "FE_LabelBodyA"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 158 )
	self:setTopBottom( true, false, 0, 17 )
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 352 )
	TextBox0:setTopBottom( true, true, 0, 0 )
	TextBox0:setRGB( 0.65, 0.97, 1 )
	TextBox0:setText( Engine.Localize( "3 Playing" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setLetterSpacing( 0.5 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

