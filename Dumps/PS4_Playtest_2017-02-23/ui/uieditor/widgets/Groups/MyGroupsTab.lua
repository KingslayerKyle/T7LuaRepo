require( "ui.uieditor.widgets.Groups.GroupContentPanel" )
require( "ui.uieditor.widgets.Groups.GroupsCreateButton" )
require( "ui.uieditor.widgets.Groups.GroupsItemRow" )
require( "ui.uieditor.widgets.Groups.GroupsNoGroupMessage" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.MyGroupsTab = InheritFrom( LUI.UIElement )
CoD.MyGroupsTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyGroupsTab )
	self.id = "MyGroupsTab"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 943 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 0, 603 )
	BlackTint:setTopBottom( 0, 0, -87, 829 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local GroupsNoGroupMessage = CoD.GroupsNoGroupMessage.new( menu, controller )
	GroupsNoGroupMessage:mergeStateConditions( {
		{
			stateName = "NoGroups",
			condition = function ( menu, element, event )
				return not IsMemberOfAnyGroup( controller )
			end
		}
	} )
	GroupsNoGroupMessage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.groupCount_self" ), function ( model )
		menu:updateElementState( GroupsNoGroupMessage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.groupCount_self"
		} )
	end )
	GroupsNoGroupMessage:setLeftRight( 0, 0, 18, 438 )
	GroupsNoGroupMessage:setTopBottom( 0, 0, 13, 55 )
	self:addElement( GroupsNoGroupMessage )
	self.GroupsNoGroupMessage = GroupsNoGroupMessage
	
	local GroupsCreateButton = CoD.GroupsCreateButton.new( menu, controller )
	GroupsCreateButton:setLeftRight( 0, 0, 18, 579 )
	GroupsCreateButton:setTopBottom( 0, 0, -66, 4 )
	GroupsCreateButton.Text:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	GroupsCreateButton:registerEventHandler( "gain_focus", function ( element, event )
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
	GroupsCreateButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( GroupsCreateButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		CreateNewGroupFlow( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( GroupsCreateButton )
	self.GroupsCreateButton = GroupsCreateButton
	
	local ButtonList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 18, 579 )
	ButtonList:setTopBottom( 0, 0, 57, 647 )
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
	GroupsSummary:setLeftRight( 0, 0, 1148, 1668 )
	GroupsSummary:setTopBottom( 0, 0, -75, 635 )
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
	GroupContentPanel:setLeftRight( 0, 0, 639, 1215 )
	GroupContentPanel:setTopBottom( 0, 0, -103, 559 )
	self:addElement( GroupContentPanel )
	self.GroupContentPanel = GroupContentPanel
	
	GroupsSummary:linkToElementModel( ButtonList, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	GroupsCreateButton.navigation = {
		down = ButtonList
	}
	ButtonList.navigation = {
		up = GroupsCreateButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	GroupsCreateButton.id = "GroupsCreateButton"
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsNoGroupMessage:close()
		self.GroupsCreateButton:close()
		self.ButtonList:close()
		self.GroupsSummary:close()
		self.GroupContentPanel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

