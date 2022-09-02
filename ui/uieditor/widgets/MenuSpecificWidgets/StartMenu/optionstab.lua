-- 8b095fc91fd660732ad6a03c805b806c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.SelectionListButton" )
require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	
end

CoD.OptionsTab = InheritFrom( LUI.UIElement )
CoD.OptionsTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.OptionsTab )
	self.id = "OptionsTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1090 )
	self:setTopBottom( true, false, 0, 560 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 23, 283 )
	selectionList:setTopBottom( true, false, 23, 533 )
	selectionList:setDataSource( "OptionsTabSelectionList" )
	selectionList:setWidgetType( CoD.SelectionListButton )
	selectionList:setVerticalCount( 16 )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		ProcessListAction( self, f5_arg0, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local todoBorder = CoD.Border.new( menu, controller )
	todoBorder:setLeftRight( false, true, -383, -23 )
	todoBorder:setTopBottom( true, false, 23, 130 )
	todoBorder:setRGB( 0, 0, 0 )
	self:addElement( todoBorder )
	self.todoBorder = todoBorder
	
	local todoText = LUI.UIText.new()
	todoText:setLeftRight( true, false, 721, 1053 )
	todoText:setTopBottom( true, false, 35.5, 76.5 )
	todoText:setRGB( 0, 0, 0 )
	todoText:setText( Engine.Localize( "COMING SOON: NEW OPTIONS MENU TAB WIDGET" ) )
	todoText:setTTF( "fonts/default.ttf" )
	todoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	todoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( todoText )
	self.todoText = todoText
	
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.selectionList:close()
		element.todoBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

