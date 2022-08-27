-- c71a01212890a5a1b2ce2606e54fa889
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Chat.ChatClient" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:setForceMouseEventDispatch( true )
end

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
		local f3_local0 = nil
		ChatClientResetState( self, element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
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
	self:mergeStateConditions( {
		{
			stateName = "Hiden",
			condition = function ( menu, element, event )
				return not ChatClientShow( controller )
			end
		}
	} )
	ChatClient.id = "ChatClient"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ChatClient:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChatClient:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

