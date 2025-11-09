if CoD == nil then
	CoD = {}
end
CoD.MapVoter = {}
CoD.MapVoter.AspectRatio = 1.5
CoD.MapVoter.FooterHeight = 46
CoD.MapVoter.PreviousButton = function ( self, event )
	Engine.Exec( event.controller, "xpartyveto 2" )
	Engine.PlaySound( "uin_navigation_vote" )
end

CoD.MapVoter.NextButton = function ( self, event )
	Engine.Exec( event.controller, "xpartyveto 1" )
	Engine.PlaySound( "uin_navigation_vote" )
end

CoD.MapVoter.RandomButton = function ( self, event )
	Engine.Exec( event.controller, "xpartyveto 3" )
	Engine.PlaySound( "uin_navigation_vote" )
end

CoD.MapVoter.SetButtonMapImage = function ( self, map, gametype, mapTypeLabel )
	if map ~= nil then
		local previewImageName = CoD.GetMapValue( map, "previewImage", "black" )
		self.image:setImage( RegisterMaterial( previewImageName ) )
		self.image:setAlpha( 1 )
		local mapName = Engine.ToUpper( Engine.Localize( CoD.GetMapValue( map, "mapName", map ) ) )
		self.label:setText( mapName )
		if gametype ~= nil then
			self.gametypeLabel:setText( gametype )
		end
		if mapTypeLabel == "NEXT" then
			self.mapTypeLabel:setText( Engine.Localize( "MPUI_NEXT_CAPS" ) )
		elseif mapTypeLabel == "PREV" then
			if Dvar.party_isPreviousMapVoted:get() == true then
				self.mapTypeLabel:setText( "" )
				self.gametypeLabel:setText( "" )
				self.label:setText( Engine.Localize( "MPUI_PREV_DISABLED_CAPS" ) )
				self.label:setTopBottom( false, true, -CoD.textSize.Default - 5, -5 )
				self.label:setRGB( 0.5, 0.5, 0.5 )
				self.label:setAlpha( 0.6 )
				self.countContainer:setAlpha( 0 )
			else
				self.mapTypeLabel:setText( Engine.Localize( "MPUI_PREV_CAPS" ) )
			end
		elseif mapTypeLabel == "RANDOM" then
			self.mapTypeLabel:setText( Engine.Localize( "MPUI_RANDOM_CAPS" ) )
			self.gametypeLabel:setText( Engine.Localize( "MENU_MODE_CLASSIFIED_CAPS" ) )
			self.label:setText( Engine.Localize( "MENU_MAP_CLASSIFIED_CAPS" ) )
		end
	end
end

CoD.MapVoter.DisableButton = function ( self )
	if self:isInFocus() then
		self:processEvent( {
			name = "lose_focus"
		} )
		if CoD.useController and self.mapVoter.focusResetElement ~= nil then
			self.mapVoter.focusResetElement:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	self.m_focusable = nil
	if self.navigation.up then
		self.navigation.up:setLayoutCached( false )
	end
	if self.navigation.down then
		self.navigation.down:setLayoutCached( false )
	end
end

CoD.MapVoter.FadeOut = function ( self, duration )
	self:beginAnimation( "fade_out", duration )
	self:setAlpha( 0 )
end

CoD.MapVoter.FadeOutButton = function ( self, duration )
	CoD.MapVoter.DisableButton( self )
	CoD.MapVoter.FadeOut( self.image, duration )
	CoD.MapVoter.FadeOut( self.imageHighlight, duration )
	CoD.MapVoter.FadeOut( self.disabledImageHighlight, duration )
	CoD.MapVoter.FadeOut( self.label, duration )
	CoD.MapVoter.FadeOut( self.gametypeLabel, duration )
	CoD.MapVoter.FadeOut( self.countBg, duration )
	CoD.MapVoter.FadeOut( self.count, duration )
	CoD.MapVoter.FadeOut( self.mapTypeLabel, duration )
end

