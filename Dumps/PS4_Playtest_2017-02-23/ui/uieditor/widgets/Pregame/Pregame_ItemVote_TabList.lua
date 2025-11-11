require( "ui.uieditor.widgets.TabbedWidgets.basicTabWidget" )

local PostLoadFunc = function ( self, controller, menu )
	menu:AddButtonCallbackFunction( menu, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		self.grid:navigateItemLeft()
	end, AlwaysFalse, false )
	menu:AddButtonCallbackFunction( menu, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		self.grid:navigateItemRight()
	end, AlwaysFalse, false )
	self.setActiveIndex = function ( self, row, column )
		self.grid:setActiveIndex( row, column )
	end
	
	self:setForceMouseEventDispatch( true )
end

CoD.Pregame_ItemVote_TabList = InheritFrom( LUI.UIElement )
CoD.Pregame_ItemVote_TabList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_ItemVote_TabList )
	self.id = "Pregame_ItemVote_TabList"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 1635 )
	self:setTopBottom( 0, 0, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local grid = LUI.GridLayout.new( menu, controller, false, 0, 0, 3, 0, nil, nil, false, false, 0, 0, false, false )
	grid:setLeftRight( 0.5, 0.5, -817.5, 817.5 )
	grid:setTopBottom( 0, 0, 0, 60 )
	grid:setWidgetType( CoD.basicTabWidget )
	grid:setHorizontalCount( 6 )
	grid:setSpacing( 3 )
	grid:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		UpdateDataSource( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	grid:registerEventHandler( "mouse_left_click", function ( element, event )
		local retVal = nil
		SelectItemIfPossible( self, element, controller, event )
		PlaySoundSetSound( self, "list_right" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( grid )
	self.grid = grid
	
	self.resetProperties = function ()
		grid:completeAnimation()
		grid:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				grid:completeAnimation()
				self.grid:setAlpha( 0 )
				self.clipFinished( grid, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.grid:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

