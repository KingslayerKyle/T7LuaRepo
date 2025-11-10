require( "ui.uieditor.widgets.FooterButtonPrompt" )

CoD.DemoPlaybackControlsButtons = InheritFrom( LUI.UIElement )
CoD.DemoPlaybackControlsButtons.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoPlaybackControlsButtons )
	self.id = "DemoPlaybackControlsButtons"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1200 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	local Select = CoD.FooterButtonPrompt.new( menu, controller )
	Select:setLeftRight( true, false, 0, 100 )
	Select:setTopBottom( true, false, 0, 32 )
	Select.label:setText( Engine.Localize( "MENU_SELECT" ) )
	Select.keyPrompt.keybind:setText( Engine.Localize( "KEY_ENTER" ) )
	Select:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			Select.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	Select:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsGamepad( controller ) then
					f4_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	Select:linkToElementModel( Select, nil, true, function ( model )
		menu:updateElementState( Select, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if Select.m_eventHandlers.input_source_changed then
		local Controls = Select.m_eventHandlers.input_source_changed
		Select:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return Controls( element, event )
		end )
	else
		Select:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	Select:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( Select, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( Select )
	self.Select = Select
	
	local Controls = CoD.FooterButtonPrompt.new( menu, controller )
	Controls:setLeftRight( true, false, 125, 230 )
	Controls:setTopBottom( true, false, 0, 32 )
	Controls.label:setText( Engine.Localize( "MENU_CONTROLS" ) )
	Controls.keyPrompt.keybind:setText( Engine.Localize( "KEY_ARROWS" ) )
	Controls:subscribeToGlobalModel( controller, "Controller", "dpad_all_button_image", function ( model )
		local dpadAllButtonImage = Engine.GetModelValue( model )
		if dpadAllButtonImage then
			Controls.buttonPromptImage:setImage( RegisterImage( dpadAllButtonImage ) )
		end
	end )
	Controls:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsGamepad( controller ) then
					f10_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	Controls:linkToElementModel( Controls, nil, true, function ( model )
		menu:updateElementState( Controls, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if Controls.m_eventHandlers.input_source_changed then
		local ChooseMode = Controls.m_eventHandlers.input_source_changed
		Controls:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return ChooseMode( element, event )
		end )
	else
		Controls:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	Controls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( Controls, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( Controls )
	self.Controls = Controls
	
	local ChooseMode = CoD.FooterButtonPrompt.new( menu, controller )
	ChooseMode:setLeftRight( true, false, 260, 380 )
	ChooseMode:setTopBottom( true, false, 0, 32 )
	ChooseMode.label:setText( Engine.Localize( "DEMO_CHOOSE_MODE" ) )
	ChooseMode.keyPrompt.keybind:setText( Engine.Localize( "M" ) )
	ChooseMode:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ChooseMode.buttonPromptImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	ChooseMode:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsGamepad( controller ) then
					f16_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f16_local0 = false
				end
				return f16_local0
			end
		}
	} )
	ChooseMode:linkToElementModel( ChooseMode, nil, true, function ( model )
		menu:updateElementState( ChooseMode, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if ChooseMode.m_eventHandlers.input_source_changed then
		local ChangeCamera = ChooseMode.m_eventHandlers.input_source_changed
		ChooseMode:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return ChangeCamera( element, event )
		end )
	else
		ChooseMode:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	ChooseMode:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( ChooseMode, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( ChooseMode )
	self.ChooseMode = ChooseMode
	
	local ChangeCamera = CoD.FooterButtonPrompt.new( menu, controller )
	ChangeCamera:setLeftRight( true, false, 390.25, 412 )
	ChangeCamera:setTopBottom( true, false, 0, 32 )
	ChangeCamera.label:setText( Engine.Localize( "DEMO_CHANGE_CAMERA" ) )
	ChangeCamera.keyPrompt.keybind:setText( Engine.Localize( "X" ) )
	ChangeCamera:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			ChangeCamera.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	ChangeCamera:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f22_local0
				if not IsGamepad( controller ) then
					f22_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f22_local0 = false
				end
				return f22_local0
			end
		}
	} )
	ChangeCamera:linkToElementModel( ChangeCamera, nil, true, function ( model )
		menu:updateElementState( ChangeCamera, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if ChangeCamera.m_eventHandlers.input_source_changed then
		local SkipBack = ChangeCamera.m_eventHandlers.input_source_changed
		ChangeCamera:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return SkipBack( element, event )
		end )
	else
		ChangeCamera:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	ChangeCamera:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( ChangeCamera, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( ChangeCamera )
	self.ChangeCamera = ChangeCamera
	
	local SkipBack = CoD.FooterButtonPrompt.new( menu, controller )
	SkipBack:setLeftRight( true, false, 526.25, 516 )
	SkipBack:setTopBottom( true, false, 0, 32 )
	SkipBack.label:setText( Engine.Localize( "DEMO_JUMP_BACK" ) )
	SkipBack.keyPrompt.keybind:setText( Engine.Localize( "Q" ) )
	SkipBack:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			SkipBack.buttonPromptImage:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	SkipBack:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f28_local0
				if not IsGamepad( controller ) then
					f28_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f28_local0 = false
				end
				return f28_local0
			end
		}
	} )
	SkipBack:linkToElementModel( SkipBack, nil, true, function ( model )
		menu:updateElementState( SkipBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if SkipBack.m_eventHandlers.input_source_changed then
		local FastForward = SkipBack.m_eventHandlers.input_source_changed
		SkipBack:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return FastForward( element, event )
		end )
	else
		SkipBack:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	SkipBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( SkipBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( SkipBack )
	self.SkipBack = SkipBack
	
	local FastForward = CoD.FooterButtonPrompt.new( menu, controller )
	FastForward:setLeftRight( true, false, 648.25, 778.75 )
	FastForward:setTopBottom( true, false, 0, 32 )
	FastForward.label:setText( Engine.Localize( "DEMO_FAST_FORWARD" ) )
	FastForward.keyPrompt.keybind:setText( Engine.Localize( "E" ) )
	FastForward:subscribeToGlobalModel( controller, "Controller", "right_trigger_button_image", function ( model )
		local rightTriggerButtonImage = Engine.GetModelValue( model )
		if rightTriggerButtonImage then
			FastForward.buttonPromptImage:setImage( RegisterImage( rightTriggerButtonImage ) )
		end
	end )
	FastForward:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f34_local0
				if not IsGamepad( controller ) then
					f34_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f34_local0 = false
				end
				return f34_local0
			end
		}
	} )
	FastForward:linkToElementModel( FastForward, nil, true, function ( model )
		menu:updateElementState( FastForward, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if FastForward.m_eventHandlers.input_source_changed then
		local ToggleControls = FastForward.m_eventHandlers.input_source_changed
		FastForward:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return ToggleControls( element, event )
		end )
	else
		FastForward:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	FastForward:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( FastForward, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( FastForward )
	self.FastForward = FastForward
	
	local ToggleControls = CoD.FooterButtonPrompt.new( menu, controller )
	ToggleControls:setLeftRight( true, false, 778.75, 918.75 )
	ToggleControls:setTopBottom( true, false, 0, 32 )
	ToggleControls.label:setText( Engine.Localize( "DEMO_TOGGLE_CONTROLS" ) )
	ToggleControls.keyPrompt.keybind:setText( Engine.Localize( "T" ) )
	ToggleControls:subscribeToGlobalModel( controller, "Controller", "left_stick_button_image", function ( model )
		local leftStickButtonImage = Engine.GetModelValue( model )
		if leftStickButtonImage then
			ToggleControls.buttonPromptImage:setImage( RegisterImage( leftStickButtonImage ) )
		end
	end )
	ToggleControls:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f40_local0
				if not IsGamepad( controller ) then
					f40_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		}
	} )
	ToggleControls:linkToElementModel( ToggleControls, nil, true, function ( model )
		menu:updateElementState( ToggleControls, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if ToggleControls.m_eventHandlers.input_source_changed then
		local ToggleHud = ToggleControls.m_eventHandlers.input_source_changed
		ToggleControls:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return ToggleHud( element, event )
		end )
	else
		ToggleControls:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	ToggleControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( ToggleControls, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( ToggleControls )
	self.ToggleControls = ToggleControls
	
	local ToggleHud = CoD.FooterButtonPrompt.new( menu, controller )
	ToggleHud:setLeftRight( true, false, 902.75, 1023.75 )
	ToggleHud:setTopBottom( true, false, 0, 32 )
	ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
	ToggleHud.keyPrompt.keybind:setText( Engine.Localize( "H" ) )
	ToggleHud:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			ToggleHud.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	ToggleHud:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f46_local0
				if not IsGamepad( controller ) then
					f46_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f46_local0 = false
				end
				return f46_local0
			end
		}
	} )
	ToggleHud:linkToElementModel( ToggleHud, nil, true, function ( model )
		menu:updateElementState( ToggleHud, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if ToggleHud.m_eventHandlers.input_source_changed then
		local KeyFrameAction = ToggleHud.m_eventHandlers.input_source_changed
		ToggleHud:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return KeyFrameAction( element, event )
		end )
	else
		ToggleHud:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	ToggleHud:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( ToggleHud, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( ToggleHud )
	self.ToggleHud = ToggleHud
	
	local KeyFrameAction = CoD.FooterButtonPrompt.new( menu, controller )
	KeyFrameAction:setLeftRight( true, false, 969.75, 1094.75 )
	KeyFrameAction:setTopBottom( true, false, 0, 32 )
	KeyFrameAction.label:setText( Engine.Localize( "DEMO_ADD_KEYFRAME" ) )
	KeyFrameAction.keyPrompt.keybind:setText( Engine.Localize( "X" ) )
	KeyFrameAction:subscribeToGlobalModel( controller, "Controller", "right_stick_button_image", function ( model )
		local rightStickButtonImage = Engine.GetModelValue( model )
		if rightStickButtonImage then
			KeyFrameAction.buttonPromptImage:setImage( RegisterImage( rightStickButtonImage ) )
		end
	end )
	KeyFrameAction:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f52_local0
				if not IsGamepad( controller ) then
					f52_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f52_local0 = false
				end
				return f52_local0
			end
		}
	} )
	KeyFrameAction:linkToElementModel( KeyFrameAction, nil, true, function ( model )
		menu:updateElementState( KeyFrameAction, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if KeyFrameAction.m_eventHandlers.input_source_changed then
		local RBHint = KeyFrameAction.m_eventHandlers.input_source_changed
		KeyFrameAction:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return RBHint( element, event )
		end )
	else
		KeyFrameAction:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	KeyFrameAction:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( KeyFrameAction, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( KeyFrameAction )
	self.KeyFrameAction = KeyFrameAction
	
	local RBHint = CoD.FooterButtonPrompt.new( menu, controller )
	RBHint:setLeftRight( true, false, 1057.63, 1194.63 )
	RBHint:setTopBottom( true, false, 0, 32 )
	RBHint.label:setText( Engine.Localize( "DEMO_CAMERA_DOWN_UP" ) )
	RBHint.keyPrompt.keybind:setText( Engine.Localize( "PLATFORM_BIND_DEMO_CAMARA_DOWN_UP" ) )
	RBHint:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RBHint.buttonPromptImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RBHint:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f58_local0
				if not IsGamepad( controller ) then
					f58_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f58_local0 = false
				end
				return f58_local0
			end
		}
	} )
	RBHint:linkToElementModel( RBHint, nil, true, function ( model )
		menu:updateElementState( RBHint, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if RBHint.m_eventHandlers.input_source_changed then
		local LB = RBHint.m_eventHandlers.input_source_changed
		RBHint:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return LB( element, event )
		end )
	else
		RBHint:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	RBHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( RBHint, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( RBHint )
	self.RBHint = RBHint
	
	local LB = CoD.FooterButtonPrompt.new( menu, controller )
	LB:setLeftRight( true, false, 1032.25, 1083 )
	LB:setTopBottom( true, false, 0, 32 )
	LB.label:setText( Engine.Localize( "" ) )
	LB.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	LB:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LB.buttonPromptImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LB:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LB:linkToElementModel( LB, nil, true, function ( model )
		menu:updateElementState( LB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if LB.m_eventHandlers.input_source_changed then
		local f1_local12 = LB.m_eventHandlers.input_source_changed
		LB:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local12( element, event )
		end )
	else
		LB:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	LB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( LB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( LB )
	self.LB = LB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 100 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.clipFinished( ChooseMode, {} )
			end
		},
		PlaybackMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 100 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 336.25, 458.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 460, 600 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				self.ToggleHud:setAlpha( 0 )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		BasicMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 100 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 390.25, 526.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 526.25, 648.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 648.25, 778.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 778.75, 918.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 918.75, 1039.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		BasicModeFreeCamera = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 100 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 390.25, 526.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 526.25, 648.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 648.25, 778.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 778.75, 918.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 918.75, 1039.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		},
		DirectorMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 100 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 627.75, 767.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 767.75, 888.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 888.75, 1013.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_ADD_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		},
		DirectorModeEditKeyFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 100 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 627.75, 767.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 767.75, 888.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 888.75, 1013.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EDIT_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		},
		DirectorModeEditingKeyFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 229, 361.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 241.75, 381.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 381.75, 502.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 0 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 381.75, 506.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EXIT_EDIT_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 673.25, 716.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 641.25, 684.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		DirectorModeMoveKeyFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 229, 361.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 229, 369 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 369, 490 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "DEMO_CANCEL_MOVE_KEYFRAME" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 490, 615 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_PLACE_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 660.5, 703.5 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 628.5, 671.5 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		},
		ObjectLinkMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 627.75, 767.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 767.75, 888.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 888.75, 1013.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_LINK_TO_OBJECT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		ObjectLinkModeLinkToObject = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 627.75, 767.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 767.75, 888.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 888.75, 1013.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_LINK_TO_OBJECT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		ObjectLinkModeUnlinkObject = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 627.75, 767.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 767.75, 888.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 888.75, 1013.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_UNLINK_OBJECT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		LighterMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 627.75, 767.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 767.75, 888.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 888.75, 1013.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_ADD_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		},
		LighterModeEditLight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 260, 380 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 627.75, 767.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 767.75, 888.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 888.75, 1013.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EDIT_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		},
		LighterModeEditingLight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 229, 361.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 241.75, 381.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 381.75, 502.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 0 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 381.75, 506.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EXIT_EDIT_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 673.25, 716.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 641.25, 684.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		LighterModeMoveLight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 229, 361.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 229, 369 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 369, 490 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "DEMO_CANCEL_MOVE_KEYFRAME" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 490, 615 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_PLACE_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 660.5, 703.5 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 628.5, 671.5 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		},
		LighterModeLightColorPicker = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 229, 361.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 361.25, 497.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 375.25, 497.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 497.25, 627.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 241.75, 381.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 381.75, 502.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_CANCEL" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 381.75, 506.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( 1, 1, 1 )
				self.KeyFrameAction:setAlpha( 0 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EXIT_EDIT_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 673.25, 716.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 641.25, 684.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		RestrictedBasicMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 258, 390.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 390.25, 526.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 526.25, 648.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 648.25, 778.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 778.75, 918.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 918.75, 1039.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
			end
		},
		RestrictedBasicModeFreeCamera = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Select:completeAnimation()
				self.Select:setLeftRight( true, false, 0, 102 )
				self.Select:setTopBottom( true, false, 0, 32 )
				self.Select:setAlpha( 1 )
				self.clipFinished( Select, {} )
				Controls:completeAnimation()
				self.Controls:setLeftRight( true, false, 125, 230 )
				self.Controls:setTopBottom( true, false, 0, 32 )
				self.Controls:setAlpha( 1 )
				self.clipFinished( Controls, {} )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 258, 390.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 390.25, 526.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 526.25, 648.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 648.25, 778.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 778.75, 918.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				ToggleHud:completeAnimation()
				ToggleHud.label:completeAnimation()
				self.ToggleHud:setLeftRight( true, false, 918.75, 1039.75 )
				self.ToggleHud:setTopBottom( true, false, 0, 32 )
				self.ToggleHud:setAlpha( 1 )
				self.ToggleHud.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_HUD" ) )
				self.clipFinished( ToggleHud, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1032.25, 1075.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PlaybackMode",
			condition = function ( menu, element, event )
				return IsDemoContextPlaybackMode()
			end
		},
		{
			stateName = "BasicMode",
			condition = function ( menu, element, event )
				local f88_local0 = IsDemoContextBasicMode()
				if f88_local0 then
					if not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) then
						f88_local0 = not IsDemoRestrictedBasicMode()
					else
						f88_local0 = false
					end
				end
				return f88_local0
			end
		},
		{
			stateName = "BasicModeFreeCamera",
			condition = function ( menu, element, event )
				local f89_local0 = IsDemoContextBasicMode()
				if f89_local0 then
					f89_local0 = IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
					if f89_local0 then
						f89_local0 = not IsDemoRestrictedBasicMode()
					end
				end
				return f89_local0
			end
		},
		{
			stateName = "DirectorMode",
			condition = function ( menu, element, event )
				return IsDemoContextDirectorMode() and ShouldAddDollyCameraMarker( controller )
			end
		},
		{
			stateName = "DirectorModeEditKeyFrame",
			condition = function ( menu, element, event )
				return IsDemoContextDirectorMode() and ShouldEditDollyCameraMarker( controller )
			end
		},
		{
			stateName = "DirectorModeEditingKeyFrame",
			condition = function ( menu, element, event )
				local f92_local0 = IsDemoContextDirectorMode()
				if f92_local0 then
					f92_local0 = IsEditingDollyCameraMarker( controller )
					if f92_local0 then
						f92_local0 = not IsRepositioningDollyCameraMarker( controller )
					end
				end
				return f92_local0
			end
		},
		{
			stateName = "DirectorModeMoveKeyFrame",
			condition = function ( menu, element, event )
				return IsDemoContextDirectorMode() and IsRepositioningDollyCameraMarker( controller )
			end
		},
		{
			stateName = "ObjectLinkMode",
			condition = function ( menu, element, event )
				local f94_local0 = IsDemoContextObjectLinkMode()
				if f94_local0 then
					if not CanFreeCameraLockOnEntity( controller ) then
						f94_local0 = not IsFreeCameraLockedOnEntity( controller )
					else
						f94_local0 = false
					end
				end
				return f94_local0
			end
		},
		{
			stateName = "ObjectLinkModeLinkToObject",
			condition = function ( menu, element, event )
				local f95_local0 = IsDemoContextObjectLinkMode()
				if f95_local0 then
					f95_local0 = CanFreeCameraLockOnEntity( controller )
					if f95_local0 then
						f95_local0 = not IsFreeCameraLockedOnEntity( controller )
					end
				end
				return f95_local0
			end
		},
		{
			stateName = "ObjectLinkModeUnlinkObject",
			condition = function ( menu, element, event )
				return IsDemoContextObjectLinkMode() and IsFreeCameraLockedOnEntity( controller )
			end
		},
		{
			stateName = "LighterMode",
			condition = function ( menu, element, event )
				return IsDemoContextLighterMode() and ShouldAddLightmanMarker( controller )
			end
		},
		{
			stateName = "LighterModeEditLight",
			condition = function ( menu, element, event )
				return IsDemoContextLighterMode() and ShouldEditLightmanMarker( controller )
			end
		},
		{
			stateName = "LighterModeEditingLight",
			condition = function ( menu, element, event )
				local f99_local0 = IsDemoContextLighterMode()
				if f99_local0 then
					f99_local0 = IsEditingLightmanMarker( controller )
					if f99_local0 then
						if not IsRepositioningLightmanMarker( controller ) then
							f99_local0 = not IsInLightmanColorPicker( controller )
						else
							f99_local0 = false
						end
					end
				end
				return f99_local0
			end
		},
		{
			stateName = "LighterModeMoveLight",
			condition = function ( menu, element, event )
				return IsDemoContextLighterMode() and IsRepositioningLightmanMarker( controller )
			end
		},
		{
			stateName = "LighterModeLightColorPicker",
			condition = function ( menu, element, event )
				local f101_local0 = IsDemoContextLighterMode()
				if f101_local0 then
					f101_local0 = IsEditingLightmanMarker( controller )
					if f101_local0 then
						if not IsRepositioningLightmanMarker( controller ) then
							f101_local0 = IsInLightmanColorPicker( controller )
						else
							f101_local0 = false
						end
					end
				end
				return f101_local0
			end
		},
		{
			stateName = "RestrictedBasicMode",
			condition = function ( menu, element, event )
				local f102_local0 = IsDemoContextBasicMode()
				if f102_local0 then
					if not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) then
						f102_local0 = IsDemoRestrictedBasicMode()
					else
						f102_local0 = false
					end
				end
				return f102_local0
			end
		},
		{
			stateName = "RestrictedBasicModeFreeCamera",
			condition = function ( menu, element, event )
				local f103_local0 = IsDemoContextBasicMode()
				if f103_local0 then
					f103_local0 = IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
					if f103_local0 then
						f103_local0 = IsDemoRestrictedBasicMode()
					end
				end
				return f103_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.contextMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.cameraMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.highlightedDollyCamMarker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.highlightedDollyCamMarker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.editingDollyCameraMarker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningDollyCamMarker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isRepositioningDollyCamMarker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isFreeCameraLockedOnEntity" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isFreeCameraLockedOnEntity"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.highlightedFreeCameraLockOnEntity" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.highlightedFreeCameraLockOnEntity"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isFreeCameraLockedOnEntityActive" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isFreeCameraLockedOnEntityActive"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.highlightedLightmanMarker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.highlightedLightmanMarker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.editingLightmanMarker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningLightmanMarker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isRepositioningLightmanMarker"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showLightmanColorPicker" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showLightmanColorPicker"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Select:close()
		element.Controls:close()
		element.ChooseMode:close()
		element.ChangeCamera:close()
		element.SkipBack:close()
		element.FastForward:close()
		element.ToggleControls:close()
		element.ToggleHud:close()
		element.KeyFrameAction:close()
		element.RBHint:close()
		element.LB:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

