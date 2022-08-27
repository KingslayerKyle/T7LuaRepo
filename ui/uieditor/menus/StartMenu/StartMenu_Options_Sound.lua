-- 72bb4174398cca074585dfeb468071d9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

CoD.AudioSettings = {}
CoD.AudioSettings.AdjustSFX = "uin_loadout_nav"
CoD.AudioSettings.CycleSFX = "cac_grid_nav"
CoD.AudioSettings.TREYARCH_MIX = 0
CoD.AudioSettings.BASS_BOOST = 1
CoD.AudioSettings.HIGH_BOOST = 2
CoD.AudioSettings.SUPERCRUNCH = 3
CoD.AudioSettings.HEADPHONES = 4
CoD.AudioSettings.CreateModels_Volume = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6 )
	local f1_local0 = {
		{
			name = Engine.Localize( "0" ),
			value = 0
		},
		{
			name = Engine.Localize( "1" ),
			value = 0.1
		},
		{
			name = Engine.Localize( "2" ),
			value = 0.2
		},
		{
			name = Engine.Localize( "3" ),
			value = 0.3
		},
		{
			name = Engine.Localize( "4" ),
			value = 0.4
		},
		{
			name = Engine.Localize( "5" ),
			value = 0.5
		},
		{
			name = Engine.Localize( "6" ),
			value = 0.6
		},
		{
			name = Engine.Localize( "7" ),
			value = 0.7
		},
		{
			name = Engine.Localize( "8" ),
			value = 0.8
		},
		{
			name = Engine.Localize( "9" ),
			value = 0.9
		},
		{
			name = Engine.Localize( "10" ),
			value = 1
		}
	}
	return {
		models = {
			name = Engine.Localize( f1_arg1 ),
			desc = Engine.Localize( f1_arg2 ),
			image = RegisterMaterial( f1_arg3 ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f1_arg0, "AudioOptions_Volume_" .. f1_arg4, f1_local0, f1_arg5 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f1_arg0, f1_local0, f1_arg5 )
		},
		properties = {
			disabled = f1_arg6
		}
	}
end

local f0_local0 = function ( f2_arg0 )
	local f2_local0 = "snd_menu_presets"
	local f2_local1 = {
		{
			name = Engine.Localize( "MENU_TREYARCH_MIX" ),
			desc = Engine.Localize( "MENU_TREYARCH_MIX_DESC" ),
			value = CoD.AudioSettings.TREYARCH_MIX
		},
		{
			name = Engine.Localize( "MENU_BASS_BOOST" ),
			desc = Engine.Localize( "MENU_BASS_BOOST_DESC" ),
			value = CoD.AudioSettings.BASS_BOOST
		},
		{
			name = Engine.Localize( "MENU_HIGH_BOOST" ),
			desc = Engine.Localize( "MENU_HIGH_BOOST_DESC" ),
			value = CoD.AudioSettings.HIGH_BOOST
		},
		{
			name = Engine.Localize( "MENU_SUPERCRUNCH" ),
			desc = Engine.Localize( "MENU_SUPERCRUNCH_DESC" ),
			value = CoD.AudioSettings.SUPERCRUNCH
		},
		{
			name = Engine.Localize( "MENU_HEADPHONES" ),
			desc = Engine.Localize( "MENU_HEADPHONES_DESC" ),
			value = CoD.AudioSettings.HEADPHONES
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_AUDIO_PRESETS" ),
			desc = Engine.Localize( "MENU_AUDIO_PRESETS_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f2_arg0, "AudioOptions_Presets", f2_local1, f2_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f2_arg0, f2_local1, f2_local0 )
		},
		properties = {}
	}
end

local f0_local1 = function ( f3_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_SYSTEM_TEST" ),
			desc = Engine.Localize( "MENU_SYSTEM_TEST_DESC" ),
			image = RegisterMaterial( "" ),
			altText = "MENU_PLAY_TEST"
		},
		properties = {
			hideArrows = true,
			action = function ( f4_arg0 )
				Engine.PlaySound( "tst_test_system" )
			end
			
		}
	}
