CoD.WeaponLevel = {}
CoD.WeaponLevel.FontName = "Default"
CoD.WeaponLevel.Font = CoD.fonts[CoD.WeaponLevel.FontName]
CoD.WeaponLevel.FontHeight = CoD.textSize[CoD.WeaponLevel.FontName]
CoD.WeaponLevel.FontAlpha = 0.4
CoD.WeaponLevel.FillInset = 2
CoD.WeaponLevel.FillTime = 150
CoD.WeaponLevel.new = function ( defaultAnimationState, width )
	local weaponLevel = LUI.UIElement.new( defaultAnimationState )
	weaponLevel.width = width
	weaponLevel.update = CoD.WeaponLevel.Update
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, 0, CoD.WeaponLevel.FontHeight )
	title:setAlpha( CoD.WeaponLevel.FontAlpha )
	title:setAlignment( LUI.Alignment.Left )
	title:setFont( CoD.WeaponLevel.Font )
	title:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_PROGRESS" ) )
	weaponLevel:addElement( title )
	local barTop = CoD.WeaponLevel.FontHeight + 2
	local barHeight = CoD.WeaponLevel.FontHeight
	weaponLevel.barContainer = LUI.UIElement.new()
	weaponLevel.barContainer:setLeftRight( true, true, 0, 0 )
	weaponLevel.barContainer:setTopBottom( true, false, barTop, barTop + barHeight )
	weaponLevel:addElement( weaponLevel.barContainer )
	local barBackground = LUI.UIImage.new()
	barBackground:setLeftRight( true, true, 1, -1 )
	barBackground:setTopBottom( true, true, 1, -1 )
	barBackground:setRGB( 0, 0, 0 )
	barBackground:setAlpha( 0.4 )
	weaponLevel.barContainer:addElement( barBackground )
	local barBackgroundGrad = LUI.UIImage.new()
	barBackgroundGrad:setLeftRight( true, true, CoD.WeaponLevel.FillInset, -CoD.WeaponLevel.FillInset )
	barBackgroundGrad:setTopBottom( true, false, CoD.WeaponLevel.FillInset, 12 )
	barBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	barBackgroundGrad:setAlpha( 0.1 )
	weaponLevel.barContainer:addElement( barBackgroundGrad )
	local border = CoD.BorderT6.new( 1, 1, 1, 1, 0.05 )
	weaponLevel.barContainer:addElement( border )
	weaponLevel.fill = LUI.UIElement.new()
	weaponLevel.fill:setLeftRight( true, false, CoD.WeaponLevel.FillInset, -CoD.WeaponLevel.FillInset )
	weaponLevel.fill:setTopBottom( true, true, CoD.WeaponLevel.FillInset, -CoD.WeaponLevel.FillInset )
	weaponLevel.barContainer:addElement( weaponLevel.fill )
	local fillColor = LUI.UIImage.new()
	fillColor:setLeftRight( true, true, 0, 0 )
	fillColor:setTopBottom( true, true, 0, 0 )
	fillColor:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	weaponLevel.fill:addElement( fillColor )
	local fillHighlight = LUI.UIImage.new()
	fillHighlight:setLeftRight( true, true, 0, 0 )
	fillHighlight:setTopBottom( true, false, 0, 12 )
	fillHighlight:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	fillHighlight:setAlpha( 0.4 )
	weaponLevel.fill:addElement( fillHighlight )
	local currentLeftOffset = -3
	weaponLevel.currentLabel = LUI.UIText.new()
	weaponLevel.currentLabel:setLeftRight( true, false, currentLeftOffset - 1, currentLeftOffset )
	weaponLevel.currentLabel:setTopBottom( true, false, 0, CoD.WeaponLevel.FontHeight )
	weaponLevel.currentLabel:setAlpha( CoD.WeaponLevel.FontAlpha )
	weaponLevel.currentLabel:setAlignment( LUI.Alignment.Right )
	weaponLevel.currentLabel:setFont( CoD.WeaponLevel.Font )
	weaponLevel.barContainer:addElement( weaponLevel.currentLabel )
	local nextRightOffset = -currentLeftOffset + 1
	weaponLevel.nextLabel = LUI.UIText.new()
	weaponLevel.nextLabel:setLeftRight( false, true, nextRightOffset, nextRightOffset + 1 )
	weaponLevel.nextLabel:setTopBottom( true, false, 0, CoD.WeaponLevel.FontHeight )
	weaponLevel.nextLabel:setAlpha( CoD.WeaponLevel.FontAlpha )
	weaponLevel.nextLabel:setAlignment( LUI.Alignment.Left )
	weaponLevel.nextLabel:setFont( CoD.WeaponLevel.Font )
	weaponLevel.barContainer:addElement( weaponLevel.nextLabel )
	local maxLevelBgHeight = (barHeight + 2) * 2
	local maxLevelBgWidth = maxLevelBgHeight
	local maxLevelContainerHeight = barHeight
	local maxLevelContainerWidth = maxLevelBgWidth
	local maxLevelContainerLeft = -6
	weaponLevel.maxLevelContainer = LUI.UIElement.new()
	weaponLevel.maxLevelContainer:setLeftRight( true, false, maxLevelContainerLeft, maxLevelContainerLeft + maxLevelContainerWidth )
	weaponLevel.maxLevelContainer:setTopBottom( true, false, barTop, barTop + maxLevelContainerHeight )
	weaponLevel.maxLevelContainer:setAlpha( 0 )
	weaponLevel:addElement( weaponLevel.maxLevelContainer )
	local maxLevelBg = LUI.UIImage.new()
	maxLevelBg:setLeftRight( true, false, 0, maxLevelBgWidth )
	maxLevelBg:setTopBottom( false, true, -maxLevelBgHeight, 0 )
	maxLevelBg:setImage( RegisterMaterial( "menu_mp_weapon_lvl_loc" ) )
	weaponLevel.maxLevelContainer:addElement( maxLevelBg )
	local maxLevelLabel = LUI.UIText.new()
	maxLevelLabel:setLeftRight( true, true, 0, 0 )
	maxLevelLabel:setTopBottom( false, true, -CoD.WeaponLevel.FontHeight, 0 )
	maxLevelLabel:setRGB( 0, 0, 0 )
	maxLevelLabel:setAlignment( LUI.Alignment.Center )
	maxLevelLabel:setText( Engine.Localize( "MPUI_MAX_CAPS" ) )
	weaponLevel.maxLevelContainer:addElement( maxLevelLabel )
	local starTop = 0
	local starLeft = -6
	local prestigeStarSize = maxLevelBgHeight / 4
	weaponLevel.prestige1Star = LUI.UIImage.new()
	weaponLevel.prestige1Star:setLeftRight( false, true, starLeft, starLeft + prestigeStarSize )
	weaponLevel.prestige1Star:setTopBottom( true, false, starTop, starTop + prestigeStarSize )
	weaponLevel.prestige1Star:setImage( RegisterMaterial( "menu_mp_weapon_lvl_star" ) )
	weaponLevel.prestige1Star:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	weaponLevel.prestige1Star:setAlpha( 0 )
	weaponLevel.maxLevelContainer:addElement( weaponLevel.prestige1Star )
	starTop = starTop + prestigeStarSize
	weaponLevel.prestige2Star = LUI.UIImage.new()
	weaponLevel.prestige2Star:setLeftRight( false, true, starLeft, starLeft + prestigeStarSize )
	weaponLevel.prestige2Star:setTopBottom( true, false, starTop, starTop + prestigeStarSize )
	weaponLevel.prestige2Star:setImage( RegisterMaterial( "menu_mp_weapon_lvl_star" ) )
	weaponLevel.prestige2Star:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	weaponLevel.prestige2Star:setAlpha( 0 )
	weaponLevel.maxLevelContainer:addElement( weaponLevel.prestige2Star )
	local promptContainerLeft = maxLevelBgWidth + starLeft + prestigeStarSize - 5
	local promptContainerTop = barTop + 1
	weaponLevel.promptContainer = LUI.UIElement.new()
	weaponLevel.promptContainer:setLeftRight( true, false, promptContainerLeft, promptContainerLeft + 300 )
	weaponLevel.promptContainer:setTopBottom( true, false, promptContainerTop, promptContainerTop + maxLevelContainerHeight )
	weaponLevel:addElement( weaponLevel.promptContainer )
	local prestigeLabelTop = barTop + barHeight
	weaponLevel.prestigeLabel = LUI.UIText.new()
	weaponLevel.prestigeLabel:setLeftRight( true, true, 0, 0 )
	weaponLevel.prestigeLabel:setTopBottom( true, false, prestigeLabelTop, prestigeLabelTop + CoD.WeaponLevel.FontHeight )
	weaponLevel.prestigeLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	weaponLevel.prestigeLabel:setAlignment( LUI.Alignment.Left )
	weaponLevel.prestigeLabel:setFont( CoD.WeaponLevel.Font )
	weaponLevel:addElement( weaponLevel.prestigeLabel )
	weaponLevel:registerEventHandler( "weapon_prestige", CoD.WeaponLevel.WeaponPrestige )
	return weaponLevel
