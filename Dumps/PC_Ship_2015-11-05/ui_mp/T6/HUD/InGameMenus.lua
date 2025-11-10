require( "ui.T6.CoDBase" )
require( "ui_mp.T6.HUD.EndGamePopup" )

if CoD.isZombie then
	require( "ui_mp.T6.Zombie.RestartGamePopupZombie" )
end
CoD.InGameMenu = InheritFrom( CoD.Menu )
CoD.InGameMenu.New = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = CoD.Menu.New( f1_arg0 )
	f1_local0:setClass( CoD.InGameMenu )
	f1_local0:setOwner( f1_arg1 )
	if f1_arg2 ~= nil then
		f1_local0:addTitle( f1_arg2 )
	end
	return f1_local0
end

CoD.InGameMenu.BackButtonPressed = function ( f2_arg0, f2_arg1 )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() and CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[f2_arg1.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[f2_arg1.controller + 1] > 0 then
		if f2_arg0.menuName ~= "class" then
			CoD.Menu.ButtonPromptBack( f2_arg0, f2_arg1 )
		end
		return 
	end
	CoD.Menu.ButtonPromptBack( f2_arg0, f2_arg1 )
	if not f2_arg0.previousMenuName then
		if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
			Engine.SetDvar( "cl_paused", 0 )
		end
		if f2_arg0.occludedMenu ~= nil then
			f2_arg0.occludedMenu:processEvent( {
				name = "close_ingame_menu",
				controller = f2_arg1.controller
			} )
		end
	end
end

CoD.InGameMenu.StartButtonPressed = function ( f3_arg0, f3_arg1 )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		if CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[f3_arg1.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[f3_arg1.controller + 1] > 0 then
			return 
		end
		Engine.SetDvar( "cl_paused", 0 )
	end
	CoD.Menu.ButtonPromptBack( f3_arg0, f3_arg1 )
	if not f3_arg0.previousMenuName and f3_arg0.occludedMenu ~= nil then
		f3_arg0.occludedMenu:processEvent( {
			name = "close_ingame_menu",
			controller = f3_arg1.controller
		} )
	end
end

CoD.InGameMenu.addButtonPrompts = function ( f4_arg0 )
	f4_arg0:addSelectButton()
	f4_arg0:addBackButton()
	f4_arg0.backButtonPrompt = CoD.ButtonPrompt.new( "select", "", f4_arg0, "button_prompt_back", true )
	f4_arg0.startButtonPrompt = CoD.ButtonPrompt.new( "start", "", f4_arg0, "button_prompt_start", true )
	f4_arg0:addRightButtonPrompt( f4_arg0.backButtonPrompt )
	f4_arg0:addRightButtonPrompt( f4_arg0.startButtonPrompt )
end

CoD.InGameMenu.CloseAllInGameMenus = function ( f5_arg0, f5_arg1 )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[f5_arg1.controller + 1] = 0
	end
	f5_arg0:dispatchEventToChildren( f5_arg1 )
	if not f5_arg0.m_inputDisabled then
		f5_arg0.previousMenuName = nil
		f5_arg0:goBack()
		if f5_arg0.occludedMenu then
			f5_arg0.occludedMenu:processEvent( f5_arg1 )
		end
	end
end

CoD.InGameMenu:registerEventHandler( "close_all_ingame_menus", CoD.InGameMenu.CloseAllInGameMenus )
CoD.InGameMenu:registerEventHandler( "button_prompt_back", CoD.InGameMenu.BackButtonPressed )
CoD.InGameMenu:registerEventHandler( "button_prompt_start", CoD.InGameMenu.StartButtonPressed )
