require( "ui.uieditor.widgets.Groups.GroupsRosterList" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupMembers" )
end

CoD.RosterTab = InheritFrom( LUI.UIElement )
CoD.RosterTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RosterTab )
	self.id = "RosterTab"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 787 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( 0, 0, 0, 603 )
	BlackTint0:setTopBottom( 0, 0, -87, 829 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1552 )
	Background:setTopBottom( 0, 0, -89, 601 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local noFriends = LUI.UIText.new()
	noFriends:setLeftRight( 0, 0, 712, 1012 )
	noFriends:setTopBottom( 0, 0, 285, 323 )
	noFriends:setAlpha( 0 )
	noFriends:setText( Engine.Localize( "MENU_THERE_ARE_NO_FRIENDS" ) )
	noFriends:setTTF( "fonts/default.ttf" )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noFriends )
	self.noFriends = noFriends
	
	local GroupsRosterList = CoD.GroupsRosterList.new( menu, controller )
	GroupsRosterList:setLeftRight( 0, 0, 18, 596 )
	GroupsRosterList:setTopBottom( 0, 0, -68, 667 )
	GroupsRosterList.onlineList:setDataSource( "SocialPlayersList" )
	self:addElement( GroupsRosterList )
	self.GroupsRosterList = GroupsRosterList
	
	local GroupMemberInfoPane = CoD.Social_InfoPane.new( menu, controller )
	GroupMemberInfoPane:setLeftRight( 0, 0, 641, 1725 )
	GroupMemberInfoPane:setTopBottom( 0, 0, -62, 666 )
	self:addElement( GroupMemberInfoPane )
	self.GroupMemberInfoPane = GroupMemberInfoPane
	
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsRosterList:close()
		self.GroupMemberInfoPane:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

