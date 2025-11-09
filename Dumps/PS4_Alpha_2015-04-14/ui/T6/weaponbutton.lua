CoD.WeaponButton = {}
CoD.WeaponButton.FontName = "Default"
CoD.WeaponButton.WeaponImageHeight = 135
CoD.WeaponButton.WeaponImageRatio = 2
CoD.WeaponButton.WeaponImageWidth = CoD.WeaponButton.WeaponImageHeight * CoD.WeaponButton.WeaponImageRatio
CoD.WeaponButton.GrenadeImageHeight = 60
CoD.WeaponButton.GrenadeImageWidth = CoD.WeaponButton.GrenadeImageHeight
CoD.WeaponButton.PerkImageHeight = 60
CoD.WeaponButton.PerkImageWidth = CoD.WeaponButton.PerkImageHeight
CoD.WeaponButton.PerkCyclePeriod = 3000
CoD.WeaponButton.PerkCycleFadePeriod = 500
CoD.WeaponButton.SelectedAlpha = 1
CoD.WeaponButton.NotSelectedAlpha = 0.25
CoD.WeaponButton.SelectionPeriod = 300
CoD.WeaponButton.new = function ( defaultAnimationState, identifier, actionEventName )
	local imageHolderHeight = defaultAnimationState.bottom
	if identifier ~= "primaryWeapon" then
		defaultAnimationState.bottom = defaultAnimationState.bottom + CoD.textSize[CoD.WeaponButton.FontName]
	end
	local weaponButton = LUI.UIButton.new( defaultAnimationState, actionEventName )
	weaponButton.id = weaponButton.id .. ".WeaponButton." .. identifier
	weaponButton.buttonName = identifier
	local buttonBracketOffset = 20
	local buttonBrackets = CoD.SideBracketsImage.new()
	buttonBrackets:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = -buttonBracketOffset,
		right = buttonBracketOffset,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.textSize[CoD.WeaponButton.FontName],
		bottom = 0
	} )
	buttonBrackets:animateToState( "default" )
	weaponButton:addElement( buttonBrackets )
	LUI.UIButton.SetupElement( buttonBrackets )
	weaponButton.buttonBrackets = buttonBrackets
	weaponButton.buttonBrackets:registerAnimationState( "hide_button_bracket", {
		leftAnchor = true,
		rightAnchor = true,
		left = -buttonBracketOffset * 3,
		right = buttonBracketOffset * 3,
		alpha = 0
	} )
	weaponButton.buttonBrackets:registerAnimationState( "show_button_bracket", {
		leftAnchor = true,
		rightAnchor = true,
		left = -buttonBracketOffset,
		right = buttonBracketOffset,
		alpha = 1
	} )
	weaponButton.buttonBrackets:animateToState( "hide_button_bracket" )
	
	local imageHolder = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -imageHolderHeight,
		bottom = 0
	} )
	imageHolder.id = imageHolder.id .. ".ImageHolder"
	LUI.UIButton.SetupElement( imageHolder )
	weaponButton:addElement( imageHolder )
	weaponButton.imageHolder = imageHolder
	
	CoD.WeaponButton.AddTextElement( weaponButton )
	weaponButton.weaponSetup = CoD.WeaponButton.WeaponSetup
	weaponButton.grenadeSetup = CoD.WeaponButton.GrenadeSetup
	weaponButton.perksSetup = CoD.WeaponButton.PerksSetup
	weaponButton.setNewAvailable = CoD.WeaponButton.SetNewItemAvailable
	weaponButton:registerEventHandler( "move_to_center", CoD.WeaponButton.MoveToCenter )
	weaponButton:registerEventHandler( "gain_focus", CoD.WeaponButton.GainFocus )
	weaponButton:registerEventHandler( "lose_focus", CoD.WeaponButton.LoseFocus )
	weaponButton:registerEventHandler( "button_action", CoD.WeaponButton.ButtonAction )
	weaponButton:registerEventHandler( "button_over", CoD.WeaponButton.ButtonOver )
	weaponButton:registerEventHandler( "button_up", CoD.WeaponButton.ButtonUp )
	return weaponButton
