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
	internal:linkToElementModel( self, nil, false, function ( model )
		internal:setModel( model, controller )
	end )
	internal:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	internal:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( internal, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( element, menu, controller, model )
		LobbyJoinFromFriendsMenu( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_JOIN_IN_PROGRESS" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( internal, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "I", function ( element, menu, controller, model )
		LobbyInviteFriend( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_INVITE_GAME" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( internal, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

