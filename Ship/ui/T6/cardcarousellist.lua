-- a4758e9695a7b86386b048ac3d8fbe94
-- This hash is used for caching, delete to decompile the file again

require( "ui.T6.CardCarousel" )

CoD.CardCarouselList = {}
CoD.CardCarouselList.TitleListTextSize = CoD.textSize.Default
CoD.CardCarouselList.TitleListSpacing = 5
CoD.CardCarouselList.LeftMargin = 50
CoD.CardCarouselList.MouseDragDistance = 100
if CoD.isPC then
	CoD.CardCarouselList.ScrollTime = 50
else
	CoD.CardCarouselList.ScrollTime = 200
end
local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:close()
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:close()
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0:setPriority( 0 )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0.title:setRGB( 1, 1, 1 )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	f5_arg0.title:setRGB( CoD.DefaultTextColor.r, CoD.DefaultTextColor.g, CoD.DefaultTextColor.b )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	f6_arg0:dispatchEventToParent( {
		name = "scroll_to_cardcarousel_title",
		controller = f6_arg1.controller,
		titleText = f6_arg0.titleText
	} )
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	if f7_arg1 then
		if not f7_arg0.newIcon then
			local newIcon = LUI.UIImage.new()
			newIcon:setLeftRight( true, false, f7_arg0.width, f7_arg0.width + CoD.CACUtility.ButtonGridNewImageWidth )
			newIcon:setTopBottom( false, true, -12 - CoD.CACUtility.ButtonGridNewImageHeight / 2, -12 + CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			f7_arg0:addElement( newIcon )
			f7_arg0.newIcon = newIcon
			
		end
	elseif f7_arg0.newIcon then
		f7_arg0.newIcon:close()
		f7_arg0.newIcon = nil
	end
end

local f0_local7 = function ( f8_arg0 )
	local f8_local0 = f8_arg0.m_currentCardCarouselIndex - 1
	if f8_local0 < 1 then
		f8_local0 = #f8_arg0.cardCarousels
	end
	return f8_local0
end

local f0_local8 = function ( f9_arg0 )
	local f9_local0 = f9_arg0.m_currentCardCarouselIndex + 1
	if #f9_arg0.cardCarousels < f9_local0 then
		f9_local0 = 1
	end
	return f9_local0
end

local f0_local9 = function ( f10_arg0, f10_arg1 )
	local f10_local0 = CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( f10_arg0, f10_arg0.numTitles, f10_arg0.cardCarouselList.cardCarousels[f0_local7( f10_arg0.cardCarouselList )], 0 )
	f10_arg0:addElement( f10_local0 )
	f10_local0:animateToState( "fade_in", CoD.CardCarouselList.ScrollTime )
	f10_arg0.cardCarouselList.scrolling = false
	f10_arg0:dispatchEventToParent( {
		name = "auto_scroll"
	} )
end

local f0_local10 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( f11_arg0, 1, f11_arg0.cardCarouselList.cardCarousels[f0_local8( f11_arg0.cardCarouselList )], 0 )
	f11_local0:setPriority( -100 )
	f11_arg0:addElement( f11_local0 )
	f11_local0:animateToState( "fade_in", CoD.CardCarouselList.ScrollTime )
	f11_arg0.cardCarouselList.scrolling = false
end

CoD.CardCarouselList.SetInitialCarousel = function ( f12_arg0, f12_arg1, f12_arg2 )
	if f12_arg1 ~= nil and f12_arg1 ~= f12_arg0.m_currentCardCarouselIndex then
		local f12_local0 = #f12_arg0.cardCarousels
		if f12_local0 < f12_arg1 then
			return 
		end
		f12_arg0.m_currentCardCarouselIndex = f12_arg1
		local f12_local1 = f12_arg0.titleListContainer
		f12_local1:removeAllChildren()
		local f12_local2 = 1
		for f12_local3 = f12_arg1 + 1, f12_local0, 1 do
			f12_arg0.titleListContainer:addElement( CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( f12_local1, f12_local2, f12_arg0.cardCarousels[f12_local3], 1 ) )
			f12_local2 = f12_local2 + 1
		end
		for f12_local3 = 1, f12_arg1 - 1, 1 do
			f12_arg0.titleListContainer:addElement( CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( f12_local1, f12_local2, f12_arg0.cardCarousels[f12_local3], 1 ) )
			f12_local2 = f12_local2 + 1
		end
	end
	if f12_arg2 ~= nil then
		if table.getn( f12_arg0.cardCarousels ) < f12_arg0.m_currentCardCarouselIndex then
			f12_arg0.m_currentCardCarouselIndex = 1
		end
		f12_arg0.cardCarousels[f12_arg0.m_currentCardCarouselIndex].horizontalList.m_currentCardIndex = f12_arg2
	end
end

CoD.CardCarouselList.SetLRSFX = function ( f13_arg0, f13_arg1 )
	f13_arg0.lrSFX = f13_arg1
end

CoD.CardCarouselList.SetUpSFX = function ( f14_arg0, f14_arg1 )
	f14_arg0.upSFX = f14_arg1
end

CoD.CardCarouselList.SetDownSFX = function ( f15_arg0, f15_arg1 )
	f15_arg0.downSFX = f15_arg1
end

CoD.CardCarouselList.SetEquipSFX = function ( f16_arg0, f16_arg1 )
	f16_arg0.equipSFX = f16_arg1
end

local f0_local11 = function ( f17_arg0 )
	local f17_local0 = f17_arg0.titleListContainer
	local f17_local1 = f17_local0:getLastChild()
	if f17_local1 then
		if f17_arg0.downSFX ~= nil then
			Engine.PlaySound( f17_arg0.downSFX )
		end
		local f17_local2 = (f17_local0.elementSize + f17_local0.spacing) * (f17_local0.numTitles + 1)
		f17_local1:registerAnimationState( "move_down_fade_out", {
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			right = f17_local1.width,
			topAnchor = true,
			bottomAnchor = false,
			top = f17_local2,
			bottom = f17_local2 + f17_local0.elementSize,
			alphaMultiplier = 0
		} )
		f17_local1:animateToState( "move_down_fade_out", CoD.CardCarouselList.ScrollTime )
		local f17_local3 = f17_local0:getFirstChild()
		local f17_local4 = 1
		while f17_local3 ~= nil and f17_local4 < f17_local0:getNumChildren() do
			f17_local2 = (f17_local0.elementSize + f17_local0.spacing) * (f17_local4 + 1)
			f17_local3:registerAnimationState( "move_down", {
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				right = f17_local3.width,
				topAnchor = true,
				bottomAnchor = false,
				top = f17_local2,
				bottom = f17_local2 + f17_local0.elementSize
			} )
			f17_local3:animateToState( "move_down", CoD.CardCarouselList.ScrollTime )
			f17_local3 = f17_local3:getNextSibling()
			f17_local4 = f17_local4 + 1
		end
		f17_local0:addElement( LUI.UITimer.new( CoD.CardCarouselList.ScrollTime, "add_container_on_top", true ) )
	end
end

local f0_local12 = function ( f18_arg0 )
	local f18_local0 = f18_arg0.titleListContainer
	local f18_local1 = f18_local0:getFirstChild()
	if f18_local1 then
		if f18_arg0.upSFX ~= nil then
			Engine.PlaySound( f18_arg0.upSFX )
		end
		f18_local1:registerAnimationState( "move_up_fade_out", {
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			right = f18_local1.width,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = f18_local0.elementSize,
			alphaMultiplier = 0
		} )
		f18_local1:animateToState( "move_up_fade_out", CoD.CardCarouselList.ScrollTime )
		local f18_local2 = f18_local1:getNextSibling()
		local f18_local3 = nil
		local f18_local4 = 1
		while f18_local2 ~= nil and f18_local2.id == "CardCarouselList.TitleContainer" do
			f18_local3 = (f18_local0.elementSize + f18_local0.spacing) * f18_local4
			f18_local2:registerAnimationState( "move_up", {
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				right = f18_local2.width,
				topAnchor = true,
				bottomAnchor = false,
				top = f18_local3,
				bottom = f18_local3 + f18_local0.elementSize
			} )
			f18_local2:animateToState( "move_up", CoD.CardCarouselList.ScrollTime )
			f18_local2 = f18_local2:getNextSibling()
			f18_local4 = f18_local4 + 1
		end
		f18_local0:addElement( LUI.UITimer.new( CoD.CardCarouselList.ScrollTime, "add_container_at_bottom", true ) )
	end
end

function CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
	if not f19_arg2 then
		return 
	end
	local f19_local0 = f19_arg2.titleText
	if f19_local0 == nil then
		return 
	end
	local f19_local1 = {}
	f19_local1 = GetTextDimensions( f19_local0, CoD.fonts.Default, f19_arg0.elementSize )
	local f19_local2 = f19_local1[3] - f19_local1[1] + 25
	local f19_local3 = (f19_arg0.elementSize + f19_arg0.spacing) * f19_arg1
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f19_local2,
		topAnchor = true,
		bottomAnchor = false,
		top = f19_local3,
		bottom = f19_local3 + f19_arg0.elementSize,
		alpha = f19_arg3
	} )
	self.id = "CardCarouselList.TitleContainer"
	self.title = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alignment = LUI.Alignment.Left
	} )
	self.titleText = f19_local0
	self.width = f19_local2
	self:addElement( self.title )
	self.title:setText( f19_local0 )
	f19_local3 = f19_local3 - f19_arg0.elementSize + f19_arg0.spacing
	self:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	if f19_arg2.shouldShowNewFunction then
		f0_local6( self, f19_arg2:shouldShowNewFunction() )
	end
	self:registerEventHandler( "transition_complete_move_up_fade_out", f0_local0 )
	self:registerEventHandler( "transition_complete_fade_in", f0_local2 )
	self:registerEventHandler( "transition_complete_move_down_fade_out", f0_local1 )
	f19_arg0:registerEventHandler( "add_container_at_bottom", f0_local9 )
	f19_arg0:registerEventHandler( "add_container_on_top", f0_local10 )
	if CoD.useMouse then
		self:setHandleMouse( true )
		self:registerEventHandler( "mouseenter", f0_local3 )
		self:registerEventHandler( "mouseleave", f0_local4 )
		self:registerEventHandler( "leftmousedown", CoD.NullFunction )
		self:registerEventHandler( "leftmouseup", f0_local5 )
	end
	self.titleListContainer = f19_arg0
	return self
