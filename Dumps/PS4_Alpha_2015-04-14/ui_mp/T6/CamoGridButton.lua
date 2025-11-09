CoD.CamoGridButton = {}
CoD.CamoGridButton.new = function ( weaponItemIndex, camoNum )
	local self = CoD.ContentGridButton.new( camoNum )
	self.weaponItemIndex = weaponItemIndex
	self.weaponOption = Engine.GetWeaponOptionGroupIndex( camoNum, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
	self.camoNum = camoNum
	self.itemIsOld = true
	CoD.ContentGridButton.SetupButtonText( self, Engine.Localize( Engine.GetWeaponOptionName( self.weaponOption ) ) )
	CoD.CamoGridButton.SetupButtonImages( self, self.weaponOption )
	self:registerEventHandler( "update_class", CoD.CamoGridButton.UpdateClass )
	self.gainFocusSFX = "cac_grid_nav"
	self.actionSFX = "cac_grid_equip_item"
	return self
end

CoD.CamoGridButton.SetupButtonImages = function ( self, weaponOption )
	local imageTopOffset = 2
	local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
	local camoImage = Engine.GetWeaponOptionImage( weaponOption )
	self.camoImageName = camoImage
	self:setImage( camoImage, 0, 0 )
	self.itemImage:setLeftRight( true, true, 8, -8 )
	self.itemImage:setTopBottom( true, true, 8, -bottomTitleHeight - 7 )
	self.itemImage:setPriority( -70 )
	if weaponOption == 0 then
		local imageHeight = CoD.CACCamo.CamoGridItemHeight - bottomTitleHeight - 7 - 8
		self.itemImage:setLeftRight( false, false, -imageHeight / 2, imageHeight / 2 )
	end
	CoD.ContentGridButton.SetupButtonImages( self, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
end

CoD.CamoGridButton.HandleDoubleXpGroups = function ( self )
	if self.doubleXpGroups and self.doubleXpGroups ~= "" and string.find( self.doubleXpGroups, "elite1" ) and Engine.IsEliteAvailable() then
		self.overrideLock = true
		self.customEvent = "locked_elite_camo_selected"
	end
end

CoD.CamoGridButton.UpdateClass = function ( self, event )
	self.selectedFill:setAlpha( 0 )
	self.glowGradFront:setRGB( CoD.GrenadeGridButton.glowFrontColor.r, CoD.GrenadeGridButton.glowFrontColor.g, CoD.RewardGridButton.glowFrontColor.b )
	self.glowGradFront:setAlpha( 0.05 )
	self.currentlyEquipped = false
	if self.contentIndex == event.contentIndex or self.contentIndex == 0 and event.contentIndex == nil then
		self.selectedFill:setAlpha( 0.2 )
		self.glowGradFront:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		self.glowGradFront:setAlpha( 0.2 )
		self.currentlyEquipped = true
	end
	self.showProgressBar = false
	if Engine.IsWeaponOptionNew( event.controller, self.weaponItemIndex, self.weaponOption ) then
		self:setNew( true, event.controller )
	else
		self:setNew( false, event.controller )
	end
	local row, tableNumber = Engine.GetChallengeForItemOption( self.weaponItemIndex, self.weaponOption )
	local isMTX = CoD.CACUtility.IsWeaponOptionMTX( self.weaponOption )
	if not isMTX and row ~= nil then
		local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
		local weaponRef = Engine.GetItemName( self.weaponItemIndex )
		self.challengeValue = Engine.GetItemOptionChallengeValue( event.controller, self.weaponItemIndex, self.weaponOption )
		local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, row, 5 )
		local preReqChallenge = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 7 ) )
		self.maxVal = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 2 ) )
		self.rewardXP = Engine.TableLookupGetColumnValueForRow( tableName, row, 6 )
		self.statsname = Engine.TableLookupGetColumnValueForRow( tableName, row, 4 )
		self.doubleXpGroups = Engine.TableLookupGetColumnValueForRow( tableName, row, 22 )
		self.statType = Engine.TableLookupGetColumnValueForRow( tableName, row, 3 )
		if self.rewardXP == "" then
			self.rewardXP = nil
		end
		local localizedTierText = CoD.GetLocalizedTierText( event.controller, tableName, row )
		local preReqHintString, expertHintString = nil
		if preReqChallenge ~= nil and preReqChallenge > 0 then
			local preReqChallengeMaxValue = tonumber( Engine.TableLookup( event.controller, tableName, 0, preReqChallenge, 2 ) )
			local preReqChallengeValue = Engine.GetPreReqChallengeValue( event.controller, self.weaponItemIndex, preReqChallenge )
			if preReqChallengeValue ~= nil and preReqChallengeValue < preReqChallengeMaxValue then
				local camoUnlockedByPreReq = Engine.TableLookup( event.controller, tableName, 0, preReqChallenge, 9 )
				local camoNameString = Engine.TableLookup( nil, CoD.attachmentTable, 4, camoUnlockedByPreReq, 3 )
				preReqHintString = Engine.Localize( "MPUI_CAMO_PREREQ", "", Engine.Localize( camoNameString ), localizedTierText )
			end
		end
		if self.statsname == "challenges" then
			if self.statType and self.statType == "group" then
				local weaponGroupName = Engine.Localize( "MPUI_" .. Engine.GetItemGroup( self.weaponItemIndex ) .. "_WITH_S" )
				expertHintString = Engine.Localize( "CHALLENGE_MASTERY_EXPERT_GROUP_DESC", "", weaponGroupName, localizedTierText )
			else
				expertHintString = Engine.Localize( "CHALLENGE_MASTERY_EXPERT_DESC", "", weaponRef, localizedTierText )
			end
		end
		if self.statsname ~= "digital_unlock" and (Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) or Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK )) then
			self:setHintText( "" )
			self.showProgressBar = false
			return 
		end
		local isCamoLocked = nil
		if preReqHintString ~= nil then
			self:setHintText( preReqHintString )
			self:setLocked( true )
			isCamoLocked = true
			self.showProgressBar = false
		else
			local itemOptionLocked = Engine.GetItemOptionLocked( event.controller, self.weaponItemIndex, self.weaponOption )
			if self.challengeValue ~= nil and self.maxVal <= self.challengeValue and not itemOptionLocked then
				self:setHintText( Engine.Localize( "MPUI_CAMO_UNLOCKED" ) )
			elseif self.challengeValue then
				self:setLocked( true )
				isCamoLocked = true
				self.showProgressBar = true
			elseif itemOptionLocked then
				self:setLocked( true )
				isCamoLocked = true
			end
			if expertHintString ~= nil then
				self:setHintText( expertHintString )
				self.showProgressBar = false
			else
				self:setHintText( Engine.Localize( challengeString .. "_DESC", self.maxVal, weaponRef, "" ) )
			end
		end
		if not event.challengeMenu and isCamoLocked and CoD.IsLeagueOrCustomMatch() and self.statsname ~= "digital_unlock" then
			self:setHintText( Engine.Localize( "MENU_CAMO_LOCKED_NON_PUBLIC" ) )
			self.showProgressBar = false
		end
		CoD.CamoGridButton.HandleDoubleXpGroups( self )
	elseif isMTX then
		local camoMTXName = CoD.CACUtility.GetWeaponOptionMTXName( self.weaponOption )
		local camoPurchased = Engine.HasMTX( event.controller, camoMTXName )
		CoD.ContentGridButton.SetMTXPurchased( self, camoPurchased, event.controller )
		self:setHintText( Engine.Localize( "MPUI_MTX_PURCHASE_HINT", Engine.Localize( "MPUI_" .. camoMTXName ) ) )
		if camoPurchased then
			self:setActionPromptString( Engine.Localize( "MENU_SELECT" ) )
		else
			self:setActionPromptString( Engine.Localize( "MENU_PURCHASE" ) )
		end
	end
end

