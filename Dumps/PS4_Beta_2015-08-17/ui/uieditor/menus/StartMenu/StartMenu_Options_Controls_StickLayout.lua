require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

DataSources.StickLayoutLabels = {
	getModel = function ( controller )
		DataSources.StickLayoutLabels.m_lastController = controller
		local stickLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "StickLayoutLabels" )
		if stickLayoutLabelsModel == nil then
			stickLayoutLabelsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StickLayoutLabels" )
			Engine.CreateModel( stickLayoutLabelsModel, "leftStickImg" )
			Engine.CreateModel( stickLayoutLabelsModel, "leftStickUpText" )
			Engine.CreateModel( stickLayoutLabelsModel, "leftStickDownText" )
			Engine.CreateModel( stickLayoutLabelsModel, "leftStickLeftRightText" )
			Engine.CreateModel( stickLayoutLabelsModel, "rightStickImg" )
			Engine.CreateModel( stickLayoutLabelsModel, "rightStickUpText" )
			Engine.CreateModel( stickLayoutLabelsModel, "rightStickDownText" )
			Engine.CreateModel( stickLayoutLabelsModel, "rightStickLeftRightText" )
		end
		return stickLayoutLabelsModel
	end,
	setModels = function ( stickStringsTable )
		local controller = DataSources.StickLayoutLabels.m_lastController
		local stickLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "StickLayoutLabels" )
		if not stickLayoutLabelsModel or not stickStringsTable then
			return 
		else
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "leftStickImg" ), stickStringsTable.STICK_L_IMG )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "leftStickUpText" ), stickStringsTable.STICK_L_UP )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "leftStickDownText" ), stickStringsTable.STICK_L_DOWN )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "leftStickLeftRightText" ), stickStringsTable.STICK_L_LR )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "rightStickImg" ), stickStringsTable.STICK_R_IMG )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "rightStickUpText" ), stickStringsTable.STICK_R_UP )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "rightStickDownText" ), stickStringsTable.STICK_R_DOWN )
			Engine.SetModelValue( Engine.GetModel( stickLayoutLabelsModel, "rightStickLeftRightText" ), stickStringsTable.STICK_R_LR )
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

local SetStickStringsFunctions = {
	[CoD.THUMBSTICK_DEFAULT + 1] = SetStickStringsDefault,
	[CoD.THUMBSTICK_SOUTHPAW + 1] = SetStickStringsSouthpaw,
	[CoD.THUMBSTICK_LEGACY + 1] = SetStickStringsLegacy,
	[CoD.THUMBSTICK_LEGACYSOUTHPAW + 1] = SetStickStringsLegacySouthpaw
}
local SetStickLayoutDisplayValues = function ( value )
	local controller = DataSources.StickLayoutLabels.m_lastController
	local isPitchInverted = tonumber( Engine.ProfileValueAsString( controller, "input_invertpitch" ) )
	local SetStickStringsFunc = SetStickStringsFunctions[value + 1]
	DataSources.StickLayoutLabels.setModels( SetStickStringsFunc( isPitchInverted ) )
end

