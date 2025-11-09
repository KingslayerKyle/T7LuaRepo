CoD.GameRockZombie = {}
CoD.GameRockZombie.gameRocksFront = nil
CoD.GameRockZombie.gameRocksBack = nil
CoD.GameRockZombie.ShouldStop = nil
CoD.GameRockZombie.RockTileWidth = 1800
CoD.GameRockZombie.RockTileHeight = 400
CoD.GameRockZombie.RockBackMaterial = RegisterMaterial( "lui_bkg_zm_rocks_back" )
CoD.GameRockZombie.RockFrontMaterial = RegisterMaterial( "lui_bkg_zm_rocks_front" )
CoD.GameRockZombie.RockFrontBMaterial = RegisterMaterial( "lui_bkg_zm_rocks_front_forward" )
CoD.GameRockZombie.RockFrontPath = {}
CoD.GameRockZombie.RockFrontTranslatingSpeed = 0.05
CoD.GameRockZombie.RockFrontPathNodeCount = 3
CoD.GameRockZombie.RockFrontPathNodeCurrentIndex = 1
CoD.GameRockZombie.RockFrontPath[1] = {
	x = -CoD.GameRockZombie.RockTileWidth * 0.8,
	y = CoD.GameRockZombie.RockTileHeight * 2.48
}
CoD.GameRockZombie.RockFrontPath[2] = {
	x = 0,
	y = CoD.GameRockZombie.RockTileHeight * 0.4
}
CoD.GameRockZombie.RockFrontPath[3] = {
	x = CoD.GameRockZombie.RockTileWidth * 0.8,
	y = CoD.GameRockZombie.RockTileHeight * -1.68
}
CoD.GameRockZombie.RockFrontBPath = {}
CoD.GameRockZombie.RockFrontBTranslatingSpeed = 0.07
CoD.GameRockZombie.RockFrontBPathNodeCount = 3
CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex = 1
CoD.GameRockZombie.RockFrontBPath[1] = {
	x = -CoD.GameRockZombie.RockTileWidth * 0.8,
	y = CoD.GameRockZombie.RockTileHeight * 2.88
}
CoD.GameRockZombie.RockFrontBPath[2] = {
	x = 0,
	y = CoD.GameRockZombie.RockTileHeight * 0.8
}
CoD.GameRockZombie.RockFrontBPath[3] = {
	x = CoD.GameRockZombie.RockTileWidth * 0.8,
	y = CoD.GameRockZombie.RockTileHeight * -1.28
}
CoD.GameRockZombie.RockBackPath = {}
CoD.GameRockZombie.RockBackTranslatingSpeed = 0.02
CoD.GameRockZombie.RockBackPathNodeCount = 3
CoD.GameRockZombie.RockBackPathNodeCurrentIndex = 1
CoD.GameRockZombie.RockBackPath[1] = {
	x = CoD.GameRockZombie.RockTileWidth * 0.8,
	y = CoD.GameRockZombie.RockTileHeight * -2.48
}
CoD.GameRockZombie.RockBackPath[2] = {
	x = 0,
	y = CoD.GameRockZombie.RockTileHeight * -0.4
}
CoD.GameRockZombie.RockBackPath[3] = {
	x = -CoD.GameRockZombie.RockTileWidth * 0.8,
	y = CoD.GameRockZombie.RockTileHeight * 1.68
}
CoD.GameRockZombie.Init = function ( frontRocks, backRocks )
	frontRocks:setLeftRight( true, true, 0, 0 )
	frontRocks:setTopBottom( true, true, 0, 0 )
	CoD.GameRockZombie.gameRocksFront = frontRocks
	CoD.GameRockZombie.InitPath()
	local frontRock1 = LUI.UIImage.new()
	frontRock1:setImage( CoD.GameRockZombie.RockFrontMaterial )
	frontRock1:setLeftRight( false, false, CoD.GameRockZombie.RockFrontPath[1].x - CoD.GameRockZombie.RockTileWidth * 0.5, CoD.GameRockZombie.RockFrontPath[1].x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	frontRock1:setTopBottom( false, false, CoD.GameRockZombie.RockFrontPath[1].y - CoD.GameRockZombie.RockTileHeight * 0.5, CoD.GameRockZombie.RockFrontPath[1].y + CoD.GameRockZombie.RockTileHeight * 0.5 )
	frontRock1:setZRot( CoD.GameGlobeZombie.ShaderVector2X / CoD.GameGlobeZombie.DegreesToRadiansScale )
	frontRock1:registerEventHandler( "transition_complete_move_to_next", CoD.GameRockZombie.RockFront1MoveToNextFinish )
	CoD.GameRockZombie.gameRocksFront.rock1 = frontRock1
	frontRocks:addElement( frontRock1 )
	local frontRock2 = LUI.UIImage.new()
	frontRock2:setImage( CoD.GameRockZombie.RockFrontMaterial )
	frontRock2:setLeftRight( false, false, CoD.GameRockZombie.RockFrontPath[1].x - CoD.GameRockZombie.RockTileWidth * 0.5, CoD.GameRockZombie.RockFrontPath[1].x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	frontRock2:setTopBottom( false, false, CoD.GameRockZombie.RockFrontPath[1].y - CoD.GameRockZombie.RockTileHeight * 0.5, CoD.GameRockZombie.RockFrontPath[1].y + CoD.GameRockZombie.RockTileHeight * 0.5 )
	frontRock2:setZRot( CoD.GameGlobeZombie.ShaderVector2X / CoD.GameGlobeZombie.DegreesToRadiansScale )
	CoD.GameRockZombie.gameRocksFront.rock2 = frontRock2
	frontRocks:addElement( frontRock2 )
	local frontRock3 = LUI.UIImage.new()
	frontRock3:setImage( CoD.GameRockZombie.RockFrontBMaterial )
	frontRock3:setLeftRight( false, false, CoD.GameRockZombie.RockFrontBPath[1].x - CoD.GameRockZombie.RockTileWidth * 0.5, CoD.GameRockZombie.RockFrontBPath[1].x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	frontRock3:setTopBottom( false, false, CoD.GameRockZombie.RockFrontBPath[1].y - CoD.GameRockZombie.RockTileHeight * 0.5, CoD.GameRockZombie.RockFrontBPath[1].y + CoD.GameRockZombie.RockTileHeight * 0.5 )
	frontRock3:setZRot( CoD.GameGlobeZombie.ShaderVector2X / CoD.GameGlobeZombie.DegreesToRadiansScale )
	frontRock3:registerEventHandler( "transition_complete_move_to_next", CoD.GameRockZombie.RockFront3MoveToNextFinish )
	CoD.GameRockZombie.gameRocksFront.rock3 = frontRock3
	frontRocks:addElement( frontRock3 )
	local frontRock4 = LUI.UIImage.new()
	frontRock4:setImage( CoD.GameRockZombie.RockFrontBMaterial )
	frontRock4:setLeftRight( false, false, CoD.GameRockZombie.RockFrontBPath[1].x - CoD.GameRockZombie.RockTileWidth * 0.5, CoD.GameRockZombie.RockFrontBPath[1].x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	frontRock4:setTopBottom( false, false, CoD.GameRockZombie.RockFrontBPath[1].y - CoD.GameRockZombie.RockTileHeight * 0.5, CoD.GameRockZombie.RockFrontBPath[1].y + CoD.GameRockZombie.RockTileHeight * 0.5 )
	frontRock4:setZRot( CoD.GameGlobeZombie.ShaderVector2X / CoD.GameGlobeZombie.DegreesToRadiansScale )
	CoD.GameRockZombie.gameRocksFront.rock4 = frontRock4
	frontRocks:addElement( frontRock4 )
	backRocks:setLeftRight( true, true, 0, 0 )
	backRocks:setTopBottom( true, true, 0, 0 )
	CoD.GameRockZombie.gameRocksBack = backRocks
	local backRock1 = LUI.UIImage.new()
	backRock1:setImage( CoD.GameRockZombie.RockBackMaterial )
	backRock1:setLeftRight( false, false, CoD.GameRockZombie.RockBackPath[1].x - CoD.GameRockZombie.RockTileWidth * 0.5, CoD.GameRockZombie.RockBackPath[1].x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	backRock1:setTopBottom( false, false, CoD.GameRockZombie.RockBackPath[1].y - CoD.GameRockZombie.RockTileHeight * 0.5, CoD.GameRockZombie.RockBackPath[1].y + CoD.GameRockZombie.RockTileHeight * 0.5 )
	backRock1:setZRot( CoD.GameGlobeZombie.ShaderVector2X / CoD.GameGlobeZombie.DegreesToRadiansScale )
	backRock1:registerEventHandler( "transition_complete_move_to_next", CoD.GameRockZombie.RockBack1MoveToNextFinish )
	CoD.GameRockZombie.gameRocksBack.rock1 = backRock1
	backRocks:addElement( backRock1 )
	local backRock2 = LUI.UIImage.new()
	backRock2:setImage( CoD.GameRockZombie.RockBackMaterial )
	backRock2:setLeftRight( false, false, CoD.GameRockZombie.RockBackPath[1].x - CoD.GameRockZombie.RockTileWidth * 0.5, CoD.GameRockZombie.RockBackPath[1].x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	backRock2:setTopBottom( false, false, CoD.GameRockZombie.RockBackPath[1].y - CoD.GameRockZombie.RockTileHeight * 0.5, CoD.GameRockZombie.RockBackPath[1].y + CoD.GameRockZombie.RockTileHeight * 0.5 )
	backRock2:setZRot( CoD.GameGlobeZombie.ShaderVector2X / CoD.GameGlobeZombie.DegreesToRadiansScale )
	CoD.GameRockZombie.gameRocksBack.rock2 = backRock2
	backRocks:addElement( backRock2 )
	CoD.GameRockZombie.StartMoving()
end

CoD.GameRockZombie.InitPath = function ()
	local leftDiff = 0
	local bottomDiff = 0
	local dist = 0
	local forwardTargetNodeIndex = 0
	for i = 2, CoD.GameRockZombie.RockFrontPathNodeCount, 1 do
		forwardTargetNodeIndex = i - 1
		leftDiff = CoD.GameRockZombie.RockFrontPath[forwardTargetNodeIndex].x - CoD.GameRockZombie.RockFrontPath[i].x
		bottomDiff = CoD.GameRockZombie.RockFrontPath[forwardTargetNodeIndex].y - CoD.GameRockZombie.RockFrontPath[i].y
		CoD.GameRockZombie.RockFrontPath[i].forwardTime = math.sqrt( leftDiff * leftDiff + bottomDiff * bottomDiff ) / CoD.GameRockZombie.RockFrontTranslatingSpeed
		leftDiff = CoD.GameRockZombie.RockFrontBPath[forwardTargetNodeIndex].x - CoD.GameRockZombie.RockFrontBPath[i].x
		bottomDiff = CoD.GameRockZombie.RockFrontBPath[forwardTargetNodeIndex].y - CoD.GameRockZombie.RockFrontBPath[i].y
		CoD.GameRockZombie.RockFrontBPath[i].forwardTime = math.sqrt( leftDiff * leftDiff + bottomDiff * bottomDiff ) / CoD.GameRockZombie.RockFrontBTranslatingSpeed
		leftDiff = CoD.GameRockZombie.RockBackPath[forwardTargetNodeIndex].x - CoD.GameRockZombie.RockBackPath[i].x
		bottomDiff = CoD.GameRockZombie.RockBackPath[forwardTargetNodeIndex].y - CoD.GameRockZombie.RockBackPath[i].y
		CoD.GameRockZombie.RockBackPath[i].forwardTime = math.sqrt( leftDiff * leftDiff + bottomDiff * bottomDiff ) / CoD.GameRockZombie.RockBackTranslatingSpeed
	end
end

CoD.GameRockZombie.RegisterMoveToNextState = function ( rock, snapTo, pathNodeIndex, isFront, isFrontB )
	local pathNode = nil
	if isFront then
		if isFrontB == true then
			pathNode = CoD.GameRockZombie.RockFrontBPath[pathNodeIndex]
		else
			pathNode = CoD.GameRockZombie.RockFrontPath[pathNodeIndex]
		end
	else
		pathNode = CoD.GameRockZombie.RockBackPath[pathNodeIndex]
	end
	if not snapTo then
		rock:beginAnimation( "move_to_next", pathNode.forwardTime )
	end
	rock:setLeftRight( false, false, pathNode.x - CoD.GameRockZombie.RockTileWidth * 0.5, pathNode.x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	rock:setTopBottom( false, false, pathNode.y - CoD.GameRockZombie.RockTileHeight * 0.5, pathNode.y + CoD.GameRockZombie.RockTileHeight * 0.5 )
end

CoD.GameRockZombie.RockFront1MoveToNextFinish = function ( self, event )
	if event.interrupted == nil then
		if CoD.GameRockZombie.RockFrontPathNodeCurrentIndex == 3 then
			CoD.GameRockZombie.RegisterMoveToNextState( self, true, 1, true )
			if not CoD.GameRockZombie.ShouldStop then
				CoD.GameRockZombie.RockFrontPathNodeCurrentIndex = 2
				CoD.GameRockZombie.RegisterMoveToNextState( self, false, 2, true )
			else
				CoD.GameRockZombie.RockFrontPathNodeCurrentIndex = 1
			end
			CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock2, false, 3, true )
		elseif CoD.GameRockZombie.RockFrontPathNodeCurrentIndex == 2 then
			CoD.GameRockZombie.RegisterMoveToNextState( self, false, 3, true )
			CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock2, true, 1, true )
			if not CoD.GameRockZombie.ShouldStop then
				CoD.GameRockZombie.RockFrontPathNodeCurrentIndex = 3
				CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock2, false, 2, true )
			else
				CoD.GameRockZombie.RockFrontPathNodeCurrentIndex = 1
			end
		end
	end
end

CoD.GameRockZombie.RockFront3MoveToNextFinish = function ( self, event )
	if event.interrupted == nil then
		if CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex == 3 then
			CoD.GameRockZombie.RegisterMoveToNextState( self, true, 1, true, true )
			if not CoD.GameRockZombie.ShouldStop then
				CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex = 2
				CoD.GameRockZombie.RegisterMoveToNextState( self, false, 2, true, true )
			else
				CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex = 1
			end
			CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock4, false, 3, true, true )
		elseif CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex == 2 then
			CoD.GameRockZombie.RegisterMoveToNextState( self, false, 3, true, true )
			CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock4, true, 1, true, true )
			if not CoD.GameRockZombie.ShouldStop then
				CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex = 3
				CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock4, false, 2, true, true )
			else
				CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex = 1
			end
		end
	end
end

CoD.GameRockZombie.RockBack1MoveToNextFinish = function ( self, event )
	if event.interrupted == nil then
		if CoD.GameRockZombie.RockBackPathNodeCurrentIndex == 3 then
			CoD.GameRockZombie.RegisterMoveToNextState( self, true, 1, false )
			if not CoD.GameRockZombie.ShouldStop then
				CoD.GameRockZombie.RockBackPathNodeCurrentIndex = 2
				CoD.GameRockZombie.RegisterMoveToNextState( self, false, 2, false )
			else
				CoD.GameRockZombie.RockBackPathNodeCurrentIndex = 1
			end
			CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksBack.rock2, false, 3, false )
		elseif CoD.GameRockZombie.RockBackPathNodeCurrentIndex == 2 then
			CoD.GameRockZombie.RegisterMoveToNextState( self, false, 3, false )
			CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksBack.rock2, true, 1, false )
			if not CoD.GameRockZombie.ShouldStop then
				CoD.GameRockZombie.RockBackPathNodeCurrentIndex = 3
				CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksBack.rock2, false, 2, false )
			else
				CoD.GameRockZombie.RockBackPathNodeCurrentIndex = 1
			end
		end
	end
