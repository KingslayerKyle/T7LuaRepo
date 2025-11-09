require( "ui.uieditor.widgets.Groups.GroupsRosterList" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )

local PreLoadFunc = function ( self, controller )
	SetFriendsTabName( self, {
		tabId = "roster"
	}, controller )
end

CoD.GroupsSocialMembersFrameWidget = InheritFrom( LUI.UIElement )
CoD.GroupsSocialMembersFrameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialMembersFrameWidget )
	self.id = "GroupsSocialMembersFrameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, -16, 388 )
	BlackTint:setTopBottom( true, false, -22, 560 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
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
	GroupsRosterList:setLeftRight( true, false, -6, 379 )
	GroupsRosterList:setTopBottom( true, false, 66.5, 482.5 )
	GroupsRosterList.onlineList:setVerticalCount( 6 )
	GroupsRosterList.onlineList:setDataSource( "SocialPlayersList" )
	self:addElement( GroupsRosterList )
	self.GroupsRosterList = GroupsRosterList
	
	local GroupMemberInfoPane = CoD.Social_InfoPane.new( menu, controller )
	GroupMemberInfoPane:setLeftRight( true, false, 413, 1127 )
	GroupMemberInfoPane:setTopBottom( true, false, 7.5, 492.5 )
	self:addElement( GroupMemberInfoPane )
	self.GroupMemberInfoPane = GroupMemberInfoPane
	
	local Banner = LUI.UIImage.new()
	Banner:setLeftRight( true, false, 1, 372 )
	Banner:setTopBottom( true, false, 9.5, 50 )
	Banner:setRGB( 0, 0, 0 )
	Banner:setAlpha( 0.7 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local GroupName = LUI.UIText.new()
	GroupName:setLeftRight( true, false, 100.5, 300.5 )
	GroupName:setTopBottom( true, false, 14.75, 44.75 )
	GroupName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GroupName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupName:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			GroupName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( true, false, 1, 65.52 )
	GroupEmblem:setTopBottom( true, false, 9.5, 50 )
	GroupEmblem:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local groupId = Engine.GetModelValue( model )
		if groupId then
			GroupEmblem:setupGroupEmblem( groupId )
		end
	end )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	GroupMemberInfoPane:linkToElementModel( GroupsRosterList.onlineList, nil, false, function ( model )
		GroupMemberInfoPane.presence:setModel( model, controller )
	end )
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
		element.GroupName:close()
		element.GroupEmblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

