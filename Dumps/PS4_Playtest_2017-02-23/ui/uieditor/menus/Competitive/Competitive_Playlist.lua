require( "ui.uieditor.widgets.Arena.Arena_BetaWidget" )
require( "ui.uieditor.widgets.Arena.Arena_MatchSettingInfo" )
require( "ui.uieditor.widgets.Arena.ArenaPlaylistRank" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_titlesecbox" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

local CompetitivePlaylistSelected = function ( self, element, controller )
	local playlist = element.playlist
	Engine.SetPlaylistID( playlist.index )
	Engine.SetProfileVar( controller, "playlist_leaguematch", tostring( playlist.index ) )
	CoD.LobbyUtility.SetPlaylistName( playlist.name )
	Engine.RunPlaylistRules( controller )
	ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
	GoBack( self, controller )
end

local CreateStarsDatasource = function ( controller, playlistIndex, arenaPoints )
	local dataSourceName = "Arena_Stars_" .. tostring( playlistIndex )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local totalStars = CoD.ArenaUtility.GetRankVisibleStars( arenaPoints )
		local earnedStars = CoD.ArenaUtility.GetStarCount( arenaPoints )
		local points = {}
		for starIndex = 0, totalStars - 1, 1 do
			table.insert( points, {
				models = {
					earned = starIndex < earnedStars
				}
			} )
		end
		return points
	end, true )
	return dataSourceName
end

local PlaylistModesPrepare = function ( controller )
	local playlists = {}
	local arenaCategory, arenaPlaylists = LuaUtils.GetArenaPlaylistInfo()
	local cachedPlaylist = Engine.GetProfileVarInt( controller, "playlist_leaguematch" )
	for index, playlist in ipairs( arenaPlaylists ) do
		local f5_local3 = ""
		if Engine.GetDvarBool( "groupCountsVisible" ) == true then
			f5_local3 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( playlist.playerCount ), CoD.separateNumberWithCommas( arenaCategory.playerCount ) )
		else
			if arenaCategory.playerCount == 0 then
				arenaCategory.playerCount = 1
			end
			f5_local3 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( playlist.playerCount / arenaCategory.playerCount * 100 + 0.5 ) )
		end
		local arenaPoints = Engine.GetArenaPoints( controller, playlist.arenaSlot )
		local f5_local4 = table.insert
		local f5_local5 = playlists
		local f5_local6 = {}
		local f5_local7 = {}
		local f5_local8 = playlist.name
		if not f5_local8 then
			f5_local8 = ""
		end
		f5_local7.text = f5_local8
		f5_local8 = playlist.name
		if not f5_local8 then
			f5_local8 = ""
		end
		f5_local7.buttonText = f5_local8
		f5_local8 = playlist.icon
		if not f5_local8 then
			f5_local8 = "blacktransparent"
		end
		f5_local7.image = f5_local8
		f5_local8 = playlist.description
		if not f5_local8 then
			f5_local8 = ""
		end
		f5_local7.description = f5_local8
		f5_local7.playlistCount = f5_local3
		f5_local7.action = CompetitivePlaylistSelected
		f5_local7.arenaPoints = arenaPoints
		f5_local7.starsDatasource = CreateStarsDatasource( controller, playlist.index, arenaPoints )
		f5_local6.models = f5_local7
		f5_local6.properties = {
			id = tostring( playlist.index ),
			playlist = playlist,
			selectIndex = playlist.index == cachedPlaylist
		}
		f5_local4( f5_local5, f5_local6 )
	end
	return playlists
end

