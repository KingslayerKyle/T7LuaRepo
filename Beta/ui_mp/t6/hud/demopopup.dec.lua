CoD.DemoPopup = {}
local DemoPopup_Error_Ok = function ( self, event )
	self:goBack( event.controller )
	if Engine.IsInGame() and self.occludedMenu == nil then
		Engine.LockInput( event.controller, false )
		Engine.SetUIActive( event.controller, false )
	end
end

LUI.createMenu.Demo_Error = function ( controller )
	local popup = CoD.Popup.SetupPopup( "Demo_Error", controller )
	local accept = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), popup, "action_ok", false, false, false )
	popup:addLeftButtonPrompt( accept )
	popup:registerEventHandler( "action_ok", DemoPopup_Error_Ok )
	return popup
end

local DemoPopup_SavePopup_Back = function ( self, event )
	self:goBack( event.controller )
end

local DemoPopup_SavePopup_AutoNameAndSaveSegment = function ( self, event )
	Engine.Exec( event.controller, "demo_savesegment 0" )
	DemoPopup_SavePopup_Back( self, event )
end

local DemoPopup_SavePopup_NameAndSaveSegment = function ( self, event )
	Engine.Exec( event.controller, "demo_keyboard segmentName" )
end

local DemoPopup_SavePopup_PreviewSegment = function ( self, event )
	Engine.Exec( event.controller, "demo_previewsegment" )
	DemoPopup_SavePopup_Back( self, event )
end

local DemoPopup_SavePopup_DiscardSegment = function ( self, event )
	Engine.Exec( event.controller, "demo_savesegment 1" )
	DemoPopup_SavePopup_Back( self, event )
end

LUI.createMenu.Demo_Save_Popup = function ( controller )
	local savePopup = CoD.Menu.NewSmallPopup( "Demo_Save_Popup" )
	savePopup:setOwner( controller )
	savePopup:addSelectButton()
	savePopup:registerEventHandler( "demo_close_save_popup", DemoPopup_SavePopup_Back )
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Big )
	messageText:setFont( CoD.fonts.Big )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( Engine.Localize( "MENU_KEEP_SEGMENT" ) )
	savePopup:addElement( messageText )
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 5 + 10, 0 )
	savePopup:addElement( buttonList )
	local autosave = buttonList:addButton( Engine.Localize( "MENU_AUTONAME_SEGMENT" ) )
	autosave:setActionEventName( "autoname_and_save_segment" )
	autosave:processEvent( {
		name = "gain_focus"
	} )
	savePopup:registerEventHandler( "autoname_and_save_segment", DemoPopup_SavePopup_AutoNameAndSaveSegment )
	local nameSegment = buttonList:addButton( Engine.Localize( "MENU_NAME_SEGMENT" ) )
	nameSegment:setActionEventName( "name_and_save_segment" )
	savePopup:registerEventHandler( "name_and_save_segment", DemoPopup_SavePopup_NameAndSaveSegment )
	local previewSegment = buttonList:addButton( Engine.Localize( "MENU_PREVIEW_SEGMENT" ) )
	previewSegment:setActionEventName( "preview_segment" )
	savePopup:registerEventHandler( "preview_segment", DemoPopup_SavePopup_PreviewSegment )
	local discardSegment = buttonList:addButton( Engine.Localize( "MENU_DISCARD_SEGMENT" ) )
	discardSegment:setActionEventName( "discard_segment" )
	savePopup:registerEventHandler( "discard_segment", DemoPopup_SavePopup_DiscardSegment )
	return savePopup
end

CoD.DemoPopup.OpenSavePopup = function ( self, event )
	if event.menuName == "demo_save_clip" then
		self:openPopup( "Demo_Save_Popup", event.controller )
	else
		CoD.perController[event.controller].fileshareSaveCategory = "screenshot"
		CoD.perController[event.controller].fileshareSaveIsCopy = false
		CoD.perController[event.controller].fileshareSaveIsPooled = false
	end
end

LUI.createMenu.Demo_Wait = function ( controller, userData )
	local waitScreen = CoD.Menu.NewSmallPopup( "Demo_Wait" )
	waitScreen:setOwner( controller )
	waitScreen:addBackButton()
	local top = 5
	local waitScreenTitleText = LUI.UIText.new()
	waitScreenTitleText:setLeftRight( true, true, 0, 0 )
	waitScreenTitleText:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	waitScreenTitleText:setFont( CoD.fonts.Condensed )
	waitScreenTitleText:setAlignment( LUI.Alignment.Left )
	waitScreenTitleText:setText( Engine.Localize( "MENU_PLEASEWAIT" ) )
	waitScreen:addElement( waitScreenTitleText )
	return waitScreen
