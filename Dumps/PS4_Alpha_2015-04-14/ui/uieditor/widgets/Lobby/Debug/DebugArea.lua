require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.button" )

CoD.DebugArea = InheritFrom( LUI.UIElement )
CoD.DebugArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.DebugArea )
	self.id = "DebugArea"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 786 )
	self:setTopBottom( true, false, 0, 612 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local lblPath = LUI.UITightText.new()
	lblPath:setLeftRight( true, false, 244.5, 283.5 )
	lblPath:setTopBottom( true, false, 0, 25 )
	lblPath:setRGB( 1, 1, 1 )
	lblPath:setAlpha( 0.6 )
	lblPath:setText( Engine.Localize( "PATH" ) )
	lblPath:setTTF( "fonts/default.ttf" )
	self:addElement( lblPath )
	self.lblPath = lblPath
	
	local bdrColumns = CoD.Border.new( menu, controller )
	bdrColumns:setLeftRight( true, true, 0, -348 )
	bdrColumns:setTopBottom( true, true, 25, -0.5 )
	bdrColumns:setRGB( 1, 1, 1 )
	self:addElement( bdrColumns )
	self.bdrColumns = bdrColumns
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( true, false, 0, 438 )
	Border0:setTopBottom( true, false, 330.25, 611.5 )
	Border0:setRGB( 1, 1, 1 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local bdrDebug = CoD.Border.new( menu, controller )
	bdrDebug:setLeftRight( true, true, 0, 0 )
	bdrDebug:setTopBottom( true, true, 25.5, 0 )
	bdrDebug:setRGB( 1, 1, 1 )
	bdrDebug:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyToggleDebug( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( bdrDebug )
	self.bdrDebug = bdrDebug
	
	local btnToggleDebug = CoD.button.new( menu, controller )
	btnToggleDebug:setLeftRight( true, false, 0, 40 )
	btnToggleDebug:setTopBottom( true, false, -5, 25 )
	btnToggleDebug:setRGB( 1, 0.64, 0 )
	btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	btnToggleDebug:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyToggleDebug( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	btnToggleDebug:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		OnLoadToggleDebug( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnToggleDebug )
	self.btnToggleDebug = btnToggleDebug
	
	local btnToggleMsgLevel = CoD.button.new( menu, controller )
	btnToggleMsgLevel:setLeftRight( true, false, 364, 438 )
	btnToggleMsgLevel:setTopBottom( true, false, 330.25, 360.25 )
	btnToggleMsgLevel:setRGB( 1, 1, 1 )
	btnToggleMsgLevel.buttoninternal0.Text0:setText( Engine.Localize( "LIMITED" ) )
	btnToggleMsgLevel:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyToggleMsgLevel( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnToggleMsgLevel )
	self.btnToggleMsgLevel = btnToggleMsgLevel
	
	btnToggleDebug.id = "btnToggleDebug"
	btnToggleMsgLevel.id = "btnToggleMsgLevel"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.btnToggleDebug:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.bdrColumns:close()
		self.Border0:close()
		self.bdrDebug:close()
		self.btnToggleDebug:close()
		self.btnToggleMsgLevel:close()
		CoD.DebugArea.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

