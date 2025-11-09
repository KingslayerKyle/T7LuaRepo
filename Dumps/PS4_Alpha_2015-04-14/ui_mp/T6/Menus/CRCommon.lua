CoD.CRCommon = {}
CoD.CRCommon.SortTypes = {}
CoD.CRCommon.SortTypes.GAMEMODES = 0
CoD.CRCommon.SortTypes.WEAPONS = 1
CoD.CRCommon.SortTypes.EQUIPMENT = 2
CoD.CRCommon.SortTypes.SCORESTREAKS = 3
CoD.CRCommon.SortTypes.MEDALS = 4
CoD.CRCommon.MedalCategories = {}
CoD.CRCommon.MedalCategories.CATEGORY_NONE = 0
CoD.CRCommon.MedalCategories.CATEGORY_COMBAT = 1
CoD.CRCommon.MedalCategories.CATEGORY_SCORESTREAKS = 2
CoD.CRCommon.MedalCategories.CATEGORY_ANTISCORESTREAKS = 3
CoD.CRCommon.MedalCategories.CATEGORY_GAMEMODES = 4
CoD.CRCommon.MAX_BACKINGS = 3
CoD.CRCommon.BackingHeight = 75
CoD.CRCommon.BackingWidth = CoD.CRCommon.BackingHeight * 4
CoD.CRCommon.GameTypeImageNames = {
	tdm = "playlist_tdm",
	dm = "playlist_ffa",
	dom = "playlist_domination",
	sd = "playlist_search_destroy",
	sr = "playlist_search_rescue",
	ctf = "playlist_ctf",
	hq = "playlist_headquarters",
	dem = "playlist_demolition",
	koth = "playlist_koth",
	conf = "playlist_kill_confirm",
	shrp = "playlist_sharpshooter",
	sas = "playlist_sticks_and_stones",
	oic = "playlist_one_chamber",
	gun = "playlist_gungame",
	hckr = "playlist_hacker",
	oneflag = "playlist_single_ctf",
	hctdm = "playlist_tdm",
	hcdm = "playlist_ffa",
	hcdom = "playlist_domination",
	hcsd = "playlist_search_destroy",
	hcsr = "playlist_search_rescue",
	hcctf = "playlist_ctf",
	hchq = "playlist_headquarters",
	hcdem = "playlist_demolition",
	hckoth = "playlist_koth",
	hcconf = "playlist_kill_confirm",
	hconeflag = "playlist_single_ctf"
}
CoD.CRCommon.GetStats = function ( controller, otherPlayer )
	local stats = CoD.GetPlayerStats( controller )
	if otherPlayer then
		stats = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_OTHERPLAYER )
	end
	return stats
end

CoD.CRCommon.GetStatContainer = function ()
	local statContainer = LUI.UIElement.new()
	statContainer:setLeftRight( true, true, 0, 0 )
	statContainer:setTopBottom( true, true, 0, 0 )
	
	local statContainerBackground = LUI.UIImage.new()
	statContainerBackground:setLeftRight( true, true, 1, -1 )
	statContainerBackground:setTopBottom( true, true, 1, -1 )
	statContainerBackground:setRGB( 0, 0, 0 )
	statContainerBackground:setAlpha( 0.4 )
	statContainer:addElement( statContainerBackground )
	statContainer.statContainerBackground = statContainerBackground
	
	local statContainerBackgroundGrad = LUI.UIImage.new()
	statContainerBackgroundGrad:setLeftRight( true, true, 3, -3 )
	statContainerBackgroundGrad:setTopBottom( true, true, 3, -3 )
	statContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	statContainerBackgroundGrad:setAlpha( 0.1 )
	statContainer:addElement( statContainerBackgroundGrad )
	statContainer.statContainerBackgroundGrad = statContainerBackgroundGrad
	
	local imageContainer = LUI.UIElement.new()
	imageContainer:setLeftRight( true, true, 3, -3 )
	imageContainer:setTopBottom( true, true, 3, -3 )
	statContainer:addElement( imageContainer )
	statContainer.imageContainer = imageContainer
	
	statContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	statContainer:addElement( statContainer.border )
	return statContainer
end

CoD.CRCommon.GetTextElem = function ( fontName, alignment, text, color, topOffset )
	local localFontName = "Default"
	local localAlignment = LUI.Alignment.Center
	local top = 0
	if alignment then
		localAlignment = LUI.Alignment[alignment]
	end
	if fontName then
		localFontName = fontName
	end
	if topOffset then
		top = topOffset
	end
	local font = CoD.fonts[localFontName]
	local fontHeight = CoD.textSize[localFontName]
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, false, top, top + fontHeight )
	textElem:setFont( font )
	textElem:setAlignment( localAlignment )
	if text then
		textElem:setText( text )
	end
	if color then
		textElem:setRGB( color.r, color.g, color.b )
	end
	return textElem
end

