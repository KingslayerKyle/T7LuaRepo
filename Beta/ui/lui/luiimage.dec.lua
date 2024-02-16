LUI.UIImage = InheritFrom( LUI.UIElement )
LUI.UIImage.Materials = {}
LUI.UIImage.DefaultImage = RegisterImage( "$white" )
LUI.UIImage.addElement = function ( self, newChildElement )
	if newChildElement.id ~= "LUITimer" then
		DebugPrint( "WARNING: An element is being added to a UIImage element. This will cause undesired behavior!" )
	end
	LUI.UIElement.addElement( self, newChildElement )
end

LUI.UIImage.canAddElement = function ( self, newChildElement )
	if newChildElement.id ~= "LUITimer" then
		DebugPrint( "WARNING: An element is being added to a UIImage element. This will cause undesired behavior!" )
	end
	return LUI.UIElement.canAddElement( self, newChildElement )
end

LUI.UIImage.new = function ( defaultAnimationState )
	local image = LUI.UIElement.new( defaultAnimationState )
	image:setClass( LUI.UIImage )
	image:setupUIImage()
	if defaultAnimationState ~= nil and defaultAnimationState.material ~= nil then
		image:setImage( defaultAnimationState.material )
	end
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
