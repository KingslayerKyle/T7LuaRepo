CoD.GameMoonZombie = {}
CoD.GameMoonZombie.gameMoon = nil
CoD.GameMoonZombie.gameFlare = nil
CoD.GameMoonZombie.gameFlareLeft = nil
CoD.GameMoonZombie.gameSun = nil
CoD.GameMoonZombie.MeteorMaterial = RegisterMaterial( "lui_bkg_zm_meteor" )
CoD.GameMoonZombie.FlareMaterial = RegisterMaterial( "lui_bkg_zm_flare" )
CoD.GameMoonZombie.FlareLeftMaterial = RegisterMaterial( "lui_bkg_zm_flare_left" )
CoD.GameMoonZombie.SunMaterial = RegisterMaterial( "lui_bkg_zm_sun" )
CoD.GameMoonZombie.TranslatingSpeed = 0.2
CoD.GameMoonZombie.LobbyMovePath = {}
CoD.GameMoonZombie.LobbyMovePathNodeCount = 6
CoD.GameMoonZombie.LobbyMovePath[1] = {
	left = 800,
	bottom = -400,
	radius = 90
}
CoD.GameMoonZombie.LobbyMovePath[2] = {
	left = 700,
	bottom = -420,
	radius = 90
}
CoD.GameMoonZombie.LobbyMovePath[3] = {
	left = 600,
	bottom = -440,
	radius = 90
}
CoD.GameMoonZombie.LobbyMovePath[4] = {
	left = 500,
	bottom = -460,
	radius = 90
}
CoD.GameMoonZombie.LobbyMovePath[5] = {
	left = 400,
	bottom = -480,
	radius = 90
}
CoD.GameMoonZombie.LobbyMovePath[6] = {
	left = 300,
	bottom = -500,
	radius = 90
}
CoD.GameMoonZombie.MapMovePath = {}
CoD.GameMoonZombie.MapMovePathNodeCount = 12
CoD.GameMoonZombie.MapMovePathNodeMidIndex = 7
CoD.GameMoonZombie.MapMoveTranslateSpeedScale = 0.5
CoD.GameMoonZombie.MapMovePath[1] = {
	left = -1600,
	bottom = 1600,
	radius = 512
}
CoD.GameMoonZombie.MapMovePath[2] = {
	left = 0,
	bottom = 872,
	radius = 512
}
CoD.GameMoonZombie.MapMovePath[3] = {
	left = 200,
	bottom = 756,
	radius = 512
}
CoD.GameMoonZombie.MapMovePath[4] = {
	left = 400,
	bottom = 641,
	radius = 512
}
CoD.GameMoonZombie.MapMovePath[5] = {
	left = 600,
	bottom = 525,
	radius = 512
}
CoD.GameMoonZombie.MapMovePath[6] = {
	left = 1200,
	bottom = 179,
	radius = 512
}
CoD.GameMoonZombie.MapMovePath[7] = {
	left = 1600,
	bottom = -51,
	radius = 512
}
CoD.GameMoonZombie.MapMovePath[8] = {
	left = 1900,
	bottom = -224,
	radius = 15
}
CoD.GameMoonZombie.MapMovePath[9] = {
	left = 320,
	bottom = -500,
	radius = 14
}
CoD.GameMoonZombie.MapMovePath[10] = {
	left = 0,
	bottom = -500,
	radius = 13
}
CoD.GameMoonZombie.MapMovePath[11] = {
	left = -320,
	bottom = -500,
	radius = 14
}
CoD.GameMoonZombie.MapMovePath[12] = {
	left = -1600,
	bottom = -500,
	radius = 15
}
CoD.GameMoonZombie.PathNodeCurrentIndex = 1
CoD.GameMoonZombie.LowRumble = 0.4
CoD.GameMoonZombie.HighRumble = 0.6
CoD.GameMoonZombie.ShakingObj = nil
CoD.GameMoonZombie.ShakingObjShakingScale = 3
CoD.GameMoonZombie.FlareFadeDuration = 150
CoD.GameMoonZombie.Init = function ( moon, flareContainer, sun )
	moon:setImage( CoD.GameMoonZombie.MeteorMaterial )
	moon:setAlpha( 0 )
	moon:registerEventHandler( "transition_complete_lobby_move", CoD.GameMoonZombie.LobbyMoveFinish )
	moon:registerEventHandler( "lobby_move_update", CoD.GameMoonZombie.LobbyMove )
	moon:registerEventHandler( "transition_complete_map_move", CoD.GameMoonZombie.MapMoveFinish )
	CoD.GameMoonZombie.gameMoon = moon
	CoD.GameMoonZombie.gameMoon.id = "gamemoon"
	CoD.GameMoonZombie.InitPaths()
	flareContainer:setLeftRight( true, true, 0, 0 )
	flareContainer:setTopBottom( true, true, 0, 0 )
	local flare = LUI.UIImage.new()
	flare:setLeftRight( false, false, -CoD.Zombie.FullScreenSize.w * 0.5, CoD.Zombie.FullScreenSize.w * 0.5 )
	flare:setTopBottom( false, false, -CoD.Zombie.FullScreenSize.h * 0.5, CoD.Zombie.FullScreenSize.h * 0.5 )
	flare:setAlpha( 0 )
	flare:setImage( CoD.GameMoonZombie.FlareMaterial )
	flareContainer:addElement( flare )
	CoD.GameMoonZombie.gameFlare = flare
	local flareLeft = LUI.UIImage.new()
	flareLeft:setLeftRight( false, false, -CoD.Zombie.FullScreenSize.w * 0.5, CoD.Zombie.FullScreenSize.w * 0.5 )
	flareLeft:setTopBottom( false, false, -CoD.Zombie.FullScreenSize.h * 0.5, CoD.Zombie.FullScreenSize.h * 0.5 )
	flareLeft:setAlpha( 0 )
	flareLeft:setImage( CoD.GameMoonZombie.FlareLeftMaterial )
	flareContainer:addElement( flareLeft )
	CoD.GameMoonZombie.gameFlareLeft = flareLeft
	sun:setLeftRight( false, false, -CoD.Zombie.FullScreenSize.w * 0.5, CoD.Zombie.FullScreenSize.w * 0.5 )
	sun:setTopBottom( false, false, -CoD.Zombie.FullScreenSize.h * 0.5, CoD.Zombie.FullScreenSize.h * 0.5 )
	sun:setImage( CoD.GameMoonZombie.SunMaterial )
	CoD.GameMoonZombie.gameSun = sun
