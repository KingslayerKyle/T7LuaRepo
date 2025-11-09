require( "ui.uieditor.widgets.Groups.GroupsNoGroupMessage" )
require( "ui.uieditor.widgets.Groups.GroupsCreateButton" )
require( "ui.uieditor.widgets.Groups.GroupsItemRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.Groups.GroupContentPanel" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	Engine.ClearLastGroupSearchResults()
end

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
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 629 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 0, 402 )
	BlackTint:setTopBottom( true, false, -58, 553 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local GroupsNoGroupMessage = CoD.GroupsNoGroupMessage.new( menu, controller )
	GroupsNoGroupMessage:setLeftRight( true, false, 12, 292 )
	GroupsNoGroupMessage:setTopBottom( true, false, 9, 37 )
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
	self:addElement( GroupsNoGroupMessage )
	self.GroupsNoGroupMessage = GroupsNoGroupMessage
	
	local GroupsCreateButton = CoD.GroupsCreateButton.new( menu, controller )
	GroupsCreateButton:setLeftRight( true, false, 12, 386 )
	GroupsCreateButton:setTopBottom( true, false, -44, 3 )
	GroupsCreateButton.Text:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	GroupsCreateButton:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		ClearSelectedGroup( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	GroupsCreateButton:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( GroupsCreateButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		CreateNewGroupFlow( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( GroupsCreateButton )
	self.GroupsCreateButton = GroupsCreateButton
	
	local ButtonList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 12, 386 )
	ButtonList:setTopBottom( true, false, 37.25, 432.25 )
	ButtonList:setWidgetType( CoD.GroupsItemRow )
	ButtonList:setVerticalCount( 6 )
	ButtonList:setSpacing( 7 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "GroupsMainButtonList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetSelectedGroup( self, element, controller )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( true, false, 765, 1112 )
	GroupsSummary:setTopBottom( true, false, -50, 423.25 )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local GroupContentPanel = CoD.GroupContentPanel.new( menu, controller )
	GroupContentPanel:setLeftRight( true, false, 426, 810.32 )
	GroupContentPanel:setTopBottom( true, false, -69, 372.5 )
	GroupContentPanel:mergeStateConditions( {
		{
			stateName = "NonMemberView",
			condition = function ( menu, element, event )
				return not HasSelectedGroup( element, controller )
			end
		}
	} )
	GroupContentPanel:linkToElementModel( GroupContentPanel, "groupId", true, function ( model )
		menu:updateElementState( GroupContentPanel, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	self:addElement( GroupContentPanel )
	self.GroupContentPanel = GroupContentPanel
	
	GroupsSummary:linkToElementModel( ButtonList, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	GroupContentPanel:linkToElementModel( ButtonList, nil, false, function ( model )
		GroupContentPanel:setModel( model, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsNoGroupMessage:close()
		element.GroupsCreateButton:close()
		element.ButtonList:close()
		element.GroupsSummary:close()
		element.GroupContentPanel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

