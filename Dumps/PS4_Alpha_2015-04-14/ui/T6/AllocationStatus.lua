CoD.AllocationStatus = {}
CoD.AllocationStatus.StatusFontName = "Condensed"
CoD.AllocationStatus.StatusFont = CoD.fonts[CoD.AllocationStatus.StatusFontName]
CoD.AllocationStatus.StatusFontHeight = CoD.textSize[CoD.AllocationStatus.StatusFontName]
CoD.AllocationStatus.Width = 100
CoD.AllocationStatus.Height = CoD.AllocationStatus.StatusFontHeight
CoD.AllocationStatus.new = function ( controller, defaultAnimationState )
	local allocationStatus = LUI.UIElement.new( defaultAnimationState )
	allocationStatus.id = "AllocationStatus"
	allocationStatus.maxAllocation = Engine.GetMaxAllocation( controller )
	allocationStatus.text = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		font = CoD.AllocationStatus.StatusFont
	} )
	allocationStatus.text:registerAnimationState( "under_budget", {
		red = CoD.orange.r,
		green = CoD.orange.g,
		blue = CoD.orange.b
	} )
	allocationStatus.text:registerAnimationState( "over_budget", {
		red = 1,
		green = 0.5,
		blue = 0.5
	} )
	allocationStatus.text:registerAnimationState( "over_budget_flash", {
		red = 1,
		green = 0,
		blue = 0
	} )
	allocationStatus.text:registerEventHandler( "transition_complete_over_budget", CoD.AllocationStatus.Text_OverBudget )
	allocationStatus.text:registerEventHandler( "transition_complete_over_budget_flash", CoD.AllocationStatus.Text_OverBudgetFlash )
	allocationStatus:addElement( allocationStatus.text )
	allocationStatus:registerEventHandler( "update_class", CoD.AllocationStatus.Update )
	return allocationStatus
end

CoD.AllocationStatus.Update = function ( self, event )
	if self.maxAllocation < event.class.allocationSpent then
		if not self.overBudget then
			self.overBudget = true
			self.text:animateToState( "over_budget_flash" )
		end
		self.text:setText( "OVER BUDGET " .. event.class.allocationSpent .. "/" .. self.maxAllocation )
	else
		if self.overBudget then
			self.overBudget = nil
			self.text:animateToState( "under_budget" )
		end
		self.text:setText( event.class.allocationSpent .. "/" .. self.maxAllocation )
	end
end

CoD.AllocationStatus.Text_OverBudget = function ( self, event )
	if not event.interrupted then
		self:animateToState( "over_budget_flash", 150 )
	end
end

CoD.AllocationStatus.Text_OverBudgetFlash = function ( self, event )
	if not event.interrupted then
		self:animateToState( "over_budget", 300 )
	end
end

