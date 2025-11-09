require( "ui.uieditor.widgets.CodCaster.codcaster_options_slider_small" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disableBlur = true
	f1_arg0.disableDarkenElement = true
	f1_arg0.animateInFromOffset = 396
end

LUI.hudMenuType.DemoOptionsSidebar = "hud"
LUI.createMenu.DemoOptionsSidebar = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DemoOptionsSidebar" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DemoOptionsSidebar.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( false, true, -466.5, 22 )
	black:setTopBottom( true, false, -42, 775 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.95 )
	self:addElement( black )
	self.black = black
	
	local texture = LUI.UIImage.new()
	texture:setLeftRight( false, true, -466.5, 22 )
	texture:setTopBottom( true, false, 50, 721.05 )
	texture:setAlpha( 0.75 )
	texture:setImage( RegisterImage( "uie_t7_codcaster_texturebacking" ) )
	self:addElement( texture )
	self.texture = texture
	
	local GeneralOptionsTitle = LUI.UIText.new()
	GeneralOptionsTitle:setLeftRight( false, true, -457.75, -230.75 )
	GeneralOptionsTitle:setTopBottom( true, false, 50, 72 )
	GeneralOptionsTitle:setRGB( 1, 0.39, 0 )
	GeneralOptionsTitle:setText( LocalizeToUpperString( "DEMO_GENERAL_OPTIONS" ) )
	GeneralOptionsTitle:setTTF( "fonts/escom.ttf" )
	GeneralOptionsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GeneralOptionsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GeneralOptionsTitle )
	self.GeneralOptionsTitle = GeneralOptionsTitle
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, true, -456, -446.18 )
	Arrow:setTopBottom( true, false, 304.09, 313.91 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow_white" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Hint = LUI.UIText.new()
	Hint:setLeftRight( false, true, -441.5, -20 )
	Hint:setTopBottom( true, false, 296, 318 )
	Hint:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Hint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Hint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Hint )
	self.Hint = Hint
	
	local ButtonList = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, true, -473.5, -23.5 )
	ButtonList:setTopBottom( true, false, 78.78, 252.78 )
	ButtonList:setWidgetType( CoD.codcaster_options_slider_small )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( 1 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "DemoOptionsButtonList" )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local DirectorModeOptionsTitle = LUI.UIText.new()
	DirectorModeOptionsTitle:setLeftRight( false, true, -457.75, -230.75 )
	DirectorModeOptionsTitle:setTopBottom( true, false, 172.28, 194.28 )
	DirectorModeOptionsTitle:setRGB( 1, 0.39, 0 )
	DirectorModeOptionsTitle:setText( LocalizeToUpperString( "DEMO_DIRECTOR_MODE_OPTIONS" ) )
	DirectorModeOptionsTitle:setTTF( "fonts/escom.ttf" )
	DirectorModeOptionsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DirectorModeOptionsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DirectorModeOptionsTitle )
	self.DirectorModeOptionsTitle = DirectorModeOptionsTitle
	
	local BackBtnPrompt = CoD.FooterButtonPrompt.new( self, controller )
	BackBtnPrompt:setLeftRight( false, true, -465.25, -344.25 )
	BackBtnPrompt:setTopBottom( true, false, 670, 702 )
	BackBtnPrompt.label:setText( Engine.Localize( "MP_BACK" ) )
	BackBtnPrompt.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	BackBtnPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			BackBtnPrompt.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	BackBtnPrompt:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	BackBtnPrompt:linkToElementModel( BackBtnPrompt, nil, true, function ( model )
		self:updateElementState( BackBtnPrompt, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if BackBtnPrompt.m_eventHandlers.input_source_changed then
		local f2_local10 = BackBtnPrompt.m_eventHandlers.input_source_changed
		BackBtnPrompt:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or self
			element:updateState( event )
			return f2_local10( element, event )
		end )
	else
		BackBtnPrompt:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	BackBtnPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( BackBtnPrompt, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( BackBtnPrompt )
	self.BackBtnPrompt = BackBtnPrompt
	
	Hint:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			Hint:setText( Engine.Localize( hintText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetGlobalModelValueFalse( "demo.showOptionsSidebar" )
		UpdateGamerprofile( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	ButtonList.id = "ButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.BackBtnPrompt:close()
		element.Hint:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DemoOptionsSidebar.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

