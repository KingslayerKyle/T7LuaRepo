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

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "mini_item_selected", function ( element, event )
		local f2_local0 = element.characterCarousel
		if event.index then
			if not element.m_sync then
				element.m_sync = true
				element.characterCarousel:setActiveIndex( 1, event.index )
			else
				element.m_sync = nil
			end
		end
		if FirstTimeSetup_Overview( f1_arg1 ) then
			FirstTimeSetup_SetChangedCharacter( f1_arg1 )
		end
	end )
	f1_arg0:registerEventHandler( "list_active_changed", function ( element, event )
		if event.list == f1_arg0.characterCarousel then
			local f3_local0 = event.list.activeWidget
			if f3_local0 and f3_local0.heroIndex then
				if not f1_arg0.m_sync then
					f1_arg0.m_sync = true
					f1_arg0.charMiniSelector:processEvent( {
						name = "sync_mini_selector",
						index = f3_local0.heroIndex + 1,
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
			end
			f4_local2 = f4_local2:getNextSibling()
		end
	end )
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ()
		
	end
	
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
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
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
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
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
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
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
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( false, true, -362, -123 )
	UnlockTokensWidget:setTopBottom( true, false, 36, 80 )
	UnlockTokensWidget:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -362, -81 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 36, 80 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local ChooseCharacterTabBar = CoD.ChooseCharacter_TabBar.new( self, controller )
	ChooseCharacterTabBar:setLeftRight( true, false, 232, 1048 )
	ChooseCharacterTabBar:setTopBottom( true, false, 91.25, 134.5 )
	self:addElement( ChooseCharacterTabBar )
	self.ChooseCharacterTabBar = ChooseCharacterTabBar
	
	local characterCarousel = LUI.UIList.new( self, controller, 4, 200, nil, false, true, 232, 0, false, false )
	characterCarousel:makeFocusable()
	characterCarousel:setLeftRight( true, false, 0, 5968 )
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
		CoD.Menu.UpdateButtonShownState( f11_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f11_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		local f12_local0 = characterCarousel
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local f13_local0 = characterCarousel
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	characterCarousel:linkToElementModel( characterCarousel, "heroIndex", true, function ( model )
		local f14_local0 = characterCarousel
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroIndex"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	characterCarousel:linkToElementModel( characterCarousel, nil, true, function ( model )
		local f15_local0 = characterCarousel
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) then
			NavigateToNextHeroCard( menu, self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) then
			NavigateToPreviousHeroCard( menu, self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and not PregameActive() and CharacterCustomization_IsEnabled( controller ) and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "DefaultState" ) and not IsInPermanentUnlockMenu( controller ) and CharacterHasAnyWeaponUnlocked( controller, element ) and not IsCharacterBlackjack( controller, element ) then
			NavigateToMenu( self, "PersonalizeCharacter", true, controller )
			return true
		elseif not IsDisabled( element, controller ) and not PregameActive() and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "DefaultState" ) and not IsInPermanentUnlockMenu( controller ) and IsCharacterBlackjack( controller, element ) then
			SetElementState( self, element, controller, "Challenges" )
			UpdateAllMenuButtonPrompts( menu, controller )
			PlaySoundSetSound( self, "navigate" )
			return true
		elseif not IsDisabled( element, controller ) and not PregameActive() and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "Challenges" ) and not IsInPermanentUnlockMenu( controller ) and IsCharacterBlackjack( controller, element ) then
			SetElementState( self, element, controller, "DefaultState" )
			UpdateAllMenuButtonPrompts( menu, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) and not PregameActive() and CharacterCustomization_IsEnabled( controller ) and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "DefaultState" ) and not IsInPermanentUnlockMenu( controller ) and CharacterHasAnyWeaponUnlocked( controller, element ) and not IsCharacterBlackjack( controller, element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		elseif not IsDisabled( element, controller ) and not PregameActive() and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "DefaultState" ) and not IsInPermanentUnlockMenu( controller ) and IsCharacterBlackjack( controller, element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		elseif not IsDisabled( element, controller ) and not PregameActive() and not FirstTimeSetup_IsActive( controller ) and IsElementInState( element, "Challenges" ) and not IsInPermanentUnlockMenu( controller ) and IsCharacterBlackjack( controller, element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		elseif IsElementInState( element, "Flipped" ) and not IsDisabled( element, controller ) and not IsInPermanentUnlockMenu( controller ) and not FirstTimeSetup_IsActive( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsElementInAnyState( element, "Flipped", "Challenges" ) then
			SetElementState( self, element, controller, "DefaultState" )
			UpdateAllMenuButtonPrompts( menu, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInAnyState( element, "Flipped", "Challenges" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( characterCarousel )
	self.characterCarousel = characterCarousel
	
	local ChooseCharacterHelpBubble = CoD.ChooseCharacter_HelpBubble.new( self, controller )
	ChooseCharacterHelpBubble:setLeftRight( true, false, 64, 241 )
	ChooseCharacterHelpBubble:setTopBottom( true, false, 93.75, 633.5 )
	self:addElement( ChooseCharacterHelpBubble )
	self.ChooseCharacterHelpBubble = ChooseCharacterHelpBubble
	
	local FETalkersWidget = CoD.FE_TalkersWidget.new( self, controller )
	FETalkersWidget:setLeftRight( false, true, -254, -64 )
	FETalkersWidget:setTopBottom( true, false, 88, 475 )
	self:addElement( FETalkersWidget )
	self.FETalkersWidget = FETalkersWidget
	
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
		CoD.Menu.UpdateButtonShownState( f33_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		local f34_local0 = self
		local f34_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		}
		CoD.Menu.UpdateButtonShownState( f34_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f35_local0 = nil
		ValidateBlackjackPurchase( controller )
		if not f35_local0 then
			f35_local0 = self:dispatchEventToChildren( event )
		end
		return f35_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f36_local0 = nil
		SetCharacterModeToSessionMode( self, self, controller, Enum.eModes.MODE_MULTIPLAYER )
		RefreshCharacterCustomization( self, self, controller )
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "cac3dTitleIntermediary0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "intro", controller )
		SetHeadingKickerTextToGameMode( "" )
		if not f36_local0 then
			f36_local0 = self:dispatchEventToChildren( event )
		end
		return f36_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if AlwaysFalse() then
			return true
		else
			return false
		end
	end, true )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	characterCarousel.id = "characterCarousel"
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseCharacterLoadout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

