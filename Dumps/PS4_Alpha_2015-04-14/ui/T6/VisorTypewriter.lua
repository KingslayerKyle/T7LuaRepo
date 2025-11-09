CoD.VisorTypewriter = {}
CoD.VisorTypewriter.FontName = "ExtraSmall"
CoD.VisorTypewriter.MaxNumberOfLines = 3
CoD.VisorTypewriter.Blue = CoD.visorBlue
CoD.VisorTypewriter.Orange = CoD.trueOrange
CoD.VisorTypewriter.RemoveDuration = 500
CoD.VisorTypewriter.new = function ()
	CoD.VisorTypewriter.ContainerWidth = 300
	CoD.VisorTypewriter.ContainerHeight = 65
	CoD.VisorTypewriter.Font = CoD.fonts[CoD.VisorTypewriter.FontName]
	CoD.VisorTypewriter.FontSize = CoD.textSize[CoD.VisorTypewriter.FontName]
	local visorTextContainerLeftOffset = 15
	local visorTextContainerTopOffset = 8
	local visorTextContainer = LUI.UIElement.new()
	visorTextContainer:setLeftRight( false, true, -CoD.VisorTypewriter.ContainerWidth - visorTextContainerLeftOffset, -visorTextContainerLeftOffset )
	visorTextContainer:setTopBottom( false, false, -CoD.VisorTypewriter.ContainerHeight / 2 - visorTextContainerTopOffset, CoD.VisorTypewriter.ContainerHeight / 2 - visorTextContainerTopOffset )
	visorTextContainer.id = visorTextContainer.id .. ".VisorTextContainer"
	visorTextContainer:registerEventHandler( "hud_add_visor_text", CoD.VisorTypewriter.AddVisorText )
	visorTextContainer:registerEventHandler( "hud_remove_visor_text", CoD.VisorTypewriter.RemoveVisorText )
	visorTextContainer:registerEventHandler( "process_visor_text", CoD.VisorTypewriter.ProcessVisorText )
	visorTextContainer:registerEventHandler( "update_list_layout", CoD.VisorTypewriter.UpdateListLayout )
	visorTextContainer.typewriterElements = {}
	visorTextContainer.curNumLines = 0
	visorTextContainer.totalNumLinesAdded = 0
	return visorTextContainer
end

CoD.VisorTypewriter.AddVisorText = function ( self, event )
	local stringID = event.data[1]
	local textString = Engine.Localize( Engine.GetIString( stringID, "CS_LOCALIZED_STRINGS" ) )
	local textColor = nil
	local textLifetimeDuration = event.data[2] * 1000
	if event.data[3] == 1 then
		textColor = CoD.VisorTypewriter.Blue
	elseif event.data[3] == 2 then
		textColor = CoD.VisorTypewriter.Orange
	end
	local textAlpha = event.data[4] * 0.01
	local textFlash = event.data[5]
	local flickerLowTime = event.data[6]
	local flickerHighTime = event.data[7]
	local textHeight = CoD.VisorTypewriter.FontSize
	local textFont = CoD.VisorTypewriter.Font
	local numLines = Engine.GetNumTextLines( textString, textFont, textHeight, CoD.VisorTypewriter.ContainerWidth )
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( textString, textFont, textHeight )
	local textWidth = textRight + textLeft
	local textAnimationLength = textWidth * 8
	local textContainerHeight = numLines * textHeight
	local textContainerTopOffset = self.totalNumLinesAdded * textHeight
	self.totalNumLinesAdded = self.totalNumLinesAdded + numLines
	local textContainer = LUI.UIElement.new()
	textContainer:setLeftRight( true, true, 0, 0 )
	textContainer:setTopBottom( true, false, textContainerTopOffset, textContainerHeight + textContainerTopOffset )
	textContainer:setAlpha( 0 )
	textContainer.id = textContainer.id .. ".TextContainer"
	self:addElement( textContainer )
	textContainer:registerEventHandler( "remove", CoD.VisorTypewriter.TypeContainer_RemoveAnim )
	textContainer:registerEventHandler( "display_new_text", CoD.VisorTypewriter.DisplayNewText )
	textContainer:registerEventHandler( "update_parent_list", CoD.VisorTypewriter.UpdateParentList )
	if textFlash == 1 then
		textContainer:flicker( 0, textAlpha, nil, textAlpha, flickerLowTime, flickerHighTime )
	end
	textContainer.textContainerTopOffset = textContainerTopOffset
	textContainer.textContainerHeight = textContainerHeight
	textContainer.textString = textString
	textContainer.textAnimationLength = textAnimationLength
	textContainer.textLifetimeDuration = textLifetimeDuration
	textContainer.textAlpha = textAlpha
	textContainer.textFlash = textFlash
	textContainer.flickerLowTime = flickerLowTime
	textContainer.flickerHighTime = flickerHighTime
	textContainer.numLines = numLines
	textContainer.stringID = stringID
	
	local visorTyperwriterText = CoD.TypewriterText.new()
	visorTyperwriterText:setLeftRight( true, true, 0, 0 )
	visorTyperwriterText:setTopBottom( true, false, 0, textHeight )
	visorTyperwriterText:setRGB( textColor.r, textColor.g, textColor.b )
	visorTyperwriterText:setFont( textFont )
	visorTyperwriterText:setAlignment( LUI.Alignment.Right )
	textContainer:addElement( visorTyperwriterText )
	textContainer.visorTyperwriterText = visorTyperwriterText
	
	table.insert( self.typewriterElements, textContainer )
	self:processEvent( {
		name = "process_visor_text"
	} )
