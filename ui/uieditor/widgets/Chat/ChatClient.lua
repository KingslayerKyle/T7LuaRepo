-- 43d2c01ee24dd6d229a9603528d13810
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Chat.ChatClientChatEntryContainerNew" )
require( "ui.uieditor.widgets.Chat.ChatClientInput" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:setForceMouseEventDispatch( true )
end

CoD.ChatClient = InheritFrom( LUI.UIElement )
CoD.ChatClient.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChatClient )
	self.id = "ChatClient"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 650 )
	self:setTopBottom( true, false, 0, 400 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ChatEntriesList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	ChatEntriesList:makeFocusable()
	ChatEntriesList:setLeftRight( false, false, -171, 171 )
	ChatEntriesList:setTopBottom( false, true, -329, -149 )
	ChatEntriesList:setDataSource( "ChatClientEntriesList" )
	ChatEntriesList:setWidgetType( CoD.ChatClientChatEntryContainerNew )
	ChatEntriesList:setVerticalCount( 10 )
	ChatEntriesList:setSpacing( 0 )
	self:addElement( ChatEntriesList )
	self.ChatEntriesList = ChatEntriesList
	
	local ChatClientInput = CoD.ChatClientInput.new( menu, controller )
	ChatClientInput:setLeftRight( false, false, -284, 284 )
	ChatClientInput:setTopBottom( false, true, -272, -111 )
	self:addElement( ChatClientInput )
	self.ChatClientInput = ChatClientInput
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, "T", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		ChatClientInputStart( self, f3_arg0, f3_arg2, "All" )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_PCKEY_0, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_1, "Y", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		ChatClientInputStart( self, f5_arg0, f5_arg2, "Team" )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_PCKEY_1, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_2, "P", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		ChatClientInputStart( self, f7_arg0, f7_arg2, "Party" )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_PCKEY_2, "" )
		return false
	end, false )
	ChatEntriesList.id = "ChatEntriesList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ChatEntriesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChatEntriesList:close()
		element.ChatClientInput:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
