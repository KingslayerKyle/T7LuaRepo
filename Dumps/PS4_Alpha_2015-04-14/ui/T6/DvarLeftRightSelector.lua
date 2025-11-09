require( "ui.T6.LeftRightSelector" )

CoD.DvarLeftRightSelector = {}
local CoD_DvarLeftRightSelector_SelectionChanged = function ( params )
	Engine.SetDvar( params.parentSelectorButton.m_dvarName, params.value )
end

CoD.DvarLeftRightSelector.AddChoice = function ( self, controller, label, dvarValue, extraParams, callbackFunc )
	local selectionChangedCallbackFunc = nil
	if callbackFunc ~= nil then
		selectionChangedCallbackFunc = callbackFunc
	else
		selectionChangedCallbackFunc = CoD_DvarLeftRightSelector_SelectionChanged
	end
	CoD.LeftRightSelector.AddChoice( self, label, selectionChangedCallbackFunc, {
		parentSelectorButton = self,
		value = dvarValue,
		extraParams = extraParams
	} )
end

CoD.DvarLeftRightSelector.getCurrentValue = function ( self )
	return Engine.DvarString( nil, self.m_dvarName )
end

CoD.DvarLeftRightSelector.new = function ( controller, label, dvarName, horizontalGap, defaultAnimationState )
	local currentValue = nil
	if dvarName then
		currentValue = Engine.DvarString( nil, dvarName )
	end
	local selector = CoD.LeftRightSelector.new( label, currentValue, horizontalGap, defaultAnimationState, "cac_grid_nav" )
	selector.m_dvarName = dvarName
	selector.m_currentController = controller
	selector.addChoice = CoD.DvarLeftRightSelector.AddChoice
	selector.getCurrentValue = CoD.DvarLeftRightSelector.getCurrentValue
	return selector
end

