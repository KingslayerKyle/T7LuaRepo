-- 115864425a85367bf961564587b16113
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BGB_PurchaseLiquidDiviniumWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewVialPackDesc" )
require( "ui.uieditor.widgets.ZMDiviniumLoopAnim.ZM_DiviniumAnimFill" )
require( "ui.uieditor.widgets.ZMPromotional.ZM_Promo_50percentoff" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BGB_PurchaseLiquidDiviniumWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.NotEnoughLD = false
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
end

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if controller == "HorizontalList" then
			CoD.SwapFocusableElements( controller, self.optionsVertical, self.optionsHorizontal )
		end
	end )
end

CoD.SystemOverlay_MegaChew = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_MegaChew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_MegaChew )
	self.id = "SystemOverlay_MegaChew"
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
	largeImage:setLeftRight( true, false, 62.5, 342.5 )
	largeImage:setTopBottom( true, false, 23, 303 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
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
	
	local optionsVertical = LUI.UIList.new( menu, controller, 3, 0, nil, true, false, 0, 0, false, false )
	optionsVertical:makeFocusable()
	optionsVertical:setLeftRight( true, false, 422, 1170 )
	optionsVertical:setTopBottom( true, false, 120, 257 )
	optionsVertical:setWidgetType( CoD.CACGenericButton )
	optionsVertical:setVerticalCount( 4 )
	optionsVertical:setSpacing( 3 )
	optionsVertical:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			optionsVertical:setDataSource( listDatasource )
		end
	end )
	optionsVertical:linkToElementModel( optionsVertical, "disabled", true, function ( model )
		local f10_local0 = optionsVertical
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsVertical:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f11_local0
	end )
	optionsVertical:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( optionsVertical, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if not IsDisabled( f13_arg0, f13_arg2 ) then
			ProcessListAction( self, f13_arg0, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f14_arg0, f14_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( optionsVertical, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "P", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if IsElementPropertyValue( f15_arg0, "showStoreButton", true ) then
			MegaChewOpenCodPointsStore( self, f15_arg0, f15_arg2, "menuName", f15_arg1 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if IsElementPropertyValue( f16_arg0, "showStoreButton", true ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( optionsVertical )
	self.optionsVertical = optionsVertical
	
	local optionsHorizontal = LUI.UIList.new( menu, controller, 15, 0, nil, false, false, 0, 0, false, false )
	optionsHorizontal:makeFocusable()
	optionsHorizontal:setLeftRight( true, false, 422, 1107 )
	optionsHorizontal:setTopBottom( true, false, 85, 275 )
	optionsHorizontal:setAlpha( 0 )
	optionsHorizontal:setWidgetType( CoD.BGB_PurchaseLiquidDiviniumWidget )
	optionsHorizontal:setHorizontalCount( 4 )
	optionsHorizontal:setSpacing( 15 )
	optionsHorizontal:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			optionsHorizontal:setDataSource( listDatasource )
		end
	end )
	optionsHorizontal:linkToElementModel( optionsHorizontal, "disabled", true, function ( model )
		local f18_local0 = optionsHorizontal
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsHorizontal:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f19_local0 = nil
		UpdateMenuVialModel( self, element, controller )
		return f19_local0
	end )
	optionsHorizontal:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f20_local0
	end )
	optionsHorizontal:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	menu:AddButtonCallbackFunction( optionsHorizontal, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if not IsDisabled( f22_arg0, f22_arg2 ) then
			ProcessListAction( self, f22_arg0, f22_arg2 )
			return true
		else
			
		end
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f23_arg0, f23_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( optionsHorizontal, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if IsElementPropertyValue( f24_arg0, "showStoreButton", true ) then
			MegaChewOpenCodPointsStore( self, f24_arg0, f24_arg2, "menuName", f24_arg1 )
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		if IsElementPropertyValue( f25_arg0, "showStoreButton", true ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( optionsHorizontal )
	self.optionsHorizontal = optionsHorizontal
	
	local SupplyDropText = LUI.UIText.new()
	SupplyDropText:setLeftRight( true, false, 76, 276 )
	SupplyDropText:setTopBottom( true, false, 266, 294 )
	SupplyDropText:setAlpha( 0 )
	SupplyDropText:setText( Engine.Localize( "MPUI_BM_SUPPLY_DROP" ) )
	SupplyDropText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SupplyDropText )
	self.SupplyDropText = SupplyDropText
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( menu, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -226, -22 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 15, 45 )
	StartMenuCurrencyCounts:mergeStateConditions( {
		{
			stateName = "ShowKeysAndVials",
			condition = function ( menu, element, event )
				local f26_local0 = IsLootReady( controller )
				if f26_local0 then
					if not AreCodPointsEnabled( controller ) then
						f26_local0 = IsKeysForVialsOfferActive( controller )
					else
						f26_local0 = false
					end
				end
				return f26_local0
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsLootReady( controller ) and IsKeysForVialsOfferActive( controller )
			end
		},
		{
			stateName = "ShownOnlyCODPoints",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyKeys",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownAllExceptVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyVials",
			condition = function ( menu, element, event )
				return ShouldOnlyShowVials( menu, controller )
			end
		}
	} )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local MegaChewVialPackDesc0 = CoD.MegaChewVialPackDesc.new( menu, controller )
	MegaChewVialPackDesc0:setLeftRight( false, false, -661.5, -213.5 )
	MegaChewVialPackDesc0:setTopBottom( true, false, 219.4, 273 )
	MegaChewVialPackDesc0:linkToElementModel( self, nil, false, function ( model )
		MegaChewVialPackDesc0:setModel( model, controller )
	end )
	MegaChewVialPackDesc0:mergeStateConditions( {
		{
			stateName = "VisibleUltraRareMegaTimer",
			condition = function ( menu, element, event )
				return IsIntDvarNonZero( "loot_ld_urm_gobblegum_enabled" ) and IsSelfModelValueEqualTo( element, controller, "vials", 0 )
			end
		},
		{
			stateName = "VisibleUltraRareMega",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "VisibleSaleActive",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumSaleActive( controller ) and IsSelfModelValueGreaterThan( element, controller, "vials", 0 )
			end
		},
		{
			stateName = "VisibleMegaBundle",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumMegaBundleActive( controller ) and IsSelfModelValueEqualTo( element, controller, "vials", 100 )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "vials", 0 )
			end
		}
	} )
	MegaChewVialPackDesc0:linkToElementModel( MegaChewVialPackDesc0, "vials", true, function ( model )
		menu:updateElementState( MegaChewVialPackDesc0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vials"
		} )
	end )
	MegaChewVialPackDesc0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( MegaChewVialPackDesc0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:addElement( MegaChewVialPackDesc0 )
	self.MegaChewVialPackDesc0 = MegaChewVialPackDesc0
	
	local ZMDiviniumAnimFill = CoD.ZM_DiviniumAnimFill.new( menu, controller )
	ZMDiviniumAnimFill:setLeftRight( true, false, 432, 932 )
	ZMDiviniumAnimFill:setTopBottom( true, false, 146.2, 246.2 )
	ZMDiviniumAnimFill:setAlpha( 0 )
	self:addElement( ZMDiviniumAnimFill )
	self.ZMDiviniumAnimFill = ZMDiviniumAnimFill
	
	local ZMPromo50percentoff = CoD.ZM_Promo_50percentoff.new( menu, controller )
	ZMPromo50percentoff:setLeftRight( true, false, 26.5, 384 )
	ZMPromo50percentoff:setTopBottom( true, false, 182.2, 219.4 )
	ZMPromo50percentoff:linkToElementModel( self, nil, false, function ( model )
		ZMPromo50percentoff:setModel( model, controller )
	end )
	ZMPromo50percentoff:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "vials", 0 ) and IsLiquidDiviniumSaleActive( controller )
			end
		}
	} )
	ZMPromo50percentoff:linkToElementModel( ZMPromo50percentoff, "vials", true, function ( model )
		menu:updateElementState( ZMPromo50percentoff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vials"
		} )
	end )
	ZMPromo50percentoff:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( ZMPromo50percentoff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:addElement( ZMPromo50percentoff )
	self.ZMPromo50percentoff = ZMPromo50percentoff
	
	optionsVertical.navigation = {
		up = optionsHorizontal
	}
	optionsHorizontal.navigation = {
		down = optionsVertical
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HorizontalList = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				optionsVertical:completeAnimation()
				self.optionsVertical:setAlpha( 0 )
				self.clipFinished( optionsVertical, {} )
				optionsHorizontal:completeAnimation()
				self.optionsHorizontal:setLeftRight( true, false, 422, 947 )
				self.optionsHorizontal:setTopBottom( true, false, 85, 275 )
				self.optionsHorizontal:setAlpha( 1 )
				self.clipFinished( optionsHorizontal, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMDiviniumAnimFill:completeAnimation()
				self.ZMDiviniumAnimFill:setAlpha( 1 )
				self.clipFinished( ZMDiviniumAnimFill, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HorizontalList",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "PurchaseVials" )
			end
		},
		{
			stateName = "Purchasing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	optionsVertical.id = "optionsVertical"
	optionsHorizontal.id = "optionsHorizontal"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.optionsVertical:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.optionsVertical:close()
		element.optionsHorizontal:close()
		element.StartMenuCurrencyCounts:close()
		element.MegaChewVialPackDesc0:close()
		element.ZMDiviniumAnimFill:close()
		element.ZMPromo50percentoff:close()
		element.largeImage:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

