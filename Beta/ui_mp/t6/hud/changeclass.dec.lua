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

CoD.T6ChangeClass.SetProfileLoadoutChoice = function ( controller, selectedClassIndex )
	local loadout = "lastLoadoutSystemlink"
	if CoD.T6ChangeClass.IsOnlineGame() == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			loadout = "lastLoadoutLeague"
		else
			loadout = "lastLoadoutOnline"
		end
	end
	Engine.SetProfileVar( controller, loadout, selectedClassIndex )
	Engine.CommitProfileChanges( controller )
	CoD.T6ChangeClass.SelectedClassIndex[controller] = selectedClassIndex
end

