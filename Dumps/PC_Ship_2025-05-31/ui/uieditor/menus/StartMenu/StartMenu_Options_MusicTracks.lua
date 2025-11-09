require( "ui.uieditor.menus.StartMenu.StartMenu_Options_MusicTracks_Options" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_MusicTracks_CheckBoxOption" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_MusicTracks_TrackListInfo" )

local PreLoadFunc = function ( self, controller )
	DataSources.MusicTracksBase.clearTotals( controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	if IsModelValueEqualToEnum( f2_arg1, "profile.snd_frontendTracksState", Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON ) then
		f2_arg0.ButtonList:processEvent( {
			name = "gain_focus",
			controller = f2_arg1
		} )
	else
		f2_arg0.globalOnOffSwitch:processEvent( {
			name = "gain_focus",
			controller = f2_arg1
		} )
	end
end

DataSources.MusicTracksBase = {
	getModel = function ( f3_arg0 )
		local f3_local0 = Engine.GetModel( Engine.GetGlobalModel(), "musicTracksBase" )
		if not f3_local0 then
			f3_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "musicTracksBase" )
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "selectedTrackCount" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "currentFilterCount" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "currentFilterSelected" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "currentFilter" ), DataSources.MusicTracksBase.allFilter )
			Engine.CreateModel( f3_local0, "settingDesc" )
			DataSources.MusicTracksBase.updateSettingDescModel( f3_arg0 )
		end
		return f3_local0
	end,
	allFilter = "MENU_ALL",
	completeFiltersList = {},
	getTotalSelectedModel = function ( f4_arg0 )
		return Engine.GetModel( DataSources.MusicTracksBase.getModel( f4_arg0 ), "selectedTrackCount" )
	end,
	getCurrentFilterTotalSelectedModel = function ( f5_arg0 )
		return Engine.GetModel( DataSources.MusicTracksBase.getModel( f5_arg0 ), "currentFilterSelected" )
	end,
	getCurrentFilterTotalCountModel = function ( f6_arg0 )
		return Engine.GetModel( DataSources.MusicTracksBase.getModel( f6_arg0 ), "currentFilterCount" )
	end,
	getCurrentFilterModel = function ( f7_arg0 )
		return Engine.GetModel( DataSources.MusicTracksBase.getModel( f7_arg0 ), "currentFilter" )
	end,
	getSettingDescModel = function ( f8_arg0 )
		return Engine.GetModel( DataSources.MusicTracksBase.getModel( f8_arg0 ), "settingDesc" )
	end,
	updateFilterCount = function ( f9_arg0, f9_arg1 )
		local f9_local0
		if f9_arg1 then
			f9_local0 = 1
			if not f9_local0 then
			
			else
				local f9_local1 = DataSources.MusicTracksBase.getCurrentFilterTotalCountModel( f9_arg0 )
				if f9_local1 then
					Engine.SetModelValue( f9_local1, Engine.GetModelValue( f9_local1 ) + f9_local0 )
				end
			end
		end
		f9_local0 = -1
	end,
	updateFilterTotalSelected = function ( f10_arg0, f10_arg1 )
		local f10_local0
		if f10_arg1 then
			f10_local0 = 1
			if not f10_local0 then
			
			else
				local f10_local1 = DataSources.MusicTracksBase.getCurrentFilterTotalSelectedModel( f10_arg0 )
				if f10_local1 then
					Engine.SetModelValue( f10_local1, Engine.GetModelValue( f10_local1 ) + f10_local0 )
				end
			end
		end
		f10_local0 = -1
	end,
	updateTotalSelected = function ( f11_arg0, f11_arg1 )
		local f11_local0
		if f11_arg1 then
			f11_local0 = 1
			if not f11_local0 then
			
			else
				local f11_local1 = DataSources.MusicTracksBase.getTotalSelectedModel( f11_arg0 )
				if f11_local1 then
					Engine.SetModelValue( f11_local1, Engine.GetModelValue( f11_local1 ) + f11_local0 )
				end
			end
		end
		f11_local0 = -1
	end,
	updateSettingDescModel = function ( f12_arg0 )
		local f12_local0 = DataSources.MusicTracksBase.getSettingDescModel( f12_arg0 )
		local f12_local1 = Engine.StorageGetBuffer( f12_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
		if f12_local0 and f12_local1 then
			local f12_local2 = f12_local1.snd_frontendTracksState:get()
			local f12_local3 = ""
			if f12_local2 == Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_DEFAULT then
				f12_local3 = "MENU_MENU_MUSIC_DEFAULT_DESC"
			elseif f12_local2 == Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_OFF then
				f12_local3 = "MENU_MENU_MUSIC_OFF_DESC"
			end
			Engine.SetModelValue( f12_local0, f12_local3 )
		end
	end,
	clearTotals = function ( f13_arg0 )
		local f13_local0 = DataSources.MusicTracksBase.getTotalSelectedModel( f13_arg0 )
		if f13_local0 then
			Engine.SetModelValue( f13_local0, 0 )
		end
		local f13_local1 = DataSources.MusicTracksBase.getCurrentFilterTotalSelectedModel( f13_arg0 )
		if f13_local1 then
			Engine.SetModelValue( f13_local1, 0 )
		end
		local f13_local2 = DataSources.MusicTracksBase.getCurrentFilterTotalCountModel( f13_arg0 )
		if f13_local2 then
			Engine.SetModelValue( f13_local2, 0 )
		end
	end,
	resetFilter = function ( f14_arg0 )
		local f14_local0 = DataSources.MusicTracksBase.getCurrentFilterModel( f14_arg0 )
		if f14_local0 then
			Engine.SetModelValue( f14_local0, DataSources.MusicTracksBase.allFilter )
		end
	end
}
DataSources.MusicPlayerTracks = DataSourceHelpers.ListSetup( "MusicPlayerTracks", function ( f15_arg0 )
	local f15_local0 = {}
	DataSources.MusicTracksBase.completeFiltersList[DataSources.MusicTracksBase.allFilter] = true
	local f15_local1 = Engine.StorageGetBuffer( f15_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f15_local1 then
		local f15_local2 = Engine.GetTableRowCount( CoD.musicPlayerTable )
		local f15_local3 = Engine.GetModelValue( DataSources.MusicTracksBase.getCurrentFilterModel( f15_arg0 ) )
		for f15_local4 = 0, f15_local2 - 1, 1 do
			local f15_local7 = Engine.TableLookup( nil, CoD.musicPlayerTable, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX, f15_local4, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_ALIAS )
			local f15_local8 = Engine.TableLookup( nil, CoD.musicPlayerTable, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX, f15_local4, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_TITLE )
			local f15_local9 = Engine.TableLookup( nil, CoD.musicPlayerTable, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX, f15_local4, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_ARTIST )
			local f15_local10 = Engine.TableLookup( nil, CoD.musicPlayerTable, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX, f15_local4, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_ARTIST_2 )
			local f15_local11 = Engine.TableLookup( nil, CoD.musicPlayerTable, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX, f15_local4, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_FILTERS )
			local f15_local12 = f15_local1.snd_playMPFrontendMusicTrack[f15_local4]:get() == 1
			if f15_local10 and f15_local10 ~= "" then
				f15_local9 = f15_local9 .. ";" .. f15_local10
			end
			if f15_local12 then
				DataSources.MusicTracksBase.updateTotalSelected( f15_arg0, true )
			end
			local f15_local13 = LUI.splitString( f15_local11, ";" )
			local f15_local14 = f15_local3 == DataSources.MusicTracksBase.allFilter
			for f15_local15 = 1, #f15_local13, 1 do
				f15_local13[f15_local15] = "MENU_" .. ToUpper( f15_local13[f15_local15] )
				DataSources.MusicTracksBase.completeFiltersList[f15_local13[f15_local15]] = true
				if not f15_local14 and f15_local3 == f15_local13[f15_local15] then
					f15_local14 = true
				end
			end
			if f15_local14 then
				local f15_local15 = {
					models = {
						alias = f15_local7,
						trackName = f15_local8,
						artist = f15_local9,
						trackLength = Engine.GetSoundPlaybackTime( f15_local7 ),
						trackIndex = f15_local4,
						selected = f15_local12
					},
					properties = {}
				}
				if f15_local12 then
					DataSources.MusicTracksBase.updateFilterTotalSelected( f15_arg0, true )
				end
				DataSources.MusicTracksBase.updateFilterCount( f15_arg0, true )
				table.insert( f15_local0, f15_local15 )
			end
		end
	end
	return f15_local0
end, true, nil, function ( f16_arg0, f16_arg1, f16_arg2 )
	if not f16_arg1.filterSubscription then
		local f16_local0 = DataSources.MusicTracksBase.getCurrentFilterModel( f16_arg0 )
		if f16_local0 then
			f16_arg1.filterSubscription = f16_arg1:subscribeToModel( f16_local0, function ( model )
				DataSources.MusicTracksBase.clearTotals( f16_arg0 )
				if f16_arg1.activeWidget then
					StopMPMusicPreview( f16_arg0, f16_arg1.activeWidget )
				end
				f16_arg1:updateDataSource()
			end, false )
		end
	end
end )
DataSources.MusicPlayerTracks.trackListDataSourceName = "MusicPlayerTracks"
DataSources.MusicPlayerTrackGlobals = DataSourceHelpers.ListSetup( "MusicPlayerTrackGlobals", function ( f18_arg0 )
	local f18_local0 = "snd_frontendTracksState"
	local f18_local1 = {
		{
			name = Engine.Localize( "MENU_DEFAULT" ),
			value = Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_ON" ),
			value = Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON
		},
		{
			name = Engine.Localize( "MENU_OFF" ),
			value = Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_OFF
		}
	}
	return {
		{
			models = {
				name = Engine.Localize( "MENU_MENU_MUSIC" ),
				desc = Engine.Localize( "" ),
				image = RegisterMaterial( "" ),
				optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f18_arg0, "MusicPlayerTrackGlobals_Enabled", f18_local1, f18_local0 ),
				currentSelection = CoD.OptionsUtility.GetProfileSelection( f18_arg0, f18_local1, f18_local0 )
			},
			properties = {
				disabled = false
			}
		}
	}
end, true )
DataSources.MusicTrackOptions_Filters = DataSourceHelpers.ListSetup( "MusicTrackOptions_Filters", function ( f19_arg0 )
	local f19_local0 = {}
	local f19_local1 = Engine.GetModelValue( DataSources.MusicTracksBase.getCurrentFilterModel( f19_arg0 ) )
	for f19_local5, f19_local6 in LUI.IterateTableBySortedKeys( DataSources.MusicTracksBase.completeFiltersList ) do
		table.insert( f19_local0, {
			models = {
				text = f19_local5
			},
			properties = {
				action = UpdateMusicTrackFilters,
				selectIndex = f19_local5 == f19_local1,
				filter = f19_local5
			}
		} )
	end
	return f19_local0
end, true )
DataSources.MusicTracksOptions = DataSourceHelpers.ListSetup( "MusicTracksOptions", function ( f20_arg0 )
	local f20_local0 = {}
	table.insert( f20_local0, {
		models = {
			name = Engine.Localize( "MENU_FILTER_TRACKS" ),
			optionsDatasource = "MusicTrackOptions_Filters"
		},
		properties = {
			disabled = false
		}
	} )
	return f20_local0
end, true )
LUI.createMenu.StartMenu_Options_MusicTracks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_MusicTracks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_MusicTracks.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, -2, -2 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, 64, 591 )
	BlackTint0:setTopBottom( true, false, 86, 684 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MUSIC_TRACKS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MUSIC_TRACKS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( self, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 624, -409 )
	cacItemTitleGlow0:setTopBottom( true, false, 256.13, 286.88 )
	cacItemTitleGlow0:setRGB( 0.89, 0.89, 0.89 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, 591, -359 )
	Glow:setTopBottom( false, false, -124, -51 )
	Glow:setRGB( 0.89, 0.89, 0.89 )
	Glow:setAlpha( 0.25 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ButtonList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 78, 582 )
	ButtonList:setTopBottom( true, false, 204.5, 614.5 )
	ButtonList:setWidgetType( CoD.StartMenu_MusicTracks_CheckBoxOption )
	ButtonList:setVerticalCount( 12 )
	ButtonList:setSpacing( 10 )
	ButtonList:setDataSource( "MusicPlayerTracks" )
	ButtonList:linkToElementModel( ButtonList, "selected", true, function ( model )
		local f22_local0 = ButtonList
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "musicTracksBase.currentFilterSelected" ), function ( model )
		local f23_local0 = ButtonList
		local f23_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "musicTracksBase.currentFilterSelected"
		}
		CoD.Menu.UpdateButtonShownState( f23_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	ButtonList:registerEventHandler( "gain_list_focus", function ( element, event )
		local f24_local0 = nil
		SetMenuState( self, "DefaultState" )
		return f24_local0
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f25_local0 = nil
		if element.gainFocus then
			f25_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f25_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f25_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f26_local0 = nil
		if element.loseFocus then
			f26_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f26_local0 = element.super:loseFocus( event )
		end
		return f26_local0
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "selected" ) then
			ToggleMusicTrackSelected( controller, element, menu )
			return true
		else
			ToggleMusicTrackSelected( controller, element, menu )
			return true
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DESELECT" )
			return true
		end
	end, true )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		PlayMusicTrackPreview( element, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_PLAY_SELECTED_TRACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "A", function ( element, menu, controller, model )
		if ShouldDeselectAllTracks( controller ) then
			DeselectAllMusicTracksInFilter( menu, controller, element )
			return true
		else
			SelectAllMusicTracksInFilter( menu, controller )
			return true
		end
	end, function ( element, menu, controller )
		if ShouldDeselectAllTracks( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_DESELECT_ALL" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SELECT_ALL" )
			return true
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( true, false, 227.5, 427.5 )
	verticalCounter0:setTopBottom( true, false, 618.5, 643.5 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f33_local0 = nil
		SetAsListVerticalCounter( self, element, "ButtonList" )
		if not f33_local0 then
			f33_local0 = element:dispatchEventToChildren( event )
		end
		return f33_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local MissionRecordVaultlines01 = CoD.MissionRecordVault_lines.new( self, controller )
	MissionRecordVaultlines01:setLeftRight( true, true, 626, -409 )
	MissionRecordVaultlines01:setTopBottom( false, true, -485.5, -481.44 )
	MissionRecordVaultlines01:setAlpha( 0.85 )
	self:addElement( MissionRecordVaultlines01 )
	self.MissionRecordVaultlines01 = MissionRecordVaultlines01
	
	local dividerLine = LUI.UIImage.new()
	dividerLine:setLeftRight( true, false, 569, 571 )
	dividerLine:setTopBottom( true, false, 199.5, 592.5 )
	dividerLine:setAlpha( 0 )
	self:addElement( dividerLine )
	self.dividerLine = dividerLine
	
	local infoLabel = LUI.UITightText.new()
	infoLabel:setLeftRight( true, false, 629, 829 )
	infoLabel:setTopBottom( true, false, 259, 284 )
	infoLabel:setRGB( 0, 0, 0 )
	infoLabel:setText( LocalizeToUpperString( "MENU_INFO" ) )
	infoLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	infoLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	infoLabel:setShaderVector( 0, 0, 0, 0, 0 )
	infoLabel:setShaderVector( 1, 0, 0, 0, 0 )
	infoLabel:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( infoLabel )
	self.infoLabel = infoLabel
	
	local trackName = LUI.UITightText.new()
	trackName:setLeftRight( true, false, 629, 829 )
	trackName:setTopBottom( true, false, 293.13, 318.13 )
	trackName:setRGB( 1, 0.38, 0 )
	trackName:setTTF( "fonts/default.ttf" )
	self:addElement( trackName )
	self.trackName = trackName
	
	local artist = LUI.UITightText.new()
	artist:setLeftRight( true, false, 629, 829 )
	artist:setTopBottom( true, false, 317.13, 339.13 )
	artist:setTTF( "fonts/default.ttf" )
	self:addElement( artist )
	self.artist = artist
	
	local trackLength = LUI.UITightText.new()
	trackLength:setLeftRight( true, false, 629, 829 )
	trackLength:setTopBottom( true, false, 340.13, 362.13 )
	trackLength:setTTF( "fonts/default.ttf" )
	self:addElement( trackLength )
	self.trackLength = trackLength
	
	local globalOnOffSwitch = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	globalOnOffSwitch:makeFocusable()
	globalOnOffSwitch:setLeftRight( false, false, -603, 67 )
	globalOnOffSwitch:setTopBottom( true, false, 105, 160 )
	globalOnOffSwitch:setWidgetType( CoD.StartMenu_Options_Slider )
	globalOnOffSwitch:setDataSource( "MusicPlayerTrackGlobals" )
	globalOnOffSwitch:registerEventHandler( "gain_list_focus", function ( element, event )
		local f34_local0 = nil
		SetMenuState( self, "HideInfo" )
		return f34_local0
	end )
	globalOnOffSwitch:registerEventHandler( "gain_focus", function ( element, event )
		local f35_local0 = nil
		if element.gainFocus then
			f35_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f35_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f35_local0
	end )
	globalOnOffSwitch:registerEventHandler( "lose_focus", function ( element, event )
		local f36_local0 = nil
		if element.loseFocus then
			f36_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f36_local0 = element.super:loseFocus( event )
		end
		return f36_local0
	end )
	self:AddButtonCallbackFunction( globalOnOffSwitch, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( globalOnOffSwitch )
	self.globalOnOffSwitch = globalOnOffSwitch
	
	local StartMenuMusicTracksTrackListInfo0 = CoD.StartMenu_MusicTracks_TrackListInfo.new( self, controller )
	StartMenuMusicTracksTrackListInfo0:setLeftRight( true, false, 78, 579 )
	StartMenuMusicTracksTrackListInfo0:setTopBottom( true, false, 169.88, 189.88 )
	StartMenuMusicTracksTrackListInfo0.selectedFilter:setRGB( 0.49, 0.49, 0.49 )
	self:addElement( StartMenuMusicTracksTrackListInfo0 )
	self.StartMenuMusicTracksTrackListInfo0 = StartMenuMusicTracksTrackListInfo0
	
	local playlistBacking = CoD.cac_ItemTitleGlow.new( self, controller )
	playlistBacking:setLeftRight( true, true, 624, -409 )
	playlistBacking:setTopBottom( true, false, 167, 197.75 )
	playlistBacking:setRGB( 0.89, 0.89, 0.89 )
	self:addElement( playlistBacking )
	self.playlistBacking = playlistBacking
	
	local playlistGlow = LUI.UIImage.new()
	playlistGlow:setLeftRight( true, true, 592, -358 )
	playlistGlow:setTopBottom( false, false, -213.13, -140.13 )
	playlistGlow:setRGB( 0.89, 0.89, 0.89 )
	playlistGlow:setAlpha( 0.25 )
	playlistGlow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	playlistGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( playlistGlow )
	self.playlistGlow = playlistGlow
	
	local playListLabel = LUI.UITightText.new()
	playListLabel:setLeftRight( true, false, 629, 680 )
	playListLabel:setTopBottom( true, false, 169.88, 194.88 )
	playListLabel:setRGB( 0, 0, 0 )
	playListLabel:setText( LocalizeToUpperString( "MENU_PLAYLIST" ) )
	playListLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	playListLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	playListLabel:setShaderVector( 0, 0, 0, 0, 0 )
	playListLabel:setShaderVector( 1, 0, 0, 0, 0 )
	playListLabel:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( playListLabel )
	self.playListLabel = playListLabel
	
	local tracksSelectedLabel = LUI.UITightText.new()
	tracksSelectedLabel:setLeftRight( true, false, 629, 719 )
	tracksSelectedLabel:setTopBottom( true, false, 202.75, 222.75 )
	tracksSelectedLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	tracksSelectedLabel:subscribeToGlobalModel( controller, "MusicTracksBase", "selectedTrackCount", function ( model )
		local selectedTrackCount = Engine.GetModelValue( model )
		if selectedTrackCount then
			tracksSelectedLabel:setText( LocalizePlural( "MENU_MUSIC_TRACK_SELECTED", "MENU_MUSIC_TRACKS_SELECTED", selectedTrackCount ) )
		end
	end )
	self:addElement( tracksSelectedLabel )
	self.tracksSelectedLabel = tracksSelectedLabel
	
	local settingDescText = LUI.UIText.new()
	settingDescText:setLeftRight( true, false, 629, 999 )
	settingDescText:setTopBottom( true, false, 226.5, 246.5 )
	settingDescText:setAlpha( 0 )
	settingDescText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	settingDescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	settingDescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	settingDescText:subscribeToGlobalModel( controller, "MusicTracksBase", "settingDesc", function ( model )
		local settingDesc = Engine.GetModelValue( model )
		if settingDesc then
			settingDescText:setText( Engine.Localize( settingDesc ) )
		end
	end )
	self:addElement( settingDescText )
	self.settingDescText = settingDescText
	
	trackName:linkToElementModel( ButtonList, "trackName", true, function ( model )
		local _trackName = Engine.GetModelValue( model )
		if _trackName then
			trackName:setText( LocalizeIntoString( "MENU_TRACK_X", _trackName ) )
		end
	end )
	artist:linkToElementModel( ButtonList, "artist", true, function ( model )
		local _artist = Engine.GetModelValue( model )
		if _artist then
			artist:setText( GetMusicTracksArtist( _artist ) )
		end
	end )
	trackLength:linkToElementModel( ButtonList, "trackLength", true, function ( model )
		local _trackLength = Engine.GetModelValue( model )
		if _trackLength then
			trackLength:setText( LocalizeIntoString( "MENU_LENGTH_X", NumberAsTimeNoMS( _trackLength ) ) )
		end
	end )
	ButtonList.navigation = {
		up = globalOnOffSwitch
	}
	globalOnOffSwitch.navigation = {
		down = ButtonList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 1 )
				self.clipFinished( cacItemTitleGlow0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.25 )
				self.clipFinished( Glow, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setAlpha( 0.85 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				infoLabel:completeAnimation()
				self.infoLabel:setAlpha( 1 )
				self.clipFinished( infoLabel, {} )
				trackName:completeAnimation()
				self.trackName:setAlpha( 1 )
				self.clipFinished( trackName, {} )
				artist:completeAnimation()
				self.artist:setAlpha( 1 )
				self.clipFinished( artist, {} )
				trackLength:completeAnimation()
				self.trackLength:setAlpha( 1 )
				self.clipFinished( trackLength, {} )
				settingDescText:completeAnimation()
				self.settingDescText:setAlpha( 0 )
				self.clipFinished( settingDescText, {} )
			end
		},
		HideInfo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 0 )
				self.clipFinished( cacItemTitleGlow0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setAlpha( 0 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				infoLabel:completeAnimation()
				self.infoLabel:setAlpha( 0 )
				self.clipFinished( infoLabel, {} )
				trackName:completeAnimation()
				self.trackName:setAlpha( 0 )
				self.clipFinished( trackName, {} )
				artist:completeAnimation()
				self.artist:setAlpha( 0 )
				self.clipFinished( artist, {} )
				trackLength:completeAnimation()
				self.trackLength:setAlpha( 0 )
				self.clipFinished( trackLength, {} )
				settingDescText:completeAnimation()
				self.settingDescText:setAlpha( 1 )
				self.clipFinished( settingDescText, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f46_local0 = nil
		StopFrontendMusicForMusicTracks( "" )
		if not f46_local0 then
			f46_local0 = self:dispatchEventToChildren( event )
		end
		return f46_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		OpenPopup( self, "StartMenu_Options_MusicTracks_Options", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ResumeFrontendMusicForMusicTracks( self )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "profile.snd_frontendTracksState", function ( model )
		local f52_local0 = self
		if IsModelValueEqualToEnum( controller, "profile.snd_frontendTracksState", Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON ) then
			MakeElementFocusable( self, "ButtonList", controller )
			UpdateMusicTrackGlobalSetting( controller )
		else
			MakeElementNotFocusable( self, "ButtonList", controller )
			UpdateMusicTrackGlobalSetting( controller )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	ButtonList.id = "ButtonList"
	globalOnOffSwitch.id = "globalOnOffSwitch"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.FEMenuLeftGraphics0:close()
		element.cacItemTitleGlow0:close()
		element.ButtonList:close()
		element.verticalCounter0:close()
		element.MissionRecordVaultlines01:close()
		element.globalOnOffSwitch:close()
		element.StartMenuMusicTracksTrackListInfo0:close()
		element.playlistBacking:close()
		element.trackName:close()
		element.artist:close()
		element.trackLength:close()
		element.tracksSelectedLabel:close()
		element.settingDescText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_MusicTracks.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

