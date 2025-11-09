require( "ui.uieditor.widgets.MPHudWidgets.WaypointWidgetContainer" )
require( "ui.uieditor.widgets.HUD.Flag.CTFOverlay" )
require( "ui.uieditor.widgets.HUD.BombTimer.DemOverlay" )
require( "ui.uieditor.widgets.HUD.BombTimer.SDOverlay" )

local WaypointBase_UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and (not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) or CoD.isCampaign == true) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

local WaypointBase_Refresh = function ( self, event )
	for i = 1, #self.WaypointContainerList, 1 do
		local index = self.WaypointContainerList[i].gameTypeContainer.objId
		local objective_name = Engine.GetObjectiveName( event.controller, index )
		if objective_name and objective_name ~= "" then
			self.WaypointContainerList[i]:update( event )
		end
	end
	WaypointBase_UpdateVisibility( self, event )
end

local WaypointBase_GetParentMenu = function ( self )
	local menu = self
	while menu and not menu.menuName do
		menu = menu:getParent()
	end
	return menu
end

local WaypointBase_SetupCTFOverlay = function ( self, controller, menu )
	if menu then
		local CTFOverlay = CoD.CTFOverlay.new( menu, controller )
		CTFOverlay:setLeftRight( true, true, 0, 0 )
		CTFOverlay:setTopBottom( true, true, 0, 0 )
		menu:addElement( CTFOverlay )
		self.CTFOverlay = CTFOverlay
	end
end

local WaypointBase_SetupDemOverlay = function ( self, controller, menu )
	if menu then
		local DemOverlay = CoD.DemOverlay.new( menu, controller )
		DemOverlay:setLeftRight( true, true, 0, 0 )
		DemOverlay:setTopBottom( true, true, 0, 0 )
		menu:addElement( DemOverlay )
		self.DemOverlay = DemOverlay
	end
end

local WaypointBase_SetupSDOverlay = function ( self, controller, menu )
	if menu then
		local SDOverlay = CoD.SDOverlay.new( menu, controller )
		SDOverlay:setLeftRight( true, true, 0, 0 )
		SDOverlay:setTopBottom( true, true, 0, 0 )
		menu:addElement( SDOverlay )
		self.SDOverlay = SDOverlay
	end
end

local WaypointBase_RemoveWaypoint = function ( self, objId )
	local indexToRemove = 0
	for i = 1, #self.WaypointContainerList, 1 do
		if self.WaypointContainerList[i].gameTypeContainer.objId == objId then
			indexToRemove = i
			break
		end
	end
	if 0 < indexToRemove then
		self.WaypointContainerList[indexToRemove].gameTypeContainer:close()
		self.WaypointContainerList[indexToRemove]:close()
		table.remove( self.WaypointContainerList, indexToRemove )
		return true
	else
		return false
	end
end

local PostLoadFunc = function ( self, controller, menu )
	local gameType = Engine.DvarString( nil, "g_gametype" )
	if gameType == "ctf" then
		WaypointBase_SetupCTFOverlay( self, controller, menu )
	elseif gameType == "dem" then
		WaypointBase_SetupDemOverlay( self, controller, menu )
	elseif gameType == "sd" then
		WaypointBase_SetupSDOverlay( self, controller, menu )
	elseif gameType == "sr" then
		WaypointBase_SetupSDOverlay( self, controller, menu )
	end
	self.removeWaypoint = WaypointBase_RemoveWaypoint
	self.WaypointWidgetContainer:setAlpha( 0 )
	self:registerEventHandler( "hud_update_refresh", WaypointBase_Refresh )
	local UpdateVisibility_Internal = function ( model )
		WaypointBase_UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), UpdateVisibility_Internal )
	local originalClose = self.close
	self.close = function ( self )
		while #self.WaypointContainerList >= 1 do
			self.WaypointContainerList[1]:close()
			table.remove( self.WaypointContainerList, 1 )
		end
		if self.SDOverlay ~= nil then
			self.SDOverlay:close()
			self.SDOverlay = nil
		end
		if self.CTFOverlay ~= nil then
			self.CTFOverlay:close()
			self.CTFOverlay = nil
		end
		if self.DemOverlay ~= nil then
			self.DemOverlay:close()
			self.DemOverlay = nil
		end
		originalClose( self )
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
	
	self.close = function ( self )
		self.WaypointWidgetContainer:close()
		CoD.WaypointBase.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

