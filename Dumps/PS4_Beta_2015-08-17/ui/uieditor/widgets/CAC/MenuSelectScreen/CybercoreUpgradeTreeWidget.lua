require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreNodeLinkWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeModelWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreBranchHeaderWidget" )

local UpdateTreeModel = function ( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local cybercoreUpgradeMenuModel = Engine.GetModel( perControllerModel, "CybercoreUpgradeMenu" )
	local coreModel = Engine.GetModel( cybercoreUpgradeMenuModel, "selectedCore" )
	local coreRef = Engine.GetModelValue( coreModel )
	local cybercoreUpgradeTreeModel = Engine.CreateModel( perControllerModel, "CybercoreAbilityUpgradeTree" )
	local SetupBranchHeaderModel = function ( side )
		local branchHeaderModel = Engine.CreateModel( cybercoreUpgradeTreeModel, side .. "BranchHeader" )
		local headerName = ""
		for index, header in ipairs( CoD.CACUtility.CybercoreGroupBranchHeaders ) do
			if header.itemRef == coreRef and header.side == side then
				headerName = header.name
				break
			end
		end
		Engine.SetModelValue( branchHeaderModel, headerName )
	end
	
	SetupBranchHeaderModel( "left" )
	SetupBranchHeaderModel( "right" )
	local coreTypeToLoadoutSlotMap = {
		cybercore_control = CoD.CACUtility.loadoutSlotNames.cybercomAbility1,
		cybercore_martial = CoD.CACUtility.loadoutSlotNames.cybercomAbility2,
		cybercore_chaos = CoD.CACUtility.loadoutSlotNames.cybercomAbility3
	}
	local abilitySlots = {
		"abilityRoot",
		"abilityL1",
		"abilityL2",
		"abilityL3",
		"abilityR1",
		"abilityR2",
		"abilityR3"
	}
	local abilitiesData = {}
	local abilitySlotToBaseItemIndexMap = {}
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
	end
	if CoD.UnlockablesTable then
		local loadoutSlot = coreTypeToLoadoutSlotMap[coreRef]
		if loadoutSlot then
			local nodeCount = 1
			for index, model in ipairs( CoD.UnlockablesTable[loadoutSlot] ) do
				local itemIndex = Engine.GetModelValue( Engine.GetModel( model, "itemIndex" ) )
				local ref = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
				local f1_local3 = ref
				local f1_local4 = false
				if LUI.endswith( ref, "_pro" ) then
					f1_local3 = string.sub( ref, 1, -(string.len( "_pro" ) + 1) )
					f1_local4 = true
				end
				if not abilitiesData[f1_local3] then
					local abilitySlot = abilitySlots[nodeCount]
					abilitiesData[f1_local3] = {
						abilitySlot = abilitySlot
					}
					nodeCount = nodeCount + 1
				end
				local abilityData = abilitiesData[f1_local3]
				if f1_local4 then
					abilityData.upgradeModel = model
					abilityData.upgradeItemIndex = itemIndex
				end
				abilityData.baseModel = model
				abilityData.baseItemIndex = itemIndex
				if not abilityData.upgradeItemIndex then
					abilityData.upgradeItemIndex = -1
				end
				abilitySlotToBaseItemIndexMap[abilityData.abilitySlot] = itemIndex
			end
		end
	end
	local preReqMap = {
		abilityL1 = "abilityRoot",
		abilityL2 = "abilityL1",
		abilityL3 = "abilityL2",
		abilityR1 = "abilityRoot",
		abilityR2 = "abilityR1",
		abilityR3 = "abilityR2"
	}
	for abilityRef, abilityData in pairs( abilitiesData ) do
		local abilitySlot = abilityData.abilitySlot
		local prereq = preReqMap[abilitySlot]
		if not prereq then
			abilityData.prereqItemIndex = -1
		else
			abilityData.prereqItemIndex = abilitySlotToBaseItemIndexMap[prereq]
		end
	end
	local SetupAbilityModel = function ( abilityData )
		local abilityModel = Engine.CreateModel( cybercoreUpgradeTreeModel, abilityData.abilitySlot )
		local useIndex = abilityData.baseItemIndex
		if abilityData.upgradeItemIndex and Engine.IsItemPurchased( controller, abilityData.upgradeItemIndex ) then
			useIndex = abilityData.upgradeItemIndex
		end
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "baseItemIndex" ), abilityData.baseItemIndex )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "upgradeItemIndex" ), abilityData.upgradeItemIndex )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "prereqItemIndex" ), abilityData.prereqItemIndex )
		local abilityName = Engine.GetItemName( useIndex )
		local abilityDesc = Engine.GetItemDesc( abilityData.baseItemIndex )
		local abilityImage = Engine.GetItemImage( useIndex )
		local abilityCost = Engine.GetItemCost( useIndex )
		local abilityUpgDesc = ""
		if abilityData.upgradeItemIndex then
			abilityUpgDesc = Engine.GetItemDesc( abilityData.upgradeItemIndex )
		end
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "name" ), abilityName )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "desc" ), abilityDesc )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "image" ), abilityImage )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "cost" ), abilityCost )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "upgdesc" ), abilityUpgDesc )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "core" ), coreRef )
		local isPurchased = Engine.IsItemPurchased( controller, abilityData.baseItemIndex )
		Engine.SetModelValue( Engine.CreateModel( abilityModel, "purchased" ), isPurchased )
	end
	
	for abilityRef, model in pairs( abilitiesData ) do
		SetupAbilityModel( model )
	end
	return cybercoreUpgradeTreeModel
