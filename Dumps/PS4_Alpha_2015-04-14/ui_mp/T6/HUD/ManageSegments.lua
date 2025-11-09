CoD.ManageSegments = {}
CoD.ManageSegments.SegmentButtonWidth = 140
CoD.ManageSegments.SegmentButtonHeight = 80
CoD.ManageSegments.SegmentButtonSpacing = 15
CoD.ManageSegments.MaxSegments = 20
CoD.ManageSegments.MaxSegmentsPerRow = 4
CoD.ManageSegments.MaxSegmentsButtonTopOffset = -20
CoD.ManageSegments.NumRows = CoD.ManageSegments.MaxSegments / CoD.ManageSegments.MaxSegmentsPerRow
CoD.ManageSegments.TotalWidth = CoD.ManageSegments.MaxSegmentsPerRow * CoD.ManageSegments.SegmentButtonWidth + (CoD.ManageSegments.MaxSegmentsPerRow - 1) * CoD.ManageSegments.SegmentButtonSpacing
CoD.ManageSegments.TotalHeight = CoD.ManageSegments.SegmentButtonHeight * CoD.ManageSegments.NumRows + CoD.ManageSegments.SegmentButtonSpacing * (CoD.ManageSegments.NumRows - 1)
CoD.ManageSegments.TimelineHeight = 8
CoD.ManageSegments.TimelineToButtonGridSpacing = 25
CoD.ManageSegments.TimelineBlockSpacing = 3
CoD.ManageSegments.TimelineTop = CoD.ManageSegments.TotalHeight / 2 + CoD.ManageSegments.TimelineToButtonGridSpacing - CoD.ManageSegments.TimelineHeight
CoD.ManageSegments.TimelineMarkerWidth = 1
CoD.ManageSegments.TimelineMarkerHeight = 20
CoD.ManageSegments.InformationDisplayWidth = 250
CoD.ManageSegments.InformationDisplayToGridSpacing = 30
CoD.ManageSegments.SelectedSegmentIndex = nil
CoD.ManageSegments.FocussedSegmentIndex = nil
CoD.ManageSegments.MaxStars = 5
CoD.ManageSegments.StarRatingIconSize = 20
CoD.ManageSegments.Open = function ( self, event )
	local manageSegmentsMenu = self:openPopup( "Demo_Manage_Segments", event.controller )
	if Engine.IsDemoShoutcaster() == true and self.SpectateHUD ~= nil then
		self.SpectateHUD:processEvent( {
			name = "spectate_ingame_menu_opened",
			controller = event.controller
		} )
	end
	if nil ~= CoD.ManageSegments.SelectedSegmentIndex then
		local segmentIndex = CoD.ManageSegments.SelectedSegmentIndex
		CoD.ManageSegments.SelectedSegmentIndex = nil
		manageSegmentsMenu.manageSegmentsGrid[segmentIndex + 1]:processEvent( {
			name = "gain_focus",
			controller = event.controller
		} )
		ManageSegments_RefreshButtonPrompts( manageSegmentsMenu, true )
	end
	manageSegmentsMenu.directlyOnHUD = true
end

local ManageSegments_Back = function ( self, event )
	local segmentIndex = CoD.ManageSegments.SelectedSegmentIndex
	if event.name == "button_prompt_back" and segmentIndex ~= nil then
		CoD.ManageSegments.SelectedSegmentIndex = nil
		self:processEvent( {
			name = "manage_segments_refresh",
			controller = controller
		} )
	elseif event.name == "preview_clip" or event.name == "preview_segment" then
		self:setPreviousMenu( nil )
		CoD.InGameMenu.BackButtonPressed( self, event )
	elseif self.directlyOnHUD == true then
		CoD.ManageSegments.SelectedSegmentIndex = nil
		local demoIngame = self:openMenu( "Demo_InGame", event.controller )
		demoIngame:setPreviousMenu( nil )
		self:close()
	else
		CoD.ManageSegments.SelectedSegmentIndex = nil
		CoD.InGameMenu.BackButtonPressed( self, event )
	end
	if segmentIndex == nil then
		Engine.Exec( event.controller, "resetThumbnailViewer" )
	end
end

local ManageSegments_PreviewClip = function ( self, event )
	ManageSegments_Back( self, event )
	Engine.Exec( event.controller, "demo_previewclip" )
end

local ManageSegments_OpenClipOptions = function ( self, event )
	self:openPopup( "ClipOptions", event.controller )
end

function ManageSegments_RefreshButtonPrompts( self, addButtonPrompts )
	self.rightBottomButtonBar.selectButton:close()
	self.rightBottomButtonBar.previewButton:close()
	self.rightBottomButtonBar.clipOptionsButton:close()
	self.rightBottomButtonBar.placeSegmentButton:close()
	self.rightBottomButtonBar.moveSegmentButton:close()
	if Engine.GetDemoSegmentCount() > 0 and addButtonPrompts then
		if CoD.ManageSegments.SelectedSegmentIndex == nil then
			self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.selectButton )
			self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.previewButton )
			self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.clipOptionsButton )
		else
			self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.placeSegmentButton )
			self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.moveSegmentButton )
		end
	end
end

