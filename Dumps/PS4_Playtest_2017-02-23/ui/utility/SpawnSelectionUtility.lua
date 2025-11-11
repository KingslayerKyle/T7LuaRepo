CoD.SpawnSelectionUtility = {}
CoD.SpawnSelectionUtility.MAX_REGIONS = 20
CoD.SpawnSelectionUtility.MAX_FORWARD_SPAWNS = 8
CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef = function ( index )
	return "SpawnRegionMarker" .. index
end

CoD.SpawnSelectionUtility.GetForwardSpawnMarkerStringRef = function ( index )
	return "ForwardSpawnMarker" .. index
end

CoD.SpawnSelectionUtility.GetForwardSpawnConnectorStringRef = function ( index )
	return "ForwardSpawnConnector" .. index
end

CoD.SpawnSelectionUtility.SelectSpawnRegion = function ( spawnSelectMap, spawnRegionMarker, controller )
	local cursor = spawnSelectMap.SpawnRegionCursor
	if cursor then
		local cursorWidthHalf = cursor:getWidth() / 2
		local cursorHeightHalf = cursor:getHeight() / 2
		local markerCenter = CoD.BaseUtility.GetElementCenterVec( spawnRegionMarker )
		local left = markerCenter.x - cursorWidthHalf
		local right = markerCenter.x + cursorWidthHalf
		local top = markerCenter.y - cursorHeightHalf
		local bottom = markerCenter.y + cursorHeightHalf
		local SetFocusToRegion = function ( element, event )
			cursor:playClip( "Acquire" )
			local success = spawnRegionMarker:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			if success then
				spawnSelectMap.selectedRegion = spawnRegionMarker
			end
		end
		
		cursor:playClip( "Release" )
		cursor:beginAnimation( "move", 100, true, true )
		cursor:setLeftRight( 0, 0, left, right )
		cursor:setTopBottom( 0, 0, top, bottom )
		cursor:registerEventHandler( "transition_complete_keyframe", SetFocusToRegion )
	end
end

CoD.SpawnSelectionUtility.DeselectSpawnRegion = function ( spawnRegionMarker, controller )
	spawnRegionMarker:processEvent( {
		name = "lose_focus",
		controller = controller
	} )
	spawnRegionMarker:playClip( "DefaultClip" )
end

CoD.SpawnSelectionUtility.UpdateLeftStickVector = function ( spawnSelectMap, controller )
	local stickVec = CoD.BaseUtility.GetLeftStickVector( controller )
	stickVec.y = -stickVec.y
	spawnSelectMap.leftStickVector = stickVec
end

CoD.SpawnSelectionUtility.FindTargetedSpawnRegion = function ( self, controller )
	local selectedRegion = self.selectedRegion
	if not selectedRegion then
		DebugPrint( "^1LUI - SpawnSelect: ^2invalid selectedRegion in FindTargetSpawnRegion" )
		return 
	end
	local ll, lt, lr, lb = selectedRegion:getLocalRect()
	local selectedCenterVec = CoD.BaseUtility.GetElementCenterVec( selectedRegion )
	local leftStickVector = self.leftStickVector
	local potentialTargets = {}
	for index = 0, CoD.SpawnSelectionUtility.MAX_REGIONS - 1, 1 do
		local markerStringRef = CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef( index )
		local marker = self[markerStringRef]
		if marker then
			local enemyOwned = CoD.SpawnSelectionUtility.IsSpawnRegionOwnedByEnemy( controller, marker )
			if not enemyOwned and marker ~= selectedRegion then
				local targetCenterVec = CoD.BaseUtility.GetElementCenterVec( marker )
				local targetVec = CoD.BaseUtility.Vec2Sub( targetCenterVec, selectedCenterVec )
				local targetLeftStickDot = CoD.BaseUtility.Vec2Dot( leftStickVector, targetVec )
				if targetLeftStickDot > 0 then
					local vecRej = CoD.BaseUtility.Vec2Reject( targetVec, leftStickVector )
					local hitDist = CoD.BaseUtility.Vec2LenSq( vecRej )
					table.insert( potentialTargets, {
						marker = marker,
						hitDist = hitDist
					} )
				end
			end
		end
	end
	if #potentialTargets > 0 then
		local SortTargets = function ( a, b )
			return a.hitDist < b.hitDist
		end
		
		table.sort( potentialTargets, SortTargets )
		return potentialTargets[1].marker
	end
	return nil
