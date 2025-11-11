require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectSelections" )
require( "ui.uieditor.widgets.Pregame.Pregame_Client" )
require( "ui.uieditor.widgets.Pregame.Pregame_Client_Small" )
require( "ui.uieditor.widgets.Pregame.Pregame_FactionHeader" )
require( "ui.uieditor.widgets.Pregame.Pregame_MainTimer" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title_Small" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

local CloseAllPopups = function ( self, controller )
	local occludedMenu = self.occludedBy
	while occludedMenu ~= nil do
		if occludedMenu.occludedBy ~= nil then
			occludedMenu = occludedMenu.occludedBy
		end
		Engine.SendClientScriptNotify( controller, "menu_change" .. Engine.GetLocalClientNum( controller ), {
			menu = "Pregame_Main",
			status = "closeToMenu"
		} )
		GoBackToMenu( occludedMenu, controller, "Pregame_Main" )
		return 
	end
end

local PreLoadFunc = function ( self, controller )
	local controllerModel = Engine.GetModelForController( controller )
	local lobbyRootModel = Engine.CreateModel( controllerModel, "lobbyRoot" )
	local pregameRootModel = Engine.CreateModel( lobbyRootModel, "Pregame" )
	Engine.CreateModel( pregameRootModel, "stage" )
end

local PostLoadFunc = function ( self, controller )
	local selfTeam = CoD.TeamUtility.GetTeamID( controller )
	if selfTeam == Enum.team_t.TEAM_SPECTATOR then
		if CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
			selfTeam = Enum.team_t.TEAM_AXIS
		else
			selfTeam = Enum.team_t.TEAM_ALLIES
		end
	end
	local FriendlyTeamFilter = function ( itemModel )
		local team = Engine.GetModelValue( Engine.GetModel( itemModel, "team" ) )
		return team == selfTeam
	end
	
	local EnemyTeamFilter = function ( itemModel )
		local team = Engine.GetModelValue( Engine.GetModel( itemModel, "team" ) )
		local f5_local0
		if team == selfTeam or team == Enum.team_t.TEAM_SPECTATOR then
			f5_local0 = false
		else
			f5_local0 = true
		end
		return f5_local0
	end
	
	self.Team1ListSmall.filter = FriendlyTeamFilter
	self.Team1ListSmall:updateDataSource( true )
	self.Team1ListLarge.filter = FriendlyTeamFilter
	self.Team1ListLarge:updateDataSource( true )
	self.Team2ListSmall.filter = EnemyTeamFilter
	self.Team2ListSmall:updateDataSource( true )
	self.Team2ListLarge.filter = EnemyTeamFilter
	self.Team2ListLarge:updateDataSource( true )
	local pregameRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
	local clientStateModel = Engine.CreateModel( pregameRoot, "clientState" )
	self:subscribeToModel( clientStateModel, function ( model )
		local clientState = Engine.GetModelValue( model )
		local pregameState = Engine.GetLobbyPregameState()
		if clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING then
			if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE then
				OpenOverlay( self, "Pregame_ItemVote", controller )
			elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT then
				OpenChooseCharacterLoadout( nil, nil, controller, LuaEnum.CHOOSE_CHARACTER_OPENED_FROM.DRAFT, self )
			elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
				CloseAllPopups( self, controller )
				ShowCACContentWarning( self, nil, controller )
			elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
				CloseAllPopups( self, controller )
				ShowStreakContentWarning( self, nil, controller )
			end
		elseif clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED then
			CloseAllPopups( self, controller )
		elseif clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED then
			if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT then
				local xuid = Engine.GetXUID64( controller )
				local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
				for index, client in ipairs( session.sessionClients ) do
					if client.xuid == xuid then
						local characterIndex = client.characterDraft.characterIndex
						local loadout = client.characterDraft.loadout
						if characterIndex >= 0 and loadout >= 0 then
							Engine.SetHeroLoadoutItem( controller, CoD.PlayerRoleUtility.customizationMode, characterIndex, loadout )
							Engine.SetHero( controller, CoD.PlayerRoleUtility.customizationMode, characterIndex )
						end
					end
				end
			end
			CloseAllPopups( self, controller )
		elseif clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_COMPLETE then
			CloseAllPopups( self, controller )
		end
	end )
	local shutdownModel = Engine.CreateModel( Engine.GetGlobalModel(), "Pregame.shutdown" )
	self:subscribeToModel( shutdownModel, function ( model )
		CoD.ArenaUtility.ArenaPregameError( controller )
		CloseAllPopups( self, controller )
		GoBack( self, controller )
		LuaUtils.UI_ShowErrorMessageDialog( controller, "EXE_ERR_SERVER_TIMEOUT", "" )
	end, false )
end

LUI.createMenu.Pregame_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Pregame_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame_Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBackground = LUI.UIImage.new()
	BlackBackground:setLeftRight( 0, 1, 0, 0 )
	BlackBackground:setTopBottom( 0, 1, 0, 0 )
	BlackBackground:setRGB( 0, 0, 0 )
	self:addElement( BlackBackground )
	self.BlackBackground = BlackBackground
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 1, 0, 0 )
	MapImage:setTopBottom( 0, 1, 0, 0 )
	MapImage:setupUIStreamedImage( 0 )
	MapImage:subscribeToGlobalModel( controller, "MapInfo", "mapImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Darken = LUI.UIImage.new()
	Darken:setLeftRight( 0, 1, 0, 0 )
	Darken:setTopBottom( 0, 1, 0, 0 )
	Darken:setRGB( 0, 0, 0 )
	Darken:setAlpha( 0.3 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( 0, 0, 0, 1920 )
	VignetteBack:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( self, controller )
	FEButtonPanel0:setLeftRight( 0.5, 0.5, -286, 288 )
	FEButtonPanel0:setTopBottom( 0.5, 0.5, -217, 224 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.26 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local Team1ListSmall = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	Team1ListSmall:makeFocusable()
	Team1ListSmall:setLeftRight( 0, 0, 109, 746 )
	Team1ListSmall:setTopBottom( 0, 0, 325, 739 )
	Team1ListSmall:setWidgetType( CoD.Pregame_Client_Small )
	Team1ListSmall:setVerticalCount( 9 )
	Team1ListSmall:setSpacing( 0 )
	Team1ListSmall:setDataSource( "PregameClientList" )
	self:addElement( Team1ListSmall )
	self.Team1ListSmall = Team1ListSmall
	
	local Team1ListLarge = LUI.UIList.new( self, controller, 14, 0, nil, false, false, 0, 0, false, false )
	Team1ListLarge:makeFocusable()
	Team1ListLarge:setLeftRight( 0, 0, -732, -95 )
	Team1ListLarge:setTopBottom( 0, 0, 323, 1200 )
	Team1ListLarge:setWidgetType( CoD.Pregame_Client )
	Team1ListLarge:setVerticalCount( 9 )
	Team1ListLarge:setSpacing( 14 )
	Team1ListLarge:setDataSource( "PregameClientList" )
	self:addElement( Team1ListLarge )
	self.Team1ListLarge = Team1ListLarge
	
	local Team2ListSmall = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	Team2ListSmall:makeFocusable()
	Team2ListSmall:setLeftRight( 0, 0, 1197, 1834 )
	Team2ListSmall:setTopBottom( 0, 0, 325, 739 )
	Team2ListSmall:setWidgetType( CoD.Pregame_Client_Small )
	Team2ListSmall:setVerticalCount( 9 )
	Team2ListSmall:setSpacing( 0 )
	Team2ListSmall:setDataSource( "PregameClientList" )
	self:addElement( Team2ListSmall )
	self.Team2ListSmall = Team2ListSmall
	
	local Team2ListLarge = LUI.UIList.new( self, controller, 14, 0, nil, false, false, 0, 0, false, false )
	Team2ListLarge:makeFocusable()
	Team2ListLarge:setLeftRight( 0, 0, 2022, 2659 )
	Team2ListLarge:setTopBottom( 0, 0, 323, 1200 )
	Team2ListLarge:setWidgetType( CoD.Pregame_Client )
	Team2ListLarge:setVerticalCount( 9 )
	Team2ListLarge:setSpacing( 14 )
	Team2ListLarge:setDataSource( "PregameClientList" )
	self:addElement( Team2ListLarge )
	self.Team2ListLarge = Team2ListLarge
	
	local PregameBanProtectSelections = CoD.Pregame_BanProtectSelections.new( self, controller )
	PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
	PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
	self:addElement( PregameBanProtectSelections )
	self.PregameBanProtectSelections = PregameBanProtectSelections
	
	local PregameMainTimer = CoD.Pregame_MainTimer.new( self, controller )
	PregameMainTimer:setLeftRight( 0, 0, 674, 1248 )
	PregameMainTimer:setTopBottom( 0, 0, 402, 598 )
	self:addElement( PregameMainTimer )
	self.PregameMainTimer = PregameMainTimer
	
	local PreGameStates = CoD.PrematchCountdown_BeginsIn.new( self, controller )
	PreGameStates:setLeftRight( 0.5, 0.5, -213, 217 )
	PreGameStates:setTopBottom( 0, 0, 342, 392 )
	PreGameStates.FEButtonPanel0:setAlpha( 0.57 )
	PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
	PreGameStates.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	PreGameStates.MatchText:setLetterSpacing( 1 )
	self:addElement( PreGameStates )
	self.PreGameStates = PreGameStates
	
	local PregameFactionHeader = CoD.Pregame_FactionHeader.new( self, controller )
	PregameFactionHeader:setLeftRight( 0, 0, -25, 2011 )
	PregameFactionHeader:setTopBottom( 0, 0, 128, 366 )
	self:addElement( PregameFactionHeader )
	self.PregameFactionHeader = PregameFactionHeader
	
	local PregameTitleSmall = CoD.Pregame_Title_Small.new( self, controller )
	PregameTitleSmall:setLeftRight( 0, 1, 0, 0 )
	PregameTitleSmall:setTopBottom( 0, 0, 49, 127 )
	self:addElement( PregameTitleSmall )
	self.PregameTitleSmall = PregameTitleSmall
	
	local EditButtonPrompt = CoD.buttonprompt.new( self, controller )
	EditButtonPrompt:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.Pregame.stage", 2 )
			end
		}
	} )
	EditButtonPrompt:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.stage" ), function ( model )
		self:updateElementState( EditButtonPrompt, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.stage"
		} )
	end )
	EditButtonPrompt:setLeftRight( 0, 0, 99.5, 420.5 )
	EditButtonPrompt:setTopBottom( 0, 0, 977, 1023 )
	EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
	EditButtonPrompt:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EditButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( EditButtonPrompt )
	self.EditButtonPrompt = EditButtonPrompt
	
	Team1ListSmall.navigation = {
		left = Team1ListLarge,
		right = Team2ListSmall,
		down = PregameBanProtectSelections
	}
	Team1ListLarge.navigation = {
		right = PregameBanProtectSelections
	}
	Team2ListSmall.navigation = {
		left = Team1ListSmall,
		right = Team2ListLarge,
		down = PregameBanProtectSelections
	}
	Team2ListLarge.navigation = {
		left = Team2ListSmall
	}
	PregameBanProtectSelections.navigation = {
		left = Team1ListLarge,
		up = {
			Team1ListSmall,
			Team2ListSmall
		},
		right = Team2ListLarge
	}
	self.resetProperties = function ()
		PreGameStates:completeAnimation()
		EditButtonPrompt:completeAnimation()
		Team1ListSmall:completeAnimation()
		Team2ListSmall:completeAnimation()
		PregameBanProtectSelections:completeAnimation()
		Team1ListLarge:completeAnimation()
		Team2ListLarge:completeAnimation()
		PregameMainTimer:completeAnimation()
		FEButtonPanel0:completeAnimation()
		PregameFactionHeader:completeAnimation()
		MapImage:completeAnimation()
		VignetteBack:completeAnimation()
		Darken:completeAnimation()
		PregameTitleSmall:completeAnimation()
		PreGameStates:setLeftRight( 0.5, 0.5, -213, 217 )
		PreGameStates:setTopBottom( 0, 0, 342, 392 )
		PreGameStates:setAlpha( 1 )
		PreGameStates.MatchText:setAlpha( 0.95 )
		PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
		EditButtonPrompt:setAlpha( 1 )
		EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
		Team1ListSmall:setLeftRight( 0, 0, 109, 746 )
		Team1ListSmall:setTopBottom( 0, 0, 325, 739 )
		Team1ListSmall:setAlpha( 1 )
		Team2ListSmall:setLeftRight( 0, 0, 1197, 1834 )
		Team2ListSmall:setTopBottom( 0, 0, 325, 739 )
		Team2ListSmall:setAlpha( 1 )
		PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
		PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
		PregameBanProtectSelections:setAlpha( 1 )
		Team1ListLarge:setLeftRight( 0, 0, -732, -95 )
		Team1ListLarge:setTopBottom( 0, 0, 323, 1200 )
		Team1ListLarge:setAlpha( 1 )
		Team2ListLarge:setLeftRight( 0, 0, 2022, 2659 )
		Team2ListLarge:setTopBottom( 0, 0, 323, 1200 )
		Team2ListLarge:setAlpha( 1 )
		PregameMainTimer:setLeftRight( 0, 0, 674, 1248 )
		PregameMainTimer:setTopBottom( 0, 0, 402, 598 )
		PregameMainTimer:setAlpha( 1 )
		FEButtonPanel0:setLeftRight( 0.5, 0.5, -286, 288 )
		FEButtonPanel0:setTopBottom( 0.5, 0.5, -217, 224 )
		FEButtonPanel0:setAlpha( 0.26 )
		PregameFactionHeader:setLeftRight( 0, 0, -25, 2011 )
		PregameFactionHeader:setTopBottom( 0, 0, 128, 366 )
		PregameFactionHeader:setAlpha( 1 )
		MapImage:setAlpha( 1 )
		VignetteBack:setAlpha( 1 )
		Darken:setAlpha( 0.3 )
		PregameTitleSmall:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "0" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end
		},
		ItemRestriction = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			SpecialistDraft = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			SpecialistDraft_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( 0.5, 0.5, -287, 287 )
					FEButtonPanel0:setTopBottom( 0.5, 0.5, -382.5, 485.5 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( 0.5, 0.5, -286, 288 )
				self.FEButtonPanel0:setTopBottom( 0.5, 0.5, -217, 224 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( 0, 0, 673, 1247 )
					PregameMainTimer:setTopBottom( 0, 0, 235.5, 432.5 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( 0, 0, 674, 1248 )
				self.PregameMainTimer:setTopBottom( 0, 0, 402, 598 )
				PregameMainTimerFrame2( PregameMainTimer, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
									PreGameStates:setTopBottom( 0, 0, 176, 226 )
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
								PreGameStates:setTopBottom( 0, 0, 176, 226 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates:setLeftRight( 0.5, 0.5, -214.93, 215.07 )
							PreGameStates:setTopBottom( 0, 0, 181.53, 231.53 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( 0.5, 0.5, -214, 216 )
						PreGameStates:setTopBottom( 0, 0, 259, 309 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( 0.5, 0.5, -213, 217 )
				self.PreGameStates:setTopBottom( 0, 0, 342, 392 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( 0, 0, -13.5, 2021.5 )
						PregameFactionHeader:setTopBottom( 0, 0, -437, -199 )
						PregameFactionHeader:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PregameFactionHeader, event )
						else
							PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregameFactionHeaderFrame3( PregameFactionHeader, event )
						return 
					else
						PregameFactionHeader:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						PregameFactionHeader:setLeftRight( 0, 0, -18.86, 2016.61 )
						PregameFactionHeader:setTopBottom( 0, 0, -173.33, 64.67 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( 0, 0, -25, 2011 )
				self.PregameFactionHeader:setTopBottom( 0, 0, 128, 366 )
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			CACEdit = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 199, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			CACEdit_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( 0.5, 0.5, -287, 287 )
					FEButtonPanel0:setTopBottom( 0.5, 0.5, -382.5, 485.5 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( 0.5, 0.5, -286, 288 )
				self.FEButtonPanel0:setTopBottom( 0.5, 0.5, -217, 224 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( 0, 0, 673, 1247 )
					PregameMainTimer:setTopBottom( 0, 0, 235.5, 432.5 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( 0, 0, 674, 1248 )
				self.PregameMainTimer:setTopBottom( 0, 0, 402, 598 )
				PregameMainTimerFrame2( PregameMainTimer, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
									PreGameStates:setTopBottom( 0, 0, 176, 226 )
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
								PreGameStates:setTopBottom( 0, 0, 176, 226 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates:setLeftRight( 0.5, 0.5, -214.93, 215.07 )
							PreGameStates:setTopBottom( 0, 0, 181.53, 231.53 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( 0.5, 0.5, -214, 216 )
						PreGameStates:setTopBottom( 0, 0, 259, 309 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( 0.5, 0.5, -213, 217 )
				self.PreGameStates:setTopBottom( 0, 0, 342, 392 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( 0, 0, -13.5, 2021.5 )
						PregameFactionHeader:setTopBottom( 0, 0, -437, -199 )
						PregameFactionHeader:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PregameFactionHeader, event )
						else
							PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregameFactionHeaderFrame3( PregameFactionHeader, event )
						return 
					else
						PregameFactionHeader:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						PregameFactionHeader:setLeftRight( 0, 0, -18.86, 2016.61 )
						PregameFactionHeader:setTopBottom( 0, 0, -173.33, 64.67 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( 0, 0, -25, 2011 )
				self.PregameFactionHeader:setTopBottom( 0, 0, 128, 366 )
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			StreakEdit = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 199, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			StreakEdit_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( 0.5, 0.5, -287, 287 )
					FEButtonPanel0:setTopBottom( 0.5, 0.5, -382.5, 485.5 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( 0.5, 0.5, -286, 288 )
				self.FEButtonPanel0:setTopBottom( 0.5, 0.5, -217, 224 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( 0, 0, 673, 1247 )
					PregameMainTimer:setTopBottom( 0, 0, 235.5, 432.5 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( 0, 0, 674, 1248 )
				self.PregameMainTimer:setTopBottom( 0, 0, 402, 598 )
				PregameMainTimerFrame2( PregameMainTimer, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
									PreGameStates:setTopBottom( 0, 0, 176, 226 )
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
								PreGameStates:setTopBottom( 0, 0, 176, 226 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates:setLeftRight( 0.5, 0.5, -214.93, 215.07 )
							PreGameStates:setTopBottom( 0, 0, 181.53, 231.53 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( 0.5, 0.5, -214, 216 )
						PreGameStates:setTopBottom( 0, 0, 259, 309 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( 0.5, 0.5, -213, 217 )
				self.PreGameStates:setTopBottom( 0, 0, 342, 392 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( 0, 0, -13.5, 2021.5 )
						PregameFactionHeader:setTopBottom( 0, 0, -437, -199 )
						PregameFactionHeader:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PregameFactionHeader, event )
						else
							PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregameFactionHeaderFrame3( PregameFactionHeader, event )
						return 
					else
						PregameFactionHeader:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						PregameFactionHeader:setLeftRight( 0, 0, -18.86, 2016.61 )
						PregameFactionHeader:setTopBottom( 0, 0, -173.33, 64.67 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( 0, 0, -25, 2011 )
				self.PregameFactionHeader:setTopBottom( 0, 0, 128, 366 )
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 199, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			Launch = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 322.5, 1102.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			Launch_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( 0.5, 0.5, -287, 287 )
					FEButtonPanel0:setTopBottom( 0.5, 0.5, -382.5, 485.5 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( 0.5, 0.5, -286, 288 )
				self.FEButtonPanel0:setTopBottom( 0.5, 0.5, -217, 224 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( 0, 0, -637.5, 0.5 )
					Team1ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( 0, 0, 108.5, 746.5 )
				self.Team1ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( 0, 0, 117.5, 755.5 )
						Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team1ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1ListLarge, event )
						else
							Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1ListLargeFrame3( Team1ListLarge, event )
						return 
					else
						Team1ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", Team1ListLargeFrame3 )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( 0, 0, -699.5, -61.5 )
				self.Team1ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( 0, 0, 1919.5, 2557.5 )
					Team2ListSmall:setTopBottom( 0, 0, 322, 1026 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( 0, 0, 1196.5, 1834.5 )
				self.Team2ListSmall:setTopBottom( 0, 0, 322, 726 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( 0, 0, 1197.5, 1835.5 )
						Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
						Team2ListLarge:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2ListLarge, event )
						else
							Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2ListLargeFrame3( Team2ListLarge, event )
						return 
					else
						Team2ListLarge:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", Team2ListLargeFrame3 )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( 0, 0, 2010.5, 2648.5 )
				self.Team2ListLarge:setTopBottom( 0, 0, 150.5, 1080.5 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
					PregameBanProtectSelections:setTopBottom( 0, 0, 1115, 1640 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( 0, 0, 98.5, 1817.5 )
				self.PregameBanProtectSelections:setTopBottom( 0, 0, 761, 1286 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( 0, 0, 673, 1247 )
					PregameMainTimer:setTopBottom( 0, 0, 235.5, 432.5 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( 0, 0, 674, 1248 )
				self.PregameMainTimer:setTopBottom( 0, 0, 402, 598 )
				PregameMainTimerFrame2( PregameMainTimer, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								local PreGameStatesFrame6 = function ( PreGameStates, event )
									if not event.interrupted then
										PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
									end
									PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
									PreGameStates:setTopBottom( 0, 0, 176, 226 )
									PreGameStates.MatchText:setAlpha( 0.95 )
									PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
									if event.interrupted then
										self.clipFinished( PreGameStates, event )
									else
										PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PreGameStatesFrame6( PreGameStates, event )
									return 
								else
									PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame6 )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								PreGameStates:setLeftRight( 0.5, 0.5, -215, 215 )
								PreGameStates:setTopBottom( 0, 0, 176, 226 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
							PreGameStates:setLeftRight( 0.5, 0.5, -214.93, 215.07 )
							PreGameStates:setTopBottom( 0, 0, 181.53, 231.53 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( 0.5, 0.5, -214, 216 )
						PreGameStates:setTopBottom( 0, 0, 259, 309 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( 0.5, 0.5, -213, 217 )
				self.PreGameStates:setTopBottom( 0, 0, 342, 392 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( 0, 0, -13.5, 2021.5 )
						PregameFactionHeader:setTopBottom( 0, 0, -437, -199 )
						PregameFactionHeader:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PregameFactionHeader, event )
						else
							PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregameFactionHeaderFrame3( PregameFactionHeader, event )
						return 
					else
						PregameFactionHeader:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						PregameFactionHeader:setLeftRight( 0, 0, -18.86, 2016.61 )
						PregameFactionHeader:setTopBottom( 0, 0, -173.33, 64.67 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( 0, 0, -25, 2011 )
				self.PregameFactionHeader:setTopBottom( 0, 0, 128, 366 )
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end
		},
		SpecialistDraft_9 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				PregameBanProtectSelections:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				PregameBanProtectSelections:setAlpha( 0 )
				PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			CACEdit_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 150, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			StreakEdit_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 150, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			Launch_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end
		},
		SpecialistDraft = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				PregameBanProtectSelections:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				PregameBanProtectSelections:setAlpha( 0 )
				PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			CACEdit = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			StreakEdit = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						if not event.interrupted then
							EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 150, false, false, CoD.TweenType.Linear )
						end
						EditButtonPrompt:setAlpha( 1 )
						EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
						if event.interrupted then
							self.clipFinished( EditButtonPrompt, event )
						else
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			Launch = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end
		},
		CACEdit_9 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			StreakEdit_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						local EditButtonPromptFrame4 = function ( EditButtonPrompt, event )
							local EditButtonPromptFrame5 = function ( EditButtonPrompt, event )
								if not event.interrupted then
									EditButtonPrompt:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									EditButtonPrompt.label:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								EditButtonPrompt:setAlpha( 1 )
								EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
								if event.interrupted then
									self.clipFinished( EditButtonPrompt, event )
								else
									EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EditButtonPromptFrame5( EditButtonPrompt, event )
								return 
							else
								EditButtonPrompt:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame5 )
							end
						end
						
						if event.interrupted then
							EditButtonPromptFrame4( EditButtonPrompt, event )
							return 
						else
							EditButtonPrompt:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame4 )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:setAlpha( 0 )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			Launch_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					if not event.interrupted then
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					EditButtonPrompt:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EditButtonPrompt, event )
					else
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end
		},
		CACEdit = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			StreakEdit = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					local EditButtonPromptFrame3 = function ( EditButtonPrompt, event )
						local EditButtonPromptFrame4 = function ( EditButtonPrompt, event )
							local EditButtonPromptFrame5 = function ( EditButtonPrompt, event )
								if not event.interrupted then
									EditButtonPrompt:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									EditButtonPrompt.label:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								EditButtonPrompt:setAlpha( 1 )
								EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
								if event.interrupted then
									self.clipFinished( EditButtonPrompt, event )
								else
									EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EditButtonPromptFrame5( EditButtonPrompt, event )
								return 
							else
								EditButtonPrompt:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame5 )
							end
						end
						
						if event.interrupted then
							EditButtonPromptFrame4( EditButtonPrompt, event )
							return 
						else
							EditButtonPrompt:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
							EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame4 )
						end
					end
					
					if event.interrupted then
						EditButtonPromptFrame3( EditButtonPrompt, event )
						return 
					else
						EditButtonPrompt:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						EditButtonPrompt:setAlpha( 0 )
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", EditButtonPromptFrame3 )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end,
			Launch = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					if not event.interrupted then
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					EditButtonPrompt:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EditButtonPrompt, event )
					else
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end
		},
		StreakEdit_9 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			Launch_9 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					if not event.interrupted then
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						EditButtonPrompt.label:beginAnimation( "subkeyframe", 150, false, false, CoD.TweenType.Linear )
					end
					EditButtonPrompt:setAlpha( 0 )
					EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
					if event.interrupted then
						self.clipFinished( EditButtonPrompt, event )
					else
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end
		},
		StreakEdit = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			Launch = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					local PreGameStatesFrame3 = function ( PreGameStates, event )
						local PreGameStatesFrame4 = function ( PreGameStates, event )
							local PreGameStatesFrame5 = function ( PreGameStates, event )
								if not event.interrupted then
									PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
								end
								PreGameStates.MatchText:setAlpha( 0.95 )
								PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
								if event.interrupted then
									self.clipFinished( PreGameStates, event )
								else
									PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PreGameStatesFrame5( PreGameStates, event )
								return 
							else
								PreGameStates:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame5 )
							end
						end
						
						if event.interrupted then
							PreGameStatesFrame4( PreGameStates, event )
							return 
						else
							PreGameStates:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 140, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:setAlpha( 0 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local EditButtonPromptFrame2 = function ( EditButtonPrompt, event )
					if not event.interrupted then
						EditButtonPrompt:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						EditButtonPrompt.label:beginAnimation( "subkeyframe", 150, false, false, CoD.TweenType.Linear )
					end
					EditButtonPrompt:setAlpha( 0 )
					EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
					if event.interrupted then
						self.clipFinished( EditButtonPrompt, event )
					else
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end
		},
		Launch_9 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local MapImageFrame2 = function ( MapImage, event )
					if not event.interrupted then
						MapImage:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					MapImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapImage, event )
					else
						MapImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				MapImageFrame2( MapImage, {} )
				local DarkenFrame2 = function ( Darken, event )
					if not event.interrupted then
						Darken:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Darken:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Darken, event )
					else
						Darken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Darken:completeAnimation()
				self.Darken:setAlpha( 0.3 )
				DarkenFrame2( Darken, {} )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 1 )
				VignetteBackFrame2( VignetteBack, {} )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.26 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setAlpha( 0 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setAlpha( 1 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setAlpha( 0 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setAlpha( 1 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setAlpha( 0 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setAlpha( 1 )
				PregameMainTimerFrame2( PregameMainTimer, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					if not event.interrupted then
						PreGameStates:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PreGameStates:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PreGameStates, event )
					else
						PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreGameStates:completeAnimation()
				self.PreGameStates:setAlpha( 1 )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					if not event.interrupted then
						PregameFactionHeader:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameFactionHeader:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameFactionHeader, event )
					else
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				local PregameTitleSmallFrame2 = function ( PregameTitleSmall, event )
					if not event.interrupted then
						PregameTitleSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameTitleSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameTitleSmall, event )
					else
						PregameTitleSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTitleSmall:completeAnimation()
				self.PregameTitleSmall:setAlpha( 1 )
				PregameTitleSmallFrame2( PregameTitleSmall, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end
		},
		Launch = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local MapImageFrame2 = function ( MapImage, event )
					if not event.interrupted then
						MapImage:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					MapImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapImage, event )
					else
						MapImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				MapImageFrame2( MapImage, {} )
				local DarkenFrame2 = function ( Darken, event )
					if not event.interrupted then
						Darken:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Darken:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Darken, event )
					else
						Darken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Darken:completeAnimation()
				self.Darken:setAlpha( 0.3 )
				DarkenFrame2( Darken, {} )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 1 )
				VignetteBackFrame2( VignetteBack, {} )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.26 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setAlpha( 0 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setAlpha( 1 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setAlpha( 0 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setAlpha( 1 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setAlpha( 0 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setAlpha( 1 )
				PregameMainTimerFrame2( PregameMainTimer, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					if not event.interrupted then
						PreGameStates:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PreGameStates:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PreGameStates, event )
					else
						PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreGameStates:completeAnimation()
				self.PreGameStates:setAlpha( 1 )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					if not event.interrupted then
						PregameFactionHeader:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameFactionHeader:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameFactionHeader, event )
					else
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				local PregameTitleSmallFrame2 = function ( PregameTitleSmall, event )
					if not event.interrupted then
						PregameTitleSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameTitleSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameTitleSmall, event )
					else
						PregameTitleSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTitleSmall:completeAnimation()
				self.PregameTitleSmall:setAlpha( 1 )
				PregameTitleSmallFrame2( PregameTitleSmall, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ItemRestriction",
			condition = function ( menu, element, event )
				return ItemRestrictionVoteActive()
			end
		},
		{
			stateName = "SpecialistDraft_9",
			condition = function ( menu, element, event )
				return CharacterDraftActive() and HasMoreThanNPlayersOnATeam( "6" )
			end
		},
		{
			stateName = "SpecialistDraft",
			condition = function ( menu, element, event )
				return CharacterDraftActive()
			end
		},
		{
			stateName = "CACEdit_9",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive() and HasMoreThanNPlayersOnATeam( "6" )
			end
		},
		{
			stateName = "CACEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive()
			end
		},
		{
			stateName = "StreakEdit_9",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive() and HasMoreThanNPlayersOnATeam( "6" )
			end
		},
		{
			stateName = "StreakEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive()
			end
		},
		{
			stateName = "Launch_9",
			condition = function ( menu, element, event )
				return PregameStateEqualToEnum( Enum.LobbyPregameState.LOBBY_PREGAME_STATE_LAUNCH_GAME ) and HasMoreThanNPlayersOnATeam( "6" )
			end
		},
		{
			stateName = "Launch",
			condition = function ( menu, element, event )
				return PregameStateEqualToEnum( Enum.LobbyPregameState.LOBBY_PREGAME_STATE_LAUNCH_GAME )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.stage" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.stage"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuStateChangeNotify( controller, self, true, "mp" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if ItemRestrictionCACEditActive() and IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.Pregame.stage", 2 ) then
			SetPregameEditIncomplete( controller )
			return true
		elseif ItemRestrictionScorestreakEditActive() and IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.Pregame.stage", 2 ) then
			SetPregameEditIncomplete( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ItemRestrictionCACEditActive() and IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.Pregame.stage", 2 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_OPEN_SCORESTREAK_EDIT", nil )
			return true
		elseif ItemRestrictionScorestreakEditActive() and IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.Pregame.stage", 2 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_OPEN_EDIT_CAC", nil )
			return true
		else
			return false
		end
	end, false )
	Team1ListSmall.id = "Team1ListSmall"
	Team1ListLarge.id = "Team1ListLarge"
	Team2ListSmall.id = "Team2ListSmall"
	Team2ListLarge.id = "Team2ListLarge"
	PregameBanProtectSelections.id = "PregameBanProtectSelections"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.PregameBanProtectSelections:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VignetteBack:close()
		self.FEButtonPanel0:close()
		self.Team1ListSmall:close()
		self.Team1ListLarge:close()
		self.Team2ListSmall:close()
		self.Team2ListLarge:close()
		self.PregameBanProtectSelections:close()
		self.PregameMainTimer:close()
		self.PreGameStates:close()
		self.PregameFactionHeader:close()
		self.PregameTitleSmall:close()
		self.EditButtonPrompt:close()
		self.MapImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

