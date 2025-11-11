require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )

CoD.AudioSettings = {}
CoD.AudioSettings.AdjustSFX = "uin_loadout_nav"
CoD.AudioSettings.CycleSFX = "cac_grid_nav"
CoD.AudioSettings.TREYARCH_MIX = 0
CoD.AudioSettings.BASS_BOOST = 1
CoD.AudioSettings.HIGH_BOOST = 2
CoD.AudioSettings.SUPERCRUNCH = 3
CoD.AudioSettings.HEADPHONES = 4
CoD.AudioSettings.CreateModels_Volume = function ( controller, name, desc, image, modelName, profileStat, disabled )
	local options = {
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
	local listInfo = {
		models = {
			name = Engine.Localize( name ),
			desc = Engine.Localize( desc ),
			image = RegisterMaterial( image ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "AudioOptions_Volume_" .. modelName, options, profileStat ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileStat )
		},
		properties = {
			disabled = disabled
		}
	}
	return listInfo
end

local CreateModels_Presets = function ( controller )
	local profileStat = "snd_menu_presets"
	local options = {
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
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_AUDIO_PRESETS" ),
			desc = Engine.Localize( "MENU_AUDIO_PRESETS_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "AudioOptions_Presets", options, profileStat ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileStat )
		},
		properties = {}
	}
	return listInfo
end

local CreateModels_SystemTest = function ( controller )
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_SYSTEM_TEST" ),
			desc = Engine.Localize( "MENU_SYSTEM_TEST_DESC" ),
			image = RegisterMaterial( "" ),
			altText = "MENU_PLAY_TEST"
		},
		properties = {
			hideArrows = true,
			action = function ( controller )
				Engine.PlaySound( "tst_test_system" )
			end
		}
	}
	return listInfo
end

local Sound_SupportsSubtitles = function ()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == Enum.language_t.LANGUAGE_ENGLISH or currentLanguage == Enum.language_t.LANGUAGE_POLISH or currentLanguage == Enum.language_t.LANGUAGE_ARABIC or currentLanguage == Enum.language_t.LANGUAGE_ENGLISHARABIC or currentLanguage == Enum.language_t.LANGUAGE_TRADITIONALCHINESE or currentLanguage == Enum.language_t.LANGUAGE_SIMPLIFIEDCHINESE or currentLanguage == Enum.language_t.LANGUAGE_JAPANESE or currentLanguage == Enum.language_t.LANGUAGE_FULLJAPANESE then
		return true
	else
		return false
	end
end

local CreateModels_Subtitles = function ( controller )
	local profileStat = "cg_subtitles"
	local options = {
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
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_SUBTITLES" ),
			desc = Engine.Localize( "MENU_SUBTITLES_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "AudioOptions_Subtitles", options, profileStat ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileStat )
		},
		properties = {}
	}
	return listInfo
end

local CreateModels_LanguageSelection = function ( controller )
	local options = {
		{
			name = Engine.Localize( "MENU_LANGUAGE_SELECTION" ),
			value = Engine.Localize( "MENU_LANGUAGE_SELECTION" )
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_CHOOSE_LANGUAGE" ),
			desc = Engine.Localize( "MENU_CHOOSE_LANGUAGE_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "AudioOptions_LanguageSelection", options )
		},
		properties = {
			hideArrows = true,
			action = function ( self, element, controller, actionParam, menu )
				OpenOverlay( menu, "FirstTimeLanguageSelectionSetting", controller )
			end
		}
	}
	return listInfo
end

local CreateModels_AdvancedSoundOptions = function ( controller )
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_ADVANCED_VOLUME" ),
			desc = Engine.Localize( "MENU_ADVANCED_VOLUME_DESC" ),
			altText = "MENU_CHANGE",
			image = RegisterMaterial( "" ),
			action = function ( self, element, controller, param, menu )
				NavigateToMenu( menu, "StartMenu_Options_Sound_Advanced", true, controller )
			end
		},
		properties = {
			disabled = false
		}
	}
	return listInfo
