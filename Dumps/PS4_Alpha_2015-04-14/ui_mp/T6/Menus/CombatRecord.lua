require( "ui.T6.MFTabManager" )
require( "ui.T6.Line" )

CoD.CombatRecord = {}
CoD.CombatRecord.AddContainer = function ( defaultAnimationState, container, setStencil )
	local newContainer = LUI.UIElement.new( defaultAnimationState )
	if setstencil ~= nil and setstencil == true then
		newContainer:setUseStencil( true )
	end
	container:addElement( newContainer )
	return newContainer
end

CoD.CombatRecord.SetText = function ( state, container, text )
	local textElement = LUI.UIText.new( state )
	container:addElement( textElement )
	textElement:setText( text )
	return textElement
end

CoD.CombatRecord.ShowXPBar = function ( controller, element )
	if CoD.CanRankUp( controller ) == true then
		local rankTableColMinXP = 2
		local rankTableColMaxXP = 7
		local rankTableColXPToNext = 3
		local playerRank = Engine.GetDStat( controller, "PlayerStatsList", "RANK", "StatValue" )
		local playerPrestige = Engine.GetDStat( controller, "PlayerStatsList", "PLEVEL", "StatValue" )
		local playerRankXP = Engine.GetDStat( controller, "PlayerStatsList", "RANKXP", "StatValue" )
		local minXPForCurrRank = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank, rankTableColMinXP )
		local maxXPForCurrRank = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank, rankTableColMaxXP )
		local xpToNextRank = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank, rankTableColXPToNext )
		local xpNeededToLevelUp = Engine.Localize( "MPUI_AAR_XP_NEEDED_CAPS", maxXPForCurrRank - playerRankXP )
		local nextLevel = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank + 1, 14 )
		local barColor = {
			r = 0.42,
			g = 0.9,
			b = 0.46,
			a = 0.5
		}
		local xpBarBGWidth = 660
		local xpBarBGHeight = 25
		local xpBarWidth = (playerRankXP - minXPForCurrRank) / xpToNextRank * xpBarBGWidth
		local xpBarLeftOffset = 20
		local xpBarDefaultAnimationState = {
			left = 0,
			top = -CoD.CoD9Button.Height * 4,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = false,
			bottomAnchor = true,
			rightAnchor = true
		}
		element.XPBarContainer = CoD.CombatRecord.AddContainer( xpBarDefaultAnimationState, element )
		local xpBarBG = LUI.UIImage.new( {
			left = -xpBarBGWidth / 2 + xpBarLeftOffset,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = xpBarBGWidth / 2 + xpBarLeftOffset,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "white" ),
			alpha = 0.1,
			red = 0,
			green = 0,
			blue = 0
		} )
		element.XPBarContainer:addElement( xpBarBG )
		local xpBarShadow = LUI.UIImage.new( {
			left = -xpBarBGWidth / 2 + xpBarLeftOffset,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = xpBarBGWidth / 2 + xpBarLeftOffset,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "menu_mp_bar_shadow" ),
			alpha = 0.1,
			red = 1,
			green = 1,
			blue = 1
		} )
		element.XPBarContainer:addElement( xpBarShadow )
		element.xpBar = LUI.UIImage.new( {
			left = -xpBarBGWidth / 2 + xpBarLeftOffset,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = -xpBarBGWidth / 2 + xpBarLeftOffset,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "white" ),
			alpha = 0.2,
			red = 0,
			green = 0,
			blue = 0
		} )
		element.xpBar:registerAnimationState( "animate_xp_bar", {
			left = -xpBarBGWidth / 2 + xpBarLeftOffset,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = -xpBarBGWidth / 2 + xpBarWidth + xpBarLeftOffset,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "white" ),
			alpha = 0.2,
			red = 0,
			green = 0,
			blue = 0
		} )
		element.XPBarContainer:addElement( element.xpBar )
		local nextLevelDefaultAnimationState = {
			left = -xpBarBGWidth / 2 + xpBarLeftOffset - 100,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = -xpBarBGWidth / 2 + 15 + xpBarLeftOffset,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1
		}
		CoD.CombatRecord.SetText( nextLevelDefaultAnimationState, element.XPBarContainer, Engine.ToUpper( Engine.Localize( "MENU_NEXT_LEVEL" ) ) )
		local levelUpDefaultAnimationState = {
			left = -xpBarBGWidth / 2 + xpBarLeftOffset + 5,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = 0,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1,
			alignment = LUI.Alignment.Left
		}
		CoD.CombatRecord.SetText( levelUpDefaultAnimationState, element.XPBarContainer, xpNeededToLevelUp )
		local nextLevelText = ""
		if CoD.PrestigeNext( controller ) == true then
			nextLevelText = CoD.PrestigeNextLevelText( controller )
		else
			nextLevelText = nextLevel
		end
		local nextLevelDefaultAnimationState = {
			left = xpBarBGWidth / 2 + 20 + xpBarLeftOffset,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = xpBarBGWidth / 2 + xpBarLeftOffset,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 1
		}
		CoD.CombatRecord.SetText( nextLevelDefaultAnimationState, element.XPBarContainer, nextLevelText )
		local nextLevelIconWidth = 20
		local nextLevelIconHeight = 20
		local nextLevelMaterialName = nil
		if CoD.PrestigeNext( controller ) == true then
			nextLevelMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, playerPrestige + 2 )
		else
			nextLevelMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, playerRank + 1, playerPrestige + 1 )
		end
		local nextLevelIcon = LUI.UIImage.new( {
			left = xpBarBGWidth / 2 + xpBarLeftOffset + 20,
			top = -nextLevelIconHeight / 2,
			bottom = nextLevelIconHeight / 2,
			right = xpBarBGWidth / 2 + xpBarLeftOffset + 20 + nextLevelIconWidth,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( nextLevelMaterialName ),
			alpha = 1
		} )
		element.XPBarContainer:addElement( nextLevelIcon )
	end
