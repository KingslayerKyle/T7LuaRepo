CoD.NamePlate = {}
CoD.NamePlate.Height = 60
CoD.NamePlate.Width = 240
CoD.NamePlate.PlayerEmblem_Size = 55
CoD.NamePlate.Alpha = 0.85
CoD.NamePlate.Spacing = 8
CoD.NamePlate.ClanTagWidth = 60
CoD.NamePlate.RankIconSize = 25
CoD.NamePlate.RankWidth = 20
CoD.NamePlate.New = function ( controller, namePlateData, calloutMessage )
	local namePlateContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenNotificationMultiplier )
	namePlateContainer:setAlpha( CoD.NamePlate.Alpha )
	namePlateContainer:setLeftRight( false, false, -CoD.NamePlate.Width / 2, CoD.NamePlate.Width / 2 )
	namePlateContainer:setTopBottom( false, true, -CoD.NamePlate.Height, 0 )
	if namePlateData ~= nil then
		local namePlateSelectedBg = LUI.UIStreamedImage.new()
		namePlateSelectedBg:setLeftRight( true, true, 0, 0 )
		namePlateSelectedBg:setTopBottom( true, true, 0, 0 )
		local f1_local0 = Engine.GetXUID( controller ) == namePlateData.xuid
		local useServer = 1
		if f1_local0 then
			useServer = 0
		end
		local materialName = Engine.EmblemPlayerBackgroundMaterial( controller, namePlateData.xuid, useServer )
		if materialName ~= nil then
			local bgMaterial = RegisterMaterial( materialName )
			namePlateSelectedBg:setImage( bgMaterial )
		end
		namePlateContainer:addElement( namePlateSelectedBg )
		namePlateContainer.namePlateSelectedBg = namePlateSelectedBg
		
		if calloutMessage ~= nil then
			local namePlateHeading = LUI.UIText.new()
			namePlateHeading:setLeftRight( true, true, 0, CoD.NamePlate.Width )
			namePlateHeading:setTopBottom( true, false, -CoD.textSize.ExtraSmall, 0 )
			namePlateHeading:setFont( CoD.fonts.ExtraSmall )
			namePlateContainer:addElement( namePlateHeading )
			namePlateHeading:setText( calloutMessage )
			namePlateHeading:setAlignment( LUI.Alignment.Left )
		end
		local namePlatePlayerName = LUI.UIText.new()
		namePlatePlayerName:setLeftRight( true, true, CoD.NamePlate.PlayerEmblem_Size, 0 )
		namePlatePlayerName:setTopBottom( true, false, CoD.NamePlate.Spacing, CoD.NamePlate.Spacing + CoD.textSize.ExtraSmall )
		namePlatePlayerName:setFont( CoD.fonts.ExtraSmall )
		namePlateContainer:addElement( namePlatePlayerName )
		namePlatePlayerName:setText( namePlateData.playerName )
		namePlatePlayerName:setAlignment( LUI.Alignment.Left )
		if namePlateData.clanTag ~= nil then
			local namePlateClanText = LUI.UIText.new()
			namePlateClanText:setLeftRight( true, false, CoD.NamePlate.PlayerEmblem_Size, CoD.NamePlate.PlayerEmblem_Size + CoD.NamePlate.ClanTagWidth )
			namePlateClanText:setTopBottom( false, true, -CoD.NamePlate.Spacing - CoD.textSize.ExtraSmall, -CoD.NamePlate.Spacing )
			namePlateClanText:setFont( CoD.fonts.ExtraSmall )
			namePlateContainer:addElement( namePlateClanText )
			namePlateClanText:setText( CoD.getClanTag( namePlateData.clanTag ) )
			namePlateClanText:setAlignment( LUI.Alignment.Left )
		end
		local namePlateEmblem = LUI.UIElement.new()
		namePlateEmblem:setLeftRight( true, false, 0, CoD.NamePlate.PlayerEmblem_Size )
		namePlateEmblem:setTopBottom( true, true, 0, 0 )
		namePlateEmblem:setupPlayerEmblemServer( namePlateData.playerClientNum )
		namePlateContainer:addElement( namePlateEmblem )
		local rankIconX = CoD.NamePlate.PlayerEmblem_Size + CoD.NamePlate.ClanTagWidth
		local namePlateRankIcon = LUI.UIImage.new()
		namePlateRankIcon:setLeftRight( true, false, rankIconX, rankIconX + CoD.NamePlate.RankIconSize )
		namePlateRankIcon:setTopBottom( false, true, -CoD.NamePlate.Spacing - CoD.NamePlate.RankIconSize + 3, -CoD.NamePlate.Spacing + 3 )
		namePlateRankIcon:hide()
		namePlateContainer:addElement( namePlateRankIcon )
		local rankX = rankIconX + CoD.NamePlate.RankIconSize + 5
		local namePlateRank = LUI.UIText.new()
		namePlateRank:setLeftRight( true, false, rankX, rankX + CoD.NamePlate.RankWidth )
		namePlateRank:setTopBottom( false, true, -CoD.NamePlate.Spacing - CoD.textSize.ExtraSmall, -CoD.NamePlate.Spacing )
		namePlateRank:setFont( CoD.fonts.ExtraSmall )
		namePlateRank:setAlignment( LUI.Alignment.Left )
		namePlateRank:hide()
		namePlateContainer:addElement( namePlateRank )
		if not Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if namePlateData.rankIcon ~= nil then
				namePlateRankIcon:setImage( RegisterMaterial( namePlateData.rankIcon ) )
				namePlateRankIcon:show()
			end
			if namePlateData.rank ~= nil and (not namePlateData.prestige or namePlateData.prestige ~= tonumber( CoD.MAX_PRESTIGE )) then
				namePlateRank:setText( namePlateData.rank )
				namePlateRank:show()
			end
		else
			if namePlateData.divisionIcon ~= nil then
				namePlateRankIcon:setImage( namePlateData.divisionIcon )
				namePlateRankIcon:show()
			end
			if namePlateData.subdivisionRank ~= nil then
				namePlateRank:setText( namePlateData.subdivisionRank )
				namePlateRank:show()
			end
		end
	end
	return namePlateContainer
end

