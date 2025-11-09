require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetPnlRT" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.EndGameFlow.FFATopPlayerInfo" )
require( "ui.uieditor.widgets.EndGameFlow.FFARunnerUpPlayerInfo" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.EndGameFlow.OutcomeFactionIcon" )
require( "ui.uieditor.widgets.HUD.Outcome.TimeToBeatBox" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTeamNameR" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.HUD.Outcome.WinnerFactionInfo" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTitle" )
require( "ui.uieditor.widgets.HUD.Outcome.MatchBonusWidget" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) or Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
		f1_arg0:setAlpha( 0 )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	local f2_local0 = {}
	local f2_local1 = {}
	local f2_local2, f2_local3 = nil
	local f2_local4 = Engine.GetTeamID( f2_arg1, Engine.GetClientNum( f2_arg1 ) )
	if IsCodCaster( f2_arg1 ) then
		f2_local4 = Engine.GetTeamID( f2_arg1, Engine.GetPredictedClientNum( f2_arg1 ) )
	end
	local f2_local5 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "gameScore" )
	local f2_local6 = f2_arg2 == Enum.team_t.TEAM_BAD
	local f2_local7 = Engine.GetModel( Engine.GetGlobalModel(), "factions" )
	Engine.SetModelValue( Engine.CreateModel( f2_local5, "draw" ), f2_local6 )
	local f2_local8 = Engine.GetModel( f2_local5, "alliesScore" )
	f2_local0.score = Engine.GetModelValue( f2_local8 )
	local f2_local9 = Engine.CreateModel( f2_local7, "winningTeamScore" )
	local f2_local10 = Engine.CreateModel( f2_local7, "losingTeamScore" )
	f2_local0.displayName = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES )
	f2_local0.factionIcon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES )
	local f2_local11 = Engine.GetModel( f2_local5, "axisScore" )
	f2_local1.score = Engine.GetModelValue( f2_local11 )
	f2_local1.displayName = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS )
	f2_local1.factionIcon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS )
	if not f2_local6 and not f2_arg3 then
		if f2_arg2 == f2_local4 then
			Engine.SetModelValue( Engine.CreateModel( f2_local5, "victory" ), true )
		else
			Engine.SetModelValue( Engine.CreateModel( f2_local5, "defeat" ), true )
		end
	end
	if f2_arg2 ~= f2_local4 or not "playerScoreOrTime" then
		local f2_local12 = "enemyScoreOrTime"
	end
	if f2_arg2 == f2_local4 or not "playerScoreOrTime" then
		local f2_local13 = "enemyScoreOrTime"
	end
	local f2_local14 = #f2_arg4.data >= 7
	local f2_local15 = #f2_arg4.data == 6
	Engine.CreateModel( f2_local5, "enemyScoreOrTime" )
	Engine.CreateModel( f2_local5, "playerScoreOrTime" )
	local f2_local16, f2_local17 = nil
	local f2_local12
	local f2_local13
	if f2_arg2 == Enum.team_t.TEAM_ALLIES or f2_local6 then
		f2_local2 = f2_local0
		f2_local3 = f2_local1
		f2_local16 = f2_local8
		f2_local17 = f2_local11
		if IsCodCaster( f2_arg1 ) then
			f2_local12 = "playerScoreOrTime"
			f2_local13 = "enemyScoreOrTime"
		end
	else
		f2_local2 = f2_local1
		f2_local3 = f2_local0
		f2_local16 = f2_local11
		f2_local17 = f2_local8
		if IsCodCaster( f2_arg1 ) then
			f2_local12 = "enemyScoreOrTime"
			f2_local13 = "playerScoreOrTime"
		end
	end
	if f2_arg0.hasWinningAndLosingSubscriptions then
		f2_arg0:removeSubscription( f2_arg0.winningScoreSubscription )
		f2_arg0:removeSubscription( f2_arg0.losingScoreSubscription )
		f2_arg0.hasWinningAndLosingSubscriptions = false
	end
	if not f2_local14 and not f2_local15 then
		f2_arg0.hasWinningAndLosingSubscriptions = true
		f2_arg0.winningScoreSubscription = f2_arg0:subscribeToModel( f2_local16, function ( model )
			local modelValue = Engine.GetModelValue( model )
			Engine.SetModelValue( f2_local9, modelValue )
			Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local12 ), "" .. modelValue )
		end )
		f2_arg0.losingScoreSubscription = f2_arg0:subscribeToModel( f2_local17, function ( model )
			local modelValue = Engine.GetModelValue( model )
			Engine.SetModelValue( f2_local10, Engine.GetModelValue( model ) )
			Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local13 ), "" .. modelValue )
		end )
	end
	local f2_local18 = function ( f5_arg0 )
		if f5_arg0 == nil or f5_arg0 == 0 then
			return "-:--"
		else
			local f5_local0 = math.floor( f5_arg0 / 60 )
			return f5_local0 .. ":" .. string.format( "%02d", f5_arg0 - 60 * f5_local0 )
		end
	end
	
	Engine.SetModelValue( Engine.GetModel( f2_local5, "showTimeResults" ), f2_local14 )
	Engine.SetModelValue( Engine.GetModel( f2_local5, "playerScoreIsTimeToBeat" ), false )
	Engine.SetModelValue( Engine.GetModel( f2_local5, "enemyScoreIsTimeToBeat" ), false )
	if f2_local14 then
		if IsCodCaster( f2_arg1 ) then
			local f2_local19 = Engine.SetModelValue
			local f2_local20 = Engine.GetModel( f2_local5, "playerScoreIsTimeToBeat" )
			local f2_local21
			if not f2_local6 then
				local f2_local22 = f2_arg3
				if f2_arg2 ~= Enum.team_t.TEAM_ALLIES then
					f2_local21 = false
				end
				f2_local21 = f2_local22 and true
			end
			f2_local21 = false
		else
			local f2_local19 = Engine.SetModelValue
			local f2_local20 = Engine.GetModel( f2_local5, "playerScoreIsTimeToBeat" )
			local f2_local21
			if not f2_local6 then
				local f2_local24 = f2_arg3
				if f2_arg2 ~= f2_local4 then
					f2_local21 = false
				end
				f2_local21 = f2_local24 and true
			end
			f2_local21 = false
		end
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local12 ), f2_local18( f2_arg4.data[6] ) )
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local13 ), f2_local18( f2_arg4.data[7] ) )
	end
	if f2_local15 then
		local f2_local19 = f2_arg4.data[6]
		local f2_local20 = 0
		local f2_local21 = 0
		if f2_local19 >= 65536 then
			DebugPrint( "WARNING: score override sent from show_outcome event has a score > 255" )
		else
			f2_local20 = f2_local19 & 255
			f2_local21 = f2_local19 >> 8
		end
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local12 ), f2_local21 )
		Engine.SetModelValue( Engine.GetModel( f2_local5, f2_local13 ), f2_local20 )
	end
	Engine.SetModelValue( f2_local9, f2_local2.score )
	Engine.SetModelValue( f2_local10, f2_local3.score )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "winnersFactionDisplayName" ), f2_local2.displayName )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "winnersFactionIcon" ), f2_local2.factionIcon )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "losersFactionDisplayName" ), f2_local3.displayName )
	Engine.SetModelValue( Engine.CreateModel( f2_local7, "losersFactionIcon" ), f2_local3.factionIcon )
