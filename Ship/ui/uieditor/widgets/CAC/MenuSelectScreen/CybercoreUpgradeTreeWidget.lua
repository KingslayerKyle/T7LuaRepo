-- 028b05ec04ddd8b82ed687291c87f117
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreNodeLinkWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeModelWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreBranchHeaderWidget" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = Engine.GetModelForController( f1_arg0 )
	local f1_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( f1_local0, "CybercoreUpgradeMenu" ), "selectedCore" ) )
	local f1_local2 = Engine.CreateModel( f1_local0, "CybercoreAbilityUpgradeTree" )
	local f1_local3 = function ( f2_arg0 )
		local f2_local0 = Engine.CreateModel( f1_local2, f2_arg0 .. "BranchHeader" )
		local f2_local1 = ""
		for f2_local5, f2_local6 in ipairs( CoD.CACUtility.CybercoreGroupBranchHeaders ) do
			if f2_local6.itemRef == f1_local1 and f2_local6.side == f2_arg0 then
				f2_local1 = f2_local6.name
				break
			end
		end
		Engine.SetModelValue( f2_local0, f2_local1 )
	end
	
	f1_local3( "left" )
	f1_local3( "right" )
	local f1_local4 = {
		cybercore_control = CoD.CACUtility.loadoutSlotNames.cybercomAbility1,
		cybercore_martial = CoD.CACUtility.loadoutSlotNames.cybercomAbility2,
		cybercore_chaos = CoD.CACUtility.loadoutSlotNames.cybercomAbility3
	}
	local f1_local5 = {
		"abilityRoot",
		"abilityL1",
		"abilityL2",
		"abilityL3",
		"abilityR1",
		"abilityR2",
		"abilityR3"
	}
	local f1_local6 = {}
	local f1_local7 = {}
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f1_arg0 )
	end
	if CoD.UnlockablesTable then
		local f1_local8 = f1_local4[f1_local1]
		if f1_local8 then
			CoD.perController[f1_arg0].weaponCategory = f1_local8
			local f1_local9 = 1
			for f1_local16, f1_local17 in ipairs( CoD.UnlockablesTable[f1_local8] ) do
				local f1_local18 = Engine.GetModelValue( Engine.GetModel( f1_local17, "itemIndex" ) )
				local f1_local19 = Engine.GetModelValue( Engine.GetModel( f1_local17, "ref" ) )
				local f1_local13 = f1_local19
				local f1_local14 = false
				if LUI.endswith( f1_local19, "_pro" ) then
					f1_local13 = string.sub( f1_local19, 1, -(string.len( "_pro" ) + 1) )
					f1_local14 = true
				end
				if not f1_local6[f1_local13] then
					f1_local6[f1_local13] = {
						abilitySlot = f1_local5[f1_local9]
					}
					f1_local9 = f1_local9 + 1
				end
				local f1_local15 = f1_local6[f1_local13]
				if f1_local14 then
					f1_local15.upgradeModel = f1_local17
					f1_local15.upgradeItemIndex = f1_local18
				end
				f1_local15.baseModel = f1_local17
				f1_local15.baseItemIndex = f1_local18
				if not f1_local15.upgradeItemIndex then
					f1_local15.upgradeItemIndex = -1
				end
				f1_local7[f1_local15.abilitySlot] = f1_local18
			end
		end
	end
	local f1_local8 = {
		abilityL1 = "abilityRoot",
		abilityL2 = "abilityL1",
		abilityL3 = "abilityL2",
		abilityR1 = "abilityRoot",
		abilityR2 = "abilityR1",
		abilityR3 = "abilityR2"
	}
	for f1_local12, f1_local16 in pairs( f1_local6 ) do
		local f1_local18 = f1_local8[f1_local16.abilitySlot]
		if not f1_local18 then
			f1_local16.prereqItemIndex = -1
		else
			f1_local16.prereqItemIndex = f1_local7[f1_local18]
		end
	end
	f1_local9 = function ( f3_arg0 )
		local f3_local0 = Engine.CreateModel( f1_local2, f3_arg0.abilitySlot )
		local f3_local1 = f3_arg0.baseItemIndex
		if f3_arg0.upgradeItemIndex and Engine.IsItemPurchased( f1_arg0, f3_arg0.upgradeItemIndex ) then
			f3_local1 = f3_arg0.upgradeItemIndex
		end
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "prereqItemIndex" ), f3_arg0.prereqItemIndex )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "upgradeItemIndex" ), f3_arg0.upgradeItemIndex )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "baseItemIndex" ), f3_arg0.baseItemIndex )
		local f3_local2 = Engine.GetItemName( f3_local1 )
		local f3_local3 = Engine.GetItemDesc( f3_arg0.baseItemIndex )
		local f3_local4 = Engine.GetItemImage( f3_local1 )
		local f3_local5 = Engine.GetItemCost( f3_local1 )
		local f3_local6 = ""
		if f3_arg0.upgradeItemIndex then
			f3_local6 = Engine.GetItemDesc( f3_arg0.upgradeItemIndex )
		end
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "name" ), f3_local2 )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "desc" ), f3_local3 )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "image" ), f3_local4 )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "cost" ), f3_local5 )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "upgdesc" ), f3_local6 )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "core" ), f1_local1 )
		Engine.SetModelValue( Engine.CreateModel( f3_local0, "purchased" ), Engine.IsItemPurchased( f1_arg0, f3_arg0.baseItemIndex ) )
	end
	
	for f1_local16, f1_local17 in pairs( f1_local6 ) do
		f1_local9( f1_local17 )
	end
	return f1_local2
