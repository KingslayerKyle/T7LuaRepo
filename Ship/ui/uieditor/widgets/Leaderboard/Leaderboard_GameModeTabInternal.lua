-- f0fa4d1d1c0038368a206ba11947a645
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerControllerIndicator" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeTabItem" )

CoD.Leaderboard_GameModeTabInternal = InheritFrom( LUI.UIElement )
CoD.Leaderboard_GameModeTabInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_GameModeTabInternal )
	self.id = "Leaderboard_GameModeTabInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 220 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	IndicatorsGrid:setLeftRight( false, false, -99, 99 )
	IndicatorsGrid:setTopBottom( true, false, 40, 48 )
	IndicatorsGrid:setWidgetType( CoD.FE_FeaturedCardsContainerControllerIndicator )
	IndicatorsGrid:setHorizontalCount( 20 )
	IndicatorsGrid:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToSelfModelValue( element, controller, "leaderboardDef", "lbDef" )
			end
		}
	} )
	IndicatorsGrid:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ), function ( model )
		menu:updateElementState( IndicatorsGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboardDef"
		} )
	end )
	IndicatorsGrid:linkToElementModel( IndicatorsGrid, "lbDef", true, function ( model )
		menu:updateElementState( IndicatorsGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbDef"
		} )
	end )
	self:addElement( IndicatorsGrid )
	self.IndicatorsGrid = IndicatorsGrid
	
	local Tabs = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	Tabs:setLeftRight( false, false, -110, 110 )
	Tabs:setTopBottom( true, false, 2, 40 )
	Tabs:setWidgetType( CoD.Leaderboard_GameModeTabItem )
	Tabs:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		SetupTabs( menu, element, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.IndicatorsGrid:close()
		element.Tabs:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
