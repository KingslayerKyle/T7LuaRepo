-- 64d41f8d7e8bd30c0c73501862c31ecf
-- This hash is used for caching, delete to decompile the file again

CoD.BM_DecryptionNoBundleUses = InheritFrom( LUI.UIElement )
CoD.BM_DecryptionNoBundleUses.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_DecryptionNoBundleUses )
	self.id = "BM_DecryptionNoBundleUses"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 109 )
	self:setTopBottom( true, false, 0, 17 )
	
	local tradeAgainText = LUI.UIText.new()
	tradeAgainText:setLeftRight( false, false, -45.11, 45.11 )
	tradeAgainText:setTopBottom( true, false, 0, 17 )
	tradeAgainText:setRGB( 1, 0.2, 0.05 )
	tradeAgainText:setScale( 0.9 )
	tradeAgainText:setText( Engine.Localize( "MPUI_BM_NO_BUNDLE_USES_REMAINING" ) )
	tradeAgainText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	tradeAgainText:setLineSpacing( 1 )
	tradeAgainText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	tradeAgainText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( tradeAgainText )
	self.tradeAgainText = tradeAgainText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 0 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_BM_NO_BUNDLE_USES_REMAINING" ) )
				self.clipFinished( tradeAgainText, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.tradeAgainText:setScale( 1.1 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_BM_NO_BUNDLE_USES_REMAINING" ) )
				self.clipFinished( tradeAgainText, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		VisibleIncentiveRare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.tradeAgainText:setScale( 1.1 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_BM_NO_BUNDLE_USES_REMAINING" ) )
				self.clipFinished( tradeAgainText, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		VisibleIncentiveWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.tradeAgainText:setScale( 1.1 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_BM_NO_BRIBES_REMAINING" ) )
				self.clipFinished( tradeAgainText, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		VisibleGenericReward = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.tradeAgainText:setScale( 1.1 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_BM_NO_BRIBES_REMAINING" ) )
				self.clipFinished( tradeAgainText, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		VisibleBribeExpired = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_EXPIRED" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		VisibleNoDupesExpired = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_EXPIRED" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		VisibleGrandSlamReward = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 1 )
				self.tradeAgainText:setScale( 1.1 )
				self.tradeAgainText:setText( Engine.Localize( "MPUI_BM_NO_BRIBES_REMAINING" ) )
				self.clipFinished( tradeAgainText, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f16_local0 = IsModelValueLessThanOrEqualTo( controller, "CryptoKeyProgress.bundles", 0 )
				if f16_local0 then
					f16_local0 = IsPerControllerTablePropertyEnumValue( controller, "currencySpent", Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM )
					if f16_local0 then
						if not IsBundleActive( controller ) then
							f16_local0 = IsPerControllerTablePropertyValue( controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.BUNDLE )
						else
							f16_local0 = false
						end
					end
				end
				return f16_local0
			end
		},
		{
			stateName = "VisibleIncentiveRare",
			condition = function ( menu, element, event )
				return IsModelValueLessThanOrEqualTo( controller, "CryptoKeyProgress.incentiveRareBundles", 0 ) and IsPerControllerTablePropertyValue( controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.INCENTIVE_RARE_BUNDLE )
			end
		},
		{
			stateName = "VisibleIncentiveWeapon",
			condition = function ( menu, element, event )
				return IsModelValueLessThanOrEqualTo( controller, "CryptoKeyProgress.incentiveWeaponBundles", 0 ) and IsPerControllerTablePropertyValue( controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE )
			end
		},
		{
			stateName = "VisibleGenericReward",
			condition = function ( menu, element, event )
				return IsDecryptionCrateGenericReward( self, element, controller ) and not HasGenericRewardBundles( controller )
			end
		},
		{
			stateName = "VisibleGrandSlamReward",
			condition = function ( menu, element, event )
				return IsGrandSlamReward( controller ) and not HasGrandSlamRewardBundles( controller )
			end
		},
		{
			stateName = "VisibleBribeExpired",
			condition = function ( menu, element, event )
				local f21_local0
				if not IsBribeActive( controller ) then
					f21_local0 = IsPerControllerTablePropertyValue( controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.BRIBE )
				else
					f21_local0 = false
				end
				return f21_local0
			end
		},
		{
			stateName = "VisibleNoDupesExpired",
			condition = function ( menu, element, event )
				local f22_local0
				if not IsNoDupesCrateActive( controller ) then
					f22_local0 = IsPerControllerTablePropertyValue( controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE )
				else
					f22_local0 = false
				end
				return f22_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.incentiveRareBundles" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.incentiveRareBundles"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.incentiveWeaponBundles" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.incentiveWeaponBundles"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.genericRewardBundles" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.genericRewardBundles"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.weapon3XBundles" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.weapon3XBundles"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.limitedEditionCamoBundles" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.limitedEditionCamoBundles"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
