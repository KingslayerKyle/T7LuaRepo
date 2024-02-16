-- 954b4b4a85a246622908ceaf77da2187
-- This hash is used for caching, delete to decompile the file again

CoD.MegaChewFactory_SaleActive = InheritFrom( LUI.UIElement )
CoD.MegaChewFactory_SaleActive.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MegaChewFactory_SaleActive )
	self.id = "MegaChewFactory_SaleActive"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 58 )
	self:setTopBottom( true, false, 0, 50 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 15, 47 )
	Label0:setTopBottom( true, false, 2, 24 )
	Label0:setRGB( 1, 0.55, 0.55 )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 9.5, 48.5 )
	bg:setTopBottom( true, false, 3, 42 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_promo_crossout" ) )
	self:addElement( bg )
	self.bg = bg
	
	local codpointText = LUI.UITightText.new()
	codpointText:setLeftRight( true, false, 15, 47 )
	codpointText:setTopBottom( true, false, 21, 43 )
	codpointText:setTTF( "fonts/default.ttf" )
	self:addElement( codpointText )
	self.codpointText = codpointText
	
	local codpointIcon = LUI.UIImage.new()
	codpointIcon:setLeftRight( true, false, -14, 10 )
	codpointIcon:setTopBottom( true, false, 1, 25 )
	codpointIcon:setImage( RegisterImage( "uie_t7_icon_codpoints" ) )
	self:addElement( codpointIcon )
	self.codpointIcon = codpointIcon
	
	self.Label0:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			Label0:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", GetLDCostBeforeLootDiscount( controller, itemCODPointCost ) ) ) )
		end
	end )
	self.codpointText:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			codpointText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", itemCODPointCost ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				codpointText:completeAnimation()
				self.codpointText:setAlpha( 0 )
				self.clipFinished( codpointText, {} )

				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 0 )
				self.clipFinished( codpointIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		SaleOnInsufficientFunds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )

				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				codpointText:completeAnimation()
				self.codpointText:setRGB( 0.93, 0.17, 0.17 )
				self.codpointText:setAlpha( 1 )
				self.clipFinished( codpointText, {} )

				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 1 )
				self.clipFinished( codpointIcon, {} )
			end
		},
		SaleOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )

				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				codpointText:completeAnimation()
				self.codpointText:setRGB( 1, 1, 1 )
				self.codpointText:setAlpha( 1 )
				self.clipFinished( codpointText, {} )

				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 1 )
				self.clipFinished( codpointIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "SaleOnInsufficientFunds",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumSaleActive( controller ) and not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" )
			end
		},
		{
			stateName = "SaleOn",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumSaleActive( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
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
	self:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Label0:close()
		element.codpointText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