end

CoD.SpawnSelectionUtility.FindRecommendedSpawnRegion = function ( self, controller, menu )
	local recommendedRegion = nil
	for index = 0, CoD.SpawnSelectionUtility.MAX_REGIONS - 1, 1 do
		local markerStringRef = CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef( index )
		local marker = self[markerStringRef]
		if marker then
			local available = CoD.SpawnSelectionUtility.IsSpawnRegionAvailable( controller, marker )
			local teamOwned = CoD.SpawnSelectionUtility.IsSpawnRegionOwnedByTeam( controller, marker )
			if available and teamOwned then
				local isForwardSpawn = CoD.SpawnSelectionUtility.IsSpawnRegionForwardSpawn( controller, marker )
				if isForwardSpawn then
					recommendedRegion = marker
					break
				elseif not recommendedRegion then
					recommendedRegion = marker
				end
			end
		end
	end
	return recommendedRegion
end

CoD.SpawnSelectionUtility.PositionMarker = function ( self, controller )
	local spawnSelectionMap = self:getParent()
	local markerModel = self:getModel()
	if spawnSelectionMap and markerModel then
		local mapWidth, mapHeight = spawnSelectionMap:getLocalSize()
		local northwestX, northwestY, southeastX, southeastY = Engine.GetCompassCorners( controller )
		local northX, northY = Engine.GetCompassNorth( controller )
		if northwestX == nil or northX == nil then
			return 
		end
		local x = markerModel.origin.x:get()
		local y = markerModel.origin.y:get()
		local markerWidth, markerHeight = self:getLocalSize()
		local xOffset, yOffset = nil
		if x and y then
			if math.abs( northX ) > 0 then
				xOffset = (y - northwestY) / (southeastY - northwestY) * mapWidth
				yOffset = (x - northwestX) / (southeastX - northwestX) * mapHeight
			elseif math.abs( northY ) > 0 then
				xOffset = (x - northwestX) / (southeastX - northwestX) * mapWidth
				yOffset = (y - northwestY) / (southeastY - northwestY) * mapHeight
			end
			local xPos = xOffset - markerWidth * 0.5
			local yPos = yOffset - markerHeight * 0.5
			self:setLeftRight( 0, 0, xPos, xPos + markerWidth )
			self:setTopBottom( 0, 0, yPos, yPos + markerHeight )
		end
	end
end

CoD.SpawnSelectionUtility.FindTargetedSpawnBeacon = function ( self, controller )
	local selectedRegion = self.selectedRegion
	if not selectedRegion then
		DebugPrint( "^1LUI - SpawnSelect: ^2invalid selectedRegion in FindTargetSpawnRegion" )
		return 
	end
	local ll, lt, lr, lb = selectedRegion:getLocalRect()
	local selectedCenterVec = CoD.BaseUtility.GetElementCenterVec( selectedRegion )
	local leftStickVector = self.leftStickVector
	local potentialTargets = {}
	for objId, marker in pairs( self.beacons ) do
		local targetCenterVec = CoD.BaseUtility.GetElementCenterVec( marker )
		local targetVec = CoD.BaseUtility.Vec2Sub( targetCenterVec, selectedCenterVec )
		local targetLeftStickDot = CoD.BaseUtility.Vec2Dot( leftStickVector, targetVec )
		if targetLeftStickDot > 0 then
			local vecRej = CoD.BaseUtility.Vec2Reject( targetVec, leftStickVector )
			local hitDist = CoD.BaseUtility.Vec2LenSq( vecRej )
			table.insert( potentialTargets, {
				marker = marker,
				hitDist = hitDist
			} )
		end
	end
	if #potentialTargets > 0 then
		local SortTargets = function ( a, b )
			return a.hitDist < b.hitDist
		end
		
		table.sort( potentialTargets, SortTargets )
		return potentialTargets[1].marker
	end
	return nil
end

