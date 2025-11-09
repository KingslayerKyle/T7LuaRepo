require( "T6.CarouselCategoryListener" )

CoD.CategoryCarousel = {}
CoD.CategoryCarousel.BumperControls = true
CoD.CategoryCarousel.BumperAspectRatio = 1
CoD.CategoryCarousel.BumperHeight = 30
CoD.CategoryCarousel.BumperWidth = CoD.CategoryCarousel.BumperHeight * CoD.CategoryCarousel.BumperAspectRatio
CoD.CategoryCarousel.BumperOffset = 15
CoD.CategoryCarousel.BumperFontName = "ExtraSmall"
CoD.CategoryCarousel.IndicatorSize = 30
CoD.CategoryCarousel.IndicatorAlpha = 0.5
CoD.CategoryCarousel.new = function ( defaultAnimationState, categoryWidth, categoryHeight, spacing, scrollTime )
	local carousel = CoD.HorizontalCarousel.new( defaultAnimationState, categoryWidth, categoryHeight, spacing, 1, scrollTime )
	carousel.id = "CategoryCarousel"
	carousel:registerEventHandler( "carousel_category_changed", CoD.CategoryCarousel.CarouselCategoryChanged )
	carousel:registerEventHandler( "input_source_changed", CoD.CategoryCarousel.InputSourceChanged )
	carousel:registerEventHandler( "indicator_scroll", CoD.CategoryCarousel.IndicatorScroll )
	carousel:registerEventHandler( "reset_controls", function ( self, event )
		self.resetControls = nil
	end )
	carousel.addCategory = CoD.CategoryCarousel.AddCategory
	carousel.addLeftIndicator = CoD.CategoryCarousel.AddLeftIndicator
	carousel.addRightIndicator = CoD.CategoryCarousel.AddRightIndicator
	if CoD.CategoryCarousel.BumperControls then
		carousel.handleGamepadButton = CoD.CategoryCarousel.BumperControlsOverride
		
		local leftBumper = LUI.UIText.new()
		leftBumper:setLeftRight( true, false, 0, CoD.CategoryCarousel.BumperWidth )
		leftBumper:setTopBottom( true, false, 0, CoD.CategoryCarousel.BumperHeight )
		leftBumper:setFont( CoD.fonts[CoD.CategoryCarousel.BumperFontName] )
		leftBumper:setAlpha( 0 )
		leftBumper:setText( CoD.buttonStrings.shoulderl )
		carousel:addElement( leftBumper )
		carousel.leftBumper = leftBumper
		
		local rightBumper = LUI.UIText.new()
		rightBumper:setLeftRight( false, true, -CoD.CategoryCarousel.BumperWidth, 0 )
		rightBumper:setTopBottom( true, false, 0, CoD.CategoryCarousel.BumperHeight )
		rightBumper:setFont( CoD.fonts[CoD.CategoryCarousel.BumperFontName] )
		rightBumper:setAlpha( 0 )
		rightBumper:setText( CoD.buttonStrings.shoulderr )
		carousel:addElement( rightBumper )
		carousel.rightBumper = rightBumper
		
		carousel.gamepadInput = Engine.LastInput_Gamepad()
	end
	return carousel
end

CoD.CategoryCarousel.CarouselCategoryChanged = function ( carousel, event )
	local leftBumper = carousel.leftBumper
	local rightBumper = carousel.rightBumper
	if leftBumper and rightBumper then
		local leftSide = -event.textLength / 2 - CoD.CategoryCarousel.BumperOffset
		leftBumper:beginAnimation( "adjust_position" )
		leftBumper:setLeftRight( false, false, leftSide - CoD.CategoryCarousel.BumperWidth, leftSide )
		local rightSide = event.textLength / 2 + CoD.CategoryCarousel.BumperOffset
		rightBumper:beginAnimation( "adjust_position" )
		rightBumper:setLeftRight( false, false, rightSide, rightSide + CoD.CategoryCarousel.BumperWidth )
		if carousel.gamepadInput then
			leftBumper:setAlpha( 1 )
			rightBumper:setAlpha( 1 )
		else
			leftBumper:setAlpha( 0 )
			rightBumper:setAlpha( 0 )
		end
	end
	if carousel.m_mouseRange then
		local currentIndex = carousel:getCurrentItemIndex()
		local numItems = carousel:getNumItems()
		if carousel.m_mouseRange < numItems - currentIndex then
			carousel:addRightIndicator()
		elseif carousel.rightIndicator then
			carousel.rightIndicator:close()
		end
		if carousel.m_mouseRange < currentIndex - 1 then
			carousel:addLeftIndicator()
		elseif carousel.leftIndicator then
			carousel.leftIndicator:close()
		end
	end
	carousel:dispatchEventToParent( event )
end

CoD.CategoryCarousel.InputSourceChanged = function ( carousel, event )
	if event.source == 0 then
		carousel.leftBumper:setAlpha( 1 )
		carousel.rightBumper:setAlpha( 1 )
		carousel.gamepadInput = true
	else
		carousel.leftBumper:setAlpha( 0 )
		carousel.rightBumper:setAlpha( 0 )
		carousel.gamepadInput = false
	end
