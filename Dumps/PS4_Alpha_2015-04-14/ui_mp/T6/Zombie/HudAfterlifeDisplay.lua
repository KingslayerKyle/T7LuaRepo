CoD.HudAfterlifeDisplay = {}
CoD.HudAfterlifeDisplay.OutOfAfterLifeIconAlpha = 1
CoD.HudAfterlifeDisplay.IconRatio = 2
CoD.HudAfterlifeDisplay.IconWidth = 100
CoD.HudAfterlifeDisplay.IconHeight = CoD.HudAfterlifeDisplay.IconWidth / CoD.HudAfterlifeDisplay.IconRatio
CoD.HudAfterlifeDisplay.InventoryWidth = 64
CoD.HudAfterlifeDisplay.InventoryHeight = CoD.HudAfterlifeDisplay.InventoryWidth / CoD.HudAfterlifeDisplay.IconRatio
CoD.HudAfterlifeDisplay.PULSE_DURATION = 3000
LUI.createMenu.AfterlifeArea = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "AfterlifeArea", controller )
	self:setOwner( controller )
	CoD.HudAfterlifeDisplay.AfterlifeMeterMaterial = RegisterMaterial( "hud_zombie_afterlife_meter" )
	self.bottomScaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.bottomScaleContainer:setLeftRight( false, false, 0, 0 )
	self.bottomScaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.bottomScaleContainer )
	local afterlifeIconContainerTopOffset = 15
	local afterlifeIconContainer = LUI.UIElement.new()
	afterlifeIconContainer:setLeftRight( false, false, -CoD.HudAfterlifeDisplay.IconWidth / 2, CoD.HudAfterlifeDisplay.IconWidth / 2 )
	afterlifeIconContainer:setTopBottom( false, true, -CoD.HudAfterlifeDisplay.IconHeight - afterlifeIconContainerTopOffset, -afterlifeIconContainerTopOffset )
	afterlifeIconContainer:setAlpha( 0 )
	self.bottomScaleContainer:addElement( afterlifeIconContainer )
	self.afterlifeIconContainer = afterlifeIconContainer
	
	local afterlifeIcon = LUI.UIImage.new()
	afterlifeIcon:setLeftRight( true, true, 0, 0 )
	afterlifeIcon:setTopBottom( true, true, 0, 0 )
	afterlifeIcon:setImage( CoD.HudAfterlifeDisplay.AfterlifeMeterMaterial )
	afterlifeIcon:setAlpha( CoD.HudAfterlifeDisplay.OutOfAfterLifeIconAlpha )
	afterlifeIcon:setShaderVector( 0, -1, 0, 0, 0 )
	afterlifeIconContainer:addElement( afterlifeIcon )
	self.afterlifeIcon = afterlifeIcon
	
	self.bottomRightScaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.bottomRightScaleContainer:setLeftRight( false, true, 0, 0 )
	self.bottomRightScaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.bottomRightScaleContainer )
	local inventoryLeftOffset = -32
	local inventoryTopOffset = 175
	local afterLifeInventoryContainer = LUI.UIElement.new()
	afterLifeInventoryContainer:setLeftRight( false, true, -CoD.HudAfterlifeDisplay.InventoryWidth + inventoryLeftOffset, inventoryLeftOffset )
	afterLifeInventoryContainer:setTopBottom( false, true, -CoD.HudAfterlifeDisplay.InventoryHeight - inventoryTopOffset, -inventoryTopOffset )
	afterLifeInventoryContainer:setAlpha( 0 )
	self.bottomRightScaleContainer:addElement( afterLifeInventoryContainer )
	self.afterLifeInventoryContainer = afterLifeInventoryContainer
	local afterlifeInventoryIcon = LUI.UIImage.new()
	afterlifeInventoryIcon:setLeftRight( true, true, 0, 0 )
	afterlifeInventoryIcon:setTopBottom( true, true, 0, 0 )
	afterlifeInventoryIcon:setImage( CoD.HudAfterlifeDisplay.AfterlifeMeterMaterial )
	afterlifeInventoryIcon:setAlpha( 0.5 )
	afterlifeInventoryIcon:setShaderVector( 0, 1, 0, 0, 0 )
	self.afterlifeInventoryIcon = afterlifeInventoryIcon
	afterLifeInventoryContainer:addElement( afterlifeInventoryIcon )
	local fontType = "Default"
	local afterlifeFont = CoD.fonts[fontType]
	local afterlifeTextSize = CoD.textSize[fontType]
	local afterlifeTextLeftOffset = 5
	local afterlifeTextTopOffset = 5
	
	local afterlifeInventoryCount = LUI.UIText.new()
	afterlifeInventoryCount:setLeftRight( true, true, 0, -afterlifeTextLeftOffset )
	afterlifeInventoryCount:setTopBottom( false, true, -afterlifeTextSize + afterlifeTextTopOffset, afterlifeTextTopOffset )
	afterlifeInventoryCount:setFont( afterlifeFont )
	afterlifeInventoryCount:setAlignment( LUI.Alignment.Right )
	afterLifeInventoryContainer:addElement( afterlifeInventoryCount )
	self.afterlifeInventoryCount = afterlifeInventoryCount
	
	afterlifeInventoryIcon:setAlpha( 0 )
	afterlifeInventoryCount:setAlpha( 0 )
	self.afterlifeWaypointIcons = {}
	self.inAfterlife = true
	self.clientNum = -1
	self:registerEventHandler( "player_lives", CoD.HudAfterlifeDisplay.UpdatePlayerLives )
	self:registerEventHandler( "player_in_afterlife", CoD.HudAfterlifeDisplay.UpdatePlayerInAfterlife )
	self:registerEventHandler( "player_afterlife_mana", CoD.HudAfterlifeDisplay.UpdateAfterlifeMana )
	self:registerEventHandler( "demo_jump", CoD.HudAfterlifeDisplay.UpdateAfterlifeIconsDemoJump )
	self:registerEventHandler( "hud_update_refresh", CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.HudAfterlifeDisplay.UpdateVisibility )
	self.visible = true
	return self
