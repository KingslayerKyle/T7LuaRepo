require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local PCSpecific = function ( self, controller )
	self.SelectText:registerEventHandler( "help_bubble_state_changed", function ( element, event )
		if IsGamepad( controller ) or string.find( event.state, "Overview" ) or string.find( event.state, "ChangedCharacter" ) then
			self:setState( "DefaultState" )
		else
			self:setState( "KeyboardAndMouse" )
		end
	end )
end

local PreLoadFunc = function ( self, controller )
	local isFirstTime = IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	if firstTimeFlowState == nil or firstTimeFlowState == CoD.PlayerRoleUtility.FirstTimeFlowState.None then
		if isFirstTime and not CharacterDraftActive() then
			FirstTimeSetup_SetOverview( controller )
		else
			FirstTimeSetup_SetNone( controller )
		end
	end
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		PCSpecific( self, controller )
	end
	if FirstTimeSetup_Overview( controller ) then
		self.loadoutOptions:makeNotFocusable()
		self.loadoutOptions:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
		local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
		self:subscribeToModel( firstTimeFlowStateModel, function ( model )
			if FirstTimeSetup_Overview( controller ) == false then
				self.loadoutOptions:makeFocusable()
				self.loadoutOptions:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
		end )
	end
end

CoD.ChooseCharacterLoadoutCarouselItem_InfoArea = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem_InfoArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_InfoArea )
	self.id = "ChooseCharacterLoadoutCarouselItem_InfoArea"
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
	loadoutItemDescription:setTopBottom( 0, 0, 481, 509 )
	loadoutItemDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( loadoutItemDescription )
	self.loadoutItemDescription = loadoutItemDescription
	
	local unlockDescription = LUI.UIText.new()
	unlockDescription:setLeftRight( 0, 0, 51, 345 )
	unlockDescription:setTopBottom( 0, 0, 150, 178 )
	unlockDescription:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	unlockDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	unlockDescription:linkToElementModel( self, "unlockDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			unlockDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( unlockDescription )
	self.unlockDescription = unlockDescription
	
	local SelectText = nil
	if IsPC() then
		SelectText = LUI.UIText.new()
		SelectText:setLeftRight( 0, 0, 48, 348 )
		SelectText:setTopBottom( 0, 0, 224, 252 )
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
	LeftBoxLine:setTopBottom( 0, 0, 252, 258 )
	LeftBoxLine:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine )
	self.LeftBoxLine = LeftBoxLine
	
	local ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon.new( menu, controller )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setLeftRight( 0, 0, 51, 325 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setTopBottom( 0, 0, 438, 476 )
	self:addElement( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon )
	self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = ChooseCharacterLoadoutCarouselItemInfoAreaWeapon
	
	local loadoutOptions = LUI.UIList.new( menu, controller, 15, 0, nil, false, false, 0, 0, false, false )
	loadoutOptions:makeFocusable()
	loadoutOptions:setLeftRight( 0, 0, 43, 328 )
	loadoutOptions:setTopBottom( 0, 0, 280, 415 )
	loadoutOptions:setWidgetType( CoD.ChooseCharacter_LoadoutListItem )
	loadoutOptions:setHorizontalCount( 2 )
	loadoutOptions:setSpacing( 15 )
	loadoutOptions:linkToElementModel( self, "loadoutDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutOptions:setDataSource( modelValue )
		end
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:registerEventHandler( "input_source_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "disabled", true, function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "itemIndex", true, function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
		if FirstTimeSetup_Overview( controller ) and not IsInPermanentUnlockMenu( controller ) then
			return true
		elseif FirstTimeSetup_ChangedCharacter( controller ) and IsGamepad( controller ) and not IsInPermanentUnlockMenu( controller ) then
			return true
		elseif not IsGamepad( controller ) and FirstTimeSetup_ChangedCharacter( controller ) and not IsDisabled( element, controller ) and IsLive() and not IsInPermanentUnlockMenu( controller ) and IsPC() then
			OpenUnlockClassItemDialog( menu, element, controller )
			FirstTimeSetup_SetComplete( controller )
			return true
		elseif not IsDisabled( element, controller ) and IsLive() and FirstTimeSetup_Complete( controller ) and not IsInPermanentUnlockMenu( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller, "", "" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not ItemIsBanned( menu, element, controller ) and not CharacterLoadoutDrafted( menu, element, controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SelectHero( self, element, controller )
			HeroLoadoutChanged( self, element, controller )
			CharacterDraftLoadoutSelected( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
			ForceLobbyButtonUpdate( controller )
			GoBack( self, controller )
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			OpenPermanentUnlockClassItemDialog( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FirstTimeSetup_Overview( controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		elseif FirstTimeSetup_ChangedCharacter( controller ) and IsGamepad( controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		elseif not IsGamepad( controller ) and FirstTimeSetup_ChangedCharacter( controller ) and not IsDisabled( element, controller ) and IsLive() and not IsInPermanentUnlockMenu( controller ) and IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		elseif not IsDisabled( element, controller ) and IsLive() and FirstTimeSetup_Complete( controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not ItemIsBanned( menu, element, controller ) and not CharacterLoadoutDrafted( menu, element, controller ) and not IsHeroLocked( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( loadoutOptions )
	self.loadoutOptions = loadoutOptions
	
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
		unlockDescription:completeAnimation()
		loadoutOptions:completeAnimation()
		loadoutItemDescription:completeAnimation()
		ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
		SelectText:completeAnimation()
		unlockDescription:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
		loadoutOptions:setAlpha( 1 )
		loadoutItemDescription:setAlpha( 1 )
		ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 1 )
		SelectText:setLeftRight( 0, 0, 48, 348 )
		SelectText:setTopBottom( 0, 0, 224, 252 )
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
				self:setupElementClipCounter( 4 )
				loadoutItemDescription:completeAnimation()
				self.loadoutItemDescription:setAlpha( 0 )
				self.clipFinished( loadoutItemDescription, {} )
				unlockDescription:completeAnimation()
				self.unlockDescription:setAlpha( ShowIfInPermanentUnlockMenu( 1 ) )
				self.clipFinished( unlockDescription, {} )
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )
				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 0 )
				self.clipFinished( loadoutOptions, {} )
			end
		},
		KeyboardAndMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 1 or 0 )
				SelectText:completeAnimation()
				self.SelectText:setLeftRight( 0, 0, 51, 351 )
				self.SelectText:setTopBottom( 0, 0, 224, 252 )
				self.SelectText:setAlpha( 1 )
				self.clipFinished( SelectText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "KeyboardAndMouse",
			condition = function ( menu, element, event )
				local f30_local0 = IsPC()
				if f30_local0 then
					if not IsGamepad( controller ) then
						f30_local0 = not FirstTimeSetup_Overview( controller )
					else
						f30_local0 = false
					end
				end
				return f30_local0
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
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
		self.loadoutItemDescription:close()
		self.unlockDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

