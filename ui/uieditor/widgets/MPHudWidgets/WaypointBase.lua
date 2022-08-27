-- eba4c5eeb1fbd628127ee0417e3f9a29
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.WaypointWidgetContainer" )

if not CoD.isCampaign and not CoD.isZombie then
	require( "ui.uieditor.widgets.HUD.Flag.CTFOverlay" )
end
local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controller
	if not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and (not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) or CoD.isCampaign == true) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and (not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or CoD.isMultiplayer == true) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
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

local f0_local9 = function ( f10_arg0, f10_arg1, f10_arg2 )
	if f10_arg2 then
		local f10_local0 = CoD.FractureOverlay.new( f10_arg2, f10_arg1 )
		f10_local0:setLeftRight( true, true, 0, 0 )
		f10_local0:setTopBottom( true, true, 0, 0 )
		f10_arg0:addElement( f10_local0 )
		f10_arg0.FractureOverlay = f10_local0
	end
end

local f0_local10 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = 0
	for f11_local1 = 1, #f11_arg0.WaypointContainerList, 1 do
		if f11_arg0.WaypointContainerList[f11_local1].gameTypeContainer.objId == f11_arg1 then
			f11_local0 = f11_local1
			break
		end
	end
	if 0 < f11_local0 then
		f11_arg0.WaypointContainerList[f11_local0].gameTypeContainer:close()
		f11_arg0.WaypointContainerList[f11_local0]:close()
		table.remove( f11_arg0.WaypointContainerList, f11_local0 )
		return true
	else
		return false
	end
end

local f0_local11 = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = Engine.DvarString( nil, "g_gametype" )
	if f12_local0 == "ctf" then
		f0_local3( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "dem" then
		f0_local4( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "sd" then
		f0_local5( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "sr" then
		f0_local5( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "koth" then
		f0_local8( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "ball" then
		f0_local6( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "escort" then
		f0_local7( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "clean" then
		f0_local9( f12_arg0, f12_arg1, f12_arg2 )
	elseif f12_local0 == "infect" then
		f0_local5( f12_arg0, f12_arg1, f12_arg2 )
	end
	f12_arg0.removeWaypoint = f0_local10
	f12_arg0.WaypointWidgetContainer:setAlpha( 0 )
	local f12_local1 = function ( f13_arg0 )
		f0_local0( f12_arg0, {
			name = "visibility_update",
			controller = f12_arg1
		} )
	end
	
	local f12_local2 = Engine.GetModelForController( f12_arg1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), f12_local1 )
	f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), f12_local1 )
	if IsMultiplayer() then
		f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), f12_local1 )
		f12_arg0:subscribeToModel( Engine.GetModel( f12_local2, "CodCaster.profileSettingsUpdated" ), f12_local1 )
	end
	local f12_local3 = f12_arg0.close
	f12_arg0.close = function ( f14_arg0 )
		while #f14_arg0.WaypointContainerList >= 1 do
			f14_arg0.WaypointContainerList[1]:close()
			table.remove( f14_arg0.WaypointContainerList, 1 )
		end
		if f14_arg0.SDOverlay ~= nil then
			f14_arg0.SDOverlay:close()
			f14_arg0.SDOverlay = nil
		end
		if f14_arg0.CTFOverlay ~= nil then
			f14_arg0.CTFOverlay:close()
			f14_arg0.CTFOverlay = nil
		end
		if f14_arg0.DemOverlay ~= nil then
			f14_arg0.DemOverlay:close()
			f14_arg0.DemOverlay = nil
		end
		if f14_arg0.KOTHOverlay ~= nil then
			f14_arg0.KOTHOverlay:close()
			f14_arg0.KOTHOverlay = nil
		end
		if f14_arg0.BallOverlay ~= nil then
			f14_arg0.BallOverlay:close()
			f14_arg0.BallOverlay = nil
		end
		if f14_arg0.EscortOverlay ~= nil then
			f14_arg0.EscortOverlay:close()
			f14_arg0.EscortOverlay = nil
		end
		f12_local3( f14_arg0 )
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
	if f0_local11 then
		f0_local11( self, controller, menu )
	end
	return self
end

