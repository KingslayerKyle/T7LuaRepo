-- 0bb33b8ecfbcc61ff339b52dca9e3125
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.BlackMarket.BM_SaleActive_Hori" )

CoD.BlackMarketTradeAgainListItem = InheritFrom( LUI.UIElement )
CoD.BlackMarketTradeAgainListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BlackMarketTradeAgainListItem )
	self.id = "BlackMarketTradeAgainListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 77 )
	self:setTopBottom( true, false, 0, 28 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Up = LUI.UIImage.new()
	Up:setLeftRight( true, false, -30.34, 106.34 )
	Up:setTopBottom( true, false, -30.18, 68.18 )
	Up:setAlpha( 0 )
	Up:setImage( RegisterImage( "uie_t7_blackmarket_hoverup" ) )
	self:addElement( Up )
	self.Up = Up
	
	local down = LUI.UIImage.new()
	down:setLeftRight( true, false, -30.34, 106.34 )
	down:setTopBottom( true, false, -30.18, 68.18 )
	down:setImage( RegisterImage( "uie_t7_blackmarket_hoverdown" ) )
	self:addElement( down )
	self.down = down
	
	local cryptokeyCount = LUI.UIText.new()
	cryptokeyCount:setLeftRight( true, false, 3, 74 )
	cryptokeyCount:setTopBottom( true, false, 4, 24 )
	cryptokeyCount:setTTF( "fonts/default.ttf" )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( cryptokeyCount )
	self.cryptokeyCount = cryptokeyCount
	
	local hintArrow0 = CoD.HintTextArrow.new( menu, controller )
	hintArrow0:setLeftRight( true, false, 35, 45 )
	hintArrow0:setTopBottom( true, false, 36.46, 46.46 )
	hintArrow0:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
	hintArrow0:setAlpha( 0 )
	hintArrow0:linkToElementModel( self, nil, false, function ( model )
		hintArrow0:setModel( model, controller )
	end )
	hintArrow0:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( hintArrow0 )
	self.hintArrow0 = hintArrow0
	
	local ItemHintText = CoD.ItemHintText.new( menu, controller )
	ItemHintText:setLeftRight( true, false, -38, 118 )
	ItemHintText:setTopBottom( true, false, 46.46, 83.46 )
	ItemHintText:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
	ItemHintText:setAlpha( 0 )
	ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_COD_POINTS" ) )
	ItemHintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	ItemHintText:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ItemHintText )
	self.ItemHintText = ItemHintText
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, 85, 102 )
	arrow:setTopBottom( true, false, 5.5, 22.5 )
	arrow:setAlpha( 0 )
	arrow:setImage( RegisterImage( "uie_t7_blackmarket_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local BMSaleActiveHori = CoD.BM_SaleActive_Hori.new( menu, controller )
	BMSaleActiveHori:setLeftRight( true, false, 14, 87 )
	BMSaleActiveHori:setTopBottom( true, false, 0, 50 )
	BMSaleActiveHori:linkToElementModel( self, nil, false, function ( model )
		BMSaleActiveHori:setModel( model, controller )
	end )
	BMSaleActiveHori:mergeStateConditions( {
		{
			stateName = "SaleOn",
			condition = function ( menu, element, event )
				return IsLootSaleActive( controller ) and IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 )
			end
		}
	} )
	BMSaleActiveHori:linkToElementModel( BMSaleActiveHori, "itemCODPointCost", true, function ( model )
		menu:updateElementState( BMSaleActiveHori, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		} )
	end )
	self:addElement( BMSaleActiveHori )
	self.BMSaleActiveHori = BMSaleActiveHori
	
	self.cryptokeyCount:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			cryptokeyCount:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				self.clipFinished( Up, {} )

				down:completeAnimation()
				self.down:setAlpha( 1 )
				self.clipFinished( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )

				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				self.clipFinished( hintArrow0, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )

				down:completeAnimation()
				self.down:setAlpha( 1 )
				self.clipFinished( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 1 )
				downFrame2( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 85, 102 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 90, 107 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 0 )
				downFrame2( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 90, 107 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 85, 102 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end
		},
		NotEnoughCODPoints = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				self.clipFinished( Up, {} )

				down:completeAnimation()
				self.down:setAlpha( 1 )
				self.clipFinished( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )

				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				self.clipFinished( hintArrow0, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )

				down:completeAnimation()
				self.down:setAlpha( 1 )
				self.clipFinished( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 1 )
				downFrame2( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )

				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				self.clipFinished( hintArrow0, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 85, 102 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 90, 107 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 0 )
				downFrame2( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 90, 107 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 85, 102 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end
		},
		LootSale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				self.clipFinished( Up, {} )

				down:completeAnimation()
				self.down:setAlpha( 1 )
				self.clipFinished( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )

				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				self.clipFinished( hintArrow0, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 1 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )

				down:completeAnimation()
				self.down:setAlpha( 1 )
				self.clipFinished( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 1 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 1 )
				downFrame2( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 85, 102 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 90, 107 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 1 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 0 )
				downFrame2( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( 1, 1, 1 )
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 85, 102 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 90, 107 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 1 )
				self.clipFinished( BMSaleActiveHori, {} )
			end
		},
		NotEnoughCryptoKeys = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				self.clipFinished( Up, {} )

				down:completeAnimation()
				self.down:setAlpha( 1 )
				self.clipFinished( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.clipFinished( cryptokeyCount, {} )

				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				self.clipFinished( hintArrow0, {} )

				ItemHintText:completeAnimation()

				ItemHintText.textCenterAlign:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_CRYPTOKEYS" ) )
				self.clipFinished( ItemHintText, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )

				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.clipFinished( ItemHintText, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 1 )
				downFrame2( down, {} )
				local cryptokeyCountFrame2 = function ( cryptokeyCount, event )
					if not event.interrupted then
						cryptokeyCount:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
					cryptokeyCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cryptokeyCount, event )
					else
						cryptokeyCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.cryptokeyCount:setAlpha( 1 )
				cryptokeyCountFrame2( cryptokeyCount, {} )

				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				self.clipFinished( hintArrow0, {} )

				ItemHintText:completeAnimation()

				ItemHintText.textCenterAlign:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_CRYPTOKEYS" ) )
				self.clipFinished( ItemHintText, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 85, 102 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 90, 107 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )

				local UpFrame2 = function ( Up, event )
					if not event.interrupted then
						Up:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Up:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Up, event )
					else
						Up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				UpFrame2( Up, {} )
				local downFrame2 = function ( down, event )
					if not event.interrupted then
						down:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					down:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( down, event )
					else
						down:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				down:completeAnimation()
				self.down:setAlpha( 0 )
				downFrame2( down, {} )

				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.clipFinished( cryptokeyCount, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 90, 107 )
					arrow:setTopBottom( true, false, 5.5, 22.5 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 85, 102 )
				self.arrow:setTopBottom( true, false, 5.5, 22.5 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )

				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NotEnoughCODPoints",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 ) and not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" )
			end
		},
		{
			stateName = "LootSale",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 ) and IsLootSaleActive( controller )
			end
		},
		{
			stateName = "NotEnoughCryptoKeys",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemCost", 0 ) and not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "itemCost" )
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
	self:linkToElementModel( self, "itemCost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCost"
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

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "LootSale" ) then
			UpdateElementState( self, "BMSaleActiveHori", controller )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintArrow0:close()
		element.ItemHintText:close()
		element.BMSaleActiveHori:close()
		element.cryptokeyCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
