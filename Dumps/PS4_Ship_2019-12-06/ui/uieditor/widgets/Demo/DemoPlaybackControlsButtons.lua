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
	Select:setLeftRight( true, false, 0, 102 )
	Select:setTopBottom( true, false, 0, 32 )
	Select.label:setText( Engine.Localize( "MENU_SELECT" ) )
	Select.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return IsGamepad( controller ) and AlwaysTrue()
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
	Controls:setLeftRight( true, false, 102, 229 )
	Controls:setTopBottom( true, false, 0, 32 )
	Controls.label:setText( Engine.Localize( "MENU_CONTROLS" ) )
	Controls.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return IsGamepad( controller ) and AlwaysTrue()
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
	ChooseMode:setLeftRight( true, false, 235, 367.25 )
	ChooseMode:setTopBottom( true, false, 0, 32 )
	ChooseMode.label:setText( Engine.Localize( "DEMO_CHOOSE_MODE" ) )
	ChooseMode.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return IsGamepad( controller ) and AlwaysTrue()
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
		local TogglePlayPause = ChooseMode.m_eventHandlers.input_source_changed
		ChooseMode:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return TogglePlayPause( element, event )
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
	
	local TogglePlayPause = CoD.FooterButtonPrompt.new( menu, controller )
	TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
	TogglePlayPause:setTopBottom( true, false, 0, 32 )
	TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
	TogglePlayPause.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	TogglePlayPause:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			TogglePlayPause.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	TogglePlayPause:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	TogglePlayPause:linkToElementModel( TogglePlayPause, nil, true, function ( model )
		menu:updateElementState( TogglePlayPause, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if TogglePlayPause.m_eventHandlers.input_source_changed then
		local ChangeCamera = TogglePlayPause.m_eventHandlers.input_source_changed
		TogglePlayPause:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return ChangeCamera( element, event )
		end )
	else
		TogglePlayPause:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	TogglePlayPause:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( TogglePlayPause, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( TogglePlayPause )
	self.TogglePlayPause = TogglePlayPause
	
	local ChangeCamera = CoD.FooterButtonPrompt.new( menu, controller )
	ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
	ChangeCamera:setTopBottom( true, false, 0, 32 )
	ChangeCamera.label:setText( Engine.Localize( "DEMO_CHANGE_CAMERA" ) )
	ChangeCamera.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return IsGamepad( controller ) and AlwaysTrue()
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
	SkipBack:setLeftRight( true, false, 644.25, 766.25 )
	SkipBack:setTopBottom( true, false, 0, 32 )
	SkipBack.label:setText( Engine.Localize( "DEMO_JUMP_BACK" ) )
	SkipBack.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return IsGamepad( controller ) and AlwaysTrue()
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
	FastForward:setLeftRight( true, false, 766.25, 896.75 )
	FastForward:setTopBottom( true, false, 0, 32 )
	FastForward.label:setText( Engine.Localize( "DEMO_FAST_FORWARD" ) )
	FastForward.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return IsGamepad( controller ) and AlwaysTrue()
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
	ToggleControls:setLeftRight( true, false, 896.75, 1036.75 )
	ToggleControls:setTopBottom( true, false, 0, 32 )
	ToggleControls.label:setText( Engine.Localize( "DEMO_TOGGLE_CONTROLS" ) )
	ToggleControls.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return IsGamepad( controller ) and AlwaysTrue()
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
		local KeyFrameAction = ToggleControls.m_eventHandlers.input_source_changed
		ToggleControls:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return KeyFrameAction( element, event )
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
	
	local KeyFrameAction = CoD.FooterButtonPrompt.new( menu, controller )
	KeyFrameAction:setLeftRight( true, false, 1039.75, 1164.75 )
	KeyFrameAction:setTopBottom( true, false, 0, 32 )
	KeyFrameAction:setAlpha( 0 )
	KeyFrameAction.label:setText( Engine.Localize( "DEMO_ADD_KEYFRAME" ) )
	KeyFrameAction.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return AlwaysTrue()
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
		local LB = KeyFrameAction.m_eventHandlers.input_source_changed
		KeyFrameAction:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return LB( element, event )
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
	
	local LB = CoD.FooterButtonPrompt.new( menu, controller )
	LB:setLeftRight( true, false, 1027.25, 1070.25 )
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
				return AlwaysTrue()
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
		local RBHint = LB.m_eventHandlers.input_source_changed
		LB:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return RBHint( element, event )
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
	
	local RBHint = CoD.FooterButtonPrompt.new( menu, controller )
	RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
	RBHint:setTopBottom( true, false, 0, 32 )
	RBHint.label:setText( Engine.Localize( "DEMO_CAMERA_DOWN_UP" ) )
	RBHint.keyPrompt.keybind:setText( Engine.Localize( "" ) )
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
				return AlwaysTrue()
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
		local btnAlignment0 = RBHint.m_eventHandlers.input_source_changed
		RBHint:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return btnAlignment0( element, event )
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
	
	local btnAlignment0 = LUI.UIImage.new()
	btnAlignment0:setLeftRight( true, false, 239.25, 367.25 )
	btnAlignment0:setTopBottom( true, false, -31.1, -8.1 )
	btnAlignment0:setRGB( 0.54, 0.32, 0.32 )
	btnAlignment0:setAlpha( 0 )
	self:addElement( btnAlignment0 )
	self.btnAlignment0 = btnAlignment0
	
	local btnAlignment1 = LUI.UIImage.new()
	btnAlignment1:setLeftRight( true, false, 367.25, 495.25 )
	btnAlignment1:setTopBottom( true, false, -31.1, -8.1 )
	btnAlignment1:setAlpha( 0 )
	self:addElement( btnAlignment1 )
	self.btnAlignment1 = btnAlignment1
	
	local btnAlignment2 = LUI.UIImage.new()
	btnAlignment2:setLeftRight( true, false, 516.25, 644.25 )
	btnAlignment2:setTopBottom( true, false, -31.1, -8.1 )
	btnAlignment2:setRGB( 0.64, 0.42, 0.42 )
	btnAlignment2:setAlpha( 0 )
	self:addElement( btnAlignment2 )
	self.btnAlignment2 = btnAlignment2
	
	local btnAlignment3 = LUI.UIImage.new()
	btnAlignment3:setLeftRight( true, false, 644.25, 772.25 )
	btnAlignment3:setTopBottom( true, false, -31.1, -8.1 )
	btnAlignment3:setAlpha( 0 )
	self:addElement( btnAlignment3 )
	self.btnAlignment3 = btnAlignment3
	
	local btnAlignment4 = LUI.UIImage.new()
	btnAlignment4:setLeftRight( true, false, 772.25, 900.25 )
	btnAlignment4:setTopBottom( true, false, -31.1, -8.1 )
	btnAlignment4:setRGB( 0.56, 0.26, 0.26 )
	btnAlignment4:setAlpha( 0 )
	self:addElement( btnAlignment4 )
	self.btnAlignment4 = btnAlignment4
	
	local btnAlignment5 = LUI.UIImage.new()
	btnAlignment5:setLeftRight( true, false, 902.75, 1030.75 )
	btnAlignment5:setTopBottom( true, false, -31.1, -8.1 )
	btnAlignment5:setAlpha( 0 )
	self:addElement( btnAlignment5 )
	self.btnAlignment5 = btnAlignment5
	
	local btnAlignment6 = LUI.UIImage.new()
	btnAlignment6:setLeftRight( true, false, 1036.75, 1164.75 )
	btnAlignment6:setTopBottom( true, false, -31.1, -8.1 )
	btnAlignment6:setRGB( 0.76, 0.34, 0.34 )
	btnAlignment6:setAlpha( 0 )
	self:addElement( btnAlignment6 )
	self.btnAlignment6 = btnAlignment6
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PlaybackMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 0 )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 229, 351 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 357.75, 497.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 1039.75, 1164.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
			end
		},
		BasicMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 896.75, 1036.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 1039.75, 1164.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
			end
		},
		BasicModeFreeCamera = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 896.75, 1036.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 1039.75, 1164.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		DirectorMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_ADD_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		DirectorModeStartAutoDolly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_START_AUTO_DOLLY" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		DirectorModeStopAutoDolly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_STOP_AUTO_DOLLY" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		DirectorModeEditKeyFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EDIT_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		DirectorModeEditingKeyFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 0 )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 229, 369 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 367.25, 492.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EXIT_EDIT_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
			end
		},
		DirectorModeMoveKeyFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 229, 350 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_CANCEL" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 333.75, 473.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 486.75, 611.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_PLACE_KEYFRAME" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 630.25, 673.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 662.25, 705.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		ObjectLinkMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_LINK_TO_OBJECT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		ObjectLinkModeLinkToObject = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_LINK_TO_OBJECT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		ObjectLinkModeUnlinkObject = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_UNLINK_OBJECT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
			end
		},
		LighterMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_ADD_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		LighterModeEditLight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 632.25, 762.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 762.75, 902.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 900.25, 1025.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EDIT_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		LighterModeEditingLight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 0 )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 510.25, 632.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 229, 369 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 367.25, 492.25 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_EXIT_EDIT_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
			end
		},
		LighterModeMoveLight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 229, 350 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_CANCEL" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 333.75, 473.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 486.75, 611.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 1 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_PLACE_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 630.25, 673.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 662.25, 705.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		LighterModeLightColorPicker = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 229, 350 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_CANCEL" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 0 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 333.75, 473.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				KeyFrameAction.label:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 486.75, 611.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setRGB( ColorSet.White.r, ColorSet.White.g, ColorSet.White.b )
				self.KeyFrameAction:setAlpha( 0 )
				self.KeyFrameAction.label:setText( Engine.Localize( "DEMO_PLACE_LIGHT" ) )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 630.25, 673.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 662.25, 705.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
			end
		},
		HighlightReelMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 896.75, 1036.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 1039.75, 1164.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
			end
		},
		HighlightReelModeFreeCamera = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 1 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				TogglePlayPause.label:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 1 )
				self.TogglePlayPause.label:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PLAY_PAUSE" ) )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 1 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 644.25, 766.25 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 1 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 896.75, 1036.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 1 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 1039.75, 1164.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 1 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 1 )
				self.clipFinished( RBHint, {} )
			end
		},
		NetworkProfiling = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ChooseMode:completeAnimation()
				self.ChooseMode:setLeftRight( true, false, 235, 367.25 )
				self.ChooseMode:setTopBottom( true, false, 0, 32 )
				self.ChooseMode:setAlpha( 0 )
				self.clipFinished( ChooseMode, {} )
				TogglePlayPause:completeAnimation()
				self.TogglePlayPause:setLeftRight( true, false, 367.25, 488.25 )
				self.TogglePlayPause:setTopBottom( true, false, 0, 32 )
				self.TogglePlayPause:setAlpha( 0 )
				self.clipFinished( TogglePlayPause, {} )
				ChangeCamera:completeAnimation()
				self.ChangeCamera:setLeftRight( true, false, 508.25, 644.25 )
				self.ChangeCamera:setTopBottom( true, false, 0, 32 )
				self.ChangeCamera:setAlpha( 0 )
				self.clipFinished( ChangeCamera, {} )
				SkipBack:completeAnimation()
				self.SkipBack:setLeftRight( true, false, 229, 351 )
				self.SkipBack:setTopBottom( true, false, 0, 32 )
				self.SkipBack:setAlpha( 1 )
				self.clipFinished( SkipBack, {} )
				FastForward:completeAnimation()
				self.FastForward:setLeftRight( true, false, 766.25, 896.75 )
				self.FastForward:setTopBottom( true, false, 0, 32 )
				self.FastForward:setAlpha( 0 )
				self.clipFinished( FastForward, {} )
				ToggleControls:completeAnimation()
				self.ToggleControls:setLeftRight( true, false, 357.75, 497.75 )
				self.ToggleControls:setTopBottom( true, false, 0, 32 )
				self.ToggleControls:setAlpha( 0 )
				self.clipFinished( ToggleControls, {} )
				KeyFrameAction:completeAnimation()
				self.KeyFrameAction:setLeftRight( true, false, 1039.75, 1164.75 )
				self.KeyFrameAction:setTopBottom( true, false, 0, 32 )
				self.KeyFrameAction:setAlpha( 0 )
				self.clipFinished( KeyFrameAction, {} )
				LB:completeAnimation()
				self.LB:setLeftRight( true, false, 1027.25, 1070.25 )
				self.LB:setTopBottom( true, false, 0, 32 )
				self.LB:setAlpha( 0 )
				self.clipFinished( LB, {} )
				RBHint:completeAnimation()
				self.RBHint:setLeftRight( true, false, 1059.25, 1102.25 )
				self.RBHint:setTopBottom( true, false, 0, 32 )
				self.RBHint:setAlpha( 0 )
				self.clipFinished( RBHint, {} )
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
				local f79_local0 = IsDemoContextBasicMode()
				if f79_local0 then
					if not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) and not IsDemoRestrictedBasicMode() then
						f79_local0 = not IsGlobalModelValueTrue( element, controller, "demo.networkProfiling" )
					else
						f79_local0 = false
					end
				end
				return f79_local0
			end
		},
		{
			stateName = "BasicModeFreeCamera",
			condition = function ( menu, element, event )
				local f80_local0 = IsDemoContextBasicMode()
				if f80_local0 then
					f80_local0 = IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
					if f80_local0 then
						if not IsDemoRestrictedBasicMode() then
							f80_local0 = not IsGlobalModelValueTrue( element, controller, "demo.networkProfiling" )
						else
							f80_local0 = false
						end
					end
				end
				return f80_local0
			end
		},
		{
			stateName = "DirectorMode",
			condition = function ( menu, element, event )
				return IsDemoContextDirectorMode() and ShouldAddDollyCameraMarker( controller )
			end
		},
		{
			stateName = "DirectorModeStartAutoDolly",
			condition = function ( menu, element, event )
				return IsDemoContextDirectorMode() and ShouldStartAutoDollyCamera( controller )
			end
		},
		{
			stateName = "DirectorModeStopAutoDolly",
			condition = function ( menu, element, event )
				return IsDemoContextDirectorMode() and ShouldStopAutoDollyCamera( controller )
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
				local f85_local0 = IsDemoContextDirectorMode()
				if f85_local0 then
					f85_local0 = IsEditingDollyCameraMarker( controller )
					if f85_local0 then
						f85_local0 = not IsRepositioningDollyCameraMarker( controller )
					end
				end
				return f85_local0
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
				local f87_local0 = IsDemoContextObjectLinkMode()
				if f87_local0 then
					if not CanFreeCameraLockOnEntity( controller ) then
						f87_local0 = not IsFreeCameraLockedOnEntity( controller )
					else
						f87_local0 = false
					end
				end
				return f87_local0
			end
		},
		{
			stateName = "ObjectLinkModeLinkToObject",
			condition = function ( menu, element, event )
				local f88_local0 = IsDemoContextObjectLinkMode()
				if f88_local0 then
					f88_local0 = CanFreeCameraLockOnEntity( controller )
					if f88_local0 then
						f88_local0 = not IsFreeCameraLockedOnEntity( controller )
					end
				end
				return f88_local0
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
				local f92_local0 = IsDemoContextLighterMode()
				if f92_local0 then
					f92_local0 = IsEditingLightmanMarker( controller )
					if f92_local0 then
						if not IsRepositioningLightmanMarker( controller ) then
							f92_local0 = not IsInLightmanColorPicker( controller )
						else
							f92_local0 = false
						end
					end
				end
				return f92_local0
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
				local f94_local0 = IsDemoContextLighterMode()
				if f94_local0 then
					f94_local0 = IsEditingLightmanMarker( controller )
					if f94_local0 then
						if not IsRepositioningLightmanMarker( controller ) then
							f94_local0 = IsInLightmanColorPicker( controller )
						else
							f94_local0 = false
						end
					end
				end
				return f94_local0
			end
		},
		{
			stateName = "HighlightReelMode",
			condition = function ( menu, element, event )
				return IsDemoContextHighlightReelMode() and not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			end
		},
		{
			stateName = "HighlightReelModeFreeCamera",
			condition = function ( menu, element, event )
				return IsDemoContextHighlightReelMode() and IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			end
		},
		{
			stateName = "NetworkProfiling",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "demo.networkProfiling" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.networkProfiling" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.networkProfiling"
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.isRecordingDollyCameraPath" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.isRecordingDollyCameraPath"
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
		element.TogglePlayPause:close()
		element.ChangeCamera:close()
		element.SkipBack:close()
		element.FastForward:close()
		element.ToggleControls:close()
		element.KeyFrameAction:close()
		element.LB:close()
		element.RBHint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

