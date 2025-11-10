require( "ui.uieditor.widgets.HUD.FadingSkipPrompt" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "CreditsFinished" )
	Engine.SetModelValue( f1_local0, false )
	self:subscribeToModel( f1_local0, function ( model )
		if InSafehouseOrFrontend() and Engine.GetModelValue( model ) == true then
			GoBack( self, controller )
		end
	end )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	if CoD.isPC then
		f3_arg0:setHandleMouse( true )
		f3_arg0.ImageWithButtonPrompt:setHandleMouse( true )
		Dvar.ui_creditsScrollScale:set( 1 )
	end
	f3_arg0.Credit0:setupCredit( f3_arg1 )
	local f3_local0 = function ()
		return false
	end
	
	f3_arg0.sticksDown = 0
	local f3_local1 = function ()
		SetProperty( f3_arg0, "showPrompt", true )
		PlayClipOnElement( f3_arg0, {
			elementName = "skipPrompt",
			clipName = "Show"
		}, f3_arg1 )
		PlayClipOnElement( f3_arg0, {
			elementName = "speedUpPrompt",
			clipName = "Show"
		}, f3_arg1 )
		PlayClipOnElement( f3_arg0, {
			elementName = "speedUpPromptMouse",
			clipName = "Show"
		}, f3_arg1 )
	end
	
	local f3_local2 = function ()
		SetProperty( f3_arg0, "showPrompt", false )
		PlayClipOnElement( f3_arg0, {
			elementName = "skipPrompt",
			clipName = "Hide"
		}, f3_arg1 )
		PlayClipOnElement( f3_arg0, {
			elementName = "speedUpPrompt",
			clipName = "Hide"
		}, f3_arg1 )
		PlayClipOnElement( f3_arg0, {
			elementName = "speedUpPromptMouse",
			clipName = "Hide"
		}, f3_arg1 )
		if f3_arg0.skipHideTimer then
			f3_arg0.skipHideTimer:close()
			f3_arg0.skipHideTimer = nil
		end
	end
	
	local f3_local3 = function ()
		f3_arg0.skipHideTimer = LUI.UITimer.newElementTimer( 5000, true, f3_local2 )
		f3_arg0:addElement( f3_arg0.skipHideTimer )
	end
	
	local f3_local4 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if CoD.isPC and IsGamepad( f8_arg2 ) then
			Dvar.ui_creditsScrollScale:set( 1 )
		end
		if f3_arg0.sticksDown == 0 then
			if f3_arg0.skipHideTimer then
				f3_arg0.skipHideTimer:reset()
			else
				f3_local1()
				f3_local3()
			end
		end
	end
	
	local f3_local5 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if CoD.isPC and IsGamepad( f9_arg2 ) then
			Dvar.ui_creditsScrollScale:set( 1 )
		end
		if PropertyIsTrue( f3_arg0, "showPrompt" ) then
			Engine.PlaySound( "uin_paint_decal_nav" )
			if InSafehouseOrFrontend() then
				GoBack( f9_arg1, f9_arg2 )
			else
				SendOwnMenuResponse( f9_arg1, f9_arg2, "skip" )
			end
		else
			f3_local4( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		end
	end
	
	local f3_local6 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsDpadButton( f10_arg3 ) then
			f3_local4( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		end
	end
	
	local f3_local7 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		local f11_local0 = Dvar.ui_creditsScrollScale:get()
		local f11_local1 = 0.2
		if f11_local0 > 1 then
			f11_local1 = 1
		end
		f11_local0 = f11_local0 - f11_local1
		if f11_local0 < 0.2 then
			f11_local0 = 0.2
		end
		Dvar.ui_creditsScrollScale:set( f11_local0 )
		f3_local4( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	end
	
	local f3_local8 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		local f12_local0 = Dvar.ui_creditsScrollScale:get()
		local f12_local1 = 1
		if f12_local0 < 1 then
			f12_local1 = 0.2
		end
		f12_local0 = f12_local0 + f12_local1
		if f12_local0 > 10 then
			f12_local0 = 10
		end
		Dvar.ui_creditsScrollScale:set( f12_local0 )
		f3_local4( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	end
	
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LEFT, nil, f3_local6, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_UP, nil, f3_local6, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RIGHT, nil, f3_local6, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_DOWN, nil, f3_local6, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", f3_local5, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, f3_local4, f3_local0, false )
	if LUI.DEV == nil then
		f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_BACK, nil, f3_local4, f3_local0, false )
	end
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_START, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LB, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RB, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LTRIG, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RTRIG, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, f3_local4, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_PCKEY_0, "MWHEELUP", f3_local7, f3_local0, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_PCKEY_1, "MWHEELDOWN", f3_local8, f3_local0, false )
	local f3_local9 = {
		x = false,
		y = false
	}
	local f3_local10 = function ( f13_arg0, f13_arg1, f13_arg2 )
		
	end
	
	f3_arg0:subscribeToGlobalModel( f3_arg1, "PerController", "RightStick.X", function ( model )
		if CoD.isPC and IsGamepad( f3_arg1 ) then
			Dvar.ui_creditsScrollScale:set( 1 )
		end
		f3_local10( f3_arg1, model, "x" )
	end )
	f3_arg0:subscribeToGlobalModel( f3_arg1, "PerController", "RightStick.Y", function ( model )
		if CoD.isPC and IsGamepad( f3_arg1 ) then
			Dvar.ui_creditsScrollScale:set( 1 )
		end
		f3_local10( f3_arg1, model, "y" )
	end )
end

LUI.createMenu.Credit_Fullscreen = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Credit_Fullscreen" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Credit_Fullscreen.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ImageWithButtonPrompt = LUI.UIImage.new()
	ImageWithButtonPrompt:setLeftRight( true, true, 0, 0 )
	ImageWithButtonPrompt:setTopBottom( true, true, 0, 0 )
	ImageWithButtonPrompt:setRGB( 0, 0, 0 )
	ImageWithButtonPrompt:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
		return f17_local0
	end )
	ImageWithButtonPrompt:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( ImageWithButtonPrompt, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, nil, function ( element, menu, controller, model )
		SendButtonPressToMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "" )
		return false
	end, false )
	self:addElement( ImageWithButtonPrompt )
	self.ImageWithButtonPrompt = ImageWithButtonPrompt
	
	local Credit0 = LUI.UIElement.new()
	Credit0:setLeftRight( true, true, 0, 0 )
	Credit0:setTopBottom( true, true, 0, 0 )
	self:addElement( Credit0 )
	self.Credit0 = Credit0
	
	local skipPrompt = CoD.FadingSkipPrompt.new( self, controller )
	skipPrompt:setLeftRight( false, true, -1216, -64 )
	skipPrompt:setTopBottom( false, true, -59, -34 )
	skipPrompt.pressXtext:setText( Engine.Localize( "PLATFORM_SKIP" ) )
	self:addElement( skipPrompt )
	self.skipPrompt = skipPrompt
	
	local speedUpPrompt = CoD.FadingSkipPrompt.new( self, controller )
	speedUpPrompt:setLeftRight( false, true, -1216, -64 )
	speedUpPrompt:setTopBottom( false, true, -84, -59 )
	speedUpPrompt.pressXtext:setText( Engine.Localize( "PLATFORM_CREDIT_SCROLL_SPEED" ) )
	self:addElement( speedUpPrompt )
	self.speedUpPrompt = speedUpPrompt
	
	local speedUpPromptMouse = CoD.FadingSkipPrompt.new( self, controller )
	speedUpPromptMouse:setLeftRight( false, true, -1216, -64 )
	speedUpPromptMouse:setTopBottom( false, true, -84, -59 )
	speedUpPromptMouse:setAlpha( 0 )
	speedUpPromptMouse.pressXtext:setText( Engine.Localize( "PLATFORM_CREDIT_SCROLL_SPEED_KM" ) )
	self:addElement( speedUpPromptMouse )
	self.speedUpPromptMouse = speedUpPromptMouse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				speedUpPrompt:completeAnimation()
				self.speedUpPrompt:setAlpha( 1 )
				self.clipFinished( speedUpPrompt, {} )
				speedUpPromptMouse:completeAnimation()
				self.speedUpPromptMouse:setAlpha( 0 )
				self.clipFinished( speedUpPromptMouse, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				speedUpPrompt:completeAnimation()
				self.speedUpPrompt:setAlpha( 0 )
				self.clipFinished( speedUpPrompt, {} )
				speedUpPromptMouse:completeAnimation()
				speedUpPromptMouse.pressXtext:completeAnimation()
				self.speedUpPromptMouse:setAlpha( 1 )
				self.speedUpPromptMouse.pressXtext:setText( Engine.Localize( "PLATFORM_CREDIT_SCROLL_SPEED_KM" ) )
				self.clipFinished( speedUpPromptMouse, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f16_local7 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f16_local7( self, event )
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
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.skipPrompt:close()
		element.speedUpPrompt:close()
		element.speedUpPromptMouse:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Credit_Fullscreen.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

