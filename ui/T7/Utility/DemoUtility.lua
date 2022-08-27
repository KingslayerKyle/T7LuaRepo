-- b893ed9d8b614c7b66e24b19397074bb
-- This hash is used for caching, delete to decompile the file again

CoD.DemoUtility = {}
CoD.DemoUtility.GetRoundedTimeScale = function ( f1_arg0, f1_arg1 )
	if not f1_arg0 then
		f1_arg0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.timescale" ) )
	end
	if not f1_arg1 then
		f1_arg1 = 1
	end
	local f1_local0 = 10 ^ f1_arg1
	return math.floor( f1_arg0 * f1_local0 + 0.5 ) / f1_local0
end

CoD.DemoUtility.GetRoundedTimeScaleString = function ( f2_arg0 )
	if not f2_arg0 then
		f2_arg0 = CoD.DemoUtility.GetRoundedTimeScale()
	end
	return string.format( "%.1f", f2_arg0 )
end

CoD.DemoUtility.GetRoundedLightFloatParam = function ( f3_arg0 )
	return string.format( "%.1f", f3_arg0 )
end

CoD.DemoUtility.GetDemoContextMode = function ()
	return Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ) )
end

CoD.DemoUtility.SetDemoContextMode = function ( f5_arg0 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), f5_arg0 )
end

CoD.DemoUtility.GetEditingDollyCameraMarker = function ()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" ) )
end

CoD.DemoUtility.SetEditingDollyCameraMarker = function ( f7_arg0, f7_arg1 )
	if f7_arg1 == true then
		Engine.Exec( f7_arg0, "demo_editdollycammarker 1" )
	else
		Engine.Exec( f7_arg0, "demo_editdollycammarker 0" )
	end
end

CoD.DemoUtility.SwitchToDollyCamMarker = function ( f8_arg0, f8_arg1 )
	Engine.Exec( f8_arg0, "demo_switchdollycammarker " .. f8_arg1 )
end

CoD.DemoUtility.RemoveDollyCamMarker = function ( f9_arg0, f9_arg1 )
	Engine.Exec( f9_arg0, "demo_removedollycammarker " .. f9_arg1 )
end

CoD.DemoUtility.RepositionDollyCamMarker = function ( f10_arg0, f10_arg1 )
	Engine.Exec( f10_arg0, "demo_repositiondollycammarker " .. f10_arg1 )
end

CoD.DemoUtility.GetEditingLightmanMarker = function ()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" ) )
end

CoD.DemoUtility.SetEditingLightmanMarker = function ( f12_arg0, f12_arg1 )
	if f12_arg1 == true then
		Engine.Exec( f12_arg0, "demo_editlightmanmarker 1" )
	else
		Engine.Exec( f12_arg0, "demo_editlightmanmarker 0" )
	end
end

CoD.DemoUtility.SwitchToLightmanMarker = function ( f13_arg0, f13_arg1 )
	Engine.Exec( f13_arg0, "demo_switchlightmanmarker " .. f13_arg1 )
end

CoD.DemoUtility.RemoveLightmanMarker = function ( f14_arg0, f14_arg1 )
	Engine.Exec( f14_arg0, "demo_removelightmanmarker " .. f14_arg1 )
end

CoD.DemoUtility.RepositionLightmanMarker = function ( f15_arg0, f15_arg1 )
	Engine.Exec( f15_arg0, "demo_repositionlightmanmarker " .. f15_arg1 )
end