CoD.MapVoter.ExpandButton = function ( self, event )
	local duration = nil
	if event ~= nil then
		duration = event.duration
	end
	local imageAspectRatio = CoD.MapInfoImage.MapImageWidth / CoD.MapInfoImage.MapImageHeight
	local imageWidth = self.mapVoter.width
	local imageHeight = imageWidth / imageAspectRatio
	self.image:beginAnimation( "expand", duration, true, true )
	self.image:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
	self.image:setTopBottom( true, false, 0, imageHeight )
	self:beginAnimation( "expand", duration, true, true )
	self:setTopBottom( true, false, 0, imageHeight + CoD.MapVoter.FooterHeight )
	self:setLeftRight( true, true, 0, 0 )
end

CoD.MapVoter.FadeAndExpandButton = function ( self, duration )
	CoD.MapVoter.DisableButton( self )
	self.image:beginAnimation( "default", duration )
	self.image:setAlpha( 1 )
	CoD.MapVoter.FadeOut( self.countBg, duration )
	CoD.MapVoter.FadeOut( self.count, duration )
	CoD.MapVoter.FadeOut( self.mapTypeLabel, duration )
	CoD.MapVoter.FadeOut( self.imageHighlight, duration )
	CoD.MapVoter.FadeOut( self.disabledImageHighlight, duration )
	if duration and duration > 0 then
		self:addElement( LUI.UITimer.new( duration, {
			name = "expand",
			duration = duration
		}, true ) )
	else
		CoD.MapVoter.ExpandButton( self )
	end
end

CoD.MapVoter.ButtonOver = function ( self, event )
	self.imageHighlight:setAlpha( 0.15 )
	self.mapVoteButtonBorder:setAlpha( 1 )
	if self.mapVoter and self.mapVoter.buttonList then
		self.mapVoter.buttonList:processEvent( {
			name = "update_hint_text",
			button = self
		} )
	end
end

CoD.MapVoter.ButtonUp = function ( self, event )
	self.imageHighlight:setAlpha( 0 )
	self.mapVoteButtonBorder:setAlpha( 0 )
end

