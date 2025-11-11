require( "ui.uieditor.widgets.BlackMarket.BlackMarketCODPointContainerSmall" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

if IsOrbis() or IsDurango() then
	require( "ui.uieditor.menus.Store.Store_CodPoints" )
end
CoD.SystemOverlay_ExtraSlots = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_ExtraSlots.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_ExtraSlots )
	self.id = "SystemOverlay_ExtraSlots"
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
	largeImage:setLeftRight( 0, 0, 96, 576 )
	largeImage:setTopBottom( 0, 1, 0, 0 )
	largeImage:setImage( RegisterImage( "uie_t7_icon_unlock_generic_square_overlays" ) )
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
	options:setLeftRight( 0, 0, 485, 1607 )
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
	
	local BlackMarketCODPointContainerSmall = CoD.BlackMarketCODPointContainerSmall.new( menu, controller )
	BlackMarketCODPointContainerSmall:mergeStateConditions( {
		{
			stateName = "ShownInsufficientFunds",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f11_local0 = AlwaysFalse()
				else
					f11_local0 = false
				end
				return f11_local0
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
				local f13_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f13_local0 = IsSelfModelValueGreaterThan( element, controller, "codpointcost", 0 )
					if f13_local0 then
						f13_local0 = not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "codpointcost" )
					end
				else
					f13_local0 = false
				end
				return f13_local0
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
	BlackMarketCODPointContainerSmall:setLeftRight( 0, 0, 1510, 1601 )
	BlackMarketCODPointContainerSmall:setTopBottom( 0, 0, 18, 58 )
	BlackMarketCODPointContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCODPointContainerSmall:setModel( model, controller )
	end )
	self:addElement( BlackMarketCODPointContainerSmall )
	self.BlackMarketCODPointContainerSmall = BlackMarketCODPointContainerSmall
	
	local disclaimerText = LUI.UIText.new()
	disclaimerText:setLeftRight( 0, 0, 633, 1750 )
	disclaimerText:setTopBottom( 0, 0, 335, 373 )
	disclaimerText:setText( Engine.Localize( "MENU_EXTRASLOTS_DISCLAIMER" ) )
	disclaimerText:setTTF( "fonts/default.ttf" )
	disclaimerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	disclaimerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( disclaimerText )
	self.disclaimerText = disclaimerText
	
	local codpointCostString = LUI.UIText.new()
	codpointCostString:setLeftRight( 0, 0, 632, 932 )
	codpointCostString:setTopBottom( 0, 0, 165, 203 )
	codpointCostString:setTTF( "fonts/default.ttf" )
	codpointCostString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	codpointCostString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	codpointCostString:linkToElementModel( self, "codpointcostString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			codpointCostString:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( codpointCostString )
	self.codpointCostString = codpointCostString
	
	local PurchasingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	PurchasingWidget:setLeftRight( 0, 0, 598.5, 1057.5 )
	PurchasingWidget:setTopBottom( 0, 0, 172, 316 )
	PurchasingWidget:setAlpha( 0 )
	self:addElement( PurchasingWidget )
	self.PurchasingWidget = PurchasingWidget
	
	self.resetProperties = function ()
		codpointCostString:completeAnimation()
		disclaimerText:completeAnimation()
		PurchasingWidget:completeAnimation()
		codpointCostString:setAlpha( 1 )
		disclaimerText:setAlpha( 1 )
		PurchasingWidget:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				disclaimerText:completeAnimation()
				self.disclaimerText:setAlpha( 0 )
				self.clipFinished( disclaimerText, {} )
				codpointCostString:completeAnimation()
				self.codpointCostString:setAlpha( 0 )
				self.clipFinished( codpointCostString, {} )
				PurchasingWidget:completeAnimation()
				self.PurchasingWidget:setAlpha( 1 )
				self.clipFinished( PurchasingWidget, {} )
			end
		}
	}
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
		if not IsMenuModelValueEqualTo( menu, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( controller ) and not IsPC() then
			GoBackAndOpenOverlayOnParent( self, "Store_CodPoints", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsMenuModelValueEqualTo( menu, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( controller ) and not IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS", nil )
			return true
		else
			return false
		end
	end, false )
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.text:close()
		self.options:close()
		self.BlackMarketCODPointContainerSmall:close()
		self.PurchasingWidget:close()
		self.categoryTypeImage:close()
		self.title:close()
		self.codpointCostString:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

