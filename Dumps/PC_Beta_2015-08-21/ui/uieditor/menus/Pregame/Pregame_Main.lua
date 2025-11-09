require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Pregame.Pregame_VsPanel" )
require( "ui.uieditor.widgets.Pregame.Pregame_Client_Small" )
require( "ui.uieditor.widgets.Pregame.Pregame_Client" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectSelections" )
require( "ui.uieditor.widgets.Pregame.Pregame_MainTimer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.occludedBy
	while f1_local0 ~= nil do
		if f1_local0.occludedBy ~= nil then
			f1_local0 = f1_local0.occludedBy
		end
		Engine.SendClientScriptNotify( f1_arg1, "menu_change", "Pregame_Main", "closeToMenu" )
		GoBackToMenu( f1_local0, f1_arg1, "Pregame_Main" )
		return 
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "Pregame" ), "clientState" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f3_local1 = Engine.GetLobbyPregameState()
		if modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING then
			if f3_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE then
				OpenOverlay( f2_arg0, "Pregame_ItemVote", f2_arg1 )
			elseif f3_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT then
				OpenChooseCharacterLoadout( nil, nil, f2_arg1, nil, f2_arg0 )
			elseif f3_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
				ShowCACContentWarning( f2_arg0, nil, f2_arg1 )
			elseif f3_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
				ShowStreakContentWarning( f2_arg0, nil, f2_arg1 )
			end
		elseif modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED then
			f0_local0( f2_arg0, f2_arg1 )
		elseif modelValue == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED then
			if f3_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT then
				local f3_local2 = Engine.GetXUID64( f2_arg1 )
				local f3_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
				for f3_local8, f3_local9 in ipairs( f3_local3.sessionClients ) do
					if Engine.CompareUInt64( f3_local9.xuid, f3_local2, "=" ) then
						local f3_local7 = f3_local9.characterDraft.characterIndex
						Engine.SetHeroLoadoutItem( f2_arg1, CoD.perController[f2_arg1].customizationMode, f3_local7, f3_local9.characterDraft.loadout )
						Engine.SetHero( f2_arg1, CoD.perController[f2_arg1].customizationMode, f3_local7 )
					end
				end
			end
			f0_local0( f2_arg0, f2_arg1 )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame_Main.buttonPrompts" )
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
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, 0, 720 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( self, controller )
	FEButtonPanel0:setLeftRight( false, false, -190.53, 192.26 )
	FEButtonPanel0:setTopBottom( false, false, -145, 149 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.26 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local PregameVsPanel0 = CoD.Pregame_VsPanel.new( self, controller )
	PregameVsPanel0:setLeftRight( true, false, 639, 1313 )
	PregameVsPanel0:setTopBottom( true, false, 116, 196 )
	PregameVsPanel0:setRGB( 0.5, 0.5, 0.5 )
	PregameVsPanel0:setYRot( 180 )
	self:addElement( PregameVsPanel0 )
	self.PregameVsPanel0 = PregameVsPanel0
	
	local PregameVsPanel = CoD.Pregame_VsPanel.new( self, controller )
	PregameVsPanel:setLeftRight( true, false, -35, 639 )
	PregameVsPanel:setTopBottom( true, false, 116, 196 )
	PregameVsPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( PregameVsPanel )
	self.PregameVsPanel = PregameVsPanel
	
	local Team1ListSmall = LUI.UIList.new( self, controller, 0, 0, function ( f6_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f6_arg0, "teamString" ) ) == "1"
	end, false, false, 0, 0, false, true )
	Team1ListSmall:makeFocusable()
	Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
	Team1ListSmall:setTopBottom( true, false, 215, 363 )
	Team1ListSmall:setDataSource( "PregameClientList" )
	Team1ListSmall:setWidgetType( CoD.Pregame_Client_Small )
	Team1ListSmall:setVerticalCount( 4 )
	Team1ListSmall:setSpacing( 0 )
	self:addElement( Team1ListSmall )
	self.Team1ListSmall = Team1ListSmall
	
	local Team1ListLarge = LUI.UIList.new( self, controller, 10, 0, function ( f7_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f7_arg0, "teamString" ) ) == "1"
	end, false, false, 0, 0, false, true )
	Team1ListLarge:makeFocusable()
	Team1ListLarge:setLeftRight( true, false, -488, -63 )
	Team1ListLarge:setTopBottom( true, false, 215, 473 )
	Team1ListLarge:setDataSource( "PregameClientList" )
	Team1ListLarge:setWidgetType( CoD.Pregame_Client )
	Team1ListLarge:setVerticalCount( 4 )
	Team1ListLarge:setSpacing( 10 )
	self:addElement( Team1ListLarge )
	self.Team1ListLarge = Team1ListLarge
	
	local Team2ListSmall = LUI.UIList.new( self, controller, 0, 0, function ( f8_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f8_arg0, "teamString" ) ) == "2"
	end, false, false, 0, 0, false, true )
	Team2ListSmall:makeFocusable()
	Team2ListSmall:setLeftRight( true, false, 798, 1223 )
	Team2ListSmall:setTopBottom( true, false, 215, 363 )
	Team2ListSmall:setDataSource( "PregameClientList" )
	Team2ListSmall:setWidgetType( CoD.Pregame_Client_Small )
	Team2ListSmall:setVerticalCount( 4 )
	Team2ListSmall:setSpacing( 0 )
	self:addElement( Team2ListSmall )
	self.Team2ListSmall = Team2ListSmall
	
	local Team2ListLarge = LUI.UIList.new( self, controller, 11, 0, function ( f9_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f9_arg0, "teamString" ) ) == "2"
	end, false, false, 0, 0, false, true )
	Team2ListLarge:makeFocusable()
	Team2ListLarge:setLeftRight( true, false, 1348, 1773 )
	Team2ListLarge:setTopBottom( true, false, 215, 476 )
	Team2ListLarge:setDataSource( "PregameClientList" )
	Team2ListLarge:setWidgetType( CoD.Pregame_Client )
	Team2ListLarge:setVerticalCount( 4 )
	Team2ListLarge:setSpacing( 11 )
	self:addElement( Team2ListLarge )
	self.Team2ListLarge = Team2ListLarge
	
	local PregameBanProtectSelections = CoD.Pregame_BanProtectSelections.new( self, controller )
	PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
	PregameBanProtectSelections:setTopBottom( true, false, 507, 857 )
	self:addElement( PregameBanProtectSelections )
	self.PregameBanProtectSelections = PregameBanProtectSelections
	
	local PregameMainTimer = CoD.Pregame_MainTimer.new( self, controller )
	PregameMainTimer:setLeftRight( true, false, 449.47, 832.26 )
	PregameMainTimer:setTopBottom( true, false, 268, 399 )
	self:addElement( PregameMainTimer )
	self.PregameMainTimer = PregameMainTimer
	
	local VSBanner = CoD.FE_ListHeaderGlow.new( self, controller )
	VSBanner:setLeftRight( true, false, 619.5, 660.5 )
	VSBanner:setTopBottom( true, false, 142, 170 )
	self:addElement( VSBanner )
	self.VSBanner = VSBanner
	
	local VSLabel = LUI.UITightText.new()
	VSLabel:setLeftRight( false, false, -14.5, 16.5 )
	VSLabel:setTopBottom( true, false, 143.5, 168.5 )
	VSLabel:setRGB( 0, 0, 0 )
	VSLabel:setText( Engine.Localize( "MP_VERSUS" ) )
	VSLabel:setTTF( "fonts/escom.ttf" )
	VSLabel:setLetterSpacing( 2 )
	self:addElement( VSLabel )
	self.VSLabel = VSLabel
	
	local PregameTitle = CoD.Pregame_Title.new( self, controller )
	PregameTitle:setLeftRight( true, false, 401, 877 )
	PregameTitle:setTopBottom( true, false, 50, 103 )
	PregameTitle.KillcamText0:setText( Engine.Localize( GetGameModeOnMapName( "Domination on Stronghold" ) ) )
	PregameTitle:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local gameTypeIcon = Engine.GetModelValue( model )
		if gameTypeIcon then
			PregameTitle.GamemodeIcon:setImage( RegisterImage( gameTypeIcon ) )
		end
	end )
	self:addElement( PregameTitle )
	self.PregameTitle = PregameTitle
	
	local PreGameStates = CoD.PrematchCountdown_BeginsIn.new( self, controller )
	PreGameStates:setLeftRight( false, false, -142.5, 144.5 )
	PreGameStates:setTopBottom( true, false, 227.79, 261 )
	PreGameStates.FEButtonPanel0:setAlpha( 0.57 )
	PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
	PreGameStates.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	PreGameStates.MatchText:setLetterSpacing( 1 )
	self:addElement( PreGameStates )
	self.PreGameStates = PreGameStates
	
	local Team1IconAndNameWidgetContainer = CoD.TeamIconAndNameWidgetContainer.new( self, controller )
	Team1IconAndNameWidgetContainer:setLeftRight( true, false, 112.5, 457.5 )
	Team1IconAndNameWidgetContainer:setTopBottom( true, false, 116, 201 )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "alliesFactionDisplayName", function ( model )
		local alliesFactionDisplayName = Engine.GetModelValue( model )
		if alliesFactionDisplayName then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionName:setText( Engine.Localize( alliesFactionDisplayName ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "alliesFactionIcon", function ( model )
		local alliesFactionIcon = Engine.GetModelValue( model )
		if alliesFactionIcon then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIconSolid:setImage( RegisterImage( alliesFactionIcon ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "alliesFactionIcon", function ( model )
		local alliesFactionIcon = Engine.GetModelValue( model )
		if alliesFactionIcon then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIcon:setImage( RegisterImage( alliesFactionIcon ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "alliesFactionDisplayName", function ( model )
		local alliesFactionDisplayName = Engine.GetModelValue( model )
		if alliesFactionDisplayName then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionName:setText( Engine.Localize( alliesFactionDisplayName ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "alliesFactionIcon", function ( model )
		local alliesFactionIcon = Engine.GetModelValue( model )
		if alliesFactionIcon then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIconSolid:setImage( RegisterImage( alliesFactionIcon ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "alliesFactionIcon", function ( model )
		local alliesFactionIcon = Engine.GetModelValue( model )
		if alliesFactionIcon then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIcon:setImage( RegisterImage( alliesFactionIcon ) )
		end
	end )
	self:addElement( Team1IconAndNameWidgetContainer )
	self.Team1IconAndNameWidgetContainer = Team1IconAndNameWidgetContainer
	
	local Team2IconAndNameWidgetContainer = CoD.TeamIconAndNameWidgetContainer.new( self, controller )
	Team2IconAndNameWidgetContainer:setLeftRight( true, false, 838, 1183 )
	Team2IconAndNameWidgetContainer:setTopBottom( true, false, 116, 201 )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "axisFactionDisplayName", function ( model )
		local axisFactionDisplayName = Engine.GetModelValue( model )
		if axisFactionDisplayName then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionName:setText( Engine.Localize( axisFactionDisplayName ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local axisFactionIcon = Engine.GetModelValue( model )
		if axisFactionIcon then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIconSolid:setImage( RegisterImage( axisFactionIcon ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local axisFactionIcon = Engine.GetModelValue( model )
		if axisFactionIcon then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIcon:setImage( RegisterImage( axisFactionIcon ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "axisFactionDisplayName", function ( model )
		local axisFactionDisplayName = Engine.GetModelValue( model )
		if axisFactionDisplayName then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionName:setText( Engine.Localize( axisFactionDisplayName ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local axisFactionIcon = Engine.GetModelValue( model )
		if axisFactionIcon then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIconSolid:setImage( RegisterImage( axisFactionIcon ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local axisFactionIcon = Engine.GetModelValue( model )
		if axisFactionIcon then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIcon:setImage( RegisterImage( axisFactionIcon ) )
		end
	end )
	self:addElement( Team2IconAndNameWidgetContainer )
	self.Team2IconAndNameWidgetContainer = Team2IconAndNameWidgetContainer
	
	Team1ListSmall.navigation = {
		left = Team1ListLarge,
		right = Team2ListSmall,
		down = PregameBanProtectSelections
	}
	Team1ListLarge.navigation = {
		right = Team1ListSmall
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
		up = {
			Team1ListSmall,
			Team2ListSmall
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "0" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			StreakEdit = function ()
				self:setupElementClipCounter( 15 )
				local MapImageFrame2 = function ( MapImage, event )
					if not event.interrupted then
						MapImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
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
						Darken:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
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
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
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
				local PregameVsPanel0Frame2 = function ( PregameVsPanel0, event )
					if not event.interrupted then
						PregameVsPanel0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel0, event )
					else
						PregameVsPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel0:completeAnimation()
				self.PregameVsPanel0:setAlpha( 1 )
				PregameVsPanel0Frame2( PregameVsPanel0, {} )
				local PregameVsPanelFrame2 = function ( PregameVsPanel, event )
					if not event.interrupted then
						PregameVsPanel:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel, event )
					else
						PregameVsPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel:completeAnimation()
				self.PregameVsPanel:setAlpha( 1 )
				PregameVsPanelFrame2( PregameVsPanel, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 363 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
					Team1ListLarge:setTopBottom( true, false, 215, 473 )
					Team1ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 363 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
					Team2ListLarge:setTopBottom( true, false, 215, 476 )
					Team2ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
				self.PregameBanProtectSelections:setAlpha( 0 )
				PregameBanProtectSelectionsFrame2( PregameBanProtectSelections, {} )
				local PregameMainTimerFrame2 = function ( PregameMainTimer, event )
					if not event.interrupted then
						PregameMainTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
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
				local VSBannerFrame2 = function ( VSBanner, event )
					if not event.interrupted then
						VSBanner:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					VSBanner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSBanner, event )
					else
						VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 1 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					if not event.interrupted then
						VSLabel:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					VSLabel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSLabel, event )
					else
						VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 1 )
				VSLabelFrame2( VSLabel, {} )
				local PregameTitleFrame2 = function ( PregameTitle, event )
					if not event.interrupted then
						PregameTitle:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					PregameTitle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameTitle, event )
					else
						PregameTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTitle:completeAnimation()
				self.PregameTitle:setAlpha( 1 )
				PregameTitleFrame2( PregameTitle, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					if not event.interrupted then
						PreGameStates:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
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
			end
		},
		ItemRestriction = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_BAN_PROTECT_VOTING_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			SpecialistDraft = function ()
				self:setupElementClipCounter( 3 )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 363 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, 72.5, 497.5 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 1 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 363 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 798, 1223 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 1 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
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
			end
		},
		SpecialistDraft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )
				Darken:completeAnimation()
				self.Darken:setAlpha( 0.3 )
				self.clipFinished( Darken, {} )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.26 )
				self.clipFinished( FEButtonPanel0, {} )
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 473 )
				self.Team1ListSmall:setAlpha( 0 )
				self.clipFinished( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
					Team1ListLarge:setTopBottom( true, false, 215, 473 )
					Team1ListLarge:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, -466.5, -41.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 0 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 473 )
				self.Team2ListSmall:setAlpha( 0 )
				self.clipFinished( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
					Team2ListLarge:setTopBottom( true, false, 215, 476 )
					Team2ListLarge:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 1340.5, 1765.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 0 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 752, 902 )
				self.clipFinished( PregameBanProtectSelections, {} )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 18 )
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
				local PregameVsPanel0Frame2 = function ( PregameVsPanel0, event )
					if not event.interrupted then
						PregameVsPanel0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel0, event )
					else
						PregameVsPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel0:completeAnimation()
				self.PregameVsPanel0:setAlpha( 1 )
				PregameVsPanel0Frame2( PregameVsPanel0, {} )
				local PregameVsPanelFrame2 = function ( PregameVsPanel, event )
					if not event.interrupted then
						PregameVsPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel, event )
					else
						PregameVsPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel:completeAnimation()
				self.PregameVsPanel:setAlpha( 1 )
				PregameVsPanelFrame2( PregameVsPanel, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 363 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
					Team1ListLarge:setTopBottom( true, false, 215, 473 )
					Team1ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 363 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
					Team2ListLarge:setTopBottom( true, false, 215, 476 )
					Team2ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
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
				local VSBannerFrame2 = function ( VSBanner, event )
					if not event.interrupted then
						VSBanner:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSBanner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSBanner, event )
					else
						VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 1 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					if not event.interrupted then
						VSLabel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSLabel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSLabel, event )
					else
						VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 1 )
				VSLabelFrame2( VSLabel, {} )
				local PregameTitleFrame2 = function ( PregameTitle, event )
					if not event.interrupted then
						PregameTitle:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameTitle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameTitle, event )
					else
						PregameTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTitle:completeAnimation()
				self.PregameTitle:setAlpha( 1 )
				PregameTitleFrame2( PregameTitle, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					if not event.interrupted then
						PreGameStates:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PreGameStates:setAlpha( 0 )
					PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
					if event.interrupted then
						self.clipFinished( PreGameStates, event )
					else
						PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setAlpha( 1 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local Team1IconAndNameWidgetContainerFrame2 = function ( Team1IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team1IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1IconAndNameWidgetContainer, event )
					else
						Team1IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1IconAndNameWidgetContainer:completeAnimation()
				self.Team1IconAndNameWidgetContainer:setAlpha( 1 )
				Team1IconAndNameWidgetContainerFrame2( Team1IconAndNameWidgetContainer, {} )
				local Team2IconAndNameWidgetContainerFrame2 = function ( Team2IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team2IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2IconAndNameWidgetContainer, event )
					else
						Team2IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2IconAndNameWidgetContainer:completeAnimation()
				self.Team2IconAndNameWidgetContainer:setAlpha( 1 )
				Team2IconAndNameWidgetContainerFrame2( Team2IconAndNameWidgetContainer, {} )
			end
		},
		CACEdit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				self.clipFinished( Team1ListSmall, {} )
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				self.clipFinished( Team1ListLarge, {} )
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				self.clipFinished( Team2ListSmall, {} )
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				self.clipFinished( Team2ListLarge, {} )
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
				self.PregameBanProtectSelections:setAlpha( 0 )
				self.clipFinished( PregameBanProtectSelections, {} )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_CAC_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 18 )
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
				local PregameVsPanel0Frame2 = function ( PregameVsPanel0, event )
					if not event.interrupted then
						PregameVsPanel0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel0, event )
					else
						PregameVsPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel0:completeAnimation()
				self.PregameVsPanel0:setAlpha( 1 )
				PregameVsPanel0Frame2( PregameVsPanel0, {} )
				local PregameVsPanelFrame2 = function ( PregameVsPanel, event )
					if not event.interrupted then
						PregameVsPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel, event )
					else
						PregameVsPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel:completeAnimation()
				self.PregameVsPanel:setAlpha( 1 )
				PregameVsPanelFrame2( PregameVsPanel, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 363 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
					Team1ListLarge:setTopBottom( true, false, 215, 473 )
					Team1ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 363 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
					Team2ListLarge:setTopBottom( true, false, 215, 476 )
					Team2ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
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
				local VSBannerFrame2 = function ( VSBanner, event )
					if not event.interrupted then
						VSBanner:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSBanner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSBanner, event )
					else
						VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 1 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					if not event.interrupted then
						VSLabel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSLabel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSLabel, event )
					else
						VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 1 )
				VSLabelFrame2( VSLabel, {} )
				local PregameTitleFrame2 = function ( PregameTitle, event )
					if not event.interrupted then
						PregameTitle:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameTitle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameTitle, event )
					else
						PregameTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTitle:completeAnimation()
				self.PregameTitle:setAlpha( 1 )
				PregameTitleFrame2( PregameTitle, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					if not event.interrupted then
						PreGameStates:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PreGameStates:setAlpha( 0 )
					PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
					if event.interrupted then
						self.clipFinished( PreGameStates, event )
					else
						PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setAlpha( 1 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local Team1IconAndNameWidgetContainerFrame2 = function ( Team1IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team1IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1IconAndNameWidgetContainer, event )
					else
						Team1IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1IconAndNameWidgetContainer:completeAnimation()
				self.Team1IconAndNameWidgetContainer:setAlpha( 1 )
				Team1IconAndNameWidgetContainerFrame2( Team1IconAndNameWidgetContainer, {} )
				local Team2IconAndNameWidgetContainerFrame2 = function ( Team2IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team2IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2IconAndNameWidgetContainer, event )
					else
						Team2IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2IconAndNameWidgetContainer:completeAnimation()
				self.Team2IconAndNameWidgetContainer:setAlpha( 1 )
				Team2IconAndNameWidgetContainerFrame2( Team2IconAndNameWidgetContainer, {} )
			end
		},
		StreakEdit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				self.clipFinished( Team1ListSmall, {} )
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				self.clipFinished( Team1ListLarge, {} )
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				self.clipFinished( Team2ListSmall, {} )
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				self.clipFinished( Team2ListLarge, {} )
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
				self.PregameBanProtectSelections:setAlpha( 0 )
				self.clipFinished( PregameBanProtectSelections, {} )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 18 )
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
				local PregameVsPanel0Frame2 = function ( PregameVsPanel0, event )
					if not event.interrupted then
						PregameVsPanel0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel0, event )
					else
						PregameVsPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel0:completeAnimation()
				self.PregameVsPanel0:setAlpha( 1 )
				PregameVsPanel0Frame2( PregameVsPanel0, {} )
				local PregameVsPanelFrame2 = function ( PregameVsPanel, event )
					if not event.interrupted then
						PregameVsPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel, event )
					else
						PregameVsPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel:completeAnimation()
				self.PregameVsPanel:setAlpha( 1 )
				PregameVsPanelFrame2( PregameVsPanel, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 363 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
					Team1ListLarge:setTopBottom( true, false, 215, 473 )
					Team1ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 363 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
					Team2ListLarge:setTopBottom( true, false, 215, 476 )
					Team2ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
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
				local VSBannerFrame2 = function ( VSBanner, event )
					if not event.interrupted then
						VSBanner:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSBanner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSBanner, event )
					else
						VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 1 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					if not event.interrupted then
						VSLabel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSLabel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSLabel, event )
					else
						VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 1 )
				VSLabelFrame2( VSLabel, {} )
				local PregameTitleFrame2 = function ( PregameTitle, event )
					if not event.interrupted then
						PregameTitle:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameTitle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameTitle, event )
					else
						PregameTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTitle:completeAnimation()
				self.PregameTitle:setAlpha( 1 )
				PregameTitleFrame2( PregameTitle, {} )
				local PreGameStatesFrame2 = function ( PreGameStates, event )
					if not event.interrupted then
						PreGameStates:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						PreGameStates.MatchText:beginAnimation( "subkeyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PreGameStates:setAlpha( 0 )
					PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
					if event.interrupted then
						self.clipFinished( PreGameStates, event )
					else
						PreGameStates:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates:setAlpha( 1 )
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_EDIT_SCORESTREAKS_CAPS" ) )
				PreGameStatesFrame2( PreGameStates, {} )
				local Team1IconAndNameWidgetContainerFrame2 = function ( Team1IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team1IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1IconAndNameWidgetContainer, event )
					else
						Team1IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1IconAndNameWidgetContainer:completeAnimation()
				self.Team1IconAndNameWidgetContainer:setAlpha( 1 )
				Team1IconAndNameWidgetContainerFrame2( Team1IconAndNameWidgetContainer, {} )
				local Team2IconAndNameWidgetContainerFrame2 = function ( Team2IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team2IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2IconAndNameWidgetContainer, event )
					else
						Team2IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2IconAndNameWidgetContainer:completeAnimation()
				self.Team2IconAndNameWidgetContainer:setAlpha( 1 )
				Team2IconAndNameWidgetContainerFrame2( Team2IconAndNameWidgetContainer, {} )
			end
		},
		Launch = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				self.clipFinished( Team1ListSmall, {} )
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				self.clipFinished( Team1ListLarge, {} )
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				self.clipFinished( Team2ListSmall, {} )
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				self.clipFinished( Team2ListLarge, {} )
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
				self.PregameBanProtectSelections:setAlpha( 0 )
				self.clipFinished( PregameBanProtectSelections, {} )
				PreGameStates:completeAnimation()
				PreGameStates.MatchText:completeAnimation()
				self.PreGameStates.MatchText:setText( Engine.Localize( "MENU_GAME_STARTING" ) )
				self.clipFinished( PreGameStates, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 18 )
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
				local PregameVsPanel0Frame2 = function ( PregameVsPanel0, event )
					if not event.interrupted then
						PregameVsPanel0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel0, event )
					else
						PregameVsPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel0:completeAnimation()
				self.PregameVsPanel0:setAlpha( 1 )
				PregameVsPanel0Frame2( PregameVsPanel0, {} )
				local PregameVsPanelFrame2 = function ( PregameVsPanel, event )
					if not event.interrupted then
						PregameVsPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameVsPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameVsPanel, event )
					else
						PregameVsPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameVsPanel:completeAnimation()
				self.PregameVsPanel:setAlpha( 1 )
				PregameVsPanelFrame2( PregameVsPanel, {} )
				local Team1ListSmallFrame2 = function ( Team1ListSmall, event )
					if not event.interrupted then
						Team1ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListSmall:setLeftRight( true, false, -425, 0 )
					Team1ListSmall:setTopBottom( true, false, 215, 363 )
					Team1ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListSmall, event )
					else
						Team1ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListSmall:completeAnimation()
				self.Team1ListSmall:setLeftRight( true, false, -425, 0 )
				self.Team1ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team1ListSmall:setAlpha( 0 )
				Team1ListSmallFrame2( Team1ListSmall, {} )
				local Team1ListLargeFrame2 = function ( Team1ListLarge, event )
					if not event.interrupted then
						Team1ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
					Team1ListLarge:setTopBottom( true, false, 215, 473 )
					Team1ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1ListLarge, event )
					else
						Team1ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1ListLarge:completeAnimation()
				self.Team1ListLarge:setLeftRight( true, false, 78.5, 503.5 )
				self.Team1ListLarge:setTopBottom( true, false, 215, 473 )
				self.Team1ListLarge:setAlpha( 1 )
				Team1ListLargeFrame2( Team1ListLarge, {} )
				local Team2ListSmallFrame2 = function ( Team2ListSmall, event )
					if not event.interrupted then
						Team2ListSmall:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
					Team2ListSmall:setTopBottom( true, false, 215, 363 )
					Team2ListSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListSmall, event )
					else
						Team2ListSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListSmall:completeAnimation()
				self.Team2ListSmall:setLeftRight( true, false, 1280, 1705 )
				self.Team2ListSmall:setTopBottom( true, false, 215, 363 )
				self.Team2ListSmall:setAlpha( 0 )
				Team2ListSmallFrame2( Team2ListSmall, {} )
				local Team2ListLargeFrame2 = function ( Team2ListLarge, event )
					if not event.interrupted then
						Team2ListLarge:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
					Team2ListLarge:setTopBottom( true, false, 215, 476 )
					Team2ListLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2ListLarge, event )
					else
						Team2ListLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2ListLarge:completeAnimation()
				self.Team2ListLarge:setLeftRight( true, false, 798.5, 1223.5 )
				self.Team2ListLarge:setTopBottom( true, false, 215, 476 )
				self.Team2ListLarge:setAlpha( 1 )
				Team2ListLargeFrame2( Team2ListLarge, {} )
				local PregameBanProtectSelectionsFrame2 = function ( PregameBanProtectSelections, event )
					if not event.interrupted then
						PregameBanProtectSelections:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
					PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
					PregameBanProtectSelections:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameBanProtectSelections, event )
					else
						PregameBanProtectSelections:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameBanProtectSelections:completeAnimation()
				self.PregameBanProtectSelections:setLeftRight( true, false, 66, 1212 )
				self.PregameBanProtectSelections:setTopBottom( true, false, 769, 919 )
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
				local VSBannerFrame2 = function ( VSBanner, event )
					if not event.interrupted then
						VSBanner:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSBanner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSBanner, event )
					else
						VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 1 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					if not event.interrupted then
						VSLabel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					VSLabel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSLabel, event )
					else
						VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 1 )
				VSLabelFrame2( VSLabel, {} )
				local PregameTitleFrame2 = function ( PregameTitle, event )
					if not event.interrupted then
						PregameTitle:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					PregameTitle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PregameTitle, event )
					else
						PregameTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTitle:completeAnimation()
				self.PregameTitle:setAlpha( 1 )
				PregameTitleFrame2( PregameTitle, {} )
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
				local Team1IconAndNameWidgetContainerFrame2 = function ( Team1IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team1IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team1IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1IconAndNameWidgetContainer, event )
					else
						Team1IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1IconAndNameWidgetContainer:completeAnimation()
				self.Team1IconAndNameWidgetContainer:setAlpha( 1 )
				Team1IconAndNameWidgetContainerFrame2( Team1IconAndNameWidgetContainer, {} )
				local Team2IconAndNameWidgetContainerFrame2 = function ( Team2IconAndNameWidgetContainer, event )
					if not event.interrupted then
						Team2IconAndNameWidgetContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Team2IconAndNameWidgetContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team2IconAndNameWidgetContainer, event )
					else
						Team2IconAndNameWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team2IconAndNameWidgetContainer:completeAnimation()
				self.Team2IconAndNameWidgetContainer:setAlpha( 1 )
				Team2IconAndNameWidgetContainerFrame2( Team2IconAndNameWidgetContainer, {} )
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
			stateName = "SpecialistDraft",
			condition = function ( menu, element, event )
				return CharacterDraftActive()
			end
		},
		{
			stateName = "CACEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive()
			end
		},
		{
			stateName = "StreakEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive()
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f133_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not f133_local0 then
			f133_local0 = self:dispatchEventToChildren( event )
		end
		return f133_local0
	end )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.FEButtonPanel0:close()
		element.PregameVsPanel0:close()
		element.PregameVsPanel:close()
		element.Team1ListSmall:close()
		element.Team1ListLarge:close()
		element.Team2ListSmall:close()
		element.Team2ListLarge:close()
		element.PregameBanProtectSelections:close()
		element.PregameMainTimer:close()
		element.VSBanner:close()
		element.PregameTitle:close()
		element.PreGameStates:close()
		element.Team1IconAndNameWidgetContainer:close()
		element.Team2IconAndNameWidgetContainer:close()
		element.MapImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

