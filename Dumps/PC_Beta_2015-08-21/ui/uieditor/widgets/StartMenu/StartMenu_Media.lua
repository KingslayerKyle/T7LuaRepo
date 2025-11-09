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
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Store = CoD.StartMenu_Button_SM.new( menu, controller )
	Store:setLeftRight( true, false, 9, 385 )
	Store:setTopBottom( false, true, -170, -5 )
	Store.ImageText:setText( Engine.Localize( "" ) )
	Store.ImageContainer:setAlpha( 0 )
	Store.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "STORE" ) )
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
	menu:AddButtonCallbackFunction( Store, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	Store:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Store )
	self.Store = Store
	
	local Community = CoD.StartMenu_Button_LG.new( menu, controller )
	Community:setLeftRight( true, false, 9, 688 )
	Community:setTopBottom( true, true, 1, -181 )
	Community.bg:setAlpha( 0 )
	Community.ImageContainer:setAlpha( 0 )
	Community.Title:setText( Engine.Localize( "COMMUNITY" ) )
	Community.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Popular Paintjobs, Variants, Emblems & more..." ) )
	Community.ImageText:setText( Engine.Localize( "" ) )
	Community:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Community )
	self.Community = Community
	
	local Streams = CoD.StartMenu_Button_SM.new( menu, controller )
	Streams:setLeftRight( true, false, 394, 688 )
	Streams:setTopBottom( false, true, -170, -5 )
	Streams.ImageText:setText( Engine.Localize( "" ) )
	Streams.ImageContainer:setAlpha( 0 )
	Streams.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "STREAMS" ) )
	Streams.ClanTag:setAlpha( 0 )
	Streams.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Streams:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Streams )
	self.Streams = Streams
	
	local Feed = CoD.StartMenu_Button_SM.new( menu, controller )
	Feed:setLeftRight( true, false, 698, 924.5 )
	Feed:setTopBottom( false, true, -170, -5 )
	Feed.ImageText:setText( Engine.Localize( "" ) )
	Feed.ImageContainer:setAlpha( 0 )
	Feed.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "FEED" ) )
	Feed.ClanTag:setAlpha( 0 )
	Feed.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Feed:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Feed )
	self.Feed = Feed
	
	local Recent = CoD.StartMenu_Button_SM.new( menu, controller )
	Recent:setLeftRight( true, true, 932, -9 )
	Recent:setTopBottom( false, true, -170, -5 )
	Recent.ImageText:setText( Engine.Localize( "" ) )
	Recent.ImageContainer:setAlpha( 0 )
	Recent.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "RECENT" ) )
	Recent.ClanTag:setAlpha( 0 )
	Recent.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Recent:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Recent )
	self.Recent = Recent
	
	local Media = CoD.StartMenu_Button_LG.new( menu, controller )
	Media:setLeftRight( true, false, 698, 1151 )
	Media:setTopBottom( true, true, 1, -181 )
	Media.bg:setAlpha( 0 )
	Media.ImageContainer:setAlpha( 0.73 )
	Media.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_callingcards" ) )
	Media.Title:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	Media.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE_HINT" ) )
	Media.ImageText:setText( Engine.Localize( "" ) )
	Media:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	Media:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( Media, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenMyShowcase( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Media )
	self.Media = Media
	
	Store.navigation = {
		up = Community,
		right = Streams
	}
	Community.navigation = {
		right = Media,
		down = {
			Store,
			Streams
		}
	}
	Streams.navigation = {
		left = Store,
		up = Community,
		right = Feed
	}
	Feed.navigation = {
		left = Streams,
		up = Media,
		right = Recent
	}
	Recent.navigation = {
		left = Feed,
		up = Media
	}
	Media.navigation = {
		left = Community,
		down = {
			Feed,
			Recent
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Store.id = "Store"
	Community.id = "Community"
	Streams.id = "Streams"
	Feed.id = "Feed"
	Recent.id = "Recent"
	Media.id = "Media"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Media:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Store:close()
		element.Community:close()
		element.Streams:close()
		element.Feed:close()
		element.Recent:close()
		element.Media:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

