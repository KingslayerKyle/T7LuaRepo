require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon" )

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
	if firstTimeFlowState == nil or firstTimeFlowState == CoD.CCUtility.FirstTimeFlowState.None then
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
	self:setUseStencil( true )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_InfoArea )
	self.id = "ChooseCharacterLoadoutCarouselItem_InfoArea"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TempBackground = LUI.UIImage.new()
	TempBackground:setLeftRight( true, false, 10, 245 )
	TempBackground:setTopBottom( true, true, 11, -6 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 0, 300 )
	LeftPanel:setTopBottom( true, false, 0, 500 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 34, -205 )
	FETitleNumBrdr0:setTopBottom( false, false, -220, -198 )
	FETitleNumBrdr0:setAlpha( 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local callsignLabel = LUI.UITightText.new()
	callsignLabel:setLeftRight( true, false, 35, 109 )
	callsignLabel:setTopBottom( true, false, 36, 56 )
	callsignLabel:setText( Engine.Localize( LocalizeToUpperString( "HEROES_CALLSIGN" ) ) )
	callsignLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel )
	self.callsignLabel = callsignLabel
	
	local loadoutOptions = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	loadoutOptions:makeFocusable()
	loadoutOptions:setLeftRight( true, false, 29, 219 )
	loadoutOptions:setTopBottom( true, false, 186.5, 276.5 )
	loadoutOptions:setWidgetType( CoD.ChooseCharacter_LoadoutListItem )
	loadoutOptions:setHorizontalCount( 2 )
	loadoutOptions:setSpacing( 10 )
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
	loadoutOptions:linkToElementModel( "disabled", true, function ( model )
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
	loadoutOptions:linkToElementModel( "itemIndex", true, function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
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
	menu:AddButtonCallbackFunction( loadoutOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if FirstTimeSetup_Overview( controller ) then
			return true
		elseif FirstTimeSetup_ChangedCharacter( controller ) then
			return true
		elseif not IsDisabled( element, controller ) and IsLive() and FirstTimeSetup_Complete( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not ItemIsBanned( menu, element, controller ) and not CharacterLoadoutDrafted( menu, element, controller ) and not IsHeroLocked( element, controller ) then
			SelectHero( self, element, controller )
			HeroLoadoutChanged( self, element, controller )
			CharacterDraftLoadoutSelected( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FirstTimeSetup_Overview( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif FirstTimeSetup_ChangedCharacter( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif not IsDisabled( element, controller ) and IsLive() and FirstTimeSetup_Complete( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsHeroLocked( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not ItemIsBanned( menu, element, controller ) and not CharacterLoadoutDrafted( menu, element, controller ) and not IsHeroLocked( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( loadoutOptions )
	self.loadoutOptions = loadoutOptions
	
	local loadoutItemDescription = LUI.UIText.new()
	loadoutItemDescription:setLeftRight( true, false, 34, 224 )
	loadoutItemDescription:setTopBottom( true, false, 320.5, 339.5 )
	loadoutItemDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( loadoutItemDescription )
	self.loadoutItemDescription = loadoutItemDescription
	
	local unlockDescription = LUI.UIText.new()
	unlockDescription:setLeftRight( true, false, 34, 230 )
	unlockDescription:setTopBottom( true, false, 100, 119 )
	unlockDescription:setAlpha( 0 )
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
	
	local SelectText = LUI.UIText.new()
	SelectText:setLeftRight( true, false, 32, 232 )
	SelectText:setTopBottom( true, false, 149, 168 )
	SelectText:setAlpha( 0 )
	SelectText:setText( Engine.Localize( "MENU_SELECT" ) )
	SelectText:setTTF( "fonts/default.ttf" )
	SelectText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SelectText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SelectText )
	self.SelectText = SelectText
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 34, 230 )
	WeaponNameWidget0:setTopBottom( true, false, 60, 94 )
	WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 10, -55 )
	FETitleNumBrdr1:setTopBottom( false, false, -239, 244 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local LeftBoxLine = LUI.UIImage.new()
	LeftBoxLine:setLeftRight( true, true, 19, -67 )
	LeftBoxLine:setTopBottom( true, false, 168, 172 )
	LeftBoxLine:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine )
	self.LeftBoxLine = LeftBoxLine
	
	local ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon.new( menu, controller )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setLeftRight( true, false, 33.69, 216.69 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setTopBottom( true, false, 292, 317.5 )
	self:addElement( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon )
	self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = ChooseCharacterLoadoutCarouselItemInfoAreaWeapon
	
	loadoutItemDescription:linkToElementModel( loadoutOptions, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutItemDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:linkToElementModel( loadoutOptions, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.loadOutItemName:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 1 )
				self.clipFinished( loadoutOptions, {} )
				loadoutItemDescription:completeAnimation()
				self.loadoutItemDescription:setAlpha( 1 )
				self.clipFinished( loadoutItemDescription, {} )
				unlockDescription:completeAnimation()
				self.unlockDescription:setAlpha( 0 )
				self.clipFinished( unlockDescription, {} )
				SelectText:completeAnimation()
				self.SelectText:setAlpha( 0 )
				self.clipFinished( SelectText, {} )
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 1 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 0 )
				self.clipFinished( loadoutOptions, {} )
				loadoutItemDescription:completeAnimation()
				self.loadoutItemDescription:setAlpha( 0 )
				self.clipFinished( loadoutItemDescription, {} )
				unlockDescription:completeAnimation()
				self.unlockDescription:setAlpha( 1 )
				self.clipFinished( unlockDescription, {} )
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )
			end
		},
		KeyboardAndMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				unlockDescription:completeAnimation()
				self.unlockDescription:setAlpha( 0 )
				self.clipFinished( unlockDescription, {} )
				SelectText:completeAnimation()
				self.SelectText:setLeftRight( true, false, 34, 234 )
				self.SelectText:setTopBottom( true, false, 149, 168 )
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
				local f26_local0 = IsPC()
				if f26_local0 then
					if not IsGamepad( controller ) then
						f26_local0 = not IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )
					else
						f26_local0 = false
					end
				end
				return f26_local0
			end
		}
	} )
	self:linkToElementModel( "disabled", true, function ( model )
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
	loadoutOptions.id = "loadoutOptions"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.loadoutOptions:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FETitleNumBrdr0:close()
		self.loadoutOptions:close()
		self.WeaponNameWidget0:close()
		self.FETitleNumBrdr1:close()
		self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:close()
		self.loadoutItemDescription:close()
		self.unlockDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