end

local f0_local2 = function ()
	local f5_local0 = Dvar.loc_language:get()
	if f5_local0 == CoD.LANGUAGE_ENGLISH or f5_local0 == CoD.LANGUAGE_POLISH or f5_local0 == CoD.LANGUAGE_ARABIC or f5_local0 == CoD.LANGUAGE_ENGLISHARABIC or f5_local0 == CoD.LANGUAGE_TRADITIONALCHINESE or f5_local0 == CoD.LANGUAGE_SIMPLIFIEDCHINESE or f5_local0 == CoD.LANGUAGE_JAPANESE or f5_local0 == CoD.LANGUAGE_FULLJAPANESE then
		return true
	else
		return false
	end
end

local f0_local3 = function ( f6_arg0 )
	local f6_local0 = "cg_subtitles"
	local f6_local1 = {
		{
			name = Engine.Localize( "MENU_OFF" ),
			desc = Engine.Localize( "MENU_DISABLED_CAPS" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ON" ),
			desc = Engine.Localize( "MENU_ENABLED_CAPS" ),
			value = 1
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_SUBTITLES" ),
			desc = Engine.Localize( "MENU_SUBTITLES_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f6_arg0, "AudioOptions_Subtitles", f6_local1, f6_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f6_arg0, f6_local1, f6_local0 )
		},
		properties = {}
	}
end

local f0_local4 = function ( f7_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_CHOOSE_LANGUAGE" ),
			desc = Engine.Localize( "MENU_CHOOSE_LANGUAGE_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f7_arg0, "AudioOptions_LanguageSelection", {
				{
					name = Engine.Localize( "MENU_LANGUAGE_SELECTION" ),
					value = Engine.Localize( "MENU_LANGUAGE_SELECTION" )
				}
			} )
		},
		properties = {
			hideArrows = true,
			action = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
				OpenOverlay( f8_arg4, "FirstTimeLanguageSelectionSetting", f8_arg2 )
			end
			
		}
	}
end

local f0_local5 = function ( f9_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_ADVANCED_VOLUME" ),
			desc = Engine.Localize( "MENU_ADVANCED_VOLUME_DESC" ),
			altText = "MENU_CHANGE",
			image = RegisterMaterial( "" ),
			action = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
				NavigateToMenu( f10_arg4, "StartMenu_Options_Sound_Advanced", true, f10_arg2 )
			end
			
		},
		properties = {
			disabled = false
		}
	}
end