CoD.SpawnSelectionUtility.MoveSelectionToTargetedBeacon = function ( self, controller, menu )
	if not self.SpawnSelectionMap then
		return 
	end
	local selectedRegion = self.SpawnSelectionMap.selectedRegion
	local targetedRegion = CoD.SpawnSelectionUtility.FindTargetedSpawnBeacon( self.SpawnSelectionMap, controller )
	if selectedRegion and targetedRegion then
		CoD.SpawnSelectionUtility.DeselectSpawnRegion( selectedRegion, controller )
		CoD.SpawnSelectionUtility.SelectSpawnRegion( self.SpawnSelectionMap, targetedRegion, controller )
	end
end

CoD.SpawnSelectionUtility.PositionSpawnBeacon = function ( self, controller, objId )
	local posX, posY, posZ = Engine.GetObjectiveEntityPosition( controller, objId )
	if not posX then
		return 
	end
	local marker = self.beacons[objId]
	if marker then
		local mapWidth, mapHeight = self:getLocalSize()
		local northwestX, northwestY, southeastX, southeastY = Engine.GetCompassCorners( controller )
		local northX, northY = Engine.GetCompassNorth( controller )
		local markerWidth, markerHeight = marker:getLocalSize()
		local xOffset, yOffset = nil
		if math.abs( northX ) > 0 then
			xOffset = (posY - northwestY) / (southeastY - northwestY) * mapWidth
			yOffset = (posX - northwestX) / (southeastX - northwestX) * mapHeight
		elseif math.abs( northY ) > 0 then
			xOffset = (posX - northwestX) / (southeastX - northwestX) * mapWidth
			yOffset = (posY - northwestY) / (southeastY - northwestY) * mapHeight
		end
		local xPos = xOffset - markerWidth * 0.5
		local yPos = yOffset - markerHeight * 0.5
		marker:setLeftRight( 0, 0, xPos, xPos + markerWidth )
		marker:setTopBottom( 0, 0, yPos, yPos + markerHeight )
	end
end

CoD.SpawnSelectionUtility.IsObjectiveInActiveState = function ( state )
	local f16_local0
	if state ~= Enum.objectiveState_t.OBJST_ACTIVE and state ~= Enum.objectiveState_t.OBJST_INVISIBLE then
		f16_local0 = false
	else
		f16_local0 = true
	end
	return f16_local0
end

CoD.SpawnSelectionUtility.AddSpawnBeacon = function ( self, controller, menu, objId )
	local marker = CoD.SpawnRegionMarker.new( menu, controller )
	marker.objId = objId
	self.beacons[objId] = marker
	self:addElement( marker )
	marker.SpawnRegionName.Name:setText( Engine.Localize( "MPUI_SPAWN_BEACON" ) )
	CoD.SpawnSelectionUtility.PositionSpawnBeacon( self, controller, objId )
	CoD.SpawnSelectionUtility.DeselectSpawnRegion( marker, controller )
end

CoD.SpawnSelectionUtility.RemoveSpawnBeacon = function ( self, controller, objId )
	local marker = self.beacons[objId]
	if marker then
		marker:close()
		self.beacons[objId] = nil
	end
end

CoD.SpawnSelectionUtility.SetupSpawnBeacon = function ( self, controller, menu, objId )
	local objName = Engine.GetObjectiveName( controller, objId )
	if objName == "spawnbeacon_objective" then
		local subscription = self.beaconSubs[objId]
		if not subscription then
			local perControllerModel = Engine.GetModelForController( controller )
			local objectiveModel = Engine.GetModel( perControllerModel, "objective" .. objId )
			local objectiveStateModel = objectiveModel.state
			self.beaconSubs[objId] = self:subscribeToModel( objectiveStateModel, function ( model )
				local state = Engine.GetModelValue( model )
				if not CoD.SpawnSelectionUtility.IsObjectiveInActiveState( state ) then
					CoD.SpawnSelectionUtility.RemoveSpawnBeacon( self, controller, objId )
					local autospawnMarker = self.AutoSpawnMarker
					if autospawnMarker then
						CoD.SpawnSelectionUtility.SelectSpawnRegion( self, autospawnMarker, controller )
					end
				end
			end )
		end
	end
end

