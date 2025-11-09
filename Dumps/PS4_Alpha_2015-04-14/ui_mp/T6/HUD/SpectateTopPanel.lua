require( "ui_mp.T6.HUD.SpectateGameStatusMultiTeam" )
require( "ui_mp.T6.HUD.SpectateGameStatusTwoTeam" )
require( "ui_mp.T6.HUD.SpectateGameModeStatus" )

CoD.SpectateTopPanel = InheritFrom( LUI.UIElement )
CoD.SpectateTopPanel.GameModeWidth = 480
CoD.SpectateTopPanel.GameModeHeight = 30
CoD.SpectateTopPanel.GameModeTop = 75
CoD.SpectateTopPanel.Update = function ( topPanel, event )
	if not CoD.IsShoutcaster( event.controller ) or CoD.ExeProfileVarBool( event.controller, "shoutcaster_scorepanel" ) then
		CoD.SpectateTopPanel.Show( topPanel )
	else
		CoD.SpectateTopPanel.Hide( topPanel )
	end
end

CoD.SpectateTopPanel.Hide = function ( topPanel, event )
	topPanel:setAlpha( 0 )
end

CoD.SpectateTopPanel.Show = function ( topPanel, event )
	topPanel:setAlpha( 1 )
end

CoD.SpectateTopPanel.new = function ( controller )
	local topPanel = LUI.UIElement.new()
	topPanel:setLeftRight( true, true, 0, 0 )
	topPanel:setTopBottom( true, true, 0, 0 )
	topPanel:setClass( CoD.SpectateTopPanel )
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	if teamCount == 2 then
		topPanel.gameStatus = CoD.SpectateGameStatusTwoTeam.new( controller, teamCount )
	else
		topPanel.gameStatus = CoD.SpectateGameStatusMultiTeam.new( controller, teamCount )
	end
	if topPanel.gameStatus ~= nil then
		topPanel:addElement( topPanel.gameStatus )
	end
	topPanel:processEvent( {
		name = "update_spectate_hud",
		controller = controller
	} )
	return topPanel
end

CoD.SpectateTopPanel:registerEventHandler( "update_spectate_hud", CoD.SpectateTopPanel.Update )
CoD.SpectateTopPanel:registerEventHandler( "hide_spectate_hud", CoD.SpectateTopPanel.Hide )
CoD.SpectateTopPanel:registerEventHandler( "show_spectate_hud", CoD.SpectateTopPanel.Show )
