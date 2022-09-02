-- 625c4233ac9252119663162a81a4acfd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.WaypointCenter" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.GetObjectiveProgress( f1_arg1, f1_arg0.objId )
	local f1_local1 = Engine.ObjectiveIsTeamUsing( f1_arg1, f1_arg2, Enum.team_t.TEAM_ALLIES ) and Engine.ObjectiveIsAnyOtherTeamUsing( f1_arg1, f1_arg2, Enum.team_t.TEAM_ALLIES )
	local f1_local2 = Engine.ObjectiveGetTeamUsingCount( f1_arg1, f1_arg0.objId )
	if f1_local1 == true then
		f1_arg0.WaypointCenter:setState( "DefaultState" )
		f1_arg0.progressMeter:setRGB( 1, 0.4, 0 )
		f1_arg0.progressMeter:setShaderVector( 0, 1, 0, 0, 0 )
	else
		if f1_local2 == 1 and f1_arg0.pulse == true and f1_local0 > 0 then
			f1_arg0.WaypointCenter:setState( "Pulsing" )
		else
			f1_arg0.WaypointCenter:setState( "DefaultState" )
		end
		if f1_local0 <= 0 then
			f1_local0 = -0.05
		end
		f1_arg0.progressMeter:setRGB( 1, 1, 1 )
		f1_arg0.progressMeter:setShaderVector( 0, f1_local0, 0, 0, 0 )
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.updateProgress = f0_local0
end

CoD.CodCasterWaypoint = InheritFrom( LUI.UIElement )
CoD.CodCasterWaypoint.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterWaypoint )
	self.id = "CodCasterWaypoint"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local ProgressMeterFrame = LUI.UIImage.new()
	ProgressMeterFrame:setLeftRight( false, false, -26, 26 )
	ProgressMeterFrame:setTopBottom( false, false, -25, 25 )
	ProgressMeterFrame:setImage( RegisterImage( "uie_t7_hud_waypoints_new_framefill" ) )
	self:addElement( ProgressMeterFrame )
	self.ProgressMeterFrame = ProgressMeterFrame
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( false, false, -17, 17 )
	progressMeter:setTopBottom( false, false, -17, 17 )
	progressMeter:setAlpha( 0.9 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_diamond" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 0, 1.03, 0, 0, 0 )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	local WaypointCenter = CoD.WaypointCenter.new( menu, controller )
	WaypointCenter:setLeftRight( false, false, -14, 14 )
	WaypointCenter:setTopBottom( false, false, -14, 14 )
	WaypointCenter:setAlpha( 0.95 )
	self:addElement( WaypointCenter )
	self.WaypointCenter = WaypointCenter
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WaypointCenter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

