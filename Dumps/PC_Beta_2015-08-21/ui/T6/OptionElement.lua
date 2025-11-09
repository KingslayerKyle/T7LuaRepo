require( "ui.T6.CoD9Button" )

CoD.OptionElement = {}
CoD.OptionElement.HorizontalGap = 400
CoD.OptionElement.new = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = CoD.CoD9Button.new( f1_arg2 )
	if f1_local0.selectButtonImage ~= nil then
		f1_local0.selectButtonImage:close()
	end
	if f1_arg1 == nil then
		f1_arg1 = CoD.OptionElement.HorizontalGap
	end
	f1_local0.horizontalGap = f1_arg1
	f1_local0.horizontalList = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	f1_local0:addElement( f1_local0.horizontalList )
	f1_local0.label = LUI.UIText.new( {
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1
	} )
	f1_local0.label:setLeftRight( true, false, 0, f1_arg1 )
	f1_local0.label:setTopBottom( false, false, -CoD.CoD9Button.TextHeight / 2, CoD.CoD9Button.TextHeight / 2 )
	f1_local0.label:setTTF( "fonts/escom.ttf" )
	f1_local0.horizontalList:addElement( f1_local0.label )
	f1_local0:setLabel( f1_arg0 )
	CoD.CoD9Button.SetupTextElement( f1_local0.label )
	return f1_local0
end

