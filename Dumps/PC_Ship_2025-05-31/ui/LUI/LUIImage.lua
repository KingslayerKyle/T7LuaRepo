LUI.UIImage = InheritFrom( LUI.UIElement )
LUI.UIImage.Materials = {}
LUI.UIImage.DefaultImage = RegisterImage( "$white" )
LUI.UIImage.addElement = function ( f1_arg0, f1_arg1 )
	if f1_arg1.id ~= "LUITimer" then
		DebugPrint( "WARNING: An element is being added to a UIImage element. This will cause undesired behavior!" )
	end
	LUI.UIElement.addElement( f1_arg0, f1_arg1 )
end

LUI.UIImage.canAddElement = function ( f2_arg0, f2_arg1 )
	if f2_arg1.id ~= "LUITimer" then
		DebugPrint( "WARNING: An element is being added to a UIImage element. This will cause undesired behavior!" )
	end
	return LUI.UIElement.canAddElement( f2_arg0, f2_arg1 )
end

LUI.UIImage.new = function ( f3_arg0 )
	local self = LUI.UIElement.new( f3_arg0 )
	self:setClass( LUI.UIImage )
	self:setupUIImage()
	if f3_arg0 ~= nil and f3_arg0.material ~= nil then
		self:setImage( f3_arg0.material )
	end
	return self
end

LUI.UIImage.GetCachedMaterial = function ( f4_arg0 )
	local f4_local0 = LUI.UIImage.Materials[f4_arg0]
	if f4_local0 == nil then
		f4_local0 = RegisterMaterial( f4_arg0 )
		LUI.UIImage.Materials[f4_arg0] = f4_local0
	end
	return f4_local0
end

LUI.UIImage.id = "LUIImage"
