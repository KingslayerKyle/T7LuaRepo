require( "ui_mp.T6.Menus.VotingConfirmation" )

CoD.VotingPopup = {}
CoD.VotingPopup.MessageTop = 0
CoD.VotingPopup.MessageHeight = 100
CoD.VotingPopup.SelectElementContainerWidth = 100
CoD.VotingPopup.SelectElementContainerHeight = 80
CoD.VotingPopup.ArrowWidth = 32
CoD.VotingPopup.ArrowHeight = 16
CoD.VotingPopup.CenterElementContainerWidth = 160
CoD.VotingPopup.CenterElementContainerHeight = 145
CoD.VotingPopup.CenterElementOffset = 30
CoD.VotingPopup.VotingItemHeight = 180
CoD.VotingPopup.VotingItemWidth = CoD.VotingPopup.VotingItemHeight * 2
CoD.VotingPopup.SelectedItemHeightIncrement = 50
CoD.VotingPopup.SelectedItemWidthIncrement = CoD.VotingPopup.SelectedItemHeightIncrement * 2
CoD.VotingPopup.SelectedCenterElementContainerWidth = CoD.VotingPopup.CenterElementContainerWidth - CoD.VotingPopup.SelectedItemWidthIncrement
CoD.VotingPopup.SelectedCenterElementContainerHeight = CoD.VotingPopup.CenterElementContainerHeight - CoD.VotingPopup.SelectedItemHeightIncrement
CoD.VotingPopup.VotingSelectedItemWidth = CoD.VotingPopup.VotingItemWidth + CoD.VotingPopup.SelectedItemWidthIncrement
CoD.VotingPopup.VotingSelectedItemHeight = CoD.VotingPopup.VotingItemHeight + CoD.VotingPopup.SelectedItemHeightIncrement
CoD.VotingPopup.FadeAlpha = 0.4
CoD.VotingPopup.ResultsXPosition = 70
CoD.VotingPopup.AddTitle = function ( votingPopup, titleString, yCoord )
	if titleString ~= nil then
		local title = LUI.UIText.new()
		title:setLeftRight( true, true, 0, 0 )
		title:setTopBottom( true, false, yCoord, yCoord + CoD.textSize.Big )
		title:setFont( CoD.fonts.Big )
		title:setAlignment( LUI.Alignment.Center )
		title:setText( titleString )
		votingPopup:addElement( title )
		votingPopup.title = title
	end
end

CoD.VotingPopup.AddSubtitle = function ( votingPopup, subtitleString, yCoord )
	if subtitleString ~= nil then
		local subtitleContainer = LUI.UIElement.new()
		subtitleContainer:setLeftRight( true, true, 0, 0 )
		subtitleContainer:setTopBottom( true, false, yCoord, yCoord + CoD.VotingPopup.MessageHeight )
		votingPopup:addElement( subtitleContainer )
		local subtitleEl = LUI.UIText.new( nil, true )
		subtitleEl:setLeftRight( true, true, 0, 0 )
		subtitleEl:setTopBottom( true, false, 0, CoD.textSize.ExtraSmall )
		subtitleEl:setFont( CoD.fonts.ExtraSmall )
		subtitleEl:setText( subtitleString )
		subtitleEl:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		subtitleEl:setAlignment( LUI.Alignment.Center )
		subtitleContainer:addElement( subtitleEl )
	end
end

CoD.VotingPopup.GetVotingItemsDetails = function ( centerElement, voteItems )
	for i = 1, voteItems.votingItemsCount, 1 do
		if voteItems[i].votingitemposition == "left" then
			centerElement.LeftVotingItem = {}
			centerElement.LeftVotingItem.ImageName = voteItems[i].imageName
			centerElement.LeftVotingItem.IsLocalImage = voteItems[i].isLocalImage
			centerElement.LeftVotingItem.CounterName = voteItems[i].counterName
			centerElement.LeftVotingItem.VotingItemString = voteItems[i].votingitemstring
		end
		if voteItems[i].votingitemposition == "right" then
			centerElement.RightVotingItem = {}
			centerElement.RightVotingItem.ImageName = voteItems[i].imageName
			centerElement.RightVotingItem.IsLocalImage = voteItems[i].isLocalImage
			centerElement.RightVotingItem.CounterName = voteItems[i].counterName
			centerElement.RightVotingItem.VotingItemString = voteItems[i].votingitemstring
		end
		if voteItems[i].votingitemposition == "top" then
			centerElement.TopVotingItem = {}
			centerElement.TopVotingItem.ImageName = voteItems[i].imageName
			centerElement.TopVotingItem.IsLocalImage = voteItems[i].isLocalImage
			centerElement.TopVotingItem.CounterName = voteItems[i].counterName
			centerElement.TopVotingItem.VotingItemString = voteItems[i].votingitemstring
		end
		if voteItems[i].votingitemposition == "bottom" then
			centerElement.BottomVotingItem = {}
			centerElement.BottomVotingItem.ImageName = voteItems[i].imageName
			centerElement.BottomVotingItem.IsLocalImage = voteItems[i].isLocalImage
			centerElement.BottomVotingItem.CounterName = voteItems[i].counterName
			centerElement.BottomVotingItem.VotingItemString = voteItems[i].votingitemstring
		end
	end
