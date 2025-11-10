require( "ui.uieditor.widgets.Groups.GroupsFriendsListButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.GroupsFriendsList = InheritFrom( LUI.UIElement )
CoD.GroupsFriendsList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsFriendsList )
	self.id = "GroupsFriendsList"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 410 )
	self:setTopBottom( true, false, 0, 550 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( true, false, 2, 412 )
	onlineList:setTopBottom( true, false, 0, 515 )
	onlineList:setDataSource( "GroupsInviteFriendsList" )
	onlineList:setWidgetType( CoD.GroupsFriendsListButton )
	onlineList:setVerticalCount( 8 )
	onlineList:setSpacing( 5 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		SetSelectedFriendXUID( self, element, controller )
		CopyModelFindElement( menu, element, "GroupsPlayerCard" )
		return f2_local0
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GroupToggleFriendInvite( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "Invite" )
		return true
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	onlineList.id = "onlineList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.onlineList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.onlineList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

