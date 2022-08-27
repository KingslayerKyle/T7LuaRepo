-- 1d4aeed096bddac6982de41dcd75e6cc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Pregame.Pregame_Client_Small" )
require( "ui.uieditor.widgets.Pregame.Pregame_Client" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectSelections" )
require( "ui.uieditor.widgets.Pregame.Pregame_MainTimer" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.Pregame.Pregame_FactionHeader" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title_Small" )
require( "ui.uieditor.widgets.buttonprompt" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.occludedBy
	while f1_local0 ~= nil do
		if f1_local0.occludedBy ~= nil then
			f1_local0 = f1_local0.occludedBy
		end
		Engine.SendClientScriptNotify( f1_arg1, "menu_change" .. Engine.GetLocalClientNum( f1_arg1 ), "Pregame_Main", "closeToMenu" )
		GoBackToMenu( f1_local0, f1_arg1, "Pregame_Main" )
		return 
	end
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "lobbyRoot" ), "Pregame" ), "stage" )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClientDataUpdate" ), function ( model )
		local f4_local0 = CoD.GetTeamID( f3_arg1 )
		if f4_local0 == Enum.team_t.TEAM_SPECTATOR then
			if CoD.ShoutcasterProfileVarBool( f3_arg1, "shoutcaster_flip_scorepanel" ) then
				f4_local0 = Enum.team_t.TEAM_AXIS
			else
				f4_local0 = Enum.team_t.TEAM_ALLIES
			end
		end
		local f4_local1 = function ( f5_arg0 )
			return Engine.GetModelValue( Engine.GetModel( f5_arg0, "team" ) ) == f4_local0
		end
		
		local f4_local2 = function ( f6_arg0 )
			local modelValue = Engine.GetModelValue( Engine.GetModel( f6_arg0, "team" ) )
			local f6_local1
			if modelValue == f4_local0 or modelValue == Enum.team_t.TEAM_SPECTATOR then
				f6_local1 = false
			else
				f6_local1 = true
			end
			return f6_local1
		end
		
		f3_arg0.Team1ListSmall.filter = f4_local1
		f3_arg0.Team1ListSmall:updateDataSource( true )
		f3_arg0.Team1ListLarge.filter = f4_local1
		f3_arg0.Team1ListLarge:updateDataSource( true )
		f3_arg0.Team2ListSmall.filter = f4_local2
		f3_arg0.Team2ListSmall:updateDataSource( true )
		f3_arg0.Team2ListLarge.filter = f4_local2
		f3_arg0.Team2ListLarge:updateDataSource( true )
		DataSources.LoadingScreenTeamInfo.getModel( f3_arg1 )
	end, true )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "Pregame" ), "clientState" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f7_local1 = Engine.GetLobbyPregameState()
		if modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING then
			if f7_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE then
				OpenOverlay( f3_arg0, "Pregame_ItemVote", f3_arg1 )
			elseif f7_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT then
				OpenChooseCharacterLoadout( nil, nil, f3_arg1, LuaEnums.CHOOSE_CHARACTER_OPENED_FROM.DRAFT, f3_arg0 )
			elseif f7_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
				f0_local0( f3_arg0, f3_arg1 )
				ShowCACContentWarning( f3_arg0, nil, f3_arg1 )
			elseif f7_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
				f0_local0( f3_arg0, f3_arg1 )
				ShowStreakContentWarning( f3_arg0, nil, f3_arg1 )
			end
		elseif modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED then
			f0_local0( f3_arg0, f3_arg1 )
		elseif modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED then
			if f7_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT then
				local f7_local2 = Engine.GetXUID64( f3_arg1 )
				local f7_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
				for f7_local9, f7_local10 in ipairs( f7_local3.sessionClients ) do
					if f7_local10.xuid == f7_local2 then
						local f7_local7 = f7_local10.characterDraft.characterIndex
						local f7_local8 = f7_local10.characterDraft.loadout
						if f7_local7 >= 0 and f7_local8 >= 0 then
							Engine.SetHeroLoadoutItem( f3_arg1, CoD.CCUtility.customizationMode, f7_local7, f7_local8 )
							Engine.SetHero( f3_arg1, CoD.CCUtility.customizationMode, f7_local7 )
						end
					end
				end
			end
			f0_local0( f3_arg0, f3_arg1 )
		elseif modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_COMPLETE then
			f0_local0( f3_arg0, f3_arg1 )
		elseif modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_RESET then
			CoD.ArenaUtility.ArenaPregameError( f3_arg1 )
			CoD.OverlayUtility.ShowToast( "LobbyCientPregameStateReset", Engine.Localize( "MENU_PREGAME_PLAYER_LEFT" ), nil, "uie_bookmark" )
			f0_local0( f3_arg0, f3_arg1 )
			GoBack( f3_arg0, f3_arg1 )
		elseif modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_END then
			f0_local0( f3_arg0, f3_arg1 )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				Engine.LobbyVM_CallFunc( "GoBack", {
					controller = f3_arg1,
					withParty = LuaEnums.LEAVE_WITH_PARTY.WITH
				} )
			end
		end
	end )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "Pregame.shutdown" ), function ( model )
		CoD.ArenaUtility.ArenaPregameError( f3_arg1 )
		f0_local0( f3_arg0, f3_arg1 )
		GoBack( f3_arg0, f3_arg1 )
		LuaUtils.UI_ShowErrorMessageDialog( f3_arg1, "EXE_ERR_SERVER_TIMEOUT", "" )
	end, false )
	f3_arg0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		if Engine.GetModelValue( model ) ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART_KEEPDW, "" )
		end
	end )
