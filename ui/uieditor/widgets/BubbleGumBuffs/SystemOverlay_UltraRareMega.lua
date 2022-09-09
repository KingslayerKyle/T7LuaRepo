-- 381d585de541f94e6f0e33e77d87d783
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewVialPackDesc" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )

CoD.SystemOverlay_UltraRareMega = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_UltraRareMega.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_UltraRareMega )
	self.id = "SystemOverlay_UltraRareMega"
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
		local f7_local0 = optionsVertical
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsVertical:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f8_local0
	end )
	optionsVertical:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( optionsVertical, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsDisabled( f10_arg0, f10_arg2 ) then
			ProcessListAction( self, f10_arg0, f10_arg2 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f11_arg0, f11_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( optionsVertical, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if IsElementPropertyValue( f12_arg0, "showStoreButton", true ) then
			OpenCodPointsStore( self, f12_arg0, f12_arg2, "menuName", f12_arg1 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if IsElementPropertyValue( f13_arg0, "showStoreButton", true ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( optionsVertical )
	self.optionsVertical = optionsVertical
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( menu, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -226, -22 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 15, 45 )
	StartMenuCurrencyCounts:linkToElementModel( self, nil, false, function ( model )
		StartMenuCurrencyCounts:setModel( model, controller )
	end )
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
				local f17_local0 = IsLootReady( controller )
				if f17_local0 then
					f17_local0 = AreCodPointsEnabled( controller )
					if f17_local0 then
						f17_local0 = not IsSelfModelValueEqualTo( element, controller, "cost", 0 )
					end
				end
				return f17_local0
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
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownAllExceptCryptoKeys",
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
	StartMenuCurrencyCounts:linkToElementModel( StartMenuCurrencyCounts, "cost", true, function ( model )
		menu:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cost"
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
				return IsIntDvarNonZero( "loot_ld_urm_gobblegum_enabled" ) and not IsSelfModelValueEqualTo( element, controller, "cost", 0 )
			end
		},
		{
			stateName = "VisibleSaleActive",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "VisibleMegaBundle",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	MegaChewVialPackDesc0:linkToElementModel( MegaChewVialPackDesc0, "cost", true, function ( model )
		menu:updateElementState( MegaChewVialPackDesc0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cost"
		} )
	end )
	self:addElement( MegaChewVialPackDesc0 )
	self.MegaChewVialPackDesc0 = MegaChewVialPackDesc0
	
	local ProcessingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	ProcessingWidget:setLeftRight( true, false, 426.5, 732.5 )
	ProcessingWidget:setTopBottom( true, false, 132, 228 )
	ProcessingWidget:setAlpha( 0 )
	ProcessingWidget.PurchasingText:setText( Engine.Localize( "GROUPS_PROCESSING" ) )
	self:addElement( ProcessingWidget )
	self.ProcessingWidget = ProcessingWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ProcessingWidget:completeAnimation()
				self.ProcessingWidget:setAlpha( 0 )
				self.clipFinished( ProcessingWidget, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ProcessingWidget:completeAnimation()
				self.ProcessingWidget:setAlpha( 1 )
				self.clipFinished( ProcessingWidget, {} )
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
	optionsVertical.id = "optionsVertical"
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
		element.StartMenuCurrencyCounts:close()
		element.MegaChewVialPackDesc0:close()
		element.ProcessingWidget:close()
		element.largeImage:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
