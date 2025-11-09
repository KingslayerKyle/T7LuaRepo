LUI.UITightText = {}
LUI.UITightText.new = function ( defaultAnimationState )
	local text = LUI.UIText.new( defaultAnimationState )
	text:setupUITightText()
	return text
end