end

CoD.CardCarouselList.SetupCardCarouselTitleList = function ( f20_arg0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = f20_arg0.cardCarouselSize - 15,
		bottom = 0
	} )
	self.numTitles = 0
	self.cardCarouselList = f20_arg0
	self.elementSize = CoD.CardCarouselList.TitleListTextSize
	self.spacing = CoD.CardCarouselList.TitleListSpacing
	f20_arg0.titleListContainer = self
	f20_arg0:addElement( self )
end

CoD.CardCarouselList.UpdateCurrentCarousel = function ( f21_arg0 )
	if f21_arg0.m_currentCardCarouselIndex ~= nil and f21_arg0.m_nextCardCarouselIndex ~= nil then
		local f21_local0 = f21_arg0.cardCarousels[f21_arg0.m_currentCardCarouselIndex]
		f21_arg0:removeElement( f21_arg0.cardCarousels[f21_arg0.m_currentCardCarouselIndex] )
		f21_arg0.m_currentCardCarouselIndex = f21_arg0.m_nextCardCarouselIndex
		local f21_local1 = f21_arg0.cardCarousels[f21_arg0.m_currentCardCarouselIndex]
		f21_arg0:addElement( f21_arg0.cardCarousels[f21_arg0.m_currentCardCarouselIndex] )
		f21_arg0:dispatchEventToParent( {
			name = "card_carousel_list_changed",
			previous = f21_local0,
			next = f21_local1
		} )
		f21_arg0.cardCarousels[f21_arg0.m_currentCardCarouselIndex].horizontalList:processEvent( {
			name = "gain_focus",
			controller = f21_arg0.m_ownerController
		} )
		f21_arg0.cardCarousels[f21_arg0.m_currentCardCarouselIndex].m_leftMouseDown = nil
	end
