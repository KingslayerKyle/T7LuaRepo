CoD.Compass = {}
CoD.Compass.SetHudUpdateBits = function ( self )
	self:registerEventHandler( "hud_update_refresh", CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_THIRDPERSON, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_KILLCAM, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EXTRACAM_ON, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.Compass.UpdateMinimapVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_GAME_ENDED, CoD.Compass.UpdateMinimapVisibility )
end

CoD.Compass.SetHudUpdateBitsForSupportingItem = function ( self )
	self:registerEventHandler( "hud_update_refresh", CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_THIRDPERSON, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_KILLCAM, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EXTRACAM_ON, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.Compass.UpdateMinimapSupportingItemVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_GAME_ENDED, CoD.Compass.UpdateMinimapSupportingItemVisibility )
end

CoD.Compass.new = function ( defaultAnimationState, compassType )
	local self = LUI.UIElement.new( defaultAnimationState )
	local compassUnderlayStencilContainer = LUI.UIContainer.new()
	self:addElement( compassUnderlayStencilContainer )
	if compassType == Enum.CompassType.COMPASS_TYPE_PARTIAL then
		local compassBorder = LUI.UIImage.new()
		compassBorder:setLeftRight( true, true, 0, 0 )
		compassBorder:setTopBottom( true, true, 0, 0 )
		compassBorder:setImage( RegisterMaterial( "minimap_border" ) )
		compassBorder:setZoom( Dvar.cg_minimapPopOutZoom:get() )
		compassUnderlayStencilContainer:addElement( compassBorder )
	end
	local compassUnderlay = LUI.UIContainer.new()
	compassUnderlay:setupCompassUnderlay( compassType )
	compassUnderlayStencilContainer:addElement( compassUnderlay )
	local compassItems = LUI.UIContainer.new()
	compassItems:setupCompassItems( compassType )
	self:addElement( compassItems )
	local compassOverlayStencilContainer = LUI.UIContainer.new()
	compassOverlayStencilContainer:setUseStencil( true )
	local compassOverlay = LUI.UIContainer.new()
	compassOverlay:setupCompassOverlay( compassType )
	compassOverlayStencilContainer:addElement( compassOverlay )
	return self
end

CoD.Compass.AddMinimap = function ( self )
	self.compassScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	self.compassScaleContainer:setLeftRight( true, false, 0, 0 )
	self.compassScaleContainer:setTopBottom( true, false, 0, 0 )
	self.safeArea:addElement( self.compassScaleContainer )
	self.miniMapContainer = LUI.UIContainer.new()
	if Engine.DvarBool( nil, "ShakeHUD" ) or Engine.DvarBool( nil, "ParallaxHUD" ) then
		local offset = 10
		if Engine.DvarBool( nil, "ParallaxHUD" ) then
			self.miniMapHudShaker = CoD.HUDShaker.new( 10, 10 )
		else
			self.miniMapHudShaker = CoD.HUDShaker.new( 0, 0 )
		end
		self.miniMapHudShaker:setLeftRight( true, false, 13 + offset, 316 + offset )
		self.miniMapHudShaker:setTopBottom( true, false, 7 + offset, 213 + offset )
		self.compassScaleContainer:addElement( self.miniMapHudShaker )
		self.miniMapContainer:setLeftRight( true, true, 0, 0 )
		self.miniMapContainer:setTopBottom( true, true, 0, 0 )
		self.miniMapContainer:setXRot( -20 )
		self.miniMapContainer:setYRot( 35 )
		self.miniMapHudShaker:addElement( self.miniMapContainer )
	else
		self.miniMapContainer:setLeftRight( true, true, 0, 0 )
		self.miniMapContainer:setTopBottom( true, true, 0, 0 )
		self.miniMapContainer:setXRot( -20 )
		self.miniMapContainer:setYRot( 35 )
		self.miniMapContainer:setLeftRight( true, false, 13, 280 )
		self.miniMapContainer:setTopBottom( true, false, 7, 187 )
		self.compassScaleContainer:addElement( self.miniMapContainer )
	end
	local topBarBgContainer = LUI.UIElement.new()
	topBarBgContainer:setLeftRight( true, true, 0, 0 )
	topBarBgContainer:setTopBottom( false, true, -32, -6 )
	local topBarBg = LUI.UIImage.new()
	topBarBg:setLeftRight( true, true, 0, 0 )
	topBarBg:setTopBottom( true, true, 0, 0 )
	topBarBg:setRGB( 0, 0, 0 )
	topBarBg:setAlpha( 0.25 )
	topBarBgContainer:addElement( topBarBg )
	local topBarBgBorder = CoD.BorderT6.new( 1, 1, 1, 1, 0.25 )
	topBarBgContainer:addElement( topBarBgBorder )
	local topBar = nil
	topBar = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -18,
		bottom = 0,
		red = 1,
		green = 1,
		blue = 1,
		material = RegisterMaterial( "hud_horizontal_compass_minimap_t7" ),
		shaderVector0 = {
			0.6,
			0,
			0,
			0
		}
	} )
	topBar:setupHorizontalCompass( 0.75 )
	self.miniMapContainer:addElement( topBar )
	local compassDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = -30
	}
	local miniMap = CoD.Compass.new( compassDefaultAnimState, Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self.miniMapContainer:addElement( miniMap )
	self.miniMapContainer:setAlpha( 0 )
	self.miniMapContainer.visible = false
	CoD.Compass.SetHudUpdateBits( self.miniMapContainer )
end

CoD.Compass.UpdateMinimapVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_THIRDPERSON ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EXTRACAM_ON ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and (not CoD.IsShoutcaster( event.controller ) or CoD.ExeProfileVarBool( event.controller, "shoutcaster_minimap" ) and Engine.IsSpectatingActiveClient( controller )) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

CoD.Compass.UpdateMinimapSupportingItemVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_THIRDPERSON ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EXTRACAM_ON ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and (not CoD.IsShoutcaster( event.controller ) or CoD.ExeProfileVarBool( event.controller, "shoutcaster_minimap" ) and Engine.IsSpectatingActiveClient( controller )) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

CoD.Compass.AddInGameMap = function ( self, controller, animState )
	self.mapContainer = LUI.UIElement.new( animState )
	self:addElement( self.mapContainer )
	local compassDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	local fullMap = CoD.Compass.new( compassDefaultAnimState, Enum.CompassType.COMPASS_TYPE_FULL )
	fullMap:setPriority( 100 )
	self.mapContainer:addElement( fullMap )
	self.mapContainer:setAlpha( 0 )
	self.mapContainer.visible = false
	self.mapContainer:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.Compass.UpdateInGameMapVisibility )
	CoD.Compass.UpdateInGameMapVisibility( self.mapContainer, {
		controller = controller
	} )
end

CoD.Compass.UpdateInGameMapVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