end

CoD.VotingPopup.CreateVotingItemElement = function ( votingItemContainer, imageName, desc, caption )
	local votingItemEl = LUI.UIImage.new()
	votingItemEl:setLeftRight( true, true, 0, 0 )
	votingItemEl:setTopBottom( true, true, 0, 0 )
	votingItemEl:setImage( RegisterMaterial( imageName ) )
	votingItemContainer:addElement( votingItemEl )
	votingItemContainer.votingItemEl = votingItemEl
	
	local votingItemGlowEl = LUI.UIImage.new()
	votingItemGlowEl:setLeftRight( true, true, 0, 0 )
	votingItemGlowEl:setTopBottom( true, true, 0, 0 )
	votingItemGlowEl:setAlpha( 0 )
	votingItemGlowEl:setImage( RegisterMaterial( "menu_motd_voteglow" ) )
	votingItemContainer:addElement( votingItemGlowEl )
	votingItemContainer.votingItemGlowEl = votingItemGlowEl
	
	if desc ~= nil then
		local delta = 10
		local votingItemDesc = LUI.UIText.new()
		votingItemDesc:setLeftRight( true, true, CoD.VotingPopup.ResultsXPosition, 0 )
		votingItemDesc:setTopBottom( false, true, -CoD.textSize.Condensed - delta, -delta )
		votingItemDesc:setFont( CoD.fonts.Condensed )
		votingItemDesc:setAlignment( LUI.Alignment.Left )
		votingItemDesc:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		votingItemDesc:setText( desc )
		votingItemContainer:addElement( votingItemDesc )
	end
	if caption ~= nil then
		local delta = -30
		local itemCaption = LUI.UIText.new()
		itemCaption:setLeftRight( true, true, 0, 0 )
		itemCaption:setTopBottom( false, true, -CoD.textSize.Condensed - delta, -delta )
		itemCaption:setFont( CoD.fonts.Condensed )
		itemCaption:setAlignment( LUI.Alignment.Center )
		itemCaption:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		itemCaption:setText( caption )
		votingItemContainer:addElement( itemCaption )
	end
end

CoD.VotingPopup.CreateLeftVotingElement = function ( centerElementContainer, leftVotingItem, desc, caption )
	local votingItemContainer = LUI.UIElement.new()
	votingItemContainer:registerAnimationState( "expand", {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = -CoD.VotingPopup.SelectedCenterElementContainerWidth - CoD.VotingPopup.VotingSelectedItemWidth,
		right = -CoD.VotingPopup.SelectedCenterElementContainerWidth,
		top = -CoD.VotingPopup.VotingSelectedItemHeight / 2,
		bottom = CoD.VotingPopup.VotingSelectedItemHeight / 2
	} )
	votingItemContainer:registerAnimationState( "default", {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = -CoD.VotingPopup.CenterElementContainerWidth - CoD.VotingPopup.VotingItemWidth,
		right = -CoD.VotingPopup.CenterElementContainerWidth,
		top = -CoD.VotingPopup.VotingItemHeight / 2,
		bottom = CoD.VotingPopup.VotingItemHeight / 2
	} )
	votingItemContainer:registerAnimationState( "fade_out", {
		alpha = CoD.VotingPopup.FadeAlpha
	} )
	votingItemContainer:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	votingItemContainer:animateToState( "default" )
	centerElementContainer:addElement( votingItemContainer )
	centerElementContainer.leftVotingItemContainer = votingItemContainer
	
	CoD.VotingPopup.CreateVotingItemElement( votingItemContainer, leftVotingItem.ImageName, desc, caption )
end

