require( "ui.uieditor.widgets.HUD.FadingSkipPrompt" )

local PreLoadFunc = function ( self, controller )
	local CreditsFinishedModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CreditsFinished" )
	Engine.SetModelValue( CreditsFinishedModel, false )
	self:subscribeToModel( CreditsFinishedModel, function ( model )
		if InSafehouseOrFrontend() and Engine.GetModelValue( model ) == true then
			GoBack( self, controller )
		end
	end )
end

local PostLoadFunc = function ( self, controller )
	if CursorInputEnabledForBuild() then
		self:setHandleMouse( true )
		self.ImageWithButtonPrompt:setHandleMouse( true )
	end
	self.Credit0:setupCredit( controller )
	local showButtonCondition = function ()
		return false
	end
	
	self.sticksDown = 0
	local showPrompts = function ()
		SetProperty( self, "showPrompt", true )
		PlayClipOnElement( self, {
			elementName = "skipPrompt",
			clipName = "Show"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "speedUpPrompt",
			clipName = "Show"
		}, controller )
	end
	
	local hidePrompts = function ()
		SetProperty( self, "showPrompt", false )
		PlayClipOnElement( self, {
			elementName = "skipPrompt",
			clipName = "Hide"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "speedUpPrompt",
			clipName = "Hide"
		}, controller )
		if self.skipHideTimer then
			self.skipHideTimer:close()
			self.skipHideTimer = nil
		end
	end
	
	local createSkipTimer = function ()
		self.skipHideTimer = LUI.UITimer.newElementTimer( 5000, true, hidePrompts )
		self:addElement( self.skipHideTimer )
	end
	
	local onButtonPressAction = function ( element, menu, controller, model )
		if self.sticksDown == 0 then
			if self.skipHideTimer then
				self.skipHideTimer:reset()
			else
				showPrompts()
				createSkipTimer()
			end
		end
	end
	
	local xButtonPress = function ( element, menu, controller, model )
		if PropertyIsTrue( self, "showPrompt" ) then
			Engine.PlaySound( "uin_paint_decal_nav" )
			if InSafehouseOrFrontend() then
				GoBack( menu, controller )
			else
				SendOwnMenuResponse( menu, controller, "skip" )
			end
		else
			onButtonPressAction( element, menu, controller, model )
		end
	end
	
	local onButtonPressActionIfDpad = function ( element, menu, controller, model )
		if IsDpadButton( model ) then
			onButtonPressAction( element, menu, controller, model )
		end
	end
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", xButtonPress, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, onButtonPressAction, showButtonCondition, false )
	if LUI.DEV == nil then
		self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, onButtonPressAction, showButtonCondition, false )
	end
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, onButtonPressAction, showButtonCondition, false )
	local stickDirs = {
		x = false,
		y = false
	}
	local stickChange = function ( controller, model, stick )
		local modelValue = Engine.GetModelValue( model )
		local f11_local0 = modelValue and math.abs( modelValue ) > 0.2
		if f11_local0 and not stickDirs[stick] then
			if self.skipHideTimer then
				self.skipHideTimer:close()
				self.skipHideTimer = nil
			elseif self.sticksDown == 0 then
				showPrompts()
			end
			self.sticksDown = self.sticksDown + 1
		elseif not f11_local0 and stickDirs[stick] then
			self.sticksDown = self.sticksDown - 1
			if self.sticksDown == 0 then
				createSkipTimer()
			end
		end
		stickDirs[stick] = f11_local0
	end
	
	self:subscribeToGlobalModel( controller, "PerController", "RightStick.X", function ( model )
		stickChange( controller, model, "x" )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "RightStick.Y", function ( model )
		stickChange( controller, model, "y" )
	end )
end

LUI.createMenu.Credit_Fullscreen = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Credit_Fullscreen" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Credit_Fullscreen.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ImageWithButtonPrompt = LUI.UIImage.new()
	ImageWithButtonPrompt:setLeftRight( 0, 1, 0, 0 )
	ImageWithButtonPrompt:setTopBottom( 0, 1, 0, 0 )
	ImageWithButtonPrompt:setRGB( 0, 0, 0 )
	ImageWithButtonPrompt:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
		return retVal
	end )
	ImageWithButtonPrompt:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ImageWithButtonPrompt, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, nil, function ( element, menu, controller, model )
		SendButtonPressToMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "", nil )
		return false
	end, false )
	self:addElement( ImageWithButtonPrompt )
	self.ImageWithButtonPrompt = ImageWithButtonPrompt
	
	local Credit0 = LUI.UIElement.new()
	Credit0:setLeftRight( 0, 1, 0, 0 )
	Credit0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Credit0 )
	self.Credit0 = Credit0
	
	local skipPrompt = CoD.FadingSkipPrompt.new( self, controller )
	skipPrompt:setLeftRight( 1, 1, -1824, -96 )
	skipPrompt:setTopBottom( 1, 1, -89, -51 )
	skipPrompt.pressXtext:setText( Engine.Localize( "PLATFORM_SKIP" ) )
	self:addElement( skipPrompt )
	self.skipPrompt = skipPrompt
	
	local speedUpPrompt = CoD.FadingSkipPrompt.new( self, controller )
	speedUpPrompt:setLeftRight( 1, 1, -1824, -96 )
	speedUpPrompt:setTopBottom( 1, 1, -126, -88 )
	speedUpPrompt.pressXtext:setText( Engine.Localize( "PLATFORM_CREDIT_SCROLL_SPEED" ) )
	self:addElement( speedUpPrompt )
	self.speedUpPrompt = speedUpPrompt
	
	self.resetProperties = function ()
		speedUpPrompt:completeAnimation()
		speedUpPrompt:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				speedUpPrompt:completeAnimation()
				self.speedUpPrompt:setAlpha( 0 )
				self.clipFinished( speedUpPrompt, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				local f22_local0
				if not IsGamepad( controller ) then
					f22_local0 = IsPC()
				else
					f22_local0 = false
				end
				return f22_local0
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
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.skipPrompt:close()
		self.speedUpPrompt:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Credit_Fullscreen.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