end

CoD.DOLLYCAM_SPEEDMODE_MANUAL = 0
CoD.DOLLYCAM_SPEEDMODE_LINEAR = 1
CoD.DOLLYCAM_SPEEDMODE_FIXED = 2
local DemoPopup_DollyCamMarkerOptionsPopup_Back = function ( self, event )
	self:goBack( event.controller )
	Engine.LockInput( event.controller, false )
	Engine.SetUIActive( event.controller, false )
end

local DemoPopup_DollyCamMarkerOptionsPopup_RemoveAllMarkers_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_removedollycammarker -1" )
	self:setPreviousMenu( nil )
	DemoPopup_DollyCamMarkerOptionsPopup_Back( self, event )
end

LUI.createMenu.RemoveAllMarkers = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "RemoveAllMarkers", controller )
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REMOVE_ALL_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "remove_all_markers_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "remove_all_markers_accept", DemoPopup_DollyCamMarkerOptionsPopup_RemoveAllMarkers_Accept )
	return popup
end

local DemoPopup_DollyCamMarkerOptionsPopup_RepositionCamera = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_repositiondollycammarker " .. getHighlightedMarker )
	DemoPopup_DollyCamMarkerOptionsPopup_Back( self, event )
end

local DemoPopup_DollyCamMarkerOptionsPopup_RemoveMarker = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_removedollycammarker " .. getHighlightedMarker )
	DemoPopup_DollyCamMarkerOptionsPopup_Back( self, event )
end

local DemoPopup_DollyCamMarkerOptionsPopup_RemoveAllMarkers = function ( self, event )
	self:openMenu( "RemoveAllMarkers", event.controller )
	self:close()
end

