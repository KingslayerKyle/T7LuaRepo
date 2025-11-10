require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentButton" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithAttachmentSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithReticleSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithAttachmentVariantSelect" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithPaintjobButton" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithPaintjobSelect" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCamoSelect" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantAttachmentHeader" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithSnapshot" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.snapshot.removeButton:close()
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

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
	self:setLeftRight( true, false, 0, 857 )
	self:setTopBottom( true, false, 0, 93 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Optic = CoD.GunsmithAttachmentButton.new( menu, controller )
	Optic:setLeftRight( true, false, 0, 64 )
	Optic:setTopBottom( true, false, 23, 87 )
	Optic.opticIndicator:setAlpha( 0.41 )
	Optic:linkToElementModel( self, nil, false, function ( model )
		Optic:setModel( model, controller )
	end )
	Optic:linkToElementModel( self, "attachment1", true, function ( model )
		local attachment1 = Engine.GetModelValue( model )
		if attachment1 then
			Optic.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "1", attachment1 ) ) )
		end
	end )
	Optic:linkToElementModel( Optic, "attachment1", true, function ( model )
		local f6_local0 = Optic
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment1"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Optic:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f7_local0 = nil
		Gunsmith_ClearAttachmentSlot( self, element, "1", controller )
		EnableMouseButtonOnElement( element, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	Optic:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "optic", "1", controller )
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f8_local0
	end )
	Optic:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( Optic, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "optic", "1", "false", controller )
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
	menu:AddButtonCallbackFunction( Optic, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) and IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" ) then
			Gunsmith_SetWeaponReticleModel( self, element, controller )
			NavigateToMenu( self, "GunsmithReticleSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment1", 0 ) and IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" ) then
			return false
		else
			return false
		end
	end, false )
	Optic:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 ) then
					f16_local0 = IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" )
				else
					f16_local0 = false
				end
				return f16_local0
			end
		},
		{
			stateName = "IsEquippedAndHideHintText",
			condition = function ( menu, element, event )
				local f17_local0
				if not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 ) then
					f17_local0 = not IsGunsmithReticleAllowedForOptic( menu, element, controller, "attachment1" )
				else
					f17_local0 = false
				end
				return f17_local0
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
		local attachment2 = Engine.GetModelValue( model )
		if attachment2 then
			Attachment1.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "2", attachment2 ) ) )
		end
	end )
	Attachment1:linkToElementModel( Attachment1, "attachment2", true, function ( model )
		local f21_local0 = Attachment1
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment2"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Attachment1:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f22_local0 = nil
		Gunsmith_ClearAttachmentSlot( self, element, "2", controller )
		EnableMouseButtonOnElement( element, controller )
		if not f22_local0 then
			f22_local0 = element:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	Attachment1:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "attachment", "2", controller )
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f23_local0
	end )
	Attachment1:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		return f24_local0
	end )
	menu:AddButtonCallbackFunction( Attachment1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "2", "false", controller )
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
	menu:AddButtonCallbackFunction( Attachment1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment2", 0 ) then
			return false
		else
			return false
		end
	end, false )
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
		local attachment3 = Engine.GetModelValue( model )
		if attachment3 then
			Attachment2.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "3", attachment3 ) ) )
		end
	end )
	Attachment2:linkToElementModel( Attachment2, "attachment3", true, function ( model )
		local f35_local0 = Attachment2
		local f35_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment3"
		}
		CoD.Menu.UpdateButtonShownState( f35_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f35_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Attachment2:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f36_local0 = nil
		Gunsmith_ClearAttachmentSlot( self, element, "3", controller )
		EnableMouseButtonOnElement( element, controller )
		if not f36_local0 then
			f36_local0 = element:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	Attachment2:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "attachment", "3", controller )
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f37_local0
	end )
	Attachment2:registerEventHandler( "lose_focus", function ( element, event )
		local f38_local0 = nil
		if element.loseFocus then
			f38_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f38_local0 = element.super:loseFocus( event )
		end
		return f38_local0
	end )
	menu:AddButtonCallbackFunction( Attachment2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "3", "false", controller )
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
	menu:AddButtonCallbackFunction( Attachment2, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment3", 0 ) then
			return false
		else
			return false
		end
	end, false )
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
		local attachment4 = Engine.GetModelValue( model )
		if attachment4 then
			Attachment3.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "4", attachment4 ) ) )
		end
	end )
	Attachment3:linkToElementModel( Attachment3, "attachment4", true, function ( model )
		local f49_local0 = Attachment3
		local f49_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment4"
		}
		CoD.Menu.UpdateButtonShownState( f49_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f49_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Attachment3:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f50_local0 = nil
		Gunsmith_ClearAttachmentSlot( self, element, "4", controller )
		EnableMouseButtonOnElement( element, controller )
		if not f50_local0 then
			f50_local0 = element:dispatchEventToChildren( event )
		end
		return f50_local0
	end )
	Attachment3:registerEventHandler( "gain_focus", function ( element, event )
		local f51_local0 = nil
		if element.gainFocus then
			f51_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f51_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "attachment", "4", controller )
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f51_local0
	end )
	Attachment3:registerEventHandler( "lose_focus", function ( element, event )
		local f52_local0 = nil
		if element.loseFocus then
			f52_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f52_local0 = element.super:loseFocus( event )
		end
		return f52_local0
	end )
	menu:AddButtonCallbackFunction( Attachment3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "4", "false", controller )
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
	menu:AddButtonCallbackFunction( Attachment3, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment4", 0 ) then
			return false
		else
			return false
		end
	end, false )
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
		local attachment5 = Engine.GetModelValue( model )
		if attachment5 then
			Attachment4.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "5", attachment5 ) ) )
		end
	end )
	Attachment4:linkToElementModel( Attachment4, "attachment5", true, function ( model )
		local f63_local0 = Attachment4
		local f63_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment5"
		}
		CoD.Menu.UpdateButtonShownState( f63_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f63_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Attachment4:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f64_local0 = nil
		Gunsmith_ClearAttachmentSlot( self, element, "5", controller )
		EnableMouseButtonOnElement( element, controller )
		if not f64_local0 then
			f64_local0 = element:dispatchEventToChildren( event )
		end
		return f64_local0
	end )
	Attachment4:registerEventHandler( "gain_focus", function ( element, event )
		local f65_local0 = nil
		if element.gainFocus then
			f65_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f65_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "attachment", "5", controller )
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f65_local0
	end )
	Attachment4:registerEventHandler( "lose_focus", function ( element, event )
		local f66_local0 = nil
		if element.loseFocus then
			f66_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f66_local0 = element.super:loseFocus( event )
		end
		return f66_local0
	end )
	menu:AddButtonCallbackFunction( Attachment4, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "5", "false", controller )
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
	menu:AddButtonCallbackFunction( Attachment4, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment5", 0 ) then
			return false
		else
			return false
		end
	end, false )
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
		local attachment6 = Engine.GetModelValue( model )
		if attachment6 then
			Attachment5.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "6", attachment6 ) ) )
		end
	end )
	Attachment5:linkToElementModel( Attachment5, "attachment6", true, function ( model )
		local f77_local0 = Attachment5
		local f77_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment6"
		}
		CoD.Menu.UpdateButtonShownState( f77_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f77_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Attachment5:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f78_local0 = nil
		Gunsmith_ClearAttachmentSlot( self, element, "6", controller )
		EnableMouseButtonOnElement( element, controller )
		if not f78_local0 then
			f78_local0 = element:dispatchEventToChildren( event )
		end
		return f78_local0
	end )
	Attachment5:registerEventHandler( "gain_focus", function ( element, event )
		local f79_local0 = nil
		if element.gainFocus then
			f79_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f79_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "attachment", "6", controller )
		SetHintText( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f79_local0
	end )
	Attachment5:registerEventHandler( "lose_focus", function ( element, event )
		local f80_local0 = nil
		if element.loseFocus then
			f80_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f80_local0 = element.super:loseFocus( event )
		end
		return f80_local0
	end )
	menu:AddButtonCallbackFunction( Attachment5, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SetWeaponAttachmentType( self, element, "attachment", "6", "false", controller )
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
	menu:AddButtonCallbackFunction( Attachment5, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			NavigateToMenu( self, "GunsmithAttachmentVariantSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsSelfModelValueGreaterThan( element, controller, "attachment6", 0 ) then
			return false
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
		local f90_local0 = paintjob
		local f90_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobIndex"
		}
		CoD.Menu.UpdateButtonShownState( f90_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	paintjob:linkToElementModel( paintjob, "paintjobSlot", true, function ( model )
		local f91_local0 = paintjob
		local f91_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "paintjobSlot"
		}
		CoD.Menu.UpdateButtonShownState( f91_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	paintjob:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f92_local0 = nil
		Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
		EnableMouseButtonOnElement( element, controller )
		if not f92_local0 then
			f92_local0 = element:dispatchEventToChildren( event )
		end
		return f92_local0
	end )
	paintjob:registerEventHandler( "gain_focus", function ( element, event )
		local f93_local0 = nil
		if element.gainFocus then
			f93_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f93_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "paintjob", "", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f93_local0
	end )
	paintjob:registerEventHandler( "lose_focus", function ( element, event )
		local f94_local0 = nil
		if element.loseFocus then
			f94_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f94_local0 = element.super:loseFocus( event )
		end
		return f94_local0
	end )
	menu:AddButtonCallbackFunction( paintjob, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not Gunsmith_DisablePaintjobVariantSlot( element, controller ) then
			Gunsmith_OpenPaintjobSelector( self, element, controller )
			NavigateToMenu( self, "GunsmithPaintjobSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not Gunsmith_DisablePaintjobVariantSlot( element, controller ) then
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
				local f99_local0
				if not IsSelfModelValueEqualTo( element, controller, "paintjobSlot", 15 ) then
					f99_local0 = not IsSelfModelValueEqualTo( element, controller, "paintjobIndex", 15 )
				else
					f99_local0 = false
				end
				return f99_local0
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
	self:addElement( paintjob )
	self.paintjob = paintjob
	
	local Camo = CoD.GunsmithAttachmentButton.new( menu, controller )
	Camo:setLeftRight( true, false, 611.44, 675.44 )
	Camo:setTopBottom( true, false, 24, 88 )
	Camo:linkToElementModel( self, nil, false, function ( model )
		Camo:setModel( model, controller )
	end )
	Camo:linkToElementModel( self, "camoIndex", true, function ( model )
		local camoIndex = Engine.GetModelValue( model )
		if camoIndex then
			Camo.attachmentImage:setImage( RegisterImage( GetCamoImageFromIndex( controller, camoIndex ) ) )
		end
	end )
	Camo:linkToElementModel( Camo, "camoIndex", true, function ( model )
		local f105_local0 = Camo
		local f105_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "camoIndex"
		}
		CoD.Menu.UpdateButtonShownState( f105_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	Camo:registerEventHandler( "gunsmith_remove_item", function ( element, event )
		local f106_local0 = nil
		Gunsmith_ClearCamo( self, element, controller )
		EnableMouseButtonOnElement( element, controller )
		if not f106_local0 then
			f106_local0 = element:dispatchEventToChildren( event )
		end
		return f106_local0
	end )
	Camo:registerEventHandler( "gain_focus", function ( element, event )
		local f107_local0 = nil
		if element.gainFocus then
			f107_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f107_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "camo", "", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f107_local0
	end )
	Camo:registerEventHandler( "lose_focus", function ( element, event )
		local f108_local0 = nil
		if element.loseFocus then
			f108_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f108_local0 = element.super:loseFocus( event )
		end
		return f108_local0
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
	self:addElement( Camo )
	self.Camo = Camo
	
	local OpticsHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
	OpticsHeader:setLeftRight( true, false, 1, 64 )
	OpticsHeader:setTopBottom( true, false, 3, 20 )
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
	AttachmentsHeader:setLeftRight( true, false, 111.67, 453.1 )
	AttachmentsHeader:setTopBottom( true, false, 3, 20 )
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
	PaintjobHeader:setLeftRight( true, false, 501.77, 576.77 )
	PaintjobHeader:setTopBottom( true, false, 3, 20 )
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
	CamoHeader:setLeftRight( true, false, 609.77, 675.44 )
	CamoHeader:setTopBottom( true, false, 3, 20 )
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
	
	local snapshot = CoD.GunsmithAttachmentButton.new( menu, controller )
	snapshot:setLeftRight( true, false, 713.77, 777.77 )
	snapshot:setTopBottom( true, false, 24, 88 )
	snapshot.attachmentImage:setImage( RegisterImage( "uie_t7_menu_gunsmith_snapshot" ) )
	snapshot:linkToElementModel( self, nil, false, function ( model )
		snapshot:setModel( model, controller )
	end )
	snapshot:registerEventHandler( "gain_focus", function ( element, event )
		local f133_local0 = nil
		if element.gainFocus then
			f133_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f133_local0 = element.super:gainFocus( event )
		end
		Gunsmith_SetSelectedItemName( self, element, "snapshot", "", controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f133_local0
	end )
	snapshot:registerEventHandler( "lose_focus", function ( element, event )
		local f134_local0 = nil
		if element.loseFocus then
			f134_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f134_local0 = element.super:loseFocus( event )
		end
		return f134_local0
	end )
	menu:AddButtonCallbackFunction( snapshot, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "GunsmithSnapshot", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
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
	self:addElement( snapshot )
	self.snapshot = snapshot
	
	local snapshotHeader = CoD.GunsmithVariantAttachmentHeader.new( menu, controller )
	snapshotHeader:setLeftRight( true, false, 713.77, 829.44 )
	snapshotHeader:setTopBottom( true, false, 3, 20 )
	snapshotHeader.text:setText( Engine.Localize( "MENU_GUNSMITH_SNAPSHOT_CAPS" ) )
	snapshotHeader:subscribeToGlobalModel( controller, "GunsmithSelectedItemProperties", nil, function ( model )
		snapshotHeader:setModel( model, controller )
	end )
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
	self:addElement( snapshotHeader )
	self.snapshotHeader = snapshotHeader
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, -38.13, -2.13 )
	Pixel20:setTopBottom( true, false, 86, 90 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, -38.13, -2.13 )
	Pixel200:setTopBottom( true, false, 23, 27 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel201 = LUI.UIImage.new()
	Pixel201:setLeftRight( true, false, 780.87, 816.87 )
	Pixel201:setTopBottom( true, false, 86, 90 )
	Pixel201:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201 )
	self.Pixel201 = Pixel201
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( true, false, 780.87, 816.87 )
	Pixel2000:setTopBottom( true, false, 23, 27 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 94.87, 110.87 )
	Image000000:setTopBottom( true, false, 21, 29 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Image0000000 = LUI.UIImage.new()
	Image0000000:setLeftRight( true, false, 94.87, 110.87 )
	Image0000000:setTopBottom( true, false, 84, 92 )
	Image0000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000000 )
	self.Image0000000 = Image0000000
	
	local Image0000001 = LUI.UIImage.new()
	Image0000001:setLeftRight( true, false, 484.87, 500.87 )
	Image0000001:setTopBottom( true, false, 21, 29 )
	Image0000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000001 )
	self.Image0000001 = Image0000001
	
	local Image00000000 = LUI.UIImage.new()
	Image00000000:setLeftRight( true, false, 484.87, 500.87 )
	Image00000000:setTopBottom( true, false, 84, 92 )
	Image00000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000000 )
	self.Image00000000 = Image00000000
	
	local Image00000010 = LUI.UIImage.new()
	Image00000010:setLeftRight( true, false, 594.87, 610.87 )
	Image00000010:setTopBottom( true, false, 21, 29 )
	Image00000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000010 )
	self.Image00000010 = Image00000010
	
	local Image000000000 = LUI.UIImage.new()
	Image000000000:setLeftRight( true, false, 594.87, 610.87 )
	Image000000000:setTopBottom( true, false, 84, 92 )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
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
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( true, false, 715.44, 779.44 )
				self.snapshot:setTopBottom( true, false, 24, 88 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( true, false, 713.77, 829.44 )
				self.snapshotHeader:setTopBottom( true, false, 0, 17 )
				self.clipFinished( snapshotHeader, {} )
			end
		},
		SpecialWeapon = {
			DefaultClip = function ()
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
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( true, false, 218.38, 282.38 )
				self.snapshot:setTopBottom( true, false, 24, 88 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( true, false, 216.72, 332.38 )
				self.snapshotHeader:setTopBottom( true, false, 0, 17 )
				self.clipFinished( snapshotHeader, {} )
			end
		},
		Handguns = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
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
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( true, false, 512.44, 576.44 )
				self.snapshot:setTopBottom( true, false, 24, 88 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( true, false, 510.77, 626.44 )
				self.snapshotHeader:setTopBottom( true, false, 0, 17 )
				self.clipFinished( snapshotHeader, {} )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				OpticsHeader:completeAnimation()
				self.OpticsHeader:setLeftRight( true, false, 1, 64 )
				self.OpticsHeader:setTopBottom( true, false, 0, 17 )
				self.OpticsHeader:setAlpha( 1 )
				self.clipFinished( OpticsHeader, {} )
				AttachmentsHeader:completeAnimation()
				self.AttachmentsHeader:setLeftRight( true, false, 111.67, 453.1 )
				self.AttachmentsHeader:setTopBottom( true, false, 0, 17 )
				self.AttachmentsHeader:setAlpha( 1 )
				self.clipFinished( AttachmentsHeader, {} )
				PaintjobHeader:completeAnimation()
				self.PaintjobHeader:setLeftRight( true, false, 501.77, 565.77 )
				self.PaintjobHeader:setTopBottom( true, false, 0, 17 )
				self.PaintjobHeader:setAlpha( 1 )
				self.clipFinished( PaintjobHeader, {} )
				CamoHeader:completeAnimation()
				self.CamoHeader:setLeftRight( true, false, 611.44, 675.44 )
				self.CamoHeader:setTopBottom( true, false, 0, 17 )
				self.CamoHeader:setAlpha( 1 )
				self.clipFinished( CamoHeader, {} )
				snapshot:completeAnimation()
				self.snapshot:setLeftRight( true, false, 715.44, 779.44 )
				self.snapshot:setTopBottom( true, false, 24, 88 )
				self.clipFinished( snapshot, {} )
				snapshotHeader:completeAnimation()
				self.snapshotHeader:setLeftRight( true, false, 713.77, 829.44 )
				self.snapshotHeader:setTopBottom( true, false, 0, 17 )
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
				local f149_local0
				if not IsInGame() then
					f149_local0 = IsArabicSku()
				else
					f149_local0 = false
				end
				return f149_local0
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Optic:close()
		element.Attachment1:close()
		element.Attachment2:close()
		element.Attachment3:close()
		element.Attachment4:close()
		element.Attachment5:close()
		element.paintjob:close()
		element.Camo:close()
		element.OpticsHeader:close()
		element.AttachmentsHeader:close()
		element.PaintjobHeader:close()
		element.CamoHeader:close()
		element.snapshot:close()
		element.snapshotHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

