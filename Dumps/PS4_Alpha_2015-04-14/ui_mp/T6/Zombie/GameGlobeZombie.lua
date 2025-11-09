CoD.GameGlobeZombie = {}
CoD.GameGlobeZombie.gameGlobe = nil
CoD.GameGlobeZombie.ShaderVector2X = 0.52
CoD.GameGlobeZombie.ShaderVector2Z = 0.41
CoD.GameGlobeZombie.ShaderVector2XMax = math.pi / 2
CoD.GameGlobeZombie.ShaderVector2XMin = -math.pi / 2
CoD.GameGlobeZombie.ShaderVector2YMax = math.pi
CoD.GameGlobeZombie.ShaderVector2YMin = -math.pi
CoD.GameGlobeZombie.SelfRotationSpeed = math.pi / 10000
CoD.GameGlobeZombie.ManuRotationSpeed = math.pi / 2000
CoD.GameGlobeZombie.ManuRotationTime = 500
CoD.GameGlobeZombie.TranslatingSpeed = 0.9
CoD.GameGlobeZombie.ScalingSpeed = 1.3
CoD.GameGlobeZombie.CenterRadius = 240
CoD.GameGlobeZombie.CornerRadius = 360
CoD.GameGlobeZombie.MidRadius = 307
CoD.GameGlobeZombie.UpRadius = 360
CoD.GameGlobeZombie.FirstRadius = 512
CoD.GameGlobeZombie.DegreesToRadiansScale = math.pi / 180
CoD.GameGlobeZombie.PlaceYOffSet = -40
CoD.GameGlobeZombie.MoveToCenterPath = {}
CoD.GameGlobeZombie.MoveToCenterPathNodeCount = 5
CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 1
CoD.GameGlobeZombie.MoveToCenterPathNodeMidIndex = 3
CoD.GameGlobeZombie.MoveToCenterPathDist = 0
CoD.GameGlobeZombie.XRotCurrent = 0
CoD.GameGlobeZombie.YRotCurrent = 0
CoD.GameGlobeZombie.ZRotCurrent = 0
CoD.GameGlobeZombie.MoveToCenterPath[1] = {
	x = -450,
	y = 100
}
CoD.GameGlobeZombie.MoveToCenterPath[2] = {
	x = -350,
	y = 69
}
CoD.GameGlobeZombie.MoveToCenterPath[3] = {
	x = -225,
	y = 30
}
CoD.GameGlobeZombie.MoveToCenterPath[4] = {
	x = -100,
	y = -9
}
CoD.GameGlobeZombie.MoveToCenterPath[5] = {
	x = 0,
	y = CoD.GameGlobeZombie.PlaceYOffSet
}
CoD.GameGlobeZombie.LowRumble = 0.4
CoD.GameGlobeZombie.HighRumble = 0.6
CoD.GameGlobeZombie.ShakingScaleSmall = 1
CoD.GameGlobeZombie.ShakingScaleMedium = 2
CoD.GameGlobeZombie.mapInfoContainer = nil
CoD.GameGlobeZombie.ShakingAnimTimeMedium = 15
CoD.GameGlobeZombie.ShakingAnimTimeLong = 30
CoD.GameGlobeZombie.ShakingAnimTimeFloating = 1500
CoD.GameGlobeZombie.Init = function ( globe )
	globe:setLeftRight( false, false, -1200 - CoD.GameGlobeZombie.FirstRadius, -1200 + CoD.GameGlobeZombie.FirstRadius )
	globe:setTopBottom( false, false, 333 - CoD.GameGlobeZombie.FirstRadius, 333 + CoD.GameGlobeZombie.FirstRadius )
	globe:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, CoD.GameGlobeZombie.ShaderVector2YMin - 785 / CoD.GameGlobeZombie.TranslatingSpeed * CoD.GameGlobeZombie.SelfRotationSpeed, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	globe:setScale( 1 )
	globe:registerEventHandler( "transition_complete_map_in", CoD.GameGlobeZombie.MapIn )
	globe:registerEventHandler( "transition_complete_rot_max_loop", CoD.GameGlobeZombie.RotMaxLoopFinish )
	globe:registerEventHandler( "transition_complete_move_to_origin", CoD.GameGlobeZombie.MoveToOriginFinish )
	globe:registerEventHandler( "transition_complete_move_to_corner_from_origin", CoD.GameGlobeZombie.MoveToCornerFromOriginFinish )
	globe:registerEventHandler( "transition_complete_move_up", CoD.GameGlobeZombie.MoveUpFinish )
	globe:registerEventHandler( "transition_complete_move_down_show", CoD.GameGlobeZombie.MoveDownShowFinish )
	globe:registerEventHandler( "transition_complete_move_down", CoD.GameGlobeZombie.MoveDownFinish )
	globe:registerEventHandler( "transition_complete_move_left", CoD.GameGlobeZombie.MoveLeftFinish )
	globe:registerEventHandler( "transition_complete_next_map", CoD.SelectMapZombie.MapRotatingFinish )
	globe:registerEventHandler( "transition_complete_next_map_intern", CoD.SelectMapZombie.NextMapInternFinish )
	globe:registerEventHandler( "transition_complete_move_to_center", CoD.GameGlobeZombie.MoveToCenterFinish )
	globe:registerEventHandler( "transition_complete_move_to_corner", CoD.GameGlobeZombie.MoveToCornerFinish )
	globe.isToLobby = false
	CoD.GameGlobeZombie.gameGlobe = globe
	CoD.GameGlobeZombie.gameGlobe.id = "gameglobe"
	CoD.GameGlobeZombie.InitialPath( globe )
