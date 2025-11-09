require( "ui.uieditor.widgets.HUD.Killcam.KillcamHeader" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayersScreenScoreWidget" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnPnl" )
require( "ui.uieditor.widgets.HUD.Outcome.WinnerFactionInfo" )

local UpdateFactionInfo = function ( self, event )
	local winningTeam = event.data[4]
	if winningTeam == Enum.team_t.TEAM_BAD or HUD_IsFFA() then
		self.WinnerFactionInfo:close()
	end
end

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "show_outcome", UpdateFactionInfo )
end

local PreLoadFunc = function ( self, controller )
	Engine.UpdateTopPlayerUIModels( controller )
	local displayTop3PlayersModel = Engine.CreateModel( Engine.GetModelForController( controller ), "displayTop3Players" )
	local forceScoreboardModel = Engine.CreateModel( Engine.GetModelForController( controller ), "forceScoreboard" )
	Engine.SetModelValue( displayTop3PlayersModel, 0 )
	self:subscribeToModel( displayTop3PlayersModel, function ( model )
		if Engine.GetModelValue( model ) == 1 then
			self.KillcamHeader.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MENU_TOP_SCORERS_CAPS" ) )
			local numPlayersToShow = Engine.UpdateTopPlayerUIModels( controller )
			if numPlayersToShow < 3 then
				self.Player3ScoreWidget:close()
				if numPlayersToShow < 2 then
					self.Player2ScoreWidget:close()
				end
			end
			self:setAlpha( 1 )
		end
	end )
	self:subscribeToModel( forceScoreboardModel, function ( model )
		if Engine.GetModelValue( model ) == 1 then
			self:setAlpha( 0 )
		end
	end )
	local factionModel = Engine.GetModel( Engine.GetModelForController( controller ), "factions" )
	if not factionModel then
		Engine.CreateModel( Engine.GetModelForController( controller ), "factions" )
	end
	Engine.SetModelValue( Engine.CreateModel( factionModel, "winnersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "winnersFactionIcon" ), "" )
end

CoD.Top3PlayersScreenWidget = InheritFrom( LUI.UIElement )
CoD.Top3PlayersScreenWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Top3PlayersScreenWidget )
	self.id = "Top3PlayersScreenWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	local KillcamHeader = CoD.KillcamHeader.new( menu, controller )
	KillcamHeader:setLeftRight( true, false, 0, 1280 )
	KillcamHeader:setTopBottom( true, false, 0, 128 )
	KillcamHeader:setRGB( 1, 1, 1 )
	KillcamHeader:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				local f7_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
				if f7_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
						f7_local0 = AlwaysFalse()
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "FinalKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and AlwaysFalse()
			end
		},
		{
			stateName = "NemesisKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) and AlwaysFalse()
			end
		},
		{
			stateName = "RoundEndingKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and AlwaysFalse()
			end
		}
	} )
	if KillcamHeader.m_eventHandlers.hud_update_refresh then
		local currentEv = KillcamHeader.m_eventHandlers.hud_update_refresh
		KillcamHeader:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		KillcamHeader:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	self:addElement( KillcamHeader )
	self.KillcamHeader = KillcamHeader
	
	local currentEv = CoD.Top3PlayersScreenScoreWidget.new( menu, controller )
	currentEv:setLeftRight( true, false, 140.67, 415.67 )
	currentEv:setTopBottom( true, false, 543.65, 647.65 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv.PlayerCard.CardImage:setImage( RegisterImage( "uie_t7_icon_callingcard_temp4_lrg" ) )
	currentEv.PlayerCard.TeamColor:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	currentEv.PlayerCard.Rank:setText( Engine.Localize( "55" ) )
	currentEv.Score0:setText( Engine.Localize( "2140" ) )
	currentEv.RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon2" ) )
	currentEv.RibbonImage:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon2" ) )
	currentEv:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.PlayerCard.GamerTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	currentEv:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.PlayerCard.GamerTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	currentEv:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.PlayerCard.ClanTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	currentEv:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.PlayerCard.ClanTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	currentEv:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2Xuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.PlayerCard.HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	currentEv:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2RankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.PlayerCard.RankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	currentEv:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2Score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentEv )
	self.Player2ScoreWidget = currentEv
	
	local Player1ScoreWidget = CoD.Top3PlayersScreenScoreWidget.new( menu, controller )
	Player1ScoreWidget:setLeftRight( true, false, 502.5, 777.5 )
	Player1ScoreWidget:setTopBottom( true, false, 575.65, 674.65 )
	Player1ScoreWidget:setRGB( 1, 1, 1 )
	Player1ScoreWidget.PlayerCard.CardImage:setImage( RegisterImage( "uie_t7_icon_callingcard_temp3_lrg" ) )
	Player1ScoreWidget.PlayerCard.TeamColor:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	Player1ScoreWidget.PlayerCard.Rank:setText( Engine.Localize( "55" ) )
	Player1ScoreWidget.Score0:setText( Engine.Localize( "2140" ) )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player1ScoreWidget.PlayerCard.GamerTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player1ScoreWidget.PlayerCard.GamerTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player1ScoreWidget.PlayerCard.ClanTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player1ScoreWidget.PlayerCard.ClanTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1Xuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player1ScoreWidget.PlayerCard.HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1RankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player1ScoreWidget.PlayerCard.RankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1Score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player1ScoreWidget.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Player1ScoreWidget )
	self.Player1ScoreWidget = Player1ScoreWidget
	
	local Player3ScoreWidget = CoD.Top3PlayersScreenScoreWidget.new( menu, controller )
	Player3ScoreWidget:setLeftRight( false, true, -415.53, -140.53 )
	Player3ScoreWidget:setTopBottom( true, false, 543.65, 647.65 )
	Player3ScoreWidget:setRGB( 1, 1, 1 )
	Player3ScoreWidget.PlayerCard.TeamColor:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	Player3ScoreWidget.PlayerCard.Rank:setText( Engine.Localize( "55" ) )
	Player3ScoreWidget.Score0:setText( Engine.Localize( "2140" ) )
	Player3ScoreWidget.RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	Player3ScoreWidget.RibbonImage:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player3ScoreWidget.PlayerCard.GamerTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player3ScoreWidget.PlayerCard.GamerTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player3ScoreWidget.PlayerCard.ClanTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player3ScoreWidget.PlayerCard.ClanTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3Xuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player3ScoreWidget.PlayerCard.HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3RankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player3ScoreWidget.PlayerCard.RankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3Score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Player3ScoreWidget.Score.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Player3ScoreWidget )
	self.Player3ScoreWidget = Player3ScoreWidget
	
	local KillcamWidgetFctnPnl0 = CoD.KillcamWidgetFctnPnl.new( menu, controller )
	KillcamWidgetFctnPnl0:setLeftRight( true, false, 0, 400 )
	KillcamWidgetFctnPnl0:setTopBottom( true, false, 0, 200 )
	KillcamWidgetFctnPnl0:setRGB( 0.4, 0.4, 0.4 )
	self:addElement( KillcamWidgetFctnPnl0 )
	self.KillcamWidgetFctnPnl0 = KillcamWidgetFctnPnl0
	
	local WinnerFactionInfo = CoD.WinnerFactionInfo.new( menu, controller )
	WinnerFactionInfo:setLeftRight( true, false, 0, 390 )
	WinnerFactionInfo:setTopBottom( true, false, 0, 180 )
	WinnerFactionInfo:setRGB( 1, 1, 1 )
	WinnerFactionInfo.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( "MPUI_AXIS_SHORT_CAPS" ) )
	WinnerFactionInfo.KillcamWidgetTitleStatus0:setRGB( 0.95, 0.74, 0 )
	WinnerFactionInfo.KillcamWidgetTitleStatus0.SubTitle:setText( Engine.Localize( "MENU_WINNERS_CAPS" ) )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "Factions", "winnersFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinnerFactionInfo.WinningTeamFactionIcon0:setImage( RegisterImage( modelValue ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "Factions", "winnersFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinnerFactionInfo.WinningTeamFactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( WinnerFactionInfo )
	self.WinnerFactionInfo = WinnerFactionInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local KillcamHeaderFrame2 = function ( KillcamHeader, event )
					if not event.interrupted then
						KillcamHeader:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Linear )
					end
					KillcamHeader:setLeftRight( true, false, 0, 1280 )
					KillcamHeader:setTopBottom( true, false, 0, 128 )
					KillcamHeader:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( KillcamHeader, event )
					else
						KillcamHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamHeader:completeAnimation()
				self.KillcamHeader:setLeftRight( true, false, 0, 1280 )
				self.KillcamHeader:setTopBottom( true, false, -64, 64 )
				self.KillcamHeader:setAlpha( 0 )
				KillcamHeaderFrame2( KillcamHeader, {} )
				local Player2ScoreWidgetFrame2 = function ( Player2ScoreWidget, event )
					local Player2ScoreWidgetFrame3 = function ( Player2ScoreWidget, event )
						if not event.interrupted then
							Player2ScoreWidget:beginAnimation( "keyframe", 499, false, true, CoD.TweenType.Linear )
						end
						Player2ScoreWidget:setLeftRight( true, false, 140.67, 415.67 )
						Player2ScoreWidget:setTopBottom( true, false, 543.65, 647.65 )
						Player2ScoreWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Player2ScoreWidget, event )
						else
							Player2ScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Player2ScoreWidgetFrame3( Player2ScoreWidget, event )
						return 
					else
						Player2ScoreWidget:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						Player2ScoreWidget:registerEventHandler( "transition_complete_keyframe", Player2ScoreWidgetFrame3 )
					end
				end
				
				currentEv:completeAnimation()
				self.Player2ScoreWidget:setLeftRight( true, false, 140.67, 415.67 )
				self.Player2ScoreWidget:setTopBottom( true, false, 508.65, 612.65 )
				self.Player2ScoreWidget:setAlpha( 0 )
				Player2ScoreWidgetFrame2( currentEv, {} )
				local Player1ScoreWidgetFrame2 = function ( Player1ScoreWidget, event )
					if not event.interrupted then
						Player1ScoreWidget:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					Player1ScoreWidget:setLeftRight( true, false, 502.5, 777.5 )
					Player1ScoreWidget:setTopBottom( true, false, 575.65, 674.65 )
					Player1ScoreWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Player1ScoreWidget, event )
					else
						Player1ScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Player1ScoreWidget:completeAnimation()
				self.Player1ScoreWidget:setLeftRight( true, false, 502.5, 777.5 )
				self.Player1ScoreWidget:setTopBottom( true, false, 540.65, 639.65 )
				self.Player1ScoreWidget:setAlpha( 0 )
				Player1ScoreWidgetFrame2( Player1ScoreWidget, {} )
				local Player3ScoreWidgetFrame2 = function ( Player3ScoreWidget, event )
					local Player3ScoreWidgetFrame3 = function ( Player3ScoreWidget, event )
						if not event.interrupted then
							Player3ScoreWidget:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
						end
						Player3ScoreWidget:setLeftRight( false, true, -415.53, -140.53 )
						Player3ScoreWidget:setTopBottom( true, false, 543.65, 647.65 )
						Player3ScoreWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Player3ScoreWidget, event )
						else
							Player3ScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Player3ScoreWidgetFrame3( Player3ScoreWidget, event )
						return 
					else
						Player3ScoreWidget:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						Player3ScoreWidget:registerEventHandler( "transition_complete_keyframe", Player3ScoreWidgetFrame3 )
					end
				end
				
				Player3ScoreWidget:completeAnimation()
				self.Player3ScoreWidget:setLeftRight( false, true, -415.53, -140.53 )
				self.Player3ScoreWidget:setTopBottom( true, false, 508.65, 612.65 )
				self.Player3ScoreWidget:setAlpha( 0 )
				Player3ScoreWidgetFrame2( Player3ScoreWidget, {} )
				local KillcamWidgetFctnPnl0Frame2 = function ( KillcamWidgetFctnPnl0, event )
					if not event.interrupted then
						KillcamWidgetFctnPnl0:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
					end
					KillcamWidgetFctnPnl0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( KillcamWidgetFctnPnl0, event )
					else
						KillcamWidgetFctnPnl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamWidgetFctnPnl0:completeAnimation()
				self.KillcamWidgetFctnPnl0:setAlpha( 0 )
				KillcamWidgetFctnPnl0Frame2( KillcamWidgetFctnPnl0, {} )
				local WinnerFactionInfoFrame2 = function ( WinnerFactionInfo, event )
					local WinnerFactionInfoFrame3 = function ( WinnerFactionInfo, event )
						if not event.interrupted then
							WinnerFactionInfo:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
						end
						WinnerFactionInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinnerFactionInfo, event )
						else
							WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinnerFactionInfoFrame3( WinnerFactionInfo, event )
						return 
					else
						WinnerFactionInfo:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame3 )
					end
				end
				
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 0 )
				WinnerFactionInfoFrame2( WinnerFactionInfo, {} )
			end
		}
	}
	self.close = function ( self )
		self.KillcamHeader:close()
		self.Player2ScoreWidget:close()
		self.Player1ScoreWidget:close()
		self.Player3ScoreWidget:close()
		self.KillcamWidgetFctnPnl0:close()
		self.WinnerFactionInfo:close()
		CoD.Top3PlayersScreenWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

