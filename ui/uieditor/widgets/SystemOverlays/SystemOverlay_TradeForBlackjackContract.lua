-- d3d98676a0510c88b7db5b7f7cc07246
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketCryptokeyContainerSmall" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )

CoD.SystemOverlay_TradeForBlackjackContract = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_TradeForBlackjackContract.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_TradeForBlackjackContract )
	self.id = "SystemOverlay_TradeForBlackjackContract"
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
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 64, 364 )
	largeImage:setTopBottom( true, false, 58, 262 )
	largeImage:setImage( RegisterImage( "uie_t7_bm_contracts_mercenary_icon" ) )
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
	options:setTopBottom( true, false, 154, 256 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 3 )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f6_local0 = options
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsDisabled( f9_arg0, f9_arg2 ) then
			ProcessListAction( self, f9_arg0, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f10_arg0, f10_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( options )
	self.options = options
	
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
	
	local PurchasingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	PurchasingWidget:setLeftRight( true, false, 399, 705 )
	PurchasingWidget:setTopBottom( true, false, 115, 211 )
	PurchasingWidget:setAlpha( 0 )
	self:addElement( PurchasingWidget )
	self.PurchasingWidget = PurchasingWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PurchasingWidget:completeAnimation()
				self.PurchasingWidget:setAlpha( 0 )
				self.clipFinished( PurchasingWidget, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PurchasingWidget:completeAnimation()
				self.PurchasingWidget:setAlpha( 1 )
				self.clipFinished( PurchasingWidget, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Purchasing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.options:close()
		element.BlackMarketCryptokeyContainerSmall:close()
		element.PurchasingWidget:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

