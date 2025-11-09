local MFContainer_ScrollSpeed = 200
local MFContainer_ZoomSpeed = 200
local MFContainer_ZoomAmount = 0.5
local MFContainer_AddSlide = function ( self, slide, name )
	slide.id = "MFSlide." .. name
	slide.frame = self.frame
	slide.slideContainer = self
	if slide.largeSlide then
		slide:registerAnimationState( "default", {
			left = -self.slideWidth / 2,
			top = self.largeSlideTopOffset + -self.largeSlideHeight / 2,
			right = self.slideWidth / 2,
			bottom = self.largeSlideTopOffset + self.largeSlideHeight / 2,
			xRot = 0,
			yRot = 0,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			alpha = 0
		} )
		slide:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		slide.height = self.largeSlideHeight
	else
		slide:registerAnimationState( "default", {
			left = -self.slideWidth / 2,
			top = self.largeSlideTopOffset + -self.largeSlideHeight / 2,
			right = self.slideWidth / 2,
			bottom = self.largeSlideTopOffset + self.largeSlideHeight / 2,
			xRot = 0,
			yRot = 0,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			alpha = 0
		} )
		slide:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		slide.height = self.slideHeight
	end
	slide.width = self.slideWidth
	slide:animateToState( "default" )
	self:addElement( slide )
	if name ~= nil then
		if self.slideNames == nil then
			self.slideNames = {}
		end
		self.slideNames[name] = slide
		slide.name = name
	else
		error( "LUI Error: Cannot add a slide without a name." )
	end
end

local MFContainer_SetupCurrentSlide = function ( self )
	if self.nextSlide ~= nil then
		self.currentSlide = self.nextSlide
		self.nextSlide = nil
	end
	if self.currentSlide ~= nil then
		self.currentSlide:processEvent( {
			name = "add_slide_elements"
		} )
		self.currentSlide:processEvent( {
			name = "slide_activated"
		} )
	end
	local skipQueue = nil
	while #self.nextSlideQueue > 0 and skipQueue ~= true do
		local nextScrollElement = self.nextSlideQueue[1]
		table.remove( self.nextSlideQueue, 1 )
		self.nextSlide = nextScrollElement.slide
		self.scrollController = nextScrollElement.controller
		self.markPrevious = nextScrollElement.markPrevious
		skipQueue = self:scroll()
	end
end

local MFContainer_Scroll = function ( self )
	if self.m_overlayOpen == true then
		return 
	end
	local currentSlide = self.currentSlide
	local nextSlide = self.nextSlide
	local frame = self.frame
	if nextSlide == nil then
		return 
	elseif currentSlide ~= nil then
		if currentSlide == nextSlide then
			self.nextSlide = nil
			return 
		elseif frame ~= nil and currentSlide.title ~= nextSlide.title then
			frame:fadeOutTitle( CoD.MFSlide.FadeOutTime )
		end
		currentSlide:processEvent( {
			name = "slide_deactivated"
		} )
		currentSlide:animateToState( "default", MFContainer_ScrollSpeed, true, false )
	end
	if self.markPrevious and currentSlide ~= nil then
		nextSlide.m_previousMenuName = currentSlide.name
	end
	if nextSlide.largeSlide ~= true and self.scrollController ~= nil then
		nextSlide.m_ownerController = self.scrollController
	end
	local transitionSound = "uin_menu_trans_02"
	self.scrollSpeed = MFContainer_ScrollSpeed
	nextSlide:animateToState( "fade_in", MFContainer_ScrollSpeed, true, false )
	MFContainer_SetupCurrentSlide( self )
	Engine.PlaySound( "uin_navigation_select_main" )
	Engine.PlaySound( transitionSound )
	return true
end

local MFContainer_ScrollToNamedSlide = function ( self, name, controller, markPrevious )
	if self.slideNames ~= nil then
		local nextSlide = self.slideNames[name]
		if nextSlide ~= nil then
			if nextSlide.isSubMenu ~= nil then
				if self.currentSlide.m_ownerMenuName ~= nil then
					nextSlide.m_ownerMenuName = self.currentSlide.m_ownerMenuName
				else
					nextSlide.m_ownerMenuName = self.currentSlide.name
				end
			end
			self.frame:processEvent( {
				name = "slide_changed"
			} )
			if self.nextSlide == nil then
				self.nextSlide = nextSlide
				self.scrollController = controller
				self.markPrevious = markPrevious
				self:scroll()
			else
				local nextScrollElement = {
					slide = nextSlide,
					controller = controller,
					markPrevious = markPrevious
				}
				table.insert( self.nextSlideQueue, nextScrollElement )
			end
			return nextSlide
		end
	end
end

local MFContainer_OpenMenu = function ( self, event )
	local isSubMenu, ownerMenuName = nil
	if self.currentSlide ~= nil then
		isSubMenu = self.currentSlide.isSubMenu
		ownerMenuName = self.currentSlide.m_ownerMenuName
	end
	if self.frame.currentMenu ~= event.menuName and (isSubMenu == nil or ownerMenuName ~= event.menuName) then
		self:scrollToNamedSlide( event.menuName, event.controller )
	end
end

local MFContainer_OverlayOpened = function ( self )
	self.m_overlayOpen = true
	if self.currentSlide ~= nil then
		self.currentSlide:overlayOpened()
	end
end

local MFContainer_OverlayClosing = function ( self )
	self.m_overlayOpen = nil
	local isScrolling = self:scroll()
	if self.currentSlide ~= nil then
		local reactivate = nil
		if isScrolling ~= true then
			reactivate = true
		end
		self.currentSlide:overlayClosing( reactivate, MFContainer_ZoomSpeed )
	end
	local slide = nil
	if isScrolling ~= true then
		slide = self.currentSlide
	end
	return isScrolling
end

local MFContainer_OverlayClosed = function ( self )
	if self.currentSlide ~= nil then
		local reactivate = nil
		if self.nextSlide == nil then
			reactivate = true
		end
		self.currentSlide:overlayClosed( reactivate )
	end
end

LUI.createMenu.MFContainer = function ( width, height, frame )
	local scrollableContainer = LUI.UIScrollable.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}, width, height, true )
	scrollableContainer:setUseStencil( false )
	scrollableContainer.frame = frame
	frame.slideContainer = scrollableContainer
	scrollableContainer.slideWidth = frame.width
	scrollableContainer.slideHeight = 600
	scrollableContainer.slideTopOffset = 0 - (600 - scrollableContainer.slideHeight) / 2
	scrollableContainer.largeSlideHeight = 600
	scrollableContainer.largeSlideTopOffset = 0 - (600 - scrollableContainer.largeSlideHeight) / 2
	scrollableContainer.nextSlideQueue = {}
	scrollableContainer:registerEventHandler( "open_menu", MFContainer_OpenMenu )
	scrollableContainer.addSlide = MFContainer_AddSlide
	scrollableContainer.scroll = MFContainer_Scroll
	scrollableContainer.scrollToNamedSlide = MFContainer_ScrollToNamedSlide
	scrollableContainer.overlayOpened = MFContainer_OverlayOpened
	scrollableContainer.overlayClosing = MFContainer_OverlayClosing
	scrollableContainer.overlayClosed = MFContainer_OverlayClosed
	return scrollableContainer
end

