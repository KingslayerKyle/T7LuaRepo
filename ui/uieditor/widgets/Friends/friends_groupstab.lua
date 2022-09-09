-- 69d494237fbc2e70f37e1a9f87698c32
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Friends.FriendsListRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbarNew" )

CoD.Friends_GroupsTab = InheritFrom( LUI.UIElement )
CoD.Friends_GroupsTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Friends_GroupsTab )
	self.id = "Friends_GroupsTab"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 564 )
	self:setTopBottom( true, false, 0, 460 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local listGroups = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	listGroups:makeFocusable()
	listGroups:setLeftRight( true, false, 32, 532 )
	listGroups:setTopBottom( false, false, -197, 197 )
	listGroups:setDataSource( "LobbyFriends" )
	listGroups:setWidgetType( CoD.FriendsListRow )
	listGroups:setVerticalCount( 6 )
	listGroups:setVerticalScrollbar( CoD.verticalScrollbarNew )
	self:addElement( listGroups )
	self.listGroups = listGroups
	
	listGroups.id = "listGroups"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.listGroups:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.listGroups:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
