CoD.MouseScroller = {}
CoD.MouseScroller.ArrowMaterialName = "ui_scrollbar_arrow_up_a"
CoD.MouseScroller.ArrowExpansionSize = 8
CoD.MouseScroller.new = function ( defaultAnimationState, width, height )
	local mouseScroller = LUI.UIElement.new( defaultAnimationState )
	mouseScroller.id = "MouseScroller"
	mouseScroller.width = width
	mouseScroller.height = height
	mouseScroller.addUpDownScroller = CoD.MouseScroller.AddUpDownScroller
	mouseScroller.addLeftRightScroller = CoD.MouseScroller.AddLeftRightScroller
	return mouseScroller
end

CoD.MouseScroller.AddUpDownScroller = function ( mouseScroller )
	local upArrowButton = CoD.MouseScroller.CreateScrollArrowButton()
	upArrowButton:setActionEventName( "mouse_scroller_up" )
	upArrowButton:setLeftRight( true, true, 0, 0 )
	upArrowButton:setTopBottom( true, false, 0, mouseScroller.height / 2 - 5 )
	mouseScroller:addElement( upArrowButton )
	local downArrowButton = CoD.MouseScroller.CreateScrollArrowButton()
	downArrowButton:setActionEventName( "mouse_scroller_down" )
	downArrowButton:setLeftRight( true, true, 0, 0 )
	downArrowButton:setTopBottom( false, true, -mouseScroller.height / 2 + 5, 0 )
	downArrowButton.arrowImage:setZRot( 180 )
	mouseScroller:addElement( downArrowButton )
end

CoD.MouseScroller.AddLeftRightScroller = function ( mouseScroller )
	local leftArrowButton = CoD.MouseScroller.CreateScrollArrowButton()
	leftArrowButton:setActionEventName( "mouse_scroller_left" )
	leftArrowButton:setLeftRight( true, false, 0, mouseScroller.width / 2 - 5 )
	leftArrowButton:setTopBottom( true, true, 0, 0 )
	leftArrowButton.arrowImage:setZRot( 90 )
	mouseScroller:addElement( leftArrowButton )
	local rightArrowButton = CoD.MouseScroller.CreateScrollArrowButton()
	rightArrowButton:setActionEventName( "mouse_scroller_right" )
	rightArrowButton:setLeftRight( false, true, -mouseScroller.width / 2 + 5, 0 )
	rightArrowButton:setTopBottom( true, true, 0, 0 )
	rightArrowButton.arrowImage:setZRot( -90 )
	mouseScroller:addElement( rightArrowButton )
end

CoD.MouseScroller.CreateScrollArrowButton = function ()
	local arrowButton = LUI.UIButton.new( nil, actionEventName )
	arrowButton:registerEventHandler( "button_up", CoD.NullFunction )
	arrowButton:setHandleMouseMove( false )
	local expansion = CoD.MouseScroller.ArrowExpansionSize
	local arrowImage = LUI.UIImage.new()
	arrowImage:setLeftRight( true, true, expansion / 2, -expansion / 2 )
	arrowImage:setTopBottom( true, true, expansion / 2, -expansion / 2 )
	arrowImage:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	arrowImage:setImage( RegisterMaterial( CoD.MouseScroller.ArrowMaterialName ) )
	arrowImage:setHandleMouseMove( true )
	arrowImage:registerEventHandler( "mouseenter", CoD.MouseScroller.MouseEnter )
	arrowImage:registerEventHandler( "mouseleave", CoD.MouseScroller.MouseLeave )
	arrowButton.arrowImage = arrowImage
	arrowButton:addElement( arrowImage )
	return arrowButton
end

CoD.MouseScroller.MouseEnter = function ( arrowImage, event )
	local expansion = CoD.MouseScroller.ArrowExpansionSize
	arrowImage:beginAnimation( "pop", 50 )
	arrowImage:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	arrowImage:setLeftRight( true, true, 0, 0 )
	arrowImage:setTopBottom( true, true, 0, 0 )
end

CoD.MouseScroller.MouseLeave = function ( arrowImage, event )
	local expansion = CoD.MouseScroller.ArrowExpansionSize
	arrowImage:beginAnimation( "default", 50 )
	arrowImage:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	arrowImage:setLeftRight( true, true, expansion / 2, -expansion / 2 )
	arrowImage:setTopBottom( true, true, expansion / 2, -expansion / 2 )
end

