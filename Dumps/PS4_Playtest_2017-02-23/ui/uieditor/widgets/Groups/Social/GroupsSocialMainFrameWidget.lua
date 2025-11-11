require( "ui.uieditor.widgets.Groups.GroupContentPanel" )
require( "ui.uieditor.widgets.Groups.GroupsItemRow" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.Groups.Social.GroupsSocialMainFrameButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.GroupsSocialMainFrameWidget = InheritFrom( LUI.UIElement )
CoD.GroupsSocialMainFrameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialMainFrameWidget )
	self.id = "GroupsSocialMainFrameWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 943 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, -24, 582 )
	BlackTint:setTopBottom( 0, 0, -33, 840 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local ButtonList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, -1, 560 )
	ButtonList:setTopBottom( 0, 0, 109, 699 )
	ButtonList:setWidgetType( CoD.GroupsItemRow )
	ButtonList:setVerticalCount( 6 )
	ButtonList:setSpacing( 10 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "GroupsMainButtonList" )
	ButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetSelectedGroup( self, element, controller )
		return retVal
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( 0, 0, 1130, 1650 )
	GroupsSummary:setTopBottom( 0, 0, -6, 684 )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local GroupContentPanel = CoD.GroupContentPanel.new( menu, controller )
	GroupContentPanel:mergeStateConditions( {
		{
			stateName = "NonMemberView",
			condition = function ( menu, element, event )
				return not HasSelectedGroup( element, controller )
			end
		}
	} )
	GroupContentPanel:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup" ), function ( model )
		menu:updateElementState( GroupContentPanel, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup"
		} )
	end )
	GroupContentPanel:setLeftRight( 0, 0, 620, 1196 )
	GroupContentPanel:setTopBottom( 0, 0, -31, 630 )
	self:addElement( GroupContentPanel )
	self.GroupContentPanel = GroupContentPanel
	
	local InvitesButton = CoD.GroupsSocialMainFrameButton.new( menu, controller )
	InvitesButton:mergeStateConditions( {
		{
			stateName = "DisableState",
			condition = function ( menu, element, event )
				return not HasPendingInvites( controller )
			end
		}
	} )
	InvitesButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.inviteCount" ), function ( model )
		menu:updateElementState( InvitesButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.inviteCount"
		} )
	end )
	InvitesButton:setLeftRight( 0, 0, -1.5, 559.5 )
	InvitesButton:setTopBottom( 0, 0, 9, 79 )
	InvitesButton.Text:setText( Engine.Localize( "GROUPS_INVITES" ) )
	InvitesButton:subscribeToGlobalModel( controller, "Groups", "inviteCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InvitesButton.NumItems:setText( Engine.Localize( modelValue ) )
		end
	end )
	InvitesButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.inviteCount" ), function ( model )
		local element = InvitesButton
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.inviteCount"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	InvitesButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		ClearSelectedGroup( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	InvitesButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( InvitesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if HasPendingInvites( controller ) then
			GroupsSocialChangeTabFrameWidget( self, element, controller, "invites" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasPendingInvites( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( InvitesButton )
	self.InvitesButton = InvitesButton
	
	GroupsSummary:linkToElementModel( ButtonList, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	ButtonList.navigation = {
		up = InvitesButton
	}
	InvitesButton.navigation = {
		down = ButtonList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ButtonList.id = "ButtonList"
	InvitesButton.id = "InvitesButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.GroupsSummary:close()
		self.GroupContentPanel:close()
		self.InvitesButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

