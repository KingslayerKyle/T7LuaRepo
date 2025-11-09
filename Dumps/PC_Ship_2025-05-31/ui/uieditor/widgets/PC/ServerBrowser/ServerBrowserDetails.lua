require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelUpper" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelLower" )
require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserButton" )
require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserPlayerRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

DataSources.ServerBrowserPlayers = DataSourceHelpers.ListSetup( "ServerBrowserPlayers", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Engine.SteamServerBrowser_GetPlayerCount()
	for f1_local2 = 0, f1_local1 - 1, 1 do
		local f1_local5 = Engine.SteamServerBrowser_GetPlayerInfo( f1_local2 )
		table.insert( f1_local0, {
			models = {
				name = f1_local5.name,
				timePlayed = f1_local5.timePlayed
			}
		} )
	end
	table.sort( f1_local0, function ( f2_arg0, f2_arg1 )
		return f2_arg1.models.timePlayed < f2_arg0.models.timePlayed
	end )
	return f1_local0
end, true )
local PreLoadFunc = function ( self, controller )
	self.playersRefreshModel = Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser.playersRefresh" )
end

local PostLoadFunc = function ( self, controller, menu )
	self.playersList:setDataSource( "ServerBrowserPlayers" )
	self.playersList.subscription = self.playersList:subscribeToModel( self.playersRefreshModel, function ( model )
		self.playersList:updateDataSource( false, false )
	end )
end

