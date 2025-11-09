require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigUpgradeWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigUpgradeModelWidget" )

DataSources.TacRigUpgrades = {
	prepare = function ( controller, list, filter )
		local loadoutSlot = CoD.perController[controller].weaponCategory
		local classModel = CoD.perController[controller].classModel
		list.rigs = {}
		if loadoutSlot ~= "cybercom_tacrig1" and loadoutSlot ~= "cybercom_tacrig2" then
			return 
		end
		local itemRef = CoD.CACUtility.GetItemRefEquippedInSlot( loadoutSlot, controller, classModel )
		if not CoD.UnlockablesTable then
			CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
		end
		if CoD.UnlockablesTable then
			for index, model in ipairs( CoD.UnlockablesTable.cybercom_tacrig ) do
				local ref = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
				if ref and LUI.startswith( ref, itemRef ) then
					table.insert( list.rigs, model )
				end
			end
		end
	end,
	getCount = function ( list )
		return #list.rigs
	end,
	getItem = function ( controller, list, index )
		return list.rigs[index]
	end
}
local SetTitle = function ( self, controller )
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local tacRigName = CoD.CACUtility.GetItemName( loadoutSlot, controller, classModel )
	self.TacRigUpgradeWidget.UpgradeTitle:setText( Engine.Localize( tacRigName ) .. " Upgrades" )
end

local PostLoadFunc = function ( self, controller )
	SetTitle( self, controller )
end

LUI.createMenu.TacticalRigUpgrade = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TacticalRigUpgrade" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_LethalGrenade"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local TacRigUpgradeWidget = CoD.TacRigUpgradeWidget.new( self, controller )
	TacRigUpgradeWidget:setLeftRight( true, false, 0, 1280 )
	TacRigUpgradeWidget:setTopBottom( true, false, 0, 720 )
	TacRigUpgradeWidget:setRGB( 1, 1, 1 )
	TacRigUpgradeWidget.TacRigInfoWidget.PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "Install for 1 Fabrication Token" ) )
	TacRigUpgradeWidget.UpgradeTitle:setText( Engine.Localize( "" ) )
	TacRigUpgradeWidget.buttonPromptAddFunctions = {}
	TacRigUpgradeWidget.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
			return true
		else
			
		end
	end
	
	TacRigUpgradeWidget.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	TacRigUpgradeWidget:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") and element:isInFocus() then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") and element:isInFocus() then
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	TacRigUpgradeWidget:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.primary( self, element, event )
		element.buttonPromptAddFunctions.secondary( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	TacRigUpgradeWidget:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		self:removeButtonPrompt( "primary", element )
		self:removeButtonPrompt( "secondary", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( TacRigUpgradeWidget )
	self.TacRigUpgradeWidget = TacRigUpgradeWidget
	
	local TacRigUpgradeList = LUI.UIList.new( self, controller, 40, 0, nil, false, false, 0, 0, false, true )
	TacRigUpgradeList:makeFocusable()
	TacRigUpgradeList:setLeftRight( true, false, 193.4, 313.4 )
	TacRigUpgradeList:setTopBottom( true, false, 140, 580 )
	TacRigUpgradeList:setRGB( 1, 1, 1 )
	TacRigUpgradeList:setDataSource( "TacRigUpgrades" )
	TacRigUpgradeList:setWidgetType( CoD.TacRigUpgradeModelWidget )
	TacRigUpgradeList:setVerticalCount( 3 )
	TacRigUpgradeList:setSpacing( 40 )
	TacRigUpgradeList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsCACItemLocked( self, element, controller ) and not IsCACItemPurchased( self, element, controller ) then
			PurchaseItem( self, element, controller )
		end
		return retVal
	end )
	self:addElement( TacRigUpgradeList )
	self.TacRigUpgradeList = TacRigUpgradeList
	
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, nil, false, function ( model )
		TacRigUpgradeWidget:setModel( model, controller )
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRigUpgradeWidget.TacRigInfoWidget.UpgradeName:setText( Engine.Localize( modelValue ) )
		end
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRigUpgradeWidget.TacRigInfoWidget.UpgradeDesc:setText( Engine.Localize( modelValue ) )
		end
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRigUpgradeWidget.TacRigInfoWidget.UpdgradeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	TacRigUpgradeList.id = "TacRigUpgradeList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.TacRigUpgradeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.TacRigUpgradeWidget:close()
		self.TacRigUpgradeList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

