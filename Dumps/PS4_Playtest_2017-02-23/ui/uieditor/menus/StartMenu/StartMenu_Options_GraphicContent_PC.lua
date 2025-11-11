require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Button" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar" )

DataSources.OptionPCGraphicContent = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicContent", function ( controller )
	local graphicContentOptions = {}
	table.insert( graphicContentOptions, {
		models = {
			value = 0,
			valueDisplay = "MENU_DISABLED"
		}
	} )
	table.insert( graphicContentOptions, {
		models = {
			value = 1,
			valueDisplay = "MENU_ENABLED"
		}
	} )
	return graphicContentOptions
end, true )
DataSources.OptionPCGraphicContentUGC = DataSourceHelpers.ListSetup( "PC.OptionsPCGraphicContentUGC", function ( controller )
	local ugcOptions = {}
	table.insert( ugcOptions, {
		models = {
			value = 0,
			valueDisplay = "MENU_DISABLED"
		}
	} )
	table.insert( ugcOptions, {
		models = {
			value = 1,
			valueDisplay = "MENU_ENABLED"
		}
	} )
	return ugcOptions
end, true )
DataSources.OptionGraphicContentPC = DataSourceHelpers.ListSetup( "PC.OptionGraphicContentPC", function ( controller )
	local options = {}
	table.insert( options, {
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
	local ugcDesc = "MENU_USER_GENERATED_CONTENT_DESC"
	local f3_local0 = Engine.IsDeviceRestrictingContent
	if f3_local0 then
		local deviceRestrictingContent = Engine.IsDeviceRestrictingContent( controller )
	end
	if f3_local0 then
		ugcDesc = "PLATFORM_USER_GENERATED_CONTENT_DISABLED"
	end
	table.insert( options, {
		models = {
			label = "MENU_USER_GENERATED_CONTENT",
			description = ugcDesc,
			profileVarName = "cg_enableUGC",
			profileType = "user",
			widgetType = "dropdown",
			datasource = "OptionPCGraphicContentUGC",
			disabled = f3_local0
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	if controller == Engine.GetPrimaryController() then
		table.insert( options, {
			models = {
				label = "MENU_RESET_CAMPAIGN",
				description = "MENU_RESET_CAMPAIGN_DESC",
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( self, controller, menu )
					menu:OpenModalDialog( self, controller, "MENU_WARNING", "MENU_RESET_CAMPAIGN_WARNING", {
						"MPUI_YES",
						"MPUI_NO"
					}, function ( modalResult )
						if modalResult == 0 then
							Engine.ResetCampaign()
						end
						return true
					end )
				end
			}
		} )
	end
	return options
end, true )
DataSources.OptionGraphicContentPC.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "dropdown" then
			return CoD.OptionDropdown
		elseif widgetType == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif widgetType == "button" then
			return CoD.StartMenu_Options_Button
		end
	end
	return nil
end

local PostLoadFunc = function ( self, controller )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self.graphicsList.m_managedItemPriority = true
	self:registerEventHandler( "dropdown_triggered", function ( self, event )
		for row = 1, self.graphicsList.requestedRowCount, 1 do
			local widget = self.graphicsList:getItemAtPosition( row, 1 )
			if event.inUse then
				if widget ~= event.widget then
					widget.m_inputDisabled = true
				end
			end
			widget.m_inputDisabled = nil
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent_PC.buttonPrompts" )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_AUDIO_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_AUDIO_CAPS" ) )
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
	
	local graphicsList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	graphicsList:makeFocusable()
	graphicsList:setLeftRight( 0, 0, 96, 846 )
	graphicsList:setTopBottom( 0, 0, 198, 912 )
	graphicsList:setWidgetType( CoD.OptionDropdown )
	graphicsList:setVerticalCount( 14 )
	graphicsList:setSpacing( 0 )
	graphicsList:setDataSource( "OptionGraphicContentPC" )
	self:addElement( graphicsList )
	self.graphicsList = graphicsList
	
	local optionInfo = CoD.OptionInfoWidget.new( self, controller )
	optionInfo:setLeftRight( 0, 0, 960, 1560 )
	optionInfo:setTopBottom( 0, 0, 198, 648 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	optionInfo:linkToElementModel( graphicsList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfo.description:setText( Engine.Localize( modelValue ) )
		end
	end )
	optionInfo:linkToElementModel( graphicsList, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfo.title.itemName:setText( Engine.Localize( modelValue ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MenuFrame:close()
		self.StartMenulineGraphicsOptions0:close()
		self.graphicsList:close()
		self.optionInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

