require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon" )

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
		local loadoutDatasource = Engine.GetModelValue( model )
		if loadoutDatasource then
			loadoutOptions:setDataSource( loadoutDatasource )
		end
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local f8_local0 = loadoutOptions
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:registerEventHandler( "input_source_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local f10_local0 = loadoutOptions
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "disabled", true, function ( model )
		local f11_local0 = loadoutOptions
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f12_local0 = loadoutOptions
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f13_local0 = loadoutOptions
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:linkToElementModel( loadoutOptions, "itemIndex", true, function ( model )
		local f14_local0 = loadoutOptions
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local f15_local0 = loadoutOptions
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	loadoutOptions:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	loadoutOptions:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( loadoutOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if FirstTimeSetup_Overview( controller ) then
			return true
		elseif FirstTimeSetup_ChangedCharacter( controller ) and IsGamepad( controller ) then
			return true
		elseif not IsGamepad( controller ) and FirstTimeSetup_ChangedCharacter( controller ) and not IsDisabled( element, controller ) and IsLive() then
			OpenUnlockClassItemDialog( menu, element, controller )
			FirstTimeSetup_SetComplete( controller )
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
		elseif FirstTimeSetup_ChangedCharacter( controller ) and IsGamepad( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif not IsGamepad( controller ) and FirstTimeSetup_ChangedCharacter( controller ) and not IsDisabled( element, controller ) and IsLive() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		elseif not IsDisabled( element, controller ) and IsLive() and FirstTimeSetup_Complete( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
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
		local _unlockDescription = Engine.GetModelValue( model )
		if _unlockDescription then
			unlockDescription:setText( Engine.Localize( _unlockDescription ) )
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
	
	loadoutItemDescription:linkToElementModel( loadoutOptions, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			loadoutItemDescription:setText( Engine.Localize( description ) )
		end
	end )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:linkToElementModel( loadoutOptions, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.loadOutItemName:setText( Engine.Localize( LocalizeToUpperString( name ) ) )
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
				local f28_local0 = IsPC()
				if f28_local0 then
					if not IsGamepad( controller ) then
						f28_local0 = not FirstTimeSetup_Overview( controller )
					else
						f28_local0 = false
					end
				end
				return f28_local0
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
		local f6_local13 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f6_local13( self, event )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FETitleNumBrdr0:close()
		element.loadoutOptions:close()
		element.WeaponNameWidget0:close()
		element.FETitleNumBrdr1:close()
		element.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:close()
		element.loadoutItemDescription:close()
		element.unlockDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

