require( "ui.uieditor.widgets.BubbleGumBuffs.BGB_PurchasingVials" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

if IsOrbis() or IsDurango() then
	require( "ui.uieditor.menus.Store.Store_CodPoints" )
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
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 456, 72 )
	largeImage:setTopBottom( 0, 0, 52, 436 )
	largeImage:setImage( RegisterImage( "uie_t7_hud_zm_vial_256" ) )
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
	options:setLeftRight( 0, 0, 319, 1441 )
	options:setTopBottom( 0, 0, 181, 385 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 4 )
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
	
	local SupplyDropText = LUI.UIText.new()
	SupplyDropText:setLeftRight( 0, 0, 114, 414 )
	SupplyDropText:setTopBottom( 0, 0, 399, 441 )
	SupplyDropText:setAlpha( 0 )
	SupplyDropText:setText( Engine.Localize( "MPUI_BM_SUPPLY_DROP" ) )
	SupplyDropText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SupplyDropText )
	self.SupplyDropText = SupplyDropText
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( menu, controller )
	StartMenuCurrencyCounts:mergeStateConditions( {
		{
			stateName = "ShowKeysAndVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	StartMenuCurrencyCounts:setLeftRight( 1, 1, -339, -33 )
	StartMenuCurrencyCounts:setTopBottom( 0, 0, 22.5, 67.5 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local xNUM = LUI.UIText.new()
	xNUM:setLeftRight( 0, 0, 394, 598 )
	xNUM:setTopBottom( 0, 0, 319, 436 )
	xNUM:setTTF( "fonts/default.ttf" )
	xNUM:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	xNUM:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	xNUM:linkToElementModel( self, "vials", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			xNUM:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	xNUM:linkToElementModel( self, "vials", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			xNUM:setText( LocalizeIntoString( "MENU_MULTIPLIER_X", modelValue ) )
		end
	end )
	self:addElement( xNUM )
	self.xNUM = xNUM
	
	local BGBPurchasingVials = CoD.BGB_PurchasingVials.new( menu, controller )
	BGBPurchasingVials:setLeftRight( 0, 0, 631, 1381 )
	BGBPurchasingVials:setTopBottom( 0, 0, 148, 298 )
	BGBPurchasingVials:setAlpha( 0 )
	self:addElement( BGBPurchasingVials )
	self.BGBPurchasingVials = BGBPurchasingVials
	
	self.resetProperties = function ()
		BGBPurchasingVials:completeAnimation()
		BGBPurchasingVials:setAlpha( 0 )
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
				self:setupElementClipCounter( 1 )
				BGBPurchasingVials:completeAnimation()
				self.BGBPurchasingVials:setAlpha( 1 )
				self.clipFinished( BGBPurchasingVials, {} )
			end
		}
	}
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsPC() then
			OpenOverlay( self, "Store_CodPoints", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPC() then
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
		self.StartMenuCurrencyCounts:close()
		self.BGBPurchasingVials:close()
		self.categoryTypeImage:close()
		self.title:close()
		self.xNUM:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

