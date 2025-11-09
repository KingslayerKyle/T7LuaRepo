require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetPnlRT" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.EndGameFlow.FFATopPlayerInfo" )
require( "ui.uieditor.widgets.EndGameFlow.FFARunnerUpPlayerInfo" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTitleStatus" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTeamNameR" )
require( "ui.uieditor.widgets.EndGameFlow.OutcomeFactionIcon" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.HUD.Outcome.WinnerFactionInfo" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTitle" )
require( "ui.uieditor.widgets.HUD.Outcome.MatchBonusWidget" )

local UpdateVisibility = function ( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
		self:setAlpha( 0 )
	else
		self:setAlpha( 1 )
	end
end

local SetWinningAndLosingTeamInfo = function ( self, controller, winningTeam )
	local alliesInfo = {}
	local axisInfo = {}
	local winningTeamInfo, losingTeamInfo = nil
	local gameScoreModel = Engine.GetModel( Engine.GetModelForController( controller ), "gameScore" )
	local winningTeamScoreModel = Engine.CreateModel( gameScoreModel, "winningTeamScore" )
	local losingTeamScoreModel = Engine.CreateModel( gameScoreModel, "losingTeamScore" )
	local f2_local0 = winningTeam == Enum.team_t.TEAM_BAD
	local factionModel = Engine.GetModel( Engine.GetModelForController( controller ), "factions" )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "draw" ), f2_local0 )
	local alliesScoreModel = Engine.GetModel( gameScoreModel, "alliesScore" )
	alliesInfo.score = Engine.GetModelValue( alliesScoreModel )
	alliesInfo.displayName = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES )
	alliesInfo.factionIcon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES )
	local axisScoreModel = Engine.GetModel( gameScoreModel, "axisScore" )
	axisInfo.score = Engine.GetModelValue( axisScoreModel )
	axisInfo.displayName = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS )
	axisInfo.factionIcon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS )
	if winningTeam == Enum.team_t.TEAM_ALLIES or f2_local0 then
		winningTeamInfo = alliesInfo
		losingTeamInfo = axisInfo
		self:subscribeToModel( alliesScoreModel, function ( model )
			Engine.SetModelValue( winningTeamScoreModel, Engine.GetModelValue( model ) )
		end )
		self:subscribeToModel( axisScoreModel, function ( model )
			Engine.SetModelValue( losingTeamScoreModel, Engine.GetModelValue( model ) )
		end )
	else
		winningTeamInfo = axisInfo
		losingTeamInfo = alliesInfo
		self:subscribeToModel( axisScoreModel, function ( model )
			Engine.SetModelValue( winningTeamScoreModel, Engine.GetModelValue( model ) )
		end )
		self:subscribeToModel( alliesScoreModel, function ( model )
			Engine.SetModelValue( losingTeamScoreModel, Engine.GetModelValue( model ) )
		end )
	end
	Engine.SetModelValue( winningTeamScoreModel, winningTeamInfo.score )
	Engine.SetModelValue( losingTeamScoreModel, losingTeamInfo.score )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "winnersFactionDisplayName" ), winningTeamInfo.displayName )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "winnersFactionIcon" ), winningTeamInfo.factionIcon )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "losersFactionDisplayName" ), losingTeamInfo.displayName )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "losersFactionIcon" ), losingTeamInfo.factionIcon )
end

local ShowOutcome = function ( self, event )
	local controller = event.controller
	Engine.UpdateTopPlayerUIModels( controller )
	local title = event.data[1]
	local subTitle = event.data[2]
	local matchBonus = event.data[3]
	local winningTeam = event.data[4]
	if event.data[5] ~= 1 and event.data[5] ~= true then
		local f7_local0 = false
	else
		local isRoundEnd = true
	end
	local gameScoreModel = Engine.GetModel( Engine.GetModelForController( controller ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats.outcome", true ), Engine.Localize( Engine.GetIString( title, "CS_LOCALIZED_STRINGS" ) ) )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "isRoundEnd" ), f7_local0 )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "matchBonus" ), matchBonus )
	self.TitleNew:setAlpha( 0 )
	self.SubTitleNew:setAlpha( 0 )
	self.TitleNew.KillcamText0:setText( Engine.Localize( Engine.GetIString( title, "CS_LOCALIZED_STRINGS" ) ) )
	self.SubTitleNew.MatchText:setText( Engine.Localize( Engine.GetIString( subTitle, "CS_LOCALIZED_STRINGS" ) ) )
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	if teamCount == 2 then
		SetWinningAndLosingTeamInfo( self, controller, winningTeam )
		self:playClip( "Show_Two_Team" )
	elseif teamCount == 1 then
		local numClients = event.data[4]
		if numClients < 3 then
			if numClients < 2 then
				self.FFAFirstRunnerUpPlayerInfo:close()
			end
			self.FFASecondRunnerUpPlayerInfo:close()
		end
		self:playClip( "ShowFFAOutcome" )
	end
end

local PlayPreKillcamTransition = function ( self, event )
	self:playClip( "End_Transition" )
end

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "hud_update_refresh", UpdateVisibility )
	local UpdateVisibility_Internal = function ( model )
		UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Internal )
	self:registerEventHandler( "show_outcome", ShowOutcome )
	self:registerEventHandler( "pre_killcam_transition", PlayPreKillcamTransition )
	self:setState( "DefaultState" )
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	if teamCount == 1 then
		self.WinnerFactionInfo:close()
	end
end

local InitializeOutcomeUIModels = function ( controller )
	local gameScoreModel = Engine.CreateModel( Engine.GetModelForController( controller ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "draw" ), false )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "isRoundEnd" ), false )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "matchBonus" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "winningTeamScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "losingTeamScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "alliesScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "axisScore" ), 0 )
	local factionModel = Engine.GetModel( Engine.GetModelForController( controller ), "factions" )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "winnersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "winnersFactionIcon" ), "" )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "losersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( factionModel, "losersFactionIcon" ), "" )
end

