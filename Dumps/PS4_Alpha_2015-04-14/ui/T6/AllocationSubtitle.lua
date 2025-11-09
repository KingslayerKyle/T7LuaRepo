CoD.AllocationSubtitle = {}
CoD.AllocationSubtitle.ArrowMaterial = RegisterMaterial( "ui_arrow_right" )
CoD.AllocationSubtitle.ChangeFadeTime = 500
CoD.AllocationSubtitle.MaxAllocation = CoD.MaxAllocation
CoD.AllocationSubtitle.NumBars = 10
CoD.AllocationSubtitle.BarSpacing = 3
CoD.AllocationSubtitle.Height = 50
CoD.AllocationSubtitle.new = function ( width, defaultAnimationState )
	local allocationSubtitle = LUI.UIElement.new( defaultAnimationState )
	allocationSubtitle.width = width
	local pointsText = LUI.UIText.new( {
		left = 0,
		top = -CoD.textSize.Default,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0,
		green = 0,
		blue = 0
	} )
	pointsText:setText( Engine.Localize( "MENU_COMBAT_LOAD_CAPS" ) )
	if CoD.isSinglePlayer == false then
		allocationSubtitle:addElement( pointsText )
	end
	if CoD.isSinglePlayer == false then
		CoD.AllocationSubtitle.AddBars( allocationSubtitle )
	end
	local remainingAllocationLabel = LUI.UIText.new( {
		left = 0,
		top = -CoD.textSize.Default,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		red = 0,
		green = 0,
		blue = 0
	} )
	allocationSubtitle.remainingAllocationLabel = remainingAllocationLabel
	if CoD.isSinglePlayer == false then
		allocationSubtitle:addElement( remainingAllocationLabel )
	end
	local bonusLabelTop = -250
	local bonusLabelLeft = -500
	local bonusLabelBottom = bonusLabelTop + CoD.textSize.Default
	allocationSubtitle.xpBonusLabel = LUI.UIText.new( {
		left = bonusLabelLeft,
		top = bonusLabelTop,
		right = 0,
		bottom = bonusLabelBottom,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	allocationSubtitle.xpBonusLabel:registerAnimationState( "hide", {
		alpha = 0
	} )
	allocationSubtitle.xpBonusLabel:registerAnimationState( "show", {
		alpha = 1
	} )
	allocationSubtitle:addElement( allocationSubtitle.xpBonusLabel )
	local bonusTextTop = bonusLabelBottom
	local bonusTextBottom = bonusTextTop + CoD.textSize.Big
	allocationSubtitle.xpBonusText = LUI.UIText.new( {
		left = bonusLabelLeft,
		top = bonusTextTop,
		right = 0,
		bottom = bonusTextBottom,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Big
	} )
	allocationSubtitle.xpBonusText:registerAnimationState( "hide", {
		alpha = 0
	} )
	allocationSubtitle.xpBonusText:registerAnimationState( "show", {
		alpha = 1
	} )
	allocationSubtitle:addElement( allocationSubtitle.xpBonusText )
	allocationSubtitle.setRemainingAllocation = CoD.AllocationSubtitle.SetRemainingAllocation
	allocationSubtitle.setAllocationChange = CoD.AllocationSubtitle.SetAllocationChange
	allocationSubtitle.commitChange = CoD.AllocationSubtitle.CommitChange
	allocationSubtitle.canAfford = CoD.AllocationSubtitle.CanAfford
	if CoD.isSinglePlayer == false then
		allocationSubtitle:setRemainingAllocation( CoD.AllocationSubtitle.MaxAllocation )
	end
	return allocationSubtitle
end

CoD.AllocationSubtitle.SetRemainingAllocation = function ( self, remainingAllocation, animationDuration )
	if self.remainingAllocation == nil then
		self.remainingAllocation = remainingAllocation
	end
	self:processEvent( {
		name = "allocation_change",
		before = CoD.AllocationSubtitle.MaxAllocation - self.remainingAllocation,
		after = CoD.AllocationSubtitle.MaxAllocation - remainingAllocation,
		duration = animationDuration
	} )
	self.remainingAllocation = remainingAllocation
	self.remainingAllocationLabel:setText( CoD.AllocationSubtitle.MaxAllocation - self.remainingAllocation .. "/" .. CoD.AllocationSubtitle.MaxAllocation )
	local xpBonusPercentage = math.floor( self.remainingAllocation / CoD.AllocationSubtitle.MaxAllocation * CoD.MaxAllocationBonus * 100 )
	self.xpBonusLabel:setText( "Unallocated combat load XP bonus: " )
	self.xpBonusText:setText( "+" .. xpBonusPercentage .. "%" )
	if CoD.isSinglePlayer == true then
		self.xpBonusLabel:close()
		self.xpBonusText:close()
	end
end

CoD.AllocationSubtitle.SetAllocationChange = function ( self, allocationChange, animationDuration )
	if allocationChange == nil then
		self.allocationWithChange = nil
	else
		local remainingAllocation = self.remainingAllocation
		if remainingAllocation < -allocationChange then
			allocationChange = -remainingAllocation
		end
		local allocationWithChange = remainingAllocation + allocationChange
		self.allocationWithChange = allocationWithChange
	end
	return allocationChange
end

CoD.AllocationSubtitle.CommitChange = function ( self )
	local allocationWithChange = self.allocationWithChange
	if allocationWithChange ~= nil then
		local previousAllocation = self.remainingAllocation
		self:setRemainingAllocation( allocationWithChange, CoD.AllocationSubtitle.ChangeFadeTime )
		self:setAllocationChange( nil, CoD.AllocationSubtitle.ChangeFadeTime )
	end
end

CoD.AllocationSubtitle.CanAfford = function ( self, cost )
	if self.remainingAllocation < cost then
		return false
	else
		return true
	end
end

CoD.AllocationSubtitle.AddBars = function ( self )
	local width = self.width
	local numBars = CoD.AllocationSubtitle.NumBars
	local barSpacing = CoD.AllocationSubtitle.BarSpacing
	local barWidth = (width - (numBars - 1) * barSpacing) / numBars
	local allocationPerBar = CoD.AllocationSubtitle.MaxAllocation / numBars
	local lastBarIndex = numBars - 1
	for barIndex = 0, lastBarIndex, 1 do
		local barLeft = barIndex * (barWidth + barSpacing)
		local minAllocation = allocationPerBar * barIndex
		local maxAllocation = minAllocation + allocationPerBar
		local bar = CoD.AllocationSubtitle.NewBar( barWidth, minAllocation, maxAllocation, {
			left = barLeft,
			top = 0,
			right = barLeft + barWidth,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		} )
		self:addElement( bar )
	end
end

CoD.AllocationSubtitle.NewBar = function ( width, minAllocation, maxAllocation, defaultAnimationState )
	local self = LUI.UIElement.new( defaultAnimationState )
	self.width = width
	local barBackgroundAlpha = 0.6
	self:addElement( LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = barBackgroundAlpha
	} ) )
	self.fill = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 0
	} )
	self:addElement( self.fill )
	self.minAllocation = minAllocation
	self.maxAllocation = maxAllocation
	self.allocationRange = self.maxAllocation - self.minAllocation
	self.calculateFillPercent = CoD.AllocationSubtitle.Bar_CalculateFillPercent
	self:registerEventHandler( "allocation_change", CoD.AllocationSubtitle.Bar_AllocationChange )
	self:registerEventHandler( "delayed_allocation_change", CoD.AllocationSubtitle.Bar_DelayedAllocationChange )
	return self
end

CoD.AllocationSubtitle.Bar_CalculateFillPercent = function ( self, allocation )
	local fillPercent = (allocation - self.minAllocation) / self.allocationRange
	if fillPercent < 0 then
		fillPercent = 0
	elseif fillPercent > 1 then
		fillPercent = 1
	end
	return fillPercent
end

CoD.AllocationSubtitle.Bar_AllocationChange = function ( self, event )
	local fillPercentAfter = self:calculateFillPercent( event.after )
	local fillWidth = self.width * fillPercentAfter
	self.fill:registerAnimationState( "allocation_change", {
		left = 0,
		top = 0,
		right = fillWidth,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	self.fill:animateToState( "allocation_change" )
end

