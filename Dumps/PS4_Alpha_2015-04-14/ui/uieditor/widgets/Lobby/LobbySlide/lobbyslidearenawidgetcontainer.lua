require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideArenaWidget" )

CoD.LobbySlideArenaWidgetContainer = InheritFrom( LUI.UIElement )
CoD.LobbySlideArenaWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideArenaWidgetContainer )
	self.id = "LobbySlideArenaWidgetContainer"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 296 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LobbySlideArenaWidget0 = CoD.LobbySlideArenaWidget.new( menu, controller )
	LobbySlideArenaWidget0:setLeftRight( true, false, 0, 296 )
	LobbySlideArenaWidget0:setTopBottom( true, false, 0, 90 )
	LobbySlideArenaWidget0:setRGB( 1, 1, 1 )
	LobbySlideArenaWidget0.ListHeader.btnDisplayTextStroke:setText( Engine.Localize( "ALL TIME HIGH" ) )
	self:addElement( LobbySlideArenaWidget0 )
	self.LobbySlideArenaWidget0 = LobbySlideArenaWidget0
	
	LobbySlideArenaWidget0.id = "LobbySlideArenaWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.LobbySlideArenaWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.LobbySlideArenaWidget0:close()
		CoD.LobbySlideArenaWidgetContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

