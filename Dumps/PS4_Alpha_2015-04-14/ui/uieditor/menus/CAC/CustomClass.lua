require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListCustomClass" )
require( "ui.uieditor.menus.CAC.PrimaryWeaponSelect" )
require( "ui.uieditor.menus.CAC.SecondaryWeaponSelect" )
require( "ui.uieditor.menus.CAC.PrimaryOpticSelect" )
require( "ui.uieditor.menus.CAC.SecondaryOpticSelect" )
require( "ui.uieditor.menus.CAC.PrimaryAttachmentSelect" )
require( "ui.uieditor.menus.CAC.SecondaryAttachmentSelect" )
require( "ui.uieditor.menus.CAC.LethalEquipmentSelect" )
require( "ui.uieditor.menus.CAC.TacticalEquipmentSelect" )
require( "ui.uieditor.menus.CAC.SpecialGadgetSelect" )
require( "ui.uieditor.menus.CAC.PerkSelect" )
require( "ui.uieditor.menus.CAC.WildcardSelect" )
require( "ui.uieditor.menus.CAC.WildcardCapacity" )
require( "ui.uieditor.menus.CAC.OverCapacity" )
require( "ui.uieditor.menus.CAC.RemoveItemFromClass" )
require( "ui.uieditor.menus.CAC.Customization.WeaponCustomization" )

local PreLoadFunc = function ( self, controller )
	local classModel = CoD.perController[controller].classModel
	self:setModel( classModel )
	self.disableBlur = true
	CoD.CACUtility.ValidateWeaponVariantForClass( controller, classModel )
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
	local classModel = CoD.perController[controller].classModel
	local slotModel = Engine.GetModel( classModel, loadoutSlotName )
	local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
	if itemIndex > CoD.CACUtility.EmptyItemIndex then
		return true
	else
		
	end
end

local UpdateButtonPrompts = function ( self, event )
	local controller = event.controller
	if ShowSelectPrompt( self, controller ) then
		self.selectPrompt:setState( "DefaultState" )
	else
		self.selectPrompt:setState( "Dim" )
	end
	if ShowRemovePrompt( self, controller ) then
		self.removePrompt:setState( "DefaultState" )
	else
		self.removePrompt:setState( "Dim" )
	end
	return true
end

local UpdateScriptModelPreview = function ( controller, classNum, classModel, loadoutSlot )
	local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, loadoutSlot )
	local weaponName, baseWeaponLoadoutSlot = nil
	if equipped then
		baseWeaponLoadoutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlot )
	elseif LUI.startswith( loadoutSlot, "primaryattachment" ) then
		baseWeaponLoadoutSlot = "primary"
	elseif LUI.startswith( loadoutSlot, "secondaryattachment" ) then
		baseWeaponLoadoutSlot = "secondary"
	end
	if baseWeaponLoadoutSlot and baseWeaponLoadoutSlot ~= "" then
		weaponName = Engine.GetWeaponString( controller, classNum, baseWeaponLoadoutSlot )
	end
	if weaponName and weaponName ~= "" then
		local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
		Engine.SendClientScriptNotify( controller, "CustomClass_update", baseWeaponLoadoutSlot, weaponName, camera, weaponOptions, attachmentInfo )
	else
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
	end
end

local IsNavigationColumn = function ( controller, self, widget, event )
	if event then
		local possibleSlot = event.possibleSlot
		local prevColumnNav = self.columnNav
		if self.weaponSlotTable[possibleSlot] then
			if type( self.columnNav ) == "table" then
				prevColumnNav = self.columnNav[1]
			end
			local columnNav = self.weaponSlotTable[possibleSlot].columnNav
			if type( columnNav ) == "table" then
				for index, columnNavValue in ipairs( columnNav ) do
					if prevColumnNav == columnNavValue then
						return true
					end
				end
			elseif prevColumnNav == columnNav then
				return true
			end
		end
	end
	return false
end

