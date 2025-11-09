require( "ui.T6.CoD9Button" )
require( "ui.T6.ButtonList" )
require( "ui.T6.MFSlide" )

CoD.AccordionGroups = {}
CoD.AccordionGroups.RowHeight = CoD.CoD9Button.Height
CoD.AccordionGroups.Spacing = 2
CoD.AccordionGroups.ExpandTime = 150
CoD.AccordionGroups.SectionHeight = 90
CoD.AccordionGroups.TextLeft = 20
CoD.AccordionGroups.new = function ()
	local accordionGroups = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 100,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	} )
	accordionGroups.rowHeight = CoD.AccordionGroups.RowHeight
	accordionGroups.textLeft = CoD.AccordionGroups.TextLeft
	accordionGroups.textHeight = CoD.CoD9Button.TextHeight
	accordionGroups.spacing = CoD.AccordionGroups.Spacing
	accordionGroups.sectionHeight = CoD.AccordionGroups.SectionHeight
	accordionGroups.addGroup = CoD.AccordionGroups.AddGroup
	accordionGroups.getMaxHeight = CoD.AccordionGroups.GetMaxHeight
	accordionGroups.handleGamepadButton = CoD.AccordionGroups.HandleGamepadButton
	return accordionGroups
end

CoD.AccordionGroups.GetMaxHeight = function ( self )
	return self.m_numGroups * self.rowHeight + (self.m_numGroups - 1) * self.spacing + self.sectionHeight
end

CoD.AccordionGroups.AddGroup = function ( self, label )
	if self.m_groups == nil then
		self.m_groups = {}
	end
	local rowHeader = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = self.rowHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	} )
	self:addElement( rowHeader )
	rowHeader.background = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = CoD.CoD9Button.BackgroundColor.r,
		green = CoD.CoD9Button.BackgroundColor.g,
		blue = CoD.CoD9Button.BackgroundColor.b,
		alpha = CoD.CoD9Button.BackgroundColor.a
	} )
	rowHeader:addElement( rowHeader.background )
	rowHeader.label = LUI.UIText.new( {
		left = self.textLeft,
		top = -self.textHeight / 2,
		right = 0,
		bottom = self.textHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	} )
	rowHeader:addElement( rowHeader.label )
	rowHeader.label:setText( label )
	local groupContainer = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false
	} )
	groupContainer:setUseStencil( true )
	groupContainer.m_inputDisabled = true
	groupContainer:registerAnimationState( "expanded", {
		top = -self.sectionHeight / 2,
		bottom = self.sectionHeight / 2,
		topAnchor = false,
		bottomAnchor = false
	} )
	self:addElement( groupContainer )
	groupContainer.background = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = CoD.MFSlide.SlideColor.r,
		green = CoD.MFSlide.SlideColor.g,
		blue = CoD.MFSlide.SlideColor.b,
		alpha = CoD.MFSlide.SlideColor.a
	} )
	groupContainer:addElement( groupContainer.background )
	groupContainer.topShadow = CoD.EdgeShadow.new( "top", true )
	groupContainer.topShadow:setPriority( 100 )
	groupContainer:addElement( groupContainer.topShadow )
	groupContainer.bottomShadow = CoD.EdgeShadow.new( "bottom", true )
	groupContainer.bottomShadow:setPriority( 100 )
	groupContainer:addElement( groupContainer.bottomShadow )
	if self.m_numGroups == nil then
		self.m_numGroups = 0
		self.m_currentGroup = 1
		groupContainer:animateToState( "expanded" )
		groupContainer.m_inputDisabled = nil
	end
	self.m_numGroups = self.m_numGroups + 1
	self:addSpacer( self.spacing )
	table.insert( self.m_groups, {
		rowHeader = rowHeader,
		section = groupContainer
	} )
	return groupContainer
end

CoD.AccordionGroups.HandleGamepadButton = function ( self, event )
	if LUI.UIElement.handleGamepadButton( self, event ) == true then
		return true
	end
	local scrollDirection = nil
	if event.down == true then
		if event.button == "up" then
			scrollDirection = -1
		elseif event.button == "down" then
			scrollDirection = 1
		end
	end
	if scrollDirection ~= nil and self.m_currentGroup ~= nil then
		local oldGroup = self.m_currentGroup
		self.m_currentGroup = LUI.clamp( self.m_currentGroup + scrollDirection, 1, self.m_numGroups )
		if oldGroup ~= self.m_currentGroup then
			self.m_groups[oldGroup].section:animateToState( "default", CoD.AccordionGroups.ExpandTime, true, true )
			self.m_groups[oldGroup].section.m_inputDisabled = true
			self.m_groups[self.m_currentGroup].section:animateToState( "expanded", CoD.AccordionGroups.ExpandTime, true, true )
			self.m_groups[self.m_currentGroup].section.m_inputDisabled = nil
		end
	end
end