end

CoD.GameGlobeZombie.InitialPath = function ()
	local forwardTargetNodeIndex, backwardTargetNodeIndex, leftDiff, bottomDiff, dist = nil
	local forwardTotalDist = 0
	local backwardTotalDist = 0
	for i = 2, CoD.GameGlobeZombie.MoveToCenterPathNodeCount, 1 do
		forwardTargetNodeIndex = i - 1
		leftDiff = CoD.GameGlobeZombie.MoveToCenterPath[forwardTargetNodeIndex].x - CoD.GameGlobeZombie.MoveToCenterPath[i].x
		bottomDiff = CoD.GameGlobeZombie.MoveToCenterPath[forwardTargetNodeIndex].y - CoD.GameGlobeZombie.MoveToCenterPath[i].y
		dist = math.sqrt( leftDiff * leftDiff + bottomDiff * bottomDiff )
		CoD.GameGlobeZombie.MoveToCenterPath[i].forwardTime = dist / CoD.GameGlobeZombie.TranslatingSpeed
		forwardTotalDist = forwardTotalDist + dist
		CoD.GameGlobeZombie.MoveToCenterPath[i].forwardDist = forwardTotalDist
	end
	CoD.GameGlobeZombie.MoveToCenterPathDist = forwardTotalDist
	for i = CoD.GameGlobeZombie.MoveToCenterPathNodeCount - 1, 1, -1 do
		backwardTargetNodeIndex = i + 1
		leftDiff = CoD.GameGlobeZombie.MoveToCenterPath[backwardTargetNodeIndex].x - CoD.GameGlobeZombie.MoveToCenterPath[i].x
		bottomDiff = CoD.GameGlobeZombie.MoveToCenterPath[backwardTargetNodeIndex].y - CoD.GameGlobeZombie.MoveToCenterPath[i].y
		dist = math.sqrt( leftDiff * leftDiff + bottomDiff * bottomDiff )
		CoD.GameGlobeZombie.MoveToCenterPath[i].backwardTime = dist / CoD.GameGlobeZombie.TranslatingSpeed
		backwardTotalDist = backwardTotalDist + dist
		CoD.GameGlobeZombie.MoveToCenterPath[i].backwardDist = backwardTotalDist
	end
end

CoD.GameGlobeZombie.MapIn = function ( self, event )
	if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil then
		CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	end
	self:beginAnimation( "move_to_corner_from_origin", 785 / CoD.GameGlobeZombie.TranslatingSpeed )
	self:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, CoD.GameGlobeZombie.ShaderVector2YMin, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	self:setLeftRight( false, false, -450 - CoD.GameGlobeZombie.CornerRadius, -450 + CoD.GameGlobeZombie.CornerRadius )
	self:setTopBottom( false, false, 100 - CoD.GameGlobeZombie.CornerRadius, 100 + CoD.GameGlobeZombie.CornerRadius )
	CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 2
	Engine.PlaySound( "zmb_ui_globe_in_short_1" )
