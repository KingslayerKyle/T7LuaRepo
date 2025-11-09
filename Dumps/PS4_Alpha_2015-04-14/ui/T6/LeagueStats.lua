CoD.LeagueStats = {}
CoD.LeagueStats.width = 400
CoD.LeagueStats.height = 120
CoD.LeagueStats.textMargin = 70
CoD.LeagueStats.divisionImageSize = 128
local LeagueTextElement = function ( y, fontname, topAnchored, topAligned )
	local tA = topAnchored
	local bA = not tA
	local t = 0
	local b = 0
	local height = CoD.textSize[fontname]
	if topAligned then
		t = y
		b = y + height
	else
		t = y - height
		b = y
	end
	return LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.LeagueStats.textMargin,
		right = 0,
		topAnchor = tA,
		bottomAnchor = bA,
		top = t,
		bottom = b,
		alignment = LUI.Alignment.Left,
		font = CoD.fonts[fontname],
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b
	} )
end

CoD.LeagueStats.InvalidTeamForLeague = function ( controller, info, stats )
	if info == nil then
		return "MENU_LEAGUE_FIND_MATCH_INVALID_DESC"
	elseif stats == nil then
		return "MENU_LEAGUE_FIND_MATCH_INVALID_DESC"
	elseif not stats.valid then
		return "MENU_LEAGUE_FIND_MATCH_INVALID_DESC"
	elseif stats.random == true and info.randomsAllowed ~= true then
		return "MENU_LEAGUE_FIND_MATCH_INVALID_SOLO_DESC"
	elseif stats.random == false and info.teamsAllowed == false then
		return "MENU_LEAGUE_FIND_MATCH_INVALID_TEAM_DESC"
	elseif stats.random == false and info.teamsAllowed == true and stats.memberCount ~= info.teamSize then
		return "MENU_LEAGUE_FIND_MATCH_INVALID_TEAMSIZE_DESC"
	elseif Engine.IsPlaylistLocked( controller, Engine.GetPlaylistID() ) then
		return Engine.GetLeagueLockedDescription( controller, Engine.GetPlaylistID() )
	else
		return false
	end
end

CoD.LeagueStats.SeasonDateTick = function ( self, event )
	if self.seasonDate == nil then
		return 
	elseif self.info == nil then
		self.seasonDate:setText( "" )
	else
		self.seasonDate:setText( Engine.GetLeagueSeasonDate( self.info.id ) )
	end
end

CoD.LeagueStats.Update = function ( self, event )
	self.info = Engine.GetLeague()
	self.stats = Engine.GetLeagueStats( event.controller )
	if self.info == nil or self.stats == nil or self.stats.valid == false then
		self.teamName:setText( "" )
		self.divisionImage:setImage( RegisterMaterial( "menu_div_no_place" ) )
		self.divisionImage:setAlpha( 1 )
		self.spinner:setAlpha( 1 )
		self.placementCount:setText( "" )
		self.name:setText( Engine.Localize( "LEAGUE_WORKING" ) )
		self.rank:setText( "" )
		self.seasonDate:setText( "" )
		self.bonusPool:setText( "" )
		self:animateToState( "valid" )
		if CoD.LeagueStats.InvalidTeamForLeague( event.controller, self.info, self.stats ) then
			return 
		end
	end
	if CoD.LeagueStats.InvalidTeamForLeague( event.controller, self.info, self.stats ) then
		self:animateToState( "invalid" )
		return 
	end
	local placements = self.info.placementGames
	local rank = self.stats.rank
	local games_played = self.stats.played
	local bonusRemaining = math.max( self.info.bonusPool - self.stats.bonusUsed, 0 )
	local bonusDays = self.info.bonusDays
	local bonusCumulative = self.info.bonusCumulative
	if bonusDays == nil then
		bonusDays = 1
	end
	if self.stats.random then
		self.teamName:setText( Engine.Localize( "LEAGUE_RANDOM_WITH_NAME", self.stats.teamName ) )
	elseif self.stats.teamName ~= "" then
		self.teamName:setText( Engine.Localize( "LEAGUE_ARRANGED_WITH_NAME", self.stats.teamName ) )
	else
		self.teamName:setText( Engine.Localize( "LEAGUE_ARRANGED_UNNAMED" ) )
	end
	self.divisionImage:setImage( self.stats.divisionIcon )
	self.divisionImage:setAlpha( 1 )
	self.spinner:setAlpha( 0 )
	if self.stats.isPreSeason then
		self.placementCount:setText( "" )
		self.name:setText( Engine.Localize( "LEAGUE_PRACTICE" ) )
		self.rank:setText( Engine.Localize( "LEAGUE_PRESEASON" ) )
		self.seasonDate:setText( self.stats.seasonDate )
		self.bonusPool:setText( "" )
		self.seasonDate:setAlpha( 1 )
	else
		self.seasonDate:setAlpha( 0 )
		if self.stats.inPlacement then
			if games_played < placements then
				self.placementCount:setText( placements - games_played )
				self.name:setText( Engine.Localize( "LEAGUE_PLACEMENT_GAMES", placements - games_played ) )
				self.rank:setText( Engine.Localize( "LEAGUE_REQUIRED" ) )
			else
				self.placementCount:setText( "" )
				self.name:setText( Engine.Localize( "LEAGUE_AWAITING_PLACEMENT" ) )
				self.rank:setText( "" )
				self.divisionImage:setAlpha( 0 )
			end
			self.bonusPool:setText( "" )
		else
			self.placementCount:setText( "" )
			self.name:setText( Engine.ToUpper( self.stats.divisionName ) )
			self.rank:setText( Engine.Localize( "LEAGUE_RANK", rank ) )
			local bonusString = "LEAGUE_BONUS_"
			if not bonusCumulative then
				if bonusDays == 7 then
					bonusString = "LEAGUE_WEEKLY_BONUS_"
				elseif bonusDays == 1 then
					bonusString = "LEAGUE_DAILY_BONUS_"
				end
			end
			if bonusRemaining > 0 or bonusCumulative then
				self.bonusPool:setText( Engine.Localize( bonusString .. "REMAINING", bonusRemaining ) )
				self.bonusPool:setRGB( 0.2, 0.6, 0.2 )
			else
				self.bonusPool:setText( Engine.Localize( bonusString .. "COMPLETE" ) )
				self.bonusPool:setRGB( 0.4, 0.4, 0.4 )
			end
		end
	end
	self:animateToState( "valid" )
