require( "ui.T6.LeftRightSelector" )

CoD.ProfileLeftRightSelector = {}
local CoD_ProfileLeftRightSelector_SelectionChanged = function ( params, userRequested )
	if userRequested then
		Engine.SetProfileVar( params.parentSelectorButton.m_currentController, params.parentSelectorButton.m_profileVarName, params.value )
	end
end

CoD.ProfileLeftRightSelector.AddChoice = function ( self, label, value, extraParams, callbackFunc )
	local selectionChangedCallbackFunc = nil
	if callbackFunc ~= nil then
		selectionChangedCallbackFunc = callbackFunc
	else
		selectionChangedCallbackFunc = CoD_ProfileLeftRightSelector_SelectionChanged
	end
	CoD.LeftRightSelector.AddChoice( self, label, selectionChangedCallbackFunc, {
		parentSelectorButton = self,
		value = value,
		extraParams = extraParams
	} )
end

CoD.ProfileLeftRightSelector.getCurrentValue = function ( self )
	return Engine.ProfileValueAsString( self.m_currentController, self.m_profileVarName )
end

CoD.ProfileLeftRightSelector.new = function ( controller, label, profileVarName, horizontalGap, defaultAnimationState, changeSFX )
	local currentValue = Engine.ProfileValueAsString( controller, profileVarName )
	if not changeSFX then
		changeSFX = CoD.LeftRightSelector.ChangeSFX
	end
	local selector = CoD.LeftRightSelector.new( label, currentValue, horizontalGap, defaultAnimationState, changeSFX )
	selector.m_profileVarName = profileVarName
	selector.m_currentController = controller
	selector.addChoice = CoD.ProfileLeftRightSelector.AddChoice
	selector.currentProfileVarValue = Engine.ProfileValueAsString( controller, profileVarName )
	selector.getCurrentValue = CoD.ProfileLeftRightSelector.getCurrentValue
	return selector
end