CoD.VotingPopup.CreateRightVotingElement = function ( centerElementContainer, rightVotingItem, desc, caption )
	local votingItemContainer = LUI.UIElement.new()
	votingItemContainer:registerAnimationState( "expand", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = CoD.VotingPopup.SelectedCenterElementContainerWidth,
		right = CoD.VotingPopup.VotingSelectedItemWidth + CoD.VotingPopup.SelectedCenterElementContainerWidth,
		top = -CoD.VotingPopup.VotingSelectedItemHeight / 2,
		bottom = CoD.VotingPopup.VotingSelectedItemHeight / 2
	} )
	votingItemContainer:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = CoD.VotingPopup.CenterElementContainerWidth,
		right = CoD.VotingPopup.VotingItemWidth + CoD.VotingPopup.CenterElementContainerWidth,
		top = -CoD.VotingPopup.VotingItemHeight / 2,
		bottom = CoD.VotingPopup.VotingItemHeight / 2
	} )
	votingItemContainer:registerAnimationState( "fade_out", {
		alpha = CoD.VotingPopup.FadeAlpha
	} )
	votingItemContainer:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	votingItemContainer:animateToState( "default" )
	centerElementContainer:addElement( votingItemContainer )
	centerElementContainer.rightVotingItemContainer = votingItemContainer
	
	CoD.VotingPopup.CreateVotingItemElement( votingItemContainer, rightVotingItem.ImageName, desc, caption )
end

CoD.VotingPopup.CreateTopVotingElement = function ( centerElementContainer, topVotingItem, desc, caption )
	local votingItemContainer = LUI.UIElement.new()
	votingItemContainer:registerAnimationState( "expand", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		left = -CoD.VotingPopup.VotingSelectedItemWidth / 2,
		right = CoD.VotingPopup.VotingSelectedItemWidth / 2,
		top = -CoD.VotingPopup.SelectedCenterElementContainerHeight - CoD.VotingPopup.VotingSelectedItemHeight,
		bottom = -CoD.VotingPopup.SelectedCenterElementContainerHeight
	} )
	votingItemContainer:registerAnimationState( "default", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		left = -CoD.VotingPopup.VotingItemWidth / 2,
		right = CoD.VotingPopup.VotingItemWidth / 2,
		top = -CoD.VotingPopup.CenterElementContainerHeight - CoD.VotingPopup.VotingItemHeight,
		bottom = -CoD.VotingPopup.CenterElementContainerHeight
	} )
	votingItemContainer:registerAnimationState( "fade_out", {
		alpha = CoD.VotingPopup.FadeAlpha
	} )
	votingItemContainer:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	votingItemContainer:animateToState( "default" )
	centerElementContainer:addElement( votingItemContainer )
	centerElementContainer.topVotingItemContainer = votingItemContainer
	
	CoD.VotingPopup.CreateVotingItemElement( votingItemContainer, topVotingItem.ImageName, desc, caption )
end

CoD.VotingPopup.CreateBottomVotingElement = function ( centerElementContainer, bottomVotingItem, desc, caption )
	local votingItemContainer = LUI.UIElement.new()
	votingItemContainer:registerAnimationState( "expand", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = -CoD.VotingPopup.VotingSelectedItemWidth / 2,
		right = CoD.VotingPopup.VotingSelectedItemWidth / 2,
		top = CoD.VotingPopup.SelectedCenterElementContainerHeight,
		bottom = CoD.VotingPopup.SelectedCenterElementContainerHeight + CoD.VotingPopup.VotingSelectedItemHeight
	} )
	votingItemContainer:registerAnimationState( "default", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = -CoD.VotingPopup.VotingItemWidth / 2,
		right = CoD.VotingPopup.VotingItemWidth / 2,
		top = CoD.VotingPopup.CenterElementContainerHeight,
		bottom = CoD.VotingPopup.CenterElementContainerHeight + CoD.VotingPopup.VotingItemHeight
	} )
	votingItemContainer:registerAnimationState( "fade_out", {
		alpha = CoD.VotingPopup.FadeAlpha
	} )
	votingItemContainer:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	votingItemContainer:animateToState( "default" )
	centerElementContainer:addElement( votingItemContainer )
	centerElementContainer.bottomVotingItemContainer = votingItemContainer
	
	CoD.VotingPopup.CreateVotingItemElement( votingItemContainer, bottomVotingItem.ImageName, desc, caption )
end

