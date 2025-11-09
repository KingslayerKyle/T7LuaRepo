CoD.ScrollableTextContainer = {}
CoD.ScrollableTextContainer.PauseTime = 3000
CoD.ScrollableTextContainer.TimePerLineScroll = 3000
CoD.ScrollableTextContainer.FadeDuration = 1000
CoD.ScrollableTextContainer.FadeOutComplete = function ( self, event )
	self:setTopBottom( true, true, 0, 0 )
	self:beginAnimation( "fade_in", CoD.ScrollableTextContainer.FadeDuration )
	self:setAlpha( 1 )
end

CoD.ScrollableTextContainer.FadeInComplete = function ( self, event )
	CoD.ScrollableTextContainer.ScrollingStartPauseState( self )
end

CoD.ScrollableTextContainer.ScrollingEndPauseStateComplete = function ( self, event )
	self:setAlpha( 1 )
	self:beginAnimation( "fade_out", CoD.ScrollableTextContainer.FadeDuration )
	self:setAlpha( 0 )
end

CoD.ScrollableTextContainer.MoveUpStateComplete = function ( self, event )
	self:beginAnimation( "textScrollingEndPauseState", self.pauseTime )
end

CoD.ScrollableTextContainer.ScrollingStartPauseStateComplete = function ( self, event )
	self:setTopBottom( true, true, 0, 0 )
	self:beginAnimation( "textMoveUpState", self.totalScrollingTime )
	self:setTopBottom( true, true, -self.verticalTextDisplacement, -self.verticalTextDisplacement )
end

CoD.ScrollableTextContainer.ScrollingStartPauseState = function ( self )
	self:setTopBottom( true, true, 0, 0 )
	self:beginAnimation( "textScrollingStartPauseState", self.pauseTime )
	self:setTopBottom( true, true, 0, 0 )
end

CoD.ScrollableTextContainer.SetupScrollingText = function ( container, desc, textContainerWidth, textContainerHeight, isCached, font, textSize, pauseTime, timePerLineScroll )
	if container ~= nil and desc ~= nil and textContainerWidth ~= 0 then
		container:removeAllChildren()
		if font == nil then
			font = CoD.fonts.Default
		end
		if textSize == nil then
			textSize = CoD.textSize.Default
		end
		if pauseTime == nil then
			pauseTime = CoD.ScrollableTextContainer.PauseTime
		end
		if timePerLineScroll == nil then
			timePerLineScroll = CoD.ScrollableTextContainer.TimePerLineScroll
		end
		container.scrollableContainer = LUI.UIElement.new()
		container.scrollableContainer:setLeftRight( true, true, 0, 0 )
		container.scrollableContainer:setTopBottom( true, true, 0, 0 )
		container.scrollableContainer:registerEventHandler( "transition_complete_textScrollingStartPauseState", CoD.ScrollableTextContainer.ScrollingStartPauseStateComplete )
		container.scrollableContainer:registerEventHandler( "transition_complete_textScrollingEndPauseState", CoD.ScrollableTextContainer.ScrollingEndPauseStateComplete )
		container.scrollableContainer:registerEventHandler( "transition_complete_textMoveUpState", CoD.ScrollableTextContainer.MoveUpStateComplete )
		container.scrollableContainer:registerEventHandler( "transition_complete_fade_out", CoD.ScrollableTextContainer.FadeOutComplete )
		container.scrollableContainer:registerEventHandler( "transition_complete_fade_in", CoD.ScrollableTextContainer.FadeInComplete )
		container:addElement( container.scrollableContainer )
		container.descElement = LUI.UIText.new()
		if not isCached then
			container.descElement:setupUITextUncached()
		end
		container.descElement:setLeftRight( true, true, 0, 0 )
		container.descElement:setTopBottom( true, false, 0, textSize )
		container.descElement:setFont( font )
		container.descElement:setRGB( 0.6, 0.6, 0.6 )
		container.descElement:setAlignment( LUI.Alignment.Left )
		container.scrollableContainer:addElement( container.descElement )
		local totalLines = Engine.GetNumTextLines( desc, font, textSize, textContainerWidth )
		local linesToBeScrolled = totalLines - math.floor( textContainerHeight / textSize )
		container.descElement:setText( desc )
		if linesToBeScrolled > 0 then
			container.scrollableContainer.totalScrollingTime = linesToBeScrolled * timePerLineScroll
			container.scrollableContainer.pauseTime = pauseTime
			container.scrollableContainer.verticalTextDisplacement = linesToBeScrolled * CoD.textSize.Default
			container.scrollableContainer:completeAnimation()
			CoD.ScrollableTextContainer.ScrollingStartPauseState( container.scrollableContainer )
		end
	end
end

