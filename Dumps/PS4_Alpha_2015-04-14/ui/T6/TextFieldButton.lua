CoD.TextFieldButton = {}
CoD.TextFieldButton.ButtonSetText = function ( button, text )
	button.label:setText( text )
end

CoD.TextFieldButton.ConvertToStar = function ( text )
	if password == "" then
		password = Engine.Localize( "MENU_EMPTY" )
	end
	local len = string.len( text )
	local changedPassword = ""
	for i = 1, len, 1 do
		local f2_local2 = i
		changedPassword = "*" .. changedPassword
	end
	return changedPassword
end

local HighlightButtonOver = function ( self, event )
	self:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self:setAlpha( 1 )
end

local HighlightButtonUp = function ( self, event )
	self:setRGB( 1, 1, 1 )
	self:setAlpha( 0.1 )
end

CoD.TextFieldButton.new = function ( buttonText, actionEventName, textAlignment )
	local buttonheight = CoD.CoD9Button.Height
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = buttonheight
	}
	local button = LUI.UIButton.new( defaultAnimState )
	if textAlignment == nil then
		textAlignment = LUI.Alignment.Left
	end
	button.label = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 10,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.CoD9Button.TextHeight / 2,
		bottom = CoD.CoD9Button.TextHeight / 2,
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1,
		font = CoD.CoD9Button.Font,
		alignment = textAlignment
	} )
	CoD.CoD9Button.SetupTextElement( button.label )
	button:addElement( button.label )
	local blackBackground = LUI.UIImage.new()
	blackBackground:setLeftRight( true, true, 0, 0 )
	blackBackground:setTopBottom( true, true, 0, 0 )
	blackBackground:setRGB( 0, 0, 0 )
	blackBackground:setAlpha( 0.3 )
	blackBackground:setPriority( -110 )
	button:addElement( blackBackground )
	button.highlight = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	button.highlight:setPriority( 100 )
	button.highlight:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	button.highlight:registerEventHandler( "button_over", HighlightButtonOver )
	button.highlight:registerEventHandler( "button_up", HighlightButtonUp )
	button:addElement( button.highlight )
	button:setActionEventName( actionEventName )
	CoD.TextFieldButton.ButtonSetText( button, buttonText )
	button.setText = CoD.TextFieldButton.ButtonSetText
	return button
end

