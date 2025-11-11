CoD.HUDUtility = {}
CoD.HUDUtility.MaxObjectiveFlagOverrides = 5
CoD.HUDUtility.SUPPLY_DROP_CRATE_STATE_NONE = 0
CoD.HUDUtility.SUPPLY_DROP_CRATE_STATE_CAPTURE = 1
CoD.HUDUtility.SUPPLY_DROP_CRATE_STATE_HACK = 2
CoD.HUDUtility.SUPPLY_DROP_CRATE_STATE_DISARM = 3
CoD.HUDUtility.BATTERY_STATE_HOME = 0
CoD.HUDUtility.BATTERY_STATE_DELIVERED = 1
CoD.HUDUtility.BATTERY_STATE_CARRIED = 2
CoD.HUDUtility.BATTERY_STATE_AWAY = 3
CoD.HUDUtility.BATTERY_STATE_ATTACKED = 4
CoD.HUDUtility.MinimapMode = {
	MODE_ROTATING = 0,
	MODE_FIXED = 1
}
CoD.HUDUtility.GetCachedObjective = function ( objectiveName )
	if objectiveName == nil then
		return nil
	elseif CoD.HUDUtility.ObjectivesTable[objectiveName] ~= nil then
		return CoD.HUDUtility.ObjectivesTable[objectiveName]
	else
		local objective = Engine.GetObjectiveInfo( objectiveName )
		CoD.HUDUtility.ObjectivesTable[objectiveName] = objective
		return objective
	end
end

CoD.HUDUtility.GetObjectiveAndUpdateCache = function ( objectiveName )
	if objectiveName ~= nil then
		CoD.HUDUtility.ObjectivesTable[objectiveName] = nil
	end
	return CoD.HUDUtility.GetCachedObjective( objectiveName )
end

CoD.HUDUtility.ObjectiveHasAnyTextFlagOverrides = function ( objective )
	for i = 1, CoD.HUDUtility.MaxObjectiveFlagOverrides, 1 do
		local base = "textFlag" .. i
		if objective[base] or objective[base .. "Friendly"] or objective[base .. "Enemy"] then
			return true
		end
	end
	return false
end

CoD.HUDUtility.ObjectiveHasAnyImageFlagOverrides = function ( objective )
	for i = 1, CoD.HUDUtility.MaxObjectiveFlagOverrides, 1 do
		local base = "waypointImageFlag" .. i
		if objective[base] then
			return true
		end
	end
end

CoD.HUDUtility.ShouldSwapObjectiveTeams = function ( controller, objective, objectiveId )
	local gameModeFlag = Engine.GetObjectiveGamemodeFlags( controller, objectiveId )
	return objective["swapTeamsFlag" .. gameModeFlag] == 1
end

CoD.HUDUtility.ObjectiveUpdated = function ( self, controller, objective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
	local icon = objective.waypoint_image
	local text = objective.waypoint_text
	local color = ColorSet.White
	local objectiveTeam = Engine.GetObjectiveTeam( controller, objId )
	local myTeam = Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) )
	local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, objId, myTeam )
	local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, objId, myTeam )
	if objectiveTeam ~= Enum.team_t.TEAM_NEUTRAL and objectiveTeam ~= Enum.team_t.TEAM_FREE then
		local f6_local0 = false
	else
		local isNeutral = true
	end
	local f6_local1 = objectiveTeam == myTeam
	local gameModeFlag = Engine.GetObjectiveGamemodeFlags( controller, objId )
	local f6_local2 = objectiveModel:create( "gamemodeFlags" )
	f6_local2:set( gameModeFlag )
	if not f6_local0 and (not (gameModeFlag ~= 1 or objective.swapTeamsFlag1 ~= 1) or gameModeFlag == 2 and objective.swapTeamsFlag2 == 1) then
		f6_local1 = not f6_local1
	end
	if f6_local0 then
		text = objective.textNeutral or text
		if isPlayerTeamUsing and isAnyOtherTeamUsing then
			text = objective.textBothUsingNeutral or text
		elseif isPlayerTeamUsing then
			text = objective.textFriendlyUsingNeutral or text
		elseif isAnyOtherTeamUsing then
			text = objective.textEnemyUsingNeutral or text
		end
	elseif f6_local1 then
		text = objective.textFriendlyOwned or text
		if objective.setColorByTeam == 1 then
			color = CoD.TeamUtility.GetColorSetFriendlyColor( controller, CoD.HUDUtility.WaypointGetTeam( controller, objId ) )
		end
		if isPlayerTeamUsing and isAnyOtherTeamUsing then
			text = objective.textBothUsingFriendly or text
		elseif isPlayerTeamUsing then
			text = objective.textFriendlyUsingFriendly or text
		elseif isAnyOtherTeamUsing then
			text = objective.textEnemyUsingFriendly or text
		end
	else
		text = objective.textEnemyOwned or text
		if objective.setColorByTeam == 1 then
			color = CoD.TeamUtility.GetColorSetEnemyColor( controller, CoD.HUDUtility.WaypointGetTeam( controller, objId ) )
		end
		if isPlayerTeamUsing and isAnyOtherTeamUsing then
			text = objective.textBothUsingEnemy or text
		elseif isPlayerTeamUsing then
			text = objective.textFriendlyUsingEnemy or text
		elseif isAnyOtherTeamUsing then
			text = objective.textEnemyUsingEnemy or text
		end
	end
	if isPlayerTeamUsing and isAnyOtherTeamUsing and objective.neutralColorWhenContested == 1 then
		color = ColorSet.White
	end
	if not isPlayerTeamUsing and not isAnyOtherTeamUsing and objective.yellowWhenNoPlayerUsing == 1 then
		color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "PlayerYellow" )
	end
	if gameModeFlag == 0 and objective.neutralColorWhenInactive == 1 then
		color = ColorSet.White
	end
	if isPlayerTeamUsing and isAnyOtherTeamUsing and objective.enemyColorWhenContested == 1 then
		color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyOrange" )
	end
	if CoD.HUDUtility.ObjectiveHasAnyTextFlagOverrides( objective ) then
		local baseFlag = "textFlag" .. gameModeFlag
		text = objective[baseFlag] or text
		if f6_local1 then
			text = objective[baseFlag .. "Friendly"] or text
		elseif not f6_local0 then
			text = objective[baseFlag .. "Enemy"] or text
		end
	end
	if CoD.HUDUtility.ObjectiveHasAnyImageFlagOverrides( objective ) then
		local baseFlag = "waypointImageFlag" .. gameModeFlag
		icon = objective[baseFlag] or icon
	end
	objectiveModel.icon:set( icon )
	objectiveModel.text:set( text )
	objectiveModel.color:set( string.format( "%d %d %d", color.r * 255, color.g * 255, color.b * 255 ) )
	local waypoint = waypointContainer[objId]
	if waypoint then
		CoD.HUDUtility.WaypointUpdateIconAndText( waypoint, controller, gameModeFlag )
	end
	local objectiveInfoWidget = objectiveInfoContainer[objId]
	if objectiveInfoWidget then
		
	else
		
	end
end

