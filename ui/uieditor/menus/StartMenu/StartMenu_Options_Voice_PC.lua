-- 069f2542a3380fe432caf972d7ef7612
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.VoiceOptions.StartMenu_Options_PC_Voice_Voice" )
require( "ui.uieditor.widgets.PC.StartMenu.VoiceOptions.StartMenu_Options_PC_Voice_Text" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_CheckBoxOption" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )

DataSources.OptionPCVoiceMuteAllExceptParty = DataSourceHelpers.ListSetup( "PC.OptionPCVoiceMuteAllExceptParty", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			value = 0,
			valueDisplay = "MENU_OFF"
		}
	} )
	table.insert( f1_local0, {
		models = {
			value = 1,
			valueDisplay = "MENU_ON"
		}
	} )
	return f1_local0
end, true )
DataSources.OptionVoiceVoice = DataSourceHelpers.ListSetup( "PC.OptionVoiceVoice", function ( f2_arg0 )
	local f2_local0 = {}
	table.insert( f2_local0, {
		models = {
			label = "PLATFORM_VOICE_CHAT",
			description = "PLATFORM_VOICECHAT_DESC",
			profileVarName = "cl_voice",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f2_local0, {
		models = {
			label = "PLATFORM_VOICECHAT_VOLUME",
			description = "PLATFORM_VOICECHAT_VOLUME_DESC",
			profileVarName = "snd_voicechat_volume",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f2_local0, {
		models = {
			label = "PLATFORM_VOICECHAT_RECORD_LEVEL",
			description = "PLATFORM_VOICECHAT_RECORD_LEVEL_DESC",
			profileVarName = "snd_voicechat_record_level",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f2_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f2_local0, {
		models = {
			label = "PLATFORM_PUSH_TO_TALK",
			description = "PLATFORM_PUSH_TO_TALK_DESC",
			profileVarName = "snd_voicechat_open_mic",
			profileType = "user",
			lowValue = 1,
			highValue = 0,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f2_local0, {
		models = {
			label = "MENU_MUTE_ALL_EXCEPT_PARTY_OPTION",
			description = "MENU_MUTE_ALL_EXCEPT_PARTY_DESC",
			profileVarName = "mute_all_except_party",
			profileType = "user",
			datasource = "OptionPCVoiceMuteAllExceptParty",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	return f2_local0
end, true )
DataSources.OptionVoiceVoice.getWidgetTypeForItem = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg1 then
		local f3_local0 = Engine.GetModelValue( Engine.GetModel( f3_arg1, "widgetType" ) )
		if f3_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f3_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f3_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f3_local0 == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionVoiceText = DataSourceHelpers.ListSetup( "PC.OptionVoiceText", function ( f4_arg0 )
	local f4_local0 = {}
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_TEXTCHAT",
			description = "PLATFORM_TEXTCHAT_DESC",
			profileVarName = "textchat_enable",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f4_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_CHAT_ALL",
			description = "PLATFORM_CHAT_ALL_DESC",
			profileVarName = "textchat_filter",
			chatChannel = Enum.chatChannel_e.CHAT_CHANNEL_ALL,
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsChatClientChannelFilterCheckboxProperties
	} )
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_CHAT_TEAM",
			description = "PLATFORM_CHAT_TEAM_DESC",
			profileVarName = "textchat_filter",
			chatChannel = Enum.chatChannel_e.CHAT_CHANNEL_TEAM,
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsChatClientChannelFilterCheckboxProperties
	} )
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_CHAT_PARTY",
			description = "PLATFORM_CHAT_PARTY_DESC",
			profileVarName = "textchat_filter",
			chatChannel = Enum.chatChannel_e.CHAT_CHANNEL_PARTY,
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsChatClientChannelFilterCheckboxProperties
	} )
	table.insert( f4_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_CHAT_SHOW_TIMESTAMP",
			description = "PLATFORM_CHAT_SHOW_TIMESTAMP_DESC",
			profileVarName = "textchat_show_timestamps",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_CHAT_SHOW_CHANNEL",
			description = "PLATFORM_CHAT_SHOW_CHANNEL_DESC",
			profileVarName = "textchat_show_channel",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	return f4_local0
end, true )
DataSources.OptionVoiceText.getWidgetTypeForItem = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg1 then
		local f5_local0 = Engine.GetModelValue( Engine.GetModel( f5_arg1, "widgetType" ) )
		if f5_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f5_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f5_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f5_local0 == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionVoiceCategories = DataSourceHelpers.ListSetup( "PC.OptionVoiceCategories", function ( f6_arg0 )
	local f6_local0 = {}
	table.insert( f6_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f6_local0, {
		models = {
			tabName = "PLATFORM_VOICE_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Voice_Voice"
		}
	} )
	table.insert( f6_local0, {
		models = {
			tabName = "PLATFORM_TEXT_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Voice_Text"
		}
	} )
	table.insert( f6_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f6_local0
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
end

local PostLoadFunc = function ( f8_arg0, f8_arg1 )
	f8_arg0.categoryFrame:setForceMouseEventDispatch( true )
	LUI.OverrideFunction_CallOriginalFirst( f8_arg0, "close", function ()
		Engine.ApplyHardwareProfileSettings()
		CoD.ChatClientUtility.UpdateOptionsModels( f8_arg1 )
	end )
end

LUI.createMenu.StartMenu_Options_Voice_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Voice_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Voice_PC.buttonPrompts" )
	local f10_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( f10_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CHAT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHAT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( f10_local1, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Tabs = CoD.basicTabList.new( f10_local1, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs.grid:setDataSource( "OptionVoiceCategories" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local categoryFrame = LUI.UIFrame.new( f10_local1, controller, 0, 0, false )
	categoryFrame:setLeftRight( true, false, 64, 1216 )
	categoryFrame:setTopBottom( true, false, 134.22, 657 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	categoryFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			categoryFrame:changeFrameWidget( tabWidget )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		ShowHeaderIconOnly( f10_local1 )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	f10_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		GoBack( self, f13_arg2 )
		UpdateGamerprofile( self, f13_arg0, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f10_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		CloseStartMenu( f15_arg1, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	f10_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		menu = f10_local1
	} )
	if not self:restoreState() then
		self.categoryFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.StartMenulineGraphicsOptions0:close()
		element.Tabs:close()
		element.categoryFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Voice_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

