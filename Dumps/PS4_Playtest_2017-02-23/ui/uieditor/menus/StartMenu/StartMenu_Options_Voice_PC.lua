require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )

DataSources.OptionPCVoiceMuteAllExceptParty = DataSourceHelpers.ListSetup( "PC.OptionPCVoiceMuteAllExceptParty", function ( controller )
	local muteOptions = {}
	table.insert( muteOptions, {
		models = {
			value = 0,
			valueDisplay = "MENU_OFF"
		}
	} )
	table.insert( muteOptions, {
		models = {
			value = 1,
			valueDisplay = "MENU_ON"
		}
	} )
	return muteOptions
end, true )
DataSources.OptionVoiceVoice = DataSourceHelpers.ListSetup( "PC.OptionVoiceVoice", function ( controller )
	local voiceSettings = {}
	table.insert( voiceSettings, {
		models = {
			label = "PLATFORM_VOICE_CHAT",
			description = "PLATFORM_VOICECHAT_DESC",
			profileVarName = "cl_voice",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( voiceSettings, {
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
	table.insert( voiceSettings, {
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
	table.insert( voiceSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( voiceSettings, {
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
	table.insert( voiceSettings, {
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
	return voiceSettings
end, true )
DataSources.OptionVoiceVoice.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "dropdown" then
			return CoD.OptionDropdown
		elseif widgetType == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif widgetType == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif widgetType == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionVoiceText = DataSourceHelpers.ListSetup( "PC.OptionVoiceText", function ( controller )
	local textSettings = {}
	table.insert( textSettings, {
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
	table.insert( textSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( textSettings, {
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
	table.insert( textSettings, {
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
	table.insert( textSettings, {
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
	table.insert( textSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( textSettings, {
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
	table.insert( textSettings, {
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
	return textSettings
end, true )
DataSources.OptionVoiceText.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "dropdown" then
			return CoD.OptionDropdown
		elseif widgetType == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif widgetType == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif widgetType == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionVoiceCategories = DataSourceHelpers.ListSetup( "PC.OptionVoiceCategories", function ( controller )
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
			tabName = "PLATFORM_VOICE_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Voice_Voice"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "PLATFORM_TEXT_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Voice_Text"
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
		CoD.ChatClientUtility.UpdateOptionsModels( controller )
	end )
end

LUI.createMenu.StartMenu_Options_Voice_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Voice_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Voice_PC.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_VOICE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_VOICE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( 0, 0, 1, 103 )
	StartMenulineGraphicsOptions0:setTopBottom( 0, 0, -19.5, 985.5 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( 0, 0, 96, 1824 )
	Tabs:setTopBottom( 0, 0, 126, 186 )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	Tabs.grid:setDataSource( "OptionVoiceCategories" )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local categoryFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	categoryFrame:setLeftRight( 0, 0, 96, 1824 )
	categoryFrame:setTopBottom( 0, 0, 201, 985 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	categoryFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryFrame:changeFrameWidget( modelValue )
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
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		CloseStartMenu( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Voice_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

