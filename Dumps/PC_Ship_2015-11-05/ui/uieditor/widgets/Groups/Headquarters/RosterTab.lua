require( "ui.uieditor.widgets.Groups.GroupsRosterList" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )

local PreLoadFunc = function ( self, controller )
	SetFriendsTabName( self, {
		tabId = "roster"
	}, controller )
end

CoD.RosterTab = InheritFrom( LUI.UIElement )
CoD.RosterTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.RosterTab )
	self.id = "RosterTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1035 )
	Background:setTopBottom( true, false, -6.5, 453.5 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local noFriends = LUI.UIText.new()
	noFriends:setLeftRight( true, false, 475, 675 )
	noFriends:setTopBottom( true, false, 243.5, 268.5 )
	noFriends:setAlpha( 0 )
	noFriends:setText( Engine.Localize( "MENU_THERE_ARE_NO_FRIENDS" ) )
	noFriends:setTTF( "fonts/default.ttf" )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noFriends )
	self.noFriends = noFriends
	
	local GroupsRosterList = CoD.GroupsRosterList.new( menu, controller )
	GroupsRosterList:setLeftRight( true, false, 20, 405 )
	GroupsRosterList:setTopBottom( true, false, 7.5, 497.5 )
	GroupsRosterList.onlineList:setDataSource( "GroupMembers" )
	self:addElement( GroupsRosterList )
	self.GroupsRosterList = GroupsRosterList
	
	local GroupMemberInfoPane = CoD.Social_InfoPane.new( menu, controller )
	GroupMemberInfoPane:setLeftRight( true, false, 436, 1222 )
	GroupMemberInfoPane:setTopBottom( true, false, 7.5, 492.5 )
	GroupMemberInfoPane:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		GroupMemberInfoPane:setModel( model, controller )
	end )
	self:addElement( GroupMemberInfoPane )
	self.GroupMemberInfoPane = GroupMemberInfoPane
	
	GroupsRosterList.navigation = {
		right = GroupMemberInfoPane
	}
	GroupMemberInfoPane.navigation = {
		left = GroupsRosterList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	GroupsRosterList.id = "GroupsRosterList"
	GroupMemberInfoPane.id = "GroupMemberInfoPane"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupsRosterList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsRosterList:close()
		element.GroupMemberInfoPane:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

