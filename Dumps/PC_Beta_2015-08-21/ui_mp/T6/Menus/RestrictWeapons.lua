local f0_local0, f0_local1, f0_local2 = nil
LUI.createMenu.RestrictPrimaryWeapons = function ( f1_arg0 )
	CoD.perController[f1_arg0].loadoutSlot = CoD.CACUtility.loadoutSlotNames.primaryWeapon
	return f0_local1( "RestrictPrimaryWeapons", f1_arg0 )
end

LUI.createMenu.RestrictSecondaryWeapons = function ( f2_arg0 )
	CoD.perController[f2_arg0].loadoutSlot = CoD.CACUtility.loadoutSlotNames.secondaryWeapon
	return f0_local1( "RestrictSecondaryWeapons", f2_arg0 )
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = CoD.GameOptionsMenu.New( f3_arg1, f3_arg0 )
	f3_local0:setPreviousMenu( "CustomClassGameOptions" )
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
	f3_local0:addElement( self )
	if f3_arg0 == "RestrictPrimaryWeapons" then
		f3_local0:addTitle( Engine.Localize( "MENU_RESTRICT_PRIMARY_WEAPONS_CAPS" ) )
		f0_local0( f3_local0, "weapon_smg" )
		f0_local0( f3_local0, "weapon_assault" )
		f0_local0( f3_local0, "weapon_cqb" )
		f0_local0( f3_local0, "weapon_lmg" )
		f0_local0( f3_local0, "weapon_sniper" )
		f0_local0( f3_local0, "weapon_special" )
	else
		f3_local0:addTitle( Engine.Localize( "MENU_RESTRICT_SECONDARY_WEAPONS_CAPS" ) )
		f0_local0( f3_local0, "weapon_pistol" )
		f0_local0( f3_local0, "weapon_launcher" )
		f0_local0( f3_local0, "weapon_knife" )
		f0_local0( f3_local0, "weapon_special" )
	end
	if not f3_local0.buttonList:restoreState() then
		f3_local0.buttonList:processEvent( LUI.UIButton.GainFocusEvent )
	end
	return f3_local0
end

f0_local0 = function ( f4_arg0, f4_arg1 )
	f4_arg0:registerEventHandler( f4_arg1, f0_local2 )
	local f4_local0 = f4_arg0.buttonList:addButton( Engine.Localize( "MPUI_" .. f4_arg1 .. "_CAPS" ) )
	f4_local0:setActionEventNameNewStyle( f4_arg0, f4_arg0:getOwner(), f4_arg1 )
	local f4_local1 = CoD.perController
	local f4_local2 = f4_arg0
	f4_local1 = f4_local1[f4_arg0:getOwner()].loadoutSlot
	for f4_local5, f4_local6 in ipairs( CoD.GetUnlockablesByGroupName( f4_arg1 ) ) do
		if Engine.GetLoadoutSlotForItem( f4_local6 ) == f4_local1 and Engine.IsItemIndexRestricted( f4_local6 ) ~= Engine.IsItemIndexRestricted( f4_local6, true ) then
			f4_local0:showStarIcon( true )
			break
		end
	end
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.name
	f5_arg0.buttonList:saveState()
	CoD.perController[f5_arg1.controller].groupName = f5_local0
	f5_arg0:openMenu( "RestrictItems", f5_arg1.controller )
	f5_arg0:close()
end

