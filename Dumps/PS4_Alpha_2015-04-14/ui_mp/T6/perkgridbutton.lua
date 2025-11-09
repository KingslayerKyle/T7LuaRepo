CoD.PerkGridButton = {}
CoD.PerkGridButton.glowBackColors = {}
CoD.PerkGridButton.glowFrontColors = {}
CoD.PerkGridButton.new = function ( perkIndex, perkCategory )
	local self = CoD.ContentGridButton.new( perkIndex )
	self.statIndex = perkIndex
	CoD.ContentGridButton.SetupButtonText( self, Engine.Localize( Engine.GetItemName( perkIndex ) ) )
	CoD.PerkGridButton.SetupButtonImages( self, Engine.GetItemImage( perkIndex ), perkCategory )
	self:setRestrictedImage( Engine.IsItemIndexRestricted( perkIndex ) )
	self:registerEventHandler( "update_class", CoD.PerkGridButton.UpdateClass )
	return self
end

CoD.PerkGridButton.SetupButtonImages = function ( self, perkImage, perkCategory )
	local imageHeight = 100
	local imageWidth = imageHeight
	local imageTopOffset = 2
	self:setImage( perkImage .. "_256", imageWidth, imageHeight )
	self.itemImage:setTopBottom( true, false, imageTopOffset, imageTopOffset + imageHeight )
	self.itemImage:setPriority( -70 )
	CoD.ContentGridButton.SetupButtonImages( self, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
end

CoD.PerkGridButton.UpdateClass = function ( self, event )
	local controller = event.controller
	local classNum = event.classNum
	local currentSelectedPerks = {}
	for f3_local0 = CoD.perController[controller].perkCategory, CoD.CACUtility.maxSpecialtySlots, 3 do
		table.insert( currentSelectedPerks, CoD.GetClassItem( controller, classNum, CoD.CACUtility.loadoutSlotNames["specialty" .. f3_local0] ) )
	end
	for index, itemIndex in ipairs( currentSelectedPerks ) do
		if index ~= CoD.perController[controller].slotIndex and self.contentIndex == itemIndex then
			self:setInUseFill()
			break
		end
	end
	if Engine.IsItemNew( controller, self.statIndex ) then
		self:setNew( true )
	else
		self:setNew( false )
	end
	if Engine.IsItemLocked( controller, self.statIndex ) then
		self:setLocked( true, controller, true )
	else
		self:setLocked( false )
		if Engine.IsItemPurchased( controller, self.statIndex ) then
			self:setPurchased( true )
		else
			self:setPurchased( false )
		end
	end
	if self.mutuallyExclusiveIcon == nil and self.lockImage == nil and self.tokenImage == nil then
		self:setHintText( nil )
	end
end

