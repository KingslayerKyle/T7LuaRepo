require( "ui.uieditor.widgets.CAC.cac_2lines" )

CoD.popup_warninglabel = InheritFrom( LUI.UIElement )
CoD.popup_warninglabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.popup_warninglabel )
	self.id = "popup_warninglabel"
	self.soundSet = "CAC_Overcapacity"
	self:setLeftRight( 0, 0, 0, 1111 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0.89, 0.31, 0.07 )
	background:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	background:setShaderVector( 0, 0, 0, 0, 0 )
	background:setupNineSliceShader( 6, 6 )
	self:addElement( background )
	self.background = background
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( 0, 0, 15, 1023 )
	menudescription:setTopBottom( 0, 0, 13, 43 )
	menudescription:setRGB( 0.97, 0.32, 0.05 )
	menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	menudescription:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( menudescription, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local cac2lines0 = CoD.cac_2lines.new( menu, controller )
	cac2lines0:setLeftRight( 0, 0, -66, -12 )
	cac2lines0:setTopBottom( 0.5, 0.5, -29, 27 )
	cac2lines0:setRGB( 0.89, 0.31, 0.07 )
	self:addElement( cac2lines0 )
	self.cac2lines0 = cac2lines0
	
	local cac2linesRight = CoD.cac_2lines.new( menu, controller )
	cac2linesRight:setLeftRight( 1, 1, 12, 66 )
	cac2linesRight:setTopBottom( 0.5, 0.5, 0, 0 )
	cac2linesRight:setRGB( 0.89, 0.31, 0.07 )
	cac2linesRight:setZRot( 180 )
	self:addElement( cac2linesRight )
	self.cac2linesRight = cac2linesRight
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cac2lines0:close()
		self.cac2linesRight:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

