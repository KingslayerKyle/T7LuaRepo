require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BlackMarket.smokewidget" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember2" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember" )
require( "ui.uieditor.widgets.BlackMarket.fx_glow" )
require( "ui.uieditor.widgets.BlackMarket.BlackmarketHintbox" )
require( "ui.uieditor.widgets.BlackMarket.ItemHintTextWithError" )

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
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 200 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel0:setLeftRight( true, true, 0, 0 )
	LeftPanel0:setTopBottom( true, true, 0, 0 )
	LeftPanel0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel0 )
	self.LeftPanel0 = LeftPanel0
	
	local glow00 = LUI.UIImage.new()
	glow00:setLeftRight( false, false, -68.4, 68.4 )
	glow00:setTopBottom( true, false, 42, 178 )
	glow00:setRGB( 0.22, 0.93, 0.93 )
	glow00:setAlpha( 0 )
	glow00:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow00 )
	self.glow00 = glow00
	
	local smokewidget = CoD.smokewidget.new( menu, controller )
	smokewidget:setLeftRight( true, false, -4.75, 164.85 )
	smokewidget:setTopBottom( true, false, -10, 168.5 )
	smokewidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( smokewidget )
	self.smokewidget = smokewidget
	
	local fxEmber2 = CoD.fx_Ember2.new( menu, controller )
	fxEmber2:setLeftRight( true, false, 8.05, 152.05 )
	fxEmber2:setTopBottom( true, false, 5, 185 )
	fxEmber2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber2 )
	self.fxEmber2 = fxEmber2
	
	local fxEmber = CoD.fx_Ember.new( menu, controller )
	fxEmber:setLeftRight( true, false, 4.25, 155.85 )
	fxEmber:setTopBottom( true, false, 17.5, 207 )
	fxEmber:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber )
	self.fxEmber = fxEmber
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -68.4, 68.4 )
	image:setTopBottom( true, false, 41.5, 177.5 )
	image:setAlpha( 0 )
	image:linkToElementModel( self, "image", true, function ( model )
		local _image = Engine.GetModelValue( model )
		if _image then
			image:setImage( RegisterImage( _image ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local RareOn = LUI.UIImage.new()
	RareOn:setLeftRight( false, false, -68.4, 68.4 )
	RareOn:setTopBottom( true, false, 41.5, 177.5 )
	RareOn:setAlpha( 0 )
	RareOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_rare_focus" ) )
	self:addElement( RareOn )
	self.RareOn = RareOn
	
	local CommonOn = LUI.UIImage.new()
	CommonOn:setLeftRight( false, false, -68.4, 68.4 )
	CommonOn:setTopBottom( true, false, 41.5, 177.5 )
	CommonOn:setAlpha( 0 )
	CommonOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_common_focus" ) )
	self:addElement( CommonOn )
	self.CommonOn = CommonOn
	
	local fxglow = CoD.fx_glow.new( menu, controller )
	fxglow:setLeftRight( true, false, 11.6, 148.4 )
	fxglow:setTopBottom( true, false, 41.5, 177.5 )
	self:addElement( fxglow )
	self.fxglow = fxglow
	
	local itemHintText = CoD.BlackmarketHintbox.new( menu, controller )
	itemHintText:setLeftRight( true, false, -1, 247 )
	itemHintText:setTopBottom( false, true, 16, 47 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	itemHintText:linkToElementModel( self, nil, false, function ( model )
		itemHintText:setModel( model, controller )
	end )
	itemHintText:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "RightAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return not AlwaysTrue()
			end
		}
	} )
	self:addElement( itemHintText )
	self.itemHintText = itemHintText
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( true, false, 5.25, 33.25 )
	CryptoIcon:setTopBottom( true, false, 7, 35 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptoCount = LUI.UIText.new()
	CryptoCount:setLeftRight( true, false, 35.25, 97.75 )
	CryptoCount:setTopBottom( true, false, 10, 32 )
	CryptoCount:setTTF( "fonts/default.ttf" )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CryptoCount:linkToElementModel( self, "itemCount", true, function ( model )
		local itemCount = Engine.GetModelValue( model )
		if itemCount then
			CryptoCount:setText( Engine.Localize( itemCount ) )
		end
	end )
	self:addElement( CryptoCount )
	self.CryptoCount = CryptoCount
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( false, false, -87.5, 87.5 )
	Label0:setTopBottom( true, false, 173, 193 )
	Label0:setAlpha( 0.75 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			Label0:setText( Engine.Localize( displayText ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local ItemHintTextWithError = CoD.ItemHintTextWithError.new( menu, controller )
	ItemHintTextWithError:setLeftRight( true, false, 2, 250 )
	ItemHintTextWithError:setTopBottom( true, false, 216, 259 )
	ItemHintTextWithError.errorText:setText( Engine.Localize( "MPUI_NOT_ENOUGH_CRYPTOKEYS" ) )
	ItemHintTextWithError:linkToElementModel( self, nil, false, function ( model )
		ItemHintTextWithError:setModel( model, controller )
	end )
	ItemHintTextWithError:linkToElementModel( self, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			ItemHintTextWithError.textCenterAlign:setText( Engine.Localize( hintText ) )
		end
	end )
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
	self:addElement( ItemHintTextWithError )
	self.ItemHintTextWithError = ItemHintTextWithError
	
	local glow0 = LUI.UIImage.new()
	glow0:setLeftRight( false, false, -68.4, 68.4 )
	glow0:setTopBottom( true, false, 42, 178 )
	glow0:setAlpha( 0.4 )
	glow0:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow0 )
	self.glow0 = glow0
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, -1, 1 )
	cachitBG0:setTopBottom( true, true, -1, 1 )
	cachitBG0:setAlpha( 0.4 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.02, 0.02, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 1 )
				self.clipFinished( smokewidget, {} )
				image:completeAnimation()
				self.image:setLeftRight( false, false, -68.4, 68.4 )
				self.image:setTopBottom( true, false, 43.5, 179.5 )
				self.clipFinished( image, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
			end
		},
		InsufficientFunds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				glow00:completeAnimation()
				self.glow00:setAlpha( 0 )
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
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 0 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 0 )
				self.clipFinished( CommonOn, {} )
				fxglow:completeAnimation()
				self.fxglow:setAlpha( 0 )
				self.clipFinished( fxglow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0.75 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				glow0:completeAnimation()
				self.glow0:setAlpha( 0 )
				self.clipFinished( glow0, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
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
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 1 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 1 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 1 )
				self.clipFinished( fxEmber, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 0 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 1 )
				self.clipFinished( CommonOn, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				ItemHintTextWithError.errorText:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 1 )
				self.ItemHintTextWithError.errorText:setText( Engine.Localize( "MPUI_NOT_ENOUGH_CRYPTOKEYS" ) )
				self.clipFinished( ItemHintTextWithError, {} )
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
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0.69 )
				self.clipFinished( cachitBG0, {} )
				self.nextClip = "Focus"
			end
		},
		InsufficientFundsRare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				glow00:completeAnimation()
				self.glow00:setAlpha( 0 )
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
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 0 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 0 )
				self.clipFinished( CommonOn, {} )
				fxglow:completeAnimation()
				self.fxglow:setAlpha( 0 )
				self.clipFinished( fxglow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0.75 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				glow0:completeAnimation()
				self.glow0:setAlpha( 0 )
				self.clipFinished( glow0, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
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
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 1 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 1 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 1 )
				self.clipFinished( fxEmber, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 1 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 0 )
				self.clipFinished( CommonOn, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				ItemHintTextWithError.errorText:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 1 )
				self.ItemHintTextWithError.errorText:setText( Engine.Localize( "MPUI_NOT_ENOUGH_CRYPTOKEYS" ) )
				self.clipFinished( ItemHintTextWithError, {} )
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
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0.69 )
				self.clipFinished( cachitBG0, {} )
				self.nextClip = "Focus"
			end
		},
		Common = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				glow00:completeAnimation()
				self.glow00:setAlpha( 0 )
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
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 0 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 0 )
				self.clipFinished( CommonOn, {} )
				fxglow:completeAnimation()
				self.fxglow:setAlpha( 0 )
				self.clipFinished( fxglow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 1, 1, 1 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0.75 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				glow0:completeAnimation()
				self.glow0:setAlpha( 0 )
				self.clipFinished( glow0, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
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
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 1 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 1 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 1 )
				self.clipFinished( fxEmber, {} )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 0 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 1 )
				self.clipFinished( CommonOn, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 1, 1, 1 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
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
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0.69 )
				self.clipFinished( cachitBG0, {} )
				self.nextClip = "Focus"
			end
		},
		Rare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				glow00:completeAnimation()
				self.glow00:setAlpha( 0 )
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
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 0 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 0 )
				self.clipFinished( CommonOn, {} )
				fxglow:completeAnimation()
				self.fxglow:setAlpha( 0 )
				self.clipFinished( fxglow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 1, 1, 1 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0.75 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
				glow0:completeAnimation()
				self.glow0:setAlpha( 0 )
				self.clipFinished( glow0, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
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
				self.smokewidget:setAlpha( 1 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setRGB( 0.22, 0.93, 0.93 )
				self.fxEmber:setAlpha( 1 )
				self.clipFinished( fxEmber, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 1 )
				self.clipFinished( RareOn, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 0 )
				self.clipFinished( CommonOn, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 1, 1, 1 )
				self.clipFinished( CryptoCount, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				ItemHintTextWithError:completeAnimation()
				self.ItemHintTextWithError:setAlpha( 0 )
				self.clipFinished( ItemHintTextWithError, {} )
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
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0.69 )
				self.clipFinished( cachitBG0, {} )
				self.nextClip = "Focus"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InsufficientFunds",
			condition = function ( menu, element, event )
				local f41_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "itemCount" ) then
					f41_local0 = IsSelfModelValueEqualTo( element, controller, "displayText", "MPUI_BM_COMMON_DROP" )
				else
					f41_local0 = false
				end
				return f41_local0
			end
		},
		{
			stateName = "InsufficientFundsRare",
			condition = function ( menu, element, event )
				local f42_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "itemCount" ) then
					f42_local0 = IsSelfModelValueEqualTo( element, controller, "displayText", "MPUI_BM_RARE_DROP" )
				else
					f42_local0 = false
				end
				return f42_local0
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
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	self:linkToElementModel( self, "itemCount", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCount"
		} )
	end )
	self:linkToElementModel( self, "displayText", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "displayText"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel0:close()
		element.smokewidget:close()
		element.fxEmber2:close()
		element.fxEmber:close()
		element.fxglow:close()
		element.itemHintText:close()
		element.ItemHintTextWithError:close()
		element.image:close()
		element.CryptoCount:close()
		element.Label0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

