CoD.MissionButton = {}
CoD.MissionButton.ButtonOverAnimTime = 150
CoD.MissionButton.ButtonActionSFX = "uin_main_enter"
CoD.MissionButton.DescTextFont = "Default"
CoD.MissionButton.ObjectiveFontName = "Condensed"
CoD.MissionButton.MissionNameNormalFontName = "Condensed"
CoD.MissionButton.MissionNameSelectedFontName = "Big"
CoD.MissionButton.LevelImageHeight = 100
CoD.MissionButton.LevelImageAspectRatio = 2
CoD.MissionButton.LevelImageSelectedScale = 4
CoD.MissionButton.FadeIn = function ( self )
	if self ~= nil then
		self:beginAnimation( "fade_in", 300 )
		self:setAlpha( 1 )
	end
end

CoD.MissionButton.new = function ( defaultAnimationState, missionInternalName, missionName, isDevLevel, actionEventName, animTime )
	if defaultAnimationState == nil then
		defaultAnimationState = CoD.GetDefaultAnimationState()
	end
	local button = LUI.UIButton.new( defaultAnimationState, actionEventName )
	button.id = "MissionButton." .. missionInternalName
	button.loadName = missionInternalName
	button.setSFX = CoD.MissionButton.SetSFX
	button.m_animTime = CoD.MissionButton.ButtonOverAnimTime
	if animTime ~= nil then
		button.m_animTime = animTime
	end
	button:registerAnimationState( "carousel_set_start", {
		left = 0,
		right = 0,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		topAnchor = false,
		bottomAnchor = false
	} )
	button.missionText = Engine.Localize( missionName )
	local missionNameText = LUI.UIText.new( nil, true )
	CoD.MissionButton.MissionName_DefaultAnim( missionNameText, 0 )
	missionNameText:setLeftRight( true, true, 0, 0 )
	missionNameText:setAlignment( LUI.Alignment.Center )
	missionNameText:setText( button.missionText )
	button.missionNameText = missionNameText
	button:addElement( missionNameText )
	local levelAliasName = Engine.TableLookup( nil, CoD.levelLookupTable, 1, missionInternalName, 2 )
	button.levelAliasName = levelAliasName
	local levelImageHeight = 100
	local levelImageAspectRatio = 2
	local levelImageSelectedScale = 4
	local levelImageHorizontalOffset = 25
	local levelMaterial = nil
	if levelAliasName == nil or levelAliasName == "" then
		levelMaterial = RegisterMaterial( "menu_visor_ms_" .. missionInternalName )
	else
		levelMaterial = RegisterMaterial( "menu_visor_ms_" .. levelAliasName )
	end
	local levelImage = LUI.UIStreamedImage.new()
	CoD.MissionButton.MissionImage_DefaultAnim( levelImage, 0 )
	levelImage:setImage( levelMaterial )
	levelImage:setAlpha( 0 )
	levelImage:registerEventHandler( "streamed_image_ready", CoD.MissionButton.FadeIn )
	button.levelImage = levelImage
	button:addElement( levelImage )
	button:registerEventHandler( "button_action", CoD.MissionButton.ButtonAction )
	button:registerEventHandler( "gain_focus", CoD.MissionButton.GainFocus )
	button:registerEventHandler( "lose_focus", CoD.MissionButton.LoseFocus )
	button:registerEventHandler( "carousel_scroll_complete", CoD.MissionButton.CarouselScrollComplete )
	button:registerEventHandler( "carousel_start_set", CoD.MissionButton.CarouselStartSet )
	button:registerEventHandler( "carousel_mouse_enter", CoD.MissionButton.CarouselMouseEnter )
	button:registerEventHandler( "carousel_mouse_leave", CoD.MissionButton.CarouselMouseLeave )
	button:registerEventHandler( "gamepad_button", CoD.MissionButton.GamepadButton )
	return button
end

