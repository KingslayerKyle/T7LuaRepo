CoD.BM_DecryptionTradeAgain = InheritFrom( LUI.UIElement )
CoD.BM_DecryptionTradeAgain.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_DecryptionTradeAgain )
	self.id = "BM_DecryptionTradeAgain"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 109 )
	self:setTopBottom( true, false, 0, 17 )
	
	local tradeAgainText = LUI.UIText.new()
	tradeAgainText:setLeftRight( true, false, 0, 109.21 )
	tradeAgainText:setTopBottom( true, false, 0, 17 )
	tradeAgainText:setRGB( 0.69, 0.9, 0.8 )
	tradeAgainText:setScale( 0.9 )
	tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_TRADE_AGAIN" ) )
	tradeAgainText:setTTF( "fonts/escom.ttf" )
	tradeAgainText:setLineSpacing( 1 )
	tradeAgainText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	tradeAgainText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( tradeAgainText )
	self.tradeAgainText = tradeAgainText
	
	self.clipsPerState = {
		Bribe = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_BRIBE" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		GenericReward = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_BRIBE" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		GrandSlamReward = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_BRIBE" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		PurchaseBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_BUNDLE" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.clipFinished( tradeAgainText, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 0 )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		Bundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_BUNDLE" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		TradeAgain = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_TRADE_AGAIN" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Bribe",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyValue( controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE )
			end
		},
		{
			stateName = "GenericReward",
			condition = function ( menu, element, event )
				return IsDecryptionCrateGenericReward( self, element, controller )
			end
		},
		{
			stateName = "GrandSlamReward",
			condition = function ( menu, element, event )
				return IsGrandSlamReward( controller )
			end
		},
		{
			stateName = "PurchaseBundle",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyEnumValue( controller, "currencySpent", Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM ) and IsModelValueEqualTo( controller, "CryptoKeyProgress.bundles", 0 )
			end
		},
		{
			stateName = "Bundle",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyEnumValue( controller, "currencySpent", Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM )
			end
		},
		{
			stateName = "TradeAgain",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.bundles" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.bundles"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

