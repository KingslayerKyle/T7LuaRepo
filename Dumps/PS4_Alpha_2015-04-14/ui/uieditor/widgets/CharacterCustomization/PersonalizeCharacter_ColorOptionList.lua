require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ColorOption" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

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
	self:setLeftRight( true, false, 0, 328 )
	self:setTopBottom( true, false, 0, 63 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, false, 0, 74 )
	BlackBox:setTopBottom( true, false, 0, 22 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.8 )
	BlackBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local colorList = LUI.UIList.new( menu, controller, 10, 0, nil, true, true, 139, 0, true, false )
	colorList:makeFocusable()
	colorList:setLeftRight( true, false, 0, 669 )
	colorList:setTopBottom( true, false, 12.5, 62.5 )
	colorList:setRGB( 1, 1, 1 )
	colorList:setWidgetType( CoD.PersonalizeCharacter_ColorOption )
	colorList:setHorizontalCount( 9 )
	colorList:setSpacing( 10 )
	colorList:linkToElementModel( self, "colorListDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorList:setDataSource( modelValue )
		end
	end )
	colorList.buttonPromptAddFunctions = {}
	colorList.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "A", element )
			return true
		else
			
		end
	end
	
	colorList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	colorList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.primary( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	colorList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "primary", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	colorList:updateButtonPromptEventHandlers()
	self:addElement( colorList )
	self.colorList = colorList
	
	local colorName = LUI.UITightText.new()
	colorName:setLeftRight( true, false, 0, 500 )
	colorName:setTopBottom( true, false, 4, 20 )
	colorName:setRGB( 1, 1, 1 )
	colorName:setTTF( "fonts/Entovo.ttf" )
	colorName:linkToElementModel( self, "colorIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorName:setText( Engine.Localize( LocalizeIntoString( modelValue, "HEROES_COLOR" ) ) )
		end
	end )
	self:addElement( colorName )
	self.colorName = colorName
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, -10, -273.72 )
	FETitleNumBrdr0:setTopBottom( false, false, -30.5, -11.5 )
	FETitleNumBrdr0:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	colorList.id = "colorList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.colorList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.colorList:close()
		self.FETitleNumBrdr0:close()
		self.colorName:close()
		CoD.PersonalizeCharacter_ColorOptionList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

