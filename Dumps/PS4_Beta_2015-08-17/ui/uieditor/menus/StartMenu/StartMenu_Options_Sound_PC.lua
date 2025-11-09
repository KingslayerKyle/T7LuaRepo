require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.SoundOptions.StartMenu_Options_PC_Sound_Sound" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Button" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar" )

CoD.AudioSettings = {}
CoD.AudioSettings.AdjustSFX = "uin_loadout_nav"
CoD.AudioSettings.CycleSFX = "cac_grid_nav"
CoD.AudioSettings.TREYARCH_MIX = 0
CoD.AudioSettings.BASS_BOOST = 1
CoD.AudioSettings.HIGH_BOOST = 2
CoD.AudioSettings.SUPERCRUNCH = 3
CoD.AudioSettings.HEADPHONES = 4
local Sound_SupportsSubtitles = function ()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == CoD.LANGUAGE_ENGLISH or currentLanguage == CoD.LANGUAGE_BRITISH or currentLanguage == CoD.LANGUAGE_POLISH or currentLanguage == CoD.LANGUAGE_JAPANESE or currentLanguage == CoD.LANGUAGE_FULLJAPANESE then
		return true
	else
		return false
	end
end

DataSources.OptionPCSoundPresets = DataSourceHelpers.ListSetup( "PC.OptionPCSoundPresets", function ( controller )
	local presetOptions = {}
	table.insert( presetOptions, {
		models = {
			value = CoD.AudioSettings.TREYARCH_MIX,
			valueDisplay = "MENU_TREYARCH_MIX"
		}
	} )
	table.insert( presetOptions, {
		models = {
			value = CoD.AudioSettings.BASS_BOOST,
			valueDisplay = "MENU_BASS_BOOST"
		}
	} )
	table.insert( presetOptions, {
		models = {
			value = CoD.AudioSettings.HIGH_BOOST,
			valueDisplay = "MENU_HIGH_BOOST"
		}
	} )
	table.insert( presetOptions, {
		models = {
			value = CoD.AudioSettings.SUPERCRUNCH,
			valueDisplay = "MENU_SUPERCRUNCH"
		}
	} )
	table.insert( presetOptions, {
		models = {
			value = CoD.AudioSettings.HEADPHONES,
			valueDisplay = "MENU_HEADPHONES"
		}
	} )
	return presetOptions
end, true )
DataSources.OptionPCSoundSubtitles = DataSourceHelpers.ListSetup( "PC.OptionPCSoundSubtitles", function ( controller )
	local subtitleOptions = {}
	table.insert( subtitleOptions, {
		models = {
			value = 0,
			valueDisplay = "MENU_OFF"
		}
	} )
	table.insert( subtitleOptions, {
		models = {
			value = 1,
			valueDisplay = "MENU_ON"
		}
	} )
	return subtitleOptions
end, true )
DataSources.OptionSoundSound = DataSourceHelpers.ListSetup( "PC.OptionSoundSound", function ( controller )
	local soundSettings = {}
	table.insert( soundSettings, {
		models = {
			label = "MENU_VOICE_VOLUME",
			description = "MENU_VOICE_VOLUME_DESC",
			profileVarName = "snd_menu_voice",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider",
			sliderSpeed = 0.02
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( soundSettings, {
		models = {
			label = "MENU_MUSIC_VOLUME",
			description = "MENU_MUSIC_VOLUME_DESC",
			profileVarName = "snd_menu_music",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider",
			sliderSpeed = 0.02
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( soundSettings, {
		models = {
			label = "MENU_SFX_VOLUME",
			description = "MENU_SFX_VOLUME_DESC",
			profileVarName = "snd_menu_sfx",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider",
			sliderSpeed = 0.02
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( soundSettings, {
		models = {
			label = "MENU_MASTER_VOLUME",
			description = "MENU_MASTER_VOLUME_DESC",
			profileVarName = "snd_menu_master",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider",
			sliderSpeed = 0.02
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( soundSettings, {
		models = {
			label = "MENU_CINEMATICS_VOLUME",
			description = "MENU_CINEMATICS_VOLUME_DESC",
			profileVarName = "snd_menu_cinematic",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider",
			sliderSpeed = 0.02
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( soundSettings, {
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
	table.insert( soundSettings, {
		models = {
			label = "MENU_SYSTEM_TEST",
			description = "MENU_SYSTEM_TEST_DESC",
			profileType = "user",
			widgetType = "button",
			onPressFn = function ( self, controller )
				Engine.PlaySound( "tst_test_system" )
			end
		}
	} )
	if Sound_SupportsSubtitles() then
		table.insert( soundSettings, {
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
	return soundSettings
end, true )
DataSources.OptionSoundSound.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "dropdown" then
			return CoD.OptionDropdown
		elseif widgetType == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif widgetType == "button" then
			return CoD.StartMenu_Options_Button
		end
	end
	return nil
end

DataSources.OptionSoundCategories = DataSourceHelpers.ListSetup( "PC.OptionSoundCategories", function ( controller )
	local categoryList = {}
	table.insert( categoryList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "MENU_SOUND_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Sound_Sound"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return categoryList
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
end

local PostLoadFunc = function ( self, controller )
	self.categoryFrame:setForceMouseEventDispatch( true )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound_PC.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs.grid:setDataSource( "OptionSoundCategories" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local categoryFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	categoryFrame:setLeftRight( true, false, 64, 1216 )
	categoryFrame:setTopBottom( true, false, 134.22, 657 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	categoryFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryFrame:changeFrameWidget( modelValue )
		end
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
		CloseStartMenu( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	categoryFrame.id = "categoryFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.categoryFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MenuFrame:close()
		self.StartMenulineGraphicsOptions0:close()
		self.Tabs:close()
		self.categoryFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

