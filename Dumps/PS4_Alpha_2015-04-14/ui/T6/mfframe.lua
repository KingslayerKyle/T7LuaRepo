require( "T6.Ticker" )

local MFFrame_AddAllocationSubtitle, MFFrame_RemoveAllocationSubtitle = nil
local MFFrame_FadeInTitle = function ( self, text, duration )
	self.title:setText( text )
	self.title:animateToState( "fade_in", duration, false, false )
end

local MFFrame_FadeOutTitle = function ( self, duration )
	self.title:animateToState( "fade_out", duration, false, false )
end

local MFFrame_OpenOverlay = function ( self, name, controller )
	local overlay = LUI.createMenu[name]( self, controller )
	if overlay == nil then
		return 
	end
	overlay.name = name
	overlay.m_ownerController = controller
	if self.slideContainer ~= nil then
		self.slideContainer:overlayOpened()
	end
	self:addElement( LUI.UITimer.new( CoD.MFSlide.FadeOutTime, {
		name = "open_overlay_internal",
		overlay = overlay
	}, true ) )
	return overlay
end

local MFFrame_OpenOverlayInternal = function ( self, event )
	self.overlays:addElement( event.overlay )
	event.overlay:processEvent( {
		name = "overlay_opening",
		time = self.overlayOpenTime
	} )
	self.m_replacingOverlay = nil
end

local MFFrame_CloseOverlay = function ( self, overlay, nextOverlay )
	LUI.UIElement.close( overlay )
	local fadeOutTitle = true
	if self.slideContainer ~= nil and self.slideContainer.currentSlide ~= nil then
		local isScrolling = self.slideContainer:overlayClosing()
		if isScrolling == true and self.slideContainer.nextSlide.title == overlay.title then
			fadeOutTitle = nil
		end
		self:addElement( LUI.UITimer.new( self.overlayCloseTime, {
			name = "close_overlay_internal",
			overlay = overlay,
			nextOverlay = nextOverlay
		}, true ) )
	end
	if fadeOutTitle == true and overlay.title ~= nil then
		self:fadeOutTitle( self.overlayCloseTime )
	end
end

local MFFrame_CloseOverlayInternal = function ( self, event )
	event.overlay:processEvent( {
		name = "overlay_closed"
	} )
	if event.nextOverlay ~= nil then
		self:processEvent( {
			name = "replace_overlay_internal",
			nextOverlay = event.nextOverlay
		} )
	elseif self.slideContainer ~= nil then
		self.slideContainer:overlayClosed()
	end
end

local MFFrame_ReplaceOverlay = function ( self, controller, overlay, nextOverlayName )
	if self.m_replacingOverlay == true then
		return 
	else
		local nextOverlay = {
			name = nextOverlayName,
			controller = controller
		}
		self:closeOverlay( overlay, nextOverlay )
		self.m_replacingOverlay = true
	end
end

local MFFrame_ReplaceOverlayInternal = function ( self, event )
	self:openOverlay( event.nextOverlay.name, event.nextOverlay.controller )
end

LUI.createMenu.MFFrame = function ( width )
	local frame = LUI.UIElement.new( {
		left = -width / 2,
		top = 60,
		right = width / 2,
		bottom = -60,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	frame.width = width
	frame.overlayOpenTime = CoD.MFSlide.FadeInTime
	frame.overlayCloseTime = CoD.MFSlide.FadeInTime
	local titleXOffset = 0
	frame.titleContainer = LUI.UIElement.new( {
		left = -CoD.textSize.Morris - titleXOffset,
		top = 0,
		right = -titleXOffset,
		bottom = CoD.textSize.Morris,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		zRot = 90
	} )
	frame:addElement( frame.titleContainer )
	frame.title = LUI.UIText.new( {
		left = -CoD.textSize.Morris,
		top = -CoD.textSize.Morris,
		bottom = 0,
		right = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true,
		font = CoD.fonts.Morris,
		alpha = 0.75
	} )
	frame.title:registerAnimationState( "fade_in", {
		alpha = CoD.textAlpha
	} )
	frame.title:registerAnimationState( "fade_out", {
		alpha = 0
	} )
	frame.titleContainer:addElement( frame.title )
	frame.buttonPrompts = LUI.UIElement.new( {
		left = 0,
		top = -CoD.ButtonPrompt.Height,
		right = -10,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	frame:addElement( frame.buttonPrompts )
	frame.fadeInTitle = MFFrame_FadeInTitle
	frame.fadeOutTitle = MFFrame_FadeOutTitle
	frame.openOverlay = MFFrame_OpenOverlay
	frame.closeOverlay = MFFrame_CloseOverlay
	frame.replaceOverlay = MFFrame_ReplaceOverlay
	frame.addAllocationSubtitle = MFFrame_AddAllocationSubtitle
	frame.removeAllocationSubtitle = MFFrame_RemoveAllocationSubtitle
	frame:registerEventHandler( "open_overlay_internal", MFFrame_OpenOverlayInternal )
	frame:registerEventHandler( "close_overlay_internal", MFFrame_CloseOverlayInternal )
	frame:registerEventHandler( "replace_overlay_internal", MFFrame_ReplaceOverlayInternal )
	return frame
end

MFFrame_AddAllocationSubtitle = function ( self )
	self:removeAllocationSubtitle()
	local allocationSubtitle = CoD.AllocationSubtitle.new( self.width, {
		left = 0,
		top = 0,
		bottom = CoD.frameSubtitleHeight,
		right = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		alphaMultiplier = 0
	} )
	self:addElement( allocationSubtitle )
	allocationSubtitle:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	self.allocationSubtitle = allocationSubtitle
	return allocationSubtitle
end

MFFrame_RemoveAllocationSubtitle = function ( self )
	if self.allocationSubtitle ~= nil then
		self.allocationSubtitle:close()
		self.allocationSubtitle = nil
	end
end