CoD.HUDUtility.InitWaypointHandlers = function ( self, controller, elementName_waypointContainer, pathOfObjectiveInfoContainer )
	local waypointContainer = self[elementName_waypointContainer]
	local objectiveInfoContainer = LUI.getTableFromPath( pathOfObjectiveInfoContainer, self )
	self.objectiveData = {}
	if CoD.HUDUtility.ObjectivesTable == nil then
		CoD.HUDUtility.ObjectivesTable = {}
	end
	local perControllerModel = Engine.GetModelForController( controller )
	if not self.hasCharacterIndexSubscription then
		local characterSelectionUpdatedModel = perControllerModel:create( "CharacterSelection.characterIndex" )
		self:subscribeToModel( characterSelectionUpdatedModel, function ( model )
			for objId, v in pairs( self.objectiveData ) do
				local objectiveName = Engine.GetObjectiveName( controller, objId )
				local objective = CoD.HUDUtility.GetCachedObjective( objectiveName )
				if objective ~= nil then
					local objectiveModel = Engine.GetModel( perControllerModel, "objective" .. objId )
					CoD.HUDUtility.ObjectiveUpdated( self, controller, objective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
					objectiveModel.state:forceNotifySubscriptions()
				end
			end
		end, false )
		self.hasCharacterIndexSubscription = true
	end
	local characterSelectionUpdatedModel = function ( controller, objId )
		local objectiveName = Engine.GetObjectiveName( controller, objId )
		local objective = CoD.HUDUtility.GetCachedObjective( objectiveName )
		if objective == nil then
			return 
		elseif not self.objectiveData[objId] then
			self.objectiveData[objId] = {
				state = Enum.objectiveState_t.OBJST_EMPTY,
				hasBaseSubscriptions = false
			}
		end
		local IsObjectiveInActiveState = function ( state )
			local f10_local0
			if state ~= Enum.objectiveState_t.OBJST_ACTIVE and state ~= Enum.objectiveState_t.OBJST_INVISIBLE then
				f10_local0 = false
			else
				f10_local0 = true
			end
			return f10_local0
		end
		
		local IsObjectiveInDoneState = function ( state )
			return state == Enum.objectiveState_t.OBJST_DONE
		end
		
		local objectiveData = self.objectiveData[objId]
		local oldState = objectiveData.state
		local state = Engine.GetObjectiveState( controller, objId )
		if IsObjectiveInActiveState( state ) and not IsObjectiveInActiveState( oldState ) and objective.notify_string ~= nil and objective.notify_string ~= "" then
			local f9_local0 = self:getParent()
			f9_local0.T7HudMenuGameMode.CommsSystemWidget:AddCommsEventMessage( {
				name = "comms_event_message",
				controller = controller,
				data = {
					objective.notify_string
				}
			} )
		end
		objectiveData.state = state
		local getWaypointWidget = function ( widget )
			if widget ~= "None" and widget ~= "" then
				return CoD[widget]
			else
				return nil
			end
		end
		
		local waypointWidget = getWaypointWidget( objective.widget )
		local objectiveInfoWidget = getWaypointWidget( objective.objectiveInfoWidget )
		if not waypointWidget and not objectiveInfoWidget then
			return 
		end
		local objectiveModel = Engine.GetModel( perControllerModel, "objective" .. objId )
		local objectiveStateModel = nil
		if objectiveModel then
			objectiveModel:set( objectiveName )
			objectiveStateModel = objectiveModel.state
			objectiveModel:create( "clamped" )
			objectiveModel:create( "direction" )
			objectiveModel:create( "text" )
			objectiveModel:create( "progress" )
			objectiveModel:create( "icon" )
			local f9_local1 = objectiveModel:create( "text" )
			f9_local1:set( "" )
			f9_local1 = objectiveModel:create( "id" )
			f9_local1:set( objectiveName )
			f9_local1 = objectiveModel:create( "objId" )
			f9_local1:set( objId )
			objectiveModel:create( "color" )
			objectiveModel:create( "team" )
			f9_local1 = objectiveModel:create( "isFarAway" )
			f9_local1:set( false )
			objectiveModel:create( "teamMask" )
			objectiveModel:create( "gamemodeFlags" )
			objectiveModel:create( "waypointUpdate" )
			f9_local1 = objectiveModel:create( "showWithAmmoState" )
			local f9_local2 = f9_local1
			f9_local1 = f9_local1.set
			local f9_local3 = objective.show_with_ammo_state
			if not f9_local3 then
				f9_local3 = Enum.ObjectiveAmmoTypes.OBJECTIVE_SHOWN_AMMO_STATE_ALL
			end
			f9_local1( f9_local2, f9_local3 )
			if not objectiveData.hasBaseSubscriptions then
				objectiveData.hasBaseSubscriptions = true
				self:subscribeToModel( objectiveModel.team, function ( model )
					local thisObjective = CoD.HUDUtility.GetCachedObjective( objectiveModel:get() )
					CoD.HUDUtility.ObjectiveUpdated( self, controller, thisObjective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
				end, false )
				self:subscribeToModel( objectiveModel.clientUseMask, function ( model )
					local thisObjective = CoD.HUDUtility.GetCachedObjective( objectiveModel:get() )
					CoD.HUDUtility.ObjectiveUpdated( self, controller, thisObjective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
				end, false )
				self:subscribeToModel( objectiveModel.updateTime, function ( model )
					local thisObjective = CoD.HUDUtility.GetCachedObjective( objectiveModel:get() )
					CoD.HUDUtility.ObjectiveUpdated( self, controller, thisObjective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
				end, false )
				self:subscribeToModel( objectiveModel:create( "forceUpdate" ), function ( model )
					local thisObjective = CoD.HUDUtility.GetCachedObjective( objectiveModel:get() )
					CoD.HUDUtility.ObjectiveUpdated( self, controller, thisObjective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
				end, false )
				self:subscribeToModel( objectiveModel.entNum, function ( model )
					local thisObjective = CoD.HUDUtility.GetCachedObjective( objectiveModel:get() )
					CoD.HUDUtility.ObjectiveUpdated( self, controller, thisObjective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
				end, false )
				self:subscribeToModel( objectiveModel.isFarAway, function ( model )
					local thisObjective = CoD.HUDUtility.GetCachedObjective( objectiveModel:get() )
					CoD.HUDUtility.ObjectiveUpdated( self, controller, thisObjective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
				end, false )
			end
		end
		CoD.HUDUtility.ObjectiveUpdated( self, controller, objective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
		if IsObjectiveInActiveState( state ) or IsObjectiveInDoneState( state ) then
			if waypointWidget then
				if true == Dvar.cg_luiDebug:get() then
					local f9_local1 = 0
					local child = waypointContainer:getFirstChild()
					while child ~= nil do
						f9_local1 = f9_local1 + 1
						child = child:getNextSibling()
					end
					DebugPrint( "Waypoint " .. objId .. ": " .. objectiveName .. ": " .. f9_local1 .. " waypoints active" )
				end
				local f9_local1 = waypointContainer[objId]
				if f9_local1 == nil then
					f9_local1 = waypointWidget.new( self, controller )
					f9_local1.objective = objective
					CoD.HUDUtility.SetupWaypoint( f9_local1, controller, objId )
					f9_local1:setModel( objectiveModel )
					waypointContainer:addElement( f9_local1 )
					waypointContainer[objId] = f9_local1
					f9_local1:subscribeToModel( objectiveStateModel, function ( model )
						local state = Engine.GetModelValue( model )
						if not IsObjectiveInActiveState( state ) then
							f9_local1:close()
							waypointContainer[objId] = nil
							Engine.ForceNotifyModelSubscriptions( model )
						end
					end )
					f9_local1:subscribeToModel( objectiveModel.clientUseMask, function ( model )
						CoD.HUDUtility.WaypointUpdate( f9_local1, controller )
					end )
					f9_local1:subscribeToModel( objectiveModel.team, function ( model )
						CoD.HUDUtility.WaypointUpdate( f9_local1, controller )
					end )
					f9_local1:subscribeToModel( objectiveModel.waypointUpdate, function ( model )
						CoD.HUDUtility.WaypointUpdate( f9_local1, controller )
					end )
					f9_local1:subscribeToModel( perControllerModel.interactivePrompt.activeObjectiveID, function ( model )
						local clientNum = Engine.GetPredictedClientNum( controller )
						local playerTeam = Engine.GetTeamID( controller, clientNum )
						local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, f9_local1.objId, playerTeam )
						local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, f9_local1.objId, playerTeam )
						CoD.HUDUtility.WaypointUpdateSnapToCenter( f9_local1, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
					end )
					local gameModeFlag = Engine.GetObjectiveGamemodeFlags( controller, f9_local1.objId )
					CoD.HUDUtility.WaypointUpdateIconAndText( f9_local1, controller, gameModeFlag )
				else
					f9_local1.objective = objective
					CoD.HUDUtility.SetupWaypoint( f9_local1, controller, objId )
				end
			end
			if objectiveInfoWidget then
				local f9_local1 = objectiveInfoContainer[objId]
				if not f9_local1 then
					f9_local1 = objectiveInfoWidget.new( self, controller )
					f9_local1.objective = objective
					f9_local1:setModel( objectiveModel )
					objectiveInfoContainer:addElement( f9_local1 )
					objectiveInfoContainer[objId] = f9_local1
					f9_local1:subscribeToModel( objectiveStateModel, function ( model )
						local state = model:get()
						if not IsObjectiveInActiveState( state ) then
							f9_local1:close()
							objectiveInfoContainer[objId] = nil
						end
					end )
				end
			end
		end
		return true
	end
	
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "newObjective" ), function ( model )
		local objId = Engine.GetModelValue( model )
		characterSelectionUpdatedModel( controller, objId )
	end, false )
	if LUI.DEV then
		self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "objectives.forceUpdate" ), function ( model )
			for objId, _ in pairs( self.objectiveData ) do
				local objectiveName = Engine.GetObjectiveName( controller, objId )
				local objective = CoD.HUDUtility.GetObjectiveAndUpdateCache( objectiveName )
				if waypointContainer[objId] then
					waypointContainer[objId].objective = objective
					CoD.HUDUtility.SetupWaypoint( waypointContainer[objId], controller, objId )
					CoD.HUDUtility.WaypointUpdate( waypointContainer[objId], controller )
				end
				local f26_local3 = Engine.GetModelForController( controller )
				local objectiveModel = f26_local3["objective" .. objId]
				CoD.HUDUtility.ObjectiveUpdated( self, controller, objective, objectiveModel, waypointContainer, objectiveInfoContainer, objId )
				objectiveModel.id:forceNotifySubscriptions()
				if waypointContainer[objId] then
					waypointContainer[objId]:processEvent( {
						name = "update_state"
					} )
				end
				if objectiveInfoContainer[objId] then
					objectiveInfoContainer[objId]:processEvent( {
						name = "update_state"
					} )
				end
			end
		end )
	end
	local gameTypeToOverlayClassTable = {
		ctf = CoD.CTFOverlay,
		dem = CoD.DemOverlay,
		sd = CoD.SDOverlay,
		sr = CoD.SDOverlay,
		koth = CoD.KOTHOverlay,
		ball = CoD.BallOverlay,
		escort = CoD.EscortOverlay,
		clean = CoD.FractureOverlay
	}
	local gameType = Engine.GetDvarString( "g_gametype" )
	local overlayClass = gameTypeToOverlayClassTable[gameType]
	if overlayClass and overlayClass.new then
		local overlay = overlayClass.new( self, controller )
		overlay:setLeftRight( 0, 1, 0, 0 )
		overlay:setTopBottom( 0, 1, 0, 0 )
		waypointContainer:addElement( overlay )
		waypointContainer.GameModeOverlay = overlay
	end
	Engine.ForceObjectiveRefresh( controller )
end

CoD.HUDUtility.UpdateBallModels = function ( controller, objectiveId )
	local team = Engine.GetObjectiveTeam( controller, objectiveId )
	local perControllerModel = Engine.GetModelForController( controller )
	local ballGametypeModel = Engine.CreateModel( perControllerModel, "ballGametype" )
	local status = Engine.Localize( "MPUI_BALL_HOME" )
	if team == Enum.team_t.TEAM_ALLIES or team == Enum.team_t.TEAM_AXIS then
		local owner = Engine.GetObjectiveEntity( controller, objectiveId )
		status = Engine.GetGamertagForClient( controller, owner )
	else
		local ballAway = Engine.GetModelValue( Engine.CreateModel( ballGametypeModel, "ballAway" ) )
		if ballAway == 1 then
			status = Engine.Localize( "MPUI_BALL_AWAY" )
		end
	end
	Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballStatusText" ), status )
	if CoD.IsShoutcaster( controller ) then
		Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballHeldByFriendly" ), team == Enum.team_t.TEAM_ALLIES )
		Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballHeldByEnemy" ), team == Enum.team_t.TEAM_AXIS )
	else
		local playerTeam = CoD.TeamUtility.GetTeamID( controller )
		Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballHeldByFriendly" ), team == playerTeam )
		local f27_local0 = Engine.SetModelValue
		local f27_local1 = Engine.CreateModel( ballGametypeModel, "ballHeldByEnemy" )
		local f27_local2
		if team == playerTeam or team == Enum.team_t.TEAM_NEUTRAL then
			f27_local2 = false
		else
			f27_local2 = true
		end
		f27_local0( f27_local1, f27_local2 )
	end
end

CoD.HUDUtility.IsWaypointOwnedByMyTeam = function ( self, controller )
	local myClientNum = Engine.GetPredictedClientNum( controller )
	local myTeam = Engine.GetTeamID( controller, myClientNum )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, self.objId )
	if myTeam ~= objectiveTeam then
		return false
	else
		return true
	end
end

CoD.HUDUtility.IsPlayerUsingWaypoint = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	if Engine.IsPlayerInVehicle( controller ) == true then
		return false
	elseif Engine.IsPlayerRemoteControlling( controller ) == true then
		return false
	elseif Engine.IsPlayerWeaponViewOnlyLinked( controller ) == true then
		return false
	end
	local clientNum = Engine.GetPredictedClientNum( controller )
	local f29_local0 = isAnyOtherTeamUsing and isPlayerTeamUsing and self.objective.snapToCenterWhenContested == 1
	if CoD.HUDUtility.IsWaypointOwnedByMyTeam( self, controller ) then
		if not self.objective.snapToCenterForObjectiveTeam == 1 and not f29_local0 then
			return false
		end
	elseif not self.objective.snapToCenterForOtherTeams == 1 and not f29_local0 then
		return false
	end
	return Engine.ObjectiveIsPlayerUsing( controller, self.objId, clientNum )
end

CoD.HUDUtility.SetupWaypoint = function ( self, controller, objId )
	if objId then
		local objective = self.objective
		local objectiveEntity = Engine.GetObjectiveEntity( controller, objId )
		self.objId = objId
		self.anyGameModeFlagSpecificText = CoD.HUDUtility.ObjectiveHasAnyTextFlagOverrides( objective )
		self:setLeftRight( 0.5, 0.5, 0, 0 )
		self:setTopBottom( 0.5, 0.5, 0, 0 )
		self:setupWaypointContainer( self.objId )
		self:setEntityContainerClamp( objective.waypoint_clamp == true )
		self:setEntityContainerFadeWhenTargeted( objective.waypoint_fade_when_targeted == true )
		self:setEntityContainerFadeWhenInCombat( objective.waypoint_fade_when_in_combat == true )
		if objective.pingWhenEnemyUsing == 1 and Engine.GetGametypeSetting( "enemyCarrierVisible" ) == 2 then
			self.ping = true
		end
		local f30_local0 = Engine.SetObjectiveIgnoreEntity
		local f30_local1 = controller
		local f30_local2 = objId
		local f30_local3 = Enum.ObjectIconType.OBJECTIVEICON_MAP
		local f30_local4 = self.ping
		if not f30_local4 then
			f30_local4 = false
		end
		f30_local0( f30_local1, f30_local2, f30_local3, f30_local4 )
		f30_local0 = objective.waypoint_z_offset
		if not f30_local0 then
			f30_local0 = 0
		end
		self.zOffset = f30_local0
		if objective.id == "warzone" then
			self.progressMeterContested:setShaderVector( 4, 3, 0.07, 0, 0 )
			self.progressMeter:setShaderVector( 4, 3, 0.07, 0, 0 )
		end
	end
end

CoD.HUDUtility.UseHintTextForActiveButtonPromptText = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.CreateModel( perControllerModel, "interactivePrompt.activeObjectiveID" ), function ( model )
		local buttonPromptText = GetObjectiveProperty( "buttonPromptText", self.objective.id )
		if buttonPromptText and self.objId == Engine.GetModelValue( model ) then
			local hudItemsModel = Engine.GetModel( perControllerModel, "hudItems" )
			Engine.SetModelValue( Engine.CreateModel( hudItemsModel, "showCursorHint" ), true )
			local activateButtonText = Engine.KeyBinding( controller, "+activate" )
			if activateButtonText then
				buttonPromptText = Engine.Localize( buttonPromptText, activateButtonText )
			end
			Engine.SetModelValue( Engine.CreateModel( hudItemsModel, "cursorHintText" ), buttonPromptText )
			Engine.SetModelValue( Engine.CreateModel( hudItemsModel, "cursorHintIconRatio" ), 0 )
		end
	end, false )
end

CoD.HUDUtility.WAYPOINT_CTF_PULSE_BEGIN_ALPHA = 0.8
CoD.HUDUtility.WAYPOINT_CTF_PULSE_END_ALPHA = 0.3
CoD.HUDUtility.WaypointSetCompassObjectiveIcon = function ( self, controller, index, mapMaterialName, color )
	if mapMaterialName then
		if color then
			Engine.SetObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_MAP, mapMaterialName, color.r, color.g, color.b )
			Engine.SetObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_SHOUTCASTER_MAP, mapMaterialName, color.r, color.g, color.b )
		else
			Engine.SetObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_MAP, mapMaterialName )
			Engine.SetObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_SHOUTCASTER_MAP, mapMaterialName )
		end
		Engine.SetObjectiveIconPulse( controller, index, Enum.ObjectIconType.OBJECTIVEICON_MAP, self.objective.pulse == 1 )
	else
		Engine.ClearObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_MAP )
		Engine.ClearObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_SHOUTCASTER_MAP )
		Engine.SetObjectiveIconPulse( controller, index, Enum.ObjectIconType.OBJECTIVEICON_MAP, false )
	end
