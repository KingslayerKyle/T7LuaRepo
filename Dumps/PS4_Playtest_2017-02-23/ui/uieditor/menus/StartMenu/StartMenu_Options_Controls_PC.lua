require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics2" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_CheckBoxOption" )
require( "ui.uieditor.widgets.StartMenu.Startmenu_Options_SliderBar" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_GamepadLayoutOption" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )

DataSources.OptionKeyBindingCategories = DataSourceHelpers.ListSetup( "PC.OptionKeyBindingCategories", function ( controller )
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
			tabName = "MENU_LOOK_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_LookControls"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "MENU_MOVE_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_MoveControls"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "MENU_COMBAT_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_CombatControls"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "MENU_INTERACT_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_InteractControls"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "PLATFORM_GAMEPAD_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_GamepadControls"
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
local PrepareKeyBindings = function ( controller )
	local bindIndex = 0
	local keybindTable = {}
	local category = CoD.perController[controller].controlsCategoryPC
	if category then
		if category == "look" then
			table.insert( keybindTable, {
				models = {
					label = "MENU_LOOK_UP",
					description = "",
					command = "+lookup",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_LOOK_DOWN",
					description = "",
					command = "+lookdown",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_TURN_LEFT",
					description = "",
					command = "+left",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_TURN_RIGHT",
					description = "",
					command = "+right",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_MOUSE_LOOK",
					description = "PLATFORM_MOUSE_LOOK_DESC",
					command = "+mlook",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_CENTER_VIEW",
					description = "PLATFORM_CENTER_VIEW_DESC",
					command = "centerview",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					widgetType = "spacer",
					height = 64
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_FRAME_SMOOTHING",
					description = "PLATFORM_FRAME_SMOOTHING_DESC",
					profileVarName = "com_smoothFrames",
					widgetType = "checkbox"
				},
				properties = CoD.PCUtil.OptionsGenericCheckboxProperties
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_INVERT_MOUSE",
					description = "PLATFORM_INVERT_MOUSE_DESC",
					profileVarName = "m_pitch",
					lowValue = 0.02,
					highValue = -0.02,
					widgetType = "checkbox"
				},
				properties = CoD.PCUtil.OptionsGenericCheckboxProperties
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_FREE_LOOK",
					description = "PLATFORM_FREE_LOOK_DESC",
					profileVarName = "cl_freelook",
					widgetType = "checkbox"
				},
				properties = CoD.PCUtil.OptionsGenericCheckboxProperties
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_MOUSE_SENSITIVITY",
					description = "PLATFORM_MOUSE_SENSITIVITY_DESC",
					profileVarName = "m_mouseSensitivity",
					lowValue = 0,
					highValue = 30,
					widgetType = "slider"
				},
				properties = CoD.PCUtil.OptionsGenericSliderProperties
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_MOUSE_ACCELERATION",
					description = "PLATFORM_MOUSE_ACCELERATION_DESC",
					profileVarName = "m_mouseAcceleration",
					lowValue = 0,
					highValue = 1,
					widgetType = "slider"
				},
				properties = CoD.PCUtil.OptionsGenericSliderProperties
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_MOUSE_FILTER",
					description = "PLATFORM_MOUSE_FILTER_DESC",
					profileVarName = "m_mouseFilter",
					lowValue = 0,
					highValue = 10,
					widgetType = "slider"
				},
				properties = CoD.PCUtil.OptionsGenericSliderProperties
			} )
		elseif category == "move" then
			table.insert( keybindTable, {
				models = {
					label = "MENU_FORWARD",
					description = "",
					command = "+forward",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_BACKPEDAL",
					description = "",
					command = "+back",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_MOVE_LEFT",
					description = "",
					command = "+moveleft",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_MOVE_RIGHT",
					description = "",
					command = "+moveright",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_STANDJUMP",
					description = "",
					command = "+gostand",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_GO_TO_CROUCH",
					description = "PLATFORM_GO_TO_CROUCH_DESC",
					command = "gocrouch",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_GO_TO_PRONE",
					description = "PLATFORM_GO_TO_PRONE_DESC",
					command = "goprone",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_TOGGLE_CROUCH",
					description = "PLATFORM_TOGGLE_CROUCH_DESC",
					command = "togglecrouch",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_TOGGLE_PRONE",
					description = "PLATFORM_TOGGLE_PRONE_DESC",
					command = "toggleprone",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_CROUCH",
					description = "PLATFORM_CROUCH_DESC",
					command = "+movedown",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_PRONE",
					description = "PLATFORM_PRONE_DESC",
					command = "+prone",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_SLIDE",
					description = "",
					command = "slide",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_CHANGE_STANCE",
					description = "",
					command = "+stance",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_STRAFE",
					description = "PLATFORM_STRAFE_DESC",
					command = "+strafe",
					bindIndex = bindIndex
				}
			} )
		elseif category == "combat" then
			table.insert( keybindTable, {
				models = {
					label = "MENU_ATTACK",
					description = "",
					command = "+attack",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_AIM_DOWN_THE_SIGHT",
					description = "PLATFORM_ADS_DESC",
					command = "+speed_throw",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT",
					description = "PLATFORM_TOGGLE_ADS_DESC",
					command = "+toggleads_throw",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_MELEE_ATTACK",
					description = "",
					command = "+melee",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_SWITCH_WEAPON",
					description = "",
					command = "+weapnext_inventory",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_SWITCH_WEAPON",
					description = "",
					command = "weapprev",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_NEXT_WEAPON",
					description = "",
					command = "weapnext",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_ACTIVATE_HERO",
					description = "PLATFORM_ACTIVATE_HERO_DESC",
					command = "+weapoffhandspecial",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_RELOAD_WEAPON",
					description = "",
					command = "+reload",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_SPRINT",
					description = "",
					command = "+sprint",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_SPRINT_HOLD_BREATH",
					description = "",
					command = "+breath_sprint",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_STEADY_SNIPER_RIFLE",
					description = "",
					command = "+holdbreath",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_THROW_PRIMARY",
					description = "",
					command = "+frag",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_THROW_SECONDARY",
					description = "",
					command = "+smoke",
					bindIndex = bindIndex
				}
			} )
		elseif category == "interact" then
			local actionSlot1Label, actionSlot2Label, actionSlot3Label, actionSlot4Label = nil
			if CoD.isCampaign then
				actionSlot1Label = "PLATFORM_ENHANCED_VISION"
				actionSlot2Label = "PLATFORM_CYBERCORE_SELECT"
				actionSlot3Label = "PLATFORM_SPECIAL_ACTION"
				actionSlot4Label = "PLATFORM_TACTICAL_MODE"
			elseif CoD.isMultiplayer then
				actionSlot1Label = "PLATFORM_NEXT_SCORE_STREAK"
				actionSlot2Label = "PLATFORM_PREVIOUS_SCORE_STREAK"
				actionSlot3Label = "PLATFORM_ACTIONSLOT_3"
				actionSlot4Label = "PLATFORM_ACTIVATE_SCORE_STREAK"
			else
				actionSlot1Label = "PLATFORM_SPECIAL_ACTION_1"
				actionSlot2Label = "PLATFORM_SPECIAL_ACTION_2"
				actionSlot3Label = "PLATFORM_SPECIAL_ACTION_3"
				actionSlot4Label = "PLATFORM_SPECIAL_ACTION_4"
			end
			table.insert( keybindTable, {
				models = {
					label = "MENU_USE",
					description = "",
					command = "+activate",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = actionSlot1Label,
					description = "",
					command = "+actionSlot 1",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = actionSlot2Label,
					description = "",
					command = "+actionSlot 2",
					bindIndex = bindIndex
				}
			} )
			if not Dvar.ui_execdemo_gamescom:get() then
				table.insert( keybindTable, {
					models = {
						label = actionSlot3Label,
						description = "",
						command = "+actionslot 3",
						bindIndex = bindIndex
					}
				} )
			end
			table.insert( keybindTable, {
				models = {
					label = actionSlot4Label,
					description = "",
					command = "+actionSlot 4",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_SCREENSHOT",
					description = "",
					command = "screenshotjpeg",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_SCOREBOARD_LC",
					description = "",
					command = "+scores",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_SCOREBOARD_TOGGLE",
					description = "",
					command = "togglescores",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_VOICE_CHAT_BUTTON",
					description = "",
					command = "+talk",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_CHAT",
					description = "PLATFORM_CHAT_DESC",
					command = "chatmodepublic",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "MENU_TEAM_CHAT",
					description = "PLATFORM_CHAT_DESC",
					command = "chatmodeteam",
					bindIndex = bindIndex
				}
			} )
			table.insert( keybindTable, {
				models = {
					label = "PLATFORM_PARTY_CHAT",
					description = "PLATFORM_CHAT_DESC",
					command = "chatmodeparty",
					bindIndex = bindIndex
				}
			} )
		end
	end
	return keybindTable
