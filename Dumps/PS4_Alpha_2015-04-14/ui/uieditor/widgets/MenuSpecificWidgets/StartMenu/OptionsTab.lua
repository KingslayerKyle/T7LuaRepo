require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.SelectionListButton" )
require( "ui.uieditor.widgets.Border" )

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
	self:setLeftRight( true, false, 0, 1090 )
	self:setTopBottom( true, false, 0, 560 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 23, 283 )
	selectionList:setTopBottom( true, false, 23, 533 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "OptionsTabSelectionList" )
	selectionList:setWidgetType( CoD.SelectionListButton )
	selectionList:setVerticalCount( 16 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.selectionList:close()
		self.todoBorder:close()
		CoD.OptionsTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

