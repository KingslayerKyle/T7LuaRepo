require( "ui.LUI.LUIVerticalList" )

CoD.FileshareVote = {}
CoD.FileshareVote.Categories = {}
CoD.FileshareVote.ClosePopup = function ( fileshareVote, event )
	fileshareVote:goBack( event.controller )
end

CoD.FileshareVote.VoteCast = function ( fileshareVote, event )
	fileshareVote.m_updateTarget:processEvent( {
		name = "infopanel_update_votes"
	} )
	fileshareVote.title:setTopBottom( true, false, 0, CoD.textSize.Big )
	fileshareVote.title:setFont( CoD.fonts.Big )
	fileshareVote.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	local y = CoD.textSize.Big + 20
	local msg = LUI.UIText.new()
	msg:setLeftRight( true, true, 0, 0 )
	msg:setTopBottom( true, false, y, y + CoD.textSize.Default )
	msg:setFont( CoD.fonts.Default )
	msg:setAlignment( LUI.Alignment.Left )
	fileshareVote:addElement( msg )
	if event.success == true then
		msg:setText( Engine.Localize( "MENU_FILESHARE_VOTE_SUCCESS" ) )
	else
		msg:setText( Engine.Localize( "MENU_FILESHARE_VOTE_FAILED" ) )
	end
	if fileshareVote.loader ~= nil then
		fileshareVote.loader:setAlpha( 0 )
	end
	fileshareVote.leftButtonPromptBar:removeAllChildren()
	local accept = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), fileshareVote, "fileshare_upload_accept", false, nil, false )
	fileshareVote:addLeftButtonPrompt( accept )
end

CoD.FileshareVote.GetVoteCategory = function ( fileCategory )
	if fileCategory == "film" then
		return 0
	elseif fileCategory == "clip" then
		return 1
	elseif fileCategory == "screenshot" then
		return 2
	elseif fileCategory == "customgame" then
		return 3
	elseif fileCategory == "emblem" then
		return 5
	else
		return -1
	end
end

CoD.FileshareVote.ButtonGainFocus = function ( button, event )
	button.text:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	button.imageBackground:setRGB( button.m_highlightColor.r, button.m_highlightColor.g, button.m_highlightColor.b )
	button.image:setRGB( button.m_highlightColor.r, button.m_highlightColor.g, button.m_highlightColor.b )
	button.hintArea:updateText( button.hintText )
	button.fileshareVote.leftButtonPromptBar:removeAllChildren()
	if button.m_action == nil then
		button.hintArea:updateText( Engine.Localize( "MENU_FILESHARE_VOTE_WARNING" ) )
	else
		button.fileshareVote:addSelectButton()
	end
	button.fileshareVote:addBackButton()
	return LUI.UIElement.gainFocus( button, event )
end

CoD.FileshareVote.ButtonLoseFocus = function ( button, event )
	button.text:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	button.imageBackground:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	button.image:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	LUI.UIElement.loseFocus( button, event )
end

CoD.FileshareVote.ButtonSelected = function ( button, event )
	if button:isInFocus() and button.m_action ~= nil then
		Engine.Exec( event.controller, button.m_action )
		local fileshareVote = button.fileshareVote
		fileshareVote.body:close()
		fileshareVote.title:setText( Engine.Localize( "MENU_FILESHARE_VOTING" ) )
		fileshareVote.loader = LUI.UIImage.new()
		fileshareVote.loader:setLeftRight( false, false, -32, 32 )
		fileshareVote.loader:setTopBottom( false, false, -32, 32 )
		fileshareVote.loader:setImage( RegisterMaterial( "lui_loader" ) )
		fileshareVote.loader:setShaderVector( 0, 0, 0, 0, 0 )
		fileshareVote.loader:setAlpha( 1 )
		fileshareVote:addElement( fileshareVote.loader )
		fileshareVote.leftButtonPromptBar:removeAllChildren()
		fileshareVote:addBackButton()
	end
end

CoD.FileshareVote.ButtonPressed = function ( fileshareVote, event )
	fileshareVote.verticalList:dispatchEventToChildren( event )
end

