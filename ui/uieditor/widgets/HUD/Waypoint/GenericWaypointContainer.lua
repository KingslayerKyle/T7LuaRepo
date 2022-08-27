-- 41ce1c989e541fff957c83958fe331de
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1.objId then
		f1_arg0.objId = f1_arg1.objId
		local f1_local0 = f1_arg0.Waypoint
		f1_local0.objective = f1_arg0.objective
		f1_local0:setupWaypoint( f1_arg1 )
		if f1_local0.waypoint_image_default == nil then
			f1_local0:setState( "NoIcon" )
		else
			f1_local0:setState( "Default" )
			f1_local0.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f1_local0.waypoint_image_default ) )
		end
		local f1_local1 = f1_arg1.controller
		local f1_local2 = f1_arg0.objId
		if f1_local0.objective.minimapMaterial ~= nil then
			Engine.SetObjectiveIcon( f1_local1, f1_local2, CoD.GametypeBase.mapIconType, f1_local0.objective.minimapMaterial )
		else
			Engine.ClearObjectiveIcon( f1_local1, f1_local2, CoD.GametypeBase.mapIconType )
		end
		if f1_local0.waypoint_label_default == "" then
			f1_local0.WaypointText:setState( "NoText" )
		else
			f1_local0.WaypointText:setState( "Default" )
		end
		if f1_local0.objective.hide_arrow then
			f1_local0.WaypointArrowContainer:setState( "Invisible" )
		end
		f1_local0.WaypointText.text:setText( Engine.Localize( f1_local0.waypoint_label_default ) )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.Waypoint:update( f2_arg1 )
	if f2_arg1.objState ~= nil then
		if f2_arg1.objState == CoD.OBJECTIVESTATE_DONE then
			f2_arg0:setState( "Done" )
		else
			f2_arg0:setState( "Default" )
		end
		if f2_arg0.visible == true then
			f2_arg0:show()
		else
			f2_arg0:hide()
		end
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controller
	local f3_local1 = f3_arg0.Waypoint
	local f3_local2 = Engine.GetObjectiveTeam( f3_local0, f3_arg0.objId )
	if f3_local2 == Enum.team_t.TEAM_FREE or f3_local2 == Enum.team_t.TEAM_NEUTRAL then
		return true
	else
		return f3_local1:isOwnedByMyTeam( f3_local0 )
	end
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.update = f0_local1
	f4_arg0.shouldShow = f0_local2
	f4_arg0.setupWaypointContainer = f0_local0
end

CoD.GenericWaypointContainer = InheritFrom( LUI.UIElement )
CoD.GenericWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericWaypointContainer )
	self.id = "GenericWaypointContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Waypoint = CoD.Waypoint.new( menu, controller )
	Waypoint:setLeftRight( true, true, 600, -600 )
	Waypoint:setTopBottom( true, true, 315, -315 )
	self:addElement( Waypoint )
	self.Waypoint = Waypoint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Waypoint:completeAnimation()
				self.Waypoint:setAlpha( 1 )
				self.clipFinished( Waypoint, {} )
			end
		},
		Done = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local WaypointFrame2 = function ( Waypoint, event )
					if not event.interrupted then
						Waypoint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Waypoint:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Waypoint, event )
					else
						Waypoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Waypoint:completeAnimation()
				self.Waypoint:setAlpha( 1 )
				WaypointFrame2( Waypoint, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Waypoint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

