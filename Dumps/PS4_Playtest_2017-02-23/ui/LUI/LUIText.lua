LUI.UIText = InheritFrom( LUI.UIElement )
LUI.UIText.new = function ( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	local text = LUI.UIElement.new( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	text:setupUIText()
	return text
end

LUI.UIText.id = "LUIText"
