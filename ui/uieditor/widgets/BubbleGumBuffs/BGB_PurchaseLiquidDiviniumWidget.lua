-- ae22b3820110422846aa333936ace029
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryCODPointContainerSmall" )
require( "ui.uieditor.widgets.ZMPromotional.Zm_BGB_LiquidDivGlow" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactory_SaleActive" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketCryptokeyContainerSmall" )
require( "ui.uieditor.widgets.ZM_ExpiresIn" )
require( "ui.uieditor.widgets.ZMPromotional.ZM_Promo_Ribbon" )

CoD.BGB_PurchaseLiquidDiviniumWidget = InheritFrom( LUI.UIElement )
CoD.BGB_PurchaseLiquidDiviniumWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BGB_PurchaseLiquidDiviniumWidget )
	self.id = "BGB_PurchaseLiquidDiviniumWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 190 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 160 )
	background:setTopBottom( true, false, 0, 190 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.4 )
	self:addElement( background )
	self.background = background
	
	local BlackBox0 = LUI.UIImage.new()
	BlackBox0:setLeftRight( true, false, 6.14, 153.86 )
	BlackBox0:setTopBottom( true, false, 13.7, 33.28 )
	BlackBox0:setRGB( 0, 0, 0 )
	BlackBox0:setAlpha( 0.5 )
	self:addElement( BlackBox0 )
	self.BlackBox0 = BlackBox0
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, false, 6.14, 153.86 )
	BlackBox:setTopBottom( true, false, 147.42, 181 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.5 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 6.14, 153.86 )
	Icon:setTopBottom( true, false, 28.28, 176 )
	Icon:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Icon:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local FEFocusBarContainerBottom = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerBottom:setLeftRight( true, false, -2, 162 )
	FEFocusBarContainerBottom:setTopBottom( true, false, 186, 194 )
	FEFocusBarContainerBottom:setAlpha( 0 )
	self:addElement( FEFocusBarContainerBottom )
	self.FEFocusBarContainerBottom = FEFocusBarContainerBottom
	
	local FEFocusBarContainerTop = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerTop:setLeftRight( true, false, -2, 162 )
	FEFocusBarContainerTop:setTopBottom( true, false, -4, 4 )
	FEFocusBarContainerTop:setAlpha( 0 )
	self:addElement( FEFocusBarContainerTop )
	self.FEFocusBarContainerTop = FEFocusBarContainerTop
	
	local MegaChewFactoryCODPointContainerSmall0 = CoD.MegaChewFactoryCODPointContainerSmall.new( menu, controller )
	MegaChewFactoryCODPointContainerSmall0:setLeftRight( true, false, 11.5, 90.5 )
	MegaChewFactoryCODPointContainerSmall0:setTopBottom( true, false, 9.28, 37.28 )
	MegaChewFactoryCODPointContainerSmall0:linkToElementModel( self, nil, false, function ( model )
		MegaChewFactoryCODPointContainerSmall0:setModel( model, controller )
	end )
	MegaChewFactoryCODPointContainerSmall0:mergeStateConditions( {
		{
			stateName = "HiddenForLootSale",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumSaleActive( controller )
			end
		}
	} )
	MegaChewFactoryCODPointContainerSmall0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( MegaChewFactoryCODPointContainerSmall0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	MegaChewFactoryCODPointContainerSmall0:linkToElementModel( MegaChewFactoryCODPointContainerSmall0, "itemCODPointCost", true, function ( model )
		menu:updateElementState( MegaChewFactoryCODPointContainerSmall0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		} )
	end )
	MegaChewFactoryCODPointContainerSmall0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		menu:updateElementState( MegaChewFactoryCODPointContainerSmall0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		} )
	end )
	self:addElement( MegaChewFactoryCODPointContainerSmall0 )
	self.MegaChewFactoryCODPointContainerSmall0 = MegaChewFactoryCODPointContainerSmall0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 8.5, 208.5 )
	Label0:setTopBottom( true, false, 143.72, 188.72 )
	Label0:setRGB( 1, 0.77, 0 )
	Label0:setAlpha( 0.85 )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:linkToElementModel( self, "vials", true, function ( model )
		local vials = Engine.GetModelValue( model )
		if vials then
			Label0:setText( LocalizeIntoString( "MENU_MULTIPLIER_X", vials ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local ZmBGBLiquidDivGlow = CoD.Zm_BGB_LiquidDivGlow.new( menu, controller )
	ZmBGBLiquidDivGlow:setLeftRight( true, false, 23.71, 136.29 )
	ZmBGBLiquidDivGlow:setTopBottom( true, false, 69.96, 170 )
	ZmBGBLiquidDivGlow:setAlpha( 0.5 )
	self:addElement( ZmBGBLiquidDivGlow )
	self.ZmBGBLiquidDivGlow = ZmBGBLiquidDivGlow
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2.77 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, -2, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local MegaChewFactorySaleActive0 = CoD.MegaChewFactory_SaleActive.new( menu, controller )
	MegaChewFactorySaleActive0:setLeftRight( true, false, 26.18, 84.18 )
	MegaChewFactorySaleActive0:setTopBottom( true, false, 10.28, 60.28 )
	MegaChewFactorySaleActive0:linkToElementModel( self, nil, false, function ( model )
		MegaChewFactorySaleActive0:setModel( model, controller )
	end )
	self:addElement( MegaChewFactorySaleActive0 )
	self.MegaChewFactorySaleActive0 = MegaChewFactorySaleActive0
	
	local BlackMarketCryptokeyContainerSmall = CoD.BlackMarketCryptokeyContainerSmall.new( menu, controller )
	BlackMarketCryptokeyContainerSmall:setLeftRight( true, false, 105.5, 174.5 )
	BlackMarketCryptokeyContainerSmall:setTopBottom( true, false, 9.78, 36.78 )
	BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
	BlackMarketCryptokeyContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCryptokeyContainerSmall:setModel( model, controller )
	end )
	self:addElement( BlackMarketCryptokeyContainerSmall )
	self.BlackMarketCryptokeyContainerSmall = BlackMarketCryptokeyContainerSmall
	
	local ZMExpiresIn = CoD.ZM_ExpiresIn.new( menu, controller )
	ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
	ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
	ZMExpiresIn:setAlpha( 0 )
	ZMExpiresIn:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_vialsfromkeys", function ( model )
		local autoeventTimerVialsfromkeys = Engine.GetModelValue( model )
		if autoeventTimerVialsfromkeys then
			ZMExpiresIn.Text:setText( Engine.Localize( autoeventTimerVialsfromkeys ) )
		end
	end )
	self:addElement( ZMExpiresIn )
	self.ZMExpiresIn = ZMExpiresIn
	
	local ZMPromoRibbon = CoD.ZM_Promo_Ribbon.new( menu, controller )
	ZMPromoRibbon:setLeftRight( false, true, -160, 11 )
	ZMPromoRibbon:setTopBottom( true, false, 115.98, 150.98 )
	ZMPromoRibbon:linkToElementModel( self, nil, false, function ( model )
		ZMPromoRibbon:setModel( model, controller )
	end )
	ZMPromoRibbon:linkToElementModel( self, "ribbonText", true, function ( model )
		local ribbonText = Engine.GetModelValue( model )
		if ribbonText then
			ZMPromoRibbon.Text:setText( Engine.Localize( ribbonText ) )
		end
	end )
	ZMPromoRibbon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "showRibbon" )
			end
		}
	} )
	ZMPromoRibbon:linkToElementModel( ZMPromoRibbon, "showRibbon", true, function ( model )
		menu:updateElementState( ZMPromoRibbon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showRibbon"
		} )
	end )
	self:addElement( ZMPromoRibbon )
	self.ZMPromoRibbon = ZMPromoRibbon
	
	self.MegaChewFactorySaleActive0:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			MegaChewFactorySaleActive0.Label0:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", GetLDCostBeforeLootDiscount( controller, itemCODPointCost ) ) ) )
		end
	end )
	self.MegaChewFactorySaleActive0:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			MegaChewFactorySaleActive0.codpointText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", itemCODPointCost ) ) )
		end
	end )
	ZmBGBLiquidDivGlow.navigation = {
		up = MegaChewFactorySaleActive0
	}
	MegaChewFactorySaleActive0.navigation = {
		down = ZmBGBLiquidDivGlow
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				background:completeAnimation()
				self.background:setAlpha( 0.25 )
				self.clipFinished( background, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				self.clipFinished( BlackBox, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setScale( 1 )
				self.clipFinished( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0.7 )
				self.clipFinished( MegaChewFactoryCODPointContainerSmall0, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 8.5, 208.5 )
				self.Label0:setTopBottom( true, false, 143.72, 188.72 )
				self.Label0:setAlpha( 0.5 )
				self.clipFinished( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 0 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				MegaChewFactorySaleActive0:completeAnimation()
				self.MegaChewFactorySaleActive0:setAlpha( 0 )
				self.clipFinished( MegaChewFactorySaleActive0, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				ZMExpiresIn:completeAnimation()
				self.ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
				self.ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
				self.ZMExpiresIn:setAlpha( 0 )
				self.clipFinished( ZMExpiresIn, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				background:completeAnimation()
				self.background:setAlpha( 0.4 )
				self.clipFinished( background, {} )
				local BlackBoxFrame2 = function ( BlackBox, event )
					if not event.interrupted then
						BlackBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BlackBox:setAlpha( 0.55 )
					if event.interrupted then
						self.clipFinished( BlackBox, event )
					else
						BlackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				BlackBoxFrame2( BlackBox, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 1 )
					Icon:setScale( 1.05 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setAlpha( 1 )
				self.Icon:setScale( 1 )
				IconFrame2( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				local MegaChewFactoryCODPointContainerSmall0Frame2 = function ( MegaChewFactoryCODPointContainerSmall0, event )
					if not event.interrupted then
						MegaChewFactoryCODPointContainerSmall0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MegaChewFactoryCODPointContainerSmall0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MegaChewFactoryCODPointContainerSmall0, event )
					else
						MegaChewFactoryCODPointContainerSmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0.7 )
				MegaChewFactoryCODPointContainerSmall0Frame2( MegaChewFactoryCODPointContainerSmall0, {} )
				local Label0Frame2 = function ( Label0, event )
					if not event.interrupted then
						Label0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Label0:setLeftRight( true, false, 8.5, 208.5 )
					Label0:setTopBottom( true, false, 143.72, 188.72 )
					Label0:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( Label0, event )
					else
						Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 8.5, 208.5 )
				self.Label0:setTopBottom( true, false, 143.72, 188.72 )
				self.Label0:setAlpha( 0.5 )
				Label0Frame2( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 1 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				ZMExpiresIn:completeAnimation()
				self.ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
				self.ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
				self.ZMExpiresIn:setAlpha( 0 )
				self.clipFinished( ZMExpiresIn, {} )
			end
		},
		NoVials = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				background:completeAnimation()
				self.background:setAlpha( 0.25 )
				self.clipFinished( background, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				self.clipFinished( BlackBox, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setScale( 1 )
				self.clipFinished( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0.7 )
				self.clipFinished( MegaChewFactoryCODPointContainerSmall0, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 8.5, 208.5 )
				self.Label0:setTopBottom( true, false, 143.72, 188.72 )
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 0 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				MegaChewFactorySaleActive0:completeAnimation()
				self.MegaChewFactorySaleActive0:setAlpha( 0 )
				self.clipFinished( MegaChewFactorySaleActive0, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				ZMExpiresIn:completeAnimation()
				self.ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
				self.ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
				self.ZMExpiresIn:setAlpha( 0 )
				self.clipFinished( ZMExpiresIn, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				background:completeAnimation()
				self.background:setAlpha( 0.4 )
				self.clipFinished( background, {} )
				local BlackBoxFrame2 = function ( BlackBox, event )
					if not event.interrupted then
						BlackBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BlackBox:setAlpha( 0.55 )
					if event.interrupted then
						self.clipFinished( BlackBox, event )
					else
						BlackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				BlackBoxFrame2( BlackBox, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 1 )
					Icon:setScale( 1.05 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setAlpha( 1 )
				self.Icon:setScale( 1 )
				IconFrame2( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				local MegaChewFactoryCODPointContainerSmall0Frame2 = function ( MegaChewFactoryCODPointContainerSmall0, event )
					if not event.interrupted then
						MegaChewFactoryCODPointContainerSmall0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MegaChewFactoryCODPointContainerSmall0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MegaChewFactoryCODPointContainerSmall0, event )
					else
						MegaChewFactoryCODPointContainerSmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0.7 )
				MegaChewFactoryCODPointContainerSmall0Frame2( MegaChewFactoryCODPointContainerSmall0, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 1 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				ZMExpiresIn:completeAnimation()
				self.ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
				self.ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
				self.ZMExpiresIn:setAlpha( 0 )
				self.clipFinished( ZMExpiresIn, {} )
			end
		},
		SaleActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				background:completeAnimation()
				self.background:setAlpha( 0.25 )
				self.clipFinished( background, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				self.clipFinished( BlackBox, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setScale( 1 )
				self.clipFinished( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setLeftRight( true, false, 11.5, 90.5 )
				self.MegaChewFactoryCODPointContainerSmall0:setTopBottom( true, false, 9.28, 37.28 )
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0.7 )
				self.clipFinished( MegaChewFactoryCODPointContainerSmall0, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0.5 )
				self.clipFinished( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 0 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				MegaChewFactorySaleActive0:completeAnimation()
				self.MegaChewFactorySaleActive0:setAlpha( 0.7 )
				self.clipFinished( MegaChewFactorySaleActive0, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				ZMExpiresIn:completeAnimation()
				self.ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
				self.ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
				self.ZMExpiresIn:setAlpha( 0 )
				self.clipFinished( ZMExpiresIn, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )
				background:completeAnimation()
				self.background:setAlpha( 0.4 )
				self.clipFinished( background, {} )
				local BlackBoxFrame2 = function ( BlackBox, event )
					if not event.interrupted then
						BlackBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BlackBox:setAlpha( 0.55 )
					if event.interrupted then
						self.clipFinished( BlackBox, event )
					else
						BlackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				BlackBoxFrame2( BlackBox, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 1 )
					Icon:setScale( 1.05 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setAlpha( 1 )
				self.Icon:setScale( 1 )
				IconFrame2( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				local MegaChewFactoryCODPointContainerSmall0Frame2 = function ( MegaChewFactoryCODPointContainerSmall0, event )
					if not event.interrupted then
						MegaChewFactoryCODPointContainerSmall0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MegaChewFactoryCODPointContainerSmall0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MegaChewFactoryCODPointContainerSmall0, event )
					else
						MegaChewFactoryCODPointContainerSmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0.7 )
				MegaChewFactoryCODPointContainerSmall0Frame2( MegaChewFactoryCODPointContainerSmall0, {} )
				local Label0Frame2 = function ( Label0, event )
					if not event.interrupted then
						Label0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Label0:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( Label0, event )
					else
						Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setAlpha( 0.5 )
				Label0Frame2( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 1 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				local MegaChewFactorySaleActive0Frame2 = function ( MegaChewFactorySaleActive0, event )
					if not event.interrupted then
						MegaChewFactorySaleActive0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MegaChewFactorySaleActive0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MegaChewFactorySaleActive0, event )
					else
						MegaChewFactorySaleActive0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MegaChewFactorySaleActive0:completeAnimation()
				self.MegaChewFactorySaleActive0:setAlpha( 0.7 )
				MegaChewFactorySaleActive0Frame2( MegaChewFactorySaleActive0, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				local ZMExpiresInFrame2 = function ( ZMExpiresIn, event )
					if not event.interrupted then
						ZMExpiresIn:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
					ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
					ZMExpiresIn:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZMExpiresIn, event )
					else
						ZMExpiresIn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMExpiresIn:completeAnimation()
				self.ZMExpiresIn:setLeftRight( true, false, 6.14, 171 )
				self.ZMExpiresIn:setTopBottom( true, false, 146.69, 198.69 )
				self.ZMExpiresIn:setAlpha( 0 )
				ZMExpiresInFrame2( ZMExpiresIn, {} )
			end
		},
		DiviniumOffer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				background:completeAnimation()
				self.background:setAlpha( 0.25 )
				self.clipFinished( background, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				self.clipFinished( BlackBox, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setScale( 1 )
				self.clipFinished( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0 )
				self.clipFinished( MegaChewFactoryCODPointContainerSmall0, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 8.5, 208.5 )
				self.Label0:setTopBottom( true, false, 124.72, 169.72 )
				self.Label0:setAlpha( 0.5 )
				self.clipFinished( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 0 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				MegaChewFactorySaleActive0:completeAnimation()
				self.MegaChewFactorySaleActive0:setAlpha( 0 )
				self.clipFinished( MegaChewFactorySaleActive0, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				ZMExpiresIn:completeAnimation()
				ZMExpiresIn.Text:completeAnimation()
				self.ZMExpiresIn:setAlpha( 1 )
				self.clipFinished( ZMExpiresIn, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )
				background:completeAnimation()
				self.background:setAlpha( 0.4 )
				self.clipFinished( background, {} )
				local BlackBoxFrame2 = function ( BlackBox, event )
					if not event.interrupted then
						BlackBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BlackBox:setAlpha( 0.55 )
					if event.interrupted then
						self.clipFinished( BlackBox, event )
					else
						BlackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.1 )
				BlackBoxFrame2( BlackBox, {} )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Icon:setRGB( 1, 1, 1 )
					Icon:setAlpha( 1 )
					Icon:setScale( 1.05 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setRGB( 0.71, 0.71, 0.71 )
				self.Icon:setAlpha( 1 )
				self.Icon:setScale( 1 )
				IconFrame2( Icon, {} )
				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerTop, {} )
				local MegaChewFactoryCODPointContainerSmall0Frame2 = function ( MegaChewFactoryCODPointContainerSmall0, event )
					if not event.interrupted then
						MegaChewFactoryCODPointContainerSmall0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MegaChewFactoryCODPointContainerSmall0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MegaChewFactoryCODPointContainerSmall0, event )
					else
						MegaChewFactoryCODPointContainerSmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 0 )
				MegaChewFactoryCODPointContainerSmall0Frame2( MegaChewFactoryCODPointContainerSmall0, {} )
				local Label0Frame2 = function ( Label0, event )
					if not event.interrupted then
						Label0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Label0:setLeftRight( true, false, 8.5, 208.5 )
					Label0:setTopBottom( true, false, 124.72, 169.72 )
					Label0:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( Label0, event )
					else
						Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 8.5, 208.5 )
				self.Label0:setTopBottom( true, false, 124.72, 169.72 )
				self.Label0:setAlpha( 0.5 )
				Label0Frame2( Label0, {} )
				ZmBGBLiquidDivGlow:completeAnimation()
				self.ZmBGBLiquidDivGlow:setAlpha( 1 )
				self.clipFinished( ZmBGBLiquidDivGlow, {} )
				MegaChewFactorySaleActive0:completeAnimation()
				self.MegaChewFactorySaleActive0:setAlpha( 0 )
				self.clipFinished( MegaChewFactorySaleActive0, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				ZMExpiresIn:completeAnimation()
				self.ZMExpiresIn:setAlpha( 1 )
				self.clipFinished( ZMExpiresIn, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoVials",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "vials", 0 )
			end
		},
		{
			stateName = "SaleActive",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumSaleActive( controller )
			end
		},
		{
			stateName = "DiviniumOffer",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCost", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "vials", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vials"
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
	self:linkToElementModel( self, "itemCost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCost"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ZmBGBLiquidDivGlow.id = "ZmBGBLiquidDivGlow"
	MegaChewFactorySaleActive0.id = "MegaChewFactorySaleActive0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ZmBGBLiquidDivGlow:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEFocusBarContainerBottom:close()
		element.FEFocusBarContainerTop:close()
		element.MegaChewFactoryCODPointContainerSmall0:close()
		element.ZmBGBLiquidDivGlow:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.MegaChewFactorySaleActive0:close()
		element.BlackMarketCryptokeyContainerSmall:close()
		element.ZMExpiresIn:close()
		element.ZMPromoRibbon:close()
		element.Icon:close()
		element.Label0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

