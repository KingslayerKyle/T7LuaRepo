require( "ui.uieditor.menus.Groups.GroupsMemberDetailsPopup" )
require( "ui.uieditor.widgets.Groups.GroupsRosterRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.GroupsRosterList = InheritFrom( LUI.UIElement )
CoD.GroupsRosterList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GroupsRosterList )
	self.id = "GroupsRosterList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 383 )
	self:setTopBottom( true, false, 0, 502 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( true, false, 5, 379 )
	onlineList:setTopBottom( true, false, 5, 455 )
	onlineList:setDataSource( "GroupMembers" )
	onlineList:setWidgetType( CoD.GroupsRosterRow )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 5 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		SetSelectedFriendXUID( self, element, controller )
		CopyModelFindElement( menu, element, "GroupMemberInfoPane" )
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
		SetSelectedFriendXUID( self, element, controller )
		OpenPopup( self, "GroupsMemberDetailsPopup", controller )
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