CoD.CRCommon.GetCenteredImage = function ( width, height, materialName, streamedImage )
	local imageElem = nil
	if streamedImage then
		imageElem = LUI.UIStreamedImage.new( nil, nil, true )
	else
		imageElem = LUI.UIImage.new()
	end
	imageElem:setLeftRight( false, false, -width / 2, width / 2 )
	imageElem:setTopBottom( false, false, -height / 2, height / 2 )
	if materialName then
		imageElem:setImage( RegisterMaterial( materialName ) )
	end
	return imageElem
end

CoD.CRCommon.GetStretchedImage = function ( materialName, streamedImage )
	local imageElem = nil
	if streamedImage then
		imageElem = LUI.UIStreamedImage.new( nil, nil, true )
	else
		imageElem = LUI.UIImage.new()
	end
	imageElem:setLeftRight( true, true, 0, 0 )
	imageElem:setTopBottom( true, true, 0, 0 )
	if materialName then
		imageElem:setImage( RegisterMaterial( materialName ) )
	end
	return imageElem
end

CoD.CRCommon.GetIndividualStatBox = function ( width )
	local top = 50
	local container = CoD.CRCommon.GetStatContainer()
	container:setLeftRight( true, false, 0, width )
	container:setTopBottom( true, true, 0, 0 )
	local vert = LUI.UIVerticalList.new()
	vert:setLeftRight( true, true, 0, 0 )
	vert:setTopBottom( true, true, top, 0 )
	
	local label = CoD.CRCommon.GetTextElem( "ExtraSmall", "Center", "", CoD.gray )
	vert:addElement( label )
	container.label = label
	
	vert:addSpacer( 5 )
	
	local value = CoD.CRCommon.GetTextElem( "Big", "Center", "" )
	vert:addElement( value )
	container.value = value
	
	vert:addSpacer( 5 )
	local comparisonValue = CoD.CRCommon.GetTextElem( "Big", "Center", "" )
	vert:addElement( comparisonValue )
	comparisonValue:setRGB( CoD.lightBlue.r, CoD.lightBlue.g, CoD.lightBlue.b )
	container.comparisonValue = comparisonValue
	container:addElement( vert )
	return container
end

CoD.CRCommon.UpdateGenericStatsInfoBoxValues = function ( self, values, imageMaterialName )
	if not values or #values == 0 then
		return 
	end
	local image = self.image
	image:hide()
	if imageMaterialName then
		image:setImage( RegisterMaterial( imageMaterialName ) )
		image:show()
	end
	for index, value in ipairs( values ) do
		if self.statBoxes and index <= #self.statBoxes and self.statBoxes[index] then
			local currStatBox = self.statBoxes[index]
			if value.baseValue then
				currStatBox.value:setText( value.baseValue )
			end
			if value.comparisonValue then
				currStatBox.comparisonValue:setText( value.comparisonValue )
			end
		end
	end
end

CoD.CRCommon.SetGenericStatsInfoBoxLabels = function ( self, labels )
	if not labels or #labels == 0 then
		return 
	end
	for index, label in ipairs( labels ) do
		if self.statBoxes and index <= #self.statBoxes and self.statBoxes[index] then
			local currStatBox = self.statBoxes[index]
			if label then
				currStatBox.label:setText( label )
			end
		end
	end
end

CoD.CRCommon.GetGenericStatsInfoBox = function ( numStats, imageWidth, imageHeight, statBoxWidth )
	local infoBox = LUI.UIHorizontalList.new()
	infoBox:setLeftRight( true, true, 0, 0 )
	infoBox:setTopBottom( true, true, 0, 0 )
	infoBox.update = CoD.CRCommon.UpdateGenericStatsInfoBoxValues
	infoBox.setLabels = CoD.CRCommon.SetGenericStatsInfoBoxLabels
	local width = 300
	local mainBox = CoD.CRCommon.GetStatContainer()
	mainBox:setLeftRight( true, false, 0, width )
	
	local image = CoD.CRCommon.GetCenteredImage( imageWidth, imageHeight )
	image:hide()
	mainBox:addElement( image )
	infoBox.image = image
	
	infoBox:addElement( mainBox )
	width = 150
	if statBoxWidth then
		width = statBoxWidth
	end
	infoBox.statBoxes = {}
	for i = 1, numStats, 1 do
		local f9_local2 = i
		local statBox = CoD.CRCommon.GetIndividualStatBox( width )
		infoBox:addElement( statBox )
		table.insert( infoBox.statBoxes, statBox )
	end
	return infoBox
end

CoD.CRCommon.ListBoxButtonCreator = function ( controller, mutables )
	local fontName = "Default"
	local font = CoD.fonts[fontName]
	local fontHeight = CoD.textSize[fontName]
	local itemInfoContainer = LUI.UIElement.new()
	itemInfoContainer:setLeftRight( true, true, 8, -8 )
	itemInfoContainer:setTopBottom( false, false, -fontHeight / 2, fontHeight / 2 )
	local itemName = CoD.CRCommon.GetTextElem( "Default", "Left" )
	itemInfoContainer:addElement( itemName )
	local itemValue = CoD.CRCommon.GetTextElem( "Default", "Right" )
	itemInfoContainer:addElement( itemValue )
	mutables.itemName = itemName
	mutables.itemValue = itemValue
	mutables:addElement( itemInfoContainer )
end

