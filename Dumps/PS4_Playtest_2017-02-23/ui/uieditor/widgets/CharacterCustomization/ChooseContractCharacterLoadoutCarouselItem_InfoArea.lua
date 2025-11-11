require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.ChooseContractCharacterLoadoutCarouselItem_InfoArea = InheritFrom( LUI.UIElement )
CoD.ChooseContractCharacterLoadoutCarouselItem_InfoArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseContractCharacterLoadoutCarouselItem_InfoArea )
	self.id = "ChooseContractCharacterLoadoutCarouselItem_InfoArea"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 750 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TempBackground = LUI.UIImage.new()
	TempBackground:setLeftRight( 0, 0, 15, 367 )
	TempBackground:setTopBottom( 0, 1, 17, -9 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
	local callsignLabel = LUI.UITightText.new()
	callsignLabel:setLeftRight( 0, 0, 52, 163 )
	callsignLabel:setTopBottom( 0, 0, 54, 84 )
	callsignLabel:setText( LocalizeToUpperString( "HEROES_CALLSIGN" ) )
	callsignLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel )
	self.callsignLabel = callsignLabel
	
	local loadoutItemDescription = LUI.UIText.new()
	loadoutItemDescription:setLeftRight( 0, 0, 51, 336 )
	loadoutItemDescription:setTopBottom( 0, 0, 508, 536 )
	loadoutItemDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( loadoutItemDescription )
	self.loadoutItemDescription = loadoutItemDescription
	
	local SelectText = nil
	if IsPC() then
		SelectText = LUI.UIText.new()
		SelectText:setLeftRight( 0, 0, 48, 348 )
		SelectText:setTopBottom( 0, 0, 250, 278 )
		SelectText:setAlpha( 0 )
		SelectText:setText( Engine.Localize( "MENU_SELECT" ) )
		SelectText:setTTF( "fonts/default.ttf" )
		SelectText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
		SelectText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
		self:addElement( SelectText )
		self.SelectText = SelectText
		
	else
		SelectText = LUI.UIElement.createFake()
		self.SelectText = SelectText
	end
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( 0, 0, 51, 345 )
	WeaponNameWidget0:setTopBottom( 0, 0, 90.5, 141.5 )
	WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( 0, 1, 15, -83 )
	FETitleNumBrdr1:setTopBottom( 0.5, 0.5, -358, 366 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local LeftBoxLine = LUI.UIImage.new()
	LeftBoxLine:setLeftRight( 0, 1, 28, -100 )
	LeftBoxLine:setTopBottom( 0, 0, 279, 285 )
	LeftBoxLine:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine )
	self.LeftBoxLine = LeftBoxLine
	
	local ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon.new( menu, controller )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setLeftRight( 0, 0, 51, 325 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setTopBottom( 0, 0, 465, 503 )
	self:addElement( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon )
	self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = ChooseCharacterLoadoutCarouselItemInfoAreaWeapon
	
	local loadoutOptions = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	loadoutOptions:makeFocusable()
	loadoutOptions:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CanSelectContractHeroItem( element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "PermanentUnlockRefund",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	loadoutOptions:linkToElementModel( loadoutOptions, "contractsRemaining", true, function ( model )
		menu:updateElementState( loadoutOptions, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractsRemaining"
		} )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "isActivated", true, function ( model )
		menu:updateElementState( loadoutOptions, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		} )
	end )
	loadoutOptions:setLeftRight( 0, 0, 44, 324 )
	loadoutOptions:setTopBottom( 0, 0, 307, 442 )
	loadoutOptions:setWidgetType( CoD.ChooseCharacter_LoadoutListItem )
	loadoutOptions:setHorizontalCount( 2 )
	loadoutOptions:setSpacing( 10 )
	loadoutOptions:linkToElementModel( self, "loadoutDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutOptions:setDataSource( modelValue )
		end
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, nil, true, function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "contractsRemaining", true, function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractsRemaining"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "isActivated", true, function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	loadoutOptions:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( loadoutOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not ItemIsBanned( menu, element, controller ) and not CharacterLoadoutDrafted( menu, element, controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) and CanSelfWidgetSelectContractHeroItem( self, controller ) then
			SelectHero( self, element, controller )
			HeroLoadoutChanged( self, element, controller )
			CharacterDraftLoadoutSelected( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
			ForceLobbyButtonUpdate( controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not ItemIsBanned( menu, element, controller ) and not CharacterLoadoutDrafted( menu, element, controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) and CanSelfWidgetSelectContractHeroItem( self, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( loadoutOptions )
	self.loadoutOptions = loadoutOptions
	
	local contractInfo = CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea.new( menu, controller )
	contractInfo:setLeftRight( 0, 0, 52, 336 )
	contractInfo:setTopBottom( 0, 0, 156, 250 )
	contractInfo:linkToElementModel( self, nil, false, function ( model )
		contractInfo:setModel( model, controller )
	end )
	self:addElement( contractInfo )
	self.contractInfo = contractInfo
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 0, 290, 90 )
	BMGoldBarMed:setTopBottom( 0, 0, 375, 375 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0, 0, 153, 222 )
	blackMarketBrandIcon:setTopBottom( 0, 0, 340, 409 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local blackMarketDesc = LUI.UIText.new()
	blackMarketDesc:setLeftRight( 0, 0, 51, 336 )
	blackMarketDesc:setTopBottom( 0, 0, 436, 464 )
	blackMarketDesc:setAlpha( 0 )
	blackMarketDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	blackMarketDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	blackMarketDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	blackMarketDesc:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			blackMarketDesc:setText( LocalizeIntoString( "MENU_ACQUIRE_X_IN_BLACK_MARKET", modelValue ) )
		end
	end )
	self:addElement( blackMarketDesc )
	self.blackMarketDesc = blackMarketDesc
	
	loadoutItemDescription:linkToElementModel( loadoutOptions, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutItemDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:linkToElementModel( loadoutOptions, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.loadOutItemName:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		loadoutOptions:completeAnimation()
		loadoutItemDescription:completeAnimation()
		ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		BMGoldBarMed:completeAnimation()
		blackMarketDesc:completeAnimation()
		SelectText:completeAnimation()
		loadoutOptions:setAlpha( 1 )
		loadoutItemDescription:setAlpha( 1 )
		ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 1 )
		blackMarketBrandIcon:setAlpha( 0 )
		BMGoldBarMed:setAlpha( 0 )
		blackMarketDesc:setAlpha( 0 )
		SelectText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				loadoutItemDescription:completeAnimation()
				self.loadoutItemDescription:setAlpha( 0 )
				self.clipFinished( loadoutItemDescription, {} )
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )
				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 0 )
				self.clipFinished( loadoutOptions, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.8 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0.8 )
				self.clipFinished( blackMarketBrandIcon, {} )
				blackMarketDesc:completeAnimation()
				self.blackMarketDesc:setAlpha( 1 )
				self.clipFinished( blackMarketDesc, {} )
			end
		},
		KeyboardAndMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 1 or 0 )
				SelectText:completeAnimation()
				self.SelectText:setAlpha( 1 )
				self.clipFinished( SelectText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return not CanSelectContractHeroItem( element, controller )
			end
		},
		{
			stateName = "KeyboardAndMouse",
			condition = function ( menu, element, event )
				local f26_local0 = IsPC()
				if f26_local0 then
					if not IsGamepad( controller ) then
						f26_local0 = not FirstTimeSetup_Overview( controller )
					else
						f26_local0 = false
					end
				end
				return f26_local0
			end
		}
	} )
	self:linkToElementModel( self, "contractsRemaining", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractsRemaining"
		} )
	end )
	self:linkToElementModel( self, "isActivated", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		} )
	end )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		} )
	end )
	loadoutOptions.id = "loadoutOptions"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.loadoutOptions:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WeaponNameWidget0:close()
		self.FETitleNumBrdr1:close()
		self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:close()
		self.loadoutOptions:close()
		self.contractInfo:close()
		self.BMGoldBarMed:close()
		self.loadoutItemDescription:close()
		self.blackMarketDesc:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

