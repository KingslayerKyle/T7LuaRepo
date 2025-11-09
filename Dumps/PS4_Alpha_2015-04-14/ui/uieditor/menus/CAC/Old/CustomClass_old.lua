require( "ui.uieditor.widgets.BackgroundFrames.CACBackground_old" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassPanelMover" )
require( "ui.uieditor.menus.CAC.old.PrimaryWeaponSelect_old" )
require( "ui.uieditor.menus.CAC.old.SecondaryWeaponSelect_old" )
require( "ui.uieditor.menus.CAC.old.PrimaryOpticSelect_old" )
require( "ui.uieditor.menus.CAC.old.SecondaryOpticSelect_old" )
require( "ui.uieditor.menus.CAC.old.PrimaryAttachmentSelect_old" )
require( "ui.uieditor.menus.CAC.old.SecondaryAttachmentSelect_old" )
require( "ui.uieditor.menus.CAC.old.LethalEquipmentSelect_old" )
require( "ui.uieditor.menus.CAC.old.TacticalEquipmentSelect_old" )
require( "ui.uieditor.menus.CAC.old.SpecialGadgetSelect_old" )
require( "ui.uieditor.menus.CAC.old.PerkSelect_old" )
require( "ui.uieditor.menus.CAC.old.WildcardSelect_old" )
require( "ui.uieditor.menus.CAC.old.OverCapacity_old" )
require( "ui.uieditor.menus.CAC.Customization.WeaponCustomization" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
end

local ShowSelectPrompt = function ( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	local classModel = CoD.perController[controller].classModel
	if not ((not LUI.startswith( loadoutSlotName, "primarygadgetattachment" ) or CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) ~= "") and (loadoutSlotName ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) ~= "") and (loadoutSlotName ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) ~= "") and (loadoutSlotName ~= "specialty6" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= "") and (loadoutSlotName ~= "secondaryattachment3" or CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= "") and (not (loadoutSlotName == "primaryattachment4" or loadoutSlotName == "primaryattachment5" or loadoutSlotName == "primaryattachment6") or CoD.CACUtility.SearchForBonusCard( "bonuscard_primary_gunfighter", controller ) ~= "")) or not (not LUI.startswith( loadoutSlotName, "primaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "primary", controller, classModel )) or not (not LUI.startswith( loadoutSlotName, "secondaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "secondary", controller, classModel )) or LUI.startswith( loadoutSlotName, "secondarygadgetattachment" ) and not CoD.CACUtility.ItemEquippedInSlot( "secondarygadget", controller, classModel ) then
		return false
	else
		return true
	end
end