CoD.DemoUtility.SetCurrentLightmanColor = function ( f16_arg0, f16_arg1 )
	local f16_local0 = CoD.GetColorFromFormattedColorString( f16_arg1 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorR" ), f16_local0.r )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorG" ), f16_local0.g )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorB" ), f16_local0.b )
	Engine.Exec( f16_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
end

CoD.DemoUtility.RunPauseCommand = function ( f17_arg0 )
	Engine.ExecNow( f17_arg0, "demo_pause" )
end

CoD.DemoUtility.UnpauseIfPaused = function ( f18_arg0 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.isPaused" ) ) then
		CoD.DemoUtility.RunPauseCommand( f18_arg0 )
		return true
	else
		return false
	end
end

CoD.DemoUtility.IsRestrictedBasicMode = function ()
	return Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.restrictedBasicMode" ) )
end

CoD.DemoUtility.OpenSavePopup = function ( f20_arg0, f20_arg1 )
	local f20_local0 = nil
	local f20_local1 = f20_arg1.menuName
	local f20_local2 = f20_arg1.controller
	if f20_local1 == "demo_save_clip" then
		f20_local0 = CoD.OverlayUtility.CreateOverlay( f20_local2, f20_arg0, "DemoSaveClipPopup" )
	else
		Engine.ExecNow( f20_local2, "setupThumbnailForFileshareSave screenshot" )
		CoD.FileshareUtility.OpenPrivateUploadPopup( f20_arg0, f20_local2, "screenshot_private", function ( f21_arg0 )
			Engine.SaveScreenshot( f21_arg0, false, 0 )
		end )
	end
	if f20_local0 then
		f20_local0:registerEventHandler( "demo_close_save_popup", function ( element, event, f22_arg2, f22_arg3 )
			GoBack( element, f22_arg2 )
		end )
	end
end

CoD.DemoUtility.OpenManageSegments = function ( f23_arg0, f23_arg1 )
	StartMenuOpenManageSegments( f23_arg0, nil, f23_arg1.controller, nil, f23_arg0 )
end

CoD.DemoUtility.OpenStartHighlightReel = function ( f24_arg0, f24_arg1 )
	local f24_local0 = CoD.OverlayUtility.CreateOverlay( f24_arg1.controller, f24_arg0, "DemoStartHighlightReelPopup" )
	Dvar.demo_pause:set( true )
end

CoD.DemoUtility.LastActivatedInformationScreen = 0
CoD.DemoUtility.ActivateInformationScreen = function ( f25_arg0, f25_arg1 )
	CoD.DemoUtility.LastActivatedInformationScreen = f25_arg1.informationScreenType
	if LUI.roots.UIRootFull.demoInformationScreenBlackBackground == nil then
		return 
	elseif f25_arg1 == nil then
		return 
	end
	local f25_local0 = "fade_out"
	if f25_arg1.animationState ~= nil then
		f25_local0 = f25_arg1.animationState
	end
	if f25_arg1.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_NONE then
		return 
	elseif f25_arg1.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN or f25_arg1.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( f25_local0, f25_arg1.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_PREPARING" ) )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:animateToState( f25_local0, f25_arg1.animationTime * 0.8 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:animateToState( f25_local0, f25_arg1.animationTime * 0.8 )
	end
	if f25_arg1.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_TRANSITION then
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( "" )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:setAlpha( 1 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( f25_local0, f25_arg1.animationTime )
	end
	if f25_arg1.informationScreenType == Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_WAITING_FOR_DOWNLOAD then
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( "fade_out", f25_arg1.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:animateToState( f25_local0, f25_arg1.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_BUFFERING" ) )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:animateToState( f25_local0, f25_arg1.animationTime )
	end
end

CoD.DemoUtility.AddInformationScreen = function ( f26_arg0 )
	if LUI.roots.UIRootFull.demoInformationScreenContainer then
		return 
	else
		local self = LUI.UIContainer.new()
		self:setPriority( 100 )
		local f26_local1 = LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 0
		} )
		f26_local1:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		f26_local1:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground = f26_local1
		self:addElement( f26_local1 )
		local f26_local2 = LUI.UIText.new( {
			left = 0,
			top = -CoD.textSize.Condensed / 2,
			right = 0,
			bottom = CoD.textSize.Condensed / 2,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = false,
			font = CoD.fonts.Condensed,
			alignment = LUI.Alignment.Center,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0
		} )
		f26_local2:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		f26_local2:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenInformationText = f26_local2
		self:addElement( f26_local2 )
		local f26_local3 = 60
		local f26_local4 = LUI.UIImage.new( {
			left = -f26_local3 / 2,
			top = CoD.textSize.Condensed,
			right = f26_local3 / 2,
			bottom = CoD.textSize.Condensed + f26_local3,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0,
			material = RegisterMaterial( "lui_loader" )
		} )
		f26_local4:setShaderVector( 0, 0, 0, 0, 0 )
		f26_local4:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		f26_local4:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenSpinner = f26_local4
		self:addElement( f26_local4 )
		LUI.roots.UIRootFull:addElement( self )
		LUI.roots.UIRootFull.demoInformationScreenContainer = self
	end
end

CoD.DemoUtility.SetupUIModels = function ( f27_arg0 )
	local f27_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "demo" )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "showChooseModeSidebar" ), false )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "showOptionsSidebar" ), false )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "showLightmanColorPicker" ), false )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "numHighlightReelMoments" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "restrictedBasicMode" ), false )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "uploadPopupOpen" ), false )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "cameraMode" ), Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "clientXUID" ), Engine.DefaultID64Value() )
	Engine.SetModelValue( Engine.CreateModel( f27_local0, "networkProfiling" ), false )
	if Engine.IsDemoClipPlaying() then
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK )
	elseif Engine.IsDemoHighlightReelMode() then
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_HIGHLIGHT_REEL )
	else
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "DemoSegments" ), "refresh" ), 0 )
end

