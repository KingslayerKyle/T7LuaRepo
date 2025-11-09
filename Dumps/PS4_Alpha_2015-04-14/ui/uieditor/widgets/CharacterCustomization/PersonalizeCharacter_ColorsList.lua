require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ColorOptionList" )

CoD.PersonalizeCharacter_ColorsList = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_ColorsList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_ColorsList )
	self.id = "PersonalizeCharacter_ColorsList"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 471 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, 0, 348 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setRGB( 0, 0, 0 )
	backing:setAlpha( 0.5 )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, false, 0, 194 )
	BlackBox:setTopBottom( true, false, 8, 38 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0 )
	BlackBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr1:setTopBottom( false, false, -235.5, 235.5 )
	FETitleNumBrdr1:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local colorsList = LUI.UIList.new( menu, controller, 15, 0, nil, true, false, 0, 0, false, false )
	colorsList:makeFocusable()
	colorsList:setLeftRight( true, false, 10, 338 )
	colorsList:setTopBottom( true, false, 50, 269 )
	colorsList:setRGB( 1, 1, 1 )
	colorsList:setDataSource( "CharacterCustomizationColorSetList" )
	colorsList:setWidgetType( CoD.PersonalizeCharacter_ColorOptionList )
	colorsList:setVerticalCount( 3 )
	colorsList:setSpacing( 15 )
	colorsList.buttonPromptAddFunctions = {}
	colorsList.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "A", element )
			return true
		else
			
		end
	end
	
	colorsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		HeroColorSectionHighlighted( menu, element, controller )
		return retVal
	end )
	colorsList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		HeroColorsSelected( menu, element, controller )
		return retVal
	end )
	colorsList:registerEventHandler( "gamepad_button", function ( element, event )
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
	colorsList:registerEventHandler( "gain_focus", function ( element, event )
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
	colorsList:registerEventHandler( "lose_focus", function ( element, event )
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
	colorsList:updateButtonPromptEventHandlers()
	self:addElement( colorsList )
	self.colorsList = colorsList
	
	local categoryName = LUI.UITightText.new()
	categoryName:setLeftRight( true, false, 5, 333 )
	categoryName:setTopBottom( true, false, 15, 40 )
	categoryName:setRGB( 1, 1, 1 )
	categoryName:setText( Engine.Localize( "MENU_NEW" ) )
	categoryName:setTTF( "fonts/Entovo.ttf" )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local GrayBoxBackground = LUI.UIImage.new()
	GrayBoxBackground:setLeftRight( false, false, -174, 0 )
	GrayBoxBackground:setTopBottom( true, false, 10, 42 )
	GrayBoxBackground:setRGB( 0.82, 0.82, 0.82 )
	GrayBoxBackground:setAlpha( 0.25 )
	GrayBoxBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GrayBoxBackground )
	self.GrayBoxBackground = GrayBoxBackground
	
	colorsList.id = "colorsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.colorsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.FETitleNumBrdr1:close()
		self.colorsList:close()
		CoD.PersonalizeCharacter_ColorsList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

