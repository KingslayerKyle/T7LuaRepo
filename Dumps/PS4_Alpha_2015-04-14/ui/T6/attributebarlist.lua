require( "ui.T6.AttributeBar" )

CoD.AttributeBarList = {}
CoD.AttributeBarList.Spacing = 0
CoD.AttributeBarList.BarHeight = CoD.textSize.ExtraSmall
CoD.AttributeBarList.BarColor = {
	r = 1,
	g = 1,
	b = 1,
	a = 0.75
}
CoD.AttributeBarList.NegativeBarColor = {
	r = 0.7,
	g = 0.25,
	b = 0.25,
	a = 1
}
CoD.AttributeBarList.PositiveBarColor = {
	r = 0.25,
	g = 0.65,
	b = 0.25,
	a = 1
}
CoD.AttributeBarList.new = function ( barWidth, defaultAnimationState, spacing )
	if spacing == nil then
		spacing = CoD.AttributeBarList.Spacing
	end
	local barHeight = CoD.AttributeBarList.BarHeight
	defaultAnimationState.spacing = spacing
	local attributeBarList = LUI.UIVerticalList.new( defaultAnimationState )
	attributeBarList.barWidth = barWidth
	attributeBarList.barHeight = barHeight
	attributeBarList.maxTextWidth = defaultAnimationState.right - defaultAnimationState.left - barWidth
	attributeBarList.addAttributeBar = CoD.AttributeBarList.AddAttributeBar
	attributeBarList.changeBarValue = CoD.AttributeBarList.ChangeBarValue
	attributeBarList.showModifiedValue = CoD.AttributeBarList.ShowModifiedValue
	attributeBarList.setLabel = CoD.AttributeBarList.SetLabel
	attributeBarList.attributes = {}
	return attributeBarList
end

CoD.AttributeBarList.SetLabel = function ( self, name, label )
	local attribute = self.attributes[name]
	if attribute == nil then
		error( "LUI ERROR: " .. name .. " bar does not exit" )
		return 
	elseif label == nil then
		label = ""
	end
	attribute.labelText:setText( label )
end

CoD.AttributeBarList.ShowModifiedValue = function ( self, name, modValue )
	local attribute = self.attributes[name]
	local attributeBar = attribute.attributeBar
	if attribute == nil then
		error( "LUI ERROR: " .. name .. " bar does not exist" )
		return 
	elseif modValue == nil then
		modValue = 0
	end
	attributeBar:showModifiedValue( modValue )
end

CoD.AttributeBarList.ChangeBarValue = function ( self, name, value )
	local attribute = self.attributes[name]
	local attributeBar = attribute.attributeBar
	if value == nil then
		value = 0
	end
	if attribute == nil or attributeBar == nil then
		error( "LUI ERROR: " .. name .. " bar does not exist" )
		return 
	elseif attributeBar.m_maxValue < value then
		error( "LUI ERROR: setting AttributeBar to a value higher than max value" )
		return 
	else
		attributeBar:setValue( value )
	end
end

CoD.AttributeBarList.AddAttributeBar = function ( self, name, label, initialValue, maxValue )
	if name == nil then
		error( "LUI ERROR: name required for CoD.AttributeBarList.AddAttributeBar" )
	end
	local attribute = CoD.AttributeBarList.CreateAttribute( self, label, initialValue, maxValue )
	self:addElement( attribute )
	self.attributes[name] = attribute
end

CoD.AttributeBarList.CreateAttribute = function ( self, label, initialValue, maxValue )
	local barWidth = self.barWidth
	local barHeight = self.barHeight
	if initialValue == nil then
		initialValue = 0
	end
	if maxValue == nil then
		maxValue = 100
	end
	local attribute = LUI.UIElement.new()
	attribute:setLeftRight( true, true, 0, 0 )
	attribute:setTopBottom( true, false, 0, barHeight )
	local labelFontName = "ExtraSmall"
	local f6_local0 = {}
	local labelDim = GetTextDimensions( label, CoD.fonts[labelFontName], CoD.textSize[labelFontName] )
	
	local labelText = LUI.UIText.new()
	labelText:setLeftRight( true, false, 0, labelDim[3] )
	labelText:setTopBottom( true, false, 0, CoD.textSize[labelFontName] )
	labelText:setAlpha( 0.4 )
	labelText:setFont( CoD.fonts[labelFontName] )
	labelText:setText( label )
	attribute:addElement( labelText )
	attribute.labelText = labelText
	
	local partWidth = 32
	local partHeight = 32
	
	local attributeBar = LUI.UIElement.new()
	attributeBar.id = "AttributeBar"
	attributeBar:setLeftRight( true, false, self.maxTextWidth, self.maxTextWidth + partWidth )
	attributeBar:setTopBottom( false, false, -partHeight / 2, partHeight / 2 )
	attributeBar:setupDashes( 20, 0, 0, 18 )
	attribute:addElement( attributeBar )
	attribute.attributeBar = attributeBar
	
	return attribute
end

