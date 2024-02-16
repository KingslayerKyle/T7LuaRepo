LUI.UIRoot = {}
local LUI_UIRoot_Resize = function ( self, event )
	local defaultAnimationState = {
		left = -event.width / 2,
		top = -event.height / 2,
		right = event.width / 2,
		bottom = event.height / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	}
	self:registerAnimationState( "default", defaultAnimationState )
	self:animateToState( "default" )
end

local LUI_UIRoot_MouseEvent = function ( self, event )
	event.root = self
	self:dispatchEventToChildren( event )
end

local LUI_UIRoot_ControllerChanged = function ( self, event )
	self:setLayoutCached( false )
	self:dispatchEventToChildren( event )
end

local LUI_UIRoot_AddMenu = function ( self, event )
	local menuCreationFunction = LUI.createMenu[event.menu]
	if menuCreationFunction then
		local newMenu = menuCreationFunction( event.controller )
		self:addElement( newMenu )
		newMenu:processEvent( {
			name = "menu_opened",
			controller = event.controller
		} )
	else
		error( "LUI Error: Tried to add nonexistent menu " .. event.menu )
	end
	return true
end

local LUI_UIRoot_UnitsToPixelsRect = function ( self, unitsRect )
	local currentAnimationState = self.m_currentAnimationState
	local unitsToPixels = currentAnimationState.unitsToPixels
	local left = currentAnimationState.left + unitsRect.left * unitsToPixels
	local top = currentAnimationState.top + unitsRect.top * unitsToPixels
	local right = currentAnimationState.left + unitsRect.right * unitsToPixels
	local bottom = currentAnimationState.top + unitsRect.bottom * unitsToPixels
	return left, top, right, bottom
end

local LUI_UIRoot_UnitsToPixels = function ( self, units )
	return units * self.m_currentAnimationState.unitsToPixels
end

local LUI_UIRoot_PixelsToUnits = function ( self, pixelX, pixelY )
	return self:RootPixelsToUnits( pixelX, pixelY )
end

LUI.UIRoot.new = function ( name )
	local root = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	root.id = "LUIRoot"
	root.unitsToPixelsRect = LUI_UIRoot_UnitsToPixelsRect
	root.pixelsToUnits = LUI_UIRoot_PixelsToUnits
	root.unitsToPixels = LUI_UIRoot_UnitsToPixels
	root:registerEventHandler( "resize", LUI_UIRoot_Resize )
	root:registerEventHandler( "addmenu", LUI_UIRoot_AddMenu )
	root:registerEventHandler( "mousemove", LUI_UIRoot_MouseEvent )
	root:registerEventHandler( "mousedown", LUI_UIRoot_MouseEvent )
	root:registerEventHandler( "mouseup", LUI_UIRoot_MouseEvent )
	root:registerEventHandler( "controller_changed", LUI_UIRoot_ControllerChanged )
	root.name = name
	root:setRoot()
	LUI.roots[name] = root
	return root
end

