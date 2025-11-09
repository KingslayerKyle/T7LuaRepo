require( "ui.T6.ProfileLeftRightSelector" )

CoD.SearchPreferences = {}
CoD.SearchPreferences.UpdateHint = function ( choiceParams )
	choiceParams.parentSelectorButton.hintText = choiceParams.extraParams.associatedHintText
	local buttonList = choiceParams.parentSelectorButton:getParent()
	if buttonList ~= nil and buttonList.hintText ~= nil then
		buttonList.hintText:updateText( choiceParams.parentSelectorButton.hintText )
	end
end

CoD.SearchPreferences.SelectionChanged = function ( choiceParams )
	Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, choiceParams.value )
	CoD.SearchPreferences.UpdateHint( choiceParams )
end

LUI.createMenu.SearchPreferences = function ( controller )
	local searchPreferencesMenu = CoD.Menu.NewSmallPopup( "SearchPreferences" )
	searchPreferencesMenu:setOwner( controller )
	searchPreferencesMenu:addTitle( Engine.Localize( "MPUI_SEARCH_PREFERENCES_CAPS" ) )
	searchPreferencesMenu:addBackButton()
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.textSize.Big + 20,
		bottom = 0
	} )
	searchPreferencesMenu:addElement( buttonList )
	local searchPreferenceSelector = buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_CONNECTION_TYPE_CAPS" ), "geographicalMatchmaking", "", 260 )
	searchPreferenceSelector:addChoice( Engine.Localize( "MPUI_CONNECTION_BEST_CAPS" ), 1, {
		associatedHintText = Engine.Localize( "MPUI_CONNECTION_BEST_DESC" )
	}, CoD.SearchPreferences.SelectionChanged )
	searchPreferenceSelector:addChoice( Engine.Localize( "MPUI_CONNECTION_NORMAL_CAPS" ), 0, {
		associatedHintText = Engine.Localize( "MPUI_CONNECTION_NORMAL_DESC" )
	}, CoD.SearchPreferences.SelectionChanged )
	searchPreferenceSelector:addChoice( Engine.Localize( "MPUI_CONNECTION_ANY_CAPS" ), 2, {
		associatedHintText = Engine.Localize( "MPUI_CONNECTION_ANY_DESC" )
	}, CoD.SearchPreferences.SelectionChanged )
	searchPreferencesMenu:registerEventHandler( "button_prompt_back", CoD.SearchPreferences.Back )
	if CoD.useController and not searchPreferencesMenu:restoreState() then
		searchPreferenceSelector:processEvent( {
			name = "gain_focus"
		} )
	end
	return searchPreferencesMenu
end

CoD.SearchPreferences.Back = function ( self, event )
	self:saveState()
	self:goBack( event.controller )
end

