require( "ui_mp.T6.HUD.InGameMenus" )

CoD.T6ChangeClass = {}
CoD.T6ChangeClass.Width = 840
CoD.T6ChangeClass.Height = 600
CoD.T6ChangeClass.SelectedClassIndex = {}
CoD.T6ChangeClass.IsOnlineGame = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		return true
	else
		return false
	end
end

CoD.T6ChangeClass.SetProfileLoadoutChoice = function ( f2_arg0, f2_arg1 )
	local f2_local0 = "lastLoadoutSystemlink"
	if CoD.T6ChangeClass.IsOnlineGame() == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			f2_local0 = "lastLoadoutLeague"
		else
			f2_local0 = "lastLoadoutOnline"
		end
	end
	Engine.SetProfileVar( f2_arg0, f2_local0, f2_arg1 )
	Engine.CommitProfileChanges( f2_arg0 )
	CoD.T6ChangeClass.SelectedClassIndex[f2_arg0] = f2_arg1
end

