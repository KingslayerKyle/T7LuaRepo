-- 23f53fabe17e7e679b57979d4e3e8fc2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsItemRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.Groups.GroupContentPanel" )
require( "ui.uieditor.widgets.Groups.Social.GroupsSocialMainFrameButton" )
require( "ui.uieditor.menus.Groups.GroupInvites" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )
require( "ui.uieditor.widgets.Groups.Social.GroupsSocialBackgroundWidget" )
require( "ui.uieditor.widgets.Groups.Social.GroupsSocialMainFrameYourGroupsLabel" )
require( "ui.uieditor.widgets.Groups.Social.GroupsSocialMainFindButton" )
require( "ui.uieditor.menus.Groups.FindGroups" )

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
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 629 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, -1, 403 )
	BlackTint0:setTopBottom( true, false, -34, 548 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local ButtonList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 14, 388 )
	ButtonList:setTopBottom( true, false, 84.09, 469.09 )
	ButtonList:setWidgetType( CoD.GroupsItemRow )
	ButtonList:setVerticalCount( 6 )
	ButtonList:setSpacing( 5 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "GroupsMainButtonList" )
	ButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		SetSelectedGroup( self, element, controller )
		FileshareCategorySelectorSetToCategory( controller, "featured", true )
		SetElementStateByElementName( self, "GroupContentPanel", controller, "MemberView" )
		SetElementStateByElementName( self, "GroupsSummary", controller, "DefaultState" )
		SetElementStateByElementName( self, "GroupsNoConentDetail", controller, "Hidden" )
		SetElementStateByElementName( self, "GroupsSocialBackgroundWidget", controller, "Hidden" )
		return f2_local0
	end )
	ButtonList:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetProperty( self, "updateButtonPromptsWhenEmptied", true )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f4_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		SetSelectedGroup( self, f6_arg0, f6_arg2 )
		ProcessListAction( self, f6_arg0, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if ListHasElements( f8_arg0 ) then
			SetSelectedGroup( self, f8_arg0, f8_arg2 )
			OpenGroupOptionsPopup( self, f8_arg0, f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if ListHasElements( f9_arg0 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( true, false, 767, 1126 )
	GroupsSummary:setTopBottom( true, false, -4, 456 )
	GroupsSummary:mergeStateConditions( {
		{
			stateName = "NoGroupSelected",
			condition = function ( menu, element, event )
				return HideGroupSummaryIfListEmpty( element, controller, "ButtonList" )
			end
		}
	} )
	GroupsSummary:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupProfilesInProgress" ), function ( model )
		menu:updateElementState( GroupsSummary, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupProfilesInProgress"
		} )
	end )
	GroupsSummary:linkToElementModel( GroupsSummary, "groupId", true, function ( model )
		menu:updateElementState( GroupsSummary, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	GroupsSummary:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.groupCount_self" ), function ( model )
		menu:updateElementState( GroupsSummary, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.groupCount_self"
		} )
	end )
	GroupsSummary:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.groupCount_search" ), function ( model )
		menu:updateElementState( GroupsSummary, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.groupCount_search"
		} )
	end )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local GroupContentPanel = CoD.GroupContentPanel.new( menu, controller )
	GroupContentPanel:setLeftRight( true, false, 430, 814.32 )
	GroupContentPanel:setTopBottom( true, false, -20.68, 419.82 )
	GroupContentPanel:mergeStateConditions( {
		{
			stateName = "NonMemberView",
			condition = function ( menu, element, event )
				return HideGroupSummaryIfListEmpty( element, controller, "ButtonList" )
			end
		},
		{
			stateName = "MemberView",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	GroupContentPanel:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupProfilesInProgress" ), function ( model )
		menu:updateElementState( GroupContentPanel, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupProfilesInProgress"
		} )
	end )
	GroupContentPanel:linkToElementModel( GroupContentPanel, "groupId", true, function ( model )
		menu:updateElementState( GroupContentPanel, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	GroupContentPanel:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.groupCount_self" ), function ( model )
		menu:updateElementState( GroupContentPanel, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.groupCount_self"
		} )
	end )
	GroupContentPanel:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.groupCount_search" ), function ( model )
		menu:updateElementState( GroupContentPanel, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.groupCount_search"
		} )
	end )
	self:addElement( GroupContentPanel )
	self.GroupContentPanel = GroupContentPanel
	
	local InvitesButton = CoD.GroupsSocialMainFrameButton.new( menu, controller )
	InvitesButton:setLeftRight( true, false, 208, 388 )
	InvitesButton:setTopBottom( true, false, 4, 52 )
	InvitesButton.NumItems:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	InvitesButton.Text:setText( Engine.Localize( "GROUPS_INVITES" ) )
	InvitesButton:subscribeToGlobalModel( controller, "Groups", "inviteCount", function ( model )
		local inviteCount = Engine.GetModelValue( model )
		if inviteCount then
			InvitesButton.NumItems:setText( Engine.Localize( inviteCount ) )
		end
	end )
	InvitesButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.inviteCount" ), function ( model )
		local f22_local0 = InvitesButton
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.inviteCount"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	InvitesButton:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		ClearSelectedGroup( self, element, controller )
		SetElementStateByElementName( self, "GroupContentPanel", controller, "NonMemberView" )
		SetElementStateByElementName( self, "GroupsSummary", controller, "NoGroupSelected" )
		SetElementStateByElementName( self, "GroupsNoConentDetail", controller, "Hidden" )
		SetElementStateByElementName( self, "GroupsSocialBackgroundWidget", controller, "Visible" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f23_local0
	end )
	InvitesButton:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		return f24_local0
	end )
	menu:AddButtonCallbackFunction( InvitesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if HasPendingInvites( f25_arg2 ) then
			NavigateToMenu( self, "GroupInvites", true, f25_arg2 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if HasPendingInvites( f26_arg2 ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
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
	self:addElement( InvitesButton )
	self.InvitesButton = InvitesButton
	
	local GroupsNoConentDetail = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsNoConentDetail:setLeftRight( true, false, 431, 754 )
	GroupsNoConentDetail:setTopBottom( true, false, 2.5, 283 )
	GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_groups_findcreate" ) )
	GroupsNoConentDetail.Header:setText( Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ) )
	GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_FIND_GROUPS_DESC" ) )
	self:addElement( GroupsNoConentDetail )
	self.GroupsNoConentDetail = GroupsNoConentDetail
	
	local GroupsSocialBackgroundWidget = CoD.GroupsSocialBackgroundWidget.new( menu, controller )
	GroupsSocialBackgroundWidget:setLeftRight( true, false, 413, 940.32 )
	GroupsSocialBackgroundWidget:setTopBottom( true, false, -15, 533 )
	self:addElement( GroupsSocialBackgroundWidget )
	self.GroupsSocialBackgroundWidget = GroupsSocialBackgroundWidget
	
	local GroupsSocialMainFrameYourGroupsLabel = CoD.GroupsSocialMainFrameYourGroupsLabel.new( menu, controller )
	GroupsSocialMainFrameYourGroupsLabel:setLeftRight( true, false, 14, 388 )
	GroupsSocialMainFrameYourGroupsLabel:setTopBottom( true, false, 59.09, 84.09 )
	self:addElement( GroupsSocialMainFrameYourGroupsLabel )
	self.GroupsSocialMainFrameYourGroupsLabel = GroupsSocialMainFrameYourGroupsLabel
	
	local GroupsSocialMainFindButton = CoD.GroupsSocialMainFindButton.new( menu, controller )
	GroupsSocialMainFindButton:setLeftRight( true, false, 14, 194 )
	GroupsSocialMainFindButton:setTopBottom( true, false, 4, 52 )
	GroupsSocialMainFindButton.Text:setText( Engine.Localize( "GROUPS_FIND_AND_CREATE_GROUPS" ) )
	GroupsSocialMainFindButton.Icon:setImage( RegisterImage( "uie_t7_icon_menu_simple_groups_findcreate" ) )
	GroupsSocialMainFindButton:registerEventHandler( "gain_focus", function ( element, event )
		local f29_local0 = nil
		if element.gainFocus then
			f29_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f29_local0 = element.super:gainFocus( event )
		end
		ClearSelectedGroup( self, element, controller )
		SetElementStateByElementName( self, "GroupContentPanel", controller, "NonMemberView" )
		SetElementStateByElementName( self, "GroupsSummary", controller, "NoGroupSelected" )
		SetElementStateByElementName( self, "GroupsNoConentDetail", controller, "DefaultState" )
		SetElementStateByElementName( self, "GroupsSocialBackgroundWidget", controller, "Visible" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f29_local0
	end )
	GroupsSocialMainFindButton:registerEventHandler( "lose_focus", function ( element, event )
		local f30_local0 = nil
		if element.loseFocus then
			f30_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f30_local0 = element.super:loseFocus( event )
		end
		return f30_local0
	end )
	menu:AddButtonCallbackFunction( GroupsSocialMainFindButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		NavigateToMenu( self, "FindGroups", true, f31_arg2 )
		return true
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "menu_select" )
		return true
	end, true )
	self:addElement( GroupsSocialMainFindButton )
	self.GroupsSocialMainFindButton = GroupsSocialMainFindButton
	
	GroupsSummary:linkToElementModel( ButtonList, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	GroupContentPanel:linkToElementModel( ButtonList, nil, false, function ( model )
		GroupContentPanel:setModel( model, controller )
	end )
	ButtonList.navigation = {
		up = {
			GroupsSocialMainFindButton,
			InvitesButton
		}
	}
	InvitesButton.navigation = {
		left = GroupsSocialMainFindButton,
		down = ButtonList
	}
	GroupsSocialMainFindButton.navigation = {
		right = InvitesButton,
		down = ButtonList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ButtonList.id = "ButtonList"
	InvitesButton.id = "InvitesButton"
	GroupsSocialMainFindButton.id = "GroupsSocialMainFindButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GroupsSocialMainFindButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.GroupsSummary:close()
		element.GroupContentPanel:close()
		element.InvitesButton:close()
		element.GroupsNoConentDetail:close()
		element.GroupsSocialBackgroundWidget:close()
		element.GroupsSocialMainFrameYourGroupsLabel:close()
		element.GroupsSocialMainFindButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
