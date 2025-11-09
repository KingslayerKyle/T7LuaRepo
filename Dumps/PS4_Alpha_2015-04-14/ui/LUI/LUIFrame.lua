LUI.UIFrame = InheritFrom( LUI.UIElement )
LUI.UIFrame.new = function ( menu, controller, horizontalPadding, verticalPadding )
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
	return self
end

LUI.UIFrame.close = function ( self )
	if self.framedWidget ~= nil then
		self.framedWidget:close()
	end
	LUI.UIElement.close( self )
end

LUI.UIFrame.changeFrameWidget = function ( self, newWidgetType, ignoreDefaultFocus )
	if self.widgetType == newWidgetType then
		return 
	elseif self.framedWidget then
		if self.hasFrameFocus then
			self.framedWidget:processEvent( {
				name = "lose_focus",
				controller = self.controller
			} )
		end
		self.framedWidget:close()
		self.framedWidget = nil
	end
	self.widgetType = newWidgetType
	if not self.widgetType then
		return 
	elseif type( self.widgetType ) == "string" then
		self.widgetType = LUI.getTableFromPath( self.widgetType )
	end
	if self.widgetType and self.widgetType.new then
		self.framedWidget = self.widgetType.new( self.menu, self.controller )
		self.framedWidget.m_disableNavigation = true
		self:addElement( self.framedWidget )
		self.framedWidget:setTopBottom( true, true, self.horizontalPadding, -self.horizontalPadding )
		self.framedWidget:setLeftRight( true, true, self.verticalPadding, -self.verticalPadding )
		self.framedWidget:linkToElementModel( self, nil, false, function ( model )
			self.framedWidget:setModel( model )
		end )
		self.framedWidget:processEvent( {
			name = "update_state",
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
		return self:dispatchEventToChildren( event )
	end
end

LUI.UIFrame.loseFocus = function ( self, event )
	self.hasFrameFocus = false
	return self:dispatchEventToChildren( event )
end

LUI.UIFrame.restoreState = function ( self, event )
	if self.id == event.id then
		self:processEvent( {
			name = "gain_focus",
			saveEvent = event.saveEvent
		} )
		return true
	else
		return self:dispatchEventToChildren( event )
	end
end

LUI.UIFrame.RecordCurrFocusedElemID = function ( self, event )
	if self.hasFrameFocus and self.frameWidget then
		self:dispatchEventToParent( {
			name = event.name,
			id = self.id
		} )
		return true
	else
		return false
	end
end

LUI.UIFrame:registerEventHandler( "gain_focus", LUI.UIFrame.gainFocus )
LUI.UIFrame:registerEventHandler( "lose_focus", LUI.UIFrame.loseFocus )
LUI.UIFrame:registerEventHandler( "update_frame", LUI.UIFrame.updateFrameEvent )
LUI.UIFrame:registerEventHandler( "record_curr_focused_elem_id", LUI.UIFrame.RecordCurrFocusedElemID )
LUI.UIFrame.id = "LUIFrame"
