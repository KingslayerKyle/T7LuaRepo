require( "ui.uieditor.widgets.CAC.Customization.CategoryNameWidget" )

local PostLoadFunc = function ( self, controller )
	self:subscribeToElementModel( nil, function ( model )
		local modelValue = Engine.GetModel( model, "itemIndex" )
		if modelValue then
			local itemIndex = Engine.GetModelValue( modelValue )
			self.unlockWeaponDescTextBox:setText( CoD.GetUnlockStringForItemIndex( controller, itemIndex ) )
		end
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end )
	if self.CategoryNameWidget0 then
		self.CategoryNameWidget0:linkToElementModel( self, "displayText", true, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.CategoryNameWidget0.categoryNameLabel:setText( LocalizeToUpperString( modelValue ) )
				local textWidth = self.CategoryNameWidget0.categoryNameLabel:getTextWidth()
				local left, top, right, bottom = self.CategoryNameWidget0:getLocalRect()
				local extraTextWidth = 30
				self.CategoryNameWidget0:setLeftRight( true, false, left, left + textWidth + extraTextWidth )
			end
		end )
	end
end

CoD.WeaponPreviewPane = InheritFrom( LUI.UIElement )
CoD.WeaponPreviewPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.WeaponPreviewPane )
	self.id = "WeaponPreviewPane"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 901 )
	self:setTopBottom( true, false, 0, 505 )
	
	local bottomLine = LUI.UIImage.new()
	bottomLine:setLeftRight( true, true, 0, 0 )
	bottomLine:setTopBottom( false, true, -2, 0 )
	bottomLine:setRGB( 0.43, 0.43, 0.44 )
	bottomLine:setAlpha( 0 )
	self:addElement( bottomLine )
	self.bottomLine = bottomLine
	
	local topLine = LUI.UIImage.new()
	topLine:setLeftRight( true, true, 0, 0 )
	topLine:setTopBottom( true, false, 0, 2 )
	topLine:setRGB( 0.43, 0.43, 0.44 )
	topLine:setAlpha( 0 )
	self:addElement( topLine )
	self.topLine = topLine
	
	local currentlyEquipped = LUI.UITightText.new()
	currentlyEquipped:setLeftRight( true, false, 44, 74 )
	currentlyEquipped:setTopBottom( true, false, 55, 72 )
	currentlyEquipped:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	currentlyEquipped:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentlyEquipped:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentlyEquipped )
	self.currentlyEquipped = currentlyEquipped
	
	local CategoryNameWidget0 = CoD.CategoryNameWidget.new( menu, controller )
	CategoryNameWidget0:setLeftRight( true, false, 40, 206 )
	CategoryNameWidget0:setTopBottom( true, false, 16, 51 )
	CategoryNameWidget0:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryNameWidget0.categoryNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CategoryNameWidget0 )
	self.CategoryNameWidget0 = CategoryNameWidget0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CategoryNameWidget0:close()
		self.currentlyEquipped:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

