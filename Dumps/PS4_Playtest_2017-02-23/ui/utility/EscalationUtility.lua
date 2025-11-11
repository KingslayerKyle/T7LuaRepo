CoD.EscalationUtility = {}
CoD.EscalationUtility.SLOT_LEVEL_LOCKED = 0
CoD.EscalationUtility.SLOT_LEVEL_CAN_EQUIP_FOR_FREE = 1
CoD.EscalationUtility.SLOT_LEVEL_EQUIPPED = 2
CoD.EscalationUtility.START_LEVEL = 1
CoD.EscalationUtility.GetPlayerLevel = function ( controller )
	local f1_local0 = Engine.GetModelForController( controller )
	local playerLevelModel = f1_local0["hudItems.lplevel.level"]
	if playerLevelModel then
		return playerLevelModel:get() + 1
	else
		return CoD.EscalationUtility.START_LEVEL
	end
end

CoD.EscalationUtility.GetMaxLevel = function ()
	return tonumber( Engine.TableLookup( CoD.levelPointTable, 1, 0, "maxlevel" ) ) + 1
end

CoD.EscalationUtility.IsSlotLocked = function ( self, controller )
	local itemUnlockLevelModel = self:getModel( controller, "unlockLevel" )
	if itemUnlockLevelModel then
		local playerLevel = CoD.EscalationUtility.GetPlayerLevel( controller )
		local itemUnlockLevel = itemUnlockLevelModel:get()
		return playerLevel < itemUnlockLevel
	else
		return false
	end
end

CoD.EscalationUtility.IsSlotEquipped = function ( self, controller )
	return IsSelfModelValueEqualTo( self, nil, "level", CoD.EscalationUtility.SLOT_LEVEL_EQUIPPED )
end

CoD.EscalationUtility.IsSlotEquippableForFree = function ( self, controller )
	return IsSelfModelValueEqualTo( self, nil, "level", CoD.EscalationUtility.SLOT_LEVEL_CAN_EQUIP_FOR_FREE )
end

CoD.EscalationUtility.IsSlotPurchasableOrLocked = function ( self, controller )
	return IsSelfModelValueEqualTo( self, nil, "level", CoD.EscalationUtility.SLOT_LEVEL_LOCKED ) and IsSelfModelValueGreaterThan( self, nil, "itemIndex", CoD.CACUtility.EmptyItemIndex )
end

CoD.EscalationUtility.AnyTokensAvailable = function ( controller )
	return IsModelValueGreaterThan( controller, "hudItems.lplevel.unlockTokens", 0 )
end

CoD.EscalationUtility.IsMaxLevel = function ( controller )
	local playerLevel = CoD.EscalationUtility.GetPlayerLevel( controller )
	return CoD.EscalationUtility.GetMaxLevel() <= playerLevel
end

CoD.EscalationUtility.IsCustomizeEsclationButtonHiddenInGame = function ( controller )
	local f9_local0
	if IsInPrematchPeriod( controller ) then
		f9_local0 = not IsModelValueGreaterThan( controller, "PositionDraft.isEscalationWheelFocusCounter", 0 )
	else
		f9_local0 = true
	end
	return f9_local0
end