end

CoD.HUDUtility.WaypointClearCompassObjectiveIcon = function ( self, controller, index )
	Engine.ClearObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_MAP )
	Engine.ClearObjectiveIcon( controller, index, Enum.ObjectIconType.OBJECTIVEICON_SHOUTCASTER_MAP )
end

CoD.HUDUtility.WaypointGetTeam = function ( controller, objId )
	return Engine.GetObjectiveTeam( controller, objId )
end

CoD.HUDUtility.WaypointUpdate_Ball_Ball = function ( self, controller )
	local objectiveId = self.objId
	local team = Engine.GetObjectiveTeam( controller, objectiveId )
	local perControllerModel = Engine.GetModelForController( controller )
	local ballGametypeModel = Engine.CreateModel( perControllerModel, "ballGametype" )
	local status = Engine.Localize( "MPUI_BALL_HOME" )
	if team == Enum.team_t.TEAM_ALLIES or team == Enum.team_t.TEAM_AXIS then
		local owner = Engine.GetObjectiveEntity( controller, objectiveId )
		status = Engine.GetGamertagForClient( controller, owner )
	else
		local ballAway = Engine.GetModelValue( Engine.CreateModel( ballGametypeModel, "ballAway" ) )
		if ballAway == 1 then
			status = Engine.Localize( "MPUI_BALL_AWAY" )
		end
	end
	Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballStatusText" ), status )
	if CoD.IsShoutcaster( controller ) then
		Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballHeldByFriendly" ), team == Enum.team_t.TEAM_ALLIES )
		Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballHeldByEnemy" ), team == Enum.team_t.TEAM_AXIS )
	else
		local playerTeam = CoD.TeamUtility.GetTeamID( controller )
		Engine.SetModelValue( Engine.CreateModel( ballGametypeModel, "ballHeldByFriendly" ), team == playerTeam )
		local f36_local0 = Engine.SetModelValue
		local f36_local1 = Engine.CreateModel( ballGametypeModel, "ballHeldByEnemy" )
		local f36_local2
		if team == playerTeam or team == Enum.team_t.TEAM_NEUTRAL then
			f36_local2 = false
		else
			f36_local2 = true
		end
		f36_local0( f36_local1, f36_local2 )
	end