CoD.AudioSettings.CreateModels_MultiplayerMusicTrack = function ( f11_arg0 )
	local f11_local0 = "snd_multiplayer_music_track"
	local f11_local1 = CoD.getStatsMilestoneTable( 4, Enum.eModes.MODE_CAMPAIGN )
	local f11_local2 = {
		{
			name = Engine.Localize( "MENU_NONE" ),
			value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_NONE,
			customModels = {
				alias = ""
			}
		},
		{
			name = Engine.Localize( "MENU_DEFAULT" ),
			value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_DEFAULT,
			customModels = {
				alias = ""
			}
		},
		{
			name = Engine.Localize( "MENU_RANDOM" ),
			value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_RANDOM,
			customModels = {
				alias = ""
			}
		}
	}
	for f11_local6, f11_local7 in ipairs( Engine.TableFindRows( f11_local1, 3, "MP" ) or {} ) do
		local f11_local8 = Engine.TableLookupGetColumnValueForRow( f11_local1, f11_local7, 0 )
		local f11_local9 = Engine.TableLookupGetColumnValueForRow( f11_local1, f11_local7, 1 )
		local f11_local10 = Engine.TableLookupGetColumnValueForRow( f11_local1, f11_local7, 2 )
		if f11_local9 == "" and f11_local10 ~= "" then
			table.insert( f11_local2, {
				name = Engine.TableLookup( nil, CoD.musicPlayerTable, 1, f11_local10, 2 ),
				value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_FIRST_TRACK + f11_local8,
				customModels = {
					alias = f11_local10
				}
			} )
		end
	end
	return {
		models = {
			name = Engine.Localize( "MENU_MP_MUSIC" ),
			desc = Engine.Localize( "MENU_MP_MUSIC_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f11_arg0, "AudioOptions_MultiplayerMusicTrack", f11_local2, f11_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f11_arg0, f11_local2, f11_local0 )
		},
		properties = {
			disabled = IsInGame()
		}
	}
end

DataSources.OptionSoundList = DataSourceHelpers.ListSetup( "OptionSoundList", function ( f12_arg0 )
	local f12_local0 = {}
	table.insert( f12_local0, CoD.AudioSettings.CreateModels_Volume( f12_arg0, "MENU_MASTER_VOLUME", "MENU_MASTER_VOLUME_DESC", "", "Master", "snd_menu_master" ) )
	table.insert( f12_local0, f0_local5( f12_arg0 ) )
	if IsOrbis() then
		table.insert( f12_local0, CoD.OptionsUtility.CreateEnabledDisabledProfileVar( f12_arg0, "MENU_CONTROLLER_SOUND", "MENU_CONTROLLER_SOUND_DESC", "snd_controller_sounds", "Sound_ControllerSounds" ) )
	end
	table.insert( f12_local0, f0_local0( f12_arg0 ) )
	if not IsInGame() then
		table.insert( f12_local0, f0_local1( f12_arg0 ) )
	end
	table.insert( f12_local0, CoD.OptionsUtility.CreateEnabledDisabledProfileVar( f12_arg0, "MENU_MP_DIALOG", "MENU_MP_DIALOG_DESC", "snd_multiplayer_character_voice", "Sound_MPDialog" ) )
	table.insert( f12_local0, CoD.AudioSettings.CreateModels_MultiplayerMusicTrack( f12_arg0 ) )
	if ShouldDisplayLanguageSelectionScreen() then
		table.insert( f12_local0, f0_local4( f12_arg0 ) )
	end
	if f0_local2() then
		table.insert( f12_local0, f0_local3( f12_arg0 ) )
	end
	return f12_local0
end, true )
LUI.createMenu.StartMenu_Options_Sound = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Sound" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound.buttonPrompts" )
	local f13_local1 = self
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
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( false, false, 133, 380 )
	Desc:setTopBottom( true, false, 184, 206 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( false, false, -651, 653 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ButtonList = LUI.UIList.new( f13_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -608, 62 )
	ButtonList:setTopBottom( true, false, 137.5, 648.5 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "OptionSoundList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	f13_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		ProcessListAction( self, f16_arg0, f16_arg2 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( f13_local1, controller )
	StartMenuOptionIconContainer:setLeftRight( false, false, 18, 125 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 140, 246 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, -11, 13 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( f13_local1, controller )
	StartMenuOptionHighlight:setLeftRight( false, false, 133, 279 )
	StartMenuOptionHighlight:setTopBottom( true, false, 137.5, 177.5 )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local MenuFrame = CoD.GenericMenuFrame.new( f13_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( f13_local1, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			Desc:setText( Engine.Localize( desc ) )
		end
	end )
	StartMenuOptionHighlight:linkToElementModel( ButtonList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( name ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f20_local0 = nil
		ShowHeaderIconOnly( f13_local1 )
		if not f20_local0 then
			f20_local0 = element:dispatchEventToChildren( event )
		end
		return f20_local0
	end )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		GoBack( self, f21_arg2 )
		UpdateGamerprofile( self, f21_arg0, f21_arg2 )
		StopSoundAlias( "tst_test_system" )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	ButtonList.id = "ButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f13_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.StartMenuOptionIconContainer:close()
		element.StartMenuOptionHighlight:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics0:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