end

local f0_local2 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = f6_arg1.controller
	Engine.UpdateTopPlayerUIModels( f6_local0 )
	f6_arg0:setAlpha( 1 )
	local f6_local1 = f6_arg1.data[1]
	local f6_local2 = f6_arg1.data[2]
	local f6_local3 = f6_arg1.data[3]
	local f6_local4 = f6_arg1.data[4]
	local f6_local5
	if f6_arg1.data[5] ~= 1 and f6_arg1.data[5] ~= true then
		f6_local5 = false
	else
		f6_local5 = true
	end
	local f6_local6 = Engine.GetModel( Engine.GetModelForController( f6_local0 ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f6_local0 ), "aarStats.performanceTabStats.outcome", true ), Engine.Localize( Engine.GetIString( f6_local1, "CS_LOCALIZED_STRINGS" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f6_local6, "isRoundEnd" ), f6_local5 )
	Engine.SetModelValue( Engine.CreateModel( f6_local6, "matchBonus" ), f6_local3 )
	f6_arg0.TitleNew:setAlpha( 0 )
	f6_arg0.SubTitleNew:setAlpha( 0 )
	local f6_local7 = Engine.GetIString( f6_local1, "CS_LOCALIZED_STRINGS" )
	if CoD.IsShoutcaster( f6_local0 ) then
		f6_local7 = Engine.Localize( f6_local7, CoD.GetTeamName( f6_local4 ) )
	end
	f6_arg0.TitleNew.isOvertime = f6_local7 == "MP_OVERTIME_CAPS"
	f6_arg0.TitleNew.KillcamText0:setText( Engine.Localize( f6_local7 ) )
	local f6_local8 = Engine.GetIString( f6_local2, "CS_LOCALIZED_STRINGS" )
	if CoD.IsShoutcaster( f6_local0 ) and f6_local8 == "MP_TEAM_ELIMINATED" then
		local f6_local9 = Enum.team_t.TEAM_AXIS
		if f6_local4 == Enum.team_t.TEAM_AXIS then
			f6_local9 = Enum.team_t.TEAM_ALLIES
		end
		f6_local8 = Engine.Localize( f6_local8, CoD.GetTeamName( f6_local9 ) )
	end
	f6_arg0.SubTitleNew.MatchText:setText( Engine.Localize( f6_local8 ) )
	local f6_local9 = Engine.GetGametypeSetting( "teamCount" )
	if f6_local9 == 2 then
		f0_local1( f6_arg0, f6_local0, f6_local4, f6_local5, f6_arg1 )
		if CoD.IsShoutcaster( f6_local0 ) and f6_local4 ~= Enum.team_t.TEAM_FREE then
			local f6_local10 = CoD.GetColorFromFormattedColorString( CoD.GetTeamFactionColor( f6_local4 ) )
			f6_arg0.TitleNew.TopFrame:setRGB( f6_local10.r, f6_local10.g, f6_local10.b )
			f6_arg0.TitleNew.CornerFrameUL:setRGB( f6_local10.r, f6_local10.g, f6_local10.b )
			f6_arg0.TitleNew.CornerFrameUR:setRGB( f6_local10.r, f6_local10.g, f6_local10.b )
			f6_arg0.TitleNew.CornerFrameLL:setRGB( f6_local10.r, f6_local10.g, f6_local10.b )
			f6_arg0.TitleNew.CornerFrameLR:setRGB( f6_local10.r, f6_local10.g, f6_local10.b )
			f6_arg0.TitleNew.LineColorLeft:setRGB( f6_local10.r, f6_local10.g, f6_local10.b )
			f6_arg0.TitleNew.LineColorRight:setRGB( f6_local10.r, f6_local10.g, f6_local10.b )
		end
		f6_arg0:playClip( "Show_Two_Team" )
	elseif f6_local9 == 1 then
		local f6_local10 = f6_arg1.data[4]
		if f6_arg0.TitleNew.KillcamText0:getText() == Engine.Localize( "MP_MATCH_TIE" ) then
			f6_arg0:playClip( "ShowFFATie" )
		else
			if f6_local10 < 3 then
				if f6_local10 < 2 then
					f6_arg0.FFAFirstRunnerUpPlayerInfo:close()
				end
				f6_arg0.FFASecondRunnerUpPlayerInfo:close()
			end
			f6_arg0:playClip( "ShowFFAOutcome" )
		end
	end
	f6_arg2:updateElementState( f6_arg0.TitleNew )
