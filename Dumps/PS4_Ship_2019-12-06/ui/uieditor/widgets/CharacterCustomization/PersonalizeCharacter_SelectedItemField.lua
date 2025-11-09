require( "ui.uieditor.widgets.CharacterCustomization.PersonalizedColorsList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizedColorsListItem_Small" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem_InfoAreaLabel" )

CoD.PersonalizeCharacter_SelectedItemField = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_SelectedItemField.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_SelectedItemField )
	self.id = "PersonalizeCharacter_SelectedItemField"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 85 )
	self.anyChildUsesUpdateState = true
	
	local selectionName = LUI.UIText.new()
	selectionName:setLeftRight( true, true, 3, 3 )
	selectionName:setTopBottom( true, false, 19, 35 )
	selectionName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	selectionName:linkToElementModel( self, "currentSelectionName", true, function ( model )
		local currentSelectionName = Engine.GetModelValue( model )
		if currentSelectionName then
			selectionName:setText( Engine.Localize( currentSelectionName ) )
		end
	end )
	self:addElement( selectionName )
	self.selectionName = selectionName
	
	local colorList = CoD.PersonalizedColorsList.new( menu, controller )
	colorList:setLeftRight( true, false, 13, 106 )
	colorList:setTopBottom( true, false, 40, 70 )
	colorList.colors:setWidgetType( CoD.PersonalizedColorsListItem_Small )
	colorList.colors:setSpacing( 1 )
	colorList:linkToElementModel( self, "colorListDatasource", true, function ( model )
		local colorListDatasource = Engine.GetModelValue( model )
		if colorListDatasource then
			colorList.colors:setDataSource( colorListDatasource )
		end
	end )
	self:addElement( colorList )
	self.colorList = colorList
	
	local header = CoD.PersonalizeCharacterCarouselItem_InfoAreaLabel.new( menu, controller )
	header:setLeftRight( true, false, 2, 93 )
	header:setTopBottom( true, false, 0, 22 )
	header:linkToElementModel( self, nil, false, function ( model )
		header:setModel( model, controller )
	end )
	self:addElement( header )
	self.header = header
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.colorList:close()
		element.header:close()
		element.selectionName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

