require( "ui.uieditor.widgets.CAC.frame_labelbg" )
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
	
	local framelabelbg = CoD.frame_labelbg.new( menu, controller )
	framelabelbg:setLeftRight( true, false, 44, 741 )
	framelabelbg:setTopBottom( true, false, 0, 36 )
	framelabelbg:setRGB( 0.89, 0.31, 0.07 )
	self:addElement( framelabelbg )
	self.framelabelbg = framelabelbg
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( true, false, 57, 729 )
	menudescription:setTopBottom( true, false, 9, 29 )
	menudescription:setRGB( 0.97, 0.32, 0.05 )
	menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	menudescription:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( menudescription, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local cac2lines0 = CoD.cac_2lines.new( menu, controller )
	cac2lines0:setLeftRight( true, false, 0, 36 )
	cac2lines0:setTopBottom( false, false, -19, 18 )
	cac2lines0:setRGB( 0.89, 0.31, 0.07 )
	self:addElement( cac2lines0 )
	self.cac2lines0 = cac2lines0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.framelabelbg:close()
		element.cac2lines0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