end

CoD.WeaponButton.ButtonOver = function ( self, event )
	if self.weaponType == "perks" then
		for i = 1, #self.weaponImage.perkImages, 1 do
			self.weaponImage.perkImages[i]:beginAnimation( "select", CoD.WeaponButton.SelectionPeriod )
			self.weaponImage.perkImages[i]:setAlpha( CoD.WeaponButton.SelectedAlpha )
			self.weaponImage.currentAlpha = CoD.WeaponButton.SelectedAlpha
		end
	elseif self.weaponType == "grenade" then
		self.weaponImage.primaryImage:beginAnimation( "select", CoD.WeaponButton.SelectionPeriod )
		self.weaponImage.primaryImage:setAlpha( CoD.WeaponButton.SelectedAlpha )
		self.weaponImage.specialImage:beginAnimation( "select", CoD.WeaponButton.SelectionPeriod )
		self.weaponImage.specialImage:setAlpha( CoD.WeaponButton.SelectedAlpha )
	else
		self.weaponImage:beginAnimation( "select", CoD.WeaponButton.SelectionPeriod )
		self.weaponImage:setAlpha( CoD.WeaponButton.SelectedAlpha )
	end
end

CoD.WeaponButton.ButtonUp = function ( self, event )
	if self.weaponType == "perks" then
		for i = 1, #self.weaponImage.perkImages, 1 do
			self.weaponImage.perkImages[i]:beginAnimation( "deselect", CoD.WeaponButton.SelectionPeriod )
			self.weaponImage.perkImages[i]:setAlpha( CoD.WeaponButton.NotSelectedAlpha )
			self.weaponImage.currentAlpha = CoD.WeaponButton.NotSelectedAlpha
		end
	elseif self.weaponType == "grenade" then
		self.weaponImage.primaryImage:beginAnimation( "deselect", CoD.WeaponButton.SelectionPeriod )
		self.weaponImage.primaryImage:setAlpha( CoD.WeaponButton.NotSelectedAlpha )
		self.weaponImage.specialImage:beginAnimation( "deselect", CoD.WeaponButton.SelectionPeriod )
		self.weaponImage.specialImage:setAlpha( CoD.WeaponButton.NotSelectedAlpha )
	else
		self.weaponImage:beginAnimation( "deselect", CoD.WeaponButton.SelectionPeriod )
		self.weaponImage:setAlpha( CoD.WeaponButton.NotSelectedAlpha )
	end
end

CoD.WeaponButton.MoveToCenter = function ( self, event )
	self:animateToState( "move_to_center", event.duration )
	self.weaponImage:animateToState( "center", event.duration )
end

CoD.WeaponButton.GainFocus = function ( self, event )
	local retVal = LUI.UIButton.gainFocus( self, event )
	self:processEvent( {
		name = "move_to_center"
	} )
	self.buttonBrackets:animateToState( "show_button_bracket", 150 )
	return retVal
end

CoD.WeaponButton.LoseFocus = function ( self, event )
	LUI.UIButton.loseFocus( self, event )
	self:processEvent( {
		name = "move_to_center"
	} )
	self.buttonBrackets:animateToState( "hide_button_bracket" )
end

CoD.WeaponButton.ButtonAction = function ( self, event )
	self:dispatchEventToParent( {
		name = "weapon_button_action",
		controller = event.controller,
		button = self,
		type = self.weaponType,
		loadoutSlot = self.loadoutSlot
	} )
end

