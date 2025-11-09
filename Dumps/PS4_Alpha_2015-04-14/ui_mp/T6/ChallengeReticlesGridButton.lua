CoD.ChallengeReticlesGridButton = {}
CoD.ChallengeReticlesGridButton.new = function ( controller, reticleIndex, attachmentRef, attachmentIndex )
	local weaponOption = Engine.GetWeaponOptionGroupIndex( reticleIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE )
	local self = CoD.ContentGridButton.new( reticleIndex )
	self.reticleIndex = reticleIndex
	self.weaponOption = weaponOption
	self.attachmentRef = attachmentRef
	self.attachmentIndex = attachmentIndex
	self.dualOpticReticle = attachmentRef == "dualoptic"
	CoD.ContentGridButton.SetupButtonText( self, Engine.Localize( "MPUI_RETICLE_" .. attachmentRef .. "_" .. reticleIndex ) )
	CoD.ReticlesGridButton.SetupButtonImages( self, attachmentRef, reticleIndex, self.dualOpticReticle )
	self.gainFocusSFX = "cac_grid_nav"
	CoD.ChallengeReticlesGridButton.SetupButton( self, controller )
	return self
end

CoD.ChallengeReticlesGridButton.SetupButtonImages = function ( self, weaponOption, attachmentIndex )
	local reticleSize = 32
	local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
	local imageAreaHeight = CoD.CACCamo.CamoGridItemHeight - bottomTitleHeight
	local topOffset = imageAreaHeight / 2 + 2
	local reticleImage = Engine.GetWeaponOptionImage( weaponOption )
	self:setImage( reticleImage, 0, 0 )
	self.itemImage:setLeftRight( false, false, -reticleSize / 2, reticleSize / 2 )
	self.itemImage:setTopBottom( true, false, topOffset - reticleSize / 2, topOffset + reticleSize / 2 )
	self.itemImage:setPriority( -70 )
	CoD.ContentGridButton.SetupButtonImages( self, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
end

CoD.ChallengeReticlesGridButton.SetupButton = function ( self, controller )
	self.selectedFill:setAlpha( 0 )
	self.glowGradFront:setRGB( CoD.GrenadeGridButton.glowFrontColor.r, CoD.GrenadeGridButton.glowFrontColor.g, CoD.RewardGridButton.glowFrontColor.b )
	self.glowGradFront:setAlpha( 0.05 )
	local row, tableNumber = Engine.GetChallengeForItemOption( self.attachmentIndex, self.weaponOption )
	if row ~= nil then
		local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
		local weaponRef = Engine.GetAttachmentNameByIndex( self.attachmentIndex )
		local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, row, 5 )
		local preReqChallenge = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 7 ) )
		self.maxVal = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 2 ) )
		self.xpReward = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 6 ) )
		self.statsname = Engine.TableLookupGetColumnValueForRow( tableName, row, 4 )
		self.hintText = Engine.Localize( challengeString .. "_DESC", self.maxVal, weaponRef )
		self.challengeValue = Engine.GetItemOptionChallengeValue( controller, self.attachmentIndex, self.weaponOption )
		local preReqHintString = nil
		if preReqChallenge ~= nil and preReqChallenge > 0 then
			local preReqChallengeMaxValue = tonumber( Engine.TableLookup( nil, tableName, 0, preReqChallenge, 2 ) )
			local preReqChallengeValue = Engine.GetPreReqChallengeValue( controller, self.attachmentIndex, preReqChallenge )
			if preReqChallengeValue ~= nil and preReqChallengeValue < preReqChallengeMaxValue then
				local reticleUnlockedByPreReq = Engine.TableLookup( controller, tableName, 0, preReqChallenge, 9 )
				local reticleIndexOfPreReqReticle = string.gsub( reticleUnlockedByPreReq, "reticle_", "" )
				preReqHintString = Engine.Localize( "MPUI_RETICLE_PREREQ", "", Engine.Localize( "MPUI_RETICLE_" .. self.attachmentRef .. "_" .. reticleIndexOfPreReqReticle ), "" )
			end
		end
		if preReqHintString then
			self.hintText = preReqHintString
			self:setLocked( true )
			self.showProgressBar = false
		else
			self.showProgressBar = true
			if self.challengeValue and self.maxVal and self.challengeValue < self.maxVal then
				self:setLocked( true )
			else
				self:setLocked( false )
				self.showProgressBar = false
			end
		end
		if self.dualOpticReticle and self.lockImage then
			self.itemImage1:hide()
			self.itemImage2:hide()
		end
	end
end

