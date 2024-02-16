LUI.UIMouseCursor = {}
LUI.UIMouseCursor.priority = 1000
local LUI_UIMouseCursor_MouseMove = function ( self, event )
	local mouseX, mouseY = ProjectRootCoordinate( event.rootName, event.x, event.y )
	if mouseX ~= nil and mouseY ~= nil then
		local root = event.root
		if not root then
			root = LUI.roots[event.rootName]
		end
		mouseX, mouseY = root:pixelsToUnits( mouseX, mouseY )
		if mouseX ~= nil and mouseY ~= nil then
			local halfWidth = self.size / 2
			self:beginAnimation( "default" )
			self:setLeftRight( true, false, mouseX - halfWidth, mouseX + halfWidth )
			self:setTopBottom( true, false, mouseY - halfWidth, mouseY + halfWidth )
		end
	end
	self:dispatchEventToChildren( event )
end

LUI.UIMouseCursor.new = function ( defaultAnimationState )
	local cursor = LUI.UIImage.new( defaultAnimationState )
	cursor:setPriority( LUI.UIMouseCursor.priority )
	cursor:registerEventHandler( "mousemove", LUI_UIMouseCursor_MouseMove )
	if CoD.isWIIU then
		cursor:registerEventHandler( "touchpad_move", LUI_UIMouseCursor_MouseMove )
		cursor.size = 128
	else
		cursor.size = 64
	end
	return cursor
end

