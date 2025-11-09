CoD.PipContainer = {}
CoD.PipContainer.PipWidth = 225
CoD.PipContainer.PipHeight = CoD.PipContainer.PipWidth * 0.75
CoD.PipContainer.PipOffset = 5
CoD.PipContainer.Spacing = 5
CoD.PipContainer.SignalMaterial = RegisterMaterial( "hud_sp_signal_strength_anim" )
CoD.PipContainer.SignalImageWidth = 24
CoD.PipContainer.SignalImageHeight = CoD.PipContainer.SignalImageWidth
CoD.PipContainer.ColorValue = {}
CoD.PipContainer.ColorValue.r = 1
CoD.PipContainer.ColorValue.b = 1
CoD.PipContainer.ColorValue.g = 1
CoD.PipContainer.new = function ( controller )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self.id = self.id .. ".PipContainer"
	self.controller = controller
	local imageHolder = LUI.UIElement.new()
	imageHolder:setLeftRight( true, true, 0, 0 )
	imageHolder:setTopBottom( true, true, 0, 0 )
	imageHolder.id = self.id .. ".PipImageHolder"
	self:addElement( imageHolder )
	imageHolder:registerEventHandler( "transition_complete_minimize", CoD.PipContainer.CloseSlot )
	local defaultAnimationState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	local diamondBackground = CoD.VisorImage.new( "menu_vis_diamond_group", defaultAnimationState, {
		r = 0.05,
		g = 0.05,
		b = 0.05
	} )
	diamondBackground.id = diamondBackground.id .. ".DiamondBackground"
	imageHolder:addElement( diamondBackground )
	diamondBackground:setAlpha( 0 )
	imageHolder.diamondBackground = diamondBackground
	local minimapBracket = CoD.VisorImage.new( "visor_bracket_minimap", {
		leftAnchor = true,
		rightAnchor = true,
		left = -18,
		right = 25,
		topAnchor = true,
		bottomAnchor = true,
		top = -18,
		bottom = 18
	}, {
		r = 1,
		g = 1,
		b = 1
	} )
	imageHolder:addElement( minimapBracket )
	minimapBracket:setAlpha( 0 )
	imageHolder.bracket = minimapBracket
	local leftOffset = 17
	local bottomOffset = -7
	
	local signalImage = LUI.UIImage.new()
	signalImage:setLeftRight( true, false, leftOffset, CoD.PipContainer.SignalImageWidth + leftOffset )
	signalImage:setTopBottom( false, true, -CoD.PipContainer.SignalImageHeight + bottomOffset, bottomOffset )
	signalImage:setImage( CoD.PipContainer.SignalMaterial )
	signalImage:setRGB( 0.4, 0.4, 0.4 )
	signalImage:setAlpha( 0 )
	signalImage.id = signalImage.id .. ".SignalStrength"
	self.imageHolder = imageHolder
	signalImage:registerEventHandler( "show", CoD.PipContainer.ShowAnimation )
	imageHolder:addElement( signalImage )
	imageHolder.signalImage = signalImage
	
	self:registerEventHandler( "maximize_pip", CoD.PipContainer.MaximizePip )
	self:registerEventHandler( "minimize_pip", CoD.PipContainer.MinimizePip )
	self:registerEventHandler( "fullscreen_pip", CoD.PipContainer.FullscreenPip )
	self:registerEventHandler( "fullscreen_animate", CoD.PipContainer.FullscreenAnimate )
	self:registerEventHandler( "minimize_fullscreen_pip", CoD.PipContainer.MinimizeFullscreenPip )
	self:registerEventHandler( "dispatch_minimize", CoD.PipContainer.DispatchMinimizeToParent )
	self:registerEventHandler( "remove_pip", CoD.PipContainer.RemovePip )
	self.addSlot = CoD.PipContainer.AddSlot
	self:registerEventHandler( "extracam_show", CoD.PipContainer.ExtraCamShow )
	self:registerEventHandler( "extracam_show_large", CoD.PipContainer.ExtraCamShow )
	self:registerEventHandler( "extracam_hide", CoD.PipContainer.ExtraCamHide )
	self:registerEventHandler( "cinematic_start", CoD.PipContainer.BinkStart )
	self:registerEventHandler( "cinematic_stop", CoD.PipContainer.BinkStop )
	return self
end

CoD.PipContainer.MaximizeAnimation = function ( self, duration, scale )
	if not duration then
		duration = 0
	end
	if not scale then
		scale = 1
	end
	self:completeAnimation()
	self:beginAnimation( "maximize", duration )
	self:setLeftRight( true, false, 0, CoD.PipContainer.PipWidth * scale )
	self:setTopBottom( true, false, 0, CoD.PipContainer.PipHeight * scale )