CoD.WeaponButton.AddTextElement = function ( self, count )
	local weaponTextHolder = LUI.UIElement.new()
	weaponTextHolder:setLeftRight( false, true, 0, 0 )
	weaponTextHolder:setTopBottom( true, false, 0, CoD.textSize[CoD.WeaponButton.FontName] )
	weaponTextHolder.id = weaponTextHolder.id .. ".WeaponTextHolder"
	self:addElement( weaponTextHolder )
	self.weaponTextHolder = weaponTextHolder
	
	if count == nil then
		local weaponText = LUI.UIText.new()
		weaponText:setLeftRight( true, true, 10, 0 )
		weaponText:setTopBottom( true, true, 0, 0 )
		weaponText:setAlpha( CoD.textAlpha )
		weaponText:setFont( CoD.fonts[CoD.WeaponButton.FontName] )
		weaponText:setAlignment( LUI.Alignment.Left )
		weaponText.id = weaponText.id .. ".WeaponText"
		weaponTextHolder:addElement( weaponText )
		weaponTextHolder.weaponText = weaponText
		
	else
		weaponTextHolder.textList = {}
		weaponTextHolder.bracketList = {}
		for index = 1, count, 1 do
			local weaponText = LUI.UIText.new()
			weaponText:setLeftRight( true, true, 10, 0 )
			weaponText:setTopBottom( true, true, 0, 0 )
			weaponText:setAlpha( CoD.textAlpha )
			weaponText:setFont( CoD.fonts[CoD.WeaponButton.FontName] )
			weaponText:setAlignment( LUI.Alignment.Left )
			weaponText.id = weaponText.id .. ".WeaponText" .. index
			weaponText.isVisible = index == 1
			if weaponText.isVisible then
				weaponText:setAlpha( 1 )
			else
				weaponText:setAlpha( 0 )
			end
			weaponTextHolder:addElement( weaponText )
			table.insert( weaponTextHolder.textList, weaponText )
		end
	end
	weaponTextHolder.brackets = CoD.SideBracketsImage.new()
	weaponTextHolder:addElement( weaponTextHolder.brackets )
	weaponTextHolder.brackets:registerAnimationState( "hide_text_brackets", {
		alpha = 0
	} )
	weaponTextHolder.brackets:registerAnimationState( "show_text_brackets", {
		alpha = 1
	} )
	weaponTextHolder:registerEventHandler( "update_text_length", CoD.WeaponButton.UpdateTextSize )
	weaponTextHolder.update = CoD.WeaponButton.UpdateTextSize
	weaponTextHolder:update()
end

CoD.WeaponButton.UpdateTextSize = function ( self )
	if self.refText == nil and self.textList == nil then
		return 
	elseif self.textList == nil then
		local textLeft, textTop, textRight, textBottom = GetTextDimensions( self.refText, CoD.fonts[CoD.WeaponButton.FontName], CoD.textSize[CoD.WeaponButton.FontName] )
		local textWidth = textRight - textLeft + 15
		if self.newImage then
			textWidth = textWidth + CoD.CACUtility.ButtonGridLockImageSize
		end
		self:beginAnimation( "update_text_length" )
		self:setLeftRight( false, true, -textWidth, 0 )
	else
		for index, label in ipairs( self.textList ) do
			if label.isVisible and label.refText then
				local textLeft, textTop, textRight, textBottom = GetTextDimensions( label.refText, CoD.fonts[CoD.WeaponButton.FontName], CoD.textSize[CoD.WeaponButton.FontName] )
				local textWidth = textRight - textLeft + 15
				if self.newImage then
					textWidth = textWidth + CoD.CACUtility.ButtonGridLockImageSize
				end
				self:beginAnimation( "update_text_length", CoD.WeaponButton.PerkCycleFadePeriod )
				self:setLeftRight( false, true, -textWidth, 0 )
			end
		end
	end
end

CoD.WeaponButton.WeaponSetup = function ( self )
	local imageOffset = 35
	local defaultAnimationState = CoD.GetDefaultAnimationState()
	defaultAnimationState.left = -imageOffset
	defaultAnimationState.right = -imageOffset
	local weaponImage = LUI.UIImage.new( defaultAnimationState )
	weaponImage.id = weaponImage.id .. ".WeaponImage"
	LUI.UIButton.SetupElement( weaponImage )
	self.imageHolder:addElement( weaponImage )
	self.weaponImage = weaponImage
	weaponImage:registerAnimationState( "center", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0
	} )
	weaponImage:animateToState( "default" )
	self.weaponType = "weapon"
end

