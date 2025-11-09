CoD.GrenadeGridButton = {}
CoD.GrenadeGridButton.glowBackColor = {}
CoD.GrenadeGridButton.glowBackColor.r = 1
CoD.GrenadeGridButton.glowBackColor.g = 1
CoD.GrenadeGridButton.glowBackColor.b = 1
CoD.GrenadeGridButton.glowFrontColor = {}
CoD.GrenadeGridButton.glowFrontColor.r = 1
CoD.GrenadeGridButton.glowFrontColor.g = 1
CoD.GrenadeGridButton.glowFrontColor.b = 1
CoD.GrenadeGridButton.new = function ( grenadeIndex )
	local self = CoD.ContentGridButton.new( grenadeIndex )
	self.statIndex = grenadeIndex
	CoD.ContentGridButton.SetupButtonText( self, Engine.Localize( Engine.GetItemName( grenadeIndex ) ) )
	CoD.GrenadeGridButton.SetupButtonImages( self, Engine.GetItemImage( grenadeIndex ) )
	self:setRestrictedImage( Engine.IsItemIndexRestricted( grenadeIndex ) )
	self:registerEventHandler( "update_class", CoD.GrenadeGridButton.UpdateClass )
	self.actionSFX = "cac_equipment_add"
	return self
end

CoD.GrenadeGridButton.SetupButtonImages = function ( self, grenadeImage )
	local imageHeight = 75
	local imageWidth = imageHeight
	local imageTopOffset = 15
	self:setImage( grenadeImage .. "_256", imageWidth, imageHeight )
	self.itemImage:setTopBottom( true, false, imageTopOffset, imageTopOffset + imageHeight )
	self.itemImage:setPriority( -70 )
	CoD.ContentGridButton.SetupButtonImages( self, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
end

CoD.GrenadeGridButton.UpdateClass = function ( self, event )
	local controller = event.controller
	local classNum = event.classNum
	local currentlySelectedGrenade, otherGrenadeSlot = nil
	if CoD.perController[controller].grenadeSlot == CoD.CACUtility.loadoutSlotNames.primaryGrenade then
		otherGrenadeSlot = CoD.CACUtility.loadoutSlotNames.specialGrenade
	else
		otherGrenadeSlot = CoD.CACUtility.loadoutSlotNames.primaryGrenade
	end
	currentlySelectedGrenade = CoD.GetClassItem( controller, classNum, otherGrenadeSlot )
	if Engine.IsItemNew( controller, self.statIndex ) then
		self:setNew( true, controller )
	else
		self:setNew( false, controller )
	end
	self:setHintText( nil )
	if self.contentIndex == currentlySelectedGrenade then
		self:setInUseFill()
	end
	if Engine.IsItemLocked( controller, self.contentIndex ) then
		self:setLocked( true, controller, true )
	else
		self:setLocked( false )
		if Engine.IsItemPurchased( controller, self.contentIndex ) then
			self:setPurchased( true )
		else
			self:setPurchased( false )
		end
	end
	if self.mutuallyExclusiveIcon == nil and self.lockImage == nil and self.tokenImage == nil then
		self:setHintText( nil )
	end
end