CoD.CRCommon.GetGenericListBox = function ( controller, listBoxWidth, buttonDataFn )
	local buttonHeight = 45
	local listBoxDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	local listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 5, buttonHeight, listBoxWidth, CoD.CRCommon.ListBoxButtonCreator, buttonDataFn, 0 )
	listBox:addScrollBar()
	listBox.m_pageArrowsOn = true
	return listBox
end

CoD.CRCommon.UpdateBackings = function ( self, controller, backgroundIds )
	local idTable = {}
	if backgroundIds and 0 < #backgroundIds then
		for index, currId in ipairs( backgroundIds ) do
			if 0 < currId then
				table.insert( idTable, currId )
			end
		end
	end
	for index, currId in ipairs( self.containers ) do
		currId:hide()
		if idTable and 0 < #idTable then
			local currBackgroundId = idTable[index]
			if currBackgroundId and 0 < currBackgroundId then
				currId.backingImage:setupDrawBackgroundById( currBackgroundId )
				local info = CoD.EmblemBackgroundSelector.GetChallengeInformation( controller, currBackgroundId )
				if info and info.challengeName then
					currId.challengeName:setText( info.challengeName )
					currId:show()
				end
			end
		end
	end
end

CoD.CRCommon.GetGenericBackingsContainer = function ()
	local backingsContainer = LUI.UIVerticalList.new()
	backingsContainer:setLeftRight( true, false, 0, CoD.CRCommon.BackingWidth )
	backingsContainer:setTopBottom( true, true, 0, 0 )
	backingsContainer.updateBackings = CoD.CRCommon.UpdateBackings
	backingsContainer.containers = {}
	for i = 1, CoD.CRCommon.MAX_BACKINGS, 1 do
		local f13_local2 = i
		local fancyContainer = CoD.CRCommon.GetStatContainer()
		fancyContainer:setTopBottom( true, false, 0, CoD.CRCommon.BackingHeight )
		fancyContainer:hide()
		fancyContainer.backingImage = CoD.CRCommon.GetStretchedImage()
		fancyContainer.imageContainer:addElement( fancyContainer.backingImage )
		table.insert( backingsContainer.containers, fancyContainer )
		local challengeNameFont = "Default"
		fancyContainer.challengeName = CoD.CRCommon.GetTextElem( "Default", "Left" )
		fancyContainer.challengeName:setLeftRight( true, true, 5, 0 )
		fancyContainer.challengeName:setTopBottom( false, true, -5 - CoD.textSize[challengeNameFont], -5 )
		fancyContainer:addElement( fancyContainer.challengeName )
		backingsContainer:addElement( fancyContainer )
		backingsContainer:addSpacer( 5 )
	end
	return backingsContainer
end

CoD.CRCommon.UpdateComparisonContainer = function ( self, controller )
	if CoD.CRCommon.ComparisonModeOn == true then
		local playerXuid = CoD.CRCommon.ComparedXuid
		local playerName = CoD.CRCommon.ComparedPlayerName
		if CoD.CRCommon.OtherPlayerCRMode then
			playerXuid = Engine.GetXUID( controller )
			playerName = Engine.GetSelfGamertag( controller )
		end
		if playerXuid and playerName then
			self.comparisonEmblem:setupPlayerEmblemByXUID( playerXuid )
			self.comparingLabel:setText( Engine.Localize( "MENU_COMPARING_COLON" ) )
			self.comparedPlayerNameTextElem:setText( playerName )
			self:show()
		end
	else
		self:hide()
	end
end

CoD.CRCommon.GetComparisonContainer = function ()
	local left = 250
	local top = 10
	local comparisonContainerWidth = 300
	local comparisonContainerHeight = comparisonContainerWidth / 4
	local comparisonContainer = LUI.UIElement.new()
	comparisonContainer:setLeftRight( true, false, left, left + comparisonContainerWidth )
	comparisonContainer:setTopBottom( true, false, 0, comparisonContainerHeight )
	local emblemSize = 48
	local comparisonEmblem = CoD.CRCommon.GetCenteredImage( emblemSize, emblemSize )
	comparisonEmblem:setLeftRight( true, false, 5, 5 + emblemSize )
	left = emblemSize + 10
	local comparingLabel = CoD.CRCommon.GetTextElem( "Default", "Left", nil, nil, top )
	comparingLabel:setLeftRight( true, true, left, 0 )
	local comparedPlayerNameTextElem = CoD.CRCommon.GetTextElem( "Default", "Left", "", CoD.lightBlue, top + CoD.textSize.Default )
	comparedPlayerNameTextElem:setLeftRight( true, true, left, 0 )
	comparisonContainer:addElement( comparisonEmblem )
	comparisonContainer:addElement( comparingLabel )
	comparisonContainer:addElement( comparedPlayerNameTextElem )
	comparisonContainer.comparisonEmblem = comparisonEmblem
	comparisonContainer.comparingLabel = comparingLabel
	comparisonContainer.comparedPlayerNameTextElem = comparedPlayerNameTextElem
	comparisonContainer.update = CoD.CRCommon.UpdateComparisonContainer
	comparisonContainer:update()
	return comparisonContainer
end

