require( "ui.uieditor.widgets.BlackMarket.BM_BribeOffertime" )

CoD.BM_BundleOffertime = InheritFrom( LUI.UIElement )
CoD.BM_BundleOffertime.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_BundleOffertime )
	self.id = "BM_BundleOffertime"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local BMBribeOfferTime = CoD.BM_BribeOffertime.new( menu, controller )
	BMBribeOfferTime:setLeftRight( true, false, 0, 352 )
	BMBribeOfferTime:setTopBottom( false, true, -20, 0 )
	BMBribeOfferTime:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_bribe", function ( model )
		local autoeventTimerBribe = Engine.GetModelValue( model )
		if autoeventTimerBribe then
			BMBribeOfferTime.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerBribe ) )
		end
	end )
	BMBribeOfferTime:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				local f3_local0
				if not IsBribeActive( controller ) then
					f3_local0 = IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.BRIBE )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	BMBribeOfferTime:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( BMBribeOfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	BMBribeOfferTime:linkToElementModel( BMBribeOfferTime, "supplyDropType", true, function ( model )
		menu:updateElementState( BMBribeOfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMBribeOfferTime )
	self.BMBribeOfferTime = BMBribeOfferTime
	
	local Label00 = LUI.UIText.new()
	Label00:setLeftRight( false, false, -176, 176 )
	Label00:setTopBottom( true, false, -1, 29 )
	Label00:setRGB( 0.39, 0.5, 0.09 )
	Label00:setAlpha( 0 )
	Label00:setText( LocalizeToUpperString( GetFrameTitleForCurrentBribe( controller, "MPUI_BM_BRIBE" ) ) )
	Label00:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Label00:setLetterSpacing( 0.5 )
	Label00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Label00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Label00 )
	self.Label00 = Label00
	
	local BMBribeOffertime0 = CoD.BM_BribeOffertime.new( menu, controller )
	BMBribeOffertime0:setLeftRight( true, false, 0, 352 )
	BMBribeOffertime0:setTopBottom( false, true, -20, 0 )
	BMBribeOffertime0:setAlpha( 0 )
	BMBribeOffertime0:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_bribe", function ( model )
		local autoeventTimerBribe = Engine.GetModelValue( model )
		if autoeventTimerBribe then
			BMBribeOffertime0.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerBribe ) )
		end
	end )
	BMBribeOffertime0:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsBribeActive( controller ) then
					f7_local0 = IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.BRIBE )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	BMBribeOffertime0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( BMBribeOffertime0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	BMBribeOffertime0:linkToElementModel( BMBribeOffertime0, "supplyDropType", true, function ( model )
		menu:updateElementState( BMBribeOffertime0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMBribeOffertime0 )
	self.BMBribeOffertime0 = BMBribeOffertime0
	
	local BMTrifectaOffertime = CoD.BM_BribeOffertime.new( menu, controller )
	BMTrifectaOffertime:setLeftRight( true, false, 0, 352 )
	BMTrifectaOffertime:setTopBottom( false, true, -20, 0 )
	BMTrifectaOffertime:setAlpha( 0 )
	BMTrifectaOffertime:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_trifecta_promo", function ( model )
		local autoeventTimerTrifectaPromo = Engine.GetModelValue( model )
		if autoeventTimerTrifectaPromo then
			BMTrifectaOffertime.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerTrifectaPromo ) )
		end
	end )
	BMTrifectaOffertime:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsTrifectaBundleActive( controller ) then
					f11_local0 = IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.TRIFECTA )
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	BMTrifectaOffertime:linkToElementModel( BMTrifectaOffertime, "supplyDropType", true, function ( model )
		menu:updateElementState( BMTrifectaOffertime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMTrifectaOffertime )
	self.BMTrifectaOffertime = BMTrifectaOffertime
	
	local BMRareDiscountOfferTime = CoD.BM_BribeOffertime.new( menu, controller )
	BMRareDiscountOfferTime:setLeftRight( true, false, 0, 352 )
	BMRareDiscountOfferTime:setTopBottom( false, true, -20, 0 )
	BMRareDiscountOfferTime:setAlpha( 0 )
	BMRareDiscountOfferTime:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_lootdiscount_promo", function ( model )
		local autoeventTimerLootdiscountPromo = Engine.GetModelValue( model )
		if autoeventTimerLootdiscountPromo then
			BMRareDiscountOfferTime.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerLootdiscountPromo ) )
		end
	end )
	BMRareDiscountOfferTime:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsBribeActive( controller ) then
					f14_local0 = IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.BRIBE )
				else
					f14_local0 = false
				end
				return f14_local0
			end
		}
	} )
	BMRareDiscountOfferTime:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( BMRareDiscountOfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	BMRareDiscountOfferTime:linkToElementModel( BMRareDiscountOfferTime, "supplyDropType", true, function ( model )
		menu:updateElementState( BMRareDiscountOfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMRareDiscountOfferTime )
	self.BMRareDiscountOfferTime = BMRareDiscountOfferTime
	
	local BMHundredBundleOfferTime = CoD.BM_BribeOffertime.new( menu, controller )
	BMHundredBundleOfferTime:setLeftRight( true, false, 0, 352 )
	BMHundredBundleOfferTime:setTopBottom( false, true, -20, 0 )
	BMHundredBundleOfferTime:setAlpha( 0 )
	BMHundredBundleOfferTime:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_bribe", function ( model )
		local autoeventTimerBribe = Engine.GetModelValue( model )
		if autoeventTimerBribe then
			BMHundredBundleOfferTime.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerBribe ) )
		end
	end )
	BMHundredBundleOfferTime:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				local f18_local0
				if not IsHundredBundleActive( controller ) then
					f18_local0 = IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE )
				else
					f18_local0 = false
				end
				return f18_local0
			end
		}
	} )
	BMHundredBundleOfferTime:linkToElementModel( BMHundredBundleOfferTime, "supplyDropType", true, function ( model )
		menu:updateElementState( BMHundredBundleOfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMHundredBundleOfferTime )
	self.BMHundredBundleOfferTime = BMHundredBundleOfferTime
	
	local BMNoDupesBundleOfferTime = CoD.BM_BribeOffertime.new( menu, controller )
	BMNoDupesBundleOfferTime:setLeftRight( true, false, 0, 352 )
	BMNoDupesBundleOfferTime:setTopBottom( false, true, -20, 0 )
	BMNoDupesBundleOfferTime:setAlpha( 0 )
	BMNoDupesBundleOfferTime:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_rare_nodupe_20bundle", function ( model )
		local autoeventTimerRareNodupe_20bundle = Engine.GetModelValue( model )
		if autoeventTimerRareNodupe_20bundle then
			BMNoDupesBundleOfferTime.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerRareNodupe_20bundle ) )
		end
	end )
	BMNoDupesBundleOfferTime:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				local f21_local0
				if not IsNoDupesPromoActive( controller ) then
					f21_local0 = IsSelfModelValueEqualToEitherValue( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE, CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE )
				else
					f21_local0 = false
				end
				return f21_local0
			end
		}
	} )
	BMNoDupesBundleOfferTime:linkToElementModel( BMNoDupesBundleOfferTime, "supplyDropType", true, function ( model )
		menu:updateElementState( BMNoDupesBundleOfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMNoDupesBundleOfferTime )
	self.BMNoDupesBundleOfferTime = BMNoDupesBundleOfferTime
	
	local BMGrandSlamOfferTime = CoD.BM_BribeOffertime.new( menu, controller )
	BMGrandSlamOfferTime:setLeftRight( true, false, 0, 352 )
	BMGrandSlamOfferTime:setTopBottom( false, true, -20, 0 )
	BMGrandSlamOfferTime:setAlpha( 0 )
	BMGrandSlamOfferTime:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_grandslam", function ( model )
		local autoeventTimerGrandslam = Engine.GetModelValue( model )
		if autoeventTimerGrandslam then
			BMGrandSlamOfferTime.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerGrandslam ) )
		end
	end )
	BMGrandSlamOfferTime:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				local f24_local0
				if not IsTrifectaBundleActive( controller ) then
					f24_local0 = IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.TRIFECTA )
				else
					f24_local0 = false
				end
				return f24_local0
			end
		}
	} )
	BMGrandSlamOfferTime:linkToElementModel( BMGrandSlamOfferTime, "supplyDropType", true, function ( model )
		menu:updateElementState( BMGrandSlamOfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMGrandSlamOfferTime )
	self.BMGrandSlamOfferTime = BMGrandSlamOfferTime
	
	local BMRareBundle10for5OfferTime = CoD.BM_BribeOffertime.new( menu, controller )
	BMRareBundle10for5OfferTime:setLeftRight( true, false, 0, 352 )
	BMRareBundle10for5OfferTime:setTopBottom( false, true, -20, 0 )
	BMRareBundle10for5OfferTime:setAlpha( 0 )
	BMRareBundle10for5OfferTime:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_rare_bundle_10for5", function ( model )
		local autoeventTimerRareBundle_10for5 = Engine.GetModelValue( model )
		if autoeventTimerRareBundle_10for5 then
			BMRareBundle10for5OfferTime.BribeOfferTime:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerRareBundle_10for5 ) )
		end
	end )
	BMRareBundle10for5OfferTime:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE ) and not IsRareBundle10for5Active( controller )
			end
		}
	} )
	BMRareBundle10for5OfferTime:linkToElementModel( BMRareBundle10for5OfferTime, "supplyDropType", true, function ( model )
		menu:updateElementState( BMRareBundle10for5OfferTime, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	self:addElement( BMRareBundle10for5OfferTime )
	self.BMRareBundle10for5OfferTime = BMRareBundle10for5OfferTime
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		Bundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 1 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		HundredBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 1 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		Bribe = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setLeftRight( false, false, -176, 176 )
				self.Label00:setTopBottom( true, false, -14, 16 )
				self.Label00:setAlpha( 1 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 1 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		RareDiscount = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setLeftRight( false, false, -176, 176 )
				self.Label00:setTopBottom( true, false, -14, 16 )
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 1 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		Trifecta = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setLeftRight( false, false, -176, 176 )
				self.Label00:setTopBottom( true, false, -14, 16 )
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 1 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		NoDupesBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setLeftRight( false, false, -176, 176 )
				self.Label00:setTopBottom( true, false, -14, 16 )
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 1 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		GrandSlam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setLeftRight( false, false, -176, 176 )
				self.Label00:setTopBottom( true, false, -14, 16 )
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 1 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
			end
		},
		RareBundle10for5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				BMBribeOfferTime:completeAnimation()
				self.BMBribeOfferTime:setAlpha( 0 )
				self.clipFinished( BMBribeOfferTime, {} )
				Label00:completeAnimation()
				self.Label00:setAlpha( 0 )
				self.clipFinished( Label00, {} )
				BMBribeOffertime0:completeAnimation()
				self.BMBribeOffertime0:setAlpha( 0 )
				self.clipFinished( BMBribeOffertime0, {} )
				BMTrifectaOffertime:completeAnimation()
				self.BMTrifectaOffertime:setAlpha( 0 )
				self.clipFinished( BMTrifectaOffertime, {} )
				BMRareDiscountOfferTime:completeAnimation()
				self.BMRareDiscountOfferTime:setAlpha( 0 )
				self.clipFinished( BMRareDiscountOfferTime, {} )
				BMHundredBundleOfferTime:completeAnimation()
				self.BMHundredBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMHundredBundleOfferTime, {} )
				BMNoDupesBundleOfferTime:completeAnimation()
				self.BMNoDupesBundleOfferTime:setAlpha( 0 )
				self.clipFinished( BMNoDupesBundleOfferTime, {} )
				BMGrandSlamOfferTime:completeAnimation()
				self.BMGrandSlamOfferTime:setAlpha( 0 )
				self.clipFinished( BMGrandSlamOfferTime, {} )
				BMRareBundle10for5OfferTime:completeAnimation()
				self.BMRareBundle10for5OfferTime:setAlpha( 1 )
				self.clipFinished( BMRareBundle10for5OfferTime, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Bundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.BUNDLE ) and IsBundleActive( controller )
			end
		},
		{
			stateName = "HundredBundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE ) and IsHundredBundleActive( controller )
			end
		},
		{
			stateName = "Bribe",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.BRIBE )
			end
		},
		{
			stateName = "RareDiscount",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.RARE ) and IsLootSaleActive( controller )
			end
		},
		{
			stateName = "Trifecta",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.TRIFECTA )
			end
		},
		{
			stateName = "NoDupesBundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEitherValue( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE, CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE )
			end
		},
		{
			stateName = "GrandSlam",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.GRAND_SLAM )
			end
		},
		{
			stateName = "RareBundle10for5",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "supplyDropType", CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 ) and IsRareBundle10for5Active( controller )
			end
		}
	} )
	self:linkToElementModel( self, "supplyDropType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supplyDropType"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMBribeOfferTime:close()
		element.BMBribeOffertime0:close()
		element.BMTrifectaOffertime:close()
		element.BMRareDiscountOfferTime:close()
		element.BMHundredBundleOfferTime:close()
		element.BMNoDupesBundleOfferTime:close()
		element.BMGrandSlamOfferTime:close()
		element.BMRareBundle10for5OfferTime:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

