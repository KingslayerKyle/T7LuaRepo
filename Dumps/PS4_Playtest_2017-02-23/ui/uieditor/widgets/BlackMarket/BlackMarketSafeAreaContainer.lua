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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local NextKeyProgress = CoD.NextKeyProgress.new( menu, controller )
	NextKeyProgress:setLeftRight( 1, 1, -642, -110 )
	NextKeyProgress:setTopBottom( 0, 0, 44, 119 )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( menu, controller )
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
	StartMenuCurrencyCounts:setLeftRight( 1, 1, -762, -456 )
	StartMenuCurrencyCounts:setTopBottom( 0, 0, 71, 116 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local Guides = LUI.UIImage.new()
	Guides:setLeftRight( 0, 0, 511, 1835 )
	Guides:setTopBottom( 0, 0, 122, 189 )
	Guides:setAlpha( 0 )
	self:addElement( Guides )
	self.Guides = Guides
	
	local Gudies2 = LUI.UIImage.new()
	Gudies2:setLeftRight( 0, 0, 511, 1835 )
	Gudies2:setTopBottom( 0, 0, -19, 48 )
	Gudies2:setAlpha( 0 )
	self:addElement( Gudies2 )
	self.Gudies2 = Gudies2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.NextKeyProgress:close()
		self.StartMenuCurrencyCounts:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