end

CoD.GameRockZombie.StartMoving = function ()
	CoD.GameRockZombie.Reset( CoD.GameRockZombie.gameRocksFront.rock1, CoD.GameRockZombie.RockFrontPath[1] )
	CoD.GameRockZombie.Reset( CoD.GameRockZombie.gameRocksFront.rock2, CoD.GameRockZombie.RockFrontPath[1] )
	CoD.GameRockZombie.RockFrontPathNodeCurrentIndex = 2
	CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock1, false, CoD.GameRockZombie.RockFrontPathNodeCurrentIndex, true )
	CoD.GameRockZombie.Reset( CoD.GameRockZombie.gameRocksFront.rock3, CoD.GameRockZombie.RockFrontBPath[1] )
	CoD.GameRockZombie.Reset( CoD.GameRockZombie.gameRocksFront.rock4, CoD.GameRockZombie.RockFrontBPath[1] )
	CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex = 2
	CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksFront.rock3, false, CoD.GameRockZombie.RockFrontBPathNodeCurrentIndex, true, true )
	CoD.GameRockZombie.Reset( CoD.GameRockZombie.gameRocksBack.rock1, CoD.GameRockZombie.RockBackPath[1] )
	CoD.GameRockZombie.Reset( CoD.GameRockZombie.gameRocksBack.rock2, CoD.GameRockZombie.RockBackPath[1] )
	CoD.GameRockZombie.RockBackPathNodeCurrentIndex = 2
	CoD.GameRockZombie.RegisterMoveToNextState( CoD.GameRockZombie.gameRocksBack.rock1, false, CoD.GameRockZombie.RockBackPathNodeCurrentIndex, false )
	CoD.GameRockZombie.ShouldStop = false