end

CoD.LeagueStats.new = function ( defaultAnimationState )
	local root = LUI.UIElement.new( defaultAnimationState )
	root:registerAnimationState( "valid", {
		alpha = 1
	} )
	root:registerAnimationState( "invalid", {
		alpha = 0
	} )
	local playerLeagueTop = CoD.textSize.Default * 5 + 100
	local playerLeagueInfoHeight = CoD.textSize.Default * 4
	local playerLeagueInfoLeft = CoD.LobbyPanes.VoipOffset
	local stripMarginTop = CoD.textSize.Default + 2
	local stripMarginBottom = CoD.textSize.Default + 2
	root.backgroundContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.LeagueStats.divisionImageSize / 2,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = stripMarginTop,
		bottom = CoD.LeagueStats.divisionImageSize - stripMarginBottom
	} )
	root:addElement( root.backgroundContainer )
	root.background = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = RegisterMaterial( "menu_mp_map_frame" )
	} )
	root.backgroundContainer:addElement( root.background )
	root.divisionImageContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.LeagueStats.divisionImageSize,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.LeagueStats.divisionImageSize
	} )
	root:addElement( root.divisionImageContainer )
	root.divisionImage = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 1
	} )
	root.divisionImageContainer:addElement( root.divisionImage )
	root.spinner = LUI.UIImage.new()
	root.spinner:setAlpha( 0 )
	root.spinner:setLeftRight( true, true, 24, -24 )
	root.spinner:setTopBottom( true, true, 12, -36 )
	root.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	root.divisionImageContainer:addElement( root.spinner )
	root.placementCount = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Morris / 2 - 8,
		bottom = CoD.textSize.Morris / 2 - 8,
		alignment = LUI.Alignment.Center,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		font = CoD.fonts.Morris
	} )
	root.divisionImageContainer:addElement( root.placementCount )
	root.teamName = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 50,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = -CoD.textSize.Default,
		bottom = 0,
		alignment = LUI.Alignment.Right,
		font = CoD.fonts.Default,
		red = CoD.gray.r,
		green = CoD.gray.g,
		blue = CoD.gray.b
	} )
	root.backgroundContainer:addElement( root.teamName )
	root.name = LeagueTextElement( 0, "Condensed", true, true )
	root.backgroundContainer:addElement( root.name )
	root.rank = LeagueTextElement( 0, "Big", false, false )
	root.backgroundContainer:addElement( root.rank )
	root.bonusPool = LeagueTextElement( 0, "Default", false, true )
	root.backgroundContainer:addElement( root.bonusPool )
	root.bonusPool:setAlignment( LUI.Alignment.Right )
	root.seasonDate = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = 0,
		bottom = CoD.textSize.Default,
		alignment = LUI.Alignment.Right,
		font = CoD.fonts.Default,
		red = 0.4,
		green = 0.4,
		blue = 0.4
	} )
	root.backgroundContainer:addElement( root.seasonDate )
	root.seasonDateTimer = LUI.UITimer.new( 30000, "seasondate_tick", false )
	root:addElement( root.seasonDateTimer )
	root.update = CoD.LeagueStats.Update
	root:registerEventHandler( "seasondate_tick", CoD.LeagueStats.SeasonDateTick )
	root:registerEventHandler( "league_changed", CoD.LeagueStats.Update )
	return root
end

