require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Groups.GroupsRosterRowInternal" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )

CoD.GroupsRosterRow = InheritFrom( LUI.UIElement )
CoD.GroupsRosterRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsRosterRow )
	self.id = "GroupsRosterRow"
	self.soundSet = "FriendsMenu"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setAlpha( 0.4 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local internal = CoD.GroupsRosterRowInternal.new( menu, controller )
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
		JoinSessionInProgressOnGroupMember( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_JOIN_IN_PROGRESS" )
		return true
	end, false )
	self:addElement( internal )
	self.internal = internal
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( true, true, -2, 2 )
	LobbyMemberBackingFooter0:setTopBottom( false, false, 28, 34 )
	LobbyMemberBackingFooter0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.4 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				internal:completeAnimation()
				self.internal:setAlpha( 1 )
				self.internal:setZoom( 0 )
				self.clipFinished( internal, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 1 )
				self.BorderBakedMask0:setZoom( 50 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				self.clipFinished( BorderBakedSolid0, {} )
				local internalFrame2 = function ( internal, event )
					local internalFrame3 = function ( internal, event )
						if not event.interrupted then
							internal:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						internal:setZoom( 50 )
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
						internal:registerEventHandler( "transition_complete_keyframe", internalFrame3 )
					end
				end
				
				internal:completeAnimation()
				self.internal:setZoom( 50 )
				internalFrame2( internal, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 50 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				self.nextClip = "Focus"
			end,
			hideJoinableIcon = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setAlpha( 1 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setAlpha( 1 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.4 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local internalFrame2 = function ( internal, event )
					if not event.interrupted then
						internal:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					internal:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( internal, event )
					else
						internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				internal:completeAnimation()
				self.internal:setZoom( 0 )
				internalFrame2( internal, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					LobbyMemberBackingFooter0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setAlpha( 0 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 1 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setAlpha( 0.4 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local internalFrame2 = function ( internal, event )
					if not event.interrupted then
						internal:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					internal:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( internal, event )
					else
						internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				internal:completeAnimation()
				self.internal:setZoom( 50 )
				internalFrame2( internal, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					LobbyMemberBackingFooter0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 50 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
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
		element.BorderBakedMask0:close()
		element.BorderBakedSolid0:close()
		element.internal:close()
		element.LobbyMemberBackingFooter0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

