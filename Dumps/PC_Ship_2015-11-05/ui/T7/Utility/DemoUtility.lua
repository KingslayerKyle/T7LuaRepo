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

CoD.DemoUtility.OpenSavePopup = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	if f4_arg1.menuName == "demo_save_clip" then
		f4_local0 = CoD.OverlayUtility.CreateOverlay( f4_arg1.controller, f4_arg0, "DemoSaveClipPopup" )
	else
		
	end
	if f4_local0 then
		f4_local0:registerEventHandler( "demo_close_save_popup", function ( element, event, f5_arg2, f5_arg3 )
			GoBack( element, f5_arg2 )
		end )
	end
end

CoD.DemoUtility.GetDemoContextMode = function ()
	return Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ) )
end

CoD.DemoUtility.SetDemoContextMode = function ( f7_arg0 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), f7_arg0 )
end

CoD.DemoUtility.GetEditingDollyCameraMarker = function ()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" ) )
end

CoD.DemoUtility.SetEditingDollyCameraMarker = function ( f9_arg0, f9_arg1 )
	if f9_arg1 == true then
		Engine.Exec( f9_arg0, "demo_editdollycammarker 1" )
	else
		Engine.Exec( f9_arg0, "demo_editdollycammarker 0" )
	end
end

CoD.DemoUtility.SwitchToDollyCamMarker = function ( f10_arg0, f10_arg1 )
	Engine.Exec( f10_arg0, "demo_switchdollycammarker " .. f10_arg1 )
end

CoD.DemoUtility.RemoveDollyCamMarker = function ( f11_arg0, f11_arg1 )
	Engine.Exec( f11_arg0, "demo_removedollycammarker " .. f11_arg1 )
end

CoD.DemoUtility.RepositionDollyCamMarker = function ( f12_arg0, f12_arg1 )
	Engine.Exec( f12_arg0, "demo_repositiondollycammarker " .. f12_arg1 )
end

CoD.DemoUtility.GetEditingLightmanMarker = function ()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" ) )
end

CoD.DemoUtility.SetEditingLightmanMarker = function ( f14_arg0, f14_arg1 )
	if f14_arg1 == true then
		Engine.Exec( f14_arg0, "demo_editlightmanmarker 1" )
	else
		Engine.Exec( f14_arg0, "demo_editlightmanmarker 0" )
	end
end

CoD.DemoUtility.SwitchToLightmanMarker = function ( f15_arg0, f15_arg1 )
	Engine.Exec( f15_arg0, "demo_switchlightmanmarker " .. f15_arg1 )
end

CoD.DemoUtility.RemoveLightmanMarker = function ( f16_arg0, f16_arg1 )
	Engine.Exec( f16_arg0, "demo_removelightmanmarker " .. f16_arg1 )
end

CoD.DemoUtility.RepositionLightmanMarker = function ( f17_arg0, f17_arg1 )
	Engine.Exec( f17_arg0, "demo_repositionlightmanmarker " .. f17_arg1 )
end

CoD.DemoUtility.SetCurrentLightmanColor = function ( f18_arg0, f18_arg1 )
	local f18_local0 = CoD.GetColorFromFormattedColorString( f18_arg1 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorR" ), f18_local0.r )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorG" ), f18_local0.g )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorB" ), f18_local0.b )
	Engine.Exec( f18_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
end

CoD.DemoUtility.RunPauseCommand = function ( f19_arg0 )
	Engine.ExecNow( f19_arg0, "demo_pause" )
end

CoD.DemoUtility.UnpauseIfPaused = function ( f20_arg0 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.isPaused" ) ) then
		CoD.DemoUtility.RunPauseCommand( f20_arg0 )
	end
end

CoD.DemoUtility.IsRestrictedBasicMode = function ()
	return Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.restrictedBasicMode" ) )
end

CoD.DemoUtility.RegisterEventHandlers = function ( f22_arg0, f22_arg1 )
	if not Engine.IsDemoPlaying() then
		return 
	end
	f22_arg0:registerEventHandler( "open_demo_save_popup", CoD.DemoUtility.OpenSavePopup )
	local f22_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "demo" )
	Engine.SetModelValue( Engine.CreateModel( f22_local0, "showChooseModeSidebar" ), false )
	Engine.SetModelValue( Engine.CreateModel( f22_local0, "showOptionsSidebar" ), false )
	Engine.SetModelValue( Engine.CreateModel( f22_local0, "showLightmanColorPicker" ), false )
	if Dvar.demo_restrictedbasicmode:exists() and (Dvar.demo_restrictedbasicmode:get() == true or Dvar.demo_restrictedbasicmode:get() == "0") then
		Engine.SetModelValue( Engine.CreateModel( f22_local0, "restrictedBasicMode" ), false )
	else
		Engine.SetModelValue( Engine.CreateModel( f22_local0, "restrictedBasicMode" ), true )
	end
	if Engine.IsDemoClipPlaying() then
		Engine.SetModelValue( Engine.CreateModel( f22_local0, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK )
	else
		Engine.SetModelValue( Engine.CreateModel( f22_local0, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC )
	end
end

