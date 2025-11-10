require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabPip" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "classSetValue" )
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
	self:setLeftRight( true, false, 0, 198 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Tabs = CoD.basicTabList.new( menu, controller )
	Tabs:setLeftRight( false, false, -99, 99 )
	Tabs:setTopBottom( true, false, 0, 40 )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 1 )
	LUI.OverrideFunction_CallOriginalFirst( Tabs, "setWidth", function ( element, controller )
		ScaleToElementWidth( self, element )
	end )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	IndicatorsGrid:setLeftRight( false, false, -99, 99 )
	IndicatorsGrid:setTopBottom( true, false, 40, 48 )
	IndicatorsGrid:setWidgetType( CoD.ChooseClass_ClassSetTabPip )
	IndicatorsGrid:setHorizontalCount( 20 )
	IndicatorsGrid:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsControllerModelValueEqualToSelfModelValue( element, controller, "classSetValue", "classSetId" )
			end
		}
	} )
	IndicatorsGrid:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "classSetValue" ), function ( model )
		menu:updateElementState( IndicatorsGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "classSetValue"
		} )
	end )
	IndicatorsGrid:linkToElementModel( IndicatorsGrid, "classSetId", true, function ( model )
		menu:updateElementState( IndicatorsGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "classSetId"
		} )
	end )
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

