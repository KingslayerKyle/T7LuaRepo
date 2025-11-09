CoD.ReticlesGridButton = {}
CoD.ReticlesGridButton.new = function ( reticleIndex, attachmentRef, eAttachment )
	local weaponOption = Engine.GetWeaponOptionGroupIndex( reticleIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE )
	local self = CoD.ContentGridButton.new( reticleIndex )
	self.itemIsOld = true
	self.reticleIndex = reticleIndex
	self.weaponOption = weaponOption
	self.attachmentRef = attachmentRef
	self.dualOpticReticle = attachmentRef == "dualoptic"
	self.eAttachment = eAttachment
	CoD.ContentGridButton.SetupButtonText( self, Engine.Localize( "MPUI_RETICLE_" .. attachmentRef .. "_" .. reticleIndex ) )
	CoD.ReticlesGridButton.SetupButtonImages( self, attachmentRef, reticleIndex, self.dualOpticReticle )
	self:registerEventHandler( "update_class", CoD.ReticlesGridButton.UpdateClass )
	self.gainFocusSFX = "cac_grid_nav"
	self.actionSFX = "cac_grid_equip_item"
	return self
end

CoD.ReticlesGridButton.SetupButtonImages = function ( self, attachmentRef, reticleIndex, dualOpticReticle )
	local reticleSize = 32
	local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
	local imageAreaHeight = CoD.CACCamo.CamoGridItemHeight - bottomTitleHeight
	local topOffset = imageAreaHeight / 2 + 4
	local reticleImageName = attachmentRef .. "_" .. reticleIndex
	self.reticleImageName = reticleImageName
	self:setImage( reticleImageName, 0, 0 )
	self.itemImage:setLeftRight( false, false, -reticleSize / 2, reticleSize / 2 )
	self.itemImage:setTopBottom( true, false, topOffset - reticleSize / 2, topOffset + reticleSize / 2 )
	self.itemImage:setPriority( -70 )
	if dualOpticReticle then
		self.itemImage:hide()
		local spacing = 20
		self.image1MaterialName = "reflex_" .. reticleIndex
		self.image2MaterialName = "acog_" .. reticleIndex
		if reticleIndex == 0 then
			self.image1MaterialName = "dualoptic_up_0"
			self.image2MaterialName = "dualoptic_down_0"
		elseif reticleIndex == 9 then
			self.image1MaterialName = "dualoptic_up_9"
			self.image2MaterialName = "dualoptic_down_9"
		end
		self.itemImage1 = LUI.UIImage.new()
		self.itemImage1:setLeftRight( false, false, -spacing / 2 - reticleSize, -spacing / 2 )
		self.itemImage1:setTopBottom( true, false, topOffset - reticleSize / 2, topOffset + reticleSize / 2 )
		self.itemImage1:setImage( RegisterMaterial( self.image1MaterialName ) )
		self:addElement( self.itemImage1 )
		self.itemImage2 = LUI.UIImage.new()
		self.itemImage2:setLeftRight( false, false, spacing / 2, spacing / 2 + reticleSize )
		self.itemImage2:setTopBottom( true, false, topOffset - reticleSize / 2, topOffset + reticleSize / 2 )
		self.itemImage2:setImage( RegisterMaterial( self.image2MaterialName ) )
		self:addElement( self.itemImage2 )
		self.itemImage1:setPriority( -80 )
		self.itemImage2:setPriority( -90 )
	end
	CoD.ContentGridButton.SetupButtonImages( self, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
end

CoD.ReticlesGridButton.UpdateClass = function ( self, event )
	self.selectedFill:setAlpha( 0 )
	self.glowGradFront:setRGB( CoD.GrenadeGridButton.glowFrontColor.r, CoD.GrenadeGridButton.glowFrontColor.g, CoD.RewardGridButton.glowFrontColor.b )
	self.glowGradFront:setAlpha( 0.05 )
	self.currentlyEquipped = false
	if not (event.equippedWeaponOption ~= nil or self.reticleIndex ~= 0) or event.equippedWeaponOption == self.weaponOption then
		self.selectedFill:setAlpha( 0.2 )
		self.glowGradFront:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		self.glowGradFront:setAlpha( 0.2 )
		if event.equippedWeaponOption == self.weaponOption then
			self.currentlyEquipped = true
			CoD.perController[event.controller].currentlyEquippedReticleImage = self.reticleImageName
			if self.dualOpticReticle then
				CoD.perController[event.controller].currentlyEquippedReticleImage1 = self.image1MaterialName
				CoD.perController[event.controller].currentlyEquippedReticleImage2 = self.image2MaterialName
			end
		end
	end
	if Engine.IsWeaponOptionNew( event.controller, self.eAttachment, self.weaponOption ) then
		self:setNew( true, event.controller )
	else
		self:setNew( false, event.controller )
	end
	local row, tableNumber = Engine.GetChallengeForItemOption( Engine.GetItemAttachment( self.weaponItemIndex, self.attachmentIndex ), self.weaponOption )
	local f3_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN )
	if not f3_local0 then
		local isOffline = Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK )
	end
	local isMTX = CoD.CACUtility.IsWeaponOptionMTX( self.weaponOption )
	if not f3_local0 and not isMTX and row ~= nil then
		local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
		local weaponRef = Engine.GetAttachmentNameByIndex( self.attachmentIndex )
		local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, row, 5 )
		local preReqChallenge = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 7 ) )
		self.maxVal = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 2 ) )
		self.xpReward = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 6 ) )
		self.statsname = Engine.TableLookupGetColumnValueForRow( tableName, row, 4 )
		self.hintText = Engine.Localize( challengeString .. "_DESC", self.maxVal, weaponRef )
		self.challengeValue = Engine.GetItemOptionChallengeValue( event.controller, Engine.GetItemAttachment( self.weaponItemIndex, self.attachmentIndex ), self.weaponOption )
		local preReqHintString = nil
		if preReqChallenge ~= nil and preReqChallenge > 0 then
			local preReqChallengeMaxValue = tonumber( Engine.TableLookup( event.controller, tableName, 0, preReqChallenge, 2 ) )
			local preReqChallengeValue = Engine.GetPreReqChallengeValue( event.controller, Engine.GetItemAttachment( self.weaponItemIndex, self.attachmentIndex ), preReqChallenge )
			if preReqChallengeValue ~= nil and preReqChallengeValue < preReqChallengeMaxValue then
				local reticleUnlockedByPreReq = Engine.TableLookup( event.controller, tableName, 0, preReqChallenge, 9 )
				local reticleIndexOfPreReqReticle = string.gsub( reticleUnlockedByPreReq, "reticle_", "" )
				preReqHintString = Engine.Localize( "MPUI_RETICLE_PREREQ", "", Engine.Localize( "MPUI_RETICLE_" .. self.attachmentRef .. "_" .. reticleIndexOfPreReqReticle ), "" )
			end
		end
		local isReticleLocked = nil
		if preReqHintString then
			self.hintText = preReqHintString
			self:setLocked( true )
			isReticleLocked = true
			self.showProgressBar = false
		else
			self.showProgressBar = true
			if self.challengeValue and self.maxVal and self.challengeValue < self.maxVal then
				isReticleLocked = true
				self:setLocked( true )
			else
				self:setLocked( false )
				self.showProgressBar = false
			end
		end
		if isReticleLocked and CoD.IsLeagueOrCustomMatch() then
			self:setHintText( Engine.Localize( "MENU_RETICLE_LOCKED_NON_PUBLIC" ) )
			self.showProgressBar = false
		end
		if self.dualOpticReticle and self.lockImage then
			self.itemImage1:hide()
			self.itemImage2:hide()
		end
	elseif isMTX then
		local reticleMTXName = CoD.CACUtility.GetWeaponOptionMTXName( self.weaponOption )
		local reticlePurchased = Engine.HasMTX( event.controller, reticleMTXName )
		CoD.ContentGridButton.SetMTXPurchased( self, reticlePurchased, controller )
		self:setHintText( Engine.Localize( "MPUI_MTX_PURCHASE_HINT", Engine.Localize( "MPUI_" .. reticleMTXName ) ) )
		if reticlePurchased then
			self:setActionPromptString( Engine.Localize( "MENU_SELECT" ) )
		else
			self:setActionPromptString( Engine.Localize( "MENU_PURCHASE" ) )
		end
	end
end

