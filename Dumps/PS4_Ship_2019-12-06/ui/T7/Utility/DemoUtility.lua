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

CoD.DemoUtility.OpenSavePopup = function ( f3_arg0, f3_arg1 )
	local f3_local0 = nil
	if f3_arg1.menuName == "demo_save_clip" then
		f3_local0 = CoD.OverlayUtility.CreateOverlay( f3_arg1.controller, f3_arg0, "DemoSaveClipPopup" )
	else
		
	end
	if f3_local0 then
		f3_local0:registerEventHandler( "demo_close_save_popup", function ( element, event, f4_arg2, f4_arg3 )
			GoBack( element, f4_arg2 )
		end )
	end
end

CoD.DemoUtility.GetDemoContextMode = function ()
	return Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ) )
end

CoD.DemoUtility.SetDemoContextMode = function ( f6_arg0 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" ), f6_arg0 )
end

CoD.DemoUtility.GetEditingDollyCameraMarker = function ()
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" ) )
end

CoD.DemoUtility.SetEditingMode = function ( f8_arg0, f8_arg1 )
	if f8_arg1 == true then
		Engine.Exec( f8_arg0, "demo_editdollycammarker 1" )
	else
		Engine.Exec( f8_arg0, "demo_editdollycammarker 0" )
	end
end

CoD.DemoUtility.SwitchToDollyCamMarker = function ( f9_arg0, f9_arg1 )
	Engine.Exec( f9_arg0, "demo_switchdollycammarker " .. f9_arg1 )
end

CoD.DemoUtility.RemoveDollyCamMarker = function ( f10_arg0, f10_arg1 )
	Engine.Exec( f10_arg0, "demo_removedollycammarker " .. f10_arg1 )
end

CoD.DemoUtility.RepositionDollyCamMarker = function ( f11_arg0, f11_arg1 )
	Engine.Exec( f11_arg0, "demo_repositiondollycammarker " .. f11_arg1 )
end

CoD.DemoUtility.RunPauseCommand = function ( f12_arg0 )
	Engine.ExecNow( f12_arg0, "demo_pause" )
end

CoD.DemoUtility.UnpauseIfPaused = function ( f13_arg0 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.isPaused" ) ) then
		CoD.DemoUtility.RunPauseCommand( f13_arg0 )
	end
end

CoD.DemoUtility.RegisterEventHandlers = function ( f14_arg0, f14_arg1 )
	if not Engine.IsDemoPlaying() then
		return 
	end
	f14_arg0:registerEventHandler( "open_demo_save_popup", CoD.DemoUtility.OpenSavePopup )
	local f14_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "demo" )
	Engine.SetModelValue( Engine.CreateModel( f14_local0, "showChooseModeSidebar" ), false )
	Engine.SetModelValue( Engine.CreateModel( f14_local0, "showOptionsSidebar" ), false )
	if Engine.IsDemoClipPlaying() then
		Engine.SetModelValue( Engine.CreateModel( f14_local0, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK )
	else
		Engine.SetModelValue( Engine.CreateModel( f14_local0, "contextMode" ), Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC )
	end
end

