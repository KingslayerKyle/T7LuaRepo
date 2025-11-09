require( "ui.uieditor.widgets.Chat.ChatClientChatEntry" )

local f0_local0 = function ( f1_arg0 )
	f1_arg0:completeAnimation()
	f1_arg0:playClip( "FadeOut" )
end

local f0_local1 = function ()
	return false
end

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "update_state", function ( element, event )
		element.ChatClientChatEntry:setAlpha( 0 )
		local f4_local0 = Engine.GetModelValue( element:getModel( controller, "timeMs" ) ) + 45000 - Engine.milliseconds()
		if f4_local0 > 0 or f0_local1() then
			element.ChatClientChatEntry:processEvent( {
				name = "update_state",
				menu = element.menu
			} )
			local f4_local1, f4_local2, f4_local3, f4_local4 = element.ChatClientChatEntry:getLocalRect()
			element:setTopBottom( true, false, 0, f4_local4 )
			element.ChatClientChatEntry:setAlpha( 1 )
			if not f0_local1() then
				element:registerEventHandler( "hide_chat_entry", f0_local0 )
				element.timer = LUI.UITimer.new( f4_local0, "hide_chat_entry", true, element )
				element:addElement( element.timer )
			end
		end
	end )
end

CoD.ChatClientChatEntryContainerNew = InheritFrom( LUI.UIElement )
CoD.ChatClientChatEntryContainerNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientChatEntryContainerNew )
	self.id = "ChatClientChatEntryContainerNew"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 342 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local ChatClientChatEntry = CoD.ChatClientChatEntry.new( menu, controller )
	ChatClientChatEntry:setLeftRight( true, false, 0, 342 )
	ChatClientChatEntry:setTopBottom( true, false, 0, 18 )
	ChatClientChatEntry:linkToElementModel( self, nil, false, function ( model )
		ChatClientChatEntry:setModel( model, controller )
	end )
	self:addElement( ChatClientChatEntry )
	self.ChatClientChatEntry = ChatClientChatEntry
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 1 )
				local ChatClientChatEntryFrame2 = function ( ChatClientChatEntry, event )
					if not event.interrupted then
						ChatClientChatEntry:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ChatClientChatEntry:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ChatClientChatEntry, event )
					else
						ChatClientChatEntry:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChatClientChatEntry:completeAnimation()
				self.ChatClientChatEntry:setAlpha( 1 )
				ChatClientChatEntryFrame2( ChatClientChatEntry, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChatClientChatEntry:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

