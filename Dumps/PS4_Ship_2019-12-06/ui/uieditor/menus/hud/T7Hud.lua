require( "ui.uieditor.widgets.MPHudWidgets.ArmorOverlayContainer" )
require( "ui.uieditor.widgets.HUD.fx.vignette_corner_right" )
require( "ui.uieditor.widgets.HUD.fx.vignette_corner" )
require( "ui.uieditor.widgets.HUD.SafeAreaContainers.T7Hud_SafeAreaContainer_Back" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointBase" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Notifications.OutOfBounds.OutOfBounds" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_ObituaryCallout" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.Boot.ThrustMeterBootContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.Stuck" )
require( "ui.uieditor.widgets.MPHudWidgets.CursorHint" )
require( "ui.uieditor.widgets.MPHudWidgets.ShockCharge" )
require( "ui.uieditor.widgets.HUD.ProximityAlarm.ProximityAlarm" )
require( "ui.uieditor.widgets.HUD.CarePackage.CaptureCrate" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterContainer" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.HUD.SafeAreaContainers.T7Hud_SafeAreaContainer_Front" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown" )

CoD.T7Hud = {}
CoD.GetCachedObjective = function ( f1_arg0 )
	if f1_arg0 == nil then
		return nil
	elseif CoD.T7Hud.ObjectivesTable[f1_arg0] ~= nil then
		return CoD.T7Hud.ObjectivesTable[f1_arg0]
	end
	local f1_local0 = Engine.GetObjectiveInfo( f1_arg0 )
	if f1_local0 ~= nil then
		CoD.T7Hud.ObjectivesTable[f1_arg0] = f1_local0
	end
	return f1_local0
end

local PreLoadFunc = function ( self, controller )
	local f2_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "displayTop3Players" )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	local f3_local0 = {}
	local f3_local1 = function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f3_arg1
		local f4_local1 = Engine.GetObjectiveName( f4_local0, f4_arg1.objId )
		local f4_local2 = CoD.GetCachedObjective( f4_local1 )
		if f4_local2 == nil then
			return 
		end
		local f4_local3 = Engine.GetModel( Engine.GetModelForController( f4_local0 ), "objective" .. f4_arg1.objId )
		local f4_local4 = f4_local3 and Engine.GetModel( f4_local3, "state" )
		local f4_local5 = f4_local3 and Engine.CreateModel( f4_local3, "clamped" )
		f4_local5 = f4_local3 and Engine.CreateModel( f4_local3, "direction" )
		local f4_local6 = CoD.OBJECTIVESTATE_EMPTY
		if Dvar.cg_luiDebug:get() == true then
			local f4_local7 = 0
			local f4_local8 = f3_arg0.interactPromptContainer:getFirstChild()
			while f4_local8 ~= nil do
				f4_local7 = f4_local7 + 1
				f4_local8 = f4_local8:getNextSibling()
			end
			DebugPrint( "Interactive Prompt " .. f4_arg1.objId .. ": " .. f4_local1 .. ": " .. f4_local7 .. " prompts active" )
		end
		local f4_local7 = f3_arg0.interactPromptContainer["button" .. f4_arg1.objId]
		if f4_local7 ~= nil then
			f4_local6 = f4_local7.state
		end
		local f4_local8 = Engine.GetObjectiveState( f4_local0, f4_arg1.objId )
		if f4_local8 == CoD.OBJECTIVESTATE_ACTIVE or f4_local8 == CoD.OBJECTIVESTATE_INVISIBLE then
			if f4_local6 ~= CoD.OBJECTIVESTATE_ACTIVE and f4_local6 ~= CoD.OBJECTIVESTATE_INVISIBLE and f4_local2.notify_string ~= nil and f4_local2.notify_string ~= "" then
				local f4_local9 = f3_arg0:getParent()
				f4_local9.T7HudMenuGameMode.CommsSystemWidget:AddCommsEventMessage( {
					name = "comms_event_message",
					controller = f4_arg1.controller,
					data = {
						f4_local2.notify_string
					}
				} )
			end
			if f4_local7 == nil then
				if CoD.isCampaign or CoD.isZombie then
					f4_local7 = CoD.ButtonPrompt3dCPZM.new( f3_arg0, f4_local0 )
				else
					f4_local7 = CoD.ButtonPrompt3d.new( f3_arg0, f4_local0 )
				end
				f4_local7.objective = f4_local2
				f4_local7:setupEntity( f4_arg1 )
				f4_local7:setModel( f4_local3 )
				f3_arg0.interactPromptContainer:addElement( f4_local7 )
				f3_arg0.interactPromptContainer["button" .. f4_arg1.objId] = f4_local7
				f4_local7:subscribeToModel( f4_local4, function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= CoD.OBJECTIVESTATE_ACTIVE and modelValue ~= CoD.OBJECTIVESTATE_INVISIBLE then
						f4_local7:close()
					elseif modelValue == CoD.OBJECTIVESTATE_ACTIVE then
						f4_local7:show()
					else
						f4_local7:hide()
					end
				end )
			else
				f4_local7.objective = f4_local2
				f4_local7:setupEntity( f4_arg1 )
			end
			f4_local7.state = f4_local8
		end
		return true
	end
	
	local f3_local2 = function ( f6_arg0, f6_arg1 )
		local f6_local0 = Engine.GetObjectiveName( f6_arg1.controller, f6_arg1.objId )
		local f6_local1 = CoD.GetCachedObjective( f6_local0 )
		if f6_local1 == nil then
			return 
		elseif Dvar.cg_luiDebug:get() == true then
			DebugPrint( "Waypoint ID " .. f6_arg1.objId .. ": " .. f6_local0 .. ": " .. #f6_arg0.WaypointContainerList .. " waypoints active" )
		end
		if not f6_arg0.savedStates then
			f6_arg0.savedStates = {}
			f6_arg0.savedEntNums = {}
			f6_arg0.savedObjectiveNames = {}
			f6_arg0.savedTeam = -1
			f6_arg0.savedRound = -1
		end
		local f6_local2 = Engine.GetObjectiveState( f3_arg1, f6_arg1.objId )
		local f6_local3 = f6_arg0.savedStates[f6_arg1.objId]
		if not f6_local3 then
			f6_local3 = CoD.OBJECTIVESTATE_EMPTY
		end
		if (f6_local2 == CoD.OBJECTIVESTATE_ACTIVE or f6_local2 == CoD.OBJECTIVESTATE_INVISIBLE) and f6_local3 ~= CoD.OBJECTIVESTATE_ACTIVE and f6_local3 ~= CoD.OBJECTIVESTATE_INVISIBLE and f6_local1.notify_string ~= nil and f6_local1.notify_string ~= "" and (f6_local2 ~= CoD.OBJECTIVESTATE_INVISIBLE or f6_local1.notify_string ~= "CP_MI_CAIRO_AQUIFER_TAKE_OFF") then
			local f6_local4 = f3_arg0:getParent()
			f6_local4.T7HudMenuGameMode.CommsSystemWidget:AddCommsEventMessage( {
				name = "comms_event_message",
				controller = f6_arg1.controller,
				data = {
					f6_local1.notify_string
				}
			} )
		end
		local f6_local4 = Engine.GetModelForController( f6_arg1.controller )
		local f6_local5 = Engine.GetModel( f6_local4, "objective" .. f6_arg1.objId )
		local f6_local6 = f6_local5 and Engine.GetModel( f6_local5, "state" )
		local f6_local7 = CoD.SafeGetModelValue( f6_local5, "entNum" )
		local f6_local8 = CoD.GetTeamID( f3_arg1 )
		local f6_local9 = Engine.GetRoundsPlayed( f3_arg1 )
		if f6_local8 ~= f6_arg0.savedTeam or f6_local9 ~= f6_arg0.savedRound then
			f6_arg0.savedStates = {}
			f6_arg0.savedEntNums = {}
			f6_arg0.savedObjectiveNames = {}
		end
		if not CoD.isCampaign and Engine.IsVisibilityBitSet( f3_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and f6_local2 == f6_local3 and f6_local7 == f6_arg0.savedEntNums[f6_arg1.objId] and f6_local0 == f6_arg0.savedObjectiveNames[f6_arg1.objId] then
			if f6_local6 ~= nil then
				Engine.ForceNotifyModelSubscriptions( f6_local6 )
			end
			return 
		elseif f6_local6 ~= nil then
			local f6_local10 = Engine.GetModelValue( f6_local6 )
			Engine.SetModelValue( f6_local6, CoD.OBJECTIVESTATE_EMPTY )
			Engine.SetModelValue( f6_local6, f6_local10 )
		end
		f6_arg0.savedStates[f6_arg1.objId] = f6_local2
		f6_arg0.savedEntNums[f6_arg1.objId] = f6_local7
		f6_arg0.savedObjectiveNames[f6_arg1.objId] = f6_local0
		f6_arg0.savedTeam = f6_local8
		f6_arg0.savedRound = f6_local9
		if CoD.IsShoutcaster( f6_arg1.controller ) then
			local f6_local10 = f3_arg0:getParent()
			f6_local10 = f6_local10.safeArea.CodCaster
			if f6_local10 and f6_local10.CodCasterHeaderWidget then
				local f6_local11 = f6_local10.CodCasterHeaderWidget.CodCasterHeaderGameModeWidget
				if f6_local11 and IsGameTypeEqualToString( "dom" ) and f6_local11.DomFlags then
					f6_local11.DomFlags:create( f6_arg1 )
				end
			end
		end
		if f6_local0 then
			local f6_local10 = CoD.WaypointWidgetContainer.new( f6_arg0, f6_arg1.controller )
			f6_local10.objective = f6_local1
			f6_local10:setupWaypoint( f6_arg1 )
			f6_local10:setLeftRight( true, true, 0, 0 )
			f6_local10:setTopBottom( true, true, 0, 0 )
			f6_arg0:addElement( f6_local10 )
			table.insert( f6_arg0.WaypointContainerList, f6_local10 )
			f6_local10:update( f6_arg1 )
			f6_local10:setModel( f6_local5 )
			local f6_local11 = f6_arg1.controller
			if Engine.GetModel( f6_local5, "entNum" ) ~= nil and f6_local0 == "sd_bomb" then
				f6_local10:subscribeToModel( Engine.GetModel( f6_local5, "entNum" ), function ( model )
					Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f6_local11 ), "hudItems.SDBombClient" ), Engine.GetModelValue( model ) )
				end )
			end
			local f6_local12 = f6_arg0
			f6_local10:subscribeToModel( f6_local6, function ( model )
				local modelValue = Engine.GetModelValue( model )
				f6_arg0.savedStates[f6_arg1.objId] = modelValue
				if modelValue == CoD.OBJECTIVESTATE_ACTIVE or modelValue == CoD.OBJECTIVESTATE_CURRENT or modelValue == CoD.OBJECTIVESTATE_DONE then
					f6_local10:show()
					f6_local10:update( {
						controller = f6_local11,
						objState = modelValue
					} )
				elseif modelValue == CoD.OBJECTIVESTATE_EMPTY then
					f6_local12:removeWaypoint( f6_arg1.objId )
					f6_arg0.savedEntNums[f6_arg1.objId] = nil
				else
					f6_local10:hide()
				end
			end )
			local f6_local13 = Engine.GetModel( f6_local5, "updateTime" )
			if f6_local13 ~= nil then
				f6_local10:subscribeToModel( f6_local13, function ( model )
					f6_local10:update( {
						controller = f6_local11
					} )
				end )
			end
			f6_local10:subscribeToModel( Engine.GetModel( f6_local5, "progress" ), function ( model )
				f6_local10:update( {
					controller = f6_local11,
					progress = Engine.GetModelValue( model )
				} )
			end )
			f6_local10:subscribeToModel( Engine.GetModel( f6_local5, "clientUseMask" ), function ( model )
				f6_local10:update( {
					controller = f6_local11,
					clientUseMask = Engine.GetModelValue( model )
				} )
			end )
			local f6_local14 = Engine.GetModel( f6_local4, "profile.colorBlindMode" )
			if f6_local14 then
				f6_local10:subscribeToModel( f6_local14, function ( model )
					f6_local10:update( {
						controller = f6_local11
					} )
				end, false )
			end
		end
		return true
	end
	
	f3_arg0.WaypointBase.WaypointContainerList = {}
	CoD.T7Hud.ObjectivesTable = Engine.BuildObjectivesTable()
	if CoD.T7Hud.ObjectivesTable == nil or #CoD.T7Hud.ObjectivesTable == 0 then
		error( "LUI Error: Failed to load objectives.json!" )
	end
	for f3_local3 = #CoD.T7Hud.ObjectivesTable, 1, -1 do
		local f3_local6 = CoD.T7Hud.ObjectivesTable[f3_local3]
		CoD.T7Hud.ObjectivesTable[f3_local6.id] = f3_local6
		table.remove( CoD.T7Hud.ObjectivesTable, f3_local3 )
	end
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "newObjectiveType" .. Enum.ObjectiveTypes.OBJECTIVE_TYPE_WAYPOINT ), function ( model )
		f3_local2( f3_arg0.WaypointBase, {
			controller = f3_arg1,
			objId = Engine.GetModelValue( model ),
			objType = Enum.ObjectiveTypes.OBJECTIVE_TYPE_WAYPOINT
		} )
	end, false )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "newObjectiveType" .. Enum.ObjectiveTypes.OBJECTIVE_TYPE_3DPROMPT ), function ( model )
		f3_local1( f3_arg0.interactPromptContainer, {
			controller = f3_arg1,
			objId = Engine.GetModelValue( model ),
			objType = Enum.ObjectiveTypes.OBJECTIVE_TYPE_3DPROMPT
		} )
	end, false )
	f3_arg0.m_inputDisabled = true
	f3_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		if IsCurrentViewmodelWeaponName( f3_arg1, "pda_hack" ) then
			f3_arg0.BlackHat = CoD.BlackHat.new( f3_arg0, f3_arg1 )
			f3_arg0:addElement( f3_arg0.BlackHat )
			f3_arg0.BlackHat:dispatchEventToChildren( {
				name = "update_state",
				controller = f3_arg1
			} )
		elseif f3_arg0.BlackHat ~= nil then
			f3_arg0.BlackHat:close()
			f3_arg0.BlackHat = nil
		end
	end )
	local f3_local5 = f3_arg0.close
	f3_arg0.close = function ( f16_arg0 )
		f3_local5( f16_arg0 )
		if f16_arg0.BlackHat ~= nil then
			f16_arg0.BlackHat:close()
		end
	end
	
	f3_arg0:registerEventHandler( "game_options_update", function ( element, event )
		return true
	end )
	if nil ~= LUI.DEV then
		f3_arg0:registerEventHandler( "hide_button_prompts", function ( element, event )
			element.CursorHint:setAlpha( event.show and 1 or 0 )
		end )
	end
	f3_arg0.PlayerCardObituaryCallout.playNotification = function ( f19_arg0, f19_arg1 )
		f19_arg0.currentNotification = f19_arg1
		CoD.ChallengesUtility.SetCallingCardForWidget( f19_arg0.PlayerCard0.CallingCardsFrameWidget.CardIconFrame, GetBackgroundByID( f19_arg1.selectedBg ), "HUD" )
		f19_arg0.PlayerCard0.GamerTag:setAlpha( HideIfEmptyString( f19_arg1.playerName ) )
		f19_arg0.PlayerCard0.GamerTag.itemName:setText( Engine.Localize( f19_arg1.playerName ) )
		f19_arg0.PlayerCard0.ClanTag:setAlpha( HideIfEmptyString( f19_arg1.clanTag ) )
		f19_arg0.PlayerCard0.ClanTag.itemName:setText( StringAsClanTag( f19_arg1.clanTag ) )
		f19_arg0.PlayerCard0.HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( f19_arg1.xuid )
		f19_arg0.PlayerCard0.RankIcon:setImage( RegisterImage( f19_arg1.rankIcon ) )
		f19_arg0.PlayerCard0.Rank:setText( Engine.Localize( f19_arg1.rank ) )
		f19_arg0.PlayerCard0.PlayerEmblem:setupPlayerEmblemByXUID( f19_arg1.xuid )
		f19_arg0:playClip( "Bottom" )
	end
	
	f3_arg0.PlayerCardObituaryCallout.appendNotification = function ( f20_arg0, f20_arg1 )
		if f20_arg1 == nil then
			return 
		elseif f20_arg0.currentNotification ~= nil then
			local f20_local0 = f20_arg0.nextNotification
			if f20_local0 == nil then
				f20_arg0.nextNotification = f20_arg1
			end
			while f20_local0 and f20_local0.next ~= nil do
				f20_local0 = f20_local0.next
			end
			f20_local0.next = f20_arg1
		else
			f20_arg0:playNotification( f20_arg1 )
		end
	end
	
	f3_arg0.PlayerCardObituaryCallout.getModelValueTable = function ( f21_arg0, f21_arg1 )
		return {
			xuid = Engine.GetModelValue( Engine.GetModel( f21_arg1, "xuid" ) ),
			playerName = Engine.GetModelValue( Engine.GetModel( f21_arg1, "playerName" ) ),
			clanTag = Engine.GetModelValue( Engine.GetModel( f21_arg1, "clanTag" ) ),
			selectedBg = Engine.GetModelValue( Engine.GetModel( f21_arg1, "selectedBg" ) ),
			rankIcon = Engine.GetModelValue( Engine.GetModel( f21_arg1, "rankIcon" ) ),
			rank = Engine.GetModelValue( Engine.GetModel( f21_arg1, "rank" ) )
		}
	end
	
	f3_arg0.PlayerCardObituaryCallout.currentNotification = nil
	f3_arg0.PlayerCardObituaryCallout.nextNotification = nil
	local f3_local7 = Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "playerKilledCallout" )
	Engine.SetModelValue( f3_local7, false )
	if not CoD.isCampaign then
		f3_arg0.PlayerCardObituaryCallout:subscribeToModel( f3_local7, function ( model )
			if Engine.GetModelValue( model ) == true or Engine.GetModelValue( model ) == 1 then
				Engine.SetModelValue( f3_local7, false )
				f3_arg0.PlayerCardObituaryCallout:appendNotification( f3_arg0.PlayerCardObituaryCallout:getModelValueTable( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "playerObituary" ) ) )
			end
		end )
	end
	f3_arg0.PlayerCardObituaryCallout:registerEventHandler( "clip_over", function ( element, event )
		element.currentNotification = nil
		if element.nextNotification ~= nil then
			element:playNotification( element.nextNotification )
			element.nextNotification = element.nextNotification.next
		end
	end )
