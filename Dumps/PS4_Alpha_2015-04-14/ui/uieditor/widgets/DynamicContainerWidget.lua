local PostLoadFunc = function ( self )
	self.close = function ( self )
		local child = self:getFirstChild()
		while child ~= nil do
			local nextChild = child:getNextSibling()
			child:close()
			child = nextChild
		end
		LUI.UIElement.close( self )
	end
	
end

CoD.DynamicContainerWidget = InheritFrom( LUI.UIElement )
CoD.DynamicContainerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DynamicContainerWidget )
	self.id = "DynamicContainerWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