end

CoD.PipContainer.MinimizeAnimation = function ( self, duration )
	if not duration then
		duration = 0
	end
	self:beginAnimation( "minimize", duration )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
end

CoD.PipContainer.AddSlot = function ( self, materialName, binkName )
	local image = nil
	local animationState = CoD.GetDefaultAnimationState()
	if binkName ~= nil then
		image = CoD.VisorImage.new( "visor_bink", animationState, CoD.PipContainer.ColorValue )
	else
		image = CoD.VisorImage.new( materialName, animationState, CoD.PipContainer.ColorValue )
	end
	image.id = image.id .. ".PipImage"
	if materialName ~= nil then
		image.id = image.id .. "." .. materialName
	elseif binkName ~= nil then
		image.id = image.id .. "." .. binkName
	end
	self.imageHolder:addElement( image )
	self.imageHolder.controller = self.controller
	self.imageHolder.image = image
	self.imageHolder.materialName = materialName
	self.imageHolder.binkName = binkName
	self.imageHolder.inUse = true
end

CoD.PipContainer.ShowAnimation = function ( self, event )
	local duration = event.duration
	self:beginAnimation( "show", duration or 0 )
	self:setAlpha( 1 )
end

CoD.PipContainer.MaximizePip = function ( self, event )
	CoD.PipContainer.MaximizeAnimation( self.imageHolder, event.duration, event.scale )
	if self.imageHolder.binkName ~= nil then
		self.imageHolder.diamondBackground:beginAnimation( "show", event.duration )
		self.imageHolder.diamondBackground:setAlpha( 1 )
		self.imageHolder.bracket:beginAnimation( "show" )
		self.imageHolder.bracket:setAlpha( 1 )
		self:addElement( LUI.UITimer.new( event.duration - 100, "show", true, self.imageHolder.signalImage ) )
	end
end

CoD.PipContainer.MinimizePip = function ( self, event )
	CoD.PipContainer.MinimizeAnimation( self.imageHolder, event.duration )
	self:dispatchEventToParent( {
		name = "default_anim",
		duration = event.duration
	} )
	if self.imageHolder.binkName ~= nil then
		self.imageHolder.diamondBackground:beginAnimation( "hide", event.duration )
		self.imageHolder.diamondBackground:setAlpha( 0 )
		self.imageHolder.bracket:beginAnimation( "hide" )
		self.imageHolder.bracket:setAlpha( 0 )
		self.imageHolder.signalImage:beginAnimation( "hide", 100 )
		self.imageHolder.signalImage:setAlpha( 0 )
	end
end

CoD.PipContainer.FullscreenPip = function ( self, event )
	if not self.imageHolder.inUse then
		return 
	elseif event ~= nil then
		local duration = event.data[1]
		self:dispatchEventToParent( {
			name = "resize_pip_fullscreen",
			duration = duration or 1000
		} )
	end
end

CoD.PipContainer.FullscreenAnimate = function ( self, event )
	local duration = event.duration
	self.imageHolder:beginAnimation( "fullscreen", duration or 1000 )
	self.imageHolder:setLeftRight( true, true, 0, 0 )
	self.imageHolder:setTopBottom( true, true, 0, 0 )
end

CoD.PipContainer.MinimizeFullscreenPip = function ( self, event )
	local duration = event.data[1]
	duration = duration or 1000
	CoD.PipContainer.MaximizeAnimation( self.imageHolder, duration )
	self:dispatchEventToParent( {
		name = "default_anim",
		duration = duration
	} )
	if self.imageHolder.binkName ~= nil then
		self.imageHolder.diamondBackground:beginAnimation( "show", duration )
		self.imageHolder.diamondBackground:setAlpha( 1 )
		self.imageHolder.bracket:beginAnimation( "show" )
		self.imageHolder.bracket:setAlpha( 1 )
		local delay = duration - 100
		if delay < 0 then
			delay = 0
		end
		self:addElement( LUI.UITimer.new( delay, "show", true, self.imageHolder.signalImage ) )
	end
end

CoD.PipContainer.DispatchMinimizeToParent = function ( self, event )
	self:dispatchEventToParent( {
		name = "default_anim",
		duration = event.duration
	} )
end

CoD.PipContainer.CloseSlot = function ( self, event )
	if self.binkName ~= nil and self.image.cinematicId ~= nil then
		Engine.Stop3DCinematic( self.image.cinematicId )
		Engine.SendMenuResponse( self.controller, "cinematic", self.image.cinematicId )
	end
	self:dispatchEventToParent( {
		name = "remove_pip"
	} )
	self:dispatchEventToParent( {
		name = "show_block_container",
		duration = 500
	} )
