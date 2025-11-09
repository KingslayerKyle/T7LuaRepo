CoD.OffhandIcons = {}
CoD.OffhandIcons.Size = 24
CoD.OffhandIcons.Spacing = 1
CoD.OffhandIcons.AlphaMultiplier = 0.75
CoD.OffhandIcons.Width = CoD.OffhandIcons.Size * 1.5
CoD.OffhandIcons.new = function ( type, defaultAnimationState )
	local offhandIconsContainer = LUI.UIElement.new( defaultAnimationState )
	offhandIconsContainer.type = type
	offhandIconsContainer.setMaterialAndQuantity = CoD.OffhandIcons.SetMaterialAndQuantity
	offhandIconsContainer:registerEventHandler( "hud_update_offhand", CoD.OffhandIcons.UpdateOffhand )
	return offhandIconsContainer
end

CoD.OffhandIcons.SetMaterialAndQuantity = function ( self, material, quantity )
	local icons = nil
	if self.icons == nil then
		icons = {}
		self.icons = icons
	else
		icons = self.icons
	end
	local iconSize = CoD.OffhandIcons.Size
	local iconRight = 0
	local iconSpacing = iconSize * CoD.OffhandIcons.Spacing
	local iconAlphaMultiplier = CoD.OffhandIcons.AlphaMultiplier
	local iconAlpha = CoD.HUDAlphaFull * math.pow( iconAlphaMultiplier, quantity - 1 )
	for i = 1, quantity, 1 do
		local icon = icons[i]
		if icon ~= nil then
			icon:beginAnimation( "default" )
			icon:setAlpha( iconAlpha )
			icon:setImage( material )
		else
			icon = LUI.UIImage.new()
			icon:setLeftRight( false, true, iconRight - iconSize, iconRight )
			icon:setTopBottom( false, true, -iconSize, 0 )
			icon:setRGB( CoD.HUDBaseColor.r, CoD.HUDBaseColor.g, CoD.HUDBaseColor.b )
			icon:setAlpha( CoD.HUDAlphaFull * i / quantity )
			icon:setImage( material )
			icons[i] = icon
			self:addElement( icon )
		end
		iconRight = iconRight - iconSpacing
		iconAlpha = iconAlpha / iconAlphaMultiplier
	end
	local numIcons = #icons
	for i = quantity + 1, numIcons, 1 do
		icons[i]:close()
		icons[i] = nil
	end
end

CoD.OffhandIcons.UpdateOffhand = function ( self, event )
	local eventInfo = event[self.type]
	if eventInfo == nil then
		if not self.iconOutline then
			self:setMaterialAndQuantity( nil, 0 )
		end
	else
		self:setMaterialAndQuantity( eventInfo.material, eventInfo.ammo )
	end
end

CoD.OffhandIcons.UpdateTomahawkInUse = function ( self, event )
	local newState = event.newValue
	if newState == 0 then
		if self.iconOutline then
			self.iconOutline:close()
			self.iconOutline = nil
			self:setMaterialAndQuantity( nil, 0 )
		end
	elseif newState == 1 then
		if not self.iconOutline then
			self.iconOutline = LUI.UIImage.new()
			self.iconOutline:setLeftRight( false, true, -CoD.OffhandIcons.Size * 1.5, CoD.OffhandIcons.Size * 0.5 )
			self.iconOutline:setTopBottom( false, true, -CoD.OffhandIcons.Size * 1.5, CoD.OffhandIcons.Size * 0.5 )
			self.iconOutline:setRGB( CoD.HUDBaseColor.r, CoD.HUDBaseColor.g, CoD.HUDBaseColor.b )
			self.iconOutline:setAlpha( CoD.HUDAlphaFull )
			self.iconOutline:setImage( self.iconOutlineImage )
			self.iconOutline:setPriority( -10 )
			self:addElement( self.iconOutline )
		end
		self.iconOutline:setAlpha( CoD.HUDAlphaFull )
	elseif newState == 2 then
		if self.iconOutline then
			self.icons[1]:alternateStates( 0, CoD.OffhandIcons.PulseLow, CoD.OffhandIcons.PulseBright, 500, 500 )
			self.iconOutline:setAlpha( 0 )
		end
	elseif self.iconOutline then
		self.icons[1]:closeStateAlternator()
		self.icons[1]:setAlpha( CoD.HUDAlphaFull )
		self.iconOutline:setAlpha( CoD.HUDAlphaFull )
	end
end

CoD.OffhandIcons.UpgradeTomahawkIcon = function ( self, event )
	if event.newValue == 0 then
		self.iconOutlineImage = CoD.AmmoAreaZombie.TomahawkOutline
	else
		self.iconOutlineImage = CoD.AmmoAreaZombie.UpgradeTomahawkOutline
		if self.iconOutline then
			self.iconOutline:setImage( self.iconOutlineImage )
		end
	end
end

CoD.OffhandIcons.PulseBright = function ( self, time )
	self:beginAnimation( "pulse_low", time )
	self:setAlpha( 1 )
end

CoD.OffhandIcons.PulseLow = function ( self, time )
	self:beginAnimation( "pulse_high", time )
	self:setAlpha( 0.1 )
end

