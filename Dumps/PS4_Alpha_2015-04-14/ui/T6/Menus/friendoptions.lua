require( "T6.Menus.FBPopup" )

CoD.FriendOptions = {}
CoD.FriendOptions.LiveVisible = true
CoD.FriendOptions.FBVisible = true
CoD.FriendOptions.EliteVisible = true
CoD.FriendOptions.ShowAllFriends = function ( controller )
	CoD.FriendOptions.LiveVisible = true
	CoD.FriendOptions.FBVisible = true
	CoD.FriendOptions.EliteVisible = true
	Engine.Exec( controller, "friendsShowLive 1" )
	Engine.Exec( controller, "friendsShowFacebook 1" )
	Engine.Exec( controller, "friendsShowElite 1" )
end

local FriendOptions_XboxLiveSelectionChanged = function ( choiceParams )
	local buttonList = choiceParams.parentSelectorButton:getParent()
	local menu = buttonList:getParent()
	if choiceParams.value == 1 then
		CoD.FriendOptions.LiveVisible = true
		Engine.Exec( menu.m_ownerController, "friendsShowLive 1" )
	else
		CoD.FriendOptions.LiveVisible = false
		Engine.Exec( menu.m_ownerController, "friendsShowLive 0" )
	end
end

local FriendOptions_FBSelectionChanged = function ( choiceParams )
	local buttonList = choiceParams.parentSelectorButton:getParent()
	local menu = buttonList:getParent()
	if choiceParams.value == 1 then
		CoD.FriendOptions.FBVisible = true
		Engine.Exec( menu.m_ownerController, "friendsShowFacebook 1" )
	else
		CoD.FriendOptions.FBVisible = false
		Engine.Exec( menu.m_ownerController, "friendsShowFacebook 0" )
	end
end

local FriendOptions_EliteSelectionChanged = function ( choiceParams )
	local buttonList = choiceParams.parentSelectorButton:getParent()
	local menu = buttonList:getParent()
	if choiceParams.value == 1 then
		CoD.FriendOptions.EliteVisible = true
		Engine.Exec( menu.m_ownerController, "friendsShowElite 1" )
	else
		CoD.FriendOptions.EliteVisible = false
		Engine.Exec( menu.m_ownerController, "friendsShowElite 0" )
	end
end

local FriendOptions_AddSelectorButtonText = function ( controller, button, callback, visFlag )
	if visFlag == true then
		button.strings = {
			"MENU_SHOW_CAPS",
			"MENU_HIDE_CAPS"
		}
		button.values = {
			1,
			0
		}
	else
		button.strings = {
			"MENU_HIDE_CAPS",
			"MENU_SHOW_CAPS"
		}
		button.values = {
			0,
			1
		}
	end
	for index = 1, #button.strings, 1 do
		button:addChoice( controller, Engine.Localize( button.strings[index] ), button.values[index], nil, callback )
	end
end

local FriendOptions_UnlinkFacebook = function ( self, event )
	Engine.Exec( event.controller, "fbUnregister" )
end

local FriendOptions_LinkFacebook = function ( self, event )
	self:openPopup( "FBPopup", event.controller )
end

local FriendOptions_FBStatusChanged = function ( self, event )
	if Engine.IsFacebookLinked( controller ) then
		self:setLabel( Engine.Localize( "MENU_UNLINKFACEBOOK_CAPS" ) )
		self:setActionEventName( "unlink_fb" )
	else
		self:setLabel( Engine.Localize( "MENU_LINKFACEBOOK_CAPS" ) )
		self:setActionEventName( "link_fb" )
	end
end

LUI.createMenu.FriendOptions = function ( controller )
	local friendOptionsMenu = CoD.Menu.NewSmallPopup( "FriendsListOptionsPopup" )
	friendOptionsMenu.m_ownerController = controller
	friendOptionsMenu:addBackButton()
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.ButtonList.DefaultWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 5,
		bottom = 0
	} )
	friendOptionsMenu:addElement( buttonList )
	local liveFriendsBtn = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "XBOXLIVE_FRIENDS_CAPS" ), nil )
	FriendOptions_AddSelectorButtonText( controller, liveFriendsBtn, FriendOptions_XboxLiveSelectionChanged, CoD.FriendOptions.LiveVisible )
	local eliteFriendsBtn = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_ELITE_FRIENDS_CAPS" ), nil )
	FriendOptions_AddSelectorButtonText( controller, eliteFriendsBtn, FriendOptions_EliteSelectionChanged, CoD.FriendOptions.EliteVisible )
	buttonList:addSpacer( CoD.CoD9Button.Height )
	if CoD.useController then
		liveFriendsBtn:processEvent( {
			name = "gain_focus"
		} )
	end
	return friendOptionsMenu
end

