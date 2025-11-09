LUI.UIFrame = InheritFrom( LUI.UIElement )
LUI.UIFrame.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local self = LUI.UIElement.new()
	self:setClass( LUI.UIFrame )
	self.controller = f1_arg1
	self.framedWidget = nil
	self.widgetType = nil
	self.menu = f1_arg0
	self.horizontalPadding = f1_arg2
	self.verticalPadding = f1_arg3
	self.m_focusable = true
	self.anyChildUsesUpdateState = true
	self.scaleWithWidget = true
	return self
end

LUI.UIFrame.close = function ( f2_arg0 )
	if f2_arg0.framedWidget ~= nil then
		CoD.Menu.RemoveFromCurrMenuNameList( f2_arg0.framedWidget.id )
		f2_arg0.framedWidget:close()
	end
	LUI.UIElement.close( f2_arg0 )
end

LUI.UIFrame.changeFrameWidget = function ( f3_arg0, f3_arg1, f3_arg2 )
	if type( f3_arg1 ) == "string" then
		f3_arg1 = LUI.getTableFromPath( f3_arg1 )
	end
	if f3_arg0.widgetType == f3_arg1 then
		return 
	elseif f3_arg0.framedWidget then
		if f3_arg0.hasFrameFocus then
			f3_arg0.framedWidget:processEvent( {
				name = "lose_focus",
				controller = f3_arg0.controller
			} )
		end
		CoD.Menu.RemoveFromCurrMenuNameList( f3_arg0.framedWidget.id )
		f3_arg0.framedWidget:close()
		f3_arg0.framedWidget = nil
	end
	f3_arg0.widgetType = f3_arg1
	if not f3_arg0.widgetType then
		return 
	elseif f3_arg0.widgetType and f3_arg0.widgetType.new then
		f3_arg0.framedWidget = f3_arg0.widgetType.new( f3_arg0.menu, f3_arg0.controller )
		if f3_arg0.scaleWithWidget then
			local f3_local0, f3_local1, f3_local2, f3_local3 = f3_arg0.framedWidget:getLocalRect()
			f3_arg0:setWidth( f3_local2 - f3_local0 + f3_arg0.horizontalPadding * 2 )
			f3_arg0:setHeight( f3_local3 - f3_local1 + f3_arg0.verticalPadding * 2 )
		end
		CoD.Menu.AddToCurrMenuNameList( f3_arg0.framedWidget.id )
		f3_arg0.framedWidget.m_disableNavigation = true
		f3_arg0:addElement( f3_arg0.framedWidget )
		f3_arg0.framedWidget:setTopBottom( true, true, f3_arg0.horizontalPadding, -f3_arg0.horizontalPadding )
		f3_arg0.framedWidget:setLeftRight( true, true, f3_arg0.verticalPadding, -f3_arg0.verticalPadding )
		f3_arg0.framedWidget:linkToElementModel( f3_arg0, nil, false, function ( model )
			f3_arg0.framedWidget:setModel( model )
		end )
		f3_arg0.framedWidget:processEvent( {
			name = "update_state",
			menu = f3_arg0.menu
		} )
		f3_arg0.framedWidget:processEvent( {
			name = "menu_loaded",
			menu = f3_arg0.menu
		} )
		if f3_arg0.hasFrameFocus and not f3_arg2 then
			f3_arg0.framedWidget:processEvent( {
				name = "gain_focus",
				controller = f3_arg0.controller
			} )
		end
	end
end

LUI.UIFrame.setWidgetType = function ( f5_arg0, f5_arg1 )
	f5_arg0:changeFrameWidget( f5_arg1 )
end

LUI.UIFrame.updateFrameEvent = function ( f6_arg0, f6_arg1 )
	f6_arg0:changeFrameWidget( f6_arg1.widget )
	return true
end

LUI.UIFrame.gainFocus = function ( f7_arg0, f7_arg1 )
	if not f7_arg0.m_focusable then
		return false
	else
		f7_arg0.hasFrameFocus = true
		if f7_arg1.saveEvent and f7_arg1.saveEvent.originalEvent and f7_arg1.saveEvent.originalEvent.idStack[1] == "framedWidget" and f7_arg0.framedWidget then
			f7_arg1.saveEvent.originalEvent.idStack[1] = f7_arg0.framedWidget.id
			return f7_arg0:dispatchEventToChildren( {
				name = "restore_focus",
				saveEvent = f7_arg1.saveEvent.originalEvent
			} )
		else
			return f7_arg0:dispatchEventToChildren( f7_arg1 )
		end
	end
end

LUI.UIFrame.loseFocus = function ( f8_arg0, f8_arg1 )
	f8_arg0.hasFrameFocus = false
	return f8_arg0:dispatchEventToChildren( f8_arg1 )
end

LUI.UIFrame.restoreState = function ( f9_arg0, f9_arg1 )
	if f9_arg0.id == f9_arg1.id then
		return f9_arg0:processEvent( {
			name = "gain_focus",
			saveEvent = f9_arg1.saveEvent
		} )
	else
		return false
	end
end

LUI.UIFrame.RecordCurrFocusedElemID = function ( f10_arg0, f10_arg1 )
	if f10_arg0.hasFrameFocus and f10_arg0.framedWidget then
		f10_arg1.idStack[1] = "framedWidget"
		return f10_arg0:dispatchEventToParent( {
			name = f10_arg1.name,
			controller = f10_arg1.controller,
			id = f10_arg0.id,
			idStack = {
				f10_arg0.id
			},
			originalEvent = f10_arg1
		} )
	else
		return false
	end
end

LUI.UIFrame:registerEventHandler( "gain_focus", LUI.UIFrame.gainFocus )
LUI.UIFrame:registerEventHandler( "lose_focus", LUI.UIFrame.loseFocus )
LUI.UIFrame:registerEventHandler( "update_frame", LUI.UIFrame.updateFrameEvent )
LUI.UIFrame:registerEventHandler( "record_curr_focused_elem_id", LUI.UIFrame.RecordCurrFocusedElemID )
LUI.UIFrame.id = "LUIFrame"