CoD.MapVoter.CreateMapVoteButton = function ( self, defaultAnimationState, actionEventName )
	local mapVoteButton = LUI.UIButton.new( defaultAnimationState, actionEventName )
	mapVoteButton:registerEventHandler( "button_over", CoD.MapVoter.ButtonOver )
	mapVoteButton:registerEventHandler( "button_up", CoD.MapVoter.ButtonUp )
	mapVoteButton:setUseStencil( true )
	mapVoteButton:registerEventHandler( "expand", CoD.MapVoter.ExpandButton )
	mapVoteButton.mapVoter = self
	local imageAspectRatio = CoD.MapInfoImage.MapImageWidth / CoD.MapInfoImage.MapImageHeight
	local imageWidth = self.width + 20
	local imageHeight = imageWidth / imageAspectRatio
	mapVoteButton.image = LUI.UIImage.new()
	mapVoteButton.image:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
	mapVoteButton.image:setTopBottom( false, false, -imageHeight / 2, imageHeight / 2 )
	mapVoteButton.image:setAlpha( 0 )
	mapVoteButton:addElement( mapVoteButton.image )
	mapVoteButton.imageHighlight = LUI.UIImage.new()
	mapVoteButton.imageHighlight:setTopBottom( false, false, -self.height / 2, self.height / 2 )
	mapVoteButton.imageHighlight:setLeftRight( false, false, -self.width / 2, self.width / 2 )
	mapVoteButton.imageHighlight:setAlpha( 0 )
	mapVoteButton:addElement( mapVoteButton.imageHighlight )
	mapVoteButton.disabledImageHighlight = LUI.UIImage.new()
	mapVoteButton.disabledImageHighlight:setTopBottom( false, false, -self.height / 2, self.height / 2 )
	mapVoteButton.disabledImageHighlight:setLeftRight( false, false, -self.width / 2, self.width / 2 )
	mapVoteButton.disabledImageHighlight:setAlpha( 0 )
	mapVoteButton.disabledImageHighlight:setRGB( 0, 0, 0 )
	mapVoteButton:addElement( mapVoteButton.disabledImageHighlight )
	local fullImageHeight = self.width / imageAspectRatio
	local mapInfoFrame = LUI.UIImage.new()
	mapInfoFrame:setLeftRight( true, true, 0, 0 )
	mapInfoFrame:setTopBottom( true, false, CoD.MPZM( fullImageHeight, 0 ), fullImageHeight + CoD.MapVoter.FooterHeight )
	mapInfoFrame:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_map_frame", "menu_zm_map_frame" ) ) )
	mapVoteButton:addElement( mapInfoFrame )
	mapVoteButton.mapVoteButtonBorder = CoD.BorderT6.new( 2, CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b, 0 )
	mapVoteButton:addElement( mapVoteButton.mapVoteButtonBorder )
	local rightOffset = CoD.MPZM( -10, -20 )
	local bottomOffset = CoD.MPZM( -2, -14 )
	mapVoteButton.label = LUI.UIText.new()
	mapVoteButton.label:setLeftRight( false, true, -self.width, rightOffset )
	mapVoteButton.label:setTopBottom( false, true, -CoD.textSize.Default - 17 + bottomOffset, -17 + bottomOffset )
	mapVoteButton:addElement( mapVoteButton.label )
	mapVoteButton.gametypeLabel = LUI.UIText.new()
	mapVoteButton.gametypeLabel:setLeftRight( false, true, -self.width, rightOffset )
	mapVoteButton.gametypeLabel:setTopBottom( false, true, -CoD.textSize.ExtraSmall + bottomOffset, bottomOffset )
	mapVoteButton.gametypeLabel:setFont( CoD.fonts.ExtraSmall )
	mapVoteButton:addElement( mapVoteButton.gametypeLabel )
	mapVoteButton.countContainer = LUI.UIElement.new()
	mapVoteButton.countContainer:setLeftRight( true, false, 5, 5 + CoD.textSize.ExtraSmall )
	mapVoteButton.countContainer:setTopBottom( false, true, -CoD.textSize.ExtraSmall - 3, -3 )
	mapVoteButton:addElement( mapVoteButton.countContainer )
	mapVoteButton.countBg = LUI.UIImage.new()
	mapVoteButton.countBg:setLeftRight( true, true, 0, 0 )
	mapVoteButton.countBg:setTopBottom( true, true, 0, 0 )
	mapVoteButton.countBg:setRGB( 0, 0, 0 )
	mapVoteButton.countBg:setAlpha( 1 )
	mapVoteButton.countContainer:addElement( mapVoteButton.countBg )
	mapVoteButton.count = LUI.UIText.new()
	mapVoteButton.count:setLeftRight( false, false, -1, 1 )
	mapVoteButton.count:setTopBottom( false, true, -CoD.textSize.ExtraSmall, 0 )
	mapVoteButton.count:setFont( CoD.fonts.ExtraSmall )
	mapVoteButton.countContainer:addElement( mapVoteButton.count )
	mapVoteButton.count:setText( 0 )
	mapVoteButton.mapTypeLabel = LUI.UIText.new()
	mapVoteButton.mapTypeLabel:setLeftRight( true, false, 30, self.width )
	mapVoteButton.mapTypeLabel:setTopBottom( false, true, -CoD.textSize.Default - 1, -1 )
	mapVoteButton:addElement( mapVoteButton.mapTypeLabel )
	return mapVoteButton
end

