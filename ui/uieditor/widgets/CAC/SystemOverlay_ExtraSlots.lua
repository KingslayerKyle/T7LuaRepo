-- efde620a8d3957292e7fc3a2acbc7af7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketCODPointContainerSmall" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )

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
	
	local BIGicon = LUI.UIImage.new()
	BIGicon:setLeftRight( true, false, 1053.2, 1280 )
	BIGicon:setTopBottom( true, false, -4, 320 )
	BIGicon:setImage( RegisterImage( "uie_t7_blackmarket_popup_icon" ) )
	self:addElement( BIGicon )
	self.BIGicon = BIGicon
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 64, 384 )
	largeImage:setTopBottom( true, true, 0, 0 )
	largeImage:setImage( RegisterImage( "uie_t7_icon_unlock_generic_square_overlays" ) )
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
	
	local BlackMarketCODPointContainerSmall = CoD.BlackMarketCODPointContainerSmall.new( menu, controller )
	BlackMarketCODPointContainerSmall:setLeftRight( true, false, 1007, 1067.5 )
	BlackMarketCODPointContainerSmall:setTopBottom( true, false, 12, 39 )
	BlackMarketCODPointContainerSmall:setScale( 1 )
	BlackMarketCODPointContainerSmall:linkToElementModel( self, nil, false, function ( model )
		BlackMarketCODPointContainerSmall:setModel( model, controller )
	end )
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
	self:addElement( BlackMarketCODPointContainerSmall )
	self.BlackMarketCODPointContainerSmall = BlackMarketCODPointContainerSmall
	
	local disclaimerText = LUI.UIText.new()
	disclaimerText:setLeftRight( true, false, 422, 1166.6 )
	disclaimerText:setTopBottom( true, false, 223.78, 248.78 )
	disclaimerText:setText( Engine.Localize( "MENU_EXTRASLOTS_DISCLAIMER" ) )
	disclaimerText:setTTF( "fonts/default.ttf" )
	disclaimerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	disclaimerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( disclaimerText )
	self.disclaimerText = disclaimerText
	
	local codpointCostString = LUI.UIText.new()
	codpointCostString:setLeftRight( true, false, 421, 621 )
	codpointCostString:setTopBottom( true, false, 110.5, 135.5 )
	codpointCostString:setTTF( "fonts/default.ttf" )
	codpointCostString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	codpointCostString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	codpointCostString:linkToElementModel( self, "codpointcostString", true, function ( model )
		local codpointcostString = Engine.GetModelValue( model )
		if codpointcostString then
			codpointCostString:setText( Engine.Localize( codpointcostString ) )
		end
	end )
	self:addElement( codpointCostString )
	self.codpointCostString = codpointCostString
	
	local PurchasingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	PurchasingWidget:setLeftRight( true, false, 399, 705 )
	PurchasingWidget:setTopBottom( true, false, 115, 211 )
	PurchasingWidget:setAlpha( 0 )
	self:addElement( PurchasingWidget )
	self.PurchasingWidget = PurchasingWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				disclaimerText:completeAnimation()
				self.disclaimerText:setAlpha( 1 )
				self.clipFinished( disclaimerText, {} )

				codpointCostString:completeAnimation()
				self.codpointCostString:setAlpha( 1 )
				self.clipFinished( codpointCostString, {} )

				PurchasingWidget:completeAnimation()
				self.PurchasingWidget:setAlpha( 0 )
				self.clipFinished( PurchasingWidget, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
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
		local f22_local0 = self
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if not IsMenuModelValueEqualTo( f23_arg1, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( f23_arg2 ) and not IsPC() and not IsSelfInState( self, "Purchasing" ) then
			GoBackAndOpenStoreCodPointsOverlayOnParent( self, "ExtraSlotsCPStore", f23_arg2 )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if not IsMenuModelValueEqualTo( f24_arg1, "title", "MPUI_BM_NO_CURRENCY" ) and AreCodPointsEnabled( f24_arg2 ) and not IsPC() and not IsSelfInState( self, "Purchasing" ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			return false
		end
	end, false )
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
		element.BlackMarketCODPointContainerSmall:close()
		element.PurchasingWidget:close()
		element.categoryTypeImage:close()
		element.title:close()
		element.codpointCostString:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