CoD.FileshareVote.CreateButton = function ( fileshareVote, imageName, rotation, buttonText, highlightColor, action, hintArea, hintText )
	local state = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 32,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false
	}
	local button = LUI.UIButton.new( state, "vote_selected" )
	button.fileshareVote = fileshareVote
	button.hintArea = hintArea
	button.hintText = hintText
	
	local imageBackground = LUI.UIImage.new()
	imageBackground:setLeftRight( true, false, 0, 32 )
	imageBackground:setTopBottom( false, false, -16, 16 )
	imageBackground:setImage( RegisterMaterial( "menu_mp_lobby_views_bg" ) )
	button:addElement( imageBackground )
	button.imageBackground = imageBackground
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 0, 32 )
	image:setTopBottom( false, false, -16, 16 )
	image:setImage( RegisterMaterial( imageName ) )
	if rotation ~= 0 then
		image:setTopBottom( false, false, -14, 18 )
		image:setZRot( rotation )
	end
	button:addElement( image )
	button.image = image
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 32, 0 )
	text:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	text:setFont( CoD.fonts.Default )
	text:setAlignment( LUI.Alignment.Left )
	text:setText( buttonText )
	button:addElement( text )
	button.text = text
	
	button:registerEventHandler( "gain_focus", CoD.FileshareVote.ButtonGainFocus )
	button:registerEventHandler( "lose_focus", CoD.FileshareVote.ButtonLoseFocus )
	button:registerEventHandler( "vote_selected", CoD.FileshareVote.ButtonSelected )
	button.m_action = action
	button.m_highlightColor = highlightColor
	button.text:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	button.imageBackground:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	button.image:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	return button
end