end

CoD.HudAfterlifeDisplay.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_scorestreaks" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) then
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

CoD.HudAfterlifeDisplay.UpdatePlayerLives = function ( self, event )
	self.afterlifeInventoryCount:setText( event.newValue )
	self.afterlifeInventoryCount:setAlpha( 1 )
	self.afterlifeInventoryIcon:setAlpha( 0.5 )
	if event.oldValue < event.newValue then
		if self.afterLifeInventoryContainer.alternatorTimer then
			self.afterLifeInventoryContainer:closeStateAlternator()
		end
		self.afterLifeInventoryContainer:alternateStates( CoD.HudAfterlifeDisplay.PULSE_DURATION, CoD.HudAfterlifeDisplay.PulseOff, CoD.HudAfterlifeDisplay.PulseOn, 500, 500, CoD.HudAfterlifeDisplay.PulseOn )
	end
end

CoD.HudAfterlifeDisplay.UpdatePlayerInAfterlife = function ( self, event )
	local f4_local0 = self.entNum ~= event.entNum
	self.entNum = event.entNum
	if event.newValue == 1 then
		self.inAfterlife = true
		self.afterlifeIconContainer:setAlpha( 0 )
		if event.wasDemoJump == false and f4_local0 == false then
			self.afterlifeIcon:setShaderVector( 0, 1, 0, 0, 0 )
		end
		self.afterLifeInventoryContainer:setAlpha( 0 )
		self.clientNum = event.entNum
	else
		self.inAfterlife = false
		self.afterlifeIconContainer:setAlpha( 0 )
		self.afterlifeIcon:setShaderVector( 0, 1, 0, 0, 0 )
		self.afterLifeInventoryContainer:setAlpha( 1 )
		self.clientNum = event.entNum
	end
end

CoD.HudAfterlifeDisplay.UpdateAfterlifeMana = function ( self, event )
	local f5_local0 = self.entNum ~= event.entNum
	self.afterlifeIcon:completeAnimation()
	if event.newValue ~= 0 and event.wasDemoJump == false and f5_local0 == false then
		self.afterlifeIcon:beginAnimation( "update_meter", 1500 )
	end
	self.afterlifeIcon:setShaderVector( 0, event.newValue, 0, 0, 0 )
end

CoD.HudAfterlifeDisplay.UpdateAfterlifeIconsDemoJump = function ( self, event )
	local iconsToRemove = {}
	for i = 1, #self.afterlifeWaypointIcons, 1 do
		if Engine.IsEntityNumberInUse( event.controller, self.afterlifeWaypointIcons[i].entNum, CoD.EntityType.ET_SCRIPTMOVER ) == false then
			table.insert( iconsToRemove, i )
		end
	end
	for i = 1, #iconsToRemove, 1 do
		if self.afterlifeWaypointIcons[iconsToRemove[i]] then
			self.afterlifeWaypointIcons[iconsToRemove[i]]:close()
			table.remove( self.afterlifeWaypointIcons, iconsToRemove[i] )
		end
	end
end

CoD.HudAfterlifeDisplay.AfterlifeWaypointExists = function ( self, entNum )
	local waypointExists = false
	for i = 1, #self.afterlifeWaypointIcons, 1 do
		if self.afterlifeWaypointIcons[i].entNum == entNum then
			waypointExists = true
			break
		end
	end
	return waypointExists
end

CoD.HudAfterlifeDisplay.PulseOff = function ( self, time )
	self:beginAnimation( "pulse_off", time )
	self:setAlpha( 0.1 )
end

CoD.HudAfterlifeDisplay.PulseOn = function ( self, time )
	self:beginAnimation( "pulse_on", time )
	self:setAlpha( 1 )
end

