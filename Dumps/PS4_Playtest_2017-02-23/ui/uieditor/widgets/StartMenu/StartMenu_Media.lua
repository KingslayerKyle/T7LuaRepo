require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )

CoD.StartMenu_Media = InheritFrom( LUI.UIElement )
CoD.StartMenu_Media.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Media )
	self.id = "StartMenu_Media"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Store = CoD.StartMenu_Button_SM.new( menu, controller )
	Store:setLeftRight( 0, 0, 578, 1122 )
	Store:setTopBottom( 1, 1, -255, -23 )
	Store.ImageText:setText( Engine.Localize( "" ) )
	Store.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_store_2" ) )
	Store.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	Store.ClanTag:setAlpha( 0 )
	Store.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Store:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Store:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Store, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsElementInState( element, "DefaultState" ) then
			OpenStore( self, element, controller, "MediaTab", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Store )
	self.Store = Store
	
	local MyShowcase = CoD.StartMenu_Button_LG.new( menu, controller )
	MyShowcase:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	MyShowcase:setLeftRight( 0, 0, 577, 1687 )
	MyShowcase:setTopBottom( 0, 0, 19, 510 )
	MyShowcase.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_showcase" ) )
	MyShowcase.Title:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	MyShowcase.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE_HINT" ) )
	MyShowcase.ImageText:setText( Engine.Localize( "" ) )
	MyShowcase:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MyShowcase:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MyShowcase, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsElementInState( element, "DefaultState" ) then
			OpenMyShowcase( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( MyShowcase )
	self.MyShowcase = MyShowcase
	
	local Popular = CoD.StartMenu_Button_SM.new( menu, controller )
	Popular:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	Popular:setLeftRight( 0, 0, 15, 559 )
	Popular:setTopBottom( 0, 0, 19, 257 )
	Popular.ImageText:setText( Engine.Localize( "" ) )
	Popular.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_popular" ) )
	Popular.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_POPULAR" ) )
	Popular.ClanTag:setAlpha( 0 )
	Popular.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Popular:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Popular:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Popular, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsElementInState( element, "DefaultState" ) then
			OpenMediaCommunity( self, element, controller, "", menu, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Popular )
	self.Popular = Popular
	
	local Trending = CoD.StartMenu_Button_SM.new( menu, controller )
	Trending:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	Trending:setLeftRight( 0, 0, 15, 559 )
	Trending:setTopBottom( 0, 0, 270, 510 )
	Trending.ImageText:setText( Engine.Localize( "" ) )
	Trending.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_trending" ) )
	Trending.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TRENDING" ) )
	Trending.ClanTag:setAlpha( 0 )
	Trending.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Trending:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Trending:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Trending, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsElementInState( element, "DefaultState" ) then
			OpenMediaCommunity( self, element, controller, "", menu, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Trending )
	self.Trending = Trending
	
	local Recent = CoD.StartMenu_Button_SM.new( menu, controller )
	Recent:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	Recent:setLeftRight( 0, 0, 15, 559 )
	Recent:setTopBottom( 1, 1, -255, -23 )
	Recent.ImageText:setText( Engine.Localize( "" ) )
	Recent.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_recent" ) )
	Recent.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_RECENT" ) )
	Recent.ClanTag:setAlpha( 0 )
	Recent.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Recent:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Recent:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Recent, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsElementInState( element, "DefaultState" ) then
			OpenMediaCommunity( self, element, controller, "", menu, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Recent )
	self.Recent = Recent
	
	local Store0 = CoD.StartMenu_Button_SM.new( menu, controller )
	Store0:setLeftRight( 0, 0, 1143, 1687 )
	Store0:setTopBottom( 1, 1, -255, -23 )
	Store0.ImageText:setText( Engine.Localize( "" ) )
	Store0.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_group" ) )
	Store0.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GROUPS_CAPS" ) )
	Store0.ClanTag:setAlpha( 0 )
	Store0.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Store0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Store0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Store0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsElementInState( element, "DefaultState" ) then
			OpenGroups( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsElementInState( element, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Store0 )
	self.Store0 = Store0
	
	Store.navigation = {
		left = Recent,
		up = MyShowcase,
		right = Store0
	}
	MyShowcase.navigation = {
		left = {
			Popular,
			Trending
		},
		down = {
			Store,
			Store0
		}
	}
	Popular.navigation = {
		right = MyShowcase,
		down = Trending
	}
	Trending.navigation = {
		up = Popular,
		right = MyShowcase,
		down = Recent
	}
	Recent.navigation = {
		up = Trending,
		right = Store
	}
	Store0.navigation = {
		left = Store,
		up = MyShowcase
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Store.id = "Store"
	MyShowcase.id = "MyShowcase"
	Popular.id = "Popular"
	Trending.id = "Trending"
	Recent.id = "Recent"
	Store0.id = "Store0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Popular:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Store:close()
		self.MyShowcase:close()
		self.Popular:close()
		self.Trending:close()
		self.Recent:close()
		self.Store0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

