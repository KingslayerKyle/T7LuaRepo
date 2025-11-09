CoD.FriendDetails = {}
require( "ui.T6.PlayerIdentity" )
CoD.FriendDetails.SocialFontName = "Default"
CoD.FriendDetails.new = function ()
	if CoD.isZombie == true then
		return CoD.FriendDetails.New_Zombie()
	else
		return CoD.FriendDetails.New_MultiPlayer()
	end
end

CoD.FriendDetails.New_MultiPlayer = function ()
	local top = 110
	local sideOffset = 20
	local backgroundInset = 2
	local paneWidth = CoD.Menu.Width / 2 - sideOffset * 2
	local playerIdentityDefaultAnimState = {
		leftAnchor = false,
		rightAnchor = true,
		left = -paneWidth,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = top,
		bottom = 0
	}
	local details, detailsHeight = CoD.PlayerIdentity.New( playerIdentityDefaultAnimState, paneWidth, CoD.PlayerIdentity.Default, true )
	local socialTop = detailsHeight + 10
	local socialNameWidth = paneWidth
	local socialFont = CoD.fonts[CoD.FriendDetails.SocialFontName]
	local socialFontHeight = CoD.textSize[CoD.FriendDetails.SocialFontName]
	local socialHeight = socialFontHeight + 5
	details.socialNameContainer = LUI.UIElement.new()
	details.socialNameContainer:setLeftRight( false, false, -socialNameWidth / 2, socialNameWidth / 2 )
	details.socialNameContainer:setTopBottom( true, false, socialTop, socialTop + socialHeight )
	details.socialNameContainer:setUseStencil( true )
	details.socialNameContainer:setAlpha( 0 )
	details:addElement( details.socialNameContainer )
	local socialBg = LUI.UIImage.new()
	socialBg:setLeftRight( true, true, 1, -1 )
	socialBg:setTopBottom( true, true, 1, -1 )
	socialBg:setRGB( 0, 0, 0 )
	socialBg:setAlpha( 0.6 )
	details.socialNameContainer:addElement( socialBg )
	local backgroundInset = 4
	local socialBackgroundGrad = LUI.UIImage.new()
	socialBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
	socialBackgroundGrad:setTopBottom( true, false, backgroundInset, socialHeight * 0.6 )
	socialBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	socialBackgroundGrad:setAlpha( 0.1 )
	details.socialNameContainer:addElement( socialBackgroundGrad )
	details.socialNameContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	details.socialNameContainer:addElement( details.socialNameContainer.border )
	details.socialIcon = LUI.UIImage.new()
	details.socialIcon:setLeftRight( false, false, 0, 0 )
	details.socialIcon:setTopBottom( false, false, -socialFontHeight / 2, socialFontHeight / 2 )
	details.socialIcon:setImage( RegisterMaterial( "menu_lobby_icon_facebook" ) )
	details.socialNameContainer:addElement( details.socialIcon )
	details.socialName = LUI.UIText.new()
	details.socialName:setLeftRight( true, true, 0, 0 )
	details.socialName:setTopBottom( false, false, -socialFontHeight / 2, socialFontHeight / 2 )
	details.socialName:setAlignment( LUI.Alignment.Center )
	details.socialName:setFont( socialFont )
	details.socialName:setText( "" )
	details.socialNameContainer:addElement( details.socialName )
	local statusYOffset = 20
	details.clanname = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 175,
		right = 255,
		topAnchor = true,
		bottomAnchor = false,
		top = top + statusYOffset + 30,
		bottom = top + statusYOffset + 30 + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alpha = 1
	} )
	details:addElement( details.clanname )
	details.clanmotto = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 175,
		right = 255,
		topAnchor = true,
		bottomAnchor = false,
		top = top + statusYOffset + 60,
		bottom = top + statusYOffset + 60 + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alpha = 1
	} )
	details:addElement( details.clanmotto )
	details.clanmotd = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 175,
		right = 255,
		topAnchor = true,
		bottomAnchor = false,
		top = top + statusYOffset + 90,
		bottom = top + statusYOffset + 90 + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alpha = 1
	} )
	details:addElement( details.clanmotd )
	details.clanlevel = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 325,
		right = 405,
		topAnchor = true,
		bottomAnchor = false,
		top = top + statusYOffset + 30,
		bottom = top + statusYOffset + 30 + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alpha = 1
	} )
	details:addElement( details.clanlevel )
	details.clanxp = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 325,
		right = 405,
		topAnchor = true,
		bottomAnchor = false,
		top = top + statusYOffset + 60,
		bottom = top + statusYOffset + 60 + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alpha = 1
	} )
	details:addElement( details.clanxp )
	return details
end