end

CoD.WeaponLevel.WeaponPrestige = function ( self, event )
	self:dispatchEventToParent( event )
end

CoD.WeaponLevel.GetWeaponLevel = function ( controller, weaponItemIndex )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) ~= true and not Engine.SessionMode_IsSystemlinkGame() then
		local currentWeaponLevel = Engine.GetGunCurrentRank( controller, weaponItemIndex )
		local nextWeaponLevel = Engine.GetGunNextRank( controller, weaponItemIndex )
		local currentWeaponXP = Engine.GetDStat( controller, "itemstats", weaponItemIndex, "xp" )
		local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, weaponItemIndex )
		if currentWeaponLevel > 0 and currentWeaponLevel == nextWeaponLevel and currentWeaponXPReq <= currentWeaponXP then
			return currentWeaponLevel
		end
	end
end

CoD.WeaponLevel.GetWeaponPLevel = function ( controller, weaponItemIndex )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) ~= true and not Engine.SessionMode_IsSystemlinkGame() then
		local playerStats = CoD.GetPlayerStats( controller )
		local currentWeapon = playerStats.itemStats[weaponItemIndex]
		return currentWeapon.pLevel:get()
	else
		
	end
end

CoD.WeaponLevel.Update = function ( self, controller, weaponItemIndex )
	if not controller then
		controller = 0
	end
	if weaponItemIndex == nil then
		self:beginAnimation( "hide" )
		self:setAlpha( 0 )
		return 
	end
	local currentWeaponLevel = Engine.GetGunCurrentRank( controller, weaponItemIndex )
	local nextWeaponLevel = Engine.GetGunNextRank( controller, weaponItemIndex )
	local fillRatio = 0
	local currentWeaponXP = Engine.GetDStat( controller, "itemstats", weaponItemIndex, "xp" )
	local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, weaponItemIndex )
	local currentWeaponPLevel = CoD.WeaponLevel.GetWeaponPLevel( controller, weaponItemIndex )
	if currentWeaponLevel == nextWeaponLevel and currentWeaponXPReq <= currentWeaponXP then
		if nextWeaponLevel == 0 then
			self:beginAnimation( "hide" )
			self:setAlpha( 0 )
		else
			self:beginAnimation( "show" )
			self:setAlpha( 1 )
		end
		self.currentLabel:setText( "" )
		self.nextLabel:setText( "" )
		self.barContainer:beginAnimation( "hide" )
		self.barContainer:setAlpha( 0 )
		if currentWeaponLevel then
			self.maxLevelContainer:beginAnimation( "show" )
			self.maxLevelContainer:setAlpha( 1 )
			if currentWeaponPLevel and currentWeaponPLevel < CoD.MAX_WEAPON_PRESTIGE and Engine.IsItemPurchased( controller, weaponItemIndex ) then
				if self.prestigeButton == nil then
					local prestigeButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MPUI_PRESTIGE_WEAPON_CAPS" ), self, "weapon_prestige" )
					prestigeButton:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
					self.promptContainer:addElement( prestigeButton )
					self.prestigeButton = prestigeButton
				end
			elseif self.prestigeButton then
				self.prestigeButton:close()
				self.prestigeButton = nil
			end
		end
	else
		self:beginAnimation( "show" )
		self:setAlpha( 1 )
		local currentWeaponLevelText = ""
		self.currentLabel:setText( currentWeaponLevel + 1 )
		self.nextLabel:setText( currentWeaponLevel + 2 )
		self.barContainer:beginAnimation( "show" )
		self.barContainer:setAlpha( 1 )
		local prevWeaponLevelXP = Engine.GetGunPrevRankXP( controller, weaponItemIndex )
		local currentWeaponLevelXP = Engine.GetGunCurrentRankXP( controller, weaponItemIndex )
		local currentLevelXP = currentWeaponLevelXP - prevWeaponLevelXP
		local currentLevelProgress = currentWeaponXP - prevWeaponLevelXP
		if currentLevelXP ~= 0 then
			fillRatio = currentLevelProgress / currentLevelXP
		end
		self.maxLevelContainer:beginAnimation( "hide" )
		self.maxLevelContainer:setAlpha( 0 )
		if self.prestigeButton then
			self.prestigeButton:close()
			self.prestigeButton = nil
		end
	end
	if currentWeaponPLevel and 0 < currentWeaponPLevel then
		self.prestigeLabel:setText( Engine.Localize( "MPUI_WEAPON_PRESTIGE", currentWeaponPLevel ) )
		if currentWeaponPLevel >= 1 then
			self.prestige1Star:beginAnimation( "show" )
			self.prestige1Star:setAlpha( 1 )
		end
		if currentWeaponPLevel >= 2 then
			self.prestige2Star:beginAnimation( "show" )
			self.prestige2Star:setAlpha( 1 )
		else
			self.prestige2Star:beginAnimation( "hide" )
			self.prestige2Star:setAlpha( 0 )
		end
	else
		self.prestigeLabel:setText( "" )
		self.prestige1Star:beginAnimation( "hide" )
		self.prestige1Star:setAlpha( 0 )
		self.prestige2Star:beginAnimation( "hide" )
		self.prestige2Star:setAlpha( 0 )
	end
	local fillWidth = (self.width - CoD.WeaponLevel.FillInset * 2) * fillRatio
	self.fill:beginAnimation( "fill", CoD.WeaponLevel.FillTime )
	self.fill:setLeftRight( true, false, CoD.WeaponLevel.FillInset, fillWidth )