local ManageSegments_AddButtonPrompts = function ( self )
	self.rightBottomButtonBar = LUI.UIHorizontalList.new( {
		left = 250,
		top = -CoD.ButtonPrompt.Height,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 15,
		alignment = LUI.Alignment.Left
	} )
	self:addElement( self.rightBottomButtonBar )
	self.rightBottomButtonBar.selectButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_SELECT_SEGMENT" ), self )
	self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.selectButton )
	self.rightBottomButtonBar.previewButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_PREVIEW_CLIP" ), self, "preview_clip", false, nil, false, nil, "P" )
	self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.previewButton )
	self.rightBottomButtonBar.clipOptionsButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_CLIP_OPTIONS" ), self, "open_clip_options", false, nil, false, nil, "O" )
	self.rightBottomButtonBar:addElement( self.rightBottomButtonBar.clipOptionsButton )
	self.rightBottomButtonBar.placeSegmentButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_PLACE_SEGMENT" ), self )
	self.rightBottomButtonBar.moveSegmentButton = CoD.ButtonPrompt.new( "dpad_all", Engine.Localize( "MENU_MOVE_SEGMENT" ), self )
end

local ManageSegments_AddTimeline = function ( self )
	local segmentCount = Engine.GetDemoSegmentCount()
	local totalClipDuration = Engine.GetDemoSegmentInformation( 0, "totalClipDuration" )
	local timelineTotalWidthForAllBlocks = CoD.ManageSegments.TotalWidth - CoD.ManageSegments.TimelineBlockSpacing * (segmentCount - 1)
	local timelineWidthPerBlock = timelineTotalWidthForAllBlocks / segmentCount
	local timelineTop = CoD.ManageSegments.TimelineTop
	if segmentCount <= 0 then
		return 
	end
	self.timelineContainer = LUI.UIContainer.new()
	self:addElement( self.timelineContainer )
	local startLine = LUI.UIImage.new()
	startLine:setLeftRight( true, false, 0, CoD.ManageSegments.TimelineMarkerWidth )
	startLine:setTopBottom( false, false, timelineTop + CoD.ManageSegments.TimelineHeight - CoD.ManageSegments.TimelineMarkerHeight / 2, timelineTop + CoD.ManageSegments.TimelineHeight + CoD.ManageSegments.TimelineMarkerHeight / 2 )
	startLine:setRGB( 1, 1, 1 )
	startLine:setAlpha( 1 )
	self.timelineContainer:addElement( startLine )
	local time = "00:00"
	local startLineText = LUI.UIText.new()
	startLineText:setLeftRight( true, false, -15, 100 )
	startLineText:setTopBottom( false, false, timelineTop + CoD.ManageSegments.TimelineHeight + 8, timelineTop + CoD.ManageSegments.TimelineHeight + 8 + CoD.textSize.ExtraSmall )
	startLineText:setRGB( 1, 1, 1 )
	startLineText:setAlpha( 1 )
	startLineText:setFont( CoD.fonts.ExtraSmall )
	startLineText:setText( time )
	self.timelineContainer:addElement( startLineText )
	local endLine = LUI.UIImage.new()
	endLine:setLeftRight( true, false, CoD.ManageSegments.TotalWidth, CoD.ManageSegments.TotalWidth + CoD.ManageSegments.TimelineMarkerWidth )
	endLine:setTopBottom( false, false, timelineTop + CoD.ManageSegments.TimelineHeight - CoD.ManageSegments.TimelineMarkerHeight / 2, timelineTop + CoD.ManageSegments.TimelineHeight + CoD.ManageSegments.TimelineMarkerHeight / 2 )
	endLine:setRGB( 1, 1, 1 )
	endLine:setAlpha( 1 )
	self.timelineContainer:addElement( endLine )
	local endLineText = LUI.UIText.new()
	endLineText:setLeftRight( true, false, CoD.ManageSegments.TotalWidth - 15, CoD.ManageSegments.TotalWidth + 100 )
	endLineText:setTopBottom( false, false, timelineTop + CoD.ManageSegments.TimelineHeight + 8, timelineTop + CoD.ManageSegments.TimelineHeight + 8 + CoD.textSize.ExtraSmall )
	endLineText:setRGB( 1, 1, 1 )
	endLineText:setAlpha( 1 )
	endLineText:setFont( CoD.fonts.ExtraSmall )
	endLineText:setText( Engine.GetDemoSegmentInformation( 0, "totalClipDurationTimeDisplay" ) )
	self.timelineContainer:addElement( endLineText )
	self.timelineContainer.timeline = LUI.UIHorizontalList.new()
	self.timelineContainer.timeline:setLeftRight( true, false, 0, CoD.ManageSegments.TotalWidth )
	self.timelineContainer.timeline:setTopBottom( false, false, timelineTop, timelineTop + CoD.ManageSegments.TimelineHeight )
	self.timelineContainer.timeline:setSpacing( CoD.ManageSegments.TimelineBlockSpacing )
	self.timelineContainer:addElement( self.timelineContainer.timeline )
	local borderWidth = 2
	for i = 1, segmentCount, 1 do
		local segmentDuration = Engine.GetDemoSegmentInformation( i - 1, "duration" )
		local blockWidth = segmentDuration / totalClipDuration * timelineTotalWidthForAllBlocks
		local container = LUI.UIContainer.new()
		container:setLeftRight( true, false, 0, blockWidth )
		container:setTopBottom( true, false, 0, CoD.ManageSegments.TimelineHeight )
		container.image = LUI.UIImage.new()
		container.image:setLeftRight( true, true, borderWidth / 2, -borderWidth / 2 )
		container.image:setTopBottom( true, true, borderWidth / 2, -borderWidth / 2 )
		container.image:setRGB( 1, 1, 1 )
		container.image:setAlpha( 1 )
		container:addElement( container.image )
		container.border = CoD.BorderT6.new( borderWidth, 0.9, 0.5, 0.1 )
		container:addElement( container.border )
		self.timelineContainer.timeline[i] = container
		self.timelineContainer.timeline:addElement( container )
	end