end

CoD.GameRockZombie.StopMoving = function ()
	CoD.GameRockZombie.ShouldStop = true
end

CoD.GameRockZombie.Reset = function ( rock, pathNode )
	rock:setLeftRight( false, false, pathNode.x - CoD.GameRockZombie.RockTileWidth * 0.5, pathNode.x + CoD.GameRockZombie.RockTileWidth * 0.5 )
	rock:setTopBottom( false, false, pathNode.y - CoD.GameRockZombie.RockTileHeight * 0.5, pathNode.y + CoD.GameRockZombie.RockTileHeight * 0.5 )
end

CoD.GameRockZombie.HideAll = function ()
	CoD.GameRockZombie.gameRocksFront:beginAnimation( "hide", 100 )
	CoD.GameRockZombie.gameRocksFront:setAlpha( 0 )
	CoD.GameRockZombie.gameRocksBack:beginAnimation( "hide", 100 )
	CoD.GameRockZombie.gameRocksBack:setAlpha( 0 )
end

CoD.GameRockZombie.ShowAll = function ()
	CoD.GameRockZombie.gameRocksFront:beginAnimation( "show", 100 )
	CoD.GameRockZombie.gameRocksFront:setAlpha( 1 )
	CoD.GameRockZombie.gameRocksBack:beginAnimation( "show", 100 )
	CoD.GameRockZombie.gameRocksBack:setAlpha( 1 )
