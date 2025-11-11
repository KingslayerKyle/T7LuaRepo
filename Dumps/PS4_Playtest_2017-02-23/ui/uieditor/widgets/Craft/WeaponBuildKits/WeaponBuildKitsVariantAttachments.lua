require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithAttachmentVariantSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCamoSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithPaintjobSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithReticleSelect" )
require( "ui.uieditor.menus.Craft.WeaponBuildKits.WeaponBuildKitsAttachmentSelect" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithPaintjobButton" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsAttachmentButton" )

CoD.WeaponBuildKitsVariantAttachments = InheritFrom( LUI.UIElement )
CoD.WeaponBuildKitsVariantAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponBuildKitsVariantAttachments )
	self.id = "WeaponBuildKitsVariantAttachments"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1050 )
	self:setTopBottom( 0, 0, 0, 139 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local opticCategoryHeader = CoD.CategoryHeader.new( menu, controller )
	opticCategoryHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return Gunsmith_AnyOpticsNew( controller )
			end
		}
	} )
	opticCategoryHeader:setLeftRight( 0, 0, 2, 96 )
	opticCategoryHeader:setTopBottom( 0, 0, 0, 26 )
	opticCategoryHeader.header:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( opticCategoryHeader )
	self.opticCategoryHeader = opticCategoryHeader
	
	local attachCategoryHeader = CoD.CategoryHeader.new( menu, controller )
	attachCategoryHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return Gunsmith_AnyAttachmentsNew( controller )
			end
		}
	} )
	attachCategoryHeader:setLeftRight( 0, 1, 169, -371 )
	attachCategoryHeader:setTopBottom( 0, 0, 0, 26 )
	attachCategoryHeader.header:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	self:addElement( attachCategoryHeader )
	self.attachCategoryHeader = attachCategoryHeader
	
	local Optic = CoD.WeaponBuildKitsAttachmentButton.new( menu, controller )
	Optic:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 0 )
			end
		},
		{
			stateName = "IsEquippedNoHintText",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 ) then
					f6_local0 = not IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" )
				else
					f6_local0 = false
				end
				return f6_local0
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
	Optic:setLeftRight( 0, 0, 0, 96 )
	Optic:setTopBottom( 0, 0, 36, 132 )
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
	Optic:linkToElementModel( self, nil, false, function ( model )
		Optic.itemHintText:setModel( model, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "optic", "1", "true", controller )
		NavigateToMenu( self, "WeaponBuildKitsAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Optic, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "1", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Optic, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) and IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" ) then
			Gunsmith_SetWeaponReticleModel( self, element, controller )
			NavigateToMenu( self, "GunsmithReticleSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) and IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Optic )
	self.Optic = Optic
	
	local Attachment1 = CoD.WeaponBuildKitsAttachmentButton.new( menu, controller )
	Attachment1:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment2", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 1 )
			end
		},
		{
			stateName = "IsEquippedNoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	Attachment1:setLeftRight( 0, 0, 169, 265 )
	Attachment1:setTopBottom( 0, 0, 36, 132 )
	Attachment1:linkToElementModel( self, nil, false, function ( model )
		Attachment1:setModel( model, controller )
	end )
	Attachment1:linkToElementModel( self, "attachment2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment1.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "2", modelValue ) ) )
		end
	end )
	Attachment1:linkToElementModel( self, nil, false, function ( model )
		Attachment1.itemHintText:setModel( model, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "2", "true", controller )
		NavigateToMenu( self, "WeaponBuildKitsAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "2", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Attachment1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment1 )
	self.Attachment1 = Attachment1
	
	local Attachment2 = CoD.WeaponBuildKitsAttachmentButton.new( menu, controller )
	Attachment2:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment3", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 2 )
			end
		},
		{
			stateName = "IsEquippedNoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	Attachment2:setLeftRight( 0, 0, 271, 367 )
	Attachment2:setTopBottom( 0, 0, 36, 132 )
	Attachment2:linkToElementModel( self, nil, false, function ( model )
		Attachment2:setModel( model, controller )
	end )
	Attachment2:linkToElementModel( self, "attachment3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment2.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "3", modelValue ) ) )
		end
	end )
	Attachment2:linkToElementModel( self, nil, false, function ( model )
		Attachment2.itemHintText:setModel( model, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "3", "true", controller )
		NavigateToMenu( self, "WeaponBuildKitsAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment2, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "3", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Attachment2, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment2 )
	self.Attachment2 = Attachment2
	
	local Attachment3 = CoD.WeaponBuildKitsAttachmentButton.new( menu, controller )
	Attachment3:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment4", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 3 )
			end
		},
		{
			stateName = "IsEquippedNoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	Attachment3:setLeftRight( 0, 0, 375, 471 )
	Attachment3:setTopBottom( 0, 0, 36, 132 )
	Attachment3:linkToElementModel( self, nil, false, function ( model )
		Attachment3:setModel( model, controller )
	end )
	Attachment3:linkToElementModel( self, "attachment4", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment3.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "4", modelValue ) ) )
		end
	end )
	Attachment3:linkToElementModel( self, nil, false, function ( model )
		Attachment3.itemHintText:setModel( model, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "4", "true", controller )
		NavigateToMenu( self, "WeaponBuildKitsAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment3, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "4", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Attachment3, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment3 )
	self.Attachment3 = Attachment3
	
	local Attachment4 = CoD.WeaponBuildKitsAttachmentButton.new( menu, controller )
	Attachment4:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment5", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 4 )
			end
		},
		{
			stateName = "IsEquippedNoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	Attachment4:setLeftRight( 0, 0, 480, 576 )
	Attachment4:setTopBottom( 0, 0, 36, 132 )
	Attachment4:linkToElementModel( self, nil, false, function ( model )
		Attachment4:setModel( model, controller )
	end )
	Attachment4:linkToElementModel( self, "attachment5", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment4.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "5", modelValue ) ) )
		end
	end )
	Attachment4:linkToElementModel( self, nil, false, function ( model )
		Attachment4.itemHintText:setModel( model, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "5", "true", controller )
		NavigateToMenu( self, "WeaponBuildKitsAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment4, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "5", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Attachment4, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment4 )
	self.Attachment4 = Attachment4
	
	local Attachment5 = CoD.WeaponBuildKitsAttachmentButton.new( menu, controller )
	Attachment5:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment6", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 5 )
			end
		},
		{
			stateName = "IsEquippedNoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	Attachment5:setLeftRight( 0, 0, 584, 680 )
	Attachment5:setTopBottom( 0, 0, 36, 132 )
	Attachment5:linkToElementModel( self, nil, false, function ( model )
		Attachment5:setModel( model, controller )
	end )
	Attachment5:linkToElementModel( self, "attachment6", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Attachment5.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "6", modelValue ) ) )
		end
	end )
	Attachment5:linkToElementModel( self, nil, false, function ( model )
		Attachment5.itemHintText:setModel( model, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "6", "true", controller )
		NavigateToMenu( self, "WeaponBuildKitsAttachmentSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Attachment5, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			Gunsmith_ClearAttachmentSlot( self, element, "6", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Attachment5, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment5 )
	self.Attachment5 = Attachment5
	
	local paintjobCategoryHeader = CoD.CategoryHeader.new( menu, controller )
	paintjobCategoryHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	paintjobCategoryHeader:setLeftRight( 0, 0, 753, 870 )
	paintjobCategoryHeader:setTopBottom( 0, 0, 0, 26 )
	paintjobCategoryHeader.header:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
	self:addElement( paintjobCategoryHeader )
	self.paintjobCategoryHeader = paintjobCategoryHeader
	
	local camoCategoryHeader = CoD.CategoryHeader.new( menu, controller )
	camoCategoryHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return Gunsmith_AnyCamosNew( controller )
			end
		}
	} )
	camoCategoryHeader:setLeftRight( 0, 0, 917, 1013 )
	camoCategoryHeader:setTopBottom( 0, 0, 0, 26 )
	camoCategoryHeader.header:setText( Engine.Localize( "MPUI_CAMO_CAPS" ) )
	self:addElement( camoCategoryHeader )
	self.camoCategoryHeader = camoCategoryHeader
	
	local paintjob = CoD.GunsmithPaintjobButton.new( menu, controller )
	paintjob:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f108_local0
				if not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
					f108_local0 = not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 )
				else
					f108_local0 = false
				end
				return f108_local0
			end
		},
		{
			stateName = "NotVisibleOffline",
			condition = function ( menu, element, event )
				return ShouldHidePaintJobOptionInZM( menu, element, controller )
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
	paintjob:setLeftRight( 0, 0, 753, 849 )
	paintjob:setTopBottom( 0, 0, 36, 132 )
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
		if not ShouldHidePaintJobOptionInZM( menu, element, controller ) then
			Gunsmith_OpenPaintjobSelector( self, element, controller )
			NavigateToMenu( self, "GunsmithPaintjobSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not ShouldHidePaintJobOptionInZM( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( paintjob, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 ) and not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
			Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 ) and not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( paintjob )
	self.paintjob = paintjob
	
	local Camo = CoD.WeaponBuildKitsAttachmentButton.new( menu, controller )
	Camo:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "camoIndex", 0 )
			end
		},
		{
			stateName = "IsEquippedNoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	Camo:setLeftRight( 0, 0, 917, 1013 )
	Camo:setTopBottom( 0, 0, 36, 132 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Camo, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "camoIndex", 0 ) then
			Gunsmith_ClearCamo( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "camoIndex", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Camo )
	self.Camo = Camo
	
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
	self.resetProperties = function ()
		Attachment1:completeAnimation()
		attachCategoryHeader:completeAnimation()
		Optic:completeAnimation()
		Attachment2:completeAnimation()
		Attachment3:completeAnimation()
		Attachment4:completeAnimation()
		Attachment5:completeAnimation()
		Camo:completeAnimation()
		paintjob:completeAnimation()
		opticCategoryHeader:completeAnimation()
		paintjobCategoryHeader:completeAnimation()
		camoCategoryHeader:completeAnimation()
		Attachment1:setLeftRight( 0, 0, 169, 265 )
		Attachment1:setTopBottom( 0, 0, 36, 132 )
		Attachment1:setAlpha( 1 )
		attachCategoryHeader:setLeftRight( 0, 1, 169, -371 )
		attachCategoryHeader:setTopBottom( 0, 0, 0, 26 )
		attachCategoryHeader:setAlpha( 1 )
		Optic:setAlpha( 1 )
		Attachment2:setAlpha( 1 )
		Attachment3:setAlpha( 1 )
		Attachment4:setAlpha( 1 )
		Attachment5:setAlpha( 1 )
		Camo:setLeftRight( 0, 0, 917, 1013 )
		Camo:setTopBottom( 0, 0, 36, 132 )
		paintjob:setLeftRight( 0, 0, 753, 849 )
		paintjob:setTopBottom( 0, 0, 36, 132 )
		opticCategoryHeader:setAlpha( 1 )
		paintjobCategoryHeader:setLeftRight( 0, 0, 753, 870 )
		paintjobCategoryHeader:setTopBottom( 0, 0, 0, 26 )
		camoCategoryHeader:setLeftRight( 0, 0, 917, 1013 )
		camoCategoryHeader:setTopBottom( 0, 0, 0, 26 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				attachCategoryHeader:completeAnimation()
				self.attachCategoryHeader:setLeftRight( 0, 1, 169, -369 )
				self.attachCategoryHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( attachCategoryHeader, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setLeftRight( 0, 0, 168, 264 )
				self.Attachment1:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Attachment1, {} )
			end
		},
		SpecialWeapon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				opticCategoryHeader:completeAnimation()
				self.opticCategoryHeader:setAlpha( 0 )
				self.clipFinished( opticCategoryHeader, {} )
				attachCategoryHeader:completeAnimation()
				self.attachCategoryHeader:setAlpha( 0 )
				self.clipFinished( attachCategoryHeader, {} )
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
				paintjobCategoryHeader:completeAnimation()
				self.paintjobCategoryHeader:setLeftRight( 0, 0, 1, 118 )
				self.paintjobCategoryHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( paintjobCategoryHeader, {} )
				camoCategoryHeader:completeAnimation()
				self.camoCategoryHeader:setLeftRight( 0, 0, 166.5, 265.5 )
				self.camoCategoryHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( camoCategoryHeader, {} )
				paintjob:completeAnimation()
				self.paintjob:setLeftRight( 0, 0, 2, 98 )
				self.paintjob:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( paintjob, {} )
				Camo:completeAnimation()
				self.Camo:setLeftRight( 0, 0, 166, 262 )
				self.Camo:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Camo, {} )
			end
		},
		Handguns = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				attachCategoryHeader:completeAnimation()
				self.attachCategoryHeader:setLeftRight( 0, 1, 169, -683 )
				self.attachCategoryHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( attachCategoryHeader, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setLeftRight( 0, 0, 168, 264 )
				self.Attachment1:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Attachment1, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setAlpha( 0 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setAlpha( 0 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setAlpha( 0 )
				self.clipFinished( Attachment5, {} )
				paintjobCategoryHeader:completeAnimation()
				self.paintjobCategoryHeader:setLeftRight( 0, 0, 441, 558 )
				self.paintjobCategoryHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( paintjobCategoryHeader, {} )
				camoCategoryHeader:completeAnimation()
				self.camoCategoryHeader:setLeftRight( 0, 0, 603, 699 )
				self.camoCategoryHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( camoCategoryHeader, {} )
				paintjob:completeAnimation()
				self.paintjob:setLeftRight( 0, 0, 441, 537 )
				self.paintjob:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( paintjob, {} )
				Camo:completeAnimation()
				self.Camo:setLeftRight( 0, 0, 603, 699 )
				self.Camo:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Camo, {} )
			end
		},
		Snipers = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				attachCategoryHeader:completeAnimation()
				self.attachCategoryHeader:setLeftRight( 0, 1, 169, -473 )
				self.attachCategoryHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( attachCategoryHeader, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setLeftRight( 0, 0, 168, 264 )
				self.Attachment1:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Attachment1, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setAlpha( 0 )
				self.clipFinished( Attachment5, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SpecialWeapon",
			condition = function ( menu, element, event )
				return Gunsmith_IsSpecialWeapon( menu, element, controller )
			end
		},
		{
			stateName = "Handguns",
			condition = function ( menu, element, event )
				return Gunsmith_IsHandguns( menu, element, controller )
			end
		},
		{
			stateName = "Snipers",
			condition = function ( menu, element, event )
				return Gunsmith_IsSnipers( menu, element, controller )
			end
		}
	} )
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
		self.opticCategoryHeader:close()
		self.attachCategoryHeader:close()
		self.Optic:close()
		self.Attachment1:close()
		self.Attachment2:close()
		self.Attachment3:close()
		self.Attachment4:close()
		self.Attachment5:close()
		self.paintjobCategoryHeader:close()
		self.camoCategoryHeader:close()
		self.paintjob:close()
		self.Camo:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

