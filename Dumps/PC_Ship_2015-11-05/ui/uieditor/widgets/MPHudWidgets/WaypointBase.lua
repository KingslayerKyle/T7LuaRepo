require( "ui.uieditor.widgets.MPHudWidgets.WaypointWidgetContainer" )

if not CoD.isCampaign and not CoD.isZombie then
	require( "ui.uieditor.widgets.HUD.Flag.CTFOverlay" )
end
local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controller
	if not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and (not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) or CoD.isCampaign == true) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and (not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or CoD.isMultiplayer == true) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and (not CoD.IsShoutcaster( f1_local0 ) or CoD.ShoutcasterProfileVarBool( f1_local0, "shoutcaster_waypoint_markers" )) then
		if f1_arg0.visible ~= true then
			f1_arg0:setAlpha( 1 )
			f1_arg0.visible = true
		end
	elseif f1_arg0.visible == true then
		f1_arg0:setAlpha( 0 )
		f1_arg0.visible = nil
	end
	f1_arg0:dispatchEventToChildren( f1_arg1 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	for f2_local0 = 1, #f2_arg0.WaypointContainerList, 1 do
		local f2_local3 = Engine.GetObjectiveName( f2_arg1.controller, f2_arg0.WaypointContainerList[f2_local0].gameTypeContainer.objId )
		if f2_local3 and f2_local3 ~= "" then
			f2_arg0.WaypointContainerList[f2_local0]:update( f2_arg1 )
		end
	end
	f0_local0( f2_arg0, f2_arg1 )
end

local f0_local2 = function ( f3_arg0 )
	local f3_local0 = f3_arg0
	while f3_local0 and not f3_local0.menuName do
		f3_local0 = f3_local0:getParent()
	end
	return f3_local0
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg2 then
		local f4_local0 = CoD.CTFOverlay.new( f4_arg2, f4_arg1 )
		f4_local0:setLeftRight( true, true, 0, 0 )
		f4_local0:setTopBottom( true, true, 0, 0 )
		f4_arg0:addElement( f4_local0 )
		f4_arg0.CTFOverlay = f4_local0
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg2 then
		local f5_local0 = CoD.DemOverlay.new( f5_arg2, f5_arg1 )
		f5_local0:setLeftRight( true, true, 0, 0 )
		f5_local0:setTopBottom( true, true, 0, 0 )
		f5_arg0:addElement( f5_local0 )
		f5_arg0.DemOverlay = f5_local0
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	if f6_arg2 then
		local f6_local0 = CoD.SDOverlay.new( f6_arg2, f6_arg1 )
		f6_local0:setLeftRight( true, true, 0, 0 )
		f6_local0:setTopBottom( true, true, 0, 0 )
		f6_arg0:addElement( f6_local0 )
		f6_arg0.SDOverlay = f6_local0
	end
end

local f0_local6 = function ( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg2 then
		local f7_local0 = CoD.BallOverlay.new( f7_arg2, f7_arg1 )
		f7_local0:setLeftRight( true, true, 0, 0 )
		f7_local0:setTopBottom( true, true, 0, 0 )
		f7_arg0:addElement( f7_local0 )
		f7_arg0.BallOverlay = f7_local0
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg2 then
		local f8_local0 = CoD.EscortOverlay.new( f8_arg2, f8_arg1 )
		f8_local0:setLeftRight( true, true, 0, 0 )
		f8_local0:setTopBottom( true, true, 0, 0 )
		f8_arg0:addElement( f8_local0 )
		f8_arg0.EscortOverlay = f8_local0
	end
end

local f0_local8 = function ( f9_arg0, f9_arg1, f9_arg2 )
	if f9_arg2 then
		local f9_local0 = CoD.KOTHOverlay.new( f9_arg2, f9_arg1 )
		f9_local0:setLeftRight( true, true, 0, 0 )
		f9_local0:setTopBottom( true, true, 0, 0 )
		f9_arg0:addElement( f9_local0 )
		f9_arg0.KOTHOverlay = f9_local0
	end
end

local f0_local9 = function ( f10_arg0, f10_arg1 )
	local f10_local0 = 0
	for f10_local1 = 1, #f10_arg0.WaypointContainerList, 1 do
		if f10_arg0.WaypointContainerList[f10_local1].gameTypeContainer.objId == f10_arg1 then
			f10_local0 = f10_local1
			break
		end
	end
	if 0 < f10_local0 then
		f10_arg0.WaypointContainerList[f10_local0].gameTypeContainer:close()
		f10_arg0.WaypointContainerList[f10_local0]:close()
		table.remove( f10_arg0.WaypointContainerList, f10_local0 )
		return true
	else
		return false
	end
end

local f0_local10 = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = Engine.DvarString( nil, "g_gametype" )
	if f11_local0 == "ctf" then
		f0_local3( f11_arg0, f11_arg1, f11_arg2 )
	elseif f11_local0 == "dem" then
		f0_local4( f11_arg0, f11_arg1, f11_arg2 )
	elseif f11_local0 == "sd" then
		f0_local5( f11_arg0, f11_arg1, f11_arg2 )
	elseif f11_local0 == "sr" then
		f0_local5( f11_arg0, f11_arg1, f11_arg2 )
	elseif f11_local0 == "koth" then
		f0_local8( f11_arg0, f11_arg1, f11_arg2 )
	elseif f11_local0 == "ball" then
		f0_local6( f11_arg0, f11_arg1, f11_arg2 )
	elseif f11_local0 == "escort" then
		f0_local7( f11_arg0, f11_arg1, f11_arg2 )
	end
	f11_arg0.removeWaypoint = f0_local9
	f11_arg0.WaypointWidgetContainer:setAlpha( 0 )
	local f11_local1 = function ( f12_arg0 )
		f0_local0( f11_arg0, {
			controller = f11_arg1
		} )
	end
	
	local f11_local2 = Engine.GetModelForController( f11_arg1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), f11_local1 )
	f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), f11_local1 )
	if IsMultiplayer() then
		f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), f11_local1 )
		f11_arg0:subscribeToModel( Engine.GetModel( f11_local2, "CodCaster.profileSettingsUpdated" ), f11_local1 )
	end
	local f11_local3 = f11_arg0.close
	f11_arg0.close = function ( f13_arg0 )
		while #f13_arg0.WaypointContainerList >= 1 do
			f13_arg0.WaypointContainerList[1]:close()
			table.remove( f13_arg0.WaypointContainerList, 1 )
		end
		if f13_arg0.SDOverlay ~= nil then
			f13_arg0.SDOverlay:close()
			f13_arg0.SDOverlay = nil
		end
		if f13_arg0.CTFOverlay ~= nil then
			f13_arg0.CTFOverlay:close()
			f13_arg0.CTFOverlay = nil
		end
		if f13_arg0.DemOverlay ~= nil then
			f13_arg0.DemOverlay:close()
			f13_arg0.DemOverlay = nil
		end
		if f13_arg0.KOTHOverlay ~= nil then
			f13_arg0.KOTHOverlay:close()
			f13_arg0.KOTHOverlay = nil
		end
		if f13_arg0.BallOverlay ~= nil then
			f13_arg0.BallOverlay:close()
			f13_arg0.BallOverlay = nil
		end
		if f13_arg0.EscortOverlay ~= nil then
			f13_arg0.EscortOverlay:close()
			f13_arg0.EscortOverlay = nil
		end
		f11_local3( f13_arg0 )
	end
	
end

CoD.WaypointBase = InheritFrom( LUI.UIElement )
CoD.WaypointBase.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WaypointBase )
	self.id = "WaypointBase"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local WaypointWidgetContainer = CoD.WaypointWidgetContainer.new( menu, controller )
	WaypointWidgetContainer:setLeftRight( true, true, 0, 0 )
	WaypointWidgetContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( WaypointWidgetContainer )
	self.WaypointWidgetContainer = WaypointWidgetContainer
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WaypointWidgetContainer:close()
	end )
	if f0_local10 then
		f0_local10( self, controller, menu )
	end
	return self
end