CoD.WeaponButton.GrenadeSetup = function ( self )
	local grenadeSpacing = 15
	local weaponImage = LUI.UIHorizontalList.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -CoD.WeaponButton.GrenadeImageWidth * 2 + grenadeSpacing,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.WeaponButton.GrenadeImageHeight / 2,
		bottom = CoD.WeaponButton.GrenadeImageHeight / 2,
		alignment = LUI.Alignment.Center
	} )
	weaponImage.id = weaponImage.id .. ".WeaponImage"
	LUI.UIButton.SetupElement( weaponImage )
	self.imageHolder:addElement( weaponImage )
	self.weaponImage = weaponImage
	
	local primaryImage = LUI.UIImage.new()
	primaryImage:setLeftRight( false, true, -CoD.WeaponButton.GrenadeImageWidth, 0 )
	primaryImage:setTopBottom( false, false, -CoD.WeaponButton.GrenadeImageHeight / 2, CoD.WeaponButton.GrenadeImageHeight / 2 )
	primaryImage:setAlignment( LUI.Alignment.Right )
	primaryImage.id = primaryImage.id .. ".PrimaryImage"
	weaponImage:addElement( primaryImage )
	weaponImage.primaryImage = primaryImage
	
	local specialImage = LUI.UIImage.new()
	specialImage:setLeftRight( false, true, -CoD.WeaponButton.GrenadeImageWidth, 0 )
	specialImage:setTopBottom( false, false, -CoD.WeaponButton.GrenadeImageHeight / 2, CoD.WeaponButton.GrenadeImageHeight / 2 )
	specialImage:setAlignment( LUI.Alignment.Right )
	specialImage.id = specialImage.id .. ".SpecialImage"
	weaponImage:addElement( specialImage )
	weaponImage.specialImage = specialImage
	
	weaponImage.weaponImageTable = {}
	weaponImage.weaponImageTable[1] = primaryImage
	weaponImage.weaponImageTable[2] = specialImage
	weaponImage:registerAnimationState( "center", {
		leftAnchor = false,
		rightAnchor = false,
		left = -CoD.WeaponButton.GrenadeImageWidth / 2,
		right = CoD.WeaponButton.GrenadeImageWidth / 2,
		alignment = LUI.Alignment.Center
	} )
	weaponImage:registerAnimationState( "selected", {
		alpha = 1
	} )
	self.weaponType = "grenade"
end

CoD.WeaponButton.PerksSetup = function ( weaponButton )
	local maxPerkSlots = 3
	weaponButton:removeElement( weaponButton.weaponTextHolder )
	CoD.WeaponButton.AddTextElement( weaponButton, maxPerkSlots )
	local weaponImage = LUI.UIHorizontalList.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -CoD.WeaponButton.GrenadeImageWidth * maxPerkSlots,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.WeaponButton.GrenadeImageHeight / 2,
		bottom = CoD.WeaponButton.GrenadeImageHeight / 2,
		alignment = LUI.Alignment.Center
	} )
	weaponImage.id = weaponImage.id .. ".WeaponImage"
	LUI.UIButton.SetupElement( weaponImage )
	weaponButton.imageHolder:addElement( weaponImage )
	weaponButton.weaponImage = weaponImage
	weaponImage.currentAlpha = CoD.WeaponButton.SelectedAlpha
	weaponImage.perkImages = {}
	for perkIndex = 1, maxPerkSlots, 1 do
		local perkImage = LUI.UIImage.new()
		perkImage:setLeftRight( false, true, -CoD.WeaponButton.GrenadeImageWidth, 0 )
		perkImage:setTopBottom( false, false, -CoD.WeaponButton.GrenadeImageHeight / 2, CoD.WeaponButton.GrenadeImageHeight / 2 )
		perkImage.id = perkImage.id .. "PerkImage"
		local perkBrackets = CoD.Brackets.new( 5 )
		perkBrackets:setRGB( 1, 1, 1 )
		if perkIndex == 1 then
			perkBrackets:setAlpha( weaponImage.currentAlpha )
		else
			perkBrackets:setAlpha( 0 )
		end
		perkBrackets:setPriority( 100 )
		perkImage:addElement( perkBrackets )
		perkImage.brackets = perkBrackets
		
		perkImage.perkLabel = ""
		table.insert( weaponImage.perkImages, perkImage )
		weaponImage:addElement( perkImage )
	end
	local perksCycleTimer = LUI.UITimer.new( CoD.WeaponButton.PerkCyclePeriod, "cycle_perks", false, weaponButton )
	weaponButton:registerEventHandler( "cycle_perks", CoD.WeaponButton.CyclePerksName )
	weaponImage:addElement( perksCycleTimer )
	weaponImage:registerAnimationState( "center", {
		leftAnchor = false,
		rightAnchor = false,
		left = -(CoD.WeaponButton.GrenadeImageWidth * 6) / 2,
		right = CoD.WeaponButton.GrenadeImageWidth * 6 / 2
	} )
	weaponButton.weaponType = "perks"
