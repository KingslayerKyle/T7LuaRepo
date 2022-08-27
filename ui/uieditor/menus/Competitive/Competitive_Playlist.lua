-- f498076235c4a7edf9d889f54f19d861
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.Arena.Arena_MatchSettingInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Arena.ArenaPlaylistRank" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_titlesecbox" )
require( "ui.uieditor.widgets.Arena.Arena_BetaWidget" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg1.playlist
	Engine.SetPlaylistID( f2_local0.index )
	Engine.SetProfileVar( f2_arg2, "playlist_leaguematch", tostring( f2_local0.index ) )
	CoD.LobbyBase.SetPlaylistName( f2_local0.name )
	Engine.RunPlaylistRules( f2_arg2 )
	ForceNotifyGlobalModel( f2_arg2, "GametypeSettings.Update" )
	GoBack( f2_arg0, f2_arg2 )
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = "Arena_Stars_" .. tostring( f3_arg1 )
	DataSources[f3_local0] = DataSourceHelpers.ListSetup( f3_local0, function ( f4_arg0 )
		local f4_local0 = CoD.ArenaUtility.GetRankVisibleStars( f3_arg2 )
		local f4_local1 = CoD.ArenaUtility.GetStarCount( f3_arg2 )
		local f4_local2 = {}
		for f4_local3 = 0, f4_local0 - 1, 1 do
			table.insert( f4_local2, {
				models = {
					earned = f4_local3 < f4_local1
				}
			} )
		end
		return f4_local2
	end, true )
	return f3_local0
end

DataSources.CompetitivePlaylist = DataSourceHelpers.ListSetup( "CompetitivePlaylist", function ( f5_arg0 )
	local f5_local0 = {}
	local f5_local1, f5_local2 = LuaUtils.GetArenaPlaylistInfo()
	local f5_local3 = Engine.GetProfileVarInt( f5_arg0, "playlist_leaguematch" )
	for f5_local14, f5_local15 in ipairs( f5_local2 ) do
		local f5_local7 = ""
		if Engine.DvarBool( nil, "groupCountsVisible" ) == true then
			f5_local7 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( f5_local15.playerCount ), CoD.separateNumberWithCommas( f5_local1.playerCount ) )
		else
			if f5_local1.playerCount == 0 then
				f5_local1.playerCount = 1
			end
			f5_local7 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( f5_local15.playerCount / f5_local1.playerCount * 100 + 0.5 ) )
		end
		local f5_local8 = Engine.GetArenaPoints( f5_arg0, f5_local15.arenaSlot )
		local f5_local9 = table.insert
		local f5_local10 = f5_local0
		local f5_local11 = {}
		local f5_local12 = {}
		local f5_local13 = f5_local15.name
		if not f5_local13 then
			f5_local13 = ""
		end
		f5_local12.text = f5_local13
		f5_local13 = f5_local15.name
		if not f5_local13 then
			f5_local13 = ""
		end
		f5_local12.buttonText = f5_local13
		f5_local13 = f5_local15.icon
		if not f5_local13 then
			f5_local13 = "blacktransparent"
		end
		f5_local12.image = f5_local13
		f5_local13 = f5_local15.description
		if not f5_local13 then
			f5_local13 = ""
		end
		f5_local12.description = f5_local13
		f5_local12.playlistCount = f5_local7
		f5_local12.action = f0_local1
		f5_local12.arenaPoints = f5_local8
		f5_local12.starsDatasource = f0_local2( f5_arg0, f5_local15.index, f5_local8 )
		f5_local11.models = f5_local12
		f5_local11.properties = {
			id = tostring( f5_local15.index ),
			playlist = f5_local15,
			selectIndex = f5_local15.index == f5_local3
		}
		f5_local9( f5_local10, f5_local11 )
	end
	return f5_local0