end

CoD.WeaponLevel.WeaponLevelIconUpdate = function ( self, controller, weaponItemIndex )
	local currentWeaponLevel = Engine.GetGunCurrentRank( controller, weaponItemIndex )
	local nextWeaponLevel = Engine.GetGunNextRank( controller, weaponItemIndex )
	local currentWeaponXP = Engine.GetDStat( controller, "itemstats", weaponItemIndex, "xp" )
	local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, weaponItemIndex )
	local weaponLevelToDisplay = ""
	local currentWeaponPLevel = CoD.WeaponLevel.GetWeaponPLevel( controller, weaponItemIndex )
	if currentWeaponLevel == nextWeaponLevel and currentWeaponXPReq <= currentWeaponXP then
		if nextWeaponLevel == 0 then
			self:hide()
			return 
		end
		weaponLevelToDisplay = Engine.Localize( "MPUI_MAX_CAPS" )
	else
		weaponLevelToDisplay = currentWeaponLevel + 1
	end
	if currentWeaponPLevel and currentWeaponPLevel > 0 then
		if currentWeaponPLevel >= 1 then
			self.prestige1Star:beginAnimation( "show" )
			self.prestige1Star:setAlpha( 1 )
		end
		if currentWeaponPLevel >= 2 then
			self.prestige2Star:beginAnimation( "show" )
			self.prestige2Star:setAlpha( 1 )
		else
			self.prestige2Star:beginAnimation( "hide" )
			self.prestige2Star:setAlpha( 0 )
		end
	else
		self.prestige1Star:beginAnimation( "hide" )
		self.prestige1Star:setAlpha( 0 )
		self.prestige2Star:beginAnimation( "hide" )
		self.prestige2Star:setAlpha( 0 )
	end
	self.gunLevel:setText( weaponLevelToDisplay )
	self:show()