CoD.VotingPopup.HideGlow = function ( votingItemContainer )
	if votingItemContainer ~= nil and votingItemContainer.votingItemGlowEl ~= nil then
		votingItemContainer.votingItemGlowEl:setAlpha( 0 )
		votingItemContainer:animateToState( "default", 100, true, true )
		votingItemContainer:animateToState( "fade_in" )
	end
end

CoD.VotingPopup.SetDefaultCenterElementState = function ( centerContainer, event )
	CoD.VotingPopup.SetVotingArrowsOrange( centerContainer )
	centerContainer.selectElementContainer.textElement:setAlpha( 1 )
	centerContainer:dispatchEventToParent( {
		name = "change_to_default_controls",
		controller = event.controller
	} )
	centerContainer:dispatchEventToParent( {
		name = "change_title",
		controller = event.controller
	} )
	CoD.VotingPopup.PulseElement( centerContainer.selectElementContainer )
end

CoD.VotingPopup.ResetSelectedVoteGlow = function ( centerContainer, event )
	CoD.VotingPopup.HideGlow( centerContainer.leftVotingItemContainer )
	CoD.VotingPopup.HideGlow( centerContainer.rightVotingItemContainer )
	CoD.VotingPopup.HideGlow( centerContainer.topVotingItemContainer )
	CoD.VotingPopup.HideGlow( centerContainer.bottomVotingItemContainer )
end

CoD.VotingPopup.TriggerVoteSelectedEvent = function ( centerContainer, event )
	local directionx = centerContainer.directionx
	local directiony = centerContainer.directiony
	if event.button == "right" and centerContainer.rightVotingItemContainer and directionx ~= 1 then
		directionx = directionx + 1
		directiony = 0
		centerContainer:processEvent( {
			name = "resetSelectedVoteGlow",
			controller = event.controller
		} )
		centerContainer:processEvent( {
			name = "voteSelected",
			controller = event.controller,
			button = event.button
		} )
	elseif event.button == "left" and centerContainer.leftVotingItemContainer and directionx ~= -1 then
		directionx = directionx - 1
		directiony = 0
		centerContainer:processEvent( {
			name = "resetSelectedVoteGlow",
			controller = event.controller
		} )
		centerContainer:processEvent( {
			name = "voteSelected",
			controller = event.controller,
			button = event.button
		} )
	elseif event.button == "up" and centerContainer.topVotingItemContainer and directiony ~= -1 then
		directiony = directiony - 1
		directionx = 0
		centerContainer:processEvent( {
			name = "resetSelectedVoteGlow",
			controller = event.controller
		} )
		centerContainer:processEvent( {
			name = "voteSelected",
			controller = event.controller,
			button = event.button
		} )
	elseif event.button == "down" and centerContainer.bottomVotingItemContainer and directiony ~= 1 then
		directiony = directiony + 1
		directionx = 0
		centerContainer:processEvent( {
			name = "resetSelectedVoteGlow",
			controller = event.controller
		} )
		centerContainer:processEvent( {
			name = "voteSelected",
			controller = event.controller,
			button = event.button
		} )
	end
	if directionx == 0 and directiony == 0 then
		centerContainer:processEvent( {
			name = "resetSelectedVoteGlow",
			controller = event.controller
		} )
		centerContainer:processEvent( {
			name = "change_to_default_state",
			controller = event.controller
		} )
	end
	centerContainer.directionx = directionx
	centerContainer.directiony = directiony
end

CoD.VotingPopup.HandleGamepadButton = function ( centerContainer, event )
	if LUI.UIElement.handleGamepadButton( centerContainer, event ) == true then
		return true
	elseif event.down == true then
		CoD.VotingPopup.TriggerVoteSelectedEvent( centerContainer, event )
	end
end

CoD.VotingPopup.SetVotingArrowsWhite = function ( centerContainer )
	centerContainer.selectElementContainer.leftArrow:setImage( RegisterMaterial( "menu_motd_votearrow" ) )
	centerContainer.selectElementContainer.rightArrow:setImage( RegisterMaterial( "menu_motd_votearrow" ) )
	centerContainer.selectElementContainer.topArrow:setImage( RegisterMaterial( "menu_motd_votearrow" ) )
	centerContainer.selectElementContainer.bottomArrow:setImage( RegisterMaterial( "menu_motd_votearrow" ) )
end

CoD.VotingPopup.SetVotingArrowsOrange = function ( centerContainer )
	centerContainer.selectElementContainer.leftArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
	centerContainer.selectElementContainer.rightArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
	centerContainer.selectElementContainer.topArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
	centerContainer.selectElementContainer.bottomArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
