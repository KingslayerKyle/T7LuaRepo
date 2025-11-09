CoD.SelectedReward = {}
CoD.SelectedReward.New = function ( defaultAnimationState, imageSize )
	local selectedReward = LUI.UIElement.new( defaultAnimationState )
	local backgroundContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 1
	} )
	selectedReward.backgroundContainer = backgroundContainer
	selectedReward:addElement( backgroundContainer )
	local background = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	backgroundContainer:addElement( background )
	local stencilContainer = LUI.UIElement.new()
	stencilContainer:setLeftRight( true, true, 1, -1 )
	stencilContainer:setTopBottom( true, true, 1, -1 )
	stencilContainer:setUseStencil( true )
	selectedReward:addElement( stencilContainer )
	local rewardOffset = 7
	selectedReward.itemImage = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -imageSize / 2,
		right = imageSize / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = rewardOffset + -imageSize / 2,
		bottom = rewardOffset + imageSize / 2,
		alpha = 0
	} )
	stencilContainer:addElement( selectedReward.itemImage )
	local costOffset = 0
	selectedReward.cost = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = costOffset,
		bottom = costOffset + CoD.textSize.Default,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		font = CoD.fonts.Default
	} )
	selectedReward:addElement( selectedReward.cost )
	return selectedReward
end

CoD.SelectedReward.Update = function ( self, reward )
	if reward == nil then
		self.cost:setText( "" )
		self.itemImage:animateToState( "default" )
	else
		self.cost:setText( reward.momentumCost )
		local materialName = Engine.GetItemImage( reward.itemIndex )
		local largeMaterial = RegisterMaterial( materialName .. "_menu" )
		self.itemImage:registerAnimationState( "change_material", {
			material = largeMaterial,
			alpha = 1
		} )
		self.itemImage:animateToState( "change_material" )
	end
end

