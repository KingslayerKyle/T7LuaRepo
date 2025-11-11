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
	self:setLeftRight( 0, 0, 0, 615 )
	self:setTopBottom( 0, 0, 0, 825 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( 0, 0, 0, 561 )
	onlineList:setTopBottom( 0, 0, -2, 774 )
	onlineList:setWidgetType( CoD.GroupsFriendsListButton )
	onlineList:setVerticalCount( 8 )
	onlineList:setSpacing( 8 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetSelectedFriendXUID( self, element, controller )
		CopyModelFindElement( menu, element, "GroupsPlayerCard" )
		return retVal
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GroupToggleFriendInvite( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "Invite", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.onlineList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