end

CoD.CategoryCarousel.BumperControlsOverride = function ( carousel, event )
	if LUI.UIElement.handleGamepadButton( carousel, event ) == true then
		return 
	elseif carousel.resetControls ~= nil then
		return 
	end
	carousel.resetControls = true
	carousel:addElement( LUI.UITimer.new( 100, "reset_controls", true, carousel ) )
	local scrollDirection = nil
	if event.down == true then
		if event.button == "shoulderr" then
			scrollDirection = 1
		elseif event.button == "shoulderl" then
			scrollDirection = -1
		end
	end
	if scrollDirection ~= nil and carousel.m_currentItem ~= nil and carousel:scrollToItem( carousel.m_currentItem + scrollDirection, carousel.m_scrollTime ) then
		carousel:dispatchEventToParent( {
			name = "fade_out_carousel",
			duration = carousel.m_scrollTime
		} )
		if carousel.leftBumper and carousel.rightBumper then
			carousel.leftBumper:beginAnimation( "hide" )
			carousel.leftBumper:setAlpha( 0 )
			carousel.rightBumper:beginAnimation( "hide" )
			carousel.rightBumper:setAlpha( 0 )
		end
	end
end

CoD.CategoryCarousel.IndicatorScroll = function ( carousel, event )
	local scrollDirection = event.scrollDirection
	carousel:scrollToItem( carousel.m_currentItem + scrollDirection, carousel.m_scrollTime )
end

CoD.CategoryCarousel.Indicator_MouseEnter = function ( indicator, event )
	indicator:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	indicator:setAlpha( 1 )
end

CoD.CategoryCarousel.Indicator_MouseLeave = function ( indicator, event )
	indicator:setRGB( 1, 1, 1 )
	indicator:setAlpha( CoD.CategoryCarousel.IndicatorAlpha )
end

CoD.CategoryCarousel.Indicator_LeftMouseDown = function ( indicator, event )
	local scrollDirection = 0
	if indicator.id == "LeftIndicator" then
		scrollDirection = -1
	elseif indicator.id == "RightIndicator" then
		scrollDirection = 1
	end
	indicator:dispatchEventToParent( {
		name = "indicator_scroll",
		scrollDirection = scrollDirection
	} )
end

CoD.CategoryCarousel.AddCategory = function ( carousel, categoryName, categoryLabel )
	local listener = CoD.CarouselCategoryListener.new( categoryName, categoryLabel )
	carousel:addItem( listener )
	return listener
end

CoD.CategoryCarousel.AddLeftIndicator = function ( carousel )
	if carousel.leftIndicator == nil then
		local leftIndicator = LUI.UIImage.new()
		leftIndicator.id = "LeftIndicator"
		leftIndicator:setLeftRight( true, false, 0, CoD.CategoryCarousel.IndicatorSize )
		leftIndicator:setTopBottom( true, false, 0, CoD.CategoryCarousel.IndicatorSize )
		leftIndicator:setImage( RegisterMaterial( "ui_arrow_left" ) )
		leftIndicator:setRGB( 1, 1, 1 )
		leftIndicator:setAlpha( CoD.CategoryCarousel.IndicatorAlpha )
		leftIndicator:setHandleMouse( true )
		leftIndicator:registerEventHandler( "mouseenter", CoD.CategoryCarousel.Indicator_MouseEnter )
		leftIndicator:registerEventHandler( "mouseleave", CoD.CategoryCarousel.Indicator_MouseLeave )
		leftIndicator:registerEventHandler( "leftmousedown", CoD.CategoryCarousel.Indicator_LeftMouseDown )
		carousel.leftIndicator = leftIndicator
	end
	carousel:addElement( carousel.leftIndicator )
end

CoD.CategoryCarousel.AddRightIndicator = function ( carousel )
	if carousel.rightIndicator == nil then
		local rightIndicator = LUI.UIImage.new()
		rightIndicator.id = "RightIndicator"
		rightIndicator:setLeftRight( false, true, -CoD.CategoryCarousel.IndicatorSize, 0 )
		rightIndicator:setTopBottom( true, false, 0, CoD.CategoryCarousel.IndicatorSize )
		rightIndicator:setImage( RegisterMaterial( "ui_arrow_right" ) )
		rightIndicator:setRGB( 1, 1, 1 )
		rightIndicator:setAlpha( CoD.CategoryCarousel.IndicatorAlpha )
		rightIndicator:setHandleMouse( true )
		rightIndicator:registerEventHandler( "mouseenter", CoD.CategoryCarousel.Indicator_MouseEnter )
		rightIndicator:registerEventHandler( "mouseleave", CoD.CategoryCarousel.Indicator_MouseLeave )
		rightIndicator:registerEventHandler( "leftmousedown", CoD.CategoryCarousel.Indicator_LeftMouseDown )
		carousel.rightIndicator = rightIndicator
	end
	carousel:addElement( carousel.rightIndicator )
end