CoD.MissionButton.SetSFX = function ( missionButton, sfxName )
	missionButton.m_sfxName = sfxName
end

CoD.MissionButton.ButtonAction = function ( missionButton, event )
	if missionButton.m_sfxName ~= nil then
		Engine.PlaySound( missionButton.m_sfxName )
	else
		Engine.PlaySound( CoD.MissionButton.ButtonActionSFX )
	end
	if missionButton.actionEventName ~= nil then
		missionButton:dispatchEventToParent( {
			name = missionButton.actionEventName,
			controller = event.controller,
			button = missionButton
		} )
	end
end

CoD.MissionButton.GainFocus = function ( missionButton, event )
	local retVal = LUI.UIElement.gainFocus( missionButton, event )
	CoD.MissionButton.CreateMissionDetails( missionButton )
	CoD.MissionButton.MissionImage_SelectedAnim( missionButton.levelImage, missionButton.m_animTime )
	CoD.MissionButton.MissionName_SelectedAnim( missionButton.missionNameText, missionButton.m_animTime )
	CoD.MissionButton.Element_Show( missionButton.detailsContainer, missionButton.m_animTime )
	missionButton:animateToState( "default", missionButton.m_animTime )
	return retVal
end

CoD.MissionButton.LoseFocus = function ( missionButton, event )
	LUI.UIElement.loseFocus( missionButton, event )
	CoD.MissionButton.RemoveMissionDetails( missionButton )
	CoD.MissionButton.MissionImage_DefaultAnim( missionButton.levelImage, missionButton.m_animTime )
	CoD.MissionButton.MissionName_DefaultAnim( missionButton.missionNameText, missionButton.m_animTime )
end

CoD.MissionButton.CarouselScrollComplete = function ( missionButton, event )
	CoD.MissionButton.Element_Show( missionButton.brackets, 0 )
	CoD.MissionButton.AnimateBrackets( missionButton.brackets, missionButton.m_animTime )
end

CoD.MissionButton.CarouselMouseEnter = function ( missionButton, event )
	if not event.isSelected then
		local missionName = missionButton.missionNameText
		local fontName = CoD.MissionButton.MissionNameNormalFontName
		local textSize = CoD.textSize[fontName] * 1.2
		missionName:beginAnimation( "mouse_highlight", missionButton.m_animTime )
		missionName:setAlpha( 1 )
		missionName:setTopBottom( true, false, 0, textSize )
		missionName:setFont( CoD.fonts[fontName] )
		local levelImage = missionButton.levelImage
		local levelImageHeight = CoD.MissionButton.LevelImageHeight * 1.2
		local levelImageWidth = levelImageHeight * CoD.MissionButton.LevelImageAspectRatio
		levelImage:beginAnimation( "mouse_highlight", missionButton.m_animTime )
		levelImage:setLeftRight( false, false, -levelImageWidth / 2, levelImageWidth / 2 )
		levelImage:setTopBottom( false, false, -levelImageHeight / 2, levelImageHeight / 2 )
	else
		local levelImage = missionButton.levelImage
		local levelImageHorizontalOffset = 25
		local levelImageHeight = CoD.MissionButton.LevelImageHeight * CoD.MissionButton.LevelImageSelectedScale * 1.1
		local levelImageWidth = levelImageHeight * CoD.MissionButton.LevelImageAspectRatio
		levelImage:beginAnimation( "mouse_highlight", missionButton.m_animTime )
		levelImage:setLeftRight( false, false, -levelImageWidth / 2 - levelImageHorizontalOffset, levelImageWidth / 2 - levelImageHorizontalOffset )
		levelImage:setTopBottom( false, false, -levelImageHeight / 2, levelImageHeight / 2 )
	end
end