end

CoD.Fog = {}
CoD.Fog.mapFog = nil
CoD.Fog.TileWidth = 2048
CoD.Fog.Path = {}
CoD.Fog.TranslatingSpeed = 0
CoD.Fog.PathNodeCount = 3
CoD.Fog.PathNodeCurrentIndex = 1
CoD.Fog.OverLap = 20
CoD.Fog.Path[1] = {
	x = -CoD.Fog.TileWidth + CoD.Fog.OverLap
}
CoD.Fog.Path[2] = {
	x = 0
}
CoD.Fog.Path[3] = {
	x = CoD.Fog.TileWidth - CoD.Fog.OverLap
}
CoD.Fog.Material = RegisterMaterial( "menu_zm_map_fog" )
CoD.Fog.Material2 = RegisterMaterial( "menu_zm_map_fog_highrise" )
CoD.Fog.Material3 = RegisterMaterial( "menu_zm_map_fog_prison" )
CoD.Fog.Material4 = RegisterMaterial( "menu_zm_map_fog_buried" )
CoD.Fog.Material5 = RegisterMaterial( "menu_zm_map_fog_tomb" )
CoD.Fog.Init = function ( fogContainer )
	fogContainer:setLeftRight( true, true, 0, 0 )
	fogContainer:setTopBottom( true, true, 0, 0 )
	fogContainer:setAlpha( 0 )
	CoD.Fog.mapFog = fogContainer
	CoD.Fog.InitPath()
	local mapFog1 = LUI.UIImage.new()
	mapFog1:setImage( CoD.Fog.Material )
	mapFog1:setLeftRight( false, false, CoD.Fog.Path[2].x - CoD.Fog.TileWidth * 0.5, CoD.Fog.Path[2].x + CoD.Fog.TileWidth * 0.5 )
	mapFog1:setTopBottom( true, true, 0, 0 )
	mapFog1:registerEventHandler( "transition_complete_move_to_next", CoD.Fog.MapFog1MoveToNextFinish )
	CoD.Fog.mapFog.fogTile1 = mapFog1
	fogContainer:addElement( mapFog1 )
	local mapFog2 = LUI.UIImage.new()
	mapFog2:setImage( CoD.Fog.Material )
	mapFog2:setLeftRight( false, false, CoD.Fog.Path[1].x - CoD.Fog.TileWidth * 0.5, CoD.Fog.Path[1].x + CoD.Fog.TileWidth * 0.5 )
	mapFog2:setTopBottom( true, true, 0, 0 )
	CoD.Fog.mapFog.fogTile2 = mapFog2
	fogContainer:addElement( mapFog2 )
