require( "T6.PipContainer" )

CoD.LoadBlocks = {}
CoD.LoadBlocks.DefaultLeft = CoD.VisorLeftBracket.BracketWidth
CoD.LoadBlocks.DefaultTop = CoD.VisorLeftBracket.BracketHeight
CoD.LoadBlocks.AppearTime = 50
CoD.LoadBlocks.DisappearTime = 50
CoD.LoadBlocks.FadeInTime = 200
CoD.LoadBlocks.FadeOutTime = 200
CoD.LoadBlocks.BlockMaterial = "menu_vis_diamond"
CoD.LoadBlocks.BracketMaterial = "menu_vis_bracket"
CoD.LoadBlocks.BracketLeftMaterial = "menu_vis_bracket_left"
CoD.LoadBlocks.DefaultAlpha = 1
CoD.LoadBlocks.BracketAlpha = 0.5
CoD.LoadBlocks.BlockAlpha = 0.5
CoD.LoadBlocks.BootupRowCount = 3
CoD.LoadBlocks.BootupColCount = 3
CoD.LoadBlocks.BootupGridSize = 7
CoD.LoadBlocks.BootupGridSpacing = CoD.LoadBlocks.BootupGridSize / 2
CoD.LoadBlocks.BootupWidth = (CoD.LoadBlocks.BootupGridSize + CoD.LoadBlocks.BootupGridSpacing) * (CoD.LoadBlocks.BootupRowCount + 1)
CoD.LoadBlocks.BootupHeight = (CoD.LoadBlocks.BootupGridSize + CoD.LoadBlocks.BootupGridSpacing) * (CoD.LoadBlocks.BootupColCount + 1)
CoD.LoadBlocks.new = function ( controller )
	local topOffset = -38
	local leftOffset = -42
	local container = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = CoD.LoadBlocks.DefaultLeft + CoD.LoadBlocks.BootupWidth / 2 + leftOffset,
		right = CoD.LoadBlocks.DefaultLeft + CoD.LoadBlocks.BootupWidth * 1.5 + leftOffset,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.VisorLeftBracket.BracketHeight / 2 + CoD.LoadBlocks.BootupHeight / 2 + topOffset,
		bottom = -CoD.VisorLeftBracket.BracketHeight / 2 + CoD.LoadBlocks.BootupHeight * 1.5 + topOffset,
		alpha = CoD.LoadBlocks.DefaultAlpha
	} )
	container.id = container.id .. ".PipBlockContainer"
	container.visible = true
	container:registerEventHandler( "resize_pip_fullscreen", CoD.LoadBlocks.ResizePipFullscreen )
	container:registerEventHandler( "dispatch_fullscreen_to_pip", CoD.LoadBlocks.DispatchFullscreenToPip )
	container:registerEventHandler( "default_anim", CoD.LoadBlocks.DefaultAnimation )
	container:registerEventHandler( "toggle_visibility", CoD.LoadBlocks.ToggleVisibility )
	container:registerEventHandler( "hide_block_container", CoD.LoadBlocks.HideBlockContainer )
	container:registerEventHandler( "show_block_container", CoD.LoadBlocks.ShowBlockContainer )
	container:registerEventHandler( "bootup_switch_to_hud", CoD.LoadBlocks.BootupSwitchToHUD )
	container.pipContainer = CoD.PipContainer.new( controller )
	container:addElement( container.pipContainer )
	return container
end

CoD.LoadBlocks.DispatchFullscreenToPip = function ( self, event )
	self.pipContainer:processEvent( {
		name = "fullscreen_animate",
		duration = event.duration
	} )
end

CoD.LoadBlocks.ResizePipFullscreen = function ( self, event )
	local animationTime = 0
	local width = 1280
	local height = 720
	self:beginAnimation( "fullscreen_pip", animationTime )
	self:setLeftRight( false, false, -width / 2, width / 2 )
	self:setTopBottom( false, false, -height / 2, height / 2 )
	self:addElement( LUI.UITimer.new( animationTime, {
		name = "dispatch_fullscreen_to_pip",
		duration = event.duration
	}, true, self ) )
end

CoD.LoadBlocks.ToggleVisibility = function ( self, event )
	local duration = event.duration
	duration = duration or 1000
	if self.visible then
		self:beginAnimation( "hide", duration )
		self:setAlpha( 0 )
		self.visible = nil
	else
		self:beginAnimation( "show", duration )
		self:setAlpha( CoD.LoadBlocks.DefaultAlpha )
		self.visible = true
	end
end

CoD.LoadBlocks.DefaultAnimation = function ( self, event )
	local duration = event.duration
	duration = duration or 500
	local topOffset = -38
	local leftOffset = -42
	self:beginAnimation( "default", duration )
	self:setLeftRight( true, false, CoD.LoadBlocks.DefaultLeft + CoD.LoadBlocks.BootupWidth / 2 + leftOffset, CoD.LoadBlocks.DefaultLeft + CoD.LoadBlocks.BootupWidth * 1.5 + leftOffset )
	self:setTopBottom( false, false, -CoD.VisorLeftBracket.BracketHeight / 2 + CoD.LoadBlocks.BootupHeight / 2 + topOffset, -CoD.VisorLeftBracket.BracketHeight / 2 + CoD.LoadBlocks.BootupHeight * 1.5 + topOffset )
	self:setAlpha( CoD.LoadBlocks.DefaultAlpha )
end

CoD.LoadBlocks.HideBlockContainer = function ( self, event )
	self:dispatchEventToParent( {
		name = "hide_objective_text",
		duration = event.duration
	} )
end

CoD.LoadBlocks.ShowBlockContainer = function ( self, event )
	self:dispatchEventToParent( {
		name = "show_objective_text",
		duration = event.duration
	} )
end

CoD.LoadBlocks.CreateSmallGrid = function ( defaultAnimationState, row, col )
	local box = CoD.VisorImage.new( CoD.LoadBlocks.BlockMaterial, defaultAnimationState )
	box.id = box.id .. ".BoxImage_Row_" .. row .. "_Col_" .. col
	box:registerAnimationState( "hide", {
		alpha = 0
	} )
	box:registerAnimationState( "show", {
		alpha = 0.5
	} )
	box:registerAnimationState( "idle", {
		alpha = 0.5
	} )
	box:registerAnimationState( "fade_in", {
		alpha = CoD.LoadBlocks.BlockAlpha
	} )
	return box
end

CoD.LoadBlocks.BootupSwitchToHUD = function ( self, event )
	
end

