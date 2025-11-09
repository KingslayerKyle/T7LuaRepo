CoD.TabbedSlotButton = {}
CoD.TabbedSlotButton.SlotTabRightSpacing = 45
CoD.TabbedSlotButton.SlotTabItemSpacing = 85
CoD.TabbedSlotButton.SlotTabBottomSpacing = 5
CoD.TabbedSlotButton.new = function ( defaultAnimationState, slotHeight, slotWidth, bottom, spacing, right )
	local self = CoD.GrowingGridButton.new( defaultAnimationState )
	if slotHeight == nil then
		slotHeight = CoD.SlotList.SlotHeight
	end
	if slotWidth == nil then
		slotWidth = CoD.SlotList.SlotWidth
	end
	if bottom == nil then
		bottom = CoD.TabbedSlotButton.SlotTabBottomSpacing
	end
	if spacing == nil then
		spacing = CoD.TabbedSlotButton.SlotTabItemSpacing
	end
	if right == nil then
		right = CoD.TabbedSlotButton.SlotTabRightSpacing
	end
	if self.grid then
		self.grid:close()
		self.grid = nil
	end
	if self.border then
		self.border:close()
		self.border = nil
	end
	self.itemHeight = slotHeight
	self.itemWidth = slotWidth
	self.itemBottom = bottom
	self.spacing = spacing
	self.rightSpacing = right
	self.setSlotImage = CoD.TabbedSlotButton.SetSlotImage
	self.clearSlotImages = CoD.TabbedSlotButton.ClearSlotImages
	self.addBackgroundImage = CoD.TabbedSlotButton.AddBackgroundImage
	self.addBackgroundHighlightImage = CoD.TabbedSlotButton.AddBackgroundHighlightImage
	return self
end

CoD.TabbedSlotButton.AddBackgroundImage = function ( self, defaultAnimationState, material )
	if defaultAnimationState == nil then
		defaultAnimationState = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		}
	end
	defaultAnimationState.alpha = 1
	defaultAnimationState.material = RegisterMaterial( material )
	self.outline = LUI.UIImage.new( defaultAnimationState )
	self:addElement( self.outline )
end

CoD.TabbedSlotButton.AddBackgroundHighlightImage = function ( self, defaultAnimationState, material )
	if defaultAnimationState == nil then
		defaultAnimationState = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		}
	end
	defaultAnimationState.alpha = 0
	defaultAnimationState.material = RegisterMaterial( material )
	self.border = LUI.UIImage.new( defaultAnimationState )
	self:addElement( self.border )
end

CoD.TabbedSlotButton.SetSlotImage = function ( self, material, index, maxIndex, bottom, spacing )
	if not self.slotImages then
		self.slotImages = {}
	end
	if self.slotImages[index] then
		if material then
			self.slotImages[index]:beginAnimation( "change_material" )
			self.slotImages[index]:setImage( RegisterMaterial( material ) )
		else
			self.slotImages[index]:close()
			self.slotImages[index] = nil
		end
		return 
	else
		local center = (maxIndex - index) * self.spacing + self.rightSpacing
		local image = LUI.UIImage.new()
		image:setLeftRight( false, true, -center - self.itemWidth / 2, -center + self.itemWidth / 2 )
		image:setTopBottom( false, false, -self.itemHeight / 2 - self.itemBottom, self.itemHeight / 2 - self.itemBottom )
		image:setImage( RegisterMaterial( material ) )
		self.slotImages[index] = image
		self:addElement( image )
	end
end

CoD.TabbedSlotButton.ClearSlotImages = function ( self )
	if self.slotImages then
		for index, image in pairs( self.slotImages ) do
			image:close()
			image = nil
			self.slotImages[index] = nil
		end
	end
end