end

CoD.HUDUtility.WaypointUpdate_SD_Bomb = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local objectiveEntity = Engine.GetObjectiveEntity( controller, self.objId )
	Engine.SetModelValue( Engine.CreateModel( perControllerModel, "hudItems.SDBombClient" ), objectiveEntity )
end

CoD.HUDUtility.WaypointUpdate_SD_Defuse_AB = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local ownedByMyTeam = CoD.HUDUtility.IsWaypointOwnedByMyTeam( self, controller )
	local searchAndDestroyModel = Engine.CreateModel( perControllerModel, "SearchAndDestroy" )
	Engine.SetModelValue( Engine.GetModel( searchAndDestroyModel, "defending" ), ownedByMyTeam )
end

CoD.HUDUtility.WaypointUpdate_CP_GM_Carry_Object = function ( self, controller )
	local gameplayBundleModel = DataSources.CPGamePlayBundleData.getModel( controller )
	if gameplayBundleModel.briefcaseClient then
		gameplayBundleModel.briefcaseClient:set( Engine.GetObjectiveEntity( controller, self.objId ) or -1 )
	end
end

CoD.HUDUtility.WaypointUpdate_Warzone = function ( self, controller )
	local ballGametypeModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.war.currentZoneProgress" )
	ballGametypeModel:set( Engine.GetObjectiveProgress( controller, self.objId ) )
	local attackingTeam = Engine.GetObjectiveTeam( controller, self.objId )
	local heldByAttackingTeamModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.war.objectiveHeldByAttackingTeam" )
	local heldByDefendingTeamModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.war.objectiveHeldByDefendingTeam" )
	heldByAttackingTeamModel:set( Engine.ObjectiveIsTeamUsing( controller, self.objId, attackingTeam ) )
	heldByDefendingTeamModel:set( Engine.ObjectiveIsAnyOtherTeamUsing( controller, self.objId, attackingTeam ) )