end

local ManageSegments_SegmentInformationDisplay_Refresh = function ( self )
	if self.segmentInformationDisplay.segmentIndex == nil or self.segmentInformationDisplay.segmentIndex < 0 then
		self.segmentInformationDisplay.segmentNameText:setAlpha( 0 )
		self.segmentInformationDisplay.segmentDurationText:setAlpha( 0 )
		self.segmentInformationDisplay.segmentTransitionText:setAlpha( 0 )
		if Engine.IsDemoHighlightReelMode() then
			for i = 1, CoD.ManageSegments.MaxStars, 1 do
				self.segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 0 )
				self.segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 0 )
			end
		end
	elseif nil ~= CoD.ManageSegments.SelectedSegmentIndex then
		local segmentName = Engine.GetDemoSegmentInformation( CoD.ManageSegments.SelectedSegmentIndex, "name" )
		if self.segmentInformationDisplay.segmentIndex == CoD.ManageSegments.SelectedSegmentIndex then
			self.segmentInformationDisplay.segmentNameText:setText( Engine.Localize( "MENU_MOVING_SEGMENT_SELECT_NEW_SPOT", segmentName ) )
		elseif self.manageSegmentsGrid[self.segmentInformationDisplay.segmentIndex + 1].filled then
			self.segmentInformationDisplay.segmentNameText:setText( Engine.Localize( "MENU_PLACE_SEGMENT_AT_TIMELINE_POSITION", segmentName, self.segmentInformationDisplay.segmentIndex + 1 ) )
		else
			self.segmentInformationDisplay.segmentNameText:setText( Engine.Localize( "MENU_CANNOT_PLACE_SEGMENT_IN_TIMELINE", segmentName ) )
		end
		self.segmentInformationDisplay.segmentNameText:setAlpha( 1 )
		self.segmentInformationDisplay.segmentDurationText:setAlpha( 0 )
		self.segmentInformationDisplay.segmentTransitionText:setAlpha( 0 )
		if Engine.IsDemoHighlightReelMode() then
			for i = 1, CoD.ManageSegments.MaxStars, 1 do
				self.segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 0 )
				self.segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 0 )
			end
		end
	elseif self.manageSegmentsGrid[self.segmentInformationDisplay.segmentIndex + 1].filled then
		local segmentName = Engine.GetDemoSegmentInformation( self.segmentInformationDisplay.segmentIndex, "name" )
		self.segmentInformationDisplay.segmentNameText:setText( segmentName )
		self.segmentInformationDisplay.segmentNameText:setAlpha( 1 )
		local durationString = Engine.GetDemoSegmentInformation( self.segmentInformationDisplay.segmentIndex, "durationLocString" )
		self.segmentInformationDisplay.segmentDurationText:setText( durationString )
		self.segmentInformationDisplay.segmentDurationText:setAlpha( 1 )
		local segmentCount = Engine.GetDemoSegmentCount()
		if self.segmentInformationDisplay.segmentIndex ~= Engine.GetDemoSegmentCount() - 1 then
			local transition = Engine.GetDemoSegmentInformation( self.segmentInformationDisplay.segmentIndex, "transition" )
			self.segmentInformationDisplay.segmentTransitionText:setText( Engine.Localize( "MENU_TRANSITION" ) .. transition )
			self.segmentInformationDisplay.segmentTransitionText:setAlpha( 1 )
		else
			self.segmentInformationDisplay.segmentTransitionText:setAlpha( 0 )
		end
		if Engine.IsDemoHighlightReelMode() then
			local segmentScore = tonumber( Engine.GetDemoSegmentInformation( self.segmentInformationDisplay.segmentIndex, "score" ) )
			if segmentScore ~= nil and segmentScore > 0 then
				local segmentStars = tonumber( Engine.GetDemoSegmentInformation( self.segmentInformationDisplay.segmentIndex, "stars" ) )
				if segmentStars ~= nil and segmentStars > 0 then
					for i = 1, CoD.ManageSegments.MaxStars, 1 do
						if i <= segmentStars then
							self.segmentInformationDisplay.starsContainerOverlay[i]:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
							self.segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 1 )
							self.segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 0 )
						end
						if segmentStars < i and i <= segmentStars + 0.5 then
							self.segmentInformationDisplay.starsContainerOverlay[i]:setImage( RegisterMaterial( "menu_mp_star_rating_half" ) )
							self.segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 1 )
							self.segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 1 )
						else
							self.segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 0 )
							self.segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 1 )
						end
					end
				end
			else
				for i = 1, CoD.ManageSegments.MaxStars, 1 do
					self.segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 0 )
					self.segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 0 )
				end
			end
		end
	else
		self.segmentInformationDisplay.segmentNameText:setAlpha( 0 )
		self.segmentInformationDisplay.segmentDurationText:setAlpha( 0 )
		self.segmentInformationDisplay.segmentTransitionText:setAlpha( 0 )
		if Engine.IsDemoHighlightReelMode() then
			for i = 1, CoD.ManageSegments.MaxStars, 1 do
				self.segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 0 )
				self.segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 0 )
			end
		end
	end
