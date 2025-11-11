require( "ui.uieditor.widgets.BlackMarket.BlackMarketCODPointContainerSmall" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketCryptokeyContainerSmall" )
require( "ui.uieditor.widgets.BlackMarket.BM_BribeFrame" )
require( "ui.uieditor.widgets.BlackMarket.BM_FocusFrame" )
require( "ui.uieditor.widgets.BlackMarket.BM_SaleActive" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember2" )
require( "ui.uieditor.widgets.BlackMarket.fx_glow" )
require( "ui.uieditor.widgets.BlackMarket.ItemHintTextWithError" )
require( "ui.uieditor.widgets.BlackMarket.smokewidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

CoD.CryptokeyWidget = InheritFrom( LUI.UIElement )
CoD.CryptokeyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyWidget )
	self.id = "CryptokeyWidget"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 240 )
	self:setTopBottom( 0, 0, 0, 300 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel0:setLeftRight( 0, 1, 0, 0 )
	LeftPanel0:setTopBottom( 0, 1, 0, 0 )
	LeftPanel0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel0 )
	self.LeftPanel0 = LeftPanel0
	
	local BMBribeFrame = CoD.BM_BribeFrame.new( menu, controller )
	BMBribeFrame:setLeftRight( 0, 0, -15, 256 )
	BMBribeFrame:setTopBottom( 0, 0, -15, 319 )
	self:addElement( BMBribeFrame )
	self.BMBribeFrame = BMBribeFrame
	
	local glow00 = LUI.UIImage.new()
	glow00:setLeftRight( 0.5, 0.5, -102.5, 102.5 )
	glow00:setTopBottom( 0, 0, 63, 267 )
	glow00:setRGB( 0.22, 0.93, 0.93 )
	glow00:setAlpha( 0 )
	glow00:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow00 )
	self.glow00 = glow00
	
	local smokewidget = CoD.smokewidget.new( menu, controller )
	smokewidget:setLeftRight( 0, 0, -7, 247 )
	smokewidget:setTopBottom( 0, 0, -15, 253 )
	smokewidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( smokewidget )
	self.smokewidget = smokewidget
	
	local fxEmber2 = CoD.fx_Ember2.new( menu, controller )
	fxEmber2:setLeftRight( 0, 0, 12, 228 )
	fxEmber2:setTopBottom( 0, 0, 7, 277 )
	fxEmber2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber2 )
	self.fxEmber2 = fxEmber2
	
	local fxEmber = CoD.fx_Ember.new( menu, controller )
	fxEmber:setLeftRight( 0, 0, 7, 234 )
	fxEmber:setTopBottom( 0, 0, 26, 310 )
	fxEmber:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber )
	self.fxEmber = fxEmber
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0.5, 0.5, -102.5, 102.5 )
	image:setTopBottom( 0, 0, 62, 266 )
	image:setAlpha( 0 )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local RareOn = LUI.UIImage.new()
	RareOn:setLeftRight( 0.5, 0.5, -102, 103 )
	RareOn:setTopBottom( 0, 0, 62, 266 )
	RareOn:setAlpha( 0 )
	RareOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_rare_focus" ) )
	self:addElement( RareOn )
	self.RareOn = RareOn
	
	local BribeWires = LUI.UIImage.new()
	BribeWires:setLeftRight( 0.5, 0.5, -138, 136 )
	BribeWires:setTopBottom( 0, 0, -12, 322 )
	BribeWires:setAlpha( 0 )
	BribeWires:setImage( RegisterImage( "uie_t7_blackmarket_crate_bribe_frame_circuits" ) )
	self:addElement( BribeWires )
	self.BribeWires = BribeWires
	
	local BribeOn = LUI.UIImage.new()
	BribeOn:setLeftRight( 0.5, 0.5, -120, 122 )
	BribeOn:setTopBottom( 0, 0, 26, 268 )
	BribeOn:setAlpha( 0 )
	BribeOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_bribe_chip" ) )
	self:addElement( BribeOn )
	self.BribeOn = BribeOn
	
	local BundleOn = LUI.UIImage.new()
	BundleOn:setLeftRight( 0.5, 0.5, -113.5, 113.5 )
	BundleOn:setTopBottom( 0, 0, 58, 285 )
	BundleOn:setAlpha( 0 )
	BundleOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_bundle" ) )
	self:addElement( BundleOn )
	self.BundleOn = BundleOn
	
	local CommonOn = LUI.UIImage.new()
	CommonOn:setLeftRight( 0.5, 0.5, -103, 102 )
	CommonOn:setTopBottom( 0, 0, 62, 266 )
	CommonOn:setAlpha( 0 )
	CommonOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_common_focus" ) )
	self:addElement( CommonOn )
	self.CommonOn = CommonOn
	
	local fxglow = CoD.fx_glow.new( menu, controller )
	fxglow:setLeftRight( 0, 0, 17, 222 )
	fxglow:setTopBottom( 0, 0, 62, 266 )
	fxglow:setAlpha( 0 )
	self:addElement( fxglow )
	self.fxglow = fxglow
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0.5, 0.5, -131, 131 )
	Label0:setTopBottom( 0, 0, 259, 289 )
	Label0:setAlpha( 0.75 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local ItemHintTextWithError = CoD.ItemHintTextWithError.new( menu, controller )
	ItemHintTextWithError:mergeStateConditions( {
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	ItemHintTextWithError:linkToElementModel( ItemHintTextWithError, nil, true, function ( model )
		menu:updateElementState( ItemHintTextWithError, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	ItemHintTextWithError:setLeftRight( 0, 0, -130, 522 )
	ItemHintTextWithError:setTopBottom( 0, 0, 324, 388 )
	ItemHintTextWithError.errorText:setText( Engine.Localize( "" ) )
	ItemHintTextWithError:linkToElementModel( self, nil, false, function ( model )
		ItemHintTextWithError:setModel( model, controller )
	end )
	ItemHintTextWithError:linkToElementModel( self, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemHintTextWithError.textCenterAlign:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ItemHintTextWithError )
	self.ItemHintTextWithError = ItemHintTextWithError
	
	local glow0 = LUI.UIImage.new()
	glow0:setLeftRight( 0.5, 0.5, -102.5, 102.5 )
	glow0:setTopBottom( 0, 0, 63, 267 )
	glow0:setAlpha( 0 )
	glow0:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow0 )
	self.glow0 = glow0
	
	local glowBribe = LUI.UIImage.new()
	glowBribe:setLeftRight( 0.5, 0.5, -120, 122 )
	glowBribe:setTopBottom( 0, 0, 26, 268 )
	glowBribe:setAlpha( 0 )
	glowBribe:setImage( RegisterImage( "uie_t7_blackmarket_crate_bribe_chip_hover" ) )
	self:addElement( glowBribe )
	self.glowBribe = glowBribe
	
	local glowBundle = LUI.UIImage.new()
	glowBundle:setLeftRight( 0.5, 0.5, -113.5, 113.5 )
	glowBundle:setTopBottom( 0, 0, 58, 285 )
	glowBundle:setAlpha( 0 )
	glowBundle:setImage( RegisterImage( "uie_t7_blackmarket_crate_bundle_glow" ) )
	self:addElement( glowBundle )
	self.glowBundle = glowBundle
	
	local BlackMarketCODPointContainerSmall = CoD.BlackMarketCODPointContainerSmall.new( menu, controller )
	BlackMarketCODPointContainerSmall:setLeftRight( 0, 0, 9, 111 )
	BlackMarketCODPointContainerSmall:setTopBottom( 0, 0, 6, 46 )
	BlackMarketCODPointContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCODPointContainerSmall:setModel( model, controller )
	end )
	self:addElement( BlackMarketCODPointContainerSmall )
	self.BlackMarketCODPointContainerSmall = BlackMarketCODPointContainerSmall
	
	local BlackMarketCryptokeyContainerSmall = CoD.BlackMarketCryptokeyContainerSmall.new( menu, controller )
	BlackMarketCryptokeyContainerSmall:setLeftRight( 0, 0, 136, 240 )
	BlackMarketCryptokeyContainerSmall:setTopBottom( 0, 0, 6, 46 )
	BlackMarketCryptokeyContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCryptokeyContainerSmall:setModel( model, controller )
	end )
	self:addElement( BlackMarketCryptokeyContainerSmall )
	self.BlackMarketCryptokeyContainerSmall = BlackMarketCryptokeyContainerSmall
	
	local BMFocusFrame = CoD.BM_FocusFrame.new( menu, controller )
	BMFocusFrame:setLeftRight( 0, 0, -1.5, 241.5 )
	BMFocusFrame:setTopBottom( 0, 0, 0, 300 )
	BMFocusFrame:setAlpha( 0 )
	self:addElement( BMFocusFrame )
	self.BMFocusFrame = BMFocusFrame
	
	local BMSaleActive = CoD.BM_SaleActive.new( menu, controller )
	BMSaleActive:mergeStateConditions( {
		{
			stateName = "SaleOn",
			condition = function ( menu, element, event )
				return IsLootSaleActive( controller ) and IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 )
			end
		}
	} )
	BMSaleActive:linkToElementModel( BMSaleActive, "itemCODPointCost", true, function ( model )
		menu:updateElementState( BMSaleActive, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		} )
	end )
	BMSaleActive:setLeftRight( 0, 0, 32, 119 )
	BMSaleActive:setTopBottom( 0, 0, 7, 107 )
	BMSaleActive:linkToElementModel( self, nil, false, function ( model )
		BMSaleActive:setModel( model, controller )
	end )
	self:addElement( BMSaleActive )
	self.BMSaleActive = BMSaleActive
	
	local BundleCount = LUI.UIText.new()
	BundleCount:setLeftRight( 0, 0, -30, 270 )
	BundleCount:setTopBottom( 0, 0, 104, 179 )
	BundleCount:setAlpha( 0 )
	BundleCount:setText( Engine.Localize( "5" ) )
	BundleCount:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	BundleCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BundleCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BundleCount )
	self.BundleCount = BundleCount
	
	self.resetProperties = function ()
		image:completeAnimation()
		ItemHintTextWithError:completeAnimation()
		BMFocusFrame:completeAnimation()
		fxEmber:completeAnimation()
		fxEmber2:completeAnimation()
		smokewidget:completeAnimation()
		BMBribeFrame:completeAnimation()
		Label0:completeAnimation()
		CommonOn:completeAnimation()
		glow00:completeAnimation()
		glow0:completeAnimation()
		glowBribe:completeAnimation()
		RareOn:completeAnimation()
		BlackMarketCryptokeyContainerSmall:completeAnimation()
		BribeOn:completeAnimation()
		BribeWires:completeAnimation()
		BundleOn:completeAnimation()
		BundleCount:completeAnimation()
		glowBundle:completeAnimation()
		image:setLeftRight( 0.5, 0.5, -102.5, 102.5 )
		image:setTopBottom( 0, 0, 62, 266 )
		image:setAlpha( 0 )
		ItemHintTextWithError:setAlpha( 1 )
		BMFocusFrame:setAlpha( 0 )
		fxEmber:setRGB( 1, 1, 1 )
		fxEmber:setAlpha( 1 )
		fxEmber2:setRGB( 1, 1, 1 )
		fxEmber2:setAlpha( 1 )
		smokewidget:setRGB( 1, 1, 1 )
		smokewidget:setAlpha( 1 )
		BMBribeFrame:setAlpha( 1 )
		Label0:setAlpha( 0.75 )
		CommonOn:setAlpha( 0 )
		glow00:setRGB( 0.22, 0.93, 0.93 )
		glow00:setAlpha( 0 )
		glow0:setRGB( 1, 1, 1 )
		glow0:setAlpha( 0 )
		glowBribe:setAlpha( 0 )
		RareOn:setAlpha( 0 )
		BlackMarketCryptokeyContainerSmall:setAlpha( 1 )
		BribeOn:setAlpha( 0 )
		BribeWires:setAlpha( 0 )
		BundleOn:setAlpha( 0 )
		BundleCount:setAlpha( 0 )
		glowBundle:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				image:completeAnimation()
				self.image:setLeftRight( 0.5, 0.5, -103, 102 )
				self.image:setTopBottom( 0, 0, 65, 269 )
				self.clipFinished( image, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
			end
		},
		InsufficientFunds = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				local glow00Frame2 = function ( glow00, event )
					local glow00Frame3 = function ( glow00, event )
						if not event.interrupted then
							glow00:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						glow00:setRGB( 1, 1, 1 )
						glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow00, event )
						else
							glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow00Frame3( glow00, event )
						return 
					else
						glow00:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glow00:setAlpha( 1 )
						glow00:registerEventHandler( "transition_complete_keyframe", glow00Frame3 )
					end
				end
				
				glow00:completeAnimation()
				self.glow00:setRGB( 1, 1, 1 )
				self.glow00:setAlpha( 0 )
				glow00Frame2( glow00, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 1 )
				self.clipFinished( CommonOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				local glow0Frame2 = function ( glow0, event )
					local glow0Frame3 = function ( glow0, event )
						if not event.interrupted then
							glow0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( glow0, event )
						else
							glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow0Frame3( glow0, event )
						return 
					else
						glow0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glow0:setAlpha( 1 )
						glow0:registerEventHandler( "transition_complete_keyframe", glow0Frame3 )
					end
				end
				
				glow0:completeAnimation()
				self.glow0:setAlpha( 0 )
				glow0Frame2( glow0, {} )
				glowBribe:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				glowBribe:setAlpha( 0 )
				glowBribe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				self.nextClip = "Focus"
			end
		},
		InsufficientFundsRare = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				local glow00Frame2 = function ( glow00, event )
					local glow00Frame3 = function ( glow00, event )
						if not event.interrupted then
							glow00:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						glow00:setRGB( 1, 1, 1 )
						glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow00, event )
						else
							glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow00Frame3( glow00, event )
						return 
					else
						glow00:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glow00:setAlpha( 1 )
						glow00:registerEventHandler( "transition_complete_keyframe", glow00Frame3 )
					end
				end
				
				glow00:completeAnimation()
				self.glow00:setRGB( 1, 1, 1 )
				self.glow00:setAlpha( 0 )
				glow00Frame2( glow00, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 1 )
				self.clipFinished( RareOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				local glow0Frame2 = function ( glow0, event )
					local glow0Frame3 = function ( glow0, event )
						if not event.interrupted then
							glow0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						glow0:setRGB( 0.22, 0.93, 0.93 )
						glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( glow0, event )
						else
							glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow0Frame3( glow0, event )
						return 
					else
						glow0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glow0:setAlpha( 1 )
						glow0:registerEventHandler( "transition_complete_keyframe", glow0Frame3 )
					end
				end
				
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.glow0:setAlpha( 0 )
				glow0Frame2( glow0, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				self.nextClip = "Focus"
			end
		},
		Common = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				local glow00Frame2 = function ( glow00, event )
					local glow00Frame3 = function ( glow00, event )
						if not event.interrupted then
							glow00:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						glow00:setRGB( 1, 1, 1 )
						glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow00, event )
						else
							glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow00Frame3( glow00, event )
						return 
					else
						glow00:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glow00:setAlpha( 1 )
						glow00:registerEventHandler( "transition_complete_keyframe", glow00Frame3 )
					end
				end
				
				glow00:completeAnimation()
				self.glow00:setRGB( 1, 1, 1 )
				self.glow00:setAlpha( 0 )
				glow00Frame2( glow00, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 1 )
				self.clipFinished( CommonOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				local glow0Frame2 = function ( glow0, event )
					local glow0Frame3 = function ( glow0, event )
						if not event.interrupted then
							glow0:beginAnimation( "keyframe", 779, true, true, CoD.TweenType.Linear )
						end
						glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( glow0, event )
						else
							glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow0Frame3( glow0, event )
						return 
					else
						glow0:beginAnimation( "keyframe", 759, true, true, CoD.TweenType.Linear )
						glow0:setAlpha( 1 )
						glow0:registerEventHandler( "transition_complete_keyframe", glow0Frame3 )
					end
				end
				
				glow0:completeAnimation()
				self.glow0:setAlpha( 0 )
				glow0Frame2( glow0, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				self.nextClip = "Focus"
			end
		},
		Rare = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0 )
				self.clipFinished( BMBribeFrame, {} )
				local glow00Frame2 = function ( glow00, event )
					local glow00Frame3 = function ( glow00, event )
						if not event.interrupted then
							glow00:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
						end
						glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow00, event )
						else
							glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow00Frame3( glow00, event )
						return 
					else
						glow00:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						glow00:setAlpha( 1 )
						glow00:registerEventHandler( "transition_complete_keyframe", glow00Frame3 )
					end
				end
				
				glow00:completeAnimation()
				self.glow00:setAlpha( 0 )
				glow00Frame2( glow00, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 1 )
				self.clipFinished( RareOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				local glow0Frame2 = function ( glow0, event )
					local glow0Frame3 = function ( glow0, event )
						if not event.interrupted then
							glow0:beginAnimation( "keyframe", 809, true, true, CoD.TweenType.Linear )
						end
						glow0:setRGB( 0.22, 0.93, 0.93 )
						glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow0, event )
						else
							glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow0Frame3( glow0, event )
						return 
					else
						glow0:beginAnimation( "keyframe", 740, true, true, CoD.TweenType.Linear )
						glow0:setAlpha( 1 )
						glow0:registerEventHandler( "transition_complete_keyframe", glow0Frame3 )
					end
				end
				
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.glow0:setAlpha( 0 )
				glow0Frame2( glow0, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				self.nextClip = "Focus"
			end
		},
		InsufficientFundsBribe = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				BribeWires:completeAnimation()
				self.BribeWires:setAlpha( 0.5 )
				self.clipFinished( BribeWires, {} )
				BribeOn:completeAnimation()
				self.BribeOn:setAlpha( 0.7 )
				self.clipFinished( BribeOn, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				glow00:completeAnimation()
				self.glow00:setRGB( 1, 1, 1 )
				self.clipFinished( glow00, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				local BribeWiresFrame2 = function ( BribeWires, event )
					local BribeWiresFrame3 = function ( BribeWires, event )
						if not event.interrupted then
							BribeWires:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
						end
						BribeWires:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( BribeWires, event )
						else
							BribeWires:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BribeWiresFrame3( BribeWires, event )
						return 
					else
						BribeWires:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						BribeWires:setAlpha( 1 )
						BribeWires:registerEventHandler( "transition_complete_keyframe", BribeWiresFrame3 )
					end
				end
				
				BribeWires:completeAnimation()
				self.BribeWires:setAlpha( 0.5 )
				BribeWiresFrame2( BribeWires, {} )
				BribeOn:completeAnimation()
				self.BribeOn:setAlpha( 1 )
				self.clipFinished( BribeOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( glow0, {} )
				local glowBribeFrame2 = function ( glowBribe, event )
					local glowBribeFrame3 = function ( glowBribe, event )
						if not event.interrupted then
							glowBribe:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
						end
						glowBribe:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glowBribe, event )
						else
							glowBribe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowBribeFrame3( glowBribe, event )
						return 
					else
						glowBribe:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glowBribe:setAlpha( 1 )
						glowBribe:registerEventHandler( "transition_complete_keyframe", glowBribeFrame3 )
					end
				end
				
				glowBribe:completeAnimation()
				self.glowBribe:setAlpha( 0 )
				glowBribeFrame2( glowBribe, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				self.nextClip = "Focus"
			end
		},
		Bribe = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0.9 )
				self.clipFinished( BMBribeFrame, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				BribeWires:completeAnimation()
				self.BribeWires:setAlpha( 0.5 )
				self.clipFinished( BribeWires, {} )
				BribeOn:completeAnimation()
				self.BribeOn:setAlpha( 0.75 )
				self.clipFinished( BribeOn, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				smokewidget:completeAnimation()
				self.smokewidget:setRGB( 0.22, 0.93, 0.93 )
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setRGB( 0.22, 0.93, 0.93 )
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setRGB( 0.22, 0.93, 0.93 )
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				local BribeWiresFrame2 = function ( BribeWires, event )
					local BribeWiresFrame3 = function ( BribeWires, event )
						if not event.interrupted then
							BribeWires:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
						end
						BribeWires:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( BribeWires, event )
						else
							BribeWires:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BribeWiresFrame3( BribeWires, event )
						return 
					else
						BribeWires:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						BribeWires:setAlpha( 1 )
						BribeWires:registerEventHandler( "transition_complete_keyframe", BribeWiresFrame3 )
					end
				end
				
				BribeWires:completeAnimation()
				self.BribeWires:setAlpha( 0.5 )
				BribeWiresFrame2( BribeWires, {} )
				BribeOn:completeAnimation()
				self.BribeOn:setAlpha( 1 )
				self.clipFinished( BribeOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( glow0, {} )
				local glowBribeFrame2 = function ( glowBribe, event )
					local glowBribeFrame3 = function ( glowBribe, event )
						if not event.interrupted then
							glowBribe:beginAnimation( "keyframe", 809, true, true, CoD.TweenType.Linear )
						end
						glowBribe:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glowBribe, event )
						else
							glowBribe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowBribeFrame3( glowBribe, event )
						return 
					else
						glowBribe:beginAnimation( "keyframe", 740, true, true, CoD.TweenType.Linear )
						glowBribe:setAlpha( 1 )
						glowBribe:registerEventHandler( "transition_complete_keyframe", glowBribeFrame3 )
					end
				end
				
				glowBribe:completeAnimation()
				self.glowBribe:setAlpha( 0 )
				glowBribeFrame2( glowBribe, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				self.nextClip = "Focus"
			end
		},
		InsufficientFundsBundle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				BundleOn:completeAnimation()
				self.BundleOn:setAlpha( 1 )
				self.clipFinished( BundleOn, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 1 )
				self.clipFinished( BundleCount, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				glow00:completeAnimation()
				self.glow00:setRGB( 1, 1, 1 )
				self.clipFinished( glow00, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				BundleOn:completeAnimation()
				self.BundleOn:setAlpha( 1 )
				self.clipFinished( BundleOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( glow0, {} )
				local glowBundleFrame2 = function ( glowBundle, event )
					local glowBundleFrame3 = function ( glowBundle, event )
						if not event.interrupted then
							glowBundle:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
						end
						glowBundle:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glowBundle, event )
						else
							glowBundle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowBundleFrame3( glowBundle, event )
						return 
					else
						glowBundle:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glowBundle:setAlpha( 1 )
						glowBundle:registerEventHandler( "transition_complete_keyframe", glowBundleFrame3 )
					end
				end
				
				glowBundle:completeAnimation()
				self.glowBundle:setAlpha( 0 )
				glowBundleFrame2( glowBundle, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 1 )
				self.clipFinished( BundleCount, {} )
				self.nextClip = "Focus"
			end
		},
		Bundle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BMBribeFrame:completeAnimation()
				self.BMBribeFrame:setAlpha( 0.9 )
				self.clipFinished( BMBribeFrame, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				BundleOn:completeAnimation()
				self.BundleOn:setAlpha( 0.75 )
				self.clipFinished( BundleOn, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 1 )
				self.clipFinished( BundleCount, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				smokewidget:completeAnimation()
				self.smokewidget:setRGB( 0.22, 0.93, 0.93 )
				self.smokewidget:setAlpha( 0 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setRGB( 0.22, 0.93, 0.93 )
				self.fxEmber2:setAlpha( 0 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setRGB( 0.22, 0.93, 0.93 )
				self.fxEmber:setAlpha( 0 )
				self.clipFinished( fxEmber, {} )
				BundleOn:completeAnimation()
				self.BundleOn:setAlpha( 1 )
				self.clipFinished( BundleOn, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( glow0, {} )
				local glowBundleFrame2 = function ( glowBundle, event )
					local glowBundleFrame3 = function ( glowBundle, event )
						if not event.interrupted then
							glowBundle:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
						end
						glowBundle:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glowBundle, event )
						else
							glowBundle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowBundleFrame3( glowBundle, event )
						return 
					else
						glowBundle:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						glowBundle:setAlpha( 1 )
						glowBundle:registerEventHandler( "transition_complete_keyframe", glowBundleFrame3 )
					end
				end
				
				glowBundle:completeAnimation()
				self.glowBundle:setAlpha( 0 )
				glowBundleFrame2( glowBundle, {} )
				BlackMarketCryptokeyContainerSmall:completeAnimation()
				self.BlackMarketCryptokeyContainerSmall:setAlpha( 0 )
				self.clipFinished( BlackMarketCryptokeyContainerSmall, {} )
				BMFocusFrame:completeAnimation()
				self.BMFocusFrame:setAlpha( 1 )
				self.clipFinished( BMFocusFrame, {} )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 1 )
				self.clipFinished( BundleCount, {} )
				self.nextClip = "Focus"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InsufficientFunds",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "displayText", "MPUI_BM_COMMON_DROP" ) and not CanAffordCrate( controller, CoD.BlackMarketUtility.DropTypes.COMMON )
			end
		},
		{
			stateName = "InsufficientFundsRare",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "displayText", "MPUI_BM_RARE_DROP" ) and not CanAffordCrate( controller, CoD.BlackMarketUtility.DropTypes.RARE )
			end
		},
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "displayText", "MPUI_BM_COMMON_DROP" )
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "displayText", "MPUI_BM_RARE_DROP" )
			end
		},
		{
			stateName = "InsufficientFundsBribe",
			condition = function ( menu, element, event )
				return IsElementPropertyEnumValue( element, "supplyDropType", Enum.LootCrateType.LOOT_CRATE_TYPE_BRIBE ) and not CanAffordCrate( controller, CoD.BlackMarketUtility.DropTypes.BRIBE )
			end
		},
		{
			stateName = "Bribe",
			condition = function ( menu, element, event )
				return IsElementPropertyEnumValue( element, "supplyDropType", Enum.LootCrateType.LOOT_CRATE_TYPE_BRIBE )
			end
		},
		{
			stateName = "InsufficientFundsBundle",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Bundle",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "displayText", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "displayText"
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	BMSaleActive.id = "BMSaleActive"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BMSaleActive:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel0:close()
		self.BMBribeFrame:close()
		self.smokewidget:close()
		self.fxEmber2:close()
		self.fxEmber:close()
		self.fxglow:close()
		self.ItemHintTextWithError:close()
		self.BlackMarketCODPointContainerSmall:close()
		self.BlackMarketCryptokeyContainerSmall:close()
		self.BMFocusFrame:close()
		self.BMSaleActive:close()
		self.image:close()
		self.Label0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