DataSources.CompetitivePlaylist = DataSourceHelpers.ListSetup( "CompetitivePlaylist", PlaylistModesPrepare, true )
LUI.createMenu.Competitive_Playlist = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Playlist" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Playlist.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 1, -68, 52 )
	LeftPanel:setTopBottom( 0, 1, -65, 153 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	FadeForStreamer:setLeftRight( 0, 0, 0, 1920 )
	FadeForStreamer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( self, controller )
	frame:setLeftRight( 0, 1, 0, 0 )
	frame:setTopBottom( 0, 1, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local playlistList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistList:makeFocusable()
	playlistList:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	playlistList:setLeftRight( 0, 0, 100, 520 )
	playlistList:setTopBottom( 0, 0, 215, 413 )
	playlistList:setWidgetType( CoD.List1Button_Playlist )
	playlistList:setVerticalCount( 4 )
	playlistList:setDataSource( "CompetitivePlaylist" )
	playlistList:linkToElementModel( playlistList, "disabled", true, function ( model )
		local element = playlistList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	playlistList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( playlistList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			ClearSavedState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( playlistList )
	self.playlistList = playlistList
	
	local ArenaMatchSettingInfo = CoD.Arena_MatchSettingInfo.new( self, controller )
	ArenaMatchSettingInfo:setLeftRight( 0, 0, 1045, 1766 )
	ArenaMatchSettingInfo:setTopBottom( 0, 0, 211.5, 1036.5 )
	self:addElement( ArenaMatchSettingInfo )
	self.ArenaMatchSettingInfo = ArenaMatchSettingInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local ArenaPlaylistRank = CoD.ArenaPlaylistRank.new( self, controller )
	ArenaPlaylistRank:setLeftRight( 0, 0, 1048, 1528 )
	ArenaPlaylistRank:setTopBottom( 0, 0, 819.5, 954.5 )
	ArenaPlaylistRank.ImagePanel:setZoom( 0 )
	ArenaPlaylistRank.TickTL:setAlpha( 0 )
	self:addElement( ArenaPlaylistRank )
	self.ArenaPlaylistRank = ArenaPlaylistRank
	
	local ArenaOverview = CoD.GameSettings_titlesecbox.new( self, controller )
	ArenaOverview:setLeftRight( 0, 0, 108, 372 )
	ArenaOverview:setTopBottom( 0, 0, 433, 475 )
	ArenaOverview.GameSettingstextboxBG:setAlpha( 0 )
	ArenaOverview.TitleGlow1:setAlpha( 0.85 )
	ArenaOverview.Textbox:setText( LocalizeToUpperString( "MENU_ARENA_OVERVIEW" ) )
	self:addElement( ArenaOverview )
	self.ArenaOverview = ArenaOverview
	
	local ArenaBetaWidget = CoD.Arena_BetaWidget.new( self, controller )
	ArenaBetaWidget:setLeftRight( 0, 0, 94.5, 769.5 )
	ArenaBetaWidget:setTopBottom( 0, 0, 815, 912 )
	self:addElement( ArenaBetaWidget )
	self.ArenaBetaWidget = ArenaBetaWidget
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 116, 776 )
	Description:setTopBottom( 1, 1, -605, -572 )
	Description:setRGB( 0.74, 0.74, 0.74 )
	Description:setText( Engine.Localize( "MENU_ARENA_OVERVIEW_DESC" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setLineSpacing( 0.5 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local SeasonEnd = LUI.UITightText.new()
	SeasonEnd:setLeftRight( 0, 0, 101, 770 )
	SeasonEnd:setTopBottom( 0, 0, 920, 956 )
	SeasonEnd:setTTF( "fonts/escom.ttf" )
	SeasonEnd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	SeasonEnd:setShaderVector( 0, 0.06, 0, 0, 0 )
	SeasonEnd:setShaderVector( 1, 0.03, 0, 0, 0 )
	SeasonEnd:setShaderVector( 2, 1, 0, 0, 0 )
	SeasonEnd:setLetterSpacing( 2 )
	SeasonEnd:subscribeToGlobalModel( controller, "Arena", "seasonTimeleft", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SeasonEnd:setText( ArenaSeasonEndTime( modelValue ) )
		end
	end )
	self:addElement( SeasonEnd )
	self.SeasonEnd = SeasonEnd
	
	ArenaMatchSettingInfo:linkToElementModel( playlistList, nil, false, function ( model )
		ArenaMatchSettingInfo:setModel( model, controller )
	end )
	ArenaPlaylistRank:linkToElementModel( playlistList, nil, false, function ( model )
		ArenaPlaylistRank:setModel( model, controller )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			GoBack( self, controller )
			return true
		else
			SetPerControllerTableProperty( controller, "playlistCategory", nil )
			SetMenuState( menu, "DefaultState" )
			SetLoseFocusToElement( self, "playlistList", controller )
			MakeElementNotFocusable( self, "playlistList", controller )
			MakeElementFocusable( self, "playlistCategoriesList", controller )
			SetFocusToElement( self, "playlistCategoriesList", controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	frame:setModel( self.buttonModel, controller )
	playlistList.id = "playlistList"
	ArenaPlaylistRank.id = "ArenaPlaylistRank"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.playlistList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.frame:close()
		self.playlistList:close()
		self.ArenaMatchSettingInfo:close()
		self.FEMenuLeftGraphics:close()
		self.ArenaPlaylistRank:close()
		self.ArenaOverview:close()
		self.ArenaBetaWidget:close()
		self.SeasonEnd:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Playlist.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

