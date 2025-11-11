require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeTabItem" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "classSetValue" )
end

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "class_set_name_change", function ( self, event )
		self.Tabs:updateDataSource()
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
	self:setLeftRight( 0, 0, 0, 330 )
	self:setTopBottom( 0, 0, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local Tabs = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	Tabs:setLeftRight( 0.5, 0.5, -165, 165 )
	Tabs:setTopBottom( 0, 0, 0, 57 )
	Tabs:setWidgetType( CoD.Leaderboard_GameModeTabItem )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	IndicatorsGrid:setLeftRight( 0.5, 0.5, 0, 0 )
	IndicatorsGrid:setTopBottom( 0, 0, 135, 135 )
	IndicatorsGrid:setHorizontalCount( 20 )
	self:addElement( IndicatorsGrid )
	self.IndicatorsGrid = IndicatorsGrid
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Tabs:close()
		self.IndicatorsGrid:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

