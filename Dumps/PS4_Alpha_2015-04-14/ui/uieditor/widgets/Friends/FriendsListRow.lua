require( "ui.uieditor.widgets.Friends.FriendsListRow_Internal" )

CoD.FriendsListRow = InheritFrom( LUI.UIElement )
CoD.FriendsListRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FriendsListRow )
	self.id = "FriendsListRow"
	self.soundSet = "FriendsMenu"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 64 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.FriendsListRow_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	internal:setRGB( 1, 1, 1 )
	internal:linkToElementModel( self, nil, false, function ( model )
		internal:setModel( model, controller )
	end )
	internal.buttonPromptAddFunctions = {}
	internal.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_JOIN_IN_PROGRESS" ), "J", element )
			return true
		else
			
		end
	end
	
	internal.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_INVITE_GAME" ), "I", element )
			return true
		else
			
		end
	end
	
	internal.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
			return true
		else
			
		end
	end
	
	internal:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "J") and element:isInFocus() then
			LobbyJoinFromFriendsMenu( self, element, controller )
			return true
		elseif not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "I") and element:isInFocus() then
			LobbyInviteFriend( self, element, controller )
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") and element:isInFocus() then
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	internal:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		element.buttonPromptAddFunctions.alt2( menu, element, event )
		element.buttonPromptAddFunctions.primary( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	internal:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		menu:removeButtonPrompt( "alt2", element )
		menu:removeButtonPrompt( "primary", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				internal.highlight:completeAnimation()
				self.internal:setAlpha( 1 )
				self.internal.highlight:setAlpha( 0 )
				self.clipFinished( internal, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local internalFrame2 = function ( internal, event )
					local internalFrame3 = function ( internal, event )
						if not event.interrupted then
							internal:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
							internal.highlight:beginAnimation( "subkeyframe", 509, false, false, CoD.TweenType.Linear )
						end
						internal.highlight:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( internal, event )
						else
							internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						internalFrame3( internal, event )
						return 
					else
						internal:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						internal.highlight:beginAnimation( "subkeyframe", 490, false, false, CoD.TweenType.Linear )
						internal.highlight:setAlpha( 1 )
						internal:registerEventHandler( "transition_complete_keyframe", internalFrame3 )
					end
				end
				
				internal:completeAnimation()
				internal.highlight:completeAnimation()
				self.internal.highlight:setAlpha( 0 )
				internalFrame2( internal, {} )
				self.nextClip = "Focus"
			end,
			hideJoinableIcon = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		hideJoinableIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			hide = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	internal.id = "internal"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.internal:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.internal:close()
		CoD.FriendsListRow.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

