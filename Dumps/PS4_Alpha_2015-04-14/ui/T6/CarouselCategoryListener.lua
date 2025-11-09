CoD.CarouselCategoryListener = {}
CoD.CarouselCategoryListener.CategoryFontName = "Condensed"
CoD.CarouselCategoryListener.NewImageMaterial = "menu_mp_lobby_new"
CoD.CarouselCategoryListener.NewImageWidth = 40
CoD.CarouselCategoryListener.NewImageHeight = 20
CoD.CarouselCategoryListener.MouseHighlightAnimTime = 100
CoD.CarouselCategoryListener.new = function ( category, label )
	local font = CoD.fonts[CoD.CarouselCategoryListener.CategoryFontName]
	local labelHeight = CoD.textSize[CoD.CarouselCategoryListener.CategoryFontName]
	local listenerHeight = labelHeight + CoD.CarouselCategoryListener.NewImageHeight
	local listener = LUI.UIElement.new()
	listener:setLeftRight( true, true, 0, 0 )
	listener:setTopBottom( false, false, -listenerHeight / 2, listenerHeight / 2 )
	listener.category = category
	local labelText = LUI.UIText.new()
	labelText:setLeftRight( true, true, 0, 0 )
	labelText:setTopBottom( true, false, 0, labelHeight )
	labelText:setFont( font )
	labelText:setAlignment( LUI.Alignment.Center )
	labelText:setAlpha( CoD.DisabledAlpha )
	labelText:setText( label )
	listener.labelText = labelText
	listener:addElement( labelText )
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( label, font, labelHeight )
	listener.textLength = textRight - textLeft
	listener:registerEventHandler( "carousel_scroll_complete", CoD.CarouselCategoryListener.CarouselScrollComplete )
	listener:registerEventHandler( "carousel_mouse_enter", CoD.CarouselCategoryListener.CarouselMouseEnter )
	listener:registerEventHandler( "carousel_mouse_leave", CoD.CarouselCategoryListener.CarouselMouseLeave )
	listener:registerEventHandler( "gain_focus", CoD.CarouselCategoryListener.GainFocus )
	listener:registerEventHandler( "lose_focus", CoD.CarouselCategoryListener.LoseFocus )
	listener.addNewImage = CoD.CarouselCategoryListener.AddNewImage
	listener.removeNewImage = CoD.CarouselCategoryListener.RemoveNewImage
	return listener
end

CoD.CarouselCategoryListener.CarouselScrollComplete = function ( listener, event )
	listener:dispatchEventToParent( {
		name = "carousel_category_changed",
		category = listener.category,
		textLength = listener.textLength
	} )
end

CoD.CarouselCategoryListener.CarouselMouseEnter = function ( listener, event )
	local textSize = CoD.textSize[CoD.CarouselCategoryListener.CategoryFontName] * 1.1
	local labelText = listener.labelText
	labelText:beginAnimation( "mouse_enter", CoD.CarouselCategoryListener.MouseHighlightAnimTime )
	labelText:setTopBottom( true, false, 0, textSize )
end

CoD.CarouselCategoryListener.CarouselMouseLeave = function ( listener, event )
	local textSize = CoD.textSize[CoD.CarouselCategoryListener.CategoryFontName]
	local labelText = listener.labelText
	labelText:beginAnimation( "mouse_leave", CoD.CarouselCategoryListener.MouseHighlightAnimTime )
	labelText:setTopBottom( true, false, 0, textSize )
end

CoD.CarouselCategoryListener.GainFocus = function ( listener, event )
	local labelText = listener.labelText
	labelText:beginAnimation( "gain_focus" )
	labelText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	labelText:setAlpha( 1 )
	return true
end

CoD.CarouselCategoryListener.LoseFocus = function ( listener, event )
	local labelText = listener.labelText
	labelText:beginAnimation( "lose_focus" )
	labelText:setRGB( CoD.ButtonTextColor.r, CoD.ButtonTextColor.g, CoD.ButtonTextColor.b )
	labelText:setAlpha( CoD.DisabledAlpha )
end

CoD.CarouselCategoryListener.AddNewImage = function ( listener )
	local top = CoD.textSize[CoD.CarouselCategoryListener.CategoryFontName]
	local newImage = LUI.UIImage.new()
	newImage:setLeftRight( false, false, -CoD.CarouselCategoryListener.NewImageWidth / 2, CoD.CarouselCategoryListener.NewImageWidth / 2 )
	newImage:setTopBottom( true, false, top, top + CoD.CarouselCategoryListener.NewImageHeight )
	newImage:setImage( RegisterMaterial( CoD.CarouselCategoryListener.NewImageMaterial ) )
	listener.newImage = newImage
	listener:addElement( newImage )
end

CoD.CarouselCategoryListener.RemoveNewImage = function ( listener )
	if listener.newImage ~= nil then
		listener.newImage:close()
		listener.newImage = nil
	end
end

