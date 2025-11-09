CoD.LeaguePostGameLobbyInfo = {}
CoD.LeaguePostGameLobbyInfo.TitleTextSizeAndFont = "Default"
CoD.LeaguePostGameLobbyInfo.StatusTextSizeAndFont = "Default"
CoD.LeaguePostGameLobbyInfo.OutcomeTextSizeAndFont = "Condensed"
CoD.LeaguePostGameLobbyInfo.ProTipTextSizeAndFont = "Default"
CoD.LeaguePostGameLobbyInfo.new = function ( defaultAnimationState )
	local self = LUI.UIElement.new( defaultAnimationState )
	CoD.LeaguePostGameLobbyInfo.SetupElements( self )
	self.update = CoD.LeaguePostGameLobbyInfo.Update
	local textElem = LUI.UIImage.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, true, 0, 0 )
	return self
end

CoD.LeaguePostGameLobbyInfo.Update = function ( self, controller )
	if self.statusText and self.outcomeText and self.leagueIcon then
		CoD.GameLobby.UpdateStatusTextInternal( self.statusText )
		local leagueStats = Engine.GetLeagueStats( controller )
		local leagueInfo = Engine.GetLeague()
		local outcomeText = Engine.Localize( "MENU_FILESHARE_DEFEAT" )
		if leagueStats.matchOutcome == CoD.LeaguesData.LEAGUE_OUTCOME_WINNER then
			outcomeText = Engine.Localize( "MENU_FILESHARE_VICTORY" )
		end
		self.outcomeText:setText( outcomeText )
		self.leagueIcon:setImage( leagueInfo.icon )
		self.leagueIcon:show()
	end
end

local GetInfoTextElem = function ( textSizeAndFont, text, alignment )
	local textContainer = LUI.UIElement.new()
	textContainer:setLeftRight( true, true, 0, 0 )
	textContainer:setTopBottom( true, false, 0, CoD.textSize[textSizeAndFont] )
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, true, 0, 0 )
	textElem:setFont( CoD.fonts[textSizeAndFont] )
	textElem:setText( text )
	if alignment then
		textElem:setAlignment( LUI.Alignment[alignment] )
	end
	textContainer:addElement( textElem )
	textContainer.textElem = textElem
	
	return textContainer
end

local GetInfoBgElem = function ( red, green, blue, alpha )
	local bgElem = LUI.UIImage.new()
	bgElem:setLeftRight( true, true, 0, 0 )
	bgElem:setTopBottom( true, true, 0, 0 )
	bgElem:setRGB( red, green, blue )
	bgElem:setAlpha( alpha )
	return bgElem
end

CoD.LeaguePostGameLobbyInfo.SetupElements = function ( self )
	local vert = LUI.UIElement.new()
	vert:setLeftRight( true, false, 0, CoD.MapInfoImage.MapImageWidth )
	vert:setTopBottom( true, true, 0, 0 )
	local leftMargin = 5
	local bottomTextContainer = LUI.UIElement.new()
	local bottomTextContainerHeight = -CoD.MapInfoImage.MapImageBottom
	bottomTextContainer:setLeftRight( true, true, 10, 0 )
	bottomTextContainer:setTopBottom( false, true, -bottomTextContainerHeight, 0 )
	local bottomTextContainerBg = LUI.UIImage.new()
	bottomTextContainerBg:setLeftRight( true, true, 0, 0 )
	bottomTextContainerBg:setTopBottom( true, true, 0, 0 )
	bottomTextContainerBg:setImage( RegisterMaterial( "menu_mp_map_frame" ) )
	local bottomTextVerticalList = LUI.UIVerticalList.new()
	bottomTextVerticalList:setLeftRight( true, true, 0, 0 )
	bottomTextVerticalList:setTopBottom( true, true, 0, 0 )
	local titleText = GetInfoTextElem( CoD.LeaguePostGameLobbyInfo.TitleTextSizeAndFont, Engine.ToUpper( nil, Engine.Localize( "MENU_LAST_GAME_RESULT" ) ), "Left" )
	bottomTextVerticalList:addElement( titleText )
	local outcomeText = GetInfoTextElem( CoD.LeaguePostGameLobbyInfo.OutcomeTextSizeAndFont, "", "Left" )
	bottomTextVerticalList:addElement( outcomeText )
	local mapImageLeft = 6
	local leagueIconContainer = LUI.UIElement.new()
	leagueIconContainer:setLeftRight( true, false, mapImageLeft, mapImageLeft + CoD.MapInfoImage.MapImageWidth )
	leagueIconContainer:setTopBottom( true, true, 0, -bottomTextContainerHeight )
	local leagueIcon = LUI.UIImage.new()
	leagueIcon:setLeftRight( true, true, 0, 0 )
	leagueIcon:setTopBottom( true, true, 0, 0 )
	leagueIconContainer:addElement( leagueIcon )
	local statusContainer = LUI.UIElement.new()
	statusContainer:setLeftRight( true, true, leftMargin, 0 )
	statusContainer:setTopBottom( true, false, -CoD.textSize[CoD.LeaguePostGameLobbyInfo.StatusTextSizeAndFont], 0 )
	local statusText = GetInfoTextElem( CoD.LeaguePostGameLobbyInfo.StatusTextSizeAndFont, "", "Left" )
	statusContainer:addElement( statusText )
	bottomTextContainer:addElement( bottomTextVerticalList )
	vert:addElement( statusContainer )
	vert:addElement( bottomTextContainerBg )
	vert:addElement( bottomTextContainer )
	vert:addElement( leagueIconContainer )
	self.leagueIcon = leagueIcon
	self.statusText = statusText.textElem
	self.outcomeText = outcomeText.textElem
	self.leagueIcon:hide()
	self:addElement( vert )
end

