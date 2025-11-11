CoD.MOTD_Legal = InheritFrom( LUI.UIElement )
CoD.MOTD_Legal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MOTD_Legal )
	self.id = "MOTD_Legal"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 643 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 0, 0 )
	black:setTopBottom( 0, 1, 0, 0 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local TxtLegal = LUI.UIText.new()
	TxtLegal:setLeftRight( 0, 0, 5, 639 )
	TxtLegal:setTopBottom( 0, 0, 0, 24 )
	TxtLegal:setText( Engine.Localize( "MOTD_LEGAL" ) )
	TxtLegal:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TxtLegal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TxtLegal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( TxtLegal, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( TxtLegal )
	self.TxtLegal = TxtLegal
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

