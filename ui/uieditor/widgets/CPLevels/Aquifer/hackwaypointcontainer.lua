-- 294f34d2ec075d92f1def7ae539a0d9e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPLevels.Aquifer.HackWaypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1.objId then
		f1_arg0.objId = f1_arg1.objId
		local f1_local0 = f1_arg0.Waypoint
		f1_local0.objective = f1_arg0.objective
		f1_local0:setupWaypoint( f1_arg1 )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.Waypoint:update( f2_arg1 )
	if f2_arg1.objState ~= nil then
		if f2_arg1.objState == CoD.OBJECTIVESTATE_DONE then
			f2_arg0:setState( "Done" )
			f2_arg0.Waypoint:onDone()
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
	return true
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.update = f0_local1
	f4_arg0.shouldShow = f0_local2
	f4_arg0.setupWaypointContainer = f0_local0
end

CoD.HackWaypointContainer = InheritFrom( LUI.UIElement )
CoD.HackWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HackWaypointContainer )
	self.id = "HackWaypointContainer"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Waypoint = CoD.HackWaypoint.new( menu, controller )
	Waypoint:setLeftRight( true, false, 608, 672 )
	Waypoint:setTopBottom( true, false, 328, 392 )
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
				Waypoint:completeAnimation()
				self.Waypoint:setAlpha( 0 )
				self.clipFinished( Waypoint, {} )
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

