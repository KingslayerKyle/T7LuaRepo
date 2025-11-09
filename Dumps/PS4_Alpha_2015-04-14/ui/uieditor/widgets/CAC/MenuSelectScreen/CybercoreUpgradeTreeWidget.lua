require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreNodeLinkWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeModelWidget" )

DataSources.CybercoreAbilityUpgradeTree = {
	getModel = function ( controller )
		local cybercoreType = CoD.perController[controller].weaponCategory
		local classModel = CoD.perController[controller].classModel
		local itemRef = CoD.CACUtility.GetItemRefEquippedInSlot( cybercoreType, controller, classmodel )
		local coreTypeToLoadoutSlotMap = {
			cybercore_control = "cybercom_ability1",
			cybercore_martial = "cybercom_ability2",
			cybercore_chaos = "cybercom_ability3"
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
			local loadoutSlot = coreTypeToLoadoutSlotMap[itemRef]
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
		local perControllerModel = Engine.GetModelForController( controller )
		f1_local0 = Engine.CreateModel( perControllerModel, "CybercoreAbilityUpgradeTree" )
		local SetupAbilityModel = function ( abilityData )
			local abilityModel = Engine.CreateModel( f1_local0, abilityData.abilitySlot )
			local useIndex = abilityData.baseItemIndex
			if abilityData.upgradeItemIndex and Engine.IsItemPurchased( controller, abilityData.upgradeItemIndex ) then
				useIndex = abilityData.upgradeItemIndex
			end
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "baseItemIndex" ), abilityData.baseItemIndex )
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "upgradeItemIndex" ), abilityData.upgradeItemIndex )
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "prereqItemIndex" ), abilityData.prereqItemIndex )
			local abilityName = Engine.GetItemName( useIndex )
			local abilityDesc = Engine.GetItemDesc( useIndex )
			local abilityImage = Engine.GetItemImage( useIndex )
			local abilityCost = Engine.GetItemCost( useIndex )
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "name" ), abilityName )
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "desc" ), abilityDesc )
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "image" ), abilityImage )
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "cost" ), abilityCost )
			local isPurchased = Engine.IsItemPurchased( controller, abilityData.baseItemIndex )
			Engine.SetModelValue( Engine.CreateModel( abilityModel, "purchased" ), isPurchased )
		end
		
		for abilityRef, abilityData in pairs( abilitiesData ) do
			SetupAbilityModel( abilityData )
		end
		return f1_local0
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
		left = self.abilityL2,
		down = self.abilityL2
	}
	self.abilityL2.navigation = {
		up = self.abilityL1,
		down = self.abilityL3
	}
	self.abilityL3.navigation = {
		up = self.abilityL2,
		left = self.abilityL2,
		right = self.abilityR3
	}
	self.abilityR1.navigation = {
		up = self.abilityRoot,
		left = self.abilityRoot,
		right = self.abilityR2,
		down = self.abilityR2
	}
	self.abilityR2.navigation = {
		up = self.abilityR1,
		down = self.abilityR3
	}
	self.abilityR3.navigation = {
		up = self.abilityR2,
		right = self.abilityR2,
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
		Engine.SetModelValue( Engine.GetModel( abilityModel, "desc" ), Engine.GetItemDesc( useIndex ) )
		Engine.SetModelValue( Engine.GetModel( abilityModel, "image" ), Engine.GetItemImage( useIndex ) )
		Engine.SetModelValue( Engine.GetModel( abilityModel, "cost" ), Engine.GetItemCost( useIndex ) )
		local isPurchased = Engine.IsItemPurchased( controller, baseItemIndex )
		Engine.SetModelValue( Engine.GetModel( abilityModel, "purchased" ), isPurchased )
	end
	
	for index, node in ipairs( abilityNodes ) do
		ProcessNode( node )
	end
end

local UpdateLinks = function ( self, controller )
	local abilityLinks = {
		self.nodeLinkL1,
		self.nodeLinkL2,
		self.nodeLinkL3,
		self.nodeLinkR1,
		self.nodeLinkR2,
		self.nodeLinkR3
	}
	for index, link in ipairs( abilityLinks ) do
		local model = link:getModel()
		local isActive = Engine.GetModelValue( Engine.GetModel( model, "purchased" ) )
		if isActive then
			link:setState( "Active" )
		else
			link:setState( "Inactive" )
		end
	end
end

local UpdateTree = function ( self, controller )
	UpdateNodes( self, controller )
	UpdateLinks( self, controller )
	self:processEvent( {
		name = "update_state"
	} )
end

local PostLoadFunc = function ( self, controller )
	SetupNavigation( self, controller )
	self.updateTree = UpdateTree
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
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local nodeLinkL1 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkL1:setLeftRight( true, false, 197, 307 )
	nodeLinkL1:setTopBottom( true, false, 44.75, 140 )
	nodeLinkL1:setRGB( 1, 1, 1 )
	nodeLinkL1:linkToElementModel( self, "abilityRoot", false, function ( model )
		nodeLinkL1:setModel( model, controller )
	end )
	self:addElement( nodeLinkL1 )
	self.nodeLinkL1 = nodeLinkL1
	
	local nodeLinkL2 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkL2:setLeftRight( true, false, 77, 187 )
	nodeLinkL2:setTopBottom( true, false, 168.38, 263.62 )
	nodeLinkL2:setRGB( 1, 1, 1 )
	nodeLinkL2:linkToElementModel( self, "abilityL1", false, function ( model )
		nodeLinkL2:setModel( model, controller )
	end )
	self:addElement( nodeLinkL2 )
	self.nodeLinkL2 = nodeLinkL2
	
	local nodeLinkL3 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkL3:setLeftRight( true, false, 115, 225 )
	nodeLinkL3:setTopBottom( true, false, 332.38, 427.62 )
	nodeLinkL3:setRGB( 1, 1, 1 )
	nodeLinkL3:linkToElementModel( self, "abilityL2", false, function ( model )
		nodeLinkL3:setModel( model, controller )
	end )
	self:addElement( nodeLinkL3 )
	self.nodeLinkL3 = nodeLinkL3
	
	local nodeLinkR1 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkR1:setLeftRight( true, false, 391, 501 )
	nodeLinkR1:setTopBottom( true, false, 44.75, 140 )
	nodeLinkR1:setRGB( 1, 1, 1 )
	nodeLinkR1:linkToElementModel( self, "abilityRoot", false, function ( model )
		nodeLinkR1:setModel( model, controller )
	end )
	self:addElement( nodeLinkR1 )
	self.nodeLinkR1 = nodeLinkR1
	
	local nodeLinkR2 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkR2:setLeftRight( true, false, 511, 621 )
	nodeLinkR2:setTopBottom( true, false, 168.38, 263.62 )
	nodeLinkR2:setRGB( 1, 1, 1 )
	nodeLinkR2:linkToElementModel( self, "abilityR1", false, function ( model )
		nodeLinkR2:setModel( model, controller )
	end )
	self:addElement( nodeLinkR2 )
	self.nodeLinkR2 = nodeLinkR2
	
	local nodeLinkR3 = CoD.CybercoreNodeLinkWidget.new( menu, controller )
	nodeLinkR3:setLeftRight( true, false, 470, 580 )
	nodeLinkR3:setTopBottom( true, false, 332.38, 427.62 )
	nodeLinkR3:setRGB( 1, 1, 1 )
	nodeLinkR3:linkToElementModel( self, "abilityR2", false, function ( model )
		nodeLinkR3:setModel( model, controller )
	end )
	self:addElement( nodeLinkR3 )
	self.nodeLinkR3 = nodeLinkR3
	
	local abilityRoot = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityRoot:setLeftRight( false, true, -410, -290 )
	abilityRoot:setTopBottom( true, false, 0, 120 )
	abilityRoot:setRGB( 1, 1, 1 )
	abilityRoot:linkToElementModel( self, "abilityRoot", false, function ( model )
		abilityRoot:setModel( model, controller )
	end )
	abilityRoot:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PurchaseCybercoreAbility( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( abilityRoot )
	self.abilityRoot = abilityRoot
	
	local abilityL1 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL1:setLeftRight( true, false, 132, 252 )
	abilityL1:setTopBottom( true, false, 86, 206 )
	abilityL1:setRGB( 1, 1, 1 )
	abilityL1:linkToElementModel( self, "abilityL1", false, function ( model )
		abilityL1:setModel( model, controller )
	end )
	abilityL1:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PurchaseCybercoreAbility( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( abilityL1 )
	self.abilityL1 = abilityL1
	
	local abilityL2 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL2:setLeftRight( true, false, 72, 192 )
	abilityL2:setTopBottom( true, false, 232, 352 )
	abilityL2:setRGB( 1, 1, 1 )
	abilityL2:linkToElementModel( self, "abilityL2", false, function ( model )
		abilityL2:setModel( model, controller )
	end )
	abilityL2:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PurchaseCybercoreAbility( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( abilityL2 )
	self.abilityL2 = abilityL2
	
	local abilityL3 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL3:setLeftRight( true, false, 170, 290 )
	abilityL3:setTopBottom( true, false, 380, 500 )
	abilityL3:setRGB( 1, 1, 1 )
	abilityL3:linkToElementModel( self, "abilityL3", false, function ( model )
		abilityL3:setModel( model, controller )
	end )
	abilityL3:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PurchaseCybercoreAbility( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( abilityL3 )
	self.abilityL3 = abilityL3
	
	local abilityR1 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityR1:setLeftRight( false, true, -254, -134 )
	abilityR1:setTopBottom( true, false, 86, 206 )
	abilityR1:setRGB( 1, 1, 1 )
	abilityR1:linkToElementModel( self, "abilityR1", false, function ( model )
		abilityR1:setModel( model, controller )
	end )
	abilityR1:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PurchaseCybercoreAbility( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( abilityR1 )
	self.abilityR1 = abilityR1
	
	local abilityR2 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityR2:setLeftRight( false, true, -194, -74 )
	abilityR2:setTopBottom( true, false, 232, 352 )
	abilityR2:setRGB( 1, 1, 1 )
	abilityR2:linkToElementModel( self, "abilityR2", false, function ( model )
		abilityR2:setModel( model, controller )
	end )
	abilityR2:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PurchaseCybercoreAbility( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( abilityR2 )
	self.abilityR2 = abilityR2
	
	local abilityR3 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityR3:setLeftRight( false, true, -290, -170 )
	abilityR3:setTopBottom( true, false, 380, 500 )
	abilityR3:setRGB( 1, 1, 1 )
	abilityR3:linkToElementModel( self, "abilityR3", false, function ( model )
		abilityR3:setModel( model, controller )
	end )
	abilityR3:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PurchaseCybercoreAbility( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( abilityR3 )
	self.abilityR3 = abilityR3
	
	abilityRoot.navigation = {
		left = abilityL1,
		right = abilityR1
	}
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
	abilityRoot.id = "abilityRoot"
	abilityL1.id = "abilityL1"
	abilityL2.id = "abilityL2"
	abilityL3.id = "abilityL3"
	abilityR1.id = "abilityR1"
	abilityR2.id = "abilityR2"
	abilityR3.id = "abilityR3"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.abilityRoot:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.nodeLinkL1:close()
		self.nodeLinkL2:close()
		self.nodeLinkL3:close()
		self.nodeLinkR1:close()
		self.nodeLinkR2:close()
		self.nodeLinkR3:close()
		self.abilityRoot:close()
		self.abilityL1:close()
		self.abilityL2:close()
		self.abilityL3:close()
		self.abilityR1:close()
		self.abilityR2:close()
		self.abilityR3:close()
		CoD.CybercoreUpgradeTreeWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