end

DataSources.CybercoreAbilityUpgradeTree = {
	getModel = function ( controller )
		local cybercoreUpgradeTreeModel = UpdateTreeModel( controller )
		return cybercoreUpgradeTreeModel
	end
}
local SetupNavigation = function ( self, controller )
	self.abilityRoot.navigation = {
		left = self.abilityL1,
		right = self.abilityR1
	}
	self.abilityL1.navigation = {
		up = self.abilityRoot,
		right = self.abilityRoot,
		down = self.abilityL2
	}
	self.abilityL2.navigation = {
		up = self.abilityL1,
		down = self.abilityL3,
		right = self.abilityR2
	}
	self.abilityL3.navigation = {
		up = self.abilityL2,
		right = self.abilityR3
	}
	self.abilityR1.navigation = {
		up = self.abilityRoot,
		left = self.abilityRoot,
		down = self.abilityR2
	}
	self.abilityR2.navigation = {
		up = self.abilityR1,
		down = self.abilityR3,
		left = self.abilityL2
	}
	self.abilityR3.navigation = {
		up = self.abilityR2,
		left = self.abilityL3
	}
end

local UpdateNodes = function ( self, controller )
	local abilityNodes = {
		self.abilityRoot,
		self.abilityL1,
		self.abilityL2,
		self.abilityL3,
		self.abilityR1,
		self.abilityR2,
		self.abilityR3
	}
	local ProcessNode = function ( node )
		local abilityModel = node:getModel()
		local baseItemIndex = Engine.GetModelValue( Engine.GetModel( abilityModel, "baseItemIndex" ) )
		local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( abilityModel, "upgradeItemIndex" ) )
		local useIndex = baseItemIndex
		if upgradeItemIndex and Engine.IsItemPurchased( controller, upgradeItemIndex ) then
			useIndex = upgradeItemIndex
		end
		Engine.SetModelValue( Engine.GetModel( abilityModel, "name" ), Engine.GetItemName( useIndex ) )
		Engine.SetModelValue( Engine.GetModel( abilityModel, "desc" ), Engine.GetItemDesc( baseItemIndex ) )
		Engine.SetModelValue( Engine.GetModel( abilityModel, "image" ), Engine.GetItemImage( useIndex ) )
		Engine.SetModelValue( Engine.GetModel( abilityModel, "cost" ), Engine.GetItemCost( useIndex ) )
		local abilityUpgDesc = ""
		if upgradeItemIndex then
			abilityUpgDesc = Engine.GetItemDesc( upgradeItemIndex )
		end
		Engine.SetModelValue( Engine.GetModel( abilityModel, "upgdesc" ), abilityUpgDesc )
		local isPurchased = Engine.IsItemPurchased( controller, baseItemIndex )
		Engine.SetModelValue( Engine.GetModel( abilityModel, "purchased" ), isPurchased )
	end
	
	for index, node in ipairs( abilityNodes ) do
		ProcessNode( node )
		node:processEvent( {
			name = "update_state"
		} )
	end
end

local UpdateTree = function ( self, controller )
	UpdateTreeModel( controller )
	UpdateNodes( self, controller )
end

local PostLoadFunc = function ( self, controller, menu )
	SetupNavigation( self, controller )
	self.updateTree = UpdateTree
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		local perControllerModel = Engine.GetModelForController( controller )
		local cyberAbilitiesModel = Engine.CreateModel( perControllerModel, "CybercoreAbilityUpgradeTree" )
		if cyberAbilitiesModel then
			Engine.UnsubscribeAndFreeModel( cyberAbilitiesModel )
		end
	end )
end

CoD.CybercoreUpgradeTreeWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreUpgradeTreeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreUpgradeTreeWidget )
	self.id = "CybercoreUpgradeTreeWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 700 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 700 )
	Image0:setTopBottom( true, false, 0, 700 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local nodeLinkLH = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkLH:setLeftRight( true, false, 228.23, 312.23 )
	nodeLinkLH:setTopBottom( true, false, 134.62, 234.62 )
	nodeLinkLH:setYRot( -180 )
	nodeLinkLH:linkToElementModel( self, "abilityRoot", false, function ( model )
		nodeLinkLH:setModel( model, controller )
	end )
	self:addElement( nodeLinkLH )
	self.nodeLinkLH = nodeLinkLH
	
	local nodeLinkL1 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkL1:setLeftRight( true, false, 146, 256 )
	nodeLinkL1:setTopBottom( true, false, 164.38, 258.62 )
	nodeLinkL1:setZRot( -90 )
	nodeLinkL1:linkToElementModel( self, "abilityRoot", false, function ( model )
		nodeLinkL1:setModel( model, controller )
	end )
	self:addElement( nodeLinkL1 )
	self.nodeLinkL1 = nodeLinkL1
	
	local nodeLinkL2 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkL2:setLeftRight( true, false, 143.5, 252.5 )
	nodeLinkL2:setTopBottom( true, false, 305.62, 401 )
	nodeLinkL2:setZRot( -90 )
	nodeLinkL2:linkToElementModel( self, "abilityL1", false, function ( model )
		nodeLinkL2:setModel( model, controller )
	end )
	self:addElement( nodeLinkL2 )
	self.nodeLinkL2 = nodeLinkL2
	
	local nodeLinkL3 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkL3:setLeftRight( true, false, 143.5, 253.5 )
	nodeLinkL3:setTopBottom( true, false, 446.38, 541.62 )
	nodeLinkL3:setZRot( -90 )
	nodeLinkL3:linkToElementModel( self, "abilityL2", false, function ( model )
		nodeLinkL3:setModel( model, controller )
	end )
	self:addElement( nodeLinkL3 )
	self.nodeLinkL3 = nodeLinkL3
	
	local nodeLinkRH = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkRH:setLeftRight( true, false, 356, 468 )
	nodeLinkRH:setTopBottom( true, false, 134.62, 234.62 )
	nodeLinkRH:linkToElementModel( self, "abilityRoot", false, function ( model )
		nodeLinkRH:setModel( model, controller )
	end )
	self:addElement( nodeLinkRH )
	self.nodeLinkRH = nodeLinkRH
	
	local nodeLinkR1 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkR1:setLeftRight( true, false, 429, 539 )
	nodeLinkR1:setTopBottom( true, false, 164.38, 258.62 )
	nodeLinkR1:setZRot( -90 )
	nodeLinkR1:linkToElementModel( self, "abilityRoot", false, function ( model )
		nodeLinkR1:setModel( model, controller )
	end )
	self:addElement( nodeLinkR1 )
	self.nodeLinkR1 = nodeLinkR1
	
	local nodeLinkR2 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkR2:setLeftRight( true, false, 424, 539 )
	nodeLinkR2:setTopBottom( true, false, 303.62, 403 )
	nodeLinkR2:setZRot( -90 )
	nodeLinkR2:linkToElementModel( self, "abilityR1", false, function ( model )
		nodeLinkR2:setModel( model, controller )
	end )
	self:addElement( nodeLinkR2 )
	self.nodeLinkR2 = nodeLinkR2
	
	local nodeLinkR3 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkR3:setLeftRight( true, false, 427, 537 )
	nodeLinkR3:setTopBottom( true, false, 446.38, 541.62 )
	nodeLinkR3:setZRot( -90 )
	nodeLinkR3:linkToElementModel( self, "abilityR2", false, function ( model )
		nodeLinkR3:setModel( model, controller )
	end )
	self:addElement( nodeLinkR3 )
	self.nodeLinkR3 = nodeLinkR3
	
	local abilityL1 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL1:setLeftRight( true, false, 138.5, 258.5 )
	abilityL1:setTopBottom( true, false, 222, 342 )
	abilityL1:linkToElementModel( self, "abilityL1", false, function ( model )
		abilityL1:setModel( model, controller )
	end )
	abilityL1:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	abilityL1:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( abilityL1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		TryPurchaseCybercoreAbility( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityL1 )
	self.abilityL1 = abilityL1
	
	local abilityL2 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL2:setLeftRight( true, false, 138.5, 253.5 )
	abilityL2:setTopBottom( true, false, 364, 484 )
	abilityL2:linkToElementModel( self, "abilityL2", false, function ( model )
		abilityL2:setModel( model, controller )
	end )
	abilityL2:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	abilityL2:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( abilityL2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		TryPurchaseCybercoreAbility( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityL2 )
	self.abilityL2 = abilityL2
	
	local abilityL3 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL3:setLeftRight( true, false, 138.5, 258.5 )
	abilityL3:setTopBottom( true, false, 505, 625 )
	abilityL3:linkToElementModel( self, "abilityL3", false, function ( model )
		abilityL3:setModel( model, controller )
	end )
	abilityL3:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	abilityL3:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( abilityL3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		TryPurchaseCybercoreAbility( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityL3 )
	self.abilityL3 = abilityL3
	
	local abilityR1 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityR1:setLeftRight( true, false, 424, 544 )
	abilityR1:setTopBottom( true, false, 222, 342 )
	abilityR1:linkToElementModel( self, "abilityR1", false, function ( model )
		abilityR1:setModel( model, controller )
	end )
	abilityR1:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	abilityR1:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( abilityR1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		TryPurchaseCybercoreAbility( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityR1 )
	self.abilityR1 = abilityR1
	
	local abilityR2 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityR2:setLeftRight( true, false, 424, 544 )
	abilityR2:setTopBottom( true, false, 364, 484 )
	abilityR2:linkToElementModel( self, "abilityR2", false, function ( model )
		abilityR2:setModel( model, controller )
	end )
	abilityR2:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	abilityR2:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( abilityR2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		TryPurchaseCybercoreAbility( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityR2 )
	self.abilityR2 = abilityR2
	
	local abilityR3 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityR3:setLeftRight( true, false, 424, 544 )
	abilityR3:setTopBottom( true, false, 505, 625 )
	abilityR3:linkToElementModel( self, "abilityR3", false, function ( model )
		abilityR3:setModel( model, controller )
	end )
	abilityR3:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	abilityR3:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( abilityR3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		TryPurchaseCybercoreAbility( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityR3 )
	self.abilityR3 = abilityR3
	
	local abilityRoot = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityRoot:setLeftRight( false, false, -69, 51 )
	abilityRoot:setTopBottom( false, false, -209.38, -89.38 )
	abilityRoot:linkToElementModel( self, "abilityRoot", false, function ( model )
		abilityRoot:setModel( model, controller )
	end )
	abilityRoot:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	abilityRoot:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( abilityRoot, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		TryPurchaseCybercoreAbility( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityRoot )
	self.abilityRoot = abilityRoot
	
	local rightBranchHeader = CoD.CybercoreBranchHeaderWidget.new( menu, controller )
	rightBranchHeader:setLeftRight( true, false, 424, 544 )
	rightBranchHeader:setTopBottom( true, false, 170.62, 199.62 )
	rightBranchHeader:linkToElementModel( self, "rightBranchHeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightBranchHeader.headerText:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	self:addElement( rightBranchHeader )
	self.rightBranchHeader = rightBranchHeader
	
	local leftBranchHeader = CoD.CybercoreBranchHeaderWidget.new( menu, controller )
	leftBranchHeader:setLeftRight( true, false, 143.5, 258.5 )
	leftBranchHeader:setTopBottom( true, false, 170.62, 199.62 )
	leftBranchHeader:linkToElementModel( self, "leftBranchHeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftBranchHeader.headerText:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	self:addElement( leftBranchHeader )
	self.leftBranchHeader = leftBranchHeader
	
	abilityL1.navigation = {
		right = abilityRoot,
		down = abilityL2
	}
	abilityL2.navigation = {
		up = abilityL1,
		right = abilityR2,
		down = abilityL3
	}
	abilityL3.navigation = {
		up = abilityL2,
		right = abilityR3
	}
	abilityR1.navigation = {
		left = abilityRoot,
		down = abilityR2
	}
	abilityR2.navigation = {
		left = abilityL2,
		up = abilityR1,
		down = abilityR3
	}
	abilityR3.navigation = {
		left = abilityL3,
		up = abilityR2
	}
	abilityRoot.navigation = {
		left = abilityL1,
		right = abilityR1
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	abilityL1.id = "abilityL1"
	abilityL2.id = "abilityL2"
	abilityL3.id = "abilityL3"
	abilityR1.id = "abilityR1"
	abilityR2.id = "abilityR2"
	abilityR3.id = "abilityR3"
	abilityRoot.id = "abilityRoot"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.abilityL1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.nodeLinkLH:close()
		self.nodeLinkL1:close()
		self.nodeLinkL2:close()
		self.nodeLinkL3:close()
		self.nodeLinkRH:close()
		self.nodeLinkR1:close()
		self.nodeLinkR2:close()
		self.nodeLinkR3:close()
		self.abilityL1:close()
		self.abilityL2:close()
		self.abilityL3:close()
		self.abilityR1:close()
		self.abilityR2:close()
		self.abilityR3:close()
		self.abilityRoot:close()
		self.rightBranchHeader:close()
		self.leftBranchHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

