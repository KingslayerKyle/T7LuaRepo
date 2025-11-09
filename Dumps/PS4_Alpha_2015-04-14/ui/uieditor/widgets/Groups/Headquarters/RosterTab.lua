require( "ui.uieditor.widgets.Groups.GroupsRosterRow" )

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
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1035 )
	Background:setTopBottom( true, false, 0, 460 )
	Background:setRGB( 1, 1, 1 )
	Background:setAlpha( 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local GroupMembersList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	GroupMembersList:makeFocusable()
	GroupMembersList:setLeftRight( true, false, 11, 511 )
	GroupMembersList:setTopBottom( true, false, 11, 447 )
	GroupMembersList:setRGB( 1, 1, 1 )
	GroupMembersList:setDataSource( "LobbyFriends" )
	GroupMembersList:setWidgetType( CoD.GroupsRosterRow )
	GroupMembersList:setVerticalCount( 8 )
	GroupMembersList:setSpacing( 4 )
	self:addElement( GroupMembersList )
	self.GroupMembersList = GroupMembersList
	
	GroupMembersList.id = "GroupMembersList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupMembersList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.GroupMembersList:close()
		CoD.RosterTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

