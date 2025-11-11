LUI.UIRoot = {}
local LUI_UIRoot_MouseEvent = function ( self, event )
	if not event.ignoreProjection then
		event.x, event.y = ProjectRootCoordinate( event.rootName, event.x, event.y )
		event.ignoreProjection = true
	end
	event.highestFocusInteresction = nil
	event.inCurrentFocusElem = false
	event.highestFocusInteresction = {
		perc = 0
	}
	if LUI.currentMouseFocus then
		if IsLuaCodeVersionAtLeast( 27 ) then
			local insidePercent = Engine.GetCircleInsideElement( event.controller, LUI.currentMouseFocus, event.rootName, event.x, event.y )
			if insidePercent >= 0.5 then
				return 
			end
			event.inCurrentFocusElem = insidePercent > 0
			if event.inCurrentFocusElem then
				event.highestFocusInteresction = {
					elem = LUI.currentMouseFocus,
					perc = insidePercent
				}
			end
		elseif Engine.IsMouseInsideElement( event.controller, LUI.currentMouseFocus, event.rootName, event.x, event.y ) then
			return 
		end
	end
	event.root = self
	self:dispatchEventToChildren( event )
end

local LUI_UIRoot_HandleMouseButton = function ( self, event )
	if not event.ignoreProjection then
		event.x, event.y = ProjectRootCoordinate( event.rootName, event.x, event.y )
		event.ignoreProjection = true
	end
	if LUI.currentMouseFocus and LUI.currentMouseFocus:processEvent( event ) then
		return true
	else
		return self:dispatchEventToChildren( event )
	end
end

local LUI_UIRoot_ControllerChanged = function ( self, event )
	self:setLayoutCached( false )
	self:dispatchEventToChildren( event )
end

local LUI_UIRoot_AddMenu = function ( self, event )
	Engine.GCStop()
	if event.uiMenuCommand == Enum.uiMenuCommand_t.UIMENU_NEWLOBBY and CoDShared.IsDirectorEnabled() then
		event.menu = "Director"
	end
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
	Engine.GCRestart()
	return true
end

LUI.UIRoot.new = function ( name, controllerIndex )
	local root = LUI.UIElement.new( 0.5, 0.5, 0, 0, 0.5, 0.5, 0, 0 )
	root.id = "LUIRoot"
	root:registerEventHandler( "addmenu", LUI_UIRoot_AddMenu )
	root:registerEventHandler( "mousemove", LUI_UIRoot_MouseEvent )
	root:registerEventHandler( "mousedown", LUI_UIRoot_HandleMouseButton )
	root:registerEventHandler( "mouseup", LUI_UIRoot_HandleMouseButton )
	root:registerEventHandler( "controller_changed", LUI_UIRoot_ControllerChanged )
	root.name = name
	root:setRoot()
	LUI.roots[name] = root
	return root
end

