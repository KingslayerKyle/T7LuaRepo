-- c1b4680d4681496f1eb005814a62442f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.SelectText:registerEventHandler( "help_bubble_state_changed", function ( element, event )
		if IsGamepad( f1_arg1 ) or string.find( event.state, "Overview" ) or string.find( event.state, "ChangedCharacter" ) then
			f1_arg0:setState( "DefaultState" )
		else
			f1_arg0:setState( "KeyboardAndMouse" )
		end
	end )
end

local PreLoadFunc = function ( self, controller )
	local f3_local0 = IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )
	local f3_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ) )
	if f3_local1 == nil or f3_local1 == CoD.CCUtility.FirstTimeFlowState.None then
		if f3_local0 and not CharacterDraftActive() then
			FirstTimeSetup_SetOverview( controller )
		else
			FirstTimeSetup_SetNone( controller )
		end
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	if CoD.isPC then
		f0_local0( f4_arg0, f4_arg1 )
	end
	if FirstTimeSetup_Overview( f4_arg1 ) then
		f4_arg0.loadoutOptions:makeNotFocusable()
		f4_arg0.loadoutOptions:processEvent( {
			name = "lose_focus",
			controller = f4_arg1
		} )
		f4_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f4_arg1 ), "firstTimeFlowState" ), function ( model )
			if FirstTimeSetup_Overview( f4_arg1 ) == false then
				f4_arg0.loadoutOptions:makeFocusable()
				f4_arg0.loadoutOptions:processEvent( {
					name = "gain_focus",
					controller = f4_arg1
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
	
	local callsignLabel = LUI.UITightText.new()
	callsignLabel:setLeftRight( true, false, 35, 109 )
	callsignLabel:setTopBottom( true, false, 36, 56 )
	callsignLabel:setText( LocalizeToUpperString( "HEROES_CALLSIGN" ) )
	callsignLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel )
	self.callsignLabel = callsignLabel
	
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
	unlockDescription:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	unlockDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	unlockDescription:linkToElementModel( self, "unlockDescription", true, function ( model )
		local _unlockDescription = Engine.GetModelValue( model )
		if _unlockDescription then
			unlockDescription:setText( Engine.Localize( _unlockDescription ) )
		end
	end )
	self:addElement( unlockDescription )
	self.unlockDescription = unlockDescription
	
	local f6_local5 = nil
	if IsPC() then
		f6_local5 = LUI.UIText.new()
	else
		f6_local5 = LUI.UIElement.createFake()
	end
	f6_local5:setLeftRight( true, false, 32, 232 )
	f6_local5:setTopBottom( true, false, 149, 168 )
	f6_local5:setAlpha( 0 )
	f6_local5:setText( Engine.Localize( "MENU_SELECT" ) )
	f6_local5:setTTF( "fonts/default.ttf" )
	f6_local5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	f6_local5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	if IsPC() then
		self:addElement( f6_local5 )
	end
	self.SelectText = f6_local5
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 34, 230 )
	WeaponNameWidget0:setTopBottom( true, false, 60, 94 )
	WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
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
	
	local loadoutOptions = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	loadoutOptions:makeFocusable()
	loadoutOptions:setLeftRight( true, false, 29, 219 )
	loadoutOptions:setTopBottom( true, false, 186.5, 276.5 )
	loadoutOptions:setWidgetType( CoD.ChooseCharacter_LoadoutListItem )
	loadoutOptions:setHorizontalCount( 2 )
	loadoutOptions:setSpacing( 10 )
	loadoutOptions:linkToElementModel( self, "loadoutDatasource", true, function ( model )
		local loadoutDatasource = Engine.GetModelValue( model )
		if loadoutDatasource then
			loadoutOptions:setDataSource( loadoutDatasource )
		end
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local f10_local0 = loadoutOptions
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:registerEventHandler( "input_source_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local f12_local0 = loadoutOptions
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "disabled", true, function ( model )
		local f13_local0 = loadoutOptions
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f14_local0 = loadoutOptions
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f15_local0 = loadoutOptions
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "itemIndex", true, function ( model )
		local f16_local0 = loadoutOptions
		local f16_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f16_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, nil, true, function ( model )
		local f17_local0 = loadoutOptions
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local f18_local0 = loadoutOptions
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f19_local0
	end )
	loadoutOptions:registerEventHandler( "lose_focus", function ( element, event )
		local f20_local0 = nil
		if element.loseFocus then
			f20_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f20_local0 = element.super:loseFocus( event )
		end
		return f20_local0
	end )
	menu:AddButtonCallbackFunction( loadoutOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if FirstTimeSetup_Overview( f21_arg2 ) and not IsInPermanentUnlockMenu( f21_arg2 ) then
			return true
		elseif FirstTimeSetup_ChangedCharacter( f21_arg2 ) and IsGamepad( f21_arg2 ) and not IsInPermanentUnlockMenu( f21_arg2 ) then
			return true
		elseif not IsGamepad( f21_arg2 ) and FirstTimeSetup_ChangedCharacter( f21_arg2 ) and not IsDisabled( f21_arg0, f21_arg2 ) and IsLive() and not IsInPermanentUnlockMenu( f21_arg2 ) then
			OpenUnlockClassItemDialog( f21_arg1, f21_arg0, f21_arg2 )
			FirstTimeSetup_SetComplete( f21_arg2 )
			return true
		elseif not IsDisabled( f21_arg0, f21_arg2 ) and IsLive() and FirstTimeSetup_Complete( f21_arg2 ) and not IsInPermanentUnlockMenu( f21_arg2 ) then
			OpenUnlockClassItemDialog( f21_arg1, f21_arg0, f21_arg2 )
			return true
		elseif not IsCACItemLocked( f21_arg1, f21_arg0, f21_arg2 ) and not IsCACItemPurchased( f21_arg0, f21_arg2 ) and not IsCACHaveTokens( f21_arg2 ) and not IsHeroLocked( f21_arg0, f21_arg2 ) and not IsInPermanentUnlockMenu( f21_arg2 ) then
			SetUnlockConfirmationInfo( f21_arg0, f21_arg2 )
			OpenPopup( self, "OutOfUnlockTokens", f21_arg2, "", "" )
			return true
		elseif not IsCACItemLocked( f21_arg1, f21_arg0, f21_arg2 ) and not IsCACItemPurchased( f21_arg0, f21_arg2 ) and IsCACHaveTokens( f21_arg2 ) and not IsHeroLocked( f21_arg0, f21_arg2 ) and not IsInPermanentUnlockMenu( f21_arg2 ) then
			OpenUnlockClassItemDialog( f21_arg1, f21_arg0, f21_arg2 )
			return true
		elseif not IsCACItemLocked( f21_arg1, f21_arg0, f21_arg2 ) and IsCACItemPurchased( f21_arg0, f21_arg2 ) and not ItemIsBannedLobby( f21_arg1, f21_arg0, f21_arg2 ) and not CharacterLoadoutDrafted( f21_arg1, f21_arg0, f21_arg2 ) and not IsHeroLocked( f21_arg0, f21_arg2 ) and not IsInPermanentUnlockMenu( f21_arg2 ) then
			SelectHero( self, f21_arg0, f21_arg2 )
			HeroLoadoutChanged( self, f21_arg0, f21_arg2 )
			CharacterDraftLoadoutSelected( self, f21_arg0, f21_arg2 )
			SendClientScriptMenuChangeNotify( f21_arg2, f21_arg1, false )
			SetPerControllerTableProperty( f21_arg2, "updateNewBreadcrumbs", true )
			ForceLobbyButtonUpdate( f21_arg2 )
			GoBack( self, f21_arg2 )
			return true
		elseif IsInPermanentUnlockMenu( f21_arg2 ) and not IsPermanentlyUnlocked( f21_arg0, f21_arg2 ) and HavePermanentUnlockTokens( f21_arg2 ) then
			OpenPermanentUnlockClassItemDialog( f21_arg1, f21_arg0, f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if FirstTimeSetup_Overview( f22_arg2 ) and not IsInPermanentUnlockMenu( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif FirstTimeSetup_ChangedCharacter( f22_arg2 ) and IsGamepad( f22_arg2 ) and not IsInPermanentUnlockMenu( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif not IsGamepad( f22_arg2 ) and FirstTimeSetup_ChangedCharacter( f22_arg2 ) and not IsDisabled( f22_arg0, f22_arg2 ) and IsLive() and not IsInPermanentUnlockMenu( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif not IsDisabled( f22_arg0, f22_arg2 ) and IsLive() and FirstTimeSetup_Complete( f22_arg2 ) and not IsInPermanentUnlockMenu( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK" )
			return true
		elseif not IsCACItemLocked( f22_arg1, f22_arg0, f22_arg2 ) and not IsCACItemPurchased( f22_arg0, f22_arg2 ) and not IsCACHaveTokens( f22_arg2 ) and not IsHeroLocked( f22_arg0, f22_arg2 ) and not IsInPermanentUnlockMenu( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK" )
			return true
		elseif not IsCACItemLocked( f22_arg1, f22_arg0, f22_arg2 ) and not IsCACItemPurchased( f22_arg0, f22_arg2 ) and IsCACHaveTokens( f22_arg2 ) and not IsHeroLocked( f22_arg0, f22_arg2 ) and not IsInPermanentUnlockMenu( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNLOCK" )
			return true
		elseif not IsCACItemLocked( f22_arg1, f22_arg0, f22_arg2 ) and IsCACItemPurchased( f22_arg0, f22_arg2 ) and not ItemIsBannedLobby( f22_arg1, f22_arg0, f22_arg2 ) and not CharacterLoadoutDrafted( f22_arg1, f22_arg0, f22_arg2 ) and not IsHeroLocked( f22_arg0, f22_arg2 ) and not IsInPermanentUnlockMenu( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsInPermanentUnlockMenu( f22_arg2 ) and not IsPermanentlyUnlocked( f22_arg0, f22_arg2 ) and HavePermanentUnlockTokens( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( loadoutOptions )
	self.loadoutOptions = loadoutOptions
	
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

				unlockDescription:completeAnimation()
				self.unlockDescription:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( unlockDescription, {} )

				f6_local5:completeAnimation()
				self.SelectText:setAlpha( 0 )
				self.clipFinished( f6_local5, {} )

				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 1 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )

				loadoutOptions:completeAnimation()
				self.loadoutOptions:setAlpha( 1 )
				self.clipFinished( loadoutOptions, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )

				unlockDescription:completeAnimation()
				self.unlockDescription:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( unlockDescription, {} )

				f6_local5:completeAnimation()
				self.SelectText:setLeftRight( true, false, 34, 234 )
				self.SelectText:setTopBottom( true, false, 149, 168 )
				self.SelectText:setAlpha( 1 )
				self.clipFinished( f6_local5, {} )
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
				local f29_local0 = IsPC()
				if f29_local0 then
					if not IsGamepad( controller ) then
						f29_local0 = not FirstTimeSetup_Overview( controller )
					else
						f29_local0 = false
					end
				end
				return f29_local0
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
		local f6_local11 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f6_local11( element, event )
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
		element.WeaponNameWidget0:close()
		element.FETitleNumBrdr1:close()
		element.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:close()
		element.loadoutOptions:close()
		element.loadoutItemDescription:close()
		element.unlockDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