end

CoD.VotingPopup.SetupSelectedItem = function ( centerContainer, votingItemContainer, itemData, buttonPressed )
	centerContainer.selectElementContainer.textElement:setAlpha( 0 )
	centerContainer.selectElementContainer:beginAnimation( "stop_pulsing", 1 )
	centerContainer.selectElementContainer:setAlpha( 1 )
	votingItemContainer:animateToState( "expand", 100, true, true )
	votingItemContainer.votingItemGlowEl:setAlpha( 1 )
	centerContainer.selectedCounterName = itemData.CounterName
	centerContainer.selectedItemName = itemData.VotingItemString
	centerContainer:dispatchEventToParent( {
		name = "change_title",
		itemName = itemData.VotingItemString
	} )
	if buttonPressed ~= "left" and centerContainer.leftVotingItemContainer ~= nil then
		centerContainer.leftVotingItemContainer:animateToState( "fade_out" )
	end
	if buttonPressed ~= "right" and centerContainer.rightVotingItemContainer ~= nil then
		centerContainer.rightVotingItemContainer:animateToState( "fade_out" )
	end
	if buttonPressed ~= "up" and centerContainer.topVotingItemContainer ~= nil then
		centerContainer.topVotingItemContainer:animateToState( "fade_out" )
	end
	if buttonPressed ~= "down" and centerContainer.bottomVotingItemContainer ~= nil then
		centerContainer.bottomVotingItemContainer:animateToState( "fade_out" )
	end
	CoD.VotingPopup.SetVotingArrowsWhite( centerContainer )
	Engine.PlaySound( "cac_grid_nav" )
end

CoD.VotingPopup.VoteSelected = function ( centerContainer, event )
	centerContainer:dispatchEventToParent( {
		name = "change_to_submission_controls",
		controller = event.controller
	} )
	if event.button == "left" and centerContainer.leftVotingItemContainer ~= nil then
		centerContainer.leftVotingItemContainer:close()
		CoD.VotingPopup.CreateLeftVotingElement( centerContainer, centerContainer.LeftVotingItem )
		CoD.VotingPopup.SetupSelectedItem( centerContainer, centerContainer.leftVotingItemContainer, centerContainer.LeftVotingItem, event.button )
	elseif event.button == "right" and centerContainer.rightVotingItemContainer ~= nil then
		centerContainer.rightVotingItemContainer:close()
		CoD.VotingPopup.CreateRightVotingElement( centerContainer, centerContainer.RightVotingItem )
		CoD.VotingPopup.SetupSelectedItem( centerContainer, centerContainer.rightVotingItemContainer, centerContainer.RightVotingItem, event.button )
	elseif event.button == "up" and centerContainer.topVotingItemContainer ~= nil then
		centerContainer.topVotingItemContainer:close()
		CoD.VotingPopup.CreateTopVotingElement( centerContainer, centerContainer.TopVotingItem )
		CoD.VotingPopup.SetupSelectedItem( centerContainer, centerContainer.topVotingItemContainer, centerContainer.TopVotingItem, event.button )
	elseif event.button == "down" and centerContainer.bottomVotingItemContainer ~= nil then
		centerContainer.bottomVotingItemContainer:close()
		CoD.VotingPopup.CreateBottomVotingElement( centerContainer, centerContainer.BottomVotingItem )
		CoD.VotingPopup.SetupSelectedItem( centerContainer, centerContainer.bottomVotingItemContainer, centerContainer.BottomVotingItem, event.button )
	end
end