CoD.DemoUtility.RegisterEventHandlers = function ( f28_arg0, f28_arg1 )
	if not Engine.IsDemoPlaying() then
		return 
	end
	f28_arg0:registerEventHandler( "open_demo_save_popup", CoD.DemoUtility.OpenSavePopup )
	f28_arg0:registerEventHandler( "open_demo_manage_segments", CoD.DemoUtility.OpenManageSegments )
	f28_arg0:registerEventHandler( "activate_demo_information_screen", CoD.DemoUtility.ActivateInformationScreen )
	CoD.DemoUtility.SetupUIModels( f28_arg1 )
	local f28_local0 = Engine.GetXUID64( f28_arg1 )
	local f28_local1 = CoD.FileshareUtility.IsFileshareReady( f28_arg1 )
	if f28_local1 == 0 or f28_local1 == false or f28_local0 ~= CoD.FileshareUtility.GetCurrentUser() then
		CoD.FileshareUtility.FetchContentForUser( f28_arg1, f28_local0 )
		CoD.FileshareUtility.SetDirty()
	end
end

CoD.DemoUtility.AddHUDWidgets = function ( f29_arg0, f29_arg1 )
	local f29_local0 = Engine.IsDemoPlaying()
	local f29_local1 = f29_arg1.controller
	if f29_local0 then
		if f29_arg0.safeArea and f29_arg0.safeArea.Demo == nil then
			f29_arg0.safeArea.Demo = CoD.Demo.new( f29_arg0.safeArea, f29_local1 )
			f29_arg0.safeArea.Demo:setLeftRight( true, true, 0, 0 )
			f29_arg0.safeArea.Demo:setTopBottom( true, true, 0, 0 )
			f29_arg0:addForceClosedSafeAreaChild( f29_arg0.safeArea.Demo )
			f29_arg0.safeArea.Demo:processEvent( {
				name = "gain_focus",
				controller = f29_local1
			} )
			f29_arg0.safeArea.Demo:gainFocus( {
				controller = f29_local1
			} )
			LUI.OverrideFunction_CallOriginalSecond( f29_arg0.safeArea.Demo, "close", function ( element )
				CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement( f29_arg0.safeArea, element )
			end )
			UpdateState( f29_arg0.safeArea.Demo )
			f29_arg0:registerEventHandler( "occlusion_change", function ( element, event )
				if not event.occluded then
					element.safeArea.Demo:processEvent( {
						name = "gain_focus",
						controller = f29_local1
					} )
				end
				CoD.Menu.OcclusionChange( element, event )
			end )
		end
		CoD.DemoUtility.AddInformationScreen( f29_arg0 )
		if f29_arg1.activateDemoStartScreen then
			if CoD.DemoUtility.LastActivatedInformationScreen ~= Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
				CoD.DemoUtility.ActivateInformationScreen( f29_arg0, {
					controller = f29_local1,
					informationScreenType = Enum.demoInformationScreenTypes.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN,
					animationTime = 0,
					animationState = "fade_in"
				} )
			end
		elseif f29_arg1.openHighlightStartScreen then
			CoD.DemoUtility.OpenStartHighlightReel( f29_arg0, f29_arg1 )
		end
	elseif f29_arg0.safeArea and f29_arg0.safeArea.Demo ~= nil then
		f29_arg0.safeArea.Demo:close()
		f29_arg0.safeArea.Demo = nil
	end
end

CoD.DemoUtility.SetupDemoSegmentModel = function ( f32_arg0 )
	local f32_local0 = ""
	local f32_local1 = ""
	local f32_local2 = ""
	local f32_local3 = 0
	local f32_local4 = 0
	local f32_local5 = true
	local f32_local6 = Engine.GetDemoSegmentCount()
	local f32_local7 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" ), f32_arg0 )
	Engine.SetModelValue( Engine.CreateModel( f32_local7, "segmentNumber" ), f32_arg0 + 1 )
	if f32_arg0 < f32_local6 then
		f32_local0 = Engine.GetDemoSegmentInformation( f32_arg0, "name" )
		f32_local1 = Engine.GetDemoSegmentInformation( f32_arg0, "durationTimeDisplay" )
		f32_local2 = Engine.Localize( "MENU_TRANSITION" ) .. Engine.GetDemoSegmentInformation( f32_arg0, "transition" )
		if Engine.IsDemoHighlightReelMode() then
			local f32_local8 = tonumber( Engine.GetDemoSegmentInformation( f32_arg0, "score" ) )
			local f32_local9 = tonumber( Engine.GetDemoSegmentInformation( f32_arg0, "stars" ) )
			f32_local3 = f32_local8
			f32_local4 = f32_local9
		end
		f32_local5 = false
	end
	Engine.SetModelValue( Engine.CreateModel( f32_local7, "name" ), f32_local0 )
	Engine.SetModelValue( Engine.CreateModel( f32_local7, "duration" ), f32_local1 )
	Engine.SetModelValue( Engine.CreateModel( f32_local7, "transitionText" ), f32_local2 )
	Engine.SetModelValue( Engine.CreateModel( f32_local7, "stars" ), f32_local3 )
	Engine.SetModelValue( Engine.CreateModel( f32_local7, "score" ), f32_local4 )
	Engine.SetModelValue( Engine.CreateModel( f32_local7, "disabled" ), f32_local5 )
	return f32_local7
