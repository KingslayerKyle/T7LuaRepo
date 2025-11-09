require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )

CoD.largeCollectibles = InheritFrom( LUI.UIElement )
CoD.largeCollectibles.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.largeCollectibles )
	self.id = "largeCollectibles"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 450 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local collectibleItem0 = CoD.collectibleItem.new( menu, controller )
	collectibleItem0:setLeftRight( true, false, 425, 725 )
	collectibleItem0:setTopBottom( true, false, 10, 310 )
	collectibleItem0:setRGB( 1, 1, 1 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_LARGE_1", function ( model )
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
	
	collectibleItem0.id = "collectibleItem0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.collectibleItem0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.collectibleItem0:close()
		CoD.largeCollectibles.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

