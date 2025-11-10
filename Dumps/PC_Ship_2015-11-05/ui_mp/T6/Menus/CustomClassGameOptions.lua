require( "ui_mp.T6.GameOptions" )
require( "ui_mp.T6.Menus.RestrictItems" )
require( "ui_mp.T6.Menus.RestrictWeapons" )

local f0_local0, f0_local1, f0_local2, f0_local3, f0_local4, f0_local5, f0_local6, f0_local7, f0_local8, f0_local9, f0_local10, f0_local11, f0_local12 = nil
LUI.createMenu.CustomClassGameOptions = function ( f1_arg0 )
	local f1_local0 = CoD.GameOptionsMenu.New( f1_arg0, "CustomClassGameOptions" )
	f1_local0:setPreviousMenu( "EditGameOptions" )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:setPriority( -100 )
	f1_local0:addElement( self )
	f1_local0:addTitle( Engine.Localize( "MENU_CUSTOM_CLASSES_CAPS" ) )
	CoD.perController[f1_arg0].groupName = nil
	CoD.perController[f1_arg0].loadoutSlot = nil
	f0_local0( f1_local0 )
	f1_local0:registerEventHandler( "restrict_attachments", f0_local2 )
	f1_local0:registerEventHandler( "restrict_bonus_cards", f0_local3 )
	f1_local0:registerEventHandler( "restrict_lethals", f0_local4 )
	f1_local0:registerEventHandler( "restrict_perks1", f0_local5 )
	f1_local0:registerEventHandler( "restrict_perks2", f0_local6 )
	f1_local0:registerEventHandler( "restrict_perks3", f0_local7 )
	f1_local0:registerEventHandler( "restrict_primary_weapons", f0_local8 )
	f1_local0:registerEventHandler( "restrict_secondary_weapons", f0_local9 )
	f1_local0:registerEventHandler( "restrict_tacticals", f0_local10 )
	f1_local0:registerEventHandler( "selector_changed", f0_local11 )
	f0_local1( f1_local0 )
	return f1_local0
end

f0_local0 = function ( f2_arg0 )
	local f2_local0 = f2_arg0:getOwner()
	f2_arg0.disableCACSelector = f2_arg0:addGametypeSetting( f2_local0, "disableCAC", true )
	f2_arg0.maxAllocationSelector = f2_arg0:addGametypeSetting( f2_local0, "maxAllocation", true )
	f2_arg0.primaryWeaponsButton = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_PRIMARY_WEAPONS_CAPS" ) )
	f2_arg0.primaryWeaponsButton:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_primary_weapons" )
	f0_local12( f2_arg0.primaryWeaponsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.primaryWeapon ) )
	f2_arg0.secondaryWeaponsButton = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SECONDARY_WEAPONS_CAPS" ) )
	f2_arg0.secondaryWeaponsButton:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_secondary_weapons" )
	f0_local12( f2_arg0.secondaryWeaponsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.secondaryWeapon ) )
	f2_arg0.attachmentsButton = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_ATTACHMENTS_CAPS" ) )
	f2_arg0.attachmentsButton:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_attachments" )
	if CoD.GameOptions.AreAnyAttachmentsRestricted() then
		f2_arg0.attachmentsButton:showStarIcon( true )
	end
	f2_arg0.perks1Button = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALTY1_CAPS" ) )
	f2_arg0.perks1Button:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_perks1" )
	f0_local12( f2_arg0.perks1Button, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialty1 ) )
	f2_arg0.perks2Button = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALTY2_CAPS" ) )
	f2_arg0.perks2Button:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_perks2" )
	f0_local12( f2_arg0.perks2Button, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialty2 ) )
	f2_arg0.perks3Button = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALTY3_CAPS" ) )
	f2_arg0.perks3Button:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_perks3" )
	f0_local12( f2_arg0.perks3Button, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialty3 ) )
	f2_arg0.lethalsButton = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_PRIMARYGRENADE_CAPS" ) )
	f2_arg0.lethalsButton:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_lethals" )
	f0_local12( f2_arg0.lethalsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.primaryGrenade ) )
	f2_arg0.tacticalsButton = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALGRENADE_CAPS" ) )
	f2_arg0.tacticalsButton:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_tacticals" )
	f0_local12( f2_arg0.tacticalsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialGrenade ) )
	f2_arg0.bonusCardsButton = f2_arg0.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_WILDCARDS_CAPS" ) )
	f2_arg0.bonusCardsButton:setActionEventNameNewStyle( f2_arg0, f2_local0, "restrict_bonus_cards" )
	f0_local12( f2_arg0.bonusCardsButton, CoD.GetUnlockablesByGroupName( "bonuscard" ) )
