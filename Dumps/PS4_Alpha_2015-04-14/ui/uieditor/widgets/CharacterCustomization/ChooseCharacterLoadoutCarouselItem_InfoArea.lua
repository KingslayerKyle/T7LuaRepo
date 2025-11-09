require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

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
	TempBackground:setTopBottom( true, true, 11, -16 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	TempBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 0, 300 )
	LeftPanel:setTopBottom( true, false, 0, 500 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 34, -205 )
	FETitleNumBrdr0:setTopBottom( false, false, -220, -198 )
	FETitleNumBrdr0:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local callsignLabel = LUI.UITightText.new()
	callsignLabel:setLeftRight( true, false, 40, 114 )
	callsignLabel:setTopBottom( true, false, 32, 52 )
	callsignLabel:setRGB( 1, 0.46, 0 )
	callsignLabel:setText( Engine.Localize( LocalizeToUpperString( "HEROES_CALLSIGN" ) ) )
	callsignLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel )
	self.callsignLabel = callsignLabel
	
	local loadoutOptions = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, true )
	loadoutOptions:makeFocusable()
	loadoutOptions:setLeftRight( true, false, 29, 219 )
	loadoutOptions:setTopBottom( true, false, 186.5, 276.5 )
	loadoutOptions:setRGB( 1, 1, 1 )
	loadoutOptions:setWidgetType( CoD.ChooseCharacter_LoadoutListItem )
	loadoutOptions:setHorizontalCount( 2 )
	loadoutOptions:setSpacing( 10 )
	loadoutOptions:linkToElementModel( self, "loadoutDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutOptions:setDataSource( modelValue )
		end
	end )
	loadoutOptions.buttonPromptAddFunctions = {}
	loadoutOptions.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() and not IsDisabled( element, controller ) then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "A", element )
			return true
		else
			
		end
	end
	
	loadoutOptions:linkToElementModel( loadoutOptions, "disabled", true, function ( model )
		local element = loadoutOptions
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		if not element.buttonPromptAddFunctions.primary( menu, element, event ) then
			menu:removeButtonPrompt( "primary", element )
		end
	end )
	loadoutOptions:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if not IsDisabled( element, controller ) then
				
			else
				
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	loadoutOptions:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.primary( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	loadoutOptions:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "primary", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	loadoutOptions:updateButtonPromptEventHandlers()
	self:addElement( loadoutOptions )
	self.loadoutOptions = loadoutOptions
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, false, 33.69, 216.69 )
	BlackBox:setTopBottom( true, false, 292, 317.5 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.6 )
	BlackBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local loadOutItemName = LUI.UITightText.new()
	loadOutItemName:setLeftRight( true, false, 37, 147 )
	loadOutItemName:setTopBottom( true, false, 295, 317 )
	loadOutItemName:setRGB( 1, 1, 1 )
	loadOutItemName:setTTF( "fonts/Entovo.ttf" )
	self:addElement( loadOutItemName )
	self.loadOutItemName = loadOutItemName
	
	local loadoutItemDescription = LUI.UIText.new()
	loadoutItemDescription:setLeftRight( true, false, 34, 224 )
	loadoutItemDescription:setTopBottom( true, false, 320.5, 339.5 )
	loadoutItemDescription:setRGB( 1, 1, 1 )
	loadoutItemDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	loadoutItemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( loadoutItemDescription )
	self.loadoutItemDescription = loadoutItemDescription
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, false, 34, 230 )
	description:setTopBottom( true, false, 93, 112 )
	description:setRGB( 1, 1, 1 )
	description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 34, 230 )
	WeaponNameWidget0:setTopBottom( true, false, 56, 90 )
	WeaponNameWidget0:setRGB( 1, 1, 1 )
	WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 255, 291 )
	Image5:setTopBottom( false, false, -240, -236.5 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 255, 291 )
	Image0:setTopBottom( false, false, 232.25, 235.75 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 10, -55 )
	FETitleNumBrdr1:setTopBottom( false, false, -239, 234 )
	FETitleNumBrdr1:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local LeftBoxLine = LUI.UIImage.new()
	LeftBoxLine:setLeftRight( true, true, 19, -67 )
	LeftBoxLine:setTopBottom( true, false, 168, 172 )
	LeftBoxLine:setRGB( 1, 1, 1 )
	LeftBoxLine:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine )
	self.LeftBoxLine = LeftBoxLine
	
	loadOutItemName:linkToElementModel( loadoutOptions, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadOutItemName:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	loadoutItemDescription:linkToElementModel( loadoutOptions, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutItemDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	loadoutOptions.id = "loadoutOptions"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.loadoutOptions:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.LeftPanel:close()
		self.FETitleNumBrdr0:close()
		self.loadoutOptions:close()
		self.WeaponNameWidget0:close()
		self.FETitleNumBrdr1:close()
		self.loadOutItemName:close()
		self.loadoutItemDescription:close()
		self.description:close()
		CoD.ChooseCharacterLoadoutCarouselItem_InfoArea.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