end

CoD.CombatRecord.DisplayStatsRow = function ( deafaultAnimationState, element, rowNumber, label, statValue )
	if rowNumber % 2 == 1 then
		deafaultAnimationState.alpha = 0.1
		deafaultAnimationState.red = 0
		deafaultAnimationState.green = 0
		deafaultAnimationState.blue = 0
		local rowBg = LUI.UIImage.new( deafaultAnimationState )
		element:addElement( rowBg )
	end
	deafaultAnimationState.alpha = 1
	deafaultAnimationState.red = 1
	deafaultAnimationState.green = 1
	deafaultAnimationState.blue = 1
	deafaultAnimationState.left = deafaultAnimationState.left + 10
	deafaultAnimationState.top = deafaultAnimationState.top + 2
	deafaultAnimationState.bottom = deafaultAnimationState.bottom - 2
	deafaultAnimationState.alignment = LUI.Alignment.Left
	CoD.CombatRecord.SetText( deafaultAnimationState, element, label )
	deafaultAnimationState.right = deafaultAnimationState.right - 10
	deafaultAnimationState.left = deafaultAnimationState.left - 10
	deafaultAnimationState.alignment = LUI.Alignment.Right
	CoD.CombatRecord.SetText( deafaultAnimationState, element, statValue )
end

