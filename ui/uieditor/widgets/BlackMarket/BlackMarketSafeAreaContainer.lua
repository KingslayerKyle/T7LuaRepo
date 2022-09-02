-- db992d8cf56573395fdf42abc1bc86bc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.NextKeyProgress" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )

CoD.BlackMarketSafeAreaContainer = InheritFrom( LUI.UIElement )
CoD.BlackMarketSafeAreaContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BlackMarketSafeAreaContainer )
	self.id = "BlackMarketSafeAreaContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local NextKeyProgress = CoD.NextKeyProgress.new( menu, controller )
	NextKeyProgress:setLeftRight( false, true, -428, -73 )
	NextKeyProgress:setTopBottom( true, false, 29, 79 )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( menu, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -508, -304 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 47, 77 )
	StartMenuCurrencyCounts:mergeStateConditions( {
		{
			stateName = "ShowKeysAndVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyKeys",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownAllExceptVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownAllExceptCryptoKeys",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local Guides = LUI.UIImage.new()
	Guides:setLeftRight( true, false, 340.38, 1223 )
	Guides:setTopBottom( true, false, 80.85, 125.85 )
	Guides:setAlpha( 0 )
	self:addElement( Guides )
	self.Guides = Guides
	
	local Gudies2 = LUI.UIImage.new()
	Gudies2:setLeftRight( true, false, 340.38, 1223 )
	Gudies2:setTopBottom( true, false, -13.15, 31.85 )
	Gudies2:setAlpha( 0 )
	self:addElement( Gudies2 )
	self.Gudies2 = Gudies2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NextKeyProgress:close()
		element.StartMenuCurrencyCounts:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

