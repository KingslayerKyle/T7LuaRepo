-- 20b45e8e1a4aaea4f95af980664f7cb2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserHeaderIconColumn" )
require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserHeaderNamedColumn" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouseMove( true )
	f1_arg0:setForceMouseEventDispatch( true )
	f1_arg0.protected:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_PROTECTED_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_PROTECTED_DESCENDING )
	f1_arg0.dedicated:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_DEDICATED_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_DEDICATED_DESCENDING )
	f1_arg0.ranked:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_RANKED_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_RANKED_DESCENDING )
	f1_arg0.name:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_NAME_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_NAME_DESCENDING )
	f1_arg0.map:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_MAP_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_MAP_DESCENDING )
	f1_arg0.skull:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_HARDCORE_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_HARDCORE_DESCENDING )
	f1_arg0.mode:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_GAMETYPE_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_GAMETYPE_DESCENDING )
	f1_arg0.players:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_PLAYERS_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_PLAYERS_DESCENDING )
	f1_arg0.ping:setupSort( Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_PING_ASCENDING, Enum.SteamServerSortType.STEAM_SERVER_SORT_TYPE_PING_DESCENDING )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.ServerBrowserHeader = InheritFrom( LUI.UIElement )
CoD.ServerBrowserHeader.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 2
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserHeader )
	self.id = "ServerBrowserHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 28 )
	self.anyChildUsesUpdateState = true
	
	local protected = CoD.ServerBrowserHeaderIconColumn.new( menu, controller )
	protected:setLeftRight( true, false, 0, 28 )
	protected:setTopBottom( true, true, 0, 0 )
	protected.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_protected" ) )
	self:addElement( protected )
	self.protected = protected
	
	local dedicated = CoD.ServerBrowserHeaderIconColumn.new( menu, controller )
	dedicated:setLeftRight( true, false, 30, 58 )
	dedicated:setTopBottom( true, true, 0, 0 )
	dedicated.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_dedicated" ) )
	self:addElement( dedicated )
	self.dedicated = dedicated
	
	local ranked = CoD.ServerBrowserHeaderIconColumn.new( menu, controller )
	ranked:setLeftRight( true, false, 60, 88 )
	ranked:setTopBottom( true, true, 0, 0 )
	ranked.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_ranked" ) )
	self:addElement( ranked )
	self.ranked = ranked
	
	local name = CoD.ServerBrowserHeaderNamedColumn.new( menu, controller )
	name:setLeftRight( true, false, 90, 330 )
	name:setTopBottom( true, true, 0, 0 )
	name.name.textBox:setText( Engine.Localize( "EXE_SV_INFO_SERVERNAME" ) )
	self:addElement( name )
	self.name = name
	
	local map = CoD.ServerBrowserHeaderNamedColumn.new( menu, controller )
	map:setLeftRight( true, false, 332, 440 )
	map:setTopBottom( true, true, 0, 0 )
	map.name.textBox:setText( Engine.Localize( "EXE_SV_INFO_MAP" ) )
	self:addElement( map )
	self.map = map
	
	local skull = CoD.ServerBrowserHeaderIconColumn.new( menu, controller )
	skull:setLeftRight( true, false, 442, 470 )
	skull:setTopBottom( true, true, 0, 0 )
	skull.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_skull" ) )
	self:addElement( skull )
	self.skull = skull
	
	local mode = CoD.ServerBrowserHeaderNamedColumn.new( menu, controller )
	mode:setLeftRight( true, false, 472, 580 )
	mode:setTopBottom( true, true, 0, 0 )
	mode.name.textBox:setText( Engine.Localize( "MENU_GAME_MODE_PRE" ) )
	self:addElement( mode )
	self.mode = mode
	
	local players = CoD.ServerBrowserHeaderNamedColumn.new( menu, controller )
	players:setLeftRight( true, false, 582, 650 )
	players:setTopBottom( true, true, 0, 0 )
	players.name.textBox:setText( Engine.Localize( "MENU_PLAYERS" ) )
	self:addElement( players )
	self.players = players
	
	local ping = CoD.ServerBrowserHeaderNamedColumn.new( menu, controller )
	ping:setLeftRight( true, false, 652, 700 )
	ping:setTopBottom( true, true, 0, 0 )
	ping.name.textBox:setText( Engine.Localize( "MENU_PING" ) )
	self:addElement( ping )
	self.ping = ping
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.protected:close()
		element.dedicated:close()
		element.ranked:close()
		element.name:close()
		element.map:close()
		element.skull:close()
		element.mode:close()
		element.players:close()
		element.ping:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
