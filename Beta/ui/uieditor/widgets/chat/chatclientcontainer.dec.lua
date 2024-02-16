require( "ui.uieditor.widgets.Chat.ChatClient" )

CoD.ChatClientContainer = InheritFrom( LUI.UIElement )
CoD.ChatClientContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientContainer )
	self.id = "ChatClientContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 426 )
	self:setTopBottom( true, false, 0, 400 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ChatClient = CoD.ChatClient.new( menu, controller )
	ChatClient:setLeftRight( true, false, 0, 426 )
	ChatClient:setTopBottom( true, false, 0, 400 )
	ChatClient:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		ChatClientResetState( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ChatClient:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return retVal
	end )
	ChatClient:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChatClient, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ChatClientHandleEscape( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:addElement( ChatClient )
	self.ChatClient = ChatClient
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hiden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChatClient:completeAnimation()
				self.ChatClient:setAlpha( 0 )
				self.clipFinished( ChatClient, {} )
			end
		}
	}
	ChatClient.id = "ChatClient"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ChatClient:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChatClient:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