CoD.MapVoter.AnimateVotes = function ( pressedButton, button1, button2 )
	pressedButton.countBg:beginAnimation( "buttonPressed" )
	pressedButton.countBg:setRGB( CoD.green.r, CoD.green.g, CoD.green.b )
	pressedButton.mapTypeLabel:beginAnimation( "buttonPressed" )
	pressedButton.mapTypeLabel:setRGB( CoD.green.r, CoD.green.g, CoD.green.b )
	pressedButton.count:beginAnimation( "buttonPressed" )
	pressedButton.count:setRGB( 0, 0, 0 )
	button1.countBg:beginAnimation( "default" )
	button1.countBg:setRGB( 0, 0, 0 )
	button1.mapTypeLabel:beginAnimation( "default" )
	button1.mapTypeLabel:setRGB( 1, 1, 1 )
	button1.count:beginAnimation( "default" )
	button1.count:setRGB( 1, 1, 1 )
	button2.countBg:beginAnimation( "default" )
	button2.countBg:setRGB( 0, 0, 0 )
	button2.mapTypeLabel:beginAnimation( "default" )
	button2.mapTypeLabel:setRGB( 1, 1, 1 )
	button2.count:beginAnimation( "default" )
	button2.count:setRGB( 1, 1, 1 )
end

CoD.MapVoter.DisplayVoteCount = function ( self, previousMapVoteCount, nextMapVoteCount, randomMapVoteCount )
	if self.body ~= nil then
		self.body.previousMapButton.count:setText( previousMapVoteCount )
		self.body.nextMapButton.count:setText( nextMapVoteCount )
		self.body.randomMapButton.count:setText( randomMapVoteCount )
		if self.vote == 1 then
			CoD.MapVoter.AnimateVotes( self.body.nextMapButton, self.body.previousMapButton, self.body.randomMapButton )
		elseif self.vote == 2 then
			CoD.MapVoter.AnimateVotes( self.body.previousMapButton, self.body.nextMapButton, self.body.randomMapButton )
		elseif self.vote == 3 then
			CoD.MapVoter.AnimateVotes( self.body.randomMapButton, self.body.previousMapButton, self.body.nextMapButton )
		end
	end
end

CoD.MapVoter.AnimateMapChosen = function ( self, duration, isSlidingFromPanel )
	if self.mapChosen ~= nil and self.body ~= nil then
		self.m_inputDisabled = true
		if self.mapChosen == self.previousMap and self.selectedMapGameMode == self.previousGametype then
			CoD.MapVoter.FadeAndExpandButton( self.body.previousMapButton, duration )
			CoD.MapVoter.FadeOutButton( self.body.nextMapButton, duration )
			CoD.MapVoter.FadeOutButton( self.body.randomMapButton, duration )
		elseif self.mapChosen == self.nextMap and self.selectedMapGameMode == self.nextGametype then
			CoD.MapVoter.FadeOutButton( self.body.previousMapButton, duration )
			CoD.MapVoter.FadeAndExpandButton( self.body.nextMapButton, duration )
			CoD.MapVoter.FadeOutButton( self.body.randomMapButton, duration )
		else
			if isSlidingFromPanel then
				duration = 0
			end
			local gametype = Engine.DvarString( nil, "ui_gametype" )
			local gameTypeStringRef = nil
			if not CoD.isZombie then
				gameTypeStringRef = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
			else
				gameTypeStringRef = CoD.GetZombieGameTypeDescription( gametype, self.mapChosen )
			end
			self.randomGameType = Engine.Localize( gameTypeStringRef )
			CoD.MapVoter.FadeOutButton( self.body.previousMapButton, duration )
			CoD.MapVoter.FadeOutButton( self.body.nextMapButton, duration )
			CoD.MapVoter.SetButtonMapImage( self.body.randomMapButton, self.mapChosen, self.randomGameType )
			CoD.MapVoter.FadeAndExpandButton( self.body.randomMapButton, duration )
		end
	end
end

