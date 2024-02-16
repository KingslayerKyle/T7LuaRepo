-- d2c82904ae035be545e59cebd40957f6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Button" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar" )

local f0_local0 = function ()
	local f1_local0 = Dvar.loc_language:get()
	if f1_local0 == CoD.LANGUAGE_ENGLISH or f1_local0 == CoD.LANGUAGE_ENGLISHARABIC or f1_local0 == CoD.LANGUAGE_POLISH or f1_local0 == CoD.LANGUAGE_ARABIC or f1_local0 == CoD.LANGUAGE_TRADITIONALCHINESE or f1_local0 == CoD.LANGUAGE_SIMPLIFIEDCHINESE or f1_local0 == CoD.LANGUAGE_JAPANESE or f1_local0 == CoD.LANGUAGE_FULLJAPANESE then
		return true
	else
		return false
	end
end

DataSources.OptionPCSoundPresets = DataSourceHelpers.ListSetup( "PC.OptionPCSoundPresets", function ( f2_arg0 )
	local f2_local0 = {}
	table.insert( f2_local0, {
		models = {
			value = CoD.AudioSettings.TREYARCH_MIX,
			valueDisplay = "MENU_TREYARCH_MIX"
		}
	} )
	table.insert( f2_local0, {
		models = {
			value = CoD.AudioSettings.BASS_BOOST,
			valueDisplay = "MENU_BASS_BOOST"
		}
	} )
	table.insert( f2_local0, {
		models = {
			value = CoD.AudioSettings.HIGH_BOOST,
			valueDisplay = "MENU_HIGH_BOOST"
		}
	} )
	table.insert( f2_local0, {
		models = {
			value = CoD.AudioSettings.SUPERCRUNCH,
			valueDisplay = "MENU_SUPERCRUNCH"
		}
	} )
	table.insert( f2_local0, {
		models = {
			value = CoD.AudioSettings.HEADPHONES,
			valueDisplay = "MENU_HEADPHONES"
		}
	} )
	return f2_local0
end, true )
DataSources.OptionPCMPDialog = DataSourceHelpers.ListSetup( "PC.OptionPCMPDialog", function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, {
		models = {
			value = 1,
			valueDisplay = "MENU_ENABLED"
		}
	} )
	table.insert( f3_local0, {
		models = {
			value = 0,
			valueDisplay = "MENU_DISABLED"
		}
	} )
	return f3_local0
