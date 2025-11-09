require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.VoiceOptions.StartMenu_Options_PC_Voice_Voice" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
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
			profileVarName = "fake_mute",
			datasource = "OptionPCVoiceMuteAllExceptParty",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.MuteAllDropdownProperties
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

DataSources.OptionVoiceCategories = DataSourceHelpers.ListSetup( "PC.OptionVoiceCategories", function ( f4_arg0 )
	local f4_local0 = {}
	table.insert( f4_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f4_local0, {
		models = {
			tabName = "MENU_VOICE",
			tabWidget = "CoD.StartMenu_Options_PC_Voice_Voice"
		}
	} )
	table.insert( f4_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f4_local0
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
end

local PostLoadFunc = function ( f6_arg0, f6_arg1 )
	f6_arg0.categoryFrame:setForceMouseEventDispatch( true )
	LUI.OverrideFunction_CallOriginalFirst( f6_arg0, "close", function ()
		Engine.ApplyHardwareProfileSettings()
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Voice_PC.buttonPrompts" )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_VOICE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_VOICE" ) )
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
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs.grid:setDataSource( "OptionVoiceCategories" )
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
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			categoryFrame:changeFrameWidget( tabWidget )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Tabs:completeAnimation()
				self.Tabs:setAlpha( 0 )
				self.clipFinished( Tabs, {} )
			end
		}
	}
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