CoD.SpawnSelectionUtility.GenerateSpawnBeacons = function ( self, controller, menu )
	for objId, subscription in pairs( self.beaconSubs ) do
		local perControllerModel = Engine.GetModelForController( controller )
		local objectiveModel = Engine.GetModel( perControllerModel, "objective" .. objId )
		local objectiveState = objectiveModel.state:get()
		local isObjectiveActive = CoD.SpawnSelectionUtility.IsObjectiveInActiveState( objectiveState )
		local selfTeam = CoD.TeamUtility.GetTeamID( controller )
		local objectiveTeam = Engine.GetObjectiveTeam( controller, objId )
		if selfTeam == objectiveTeam and isObjectiveActive then
			if not self.beacons[objId] then
				CoD.SpawnSelectionUtility.AddSpawnBeacon( self, controller, menu, objId )
			end
		end
		CoD.SpawnSelectionUtility.RemoveSpawnBeacon( self, controller, objId )
	end
end

CoD.SpawnSelectionUtility.SetupSpawnSelectControls = function ( self, controller, menu, element )
	element:subscribeToGlobalModel( controller, "LeftStick", "Length", function ( model )
		if CoD.SpawnSelectionUtility.IsSpawnSelectActive( controller ) then
			local length = model:get()
			if element.primed then
				if length < 0.2 then
					element.primed = false
					CoD.SpawnSelectionUtility.MoveSelectionToTargetedBeacon( self, controller, menu )
				end
			elseif length > 0.3 then
				CoD.SpawnSelectionUtility.UpdateLeftStickVector( element, controller )
				element.primed = true
			end
		end
	end )
	element:subscribeToGlobalModel( controller, "LeftStick", "Degrees", function ( model )
		if CoD.SpawnSelectionUtility.IsSpawnSelectActive( controller ) then
			CoD.SpawnSelectionUtility.UpdateLeftStickVector( element, controller )
		end
	end )
	element:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS ), function ( model )
		if CoD.SpawnSelectionUtility.IsSpawnSelectActive( controller ) and not menu.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) and not menu.m_disableAllButtonActions then
			local selectedRegion = element.selectedRegion
			if selectedRegion then
				SendOwnMenuResponse( menu, controller, selectedRegion.objId )
				CoD.SpawnSelectionUtility.DeselectSpawnRegion( selectedRegion, controller )
			end
		end
	end, false )
end

CoD.SpawnSelectionUtility.SetupSpawnSelectionMap = function ( self, controller, menu )
	self.beacons = {}
	self.beaconSubs = {}
	local autospawnMarker = self.AutoSpawnMarker
	autospawnMarker.SpawnRegionName.Name:setText( Engine.Localize( "MPUI_AUTO_SPAWN" ) )
	autospawnMarker.objId = -1
	self.beacons[-1] = autospawnMarker
	if not self.newObjSubscription then
		local newObjModel = Engine.CreateModel( Engine.GetModelForController( controller ), "newObjective" )
		self.newObjSubscription = self:subscribeToModel( newObjModel, function ( model )
			local objId = Engine.GetModelValue( model )
			if objId then
				CoD.SpawnSelectionUtility.SetupSpawnBeacon( self, controller, menu, objId )
			end
		end )
	end
end

CoD.SpawnSelectionUtility.SelectRecommendedSpawnRegion = function ( self, controller, menu )
	local marker = self.AutoSpawnMarker
	CoD.SpawnSelectionUtility.SelectSpawnRegion( self, marker, controller )
	CoD.SpawnSelectionUtility.GenerateSpawnBeacons( self, controller, menu )
end

CoD.SpawnSelectionUtility.SendMenuResponseForRecommendedRegion = function ( self, controller, menu, element )
	if element then
		SendOwnMenuResponse( menu, controller, 0 )
	end
end

CoD.SpawnSelectionUtility.SetupSpawnSelectionMap_Old = function ( self, controller, menu )
	local spawnSelectEnabled = Engine.GetGametypeSetting( "spawnSelectEnabled" )
	if spawnSelectEnabled == 1 then
		CoD.SpawnSelectionUtility.SetupSpawnRegionMarkerModels( self, controller, menu )
		CoD.SpawnSelectionUtility.SetupForwardSpawnMarkerModels( self, controller, menu )
		CoD.SpawnSelectionUtility.AddDynamicElements( self, controller, menu )
		CoD.SpawnSelectionUtility.PositionSpawnRegionMarkers( self, controller, menu )
		CoD.SpawnSelectionUtility.PositionForwardSpawnMarkers( self, controller, menu )
		CoD.SpawnSelectionUtility.PositionForwardSpawnConnectors( self, controller, menu )
	end
