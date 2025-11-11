CoD.BlackMarketCODPointContainerSmall = InheritFrom( LUI.UIElement )
CoD.BlackMarketCODPointContainerSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackMarketCODPointContainerSmall )
	self.id = "BlackMarketCODPointContainerSmall"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 118 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local codpointIcon = LUI.UIImage.new()
	codpointIcon:setLeftRight( 0, 0, 2, 38 )
	codpointIcon:setTopBottom( 0, 0, 3, 39 )
	codpointIcon:setImage( RegisterImage( "uie_ui_codpoints_symbol_32x32" ) )
	self:addElement( codpointIcon )
	self.codpointIcon = codpointIcon
	
	local codpointText = LUI.UITightText.new()
	codpointText:setLeftRight( 0, 0, 42, 117 )
	codpointText:setTopBottom( 0, 0, 5, 38 )
	codpointText:setTTF( "fonts/default.ttf" )
	codpointText:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			codpointText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", modelValue ) ) )
		end
	end )
	self:addElement( codpointText )
	self.codpointText = codpointText
	
	local codpointBalance = LUI.UITightText.new()
	codpointBalance:setLeftRight( 0, 0, 40, 115 )
	codpointBalance:setTopBottom( 0, 0, 5, 38 )
	codpointBalance:setAlpha( 0 )
	codpointBalance:setTTF( "fonts/default.ttf" )
	codpointBalance:subscribeToGlobalModel( controller, "CryptoKeyProgress", "codPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			codpointBalance:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( codpointBalance )
	self.codpointBalance = codpointBalance
	
	self.resetProperties = function ()
		codpointText:completeAnimation()
		codpointIcon:completeAnimation()
		codpointBalance:completeAnimation()
		codpointText:setRGB( 1, 1, 1 )
		codpointText:setAlpha( 1 )
		codpointIcon:setAlpha( 1 )
		codpointBalance:setRGB( 1, 1, 1 )
		codpointBalance:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		HiddenForLootSale = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 0 )
				self.clipFinished( codpointIcon, {} )
				codpointText:completeAnimation()
				self.codpointText:setAlpha( 0 )
				self.clipFinished( codpointText, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 0 )
				self.clipFinished( codpointIcon, {} )
				codpointText:completeAnimation()
				self.codpointText:setAlpha( 0 )
				self.clipFinished( codpointText, {} )
			end
		},
		ShownInsufficientFunds = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				codpointText:completeAnimation()
				self.codpointText:setRGB( 0.93, 0.17, 0.17 )
				self.clipFinished( codpointText, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		BalanceShownInsufficientFunds = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				codpointText:completeAnimation()
				self.codpointText:setRGB( 0.93, 0.17, 0.17 )
				self.codpointText:setAlpha( 0 )
				self.clipFinished( codpointText, {} )
				codpointBalance:completeAnimation()
				self.codpointBalance:setRGB( 0.93, 0.17, 0.17 )
				self.codpointBalance:setAlpha( 1 )
				self.clipFinished( codpointBalance, {} )
			end
		},
		BalanceShown = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				codpointText:completeAnimation()
				self.codpointText:setAlpha( 0 )
				self.clipFinished( codpointText, {} )
				codpointBalance:completeAnimation()
				self.codpointBalance:setAlpha( 1 )
				self.clipFinished( codpointBalance, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HiddenForLootSale",
			condition = function ( menu, element, event )
				return IsLootSaleActive( controller ) and IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 )
			end
		},
		{
			stateName = "ShownInsufficientFunds",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 ) and not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" )
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 )
			end
		},
		{
			stateName = "BalanceShownInsufficientFunds",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 ) and not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" )
			end
		},
		{
			stateName = "BalanceShown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.codpointText:close()
		self.codpointBalance:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

