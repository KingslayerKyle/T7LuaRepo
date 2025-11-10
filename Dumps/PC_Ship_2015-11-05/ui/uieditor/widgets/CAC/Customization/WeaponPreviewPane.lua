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
	self:setLeftRight( true, false, 0, 901 )
	self:setTopBottom( true, false, 0, 505 )
	self.anyChildUsesUpdateState = true
	
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
	
	local currentlyEquippedText = CoD.cac_PrimaryWeaponDescription.new( menu, controller )
	currentlyEquippedText:setLeftRight( true, false, 42, 426 )
	currentlyEquippedText:setTopBottom( true, false, 53, 75 )
	currentlyEquippedText:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			currentlyEquippedText.weaponDescTextBox:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( currentlyEquippedText )
	self.currentlyEquippedText = currentlyEquippedText
	
	local categoryName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	categoryName:setLeftRight( true, false, 42, 442 )
	categoryName:setTopBottom( true, false, 19, 53 )
	categoryName:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			categoryName.itemName:setText( Engine.Localize( displayText ) )
		end
	end )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.currentlyEquippedText:close()
		element.categoryName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