end

CoD.GameGlobeZombie.MoveToCornerFromOriginFinish = function ( self, event )
	if event.interrupted == nil then
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 0
		if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true or Engine.SessionMode_IsSystemlinkGame() then
			CoD.GameGlobeZombie.isMoveToCenterDirect = true
			CoD.GameGlobeZombie.MoveToCenter( CoD.GameGlobeZombie.gameGlobe.currentMenu.m_ownerController )
		else
			CoD.GameMoonZombie.FadeInFlare()
			CoD.GameGlobeZombie.isMoveToCenterDirect = false
			if nil ~= CoD.GameGlobeZombie.gameGlobe.currentMenu and nil == CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy then
				CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
			end
			local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
			local duration = (CoD.GameGlobeZombie.ShaderVector2YMax - yrot) / CoD.GameGlobeZombie.SelfRotationSpeed
			CoD.GameGlobeZombie.gameGlobe:completeAnimation()
			CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, xrot, yrot, zrot, avalue )
			CoD.GameGlobeZombie.RotateMaxLoopAnim( duration )
		end
	end
	CoD.GameMoonZombie.FadeOutSun()
end

CoD.GameGlobeZombie.RotMaxLoopFinish = function ( self, event )
	if event.interrupted == nil then
		self:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, CoD.GameGlobeZombie.ShaderVector2YMin, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		CoD.GameGlobeZombie.RotateMaxLoopAnim( 2 * math.pi / CoD.GameGlobeZombie.SelfRotationSpeed )
	end
end

CoD.GameGlobeZombie.MoveToCenter = function ( controller )
	if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil then
		CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	end
	CoD.GameGlobeZombie.gameGlobe.controller = controller
	CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 2
	local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
	CoD.GameGlobeZombie.gameGlobe:completeAnimation()
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, xrot, yrot, zrot, avalue )
	CoD.GameGlobeZombie.XRotCurrent = xrot
	CoD.GameGlobeZombie.YRotCurrent = yrot
	CoD.GameGlobeZombie.ZRotCurrent = zrot
	CoD.GameGlobeZombie.RegisterMoveToCenterState()
	Engine.PlaySound( "zmb_ui_globe_in_short_2" )
	Engine.PlayRumble( controller, CoD.GameGlobeZombie.LowRumble, CoD.GameGlobeZombie.HighRumble )
	CoD.GameMoonZombie.FadeOutFlare()
end

CoD.GameGlobeZombie.RegisterMoveToCenterState = function ()
	local pathNode = CoD.GameGlobeZombie.MoveToCenterPath[CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex]
	local midPathNode = CoD.GameGlobeZombie.MoveToCenterPath[CoD.GameGlobeZombie.MoveToCenterPathNodeMidIndex]
	local radius = 0
	local ratio = 0
	if CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex <= CoD.GameGlobeZombie.MoveToCenterPathNodeMidIndex then
		radius = CoD.GameGlobeZombie.CornerRadius + (CoD.GameGlobeZombie.MidRadius - CoD.GameGlobeZombie.CornerRadius) * pathNode.forwardDist / midPathNode.forwardDist
	else
		radius = CoD.GameGlobeZombie.MidRadius + (CoD.GameGlobeZombie.CenterRadius - CoD.GameGlobeZombie.MidRadius) * (pathNode.forwardDist - midPathNode.forwardDist) / (CoD.GameGlobeZombie.MoveToCenterPathDist - midPathNode.forwardDist)
	end
	ratio = pathNode.forwardDist / CoD.GameGlobeZombie.MoveToCenterPathDist
	local yrot = CoD.GameGlobeZombie.YRotCurrent + 5 * CoD.GameGlobeZombie.SelfRotationSpeed * pathNode.forwardDist / CoD.GameGlobeZombie.TranslatingSpeed
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_to_center", pathNode.forwardTime )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, pathNode.x - radius, pathNode.x + radius )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, pathNode.y - radius, pathNode.y + radius )
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.XRotCurrent, yrot, CoD.GameGlobeZombie.ZRotCurrent, 0 )
end

