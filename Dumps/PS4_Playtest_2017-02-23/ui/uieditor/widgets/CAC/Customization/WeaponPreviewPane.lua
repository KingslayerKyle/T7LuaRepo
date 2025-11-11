require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )

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
	self:setLeftRight( 0, 0, 0, 1351 )
	self:setTopBottom( 0, 0, 0, 757 )
	
	local bottomLine = LUI.UIImage.new()
	bottomLine:setLeftRight( 0, 1, 0, 0 )
	bottomLine:setTopBottom( 1, 1, -3, 0 )
	bottomLine:setRGB( 0.43, 0.43, 0.44 )
	bottomLine:setAlpha( 0 )
	self:addElement( bottomLine )
	self.bottomLine = bottomLine
	
	local topLine = LUI.UIImage.new()
	topLine:setLeftRight( 0, 1, 0, 0 )
	topLine:setTopBottom( 0, 0, 0, 3 )
	topLine:setRGB( 0.43, 0.43, 0.44 )
	topLine:setAlpha( 0 )
	self:addElement( topLine )
	self.topLine = topLine
	
	local currentlyEquippedText = CoD.cac_PrimaryWeaponDescription.new( menu, controller )
	currentlyEquippedText:setLeftRight( 0, 0, 63, 639 )
	currentlyEquippedText:setTopBottom( 0, 0, 79.5, 112.5 )
	currentlyEquippedText:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentlyEquippedText.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentlyEquippedText )
	self.currentlyEquippedText = currentlyEquippedText
	
	local categoryName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	categoryName:setLeftRight( 0, 0, 63, 663 )
	categoryName:setTopBottom( 0, 0, 28, 79 )
	categoryName:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.currentlyEquippedText:close()
		self.categoryName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

