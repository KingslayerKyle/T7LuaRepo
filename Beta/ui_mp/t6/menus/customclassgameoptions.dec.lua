require( "ui_mp.T6.GameOptions" )
require( "ui_mp.T6.Menus.RestrictItems" )
require( "ui_mp.T6.Menus.RestrictWeapons" )

local CreateButtons, PopulateButtonList, RestrictAttachments, RestrictBonusCards, RestrictLethals, RestrictPerks1, RestrictPerks2, RestrictPerks3, RestrictPrimaryWeapons, RestrictSecondaryWeapons, RestrictTacticals, SelectorChanged, ShowStarForItems = nil
LUI.createMenu.CustomClassGameOptions = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "CustomClassGameOptions" )
	self:setPreviousMenu( "EditGameOptions" )
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
	self:addTitle( Engine.Localize( "MENU_CUSTOM_CLASSES_CAPS" ) )
	CoD.perController[controller].groupName = nil
	CoD.perController[controller].loadoutSlot = nil
	CreateButtons( self )
	self:registerEventHandler( "restrict_attachments", RestrictAttachments )
	self:registerEventHandler( "restrict_bonus_cards", RestrictBonusCards )
	self:registerEventHandler( "restrict_lethals", RestrictLethals )
	self:registerEventHandler( "restrict_perks1", RestrictPerks1 )
	self:registerEventHandler( "restrict_perks2", RestrictPerks2 )
	self:registerEventHandler( "restrict_perks3", RestrictPerks3 )
	self:registerEventHandler( "restrict_primary_weapons", RestrictPrimaryWeapons )
	self:registerEventHandler( "restrict_secondary_weapons", RestrictSecondaryWeapons )
	self:registerEventHandler( "restrict_tacticals", RestrictTacticals )
	self:registerEventHandler( "selector_changed", SelectorChanged )
	PopulateButtonList( self )
	return self
end

CreateButtons = function ( self )
	local controller = self:getOwner()
	self.disableCACSelector = self:addGametypeSetting( controller, "disableCAC", true )
	self.maxAllocationSelector = self:addGametypeSetting( controller, "maxAllocation", true )
	self.primaryWeaponsButton = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_PRIMARY_WEAPONS_CAPS" ) )
	self.primaryWeaponsButton:setActionEventNameNewStyle( self, controller, "restrict_primary_weapons" )
	ShowStarForItems( self.primaryWeaponsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.primaryWeapon ) )
	self.secondaryWeaponsButton = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SECONDARY_WEAPONS_CAPS" ) )
	self.secondaryWeaponsButton:setActionEventNameNewStyle( self, controller, "restrict_secondary_weapons" )
	ShowStarForItems( self.secondaryWeaponsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.secondaryWeapon ) )
	self.attachmentsButton = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_ATTACHMENTS_CAPS" ) )
	self.attachmentsButton:setActionEventNameNewStyle( self, controller, "restrict_attachments" )
	if CoD.GameOptions.AreAnyAttachmentsRestricted() then
		self.attachmentsButton:showStarIcon( true )
	end
	self.perks1Button = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALTY1_CAPS" ) )
	self.perks1Button:setActionEventNameNewStyle( self, controller, "restrict_perks1" )
	ShowStarForItems( self.perks1Button, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialty1 ) )
	self.perks2Button = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALTY2_CAPS" ) )
	self.perks2Button:setActionEventNameNewStyle( self, controller, "restrict_perks2" )
	ShowStarForItems( self.perks2Button, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialty2 ) )
	self.perks3Button = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALTY3_CAPS" ) )
	self.perks3Button:setActionEventNameNewStyle( self, controller, "restrict_perks3" )
	ShowStarForItems( self.perks3Button, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialty3 ) )
	self.lethalsButton = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_PRIMARYGRENADE_CAPS" ) )
	self.lethalsButton:setActionEventNameNewStyle( self, controller, "restrict_lethals" )
	ShowStarForItems( self.lethalsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.primaryGrenade ) )
	self.tacticalsButton = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_SPECIALGRENADE_CAPS" ) )
	self.tacticalsButton:setActionEventNameNewStyle( self, controller, "restrict_tacticals" )
	ShowStarForItems( self.tacticalsButton, CoD.GetUnlockablesBySlotName( CoD.CACUtility.loadoutSlotNames.specialGrenade ) )
	self.bonusCardsButton = self.buttonList:addButton( Engine.Localize( "MENU_RESTRICT_WILDCARDS_CAPS" ) )
	self.bonusCardsButton:setActionEventNameNewStyle( self, controller, "restrict_bonus_cards" )
	ShowStarForItems( self.bonusCardsButton, CoD.GetUnlockablesByGroupName( "bonuscard" ) )
end

ShowStarForItems = function ( button, items )
	for index, itemIndex in ipairs( items ) do
		if Engine.IsItemIndexRestricted( itemIndex ) ~= Engine.IsItemIndexRestricted( REG6, true ) then
			button:showStarIcon( true )
			return 
		end
	end
end

PopulateButtonList = function ( self )
	self.buttonList:removeAllButtons()
	self.buttonList.hintText:close()
	self.buttonList:addElement( self.disableCACSelector )
	if Engine.GetGametypeSetting( "disableCAC" ) == 0 then
		self.buttonList:addElement( self.maxAllocationSelector )
		self.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
		self.buttonList:addElement( self.primaryWeaponsButton )
		self.buttonList:addElement( self.secondaryWeaponsButton )
		self.buttonList:addElement( self.attachmentsButton )
		self.buttonList:addElement( self.perks1Button )
		self.buttonList:addElement( self.perks2Button )
		self.buttonList:addElement( self.perks3Button )
		self.buttonList:addElement( self.lethalsButton )
		self.buttonList:addElement( self.tacticalsButton )
		self.buttonList:addElement( self.bonusCardsButton )
	end
	LUI.UIVerticalList.UpdateNavigation( self.buttonList )
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( LUI.UIButton.GainFocusEvent )
	end
end

RestrictAttachments = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

RestrictBonusCards = function ( self, event )
	self.buttonList:saveState()
	CoD.perController[event.controller].groupName = "bonuscard"
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

RestrictLethals = function ( self, event )
	self.buttonList:saveState()
	CoD.perController[event.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.primaryGrenade
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

RestrictPerks1 = function ( self, event )
	self.buttonList:saveState()
	CoD.perController[event.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialty1
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

RestrictPerks2 = function ( self, event )
	self.buttonList:saveState()
	CoD.perController[event.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialty2
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

RestrictPerks3 = function ( self, event )
	self.buttonList:saveState()
	CoD.perController[event.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialty3
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

RestrictPrimaryWeapons = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "RestrictPrimaryWeapons", event.controller )
	self:close()
end

RestrictSecondaryWeapons = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "RestrictSecondaryWeapons", event.controller )
	self:close()
end

RestrictTacticals = function ( self, event )
	self.buttonList:saveState()
	CoD.perController[event.controller].loadoutSlot = CoD.CACUtility.loadoutSlotNames.specialGrenade
	self:openMenu( "RestrictItems", event.controller )
	self:close()
end

SelectorChanged = function ( self )
	self.buttonList:saveState()
	if not self.buttonList.lastFocusedElemEvent or self.buttonList.lastFocusedElemEvent.id ~= "LRSelector." .. Engine.Localize( "MENU_MAX_ALLOCATION" ) then
		PopulateButtonList( self )
	end
end

