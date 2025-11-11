require( "ui.uieditor.widgets.BlackMarket.BM_SaleActive_Hori" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )

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
	self:setLeftRight( 0, 0, 0, 115 )
	self:setTopBottom( 0, 0, 0, 42 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Up = LUI.UIImage.new()
	Up:setLeftRight( 0, 0, -45, 160 )
	Up:setTopBottom( 0, 0, -46, 102 )
	Up:setAlpha( 0 )
	Up:setImage( RegisterImage( "uie_t7_blackmarket_hoverup" ) )
	self:addElement( Up )
	self.Up = Up
	
	local down = LUI.UIImage.new()
	down:setLeftRight( 0, 0, -45, 160 )
	down:setTopBottom( 0, 0, -46, 102 )
	down:setImage( RegisterImage( "uie_t7_blackmarket_hoverdown" ) )
	self:addElement( down )
	self.down = down
	
	local cryptokeyCount = LUI.UIText.new()
	cryptokeyCount:setLeftRight( 0, 0, 5, 111 )
	cryptokeyCount:setTopBottom( 0, 0, 6, 36 )
	cryptokeyCount:setTTF( "fonts/default.ttf" )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( cryptokeyCount )
	self.cryptokeyCount = cryptokeyCount
	
	local hintArrow0 = CoD.HintTextArrow.new( menu, controller )
	hintArrow0:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	hintArrow0:setLeftRight( 0, 0, 52.5, 67.5 )
	hintArrow0:setTopBottom( 0, 0, 54.5, 69.5 )
	hintArrow0:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
	hintArrow0:setAlpha( 0 )
	hintArrow0:linkToElementModel( self, nil, false, function ( model )
		hintArrow0:setModel( model, controller )
	end )
	self:addElement( hintArrow0 )
	self.hintArrow0 = hintArrow0
	
	local ItemHintText = CoD.ItemHintText.new( menu, controller )
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
	ItemHintText:setLeftRight( 0, 0, -57, 177 )
	ItemHintText:setTopBottom( 0, 0, 70, 125 )
	ItemHintText:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
	ItemHintText:setAlpha( 0 )
	ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_COD_POINTS" ) )
	ItemHintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( ItemHintText )
	self.ItemHintText = ItemHintText
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( 0, 0, 127, 153 )
	arrow:setTopBottom( 0, 0, 8, 34 )
	arrow:setAlpha( 0 )
	arrow:setImage( RegisterImage( "uie_t7_blackmarket_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local BMSaleActiveHori = CoD.BM_SaleActive_Hori.new( menu, controller )
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
	BMSaleActiveHori:setLeftRight( 0, 0, 21, 131 )
	BMSaleActiveHori:setTopBottom( 0, 0, 0.5, 75.5 )
	BMSaleActiveHori:linkToElementModel( self, nil, false, function ( model )
		BMSaleActiveHori:setModel( model, controller )
	end )
	self:addElement( BMSaleActiveHori )
	self.BMSaleActiveHori = BMSaleActiveHori
	
	self.cryptokeyCount:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cryptokeyCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		BMSaleActiveHori:completeAnimation()
		Up:completeAnimation()
		arrow:completeAnimation()
		down:completeAnimation()
		cryptokeyCount:completeAnimation()
		hintArrow0:completeAnimation()
		ItemHintText:completeAnimation()
		BMSaleActiveHori:setAlpha( 1 )
		Up:setAlpha( 0 )
		arrow:setLeftRight( 0, 0, 127, 153 )
		arrow:setTopBottom( 0, 0, 8, 34 )
		arrow:setAlpha( 0 )
		down:setAlpha( 1 )
		cryptokeyCount:setRGB( 1, 1, 1 )
		cryptokeyCount:setAlpha( 1 )
		hintArrow0:setAlpha( 0 )
		ItemHintText:setAlpha( 0 )
		ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_COD_POINTS" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( 0, 0, 127, 153 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 135, 161 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( 0, 0, 135, 161 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 127, 153 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end
		},
		NotEnoughCODPoints = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.clipFinished( cryptokeyCount, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.clipFinished( cryptokeyCount, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
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
				self.clipFinished( cryptokeyCount, {} )
				local hintArrow0Frame2 = function ( hintArrow0, event )
					local hintArrow0Frame3 = function ( hintArrow0, event )
						if not event.interrupted then
							hintArrow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						hintArrow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( hintArrow0, event )
						else
							hintArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						hintArrow0Frame3( hintArrow0, event )
						return 
					else
						hintArrow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						hintArrow0:registerEventHandler( "transition_complete_keyframe", hintArrow0Frame3 )
					end
				end
				
				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				hintArrow0Frame2( hintArrow0, {} )
				local ItemHintTextFrame2 = function ( ItemHintText, event )
					local ItemHintTextFrame3 = function ( ItemHintText, event )
						if not event.interrupted then
							ItemHintText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						ItemHintText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ItemHintText, event )
						else
							ItemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ItemHintTextFrame3( ItemHintText, event )
						return 
					else
						ItemHintText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ItemHintText:registerEventHandler( "transition_complete_keyframe", ItemHintTextFrame3 )
					end
				end
				
				ItemHintText:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				ItemHintTextFrame2( ItemHintText, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( 0, 0, 127, 153 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 135, 161 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
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
					arrow:setLeftRight( 0, 0, 135, 161 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 127, 153 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end
		},
		LootSale = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( 0, 0, 127, 153 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 135, 161 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( 0, 0, 127, 153 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 135, 161 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )
			end
		},
		NotEnoughCryptoKeys = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.clipFinished( cryptokeyCount, {} )
				ItemHintText:completeAnimation()
				ItemHintText.textCenterAlign:completeAnimation()
				self.ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_CRYPTOKEYS" ) )
				self.clipFinished( ItemHintText, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Up:completeAnimation()
				self.Up:setAlpha( 0.9 )
				self.clipFinished( Up, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
				self.clipFinished( cryptokeyCount, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
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
				local hintArrow0Frame2 = function ( hintArrow0, event )
					local hintArrow0Frame3 = function ( hintArrow0, event )
						if not event.interrupted then
							hintArrow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						hintArrow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( hintArrow0, event )
						else
							hintArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						hintArrow0Frame3( hintArrow0, event )
						return 
					else
						hintArrow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						hintArrow0:registerEventHandler( "transition_complete_keyframe", hintArrow0Frame3 )
					end
				end
				
				hintArrow0:completeAnimation()
				self.hintArrow0:setAlpha( 0 )
				hintArrow0Frame2( hintArrow0, {} )
				local ItemHintTextFrame2 = function ( ItemHintText, event )
					local ItemHintTextFrame3 = function ( ItemHintText, event )
						if not event.interrupted then
							ItemHintText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							ItemHintText.textCenterAlign:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
						end
						ItemHintText:setAlpha( 1 )
						ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_CRYPTOKEYS" ) )
						if event.interrupted then
							self.clipFinished( ItemHintText, event )
						else
							ItemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ItemHintTextFrame3( ItemHintText, event )
						return 
					else
						ItemHintText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ItemHintText:registerEventHandler( "transition_complete_keyframe", ItemHintTextFrame3 )
					end
				end
				
				ItemHintText:completeAnimation()
				ItemHintText.textCenterAlign:completeAnimation()
				self.ItemHintText:setAlpha( 0 )
				self.ItemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_BM_NOT_ENOUGH_CRYPTOKEYS" ) )
				ItemHintTextFrame2( ItemHintText, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( 0, 0, 127, 153 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 135, 161 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )
				BMSaleActiveHori:completeAnimation()
				self.BMSaleActiveHori:setAlpha( 0 )
				self.clipFinished( BMSaleActiveHori, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
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
					arrow:setLeftRight( 0, 0, 135, 161 )
					arrow:setTopBottom( 0, 0, 8, 34 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( 0, 0, 127, 153 )
				self.arrow:setTopBottom( 0, 0, 8, 34 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.hintArrow0:close()
		self.ItemHintText:close()
		self.BMSaleActiveHori:close()
		self.cryptokeyCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

