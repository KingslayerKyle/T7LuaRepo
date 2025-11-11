require( "ui.uieditor.widgets.CAC.frame_labelbg" )

CoD.cac_wildcardwarningtext = InheritFrom( LUI.UIElement )
CoD.cac_wildcardwarningtext.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_wildcardwarningtext )
	self.id = "cac_wildcardwarningtext"
	self.soundSet = "CAC_Overcapacity"
	self:setLeftRight( 0, 0, 0, 904 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local framelabelbg = CoD.frame_labelbg.new( menu, controller )
	framelabelbg:setLeftRight( 0, 1, 0, 58 )
	framelabelbg:setTopBottom( 0, 1, 0, 0 )
	framelabelbg:setRGB( 0.89, 0.31, 0.08 )
	self:addElement( framelabelbg )
	self.framelabelbg = framelabelbg
	
	local desc = LUI.UITightText.new()
	desc:setLeftRight( 0, 0, 18, 963 )
	desc:setTopBottom( 0, 0, 13, 43 )
	desc:setRGB( 0.97, 0.32, 0.05 )
	desc:setText( Engine.Localize( "TOO EQUIP PRIMARY GUNFIGHTER, CHOOSE A WILDCARD TO SWAP" ) )
	desc:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( desc, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( desc )
	self.desc = desc
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.framelabelbg:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

