require( "ui.uieditor.widgets.BlackMarket.BlackMarketCODPointContainerSmall" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

if IsOrbis() or IsDurango() then
	require( "ui.uieditor.menus.Store.Store_CodPoints" )
end
CoD.SystemOverlay_ExtraSlotsPurchased = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_ExtraSlotsPurchased.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_ExtraSlotsPurchased )
	self.id = "SystemOverlay_ExtraSlotsPurchased"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 1920 )
	bg:setTopBottom( 0, 0, 0, 504 )
	bg:setAlpha( 0 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_backgroundbg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local BIGicon = LUI.UIImage.new()
	BIGicon:setLeftRight( 0, 0, 1580, 1920 )
	BIGicon:setTopBottom( 0, 0, -6, 480 )
	BIGicon:setAlpha( 0 )
	BIGicon:setImage( RegisterImage( "uie_t7_blackmarket_popup_icon" ) )
	self:addElement( BIGicon )
	self.BIGicon = BIGicon
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 112, 436 )
	largeImage:setTopBottom( 0, 0, -21, 303 )
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
	
	local BlackMarketCODPointContainerSmall = CoD.BlackMarketCODPointContainerSmall.new( menu, controller )
	BlackMarketCODPointContainerSmall:mergeStateConditions( {
		{
			stateName = "ShownInsufficientFunds",
			condition = function ( menu, element, event )
				local f12_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f12_local0 = AlwaysFalse()
				else
					f12_local0 = false
				end
				return f12_local0
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
				local f14_local0
				if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "itemCODPointCost" ) then
					f14_local0 = IsSelfModelValueGreaterThan( element, controller, "codpointcost", 0 )
					if f14_local0 then
						f14_local0 = not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.codPoints", "codpointcost" )
					end
				else
					f14_local0 = false
				end
				return f14_local0
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
	
	local purchaseCompleteDesc = LUI.UIText.new()
	purchaseCompleteDesc:setLeftRight( 0, 0, 632, 1381 )
	purchaseCompleteDesc:setTopBottom( 0, 0, 147, 185 )
	purchaseCompleteDesc:setText( Engine.Localize( "MENU_EXTRASLOTS_PURCHASE_COMPLETE_DETAIL" ) )
	purchaseCompleteDesc:setTTF( "fonts/default.ttf" )
	purchaseCompleteDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	purchaseCompleteDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( purchaseCompleteDesc )
	self.purchaseCompleteDesc = purchaseCompleteDesc
	
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
		self.largeImage:close()
		self.categoryTypeImage:close()
		self.title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

