require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.Groups.GroupSliderWithTitle" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )

local f0_local0 = function ( f1_arg0 )
	return {
		models = {
			name = Engine.Localize( "GROUPS_GROUP_SIZE" ),
			desc = "",
			optionsDatasource = "GroupsSearchGroupSize",
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
end

local f0_local1 = function ( f2_arg0 )
	return {
		models = {
			name = Engine.Localize( "GROUPS_GROUP_TYPE" ),
			desc = "",
			optionsDatasource = "GroupsSearchGroupType",
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
end

local f0_local2 = function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, f0_local0( f3_arg0 ) )
	return f3_local0
end

local PreLoadFunc = function ( self, controller )
	Engine.ClearLastGroupSearchResults( controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchGroupsInProgress" ), false )
	DataSources.FindGroupsTabSearchGroupsOptions = DataSourceHelpers.ListSetup( "FindGroupsTabSearchGroupsOptions", f0_local2, true )
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0.ButtonList:registerEventHandler( "mouse_left_click", function ( element, event )
		local f6_local0 = event.element
		if IsSelfModelValueTrue( f6_local0, f5_arg1, "selected" ) then
			SetElementModelValue( f6_local0, "selected", false )
			EnableNavigation( f5_arg0, "ButtonList" )
			GroupsVariableOptionsSet( f5_arg0, f6_local0, f5_arg1 )
		elseif not IsSelfModelValueTrue( f6_local0, f5_arg1, "selected" ) then
			f6_local0.Slider:navigateItemRight()
			GroupsVariableOptionsSet( f5_arg0, f6_local0, f5_arg1 )
		end
		return true
	end )
	f5_arg0.ButtonList:registerEventHandler( "button_action", function ( element, event )
		return false
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local4( self, controller, menu )
	end
end

CoD.FindGroupsTabSearchGroupsFrame = InheritFrom( LUI.UIElement )
CoD.FindGroupsTabSearchGroupsFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FindGroupsTabSearchGroupsFrame )
	self.id = "FindGroupsTabSearchGroupsFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 488 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SearchForGroup = LUI.UIText.new()
	SearchForGroup:setLeftRight( true, false, 1, 420 )
	SearchForGroup:setTopBottom( true, false, 3, 28 )
	SearchForGroup:setText( Engine.Localize( "GROUPS_SEARCH_FOR_GROUP" ) )
	SearchForGroup:setTTF( "fonts/default.ttf" )
	SearchForGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SearchForGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SearchForGroup )
	self.SearchForGroup = SearchForGroup
	
	local GroupsNameEntry = CoD.GroupsInputButton.new( menu, controller )
	GroupsNameEntry:setLeftRight( true, false, 0, 420 )
	GroupsNameEntry:setTopBottom( true, false, 33, 67 )
	GroupsNameEntry.Text:setText( Engine.Localize( "$(groups.searchGroupsGroupName)" ) )
	GroupsNameEntry:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	GroupsNameEntry:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( GroupsNameEntry, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_SEARCH_NAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( GroupsNameEntry )
	self.GroupsNameEntry = GroupsNameEntry
	
	local ButtonList = LUI.UIList.new( menu, controller, -2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, -40, 630 )
	ButtonList:setTopBottom( true, false, 83, 215 )
	ButtonList:setWidgetType( CoD.GroupSliderWithTitle )
	ButtonList:setVerticalCount( 2 )
	ButtonList:setSpacing( -2 )
	ButtonList:setDataSource( "FindGroupsTabSearchGroupsOptions" )
	ButtonList:linkToElementModel( ButtonList, "selected", true, function ( model )
		local f14_local0 = ButtonList
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f14_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f15_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", false )
			EnableNavigation( self, "ButtonList" )
			EnableMouseOnElement( self, "ButtonList", controller )
			EnableMouseOnElement( self, "GroupsNameEntry", controller )
			EnableMouseOnElement( self, "SearchButton", controller )
			GroupsVariableOptionsSet( self, element, controller )
			MakeSiblingFocusable( self, "CategoriesList", controller )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", true )
			DisableNavigation( self, "ButtonList" )
			DisableMouseOnElement( self, "ButtonList", controller )
			DisableMouseOnElement( self, "GroupsNameEntry", controller )
			DisableMouseOnElement( self, "SearchButton", controller )
			DispatchEventToChildren( element, "gain_focus", controller )
			MakeSiblingNotFocusable( self, "CategoriesList", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", false )
			EnableNavigation( self, "ButtonList" )
			DispatchEventToChildren( element, "lose_focus", controller )
			MakeSiblingFocusable( self, "CategoriesList", controller )
			GroupsVariableOptionsSet( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local SearchButton = CoD.list1ButtonNewStyle.new( menu, controller )
	SearchButton:setLeftRight( true, false, 1, 233 )
	SearchButton:setTopBottom( true, false, 240, 272 )
	SearchButton.btnDisplayText:setText( Engine.Localize( "GROUPS_SEARCH_GROUPS_CAPS" ) )
	SearchButton.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_SEARCH_GROUPS_CAPS" ) )
	SearchButton:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f21_local0
	end )
	SearchButton:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
	end )
	menu:AddButtonCallbackFunction( SearchButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		SearchGroups( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( SearchButton )
	self.SearchButton = SearchButton
	
	GroupsNameEntry.navigation = {
		down = ButtonList
	}
	ButtonList.navigation = {
		up = GroupsNameEntry,
		down = SearchButton
	}
	SearchButton.navigation = {
		up = ButtonList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	GroupsNameEntry.id = "GroupsNameEntry"
	ButtonList.id = "ButtonList"
	SearchButton.id = "SearchButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupsNameEntry:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsNameEntry:close()
		element.ButtonList:close()
		element.SearchButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

