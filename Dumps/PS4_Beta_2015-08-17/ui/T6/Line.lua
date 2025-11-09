CoD.Line = {}
CoD.Line.new = function ( p1, p2, lineWidth, color )
	local capWidth = 1
	local rectPos = {}
	local rectDim = {}
	if color == nil then
		color = {
			1,
			1,
			1,
			1
		}
	end
	for i = 1, 2, 1 do
		if p1[i] < p2[i] then
			rectPos[i] = p1[i]
			rectDim[i] = p2[i] - p1[i]
		else
			rectPos[i] = p2[i]
			rectDim[i] = p1[i] - p2[i]
		end
		rectPos[i] = rectPos[i] - lineWidth
		rectDim[i] = rectDim[i] + lineWidth * 2
	end
	local vector0 = {
		rectDim[1],
		rectDim[2],
		lineWidth,
		capWidth
	}
	local vector1 = {
		p1[1] - rectPos[1],
		p1[2] - rectPos[2],
		p2[1] - rectPos[1],
		p2[2] - rectPos[2]
	}
	local line = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = rectPos[1],
		right = rectPos[1] + rectDim[1],
		topAnchor = true,
		bottomAnchor = false,
		top = rectPos[2],
		bottom = rectPos[2] + rectDim[2],
		red = color[1],
		green = color[2],
		blue = color[3],
		alpha = color[4],
		material = RegisterMaterial( "ui_line" ),
		shaderVector0 = vector0,
		shaderVector1 = vector1
	} )
	return line
end

