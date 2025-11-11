CoD.DemoUtility = {}
CoD.DemoUtility.GetRoundedTimeScale = function ( timeScale, digits )
	if not timeScale then
		timeScale = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.timescale" ) )
	end
	if not digits then
		digits = 1
	end
	local shift = 10 ^ digits
	local roundedTimeScale = math.floor( timeScale * shift + 0.5 ) / shift
	return roundedTimeScale
end

CoD.DemoUtility.GetRoundedTimeScaleString = function ( roundedTimeScale )
	if not roundedTimeScale then
		roundedTimeScale = CoD.DemoUtility.GetRoundedTimeScale()
	end
	local roundedStr = string.format( "%.1f", roundedTimeScale )
	return roundedStr
end

CoD.DemoUtility.GetRoundedLightFloatParam = function ( value )
	local roundedStr = string.format( "%.1f", value )
	return roundedStr
end

CoD.DemoUtility.GetDemoContextMode = function ()
	local contextModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
	return Engine.GetModelValue( contextModeModel )
end

CoD.DemoUtility.SetDemoContextMode = function ( enumValue )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), enumValue )
end

CoD.DemoUtility.GetEditingDollyCameraMarker = function ()
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" )
	return Engine.GetModelValue( model )
end

CoD.DemoUtility.SetEditingDollyCameraMarker = function ( controller, flag )
	if flag == true then
		Engine.Exec( controller, "demo_editdollycammarker 1" )
	else
		Engine.Exec( controller, "demo_editdollycammarker 0" )
	end
end

CoD.DemoUtility.SwitchToDollyCamMarker = function ( controller, markerNum )
	Engine.Exec( controller, "demo_switchdollycammarker " .. markerNum )
end

CoD.DemoUtility.RemoveDollyCamMarker = function ( controller, markerNum )
	Engine.Exec( controller, "demo_removedollycammarker " .. markerNum )
end

CoD.DemoUtility.RepositionDollyCamMarker = function ( controller, markerNum )
	Engine.Exec( controller, "demo_repositiondollycammarker " .. markerNum )
end

CoD.DemoUtility.GetEditingLightmanMarker = function ()
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" )
	return Engine.GetModelValue( model )
end

CoD.DemoUtility.SetEditingLightmanMarker = function ( controller, flag )
	if flag == true then
		Engine.Exec( controller, "demo_editlightmanmarker 1" )
	else
		Engine.Exec( controller, "demo_editlightmanmarker 0" )
	end
end

CoD.DemoUtility.SwitchToLightmanMarker = function ( controller, markerNum )
	Engine.Exec( controller, "demo_switchlightmanmarker " .. markerNum )
end

CoD.DemoUtility.RemoveLightmanMarker = function ( controller, markerNum )
	Engine.Exec( controller, "demo_removelightmanmarker " .. markerNum )
end

CoD.DemoUtility.RepositionLightmanMarker = function ( controller, markerNum )
	Engine.Exec( controller, "demo_repositionlightmanmarker " .. markerNum )
end

CoD.DemoUtility.SetCurrentLightmanColor = function ( controller, strColor )
	local color = CoD.ColorUtility.GetColorFromFormattedColorString( strColor )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorR" ), color.r )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorG" ), color.g )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorB" ), color.b )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
end

CoD.DemoUtility.RunPauseCommand = function ( controller )
	Engine.ExecNow( controller, "demo_pause" )
end

CoD.DemoUtility.UnpauseIfPaused = function ( controller )
	local demoPausedModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.isPaused" )
	local isPaused = Engine.GetModelValue( demoPausedModel )
	if isPaused then
		CoD.DemoUtility.RunPauseCommand( controller )
	end
end

CoD.DemoUtility.IsRestrictedBasicMode = function ()
	local restrictedBasicModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.restrictedBasicMode" )
	return Engine.GetModelValue( restrictedBasicModeModel )
end

CoD.DemoUtility.OpenSavePopup = function ( self, event )
	local menu = nil
	local menuName = event.menuName
	local controller = event.controller
	if menuName == "demo_save_clip" then
		menu = CoD.OverlayUtility.CreateOverlay( controller, self, "DemoSaveClipPopup" )
	else
		Engine.ExecNow( controller, "setupThumbnailForFileshareSave screenshot" )
		CoD.FileshareUtility.OpenPrivateUploadPopup( self, controller, "screenshot_private", function ( controller )
			Engine.SaveScreenshot( controller, false, 0 )
		end )
	end
	if menu then
		menu:registerEventHandler( "demo_close_save_popup", function ( self, element, controller, menu )
			GoBack( self, controller )
		end )
	end
