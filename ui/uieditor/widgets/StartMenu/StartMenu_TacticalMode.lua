-- 2759cf3507fab53f5a2178f536072bda
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_list1button" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )
require( "ui.uieditor.widgets.StartMenu.TacticalModeSettings.TModeSetting_AgileTacticalMode" )
require( "ui.uieditor.widgets.StartMenu.TacticalModeSettings.TModeSetting_BalancedTacticalMode" )
require( "ui.uieditor.widgets.StartMenu.TacticalModeSettings.TModeSetting_FullSpectrumTacticalMode" )
require( "ui.uieditor.widgets.StartMenu.TacticalModeSettings.TModeSetting_OverwatchTacticalMode" )
require( "ui.uieditor.widgets.StartMenu.TacticalModeSettings.TModeSetting_SurvivalistTacticalMode" )
require( "ui.uieditor.widgets.StartMenu.TacticalModeSettings.TModeSetting_TacticalModeLight" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = "tacticalModeAutoOn"
	local f1_local1 = {
		{
			name = Engine.Localize( "MENU_OFF" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ON" ),
			value = 1
		}
	}
	return {
		models = {
			name = Engine.Localize( "CPUI_TACTICAL_MODE_ACTIVIATION" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f1_arg0, "TacticalMode_AlwaysOn", f1_local1, f1_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f1_arg0, f1_local1, f1_local0 )
		},
		properties = {
			disabled = false,
			customWidgetOverride = CoD.TacticalModeAlwaysOnToggle
		}
	}
end

DataSources.TacticalModeSettings = DataSourceHelpers.ListSetup( "TacticalModeSettings", function ( f2_arg0 )
	local f2_local0 = {}
	table.insert( f2_local0, {
		models = {
			displayText = "CPUI_BALANCED_TACTICAL_MODE",
			frameWidget = "CoD.TModeSetting_BalancedTacticalMode",
			itemIndex = 0
		}
	} )
	table.insert( f2_local0, {
		models = {
			displayText = "CPUI_TACTICAL_MODE_LIGHT",
			frameWidget = "CoD.TModeSetting_TacticalModeLight",
			itemIndex = 1
		}
	} )
	table.insert( f2_local0, {
		models = {
			displayText = "CPUI_AGILE_TACTICAL_MODE",
			frameWidget = "CoD.TModeSetting_AgileTacticalMode",
			itemIndex = 2
		}
	} )
	table.insert( f2_local0, {
		models = {
			displayText = "CPUI_SURVIVALIST_TACTICAL_MODE",
			frameWidget = "CoD.TModeSetting_SurvivalistTacticalMode",
			itemIndex = 3
		}
	} )
	table.insert( f2_local0, {
		models = {
			displayText = "CPUI_OVERWATCH_TACTICAL_MODE",
			frameWidget = "CoD.TModeSetting_OverwatchTacticalMode",
			itemIndex = 4
		}
	} )
	table.insert( f2_local0, {
		models = {
			displayText = "CPUI_FULL_SPECTRUM_TACTICAL_MODE",
			frameWidget = "CoD.TModeSetting_FullSpectrumTacticalMode",
			itemIndex = 5
		}
	} )
	table.insert( f2_local0, f0_local0( f2_arg0 ) )
	return f2_local0
end )
local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].startMenu_equippedIndex = Dvar.r_tacScan_Layout:get()
end

CoD.StartMenu_TacticalMode = InheritFrom( LUI.UIElement )
CoD.StartMenu_TacticalMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_TacticalMode )
	self.id = "StartMenu_TacticalMode"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local tmodeInstruction = LUI.UIText.new()
	tmodeInstruction:setLeftRight( true, false, 10, 244 )
	tmodeInstruction:setTopBottom( true, false, 391, 415 )
	tmodeInstruction:setText( Engine.Localize( "CPUI_TMODE_ACTIVATION" ) )
	tmodeInstruction:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	tmodeInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	tmodeInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( tmodeInstruction )
	self.tmodeInstruction = tmodeInstruction
	
	local settingFrame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	settingFrame:setLeftRight( true, false, 337, 1197 )
	settingFrame:setTopBottom( true, false, 50, 520 )
	self:addElement( settingFrame )
	self.settingFrame = settingFrame
	
	local selectionList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 2, 282 )
	selectionList:setTopBottom( true, false, 102, 350 )
	selectionList:setWidgetType( CoD.StartMenu_list1button )
	selectionList:setVerticalCount( 7 )
	selectionList:setSpacing( 4 )
	selectionList:setDataSource( "TacticalModeSettings" )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		SetTMode( self, f7_arg0, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, false, -86.5, 1236.5 )
	TitleBG:setTopBottom( true, false, 5, 75 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local selectConfig = LUI.UITightText.new()
	selectConfig:setLeftRight( true, false, 10, 294 )
	selectConfig:setTopBottom( true, false, 50, 68 )
	selectConfig:setAlpha( 0.65 )
	selectConfig:setText( LocalizeToUpperString( "CPUI_SELECT_CONFIGURATION" ) )
	selectConfig:setTTF( "fonts/escom.ttf" )
	selectConfig:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	selectConfig:setShaderVector( 0, 0.06, 0, 0, 0 )
	selectConfig:setShaderVector( 1, 0.02, 0, 0, 0 )
	selectConfig:setShaderVector( 2, 1, 0, 0, 0 )
	selectConfig:setLetterSpacing( 1 )
	self:addElement( selectConfig )
	self.selectConfig = selectConfig
	
	local Title = CoD.MissionRecordVault_Heading.new( menu, controller )
	Title:setLeftRight( true, false, -9, 1278 )
	Title:setTopBottom( true, false, -3, 100 )
	Title.Title:setText( Engine.Localize( "CPUI_DNI_TACTICAL_MODE" ) )
	self:addElement( Title )
	self.Title = Title
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, 332, 785 )
	SecTitleBG:setTopBottom( true, false, 93, 141 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 335, 363 )
	Image3:setTopBottom( true, false, 92, 96 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 335, 363 )
	Image30:setTopBottom( true, false, 137, 141 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local features = LUI.UITightText.new()
	features:setLeftRight( true, false, 378, 785 )
	features:setTopBottom( true, false, 105, 127 )
	features:setTTF( "fonts/escom.ttf" )
	features:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	features:setShaderVector( 0, 0.06, 0, 0, 0 )
	features:setShaderVector( 1, 0.02, 0, 0, 0 )
	features:setShaderVector( 2, 1, 0, 0, 0 )
	features:setLetterSpacing( 2 )
	self:addElement( features )
	self.features = features
	
	settingFrame:linkToElementModel( selectionList, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			settingFrame:changeFrameWidget( frameWidget )
		end
	end )
	features:linkToElementModel( selectionList, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			features:setText( ToUpper( LocalizeIntoString( "CPUI_TMODE_FEATURES", displayText ) ) )
		end
	end )
	settingFrame.navigation = {
		left = selectionList
	}
	selectionList.navigation = {
		right = settingFrame
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )

	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		UpdateGamerprofile( self, element, controller )
	end )
	settingFrame.id = "settingFrame"
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.selectionList:close()
		element.Title:close()
		element.settingFrame:close()
		element.features:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

