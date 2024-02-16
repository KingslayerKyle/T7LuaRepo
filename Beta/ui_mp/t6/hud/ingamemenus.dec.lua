require( "ui.T6.CoDBase" )
require( "ui_mp.T6.HUD.EndGamePopup" )
require( "ui.uieditor.Menus.MP.MatchSettings.ChangeTeam" )

if CoD.isZombie then
	require( "ui_mp.T6.Zombie.RestartGamePopupZombie" )
else
	require( "ui_mp.T6.HUD.changeclass" )
	require( "ui.uieditor.menus.CAC.ChooseClass_InGame" )
end
CoD.InGameMenu = InheritFrom( CoD.Menu )
CoD.InGameMenu.New = function ( menuName, controller, titleText )
	local menu = CoD.Menu.New( menuName )
	menu:setClass( CoD.InGameMenu )
	menu:setOwner( controller )
	if titleText ~= nil then
		menu:addTitle( titleText )
	end
	return menu
end

CoD.InGameMenu.BackButtonPressed = function ( menu, event )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() and CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] > 0 then
		if menu.menuName ~= "class" then
			CoD.Menu.ButtonPromptBack( menu, event )
		end
		return 
	end
	CoD.Menu.ButtonPromptBack( menu, event )
	if not menu.previousMenuName then
		if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
			Engine.SetDvar( "cl_paused", 0 )
		end
		if menu.occludedMenu ~= nil then
			menu.occludedMenu:processEvent( {
				name = "close_ingame_menu",
				controller = event.controller
			} )
		end
	end
end

CoD.InGameMenu.StartButtonPressed = function ( menu, event )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		if CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] > 0 then
			return 
		end
		Engine.SetDvar( "cl_paused", 0 )
	end
	CoD.Menu.ButtonPromptBack( menu, event )
	if not menu.previousMenuName and menu.occludedMenu ~= nil then
		menu.occludedMenu:processEvent( {
			name = "close_ingame_menu",
			controller = event.controller
		} )
	end
end

CoD.InGameMenu.addButtonPrompts = function ( menu )
	menu:addSelectButton()
	menu:addBackButton()
	menu.backButtonPrompt = CoD.ButtonPrompt.new( "select", "", menu, "button_prompt_back", true )
	menu.startButtonPrompt = CoD.ButtonPrompt.new( "start", "", menu, "button_prompt_start", true )
	menu:addRightButtonPrompt( menu.backButtonPrompt )
	menu:addRightButtonPrompt( menu.startButtonPrompt )
end

CoD.InGameMenu.CloseAllInGameMenus = function ( self, event )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] = 0
	end
	self:dispatchEventToChildren( event )
	if not self.m_inputDisabled then
		self.previousMenuName = nil
		self:goBack()
		if self.occludedMenu then
			self.occludedMenu:processEvent( event )
		end
	end
end

CoD.InGameMenu:registerEventHandler( "close_all_ingame_menus", CoD.InGameMenu.CloseAllInGameMenus )
CoD.InGameMenu:registerEventHandler( "button_prompt_back", CoD.InGameMenu.BackButtonPressed )
CoD.InGameMenu:registerEventHandler( "button_prompt_start", CoD.InGameMenu.StartButtonPressed )
