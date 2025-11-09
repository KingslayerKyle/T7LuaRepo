local AddWeaponCategory, CreateRestrictWeaponsMenu, WeaponCategorySelected = nil
LUI.createMenu.RestrictPrimaryWeapons = function ( controller )
	CoD.perController[controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.primaryWeapon
	return CreateRestrictWeaponsMenu( "RestrictPrimaryWeapons", controller )
end

LUI.createMenu.RestrictSecondaryWeapons = function ( controller )
	CoD.perController[controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.secondaryWeapon
	return CreateRestrictWeaponsMenu( "RestrictSecondaryWeapons", controller )
end

CreateRestrictWeaponsMenu = function ( menuName, controller )
	local self = CoD.GameOptionsMenu.New( controller, menuName )
	self:setPreviousMenu( "CustomClassGameOptions" )
	local background = LUI.UIImage.new( {
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
	background:setPriority( -100 )
	self:addElement( background )
	if menuName == "RestrictPrimaryWeapons" then
		self:addTitle( Engine.Localize( "MENU_RESTRICT_PRIMARY_WEAPONS_CAPS" ) )
		AddWeaponCategory( self, "weapon_smg" )
		AddWeaponCategory( self, "weapon_assault" )
		AddWeaponCategory( self, "weapon_cqb" )
		AddWeaponCategory( self, "weapon_lmg" )
		AddWeaponCategory( self, "weapon_sniper" )
		AddWeaponCategory( self, "weapon_special" )
	else
		self:addTitle( Engine.Localize( "MENU_RESTRICT_SECONDARY_WEAPONS_CAPS" ) )
		AddWeaponCategory( self, "weapon_pistol" )
		AddWeaponCategory( self, "weapon_launcher" )
		AddWeaponCategory( self, "weapon_special" )
	end
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( LUI.UIButton.GainFocusEvent )
	end
	return self
end

AddWeaponCategory = function ( self, groupName )
	self:registerEventHandler( groupName, WeaponCategorySelected )
	local button = self.buttonList:addButton( Engine.Localize( "MPUI_" .. groupName .. "_CAPS" ) )
	button:setActionEventName( groupName )
	local f4_local0 = CoD.perController
	local f4_local1 = self
	local loadoutSlot = f4_local0[self:getOwner()].loadoutSlot
	local items = CoD.GetUnlockablesByGroupName( groupName )
	for index, itemIndex in ipairs( items ) do
		if Engine.GetLoadoutSlotForItem( itemIndex ) == loadoutSlot and Engine.IsItemIndexRestricted( itemIndex ) ~= Engine.IsItemIndexRestricted( itemIndex, true ) then
			button:showStarIcon( true )
			break
		end
	end
end

WeaponCategorySelected = function ( self, event )
	local groupName = event.name
	self.buttonList:saveState()
	CoD.perController[event.controller].groupName = groupName
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

