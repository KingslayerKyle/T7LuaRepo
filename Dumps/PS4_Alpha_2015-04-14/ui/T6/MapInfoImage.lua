if CoD == nil then
	CoD = {}
end
CoD.MapInfoImage = {}
CoD.MapInfoImage.AspectRatio = 1.6
CoD.MapInfoImage.AnimDuration = 250
if not CoD.IsMultiplayer then
	CoD.MapInfoImage.MapImageHeight = 228
	CoD.MapInfoImage.MapImageWidth = 376
	CoD.MapInfoImage.MapImageBottom = -20
	CoD.MapInfoImage.MapImageLeft = -45
else
	CoD.MapInfoImage.MapImageHeight = 136
	CoD.MapInfoImage.MapImageWidth = 294
	CoD.MapInfoImage.MapImageBottom = -57
	CoD.MapInfoImage.MapImageLeft = 6
end
CoD.MapInfoImage.SpinnerImageYPadding = -25
CoD.MapInfoImage.SpinnerImageXPadding = -8
CoD.MapInfoImage.SpinnerImageDimension = 32
CoD.MapInfoImage.GameTypeTextColor = {
	r = 0.71,
	g = 0.76,
	b = 0.78
}
CoD.MapInfoImage.MapNameTextColor = {
	r = 0.71,
	g = 0.76,
	b = 0.78
}
CoD.MapInfoImage.new = function ( defaultAnimationState )
	local mapInfoImage = LUI.UIElement.new( defaultAnimationState )
	mapInfoImage:registerEventHandler( "gamelobby_update", CoD.MapInfoImage.RefreshEvent )
	mapInfoImage:registerEventHandler( "game_options_update", CoD.MapInfoImage.RefreshEvent )
	mapInfoImage:registerEventHandler( "update_livestream_camera", CoD.MapInfoImage.UpdateLiveStreamCamera )
	mapInfoImage.id = "MapInfoImage"
	mapInfoImage.mapTextSize = CoD.textSize.Condensed
	mapInfoImage.gametypeTextSize = CoD.textSize.Default
	mapInfoImage.loadingTextSize = CoD.textSize.Default
	mapInfoImage.unselectedFilmTextSize = CoD.textSize.Default
	local mapInfoFrameHeight = 46
	local mapInfoFrame = LUI.UIImage.new()
	mapInfoFrame:setLeftRight( true, false, -30, CoD.MapInfoImage.MapImageWidth - 46 )
	mapInfoFrame:setTopBottom( false, true, -CoD.MapInfoImage.MapImageHeight - 15, 10 )
	mapInfoFrame:setImage( RegisterImage( "black" ) )
	mapInfoFrame:setAlpha( 0.7 )
	if not CoD.isZombie and not CoD.isCampaign then
		mapInfoImage:addElement( mapInfoFrame )
	end
	local mapImageLeft = CoD.MapInfoImage.MapImageLeft
	local mapImageBottom = CoD.MapInfoImage.MapImageBottom
	mapInfoImage.mapImage = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = mapImageBottom - CoD.MapInfoImage.MapImageHeight,
		bottom = mapImageBottom,
		alpha = 0
	} )
	mapInfoImage:addElement( mapInfoImage.mapImage )
	mapInfoImage.unselectedFilmImageBackground = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = mapImageBottom - CoD.MapInfoImage.MapImageHeight,
		bottom = mapImageBottom,
		material = RegisterMaterial( "white" ),
		red = 0,
		green = 0,
		blue = 0
	} )
	mapInfoImage.unselectedFilmImageBackground:setAlpha( 0 )
	mapInfoImage:addElement( mapInfoImage.unselectedFilmImageBackground )
	mapInfoImage.unselectedFilmImage = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft + 70,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth - 70,
		topAnchor = false,
		bottomAnchor = true,
		top = mapImageBottom - CoD.MapInfoImage.MapImageHeight,
		bottom = mapImageBottom,
		material = RegisterMaterial( "menu_mp_lobby_icon_film" ),
		red = 1,
		green = 1,
		blue = 1
	} )
	mapInfoImage.unselectedFilmImage:setAlpha( 0 )
	mapInfoImage:addElement( mapInfoImage.unselectedFilmImage )
	local rightOffset = CoD.MPZM( -38, -20 )
	local bottomOffset = CoD.MPZM( -48, -14 )
	mapInfoImage.gameTypeText = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft + CoD.MapInfoImage.MapImageWidth - 1000,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth + rightOffset,
		topAnchor = false,
		bottomAnchor = true,
		top = mapImageBottom + mapInfoFrameHeight + bottomOffset - CoD.textSize.ExtraSmall,
		bottom = mapImageBottom + mapInfoFrameHeight + bottomOffset,
		alignment = LUI.Alignment.Right,
		font = CoD.fonts.ExtraSmall,
		red = CoD.MapInfoImage.GameTypeTextColor.r,
		green = CoD.MapInfoImage.GameTypeTextColor.g,
		blue = CoD.MapInfoImage.GameTypeTextColor.b
	} )
	mapInfoImage:addElement( mapInfoImage.gameTypeText )
	mapInfoImage.mapNameText = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft + CoD.MapInfoImage.MapImageWidth - 1000,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth + rightOffset,
		topAnchor = false,
		bottomAnchor = true,
		top = mapImageBottom + mapInfoFrameHeight + bottomOffset - 17 - CoD.textSize.Default,
		bottom = mapImageBottom + mapInfoFrameHeight + bottomOffset - 17,
		alignment = LUI.Alignment.Right,
		font = CoD.fonts.Default,
		red = CoD.MapInfoImage.MapNameTextColor.r,
		green = CoD.MapInfoImage.MapNameTextColor.g,
		blue = CoD.MapInfoImage.MapNameTextColor.b
	} )
	mapInfoImage:addElement( mapInfoImage.mapNameText )
	local loadingText = Engine.ToUpper( Engine.Localize( "EXE_LOADING" ) )
	local f1_local0 = {}
	local loadingTextDimensions = GetTextDimensions( loadingText, CoD.fonts.Default, mapInfoImage.loadingTextSize )
	local loadingTextWidth = loadingTextDimensions[3]
	mapInfoImage.loadingText = LUI.UIText.new()
	mapInfoImage.loadingText:setLeftRight( false, false, -loadingTextWidth / 2 + CoD.MapInfoImage.SpinnerImageXPadding, loadingTextWidth / 2 + CoD.MapInfoImage.SpinnerImageXPadding )
	mapInfoImage.loadingText:setTopBottom( false, false, CoD.MapInfoImage.SpinnerImageDimension + CoD.MapInfoImage.SpinnerImageYPadding, CoD.MapInfoImage.SpinnerImageDimension + CoD.MapInfoImage.SpinnerImageYPadding + mapInfoImage.loadingTextSize )
	mapInfoImage.loadingText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	mapInfoImage.loadingText:setAlpha( 0 )
	mapInfoImage.loadingText:setText( loadingText )
	mapInfoImage:addElement( mapInfoImage.loadingText )
	mapInfoImage.unselectedFilmText = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft + 30,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth - 30,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.MapInfoImage.MapImageHeight / 2 - mapInfoImage.unselectedFilmTextSize / 2,
		bottom = CoD.MapInfoImage.MapImageHeight / 2 + mapInfoImage.unselectedFilmTextSize / 2,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Center
	} )
	mapInfoImage.unselectedFilmText:setAlpha( 0 )
	mapInfoImage:addElement( mapInfoImage.unselectedFilmText )
	local modBottom = mapImageBottom + mapInfoFrameHeight + bottomOffset - 45
	mapInfoImage.modifedCustomGameElement = LUI.UIElement.new()
	mapInfoImage.modifedCustomGameElement:setLeftRight( true, false, mapImageLeft + 2, mapImageLeft + CoD.MapInfoImage.MapImageWidth - 2 )
	mapInfoImage.modifedCustomGameElement:setTopBottom( false, true, modBottom - 32, modBottom )
	mapInfoImage:addElement( mapInfoImage.modifedCustomGameElement )
	local modBg = LUI.UIImage.new()
	modBg:setLeftRight( true, true, 0, 0 )
	modBg:setTopBottom( true, true, 0, 0 )
	modBg:setRGB( 0, 0, 0 )
	modBg:setAlpha( 0.5 )
	mapInfoImage.modifedCustomGameElement:addElement( modBg )
	local modStar = LUI.UIImage.new()
	modStar:setLeftRight( true, false, 0, 32 )
	modStar:setTopBottom( true, false, 0, 32 )
	modStar:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	modStar:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
	mapInfoImage.modifedCustomGameElement:addElement( modStar )
	local modifiedGameName = LUI.UIText.new()
	modifiedGameName:setLeftRight( true, true, 0, -10 )
	modifiedGameName:setTopBottom( true, false, 0, CoD.textSize.Default )
	modifiedGameName:setAlignment( LUI.Alignment.Right )
	mapInfoImage.modifedCustomGameElement.text = modifiedGameName
	mapInfoImage.modifedCustomGameElement:addElement( modifiedGameName )
	mapInfoImage.modifedCustomGameElement:setAlpha( 0 )
	mapInfoImage.livestreamCam = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = mapImageBottom - CoD.MapInfoImage.MapImageHeight,
		bottom = mapImageBottom,
		material = RegisterMaterial( "livestream_cam" ),
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	mapInfoImage:addElement( mapInfoImage.livestreamCam )
	CoD.MapInfoImage.UpdateLiveStreamCamera( mapInfoImage )
	mapInfoImage.update = CoD.MapInfoImage.Update
	mapInfoImage.show = CoD.MapInfoImage.Show
	mapInfoImage.hide = CoD.MapInfoImage.Hide
	mapInfoImage.setModifiedCustomGame = CoD.MapInfoImage.SetModifedCustomGame
	return mapInfoImage