end

DataSources.CybercoreAbilityUpgradeTree = {
	getModel = function ( f4_arg0 )
		return f0_local0( f4_arg0 )
	end
}
local f0_local1 = function ( f5_arg0, f5_arg1 )
	f5_arg0.abilityRoot.navigation = {
		left = f5_arg0.abilityL1,
		right = f5_arg0.abilityR1
	}
	f5_arg0.abilityL1.navigation = {
		up = f5_arg0.abilityRoot,
		right = f5_arg0.abilityRoot,
		down = f5_arg0.abilityL2
	}
	f5_arg0.abilityL2.navigation = {
		up = f5_arg0.abilityL1,
		down = f5_arg0.abilityL3,
		right = f5_arg0.abilityR2
	}
	f5_arg0.abilityL3.navigation = {
		up = f5_arg0.abilityL2,
		right = f5_arg0.abilityR3
	}
	f5_arg0.abilityR1.navigation = {
		up = f5_arg0.abilityRoot,
		left = f5_arg0.abilityRoot,
		down = f5_arg0.abilityR2
	}
	f5_arg0.abilityR2.navigation = {
		up = f5_arg0.abilityR1,
		down = f5_arg0.abilityR3,
		left = f5_arg0.abilityL2
	}
	f5_arg0.abilityR3.navigation = {
		up = f5_arg0.abilityR2,
		left = f5_arg0.abilityL3
	}
end

