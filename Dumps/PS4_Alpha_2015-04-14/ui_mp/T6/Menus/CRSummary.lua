require( "ui_mp.T6.Menus.CRCommon" )

CoD.CRSummary = {}
CoD.CRSummary.GetSingleMedalBox = function ( imageName, title, value )
	local width = 145
	local container = LUI.UIElement.new()
	container:setLeftRight( true, false, 0, width )
	container:setTopBottom( true, true, 0, 0 )
	container:addElement( CoD.GetInformationContainer() )
	container:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1 ) )
	local medalImageSize = 115
	local list = LUI.UIVerticalList.new()
	list:setLeftRight( false, false, -medalImageSize / 2, medalImageSize / 2 )
	list:setTopBottom( true, true, 5, 0 )
	list:setSpacing( 5 )
	container:addElement( list )
	local medalImage = CoD.GetStretchedImage( imageName, true )
	medalImage:setTopBottom( true, false, 0, medalImageSize )
	list:addElement( medalImage )
	list:addSpacer( 15 )
	list:addElement( CoD.GetTextElem( "ExtraSmall", "Center", title ) )
	list:addElement( CoD.GetTextElem( "Big", "Center", value ) )
	return container
end

CoD.CRSummary.SetupMedalsBox = function ( self, controller )
	local summaryInfo = self.summaryInfo
	local stats = CoD.GetPlayerStats( controller )
	if CoD.CRCommon.OtherPlayerCRMode == true then
		stats = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_OTHERPLAYER )
	end
	local headshots = stats.PlayerStatsList.HEADSHOTS.statValue:get()
	local top = 70
	self:addElement( CoD.GetTextElem( "Default", "Left", Engine.Localize( "MENU_CRITICAL_DAMAGE_CAPS" ), CoD.gray, top ) )
	top = top + 30
	local medalsContainer = LUI.UIElement.new()
	local height = 220
	medalsContainer:setLeftRight( true, true, 0, 0 )
	medalsContainer:setTopBottom( true, false, top, top + height )
	self:addElement( medalsContainer )
	local list = LUI.UIHorizontalList.new()
	list:setLeftRight( true, true, 0, 0 )
	list:setTopBottom( true, true, 0, 0 )
	list:setSpacing( 10 )
	medalsContainer:addElement( list )
	list:addElement( CoD.CRSummary.GetSingleMedalBox( "hud_medals_headshot", Engine.Localize( "MENU_LB_HEADSHOTS" ), headshots ) )
	list:addElement( CoD.CRSummary.GetSingleMedalBox( summaryInfo.topKillstreakMedal.medalImage, Engine.Localize( summaryInfo.topKillstreakMedal.medalName ), summaryInfo.topKillstreakMedal.timesEarned ) )
	list:addElement( CoD.CRSummary.GetSingleMedalBox( summaryInfo.topMultikillMedal.medalImage, Engine.Localize( summaryInfo.topMultikillMedal.medalName ), summaryInfo.topMultikillMedal.timesEarned ) )
end

CoD.CRSummary.GetSingleWeaponBox = function ( itemNum, itemIndex, value )
	local height = 70
	local container = LUI.UIElement.new()
	container:setLeftRight( true, true, 0, 0 )
	container:setTopBottom( true, false, 0, height )
	container:addElement( CoD.GetInformationContainer() )
	container:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1 ) )
	local list = LUI.UIHorizontalList.new()
	list:setLeftRight( true, true, 50, 0 )
	list:setTopBottom( true, true, 0, 0 )
	container:addElement( list )
	local weaponNumber = CoD.GetTextElem( "Default", "Left", itemNum )
	local fontHeight = CoD.textSize.Default
	weaponNumber:setLeftRight( true, true, 10, 0 )
	weaponNumber:setTopBottom( false, false, -fontHeight / 2, fontHeight / 2 )
	container:addElement( weaponNumber )
	local imageHeight = height * 0.8
	local imageWidth = imageHeight * 2
	local weaponImage = CoD.GetStretchedImage( Engine.GetItemImage( itemIndex ) )
	weaponImage:setLeftRight( true, false, 0, imageWidth )
	weaponImage:setTopBottom( false, false, -imageHeight / 2, imageHeight / 2 )
	list:addElement( weaponImage )
	list:addSpacer( 5 )
	local top = 10
	local weaponName = CoD.GetTextElem( "Default", "Left", Engine.Localize( Engine.GetItemName( itemIndex ) ), nil, top )
	weaponName:setLeftRight( true, true, imageWidth + 80, 0 )
	local weaponKills = CoD.GetTextElem( "Default", "Left", Engine.Localize( "MENU_X_KILLS", value ), nil, top + CoD.textSize.Default )
	weaponKills:setLeftRight( true, true, imageWidth + 80, 0 )
	container:addElement( weaponName )
	container:addElement( weaponKills )
	return container
end

CoD.CRSummary.SetupWeaponsBox = function ( self, controller )
	local top = 70
	local height = 220
	local width = 370
	local title = CoD.GetTextElem( "Default", "Left", Engine.Localize( "MENU_DEADLIEST_WEAPONS_CAPS" ), CoD.gray, top )
	title:setLeftRight( false, true, -width, 0 )
	self:addElement( title )
	top = top + 30
	local weaponsContainer = LUI.UIElement.new()
	weaponsContainer:setLeftRight( false, true, -width, 0 )
	weaponsContainer:setTopBottom( true, false, top, top + height )
	self:addElement( weaponsContainer )
	local list = LUI.UIVerticalList.new()
	list:setLeftRight( true, true, 0, 0 )
	list:setTopBottom( true, true, 0, 0 )
	list:setSpacing( 5 )
	weaponsContainer:addElement( list )
	local summaryInfo = self.summaryInfo
	for index = 1, 3, 1 do
		list:addElement( CoD.CRSummary.GetSingleWeaponBox( index, summaryInfo.topWeapons[index].itemIndex, summaryInfo.topWeapons[index].itemValue ) )
	end
