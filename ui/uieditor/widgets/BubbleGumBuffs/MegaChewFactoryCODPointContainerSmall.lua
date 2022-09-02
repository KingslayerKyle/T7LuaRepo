-- 50d703dac5a02569c7578506bd542d04
-- This hash is used for caching, delete to decompile the file again

CoD.MegaChewFactoryCODPointContainerSmall = InheritFrom( LUI.UIElement )
CoD.MegaChewFactoryCODPointContainerSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MegaChewFactoryCODPointContainerSmall )
	self.id = "MegaChewFactoryCODPointContainerSmall"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 79 )
	self:setTopBottom( true, false, 0, 28 )
	
	local codpointIcon = LUI.UIImage.new()
	codpointIcon:setLeftRight( true, false, 1, 25 )
	codpointIcon:setTopBottom( true, false, 2, 26 )
	codpointIcon:setImage( RegisterImage( "uie_t7_icon_codpoints" ) )
	self:addElement( codpointIcon )
	self.codpointIcon = codpointIcon
	
	local codpointText = LUI.UITightText.new()
	codpointText:setLeftRight( true, false, 28, 78 )
	codpointText:setTopBottom( true, false, 3, 25 )
	codpointText:setTTF( "fonts/default.ttf" )
	codpointText:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			codpointText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", itemCODPointCost ) ) )
		end
	end )
	self:addElement( codpointText )
	self.codpointText = codpointText
	
	local codpointBalance = LUI.UITightText.new()
	codpointBalance:setLeftRight( true, false, 27, 77 )
	codpointBalance:setTopBottom( true, false, 3, 25 )
	codpointBalance:setAlpha( 0 )
	codpointBalance:setTTF( "fonts/default.ttf" )
	codpointBalance:subscribeToGlobalModel( controller, "CryptoKeyProgress", "codPoints", function ( model )
		local codPoints = Engine.GetModelValue( model )
		if codPoints then
			codpointBalance:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", codPoints ) ) )
		end
	end )
	self:addElement( codpointBalance )
	self.codpointBalance = codpointBalance
	
	self.clipsPerState = {
		HiddenForLootSale = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )

				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 1 )
				self.clipFinished( codpointIcon, {} )

				codpointText:completeAnimation()
				self.codpointText:setRGB( 0.93, 0.17, 0.17 )
				self.codpointText:setAlpha( 1 )
				self.clipFinished( codpointText, {} )

				codpointBalance:completeAnimation()
				self.codpointBalance:setAlpha( 0 )
				self.clipFinished( codpointBalance, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 1 )
				self.clipFinished( codpointIcon, {} )

				codpointText:completeAnimation()
				self.codpointText:setRGB( 1, 1, 1 )
				self.codpointText:setAlpha( 1 )
				self.clipFinished( codpointText, {} )

				codpointBalance:completeAnimation()
				self.codpointBalance:setAlpha( 0 )
				self.clipFinished( codpointBalance, {} )
			end
		},
		BalanceShownInsufficientFunds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 1 )
				self.clipFinished( codpointIcon, {} )

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
				self:setupElementClipCounter( 3 )

				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 1 )
				self.clipFinished( codpointIcon, {} )

				codpointText:completeAnimation()
				self.codpointText:setRGB( 1, 1, 1 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.codpointText:close()
		element.codpointBalance:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

