require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentButton" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithAttachmentSelect" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithPaintjobButton" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithPaintjobSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCamoSelect" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantAttachmentHeader" )

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
	
	local Optic = CoD.GunsmithAttachmentButton.new( menu, controller )
	Optic:setLeftRight( true, false, 0, 64 )
	Optic:setTopBottom( true, false, 24, 88 )
	Optic.opticIndicator:setAlpha( 0.41 )
	Optic:linkToElementModel( self, nil, false, function ( model )
		Optic:setModel( model, controller )
	end )
	Optic:linkToElementModel( self, "attachment1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Optic.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "1", modelValue ) ) )
		end
	end )
	Optic:linkToElementModel( Optic, "attachment1", true, function ( model )
		local element = Optic
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment1"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Optic:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearAttachmentSlot( self, element, "1", controller )
		EnableMouseButtonOnElement( element, controller )
		if not retVal then
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
		Gunsmith_SetSelectedItemName( self, element, "optic", "1", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	Optic:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Optic, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "optic", "1", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Optic, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "1", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) then
			return true
		else
			return false
		end
	end, true )
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
	Attachment1:linkToElementModel( self, nil, false, function ( model )
		Attachment1:setModel( model, controller )
	end )
	Attachment1:linkToElementModel( self, "attachment2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment1.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "2", modelValue ) ) )
		end
	end )
	Attachment1:linkToElementModel( Attachment1, "attachment2", true, function ( model )
		local element = Attachment1
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment2"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Attachment1:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearAttachmentSlot( self, element, "2", controller )
		EnableMouseButtonOnElement( element, controller )
		if not retVal then
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
		Gunsmith_SetSelectedItemName( self, element, "attachment", "2", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	Attachment1:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Attachment1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "2", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "2", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			return true
		else
			return false
		end
	end, true )
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
	Attachment2:linkToElementModel( self, nil, false, function ( model )
		Attachment2:setModel( model, controller )
	end )
	Attachment2:linkToElementModel( self, "attachment3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment2.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "3", modelValue ) ) )
		end
	end )
	Attachment2:linkToElementModel( Attachment2, "attachment3", true, function ( model )
		local element = Attachment2
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment3"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Attachment2:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearAttachmentSlot( self, element, "3", controller )
		EnableMouseButtonOnElement( element, controller )
		if not retVal then
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
		Gunsmith_SetSelectedItemName( self, element, "attachment", "3", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	Attachment2:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Attachment2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "3", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment2, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "3", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			return true
		else
			return false
		end
	end, true )
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
	Attachment3:linkToElementModel( self, nil, false, function ( model )
		Attachment3:setModel( model, controller )
	end )
	Attachment3:linkToElementModel( self, "attachment4", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment3.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "4", modelValue ) ) )
		end
	end )
	Attachment3:linkToElementModel( Attachment3, "attachment4", true, function ( model )
		local element = Attachment3
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment4"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Attachment3:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearAttachmentSlot( self, element, "4", controller )
		EnableMouseButtonOnElement( element, controller )
		if not retVal then
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
		Gunsmith_SetSelectedItemName( self, element, "attachment", "4", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	Attachment3:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Attachment3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "4", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment3, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "4", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			return true
		else
			return false
		end
	end, true )
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
	Attachment4:linkToElementModel( self, nil, false, function ( model )
		Attachment4:setModel( model, controller )
	end )
	Attachment4:linkToElementModel( self, "attachment5", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment4.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "5", modelValue ) ) )
		end
	end )
	Attachment4:linkToElementModel( Attachment4, "attachment5", true, function ( model )
		local element = Attachment4
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment5"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Attachment4:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearAttachmentSlot( self, element, "5", controller )
		EnableMouseButtonOnElement( element, controller )
		if not retVal then
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
		Gunsmith_SetSelectedItemName( self, element, "attachment", "5", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	Attachment4:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Attachment4, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "5", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment4, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "5", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			return true
		else
			return false
		end
	end, true )
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
	Attachment5:linkToElementModel( self, nil, false, function ( model )
		Attachment5:setModel( model, controller )
	end )
	Attachment5:linkToElementModel( self, "attachment6", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment5.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "6", modelValue ) ) )
		end
	end )
	Attachment5:linkToElementModel( Attachment5, "attachment6", true, function ( model )
		local element = Attachment5
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment6"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Attachment5:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearAttachmentSlot( self, element, "6", controller )
		EnableMouseButtonOnElement( element, controller )
		if not retVal then
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
		Gunsmith_SetSelectedItemName( self, element, "attachment", "6", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	Attachment5:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Attachment5, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "6", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment5, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "6", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			return true
		else
			return false
		end
	end, false )
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
	
	local paintjob = CoD.GunsmithPaintjobButton.new( menu, controller )
	paintjob:setLeftRight( true, false, 501.77, 565.77 )
	paintjob:setTopBottom( true, false, 24, 88 )
	paintjob:linkToElementModel( self, nil, false, function ( model )
		paintjob:setModel( model, controller )
	end )
	paintjob:linkToElementModel( paintjob, "paintjobIndex", true, function ( model )
		local element = paintjob
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	paintjob:linkToElementModel( paintjob, "paintjobSlot", true, function ( model )
		local element = paintjob
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobSlot"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	paintjob:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
		if not retVal then
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
		Gunsmith_SetSelectedItemName( self, element, "paintjob", "", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	paintjob:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( paintjob, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_OpenPaintjobSelector( self, element, controller )
		NavigateToMenu( self, "GunsmithPaintjobSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( paintjob, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 ) and not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
			Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 ) and not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
			return true
		else
			return false
		end
	end, false )
	paintjob:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f84_local0
				if not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
					f84_local0 = not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 )
				else
					f84_local0 = false
				end
				return f84_local0
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
	paintjob:linkToElementModel( paintjob, "paintjobIndex", true, function ( model )
		menu:updateElementState( paintjob, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobIndex"
		} )
	end )
	self:addElement( paintjob )
	self.paintjob = paintjob
	
	local Camo = CoD.GunsmithAttachmentButton.new( menu, controller )
	Camo:setLeftRight( true, false, 611.44, 675.44 )
	Camo:setTopBottom( true, false, 24, 88 )
	Camo:linkToElementModel( self, nil, false, function ( model )
		Camo:setModel( model, controller )
	end )
	Camo:linkToElementModel( self, "camoIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Camo.attachmentImage:setImage( RegisterImage( GetCamoImageFromIndex( controller, modelValue ) ) )
		end
	end )
	Camo:linkToElementModel( Camo, "camoIndex", true, function ( model )
		local element = Camo
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "camoIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Camo:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local retVal = nil
		Gunsmith_ClearCamo( self, element, controller )
		EnableMouseButtonOnElement( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Camo:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "camo", "", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	Camo:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Camo, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponCamoModel( self, element, controller )
		NavigateToMenu( self, "GunsmithCamoSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Camo, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "camoIndex", 0 ) then
			Gunsmith_ClearCamo( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if IsSelfModelValueGreaterThan( element, controller, "camoIndex", 0 ) then
			return true
		else
			return false
		end
	end, true )
	Camo:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "camoIndex", 0 )
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
	
	local OpticsHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
	OpticsHeader:setLeftRight( true, false, 1, 109 )
	OpticsHeader:setTopBottom( true, false, 0, 17 )
	OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	OpticsHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		OpticsHeader:setModel( model, controller )
	end )
	OpticsHeader:mergeStateConditions( {
		{
			stateName = "Focus",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "attachmentType", "optic" )
			end
		},
		{
			stateName = "NotFocus",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachmentType", "optic" )
			end
		}
	} )
	OpticsHeader:linkToElementModel( OpticsHeader, "attachmentType", true, function ( model )
		menu:updateElementState( OpticsHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachmentType"
		} )
	end )
	self:addElement( OpticsHeader )
	self.OpticsHeader = OpticsHeader
	
	local AttachmentsHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
	AttachmentsHeader:setLeftRight( true, false, 111.67, 313.67 )
	AttachmentsHeader:setTopBottom( true, false, 0, 17 )
	AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	AttachmentsHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		AttachmentsHeader:setModel( model, controller )
	end )
	AttachmentsHeader:mergeStateConditions( {
		{
			stateName = "Focus",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "attachmentType", "attachment" )
			end
		},
		{
			stateName = "NotFocus",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachmentType", "attachment" )
			end
		}
	} )
	AttachmentsHeader:linkToElementModel( AttachmentsHeader, "attachmentType", true, function ( model )
		menu:updateElementState( AttachmentsHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachmentType"
		} )
	end )
	self:addElement( AttachmentsHeader )
	self.AttachmentsHeader = AttachmentsHeader
	
	local PaintjobHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
	PaintjobHeader:setLeftRight( true, false, 501.77, 609.77 )
	PaintjobHeader:setTopBottom( true, false, 0, 17 )
	PaintjobHeader.text:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
	PaintjobHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		PaintjobHeader:setModel( model, controller )
	end )
	PaintjobHeader:mergeStateConditions( {
		{
			stateName = "Focus",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "attachmentType", "paintjob" )
			end
		},
		{
			stateName = "NotFocus",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachmentType", "paintjob" )
			end
		}
	} )
	PaintjobHeader:linkToElementModel( PaintjobHeader, "attachmentType", true, function ( model )
		menu:updateElementState( PaintjobHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachmentType"
		} )
	end )
	self:addElement( PaintjobHeader )
	self.PaintjobHeader = PaintjobHeader
	
	local CamoHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
	CamoHeader:setLeftRight( true, false, 609.77, 700 )
	CamoHeader:setTopBottom( true, false, 0, 17 )
	CamoHeader.text:setText( Engine.Localize( "MPUI_CAMO_CAPS" ) )
	CamoHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		CamoHeader:setModel( model, controller )
	end )
	CamoHeader:mergeStateConditions( {
		{
			stateName = "Focus",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "attachmentType", "camo" )
			end
		},
		{
			stateName = "NotFocus",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachmentType", "camo" )
			end
		}
	} )
	CamoHeader:linkToElementModel( CamoHeader, "attachmentType", true, function ( model )
		menu:updateElementState( CamoHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachmentType"
		} )
	end )
	self:addElement( CamoHeader )
	self.CamoHeader = CamoHeader
	
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
	paintjob.navigation = {
		left = Attachment5,
		right = Camo
	}
	Camo.navigation = {
		left = paintjob
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Optic:completeAnimation()
				self.Optic:setLeftRight( true, false, 0, 64 )
				self.Optic:setTopBottom( true, false, 24, 88 )
				self.Optic:setAlpha( 1 )
				self.clipFinished( Optic, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setLeftRight( true, false, 111.67, 175.67 )
				self.Attachment1:setTopBottom( true, false, 24, 88 )
				self.Attachment1:setAlpha( 1 )
				self.clipFinished( Attachment1, {} )
				Attachment2:completeAnimation()
				self.Attachment2:setLeftRight( true, false, 180.67, 244.67 )
				self.Attachment2:setTopBottom( true, false, 24, 88 )
				self.Attachment2:setAlpha( 1 )
				self.clipFinished( Attachment2, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setLeftRight( true, false, 249.67, 313.67 )
				self.Attachment3:setTopBottom( true, false, 24, 88 )
				self.Attachment3:setAlpha( 1 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setLeftRight( true, false, 320.1, 384.1 )
				self.Attachment4:setTopBottom( true, false, 24, 88 )
				self.Attachment4:setAlpha( 1 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setLeftRight( true, false, 389.1, 453.1 )
				self.Attachment5:setTopBottom( true, false, 24, 88 )
				self.Attachment5:setAlpha( 1 )
				self.clipFinished( Attachment5, {} )
				paintjob:completeAnimation()
				self.paintjob:setLeftRight( true, false, 501.77, 565.77 )
				self.paintjob:setTopBottom( true, false, 24, 88 )
				self.paintjob:setAlpha( 1 )
				self.clipFinished( paintjob, {} )
				Camo:completeAnimation()
				self.Camo:setLeftRight( true, false, 611.44, 675.44 )
				self.Camo:setTopBottom( true, false, 24, 88 )
				self.Camo:setAlpha( 1 )
				self.clipFinished( Camo, {} )
			end
		},
		SpecialWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				Optic:completeAnimation()
				self.Optic:setAlpha( 0 )
				self.clipFinished( Optic, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setAlpha( 0 )
				self.clipFinished( Attachment1, {} )
				Attachment2:completeAnimation()
				self.Attachment2:setAlpha( 0 )
				self.clipFinished( Attachment2, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setAlpha( 0 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setAlpha( 0 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setAlpha( 0 )
				self.clipFinished( Attachment5, {} )
				paintjob:completeAnimation()
				self.paintjob:setLeftRight( true, false, 1, 65 )
				self.paintjob:setTopBottom( true, false, 24, 88 )
				self.paintjob:setAlpha( 1 )
				self.clipFinished( paintjob, {} )
				Camo:completeAnimation()
				self.Camo:setLeftRight( true, false, 110.67, 174.67 )
				self.Camo:setTopBottom( true, false, 24, 88 )
				self.Camo:setAlpha( 1 )
				self.clipFinished( Camo, {} )
				OpticsHeader:completeAnimation()
				OpticsHeader.text:completeAnimation()
				self.OpticsHeader:setAlpha( 0 )
				self.OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
				self.clipFinished( OpticsHeader, {} )
				AttachmentsHeader:completeAnimation()
				AttachmentsHeader.text:completeAnimation()
				self.AttachmentsHeader:setAlpha( 0 )
				self.AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
				self.clipFinished( AttachmentsHeader, {} )
				PaintjobHeader:completeAnimation()
				PaintjobHeader.text:completeAnimation()
				self.PaintjobHeader:setLeftRight( true, false, 1, 109 )
				self.PaintjobHeader:setTopBottom( true, false, 0, 17 )
				self.PaintjobHeader:setAlpha( 1 )
				self.PaintjobHeader.text:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
				self.clipFinished( PaintjobHeader, {} )
				CamoHeader:completeAnimation()
				CamoHeader.text:completeAnimation()
				self.CamoHeader:setLeftRight( true, false, 111.67, 201.9 )
				self.CamoHeader:setTopBottom( true, false, 0, 17 )
				self.CamoHeader:setAlpha( 1 )
				self.CamoHeader.text:setText( Engine.Localize( "MPUI_CAMO_CAPS" ) )
				self.clipFinished( CamoHeader, {} )
			end
		},
		Handguns = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				Optic:completeAnimation()
				self.Optic:setLeftRight( true, false, 0, 64 )
				self.Optic:setTopBottom( true, false, 24, 88 )
				self.Optic:setAlpha( 1 )
				self.clipFinished( Optic, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setLeftRight( true, false, 111.67, 175.67 )
				self.Attachment1:setTopBottom( true, false, 24, 88 )
				self.Attachment1:setAlpha( 1 )
				self.clipFinished( Attachment1, {} )
				Attachment2:completeAnimation()
				self.Attachment2:setLeftRight( true, false, 180.67, 244.67 )
				self.Attachment2:setTopBottom( true, false, 24, 88 )
				self.Attachment2:setAlpha( 1 )
				self.clipFinished( Attachment2, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setLeftRight( true, false, 249.67, 313.67 )
				self.Attachment3:setTopBottom( true, false, 24, 88 )
				self.Attachment3:setAlpha( 0 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setLeftRight( true, false, 320.1, 384.1 )
				self.Attachment4:setTopBottom( true, false, 24, 88 )
				self.Attachment4:setAlpha( 0 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setLeftRight( true, false, 389.1, 453.1 )
				self.Attachment5:setTopBottom( true, false, 24, 88 )
				self.Attachment5:setAlpha( 0 )
				self.clipFinished( Attachment5, {} )
				paintjob:completeAnimation()
				self.paintjob:setLeftRight( true, false, 294.1, 358.1 )
				self.paintjob:setTopBottom( true, false, 24, 88 )
				self.paintjob:setAlpha( 1 )
				self.clipFinished( paintjob, {} )
				Camo:completeAnimation()
				self.Camo:setLeftRight( true, false, 402.1, 466.1 )
				self.Camo:setTopBottom( true, false, 24, 88 )
				self.Camo:setAlpha( 1 )
				self.clipFinished( Camo, {} )
				OpticsHeader:completeAnimation()
				OpticsHeader.text:completeAnimation()
				self.OpticsHeader:setLeftRight( true, false, 1, 109 )
				self.OpticsHeader:setTopBottom( true, false, 0, 17 )
				self.OpticsHeader:setAlpha( 1 )
				self.OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
				self.clipFinished( OpticsHeader, {} )
				AttachmentsHeader:completeAnimation()
				AttachmentsHeader.text:completeAnimation()
				self.AttachmentsHeader:setLeftRight( true, false, 111.67, 313.67 )
				self.AttachmentsHeader:setTopBottom( true, false, 0, 17 )
				self.AttachmentsHeader:setAlpha( 1 )
				self.AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
				self.clipFinished( AttachmentsHeader, {} )
				PaintjobHeader:completeAnimation()
				PaintjobHeader.text:completeAnimation()
				self.PaintjobHeader:setLeftRight( true, false, 294.1, 402.1 )
				self.PaintjobHeader:setTopBottom( true, false, 0, 17 )
				self.PaintjobHeader:setAlpha( 1 )
				self.PaintjobHeader.text:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
				self.clipFinished( PaintjobHeader, {} )
				CamoHeader:completeAnimation()
				CamoHeader.text:completeAnimation()
				self.CamoHeader:setLeftRight( true, false, 402.1, 492.33 )
				self.CamoHeader:setTopBottom( true, false, 0, 17 )
				self.CamoHeader:setAlpha( 1 )
				self.CamoHeader.text:setText( Engine.Localize( "MPUI_CAMO_CAPS" ) )
				self.clipFinished( CamoHeader, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "SpecialWeapon" ) then
			MakeElementNotFocusable( self, "Attachment1", controller )
			MakeElementNotFocusable( self, "Attachment2", controller )
			MakeElementNotFocusable( self, "Attachment3", controller )
			MakeElementNotFocusable( self, "Attachment4", controller )
			MakeElementNotFocusable( self, "Attachment5", controller )
			MakeElementNotFocusable( self, "Optic", controller )
		elseif IsElementInState( element, "DefaultState" ) then
			
		elseif IsElementInState( element, "Handguns" ) then
			MakeElementNotFocusable( self, "Attachment3", controller )
			MakeElementNotFocusable( self, "Attachment4", controller )
			MakeElementNotFocusable( self, "Attachment5", controller )
		end
	end )
	Optic.id = "Optic"
	Attachment1.id = "Attachment1"
	Attachment2.id = "Attachment2"
	Attachment3.id = "Attachment3"
	Attachment4.id = "Attachment4"
	Attachment5.id = "Attachment5"
	paintjob.id = "paintjob"
	Camo.id = "Camo"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Optic:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Optic:close()
		self.Attachment1:close()
		self.Attachment2:close()
		self.Attachment3:close()
		self.Attachment4:close()
		self.Attachment5:close()
		self.paintjob:close()
		self.Camo:close()
		self.OpticsHeader:close()
		self.AttachmentsHeader:close()
		self.PaintjobHeader:close()
		self.CamoHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

