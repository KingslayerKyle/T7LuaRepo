require( "ui.uieditor.widgets.LobbyMemberRow" )
require( "ui.uieditor.widgets.SplitscreenSignInRow" )

CoD.PartyLobbyMembers = InheritFrom( LUI.UIElement )
CoD.PartyLobbyMembers.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PartyLobbyMembers )
	self.id = "PartyLobbyMembers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 475 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local List0 = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( false, true, -360, 0 )
	List0:setTopBottom( true, false, 0, 450 )
	List0:setRGB( 1, 1, 1 )
	List0:setDataSource( "PartyLobbyMembers" )
	List0:setWidgetType( CoD.LobbyMemberRow )
	List0:setVerticalCount( 18 )
	List0:setSpacing( 0 )
	self:addElement( List0 )
	self.List0 = List0
	
	local SplitscreenSignInRow0 = CoD.SplitscreenSignInRow.new( menu, controller )
	SplitscreenSignInRow0:setLeftRight( false, true, -360, 0 )
	SplitscreenSignInRow0:setTopBottom( true, false, 450, 475 )
	SplitscreenSignInRow0:setRGB( 1, 1, 1 )
	SplitscreenSignInRow0:mergeStateConditions( {
		{
			stateName = "WaitingForController",
			condition = function ( menu, element, event )
				return IsWaitingForAdditionalControllerToPlaySplitscreen()
			end
		}
	} )
	if SplitscreenSignInRow0.m_eventHandlers.controller_inserted then
		local currentEv = SplitscreenSignInRow0.m_eventHandlers.controller_inserted
		SplitscreenSignInRow0:registerEventHandler( "controller_inserted", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		SplitscreenSignInRow0:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if SplitscreenSignInRow0.m_eventHandlers.controller_removed then
		local currentEv = SplitscreenSignInRow0.m_eventHandlers.controller_removed
		SplitscreenSignInRow0:registerEventHandler( "controller_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		SplitscreenSignInRow0:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if SplitscreenSignInRow0.m_eventHandlers.controller_used_start then
		local currentEv = SplitscreenSignInRow0.m_eventHandlers.controller_used_start
		SplitscreenSignInRow0:registerEventHandler( "controller_used_start", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		SplitscreenSignInRow0:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if SplitscreenSignInRow0.m_eventHandlers.controller_used_stop then
		local currentEv = SplitscreenSignInRow0.m_eventHandlers.controller_used_stop
		SplitscreenSignInRow0:registerEventHandler( "controller_used_stop", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		SplitscreenSignInRow0:registerEventHandler( "controller_used_stop", LUI.UIElement.updateState )
	end
	self:addElement( SplitscreenSignInRow0 )
	self.SplitscreenSignInRow0 = SplitscreenSignInRow0
	
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.List0:close()
		self.SplitscreenSignInRow0:close()
		CoD.PartyLobbyMembers.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

