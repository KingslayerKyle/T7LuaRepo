require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Heroes.heroCustomizationOption" )

CoD.heroSelectOptionList = InheritFrom( LUI.UIElement )
CoD.heroSelectOptionList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroSelectOptionList )
	self.id = "heroSelectOptionList"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 564 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, 0, 348 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setRGB( 0, 0, 0 )
	backing:setAlpha( 0.3 )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr1:setTopBottom( false, false, -234, 282 )
	FETitleNumBrdr1:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local optionsList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 10, 338 )
	optionsList:setTopBottom( true, false, 57, 495 )
	optionsList:setRGB( 1, 1, 1 )
	optionsList:setDataSource( "HeroChooseOptionButtonList" )
	optionsList:setWidgetType( CoD.heroCustomizationOption )
	optionsList:setHorizontalCount( 3 )
	optionsList:setVerticalCount( 4 )
	optionsList.buttonPromptAddFunctions = {}
	optionsList.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "A", element )
			return true
		else
			
		end
	end
	
	optionsList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		HeroOptionSelected( menu, element, controller )
		return retVal
	end )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		HeroOptionHighlighted( menu, element, controller )
		return retVal
	end )
	optionsList:registerEventHandler( "gamepad_button", function ( element, event )
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
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
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
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
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
	optionsList:updateButtonPromptEventHandlers()
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local GrayBoxBackground = LUI.UIImage.new()
	GrayBoxBackground:setLeftRight( false, false, -174, -110 )
	GrayBoxBackground:setTopBottom( true, false, 9, 41 )
	GrayBoxBackground:setRGB( 0.82, 0.82, 0.82 )
	GrayBoxBackground:setAlpha( 0.25 )
	GrayBoxBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GrayBoxBackground )
	self.GrayBoxBackground = GrayBoxBackground
	
	local categoryName = LUI.UITightText.new()
	categoryName:setLeftRight( true, false, 5, 5 )
	categoryName:setTopBottom( true, false, 13, 38 )
	categoryName:setRGB( 1, 1, 1 )
	categoryName:setText( Engine.Localize( "" ) )
	categoryName:setTTF( "fonts/Entovo.ttf" )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	optionsList.id = "optionsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.FETitleNumBrdr1:close()
		self.optionsList:close()
		CoD.heroSelectOptionList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