CoD.VotingPopup.CreateCenterElement = function ( centerContainer )
	local selectElementContainer = LUI.UIElement.new()
	selectElementContainer:setLeftRight( false, false, -CoD.VotingPopup.SelectElementContainerWidth / 2, CoD.VotingPopup.SelectElementContainerWidth / 2 )
	selectElementContainer:setTopBottom( false, false, -CoD.VotingPopup.SelectElementContainerHeight / 2, CoD.VotingPopup.SelectElementContainerHeight / 2 )
	centerContainer:addElement( selectElementContainer )
	centerContainer.selectElementContainer = selectElementContainer
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( true, false, CoD.VotingPopup.SelectElementContainerWidth, CoD.VotingPopup.SelectElementContainerWidth + CoD.VotingPopup.ArrowWidth )
	rightArrow:setTopBottom( false, false, -CoD.VotingPopup.ArrowHeight / 2, CoD.VotingPopup.ArrowHeight / 2 )
	rightArrow:setZRot( 270 )
	rightArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
	selectElementContainer:addElement( rightArrow )
	selectElementContainer.rightArrow = rightArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( false, true, -CoD.VotingPopup.SelectElementContainerWidth - CoD.VotingPopup.ArrowWidth, -CoD.VotingPopup.SelectElementContainerWidth )
	leftArrow:setTopBottom( false, false, -CoD.VotingPopup.ArrowHeight / 2, CoD.VotingPopup.ArrowHeight / 2 )
	leftArrow:setZRot( 90 )
	leftArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
	selectElementContainer:addElement( leftArrow )
	selectElementContainer.leftArrow = leftArrow
	
	local topArrow = LUI.UIImage.new()
	topArrow:setLeftRight( false, false, -CoD.VotingPopup.ArrowWidth / 2, CoD.VotingPopup.ArrowWidth / 2 )
	topArrow:setTopBottom( false, true, -CoD.VotingPopup.SelectElementContainerHeight - CoD.VotingPopup.ArrowHeight, -CoD.VotingPopup.SelectElementContainerHeight )
	topArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
	selectElementContainer:addElement( topArrow )
	selectElementContainer.topArrow = topArrow
	
	local bottomArrow = LUI.UIImage.new()
	bottomArrow:setLeftRight( false, false, -CoD.VotingPopup.ArrowWidth / 2, CoD.VotingPopup.ArrowWidth / 2 )
	bottomArrow:setTopBottom( true, false, CoD.VotingPopup.SelectElementContainerHeight, CoD.VotingPopup.ArrowHeight + CoD.VotingPopup.SelectElementContainerHeight )
	bottomArrow:setImage( RegisterMaterial( "menu_motd_votearrow_glow" ) )
	bottomArrow:setZRot( 180 )
	selectElementContainer:addElement( bottomArrow )
	selectElementContainer.bottomArrow = bottomArrow
	
	CoD.VotingPopup.PulseElement( centerContainer.selectElementContainer )
end

CoD.VotingPopup.PulseDuration = 700
CoD.VotingPopup.PulseOutAlpha = 0.3
CoD.VotingPopup.PulseElement = function ( element )
	element:beginAnimation( "pulse_out", CoD.VotingPopup.PulseDuration )
	element:setAlpha( CoD.VotingPopup.PulseOutAlpha )
	element:registerEventHandler( "transition_complete_pulse_out", function ( element, event )
		if not event.interrupted then
			element:beginAnimation( "pulse_in", CoD.VotingPopup.PulseDuration )
			element:setAlpha( 1 )
		end
	end )
	element:registerEventHandler( "transition_complete_pulse_in", function ( element, event )
		if not event.interrupted then
			element:beginAnimation( "pulse_out", CoD.VotingPopup.PulseDuration )
			element:setAlpha( CoD.VotingPopup.PulseOutAlpha )
		end
	end )
end