end

CoD.HUDUtility.WaypointUpdate_Strong = function ( self, controller )
	if not CoD.perController[controller].waypointObjectiveList then
		CoD.perController[controller].waypointObjectiveList = {}
	end
	if not CoD.perController[controller].waypointObjectiveList[self.objId] then
		CoD.perController[controller].waypointObjectiveList[self.objId] = self
		local warModel = DataSources.WarData.getModel( controller )
		warModel.zone1.objId:set( #CoD.perController[controller].waypointObjectiveList )
	end
end

CoD.HUDUtility.WaypointObjectiveSpecificUpdates = {
	ball_ball = CoD.HUDUtility.WaypointUpdate_Ball_Ball,
	sd_bomb = CoD.HUDUtility.WaypointUpdate_SD_Bomb,
	sd_defuse_a = CoD.HUDUtility.WaypointUpdate_SD_Defuse_AB,
	sd_defuse_b = CoD.HUDUtility.WaypointUpdate_SD_Defuse_AB,
	cp_gm_carry_object_objective = CoD.HUDUtility.WaypointUpdate_CP_GM_Carry_Object,
	cp_zur_data_escape_carry_data = CoD.HUDUtility.WaypointUpdate_CP_GM_Carry_Object,
	warzone = CoD.HUDUtility.WaypointUpdate_Warzone,
	strong_0 = CoD.HUDUtility.WaypointUpdate_Strong,
	strong_1 = CoD.HUDUtility.WaypointUpdate_Strong,
	strong_2 = CoD.HUDUtility.WaypointUpdate_Strong
}
CoD.HUDUtility.WaypointUpdateIconAndText = function ( self, controller, gameModeFlag )
	local minimapMaterial = self.objective.minimapMaterial
	if gameModeFlag ~= 0 then
		local baseFlag = "minimapMaterialFlag" .. gameModeFlag
		minimapMaterial = self.objective[baseFlag] or minimapMaterial
	end
	if ShouldHideWaypoint( self, controller ) then
		CoD.HUDUtility.WaypointClearCompassObjectiveIcon( self, controller, self.objId )
	else
		local f42_local0 = CoD.ColorUtility.NormalizeColor
		local f42_local1 = self:getModel()
		local colorList = f42_local0( f42_local1.color:get() )
		CoD.HUDUtility.WaypointSetCompassObjectiveIcon( self, controller, self.objId, minimapMaterial, {
			r = colorList[1],
			g = colorList[2],
			b = colorList[3]
		} )
	end
	local specificUpdateFunc = CoD.HUDUtility.WaypointObjectiveSpecificUpdates[self.objective.id]
	if specificUpdateFunc then
		specificUpdateFunc( self, controller )
	end
end

CoD.HUDUtility.WaypointUpdateSnapToCenter = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local f43_local0 = CoD.HUDUtility.IsPlayerUsingWaypoint( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	if not f43_local0 then
		if self.objective.snapToCenterWhenInteractable == 1 then
			f43_local0 = not IsObjectiveRequirementLabelHidden( self, controller )
		else
			f43_local0 = false
		end
	end
	if self.snappedToCenter == f43_local0 then
		return 
	elseif f43_local0 == true then
		if self.snappedToCenter ~= nil then
			self:beginAnimation( "snap_in", 250, true, true )
		end
		self:setEntityContainerStopUpdating( true )
		self:setLeftRight( 0.5, 0.5, -48, 48 )
		self:setTopBottom( 0.5, 0.5, -264, -168 )
	else
		if self.snappedToCenter ~= nil then
			self:beginAnimation( "snap_out", 250, true, true )
		end
		self:setEntityContainerStopUpdating( false )
		self:setLeftRight( 0.5, 0.5, 0, 0 )
		self:setTopBottom( 0.5, 0.5, 0, 0 )
	end
	self.snappedToCenter = f43_local0
end

CoD.HUDUtility.SetWaypointElementToFadeAlpha = function ( self, element )
	if not self._waypointFadeElements then
		self._waypointFadeElements = {}
	end
	table.insert( self._waypointFadeElements, element )
end

CoD.HUDUtility.WaypointUpdate = function ( self, controller )
	local index = self.objId
	local ping = self.ping
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	local clientNum = Engine.GetPredictedClientNum( controller )
	local playerTeam = Engine.GetTeamID( controller, clientNum )
	local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, index, playerTeam )
	local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, index, playerTeam )
	CoD.HUDUtility.WaypointUpdateSnapToCenter( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local zOffset = self.zOffset
	if (isPlayerTeamUsing or isAnyOtherTeamUsing) and self.objective.zOffsetWhenInUse ~= 0 then
		zOffset = zOffset + self.objective.zOffsetWhenInUse
	end
	if objectiveEntity and not ping then
		self:setupWaypointContainer( index, 0, 0, zOffset )
	else
		local posX, posY, posZ = Engine.GetObjectivePosition( controller, index )
		self:setupWaypointContainer( index, posX, posY, posZ + zOffset )
	end
	if ping and objectiveEntity then
		self:clearEntityMidpoint( true )
		local posX = Engine.GetGametypeSetting( "objectivePingTime" ) * 1000
		local posY = function ( element )
			element:setAlpha( CoD.HUDUtility.WAYPOINT_CTF_PULSE_BEGIN_ALPHA )
			element:beginAnimation( posX, Enum.LUITween.LUITWEEN_LINEAR )
			element:setAlpha( CoD.HUDUtility.WAYPOINT_CTF_PULSE_END_ALPHA )
		end
		
		for _, element in ipairs( self._waypointFadeElements ) do
			posY( element )
		end
		if posX > 0 then
			for _, element in ipairs( self._waypointFadeElements ) do
				element:registerEventHandler( "transition_complete_keyframe", function ( element, event )
					if event.interrupted then
						element:setAlpha( 1 )
					else
						posY( element )
					end
				end )
			end
		end
		self.pinging = true
	elseif self.pinging == true then
		for _, f45_local2 in ipairs( self._waypointFadeElements ) do
			f45_local2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
		end
		self:clearEntityMidpoint( false )
		self:completeAnimation()
		self:setAlpha( 1 )
		self.pinging = nil
	end
	self:setEntityContainerScale( self.objective.scale3d == 1 )
	if self.objective.show3dDirectionArrow == 1 then
		self.WaypointArrowContainer:setup3dPointer( index )
	end
end

CoD.HUDUtility.IsObjectivePropertyValueEqualTo = function ( self, propertyKey, exprValue )
	local objective = self.objective
	if not objective then
		local parent = self:getParent()
		objective = parent and parent.objective
	end
	return objective and objective[propertyKey] == exprValue
end

CoD.HUDUtility.GetFriendlyOrEnemyColorByObjId = function ( controllerArg, colorReturn )
	local objId = colorReturn
	local gamemodeFlags = Engine.GetObjectiveGamemodeFlags( controllerArg, objId )
	local color = nil
	if (gamemodeFlags or 0) == 0 then
		color = ColorSet.WaypointNeutral
	else
		local objectiveName = Engine.GetObjectiveName( controllerArg, objId )
		local teamProgressColor = GetObjectiveProperty( "teamForProgressRingColorFlag" .. gamemodeFlags, objectiveName )
		local teamId = CoD.TeamUtility.GetTeamID( controllerArg )
		if teamProgressColor == 0 then
			color = ColorSet.WaypointNeutral
		elseif teamProgressColor == teamId then
			color = ColorSet.FriendlyBlue
		else
			color = ColorSet.EnemyOrange
		end
	end
	return color.r, color.b, color.g
end

CoD.HUDUtility.InitOverheadNames = function ( self, controller, elementName_overheadNameContainer )
	if IsLuaCodeVersionAtLeast( 33 ) then
		local overheadNameContainer = self[elementName_overheadNameContainer]
		for clientNum = 0, LuaDefine.MAX_CLIENTS - 1, 1 do
			local overheadName = CoD.OverheadName.new( self, controller )
			overheadName:setModel( Engine.GetModelForClient( clientNum ) )
			overheadName:setupOverheadName( clientNum )
			overheadNameContainer:addElement( overheadName )
		end
	end
end

CoD.HUDUtility.GetFriendlyOrEnemyColorByTeamId = function ( controllerArg, colorReturn )
	local teamId = colorReturn
	local myTeamId = CoD.TeamUtility.GetTeamID( controllerArg )
	local color = nil
	if teamId == myTeamId then
		color = ColorSet.FriendlyBlue
	else
		color = ColorSet.EnemyOrange
	end
	return color.r, color.b, color.g
end

CoD.HUDUtility.InitPlayerCardObituaryCallout = function ( self, controller, elementName_Callout )
	local playerCardObituaryCallout = self[elementName_Callout]
	playerCardObituaryCallout.playNotification = function ( element, modelValueTable )
		element.currentNotification = modelValueTable
		element:setModel( Engine.GetModelForClient( modelValueTable.clientNum ) )
		self:playClip( "Bottom" )
	end
	
	playerCardObituaryCallout.appendNotification = function ( self, modelValueTable )
		if modelValueTable == nil then
			return 
		elseif self.currentNotification ~= nil then
			local finalNotification = self.nextNotification
			if finalNotification == nil then
				self.nextNotification = modelValueTable
			end
			while finalNotification and finalNotification.next ~= nil do
				finalNotification = finalNotification.next
			end
			finalNotification.next = modelValueTable
		else
			self:playNotification( modelValueTable )
		end
	end
	
	playerCardObituaryCallout.getModelValueTable = function ( self, model )
		local modelValueTable = {
			clientNum = model.clientNum:get()
		}
		return modelValueTable
	end
	
	playerCardObituaryCallout.currentNotification = nil
	playerCardObituaryCallout.nextNotification = nil
	local playerKilledCalloutModel = Engine.CreateModel( Engine.GetModelForController( controller ), "playerKilledCallout" )
	Engine.SetModelValue( playerKilledCalloutModel, false )
	if not CoD.isCampaign then
		playerCardObituaryCallout:subscribeToModel( playerKilledCalloutModel, function ( model )
			if Engine.GetModelValue( model ) == true then
				local playerObituaryModel = Engine.GetModel( Engine.GetModelForController( controller ), "playerObituary" )
				local modelValueTable = playerCardObituaryCallout:getModelValueTable( playerObituaryModel )
				playerCardObituaryCallout:appendNotification( modelValueTable )
			end
		end )
	end
	self:registerEventHandler( "clip_over", function ( self, event )
		playerCardObituaryCallout.currentNotification = nil
		if playerCardObituaryCallout.nextNotification ~= nil then
			playerCardObituaryCallout:playNotification( playerCardObituaryCallout.nextNotification )
			playerCardObituaryCallout.nextNotification = playerCardObituaryCallout.nextNotification.next
		end
	end )
end

CoD.HUDUtility.InitLoadingImageOrMovie = function ( element, controller )
	local mapName = Engine.GetCurrentMap()
	local mapImageName = MapNameToMapLoadingImage( controller, mapName )
	if ShouldShowMovie( controller ) then
		Engine.SetDvar( "ui_useloadingmovie", 1 )
		if CoD.BaseUtility.GetMapValue( mapName, "fadeToWhite" ) == 1 then
			local f58_local0 = "$white"
		end
		mapImageName = f58_local0 or "black"
	else
		Engine.SetDvar( "ui_useloadingmovie", 0 )
		if mapImageName == nil or mapImageName == "" or CoD.isMultiplayer then
			mapImageName = "black"
		end
	end
	element:setImage( RegisterImage( mapImageName ) )
	element:setRGB( 1, 1, 1 )
	element:addElement( LUI.UITimer.newElementTimer( 16, false, function ()
		if Engine.IsCinematicMp4() then
			if not element.ismp4 then
				element:setMaterial( RegisterMaterial( "cinematic_mp4" ) )
				element.ismp4 = true
			end
		elseif element.ismp4 then
			element:setRGB( 0, 0, 0 )
			element:setImage( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
			element.ismp4 = nil
		end
	end ) )
end

CoD.HUDUtility.StartPlay = function ( element, controller )
	Engine.Stop3DCinematic( 0 )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.SetLoadingMovieSkippedState( true )
	end
end

CoD.HUDUtility.GetDidYouKnowString = function ()
	local didYouKnowText = ""
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return ""
	end
	local didYouKnowAsset = Engine.GetAssetInfo( "didyouknow" )
	local didYouKnowCategories = {}
	if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_THEATER ) == true then
		didYouKnowCategories[#didYouKnowCategories + 1] = "theater"
	elseif true == CoD.isZombie then
		didYouKnowCategories[#didYouKnowCategories + 1] = "zombies"
	else
		if CoD.isMultiplayer then
			didYouKnowCategories[#didYouKnowCategories + 1] = "multiplayer"
		end
		didYouKnowCategories[#didYouKnowCategories + 1] = "general"
		local gametype = Dvar.ui_gametype:get()
		didYouKnowCategories[#didYouKnowCategories + 1] = gametype
		if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE ) == true then
			didYouKnowCategories[#didYouKnowCategories + 1] = "league"
		elseif Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST ) == true then
			didYouKnowCategories[#didYouKnowCategories + 1] = "public"
		end
	end
	if #didYouKnowCategories > 0 then
		local categoryCounts = {}
		local validCategories = {}
		local totalCount = 0
		for _, category in ipairs( didYouKnowCategories ) do
			local categoryCount = didYouKnowAsset[category .. "Count"]
			if categoryCount and categoryCount > 0 then
				totalCount = totalCount + categoryCount
				categoryCounts[#categoryCounts + 1] = categoryCount
				validCategories[#validCategories + 1] = category
			end
		end
		if totalCount > 0 then
			local stringIndex = math.random( totalCount )
			for i = 1, #validCategories, 1 do
				if categoryCounts[i] < stringIndex then
					stringIndex = stringIndex - categoryCounts[i]
				end
				local assetName = validCategories[i]
				if stringIndex < 10 then
				
				else
					didYouKnowText = didYouKnowAsset[assetName .. stringIndex]
					break
				end
				assetName = assetName .. "0"
			end
		end
	end
	if didYouKnowText == nil or didYouKnowText == "" then
		return ""
	end
	return Engine.Localize( didYouKnowText )
end

CoD.HUDUtility.InitLoadingScreenPlayerListSize = function ( element )
	local team1ListCount = DataSources.LoadingScreenPlayerListTeam1.getCount( element )
	element:setVerticalCount( 2 )
	local hCount = 4
	if team1ListCount > 8 and team1ListCount < 11 then
		element:setHorizontalCount( 5 )
		hCount = 5
	elseif team1ListCount > 10 then
		element:setHorizontalCount( 6 )
		hCount = 6
	else
		element:setHorizontalCount( 4 )
	end
	if team1ListCount < 4 then
		hCount = team1ListCount
	end
	local listElementWidth = 160
	local listElementSpacing = 2
	local listWidth = listElementWidth * hCount + listElementSpacing * (hCount - 1)
	local left = 640 - listWidth / 2
	local right = left + listWidth
	element:setLeftRight( true, false, left, right )
end

CoD.HUDUtility.HandleWarZoneIcon = function ( self, controller )
	local warModel = DataSources.WarData.getModel( controller )
	local currentZoneIcon = warModel:create( "currentZoneIcon" )
	currentZoneIcon:set( "$blacktransparent" )
	local currentZoneTier = warModel:create( "currentZoneTier" )
	currentZoneTier:set( 0 )
	local currentZoneIconFlashing = warModel:create( "currentZoneIconFlashing" )
	currentZoneIconFlashing:set( false )
	local UpdateWarIconAndFlashingStatus = function ()
		local currentZoneTimeElapsed = Engine.CurrentGameTime() / 1000 - warModel.currentZoneStartTime:get()
		local currentZone = warModel.currentZone:get()
		local currentTierIcon = nil
		local currentTierIconFlashing = false
		if not DataSources.WarData.WarInfo then
			DataSources.WarData.Initialize( controller )
		end
		if DataSources.WarData.WarInfo.zoneInfo[currentZone] == nil then
			currentZoneIcon:set( "$blacktransparent" )
			currentZoneIconFlashing:set( false )
		else
			for i, tierInfo in ipairs( DataSources.WarData.WarInfo.zoneInfo[currentZone].tiers ) do
				if tierInfo.time == 0 or currentZoneTimeElapsed < tierInfo.time then
					currentZoneIcon:set( DataSources.WarData.WarInfo.tierInfo[i].icon )
					currentZoneTier:set( i )
					local f64_local3 = currentZoneIconFlashing
					local f64_local4 = f64_local3
					f64_local3 = f64_local3.set
					local f64_local5
					if tierInfo.time <= 0 or tierInfo.time - currentZoneTimeElapsed >= 10 then
					
					else
						f64_local5 = true
					end
					f64_local5 = false
				end
			end
		end
	end
	
	self:addElement( LUI.UITimer.newElementTimer( 500, false, function ()
		UpdateWarIconAndFlashingStatus()
	end ) )
	self:subscribeToModel( warModel.currentZoneStartTime, UpdateWarIconAndFlashingStatus, true )
	self:subscribeToModel( warModel.currentZoneStartTime, UpdateWarIconAndFlashingStatus, true )
end

CoD.HUDUtility.ChooseLevelUpSlot = function ( self, controller )
	local slotName, inventorySlotName = nil
	for _, slotType in ipairs( DataSources.MPLevelUp.Slots ) do
		local slotIter = 1
		for f66_local3 = 1, slotType.count, 1 do
			local thisSlotName = slotType.prefix .. f66_local3
			inventorySlotName = slotType.cacPrefix
			if self[thisSlotName] and self[thisSlotName].currentState == "Selected" then
				slotName = thisSlotName
				break
			end
		end
		if slotName ~= nil then
			
		end
	end
	if slotName == nil then
		return 
	end
	local isUpgradedItemInInventory = function ( positionSlotInventoryInfo, upgradedItemIndex )
		for _, itemInfo in ipairs( positionSlotInventoryInfo ) do
			if itemInfo.itemIndex == upgradedItemIndex then
				return true
			end
		end
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	local levelModel = perControllerModel.hudItems.lplevel
	local unlockModel = levelModel.unlockTokens
	local f66_local6 = unlockModel
	local unlockTokens = unlockModel:get()
	slotType = f66_local6 and unlockTokens
	local f66_local7 = levelModel
	local slotModel = levelModel[slotName]
	local f66_local8 = f66_local7 and slotModel
	if f66_local8 and f66_local8.itemIndex then
		local unlockLevel = f66_local8.unlockLevel:get() or 0
		local playerLevel = (levelModel.level:get() or 0) + 1
		if playerLevel < unlockLevel then
			return 
		end
		local slotCurrentLevel = f66_local8.level:get() or 0
		if slotCurrentLevel == CoD.EscalationUtility.SLOT_LEVEL_EQUIPPED then
			return 
		elseif slotCurrentLevel ~= CoD.EscalationUtility.SLOT_LEVEL_CAN_EQUIP_FOR_FREE and slotType <= 0 then
			return 
		end
		local itemIndex = f66_local8.itemIndex:get() or "0"
		local shouldUpdateToEquippedState = 1
		f66_local8.upgradedItemIndex:set( CoD.CACUtility.EmptyItemIndex )
		local itemKVP = Engine.GetUnlockableItemKVPInfo( itemIndex )
		if itemKVP and itemKVP.isUpgradeAvailable and itemKVP.isUpgradeAvailable ~= 0 then
			local upgradeItemIndex = Engine.GetItemIndexFromReference( itemKVP.specialtyUpgrade )
			if upgradeItemIndex > CoD.CACUtility.EmptyItemIndex then
				local characterIndex = perControllerModel.CharacterSelection.characterIndex:get()
				local f66_local9
				if characterIndex >= 0 then
					f66_local9 = Engine.GetPostionRoleInventoryInfo( Enum.eModes.MODE_MULTIPLAYER, characterIndex )
				else
					f66_local9 = false
				end
				if f66_local9 and isUpgradedItemInInventory( f66_local9[inventorySlotName], upgradeItemIndex ) then
					f66_local8.upgradedItemIndex:set( upgradeItemIndex )
					shouldUpdateToEquippedState = 0
				end
			end
		end
		Engine.SendMenuResponse( controller, "LevelUp", slotName .. "," .. itemIndex .. "," .. shouldUpdateToEquippedState )
		ForceNotifyControllerModel( controller, "hudItems.lplevel.classUpdated" )
	end
	self[slotName]:setState( "Confirmed" )
	self[slotName]:setState( "DefaultState" )
	self:playClip( "SlotConfirmed" )
end

CoD.HUDUtility.FullscreenViewportStart = function ( self, event )
	self:setScale( 1 )
end

CoD.HUDUtility.FullscreenViewportStop = function ( self, event )
	if self.scale ~= nil then
		self:setScale( self.scale )
	else
		self:setScale( 1 )
	end
end

CoD.HUDUtility.ApplySplitscreenScale = function ( self, scale )
	self.scale = 1
	if Engine.IsInGame() and 1 < Engine.SplitscreenNum() then
		self.scale = scale
		self:setScale( scale )
	end
	self:registerEventHandler( "fullscreen_viewport_start", CoD.HUDUtility.FullscreenViewportStart )
	self:registerEventHandler( "fullscreen_viewport_stop", CoD.HUDUtility.FullscreenViewportStop )
end

CoD.HUDUtility.IsFogOfWarEnabled = function ( controller )
	local f71_local0
	if Engine.GetGametypeSetting( "fogOfWarMinimap" ) ~= 1 then
		f71_local0 = IsDvarValueEqualTo( "ui_fogOfWar", true )
	else
		f71_local0 = true
	end
	return f71_local0
end

CoD.HUDUtility.IsRotatingMinimapEnabled = function ( controller )
	return Engine.GetProfileVarInt( controller, "minimapMode" ) == CoD.HUDUtility.MinimapMode.MODE_ROTATING
end

CoD.HUDUtility.IsAnyGameType = function ( controller, ... )
	local gameType = Engine.GetDvarString( "g_gametype" )
	for _, item in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		if item == gameType then
			return true
		end
	end
	return false
end

CoD.HUDUtility.SetUIActive = function ( controller, booleanArg )
	Engine.SetUIActive( controller, booleanArg )
end

DataSources.CharacterSelection = {
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		return perControllerModel:create( "CharacterSelection" )
	end
}
DataSources.WaypointObjectiveList = DataSourceHelpers.ListSetup( "WaypointObjectiveList", function ( controller )
	local objectiveList = {}
	local sortByObjId = function ( a, b )
		return a.properties.objId < b.properties.objId
	end
	
	if CoD.perController[controller].waypointObjectiveList then
		for _, objective in pairs( CoD.perController[controller].waypointObjectiveList ) do
			local objectiveName = Engine.GetObjectiveName( controller, objective.objId )
			table.insert( objectiveList, {
				models = {
					objectiveModel = objective:getModel()
				},
				properties = {
					objective = CoD.HUDUtility.GetCachedObjective( objectiveName ),
					objId = objective.objId
				}
			} )
		end
	end
	table.sort( objectiveList, sortByObjId )
	return objectiveList
end, true )
DataSources.TeamRoundData = {
	prepared = false,
	preparedForController = {},
	subscriptions = {},
	prepare = function ( controller, element, filter )
		if not DataSources.TeamRoundData.preparedForController then
			DataSources.TeamRoundData.preparedForController = {}
		end
		if not DataSources.TeamRoundData.subscriptions[controller] then
			DataSources.TeamRoundData.subscriptions[controller] = LUI.UIElement.new()
		end
		DataSources.TeamRoundData.subscriptions[controller]:unsubscribeFromAllModels()
		local playerTeamId = CoD.TeamUtility.GetTeamID( controller )
		local alliesRoundsWonModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.alliesRoundsWon" )
		local axisRoundsWonModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.axisRoundsWon" )
		local f78_local0 = DataSources.Factions.getModel( controller )
		local playerFactionTeamModel = f78_local0.playerFactionTeamEnum
		local playerTeamRoundsWon = alliesRoundsWonModel:get()
		local enemyTeamRoundsWon = axisRoundsWonModel:get()
		if playerTeamId == Enum.team_t.TEAM_AXIS then
			playerTeamRoundsWon = axisRoundsWonModel:get()
			enemyTeamRoundsWon = alliesRoundsWonModel:get()
		end
		local roundWinLimit = Engine.GetGametypeSetting( "roundWinLimit" )
		if roundWinLimit == 0 then
			roundWinLimit = 1
		end
		local f78_local1 = Engine.GetModelForController( controller )
		local roundDataModel = f78_local1:create( "TeamRoundData" )
		local f78_local2 = roundDataModel:create( "playerTeamRoundsWon" )
		f78_local2:set( playerTeamRoundsWon )
		f78_local2 = roundDataModel:create( "enemyTeamRoundsWon" )
		f78_local2:set( enemyTeamRoundsWon )
		f78_local2 = roundDataModel:create( "playerTeamRoundsWonPercent" )
		f78_local2:set( playerTeamRoundsWon / roundWinLimit )
		f78_local2 = roundDataModel:create( "enemyTeamRoundsWonPercent" )
		f78_local2:set( enemyTeamRoundsWon / roundWinLimit )
		DataSources.TeamRoundData.subscriptions[controller]:subscribeToModel( alliesRoundsWonModel, function ()
			DataSources.TeamRoundData.preparedForController[controller] = false
			DataSources.TeamRoundData.prepare( controller )
		end, false )
		DataSources.TeamRoundData.subscriptions[controller]:subscribeToModel( axisRoundsWonModel, function ()
			DataSources.TeamRoundData.preparedForController[controller] = false
			DataSources.TeamRoundData.prepare( controller )
		end, false )
		DataSources.TeamRoundData.subscriptions[controller]:subscribeToModel( playerFactionTeamModel, function ()
			DataSources.TeamRoundData.preparedForController[controller] = false
			DataSources.TeamRoundData.prepare( controller )
		end, false )
	end,
	getModel = function ( controller )
		if not DataSources.TeamRoundData.preparedForController or not DataSources.TeamRoundData.preparedForController[controller] then
			DataSources.TeamRoundData.prepare( controller )
		end
		local f82_local0 = Engine.GetModelForController( controller )
		return f82_local0:create( "TeamRoundData" )
	end
}
DataSources.TeamLivesData = {
	prepared = false,
	preparedForController = {},
	subscriptions = {},
	prepare = function ( controller, element, filter )
		if not DataSources.TeamLivesData.preparedForController then
			DataSources.TeamLivesData.preparedForController = {}
		end
		if not DataSources.TeamLivesData.subscriptions[controller] then
			DataSources.TeamLivesData.subscriptions[controller] = LUI.UIElement.new()
		end
		DataSources.TeamLivesData.subscriptions[controller]:unsubscribeFromAllModels()
		local playerTeamId = CoD.TeamUtility.GetTeamID( controller )
		local alliesLivesCountModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.alliesLivesCount" )
		local axisLivesCountModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.axisLivesCount" )
		local f83_local0 = DataSources.Factions.getModel( controller )
		local playerFactionTeamModel = f83_local0.playerFactionTeamEnum
		local f83_local1 = Engine.GetModelForController( controller )
		local teamLivesDataModel = f83_local1:create( "TeamLivesData" )
		local playerTeamLivesModel = Engine.CreateModel( teamLivesDataModel, "playerTeamLives" )
		local enemyTeamLivesModel = Engine.CreateModel( teamLivesDataModel, "enemyTeamLives" )
		if playerTeamId == Enum.team_t.TEAM_ALLIES then
			playerTeamLivesModel:set( alliesLivesCountModel:get() )
			enemyTeamLivesModel:set( axisLivesCountModel:get() )
		else
			playerTeamLivesModel:set( axisLivesCountModel:get() )
			enemyTeamLivesModel:set( alliesLivesCountModel:get() )
		end
		DataSources.TeamLivesData.subscriptions[controller]:subscribeToModel( alliesLivesCountModel, function ()
			DataSources.TeamLivesData.preparedForController[controller] = false
			DataSources.TeamLivesData.prepare( controller )
		end, false )
		DataSources.TeamLivesData.subscriptions[controller]:subscribeToModel( axisLivesCountModel, function ()
			DataSources.TeamLivesData.preparedForController[controller] = false
			DataSources.TeamLivesData.prepare( controller )
		end, false )
		DataSources.TeamLivesData.subscriptions[controller]:subscribeToModel( playerFactionTeamModel, function ()
			DataSources.TeamLivesData.preparedForController[controller] = false
			DataSources.TeamLivesData.prepare( controller )
		end, false )
	end,
	getModel = function ( controller )
		if not DataSources.TeamLivesData.preparedForController or not DataSources.TeamLivesData.preparedForController[controller] then
			DataSources.TeamLivesData.prepare( controller )
		end
		local f87_local0 = Engine.GetModelForController( controller )
		return f87_local0:create( "TeamLivesData" )
	end
}
