require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )

local PreLoadFunc = function ( self, controller )
	self.setActiveIndex = function ( parentElement, row, column )
		self.Tabs:setActiveIndex( row, column )
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local FETabIdle00 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle00:setLeftRight( 0, 0, 0, 96 )
	FETabIdle00:setTopBottom( 0, 0, -3, 60 )
	self:addElement( FETabIdle00 )
	self.FETabIdle00 = FETabIdle00
	
	local Tabs = LUI.GridLayout.new( menu, controller, false, 0, 0, 3, 0, nil, nil, false, false, 0, 0, false, false )
	Tabs:setLeftRight( 0, 0, 96, 2517 )
	Tabs:setTopBottom( 0, 0, 0, 57 )
	Tabs:setWidgetType( CoD.paintshopTabWidget )
	Tabs:setHorizontalCount( 8 )
	Tabs:setSpacing( 3 )
	Tabs:setDataSource( "CompetitiveSettingsRestrictionsTabs" )
	Tabs:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		UpdateDataSource( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Tabs:registerEventHandler( "mouse_left_click", function ( element, event )
		local retVal = nil
		SelectItemIfPossible( self, element, controller, event )
		PlaySoundSetSound( self, "list_right" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Tabs:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		return retVal
	end )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local FETabIdle0 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle0:setLeftRight( 0, 0, 2517, 4437 )
	FETabIdle0:setTopBottom( 0, 0, -3, 60 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETabIdle00:close()
		self.Tabs:close()
		self.FETabIdle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