end

f0_local12 = function ( f3_arg0, f3_arg1 )
	for f3_local3, f3_local4 in ipairs( f3_arg1 ) do
		if Engine.IsItemIndexRestricted( f3_local4 ) ~= Engine.IsItemIndexRestricted( f3_local4, true ) then
			f3_arg0:showStarIcon( true )
			return 
		end
	end
end

f0_local1 = function ( f4_arg0 )
	f4_arg0.buttonList:removeAllButtons()
	f4_arg0.buttonList.hintText:close()
	f4_arg0.buttonList:addElement( f4_arg0.disableCACSelector )
	if Engine.GetGametypeSetting( "disableCAC" ) == 0 then
		f4_arg0.buttonList:addElement( f4_arg0.maxAllocationSelector )
		f4_arg0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
		f4_arg0.buttonList:addElement( f4_arg0.primaryWeaponsButton )
		f4_arg0.buttonList:addElement( f4_arg0.secondaryWeaponsButton )
		f4_arg0.buttonList:addElement( f4_arg0.attachmentsButton )
		f4_arg0.buttonList:addElement( f4_arg0.perks1Button )
		f4_arg0.buttonList:addElement( f4_arg0.perks2Button )
		f4_arg0.buttonList:addElement( f4_arg0.perks3Button )
		f4_arg0.buttonList:addElement( f4_arg0.lethalsButton )
		f4_arg0.buttonList:addElement( f4_arg0.tacticalsButton )
		f4_arg0.buttonList:addElement( f4_arg0.bonusCardsButton )
	end
	LUI.UIVerticalList.UpdateNavigation( f4_arg0.buttonList )
	if not f4_arg0.buttonList:restoreState() then
		f4_arg0.buttonList:processEvent( LUI.UIButton.GainFocusEvent )
	end
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	f5_arg0.buttonList:saveState()
	f5_arg0:openMenu( "RestrictItems", f5_arg1.controller )
	f5_arg0:close()
end

f0_local3 = function ( f6_arg0, f6_arg1 )
	f6_arg0.buttonList:saveState()
	CoD.perController[f6_arg1.controller].groupName = "bonuscard"
	f6_arg0:openMenu( "RestrictItems", f6_arg1.controller )
	f6_arg0:close()
end

f0_local4 = function ( f7_arg0, f7_arg1 )
	f7_arg0.buttonList:saveState()
	CoD.perController[f7_arg1.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.primaryGrenade
	f7_arg0:openMenu( "RestrictItems", f7_arg1.controller )
	f7_arg0:close()
end

f0_local5 = function ( f8_arg0, f8_arg1 )
	f8_arg0.buttonList:saveState()
	CoD.perController[f8_arg1.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialty1
	f8_arg0:openMenu( "RestrictItems", f8_arg1.controller )
	f8_arg0:close()
end

f0_local6 = function ( f9_arg0, f9_arg1 )
	f9_arg0.buttonList:saveState()
	CoD.perController[f9_arg1.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialty2
	f9_arg0:openMenu( "RestrictItems", f9_arg1.controller )
	f9_arg0:close()
end

f0_local7 = function ( f10_arg0, f10_arg1 )
	f10_arg0.buttonList:saveState()
	CoD.perController[f10_arg1.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialty3
	f10_arg0:openMenu( "RestrictItems", f10_arg1.controller )
	f10_arg0:close()
end

f0_local8 = function ( f11_arg0, f11_arg1 )
	f11_arg0.buttonList:saveState()
	f11_arg0:openMenu( "RestrictPrimaryWeapons", f11_arg1.controller )
	f11_arg0:close()
end

f0_local9 = function ( f12_arg0, f12_arg1 )
	f12_arg0.buttonList:saveState()
	f12_arg0:openMenu( "RestrictSecondaryWeapons", f12_arg1.controller )
	f12_arg0:close()
end

f0_local10 = function ( f13_arg0, f13_arg1 )
	f13_arg0.buttonList:saveState()
	CoD.perController[f13_arg1.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialGrenade
	f13_arg0:openMenu( "RestrictItems", f13_arg1.controller )
	f13_arg0:close()
end

f0_local11 = function ( f14_arg0 )
	f14_arg0.buttonList:saveState()
	if not f14_arg0.buttonList.lastFocusedElemEvent or f14_arg0.buttonList.lastFocusedElemEvent.id ~= "LRSelector." .. Engine.Localize( "MENU_MAX_ALLOCATION" ) then
		f0_local1( f14_arg0 )
	end
end