end

local ManageSegments_AddSegmentInformationDisplay = function ( self )
	local segmentInformationDisplay = LUI.UIVerticalList.new()
	segmentInformationDisplay:setLeftRight( true, false, CoD.ManageSegments.TotalWidth + CoD.ManageSegments.InformationDisplayToGridSpacing, CoD.ManageSegments.TotalWidth + CoD.ManageSegments.InformationDisplayToGridSpacing + CoD.ManageSegments.InformationDisplayWidth )
	segmentInformationDisplay:setTopBottom( false, false, -CoD.ManageSegments.TotalHeight / 2, CoD.ManageSegments.TotalHeight / 2 )
	segmentInformationDisplay:setSpacing( 5 )
	segmentInformationDisplay.segmentNameText = LUI.UIText.new()
	segmentInformationDisplay.segmentNameText:setLeftRight( true, false, 0, CoD.ManageSegments.InformationDisplayWidth )
	segmentInformationDisplay.segmentNameText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	segmentInformationDisplay.segmentNameText:setFont( CoD.fonts.Default )
	segmentInformationDisplay.segmentNameText:setAlignment( LUI.Alignment.Left )
	segmentInformationDisplay:addElement( segmentInformationDisplay.segmentNameText )
	segmentInformationDisplay.segmentDurationText = LUI.UIText.new()
	segmentInformationDisplay.segmentDurationText:setLeftRight( true, false, 0, CoD.ManageSegments.InformationDisplayWidth )
	segmentInformationDisplay.segmentDurationText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	segmentInformationDisplay.segmentDurationText:setFont( CoD.fonts.Default )
	segmentInformationDisplay:addElement( segmentInformationDisplay.segmentDurationText )
	if Engine.IsDemoHighlightReelMode() then
		segmentInformationDisplay.starsContainer = LUI.UIContainer.new()
		segmentInformationDisplay.starsContainer:setLeftRight( true, false, 0, CoD.ManageSegments.InformationDisplayWidth )
		segmentInformationDisplay.starsContainer:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
		segmentInformationDisplay:addElement( segmentInformationDisplay.starsContainer )
		segmentInformationDisplay.starsContainerUnderlay = LUI.UIHorizontalList.new()
		segmentInformationDisplay.starsContainerUnderlay:setLeftRight( true, true, 0, 0 )
		segmentInformationDisplay.starsContainerUnderlay:setTopBottom( true, true, 0, 0 )
		segmentInformationDisplay.starsContainerUnderlay:setSpacing( 5 )
		for i = 1, CoD.ManageSegments.MaxStars, 1 do
			segmentInformationDisplay.starsContainerUnderlay[i] = LUI.UIImage.new()
			segmentInformationDisplay.starsContainerUnderlay[i]:setLeftRight( true, false, 0, CoD.ManageSegments.StarRatingIconSize )
			segmentInformationDisplay.starsContainerUnderlay[i]:setTopBottom( false, false, -CoD.ManageSegments.StarRatingIconSize / 2, CoD.ManageSegments.StarRatingIconSize / 2 )
			segmentInformationDisplay.starsContainerUnderlay[i]:setImage( RegisterMaterial( "menu_mp_star_rating_empty" ) )
			segmentInformationDisplay.starsContainerUnderlay[i]:setRGB( 0.3, 0.3, 0.3 )
			segmentInformationDisplay.starsContainerUnderlay[i]:setAlpha( 0 )
			segmentInformationDisplay.starsContainerUnderlay:addElement( segmentInformationDisplay.starsContainerUnderlay[i] )
		end
		segmentInformationDisplay.starsContainer:addElement( segmentInformationDisplay.starsContainerUnderlay )
		segmentInformationDisplay.starsContainerOverlay = LUI.UIHorizontalList.new()
		segmentInformationDisplay.starsContainerOverlay:setLeftRight( true, true, 0, 0 )
		segmentInformationDisplay.starsContainerOverlay:setTopBottom( true, true, 0, 0 )
		segmentInformationDisplay.starsContainerOverlay:setSpacing( 5 )
		for i = 1, CoD.ManageSegments.MaxStars, 1 do
			segmentInformationDisplay.starsContainerOverlay[i] = LUI.UIImage.new()
			segmentInformationDisplay.starsContainerOverlay[i]:setLeftRight( true, false, 0, CoD.ManageSegments.StarRatingIconSize )
			segmentInformationDisplay.starsContainerOverlay[i]:setTopBottom( false, false, -CoD.ManageSegments.StarRatingIconSize / 2, CoD.ManageSegments.StarRatingIconSize / 2 )
			segmentInformationDisplay.starsContainerOverlay[i]:setRGB( 1, 1, 0 )
			segmentInformationDisplay.starsContainerOverlay[i]:setAlpha( 0 )
			segmentInformationDisplay.starsContainerOverlay:addElement( segmentInformationDisplay.starsContainerOverlay[i] )
		end
		segmentInformationDisplay.starsContainer:addElement( segmentInformationDisplay.starsContainerOverlay )
	end
	segmentInformationDisplay.segmentTransitionText = LUI.UIText.new()
	segmentInformationDisplay.segmentTransitionText:setLeftRight( true, false, 0, CoD.ManageSegments.InformationDisplayWidth )
	segmentInformationDisplay.segmentTransitionText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	segmentInformationDisplay.segmentTransitionText:setFont( CoD.fonts.Default )
	segmentInformationDisplay:addElement( segmentInformationDisplay.segmentTransitionText )
	self.segmentInformationDisplay = segmentInformationDisplay
	
	self:addElement( segmentInformationDisplay )
