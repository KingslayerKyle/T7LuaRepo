-- 43324405ce3474dcc25b4b707e543f9c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Graphics_ColorBlindMinimapPreview" )

local f0_local0 = function ( f1_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_SAFE_AREA" ),
			desc = Engine.Localize( "MENU_SAFE_AREA_DESC" ),
			altText = "PLATFORM_SAFE_AREA_OPEN_TYPE",
			image = RegisterMaterial( "" ),
			action = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
				NavigateToMenu( f2_arg4, "StartMenu_Options_Graphics_SafeArea", true, f2_arg2 )
			end
			
		},
		properties = {
			disabled = false
		}
	}
end

local f0_local1 = function ( f3_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_BRIGHTNESS" ),
			desc = Engine.Localize( "MENU_BRIGHTNESS_DESC" ),
			altText = "MENU_CHANGE",
			image = RegisterMaterial( "" ),
			action = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
				NavigateToMenu( f4_arg4, "FirstTimeBrightnessSetting", true, f4_arg2 )
			end
			
		},
		properties = {
			disabled = false
		}
	}
end

local f0_local2 = function ( f5_arg0 )
	local f5_local0 = "start_in_3d"
	local f5_local1 = {
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_DUAL_VIEW_SETTINGS" ),
			desc = Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f5_arg0, "GraphicsOptions_DualView", f5_local1, f5_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f5_arg0, f5_local1, f5_local0 )
		},
		properties = {
			disabled = true
		}
	}
end

local f0_local3 = function ( f6_arg0 )
	local f6_local0 = "team_indicator"
	local f6_local1 = {
		{
			name = Engine.Localize( "MENU_INDICATOR_FULL" ),
			value = Enum.SettingTeamIndicator.SettingTeamIndicator_FULL
		},
		{
			name = Engine.Localize( "MENU_INDICATOR_ABBREVIATED" ),
			value = Enum.SettingTeamIndicator.SettingTeamIndicator_ABBREVIATED
		},
		{
			name = Engine.Localize( "MENU_INDICATOR_ICON" ),
			value = Enum.SettingTeamIndicator.SettingTeamIndicator_ICON
		}
	}
	return {
		models = {
			name = Engine.Localize( "PLATFORM_TEAM_INDICATOR" ),
			desc = Engine.Localize( "PLATFORM_TEAM_INDICATOR_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f6_arg0, "GraphicsOptions_Indicator", f6_local1, f6_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f6_arg0, f6_local1, f6_local0 )
		},
		properties = {
			disabled = false
		}
	}
end

local f0_local4 = function ( f7_arg0 )
	local f7_local0 = "colorblindMode"
	local f7_local1 = {
		{
			name = Engine.Localize( "MENU_OFF" ),
			value = Enum.ColorVisionDeficiencies.CVD_OFF
		},
		{
			name = Engine.Localize( "MENU_COLORBLIND_DEUTERANOPIA" ),
			value = Enum.ColorVisionDeficiencies.CVD_DEUTERANOMALY
		},
		{
			name = Engine.Localize( "MENU_COLORBLIND_PROTANOPIA" ),
			value = Enum.ColorVisionDeficiencies.CVD_PROTANOMALY
		},
		{
			name = Engine.Localize( "MENU_COLORBLIND_TRITANOPIA" ),
			value = Enum.ColorVisionDeficiencies.CVD_TRITANOMALY
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_COLORBLIND_MODE" ),
			desc = Engine.Localize( "MENU_COLORBLIND_MODE_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f7_arg0, "GraphicsOptions_ColorBlindMode", f7_local1, f7_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f7_arg0, f7_local1, f7_local0 ),
			minimapAlpha = 1
		},
		properties = {
			disabled = false
		}
	}
end

DataSources.OptionGraphicsList = DataSourceHelpers.ListSetup( "OptionGraphicsList", function ( f8_arg0 )
	local f8_local0 = {}
	if f8_arg0 == Engine.GetPrimaryController() then
		table.insert( f8_local0, f0_local1( f8_arg0 ) )
	end
	table.insert( f8_local0, f0_local3( f8_arg0 ) )
	if not IsSplitscreenAndInGame( f8_arg0 ) then
		table.insert( f8_local0, f0_local0( f8_arg0 ) )
	end
	if IsLuaCodeVersionAtLeast( 17 ) then
		table.insert( f8_local0, f0_local4( f8_arg0 ) )
	end
	for f8_local4, f8_local5 in ipairs( f8_local0 ) do
		f8_local5.models.minimapAlpha = f8_local5.models.minimapAlpha or 0
	end
	return f8_local0
end, true )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.StartMenu_Options_Graphics = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Graphics" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics.buttonPrompts" )
	local f10_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( false, false, 134, 380 )
	Desc:setTopBottom( true, false, 180, 202 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, 13 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ButtonList = LUI.UIList.new( f10_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -608, 62 )
	ButtonList:setTopBottom( true, false, 137.5, 591.5 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setDataSource( "OptionGraphicsList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f10_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	f10_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		ProcessListAction( self, f13_arg0, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, -11, 13 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( f10_local1, controller )
	StartMenuOptionHighlight:setLeftRight( false, false, 134, 280 )
	StartMenuOptionHighlight:setTopBottom( true, false, 141.5, 181.5 )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( f10_local1, controller )
	StartMenuOptionIconContainer:setLeftRight( false, false, 19, 126 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 139.5, 246.5 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local MenuFrame = CoD.GenericMenuFrame.new( f10_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( f10_local1, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local StartMenuOptionsGraphicsColorBlindMinimapPreview0 = CoD.StartMenu_Options_Graphics_ColorBlindMinimapPreview.new( f10_local1, controller )
	StartMenuOptionsGraphicsColorBlindMinimapPreview0:setLeftRight( false, false, 19, 519 )
	StartMenuOptionsGraphicsColorBlindMinimapPreview0:setTopBottom( true, false, 331.5, 591.5 )
	self:addElement( StartMenuOptionsGraphicsColorBlindMinimapPreview0 )
	self.StartMenuOptionsGraphicsColorBlindMinimapPreview0 = StartMenuOptionsGraphicsColorBlindMinimapPreview0
	
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
	StartMenuOptionsGraphicsColorBlindMinimapPreview0:linkToElementModel( ButtonList, "minimapAlpha", true, function ( model )
		local minimapAlpha = Engine.GetModelValue( model )
		if minimapAlpha then
			StartMenuOptionsGraphicsColorBlindMinimapPreview0:setAlpha( minimapAlpha )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		ShowHeaderIconOnly( f10_local1 )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	f10_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		GoBack( self, f19_arg2 )
		UpdateGamerprofile( self, f19_arg0, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f10_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.StartMenuOptionHighlight:close()
		element.StartMenuOptionIconContainer:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics0:close()
		element.StartMenuOptionsGraphicsColorBlindMinimapPreview0:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

