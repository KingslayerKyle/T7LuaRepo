CoD.DPadArea = {}
CoD.DPadArea.CircleSize = 128
CoD.DPadArea.InterlacedLinesWidth = 300
CoD.DPadArea.InterlacedLinesHeight = 150
CoD.DPadArea.InventoryAnimationDuration = 250
CoD.DPadArea.ArrowColor = {
	r = 1,
	g = 1,
	b = 1
}
CoD.DPadArea.RewardIconSize = 64
CoD.DPadArea.InterlacedLinesMaterial = RegisterMaterial( "hud_dpad_blood" )
CoD.DPadArea.CircleBackgroundMaterial = RegisterMaterial( "hud_lui_dpad_circle" )
CoD.DPadArea.ArrowMaterial = RegisterMaterial( "hud_lui_arrow_global" )
CoD.OffhandIcons.Width_Zombie = CoD.OffhandIcons.Width * 3
if CoD.isPS3 == true then
	CoD.DPadArea.DPadMaterial = RegisterMaterial( "hud_dpad_ps3" )
else
	CoD.DPadArea.DPadMaterial = RegisterMaterial( "hud_dpad_xenon" )
end
LUI.createMenu.DPadArea = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "DPadArea", controller )
	self:setOwner( controller )
	self.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.scaleContainer:setLeftRight( false, true, 0, 0 )
	self.scaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.scaleContainer )
	local dpadCircle = LUI.UIElement.new()
	self.scaleContainer:addElement( dpadCircle )
	dpadCircle:setLeftRight( false, true, -CoD.DPadArea.CircleSize, 0 )
	dpadCircle:setTopBottom( false, true, -CoD.DPadArea.CircleSize, 0 )
	dpadCircle.id = "DpadCircle"
	local interlacedLinesTop = 10
	local interlacedLines = LUI.UIImage.new( {
		left = -CoD.DPadArea.InterlacedLinesWidth,
		top = interlacedLinesTop - CoD.DPadArea.InterlacedLinesHeight,
		right = 0,
		bottom = interlacedLinesTop,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true,
		red = 0.21,
		green = 0,
		blue = 0,
		material = CoD.DPadArea.InterlacedLinesMaterial
	} )
	dpadCircle:addElement( interlacedLines )
	dpadCircle.circleBackground = LUI.UIImage.new()
	dpadCircle.circleBackground:setLeftRight( true, true, 0, 0 )
	dpadCircle.circleBackground:setTopBottom( true, true, 0, 0 )
	dpadCircle.circleBackground:setImage( CoD.DPadArea.CircleBackgroundMaterial )
	dpadCircle:addElement( dpadCircle.circleBackground )
	CoD.OffhandIcons.Width = CoD.OffhandIcons.Width_Zombie
	local ammoCounter = CoD.AmmoCounter.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	dpadCircle:addElement( ammoCounter )
	local altAmmoCounter = CoD.OtherAmmoCounters.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	dpadCircle:addElement( altAmmoCounter )
	local weaponLabelBottom = -88
	local weaponLabelRight = -131
	local weaponLabelHeight = CoD.WeaponLabel.TextHeight
	local weaponLabel = CoD.WeaponLabel.new( {
		left = weaponLabelRight - 100,
		top = weaponLabelBottom - weaponLabelHeight,
		right = weaponLabelRight,
		bottom = weaponLabelBottom,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	dpadCircle:addElement( weaponLabel )
	local grenadesRight = -1
	local grenadesBottom = -1
	local lethalGrenades = CoD.OffhandIcons.new( "lethal", {
		left = grenadesRight - CoD.OffhandIcons.Width,
		top = grenadesBottom - CoD.OffhandIcons.Size,
		right = grenadesRight,
		bottom = grenadesBottom,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	dpadCircle:addElement( lethalGrenades )
	local tacticalGrenades = CoD.OffhandIcons.new( "tactical", {
		left = grenadesRight - CoD.OffhandIcons.Width * 2,
		top = grenadesBottom - CoD.OffhandIcons.Size,
		right = grenadesRight - CoD.OffhandIcons.Width,
		bottom = grenadesBottom,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	dpadCircle:addElement( tacticalGrenades )
	dpadCircle.carouselArrows = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	dpadCircle:addElement( dpadCircle.carouselArrows )
	local arrowWidth = 8
	local arrowHeight = 8
	local arrowSpacing = 4
	local upArrow = LUI.UIImage.new( {
		left = -arrowWidth / 2,
		top = -arrowSpacing - arrowHeight,
		right = arrowWidth / 2,
		bottom = -arrowSpacing,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = CoD.DPadArea.ArrowColor.r,
		green = CoD.DPadArea.ArrowColor.g,
		blue = CoD.DPadArea.ArrowColor.b,
		alpha = CoD.HUDAlphaFull,
		material = CoD.DPadArea.ArrowMaterial
	} )
	dpadCircle.carouselArrows:addElement( upArrow )
	local downArrow = LUI.UIImage.new( {
		left = -arrowWidth / 2,
		top = arrowSpacing,
		right = arrowWidth / 2,
		bottom = arrowSpacing + arrowHeight,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = CoD.DPadArea.ArrowColor.r,
		green = CoD.DPadArea.ArrowColor.g,
		blue = CoD.DPadArea.ArrowColor.b,
		alpha = CoD.HUDAlphaFull,
		material = CoD.DPadArea.ArrowMaterial,
		zRot = 180
	} )
	dpadCircle.carouselArrows:addElement( downArrow )
	local leftArrow = LUI.UIImage.new( {
		left = -arrowSpacing - arrowHeight / 2 - arrowWidth / 2,
		top = -arrowHeight / 2,
		right = -arrowSpacing - arrowHeight / 2 + arrowWidth / 2,
		bottom = arrowHeight / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = CoD.DPadArea.ArrowColor.r,
		green = CoD.DPadArea.ArrowColor.g,
		blue = CoD.DPadArea.ArrowColor.b,
		alpha = CoD.HUDAlphaFull,
		material = CoD.DPadArea.ArrowMaterial,
		zRot = 90
	} )
	dpadCircle.carouselArrows:addElement( leftArrow )
	local rightArrow = LUI.UIImage.new( {
		left = arrowSpacing + arrowHeight / 2 - arrowWidth / 2,
		top = -arrowHeight / 2,
		right = arrowSpacing + arrowHeight / 2 + arrowWidth / 2,
		bottom = arrowHeight / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = CoD.DPadArea.ArrowColor.r,
		green = CoD.DPadArea.ArrowColor.g,
		blue = CoD.DPadArea.ArrowColor.b,
		alpha = CoD.HUDAlphaFull,
		material = CoD.DPadArea.ArrowMaterial,
		zRot = -90
	} )
	dpadCircle.carouselArrows:addElement( rightArrow )
	local inventoryWeaponBottom = 3
	
	local inventoryWeapon = LUI.UIElement.new( {
		left = 0,
		top = inventoryWeaponBottom - CoD.DPadArea.RewardIconSize,
		right = CoD.DPadArea.CircleSize / 2,
		bottom = inventoryWeaponBottom,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		alpha = 0
	} )
	inventoryWeapon:registerAnimationState( "show", {
		alpha = 1
	} )
	dpadCircle:addElement( inventoryWeapon )
	dpadCircle.inventoryWeapon = inventoryWeapon
	
	local inventoryWeaponIcon = LUI.UIImage.new( {
		left = -CoD.DPadArea.RewardIconSize / 2,
		top = 10,
		right = CoD.DPadArea.RewardIconSize / 2,
		bottom = 10 + CoD.DPadArea.RewardIconSize,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		alpha = CoD.DPadArea.RewardIconEnabledAlpha
	} )
	inventoryWeapon:addElement( inventoryWeaponIcon )
	dpadCircle.inventoryWeaponIcon = inventoryWeaponIcon
	
	local inventoryWeaponText = LUI.UIText.new( {
		left = -1,
		top = -10,
		right = 1,
		bottom = 14,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true
	} )
	inventoryWeaponText:setText( Engine.Localize( "MPUI_HINT_INVENTORY_CAPS", Engine.KeyBinding( controller, "+weapnext_inventory" ) ) )
	inventoryWeaponText:setFont( CoD.fonts.Big )
	inventoryWeapon:addElement( inventoryWeaponText )
	dpadCircle:registerEventHandler( "hud_update_refresh", CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE, CoD.DPadArea.UpdateVisibility )
	dpadCircle:registerEventHandler( "hud_update_actionslots", CoD.DPadArea.UpdateActionSlots )
	dpadCircle:registerEventHandler( "hud_update_inventory_weapon", CoD.DPadArea.UpdateInventoryWeapon )
	dpadCircle:registerEventHandler( "hud_fade_dpad", CoD.DPadArea.UpdateFading )
	dpadCircle:registerEventHandler( "hud_update_team_change", CoD.DPadArea.UpdateTeamChange )
	if CoD.isPC then
		dpadCircle:registerEventHandler( "input_source_changed", CoD.DPadArea.InputSourceChanged )
		if CoD.useController and Engine.LastInput_Gamepad() then
			CoD.DPadArea.InputSourceChanged( dpadCircle, {
				source = 0
			} )
		else
			CoD.DPadArea.InputSourceChanged( dpadCircle, {
				source = 1
			} )
		end
	end
	dpadCircle.visible = true
	return self
end

CoD.DPadArea.UpdateActionSlots = function ( self, event )
	if self.actionSlots == nil then
		self.actionSlots = {}
	else
		for slotIndex, actionSlot in pairs( self.actionSlots ) do
			actionSlot:close()
		end
		self.actionSlots = {}
	end
	local actionSlotDataTable = event.actionSlotData
	for slotIndex, slotData in pairs( actionSlotDataTable ) do
		local height = CoD.DPadArea.CircleSize / 4
		local width = height * slotData.aspectRatio
		local f2_local4 = nil
		if slotData.ammo > 0 then
			f2_local4 = CoD.HUDAlphaFull
		else
			f2_local4 = CoD.HUDAlphaEmpty
		end
		local actionSlot, defaultAnimationState = nil
		if slotIndex == 1 then
			defaultAnimationState = {
				left = -width / 2,
				top = CoD.DPadArea.CircleSize / 4 - height / 2,
				right = width / 2,
				bottom = CoD.DPadArea.CircleSize / 4 + height / 2,
				leftAnchor = false,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false,
				alphaMultiplier = 1
			}
		elseif slotIndex == 2 then
			defaultAnimationState = {
				left = -width / 2,
				top = -CoD.DPadArea.CircleSize / 4 - height / 2,
				right = width / 2,
				bottom = -CoD.DPadArea.CircleSize / 4 + height / 2,
				leftAnchor = false,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = true,
				alphaMultiplier = 1
			}
		elseif slotIndex == 3 then
			defaultAnimationState = {
				left = CoD.DPadArea.CircleSize / 4 - width / 2,
				top = -height / 2,
				right = CoD.DPadArea.CircleSize / 4 + width / 2,
				bottom = height / 2,
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = false,
				alphaMultiplier = 1
			}
		elseif slotIndex == 4 then
			defaultAnimationState = {
				left = -CoD.DPadArea.CircleSize / 4 - width / 2,
				top = -height / 2,
				right = -CoD.DPadArea.CircleSize / 4 + width / 2,
				bottom = height / 2,
				leftAnchor = false,
				topAnchor = false,
				rightAnchor = true,
				bottomAnchor = false
			}
		end
		if defaultAnimationState ~= nil then
			actionSlot = LUI.UIElement.new( defaultAnimationState )
			if actionSlot ~= nil then
				self:addElement( actionSlot )
				self.actionSlots[slotIndex] = actionSlot
				local actionSlotImage = LUI.UIImage.new( {
					left = 0,
					top = 0,
					right = 0,
					bottom = 0,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = true,
					bottomAnchor = true,
					red = CoD.HUDBaseColor.r,
					green = CoD.HUDBaseColor.g,
					blue = CoD.HUDBaseColor.b,
					alpha = f2_local4,
					material = slotData.material
				} )
				actionSlot:addElement( actionSlotImage )
				if slotIndex ~= 1 and slotData.hasSelectFireAttachment == false then
					local actionSlotAmmo = LUI.UIText.new( {
						left = -10,
						top = -CoD.textSize.Default / 2,
						right = 10,
						bottom = CoD.textSize.Default / 2,
						leftAnchor = false,
						topAnchor = false,
						rightAnchor = false,
						bottomAnchor = false,
						red = 1,
						green = 1,
						blue = 1,
						alpha = CoD.HUDAlphaFull
					} )
					actionSlotAmmo:setText( slotData.ammo )
					actionSlot:addElement( actionSlotAmmo )
				end
				if CoD.isPC then
					local defaultKeyPromptAnimationState = nil
					if slotIndex == 1 then
						defaultKeyPromptAnimationState = {
							leftAnchor = false,
							rightAnchor = true,
							left = -width,
							right = 0,
							topAnchor = false,
							bottomAnchor = false,
							top = -width / 2 - slotIndex * width,
							bottom = width / 2 - slotIndex * width,
							alignment = LUI.Alignment.Right
						}
					elseif slotIndex == 3 then
						defaultKeyPromptAnimationState = {
							leftAnchor = false,
							rightAnchor = true,
							left = -width,
							right = 0,
							topAnchor = false,
							bottomAnchor = false,
							top = -width / 2 - slotIndex * width,
							bottom = width / 2 - slotIndex * width,
							alignment = LUI.Alignment.Right
						}
					elseif slotIndex == 2 then
						defaultKeyPromptAnimationState = {
							leftAnchor = false,
							rightAnchor = true,
							left = -width,
							right = 0,
							topAnchor = false,
							bottomAnchor = true,
							top = -width / 2 - slotIndex * width,
							bottom = width / 2 - slotIndex * width,
							alignment = LUI.Alignment.Right
						}
					elseif slotIndex == 4 then
						defaultKeyPromptAnimationState = {
							leftAnchor = false,
							rightAnchor = true,
							left = -width,
							right = 0,
							topAnchor = false,
							bottomAnchor = true,
							top = -width / 2 - slotIndex * width,
							bottom = width / 2 - slotIndex * width,
							alignment = LUI.Alignment.Right
						}
					end
					if defaultKeyPromptAnimationState ~= nil then
						actionSlot.slotIndex = slotIndex
						actionSlot.keyPrompt = LUI.UIText.new( defaultKeyPromptAnimationState )
						actionSlot.keyPrompt:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
						actionSlot.keyPrompt:setFont( CoD.fonts.Condensed )
						actionSlot.keyPrompt:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
						actionSlot.keyPrompt:setLeftRight( false, true, -width - 120, -width - 10 )
						actionSlot.keyPrompt:setAlpha( 0.5 )
						actionSlot.keyPrompt:setAlignment( LUI.Alignment.Right )
						actionSlot:registerAnimationState( "KeyPrompt", defaultKeyPromptAnimationState )
						actionSlot:addElement( actionSlot.keyPrompt )
						if CoD.useController and Engine.LastInput_Gamepad() then
							CoD.DPadArea.ActionSlotInputSourceChanged( actionSlot, {
								source = 0
							} )
						else
							CoD.DPadArea.ActionSlotInputSourceChanged( actionSlot, {
								source = 1
							} )
						end
					end
				end
			end
		end
	end
end

CoD.DPadArea.UpdateInventoryWeapon = function ( self, event )
	local inventoryWeapon = self.inventoryWeapon
	local animationDuration = nil
	if event.teleported ~= true then
		animationDuration = CoD.DPadArea.InventoryAnimationDuration
	end
	if event.materialName ~= nil then
		local inventoryWeaponIcon = self.inventoryWeaponIcon
		inventoryWeaponIcon:registerAnimationState( "default", {
			material = event.material
		} )
		inventoryWeaponIcon:animateToState( "default" )
		inventoryWeapon:animateToState( "show", animationDuration )
	else
		inventoryWeapon:animateToState( "default", animationDuration )
	end
end

CoD.DPadArea.UpdateFading = function ( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
		if event.alpha == 0 then
			self:beginAnimation( "fading", 500 )
		end
		self:setAlpha( event.alpha )
	end
end

CoD.DPadArea.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_scorestreaks" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.m_inputDisabled = nil
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.m_inputDisabled = true
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.DPadArea.UpdateTeamChange = function ( self, event )
	if Dvar.ui_gametype:get() == CoD.Zombie.GAMETYPE_ZCLEANSED then
		if event.team == Enum.team_t.TEAM_AXIS then
			if self.visible == true then
				self:setAlpha( 0 )
				self.m_inputDisabled = true
				self.visible = false
			end
		elseif self.visible ~= true then
			self:setAlpha( 1 )
			self.m_inputDisabled = nil
			self.visible = true
		end
	end
end

CoD.DPadArea.SetKeyBind = function ( self )
	local text, binding = nil
	if self.keyPrompt ~= nil and self.slotIndex ~= nil then
		if self.slotIndex == 4 then
			binding = "+actionslot 4"
		elseif self.slotIndex == 3 then
			binding = "+actionslot 3"
		elseif self.slotIndex == 1 then
			binding = "+actionslot 1"
		elseif self.slotIndex == 2 then
			binding = "+actionslot 2"
		end
		if binding ~= nil then
			self.keyPrompt:setText( Engine.GetKeyBindingLocalizedString( 0, binding, 0 ) )
		end
	end
end

CoD.DPadArea.ActionSlotInputSourceChanged = function ( self, event )
	if CoD.isPC then
		if CoD.useController and event.source == 0 then
			self:animateToState( "default" )
			if self.keyPrompt ~= nil then
				self.keyPrompt:setAlpha( 0 )
			end
		else
			self:animateToState( "KeyPrompt" )
			CoD.DPadArea.SetKeyBind( self )
			if self.keyPrompt ~= nil then
				self.keyPrompt:setAlpha( 0.8 )
			end
		end
	end
end

CoD.DPadArea.InputSourceChanged = function ( self, event )
	if CoD.isPC then
		if CoD.useController and event.source == 0 then
			if self.carouselArrows ~= nil then
				self.carouselArrows:setAlpha( 1 )
			end
			if self.circleBackground ~= nil then
				self.circleBackground:setAlpha( 1 )
			end
		else
			if self.carouselArrows ~= nil then
				self.carouselArrows:setAlpha( 0 )
			end
			if self.circleBackground ~= nil then
				self.circleBackground:setAlpha( 0 )
			end
		end
		if self.actionSlots ~= nil then
			for slotIndex, actionSlot in pairs( self.actionSlots ) do
				CoD.DPadArea.ActionSlotInputSourceChanged( actionSlot, event )
			end
		end
	end
end

