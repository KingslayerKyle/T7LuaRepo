require( "ui.uieditor.widgets.Groups.GroupsRosterList" )
require( "ui.uieditor.widgets.Groups.GroupMemberInfoPane" )

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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, 0, 402 )
	BlackTint0:setTopBottom( true, false, -29, 582 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1150 )
	Background:setTopBottom( true, false, -30.5, 429.5 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local noFriends = LUI.UIText.new()
	noFriends:setLeftRight( true, false, 475, 675 )
	noFriends:setTopBottom( true, false, 232.5, 257.5 )
	noFriends:setAlpha( 0 )
	noFriends:setText( Engine.Localize( "MENU_THERE_ARE_NO_FRIENDS" ) )
	noFriends:setTTF( "fonts/default.ttf" )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noFriends )
	self.noFriends = noFriends
	
	local GroupsRosterList = CoD.GroupsRosterList.new( menu, controller )
	GroupsRosterList:setLeftRight( true, false, 8.5, 393.5 )
	GroupsRosterList:setTopBottom( true, false, -0.5, 489.5 )
	GroupsRosterList.onlineList:setDataSource( "SocialPlayersList" )
	GroupsRosterList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ), function ( model )
		local f3_local0 = GroupsRosterList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Social.selectedFriendXUID"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	GroupsRosterList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupMembersInProgress" ), function ( model )
		local f4_local0 = GroupsRosterList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupMembersInProgress"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	GroupsRosterList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f5_local0
	end )
	GroupsRosterList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( GroupsRosterList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if ShouldOpenGroupAdminOptionsPopupForGroupMember( element, controller ) then
			SetSelectedFriendXUID( self, element, controller )
			OpenGroupAdminOptionsPopupForGroupMember( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ShouldOpenGroupAdminOptionsPopupForGroupMember( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( GroupsRosterList )
	self.GroupsRosterList = GroupsRosterList
	
	local GroupMemberInfoPane = CoD.GroupMemberInfoPane.new( menu, controller )
	GroupMemberInfoPane:setLeftRight( true, false, 426, 1149 )
	GroupMemberInfoPane:setTopBottom( true, false, -1.5, 483.5 )
	self:addElement( GroupMemberInfoPane )
	self.GroupMemberInfoPane = GroupMemberInfoPane
	
	GroupMemberInfoPane:linkToElementModel( GroupsRosterList.onlineList, nil, false, function ( model )
		GroupMemberInfoPane:setModel( model, controller )
	end )
	GroupsRosterList.id = "GroupsRosterList"
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