end

CoD.Fog.DefaultOverlapAndPath = function ()
	CoD.Fog.OverLap = 20
	CoD.Fog.Path[1] = {
		x = -CoD.Fog.TileWidth + CoD.Fog.OverLap
	}
	CoD.Fog.Path[2] = {
		x = 0
	}
	CoD.Fog.Path[3] = {
		x = CoD.Fog.TileWidth - CoD.Fog.OverLap
	}
	CoD.Fog.TranslatingSpeed = 0.01
	CoD.Fog.InitPath()
	CoD.Fog.StartMoving()
end

CoD.Fog.NoOverlapPath = function ()
	CoD.Fog.OverLap = 0
	CoD.Fog.Path[1] = {
		x = -CoD.Fog.TileWidth + CoD.Fog.OverLap
	}
	CoD.Fog.Path[2] = {
		x = 0
	}
	CoD.Fog.Path[3] = {
		x = CoD.Fog.TileWidth - CoD.Fog.OverLap
	}
	CoD.Fog.TranslatingSpeed = 0.01
	CoD.Fog.InitPath()
	CoD.Fog.StartMoving()
end

CoD.Fog.BuriedOverlapAndPath = function ()
	CoD.Fog.OverLap = 20
	CoD.Fog.Path[1] = {
		x = -CoD.Fog.TileWidth + CoD.Fog.OverLap
	}
	CoD.Fog.Path[2] = {
		x = 0
	}
	CoD.Fog.Path[3] = {
		x = CoD.Fog.TileWidth - CoD.Fog.OverLap
	}
	CoD.Fog.TranslatingSpeed = 0.03
	CoD.Fog.InitPath()
	CoD.Fog.StartMoving()
