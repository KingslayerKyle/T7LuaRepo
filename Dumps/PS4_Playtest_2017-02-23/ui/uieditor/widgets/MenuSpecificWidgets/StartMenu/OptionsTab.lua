require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.SelectionListButton" )

local PostLoadFunc = function ( self, controller )
	
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
	self:setLeftRight( 0, 0, 0, 1635 )
	self:setTopBottom( 0, 0, 0, 840 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0, 0, 35, 425 )
	selectionList:setTopBottom( 0, 0, 42, 792 )
	selectionList:setWidgetType( CoD.SelectionListButton )
	selectionList:setVerticalCount( 16 )
	selectionList:setDataSource( "OptionsTabSelectionList" )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local todoBorder = CoD.Border.new( menu, controller )
	todoBorder:setLeftRight( 1, 1, -574, -34 )
	todoBorder:setTopBottom( 0, 0, 35, 195 )
	todoBorder:setRGB( 0, 0, 0 )
	self:addElement( todoBorder )
	self.todoBorder = todoBorder
	
	local todoText = LUI.UIText.new()
	todoText:setLeftRight( 0, 0, 1081, 1579 )
	todoText:setTopBottom( 0, 0, 53, 115 )
	todoText:setRGB( 0, 0, 0 )
	todoText:setText( Engine.Localize( "COMING SOON: NEW OPTIONS MENU TAB WIDGET" ) )
	todoText:setTTF( "fonts/default.ttf" )
	todoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	todoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( todoText )
	self.todoText = todoText
	
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectionList:close()
		self.todoBorder:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

