-- 007eaf45c02c0191f8b783b94bbfeef6
-- This hash is used for caching, delete to decompile the file again

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
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( false, false, -222.5, 222.5 )
	background:setTopBottom( false, true, -309, -149 )
	background:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	background:setAlpha( 0.3 )
	self:addElement( background )
	self.background = background
	
	local ColorPicker = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ColorPicker:makeFocusable()
	ColorPicker:setLeftRight( false, false, -220, 220 )
	ColorPicker:setTopBottom( false, true, -309, -149 )
	ColorPicker:setWidgetType( CoD.LightmanColorElement )
	ColorPicker:setHorizontalCount( 13 )
	ColorPicker:setVerticalCount( 9 )
	ColorPicker:setDataSource( "EmblemColorList" )
	ColorPicker:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		SelectLightmanColor( self, element, controller, f2_local1 )
		return f3_local0
	end )
	ColorPicker:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	ColorPicker:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f2_local1:AddButtonCallbackFunction( ColorPicker, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		SelectLightmanColor( self, f6_arg0, f6_arg2, f6_arg1 )
		GoBack( self, f6_arg2 )
		SetGlobalModelValueFalse( "demo.showLightmanColorPicker" )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	f2_local1:AddButtonCallbackFunction( ColorPicker, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		SelectLightmanColor( self, f8_arg0, f8_arg2, f8_arg1 )
		GoBack( self, f8_arg2 )
		SetGlobalModelValueFalse( "demo.showLightmanColorPicker" )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_START, "" )
		return true
	end, false )
	self:addElement( ColorPicker )
	self.ColorPicker = ColorPicker
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		StoreCurrentLightmanColor( self, element, controller, f2_local1 )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		CancelLightmanColorSelection( self, f11_arg0, f11_arg2, f11_arg1 )
		GoBack( self, f11_arg2 )
		SetGlobalModelValueFalse( "demo.showLightmanColorPicker" )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	ColorPicker.id = "ColorPicker"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
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