end

CoD.Fog.InitPath = function ()
	local dist = 0
	local forwardTargetNodeIndex = 0
	for i = 2, CoD.Fog.PathNodeCount, 1 do
		forwardTargetNodeIndex = i - 1
		CoD.Fog.Path[i].forwardTime = math.abs( CoD.Fog.Path[i - 1].x - CoD.Fog.Path[i].x ) / CoD.Fog.TranslatingSpeed
	end
end

CoD.Fog.SetGameMap = function ( controller, gameMap )
	if gameMap == CoD.Zombie.MAP_ZM_HIGHRISE then
		CoD.Fog.mapFog.fogTile1:setImage( CoD.Fog.Material2 )
		CoD.Fog.mapFog.fogTile2:setImage( CoD.Fog.Material2 )
		CoD.Fog.DefaultOverlapAndPath()
	elseif gameMap == CoD.Zombie.MAP_ZM_PRISON then
		CoD.Fog.mapFog.fogTile1:setImage( CoD.Fog.Material3 )
		CoD.Fog.mapFog.fogTile2:setImage( CoD.Fog.Material3 )
		CoD.Fog.NoOverlapPath()
	elseif gameMap == CoD.Zombie.MAP_ZM_BURIED then
		CoD.Fog.mapFog.fogTile1:setImage( CoD.Fog.Material4 )
		CoD.Fog.mapFog.fogTile2:setImage( CoD.Fog.Material4 )
		CoD.Fog.BuriedOverlapAndPath()
	elseif gameMap == CoD.Zombie.MAP_ZM_TOMB then
		CoD.Fog.mapFog.fogTile1:setImage( CoD.Fog.Material5 )
		CoD.Fog.mapFog.fogTile2:setImage( CoD.Fog.Material5 )
		CoD.Fog.BuriedOverlapAndPath()
	else
		CoD.Fog.mapFog.fogTile1:setImage( CoD.Fog.Material )
		CoD.Fog.mapFog.fogTile2:setImage( CoD.Fog.Material )
		CoD.Fog.DefaultOverlapAndPath()
	end