CoD.MapVoter.SetVotesAndMaps = function ( self, event )
	if self.mapChosen ~= nil then
		CoD.MapVoter.Reset( self )
		if self.body ~= nil then
			self:removeElements()
			self:addElements()
		end
	end
	if event.selfVote ~= nil then
		self.vote = event.selfVote
	end
	if event.previousMapName ~= nil then
		self.previousMap = event.previousMapName
	end
	if event.previousGametype ~= nil then
		self.previousGametype = event.previousGametype
	end
	if event.nextMapName ~= nil then
		self.nextMap = event.nextMapName
	end
	if event.nextGametype ~= nil then
		self.nextGametype = event.nextGametype
	end
	self.m_inputDisabled = false
	if self.body ~= nil then
		CoD.MapVoter.SetButtonMapImage( self.body.nextMapButton, self.nextMap, self.nextGametype, "NEXT" )
		CoD.MapVoter.SetButtonMapImage( self.body.previousMapButton, self.previousMap, self.previousGametype, "PREV" )
		CoD.MapVoter.SetButtonMapImage( self.body.randomMapButton, "RANDOM", nil, "RANDOM" )
	end
	CoD.MapVoter.DisplayVoteCount( self, event.previousMapVoteCount, event.nextMapVoteCount, event.randomMapVoteCount )
	CoD.MapVoter.Show( self, false )
end

CoD.MapVoter.MapChosen = function ( self, event )
	local mapChosen = Dvar.ui_mapname:get()
	local selectedMapGameMode = Dvar.ui_gametype:get()
	if self.mapChosen == nil then
		self.mapChosen = mapChosen
		self.selectedMapGameMode = selectedMapGameMode
		CoD.MapVoter.AnimateMapChosen( self, 500, self.isSlidingFromPanel )
		Engine.PlaySound( "uin_map_chosen" )
	elseif self.mapChosen ~= mapChosen then
		self.mapChosen = mapChosen
		self.selectedMapGameMode = selectedMapGameMode
		CoD.MapVoter.AnimateMapChosen( self )
		Engine.PlaySound( "uin_map_chosen" )
	end
	CoD.MapVoter.Show( self, true )
end

CoD.MapVoter.MapChosen_Zombie = function ( self, event )
	local mapChosen = Engine.DvarString( nil, "ui_mapname" )
	local selectedMapGameMode = Dvar.ui_gametype:get()
	local startLoc = Dvar.ui_zm_mapstartlocation:get()
	if self.mapChosen == nil then
		self.mapChosen = mapChosen
		self.selectedMapGameMode = selectedMapGameMode
		self.startLoc = startLoc
		CoD.MapVoter.AnimateMapChosen( self, 0, true )
		Engine.PlaySound( "uin_map_chosen" )
	elseif self.mapChosen ~= mapChosen or self.selectedMapGameMode ~= selectedMapGameMode or self.startLoc ~= startLoc then
		self.mapChosen = mapChosen
		self.selectedMapGameMode = selectedMapGameMode
		self.startLoc = startLoc
		CoD.MapVoter.AnimateMapChosen( self )
		Engine.PlaySound( "uin_map_chosen" )
	end
	CoD.MapVoter.Show( self, true )
	self:dispatchEventToChildren( event )
end