local PostLoadFunc = function ( self, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local customClassMenuModel = self:getModel( controller, "CustomClassMenu" )
	local currentLoadoutNameModel, currentItemNameModel = nil
	if customClassMenuModel then
		currentLoadoutNameModel = Engine.GetModel( customClassMenuModel, "currentLoadoutName" )
		currentItemNameModel = Engine.GetModel( customClassMenuModel, "currentItemName" )
	end
	self.weaponSlotTable = {}
	local addSlotToSlotTable = function ( slotName, pathFromLayout, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		self.weaponSlotTable[slotName] = {
			widget = LUI.getTableFromPath( "chooseClassWidget." .. pathFromLayout, self ),
			nav = {
				up = upNavSlot,
				down = downNavSlot,
				left = leftNavSlot,
				right = rightNavSlot
			},
			state = CoD.isCampaign and "Campaign" or "DefaultState",
			columnNav = column
		}
	end
	
	local addChildSlotToSlotTable = function ( slotName, parentWidgetName, widgetName, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		local pathFromLayout = parentWidgetName .. "." .. widgetName
		addSlotToSlotTable( slotName, pathFromLayout, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		local parentWidget = LUI.getTableFromPath( "chooseClassWidget." .. parentWidgetName, self )
		self.weaponSlotTable[slotName].parentWidget = parentWidget
	end
	
	local addWildcardSlotToSlotTable = function ( slotName, parentWidgetName, widgetName, widgetState, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot, leftNavClip, rightNavClip )
		local column = nil
		addChildSlotToSlotTable( slotName, parentWidgetName, widgetName, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		self.weaponSlotTable[slotName].state = "Wildcards"
		self.weaponSlotTable[slotName].widgetState = widgetState
		self.weaponSlotTable[slotName].clipNav = {
			left = leftNavClip,
			right = rightNavClip
		}
		self.weaponSlotTable[slotName].setFocusToChild = "bonuscard1"
	end
	
	local isCPorMP = function ( cpNavSlot, mpNavSlot )
		if CoD.isCampaign == true then
			return cpNavSlot
		else
			return mpNavSlot
		end
	end
	
	local leftNavSlot, rightNavSlot, upNavSlot, downNavSlot, leftNavClip, rightNavClip = nil
	addSlotToSlotTable( "primary", "PrimaryWeapon", {
		1,
		2
	}, leftNavSlot, "primaryattachment1", upNavSlot, "secondary" )
	addSlotToSlotTable( "primaryattachment1", "PrimaryWeaponAttachment.optic", 3, "primary", "primaryattachment2", upNavSlot, "primaryattachment4" )
	addSlotToSlotTable( "primaryattachment2", "PrimaryWeaponAttachment.attachment1", 4, "primaryattachment1", "primaryattachment3", upNavSlot, {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "secondaryattachment2"
		}
	} )
	addSlotToSlotTable( "primaryattachment3", "PrimaryWeaponAttachment.attachment2", 5, "primaryattachment2", rightNavSlot, upNavSlot, {
		{
			slot = "primaryattachment6",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "secondaryattachment3"
		}
	} )
	addSlotToSlotTable( "primaryattachment4", "PrimaryWeaponAttachment.attachment3", 3, "primary", {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		}
	}, "primaryattachment1", "secondaryattachment1" )
	addSlotToSlotTable( "primaryattachment5", "PrimaryWeaponAttachment.attachment4", 4, "primaryattachment4", "primaryattachment6", {
		{
			slot = "primaryattachment2",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "bonuscard1"
		}
	}, "secondaryattachment2" )
	addSlotToSlotTable( "primaryattachment6", "PrimaryWeaponAttachment.attachment5", 5, "primaryattachment5", rightNavSlot, {
		{
			slot = "primaryattachment3",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "bonuscard1"
		}
	}, "secondaryattachment3" )
	addSlotToSlotTable( "secondary", "SecondaryWeapon", {
		1,
		2
	}, leftNavSlot, "secondaryattachment1", "primary", isCPorMP( "cybercore", "primarygadget" ) )
	addSlotToSlotTable( "secondaryattachment1", "SecondaryWeaponAttachment.optic", 3, "secondary", "secondaryattachment2", "primaryattachment4", isCPorMP( "cybercom_tacrig1", "specialty1" ) )
	addSlotToSlotTable( "secondaryattachment2", "SecondaryWeaponAttachment.attachment1", 4, "secondaryattachment1", "secondaryattachment3", {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "primaryattachment2"
		}
	}, isCPorMP( "primarygadget", "specialty2" ) )
	addSlotToSlotTable( "secondaryattachment3", "SecondaryWeaponAttachment.attachment2", 5, "secondaryattachment2", rightNavSlot, {
		{
			slot = "primaryattachment6",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "primaryattachment3"
		}
	}, isCPorMP( "secondarygadget", "specialty3" ) )
	addSlotToSlotTable( "primarygadget", "LethalEquipment.Equipment1", 1, isCPorMP( "cybercom_tacrig1", leftNavSlot ), "secondarygadget", isCPorMP( "secondaryattachment2", "secondary" ), "primarygadgetattachment1" )
	addSlotToSlotTable( "primarygadgetattachment1", "LethalEquipment.Equipment2", 1, isCPorMP( "cybercom_tacrig2", leftNavSlot ), "secondarygadgetattachment1", "primarygadget", "bonuscard1" )
	addSlotToSlotTable( "secondarygadget", "TacticalEquipment.Equipment1", 2, "primarygadget", isCPorMP( rightNavSlot, "specialty1" ), isCPorMP( "secondaryattachment3", "secondary" ), "secondarygadgetattachment1" )
	addSlotToSlotTable( "secondarygadgetattachment1", "TacticalEquipment.Equipment2", 2, "primarygadgetattachment1", isCPorMP( rightNavSlot, "specialty4" ), "secondarygadget", "bonuscard1" )
	addSlotToSlotTable( "specialty1", "SpecialtyPerks.perk1.perk", 3, "secondarygadget", "specialty2", "secondaryattachment1", "specialty4" )
	addSlotToSlotTable( "specialty2", "SpecialtyPerks.perk2.perk", 4, "specialty1", "specialty3", "secondaryattachment2", "specialty5" )
	addSlotToSlotTable( "specialty3", "SpecialtyPerks.perk3.perk", 5, "specialty2", rightNavSlot, "secondaryattachment3", "specialty6" )
	addSlotToSlotTable( "specialty4", "SpecialtyPerks.perk1.perkPlus", 3, "secondarygadgetattachment1", "specialty5", "specialty1", "bonuscard1" )
	addSlotToSlotTable( "specialty5", "SpecialtyPerks.perk2.perkPlus", 4, "specialty4", "specialty6", "specialty2", "bonuscard1" )
	addSlotToSlotTable( "specialty6", "SpecialtyPerks.perk3.perkPlus", 5, "specialty5", rightNavSlot, "specialty3", "bonuscard1" )
	addSlotToSlotTable( "cybercore", "Cybercore", 3, leftNavSlot, "cybercom_tacrig1", "secondary", "bonuscard1" )
	addSlotToSlotTable( "cybercom_tacrig1", "TacticalRig.TacRig1", 4, "cybercore", "primarygadget", "secondaryattachment1", "cybercom_tacrig2" )
	addSlotToSlotTable( "cybercom_tacrig2", "TacticalRig.TacRig2", 5, "cybercore", "primarygadgetattachment1", "cybercom_tacrig1", "bonuscard1" )
	local downNavigationForWildcard = {
		{
			slot = "primary",
			condition = IsNavigationColumn
		},
		{
			slot = "primary",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment2",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment3",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment1"
		}
	}
	local upNavigationForWildcard = isCPorMP( {
		{
			slot = "cybercore",
			condition = IsNavigationColumn
		},
		{
			slot = "cybercom_tacrig2",
			condition = IsNavigationColumn
		},
		{
			slot = "primarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "secondarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "cybercom_tacrig2"
		}
	}, {
		{
			slot = "primarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "secondarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty4",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty5",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty6",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty4"
		}
	} )
	addWildcardSlotToSlotTable( "bonuscard3", "Wildcards", "wildcard3", "Card1to3", leftNavSlot, "bonuscard1", upNavigationForWildcard, downNavSlot, leftNavClip, "ToCard1" )
	addWildcardSlotToSlotTable( "bonuscard1", "Wildcards", "wildcard1", "ToCard1", "bonuscard3", "bonuscard2", upNavigationForWildcard, downNavSlot, "Card1to3", "Card1to2" )
	addWildcardSlotToSlotTable( "bonuscard2", "Wildcards", "wildcard2", "Card1to2", "bonuscard1", rightNavSlot, upNavigationForWildcard, downNavSlot, "ToCard1", rightNavClip )
	self.inverseNavigation = {
		left = "right",
		right = "left",
		up = "down",
		down = "up"
	}
	self.navigationHistory = {}
	self.navigateTo = function ( self, newSlot, direction )
		local oldWidgetData, newWidgetData = nil
		if self.currentActiveSlot then
			newWidgetData = self.weaponSlotTable[newSlot]
			oldWidgetData = self.weaponSlotTable[self.currentActiveSlot]
			if oldWidgetData and oldWidgetData.widget then
				oldWidgetData.widget:processEvent( {
					name = "lose_focus",
					controller = controller
				} )
				oldWidgetData.widget:setPriority( 0 )
				local parentWidget = oldWidgetData.widget:getParent()
				while parentWidget ~= self do
					parentWidget:setPriority( 0 )
					parentWidget = parentWidget:getParent()
				end
				if oldWidgetData.parentWidget then
					if not newWidgetData.parentWidget or oldWidgetData.parentWidget ~= newWidgetData.parentWidget then
						oldWidgetData.parentWidget:setState( "DefaultState" )
					end
					if oldWidgetData.clipNav and oldWidgetData.clipNav[direction] then
						oldWidgetData.parentWidget:setState( oldWidgetData.clipNav[direction] )
					end
				end
			end
		end
		self.currentActiveSlot = newSlot
		CoD.CACUtility.CustomClass_LastSelection = newSlot
		CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] = newSlot
		newWidgetData = self.weaponSlotTable[self.currentActiveSlot]
		if newWidgetData and newWidgetData.widget then
			newWidgetData.widget:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			newWidgetData.widget:setPriority( 100 )
			local parentWidget = newWidgetData.widget:getParent()
			while parentWidget ~= self do
				parentWidget:setPriority( 100 )
				parentWidget = parentWidget:getParent()
			end
			self:playSound( "navigate" )
			self.chooseClassWidget:setState( newWidgetData.state )
			if oldWidgetData and newWidgetData.parentWidget ~= oldWidgetData.parentWidget and newWidgetData.widgetState then
				newWidgetData.parentWidget:setState( newWidgetData.widgetState )
			end
			if not oldWidgetData and newWidgetData.widgetState then
				newWidgetData.parentWidget:setState( newWidgetData.widgetState )
			end
			self.previewWidget:setModel( newWidgetData.widget:getModel() )
			UpdateScriptModelPreview( controller, classNum, classModel, newSlot )
		end
		if newWidgetData.columnNav then
			self.columnNav = newWidgetData.columnNav
		end
		UpdateButtonPrompts( self, {
			controller = controller
		} )
		SetHintText( self, newWidgetData.widget, controller )
	end
	
	self.performNav = function ( self, direction )
		local slotTable = self.weaponSlotTable[self.currentActiveSlot]
		local currentWidget = slotTable.widget
		local navHistorySize = #self.navigationHistory
		if navHistorySize > 0 then
			local lastHistoryItem = self.navigationHistory[navHistorySize]
			if lastHistoryItem.direction == direction and (not lastHistoryItem.conditionFn or lastHistoryItem.conditionFn( controller, self, currentWidget )) then
				self:navigateTo( lastHistoryItem.slot, direction )
				table.remove( self.navigationHistory, navHistorySize )
				return 
			end
		end
		local itemTable = slotTable.nav
		if itemTable then
			local possibleSlot = itemTable[direction]
			if possibleSlot then
				local widget, conditionFn = nil
				if type( possibleSlot ) == "table" then
					for index, additionalPossibleSlot in ipairs( possibleSlot ) do
						if additionalPossibleSlot.slot then
							local possibleWidget = self.weaponSlotTable[additionalPossibleSlot.slot].widget
							if possibleWidget and (not additionalPossibleSlot.condition or additionalPossibleSlot.condition( controller, self, possibleWidget, {
								possibleSlot = additionalPossibleSlot.slot
							} )) then
								widget = possibleWidget
								possibleSlot = additionalPossibleSlot.slot
								conditionFn = additionalPossibleSlot.condition
							end
						end
					end
				elseif self.weaponSlotTable[possibleSlot] then
					widget = self.weaponSlotTable[possibleSlot].widget
				end
				if widget then
					if #self.navigationHistory >= 10 then
						table.remove( self.navigationHistory, 1 )
					end
					local previousSlot = self.currentActiveSlot
					local previousSlotWidget = self.weaponSlotTable[previousSlot]
					if previousSlotWidget.setFocusToChild then
						self.navigationHistory = {}
						table.insert( self.navigationHistory, {
							direction = self.inverseNavigation[direction],
							slot = previousSlotWidget.setFocusToChild,
							conditionFn = conditionFn
						} )
					else
						table.insert( self.navigationHistory, {
							direction = self.inverseNavigation[direction],
							slot = previousSlot,
							conditionFn = conditionFn
						} )
					end
					self:navigateTo( possibleSlot, direction )
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
	
	self:dispatchEventToChildren( {
		name = "lose_focus",
		controller = controller
	} )
	if CoD.CACUtility.CustomClass_LastClassNum ~= classNum then
		if not CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] then
			CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] = "primary"
		end
		CoD.CACUtility.CustomClass_LastSelection = CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1]
	end
	CoD.CACUtility.CustomClass_LastClassNum = classNum
	self:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
	self.ShowRemovePrompt = ShowRemovePrompt
	UpdateButtonPrompts( self, {
		controller = controller
	} )
	self:registerEventHandler( "update_button_prompts", UpdateButtonPrompts )
