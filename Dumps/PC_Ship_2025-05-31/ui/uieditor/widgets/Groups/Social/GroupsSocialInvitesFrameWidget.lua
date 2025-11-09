require( "ui.uieditor.widgets.Social.Social_Groups_InvitesButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )

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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, -16, 388 )
	BlackTint0:setTopBottom( true, false, -29, 553 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local InvitesList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	InvitesList:makeFocusable()
	InvitesList:setLeftRight( true, false, 3.12, 377.12 )
	InvitesList:setTopBottom( true, false, 55, 450 )
	InvitesList:setWidgetType( CoD.Social_Groups_InvitesButton )
	InvitesList:setVerticalCount( 6 )
	InvitesList:setSpacing( 7 )
	InvitesList:setVerticalCounter( CoD.verticalCounter )
	InvitesList:setDataSource( "GroupsInvitesList" )
	InvitesList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	InvitesList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( InvitesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenGroupsInviteConfirmation( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( InvitesList )
	self.InvitesList = InvitesList
	
	local GroupInvitesTitle = CoD.Challenges_Title.new( menu, controller )
	GroupInvitesTitle:setLeftRight( true, false, 5.12, 201.12 )
	GroupInvitesTitle:setTopBottom( true, false, 0, 32.25 )
	GroupInvitesTitle.weaponNameLabel:setText( Engine.Localize( "GROUPS_INVITES" ) )
	self:addElement( GroupInvitesTitle )
	self.GroupInvitesTitle = GroupInvitesTitle
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( true, false, 394, 753 )
	GroupsSummary:setTopBottom( true, false, -7, 453 )
	GroupsSummary.GroupMemberSummary:setAlpha( 0 )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	GroupsSummary:linkToElementModel( InvitesList, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	InvitesList.id = "InvitesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.InvitesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.InvitesList:close()
		element.GroupInvitesTitle:close()
		element.GroupsSummary:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

