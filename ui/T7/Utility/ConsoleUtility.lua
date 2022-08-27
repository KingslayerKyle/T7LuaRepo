-- 862f354c373d02130a84a4dcde61cc18
-- This hash is used for caching, delete to decompile the file again

CoD.ConsoleUtility = {}
CoD.ConsoleUtility.UpdateConsole = function ( f1_arg0 )
	local f1_local0 = 0
	for f1_local1 = 0, f1_arg0.maxElementIndex, 1 do
		if f1_arg0.lines[f1_local1].active then
			f1_arg0.lines[f1_local1].position = f1_arg0.lines[f1_local1].position + 1
			f1_arg0.lines[f1_local1].element:moveConsoleEntry( f1_arg0.lines[f1_local1].position )
			f1_local0 = f1_local0 + 1
		end
	end
	local f1_local1 = Engine.GetModelForController( f1_arg0.controller )
	local f1_local2 = Engine.GetModel( f1_arg0.consoleModel, "currentIndex" )
	local f1_local3 = Engine.GetModelValue( f1_local2 )
	if f1_arg0.maxElementIndex < f1_local0 then
		f1_arg0.lines[f1_local3].element:forceHideConsoleEntry()
	end
	local f1_local4 = f1_arg0.controller
	if not Engine.IsVisibilityBitSet( f1_local4, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
		if CoD.IsShoutcaster( f1_local4 ) and not CoD.ShoutcasterProfileVarBool( f1_local4, "shoutcaster_killfeed" ) then
			
		else
			f1_arg0.lines[f1_local3].element:showConsoleEntry( f1_local3 )
			f1_arg0.lines[f1_local3].active = true
		end
	end
	Engine.SetModelValue( f1_local2, (f1_local3 + 1) % (f1_arg0.maxElementIndex + 1) )
	return true
end

CoD.ConsoleUtility.ConsoleNotificationComplete = function ( f2_arg0, f2_arg1 )
	f2_arg0.lines[f2_arg1.id].active = false
	f2_arg0.lines[f2_arg1.id].position = 0
end

CoD.ConsoleUtility.Init = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	f3_arg0.controller = f3_arg1
	local f3_local0 = Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "hudItems." .. f3_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f3_local0, "currentIndex" ), 0 )
	f3_arg0.currentIndex = 0
	f3_arg0.maxElementIndex = f3_arg3 or 6
	f3_arg0.consoleModel = f3_local0
	f3_arg0.lines = {}
	for f3_local1 = 0, f3_arg0.maxElementIndex, 1 do
		f3_arg0.lines[f3_local1] = {}
		f3_arg0.lines[f3_local1].active = false
		f3_arg0.lines[f3_local1].name = "ConsoleEntry" .. f3_local1
		f3_arg0.lines[f3_local1].element = f3_arg0[f3_arg0.lines[f3_local1].name]
		f3_arg0.lines[f3_local1].position = 0
	end
	f3_arg0:registerEventHandler( "console_notification_complete", CoD.ConsoleUtility.ConsoleNotificationComplete )
	f3_arg0:subscribeToModel( f3_local0, function ( model )
		CoD.ConsoleUtility.UpdateConsole( f3_arg0 )
	end, false )
end

CoD.ConsoleUtility.CompleteAllAnimations = function ( f5_arg0 )
	f5_arg0.ConsoleEntry:completeAnimation()
	f5_arg0.ConsoleEntry.Text0:completeAnimation()
	f5_arg0.ConsoleEntry.Icon0:completeAnimation()
	f5_arg0.ConsoleEntry.Text1:completeAnimation()
	f5_arg0.ConsoleEntry.Icon1:completeAnimation()
end

