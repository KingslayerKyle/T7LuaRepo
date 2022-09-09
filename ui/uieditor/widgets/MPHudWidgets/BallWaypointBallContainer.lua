-- ed494b4b96ce97b6ba2de4a3ec85f898
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	local f1_local1 = f1_arg0.Waypoint
	local f1_local2 = Engine.GetObjectiveEntity( f1_arg1, f1_arg2 ) < Dvar.com_maxclients:get()
	local f1_local3 = nil
	local f1_local4 = Engine.GetObjectiveGamemodeFlags( f1_arg1, f1_arg2 )
	if f1_local4 == f1_arg0.objectiveUpload then
		f1_local0.waypointType = f1_arg0.waypoint_label_upload
		f1_local0.imagename = f1_arg0.waypoint_image_upload
		f1_local0.imagecolor = CoD.white
	elseif f1_local4 == f1_arg0.objectiveDownload then
		f1_local0.waypointType = f1_arg0.waypoint_label_download
		f1_local0.imagename = f1_arg0.waypoint_image_download
		f1_local0.imagecolor = CoD.white
	elseif f1_local2 == true then
		if f1_local1:isOwnedByMyTeam( f1_arg1 ) then
			f1_local0.waypointType = f1_arg0.waypoint_label_escort
			f1_local0.imagename = f1_arg0.waypoint_image_escort
			f1_local0.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
		else
			f1_local0.waypointType = f1_arg0.waypoint_label_kill
			f1_local0.imagename = f1_arg0.waypoint_image_kill
			f1_local0.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
			if Engine.GetGametypeSetting( "enemyCarrierVisible" ) == 2 then
				f1_local3 = true
			end
		end
	else
		f1_local0.waypointType = f1_arg0.waypoint_label_grab
		f1_local0.imagename = f1_arg0.waypoint_image_grab
		f1_local0.imagecolor = CoD.white
	end
	if f1_local2 == true then
		f1_local1.zOffset = f1_arg0.waypoint_player_z_offset
	else
		f1_local1.zOffset = f1_arg0.waypoint_base_z_offset
	end
	f1_local1:setPing( f1_local3 )
	return f1_local0
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetObjectiveTeam( f2_arg0, f2_arg1 )
	local f2_local1 = Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "ballGametype" )
	local f2_local2 = Engine.Localize( "MPUI_BALL_HOME" )
	if f2_local0 == Enum.team_t.TEAM_ALLIES or f2_local0 == Enum.team_t.TEAM_AXIS then
		f2_local2 = Engine.GetGamertagForClient( f2_arg0, Engine.GetObjectiveEntity( f2_arg0, f2_arg1 ) )
	elseif Engine.GetModelValue( Engine.CreateModel( f2_local1, "ballAway" ) ) == 1 then
		f2_local2 = Engine.Localize( "MPUI_BALL_AWAY" )
	end
	Engine.SetModelValue( Engine.CreateModel( f2_local1, "ballStatusText" ), f2_local2 )
	if CoD.IsShoutcaster( f2_arg0 ) then
		Engine.SetModelValue( Engine.CreateModel( f2_local1, "ballHeldByFriendly" ), f2_local0 == Enum.team_t.TEAM_ALLIES )
		Engine.SetModelValue( Engine.CreateModel( f2_local1, "ballHeldByEnemy" ), f2_local0 == Enum.team_t.TEAM_AXIS )
	else
		local f2_local3 = CoD.GetTeamID( f2_arg0 )
		Engine.SetModelValue( Engine.CreateModel( f2_local1, "ballHeldByFriendly" ), f2_local0 == f2_local3 )
		local f2_local4 = Engine.SetModelValue
		local f2_local5 = Engine.CreateModel( f2_local1, "ballHeldByEnemy" )
		local f2_local6
		if f2_local0 == f2_local3 or f2_local0 == Enum.team_t.TEAM_NEUTRAL then
			f2_local6 = false
		else
			f2_local6 = true
		end
		f2_local4( f2_local5, f2_local6 )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0.Waypoint
	local f3_local1 = f3_arg1.controller
	local f3_local2 = f3_arg0.objId
	local f3_local3 = Engine.ObjectiveGetTeamUsingCount( f3_local1, f3_local2 )
	local f3_local4 = Engine.GetObjectiveEntity( f3_local1, f3_local2 )
	local f3_local5 = f0_local0( f3_arg0, f3_local1, f3_local2 )
	if f3_local5.imagename then
		f3_local0.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f3_local5.imagename ) )
		if f3_local5.imagecolor then
			f3_local0.WaypointCenter.waypointCenterImage:setRGB( f3_local5.imagecolor.r, f3_local5.imagecolor.g, f3_local5.imagecolor.b )
		end
	end
	if f3_local5.waypointType then
		f3_local0.WaypointText.text:setText( Engine.Localize( f3_local5.waypointType ) )
	end
	local f3_local6 = f3_local5.imagename .. "_mini"
	if f3_arg0.visible == true then
		f3_arg0:show()
		f3_local0:update( f3_arg1 )
		f3_local0:setCompassObjectiveIcon( f3_local1, f3_local2, f3_local6, f3_local5.imagecolor )
		Engine.SetObjectiveIgnoreEntity( f3_local1, f3_local2, CoD.GametypeBase.mapIconType, f3_local0.ping == true )
	else
		f3_arg0:hide()
		f3_local0:clearCompassObjectiveIcon( f3_local1, f3_local2 )
	end
	f0_local1( f3_local1, f3_local2 )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if f4_arg1.objId then
		f4_arg0.objId = f4_arg1.objId
		local f4_local0 = f4_arg0.Waypoint
		f4_local0.objective = f4_arg0.objective
		f4_local0:setupWaypoint( f4_arg1 )
		local f4_local1 = f4_arg0.objective.id
		f4_arg0.waypoint_label_grab = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_label_grab" )
		f4_arg0.waypoint_label_escort = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_label_escort" )
		f4_arg0.waypoint_label_kill = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_label_kill" )
		f4_arg0.waypoint_label_upload = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_label_upload" )
		f4_arg0.waypoint_label_download = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_label_download" )
		f4_arg0.waypoint_image_grab = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image_grab" )
		f4_arg0.waypoint_image_escort = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image_escort" )
		f4_arg0.waypoint_image_kill = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image_kill" )
		f4_arg0.waypoint_image_upload = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image_upload" )
		f4_arg0.waypoint_image_download = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image_download" )
		f4_arg0.waypoint_player_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f4_local1, "waypoint_player_z_offset" )
		f4_arg0.waypoint_base_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f4_local1, "waypoint_z_offset" )
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.controller
	if f5_arg0.Waypoint:isOwnedByMyTeam( f5_local0 ) and Engine.GetObjectiveEntity( f5_local0, f5_arg0.objId ) and Engine.GetGametypeSetting( "enemyCarrierVisible" ) == 0 then
		return false
	else
		return true
	end
end

local PostLoadFunc = function ( f6_arg0 )
	f6_arg0.update = f0_local2
	f6_arg0.setupWaypointContainer = f0_local3
	f6_arg0.shouldShow = f0_local4
	f6_arg0.objectiveNormal = 0
	f6_arg0.objectiveUpload = 1
	f6_arg0.objectiveDownload = 2
end

CoD.BallWaypointBallContainer = InheritFrom( LUI.UIElement )
CoD.BallWaypointBallContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BallWaypointBallContainer )
	self.id = "BallWaypointBallContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Waypoint = CoD.Waypoint.new( menu, controller )
	Waypoint:setLeftRight( true, true, 600, -600 )
	Waypoint:setTopBottom( true, true, 315, -315 )
	self:addElement( Waypoint )
	self.Waypoint = Waypoint
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Waypoint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