end

local PostLoadFunc = function ( self, controller, menu )
	local f7_local0 = function ( f8_arg0 )
		f0_local0( self, {
			controller = controller
		} )
	end
	
	local f7_local1 = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( f7_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f7_local0 )
	self:subscribeToModel( Engine.GetModel( f7_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), f7_local0 )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "show_outcome" then
			f0_local2( self, {
				controller = controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}, menu )
		elseif modelValue == "pre_killcam_transition" then
			local f9_local1 = Engine.GetGametypeSetting( "teamCount" ) < 2
			local f9_local2 = self
			local f9_local3 = f9_local2
			f9_local2 = f9_local2.playClip
			local f9_local4 = "End_Transition"
			local f9_local5
			if f9_local1 then
				f9_local5 = "_FFA"
				if not f9_local5 then
				
				else
					f9_local2( f9_local3, f9_local4 .. f9_local5 )
				end
			end
			f9_local5 = ""
		end
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.hideOutcomeUI" ), function ( model )
		if Engine.GetModelValue( model ) == 1 then
			self:setAlpha( 0 )
		end
	end )
	self:setState( "DefaultState" )
	if Engine.GetGametypeSetting( "teamCount" ) == 1 then
		self.WinnerFactionInfo:close()
	end
end

local f0_local4 = function ( f11_arg0 )
	local f11_local0 = Engine.CreateModel( Engine.GetModelForController( f11_arg0 ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "draw" ), false )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "isRoundEnd" ), false )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "matchBonus" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "alliesScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "axisScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "victory" ), false )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "defeat" ), false )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "enemyScoreOrTime" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f11_local0, "playerScoreOrTime" ), "" )
	local f11_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
	Engine.SetModelValue( Engine.CreateModel( f11_local1, "winningTeamScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f11_local1, "losingTeamScore" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f11_local1, "winnersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f11_local1, "winnersFactionIcon" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f11_local1, "losersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f11_local1, "losersFactionIcon" ), "" )
end

local PreLoadFunc = function ( self, controller )
	Engine.UpdateTopPlayerUIModels( controller )
	local f12_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( f12_local0, "showTimeResults" ), false )
	Engine.SetModelValue( Engine.CreateModel( f12_local0, "playerScoreIsTimeToBeat" ), false )
	Engine.SetModelValue( Engine.CreateModel( f12_local0, "enemyScoreIsTimeToBeat" ), false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "displayTop3Players" ), function ( model )
		if Engine.GetModelValue( model ) == 1 then
			self:close()
		end
	end )
	f0_local4( controller )
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
	LeftPanelR:setLeftRight( false, false, 0, 675 )
	LeftPanelR:setTopBottom( false, false, -37, 43 )
	LeftPanelR:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelR:setAlpha( 0 )
	LeftPanelR:setYRot( 180 )
	LeftPanelR.KillcamWidgetPnlRTInt0:setShaderVector( 0, 0, 3, 0, 0 )
	LeftPanelR:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			LeftPanelR.CodCasterKillcamWidgetPnlRT:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team2", axisFactionColor ) )
		end
	end )
	LeftPanelR:subscribeToGlobalModel( controller, "Factions", "enemyFactionColor", function ( model )
		local enemyFactionColor = Engine.GetModelValue( model )
		if enemyFactionColor then
			LeftPanelR.FactionColorBar:setRGB( enemyFactionColor )
		end
	end )
	self:addElement( LeftPanelR )
	self.LeftPanelR = LeftPanelR
	
	local LeftPanelL = CoD.KillcamWidgetPnlRT.new( menu, controller )
	LeftPanelL:setLeftRight( false, false, -675, 0 )
	LeftPanelL:setTopBottom( false, false, -37, 43 )
	LeftPanelL:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelL:setAlpha( 0 )
	LeftPanelL.KillcamWidgetPnlRTInt0:setShaderVector( 0, 0, 3, 0, 0 )
	LeftPanelL:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			LeftPanelL.CodCasterKillcamWidgetPnlRT:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team1", alliesFactionColor ) )
		end
	end )
	LeftPanelL:subscribeToGlobalModel( controller, "Factions", "playerFactionColor", function ( model )
		local playerFactionColor = Engine.GetModelValue( model )
		if playerFactionColor then
			LeftPanelL.FactionColorBar:setRGB( playerFactionColor )
		end
	end )
	self:addElement( LeftPanelL )
	self.LeftPanelL = LeftPanelL
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	VignetteBack:setRGB( 0, 0, 0 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local FFATopPlayerInfo = CoD.FFATopPlayerInfo.new( menu, controller )
	FFATopPlayerInfo:setLeftRight( false, false, -301.29, 390.29 )
	FFATopPlayerInfo:setTopBottom( false, false, -194, -51.5 )
	FFATopPlayerInfo:setAlpha( 0 )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			FFATopPlayerInfo.Score0:setText( Engine.Localize( score ) )
		end
	end )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			FFATopPlayerInfo.Score.Numbers:setText( Engine.Localize( score ) )
		end
	end )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			FFATopPlayerInfo.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			FFATopPlayerInfo.FFAGamerTag.itemName:setText( name )
		end
	end )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			FFATopPlayerInfo.FFAClanTag:setAlpha( HideIfEmptyString( clanTag ) )
		end
	end )
	FFATopPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			FFATopPlayerInfo.FFAClanTag.itemName:setText( StringAsClanTag( clanTag ) )
		end
	end )
	self:addElement( FFATopPlayerInfo )
	self.FFATopPlayerInfo = FFATopPlayerInfo
	
	local FFAFirstRunnerUpPlayerInfo = CoD.FFARunnerUpPlayerInfo.new( menu, controller )
	FFAFirstRunnerUpPlayerInfo:setLeftRight( false, false, -269.5, 316.5 )
	FFAFirstRunnerUpPlayerInfo:setTopBottom( false, false, -36.4, 57.6 )
	FFAFirstRunnerUpPlayerInfo:setAlpha( 0 )
	FFAFirstRunnerUpPlayerInfo.RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon2" ) )
	FFAFirstRunnerUpPlayerInfo.Ribbon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon2" ) )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			FFAFirstRunnerUpPlayerInfo.Score0:setText( Engine.Localize( score ) )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			FFAFirstRunnerUpPlayerInfo.Emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			FFAFirstRunnerUpPlayerInfo.Score.Numbers:setText( Engine.Localize( score ) )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			FFAFirstRunnerUpPlayerInfo.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			FFAFirstRunnerUpPlayerInfo.FFAGamerTag.itemName:setText( name )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			FFAFirstRunnerUpPlayerInfo.FFAClanTag:setAlpha( HideIfEmptyString( clanTag ) )
		end
	end )
	FFAFirstRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			FFAFirstRunnerUpPlayerInfo.FFAClanTag.itemName:setText( StringAsClanTag( clanTag ) )
		end
	end )
	self:addElement( FFAFirstRunnerUpPlayerInfo )
	self.FFAFirstRunnerUpPlayerInfo = FFAFirstRunnerUpPlayerInfo
	
	local FFASecondRunnerUpPlayerInfo = CoD.FFARunnerUpPlayerInfo.new( menu, controller )
	FFASecondRunnerUpPlayerInfo:setLeftRight( false, false, -269.5, 316.5 )
	FFASecondRunnerUpPlayerInfo:setTopBottom( false, false, 65, 159 )
	FFASecondRunnerUpPlayerInfo:setAlpha( 0 )
	FFASecondRunnerUpPlayerInfo.RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	FFASecondRunnerUpPlayerInfo.Ribbon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			FFASecondRunnerUpPlayerInfo.Score0:setText( Engine.Localize( score ) )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			FFASecondRunnerUpPlayerInfo.Emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			FFASecondRunnerUpPlayerInfo.Score.Numbers:setText( Engine.Localize( score ) )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			FFASecondRunnerUpPlayerInfo.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			FFASecondRunnerUpPlayerInfo.FFAGamerTag.itemName:setText( name )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			FFASecondRunnerUpPlayerInfo.FFAClanTag:setAlpha( HideIfEmptyString( clanTag ) )
		end
	end )
	FFASecondRunnerUpPlayerInfo:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			FFASecondRunnerUpPlayerInfo.FFAClanTag.itemName:setText( StringAsClanTag( clanTag ) )
		end
	end )
	self:addElement( FFASecondRunnerUpPlayerInfo )
	self.FFASecondRunnerUpPlayerInfo = FFASecondRunnerUpPlayerInfo
	
	local WinningTeamScoreNew = CoD.KillcamWidgetNumbers.new( menu, controller )
	WinningTeamScoreNew:setLeftRight( false, false, -153.78, -33.78 )
	WinningTeamScoreNew:setTopBottom( false, false, -21, 33 )
	WinningTeamScoreNew:setAlpha( 0 )
	WinningTeamScoreNew:setScale( 1.2 )
	WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
	WinningTeamScoreNew:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	WinningTeamScoreNew.Numbers:setRGB( 1, 1, 1 )
	WinningTeamScoreNew:subscribeToGlobalModel( controller, "GameScore", "playerScoreOrTime", function ( model )
		local playerScoreOrTime = Engine.GetModelValue( model )
		if playerScoreOrTime then
			WinningTeamScoreNew.Numbers:setText( Engine.Localize( playerScoreOrTime ) )
		end
	end )
	WinningTeamScoreNew:mergeStateConditions( {
		{
			stateName = "WinTime",
			condition = function ( menu, element, event )
				local f40_local0 = IsModelValueEqualTo( controller, "gameScore.victory", true )
				if f40_local0 then
					f40_local0 = IsModelValueEqualTo( controller, "gameScore.showTimeResults", true )
					if f40_local0 then
						f40_local0 = not IsCodCaster( controller )
					end
				end
				return f40_local0
			end
		},
		{
			stateName = "LossTime",
			condition = function ( menu, element, event )
				local f41_local0 = IsModelValueEqualTo( controller, "gameScore.defeat", true )
				if f41_local0 then
					f41_local0 = IsModelValueEqualTo( controller, "gameScore.showTimeResults", true )
					if f41_local0 then
						f41_local0 = not IsCodCaster( controller )
					end
				end
				return f41_local0
			end
		}
	} )
	WinningTeamScoreNew:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.victory" ), function ( model )
		menu:updateElementState( WinningTeamScoreNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.victory"
		} )
	end )
	WinningTeamScoreNew:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.showTimeResults" ), function ( model )
		menu:updateElementState( WinningTeamScoreNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.showTimeResults"
		} )
	end )
	WinningTeamScoreNew:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( WinningTeamScoreNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	WinningTeamScoreNew:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.defeat" ), function ( model )
		menu:updateElementState( WinningTeamScoreNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.defeat"
		} )
	end )
	self:addElement( WinningTeamScoreNew )
	self.WinningTeamScoreNew = WinningTeamScoreNew
	
	local LosingTeamScoreNew = CoD.KillcamWidgetNumbers.new( menu, controller )
	LosingTeamScoreNew:setLeftRight( false, false, 34.22, 154.22 )
	LosingTeamScoreNew:setTopBottom( false, false, -21, 33 )
	LosingTeamScoreNew:setAlpha( 0 )
	LosingTeamScoreNew:setScale( 1.2 )
	LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
	LosingTeamScoreNew:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	LosingTeamScoreNew.Numbers:setRGB( 1, 1, 1 )
	LosingTeamScoreNew:subscribeToGlobalModel( controller, "GameScore", "enemyScoreOrTime", function ( model )
		local enemyScoreOrTime = Engine.GetModelValue( model )
		if enemyScoreOrTime then
			LosingTeamScoreNew.Numbers:setText( Engine.Localize( enemyScoreOrTime ) )
		end
	end )
	LosingTeamScoreNew:mergeStateConditions( {
		{
			stateName = "WinTime",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LossTime",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( LosingTeamScoreNew )
	self.LosingTeamScoreNew = LosingTeamScoreNew
	
	local WinningTeamFactionNameNew = CoD.WeaponNameWidget.new( menu, controller )
	WinningTeamFactionNameNew:setLeftRight( false, false, -352, -134 )
	WinningTeamFactionNameNew:setTopBottom( false, false, -15, 19 )
	WinningTeamFactionNameNew:setAlpha( 0 )
	WinningTeamFactionNameNew:subscribeToGlobalModel( controller, "Factions", "playerFactionDisplayName", function ( model )
		local playerFactionDisplayName = Engine.GetModelValue( model )
		if playerFactionDisplayName then
			WinningTeamFactionNameNew.weaponNameLabel:setText( Engine.Localize( playerFactionDisplayName ) )
		end
	end )
	WinningTeamFactionNameNew:registerEventHandler( "menu_loaded", function ( element, event )
		local f50_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f50_local0 then
			f50_local0 = element:dispatchEventToChildren( event )
		end
		return f50_local0
	end )
	self:addElement( WinningTeamFactionNameNew )
	self.WinningTeamFactionNameNew = WinningTeamFactionNameNew
	
	local WinningTeamFactionIconNew = CoD.OutcomeFactionIcon.new( menu, controller )
	WinningTeamFactionIconNew:setLeftRight( false, false, -506, -116 )
	WinningTeamFactionIconNew:setTopBottom( false, false, -76, 104 )
	WinningTeamFactionIconNew:setAlpha( 0 )
	WinningTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			WinningTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	WinningTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			WinningTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	WinningTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			WinningTeamFactionIconNew.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon0:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	WinningTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local playerFactionIcon = Engine.GetModelValue( model )
		if playerFactionIcon then
			WinningTeamFactionIconNew.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon:setImage( RegisterImage( playerFactionIcon ) )
		end
	end )
	self:addElement( WinningTeamFactionIconNew )
	self.WinningTeamFactionIconNew = WinningTeamFactionIconNew
	
	local PlayerTimeToBeatBox = CoD.TimeToBeatBox.new( menu, controller )
	PlayerTimeToBeatBox:setLeftRight( false, false, -133.78, -53.78 )
	PlayerTimeToBeatBox:setTopBottom( false, true, -327.5, -306.5 )
	PlayerTimeToBeatBox:setAlpha( 0 )
	PlayerTimeToBeatBox:mergeStateConditions( {
		{
			stateName = "NoText",
			condition = function ( menu, element, event )
				return not IsModelValueEqualTo( controller, "gameScore.playerScoreIsTimeToBeat", true )
			end
		}
	} )
	PlayerTimeToBeatBox:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.playerScoreIsTimeToBeat" ), function ( model )
		menu:updateElementState( PlayerTimeToBeatBox, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.playerScoreIsTimeToBeat"
		} )
	end )
	self:addElement( PlayerTimeToBeatBox )
	self.PlayerTimeToBeatBox = PlayerTimeToBeatBox
	
	local LosingTeamFactionNameNew = CoD.KillcamWidgetTeamNameR.new( menu, controller )
	LosingTeamFactionNameNew:setLeftRight( false, false, 135.5, 353.5 )
	LosingTeamFactionNameNew:setTopBottom( false, false, -15, 19 )
	LosingTeamFactionNameNew:setAlpha( 0 )
	LosingTeamFactionNameNew:subscribeToGlobalModel( controller, "Factions", "enemyFactionDisplayName", function ( model )
		local enemyFactionDisplayName = Engine.GetModelValue( model )
		if enemyFactionDisplayName then
			LosingTeamFactionNameNew.weaponNameLabel:setText( Engine.Localize( enemyFactionDisplayName ) )
		end
	end )
	self:addElement( LosingTeamFactionNameNew )
	self.LosingTeamFactionNameNew = LosingTeamFactionNameNew
	
	local LosingTeamFactionIconNew = CoD.OutcomeFactionIcon.new( menu, controller )
	LosingTeamFactionIconNew:setLeftRight( false, false, 117.5, 507.5 )
	LosingTeamFactionIconNew:setTopBottom( false, false, -76, 104 )
	LosingTeamFactionIconNew:setAlpha( 0 )
	LosingTeamFactionIconNew:setYRot( 180 )
	LosingTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "enemyFactionIcon", function ( model )
		local enemyFactionIcon = Engine.GetModelValue( model )
		if enemyFactionIcon then
			LosingTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( enemyFactionIcon ) )
		end
	end )
	LosingTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "enemyFactionIcon", function ( model )
		local enemyFactionIcon = Engine.GetModelValue( model )
		if enemyFactionIcon then
			LosingTeamFactionIconNew.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( enemyFactionIcon ) )
		end
	end )
	LosingTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "enemyFactionIcon", function ( model )
		local enemyFactionIcon = Engine.GetModelValue( model )
		if enemyFactionIcon then
			LosingTeamFactionIconNew.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon0:setImage( RegisterImage( enemyFactionIcon ) )
		end
	end )
	LosingTeamFactionIconNew:subscribeToGlobalModel( controller, "Factions", "enemyFactionIcon", function ( model )
		local enemyFactionIcon = Engine.GetModelValue( model )
		if enemyFactionIcon then
			LosingTeamFactionIconNew.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon:setImage( RegisterImage( enemyFactionIcon ) )
		end
	end )
	self:addElement( LosingTeamFactionIconNew )
	self.LosingTeamFactionIconNew = LosingTeamFactionIconNew
	
	local EnemyTimeToBeatBox = CoD.TimeToBeatBox.new( menu, controller )
	EnemyTimeToBeatBox:setLeftRight( false, false, 54.22, 134.22 )
	EnemyTimeToBeatBox:setTopBottom( false, true, -327.5, -306.5 )
	EnemyTimeToBeatBox:setAlpha( 0 )
	EnemyTimeToBeatBox:mergeStateConditions( {
		{
			stateName = "NoText",
			condition = function ( menu, element, event )
				return not IsModelValueEqualTo( controller, "gameScore.enemyScoreIsTimeToBeat", true )
			end
		}
	} )
	EnemyTimeToBeatBox:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.enemyScoreIsTimeToBeat" ), function ( model )
		menu:updateElementState( EnemyTimeToBeatBox, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.enemyScoreIsTimeToBeat"
		} )
	end )
	self:addElement( EnemyTimeToBeatBox )
	self.EnemyTimeToBeatBox = EnemyTimeToBeatBox
	
	local SubTitleNew = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	SubTitleNew:setLeftRight( false, false, -142, 142 )
	SubTitleNew:setTopBottom( true, false, 99.29, 131.5 )
	SubTitleNew:setAlpha( 0 )
	SubTitleNew.FEButtonPanel0:setAlpha( 0.3 )
	SubTitleNew.MatchText:setText( Engine.Localize( "MP_SCORE_LIMIT_REACHED" ) )
	SubTitleNew.MatchText:setTTF( "fonts/escom.ttf" )
	self:addElement( SubTitleNew )
	self.SubTitleNew = SubTitleNew
	
	local VSBanner = CoD.FE_ListHeaderGlow.new( menu, controller )
	VSBanner:setLeftRight( false, false, -20.5, 20.5 )
	VSBanner:setTopBottom( false, false, -10, 18 )
	VSBanner:setAlpha( 0 )
	self:addElement( VSBanner )
	self.VSBanner = VSBanner
	
	local VSLabel = LUI.UITightText.new()
	VSLabel:setLeftRight( false, false, -13, 17 )
	VSLabel:setTopBottom( false, false, -9, 16 )
	VSLabel:setRGB( 0, 0, 0 )
	VSLabel:setAlpha( 0 )
	VSLabel:setText( Engine.Localize( "MP_VERSUS" ) )
	VSLabel:setTTF( "fonts/escom.ttf" )
	VSLabel:setLetterSpacing( 2 )
	self:addElement( VSLabel )
	self.VSLabel = VSLabel
	
	local TransitionImageBottom = LUI.UIImage.new()
	TransitionImageBottom:setLeftRight( true, true, 0, 0 )
	TransitionImageBottom:setTopBottom( false, true, -302.4, 57.6 )
	TransitionImageBottom:setRGB( 0, 0, 0 )
	TransitionImageBottom:setAlpha( 0 )
	self:addElement( TransitionImageBottom )
	self.TransitionImageBottom = TransitionImageBottom
	
	local TransitionImageTop = LUI.UIImage.new()
	TransitionImageTop:setLeftRight( true, true, 0, 0 )
	TransitionImageTop:setTopBottom( true, false, -57.6, 302.4 )
	TransitionImageTop:setRGB( 0, 0, 0 )
	TransitionImageTop:setAlpha( 0 )
	self:addElement( TransitionImageTop )
	self.TransitionImageTop = TransitionImageTop
	
	local WinnerFactionInfo = CoD.WinnerFactionInfo.new( menu, controller )
	WinnerFactionInfo:setLeftRight( true, false, 24, 414 )
	WinnerFactionInfo:setTopBottom( true, false, 2.5, 182.5 )
	WinnerFactionInfo:setAlpha( 0 )
	WinnerFactionInfo.KillcamWidgetTitleStatus0.SubTitle:setText( Engine.Localize( "MENU_WINNERS_CAPS" ) )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionDisplayName", function ( model )
		local winnersFactionDisplayName = Engine.GetModelValue( model )
		if winnersFactionDisplayName then
			WinnerFactionInfo.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( winnersFactionDisplayName ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon0:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	self:addElement( WinnerFactionInfo )
	self.WinnerFactionInfo = WinnerFactionInfo
	
	local TitleNew = CoD.KillcamWidgetTitle.new( menu, controller )
	TitleNew:setLeftRight( false, false, -250, 250 )
	TitleNew:setTopBottom( true, false, 37.5, 92.5 )
	TitleNew:setAlpha( 0 )
	TitleNew.KillcamText0:setText( Engine.Localize( "VICTORY" ) )
	TitleNew:mergeStateConditions( {
		{
			stateName = "VictoryGreen",
			condition = function ( menu, element, event )
				return IsVictory( controller )
			end
		},
		{
			stateName = "DefeatRed",
			condition = function ( menu, element, event )
				return IsDefeat( controller )
			end
		},
		{
			stateName = "OvertimeOrange",
			condition = function ( menu, element, event )
				return IsElementPropertyValue( element, "isOvertime", true )
			end
		}
	} )
	TitleNew:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.victory" ), function ( model )
		menu:updateElementState( TitleNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.victory"
		} )
	end )
	TitleNew:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.defeat" ), function ( model )
		menu:updateElementState( TitleNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.defeat"
		} )
	end )
	TitleNew:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.isRoundEnd" ), function ( model )
		menu:updateElementState( TitleNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.isRoundEnd"
		} )
	end )
	self:addElement( TitleNew )
	self.TitleNew = TitleNew
	
	local MatchBonusWidget0 = CoD.MatchBonusWidget.new( menu, controller )
	MatchBonusWidget0:setLeftRight( false, false, -142, 142 )
	MatchBonusWidget0:setTopBottom( false, true, -164.5, -36 )
	MatchBonusWidget0:setAlpha( 0 )
	self:addElement( MatchBonusWidget0 )
	self.MatchBonusWidget0 = MatchBonusWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )
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
				WinningTeamFactionIconNew:completeAnimation()
				self.WinningTeamFactionIconNew:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIconNew, {} )
				LosingTeamFactionNameNew:completeAnimation()
				self.LosingTeamFactionNameNew:setAlpha( 0 )
				self.clipFinished( LosingTeamFactionNameNew, {} )
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
				self.VSLabel:setLeftRight( false, false, -15, 15 )
				self.VSLabel:setTopBottom( false, false, -6, 19 )
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
				self:setupElementClipCounter( 19 )
				local LeftPanelRFrame2 = function ( LeftPanelR, event )
					if not event.interrupted then
						LeftPanelR:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					LeftPanelR:setLeftRight( false, false, 0, 675 )
					LeftPanelR:setTopBottom( false, false, -37, 43 )
					LeftPanelR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelR, event )
					else
						LeftPanelR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setLeftRight( false, false, 170, 845 )
				self.LeftPanelR:setTopBottom( false, false, -37, 43 )
				self.LeftPanelR:setAlpha( 0 )
				LeftPanelRFrame2( LeftPanelR, {} )
				local LeftPanelLFrame2 = function ( LeftPanelL, event )
					if not event.interrupted then
						LeftPanelL:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					LeftPanelL:setLeftRight( false, false, -675, 0 )
					LeftPanelL:setTopBottom( false, false, -37, 43 )
					LeftPanelL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelL, event )
					else
						LeftPanelL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelL:completeAnimation()
				self.LeftPanelL:setLeftRight( false, false, -885, -210 )
				self.LeftPanelL:setTopBottom( false, false, -37, 43 )
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
				FFASecondRunnerUpPlayerInfo:completeAnimation()
				self.FFASecondRunnerUpPlayerInfo:setLeftRight( false, false, -269.5, 316.5 )
				self.FFASecondRunnerUpPlayerInfo:setTopBottom( false, false, 64, 158 )
				self.clipFinished( FFASecondRunnerUpPlayerInfo, {} )
				local WinningTeamScoreNewFrame2 = function ( WinningTeamScoreNew, event )
					local WinningTeamScoreNewFrame3 = function ( WinningTeamScoreNew, event )
						if not event.interrupted then
							WinningTeamScoreNew:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamScoreNew:setAlpha( 1 )
						WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
						WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
						WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
						WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
						WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
						WinningTeamScoreNew:setShaderVector( 4, 0, 0, 0, 0 )
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
				self.WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 4, 0, 0, 0, 0 )
				WinningTeamScoreNewFrame2( WinningTeamScoreNew, {} )
				local LosingTeamScoreNewFrame2 = function ( LosingTeamScoreNew, event )
					local LosingTeamScoreNewFrame3 = function ( LosingTeamScoreNew, event )
						if not event.interrupted then
							LosingTeamScoreNew:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						LosingTeamScoreNew:setAlpha( 1 )
						LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
						LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
						LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
						LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
						LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
						LosingTeamScoreNew:setShaderVector( 4, 0, 0, 0, 0 )
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
				self.LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 4, 0, 0, 0, 0 )
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
				local PlayerTimeToBeatBoxFrame2 = function ( PlayerTimeToBeatBox, event )
					local PlayerTimeToBeatBoxFrame3 = function ( PlayerTimeToBeatBox, event )
						if not event.interrupted then
							PlayerTimeToBeatBox:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						PlayerTimeToBeatBox:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( PlayerTimeToBeatBox, event )
						else
							PlayerTimeToBeatBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PlayerTimeToBeatBoxFrame3( PlayerTimeToBeatBox, event )
						return 
					else
						PlayerTimeToBeatBox:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						PlayerTimeToBeatBox:registerEventHandler( "transition_complete_keyframe", PlayerTimeToBeatBoxFrame3 )
					end
				end
				
				PlayerTimeToBeatBox:completeAnimation()
				self.PlayerTimeToBeatBox:setAlpha( 0 )
				PlayerTimeToBeatBoxFrame2( PlayerTimeToBeatBox, {} )
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
				local f76_local10 = function ( f94_arg0, f94_arg1 )
					if not f94_arg1.interrupted then
						f94_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
					end
					f94_arg0:setAlpha( 1 )
					if f94_arg1.interrupted then
						self.clipFinished( f94_arg0, f94_arg1 )
					else
						f94_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EnemyTimeToBeatBox:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
				EnemyTimeToBeatBox:setAlpha( 0 )
				EnemyTimeToBeatBox:registerEventHandler( "transition_complete_keyframe", f76_local10 )
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
				self:setupElementClipCounter( 22 )
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
					WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
					WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
					WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
					WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
					WinningTeamScoreNew:setShaderVector( 4, 0, 0.02, 0, 0 )
					if event.interrupted then
						self.clipFinished( WinningTeamScoreNew, event )
					else
						WinningTeamScoreNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WinningTeamScoreNew:completeAnimation()
				self.WinningTeamScoreNew:setAlpha( 1 )
				self.WinningTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.WinningTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.WinningTeamScoreNew:setShaderVector( 4, 0, 0.02, 0, 0 )
				WinningTeamScoreNewFrame2( WinningTeamScoreNew, {} )
				local LosingTeamScoreNewFrame2 = function ( LosingTeamScoreNew, event )
					if not event.interrupted then
						LosingTeamScoreNew:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					LosingTeamScoreNew:setAlpha( 0 )
					LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
					LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
					LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
					LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
					LosingTeamScoreNew:setShaderVector( 4, 0, 0.02, 0, 0 )
					if event.interrupted then
						self.clipFinished( LosingTeamScoreNew, event )
					else
						LosingTeamScoreNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LosingTeamScoreNew:completeAnimation()
				self.LosingTeamScoreNew:setAlpha( 1 )
				self.LosingTeamScoreNew:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.LosingTeamScoreNew:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 1, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 2, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 3, 0, 0, 0, 0 )
				self.LosingTeamScoreNew:setShaderVector( 4, 0, 0.02, 0, 0 )
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
				PlayerTimeToBeatBox:completeAnimation()
				self.PlayerTimeToBeatBox:setAlpha( 0 )
				self.clipFinished( PlayerTimeToBeatBox, {} )
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
				EnemyTimeToBeatBox:completeAnimation()
				self.EnemyTimeToBeatBox:setAlpha( 0 )
				self.clipFinished( EnemyTimeToBeatBox, {} )
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
							TransitionImageBottom:setTopBottom( false, true, 0, 360 )
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
						TransitionImageBottom:setTopBottom( false, true, -360, 0 )
						TransitionImageBottom:setAlpha( 1 )
						TransitionImageBottom:registerEventHandler( "transition_complete_keyframe", TransitionImageBottomFrame3 )
					end
				end
				
				TransitionImageBottom:completeAnimation()
				self.TransitionImageBottom:setLeftRight( true, true, 0, 0 )
				self.TransitionImageBottom:setTopBottom( false, true, 0, 360 )
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
								TitleNew:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
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
							TitleNew:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							TitleNew:setAlpha( 0.82 )
							TitleNew:registerEventHandler( "transition_complete_keyframe", TitleNewFrame4 )
						end
					end
					
					if event.interrupted then
						TitleNewFrame3( TitleNew, event )
						return 
					else
						TitleNew:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						TitleNew:setAlpha( 0 )
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
			end,
			ShowFFATie = function ()
				self:setupElementClipCounter( 4 )
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
			end,
			End_Transition_FFA = function ()
				self:setupElementClipCounter( 12 )
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
				local FFATopPlayerInfoFrame2 = function ( FFATopPlayerInfo, event )
					if not event.interrupted then
						FFATopPlayerInfo:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FFATopPlayerInfo:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FFATopPlayerInfo, event )
					else
						FFATopPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FFATopPlayerInfo:completeAnimation()
				self.FFATopPlayerInfo:setAlpha( 1 )
				FFATopPlayerInfoFrame2( FFATopPlayerInfo, {} )
				local FFAFirstRunnerUpPlayerInfoFrame2 = function ( FFAFirstRunnerUpPlayerInfo, event )
					if not event.interrupted then
						FFAFirstRunnerUpPlayerInfo:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FFAFirstRunnerUpPlayerInfo:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FFAFirstRunnerUpPlayerInfo, event )
					else
						FFAFirstRunnerUpPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FFAFirstRunnerUpPlayerInfo:completeAnimation()
				self.FFAFirstRunnerUpPlayerInfo:setAlpha( 1 )
				FFAFirstRunnerUpPlayerInfoFrame2( FFAFirstRunnerUpPlayerInfo, {} )
				local FFASecondRunnerUpPlayerInfoFrame2 = function ( FFASecondRunnerUpPlayerInfo, event )
					if not event.interrupted then
						FFASecondRunnerUpPlayerInfo:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FFASecondRunnerUpPlayerInfo:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FFASecondRunnerUpPlayerInfo, event )
					else
						FFASecondRunnerUpPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FFASecondRunnerUpPlayerInfo:completeAnimation()
				self.FFASecondRunnerUpPlayerInfo:setAlpha( 1 )
				FFASecondRunnerUpPlayerInfoFrame2( FFASecondRunnerUpPlayerInfo, {} )
				PlayerTimeToBeatBox:completeAnimation()
				self.PlayerTimeToBeatBox:setAlpha( 0 )
				self.clipFinished( PlayerTimeToBeatBox, {} )
				EnemyTimeToBeatBox:completeAnimation()
				self.EnemyTimeToBeatBox:setAlpha( 0 )
				self.clipFinished( EnemyTimeToBeatBox, {} )
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
				local TransitionImageBottomFrame2 = function ( TransitionImageBottom, event )
					local TransitionImageBottomFrame3 = function ( TransitionImageBottom, event )
						local TransitionImageBottomFrame4 = function ( TransitionImageBottom, event )
							if not event.interrupted then
								TransitionImageBottom:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
							end
							TransitionImageBottom:setLeftRight( true, true, 0, 0 )
							TransitionImageBottom:setTopBottom( false, true, 0, 360 )
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
						TransitionImageBottom:setTopBottom( false, true, -360, 0 )
						TransitionImageBottom:setAlpha( 1 )
						TransitionImageBottom:registerEventHandler( "transition_complete_keyframe", TransitionImageBottomFrame3 )
					end
				end
				
				TransitionImageBottom:completeAnimation()
				self.TransitionImageBottom:setLeftRight( true, true, 0, 0 )
				self.TransitionImageBottom:setTopBottom( false, true, 0, 360 )
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
								TitleNew:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
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
							TitleNew:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							TitleNew:setAlpha( 0.82 )
							TitleNew:registerEventHandler( "transition_complete_keyframe", TitleNewFrame4 )
						end
					end
					
					if event.interrupted then
						TitleNewFrame3( TitleNew, event )
						return 
					else
						TitleNew:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						TitleNew:setAlpha( 0 )
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
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanelR:close()
		element.LeftPanelL:close()
		element.VignetteBack:close()
		element.FFATopPlayerInfo:close()
		element.FFAFirstRunnerUpPlayerInfo:close()
		element.FFASecondRunnerUpPlayerInfo:close()
		element.WinningTeamScoreNew:close()
		element.LosingTeamScoreNew:close()
		element.WinningTeamFactionNameNew:close()
		element.WinningTeamFactionIconNew:close()
		element.PlayerTimeToBeatBox:close()
		element.LosingTeamFactionNameNew:close()
		element.LosingTeamFactionIconNew:close()
		element.EnemyTimeToBeatBox:close()
		element.SubTitleNew:close()
		element.VSBanner:close()
		element.WinnerFactionInfo:close()
		element.TitleNew:close()
		element.MatchBonusWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

