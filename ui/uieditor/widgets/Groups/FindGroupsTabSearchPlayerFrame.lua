-- f6935198db9b0e7432e0c7cfbcbecad5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )

CoD.FindGroupsTabSearchPlayerFrame = InheritFrom( LUI.UIElement )
CoD.FindGroupsTabSearchPlayerFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FindGroupsTabSearchPlayerFrame )
	self.id = "FindGroupsTabSearchPlayerFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 488 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SearchForGroup = LUI.UIText.new()
	SearchForGroup:setLeftRight( true, false, 1, 420 )
	SearchForGroup:setTopBottom( true, false, 3, 28 )
	SearchForGroup:setText( Engine.Localize( "GROUPS_SEARCH_FOR_PLAYER_TO_INVITE" ) )
	SearchForGroup:setTTF( "fonts/default.ttf" )
	SearchForGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SearchForGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SearchForGroup )
	self.SearchForGroup = SearchForGroup
	
	local GroupsNameEntry = CoD.GroupsInputButton.new( menu, controller )
	GroupsNameEntry:setLeftRight( true, false, 0, 420 )
	GroupsNameEntry:setTopBottom( true, false, 34, 68 )
	GroupsNameEntry.Text:setText( Engine.Localize( "$(groups.searchGroupsPlayerName)" ) )
	GroupsNameEntry:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	GroupsNameEntry:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( GroupsNameEntry, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ShowKeyboard( self, f4_arg0, f4_arg2, "KEYBOARD_TYPE_GROUP_PLAYER_SEARCH" )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( GroupsNameEntry )
	self.GroupsNameEntry = GroupsNameEntry
	
	local SearchButton = CoD.list1ButtonNewStyle.new( menu, controller )
	SearchButton:setLeftRight( true, false, 1, 233 )
	SearchButton:setTopBottom( true, false, 88, 120 )
	SearchButton.btnDisplayText:setText( Engine.Localize( "GROUPS_SEARCH_GROUPS_CAPS" ) )
	SearchButton.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_SEARCH_GROUPS_CAPS" ) )
	SearchButton:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	SearchButton:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( SearchButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		SearchPlayerByGamertag( self, f8_arg0, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( SearchButton )
	self.SearchButton = SearchButton
	
	GroupsNameEntry.navigation = {
		down = SearchButton
	}
	SearchButton.navigation = {
		up = GroupsNameEntry
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	GroupsNameEntry.id = "GroupsNameEntry"
	SearchButton.id = "SearchButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GroupsNameEntry:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsNameEntry:close()
		element.SearchButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

