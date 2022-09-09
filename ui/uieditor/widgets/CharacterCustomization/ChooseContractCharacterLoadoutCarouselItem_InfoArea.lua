-- 2f870dfe3c8f1facd4a61c711e127a8e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_ContractAmountWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_Character_NotActivated_Widget" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.BMContractsCharacterNotActivatedWidget:setHandleMouse( true )
	f2_arg0.BMContractsCharacterNotActivatedWidget:registerEventHandler( "mouse_left_click", function ( element, event )
		CoD.PCUtil.SimulateButtonPress( event.controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local1( self, controller, menu )
	end
end

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
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 15.5, 259.36 )
	background:setTopBottom( true, false, 16, 486.72 )
	background:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_innerframe" ) )
	self:addElement( background )
	self.background = background
	
	local loadoutItemDescription = LUI.UIText.new()
	loadoutItemDescription:setLeftRight( true, false, 41, 231 )
	loadoutItemDescription:setTopBottom( true, false, 315.5, 334.5 )
	loadoutItemDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( loadoutItemDescription )
	self.loadoutItemDescription = loadoutItemDescription
	
	local f5_local3 = nil
	if IsPC() then
		f5_local3 = LUI.UIText.new()
	else
		f5_local3 = LUI.UIElement.createFake()
	end
	f5_local3:setLeftRight( true, false, 30, 230 )
	f5_local3:setTopBottom( true, false, 152, 171 )
	f5_local3:setAlpha( 0 )
	f5_local3:setText( Engine.Localize( "MENU_SELECT" ) )
	f5_local3:setTTF( "fonts/default.ttf" )
	f5_local3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	f5_local3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	if IsPC() then
		self:addElement( f5_local3 )
	end
	self.SelectText = f5_local3
	
	local LeftBoxLine = LUI.UIImage.new()
	LeftBoxLine:setLeftRight( true, true, 28, -58 )
	LeftBoxLine:setTopBottom( true, false, 173, 177 )
	LeftBoxLine:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine )
	self.LeftBoxLine = LeftBoxLine
	
	local ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon.new( menu, controller )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setLeftRight( true, false, 37.69, 220.69 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setTopBottom( true, false, 291, 316.5 )
	self:addElement( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon )
	self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = ChooseCharacterLoadoutCarouselItemInfoAreaWeapon
	
	local loadoutOptions = LUI.UIList.new( menu, controller, 16, 0, nil, false, false, 0, 0, false, false )
	loadoutOptions:makeFocusable()
	loadoutOptions:setLeftRight( true, false, 35, 231 )
	loadoutOptions:setTopBottom( true, false, 191.5, 281.5 )
	loadoutOptions:setWidgetType( CoD.ChooseCharacter_LoadoutListItem )
	loadoutOptions:setHorizontalCount( 2 )
	loadoutOptions:setSpacing( 16 )
	loadoutOptions:linkToElementModel( self, "loadoutDatasource", true, function ( model )
		local loadoutDatasource = Engine.GetModelValue( model )
		if loadoutDatasource then
			loadoutOptions:setDataSource( loadoutDatasource )
		end
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, nil, true, function ( model )
		local f7_local0 = loadoutOptions
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local f8_local0 = loadoutOptions
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "isActivated", true, function ( model )
		local f9_local0 = loadoutOptions
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "contractsRemaining", true, function ( model )
		local f10_local0 = loadoutOptions
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractsRemaining"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	loadoutOptions:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( loadoutOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if not ItemIsBanned( f13_arg1, f13_arg0, f13_arg2 ) and not CharacterLoadoutDrafted( f13_arg1, f13_arg0, f13_arg2 ) and not IsHeroLocked( f13_arg0, f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) and CanSelfWidgetSelectContractHeroItem( self, f13_arg2 ) then
			HeroBlackjackOptionSelected( f13_arg0, f13_arg2 )
			SelectHero( self, f13_arg0, f13_arg2 )
			HeroLoadoutChanged( self, f13_arg0, f13_arg2 )
			CharacterDraftLoadoutSelected( self, f13_arg0, f13_arg2 )
			SendClientScriptMenuChangeNotify( f13_arg2, f13_arg1, false )
			SetPerControllerTableProperty( f13_arg2, "updateNewBreadcrumbs", true )
			ForceLobbyButtonUpdate( f13_arg2 )
			GoBack( self, f13_arg2 )
			return true
		elseif not ItemIsBanned( f13_arg1, f13_arg0, f13_arg2 ) and not CharacterLoadoutDrafted( f13_arg1, f13_arg0, f13_arg2 ) and not IsHeroLocked( f13_arg0, f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) and not CanSelfWidgetSelectContractHeroItem( self, f13_arg2 ) and CanSelfWidgetStartNewHeroContract( self, f13_arg2 ) then
			HeroBlackjackActivateContract( self, f13_arg0, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if not ItemIsBanned( f14_arg1, f14_arg0, f14_arg2 ) and not CharacterLoadoutDrafted( f14_arg1, f14_arg0, f14_arg2 ) and not IsHeroLocked( f14_arg0, f14_arg2 ) and not IsInPermanentUnlockMenu( f14_arg2 ) and CanSelfWidgetSelectContractHeroItem( self, f14_arg2 ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not ItemIsBanned( f14_arg1, f14_arg0, f14_arg2 ) and not CharacterLoadoutDrafted( f14_arg1, f14_arg0, f14_arg2 ) and not IsHeroLocked( f14_arg0, f14_arg2 ) and not IsInPermanentUnlockMenu( f14_arg2 ) and not CanSelfWidgetSelectContractHeroItem( self, f14_arg2 ) and CanSelfWidgetStartNewHeroContract( self, f14_arg2 ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_ACTIVATE" )
			return true
		else
			return false
		end
	end, false )
	loadoutOptions:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	self:addElement( loadoutOptions )
	self.loadoutOptions = loadoutOptions
	
	local contractInfo = CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea.new( menu, controller )
	contractInfo:setLeftRight( true, false, 42, 231 )
	contractInfo:setTopBottom( true, false, 97.5, 160.5 )
	contractInfo:linkToElementModel( self, nil, false, function ( model )
		contractInfo:setModel( model, controller )
	end )
	self:addElement( contractInfo )
	self.contractInfo = contractInfo
	
	local blackMarketDesc = LUI.UIText.new()
	blackMarketDesc:setLeftRight( true, false, 39, 229 )
	blackMarketDesc:setTopBottom( true, false, 217, 236 )
	blackMarketDesc:setAlpha( 0 )
	blackMarketDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	blackMarketDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	blackMarketDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	blackMarketDesc:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			blackMarketDesc:setText( LocalizeIntoString( "MENU_ACQUIRE_X_WITH_WEEKLY_CHALLENGES", name ) )
		end
	end )
	self:addElement( blackMarketDesc )
	self.blackMarketDesc = blackMarketDesc
	
	local ContractLabel = LUI.UIText.new()
	ContractLabel:setLeftRight( true, false, 50.93, 227.43 )
	ContractLabel:setTopBottom( true, false, 83.87, 103.87 )
	ContractLabel:setRGB( 0.46, 0.8, 0.75 )
	ContractLabel:setAlpha( 0 )
	ContractLabel:setText( Engine.Localize( "FEATURE_CONTRACTS" ) )
	ContractLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractLabel:setLetterSpacing( -0.5 )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractLabel )
	self.ContractLabel = ContractLabel
	
	local BMContractsContractAmountWidget = CoD.BM_Contracts_ContractAmountWidget.new( menu, controller )
	BMContractsContractAmountWidget:setLeftRight( true, false, 40.43, 231 )
	BMContractsContractAmountWidget:setTopBottom( true, false, 97.5, 177.5 )
	BMContractsContractAmountWidget:setAlpha( 0 )
	BMContractsContractAmountWidget.ContractBacking0:setAlpha( 1 )
	BMContractsContractAmountWidget:linkToElementModel( self, nil, false, function ( model )
		BMContractsContractAmountWidget:setModel( model, controller )
	end )
	BMContractsContractAmountWidget:mergeStateConditions( {
		{
			stateName = "None",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "contractsRemaining", 0 )
			end
		}
	} )
	BMContractsContractAmountWidget:linkToElementModel( BMContractsContractAmountWidget, "contractsRemaining", true, function ( model )
		menu:updateElementState( BMContractsContractAmountWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractsRemaining"
		} )
	end )
	self:addElement( BMContractsContractAmountWidget )
	self.BMContractsContractAmountWidget = BMContractsContractAmountWidget
	
	local Title = LUI.UIImage.new()
	Title:setLeftRight( true, false, 24.19, 160.19 )
	Title:setTopBottom( true, false, 35.75, 75.75 )
	Title:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_title" ) )
	self:addElement( Title )
	self.Title = Title
	
	local LeftBoxLine0 = LUI.UIImage.new()
	LeftBoxLine0:setLeftRight( true, true, 29, -57 )
	LeftBoxLine0:setTopBottom( true, false, 67, 71 )
	LeftBoxLine0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine0 )
	self.LeftBoxLine0 = LeftBoxLine0
	
	local BMContractsCharacterNotActivatedWidget = CoD.BM_Contracts_Character_NotActivated_Widget.new( menu, controller )
	BMContractsCharacterNotActivatedWidget:setLeftRight( true, false, 28, 236 )
	BMContractsCharacterNotActivatedWidget:setTopBottom( true, false, 193.81, 279.81 )
	BMContractsCharacterNotActivatedWidget:linkToElementModel( self, nil, false, function ( model )
		BMContractsCharacterNotActivatedWidget:setModel( model, controller )
	end )
	self:addElement( BMContractsCharacterNotActivatedWidget )
	self.BMContractsCharacterNotActivatedWidget = BMContractsCharacterNotActivatedWidget
	
	local BMContractsContractAmountWidget0 = CoD.BM_Contracts_ContractAmountWidget.new( menu, controller )
	BMContractsContractAmountWidget0:setLeftRight( true, false, 37.69, 236 )
	BMContractsContractAmountWidget0:setTopBottom( true, false, 409, 472 )
	self:addElement( BMContractsContractAmountWidget0 )
	self.BMContractsContractAmountWidget0 = BMContractsContractAmountWidget0
	
	loadoutItemDescription:linkToElementModel( loadoutOptions, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			loadoutItemDescription:setText( Engine.Localize( description ) )
		end
	end )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:linkToElementModel( loadoutOptions, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.loadOutItemName:setText( LocalizeToUpperString( name ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				loadoutItemDescription:completeAnimation()
				self.loadoutItemDescription:setAlpha( 1 )
				self.clipFinished( loadoutItemDescription, {} )

				f5_local3:completeAnimation()
				self.SelectText:setAlpha( 0 )
				self.clipFinished( f5_local3, {} )

				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 1 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )

				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 1 )
				self.clipFinished( loadoutOptions, {} )

				blackMarketDesc:completeAnimation()
				self.blackMarketDesc:setAlpha( 0 )
				self.clipFinished( blackMarketDesc, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				loadoutItemDescription:completeAnimation()
				self.loadoutItemDescription:setAlpha( 0 )
				self.clipFinished( loadoutItemDescription, {} )

				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )

				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 0 )
				self.clipFinished( loadoutOptions, {} )

				BMContractsCharacterNotActivatedWidget:completeAnimation()
				self.BMContractsCharacterNotActivatedWidget:setAlpha( 1 )
				self.clipFinished( BMContractsCharacterNotActivatedWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

				local f28_local0 = function ( f29_arg0, f29_arg1 )
					if not f29_arg1.interrupted then
						f29_arg0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
					end
					f29_arg0:setAlpha( 1 )
					if f29_arg1.interrupted then
						self.clipFinished( f29_arg0, f29_arg1 )
					else
						f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				loadoutItemDescription:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				loadoutItemDescription:setAlpha( 0 )
				loadoutItemDescription:registerEventHandler( "transition_complete_keyframe", f28_local0 )
				local f28_local1 = function ( f30_arg0, f30_arg1 )
					if not f30_arg1.interrupted then
						f30_arg0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
					end
					f30_arg0:setAlpha( 1 )
					if f30_arg1.interrupted then
						self.clipFinished( f30_arg0, f30_arg1 )
					else
						f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 0 )
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:registerEventHandler( "transition_complete_keyframe", f28_local1 )
				local loadoutOptionsFrame2 = function ( loadoutOptions, event )
					if not event.interrupted then
						loadoutOptions:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					loadoutOptions:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( loadoutOptions, event )
					else
						loadoutOptions:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 0 )
				loadoutOptionsFrame2( loadoutOptions, {} )
			end
		},
		KeyboardAndMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				loadoutItemDescription:completeAnimation()
				self.loadoutItemDescription:setAlpha( 1 )
				self.clipFinished( loadoutItemDescription, {} )

				f5_local3:completeAnimation()
				self.SelectText:setAlpha( 1 )
				self.clipFinished( f5_local3, {} )

				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 1 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )

				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 1 )
				self.clipFinished( loadoutOptions, {} )

				blackMarketDesc:completeAnimation()
				self.blackMarketDesc:setAlpha( 0 )
				self.clipFinished( blackMarketDesc, {} )
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
				local f34_local0 = IsPC()
				if f34_local0 then
					if not IsGamepad( controller ) then
						f34_local0 = not FirstTimeSetup_Overview( controller )
					else
						f34_local0 = false
					end
				end
				return f34_local0
			end
		}
	} )
	self:linkToElementModel( self, "isActivated", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		} )
	end )
	if self.m_eventHandlers.input_source_changed then
		local f5_local15 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f5_local15( element, event )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.loadoutOptions:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:close()
		element.loadoutOptions:close()
		element.contractInfo:close()
		element.BMContractsContractAmountWidget:close()
		element.BMContractsCharacterNotActivatedWidget:close()
		element.BMContractsContractAmountWidget0:close()
		element.loadoutItemDescription:close()
		element.blackMarketDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
