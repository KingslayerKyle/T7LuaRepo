require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )

CoD.StartMenu_Community = InheritFrom( LUI.UIElement )
CoD.StartMenu_Community.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Community )
	self.id = "StartMenu_Community"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Store = CoD.StartMenu_Button_SM.new( menu, controller )
	Store:setLeftRight( true, false, 9, 385 )
	Store:setTopBottom( false, true, -170, -5 )
	Store:setRGB( 1, 1, 1 )
	Store.ImageText:setText( Engine.Localize( "" ) )
	Store.ImageContainer:setAlpha( 0 )
	Store.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Store" ) )
	Store.ClanTag:setAlpha( 0 )
	Store.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Store:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	
	local HotFiles = CoD.StartMenu_Button_LG.new( menu, controller )
	HotFiles:setLeftRight( true, false, 9, 762 )
	HotFiles:setTopBottom( true, true, 1, -181 )
	HotFiles:setRGB( 1, 1, 1 )
	HotFiles.bg:setRGB( 1, 1, 1 )
	HotFiles.bg:setAlpha( 0 )
	HotFiles.ImageContainer:setRGB( 1, 1, 1 )
	HotFiles.Title:setText( Engine.Localize( "Hot Files" ) )
	HotFiles.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Customize your campaign character" ) )
	HotFiles.ImageText:setText( Engine.Localize( "" ) )
	HotFiles:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( HotFiles )
	self.HotFiles = HotFiles
	
	local Groups = CoD.StartMenu_Button_LG.new( menu, controller )
	Groups:setLeftRight( true, true, 771, -9 )
	Groups:setTopBottom( true, true, 1, -353 )
	Groups:setRGB( 1, 1, 1 )
	Groups.bg:setRGB( 1, 1, 1 )
	Groups.bg:setAlpha( 0 )
	Groups.ImageContainer:setRGB( 1, 1, 1 )
	Groups.Title:setText( Engine.Localize( "Groups" ) )
	Groups.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Join a group or go to your group HQ" ) )
	Groups.ImageText:setText( Engine.Localize( "" ) )
	Groups:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenGroups( self, element, controller, "", menu )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Groups:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Groups )
	self.Groups = Groups
	
	local Streams = CoD.StartMenu_Button_LG.new( menu, controller )
	Streams:setLeftRight( true, true, 771, -9 )
	Streams:setTopBottom( false, true, -345, -181 )
	Streams:setRGB( 1, 1, 1 )
	Streams.bg:setRGB( 1, 1, 1 )
	Streams.bg:setAlpha( 0 )
	Streams.ImageContainer:setRGB( 1, 1, 1 )
	Streams.Title:setText( Engine.Localize( "Streams" ) )
	Streams.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Customize your campaign character" ) )
	Streams.ImageText:setText( Engine.Localize( "" ) )
	Streams:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	
	local RecentlyShared = CoD.StartMenu_Button_SM.new( menu, controller )
	RecentlyShared:setLeftRight( true, false, 394, 762 )
	RecentlyShared:setTopBottom( false, true, -170, -5 )
	RecentlyShared:setRGB( 1, 1, 1 )
	RecentlyShared.ImageText:setText( Engine.Localize( "" ) )
	RecentlyShared.ImageContainer:setAlpha( 0 )
	RecentlyShared.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_RECENTLY_SHARED" ) )
	RecentlyShared.ClanTag:setAlpha( 0 )
	RecentlyShared.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	RecentlyShared:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( RecentlyShared )
	self.RecentlyShared = RecentlyShared
	
	local MyFileshare = CoD.StartMenu_Button_SM.new( menu, controller )
	MyFileshare:setLeftRight( true, false, 771, 956 )
	MyFileshare:setTopBottom( false, true, -170, -5 )
	MyFileshare:setRGB( 1, 1, 1 )
	MyFileshare.ImageText:setText( Engine.Localize( "" ) )
	MyFileshare.ImageContainer:setAlpha( 0 )
	MyFileshare.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "My Fileshare" ) )
	MyFileshare.ClanTag:setAlpha( 0 )
	MyFileshare.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	MyFileshare:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( MyFileshare )
	self.MyFileshare = MyFileshare
	
	local FriendsFileshare = CoD.StartMenu_Button_SM.new( menu, controller )
	FriendsFileshare:setLeftRight( true, true, 965, -9 )
	FriendsFileshare:setTopBottom( false, true, -170, -5 )
	FriendsFileshare:setRGB( 1, 1, 1 )
	FriendsFileshare.ImageText:setText( Engine.Localize( "" ) )
	FriendsFileshare.ImageContainer:setAlpha( 0 )
	FriendsFileshare.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Friends Fileshare" ) )
	FriendsFileshare.ClanTag:setAlpha( 0 )
	FriendsFileshare.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	FriendsFileshare:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FriendsFileshare )
	self.FriendsFileshare = FriendsFileshare
	
	Store.navigation = {
		up = HotFiles,
		right = RecentlyShared
	}
	HotFiles.navigation = {
		right = {
			Groups,
			Streams
		},
		down = {
			Store,
			RecentlyShared
		}
	}
	Groups.navigation = {
		left = HotFiles,
		down = Streams
	}
	Streams.navigation = {
		left = HotFiles,
		up = Groups,
		down = {
			MyFileshare,
			FriendsFileshare
		}
	}
	RecentlyShared.navigation = {
		left = Store,
		up = HotFiles,
		right = MyFileshare
	}
	MyFileshare.navigation = {
		left = RecentlyShared,
		up = Streams,
		right = FriendsFileshare
	}
	FriendsFileshare.navigation = {
		left = MyFileshare,
		up = Streams
	}
	Store.id = "Store"
	HotFiles.id = "HotFiles"
	Groups.id = "Groups"
	Streams.id = "Streams"
	RecentlyShared.id = "RecentlyShared"
	MyFileshare.id = "MyFileshare"
	FriendsFileshare.id = "FriendsFileshare"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Store:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Store:close()
		self.HotFiles:close()
		self.Groups:close()
		self.Streams:close()
		self.RecentlyShared:close()
		self.MyFileshare:close()
		self.FriendsFileshare:close()
		CoD.StartMenu_Community.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