CoD.MissionButton.CarouselMouseLeave = function ( missionButton, event )
	if not event.isSelected then
		CoD.MissionButton.MissionName_DefaultAnim( missionButton.missionNameText, missionButton.m_animTime )
		CoD.MissionButton.MissionImage_DefaultAnim( missionButton.levelImage, missionButton.m_animTime )
	else
		CoD.MissionButton.MissionImage_SelectedAnim( missionButton.levelImage, missionButton.m_animTime )
	end
end

CoD.MissionButton.Element_Hide = function ( self, duration )
	self:beginAnimation( "hide", duration )
	self:setAlpha( 0 )
end

CoD.MissionButton.Element_Show = function ( self, duration )
	self:beginAnimation( "show", duration )
	self:setAlpha( 1 )
end

CoD.MissionButton.MissionName_DefaultAnim = function ( self, duration )
	local topBorder = 0
	local normalTextSize = CoD.MissionButton.MissionNameNormalFontName
	self:beginAnimation( "default", duration )
	self:setTopBottom( true, false, topBorder, CoD.textSize[normalTextSize] + topBorder )
	self:setFont( CoD.fonts[normalTextSize] )
	self:setRGB( CoD.visorBlue2.r, CoD.visorBlue2.g, CoD.visorBlue2.b )
	self:setAlpha( 0 )
end

CoD.MissionButton.MissionName_SelectedAnim = function ( self, duration )
	local topBorder = 0
	local selectedTextSize = CoD.MissionButton.MissionNameSelectedFontName
	self:beginAnimation( "selected", duration )
	self:setTopBottom( true, false, topBorder, CoD.textSize[selectedTextSize] + topBorder )
	self:setFont( CoD.fonts[selectedTextSize] )
	self:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	self:setAlpha( 1 )
end

CoD.MissionButton.MissionImage_DefaultAnim = function ( self, duration )
	local levelImageHeight = CoD.MissionButton.LevelImageHeight
	local levelImageAspectRatio = CoD.MissionButton.LevelImageAspectRatio
	self:beginAnimation( "default", duration )
	self:setLeftRight( false, false, -(levelImageHeight * levelImageAspectRatio) / 2, levelImageHeight * levelImageAspectRatio / 2 )
	self:setTopBottom( false, false, -levelImageHeight / 2, levelImageHeight / 2 )
end

CoD.MissionButton.MissionImage_SelectedAnim = function ( self, duration )
	local levelImageHeight = CoD.MissionButton.LevelImageHeight
	local levelImageAspectRatio = CoD.MissionButton.LevelImageAspectRatio
	local levelImageSelectedScale = CoD.MissionButton.LevelImageSelectedScale
	local levelImageHorizontalOffset = 25
	self:beginAnimation( "selected", duration )
	self:setLeftRight( false, false, -(levelImageHeight * levelImageAspectRatio * levelImageSelectedScale) / 2 - levelImageHorizontalOffset, levelImageHeight * levelImageAspectRatio * levelImageSelectedScale / 2 - levelImageHorizontalOffset )
	self:setTopBottom( false, false, -(levelImageHeight * levelImageSelectedScale) / 2, levelImageHeight * levelImageSelectedScale / 2 )
end

CoD.MissionButton.AnimateBrackets = function ( self, duration )
	if not self.width then
		return 
	else
		self:beginAnimation( "setup", 0 )
		self:setLeftRight( false, false, -self.width / 2 - 20, self.width / 2 + 20 )
		self:beginAnimation( "animate", duration )
		self:setLeftRight( false, false, -self.width / 2, self.width / 2 )
	end
end