CoD.ConsoleUtility.ShowConsoleEntry = function ( f6_arg0, f6_arg1 )
	f6_arg0.id = f6_arg1
	local f6_local0 = 4
	f6_arg0:completeAllAnimations()
	f6_arg0:setAlpha( 1 )
	f6_arg0.ConsoleEntry.Text0.Text:setAlpha( 0 )
	f6_arg0.ConsoleEntry.Icon0.Icon:setAlpha( 0 )
	f6_arg0.ConsoleEntry.Text1.Text:setAlpha( 0 )
	f6_arg0.ConsoleEntry.Icon1.Icon:setAlpha( 0 )
	local f6_local1, f6_local2, f6_local3, f6_local4 = f6_arg0:getLocalRect()
	f6_arg0:setTopBottom( false, true, -(f6_local4 - f6_local2), 0 )
	local f6_local5 = 0
	f6_local1 = f6_local1 + f6_local0 / 2
	local f6_local6 = function ( f7_arg0 )
		local f7_local0
		if f7_arg0 == nil or f7_arg0 == "" then
			f7_local0 = false
		else
			f7_local0 = true
		end
		return f7_local0
	end
	
	local f6_local7 = f6_arg0:getModel()
	f6_arg0.icon0Visible = f6_local6( Engine.GetModelValue( Engine.GetModel( f6_local7, "icon0" ) ) )
	f6_arg0.text0Visible = f6_local6( Engine.GetModelValue( Engine.GetModel( f6_local7, "text0" ) ) )
	f6_arg0.icon1Visible = f6_local6( Engine.GetModelValue( Engine.GetModel( f6_local7, "icon1" ) ) )
	f6_arg0.text1Visible = f6_local6( Engine.GetModelValue( Engine.GetModel( f6_local7, "text1" ) ) )
	if f6_arg0.icon0Visible then
		local f6_local8, f6_local9, f6_local10, f6_local11 = f6_arg0.ConsoleEntry.Icon0:getLocalRect()
		local f6_local12 = (f6_local11 - f6_local9) * Engine.GetModelValue( Engine.GetModel( f6_local7, "iconWidth" ) )
		if f6_local12 < 0 then
			f6_arg0.ConsoleEntry.Icon0:setLeftRight( true, false, f6_local1, f6_local1 - f6_local12 )
		else
			f6_arg0.ConsoleEntry.Icon0:setLeftRight( true, false, f6_local1 + f6_local12, f6_local1 )
		end
		f6_local1 = f6_local1 + math.abs( f6_local12 ) + f6_local0
		f6_arg0.ConsoleEntry.Icon0:playClip( "FadeIn" )
	end
	if f6_arg0.text0Visible then
		local f6_local8 = f6_arg0.ConsoleEntry.Text0.Text:getTextWidth()
		f6_arg0.ConsoleEntry.Text0:setLeftRight( true, false, f6_local1, f6_local1 + f6_local8 )
		f6_local1 = f6_local1 + f6_local8 + f6_local0
		f6_arg0.ConsoleEntry.Text0:playClip( "FadeIn" )
	end
	if f6_arg0.icon1Visible then
		local f6_local8, f6_local9, f6_local10, f6_local11 = f6_arg0.ConsoleEntry.Icon1:getLocalRect()
		local f6_local12 = (f6_local11 - f6_local9) * Engine.GetModelValue( Engine.GetModel( f6_local7, "iconWidth" ) )
		if f6_local12 < 0 then
			f6_arg0.ConsoleEntry.Icon1:setLeftRight( true, false, f6_local1 - f6_local12, f6_local1 )
		else
			f6_arg0.ConsoleEntry.Icon1:setLeftRight( true, false, f6_local1, f6_local1 + f6_local12 )
		end
		f6_local1 = f6_local1 + math.abs( f6_local12 ) + f6_local0
		f6_arg0.ConsoleEntry.Icon1:playClip( "FadeIn" )
	end
	if f6_arg0.text1Visible then
		local f6_local8 = f6_arg0.ConsoleEntry.Text1.Text:getTextWidth()
		f6_arg0.ConsoleEntry.Text1:setLeftRight( true, false, f6_local1, f6_local1 + f6_local8 )
		f6_local1 = f6_local1 + f6_local8 + f6_local0
		f6_arg0.ConsoleEntry.Text1:playClip( "FadeIn" )
	end
	f6_local1 = f6_local1 - f6_local0 / 2
	f6_arg0.ConsoleEntry.Panel:setLeftRight( true, false, f6_arg0.panelStartLeft, f6_arg0.panelStartRight + f6_local1 )
	if f6_arg0.alignment == Enum.LUIAlignment.LUI_ALIGNMENT_CENTER then
		f6_arg0.ConsoleEntry:setLeftRight( false, false, -f6_local1 / 2, f6_local1 / 2 )
	end
	f6_arg0.ConsoleEntry:playClip( "FadeIn" )
	f6_arg0.timer = LUI.UITimer.new( 5000, "hide_console_entry", true, f6_arg0 )
	f6_arg0:addElement( f6_arg0.timer )