local CreateModels_StickLayout = function ( controller )
	local profileVar = "gpad_sticksConfig"
	local options = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = CoD.THUMBSTICK_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_SOUTHPAW_CAPS" ),
			value = CoD.THUMBSTICK_SOUTHPAW
		},
		{
			name = Engine.Localize( "MENU_LEGACY_CAPS" ),
			value = CoD.THUMBSTICK_LEGACY
		},
		{
			name = Engine.Localize( "MENU_LEGACY_SOUTHPAW_CAPS" ),
			value = CoD.THUMBSTICK_LEGACYSOUTHPAW
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
LUI.createMenu.StartMenu_Options_Controls_StickLayout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_StickLayout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ModeSelection"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local titleText = LUI.UITightText.new()
	titleText:setLeftRight( true, false, 219, 502 )
	titleText:setTopBottom( true, false, 99, 147 )
	titleText:setText( Engine.Localize( "MENU_STICK_LAYOUT_CAPS" ) )
	titleText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( titleText )
	self.titleText = titleText
	
	local stickLayoutButtonList = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, true )
	stickLayoutButtonList:makeFocusable()
	stickLayoutButtonList:setLeftRight( true, false, 219, 889 )
	stickLayoutButtonList:setTopBottom( true, false, 147, 202 )
	stickLayoutButtonList:setDataSource( "StickLayout" )
	stickLayoutButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	stickLayoutButtonList:setSpacing( 1 )
	self:addElement( stickLayoutButtonList )
	self.stickLayoutButtonList = stickLayoutButtonList
	
	local durangoControllerImage = LUI.UIImage.new()
	durangoControllerImage:setLeftRight( true, false, 415, 865 )
	durangoControllerImage:setTopBottom( true, false, 224, 674 )
	durangoControllerImage:setAlpha( 0 )
	durangoControllerImage:setImage( RegisterImage( "uie_xenonone_controller_top" ) )
	self:addElement( durangoControllerImage )
	self.durangoControllerImage = durangoControllerImage
	
	local orbisControllerImage = LUI.UIImage.new()
	orbisControllerImage:setLeftRight( true, false, 415, 865 )
	orbisControllerImage:setTopBottom( true, false, 224, 674 )
	orbisControllerImage:setImage( RegisterImage( "uie_ps4_controller_top" ) )
	self:addElement( orbisControllerImage )
	self.orbisControllerImage = orbisControllerImage
	
	local leftStickOverlay = LUI.UIImage.new()
	leftStickOverlay:setLeftRight( true, false, 521, 621 )
	leftStickOverlay:setTopBottom( true, false, 464, 564 )
	leftStickOverlay:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickImg", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftStickOverlay:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( leftStickOverlay )
	self.leftStickOverlay = leftStickOverlay
	
	local rightStickOverlay = LUI.UIImage.new()
	rightStickOverlay:setLeftRight( true, false, 655, 755 )
	rightStickOverlay:setTopBottom( true, false, 464, 564 )
	rightStickOverlay:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickImg", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStickOverlay:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightStickOverlay )
	self.rightStickOverlay = rightStickOverlay
	
	local leftStickUpText = LUI.UIText.new()
	leftStickUpText:setLeftRight( true, false, 471, 671 )
	leftStickUpText:setTopBottom( true, false, 446, 464 )
	leftStickUpText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	leftStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickUpText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftStickUpText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( leftStickUpText )
	self.leftStickUpText = leftStickUpText
	
	local leftStickDownText = LUI.UIText.new()
	leftStickDownText:setLeftRight( true, false, 471, 671 )
	leftStickDownText:setTopBottom( true, false, 564, 582 )
	leftStickDownText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	leftStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickDownText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftStickDownText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( leftStickDownText )
	self.leftStickDownText = leftStickDownText
	
	local leftStickLeftRightText = LUI.UIText.new()
	leftStickLeftRightText:setLeftRight( true, false, 315, 515 )
	leftStickLeftRightText:setTopBottom( true, false, 505, 523 )
	leftStickLeftRightText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	leftStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickLeftRightText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftStickLeftRightText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( leftStickLeftRightText )
	self.leftStickLeftRightText = leftStickLeftRightText
	
	local rightStickUpText = LUI.UIText.new()
	rightStickUpText:setLeftRight( true, false, 605, 805 )
	rightStickUpText:setTopBottom( true, false, 446, 464 )
	rightStickUpText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	rightStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickUpText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStickUpText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rightStickUpText )
	self.rightStickUpText = rightStickUpText
	
	local rightStickDownText = LUI.UIText.new()
	rightStickDownText:setLeftRight( true, false, 605, 805 )
	rightStickDownText:setTopBottom( true, false, 564, 582 )
	rightStickDownText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	rightStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickDownText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStickDownText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rightStickDownText )
	self.rightStickDownText = rightStickDownText
	
	local rightStickLeftRightText = LUI.UIText.new()
	rightStickLeftRightText:setLeftRight( true, false, 755, 955 )
	rightStickLeftRightText:setTopBottom( true, false, 505, 523 )
	rightStickLeftRightText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	rightStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickLeftRightText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStickLeftRightText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rightStickLeftRightText )
	self.rightStickLeftRightText = rightStickLeftRightText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Orbis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
			end
		}
	}
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		ForceNotifyControllerModel( controller, "forceUpdateVehicleBindings" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	stickLayoutButtonList.id = "stickLayoutButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
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
		self.MenuFrame:close()
		self.leftStickOverlay:close()
		self.rightStickOverlay:close()
		self.leftStickUpText:close()
		self.leftStickDownText:close()
		self.leftStickLeftRightText:close()
		self.rightStickUpText:close()
		self.rightStickDownText:close()
		self.rightStickLeftRightText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