end

CoD.SpawnSelectionUtility.AddDynamicElements = function ( self, controller, menu )
	local AddMapElements = function ( maxIndex, stringRefFunc )
		for index = 0, maxIndex - 1, 1 do
			local stringRef = stringRefFunc( index )
			local elem = self[stringRef]
			if elem then
				self:addElement( elem )
			end
		end
	end
	
	local RemoveMapElements = function ( maxIndex, stringRefFunc )
		for index = 1, maxIndex - 1, 1 do
			local stringRef = stringRefFunc( index )
			local elem = self[stringRef]
			if elem then
				elem:close()
				self[stringRef] = nil
			end
		end
	end
	
	AddMapElements( CoD.SpawnSelectionUtility.MAX_REGIONS, CoD.SpawnSelectionUtility.GetForwardSpawnConnectorStringRef )
	AddMapElements( CoD.SpawnSelectionUtility.MAX_REGIONS, CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef )
	AddMapElements( CoD.SpawnSelectionUtility.MAX_FORWARD_SPAWNS, CoD.SpawnSelectionUtility.GetForwardSpawnMarkerStringRef )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		RemoveMapElements( CoD.SpawnSelectionUtility.MAX_REGIONS, CoD.SpawnSelectionUtility.GetForwardSpawnConnectorStringRef )
		RemoveMapElements( CoD.SpawnSelectionUtility.MAX_REGIONS, CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef )
		RemoveMapElements( CoD.SpawnSelectionUtility.MAX_FORWARD_SPAWNS, CoD.SpawnSelectionUtility.GetForwardSpawnMarkerStringRef )
	end )
end

CoD.SpawnSelectionUtility.SetupSpawnRegionMarkerModels = function ( self, controller, menu )
	for index = 0, CoD.SpawnSelectionUtility.MAX_REGIONS - 1, 1 do
		local markerStringRef = CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef( index )
		local spawnMarkerModel = Engine.GetModel( Engine.GetGlobalModel(), "spawngroupStatus." .. index )
		if spawnMarkerModel and spawnMarkerModel.regionName then
			local markerName = spawnMarkerModel.regionName:get()
			if markerName then
				local marker = self[markerStringRef]
				if not marker then
					marker = CoD.SpawnRegionMarker.new( menu, controller )
					self[markerStringRef] = marker
				else
					self:removeElement( marker )
				end
				local f35_local2 = spawnMarkerModel:create( "noContextWidget" )
				f35_local2:set( true )
				marker.spawnIndex = index
				marker:setModel( spawnMarkerModel )
				local connectorStringRef = CoD.SpawnSelectionUtility.GetForwardSpawnConnectorStringRef( index )
				local connector = self[connectorStringRef]
				local isForwardSpawn = spawnMarkerModel.isForwardSpawn:get()
				if not connector then
					if isForwardSpawn == 1 then
						connector = CoD.ForwardSpawnConnector.new( menu, controller )
						self[connectorStringRef] = connector
						connector:setModel( spawnMarkerModel )
					end
				end
				if isForwardSpawn == 1 then
					self:removeElement( connector )
					connector:setModel( spawnMarkerModel )
				else
					connector:close()
					self[connectorStringRef] = nil
				end
			end
		end
	end
end

CoD.SpawnSelectionUtility.PositionSpawnRegionMarkers = function ( self, controller, menu )
	for index = 0, CoD.SpawnSelectionUtility.MAX_REGIONS - 1, 1 do
		local markerStringRef = CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef( index )
		local marker = self[markerStringRef]
		if marker then
			local markerModel = marker:getModel()
			if markerModel then
				local vis = markerModel.visStatus:get()
				if vis == 1 then
					CoD.SpawnSelectionUtility.PositionMarker( marker, controller )
				end
				marker:subscribeToModel( markerModel.visStatus, function ( model )
					local vis = model:get()
					if vis == 1 then
						CoD.SpawnSelectionUtility.PositionMarker( marker, controller )
					end
				end )
			end
		end
	end
