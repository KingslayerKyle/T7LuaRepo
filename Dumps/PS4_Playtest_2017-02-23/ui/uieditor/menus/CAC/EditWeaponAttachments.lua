require( "ui.uieditor.menus.CAC.PrimaryAttachmentSelect" )
require( "ui.uieditor.menus.CAC.PrimaryOpticSelect" )
require( "ui.uieditor.menus.CAC.SecondaryAttachmentSelect" )
require( "ui.uieditor.menus.CAC.SecondaryOpticSelect" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.editAttachmentButton" )

LUI.createMenu.EditWeaponAttachments = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EditWeaponAttachments" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditWeaponAttachments.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MPUI_EDIT_ATTACHMENTS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_EDIT_ATTACHMENTS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local attachments = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	attachments:makeFocusable()
	attachments:setLeftRight( 0, 0, 248, 328 )
	attachments:setTopBottom( 0, 0, 202, 877 )
	attachments:setZoom( 75 )
	attachments:setWidgetType( CoD.editAttachmentButton )
	attachments:setVerticalCount( 8 )
	attachments:setSpacing( 5 )
	attachments:setDataSource( "EquippedWeaponAttachments" )
	attachments:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetElementPropertyOnPerControllerTable( controller, "weaponCategory", element, "weaponSlot" )
		return retVal
	end )
	attachments:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	attachments:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( attachments, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsPerControllerTablePropertyValue( controller, "weaponSlot", "primary" ) and IsElementPropertyValue( element, "isOptic", true ) then
			SetPerControllerTableProperty( controller, "attachmentType", "optic" )
			NavigateToMenu( self, "PrimaryOpticSelect", true, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "weaponSlot", "primary" ) then
			SetPerControllerTableProperty( controller, "attachmentType", "attachment" )
			NavigateToMenu( self, "PrimaryAttachmentSelect", true, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "weaponSlot", "secondary" ) and IsElementPropertyValue( element, "isOptic", true ) then
			SetPerControllerTableProperty( controller, "attachmentType", "optic" )
			NavigateToMenu( self, "SecondaryOpticSelect", true, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "weaponSlot", "secondary" ) then
			SetPerControllerTableProperty( controller, "attachmentType", "attachment" )
			NavigateToMenu( self, "SecondaryAttachmentSelect", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPerControllerTablePropertyValue( controller, "weaponSlot", "primary" ) and IsElementPropertyValue( element, "isOptic", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CHANGE_ATTACHMENT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "weaponSlot", "primary" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CHANGE_ATTACHMENT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "weaponSlot", "secondary" ) and IsElementPropertyValue( element, "isOptic", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CHANGE_ATTACHMENT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "weaponSlot", "secondary" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CHANGE_ATTACHMENT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( attachments, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if IsCACSlotEquipped( menu, element, controller ) then
			RemoveItemFromClass( self, element, controller )
			UpdateDataSource( self, self.attachments, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsCACSlotEquipped( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		else
			return false
		end
	end, false )
	self:addElement( attachments )
	self.attachments = attachments
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	attachments.id = "attachments"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.attachments:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame0:close()
		self.attachments:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditWeaponAttachments.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	local element = self
	SendClientScriptMenuChangeNotify( controller, self, true )
	SetupWeaponAttachmentsMenuCamera( self, controller )
	return self
end