local DemoPopup_DollyCamMarkerOptionsPopup_Update = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker() + 1
	local currentSpeedSettingMode = self.speedSettingMode:getCurrentValue()
	self.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_NUMBER", getHighlightedMarker ) ) )
	self.speedSettingMode:refreshChoice()
	if self.speedSettingValue ~= nil then
		if currentSpeedSettingMode ~= "0" then
			if self.speedSettingValueValid == false then
				self.speedSettingValueSpacer:close()
				self.speedSettingValue:addElementAfter( self.speedSettingMode )
				LUI.UIVerticalList.UpdateNavigation( self.buttonList )
				self.speedSettingValueValid = true
			end
			local value = Engine.DvarFloat( "demo_dollycamMarkerTimeScaleValue" )
			self.speedSettingValue.label:setText( Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_SPEED", string.format( "%.1f", value ) ) )
		elseif self.speedSettingValueValid == true then
			self.speedSettingValue:processEvent( {
				name = "lose_focus"
			} )
			self.speedSettingValue:close()
			self.speedSettingValueValid = false
			self.speedSettingValueSpacer:addElementAfter( self.speedSettingMode )
			self.speedSettingMode:processEvent( {
				name = "gain_focus"
			} )
			LUI.UIVerticalList.UpdateNavigation( self.buttonList )
		end
	end
end

local DemoPopup_DollyCamMarkerOptionsPopup_SliderCallback = function ( self, val )
	Engine.SetDvar( self.m_dvarName, val )
	local buttonList = self:getParent()
	if buttonList ~= nil then
		local popup = buttonList:getParent()
		if popup ~= nil then
			DemoPopup_DollyCamMarkerOptionsPopup_Update( popup, nil )
		end
	end
end

local DemoPopup_DollyCamMarkerOptionsPopup_SpeedModeSelectionChanged = function ( choiceParams )
	Engine.SetDvar( choiceParams.parentSelectorButton.m_dvarName, choiceParams.value )
	local buttonList = choiceParams.parentSelectorButton:getParent()
	if buttonList ~= nil then
		local dollycamPopup = buttonList:getParent()
		if dollycamPopup ~= nil and dollycamPopup.creatingSpeedSettingModeButton ~= true then
			dollycamPopup:processEvent( {
				name = "demo_dollycam_marker_options_update",
				controller = dollycamPopup.controller
			} )
		end
	end
end

local DemoPopup_DollyCamMarkerOptionsPopup_SwitchMarkerPrevious = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_updatedollycammarkerparameters " .. getHighlightedMarker )
	Engine.Exec( event.controller, "demo_switchdollycammarker " .. getHighlightedMarker .. " 0" )
end

local DemoPopup_DollyCamMarkerOptionsPopup_SwitchMarkerNext = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_updatedollycammarkerparameters " .. getHighlightedMarker )
	Engine.Exec( event.controller, "demo_switchdollycammarker " .. getHighlightedMarker .. " 1" )
end

local DemoPopup_DollyCamMarkerOptionsPopup_Done = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_updatedollycammarkerparameters " .. getHighlightedMarker )
	DemoPopup_DollyCamMarkerOptionsPopup_Back( self, event )
end

LUI.createMenu.Demo_DollyCam_Marker_Options = function ( controller )
	local dollycamMarkerOptionsPopup = CoD.Menu.NewSmallPopup( "Demo_DollyCam_Marker_Options" )
	dollycamMarkerOptionsPopup.controller = controller
	dollycamMarkerOptionsPopup:setOwner( controller )
	dollycamMarkerOptionsPopup:addSelectButton()
	dollycamMarkerOptionsPopup:addBackButton( Engine.Localize( "MPUI_DONE" ) )
	dollycamMarkerOptionsPopup:registerEventHandler( "button_prompt_back", DemoPopup_DollyCamMarkerOptionsPopup_Done )
	dollycamMarkerOptionsPopup:registerEventHandler( "demo_dollycam_marker_options_update", DemoPopup_DollyCamMarkerOptionsPopup_Update )
	local border = 0
	local messageSize = CoD.textSize.Condensed
	local sliderSpacing = 240
	dollycamMarkerOptionsPopup.leftTopButtonBar = LUI.UIHorizontalList.new( {
		left = border,
		top = -30,
		right = 0,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Left
	} )
	dollycamMarkerOptionsPopup:addElement( dollycamMarkerOptionsPopup.leftTopButtonBar )
	local LBButton = CoD.ButtonPrompt.new( "shoulderl", "", dollycamMarkerOptionsPopup, "switch_dollycam_marker_previous" )
	dollycamMarkerOptionsPopup.leftTopButtonBar:addElement( LBButton )
	dollycamMarkerOptionsPopup:registerEventHandler( "switch_dollycam_marker_previous", DemoPopup_DollyCamMarkerOptionsPopup_SwitchMarkerPrevious )
	dollycamMarkerOptionsPopup.rightTopButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = -30,
		right = -border,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Right
	} )
	dollycamMarkerOptionsPopup:addElement( dollycamMarkerOptionsPopup.rightTopButtonBar )
	local RBButton = CoD.ButtonPrompt.new( "shoulderr", "", dollycamMarkerOptionsPopup, "switch_dollycam_marker_next" )
	dollycamMarkerOptionsPopup.rightTopButtonBar:addElement( RBButton )
	dollycamMarkerOptionsPopup:registerEventHandler( "switch_dollycam_marker_next", DemoPopup_DollyCamMarkerOptionsPopup_SwitchMarkerNext )
	dollycamMarkerOptionsPopup.messageText = LUI.UIText.new( {
		left = 0,
		top = border,
		right = 0,
		bottom = border + messageSize,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Center
	} )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker() + 1
	dollycamMarkerOptionsPopup.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_NUMBER", getHighlightedMarker ) ) )
	dollycamMarkerOptionsPopup:addElement( dollycamMarkerOptionsPopup.messageText )
	local buttonListTop = border + messageSize + 10
	dollycamMarkerOptionsPopup.buttonList = CoD.ButtonList.new( {
		left = border,
		top = buttonListTop,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	dollycamMarkerOptionsPopup:addElement( dollycamMarkerOptionsPopup.buttonList )
	dollycamMarkerOptionsPopup.creatingSpeedSettingModeButton = true
	dollycamMarkerOptionsPopup.speedSettingMode = dollycamMarkerOptionsPopup.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_MODE" ), "demo_dollycamMarkerTimeScaleMode", nil, sliderSpacing )
	local f23_local0 = dollycamMarkerOptionsPopup.speedSettingMode
	local f23_local1 = {}
	local f23_local2 = Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_MANUAL" )
	local f23_local3 = Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_LINEAR" )
	local f23_local4 = Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_FIXED" )
	f23_local0.strings = f23_local2
	dollycamMarkerOptionsPopup.speedSettingMode.values = {
		CoD.DOLLYCAM_SPEEDMODE_MANUAL,
		CoD.DOLLYCAM_SPEEDMODE_LINEAR,
		CoD.DOLLYCAM_SPEEDMODE_FIXED
	}
	for index = 1, #dollycamMarkerOptionsPopup.speedSettingMode.strings, 1 do
		dollycamMarkerOptionsPopup.speedSettingMode:addChoice( controller, Engine.Localize( dollycamMarkerOptionsPopup.speedSettingMode.strings[index] ), dollycamMarkerOptionsPopup.speedSettingMode.values[index], nil, DemoPopup_DollyCamMarkerOptionsPopup_SpeedModeSelectionChanged )
	end
	dollycamMarkerOptionsPopup.creatingSpeedSettingModeButton = false
	local speedValue = Engine.DvarFloat( "demo_dollycamMarkerTimeScaleValue" )
	dollycamMarkerOptionsPopup.speedSettingValue = dollycamMarkerOptionsPopup.buttonList:addDvarLeftRightSlider( controller, Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_SPEED", string.format( "%.1f", speedValue ) ), "demo_dollycamMarkerTimeScaleValue", 0.1, Dvar.demo_maxTimeScale:get(), nil, sliderSpacing )
	dollycamMarkerOptionsPopup.speedSettingValue:setSliderCallback( DemoPopup_DollyCamMarkerOptionsPopup_SliderCallback )
	dollycamMarkerOptionsPopup.speedSettingValueValid = true
	dollycamMarkerOptionsPopup.speedSettingValueSpacer = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	} )
	dollycamMarkerOptionsPopup.repositionCamera = dollycamMarkerOptionsPopup.buttonList:addButton( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REPOSITION" ) )
	dollycamMarkerOptionsPopup.repositionCamera:setActionEventName( "reposition_camera" )
	dollycamMarkerOptionsPopup:registerEventHandler( "reposition_camera", DemoPopup_DollyCamMarkerOptionsPopup_RepositionCamera )
	dollycamMarkerOptionsPopup.removeMarker = dollycamMarkerOptionsPopup.buttonList:addButton( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REMOVE" ) )
	dollycamMarkerOptionsPopup.removeMarker:setActionEventName( "remove_marker" )
	dollycamMarkerOptionsPopup:registerEventHandler( "remove_marker", DemoPopup_DollyCamMarkerOptionsPopup_RemoveMarker )
	dollycamMarkerOptionsPopup.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	dollycamMarkerOptionsPopup.removeAllMarkers = dollycamMarkerOptionsPopup.buttonList:addButton( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REMOVE_ALL" ) )
	dollycamMarkerOptionsPopup.removeAllMarkers:setActionEventName( "remove_all_markers" )
	dollycamMarkerOptionsPopup:registerEventHandler( "remove_all_markers", DemoPopup_DollyCamMarkerOptionsPopup_RemoveAllMarkers )
	dollycamMarkerOptionsPopup.buttonList:processEvent( {
		name = "gain_focus"
	} )
	dollycamMarkerOptionsPopup:processEvent( {
		name = "demo_dollycam_marker_options_update",
		controller = controller
	} )
	return dollycamMarkerOptionsPopup
end

CoD.DemoPopup.OpenDollyCamMarkerOptionsPopup = function ( self, event )
	self:openPopup( "Demo_DollyCam_Marker_Options", event.controller )
end

CoD.LightmanPopupWidth = 600
CoD.LightmanPopupHeight = 420
CoD.LightmanPopupWidthOffset = 40
CoD.LightmanPopupHeightOffset = 40
local DemoPopup_LightmanMarkerOptionsPopup_Back = function ( self, event )
	self:goBack( event.controller )
	Engine.LockInput( event.controller, false )
	Engine.SetUIActive( event.controller, false )
end

local DemoPopup_LightmanMarkerOptionsPopup_RemoveAllMarkers_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_removelightmanmarker -1" )
	self:setPreviousMenu( nil )
	DemoPopup_LightmanMarkerOptionsPopup_Back( self, event )
end

LUI.createMenu.RemoveAllLightmanMarkers = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "RemoveAllLightmanMarkers", controller )
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REMOVE_ALL_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "remove_all_markers_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "remove_all_markers_accept", DemoPopup_LightmanMarkerOptionsPopup_RemoveAllMarkers_Accept )
	return popup
end

local DemoPopup_LightmanMarkerOptionsPopup_RepositionCamera = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_repositionlightmanmarker " .. getHighlightedMarker )
	DemoPopup_LightmanMarkerOptionsPopup_Back( self, event )
end

local DemoPopup_LightmanMarkerOptionsPopup_RemoveMarker = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_removelightmanmarker " .. getHighlightedMarker )
	DemoPopup_LightmanMarkerOptionsPopup_Back( self, event )
end

local DemoPopup_LightmanMarkerOptionsPopup_RemoveAllMarkers = function ( self, event )
	self:openMenu( "RemoveAllLightmanMarkers", event.controller )
	self:close()
end

local DemoPopup_LightmanMarkerOptionsPopup_Update = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	self.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_NUMBER", getHighlightedMarker + 1 ) ) )
	self.lightMode:refreshChoice()
	local value = Engine.DvarFloat( "demo_lightmanMarkerLightRange" )
	self.rangeValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_RANGE", string.format( "%.1f", value ) ) )
	self.colorRValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_R", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorR" ) ) ) )
	self.colorGValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_G", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorG" ) ) ) )
	self.colorBValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_B", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorB" ) ) ) )