end

LUI.createMenu.Pregame_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Pregame_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame_Main.buttonPrompts" )
	local f10_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBackground = LUI.UIImage.new()
	BlackBackground:setLeftRight( true, true, 0, 0 )
	BlackBackground:setTopBottom( true, true, 0, 0 )
	BlackBackground:setRGB( 0, 0, 0 )
	self:addElement( BlackBackground )
	self.BlackBackground = BlackBackground
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, true, 0, 0 )
	MapImage:setTopBottom( true, true, 0, 0 )
	MapImage:setupUIStreamedImage( 0 )
	MapImage:subscribeToGlobalModel( controller, "MapInfo", "mapImage", function ( model )
		local mapImage = Engine.GetModelValue( model )
		if mapImage then
			MapImage:setImage( RegisterImage( mapImage ) )
		end
	end )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Darken = LUI.UIImage.new()
	Darken:setLeftRight( true, true, 0, 0 )
	Darken:setTopBottom( true, true, 0, 0 )
	Darken:setRGB( 0, 0, 0 )
	Darken:setAlpha( 0.3 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( f10_local1, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, 0, 720 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( f10_local1, controller )
	FEButtonPanel0:setLeftRight( false, false, -190.53, 192.26 )
	FEButtonPanel0:setTopBottom( false, false, -145, 149 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.26 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local Team1ListSmall = LUI.UIList.new( f10_local1, controller, 0, 0, nil, false, false, 0, 0, false, true )
	Team1ListSmall:makeFocusable()
	Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
	Team1ListSmall:setTopBottom( true, false, 215, 494 )
	Team1ListSmall:setWidgetType( CoD.Pregame_Client_Small )
	Team1ListSmall:setVerticalCount( 9 )
	Team1ListSmall:setSpacing( 0 )
	Team1ListSmall:setDataSource( "PregameClientList" )
	self:addElement( Team1ListSmall )
	self.Team1ListSmall = Team1ListSmall
	
	local Team1ListLarge = LUI.UIList.new( f10_local1, controller, 9, 0, nil, false, false, 0, 0, false, true )
	Team1ListLarge:makeFocusable()
	Team1ListLarge:setLeftRight( true, false, -488, -63 )
	Team1ListLarge:setTopBottom( true, false, 215, 800 )
	Team1ListLarge:setWidgetType( CoD.Pregame_Client )
	Team1ListLarge:setVerticalCount( 9 )
	Team1ListLarge:setSpacing( 9 )
	Team1ListLarge:setDataSource( "PregameClientList" )
	self:addElement( Team1ListLarge )
	self.Team1ListLarge = Team1ListLarge
	
	local Team2ListSmall = LUI.UIList.new( f10_local1, controller, 0, 0, nil, false, false, 0, 0, false, true )
	Team2ListSmall:makeFocusable()
	Team2ListSmall:setLeftRight( true, false, 798, 1223 )
	Team2ListSmall:setTopBottom( true, false, 215, 494 )
	Team2ListSmall:setWidgetType( CoD.Pregame_Client_Small )
	Team2ListSmall:setVerticalCount( 9 )
	Team2ListSmall:setSpacing( 0 )
	Team2ListSmall:setDataSource( "PregameClientList" )
	self:addElement( Team2ListSmall )
	self.Team2ListSmall = Team2ListSmall
	
	local Team2ListLarge = LUI.UIList.new( f10_local1, controller, 9, 0, nil, false, false, 0, 0, false, true )
	Team2ListLarge:makeFocusable()
	Team2ListLarge:setLeftRight( true, false, 1348, 1773 )
	Team2ListLarge:setTopBottom( true, false, 215, 800 )
	Team2ListLarge:setWidgetType( CoD.Pregame_Client )
	Team2ListLarge:setVerticalCount( 9 )
	Team2ListLarge:setSpacing( 9 )
	Team2ListLarge:setDataSource( "PregameClientList" )
	self:addElement( Team2ListLarge )
	self.Team2ListLarge = Team2ListLarge
	
	local PregameBanProtectSelections = CoD.Pregame_BanProtectSelections.new( f10_local1, controller )
	PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
	PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
	self:addElement( PregameBanProtectSelections )
	self.PregameBanProtectSelections = PregameBanProtectSelections
	
	local PregameMainTimer = CoD.Pregame_MainTimer.new( f10_local1, controller )
	PregameMainTimer:setLeftRight( true, false, 449.47, 832.26 )
	PregameMainTimer:setTopBottom( true, false, 268, 399 )
	self:addElement( PregameMainTimer )
	self.PregameMainTimer = PregameMainTimer
	
	local PreGameStates = CoD.PrematchCountdown_BeginsIn.new( f10_local1, controller )
	PreGameStates:setLeftRight( false, false, -142.5, 144.5 )
	PreGameStates:setTopBottom( true, false, 227.79, 261 )
	PreGameStates.FEButtonPanel0:setAlpha( 0.57 )
	PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
	PreGameStates.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	PreGameStates.MatchText:setLetterSpacing( 1 )
	self:addElement( PreGameStates )
	self.PreGameStates = PreGameStates
	
	local PregameFactionHeader = CoD.Pregame_FactionHeader.new( f10_local1, controller )
	PregameFactionHeader:setLeftRight( true, false, -16.5, 1340.5 )
	PregameFactionHeader:setTopBottom( true, false, 85.19, 243.94 )
	self:addElement( PregameFactionHeader )
	self.PregameFactionHeader = PregameFactionHeader
	
	local PregameTitleSmall = CoD.Pregame_Title_Small.new( f10_local1, controller )
	PregameTitleSmall:setLeftRight( true, true, 0, 0 )
	PregameTitleSmall:setTopBottom( true, false, 33, 85 )
	self:addElement( PregameTitleSmall )
	self.PregameTitleSmall = PregameTitleSmall
	
	local EditButtonPrompt = CoD.buttonprompt.new( f10_local1, controller )
	EditButtonPrompt:setLeftRight( true, false, 66, 280 )
	EditButtonPrompt:setTopBottom( true, false, 651, 682 )
	EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
	EditButtonPrompt.keyshortcut:setText( Engine.Localize( "[^3E^7]" ) )
	EditButtonPrompt:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			EditButtonPrompt.buttonPromptImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	EditButtonPrompt:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.Pregame.stage", 102 )
			end
		},
		{
			stateName = "DefaultStatePC",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	EditButtonPrompt:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.stage" ), function ( model )
		f10_local1:updateElementState( EditButtonPrompt, {
			name = "model_validation",
			menu = f10_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.stage"
		} )
	end )
	EditButtonPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		f10_local1:updateElementState( EditButtonPrompt, {
			name = "model_validation",
			menu = f10_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	if EditButtonPrompt.m_eventHandlers.input_source_changed then
		local f10_local17 = EditButtonPrompt.m_eventHandlers.input_source_changed
		EditButtonPrompt:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or f10_local1
			element:updateState( event )
			return f10_local17( element, event )
		end )
	else
		EditButtonPrompt:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	EditButtonPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		f10_local1:updateElementState( EditButtonPrompt, {
			name = "model_validation",
			menu = f10_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			SpecialistDraft = function ()
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
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
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( false, false, -191.35, 191.44 )
					FEButtonPanel0:setTopBottom( false, false, -254.92, 324 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( false, false, -190.53, 192.26 )
				self.FEButtonPanel0:setTopBottom( false, false, -145, 149 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( true, false, 448.6, 831.4 )
					PregameMainTimer:setTopBottom( true, false, 157.43, 288.43 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( true, false, 449.47, 832.26 )
				self.PregameMainTimer:setTopBottom( true, false, 268, 399 )
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
									PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
									PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
								PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
								PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
							PreGameStates:setLeftRight( false, false, -143.34, 143.66 )
							PreGameStates:setTopBottom( true, false, 120.91, 154.12 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( false, false, -142.93, 144.07 )
						PreGameStates:setTopBottom( true, false, 172.5, 205.72 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( false, false, -142.5, 144.5 )
				self.PreGameStates:setTopBottom( true, false, 227.79, 261 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( true, false, -9, 1348 )
						PregameFactionHeader:setTopBottom( true, false, -291.32, -132.57 )
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
						PregameFactionHeader:setLeftRight( true, false, -12.5, 1344.5 )
						PregameFactionHeader:setTopBottom( true, false, -115.61, 43.14 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( true, false, -16.5, 1340.5 )
				self.PregameFactionHeader:setTopBottom( true, false, 85.19, 243.94 )
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			CACEdit = function ()
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
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
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( false, false, -191.35, 191.44 )
					FEButtonPanel0:setTopBottom( false, false, -254.92, 324 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( false, false, -190.53, 192.26 )
				self.FEButtonPanel0:setTopBottom( false, false, -145, 149 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( true, false, 448.6, 831.4 )
					PregameMainTimer:setTopBottom( true, false, 157.43, 288.43 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( true, false, 449.47, 832.26 )
				self.PregameMainTimer:setTopBottom( true, false, 268, 399 )
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
									PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
									PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
								PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
								PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
							PreGameStates:setLeftRight( false, false, -143.34, 143.66 )
							PreGameStates:setTopBottom( true, false, 120.91, 154.12 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( false, false, -142.93, 144.07 )
						PreGameStates:setTopBottom( true, false, 172.5, 205.72 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( false, false, -142.5, 144.5 )
				self.PreGameStates:setTopBottom( true, false, 227.79, 261 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( true, false, -9, 1348 )
						PregameFactionHeader:setTopBottom( true, false, -291.32, -132.57 )
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
						PregameFactionHeader:setLeftRight( true, false, -12.5, 1344.5 )
						PregameFactionHeader:setTopBottom( true, false, -115.61, 43.14 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( true, false, -16.5, 1340.5 )
				self.PregameFactionHeader:setTopBottom( true, false, 85.19, 243.94 )
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
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
			StreakEdit = function ()
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
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
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( false, false, -191.35, 191.44 )
					FEButtonPanel0:setTopBottom( false, false, -254.92, 324 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( false, false, -190.53, 192.26 )
				self.FEButtonPanel0:setTopBottom( false, false, -145, 149 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( true, false, 448.6, 831.4 )
					PregameMainTimer:setTopBottom( true, false, 157.43, 288.43 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( true, false, 449.47, 832.26 )
				self.PregameMainTimer:setTopBottom( true, false, 268, 399 )
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
									PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
									PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
								PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
								PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
							PreGameStates:setLeftRight( false, false, -143.34, 143.66 )
							PreGameStates:setTopBottom( true, false, 120.91, 154.12 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( false, false, -142.93, 144.07 )
						PreGameStates:setTopBottom( true, false, 172.5, 205.72 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( false, false, -142.5, 144.5 )
				self.PreGameStates:setTopBottom( true, false, 227.79, 261 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( true, false, -9, 1348 )
						PregameFactionHeader:setTopBottom( true, false, -291.32, -132.57 )
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
						PregameFactionHeader:setLeftRight( true, false, -12.5, 1344.5 )
						PregameFactionHeader:setTopBottom( true, false, -115.61, 43.14 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( true, false, -16.5, 1340.5 )
				self.PregameFactionHeader:setTopBottom( true, false, 85.19, 243.94 )
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
				self:setupElementClipCounter( 7 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 215, 735 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 735 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
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
				self:setupElementClipCounter( 10 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel0:setLeftRight( false, false, -191.35, 191.44 )
					FEButtonPanel0:setTopBottom( false, false, -254.92, 324 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( false, false, -190.53, 192.26 )
				self.FEButtonPanel0:setTopBottom( false, false, -145, 149 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 684 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					local Team1ListLargeFrame3 = function ( Team1ListLarge, event )
						if not event.interrupted then
							Team1ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
						Team1ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 684 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 484 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					local Team2ListLargeFrame3 = function ( Team2ListLarge, event )
						if not event.interrupted then
							Team2ListLarge:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
						Team2ListLarge:setTopBottom( true, false, 100, 720 )
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
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 100, 720 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 743, 1093 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
				self.PregameBanProtectSelections:setAlpha( 1 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PregameMainTimer:setLeftRight( true, false, 448.6, 831.4 )
					PregameMainTimer:setTopBottom( true, false, 157.43, 288.43 )
					if event.interrupted then
						self.clipFinished( PregameMainTimer, event )
					else
						PregameMainTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameMainTimer:completeAnimation()
				self.PregameMainTimer:setLeftRight( true, false, 449.47, 832.26 )
				self.PregameMainTimer:setTopBottom( true, false, 268, 399 )
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
									PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
									PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
								PreGameStates:setLeftRight( false, false, -143.37, 143.63 )
								PreGameStates:setTopBottom( true, false, 117.22, 150.43 )
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
							PreGameStates:setLeftRight( false, false, -143.34, 143.66 )
							PreGameStates:setTopBottom( true, false, 120.91, 154.12 )
							PreGameStates.MatchText:setAlpha( 0 )
							PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame4 )
						end
					end
					
					if event.interrupted then
						PreGameStatesFrame3( PreGameStates, event )
						return 
					else
						PreGameStates:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						PreGameStates:setLeftRight( false, false, -142.93, 144.07 )
						PreGameStates:setTopBottom( true, false, 172.5, 205.72 )
						PreGameStates:registerEventHandler( "transition_complete_keyframe", PreGameStatesFrame3 )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setLeftRight( false, false, -142.5, 144.5 )
				self.PreGameStates:setTopBottom( true, false, 227.79, 261 )
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local PregameFactionHeaderFrame2 = function ( PregameFactionHeader, event )
					local PregameFactionHeaderFrame3 = function ( PregameFactionHeader, event )
						if not event.interrupted then
							PregameFactionHeader:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						PregameFactionHeader:setLeftRight( true, false, -9, 1348 )
						PregameFactionHeader:setTopBottom( true, false, -291.32, -132.57 )
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
						PregameFactionHeader:setLeftRight( true, false, -12.5, 1344.5 )
						PregameFactionHeader:setTopBottom( true, false, -115.61, 43.14 )
						PregameFactionHeader:setAlpha( 0 )
						PregameFactionHeader:registerEventHandler( "transition_complete_keyframe", PregameFactionHeaderFrame3 )
					end
				end
				
				PregameFactionHeader:completeAnimation()
				self.PregameFactionHeader:setLeftRight( true, false, -16.5, 1340.5 )
				self.PregameFactionHeader:setTopBottom( true, false, 85.19, 243.94 )
				self.PregameFactionHeader:setAlpha( 1 )
				PregameFactionHeaderFrame2( PregameFactionHeader, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end
		},
		SpecialistDraft_9 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PregameBanProtectSelections:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				PregameBanProtectSelections:setAlpha( 0 )
				PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			CACEdit_9 = function ()
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
				self:setupElementClipCounter( 3 )
				PregameBanProtectSelections:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				PregameBanProtectSelections:setAlpha( 0 )
				PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			CACEdit = function ()
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
			StreakEdit = function ()
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
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			StreakEdit_9 = function ()
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
						EditButtonPrompt.label:beginAnimation( "subkeyframe", 150, false, false, CoD.TweenType.Linear )
					end
					EditButtonPrompt:setAlpha( 0 )
					EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
					if event.interrupted then
						self.clipFinished( EditButtonPrompt, event )
					else
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end
		},
		CACEdit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			StreakEdit = function ()
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
						EditButtonPrompt.label:beginAnimation( "subkeyframe", 150, false, false, CoD.TweenType.Linear )
					end
					EditButtonPrompt:setAlpha( 0 )
					EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
					if event.interrupted then
						self.clipFinished( EditButtonPrompt, event )
					else
						EditButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_CAC" ) )
				EditButtonPromptFrame2( EditButtonPrompt, {} )
			end
		},
		StreakEdit_9 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			Launch_9 = function ()
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
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setAlpha( 0.95 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				EditButtonPrompt.label:completeAnimation()
				self.EditButtonPrompt:setAlpha( 1 )
				self.EditButtonPrompt.label:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS" ) )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			Launch = function ()
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
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			DefaultState = function ()
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
				self:setupElementClipCounter( 2 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
				self.clipFinished( PreGameStates, {} )
				EditButtonPrompt:completeAnimation()
				self.EditButtonPrompt:setAlpha( 0 )
				self.clipFinished( EditButtonPrompt, {} )
			end,
			DefaultState = function ()
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
		f10_local1:updateElementState( self, {
			name = "model_validation",
			menu = f10_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		local f275_local0 = self
		local f275_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( f275_local0, f10_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.stage" ), function ( model )
		local f276_local0 = self
		local f276_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.stage"
		}
		CoD.Menu.UpdateButtonShownState( f276_local0, f10_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		local f277_local0 = self
		local f277_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		}
		CoD.Menu.UpdateButtonShownState( f277_local0, f10_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( f10_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f278_local0 = nil
		SendClientScriptMenuStateChangeNotify( controller, f10_local1, true, "mp" )
		if not f278_local0 then
			f278_local0 = element:dispatchEventToChildren( event )
		end
		return f278_local0
	end )
	f10_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "E", function ( f279_arg0, f279_arg1, f279_arg2, f279_arg3 )
		if ItemRestrictionCACEditActive() and IsGlobalModelValueEqualTo( f279_arg0, f279_arg2, "lobbyRoot.Pregame.stage", 102 ) and not IsCodCaster( f279_arg2 ) then
			SetPregameEditIncomplete( f279_arg2 )
			return true
		elseif ItemRestrictionScorestreakEditActive() and IsGlobalModelValueEqualTo( f279_arg0, f279_arg2, "lobbyRoot.Pregame.stage", 102 ) and not IsCodCaster( f279_arg2 ) then
			SetPregameEditIncomplete( f279_arg2 )
			return true
		else
			
		end
	end, function ( f280_arg0, f280_arg1, f280_arg2 )
		if ItemRestrictionCACEditActive() and IsGlobalModelValueEqualTo( f280_arg0, f280_arg2, "lobbyRoot.Pregame.stage", 102 ) and not IsCodCaster( f280_arg2 ) then
			CoD.Menu.SetButtonLabel( f280_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_OPEN_SCORESTREAK_EDIT" )
			return true
		elseif ItemRestrictionScorestreakEditActive() and IsGlobalModelValueEqualTo( f280_arg0, f280_arg2, "lobbyRoot.Pregame.stage", 102 ) and not IsCodCaster( f280_arg2 ) then
			CoD.Menu.SetButtonLabel( f280_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_OPEN_EDIT_CAC" )
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
		menu = f10_local1
	} )
	if not self:restoreState() then
		self.PregameBanProtectSelections:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.FEButtonPanel0:close()
		element.Team1ListSmall:close()
		element.Team1ListLarge:close()
		element.Team2ListSmall:close()
		element.Team2ListLarge:close()
		element.PregameBanProtectSelections:close()
		element.PregameMainTimer:close()
		element.PreGameStates:close()
		element.PregameFactionHeader:close()
		element.PregameTitleSmall:close()
		element.EditButtonPrompt:close()
		element.MapImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

