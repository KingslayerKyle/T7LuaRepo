if not CoD.isCampaign and not CoD.isZombie then
	require( "ui.uieditor.widgets.MPHudWidgets.DomWaypointContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.KothWaypointContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.BallWaypointBallContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.BallWaypointGoalContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.CtfWaypointFlagContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.CtfWaypointBaseContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.DemWaypointContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.EscortWaypointGoalContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.EscortWaypointRobotContainer" )
	require( "ui.uieditor.widgets.MPHudWidgets.SDWaypointContainer" )
end
if not CoD.isZombie then
	require( "ui.uieditor.widgets.HUD.Waypoint.GenericWaypointContainer" )
end
local f0_local0 = {}
local f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controller
	local f1_local1 = f1_arg0.gameTypeContainer.objId
	local f1_local2 = Engine.GetObjectiveState( f1_local0, f1_local1 )
	if f1_local2 ~= CoD.OBJECTIVESTATE_ACTIVE and f1_local2 ~= CoD.OBJECTIVESTATE_CURRENT and f1_local2 ~= CoD.OBJECTIVESTATE_DONE then
		return false
	elseif Engine.GetObjectiveEntity( f1_local0, f1_local1 ) == Engine.GetPredictedClientNum( f1_local0 ) then
		return false
	elseif f1_arg0.gameTypeContainer.shouldShow ~= nil then
		return f1_arg0.gameTypeContainer:shouldShow( f1_arg1 )
	else
		return true
	end
end

local f0_local2 = function ( f2_arg0, f2_arg1 )
	if not f0_local1( f2_arg0, f2_arg1 ) then
		f2_arg0.gameTypeContainer.visible = false
	else
		f2_arg0.gameTypeContainer.visible = true
	end
	f2_arg0.gameTypeContainer:update( f2_arg1 )
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controller
	local f3_local1 = f3_arg0.objective.id
	local f3_local2 = f3_arg0.objective.gametype
	if f3_local2 == nil then
		f3_local2 = ""
	end
	if f3_local2 == "dom" then
		local gameTypeContainer = CoD.DomWaypointContainer.new( f3_arg0.menu, f3_local0 )
		f3_arg0:addElement( gameTypeContainer )
		f3_arg0.gameTypeContainer = gameTypeContainer
		
	elseif f3_local2 == "koth" then
		local gameTypeContainer = CoD.KothWaypointContainer.new( f3_arg0.menu, f3_local0 )
		f3_arg0:addElement( gameTypeContainer )
		f3_arg0.gameTypeContainer = gameTypeContainer
		
	elseif f3_local2 == "dem" then
		local gameTypeContainer = CoD.DemWaypointContainer.new( f3_arg0.menu, f3_local0 )
		f3_arg0:addElement( gameTypeContainer )
		f3_arg0.gameTypeContainer = gameTypeContainer
		
	elseif f3_local2 == "ctf" then
		local gameTypeContainer = nil
		if f3_local1 == "axis_flag" or f3_local1 == "allies_flag" then
			gameTypeContainer = CoD.CtfWaypointFlagContainer.new( f3_arg0.menu, f3_local0 )
		elseif f3_local1 == "axis_base" or f3_local1 == "allies_base" then
			gameTypeContainer = CoD.CtfWaypointBaseContainer.new( f3_arg0.menu, f3_local0 )
		end
		if gameTypeContainer ~= nil then
			f3_arg0:addElement( gameTypeContainer )
			f3_arg0.gameTypeContainer = gameTypeContainer
			
		end
	elseif f3_local2 == "ball" then
		local gameTypeContainer = nil
		if f3_local1 == "ball_ball" then
			gameTypeContainer = CoD.BallWaypointBallContainer.new( f3_arg0.menu, f3_local0 )
		elseif f3_local1 == "ball_goal_allies" or f3_local1 == "ball_goal_axis" then
			gameTypeContainer = CoD.BallWaypointGoalContainer.new( f3_arg0.menu, f3_local0 )
		end
		if gameTypeContainer ~= nil then
			f3_arg0:addElement( gameTypeContainer )
			f3_arg0.gameTypeContainer = gameTypeContainer
			
		end
	elseif f3_local2 == "escort" then
		local gameTypeContainer = nil
		if f3_local1 == "escort_goal" then
			gameTypeContainer = CoD.EscortWaypointGoalContainer.new( f3_arg0.menu, f3_local0 )
		elseif f3_local1 == "escort_robot" then
			gameTypeContainer = CoD.EscortWaypointRobotContainer.new( f3_arg0.menu, f3_local0 )
		end
		if gameTypeContainer ~= nil then
			f3_arg0:addElement( gameTypeContainer )
			f3_arg0.gameTypeContainer = gameTypeContainer
			
		end
	elseif f3_local2 == "sd" or f3_local2 == "sr" then
		local gameTypeContainer = CoD.SDWaypointContainer.new( f3_local0 )
		gameTypeContainer:setLeftRight( true, true, 0, 0 )
		gameTypeContainer:setTopBottom( true, true, 0, 0 )
		f3_arg0:addElement( gameTypeContainer )
		f3_arg0.gameTypeContainer = gameTypeContainer
		
	else
		local gameTypeContainer = CoD.GenericWaypointContainer
		if f3_local1 ~= nil then
			gameTypeContainer = f0_local0[f3_local1] or gameTypeContainer
		end
		local f3_local4 = gameTypeContainer.new( f3_arg0.menu, f3_local0 )
		f3_arg0:addElement( f3_local4 )
		f3_arg0.gameTypeContainer = f3_local4
	end
	f3_arg0.gameTypeContainer.objective = f3_arg0.objective
	f3_arg0.gameTypeContainer:setupWaypointContainer( f3_arg1 )
end

local f0_local4 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.update = f0_local2
	f4_arg0.setupWaypoint = f0_local3
	f4_arg0.menu = f4_arg2
end

CoD.WaypointWidgetContainer = InheritFrom( LUI.UIElement )
CoD.WaypointWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WaypointWidgetContainer )
	self.id = "WaypointWidgetContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	if f0_local4 then
		f0_local4( self, controller, menu )
	end
	return self
end

