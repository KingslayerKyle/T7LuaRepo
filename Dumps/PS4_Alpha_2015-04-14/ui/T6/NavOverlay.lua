require( "ui.T6.Overlay" )
require( "ui.T6.AccordionGroups" )

CoD.NavOverlay = {}
CoD.NavOverlay.SlideInTime = 150
CoD.NavOverlay.SlideOutTime = 150
CoD.NavOverlay.new = function ( frame, accordionGroups )
	local overlayHeight = accordionGroups:getMaxHeight()
	accordionGroups:registerAnimationState( "offscreen", {
		top = overlayHeight,
		bottom = 0,
		topAnchor = true,
		bottomAnchor = false
	} )
	accordionGroups:animateToState( "offscreen" )
	local navOverlay = CoD.Overlay.new( frame, {
		left = 0,
		top = -overlayHeight,
		right = 0,
		bottom = -frame.bottomBorderHeight,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	navOverlay.navContainer = LUI.UIContainer.new()
	navOverlay:addElement( navOverlay.navContainer )
	navOverlay.navContainer:setUseStencil( true )
	navOverlay.infoPaneHeight = LUI.UIHeight - overlayHeight
	navOverlay.infoPane = LUI.UIElement.new( {
		left = 0,
		top = -navOverlay.infoPaneHeight,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	} )
	navOverlay:addElement( navOverlay.infoPane )
	navOverlay.infoPane:registerAnimationState( "fade_out", {
		alphaMultiplier = 0
	} )
	navOverlay.infoPane:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	navOverlay.infoPane:animateToState( "fade_out" )
	navOverlay.accordionGroups = accordionGroups
	navOverlay.navContainer:addElement( accordionGroups )
	navOverlay:registerEventHandler( "overlay_opened", CoD.NavOverlay.Opened )
	navOverlay:registerEventHandler( "overlay_closing", CoD.NavOverlay.Closing )
	navOverlay:registerEventHandler( "button_prompt_back", CoD.NavOverlay.Close )
	return navOverlay
end

CoD.NavOverlay.Opened = function ( self, event )
	self.accordionGroups:animateToState( "default", CoD.NavOverlay.SlideInTime )
	self.infoPane:animateToState( "fade_in", CoD.NavOverlay.SlideInTime )
end

CoD.NavOverlay.Close = function ( self, event )
	self.infoPane:animateToState( "fade_out", CoD.NavOverlay.SlideOutTime )
	self.accordionGroups:animateToState( "offscreen", CoD.NavOverlay.SlideOutTime )
	self:addElement( LUI.UITimer.new( CoD.NavOverlay.SlideOutTime, "overlay_closing", true ) )
end

CoD.NavOverlay.Closing = function ( self, event )
	CoD.Overlay.Close( self )
end