local ShowRemovePrompt = function ( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local slotModel = Engine.GetModel( classModel, loadoutSlotName )
	local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
	if itemIndex > CoD.CACUtility.EmptyItemIndex then
		return true
	else
		
	end
end

local ShowPersonalizePrompt = function ( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	if not (loadoutSlotName ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", controller )) or loadoutSlotName == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", controller ) then
		return true
	else
		return false
	end
end

local UpdateButtonPrompts = function ( self, event )
	local controller = event.controller
	self:removeButtonPrompt( "alt1", self )
	self:removeButtonPrompt( "alt2", self )
	self:removeButtonPrompt( "primary", self )
	if ShowSelectPrompt( self, controller ) then
		self:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "S", self )
	end
	if ShowPersonalizePrompt( self, controller ) then
		self:addButtonPrompt( "alt2", Engine.Localize( "MPUI_PERSONALIZE_CAPS" ), "C", self )
	end
	if ShowRemovePrompt( self, controller ) then
		self:addButtonPrompt( "alt1", Engine.Localize( "REMOVE" ), "R", self )
	end
	return true
end

local PostLoadFunc = function ( self )
	local controller = self:getOwner()
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	self:setModel( classModel )
	self.weaponSlotTable = {}
	self.tabSlots = {}
	if Dvar.ui_extracamCAC:get() then
		Engine.ExecNow( controller, "setupweapondefs" )
		local primaryWeaponString = Engine.GetWeaponString( controller, classNum, "primary" )
		local secondaryWeaponString = Engine.GetWeaponString( controller, classNum, "secondary" )
		local weaponString = primaryWeaponString .. "," .. secondaryWeaponString
		if primaryWeaponString == "" then
			weaponString = "none," .. secondaryWeaponString
		end
		Engine.SendMenuResponse( controller, "CustomClass", weaponString )
		if primaryWeaponString ~= "" then
			Engine.SendClientScriptNotify( controller, "CustomClass_primary", "custom", primaryWeaponString )
		end
		if secondaryWeaponString ~= "" then
			Engine.SendClientScriptNotify( controller, "CustomClass_secondary", "custom", secondaryWeaponString )
		end
	end
	local addStateData = function ( tabName )
		self.tabSlots[tabName] = {}
	end
	
	addStateData( "Wildcards" )
	addStateData( "Weapons" )
	addStateData( "Equipment" )
	addStateData( "Perks" )
	local secondaryWeaponString = function ( slotName, pathFromLayout, state, rowPosition, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot, stateLocation )
		self.weaponSlotTable[slotName] = {
			widget = LUI.getTableFromPath( "CustomClassPanelMover0.CustomClassLayout0." .. pathFromLayout, self ),
			nav = {
				up = upNavSlot,
				down = downNavSlot,
				left = leftNavSlot,
				right = rightNavSlot
			},
			state = state,
			rowPosition = "top"
		}
		if stateLocation then
			self.tabSlots[state][stateLocation] = slotName
		end
	end
	
	local addAttachments = function ( slotNameBase, opticsPathFromLayout, attachmentsPathFromLayoutBase, count, state, rowPosition, leftMostNavSlot, rightMostNavSlot, upNavSlot, downNavSlot, leftMostStateLocation, rightMostStateLocation )
		for i = 1, count, 1 do
			local stateLocation = nil
			local left = slotNameBase .. i - 1
			local path = attachmentsPathFromLayoutBase .. i - 1
			if i == 1 then
				left = leftMostNavSlot
				path = opticsPathFromLayout
				stateLocation = leftMostStateLocation
			end
			local right = slotNameBase .. i + 1
			if i == count then
				right = rightMostNavSlot
				stateLocation = rightMostStateLocation
			end
			secondaryWeaponString( slotNameBase .. i, path, state, rowPosition, left, right, upNavSlot, downNavSlot, stateLocation )
		end
	end
	
	local secondaryGadgetRight = "specialty1"
	local specialty1Left = "secondarygadget"
	secondaryWeaponString( "bonuscard1", "WildcardPane0.WildcardSlot0", "Wildcards", "top", nil, "primary", nil, "bonuscard2", "top_right" )
	secondaryWeaponString( "bonuscard2", "WildcardPane0.WildcardSlot1", "Wildcards", "top", nil, "primary", "bonuscard1", "bonuscard3" )
	secondaryWeaponString( "bonuscard3", "WildcardPane0.WildcardSlot2", "Wildcards", "bottom", nil, "primaryattachment1", "bonuscard2", nil, "bottom_right" )
	secondaryWeaponString( "primary", "PrimaryWeaponSlot0", "Weapons", "top", "bonuscard1", "secondary", nil, "primaryattachment1", "top_left" )
	addAttachments( "primaryattachment", "PrimaryWeaponAttachments0.Optic", "PrimaryWeaponAttachments0.Attachment", 6, "Weapons", "bottom", "bonuscard3", "secondaryattachment1", "primary", nil, "bottom_left", nil )
	secondaryWeaponString( "secondary", "SecondaryWeaponSlot0", "Weapons", "top", "primary", "primarygadget", nil, "secondaryattachment1", "top_right" )
	addAttachments( "secondaryattachment", "SecondaryWeaponAttachments0.Optic", "SecondaryWeaponAttachments0.Attachment", 3, "Weapons", "bottom", "primaryattachment6", "primarygadgetattachment1", "secondary", nil, nil, "bottom_right" )
	secondaryWeaponString( "primarygadget", "LethalSlot0", "Equipment", "top", "secondary", "secondarygadget", nil, "primarygadgetattachment1", "top_left" )
	secondaryWeaponString( "primarygadgetattachment1", "LethalAttachments0.Attachment", "Equipment", "bottom", "secondaryattachment3", "secondarygadgetattachment1", "primarygadget", nil, "bottom_left", nil )
	secondaryWeaponString( "secondarygadget", "TacticalSlot0", "Equipment", "top", "primarygadget", secondaryGadgetRight, nil, "secondarygadgetattachment1" )
	secondaryWeaponString( "secondarygadgetattachment1", "TacticalAttachments0.Attachment", "Equipment", "bottom", "primarygadgetattachment1", "specialty4", "secondarygadget", nil, "bottom_right" )
	secondaryWeaponString( "specialgadget", "SpecialGadgetSlot0", "Equipment", "top", "secondarygadget", "specialty1", nil, nil, "top_right" )
	secondaryWeaponString( "specialty1", "Perk1", "Perks", "top", specialty1Left, "specialty2", nil, "specialty4", "top_left" )
	secondaryWeaponString( "specialty4", "Perk1Bonus.Bonus", "Perks", "bottom", "secondarygadgetattachment1", "specialty5", "specialty1", nil, "bottom_left" )
	secondaryWeaponString( "specialty2", "Perk2", "Perks", "top", "specialty1", "specialty3", nil, "specialty5" )
	secondaryWeaponString( "specialty5", "Perk2Bonus.Bonus", "Perks", "bottom", "specialty4", "specialty6", "specialty2", nil )
	secondaryWeaponString( "specialty3", "Perk3", "Perks", "top", "specialty2", nil, nil, "specialty6" )
	secondaryWeaponString( "specialty6", "Perk3Bonus.Bonus", "Perks", "bottom", "specialty5", nil, "specialty3", nil )
	self.inverseNavigation = {
		left = "right",
		right = "left",
		up = "down",
		down = "up"
	}
	self.navigationHistory = {}
	self.navigateToTab = function ( self, tab, direction )
		local row = self.weaponSlotTable[self.currentActiveSlot].rowPosition
		if row then
			local nextSlot = self.tabSlots[tab][row .. "_left"]
			if nextSlot then
				self:navigateTo( nextSlot, true )
			elseif self.tabSlots[tab][row .. "_right"] then
				self:navigateTo( self.tabSlots[tab][row .. "_right"] )
			end
		end
	end
	
	self.navigateTo = function ( self, newSlot, clearNav )
		if self.currentActiveSlot then
			local oldWidgetData = self.weaponSlotTable[self.currentActiveSlot]
			if oldWidgetData and oldWidgetData.widget then
				oldWidgetData.widget:processEvent( {
					name = "lose_focus",
					controller = controller
				} )
			end
		end
		self.currentActiveSlot = newSlot
		CoD.CACUtility.CustomClass_LastSelection = newSlot
		CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] = newSlot
		local newWidgetData = self.weaponSlotTable[self.currentActiveSlot]
		if newWidgetData and newWidgetData.widget then
			newWidgetData.widget:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self:playSound( "navigate" )
			self.CustomClassPanelMover0:setState( newWidgetData.state )
			self.lastWidgetPerState[newWidgetData.state] = newSlot
		end
		if clearNav then
			self.navigationHistory = {}
		end
		UpdateButtonPrompts( self, {
			controller = controller
		} )
		SetHintText( self, newWidgetData.widget, controller )
	end
	
	self.lastWidgetPerState = {
		Wildcards = "bonuscard1",
		Weapons = "primary",
		Equipment = "primarygadget",
		Perks = "specialty1"
	}
	self:dispatchEventToChildren( {
		name = "lose_focus",
		controller = controller
	} )
	if classNum ~= CoD.CACUtility.CustomClass_LastClassNum then
		if not CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] then
			CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] = "primary"
		end
		CoD.CACUtility.CustomClass_LastSelection = CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1]
	end
	CoD.CACUtility.CustomClass_LastClassNum = classNum
	self:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
	self.performNav = function ( self, direction )
		local slotTable = self.weaponSlotTable[self.currentActiveSlot]
		local currentWidget = slotTable.widget
		local navHistorySize = #self.navigationHistory
		if navHistorySize > 0 then
			local lastHistoryItem = self.navigationHistory[navHistorySize]
			if lastHistoryItem.direction == direction then
				self:navigateTo( lastHistoryItem.slot )
				table.remove( self.navigationHistory, navHistorySize )
				return 
			end
		end
		local itemTable = slotTable.nav
		if itemTable then
			local possibleSlot = itemTable[direction]
			if possibleSlot then
				local widget = nil
				if self.weaponSlotTable[possibleSlot] then
					widget = self.weaponSlotTable[possibleSlot].widget
				end
				if widget then
					if #self.navigationHistory >= 10 then
						table.remove( self.navigationHistory, 1 )
					end
					table.insert( self.navigationHistory, {
						widget = currentWidget,
						direction = self.inverseNavigation[direction],
						slot = self.currentActiveSlot
					} )
					self:navigateTo( possibleSlot )
					return 
				end
			end
		end
	end
	
	self.DoNavigationForGamePadButton = function ( self, event )
		if event.button == "left" or event.button == "right" or event.button == "up" or event.button == "down" then
			self:performNav( event.button )
			return true
		else
			return false
		end
	end
	
	UpdateButtonPrompts( self, {
		controller = controller
	} )
	self:registerEventHandler( "update_button_prompts", UpdateButtonPrompts )
	self:processEvent( {
		name = "update_class",
		controller = controller
	} )