local f0_local2 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = {
		f6_arg0.abilityRoot,
		f6_arg0.abilityL1,
		f6_arg0.abilityL2,
		f6_arg0.abilityL3,
		f6_arg0.abilityR1,
		f6_arg0.abilityR2,
		f6_arg0.abilityR3
	}
	local f6_local1 = function ( f7_arg0 )
		local f7_local0 = f7_arg0:getModel()
		local f7_local1 = Engine.GetModelValue( Engine.GetModel( f7_local0, "baseItemIndex" ) )
		local f7_local2 = Engine.GetModelValue( Engine.GetModel( f7_local0, "upgradeItemIndex" ) )
		local f7_local3 = f7_local1
		if f7_local2 and Engine.IsItemPurchased( f6_arg1, f7_local2 ) then
			f7_local3 = f7_local2
		end
		Engine.SetModelValue( Engine.GetModel( f7_local0, "name" ), Engine.GetItemName( f7_local3 ) )
		Engine.SetModelValue( Engine.GetModel( f7_local0, "desc" ), Engine.GetItemDesc( f7_local1 ) )
		Engine.SetModelValue( Engine.GetModel( f7_local0, "image" ), Engine.GetItemImage( f7_local3 ) )
		Engine.SetModelValue( Engine.GetModel( f7_local0, "cost" ), Engine.GetItemCost( f7_local3 ) )
		local f7_local4 = ""
		if f7_local2 then
			f7_local4 = Engine.GetItemDesc( f7_local2 )
		end
		Engine.SetModelValue( Engine.GetModel( f7_local0, "upgdesc" ), f7_local4 )
		Engine.SetModelValue( Engine.GetModel( f7_local0, "purchased" ), Engine.IsItemPurchased( f6_arg1, f7_local1 ) )
	end
	
	for f6_local5, f6_local6 in ipairs( f6_local0 ) do
		f6_local1( f6_local6 )
		f6_local6:processEvent( {
			name = "update_state"
		} )
	end
end

