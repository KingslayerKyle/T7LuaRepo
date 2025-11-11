require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_CallingCards" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Emblem" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Gunsmith = CoD.StartMenu_Button_Hero.new( menu, controller )
	Gunsmith:mergeStateConditions( {
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return not Gunsmith_IsEnabled( element, controller )
			end
		}
	} )
	Gunsmith:setLeftRight( 0, 0, 15, 1111 )
	Gunsmith:setTopBottom( 0, 1, 20, -268 )
	Gunsmith.imageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmith" ) )
	Gunsmith.Title:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	Gunsmith.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GUNSMITH_DESC" ) )
	Gunsmith:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Gunsmith:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Gunsmith, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Gunsmith_IsEnabled( element, controller ) then
			OpenGunsmith( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if Gunsmith_IsEnabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Gunsmith )
	self.Gunsmith = Gunsmith
	
	local Emblems = CoD.StartMenu_Button_Emblem.new( menu, controller )
	Emblems:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	Emblems:setLeftRight( 1, 1, -602, -38 )
	Emblems:setTopBottom( 0, 0, 20, 359 )
	Emblems.Title:setText( Engine.Localize( "" ) )
	Emblems.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	Emblems.ImageText:setText( Engine.Localize( "" ) )
	Emblems:subscribeToGlobalModel( controller, "PerController", "identityBadge.xuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Emblems.emblem0:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = Emblems
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Emblems:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = Emblems
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Emblems:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Emblems:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsLive() and not IsUserContentRestricted( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Emblems )
	self.Emblems = Emblems
	
	local CallingCards = CoD.StartMenu_Button_CallingCards.new( menu, controller )
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
				local f17_local0
				if not CallingCards_IsGetPublicProfileComplete( element, controller ) then
					f17_local0 = IsLive()
				else
					f17_local0 = false
				end
				return f17_local0
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
	CallingCards:setLeftRight( 1, 1, -602, -38 )
	CallingCards:setTopBottom( 0, 1, 366, -268 )
	CallingCards.Title:setText( Engine.Localize( "" ) )
	CallingCards.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	CallingCards.ImageText:setText( Engine.Localize( "" ) )
	CallingCards:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CallingCards:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CallingCards, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenCallingCards( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	CallingCards:subscribeToGlobalModel( controller, "PerController", "CallingCardsIdentity.GetPublicProfileComplete", function ( model )
		local element = CallingCards
		CallingCards_EmblemGetProfile( menu, element, controller )
	end )
	self:addElement( CallingCards )
	self.CallingCards = CallingCards
	
	local ClanTag = CoD.StartMenu_Button_LG.new( menu, controller )
	ClanTag:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	ClanTag:setLeftRight( 1, 1, -602, -38 )
	ClanTag:setTopBottom( 1, 1, -258, -22 )
	ClanTag.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_clan" ) )
	ClanTag.Title:setText( Engine.Localize( "" ) )
	ClanTag.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "FEATURE_CLAN_TAG_CAPS" ) )
	ClanTag.ImageText:setText( Engine.Localize( "" ) )
	ClanTag:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ClanTag:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ClanTag, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			EditClanTag( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local Screenshots = CoD.StartMenu_Button_LG.new( menu, controller )
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
	Screenshots:setLeftRight( 0, 0, 568.5, 1111.5 )
	Screenshots:setTopBottom( 1, 1, -258, -22 )
	Screenshots.ImageContainer.ImageContainer:setImage( RegisterImage( "t7_menu_startmenu_identity_screenshots" ) )
	Screenshots.Title:setText( Engine.Localize( "" ) )
	Screenshots.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_SCREENSHOTS" ) )
	Screenshots.ImageText:setText( Engine.Localize( "" ) )
	Screenshots:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Screenshots:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Screenshots, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenLocalScreenshots( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Screenshots )
	self.Screenshots = Screenshots
	
	local Paintshop = CoD.StartMenu_Button_LG.new( menu, controller )
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
	Paintshop:setLeftRight( 0, 0, 15, 559 )
	Paintshop:setTopBottom( 1, 1, -258, -22 )
	Paintshop.ImageContainer.ImageContainer:setImage( RegisterImage( "t7_menu_startmenu_identity_paintshop" ) )
	Paintshop.Title:setText( Engine.Localize( "" ) )
	Paintshop.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	Paintshop.ImageText:setText( Engine.Localize( "" ) )
	Paintshop:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Paintshop:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Gunsmith:close()
		self.Emblems:close()
		self.CallingCards:close()
		self.ClanTag:close()
		self.Screenshots:close()
		self.Paintshop:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	if IsFreeCursorActive( controller ) then
		DisableDefaultGainFocus( self, controller )
	end
	return self
end