end, true )
LUI.createMenu.Competitive_Playlist = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Playlist" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Playlist.buttonPrompts" )
	local f6_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f6_local1, controller )
	LeftPanel:setLeftRight( true, true, -45, 35 )
	LeftPanel:setTopBottom( true, true, -43, 102 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f6_local1, controller )
	FadeForStreamer:setLeftRight( true, false, 0, 1280 )
	FadeForStreamer:setTopBottom( true, false, 0, 720 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		f6_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( f6_local1, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local playlistList = LUI.UIList.new( f6_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistList:makeFocusable()
	playlistList:setLeftRight( true, false, 67, 347 )
	playlistList:setTopBottom( true, false, 142, 276 )
	playlistList:setDataSource( "CompetitivePlaylist" )
	playlistList:setWidgetType( CoD.List1Button_Playlist )
	playlistList:setVerticalCount( 4 )
	playlistList:linkToElementModel( playlistList, "disabled", true, function ( model )
		local f9_local0 = playlistList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	playlistList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	f6_local1:AddButtonCallbackFunction( playlistList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsDisabled( f12_arg0, f12_arg2 ) then
			ProcessListAction( self, f12_arg0, f12_arg2 )
			ClearSavedState( self, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f13_arg0, f13_arg2 ) then
			return true
		else
			return false
		end
	end, false )
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
	self:addElement( playlistList )
	self.playlistList = playlistList
	
	local ArenaMatchSettingInfo = CoD.Arena_MatchSettingInfo.new( f6_local1, controller )
	ArenaMatchSettingInfo:setLeftRight( true, false, 697, 1177.5 )
	ArenaMatchSettingInfo:setTopBottom( true, false, 141, 691 )
	self:addElement( ArenaMatchSettingInfo )
	self.ArenaMatchSettingInfo = ArenaMatchSettingInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f6_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local ArenaPlaylistRank = CoD.ArenaPlaylistRank.new( f6_local1, controller )
	ArenaPlaylistRank:setLeftRight( true, false, 699, 1019 )
	ArenaPlaylistRank:setTopBottom( true, false, 546.63, 636.63 )
	ArenaPlaylistRank.ImagePanel:setZoom( 0 )
	ArenaPlaylistRank.TickTL:setAlpha( 0 )
	self:addElement( ArenaPlaylistRank )
	self.ArenaPlaylistRank = ArenaPlaylistRank
	
	local ArenaOverview = CoD.GameSettings_titlesecbox.new( f6_local1, controller )
	ArenaOverview:setLeftRight( true, false, 72, 248 )
	ArenaOverview:setTopBottom( true, false, 288.63, 316.63 )
	ArenaOverview.GameSettingstextboxBG:setAlpha( 0 )
	ArenaOverview.TitleGlow1:setAlpha( 0.85 )
	ArenaOverview.Textbox:setText( Engine.Localize( LocalizeToUpperString( "MENU_ARENA_OVERVIEW" ) ) )
	self:addElement( ArenaOverview )
	self.ArenaOverview = ArenaOverview
	
	local ArenaBetaWidget = CoD.Arena_BetaWidget.new( f6_local1, controller )
	ArenaBetaWidget:setLeftRight( true, false, 63, 513 )
	ArenaBetaWidget:setTopBottom( true, false, 543.63, 608.13 )
	self:addElement( ArenaBetaWidget )
	self.ArenaBetaWidget = ArenaBetaWidget
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 77, 517 )
	Description:setTopBottom( false, true, -403.38, -381.38 )
	Description:setRGB( 0.74, 0.74, 0.74 )
	Description:setText( Engine.Localize( "MENU_ARENA_OVERVIEW_DESC" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setLineSpacing( 0.5 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local SeasonEnd = LUI.UITightText.new()
	SeasonEnd:setLeftRight( true, false, 67, 513 )
	SeasonEnd:setTopBottom( true, false, 613.63, 637.63 )
	SeasonEnd:setTTF( "fonts/escom.ttf" )
	SeasonEnd:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	SeasonEnd:setShaderVector( 0, 0.06, 0, 0, 0 )
	SeasonEnd:setShaderVector( 1, 0.03, 0, 0, 0 )
	SeasonEnd:setShaderVector( 2, 1, 0, 0, 0 )
	SeasonEnd:setLetterSpacing( 2 )
	SeasonEnd:subscribeToGlobalModel( controller, "Arena", "seasonTimeleft", function ( model )
		local seasonTimeleft = Engine.GetModelValue( model )
		if seasonTimeleft then
			SeasonEnd:setText( Engine.Localize( ArenaSeasonEndTime( seasonTimeleft ) ) )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if IsMenuInState( f21_arg1, "DefaultState" ) then
			GoBack( self, f21_arg2 )
			return true
		else
			SetPerControllerTableProperty( f21_arg2, "playlistCategory", nil )
			SetMenuState( f21_arg1, "DefaultState" )
			SetLoseFocusToElement( self, "playlistList", f21_arg2 )
			MakeElementNotFocusable( self, "playlistList", f21_arg2 )
			MakeElementFocusable( self, "playlistCategoriesList", f21_arg2 )
			SetFocusToElement( self, "playlistCategoriesList", f21_arg2 )
			return true
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f6_local1
	} )
	if not self:restoreState() then
		self.playlistList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.frame:close()
		element.playlistList:close()
		element.ArenaMatchSettingInfo:close()
		element.FEMenuLeftGraphics:close()
		element.ArenaPlaylistRank:close()
		element.ArenaOverview:close()
		element.ArenaBetaWidget:close()
		element.SeasonEnd:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Playlist.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

