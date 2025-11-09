local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.close = function ( f2_arg0 )
		local f2_local0 = f2_arg0:getFirstChild()
		while f2_local0 ~= nil do
			local f2_local1 = f2_local0:getNextSibling()
			f2_local0:close()
			f2_local0 = f2_local1
		end
		LUI.UIElement.close( f2_arg0 )
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

