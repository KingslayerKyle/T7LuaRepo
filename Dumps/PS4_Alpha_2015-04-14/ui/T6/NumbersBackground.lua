CoD.NumbersBackground = {}
CoD.NumbersBackground.Width = 1500
CoD.NumbersBackground.Height = 1500
local numbersMaterialName1 = "menu_numbers_1"
local numbersMaterialName2 = "menu_numbers_2"
local numbersMaterialName3 = "menu_numbers_3"
local numbersMaterialName4 = "menu_numbers_4"
local numbersMaterialName5 = "menu_numbers_5"
if CoD.isZombie == true then
	numbersMaterialName1 = "menu_zm_numbers_1"
	numbersMaterialName2 = "menu_zm_numbers_2"
	numbersMaterialName3 = "menu_zm_numbers_3"
	numbersMaterialName4 = "menu_zm_numbers_4"
	numbersMaterialName5 = "menu_zm_numbers_5"
end
CoD.NumbersBackground.Materials = {
	{
		name = numbersMaterialName1,
		width = 2048,
		height = 32
	},
	{
		name = numbersMaterialName2,
		width = 1024,
		height = 64
	},
	{
		name = numbersMaterialName3,
		width = 2048,
		height = 64
	},
	{
		name = numbersMaterialName4,
		width = 2048,
		height = 64
	},
	{
		name = numbersMaterialName5,
		width = 1024,
		height = 128
	}
}
CoD.NumbersBackground.Numbers_Reset = function ( self, event )
	self:animateToState( "default" )
	self:animateToState( "scroll", self.speed )
end

CoD.NumbersBackground.new = function ()
	local numbersBackgroundWidth = CoD.NumbersBackground.Width
	local numbersBackgroundHeight = CoD.NumbersBackground.Height
	local self = LUI.UIElement.new( {
		left = -numbersBackgroundWidth / 2,
		top = -numbersBackgroundHeight / 2,
		right = numbersBackgroundWidth / 2,
		bottom = numbersBackgroundHeight / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		zRot = 45
	} )
	math.randomseed( 4321 )
	for i = 1, 40, 1 do
		local f2_local2 = i
		local numberChoice = math.random( 1, #CoD.NumbersBackground.Materials )
		local numberInfo = CoD.NumbersBackground.Materials[numberChoice]
		local startingLeft = -numberInfo.width
		local startingTop = math.random( numbersBackgroundHeight - numberInfo.height )
		local endingLeft = numbersBackgroundWidth + 2048
		local alpha = 0.12 * (#CoD.NumbersBackground.Materials - numberChoice + 1) / #CoD.NumbersBackground.Materials
		local initialFraction = math.random()
		local initialLeft = startingLeft + initialFraction * (endingLeft - startingLeft)
		local numbersElement = LUI.UIImage.new( {
			left = initialLeft,
			top = startingTop,
			right = initialLeft + numberInfo.width,
			bottom = startingTop + numberInfo.height,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			material = RegisterMaterial( numberInfo.name ),
			alpha = alpha
		} )
		local slowness = 1 - (numberChoice - 1) / (#CoD.NumbersBackground.Materials - 1)
		numbersElement:setPriority( #CoD.NumbersBackground.Materials - numberChoice )
		numbersElement:registerAnimationState( "default", {
			left = startingLeft,
			right = startingLeft + numberInfo.width,
			leftAnchor = true,
			rightAnchor = false
		} )
		numbersElement.speed = 50000 + 70000 * slowness * slowness
		numbersElement:registerAnimationState( "scroll", {
			left = endingLeft,
			right = endingLeft + numberInfo.width,
			leftAnchor = true,
			rightAnchor = false
		} )
		numbersElement:registerEventHandler( "transition_complete_scroll", CoD.NumbersBackground.Numbers_Reset )
		numbersElement:animateToState( "scroll", (1 - initialFraction) * numbersElement.speed )
		self:addElement( numbersElement )
	end
	return self
end

