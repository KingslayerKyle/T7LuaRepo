CoD.T6AllocationBar = {}
CoD.T6AllocationBar.NumBars = 10
CoD.T6AllocationBar.BarSpacing = 5
CoD.T6AllocationBar.Height = 20
CoD.T6AllocationBar.BarHeight = 4
CoD.T6AllocationBar.HighlightTime = 400
CoD.T6AllocationBar.New = function ( controller, width, defaultAnimationState )
	local allocationBar = LUI.UIElement.new( defaultAnimationState )
	allocationBar.width = width
	allocationBar.maxAllocation = Engine.GetMaxAllocation( controller )
	CoD.T6AllocationBar.AddBars( allocationBar )
	return allocationBar
end

CoD.AllocationSubtitle.CanAfford = function ( self, cost )
	if self.remainingAllocation < cost then
		return false
	else
		return true
	end
end

CoD.T6AllocationBar.AddBars = function ( self )
	local width = self.width
	local numBars = self.maxAllocation
	local barSpacing = CoD.T6AllocationBar.BarSpacing
	local allocationPerBar = self.maxAllocation / numBars
	local lastBarIndex = numBars - 1
	local barHeight = CoD.T6AllocationBar.BarHeight
	local barWidth = (width - (numBars - 1) * barSpacing) / numBars
	for barIndex = 0, lastBarIndex, 1 do
		local barLeft = barIndex * (barWidth + barSpacing)
		local minAllocation = allocationPerBar * barIndex
		local maxAllocation = minAllocation + allocationPerBar
		local bar = CoD.T6AllocationBar.NewBar( barWidth, minAllocation, maxAllocation )
		bar:setLeftRight( true, false, barLeft, barLeft + barWidth )
		bar:setTopBottom( false, false, -barHeight, barHeight )
		self:addElement( bar )
	end
end

CoD.T6AllocationBar.NewBar = function ( width, minAllocation, maxAllocation )
	local newBar = LUI.UIElement.new()
	newBar.width = width
	local barBackgroundAlpha = 0.35
	newBar.background = LUI.UIImage.new()
	newBar.background:setLeftRight( true, true, 0, 0 )
	newBar.background:setTopBottom( true, true, 0, 0 )
	newBar.background:setAlpha( barBackgroundAlpha )
	newBar.background:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	newBar:addElement( newBar.background )
	newBar.fill = LUI.UIImage.new()
	newBar.fill:setLeftRight( true, true, 0, 0 )
	newBar.fill:setTopBottom( true, true, 0, 0 )
	newBar.fill:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	newBar:addElement( newBar.fill )
	newBar.highlight = LUI.UIImage.new()
	newBar.highlight:setLeftRight( true, true, 1, -1 )
	newBar.highlight:setTopBottom( true, true, 1, -6 )
	newBar.highlight:setRGB( 1, 1, 1 )
	newBar.highlight:setAlpha( 0.5 )
	newBar:addElement( newBar.highlight )
	newBar.minAllocation = minAllocation
	newBar.maxAllocation = maxAllocation
	newBar.allocationRange = newBar.maxAllocation - newBar.minAllocation
	newBar.calculateFillPercent = CoD.T6AllocationBar.CalculateFillPercent
	newBar:registerEventHandler( "update_class", CoD.T6AllocationBar.AllocationChange )
	return newBar
end

CoD.T6AllocationBar.CalculateFillPercent = function ( self, allocation )
	local fillPercent = (allocation - self.minAllocation) / self.allocationRange
	if fillPercent < 0 then
		fillPercent = 0
	elseif fillPercent > 1 then
		fillPercent = 1
	end
	return fillPercent
end

CoD.T6AllocationBar.AllocationChange = function ( self, event )
	local allocationSpent = 0
	if event and event.class then
		allocationSpent = event.class.allocationSpent
	end
	local fillPercentAfter = self:calculateFillPercent( allocationSpent )
	local fillWidth = self.width * fillPercentAfter
	local oldFillPercentAfter = fillPercentAfter
	if CoD.previousAllocationAmount then
		oldFillPercentAfter = self:calculateFillPercent( CoD.previousAllocationAmount )
	end
	self.fill:registerAnimationState( "hide", {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = fillWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self.highlight:registerAnimationState( "hide", {
		leftAnchor = true,
		rightAnchor = false,
		left = 1,
		right = fillWidth - 1,
		topAnchor = true,
		bottomAnchor = true,
		top = 1,
		bottom = -6,
		alpha = 0
	} )
	self.fill:registerAnimationState( "allocation_change", {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = fillWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 1
	} )
	self.highlight:registerAnimationState( "allocation_change", {
		leftAnchor = true,
		rightAnchor = false,
		left = 1,
		right = fillWidth - 1,
		topAnchor = true,
		bottomAnchor = true,
		top = 1,
		bottom = -5,
		alpha = 0.5
	} )
	if oldFillPercentAfter ~= nil and oldFillPercentAfter < fillPercentAfter then
		self.fill:animateToState( "hide" )
		self.highlight:animateToState( "hide" )
		self.fill:animateToState( "allocation_change", CoD.T6AllocationBar.HighlightTime )
		self.highlight:animateToState( "allocation_change", CoD.T6AllocationBar.HighlightTime )
	else
		self.fill:animateToState( "allocation_change" )
		self.highlight:animateToState( "allocation_change" )
	end
end

