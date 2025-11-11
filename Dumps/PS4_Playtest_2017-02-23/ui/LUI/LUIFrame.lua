LUI.UIFrame = InheritFrom( LUI.UIElement )
LUI.UIFrame.new = function ( menu, controller, horizontalPadding, verticalPadding, scaleWithWidget )
	local self = LUI.UIElement.new()
	self:setClass( LUI.UIFrame )
	self.controller = controller
	self.framedWidget = nil
	self.widgetType = nil
	self.menu = menu
	self.horizontalPadding = horizontalPadding
	self.verticalPadding = verticalPadding
	self.m_focusable = true
	self.anyChildUsesUpdateState = true
	self.scaleWithWidget = scaleWithWidget
	self.backingWidget = nil
	self.backingXPadding = 0
	self.backingYPadding = 0
	return self
end

LUI.UIFrame.close = function ( self )
	if self.framedWidget ~= nil then
		CoD.Menu.RemoveFromCurrMenuNameList( self.framedWidget.id )
		self.framedWidget:close()
	end
	LUI.UIElement.close( self )
end

LUI.UIFrame.changeFrameWidget = function ( self, newWidgetType, ignoreDefaultFocus )
	if type( newWidgetType ) == "string" then
		newWidgetType = LUI.getTableFromPath( newWidgetType )
	end
	if self.widgetType == newWidgetType then
		return 
	elseif self.framedWidget then
		if self.hasFrameFocus then
			self.framedWidget:processEvent( {
				name = "lose_focus",
				controller = self.controller
			} )
		end
		CoD.Menu.RemoveFromCurrMenuNameList( self.framedWidget.id )
		self.framedWidget:close()
		self.framedWidget = nil
	end
	self.widgetType = newWidgetType
	if not self.widgetType then
		return 
	elseif self.widgetType and self.widgetType.new then
		self.framedWidget = self.widgetType.new( self.menu, self.controller )
		if self.scaleWithWidget then
			local l, t, r, b = self.framedWidget:getLocalRect()
			self:setWidth( r - l + self.horizontalPadding * 2 )
			self:setHeight( b - t + self.verticalPadding * 2 )
		end
		CoD.Menu.AddToCurrMenuNameList( self.framedWidget.id )
		self.framedWidget.m_disableNavigation = true
		self:addElement( self.framedWidget )
		self.framedWidget:setTopBottom( true, true, self.horizontalPadding, -self.horizontalPadding )
		self.framedWidget:setLeftRight( true, true, self.verticalPadding, -self.verticalPadding )
		if self.backingWidget then
			local a, t, r, b = self.backingWidget:getLocalRect()
			local t = 0
		end
		self.framedWidget:linkToElementModel( self, nil, false, function ( model )
			self.framedWidget:setModel( model )
		end )
		self.framedWidget:processEvent( {
			name = "update_state",
			menu = self.menu
		} )
		self.framedWidget:processEvent( {
			name = "menu_loaded",
			menu = self.menu
		} )
		if self.hasFrameFocus and not ignoreDefaultFocus then
			self.framedWidget:processEvent( {
				name = "gain_focus",
				controller = self.controller
			} )
		end
	end
end

LUI.UIFrame.setWidgetType = function ( self, widgetType )
	self:changeFrameWidget( widgetType )
end

LUI.UIFrame.updateFrameEvent = function ( self, event )
	self:changeFrameWidget( event.widget )
	return true
end

LUI.UIFrame.gainFocus = function ( self, event )
	if not self.m_focusable then
		return false
	else
		self.hasFrameFocus = true
		if event.saveEvent and event.saveEvent.originalEvent and event.saveEvent.originalEvent.idStack[1] == "framedWidget" and self.framedWidget then
			event.saveEvent.originalEvent.idStack[1] = self.framedWidget.id
			return self:dispatchEventToChildren( {
				name = "restore_focus",
				saveEvent = event.saveEvent.originalEvent
			} )
		else
			return self:dispatchEventToChildren( event )
		end
	end
end

LUI.UIFrame.loseFocus = function ( self, event )
	self.hasFrameFocus = false
	return self:dispatchEventToChildren( event )
end

LUI.UIFrame.restoreState = function ( self, event )
	if self.id == event.id then
		return self:processEvent( {
			name = "gain_focus",
			saveEvent = event.saveEvent
		} )
	else
		return false
	end
end

LUI.UIFrame.RecordCurrFocusedElemID = function ( self, event )
	if IsFreeCursorActive( event.controller ) then
		self.hasFrameFocus = true
	end
	if self.hasFrameFocus and self.framedWidget then
		event.idStack[1] = "framedWidget"
		return self:dispatchEventToParent( {
			name = event.name,
			controller = event.controller,
			id = self.id,
			idStack = {
				self.id
			},
			originalEvent = event
		} )
	else
		return false
	end
end

LUI.UIFrame.ClearRecordedFocus = function ( self, event )
	if self.hasFrameFocus then
		self.hasFrameFocus = false
	end
end

LUI.UIFrame.setBackingWidget = function ( self, backingWidget )
	if self.backingWidget then
		self.backingWidget:close()
		self.backingWidget = nil
	end
	if backingWidget and backingWidget.new then
		self.backingWidget = backingWidget.new( self.menu, self.controller )
		self.backingWidget:setPriority( -100 )
		self.backingWidget:setLeftRight( 0, 1, -self.backingXPadding, self.backingXPadding )
		self.backingWidget:setTopBottom( 0, 1, -self.backingYPadding, self.backingYPadding )
		self:addElement( self.backingWidget )
	end
end

LUI.UIFrame.setBackingWidgetXPadding = function ( self, xPadding )
	self.backingXPadding = xPadding
	if self.backingWidget then
		self.backingWidget:setLeftRight( 0, 1, -self.backingXPadding, self.backingXPadding )
	end
end

LUI.UIFrame.setBackingWidgetYPadding = function ( self, yPadding )
	self.backingYPadding = yPadding
	if self.backingWidget then
		self.backingWidget:setTopBottom( 0, 1, -self.backingYPadding, self.backingYPadding )
	end
end

LUI.UIFrame:registerEventHandler( "gain_focus", LUI.UIFrame.gainFocus )
LUI.UIFrame:registerEventHandler( "lose_focus", LUI.UIFrame.loseFocus )
LUI.UIFrame:registerEventHandler( "update_frame", LUI.UIFrame.updateFrameEvent )
LUI.UIFrame:registerEventHandler( "record_curr_focused_elem_id", LUI.UIFrame.RecordCurrFocusedElemID )
LUI.UIList:registerEventHandler( "clear_recorded_focus", LUI.UIFrame.ClearRecordedFocus )
LUI.UIFrame.id = "LUIFrame"
