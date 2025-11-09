require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassMinorHeader" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentButton" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithAttachmentSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCamoSelect" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelectorItem" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithPaintjobSelect" )

CoD.GunsmithVariantAttachments = InheritFrom( LUI.UIElement )
CoD.GunsmithVariantAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithVariantAttachments )
	self.id = "GunsmithVariantAttachments"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 93 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local OpticsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	OpticsHeader:setLeftRight( true, false, 1, 109 )
	OpticsHeader:setTopBottom( true, false, 0, 17 )
	OpticsHeader:setRGB( 1, 1, 1 )
	OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( OpticsHeader )
	self.OpticsHeader = OpticsHeader
	
	local AttachmentsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	AttachmentsHeader:setLeftRight( true, true, 112.67, -245.9 )
	AttachmentsHeader:setTopBottom( true, false, 0, 17 )
	AttachmentsHeader:setRGB( 1, 1, 1 )
	AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	self:addElement( AttachmentsHeader )
	self.AttachmentsHeader = AttachmentsHeader
	
	local Optic = CoD.GunsmithAttachmentButton.new( menu, controller )
	Optic:setLeftRight( true, false, 0, 64 )
	Optic:setTopBottom( true, false, 24, 88 )
	Optic:setRGB( 1, 1, 1 )
	Optic:linkToElementModel( self, nil, false, function ( model )
		Optic:setModel( model, controller )
	end )
	Optic:linkToElementModel( self, "attachment1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Optic.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( modelValue, controller, "1" ) ) )
		end
	end )
	Optic.buttonPromptAddFunctions = {}
	Optic.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "A", element )
			return true
		else
			
		end
	end
	
	Optic:linkToElementModel( Optic, "attachment1", true, function ( model )
		local element = Optic
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment1"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	Optic:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SetWeaponAttachmentType( self, element, "optic", "1", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Optic:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) then
				Gunsmith_ClearAttachmentSlot( self, element, "1", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Optic:registerEventHandler( "gain_focus", function ( element, event )
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
	Optic:registerEventHandler( "lose_focus", function ( element, event )
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
	Optic:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 )
			end
		}
	} )
	Optic:linkToElementModel( Optic, "attachment1", true, function ( model )
		menu:updateElementState( Optic, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment1"
		} )
	end )
	self:addElement( Optic )
	self.Optic = Optic
	
	local Attachment1 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment1:setLeftRight( true, false, 111.67, 175.67 )
	Attachment1:setTopBottom( true, false, 24, 88 )
	Attachment1:setRGB( 1, 1, 1 )
	Attachment1:linkToElementModel( self, nil, false, function ( model )
		Attachment1:setModel( model, controller )
	end )
	Attachment1:linkToElementModel( self, "attachment2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment1.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( modelValue, controller, "2" ) ) )
		end
	end )
	Attachment1.buttonPromptAddFunctions = {}
	Attachment1.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "A", element )
			return true
		else
			
		end
	end
	
	Attachment1:linkToElementModel( Attachment1, "attachment2", true, function ( model )
		local element = Attachment1
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment2"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	Attachment1:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "2", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment1:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
				Gunsmith_ClearAttachmentSlot( self, element, "2", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment1:registerEventHandler( "gain_focus", function ( element, event )
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
	Attachment1:registerEventHandler( "lose_focus", function ( element, event )
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
	Attachment1:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment2", 0 )
			end
		}
	} )
	Attachment1:linkToElementModel( Attachment1, "attachment2", true, function ( model )
		menu:updateElementState( Attachment1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment2"
		} )
	end )
	self:addElement( Attachment1 )
	self.Attachment1 = Attachment1
	
	local Attachment2 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment2:setLeftRight( true, false, 180.67, 244.67 )
	Attachment2:setTopBottom( true, false, 24, 88 )
	Attachment2:setRGB( 1, 1, 1 )
	Attachment2:linkToElementModel( self, nil, false, function ( model )
		Attachment2:setModel( model, controller )
	end )
	Attachment2:linkToElementModel( self, "attachment3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment2.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( modelValue, controller, "3" ) ) )
		end
	end )
	Attachment2.buttonPromptAddFunctions = {}
	Attachment2.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "P", element )
			return true
		else
			
		end
	end
	
	Attachment2:linkToElementModel( Attachment2, "attachment3", true, function ( model )
		local element = Attachment2
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment3"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	Attachment2:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "3", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment2:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "P") and element:isInFocus() then
			if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
				Gunsmith_ClearAttachmentSlot( self, element, "3", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment2:registerEventHandler( "gain_focus", function ( element, event )
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
	Attachment2:registerEventHandler( "lose_focus", function ( element, event )
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
	Attachment2:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment3", 0 )
			end
		}
	} )
	Attachment2:linkToElementModel( Attachment2, "attachment3", true, function ( model )
		menu:updateElementState( Attachment2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment3"
		} )
	end )
	self:addElement( Attachment2 )
	self.Attachment2 = Attachment2
	
	local Attachment3 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment3:setLeftRight( true, false, 249.67, 313.67 )
	Attachment3:setTopBottom( true, false, 24, 88 )
	Attachment3:setRGB( 1, 1, 1 )
	Attachment3:linkToElementModel( self, nil, false, function ( model )
		Attachment3:setModel( model, controller )
	end )
	Attachment3:linkToElementModel( self, "attachment4", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment3.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( modelValue, controller, "4" ) ) )
		end
	end )
	Attachment3.buttonPromptAddFunctions = {}
	Attachment3.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "A", element )
			return true
		else
			
		end
	end
	
	Attachment3:linkToElementModel( Attachment3, "attachment4", true, function ( model )
		local element = Attachment3
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment4"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	Attachment3:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "4", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment3:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
				Gunsmith_ClearAttachmentSlot( self, element, "4", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment3:registerEventHandler( "gain_focus", function ( element, event )
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
	Attachment3:registerEventHandler( "lose_focus", function ( element, event )
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
	Attachment3:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment4", 0 )
			end
		}
	} )
	Attachment3:linkToElementModel( Attachment3, "attachment4", true, function ( model )
		menu:updateElementState( Attachment3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment4"
		} )
	end )
	self:addElement( Attachment3 )
	self.Attachment3 = Attachment3
	
	local Attachment4 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment4:setLeftRight( true, false, 320.1, 384.1 )
	Attachment4:setTopBottom( true, false, 24, 88 )
	Attachment4:setRGB( 1, 1, 1 )
	Attachment4:linkToElementModel( self, nil, false, function ( model )
		Attachment4:setModel( model, controller )
	end )
	Attachment4:linkToElementModel( self, "attachment5", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment4.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( modelValue, controller, "5" ) ) )
		end
	end )
	Attachment4.buttonPromptAddFunctions = {}
	Attachment4.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "A", element )
			return true
		else
			
		end
	end
	
	Attachment4:linkToElementModel( Attachment4, "attachment5", true, function ( model )
		local element = Attachment4
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment5"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	Attachment4:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "5", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment4:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
				Gunsmith_ClearAttachmentSlot( self, element, "5", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment4:registerEventHandler( "gain_focus", function ( element, event )
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
	Attachment4:registerEventHandler( "lose_focus", function ( element, event )
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
	Attachment4:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment5", 0 )
			end
		}
	} )
	Attachment4:linkToElementModel( Attachment4, "attachment5", true, function ( model )
		menu:updateElementState( Attachment4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment5"
		} )
	end )
	self:addElement( Attachment4 )
	self.Attachment4 = Attachment4
	
	local Attachment5 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment5:setLeftRight( true, false, 389.1, 453.1 )
	Attachment5:setTopBottom( true, false, 24, 88 )
	Attachment5:setRGB( 1, 1, 1 )
	Attachment5:linkToElementModel( self, nil, false, function ( model )
		Attachment5:setModel( model, controller )
	end )
	Attachment5:linkToElementModel( self, "attachment6", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment5.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( modelValue, controller, "6" ) ) )
		end
	end )
	Attachment5.buttonPromptAddFunctions = {}
	Attachment5.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "A", element )
			return true
		else
			
		end
	end
	
	Attachment5:linkToElementModel( Attachment5, "attachment6", true, function ( model )
		local element = Attachment5
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment6"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	Attachment5:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "6", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment5:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
				Gunsmith_ClearAttachmentSlot( self, element, "6", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Attachment5:registerEventHandler( "gain_focus", function ( element, event )
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
	Attachment5:registerEventHandler( "lose_focus", function ( element, event )
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
	Attachment5:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment6", 0 )
			end
		}
	} )
	Attachment5:linkToElementModel( Attachment5, "attachment6", true, function ( model )
		menu:updateElementState( Attachment5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment6"
		} )
	end )
	self:addElement( Attachment5 )
	self.Attachment5 = Attachment5
	
	local Camo = CoD.GunsmithAttachmentButton.new( menu, controller )
	Camo:setLeftRight( true, false, 612.44, 676.44 )
	Camo:setTopBottom( true, false, 24, 88 )
	Camo:setRGB( 1, 1, 1 )
	Camo:linkToElementModel( self, nil, false, function ( model )
		Camo:setModel( model, controller )
	end )
	Camo:linkToElementModel( self, "camoIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Camo.attachmentImage:setImage( RegisterImage( GetCamoImageFromIndex( modelValue, controller ) ) )
		end
	end )
	Camo:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SetWeaponCamoModel( self, element, controller )
		NavigateToMenu( self, "GunsmithCamoSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Camo:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "camoIndex", -1 )
			end
		}
	} )
	Camo:linkToElementModel( Camo, "camoIndex", true, function ( model )
		menu:updateElementState( Camo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "camoIndex"
		} )
	end )
	self:addElement( Camo )
	self.Camo = Camo
	
	local PaintjobHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	PaintjobHeader:setLeftRight( true, false, 501.77, 609.77 )
	PaintjobHeader:setTopBottom( true, false, 0, 17 )
	PaintjobHeader:setRGB( 1, 1, 1 )
	PaintjobHeader.text:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
	self:addElement( PaintjobHeader )
	self.PaintjobHeader = PaintjobHeader
	
	local CamoHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	CamoHeader:setLeftRight( true, false, 611.44, 719.44 )
	CamoHeader:setTopBottom( true, false, 0, 17 )
	CamoHeader:setRGB( 1, 1, 1 )
	CamoHeader.text:setText( Engine.Localize( "MPUI_CAMO_CAPS" ) )
	self:addElement( CamoHeader )
	self.CamoHeader = CamoHeader
	
	local paintjob = CoD.PaintjobSelectorItem.new( menu, controller )
	paintjob:setLeftRight( true, false, 500.77, 564.77 )
	paintjob:setTopBottom( true, false, 25, 89 )
	paintjob:setRGB( 1, 1, 1 )
	paintjob:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjob.drawPaintjobLeftView:setupPaintjobCustomizationType( modelValue )
		end
	end )
	paintjob:linkToElementModel( self, nil, false, function ( model )
		paintjob:setModel( model, controller )
	end )
	paintjob:linkToElementModel( self, "paintjobSlot", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjob.drawPaintjobLeftView:setupPaintjobSlot( modelValue )
		end
	end )
	paintjob:linkToElementModel( self, "paintjobIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjob.drawPaintjobLeftView:setupPaintjobIndex( modelValue )
		end
	end )
	paintjob.buttonPromptAddFunctions = {}
	paintjob.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 32 ) and not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 64 ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE" ), "A", element )
			return true
		else
			
		end
	end
	
	paintjob:linkToElementModel( paintjob, "paintjobIndex", true, function ( model )
		local element = paintjob
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobIndex"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	paintjob:linkToElementModel( paintjob, "paintjobSlot", true, function ( model )
		local element = paintjob
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobSlot"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	paintjob:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_OpenPaintjobSelector( self, element, controller )
		NavigateToMenu( self, "GunsmithPaintjobSelect", true, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	paintjob:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 32 ) and not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 64 ) then
				Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	paintjob:registerEventHandler( "gain_focus", function ( element, event )
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
	paintjob:registerEventHandler( "lose_focus", function ( element, event )
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
	paintjob:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", -1 )
			end
		}
	} )
	paintjob:linkToElementModel( paintjob, "paintjobSlot", true, function ( model )
		menu:updateElementState( paintjob, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobSlot"
		} )
	end )
	self:addElement( paintjob )
	self.paintjob = paintjob
	
	Optic.navigation = {
		right = Attachment1
	}
	Attachment1.navigation = {
		left = Optic,
		right = Attachment2
	}
	Attachment2.navigation = {
		left = Attachment1,
		right = Attachment3
	}
	Attachment3.navigation = {
		left = Attachment2,
		right = Attachment4
	}
	Attachment4.navigation = {
		left = Attachment3,
		right = Attachment5
	}
	Attachment5.navigation = {
		left = Attachment4,
		right = paintjob
	}
	Camo.navigation = {
		left = paintjob
	}
	paintjob.navigation = {
		left = Attachment5,
		right = Camo
	}
	Optic.id = "Optic"
	Attachment1.id = "Attachment1"
	Attachment2.id = "Attachment2"
	Attachment3.id = "Attachment3"
	Attachment4.id = "Attachment4"
	Attachment5.id = "Attachment5"
	Camo.id = "Camo"
	paintjob.id = "paintjob"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Optic:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.OpticsHeader:close()
		self.AttachmentsHeader:close()
		self.Optic:close()
		self.Attachment1:close()
		self.Attachment2:close()
		self.Attachment3:close()
		self.Attachment4:close()
		self.Attachment5:close()
		self.Camo:close()
		self.PaintjobHeader:close()
		self.CamoHeader:close()
		self.paintjob:close()
		CoD.GunsmithVariantAttachments.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

