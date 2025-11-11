require( "ui.uieditor.menus.CharacterCustomization.PersonalizeCharacter" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble" )
require( "ui.uieditor.widgets.CharacterCustomization.chooseCharacterLoadoutBumper" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TalkersWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )

if IsPC() then
	require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelector" )
end
local PCSpecific = function ( self, controller )
	self:registerEventHandler( "mini_item_selected", function ( self, event )
		local charCarousel = self.characterCarousel
		if event.index then
			if not self.m_sync then
				self.m_sync = true
				self.characterCarousel:setActiveIndex( 1, event.index )
			else
				self.m_sync = nil
			end
		end
		if FirstTimeSetup_Overview( controller ) then
			FirstTimeSetup_SetChangedCharacter( controller )
		end
	end )
	self:registerEventHandler( "list_active_changed", function ( listItem, event )
		if event.list == self.characterCarousel then
			local activeWidget = event.list.activeWidget
			if activeWidget and activeWidget.heroIndex then
				if not self.m_sync then
					self.m_sync = true
					self.charMiniSelector:processEvent( {
						name = "sync_mini_selector",
						index = activeWidget.heroIndex + 1,
						controller = controller
					} )
				else
					self.m_sync = nil
				end
			end
		end
		return true
	end )
	self:registerEventHandler( "list_focus_changed", function ( self, event )
		local activeWidget = self.characterCarousel.activeWidget
		if not activeWidget then
			return 
		end
		activeWidget:setHandleMouseButton( false )
		local parent = activeWidget:getParent()
		local sibling = parent:getFirstChild()
		while sibling do
			if sibling ~= activeWidget then
				sibling:setFocus( false )
				sibling:setHandleMouseButton( true )
			end
			sibling = sibling:getNextSibling()
		end
	end )
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ()
		
	end
	
end

local PostLoadFunc = function ( self, controller )
	self.characterCarousel.m_disableNavigation = true
	if CursorInputEnabledForBuild() then
		PCSpecific( self, controller )
	end
	CoD.perController[controller].weaponCategory = "specialist"
	CoD.CACUtility.CreateUnlockTokenModels( controller )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( controller )
end

LUI.createMenu.ChooseCharacterLoadout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseCharacterLoadout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MP_SpecialistsAndScorestreaks"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseCharacterLoadout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BGblack = LUI.UIImage.new()
	BGblack:setLeftRight( 0, 1, 1920, -1920 )
	BGblack:setTopBottom( 0, 1, 0, 0 )
	BGblack:setRGB( 0, 0, 0 )
	BGblack:setAlpha( 0.45 )
	self:addElement( BGblack )
	self.BGblack = BGblack
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 0, 0, 1920 )
	GenericMenuFrame0:setTopBottom( 0, 0, 0, 1080 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( AppendString( "_CAPS", "HEROES_CHOOSE_HERO_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_CHOOSE_HERO_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( self, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 348, -344 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 153, -879 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local bumperBacking = LUI.UIImage.new()
	bumperBacking:setLeftRight( 0.5, 0.5, -612, 612 )
	bumperBacking:setTopBottom( 0, 0, 156, 200 )
	bumperBacking:setRGB( 0.22, 0.22, 0.22 )
	bumperBacking:setAlpha( 0 )
	self:addElement( bumperBacking )
	self.bumperBacking = bumperBacking
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -612, 612 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -400, -340 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, 348, 1572 )
	CategoryListLine0:setTopBottom( 0, 0, 133, 147 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local FETabIdle1 = LUI.UIImage.new()
	FETabIdle1:setLeftRight( 0, 0, 1491, 1572 )
	FETabIdle1:setTopBottom( 0, 0, 137, 202 )
	FETabIdle1:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle1:setShaderVector( 0, 0, 0, 0, 0 )
	FETabIdle1:setupNineSliceShader( 12, 12 )
	self:addElement( FETabIdle1 )
	self.FETabIdle1 = FETabIdle1
	
	local FETabIdle = LUI.UIImage.new()
	FETabIdle:setLeftRight( 0, 0, 348, 429 )
	FETabIdle:setTopBottom( 0, 0, 137, 202 )
	FETabIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle:setShaderVector( 0, 0, 0, 0, 0 )
	FETabIdle:setupNineSliceShader( 12, 12 )
	self:addElement( FETabIdle )
	self.FETabIdle = FETabIdle
	
	local FETabIdle0 = LUI.UIImage.new()
	FETabIdle0:setLeftRight( 0, 1, 429, -429 )
	FETabIdle0:setTopBottom( 0.5, 0.5, -403, -338 )
	FETabIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle0:setShaderVector( 0, 0, 0, 0, 0 )
	FETabIdle0:setupNineSliceShader( 12, 12 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( self, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 348, -348 )
	FETitleNumBrdr0:setTopBottom( 0.5, 0.5, -402, -340 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local rightBumper = CoD.chooseCharacterLoadoutBumper.new( self, controller )
	rightBumper:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtEnd( self, "characterCarousel", event )
			end
		}
	} )
	if rightBumper.m_eventHandlers.list_focus_changed then
		local currentEv = rightBumper.m_eventHandlers.list_focus_changed
		rightBumper:registerEventHandler( "list_focus_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		rightBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	rightBumper:setLeftRight( 0, 0, 1505, 1559 )
	rightBumper:setTopBottom( 0, 0, 151, 189 )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightBumper.chooseCharacterLoadoutBumperInternal0.button:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	local currentEv = CoD.chooseCharacterLoadoutBumper.new( self, controller )
	currentEv:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtStart( self, "characterCarousel", event )
			end
		}
	} )
	if currentEv.m_eventHandlers.list_focus_changed then
		local currentEv = currentEv.m_eventHandlers.list_focus_changed
		currentEv:registerEventHandler( "list_focus_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	currentEv:setLeftRight( 0, 0, 361, 415 )
	currentEv:setTopBottom( 0, 0, 151, 189 )
	currentEv:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.chooseCharacterLoadoutBumperInternal0.button:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( currentEv )
	self.leftBumper = currentEv
	
	local currentEv = LUI.UIImage.new()
	currentEv:setLeftRight( 0, 0, 287, 341 )
	currentEv:setTopBottom( 0.5, 0.5, -405, -400 )
	currentEv:setZRot( 180 )
	currentEv:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	currentEv:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( currentEv )
	self.Image0 = currentEv
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 287, 341 )
	Image1:setTopBottom( 0.5, 0.5, -343, -339 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 287, 341 )
	Image4:setTopBottom( 0.5, 0.5, 416, 420 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, 1579, 1633 )
	Image5:setTopBottom( 0.5, 0.5, 417, 422 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "CharacterSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 1584, 1638 )
	Image00:setTopBottom( 0.5, 0.5, -405, -400 )
	Image00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 1584, 1638 )
	Image10:setTopBottom( 0.5, 0.5, -343, -339 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( 1, 1, -543, -185 )
	UnlockTokensWidget:setTopBottom( 0, 0, 54, 120 )
	UnlockTokensWidget:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( 1, 1, -543, -121 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 54, 120 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local callsignLabel = LUI.UITightText.new()
	callsignLabel:setLeftRight( 0.5, 0.5, -75, 33 )
	callsignLabel:setTopBottom( 0.5, 0.5, -385, -355 )
	callsignLabel:setRGB( 0.66, 0.74, 0.75 )
	callsignLabel:setText( LocalizeToUpperString( "MENU_SPECIALISTS" ) )
	callsignLabel:setTTF( "fonts/escom.ttf" )
	callsignLabel:setLetterSpacing( 3.5 )
	callsignLabel:registerEventHandler( "input_source_changed", function ( element, event )
		local retVal = nil
		if IsPC() then
			HideIfUsingMouse( element, event )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	callsignLabel:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsPC() then
			HideIfUsingMouse( element, event )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( callsignLabel )
	self.callsignLabel = callsignLabel
	
	local charMiniSelector = nil
	if IsPC() then
		charMiniSelector = CoD.CharacterMiniSelector.new( self, controller )
		charMiniSelector:setLeftRight( 0.5, 0.5, -223, 227 )
		charMiniSelector:setTopBottom( 0, 0, 147.5, 192.5 )
		self:addElement( charMiniSelector )
		self.charMiniSelector = charMiniSelector
		
	else
		self.charMiniSelector = LUI.UIElement.createFake()
	end
	local characterCarousel = LUI.UIList.new( self, controller, 6, 200, nil, false, true, 232, 0, false, false )
	characterCarousel:makeFocusable()
	characterCarousel:setLeftRight( 0, 0, 58, 8894 )
	characterCarousel:setTopBottom( 0, 0, 205, 955 )
	characterCarousel:setWidgetType( CoD.ChooseCharacterLoadoutCarouselItem )
	characterCarousel:setHorizontalCount( 7 )
	characterCarousel:setSpacing( 6 )
	characterCarousel:setDataSource( "HeroesList" )
	characterCarousel:linkToElementModel( characterCarousel, "disabled", true, function ( model )
		local element = characterCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		local element = characterCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local element = characterCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:linkToElementModel( characterCarousel, "heroIndex", true, function ( model )
		local element = characterCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	characterCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateEditingHero( element, controller )
		UpdateElementState( self, "leftBumper", controller )
		UpdateElementState( self, "rightBumper", controller )
		PlaySoundSetSound( self, "navigate" )
		SetSpecialistAsOld( self, element, controller )
		return retVal
	end )
	characterCarousel:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return retVal
	end )
	characterCarousel:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		NavigateToNextHeroCard( menu, self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		NavigateToPreviousHeroCard( menu, self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and not PregameActive() and CharacterCustomization_IsEnabled( controller ) and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "DefaultState" ) and not IsInPermanentUnlockMenu( controller ) and CharacterHasAnyWeaponUnlocked( controller, element ) then
			NavigateToMenu( self, "PersonalizeCharacter", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) and not PregameActive() and CharacterCustomization_IsEnabled( controller ) and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "DefaultState" ) and not IsInPermanentUnlockMenu( controller ) and CharacterHasAnyWeaponUnlocked( controller, element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "I", function ( element, menu, controller, model )
		if IsElementInState( element, "DefaultState" ) and not IsDisabled( element, controller ) and not IsInPermanentUnlockMenu( controller ) and not FirstTimeSetup_IsActive( controller ) and not CharacterDraftActive() then
			SetElementState( self, element, controller, "Flipped" )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		elseif IsElementInState( element, "Flipped" ) and not IsDisabled( element, controller ) and not IsInPermanentUnlockMenu( controller ) and not FirstTimeSetup_IsActive( controller ) then
			SetElementState( self, element, controller, "DefaultState" )
			UpdateAllMenuButtonPrompts( menu, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "DefaultState" ) and not IsDisabled( element, controller ) and not IsInPermanentUnlockMenu( controller ) and not FirstTimeSetup_IsActive( controller ) and not CharacterDraftActive() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		elseif IsElementInState( element, "Flipped" ) and not IsDisabled( element, controller ) and not IsInPermanentUnlockMenu( controller ) and not FirstTimeSetup_IsActive( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsElementInState( element, "Flipped" ) then
			SetElementState( self, element, controller, "DefaultState" )
			UpdateAllMenuButtonPrompts( menu, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "Flipped" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( characterCarousel )
	self.characterCarousel = characterCarousel
	
	local ChooseCharacterHelpBubble = CoD.ChooseCharacter_HelpBubble.new( self, controller )
	ChooseCharacterHelpBubble:setLeftRight( 0, 0, 96, 362 )
	ChooseCharacterHelpBubble:setTopBottom( 0, 0, 140, 950 )
	self:addElement( ChooseCharacterHelpBubble )
	self.ChooseCharacterHelpBubble = ChooseCharacterHelpBubble
	
	local FETalkersWidget = CoD.FE_TalkersWidget.new( self, controller )
	FETalkersWidget:setLeftRight( 1, 1, -380.5, -95.5 )
	FETalkersWidget:setTopBottom( 0, 0, 132, 712 )
	self:addElement( FETalkersWidget )
	self.FETalkersWidget = FETalkersWidget
	
	characterCarousel.navigation = {
		left = FETalkersWidget,
		up = FETalkersWidget
	}
	FETalkersWidget.navigation = {
		right = characterCarousel,
		down = characterCarousel
	}
	self.resetProperties = function ()
		characterCarousel:completeAnimation()
		characterCarousel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local characterCarouselFrame2 = function ( characterCarousel, event )
					local characterCarouselFrame3 = function ( characterCarousel, event )
						if not event.interrupted then
							characterCarousel:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
						end
						characterCarousel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( characterCarousel, event )
						else
							characterCarousel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						characterCarouselFrame3( characterCarousel, event )
						return 
					else
						characterCarousel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						characterCarousel:registerEventHandler( "transition_complete_keyframe", characterCarouselFrame3 )
					end
				end
				
				characterCarousel:completeAnimation()
				self.characterCarousel:setAlpha( 0 )
				characterCarouselFrame2( characterCarousel, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetCharacterModeToSessionMode( self, element, controller, Enum.eModes.MODE_MULTIPLAYER )
		RefreshCharacterCustomization( self, element, controller )
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "cac3dTitleIntermediary0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "intro", controller )
		SetHeadingKickerTextToGameMode( "" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not CharacterDraftActive() and not FirstTimeSetup_IsActive( controller ) then
			ClearSavedHeroForEdits( controller )
			ClearSavedState( self, controller )
			PlaySoundSetSound( self, "menu_go_back" )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
			GoBack( self, controller )
			ForceLobbyButtonUpdate( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not CharacterDraftActive() and not FirstTimeSetup_IsActive( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if AlwaysFalse() then
			return true
		else
			return false
		end
	end, true )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	characterCarousel.id = "characterCarousel"
	FETalkersWidget.id = "FETalkersWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.characterCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame0:close()
		self.BoxButtonLrgIdle:close()
		self.FETitleNumBrdr0:close()
		self.rightBumper:close()
		self.leftBumper:close()
		self.FEMenuLeftGraphics:close()
		self.PregameTimerOverlay:close()
		self.UnlockTokensWidget:close()
		self.PermanentUnlockTokensWidget:close()
		self.charMiniSelector:close()
		self.characterCarousel:close()
		self.ChooseCharacterHelpBubble:close()
		self.FETalkersWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseCharacterLoadout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

