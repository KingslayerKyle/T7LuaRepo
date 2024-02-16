-- 72e9ea17213588528e30666de5c1a4c2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

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
	
	local f1_local5 = nil
	if IsPC() then
		f1_local5 = CoD.XCamMouseControl.new( menu, controller )
	else
		f1_local5 = LUI.UIElement.createFake()
	end
	f1_local5:setLeftRight( true, false, 42, 874 )
	f1_local5:setTopBottom( true, false, 75, 491 )
	if IsPC() then
		self:addElement( f1_local5 )
	end
	self.XCamMouseControl = f1_local5

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.currentlyEquippedText:close()
		element.categoryName:close()
		element.XCamMouseControl:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