end

CoD.DemoUtility.OpenManageSegments = function ( self, event )
	StartMenuOpenManageSegments( self, nil, event.controller, nil, self )
end

CoD.DemoUtility.OpenStartHighlightReel = function ( self, event )
	local controller = event.controller
	local menu = CoD.OverlayUtility.CreateOverlay( controller, self, "DemoStartHighlightReelPopup" )
	Dvar.demo_pause:set( true )
end

CoD.DemoUtility.LastActivatedInformationScreen = 0
CoD.DemoUtility.AnimateToAlpha = function ( self, duration, targetAlpha )
	self:beginAnimation( "keyframe", duration, false, false, CoD.TweenType.Linear )
	self:setAlpha( targetAlpha )
end

CoD.DemoUtility.ActivateInformationScreen = function ( self, event )
	CoD.DemoUtility.LastActivatedInformationScreen = event.informationScreenType
	if LUI.roots.UIRootFull.demoInformationScreenBlackBackground == nil then
		return 
	elseif event == nil then
		return 
	end
	local targetAlpha = event.targetAlpha or 0
	if event.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_NONE then
		return 
	elseif event.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN or event.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
		CoD.DemoUtility.AnimateToAlpha( LUI.roots.UIRootFull.demoInformationScreenBlackBackground, event.animationTime, targetAlpha )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_PREPARING" ) )
		CoD.DemoUtility.AnimateToAlpha( LUI.roots.UIRootFull.demoInformationScreenInformationText, event.animationTime * 0.8, targetAlpha )
		CoD.DemoUtility.AnimateToAlpha( LUI.roots.UIRootFull.demoInformationScreenSpinner, event.animationTime * 0.8, targetAlpha )
	end
	if event.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_TRANSITION then
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( "" )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:setAlpha( 1 )
		CoD.DemoUtility.AnimateToAlpha( LUI.roots.UIRootFull.demoInformationScreenBlackBackground, event.animationTime, targetAlpha )
	end
	if event.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_WAITING_FOR_DOWNLOAD then
		CoD.DemoUtility.AnimateToAlpha( LUI.roots.UIRootFull.demoInformationScreenBlackBackground, event.animationTime, 0 )
		CoD.DemoUtility.AnimateToAlpha( LUI.roots.UIRootFull.demoInformationScreenInformationText, event.animationTime, targetAlpha )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_BUFFERING" ) )
		CoD.DemoUtility.AnimateToAlpha( LUI.roots.UIRootFull.demoInformationScreenSpinner, event.animationTime, targetAlpha )
	end
end

