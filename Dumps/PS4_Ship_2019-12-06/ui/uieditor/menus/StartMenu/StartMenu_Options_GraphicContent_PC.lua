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
	if f3_arg0 == Engine.GetPrimaryController() then
		table.insert( f3_local0, {
			models = {
				label = "MENU_RESET_CAMPAIGN",
				description = "MENU_RESET_CAMPAIGN_DESC",
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( f4_arg0, f4_arg1, f4_arg2 )
					f4_arg2:OpenModalDialog( f4_arg0, f4_arg1, "MENU_WARNING", "MENU_RESET_CAMPAIGN_WARNING", {
						"MPUI_YES",
						"MPUI_NO"
					}, function ( f5_arg0 )
						if f5_arg0 == 0 then
							Engine.ResetCampaign()
						end
						return true
					end )
				end
			}
		} )
	end
	return f3_local0
end, true )
DataSources.OptionGraphicContentPC.getWidgetTypeForItem = function ( f6_arg0, f6_arg1, f6_arg2 )
	if f6_arg1 then
		local f6_local0 = Engine.GetModelValue( Engine.GetModel( f6_arg1, "widgetType" ) )
		if f6_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f6_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f6_local0 == "button" then
			return CoD.StartMenu_Options_Button
		end
	end
	return nil
end

local PostLoadFunc = function ( f7_arg0, f7_arg1 )
	f7_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f7_arg1
	} )
	f7_arg0.graphicsList.m_managedItemPriority = true
	f7_arg0:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f8_local0 = 1, element.graphicsList.requestedRowCount, 1 do
			local f8_local3 = element.graphicsList:getItemAtPosition( f8_local0, 1 )
			if event.inUse then
				if f8_local3 ~= event.widget then
					f8_local3.m_inputDisabled = true
				end
			end
			f8_local3.m_inputDisabled = nil
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_AUDIO_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_AUDIO_CAPS" ) )
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
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local graphicsList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	graphicsList:makeFocusable()
	graphicsList:setLeftRight( true, false, 64, 564 )
	graphicsList:setTopBottom( true, false, 132, 608 )
	graphicsList:setDataSource( "OptionGraphicContentPC" )
	graphicsList:setWidgetType( CoD.OptionDropdown )
	graphicsList:setVerticalCount( 14 )
	graphicsList:setSpacing( 0 )
	self:addElement( graphicsList )
	self.graphicsList = graphicsList
	
	local optionInfo = CoD.OptionInfoWidget.new( self, controller )
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f12_local0 = nil
		ShowHeaderIconOnly( self )
		if not f12_local0 then
			f12_local0 = self:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
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
	graphicsList.id = "graphicsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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