end

CoD.CardCarouselList.ScrollList = function ( f22_arg0, f22_arg1, f22_arg2 )
	local f22_local0 = nil
	if f22_arg1 == "up" then
		f22_local0 = -1
	elseif f22_arg1 == "down" then
		f22_local0 = 1
	end
	local f22_local1 = f22_arg0.m_currentCardCarouselIndex + f22_local0
	if #f22_arg0.cardCarousels < f22_local1 then
		f22_local1 = 1
	end
	if f22_local1 < 1 then
		f22_local1 = #f22_arg0.cardCarousels
	end
	if f22_local1 ~= f22_arg0.m_currentCardCarouselIndex then
		f22_arg0.m_lastScrollDirection = f22_local0
		f22_arg0.m_nextCardCarouselIndex = f22_local1
		f22_arg0.cardCarousels[f22_arg0.m_currentCardCarouselIndex].horizontalList:processEvent( {
			name = "lose_focus",
			controller = f22_arg2
		} )
		local f22_local2 = f22_arg0.titleListContainer:getFirstChild()
		if f22_local0 == 1 then
			f0_local12( f22_arg0 )
		else
			f0_local11( f22_arg0 )
		end
	end
end

CoD.CardCarouselList.Gamepad_Button = function ( f23_arg0, f23_arg1 )
	if f23_arg0.m_inputDisabled then
		return 
	elseif f23_arg1.button ~= "up" and f23_arg1.button ~= "down" and f23_arg1.button ~= "left" and f23_arg1.button ~= "right" then
		f23_arg0:dispatchEventToChildren( f23_arg1 )
		return nil
	elseif f23_arg1.down == true and (f23_arg1.button == "left" or f23_arg1.button == "right") then
		if CoD_CardCarousel_PerformEdgeBounce( f23_arg0.cardCarousels[f23_arg0.m_currentCardCarouselIndex], f23_arg1.button, f23_arg1.buttonRepeat ) == true then
			return true
		else
			f23_arg0:dispatchEventToChildren( f23_arg1 )
			return nil
		end
	elseif f23_arg1.down == true and (f23_arg1.button == "up" or f23_arg1.button == "down") and (f23_arg0.scrolling == nil or f23_arg0.scrolling == false) then
		f23_arg0.scrolling = true
		CoD.CardCarouselList.ScrollList( f23_arg0, f23_arg1.button, f23_arg1.controller )
		return true
	else
		f23_arg0:dispatchEventToChildren( f23_arg1 )
	end
