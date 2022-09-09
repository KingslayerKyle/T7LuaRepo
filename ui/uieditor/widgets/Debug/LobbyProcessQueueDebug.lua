-- a610c0e45e2d949cb559ca932c8cb7b8
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local List = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, true )
	List:makeFocusable()
	List:setLeftRight( true, false, 0, 500 )
	List:setTopBottom( true, false, 0, 659 )
	List:setDataSource( "LobbyProcessQueueInfo" )
	List:setWidgetType( CoD.LobbyProcessQueueDebugItem )
	List:setVerticalCount( 60 )
	List:setSpacing( 1 )
	self:addElement( List )
	self.List = List
	
	List.id = "List"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.List:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.List:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
