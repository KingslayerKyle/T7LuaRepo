require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCustomizeVariant" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCreateVariantName" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithVariantOptions" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantItemND" )

CoD.GunsmithVariantSelector = InheritFrom( LUI.UIElement )
CoD.GunsmithVariantSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithVariantSelector )
	self.id = "GunsmithVariantSelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 340 )
	self:setTopBottom( true, false, 0, 572 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local variantList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:setLeftRight( true, false, 4, 342 )
	variantList:setTopBottom( true, false, 8, 461 )
	variantList:setRGB( 1, 1, 1 )
	variantList:setDataSource( "GunsmithVariantList" )
	variantList:setWidgetType( CoD.GunsmithVariantItemND )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 7 )
	variantList.buttonPromptAddFunctions = {}
	variantList.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and Gunsmith_IsVariantOccupied( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_GUNSMITH_VARIANT_OPTIONS" ), "A", element )
			return true
		else
			
		end
	end
	
	variantList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if Gunsmith_IsVariantOccupied( element, controller ) then
			OpenOverlay( self, "GunsmithCustomizeVariant", controller )
		elseif not Gunsmith_IsVariantOccupied( element, controller ) then
			Gunsmith_ChooseEmptyVariant( self, element, controller )
			OpenPopup( self, "GunsmithCreateVariantName", controller )
		end
		return retVal
	end )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsModelValueEqualToEnum( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			Gunsmith_FocusOccupiedVariant( self, element, controller )
		end
		return retVal
	end )
	variantList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if Gunsmith_IsVariantOccupied( element, controller ) then
				OpenPopup( self, "GunsmithVariantOptions", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
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
	variantList:registerEventHandler( "lose_focus", function ( element, event )
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
	variantList:updateButtonPromptEventHandlers()
	self:addElement( variantList )
	self.variantList = variantList
	
	variantList.id = "variantList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.variantList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.variantList:close()
		CoD.GunsmithVariantSelector.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

