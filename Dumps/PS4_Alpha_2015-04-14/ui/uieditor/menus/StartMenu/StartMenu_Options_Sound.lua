require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )

local ItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	Engine.SetProfileVar( controller, actionParam, element.value )
end

local CreateOptionDataSource = function ( controller, dataSourceName, options, profileStat )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					value = options[index].value,
					actionParam = profileStat,
					action = ItemSelectedFunction
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

local GetProfileSelection = function ( controller, options, stat )
	local selection = nil
	for index, optionTable in ipairs( options ) do
		if options[index].value == tonumber( Engine.ProfileValueAsString( controller, stat ) ) then
			selection = index
		end
	end
	return selection
end

local CreateModels_Volume = function ( controller, name, desc, image, modelName, profileStat )
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
			optionsDatasource = CreateOptionDataSource( controller, "AudioOptions_Volume_" .. modelName, options, profileStat ),
			currentSelection = GetProfileSelection( controller, options, profileStat )
		},
		properties = {}
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
			optionsDatasource = CreateOptionDataSource( controller, "AudioOptions_Presets", options, profileStat ),
			currentSelection = GetProfileSelection( controller, options, profileStat )
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
			optionsDatasource = CreateOptionDataSource( controller, "AudioOptions_Subtitles", options, profileStat ),
			currentSelection = GetProfileSelection( controller, options, profileStat )
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
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_CINEMATICS_VOLUME", "MENU_CINEMATICS_VOLUME_DESC", "", "Cinematics", "snd_menu_cinematic" ) )
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_SHOUTCAST_GAME_VOLUME", "MENU_SHOUTCAST_GAME_VOLUME_DESC", "", "CasterGame", "snd_shoutcast_game" ) )
	table.insert( optionsTable, CreateModels_Volume( controller, "MENU_SHOUTCAST_VOIP_VOLUME", "MENU_SHOUTCAST_VOIP_VOLUME_DESC", "", "CasterVoip", "snd_shoutcast_voip" ) )
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
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, -2, 1278 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 773, 1020 )
	Desc:setTopBottom( true, false, 154, 174 )
	Desc:setRGB( 1, 1, 1 )
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
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	StartMenulineGraphicsOptions0:setRGB( 1, 1, 1 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOUND_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 32, 702 )
	ButtonList:setTopBottom( true, false, 107.5, 618.5 )
	ButtonList:setRGB( 1, 1, 1 )
	ButtonList:setDataSource( "OptionSoundList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( true, false, 658, 765 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 110, 216 )
	StartMenuOptionIconContainer:setRGB( 1, 1, 1 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( true, false, 773, 919 )
	StartMenuOptionHighlight:setTopBottom( true, false, 107.5, 147.5 )
	StartMenuOptionHighlight:setRGB( 1, 1, 1 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 640, 656 )
	Image00000:setTopBottom( true, false, 107.5, 115.5 )
	Image00000:setRGB( 1, 1, 1 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 640, 656 )
	Image000000:setTopBottom( true, false, 209.5, 217.5 )
	Image000000:setRGB( 1, 1, 1 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 768, 804 )
	Pixel2:setTopBottom( true, false, 212.5, 216.5 )
	Pixel2:setRGB( 1, 1, 1 )
	Pixel2:setYRot( 180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
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
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		menu:addButtonPrompt( "start", Engine.Localize( "MENU_DISMISS_MENU" ), "M", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.start( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "M") then
			CloseStartMenu( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ButtonList.id = "ButtonList"
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
	self.close = function ( self )
		self.StartMenulineGraphicsOptions0:close()
		self.cac3dTitleIntermediary0:close()
		self.ButtonList:close()
		self.StartMenuOptionIconContainer:close()
		self.StartMenuOptionHighlight:close()
		self.Desc:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