end

CoD.GameMoonZombie.InitPaths = function ()
	local leftDiff, bottomDiff, dist, preIndex = nil
	for i = 2, CoD.GameMoonZombie.LobbyMovePathNodeCount, 1 do
		leftDiff = CoD.GameMoonZombie.LobbyMovePath[i].left - CoD.GameMoonZombie.LobbyMovePath[i - 1].left
		bottomDiff = CoD.GameMoonZombie.LobbyMovePath[i].bottom - CoD.GameMoonZombie.LobbyMovePath[i - 1].bottom
		CoD.GameMoonZombie.LobbyMovePath[i].forwardTime = math.sqrt( leftDiff * leftDiff + bottomDiff * bottomDiff ) / CoD.GameMoonZombie.TranslatingSpeed
	end
	for i = 1, CoD.GameMoonZombie.MapMovePathNodeCount, 1 do
		if i == 1 then
			preIndex = CoD.GameMoonZombie.MapMovePathNodeCount
		else
			preIndex = i - 1
		end
		leftDiff = CoD.GameMoonZombie.MapMovePath[i].left - CoD.GameMoonZombie.MapMovePath[preIndex].left
		bottomDiff = CoD.GameMoonZombie.MapMovePath[i].bottom - CoD.GameMoonZombie.MapMovePath[preIndex].bottom
		CoD.GameMoonZombie.MapMovePath[i].forwardTime = math.sqrt( leftDiff * leftDiff + bottomDiff * bottomDiff ) / CoD.GameMoonZombie.TranslatingSpeed
		if i > CoD.GameMoonZombie.MapMovePathNodeMidIndex then
			CoD.GameMoonZombie.MapMovePath[i].forwardTime = CoD.GameMoonZombie.MapMovePath[i].forwardTime / CoD.GameMoonZombie.MapMoveTranslateSpeedScale
		end
	end
end

