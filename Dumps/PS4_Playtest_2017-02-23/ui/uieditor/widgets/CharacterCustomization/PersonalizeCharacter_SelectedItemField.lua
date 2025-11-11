require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem_InfoAreaLabel" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizedColorsList" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizedColorsListItem_Small" )

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
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 127 )
	self.anyChildUsesUpdateState = true
	
	local selectionName = LUI.UIText.new()
	selectionName:setLeftRight( 0, 1, 4, 4 )
	selectionName:setTopBottom( 0, 0, 28, 52 )
	selectionName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	selectionName:linkToElementModel( self, "currentSelectionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( selectionName )
	self.selectionName = selectionName
	
	local colorList = CoD.PersonalizedColorsList.new( menu, controller )
	colorList:setLeftRight( 0, 0, 19, 159 )
	colorList:setTopBottom( 0, 0, 59.5, 104.5 )
	colorList.colors:setWidgetType( CoD.PersonalizedColorsListItem_Small )
	colorList.colors:setSpacing( 1 )
	colorList:linkToElementModel( self, "colorListDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorList.colors:setDataSource( modelValue )
		end
	end )
	self:addElement( colorList )
	self.colorList = colorList
	
	local header = CoD.PersonalizeCharacterCarouselItem_InfoAreaLabel.new( menu, controller )
	header:setLeftRight( 0, 0, 3, 139 )
	header:setTopBottom( 0, 0, -0.5, 32.5 )
	header:linkToElementModel( self, nil, false, function ( model )
		header:setModel( model, controller )
	end )
	self:addElement( header )
	self.header = header
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.colorList:close()
		self.header:close()
		self.selectionName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

