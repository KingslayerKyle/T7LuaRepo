require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )

CoD.smallCollectibles = InheritFrom( LUI.UIElement )
CoD.smallCollectibles.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.smallCollectibles )
	self.id = "smallCollectibles"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 450 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local collectibleItem0 = CoD.collectibleItem.new( menu, controller )
	collectibleItem0:setLeftRight( false, true, -924, -731 )
	collectibleItem0:setTopBottom( true, false, -28, 165 )
	collectibleItem0:setRGB( 1, 1, 1 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_1", function ( model )
		collectibleItem0:setModel( model, controller )
	end )
	collectibleItem0.buttonPromptAddFunctions = {}
	collectibleItem0.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and PDV_SlotHasCollectible( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "X", element )
			return true
		else
			
		end
	end
	
	collectibleItem0:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PDV_SelectCollectibleSlot( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem0:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") and element:isInFocus() then
			if PDV_SlotHasCollectible( element, controller ) then
				PDV_ClearCollectible( self, element, controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	collectibleItem0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( collectibleItem0 )
	self.collectibleItem0 = collectibleItem0
	
	local collectibleItem1 = CoD.collectibleItem.new( menu, controller )
	collectibleItem1:setLeftRight( false, false, -97, 96 )
	collectibleItem1:setTopBottom( true, false, -28, 165 )
	collectibleItem1:setRGB( 1, 1, 1 )
	collectibleItem1:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_2", function ( model )
		collectibleItem1:setModel( model, controller )
	end )
	collectibleItem1.buttonPromptAddFunctions = {}
	collectibleItem1.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and PDV_SlotHasCollectible( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "X", element )
			return true
		else
			
		end
	end
	
	collectibleItem1:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PDV_SelectCollectibleSlot( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem1:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") and element:isInFocus() then
			if PDV_SlotHasCollectible( element, controller ) then
				PDV_ClearCollectible( self, element, controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem1:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	collectibleItem1:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( collectibleItem1 )
	self.collectibleItem1 = collectibleItem1
	
	local collectibleItem2 = CoD.collectibleItem.new( menu, controller )
	collectibleItem2:setLeftRight( false, true, -419, -226 )
	collectibleItem2:setTopBottom( true, false, -28, 165 )
	collectibleItem2:setRGB( 1, 1, 1 )
	collectibleItem2:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_3", function ( model )
		collectibleItem2:setModel( model, controller )
	end )
	collectibleItem2.buttonPromptAddFunctions = {}
	collectibleItem2.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and PDV_SlotHasCollectible( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "X", element )
			return true
		else
			
		end
	end
	
	collectibleItem2:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PDV_SelectCollectibleSlot( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem2:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") and element:isInFocus() then
			if PDV_SlotHasCollectible( element, controller ) then
				PDV_ClearCollectible( self, element, controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem2:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	collectibleItem2:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( collectibleItem2 )
	self.collectibleItem2 = collectibleItem2
	
	local collectibleItem3 = CoD.collectibleItem.new( menu, controller )
	collectibleItem3:setLeftRight( false, false, -349, -156 )
	collectibleItem3:setTopBottom( true, false, 191, 384 )
	collectibleItem3:setRGB( 1, 1, 1 )
	collectibleItem3:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_4", function ( model )
		collectibleItem3:setModel( model, controller )
	end )
	collectibleItem3.buttonPromptAddFunctions = {}
	collectibleItem3.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and PDV_SlotHasCollectible( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "X", element )
			return true
		else
			
		end
	end
	
	collectibleItem3:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PDV_SelectCollectibleSlot( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem3:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") and element:isInFocus() then
			if PDV_SlotHasCollectible( element, controller ) then
				PDV_ClearCollectible( self, element, controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem3:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	collectibleItem3:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( collectibleItem3 )
	self.collectibleItem3 = collectibleItem3
	
	local collectibleItem4 = CoD.collectibleItem.new( menu, controller )
	collectibleItem4:setLeftRight( false, false, -97, 96 )
	collectibleItem4:setTopBottom( true, false, 191, 384 )
	collectibleItem4:setRGB( 1, 1, 1 )
	collectibleItem4:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_5", function ( model )
		collectibleItem4:setModel( model, controller )
	end )
	collectibleItem4.buttonPromptAddFunctions = {}
	collectibleItem4.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and PDV_SlotHasCollectible( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "X", element )
			return true
		else
			
		end
	end
	
	collectibleItem4:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PDV_SelectCollectibleSlot( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem4:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") and element:isInFocus() then
			if PDV_SlotHasCollectible( element, controller ) then
				PDV_ClearCollectible( self, element, controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem4:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	collectibleItem4:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( collectibleItem4 )
	self.collectibleItem4 = collectibleItem4
	
	local collectibleItem5 = CoD.collectibleItem.new( menu, controller )
	collectibleItem5:setLeftRight( false, false, 156, 349 )
	collectibleItem5:setTopBottom( true, false, 191, 384 )
	collectibleItem5:setRGB( 1, 1, 1 )
	collectibleItem5:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_6", function ( model )
		collectibleItem5:setModel( model, controller )
	end )
	collectibleItem5.buttonPromptAddFunctions = {}
	collectibleItem5.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and PDV_SlotHasCollectible( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "X", element )
			return true
		else
			
		end
	end
	
	collectibleItem5:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PDV_SelectCollectibleSlot( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem5:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") and element:isInFocus() then
			if PDV_SlotHasCollectible( element, controller ) then
				PDV_ClearCollectible( self, element, controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectibleItem5:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	collectibleItem5:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( collectibleItem5 )
	self.collectibleItem5 = collectibleItem5
	
	collectibleItem0.navigation = {
		right = collectibleItem1,
		down = collectibleItem3
	}
	collectibleItem1.navigation = {
		left = collectibleItem0,
		right = collectibleItem2,
		down = collectibleItem4
	}
	collectibleItem2.navigation = {
		left = collectibleItem1,
		down = collectibleItem5
	}
	collectibleItem3.navigation = {
		up = collectibleItem0,
		right = collectibleItem4
	}
	collectibleItem4.navigation = {
		left = collectibleItem3,
		up = collectibleItem1,
		right = collectibleItem5
	}
	collectibleItem5.navigation = {
		left = collectibleItem4,
		up = collectibleItem2
	}
	collectibleItem0.id = "collectibleItem0"
	collectibleItem1.id = "collectibleItem1"
	collectibleItem2.id = "collectibleItem2"
	collectibleItem3.id = "collectibleItem3"
	collectibleItem4.id = "collectibleItem4"
	collectibleItem5.id = "collectibleItem5"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.collectibleItem0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.collectibleItem0:close()
		self.collectibleItem1:close()
		self.collectibleItem2:close()
		self.collectibleItem3:close()
		self.collectibleItem4:close()
		self.collectibleItem5:close()
		CoD.smallCollectibles.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