LUI.createMenu.FileshareVote = function ( controller )
	local fileshareVote = CoD.Menu.NewMediumPopup( "FileshareVote" )
	local data = CoD.perController[controller].voteData
	fileshareVote:setOwner( controller )
	fileshareVote.m_fileID = data.fileID
	fileshareVote.m_updateTarget = CoD.perController[controller].voteUpdateTarget
	fileshareVote.body = LUI.UIElement.new()
	fileshareVote.body:setLeftRight( true, true, 0, 0 )
	fileshareVote.body:setTopBottom( true, true, 0, 0 )
	fileshareVote:addElement( fileshareVote.body )
	local y = 0
	fileshareVote.title = LUI.UIText.new()
	fileshareVote.title:setLeftRight( true, true, 0, 0 )
	fileshareVote.title:setTopBottom( true, false, y, y + CoD.textSize.Big )
	fileshareVote.title:setFont( CoD.fonts.Big )
	fileshareVote.title:setAlignment( LUI.Alignment.Left )
	fileshareVote.title:setText( Engine.Localize( "MENU_SOCIAL" ) )
	fileshareVote:addElement( fileshareVote.title )
	local y = y + CoD.textSize.Big + 40
	local verticalList = LUI.UIVerticalList.new()
	verticalList:setLeftRight( true, true, 0, 0 )
	verticalList:setTopBottom( true, false, y, y + 300 )
	verticalList:makeFocusable()
	fileshareVote.verticalList = verticalList
	fileshareVote.body:addElement( verticalList )
	local voteCategory = CoD.FileshareVote.GetVoteCategory( data.category )
	local previousVote = Engine.GetVote( controller, data.fileID, voteCategory )
	local likeAction = "vote_submitLike " .. data.fileID .. " " .. voteCategory
	local dislikeAction = "vote_submitDislike " .. data.fileID .. " " .. voteCategory
	if previousVote ~= nil then
		if previousVote == "like" then
			likeAction = nil
		elseif previousVote == "dislike" then
			dislikeAction = nil
		end
	end
	local hintTextElement = CoD.HintText.new()
	hintTextElement:setLeftRight( true, false, 0, 350 )
	hintTextElement:setTopBottom( true, false, 200, 200 + CoD.HintText.Height )
	hintTextElement:setColor( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b, 0.4 )
	fileshareVote.body:addElement( hintTextElement )
	local likeButton = CoD.FileshareVote.CreateButton( fileshareVote, "menu_mp_lobby_like", 0, Engine.Localize( "MENU_FILESHARE_LIKE" ), CoD.green, likeAction, hintTextElement, Engine.Localize( "MENU_FILESHARE_VOTE_LIKEHINT" ) )
	verticalList:addElement( likeButton )
	local dislikeButton = CoD.FileshareVote.CreateButton( fileshareVote, "menu_mp_lobby_like", 180, Engine.Localize( "MENU_FILESHARE_DISLIKE" ), CoD.brightRed, dislikeAction, hintTextElement, Engine.Localize( "MENU_FILESHARE_VOTE_DISLIKEHINT" ) )
	verticalList:addElement( dislikeButton )
	y = y + CoD.textSize.Default * 2 + 22
	fileshareVote:registerEventHandler( "vote_selected", CoD.FileshareVote.ButtonPressed )
	fileshareVote:registerEventHandler( "vote_cast", CoD.FileshareVote.VoteCast )
	fileshareVote:registerEventHandler( "fileshare_upload_accept", CoD.FileshareVote.ClosePopup )
	fileshareVote:addSelectButton()
	fileshareVote:addBackButton()
	y = 5
	local detailsPane = LUI.UIElement.new()
	detailsPane:setLeftRight( false, true, -470, 0 )
	detailsPane:setTopBottom( true, true, 0, 0 )
	fileshareVote.body:addElement( detailsPane )
	local mapWidth = 250
	local mapHeight = mapWidth * 9 / 16
	local thumbnail = LUI.UIImage.new()
	if data.category == "customgame" then
		mapWidth = 128
		mapHeight = mapWidth
		thumbnail:setImage( RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", data.gameType, "image" ) ) )
	elseif data.category == "film" then
		if CoD.isZombie then
			if data.zmMapStartLoc == nil then
				data.zmMapStartLoc = Dvar.ui_zm_mapstartlocation:get()
			end
			local gameTypeGroup = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", data.gameType, "groupname" )
			thumbnail:setImage( RegisterMaterial( "menu_" .. CoD.Zombie.GetMapName( data.map ) .. "_" .. gameTypeGroup .. "_" .. data.zmMapStartLoc ) )
		else
			thumbnail:setImage( RegisterMaterial( "menu_" .. data.map .. "_map_select_final" ) )
		end
	elseif data.category == "emblem" then
		if data.fromLobby == nil or data.fromLobby == false then
			thumbnail:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_EMBLEM, data.fileID )
			mapWidth = 128
			mapHeight = mapWidth
		else
			thumbnail:setupPlayerEmblemByXUID( data.selectedPlayerXuid )
			mapWidth = 256
			mapHeight = mapWidth
		end
	elseif data.fromLobby == nil or data.fromLobby == false then
		thumbnail:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, data.fileID )
	elseif data.map ~= nil then
		if CoD.isZombie then
			if data.zmMapStartLoc == nil then
				data.zmMapStartLoc = Dvar.ui_zm_mapstartlocation:get()
			end
			local gameTypeGroup = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", data.gameType, "groupname" )
			thumbnail:setImage( RegisterMaterial( "menu_" .. CoD.Zombie.GetMapName( data.map ) .. "_" .. gameTypeGroup .. "_" .. data.zmMapStartLoc ) )
		else
			thumbnail:setImage( RegisterMaterial( "menu_" .. data.map .. "_map_select_final" ) )
		end
	end
	thumbnail:setLeftRight( true, false, 0, mapWidth )
	thumbnail:setTopBottom( true, false, y, y + mapHeight )
	detailsPane:addElement( thumbnail )
	y = y + mapHeight
	if data.name ~= nil then
		local name = LUI.UIText.new()
		name:setLeftRight( true, true, 0, 0 )
		name:setTopBottom( true, false, y, y + CoD.textSize.Condensed )
		name:setFont( CoD.fonts.Condensed )
		name:setText( data.name )
		name:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		name:setAlignment( LUI.Alignment.Left )
		detailsPane:addElement( name )
		y = y + CoD.textSize.Condensed
	end
	if data.description ~= nil then
		local descArea = LUI.UIElement.new()
		descArea:setLeftRight( true, true, 0, 0 )
		descArea:setTopBottom( true, false, y, y + CoD.textSize.Default * 3 )
		descArea:setUseStencil( true )
		detailsPane:addElement( descArea )
		local description = LUI.UIText.new()
		description:setLeftRight( true, true, 0, 0 )
		description:setTopBottom( true, false, 0, CoD.textSize.Default )
		description:setFont( CoD.fonts.Default )
		description:setText( data.description )
		description:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
		description:setAlignment( LUI.Alignment.Left )
		descArea:addElement( description )
		y = y + CoD.textSize.Default * 3
	end
	if data.time ~= nil then
		local date = LUI.UIText.new()
		date:setLeftRight( true, true, 0, 0 )
		date:setTopBottom( true, false, y, y + CoD.textSize.Default )
		date:setFont( CoD.fonts.Default )
		date:setText( data.time )
		date:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
		date:setAlignment( LUI.Alignment.Left )
		detailsPane:addElement( date )
		y = y + CoD.textSize.Default
	end
	if data.author ~= nil then
		local author = LUI.UIText.new()
		author:setLeftRight( true, true, 0, 0 )
		author:setTopBottom( true, false, y, y + CoD.textSize.Default )
		author:setFont( CoD.fonts.Default )
		author:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) .. " " .. data.author )
		author:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		author:setAlignment( LUI.Alignment.Left )
		detailsPane:addElement( author )
		y = y + CoD.textSize.Default + 10
	end
	if data.views ~= nil then
		local viewPanel = CoD.FileshareManager.StatPanel( 0, y, "views" )
		viewPanel:update( data.views )
		detailsPane:addElement( viewPanel )
	end
	if data.likes ~= nil then
		local likePanel = CoD.FileshareManager.StatPanel( 145, y, "likes" )
		likePanel:update( data.likes )
		detailsPane:addElement( likePanel )
	end
	if data.dislikes ~= nil then
		local dislikePanel = CoD.FileshareManager.StatPanel( 290, y, "dislikes" )
		dislikePanel:update( data.dislikes )
		detailsPane:addElement( dislikePanel )
	end
	verticalList:processEvent( {
		name = "gain_focus"
	} )
	return fileshareVote
end

