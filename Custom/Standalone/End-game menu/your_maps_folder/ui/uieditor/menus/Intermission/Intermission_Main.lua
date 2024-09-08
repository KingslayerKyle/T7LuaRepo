require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.GameTimeGroup" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

local PostLoadFunc = function ( self, controller )
	self.disableDarkenElement = true

	SetControllerModelValue( controller, "forceScoreboard", 1 )

	SetFocusToElement( self, "buttonList", controller )
end

DataSources.Intermission = ListHelper_SetupDataSource( "Intermission", function ( controller )
	local options = {}

	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
		table.insert( options, {
			models = {
				displayText = "MENU_RESTART_LEVEL_CAPS",
				action = function ( self, element, controller, actionParam, menu )
					Engine.Exec( controller, "map_restart" )
				end
			}
		} )

		table.insert( options, {
			models = {
				displayText = "MENU_END_GAME_CAPS",
				action = function ( self, element, controller, actionParam, menu )
					Engine.Exec( controller, "disconnect" )
				end
			}
		} )
	else
		table.insert( options, {
			models = {
				displayText = "MENU_LEAVE_GAME_CAPS",
				action = function ( self, element, controller, actionParam, menu )
					Engine.Exec( controller, "disconnect" )
				end
			}
		} )
	end

	return options
end, true )

LUI.createMenu.Intermission_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Intermission_Main" )

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Intermission_Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true

	self.StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	self.StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	self.StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	self.StartMenuBackground0:setAlpha( 0.9 )
	self:addElement( self.StartMenuBackground0 )

	self.ScoreboardWidget = CoD.ScoreboardWidgetCP.new( self, controller )
	self.ScoreboardWidget:setLeftRight( false, false, -503, 503 )
	self.ScoreboardWidget:setTopBottom( true, false, 247, 773 )
	self.ScoreboardWidget.ScoreboardWidgetButtonContainer:setScale( 0 )
	self:addElement( self.ScoreboardWidget )

	self.GameTimeGroup = CoD.GameTimeGroup.new( self, controller )
	self.GameTimeGroup:setLeftRight( false, false, 0, 0 )
	self.GameTimeGroup:setTopBottom( true, false, 420, 0 )
	self.GameTimeGroup.CurrentClockTime:setLeftRight( false, false, 0 - 64, 0 - 64 )
	self.GameTimeGroup.SurviveTime:setLeftRight( false, false, 0 - 64, 0 - 64 )
	self.GameTimeGroup.Last5RoundTime:setScale( 0 )
	self.GameTimeGroup.QuestTime:setScale( 0 )
	self:addElement( self.GameTimeGroup )

	self.Title = LUI.UIText.new()
	self.Title:setLeftRight( true, true, 0 - 1.5, 0 - 1.5 )
	self.Title:setTopBottom( true, false, 0 - 1.5, 250 - 1.5 )
	self.Title:setText( Engine.Localize( "ZOMBIE_GAME_OVER" ) )
	self.Title:setTTF( "fonts/escom.ttf" )
	self.Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.Title:setScale( 0.5 )
	self.Title:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( self.Title )

	self.Title2 = LUI.UIText.new()
	self.Title2:setLeftRight( true, true, 0 + 1.5, 0 + 1.5 )
	self.Title2:setTopBottom( true, false, 0 + 1.5, 250 + 1.5 )
	self.Title2:setText( Engine.Localize( "ZOMBIE_GAME_OVER" ) )
	self.Title2:setTTF( "fonts/escom.ttf" )
	self.Title2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.Title2:setScale( 0.5 )
	self:addElement( self.Title2 )

	self.RoundsPlayed = LUI.UIText.new()
	self.RoundsPlayed:setLeftRight( true, true, 0, 0 )
	self.RoundsPlayed:setTopBottom( true, false, 0 + 175, 80 + 175 )
	self.RoundsPlayed:setText( Engine.Localize( "" ) )
	self.RoundsPlayed:setTTF( "fonts/escom.ttf" )
	self.RoundsPlayed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.RoundsPlayed:setScale( 0.5 )
	self.RoundsPlayed:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			self.RoundsPlayed:setText( Engine.Localize( "You survived " .. ( roundsPlayed - 1 ) .. " round(s)" ) )
		end
	end )
	self:addElement( self.RoundsPlayed )

	self.buttonList = LUI.UIList.new( self, controller, 0, 0, nil, true, false, 0, 0, false, false )
	self.buttonList:makeFocusable()
	self.buttonList:setLeftRight( false, false, 0, 0 )
	self.buttonList:setTopBottom( true, false, 540, 0 )
	self.buttonList:setWidgetType( CoD.List1ButtonLarge_PH )
	self.buttonList:setHorizontalCount( 2 )
	self.buttonList:setVerticalCount( 1 )
	self.buttonList:setDataSource( "Intermission" )
	self:AddButtonCallbackFunction( self.buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PlaySoundSetSound( self, "list_action" )
		ProcessListAction( self, element, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )

		return true
	end, false )
	self:addElement( self.buttonList )

	self.buttonList.id = "buttonList"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.ScoreboardWidget:close()
		element.GameTimeGroup:close()
		element.Title:close()
		element.Title2:close()
		element.RoundsPlayed:close()
		element.buttonList:close()

		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Intermission_Main.buttonPrompts" ) )
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end
