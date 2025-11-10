LUI.UIMouseCursor = {}
LUI.UIMouseCursor.priority = 1000
local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1 = ProjectRootCoordinate( f1_arg1.rootName, f1_arg1.x, f1_arg1.y )
	if f1_local0 ~= nil and f1_local1 ~= nil then
		local f1_local2 = f1_arg1.root
		if not f1_local2 then
			f1_local2 = LUI.roots[f1_arg1.rootName]
		end
		f1_local0, f1_local1 = f1_local2:pixelsToUnits( f1_local0, f1_local1 )
		if f1_local0 ~= nil and f1_local1 ~= nil then
			local f1_local3 = f1_arg0.size / 2
			f1_arg0:beginAnimation( "default" )
			f1_arg0:setLeftRight( true, false, f1_local0 - f1_local3, f1_local0 + f1_local3 )
			f1_arg0:setTopBottom( true, false, f1_local1 - f1_local3, f1_local1 + f1_local3 )
		end
	end
	f1_arg0:dispatchEventToChildren( f1_arg1 )
end

LUI.UIMouseCursor.new = function ( f2_arg0 )
	local self = LUI.UIImage.new( f2_arg0 )
	self:setPriority( LUI.UIMouseCursor.priority )
	self:registerEventHandler( "mousemove", f0_local0 )
	if CoD.isWIIU then
		self:registerEventHandler( "touchpad_move", f0_local0 )
		self.size = 128
	else
		self.size = 64
	end
	return self
end

