require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
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
	self:setLeftRight( true, false, 0, 335 )
	self:setTopBottom( true, false, 0, 100 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local colorList = LUI.UIList.new( menu, controller, 10, 0, nil, true, true, 139, 0, true, false )
	colorList:makeFocusable()
	colorList:setLeftRight( true, false, 0, 669 )
	colorList:setTopBottom( true, false, 17, 67 )
	colorList:setWidgetType( CoD.PersonalizeCharacter_ColorOption )
	colorList:setHorizontalCount( 9 )
	colorList:setSpacing( 10 )
	colorList:linkToElementModel( self, "colorListDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorList:setDataSource( modelValue )
		end
	end )
	self:addElement( colorList )
	self.colorList = colorList
	
	local text = CoD.FittedText.new( menu, controller )
	text:setLeftRight( true, false, 5, 65 )
	text:setTopBottom( false, true, -25, -2 )
	text:linkToElementModel( self, "colorIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text.text:setText( Engine.Localize( LocalizeIntoString( "HEROES_COLORS", modelValue ) ) )
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

