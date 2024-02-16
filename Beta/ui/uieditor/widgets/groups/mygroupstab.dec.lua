require( "ui.uieditor.widgets.Groups.GroupsNoGroupMessage" )
require( "ui.uieditor.widgets.Groups.GroupsItemRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbarNew" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.Groups.GroupsCreateButton" )
require( "ui.uieditor.widgets.Groups.GroupContentPanel" )
require( "ui.uieditor.menus.Groups.CreateGroup" )

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
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1149.74 )
	Background:setTopBottom( true, false, 0, 485.57 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GroupsNoGroupMessage = CoD.GroupsNoGroupMessage.new( menu, controller )
	GroupsNoGroupMessage:setLeftRight( true, false, 13.5, 370.5 )
	GroupsNoGroupMessage:setTopBottom( true, false, 82, 182 )
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
	
	local ButtonList = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 9.5, 365.5 )
	ButtonList:setTopBottom( true, false, 104, 451 )
	ButtonList:setDataSource( "GroupsMainButtonList" )
	ButtonList:setWidgetType( CoD.GroupsItemRow )
	ButtonList:setVerticalCount( 7 )
	ButtonList:setSpacing( 3 )
	ButtonList:setVerticalScrollbar( CoD.verticalScrollbarNew )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( true, false, 805, 1152 )
	GroupsSummary:setTopBottom( true, false, 0, 460 )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local GroupsCreateButton = CoD.GroupsCreateButton.new( menu, controller )
	GroupsCreateButton:setLeftRight( true, false, 9.5, 365.5 )
	GroupsCreateButton:setTopBottom( true, false, 9.5, 56.5 )
	GroupsCreateButton.Text:setText( Engine.Localize( "GROUPS_CREATE_GROUP_CAPS" ) )
	GroupsCreateButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( GroupsCreateButton )
	self.GroupsCreateButton = GroupsCreateButton
	
	local GroupContentPanel = CoD.GroupContentPanel.new( menu, controller )
	GroupContentPanel:setLeftRight( true, false, 399, 783.32 )
	GroupContentPanel:setTopBottom( true, false, 11.5, 452 )
	GroupContentPanel:mergeStateConditions( {
		{
			stateName = "NonMemberView",
			condition = function ( menu, element, event )
				return not HasSelectedGroup( element, controller )
			end
		}
	} )
	GroupContentPanel:linkToElementModel( "groupId", true, function ( model )
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
	ButtonList.navigation = {
		up = GroupsCreateButton
	}
	GroupsCreateButton.navigation = {
		down = ButtonList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ButtonList.id = "ButtonList"
	GroupsCreateButton.id = "GroupsCreateButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsNoGroupMessage:close()
		self.ButtonList:close()
		self.GroupsSummary:close()
		self.GroupsCreateButton:close()
		self.GroupContentPanel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