end

CoD.DemoUtility.Timeline_SetSelectedSegmentModel = function ( f33_arg0 )
	Engine.SetModelValue( Engine.CreateModel( f33_arg0, "selected" ), true )
end

CoD.DemoUtility.Timeline_GetSelectedSegmentModel = function ()
	local f34_local0 = Engine.GetDemoSegmentCount()
	local f34_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if f34_local1 then
		for f34_local2 = 1, f34_local0, 1 do
			local f34_local5 = Engine.GetModel( f34_local1, f34_local2 - 1 )
			if f34_local5 then
				local f34_local6 = Engine.GetModel( f34_local5, "selected" )
				if f34_local6 and Engine.GetModelValue( f34_local6 ) == true then
					return f34_local5
				end
			end
		end
	end
	return nil
end

CoD.DemoUtility.Timeline_GetHighlightedSegmentModel = function ()
	local f35_local0 = Engine.GetDemoSegmentCount()
	local f35_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if f35_local1 then
		for f35_local2 = 1, f35_local0, 1 do
			local f35_local5 = Engine.GetModel( f35_local1, f35_local2 - 1 )
			if f35_local5 then
				local f35_local6 = Engine.GetModel( f35_local5, "highlighted" )
				if f35_local6 and Engine.GetModelValue( f35_local6 ) == true then
					return f35_local5
				end
			end
		end
	end
	return nil
end

CoD.DemoUtility.SetNumHighlightReelMomentsModel = function ( f36_arg0 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.numHighlightReelMoments" ), f36_arg0 )
end

CoD.DemoUtility.GetNumHighlightReelMomentsModel = function ()
	return Engine.GetModel( Engine.GetGlobalModel(), "demo.numHighlightReelMoments" )
end

CoD.DemoUtility.RebuildHighlightReelTimeline = function ( f38_arg0 )
	Engine.ExecNow( f38_arg0, "demo_rebuildhighlightreeltimeline" )
	CoD.DemoUtility.SetNumHighlightReelMomentsModel( Engine.GetNumberOfHighlightReelMoments() )
end

CoD.DemoUtility.Options_ItemSelected = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4 )
	if Dvar[f39_arg3]:get() == f39_arg1.value then
		return 
	end
	Engine.SetDvar( f39_arg3, f39_arg1.value )
	if f39_arg1.valueChangedCallback then
		f39_arg1.valueChangedCallback( f39_arg4, f39_arg2, f39_arg3, f39_arg1.value )
	end
end

CoD.DemoUtility.Options_RevertItemSelected = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4, f40_arg5 )
	local f40_local0 = CoD.OptionsUtility.GetCustomProfileSelection( f40_arg2, f40_arg1.options, Dvar[f40_arg3]:get() )
	local f40_local1, f40_local2 = f40_arg0.Slider:getRowAndColumnForIndex( Engine.GetModelValue( f40_arg0:getModel( f40_arg2, "currentSelection" ) ) - 1 )
	f40_arg0.Slider:setActiveIndex( f40_local1, f40_local2, 0 )
end

CoD.DemoUtility.Options_GetProfileSelection = function ( f41_arg0, f41_arg1, f41_arg2 )
	return CoD.OptionsUtility.GetCustomProfileSelection( f41_arg0, f41_arg1, Dvar[f41_arg2]:get() )
end

CoD.OverlayUtility.AddSystemOverlay( "ClipsUnavailableForPurchase", {
	menuName = "SystemOverlay_Compact",
	title = "MENU_NO_AVAILABLE_CLIPS",
	description = "MENU_NO_AVAILABLE_CLIPS_DESC",
	categoryType = CoD.OverlayUtility.OverlayTypes.Error,
	listDatasource = function ( f42_arg0, f42_arg1 )
		DataSources.ClipsUnavailableForPurchaseList = DataSourceHelpers.ListSetup( "ClipsUnavailableForPurchaseList", function ( f43_arg0, f43_arg1 )
			return {
				{
					models = {
						displayText = "MENU_OK"
					},
					properties = {
						action = function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3, f44_arg4 )
							GoBack( f44_arg4, f44_arg2 )
						end
						
					}
				}
			}
		end, true )
		return "ClipsUnavailableForPurchaseList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