end

CoD.MapInfoImage.Update = function ( self, map, gametype )
	if map ~= nil then
		local imageName = CoD.GetMapValue( map, "previewImage", "black" )
		self.mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		self.mapImage:setImage( RegisterImage( imageName ) )
		self.mapImage:registerAnimationState( "change_map", {
			alpha = 1
		} )
		self.mapImage:animateToState( "change_map" )
		self.mapNameText:setText( Engine.ToUpper( Engine.Localize( CoD.GetMapValue( map, "mapName", map ) ) ) )
	end
	if gametype ~= nil then
		self.gameTypeText:setText( Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" ) ) )
		if CoD.isSinglePlayer == true then
			local gametypeTextName = Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "description" ) )
			self.gameTypeText:setText( gametypeTextName )
		end
	end
	CoD.MapInfoImage.UpdateLiveStreamCamera( self, nil )
	CoD.MapInfoImage.DLCWarningUpdate( self )
end

CoD.MapInfoImage.UpdateLiveStreamCamera = function ( self, event )
	if Engine.IsLivestreamEnabled() and Engine.WebM_camera_IsAvailable() and Engine.WebM_camera_IsEnabled() then
		self.livestreamCam:setAlpha( 1 )
	else
		self.livestreamCam:setAlpha( 0 )
	end