CoD.DemoUtility.AddInformationScreen = function ( self )
	if LUI.roots.UIRootFull.demoInformationScreenContainer then
		return 
	else
		local demoInformationScreenContainer = LUI.UIContainer.new()
		demoInformationScreenContainer:setPriority( 100 )
		local blackBackgroundScreen = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
		blackBackgroundScreen:setRGB( 0, 0, 0 )
		blackBackgroundScreen:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground = blackBackgroundScreen
		demoInformationScreenContainer:addElement( blackBackgroundScreen )
		local informationText = LUI.UIText.new( 0, 1, 0, 0, 0.5, 0.5, -CoD.textSize.Condensed / 2, CoD.textSize.Condensed / 2 )
		informationText:setFont( CoD.fonts.Condensed )
		informationText:setAlignment( LUI.Alignment.Center )
		informationText:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenInformationText = informationText
		demoInformationScreenContainer:addElement( informationText )
		local spinnerSize = 60
		local informationSpinner = LUI.UIImage.new( 0.5, 0.5, -spinnerSize / 2, spinnerSize / 2, 0.5, 0.5, CoD.textSize.Condensed, CoD.textSize.Condensed + spinnerSize )
		informationSpinner:setAlpha( 0 )
		informationSpinner:setMaterial( RegisterMaterial( "lui_loader" ) )
		informationSpinner:setShaderVector( 0, 0, 0, 0, 0 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner = informationSpinner
		demoInformationScreenContainer:addElement( informationSpinner )
		LUI.roots.UIRootFull:addElement( demoInformationScreenContainer )
		LUI.roots.UIRootFull.demoInformationScreenContainer = demoInformationScreenContainer
	end
end

CoD.DemoUtility.SetupUIModels = function ( controller )
	local demoModel = Engine.CreateModel( Engine.GetGlobalModel(), "demo" )
	Engine.SetModelValue( Engine.CreateModel( demoModel, "showChooseModeSidebar" ), false )
	Engine.SetModelValue( Engine.CreateModel( demoModel, "showOptionsSidebar" ), false )
	Engine.SetModelValue( Engine.CreateModel( demoModel, "showLightmanColorPicker" ), false )
	Engine.SetModelValue( Engine.CreateModel( demoModel, "numHighlightReelMoments" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( demoModel, "restrictedBasicMode" ), false )
	Engine.SetModelValue( Engine.CreateModel( demoModel, "cameraMode" ), Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE )
	if Engine.IsDemoClipPlaying() then
		Engine.SetModelValue( Engine.CreateModel( demoModel, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK )
	elseif Engine.IsDemoHighlightReelMode() then
		Engine.SetModelValue( Engine.CreateModel( demoModel, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_HIGHLIGHT_REEL )
	else
		Engine.SetModelValue( Engine.CreateModel( demoModel, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC )
	end
	local demoSegmentsModel = Engine.CreateModel( Engine.GetGlobalModel(), "DemoSegments" )
	local demoSegmentsRefreshModel = Engine.CreateModel( demoSegmentsModel, "refresh" )
	Engine.SetModelValue( demoSegmentsRefreshModel, 0 )
end

CoD.DemoUtility.RegisterEventHandlers = function ( self, controller )
	if not Engine.IsDemoPlaying() then
		return 
	end
	self:registerEventHandler( "open_demo_save_popup", CoD.DemoUtility.OpenSavePopup )
	self:registerEventHandler( "open_demo_manage_segments", CoD.DemoUtility.OpenManageSegments )
	self:registerEventHandler( "activate_demo_information_screen", CoD.DemoUtility.ActivateInformationScreen )
	CoD.DemoUtility.SetupUIModels( controller )
	local xuid = Engine.GetXUID64( controller )
	local isReady = CoD.FileshareUtility.IsFileshareReady( controller )
	if isReady == 0 or isReady == false or xuid ~= CoD.FileshareUtility.GetCurrentUser() then
		CoD.FileshareUtility.FetchContentForUser( controller, xuid )
		CoD.FileshareUtility.SetDirty()
	end
end

CoD.DemoUtility.AddHUDWidgets = function ( self, event )
	local isDemoPlaying = Engine.IsDemoPlaying()
	local controller = event.controller
	if isDemoPlaying then
		if self.safeArea and self.safeArea.Demo == nil then
			self.safeArea.Demo = CoD.Demo.new( self.safeArea, controller )
			self.safeArea.Demo:setLeftRight( true, true, 0, 0 )
			self.safeArea.Demo:setTopBottom( true, true, 0, 0 )
			self:addForceClosedSafeAreaChild( self.safeArea.Demo )
			self.safeArea.Demo:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self.safeArea.Demo:gainFocus( {
				controller = controller
			} )
			LUI.OverrideFunction_CallOriginalSecond( self.safeArea.Demo, "close", function ( element )
				CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement( self.safeArea, element )
			end )
			UpdateState( self.safeArea.Demo )
			self:registerEventHandler( "occlusion_change", function ( self, event )
				if not event.occluded then
					self.safeArea.Demo:processEvent( {
						name = "gain_focus",
						controller = controller
					} )
				end
				CoD.Menu.OcclusionChange( self, event )
			end )
		end
		CoD.DemoUtility.AddInformationScreen( self )
		if event.activateDemoStartScreen then
			if CoD.DemoUtility.LastActivatedInformationScreen ~= Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
				CoD.DemoUtility.ActivateInformationScreen( self, {
					controller = controller,
					informationScreenType = Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN,
					animationTime = 0,
					targetAlpha = 1
				} )
			end
		elseif event.openHighlightStartScreen then
			CoD.DemoUtility.OpenStartHighlightReel( self, event )
		end
	elseif self.safeArea and self.safeArea.Demo ~= nil then
		self.safeArea.Demo:close()
		self.safeArea.Demo = nil
	end
end

CoD.DemoUtility.SetupDemoSegmentModel = function ( segmentIndex )
	local name = ""
	local duration = ""
	local transitionText = ""
	local score = 0
	local stars = 0
	local isEmpty = true
	local segmentCount = Engine.GetDemoSegmentCount()
	local demoSegmentsModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	local model = Engine.CreateModel( demoSegmentsModel, segmentIndex )
	Engine.SetModelValue( Engine.CreateModel( model, "segmentNumber" ), segmentIndex + 1 )
	if segmentIndex < segmentCount then
		name = Engine.GetDemoSegmentInformation( segmentIndex, "name" )
		duration = Engine.GetDemoSegmentInformation( segmentIndex, "durationTimeDisplay" )
		local transition = Engine.GetDemoSegmentInformation( segmentIndex, "transition" )
		transitionText = Engine.Localize( "MENU_TRANSITION" ) .. transition
		if Engine.IsDemoHighlightReelMode() then
			local segmentScore = tonumber( Engine.GetDemoSegmentInformation( segmentIndex, "score" ) )
			local segmentStars = tonumber( Engine.GetDemoSegmentInformation( segmentIndex, "stars" ) )
			score = segmentScore
			stars = segmentStars
		end
		isEmpty = false
	end
	Engine.SetModelValue( Engine.CreateModel( model, "name" ), name )
	Engine.SetModelValue( Engine.CreateModel( model, "duration" ), duration )
	Engine.SetModelValue( Engine.CreateModel( model, "transitionText" ), transitionText )
	Engine.SetModelValue( Engine.CreateModel( model, "stars" ), score )
	Engine.SetModelValue( Engine.CreateModel( model, "score" ), stars )
	Engine.SetModelValue( Engine.CreateModel( model, "disabled" ), isEmpty )
	return model
end

CoD.DemoUtility.Timeline_SetSelectedSegmentModel = function ( segmentModel )
	Engine.SetModelValue( Engine.CreateModel( segmentModel, "selected" ), true )
end

CoD.DemoUtility.Timeline_GetSelectedSegmentModel = function ()
	local segmentCount = Engine.GetDemoSegmentCount()
	local demoSegmentsModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if demoSegmentsModel then
		for i = 1, segmentCount, 1 do
			local segmentModel = Engine.GetModel( demoSegmentsModel, i - 1 )
			if segmentModel then
				local selectedModel = Engine.GetModel( segmentModel, "selected" )
				if selectedModel and Engine.GetModelValue( selectedModel ) == true then
					return segmentModel
				end
			end
		end
	end
	return nil
end

CoD.DemoUtility.Timeline_GetHighlightedSegmentModel = function ()
	local segmentCount = Engine.GetDemoSegmentCount()
	local demoSegmentsModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if demoSegmentsModel then
		for i = 1, segmentCount, 1 do
			local segmentModel = Engine.GetModel( demoSegmentsModel, i - 1 )
			if segmentModel then
				local highlightedModel = Engine.GetModel( segmentModel, "highlighted" )
				if highlightedModel and Engine.GetModelValue( highlightedModel ) == true then
					return segmentModel
				end
			end
		end
	end
	return nil
end

CoD.DemoUtility.SetNumHighlightReelMomentsModel = function ( value )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "demo.numHighlightReelMoments" )
	Engine.SetModelValue( model, value )
end

CoD.DemoUtility.GetNumHighlightReelMomentsModel = function ()
	local model = Engine.GetModel( Engine.GetGlobalModel(), "demo.numHighlightReelMoments" )
	return model
end

CoD.DemoUtility.RebuildHighlightReelTimeline = function ( controller )
	Engine.ExecNow( controller, "demo_rebuildhighlightreeltimeline" )
	local numAvailableMoments = Engine.GetNumberOfHighlightReelMoments()
	CoD.DemoUtility.SetNumHighlightReelMomentsModel( numAvailableMoments )
end

CoD.DemoUtility.Options_ItemSelected = function ( self, element, controller, dvarName, menu )
	if Dvar[dvarName]:get() == element.value then
		return 
	end
	Engine.SetDvar( dvarName, element.value )
	if element.valueChangedCallback then
		element.valueChangedCallback( menu, controller, dvarName, element.value )
	end
end

CoD.DemoUtility.Options_RevertItemSelected = function ( self, element, controller, dvarName, model, menu )
	local currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( controller, element.options, Dvar[dvarName]:get() )
	local model = self:getModel( controller, "currentSelection" )
	local selectedIndex = Engine.GetModelValue( model )
	local row, col = self.Slider:getRowAndColumnForIndex( selectedIndex - 1 )
	self.Slider:setActiveIndex( row, col, 0 )
end

CoD.DemoUtility.Options_GetProfileSelection = function ( controller, options, dvarName )
	local dvarValue = Dvar[dvarName]:get()
	return CoD.OptionsUtility.GetCustomProfileSelection( controller, options, dvarValue )
end

