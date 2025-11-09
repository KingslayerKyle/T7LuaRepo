require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics2" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PC_LookControls" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PC_MoveControls" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PC_CombatControls" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PC_InteractControls" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PC_GamepadControls" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_CheckBoxOption" )
require( "ui.uieditor.widgets.StartMenu.Startmenu_Options_SliderBar" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_GamepadLayoutOption" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )

DataSources.OptionKeyBindingCategories = DataSourceHelpers.ListSetup( "PC.OptionKeyBindingCategories", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_LOOK_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_LookControls"
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_MOVE_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_MoveControls"
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_COMBAT_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_CombatControls"
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_INTERACT_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_InteractControls"
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "PLATFORM_GAMEPAD_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_GamepadControls"
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f1_local0
end, true )
DataSources.OptionKeyBindings = DataSourceHelpers.ListSetup( "PC.OptionKeyBindings", function ( f2_arg0 )
	local f2_local0 = CoD.BIND_PLAYER
	local f2_local1 = {}
	local f2_local2 = CoD.perController[f2_arg0].controlsCategoryPC
	if f2_local2 then
		if f2_local2 == "look" then
			table.insert( f2_local1, {
				models = {
					label = "MENU_LOOK_UP",
					description = "",
					command = "+lookup",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_LOOK_DOWN",
					description = "",
					command = "+lookdown",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_TURN_LEFT",
					description = "",
					command = "+left",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_TURN_RIGHT",
					description = "",
					command = "+right",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_MOUSE_LOOK",
					description = "PLATFORM_MOUSE_LOOK_DESC",
					command = "+mlook",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_CENTER_VIEW",
					description = "PLATFORM_CENTER_VIEW_DESC",
					command = "centerview",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					widgetType = "spacer",
					height = 64
				}
			} )
			table.insert( f2_local1, {
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
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_FREE_LOOK",
					description = "PLATFORM_FREE_LOOK_DESC",
					profileVarName = "cl_freelook",
					widgetType = "checkbox"
				},
				properties = CoD.PCUtil.OptionsGenericCheckboxProperties
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_MOUSE_SENSITIVITY",
					description = "PLATFORM_MOUSE_SENSITIVITY_DESC",
					profileVarName = "mouseSensitivity",
					lowValue = 0,
					highValue = 30,
					profileType = "user",
					widgetType = "slider"
				},
				properties = CoD.PCUtil.OptionsGenericSliderProperties
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_MOUSE_ACCELERATION",
					description = "PLATFORM_MOUSE_ACCELERATION_DESC",
					profileVarName = "mouseAcceleration",
					lowValue = 0,
					highValue = 1,
					profileType = "user",
					widgetType = "slider"
				},
				properties = CoD.PCUtil.OptionsGenericSliderProperties
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_MOUSE_FILTER",
					description = "PLATFORM_MOUSE_FILTER_DESC",
					profileVarName = "mouseFilter",
					lowValue = 0,
					highValue = 10,
					profileType = "user",
					widgetType = "slider"
				},
				properties = CoD.PCUtil.OptionsGenericSliderProperties
			} )
		elseif f2_local2 == "move" then
			table.insert( f2_local1, {
				models = {
					label = "MENU_FORWARD",
					description = "",
					command = "+forward",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_BACKPEDAL",
					description = "",
					command = "+back",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_MOVE_LEFT",
					description = "",
					command = "+moveleft",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_MOVE_RIGHT",
					description = "",
					command = "+moveright",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_STANDJUMP",
					description = "",
					command = "+gostand",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_GO_TO_CROUCH",
					description = "PLATFORM_GO_TO_CROUCH_DESC",
					command = "gocrouch",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_GO_TO_PRONE",
					description = "PLATFORM_GO_TO_PRONE_DESC",
					command = "goprone",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_TOGGLE_CROUCH",
					description = "PLATFORM_TOGGLE_CROUCH_DESC",
					command = "togglecrouch",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_TOGGLE_PRONE",
					description = "PLATFORM_TOGGLE_PRONE_DESC",
					command = "toggleprone",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_CROUCH",
					description = "PLATFORM_CROUCH_DESC",
					command = "+movedown",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_PRONE",
					description = "PLATFORM_PRONE_DESC",
					command = "+prone",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_SLIDE",
					description = "",
					command = "slide",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_CHANGE_STANCE",
					description = "",
					command = "+stance",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_STRAFE",
					description = "PLATFORM_STRAFE_DESC",
					command = "+strafe",
					bindIndex = f2_local0
				}
			} )
		elseif f2_local2 == "combat" then
			table.insert( f2_local1, {
				models = {
					label = "MENU_ATTACK",
					description = "",
					command = "+attack",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_AIM_DOWN_THE_SIGHT",
					description = "PLATFORM_ADS_DESC",
					command = "+speed_throw",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT",
					description = "PLATFORM_TOGGLE_ADS_DESC",
					command = "+toggleads_throw",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_MELEE_ATTACK",
					description = "",
					command = "+melee",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_SWITCH_WEAPON",
					description = "",
					command = "+weapnext_inventory",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_SWITCH_WEAPON",
					description = "",
					command = "weapprev",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_NEXT_WEAPON",
					description = "",
					command = "weapnext",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_ACTIVATE_HERO",
					description = "PLATFORM_ACTIVATE_HERO_DESC",
					command = "+weaphero",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_RELOAD_WEAPON",
					description = "",
					command = "+reload",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_SPRINT",
					description = "",
					command = "+sprint",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_SPRINT_HOLD_BREATH",
					description = "",
					command = "+breath_sprint",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_STEADY_SNIPER_RIFLE",
					description = "",
					command = "+holdbreath",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_THROW_PRIMARY",
					description = "",
					command = "+frag",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_THROW_SECONDARY",
					description = "",
					command = "+smoke",
					bindIndex = f2_local0
				}
			} )
		elseif f2_local2 == "interact" then
			local f2_local3, f2_local4, f2_local5, f2_local6 = nil
			if CoD.isCampaign then
				f2_local3 = "PLATFORM_ENHANCED_VISION"
				f2_local4 = "PLATFORM_CYBERCORE_SELECT"
				f2_local5 = "PLATFORM_TACTICAL_MODE"
				f2_local6 = "PLATFORM_SPECIAL_ACTION"
			elseif CoD.isMultiplayer then
				f2_local3 = "PLATFORM_NEXT_SCORE_STREAK"
				f2_local4 = "PLATFORM_PREVIOUS_SCORE_STREAK"
				f2_local5 = "PLATFORM_ACTIONSLOT_3"
				f2_local6 = "PLATFORM_ACTIVATE_SCORE_STREAK"
			else
				f2_local3 = "PLATFORM_SPECIAL_ACTION_1"
				f2_local4 = "PLATFORM_SPECIAL_ACTION_2"
				f2_local5 = "PLATFORM_SPECIAL_ACTION_3"
				f2_local6 = "PLATFORM_SPECIAL_ACTION_4"
			end
			table.insert( f2_local1, {
				models = {
					label = "MENU_USE",
					description = "",
					command = "+activate",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = f2_local3,
					description = "",
					command = "+actionSlot 1",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = f2_local4,
					description = "",
					command = "+actionSlot 2",
					bindIndex = f2_local0
				}
			} )
			if not Dvar.ui_execdemo_beta:get() then
				table.insert( f2_local1, {
					models = {
						label = f2_local5,
						description = "",
						command = "+actionslot 3",
						bindIndex = f2_local0
					}
				} )
			end
			table.insert( f2_local1, {
				models = {
					label = f2_local6,
					description = "",
					command = "+actionSlot 4",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_SCREENSHOT",
					description = "",
					command = "screenshotjpeg",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_SCOREBOARD_LC",
					description = "",
					command = "+scores",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "PLATFORM_SCOREBOARD_TOGGLE",
					description = "",
					command = "togglescores",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_VOICE_CHAT_BUTTON",
					description = "",
					command = "+talk",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_CHAT",
					description = "",
					command = "chatmodepublic",
					bindIndex = f2_local0
				}
			} )
			table.insert( f2_local1, {
				models = {
					label = "MENU_TEAM_CHAT",
					description = "",
					command = "chatmodeteam",
					bindIndex = f2_local0
				}
			} )
		end
	end
	return f2_local1
