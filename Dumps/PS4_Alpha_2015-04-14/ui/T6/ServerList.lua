require( "ui.T6.ScrollingVerticalList" )
require( "ui.T6.ServerListButton" )

CoD.ServerList = {}
CoD.ServerList.ColumnWidth = {}
CoD.ServerList.ColumnWidth[1] = 250
CoD.ServerList.ColumnWidth[2] = 200
CoD.ServerList.ColumnWidth[3] = 100
CoD.ServerList.ColumnWidth[4] = 200
CoD.ServerList.ColumnWidth[5] = 93
CoD.ServerList.RowHeight = CoD.CoD9Button.Height
CoD.ServerList.ColumnSpacing = 5
local ServerList_Button_JoinServer = function ( self, event )
	local hostName = self.serverHostname
	local servers = Engine.ServerListGetServers()
	local serverIndex = self.serverIndex
	if servers == nil or #servers == 0 then
		DebugPrint( "No available servers." )
		return 
	end
	local serverFound = false
	for index, server in ipairs( servers ) do
		if hostName == server.hostname then
			if serverIndex ~= server.serverIndex then
			
			else
				serverFound = true
				break
			end
			serverIndex = server.serverIndex
		end
	end
	if not serverFound then
		DebugPrint( "Server is not available anymore." )
		return 
	end
	CoD.SwitchToSystemLinkGame( event.controller )
	Engine.ServerListJoinServer( event.controller, serverIndex )
end

local ServerList_Button_RefreshServers = function ( self, event )
	Engine.PlaySound( "cac_grid_equip_item" )
	Engine.ServerListRefreshServers( event.controller )
end

local ServerList_Compare = function ( a, b )
	return string.lower( a.hostname ) < string.lower( b.hostname )
end

local ServerList_JoinMatch_RefreshServers = function ( self )
	self.verticalList:removeAllChildren()
	local servers = Engine.ServerListGetServers()
	if servers == nil or #servers == 0 then
		DebugPrint( "No available servers." )
		return 
	end
	table.sort( servers, ServerList_Compare )
	local firstValidServerIndex = 0
	for index, server in ipairs( servers ) do
		if CoD.isZombie == true then
			if server.isInGame ~= "1" then
				local row = CoD.ServerListButton.new( index, server, {
					left = 0,
					top = 0,
					right = 0,
					bottom = CoD.ServerList.RowHeight,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = true,
					bottomAnchor = false,
					spacing = CoD.ServerList.ColumnSpacing
				} )
				row:registerEventHandler( "button_action", ServerList_Button_JoinServer )
				self:addElementToList( row )
				if firstValidServerIndex == 0 then
					firstValidServerIndex = index
				end
				if index == firstValidServerIndex and CoD.useController then
					row:processEvent( {
						name = "gain_focus"
					} )
				end
			end
		end
		local row = CoD.ServerListButton.new( index, server, {
			left = 0,
			top = 0,
			right = 0,
			bottom = CoD.ServerList.RowHeight,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			spacing = CoD.ServerList.ColumnSpacing
		} )
		row:registerEventHandler( "button_action", ServerList_Button_JoinServer )
		self:addElementToList( row )
		if index == 1 and CoD.useController then
			row:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

CoD.ServerList.new = function ( defaultAnimationState )
	local self = CoD.ScrollingVerticalList.new( defaultAnimationState )
	self.id = "ServerList"
	self:registerEventHandler( "server_list_refresh", ServerList_JoinMatch_RefreshServers )
	self:registerEventHandler( "button_prompt_refresh", ServerList_Button_RefreshServers )
	ServerList_JoinMatch_RefreshServers( self )
	return self
end