end

LUI.createMenu.CustomClass_old = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CustomClass_old" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local BackdropImage = LUI.UIImage.new()
	BackdropImage:setLeftRight( true, false, 0, 1280 )
	BackdropImage:setTopBottom( true, false, 0, 720 )
	BackdropImage:setRGB( 1, 1, 1 )
	BackdropImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tempbackdrop" ) )
	BackdropImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BackdropImage )
	self.BackdropImage = BackdropImage
	
	local CACBackground0 = CoD.CACBackground_old.new( self, controller )
	CACBackground0:setLeftRight( true, false, 0, 1280 )
	CACBackground0:setTopBottom( true, false, 0, 720 )
	CACBackground0:setRGB( 1, 1, 1 )
	CACBackground0:linkToElementModel( self, nil, false, function ( model )
		CACBackground0:setModel( model, controller )
	end )
	CACBackground0:linkToElementModel( self, "customClassName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CACBackground0.titleLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CACBackground0 )
	self.CACBackground0 = CACBackground0
	
	local CustomClassPanelMover0 = CoD.CustomClassPanelMover.new( self, controller )
	CustomClassPanelMover0:setLeftRight( true, false, 0, 1280 )
	CustomClassPanelMover0:setTopBottom( true, false, 92, 628 )
	CustomClassPanelMover0:setRGB( 1, 1, 1 )
	CustomClassPanelMover0:linkToElementModel( self, nil, false, function ( model )
		CustomClassPanelMover0:setModel( model, controller )
	end )
	CustomClassPanelMover0:mergeStateConditions( {
		{
			stateName = "Wildcards",
			condition = function ( menu, element, event )
				return InWildcardsState( element )
			end
		},
		{
			stateName = "Weapons",
			condition = function ( menu, element, event )
				return InWeaponsState( element )
			end
		},
		{
			stateName = "Equipment",
			condition = function ( menu, element, event )
				return InEquipmentState( element )
			end
		},
		{
			stateName = "Perks",
			condition = function ( menu, element, event )
				return InPerksState( element )
			end
		}
	} )
	self:addElement( CustomClassPanelMover0 )
	self.CustomClassPanelMover0 = CustomClassPanelMover0
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REMOVE_CAPS" ), "R", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		menu:addButtonPrompt( "alt2", Engine.Localize( "MPUI_PERSONALIZE_CAPS" ), "C", element )
		return true
	end
	
	self.buttonPromptAddFunctions.shoulderl = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.shoulderr = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt1( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			NavigateToLoadoutMenu( self, controller )
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			SetBackFromCustomClass( self )
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "R") then
			RemoveItemFromClass( self, element, controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "C") then
			NavigateToPersonalizeMenu( self, controller )
			PlaySoundSetSound( self, "cac_enter_wpn_cust" )
		end
		if not self.occludedBy and (event.button == "shoulderl" or event.button == "key_shortcut" and event.key == "TAB") then
			ChangeCustomClassPane( self, controller, "left" )
		end
		if not self.occludedBy and (event.button == "shoulderr" or event.button == "key_shortcut" and event.key == "SPACE") then
			ChangeCustomClassPane( self, controller, "right" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	CustomClassPanelMover0.id = "CustomClassPanelMover0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CustomClassPanelMover0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.CACBackground0:close()
		self.CustomClassPanelMover0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

