-- 039be4f82694ac2c34c5f01fdc668d26
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeTabItem" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "classSetValue" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:registerEventHandler( "class_set_name_change", function ( element, event )
		element.Tabs:updateDataSource()
	end )
end

CoD.ChooseClass_ClassSetTabInternal = InheritFrom( LUI.UIElement )
CoD.ChooseClass_ClassSetTabInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseClass_ClassSetTabInternal )
	self.id = "ChooseClass_ClassSetTabInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 220 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Tabs = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	Tabs:setLeftRight( false, false, -110, 110 )
	Tabs:setTopBottom( true, false, 0, 38 )
	Tabs:setWidgetType( CoD.Leaderboard_GameModeTabItem )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	IndicatorsGrid:setLeftRight( false, false, -50, 50 )
	IndicatorsGrid:setTopBottom( true, false, 40, 140 )
	IndicatorsGrid:setHorizontalCount( 20 )
	self:addElement( IndicatorsGrid )
	self.IndicatorsGrid = IndicatorsGrid
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Tabs:close()
		element.IndicatorsGrid:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

