require( "ui.T6.CoD9Button" )

CoD.OptionElement = {}
CoD.OptionElement.HorizontalGap = 400
CoD.OptionElement.new = function ( label, horizontalGap, defaultAnimationState )
	local optionElement = CoD.CoD9Button.new( defaultAnimationState )
	if optionElement.selectButtonImage ~= nil then
		optionElement.selectButtonImage:close()
	end
	if horizontalGap == nil then
		horizontalGap = CoD.OptionElement.HorizontalGap
	end
	optionElement.horizontalGap = horizontalGap
	optionElement.horizontalList = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	optionElement:addElement( optionElement.horizontalList )
	optionElement.label = LUI.UIText.new( {
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1
	} )
	optionElement.label:setLeftRight( true, false, 0, horizontalGap )
	optionElement.label:setTopBottom( false, false, -CoD.CoD9Button.TextHeight / 2, CoD.CoD9Button.TextHeight / 2 )
	optionElement.label:setTTF( "fonts/escom.ttf" )
	optionElement.horizontalList:addElement( optionElement.label )
	optionElement:setLabel( label )
	CoD.CoD9Button.SetupTextElement( optionElement.label )
	return optionElement
end

