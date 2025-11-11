LUI.UIImage = InheritFrom( LUI.UIElement )
LUI.UIImage.Materials = {}
LUI.UIImage.DefaultImage = RegisterImage( "$white" )
LUI.UIImage.new = function ( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	local image = LUI.UIElement.new( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	image:setupUIImage()
	return image
end

LUI.UIImage.GetCachedMaterial = function ( materialName )
	local material = LUI.UIImage.Materials[materialName]
	if material == nil then
		material = RegisterMaterial( materialName )
		LUI.UIImage.Materials[materialName] = material
	end
	return material
end

LUI.UIImage.id = "LUIImage"