end

local ManageSegments_SegmentButton_RefreshState = function ( self, focussed )
	if not focussed then
		if self.segmentIndex == CoD.ManageSegments.SelectedSegmentIndex then
			self.bgImage:setRGB( 0.9, 0.5, 0.1 )
			self.bgImage:setAlpha( 0.2 )
			self.buttonTextBackground:setRGB( 0, 0, 0 )
			self.buttonTextBackground:setAlpha( 0.7 )
			self.buttonText:setRGB( 1, 1, 1 )
			self.buttonText:setAlpha( 1 )
		elseif self.filled then
			self.border:setAlpha( 0 )
			self.bgImage:setRGB( 1, 1, 1 )
			self.bgImage:setAlpha( 0.5 )
			self.buttonTextBackground:setRGB( 0, 0, 0 )
			self.buttonTextBackground:setAlpha( 0.7 )
			self.buttonText:setRGB( 1, 1, 1 )
			self.buttonText:setAlpha( 1 )
			if self.menu.timelineContainer ~= nil then
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].border:setAlpha( 0 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].image:setRGB( 1, 1, 1 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].image:setAlpha( 1 )
			end
		else
			self.border:setRGB( 1, 1, 1 )
			self.border:setAlpha( 0.3 )
			self.bgImage:setAlpha( 0 )
			self.buttonTextBackground:setAlpha( 0 )
			self.buttonText:setRGB( 1, 1, 1 )
			self.buttonText:setAlpha( 0.3 )
		end
		self.focussed = false
	else
		if self.segmentIndex == CoD.ManageSegments.SelectedSegmentIndex then
			self.bgImage:setRGB( 0.9, 0.5, 0.1 )
			self.bgImage:setAlpha( 0.2 )
			self.buttonTextBackground:setRGB( 0, 0, 0 )
			self.buttonTextBackground:setAlpha( 0.7 )
			self.buttonText:setRGB( 1, 1, 1 )
			self.buttonText:setAlpha( 1 )
			if self.menu.timelineContainer ~= nil then
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].border:setRGB( 0.9, 0.5, 0.1 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].border:setAlpha( 1 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].image:setRGB( 0.9, 0.5, 0.1 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].image:setAlpha( 1 )
			end
			self.menu.segmentInformationDisplay.segmentIndex = self.segmentIndex
			ManageSegments_SegmentInformationDisplay_Refresh( self.menu )
		elseif self.filled then
			self.border:setRGB( 0.9, 0.5, 0.1 )
			self.border:setAlpha( 1 )
			self.bgImage:setRGB( 1, 1, 1 )
			self.bgImage:setAlpha( 1 )
			self.buttonTextBackground:setRGB( 0, 0, 0 )
			self.buttonTextBackground:setAlpha( 0.7 )
			self.buttonText:setRGB( 0.9, 0.5, 0.1 )
			self.buttonText:setAlpha( 1 )
			if self.menu.timelineContainer ~= nil then
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].border:setRGB( 0.9, 0.5, 0.1 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].border:setAlpha( 1 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].image:setRGB( 1, 1, 1 )
				self.menu.timelineContainer.timeline[self.segmentIndex + 1].image:setAlpha( 1 )
			end
			self.menu.segmentInformationDisplay.segmentIndex = self.segmentIndex
			ManageSegments_SegmentInformationDisplay_Refresh( self.menu )
		else
			self.border:setRGB( 0.9, 0.5, 0.1 )
			self.border:setAlpha( 0.8 )
			self.bgImage:setAlpha( 0 )
			self.buttonTextBackground:setAlpha( 0 )
			self.buttonText:setRGB( 0.9, 0.5, 0.1 )
			self.buttonText:setAlpha( 1 )
			self.menu.segmentInformationDisplay.segmentIndex = self.segmentIndex
			ManageSegments_SegmentInformationDisplay_Refresh( self.menu )
		end
		self.focussed = true
	end
end

local ManageSegments_SegmentButton_GainFocus = function ( self, event )
	ManageSegments_SegmentButton_RefreshState( self, true )
	return LUI.UIButton.gainFocus( self, event )
end

local ManageSegments_SegmentButton_LoseFocus = function ( self, event )
	ManageSegments_SegmentButton_RefreshState( self, false )
	LUI.UIButton.loseFocus( self, event )
end

local ManageSegments_RefreshTimeline = function ( self )
	if self.timelineContainer ~= nil then
		self.timelineContainer:close()
	end
	ManageSegments_AddTimeline( self )
end