CoD.ServerBrowserDetails = InheritFrom( LUI.UIElement )
CoD.ServerBrowserDetails.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserDetails )
	self.id = "ServerBrowserDetails"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local mapImage = LUI.UIImage.new()
	mapImage:setLeftRight( true, true, 10, -10 )
	mapImage:setTopBottom( true, false, 30, 230 )
	mapImage:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			mapImage:setImage( RegisterImage( MapNameToMapImage( mapName ) ) )
		end
	end )
	self:addElement( mapImage )
	self.mapImage = mapImage
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, false, 110, 390 )
	description:setTopBottom( true, false, 237.5, 262.5 )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description:linkToElementModel( self, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			description:setText( Engine.Localize( desc ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	local descriptionLabel = LUI.UIText.new()
	descriptionLabel:setLeftRight( true, false, 10, 210 )
	descriptionLabel:setTopBottom( true, false, 237.5, 262.5 )
	descriptionLabel:setRGB( 0.59, 0.59, 0.59 )
	descriptionLabel:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	descriptionLabel:setTTF( "fonts/default.ttf" )
	descriptionLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descriptionLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( descriptionLabel )
	self.descriptionLabel = descriptionLabel
	
	local mod = LUI.UIText.new()
	mod:setLeftRight( true, false, 110, 390 )
	mod:setTopBottom( true, false, 286.86, 311.86 )
	mod:setTTF( "fonts/default.ttf" )
	mod:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	mod:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	mod:linkToElementModel( self, "modName", true, function ( model )
		local modName = Engine.GetModelValue( model )
		if modName then
			mod:setText( Engine.Localize( modName ) )
		end
	end )
	self:addElement( mod )
	self.mod = mod
	
	local modLabel = LUI.UIText.new()
	modLabel:setLeftRight( true, false, 10, 110 )
	modLabel:setTopBottom( true, false, 286.86, 311.86 )
	modLabel:setRGB( 0.59, 0.59, 0.59 )
	modLabel:setText( Engine.Localize( "MENU_MODS" ) )
	modLabel:setTTF( "fonts/default.ttf" )
	modLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	modLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( modLabel )
	self.modLabel = modLabel
	
	local name = LUI.UIText.new()
	name:setLeftRight( true, false, 10, 390 )
	name:setTopBottom( true, false, 0, 18 )
	name:setTTF( "fonts/default.ttf" )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	name:linkToElementModel( self, "name", true, function ( model )
		local _name = Engine.GetModelValue( model )
		if _name then
			name:setText( Engine.Localize( _name ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local map = CoD.MapVoteLabelUpper.new( menu, controller )
	map:setLeftRight( true, false, 13.5, 190.5 )
	map:setTopBottom( true, false, 184, 205 )
	map:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			map.btnDisplayTextStroke:setText( MapNameToLocalizedMapName( mapName ) )
		end
	end )
	self:addElement( map )
	self.map = map
	
	local gametype = CoD.MapVoteLabelLower.new( menu, controller )
	gametype:setLeftRight( true, false, 13.5, 163.5 )
	gametype:setTopBottom( true, false, 208, 226 )
	gametype.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gametype:linkToElementModel( self, "gameType", true, function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			gametype.SubTitle:setText( Engine.Localize( GetGameTypeDisplayString( gameType ) ) )
		end
	end )
	self:addElement( gametype )
	self.gametype = gametype
	
	local ip = CoD.MapVoteLabelLower.new( menu, controller )
	ip:setLeftRight( true, false, 250, 386 )
	ip:setTopBottom( true, false, 208, 226 )
	ip.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ip:linkToElementModel( self, "connectAddr", true, function ( model )
		local connectAddr = Engine.GetModelValue( model )
		if connectAddr then
			ip.SubTitle:setText( Engine.Localize( connectAddr ) )
		end
	end )
	self:addElement( ip )
	self.ip = ip
	
	local joinButton = CoD.ServerBrowserButton.new( menu, controller )
	joinButton:setLeftRight( true, false, 10, 184 )
	joinButton:setTopBottom( true, false, 463.5, 495.5 )
	joinButton.btnDisplayText:setText( Engine.Localize( "PLATFORM_JOIN_SERVER_CAPS" ) )
	joinButton.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_JOIN_SERVER_CAPS" ) )
	joinButton:linkToElementModel( self, nil, false, function ( model )
		joinButton:setModel( model, controller )
	end )
	joinButton:registerEventHandler( "button_action", function ( element, event )
		local f15_local0 = nil
		ServerBrowserCancelRequest( self )
		JoinServerBrowser( self, element, controller, menu )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( joinButton )
	self.joinButton = joinButton
	
	local refreshButton = CoD.ServerBrowserButton.new( menu, controller )
	refreshButton:setLeftRight( true, false, 10, 184 )
	refreshButton:setTopBottom( true, false, 429.47, 461.47 )
	refreshButton.btnDisplayText:setText( Engine.Localize( "MENU_REFRESH_CAPS" ) )
	refreshButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_REFRESH_CAPS" ) )
	refreshButton:linkToElementModel( self, nil, false, function ( model )
		refreshButton:setModel( model, controller )
	end )
	refreshButton:registerEventHandler( "button_action", function ( element, event )
		local f17_local0 = nil
		ServerBrowserRefreshServer( self, element, menu, model )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:addElement( refreshButton )
	self.refreshButton = refreshButton
	
	local favoriteButton = CoD.ServerBrowserButton.new( menu, controller )
	favoriteButton:setLeftRight( true, false, 200, 390 )
	favoriteButton:setTopBottom( true, false, 429.47, 461.47 )
	favoriteButton.btnDisplayText:setText( Engine.Localize( "MENU_ADD_TO_FAVORITES_CAPS" ) )
	favoriteButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_ADD_TO_FAVORITES_CAPS" ) )
	favoriteButton:linkToElementModel( self, nil, false, function ( model )
		favoriteButton:setModel( model, controller )
	end )
	favoriteButton:registerEventHandler( "button_action", function ( element, event )
		local f19_local0 = nil
		ServerBrowserSetFavorite( self, element, menu, model )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	self:addElement( favoriteButton )
	self.favoriteButton = favoriteButton
	
	local playersList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	playersList:makeFocusable()
	playersList:setLeftRight( true, false, 13.5, 363.5 )
	playersList:setTopBottom( true, false, 315.86, 421.86 )
	playersList:setWidgetType( CoD.ServerBrowserPlayerRow )
	playersList:setVerticalCount( 4 )
	playersList:setVerticalScrollbar( CoD.verticalScrollbar )
	playersList:setDataSource( "ServerBrowserPlayer" )
	self:addElement( playersList )
	self.playersList = playersList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				mapImage:completeAnimation()
				self.mapImage:setAlpha( 1 )
				self.clipFinished( mapImage, {} )
				description:completeAnimation()
				self.description:setAlpha( 1 )
				self.clipFinished( description, {} )
				descriptionLabel:completeAnimation()
				self.descriptionLabel:setAlpha( 1 )
				self.clipFinished( descriptionLabel, {} )
				mod:completeAnimation()
				self.mod:setAlpha( 1 )
				self.clipFinished( mod, {} )
				modLabel:completeAnimation()
				self.modLabel:setAlpha( 1 )
				self.clipFinished( modLabel, {} )
				name:completeAnimation()
				self.name:setAlpha( 1 )
				self.clipFinished( name, {} )
				map:completeAnimation()
				self.map:setAlpha( 1 )
				self.clipFinished( map, {} )
				gametype:completeAnimation()
				self.gametype:setAlpha( 1 )
				self.clipFinished( gametype, {} )
				ip:completeAnimation()
				self.ip:setAlpha( 1 )
				self.clipFinished( ip, {} )
				joinButton:completeAnimation()
				self.joinButton:setAlpha( 1 )
				self.clipFinished( joinButton, {} )
				refreshButton:completeAnimation()
				self.refreshButton:setAlpha( 1 )
				self.clipFinished( refreshButton, {} )
				favoriteButton:completeAnimation()
				favoriteButton.btnDisplayText:completeAnimation()
				favoriteButton.btnDisplayTextStroke:completeAnimation()
				self.favoriteButton:setAlpha( 1 )
				self.favoriteButton.btnDisplayText:setText( Engine.Localize( "MENU_ADD_TO_FAVORITES_CAPS" ) )
				self.favoriteButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_ADD_TO_FAVORITES_CAPS" ) )
				self.clipFinished( favoriteButton, {} )
				playersList:completeAnimation()
				self.playersList:setAlpha( 1 )
				self.clipFinished( playersList, {} )
			end
		},
		NoServers = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				mapImage:completeAnimation()
				self.mapImage:setAlpha( 0 )
				self.clipFinished( mapImage, {} )
				description:completeAnimation()
				self.description:setAlpha( 0 )
				self.clipFinished( description, {} )
				descriptionLabel:completeAnimation()
				self.descriptionLabel:setAlpha( 0 )
				self.clipFinished( descriptionLabel, {} )
				mod:completeAnimation()
				self.mod:setAlpha( 0 )
				self.clipFinished( mod, {} )
				modLabel:completeAnimation()
				self.modLabel:setAlpha( 0 )
				self.clipFinished( modLabel, {} )
				name:completeAnimation()
				self.name:setAlpha( 0 )
				self.clipFinished( name, {} )
				map:completeAnimation()
				self.map:setAlpha( 0 )
				self.clipFinished( map, {} )
				gametype:completeAnimation()
				self.gametype:setAlpha( 0 )
				self.clipFinished( gametype, {} )
				ip:completeAnimation()
				self.ip:setAlpha( 0 )
				self.clipFinished( ip, {} )
				joinButton:completeAnimation()
				self.joinButton:setAlpha( 0 )
				self.clipFinished( joinButton, {} )
				refreshButton:completeAnimation()
				self.refreshButton:setAlpha( 0 )
				self.clipFinished( refreshButton, {} )
				favoriteButton:completeAnimation()
				self.favoriteButton:setAlpha( 0 )
				self.clipFinished( favoriteButton, {} )
				playersList:completeAnimation()
				self.playersList:setAlpha( 0 )
				self.clipFinished( playersList, {} )
			end
		},
		Favorites = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				mapImage:completeAnimation()
				self.mapImage:setAlpha( 1 )
				self.clipFinished( mapImage, {} )
				description:completeAnimation()
				self.description:setAlpha( 1 )
				self.clipFinished( description, {} )
				descriptionLabel:completeAnimation()
				self.descriptionLabel:setAlpha( 1 )
				self.clipFinished( descriptionLabel, {} )
				mod:completeAnimation()
				self.mod:setAlpha( 1 )
				self.clipFinished( mod, {} )
				modLabel:completeAnimation()
				self.modLabel:setAlpha( 1 )
				self.clipFinished( modLabel, {} )
				name:completeAnimation()
				self.name:setAlpha( 1 )
				self.clipFinished( name, {} )
				map:completeAnimation()
				self.map:setAlpha( 1 )
				self.clipFinished( map, {} )
				gametype:completeAnimation()
				self.gametype:setAlpha( 1 )
				self.clipFinished( gametype, {} )
				ip:completeAnimation()
				self.ip:setAlpha( 1 )
				self.clipFinished( ip, {} )
				joinButton:completeAnimation()
				self.joinButton:setAlpha( 1 )
				self.clipFinished( joinButton, {} )
				refreshButton:completeAnimation()
				self.refreshButton:setAlpha( 1 )
				self.clipFinished( refreshButton, {} )
				favoriteButton:completeAnimation()
				favoriteButton.btnDisplayText:completeAnimation()
				favoriteButton.btnDisplayTextStroke:completeAnimation()
				self.favoriteButton:setAlpha( 1 )
				self.favoriteButton.btnDisplayText:setText( Engine.Localize( "PLATFORM_REMOVE_FROM_FAVORITES_CAPS" ) )
				self.favoriteButton.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_REMOVE_FROM_FAVORITES_CAPS" ) )
				self.clipFinished( favoriteButton, {} )
				playersList:completeAnimation()
				self.playersList:setAlpha( 1 )
				self.clipFinished( playersList, {} )
			end
		},
		History = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				mapImage:completeAnimation()
				self.mapImage:setAlpha( 1 )
				self.clipFinished( mapImage, {} )
				description:completeAnimation()
				self.description:setAlpha( 1 )
				self.clipFinished( description, {} )
				descriptionLabel:completeAnimation()
				self.descriptionLabel:setAlpha( 1 )
				self.clipFinished( descriptionLabel, {} )
				mod:completeAnimation()
				self.mod:setAlpha( 1 )
				self.clipFinished( mod, {} )
				modLabel:completeAnimation()
				self.modLabel:setAlpha( 1 )
				self.clipFinished( modLabel, {} )
				name:completeAnimation()
				self.name:setAlpha( 1 )
				self.clipFinished( name, {} )
				map:completeAnimation()
				self.map:setAlpha( 1 )
				self.clipFinished( map, {} )
				gametype:completeAnimation()
				self.gametype:setAlpha( 1 )
				self.clipFinished( gametype, {} )
				ip:completeAnimation()
				self.ip:setAlpha( 1 )
				self.clipFinished( ip, {} )
				joinButton:completeAnimation()
				self.joinButton:setAlpha( 1 )
				self.clipFinished( joinButton, {} )
				refreshButton:completeAnimation()
				self.refreshButton:setAlpha( 1 )
				self.clipFinished( refreshButton, {} )
				favoriteButton:completeAnimation()
				favoriteButton.btnDisplayText:completeAnimation()
				favoriteButton.btnDisplayTextStroke:completeAnimation()
				self.favoriteButton:setAlpha( 1 )
				self.favoriteButton.btnDisplayText:setText( Engine.Localize( "PLATFORM_REMOVE_FROM_HISTORY_CAPS" ) )
				self.favoriteButton.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_REMOVE_FROM_HISTORY_CAPS" ) )
				self.clipFinished( favoriteButton, {} )
				playersList:completeAnimation()
				self.playersList:setAlpha( 1 )
				self.clipFinished( playersList, {} )
			end
		}
	}
	playersList.id = "playersList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.playersList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.map:close()
		element.gametype:close()
		element.ip:close()
		element.joinButton:close()
		element.refreshButton:close()
		element.favoriteButton:close()
		element.playersList:close()
		element.mapImage:close()
		element.description:close()
		element.mod:close()
		element.name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

