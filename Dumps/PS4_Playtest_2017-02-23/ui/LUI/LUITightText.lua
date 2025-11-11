LUI.UITightText = {}
LUI.UITightText.new = function ( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	local text = LUI.UIText.new( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	text:setupUITightText()
	return text
end

