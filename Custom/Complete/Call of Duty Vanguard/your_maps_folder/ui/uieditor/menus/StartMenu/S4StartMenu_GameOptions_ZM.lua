require( "ui.uieditor.menus.StartMenu.S4StartMenu_Options" )
require( "ui.uieditor.widgets.Lobby.Common.S4ButtonListItem" )

DataSources.StartMenuGameOptions = ListHelper_SetupDataSource( "StartMenuGameOptions", function ( controller )
	local options = {}

	if CoD.isZombie then
		table.insert( options, {
			models = {
				displayText = "MENU_RESUMEGAME_CAPS",
				action = StartMenuGoBack_ListElement
			}
		} )

		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			table.insert( options, {
				models = {
					displayText = "MENU_RESTART_LEVEL_CAPS",
					action = RestartGame
				}
			} )
		end

		table.insert( options, {
			models = {
				displayText = "MENU_OPTIONS_CONTROLS_CAPS",
				action = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "S4StartMenu_Options", true, controller )
				end
			}
		} )

		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			table.insert( options, {
				models = {
					displayText = "MENU_END_GAME_CAPS",
					action = QuitGame_MP
				}
			} )
		else
			table.insert( options, {
				models = {
					displayText = "MENU_QUIT_GAME_CAPS",
					action = QuitGame_MP
				}
			} )
		end
	end

	return options
end, true )

CoD.S4StartMenu_GameOptions_ZM = InheritFrom( LUI.UIElement )
CoD.S4StartMenu_GameOptions_ZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S4StartMenu_GameOptions_ZM )
	self.id = "S4StartMenu_GameOptions_ZM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	self.buttonList = LUI.UIList.new( menu, controller, 8, 0, nil, true, false, 0, 0, false, false )
	self.buttonList:makeFocusable()
	self.buttonList:setLeftRight( true, false, 0, 0 )
	self.buttonList:setTopBottom( true, false, 0, 0 )
	self.buttonList:setWidgetType( CoD.S4ButtonListItem )
	self.buttonList:setVerticalCount( 5 )
	self.buttonList:setDataSource( "StartMenuGameOptions" )
	self.buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil

		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end

		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )

		return retVal
	end )
	self.buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil

		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end

		return retVal
	end )
	menu:AddButtonCallbackFunction( self.buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )

		return true
	end, false )
	self:addElement( self.buttonList )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CP_PauseMenu = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CP_PauseMenu",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )

	self.buttonList.id = "buttonList"
	
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.buttonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
