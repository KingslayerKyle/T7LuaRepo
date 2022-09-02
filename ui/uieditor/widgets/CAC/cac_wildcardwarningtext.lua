-- 1952902422fd8764c85e40638c5e2f61
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 603 )
	self:setTopBottom( true, false, 0, 36 )
	
	local framelabelbg = CoD.frame_labelbg.new( menu, controller )
	framelabelbg:setLeftRight( true, true, 0, 39 )
	framelabelbg:setTopBottom( true, true, 0, 0 )
	framelabelbg:setRGB( 0.89, 0.31, 0.08 )
	self:addElement( framelabelbg )
	self.framelabelbg = framelabelbg
	
	local desc = LUI.UITightText.new()
	desc:setLeftRight( true, false, 12, 642 )
	desc:setTopBottom( true, false, 9, 29 )
	desc:setRGB( 0.97, 0.32, 0.05 )
	desc:setText( Engine.Localize( "TOO EQUIP PRIMARY GUNFIGHTER, CHOOSE A WILDCARD TO SWAP" ) )
	desc:setTTF( "fonts/escom.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( desc, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( desc )
	self.desc = desc
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.framelabelbg:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