end

CoD.SpawnSelectionUtility.PositionForwardSpawnConnectors = function ( self, controller, menu )
	local forwardSpawnStringRef = CoD.SpawnSelectionUtility.GetForwardSpawnMarkerStringRef( 0 )
	local forwardSpawn = self[forwardSpawnStringRef]
	if not forwardSpawn then
		return 
	end
	local forwardSpawnCenterVec = CoD.BaseUtility.GetElementCenterVec( forwardSpawn )
	for index = 0, CoD.SpawnSelectionUtility.MAX_REGIONS - 1, 1 do
		local regionStringRef = CoD.SpawnSelectionUtility.GetSpawnRegionMarkerStringRef( index )
		local region = self[regionStringRef]
		if region then
			local connectorStringRef = CoD.SpawnSelectionUtility.GetForwardSpawnConnectorStringRef( index )
			local connector = self[connectorStringRef]
			if connector then
				local connectorWidth, connectorHeight = connector:getLocalSize()
				local regionCenterVec = CoD.BaseUtility.GetElementCenterVec( region )
				local connectorCenterVec = CoD.BaseUtility.Vec2Add( forwardSpawnCenterVec, regionCenterVec )
				connectorCenterVec = CoD.BaseUtility.Vec2Scale( connectorCenterVec, 0.5 )
				local regionForwardSpawnVec = CoD.BaseUtility.Vec2Sub( regionCenterVec, forwardSpawnCenterVec )
				local connectorLen = math.sqrt( CoD.BaseUtility.Vec2LenSq( regionForwardSpawnVec ) )
				connector:setLeftRight( 0, 0, connectorCenterVec.x - connectorLen / 2, connectorCenterVec.x + connectorLen / 2 )
				connector:setTopBottom( 0, 0, connectorCenterVec.y - connectorHeight / 2, connectorCenterVec.y + connectorHeight / 2 )
				local heading = CoD.BaseUtility.Vec2Dot( regionForwardSpawnVec, {
					x = 1,
					y = 0
				} )
				local angle = math.deg( math.atan( regionForwardSpawnVec.y / regionForwardSpawnVec.x ) )
				if heading < 0 then
					angle = angle + 180
				end
				connector:setZRot( -angle )
			end
		end
	end
end

CoD.SpawnSelectionUtility.SelectRecommendedSpawnRegion_Old = function ( self, controller, menu )
	local recommendedRegion = CoD.SpawnSelectionUtility.FindRecommendedSpawnRegion( self, controller, menu )
	if recommendedRegion then
		CoD.SpawnSelectionUtility.SelectSpawnRegion( self, recommendedRegion, controller )
	end
end

CoD.SpawnSelectionUtility.AddRecommendedSelectionTimer = function ( self, controller, menu )
	local spawnMap = self.SpawnSelectionMap
	if spawnMap then
		self:addElement( LUI.UITimer.newElementTimer( 50, true, function ( element, event )
			CoD.SpawnSelectionUtility.SelectRecommendedSpawnRegion( spawnMap, controller, menu )
		end ) )
	end
end

CoD.SpawnSelectionUtility.SetupForwardSpawnMarkerModels = function ( self, controller, menu )
	for index = 0, CoD.SpawnSelectionUtility.MAX_FORWARD_SPAWNS - 1, 1 do
		local markerStringRef = CoD.SpawnSelectionUtility.GetForwardSpawnMarkerStringRef( index )
		local forwardSpawnModel = Engine.GetModel( Engine.GetGlobalModel(), "forwardspawns." .. index )
		if forwardSpawnModel then
			local xPos = forwardSpawnModel.origin.x:get()
			if xPos then
				local marker = self[markerStringRef]
				if not marker then
					marker = CoD.ForwardSpawnMarker.new( menu, controller )
					self[markerStringRef] = marker
				else
					self:removeElement( marker )
				end
				local f42_local2 = forwardSpawnModel:create( "noContextWidget" )
				f42_local2:set( true )
				marker:setModel( forwardSpawnModel )
			end
		end
	end