CoD.GameGlobeZombie.MoveToCenterFinish = function ( self, event )
	if event.interrupted == nil then
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex + 1
		if CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex <= CoD.GameGlobeZombie.MoveToCenterPathNodeCount then
			CoD.GameGlobeZombie.RegisterMoveToCenterState()
		else
			CoD.SelectMapZombie.GoToFirstMap( self, CoD.GameGlobeZombie.gameGlobe.controller, false )
			Engine.PlayRumble( CoD.GameGlobeZombie.gameGlobe.controller, 0, 0 )
			CoD.GameMoonZombie.FadeInFlareLeft()
		end
	end
end

CoD.GameGlobeZombie.MoveToCorner = function ( controller )
	if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil then
		CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	end
	CoD.GameGlobeZombie.gameGlobe.isAnimating = true
	CoD.GameGlobeZombie.gameGlobe.controller = controller
	CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = CoD.GameGlobeZombie.MoveToCenterPathNodeCount - 1
	local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
	CoD.GameGlobeZombie.gameGlobe:completeAnimation()
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, xrot, yrot, zrot, avalue )
	CoD.GameGlobeZombie.XRotCurrent = xrot
	CoD.GameGlobeZombie.YRotCurrent = yrot
	CoD.GameGlobeZombie.ZRotCurrent = zrot
	CoD.GameGlobeZombie.RegisterMoveToCornerState()
	Engine.PlaySound( "zmb_ui_globe_out_short_1" )
	Engine.PlayRumble( controller, CoD.GameGlobeZombie.LowRumble, CoD.GameGlobeZombie.HighRumble )
	CoD.GameMoonZombie.FadeOutFlareLeft()
end

CoD.GameGlobeZombie.RegisterMoveToCornerState = function ()
	local pathNode = CoD.GameGlobeZombie.MoveToCenterPath[CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex]
	local midPathNode = CoD.GameGlobeZombie.MoveToCenterPath[CoD.GameGlobeZombie.MoveToCenterPathNodeMidIndex]
	local radius = 0
	local ratio = 0
	if CoD.GameGlobeZombie.MoveToCenterPathNodeMidIndex <= CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex then
		radius = CoD.GameGlobeZombie.CenterRadius + (CoD.GameGlobeZombie.MidRadius - CoD.GameGlobeZombie.CenterRadius) * pathNode.backwardDist / midPathNode.backwardDist
	else
		radius = CoD.GameGlobeZombie.MidRadius + (CoD.GameGlobeZombie.CornerRadius - CoD.GameGlobeZombie.MidRadius) * (pathNode.backwardDist - midPathNode.backwardDist) / (CoD.GameGlobeZombie.MoveToCenterPathDist - midPathNode.backwardDist)
	end
	ratio = pathNode.backwardDist / CoD.GameGlobeZombie.MoveToCenterPathDist
	local xrot = CoD.GameGlobeZombie.XRotCurrent + (CoD.GameGlobeZombie.ShaderVector2X - CoD.GameGlobeZombie.XRotCurrent) * ratio
	local yrot = CoD.GameGlobeZombie.YRotCurrent + (CoD.GameGlobeZombie.ShaderVector2YMax - CoD.GameGlobeZombie.YRotCurrent) * ratio
	local zrot = CoD.GameGlobeZombie.ZRotCurrent + (CoD.GameGlobeZombie.ShaderVector2Z - CoD.GameGlobeZombie.ZRotCurrent) * ratio
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_to_corner", pathNode.backwardTime )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, pathNode.x - radius, pathNode.x + radius )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, pathNode.y - radius, pathNode.y + radius )
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, xrot, yrot, zrot, 0 )
end