local PreLoadFunc = function ( self, controller )
	Engine.UpdateTopPlayerUIModels( controller )
	local displayTop3PlayersModel = Engine.CreateModel( Engine.GetModelForController( controller ), "displayTop3Players" )
	Engine.SetModelValue( displayTop3PlayersModel, 0 )
	self:subscribeToModel( displayTop3PlayersModel, function ( model )
		if Engine.GetModelValue( model ) == 1 then
			self:close()
		end
	end )
	InitializeOutcomeUIModels( controller )
end

CoD.Outcome = InheritFrom( LUI.UIElement )
CoD.Outcome.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Outcome )
	self.id = "Outcome"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local LeftPanelR = CoD.KillcamWidgetPnlRT.new( menu, controller )
	LeftPanelR:setLeftRight( true, false, 640, 1315 )
	LeftPanelR:setTopBottom( true, false, 323, 403 )
	LeftPanelR:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelR:setAlpha( 0 )
	LeftPanelR:setYRot( 180 )
	self:addElement( LeftPanelR )
	self.LeftPanelR = LeftPanelR
	
	local LeftPanelL = CoD.KillcamWidgetPnlRT.new( menu, controller )
	LeftPanelL:setLeftRight( true, false, -35, 640 )
	LeftPanelL:setTopBottom( true, false, 323, 403 )
	LeftPanelL:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelL:setAlpha( 0 )
	self:addElement( LeftPanelL )
	self.LeftPanelL = LeftPanelL
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, 0, 720 )
	VignetteBack:setRGB( 0, 0, 0 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local FFATopPlayerInfo = CoD.FFATopPlayerInfo.new( menu, controller )
	FFATopPlayerInfo:setLeftRight( true, false, 338.71, 1030.29 )
	FFATopPlayerInfo:setTopBottom( true, false, 166, 308.5 )
	FFATopPlayerInfo:setRGB( 1, 1, 1 )
	FFATopPlayerInfo:setAlpha( 0 )
	FFATopPlayerInfo.Score0:setText( Engine.Localize( "30" ) )
	FFATopPlayerInfo.Score.Numbers:setText( Engine.Localize( "XX" ) )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFATopPlayerInfo.Gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player1ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFATopPlayerInfo.ClanTag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FFATopPlayerInfo )
	self.FFATopPlayerInfo = FFATopPlayerInfo
	
	local FFAFirstRunnerUpPlayerInfo = CoD.FFARunnerUpPlayerInfo.new( menu, controller )
	FFAFirstRunnerUpPlayerInfo:setLeftRight( true, false, 370.5, 956.5 )
	FFAFirstRunnerUpPlayerInfo:setTopBottom( true, false, 323.6, 417.6 )
	FFAFirstRunnerUpPlayerInfo:setRGB( 1, 1, 1 )
	FFAFirstRunnerUpPlayerInfo:setAlpha( 0 )
	FFAFirstRunnerUpPlayerInfo.Score0:setText( Engine.Localize( "30" ) )
	FFAFirstRunnerUpPlayerInfo.Score.Numbers:setText( Engine.Localize( "XX" ) )
	FFAFirstRunnerUpPlayerInfo.RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon2" ) )
	FFAFirstRunnerUpPlayerInfo.Ribbon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon2" ) )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2Xuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFAFirstRunnerUpPlayerInfo.Emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFAFirstRunnerUpPlayerInfo.Gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player2ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFAFirstRunnerUpPlayerInfo.ClanTag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FFAFirstRunnerUpPlayerInfo )
	self.FFAFirstRunnerUpPlayerInfo = FFAFirstRunnerUpPlayerInfo
	
	local FFASecondRunnerUpPlayerInfo = CoD.FFARunnerUpPlayerInfo.new( menu, controller )
	FFASecondRunnerUpPlayerInfo:setLeftRight( true, false, 370.5, 956.5 )
	FFASecondRunnerUpPlayerInfo:setTopBottom( true, false, 425, 519 )
	FFASecondRunnerUpPlayerInfo:setRGB( 1, 1, 1 )
	FFASecondRunnerUpPlayerInfo:setAlpha( 0 )
	FFASecondRunnerUpPlayerInfo.Score0:setText( Engine.Localize( "30" ) )
	FFASecondRunnerUpPlayerInfo.Score.Numbers:setText( Engine.Localize( "XX" ) )
	FFASecondRunnerUpPlayerInfo.RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	FFASecondRunnerUpPlayerInfo.Ribbon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3Xuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFASecondRunnerUpPlayerInfo.Emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3Name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFASecondRunnerUpPlayerInfo.Gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData", "player3ClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FFASecondRunnerUpPlayerInfo.ClanTag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FFASecondRunnerUpPlayerInfo )
	self.FFASecondRunnerUpPlayerInfo = FFASecondRunnerUpPlayerInfo
	
	local WinningTeamScoreNew = CoD.KillcamWidgetNumbers.new( menu, controller )
	WinningTeamScoreNew:setLeftRight( false, false, -130.78, -10.78 )
	WinningTeamScoreNew:setTopBottom( false, false, -21, 33 )
	WinningTeamScoreNew:setRGB( 1, 1, 1 )
	WinningTeamScoreNew:setAlpha( 0 )
	WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	WinningTeamScoreNew:setShaderVector( 0, 0.2, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	WinningTeamScoreNew.Numbers:setRGB( 0.59, 0.64, 0.74 )
	WinningTeamScoreNew:subscribeToGlobalModel( controller, "GameScore", "winningTeamScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinningTeamScoreNew.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WinningTeamScoreNew )
	self.WinningTeamScoreNew = WinningTeamScoreNew
	
	local LosingTeamScoreNew = CoD.KillcamWidgetNumbers.new( menu, controller )
	LosingTeamScoreNew:setLeftRight( false, false, 12.22, 132.22 )
	LosingTeamScoreNew:setTopBottom( false, false, -21, 33 )
	LosingTeamScoreNew:setRGB( 1, 1, 1 )
	LosingTeamScoreNew:setAlpha( 0 )
	LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	LosingTeamScoreNew:setShaderVector( 0, 0.2, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	LosingTeamScoreNew.Numbers:setRGB( 0.59, 0.64, 0.74 )
	LosingTeamScoreNew:subscribeToGlobalModel( controller, "GameScore", "losingTeamScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LosingTeamScoreNew.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LosingTeamScoreNew )
	self.LosingTeamScoreNew = LosingTeamScoreNew
	
	local WinningTeamFactionNameNew = CoD.WeaponNameWidget.new( menu, controller )
	WinningTeamFactionNameNew:setLeftRight( false, true, -957, -739 )
	WinningTeamFactionNameNew:setTopBottom( true, false, 347, 381 )
	WinningTeamFactionNameNew:setRGB( 1, 1, 1 )
	WinningTeamFactionNameNew:setAlpha( 0 )
	WinningTeamFactionNameNew:subscribeToGlobalModel( controller, "Factions", "winnersFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinningTeamFactionNameNew.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WinningTeamFactionNameNew )
	self.WinningTeamFactionNameNew = WinningTeamFactionNameNew
	
	local WinnersLabelNew = CoD.KillcamWidgetTitleStatus.new( menu, controller )
	WinnersLabelNew:setLeftRight( true, false, 323, 411 )
	WinnersLabelNew:setTopBottom( true, false, 320.57, 345.57 )
	WinnersLabelNew:setRGB( 0.95, 0.74, 0 )
	WinnersLabelNew:setAlpha( 0 )
	WinnersLabelNew.SubTitle:setRGB( 1, 1, 1 )
	WinnersLabelNew.SubTitle:setText( Engine.Localize( "MENU_WINNERS_CAPS" ) )
	self:addElement( WinnersLabelNew )
	self.WinnersLabelNew = WinnersLabelNew
	
	local LosingTeamFactionNameNew = CoD.KillcamWidgetTeamNameR.new( menu, controller )
	LosingTeamFactionNameNew:setLeftRight( false, true, -541, -323 )
	LosingTeamFactionNameNew:setTopBottom( true, false, 347, 381 )
	LosingTeamFactionNameNew:setRGB( 1, 1, 1 )
	LosingTeamFactionNameNew:setAlpha( 0 )
	LosingTeamFactionNameNew:subscribeToGlobalModel( controller, "Factions", "losersFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LosingTeamFactionNameNew.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LosingTeamFactionNameNew )
	self.LosingTeamFactionNameNew = LosingTeamFactionNameNew
	
	local WinningTeamFactionIconNew = CoD.OutcomeFactionIcon.new( menu, controller )
	WinningTeamFactionIconNew:setLeftRight( true, false, 169, 559 )
	WinningTeamFactionIconNew:setTopBottom( true, false, 284, 464 )
	WinningTeamFactionIconNew:setRGB( 1, 1, 1 )
	WinningTeamFactionIconNew:setAlpha( 0 )
	WinningTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "winnersFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinningTeamFactionIconNew.WinningTeamFactionIcon0:setImage( RegisterImage( modelValue ) )
		end
	end )
	WinningTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "winnersFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinningTeamFactionIconNew.WinningTeamFactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( WinningTeamFactionIconNew )
	self.WinningTeamFactionIconNew = WinningTeamFactionIconNew
	
	local LosingTeamFactionIconNew = CoD.OutcomeFactionIcon.new( menu, controller )
	LosingTeamFactionIconNew:setLeftRight( false, true, -559, -169 )
	LosingTeamFactionIconNew:setTopBottom( true, false, 284, 464 )
	LosingTeamFactionIconNew:setRGB( 1, 1, 1 )
	LosingTeamFactionIconNew:setAlpha( 0 )
	LosingTeamFactionIconNew:setYRot( 180 )
	LosingTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "losersFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LosingTeamFactionIconNew.WinningTeamFactionIcon0:setImage( RegisterImage( modelValue ) )
		end
	end )
	LosingTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "losersFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LosingTeamFactionIconNew.WinningTeamFactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LosingTeamFactionIconNew )
	self.LosingTeamFactionIconNew = LosingTeamFactionIconNew
	
	local SubTitleNew = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	SubTitleNew:setLeftRight( false, false, -142, 142 )
	SubTitleNew:setTopBottom( true, false, 99.29, 131.5 )
	SubTitleNew:setRGB( 1, 1, 1 )
	SubTitleNew:setAlpha( 0 )
	SubTitleNew.FEButtonPanel0:setRGB( 0, 0, 0 )
	SubTitleNew.FEButtonPanel0:setAlpha( 0.3 )
	SubTitleNew.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	SubTitleNew.Glow:setRGB( 0.3, 0.23, 0.2 )
	SubTitleNew.MatchText:setRGB( 0.96, 0.96, 1 )
	SubTitleNew.MatchText:setText( Engine.Localize( "MP_SCORE_LIMIT_REACHED" ) )
	SubTitleNew.MatchText:setTTF( "fonts/Entovo.ttf" )
	self:addElement( SubTitleNew )
	self.SubTitleNew = SubTitleNew
	
	local VSBanner = CoD.FE_ListHeaderGlow.new( menu, controller )
	VSBanner:setLeftRight( true, false, 619.5, 660.5 )
	VSBanner:setTopBottom( true, false, 350, 378 )
	VSBanner:setRGB( 1, 1, 1 )
	VSBanner:setAlpha( 0 )
	self:addElement( VSBanner )
	self.VSBanner = VSBanner
	
	local VSLabel = LUI.UITightText.new()
	VSLabel:setLeftRight( false, false, -15.5, 15.5 )
	VSLabel:setTopBottom( true, false, 354, 379 )
	VSLabel:setRGB( 0, 0, 0 )
	VSLabel:setAlpha( 0 )
	VSLabel:setText( Engine.Localize( "MP_VERSUS" ) )
	VSLabel:setTTF( "fonts/Entovo.ttf" )
	VSLabel:setLetterSpacing( 2 )
	self:addElement( VSLabel )
	self.VSLabel = VSLabel
	
	local TransitionImageBottom = LUI.UIImage.new()
	TransitionImageBottom:setLeftRight( true, true, 0, 0 )
	TransitionImageBottom:setTopBottom( true, false, 417.6, 777.6 )
	TransitionImageBottom:setRGB( 0, 0, 0 )
	TransitionImageBottom:setAlpha( 0 )
	TransitionImageBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TransitionImageBottom )
	self.TransitionImageBottom = TransitionImageBottom
	
	local TransitionImageTop = LUI.UIImage.new()
	TransitionImageTop:setLeftRight( true, true, 0, 0 )
	TransitionImageTop:setTopBottom( true, false, -57.6, 302.4 )
	TransitionImageTop:setRGB( 0, 0, 0 )
	TransitionImageTop:setAlpha( 0 )
	TransitionImageTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TransitionImageTop )
	self.TransitionImageTop = TransitionImageTop
	
	local WinnerFactionInfo = CoD.WinnerFactionInfo.new( menu, controller )
	WinnerFactionInfo:setLeftRight( true, false, 24, 414 )
	WinnerFactionInfo:setTopBottom( true, false, 2.5, 182.5 )
	WinnerFactionInfo:setRGB( 1, 1, 1 )
	WinnerFactionInfo:setAlpha( 0 )
	WinnerFactionInfo.KillcamWidgetTitleStatus0:setRGB( 0.95, 0.74, 0 )
	WinnerFactionInfo.KillcamWidgetTitleStatus0.SubTitle:setText( Engine.Localize( "MENU_WINNERS_CAPS" ) )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "Factions", "winnersFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinnerFactionInfo.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
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
	
	local TitleNew = CoD.KillcamWidgetTitle.new( menu, controller )
	TitleNew:setLeftRight( false, false, -250, 250 )
	TitleNew:setTopBottom( true, false, 40, 92.5 )
	TitleNew:setRGB( 1, 1, 1 )
	TitleNew:setAlpha( 0 )
	TitleNew.FEButtonPanel0:setAlpha( 0.4 )
	TitleNew.KillcamText0:setText( Engine.Localize( "VICTORY" ) )
	self:addElement( TitleNew )
	self.TitleNew = TitleNew
	
	local MatchBonusWidget0 = CoD.MatchBonusWidget.new( menu, controller )
	MatchBonusWidget0:setLeftRight( false, false, -142, 142 )
	MatchBonusWidget0:setTopBottom( false, true, -164.5, -36 )
	MatchBonusWidget0:setRGB( 1, 1, 1 )
	MatchBonusWidget0:setAlpha( 0 )
	self:addElement( MatchBonusWidget0 )
	self.MatchBonusWidget0 = MatchBonusWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setAlpha( 0 )
				self.clipFinished( LeftPanelR, {} )
				LeftPanelL:completeAnimation()
				self.LeftPanelL:setAlpha( 0 )
				self.clipFinished( LeftPanelL, {} )
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 0, 0, 0 )
				self.clipFinished( VignetteBack, {} )
				FFATopPlayerInfo:completeAnimation()
				self.FFATopPlayerInfo:setAlpha( 0 )
				self.clipFinished( FFATopPlayerInfo, {} )
				FFAFirstRunnerUpPlayerInfo:completeAnimation()
				self.FFAFirstRunnerUpPlayerInfo:setAlpha( 0 )
				self.clipFinished( FFAFirstRunnerUpPlayerInfo, {} )
				FFASecondRunnerUpPlayerInfo:completeAnimation()
				self.FFASecondRunnerUpPlayerInfo:setAlpha( 0 )
				self.clipFinished( FFASecondRunnerUpPlayerInfo, {} )
				WinningTeamScoreNew:completeAnimation()
				self.WinningTeamScoreNew:setAlpha( 0 )
				self.clipFinished( WinningTeamScoreNew, {} )
				LosingTeamScoreNew:completeAnimation()
				self.LosingTeamScoreNew:setAlpha( 0 )
				self.clipFinished( LosingTeamScoreNew, {} )
				WinningTeamFactionNameNew:completeAnimation()
				self.WinningTeamFactionNameNew:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionNameNew, {} )
				WinnersLabelNew:completeAnimation()
				self.WinnersLabelNew:setAlpha( 0 )
				self.clipFinished( WinnersLabelNew, {} )
				LosingTeamFactionNameNew:completeAnimation()
				self.LosingTeamFactionNameNew:setAlpha( 0 )
				self.clipFinished( LosingTeamFactionNameNew, {} )
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIconNew, {} )
				LosingTeamFactionIconNew:completeAnimation()
				self.LosingTeamFactionIconNew:setAlpha( 0 )
				self.clipFinished( LosingTeamFactionIconNew, {} )
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 0 )
				self.clipFinished( SubTitleNew, {} )
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 0 )
				self.clipFinished( VSBanner, {} )
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 0 )
				self.clipFinished( VSLabel, {} )
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 0 )
				self.clipFinished( TitleNew, {} )
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 0 )
				self.clipFinished( MatchBonusWidget0, {} )
			end,
			Show_Two_Team = function ()
				self:setupElementClipCounter( 17 )
				local LeftPanelRFrame2 = function ( LeftPanelR, event )
					if not event.interrupted then
						LeftPanelR:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					LeftPanelR:setLeftRight( true, false, 640, 1315 )
					LeftPanelR:setTopBottom( true, false, 323, 403 )
					LeftPanelR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelR, event )
					else
						LeftPanelR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setLeftRight( true, false, 810, 1485 )
				self.LeftPanelR:setTopBottom( true, false, 323, 403 )
				self.LeftPanelR:setAlpha( 0 )
				LeftPanelRFrame2( LeftPanelR, {} )
				local LeftPanelLFrame2 = function ( LeftPanelL, event )
					if not event.interrupted then
						LeftPanelL:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					LeftPanelL:setLeftRight( true, false, -35, 640 )
					LeftPanelL:setTopBottom( true, false, 323, 403 )
					LeftPanelL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelL, event )
					else
						LeftPanelL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelL:completeAnimation()
				self.LeftPanelL:setLeftRight( true, false, -245, 430 )
				self.LeftPanelL:setTopBottom( true, false, 323, 403 )
				self.LeftPanelL:setAlpha( 0 )
				LeftPanelLFrame2( LeftPanelL, {} )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 0, 0, 0 )
				VignetteBackFrame2( VignetteBack, {} )
				FFATopPlayerInfo:completeAnimation()
				self.FFATopPlayerInfo:setAlpha( 0 )
				self.clipFinished( FFATopPlayerInfo, {} )
				local WinningTeamScoreNewFrame2 = function ( WinningTeamScoreNew, event )
					local WinningTeamScoreNewFrame3 = function ( WinningTeamScoreNew, event )
						if not event.interrupted then
							WinningTeamScoreNew:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamScoreNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinningTeamScoreNew, event )
						else
							WinningTeamScoreNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinningTeamScoreNewFrame3( WinningTeamScoreNew, event )
						return 
					else
						WinningTeamScoreNew:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						WinningTeamScoreNew:registerEventHandler( "transition_complete_keyframe", WinningTeamScoreNewFrame3 )
					end
				end
				
				WinningTeamScoreNew:completeAnimation()
				self.WinningTeamScoreNew:setAlpha( 0 )
				WinningTeamScoreNewFrame2( WinningTeamScoreNew, {} )
				local LosingTeamScoreNewFrame2 = function ( LosingTeamScoreNew, event )
					local LosingTeamScoreNewFrame3 = function ( LosingTeamScoreNew, event )
						if not event.interrupted then
							LosingTeamScoreNew:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						LosingTeamScoreNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LosingTeamScoreNew, event )
						else
							LosingTeamScoreNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LosingTeamScoreNewFrame3( LosingTeamScoreNew, event )
						return 
					else
						LosingTeamScoreNew:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
						LosingTeamScoreNew:registerEventHandler( "transition_complete_keyframe", LosingTeamScoreNewFrame3 )
					end
				end
				
				LosingTeamScoreNew:completeAnimation()
				self.LosingTeamScoreNew:setAlpha( 0 )
				LosingTeamScoreNewFrame2( LosingTeamScoreNew, {} )
				local WinningTeamFactionNameNewFrame2 = function ( WinningTeamFactionNameNew, event )
					local WinningTeamFactionNameNewFrame3 = function ( WinningTeamFactionNameNew, event )
						if not event.interrupted then
							WinningTeamFactionNameNew:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamFactionNameNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinningTeamFactionNameNew, event )
						else
							WinningTeamFactionNameNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinningTeamFactionNameNewFrame3( WinningTeamFactionNameNew, event )
						return 
					else
						WinningTeamFactionNameNew:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						WinningTeamFactionNameNew:registerEventHandler( "transition_complete_keyframe", WinningTeamFactionNameNewFrame3 )
					end
				end
				
				WinningTeamFactionNameNew:completeAnimation()
				self.WinningTeamFactionNameNew:setAlpha( 0 )
				WinningTeamFactionNameNewFrame2( WinningTeamFactionNameNew, {} )
				local WinnersLabelNewFrame2 = function ( WinnersLabelNew, event )
					local WinnersLabelNewFrame3 = function ( WinnersLabelNew, event )
						if not event.interrupted then
							WinnersLabelNew:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						WinnersLabelNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinnersLabelNew, event )
						else
							WinnersLabelNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinnersLabelNewFrame3( WinnersLabelNew, event )
						return 
					else
						WinnersLabelNew:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						WinnersLabelNew:registerEventHandler( "transition_complete_keyframe", WinnersLabelNewFrame3 )
					end
				end
				
				WinnersLabelNew:completeAnimation()
				self.WinnersLabelNew:setAlpha( 0 )
				WinnersLabelNewFrame2( WinnersLabelNew, {} )
				local LosingTeamFactionNameNewFrame2 = function ( LosingTeamFactionNameNew, event )
					local LosingTeamFactionNameNewFrame3 = function ( LosingTeamFactionNameNew, event )
						if not event.interrupted then
							LosingTeamFactionNameNew:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						LosingTeamFactionNameNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LosingTeamFactionNameNew, event )
						else
							LosingTeamFactionNameNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LosingTeamFactionNameNewFrame3( LosingTeamFactionNameNew, event )
						return 
					else
						LosingTeamFactionNameNew:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						LosingTeamFactionNameNew:registerEventHandler( "transition_complete_keyframe", LosingTeamFactionNameNewFrame3 )
					end
				end
				
				LosingTeamFactionNameNew:completeAnimation()
				self.LosingTeamFactionNameNew:setAlpha( 0 )
				LosingTeamFactionNameNewFrame2( LosingTeamFactionNameNew, {} )
				local WinningTeamFactionIconNewFrame2 = function ( WinningTeamFactionIconNew, event )
					local WinningTeamFactionIconNewFrame3 = function ( WinningTeamFactionIconNew, event )
						if not event.interrupted then
							WinningTeamFactionIconNew:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamFactionIconNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinningTeamFactionIconNew, event )
						else
							WinningTeamFactionIconNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinningTeamFactionIconNewFrame3( WinningTeamFactionIconNew, event )
						return 
					else
						WinningTeamFactionIconNew:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						WinningTeamFactionIconNew:registerEventHandler( "transition_complete_keyframe", WinningTeamFactionIconNewFrame3 )
					end
				end
				
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 0 )
				WinningTeamFactionIconNewFrame2( WinningTeamFactionIconNew, {} )
				local LosingTeamFactionIconNewFrame2 = function ( LosingTeamFactionIconNew, event )
					local LosingTeamFactionIconNewFrame3 = function ( LosingTeamFactionIconNew, event )
						if not event.interrupted then
							LosingTeamFactionIconNew:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						LosingTeamFactionIconNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LosingTeamFactionIconNew, event )
						else
							LosingTeamFactionIconNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LosingTeamFactionIconNewFrame3( LosingTeamFactionIconNew, event )
						return 
					else
						LosingTeamFactionIconNew:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						LosingTeamFactionIconNew:registerEventHandler( "transition_complete_keyframe", LosingTeamFactionIconNewFrame3 )
					end
				end
				
				LosingTeamFactionIconNew:completeAnimation()
				self.LosingTeamFactionIconNew:setAlpha( 0 )
				LosingTeamFactionIconNewFrame2( LosingTeamFactionIconNew, {} )
				local SubTitleNewFrame2 = function ( SubTitleNew, event )
					local SubTitleNewFrame3 = function ( SubTitleNew, event )
						if not event.interrupted then
							SubTitleNew:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						SubTitleNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SubTitleNew, event )
						else
							SubTitleNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SubTitleNewFrame3( SubTitleNew, event )
						return 
					else
						SubTitleNew:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						SubTitleNew:registerEventHandler( "transition_complete_keyframe", SubTitleNewFrame3 )
					end
				end
				
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 0 )
				SubTitleNewFrame2( SubTitleNew, {} )
				local VSBannerFrame2 = function ( VSBanner, event )
					local VSBannerFrame3 = function ( VSBanner, event )
						if not event.interrupted then
							VSBanner:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Bounce )
						end
						VSBanner:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VSBanner, event )
						else
							VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSBannerFrame3( VSBanner, event )
						return 
					else
						VSBanner:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						VSBanner:registerEventHandler( "transition_complete_keyframe", VSBannerFrame3 )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 0 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					local VSLabelFrame3 = function ( VSLabel, event )
						if not event.interrupted then
							VSLabel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
						end
						VSLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VSLabel, event )
						else
							VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSLabelFrame3( VSLabel, event )
						return 
					else
						VSLabel:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						VSLabel:registerEventHandler( "transition_complete_keyframe", VSLabelFrame3 )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 0 )
				VSLabelFrame2( VSLabel, {} )
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )
				local TitleNewFrame2 = function ( TitleNew, event )
					local TitleNewFrame3 = function ( TitleNew, event )
						if not event.interrupted then
							TitleNew:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
						end
						TitleNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TitleNew, event )
						else
							TitleNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TitleNewFrame3( TitleNew, event )
						return 
					else
						TitleNew:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						TitleNew:registerEventHandler( "transition_complete_keyframe", TitleNewFrame3 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 0 )
				TitleNewFrame2( TitleNew, {} )
				local MatchBonusWidget0Frame2 = function ( MatchBonusWidget0, event )
					local MatchBonusWidget0Frame3 = function ( MatchBonusWidget0, event )
						if not event.interrupted then
							MatchBonusWidget0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						end
						MatchBonusWidget0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MatchBonusWidget0, event )
						else
							MatchBonusWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MatchBonusWidget0Frame3( MatchBonusWidget0, event )
						return 
					else
						MatchBonusWidget0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						MatchBonusWidget0:registerEventHandler( "transition_complete_keyframe", MatchBonusWidget0Frame3 )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 0 )
				MatchBonusWidget0Frame2( MatchBonusWidget0, {} )
			end,
			End_Transition = function ()
				self:setupElementClipCounter( 21 )
				local LeftPanelRFrame2 = function ( LeftPanelR, event )
					if not event.interrupted then
						LeftPanelR:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					LeftPanelR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LeftPanelR, event )
					else
						LeftPanelR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setAlpha( 1 )
				LeftPanelRFrame2( LeftPanelR, {} )
				local LeftPanelLFrame2 = function ( LeftPanelL, event )
					if not event.interrupted then
						LeftPanelL:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					LeftPanelL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LeftPanelL, event )
					else
						LeftPanelL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelL:completeAnimation()
				self.LeftPanelL:setAlpha( 1 )
				LeftPanelLFrame2( LeftPanelL, {} )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					local VignetteBackFrame3 = function ( VignetteBack, event )
						if not event.interrupted then
							VignetteBack:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						VignetteBack:setRGB( 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( VignetteBack, event )
						else
							VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VignetteBackFrame3( VignetteBack, event )
						return 
					else
						VignetteBack:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						VignetteBack:registerEventHandler( "transition_complete_keyframe", VignetteBackFrame3 )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 1, 1, 1 )
				VignetteBackFrame2( VignetteBack, {} )
				FFATopPlayerInfo:completeAnimation()
				self.FFATopPlayerInfo:setAlpha( 0 )
				self.clipFinished( FFATopPlayerInfo, {} )
				FFAFirstRunnerUpPlayerInfo:completeAnimation()
				self.FFAFirstRunnerUpPlayerInfo:setAlpha( 0 )
				self.clipFinished( FFAFirstRunnerUpPlayerInfo, {} )
				FFASecondRunnerUpPlayerInfo:completeAnimation()
				self.FFASecondRunnerUpPlayerInfo:setAlpha( 0 )
				self.clipFinished( FFASecondRunnerUpPlayerInfo, {} )
				local WinningTeamScoreNewFrame2 = function ( WinningTeamScoreNew, event )
					if not event.interrupted then
						WinningTeamScoreNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					WinningTeamScoreNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WinningTeamScoreNew, event )
					else
						WinningTeamScoreNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinningTeamScoreNew:completeAnimation()
				self.WinningTeamScoreNew:setAlpha( 1 )
				WinningTeamScoreNewFrame2( WinningTeamScoreNew, {} )
				local LosingTeamScoreNewFrame2 = function ( LosingTeamScoreNew, event )
					if not event.interrupted then
						LosingTeamScoreNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					LosingTeamScoreNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LosingTeamScoreNew, event )
					else
						LosingTeamScoreNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LosingTeamScoreNew:completeAnimation()
				self.LosingTeamScoreNew:setAlpha( 1 )
				LosingTeamScoreNewFrame2( LosingTeamScoreNew, {} )
				local WinningTeamFactionNameNewFrame2 = function ( WinningTeamFactionNameNew, event )
					if not event.interrupted then
						WinningTeamFactionNameNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					WinningTeamFactionNameNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WinningTeamFactionNameNew, event )
					else
						WinningTeamFactionNameNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinningTeamFactionNameNew:completeAnimation()
				self.WinningTeamFactionNameNew:setAlpha( 1 )
				WinningTeamFactionNameNewFrame2( WinningTeamFactionNameNew, {} )
				local WinnersLabelNewFrame2 = function ( WinnersLabelNew, event )
					if not event.interrupted then
						WinnersLabelNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					WinnersLabelNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WinnersLabelNew, event )
					else
						WinnersLabelNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinnersLabelNew:completeAnimation()
				self.WinnersLabelNew:setAlpha( 1 )
				WinnersLabelNewFrame2( WinnersLabelNew, {} )
				local LosingTeamFactionNameNewFrame2 = function ( LosingTeamFactionNameNew, event )
					if not event.interrupted then
						LosingTeamFactionNameNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					LosingTeamFactionNameNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LosingTeamFactionNameNew, event )
					else
						LosingTeamFactionNameNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LosingTeamFactionNameNew:completeAnimation()
				self.LosingTeamFactionNameNew:setAlpha( 1 )
				LosingTeamFactionNameNewFrame2( LosingTeamFactionNameNew, {} )
				local WinningTeamFactionIconNewFrame2 = function ( WinningTeamFactionIconNew, event )
					if not event.interrupted then
						WinningTeamFactionIconNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					WinningTeamFactionIconNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WinningTeamFactionIconNew, event )
					else
						WinningTeamFactionIconNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 1 )
				WinningTeamFactionIconNewFrame2( WinningTeamFactionIconNew, {} )
				local LosingTeamFactionIconNewFrame2 = function ( LosingTeamFactionIconNew, event )
					if not event.interrupted then
						LosingTeamFactionIconNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					LosingTeamFactionIconNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LosingTeamFactionIconNew, event )
					else
						LosingTeamFactionIconNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LosingTeamFactionIconNew:completeAnimation()
				self.LosingTeamFactionIconNew:setAlpha( 1 )
				LosingTeamFactionIconNewFrame2( LosingTeamFactionIconNew, {} )
				local SubTitleNewFrame2 = function ( SubTitleNew, event )
					if not event.interrupted then
						SubTitleNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					SubTitleNew:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SubTitleNew, event )
					else
						SubTitleNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 1 )
				SubTitleNewFrame2( SubTitleNew, {} )
				local VSBannerFrame2 = function ( VSBanner, event )
					if not event.interrupted then
						VSBanner:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
						VSLabel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
				local TransitionImageBottomFrame2 = function ( TransitionImageBottom, event )
					local TransitionImageBottomFrame3 = function ( TransitionImageBottom, event )
						local TransitionImageBottomFrame4 = function ( TransitionImageBottom, event )
							if not event.interrupted then
								TransitionImageBottom:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
							end
							TransitionImageBottom:setLeftRight( true, true, 0, 0 )
							TransitionImageBottom:setTopBottom( true, false, 720, 1080 )
							TransitionImageBottom:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( TransitionImageBottom, event )
							else
								TransitionImageBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TransitionImageBottomFrame4( TransitionImageBottom, event )
							return 
						else
							TransitionImageBottom:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							TransitionImageBottom:registerEventHandler( "transition_complete_keyframe", TransitionImageBottomFrame4 )
						end
					end
					
					if event.interrupted then
						TransitionImageBottomFrame3( TransitionImageBottom, event )
						return 
					else
						TransitionImageBottom:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						TransitionImageBottom:setTopBottom( true, false, 360, 720 )
						TransitionImageBottom:setAlpha( 1 )
						TransitionImageBottom:registerEventHandler( "transition_complete_keyframe", TransitionImageBottomFrame3 )
					end
				end
				
				TransitionImageBottom:completeAnimation()
				self.TransitionImageBottom:setLeftRight( true, true, 0, 0 )
				self.TransitionImageBottom:setTopBottom( true, false, 720, 1080 )
				self.TransitionImageBottom:setAlpha( 0 )
				TransitionImageBottomFrame2( TransitionImageBottom, {} )
				local TransitionImageTopFrame2 = function ( TransitionImageTop, event )
					local TransitionImageTopFrame3 = function ( TransitionImageTop, event )
						local TransitionImageTopFrame4 = function ( TransitionImageTop, event )
							if not event.interrupted then
								TransitionImageTop:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
							end
							TransitionImageTop:setLeftRight( true, true, 0, 0 )
							TransitionImageTop:setTopBottom( true, false, -360, 0 )
							TransitionImageTop:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( TransitionImageTop, event )
							else
								TransitionImageTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TransitionImageTopFrame4( TransitionImageTop, event )
							return 
						else
							TransitionImageTop:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							TransitionImageTop:registerEventHandler( "transition_complete_keyframe", TransitionImageTopFrame4 )
						end
					end
					
					if event.interrupted then
						TransitionImageTopFrame3( TransitionImageTop, event )
						return 
					else
						TransitionImageTop:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						TransitionImageTop:setTopBottom( true, false, 0, 360 )
						TransitionImageTop:setAlpha( 1 )
						TransitionImageTop:registerEventHandler( "transition_complete_keyframe", TransitionImageTopFrame3 )
					end
				end
				
				TransitionImageTop:completeAnimation()
				self.TransitionImageTop:setLeftRight( true, true, 0, 0 )
				self.TransitionImageTop:setTopBottom( true, false, -360, 0 )
				self.TransitionImageTop:setAlpha( 0 )
				TransitionImageTopFrame2( TransitionImageTop, {} )
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setLeftRight( true, false, 64, 454 )
				self.WinnerFactionInfo:setTopBottom( true, false, 37.5, 217.5 )
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )
				local TitleNewFrame2 = function ( TitleNew, event )
					local TitleNewFrame3 = function ( TitleNew, event )
						local TitleNewFrame4 = function ( TitleNew, event )
							if not event.interrupted then
								TitleNew:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
							end
							TitleNew:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( TitleNew, event )
							else
								TitleNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TitleNewFrame4( TitleNew, event )
							return 
						else
							TitleNew:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
							TitleNew:registerEventHandler( "transition_complete_keyframe", TitleNewFrame4 )
						end
					end
					
					if event.interrupted then
						TitleNewFrame3( TitleNew, event )
						return 
					else
						TitleNew:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
						TitleNew:registerEventHandler( "transition_complete_keyframe", TitleNewFrame3 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 1 )
				TitleNewFrame2( TitleNew, {} )
				local MatchBonusWidget0Frame2 = function ( MatchBonusWidget0, event )
					if not event.interrupted then
						MatchBonusWidget0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					MatchBonusWidget0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MatchBonusWidget0, event )
					else
						MatchBonusWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 1 )
				MatchBonusWidget0Frame2( MatchBonusWidget0, {} )
			end,
			ShowFFAOutcome = function ()
				self:setupElementClipCounter( 7 )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setRGB( 0, 0, 0 )
				VignetteBackFrame2( VignetteBack, {} )
				local FFATopPlayerInfoFrame2 = function ( FFATopPlayerInfo, event )
					local FFATopPlayerInfoFrame3 = function ( FFATopPlayerInfo, event )
						if not event.interrupted then
							FFATopPlayerInfo:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
						end
						FFATopPlayerInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FFATopPlayerInfo, event )
						else
							FFATopPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FFATopPlayerInfoFrame3( FFATopPlayerInfo, event )
						return 
					else
						FFATopPlayerInfo:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FFATopPlayerInfo:registerEventHandler( "transition_complete_keyframe", FFATopPlayerInfoFrame3 )
					end
				end
				
				FFATopPlayerInfo:completeAnimation()
				self.FFATopPlayerInfo:setAlpha( 0 )
				FFATopPlayerInfoFrame2( FFATopPlayerInfo, {} )
				local FFAFirstRunnerUpPlayerInfoFrame2 = function ( FFAFirstRunnerUpPlayerInfo, event )
					local FFAFirstRunnerUpPlayerInfoFrame3 = function ( FFAFirstRunnerUpPlayerInfo, event )
						if not event.interrupted then
							FFAFirstRunnerUpPlayerInfo:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						FFAFirstRunnerUpPlayerInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FFAFirstRunnerUpPlayerInfo, event )
						else
							FFAFirstRunnerUpPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FFAFirstRunnerUpPlayerInfoFrame3( FFAFirstRunnerUpPlayerInfo, event )
						return 
					else
						FFAFirstRunnerUpPlayerInfo:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						FFAFirstRunnerUpPlayerInfo:registerEventHandler( "transition_complete_keyframe", FFAFirstRunnerUpPlayerInfoFrame3 )
					end
				end
				
				FFAFirstRunnerUpPlayerInfo:completeAnimation()
				self.FFAFirstRunnerUpPlayerInfo:setAlpha( 0 )
				FFAFirstRunnerUpPlayerInfoFrame2( FFAFirstRunnerUpPlayerInfo, {} )
				local FFASecondRunnerUpPlayerInfoFrame2 = function ( FFASecondRunnerUpPlayerInfo, event )
					local FFASecondRunnerUpPlayerInfoFrame3 = function ( FFASecondRunnerUpPlayerInfo, event )
						if not event.interrupted then
							FFASecondRunnerUpPlayerInfo:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
						end
						FFASecondRunnerUpPlayerInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FFASecondRunnerUpPlayerInfo, event )
						else
							FFASecondRunnerUpPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FFASecondRunnerUpPlayerInfoFrame3( FFASecondRunnerUpPlayerInfo, event )
						return 
					else
						FFASecondRunnerUpPlayerInfo:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						FFASecondRunnerUpPlayerInfo:registerEventHandler( "transition_complete_keyframe", FFASecondRunnerUpPlayerInfoFrame3 )
					end
				end
				
				FFASecondRunnerUpPlayerInfo:completeAnimation()
				self.FFASecondRunnerUpPlayerInfo:setAlpha( 0 )
				FFASecondRunnerUpPlayerInfoFrame2( FFASecondRunnerUpPlayerInfo, {} )
				local SubTitleNewFrame2 = function ( SubTitleNew, event )
					local SubTitleNewFrame3 = function ( SubTitleNew, event )
						if not event.interrupted then
							SubTitleNew:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						end
						SubTitleNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SubTitleNew, event )
						else
							SubTitleNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SubTitleNewFrame3( SubTitleNew, event )
						return 
					else
						SubTitleNew:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						SubTitleNew:registerEventHandler( "transition_complete_keyframe", SubTitleNewFrame3 )
					end
				end
				
				SubTitleNew:completeAnimation()
				self.SubTitleNew:setAlpha( 0 )
				SubTitleNewFrame2( SubTitleNew, {} )
				local TitleNewFrame2 = function ( TitleNew, event )
					local TitleNewFrame3 = function ( TitleNew, event )
						if not event.interrupted then
							TitleNew:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
						end
						TitleNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TitleNew, event )
						else
							TitleNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TitleNewFrame3( TitleNew, event )
						return 
					else
						TitleNew:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						TitleNew:registerEventHandler( "transition_complete_keyframe", TitleNewFrame3 )
					end
				end
				
				TitleNew:completeAnimation()
				self.TitleNew:setAlpha( 0 )
				TitleNewFrame2( TitleNew, {} )
				local MatchBonusWidget0Frame2 = function ( MatchBonusWidget0, event )
					if not event.interrupted then
						MatchBonusWidget0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
					end
					MatchBonusWidget0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MatchBonusWidget0, event )
					else
						MatchBonusWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MatchBonusWidget0:completeAnimation()
				self.MatchBonusWidget0:setAlpha( 0 )
				MatchBonusWidget0Frame2( MatchBonusWidget0, {} )
			end
		}
	}
	self.close = function ( self )
		self.LeftPanelR:close()
		self.LeftPanelL:close()
		self.VignetteBack:close()
		self.FFATopPlayerInfo:close()
		self.FFAFirstRunnerUpPlayerInfo:close()
		self.FFASecondRunnerUpPlayerInfo:close()
		self.WinningTeamScoreNew:close()
		self.LosingTeamScoreNew:close()
		self.WinningTeamFactionNameNew:close()
		self.WinnersLabelNew:close()
		self.LosingTeamFactionNameNew:close()
		self.WinningTeamFactionIconNew:close()
		self.LosingTeamFactionIconNew:close()
		self.SubTitleNew:close()
		self.VSBanner:close()
		self.WinnerFactionInfo:close()
		self.TitleNew:close()
		self.MatchBonusWidget0:close()
		CoD.Outcome.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