end

CoD.CardCarouselList.FocusCurrentCardCarousel = function ( f24_arg0, f24_arg1 )
	if f24_arg0.cardCarousels[f24_arg0.m_currentCardCarouselIndex] then
		f24_arg0.cardCarousels[f24_arg0.m_currentCardCarouselIndex].horizontalList:processEvent( {
			name = "gain_focus",
			controller = f24_arg1
		} )
	end
end

CoD.CardCarouselList.new = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5, f25_arg6 )
	local self = LUI.UIElement.new( f25_arg0 )
	self.cardCarousels = {}
	self.id = "CardCarouselList"
	self.m_ownerController = f25_arg1
	self.m_currentCardCarouselIndex = 1
	self.m_lastScrollDirection = 0
	self.m_itemWidth = f25_arg2
	self.m_itemHeight = f25_arg3
	self.m_highlightedItemWidth = f25_arg4
	self.m_highlightedItemHeight = f25_arg5
	self.m_hintTextParams = f25_arg6
	self.m_mouseDragDistance = CoD.CardCarouselList.MouseDragDistance
	self.cardCarouselSize = CoD.CardCarousel.TitleSize + CoD.CardCarousel.SpaceBetweenTitleAndCarousel + CoD.CardCarousel.SpaceBetweenCarouselAndTitleList
	self.addCardCarousel = CoD.CardCarouselList.AddCardCarousel
	self.focusCurrentCardCarousel = CoD.CardCarouselList.FocusCurrentCardCarousel
	self.setInitialCarousel = CoD.CardCarouselList.SetInitialCarousel
	self.setLRSFX = CoD.CardCarouselList.SetLRSFX
	self.setUpSFX = CoD.CardCarouselList.SetUpSFX
	self.setDownSFX = CoD.CardCarouselList.SetDownSFX
	self.setEquipSFX = CoD.CardCarouselList.SetEquipSFX
	self:setLRSFX( CoD.CACUtility.carouselLRSFX )
	self:setUpSFX( CoD.CACUtility.carouselUpSFX )
	self:setDownSFX( CoD.CACUtility.carouselDownSFX )
	self:setEquipSFX( CoD.CACUtility.carouselEquipSFX )
	if self.m_highlightedItemHeight ~= nil then
		self.cardCarouselSize = self.cardCarouselSize + self.m_highlightedItemHeight
	else
		self.cardCarouselSize = self.cardCarouselSize + CoD.CardCarousel.HighlighedItemHeight
	end
	CoD.CardCarouselList.SetupCardCarouselTitleList( self )
	self.leftButtonRepeater = LUI.UIButtonRepeater.new( "left", {
		name = "gamepad_button",
		button = "left",
		down = true
	} )
	self.rightButtonRepeater = LUI.UIButtonRepeater.new( "right", {
		name = "gamepad_button",
		button = "right",
		down = true
	} )
	self.leftButtonRepeater.accelInterval = 300
	self.rightButtonRepeater.accelInterval = 300
	self:addElement( self.leftButtonRepeater )
	self:addElement( self.rightButtonRepeater )
	self:registerEventHandler( "gamepad_button", CoD.CardCarouselList.Gamepad_Button )
	if CoD.useMouse then
		self:setHandleMouse( true )
		self:registerEventHandler( "leftmouseup", CoD.CardCarouselList.LeftMouseUp )
		self:registerEventHandler( "leftmousedown", CoD.CardCarouselList.LeftMouseDown )
		self:registerEventHandler( "mousedrag", CoD.CardCarouselList.MouseDrag )
		self:registerEventHandler( "scroll_to_cardcarousel_title", CoD.CardCarouselList.ScrollToCardCarouselTitle )
		self:registerEventHandler( "auto_scroll", CoD.CardCarouselList.AutoScroll )
	end
	return self
