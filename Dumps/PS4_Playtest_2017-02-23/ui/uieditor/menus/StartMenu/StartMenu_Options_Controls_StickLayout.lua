require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Controls_GenericControllerItem" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )

local isPitchInverted = function ( controller )
	return tonumber( Engine.ProfileValueAsString( controller, "input_invertpitch" ) ) == 1
end

local SetStickStringsFunctions = {}
DataSources.StickLayoutLabels = {
	getModel = function ( controller )
		DataSources.StickLayoutLabels.m_lastController = controller
		local stickLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "StickLayoutLabels" )
		if stickLayoutLabelsModel == nil then
			stickLayoutLabelsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StickLayoutLabels" )
			local createBaseModel = function ( modelStart )
				Engine.CreateModel( stickLayoutLabelsModel, modelStart .. ".text" )
				Engine.CreateModel( stickLayoutLabelsModel, modelStart .. ".isDefault" )
			end
			
			Engine.CreateModel( stickLayoutLabelsModel, "leftStickImg" )
			Engine.CreateModel( stickLayoutLabelsModel, "rightStickImg" )
			createBaseModel( "leftStickUp" )
			createBaseModel( "leftStickDown" )
			createBaseModel( "leftStickLeftRight" )
			createBaseModel( "rightStickUp" )
			createBaseModel( "rightStickDown" )
			createBaseModel( "rightStickLeftRight" )
		end
		return stickLayoutLabelsModel
	end,
	setStickModel = function ( defaultLayout, stickLayoutLabelsModel, stickStringsTable, modelName, stickDir )
		Engine.SetModelValue( Engine.CreateModel( stickLayoutLabelsModel, modelName .. ".text" ), stickStringsTable[stickDir] )
		Engine.SetModelValue( Engine.CreateModel( stickLayoutLabelsModel, modelName .. ".isDefault" ), stickStringsTable[stickDir] == defaultLayout[stickDir] )
	end,
	setModels = function ( stickStringsTable )
		local controller = DataSources.StickLayoutLabels.m_lastController
		local stickLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "StickLayoutLabels" )
		local defaultLayout = SetStickStringsFunctions[Enum.GPadStickConfigs.THUMBSTICK_DEFAULT + 1]( isPitchInverted( controller ) )
		if not stickLayoutLabelsModel or not stickStringsTable then
			return 
		else
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "leftStickImg" ), stickStringsTable.STICK_L_IMG )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "rightStickImg" ), stickStringsTable.STICK_R_IMG )
			DataSources.StickLayoutLabels.setStickModel( defaultLayout, stickLayoutLabelsModel, stickStringsTable, "leftStickUp", "STICK_L_UP" )
			DataSources.StickLayoutLabels.setStickModel( defaultLayout, stickLayoutLabelsModel, stickStringsTable, "leftStickDown", "STICK_L_DOWN" )
			DataSources.StickLayoutLabels.setStickModel( defaultLayout, stickLayoutLabelsModel, stickStringsTable, "leftStickLeftRight", "STICK_L_LR" )
			DataSources.StickLayoutLabels.setStickModel( defaultLayout, stickLayoutLabelsModel, stickStringsTable, "rightStickUp", "STICK_R_UP" )
			DataSources.StickLayoutLabels.setStickModel( defaultLayout, stickLayoutLabelsModel, stickStringsTable, "rightStickDown", "STICK_R_DOWN" )
			DataSources.StickLayoutLabels.setStickModel( defaultLayout, stickLayoutLabelsModel, stickStringsTable, "rightStickLeftRight", "STICK_R_LR" )
		end
	end
}
local SetStickStringsDefault = function ( isPitchInverted )
	local stickLayoutStrings = {
		STICK_L_IMG = "xenon_stick_move",
		STICK_L_UP = "MENU_MOVE_FORWARD",
		STICK_L_DOWN = "MENU_MOVE_BACK",
		STICK_L_LR = "MENU_STRAFE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_turn",
		STICK_R_UP = "MENU_LOOK_UP",
		STICK_R_DOWN = "MENU_LOOK_DOWN",
		STICK_R_LR = "MENU_ROTATE_LEFT_RIGHT"
	}
	if isPitchInverted then
		stickLayoutStrings.STICK_R_UP = "MENU_LOOK_DOWN"
		stickLayoutStrings.STICK_R_DOWN = "MENU_LOOK_UP"
	end
	return stickLayoutStrings
