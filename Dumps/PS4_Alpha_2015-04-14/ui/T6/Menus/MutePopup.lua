CoD.MutePopup = {}
LUI.createMenu.Mute = function ( controller )
	local muteMenu = CoD.Menu.NewSmallPopup( "Mute" )
	muteMenu.m_ownerController = controller
	muteMenu:addTitle( Engine.ToUpper( Engine.Localize( "MENU_MUTING" ) ) )
	muteMenu:addSelectButton()
	muteMenu:addBackButton()
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.textSize.Big + 30,
		bottom = 0
	} )
	muteMenu:addElement( buttonList )
	local allExceptParty = buttonList:addButton( Engine.Localize( "MENU_MUTE_ALL_EXCEPT_PARTY_CAPS" ), Engine.Localize( "MENU_MUTE_ALL_EXCEPT_PARTY_DESC" ) )
	allExceptParty:setActionEventName( "mute_all_but_party" )
	muteMenu:registerEventHandler( "mute_all_but_party", CoD.MutePopup.MuteAllButParty )
	local unmuteAll = buttonList:addButton( Engine.Localize( "MENU_UNMUTE_ALL_CAPS" ), Engine.Localize( "MENU_UNMUTE_ALL_DESC" ) )
	unmuteAll:setActionEventName( "unmute_all" )
	muteMenu:registerEventHandler( "unmute_all", CoD.MutePopup.UnmuteAll )
	if CoD.useController then
		allExceptParty:processEvent( {
			name = "gain_focus"
		} )
	end
	Engine.PlaySound( "cac_loadout_edit_sel" )
	return muteMenu
end

CoD.MutePopup.MuteAll = function ( self, event )
	Engine.PartyMuteAll()
	self:goBack( event.controller )
end

CoD.MutePopup.MuteAllButParty = function ( self, event )
	Engine.PartyMuteAllButParty( event.controller )
	self:goBack( event.controller )
end

CoD.MutePopup.UnmuteAll = function ( self, event )
	Engine.PartyUnmuteAll()
	self:goBack( event.controller )
end

