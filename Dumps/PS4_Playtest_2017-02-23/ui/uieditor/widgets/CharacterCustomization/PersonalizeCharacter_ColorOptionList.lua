require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ColorOption" )
require( "ui.uieditor.widgets.FittedText" )

local PostLoadFunc = function ( self, controller )
	self:linkToElementModel( self, "selectedColor", true, function ( model )
		self.colorList:findItem( nil, {
			optionIndex = Engine.GetModelValue( model )
		}, true, 0 )
	end )
end

CoD.PersonalizeCharacter_ColorOptionList = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_ColorOptionList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_ColorOptionList )
	self.id = "PersonalizeCharacter_ColorOptionList"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 502 )
	self:setTopBottom( 0, 0, 0, 150 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local colorList = LUI.UIList.new( menu, controller, 15, 0, nil, true, true, 139, 0, true, false )
	colorList:makeFocusable()
	colorList:setLeftRight( 0, 0, 35, 969 )
	colorList:setTopBottom( 0, 0, 26, 101 )
	colorList:setWidgetType( CoD.PersonalizeCharacter_ColorOption )
	colorList:setHorizontalCount( 9 )
	colorList:setSpacing( 15 )
	colorList:linkToElementModel( self, "colorListDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorList:setDataSource( modelValue )
		end
	end )
	self:addElement( colorList )
	self.colorList = colorList
	
	local text = CoD.FittedText.new( menu, controller )
	text:setLeftRight( 0, 0, 7, 97 )
	text:setTopBottom( 1, 1, -37, -3 )
	text:linkToElementModel( self, "colorIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text.text:setText( LocalizeIntoString( "HEROES_COLORS", modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	colorList.id = "colorList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.colorList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgIdle:close()
		self.BoxButtonLrgInactive:close()
		self.colorList:close()
		self.text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

