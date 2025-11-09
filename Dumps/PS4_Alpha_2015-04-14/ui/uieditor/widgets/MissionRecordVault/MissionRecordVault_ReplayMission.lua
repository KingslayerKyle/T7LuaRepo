require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ReplayMissionMapInfo" )

local PostLoadFunc = function ( self, controller, menu )
	local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
	if nextMapNameModel == nil then
		return 
	end
	local mapName = Engine.GetModelValue( nextMapNameModel )
	local selectedMissionModel = Engine.CreateModel( menu:getModel(), "selectedMission" )
	Engine.CreateModel( selectedMissionModel, "mapName" )
	Engine.CreateModel( selectedMissionModel, "mapNameCaps" )
	Engine.CreateModel( selectedMissionModel, "previewImage" )
	Engine.CreateModel( selectedMissionModel, "mapLocation" )
	Engine.CreateModel( selectedMissionModel, "mapDescription" )
	Engine.CreateModel( selectedMissionModel, "collectiblesFound" )
	Engine.CreateModel( selectedMissionModel, "collectiblesTotal" )
	local currentMap = self.MapList:findItem( nil, {
		mapId = mapName
	}, false, nil )
	if currentMap ~= nil then
		self.MapList:setActiveItem( currentMap )
	end
end

CoD.MissionRecordVault_ReplayMission = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ReplayMission.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ReplayMission )
	self.id = "MissionRecordVault_ReplayMission"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 534 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MapList = LUI.UIList.new( menu, controller, 4, 0, nil, true, false, 0, 0, false, false )
	MapList:makeFocusable()
	MapList:setLeftRight( true, false, 0, 280 )
	MapList:setTopBottom( true, false, 0, 356 )
	MapList:setRGB( 1, 1, 1 )
	MapList:setDataSource( "MissionRecordVaultMaps" )
	MapList:setWidgetType( CoD.List1ButtonLarge_PH )
	MapList:setVerticalCount( 10 )
	MapList:setSpacing( 4 )
	MapList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		SendMenuResponseExpression( controller, "MissionRecordVaultMenu", element.mapId )
		MRV_ClickReplayMission( menu, element )
		return retVal
	end )
	MapList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		MRV_SelectReplayMission( menu, element, controller )
		return retVal
	end )
	self:addElement( MapList )
	self.MapList = MapList
	
	local MissionRecordVaultReplayMissionMapInfo = CoD.MissionRecordVault_ReplayMissionMapInfo.new( menu, controller )
	MissionRecordVaultReplayMissionMapInfo:setLeftRight( true, false, 341, 1106 )
	MissionRecordVaultReplayMissionMapInfo:setTopBottom( true, false, 0, 534 )
	MissionRecordVaultReplayMissionMapInfo:setRGB( 1, 1, 1 )
	MissionRecordVaultReplayMissionMapInfo:linkToElementModel( self, "selectedMission", false, function ( model )
		MissionRecordVaultReplayMissionMapInfo:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultReplayMissionMapInfo )
	self.MissionRecordVaultReplayMissionMapInfo = MissionRecordVaultReplayMissionMapInfo
	
	MapList.id = "MapList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MapList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.MapList:close()
		self.MissionRecordVaultReplayMissionMapInfo:close()
		CoD.MissionRecordVault_ReplayMission.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

