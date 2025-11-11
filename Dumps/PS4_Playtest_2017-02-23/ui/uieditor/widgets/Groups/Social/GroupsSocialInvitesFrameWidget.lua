require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Social.Social_Groups_InvitesButton" )

CoD.GroupsSocialInvitesFrameWidget = InheritFrom( LUI.UIElement )
CoD.GroupsSocialInvitesFrameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialInvitesFrameWidget )
	self.id = "GroupsSocialInvitesFrameWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local InvitesList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	InvitesList:makeFocusable()
	InvitesList:setLeftRight( 0, 0, 5, 566 )
	InvitesList:setTopBottom( 0, 0, 85, 635 )
	InvitesList:setWidgetType( CoD.Social_Groups_InvitesButton )
	InvitesList:setVerticalCount( 6 )
	InvitesList:setDataSource( "GroupsInvitesList" )
	InvitesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	InvitesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( InvitesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenGroupsInviteConfirmation( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( InvitesList )
	self.InvitesList = InvitesList
	
	local GroupInvitesTitle = CoD.Challenges_Title.new( menu, controller )
	GroupInvitesTitle:setLeftRight( 0, 0, 5, 299 )
	GroupInvitesTitle:setTopBottom( 0, 0, 0, 48 )
	GroupInvitesTitle.weaponNameLabel:setText( Engine.Localize( "GROUPS_INVITES" ) )
	self:addElement( GroupInvitesTitle )
	self.GroupInvitesTitle = GroupInvitesTitle
	
	InvitesList.id = "InvitesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.InvitesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.InvitesList:close()
		self.GroupInvitesTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