end

CoD.SpawnSelectionUtility.PositionForwardSpawnMarkers = function ( self, controller, menu )
	for index = 0, CoD.SpawnSelectionUtility.MAX_FORWARD_SPAWNS - 1, 1 do
		local markerStringRef = CoD.SpawnSelectionUtility.GetForwardSpawnMarkerStringRef( index )
		local marker = self[markerStringRef]
		if marker then
			local markerModel = marker:getModel()
			if markerModel then
				CoD.SpawnSelectionUtility.PositionMarker( marker, controller )
			end
		end
	end
end

CoD.SpawnSelectionUtility.SendMenuResponseForRecommendedRegion_Old = function ( self, controller, menu, element )
	if element then
		local marker = CoD.SpawnSelectionUtility.FindRecommendedSpawnRegion( element, controller, self )
		if marker then
			local selectedRegion = element.selectedRegion
			if selectedRegion then
				CoD.SpawnSelectionUtility.DeselectSpawnRegion( selectedRegion, controller )
			end
			SetControllerModelValue( controller, "hudItems.spawnSelectedLocation", marker.spawnIndex )
			SendOwnMenuResponse( menu, controller, marker.spawnIndex )
		end
	end
end

CoD.SpawnSelectionUtility.MoveSelectionToTargetedRegion = function ( self, controller, menu )
	if not self.SpawnSelectionMap then
		return 
	end
	local selectedRegion = self.SpawnSelectionMap.selectedRegion
	local targetedRegion = CoD.SpawnSelectionUtility.FindTargetedSpawnRegion( self.SpawnSelectionMap, controller )
	if selectedRegion and targetedRegion then
		CoD.SpawnSelectionUtility.DeselectSpawnRegion( selectedRegion, controller )
		CoD.SpawnSelectionUtility.SelectSpawnRegion( self.SpawnSelectionMap, targetedRegion, controller )
	end
end

CoD.SpawnSelectionUtility.SetupSpawnSelectControls_Old = function ( self, controller, menu, element )
	element:subscribeToGlobalModel( controller, "LeftStick", "Length", function ( model )
		if CoD.SpawnSelectionUtility.IsSpawnSelectActive( controller ) then
			local length = model:get()
			if element.primed then
				if length < 0.2 then
					element.primed = false
					CoD.SpawnSelectionUtility.MoveSelectionToTargetedRegion( self, controller, menu )
				end
			elseif length > 0.3 then
				CoD.SpawnSelectionUtility.UpdateLeftStickVector( element, controller )
				element.primed = true
			end
		end
	end )
	element:subscribeToGlobalModel( controller, "LeftStick", "Degrees", function ( model )
		if CoD.SpawnSelectionUtility.IsSpawnSelectActive( controller ) then
			CoD.SpawnSelectionUtility.UpdateLeftStickVector( element, controller )
		end
	end )
	element:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS ), function ( model )
		if CoD.SpawnSelectionUtility.IsSpawnSelectActive( controller ) and not menu.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) and not menu.m_disableAllButtonActions then
			local selectedRegion = element.selectedRegion
			if selectedRegion then
				local available = CoD.SpawnSelectionUtility.IsSpawnRegionAvailable( controller, selectedRegion )
				local teamOwned = CoD.SpawnSelectionUtility.IsSpawnRegionOwnedByTeam( controller, selectedRegion )
				if available and teamOwned then
					SetControllerModelValue( controller, "hudItems.spawnSelectedLocation", selectedRegion.spawnIndex )
					SendOwnMenuResponse( menu, controller, selectedRegion.spawnIndex )
					CoD.SpawnSelectionUtility.DeselectSpawnRegion( selectedRegion, controller )
				end
			end
		end
	end, false )
end

CoD.SpawnSelectionUtility.IsSpawnRegionVisible = function ( controller, element )
	local model = element:getModel()
	if model and model.visStatus:get() == 1 then
		return true
	else
		return false
	end
end

CoD.SpawnSelectionUtility.IsSpawnRegionAvailable = function ( controller, element )
	local model = element:getModel()
	if model and model.useStatus:get() == 1 then
		return true
	else
		return false
	end
end