CoD.FriendDetails.New_Zombie = function ()
	local details = LUI.UIElement.new()
	details:setLeftRight( false, false, 200, 200 )
	details:setTopBottom( true, false, 150, 200 )
	local emblemWidth = 200
	local emblemHeight = 200
	local emblemYOffset = 25
	local emblemContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -emblemWidth / 2,
		right = emblemWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = emblemYOffset,
		bottom = emblemYOffset + emblemHeight
	} )
	details:addElement( emblemContainer )
	details.emblem = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	emblemContainer:addElement( details.emblem )
	local backingRatio = 0.25
	local backingWidth = emblemWidth + 50
	local backingHeight = backingWidth * backingRatio
	local backingContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -backingWidth / 2,
		right = backingWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = emblemYOffset + emblemHeight,
		bottom = emblemYOffset + emblemHeight + backingHeight
	} )
	details:addElement( backingContainer )
	local backingMaterial = RegisterMaterial( "menu_zm_gamertag" )
	details.backing = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = backingMaterial,
		alpha = 1
	} )
	backingContainer:addElement( details.backing )
	local textSize = CoD.textSize.Default
	details.gamerTag = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -1,
		right = 1,
		topAnchor = false,
		bottomAnchor = false,
		top = -textSize / 2,
		bottom = textSize / 2,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	backingContainer:addElement( details.gamerTag )
	local statusYOffset = 20
	details.status = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -backingWidth / 2,
		right = backingWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = emblemYOffset + emblemHeight + backingHeight + statusYOffset,
		bottom = emblemYOffset + emblemHeight + backingHeight + statusYOffset + textSize,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	details:addElement( details.status )
	local iconWidth = emblemWidth / 4
	local iconHeight = iconWidth
	local rankIconContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = iconWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = iconHeight
	} )
	emblemContainer:addElement( rankIconContainer )
	details.rankIcon = LUI.UIImage.new( {
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
	rankIconContainer:addElement( details.rankIcon )
	return details
end

CoD.FriendDetails.ShowMPRank = function ( playerInfo )
	local f4_local0
	if playerInfo == nil or playerInfo.rank == nil or tonumber( playerInfo.rank ) <= 0 or Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) ~= false then
		f4_local0 = false
	else
		f4_local0 = true
	end
	return f4_local0
end

CoD.FriendDetails.hide = function ( details )
	details:setAlpha( 0 )
end

CoD.FriendDetails.refresh = function ( details, controller, xuid, playerIndex, playerListType )
	if CoD.isZombie == true then
		CoD.FriendDetails.Refresh_Zombie( details, controller, xuid, playerIndex, playerListType )
	else
		CoD.FriendDetails.Refresh_Multiplayer( details, controller, xuid, playerIndex, playerListType )
	end
end

CoD.FriendDetails.Refresh_Multiplayer = function ( details, controller, xuid, playerIndex, playerListType )
	local playerInfo = Engine.GetPlayerInfoByIndex( controller, playerIndex, playerListType )
	details:setAlpha( 1 )
	details:update( controller, true, xuid, playerInfo, nil )
	if playerInfo.socialName ~= nil and playerInfo.socialName ~= "" then
		details.socialName:setText( playerInfo.socialName )
		local socialFont = CoD.fonts[CoD.FriendDetails.SocialFontName]
		local socialFontHeight = CoD.textSize[CoD.FriendDetails.SocialFontName]
		local socialNameLeft, socialNameTop, socialNameRight, socialNameBottom = GetTextDimensions( playerInfo.socialName, socialFont, socialFontHeight )
		local socialIconOffset = 5
		local socialIconLeft = -(socialNameRight / 2) - socialIconOffset
		details.socialIcon:setLeftRight( false, false, socialIconLeft - socialFontHeight, socialIconLeft )
		details.socialNameContainer:setAlpha( 1 )
		details.socialIcon:setAlpha( 1 )
	else
		details.socialNameContainer:setAlpha( 0 )
	end
	if CoD.FriendsListPopup.Mode == CoD.playerListType.elite then
		details.socialName:setText( playerInfo.clanname )
		details.socialNameContainer:setAlpha( 1 )
		details.socialIcon:setAlpha( 0 )
	else
		details.clanname:setText( "" )
		details.clanmotto:setText( "" )
		details.clanmotd:setText( "" )
		details.clanlevel:setText( "" )
		details.clanxp:setText( "" )
	end
end

CoD.FriendDetails.Refresh_Zombie = function ( details, controller, xuid, playerIndex, playerListType )
	details.playerInfo = Engine.GetPlayerInfoByIndex( controller, playerIndex, playerListType )
	details:setAlpha( 1 )
	if CoD.FriendDetails.ShowMPRank( details.playerInfo ) == true then
		local emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, details.playerInfo.rank - 1, 3 )
		if details.playerInfo.daysPlayedInLast5Days == 5 then
			emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, details.playerInfo.rank - 1, 4 )
		end
		details.emblem:setImage( RegisterMaterial( emblemMaterialName ) )
		local daysMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, details.playerInfo.rank - 1, details.playerInfo.daysPlayedInLast5Days + 5 )
		details.rankIcon:setImage( RegisterMaterial( daysMaterialName ) )
	else
		details.emblem:setImage( RegisterMaterial( "menu_zm_rank_1" ) )
		details.rankIcon:setImage( RegisterMaterial( "hud_chalk_0" ) )
	end
	details.backingMaterialName = "menu_zm_gamertag"
	details.backing:setImage( RegisterMaterial( details.backingMaterialName ) )
	local clanTag = ""
	if details.playerInfo.clanTag ~= nil then
		clanTag = CoD.getClanTag( details.playerInfo.clanTag )
	end
	details.gamerTag:setText( clanTag .. details.playerInfo.name )
	local playerStatus = ""
	if details.playerInfo.status ~= nil then
		playerStatus = details.playerInfo.status
	end
	details.status:setText( playerStatus )
end