end

CoD.ConsoleUtility.MoveConsoleEntry = function ( f8_arg0, f8_arg1 )
	f8_arg0:completeAllAnimations()
	local f8_local0, f8_local1, f8_local2, f8_local3 = f8_arg0.ConsoleEntry:getLocalRect()
	local f8_local4 = (f8_local1 - f8_local3) * f8_arg1
	f8_arg0:beginAnimation( "move_console_event", 100 )
	if f8_arg1 >= 5 then
		local f8_local5 = f8_arg0
		local f8_local6 = f8_arg0.setAlpha
		local f8_local7
		if f8_arg1 == 5 then
			f8_local7 = 0.6
			if not f8_local7 then
			
			else
				f8_local6( f8_local5, f8_local7 )
			end
		end
		f8_local7 = 0.4
	end
	f8_arg0:setTopBottom( false, true, f8_local1 + f8_local4, f8_local3 + f8_local4 )
end

CoD.ConsoleUtility.HideConsoleEntry = function ( f9_arg0 )
	f9_arg0:completeAllAnimations()
	if f9_arg0.forcedToHide then
		f9_arg0.ConsoleEntry.Text0.Text:setAlpha( 0 )
		f9_arg0.ConsoleEntry.Icon0.Icon:setAlpha( 0 )
		f9_arg0.ConsoleEntry.Text1.Text:setAlpha( 0 )
		f9_arg0.ConsoleEntry.Icon1.Icon:setAlpha( 0 )
		f9_arg0.ConsoleEntry.Panel:setAlpha( 0 )
	else
		if f9_arg0.text0Visible then
			f9_arg0.ConsoleEntry.Text0:playClip( "FadeOut" )
		end
		if f9_arg0.icon0Visible then
			f9_arg0.ConsoleEntry.Icon0:playClip( "FadeOut" )
		end
		if f9_arg0.icon1Visible then
			f9_arg0.ConsoleEntry.Icon1:playClip( "FadeOut" )
		end
		if f9_arg0.text1Visible then
			f9_arg0.ConsoleEntry.Text1:playClip( "FadeOut" )
		end
		f9_arg0.ConsoleEntry:playClip( "FadeOut" )
	end
	f9_arg0.text0Visible = false
	f9_arg0.icon0Visible = false
	f9_arg0.icon1Visible = false
	f9_arg0.text1Visible = false
	f9_arg0:dispatchEventToParent( {
		name = "console_notification_complete",
		id = f9_arg0.id
	} )
	f9_arg0.forcedToHide = false
end

CoD.ConsoleUtility.ForceHideConsoleEntry = function ( f10_arg0 )
	f10_arg0.forcedToHide = true
	f10_arg0.timer:processNow()
end

CoD.ConsoleUtility.EntryInit = function ( f11_arg0, f11_arg1, f11_arg2 )
	f11_arg0.id = -1
	f11_arg0.forcedToHide = false
	f11_arg0.text0Visible = false
	f11_arg0.icon0Visible = false
	f11_arg0.icon1Visible = false
	f11_arg0.text1Visible = false
	f11_arg0.alignment = f11_arg2
	f11_arg0:registerEventHandler( "hide_console_entry", CoD.ConsoleUtility.HideConsoleEntry )
	f11_arg0.completeAllAnimations = CoD.ConsoleUtility.CompleteAllAnimations
	local f11_local0, f11_local1, f11_local2, f11_local3 = f11_arg0.ConsoleEntry.Panel:getLocalLeftRight()
	f11_arg0.panelStartLeft = f11_local2
	f11_arg0.panelStartRight = f11_local3
	f11_arg0.showConsoleEntry = CoD.ConsoleUtility.ShowConsoleEntry
	f11_arg0.moveConsoleEntry = CoD.ConsoleUtility.MoveConsoleEntry
	f11_arg0.hideConsoleEntry = CoD.ConsoleUtility.HideConsoleEntry
	f11_arg0.forceHideConsoleEntry = CoD.ConsoleUtility.ForceHideConsoleEntry
end