CoD.SpawnSelectionUtility.IsSpawnRegionForwardSpawn = function ( controller, element )
	local model = element:getModel()
	if model and model.isForwardSpawn:get() == 1 then
		return true
	else
		return false
	end
end

CoD.SpawnSelectionUtility.IsSpawnRegionNeutral = function ( controller, element )
	local model = element:getModel()
	if model then
		local teamNeutral = 3
		local team = model.team:get()
		return team == teamNeutral
	else
		return false
	end
end

CoD.SpawnSelectionUtility.IsSpawnRegionOwnedByTeam = function ( controller, element )
	local model = element:getModel()
	if model then
		local selfTeam = CoD.TeamUtility.GetTeamID( controller )
		local spawnRegionTeam = model.team:get()
		return selfTeam == spawnRegionTeam
	else
		return false
	end
end

CoD.SpawnSelectionUtility.IsSpawnRegionOwnedByEnemy = function ( controller, element )
	local teamOwned = CoD.SpawnSelectionUtility.IsSpawnRegionOwnedByTeam( controller, element )
	local teamNeutral = CoD.SpawnSelectionUtility.IsSpawnRegionNeutral( controller, element )
	local f55_local0
	if not teamOwned then
		f55_local0 = not teamNeutral
	else
		f55_local0 = false
	end
	return f55_local0
end

CoD.SpawnSelectionUtility.IsForwardSpawnVisible = function ( controller, element )
	local gametype = Engine.GetCurrentGameType()
	if gametype == "war" then
		local model = element:getModel()
		if model then
			local spawnZoneIndex = model.zone_index:get()
			local f56_local0 = Engine.GetModel( Engine.GetGlobalModel(), "hudItems.war.currentZone" )
			local currentZoneIndex = f56_local0:get()
			if spawnZoneIndex and spawnZoneIndex + 1 == currentZoneIndex then
				return true
			end
		end
		return false
	else
		return true
	end
end

CoD.SpawnSelectionUtility.IsForwardSpawnTeamActive = function ( controller, element )
	local selfTeam = CoD.TeamUtility.GetTeamID( controller )
	local f57_local0 = Engine.GetModel( Engine.GetGlobalModel(), "hudItems.war.forwardSpawnStatus" )
	local forwardSpawnStatus = f57_local0:get()
	return forwardSpawnStatus == selfTeam
end

CoD.SpawnSelectionUtility.IsForwardSpawnEnemyActive = function ( controller, element )
	local teamNone = 0
	local teamNeutral = 3
	local selfTeam = CoD.TeamUtility.GetTeamID( controller )
	local f58_local0 = Engine.GetModel( Engine.GetGlobalModel(), "hudItems.war.forwardSpawnStatus" )
	local forwardSpawnStatus = f58_local0:get()
	local f58_local1
	if selfTeam == forwardSpawnStatus or forwardSpawnStatus == teamNone or forwardSpawnStatus == teamNeutral then
		f58_local1 = false
	else
		f58_local1 = true
	end
	return f58_local1
end

CoD.SpawnSelectionUtility.IsForwardSpawnNeutral = function ( controller, element )
	local teamNone = 0
	local teamNeutral = 3
	local selfTeam = CoD.TeamUtility.GetTeamID( controller )
	local f59_local0 = Engine.GetModel( Engine.GetGlobalModel(), "hudItems.war.forwardSpawnStatus" )
	local forwardSpawnStatus = f59_local0:get()
	local f59_local1
	if forwardSpawnStatus ~= teamNeutral and forwardSpawnStatus ~= teamNone then
		f59_local1 = false
	else
		f59_local1 = true
	end
	return f59_local1
end

CoD.SpawnSelectionUtility.IsSpawnSelectActive = function ( controller )
	return IsModelValueEqualTo( controller, "hudItems.showSpawnSelect", 1 )
end

CoD.SpawnSelectionUtility.GetNameForSpawnUtilityIndex = function ( stringReturn )
	local f61_local0 = Engine.GetGlobalModel()
	local spawnModel = f61_local0.spawngroupStatus
	local spawnName = CoD.SafeGetModelValue( spawnModel, stringReturn .. ".regionName" )
	return spawnName or ""
end

