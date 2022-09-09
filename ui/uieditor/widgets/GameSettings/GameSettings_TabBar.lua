-- 457308d4512f7ac2e30082918ed7e75a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )

local PreLoadFunc = function ( self, controller )
	self.setActiveIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		self.Tabs:setActiveIndex( f2_arg1, f2_arg2 )
	end
	
end

CoD.GameSettings_TabBar = InheritFrom( LUI.UIElement )
CoD.GameSettings_TabBar.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_TabBar )
	self.id = "GameSettings_TabBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 38 )
	self.anyChildUsesUpdateState = true
	
	local FETabIdle00 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle00:setLeftRight( true, false, 0, 64 )
	FETabIdle00:setTopBottom( true, false, -2, 40 )
	self:addElement( FETabIdle00 )
	self.FETabIdle00 = FETabIdle00
	
	local Tabs = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	Tabs:setLeftRight( true, false, 64, 1678 )
	Tabs:setTopBottom( true, false, 0, 38 )
	Tabs:setDataSource( "CompetitiveSettingsRestrictionsTabs" )
	Tabs:setWidgetType( CoD.paintshopTabWidget )
	Tabs:setHorizontalCount( 8 )
	Tabs:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		UpdateDataSource( self, element, controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	Tabs:registerEventHandler( "mouse_left_click", function ( element, event )
		local f5_local0 = nil
		SelectItemIfPossible( self, element, controller, event )
		PlaySoundSetSound( self, "list_right" )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	Tabs:registerEventHandler( "list_item_gain_focus", function ( element, event )
		return nil
	end )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local FETabIdle0 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle0:setLeftRight( true, false, 1678, 2958 )
	FETabIdle0:setTopBottom( true, false, -2, 40 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETabIdle00:close()
		element.Tabs:close()
		element.FETabIdle0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
