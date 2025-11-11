require( "ui.uieditor.widgets.BlackMarket.BlackMarketCODPointContainerSmall" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketCryptokeyContainerSmall" )
require( "ui.uieditor.widgets.BlackMarket.BM_BundleOffertime" )
require( "ui.uieditor.widgets.BlackMarket.BM_BurningDuplicatesAnimation" )
require( "ui.uieditor.widgets.BlackMarket.BribeDuplicatesPopupInfo" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )
require( "ui.uieditor.widgets.BlackMarket.NextKeyProgress" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )

if IsOrbis() or IsDurango() then
	require( "ui.uieditor.menus.Store.Store_CodPoints" )
end
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 1920 )
	bg:setTopBottom( 0, 0, -8, 496 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_backgroundbg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local BIGicon = LUI.UIImage.new()
	BIGicon:setLeftRight( 0, 0, 1580, 1920 )
	BIGicon:setTopBottom( 0, 0, -6, 480 )
	BIGicon:setImage( RegisterImage( "uie_t7_blackmarket_popup_icon" ) )
	self:addElement( BIGicon )
	self.BIGicon = BIGicon
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 66, 462 )
	largeImage:setTopBottom( 0, 0, -14, 382 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			largeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( 0, 0, 576, 621 )
	categoryTypeImage:setTopBottom( 0, 0, 17, 62 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( modelValue ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local titleForBurning = LUI.UITightText.new()
	titleForBurning:setLeftRight( 0, 0, 628, 767 )
	titleForBurning:setTopBottom( 0, 0, 17, 62 )
	titleForBurning:setAlpha( 0 )
	titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNING_TITLE" ) )
	titleForBurning:setTTF( "fonts/escom.ttf" )
	self:addElement( titleForBurning )
	self.titleForBurning = titleForBurning
	
	local title = LUI.UITightText.new()
	title:setLeftRight( 0, 0, 632, 932 )
	title:setTopBottom( 0, 0, 17, 62 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local textForBurning = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	textForBurning:setLeftRight( 0, 0, 633, 1825 )
	textForBurning:setTopBottom( 0, 0, 55, 85 )
	textForBurning:setAlpha( 0 )
	textForBurning.text:setText( Engine.Localize( "MPUI_BM_BURNING_DESCRIPTION" ) )
	self:addElement( textForBurning )
	self.textForBurning = textForBurning
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( 0, 0, 633, 1691 )
	text:setTopBottom( 0, 0, 67, 97 )
	text:setAlpha( 0.85 )
	text:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local options = LUI.UIList.new( menu, controller, 4, 0, nil, true, false, 0, 0, false, false )
	options:makeFocusable()
	options:setLeftRight( 0, 0, 633, 1755 )
	options:setTopBottom( 0, 0, 231.5, 383.5 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 3 )
	options:setSpacing( 4 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			options:setDataSource( modelValue )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local element = options
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( options )
	self.options = options
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( 0, 0, 0, 528 )
	supportInfo:setTopBottom( 1, 1, -36, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local CryptokeyTypeName = CoD.CryptokeyTypeName.new( menu, controller )
	CryptokeyTypeName:setLeftRight( 0, 0, 192, 336 )
	CryptokeyTypeName:setTopBottom( 0, 0, 365.5, 398.5 )
	CryptokeyTypeName:linkToElementModel( self, "cryptoKeyType", false, function ( model )
		CryptokeyTypeName:setModel( model, controller )
	end )
	self:addElement( CryptokeyTypeName )
	self.CryptokeyTypeName = CryptokeyTypeName
	
	local NextKeyProgress = CoD.NextKeyProgress.new( menu, controller )
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
	NextKeyProgress:setLeftRight( 0, 0, 615, 1305 )
	NextKeyProgress:setTopBottom( 0, 0, 174, 213 )
	NextKeyProgress:setAlpha( 0 )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local SupplyDropText = LUI.UIText.new()
	SupplyDropText:setLeftRight( 0, 0, 111, 411 )
	SupplyDropText:setTopBottom( 0, 0, 402, 444 )
	SupplyDropText:setAlpha( 0 )
	SupplyDropText:setText( Engine.Localize( "MPUI_BM_SUPPLY_DROP" ) )
	SupplyDropText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SupplyDropText )
	self.SupplyDropText = SupplyDropText
	
	local BribeDuplicatesPopupInfo = CoD.BribeDuplicatesPopupInfo.new( menu, controller )
	BribeDuplicatesPopupInfo:setLeftRight( 0, 0, 72, 452 )
	BribeDuplicatesPopupInfo:setTopBottom( 0, 0, 45, 419 )
	BribeDuplicatesPopupInfo:linkToElementModel( self, nil, false, function ( model )
		BribeDuplicatesPopupInfo:setModel( model, controller )
	end )
	self:addElement( BribeDuplicatesPopupInfo )
	self.BribeDuplicatesPopupInfo = BribeDuplicatesPopupInfo
	
	local BlackMarketCODPointContainerSmall = CoD.BlackMarketCODPointContainerSmall.new( menu, controller )
	BlackMarketCODPointContainerSmall:mergeStateConditions( {
		{
			stateName = "ShownInsufficientFunds",
			condition = function ( menu, element, event )
				local f17_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f17_local0 = AlwaysFalse()
				else
					f17_local0 = false
				end
				return f17_local0
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
				local f19_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f19_local0 = IsSelfModelValueGreaterThan( element, controller, "codpointcost", 0 )
					if f19_local0 then
						f19_local0 = not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "codpointcost" )
					end
				else
					f19_local0 = false
				end
				return f19_local0
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
	BlackMarketCODPointContainerSmall:setLeftRight( 0, 0, 1455, 1596 )
	BlackMarketCODPointContainerSmall:setTopBottom( 0, 0, 18, 60 )
	BlackMarketCODPointContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCODPointContainerSmall:setModel( model, controller )
	end )
	self:addElement( BlackMarketCODPointContainerSmall )
	self.BlackMarketCODPointContainerSmall = BlackMarketCODPointContainerSmall
	
	local BlackMarketCryptokeyContainerSmall = CoD.BlackMarketCryptokeyContainerSmall.new( menu, controller )
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
	BlackMarketCryptokeyContainerSmall:setLeftRight( 0, 0, 1605, 1726 )
	BlackMarketCryptokeyContainerSmall:setTopBottom( 0, 0, 18, 60 )
	BlackMarketCryptokeyContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCryptokeyContainerSmall:setModel( model, controller )
	end )
	self:addElement( BlackMarketCryptokeyContainerSmall )
	self.BlackMarketCryptokeyContainerSmall = BlackMarketCryptokeyContainerSmall
	
	local BurningDuplicatesAnimation = CoD.BM_BurningDuplicatesAnimation.new( menu, controller )
	BurningDuplicatesAnimation:setLeftRight( 0, 0, 341, 1091 )
	BurningDuplicatesAnimation:setTopBottom( 0, 0, 159, 309 )
	BurningDuplicatesAnimation:setAlpha( 0 )
	BurningDuplicatesAnimation:setScale( 0.6 )
	self:addElement( BurningDuplicatesAnimation )
	self.BurningDuplicatesAnimation = BurningDuplicatesAnimation
	
	local ComfirmationCryptokeyLarge = LUI.UIImage.new()
	ComfirmationCryptokeyLarge:setLeftRight( 0, 0, 115, 462 )
	ComfirmationCryptokeyLarge:setTopBottom( 0, 0, 71, 418 )
	ComfirmationCryptokeyLarge:setAlpha( 0 )
	ComfirmationCryptokeyLarge:setImage( RegisterImage( "uie_t7_menu_blackmarket_cryptokey_stack" ) )
	self:addElement( ComfirmationCryptokeyLarge )
	self.ComfirmationCryptokeyLarge = ComfirmationCryptokeyLarge
	
	local BMBundleOffertime = CoD.BM_BundleOffertime.new( menu, controller )
	BMBundleOffertime:setLeftRight( 0, 0, 0, 528 )
	BMBundleOffertime:setTopBottom( 0, 0, 448, 486 )
	self:addElement( BMBundleOffertime )
	self.BMBundleOffertime = BMBundleOffertime
	
	self.resetProperties = function ()
		NextKeyProgress:completeAnimation()
		options:completeAnimation()
		largeImage:completeAnimation()
		CryptokeyTypeName:completeAnimation()
		SupplyDropText:completeAnimation()
		BribeDuplicatesPopupInfo:completeAnimation()
		supportInfo:completeAnimation()
		text:completeAnimation()
		title:completeAnimation()
		textForBurning:completeAnimation()
		titleForBurning:completeAnimation()
		BurningDuplicatesAnimation:completeAnimation()
		BlackMarketCryptokeyContainerSmall:completeAnimation()
		BlackMarketCODPointContainerSmall:completeAnimation()
		ComfirmationCryptokeyLarge:completeAnimation()
		NextKeyProgress:setLeftRight( 0, 0, 615, 1305 )
		NextKeyProgress:setTopBottom( 0, 0, 174, 213 )
		NextKeyProgress:setAlpha( 0 )
		options:setLeftRight( 0, 0, 633, 1755 )
		options:setTopBottom( 0, 0, 231.5, 383.5 )
		largeImage:setLeftRight( 0, 0, 66, 462 )
		largeImage:setTopBottom( 0, 0, -14, 382 )
		largeImage:setAlpha( 1 )
		CryptokeyTypeName:setLeftRight( 0, 0, 192, 336 )
		CryptokeyTypeName:setTopBottom( 0, 0, 365.5, 398.5 )
		CryptokeyTypeName:setAlpha( 1 )
		SupplyDropText:setLeftRight( 0, 0, 111, 411 )
		SupplyDropText:setTopBottom( 0, 0, 402, 444 )
		SupplyDropText:setAlpha( 0 )
		BribeDuplicatesPopupInfo:setLeftRight( 0, 0, 72, 452 )
		BribeDuplicatesPopupInfo:setTopBottom( 0, 0, 45, 419 )
		BribeDuplicatesPopupInfo:setAlpha( 1 )
		supportInfo:setAlpha( 1 )
		text:setAlpha( 0.85 )
		title:setAlpha( 1 )
		textForBurning:setAlpha( 0 )
		titleForBurning:setAlpha( 0 )
		titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNING_TITLE" ) )
		BurningDuplicatesAnimation:setAlpha( 0 )
		BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
		BlackMarketCODPointContainerSmall:setAlpha( 1 )
		ComfirmationCryptokeyLarge:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		BurnDuplicates = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )
				options:completeAnimation()
				self.options:setLeftRight( 0, 0, 633, 1129 )
				self.options:setTopBottom( 0, 0, 307, 444 )
				self.clipFinished( options, {} )
				CryptokeyTypeName:completeAnimation()
				self.CryptokeyTypeName:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeName, {} )
				NextKeyProgress:completeAnimation()
				self.NextKeyProgress:setLeftRight( 0, 0, 632, 1232 )
				self.NextKeyProgress:setTopBottom( 0, 0, 181, 256 )
				self.NextKeyProgress:setAlpha( 1 )
				self.clipFinished( NextKeyProgress, {} )
			end
		},
		PurchaseSupplyDrop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				largeImage:completeAnimation()
				self.largeImage:setLeftRight( 0, 0, 82, 454 )
				self.largeImage:setTopBottom( 0, 0, 15, 387 )
				self.clipFinished( largeImage, {} )
				options:completeAnimation()
				self.options:setLeftRight( 0, 0, 632.5, 1035.5 )
				self.options:setTopBottom( 0, 0, 210.5, 310.5 )
				self.clipFinished( options, {} )
				supportInfo:completeAnimation()
				self.supportInfo:setAlpha( 0 )
				self.clipFinished( supportInfo, {} )
				CryptokeyTypeName:completeAnimation()
				self.CryptokeyTypeName:setLeftRight( 0, 0, 196, 376 )
				self.CryptokeyTypeName:setTopBottom( 0, 0, 365.5, 398.5 )
				self.clipFinished( CryptokeyTypeName, {} )
				SupplyDropText:completeAnimation()
				self.SupplyDropText:setLeftRight( 0, 0, 108, 408 )
				self.SupplyDropText:setTopBottom( 0, 0, 402, 444 )
				self.SupplyDropText:setAlpha( 1 )
				self.clipFinished( SupplyDropText, {} )
				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setLeftRight( 0, 0, 102, 434 )
				self.BribeDuplicatesPopupInfo:setTopBottom( 0, 0, 46, 420 )
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )
			end
		},
		BurningDuplicates = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 1 )
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
			end
		},
		BurnedDuplicates = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
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
				self.options:setLeftRight( 0, 0, 632.5, 1127.5 )
				self.options:setTopBottom( 0, 0, 379, 532 )
				self.clipFinished( options, {} )
				BurningDuplicatesAnimation:completeAnimation()
				self.BurningDuplicatesAnimation:setAlpha( 1 )
				self.clipFinished( BurningDuplicatesAnimation, {} )
				ComfirmationCryptokeyLarge:completeAnimation()
				self.ComfirmationCryptokeyLarge:setAlpha( 1 )
				self.clipFinished( ComfirmationCryptokeyLarge, {} )
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
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsMenuModelValueEqualTo( menu, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( controller ) and not IsPC() and not IsElementPropertyValue( element, "isBurningDuplicates", true ) then
			GoBackAndOpenOverlayOnParent( self, "Store_CodPoints", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsMenuModelValueEqualTo( menu, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( controller ) and not IsPC() and not IsElementPropertyValue( element, "isBurningDuplicates", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS", nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "BurnedDuplicates" ) then
			PlayClipOnElement( self, {
				elementName = "BlackMarketCryptokeyContainerSmall",
				clipName = "Bonus"
			}, controller )
		end
	end )
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.textForBurning:close()
		self.text:close()
		self.options:close()
		self.supportInfo:close()
		self.CryptokeyTypeName:close()
		self.NextKeyProgress:close()
		self.BribeDuplicatesPopupInfo:close()
		self.BlackMarketCODPointContainerSmall:close()
		self.BlackMarketCryptokeyContainerSmall:close()
		self.BurningDuplicatesAnimation:close()
		self.BMBundleOffertime:close()
		self.largeImage:close()
		self.categoryTypeImage:close()
		self.title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