CoD.MissionButton.CreateMissionDetails = function ( self )
	if self.detailsContainer then
		return 
	end
	self.detailsContainer = LUI.UIElement.new()
	self.detailsContainer:setLeftRight( true, true, 0, 0 )
	self.detailsContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( self.detailsContainer )
	local dateTopOffset = CoD.textSize.Default + 15
	local missionDateText = LUI.UIText.new()
	missionDateText:setLeftRight( true, true, 0, 0 )
	missionDateText:setTopBottom( true, false, dateTopOffset, CoD.textSize.Default + dateTopOffset )
	missionDateText:setFont( CoD.fonts[normalTextSize] )
	missionDateText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	missionDateText:setAlpha( 1 )
	self.detailsContainer:addElement( missionDateText )
	if CoD.Campaign.MissionBriefingInfo[self.levelAliasName] ~= nil then
		missionDateText:setText( CoD.Campaign.MissionBriefingInfo[self.levelAliasName].missionDate )
	end
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( self.missionText, CoD.fonts.Big, CoD.textSize.Big )
	local width = textRight - textLeft + 30
	local bracketContainer = LUI.UIElement.new()
	bracketContainer:setLeftRight( false, false, -width / 2, width / 2 )
	bracketContainer:setTopBottom( true, false, 0, CoD.textSize.Default + dateTopOffset )
	bracketContainer.width = width
	bracketContainer:addElement( CoD.SideBracketsImage.new() )
	self.detailsContainer:addElement( bracketContainer )
	self.brackets = bracketContainer
	local descWidth = 350
	local descHeight = 85
	local levelDescContainer = LUI.UIElement.new()
	levelDescContainer:setLeftRight( false, false, -descWidth / 2, descWidth / 2 )
	levelDescContainer:setTopBottom( false, true, -descHeight, 0 )
	levelDescContainer:setAlpha( 1 )
	self.detailsContainer:addElement( levelDescContainer )
	local objectiveText = LUI.UIText.new()
	objectiveText:setLeftRight( true, true, 0, 0 )
	objectiveText:setTopBottom( true, false, -28, -28 + CoD.textSize[CoD.MissionButton.ObjectiveFontName] )
	objectiveText:setFont( CoD.fonts[CoD.MissionButton.ObjectiveFontName] )
	objectiveText:setText( Engine.Localize( "SPUI_MISSION_DETAILS" ) )
	objectiveText:setAlignment( LUI.Alignment.Center )
	objectiveText:setRGB( CoD.visorBlue2.r, CoD.visorBlue2.g, CoD.visorBlue2.b )
	levelDescContainer:addElement( objectiveText )
	local levelDescBGY = -50
	local levelDescWidth = 700
	local levelDescHeight = 158
	local levelDescBG = LUI.UIImage.new()
	levelDescBG:setLeftRight( false, false, -levelDescWidth / 2, levelDescWidth / 2 )
	levelDescBG:setTopBottom( true, false, levelDescBGY, levelDescBGY + levelDescHeight )
	levelDescBG:setImage( RegisterMaterial( "mission_select_desc_bg" ) )
	levelDescContainer:addElement( levelDescBG )
	local levelDesc = LUI.UIText.new()
	levelDesc:setLeftRight( true, true, 0, 0 )
	levelDesc:setTopBottom( true, false, 0, CoD.textSize[CoD.MissionButton.DescTextFont] )
	levelDesc:setFont( CoD.fonts[CoD.MissionButton.DescTextFont] )
	levelDesc:setAlignment( LUI.Alignment.Center )
	levelDescContainer:addElement( levelDesc )
	if CoD.Campaign.MissionBriefingInfo[self.levelAliasName] ~= nil then
		levelDesc:setText( Engine.Localize( CoD.Campaign.MissionBriefingInfo[self.levelAliasName].missionDesc ) )
	end
end

CoD.MissionButton.RemoveMissionDetails = function ( self )
	if self.detailsContainer then
		self.detailsContainer:close()
		self.detailsContainer = nil
	end
end

CoD.MissionButton.GamepadButton = function ( self, event )
	if self:handleGamepadButton( event ) then
		return true
	elseif self:isInFocus() and event.down == true and event.button == "primary" then
		if not self.disabled then
			self:processEvent( {
				name = "button_action",
				controller = event.controller
			} )
		end
		return true
	else
		return false
	end
end