end

CoD.WeaponButton.CyclePerksName = function ( self, event )
	local holder = self.weaponTextHolder
	local currentIndex = 0
	local nextIndex = 0
	if holder ~= nil and holder.textList ~= nil then
		if #holder.textList <= 1 then
			return 
		end
		for index, label in ipairs( holder.textList ) do
			if label.isVisible then
				currentIndex = index
				nextIndex = index + 1
			end
		end
	end
	if #holder.textList < nextIndex then
		nextIndex = 1
		while not holder.textList[nextIndex].shouldShow and nextIndex ~= 1 do
			nextIndex = nextIndex + 1
			if #holder.textList < nextIndex then
				nextIndex = 1
			end
		end
		if currentIndex ~= nextIndex then
			holder.textList[currentIndex]:beginAnimation( "hide", CoD.WeaponButton.PerkCycleFadePeriod )
			holder.textList[currentIndex]:setAlpha( 0 )
			holder.textList[currentIndex].isVisible = false
			self.weaponImage.perkImages[currentIndex].brackets:beginAnimation( "hide", CoD.WeaponButton.PerkCycleFadePeriod )
			self.weaponImage.perkImages[currentIndex].brackets:setAlpha( 0 )
			holder.textList[nextIndex]:beginAnimation( "show", CoD.WeaponButton.PerkCycleFadePeriod )
			holder.textList[nextIndex]:setAlpha( 1 )
			holder.textList[nextIndex].isVisible = true
			self.weaponImage.perkImages[nextIndex].brackets:beginAnimation( "show", CoD.WeaponButton.PerkCycleFadePeriod )
			self.weaponImage.perkImages[nextIndex].brackets:setAlpha( 1 )
			self.weaponImage.perkImages[nextIndex]:beginAnimation( "update_alpha", CoD.WeaponButton.PerkCycleFadePeriod )
			self.weaponImage.perkImages[nextIndex]:setAlpha( self.weaponImage.currentAlpha )
			self:processEvent( {
				name = "update_text_length"
			} )
		end
	end
end

CoD.WeaponButton.SetNewItemAvailable = function ( self, available )
	if self.weaponTextHolder then
		if available and not self.weaponTextHolder.newImage then
			local newImage = LUI.UIImage.new()
			newImage:setLeftRight( false, true, -CoD.CACUtility.ButtonGridNewImageWidth, 0 )
			newImage:setTopBottom( false, false, -CoD.CACUtility.ButtonGridNewImageHeight / 2, CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			newImage:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			self.weaponTextHolder:addElement( newImage )
			self.weaponTextHolder.newImage = newImage
			if self.weaponTextHolder.weaponText then
				self.weaponTextHolder.weaponText:setLeftRight( true, true, 0, -CoD.CACUtility.ButtonGridLockImageSize )
			end
		elseif not available and self.weaponTextHolder.newImage then
			self.weaponTextHolder.newImage:close()
			self.weaponTextHolder.newImage = nil
			if self.weaponTextHolder.weaponText then
				self.weaponTextHolder.weaponText:setLeftRight( true, true, 0, 0 )
			end
		end
		self.weaponTextHolder:update()
	end
end