end, true )
DataSources.OptionPCMPMusic = DataSourceHelpers.ListSetup( "PC.OptionPCMPMusic", function ( f4_arg0 )
	local f4_local0 = {}
	table.insert( f4_local0, {
		models = {
			value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_NONE,
			valueDisplay = Engine.Localize( "MENU_NONE" )
		}
	} )
	table.insert( f4_local0, {
		models = {
			value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_DEFAULT,
			valueDisplay = Engine.Localize( "MENU_DEFAULT" )
		}
	} )
	table.insert( f4_local0, {
		models = {
			value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_RANDOM,
			valueDisplay = Engine.Localize( "MENU_RANDOM" )
		}
	} )
	local f4_local1 = CoD.getStatsMilestoneTable( 4, Enum.eModes.MODE_CAMPAIGN )
	for f4_local5, f4_local6 in ipairs( Engine.TableFindRows( f4_local1, 3, "MP" ) or {} ) do
		local f4_local7 = Engine.TableLookupGetColumnValueForRow( f4_local1, f4_local6, 0 )
		local f4_local8 = Engine.TableLookupGetColumnValueForRow( f4_local1, f4_local6, 1 )
		local f4_local9 = Engine.TableLookupGetColumnValueForRow( f4_local1, f4_local6, 2 )
		if f4_local8 == "" and f4_local9 ~= "" then
			table.insert( f4_local0, {
				models = {
					value = Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_FIRST_TRACK + f4_local7,
					valueDisplay = Engine.TableLookup( nil, CoD.musicPlayerTable, 1, f4_local9, 2 ),
					alias = f4_local9
				}
			} )
		end
	end
	return f4_local0
end, true )
DataSources.OptionPCSoundSubtitles = DataSourceHelpers.ListSetup( "PC.OptionPCSoundSubtitles", function ( f5_arg0 )
	local f5_local0 = {}
	table.insert( f5_local0, {
		models = {
			value = 0,
			valueDisplay = "MENU_OFF"
		}
	} )
	table.insert( f5_local0, {
		models = {
			value = 1,
			valueDisplay = "MENU_ON"
		}
	} )
	return f5_local0
end, true )
DataSources.OptionSoundSound = DataSourceHelpers.ListSetup( "PC.OptionSoundSound", function ( f6_arg0 )
	local f6_local0 = {}
	table.insert( f6_local0, {
		models = {
			label = "MENU_MASTER_VOLUME",
			description = "MENU_MASTER_VOLUME_DESC",
			profileVarName = "snd_menu_master",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f6_local0, {
		models = {
			label = "MENU_VOICE_VOLUME",
			description = "MENU_VOICE_VOLUME_DESC",
			profileVarName = "snd_menu_voice",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f6_local0, {
		models = {
			label = "MENU_MUSIC_VOLUME",
			description = "MENU_MUSIC_VOLUME_DESC",
			profileVarName = "snd_menu_music",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f6_local0, {
		models = {
			label = "MENU_SFX_VOLUME",
			description = "MENU_SFX_VOLUME_DESC",
			profileVarName = "snd_menu_sfx",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f6_local0, {
		models = {
			label = "MENU_CINEMATICS_VOLUME",
			description = "MENU_CINEMATICS_VOLUME_DESC",
			profileVarName = "snd_menu_cinematic",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f6_local0, {
		models = {
			label = "MENU_AUDIO_PRESETS",
			description = "MENU_AUDIO_PRESETS_DESC",
			profileVarName = "snd_menu_presets",
			profileType = "user",
			datasource = "OptionPCSoundPresets",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	if not IsInGame() then
		table.insert( f6_local0, {
			models = {
				label = "MENU_SYSTEM_TEST",
				description = "MENU_SYSTEM_TEST_DESC",
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( f7_arg0, f7_arg1 )
					Engine.PlaySound( "tst_test_system" )
				end
			}
		} )
	end
	table.insert( f6_local0, {
		models = {
			label = "MENU_MP_DIALOG",
			description = "MENU_MP_DIALOG_DESC",
			profileVarName = "snd_multiplayer_character_voice",
			profileType = "user",
			datasource = "OptionPCMPDialog",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f6_local0, {
		models = {
			label = "MENU_MP_MUSIC",
			description = "MENU_MP_MUSIC_DESC",
			profileVarName = "snd_multiplayer_music_track",
			profileType = "user",
			datasource = "OptionPCMPMusic",
			widgetType = "dropdown",
			disabledFunction = function ()
				return IsInGame()
			end
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	if f0_local0() then
		table.insert( f6_local0, {
			models = {
				label = "MENU_SUBTITLES",
				description = "MENU_SUBTITLES_DESC",
				profileVarName = "cg_subtitles",
				profileType = "user",
				datasource = "OptionPCSoundSubtitles",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
	end
	return f6_local0
end, true )
DataSources.OptionSoundSound.getWidgetTypeForItem = function ( f9_arg0, f9_arg1, f9_arg2 )
	if f9_arg1 then
		local f9_local0 = Engine.GetModelValue( Engine.GetModel( f9_arg1, "widgetType" ) )
		if f9_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f9_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f9_local0 == "button" then
			return CoD.StartMenu_Options_Button
		end
	end
	return nil
end

local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
end

local PostLoadFunc = function ( f11_arg0, f11_arg1 )
	f11_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f11_arg1
	} )
	f11_arg0.graphicsList.m_managedItemPriority = true
	f11_arg0:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f12_local0 = 1, element.graphicsList.requestedRowCount, 1 do
			local f12_local3 = element.graphicsList:getItemAtPosition( f12_local0, 1 )
			if event.inUse then
				if f12_local3 ~= event.widget then
					f12_local3.m_inputDisabled = true
				end
			end
			f12_local3.m_inputDisabled = nil
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( f11_arg0, "close", function ()
		Engine.ApplyHardwareProfileSettings()
	end )
end

LUI.createMenu.StartMenu_Options_Sound_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Sound_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound_PC.buttonPrompts" )
	local f14_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( f14_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_AUDIO_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_AUDIO_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( f14_local1, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local graphicsList = LUI.UIList.new( f14_local1, controller, 0, 0, nil, false, false, 0, 0, false, false )
	graphicsList:makeFocusable()
	graphicsList:setLeftRight( true, false, 64, 564 )
	graphicsList:setTopBottom( true, false, 132, 608 )
	graphicsList:setDataSource( "OptionSoundSound" )
	graphicsList:setWidgetType( CoD.OptionDropdown )
	graphicsList:setVerticalCount( 14 )
	graphicsList:setSpacing( 0 )
	self:addElement( graphicsList )
	self.graphicsList = graphicsList
	
	local optionInfo = CoD.OptionInfoWidget.new( f14_local1, controller )
	optionInfo:setLeftRight( true, false, 640, 1040 )
	optionInfo:setTopBottom( true, false, 132, 432 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	optionInfo:linkToElementModel( graphicsList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			optionInfo.description:setText( Engine.Localize( description ) )
		end
	end )
	optionInfo:linkToElementModel( graphicsList, "label", true, function ( model )
		local label = Engine.GetModelValue( model )
		if label then
			optionInfo.title.itemName:setText( Engine.Localize( label ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f17_local0 = nil
		ShowHeaderIconOnly( f14_local1 )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	f14_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		GoBack( self, f18_arg2 )
		UpdateGamerprofile( self, f18_arg0, f18_arg2 )
		StopSoundAlias( "tst_test_system" )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f14_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		CloseStartMenu( f20_arg1, f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	f14_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		return true
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	graphicsList.id = "graphicsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f14_local1
	} )
	if not self:restoreState() then
		self.graphicsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.StartMenulineGraphicsOptions0:close()
		element.graphicsList:close()
		element.optionInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