end

CoD.PipContainer.RemovePip = function ( self, event )
	if self.imageHolder.image ~= nil then
		self.imageHolder.image:close()
		self.imageHolder.inUse = nil
	end
end

CoD.PipContainer.ExtraCamShow = function ( self, event )
	if self.imageHolder.inUse then
		return 
	elseif event.data ~= nil and event.data[1] ~= nil then
		local extraCamName = Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" )
		self:addSlot( extraCamName )
		if event.data[2] == 1 then
			self:processEvent( {
				name = "fullscreen_pip",
				data = {
					0
				}
			} )
		else
			local scale = 1
			if event.name == "extracam_show_large" then
				scale = 2
			end
			self:processEvent( {
				name = "maximize_pip",
				duration = 500,
				scale = scale
			} )
		end
		self:dispatchEventToParent( {
			name = "hide_block_container",
			duration = 500
		} )
	end
end

CoD.PipContainer.ExtraCamHide = function ( self, event )
	if event.data ~= nil and event.data[1] ~= nil then
		local extraCamName = Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" )
		self:processEvent( {
			name = "minimize_pip",
			duration = 500
		} )
	end
end

CoD.PipContainer.BinkStart = function ( self, event )
	if self.imageHolder.inUse then
		return 
	elseif event.data and event.data[1] and event.data[2] then
		local binkMaterial = Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" )
		local binkName = Engine.GetIString( event.data[2], "CS_LOCALIZED_STRINGS" )
		local isLooping = false
		local isInMemory = false
		local isStartPaused = false
		local isSyncAudio = false
		if event.data[6] then
			if event.data[6] ~= 0 then
				isSyncAudio = true
			else
				isSyncAudio = false
			end
		end
		if event.data[5] then
			if event.data[5] ~= 0 then
				isStartPaused = true
			else
				isStartPaused = false
			end
		end
		if event.data[4] then
			if event.data[4] ~= 0 then
				isInMemory = true
			else
				isInMemory = false
			end
		end
		if event.data[3] then
			if event.data[3] ~= 0 then
				isLooping = true
			else
				isLooping = false
			end
		end
		if binkName then
			self:addSlot( binkMaterial, binkName )
			if event.data[7] then
				local startSize = event.data[7]
				if startSize == 1 then
					self:processEvent( {
						name = "maximize_pip",
						duration = 500,
						scale = 2
					} )
				elseif startSize == 2 then
					self:processEvent( {
						name = "fullscreen_pip",
						data = {
							0
						}
					} )
				else
					self:processEvent( {
						name = "maximize_pip",
						duration = 500,
						scale = 1
					} )
				end
			end
			self.imageHolder.image.cinematicId = Engine.Start3DCinematic( binkName, isLooping, isInMemory, isStartPaused, isSyncAudio )
			Engine.SendMenuResponse( self.controller, "cinematic", self.imageHolder.image.cinematicId )
			if isLooping == false then
				self.imageHolder.cinematicPreloadingTimer = LUI.UITimer.new( 500, "preload_timer", false )
				self.imageHolder:addElement( self.imageHolder.cinematicPreloadingTimer )
				self.imageHolder:registerEventHandler( "preload_timer", CoD.PipContainer.GetTimeRemaining )
			end
			self:dispatchEventToParent( {
				name = "hide_block_container",
				duration = 500
			} )
		end
	end
end

CoD.PipContainer.GetTimeRemaining = function ( self, event )
	if Engine.IsCinematicPreloading( self.image.cinematicId ) == false then
		local timeRemaining = Engine.GetCinematicTimeRemaining( self.image.cinematicId )
		if timeRemaining > 1 then
			timeRemaining = timeRemaining - 0.5
		end
		self.image:addElement( LUI.UITimer.new( timeRemaining * 1000, "cinematic_timer", true, self ) )
		self.image:registerEventHandler( "cinematic_timer", CoD.PipContainer.AutoBinkStop )
		self.cinematicPreloadingTimer:close()
	end
end

CoD.PipContainer.BinkStop = function ( self, event )
	self:processEvent( {
		name = "minimize_pip",
		duration = 500
	} )
	if self.imageHolder.cinematicPreloadingTimer ~= nil then
		self.imageHolder.cinematicPreloadingTimer:close()
	end
end

CoD.PipContainer.AutoBinkStop = function ( self, event )
	self:dispatchEventToParent( {
		name = "cinematic_stop",
		cinematicId = self.image.cinematicId
	} )
end

