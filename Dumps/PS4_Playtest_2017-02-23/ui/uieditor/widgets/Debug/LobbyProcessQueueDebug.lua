require( "ui.uieditor.widgets.Debug.LobbyProcessQueueDebugItem" )

CoD.LobbyProcessQueueDebug = InheritFrom( LUI.UIElement )
CoD.LobbyProcessQueueDebug.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyProcessQueueDebug )
	self.id = "LobbyProcessQueueDebug"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local List = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	List:makeFocusable()
	List:setLeftRight( 0, 0, 0, 750 )
	List:setTopBottom( 0, 0, -15, 1003 )
	List:setWidgetType( CoD.LobbyProcessQueueDebugItem )
	List:setVerticalCount( 60 )
	List:setDataSource( "LobbyProcessQueueInfo" )
	self:addElement( List )
	self.List = List
	
	List.id = "List"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.List:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