CoD.GameGlobeZombie.MoveToCornerFinish = function ( self, event )
	if event.interrupted == nil then
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex - 1
		if CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex >= 1 then
			CoD.GameGlobeZombie.RegisterMoveToCornerState()
		else
			CoD.GameGlobeZombie.gameGlobe.isAnimating = nil
			local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
			local duration = (CoD.GameGlobeZombie.ShaderVector2YMax - yrot) / CoD.GameGlobeZombie.SelfRotationSpeed
			CoD.GameGlobeZombie.gameGlobe:completeAnimation()
			CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, xrot, yrot, zrot, avalue )
			CoD.GameGlobeZombie.RotateMaxLoopAnim( duration )
			if nil ~= CoD.GameGlobeZombie.gameGlobe.currentMenu and nil == CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy then
				CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
			end
			if not CoD.GameGlobeZombie.gameGlobe.skipOpenMenuWhenAnimFinishs then
				self.currentMenu:goBack( CoD.GameGlobeZombie.gameGlobe.controller )
			end
			CoD.GameGlobeZombie.gameGlobe.skipOpenMenuWhenAnimFinishs = nil
			Engine.PlayRumble( CoD.GameGlobeZombie.gameGlobe.controller, 0, 0 )
			if not CoD.GameGlobeZombie.isMoveToCenterDirect then
				CoD.GameMoonZombie.FadeInFlare()
				CoD.GameGlobeZombie.isMoveToCenterDirect = nil
			end
		end
	else
		CoD.GameGlobeZombie.gameGlobe.isAnimating = nil
	end
end

CoD.GameGlobeZombie.MoveUp = function ( controller )
	if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil then
		CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	end
	CoD.GameGlobeZombie.MoveUpAnim( 500 / CoD.GameGlobeZombie.ScalingSpeed )
	CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 2
	CoD.GameGlobeZombie.gameGlobe.controller = controller
	Engine.PlaySound( "zmb_ui_map_zoom_in" )
	Engine.PlayRumble( controller, CoD.GameGlobeZombie.LowRumble, CoD.GameGlobeZombie.HighRumble )
	CoD.GameMoonZombie.FadeOutFlareLeft()
end

CoD.GameGlobeZombie.MoveUpFinish = function ( globe, event )
	if event.interrupted == nil then
		CoD.GameGlobeZombie.MoveUpHideAnim( 500 / CoD.GameGlobeZombie.ScalingSpeed )
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = CoD.GameGlobeZombie.MoveToCenterPathNodeCount + 1
		Engine.PlayRumble( CoD.GameGlobeZombie.gameGlobe.controller, 0, 0 )
		CoD.GameMapZombie.SwitchToMap()
	end
end

CoD.GameGlobeZombie.MoveDownShow = function ( controller )
	if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil then
		CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	end
	CoD.GameGlobeZombie.gameGlobe.controller = controller
	CoD.GameGlobeZombie.gameGlobe.isToCorner = false
	CoD.GameGlobeZombie.MoveDownShowAnim( 500 / CoD.GameGlobeZombie.ScalingSpeed )
	CoD.GameMapZombie.MoveDown( 500 / CoD.GameMapZombie.ScalingSpeed )
	Engine.PlaySound( "zmb_ui_map_zoom_out" )
end

CoD.GameGlobeZombie.MoveDownShowFinish = function ( globe, event )
	if event.interrupted == nil then
		if globe.isToCorner == true then
			CoD.GameGlobeZombie.MoveLeftAnim( 1000 / CoD.GameGlobeZombie.ScalingSpeed )
			globe.isToCorner = false
		else
			CoD.GameGlobeZombie.MoveDownAnim( 500 / CoD.GameGlobeZombie.ScalingSpeed )
		end
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = CoD.GameGlobeZombie.MoveToCenterPathNodeCount - 1
		Engine.PlayRumble( CoD.GameGlobeZombie.gameGlobe.controller, CoD.GameGlobeZombie.LowRumble, CoD.GameGlobeZombie.HighRumble )
	end
end

CoD.GameGlobeZombie.MoveLeftFinish = function ( self, event )
	if event.interrupted == nil then
		local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
		local duration = (CoD.GameGlobeZombie.ShaderVector2YMax - yrot) / CoD.GameGlobeZombie.SelfRotationSpeed
		CoD.GameGlobeZombie.gameGlobe:completeAnimation()
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, xrot, yrot, zrot, avalue )
		CoD.GameGlobeZombie.RotateMaxLoopAnim( duration )
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 0
		CoD.GameMoonZombie.FadeInFlare()
	end
	Engine.PlayRumble( CoD.GameGlobeZombie.gameGlobe.controller, 0, 0 )
