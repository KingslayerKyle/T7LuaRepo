CoD.Playercard = {}
CoD.Playercard.Height = 50
CoD.Playercard.AspectRatio = 5.64
CoD.Playercard.new = function ( defaultAnimationState )
	local playercard = LUI.UIElement.new( defaultAnimationState )
	playercard.show = CoD.Playercard.show
	playercard.hide = CoD.Playercard.hide
	playercard.refresh = CoD.Playercard.refresh
	playercard:registerEventHandler( "destroy_me", CoD.Playercard.DestroyMe )
	return playercard
end

CoD.Playercard.generatePlayerInfo = function ( controller )
	local playerInfo = {}
	local playerRank = Engine.GetDStat( controller, "PlayerStatsList", "RANK", "StatValue" )
	local playerPrestige = Engine.GetDStat( controller, "PlayerStatsList", "PLEVEL", "StatValue" )
	playerInfo.name = Engine.GetSelfGamertag( controller )
	playerInfo.clanTag = Engine.GetClanName( controller )
	playerInfo.rank = Engine.GetDisplayLevelByXUID( controller, Engine.GetXUID( controller ) )
	playerInfo.codpoints = Engine.GetStatByName( controller, "CODPOINTS" )
	playerInfo.rankImage = Engine.TableLookup( controller, CoD.rankIconTable, 0, playerRank, playerPrestige + 1 )
	playerInfo.emblemBackground = Engine.EmblemPlayerBackgroundMaterial( controller, Engine.GetXUID( controller ), 0 )
	if tonumber( playerInfo.rank ) == nil then
		playerInfo.rank = "0"
	end
	return playerInfo
end

CoD.Playercard.show = function ( self, duration, playerInfo )
	if playerInfo == nil then
		playerInfo = CoD.Playercard.generatePlayerInfo( self.frame.slideContainer.currentSlide.m_ownerController )
	end
	if self.body ~= nil then
		self:refresh( playerInfo )
		return 
	end
	self.body = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alphaMultiplier = 0
	} )
	self.body:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	self:addElement( self.body )
	self.body.backgroundNone = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "emblem_bg_nocod" ),
		alpha = 1
	} )
	self.body:addElement( self.body.backgroundNone )
	local emblemBackground = playerInfo.emblemBackground
	self.body.background = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( emblemBackground ),
		alpha = 1
	} )
	self.body:addElement( self.body.background )
	local textSize = CoD.textSize.Default
	local gamerTagLeft = 50
	self.body.gamerTag = LUI.UIText.new( {
		left = gamerTagLeft,
		top = 0,
		right = 0,
		bottom = textSize,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	self.body.gamerTag:setText( playerInfo.name )
	self.body:addElement( self.body.gamerTag )
	self.body.rankItemContainer = LUI.UIContainer.new()
	self.body.rankItemContainer:registerAnimationState( "show_container", {
		alphaMultiplier = 1
	} )
	self.body.rankItemContainer:registerAnimationState( "hide_container", {
		alphaMultiplier = 0
	} )
	self.body:addElement( self.body.rankItemContainer )
	self.body.clanTagText = LUI.UIText.new( {
		left = gamerTagLeft,
		top = -textSize - 5,
		right = 0,
		bottom = -5,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	if playerInfo.clanTag ~= nil then
		self.body.clanTagText:setText( CoD.getClanTag( playerInfo.clanTag ) )
		self.body.rankItemContainer:addElement( self.body.clanTagText )
	end
	local pLvlTextLeft = gamerTagLeft + 80
	local pLvlTextWidth = 20
	self.body.playerLevelText = LUI.UIText.new( {
		left = pLvlTextLeft,
		top = -textSize - 5,
		right = pLvlTextWidth,
		bottom = -5,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	self.body.playerLevelText:setText( playerInfo.rank )
	self.body.rankItemContainer:addElement( self.body.playerLevelText )
	local iconLeft = pLvlTextLeft + pLvlTextWidth
	local iconWidth = 24
	local iconHeight = 24
	self.body.rankIcon = LUI.UIImage.new( {
		left = iconLeft,
		top = -iconHeight - 5,
		right = iconLeft + iconWidth,
		bottom = -5,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true,
		alpha = 1
	} )
	local cpTextWidth = 80
	self.body.cpText = LUI.UIText.new( {
		left = -cpTextWidth - 5,
		top = -textSize - 5,
		right = -5,
		bottom = -5,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	self.body.cpText:setText( Engine.Localize( "MENU_POINTS", playerInfo.codpoints ) )
	self.body.rankItemContainer:addElement( self.body.cpText )
	if tonumber( playerInfo.rank ) > 0 then
		if playerInfo.rankImage == nil then
			playerInfo.rankImage = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, playerInfo.prestige + 1 )
		end
		self.body.rankIcon:registerAnimationState( "change_rank_icon", {
			material = LUI.UIImage.GetCachedMaterial( "ui_normal" ),
			image = RegisterImage( playerInfo.rankImage )
		} )
		self.body.rankIcon:animateToState( "change_rank_icon" )
		self.body.rankItemContainer:addElement( self.body.rankIcon )
		self.body.rankItemContainer:animateToState( "show_container" )
	else
		self.body.rankItemContainer:animateToState( "hide_container" )
	end
	self.body:animateToState( "fade_in", duration, false, false )
end

CoD.Playercard.refresh = function ( self, playerInfo )
	if self.body == nil or playerInfo == nil then
		return 
	end
	self.body.background:registerAnimationState( "change_background", {
		material = RegisterMaterial( playerInfo.emblemBackground )
	} )
	self.body.background:animateToState( "change_background" )
	self.body.gamerTag:setText( playerInfo.name )
	if tonumber( playerInfo.rank ) > 0 then
		if playerInfo.clanTag ~= nil then
			self.body.clanTagText:setText( CoD.getClanTag( playerInfo.clanTag ) )
		end
		self.body.playerLevelText:setText( playerInfo.rank )
		if playerInfo.rankImage == nil then
			playerInfo.rankImage = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, playerInfo.prestige + 1 )
		end
		self.body.rankIcon:registerAnimationState( "change_rank_icon", {
			material = LUI.UIImage.GetCachedMaterial( "ui_normal" ),
			image = RegisterImage( playerInfo.rankImage )
		} )
		self.body.rankIcon:animateToState( "change_rank_icon" )
		self.body.cpText:setText( Engine.Localize( "MENU_POINTS", playerInfo.codpoints ) )
		self.body.rankItemContainer:animateToState( "show_container" )
	else
		self.body.rankItemContainer:animateToState( "hide_container" )
	end
end

CoD.Playercard.hide = function ( self, duration )
	if self.body == nil then
		return 
	elseif duration ~= nil then
		self.body:animateToState( "default", duration, false, false )
		self.body:addElement( LUI.UITimer.new( duration, "destroy_me", true, self ) )
	else
		self:processEvent( {
			name = "destroy_me"
		} )
	end
end

CoD.Playercard.DestroyMe = function ( self, event )
	if self.body == nil then
		return 
	else
		self.body:close()
		self.body = nil
	end
end

