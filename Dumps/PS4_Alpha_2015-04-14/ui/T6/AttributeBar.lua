CoD.AttributeBar = {}
CoD.AttributeBar.PartMaterialName = "menu_attribute_bar_part"
CoD.AttributeBar.new = function ( defaultAnimationState, barWidth, barHeight, maxValue, partCount )
	if defaultAnimationState == nil then
		defaultAnimationState = CoD.GetDefaultAnimationState()
	end
	local bar = LUI.UIElement.new( defaultAnimationState )
	bar.id = "AttributeBar"
	bar.setValue = CoD.AttributeBar.SetValue
	bar.showModifiedValue = CoD.AttributeBar.ShowModifiedValue
	bar.m_value = 0
	bar.m_maxValue = maxValue
	bar.m_partCount = partCount
	bar.m_parts = {}
	local barMaterial = CoD.AttributeBar.PartMaterial
	if barMaterial == nil then
		barMaterial = RegisterMaterial( CoD.AttributeBar.PartMaterialName )
		CoD.AttributeBar.PartMaterial = barMaterial
	end
	local partImageWidthAdjustmentRatio = 0.5
	local partWidth = barWidth / partCount * partImageWidthAdjustmentRatio
	local partHeight = 32
	local xOffset = partWidth * partImageWidthAdjustmentRatio
	local x = -xOffset / 2
	for i = 1, partCount, 1 do
		local f1_local2 = i
		local part = LUI.UIImage.new()
		part:setLeftRight( true, false, x, x + partWidth )
		part:setTopBottom( false, false, -partHeight / 2, partHeight / 2 )
		part:setImage( barMaterial )
		part:setRGB( 1, 1, 1 )
		bar:addElement( part )
		table.insert( bar.m_parts, part )
		x = x + partWidth - xOffset
	end
	return bar
end

CoD.AttributeBar.SetValue = function ( attributeBar, value )
	attributeBar.m_value = value
	local partsActive = value * attributeBar.m_partCount / attributeBar.m_maxValue
	for i, part in ipairs( attributeBar.m_parts ) do
		if i <= partsActive then
			part:setRGB( 1, 1, 1 )
			part:beginAnimation( "show", 250 )
			part:setAlpha( 1 )
		else
			part:beginAnimation( "hide", 250 )
			part:setAlpha( 0 )
		end
	end
end

CoD.AttributeBar.ShowModifiedValue = function ( attributeBar, modValue )
	if modValue == nil or modValue == 0 then
		return 
	end
	local currentPartsActive = attributeBar.m_value * attributeBar.m_partCount / attributeBar.m_maxValue
	local modifiedPartsActive = modValue * attributeBar.m_partCount / attributeBar.m_maxValue
	local realPartsActive = math.max( currentPartsActive, currentPartsActive + modifiedPartsActive )
	for i, part in ipairs( attributeBar.m_parts ) do
		if i <= realPartsActive then
			part:setRGB( 1, 1, 1 )
			part:beginAnimation( "show", 250 )
			part:setAlpha( 1 )
		else
			part:beginAnimation( "hide", 250 )
			part:setAlpha( 0 )
		end
		if modifiedPartsActive > 0 then
			if currentPartsActive < i then
				part:setRGB( 0, 1, 0 )
			end
		end
		if modifiedPartsActive < 0 and currentPartsActive + modifiedPartsActive < i then
			part:setRGB( 1, 0, 0 )
		end
	end
end

