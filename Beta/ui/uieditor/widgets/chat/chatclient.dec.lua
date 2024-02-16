require( "ui.uieditor.widgets.Chat.ChatClientChatEntry" )
require( "ui.uieditor.widgets.Chat.ChatClientInput" )

local PostLoadFunc = function ( self, controller )
	
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
	self:setLeftRight( true, false, 0, 426 )
	self:setTopBottom( true, false, 0, 400 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ChatEntriesList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	ChatEntriesList:makeFocusable()
	ChatEntriesList:setLeftRight( true, false, 0, 410 )
	ChatEntriesList:setTopBottom( false, true, -322, -142 )
	ChatEntriesList:setDataSource( "ChatClientEntriesList" )
	ChatEntriesList:setWidgetType( CoD.ChatClientChatEntry )
	ChatEntriesList:setVerticalCount( 10 )
	ChatEntriesList:setSpacing( 0 )
	ChatEntriesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChatEntriesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChatEntriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenGenericSmallPopup( self, controller, "Chat Entry Options", "Select", "Ok", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ChatEntriesList )
	self.ChatEntriesList = ChatEntriesList
	
	local ChatClientInput = CoD.ChatClientInput.new( menu, controller )
	ChatClientInput:setLeftRight( true, false, 0, 410 )
	ChatClientInput:setTopBottom( false, true, -251, -109 )
	self:addElement( ChatClientInput )
	self.ChatClientInput = ChatClientInput
	
	ChatEntriesList.navigation = {
		left = ChatClientInput,
		down = ChatClientInput
	}
	ChatClientInput.navigation = {
		left = ChatEntriesList,
		up = ChatEntriesList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, "T", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "All" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_1, "Y", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Team" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_1, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_2, "P", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Party" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_2, "" )
		return false
	end, false )
	ChatEntriesList.id = "ChatEntriesList"
	ChatClientInput.id = "ChatClientInput"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ChatEntriesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChatEntriesList:close()
		self.ChatClientInput:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