end

CoD.GameGlobeZombie.MoveDownFinish = function ( self, event )
	if event.interrupted == nil then
		if nil ~= CoD.GameGlobeZombie.gameGlobe.currentMenu and nil == CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy then
			CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
		end
		if CoD.GameGlobeZombie.gameGlobe.isToCorner == false then
			CoD.SelectMapZombie.GoToFirstMap( self, CoD.GameGlobeZombie.gameGlobe.controller, true )
		end
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 0
		CoD.GameMoonZombie.FadeInFlareLeft()
	end
	Engine.PlayRumble( CoD.GameGlobeZombie.gameGlobe.controller, 0, 0 )
end

CoD.GameGlobeZombie.MoveToCornerFromUp = function ( controller, animate )
	if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil then
		CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	end
	CoD.GameGlobeZombie.gameGlobe.controller = controller
	CoD.GameGlobeZombie.gameGlobe.isToCorner = true
	if animate == nil or animate then
		CoD.GameGlobeZombie.MoveDownShowAnim( 500 / CoD.GameGlobeZombie.ScalingSpeed )
	end
	CoD.GameMapZombie.gameMap.isToCorner = true
	CoD.GameMapZombie.MoveDown( 500 / CoD.GameMapZombie.ScalingSpeed )
	Engine.PlaySound( "zmb_ui_globe_in_short_1" )
end

CoD.GameGlobeZombie.MoveToExpectedMap = function ()
	CoD.globe.shown = true
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_to_expected_map" )
	CoD.GameGlobeZombie.gameGlobe:setAlpha( 0 )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 600 )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -1440, 1440 )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, -1440 + CoD.GameGlobeZombie.PlaceYOffSet, 1440 + CoD.GameGlobeZombie.PlaceYOffSet )
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 0, 2, 2, 0, 0 )
	local mapRef = CoD.Zombie.GetUIMapName()
	local longitude = 0
	local latitude = 0
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, latitude, longitude, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
end

CoD.GameGlobeZombie.MoveToUpDirectly = function ()
	CoD.GameGlobeZombie.MoveToExpectedMap()
	CoD.GameMapZombie.SwitchToMapDirect( 2, true, 0 )
	CoD.GameMoonZombie.FadeOutFlares()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true or Engine.SessionMode_IsSystemlinkGame() then
		CoD.GameGlobeZombie.isMoveToCenterDirect = true
	else
		CoD.GameGlobeZombie.isMoveToCenterDirect = false
	end
end

CoD.GameGlobeZombie.MoveToCornerJoinLobby = function ()
	CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, CoD.GameGlobeZombie.ShaderVector2YMin, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -450 - CoD.GameGlobeZombie.CornerRadius, -450 + CoD.GameGlobeZombie.CornerRadius )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, 100 - CoD.GameGlobeZombie.CornerRadius, 100 + CoD.GameGlobeZombie.CornerRadius )
	CoD.GameGlobeZombie.RotateMaxLoopAnim( 2 * math.pi / CoD.GameGlobeZombie.SelfRotationSpeed )
	CoD.GameMapZombie.DefaultAnim( 0 )
	CoD.GameRockZombie.ShowAll()
	CoD.GameMoonZombie.FadeInFlare()
end

CoD.GameGlobeZombie.MoveToOrigin = function ()
	if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil then
		CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	end
	local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
	CoD.GameGlobeZombie.gameGlobe:completeAnimation()
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, xrot, yrot, zrot, avalue )
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_to_origin", 785 / CoD.GameGlobeZombie.TranslatingSpeed )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -1200 - CoD.GameGlobeZombie.FirstRadius, -1200 + CoD.GameGlobeZombie.FirstRadius )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, 333 - CoD.GameGlobeZombie.FirstRadius, 333 + CoD.GameGlobeZombie.FirstRadius )
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, yrot + 785 / CoD.GameGlobeZombie.TranslatingSpeed * CoD.GameGlobeZombie.SelfRotationSpeed, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	CoD.GameGlobeZombie.gameGlobe:setScale( 1 )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
	CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 2
	CoD.GameMoonZombie.FadeOutFlare()
	CoD.GameMoonZombie.FadeInSun()
	Engine.PlaySound( "zmb_ui_globe_out_short_2" )
