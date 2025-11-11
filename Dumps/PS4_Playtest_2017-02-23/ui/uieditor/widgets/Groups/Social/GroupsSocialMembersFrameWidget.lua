require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
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
	self:setUseStencil( true )
	self:setClass( CoD.GroupsSocialMembersFrameWidget )
	self.id = "GroupsSocialMembersFrameWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 787 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 1, 0, -1168 )
	cacItemTitleGlow0:setTopBottom( 0, 0, 11, 78 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1552 )
	Background:setTopBottom( 0, 0, -10, 680 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local noFriends = LUI.UIText.new()
	noFriends:setLeftRight( 0, 0, 712, 1012 )
	noFriends:setTopBottom( 0, 0, 365, 403 )
	noFriends:setAlpha( 0 )
	noFriends:setText( Engine.Localize( "MENU_THERE_ARE_NO_FRIENDS" ) )
	noFriends:setTTF( "fonts/default.ttf" )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noFriends )
	self.noFriends = noFriends
	
	local GroupsRosterList = CoD.GroupsRosterList.new( menu, controller )
	GroupsRosterList:setLeftRight( 0, 0, -9, 569 )
	GroupsRosterList:setTopBottom( 0, 0, 100, 724 )
	GroupsRosterList.onlineList:setVerticalCount( 6 )
	GroupsRosterList.onlineList:setDataSource( "SocialPlayersList" )
	self:addElement( GroupsRosterList )
	self.GroupsRosterList = GroupsRosterList
	
	local GroupMemberInfoPane = CoD.Social_InfoPane.new( menu, controller )
	GroupMemberInfoPane:setLeftRight( 0, 0, 654, 1725 )
	GroupMemberInfoPane:setTopBottom( 0, 0, 11, 739 )
	self:addElement( GroupMemberInfoPane )
	self.GroupMemberInfoPane = GroupMemberInfoPane
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( 0, 0, 0, 97 )
	GroupEmblem:setTopBottom( 0, 0, 14, 75 )
	GroupEmblem:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupEmblem:setupGroupEmblem( modelValue )
		end
	end )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	local GroupName = LUI.UIText.new()
	GroupName:setLeftRight( 0, 0, 151, 451 )
	GroupName:setTopBottom( 0, 0, 22, 67 )
	GroupName:setRGB( 0, 0, 0 )
	GroupName:setTTF( "fonts/default.ttf" )
	GroupName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupName:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
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
		self.cacItemTitleGlow0:close()
		self.GroupsRosterList:close()
		self.GroupMemberInfoPane:close()
		self.GroupEmblem:close()
		self.GroupName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

