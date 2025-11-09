CoD.ConfirmWeaponPrestige = {}
CoD.MAX_WEAPON_PRESTIGE = 2
local Confirm_Button_Back = function ( self, event )
	CoD.perController[event.controller].weaponPrestigeItemIndex = nil
	self:goBack()
end

local Confirm_Button_WeaponPrestigeAction = function ( self, event )
	local playerStats = CoD.GetPlayerStats( event.controller )
	local itemIndex = CoD.perController[event.controller].weaponPrestigeItemIndex
	local currentWeapon = playerStats.itemStats[itemIndex]
	local currentWeaponPLevel = currentWeapon.pLevel:get()
	if currentWeaponPLevel < CoD.MAX_WEAPON_PRESTIGE then
		currentWeapon.xp:set( 0 )
		currentWeapon.pLevel:set( currentWeaponPLevel + 1 )
		for classNum = 0, 9, 1 do
			for attachmentSlotIndex = 0, 2, 1 do
				if Engine.GetClassItem( event.controller, classNum, "primary" ) == itemIndex then
					Engine.SetClassItem( event.controller, classNum, "primaryattachment" .. attachmentSlotIndex + 1, 0 )
				end
				if Engine.GetClassItem( event.controller, classNum, "secondary" ) == itemIndex then
					Engine.SetClassItem( event.controller, classNum, "secondaryattachment" .. attachmentSlotIndex + 1, 0 )
				end
			end
		end
	else
		currentWeapon.pLevel:set( CoD.MAX_WEAPON_PRESTIGE )
	end
	if self.occludedMenu and self.occludedMenu.weaponLevel then
		self.occludedMenu.weaponLevel:update( event.controller, itemIndex )
	end
	Confirm_Button_Back( self, event )
end

LUI.createMenu.ConfirmWeaponPrestige = function ( controller )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	end
	local confirmMenu = CoD.Popup.SetupPopupChoice( "ConfirmWeaponPrestige", controller )
	confirmMenu:addBackButton()
	confirmMenu:registerEventHandler( "weapon_prestige_action", Confirm_Button_WeaponPrestigeAction )
	confirmMenu:registerEventHandler( "menu_changed", CoD.Menu.MenuChanged )
	local itemIndex = CoD.perController[controller].weaponPrestigeItemIndex
	local currentWeaponLevel = CoD.WeaponLevel.GetWeaponLevel( controller, itemIndex )
	local currentWeaponPLevel = CoD.WeaponLevel.GetWeaponPLevel( controller, itemIndex )
	local numAttachmentsForWeapon = 0
	local msgText = ""
	if itemIndex ~= nil then
		numAttachmentsForWeapon = Engine.GetNumItemAttachmentsWithAttachPoint( itemIndex, 0 ) - 1
	end
	if numAttachmentsForWeapon < 0 then
		numAttachmentsForWeapon = 0
	end
	confirmMenu.title:setText( Engine.Localize( "MPUI_CONFIRM_WEAPON_PRESTIGE" ) )
	if currentWeaponPLevel == 0 then
		if numAttachmentsForWeapon > 0 then
			msgText = Engine.Localize( "MPUI_CONFIRM_WEAPON_PRESTIGE_DESC", currentWeaponLevel, currentWeaponPLevel + 1 )
		else
			msgText = Engine.Localize( "MPUI_CONFIRM_WEAPON_PRESTIGE_DESC_SPECIALS", currentWeaponLevel, currentWeaponPLevel + 1 )
		end
	elseif numAttachmentsForWeapon > 0 then
		msgText = Engine.Localize( "MPUI_CONFIRM_WEAPON_PRESTIGE_DESC2", currentWeaponLevel, currentWeaponPLevel, currentWeaponPLevel + 1 )
	else
		msgText = Engine.Localize( "MPUI_CONFIRM_WEAPON_PRESTIGE_DESC2_SPECIALS", currentWeaponLevel, currentWeaponPLevel, currentWeaponPLevel + 1 )
	end
	confirmMenu.msg:setText( msgText )
	confirmMenu.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	confirmMenu.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	confirmMenu.choiceA:setActionEventName( "weapon_prestige_action" )
	confirmMenu.choiceB:processEvent( {
		name = "gain_focus"
	} )
	return confirmMenu
end

CoD.ConfirmWeaponPrestige.OpenIfNecessary = function ( self, controller, itemIndex )
	local currentWeaponLevel = CoD.WeaponLevel.GetWeaponLevel( controller, itemIndex )
	if currentWeaponLevel and CoD.WeaponLevel.GetWeaponPLevel( controller, itemIndex ) < CoD.MAX_WEAPON_PRESTIGE then
		CoD.perController[controller].weaponPrestigeItemIndex = itemIndex
		local ConfirmPrestigeUnlockPopup = self:openPopup( "ConfirmWeaponPrestige", controller )
		return ConfirmPrestigeUnlockPopup
	else
		
	end
end