end

CoD.Fog.StartMoving = function ()
	CoD.Fog.Reset( CoD.Fog.mapFog.fogTile1, CoD.Fog.Path[2] )
	CoD.Fog.Reset( CoD.Fog.mapFog.fogTile2, CoD.Fog.Path[1] )
	CoD.Fog.PathNodeCurrentIndex = 3
	CoD.Fog.RegisterMoveToNextState( CoD.Fog.mapFog.fogTile1, false, CoD.Fog.PathNodeCurrentIndex )
	CoD.Fog.RegisterMoveToNextState( CoD.Fog.mapFog.fogTile2, false, CoD.Fog.PathNodeCurrentIndex - 1 )
end

CoD.Fog.MapFog1MoveToNextFinish = function ( fogTile, event )
	if event.interrupted ~= true then
		if CoD.Fog.PathNodeCurrentIndex == 3 then
			CoD.Fog.PathNodeCurrentIndex = 2
			CoD.Fog.RegisterMoveToNextState( fogTile, true, 1 )
			CoD.Fog.RegisterMoveToNextState( fogTile, false, 2 )
			CoD.Fog.RegisterMoveToNextState( CoD.Fog.mapFog.fogTile2, false, 3 )
		elseif CoD.Fog.PathNodeCurrentIndex == 2 then
			CoD.Fog.PathNodeCurrentIndex = 3
			CoD.Fog.RegisterMoveToNextState( fogTile, false, 3 )
			CoD.Fog.RegisterMoveToNextState( CoD.Fog.mapFog.fogTile2, true, 1 )
			CoD.Fog.RegisterMoveToNextState( CoD.Fog.mapFog.fogTile2, false, 2 )
		else
			local test = nil
		end
	end
end

CoD.Fog.RegisterMoveToNextState = function ( fogTile, snapTo, pathNodeIndex )
	local pathNode = CoD.Fog.Path[pathNodeIndex]
	if not snapTo then
		fogTile:beginAnimation( "move_to_next", pathNode.forwardTime )
	end
	fogTile:setLeftRight( false, false, pathNode.x - CoD.Fog.TileWidth * 0.5, pathNode.x + CoD.Fog.TileWidth * 0.5 )
end

CoD.Fog.Reset = function ( fogTile, pathNode )
	fogTile:completeAnimation()
	fogTile:setLeftRight( false, false, pathNode.x - CoD.Fog.TileWidth * 0.5, pathNode.x + CoD.Fog.TileWidth * 0.5 )
end

CoD.Fog.Hide = function ( duration )
	CoD.Fog.mapFog:beginAnimation( "hide", duration )
	CoD.Fog.mapFog:setAlpha( 0 )
end

CoD.Fog.Show = function ( duration )
	CoD.Fog.mapFog:beginAnimation( "show", duration )
	CoD.Fog.mapFog:setAlpha( 1 )
end