CoD.VotingPopup.AddVotingItems = function ( votingPopup, controller, voteData )
	local centerElementContainer = LUI.UIElement.new()
	centerElementContainer:setLeftRight( false, false, -CoD.VotingPopup.CenterElementContainerWidth / 2, CoD.VotingPopup.CenterElementContainerWidth / 2 )
	centerElementContainer:setTopBottom( false, false, CoD.VotingPopup.CenterElementOffset - CoD.VotingPopup.CenterElementContainerHeight / 2, CoD.VotingPopup.CenterElementOffset + CoD.VotingPopup.CenterElementContainerHeight / 2 )
	centerElementContainer:registerEventHandler( "voteSelected", CoD.VotingPopup.VoteSelected )
	centerElementContainer:registerEventHandler( "resetSelectedVoteGlow", CoD.VotingPopup.ResetSelectedVoteGlow )
	centerElementContainer:registerEventHandler( "pulse_select_container", CoD.VotingPopup.PulseSelectContainer )
	centerElementContainer:registerEventHandler( "change_to_default_state", CoD.VotingPopup.SetDefaultCenterElementState )
	votingPopup:addElement( centerElementContainer )
	votingPopup.centerElementContainer = centerElementContainer
	
	centerElementContainer.handleGamepadButton = CoD.VotingPopup.HandleGamepadButton
	centerElementContainer.votingPopup = votingPopup
	CoD.VotingPopup.CreateCenterElement( centerElementContainer )
	CoD.VotingPopup.GetVotingItemsDetails( centerElementContainer, voteData.voteItems )
	local selectElementContainer = centerElementContainer.selectElementContainer
	
	local centerTextElement = LUI.UIText.new()
	centerTextElement:setLeftRight( true, true, 0, 0 )
	centerTextElement:setTopBottom( false, false, -CoD.textSize.ExtraSmall / 2, CoD.textSize.ExtraSmall / 2 )
	centerTextElement:setFont( CoD.fonts.ExtraSmall )
	centerTextElement:setAlignment( LUI.Alignment.Center )
	centerTextElement:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	centerTextElement:setText( voteData.voteforstring )
	selectElementContainer:addElement( centerTextElement )
	selectElementContainer.textElement = centerTextElement
	
	if centerElementContainer.LeftVotingItem ~= nil then
		CoD.VotingPopup.CreateLeftVotingElement( centerElementContainer, centerElementContainer.LeftVotingItem )
	end
	if centerElementContainer.RightVotingItem ~= nil then
		CoD.VotingPopup.CreateRightVotingElement( centerElementContainer, centerElementContainer.RightVotingItem )
	end
	if centerElementContainer.TopVotingItem ~= nil then
		CoD.VotingPopup.CreateTopVotingElement( centerElementContainer, centerElementContainer.TopVotingItem )
	end
	if centerElementContainer.BottomVotingItem ~= nil then
		CoD.VotingPopup.CreateBottomVotingElement( centerElementContainer, centerElementContainer.BottomVotingItem )
	end
end

CoD.VotingPopup.VoteSubmitted = function ( votingPopup, event )
	local counterName = votingPopup.centerElementContainer.selectedCounterName
	votingPopup.m_vote = counterName
	votingPopup.m_itemName = votingPopup.centerElementContainer.selectedItemName
	if counterName ~= nil then
		Engine.ExecNow( event.controller, "incrementCounter " .. counterName .. " " .. "1" )
		Engine.ExecNow( event.controller, "forceFlushCounterQueue" )
		Engine.ExecNow( event.controller, "setVote" )
	end
	CoD.VotingPopup.Close( votingPopup, event )
	if counterName ~= nil then
		CoD.VotingPopup.SendVotingRecordEvent( event.controller, "SUBMITTED", counterName )
	end
	Engine.PlaySound( "cac_grid_equip_item" )
end

CoD.VotingPopup.CreateControls = function ( votingPopup )
	votingPopup.backButton = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MENU_BACK" ), votingPopup, "button_prompt_back" )
	votingPopup.remindLater = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_VOTING_REMIND_LATER" ), votingPopup, "voting_remind_later" )
	votingPopup:registerEventHandler( "voting_remind_later", CoD.VotingPopup.RemindLater )
	votingPopup.vote = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_VOTING_VOTE_STRING" ), votingPopup, "vote_submit" )
	votingPopup:registerEventHandler( "vote_submit", CoD.VotingPopup.VoteSubmitted )
	votingPopup.voteSelection = CoD.ButtonPrompt.new( "dpad_all", Engine.Localize( "MENU_SELECT" ) )
	votingPopup.neverRemindAgain = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_VOTING_NEVER_REMIND_AGAIN" ), votingPopup, "voting_never_remind" )
	votingPopup:registerEventHandler( "voting_never_remind", CoD.VotingPopup.NeverRemind )
end

CoD.VotingPopup.AddDefaultControls = function ( votingPopup, event )
	votingPopup.leftButtonPromptBar:removeAllChildren()
	votingPopup.rightButtonPromptBar:removeAllChildren()
	local viewCount = votingPopup.viewCount
	if viewCount ~= nil then
		local viewCountstats = Engine.GetVotingMenuViewCount( event.controller )
		if viewCount <= viewCountstats then
			votingPopup:addRightButtonPrompt( votingPopup.neverRemindAgain )
		end
	end
	votingPopup:addLeftButtonPrompt( votingPopup.remindLater )
	votingPopup:addLeftButtonPrompt( votingPopup.backButton )
	votingPopup:addLeftButtonPrompt( votingPopup.voteSelection )
end

CoD.VotingPopup.AddVoteSubmissionControls = function ( votingPopup, event )
	votingPopup.leftButtonPromptBar:removeAllChildren()
	votingPopup:addLeftButtonPrompt( votingPopup.vote )
	votingPopup:addLeftButtonPrompt( votingPopup.backButton )
	votingPopup:addLeftButtonPrompt( votingPopup.voteSelection )
