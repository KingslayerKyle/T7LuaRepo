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
	desc:setTTF( "fonts/Entovo.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( desc, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( desc )
	self.desc = desc
	
	self.close = function ( self )
		self.framelabelbg:close()
		CoD.cac_wildcardwarningtext.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

