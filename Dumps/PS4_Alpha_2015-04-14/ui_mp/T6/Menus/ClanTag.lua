CoD.ClanTag = {}
CoD.ClanTag.AddButton = function ( self, buttonText, onActionEvent )
	local button = self.buttonList:addButton( buttonText )
	button.selectedbuttonIcon = LUI.UIImage.new( {
		left = -25,
		top = 8,
		right = -9,
		bottom = -8,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = CoD.green.r,
		green = CoD.green.g,
		blue = CoD.green.b,
		alpha = 0
	} )
	button.selectedbuttonIcon:registerAnimationState( "selected", {
		alpha = 1
	} )
	button:addElement( button.selectedbuttonIcon )
	button:registerEventHandler( "button_action", onActionEvent )
	return button
end

CoD.ClanTag.PrepareButtonList = function ( self, controller )
	local BUTTONLIST_X = 20
	local BUTTONLIST_Y = 60
	local BUTTONLIST_HEIGHT = 350
	local BUTTONLIST_WIDTH = 300
	local editClanTagText = LUI.UIText.new( {
		left = BUTTONLIST_X,
		top = BUTTONLIST_Y - 30,
		right = BUTTONLIST_X + BUTTONLIST_WIDTH,
		bottom = BUTTONLIST_Y - 5,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	editClanTagText:setText( Engine.Localize( "MPUI_EDIT_CLAN_TAG_CAPS" ) )
	self:addElement( editClanTagText )
	self.buttonList = CoD.ButtonList.new( {
		left = BUTTONLIST_X,
		top = BUTTONLIST_Y,
		right = BUTTONLIST_X + BUTTONLIST_WIDTH,
		bottom = BUTTONLIST_Y + BUTTONLIST_HEIGHT,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	self:addElement( self.buttonList )
	self.clanName = CoD.ClanTag.GetClanName( controller )
	local displayedClanName = self.clanName
	if displayedClanName == "" then
		displayedClanName = Engine.Localize( "MPUI_CREATE_CLAN_TAG_CAPS" )
	end
	self.clanButton = CoD.ClanTag.AddButton( self, displayedClanName, CoD.ClanTag.Button_EditClanTag )
	local clanTagColorText = LUI.UIText.new( {
		left = BUTTONLIST_X,
		top = BUTTONLIST_Y + 60,
		right = BUTTONLIST_X + BUTTONLIST_WIDTH,
		bottom = BUTTONLIST_Y + 85,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	clanTagColorText:setText( Engine.Localize( "MPUI_CLAN_TAG_COLOR_CAPS" ) )
	self:addElement( clanTagColorText )
	self.buttonList:addSpacer( 60 )
	self.clanTags = {}
	CoD.ClanTag.CreateClanTagColorButtons( controller, self, 1, Engine.GetClanTagFeatureCount( controller ) )
	self.buttonList:processEvent( {
		name = "gain_focus"
	} )
end

CoD.ClanTag.RefreshClanTagColorButtons = function ( clanTagMenu, controller )
	local selectedclanTagFeatureIndex = tonumber( CoD.ClanTag.GetSelectedClanTagFeature( controller ) )
	for i = 1, Engine.GetClanTagFeatureCount( controller ), 1 do
		local clanTagName = Engine.GetClanTagFeatureName( i )
		if selectedclanTagFeatureIndex == i then
			clanTagMenu.clanTags[clanTagName].button.selectedbuttonIcon:animateToState( "selected" )
		else
			clanTagMenu.clanTags[clanTagName].button.selectedbuttonIcon:animateToState( "default" )
		end
	end
end

CoD.ClanTag.RefreshClanTag = function ( self, event )
	local currClanName = CoD.ClanTag.GetClanName( event.controller )
	if self.clanName ~= currClanName then
		if currClanName == "" then
			self.clanButton:setLabel( Engine.Localize( "MPUI_CREATE_CLAN_TAG_CAPS" ) )
		else
			self.clanButton:setLabel( currClanName )
		end
		self.clanName = currClanName
	end
	CoD.ClanTag.RefreshClanTagColorButtons( self, event.controller )
end

CoD.ClanTag.Button_EditClanTag = function ( self, event )
	Engine.Exec( event.controller, "editclanname" )
end

CoD.ClanTag.Button_ClanTagColor = function ( self, event )
	Engine.Exec( event.controller, "setClanTag " .. self.index )
end

CoD.ClanTag.CreateClanTagColorButtons = function ( controller, clanTagMenu, firstIndex, lastIndex )
	local selectedclanTagFeatureIndex = tonumber( CoD.ClanTag.GetSelectedClanTagFeature( controller ) )
	for i = firstIndex, lastIndex, 1 do
		local clanTagName = Engine.GetClanTagFeatureName( i )
		local localizedName = Engine.Localize( "MPUI_CLANTAG_" .. clanTagName )
		clanTagMenu.clanTags[clanTagName] = {}
		if selectedclanTagFeatureIndex == i then
			clanTagMenu.clanTags[clanTagName].button = CoD.ClanTag.AddButton( clanTagMenu, localizedName, CoD.ClanTag.Button_ClanTagColor )
			clanTagMenu.clanTags[clanTagName].button.selectedbuttonIcon:animateToState( "selected" )
		else
			clanTagMenu.clanTags[clanTagName].button = CoD.ClanTag.AddButton( clanTagMenu, localizedName, CoD.ClanTag.Button_ClanTagColor )
		end
		clanTagMenu.clanTags[clanTagName].button.index = i
		clanTagMenu.clanTags[clanTagName].button:registerEventHandler( "button_action", CoD.ClanTag.Button_ClanTagColor )
	end
end

CoD.ClanTag.GetSelectedClanTagFeature = function ( controller )
	local clanName = Engine.GetClanName( controller )
	return string.sub( clanName, 3, 3 )
end

CoD.ClanTag.GetClanName = function ( controller )
	local clanName = Engine.GetClanName( controller )
	if string.match( clanName, "^%[%^7" ) then
		return string.sub( clanName, 4, -2 )
	else
		return string.sub( clanName, 2, -2 )
	end
end

LUI.createMenu.ClanTag = function ( controller )
	local clanTagMenu = CoD.Menu.New( "ClanTag" )
	clanTagMenu:addLargePopupBackground()
	clanTagMenu:registerEventHandler( "refresh_clantag", CoD.ClanTag.RefreshClanTag )
	clanTagMenu:addBackButton()
	clanTagMenu:addSelectButton()
	CoD.ClanTag.PrepareButtonList( clanTagMenu, controller )
	return clanTagMenu
end

