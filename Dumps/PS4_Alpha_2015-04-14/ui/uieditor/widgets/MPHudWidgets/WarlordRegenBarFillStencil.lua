require( "ui.uieditor.widgets.MPHudWidgets.WarlordArmorRegenBarFill" )

CoD.WarlordRegenBarFillStencil = InheritFrom( LUI.UIElement )
CoD.WarlordRegenBarFillStencil.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.WarlordRegenBarFillStencil )
	self.id = "WarlordRegenBarFillStencil"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 18 )
	
	local WarlordArmorRegenBarFill = CoD.WarlordArmorRegenBarFill.new( menu, controller )
	WarlordArmorRegenBarFill:setLeftRight( true, false, 0, 100 )
	WarlordArmorRegenBarFill:setTopBottom( true, false, 0, 18 )
	WarlordArmorRegenBarFill:setRGB( 1, 1, 1 )
	self:addElement( WarlordArmorRegenBarFill )
	self.WarlordArmorRegenBarFill = WarlordArmorRegenBarFill
	
	self.close = function ( self )
		self.WarlordArmorRegenBarFill:close()
		CoD.WarlordRegenBarFillStencil.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