end

CoD.AudioSettings.CreateModels_MultiplayerMusicTrack = function ( controller )
	local profileStat = "snd_multiplayer_music_track"
	local musicTable = CoD.getStatsMilestoneTable( 4, Enum.eModes.MODE_CAMPAIGN )
	local options = {
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
	local mpMusicRows = Engine.TableFindRows( musicTable, 3, "MP" ) or {}
	for _, row in ipairs( mpMusicRows ) do
		local index = Engine.TableLookupGetColumnValueForRow( musicTable, row, 0 )
		local default = Engine.TableLookupGetColumnValueForRow( musicTable, row, 1 )
		local alias = Engine.TableLookupGetColumnValueForRow( musicTable, row, 2 )
		if default == "" and alias ~= "" then
			local displayName = Engine.TableLookup( CoD.musicPlayerTable, 1, 0, alias )
			table.insert( options, {
				name = displayName,
				value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_FIRST_TRACK + index,
				customModels = {
					alias = alias
				}
			} )
		end
	end
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_MP_MUSIC" ),
			desc = Engine.Localize( "MENU_MP_MUSIC_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "AudioOptions_MultiplayerMusicTrack", options, profileStat ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileStat )
		},
		properties = {
			disabled = IsInGame()
		}
	}
	return listInfo
end

local PrepareSoundOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CoD.AudioSettings.CreateModels_Volume( controller, "MENU_MASTER_VOLUME", "MENU_MASTER_VOLUME_DESC", "", "Master", "snd_menu_master" ) )
	table.insert( optionsTable, CreateModels_AdvancedSoundOptions( controller ) )
	if IsOrbis() then
		table.insert( optionsTable, CoD.OptionsUtility.CreateEnabledDisabledProfileVar( controller, "MENU_CONTROLLER_SOUND", "MENU_CONTROLLER_SOUND_DESC", "snd_controller_sounds", "Sound_ControllerSounds" ) )
	end
	table.insert( optionsTable, CreateModels_Presets( controller ) )
	if not IsInGame() then
		table.insert( optionsTable, CreateModels_SystemTest( controller ) )
	end
	table.insert( optionsTable, CoD.OptionsUtility.CreateEnabledDisabledProfileVar( controller, "MENU_MP_DIALOG", "MENU_MP_DIALOG_DESC", "snd_multiplayer_character_voice", "Sound_MPDialog" ) )
	table.insert( optionsTable, CoD.AudioSettings.CreateModels_MultiplayerMusicTrack( controller ) )
	if ShouldDisplayLanguageSelectionScreen() then
		table.insert( optionsTable, CreateModels_LanguageSelection( controller ) )
	end
	if Sound_SupportsSubtitles() then
		table.insert( optionsTable, CreateModels_Subtitles( controller ) )
	end
	return optionsTable
end

DataSources.OptionSoundList = DataSourceHelpers.ListSetup( "OptionSoundList", PrepareSoundOptions, true )
LUI.createMenu.StartMenu_Options_Sound = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Sound" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, -3, -3 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( 0.5, 0.5, 200, 570 )
	Desc:setTopBottom( 0, 0, 276, 309 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0.5, 0.5, -976, 980 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0.5, 0.5, -912, 93 )
	ButtonList:setTopBottom( 0, 0, 213, 967 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "OptionSoundList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( 0.5, 0.5, 27, 187 )
	StartMenuOptionIconContainer:setTopBottom( 0, 0, 210, 369 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( 0.5, 0.5, 200, 419 )
	StartMenuOptionHighlight:setTopBottom( 0, 0, 206, 266 )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics0:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Desc:setText( Engine.Localize( modelValue ) )
		end
	end )
	StartMenuOptionHighlight:linkToElementModel( ButtonList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		StopSoundAlias( "tst_test_system" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.StartMenuOptionIconContainer:close()
		self.StartMenuOptionHighlight:close()
		self.MenuFrame:close()
		self.FEMenuLeftGraphics0:close()
		self.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

