-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.TabbedWidgets.basicTabWidget" )

local PostLoadFunc = function ( self, controller, menu )
	menu:AddButtonCallbackFunction( menu, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		self.grid:navigateItemLeft()
	end, AlwaysFalse, false )
	menu:AddButtonCallbackFunction( menu, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		self.grid:navigateItemRight()
	end, AlwaysFalse, false )
	self.setActiveIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
		f4_arg0.grid:setActiveIndex( f4_arg1, f4_arg2 )
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
	self:setLeftRight( true, false, 0, 1090 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local grid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	grid:setLeftRight( false, false, -545, 545 )
	grid:setTopBottom( true, false, 0, 40 )
	grid:setWidgetType( CoD.basicTabWidget )
	grid:setHorizontalCount( 6 )
	grid:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		UpdateDataSource( self, element, controller )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	grid:registerEventHandler( "mouse_left_click", function ( element, event )
		local f7_local0 = nil
		SelectItemIfPossible( self, element, controller, event )
		PlaySoundSetSound( self, "list_right" )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.grid:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

