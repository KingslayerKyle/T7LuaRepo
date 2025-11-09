CoD.ResourceEnergyBarLine = InheritFrom( LUI.UIElement )
CoD.ResourceEnergyBarLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ResourceEnergyBarLine )
	self.id = "ResourceEnergyBarLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 18 )
	
	local resourceEnergyBarLine = LUI.UIImage.new()
	resourceEnergyBarLine:setLeftRight( true, true, 3, -3 )
	resourceEnergyBarLine:setTopBottom( false, false, -6, 6 )
	resourceEnergyBarLine:setRGB( 1, 1, 1 )
	resourceEnergyBarLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( resourceEnergyBarLine )
	self.resourceEnergyBarLine = resourceEnergyBarLine
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

