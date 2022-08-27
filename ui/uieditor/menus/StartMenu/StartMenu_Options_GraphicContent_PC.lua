-- 6b843bc1cf59bd754ab1320b3c6f382e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Button" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar" )

DataSources.OptionPCGraphicContent = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicContent", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			value = 0,
			valueDisplay = "MENU_DISABLED"
		}
	} )
	table.insert( f1_local0, {
		models = {
			value = 1,
			valueDisplay = "MENU_ENABLED"
		}
	} )
	return f1_local0
end, true )
DataSources.OptionPCGraphicContentUGC = DataSourceHelpers.ListSetup( "PC.OptionsPCGraphicContentUGC", function ( f2_arg0 )
	local f2_local0 = {}
	table.insert( f2_local0, {
		models = {
			value = 0,
			valueDisplay = "MENU_DISABLED"
		}
	} )
	table.insert( f2_local0, {
		models = {
			value = 1,
			valueDisplay = "MENU_ENABLED"
		}
	} )
	return f2_local0
end, true )
DataSources.OptionGraphicContentPC = DataSourceHelpers.ListSetup( "PC.OptionGraphicContentPC", function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, {
		models = {
			label = "MENU_GRAPHIC_CONTENT",
			description = "MENU_GRAPHIC_CONTENT_DESC",
			profileVarName = "cg_mature",
			profileType = "user",
			widgetType = "dropdown",
			datasource = "OptionPCGraphicContent"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	local f3_local1 = "MENU_USER_GENERATED_CONTENT_DESC"
	local f3_local2 = Engine.IsDeviceRestrictingContent
	if f3_local2 then
		f3_local2 = Engine.IsDeviceRestrictingContent( f3_arg0 )
	end
	if f3_local2 then
		f3_local1 = "PLATFORM_USER_GENERATED_CONTENT_DISABLED"
	end
	table.insert( f3_local0, {
		models = {
			label = "MENU_USER_GENERATED_CONTENT",
			description = f3_local1,
			profileVarName = "cg_enableUGC",
			profileType = "user",
			widgetType = "dropdown",
			datasource = "OptionPCGraphicContentUGC",
			disabled = f3_local2
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	return f3_local0
end, true )
DataSources.OptionGraphicContentPC.getWidgetTypeForItem = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg1 then
		local f4_local0 = Engine.GetModelValue( Engine.GetModel( f4_arg1, "widgetType" ) )
		if f4_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f4_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f4_local0 == "button" then
			return CoD.StartMenu_Options_Button
		end
	end
	return nil
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	f5_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f5_arg1
	} )
	f5_arg0.graphicsList.m_managedItemPriority = true
	f5_arg0:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f6_local0 = 1, element.graphicsList.requestedRowCount, 1 do
			local f6_local3 = element.graphicsList:getItemAtPosition( f6_local0, 1 )
			if event.inUse then
				if f6_local3 ~= event.widget then
					f6_local3.m_inputDisabled = true
				end
			end
			f6_local3.m_inputDisabled = nil
		end
	end )
end

LUI.createMenu.StartMenu_Options_GraphicContent_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_GraphicContent_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent_PC.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( f7_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_CONTENT_FILTER" ) ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_CONTENT_FILTER" ) ) )
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
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( f7_local1, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local graphicsList = LUI.UIList.new( f7_local1, controller, 0, 0, nil, false, false, 0, 0, false, false )
	graphicsList:makeFocusable()
	graphicsList:setLeftRight( true, false, 64, 564 )
	graphicsList:setTopBottom( true, false, 132, 608 )
	graphicsList:setDataSource( "OptionGraphicContentPC" )
	graphicsList:setWidgetType( CoD.OptionDropdown )
	graphicsList:setVerticalCount( 14 )
	graphicsList:setSpacing( 0 )
	self:addElement( graphicsList )
	self.graphicsList = graphicsList
	
	local optionInfo = CoD.OptionInfoWidget.new( f7_local1, controller )
	optionInfo:setLeftRight( true, false, 640, 1040 )
	optionInfo:setTopBottom( true, false, 132, 432 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	optionInfo:linkToElementModel( graphicsList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			optionInfo.description:setText( Engine.Localize( description ) )
		end
	end )
	optionInfo:linkToElementModel( graphicsList, "label", true, function ( model )
		local label = Engine.GetModelValue( model )
		if label then
			optionInfo.title.itemName:setText( Engine.Localize( label ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		ShowHeaderIconOnly( f7_local1 )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GoBack( self, f11_arg2 )
		UpdateGamerprofile( self, f11_arg0, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		CloseStartMenu( f13_arg1, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	graphicsList.id = "graphicsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.graphicsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.StartMenulineGraphicsOptions0:close()
		element.graphicsList:close()
		element.optionInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

