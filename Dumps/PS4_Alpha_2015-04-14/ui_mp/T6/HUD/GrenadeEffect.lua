CoD.GrenadeEffect = {}
CoD.GrenadeEffect.new = function ( controller )
	local self = LUI.UIElement.new()
	self:setAlpha( 0 )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	
	local safeArea = LUI.UIElement.new()
	safeArea:setLeftRight( false, false, -safeAreaWidth / 2, safeAreaWidth / 2 )
	safeArea:setTopBottom( false, false, -safeAreaHeight / 2, safeAreaHeight / 2 )
	self:addElement( safeArea )
	self.safeArea = safeArea
	
	self:registerEventHandler( "hud_update_refresh", CoD.GrenadeEffect.UpdateVisibility )
	self:registerEventHandler( "prox_grenade_notify", CoD.GrenadeEffect.GrenadeExplode )
	local UpdateVisibility_Internal = function ( model )
		CoD.GrenadeEffect.UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	return self
end

CoD.GrenadeEffect.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.GrenadeEffect.GrenadeExplode = function ( self, event )
	local forwardAngle = event.data[1]
	local rightAngle = event.data[2]
	local distanceToGrenade = event.data[3]
	local screenEdgeAngle = 30
	local minAngle, maxAngle, centerYmin, centerYmax, centerXmin, centerXmax, minScale, maxScale = nil
	local verticalScreenEdgeAngle = 80
	local proximityGrenadeDamageRadius = 200
	local imageWidth = 512
	local imageHeight = 256
	local rotation, centerY, centerX, scale = nil
	local leftOrRight = 1
	local image2Flip = 0
	if forwardAngle <= screenEdgeAngle then
		minAngle = 0
		maxAngle = 30
		centerYmin = 0
		centerYmax = 0
		centerXmin = 0
		centerXmax = 256
		minScale = 1
		maxScale = 1
		rotation = math.random( minAngle, maxAngle )
		centerY = centerYmin + distanceToGrenade / proximityGrenadeDamageRadius * (centerYmax - centerYmin)
		centerX = math.random( centerXmin, centerXmax )
		scale = minScale + distanceToGrenade / proximityGrenadeDamageRadius * (maxScale - minScale)
		imageWidth = imageWidth * scale
		imageHeight = imageHeight * scale
		image2Flip = 90
	else
		minAngle = 0
		maxAngle = 30
		centerYmin = 0
		centerYmax = 0
		centerXmin = 0
		centerXmax = 256
		minScale = 1
		maxScale = 1
		rotation = 90 + math.random( minAngle, maxAngle )
		centerY = centerYmin + distanceToGrenade / proximityGrenadeDamageRadius * (centerYmax - centerYmin)
		centerX = forwardAngle / verticalScreenEdgeAngle * 320
		scale = minScale + distanceToGrenade / proximityGrenadeDamageRadius * (maxScale - minScale)
		imageWidth = imageWidth * scale
		imageHeight = imageHeight * scale
		if rightAngle > 90 then
			leftOrRight = -1
		end
	end
	local GrenadeEffectContainer = LUI.UIElement.new()
	GrenadeEffectContainer:setLeftRight( true, true, 0, 0 )
	GrenadeEffectContainer:setTopBottom( true, true, 0, 0 )
	GrenadeEffectContainer:setAlpha( 0 )
	self.safeArea:addElement( GrenadeEffectContainer )
	local image2Rotation, image2centerY, image2centerX = nil
	local image2minAngle = 0
	local image2maxAngle = 30
	local image2Width = 512
	local image2Height = 256
	local image2centerYmin = 0
	local image2centerYmax = 0
	local image2centerXmin = 0
	local image2centerXmax = 256
	image2Rotation = image2Flip + math.random( image2minAngle, image2maxAngle )
	image2centerY = math.random( image2centerYmin, image2centerYmax )
	image2centerX = math.random( image2centerXmin, image2centerXmax )
	GrenadeEffectContainer:registerEventHandler( "transition_complete_state_full_alpha", CoD.GrenadeEffect.SwitchToAlphaMed )
	GrenadeEffectContainer:registerEventHandler( "transition_complete_state_alpha_med", CoD.GrenadeEffect.SwitchToZeroAlpha )
	GrenadeEffectContainer:registerEventHandler( "transition_complete_state_alpha_zero", CoD.GrenadeEffect.CloseOut )
	GrenadeEffectContainer:beginAnimation( "state_full_alpha", 100 )
	GrenadeEffectContainer:setAlpha( 1 )
	GrenadeEffectContainer.image = dropletsImage
end

CoD.GrenadeEffect.SwitchToAlphaMed = function ( self, event )
	if event.interrupted ~= true then
		self:beginAnimation( "state_alpha_med", 1000, true, false )
		self:setAlpha( 0.7 )
	end
end

CoD.GrenadeEffect.SwitchToZeroAlpha = function ( self, event )
	if event.interrupted ~= true then
		self:beginAnimation( "state_alpha_zero", 5000, false, true )
		self:setAlpha( 0 )
	end
end

CoD.GrenadeEffect.CloseOut = function ( self, event )
	if event.interrupted ~= true then
		self:close()
	end
end

