require( "ui.uieditor.widgets.Demo.DemoSideBarButton" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disableBlur = true
	f1_arg0.disableDarkenElement = true
	f1_arg0.animateInFromOffset = 355
	if f1_arg0.HintText and f1_arg0.ButtonList and f1_arg0.ButtonList.requestedRowCount <= 3 then
		local f1_local0 = 344
		f1_arg0.HintText:setTopBottom( true, false, f1_local0, f1_local0 + 18 )
	end
end

LUI.hudMenuType.TimelineEditorFilmOptions = "hud"
LUI.createMenu.TimelineEditorFilmOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TimelineEditorFilmOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TimelineEditorFilmOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( false, true, -333, 0 )
	black:setTopBottom( true, false, -38, 779 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.92 )
	self:addElement( black )
	self.black = black
	
	local texture = LUI.UIImage.new()
	texture:setLeftRight( false, true, -333, 79.5 )
	texture:setTopBottom( true, false, 57, 741 )
	texture:setAlpha( 0.75 )
	texture:setImage( RegisterImage( "uie_t7_codcaster_texturebacking" ) )
	self:addElement( texture )
	self.texture = texture
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( false, true, -309, -82 )
	Title:setTopBottom( true, false, 130, 151 )
	Title:setText( Engine.Localize( "MENU_OPTIONS_CAPS" ) )
	Title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local HintText = LUI.UIText.new()
	HintText:setLeftRight( false, true, -307, -82 )
	HintText:setTopBottom( true, false, 514, 532 )
	HintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HintText )
	self.HintText = HintText
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, true, -307, -82 )
	ButtonList:setTopBottom( true, false, 168, 478 )
	ButtonList:setDataSource( "DemoFilmOptionsButtonList" )
	ButtonList:setWidgetType( CoD.DemoSideBarButton )
	ButtonList:setVerticalCount( 6 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		GoBack( self, controller )
		SetGlobalModelValueFalse( "demo.showFilmOptionsSidebar" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	HintText:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			HintText:setText( Engine.Localize( hintText ) )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SetGlobalModelValueFalse( "demo.showFilmOptionsSidebar" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
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
		element.HintText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TimelineEditorFilmOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

