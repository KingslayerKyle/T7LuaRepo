require( "ui.T6.ProfileLeftRightSelector" )

CoD.SearchPreferences = {}
CoD.SearchPreferences.UpdateHint = function ( f1_arg0 )
	f1_arg0.parentSelectorButton.hintText = f1_arg0.extraParams.associatedHintText
	local f1_local0 = f1_arg0.parentSelectorButton:getParent()
	if f1_local0 ~= nil and f1_local0.hintText ~= nil then
		f1_local0.hintText:updateText( f1_arg0.parentSelectorButton.hintText )
	end
end

CoD.SearchPreferences.SelectionChanged = function ( f2_arg0 )
	Engine.SetProfileVar( f2_arg0.parentSelectorButton.m_currentController, f2_arg0.parentSelectorButton.m_profileVarName, f2_arg0.value )
	CoD.SearchPreferences.UpdateHint( f2_arg0 )
end

LUI.createMenu.SearchPreferences = function ( f3_arg0 )
	local f3_local0 = CoD.Menu.NewSmallPopup( "SearchPreferences" )
	f3_local0:setOwner( f3_arg0 )
	f3_local0:addTitle( Engine.Localize( "MPUI_SEARCH_PREFERENCES_CAPS" ) )
	f3_local0:addBackButton()
	local f3_local1 = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.textSize.Big + 20,
		bottom = 0
	} )
	f3_local0:addElement( f3_local1 )
	local f3_local2 = f3_local1:addProfileLeftRightSelector( f3_arg0, Engine.Localize( "MPUI_CONNECTION_TYPE_CAPS" ), "geographicalMatchmaking", "", 260 )
	f3_local2:addChoice( Engine.Localize( "MPUI_CONNECTION_BEST_CAPS" ), 1, {
		associatedHintText = Engine.Localize( "MPUI_CONNECTION_BEST_DESC" )
	}, CoD.SearchPreferences.SelectionChanged )
	f3_local2:addChoice( Engine.Localize( "MPUI_CONNECTION_NORMAL_CAPS" ), 0, {
		associatedHintText = Engine.Localize( "MPUI_CONNECTION_NORMAL_DESC" )
	}, CoD.SearchPreferences.SelectionChanged )
	f3_local2:addChoice( Engine.Localize( "MPUI_CONNECTION_ANY_CAPS" ), 2, {
		associatedHintText = Engine.Localize( "MPUI_CONNECTION_ANY_DESC" )
	}, CoD.SearchPreferences.SelectionChanged )
	f3_local0:registerEventHandler( "button_prompt_back", CoD.SearchPreferences.Back )
	if CoD.useController and not f3_local0:restoreState() then
		f3_local2:processEvent( {
			name = "gain_focus"
		} )
	end
	return f3_local0
end

CoD.SearchPreferences.Back = function ( f4_arg0, f4_arg1 )
	f4_arg0:saveState()
	f4_arg0:goBack( f4_arg1.controller )
end