end

local DemoPopup_LightmanMarkerOptionsPopup_SliderCallback = function ( self, val )
	Engine.SetDvar( self.m_dvarName, val )
	local buttonList = self:getParent()
	if buttonList ~= nil then
		local popup = buttonList:getParent()
		if popup ~= nil then
			DemoPopup_LightmanMarkerOptionsPopup_Update( popup, nil )
			local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
			Engine.Exec( popup.controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
		end
	end
end

local DemoPopup_LightmanMarkerOptionsPopup_LightModeSelectionChanged = function ( choiceParams )
	Engine.SetDvar( choiceParams.parentSelectorButton.m_dvarName, choiceParams.value )
	local buttonList = choiceParams.parentSelectorButton:getParent()
	if buttonList ~= nil then
		local lightmanPopup = buttonList:getParent()
		if lightmanPopup ~= nil and lightmanPopup.creatingLightModeButton ~= true and lightmanPopup.creatingLightIntensityButton ~= true then
			DemoPopup_LightmanMarkerOptionsPopup_Update( lightmanPopup, {
				name = "demo_lightman_marker_options_update",
				controller = lightmanPopup.controller
			} )
			local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
			Engine.Exec( lightmanPopup.controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
		end
	end
end

local DemoPopup_LightmanMarkerOptionsPopup_SwitchMarkerPrevious = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
	Engine.Exec( event.controller, "demo_switchlightmanmarker " .. getHighlightedMarker .. " 0" )
end

local DemoPopup_LightmanMarkerOptionsPopup_SwitchMarkerNext = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
	Engine.Exec( event.controller, "demo_switchlightmanmarker " .. getHighlightedMarker .. " 1" )
end

local DemoPopup_LightmanMarkerOptionsPopup_Done = function ( self, event )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( event.controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
	DemoPopup_LightmanMarkerOptionsPopup_Back( self, event )
end

LUI.createMenu.Demo_Lightman_Marker_Options = function ( controller )
	local lightmanMarkerOptionsPopup = CoD.Menu.NewSmallPopup( "Demo_Lightman_Marker_Options" )
	lightmanMarkerOptionsPopup:setLeftRight( false, false, -CoD.LightmanPopupWidth / 2, CoD.LightmanPopupWidth / 2 )
	lightmanMarkerOptionsPopup:setTopBottom( false, false, (-CoD.LightmanPopupHeight - CoD.LightmanPopupHeightOffset) / 2, (CoD.LightmanPopupHeight + CoD.LightmanPopupHeightOffset) / 2 )
	lightmanMarkerOptionsPopup.smallPopupBackground:setLeftRight( false, false, -CoD.LightmanPopupWidth / 2 - CoD.LightmanPopupWidthOffset - 10, CoD.LightmanPopupWidth / 2 + CoD.LightmanPopupWidthOffset + 10 )
	lightmanMarkerOptionsPopup.smallPopupBackground:setTopBottom( false, false, -CoD.LightmanPopupHeight / 2 - CoD.LightmanPopupHeightOffset - 10, CoD.LightmanPopupHeight / 2 + 10 )
	lightmanMarkerOptionsPopup.controller = controller
	lightmanMarkerOptionsPopup:setOwner( controller )
	lightmanMarkerOptionsPopup:addSelectButton()
	lightmanMarkerOptionsPopup:addBackButton( Engine.Localize( "MPUI_DONE" ) )
	lightmanMarkerOptionsPopup:registerEventHandler( "button_prompt_back", DemoPopup_LightmanMarkerOptionsPopup_Done )
	lightmanMarkerOptionsPopup:registerEventHandler( "demo_lightman_marker_options_update", DemoPopup_LightmanMarkerOptionsPopup_Update )
	local border = 0
	local messageSize = CoD.textSize.Condensed
	local sliderSpacing = 240
	lightmanMarkerOptionsPopup.leftTopButtonBar = LUI.UIHorizontalList.new( {
		left = border,
		top = -30,
		right = 0,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Left
	} )
	lightmanMarkerOptionsPopup:addElement( lightmanMarkerOptionsPopup.leftTopButtonBar )
	local LBButton = CoD.ButtonPrompt.new( "shoulderl", "", lightmanMarkerOptionsPopup, "switch_lightman_marker_previous" )
	lightmanMarkerOptionsPopup.leftTopButtonBar:addElement( LBButton )
	lightmanMarkerOptionsPopup:registerEventHandler( "switch_lightman_marker_previous", DemoPopup_LightmanMarkerOptionsPopup_SwitchMarkerPrevious )
	lightmanMarkerOptionsPopup.rightTopButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = -30,
		right = -border,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Right
	} )
	lightmanMarkerOptionsPopup:addElement( lightmanMarkerOptionsPopup.rightTopButtonBar )
	local RBButton = CoD.ButtonPrompt.new( "shoulderr", "", lightmanMarkerOptionsPopup, "switch_lightman_marker_next" )
	lightmanMarkerOptionsPopup.rightTopButtonBar:addElement( RBButton )
	lightmanMarkerOptionsPopup:registerEventHandler( "switch_lightman_marker_next", DemoPopup_LightmanMarkerOptionsPopup_SwitchMarkerNext )
	lightmanMarkerOptionsPopup.messageText = LUI.UIText.new( {
		left = 0,
		top = border,
		right = 0,
		bottom = border + messageSize,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Center
	} )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker() + 1
	lightmanMarkerOptionsPopup.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_NUMBER", getHighlightedMarker ) ) )
	lightmanMarkerOptionsPopup:addElement( lightmanMarkerOptionsPopup.messageText )
	local buttonListTop = border + messageSize + 10
	lightmanMarkerOptionsPopup.buttonList = CoD.ButtonList.new( {
		left = border,
		top = buttonListTop,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	lightmanMarkerOptionsPopup:addElement( lightmanMarkerOptionsPopup.buttonList )
	lightmanMarkerOptionsPopup.creatingLightModeButton = true
	lightmanMarkerOptionsPopup.lightMode = lightmanMarkerOptionsPopup.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_MODE" ), "demo_lightmanMarkerLightMode", nil, sliderSpacing )
	local f37_local0 = lightmanMarkerOptionsPopup.lightMode
	local f37_local1 = {}
	local f37_local2 = Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_SETTING_OMNI" )
	local f37_local3 = Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_SETTING_SPOT" )
	f37_local0.strings = f37_local2
	lightmanMarkerOptionsPopup.lightMode.values = {
		Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI,
		Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT
	}
	for index = 1, #lightmanMarkerOptionsPopup.lightMode.strings, 1 do
		lightmanMarkerOptionsPopup.lightMode:addChoice( controller, Engine.Localize( lightmanMarkerOptionsPopup.lightMode.strings[index] ), lightmanMarkerOptionsPopup.lightMode.values[index], nil, DemoPopup_LightmanMarkerOptionsPopup_LightModeSelectionChanged )
	end
	lightmanMarkerOptionsPopup.creatingLightModeButton = false
	lightmanMarkerOptionsPopup.creatingLightIntensityButton = true
	lightmanMarkerOptionsPopup.lightIntensity = lightmanMarkerOptionsPopup.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_INTENSITY" ), "demo_lightmanMarkerLightIntensity", nil, sliderSpacing )
	lightmanMarkerOptionsPopup.lightIntensity.values = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10
	}
	for index = 1, #lightmanMarkerOptionsPopup.lightIntensity.values, 1 do
		lightmanMarkerOptionsPopup.lightIntensity:addChoice( controller, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_INTENSITY_VALUE", lightmanMarkerOptionsPopup.lightIntensity.values[index] ), lightmanMarkerOptionsPopup.lightIntensity.values[index], nil, DemoPopup_LightmanMarkerOptionsPopup_LightModeSelectionChanged )
	end
	lightmanMarkerOptionsPopup.creatingLightIntensityButton = false
	local rangeValue = Engine.DvarFloat( "demo_lightmanMarkerLightRange" )
	lightmanMarkerOptionsPopup.rangeValue = lightmanMarkerOptionsPopup.buttonList:addDvarLeftRightSlider( controller, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_RANGE", string.format( "%d", rangeValue ) ), "demo_lightmanMarkerLightRange", 10, 1500, nil, sliderSpacing )
	lightmanMarkerOptionsPopup.rangeValue:setSliderCallback( DemoPopup_LightmanMarkerOptionsPopup_SliderCallback )
	lightmanMarkerOptionsPopup.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	local colorRValue = Engine.DvarFloat( "demo_lightmanMarkerLightColorR" )
	lightmanMarkerOptionsPopup.colorRValue = lightmanMarkerOptionsPopup.buttonList:addDvarLeftRightSlider( controller, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_R", string.format( "%.2f", colorRValue ) ), "demo_lightmanMarkerLightColorR", 0, 1, nil, sliderSpacing )
	lightmanMarkerOptionsPopup.colorRValue:setSliderCallback( DemoPopup_LightmanMarkerOptionsPopup_SliderCallback )
	local colorGValue = Engine.DvarFloat( "demo_lightmanMarkerLightColorG" )
	lightmanMarkerOptionsPopup.colorGValue = lightmanMarkerOptionsPopup.buttonList:addDvarLeftRightSlider( controller, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_G", string.format( "%.2f", colorGValue ) ), "demo_lightmanMarkerLightColorG", 0, 1, nil, sliderSpacing )
	lightmanMarkerOptionsPopup.colorGValue:setSliderCallback( DemoPopup_LightmanMarkerOptionsPopup_SliderCallback )
	local colorBValue = Engine.DvarFloat( "demo_lightmanMarkerLightColorB" )
	lightmanMarkerOptionsPopup.colorBValue = lightmanMarkerOptionsPopup.buttonList:addDvarLeftRightSlider( controller, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_B", string.format( "%.2f", colorBValue ) ), "demo_lightmanMarkerLightColorB", 0, 1, nil, sliderSpacing )
	lightmanMarkerOptionsPopup.colorBValue:setSliderCallback( DemoPopup_LightmanMarkerOptionsPopup_SliderCallback )
	lightmanMarkerOptionsPopup.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	lightmanMarkerOptionsPopup.repositionCamera = lightmanMarkerOptionsPopup.buttonList:addButton( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REPOSITION" ) )
	lightmanMarkerOptionsPopup.repositionCamera:setActionEventName( "reposition_camera" )
	lightmanMarkerOptionsPopup:registerEventHandler( "reposition_camera", DemoPopup_LightmanMarkerOptionsPopup_RepositionCamera )
	lightmanMarkerOptionsPopup.removeMarker = lightmanMarkerOptionsPopup.buttonList:addButton( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REMOVE" ) )
	lightmanMarkerOptionsPopup.removeMarker:setActionEventName( "remove_marker" )
	lightmanMarkerOptionsPopup:registerEventHandler( "remove_marker", DemoPopup_LightmanMarkerOptionsPopup_RemoveMarker )
	lightmanMarkerOptionsPopup.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	lightmanMarkerOptionsPopup.removeAllMarkers = lightmanMarkerOptionsPopup.buttonList:addButton( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REMOVE_ALL" ) )
	lightmanMarkerOptionsPopup.removeAllMarkers:setActionEventName( "remove_all_markers" )
	lightmanMarkerOptionsPopup:registerEventHandler( "remove_all_markers", DemoPopup_LightmanMarkerOptionsPopup_RemoveAllMarkers )
	lightmanMarkerOptionsPopup.buttonList:processEvent( {
		name = "gain_focus"
	} )
	lightmanMarkerOptionsPopup:processEvent( {
		name = "demo_lightman_marker_options_update",
		controller = controller
	} )
	return lightmanMarkerOptionsPopup
end

CoD.DemoPopup.OpenLightmanMarkerOptionsPopup = function ( self, event )
	self:openPopup( "Demo_Lightman_Marker_Options", event.controller )
end

