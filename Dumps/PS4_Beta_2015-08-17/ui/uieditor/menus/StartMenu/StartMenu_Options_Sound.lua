require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

CoD.AudioSettings = {}
CoD.AudioSettings.AdjustSFX = "uin_loadout_nav"
CoD.AudioSettings.CycleSFX = "cac_grid_nav"
CoD.AudioSettings.TREYARCH_MIX = 0
CoD.AudioSettings.BASS_BOOST = 1
CoD.AudioSettings.HIGH_BOOST = 2
CoD.AudioSettings.SUPERCRUNCH = 3
CoD.AudioSettings.HEADPHONES = 4
local CreateModels_Volume = function ( controller, name, desc, image, modelName, profileStat, disabled )
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
			image = RegisterMaterial( "" )
		},
		properties = {
			action = function ( controller )
				Engine.PlaySound( "tst_test_system" )
			end
		}
	}
	return listInfo
end

local Sound_SupportsSubtitles = function ()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == CoD.LANGUAGE_ENGLISH or currentLanguage == CoD.LANGUAGE_BRITISH or currentLanguage == CoD.LANGUAGE_POLISH or currentLanguage == CoD.LANGUAGE_JAPANESE or currentLanguage == CoD.LANGUAGE_FULLJAPANESE then
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

local PrepareSoundOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_VOICE_VOLUME", "MENU_VOICE_VOLUME_DESC", "", "Voice", "snd_menu_voice" ) )
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_MUSIC_VOLUME", "MENU_MUSIC_VOLUME_DESC", "", "Music", "snd_menu_music" ) )
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_SFX_VOLUME", "MENU_SFX_VOLUME_DESC", "", "SFX", "snd_menu_sfx" ) )
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_MASTER_VOLUME", "MENU_MASTER_VOLUME_DESC", "", "Master", "snd_menu_master" ) )
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_CINEMATICS_VOLUME", "MENU_CINEMATICS_VOLUME_DESC", "", "Cinematics", "snd_menu_cinematic", IsDemoBuildBeta() ) )
	table.insert( optionsTable, CreateModels_Presets( controller ) )
	table.insert( optionsTable, CreateModels_SystemTest( controller ) )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, -2, 1278 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 773, 1020 )
	Desc:setTopBottom( true, false, 154, 176 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
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
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 32, 702 )
	ButtonList:setTopBottom( true, false, 107.5, 618.5 )
	ButtonList:setDataSource( "OptionSoundList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( true, false, 658, 765 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 110, 216 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( true, false, 773, 919 )
	StartMenuOptionHighlight:setTopBottom( true, false, 107.5, 147.5 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 640, 656 )
	Image00000:setTopBottom( true, false, 107.5, 115.5 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 640, 656 )
	Image000000:setTopBottom( true, false, 209.5, 217.5 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		CloseStartMenu( menu, controller )
		StopSoundAlias( "tst_test_system" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
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
		self.StartMenulineGraphicsOptions0:close()
		self.ButtonList:close()
		self.StartMenuOptionIconContainer:close()
		self.StartMenuOptionHighlight:close()
		self.MenuFrame:close()
		self.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Sound.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

