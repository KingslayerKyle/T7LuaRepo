-- 4e13d66602133af012161ace1280491f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_TabBar" )
require( "ui.uieditor.menus.CharacterCustomization.PersonalizeCharacter" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TalkersWidget" )
require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelector" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.characterCarousel.activeWidget
	if f1_local0 and f1_local0.carouselPos then
		f1_arg0.charMiniSelector.characterGrid:setActiveIndex( 1, f1_local0.carouselPos )
	end
	f1_arg0:registerEventHandler( "mini_item_selected", function ( element, event )
		if FirstTimeSetup_Overview( f1_arg1 ) then
			FirstTimeSetup_SetChangedCharacter( f1_arg1 )
		end
		local f2_local0 = element.characterCarousel
		if event.index then
			if not element.m_sync then
				element.m_sync = true
				element.characterCarousel:setActiveIndex( 1, event.index )
			else
				element.m_sync = nil
			end
		end
	end )
	f1_arg0:registerEventHandler( "list_active_changed", function ( element, event )
		if event.list == f1_arg0.characterCarousel then
			local f3_local0 = event.list.activeWidget
			if f3_local0 and f3_local0.carouselPos then
				if not f1_arg0.m_sync then
					f1_arg0.m_sync = true
					f1_arg0.charMiniSelector:processEvent( {
						name = "sync_mini_selector",
						index = f3_local0.carouselPos,
						controller = f1_arg1
					} )
				else
					f1_arg0.m_sync = nil
				end
			end
		end
		return true
	end )
	f1_arg0:registerEventHandler( "list_focus_changed", function ( element, event )
		local f4_local0 = element.characterCarousel.activeWidget
		if not f4_local0 then
			return 
		end
		f4_local0:setHandleMouseButton( false )
		local f4_local1 = f4_local0:getParent()
		local f4_local2 = f4_local1:getFirstChild()
		while f4_local2 do
			if f4_local2 ~= f4_local0 then
				f4_local2:setFocus( false )
				f4_local2:setHandleMouseButton( true )
				if f4_local2.currentState == "Flipped" then
					f4_local2:setState( "DefaultState", true )
				end
			end
			f4_local2 = f4_local2:getNextSibling()
		end
	end )
	f1_arg0:processEvent( {
		name = "list_focus_changed",
		controller = f1_arg1
	} )
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ()
		
	end
	
	CheckGCCatchUp()
end

local PostLoadFunc = function ( f7_arg0, f7_arg1 )
	f7_arg0.characterCarousel.m_disableNavigation = true
	if CoD.isPC then
		f0_local0( f7_arg0, f7_arg1 )
	end
	CoD.perController[f7_arg1].weaponCategory = "specialist"
	CoD.CACUtility.CreateUnlockTokenModels( f7_arg1 )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f7_arg1 )
end

