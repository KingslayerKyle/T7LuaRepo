require( "ui.uieditor.widgets.CAC.frame_labelbg" )

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
	self:setLeftRight( true, false, 0, 660 )
	self:setTopBottom( true, false, 0, 35 )
	
	local framelabelbg = CoD.frame_labelbg.new( menu, controller )
	framelabelbg:setLeftRight( true, true, 0, 37 )
	framelabelbg:setTopBottom( true, false, -1, 35 )
	framelabelbg:setRGB( 0.89, 0.31, 0.07 )
	self:addElement( framelabelbg )
	self.framelabelbg = framelabelbg
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( true, false, 13, 685 )
	menudescription:setTopBottom( true, false, 8, 28 )
	menudescription:setRGB( 0.97, 0.32, 0.05 )
	menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	menudescription:setTTF( "fonts/Entovo.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( menudescription, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	self.close = function ( self )
		self.framelabelbg:close()
		CoD.popup_warninglabel.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