end

local SetupKdBox = function ( controller, kdBoxContainer, kdBoxContainerWidth, kdBoxContainerHeight )
	local titleTextFont = "Default"
	local titleTextElem = LUI.UIText.new()
	titleTextElem:setLeftRight( true, true, 0, 0 )
	titleTextElem:setTopBottom( true, false, 0, CoD.textSize[titleTextFont] )
	titleTextElem:setFont( CoD.fonts[titleTextFont] )
	titleTextElem:setAlignment( LUI.Alignment.Left )
	titleTextElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	titleTextElem:setText( Engine.Localize( "MENU_KD_LAST_5_CAPS" ) )
	kdBoxContainer:addElement( titleTextElem )
	local topOffset = CoD.textSize[titleTextFont]
	local kdGraphContainer = LUI.UIElement.new()
	kdGraphContainer:setLeftRight( true, true, 0, 0 )
	kdGraphContainer:setTopBottom( true, true, topOffset, 0 )
	kdGraphContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1 ) )
	kdBoxContainer:addElement( kdGraphContainer )
	local stats = CoD.GetPlayerStats( controller )
	if CoD.CRCommon.OtherPlayerCRMode == true then
		stats = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_OTHERPLAYER )
	end
	local gameHistoryStats = stats.gameHistory.publicmatch
	CoD.AfterActionReport.GetKDGraphWidget( controller, kdGraphContainer, kdBoxContainerWidth, kdBoxContainerHeight - topOffset, gameHistoryStats )
end

CoD.CRSummary.SetupKDGraphBox = function ( self, controller )
	local bottomOffset = 50
	local kdBoxContainerHeight = 250
	local kdBoxContainerWidth = 455
	local kdBoxContainer = LUI.UIElement.new()
	kdBoxContainer:setLeftRight( true, false, 0, kdBoxContainerWidth )
	kdBoxContainer:setTopBottom( false, true, -bottomOffset - kdBoxContainerHeight, -bottomOffset )
	self:addElement( kdBoxContainer )
	SetupKdBox( self.m_ownerController, kdBoxContainer, kdBoxContainerWidth, kdBoxContainerHeight )
end

CoD.CRSummary.SetupScorestreakBox = function ( self, controller )
	local summaryInfo = self.summaryInfo
	local bottomOffset = 50
	local height = 250
	local width = 370
	local container = LUI.UIElement.new()
	container:setLeftRight( false, true, -width, 0 )
	container:setTopBottom( false, true, -bottomOffset - height, -bottomOffset )
	self:addElement( container )
	local title = CoD.GetTextElem( "Default", "Left", Engine.Localize( "MENU_DEADLIEST_SCORESTREAK_CAPS" ), CoD.gray )
	container:addElement( title )
	local mainContainer = LUI.UIContainer.new()
	mainContainer:setTopBottom( true, true, CoD.textSize.Default, 0 )
	container:addElement( mainContainer )
	mainContainer:addElement( CoD.GetInformationContainer() )
	local imageHeight = 200
	local imageWidth = imageHeight
	local image = CoD.GetCenteredImage( imageWidth, imageHeight, Engine.GetItemImage( summaryInfo.topScorestreak.itemIndex ) .. "_menu" )
	image:setLeftRight( true, false, 10, 10 + imageWidth )
	local top = 80
	local scorestreakName = CoD.GetTextElem( "Default", "Left", Engine.Localize( Engine.GetItemName( summaryInfo.topScorestreak.itemIndex ) ), nil, top )
	scorestreakName:setLeftRight( true, true, imageWidth + 40, 0 )
	local scorestreaKills = CoD.GetTextElem( "Default", "Left", Engine.Localize( "MENU_X_KILLS", summaryInfo.topScorestreak.itemValue ), nil, top + CoD.textSize.Default )
	scorestreaKills:setLeftRight( true, true, imageWidth + 40, 0 )
	mainContainer:addElement( scorestreakName )
	mainContainer:addElement( scorestreaKills )
	mainContainer:addElement( image )
end

CoD.CRSummary.SetupElements = function ( self, controller )
	if CoD.CRCommon.CurrentXuid and CoD.CRCommon.CurrentXuid ~= "" and CoD.CRCommon.CurrentXuid ~= "0" then
		self:addElement( CoD.MiniIdentity.GetMiniIdentity( controller, CoD.CRCommon.CurrentXuid ) )
	end
	self.summaryInfo = Engine.GetCombatRecordSummaryInfo( controller, CoD.CRCommon.OtherPlayerCRMode == true )
	CoD.CRSummary.SetupMedalsBox( self, controller )
	CoD.CRSummary.SetupWeaponsBox( self, controller )
	CoD.CRSummary.SetupKDGraphBox( self, controller )
	CoD.CRSummary.SetupScorestreakBox( self, controller )
end

LUI.createMenu.CRSummary = function ( controller )
	local self = CoD.Menu.New( "CRSummary" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	self:addTitle( Engine.Localize( "MPUI_COMBAT_SUMMARY_CAPS" ) )
	CoD.CRSummary.SetupElements( self, controller )
	return self
end