local ManageSegments_SegmentButton_Select = function ( self, event )
	local selectedButton, segmentIndex = nil
	local menu = self:getParent()
	local controller = menu.m_ownerController
	local segmentCount = Engine.GetDemoSegmentCount()
	for i = 1, segmentCount, 1 do
		if self[i].focussed then
			selectedButton = self[i]
		end
	end
	if selectedButton == nil then
		return 
	end
	segmentIndex = selectedButton.segmentIndex
	if nil == CoD.ManageSegments.SelectedSegmentIndex then
		local userData = {
			segmentIndex = segmentIndex
		}
		menu:openPopup( "SegmentOptions", controller, userData )
		ManageSegments_RefreshButtonPrompts( menu, false )
	else
		local previousSegment = CoD.ManageSegments.SelectedSegmentIndex
		CoD.ManageSegments.SelectedSegmentIndex = nil
		if previousSegment ~= segmentIndex then
			ManageSegments_SegmentButton_LoseFocus( self[previousSegment + 1], event )
			Engine.ExecNow( menu:getOwner(), "demo_movesegment " .. previousSegment .. " " .. segmentIndex )
		end
		menu:processEvent( {
			name = "manage_segments_refresh",
			controller = controller
		} )
	end
end

local ManageSegments_AddSegmentButton = function ( self, index, row )
	local segmentCount = Engine.GetDemoSegmentCount()
	local buttonState = {
		left = 0,
		right = CoD.ManageSegments.SegmentButtonWidth,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = CoD.ManageSegments.SegmentButtonHeight,
		topAnchor = true,
		bottomAnchor = false
	}
	local button = LUI.UIButton.new( buttonState, "segment_button_select" )
	button.id = "Manage_Segments_Button" .. index
	button.segmentIndex = (row - 1) * CoD.ManageSegments.MaxSegmentsPerRow + index - 1
	button.menu = self
	if button.segmentIndex < segmentCount then
		button.filled = true
	else
		button.filled = false
	end
	button.border = CoD.BorderT6.new( 2, 1, 1, 1 )
	button:addElement( button.border )
	button.bgImage = LUI.UIImage.new()
	button.bgImage:setLeftRight( true, true, 2, -2 )
	button.bgImage:setTopBottom( true, true, 2, -2 )
	button.bgImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, tostring( button.segmentIndex + 1 ) )
	button:addElement( button.bgImage )
	local buttonText = button.segmentIndex + 1
	local f15_local0 = {}
	local buttonTextDimensions = GetTextDimensions( buttonText, CoD.fonts.Default, CoD.textSize.Default )
	local buttonTextWidth = buttonTextDimensions[3]
	local backgroundWidth = CoD.textSize.Default
	local buttonTextContainer = LUI.UIContainer.new()
	buttonTextContainer:setLeftRight( true, false, 2, 2 + CoD.textSize.Default )
	buttonTextContainer:setTopBottom( true, false, 2, 2 + CoD.textSize.Default )
	button:addElement( buttonTextContainer )
	button.buttonTextBackground = LUI.UIImage.new()
	button.buttonTextBackground:setLeftRight( true, true, 0, 0 )
	button.buttonTextBackground:setTopBottom( true, true, 0, 0 )
	buttonTextContainer:addElement( button.buttonTextBackground )
	button.buttonText = LUI.UIText.new()
	button.buttonText:setLeftRight( false, false, -buttonTextWidth / 2, buttonTextWidth / 2 )
	button.buttonText:setTopBottom( false, false, -CoD.textSize.Default / 2 - 1, CoD.textSize.Default / 2 - 1 )
	button.buttonText:setFont( CoD.fonts.Default )
	button.buttonText:setText( buttonText )
	buttonTextContainer:addElement( button.buttonText )
	button:registerEventHandler( "gain_focus", ManageSegments_SegmentButton_GainFocus )
	button:registerEventHandler( "lose_focus", ManageSegments_SegmentButton_LoseFocus )
	button:registerEventHandler( "segment_button_select", ManageSegments_SegmentButton_Select )
	return button
end

local ManageSegments_AddButtons = function ( self )
	local numRows = CoD.ManageSegments.NumRows
	local gridState = {
		left = 0,
		right = CoD.ManageSegments.TotalWidth,
		leftAnchor = true,
		rightAnchor = false,
		top = -CoD.ManageSegments.TotalHeight / 2 + CoD.ManageSegments.MaxSegmentsButtonTopOffset,
		bottom = CoD.ManageSegments.TotalHeight / 2 + CoD.ManageSegments.MaxSegmentsButtonTopOffset,
		topAnchor = false,
		bottomAnchor = false
	}
	local manageSegmentsGrid = LUI.UIGridList.new( gridState, numRows, CoD.ManageSegments.MaxSegmentsPerRow )
	manageSegmentsGrid:setSpacing( CoD.ManageSegments.SegmentButtonSpacing )
	manageSegmentsGrid:setGridRowHeight( CoD.ManageSegments.SegmentButtonHeight )
	manageSegmentsGrid.chainRows = true
	self.manageSegmentsGrid = manageSegmentsGrid
	for row = 1, numRows, 1 do
		for col = 1, CoD.ManageSegments.MaxSegmentsPerRow, 1 do
			local button = ManageSegments_AddSegmentButton( self, col, row )
			manageSegmentsGrid[button.segmentIndex + 1] = button
			manageSegmentsGrid:addElementToRow( button, row )
		end
	end
	if CoD.ManageSegments.SelectedSegmentIndex == nil then
		manageSegmentsGrid:processEvent( {
			name = "gain_focus"
		} )
	end
	manageSegmentsGrid:registerEventHandler( "segment_button_select", ManageSegments_SegmentButton_Select )
	self:addElement( manageSegmentsGrid )
end