end

CoD.VotingPopup.NeverRemind = function ( votingPopup, event )
	Engine.ExecNow( event.controller, "setVoteOptOut" )
	CoD.VotingPopup.Close( votingPopup, event )
	CoD.VotingPopup.SendVotingRecordEvent( event.controller, "OPT_OUT" )
end

CoD.VotingPopup.SendVotingRecordEvent = function ( controller, eventType, votedItem )
	if votedItem ~= nil then
		Engine.SendVotingRecordEvent( controller, CoD.RECORD_EVENT_VOTE_MTX, eventType, votedItem )
	else
		Engine.SendVotingRecordEvent( controller, CoD.RECORD_EVENT_VOTE_MTX, eventType )
	end
end

CoD.VotingPopup.RemindLater = function ( votingPopup, event )
	CoD.VotingPopup.Close( votingPopup, event )
	CoD.VotingPopup.SendVotingRecordEvent( event.controller, "POSTPONED" )
end

CoD.VotingPopup.SetAndUploadVotingStats = function ( votingPopup, event )
	if votingPopup.version == nil then
		votingPopup.version = 0
	end
	Engine.ExecNow( event.controller, "setVotingMenuViewed " .. votingPopup.version )
	Engine.Exec( event.controller, "uploadstats" )
end

CoD.VotingPopup.Close = function ( votingPopup, event )
	CoD.VotingPopup.SetAndUploadVotingStats( votingPopup, event )
	if votingPopup.m_vote == nil then
		votingPopup:goBack()
		votingPopup.occludedMenu:processEvent( {
			name = "voting_popup_closed",
			controller = event.controller
		} )
	else
		local vote = votingPopup.m_vote
		local itemName = votingPopup.m_itemName
		local topVotingItem = votingPopup.centerElementContainer.TopVotingItem
		local leftVotingItem = votingPopup.centerElementContainer.LeftVotingItem
		local rightVotingItem = votingPopup.centerElementContainer.RightVotingItem
		local bottomVotingItem = votingPopup.centerElementContainer.BottomVotingItem
		local parentMenu = votingPopup.occludedMenu
		votingPopup:close()
		local voteConf = parentMenu:openPopup( "VotingConfirmation", event.controller )
		voteConf.m_vote = vote
		voteConf.m_itemName = itemName
		voteConf.TopVotingItem = topVotingItem
		voteConf.LeftVotingItem = leftVotingItem
		voteConf.RightVotingItem = rightVotingItem
		voteConf.BottomVotingItem = bottomVotingItem
		voteConf:setup()
	end
end

CoD.VotingPopup.ChangeTitle = function ( votingPopup, event )
	if event.itemName ~= nil then
		votingPopup.title:setText( Engine.Localize( "MENU_CONTEXTUAL_VOTING_TITLE", Engine.ToUpper( event.itemName ) ) )
	else
		votingPopup.title:setText( votingPopup.titleText )
	end
end

LUI.createMenu.VotingPopup = function ( controller )
	local votingPopup = CoD.Menu.New( "VotingPopup" )
	votingPopup:addLargePopupBackground()
	votingPopup:registerEventHandler( "change_to_submission_controls", CoD.VotingPopup.AddVoteSubmissionControls )
	votingPopup:registerEventHandler( "change_to_default_controls", CoD.VotingPopup.AddDefaultControls )
	votingPopup:registerEventHandler( "change_title", CoD.VotingPopup.ChangeTitle )
	local data = Engine.GetVotingData()
	if data.isValid == true then
		local y = CoD.VotingPopup.MessageTop
		votingPopup.titleText = data.title
		CoD.VotingPopup.AddTitle( votingPopup, data.title, y )
		CoD.VotingPopup.AddSubtitle( votingPopup, data.subtitle, y + CoD.textSize.Big + 10 )
		votingPopup.version = data.votingVersion
		CoD.VotingPopup.AddVotingItems( votingPopup, controller, data )
		votingPopup.centerElementContainer.directionx = 0
		votingPopup.centerElementContainer.directiony = 0
		votingPopup.viewCount = data.viewCount
		CoD.VotingPopup.CreateControls( votingPopup )
		local event = {
			controller = controller
		}
		CoD.VotingPopup.AddDefaultControls( votingPopup, event )
	end
	return votingPopup
end

