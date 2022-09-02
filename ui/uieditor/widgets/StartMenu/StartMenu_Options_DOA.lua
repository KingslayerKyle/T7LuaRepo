-- 1a63c48b9a9d9d784d6af700549c9ee9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = "gpad_rumble"
	local f1_local1 = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		}
	}
	return {
		models = {
			name = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION" ),
			desc = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f1_arg0, "ControllerOptions_Vibration", f1_local1, f1_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f1_arg0, f1_local1, f1_local0 )
		},
		properties = {}
	}
end

local f0_local1 = function ()
	return {
		models = {
			name = Engine.Localize( "MENU_SAFE_AREA" ),
			desc = Engine.Localize( "MENU_SAFE_AREA_DESC" ),
			altText = "PLATFORM_SAFE_AREA_OPEN_TYPE",
			image = RegisterMaterial( "" ),
			action = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
				NavigateToMenu( f3_arg4, "StartMenu_Options_Graphics_SafeArea", true, f3_arg2 )
			end
			
		},
		properties = {
			disabled = false
		}
	}
end

local f0_local2 = function ()
	return {
		models = {
			name = Engine.Localize( "MENU_BRIGHTNESS" ),
			desc = Engine.Localize( "MENU_BRIGHTNESS_DESC" ),
			altText = "MENU_CHANGE",
			image = RegisterMaterial( "" ),
			action = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
				NavigateToMenu( f5_arg4, "FirstTimeBrightnessSetting", true, f5_arg2 )
			end
			
		},
		properties = {
			disabled = false
		}
	}
end

local f0_local3 = function ()
	return {
		models = {
			name = Engine.Localize( "MENU_GRAPHIC_CONTENT" ),
			desc = Engine.Localize( "MENU_GRAPHIC_CONTENT_DESC" ),
			altText = "MENU_CHANGE",
			image = RegisterMaterial( "" ),
			action = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
				NavigateToMenu( f7_arg4, "StartMenu_Options_GraphicContent", true, f7_arg2 )
			end
			
		},
		properties = {
			disabled = false
		}
	}
end

local f0_local4 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6 )
	local f8_local0 = {
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
			name = Engine.Localize( f8_arg1 ),
			desc = Engine.Localize( f8_arg2 ),
			image = RegisterMaterial( f8_arg3 ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f8_arg0, "AudioOptions_Volume_" .. f8_arg4, f8_local0, f8_arg5 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f8_arg0, f8_local0, f8_arg5 )
		},
		properties = {
			disabled = f8_arg6
		}
	}
end

local f0_local5 = function ( f9_arg0 )
	local f9_local0 = "snd_menu_presets"
	local f9_local1 = {
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
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f9_arg0, "AudioOptions_Presets", f9_local1, f9_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f9_arg0, f9_local1, f9_local0 )
		},
		properties = {}
	}
end

local f0_local6 = function ( f10_arg0 )
	local f10_local0 = "input_invertpitch"
	local f10_local1 = {
		{
			name = Engine.Localize( "MENU_NOT_INVERTED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_INVERTED" ),
			value = 1
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_LOOK_INVERSION" ),
			desc = Engine.Localize( "MENU_LOOK_INVERSION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f10_arg0, "ControllerOptions_LookInversion", f10_local1, f10_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f10_arg0, f10_local1, f10_local0 )
		},
		properties = {}
	}
end

DataSources.OptionDOAList = DataSourceHelpers.ListSetup( "OptionDOAList", function ( f11_arg0 )
	local f11_local0 = {}
	local f11_local1 = IsSplitscreenAndInGame( f11_arg0 ) and IsPrimaryControllerIndex( f11_arg0 ) or not IsSplitscreenAndInGame( f11_arg0 )
	table.insert( f11_local0, f0_local0( f11_arg0 ) )
	if not CoD.isPC and f11_local1 then
		table.insert( f11_local0, f0_local1() )
	end
	if f11_local1 then
		table.insert( f11_local0, f0_local2() )
	end
	if IsCurrentTextLanguageEnglish() and f11_local1 then
		table.insert( f11_local0, f0_local3() )
	end
	table.insert( f11_local0, f0_local4( f11_arg0, "MENU_VOICE_VOLUME", "MENU_VOICE_VOLUME_DESC", "", "Voice", "snd_menu_voice" ) )
	table.insert( f11_local0, f0_local4( f11_arg0, "MENU_MUSIC_VOLUME", "MENU_MUSIC_VOLUME_DESC", "", "Music", "snd_menu_music" ) )
	table.insert( f11_local0, f0_local4( f11_arg0, "MENU_SFX_VOLUME", "MENU_SFX_VOLUME_DESC", "", "SFX", "snd_menu_sfx" ) )
	table.insert( f11_local0, f0_local5( f11_arg0 ) )
	table.insert( f11_local0, f0_local6( f11_arg0 ) )
	return f11_local0
end, true )
CoD.StartMenu_Options_DOA = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_DOA.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_DOA )
	self.id = "StartMenu_Options_DOA"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 935 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 678, 935 )
	Desc:setTopBottom( true, false, 46.5, 68.5 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 0, 670 )
	ButtonList:setTopBottom( true, false, 0, 511 )
	ButtonList:setDataSource( "OptionDOAList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		ProcessListAction( self, f15_arg0, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( menu, controller )
	StartMenuOptionHighlight:setLeftRight( true, false, 678, 824 )
	StartMenuOptionHighlight:setTopBottom( true, false, 0, 40 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( menu, controller )
	StartMenuOptionIconContainer:setLeftRight( true, false, 563, 670 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 2, 109 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
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

	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		UpdateGamerprofile( self, element, controller )
	end )
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.StartMenuOptionHighlight:close()
		element.StartMenuOptionIconContainer:close()
		element.Desc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

