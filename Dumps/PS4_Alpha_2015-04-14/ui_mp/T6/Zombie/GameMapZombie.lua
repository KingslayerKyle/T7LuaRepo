CoD.GameMapZombie = {}
CoD.GameMapZombie.gameMap = nil
CoD.GameMapZombie.ScalingSpeed = 1.3
CoD.GameMapZombie.ShakingScaleSmall = 1
CoD.GameMapZombie.ShakingScaleMedium = 2
CoD.GameMapZombie.ShakingAnimTimeMedium = 15
CoD.GameMapZombie.ShakingAnimTimeLong = 30
CoD.GameMapZombie.ShakingAnimTimeFloating = 1500
CoD.GameMapZombie.BlurredImages = {}
CoD.GameMapZombie.Init = function ( mainBG, bgMaterial )
	CoD.GameMapZombie.gameMap = mainBG
	CoD.GameMapZombie.gameMap.id = "gamemap"
	CoD.GameMapZombie.defaultMaterial = bgMaterial
	CoD.GameMapZombie.gameMap:setLeftRight( false, false, -CoD.Zombie.FullScreenSize.w * 0.5, CoD.Zombie.FullScreenSize.w * 0.5 )
	CoD.GameMapZombie.gameMap:setTopBottom( false, false, -CoD.Zombie.FullScreenSize.h * 0.5, CoD.Zombie.FullScreenSize.h * 0.5 )
	CoD.GameMapZombie.gameMap:registerEventHandler( "transition_complete_move_down", CoD.GameMapZombie.MoveDownFinish )
	CoD.GameMapZombie.gameMap:registerEventHandler( "transition_complete_move_up", CoD.GameMapZombie.MoveUpFinish )
end

CoD.GameMapZombie.SwitchToMapDirect = function ( scaleValue, usingBlur, time )
	local mapRef = CoD.Zombie.GetUIMapName()
	local mapMaterialName = "menu_" .. mapRef .. "_map"
	if usingBlur == true then
		mapMaterialName = mapMaterialName .. "_blur"
	end
	local hasDLC = Engine.HasDLCContent( CoD.GetMapValue( mapRef, "dlc_pack", -1 ) )
	if not hasDLC then
		CoD.GameMapZombie.gameMap:setAlpha( 0 )
	else
		if CoD.GameMapZombie.BlurredImages[mapMaterialName] then
			CoD.GameMapZombie.gameMap:setAlpha( 1 )
		else
			CoD.GameMapZombie.gameMap:setAlpha( 0 )
		end
		CoD.GameMapZombie.gameMap:setImage( RegisterMaterial( mapMaterialName ) )
	end
	CoD.GameMapZombie.gameMap:registerEventHandler( "streamed_image_ready", function ( self, event )
		self:setAlpha( 1 )
		CoD.GameMapZombie.BlurredImages[mapMaterialName] = true
	end )
	CoD.GameMapZombie.gameMap:setupUIStreamedImage( 0 )
	if time ~= nil and time > 0 then
		CoD.GameMapZombie.gameMap:beginAnimation( "map", time )
	end
	CoD.GameMapZombie.gameMap:setScale( scaleValue )
	CoD.GameRockZombie.HideAll()
end

CoD.GameMapZombie.SwitchToMap = function ()
	CoD.GameMapZombie.SwitchToMapDirect( 1 )
	CoD.Fog.Show( 500 / CoD.GameMapZombie.ScalingSpeed )
	CoD.Fog.StartMoving()
	CoD.GameMapZombie.MoveUpAnim( 500 / CoD.GameMapZombie.ScalingSpeed )
end

CoD.GameMapZombie.MoveDown = function ( duration )
	CoD.GameMapZombie.MoveDownAnim( duration )
	CoD.Fog.Hide( duration )
end

CoD.GameMapZombie.MoveDownFinish = function ( self, event )
	if event.interrupted == nil then
		if CoD.GameGlobeZombie.gameGlobe.isToCorner == true then
			CoD.GameGlobeZombie.gameGlobe.currentMenu:processEvent( {
				name = "confirm_leave_animfinished",
				controller = CoD.GameGlobeZombie.gameGlobe.controller
			} )
		else
			self.currentMenu:goBack( CoD.GameGlobeZombie.gameGlobe.controller )
		end
		CoD.GameMapZombie.DefaultAnim( 0 )
		CoD.GameRockZombie.ShowAll()
	elseif Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true and CoD.GameGlobeZombie.gameGlobe.isToCorner == true then
		CoD.GameGlobeZombie.gameGlobe.currentMenu:processEvent( {
			name = "confirm_leave_animfinished",
			controller = CoD.GameGlobeZombie.gameGlobe.controller
		} )
	end
end

CoD.GameMapZombie.MoveUpFinish = function ( self, event )
	if event.interrupted == nil then
		CoD.SelectStartLocZombie.ShowStartLoc( self.currentMenu )
		self:setLeftRight( false, false, -CoD.Zombie.FullScreenSize.w * 0.5, CoD.Zombie.FullScreenSize.w * 0.5 )
		self:setTopBottom( false, false, -CoD.Zombie.FullScreenSize.h * 0.5, CoD.Zombie.FullScreenSize.h * 0.5 )
	end
end

CoD.GameMapZombie.DefaultAnim = function ( time )
	CoD.GameMapZombie.gameMap:setImage( CoD.GameMapZombie.defaultMaterial )
	CoD.GameMapZombie.gameMap:beginAnimation( "default", time )
	CoD.GameMapZombie.gameMap:setScale( 1 )
end

CoD.GameMapZombie.ShowAnim = function ( time )
	CoD.GameMapZombie.gameMap:beginAnimation( "show", time )
	CoD.GameMapZombie.gameMap:setAlpha( 1 )
end

CoD.GameMapZombie.HideAnim = function ( time )
	CoD.GameMapZombie.gameMap:beginAnimation( "hide", time )
	CoD.GameMapZombie.gameMap:setAlpha( 0 )
end

CoD.GameMapZombie.MoveUpAnim = function ( time )
	CoD.GameMapZombie.gameMap:beginAnimation( "move_up", time )
	CoD.GameMapZombie.gameMap:setScale( 2 )
end

CoD.GameMapZombie.MoveDownAnim = function ( time )
	CoD.GameMapZombie.gameMap:beginAnimation( "move_down", time )
	CoD.GameMapZombie.gameMap:setScale( 1 )
end