local ManageSegments_Refresh = function ( self, event )
	local segmentCount = Engine.GetDemoSegmentCount()
	if CoD.ManageSegments.SelectedSegmentIndex ~= nil and segmentCount <= CoD.ManageSegments.SelectedSegmentIndex then
		CoD.ManageSegments.SelectedSegmentIndex = nil
	end
	ManageSegments_RefreshTimeline( self )
	for i = 1, CoD.ManageSegments.MaxSegments, 1 do
		local button = self.manageSegmentsGrid[i]
		if button.segmentIndex < segmentCount then
			button.filled = true
		else
			button.filled = false
		end
		ManageSegments_SegmentButton_RefreshState( button, button.focussed )
	end
	ManageSegments_RefreshButtonPrompts( self, true )
end

LUI.createMenu.Demo_Manage_Segments = function ( controller )
	local menu = CoD.InGameMenu.New( "Demo_Manage_Segments", controller, Engine.ToUpper( Engine.Localize( "MENU_DEMO_MANAGE_SEGMENTS" ) ) )
	menu:addBackButton()
	menu:registerEventHandler( "button_prompt_back", ManageSegments_Back )
	menu:registerEventHandler( "button_prompt_start", ManageSegments_Back )
	menu:registerEventHandler( "preview_clip", ManageSegments_PreviewClip )
	menu:registerEventHandler( "open_clip_options", ManageSegments_OpenClipOptions )
	menu:registerEventHandler( "manage_segments_refresh", ManageSegments_Refresh )
	ManageSegments_AddTimeline( menu )
	ManageSegments_AddSegmentInformationDisplay( menu )
	ManageSegments_AddButtons( menu )
	ManageSegments_AddButtonPrompts( menu )
	menu:processEvent( {
		name = "manage_segments_refresh",
		controller = controller
	} )
	Engine.Exec( controller, "setupThumbnailsForManageSegments" )
	return menu
end

CoD.SegmentsOptionsPopupHeight = 256
CoD.SegmentsOptionsPopupHeightOffset = 40
local DeleteSegment_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_deletesegment " .. self.userData.segmentIndex )
	self:setPreviousMenu( nil )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "manage_segments_refresh",
		controller = event.controller
	} )
end

LUI.createMenu.DeleteSegment = function ( controller, userData )
	local popup = CoD.Popup.SetupPopupChoice( "DeleteSegment", controller )
	popup:setTopBottom( false, false, (-CoD.SegmentsOptionsPopupHeight - CoD.SegmentsOptionsPopupHeightOffset) / 2, (CoD.SegmentsOptionsPopupHeight + CoD.SegmentsOptionsPopupHeightOffset) / 2 )
	popup.smallPopupBackground:setTopBottom( false, false, -CoD.SegmentsOptionsPopupHeight / 2 - CoD.SegmentsOptionsPopupHeightOffset - 10, CoD.SegmentsOptionsPopupHeight / 2 + 10 )
	popup.userData = userData
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_DELETE_SEGMENT_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "delete_segment_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "delete_segment_accept", DeleteSegment_Accept )
	return popup
end

CoD.DEMO_CLIP_TRANSITION_NONE = 0
CoD.DEMO_CLIP_TRANSITION_FADE = 1
local SegmentOptions_Back = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "manage_segments_refresh",
		controller = event.controller
	} )
end

local SegmentOptions_PreviewSegment = function ( self, event )
	CoD.ManageSegments.SelectedSegmentIndex = self.userData.segmentIndex
	self:goBack( event.controller )
	ManageSegments_Back( self.occludedMenu, event )
	Engine.Exec( event.controller, "demo_previewsegment " .. CoD.ManageSegments.SelectedSegmentIndex )
end

local SegmentOptions_SwitchTransition = function ( params )
	Engine.ExecNow( params.controller, "demo_switchtransition " .. params.segmentIndex .. " " .. params.value )
	local buttonList = params.parentButton:getParent()
	local parentMenu = buttonList:getParent()
	if parentMenu.occludedMenu ~= nil then
		parentMenu.occludedMenu:processEvent( {
			name = "manage_segments_refresh",
			controller = params.controller
		} )
	end
end

local SegmentOptions_KeyboardComplete = function ( self, event )
	self.occludedMenu:processEvent( {
		name = "manage_segments_refresh",
		controller = event.controller
	} )
end

local SegmentOptions_RenameSegment = function ( self, event )
	Engine.Exec( event.controller, "demo_keyboard segmentName " .. self.userData.segmentIndex )
end

local SegmentOptions_DeleteSegment = function ( self, event )
	self:openMenu( "DeleteSegment", event.controller, self.userData )
	self:close()
end

local SegmentOptions_SetupMoveSegment = function ( self, event )
	CoD.ManageSegments.SelectedSegmentIndex = self.userData.segmentIndex
	SegmentOptions_Back( self, event )
end

