-- e2aefdfbe9d8e0263b08ee0ea76a1947
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 429 )
	self:setTopBottom( true, false, 0, 16 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local TxtLegal = LUI.UIText.new()
	TxtLegal:setLeftRight( true, false, 3, 426 )
	TxtLegal:setTopBottom( true, false, 0, 16 )
	TxtLegal:setText( Engine.Localize( "MOTD_LEGAL" ) )
	TxtLegal:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TxtLegal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TxtLegal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( TxtLegal, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( TxtLegal )
	self.TxtLegal = TxtLegal
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