end

CoD.MapInfoImage.UpdateEvent = function ( self, event )
	self:update( event.map, event.gametype )
end

CoD.MapInfoImage.RefreshEvent = function ( self, event )
	self:update( Dvar.ui_mapname:get(), Dvar.ui_gametype:get() )
end

CoD.MapInfoImage.SetModifedCustomGame = function ( self, isModified )
	if isModified == true then
		self.modifedCustomGameElement.text:setText( Dvar.fshCustomGameName:get() )
		self.modifedCustomGameElement:setAlpha( 1 )
	else
		self.modifedCustomGameElement:setAlpha( 0 )
	end
end

CoD.MapInfoImage.TheaterUpdate = function ( self, isHost, map, gametype, downloadPercent, areAllPlayersReadyToLoadDemo )
	if Engine.DvarString( self.controller, "ui_demoname" ) == "" then
		self.unselectedFilmImageBackground:setAlpha( 0.2 )
		self.unselectedFilmImage:setAlpha( 0.2 )
		if isHost == true then
			self.unselectedFilmText:setText( Engine.Localize( "MENU_THEATER_LOAD_HINT" ) )
		else
			self.unselectedFilmText:setText( Engine.GetTheaterFilmNotSelectedMessage() )
		end
		self.unselectedFilmText:setAlpha( 1 )
		self.mapImage:setAlpha( 0 )
		self.mapNameText:setAlpha( 0 )
		self.gameTypeText:setAlpha( 0 )
		self.loadingText:setAlpha( 0 )
	else
		self.unselectedFilmImageBackground:setAlpha( 0 )
		self.unselectedFilmImage:setAlpha( 0 )
		self.unselectedFilmText:setAlpha( 0 )
		self.mapImage:setAlpha( 1 )
		self.mapNameText:setAlpha( 1 )
		self.gameTypeText:setAlpha( 1 )
		if areAllPlayersReadyToLoadDemo ~= nil and not areAllPlayersReadyToLoadDemo then
			self.unselectedFilmImage:setLeftRight( false, false, -CoD.MapInfoImage.SpinnerImageDimension + CoD.MapInfoImage.SpinnerImageXPadding, CoD.MapInfoImage.SpinnerImageDimension + CoD.MapInfoImage.SpinnerImageXPadding )
			self.unselectedFilmImage:setTopBottom( false, false, -CoD.MapInfoImage.SpinnerImageDimension + CoD.MapInfoImage.SpinnerImageYPadding, CoD.MapInfoImage.SpinnerImageDimension + CoD.MapInfoImage.SpinnerImageYPadding )
			self.unselectedFilmImage:setImage( RegisterMaterial( "lui_loader" ) )
			self.unselectedFilmImage:setShaderVector( 0, 0, 0, 0, 0 )
			self.unselectedFilmImage:setAlpha( 1 )
			self.loadingText:setAlpha( 1 )
		else
			self.unselectedFilmImage:setAlpha( 0 )
			self.loadingText:setAlpha( 0 )
		end
		self:update( map, gametype )
	end
	CoD.MapInfoImage.DLCWarningUpdate( self )