end

DataSources.OptionKeyBindings = DataSourceHelpers.ListSetup( "PC.OptionKeyBindings", PrepareKeyBindings, true )
DataSources.OptionKeyBindings.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetTypeModel = Engine.GetModel( dataItemModel, "widgetType" )
		if widgetTypeModel then
			local widgetType = Engine.GetModelValue( widgetTypeModel )
			if widgetType == "checkbox" then
				return CoD.StartMenu_Options_CheckBoxOption
			elseif widgetType == "slider" then
				return CoD.StartMenu_Options_SliderBar
			elseif widgetType == "spacer" then
				return CoD.VerticalListSpacer
			end
		end
	end
	return nil
end

DataSources.OptionGamepadSettingsPC = DataSourceHelpers.ListSetup( "PC.OptionGamepadSettingsPC", function ( controller )
	local gamepadSettings = {}
	table.insert( gamepadSettings, {
		models = {
			label = "MENU_LOOK_INVERSION",
			description = "MENU_LOOK_INVERSION_DESC",
			profileVarName = "input_invertpitch",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( gamepadSettings, {
		models = {
			label = "PLATFORM_CONTROLLER_VIBRATION",
			description = "PLATFORM_CONTROLLER_VIBRATION_DESC",
			profileVarName = "gpad_rumble",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( gamepadSettings, {
		models = {
			label = "MENU_TARGET_ASSIST",
			description = "MENU_TARGET_ASSIST_DESC",
			profileVarName = "input_targetassist",
			profileType = "user",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( gamepadSettings, {
		models = {
			label = "PLATFORM_STICK_LAYOUT",
			description = "PLATFORM_STICK_LAYOUT_DESC",
			profileVarName = "gpad_sticksConfig",
			profileType = "user",
			widgetType = "gamepadLayout",
			menu = "StartMenu_Options_Controls_StickLayout",
			getLabelFn = function ( self, controller )
				local model = self:getModel()
				if model then
					local optionInfo = CoD.PCUtil.GetOptionInfo( model, controller )
					if optionInfo and optionInfo.currentValue then
						local optionLabels = {
							"MENU_DEFAULT",
							"MENU_SOUTHPAW",
							"MENU_LEGACY",
							"MENU_LEGACY_SOUTHPAW"
						}
						return optionLabels[optionInfo.currentValue + 1]
					end
				end
				return ""
			end
		}
	} )
	table.insert( gamepadSettings, {
		models = {
			label = "PLATFORM_BUTTON_LAYOUT",
			description = "PLATFORM_BUTTON_LAYOUT_DESC",
			profileVarName = "gpad_buttonsConfig",
			profileType = "user",
			widgetType = "gamepadLayout",
			menu = "StartMenu_Options_Controls_ButtonLayout",
			getLabelFn = function ( self, controller )
				local model = self:getModel()
				if model then
					local optionInfo = CoD.PCUtil.GetOptionInfo( model, controller )
					if optionInfo and optionInfo.currentValue then
						local optionLabels = {
							"MENU_DEFAULT",
							"MENU_TACTICAL",
							"MENU_LEFTY",
							"MENU_NOMAD",
							"MENU_CHARLIE",
							"MENU_GUNSLINGER",
							"MENU_BUMPERJUMPER",
							"MENU_BUMPERTACTICAL",
							"MENU_STICKMOVE"
						}
						return optionLabels[optionInfo.currentValue + 1]
					end
				end
			end
		}
	} )
	table.insert( gamepadSettings, {
		models = {
			label = "MENU_LOOK_SENSITIVITY_HORIZONTAL",
			description = "MENU_LOOK_SENSITIVITY_HORIZONTAL_DESC",
			profileVarName = "input_viewSensitivityHorizontal",
			profileType = "user",
			lowValue = CoD.OptionsUtility.SENSITIVITY_1,
			highValue = CoD.OptionsUtility.SENSITIVITY_14,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( gamepadSettings, {
		models = {
			label = "MENU_LOOK_SENSITIVITY_VERTICAL",
			description = "MENU_LOOK_SENSITIVITY_VERTICAL_DESC",
			profileVarName = "input_viewSensitivityVertical",
			profileType = "user",
			lowValue = CoD.OptionsUtility.SENSITIVITY_1,
			highValue = CoD.OptionsUtility.SENSITIVITY_14,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	return gamepadSettings
end, true )
DataSources.OptionGamepadSettingsPC.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif widgetType == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif widgetType == "gamepadLayout" then
			return CoD.StartMenu_Options_GamepadLayoutOption
		end
	end
	return nil
end

local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
end

local PostLoadFunc = function ( self, controller )
	self.categoryFrame:setForceMouseEventDispatch( true )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		Engine.ApplyHardwareProfileSettings()
		Engine.Exec( controller, "refreshLastInput" )
	end )
end

LUI.createMenu.StartMenu_Options_Controls_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_PC.buttonPrompts" )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
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
	
	local categoryFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	categoryFrame:setLeftRight( 0, 0, 96, 1824 )
	categoryFrame:setTopBottom( 0, 0, 201, 985 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	local StartMenulineGraphics20 = CoD.StartMenu_lineGraphics2.new( self, controller )
	StartMenulineGraphics20:setLeftRight( 0, 0, 1804, 1900 )
	StartMenulineGraphics20:setTopBottom( 0, 0, 168, 1048 )
	self:addElement( StartMenulineGraphics20 )
	self.StartMenulineGraphics20 = StartMenulineGraphics20
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -414, -356 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( 0, 0, 96, 1824 )
	Tabs:setTopBottom( 0, 0, 126, 186 )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	Tabs.grid:setDataSource( "OptionKeyBindingCategories" )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		OpenPCResetControlsPopup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_RESET_TO_DEFAULT", nil )
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
		self.StartMenulineGraphics20:close()
		self.Tabs:close()
		self.categoryFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

