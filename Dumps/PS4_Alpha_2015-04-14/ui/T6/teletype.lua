if CoD == nil then
	CoD = {}
end
local Teletype_AddMessage, Teletype_CharTick, Teletype_LineScrollTick, Teletype_MessageDelayTick, Teletype_PrintChars, Teletype_RemoveText, Teletype_ResetChars, Teletype_Spacing = nil
CoD.Teletype = {}
CoD.Teletype.Height = CoD.textSize.Default
CoD.Teletype.Width = CoD.Teletype.Height
CoD.Teletype.new = function ( defaultAnimationState, boxWidth, boxHeight, charInterval, scrollEnabled, messageInterval, repeatAll, repeatDelay )
	local teletypeTextScroll = LUI.UIScrollable.new( defaultAnimationState, boxWidth, 10000 )
	teletypeTextScroll.verticalList = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = boxWidth,
		bottom = boxHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	teletypeTextScroll:addElement( teletypeTextScroll.verticalList )
	teletypeTextScroll.verticalList:registerEventHandler( "update_spacing", Teletype_Spacing )
	teletypeTextScroll.charTimer = LUI.UITimer.new( charInterval, "teletype_char_tick" )
	LUI.UIElement.addElement( teletypeTextScroll, teletypeTextScroll.charTimer )
	teletypeTextScroll:registerEventHandler( "teletype_char_tick", Teletype_CharTick )
	if scrollEnabled == true then
		teletypeTextScroll.lineScrollTimer = LUI.UITimer.new( messageInterval, "teletype_line_scroll_tick" )
		LUI.UIElement.addElement( teletypeTextScroll, teletypeTextScroll.lineScrollTimer )
		teletypeTextScroll:registerEventHandler( "teletype_line_scroll_tick", Teletype_LineScrollTick )
	end
	teletypeTextScroll:registerEventHandler( "message_delay", Teletype_MessageDelayTick )
	teletypeTextScroll.boxWidth = boxWidth
	teletypeTextScroll.boxHeight = boxHeight
	teletypeTextScroll.itemHeight = CoD.textSize.Condensed
	teletypeTextScroll.font = CoD.fonts.Morris
	teletypeTextScroll.scrollEnabled = scrollEnabled
	teletypeTextScroll.repeatAll = repeatAll
	teletypeTextScroll.repeatDelay = repeatDelay
	teletypeTextScroll.skipFirstScroll = true
	teletypeTextScroll.addMessage = Teletype_AddMessage
	teletypeTextScroll.removeText = Teletype_RemoveText
	teletypeTextScroll.resetChars = Teletype_ResetChars
	teletypeTextScroll.messagesArray = {}
	teletypeTextScroll.currentIndex = 1
	teletypeTextScroll.stringLength = 1
	teletypeTextScroll.lineCount = 1
	return teletypeTextScroll
end

Teletype_AddMessage = function ( self, text, interval, tempLineSpacing )
	local newItem = LUI.UIText.new( {
		left = 0,
		top = 0,
		bottom = self.itemHeight,
		right = self.boxWidth,
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = self.font,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		alignment = LUI.Alignment.Left
	} )
	self.verticalList:addElement( newItem )
	table.insert( self.messagesArray, text )
	newItem.tempLineSpacing = tempLineSpacing
end

Teletype_Spacing = function ( self, event )
	self:registerAnimationState( "update_spacing", {
		spacing = event.spacing
	} )
	self:animateToState( "update_spacing", event.duration )
end

Teletype_MessageDelayTick = function ( self, event )
	LUI.UIElement.addElement( self, self.charTimer )
	if self.scrollEnabled == true then
		LUI.UIElement.addElement( self, self.lineScrollTimer )
	end
	self:resetChars( 0 )
	self.currentIndex = 1
end

Teletype_ResetChars = function ( self, duration )
	local child = self.verticalList:getFirstChild()
	while child ~= nil do
		child:setText( "" )
		child = child:getNextSibling()
	end
	if self.lineScrollTimer ~= nil then
		self:scrollY( 0, 0, true, true )
		self.lineCount = 1
		self.lineScrollTimer:reset()
		self.skipFirstScroll = true
	end
end

Teletype_RemoveText = function ( self, text )
	
end

Teletype_CharTick = function ( self, event )
	if self.messagesArray == nil then
		return 
	end
	local stringText = self.messagesArray[self.currentIndex]
	if stringText == nil then
		return 
	end
	local returnedText = Teletype_PrintChars( stringText, self.stringLength )
	local child = self.verticalList:getFirstChild()
	for childIndex = 2, self.currentIndex, 1 do
		local f7_local2 = childIndex
		child = child:getNextSibling()
	end
	child:setText( returnedText )
	if self.stringLength == #stringText then
		self.stringLength = 1
		if self.currentIndex < #self.messagesArray then
			local spacing = 1
			if child.tempLineSpacing ~= nil then
				spacing = child.tempLineSpacing
			end
			self.verticalList:processEvent( {
				name = "update_spacing",
				spacing = self.itemHeight * spacing,
				duration = 0
			} )
			self.currentIndex = self.currentIndex + 1
		else
			self.charTimer:close()
			if self.lineScrollTimer ~= nil then
				self.lineScrollTimer:close()
			end
			if self.repeatAll == true and self.repeatDelay ~= nil then
				self:addElement( LUI.UITimer.new( self.repeatDelay, "message_delay", true, self ) )
			end
		end
	else
		self.stringLength = self.stringLength + 1
	end
end

Teletype_LineScrollTick = function ( self, event )
	if self.skipFirstScroll == true then
		self.skipFirstScroll = nil
		return 
	elseif self ~= nil then
		self:scrollY( -self.itemHeight * self.lineCount, 1000 )
		self.lineCount = self.lineCount + 1
	end
end

Teletype_PrintChars = function ( str, strLength )
	if str ~= nil then
		return str:sub( 1, strLength )
	else
		
	end
end