LUI.createMenu.SegmentOptions = function ( controller, userData )
	local popup = CoD.Popup.SetupPopup( "SegmentOptions", controller )
	popup:setTopBottom( false, false, (-CoD.SegmentsOptionsPopupHeight - CoD.SegmentsOptionsPopupHeightOffset) / 2, (CoD.SegmentsOptionsPopupHeight + CoD.SegmentsOptionsPopupHeightOffset) / 2 )
	popup.smallPopupBackground:setTopBottom( false, false, -CoD.SegmentsOptionsPopupHeight / 2 - CoD.SegmentsOptionsPopupHeightOffset - 10, CoD.SegmentsOptionsPopupHeight / 2 + 10 )
	popup.userData = userData
	popup:addSelectButton()
	popup:addBackButton()
	popup:registerEventHandler( "button_prompt_back", SegmentOptions_Back )
	popup:registerEventHandler( "delete_segment_confirmation", SegmentOptions_DeleteSegment )
	popup:registerEventHandler( "preview_segment", SegmentOptions_PreviewSegment )
	popup:registerEventHandler( "rename_segment", SegmentOptions_RenameSegment )
	popup:registerEventHandler( "demo_keyboard_complete", SegmentOptions_KeyboardComplete )
	popup:registerEventHandler( "setup_move_segment", SegmentOptions_SetupMoveSegment )
	popup.title:setText( Engine.Localize( "MENU_SEGMENT_OPTIONS" ) )
	popup.msg:setText( Engine.Localize( "MENU_SEGMENT_OPTIONS_DESC" ) )
	local segmentCount = Engine.GetDemoSegmentCount()
	local f28_local0 = userData.segmentIndex == segmentCount - 1
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	if f28_local0 then
		buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 4 - 20, 0 )
	else
		buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 5 - 20, 0 )
	end
	buttonList:setSpacing( 0 )
	popup:addElement( buttonList )
	local previewSegment = buttonList:addButton( Engine.Localize( "MPUI_PREVIEW" ) )
	previewSegment:setActionEventName( "preview_segment" )
	previewSegment:processEvent( {
		name = "gain_focus"
	} )
	local moveSegment = buttonList:addButton( Engine.Localize( "MENU_MOVE" ) )
	moveSegment:setActionEventName( "setup_move_segment" )
	if not f28_local0 then
		local transitionValue = tonumber( Engine.GetDemoSegmentInformation( userData.segmentIndex, "transitionValue" ) )
		local transitionOut = buttonList:addLeftRightSelector( Engine.Localize( "MENU_CHANGE_TRANSITION" ), transitionValue )
		local f28_local1 = {}
		local f28_local2 = Engine.Localize( "MENU_DEMO_TRANSITION_CUT" )
		local f28_local3 = Engine.Localize( "MENU_DEMO_TRANSITION_FADE" )
		transitionOut.strings = f28_local2
		transitionOut.values = {
			CoD.DEMO_CLIP_TRANSITION_NONE,
			CoD.DEMO_CLIP_TRANSITION_FADE
		}
		for index = 1, #transitionOut.strings, 1 do
			transitionOut:addChoice( Engine.Localize( transitionOut.strings[index] ), SegmentOptions_SwitchTransition, {
				value = transitionOut.values[index],
				controller = controller,
				parentButton = transitionOut,
				segmentIndex = userData.segmentIndex
			} )
		end
	end
	local renameSegment = buttonList:addButton( Engine.Localize( "MENU_RENAME" ) )
	renameSegment:setActionEventName( "rename_segment" )
	local deleteSegment = buttonList:addButton( Engine.Localize( "MENU_DELETE" ) )
	deleteSegment:setActionEventName( "delete_segment_confirmation" )
	return popup
end

local MergeAllSegments_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_mergesegments" )
	self:setPreviousMenu( nil )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "manage_segments_refresh",
		controller = event.controller
	} )
end

LUI.createMenu.MergeAllSegments = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "MergeAllSegments", controller )
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_MERGE_ALL_SEGMENTS_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "merge_all_segments_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "merge_all_segments_accept", MergeAllSegments_Accept )
	return popup
end

local DeleteAllSegments_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_deleteclip" )
	self:setPreviousMenu( nil )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "manage_segments_refresh",
		controller = event.controller
	} )
end

LUI.createMenu.DeleteAllSegments = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "DeleteAllSegments", controller )
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_DELETE_ALL_SEGMENTS_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "delete_all_segments_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "delete_all_segments_accept", DeleteAllSegments_Accept )
	return popup
end

local ClipOptions_MergeAllSegments = function ( self, event )
	self:openMenu( "MergeAllSegments", event.controller )
	self:close()
end

local ClipOptions_DeleteAllSegments = function ( self, event )
	self:openMenu( "DeleteAllSegments", event.controller )
	self:close()
end

LUI.createMenu.ClipOptions = function ( controller )
	local popup = CoD.Menu.NewSmallPopup( "ClipOptions" )
	popup:setOwner( controller )
	popup:addSelectButton()
	popup:addBackButton()
	popup:registerEventHandler( "merge_all_segments_confirmation", ClipOptions_MergeAllSegments )
	popup:registerEventHandler( "delete_all_segments_confirmation", ClipOptions_DeleteAllSegments )
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Big )
	messageText:setFont( CoD.fonts.Big )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( Engine.Localize( "MENU_CLIP_OPTIONS" ) )
	popup:addElement( messageText )
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	popup:addElement( buttonList )
	local mergeAllSegments = buttonList:addButton( Engine.Localize( "MENU_MERGE_ALL_SEGMENTS" ) )
	mergeAllSegments:setActionEventName( "merge_all_segments_confirmation" )
	mergeAllSegments:processEvent( {
		name = "gain_focus"
	} )
	if Engine.GetDemoSegmentCount() <= 1 then
		mergeAllSegments:disable()
	end
	local deleteAllSegments = buttonList:addButton( Engine.Localize( "MENU_DELETE_ALL_SEGMENTS" ) )
	deleteAllSegments:setActionEventName( "delete_all_segments_confirmation" )
	return popup
end