end

CoD.GameGlobeZombie.MoveToOriginFinish = function ( self, event )
	if event.interrupted == nil then
		if nil ~= CoD.GameGlobeZombie.gameGlobe.currentMenu and nil == CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy then
			CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
		end
		CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex = 0
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, CoD.GameGlobeZombie.ShaderVector2YMin - 785 / CoD.GameGlobeZombie.TranslatingSpeed * CoD.GameGlobeZombie.SelfRotationSpeed, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	end
end

CoD.GameGlobeZombie.StartShake = function ( shakingObj, shakingScaleValue )
	shakingObj.ShakingScaleCurrent = shakingScaleValue
	shakingObj:registerEventHandler( "transition_complete_shaking", CoD.GameGlobeZombie.ShakingFinish )
	CoD.GameGlobeZombie.RegisterShakingState( shakingObj )
end

CoD.GameGlobeZombie.RegisterShakingState = function ( shakingObj )
	local randomWidthValue = math.random( -shakingObj.ShakingScaleCurrent, shakingObj.ShakingScaleCurrent )
	local randomHeightValue = math.random( -shakingObj.ShakingScaleCurrent, shakingObj.ShakingScaleCurrent )
	shakingObj:beginAnimation( "shaking", 20 / shakingObj.ShakingScaleCurrent )
	shakingObj:setLeftRight( true, true, randomWidthValue, randomWidthValue )
	shakingObj:setTopBottom( true, true, randomHeightValue, randomHeightValue )
end

CoD.GameGlobeZombie.ShakingFinish = function ( shakingObj, event )
	if event.interrupted == nil and CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex <= CoD.GameGlobeZombie.MoveToCenterPathNodeCount and CoD.GameGlobeZombie.MoveToCenterPathNodeCurrentIndex >= 1 then
		CoD.GameGlobeZombie.RegisterShakingState( shakingObj )
	end
end

CoD.GameGlobeZombie.MoveUpAnim = function ( time )
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_up", time )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 300 )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -720, 720 )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, -720 + CoD.GameGlobeZombie.PlaceYOffSet, 720 + CoD.GameGlobeZombie.PlaceYOffSet )
end

CoD.GameGlobeZombie.MoveUpHideAnim = function ( time )
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_up_hide", time )
	CoD.GameGlobeZombie.gameGlobe:setAlpha( 0 )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 600 )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -1440, 1440 )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, -1440 + CoD.GameGlobeZombie.PlaceYOffSet, 1440 + CoD.GameGlobeZombie.PlaceYOffSet )
end

CoD.GameGlobeZombie.MoveDownAnim = function ( time )
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_down", time )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -240, 240 )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, -240 + CoD.GameGlobeZombie.PlaceYOffSet, 240 + CoD.GameGlobeZombie.PlaceYOffSet )
end

CoD.GameGlobeZombie.MoveDownShowAnim = function ( time )
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_down_show", time )
	CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 300 )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -720, 720 )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, -720 + CoD.GameGlobeZombie.PlaceYOffSet, 720 + CoD.GameGlobeZombie.PlaceYOffSet )
end

CoD.GameGlobeZombie.MoveLeftAnim = function ( time )
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_left", time )
	CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
	CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -450 - CoD.GameGlobeZombie.CornerRadius, -450 + CoD.GameGlobeZombie.CornerRadius )
	CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, 100 - CoD.GameGlobeZombie.CornerRadius, 100 + CoD.GameGlobeZombie.CornerRadius )
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, CoD.GameGlobeZombie.ShaderVector2YMax, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
end

CoD.GameGlobeZombie.RotateMaxLoopAnim = function ( time )
	CoD.GameGlobeZombie.gameGlobe:beginAnimation( "rot_max_loop", time )
	CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.ShaderVector2X, CoD.GameGlobeZombie.ShaderVector2YMax, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
end

