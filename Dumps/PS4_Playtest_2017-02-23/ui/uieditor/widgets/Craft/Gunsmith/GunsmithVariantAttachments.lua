require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithAttachmentSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithAttachmentVariantSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCamoSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithPaintjobSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithReticleSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithSnapshot" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentButton" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithPaintjobButton" )
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
	self:setLeftRight( 0, 0, 0, 1285 )
	self:setTopBottom( 0, 0, 0, 139 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Optic = CoD.GunsmithAttachmentButton.new( menu, controller )
	Optic:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 ) then
					f2_local0 = IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				local f3_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 ) then
					f3_local0 = not IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" )
				else
					f3_local0 = false
				end
				return f3_local0
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
	Optic:setTopBottom( 0, 0, 34, 130 )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "optic", "1", "false", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) then
			return true
		else
			return false
		end
	end, true )
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
	
	local Attachment1 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment1:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f17_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment2", 0 ) then
					f17_local0 = Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment2" )
				else
					f17_local0 = false
				end
				return f17_local0
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				return not Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment2" )
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
	Attachment1:setLeftRight( 0, 0, 168, 264 )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "2", "false", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( Attachment1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment2" ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment2" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment1 )
	self.Attachment1 = Attachment1
	
	local Attachment2 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment2:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f32_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment3", 0 ) then
					f32_local0 = Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment3" )
				else
					f32_local0 = false
				end
				return f32_local0
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				return not Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment3" )
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
		SetHintText( self, element, controller )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "3", "false", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( Attachment2, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment3" ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment3" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment2 )
	self.Attachment2 = Attachment2
	
	local Attachment3 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment3:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f47_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment4", 0 ) then
					f47_local0 = Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment4" )
				else
					f47_local0 = false
				end
				return f47_local0
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				return not Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment4" )
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
		SetHintText( self, element, controller )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "4", "false", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( Attachment3, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment4" ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment4" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment3 )
	self.Attachment3 = Attachment3
	
	local Attachment4 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment4:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f62_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment5", 0 ) then
					f62_local0 = Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment5" )
				else
					f62_local0 = false
				end
				return f62_local0
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				return not Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment5" )
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
		SetHintText( self, element, controller )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "5", "false", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( Attachment4, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment5" ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment5" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment4 )
	self.Attachment4 = Attachment4
	
	local Attachment5 = CoD.GunsmithAttachmentButton.new( menu, controller )
	Attachment5:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f77_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment6", 0 ) then
					f77_local0 = Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment6" )
				else
					f77_local0 = false
				end
				return f77_local0
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				return not Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment6" )
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
		SetHintText( self, element, controller )
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
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "6", "false", controller )
		NavigateToMenu( self, "GunsmithAttachmentSelect", true, controller )
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
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment6" ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) and Gunsmith_DoesACVExistForAttachment( menu, element, controller, "attachment6" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( Attachment5 )
	self.Attachment5 = Attachment5
	
	local paintjob = CoD.GunsmithPaintjobButton.new( menu, controller )
	paintjob:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f92_local0
				if not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
					f92_local0 = not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 )
				else
					f92_local0 = false
				end
				return f92_local0
			end
		},
		{
			stateName = "NotVisibleOffline",
			condition = function ( menu, element, event )
				return Gunsmith_DisablePaintjobVariantSlot( element, controller )
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
		if not Gunsmith_DisablePaintjobVariantSlot( element, controller ) then
			Gunsmith_OpenPaintjobSelector( self, element, controller )
			NavigateToMenu( self, "GunsmithPaintjobSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not Gunsmith_DisablePaintjobVariantSlot( element, controller ) then
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
	
	local Camo = CoD.GunsmithAttachmentButton.new( menu, controller )
	Camo:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", nil )
		if IsSelfModelValueGreaterThan( element, controller, "camoIndex", 0 ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( Camo )
	self.Camo = Camo
	
	local OpticsHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
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
	OpticsHeader:setLeftRight( 0, 0, 2, 96 )
	OpticsHeader:setTopBottom( 0, 0, 4, 30 )
	OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	OpticsHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		OpticsHeader:setModel( model, controller )
	end )
	self:addElement( OpticsHeader )
	self.OpticsHeader = OpticsHeader
	
	local AttachmentsHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
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
	AttachmentsHeader:setLeftRight( 0, 0, 168, 680 )
	AttachmentsHeader:setTopBottom( 0, 0, 4, 30 )
	AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	AttachmentsHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		AttachmentsHeader:setModel( model, controller )
	end )
	self:addElement( AttachmentsHeader )
	self.AttachmentsHeader = AttachmentsHeader
	
	local PaintjobHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
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
	PaintjobHeader:setLeftRight( 0, 0, 753, 865 )
	PaintjobHeader:setTopBottom( 0, 0, 4, 30 )
	PaintjobHeader.text:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
	PaintjobHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		PaintjobHeader:setModel( model, controller )
	end )
	self:addElement( PaintjobHeader )
	self.PaintjobHeader = PaintjobHeader
	
	local CamoHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
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
	CamoHeader:setLeftRight( 0, 0, 914, 1013 )
	CamoHeader:setTopBottom( 0, 0, 4, 30 )
	CamoHeader.text:setText( Engine.Localize( "MPUI_CAMO_CAPS" ) )
	CamoHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		CamoHeader:setModel( model, controller )
	end )
	self:addElement( CamoHeader )
	self.CamoHeader = CamoHeader
	
	local snapshot = CoD.GunsmithAttachmentButton.new( menu, controller )
	snapshot:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	snapshot:setLeftRight( 0, 0, 1071, 1167 )
	snapshot:setTopBottom( 0, 0, 36, 132 )
	snapshot.attachmentImage:setImage( RegisterImage( "t7_menu_gunsmith_snapshot" ) )
	snapshot:linkToElementModel( self, nil, false, function ( model )
		snapshot:setModel( model, controller )
	end )
	snapshot:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "snapshot", "", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	snapshot:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( snapshot, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "GunsmithSnapshot", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( snapshot )
	self.snapshot = snapshot
	
	local snapshotHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
	snapshotHeader:mergeStateConditions( {
		{
			stateName = "Focus",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "attachmentType", "snapshot" )
			end
		},
		{
			stateName = "NotFocus",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachmentType", "snapshot" )
			end
		}
	} )
	snapshotHeader:linkToElementModel( snapshotHeader, "attachmentType", true, function ( model )
		menu:updateElementState( snapshotHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachmentType"
		} )
	end )
	snapshotHeader:setLeftRight( 0, 0, 1070, 1244 )
	snapshotHeader:setTopBottom( 0, 0, 4, 30 )
	snapshotHeader.text:setText( Engine.Localize( "MENU_GUNSMITH_SNAPSHOT_CAPS" ) )
	snapshotHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		snapshotHeader:setModel( model, controller )
	end )
	self:addElement( snapshotHeader )
	self.snapshotHeader = snapshotHeader
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( 0, 0, -57, -3 )
	Pixel20:setTopBottom( 0, 0, 129, 135 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( 0, 0, -57, -3 )
	Pixel200:setTopBottom( 0, 0, 35, 41 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel201 = LUI.UIImage.new()
	Pixel201:setLeftRight( 0, 0, 1171, 1225 )
	Pixel201:setTopBottom( 0, 0, 129, 135 )
	Pixel201:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201 )
	self.Pixel201 = Pixel201
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( 0, 0, 1171, 1225 )
	Pixel2000:setTopBottom( 0, 0, 35, 41 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( 0, 0, 142, 166 )
	Image000000:setTopBottom( 0, 0, 32, 44 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Image0000000 = LUI.UIImage.new()
	Image0000000:setLeftRight( 0, 0, 142, 166 )
	Image0000000:setTopBottom( 0, 0, 126, 138 )
	Image0000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000000 )
	self.Image0000000 = Image0000000
	
	local Image0000001 = LUI.UIImage.new()
	Image0000001:setLeftRight( 0, 0, 727, 751 )
	Image0000001:setTopBottom( 0, 0, 32, 44 )
	Image0000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000001 )
	self.Image0000001 = Image0000001
	
	local Image00000000 = LUI.UIImage.new()
	Image00000000:setLeftRight( 0, 0, 727, 751 )
	Image00000000:setTopBottom( 0, 0, 126, 138 )
	Image00000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000000 )
	self.Image00000000 = Image00000000
	
	local Image00000010 = LUI.UIImage.new()
	Image00000010:setLeftRight( 0, 0, 892, 916 )
	Image00000010:setTopBottom( 0, 0, 32, 44 )
	Image00000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000010 )
	self.Image00000010 = Image00000010
	
	local Image000000000 = LUI.UIImage.new()
	Image000000000:setLeftRight( 0, 0, 892, 916 )
	Image000000000:setTopBottom( 0, 0, 126, 138 )
	Image000000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000000 )
	self.Image000000000 = Image000000000
	
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
		left = paintjob,
		right = snapshot
	}
	snapshot.navigation = {
		left = Camo
	}
	self.resetProperties = function ()
		Optic:completeAnimation()
		snapshotHeader:completeAnimation()
		snapshot:completeAnimation()
		Attachment1:completeAnimation()
		Attachment2:completeAnimation()
		Attachment3:completeAnimation()
		Attachment4:completeAnimation()
		Attachment5:completeAnimation()
		Camo:completeAnimation()
		paintjob:completeAnimation()
		OpticsHeader:completeAnimation()
		AttachmentsHeader:completeAnimation()
		PaintjobHeader:completeAnimation()
		CamoHeader:completeAnimation()
		Optic:setLeftRight( 0, 0, 0, 96 )
		Optic:setTopBottom( 0, 0, 34, 130 )
		Optic:setAlpha( 1 )
		snapshotHeader:setLeftRight( 0, 0, 1070, 1244 )
		snapshotHeader:setTopBottom( 0, 0, 4, 30 )
		snapshot:setLeftRight( 0, 0, 1071, 1167 )
		snapshot:setTopBottom( 0, 0, 36, 132 )
		Attachment1:setAlpha( 1 )
		Attachment2:setAlpha( 1 )
		Attachment3:setAlpha( 1 )
		Attachment4:setAlpha( 1 )
		Attachment5:setAlpha( 1 )
		Camo:setLeftRight( 0, 0, 917, 1013 )
		Camo:setTopBottom( 0, 0, 36, 132 )
		paintjob:setLeftRight( 0, 0, 753, 849 )
		paintjob:setTopBottom( 0, 0, 36, 132 )
		OpticsHeader:setLeftRight( 0, 0, 2, 96 )
		OpticsHeader:setTopBottom( 0, 0, 4, 30 )
		OpticsHeader:setAlpha( 1 )
		AttachmentsHeader:setLeftRight( 0, 0, 168, 680 )
		AttachmentsHeader:setTopBottom( 0, 0, 4, 30 )
		AttachmentsHeader:setAlpha( 1 )
		PaintjobHeader:setLeftRight( 0, 0, 753, 865 )
		PaintjobHeader:setTopBottom( 0, 0, 4, 30 )
		CamoHeader:setLeftRight( 0, 0, 914, 1013 )
		CamoHeader:setTopBottom( 0, 0, 4, 30 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Optic:completeAnimation()
				self.Optic:setLeftRight( 0, 0, 0, 96 )
				self.Optic:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Optic, {} )
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( 0, 0, 1073, 1169 )
				self.snapshot:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( 0, 0, 1070, 1244 )
				self.snapshotHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( snapshotHeader, {} )
			end
		},
		SpecialWeapon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
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
				self.paintjob:setLeftRight( 0, 0, 2, 98 )
				self.paintjob:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( paintjob, {} )
				Camo:completeAnimation()
				self.Camo:setLeftRight( 0, 0, 166, 262 )
				self.Camo:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Camo, {} )
				OpticsHeader:completeAnimation()
				self.OpticsHeader:setAlpha( 0 )
				self.clipFinished( OpticsHeader, {} )
				AttachmentsHeader:completeAnimation()
				self.AttachmentsHeader:setAlpha( 0 )
				self.clipFinished( AttachmentsHeader, {} )
				PaintjobHeader:completeAnimation()
				self.PaintjobHeader:setLeftRight( 0, 0, 2, 164 )
				self.PaintjobHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( PaintjobHeader, {} )
				CamoHeader:completeAnimation()
				self.CamoHeader:setLeftRight( 0, 0, 168, 303 )
				self.CamoHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( CamoHeader, {} )
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( 0, 0, 328, 424 )
				self.snapshot:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( 0, 0, 325, 499 )
				self.snapshotHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( snapshotHeader, {} )
			end
		},
		Handguns = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				Optic:completeAnimation()
				self.Optic:setLeftRight( 0, 0, 0, 96 )
				self.Optic:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Optic, {} )
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
				self.paintjob:setLeftRight( 0, 0, 441, 537 )
				self.paintjob:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( paintjob, {} )
				Camo:completeAnimation()
				self.Camo:setLeftRight( 0, 0, 603, 699 )
				self.Camo:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( Camo, {} )
				OpticsHeader:completeAnimation()
				self.OpticsHeader:setLeftRight( 0, 0, 1, 163 )
				self.OpticsHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( OpticsHeader, {} )
				AttachmentsHeader:completeAnimation()
				self.AttachmentsHeader:setLeftRight( 0, 0, 167.5, 470.5 )
				self.AttachmentsHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( AttachmentsHeader, {} )
				PaintjobHeader:completeAnimation()
				self.PaintjobHeader:setLeftRight( 0, 0, 441, 603 )
				self.PaintjobHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( PaintjobHeader, {} )
				CamoHeader:completeAnimation()
				self.CamoHeader:setLeftRight( 0, 0, 603, 738 )
				self.CamoHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( CamoHeader, {} )
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( 0, 0, 769, 865 )
				self.snapshot:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( 0, 0, 766, 940 )
				self.snapshotHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( snapshotHeader, {} )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				OpticsHeader:completeAnimation()
				self.OpticsHeader:setLeftRight( 0, 0, 2, 96 )
				self.OpticsHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( OpticsHeader, {} )
				AttachmentsHeader:completeAnimation()
				self.AttachmentsHeader:setLeftRight( 0, 0, 168, 680 )
				self.AttachmentsHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( AttachmentsHeader, {} )
				PaintjobHeader:completeAnimation()
				self.PaintjobHeader:setLeftRight( 0, 0, 753, 849 )
				self.PaintjobHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( PaintjobHeader, {} )
				CamoHeader:completeAnimation()
				self.CamoHeader:setLeftRight( 0, 0, 917.5, 1013.5 )
				self.CamoHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( CamoHeader, {} )
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( 0, 0, 1073, 1169 )
				self.snapshot:setTopBottom( 0, 0, 36, 132 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( 0, 0, 1070, 1244 )
				self.snapshotHeader:setTopBottom( 0, 0, 0, 26 )
				self.clipFinished( snapshotHeader, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SpecialWeapon",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Handguns",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "ArabicFrontEnd",
			condition = function ( menu, element, event )
				local f153_local0
				if not IsInGame() then
					f153_local0 = IsArabicSku()
				else
					f153_local0 = false
				end
				return f153_local0
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
	snapshot.id = "snapshot"
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
		self.snapshot:close()
		self.snapshotHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

