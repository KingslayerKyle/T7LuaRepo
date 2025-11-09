require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ListButton" )

CoD.PersonalizeCharacter_PersonalizeList = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_PersonalizeList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_PersonalizeList )
	self.id = "PersonalizeCharacter_PersonalizeList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 632 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 10, -10 )
	backing:setTopBottom( true, true, 10, -12 )
	backing:setRGB( 0, 0, 0 )
	backing:setAlpha( 0.5 )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	local customizationList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	customizationList:makeFocusable()
	customizationList:setLeftRight( true, false, 10, 310 )
	customizationList:setTopBottom( true, false, 10, 620 )
	customizationList:setRGB( 1, 1, 1 )
	customizationList:setDataSource( "CharacterCustomizationButtonList" )
	customizationList:setWidgetType( CoD.PersonalizeCharacter_ListButton )
	customizationList:setVerticalCount( 6 )
	customizationList.buttonPromptAddFunctions = {}
	customizationList.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() and not IsDisabled( element, controller ) then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "A", element )
			return true
		else
			
		end
	end
	
	customizationList:linkToElementModel( customizationList, "disabled", true, function ( model )
		local element = customizationList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		if not element.buttonPromptAddFunctions.primary( menu, element, event ) then
			menu:removeButtonPrompt( "primary", element )
		end
	end )
	customizationList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) then
			BeginEdittingHeroOption( menu, element, controller )
		end
		return retVal
	end )
	customizationList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if not IsDisabled( element, controller ) then
				
			else
				
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	customizationList:registerEventHandler( "gain_focus", function ( element, event )
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
	customizationList:registerEventHandler( "lose_focus", function ( element, event )
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
	customizationList:updateButtonPromptEventHandlers()
	self:addElement( customizationList )
	self.customizationList = customizationList
	
	customizationList.id = "customizationList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.customizationList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.customizationList:close()
		CoD.PersonalizeCharacter_PersonalizeList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

