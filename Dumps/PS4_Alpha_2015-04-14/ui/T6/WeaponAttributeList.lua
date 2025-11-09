CoD.WeaponAttributeList = {}
CoD.WeaponAttributeList.AttributeTable = "mp/mp_attributesTable.csv"
CoD.WeaponAttributeList.new = function ( barWidth, defaultAnimationState, attributeTable )
	local self = CoD.AttributeBarList.new( barWidth, defaultAnimationState )
	if attributeTable == nil then
		attributeTable = CoD.WeaponAttributeList.AttributeTable
	end
	self.m_attributeTable = attributeTable
	self.updateWeaponAttributes = CoD.WeaponAttributeList.UpdateWeaponAttributes
	if CoD.isMultiplayer then
		self:addAttributeBar( "mobility", Engine.Localize( "MPUI_FIRE_RATE_CAPS" ), 0, 100 )
	else
		self:addAttributeBar( "mobility", Engine.Localize( "MPUI_MOBILITY_CAPS" ), 0, 100 )
	end
	self:addAttributeBar( "damage", Engine.Localize( "MPUI_DAMAGE_CAPS" ), 0, 100 )
	self:addAttributeBar( "range", Engine.Localize( "MPUI_RANGE_CAPS" ), 0, 100 )
	self:addAttributeBar( "accuracy", Engine.Localize( "MPUI_ACCURACY_CAPS" ), 0, 100 )
	return self
end

CoD.WeaponAttributeList.GetNumOfDashes = function ( totalValue, partValue )
	if totalValue ~= nil then
		local filledDashes = totalValue / partValue
		return filledDashes
	else
		return 0
	end
end

CoD.WeaponAttributeList.UpdateWeaponAttributes = function ( self, weaponItemIndex, attachmentIndex )
	local damageCol = 3
	local rangeCol = 4
	local accuracyCol = 2
	local mobilityCol = 6
	local fireRateCol = 5
	local attributesTable = self.m_attributeTable
	local weaponRef = Engine.GetItemRef( weaponItemIndex )
	local damage = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, weaponRef, damageCol ) ), 5 )
	local range = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, weaponRef, rangeCol ) ), 5 )
	local accuracy = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, weaponRef, accuracyCol ) ), 5 )
	local mobility = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, weaponRef, mobilityCol ) ), 5 )
	local fireRate = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, weaponRef, fireRateCol ) ), 5 )
	if attachmentIndex ~= nil then
		local attachmentRef = Engine.GetAttachmentRef( weaponItemIndex, attachmentIndex )
		local damageMod = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, attachmentRef, 9, weaponRef, damageCol ) ), 5 )
		local rangeMod = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, attachmentRef, 9, weaponRef, rangeCol ) ), 5 )
		local accuracyMod = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, attachmentRef, 9, weaponRef, accuracyCol ) ), 5 )
		local mobilityMod = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, attachmentRef, 9, weaponRef, mobilityCol ) ), 5 )
		local fireRateMod = CoD.WeaponAttributeList.GetNumOfDashes( tonumber( Engine.TableLookup( nil, attributesTable, 1, attachmentRef, 9, weaponRef, fireRateCol ) ), 5 )
		self.attributes.damage.attributeBar:setupDashes( 20, damage, damageMod, 18 )
		self.attributes.range.attributeBar:setupDashes( 20, range, rangeMod, 18 )
		self.attributes.accuracy.attributeBar:setupDashes( 20, accuracy, accuracyMod, 18 )
		self.attributes.mobility.attributeBar:setupDashes( 20, mobility, mobilityMod, 18 )
	else
		self.attributes.damage.attributeBar:setupDashes( 20, damage, 0, 18 )
		self.attributes.range.attributeBar:setupDashes( 20, range, 0, 18 )
		self.attributes.accuracy.attributeBar:setupDashes( 20, accuracy, 0, 18 )
		self.attributes.mobility.attributeBar:setupDashes( 20, mobility, 0, 18 )
	end
end