end

CoD.MapInfoImage.Show = function ( self, duration )
	self:registerAnimationState( "show", {
		alphaMultiplier = 1
	} )
	local animDuration = CoD.MapInfoImage.AnimDuration
	if duration then
		animDuration = duration
	end
	self:animateToState( "show", animDuration )
end

CoD.MapInfoImage.Hide = function ( self, duration )
	self:registerAnimationState( "hide", {
		alphaMultiplier = 0
	} )
	local animDuration = CoD.MapInfoImage.AnimDuration
	if duration then
		animDuration = duration
	end
	self:animateToState( "hide", animDuration )
end

CoD.MapInfoImage.ShowLeagueInfo = function ( self, league )
	if league then
		self.gameTypeText:setText( Engine.ToUpper( league.description ) )
		self.mapNameText:setText( Engine.ToUpper( CoD.Menu.GetOnlinePlayerCountText( Engine.GetPlaylistID() ) ) )
		self.mapImage:setImage( league.icon )
		self.mapImage:setAlpha( 1 )
	end
	CoD.MapInfoImage.UpdateLiveStreamCamera( self, nil )
end

CoD.MapInfoImage.DLCWarningUpdate = function ( self )
	if self.dlcWarningContainer ~= nil then
		local mapName = Dvar.ui_mapname:get()
		local partyHasDLCForMap = Engine.DoesPartyHaveDLCForMap( mapName )
		local warningText = ""
		if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
			if Engine.DvarString( self.controller, "ui_demoname" ) == "" then
				self.dlcWarningContainer:setAlpha( 0 )
			elseif partyHasDLCForMap == false and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
				self.dlcWarningContainer:setAlpha( 1 )
				warningText = Engine.Localize( "MPUI_DLC_WARNING_PARTY_MISSING_MAP_PACK_THEATER" )
			else
				self.dlcWarningContainer:setAlpha( 0 )
			end
		elseif partyHasDLCForMap == false and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
			self.dlcWarningContainer:setAlpha( 1 )
			warningText = Engine.Localize( "MPUI_DLC_WARNING_PARTY_MISSING_MAP_PACK" )
		else
			self.dlcWarningContainer:setAlpha( 0 )
		end
		self.dlcWarningContainer.warningLabel:setText( warningText )
	end
end