end

CoD.WeaponLevel.GetWeaponLevelIcon = function ( width, height, font, textInset, starLeft, starBottom )
	local gunLevelBgWidth = 64
	local gunLevelBgHeight = 64
	local starBottomOffset = 0
	local starLeftOffset = 0
	if width then
		gunLevelBgWidth = width
	end
	if height then
		gunLevelBgHeight = height
	end
	if starLeft then
		starLeftOffset = starLeft
	end
	if starBottom then
		starBottomOffset = starBottom
	end
	local containerInset = 5
	local gunLevelContainer = LUI.UIElement.new()
	gunLevelContainer:setLeftRight( false, true, -containerInset - gunLevelBgWidth, -containerInset )
	gunLevelContainer:setTopBottom( false, true, -containerInset - gunLevelBgHeight, -containerInset )
	gunLevelContainer.update = CoD.WeaponLevel.WeaponLevelIconUpdate
	local gunLevelBg = LUI.UIImage.new()
	gunLevelBg:setLeftRight( true, true, 0, 0 )
	gunLevelBg:setTopBottom( true, true, 0, 0 )
	local language = Engine.GetLanguage()
	if language == "english" then
		gunLevelBg:setImage( RegisterMaterial( "menu_mp_weapon_lvl" ) )
	else
		gunLevelBg:setImage( RegisterMaterial( "menu_mp_weapon_lvl_loc" ) )
	end
	gunLevelContainer:addElement( gunLevelBg )
	gunLevelContainer.gunLevelBg = gunLevelBg
	
	local inset = 2
	if textInset then
		inset = textInset
	end
	local gunLevelTextFont = "Default"
	if font then
		gunLevelTextFont = font
	end
	local gunLevelTextHeight = CoD.textSize[gunLevelTextFont]
	
	local gunLevel = LUI.UIText.new()
	gunLevel:setLeftRight( true, true, 0, 0 )
	gunLevel:setTopBottom( false, true, -inset - gunLevelTextHeight, -inset )
	gunLevel:setRGB( 0, 0, 0 )
	gunLevelContainer:addElement( gunLevel )
	gunLevelContainer.gunLevel = gunLevel
	
	local starLeft = -6 + starLeftOffset
	local prestigeStarSize = gunLevelBgHeight / 4
	local starBottom = -prestigeStarSize + starBottomOffset
	gunLevelContainer.prestige1Star = LUI.UIImage.new()
	gunLevelContainer.prestige1Star:setLeftRight( false, true, starLeft, starLeft + prestigeStarSize )
	gunLevelContainer.prestige1Star:setTopBottom( false, true, starBottom - prestigeStarSize, starBottom )
	gunLevelContainer.prestige1Star:setImage( RegisterMaterial( "menu_mp_weapon_lvl_star" ) )
	gunLevelContainer.prestige1Star:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	gunLevelContainer.prestige1Star:setAlpha( 0 )
	gunLevelContainer:addElement( gunLevelContainer.prestige1Star )
	starBottom = starBottom + prestigeStarSize
	gunLevelContainer.prestige2Star = LUI.UIImage.new()
	gunLevelContainer.prestige2Star:setLeftRight( false, true, starLeft, starLeft + prestigeStarSize )
	gunLevelContainer.prestige2Star:setTopBottom( false, true, starBottom - prestigeStarSize, starBottom )
	gunLevelContainer.prestige2Star:setImage( RegisterMaterial( "menu_mp_weapon_lvl_star" ) )
	gunLevelContainer.prestige2Star:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	gunLevelContainer.prestige2Star:setAlpha( 0 )
	gunLevelContainer:addElement( gunLevelContainer.prestige2Star )
	return gunLevelContainer
end

