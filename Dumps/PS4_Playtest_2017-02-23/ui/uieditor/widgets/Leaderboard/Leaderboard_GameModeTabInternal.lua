require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeTabItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerControllerIndicator" )

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
	self:setLeftRight( 0, 0, 0, 330 )
	self:setTopBottom( 0, 0, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local IndicatorsGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
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
	IndicatorsGrid:setLeftRight( 0.5, 0.5, -139, 139 )
	IndicatorsGrid:setTopBottom( 0, 0, 60, 72 )
	IndicatorsGrid:setWidgetType( CoD.FE_FeaturedCardsContainerControllerIndicator )
	IndicatorsGrid:setHorizontalCount( 20 )
	self:addElement( IndicatorsGrid )
	self.IndicatorsGrid = IndicatorsGrid
	
	local Tabs = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	Tabs:setLeftRight( 0.5, 0.5, -165, 165 )
	Tabs:setTopBottom( 0, 0, 3, 60 )
	Tabs:setWidgetType( CoD.Leaderboard_GameModeTabItem )
	Tabs:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupTabs( menu, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.IndicatorsGrid:close()
		self.Tabs:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