CoD.MapVoter.AddElements = function ( self )
	self.body = LUI.UIElement.new()
	self.body:registerEventHandler( "next_button_pressed", CoD.MapVoter.NextButton )
	self.body:registerEventHandler( "previous_button_pressed", CoD.MapVoter.PreviousButton )
	self.body:registerEventHandler( "random_button_pressed", CoD.MapVoter.RandomButton )
	self.body:setLeftRight( true, true, 0, 0 )
	self.body:setTopBottom( true, true, 0, 0 )
	self:addElement( self.body )
	local mapVoteSpacing = 4
	local mapVoteButtonHeight = (self.height - mapVoteSpacing * 2) * 0.4
	local randomMapVoteButtonHeight = mapVoteButtonHeight / 2
	self.body.nextMapButton = CoD.MapVoter.CreateMapVoteButton( self, {
		left = 0,
		top = 0,
		right = self.width,
		bottom = mapVoteButtonHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	}, "next_button_pressed" )
	self.body.nextMapButton.id = "LUIButton.Next"
	self.body.nextMapButton.hintText = Engine.Localize( "MPUI_NEXT_VOTE" )
	self.body:addElement( self.body.nextMapButton )
	self.body.previousMapButton = CoD.MapVoter.CreateMapVoteButton( self, {
		left = 0,
		top = mapVoteButtonHeight + mapVoteSpacing,
		right = self.width,
		bottom = mapVoteButtonHeight * 2 + mapVoteSpacing,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	}, "previous_button_pressed" )
	self.body.previousMapButton.id = "LUIButton.Previous"
	self.body.previousMapButton.hintText = Engine.Localize( "MPUI_PREVIOUS_VOTE" )
	self.body:addElement( self.body.previousMapButton )
	self.body.randomMapButton = CoD.MapVoter.CreateMapVoteButton( self, {
		left = 0,
		top = mapVoteButtonHeight * 2 + mapVoteSpacing * 2,
		right = self.width,
		bottom = mapVoteButtonHeight * 2 + mapVoteSpacing * 2 + randomMapVoteButtonHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	}, "random_button_pressed" )
	self.body.randomMapButton.id = "LUIButton.Random"
	self.body.randomMapButton.hintText = Engine.Localize( "MPUI_RANDOM_VOTE" )
	self.body:addElement( self.body.randomMapButton )
	self.body.nextMapButton.navigation.down = self.body.previousMapButton
	self.body.previousMapButton.navigation.up = self.body.nextMapButton
	self.body.previousMapButton.navigation.down = self.body.randomMapButton
	self.body.randomMapButton.navigation.up = self.body.previousMapButton
	if self.buttonList ~= nil and CoD.isZombie == false then
		self.buttonList.navigation = {}
		self.buttonList.navigation.down = self.body.nextMapButton
		self.buttonList.navigation.up = self.body.randomMapButton
		LUI.UIVerticalList.UpdateNavigation( self.buttonList )
	end
end

CoD.MapVoter.RemoveElements = function ( self )
	self.body:close()
	self.body = nil
end

CoD.MapVoter.Show = function ( self, isMapVoteLocked )
	if Dvar.party_isPreviousMapVoted:get() == true and not self.body.previousMapButton.disabled and not isMapVoteLocked then
		self.body.previousMapButton:disable()
		self.body.previousMapButton:makeNotFocusable()
		self.body.previousMapButton.disabledImageHighlight:setAlpha( 0.5 )
		self.body.nextMapButton.navigation.down = self.body.randomMapButton
		self.body.randomMapButton.navigation.up = self.body.nextMapButton
	end
	self:beginAnimation( "show" )
	self:setAlpha( 1 )
end

CoD.MapVoter.Reset = function ( self )
	self.previousVotes = 0
	self.nextVotes = 0
	self.randomVotes = 0
	self.mapChosen = nil
	self.vote = nil
	self.selectedMapGameMode = nil
end

CoD.MapVoter.new = function ( defaultAnimationState, isSlidingFromPanel )
	local mapVoter = LUI.UIElement.new( defaultAnimationState )
	mapVoter:beginAnimation( "hide" )
	mapVoter:setAlpha( 0 )
	mapVoter.id = "MapVoter"
	mapVoter.height = defaultAnimationState.bottom - defaultAnimationState.top
	mapVoter.width = defaultAnimationState.right - defaultAnimationState.left
	mapVoter.isSlidingFromPanel = isSlidingFromPanel
	if CoD.isZombie == true then
		mapVoter:registerEventHandler( "map_vote_set_votes_and_maps", CoD.MapVoter.MapChosen_Zombie )
		mapVoter:registerEventHandler( "map_vote_map_chosen", CoD.MapVoter.MapChosen_Zombie )
		mapVoter:registerEventHandler( "gamelobby_update", CoD.MapVoter.MapChosen_Zombie )
	else
		mapVoter:registerEventHandler( "map_vote_set_votes_and_maps", CoD.MapVoter.SetVotesAndMaps )
		mapVoter:registerEventHandler( "map_vote_map_chosen", CoD.MapVoter.MapChosen )
	end
	mapVoter.addElements = CoD.MapVoter.AddElements
	mapVoter.removeElements = CoD.MapVoter.RemoveElements
	return mapVoter
end