end

local SetStickStringsSouthpaw = function ( isPitchInverted )
	local stickLayoutStrings = {
		STICK_L_IMG = "xenon_stick_turn",
		STICK_L_UP = "MENU_LOOK_UP",
		STICK_L_DOWN = "MENU_LOOK_DOWN",
		STICK_L_LR = "MENU_ROTATE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_move",
		STICK_R_UP = "MENU_MOVE_FORWARD",
		STICK_R_DOWN = "MENU_MOVE_BACK",
		STICK_R_LR = "MENU_STRAFE_LEFT_RIGHT"
	}
	if isPitchInverted then
		stickLayoutStrings.STICK_L_UP = "MENU_LOOK_DOWN"
		stickLayoutStrings.STICK_L_DOWN = "MENU_LOOK_UP"
	end
	return stickLayoutStrings
end

local SetStickStringsLegacy = function ( isPitchInverted )
	local stickLayoutStrings = {
		STICK_L_IMG = "xenon_stick_move_turn",
		STICK_L_UP = "MENU_MOVE_FORWARD",
		STICK_L_DOWN = "MENU_MOVE_BACK",
		STICK_L_LR = "MENU_ROTATE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_move_look",
		STICK_R_UP = "MENU_LOOK_UP",
		STICK_R_DOWN = "MENU_LOOK_DOWN",
		STICK_R_LR = "MENU_STRAFE_LEFT_RIGHT"
	}
	if isPitchInverted then
		stickLayoutStrings.STICK_R_UP = "MENU_LOOK_DOWN"
		stickLayoutStrings.STICK_R_DOWN = "MENU_LOOK_UP"
	end
	return stickLayoutStrings
end

local SetStickStringsLegacySouthpaw = function ( isPitchInverted )
	local stickLayoutStrings = {
		STICK_L_IMG = "xenon_stick_move_look",
		STICK_L_UP = "MENU_LOOK_UP",
		STICK_L_DOWN = "MENU_LOOK_DOWN",
		STICK_L_LR = "MENU_STRAFE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_move_turn",
		STICK_R_UP = "MENU_MOVE_FORWARD",
		STICK_R_DOWN = "MENU_MOVE_BACK",
		STICK_R_LR = "MENU_ROTATE_LEFT_RIGHT"
	}
	if isPitchInverted then
		stickLayoutStrings.STICK_L_UP = "MENU_LOOK_DOWN"
		stickLayoutStrings.STICK_L_DOWN = "MENU_LOOK_UP"
	end
	return stickLayoutStrings
end

SetStickStringsFunctions[Enum.GPadStickConfigs.THUMBSTICK_DEFAULT + 1] = SetStickStringsDefault
SetStickStringsFunctions[Enum.GPadStickConfigs.THUMBSTICK_SOUTHPAW + 1] = SetStickStringsSouthpaw
SetStickStringsFunctions[Enum.GPadStickConfigs.THUMBSTICK_LEGACY + 1] = SetStickStringsLegacy
SetStickStringsFunctions[Enum.GPadStickConfigs.THUMBSTICK_LEGACYSOUTHPAW + 1] = SetStickStringsLegacySouthpaw
local SetStickLayoutDisplayValues = function ( value )
	local controller = DataSources.StickLayoutLabels.m_lastController
	local isPitchInverted = isPitchInverted( controller )
	local SetStickStringsFunc = SetStickStringsFunctions[value + 1]
	DataSources.StickLayoutLabels.setModels( SetStickStringsFunc( isPitchInverted ) )
end