CoD.CombatRecord.PrepareSummaryStats = function ( element, controller )
	local CRWeapons_SummaryStats = LUI.UIElement.new( {
		left = -380,
		top = 100,
		right = -15,
		bottom = -290,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	element:addElement( CRWeapons_SummaryStats )
	local CRWeapon_SummaryStatsBg = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 0.1,
		red = 0,
		green = 0,
		blue = 0
	} )
	CRWeapons_SummaryStats:addElement( CRWeapon_SummaryStatsBg )
	local kills = Engine.GetDStat( controller, "PlayerStatsList", "KILLS", "StatValue" )
	local killDefaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 30,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( killDefaultAnimationState, CRWeapons_SummaryStats, 1, Engine.Localize( "MPUI_KILLS_CAPS" ), kills )
	local deaths = Engine.GetDStat( controller, "PlayerStatsList", "DEATHS", "StatValue" )
	local deathsDefaultAnimationState = {
		left = 0,
		top = 30,
		right = 0,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( deathsDefaultAnimationState, CRWeapons_SummaryStats, 2, Engine.Localize( "MPUI_DEATHS_CAPS" ), deaths )
	local kdratio = string.format( "%.2f", Engine.GetDStat( controller, "PlayerStatsList", "KDRATIO", "StatValue" ) / 1000 )
	local kdratioDefaultAnimationState = {
		left = 0,
		top = 60,
		right = 0,
		bottom = 90,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( kdratioDefaultAnimationState, CRWeapons_SummaryStats, 3, Engine.Localize( "MPUI_KILL_DEATH_RATIO_CAPS" ), kdratio )
	local assists = Engine.GetDStat( controller, "PlayerStatsList", "ASSISTS", "StatValue" )
	local assistsDefaultAnimationState = {
		left = 0,
		top = 90,
		right = 0,
		bottom = 120,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( assistsDefaultAnimationState, CRWeapons_SummaryStats, 4, Engine.Localize( "MPUI_ASSISTS_CAPS" ), assists )
	local hits = Engine.GetDStat( controller, "PlayerStatsList", "HITS", "StatValue" )
	local shots = Engine.GetDStat( controller, "PlayerStatsList", "TOTAL_SHOTS", "StatValue" )
	local accuracy = string.format( "%.2f", hits * 100 / shots ) .. "%"
	local accuracyDefaultAnimationState = {
		left = 0,
		top = 120,
		right = 0,
		bottom = 150,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( accuracyDefaultAnimationState, CRWeapons_SummaryStats, 5, Engine.Localize( "MPUI_ACCURACY_CAPS" ), accuracy )
	local headshots = Engine.GetDStat( controller, "PlayerStatsList", "HEADSHOTS", "StatValue" )
	local headshotsDefaultAnimationState = {
		left = 0,
		top = 150,
		right = 0,
		bottom = 180,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( headshotsDefaultAnimationState, CRWeapons_SummaryStats, 6, Engine.Localize( "MPUI_HEADSHOTS_CAPS" ), headshots )
	local bestKillStreak = Engine.GetDStat( controller, "HighestStats", "KILL_STREAK" )
	local bestKillStreakDefaultAnimationState = {
		left = 0,
		top = 180,
		right = 0,
		bottom = 210,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( bestKillStreakDefaultAnimationState, CRWeapons_SummaryStats, 7, Engine.Localize( "MPUI_BEST_KILLSTREAK_CAPS" ), bestKillStreak )
end

CoD.CombatRecord.Weapons_PrepareTable = function ( controller, maxgraphPoints )
	local graphDataLabelTable = {}
	local graphDataTable = {}
	local maxValue = 0
	local f6_local0 = CoD.GetPlayerStats( controller )
	local GameHistoryStats = f6_local0.gameHistory
	local GameHistoryByMode = GameHistoryStats.publicmatch
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		GameHistoryByMode = GameHistoryStats.leaguematch
	end
	local currentHistoryIndex = GameHistoryByMode.currentMatchHistoryIndex:get()
	local count = #GameHistoryByMode.matchHistory
	for i = 1, 5, 1 do
		local f6_local3 = i
		if GameHistoryByMode.matchHistory[currentHistoryIndex].startingTime:get() == 0 then
			break
		end
		local kills = GameHistoryByMode.matchHistory[currentHistoryIndex].KILLS:get()
		local deaths = GameHistoryByMode.matchHistory[currentHistoryIndex].DEATHS:get()
		local kdratio = kills / math.max( deaths, 1 )
		table.insert( kdRatioTable, kdratio )
		if kdratio > maxKDRatio then
			maxKDRatio = kdratio
		end
		currentHistoryIndex = currentHistoryIndex - 1
		if currentHistoryIndex < 0 then
			currentHistoryIndex = count - 1
		end
	end
	return graphDataLabelTable, graphDataTable, maxValue
end

CoD.CombatRecord.SummaryDisplayKDBox = function ( element, controller )
	local KDBoxY = 390
	local KDBoxWidth = 730
	local KDBoxHeight = 160
	local kdContainerDefaultAnimationState = {
		left = 50,
		top = KDBoxY,
		right = KDBoxWidth,
		bottom = KDBoxY + KDBoxHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	local KDContainer = CoD.CombatRecord.AddContainer( kdContainerDefaultAnimationState, element )
	local lineGraphDefaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}
	local KDLineGraphContainer = CoD.CombatRecord.AddContainer( lineGraphDefaultAnimationState, KDContainer, true )
	local KDBoxBg = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = KDBoxWidth,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		alpha = 0.1,
		red = 0,
		green = 0,
		blue = 0
	} )
	KDLineGraphContainer:addElement( KDBoxBg )
	CoD.CombatRecord.DisplayLineGraph( controller, KDLineGraphContainer, KDBoxWidth, KDBoxHeight, CoD.CombatRecord.Weapons_PrepareTable, 5 )
	local previousGamesKDDefaultAnimationState = {
		left = 0,
		top = -KDBoxHeight / 2 - CoD.textSize.Default,
		right = KDBoxWidth,
		bottom = -KDBoxHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	}
	CoD.CombatRecord.SetText( previousGamesKDDefaultAnimationState, KDContainer, Engine.Localize( "MPUI_KD_PREVIOUSGAMES" ) )
end

CoD.CombatRecord.GetLossesStat = function ( stats )
	local losses = tonumber( stats:get() )
	local maxLosses = Engine.DvarInt( nil, "maxLossesValue" )
	if Engine.DvarBool( nil, "fixNegativeLosses" ) and maxLosses > 0 and (losses < 0 or maxLosses < losses) then
		losses = 0
		stats:set( losses )
	end
	return losses
end

CoD.CombatRecord.PrepareSummaryFavouriteWeapon = function ( element, controller )
	local CRWeapons_SummaryFavouriteWeapon = LUI.UIElement.new( {
		left = 15,
		top = 100,
		right = 380,
		bottom = -290,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	element:addElement( CRWeapons_SummaryFavouriteWeapon )
	local CRWeapons_SummaryFavouriteWeaponBg = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 0.1,
		red = 0,
		green = 0,
		blue = 0
	} )
	CRWeapons_SummaryFavouriteWeapon:addElement( CRWeapons_SummaryFavouriteWeaponBg )
	local maxtimeUsed = 0
	local itemIndex = 0
	for i = 0, 63, 1 do
		local timeUsed = Engine.GetDStat( controller, "ItemStats", i, "stats", "timeUsed", "statValue" )
		if maxtimeUsed < timeUsed then
			maxtimeUsed = timeUsed
			itemIndex = i
		end
	end
	if itemIndex > 0 then
		local favouriteWeaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( itemIndex ) ) )
		local favouriteWeaponMaterialName = Engine.GetItemImage( itemIndex )
		local favouriteWeaponMaterial = RegisterMaterial( favouriteWeaponMaterialName )
		local favoriteWeaponDefaultAnimationState = {
			left = -1,
			top = 0,
			right = 1,
			bottom = 25,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false
		}
		CoD.CombatRecord.SetText( favoriteWeaponDefaultAnimationState, CRWeapons_SummaryFavouriteWeapon, Engine.Localize( "MPUI_FAVORITE_WEAPON_CAPS" ) )
		local CRWeapons_SummaryFavouriteWeaponImage = LUI.UIImage.new( {
			left = -45,
			top = 30,
			right = 45,
			bottom = 120,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			material = favouriteWeaponMaterial
		} )
		CRWeapons_SummaryFavouriteWeapon:addElement( CRWeapons_SummaryFavouriteWeaponImage )
		local favoriteWeaponNameDefaultAnimationState = {
			left = -1,
			top = 122,
			right = 1,
			bottom = 147,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false
		}
		CoD.CombatRecord.SetText( favoriteWeaponNameDefaultAnimationState, CRWeapons_SummaryFavouriteWeapon, favouriteWeaponName )
		local kills = Engine.GetDStat( controller, "ItemStats", itemIndex, "stats", "kills", "statValue" )
		local killDefaultAnimationState = {
			left = 0,
			top = 150,
			right = 0,
			bottom = 180,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false
		}
		CoD.CombatRecord.DisplayStatsRow( killDefaultAnimationState, CRWeapons_SummaryFavouriteWeapon, 1, Engine.Localize( "MPUI_KILLS_CAPS" ), kills )
		local hits = Engine.GetDStat( controller, "ItemStats", itemIndex, "stats", "hits", "statValue" )
		local shots = Engine.GetDStat( controller, "ItemStats", itemIndex, "stats", "shots", "statValue" )
		local accuracy = string.format( "%.2f", hits * 100 / shots ) .. "%"
		local accuracyDefaultAnimationState = {
			left = 0,
			top = 180,
			right = 0,
			bottom = 210,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false
		}
		CoD.CombatRecord.DisplayStatsRow( accuracyDefaultAnimationState, CRWeapons_SummaryFavouriteWeapon, 2, Engine.Localize( "MPUI_ACCURACY_CAPS" ), accuracy )
	end
end

CoD.CombatRecord.PrepareCareerTab = function ( self, controller )
	local CRCareer_Summary = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	CoD.CombatRecord.ShowXPBar( controller, CRCareer_Summary )
	local summaryTextDefaultAnimationState = {
		left = -1,
		top = 50,
		right = 1,
		bottom = 75,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	}
	CoD.CombatRecord.SetText( summaryTextDefaultAnimationState, CRCareer_Summary, Engine.Localize( "MPUI_SUMMARY_CAPS" ) )
	local CRCareer_SummaryStats = LUI.UIElement.new( {
		left = 200,
		top = 100,
		right = -200,
		bottom = -110,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	CRCareer_Summary:addElement( CRCareer_SummaryStats )
	local CRCareer_SummaryStatsBg = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 0.1,
		red = 0,
		green = 0,
		blue = 0
	} )
	CRCareer_SummaryStats:addElement( CRCareer_SummaryStatsBg )
	local playerRank = Engine.GetDStat( controller, "PlayerStatsList", "RANK", "StatValue" )
	local playerPrestige = Engine.GetDStat( controller, "PlayerStatsList", "PLEVEL", "StatValue" )
	local currentLevelMaterialName = nil
	if CoD.PrestigeNext( controller ) == true then
		currentLevelMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, playerPrestige + 2 )
	else
		currentLevelMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, playerRank + 1, playerPrestige + 1 )
	end
	local currentLevelIcon = LUI.UIImage.new( {
		left = -100,
		top = 20,
		bottom = 220,
		right = 100,
		leftAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		material = RegisterMaterial( currentLevelMaterialName ),
		alpha = 1
	} )
	CRCareer_SummaryStats:addElement( currentLevelIcon )
	local timePlayed = Engine.SecondsAsTime( Engine.GetDStat( controller, "PlayerStatsList", "TIME_PLAYED_TOTAL", "StatValue" ) )
	local timePlayedDefaultAnimationState = {
		left = 0,
		top = 240,
		right = 0,
		bottom = 270,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( timePlayedDefaultAnimationState, CRCareer_SummaryStats, 1, Engine.Localize( "MPUI_TIME_PLAYED_CAPS" ), timePlayed )
	local wins = Engine.GetDStat( controller, "PlayerStatsList", "WINS", "StatValue" )
	local winsDefaultAnimationState = {
		left = 0,
		top = 270,
		right = 0,
		bottom = 300,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( winsDefaultAnimationState, CRCareer_SummaryStats, 2, Engine.Localize( "MPUI_TOTAL_WINS_CAPS" ), wins )
	local f10_local0 = CoD.GetPlayerStats( controller )
	local lossesStat = f10_local0.PlayerStatsList.LOSSES.StatValue
	local losses = CoD.CombatRecord.GetLossesStat( lossesStat )
	local lossesDefaultAnimationState = {
		left = 0,
		top = 300,
		right = 0,
		bottom = 330,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( lossesDefaultAnimationState, CRCareer_SummaryStats, 3, Engine.Localize( "MPUI_TOTAL_LOSSES_CAPS" ), losses )
	local ratio = string.format( "%.2f", Engine.GetDStat( controller, "PlayerStatsList", "WLRATIO", "StatValue" ) / 1000 )
	local ratioDefaultAnimationState = {
		left = 0,
		top = 330,
		right = 0,
		bottom = 360,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( ratioDefaultAnimationState, CRCareer_SummaryStats, 4, Engine.Localize( "MPUI_RATIO_CAPS" ), ratio )
	local bestStreak = Engine.GetDStat( controller, "HighestStats", "WIN_STREAK" )
	local bestStreakDefaultAnimationState = {
		left = 0,
		top = 360,
		right = 0,
		bottom = 390,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	CoD.CombatRecord.DisplayStatsRow( bestStreakDefaultAnimationState, CRCareer_SummaryStats, 5, Engine.Localize( "MPUI_BEST_STREAK_CAPS" ), bestStreak )
	CRCareer_Summary.xpBar:animateToState( "animate_xp_bar", 1000, false, false )
	return CRCareer_Summary
end

CoD.CombatRecord.PrepareWeaponsTab = function ( self, controller )
	local CRWeapons_Summary = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	local summaryTextDefaultAnimationState = {
		left = -1,
		top = 50,
		right = 1,
		bottom = 75,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	}
	CoD.CombatRecord.SetText( summaryTextDefaultAnimationState, CRWeapons_Summary, Engine.Localize( "MPUI_COMBAT_SUMMARY_CAPS" ) )
	CoD.CombatRecord.PrepareSummaryStats( CRWeapons_Summary, controller )
	CoD.CombatRecord.PrepareSummaryFavouriteWeapon( CRWeapons_Summary, controller )
	CoD.CombatRecord.SummaryDisplayKDBox( CRWeapons_Summary, controller )
	return CRWeapons_Summary
end

CoD.CombatRecord.Matches_PrepareTable = function ( controller, maxgraphPoints, index )
	local graphDataLabelTable = {}
	local graphDataTable = {}
	local maxValue = 0
	for i = 1, maxgraphPoints, 1 do
		if Engine.GetDStat( controller, "PlayerStatsByGameType", CoD.CombatRecord.GameTypeTable[index].type, "prevScores", i - 1, "valid" ) == 0 then
			break
		end
		local score = Engine.GetDStat( controller, "PlayerStatsByGameType", CoD.CombatRecord.GameTypeTable[index].type, "prevScores", i - 1, "score" )
		table.insert( graphDataTable, score )
		table.insert( graphDataLabelTable, score )
		if maxValue < score then
			maxValue = score
		end
	end
	return graphDataLabelTable, graphDataTable, maxValue
end

CoD.CombatRecord.DisplayLineGraph = function ( controller, container, width, height, fnPrepareGraphPoints, maxgraphPoints, index )
	local graphDataTable = {}
	local graphDataLabelTable = {}
	local maxValue = 0
	local YOffset = 22
	local XOffsetLeft = 15
	local XOffsetRight = 32
	if index ~= nil then
		graphDataLabelTable, graphDataTable, maxValue = fnPrepareGraphPoints( controller, maxgraphPoints, index )
	else
		graphDataLabelTable, graphDataTable, maxValue = fnPrepareGraphPoints( controller, maxgraphPoints )
	end
	local size = #graphDataTable
	local reverseGraphDataTable = {}
	local reverseGraphDataLabelTable = {}
	for i, v in ipairs( graphDataTable ) do
		reverseGraphDataTable[size - i + 1] = v
	end
	for i, v in ipairs( graphDataLabelTable ) do
		reverseGraphDataLabelTable[size - i + 1] = v
	end
	local centerLineColor = {
		1,
		1,
		1,
		0.2
	}
	local centerLine = CoD.Line.new( {
		0,
		height / 2
	}, {
		width,
		height / 2
	}, 1, centerLineColor )
	container:addElement( centerLine )
	if #reverseGraphDataTable > 1 then
		local pointInterval = (width - XOffsetLeft - XOffsetRight) / maxgraphPoints
		local maxHeight = height / 2 - YOffset
		local p1 = {}
		local p2 = {}
		local color = {
			0.09,
			0.67,
			0.84,
			1
		}
		local dotWidth = 5
		local dotGreenColor = {
			0,
			1,
			0,
			1
		}
		local dotRedColor = {
			1,
			0,
			0,
			1
		}
		p1[1] = XOffsetLeft
		if reverseGraphDataTable[1] > 1 then
			p1[2] = maxHeight - reverseGraphDataTable[1] / maxValue * maxHeight + YOffset
		else
			p1[2] = height - YOffset - reverseGraphDataTable[1] * maxHeight
		end
		for j = 1, #reverseGraphDataTable - 1, 1 do
			p2[1] = pointInterval * j + XOffsetLeft
			if reverseGraphDataTable[j + 1] > 1 then
				p2[2] = maxHeight - reverseGraphDataTable[j + 1] / maxValue * maxHeight + YOffset
			else
				p2[2] = height - YOffset - reverseGraphDataTable[j + 1] * maxHeight
			end
			local line = CoD.Line.new( p1, p2, 1, color )
			container:addElement( line )
			if p1[2] < height / 2 then
				local dotsBg = LUI.UIImage.new( {
					left = p1[1] - dotWidth / 2,
					top = p1[2] - dotWidth / 2,
					right = p1[1] + dotWidth / 2,
					bottom = p1[2] + dotWidth / 2,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = false,
					bottomAnchor = false,
					red = dotGreenColor[1],
					green = dotGreenColor[2],
					blue = dotGreenColor[3],
					alpha = dotGreenColor[4]
				} )
				container:addElement( dotsBg )
			else
				local dotsBg = LUI.UIImage.new( {
					left = p1[1] - dotWidth / 2,
					top = p1[2] - dotWidth / 2,
					right = p1[1] + dotWidth / 2,
					bottom = p1[2] + dotWidth / 2,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = false,
					bottomAnchor = false,
					red = dotRedColor[1],
					green = dotRedColor[2],
					blue = dotRedColor[3],
					alpha = dotRedColor[4]
				} )
				container:addElement( dotsBg )
			end
			local labelTextTop = p1[2] + dotWidth / 2
			local labelTextBottom = p1[2] + YOffset
			if p1[2] < p2[2] then
				labelTextTop = p1[2] - YOffset
				labelTextBottom = p1[2] - dotWidth / 2
			end
			local labelTextDefaultAnimationState = {
				left = p1[1] - 10,
				top = labelTextTop,
				right = p1[1] + 10,
				bottom = labelTextBottom,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false,
				font = CoD.fonts.Default,
				alignment = LUI.Alignment.Left
			}
			CoD.CombatRecord.SetText( labelTextDefaultAnimationState, container, reverseGraphDataLabelTable[j] )
			p1[1] = p2[1]
			p1[2] = p2[2]
		end
		local lastScoreDefaultAnimationState = {
			left = p2[1],
			top = p2[2] - YOffset / 2 + dotWidth / 2,
			right = p2[1] + XOffsetRight - 4,
			bottom = p2[2] + YOffset / 2 - dotWidth / 2,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false
		}
		local lastScoreContainer = CoD.CombatRecord.AddContainer( lastScoreDefaultAnimationState, container )
		local lastScoreBg = LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true,
			red = color[1],
			green = color[2],
			blue = color[3],
			alpha = color[4]
		} )
		lastScoreContainer:addElement( lastScoreBg )
		local reverseDataLabelTextDefaultAnimationState = {
			left = -1,
			top = 0,
			right = 1,
			bottom = 0,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true,
			font = CoD.fonts.Condensed
		}
		CoD.CombatRecord.SetText( reverseDataLabelTextDefaultAnimationState, lastScoreContainer, reverseGraphDataLabelTable[#reverseGraphDataLabelTable] )
	else
		local notEnoughDataDefaultAnimationState = {
			left = 0,
			top = height,
			right = width,
			bottom = height + 20,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			font = CoD.fonts.Default,
			alignment = LUI.Alignment.Center
		}
		CoD.CombatRecord.SetText( notEnoughDataDefaultAnimationState, container, Engine.Localize( "MPUI_NOT_ENOUGH_DATA" ) )
	end
end

CoD.CombatRecord.DisplayGameTypePerformanceGraph = function ( element, controller, index )
	local ScoreBoxY = 30
	local ScoreBoxWidth = 380
	local ScoreBoxHeight = 250
	local scoreDefaultAnimationState = {
		left = 0,
		top = ScoreBoxY,
		right = ScoreBoxWidth,
		bottom = ScoreBoxY + ScoreBoxHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	}
	element.ScoreContainer = CoD.CombatRecord.AddContainer( scoreDefaultAnimationState, element )
	local scoreLineGraphDefaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}
	element.ScoreLineGraphContainer = CoD.CombatRecord.AddContainer( scoreLineGraphDefaultAnimationState, element.ScoreContainer, true )
	element.ScoreBoxBg = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = ScoreBoxWidth,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		alpha = 0.1,
		red = 0,
		green = 0,
		blue = 0
	} )
	element.ScoreLineGraphContainer:addElement( element.ScoreBoxBg )
	CoD.CombatRecord.DisplayLineGraph( controller, element.ScoreLineGraphContainer, ScoreBoxWidth, ScoreBoxHeight, CoD.CombatRecord.Matches_PrepareTable, 10, index )
end

CoD.CombatRecord.PerformanceRowGainFocus = function ( self, event )
	local headerText = Engine.Localize( "MPUI_CR_MATCH_PERFORMANCE_HISTOGRAM_TITLE", CoD.CombatRecord.GameTypeTable[self.index].localizedString )
	local headerTextDefaultAnimationState = {
		left = -1,
		top = 5,
		right = 1,
		bottom = 25,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	}
	self.informationPane.header = CoD.CombatRecord.SetText( headerTextDefaultAnimationState, self.informationPane, headerText )
	CoD.CombatRecord.DisplayGameTypePerformanceGraph( self.informationPane, self.controller, self.index )
	return LUI.UIButton.gainFocus( self, event )
end

CoD.CombatRecord.PerformanceRowLoseFocus = function ( self, event )
	self.informationPane.header:close()
	self.informationPane.ScoreContainer:close()
	LUI.UIButton.loseFocus( self, event )
end

CoD.CombatRecord.AddButton = function ( matchesTab, buttonText, index, controller )
	local button = matchesTab.gameTypeButtonList:addButton( buttonText )
	button.informationPane = matchesTab.informationPane
	button.index = index
	button.controller = controller
	button:registerEventHandler( "gain_focus", CoD.CombatRecord.PerformanceRowGainFocus )
	button:registerEventHandler( "lose_focus", CoD.CombatRecord.PerformanceRowLoseFocus )
end

CoD.CombatRecord.PrepareMatchesTab = function ( self, controller )
	local CRMatches_Performance = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	local CRMatches_PerformanceHeader = LUI.UIText.new( {
		left = -1,
		top = 50,
		right = 1,
		bottom = 75,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	CRMatches_Performance:addElement( CRMatches_PerformanceHeader )
	CRMatches_PerformanceHeader:setText( Engine.Localize( "MPUI_MATCH_PERFORMANCE_CAPS" ) )
	CRMatches_Performance.gameTypeButtonList = CoD.ButtonList.new( {
		left = -380,
		top = 100,
		right = -60,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	CRMatches_Performance:addElement( CRMatches_Performance.gameTypeButtonList )
	CRMatches_Performance.informationPane = LUI.UIElement.new( {
		left = 5,
		top = 100,
		right = 385,
		bottom = 380,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		alpha = 1
	} )
	CRMatches_Performance:addElement( CRMatches_Performance.informationPane )
	for i = 1, CoD.CombatRecord.MaximumNumGameType, 1 do
		CoD.CombatRecord.AddButton( CRMatches_Performance, Engine.Localize( CoD.CombatRecord.GameTypeTable[i].localizedString ), i, controller )
	end
	CRMatches_Performance.gameTypeButtonList:processEvent( {
		name = "gain_focus"
	} )
	return CRMatches_Performance
end

LUI.createMenu.CombatRecord = function ( controller )
	local combatRecordMenu = CoD.Menu.New( "CombatRecord" )
	combatRecordMenu:addBackButton()
	local contentPaneDefaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}
	combatRecordMenu.tabContentPane = CoD.CombatRecord.AddContainer( contentPaneDefaultAnimationState, combatRecordMenu )
	local tabManagerDefaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	local tabManager = CoD.MFTabManager.new( combatRecordMenu.tabContentPane, tabManagerDefaultAnimationState )
	combatRecordMenu:addElement( tabManager )
	tabManager:addTab( controller, "MPUI_CAREER_CAPS", CoD.CombatRecord.PrepareCareerTab )
	tabManager:addTab( controller, "MPUI_WEAPONS_CAPS", CoD.CombatRecord.PrepareWeaponsTab )
	tabManager:addTab( controller, "MPUI_MATCHES_CAPS", CoD.CombatRecord.PrepareMatchesTab )
	tabManager:refreshTab( controller )
	return combatRecordMenu
end

