require( "ui.uieditor.widgets.TabbedWidgets.basicTabWidget" )

CoD.craftTabList = InheritFrom( LUI.UIElement )
CoD.craftTabList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.craftTabList )
	self.id = "craftTabList"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1090 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local grid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	grid:setLeftRight( true, false, 0, 1090 )
	grid:setTopBottom( true, false, 0, 40 )
	grid:setRGB( 1, 1, 1 )
	grid:setDataSource( "TabbedView" )
	grid:setWidgetType( CoD.basicTabWidget )
	grid:setHorizontalCount( 6 )
	grid:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if IsSelectPreviousTabEvent( event ) and not PropertyIsTrue( self, "m_disableNavigation" ) then
			SelectPreviousItemIfPossible( self, element, controller )
		elseif IsSelectNextTabEvent( event ) and not PropertyIsTrue( self, "m_disableNavigation" ) then
			SelectNextItemIfPossible( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	grid:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		UpdateDataSource( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( grid )
	self.grid = grid
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				grid:completeAnimation()
				self.grid:setAlpha( 1 )
				self.clipFinished( grid, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				grid:completeAnimation()
				self.grid:setAlpha( 0 )
				self.clipFinished( grid, {} )
			end
		}
	}
	self.close = function ( self )
		self.grid:close()
		CoD.craftTabList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

