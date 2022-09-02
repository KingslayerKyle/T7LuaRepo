-- 73fd5f928a3bcc66f8b9be9752383ef3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )
require( "ui.uieditor.widgets.BlackMarket.NextKeyProgress" )
require( "ui.uieditor.widgets.BlackMarket.BribeDuplicatesPopupInfo" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketCODPointContainerSmall" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketCryptokeyContainerSmall" )
require( "ui.uieditor.widgets.BlackMarket.BM_BurningDuplicatesAnimation" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BGB_PurchasingVials" )
require( "ui.uieditor.widgets.BlackMarket.BM_BundleOffertime" )
require( "ui.uieditor.widgets.BlackMarket.BM_Bundle_Count" )
require( "ui.uieditor.widgets.BlackMarket.BM_BurnProgressIndicator" )

CoD.SystemOverlay_BlackMarket = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_BlackMarket.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_BlackMarket )
	self.id = "SystemOverlay_BlackMarket"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 1280 )
	bg:setTopBottom( true, false, -5, 331 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_backgroundbg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local BIGicon = LUI.UIImage.new()
	BIGicon:setLeftRight( true, false, 1053.2, 1280 )
	BIGicon:setTopBottom( true, false, -4, 320 )
	BIGicon:setImage( RegisterImage( "uie_t7_blackmarket_popup_icon" ) )
	self:addElement( BIGicon )
	self.BIGicon = BIGicon
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 44, 308 )
	largeImage:setTopBottom( true, false, -9, 255 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( true, false, 384, 414 )
	categoryTypeImage:setTopBottom( true, false, 11, 41 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local categoryType = Engine.GetModelValue( model )
		if categoryType then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( categoryType ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local titleForBurning = LUI.UITightText.new()
	titleForBurning:setLeftRight( true, false, 421, 509 )
	titleForBurning:setTopBottom( true, false, 11, 41 )
	titleForBurning:setAlpha( 0 )
	titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNING_TITLE" ) )
	titleForBurning:setTTF( "fonts/escom.ttf" )
	self:addElement( titleForBurning )
	self.titleForBurning = titleForBurning
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 421, 621 )
	title:setTopBottom( true, false, 11, 41 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local _title = Engine.GetModelValue( model )
		if _title then
			title:setText( Engine.Localize( _title ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local textForBurning = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	textForBurning:setLeftRight( true, false, 422, 1217 )
	textForBurning:setTopBottom( true, false, 37, 57 )
	textForBurning:setAlpha( 0 )
	textForBurning.text:setText( Engine.Localize( "MPUI_BM_BURNING_DESCRIPTION" ) )
	self:addElement( textForBurning )
	self.textForBurning = textForBurning
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( true, false, 422, 1127 )
	text:setTopBottom( true, false, 45, 65 )
	text:setAlpha( 0.85 )
	text:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			text.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local options = LUI.UIList.new( menu, controller, 3, 0, nil, true, false, 0, 0, false, false )
	options:makeFocusable()
	options:setLeftRight( true, false, 422, 1170 )
	options:setTopBottom( true, false, 154, 291 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 4 )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f7_local0 = options
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsDisabled( f10_arg0, f10_arg2 ) then
			ProcessListAction( self, f10_arg0, f10_arg2 )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f11_arg0, f11_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( options )
	self.options = options
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( true, false, 0, 352 )
	supportInfo:setTopBottom( false, true, -24, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local CryptokeyTypeName = CoD.CryptokeyTypeName.new( menu, controller )
	CryptokeyTypeName:setLeftRight( true, false, 134, 230 )
	CryptokeyTypeName:setTopBottom( true, false, 244, 266 )
	CryptokeyTypeName:linkToElementModel( self, "cryptoKeyType", false, function ( model )
		CryptokeyTypeName:setModel( model, controller )
	end )
	self:addElement( CryptokeyTypeName )
	self.CryptokeyTypeName = CryptokeyTypeName
	
	local NextKeyProgress = CoD.NextKeyProgress.new( menu, controller )
	NextKeyProgress:setLeftRight( true, false, 410, 870 )
	NextKeyProgress:setTopBottom( true, false, 116, 142 )
	NextKeyProgress:setAlpha( 0 )
	NextKeyProgress:mergeStateConditions( {
		{
			stateName = "HidePixels",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	NextKeyProgress:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( NextKeyProgress, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local SupplyDropText = LUI.UIText.new()
	SupplyDropText:setLeftRight( true, false, 0, 352 )
	SupplyDropText:setTopBottom( true, false, 267, 289 )
	SupplyDropText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SupplyDropText:linkToElementModel( self, "supplyDropType", true, function ( model )
		local supplyDropType = Engine.GetModelValue( model )
		if supplyDropType then
			SupplyDropText:setText( GetSupplyDropOrBundleString( controller, supplyDropType ) )
		end
	end )
	self:addElement( SupplyDropText )
	self.SupplyDropText = SupplyDropText
	
	local BribeDuplicatesPopupInfo = CoD.BribeDuplicatesPopupInfo.new( menu, controller )
	BribeDuplicatesPopupInfo:setLeftRight( true, false, 48.5, 301.5 )
	BribeDuplicatesPopupInfo:setTopBottom( true, false, 30, 279 )
	BribeDuplicatesPopupInfo:linkToElementModel( self, nil, false, function ( model )
		BribeDuplicatesPopupInfo:setModel( model, controller )
	end )
	self:addElement( BribeDuplicatesPopupInfo )
	self.BribeDuplicatesPopupInfo = BribeDuplicatesPopupInfo
	
	local BlackMarketCODPointContainerSmall = CoD.BlackMarketCODPointContainerSmall.new( menu, controller )
	BlackMarketCODPointContainerSmall:setLeftRight( true, false, 970, 1063.85 )
	BlackMarketCODPointContainerSmall:setTopBottom( true, false, 12, 40 )
	BlackMarketCODPointContainerSmall:setScale( 1 )
	BlackMarketCODPointContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCODPointContainerSmall:setModel( model, controller )
	end )
	BlackMarketCODPointContainerSmall:mergeStateConditions( {
		{
			stateName = "ShownInsufficientFunds",
			condition = function ( menu, element, event )
				local f19_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f19_local0 = AlwaysFalse()
				else
					f19_local0 = false
				end
				return f19_local0
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "BalanceShownInsufficientFunds",
			condition = function ( menu, element, event )
				local f21_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f21_local0 = IsSelfModelValueGreaterThan( element, controller, "codpointcost", 0 )
					if f21_local0 then
						f21_local0 = not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "codpointcost" )
					end
				else
					f21_local0 = false
				end
				return f21_local0
			end
		},
		{
			stateName = "BalanceShown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "codpointcost", 0 )
			end
		}
	} )
	BlackMarketCODPointContainerSmall:linkToElementModel( BlackMarketCODPointContainerSmall, "itemCODPointCost", true, function ( model )
		menu:updateElementState( BlackMarketCODPointContainerSmall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		} )
	end )
	BlackMarketCODPointContainerSmall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		menu:updateElementState( BlackMarketCODPointContainerSmall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		} )
	end )
	BlackMarketCODPointContainerSmall:linkToElementModel( BlackMarketCODPointContainerSmall, "codpointcost", true, function ( model )
		menu:updateElementState( BlackMarketCODPointContainerSmall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "codpointcost"
		} )
	end )
	self:addElement( BlackMarketCODPointContainerSmall )
	self.BlackMarketCODPointContainerSmall = BlackMarketCODPointContainerSmall
	
	local BlackMarketCryptokeyContainerSmall = CoD.BlackMarketCryptokeyContainerSmall.new( menu, controller )
	BlackMarketCryptokeyContainerSmall:setLeftRight( true, false, 1069.85, 1150.6 )
	BlackMarketCryptokeyContainerSmall:setTopBottom( true, false, 12, 40 )
	BlackMarketCryptokeyContainerSmall:setScale( 1 )
	BlackMarketCryptokeyContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCryptokeyContainerSmall:setModel( model, controller )
	end )
	BlackMarketCryptokeyContainerSmall:mergeStateConditions( {
		{
			stateName = "InsufficientFunds",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShowBalanceInsufficientFunds",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "cost", 0 ) and not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "cost" )
			end
		},
		{
			stateName = "ShowBalance",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	BlackMarketCryptokeyContainerSmall:linkToElementModel( BlackMarketCryptokeyContainerSmall, "cost", true, function ( model )
		menu:updateElementState( BlackMarketCryptokeyContainerSmall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cost"
		} )
	end )
	BlackMarketCryptokeyContainerSmall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( BlackMarketCryptokeyContainerSmall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	BlackMarketCryptokeyContainerSmall:linkToElementModel( BlackMarketCryptokeyContainerSmall, "itemCount", true, function ( model )
		menu:updateElementState( BlackMarketCryptokeyContainerSmall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCount"
		} )
	end )
	self:addElement( BlackMarketCryptokeyContainerSmall )
	self.BlackMarketCryptokeyContainerSmall = BlackMarketCryptokeyContainerSmall
	
	local BurningDuplicatesAnimation = CoD.BM_BurningDuplicatesAnimation.new( menu, controller )
	BurningDuplicatesAnimation:setLeftRight( true, false, 227, 727 )
	BurningDuplicatesAnimation:setTopBottom( true, false, 142, 242 )
	BurningDuplicatesAnimation:setAlpha( 0 )
	BurningDuplicatesAnimation:setScale( 0.6 )
	self:addElement( BurningDuplicatesAnimation )
	self.BurningDuplicatesAnimation = BurningDuplicatesAnimation
	
	local ComfirmationCryptokeyLarge = LUI.UIImage.new()
	ComfirmationCryptokeyLarge:setLeftRight( true, false, 76.5, 308 )
	ComfirmationCryptokeyLarge:setTopBottom( true, false, 47, 278.5 )
	ComfirmationCryptokeyLarge:setAlpha( 0 )
	ComfirmationCryptokeyLarge:setImage( RegisterImage( "uie_t7_menu_blackmarket_cryptokey_stack" ) )
	self:addElement( ComfirmationCryptokeyLarge )
	self.ComfirmationCryptokeyLarge = ComfirmationCryptokeyLarge
	
	local PurchasingBundle = CoD.BGB_PurchasingVials.new( menu, controller )
	PurchasingBundle:setLeftRight( true, false, 448, 948 )
	PurchasingBundle:setTopBottom( true, false, 110.5, 210.5 )
	PurchasingBundle:setAlpha( 0 )
	PurchasingBundle.BurningDuplicatesText:setText( Engine.Localize( "ZMUI_TRADING_COD_POINTS_FOR_VIALS" ) )
	self:addElement( PurchasingBundle )
	self.PurchasingBundle = PurchasingBundle
	
	local PurchasedBundleText = LUI.UIText.new()
	PurchasedBundleText:setLeftRight( true, false, 421, 868 )
	PurchasedBundleText:setTopBottom( true, false, 89.5, 111.5 )
	PurchasedBundleText:setAlpha( 0 )
	PurchasedBundleText:setTTF( "fonts/default.ttf" )
	PurchasedBundleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PurchasedBundleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PurchasedBundleText:linkToElementModel( self, "supplyDropType", true, function ( model )
		local supplyDropType = Engine.GetModelValue( model )
		if supplyDropType then
			PurchasedBundleText:setText( GetPurchaseCompleteStringForSupplyDropType( controller, supplyDropType ) )
		end
	end )
	self:addElement( PurchasedBundleText )
	self.PurchasedBundleText = PurchasedBundleText
	
	local PurchasedSixPackText = LUI.UIText.new()
	PurchasedSixPackText:setLeftRight( true, false, 421, 868 )
	PurchasedSixPackText:setTopBottom( true, false, 89.5, 111.5 )
	PurchasedSixPackText:setAlpha( 0 )
	PurchasedSixPackText:setText( DvarLocalizedIntoString( "loot_sixPack_final_count", "MPUI_BM_SIX_PACK_SUCCESS" ) )
	PurchasedSixPackText:setTTF( "fonts/default.ttf" )
	PurchasedSixPackText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PurchasedSixPackText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PurchasedSixPackText )
	self.PurchasedSixPackText = PurchasedSixPackText
	
	local BundleOpen = LUI.UIImage.new()
	BundleOpen:setLeftRight( true, false, 28.5, 328.5 )
	BundleOpen:setTopBottom( true, false, -14, 290 )
	BundleOpen:setAlpha( 0 )
	BundleOpen:setImage( RegisterImage( "uie_t7_blackmarket_crate_bundle_open" ) )
	self:addElement( BundleOpen )
	self.BundleOpen = BundleOpen
	
	local SixPackBundleOpen = LUI.UIImage.new()
	SixPackBundleOpen:setLeftRight( true, false, 28.5, 328.5 )
	SixPackBundleOpen:setTopBottom( true, false, -14, 290 )
	SixPackBundleOpen:setAlpha( 0 )
	SixPackBundleOpen:setImage( RegisterImage( "uie_t7_blackmarket_6pack_commons_open" ) )
	self:addElement( SixPackBundleOpen )
	self.SixPackBundleOpen = SixPackBundleOpen
	
	local BMBundleOffertime = CoD.BM_BundleOffertime.new( menu, controller )
	BMBundleOffertime:setLeftRight( true, false, 0, 352 )
	BMBundleOffertime:setTopBottom( true, false, 210.5, 318 )
	BMBundleOffertime:linkToElementModel( self, nil, false, function ( model )
		BMBundleOffertime:setModel( model, controller )
	end )
	self:addElement( BMBundleOffertime )
	self.BMBundleOffertime = BMBundleOffertime
	
	local BMBundleCount = CoD.BM_Bundle_Count.new( menu, controller )
	BMBundleCount:setLeftRight( true, false, 76, 276 )
	BMBundleCount:setTopBottom( true, false, 87.5, 137.5 )
	self:addElement( BMBundleCount )
	self.BMBundleCount = BMBundleCount
	
	local BMBurnProgressIndicator0 = CoD.BM_BurnProgressIndicator.new( menu, controller )
	BMBurnProgressIndicator0:setLeftRight( true, false, 422, 898 )
	BMBurnProgressIndicator0:setTopBottom( true, false, 70, 95 )
	self:addElement( BMBurnProgressIndicator0 )
	self.BMBurnProgressIndicator0 = BMBurnProgressIndicator0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setAlpha( 0 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )
			end
		},
		BurnDuplicates = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )

				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 753 )
				self.options:setTopBottom( true, false, 204.5, 296 )
				self.clipFinished( options, {} )

				CryptokeyTypeName:completeAnimation()
				self.CryptokeyTypeName:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeName, {} )

				NextKeyProgress:completeAnimation()
				self.NextKeyProgress:setLeftRight( true, false, 421, 821 )
				self.NextKeyProgress:setTopBottom( true, false, 120.5, 170.5 )
				self.NextKeyProgress:setAlpha( 1 )
				self.clipFinished( NextKeyProgress, {} )

				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setAlpha( 1 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesAnimation, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setAlpha( 0 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBundleOffertime:completeAnimation()
				self.BMBundleOffertime:setAlpha( 0 )
				self.clipFinished( BMBundleOffertime, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 0 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		},
		PurchaseSupplyDrop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				largeImage:completeAnimation()
				self.largeImage:setLeftRight( true, false, 53.5, 301.5 )
				self.largeImage:setTopBottom( true, false, 10, 258 )
				self.clipFinished( largeImage, {} )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )

				text:completeAnimation()
				self.text:setAlpha( 0.85 )
				self.clipFinished( text, {} )

				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 690.5 )
				self.options:setTopBottom( true, false, 140, 207 )
				self.clipFinished( options, {} )

				supportInfo:completeAnimation()
				self.supportInfo:setAlpha( 0 )
				self.clipFinished( supportInfo, {} )

				SupplyDropText:completeAnimation()
				self.SupplyDropText:setAlpha( 1 )
				self.clipFinished( SupplyDropText, {} )

				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setLeftRight( true, false, 68, 289 )
				self.BribeDuplicatesPopupInfo:setTopBottom( true, false, 31, 280 )
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesAnimation, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setAlpha( 0 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBundleOffertime:completeAnimation()
				self.BMBundleOffertime:setAlpha( 1 )
				self.clipFinished( BMBundleOffertime, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 0 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		},
		BurningDuplicates = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 1 )
				self.titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNING_TITLE" ) )
				self.clipFinished( titleForBurning, {} )

				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )

				textForBurning:completeAnimation()

				textForBurning.text:completeAnimation()
				self.textForBurning:setAlpha( 1 )
				self.textForBurning.text:setText( Engine.Localize( "MPUI_BM_BURNING_DESCRIPTION" ) )
				self.clipFinished( textForBurning, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )

				NextKeyProgress:completeAnimation()
				self.NextKeyProgress:setAlpha( 0 )
				self.clipFinished( NextKeyProgress, {} )

				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 1 )
				self.clipFinished( BurningDuplicatesAnimation, {} )
				local ComfirmationCryptokeyLargeFrame2 = function ( ComfirmationCryptokeyLarge, event )
					if not event.interrupted then
						ComfirmationCryptokeyLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ComfirmationCryptokeyLarge:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ComfirmationCryptokeyLarge, event )
					else
						ComfirmationCryptokeyLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				ComfirmationCryptokeyLargeFrame2( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setAlpha( 0 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBundleOffertime:completeAnimation()
				self.BMBundleOffertime:setAlpha( 0 )
				self.clipFinished( BMBundleOffertime, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 1 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		},
		BurnedDuplicates = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 1 )
				self.titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNED_TITLE" ) )
				self.clipFinished( titleForBurning, {} )

				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 1 )
				self.clipFinished( textForBurning, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )

				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 752 )
				self.options:setTopBottom( true, false, 253, 355 )
				self.clipFinished( options, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 1 )
				self.clipFinished( BurningDuplicatesAnimation, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 1 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setAlpha( 0 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBundleOffertime:completeAnimation()
				self.BMBundleOffertime:setAlpha( 0 )
				self.clipFinished( BMBundleOffertime, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 1 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		},
		PurchasingBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				largeImage:completeAnimation()
				self.largeImage:setLeftRight( true, false, 53.5, 301.5 )
				self.largeImage:setTopBottom( true, false, 10, 258 )
				self.clipFinished( largeImage, {} )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )

				text:completeAnimation()
				self.text:setAlpha( 0.85 )
				self.clipFinished( text, {} )

				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 690.5 )
				self.options:setTopBottom( true, false, 140, 207 )
				self.clipFinished( options, {} )

				supportInfo:completeAnimation()
				self.supportInfo:setAlpha( 0 )
				self.clipFinished( supportInfo, {} )

				SupplyDropText:completeAnimation()
				self.SupplyDropText:setAlpha( 1 )
				self.clipFinished( SupplyDropText, {} )

				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setLeftRight( true, false, 68, 289 )
				self.BribeDuplicatesPopupInfo:setTopBottom( true, false, 31, 280 )
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesAnimation, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setLeftRight( true, false, 466.5, 966.5 )
				self.PurchasingBundle:setTopBottom( true, false, 112, 212 )
				self.PurchasingBundle:setAlpha( 1 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setAlpha( 0 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 0 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		},
		PurchasedBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )

				largeImage:completeAnimation()
				self.largeImage:setLeftRight( true, false, 74.5, 282.5 )
				self.largeImage:setTopBottom( true, false, 236.25, 258 )
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )

				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 690.5 )
				self.options:setTopBottom( true, false, 140, 207 )
				self.clipFinished( options, {} )

				supportInfo:completeAnimation()
				self.supportInfo:setAlpha( 0 )
				self.clipFinished( supportInfo, {} )

				SupplyDropText:completeAnimation()
				self.SupplyDropText:setAlpha( 1 )
				self.clipFinished( SupplyDropText, {} )

				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesAnimation, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setLeftRight( true, false, 422, 869 )
				self.PurchasedBundleText:setTopBottom( true, false, 45, 65 )
				self.PurchasedBundleText:setAlpha( 1 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				BundleOpen:completeAnimation()
				self.BundleOpen:setLeftRight( true, false, 38.34, 313.66 )
				self.BundleOpen:setTopBottom( true, false, -5, 274 )
				self.BundleOpen:setAlpha( 1 )
				self.clipFinished( BundleOpen, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBundleOffertime:completeAnimation()
				self.BMBundleOffertime:setAlpha( 1 )
				self.clipFinished( BMBundleOffertime, {} )

				BMBundleCount:completeAnimation()
				self.BMBundleCount:setLeftRight( true, false, 74, 274 )
				self.BMBundleCount:setTopBottom( true, false, 87.5, 137.5 )
				self.clipFinished( BMBundleCount, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 0 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		},
		PurchaseComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				largeImage:completeAnimation()
				self.largeImage:setLeftRight( true, false, 53.5, 301.5 )
				self.largeImage:setTopBottom( true, false, 10, 258 )
				self.clipFinished( largeImage, {} )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )

				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 690.5 )
				self.options:setTopBottom( true, false, 140, 207 )
				self.clipFinished( options, {} )

				supportInfo:completeAnimation()
				self.supportInfo:setAlpha( 0 )
				self.clipFinished( supportInfo, {} )

				SupplyDropText:completeAnimation()
				self.SupplyDropText:setAlpha( 1 )
				self.clipFinished( SupplyDropText, {} )

				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setLeftRight( true, false, 68, 289 )
				self.BribeDuplicatesPopupInfo:setTopBottom( true, false, 31, 280 )
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesAnimation, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setLeftRight( true, false, 422, 869 )
				self.PurchasedBundleText:setTopBottom( true, false, 45, 65 )
				self.PurchasedBundleText:setAlpha( 1 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setAlpha( 0 )
				self.clipFinished( PurchasedSixPackText, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setAlpha( 0 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBundleOffertime:completeAnimation()
				self.BMBundleOffertime:setAlpha( 0 )
				self.clipFinished( BMBundleOffertime, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 0 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		},
		PurchasedSixPack = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )

				largeImage:completeAnimation()
				self.largeImage:setLeftRight( true, false, 74.5, 282.5 )
				self.largeImage:setTopBottom( true, false, 236.25, 258 )
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )

				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )

				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )

				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 690.5 )
				self.options:setTopBottom( true, false, 140, 207 )
				self.clipFinished( options, {} )

				supportInfo:completeAnimation()
				self.supportInfo:setAlpha( 0 )
				self.clipFinished( supportInfo, {} )

				SupplyDropText:completeAnimation()
				self.SupplyDropText:setAlpha( 1 )
				self.clipFinished( SupplyDropText, {} )

				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )

				BlackMarketCODPointContainerSmall:completeAnimation()
				self.BlackMarketCODPointContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCODPointContainerSmall, {} )

				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )

				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesAnimation, {} )

				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 0 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )

				PurchasingBundle:completeAnimation()
				self.PurchasingBundle:setAlpha( 0 )
				self.clipFinished( PurchasingBundle, {} )

				PurchasedBundleText:completeAnimation()
				self.PurchasedBundleText:setLeftRight( true, false, 421, 868 )
				self.PurchasedBundleText:setTopBottom( true, false, 89.5, 111.5 )
				self.PurchasedBundleText:setAlpha( 0 )
				self.clipFinished( PurchasedBundleText, {} )

				PurchasedSixPackText:completeAnimation()
				self.PurchasedSixPackText:setLeftRight( true, false, 422, 869 )
				self.PurchasedSixPackText:setTopBottom( true, false, 45, 65 )
				self.PurchasedSixPackText:setAlpha( 1 )
				self.clipFinished( PurchasedSixPackText, {} )

				BundleOpen:completeAnimation()
				self.BundleOpen:setLeftRight( true, false, 38.34, 313.66 )
				self.BundleOpen:setTopBottom( true, false, -5, 274 )
				self.BundleOpen:setAlpha( 0 )
				self.clipFinished( BundleOpen, {} )

				SixPackBundleOpen:completeAnimation()
				self.SixPackBundleOpen:setLeftRight( true, false, 38.34, 313.66 )
				self.SixPackBundleOpen:setTopBottom( true, false, -5, 274 )
				self.SixPackBundleOpen:setAlpha( 1 )
				self.clipFinished( SixPackBundleOpen, {} )

				BMBundleOffertime:completeAnimation()
				self.BMBundleOffertime:setAlpha( 1 )
				self.clipFinished( BMBundleOffertime, {} )

				BMBundleCount:completeAnimation()
				self.BMBundleCount:setLeftRight( true, false, 74, 274 )
				self.BMBundleCount:setTopBottom( true, false, 87.5, 137.5 )
				self.clipFinished( BMBundleCount, {} )

				BMBurnProgressIndicator0:completeAnimation()
				self.BMBurnProgressIndicator0:setAlpha( 0 )
				self.clipFinished( BMBurnProgressIndicator0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BurnDuplicates",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "BurnDuplicates" )
			end
		},
		{
			stateName = "PurchaseSupplyDrop",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "PurchaseSupplyDrop" )
			end
		},
		{
			stateName = "BurningDuplicates",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "BurnedDuplicates",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "PurchasingBundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "PurchaseSupplyDrop" )
			end
		},
		{
			stateName = "PurchasedBundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "PurchaseSupplyDrop" )
			end
		},
		{
			stateName = "PurchaseComplete",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "PurchasedSixPack",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "PurchaseSupplyDrop" )
			end
		}
	} )
	self:linkToElementModel( self, "state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "state"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f54_local0 = self
		local f54_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f54_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "P", function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
		if not IsMenuModelValueEqualTo( f55_arg1, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( f55_arg2 ) and not IsElementPropertyValue( f55_arg0, "isBurningDuplicates", true ) and not IsSelfInState( self, "PurchasingBundle" ) and PurchaseExperimentCanShowStoreButton( f55_arg2, self ) then
			OpenCodPointsStore( self, f55_arg0, f55_arg2, "menuName", f55_arg1 )
			return true
		else
			
		end
	end, function ( f56_arg0, f56_arg1, f56_arg2 )
		if not IsMenuModelValueEqualTo( f56_arg1, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( f56_arg2 ) and not IsElementPropertyValue( f56_arg0, "isBurningDuplicates", true ) and not IsSelfInState( self, "PurchasingBundle" ) and PurchaseExperimentCanShowStoreButton( f56_arg2, self ) then
			CoD.Menu.SetButtonLabel( f56_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			return false
		end
	end, false )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "BurnedDuplicates" ) then
			PlayClipOnElement( self, {
				elementName = "BlackMarketCryptokeyContainerSmall",
				clipName = "Bonus"
			}, controller )
		end
	end )
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.textForBurning:close()
		element.text:close()
		element.options:close()
		element.supportInfo:close()
		element.CryptokeyTypeName:close()
		element.NextKeyProgress:close()
		element.BribeDuplicatesPopupInfo:close()
		element.BlackMarketCODPointContainerSmall:close()
		element.BlackMarketCryptokeyContainerSmall:close()
		element.BurningDuplicatesAnimation:close()
		element.PurchasingBundle:close()
		element.BMBundleOffertime:close()
		element.BMBundleCount:close()
		element.BMBurnProgressIndicator0:close()
		element.largeImage:close()
		element.categoryTypeImage:close()
		element.title:close()
		element.SupplyDropText:close()
		element.PurchasedBundleText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

