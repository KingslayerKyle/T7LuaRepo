-- 58363813380c4a050cfa0db2ff154c10
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.onOffText" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryCODPointContainerSmall" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactory_SaleActive" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookVialContainerSmall" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbook_VialSaleActive" )

CoD.GobbleGumCookbook_BuyDistillsListItem = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbook_BuyDistillsListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbook_BuyDistillsListItem )
	self.id = "GobbleGumCookbook_BuyDistillsListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 190 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2.77 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, -2, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( false, false, -73.86, 73.86 )
	Icon:setTopBottom( true, false, 24.97, 172.69 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local FEFocusBarContainerTop = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerTop:setLeftRight( true, true, -2, 2 )
	FEFocusBarContainerTop:setTopBottom( true, false, -4, 4 )
	self:addElement( FEFocusBarContainerTop )
	self.FEFocusBarContainerTop = FEFocusBarContainerTop
	
	local FEFocusBarContainerBottom = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerBottom:setLeftRight( true, true, -2, 2 )
	FEFocusBarContainerBottom:setTopBottom( false, true, -3, 5 )
	self:addElement( FEFocusBarContainerBottom )
	self.FEFocusBarContainerBottom = FEFocusBarContainerBottom
	
	local timeRemainingText0 = CoD.onOffText.new( menu, controller )
	timeRemainingText0:setLeftRight( true, false, 7, 186 )
	timeRemainingText0:setTopBottom( true, false, 86.33, 111.33 )
	timeRemainingText0.lbText:setTTF( "fonts/default.ttf" )
	timeRemainingText0.lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timeRemainingText0:linkToElementModel( self, nil, false, function ( model )
		timeRemainingText0:setModel( model, controller )
	end )
	timeRemainingText0:linkToElementModel( self, "timeRemaining", true, function ( model )
		local timeRemaining = Engine.GetModelValue( model )
		if timeRemaining then
			timeRemainingText0.lbText:setText( Engine.Localize( SecondsAsHourMinutesSeconds( timeRemaining ) ) )
		end
	end )
	timeRemainingText0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not ShowGobbleGumDistillTimer( self, controller )
			end
		},
		{
			stateName = "HiddenPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	timeRemainingText0:linkToElementModel( timeRemainingText0, "timeRemaining", true, function ( model )
		menu:updateElementState( timeRemainingText0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "timeRemaining"
		} )
	end )
	self:addElement( timeRemainingText0 )
	self.timeRemainingText0 = timeRemainingText0
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( true, false, 7, 207 )
	Text:setTopBottom( false, true, -45, 0 )
	Text:setRGB( 1, 0.77, 0 )
	Text:setAlpha( 0.85 )
	Text:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Text:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			Text:setText( LocalizeIntoString( "MENU_MULTIPLIER_X", text ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local MegaChewFactoryCODPointContainerSmall0 = CoD.MegaChewFactoryCODPointContainerSmall.new( menu, controller )
	MegaChewFactoryCODPointContainerSmall0:setLeftRight( true, false, 4, 83 )
	MegaChewFactoryCODPointContainerSmall0:setTopBottom( true, false, 4, 32 )
	MegaChewFactoryCODPointContainerSmall0:linkToElementModel( self, nil, false, function ( model )
		MegaChewFactoryCODPointContainerSmall0:setModel( model, controller )
	end )
	MegaChewFactoryCODPointContainerSmall0:mergeStateConditions( {
		{
			stateName = "HiddenForLootSale",
			condition = function ( menu, element, event )
				return IsDistillCODPointsSaleActive( controller )
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
	
	local codPointsSaleActive = CoD.MegaChewFactory_SaleActive.new( menu, controller )
	codPointsSaleActive:setLeftRight( true, false, 18.5, 76.5 )
	codPointsSaleActive:setTopBottom( true, false, 5.5, 55.5 )
	codPointsSaleActive:linkToElementModel( self, nil, false, function ( model )
		codPointsSaleActive:setModel( model, controller )
	end )
	codPointsSaleActive:mergeStateConditions( {
		{
			stateName = "SaleOnInsufficientFunds",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f14_local0 = IsDistillCODPointsSaleActive( controller )
					if f14_local0 then
						f14_local0 = IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 )
					end
				else
					f14_local0 = false
				end
				return f14_local0
			end
		},
		{
			stateName = "SaleOn",
			condition = function ( menu, element, event )
				return IsDistillCODPointsSaleActive( controller ) and IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 )
			end
		}
	} )
	codPointsSaleActive:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		menu:updateElementState( codPointsSaleActive, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		} )
	end )
	codPointsSaleActive:linkToElementModel( codPointsSaleActive, "itemCODPointCost", true, function ( model )
		menu:updateElementState( codPointsSaleActive, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		} )
	end )
	codPointsSaleActive:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( codPointsSaleActive, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:addElement( codPointsSaleActive )
	self.codPointsSaleActive = codPointsSaleActive
	
	local GobbleGumCookbookVialContainerSmall = CoD.GobbleGumCookbookVialContainerSmall.new( menu, controller )
	GobbleGumCookbookVialContainerSmall:setLeftRight( true, false, 135.25, 189.77 )
	GobbleGumCookbookVialContainerSmall:setTopBottom( true, false, 6.5, 31.5 )
	GobbleGumCookbookVialContainerSmall:linkToElementModel( self, nil, false, function ( model )
		GobbleGumCookbookVialContainerSmall:setModel( model, controller )
	end )
	self:addElement( GobbleGumCookbookVialContainerSmall )
	self.GobbleGumCookbookVialContainerSmall = GobbleGumCookbookVialContainerSmall
	
	local GobbleGumCookbookVialSaleActive = CoD.GobbleGumCookbook_VialSaleActive.new( menu, controller )
	GobbleGumCookbookVialSaleActive:setLeftRight( true, false, 140.57, 198.57 )
	GobbleGumCookbookVialSaleActive:setTopBottom( true, false, 6, 56 )
	GobbleGumCookbookVialSaleActive:linkToElementModel( self, nil, false, function ( model )
		GobbleGumCookbookVialSaleActive:setModel( model, controller )
	end )
	self:addElement( GobbleGumCookbookVialSaleActive )
	self.GobbleGumCookbookVialSaleActive = GobbleGumCookbookVialSaleActive
	
	local FreeTextBox = LUI.UIText.new()
	FreeTextBox:setLeftRight( true, false, 4, 186 )
	FreeTextBox:setTopBottom( true, false, 6.5, 31.5 )
	FreeTextBox:setText( Engine.Localize( "MENU_STORE_FREE_PRODUCT" ) )
	FreeTextBox:setTTF( "fonts/default.ttf" )
	FreeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FreeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FreeTextBox )
	self.FreeTextBox = FreeTextBox
	
	self.Icon:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Icon:setImage( RegisterImage( image ) )
		end
	end )
	self.codPointsSaleActive:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			codPointsSaleActive.Label0:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", GetVialCostBeforeDiscount( controller, itemCODPointCost ) ) ) )
		end
	end )
	self.codPointsSaleActive:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			codPointsSaleActive.codpointText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", itemCODPointCost ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 0.85 )
				self.clipFinished( Text, {} )

				MegaChewFactoryCODPointContainerSmall0:completeAnimation()
				self.MegaChewFactoryCODPointContainerSmall0:setAlpha( 1 )
				self.clipFinished( MegaChewFactoryCODPointContainerSmall0, {} )

				codPointsSaleActive:completeAnimation()
				self.codPointsSaleActive:setAlpha( 1 )
				self.clipFinished( codPointsSaleActive, {} )

				GobbleGumCookbookVialContainerSmall:completeAnimation()
				self.GobbleGumCookbookVialContainerSmall:setAlpha( 1 )
				self.clipFinished( GobbleGumCookbookVialContainerSmall, {} )

				GobbleGumCookbookVialSaleActive:completeAnimation()
				self.GobbleGumCookbookVialSaleActive:setAlpha( 1 )
				self.clipFinished( GobbleGumCookbookVialSaleActive, {} )

				FreeTextBox:completeAnimation()
				self.FreeTextBox:setAlpha( 0 )
				self.clipFinished( FreeTextBox, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerBottom, {} )
			end
		}
	}
	codPointsSaleActive.id = "codPointsSaleActive"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.codPointsSaleActive:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.FEFocusBarContainerTop:close()
		element.FEFocusBarContainerBottom:close()
		element.timeRemainingText0:close()
		element.MegaChewFactoryCODPointContainerSmall0:close()
		element.codPointsSaleActive:close()
		element.GobbleGumCookbookVialContainerSmall:close()
		element.GobbleGumCookbookVialSaleActive:close()
		element.Icon:close()
		element.Text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

