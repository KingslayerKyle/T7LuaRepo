require( "ui.T6.OptionElement" )

CoD.KeyBindSelector = {}
CoD.KeyBindSelector.ArrowSize = CoD.CoD9Button.TextHeight
CoD.KeyBindSelector.LeftArrowMaterialName = "ui_arrow_left"
CoD.KeyBindSelector.RightArrowMaterialName = "ui_arrow_right"
CoD.KeyBindSelector.HorizontalGap = 300
CoD.KeyBindSelector.ButtonAction = function ( selector, event )
	if not Engine.LastInput_Gamepad() then
		selector.bindText:setText( Engine.Localize( "MENU_BIND_KEY_PENDING" ) )
		Engine.ExecNow( selector.controller, "clearKeyStates" )
		Engine.BindCommand( selector.controller, selector.m_command, selector.m_bindIndex )
	end
end

CoD.KeyBindSelector.KeyBound = function ( selector, event )
	selector.bindText:setText( Engine.GetKeyBindingLocalizedString( event.controller, selector.m_command, selector.m_bindIndex, false, false, false, false, false, false ) )
end

CoD.KeyBindSelector.new = function ( controller, label, command, bindIndex, horizontalGap, defaultAnimationState )
	local selector = CoD.OptionElement.new( label, horizontalGap, defaultAnimationState )
	selector.label.overDuration = nil
	selector.label.upDuration = nil
	selector.id = "KeyBindSelector." .. label
	selector.m_bindLabel = label
	selector.m_command = command
	selector.m_bindIndex = bindIndex
	selector.controller = controller
	selector.bindText = LUI.UITightText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.CoD9Button.TextHeight / 2,
		bottom = CoD.CoD9Button.TextHeight / 2,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.5,
		font = CoD.fonts.Condensed
	} )
	selector.bindText:registerAnimationState( "default", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.5
	} )
	selector.bindText:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		alpha = 1
	} )
	selector.bindText:setText( Engine.GetKeyBindingLocalizedString( controller, command, bindIndex, false, false, false, false, false, false ) )
	selector.horizontalList:addElement( selector.bindText )
	CoD.CoD9Button.SetupTextElement( selector.bindText )
	selector.bindText.overDuration = nil
	selector.bindText.upDuration = nil
	selector:registerEventHandler( "button_action", CoD.KeyBindSelector.ButtonAction )
	selector:registerEventHandler( "key_bound", CoD.KeyBindSelector.KeyBound )
	selector:registerEventHandler( "input_source_changed", CoD.KeyBindSelector.KeyBound )
	return selector
end

