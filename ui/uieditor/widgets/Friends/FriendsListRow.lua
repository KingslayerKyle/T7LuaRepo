-- 490f82736a3ca0c258774473d163e9fe
-- This hash is used for caching, delete to decompile the file again

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
	menu:AddButtonCallbackFunction( internal, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		LobbyJoinFromFriendsMenu( self, f5_arg0, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_JOIN_IN_PROGRESS" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( internal, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "I", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		LobbyInviteFriend( self, f7_arg0, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_INVITE_GAME" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( internal, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.internal:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

