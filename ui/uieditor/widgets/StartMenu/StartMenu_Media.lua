-- 2be7ad2e5cd009c6bc367219221c6816
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )

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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Store = CoD.StartMenu_Button_SM.new( menu, controller )
	Store:setLeftRight( true, false, 385, 1124.77 )
	Store:setTopBottom( false, true, -170, -15 )
	Store.ImageText:setText( Engine.Localize( "" ) )
	Store.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_store" ) )
	Store.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	Store.ClanTag:setAlpha( 0 )
	Store.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Store:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	Store:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( Store, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if IsElementInState( f4_arg0, "DefaultState" ) then
			OpenStore( self, f4_arg0, f4_arg2, "MediaTab", f4_arg1 )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		if IsElementInState( f5_arg0, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Store )
	self.Store = Store
	
	local MyShowcase = CoD.StartMenu_Button_LG.new( menu, controller )
	MyShowcase:setLeftRight( true, false, 385, 1124.77 )
	MyShowcase:setTopBottom( true, false, 12.65, 340 )
	MyShowcase.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_showcase" ) )
	MyShowcase.Title:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	MyShowcase.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE_HINT" ) )
	MyShowcase.ImageText:setText( Engine.Localize( "" ) )
	MyShowcase:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	MyShowcase:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( MyShowcase, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if IsElementInState( f8_arg0, "DefaultState" ) then
			OpenMyShowcase( self, f8_arg0, f8_arg2, "", f8_arg1 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if IsElementInState( f9_arg0, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			return false
		end
	end, false )
	MyShowcase:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	self:addElement( MyShowcase )
	self.MyShowcase = MyShowcase
	
	local Popular = CoD.StartMenu_Button_SM.new( menu, controller )
	Popular:setLeftRight( true, false, 10, 373 )
	Popular:setTopBottom( true, false, 12.65, 171 )
	Popular.ImageText:setText( Engine.Localize( "" ) )
	Popular.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_popular" ) )
	Popular.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_POPULAR" ) )
	Popular.ClanTag:setAlpha( 0 )
	Popular.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Popular:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	Popular:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( Popular, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsElementInState( f13_arg0, "DefaultState" ) then
			OpenMediaCommunity( self, f13_arg0, f13_arg2, "", f13_arg1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if IsElementInState( f14_arg0, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Popular:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	self:addElement( Popular )
	self.Popular = Popular
	
	local Trending = CoD.StartMenu_Button_SM.new( menu, controller )
	Trending:setLeftRight( true, false, 10, 373 )
	Trending:setTopBottom( true, false, 180, 340 )
	Trending.ImageText:setText( Engine.Localize( "" ) )
	Trending.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_trending" ) )
	Trending.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TRENDING" ) )
	Trending.ClanTag:setAlpha( 0 )
	Trending.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Trending:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	Trending:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( Trending, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if IsElementInState( f18_arg0, "DefaultState" ) then
			OpenMediaCommunity( self, f18_arg0, f18_arg2, "", f18_arg1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if IsElementInState( f19_arg0, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Trending:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	self:addElement( Trending )
	self.Trending = Trending
	
	local Recent = CoD.StartMenu_Button_SM.new( menu, controller )
	Recent:setLeftRight( true, false, 10, 373 )
	Recent:setTopBottom( false, true, -170, -15 )
	Recent.ImageText:setText( Engine.Localize( "" ) )
	Recent.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_media_recent" ) )
	Recent.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_RECENT" ) )
	Recent.ClanTag:setAlpha( 0 )
	Recent.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Recent:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f21_local0
	end )
	Recent:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
	end )
	menu:AddButtonCallbackFunction( Recent, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsElementInState( f23_arg0, "DefaultState" ) then
			OpenMediaCommunity( self, f23_arg0, f23_arg2, "", f23_arg1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if IsElementInState( f24_arg0, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Recent:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsUserContentRestricted( controller )
			end
		}
	} )
	self:addElement( Recent )
	self.Recent = Recent
	
	Store.navigation = {
		left = Recent,
		up = MyShowcase
	}
	MyShowcase.navigation = {
		left = {
			Popular,
			Trending
		},
		down = Store
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Store.id = "Store"
	MyShowcase.id = "MyShowcase"
	Popular.id = "Popular"
	Trending.id = "Trending"
	Recent.id = "Recent"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Popular:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Store:close()
		element.MyShowcase:close()
		element.Popular:close()
		element.Trending:close()
		element.Recent:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

