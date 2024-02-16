require( "ui.uieditor.widgets.ButtonIcon" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeLanguageSelectionListWidget" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeLanguageSelectLanguageWidget" )

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	self.unusedControllerAllowed = true
end

LUI.createMenu.FirstTimeLanguageSelectionSetting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FirstTimeLanguageSelectionSetting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeLanguageSelectionSetting.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 0, 0 )
	Image3:setTopBottom( true, true, 105, -107.5 )
	Image3:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( true, false, 0, 1280 )
	topBar:setTopBottom( true, false, 105, 110 )
	topBar:setRGB( 1, 0.67, 0 )
	self:addElement( topBar )
	self.topBar = topBar
	
	local bottomBar = LUI.UIImage.new()
	bottomBar:setLeftRight( true, false, 0, 1280 )
	bottomBar:setTopBottom( true, false, 610, 615 )
	bottomBar:setRGB( 0.48, 0.48, 0.48 )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( true, false, 467.24, 1216 )
	WelcomeTitle:setTopBottom( true, false, 143.45, 201.45 )
	WelcomeTitle:setText( Engine.Localize( "MENU_CHOOSE_LANGUAGE" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local ButtonPromptText = LUI.UIText.new()
	ButtonPromptText:setLeftRight( true, false, 493.24, 630 )
	ButtonPromptText:setTopBottom( true, false, 584.5, 603.5 )
	ButtonPromptText:setText( Engine.Localize( "MENU_SELECT" ) )
	ButtonPromptText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ButtonPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonPromptText )
	self.ButtonPromptText = ButtonPromptText
	
	local ButtonIcon = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon:setLeftRight( true, false, 451.24, 483.24 )
	ButtonIcon:setTopBottom( true, false, 578, 610 )
	ButtonIcon:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	ButtonIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	local buttonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 467.24, 747.24 )
	buttonList:setTopBottom( true, false, 308.75, 408.75 )
	buttonList:setDataSource( "FirstTimeLanguageSelection" )
	buttonList:setWidgetType( CoD.FirstTimeLanguageSelectionListWidget )
	buttonList:setVerticalCount( 3 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local FirstTimeLanguageSelectLanguageWidget = CoD.FirstTimeLanguageSelectLanguageWidget.new( menu, controller )
	FirstTimeLanguageSelectLanguageWidget:setLeftRight( true, false, 467.24, 661.24 )
	FirstTimeLanguageSelectLanguageWidget:setTopBottom( true, false, 210.8, 263.75 )
	self:addElement( FirstTimeLanguageSelectLanguageWidget )
	self.FirstTimeLanguageSelectLanguageWidget = FirstTimeLanguageSelectLanguageWidget
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	buttonList.id = "buttonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonIcon:close()
		self.buttonList:close()
		self.FirstTimeLanguageSelectLanguageWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeLanguageSelectionSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

