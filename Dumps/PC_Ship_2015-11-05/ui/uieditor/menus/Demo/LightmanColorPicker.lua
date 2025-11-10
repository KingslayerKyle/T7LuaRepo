require( "ui.uieditor.widgets.Demo.LightmanColorElement" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disableBlur = true
	f1_arg0.disableDarkenElement = true
end

LUI.hudMenuType.LightmanColorPicker = "hud"
LUI.createMenu.LightmanColorPicker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LightmanColorPicker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LightmanColorPicker.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( false, false, -222.5, 222.5 )
	background:setTopBottom( false, true, -309, -149 )
	background:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	background:setAlpha( 0.3 )
	self:addElement( background )
	self.background = background
	
	local ColorPicker = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ColorPicker:makeFocusable()
	ColorPicker:setLeftRight( false, false, -220, 220 )
	ColorPicker:setTopBottom( false, true, -309, -149 )
	ColorPicker:setDataSource( "EmblemColorList" )
	ColorPicker:setWidgetType( CoD.LightmanColorElement )
	ColorPicker:setHorizontalCount( 13 )
	ColorPicker:setVerticalCount( 9 )
	ColorPicker:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		SelectLightmanColor( self, element, controller, self )
		return f3_local0
	end )
	self:AddButtonCallbackFunction( ColorPicker, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		SelectLightmanColor( self, element, controller, menu )
		GoBack( self, controller )
		SetGlobalModelValueFalse( "demo.showLightmanColorPicker" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return true
	end, false )
	self:addElement( ColorPicker )
	self.ColorPicker = ColorPicker
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f6_local0 = nil
		StoreCurrentLightmanColor( self, self, controller, self )
		if not f6_local0 then
			f6_local0 = self:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CancelLightmanColorSelection( self, element, controller, menu )
		GoBack( self, controller )
		SetGlobalModelValueFalse( "demo.showLightmanColorPicker" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	ColorPicker.id = "ColorPicker"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ColorPicker:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ColorPicker:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LightmanColorPicker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

