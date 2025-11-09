if CoD == nil then
	CoD = {}
end
CoD.EdgeShadow = {}
CoD.EdgeShadow.Size = 10
CoD.EdgeShadow.Alpha = 0.15
CoD.EdgeShadow.LeftShadowMaterial = RegisterMaterial( "lui_leftshadow" )
CoD.EdgeShadow.RightShadowMaterial = RegisterMaterial( "lui_rightshadow" )
CoD.EdgeShadow.TopShadowMaterial = RegisterMaterial( "lui_topshadow" )
CoD.EdgeShadow.BottomShadowMaterial = RegisterMaterial( "lui_bottomshadow" )
CoD.EdgeShadow.new = function ( edge, inner )
	local defaultAnimationState = nil
	if inner == nil then
		inner = false
	end
	if edge == "top" then
		if inner == true then
			defaultAnimationState = {
				left = 0,
				top = 0,
				right = 0,
				bottom = CoD.EdgeShadow.Size,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = false,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.TopShadowMaterial
			}
		else
			defaultAnimationState = {
				left = 0,
				top = -CoD.EdgeShadow.Size,
				right = 0,
				bottom = 0,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = false,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.BottomShadowMaterial
			}
		end
	elseif edge == "bottom" then
		if inner == true then
			defaultAnimationState = {
				left = 0,
				top = -CoD.EdgeShadow.Size,
				right = 0,
				bottom = 0,
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = true,
				bottomAnchor = true,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.BottomShadowMaterial
			}
		else
			defaultAnimationState = {
				left = 0,
				top = 0,
				right = 0,
				bottom = CoD.EdgeShadow.Size,
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = true,
				bottomAnchor = true,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.TopShadowMaterial
			}
		end
	elseif edge == "left" then
		if inner == true then
			defaultAnimationState = {
				left = 0,
				top = 0,
				right = CoD.EdgeShadow.Size,
				bottom = 0,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = true,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.LeftShadowMaterial
			}
		else
			defaultAnimationState = {
				left = -CoD.EdgeShadow.Size,
				top = 0,
				right = 0,
				bottom = 0,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = true,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.RightShadowMaterial
			}
		end
	elseif edge == "right" then
		if inner == true then
			defaultAnimationState = {
				left = -CoD.EdgeShadow.Size,
				top = 0,
				right = 0,
				bottom = 0,
				leftAnchor = false,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = true,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.RightShadowMaterial
			}
		else
			defaultAnimationState = {
				left = 0,
				top = 0,
				right = CoD.EdgeShadow.Size,
				bottom = 0,
				leftAnchor = false,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = true,
				alpha = CoD.EdgeShadow.Alpha,
				material = CoD.EdgeShadow.LeftShadowMaterial
			}
		end
	else
		return nil
	end
	return LUI.UIImage.new( defaultAnimationState )
end