end

CoD.VisorTypewriter.ProcessVisorText = function ( self, event )
	if #self.typewriterElements == 0 then
		return 
	end
	for i = 1, #self.typewriterElements, 1 do
		local element = self.typewriterElements[i]
		if not element.beingProcessed then
			if self.curNumLines + element.numLines <= CoD.VisorTypewriter.MaxNumberOfLines then
				element:setAlpha( element.textAlpha )
				if element.textFlash == 1 then
				
				else
					self.curNumLines = self.curNumLines + element.numLines
					element.beingProcessed = true
					element:processEvent( {
						name = "display_new_text"
					} )
					break
				end
				element:flicker( 0, element.textAlpha, nil, element.textAlpha, element.flickerLowTime, element.flickerHighTime )
			end
		end
	end
end

CoD.VisorTypewriter.DisplayNewText = function ( self, event )
	self:addElement( LUI.UITimer.new( 50, {
		name = "typewrite",
		text = self.textString,
		duration = self.textAnimationLength
	}, true, self ) )
	local displayTime = self.textAnimationLength + self.textLifetimeDuration
	self:addElement( LUI.UITimer.new( displayTime, {
		name = "update_parent_list",
		textContainer = self
	}, true, self ) )
end

CoD.VisorTypewriter.UpdateParentList = function ( self, event )
	self:dispatchEventToParent( {
		name = "update_list_layout",
		textContainer = event.textContainer
	} )
end

CoD.VisorTypewriter.UpdateLayout = function ( self, index, numLinesRemoved )
	local textHeight = CoD.VisorTypewriter.FontSize
	local textContainerTopOffset = numLinesRemoved * textHeight
	for i = index, #self.typewriterElements, 1 do
		local element = self.typewriterElements[i]
		local topOffset = element.textContainerTopOffset - textContainerTopOffset
		element:beginAnimation( "update_position", CoD.VisorTypewriter.RemoveDuration )
		element:setTopBottom( true, false, topOffset, topOffset + element.textContainerHeight )
		if element.textFlash == 1 then
			element:flicker( 0, element.textAlpha, nil, element.textAlpha, element.flickerLowTime, element.flickerHighTime )
		end
	end
end

CoD.VisorTypewriter.UpdateListLayout = function ( self, event )
	local elementToRemove = event.textContainer
	if elementToRemove.textLifetimeDuration > 0 then
		local elementNumLines = elementToRemove.numLines
		self.curNumLines = self.curNumLines - elementNumLines
		self.totalNumLinesAdded = self.totalNumLinesAdded - elementNumLines
		elementToRemove.visorTyperwriterText:setAlpha( 0 )
		elementToRemove:beginAnimation( "remove", CoD.VisorTypewriter.RemoveDuration )
		elementToRemove:setLeftRight( true, false, 0, 0 )
		elementToRemove:setTopBottom( true, false, elementToRemove.textContainerTopOffset, 0 )
		local index = 0
		for i = 1, #self.typewriterElements, 1 do
			if self.typewriterElements[i].stringID == elementToRemove.stringID then
				index = i
				break
			end
		end
		if index ~= 0 then
			self.typewriterElements[index]:close()
			table.remove( self.typewriterElements, index )
		end
		local textHeight = CoD.VisorTypewriter.FontSize
		local heightToRemove = elementNumLines * textHeight
		for i = index, #self.typewriterElements, 1 do
			local element = self.typewriterElements[i]
			local topOffset = element.textContainerTopOffset - heightToRemove
			element:beginAnimation( "update_position", CoD.VisorTypewriter.RemoveDuration )
			element:setTopBottom( true, false, topOffset, topOffset + element.textContainerHeight )
			if element.textFlash == 1 then
				element:flicker( 0, element.textAlpha, nil, element.textAlpha, element.flickerLowTime, element.flickerHighTime )
			end
			element.textContainerTopOffset = topOffset
		end
	end
	self:processEvent( {
		name = "process_visor_text"
	} )
end

CoD.VisorTypewriter.RemoveVisorText = function ( self, event )
	local stringID = event.data[1]
	local index = 0
	for i = 1, #self.typewriterElements, 1 do
		if self.typewriterElements[i].stringID == stringID then
			index = i
			break
		end
	end
	if index == 0 then
		DebugPrint( "VisorTypewriter: Could not find the string to be removed." )
		return 
	else
		local textContainer = self.typewriterElements[index]
		textContainer.textLifetimeDuration = 1
		self:processEvent( {
			name = "update_list_layout",
			textContainer = textContainer
		} )
	end
end