local CreateModels_StickLayout = function ( controller )
	local profileVar = "gpad_sticksConfig"
	local options = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = Enum.GPadStickConfigs.THUMBSTICK_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_SOUTHPAW_CAPS" ),
			value = Enum.GPadStickConfigs.THUMBSTICK_SOUTHPAW
		},
		{
			name = Engine.Localize( "MENU_LEGACY_CAPS" ),
			value = Enum.GPadStickConfigs.THUMBSTICK_LEGACY
		},
		{
			name = Engine.Localize( "MENU_LEGACY_SOUTHPAW_CAPS" ),
			value = Enum.GPadStickConfigs.THUMBSTICK_LEGACYSOUTHPAW
		}
	}
	local listInfo = {
		models = {
			name = "PLATFORM_STICK_LAYOUT_CAPS",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "StickLayoutOptions_StickLayout", options, profileVar, SetStickLayoutDisplayValues, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

DataSources.StickLayout = DataSourceHelpers.ListSetup( "StickLayout", function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateModels_StickLayout( controller ) )
	return optionsTable
end, true )
if CoD.isPC then
	DataSources.StickLayoutDropdownPresets = DataSourceHelpers.ListSetup( "PC.StickLayoutDropdownPresets", function ( controller )
		local presetOptions = {}
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadStickConfigs.THUMBSTICK_DEFAULT,
				valueDisplay = "MENU_DEFAULT_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadStickConfigs.THUMBSTICK_SOUTHPAW,
				valueDisplay = "MENU_SOUTHPAW_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadStickConfigs.THUMBSTICK_LEGACY,
				valueDisplay = "MENU_LEGACY_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadStickConfigs.THUMBSTICK_LEGACYSOUTHPAW,
				valueDisplay = "MENU_LEGACY_SOUTHPAW_CAPS"
			}
		} )
		return presetOptions
	end, true )
	DataSources.StickLayoutDropdown = DataSourceHelpers.ListSetup( "StickLayoutDropdown", function ( controller )
		local optionsTable = {}
		table.insert( optionsTable, {
			models = {
				label = "PLATFORM_STICK_LAYOUT",
				profileVarName = "gpad_sticksConfig",
				profileType = "user",
				datasource = "StickLayoutDropdownPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		return optionsTable
	end, true )
	DataSources.StickLayoutDropdown.getWidgetTypeForItem = function ( list, dataItemModel, row )
		if dataItemModel then
			local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
			if widgetType == "dropdown" then
				return CoD.OptionDropdown
			end
		end
		return nil
	end
	
end
local SetupPC = function ( self, controller, menu )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self:registerEventHandler( "dropdown_triggered", function ( self, event )
		for row = 1, self.stickLayoutDropdownList.requestedRowCount, 1 do
			local widget = self.stickLayoutDropdownList:getItemAtPosition( row, 1 )
			if event.inUse then
				if widget ~= event.widget then
					widget.m_inputDisabled = true
				end
			end
			widget.m_inputDisabled = nil
		end
	end )
	self.stickLayoutDropdownList.m_managedItemPriority = true
	self.stickLayoutDropdownList:registerEventHandler( "dropdown_triggered", function ( element, event )
		if not event.inUse then
			local currentValue = event.widget.dropDownCurrentValue( controller, element )
			SetStickLayoutDisplayValues( currentValue )
			CoD.PCUtil.RefreshAllOptions( self, controller )
		end
		element:dispatchEventToParent( event )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	local value = tonumber( Engine.ProfileValueAsString( controller, "gpad_sticksConfig" ) )
	SetStickLayoutDisplayValues( value )
	self.stickLayoutButtonList.navigation = nil
	self.stickLayoutDropdownList.navigation = nil
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

LUI.createMenu.StartMenu_Options_Controls_StickLayout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_StickLayout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local stickLayoutButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	stickLayoutButtonList:makeFocusable()
	stickLayoutButtonList:setLeftRight( 0, 0, 329, 1334 )
	stickLayoutButtonList:setTopBottom( 0, 0, 154, 236 )
	stickLayoutButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	stickLayoutButtonList:setDataSource( "StickLayout" )
	self:addElement( stickLayoutButtonList )
	self.stickLayoutButtonList = stickLayoutButtonList
	
	local durangoControllerImage = LUI.UIImage.new()
	durangoControllerImage:setLeftRight( 0, 0, 396, 1524 )
	durangoControllerImage:setTopBottom( 0, 0, 422, 926 )
	durangoControllerImage:setAlpha( 0 )
	durangoControllerImage:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_xboxone" ) )
	self:addElement( durangoControllerImage )
	self.durangoControllerImage = durangoControllerImage
	
	local orbisControllerImage = LUI.UIImage.new()
	orbisControllerImage:setLeftRight( 0, 0, 386, 1514 )
	orbisControllerImage:setTopBottom( 0, 0, 407, 911 )
	orbisControllerImage:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_ps4" ) )
	self:addElement( orbisControllerImage )
	self.orbisControllerImage = orbisControllerImage
	
	local vitaControllerImage = LUI.UIImage.new()
	vitaControllerImage:setLeftRight( 0, 0, 96, 1824 )
	vitaControllerImage:setTopBottom( 0, 0, 262, 1034 )
	vitaControllerImage:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_psvita_single" ) )
	self:addElement( vitaControllerImage )
	self.vitaControllerImage = vitaControllerImage
	
	local leftStickOverlay = LUI.UIImage.new()
	leftStickOverlay:setLeftRight( 0, 0, 648, 798 )
	leftStickOverlay:setTopBottom( 0, 0, 567, 717 )
	leftStickOverlay:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickImg", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftStickOverlay:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( leftStickOverlay )
	self.leftStickOverlay = leftStickOverlay
	
	local rightStickOverlay = LUI.UIImage.new()
	rightStickOverlay:setLeftRight( 0, 0, 981, 1131 )
	rightStickOverlay:setTopBottom( 0, 0, 693, 843 )
	rightStickOverlay:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickImg", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStickOverlay:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightStickOverlay )
	self.rightStickOverlay = rightStickOverlay
	
	local leftStickUpText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickUpText:setLeftRight( 0, 0, 573, 873 )
	leftStickUpText:setTopBottom( 0, 0, 540, 567 )
	leftStickUpText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickUp", function ( model )
		leftStickUpText:setModel( model, controller )
	end )
	self:addElement( leftStickUpText )
	self.leftStickUpText = leftStickUpText
	
	local leftStickDownText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickDownText:setLeftRight( 0, 0, 573, 873 )
	leftStickDownText:setTopBottom( 0, 0, 717, 744 )
	leftStickDownText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickDown", function ( model )
		leftStickDownText:setModel( model, controller )
	end )
	self:addElement( leftStickDownText )
	self.leftStickDownText = leftStickDownText
	
	local leftStickLeftRightText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickLeftRightText:setLeftRight( 0, 0, 339, 639 )
	leftStickLeftRightText:setTopBottom( 0, 0, 628, 655 )
	leftStickLeftRightText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickLeftRight", function ( model )
		leftStickLeftRightText:setModel( model, controller )
	end )
	self:addElement( leftStickLeftRightText )
	self.leftStickLeftRightText = leftStickLeftRightText
	
	local rightStickUpText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickUpText:setLeftRight( 0, 0, 906, 1206 )
	rightStickUpText:setTopBottom( 0, 0, 666, 693 )
	rightStickUpText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickUp", function ( model )
		rightStickUpText:setModel( model, controller )
	end )
	self:addElement( rightStickUpText )
	self.rightStickUpText = rightStickUpText
	
	local rightStickDownText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickDownText:setLeftRight( 0, 0, 906, 1206 )
	rightStickDownText:setTopBottom( 0, 0, 843, 870 )
	rightStickDownText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickDown", function ( model )
		rightStickDownText:setModel( model, controller )
	end )
	self:addElement( rightStickDownText )
	self.rightStickDownText = rightStickDownText
	
	local rightStickLeftRightText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickLeftRightText:setLeftRight( 0, 0, 1131, 1431 )
	rightStickLeftRightText:setTopBottom( 0, 0, 754, 781 )
	rightStickLeftRightText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickLeftRight", function ( model )
		rightStickLeftRightText:setModel( model, controller )
	end )
	self:addElement( rightStickLeftRightText )
	self.rightStickLeftRightText = rightStickLeftRightText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local stickLayoutDropdownList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	stickLayoutDropdownList:makeFocusable()
	stickLayoutDropdownList:setLeftRight( 0, 0, 391, 1141 )
	stickLayoutDropdownList:setTopBottom( 0, 0, 236, 287 )
	stickLayoutDropdownList:setAlpha( 0 )
	stickLayoutDropdownList:setWidgetType( CoD.OptionDropdown )
	stickLayoutDropdownList:setSpacing( 0 )
	stickLayoutDropdownList:setDataSource( "StickLayoutDropdown" )
	self:addElement( stickLayoutDropdownList )
	self.stickLayoutDropdownList = stickLayoutDropdownList
	
	stickLayoutButtonList.navigation = {
		down = stickLayoutDropdownList
	}
	stickLayoutDropdownList.navigation = {
		up = stickLayoutButtonList
	}
	self.resetProperties = function ()
		leftStickOverlay:completeAnimation()
		leftStickUpText:completeAnimation()
		leftStickDownText:completeAnimation()
		leftStickLeftRightText:completeAnimation()
		durangoControllerImage:completeAnimation()
		orbisControllerImage:completeAnimation()
		vitaControllerImage:completeAnimation()
		stickLayoutDropdownList:completeAnimation()
		stickLayoutButtonList:completeAnimation()
		rightStickOverlay:completeAnimation()
		rightStickUpText:completeAnimation()
		rightStickDownText:completeAnimation()
		rightStickLeftRightText:completeAnimation()
		leftStickOverlay:setLeftRight( 0, 0, 648, 798 )
		leftStickOverlay:setTopBottom( 0, 0, 567, 717 )
		leftStickUpText:setLeftRight( 0, 0, 573, 873 )
		leftStickUpText:setTopBottom( 0, 0, 540, 567 )
		leftStickDownText:setLeftRight( 0, 0, 573, 873 )
		leftStickDownText:setTopBottom( 0, 0, 717, 744 )
		leftStickLeftRightText:setLeftRight( 0, 0, 339, 639 )
		leftStickLeftRightText:setTopBottom( 0, 0, 628, 655 )
		durangoControllerImage:setLeftRight( 0, 0, 396, 1524 )
		durangoControllerImage:setTopBottom( 0, 0, 422, 926 )
		durangoControllerImage:setAlpha( 0 )
		orbisControllerImage:setLeftRight( 0, 0, 386, 1514 )
		orbisControllerImage:setTopBottom( 0, 0, 407, 911 )
		orbisControllerImage:setAlpha( 1 )
		vitaControllerImage:setAlpha( 1 )
		stickLayoutDropdownList:setAlpha( 0 )
		stickLayoutButtonList:setAlpha( 1 )
		rightStickOverlay:setLeftRight( 0, 0, 981, 1131 )
		rightStickOverlay:setTopBottom( 0, 0, 693, 843 )
		rightStickUpText:setLeftRight( 0, 0, 906, 1206 )
		rightStickUpText:setTopBottom( 0, 0, 666, 693 )
		rightStickDownText:setLeftRight( 0, 0, 906, 1206 )
		rightStickDownText:setTopBottom( 0, 0, 843, 870 )
		rightStickLeftRightText:setLeftRight( 0, 0, 1131, 1431 )
		rightStickLeftRightText:setTopBottom( 0, 0, 754, 781 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( 0, 0, 622.5, 1297.5 )
				self.durangoControllerImage:setTopBottom( 0, 0, 336.5, 1011.5 )
				self.clipFinished( durangoControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( 0, 0, 756, 906 )
				self.leftStickOverlay:setTopBottom( 0, 0, 695, 845 )
				self.clipFinished( leftStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( 0, 0, 681, 981 )
				self.leftStickUpText:setTopBottom( 0, 0, 668, 695 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( 0, 0, 681, 981 )
				self.leftStickDownText:setTopBottom( 0, 0, 844, 871 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( 0, 0, 447, 747 )
				self.leftStickLeftRightText:setTopBottom( 0, 0, 756, 783 )
				self.clipFinished( leftStickLeftRightText, {} )
			end
		},
		Orbis = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( 0, 0, 622.5, 1297.5 )
				self.durangoControllerImage:setTopBottom( 0, 0, 336.5, 1011.5 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setLeftRight( 0, 0, 86, 1814 )
				self.orbisControllerImage:setTopBottom( 0, 0, 273, 1045 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( 0, 0, 756, 906 )
				self.leftStickOverlay:setTopBottom( 0, 0, 695, 845 )
				self.clipFinished( leftStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( 0, 0, 681, 981 )
				self.leftStickUpText:setTopBottom( 0, 0, 668, 695 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( 0, 0, 681, 981 )
				self.leftStickDownText:setTopBottom( 0, 0, 844, 871 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( 0, 0, 447, 747 )
				self.leftStickLeftRightText:setTopBottom( 0, 0, 756, 783 )
				self.clipFinished( leftStickLeftRightText, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( 0, 0, -6, 1894 )
				self.durangoControllerImage:setTopBottom( 0, 0, 256, 1054 )
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( 0, 0, 651, 801 )
				self.leftStickOverlay:setTopBottom( 0, 0, 583, 733 )
				self.clipFinished( leftStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( 0, 0, 576, 876 )
				self.leftStickUpText:setTopBottom( 0, 0, 556, 583 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( 0, 0, 576, 876 )
				self.leftStickDownText:setTopBottom( 0, 0, 733, 760 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( 0, 0, 342, 642 )
				self.leftStickLeftRightText:setTopBottom( 0, 0, 644, 671 )
				self.clipFinished( leftStickLeftRightText, {} )
			end
		},
		PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				stickLayoutButtonList:completeAnimation()
				self.stickLayoutButtonList:setAlpha( 0 )
				self.clipFinished( stickLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( 0, 0, 622.5, 1297.5 )
				self.durangoControllerImage:setTopBottom( 0, 0, 336.5, 1011.5 )
				self.clipFinished( durangoControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( 0, 0, 756, 906 )
				self.leftStickOverlay:setTopBottom( 0, 0, 695, 845 )
				self.clipFinished( leftStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( 0, 0, 681, 981 )
				self.leftStickUpText:setTopBottom( 0, 0, 668, 695 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( 0, 0, 681, 981 )
				self.leftStickDownText:setTopBottom( 0, 0, 844, 871 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( 0, 0, 447, 747 )
				self.leftStickLeftRightText:setTopBottom( 0, 0, 756, 783 )
				self.clipFinished( leftStickLeftRightText, {} )
				stickLayoutDropdownList:completeAnimation()
				self.stickLayoutDropdownList:setAlpha( 1 )
				self.clipFinished( stickLayoutDropdownList, {} )
			end
		},
		Vita = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( 0, 0, 622.5, 1297.5 )
				self.durangoControllerImage:setTopBottom( 0, 0, 336.5, 1011.5 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( 0, 0, 541, 653 )
				self.leftStickOverlay:setTopBottom( 0, 0, 653, 765 )
				self.clipFinished( leftStickOverlay, {} )
				rightStickOverlay:completeAnimation()
				self.rightStickOverlay:setLeftRight( 0, 0, 1264.5, 1375.5 )
				self.rightStickOverlay:setTopBottom( 0, 0, 654.5, 765.5 )
				self.clipFinished( rightStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( 0, 0, 550, 850 )
				self.leftStickUpText:setTopBottom( 0, 0, 640, 667 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( 0, 0, 566, 866 )
				self.leftStickDownText:setTopBottom( 0, 0, 765, 792 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( 0, 0, 232, 532 )
				self.leftStickLeftRightText:setTopBottom( 0, 0, 695, 722 )
				self.clipFinished( leftStickLeftRightText, {} )
				rightStickUpText:completeAnimation()
				self.rightStickUpText:setLeftRight( 0, 0, 1076, 1376 )
				self.rightStickUpText:setTopBottom( 0, 0, 639, 666 )
				self.clipFinished( rightStickUpText, {} )
				rightStickDownText:completeAnimation()
				self.rightStickDownText:setLeftRight( 0, 0, 1060, 1360 )
				self.rightStickDownText:setTopBottom( 0, 0, 770, 797 )
				self.clipFinished( rightStickDownText, {} )
				rightStickLeftRightText:completeAnimation()
				self.rightStickLeftRightText:setLeftRight( 0, 0, 1376, 1676 )
				self.rightStickLeftRightText:setTopBottom( 0, 0, 695, 722 )
				self.clipFinished( rightStickLeftRightText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Orbis",
			condition = function ( menu, element, event )
				return IsOrbisGamepad( controller )
			end
		},
		{
			stateName = "Durango",
			condition = function ( menu, element, event )
				return IsDurangoGamepad( controller )
			end
		},
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		},
		{
			stateName = "Vita",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if IsPC() then
			SetFocusToElement( self, "stickLayoutDropdownList", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ForceNotifyControllerModel( controller, "forceUpdateVehicleBindings" )
		UpdateGamerprofile( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	stickLayoutButtonList.id = "stickLayoutButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	stickLayoutDropdownList.id = "stickLayoutDropdownList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.stickLayoutButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.stickLayoutButtonList:close()
		self.leftStickUpText:close()
		self.leftStickDownText:close()
		self.leftStickLeftRightText:close()
		self.rightStickUpText:close()
		self.rightStickDownText:close()
		self.rightStickLeftRightText:close()
		self.MenuFrame:close()
		self.stickLayoutDropdownList:close()
		self.leftStickOverlay:close()
		self.rightStickOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

