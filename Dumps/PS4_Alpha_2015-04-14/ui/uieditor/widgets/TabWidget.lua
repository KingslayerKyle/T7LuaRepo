require( "ui.uieditor.widgets.TabbedWidgets.basicTabWidget" )

CoD.TabWidget = InheritFrom( LUI.UIElement )
CoD.TabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.TabWidget )
	self.id = "TabWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.57, 0.58, 0.59 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local headerBackground = LUI.UIImage.new()
	headerBackground:setLeftRight( true, true, 0, 0 )
	headerBackground:setTopBottom( true, false, 0, 100 )
	headerBackground:setRGB( 0.83, 0.83, 0.83 )
	headerBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( headerBackground )
	self.headerBackground = headerBackground
	
	local frameBackground = LUI.UIImage.new()
	frameBackground:setLeftRight( true, true, 96, -96 )
	frameBackground:setTopBottom( true, true, 100, -54 )
	frameBackground:setRGB( 0.95, 0.95, 0.95 )
	frameBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( frameBackground )
	self.frameBackground = frameBackground
	
	local widgetFrame = LUI.UIFrame.new( menu, controller, 0, 0 )
	widgetFrame:setLeftRight( true, true, 96, -96 )
	widgetFrame:setTopBottom( true, true, 100, -54 )
	widgetFrame:setRGB( 1, 1, 1 )
	self:addElement( widgetFrame )
	self.widgetFrame = widgetFrame
	
	local tabGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	tabGrid:setLeftRight( true, true, -486, 486 )
	tabGrid:setTopBottom( true, false, 60, 100 )
	tabGrid:setRGB( 1, 1, 1 )
	tabGrid:setDataSource( "TabbedView" )
	tabGrid:setWidgetType( CoD.basicTabWidget )
	tabGrid:setHorizontalCount( 6 )
	tabGrid:registerEventHandler( "unused_gamepad_button", function ( element, event )
		local retVal = nil
		local controller = event.controller or controller
		if IsSelectPreviousTabEvent( event ) then
			SelectPreviousItemIfPossible( self, element, controller )
		elseif IsSelectNextTabEvent( event ) then
			SelectNextItemIfPossible( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	tabGrid:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if IsSelectPreviousTabEvent( event ) then
			SelectPreviousItemIfPossible( self, element, controller )
		elseif IsSelectNextTabEvent( event ) then
			SelectNextItemIfPossible( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( tabGrid )
	self.tabGrid = tabGrid
	
	widgetFrame:linkToElementModel( tabGrid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			widgetFrame:changeFrameWidget( modelValue )
		end
	end )
	widgetFrame.id = "widgetFrame"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.widgetFrame:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.tabGrid:close()
		self.widgetFrame:close()
		CoD.TabWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