CoD.GameMoonZombie.Reset = function ()
	if CoD.GameMoonZombie.gameMoon.LobbyTimer then
		CoD.GameMoonZombie.gameMoon.LobbyTimer:close()
	end
	CoD.GameMoonZombie.gameMoon:completeAnimation()
	CoD.GameMapZombie.gameMap:completeAnimation()
	CoD.GameGlobeZombie.gameGlobe:completeAnimation()
	CoD.GameGlobeZombie.mapInfoContainer:completeAnimation()
	local pathNode = CoD.GameMoonZombie.MapMovePath[1]
	CoD.GameMoonZombie.gameMoon:setLeftRight( false, false, pathNode.left - pathNode.radius, pathNode.left + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setTopBottom( false, false, pathNode.bottom - pathNode.radius, pathNode.bottom + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setAlpha( 0 )
	CoD.GameMoonZombie.controller = nil
	CoD.GameMoonZombie.PathNodeCurrentIndex = 1
end

CoD.GameMoonZombie.LobbyMoveStart = function ( controller )
	if not CoD.GameMoonZombie.gameMoon.LobbyTimer then
		CoD.GameMoonZombie.gameMoon.LobbyTimer = LUI.UITimer.new( 10000, "lobby_move_update", false )
		CoD.GameMoonZombie.gameMoon:addElement( CoD.GameMoonZombie.gameMoon.LobbyTimer )
	end
	CoD.GameMoonZombie.controller = controller
	CoD.GameMoonZombie.LobbyMove()
end

CoD.GameMoonZombie.LobbyMove = function ()
	local pathNode = CoD.GameMoonZombie.LobbyMovePath[1]
	CoD.GameMoonZombie.gameMoon:setLeftRight( false, false, pathNode.left - pathNode.radius, pathNode.left + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setTopBottom( false, false, pathNode.bottom - pathNode.radius, pathNode.bottom + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setAlpha( 1 )
	CoD.GameMoonZombie.PathNodeCurrentIndex = 2
	CoD.GameMoonZombie.LobbyMoveToNextNode()
end

CoD.GameMoonZombie.LobbyMoveToNextNode = function ()
	local pathNode = CoD.GameMoonZombie.LobbyMovePath[CoD.GameMoonZombie.PathNodeCurrentIndex]
	CoD.GameMoonZombie.gameMoon:beginAnimation( "lobby_move", pathNode.forwardTime )
	CoD.GameMoonZombie.gameMoon:setLeftRight( false, false, pathNode.left - pathNode.radius, pathNode.left + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setTopBottom( false, false, pathNode.bottom - pathNode.radius, pathNode.bottom + pathNode.radius )
end

CoD.GameMoonZombie.LobbyMoveFinish = function ( self, event )
	if event.interrupted == nil then
		CoD.GameMoonZombie.PathNodeCurrentIndex = CoD.GameMoonZombie.PathNodeCurrentIndex + 1
		if CoD.GameMoonZombie.PathNodeCurrentIndex <= CoD.GameMoonZombie.LobbyMovePathNodeCount then
			CoD.GameMoonZombie.LobbyMoveToNextNode()
		else
			
		end
	end
end

CoD.GameMoonZombie.MapMoveStart = function ( controller )
	CoD.GameMoonZombie.controller = controller
	local pathNode = CoD.GameMoonZombie.MapMovePath[1]
	CoD.GameMoonZombie.gameMoon:setLeftRight( false, false, pathNode.left - pathNode.radius, pathNode.left + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setTopBottom( false, false, pathNode.bottom - pathNode.radius, pathNode.bottom + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setAlpha( 1 )
	CoD.GameMoonZombie.PathNodeCurrentIndex = 2
	CoD.GameMoonZombie.MapMoveToNextNode()
end

CoD.GameMoonZombie.MapMoveToNextNode = function ()
	local pathNode = CoD.GameMoonZombie.MapMovePath[CoD.GameMoonZombie.PathNodeCurrentIndex]
	CoD.GameMoonZombie.gameMoon:beginAnimation( "map_move", pathNode.forwardTime )
	CoD.GameMoonZombie.gameMoon:setLeftRight( false, false, pathNode.left - pathNode.radius, pathNode.left + pathNode.radius )
	CoD.GameMoonZombie.gameMoon:setTopBottom( false, false, pathNode.bottom - pathNode.radius, pathNode.bottom + pathNode.radius )
end

CoD.GameMoonZombie.MapMoveFinish = function ( self, event )
	if event.interrupted == nil then
		CoD.GameMoonZombie.PathNodeCurrentIndex = CoD.GameMoonZombie.PathNodeCurrentIndex % CoD.GameMoonZombie.MapMovePathNodeCount + 1
		if CoD.GameMoonZombie.PathNodeCurrentIndex ~= 1 then
			if CoD.GameMoonZombie.PathNodeCurrentIndex == 7 then
				
			elseif CoD.GameMoonZombie.PathNodeCurrentIndex == 3 then
				CoD.GameMoonZombie.StartShake( CoD.GameMapZombie.gameMap, CoD.GameMapZombie.ShakingScaleMedium, CoD.GameMapZombie.ShakingAnimTimeMedium )
				CoD.GameMoonZombie.StartShake( CoD.GameGlobeZombie.gameGlobe, CoD.GameGlobeZombie.ShakingScaleMedium, CoD.GameGlobeZombie.ShakingAnimTimeMedium )
			end
		end
		CoD.GameMoonZombie.MapMoveToNextNode()
	end
end

CoD.GameMoonZombie.StartShake = function ( shakingObj, shakingScaleValue, animTime )
	shakingObj.ShakingScaleCurrent = shakingScaleValue
	shakingObj.AnimTime = animTime
	shakingObj:registerEventHandler( "transition_complete_shaking", CoD.GameMoonZombie.ShakingFinish )
	CoD.GameMoonZombie.RegisterShakingState( shakingObj )
end

CoD.GameMoonZombie.RegisterShakingState = function ( shakingObj )
	local randomWidthValue = math.random() * shakingObj.ShakingScaleCurrent * 2 - shakingObj.ShakingScaleCurrent
	local randomHeightValue = math.random() * shakingObj.ShakingScaleCurrent * 2 - shakingObj.ShakingScaleCurrent
	local leftAnchor = true
	local rightAnchor = true
	local topAnchor = true
	local bottomAnchor = true
	shakingObj:beginAnimation( "shaking", shakingObj.AnimTime )
	if shakingObj.id == "gameglobe" then
		shakingObj:setLeftRight( false, false, -CoD.GameGlobeZombie.CenterRadius + randomWidthValue, CoD.GameGlobeZombie.CenterRadius + randomWidthValue )
		shakingObj:setTopBottom( false, false, -CoD.GameGlobeZombie.CenterRadius + CoD.GameGlobeZombie.PlaceYOffSet + randomHeightValue, CoD.GameGlobeZombie.CenterRadius + CoD.GameGlobeZombie.PlaceYOffSet + randomHeightValue )
	else
		shakingObj:setLeftRight( false, false, -CoD.Zombie.FullScreenSize.w * 0.5 - shakingObj.ShakingScaleCurrent + randomWidthValue, CoD.Zombie.FullScreenSize.w * 0.5 + shakingObj.ShakingScaleCurrent + randomWidthValue )
		shakingObj:setTopBottom( false, false, -CoD.Zombie.FullScreenSize.h * 0.5 - shakingObj.ShakingScaleCurrent + randomHeightValue, CoD.Zombie.FullScreenSize.h * 0.5 + shakingObj.ShakingScaleCurrent + randomHeightValue )
	end
end

CoD.GameMoonZombie.ShakingFinish = function ( shakingObj, event )
	if event.interrupted == nil and CoD.GameMoonZombie.PathNodeCurrentIndex >= 3 and CoD.GameMoonZombie.PathNodeCurrentIndex < 7 then
		CoD.GameMoonZombie.RegisterShakingState( shakingObj )
	end
end

CoD.GameMoonZombie.FadeOutFlare = function ()
	CoD.GameMoonZombie.gameFlare:beginAnimation( "hide", CoD.GameMoonZombie.FlareFadeDuration )
	CoD.GameMoonZombie.gameFlare:setAlpha( 0 )
end

CoD.GameMoonZombie.FadeInFlare = function ()
	CoD.GameMoonZombie.gameFlare:beginAnimation( "show", CoD.GameMoonZombie.FlareFadeDuration )
	CoD.GameMoonZombie.gameFlare:setAlpha( 1 )
end

CoD.GameMoonZombie.FadeOutFlareLeft = function ()
	CoD.GameMoonZombie.gameFlareLeft:beginAnimation( "hide", CoD.GameMoonZombie.FlareFadeDuration )
	CoD.GameMoonZombie.gameFlareLeft:setAlpha( 0 )
end

CoD.GameMoonZombie.FadeInFlareLeft = function ()
	CoD.GameMoonZombie.gameFlareLeft:beginAnimation( "show", CoD.GameMoonZombie.FlareFadeDuration )
	CoD.GameMoonZombie.gameFlareLeft:setAlpha( 1 )
end

CoD.GameMoonZombie.FadeOutSun = function ()
	CoD.GameMoonZombie.gameSun:beginAnimation( "hide", CoD.GameMoonZombie.FlareFadeDuration )
	CoD.GameMoonZombie.gameSun:setAlpha( 0 )
end

CoD.GameMoonZombie.FadeInSun = function ()
	CoD.GameMoonZombie.gameSun:beginAnimation( "show", CoD.GameMoonZombie.FlareFadeDuration )
	CoD.GameMoonZombie.gameSun:setAlpha( 1 )
end

CoD.GameMoonZombie.FadeOutFlares = function ()
	CoD.GameMoonZombie.FadeOutFlare()
	CoD.GameMoonZombie.FadeOutFlareLeft()
	CoD.GameMoonZombie.FadeOutSun()
end

