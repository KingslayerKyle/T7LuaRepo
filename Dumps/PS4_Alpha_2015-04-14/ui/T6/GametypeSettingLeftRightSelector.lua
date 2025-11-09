require( "ui.T6.LeftRightSelector" )

CoD.GametypeSettingLeftRightSelector = {}
CoD.GametypeSettingLeftRightSelector.AddChoice = function ( self, controller, label, value, extraParams, callbackFunc )
	local selectionChangedCallbackFunc = nil
	if callbackFunc ~= nil then
		selectionChangedCallbackFunc = callbackFunc
	else
		selectionChangedCallbackFunc = CoD.GametypeSettingLeftRightSelector.SelectionChanged
	end
	CoD.LeftRightSelector.AddChoice( self, label, selectionChangedCallbackFunc, {
		parentSelectorButton = self,
		value = value,
		extraParams = extraParams
	} )
end

CoD.GametypeSettingLeftRightSelector.SelectionChanged = function ( params )
	local selectorButton = params.parentSelectorButton
	local settingName = selectorButton.m_settingName
	Engine.SetGametypeSetting( settingName, params.value )
	if Engine.IsGametypeSettingDefault( settingName ) then
		selectorButton:showStarIcon( false )
	else
		selectorButton:showStarIcon( true )
	end
end

CoD.GametypeSettingLeftRightSelector.getCurrentValue = function ( self )
	return Engine.GetGametypeSetting( self.m_settingName )
end

CoD.GametypeSettingLeftRightSelector.new = function ( controller, label, settingName, horizontalGap, defaultAnimationState )
	local currentValue = Engine.GetGametypeSetting( settingName )
	local selector = CoD.LeftRightSelector.new( label, currentValue, horizontalGap, defaultAnimationState, "cac_grid_nav" )
	selector.m_settingName = settingName
	selector.addChoice = CoD.GametypeSettingLeftRightSelector.AddChoice
	selector.getCurrentValue = CoD.GametypeSettingLeftRightSelector.getCurrentValue
	return selector
end

