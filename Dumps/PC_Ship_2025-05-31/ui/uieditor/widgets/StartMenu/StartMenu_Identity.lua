require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Emblem" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_CallingCards" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "CallingCardsIdentity.DataDownloaded" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "CallingCardsIdentity.GetPublicProfileComplete" )
end

CoD.StartMenu_Identity = InheritFrom( LUI.UIElement )
CoD.StartMenu_Identity.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Identity )
	self.id = "StartMenu_Identity"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Gunsmith = CoD.StartMenu_Button_Hero.new( menu, controller )
	Gunsmith:setLeftRight( true, false, 10, 741 )
	Gunsmith:setTopBottom( true, true, 13, -179 )
	Gunsmith.imageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmith" ) )
	Gunsmith.Title:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	Gunsmith.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GUNSMITH_DESC" ) )
	Gunsmith:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	Gunsmith:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( Gunsmith, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Gunsmith_IsEnabled( element, controller ) then
			OpenGunsmith( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if Gunsmith_IsEnabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Gunsmith:mergeStateConditions( {
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return not Gunsmith_IsEnabled( element, controller )
			end
		}
	} )
	self:addElement( Gunsmith )
	self.Gunsmith = Gunsmith
	
	local Emblems = CoD.StartMenu_Button_Emblem.new( menu, controller )
	Emblems:setLeftRight( false, true, -401, -25 )
	Emblems:setTopBottom( true, false, 13, 239 )
	Emblems.Title:setText( Engine.Localize( "" ) )
	Emblems.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	Emblems.ImageText:setText( Engine.Localize( "" ) )
	Emblems:subscribeToGlobalModel( controller, "PerController", "identityBadge.xuid", function ( model )
		local identityBadgeXuid = Engine.GetModelValue( model )
		if identityBadgeXuid then
			Emblems.emblem0:setupPlayerEmblemByXUID( identityBadgeXuid )
		end
	end )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f9_local0 = Emblems
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f10_local0 = Emblems
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Emblems:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	Emblems:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( Emblems, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsLive() and not IsUserContentRestricted( controller ) then
			OpenEmblemSelect( self, element, controller, Enum.StorageFileType.STORAGE_EMBLEMS, menu )
			return true
		elseif not IsLive() and not IsUserContentRestricted( controller ) then
			OpenEmblemSelect( self, element, controller, Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLive() and not IsUserContentRestricted( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsLive() and not IsUserContentRestricted( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Emblems:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	self:addElement( Emblems )
	self.Emblems = Emblems
	
	local CallingCards = CoD.StartMenu_Button_CallingCards.new( menu, controller )
	CallingCards:setLeftRight( false, true, -401, -25 )
	CallingCards:setTopBottom( true, true, 244, -179 )
	CallingCards.Title:setText( Engine.Localize( "" ) )
	CallingCards.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	CallingCards.ImageText:setText( Engine.Localize( "" ) )
	CallingCards:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	CallingCards:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( CallingCards, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenCallingCards( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	CallingCards:subscribeToGlobalModel( controller, "PerController", "CallingCardsIdentity.GetPublicProfileComplete", function ( model )
		CallingCards_EmblemGetProfile( menu, CallingCards, controller )
	end )
	CallingCards:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Spinning",
			condition = function ( menu, element, event )
				local f22_local0
				if not CallingCards_IsGetPublicProfileComplete( element, controller ) then
					f22_local0 = IsLive()
				else
					f22_local0 = false
				end
				return f22_local0
			end
		}
	} )
	CallingCards:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CallingCardsIdentity.GetPublicProfileComplete" ), function ( model )
		menu:updateElementState( CallingCards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CallingCardsIdentity.GetPublicProfileComplete"
		} )
	end )
	CallingCards:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( CallingCards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	CallingCards:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( CallingCards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( CallingCards )
	self.CallingCards = CallingCards
	
	local ClanTag = CoD.StartMenu_Button_LG.new( menu, controller )
	ClanTag:setLeftRight( false, true, -401, -25 )
	ClanTag:setTopBottom( false, true, -172, -15 )
	ClanTag.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_clan" ) )
	ClanTag.Title:setText( Engine.Localize( "" ) )
	ClanTag.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "FEATURE_CLAN_TAG_CAPS" ) )
	ClanTag:subscribeToGlobalModel( controller, "PerController", "identityBadge.clanTag", function ( model )
		local identityBadgeClanTag = Engine.GetModelValue( model )
		if identityBadgeClanTag then
			ClanTag.ImageText:setText( Engine.Localize( identityBadgeClanTag ) )
		end
	end )
	ClanTag:registerEventHandler( "gain_focus", function ( element, event )
		local f27_local0 = nil
		if element.gainFocus then
			f27_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f27_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f27_local0
	end )
	ClanTag:registerEventHandler( "lose_focus", function ( element, event )
		local f28_local0 = nil
		if element.loseFocus then
			f28_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f28_local0 = element.super:loseFocus( event )
		end
		return f28_local0
	end )
	menu:AddButtonCallbackFunction( ClanTag, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			EditClanTag( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	ClanTag:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local Screenshots = CoD.StartMenu_Button_LG.new( menu, controller )
	Screenshots:setLeftRight( true, false, 379, 741 )
	Screenshots:setTopBottom( false, true, -172, -15 )
	Screenshots.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_screenshots" ) )
	Screenshots.Title:setText( Engine.Localize( "" ) )
	Screenshots.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_SCREENSHOTS" ) )
	Screenshots.ImageText:setText( Engine.Localize( "" ) )
	Screenshots:registerEventHandler( "gain_focus", function ( element, event )
		local f32_local0 = nil
		if element.gainFocus then
			f32_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f32_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f32_local0
	end )
	Screenshots:registerEventHandler( "lose_focus", function ( element, event )
		local f33_local0 = nil
		if element.loseFocus then
			f33_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f33_local0 = element.super:loseFocus( event )
		end
		return f33_local0
	end )
	menu:AddButtonCallbackFunction( Screenshots, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenLocalScreenshots( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Screenshots:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not IsLuaCodeVersionAtLeast( 15 )
			end
		},
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return not IsLive()
			end
		}
	} )
	Screenshots:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( Screenshots, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	Screenshots:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( Screenshots, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( Screenshots )
	self.Screenshots = Screenshots
	
	local Paintshop = CoD.StartMenu_Button_LG.new( menu, controller )
	Paintshop:setLeftRight( true, false, 10, 373 )
	Paintshop:setTopBottom( false, true, -172, -15 )
	Paintshop.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_paintshop" ) )
	Paintshop.Title:setText( Engine.Localize( "" ) )
	Paintshop.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	Paintshop.ImageText:setText( Engine.Localize( "" ) )
	Paintshop:registerEventHandler( "gain_focus", function ( element, event )
		local f40_local0 = nil
		if element.gainFocus then
			f40_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f40_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f40_local0
	end )
	Paintshop:registerEventHandler( "lose_focus", function ( element, event )
		local f41_local0 = nil
		if element.loseFocus then
			f41_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f41_local0 = element.super:loseFocus( event )
		end
		return f41_local0
	end )
	menu:AddButtonCallbackFunction( Paintshop, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenPaintshop( self, element, controller, "", menu )
			PlaySoundAlias( "cac_grid_equip_item" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Paintshop:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		},
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return not Paintjobs_IsEnabled( element, controller )
			end
		}
	} )
	self:addElement( Paintshop )
	self.Paintshop = Paintshop
	
	Gunsmith.navigation = {
		right = {
			Emblems,
			CallingCards
		},
		down = {
			Paintshop,
			Screenshots
		}
	}
	Emblems.navigation = {
		left = Gunsmith,
		down = CallingCards
	}
	CallingCards.navigation = {
		left = Gunsmith,
		up = Emblems,
		down = ClanTag
	}
	ClanTag.navigation = {
		left = Screenshots,
		up = CallingCards
	}
	Screenshots.navigation = {
		left = Paintshop,
		up = Gunsmith,
		right = ClanTag
	}
	Paintshop.navigation = {
		up = Gunsmith,
		right = Screenshots
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Gunsmith.id = "Gunsmith"
	Emblems.id = "Emblems"
	CallingCards.id = "CallingCards"
	ClanTag.id = "ClanTag"
	Screenshots.id = "Screenshots"
	Paintshop.id = "Paintshop"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Gunsmith:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Gunsmith:close()
		element.Emblems:close()
		element.CallingCards:close()
		element.ClanTag:close()
		element.Screenshots:close()
		element.Paintshop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

