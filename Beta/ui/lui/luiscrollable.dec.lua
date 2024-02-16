LUI.UIScrollable = {}
local LUI_UIScrollable_AddElement = function ( self, childElement )
	self.container:addElement( childElement )
end

local LUI_UIScrollable_ScrollX = function ( self, xPos, duration, easeIn, easeOut )
	self.container:registerAnimationState( "scroll_target", {
		left = xPos,
		right = xPos + self.containerWidth,
		leftAnchor = true
	} )
	self.container:animateToState( "scroll_target", duration, easeIn, easeOut )
end

local LUI_UIScrollable_ScrollY = function ( self, yPos, duration, easeIn, easeOut )
	local viewableHeight = self:getHeight()
	if yPos > 0 then
		yPos = 0
	elseif yPos < -self.containerHeight + viewableHeight then
		yPos = -self.containerHeight + viewableHeight
	end
	self.container:registerAnimationState( "scroll_target", {
		top = yPos,
		bottom = yPos + self.containerHeight,
		topAnchor = true,
		bottomAnchor = false
	} )
	self.container:animateToState( "scroll_target", duration, easeIn, easeOut )
end

LUI.UIScrollable.new = function ( defaultAnimationState, containerWidth, containerHeight, centered )
	if containerWidth == nil or containerHeight == nil then
		error( "Cannot create scrollable component without valid dimensions!" )
		return 
	end
	local scrollable = LUI.UIElement.new( defaultAnimationState )
	scrollable.id = "LUIScrollable"
	scrollable:setHandleMouse( true )
	if centered == true then
		scrollable.container = LUI.UIElement.new( {
			left = -containerWidth / 2,
			top = -containerHeight / 2,
			right = containerWidth / 2,
			bottom = containerHeight / 2,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			zoom = 0
		} )
	else
		scrollable.container = LUI.UIElement.new( {
			left = 0,
			top = 0,
			right = containerWidth,
			bottom = containerHeight,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			zoom = 0
		} )
	end
	scrollable.container.id = "LUIScrollable_Container"
	scrollable:setUseStencil( true )
	scrollable.containerWidth = containerWidth
	scrollable.containerHeight = containerHeight
	scrollable:addElement( scrollable.container )
	scrollable.addElement = LUI_UIScrollable_AddElement
	scrollable.scrollX = LUI_UIScrollable_ScrollX
	scrollable.scrollY = LUI_UIScrollable_ScrollY
	return scrollable
end