end

LUI.createMenu.CustomClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CustomClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, true, -16, 20 )
	Fade:setTopBottom( true, true, -23, 19 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Fade )
	self.Fade = Fade
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( true, false, -3, 497 )
	chooseClassWidget:setTopBottom( true, false, 79, 653 )
	chooseClassWidget:setRGB( 1, 1, 1 )
	chooseClassWidget:linkToElementModel( self, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local CACBackground0 = CoD.CACBackgroundNew.new( self, controller )
	CACBackground0:setLeftRight( true, false, 0, 1280 )
	CACBackground0:setTopBottom( true, false, 0, 720 )
	CACBackground0:setRGB( 1, 1, 1 )
	CACBackground0:linkToElementModel( self, nil, false, function ( model )
		CACBackground0:setModel( model, controller )
	end )
	CACBackground0:linkToElementModel( self, "customClassName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CACBackground0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CACBackground0 )
	self.CACBackground0 = CACBackground0
	
	local previewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	previewWidget:setLeftRight( false, true, -850, 0 )
	previewWidget:setTopBottom( false, true, -596, 0 )
	previewWidget:setRGB( 1, 1, 1 )
	previewWidget:linkToElementModel( self, nil, false, function ( model )
		previewWidget:setModel( model, controller )
	end )
	self:addElement( previewWidget )
	self.previewWidget = previewWidget
	
	local selectPrompt = CoD.buttonprompt_small.new( self, controller )
	selectPrompt:setLeftRight( true, false, 65, 279 )
	selectPrompt:setTopBottom( false, true, -56, -25 )
	selectPrompt:setRGB( 1, 1, 1 )
	selectPrompt.label:setText( Engine.Localize( "MENU_SELECT" ) )
	selectPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( selectPrompt )
	self.selectPrompt = selectPrompt
	
	local backPrompt = CoD.buttonprompt_small.new( self, controller )
	backPrompt:setLeftRight( true, false, 146, 360 )
	backPrompt:setTopBottom( false, true, -57, -26 )
	backPrompt:setRGB( 1, 1, 1 )
	backPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	backPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			backPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( backPrompt )
	self.backPrompt = backPrompt
	
	local removePrompt = CoD.buttonprompt_small.new( self, controller )
	removePrompt:setLeftRight( true, false, 350, 564 )
	removePrompt:setTopBottom( false, true, -56, -25 )
	removePrompt:setRGB( 1, 1, 1 )
	removePrompt.label:setText( Engine.Localize( "MENU_REMOVE" ) )
	removePrompt:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			removePrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( removePrompt )
	self.removePrompt = removePrompt
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListCustomClass0 = CoD.cac_ElemsSideListCustomClass.new( self, controller )
	cacElemsSideListCustomClass0:setLeftRight( true, false, 19, 417 )
	cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListCustomClass0:setRGB( 1, 1, 1 )
	self:addElement( cacElemsSideListCustomClass0 )
	self.cacElemsSideListCustomClass0 = cacElemsSideListCustomClass0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Fade:completeAnimation()
				self.Fade:setAlpha( 0 )
				self.clipFinished( Fade, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, -3, 497 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.clipFinished( chooseClassWidget, {} )
				previewWidget:completeAnimation()
				self.previewWidget:setLeftRight( false, true, -850, 0 )
				self.previewWidget:setTopBottom( false, true, -596, 0 )
				self.clipFinished( previewWidget, {} )
				selectPrompt:completeAnimation()
				self.selectPrompt:setLeftRight( true, false, 65, 279 )
				self.selectPrompt:setTopBottom( false, true, -56, -25 )
				self.selectPrompt:setAlpha( 1 )
				self.clipFinished( selectPrompt, {} )
				backPrompt:completeAnimation()
				self.backPrompt:setLeftRight( true, false, 146, 360 )
				self.backPrompt:setTopBottom( false, true, -57, -26 )
				self.clipFinished( backPrompt, {} )
				removePrompt:completeAnimation()
				self.removePrompt:setLeftRight( true, false, 350, 564 )
				self.removePrompt:setTopBottom( false, true, -56, -25 )
				self.removePrompt:setAlpha( 1 )
				self.clipFinished( removePrompt, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeFrame2 = function ( Fade, event )
					local FadeFrame3 = function ( Fade, event )
						if not event.interrupted then
							Fade:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						end
						Fade:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Fade, event )
						else
							Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeFrame3( Fade, event )
						return 
					else
						Fade:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Fade:registerEventHandler( "transition_complete_keyframe", FadeFrame3 )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
					end
					Fade:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fade, event )
					else
						Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 428 )
					LeftPanel:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 378 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 540, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( true, false, -3, 497 )
					chooseClassWidget:setTopBottom( true, false, 80, 663 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local previewWidgetFrame2 = function ( previewWidget, event )
					if not event.interrupted then
						previewWidget:beginAnimation( "keyframe", 680, false, true, CoD.TweenType.Linear )
					end
					previewWidget:setLeftRight( false, true, -850, 0 )
					previewWidget:setTopBottom( false, true, -596, 0 )
					if event.interrupted then
						self.clipFinished( previewWidget, event )
					else
						previewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewWidget:completeAnimation()
				self.previewWidget:setLeftRight( false, true, -471, 379 )
				self.previewWidget:setTopBottom( false, true, -596, 0 )
				previewWidgetFrame2( previewWidget, {} )
				local selectPromptFrame2 = function ( selectPrompt, event )
					if not event.interrupted then
						selectPrompt:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Linear )
					end
					selectPrompt:setLeftRight( true, false, 65, 279 )
					selectPrompt:setTopBottom( false, true, -56, -25 )
					selectPrompt:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( selectPrompt, event )
					else
						selectPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectPrompt:completeAnimation()
				self.selectPrompt:setLeftRight( true, false, 64, 278 )
				self.selectPrompt:setTopBottom( false, true, 1, 32 )
				self.selectPrompt:setAlpha( 0 )
				selectPromptFrame2( selectPrompt, {} )
				local backPromptFrame2 = function ( backPrompt, event )
					if not event.interrupted then
						backPrompt:beginAnimation( "keyframe", 230, false, true, CoD.TweenType.Linear )
					end
					backPrompt:setLeftRight( true, false, 146, 360 )
					backPrompt:setTopBottom( false, true, -57, -26 )
					backPrompt:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( backPrompt, event )
					else
						backPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backPrompt:completeAnimation()
				self.backPrompt:setLeftRight( true, false, 145, 359 )
				self.backPrompt:setTopBottom( false, true, 0, 31 )
				self.backPrompt:setAlpha( 0 )
				backPromptFrame2( backPrompt, {} )
				local removePromptFrame2 = function ( removePrompt, event )
					if not event.interrupted then
						removePrompt:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
					end
					removePrompt:setLeftRight( true, false, 350, 564 )
					removePrompt:setTopBottom( false, true, -56, -25 )
					removePrompt:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( removePrompt, event )
					else
						removePrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				removePrompt:completeAnimation()
				self.removePrompt:setLeftRight( true, false, 389, 603 )
				self.removePrompt:setTopBottom( false, true, -56, -25 )
				self.removePrompt:setAlpha( 1 )
				removePromptFrame2( removePrompt, {} )
				local cacElemsSideListCustomClass0Frame2 = function ( cacElemsSideListCustomClass0, event )
					local cacElemsSideListCustomClass0Frame3 = function ( cacElemsSideListCustomClass0, event )
						if not event.interrupted then
							cacElemsSideListCustomClass0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image10:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image100:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image101:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image1010:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Linear )
						end
						cacElemsSideListCustomClass0.Image10:setAlpha( 0.82 )
						cacElemsSideListCustomClass0.Image100:setAlpha( 0.82 )
						cacElemsSideListCustomClass0.Image101:setAlpha( 0.82 )
						cacElemsSideListCustomClass0.Image1010:setAlpha( 0.82 )
						if event.interrupted then
							self.clipFinished( cacElemsSideListCustomClass0, event )
						else
							cacElemsSideListCustomClass0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cacElemsSideListCustomClass0Frame3( cacElemsSideListCustomClass0, event )
						return 
					else
						cacElemsSideListCustomClass0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						cacElemsSideListCustomClass0:registerEventHandler( "transition_complete_keyframe", cacElemsSideListCustomClass0Frame3 )
					end
				end
				
				cacElemsSideListCustomClass0:completeAnimation()
				cacElemsSideListCustomClass0.Image10:completeAnimation()
				cacElemsSideListCustomClass0.Image100:completeAnimation()
				cacElemsSideListCustomClass0.Image101:completeAnimation()
				cacElemsSideListCustomClass0.Image1010:completeAnimation()
				self.cacElemsSideListCustomClass0.Image10:setAlpha( 0 )
				self.cacElemsSideListCustomClass0.Image100:setAlpha( 0.82 )
				self.cacElemsSideListCustomClass0.Image101:setAlpha( 0 )
				self.cacElemsSideListCustomClass0.Image1010:setAlpha( 0.82 )
				cacElemsSideListCustomClass0Frame2( cacElemsSideListCustomClass0, {} )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		return true
	end
	
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
			CloseCustomClassMenu( self, controller )
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "R") then
			RemoveItemFromClass( self, element, controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "C") then
			NavigateToPersonalizeMenu( self, controller )
			PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "CACBackground0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "previewWidget",
			clipName = "Intro"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "weaponProgression",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	chooseClassWidget.id = "chooseClassWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.chooseClassWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.LeftPanel:close()
		self.chooseClassWidget:close()
		self.CACBackground0:close()
		self.previewWidget:close()
		self.selectPrompt:close()
		self.backPrompt:close()
		self.removePrompt:close()
		self.cacElemsSideListCustomClass0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

