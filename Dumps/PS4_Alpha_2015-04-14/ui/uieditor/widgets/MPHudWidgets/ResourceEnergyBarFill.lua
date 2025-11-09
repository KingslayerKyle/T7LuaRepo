require( "ui.uieditor.widgets.MPHudWidgets.ResourceEnergyBarLine" )

CoD.ResourceEnergyBarFill = InheritFrom( LUI.UIElement )
CoD.ResourceEnergyBarFill.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ResourceEnergyBarFill )
	self.id = "ResourceEnergyBarFill"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 18 )
	
	local ResourceEnergyBarLine = CoD.ResourceEnergyBarLine.new( menu, controller )
	ResourceEnergyBarLine:setLeftRight( true, true, 0, 0 )
	ResourceEnergyBarLine:setTopBottom( true, false, 0, 18 )
	self:addElement( ResourceEnergyBarLine )
	self.ResourceEnergyBarLine = ResourceEnergyBarLine
	
	self.close = function ( self )
		self.ResourceEnergyBarLine:close()
		CoD.ResourceEnergyBarFill.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