local f0_local3 = function ( f8_arg0, f8_arg1 )
	f0_local0( f8_arg1 )
	f0_local2( f8_arg0, f8_arg1 )
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local1( self, controller )
	self.updateTree = f0_local3

	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		local f10_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "CybercoreAbilityUpgradeTree" )
		if f10_local0 then
			Engine.UnsubscribeAndFreeModel( f10_local0 )
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
	abilityL1:setLeftRight( true, false, 140, 260 )
	abilityL1:setTopBottom( true, false, 222, 342 )
	abilityL1:linkToElementModel( self, "abilityL1", false, function ( model )
		abilityL1:setModel( model, controller )
	end )
	abilityL1:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f21_local0
	end )
	abilityL1:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
	end )
	menu:AddButtonCallbackFunction( abilityL1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		TryPurchaseCybercoreAbility( self, f23_arg0, f23_arg2 )
		return true
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityL1 )
	self.abilityL1 = abilityL1
	
	local abilityL2 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL2:setLeftRight( true, false, 140, 260 )
	abilityL2:setTopBottom( true, false, 364, 484 )
	abilityL2:linkToElementModel( self, "abilityL2", false, function ( model )
		abilityL2:setModel( model, controller )
	end )
	abilityL2:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	abilityL2:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	menu:AddButtonCallbackFunction( abilityL2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		TryPurchaseCybercoreAbility( self, f28_arg0, f28_arg2 )
		return true
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityL2 )
	self.abilityL2 = abilityL2
	
	local abilityL3 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityL3:setLeftRight( true, false, 140, 260 )
	abilityL3:setTopBottom( true, false, 504, 624 )
	abilityL3:linkToElementModel( self, "abilityL3", false, function ( model )
		abilityL3:setModel( model, controller )
	end )
	abilityL3:registerEventHandler( "gain_focus", function ( element, event )
		local f31_local0 = nil
		if element.gainFocus then
			f31_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f31_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f31_local0
	end )
	abilityL3:registerEventHandler( "lose_focus", function ( element, event )
		local f32_local0 = nil
		if element.loseFocus then
			f32_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f32_local0 = element.super:loseFocus( event )
		end
		return f32_local0
	end )
	menu:AddButtonCallbackFunction( abilityL3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		TryPurchaseCybercoreAbility( self, f33_arg0, f33_arg2 )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local f36_local0 = nil
		if element.gainFocus then
			f36_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f36_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f36_local0
	end )
	abilityR1:registerEventHandler( "lose_focus", function ( element, event )
		local f37_local0 = nil
		if element.loseFocus then
			f37_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f37_local0 = element.super:loseFocus( event )
		end
		return f37_local0
	end )
	menu:AddButtonCallbackFunction( abilityR1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		TryPurchaseCybercoreAbility( self, f38_arg0, f38_arg2 )
		return true
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local f41_local0 = nil
		if element.gainFocus then
			f41_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f41_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f41_local0
	end )
	abilityR2:registerEventHandler( "lose_focus", function ( element, event )
		local f42_local0 = nil
		if element.loseFocus then
			f42_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f42_local0 = element.super:loseFocus( event )
		end
		return f42_local0
	end )
	menu:AddButtonCallbackFunction( abilityR2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		TryPurchaseCybercoreAbility( self, f43_arg0, f43_arg2 )
		return true
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityR2 )
	self.abilityR2 = abilityR2
	
	local abilityR3 = CoD.CybercoreUpgradeModelWidget.new( menu, controller )
	abilityR3:setLeftRight( true, false, 424, 544 )
	abilityR3:setTopBottom( true, false, 504, 624 )
	abilityR3:linkToElementModel( self, "abilityR3", false, function ( model )
		abilityR3:setModel( model, controller )
	end )
	abilityR3:registerEventHandler( "gain_focus", function ( element, event )
		local f46_local0 = nil
		if element.gainFocus then
			f46_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f46_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f46_local0
	end )
	abilityR3:registerEventHandler( "lose_focus", function ( element, event )
		local f47_local0 = nil
		if element.loseFocus then
			f47_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f47_local0 = element.super:loseFocus( event )
		end
		return f47_local0
	end )
	menu:AddButtonCallbackFunction( abilityR3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
		TryPurchaseCybercoreAbility( self, f48_arg0, f48_arg2 )
		return true
	end, function ( f49_arg0, f49_arg1, f49_arg2 )
		CoD.Menu.SetButtonLabel( f49_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local f51_local0 = nil
		if element.gainFocus then
			f51_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f51_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f51_local0
	end )
	abilityRoot:registerEventHandler( "lose_focus", function ( element, event )
		local f52_local0 = nil
		if element.loseFocus then
			f52_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f52_local0 = element.super:loseFocus( event )
		end
		return f52_local0
	end )
	menu:AddButtonCallbackFunction( abilityRoot, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
		TryPurchaseCybercoreAbility( self, f53_arg0, f53_arg2 )
		return true
	end, function ( f54_arg0, f54_arg1, f54_arg2 )
		CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( abilityRoot )
	self.abilityRoot = abilityRoot
	
	local rightBranchHeader = CoD.CybercoreBranchHeaderWidget.new( menu, controller )
	rightBranchHeader:setLeftRight( true, false, 424, 544 )
	rightBranchHeader:setTopBottom( true, false, 166.62, 198.62 )
	rightBranchHeader:linkToElementModel( self, "rightBranchHeader", true, function ( model )
		local _rightBranchHeader = Engine.GetModelValue( model )
		if _rightBranchHeader then
			rightBranchHeader.headerText:setText( Engine.Localize( LocalizeToUpperString( _rightBranchHeader ) ) )
		end
	end )
	self:addElement( rightBranchHeader )
	self.rightBranchHeader = rightBranchHeader
	
	local leftBranchHeader = CoD.CybercoreBranchHeaderWidget.new( menu, controller )
	leftBranchHeader:setLeftRight( true, false, 140, 260 )
	leftBranchHeader:setTopBottom( true, false, 166.62, 198.62 )
	leftBranchHeader:linkToElementModel( self, "leftBranchHeader", true, function ( model )
		local _leftBranchHeader = Engine.GetModelValue( model )
		if _leftBranchHeader then
			leftBranchHeader.headerText:setText( Engine.Localize( LocalizeToUpperString( _leftBranchHeader ) ) )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.abilityL1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.nodeLinkLH:close()
		element.nodeLinkL1:close()
		element.nodeLinkL2:close()
		element.nodeLinkL3:close()
		element.nodeLinkRH:close()
		element.nodeLinkR1:close()
		element.nodeLinkR2:close()
		element.nodeLinkR3:close()
		element.abilityL1:close()
		element.abilityL2:close()
		element.abilityL3:close()
		element.abilityR1:close()
		element.abilityR2:close()
		element.abilityR3:close()
		element.abilityRoot:close()
		element.rightBranchHeader:close()
		element.leftBranchHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