end

CoD.CardCarouselList.AddCardCarousel = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	local f26_local0 = CoD.CardCarousel.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = f26_arg0.cardCarouselSize,
		alpha = 0
	}, f26_arg0.m_itemWidth, f26_arg0.m_itemHeight, f26_arg0.m_highlightedItemWidth, f26_arg0.m_highlightedItemHeight, f26_arg0.m_hintTextParams )
	f26_local0.id = f26_local0.id .. "." .. f26_arg1
	f26_local0.cardCarouselList = f26_arg0
	f26_local0.disablePip = f26_arg2
	f26_local0.title:setText( f26_arg1 )
	f26_local0.titleText = f26_arg1
	f26_local0.shouldShowNewFunction = f26_arg3
	table.insert( f26_arg0.cardCarousels, f26_local0 )
	f26_arg0:addElement( f26_local0 )
	if f26_arg0.lrSFX ~= nil then
		f26_local0:setCardGainFocusSFX( f26_arg0.lrSFX )
	end
	if f26_arg0.equipSFX ~= nil then
		f26_local0:setCardActionSFX( f26_arg0.equipSFX )
	end
	if #f26_arg0.cardCarousels > 1 then
		f26_arg0.titleListContainer.numTitles = f26_arg0.titleListContainer.numTitles + 1
		f26_arg0.titleListContainer:addElement( CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( f26_arg0.titleListContainer, #f26_arg0.cardCarousels - 1, f26_local0, 1 ) )
	end
	return f26_local0
end

CoD.CardCarouselList.GetSelectedCarousel = function ( f27_arg0 )
	return f27_arg0.m_currentCardCarouselIndex
end

CoD.CardCarouselList.AutoScroll = function ( f28_arg0, f28_arg1 )
	if f28_arg0.m_autoScroll then
		if f28_arg0.m_autoScroll ~= f28_arg0.m_currentCardCarouselIndex and not f28_arg0.scrolling then
			CoD.CardCarouselList.ScrollList( f28_arg0, "down" )
		else
			f28_arg0.m_autoScroll = nil
			f28_arg0.m_inputDisabled = nil
		end
	end
end

CoD.CardCarouselList.ScrollToCardCarouselTitle = function ( f29_arg0, f29_arg1 )
	if f29_arg0.m_autoScroll then
		return 
	end
	f29_arg0.m_autoScroll = 1
	f29_arg0.m_inputDisabled = true
	for f29_local0 = 1, #f29_arg0.cardCarousels, 1 do
		if f29_arg1.titleText == f29_arg0.cardCarousels[f29_local0].titleText then
			f29_arg0.m_autoScroll = f29_local0
		end
	end
	CoD.CardCarouselList.AutoScroll( f29_arg0 )
end

CoD.CardCarouselList.LeftMouseUp = function ( f30_arg0, f30_arg1 )
	if f30_arg0.m_mouseDrag then
		f30_arg1.mouseDrag = true
	end
	f30_arg0.m_mouseDrag = nil
	f30_arg0.m_curX = nil
	f30_arg0.m_curY = nil
end

CoD.CardCarouselList.LeftMouseDown = function ( f31_arg0, f31_arg1 )
	f31_arg0.m_curX = f31_arg1.x
	f31_arg0.m_curY = f31_arg1.y
end

CoD.CardCarouselList.MouseDrag = function ( f32_arg0, f32_arg1 )
	if f32_arg0.m_curY == nil then
		return 
	elseif f32_arg0.m_mouseDragDistance < math.abs( f32_arg0.m_curY - f32_arg1.y ) then
		local f32_local0 = nil
		if f32_arg0.m_curY < f32_arg1.y then
			f32_local0 = "up"
		else
			f32_local0 = "down"
		end
		f32_arg0.m_curY = f32_arg1.y
		f32_arg0.m_mouseDrag = true
		if f32_arg0.scrolling == nil or f32_arg0.scrolling == false then
			f32_arg0.scrolling = true
			CoD.CardCarouselList.ScrollList( f32_arg0, f32_local0 )
		end
	end
end