end

LUI.createMenu.T7Hud = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ArmorOverlayContainer0 = CoD.ArmorOverlayContainer.new( self, controller )
	ArmorOverlayContainer0:setLeftRight( true, true, 0, 0 )
	ArmorOverlayContainer0:setTopBottom( true, true, 0, 0 )
	ArmorOverlayContainer0:setAlpha( 0.75 )
	self:addElement( ArmorOverlayContainer0 )
	self.ArmorOverlayContainer0 = ArmorOverlayContainer0
	
	local vignettecornerright0 = CoD.vignette_corner_right.new( self, controller )
	vignettecornerright0:setLeftRight( false, true, -384.5, 71.5 )
	vignettecornerright0:setTopBottom( false, true, -279.08, 18 )
	vignettecornerright0:setAlpha( 0.25 )
	self:addElement( vignettecornerright0 )
	self.vignettecornerright0 = vignettecornerright0
	
	local vignettecornerL = CoD.vignette_corner.new( self, controller )
	vignettecornerL:setLeftRight( true, false, -71.5, 386.5 )
	vignettecornerL:setTopBottom( false, true, -279.08, 18 )
	vignettecornerL:setAlpha( 0.25 )
	self:addElement( vignettecornerL )
	self.vignettecornerL = vignettecornerL
	
	local SafeAreaContainerBack = CoD.T7Hud_SafeAreaContainer_Back.new( self, controller )
	SafeAreaContainerBack:setLeftRight( true, true, 0, 0 )
	SafeAreaContainerBack:setTopBottom( true, true, 0, 0 )
	SafeAreaContainerBack:registerEventHandler( "menu_loaded", function ( element, event )
		local f25_local0 = nil
		if IsMultiplayer() and not IsGameTypeEqualToString( "fr" ) then
			SizeToSafeArea( element, controller )
		end
		if not f25_local0 then
			f25_local0 = element:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	self:addElement( SafeAreaContainerBack )
	self.SafeAreaContainerBack = SafeAreaContainerBack
	
	local WaypointBase = CoD.WaypointBase.new( self, controller )
	WaypointBase:setLeftRight( false, false, -640, 640 )
	WaypointBase:setTopBottom( false, false, -360, 360 )
	WaypointBase:registerEventHandler( "menu_loaded", function ( element, event )
		local f26_local0 = nil
		SizeToSafeArea( element, controller )
		if not f26_local0 then
			f26_local0 = element:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:addElement( WaypointBase )
	self.WaypointBase = WaypointBase
	
	local interactPromptContainer = CoD.DynamicContainerWidget.new( self, controller )
	interactPromptContainer:setLeftRight( true, true, 0, 0 )
	interactPromptContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( interactPromptContainer )
	self.interactPromptContainer = interactPromptContainer
	
	local OutOfBounds = CoD.OutOfBounds.new( self, controller )
	OutOfBounds:setLeftRight( true, true, 0, 0 )
	OutOfBounds:setTopBottom( true, true, 0, 0 )
	OutOfBounds:mergeStateConditions( {
		{
			stateName = "IsOutOfBounds",
			condition = function ( menu, element, event )
				return IsOutOfBounds( controller ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
			end
		}
	} )
	OutOfBounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.outOfBoundsEndTime" ), function ( model )
		self:updateElementState( OutOfBounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.outOfBoundsEndTime"
		} )
	end )
	OutOfBounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "displayTop3Players" ), function ( model )
		self:updateElementState( OutOfBounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "displayTop3Players"
		} )
	end )
	OutOfBounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		self:updateElementState( OutOfBounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:addElement( OutOfBounds )
	self.OutOfBounds = OutOfBounds
	
	local PlayerCardObituaryCallout = CoD.PlayerCard_ObituaryCallout.new( self, controller )
	PlayerCardObituaryCallout:setLeftRight( false, false, -153, 150 )
	PlayerCardObituaryCallout:setTopBottom( false, true, -81, -22 )
	PlayerCardObituaryCallout:setAlpha( 0.9 )
	self:addElement( PlayerCardObituaryCallout )
	self.PlayerCardObituaryCallout = PlayerCardObituaryCallout
	
	local PreMatchTimer = LUI.UITightText.new()
	PreMatchTimer:setLeftRight( false, false, -67.5, 67.5 )
	PreMatchTimer:setTopBottom( true, false, 299, 359 )
	PreMatchTimer:setAlpha( 0 )
	PreMatchTimer:setTTF( "fonts/default.ttf" )
	self:addElement( PreMatchTimer )
	self.PreMatchTimer = PreMatchTimer
	
	local ThrustMeterBoot = CoD.ThrustMeterBootContainer.new( self, controller )
	ThrustMeterBoot:setLeftRight( false, false, -154.5, 154.5 )
	ThrustMeterBoot:setTopBottom( false, false, -150, 163 )
	ThrustMeterBoot:setAlpha( 0.7 )
	ThrustMeterBoot:registerEventHandler( "hud_boot", function ( element, event )
		local f31_local0 = nil
		if ShouldBootUpHUD( self ) then
			PlayClipOnElement( self, {
				elementName = "ThrustMeterBoot",
				clipName = "thrust_boot"
			}, controller )
			SetHudHasBooted( self )
		end
		if not f31_local0 then
			f31_local0 = element:dispatchEventToChildren( event )
		end
		return f31_local0
	end )
	self:addElement( ThrustMeterBoot )
	self.ThrustMeterBoot = ThrustMeterBoot
	
	local Stuck = CoD.Stuck.new( self, controller )
	Stuck:setLeftRight( false, false, -32, 32 )
	Stuck:setTopBottom( false, true, -240, -176 )
	Stuck:mergeStateConditions( {
		{
			stateName = "Stuck",
			condition = function ( menu, element, event )
				return IsStickyImageActive( controller )
			end
		}
	} )
	Stuck:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.stickyImage" ), function ( model )
		self:updateElementState( Stuck, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.stickyImage"
		} )
	end )
	self:addElement( Stuck )
	self.Stuck = Stuck
	
	local CursorHint = CoD.CursorHint.new( self, controller )
	CursorHint:setLeftRight( false, false, -250, 250 )
	CursorHint:setTopBottom( false, false, 152, 246 )
	CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f34_local0 = IsCursorHintActive( controller )
				if f34_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f34_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 1 )
					else
						f34_local0 = false
					end
				end
				return f34_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f35_local0 = IsCursorHintActive( controller )
				if f35_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f35_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 2 )
					else
						f35_local0 = false
					end
				end
				return f35_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f36_local0 = IsCursorHintActive( controller )
				if f36_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f36_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 4 )
					else
						f36_local0 = false
					end
				end
				return f36_local0
			end
		},
		{
			stateName = "Active_NoImage",
			condition = function ( menu, element, event )
				local f37_local0 = IsCursorHintActive( controller )
				if f37_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f37_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 0 )
					else
						f37_local0 = false
					end
				end
				return f37_local0
			end
		}
	} )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cursorHintIconRatio" ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cursorHintIconRatio"
		} )
	end )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local ShockCharge0 = CoD.ShockCharge.new( self, controller )
	ShockCharge0:setLeftRight( false, false, -110.67, 110.67 )
	ShockCharge0:setTopBottom( false, false, -114, 94 )
	ShockCharge0:mergeStateConditions( {
		{
			stateName = "ShockTop",
			condition = function ( menu, element, event )
				return IsShockImageTopActive( controller )
			end
		},
		{
			stateName = "ShockLeft",
			condition = function ( menu, element, event )
				return IsShockImageLeftActive( controller )
			end
		},
		{
			stateName = "ShockRight",
			condition = function ( menu, element, event )
				return IsShockImageRightActive( controller )
			end
		},
		{
			stateName = "ShockBottom",
			condition = function ( menu, element, event )
				return IsShockImageBottomActive( controller )
			end
		}
	} )
	ShockCharge0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageTop" ), function ( model )
		self:updateElementState( ShockCharge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageTop"
		} )
	end )
	ShockCharge0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageLeft" ), function ( model )
		self:updateElementState( ShockCharge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageLeft"
		} )
	end )
	ShockCharge0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageRight" ), function ( model )
		self:updateElementState( ShockCharge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageRight"
		} )
	end )
	ShockCharge0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageBottom" ), function ( model )
		self:updateElementState( ShockCharge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageBottom"
		} )
	end )
	self:addElement( ShockCharge0 )
	self.ShockCharge0 = ShockCharge0
	
	local proximityAlarm = CoD.ProximityAlarm.new( self, controller )
	proximityAlarm:setLeftRight( false, false, -125, 125 )
	proximityAlarm:setTopBottom( false, false, 72, 104 )
	self:addElement( proximityAlarm )
	self.proximityAlarm = proximityAlarm
	
	local CaptureCrate = CoD.CaptureCrate.new( self, controller )
	CaptureCrate:setLeftRight( false, false, -149, 151 )
	CaptureCrate:setTopBottom( false, false, -165, -101 )
	self:addElement( CaptureCrate )
	self.CaptureCrate = CaptureCrate
	
	local ThrustMeterContainer0 = CoD.ThrustMeterContainer.new( self, controller )
	ThrustMeterContainer0:setLeftRight( false, false, -85, 85 )
	ThrustMeterContainer0:setTopBottom( false, false, 116, 156 )
	self:addElement( ThrustMeterContainer0 )
	self.ThrustMeterContainer0 = ThrustMeterContainer0
	
	local DeadSpectate = CoD.DeadSpectate.new( self, controller )
	DeadSpectate:setLeftRight( false, false, -150, 150 )
	DeadSpectate:setTopBottom( false, true, -180, -120 )
	self:addElement( DeadSpectate )
	self.DeadSpectate = DeadSpectate
	
	local ConsoleCenter = CoD.CenterConsole.new( self, controller )
	ConsoleCenter:setLeftRight( false, false, -370, 370 )
	ConsoleCenter:setTopBottom( true, false, 64, 162 )
	self:addElement( ConsoleCenter )
	self.ConsoleCenter = ConsoleCenter
	
	local SafeAreaContainerFront = CoD.T7Hud_SafeAreaContainer_Front.new( self, controller )
	SafeAreaContainerFront:setLeftRight( true, true, 0, 0 )
	SafeAreaContainerFront:setTopBottom( true, true, 0, 0 )
	SafeAreaContainerFront:registerEventHandler( "menu_loaded", function ( element, event )
		local f56_local0 = nil
		if IsMultiplayer() and not IsGameTypeEqualToString( "fr" ) then
			SizeToSafeArea( element, controller )
		end
		if not f56_local0 then
			f56_local0 = element:dispatchEventToChildren( event )
		end
		return f56_local0
	end )
	self:addElement( SafeAreaContainerFront )
	self.SafeAreaContainerFront = SafeAreaContainerFront
	
	self:mergeStateConditions( {
		{
			stateName = "HideNotifications",
			condition = function ( menu, element, event )
				local f57_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f57_local0 then
					f57_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					if not f57_local0 then
						f57_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f57_local0 then
							f57_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
						end
					end
				end
				return f57_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:registerEventHandler( "hud_boot", function ( self, event )
		local f62_local0 = nil
		if ShouldBootUpHUD( self ) then
			PlaySoundSetSound( self, "hud_boot" )
		end
		if not f62_local0 then
			f62_local0 = self:dispatchEventToChildren( event )
		end
		return f62_local0
	end )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f63_local0 = self
		if IsParamModelEqualToString( model, "player_spawned" ) and IsInPrematchPeriod() then
			TryBootHUD( self, "1000" )
		elseif IsParamModelEqualToString( model, "player_spawned" ) and not IsInPrematchPeriod() then
			TryBootHUD( self, "0" )
		elseif IsParamModelEqualToString( model, "create_prematch_timer" ) then
			CreatePrematchTimer( self, controller, model )
		elseif IsParamModelEqualToString( model, "prematch_waiting_for_players" ) then
			PrematchWaitingForPlayers( self, controller )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ArmorOverlayContainer0:close()
		element.vignettecornerright0:close()
		element.vignettecornerL:close()
		element.SafeAreaContainerBack:close()
		element.WaypointBase:close()
		element.interactPromptContainer:close()
		element.OutOfBounds:close()
		element.PlayerCardObituaryCallout:close()
		element.ThrustMeterBoot:close()
		element.Stuck:close()
		element.CursorHint:close()
		element.ShockCharge0:close()
		element.proximityAlarm:close()
		element.CaptureCrate:close()
		element.ThrustMeterContainer0:close()
		element.DeadSpectate:close()
		element.ConsoleCenter:close()
		element.SafeAreaContainerFront:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