end, true )
DataSources.OptionKeyBindings.getWidgetTypeForItem = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg1 then
		local f3_local0 = Engine.GetModel( f3_arg1, "widgetType" )
		if f3_local0 then
			local f3_local1 = Engine.GetModelValue( f3_local0 )
			if f3_local1 == "checkbox" then
				return CoD.StartMenu_Options_CheckBoxOption
			elseif f3_local1 == "slider" then
				return CoD.StartMenu_Options_SliderBar
			elseif f3_local1 == "spacer" then
				return CoD.VerticalListSpacer
			end
		end
	end
	return nil
end

DataSources.OptionGamepadSettingsPC = DataSourceHelpers.ListSetup( "PC.OptionGamepadSettingsPC", function ( f4_arg0 )
	local f4_local0 = {}
	table.insert( f4_local0, {
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
	table.insert( f4_local0, {
		models = {
			label = "MENU_CONTROLLER_VIBRATION",
			description = "MENU_CONTROLLER_VIBRATION_DESC",
			profileVarName = "gpad_rumble",
			profileType = "user",
			lowValue = 0,
			highValue = 1,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f4_local0, {
		models = {
			label = "MENU_STICK_LAYOUT",
			description = "MENU_STICK_LAYOUT_DESC",
			profileVarName = "gpad_sticksConfig",
			profileType = "user",
			widgetType = "gamepadLayout",
			menu = "StartMenu_Options_Controls_StickLayout",
			getLabelFn = function ( f5_arg0, f5_arg1 )
				local f5_local0 = f5_arg0:getModel()
				if f5_local0 then
					local f5_local1 = CoD.PCUtil.GetOptionInfo( f5_local0, f5_arg1 )
					if f5_local1 and f5_local1.currentValue then
						local f5_local2 = {
							"MENU_DEFAULT",
							"MENU_SOUTHPAW",
							"MENU_LEGACY",
							"MENU_LEGACY_SOUTHPAW"
						}
						return f5_local2[f5_local1.currentValue + 1]
					end
				end
				return ""
			end
		}
	} )
	table.insert( f4_local0, {
		models = {
			label = "MENU_BUTTON_LAYOUT",
			description = "MENU_BUTTON_LAYOUT_DESC",
			profileVarName = "gpad_buttonsConfig",
			profileType = "user",
			widgetType = "gamepadLayout",
			menu = "StartMenu_Options_Controls_ButtonLayout",
			getLabelFn = function ( f6_arg0, f6_arg1 )
				local f6_local0 = f6_arg0:getModel()
				if f6_local0 then
					local f6_local1 = CoD.PCUtil.GetOptionInfo( f6_local0, f6_arg1 )
					if f6_local1 and f6_local1.currentValue then
						local f6_local2 = {
							"MENU_DEFAULT",
							"MENU_TACTICAL",
							"MENU_LEFTY",
							"MENU_NOMAD",
							"MENU_CHARLIE",
							"MENU_BUMPERJUMPER",
							"MENU_GUNSLINGER",
							"MENU_STICKMOVE"
						}
						return f6_local2[f6_local1.currentValue + 1]
					end
				end
			end
		}
	} )
	if Dvar.aim_view_sensitivity_component:get() then
		table.insert( f4_local0, {
			models = {
				label = "MENU_LOOK_SENSITIVITY_HORIZONTAL",
				description = "MENU_LOOK_SENSITIVITY_HORIZONTAL_DESC",
				profileVarName = "input_viewSensitivityHorizontal",
				profileType = "user",
				lowValue = CoD.SENSITIVITY_1,
				highValue = CoD.SENSITIVITY_14,
				widgetType = "slider"
			},
			properties = CoD.PCUtil.OptionsGenericSliderProperties
		} )
		table.insert( f4_local0, {
			models = {
				label = "MENU_LOOK_SENSITIVITY_VERTICAL",
				description = "MENU_LOOK_SENSITIVITY_VERTICAL_DESC",
				profileVarName = "input_viewSensitivityVertical",
				profileType = "user",
				lowValue = CoD.SENSITIVITY_1,
				highValue = CoD.SENSITIVITY_14,
				widgetType = "slider"
			},
			properties = CoD.PCUtil.OptionsGenericSliderProperties
		} )
	end
	return f4_local0
end, true )
DataSources.OptionGamepadSettingsPC.getWidgetTypeForItem = function ( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg1 then
		local f7_local0 = Engine.GetModelValue( Engine.GetModel( f7_arg1, "widgetType" ) )
		if f7_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f7_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f7_local0 == "gamepadLayout" then
			return CoD.StartMenu_Options_GamepadLayoutOption
		end
	end
	return nil
end

local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
end

local PostLoadFunc = function ( f9_arg0, f9_arg1 )
	f9_arg0.categoryFrame:setForceMouseEventDispatch( true )
	LUI.OverrideFunction_CallOriginalFirst( f9_arg0, "close", function ()
		Engine.ApplyHardwareProfileSettings()
	end )
end

LUI.createMenu.StartMenu_Options_Controls_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_PC.buttonPrompts" )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
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
	
	local categoryFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	categoryFrame:setLeftRight( true, false, 64, 1216 )
	categoryFrame:setTopBottom( true, false, 134.22, 657 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	local StartMenulineGraphics20 = CoD.StartMenu_lineGraphics2.new( self, controller )
	StartMenulineGraphics20:setLeftRight( true, false, 1203, 1267 )
	StartMenulineGraphics20:setTopBottom( true, false, 112, 698.94 )
	self:addElement( StartMenulineGraphics20 )
	self.StartMenulineGraphics20 = StartMenulineGraphics20
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs.grid:setDataSource( "OptionKeyBindingCategories" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	categoryFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			categoryFrame:changeFrameWidget( tabWidget )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		OpenPCResetControlsPopup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_RESET_TO_DEFAULT" )
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
		element.StartMenulineGraphics20:close()
		element.Tabs:close()
		element.categoryFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