LUI.createMenu.ChooseCharacterLoadout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseCharacterLoadout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MP_SpecialistsAndScorestreaks"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseCharacterLoadout.buttonPrompts" )
	local f8_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BGblack = LUI.UIImage.new()
	BGblack:setLeftRight( true, true, 1280, -1280 )
	BGblack:setTopBottom( true, true, 0, 0 )
	BGblack:setRGB( 0, 0, 0 )
	BGblack:setAlpha( 0.45 )
	self:addElement( BGblack )
	self.BGblack = BGblack
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f8_local1, controller )
	GenericMenuFrame0:setLeftRight( true, false, 0, 1280 )
	GenericMenuFrame0:setTopBottom( true, false, 0, 720 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( AppendString( "_CAPS", "HEROES_CHOOSE_HERO_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_CHOOSE_HERO_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local bumperBacking = LUI.UIImage.new()
	bumperBacking:setLeftRight( false, false, -408, 408 )
	bumperBacking:setTopBottom( true, false, 104, 133 )
	bumperBacking:setRGB( 0.22, 0.22, 0.22 )
	bumperBacking:setAlpha( 0 )
	self:addElement( bumperBacking )
	self.bumperBacking = bumperBacking
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 191, 227 )
	Image0:setTopBottom( false, false, -269.75, -266.25 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 191, 227 )
	Image1:setTopBottom( false, false, -229, -226 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 191, 227 )
	Image4:setTopBottom( false, false, 277.5, 280.5 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 1053, 1089 )
	Image5:setTopBottom( false, false, 278, 281.5 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f8_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f8_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "CharacterSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f8_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 1056, 1092 )
	Image00:setTopBottom( false, false, -269.75, -266.25 )
	Image00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 1056, 1092 )
	Image10:setTopBottom( false, false, -229, -226 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( f8_local1, controller )
	UnlockTokensWidget:setLeftRight( false, true, -362, -123 )
	UnlockTokensWidget:setTopBottom( true, false, 36, 80 )
	UnlockTokensWidget:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( f8_local1, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -362, -81 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 36, 80 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local ChooseCharacterTabBar = CoD.ChooseCharacter_TabBar.new( f8_local1, controller )
	ChooseCharacterTabBar:setLeftRight( true, false, 232, 1048 )
	ChooseCharacterTabBar:setTopBottom( true, false, 91.25, 134.5 )
	self:addElement( ChooseCharacterTabBar )
	self.ChooseCharacterTabBar = ChooseCharacterTabBar
	
	local characterCarousel = LUI.UIList.new( f8_local1, controller, 4, 200, nil, false, true, 232, 0, false, false )
	characterCarousel:makeFocusable()
	characterCarousel:setLeftRight( true, true, 0, 0 )
	characterCarousel:setTopBottom( true, false, 136.75, 636.75 )
	characterCarousel:setWidgetType( CoD.ChooseCharacterLoadoutCarouselItem )
	characterCarousel:setHorizontalCount( 7 )
	characterCarousel:setSpacing( 4 )
	characterCarousel:setDataSource( "HeroesList" )
	characterCarousel:linkToElementModel( characterCarousel, "disabled", true, function ( model )
		local f11_local0 = characterCarousel
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f11_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		local f12_local0 = characterCarousel
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f12_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local f13_local0 = characterCarousel
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f13_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:linkToElementModel( characterCarousel, "heroIndex", true, function ( model )
		local f14_local0 = characterCarousel
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroIndex"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	characterCarousel:linkToElementModel( characterCarousel, nil, true, function ( model )
		local f15_local0 = characterCarousel
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	characterCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f16_local0 = nil
		UpdateEditingHero( element, controller )
		UpdateElementState( self, "leftBumper", controller )
		UpdateElementState( self, "rightBumper", controller )
		PlaySoundSetSound( self, "navigate" )
		SetSpecialistAsOld( self, element, controller )
		return f16_local0
	end )
	characterCarousel:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f17_local0
	end )
	characterCarousel:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	f8_local1:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsRepeatButtonPress( f19_arg3 ) then
			NavigateToNextHeroCard( f19_arg1, self, f19_arg0, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	f8_local1:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if not IsRepeatButtonPress( f21_arg3 ) then
			NavigateToPreviousHeroCard( f21_arg1, self, f21_arg0, f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	f8_local1:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if not IsDisabled( f23_arg0, f23_arg2 ) and not PregameActive() and CharacterCustomization_IsEnabled( f23_arg2 ) and not FirstTimeSetup_IsActive( f23_arg2 ) and IsElementInState( f23_arg0, "DefaultState" ) and not IsInPermanentUnlockMenu( f23_arg2 ) and CharacterHasAnyWeaponUnlocked( f23_arg2, f23_arg0 ) and not IsCharacterBlackjack( f23_arg2, f23_arg0 ) then
			NavigateToMenu( self, "PersonalizeCharacter", true, f23_arg2 )
			return true
		elseif not IsDisabled( f23_arg0, f23_arg2 ) and not PregameActive() and not FirstTimeSetup_IsActive( f23_arg2 ) and IsElementInState( f23_arg0, "DefaultState" ) and not IsInPermanentUnlockMenu( f23_arg2 ) and IsCharacterBlackjack( f23_arg2, f23_arg0 ) then
			SetElementState( self, f23_arg0, f23_arg2, "Challenges" )
			UpdateAllMenuButtonPrompts( f23_arg1, f23_arg2 )
			PlaySoundSetSound( self, "navigate" )
			return true
		elseif not IsDisabled( f23_arg0, f23_arg2 ) and not PregameActive() and not FirstTimeSetup_IsActive( f23_arg2 ) and IsElementInState( f23_arg0, "Challenges" ) and not IsInPermanentUnlockMenu( f23_arg2 ) and IsCharacterBlackjack( f23_arg2, f23_arg0 ) then
			SetElementState( self, f23_arg0, f23_arg2, "DefaultState" )
			UpdateAllMenuButtonPrompts( f23_arg1, f23_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if not IsDisabled( f24_arg0, f24_arg2 ) and not PregameActive() and CharacterCustomization_IsEnabled( f24_arg2 ) and not FirstTimeSetup_IsActive( f24_arg2 ) and IsElementInState( f24_arg0, "DefaultState" ) and not IsInPermanentUnlockMenu( f24_arg2 ) and CharacterHasAnyWeaponUnlocked( f24_arg2, f24_arg0 ) and not IsCharacterBlackjack( f24_arg2, f24_arg0 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		elseif not IsDisabled( f24_arg0, f24_arg2 ) and not PregameActive() and not FirstTimeSetup_IsActive( f24_arg2 ) and IsElementInState( f24_arg0, "DefaultState" ) and not IsInPermanentUnlockMenu( f24_arg2 ) and IsCharacterBlackjack( f24_arg2, f24_arg0 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		elseif not IsDisabled( f24_arg0, f24_arg2 ) and not PregameActive() and not FirstTimeSetup_IsActive( f24_arg2 ) and IsElementInState( f24_arg0, "Challenges" ) and not IsInPermanentUnlockMenu( f24_arg2 ) and IsCharacterBlackjack( f24_arg2, f24_arg0 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	f8_local1:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if IsElementInState( f25_arg0, "DefaultState" ) and not IsDisabled( f25_arg0, f25_arg2 ) and not IsInPermanentUnlockMenu( f25_arg2 ) and not FirstTimeSetup_IsActive( f25_arg2 ) and not CharacterDraftActive() then
			SetElementState( self, f25_arg0, f25_arg2, "Flipped" )
			UpdateAllMenuButtonPrompts( f25_arg1, f25_arg2 )
			return true
		elseif IsElementInState( f25_arg0, "Flipped" ) and not IsDisabled( f25_arg0, f25_arg2 ) and not IsInPermanentUnlockMenu( f25_arg2 ) and not FirstTimeSetup_IsActive( f25_arg2 ) then
			SetElementState( self, f25_arg0, f25_arg2, "DefaultState" )
			UpdateAllMenuButtonPrompts( f25_arg1, f25_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if IsElementInState( f26_arg0, "DefaultState" ) and not IsDisabled( f26_arg0, f26_arg2 ) and not IsInPermanentUnlockMenu( f26_arg2 ) and not FirstTimeSetup_IsActive( f26_arg2 ) and not CharacterDraftActive() then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		elseif IsElementInState( f26_arg0, "Flipped" ) and not IsDisabled( f26_arg0, f26_arg2 ) and not IsInPermanentUnlockMenu( f26_arg2 ) and not FirstTimeSetup_IsActive( f26_arg2 ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	f8_local1:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if IsElementInAnyState( f27_arg0, "Flipped", "Challenges" ) then
			SetElementState( self, f27_arg0, f27_arg2, "DefaultState" )
			UpdateAllMenuButtonPrompts( f27_arg1, f27_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if IsElementInAnyState( f28_arg0, "Flipped", "Challenges" ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( characterCarousel )
	self.characterCarousel = characterCarousel
	
	local ChooseCharacterHelpBubble = CoD.ChooseCharacter_HelpBubble.new( f8_local1, controller )
	ChooseCharacterHelpBubble:setLeftRight( true, false, 64, 241 )
	ChooseCharacterHelpBubble:setTopBottom( true, false, 93.75, 633.5 )
	self:addElement( ChooseCharacterHelpBubble )
	self.ChooseCharacterHelpBubble = ChooseCharacterHelpBubble
	
	local FETalkersWidget = CoD.FE_TalkersWidget.new( f8_local1, controller )
	FETalkersWidget:setLeftRight( false, true, -254, -64 )
	FETalkersWidget:setTopBottom( true, false, 88, 475 )
	self:addElement( FETalkersWidget )
	self.FETalkersWidget = FETalkersWidget
	
	local f8_local21 = nil
	if IsPC() then
		f8_local21 = CoD.CharacterMiniSelector.new( f8_local1, controller )
	else
		f8_local21 = LUI.UIElement.createFake()
	end
	f8_local21:setLeftRight( true, false, 491, 791 )
	f8_local21:setTopBottom( true, false, 641.5, 671.5 )
	if IsPC() then
		self:addElement( f8_local21 )
	end
	self.charMiniSelector = f8_local21
	ChooseCharacterTabBar:linkToElementModel( characterCarousel, nil, false, function ( model )
		ChooseCharacterTabBar:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
		local f33_local0 = self
		local f33_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( f33_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local f34_local0 = self
		local f34_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( f34_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f35_local0 = nil
		ValidateBlackjackPurchase( controller )
		if not f35_local0 then
			f35_local0 = element:dispatchEventToChildren( event )
		end
		return f35_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f36_local0 = nil
		SetCharacterModeToSessionMode( self, element, controller, Enum.eModes.MODE_MULTIPLAYER )
		RefreshCharacterCustomization( self, element, controller )
		SendClientScriptMenuChangeNotify( controller, f8_local1, true )
		ShowHeaderKickerAndIcon( f8_local1 )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "cac3dTitleIntermediary0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "intro", controller )
		SetHeadingKickerTextToGameMode( "" )
		if not f36_local0 then
			f36_local0 = element:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if not CharacterDraftActive() and not FirstTimeSetup_IsActive( f37_arg2 ) then
			ClearSavedHeroForEdits( f37_arg2 )
			ClearSavedState( self, f37_arg2 )
			PlaySoundSetSound( self, "menu_go_back" )
			SendClientScriptMenuChangeNotify( f37_arg2, f37_arg1, false )
			SetPerControllerTableProperty( f37_arg2, "updateNewBreadcrumbs", true )
			GoBack( self, f37_arg2 )
			ForceLobbyButtonUpdate( f37_arg2 )
			return true
		else
			
		end
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		if not CharacterDraftActive() and not FirstTimeSetup_IsActive( f38_arg2 ) then
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if AlwaysFalse() then
			return true
		else
			return false
		end
	end, true )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "U", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		if IsStarterPack( f41_arg2 ) then
			StarterParckPurchase( self, f41_arg2, f41_arg1 )
			return true
		else
			
		end
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		if IsStarterPack( f42_arg2 ) then
			CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "PLATFORM_STARTER_PACK_UPGRADE_TITLE" )
			return true
		else
			return false
		end
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	characterCarousel.id = "characterCarousel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f8_local1
	} )
	if not self:restoreState() then
		self.characterCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		element.PregameTimerOverlay:close()
		element.UnlockTokensWidget:close()
		element.PermanentUnlockTokensWidget:close()
		element.ChooseCharacterTabBar:close()
		element.characterCarousel:close()
		element.ChooseCharacterHelpBubble:close()
		element.FETalkersWidget:close()
		element.charMiniSelector:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseCharacterLoadout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

