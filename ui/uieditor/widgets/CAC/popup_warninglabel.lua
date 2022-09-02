-- 38d648c8c3ef437d0b6cd712844d09ed
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 741 )
	self:setTopBottom( true, false, 0, 36 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.89, 0.31, 0.07 )
	background:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	background:setShaderVector( 0, 0.01, 0.12, 0, 0 )
	background:setupNineSliceShader( 4, 4 )
	self:addElement( background )
	self.background = background
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( true, false, 10, 682 )
	menudescription:setTopBottom( true, false, 9, 29 )
	menudescription:setRGB( 0.97, 0.32, 0.05 )
	menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	menudescription:setTTF( "fonts/escom.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( menudescription, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local cac2lines0 = CoD.cac_2lines.new( menu, controller )
	cac2lines0:setLeftRight( true, false, -44, -8 )
	cac2lines0:setTopBottom( false, false, -19, 18 )
	cac2lines0:setRGB( 0.89, 0.31, 0.07 )
	self:addElement( cac2lines0 )
	self.cac2lines0 = cac2lines0
	
	local cac2linesRight = CoD.cac_2lines.new( menu, controller )
	cac2linesRight:setLeftRight( false, true, 8, 44 )
	cac2linesRight:setTopBottom( false, false, 0, 0 )
	cac2linesRight:setRGB( 0.89, 0.31, 0.07 )
	cac2linesRight:setZRot( 180 )
	self:addElement( cac2linesRight )
	self.cac2linesRight = cac2linesRight
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cac2lines0:close()
		element.cac2linesRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

