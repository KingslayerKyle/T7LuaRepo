function UpdateState( self, event )
	local evCopy = {}
	if event ~= nil then
		evCopy = LUI.ShallowCopy( event )
	end
	evCopy.name = "update_state"
	self:processEvent( evCopy )
end

function UpdateMenuState( menu, event )
	local evCopy = {}
	if event ~= nil then
		evCopy = LUI.ShallowCopy( event )
	end
	evCopy.name = "update_state"
	menu:updateElementState( evCopy )
end

function UpdateElementState( self, elementName, controller )
	if self[elementName] then
		self[elementName]:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function UpdateSelfElementState( menu, element, controller )
	element:processEvent( {
		name = "update_state",
		menu = menu,
		controller = controller
	} )
end

function SetLuiKeyCatcher( booleanArg )
	Engine.SetLuiKeyCatcher( booleanArg )
end

function UpdateAllMenuButtonPrompts( menu, controller )
	menu:UpdateAllButtonPrompts( controller )
end

function UpdateButtonPrompt( self, buttonPrompt, controller )
	if not self.buttonPromptAddFunctions then
		return 
	elseif not self.buttonPromptAddFunctions[buttonPrompt] or not self.buttonPromptAddFunctions[buttonPrompt]( self, self, {
		controller = controller
	} ) then
		self:removeButtonPrompt( buttonPrompt, self )
	end
end

function SetButtonPromptEnabled( menu, enumValue )
	menu:SetButtonPromptState( enumValue, Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
end

function SetButtonPromptDisabled( menu, enumValue )
	menu:SetButtonPromptState( enumValue, Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
end

function SetButtonPromptHidden( menu, enumValue )
	menu:SetButtonPromptState( enumValue, Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS )
end

function UpdateButtonPromptState( menu, element, controller, enumValue )
	CoD.Menu.UpdateButtonShownState( element, menu, controller, enumValue )
end

function SendButtonPressToSiblingMenu( menu, siblingMenuName, controller, model, enumValue )
	local siblingMenu = menu:getParent()
	siblingMenu = siblingMenu and siblingMenu[siblingMenuName]
	if siblingMenu then
		CoD.Menu.HandleButtonPress( siblingMenu, controller, enumValue, model )
	end
end

function SendButtonPressToMenu( menu, controller, model, enumValue )
	CoD.Menu.HandleButtonPress( menu, controller, enumValue, model )
end

function SetProperty( self, propertyName, expressionArg )
	self[propertyName] = expressionArg
end

function SetElementProperty( element, propertyName, expressionArg )
	element[propertyName] = expressionArg
end

function ForceNotifyGlobalModel( controller, modelName )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetGlobalModel(), modelName ) )
end

function ForceNotifyModel( controller, modelName )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( controller ), modelName ) )
end

function SetControllerModelValue( controller, modelName, expressionArg )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), modelName ), expressionArg )
end

function ToggleControllerModelValueBoolean( controller, modelName )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelName )
	Engine.SetModelValue( model, not Engine.GetModelValue( model ) )
end

function ToggleControllerModelValueNumber( controller, modelName )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelName )
	Engine.SetModelValue( model, 1 - Engine.GetModelValue( model ) )
end

function SetMenuModelValue( menu, modelName, expressionArg )
	Engine.SetModelValue( Engine.GetModel( menu:getModel(), modelName ), expressionArg )
end

function ToggleGlobalModelValueBoolean( modelName )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, not Engine.GetModelValue( model ) )
end

function SetGlobalModelValueTrue( modelName )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, true )
end

function SetGlobalModelValueFalse( modelName )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, false )
end

function SetGlobalModelValue( modelName, modelValue )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, modelValue )
end

function SetGlobalModelValueArg( modelName, expressionArg )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, expressionArg )
end

function SetElementModelValue( element, modelName, expressionArg )
	Engine.SetModelValue( Engine.GetModel( element:getModel(), modelName ), expressionArg )
end

function DispatchEventToChildren( element, eventName, controller )
	return element:dispatchEventToChildren( {
		name = eventName,
		controller = controller
	} )
end

function SetPerControllerTableProperty( controller, propertyName, expressionArg )
	CoD.perController[controller][propertyName] = expressionArg
end

function SetPerControllerTablePropertyEnum( controller, propertyName, enumValue )
	CoD.perController[controller][propertyName] = enumValue
end

function SetElementModelOnPerControllerTable( controller, propertyName, element, elementModelName )
	local value = nil
	local elementModel = element:getModel( controller, elementModelName )
	if elementModel then
		value = Engine.GetModelValue( elementModel )
	end
	CoD.perController[controller][propertyName] = value
end

function CopyElementModelToPerControllerTable( controller, propertyName, element )
	CoD.perController[controller][propertyName] = element:getModel()
end

function SetElementPropertyOnPerControllerTable( controller, propertyName, element, elementProperty )
	CoD.perController[controller][propertyName] = element[elementProperty]
end

function SetModelFromPerControllerTable( controller, self, propertyName )
	self:setModel( CoD.perController[controller][propertyName] )
end

function SendClientScriptNotify( controller, param1, param2 )
	Engine.SendClientScriptNotify( controller, param1, param2 )
end

function SendClientScriptEnumNotify( controller, notifyName, enumValue )
	Engine.SendClientScriptNotify( controller, notifyName, enumValue )
end

function SendClientScriptEnumNotifyTwoParam( controller, notifyName, param1, enumValue )
	Engine.SendClientScriptNotify( controller, notifyName, param1, enumValue )
end

function SendClientScriptCustomPropertyNotify( controller, element, notifyName, property, ... )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName, element[property], ... )
	end
end

function SendClientScriptPropertyNotify( controller, element, notifyName, property )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName, element[property] )
	end
end

function SendClientScriptPropertyNotifyTwoParam( controller, element, notifyName, param1, property )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName, param1, element[property] )
	end
end

function SendClientScriptModelNotify( controller, element, notifyName, modelName )
	local eModel = element:getModel( controller, modelName )
	if eModel then
		Engine.SendClientScriptNotify( controller, notifyName, Engine.GetModelValue( eModel ) )
	end
end

function SendClientScriptModelNotifyTwoParam( controller, element, notifyName, param1, modelName )
	local eModel = element:getModel( controller, modelName )
	if eModel then
		Engine.SendClientScriptNotify( controller, notifyName, param1, Engine.GetModelValue( eModel ) )
	end
end

function SendClientScriptMultiModelNotify( controller, element, notifyName, ... )
	local models = {}
	for _, item in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local eModel = element:getModel( controller, item )
		if not eModel then
			return 
		end
		table.insert( models, Engine.GetModelValue( eModel ) )
	end
	Engine.SendClientScriptNotify( controller, notifyName, table.unpack( models ) )
end

function SendClientScriptMultiModelNotifyTwoParam( controller, element, notifyName, param1, ... )
	local models = {}
	for _, item in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local eModel = element:getModel( controller, item )
		if not eModel then
			return 
		end
		table.insert( models, Engine.GetModelValue( eModel ) )
	end
	Engine.SendClientScriptNotify( controller, notifyName, param1, table.unpack( models ) )
end

local SendClientScriptMenuChangeNotifyHelper = function ( controller, menuName, opened, state )
	local status = "closed"
	if opened then
		status = "opened"
	end
	if state then
		Engine.SendClientScriptNotify( controller, "menu_change", menuName, status, state )
	else
		Engine.SendClientScriptNotify( controller, "menu_change", menuName, status )
	end
end

function SendClientScriptMenuChangeNotify( controller, menu, booleanArg )
	SendClientScriptMenuChangeNotifyHelper( controller, menu.menuName, booleanArg )
end

function SendCustomClientScriptMenuChangeNotify( controller, name, booleanArg )
	SendClientScriptMenuChangeNotifyHelper( controller, name, booleanArg )
end

function SendClientScriptMenuStateChangeNotify( controller, menu, booleanArg, state )
	SendClientScriptMenuChangeNotifyHelper( controller, menu.menuName, booleanArg, state )
end

function SendCustomClientScriptMenuStateChangeNotify( controller, name, booleanArg, state )
	SendClientScriptMenuChangeNotifyHelper( controller, name, booleanArg, state )
end

function CallCustomElementFunction_Self( self, functionName, ... )
	if self[functionName] then
		self[functionName]( self, ... )
	end
end

function CallCustomElementFunction_Element( element, functionName, ... )
	if element[functionName] then
		element[functionName]( element, ... )
	end
end

function SetProfileVar( controller, profileVarName, expressionArg )
	Engine.SetProfileVar( controller, profileVarName, expressionArg )
end

function PlaySoundSetSound( self, soundSetElem )
	self:playSound( soundSetElem )
end

function PlayMenuMusic( musicAlias )
	Engine.PlayMenuMusic( musicAlias )
end

function PlaySoundAlias( soundAlias )
	Engine.PlaySound( soundAlias )
end

function StopSoundAlias( soundAlias )
	Engine.StopSound( soundAlias )
end

function UpdateModel( self, element, controller )
	self:setModel( element:getModel() )
end

function UpdateElementModelToFocusedElementModel( self, element, elementName, event )
	if self[elementName] then
		local focusedElement = self
		for index, value in pairs( event.idStack ) do
			if value ~= self.id then
				focusedElement = focusedElement[REG9]
			end
		end
		if focusedElement and focusedElement.id == event.id then
			self[elementName]:setModel( focusedElement:getModel() )
		end
	end
end

function CreateModelOnSelfModel( self, element, modelName )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.CreateModel( model, modelName )
	end
end

function SetSelfModelValue( self, element, controller, modelName, expressionArg )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.SetModelValue( model, expressionArg )
	end
end

function ToggleSelfModelValueNumber( self, element, controller, modelName )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.SetModelValue( model, 1 - Engine.GetModelValue( model ) )
	end
end

function ToggleSelfModelBoolean( self, element, controller, modelName )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.SetModelValue( model, not Engine.GetModelValue( model ) )
	end
end

function ForceNotifyControllerModel( controller, modelPath )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	if model then
		Engine.ForceNotifyModelSubscriptions( model )
	end
end

function ShowKeyboard( self, element, controller, keyboardName )
	Engine.Exec( controller, "ui_keyboard_new " .. Enum.KeyboardType[keyboardName] )
end

function RunClientDemo( self, element, controller )
	local index = element.gridInfoTable.zeroBasedIndex + 1
	local model = element:getModel( controller, "fileName" )
	local fileName = Engine.GetModelValue( model )
	Engine.Exec( controller, "cl_demo_play " .. fileName )
end

function LobbySetLeaderActivity( self, controller, activityName )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity[activityName] )
end

function LobbyResetLeaderActivity( self, controller )
	CoD.LobbyBase.ResetLeaderActivity( controller )
end

function LobbyBeginPlay( self, controller )
	CoD.LobbyBase.BeginPlay( self, controller )
end

function GoBackAndLobbyBeginPlay( self, controller )
	local mainMenu = GoBackToMenu( self, controller, "Main" )
	LobbyBeginPlay( mainMenu, controller )
end

function StartGame( self, controller )
	if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
		Engine.PartyHostReassignTeams()
	end
	Engine.PartyHostToggleStart()
end

function SetPrimary( self, controller )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
end

function SwitchToMainLobby( self, controller )
	Engine.SessionModeSetOnlineGame( true )
	Engine.Exec( controller, "xstartprivateparty" )
	Engine.Exec( controller, "party_statechanged" )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	Engine.Exec( controller, "session_rejoinsession " .. CoD.SESSION_REJOIN_CHECK_FOR_SESSION )
end

function SwitchToMainMenu( self, controller )
	Engine.SessionModeResetModes()
	Engine.Exec( controller, "xstopprivateparty" )
	if CoD.isPS3 then
		Engine.Exec( controller, "signoutSubUsers" )
	end
end

function SwitchToSystemLinkLobby( self, controller )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	Engine.ExecNow( controller, "leaveAllParties" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_systemlink" ), Engine.DvarInt( controller, "party_maxlocalplayers_systemlink" ), false )
	Engine.SessionModeSetOnlineGame( false )
	Engine.SessionModeSetSystemLink( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, true )
	Engine.ExecNow( controller, "exec gamedata/configs/common/default_private.cfg" )
	Engine.SetGametype( SwitchLobbies_GetGametype( controller ) )
	Engine.ExecNow( controller, "ui_mapname " .. SwitchLobbies_GetMap( controller ) )
	Engine.Exec( controller, "xstartlocalprivateparty" )
	Engine.Exec( controller, "xstartpartyhost" )
	Dvar.party_maxplayers:set( Dvar.party_maxplayers_systemlink:get() )
	Engine.Exec( controller, "party_statechanged" )
end

function RefreshLobbyGameClient( self, controller )
	local gameClientUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	local update = Engine.GetModelValue( gameClientUpdateModel )
	if update == 0 then
		update = 1
	else
		update = 0
	end
	Engine.SetModelValue( gameClientUpdateModel, update )
end

function ShowHeaderIconOnly( menu )
	menu.showHeaderKicker = false
	menu.showHeaderIcon = true
end

function ShowHeaderKickerAndIcon( menu )
	menu.showHeaderKicker = true
	menu.showHeaderIcon = true
end

function SetHeadingKickerText( newValue )
	local headingKickerTextModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if headingKickerTextModel then
		Engine.SetModelValue( headingKickerTextModel, Engine.Localize( newValue ) )
	end
end

function SetHeadingKickerTextToGameMode()
	local modeModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local textModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if textModel then
		local f79_local0 = Engine.SetModelValue
		local f79_local1 = textModel
		local f79_local2
		if modeModel then
			f79_local2 = Engine.GetModelValue( modeModel )
			if not f79_local2 then
			
			else
				f79_local0( f79_local1, f79_local2 )
			end
		end
		f79_local2 = ""
	end
end

function SetHeadingKickerTextToSelectedWeapon( controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local textModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if textModel and weaponIndex ~= CoD.CACUtility.EmptyItemIndex then
		local weapon_ref = Engine.GetItemRef( weaponIndex )
		local weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( weaponIndex ) ) )
		if textModel and weaponName then
			Engine.SetModelValue( textModel, weaponName )
		end
	end
end

function RefreshServerList( self, controller )
	Engine.LobbyServerRefreshLocalServers( controller )
end

function JoinSystemLinkServer( self, element, controller )
	Engine.LobbyServerListJoinServer( controller, element.gridInfoTable.zeroBasedIndex )
end

function LobbyLANServerPlayerListRefresh( self, element, controller )
	local index = element.gridInfoTable.zeroBasedIndex
	local serverModel = Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" )
	local selectedServerModel = Engine.CreateModel( serverModel, "selectedServer" )
	Engine.SetModelValue( selectedServerModel, index )
	if self.LANServerBrowserDetails and self.LANServerBrowserDetails.PlayerList then
		self.LANServerBrowserDetails.PlayerList:updateDataSource()
	end
end

function UploadStats( self, controller )
	Engine.Exec( controller, "uploadstats" )
	Engine.Exec( controller, "savegamerprofilestats" )
end

function SaveLoadout( self, controller )
	Engine.Exec( controller, "saveLoadout" )
end

function OpenCACItemBansRestrictionsFlyout( self, element, controller )
	SetGlobalModelValueTrue( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) )
end

function CharacterDraftLoadoutSelected( self, element, controller )
	if not CharacterDraftActive() then
		return 
	else
		local mode = CoD.perController[controller].customizationMode
		local selectedCharacter = Engine.GetEquippedHero( controller, mode )
		Engine.SendCharacterDraftSelection( controller, selectedCharacter, Engine.GetLoadoutTypeForHero( controller, selectedCharacter ) )
	end
end

function ForceNotifyPregameUpdate( self, element, controller )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	Engine.ForceNotifyModelSubscriptions( pregameUpdateModel )
end

function AdjustPregameVoteFilter( self, element, controller, param )
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
	local voteFilterModel = Engine.CreateModel( pregameModel, "voteFilter" )
	local currentFilterIndex = Engine.GetModelValue( voteFilterModel )
	local nextFilter = currentFilterIndex + tonumber( param )
	if nextFilter > #CoD.CACUtility.PregameLoadoutFilters then
		nextFilter = 1
	end
	if nextFilter < 1 then
		nextFilter = #CoD.CACUtility.PregameLoadoutFilters
	end
	Engine.SetModelValue( voteFilterModel, nextFilter )
end

function ToggleRestrictedContentEquippedFilter( controller )
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
	local equippedFilterModel = Engine.CreateModel( pregameModel, "equippedFilter" )
	Engine.SetModelValue( equippedFilterModel, not Engine.GetModelValue( equippedFilterModel ) )
end

function SendItemVote( self, element, controller, enumValue )
	local itemTypeModel = element:getModel( controller, "itemType" )
	local itemType = Engine.GetModelValue( itemTypeModel )
	local itemIndex = -1
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local attachmentIndex = -1
	local attachmentIndexModel = element:getModel( controller, "attachmentIndex" )
	if attachmentIndexModel then
		attachmentIndex = Engine.GetModelValue( attachmentIndexModel )
	end
	local itemGroup = -1
	local itemGroupModel = element:getModel( controller, "itemGroup" )
	if itemGroupModel then
		itemGroup = Engine.GetModelValue( itemGroupModel )
	end
	if itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
		Engine.SendItemVote( controller, itemIndex, enumValue )
	elseif itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
		Engine.SendAttachmentVote( controller, attachmentIndex, enumValue )
	elseif itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
		Engine.SendItemAttachmentVote( controller, itemIndex, attachmentIndex, enumValue )
	elseif itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
		Engine.SendItemGroupAttachmentVote( controller, itemGroup, attachmentIndex, enumValue )
	end
end

function VoteBanItem( self, element, controller )
	SendItemVote( self, element, controller, Enum.VoteType.VOTE_TYPE_BAN )
end

function VoteProtectItem( self, element, controller )
	SendItemVote( self, element, controller, Enum.VoteType.VOTE_TYPE_PROTECT )
end

function ShowPregameVoteOptions( self, element, controller )
	CoD.OverlayUtility.AddSystemOverlay( "PregameVoteOptions", {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.Pregame_ItemVote_BanProtectPopup",
		title = "MENU_BAN_PROTECT_CAPS",
		description = function ( controller, selectedListElement )
			local nameModel = element:getModel( controller, "name" )
			local name = Engine.GetModelValue( nameModel )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame.selectedItemName" ), name )
			local loadoutSlotModel = element:getModel( controller, "loadoutSlot" )
			return "MENU_BAN_PROTECT_DESC"
		end,
		image = function ( controller )
			local imageModel = element:getModel( controller, "image" )
			if imageModel then
				return Engine.GetModelValue( imageModel )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		state = function ( controller, selectedListElement )
			local banned = ItemIsBanned( nil, selectedListElement, controller )
			if banned == true then
				local itemInfo = CoD.CACUtility.GetItemInfoFromElementModel( controller, element:getModel() )
				local gamertag = CoD.CACUtility.GetItemVotedBy( itemInfo )
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame.itemVotedBy" ), gamertag )
				return Enum.VoteType.VOTE_TYPE_BAN
			else
				local protected = ItemIsProtected( nil, selectedListElement, controller )
				if protected == true then
					local itemInfo = CoD.CACUtility.GetItemInfoFromElementModel( controller, element:getModel() )
					local gamertag = CoD.CACUtility.GetItemVotedBy( itemInfo )
					Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame.itemVotedBy" ), gamertag )
					return Enum.VoteType.VOTE_TYPE_PROTECT
				else
					return Enum.VoteType.VOTE_TYPE_INVALID
				end
			end
		end,
		listDatasource = function ( controller, selectedListElement )
			DataSources.PregameVoteButtons = DataSourceHelpers.ListSetup( "PregameVoteButtons", function ( controller )
				local disabled = false
				if ItemIsBanned( nil, selectedListElement, controller ) then
					disabled = true
				end
				if disabled == false and ItemIsProtected( nil, selectedListElement, controller ) then
					disabled = true
				end
				local result = {
					{
						models = {
							displayText = "MENU_BAN_CAPS",
							disabled = disabled
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								SendItemVote( self, selectedListElement, controller, Enum.VoteType.VOTE_TYPE_BAN )
							end
						}
					},
					{
						models = {
							displayText = "MENU_PROTECT_CAPS",
							disabled = disabled
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								SendItemVote( self, selectedListElement, controller, Enum.VoteType.VOTE_TYPE_PROTECT )
							end
						}
					}
				}
				return result
			end, nil, nil, function ( controller, list, listModel )
				local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
				if list.pregameUpdateSubscription then
					list:removeSubscription( list.pregameUpdateSubscription )
				end
				list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
					list:updateDataSource( false, false )
				end, false )
			end )
			return "PregameVoteButtons"
		end
	} )
	local overlay = CoD.OverlayUtility.CreateOverlay( controller, self, "PregameVoteOptions", controller, element )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	overlay:subscribeToModel( pregameUpdateModel, function ()
		overlay:refreshData( controller, element )
	end, false )
end

function ConfirmPregameVotePass( self, element, controller )
	CoD.OverlayUtility.AddSystemOverlay( "PregamePassConfirm", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_VOTE_FOREFIT_CAPS",
		description = "MENU_VOTE_FOREFIT_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ()
			DataSources.PregamePassConfirmButtons = DataSourceHelpers.ListSetup( "PregamePassConfirmButtons", function ( controller )
				return {
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CANCEL_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( self, controller )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CONFIRM_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SendItemVote( controller, 0, Enum.VoteType.VOTE_TYPE_INVALID )
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "PregamePassConfirmButtons"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( controller, self, "PregamePassConfirm" )
end

function ShowCACContentWarning( self, element, controller )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "FeatureOverlay",
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		categoryType = function ( controller )
			return CoD.OverlayUtility.OverlayTypes.GenericMessage
		end,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( controller, self, "PregameCACWarning", controller )
end

function ShowStreakContentWarning( self, element, controller )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "FeatureOverlay",
		title = "MENU_STREAK_BANNED_CAPS",
		description = "MENU_CAC_CONTENT_BANNED_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( controller, self, "PregameCACWarning" )
end

function SetInitLobbyMenu( self, controller )
	CoD.LobbyBase.SetInitLobbyMenu( self, controller )
end

function LobbyToggleNetwork( self, element, controller, param )
	local data = {
		controller = controller,
		networkMode = param
	}
	Engine.LobbyVM_CallFunc( "NetworkModeChanged", data )
	local parent = self:getParent()
	self:close()
	local spinnerEvent = {
		name = "lobby_spinner_popup",
		openPopup = true
	}
	parent:processEvent( spinnerEvent )
end

function GenericPopupClose( self, element, controller, param )
	GoBack( self, controller )
end

function OpenLobbyToggleNetworkConfirmation( self, element, controller, param, menu )
	local options = {}
	local title, description = nil
	local networkMode = Engine.GetLobbyNetworkMode()
	if networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		if Engine.IsPlayerQueued( controller ) then
			CoD.OverlayUtility.CreateOverlay( controller, self, "LoginQueue" )
			return 
		elseif Engine.IsSignedInToLive( controller ) == false then
			title = Engine.Localize( "MENU_ERROR_CAPS" )
			description = Engine.Localize( "XBOXLIVE_SIGNEDOUTOFLIVE" )
			table.insert( options, {
				optionDisplay = "OK",
				action = GenericPopupClose,
				param = nil,
				customId = "btnOK"
			} )
		else
			if not Engine.IsDemonwareFetchingDone( controller ) then
				CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
				return 
			end
			title = Engine.Localize( "MENU_PLAY_ONLINE_CAPS" )
			description = Engine.Localize( "MENU_PLAY_ONLINE_DESC" )
			table.insert( options, {
				optionDisplay = "MENU_PLAY_ONLINE",
				action = LobbyToggleNetwork,
				param = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
				customId = "btnPlayOnline"
			} )
			table.insert( options, {
				optionDisplay = "MENU_CANCEL",
				action = GenericPopupClose,
				param = nil,
				customId = "btnCancel"
			} )
		end
	elseif networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		title = Engine.Localize( "MENU_PLAY_LOCAL_CAPS" )
		description = Engine.Localize( "XBOXLIVE_PLAY_LOCAL_DESC" )
		table.insert( options, {
			optionDisplay = "MENU_PLAY_LOCAL",
			action = LobbyToggleNetwork,
			param = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
			customId = "btnPlayLocal"
		} )
		table.insert( options, {
			optionDisplay = "MENU_CANCEL",
			action = GenericPopupClose,
			param = nil,
			customId = "btnCancel"
		} )
	end
	CoD.LobbyBase.SetPrompt( title, description, options )
	menu:openPopup( "LobbyPromptPopup", controller )
end

function LobbyNoAction( self, element, controller, param, menu )
	
end

function LobbyGiveLeadership( self, element, controller, param, menu )
	CoD.LobbyBase.GiveLeadership( menu, element, controller )
end

function OpenMPFirstTimeFlow( self, element, controller, param, menu )
	local tutorialModel = Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" )
	Engine.SetModelValue( tutorialModel, true )
	if param == "goBackFirst" then
		menu = GoBack( self, controller )
	end
	OpenOverlay( menu, "WelcomeMenu", controller )
	NavigateToLobby_FirstTimeFlowMP( self, nil, controller, nil )
end

function OpenCPFirstTimeFlow( self, element, controller, param, menu )
	local firstTimeFlowModel = Engine.CreateModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" )
	Engine.SetModelValue( firstTimeFlowModel, false )
	NavigateToMenu( self, "CPWelcomeMenu", true, controller )
end

function FirstTimeSetup_SetOverview( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.CCUtility.FirstTimeFlowState.Overview )
end

function FirstTimeSetup_SetChangedCharacter( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.CCUtility.FirstTimeFlowState.SelectionChanged )
end

function FirstTimeSetup_SetComplete( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.CCUtility.FirstTimeFlowState.Complete )
end

function FirstTimeSetup_SetNone( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.CCUtility.FirstTimeFlowState.None )
end

function NavigateCheckForFirstTime( self, element, controller, param, menu )
	if IsFirstTimeSetup( controller, param.mode ) then
		param.firstTimeFlowAction( self, element, controller, param.targetName, menu )
	else
		NavigateToLobby_SelectionList( self, element, controller, param.targetName, menu )
	end
end

function OpenChooseCharacterFromFirstTimeFlow( self, element, controller, param, menu )
	CoD.perController[controller].customizationMode = Enum.eModes.MODE_MULTIPLAYER
	local menu = CoD.LobbyBase.OpenChooseCharacterLoadout( menu, controller )
	menu.previousMode = Engine.GetMostRecentPlayedMode( controller )
end

function FirstTimeFlowResetCharacterMode( self, element, controller, param, menu )
	Engine.SetMostRecentPlayedMode( menu.previousMode )
	Engine.SwitchMode( controller, "" )
end

function SetCharacterModeToSessionMode( self, element, controller, enumValue )
	CoD.perController[controller].customizationMode = enumValue
end

function SetCharacterModeToCurrentSessionMode( self, element, controller )
	CoD.perController[controller].customizationMode = Engine.CurrentSessionMode()
end

function SetFirstTimeSetupComplete_MP( self, element, controller, param, menu )
	Engine.SetFirstTimeComplete( controller, Enum.eModes.MODE_MULTIPLAYER, true )
	FirstTimeSetup_SetNone( controller )
end

function CloseMPFirstTimeFlow( self, element, controller, param, menu )
	GoBack( self, controller )
end

function OpenFindMatch( self, element, controller, param, menu )
	CoD.LobbyBase.OpenFindMatch( menu, controller )
end

function OpenSetupGameMP( self, element, controller, param, menu )
	CoD.LobbyBase.OpenSetupGame( menu, controller, "GameSettingsFlyoutMP" )
end

function OpenSetupGameZM( self, element, controller, param, menu )
	CoD.LobbyBase.OpenSetupGame( menu, controller, "GameSettingsFlyoutZM" )
end

function OpenSetupGame( self, element, controller, param, menu )
	CoD.LobbyBase.OpenSetupGame( menu, controller, "GameSettingsFlyout" )
end

function OpenBubbleGumPacksMenu( self, element, controller, param, menu )
	CoD.LobbyBase.OpenBubbleGumBuffs( menu, controller )
end

function OpenMegaChewFactorymenu( self, element, controller, param, menu )
	CoD.LobbyBase.OpenMegaChewFactory( menu, controller )
end

function OpenWeaponBuildKits( self, element, controller, param, menu )
	CoD.LobbyBase.OpenWeaponBuildKits( menu, controller )
end

function OpenChangeMap( self, element, controller, param, menu )
	CoD.LobbyBase.OpenChangeMap( self, controller )
end

function OpenChangeGameMode( self, element, controller, param, menu )
	CoD.LobbyBase.OpenChangeGameMode( self, controller )
end

function OpenEditGameRules( self, element, controller, param, menu )
	CoD.LobbyBase.OpenEditGameRules( self, controller )
end

function OpenOptions( self, element, controller, param, menu )
	CoD.LobbyBase.OpenOptions( menu, controller )
end

function OpenZMMapSelectLaunch( self, element, controller, data, menu )
	CoD.LobbyBase.ZMOpenChangeMap( menu, controller, CoD.LobbyBase.MapSelect.LAUNCH, data )
end

function OpenZMMapSelectNavigate( self, element, controller, data, menu )
	CoD.LobbyBase.ZMOpenChangeMap( menu, controller, CoD.LobbyBase.MapSelect.NAVIGATE, data )
end

function OpenZMMapSelectSelect( self, element, controller, data, menu )
	CoD.LobbyBase.ZMOpenChangeMap( menu, controller, CoD.LobbyBase.MapSelect.SELECT, data )
end

function ProcessZMMapSelectListAction( self, element, controller, menu )
	if element.mapId ~= nil then
		SetMap( controller, element.mapId )
	end
	GoBack( self, controller )
end

function OpenMissionSelect( self, element, controller, param, menu )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "custom" )
	end
	menu:openPopup( "CPMissionSelect", controller )
end

function OpenPublicGameSelect( self, element, controller, param, menu )
	menu:openPopup( "CPPublicGameSelect", controller )
end

function OpenMissionOverview( self, element, controller, param, menu )
	menu:openPopup( "CPMissionOverviewFrontend", controller )
end

function OpenDifficultySelect( self, element, controller, param, menu )
	local selectDifficultyMenu = menu:openPopup( "CPSelectDifficulty", controller )
	selectDifficultyMenu.disableConfirmSelection = param
end

function OpenCAC( self, element, controller, param, menu )
	CoD.LobbyBase.OpenCAC( menu, controller )
end

function OpenFindLANGame( self, element, controller, param, menu )
	OpenPopup( menu, "LobbyServerBrowserOverlay", controller )
end

function OpenStore( self, element, controller, param, menu )
	if not DisableStore() then
		OpenOverlay( menu, "Store", controller )
		local currentLobbyMenu = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( menu, controller, param, currentLobbyMenu )
		local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( rootModel, "actionSource", true ), param )
		Engine.SetModelValue( Engine.CreateModel( rootModel, "storeSource", true ), currentLobbyMenu.name )
	end
end

function OpenFindLANGameFromPrompt( self, element )
	OpenPopup( self, "LobbyServerBrowserOverlay", self:getOwner() )
end

function OpenScorestreaks( self, element, controller, param, menu )
	CoD.LobbyBase.OpenScorestreaks( menu, controller )
end

function OpenEditCodcasterSettings( self, element, controller, param, menu )
	CoD.LobbyBase.OpenEditCodcasterSettings( menu, controller )
end

function OpenTest( self, element, controller, param, menu )
	CoD.LobbyBase.OpenTest( menu, controller )
end

function OpenBarracks( self, element, controller, param, menu )
	CoD.LobbyBase.OpenBarracks( menu, controller )
end

function OpenGenders( self, controller, menu )
	CoD.LobbyBase.OpenGenders( menu, controller )
end

function OpenQuit( self, element, controller, param, menu )
	CoD.LobbyBase.OpenQuit( menu, controller )
end

function OpenFriends( self, element, controller, param, menu )
	
end

function OpenSocial( self, element, controller, param, menu )
	menu:openPopup( "Friends", controller )
end

function OpenLANPlayers( self, element, controller, param, menu )
	
end

function OpenConnectingSpinner( self, element, controller )
	CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
end

function LobbyMapVoteSelectNext( self, controller )
	CoD.LobbyBase.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT )
end

function LobbyMapVoteSelectPrevious( self, controller )
	CoD.LobbyBase.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS )
end

function LobbyMapVoteSelectRandom( self, controller )
	CoD.LobbyBase.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM )
end

function ShowManagePartyPopup( menu, self, element, controller, param )
	CoD.perController[controller].Social_Party = self
	CoD.perController[controller].Social_Party_Action = 0
	local model = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartyButtonText" )
	if model then
		if param == "PROMOTE" then
			CoD.perController[controller].Social_Party_Action = 1
			Engine.SetModelValue( model, Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) )
		elseif param == "KICK" then
			CoD.perController[controller].Social_Party_Action = 2
			Engine.SetModelValue( model, Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) )
		else
			return 
		end
		SetState( self, "Hidden" )
		OpenPopup( menu, "Social_Party_ManagePartyPopup", controller )
	end
end

function ManagePartyAction( menu, self, element, controller )
	local xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
	if CoD.perController[controller].Social_Party_Action == 1 then
		if Engine.StartPrivateLobbyMigrateTo then
			Engine.StartPrivateLobbyMigrateTo( controller, xuid )
		end
		local previousMenu = GoBack( self, controller )
		GoBackToMenu( previousMenu, controller, "Lobby" )
	elseif CoD.perController[controller].Social_Party_Action == 2 and Engine.IsLeader( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.LobbyDisconnectClient( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	end
end

function PromoteToLeader( self, element, controller, params, menu )
	Engine.GiveLeadership( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid )
	menu:goBack( controller )
end

function DisconnectClient( self, element, controller, params, menu )
	Engine.LobbyDisconnectClient( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	menu:goBack( controller )
end

function MutePlayer( self, element, controller, params, menu )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid ) then
		Engine.MutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid )
	elseif Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid ) then
		Engine.MutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid )
	end
	menu:goBack( controller )
end

function UnMutePlayer( self, element, controller, params, menu )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid ) then
		Engine.UnMutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid )
	elseif Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid ) then
		Engine.UnMutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid )
	end
	menu:goBack( controller )
end

function ShowSocialPartyWidget( controller )
	if CoD.perController[controller].Social_Party then
		CoD.perController[controller].Social_Party:setState( "DefaultState" )
	end
end

function LobbyPartyPrivacy( self, element, controller, param, menu )
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local privacyModel = Engine.GetModel( partyPrivacyModel, "privacy" )
	local privacy = Engine.GetModelValue( privacyModel )
	local move = 1
	if param == "left" then
		move = -1
	elseif param == "right" then
		move = 1
	end
	Engine.SetModelValue( privacyModel, (privacy + move) % Enum.PartyPrivacy.PARTY_PRIVACY_COUNT )
end

function LobbyPartyPrivacyMaxPlayers( self, element, controller, param, menu )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData:UITargetFromId( currentMenuIdx )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	local move = 1
	if param == "left" then
		move = -1
	elseif param == "right" then
		move = 1
	end
	Engine.SetModelValue( maxPlayersModel, math.min( math.max( clientCount, maxPlayers + move ), currentMenu.maxClients ) )
end

function LobbyPartyPrivacyMaxPlayersOnClientAdded( self, controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData:UITargetFromId( currentMenuIdx )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	Engine.SetModelValue( maxPlayersModel, math.min( math.max( clientCount, maxPlayers ), currentMenu.maxClients ) )
end

function LobbyPartyPrivacySave( self, controller )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local privacy = Engine.GetModelValue( Engine.GetModel( partyPrivacyModel, "privacy" ) )
	local maxPlayers = Engine.GetModelValue( Engine.GetModel( partyPrivacyModel, "maxPlayers" ) )
	Engine.SetModelValue( Engine.GetModel( partyPrivacyModel, "privacyStatus" ), PartyPrivacy( privacy ) )
	Engine.SetPartyPrivacy( privacy )
	Engine.SetLobbyMaxClients( lobbyType, maxPlayers )
	Engine.SetProfileVar( controller, "party_privacyStatus", privacy )
	Engine.SetProfileVar( controller, "party_maxplayers", maxPlayers )
	Engine.Exec( controller, "updategamerprofile" )
	GoBack( self, controller )
end

function LobbyPartyPrivacyAccept( self, element, controller )
	local activeWidget = element.Slider.activeWidget
	local actionModel = activeWidget:getModel( controller, "action" )
	local paramModel = activeWidget:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = activeWidget.action
		actionParam = activeWidget.actionParam
	end
	if actionFn then
		actionFn( self, activeWidget, controller, actionParam, activeWidget.gridInfoTable.parentGrid.menu )
	end
	Engine.Exec( controller, "updategamerprofile" )
end

function LobbyPartyPrivacyCancel( self, element, controller )
	local activeWidget = element.Slider.activeWidget
	local actionModel = activeWidget:getModel( controller, "action" )
	local paramModel = activeWidget:getModel( controller, "param" )
	local path = Engine.GetModelPath( element )
	path = Engine.GetModelPath( element.Slider )
	path = Engine.GetModelPath( element.Slider.activeWidget )
	local actionFn, actionParam, model = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = activeWidget.revertAction
		actionParam = activeWidget.actionParam
		model = element:getModel( controller, "currentSelection" )
	end
	if actionFn then
		actionFn( element, activeWidget, controller, actionParam, activeWidget.gridInfoTable.parentGrid.menu )
	end
end

function LobbyTeamSelectionLB( self, element, controller )
	CoD.LobbyBase.LobbyTeamSelection( self, controller, 0, element.xuid )
end

function LobbyTeamSelectionRB( self, element, controller )
	CoD.LobbyBase.LobbyTeamSelection( self, controller, 1, element.xuid )
end

function LobbyLocalLaunchGame( self, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANLaunchGame( self, element, controller )
	if CoD.isZombie and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
		Engine.SetDvar( "ui_useloadingmovie", "1" )
	end
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANServerBrowserSetMainModeFilter( self, controller )
	CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter( self, controller )
end

function LobbyOnlinePublicLaunchGame_SelectionList( self, element, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlinePublicLaunchGame( self, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function StartNewGame( self, element, controller )
	if Engine.IsCampaignModeZombies() then
		SetMap( controller, "cp_mi_sing_sgen" )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		SetMap( controller, "cp_sh_mobile" )
		Engine.SetDvar( "cp_queued_level", "cp_mi_eth_prologue" )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function SetTMode( self, element, controller )
	Engine.SetDvar( "r_tacScan_Layout", element.gridInfoTable.zeroBasedIndex )
end

function LobbyOnlineCustomLaunchGame_SelectionList( self, element, controller )
	if CoD.isZombie and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
		Engine.SetDvar( "ui_useloadingmovie", "1" )
	end
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlineCustomLaunchGame( self, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function OpenTheaterSelectFilm( self, element, controller, param, menu )
	CoD.LobbyBase.OpenTheaterSelectFilm( menu, controller )
end

local LobbyTheaterLaunchDemo = function ( self, element, controller, demoMode )
	local info = Engine.LobbyGetDemoInformation()
	if not info then
		return 
	elseif demoMode == nil then
		demoMode = ""
	end
	info.controller = controller
	info.demoMode = demoMode
	Engine.LobbyUpdateDemoInformation( info )
	if info.mainMode ~= Enum.eModes.MODE_INVALID then
		local mode = Engine.GetAbbreviationForMode( info.mainMode )
		Engine.SwitchMode( controller, mode )
	end
	CoD.LobbyBase.LaunchDemo( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyTheaterStartFilm( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller )
end

function LobbyTheaterCreateHighlightReel( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller, "CreateHighlightReel" )
end

function LobbyTheaterShoutcastFilm( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller, "Shoutcast" )
end

function LobbyAcceptInvite( self, controller, event )
	local xuid = event.xuid
	local data = {
		controller = controller,
		xuid = xuid,
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	}
	Engine.LobbyVM_CallFunc( "Join", data )
end

local GetSessionModeFromPresenceActivity = function ( enumVal )
	if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return Enum.eModes.MODE_CAMPAIGN
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

function LobbyQuickJoin( self, element, controller, expressionArg, booleanArg )
	if IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		local elementModel = element:getModel()
		local activityModel = Engine.GetModel( elementModel, "activity" )
		if activityModel and GetSessionModeFromPresenceActivity( Engine.GetModelValue( activityModel ) ) == Enum.eModes.MODE_MULTIPLAYER then
			GoBackAndOpenOverlayOnParent( self, "MPIntroRequired", controller )
			return 
		end
	end
	local joinable = false
	local f199_local0 = element:getModel( controller, "joinable" )
	if not f199_local0 then
		local model = element:getModel( controller, "isJoinable" )
	end
	if f199_local0 ~= nil then
		local value = Engine.GetModelValue( f199_local0 )
		if value ~= nil and (value == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or value == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY) then
			joinable = true
		end
	end
	if not joinable then
		return 
	end
	f199_local0 = element:getModel( controller, "xuid" )
	if f199_local0 == nil then
		return 
	end
	local xuid = Engine.GetModelValue( f199_local0 )
	if xuid == nil then
		return 
	end
	local joinType = nil
	if expressionArg ~= nil and expressionArg >= 0 and expressionArg < Enum.JoinType.JOIN_TYPE_COUNT then
		joinType = expressionArg
	else
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	local data = {
		controller = controller,
		xuid = xuid,
		joinType = joinType
	}
	if booleanArg ~= nil and booleanArg == true then
		GoBack( self, controller )
	end
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, data.xuid ) then
			CoD.QuitGame( controller )
			Engine.LobbyVM_CallFunc( "InGameJoin", data )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", data )
	end
end

function LobbyJoinFromFriendsMenu( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local friendsModel = Engine.GetModel( perControllerModel, "friends" )
	local tabModel = Engine.GetModel( friendsModel, "tab" )
	local tabId = Engine.GetModelValue( tabModel )
	local joinType = nil
	if tabId == "friends" then
		joinType = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif tabId == "recent" then
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	elseif tabId == "groups" then
		joinType = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif tabId == "inbox" then
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	else
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	LobbyQuickJoin( self, element, controller, joinType, true )
end

function LobbyInviteFriend( self, element, controller, params )
	local xuid, gamertag = nil
	if params then
		xuid = params.xuid
		gamertag = params.gamertag
	else
		xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
		gamertag = Engine.GetModelValue( element:getModel( controller, "gamertag" ) )
	end
	if xuid ~= nil then
		if not CoD.isPS4 then
			CoD.invitePlayer( controller, xuid )
		elseif Dvar.platformSessionEnabled and Dvar.platformSessionEnabled:get() == true then
			CoD.invitePlayerByGamertag( controller, xuid, gamertag )
		else
			CoD.invitePlayer( controller, xuid )
		end
	end
end

function LobbyInviteFriendGoBack( self, element, controller, params )
	LobbyInviteFriend( self, element, controller, params )
	GoBack( self, controller )
end

function OnLoadToggleDebug( self, controller )
	if Dvar.ui_lobbyDebugVis:get() then
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleDebug( self, controller )
	Dvar.ui_lobbyDebugVis:set( not Dvar.ui_lobbyDebugVis:get() )
	if Dvar.ui_lobbyDebugVis:get() then
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleMsgLevel( self, controller )
	local currentLevel = Dvar.ui_lobbyDebugMsgLevel:get()
	currentLevel = currentLevel + 1
	if currentLevel > 2 then
		currentLevel = 0
	end
	Dvar.ui_lobbyDebugMsgLevel:set( currentLevel )
	if currentLevel == 0 then
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "PAUSED" )
	elseif currentLevel == 1 then
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "LIMITED" )
	else
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "ALL" )
	end
end

function LobbyAddLocalClient( self, controller )
	if Dvar.ui_execdemo_beta:get() then
		return 
	end
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.GetLobbyLocalClientCount( lobbyType ) < Dvar.lobby_maxLocalPlayers:get() then
		CoD.LobbyBase.UnusedGamepadButton( self, controller )
	end
end

function LobbyRemoveLocalClientFromLobby( self, controller )
	if not Engine.IsControllerBeingUsed( controller ) or controller == Engine.GetPrimaryController() then
		return 
	else
		CoD.LobbyBase.RemoveLocalPlayerFromTheLobby( self, controller )
	end
end

function SetState( self, newState )
	self:setState( newState )
end

function PulseElementToStateAndBack( element, newState )
	local prevState = element.currentState
	element:setState( newState )
	element:setState( prevState )
end

function SetMenuState( menu, newState )
	menu:setState( newState )
end

function SetElementState( self, element, controller, newState )
	element:setState( newState )
end

function SetElementStateByElementName( self, elementName, controller, newState )
	if self[elementName] then
		self[elementName]:setState( newState )
	end
end

function SetElementDataSource( self, elementName, stringArg )
	if self[elementName] then
		self[elementName]:setDataSource( stringArg )
	end
end

function LockInput( self, controller, booleanArg )
	if booleanArg ~= nil then
		Engine.LockInput( controller, booleanArg )
	end
end

function ScaleWidgetToLabelCentered( self, element, exprPadding )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, _, elementLeft, _ = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		local center = (right + left) / 2
		local width = textWidth + exprPadding * 2
		self:setLeftRight( leftanchor, rightanchor, center - width / 2, center + width / 2 )
	end
end

function ScaleWidgetToLabelCenteredWrapped( self, element, exprPadding, exprPaddingTopBottom )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, _, elementLeft, _ = element:getLocalLeftRight()
		local textWidth, textHeight = element:getTextWidthAndHeight()
		local center = (right + left) / 2
		local width = textWidth + exprPadding * 2
		self:setLeftRight( leftanchor, rightanchor, center - width / 2, center + width / 2 )
		local topanchor, bottomanchor, top, _ = self:getLocalTopBottom()
		self:setTopBottom( topanchor, bottomanchor, top, textHeight + top + exprPaddingTopBottom )
	end
end

function ScaleWidgetToLabel( self, element, exprPadding )
	if element == nil then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local _, _, elementLeft, _ = element:getLocalLeftRight()
	local textWidth = element:getTextWidth()
	if textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		self:setLeftRight( leftanchor, rightanchor, left, left + self.savedWidth )
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
end

function SetStateFromText( self, element, hasTextState, noTextState )
	local state = noTextState
	if element and element:getTextWidth() ~= 0 then
		state = hasTextState
	end
	self:setState( state )
end

function ScaleWidgetToLabelWrapped( self, element, exprPadding, exprPaddingTopBottom )
	if element == nil then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local _, _, elementLeft, _ = element:getLocalLeftRight()
	if not self._originalWidth then
		self._originalWidth = right - left
	end
	local textWidth, textHeight = element:getTextWidthAndHeight()
	if self._originalWidth < textWidth then
		textWidth = self._originalWidth
	end
	if textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		self:setLeftRight( leftanchor, rightanchor, left, left + self.savedWidth )
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
	local topanchor, bottomanchor, top, _ = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, top, textHeight + top + exprPaddingTopBottom )
end

function ScaleWidgetToLabelWrappedUp( self, element, exprPadding, exprPaddingTopBottom )
	if element == nil then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local _, _, elementLeft, elementRight = element:getLocalLeftRight()
	if not self._originalWidth then
		self._originalWidth = right - left
	end
	local textWidth, textHeight = element:getTextWidthAndHeight()
	if self._originalWidth < textWidth then
		self:setLeftRight( leftanchor, rightanchor, left, left + self._originalWidth )
	elseif textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		self:setLeftRight( leftanchor, rightanchor, left, left + self.savedWidth )
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
	local topanchor, bottomanchor, top, bottom = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, bottom - textHeight - exprPaddingTopBottom, bottom )
end

function UpdateWidgetHeightToMultilineText( self, element, exprPadding )
	local _, textHeight = element:getTextWidthAndHeight()
	self:setHeight( textHeight + exprPadding * 2 )
end

function OverrideWidgetWidth( self, newWidth )
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	self.savedWidth = right - left
	self:setLeftRight( leftanchor, rightanchor, left, left + newWidth )
end

function RestoreWidgetWidth( self )
	if self.savedWidth == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		self:setLeftRight( leftanchor, rightanchor, left, left + self.savedWidth )
	end
end

function SetWidth( self, newWidth )
	self.savedWidth = self:getWidth()
	self:setWidth( newWidth )
end

function ScaleToElementWidth( self, element )
	local leftanchor, rightanchor, left, right = element:getLocalLeftRight()
	self:setWidth( right - left )
end

function ScaleParentWidgetToLabel( self, element, exprPadding )
	local f226_local0 = self
	local parent = self:getParent()
	local f226_local1 = f226_local0 and parent
	if element == nil or f226_local1 == nil then
		return 
	else
		local _, _, selfLeft, _ = self:getLocalLeftRight()
		local leftanchor, rightanchor, left, right = f226_local1:getLocalLeftRight()
		local _, _, elementLeft, _ = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		f226_local1:setLeftRight( leftanchor, rightanchor, left, left + textWidth + 2 * (selfLeft + elementLeft) + exprPadding )
	end
end

function ScaleWidgetToLabelRightAligned( self, element, exprPadding )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, _, _, elementRight = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		self:setLeftRight( leftanchor, rightanchor, right - textWidth + 2 * elementRight - exprPadding, right )
	end
end

function SetParentWidgetWidth( self, element, exprWidth )
	local f228_local0 = self
	local parent = self:getParent()
	local f228_local1 = f228_local0 and parent
	if f228_local1 == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = f228_local1:getLocalLeftRight()
		f228_local1:setLeftRight( leftanchor, rightanchor, left, left + exprWidth )
	end
end

function ScaleToFitImageElement( self, element, imageElementName )
	local imageElement = self[imageElementName]
	if imageElement then
		local w, h = imageElement:getImageDimensions()
		if w > 0 and h > 0 then
			local _, _, imageOffsetLeft = imageElement:getLocalLeftRight()
			local _, _, imageOffsetTop, imageOffsetBottom = imageElement:getLocalTopBottom()
			local _, _, elementLeft, _ = element:getLocalLeftRight()
			local _, _, elementTop, elementBottom = element:getLocalTopBottom()
			local imageHeight = elementBottom + imageOffsetBottom - imageOffsetTop
			local imageWidth = imageOffsetLeft * 2 + imageHeight * w / h
			local imageWidthRounded = math.floor( (imageWidth - 1) / 2 ) * 2
			element:setLeftRight( true, false, elementLeft, imageWidthRounded )
			element:setTopBottom( true, false, elementTop, elementBottom )
		end
	end
end

function CloseInGameMenu( self, event )
	CoD.InGameMenu.CloseAllInGameMenus( self, event )
end

function PacifierSetMessage( self, controller, msg )
	self.lblMessage.Text0.setText( msg )
end

function ResumeGame( self, controller )
	CoD.InGameMenu.CloseAllInGameMenus( self, {
		name = "close_all_ingame_menus",
		controller = controller
	} )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	Engine.SendMenuResponse( controller, "vcs", "ingame_menu_closed" )
end

function ResumeFromCheckpoint( self, element, controller )
	SetMap( controller, Engine.GetSavedMap() )
	local skipto = Engine.GetSavedMapSkipto()
	Engine.SetDvar( "skipto", skipto )
	Engine.SetDvar( "cp_queued_level", Engine.GetSavedMapQueuedMap() )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GotoSafehouse( self, element, controller )
	local safeHouse = CoD.GetMapValue( Engine.GetSavedMap(), "safeHouse", "cp_sh_mobile" )
	SetMap( controller, safeHouse )
	Engine.SetDvar( "cp_queued_level", "" )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function StartCPE3Demo( self, element, controller )
	Engine.SetDvar( "cp_queued_level", "cp_mi_cairo_ramses_2" )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetLobbyServerBrowserFilterForE3( self, element, controller )
	local filter = nil
	if Dvar.ui_execdemo_cp:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	if filter == nil then
		return 
	else
		Engine.LobbyServerListSetMainModeFilter( filter )
		CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( self, controller )
	end
end

function CloseAllInGameMenus( self, controller )
	if not Dvar.ui_isSaving:get() then
		CoD.InGameMenu.CloseAllInGameMenus( self, {
			name = "close_all_ingame_menus",
			controller = controller
		} )
	end
end

function LobbyGoBack( self, controller )
	CoD.LobbyBase.LobbyGoBack( self, controller )
	self:playSound( "menu_go_back" )
end

function GoBackAndLobbyBeginPlay( self, controller )
	local menu = GoBack( self, controller )
	LobbyBeginPlay( menu, controller )
end

function SizeToSafeArea( element, controller )
	element:sizeToSafeArea( controller )
end

function PartyHostSetState( self, controller, expressionArg )
	Engine.PartyHostSetUIState( expressionArg )
end

function GoBackMultiple( self, controller, param )
	local menu = self
	local numPopups = tonumber( param )
	if numPopups == nil then
		return 
	end
	while numPopups > 0 do
		menu = GoBack( menu, controller )
		numPopups = numPopups - 1
	end
	return menu
end

function GoBack( self, controller )
	if Rat and Rat.DisableGoBack then
		return 
	end
	while not self.menuName do
		self = self:getParent()
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		self.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][menuIndex - 1]
		CoD.MenuNavigation[controller][navStackIndex][menuIndex] = nil
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		else
			
		end
	end
	self:saveState()
	return self:goBack( controller )
end

function GoBackToMenu( menu, controller, noDependencyMenuName )
	local navStackIndex, navMenuIndex = CoD.Menu.GetNavigationForMenuToMenu( controller, menu.menuName, noDependencyMenuName )
	local ourStackIndex, ourMenuIndex = CoD.Menu.GetNavigationForMenu( controller, menu.menuName )
	local menuStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, noDependencyMenuName )
	if not ourStackIndex or not ourMenuIndex or not menuStackIndex or not menuIndex then
		return GoBack( menu, controller )
	elseif menu.menuName == noDependencyMenuName then
		return 
	elseif menu.occludedMenu and menu.occludedMenu.menuName == noDependencyMenuName then
		menu.previousMenuName = nil
		table.remove( CoD.MenuNavigation[controller], ourStackIndex )
	elseif navStackIndex and navMenuIndex then
		menu.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][navMenuIndex]
		local stackSize = #CoD.MenuNavigation[controller][navStackIndex]
		for i = navMenuIndex + 1, stackSize, 1 do
			CoD.MenuNavigation[controller][navStackIndex][i] = nil
		end
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		end
		if ourStackIndex ~= navStackIndex then
			table.remove( CoD.MenuNavigation[controller], ourStackIndex )
		end
	elseif menu.occludedMenu then
		local currentMenu = menu
		for stack = ourStackIndex, menuStackIndex + 1, -1 do
			local f244_local2 = stack
			if not currentMenu.occludedMenu then
				return currentMenu
			end
			currentMenu = GoBackToMenu( currentMenu, controller, currentMenu.occludedMenu.menuName )
		end
		if currentMenu.menuName == noDependencyMenuName then
			return currentMenu
		end
		return GoBackToMenu( currentMenu, controller, noDependencyMenuName )
	end
	menu:saveState()
	return menu:goBack( controller )
end

function GoBackAndUpdateStateOnPreviousMenu( self, controller )
	local previousMenu = GoBack( self, controller )
	previousMenu:processEvent( {
		name = "update_state",
		controller = controller
	} )
	return previousMenu
end

function GoBackAndSetClassItem( self, element, controller )
	local previousMenu = GoBack( self, controller )
	SetClassItem( previousMenu, element, controller )
	previousMenu:processEvent( {
		name = "update_state",
		controller = controller
	} )
	return previousMenu
end

function GoBackAndUpdateNavigation( self, element, controller )
	local previousMenu = GoBack( self, controller )
	if CoD.CACUtility.CustomClass_LastClassNum and previousMenu.menuName == "CustomClass" then
		previousMenu:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
		previousMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
	return previousMenu
end

local SetFocusToLoadoutWidgetAfterSetItem = function ( self )
	if self.weaponSlotTable and self.currentActiveSlot and self.weaponSlotTable[self.currentActiveSlot] then
		local currentSelectedWidget = self.weaponSlotTable[self.currentActiveSlot]
		if currentSelectedWidget then
			if currentSelectedWidget.widget then
				currentSelectedWidget.widget:processEvent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			else
				currentSelectedWidget:dispatchEventToParent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			end
		end
	end
end

function GoBackToCustomClassMenu( self, controller )
	local customClassMenu = GoBackToMenu( self, controller, "CustomClass" )
	if customClassMenu then
		customClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
		if customClassMenu.menuName == "CustomClass" then
			SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
		end
	end
end

function Close( self, controller )
	while not self.menuName do
		self = self:getParent()
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		self.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][menuIndex - 1]
		CoD.MenuNavigation[controller][navStackIndex][menuIndex] = nil
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		end
	end
	self:saveState()
	self:close()
end

function NavigateToLobby( self, menuName, leaveBreadcrumb, controller )
	CoD.LobbyBase.NavigateToLobby( self, menuName, leaveBreadcrumb, controller )
end

function NavigateToLobby_OccludedMenu( self, element, controller, param, menu )
	if self.occludedMenu ~= nil then
		NavigateToLobby( self.occludedMenu, param, false, controller )
	end
end

function NavigateToLobby_SelectionList( self, element, controller, param, menu )
	NavigateToLobby( menu, param, false, controller )
end

function NavigateToLobby_FirstTimeFlowMP( self, element, controller, menu )
	if IsLAN() then
		NavigateToLobby_SelectionList( self, element, controller, LobbyData.UITargets.UI_MPLOBBYLANGAME.name, menu )
	else
		NavigateToLobby_SelectionList( self, element, controller, LobbyData.UITargets.UI_MPLOBBYONLINE.name, menu )
	end
end

function NavigateToLobby_FirstTimeFlowCP( self, element, controller, menu )
	if IsLAN() then
		NavigateToLobby_SelectionList( self, element, controller, LobbyData.UITargets.UI_CPLOBBYLANGAME.name, menu )
	else
		NavigateToLobby_SelectionList( self, element, controller, LobbyData.UITargets.UI_CPLOBBYONLINE.name, menu )
	end
end

function NavigateToLobby_SelectionListCampaignZombies( self, element, controller, param, menu )
	NavigateToLobby( menu, param, false, controller )
end

function NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
	while self and not self.openMenu do
		self = self:getParent()
	end
	if not self then
		return 
	elseif not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {
			{
				self.menuName
			}
		}
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if not navStackIndex or not menuIndex then
		CoD.MenuNavigation[controller] = {
			{
				self.menuName
			}
		}
		navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	end
	local userData = self.userData
	local oldMenuName = self.menuName
	local occludedMenu = self.occludedMenu
	local parent = self:getParent()
	self:saveState()
	self:close()
	local newMenu = self:replaceMenu( menuName, controller, nil, userData, oldMenuName, occludedMenu, parent )
	if navStackIndex and menuIndex then
		if leaveBreadcrumb then
			table.insert( CoD.MenuNavigation[controller][navStackIndex], menuIndex + 1, newMenu.menuName )
		else
			CoD.MenuNavigation[controller][navStackIndex][menuIndex] = newMenu.menuName
		end
	end
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

function OpenPopup( self, menuName, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	local newMenu = menu:openPopup( menuName, controller )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		newMenu.menuName
	} )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

function OpenPopupWithPriority( self, menuName, controller, expressionArg )
	local popup = OpenPopup( self, menuName, controller )
	popup:setPriority( expressionArg )
end

function OpenOverlay( self, menuName, controller, userData, parentMenu )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	local newMenu = menu:openOverlay( menuName, controller, userData, parentMenu )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		newMenu.menuName
	} )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

function OpenSystemOverlay( self, menu, controller, overlayName, expressionArg )
	CoD.OverlayUtility.CreateOverlay( controller, menu, overlayName, controller, expressionArg )
end

function PerformOverlayBack( self, element, controller, menu )
	if HasOverlayBackAction( menu ) then
		menu[CoD.OverlayUtility.GoBackPropertyName]( self, element, controller, menu )
	end
end

function GoBackAndOpenOverlayOnParent( self, menuName, controller )
	local previousMenu = GoBack( self, controller )
	previousMenu:openOverlay( menuName, controller )
end

function GoBackAndOpenPopupOnParent( self, menuName, controller )
	local previousMenu = GoBack( self, controller )
	previousMenu:openPopup( menuName, controller )
end

local OpenGenericPopup = function ( self, controller, menuName, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	local newMenu = menu:openPopup( menuName, controller )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		newMenu.menuName
	} )
	if contentText and contentText ~= "" then
		newMenu:setContent( Engine.Localize( contentText ) )
	end
	if subContentText and subContentText ~= "" then
		newMenu:setSubContent( Engine.Localize( subContentText ) )
	end
	if buttonText and buttonText ~= "" then
		newMenu:setButton1Text( Engine.Localize( buttonText ) )
	end
	local func = optionalActionOnButtonPress
	if optionalActionOnButtonPress and type( optionalActionOnButtonPress ) == "string" and optionalActionOnButtonPress ~= "" and _G[optionalActionOnButtonPress] then
		func = _G[optionalActionOnButtonPress]
	end
	if type( func ) == "function" then
		newMenu:setButton1Action( optionalActionOnButtonPress )
	end
	return newMenu
end

function GenericSmallPopupGoBack( self, controller )
	if self.customGoBackAction then
		self:customGoBackAction( controller )
	else
		GoBack( self, controller )
	end
end

function OpenGenericSmallPopup( self, controller, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	return OpenGenericPopup( self, controller, "SmallPopup", contentText, subContentText, buttonText, optionalActionOnButtonPress )
end

function OpenGenericMediumPopup( self, controller, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	return OpenGenericPopup( self, controller, "MediumPopup", contentText, subContentText, buttonText, optionalActionOnButtonPress )
end

function OpenGenericLargePopup( self, controller, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	return OpenGenericPopup( self, controller, "LargePopup", contentText, subContentText, buttonText, optionalActionOnButtonPress )
end

function SendMenuResponse( self, noDependencyMenuName, response, controller )
	Engine.SendMenuResponse( controller, noDependencyMenuName, response )
end

function SendMenuResponseExpression( controller, customMenuName, expressionArg )
	Engine.SendMenuResponse( controller, customMenuName, expressionArg )
end

function SendOwnMenuResponse( menu, controller, response )
	Engine.SendMenuResponse( controller, menu.menuName, response )
end

function ClearSavedState( self, controller )
	self:clearSavedState()
end

function ClearMenuSavedState( menu )
	menu:clearSavedState()
end

function PlayClip( self, clipName, controller )
	self:playClip( clipName )
end

function PlayClipOnElement( self, elementAndClip, controller )
	if self[elementAndClip.elementName] then
		self[elementAndClip.elementName]:playClip( elementAndClip.clipName )
	end
end

function PlayClipOnListItemElement( self, element, controller, newClipName )
	element:playClip( newClipName )
end

function SetFocusToElement( self, focusableElementName, controller )
	if self[focusableElementName] then
		self[focusableElementName]:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

function SetLoseFocusToElement( self, focusableElementName, controller )
	if self[focusableElementName] then
		self[focusableElementName]:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
	end
end

function SetTextToElement( self, elementName, stringArg )
	if self[elementName] then
		self[elementName]:setText( Engine.Localize( stringArg ) )
	end
end

function MakeElementFocusable( self, elementName, controller )
	if self[elementName] then
		self[elementName]:makeFocusableWithoutResettingNavigation( self )
	end
end

function MakeElementNotFocusable( self, elementName, controller )
	if self[elementName] then
		self[elementName]:makeNotFocusable( self )
	end
end

function MakeFocusable( element )
	element:makeFocusableWithoutResettingNavigation()
end

function MakeNotFocusable( element )
	element:makeNotFocusable()
end

function DisableNavigation( self, elementName )
	self[elementName].m_disableNavigation = true
end

function EnableNavigation( self, elementName )
	self[elementName].m_disableNavigation = false
end

function ModalSelectListOption( self, element, controller )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil and CoD.Menu.ModalDialogInfo.Callback( element.gridInfoTable.zeroBasedIndex ) == true then
		GoBack( self, controller )
	end
end

function ModalGoBack( self, element, controller )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil then
		CoD.Menu.ModalDialogInfo.Callback()
	end
	GoBack( self, controller )
end

function SetResponseYes( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "yes" )
	end
end

function SetResponseNo( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "no" )
	end
end

function SetResponseCancel( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "cancel" )
	end
end

function OpenOptionsMenu( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "OptionsMenu", controller )
	menu:close()
end

function LoadSaveGameData( self, controller )
	Engine.LoadSaveGame()
end

function RestartMission( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "RestartMissionPopup" )
end

function CPSelectPublicGame( self, element, controller, param, menu )
	if param == "anyMission" then
		
	elseif param == "currMission" then
		
	elseif param == "specificMission" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
		GoBackAndOpenPopupOnParent( self, "CPMissionSelect", controller )
	end
end

function RestartFromCheckpoint( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "RestartCheckpointPopup" )
end

function LaunchLevel( self, element, controller )
	local devmapName = Engine.GetModelValue( element:getModel( controller, "devName" ) )
	if devmapName ~= "" then
		Engine.Exec( controller, "devmap " .. devmapName )
	end
end

function QuitGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "QuitGamePopup" )
end

function SaveAndQuitGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "SaveAndQuitGamePopup" )
end

function LaunchSideMission( self, element, controller )
	local mapName = Engine.GetModelValue( element:getModel( controller, "mapName" ) )
	local missionType = Engine.GetModelValue( element:getModel( controller, "missionTypeInternal" ) )
	local missionIndex = Engine.GetModelValue( element:getModel( controller, "missionIndex" ) )
	local lighting = Engine.GetModelValue( element:getModel( controller, "lighting" ) )
	Engine.Exec( controller, "loadside " .. missionIndex .. " " .. mapName .. " " .. missionType .. " " .. lighting )
end

function RestartGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "RestartGamePopup" )
end

function ChooseClass( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( CoD.ChangeClassMenuName, controller )
	menu:close()
end

function ChooseTeam( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "ChangeTeam", controller )
	menu:close()
end

function QuitGame_MP( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "EndGamePopup" )
end

function SendClientScriptDebugMenuNotify( self, element, controller )
	local list = self.cscDebugMenuList
	local index = element.gridInfoTable.zeroBasedIndex + 1
	local model = element:getModel( controller, "name" )
	Engine.SendClientScriptNotify( controller, "script_debug_menu", Engine.GetModelValue( model ), index )
end

function SendClientScriptDebugMenuCloseMenuNotify( self, element, controller )
	Engine.SendClientScriptNotify( controller, "script_debug_menu", "close" )
end

function ProcessPlayerCallout( element, controller, model )
	Engine.UpdateCalloutPlayerData( controller, Engine.GetModelValue( Engine.GetModel( model, "arg1" ) ), Engine.GetModelValue( Engine.GetModel( model, "arg2" ) ) )
	element:playClip( "Side" )
end

function ProcessPlayerObituaryCallout( self, element, controller )
	self:playClip( "SlideUp" )
end

function SetMPScoreText( menu, element, controller, model )
	local data = CoD.GetScriptNotifyData( model )
	local scoreName = Engine.GetIString( data[1], "CS_LOCALIZED_STRINGS" )
	local score = data[2]
	element:AddCenterScore( scoreName, score )
	if HasPerk( controller, "specialty_combat_efficiency" ) then
		local combatEfficiencyScore = data[3]
		if combatEfficiencyScore > 0 then
			element:AddCombatEfficiencyScore( menu, combatEfficiencyScore, controller )
		end
		if combatEfficiencyScore < score then
			element:AddCombatEfficiencyScore( menu, score - combatEfficiencyScore, controller )
		end
	end
end

function TryBootHUD( self, delayMS )
	if not self.hasBooted then
		self:addElement( LUI.UITimer.new( delayMS, "hud_boot", true, self ) )
	end
end

function SetHudHasBooted( self )
	self.hasBooted = true
end

function AddResourceEnergyBar( self, element, controller, event )
	local buttonID = string.sub( event.name, -1, -1 )
	if event.newValue == 1 then
		local energyBar = CoD.ResourceEnergyBar.new()
		energyBar:setupEntity( controller, event.entNum, buttonID )
		self:addElement( energyBar )
	elseif event.newValue == 0 then
		element:removeEntity( event.entNum )
	end
end

function AddWarlordArmorRegenerationBar( self, element, controller, event )
	local buttonID = string.sub( event.name, -1, -1 )
	if event.newValue == 1 then
		local armorRegenerationBar = CoD.WarlordArmorRegenerationBar.new()
		armorRegenerationBar:setupEntity( controller, event.entNum, buttonID )
		self:addElement( armorRegenerationBar )
	elseif event.newValue == 0 then
		element:removeEntity( event.entNum )
	end
end

function AddKillstreakReceivedNotification( self, element, controller, model )
	if IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_scorestreaks_notification", 1 ) then
		return 
	elseif element.readyEventContainer.appendNotification ~= nil then
		local data = CoD.GetScriptNotifyData( model )
		local killstreakIndex = data[1]
		local killstreakName = Engine.Localize( Engine.GetItemName( killstreakIndex ) )
		local notifyString = Engine.ToUpper( Engine.Localize( "MENU_KILLSTREAK_READY", killstreakName ) )
		local descriptionString = Engine.Localize( "MENU_ACTIVATE_KILLSTREAK_INSTR" )
		element.readyEventContainer:appendNotification( {
			title = notifyString,
			description = descriptionString,
			type = "Killstreak",
			priority = 0
		} )
	end
end

function AddHeroAbilityReceivedNotification( self, element, controller, model )
	if IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_specialist_notification", 1 ) then
		return 
	elseif element.readyEventContainer.appendNotification ~= nil then
		local data = CoD.GetScriptNotifyData( model )
		local heroWeaponIndex = data[1]
		local heroWeaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( heroWeaponIndex ) ) )
		local notifyString = Engine.ToUpper( Engine.Localize( "MENU_HERO_ABILITY_READY", heroWeaponName ) )
		local descriptionString = Engine.Localize( "MENU_ACTIVATE_HERO_ABILITY_INSTR" )
		element.readyEventContainer:appendNotification( {
			title = notifyString,
			description = descriptionString,
			type = "Ability",
			priority = 1
		} )
	end
end

function AddZombieNotification( self, element, model )
	local data = CoD.GetScriptNotifyData( model )
	element.readyEventContainer:appendNotification( {
		title = Engine.Localize( Engine.GetIString( data[1], "CS_LOCALIZED_STRINGS" ) )
	} )
end

function CreatePrematchTimer( self, controller, model )
	local data = CoD.GetScriptNotifyData( model )
	local endTime = data[1]
	if endTime and not self.PrematchCountdown then
		local prematchCountdown = CoD.PrematchCountdown.new( self, controller )
		prematchCountdown:setupCountdown( endTime, controller )
		prematchCountdown:setLeftRight( false, false, -640, 640 )
		prematchCountdown:setTopBottom( false, false, -360, 360 )
		prematchCountdown:addElementBefore( self.WaypointBase )
		self.PrematchCountdown = prematchCountdown
		LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
			self.PrematchCountdown:close()
		end )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "isInPrematchPeriod" ), 1 )
end

function HandleScoreStreakDpadRight( self, controller )
	if self:isInFocus() then
		if not self:hasClip( "Focus" ) then
			Engine.SwitchToInventoryWeapon( controller )
		else
			local slotIndex = Engine.GetModelValue( Engine.GetModel( self:getModel(), "rewardSlot" ) )
			if slotIndex ~= nil then
				Engine.ActionSlotSelectWeapon( controller, slotIndex )
			else
				Engine.SwitchToInventoryWeapon( controller )
			end
		end
	end
end

function MakeRaidPurchase( self, element, controller )
	local name = Engine.GetModelValue( element:getModel( controller, "name" ) )
	Engine.SendMenuResponse( controller, "raid_purchase", name )
end

function CancelRaidPurchase( self, element, controller )
	Engine.SendMenuResponse( controller, "raid_purchase", "none" )
end

function UpdateEnabledText( self, element, controller )
	local descriptionModel = element:getModel( controller, "description" )
	local enabledDescriptionModel = element:getModel( controller, "enabledDescription" )
	local enabledDescriptionString = Engine.Localize( Engine.GetModelValue( enabledDescriptionModel ) )
	Engine.SetModelValue( descriptionModel, enabledDescriptionString )
end

function UpdateDisableReason( self, element, controller )
	local menu = self
	local scriptID = Engine.GetModelValue( element:getModel( controller, "id" ) )
	local disableModel = menu:getModel( controller, "disable_" .. scriptID )
	local descriptionModel = element:getModel( controller, "description" )
	if disableModel ~= nil then
		local disableReason = Engine.Localize( Engine.GetModelValue( disableModel ) )
		Engine.SetModelValue( descriptionModel, disableReason )
	else
		local enabledDescriptionModel = element:getModel( controller, "enabledDescription" )
		local enabledDescriptionString = Engine.Localize( Engine.GetModelValue( enabledDescriptionModel ) )
		Engine.SetModelValue( descriptionModel, enabledDescriptionString )
	end
end

local GetListItem = function ( self, element )
	local elementStack = {}
	while element and element ~= self do
		table.insert( elementStack, element )
		element = element:getParent()
	end
	if #elementStack >= 1 then
		return elementStack[#elementStack]
	else
		return initialElement
	end
end

function SelectNextItemIfPossible( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	elementToNavigate:navigateItemRight()
end

function SelectNextItemIfPossibleAndNotDisabled( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local nextItem = elementToNavigate:getItemAtOffset( 0, 1 )
	if nextItem then
		local disabledModel = nextItem:getModel( controller, "disabled" )
		local disabled = Engine.GetModelValue( disabledModel )
		if disabled == true then
			return 
		end
	end
	elementToNavigate:navigateItemRight()
end

function SelectPreviousItemIfPossible( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	elementToNavigate:navigateItemLeft()
end

function SelectPreviousItemIfPossibleAndNotDisabled( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local previousItem = elementToNavigate:getItemAtOffset( 0, -1 )
	if previousItem then
		local disabledModel = previousItem:getModel( controller, "disabled" )
		local disabled = Engine.GetModelValue( disabledModel )
		if disabled == true then
			return 
		end
	end
	elementToNavigate:navigateItemLeft()
end

function SelectItemIfPossible( self, element, controller, event )
	element:setActiveItem( event.element )
end

function ProcessListAction( self, element, controller )
	if element.disabled then
		return 
	end
	local actionModel = element:getModel( controller, "action" )
	local paramModel = element:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = element.action
		actionParam = element.actionParam
	end
	if actionFn then
		actionFn( self, element, controller, actionParam, element.gridInfoTable.parentGrid.menu )
	end
end

function UpdateDataSource( self, element, controller )
	element:updateDataSource()
end

function UpdateElementDataSource( self, listElementName )
	if self[listElementName] then
		self[listElementName]:updateDataSource()
	end
end

function SetAsListVerticalCounter( self, element, listElementName )
	if self[listElementName] then
		self[listElementName]:addCustomVerticalCounter( element )
	end
end

function SetAsListHorizontalCounter( self, element, listElementName )
	if self[listElementName] then
		self[listElementName]:addCustomHorizontalCounter( element )
	end
end

function HideWidget( self )
	self:setAlpha( 0 )
end

function ShowWidget( self )
	self:setAlpha( 1 )
end

function SetBackFromCustomClass( self )
	CoD.CACUtility.FromCustomClass = true
end

function GetCustomClassModel( controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
end

function ChangeCustomClassPane( self, controller, direction )
	local moverWidget = self.CustomClassPanelMover0
	if moverWidget then
		if moverWidget.elementsPlayingClips > 0 then
			return 
		end
		local currentState = moverWidget.currentState
		local nextState = nil
		if currentState == "Wildcards" then
			if direction == "right" then
				nextState = "Weapons"
			end
		elseif currentState == "Weapons" then
			if direction == "left" then
				nextState = "Wildcards"
			elseif direction == "right" then
				nextState = "Equipment"
			end
		elseif currentState == "Equipment" then
			if direction == "left" then
				nextState = "Weapons"
			elseif direction == "right" then
				nextState = "Perks"
			end
		elseif currentState == "Perks" and direction == "left" then
			nextState = "Equipment"
		end
		if nextState then
			self:navigateToTab( nextState, direction )
		end
	end
end

function ResetCustomClassStartingFocus( self, element, controller, booleanArg )
	local model = element:getModel()
	local classNum = Engine.GetModelValue( Engine.GetModel( model, "classNum" ) )
	if booleanArg or classNum ~= CoD.CACUtility.CustomClass_LastClassNum then
		CoD.CACUtility.CustomClass_LastClassNum = 0
		CoD.CACUtility.CustomClass_LastSelection = "primary"
		CoD.CACUtility.CustomClass_PerClassLastSelection = {}
	end
end

function ChangeClass( self, element, controller )
	self:saveState()
	self.menuResponseSent = true
	local selectedClassIndex = Engine.GetModelValue( element:getModel( controller, "classNum" ), nil )
	local selectedClassName = Engine.GetModelValue( element:getModel( controller, "defaultClassName" ), nil )
	local originalClassIndex = selectedClassIndex
	if selectedClassName ~= nil then
		Engine.SendMenuResponse( controller, CoD.ChangeClassMenuName, string.lower( selectedClassName ) )
		selectedClassIndex = Engine.GetClassIndexFromName( selectedClassName )
	else
		Engine.SendMenuResponse( controller, CoD.ChangeClassMenuName, "custom" .. selectedClassIndex )
	end
	CoD.T6ChangeClass.SetProfileLoadoutChoice( controller, selectedClassIndex )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( controller, originalClassIndex )
end

function UpdateClassView( self, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].classModel = newModel
	self:setModel( newModel, controller )
end

local f0_local0 = function ( self, element, controller )
	local newModel = element:getModel()
	local index = element.gridInfoTable.zeroBasedIndex
	CoD.perController[controller].classNum = index
	CoD.perController[controller].classModel = newModel
	self:setModel( newModel, controller )
end

SetCustomClassNum = f0_local0
f0_local0 = function ( loadoutSlotName, controller, isSwapping )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local slotModel = Engine.GetModel( classModel, loadoutSlotName )
	local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < itemIndex then
		local itemName = Engine.GetItemRef( itemIndex )
		CoD.SetClassItem( controller, classNum, loadoutSlotName, CoD.CACUtility.EmptyItemIndex )
		if itemName == "bonuscard_perk_1_greed" and not isSwapping then
			f0_local0( "specialty4", controller )
		elseif itemName == "bonuscard_perk_2_greed" and not isSwapping then
			f0_local0( "specialty5", controller )
		elseif itemName == "bonuscard_perk_3_greed" and not isSwapping then
			f0_local0( "specialty6", controller )
		elseif itemName == "bonuscard_primary_gunfighter" then
			local gunfighterCount = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, "bonuscard_primary_gunfighter" )
			f0_local0( "primaryattachment6", controller )
			if gunfighterCount < 2 then
				f0_local0( "primaryattachment5", controller )
				if gunfighterCount < 1 then
					f0_local0( "primaryattachment4", controller )
				end
			end
		elseif itemName == "bonuscard_secondary_gunfighter" then
			f0_local0( "secondaryattachment3", controller )
		elseif itemName == "bonuscard_overkill" then
			f0_local0( "secondary", controller )
		elseif itemName == "bonuscard_two_tacticals" then
			f0_local0( "primarygadget", controller )
		elseif itemName == "bonuscard_danger_close" then
			if not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", classModel ) then
				f0_local0( "primarygadgetattachment1", controller )
			end
		elseif loadoutSlotName == "primary" or loadoutSlotName == "secondary" then
			local attachmentList = CoD.CACUtility.GetAttachmentListForSlot( loadoutSlotName )
			for _, loadoutSlot in ipairs( attachmentList ) do
				f0_local0( loadoutSlot, controller )
			end
			for indexSuffix, weaponOptionName in pairs( CoD.CACUtility.weaponOptionGroupNames ) do
				local weaponOptionSlotName = loadoutSlotName .. weaponOptionName
				local weaponOptionSlotModel = Engine.GetModel( classModel, weaponOptionSlotName )
				if weaponOptionSlotModel then
					CoD.SetClassItem( controller, classNum, weaponOptionSlotName, CoD.CACUtility.EmptyItemIndex )
				end
			end
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. "paintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. "paintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		elseif loadoutSlotName == "primarygadget" or loadoutSlotName == "secondarygadget" or loadoutSlotName == "specialgadget" then
			local attachmentList = CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
			if loadoutSlotName == "secondarygadget" then
				attachmentList = CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
			elseif loadoutSlotName == "specialgadget" then
				attachmentList = CoD.CACUtility.SpecialGadgetAttachmentSlotNameList
			end
			for _, loadoutSlot in ipairs( attachmentList ) do
				f0_local0( loadoutSlot, controller )
			end
		elseif LUI.startswith( loadoutSlotName, "primaryattachment" ) or LUI.startswith( loadoutSlotName, "secondaryattachment" ) then
			local baseWeaponSlotName = "primary"
			if LUI.startswith( loadoutSlotName, "secondary" ) then
				baseWeaponSlotName = "secondary"
			end
			local weaponIndexModel = Engine.GetModel( classModel, baseWeaponSlotName .. ".itemIndex" )
			if weaponIndexModel then
				local weaponIndex = Engine.GetModelValue( weaponIndexModel )
				local attachmentRef = Engine.GetAttachmentRef( weaponIndex, itemIndex )
				if attachmentRef then
					local weaponOptionSlotName = baseWeaponSlotName .. attachmentRef
					if CoD.CACUtility.AttachmentHasCustomReticle( attachmentRef ) then
						weaponOptionSlotName = baseWeaponSlotName .. "reticle"
					end
					local weaponOptionSlotModel = Engine.GetModel( classModel, weaponOptionSlotName )
					if weaponOptionSlotModel then
						CoD.SetClassItem( controller, classNum, weaponOptionSlotName, CoD.CACUtility.EmptyItemIndex )
					end
				end
			end
			local acvSlotName = loadoutSlotName .. "cosmeticvariant"
			local acvModel = Engine.GetModel( classModel, acvSlotName )
			if acvModel then
				CoD.SetClassItem( controller, classNum, acvSlotName, CoD.CACUtility.EmptyItemIndex )
			end
		end
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		return true
	else
		return false
	end
end

local CanEquipMultiplePrimaryGunfighterWildcard = function ( loadoutSlot, itemIndex )
	if not CoD.isMultiplayer then
		return false
	elseif not LUI.startswith( loadoutSlot, "bonuscard" ) then
		return false
	else
		local itemName = Engine.GetItemRef( itemIndex )
		if itemName == "bonuscard_primary_gunfighter" then
			return true
		else
			return false
		end
	end
end

local AttemptAttachItem = function ( self, controller, parentModel, classNum, slotName, itemIndex, ignoreGetCustomClassModel )
	local classModel = CoD.perController[controller].classModel
	local canEquip, prevLoadoutSlotName = false
	if self.getEquippedLoadoutSlot then
		prevLoadoutSlotName = self:getEquippedLoadoutSlot( controller, itemIndex )
	end
	local allocationSpentModel = Engine.GetModel( parentModel, "allocationSpent" )
	if not allocationSpentModel then
		allocationSpentModel = Engine.GetModel( classModel, "allocationSpent" )
	end
	local mutuallyExlusiveItemSlot = CoD.CACUtility.GetMutuallyExclusiveSlotName( slotName, controller, itemIndex )
	if mutuallyExlusiveItemSlot ~= "" and (not prevLoadoutSlotName or prevLoadoutSlotName ~= mutuallyExclusiveItemSlot) then
		f0_local0( mutuallyExlusiveItemSlot, controller )
	end
	local currentSlotItemIndex = CoD.GetClassItem( controller, classNum, slotName )
	CoD.perController[controller].overCapacityItemIndex = nil
	local swappingItems = false
	if CoD.CACUtility.EmptyItemIndex < currentSlotItemIndex or prevLoadoutSlotName then
		swappingItems = true
		if not prevLoadoutSlotName then
			prevLoadoutSlotName = slotName
		end
		local currentItemName = Engine.GetItemRef( currentSlotItemIndex )
		if currentItemName == "bonuscard_perk_1_greed" then
			f0_local0( "specialty4", controller )
		elseif currentItemName == "bonuscard_perk_2_greed" then
			f0_local0( "specialty5", controller )
		elseif currentItemName == "bonuscard_perk_3_greed" then
			f0_local0( "specialty6", controller )
		elseif currentItemName == "bonuscard_primary_gunfighter" then
			local gunfighterCount = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, "bonuscard_primary_gunfighter" )
			f0_local0( "primaryattachment6", controller )
			if gunfighterCount <= 2 then
				f0_local0( "primaryattachment5", controller )
				if gunfighterCount <= 1 then
					f0_local0( "primaryattachment4", controller )
				end
			end
		elseif currentItemName == "bonuscard_secondary_gunfighter" then
			f0_local0( "secondaryattachment3", controller )
		elseif currentItemName == "bonuscard_overkill" then
			f0_local0( "secondary", controller )
		elseif currentItemName == "bonuscard_two_tacticals" then
			f0_local0( "primarygadget", controller )
		elseif currentItemName == "bonuscard_danger_close" and not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", classModel ) then
			f0_local0( "primarygadgetattachment1", controller )
		end
		if not CanEquipMultiplePrimaryGunfighterWildcard( prevLoadoutSlotName, itemIndex ) then
			local isSwapping = true
			f0_local0( prevLoadoutSlotName, controller, isSwapping )
		else
			swappingItems = false
		end
		canEquip = true
	end
	if not swappingItems then
		local totalAllocation = Engine.GetModelValue( allocationSpentModel )
		if IsCampaign() or totalAllocation < Engine.GetMaxAllocation( controller ) then
			canEquip = true
		else
			CoD.perController[controller].overCapacityItemIndex = itemIndex
			local overCapacityPopup = OpenPopup( self, "OverCapacity", controller )
			overCapacityPopup.acceptData = {
				classNum = classNum,
				slotName = slotName,
				itemIndex = itemIndex
			}
			return false
		end
	end
	if canEquip == true and CoD.CACUtility.EmptyItemIndex < itemIndex then
		local itemName = Engine.GetItemRef( itemIndex )
		if itemName == "bonuscard_overkill" then
			f0_local0( "secondary", controller )
		elseif itemName == "bonuscard_two_tacticals" then
			f0_local0( "primarygadget", controller )
		end
		CoD.SetClassItem( controller, classNum, slotName, itemIndex )
	end
	if not ignoreGetCustomClassModel then
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
	end
	return canEquip
end

local ToggleGadgetMod = function ( self, controller, loadoutSlotName )
	local slotWidget = self.weaponSlotTable[loadoutSlotName]
	if not slotWidget then
		return 
	end
	local weaponSlotModel = slotWidget.widget:getModel( controller, "weaponSlot" )
	local classModel = self:getModel()
	if weaponSlotModel and classModel then
		local weaponSlot = Engine.GetModelValue( weaponSlotModel )
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
		local classNum = CoD.perController[controller].classNum
		local attempAttachItemSuccess = false
		if availability == CoD.CACUtility.CACStatusAvailable.AVAILABLE then
			if equipped then
				f0_local0( weaponSlot, controller )
				self:playSound( "unequip_item" )
			else
				local gadgetSlot = "primarygadget"
				if not LUI.startswith( weaponSlot, gadgetSlot ) then
					gadgetSlot = "secondarygadget"
				end
				local gadgetItemModel = self:getModel( controller, gadgetSlot .. ".itemIndex" )
				if gadgetItemModel then
					local gadgetItemIndex = Engine.GetModelValue( gadgetItemModel )
					local gadgetModCount = Engine.GetNumGadgetAttachments( gadgetItemIndex, false )
					for i = 1, gadgetModCount, 1 do
						if Engine.IsTakeTwoGadgetAttachment( gadgetItemIndex, i ) then
							attempAttachItemSuccess = AttemptAttachItem( self, controller, classModel, classNum, weaponSlot, i )
							self:playSound( "equip_mod" )
						end
					end
				end
			end
			self:processEvent( {
				name = "update_state",
				controller = controller
			} )
			self:processEvent( {
				name = "update_button_prompts",
				controller = controller
			} )
			local weaponName = nil
			local camera = "select01"
			if LUI.startswith( loadoutSlotName, "primarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "primarygadget" )
			elseif LUI.startswith( loadoutSlotName, "secondarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "secondarygadget" )
			end
			if equipped or attempAttachItemSuccess == false then
				Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
			elseif weaponName and weaponName ~= "" then
				Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlotName, weaponName, camera )
			end
		end
	end
end

function NavigateToLoadoutMenu( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	if loadoutSlotName then
		CoD.perController[controller].weaponCategory = loadoutSlotName
		CoD.perController[controller].weaponClassGroup = loadoutSlotName
		CoD.perController[controller].CACSpecficModelValueFocusTable = nil
		CoD.perController[controller].CACWildcardContextualMenu = nil
		CoD.perController[controller].wildcardOverCapacityRefName = nil
		local classNum = CoD.perController[controller].classNum
		local class = Engine.GetCustomClass( controller, classNum )
		local weaponSlot = self.weaponSlotTable[loadoutSlotName]
		local classModel = CoD.perController[controller].classModel
		local leaveBreadcrumb = true
		local menuName, menuSound = nil
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, loadoutSlotName )
		if availability == CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE then
			return 
		elseif availability == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD then
			local itemSlot = nil
			for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( slotName, controller, classModel ) then
					itemSlot = REG18
					break
				end
			end
			local wildcardNeeded = CoD.CACUtility.WildcardNeededForSlot( controller, loadoutSlotName )
			if itemSlot then
				CoD.perController[controller].CACSpecficModelValueFocusTable = {
					ref = wildcardNeeded
				}
				CoD.perController[controller].CACWildcardContextualMenu = true
				CoD.perController[controller].weaponCategory = itemSlot
				OpenPopup( self, "WildcardSelect", controller )
			end
			CoD.perController[controller].wildcardOverCapacitySlot = loadoutSlotName
			local overCapacityPopup = OpenPopup( self, "WildcardCapacity", controller )
			overCapacityPopup.acceptData = {
				classNum = classNum,
				wildcardToReplace = wildcardNeeded
			}
		end
		local primaryGunfighterCount = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, "bonuscard_primary_gunfighter" )
		if loadoutSlotName == "primary" then
			CoD.perController[controller].weaponSlot = "primary"
			menuName = "PrimaryWeaponSelect"
			menuSound = "cac_loadout_edit_select_primary"
		elseif loadoutSlotName == "primaryattachment1" then
			local weaponItemIndex = class.primary
			CoD.perController[controller].weaponSlot = "primary"
			menuSound = "cac_loadout_edit_submenu"
			if weaponItemIndex then
				CoD.perController[controller].attachmentType = "optic"
				menuName = "PrimaryOpticSelect"
			end
		elseif not (loadoutSlotName ~= "primaryattachment2" and loadoutSlotName ~= "primaryattachment3" and (loadoutSlotName ~= "primaryattachment4" or primaryGunfighterCount < 1)) or not (loadoutSlotName ~= "primaryattachment5" or primaryGunfighterCount < 2) or loadoutSlotName == "primaryattachment6" and primaryGunfighterCount >= 3 then
			if IsPrimaryWeaponAttachmentAvailable( controller ) then
				local weaponItemIndex = class.primary
				CoD.perController[controller].weaponSlot = "primary"
				menuSound = "cac_loadout_edit_submenu"
				if weaponItemIndex then
					CoD.perController[controller].attachmentType = "attachment"
					menuName = "PrimaryAttachmentSelect"
				end
			end
		elseif loadoutSlotName == "secondary" then
			CoD.perController[controller].weaponSlot = "secondary"
			menuName = "SecondaryWeaponSelect"
			menuSound = "cac_loadout_edit_select_secondary"
			local isUsingOverkill = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_overkill" )
			if isUsingOverkill == true then
				CoD.perController[controller].weaponClassGroup = "primary"
				menuName = "PrimaryWeaponSelect"
			end
		elseif loadoutSlotName == "secondaryattachment1" then
			local weaponItemIndex = class.secondary
			CoD.perController[controller].weaponSlot = "secondary"
			menuSound = "cac_loadout_edit_submenu"
			if weaponItemIndex then
				CoD.perController[controller].attachmentType = "optic"
				menuName = "SecondaryOpticSelect"
			end
		elseif loadoutSlotName == "secondaryattachment2" or loadoutSlotName == "secondaryattachment3" and CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= "" then
			if IsSecondaryWeaponAttachmentAvailable( controller ) then
				local weaponItemIndex = class.secondary
				CoD.perController[controller].weaponSlot = "secondary"
				menuSound = "cac_loadout_edit_submenu"
				if weaponItemIndex then
					CoD.perController[controller].attachmentType = "attachment"
					menuName = "SecondaryAttachmentSelect"
				end
			end
		elseif loadoutSlotName == "primarygadget" then
			menuName = "LethalEquipmentSelect"
			menuSound = "cac_loadout_edit_submenu"
			local isUsingTwoTacticals = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_two_tacticals" )
			if isUsingTwoTacticals == true then
				CoD.perController[controller].weaponClassGroup = "secondarygadget"
				menuName = "TacticalEquipmentSelect"
			end
		elseif loadoutSlotName == "primarygadgetattachment1" or loadoutSlotName == "primarygadgetattachment2" or loadoutSlotName == "primarygadgetattachment3" then
			ToggleGadgetMod( self, controller, loadoutSlotName )
		elseif loadoutSlotName == "secondarygadget" then
			menuName = "TacticalEquipmentSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "secondarygadgetattachment1" or loadoutSlotName == "secondarygadgetattachment2" or loadoutSlotName == "secondarygadgetattachment3" then
			ToggleGadgetMod( self, controller, loadoutSlotName )
		elseif not (loadoutSlotName ~= "specialty1" and (loadoutSlotName ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) == "")) or not (loadoutSlotName ~= "specialty2" and (loadoutSlotName ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) == "")) or loadoutSlotName == "specialty3" or loadoutSlotName == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= "" then
			menuName = "PerkSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "bonuscard1" or loadoutSlotName == "bonuscard2" or loadoutSlotName == "bonuscard3" then
			menuName = "WildcardSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "cybercom_tacrig1" or loadoutSlotName == "cybercom_tacrig2" then
			menuName = "TacticalRigSelect"
			menuSound = "cac_loadout_edit_submenu"
		end
		if menuSound then
			Engine.PlaySound( menuSound )
		end
		if menuName then
			if menuName == "WildcardSelect" then
				OpenPopup( self, menuName, controller )
			else
				NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
			end
		end
	end
end

function NavigateToPersonalizeMenu( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	if not (loadoutSlotName ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", controller )) or loadoutSlotName == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", controller ) then
		CoD.perController[controller].weaponCategory = loadoutSlotName
		local menuName = "WeaponCustomization"
		local leaveBreadcrumb = true
		self:openOverlay( menuName, controller )
	elseif not (loadoutSlotName ~= "cybercom_tacrig1" or not CoD.CACUtility.ItemEquippedInSlot( "cybercom_tacrig1", controller )) or loadoutSlotName == "cybercom_tacrig2" and CoD.CACUtility.ItemEquippedInSlot( "cybercom_tacrig2", controller ) then
		CoD.perController[controller].weaponCategory = loadoutSlotName
		local menuName = "TacticalRigUpgrade"
		local leaveBreadcrumb = true
		NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
	end
end

function CAC_TabChanged( self, element, controller )
	if not self.performingSetup then
		local categoryGroup = element.filter
		DataSources.Unlockables.setCurrentFilterItem( categoryGroup )
		self.weaponList:updateDataSource( true )
		local lastIndex = 1
		local weaponWidget = self.weaponList:getItemAt( lastIndex )
		if weaponWidget then
			self.weaponList:setActiveItem( weaponWidget, 0, true, true )
		end
	end
end

function Cybercore_TabChanged( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local cybercoreUpgradeMenuModel = Engine.GetModel( perControllerModel, "CybercoreUpgradeMenu" )
	local coreModel = Engine.GetModel( cybercoreUpgradeMenuModel, "selectedCore" )
	Engine.SetModelValue( coreModel, element.itemRef )
	Engine.SetModelValue( Engine.GetModel( cybercoreUpgradeMenuModel, "currentCybercoreName" ), element.itemName )
	self.upgradeTree:updateTree( controller )
	FocusCybercoreUpgradeItem( self, controller )
	self:processEvent( {
		name = "update_state",
		controller = controller
	} )
end

function SetClassItem( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	if AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemIndex ) then
		BreakWeaponVariantLink( controller )
		self:playSound( "equip_item" )
		local previousMenu = GoBack( self, controller )
		if previousMenu then
			previousMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
		return previousMenu
	else
		
	end
end

function SetClassWildcard( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local selectingSameItem = false
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local currentEquippedIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
	if currentEquippedIndexModel then
		local currentEquippedIndex = Engine.GetModelValue( currentEquippedIndexModel )
		if CoD.CACUtility.EmptyItemIndex < currentEquippedIndex and currentEquippedIndex == itemIndex then
			selectingSameItem = true
		end
	end
	if selectingSameItem or AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemIndex ) then
		self:playSound( "equip_item" )
		local previousMenu = GoBack( self, controller )
		if CoD.CACUtility.CustomClass_LastClassNum and previousMenu.menuName == "CustomClass" then
			previousMenu:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
			previousMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
	end
end

function SetClassAttachment( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local ignoreGetCustomClassModel = true
	if AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemIndex, ignoreGetCustomClassModel ) then
		local acvValue = element.acvIndex
		if acvValue ~= nil then
			CoD.SetClassItem( controller, classNum, slotName .. "cosmeticvariant", acvValue )
		end
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		BreakWeaponVariantLink( controller )
		self:playSound( "equip_item" )
		local previousMenu = GoBack( self, controller )
		if previousMenu then
			previousMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
	end
end

local AttachWeaponVariant = function ( self, controller, slotName, weaponVariantInfo, attachmentsByIndex, shouldEquipWildcard, bonuscardGunfighterForSlot )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local weaponIndex = weaponVariantInfo.weaponIndex
	local cacVariantIndex = weaponVariantInfo.cacVariantIndex
	local acvTable = weaponVariantInfo.attachmentVariant
	local ignoreGetCustomClassModel = true
	CoD.SetClassItem( controller, classNum, slotName .. "gunsmithvariant", cacVariantIndex )
	f0_local0( slotName, controller )
	AttemptAttachItem( self, controller, classModel, classNum, slotName, weaponIndex, ignoreGetCustomClassModel )
	CoD.SetClassItem( controller, classNum, slotName .. "camo", weaponVariantInfo.camoIndex )
	local paintjobSlot = weaponVariantInfo.paintjobSlot
	local paintjobIndex = weaponVariantInfo.paintjobIndex
	if paintjobSlot and paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		CoD.SetClassItem( controller, classNum, slotName .. "paintjobslot", weaponVariantInfo.paintjobSlot )
		CoD.SetClassItem( controller, classNum, slotName .. "paintjobindex", weaponVariantInfo.paintjobIndex )
	end
	for i, attachmentIndex in ipairs( attachmentsByIndex ) do
		local attachmentSlot = slotName .. "attachment" .. i
		if CoD.CACUtility.EmptyItemIndex < attachmentIndex then
			AttemptAttachItem( self, controller, classModel, classNum, attachmentSlot, REG19, ignoreGetCustomClassModel )
			CoD.SetClassItem( controller, classNum, attachmentSlot .. "cosmeticvariant", acvTable[REG18] )
		end
	end
	if shouldEquipWildcard then
		local availableBonusCardSlot = nil
		for _, bonudCardSlotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( bonudCardSlotName, controller, classModel ) then
				availableBonusCardSlot = REG20
				break
			end
		end
		if availableBonusCardSlot then
			local bonuscardNeededIndex = CoD.CACUtility.EmptyItemIndex
			for index, model in ipairs( CoD.UnlockablesTable.bonuscard ) do
				local unlockablesBonuscardRef = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
				if unlockablesBonuscardRef == bonuscardGunfighterForSlot then
					bonuscardNeededIndex = Engine.GetModelValue( Engine.GetModel( REG21, "itemIndex" ) )
					break
				end
			end
			if CoD.CACUtility.EmptyItemIndex < bonuscardNeededIndex then
				AttemptAttachItem( self, controller, classModel, classNum, availableBonusCardSlot, bonuscardNeededIndex, ignoreGetCustomClassModel )
			end
		end
	end
	CoD.CACUtility.GetCustomClassModel( controller, classNum, CoD.perController[controller].classModel )
end

function SetWeaponVariant( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local slotName = CoD.perController[controller].weaponCategory
	local f356_local0 = slotName == "primary"
	local weaponIndex = element.weaponVariantInfo.weaponIndex
	local attachmentsByIndex = element.weaponVariantInfo.attachmentsByIndex
	local removeItemFromClassMenu = false
	local openWildcardCapacityMenu = false
	local maxAllocation = Engine.GetMaxAllocation( controller )
	local allocationSpentModel = Engine.GetModel( classModel, "allocationSpent" )
	local currentClassAllocation = 0
	local currentWeaponAllocation = 0
	local currentAttachmentsAllocation = 0
	local currentWildcardAllocation = 0
	local maxNonOpticsAttachmentsWithoutWildcard = 2
	if not f356_local0 then
		maxNonOpticsAttachmentsWithoutWildcard = 1
	end
	local maxAttachmentsWithoutWildcard = maxNonOpticsAttachmentsWithoutWildcard + 1
	if allocationSpentModel then
		currentClassAllocation = Engine.GetModelValue( allocationSpentModel )
	end
	local currentWeaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, slotName .. ".itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < currentWeaponItemIndex then
		currentWeaponAllocation = 1
	end
	local bonuscardGunfighterForSlot = "bonuscard_primary_gunfighter"
	local attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if not f356_local0 then
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
		bonuscardGunfighterForSlot = "bonuscard_secondary_gunfighter"
	end
	local currentHasOptic = false
	for index, attachmentSlotName in ipairs( attachmentList ) do
		local attachmentItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlotName .. ".itemIndex" ) )
		if Engine.IsOptic( weaponIndex, attachmentItemIndex ) then
			currentHasOptic = true
		end
		if CoD.CACUtility.EmptyItemIndex < attachmentItemIndex then
			currentAttachmentsAllocation = currentAttachmentsAllocation + 1
		end
	end
	local isWildcardEquipped = false
	isWildcardEquipped = CoD.CACUtility.IsBonusCardEquipped( bonuscardGunfighterForSlot, classModel )
	if not (not isWildcardEquipped and (not currentHasOptic or maxAttachmentsWithoutWildcard >= currentAttachmentsAllocation)) or not currentHasOptic and maxNonOpticsAttachmentsWithoutWildcard < currentAttachmentsAllocation then
		currentWildcardAllocation = 1
	end
	currentClassAllocation = currentClassAllocation - currentWeaponAllocation - currentAttachmentsAllocation - currentWildcardAllocation
	local variantAllocationCost = 0
	local weaponAllocationCost = 1
	local attachmentAllocationCost = 0
	local wildcardForVariantAllocationCost = 0
	local variantHasOpticAttachment = false
	local f356_local4 = element.weaponVariantInfo.isWildcardNeeded == true
	for i, attachmentIndex in ipairs( attachmentsByIndex ) do
		if CoD.CACUtility.EmptyItemIndex < attachmentIndex then
			attachmentAllocationCost = attachmentAllocationCost + 1
		end
	end
	if f356_local4 then
		wildcardForVariantAllocationCost = 1
	end
	variantAllocationCost = weaponAllocationCost + attachmentAllocationCost + wildcardForVariantAllocationCost
	local f356_local8
	if wildcardForVariantAllocationCost > 0 then
		f356_local8 = not isWildcardEquipped
	else
		f356_local8 = false
	end
	if f356_local8 then
		local availableBonusCardSlot = nil
		for _, bonudCardSlotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( bonudCardSlotName, controller, classModel ) then
				availableBonusCardSlot = REG36
				break
			end
		end
		if not availableBonusCardSlot then
			openWildcardCapacityMenu = true
		end
	end
	if not IsCampaign() and maxAllocation < currentClassAllocation + variantAllocationCost then
		removeItemFromClassMenu = true
	else
		AttachWeaponVariant( self, controller, slotName, element.weaponVariantInfo, attachmentsByIndex, f356_local8, bonuscardGunfighterForSlot )
	end
	if openWildcardCapacityMenu then
		CoD.perController[controller].wildcardOverCapacityRefName = bonuscardGunfighterForSlot
		local overCapacityPopup = OpenPopup( self, "WildcardCapacity", controller )
		overCapacityPopup.acceptData = {
			classNum = classNum,
			removeItemFromClassMenu = true,
			variantInfoElement = element,
			wildcardToReplace = bonuscardGunfighterForSlot
		}
	elseif removeItemFromClassMenu then
		local numItemsToRemove = currentClassAllocation + variantAllocationCost - maxAllocation
		local numItemsToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.numItemsToRemove" )
		Engine.SetModelValue( numItemsToRemoveModel, numItemsToRemove )
		CoD.perController[controller].wildcardNeededForWeaponVariant = f356_local4
		local removeItemPopup = OpenPopup( self, "RemoveItemFromClass", controller )
		removeItemPopup.acceptData = {
			slotName = slotName,
			weaponVariantInfo = element.weaponVariantInfo,
			attachmentsByIndex = attachmentsByIndex,
			shouldEquipWildcard = f356_local8,
			bonuscardGunfighterForSlot = bonuscardGunfighterForSlot
		}
	else
		GoBackToCustomClassMenu( self, controller )
	end
end

function BreakWeaponVariantLink( controller, loadoutSlotStringArg )
	local classNum = CoD.perController[controller].classNum
	local emptyWeaponVariant = CoD.CACUtility.EmptyItemIndex
	local loadoutSlotName = loadoutSlotStringArg
	local baseWeaponLoaodutSlot = nil
	if not loadoutSlotStringArg then
		loadoutSlotName = CoD.perController[controller].weaponCategory
	end
	baseWeaponLoaodutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	if baseWeaponLoaodutSlot == "primary" or baseWeaponLoaodutSlot == "secondary" then
		CoD.SetClassItem( controller, classNum, baseWeaponLoaodutSlot .. "gunsmithvariant", emptyWeaponVariant )
	end
end

function FocusCybercoreUpgradeItem( self, controller )
	local itemIndexModel = self.infoWidget:getModel( controller, "baseItemIndex" )
	local curFocusAttachmentIndex = 0
	if itemIndexModel then
		curFocusAttachmentIndex = Engine.GetModelValue( itemIndexModel )
		local camera = "select01"
		local modelName = CoD.CACUtility.GetCybercoreXModel( curFocusAttachmentIndex )
		Engine.SendClientScriptNotify( controller, "CustomClass_update", "cybercore", modelName, camera )
	end
end

function FocusClassItem( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local curFocusAttachmentIndex = 0
	if itemIndexModel then
		curFocusAttachmentIndex = Engine.GetModelValue( itemIndexModel )
	elseif element.itemIndex then
		curFocusAttachmentIndex = element.itemIndex
	end
	local camera = "select01"
	local baseWeaponSlotName, attachmentList, modelName = nil
	if LUI.startswith( slotName, "primaryattachment" ) then
		baseWeaponSlotName = "primary"
		attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( slotName, "secondaryattachment" ) then
		baseWeaponSlotName = "secondary"
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	elseif LUI.startswith( slotName, "specialty" ) then
		baseWeaponSlotName = "specialty"
		modelName = CoD.CACUtility.GetPerkXModel( curFocusAttachmentIndex )
	elseif LUI.startswith( slotName, "bonuscard" ) then
		baseWeaponSlotName = "bonuscard"
		modelName = CoD.CACUtility.GetBonuscardXModel( curFocusAttachmentIndex )
	elseif LUI.startswith( slotName, "cybercore" ) then
		baseWeaponSlotName = "cybercore"
		modelName = CoD.CACUtility.GetCybercoreXModel( curFocusAttachmentIndex )
	elseif LUI.startswith( slotName, "cybercom" ) then
		baseWeaponSlotName = "cybercom"
		modelName = CoD.CACUtility.GetPerkXModel( curFocusAttachmentIndex )
	end
	local weaponIndexModel = Engine.GetModel( classModel, baseWeaponSlotName .. ".itemIndex" )
	local slotIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
	if weaponIndexModel and slotIndexModel and baseWeaponSlotName ~= "cybercore" then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		local focusAttachmentRef = Engine.GetAttachmentRef( weaponIndex, curFocusAttachmentIndex )
		local curSlotAttachmentIndex = Engine.GetModelValue( slotIndexModel )
		local curAttachmentName = Engine.GetAttachmentRef( weaponIndex, curSlotAttachmentIndex )
		local weaponName = Engine.GetItemRef( weaponIndex ) .. "_" .. CoD.gameMode:lower()
		local cacAttachmentList = {}
		local focusAttachmentFound = false
		for index, attachmentSlot in ipairs( attachmentList ) do
			local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlot .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < cacAttachmentIndex then
				if cacAttachmentIndex ~= curSlotAttachmentIndex then
					local tempCACAttachmentRef = Engine.GetAttachmentRef( weaponIndex, cacAttachmentIndex )
					local tempAttachmentData = {
						index = cacAttachmentIndex,
						ref = tempCACAttachmentRef
					}
					table.insert( cacAttachmentList, tempAttachmentData )
				else
					focusAttachmentFound = true
				end
			end
		end
		for _, attachmentData in ipairs( cacAttachmentList ) do
			local attachmentRef = attachmentData.ref
			local attachmentIndex = attachmentData.index
			if (not (focusAttachmentRef == "reflex" or focusAttachmentRef == "acog" or focusAttachmentRef == "ir") or attachmentRef ~= "reflex" and attachmentRef ~= "acog" and attachmentRef ~= "ir") and Engine.AreAttachmentsCompatible( weaponIndex, curFocusAttachmentIndex, attachmentIndex ) then
				weaponName = weaponName .. "+" .. attachmentRef
			end
		end
		weaponName = weaponName .. "+" .. focusAttachmentRef
		if weaponName and weaponName ~= "" then
			local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, slotName )
			local focusACVIndex = element.acvIndex
			local focusACVInfo = focusAttachmentRef .. "," .. focusACVIndex
			attachmentInfo = attachmentInfo .. focusACVInfo
			local weaponOptions = "none"
			Engine.SendClientScriptNotify( controller, "CustomClass_focus", baseWeaponSlotName, weaponName, focusAttachmentRef, weaponOptions, attachmentInfo )
		end
	elseif slotIndexModel ~= nil then
		Engine.SendClientScriptNotify( controller, "CustomClass_update", slotName, modelName, camera )
	end
end

function FocusWeapon( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		local itemName = Engine.GetItemRef( Engine.GetModelValue( itemIndexModel ) )
		local menuResponseItemName = itemName .. "_mp"
		if slotName == "secondary" then
			menuResponseItemName = "none," .. menuResponseItemName
		end
		local postFix = CoD.gameMode:lower()
		local weaponName = itemName .. "_" .. postFix
		local weaponOptions = CoD.CACUtility.EmptyWeaponOptions()
		Engine.SendClientScriptNotify( controller, "CustomClass_update", slotName, weaponName, "select01", weaponOptions )
	end
end

function FocusWeaponVariant( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local weaponIndex = element.weaponVariantInfo.weaponIndex
	local variantNameModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.curWeaponVariantName" )
	Engine.SetModelValue( variantNameModel, element.weaponVariantInfo.variantName )
	local itemName = Engine.GetItemRef( weaponIndex )
	local postFix = CoD.gameMode:lower()
	local weaponName = itemName .. "_" .. postFix
	for i, attachmentIndex in ipairs( element.weaponVariantInfo.attachmentsByIndex ) do
		local tempAttachmentName = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
		weaponName = weaponName .. "+" .. tempAttachmentName
	end
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
	local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromVariantInfo( controller, element.weaponVariantInfo )
	local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( element.weaponVariantInfo )
	Engine.SendClientScriptNotify( controller, "CustomClass_update", slotName, weaponName, camera, weaponOptions, attachmentInfo )
end

function MarkCACPaintshopDataDirty( self, controller )
	Engine.MarkPSDataDirty( controller, false )
end

function RemoveItemFromClass( self, element, controller )
	if self.ShowRemovePrompt ~= nil and not self:ShowRemovePrompt( controller ) then
		return 
	end
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = self.currentActiveSlot
	if loadoutSlotName and f0_local0( loadoutSlotName, controller ) then
		BreakWeaponVariantLink( controller, loadoutSlotName )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		self:playSound( "unequip_item" )
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
		self:processEvent( {
			name = "update_button_prompts",
			controller = controller
		} )
	end
	local primaryWeaponString = Engine.GetWeaponString( controller, classNum, "primary" )
	local secondaryWeaponString = Engine.GetWeaponString( controller, classNum, "secondary" )
	if primaryWeaponString ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_primary", "custom_removeattach", primaryWeaponString )
	end
	if secondaryWeaponString ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_secondary", "custom_removeattach", secondaryWeaponString )
	end
	local weaponName = nil
	local baseWeaponLoadoutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	if baseWeaponLoadoutSlot and (baseWeaponLoadoutSlot == "primary" or baseWeaponLoadoutSlot == "secondary") then
		weaponName = Engine.GetWeaponString( controller, classNum, baseWeaponLoadoutSlot )
	else
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
	end
	if weaponName and weaponName ~= "" then
		local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
		Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlotName, weaponName, camera, weaponOptions, attachmentInfo )
	else
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
	end
end

function RemoveOverflowItemFromClass( self, element, controller )
	local loadSlot = element:getModel( controller, "itemSlot" )
	if loadSlot then
		local loadoutSlotName = Engine.GetModelValue( loadSlot )
		f0_local0( loadoutSlotName, controller )
	end
	local classModel = CoD.perController[controller].classModel
	local classNum = self.acceptData.classNum
	local slotName = self.acceptData.slotName
	local itemIndex = self.acceptData.itemIndex
	AttemptAttachItem( self, controller, classModel, classNum, slotName, itemIndex )
	BreakWeaponVariantLink( controller )
	local customClassMenu = GoBack( self, controller )
	if customClassMenu.id ~= "Menu.CustomClass" then
		customClassMenu = GoBack( customClassMenu, controller )
	else
		local weaponName = nil
		local camera = "select01"
		if LUI.startswith( slotName, "primarygadgetattachment" ) then
			weaponName = Engine.GetWeaponString( controller, classNum, "primarygadget" )
		elseif LUI.startswith( slotName, "secondarygadgetattachment" ) then
			weaponName = Engine.GetWeaponString( controller, classNum, "secondarygadget" )
		end
		if weaponName and weaponName ~= "" then
			Engine.SendClientScriptNotify( controller, "CustomClass_update", slotName, weaponName, camera )
		end
	end
	if customClassMenu then
		customClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
		SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
	end
end

function WeaponVariantRemoveItemFromClass( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local currentAllocation = Engine.GetUsedAllocation( controller, classNum )
	local loadSlot = element:getModel( controller, "itemSlot" )
	if loadSlot then
		local loadoutSlotName = Engine.GetModelValue( loadSlot )
		f0_local0( loadoutSlotName, controller )
	end
	local allocationAfterRemoval = Engine.GetUsedAllocation( controller, classNum )
	local itemsRemoved = currentAllocation - allocationAfterRemoval
	self.itemList:updateDataSource()
	local numItemsToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.numItemsToRemove" )
	local numItemsToRemove = Engine.GetModelValue( numItemsToRemoveModel ) - itemsRemoved
	Engine.SetModelValue( numItemsToRemoveModel, numItemsToRemove )
	if numItemsToRemove <= 0 then
		local slotName = self.acceptData.slotName
		local weaponVariantInfo = self.acceptData.weaponVariantInfo
		local attachmentsByIndex = self.acceptData.attachmentsByIndex
		local shouldEquipWildcard = self.acceptData.shouldEquipWildcard
		local bonuscardGunfighterForSlot = self.acceptData.bonuscardGunfighterForSlot
		AttachWeaponVariant( self, controller, slotName, weaponVariantInfo, attachmentsByIndex, shouldEquipWildcard, bonuscardGunfighterForSlot )
		local previousMenu = GoBack( self, controller )
		GoBackToCustomClassMenu( previousMenu, controller )
		ClearSavedState( previousMenu, controller )
	end
end

local FindBonuscardItemIndexFromNameInUnlockablesTable = function ( itemName )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
	end
	if CoD.UnlockablesTable then
		for index, model in ipairs( CoD.UnlockablesTable.bonuscard ) do
			local refModel = Engine.GetModel( model, "ref" )
			if refModel then
				local refName = Engine.GetModelValue( refModel )
				if refName == itemName then
					local itemIndexModel = Engine.GetModel( REG5, "itemIndex" )
					if itemIndexModel then
						return Engine.GetModelValue( itemIndexModel )
					end
				end
			end
		end
	end
end

function RemoveOverflowWildcardFromClass( self, element, controller )
	local loadSlot = element:getModel( controller, "itemSlot" )
	local loadoutSlotName = nil
	if loadSlot then
		loadoutSlotName = Engine.GetModelValue( loadSlot )
		f0_local0( loadoutSlotName, controller )
	end
	local itemIndex = FindBonuscardItemIndexFromNameInUnlockablesTable( self.acceptData.wildcardToReplace )
	local classModel = CoD.perController[controller].classModel
	local classNum = self.acceptData.classNum
	AttemptAttachItem( self, controller, classModel, classNum, loadoutSlotName, itemIndex )
	if self.acceptData.removeItemFromClassMenu == true then
		local variantInfoElement = self.acceptData.variantInfoElement
		if variantInfoElement then
			local previousMenu = GoBack( self, controller )
			SetWeaponVariant( previousMenu, variantInfoElement, controller )
		end
	else
		GoBackToCustomClassMenu( self, controller )
	end
end

function SetWeaponOptionClassItem( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local weaponOptionNameModel = element:getModel( controller, "weaponOptionTypeName" )
	local weaponOptionIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if weaponOptionNameModel and weaponOptionIndexModel and weaponOptionTypeModel then
		local weaponOptionName = Engine.GetModelValue( weaponOptionNameModel )
		local weaponOptionIndex = Engine.GetModelValue( weaponOptionIndexModel )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. weaponOptionName .. "slot", paintjobSlot )
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. weaponOptionName .. "index", paintjobIndex )
		else
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. weaponOptionName, weaponOptionIndex )
		end
		CoD.CACUtility.UpdateWeaponOptions( controller, classModel )
	end
end

function SetAttachmentVariantClassItem( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local attachmentSlot = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, loadoutSlotName, element.attachmentRef )
	if attachmentSlot then
		CoD.SetClassItem( controller, classNum, attachmentSlot .. "cosmeticvariant", element.variantIndex )
		CoD.CACUtility.UpdateAttachmentCosmeticVariants( controller, classModel )
	end
end

function UpdateAllocationBar( self, element, controller )
	local allocationModel = element:getModel( controller, "allocationSpent" )
	if allocationModel then
		local allocationSpent = Engine.GetModelValue( allocationModel )
		if allocationSpent >= 0 then
			for i = 1, Engine.GetMaxAllocation( controller ), 1 do
				local allocationBarElement = element["AllocationBar" .. i - 1]
				if allocationBarElement ~= nil then
					if i <= allocationSpent then
						allocationBarElement:playClip( "PointSpent" )
					else
						allocationBarElement:playClip( "DefaultClip" )
					end
				end
			end
		end
	end
end

function ClassOptionsRename( self, element, controller )
	local classNumModel = self:getModel( controller, "classNum" )
	if classNumModel then
		local classNum = Engine.GetModelValue( classNumModel )
		Engine.Exec( controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_CUSTOM_CLASS )
	end
end

function ClassOptionsCopyLoadout( self, element, controller )
	local isCurrentSelectedClass = IsCurrentClassSelectedClass( self, element )
	if isCurrentSelectedClass == true then
		return 
	end
	local currentClassNumModel = self:getModel( controller, "classNum" )
	local elementClassNumModel = element:getModel( controller, "classNum" )
	if currentClassNumModel and elementClassNumModel then
		local currentClassNum = Engine.GetModelValue( currentClassNumModel )
		local elementClassNum = Engine.GetModelValue( elementClassNumModel )
		if currentClassNum and elementClassNum then
			Engine.ExecNow( controller, "copyClass " .. currentClassNum .. " " .. elementClassNum )
			CoD.CACUtility.UpdateAllClasses( controller )
			local occludedMenu = self.occludedMenu
			GoBack( self, controller )
			ClearSavedState( self, controller )
			GoBack( occludedMenu, controller )
			ClearSavedState( occludedMenu, controller )
		end
	end
end

function ClassOptionsResetToDefault( self, element, controller )
	local currentClassNumModel = self:getModel( controller, "classNum" )
	local defaultClassNameTextModel = element:getModel( controller, "name" )
	local defaultClassIndexModel = element:getModel( controller, "index" )
	if currentClassNumModel and defaultClassNameTextModel and defaultClassIndexModel then
		local classNumToReplace = Engine.GetModelValue( currentClassNumModel )
		local defaultClassTextName = Engine.GetModelValue( defaultClassNameTextModel )
		local defaultClassIndex = Engine.GetModelValue( defaultClassIndexModel )
		local defaultClassName = CoD.CACUtility.GetDefaultLoadoutNameFromIndex( defaultClassIndex )
		Engine.ExecNow( controller, "uiEquipDefaultClass " .. classNumToReplace .. " " .. defaultClassName )
		local f373_local0 = CoD.CACUtility.GetLoadoutNameFromIndex( controller, classNumToReplace )
		f373_local0:set( defaultClassTextName )
		CoD.CACUtility.UpdateAllClasses( controller )
	end
	local classOptionsPopup = self.occludedMenu
	local chooseClassMenu = classOptionsPopup.occludedMenu
	if classOptionsPopup and chooseClassMenu then
		chooseClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
	GoBack( self, controller )
	ClearSavedState( self, controller )
	GoBack( classOptionsPopup, controller )
	ClearSavedState( classOptionsPopup, controller )
end

function ClassOptionsClearLoadout( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	for i = 1, #CoD.CACUtility.clearLoadoutSlotOrder, 1 do
		local loadoutSlotName = CoD.CACUtility.clearLoadoutSlotOrder[i]
		local slotModel = Engine.GetModel( classModel, loadoutSlotName )
		if slotModel then
			local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < itemIndex then
				CoD.SetClassItem( controller, classNum, loadoutSlotName, CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	CoD.SetClassItem( controller, classNum, "primarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( controller, classNum, "primarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.SetClassItem( controller, classNum, "secondarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( controller, classNum, "secondarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
	local chooseClassMenu = self.occludedMenu
	if chooseClassMenu then
		chooseClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function PurchaseItem( self, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		local itemIndex = Engine.GetModelValue( indexModel )
		Engine.PurchaseItem( controller, itemIndex )
	end
end

function SetUnlockConfirmationInfo( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local elementItemIndex = Engine.GetModelValue( itemIndexModel )
		local unlockTokenModel = Engine.GetModel( Engine.GetModelForController( controller ), "UnlockTokenInfo" )
		local unlockTokenItemIndexModel = Engine.GetModel( unlockTokenModel, "itemIndex" )
		Engine.SetModelValue( unlockTokenItemIndexModel, elementItemIndex )
		local xpBarInfoModel = Engine.GetModel( unlockTokenModel, "xpBarInfo" )
		if xpBarInfoModel then
			local playerStats = CoD.GetPlayerStats( controller )
			local rankXP = playerStats.PlayerStatsList.RANKXP.StatValue:get()
			local currentRank = playerStats.PlayerStatsList.RANK.StatValue:get()
			local prestige = playerStats.PlayerStatsList.PLEVEL.StatValue:get()
			local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( currentRank, controller )
			if not maxXP then
				maxXP = rankXP
			end
			local currLevel, currLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank, prestige )
			local nextLevel, nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, prestige )
			Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "rankXP" ), rankXP )
			Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "xpEarned" ), 0 )
			Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "xpNeeded" ), maxXP - rankXP )
			Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "currLevel" ), currLevel )
			Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "currLevelIcon" ), currLevelIcon )
			Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "nextLevel" ), nextLevel )
			Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "nextLevelIcon" ), nextLevelIcon )
		end
		CoD.perController[controller].UnlockTokenInfo = unlockTokenModel
	end
end

function OpenUnlockClassItemDialog( menu, element, controller )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "UnlockClassItem", controller, Engine.GetModelValue( element:getModel( controller, "itemIndex" ) ) )
end

function UnlockItem( self, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		Engine.PurchaseItem( controller, itemIndex )
	end
end

function UnlockAndEquipItem( self, element, controller )
	local weaponCategory = CoD.perController[controller].weaponCategory
	UnlockItem( self, element, controller )
	local itemIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	if weaponCategory == "specialist" then
		local mode = CoD.perController[controller].customizationMode
		local heroIndex = CoD.CCUtility.Heroes.HeroIndexForEdits
		local equippedSlot = CoD.CCUtility.GetHeroEquippedSlot( controller, itemIndex )
		SelectHero( self, element, controller )
		Engine.SetHeroLoadoutItem( controller, mode, heroIndex, equippedSlot )
	elseif LUI.startswith( weaponCategory, "killstreak" ) then
		EquipScorestreak( self, element, controller )
	else
		local newMenu = SetClassItem( self, element, controller )
		if LUI.startswith( weaponCategory, "bonuscard" ) and not IsCACContextualWildcardOpen( controller ) then
			element.itemIndex = itemIndex
			FocusClassItem( newMenu, element, controller )
		end
		return newMenu
	end
end

function UnlockAndEquipHeroForMPFirstTimeSetup( self, element, controller, actionParam, menu )
	local itemIndex = nil
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	if not itemIndex then
		itemIndex = element.itemIndex
	end
	local menuToSendScriptNotify = menu
	if actionParam.previousMenu then
		menuToSendScriptNotify = actionParam.previousMenu
	end
	local mode = CoD.perController[controller].customizationMode
	local heroIndex = CoD.CCUtility.Heroes.HeroIndexForEdits
	local equippedSlot = CoD.CCUtility.GetHeroEquippedSlot( controller, itemIndex )
	if equippedSlot then
		SelectHero( self, element, controller )
		Engine.SetHeroLoadoutItem( controller, mode, heroIndex, equippedSlot )
		Engine.SetHeroForCACType( controller, mode, Enum.CACType.CAC_TYPE_MP_CUSTOM, heroIndex )
		Engine.SetHeroLoadoutItemForCACType( controller, mode, Enum.CACType.CAC_TYPE_MP_CUSTOM, heroIndex, equippedSlot )
		SetFirstTimeSetupComplete_MP( self, element, controller, "", menu )
		SendClientScriptMenuChangeNotify( controller, menuToSendScriptNotify, false )
		Engine.ExecNow( controller, "statWriteMode mp unlocks 1" )
		Engine.PurchaseItem( controller, itemIndex, mode )
		SaveLoadout( self, controller )
	end
end

function TryPurchaseCybercoreAbility( self, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local ConfirmPurchase = function ( itemIndex )
			Engine.SetModelValue( Engine.CreateModel( elementModel, "itemIndex" ), itemIndex )
			SetUnlockConfirmationInfo( element, controller )
			if not IsCACHaveTokens( controller ) then
				OpenPopup( self, "OutOfUnlockTokens", controller )
			else
				OpenUnlockClassItemDialog( self, element, controller )
			end
		end
		
		local prereqItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "prereqItemIndex" ) )
		if prereqItemIndex == -1 or Engine.IsItemPurchased( controller, prereqItemIndex ) then
			local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
			if not Engine.IsItemPurchased( controller, baseItemIndex ) then
				ConfirmPurchase( baseItemIndex )
			else
				local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "upgradeItemIndex" ) )
				if upgradeItemIndex and not Engine.IsItemPurchased( controller, upgradeItemIndex ) then
					ConfirmPurchase( upgradeItemIndex )
				end
			end
		end
	end
end

function UpdateCybercoreTree( self, element, controller )
	if self.upgradeTree then
		self.upgradeTree:updateTree( controller )
	end
end

function ToggleAttachmentCosmeticVariant( self, element, controller )
	local classModel = self:getModel()
	local weaponSlot = CoD.perController[controller].weaponSlot
	local classNum = CoD.perController[controller].classNum
	local elementModel = element:getModel()
	local acvList = CoD.CACUtility.GetCACWeaponACVList( weaponSlot )
	if elementModel then
		local attachmentIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "itemIndex" ) )
		local attachmentTableIndex = element.attachmentTableIndex
		if attachmentTableIndex == nil and element:getParent() then
			local f384_local0 = element:getParent()
			attachmentTableIndex = f384_local0.attachmentTableIndex
		end
		local cacSlotAttachmentIndex = CoD.CACUtility.AttachmentEquippedInCACSlot( controller, weaponSlot, attachmentIndex )
		local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, weaponSlot .. ".itemIndex" ) )
		local weaponName = Engine.GetWeaponString( controller, classNum, weaponSlot )
		if weaponIndex then
			local attachmentNameModel = Engine.GetModel( elementModel, "name" )
			local attachmentImageModel = Engine.GetModel( elementModel, "image" )
			if element.acvIndex == 0 then
				local acv = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentTableIndex )
				if acv then
					Engine.SetModelValue( attachmentNameModel, acv.name )
					Engine.SetModelValue( attachmentImageModel, acv.image )
					element.acvIndex = 1
				end
			else
				local defaultName = Engine.GetAttachmentNameByIndex( attachmentTableIndex )
				Engine.SetModelValue( attachmentNameModel, defaultName )
				local defaultImage = Engine.GetAttachmentUniqueImageByIndex( weaponIndex, attachmentIndex )
				Engine.SetModelValue( attachmentImageModel, defaultImage )
				element.acvIndex = 0
			end
			if cacSlotAttachmentIndex then
				CoD.SetClassItem( controller, classNum, acvList[cacSlotAttachmentIndex], element.acvIndex )
			end
			self:playSound( "toggle_switch" )
			FocusClassItem( self, element, controller )
		end
	end
end

function SetCACItemAsOld( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		Engine.SetItemAsOld( controller, itemIndex )
	end
end

function SetCACAttachmentAsOld( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local attachmentIndex = Engine.GetModelValue( itemIndexModel )
		Engine.SetAttachmentAsOld( controller, element.weaponIndex, attachmentIndex )
	end
end

function SetHintText( self, element, controller )
	local hintText = nil
	if element then
		if element.hintText then
			hintText = element.hintText
		else
			local elementModel = element:getModel()
			if elementModel then
				local hintTextModel = Engine.GetModel( elementModel, "hintText" )
				if hintTextModel then
					hintText = Engine.GetModelValue( hintTextModel )
				end
			end
		end
	end
	if hintText == nil then
		DataSources.PerController.clearHintText( controller )
	else
		DataSources.PerController.setHintText( controller, hintText )
	end
end

function PDV_DataVaultOpened( self, controller )
	Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "mainCam" )
	Engine.LockInput( controller, true )
	CoD.perController[controller].InspectingDataVault = true
end

function PDV_DataVaultClosed( self, controller )
	Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "closed" )
	Engine.LockInput( controller, false )
	CoD.perController[controller].InspectingDataVault = false
	Close( self, controller )
end

function PDV_SetChoosingMap( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_MISSION, element )
end

function PDV_SetChoosingCollectible( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE, element )
end

function PDV_SetInspectingCollectible( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE, element )
end

function PDV_ChangeCollectibleArea( self, element, controller )
	Engine.SendClientScriptNotify( controller, "collectibles_slot_change", element.collectibleSize )
	CoD.perController[controller].inspectingCollectibleSize = element.collectibleSize
end

function PDV_ClearCollectible( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		Engine.ClearBunkCollectible( controller, collectibleSlot )
		Engine.SendClientScriptNotify( controller, "collectible_update", "unequip", collectibleSlot )
	end
end

function PDV_ClearPreviewCollectible( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		Engine.SendClientScriptNotify( controller, "collectible_update", "clear_preview_collectible", collectibleSlot )
	end
end

function PDV_ChangeFocusCollectibleSlot( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		local mapData = CoD.mapsTable[CoD.perController[controller].placeCollectibleMapName]
		local collectibleList = Engine.GetAssetList( mapData.collectibles )
		for index, collectible in ipairs( collectibleList ) do
			if collectible.name == CoD.perController[controller].placeCollectibleName then
				local collectibleModel = REG11.uiModel
				if REG11.uiModelWithStand ~= nil then
					collectibleModel = REG11.uiModelWithStand
				end
				Engine.SendClientScriptNotify( controller, "collectible_update", "focus_change", collectibleSlot, collectibleModel )
			end
		end
	end
end

function PDV_SelectCollectibleSlot( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		local removedSlot = Engine.SetBunkCollectible( controller, collectibleSlot, CoD.perController[controller].placeCollectibleMapName, CoD.perController[controller].placeCollectibleName )
		if removedSlot ~= Enum.bunkCollectibleSlots_e.BUNK_INVALID_SLOT then
			Engine.SendClientScriptNotify( controller, "collectible_update", "unequip", removedSlot )
		end
		local mapData = CoD.mapsTable[CoD.perController[controller].placeCollectibleMapName]
		local collectibleList = Engine.GetAssetList( mapData.collectibles )
		for index, collectible in ipairs( collectibleList ) do
			if collectible.name == CoD.perController[controller].placeCollectibleName then
				local collectibleModel = REG12.uiModel
				if REG12.uiModelWithStand ~= nil then
					collectibleModel = REG12.uiModelWithStand
				end
				Engine.SendClientScriptNotify( controller, "collectible_update", "equip", collectibleSlot, collectibleModel )
			end
		end
	end
end

function MRV_SelectReplayMission( menu, element, controller )
	local selectedMissionModel = Engine.GetModel( menu:getModel(), "selectedMission" )
	if element == nil or element.mapId == nil or CoD.mapsTable[element.mapId] == nil then
		return 
	end
	local mapInfo = CoD.mapsTable[element.mapId]
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapName" ), mapInfo.mapName )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapNameCaps" ), mapInfo.mapNameCaps )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "previewImage" ), mapInfo.previewImage )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapLocation" ), mapInfo.mapLocation )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapDescription" ), mapInfo.mapDescription )
	local collectibleCount = 0
	local collectedCollectibleCount = 0
	if mapInfo.collectibles then
		local iteratedList = Engine.GetAssetList( mapInfo.collectibles )
		if iteratedList ~= nil then
			collectibleCount = #iteratedList
			for i = 0, collectibleCount - 1, 1 do
				if Engine.ClientHasCollectible( controller, element.mapId, i ) then
					collectedCollectibleCount = collectedCollectibleCount + 1
				end
			end
		end
	end
	local currentStats = Engine.GetPlayerStats( controller )
	local mapHighestStats = currentStats.PlayerStatsByMap[mapInfo.rootMapName].highestStats
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "collectiblesFound" ), collectedCollectibleCount )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "collectiblesTotal" ), collectibleCount )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "highestScore" ), mapHighestStats.HIGHEST_SCORE:get() )
	local completionDifficulty = mapHighestStats.HIGHEST_DIFFICULTY:get() - 1
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "completionDifficulty" ), completionDifficulty )
end

function MRV_ClickReplayMission( menu, element )
	if element == nil or element.mapId == nil or CoD.mapsTable[element.mapId] == nil then
		return 
	end
	local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
	if nextMapNameModel ~= nil then
		Engine.SetModelValue( nextMapNameModel, element.mapId )
	end
	menu.missionRecordVaultTabs.grid:setActiveIndex( 1, 2 )
end

function MRV_SelectAccolade( menu, element, controller )
	local elementModel = element:getModel()
	if element == nil or elementModel == nil then
		return 
	end
	local selectedAccoladeModel = Engine.GetModel( menu:getModel(), "selectedAccolade" )
	local detailsFields = {
		"challengeName",
		"challengeDetails",
		"challengeProgressQuantity",
		"rewardImage",
		"rewardName",
		"completed",
		"centerText",
		"challengeWidget"
	}
	for i = 1, #detailsFields, 1 do
		local elementValue = Engine.GetModel( elementModel, detailsFields[i] )
		if elementValue then
			elementValue = Engine.GetModelValue( elementValue )
		end
		if elementValue == nil then
			Engine.SetModelValue( Engine.GetModel( selectedAccoladeModel, detailsFields[i] ), "" )
		else
			Engine.SetModelValue( Engine.GetModel( selectedAccoladeModel, detailsFields[i] ), elementValue )
		end
	end
end

function ClearSavedHeroForEdits( controller )
	CoD.CCUtility.Heroes.HeroIndexForEdits = nil
end

function RefreshCharacterCustomization( self, element, controller )
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[controller].customizationMode )
end

function SelectGender( self, element, controller )
	if element.gender then
		Engine.SetGender( controller, element.gender )
		Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[controller].customizationMode )
	end
end

function SelectHead( self, element, controller )
	if element.headIndex then
		Engine.SetHead( controller, CoD.perController[controller].customizationMode, element.headIndex )
		Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[controller].customizationMode )
	end
end

function HeadHighlighted( menu, element, controller )
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHead", element.headIndex, CoD.perController[controller].customizationMode )
end

function CancelHeadSelection( menu, controller )
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHead", CoD.CCUtility.Heroes.selectedHead )
end

function SetDifficulty( self, element, controller )
	if element.difficulty then
		Engine.SetProfileVar( controller, "g_gameskill", element.difficulty )
		Engine.Exec( controller, "updategamerprofile" )
		local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( controller, "g_gameskill" )] ) )
		Engine.SendMenuResponse( controller, "difficulty", element.difficulty )
	end
end

function SetSelectedCPMission( self, element, controller )
	if element.mapId ~= nil then
		SetMap( controller, element.mapId )
		local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		local mapId = element.mapId
		local mapData = CoD.mapsTable[mapId]
		if Engine.GetCurrentMap() == "core_frontend" and mapData.safeHouse ~= nil and mapData.safeHouse ~= "" then
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "selectedMap" ), mapData.safeHouse )
			SetMap( controller, mapData.safeHouse )
			Engine.SetDvar( "nextMapFromFrontend", mapId )
		else
			if Engine.IsCampaignModeZombies() == true then
				mapId = string.gsub( element.mapId, "_nightmares", "" )
			end
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "selectedMap" ), mapId )
			SetMap( controller, mapId )
			Engine.SetDvar( "nextMapFromFrontend", mapId )
		end
	end
end

function SetFirstTimeSetupComplete( self, element, controller )
	Engine.SetFirstTimeComplete( controller, Enum.eModes.MODE_CAMPAIGN, true )
end

function LaunchSelectedCPMission( self, element, controller )
	local modeAbbr = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		modeAbbr = modeAbbr .. "2"
	end
	if modeAbbr == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	local cpLobbyModel = Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" )
	local cpLobby = Engine.GetModelValue( cpLobbyModel )
	local f410_local0 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local isPublic = false
	local menu = "LobbyOnlineCustomGame"
	if cpLobby == "public" then
		isPublic = true
		menu = "LobbyOnlinePublicGame"
	elseif cpLobby == "custom" then
		menu = "LobbyOnlineCustomGame"
	end
	menu = modeAbbr .. menu
	if IsElementPropertyValue( element, "classified", true ) then
		self:OpenModalDialog( controller, "MENU_OUTOFORDER_PLAY", "", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( modalResult )
			if modalResult == 0 then
				local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				currentStats.allMapsUnlocked:set( 1 )
				SetSelectedCPMission( self, element, controller )
				if not f410_local0 then
					if isPublic then
						Engine.SetPlaylistID( 201 )
					end
					NavigateToLobby( self, menu, false, controller )
				end
				GoBack( self, controller )
			end
			return true
		end )
	else
		SetSelectedCPMission( self, element, controller )
		if not f410_local0 then
			if isPublic then
				Engine.SetPlaylistID( 201 )
			end
			NavigateToLobby( self, menu, false, controller )
		end
		GoBack( self, controller )
	end
end

function SelectHero( self, element, controller )
	if CoD.CCUtility.Heroes.HeroIndexForEdits then
		local selectAlias = Engine.GetHeroSelectSoundAlias( CoD.perController[controller].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		if CoD.CCUtility.Heroes.lastHeroSelectAlias ~= nil and CoD.CCUtility.Heroes.lastHeroSelectAlias ~= selectAlias then
			Engine.StopSound( CoD.CCUtility.Heroes.lastHeroSelectAlias )
		end
		if selectAlias ~= "" then
			Engine.PlaySound( selectAlias )
			CoD.CCUtility.Heroes.lastHeroSelectAlias = selectAlias
		end
		Engine.SetHero( controller, CoD.perController[controller].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	element:dispatchEventToChildren( {
		name = "gamepad_button",
		down = true,
		button = "primary",
		isRepeated = false,
		controller = controller
	} )
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[controller].customizationMode )
	ClearSavedHeroForEdits( controller )
end

function SetEdittingHeroFromStats( controller )
	CoD.CCUtility.Heroes.HeroIndexForEdits = Engine.GetEquippedHero( controller, CoD.perController[controller].customizationMode )
end

local NotifyScriptCharacterLoadoutChange = function ( controller, newSlot )
	local frozenMoment = "weapon"
	if newSlot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		frozenMoment = "ability"
	end
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "changeFrozenMoment", frozenMoment )
end

function UpdateEditingHero( element, controller )
	if element.heroIndex then
		CoD.CCUtility.Heroes.HeroIndexForEdits = element.heroIndex
		Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHero", CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.perController[controller].customizationMode )
		NotifyScriptCharacterLoadoutChange( controller, Engine.GetLoadoutTypeForHero( controller, element.heroIndex ) )
	end
end

function HeroLoadoutPreviewChange( element, controller )
	if not element.disabled then
		NotifyScriptCharacterLoadoutChange( controller, element.equippedSlot )
	end
end

function HeroLoadoutChanged( self, element, controller )
	if not element.disabled then
		Engine.SetHeroLoadoutItem( controller, CoD.perController[controller].customizationMode, element.heroIndex, element.equippedSlot )
	end
end

function BeginEdittingHeroOption( menu, element, controller )
	if menu.updateMode then
		local colorDatasourceModel = element:getModel( controller, "colorListDatasource" )
		if colorDatasourceModel and Engine.GetModelValue( colorDatasourceModel ) ~= "" then
			menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingColor, nil, element )
		else
			menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption, nil, element )
		end
	end
end

function HeroItemHighlighted( element, controller )
	
end

function HeroOptionHighlighted( menu, element, controller )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local responseName = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBodyAccentColor"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmetAccentColor"
			end
			if responseName then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, element.optionIndex - 1, CoD.perController[controller].customizationMode )
			end
		else
			local responseName = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBody"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmet"
			end
			if responseName then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, element.optionIndex - 1, CoD.perController[controller].customizationMode )
			end
		end
	end
end

function HeroOptionSelected( menu, element, controller )
	if menu.updateMode then
		local listUpdateAndSelectCategory = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
			CoD.CopyModelValue( controller, element, "name", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "name" )
			CoD.CopyModelValue( controller, element, "image", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "image" )
			CoD.CopyModelValue( controller, element, "color", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "color" )
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local selectedBaseItem = nil
				if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedBody
				elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
				end
				Engine.SetHeroItem( controller, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, element.optionIndex - 1 )
			else
				listUpdateAndSelectCategory = CoD.CCUtility.PersonalizeHeroData.EdittingArea
				Engine.SetHeroItem( controller, CoD.perController[controller].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, element.optionIndex - 1 )
			end
		end
		menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = false
		} )
	end
end

function HeroColorsSelected( menu, element, controller )
	if menu.updateMode then
		local selectedBaseItem = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedBody
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
		end
		for index, colorIndex in pairs( CoD.CCUtility.PersonalizeHeroData.CurrentColors ) do
			Engine.SetHeroItem( controller, CoD.perController[controller].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem, index, colorIndex )
		end
		menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = true
		} )
	end
end

function HeroColorSectionHighlighted( menu, element, controller )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement and element.colorTableIndex then
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = element.colorTableIndex
		CoD.CCUtility.PersonalizeHeroData.CurrentColors[element.colorTableIndex - 1] = element.optionIndex - 1
		local baseCustomizationTable = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			baseCustomizationTable = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1].accents
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			baseCustomizationTable = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1].accents
		end
		if baseCustomizationTable then
			local colorItem = baseCustomizationTable[element.colorTableIndex][element.optionIndex]
			if colorItem and colorItem.name then
				local currentSelectionNameModel = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( controller, "currentSelectionName" )
				if currentSelectionNameModel then
					Engine.SetModelValue( currentSelectionNameModel, colorItem.name )
				end
			end
		end
		HeroOptionHighlighted( menu, element, controller )
	end
end

function CancelHeroOptionSelection( menu, controller )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local responseName, currentSelection = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBodyAccentColor"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmetAccentColor"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			end
			if responseName and currentSelection then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, currentSelection )
			end
		else
			local responseName, currentSelection = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBody"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.selectedBody
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmet"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
			end
			if responseName and currentSelection then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, currentSelection, CoD.perController[controller].customizationMode )
			end
		end
	end
	if menu.updateMode then
		menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
	end
end

function ListUpdateSelectionMode( self, element, expressionArg )
	self:updateMode( expressionArg, element )
end

function WC_SetChoosingCategory( self, element, controller )
	self:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_SetSelectingItem( self, element, controller )
	self:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_ITEM,
		element = element
	} )
end

function WC_SelectingCustomization( self, element, controller )
	self:dispatchEventToParent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
	CoD.perController[controller].weaponOption = element:getModel()
end

function WC_WeaponCustomizationGainFocus( self, element, controller )
	local baseWeaponSlot = CoD.perController[controller].weaponCategory
	local notetrack = element.xcamNotetrack
	Engine.SendClientScriptNotify( controller, "cam_customization_focus", baseWeaponSlot, notetrack )
end

function WC_WeaponOptionGainFocus( self, element, controller )
	local weaponOptionTypeNameModel = element:getModel( controller, "weaponOptionTypeName" )
	if weaponOptionTypeNameModel then
		local weaponOptionTypeName = Engine.GetModelValue( weaponOptionTypeNameModel )
		local itemIndexModel = element:getModel( controller, "itemIndex" )
		local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
			if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
			end
		end
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			Engine.SendClientScriptNotify( controller, "cam_customization_wo", weaponOptionTypeName, itemIndex )
		end
	end
end

function WC_VariantGainFocus( self, element, controller )
	Engine.SendClientScriptNotify( controller, "cam_customization_acv", element.attachmentRef, element.variantIndex )
end

function WC_VariantSelectionCancel( self, element, controller )
	local customCategory = CoD.WC_Category.ACV.selectedAttachment
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	if CoD.CACUtility.IsAttachmentRefWeaponOption( customCategory ) then
		if customCategory == CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] then
			local paintjobIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. "paintjobIndex.itemIndex" ) )
			local paintjobSlot = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. "paintjobSlot.itemIndex" ) )
			if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
			elseif paintjobSlot == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.ClearPaintjobLayerData()
			end
			Engine.SendClientScriptNotify( controller, "cam_customization_wo", customCategory, 1 )
		else
			local weaponOptionName = loadoutSlotName .. customCategory
			local woIndexModel = Engine.GetModel( classModel, weaponOptionName .. ".itemIndex" )
			if woIndexModel then
				local woIndex = Engine.GetModelValue( woIndexModel )
				Engine.SendClientScriptNotify( controller, "cam_customization_wo", customCategory, woIndex )
			end
		end
	else
		local attachmentSlotName = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, loadoutSlotName, customCategory )
		if attachmentSlotName then
			local acvIndexModel = Engine.GetModel( classModel, attachmentSlotName .. "cosmeticvariant.itemIndex" )
			if acvIndexModel then
				local acvIndex = Engine.GetModelValue( acvIndexModel )
				Engine.SendClientScriptNotify( controller, "cam_customization_acv", customCategory, acvIndex )
			end
		end
	end
end

function RedeemCode( self, element, controller )
	Engine.ShowRedeemCode( controller )
end

function ShowPsStoreIcon( controller )
	Engine.ShowPsStoreIcon()
end

function HidePsStoreIcon( controller )
	Engine.HidePsStoreIcon()
end

function PurchaseProduct( self, element, controller )
	local category = "BETA"
	if IsDurango() then
		local productIDModel = element:getModel( controller, "productID" )
		if productIDModel then
			local productID = Engine.GetModelValue( productIDModel )
			if Dvar.live_store_show_details:exists() and Dvar.live_store_show_details:get() then
				Engine.ShowProductDetailsByID( controller, category, productID )
			else
				Engine.PurchaseProductByID( controller, category, productID )
			end
		end
	elseif IsOrbis() then
		local skuIDModel = element:getModel( controller, "skuID" )
		local serviceLabelModel = element:getModel( controller, "serviceLabel" )
		if skuIDModel and serviceLabelModel then
			local skuID = Engine.GetModelValue( skuIDModel )
			local serviceLabel = Engine.GetModelValue( serviceLabelModel )
			Engine.PurchaseProductByID( controller, category, skuID, serviceLabel )
		end
	end
end

function RecordStoreOnItemGainFocus( self, element, controller, menu )
	element.onGainFocusTime = Engine.milliseconds()
end

function RecordStoreOnItemLoseFocus( self, element, controller, menu )
	local category = "BETA"
	local onFocusTime = element.onGainFocusTime
	local duration = 0
	local minimumDuration = Dvar.store_item_viewed_timer:get()
	if onFocusTime ~= nil then
		duration = Engine.milliseconds() - onFocusTime
	end
	if minimumDuration and duration < minimumDuration then
		return 
	end
	local productIDModel = element:getModel( controller, "productID" )
	if productIDModel then
		local productID = Engine.GetModelValue( productIDModel )
		LUI.CoDMetrics.StoreItemViewed( self, controller, productID, duration )
	end
end

function RecordStoreLastFocusedItemViewed( self, element, controller, menu )
	RecordStoreOnItemLoseFocus( self, element, controller, menu )
end

local EmblemEditor_HandleBackInBrowseMode = function ( self, element, controller, model )
	Engine.ExecNow( controller, "emblemEndEdit" )
	GoBack( self, controller )
	if IsPaintshop( controller ) then
		ForceNotifyModel( controller, "Paintshop.UpdateDataSource" )
	else
		ForceNotifyModel( controller, "Emblem.UpdateDataSource" )
	end
	CoD.perController[controller].selectEmblemGroupIndex = nil
	CoD.perController[controller].selectedLayerIndex = nil
	CoD.perController[controller].selectedLayerIconID = nil
	CoD.perController[controller].selectedLayerMaterialID = nil
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_NONE, "editorMode" )
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
end

function EmblemEditor_SetEditMode( controller )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT, "editorMode" )
end

local SetBrowseMode = function ( controller )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function EmblemEditor_LayerGainFocus( menu, self, element, controller )
	local layerIndexModel = element:getModel( controller, "layerIndex" )
	local layerNumberStringModel = element:getModel( controller, "layerNumberString" )
	local index = Engine.GetModelValue( layerIndexModel )
	CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
	CoD.Menu.SetButtonLabel( self, Enum.LUIButton.LUI_KEY_START, "" )
	local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, index )
	CoD.perController[controller].selectedLayerIndex = index
	CoD.perController[controller].selectedLayerIconID = selectedLayerIconID
	CoD.perController[controller].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( controller, index )
	local totalLayers = CoD.perController[controller].totalLayers
	local customizationType = CoD.GetCustomization( controller, "type" )
	local usedLayerCount = Engine.GetUsedLayerCount( controller, customizationType, totalLayers )
	local layersUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedLayerCount, totalLayers )
	CoD.SetEditorProperties( controller, layersUsedFraction, "layersUsedFraction" )
	CoD.SetEditorProperties( controller, usedLayerCount, "layersUsed" )
	Engine.ExecNow( controller, "emblemSelect " .. index .. " " .. customizationType )
	if CoD.IsLayerEmpty( controller, CoD.perController[controller].selectedLayerIndex ) == true then
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_CHOOSE_DECAL" )
	else
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_EDIT_LAYER" )
	end
	local linkedLayerCount = Engine.GetLinkedLayerCount( controller, customizationType )
	CoD.SetEditorProperties( controller, linkedLayerCount, "linkedLayerCount" )
	CoD.SetEditorProperties( controller, selectedLayerIconID, "selectedDecalID" )
	Engine.ForceNotifyModelSubscriptions( layerNumberStringModel )
end

function EmblemEditor_InsertDecalPressed( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemCopyLayer " .. CoD.perController[controller].selectedLayerIndex )
	Engine.ExecNow( controller, "emblemClearLayerByIndex " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
	CoD.SetEditorProperties( controller, CoD.emblem.ADDDECAL.INSERT, "addDecalMode" )
end

function EmblemEditor_SetEditLayerTitle( self, controller )
	local isPaintshop = IsPaintshop( controller )
	if isPaintshop then
		local editSideString = CoD.Paintshop.View[CoD.perController[controller].viewIndex].edit_side_ref
		self.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( editSideString ) )
	else
		self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDIT_LAYER_TITLE" ) )
	end
end

local EmblemEditor_SetScaleMode = function ( controller, scaleMode )
	CoD.SetEditorProperties( controller, scaleMode, "scaleMode" )
	Engine.ExecNow( controller, "emblemSetScaleMode " .. scaleMode )
end

local EmblemEditor_SetMaterialScaleMode = function ( controller, scaleMode )
	CoD.SetEditorProperties( controller, scaleMode, "materialScaleMode" )
	Engine.ExecNow( controller, "setMaterialScaleMode " .. scaleMode )
end

function EmblemEditor_EditSelectedLayer( self, element, controller )
	local selectedLayerIndex = CoD.perController[controller].selectedLayerIndex
	Engine.ExecNow( controller, "emblemCopyLayer " .. selectedLayerIndex )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	EmblemEditor_SetEditLayerTitle( self, controller )
	CoD.SwapFocusableElements( controller, self.layerCarousel, self.emblemDrawWidget )
	EmblemEditor_SetEditMode( controller )
	local color = Engine.GetSelectedLayerColor( controller )
	local color1 = Engine.GetSelectedLayerColor1( controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity0" ), math.floor( color.alpha * 100 ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity1" ), math.floor( color1.alpha * 100 ) )
	Engine.ExecNow( controller, "emblemBeginEdit" )
	CoD.perController[controller].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( controller, selectedLayerIndex )
	EmblemEditor_SetScaleMode( controller, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
	EmblemEditor_SetMaterialScaleMode( controller, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
end

local EmblemEditor_GetLayerAndGroupIndex = function ( widget, controller )
	local layerIndexModel = widget:getModel( controller, "layerIndex" )
	local layerIndex = Engine.GetModelValue( layerIndexModel )
	local groupIndexModel = widget:getModel( controller, "groupIndex" )
	local groupIndex = Engine.GetModelValue( groupIndexModel )
	return layerIndex .. " " .. groupIndex
end

local EmblemEditor_SetupDrawEmblem = function ( controller, item1Widget, item2Widget )
	local layerAndGroupIndex = EmblemEditor_GetLayerAndGroupIndex( item1Widget, controller )
	item1Widget.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( controller, layerAndGroupIndex ) )
	item2Widget.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( controller, EmblemEditor_GetLayerAndGroupIndex( item2Widget, controller ) ) )
end

local EmblemEditor_SetSelectedLayerIndex = function ( controller, layerWidget )
	local layerIndexModel = layerWidget:getModel( controller, "layerIndex" )
	if layerIndexModel then
		CoD.perController[controller].selectedLayerIndex = Engine.GetModelValue( layerIndexModel )
	end
end

function EmblemEditor_MoveLayer( self, element, controller, direction )
	local activeWidget = self.layerCarousel.activeWidget
	local layerIndexModel = activeWidget:getModel( controller, "layerIndex" )
	local layerIndex = Engine.GetModelValue( layerIndexModel )
	local customizationType = CoD.GetCustomization( controller, "type" )
	local layerAndGroupIndex = nil
	if activeWidget ~= nil then
		if direction == "left" then
			if layerIndex > 0 then
				Engine.ExecNow( controller, "emblemMoveLayerRelative -1 " .. customizationType )
				local previousItemWidget = self.layerCarousel:getItemAtPosition( 1, activeWidget.gridInfoTable.zeroBasedIndex, true )
				if previousItemWidget ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( controller, self.layerCarousel, previousItemWidget, activeWidget )
					EmblemEditor_SetupDrawEmblem( controller, activeWidget, previousItemWidget )
					self.layerCarousel:setActiveItem( previousItemWidget )
					EmblemEditor_SetSelectedLayerIndex( controller, previousItemWidget )
					activeWidget.arrows:setState( "DefaultState" )
					if layerIndex > 1 then
						previousItemWidget.arrows:setState( "LeftButtonPressed" )
					end
				end
			end
		elseif direction == "right" then
			local totalUsedLayers = Engine.GetUsedLayerCount( controller, customizationType, CoD.perController[controller].totalLayers )
			local groupLayerCountModel = activeWidget:getModel( controller, "groupLayerCount" )
			local groupLayerCount = Engine.GetModelValue( groupLayerCountModel )
			if layerIndex + groupLayerCount < totalUsedLayers then
				Engine.ExecNow( controller, "emblemMoveLayerRelative 1 " .. customizationType )
				local nextItemWidget = self.layerCarousel:getItemAtPosition( 1, activeWidget.gridInfoTable.zeroBasedIndex + 2, true )
				if nextItemWidget ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( controller, self.layerCarousel, activeWidget, nextItemWidget )
					EmblemEditor_SetupDrawEmblem( controller, activeWidget, nextItemWidget )
					self.layerCarousel:setActiveItem( nextItemWidget )
					EmblemEditor_SetSelectedLayerIndex( controller, nextItemWidget )
					activeWidget.arrows:setState( "DefaultState" )
					if layerIndex + 2 < totalUsedLayers then
						nextItemWidget.arrows:setState( "RightButtonPressed" )
					end
				end
			end
		end
	end
end

function EmblemEditor_CopyLayerToClipboard( self, element, controller )
	Engine.ExecNow( controller, "emblemCopyLayer " .. CoD.perController[controller].selectedLayerIndex )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	self.clipboard:setState( "Visible" )
end

function EmblemEditor_UpdateLayerData( self, controller )
	local layerIndexModel = self.layerCarousel.activeWidget:getModel( controller, "layerIndex" )
	local index = Engine.GetModelValue( layerIndexModel )
	self.layerCarousel:updateDataSource( true )
	local focusedWidget = self.layerCarousel:findItem( {
		layerIndex = index
	}, nil, false, false )
	if focusedWidget then
		self.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = controller,
			selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex,
			overrideScrollTime = 0
		} )
	end
end

function EmblemEditor_InsertLayer( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemInsertLayer " .. customizationType .. " " .. CoD.perController[controller].selectedLayerIndex )
end

function EmblemEditor_HandleBackInEditMode( self, element, controller )
	Engine.ExecNow( controller, "emblemEndEdit" )
	local isPaintshop = IsPaintshop( controller )
	if isPaintshop == true then
		local paintshopTitleString = Engine.Localize( "MENU_PAINTSHOP_CAPS" )
		self.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( paintshopTitleString )
	else
		self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	end
	SetBrowseMode( controller )
	CoD.SwapFocusableElements( controller, self.emblemDrawWidget, self.layerCarousel )
end

function EmblemEditor_SetupEditorBasedOnMode( self, element, controller )
	if IsEditMode( controller ) then
		local selectedWidget = self.layerCarousel:findItem( {
			layerIndex = CoD.perController[controller].selectedLayerIndex
		}, nil, true, 0 )
		EmblemEditor_EditSelectedLayer( self, selectedWidget, controller )
	else
		CoD.SwapFocusableElements( controller, self.emblemDrawWidget, self.layerCarousel )
	end
end

function EmblemEditor_FlipIcon( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleFlip" )
end

function EmblemEditor_ToggleOutline( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleOutline" )
end

function EmblemEditor_EndEdit( self, element, controller )
	Engine.ExecNow( controller, "emblemEndEdit" )
end

function EmblemEditor_BeginEdit( self, element, controller )
	Engine.ExecNow( controller, "emblemBeginEdit" )
end

function EmblemEditor_CutLayer( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemCutLayer " .. customizationType )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	self.clipboard:setState( "Visible" )
end

function EmblemEditor_OpenLayerOptionsPopup( self, element, controller )
	self:OpenModalDialog( controller, "MENU_TAB_OPTIONS", "", {
		"MENU_EMBLEM_RESET_LAYER"
	}, function ( modalResult )
		if modalResult == 0 then
			local customizationType = CoD.GetCustomization( controller, "type" )
			Engine.ExecNow( controller, "emblemRevertLayerChanges " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
			EmblemEditor_BeginEdit( self, element, controller )
			return true
		elseif modalResult == nil then
			EmblemEditor_BeginEdit( self, element, controller )
			return true
		else
			
		end
	end )
end

function EmblemEditor_HandleKeyboardComplete( self, element, controller, event )
	local selectedEmblemModel = element:getModel()
	local emblemTextEntryModel = nil
	if not selectedEmblemModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		emblemTextEntryModel = Engine.GetModel( selectedEmblemModel, "emblemTextEntry" )
	end
	if emblemTextEntryModel then
		Engine.SetModelValue( emblemTextEntryModel, event.input )
		local validEmblemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.validEmblemNameEntered" )
		Engine.SetModelValue( validEmblemNameModel, true )
	end
end

function EmblemEditor_SaveEmblem( self, element, controller )
	local selectedEmblemModel = self:getModel()
	local emblemTextEntry = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemTextEntry" ) )
	local emblemNameModel = Engine.GetModel( selectedEmblemModel, "emblemName" )
	Engine.SetModelValue( emblemNameModel, emblemTextEntry )
	CoD.CraftUtility.Emblems.UploadEmblem( controller, selectedEmblemModel )
	CoD.CraftUtility.Emblems.ParseDDL( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
	local emblemEditorMenu = GoBack( self, controller )
	EmblemEditor_HandleBackInBrowseMode( emblemEditorMenu, element, controller, selectedEmblemModel )
	ClearSavedState( emblemEditorMenu, controller )
end

function EmblemEditor_SaveEmblemAndApplyAsPlayercard( self, element, controller )
	Engine.ExecNow( controller, "emblemsetprofile" )
	EmblemEditor_SaveEmblem( self, element, controller )
end

function EmblemEditor_DiscardChanges( self, element, controller )
	local selectedEmblemModel = self:getModel()
	local emblemEditorMenu = GoBack( self, controller )
	EmblemEditor_HandleBackInBrowseMode( emblemEditorMenu, element, controller, selectedEmblemModel )
	ClearSavedState( emblemEditorMenu, controller )
end

function EmblemEditor_SaveChangesBack( self, element, controller )
	local selectedEmblemModel = self:getModel()
	if not Emblem_IsOccupied( self, controller ) then
		local emblemTextEntryModel = Engine.GetModel( selectedEmblemModel, "emblemTextEntry" )
		Engine.SetModelValue( emblemTextEntryModel, Engine.Localize( "MENU_ENTER_EMBLEM_NAME" ) )
		local validEmblemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.validEmblemNameEntered" )
		Engine.SetModelValue( validEmblemNameModel, false )
	end
end

function EmblemEditor_ToggleScaleMode( self, element, controller )
	local scaleMode = Engine.GetEmblemScaleMode( controller )
	if scaleMode == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( controller, scaleMode, "scaleMode" )
	Engine.ExecNow( controller, "emblemSetScaleMode " .. scaleMode )
end

function EmblemEditor_LinkUnlinkLayers( self, element, controller )
	local layerModel = element:getModel()
	local layerIndexModel = Engine.GetModel( layerModel, "layerIndex" )
	if layerIndexModel then
		local layerIndex = Engine.GetModelValue( layerIndexModel )
		local customizationType = CoD.GetCustomization( controller, "type" )
		local isLayerLinkedModel = Engine.GetModel( layerModel, "isLinked" )
		local groupIndexModel = Engine.GetModel( layerModel, "groupIndex" )
		if isLayerLinkedModel then
			local isLayerLinked = Engine.GetModelValue( isLayerLinkedModel )
			if isLayerLinked == true then
				Engine.ExecNow( controller, "unlinkLayers " .. customizationType )
				Engine.SetModelValue( isLayerLinkedModel, false )
			else
				Engine.ExecNow( controller, "linkLayers " .. customizationType )
				Engine.SetModelValue( isLayerLinkedModel, true )
			end
			local layerData = Engine.GetSelectedLayerData( controller, layerIndex, customizationType )
			Engine.SetModelValue( groupIndexModel, layerData.groupIndex )
			local linkedLayerCount = Engine.GetLinkedLayerCount( controller, customizationType )
			CoD.SetEditorProperties( controller, linkedLayerCount, "linkedLayerCount" )
		end
	end
end

function EmblemEditor_GroupUngroupLayers( self, element, controller )
	local layerModel = element:getModel()
	local layerIndexModel = Engine.GetModel( layerModel, "layerIndex" )
	if layerIndexModel then
		local layerIndex = Engine.GetModelValue( layerIndexModel )
		local customizationType = CoD.GetCustomization( controller, "type" )
		local isLayerLinkedModel = Engine.GetModel( layerModel, "isLinked" )
		local isGroupedModel = Engine.GetModel( layerModel, "isGrouped" )
		local groupIndexModel = Engine.GetModel( layerModel, "groupIndex" )
		if isLayerLinkedModel and isGroupedModel then
			local isLayerLinked = Engine.GetModelValue( isLayerLinkedModel )
			local isGrouped = Engine.GetModelValue( isGroupedModel )
			local layerData = Engine.GetSelectedLayerData( controller, layerIndex, customizationType )
			local linkedLayerCount = CoD.GetEditorProperties( controller, "linkedLayerCount" )
			if isLayerLinked == true then
				if isGrouped == true then
					Engine.ExecNow( controller, "ungroupLayers " .. customizationType )
					Engine.SetModelValue( isGroupedModel, false )
					Engine.SetModelValue( groupIndexModel, layerData.groupIndex )
					self.layerCarousel:updateDataSource()
				elseif linkedLayerCount >= 2 then
					Engine.ExecNow( controller, "groupLayers " .. customizationType )
					Engine.SetModelValue( isGroupedModel, true )
					Engine.SetModelValue( groupIndexModel, layerData.groupIndex )
					CoD.perController[controller].selectEmblemGroupIndex = layerData.groupIndex
					self.layerCarousel:updateDataSource()
					CoD.perController[controller].selectEmblemGroupIndex = nil
				end
			end
		end
		local linkedLayerCount = Engine.GetLinkedLayerCount( controller, customizationType )
		CoD.SetEditorProperties( controller, linkedLayerCount, "linkedLayerCount" )
	end
end

function EmblemEditor_SaveSelectedGroup( self, element, controller, event )
	
end

function EmblemChooseIcon_SelectionRejected( self, element, controller )
	local addDecalMode = CoD.GetEditorProperties( controller, "addDecalMode" )
	if CoD.perController[controller].selectedLayerIconID == CoD.emblem.INVALID_ID then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemClear " .. customizationType )
	elseif addDecalMode == CoD.emblem.ADDDECAL.INSERT then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemRevertLayerChanges " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
	else
		Engine.ExecNow( controller, "emblemSetSelectedLayerIconId " .. CoD.perController[controller].selectedLayerIconID )
	end
	CoD.SetEditorProperties( controller, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
	SetBrowseMode( controller )
end

function EmblemChooseIcon_SelectionAccepted( self, element, controller )
	local addDecalMode = CoD.GetEditorProperties( controller, "addDecalMode" )
	local totalLayers = CoD.perController[controller].totalLayers
	if addDecalMode == CoD.emblem.ADDDECAL.INSERT and CoD.perController[controller].selectedLayerIndex + 1 < totalLayers then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemInsertLayer " .. customizationType .. " " .. CoD.perController[controller].selectedLayerIndex + 1 )
	end
	CoD.SetEditorProperties( controller, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
end

function EmblemChooseIcon_SelectionChanged( self, element, controller )
	local iconIDModel = element:getModel( controller, "iconID" )
	local selectedIconID = Engine.GetModelValue( iconIDModel )
	Engine.ExecNow( controller, "emblemSetSelectedLayerIconId " .. selectedIconID )
	CoD.SetEditorProperties( controller, selectedIconID, "selectedDecalID" )
end

function EmblemChooseIcon_TabChanged( self, element, controller )
	CoD.perController[controller].selectedDecalCategory = element.tabCategory
	self.emblemIconList:updateDataSource()
end

function EmblemChooseMaterial_TabChanged( self, element, controller )
	CoD.perController[controller].selectedMaterialCategory = element.filter
	self.materialSwatch:updateDataSource()
end

function EmblemChooseMaterial_SelectionChanged( self, element, controller )
	local materialModel = element:getModel( controller, "materialID" )
	local materialID = Engine.GetModelValue( materialModel )
	Engine.ExecNow( controller, "emblemSetSelectedDecalMaterialId " .. materialID )
end

function EmblemChooseMaterial_UpdateMaterialAngleByStep( self, element, step, controller )
	Engine.ExecNow( controller, "emblemUpdateMaterialAngle " .. step )
end

function EmblemChooseMaterial_ToggleScaleMode( self, element, controller )
	local scaleMode = Engine.GetLayerMaterialScaleMode( controller )
	if scaleMode == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( controller, scaleMode, "materialScaleMode" )
	Engine.ExecNow( controller, "setMaterialScaleMode " .. scaleMode )
end

local EmblemChooseColor_SetupSelectedLayerColorModel = function ( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColorString = CoD.ConvertColor( selectedColor.red, selectedColor.green, selectedColor.blue )
	local selectedLayerColorModel = Engine.GetModel( perControllerModel, "Emblem.EmblemSelectedLayerColor" )
	local colorModel = Engine.GetModel( selectedLayerColorModel, "color" )
	Engine.SetModelValue( colorModel, selectedColorString )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColorModel, "red" ), selectedColor.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColorModel, "green" ), selectedColor.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColorModel, "blue" ), selectedColor.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	local selectedColor1 = Engine.GetSelectedLayerColor1( controller )
	local selectedColor1String = CoD.ConvertColor( selectedColor1.red, selectedColor1.green, selectedColor1.blue )
	local selectedLayerColor1Model = Engine.GetModel( perControllerModel, "Emblem.EmblemSelectedLayerColor1" )
	local color1Model = Engine.GetModel( selectedLayerColor1Model, "color" )
	Engine.SetModelValue( color1Model, selectedColor1String )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColor1Model, "red" ), selectedColor1.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColor1Model, "green" ), selectedColor1.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColor1Model, "blue" ), selectedColor1.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	CoD.SetNoColorDataModel( controller )
end

function EmblemChooseColor_ClearSelectedLayerMaterial( self, element, controller )
	Engine.ExecNow( controller, "emblemClearSelectedLayerMaterialId" )
end

function EmblemChooseColor_SelectionChanged( self, element, controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	local colorModel = element:getModel( controller, "color" )
	local colorValue = Engine.GetModelValue( colorModel )
	local normalizedColor = CoD.NormalizeColor( colorValue )
	if isGradientMode == 0 then
		Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
		Engine.ExecNow( controller, "emblemClearGradient" )
	elseif isGradientMode == 1 then
		if colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			if PropertyIsTrue( self, "isColor1NoColor" ) then
				Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			end
		elseif colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			if PropertyIsTrue( self, "isColor0NoColor" ) then
				Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			end
		end
	end
end

function EmblemChooseColor_SelectNoColor( self, element, controller )
	local selectedLayerNoColorModel = DataSources.EmblemSelectedLayerNoColor.getModel( controller )
	if selectedLayerNoColorModel ~= nil then
		local noColorValue = Engine.GetModelValue( Engine.GetModel( selectedLayerNoColorModel, "color" ) )
		local normalizedNoColor = CoD.NormalizeColor( noColorValue )
		self.opacity0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity0" ) ) / 100
		self.opacity1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity1" ) ) / 100
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. normalizedNoColor[1] .. " " .. normalizedNoColor[2] .. " " .. normalizedNoColor[3] )
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " -1.0" )
	end
end

function EmblemChooseColor_NoColorLoseFocus( self, element, controller )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	local lastSavedColorIsInFocus = self.lastSavedColor:isInFocus()
	if lastSavedColorIsInFocus then
		if not PropertyIsTrue( self, "isColor0NoColor" ) and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			if self.opacity0 ~= nil and self.opacity0 ~= 0 then
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " " .. self.opacity0 )
			else
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
			end
		elseif not PropertyIsTrue( self, "isColor1NoColor" ) and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			if self.opacity1 ~= nil and self.opacity1 ~= 0 then
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " " .. self.opacity1 )
			else
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
			end
		end
	end
end

local EmblemChooseColor_SetPointerPosition = function ( bar, value )
	local barWidth, barHeight = bar:getLocalSize()
	local pointerPosition = barWidth * value
	bar.pointer:setLeftRight( true, false, pointerPosition, pointerPosition + 2 )
end

local EmblemChooseColor_SetShaderParams = function ( controller, colorMixer )
	local selectedColor = CoD.GetSelectedColor( controller )
	if selectedColor ~= nil then
		colorMixer.redBar.bar:setShaderVector( 0, 0, selectedColor.green, selectedColor.blue, 1 )
		colorMixer.redBar.bar:setShaderVector( 1, 1, selectedColor.green, selectedColor.blue, 1 )
		EmblemChooseColor_SetPointerPosition( colorMixer.redBar, selectedColor.red )
		colorMixer.greenBar.bar:setShaderVector( 0, selectedColor.red, 0, selectedColor.blue, 1 )
		colorMixer.greenBar.bar:setShaderVector( 1, selectedColor.red, 1, selectedColor.blue, 1 )
		EmblemChooseColor_SetPointerPosition( colorMixer.greenBar, selectedColor.green )
		colorMixer.blueBar.bar:setShaderVector( 0, selectedColor.red, selectedColor.green, 0, 1 )
		colorMixer.blueBar.bar:setShaderVector( 1, selectedColor.red, selectedColor.green, 1, 1 )
		EmblemChooseColor_SetPointerPosition( colorMixer.blueBar, selectedColor.blue )
	end
end

local EmblemChooseColor_GetColorMixerElement = function ( self, controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	if isGradientMode == 0 then
		return self.colorMixerContainer.colorMixer
	else
		return self.colorGradientMixerContainer.colorMixer
	end
end

function EmblemChooseColor_ToggleColorMode( self, element, controller )
	local colorModeValue = CoD.GetEditorProperties( controller, "colorMode" )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	local selectedColor = CoD.GetSelectedColor( controller )
	if selectedColor ~= nil then
		EmblemChooseColor_SetShaderParams( controller, EmblemChooseColor_GetColorMixerElement( self, controller ), selectedColor )
	end
	if colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, isGradientMode )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	elseif colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		CoD.SetNoColorDataModel( controller )
		local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
		local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		if isColor0NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " 1 1 1" )
			Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
		elseif isColor1NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " 1 1 1" )
			Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( controller )
		self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, isGradientMode )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, "colorMode" )
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( controller )
end

local EmblemChooseColor_GetGradientSliderElement = function ( self, controller )
	return self.colorGradientContainer.gradientSlider
end

function EmblemChooseColor_ToggleGradientMode( self, element, controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	local colorModeValue = CoD.GetEditorProperties( controller, "colorMode" )
	self.colorGradientContainer:setState( "DefaultState" )
	if isGradientMode == 1 then
		CoD.SetEditorProperties( controller, 0, "isGradientMode" )
		CoD.SetNoColorDataModel( controller )
		local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
		if isColor0NoColor ~= nil and isColor0NoColor == 1 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " 1 1 1" )
			local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
			Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( controller )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE, "colorNum" )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 0 )
	elseif isGradientMode == 0 then
		CoD.SetEditorProperties( controller, 1, "isGradientMode" )
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " -1" )
		if colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, 1 )
		else
			self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 1 )
		end
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( controller )
	local gradientSlider = EmblemChooseColor_GetGradientSliderElement( self, controller )
	EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
end

local EmblemChooseColor_SetColorModelValue = function ( colorModel, step )
	local colorComponent = Engine.GetModelValue( colorModel )
	Engine.SetModelValue( colorModel, CoD.ClampColor( colorComponent + step, 0, 255 ) )
end

local EmblemChooseColor_SetLayerColor = function ( element, controller )
	local red = Engine.GetModelValue( element:getModel( controller, "red" ) )
	local green = Engine.GetModelValue( element:getModel( controller, "green" ) )
	local blue = Engine.GetModelValue( element:getModel( controller, "blue" ) )
	local normalizationFactor = 1 / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. red * normalizationFactor .. " " .. green * normalizationFactor .. " " .. blue * normalizationFactor )
end

local EmblemChooseColor_SetPreviewColorModel = function ( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local selectedColor = CoD.GetSelectedColor( controller )
	if selectedColor ~= nil then
		local selectedColorString = CoD.ConvertColor( selectedColor.red, selectedColor.green, selectedColor.blue )
		local selectedLayerEdittingColorModel = element:getModel( controller, "color" )
		Engine.SetModelValue( selectedLayerEdittingColorModel, selectedColorString )
	end
end

local EmblemChooseColor_SetBarProperties = function ( self, element, colorModel, controller )
	EmblemChooseColor_SetLayerColor( element, controller )
	EmblemChooseColor_SetPreviewColorModel( element, controller )
	EmblemChooseColor_SetShaderParams( controller, self )
end

function EmblemChooseColor_DecrementColorComponent( self, element, controller, colorName )
	local colorModel = element:getModel( controller, colorName )
	EmblemChooseColor_SetColorModelValue( colorModel, -1 )
	EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
end

function EmblemChooseColor_IncrementColorComponent( self, element, controller, colorName )
	local colorModel = element:getModel( controller, colorName )
	EmblemChooseColor_SetColorModelValue( colorModel, 1 )
	EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
end

function EmblemChooseColor_UpdateOpacityByStep( self, element, step, controller )
	local isSelectedColorEmpty = IsSelectedColorEmpty( element, controller )
	if not isSelectedColorEmpty then
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " " .. step )
		CoD.SetNoColorDataModel( controller )
		local gradientSlider = EmblemChooseColor_GetGradientSliderElement( self, controller )
		EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
	end
end

function EmblemChooseColor_UpdateBothColorOpacity( self, element, step, controller )
	local max_opacity = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.max_opacity" ) ) + step
	if max_opacity <= 100 then
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. step )
	end
end

function EmblemGradient_Color0GainFocus( self, element, controller )
	local colorMode = CoD.GetEditorProperties( controller, "colorMode" )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, "colorNum" )
	end
end

function EmblemGradient_Color1GainFocus( self, element, controller )
	local colorMode = CoD.GetEditorProperties( controller, "colorMode" )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, "colorNum" )
	end
end

function EmblemGradient_ColorGradientSliderGainFocus( self, element, controller )
	local colorMode = CoD.GetEditorProperties( controller, "colorMode" )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_GRADIENT, "colorNum" )
	end
end

local EmblemGradient_SetupSwatchLastSavedColor = function ( self, element, controller )
	local selectedLayerEdittingColorModel = DataSources.EmblemSelectedLayerEdittingColor.getModel( controller )
	self.colorGradientSwatchContainer:setModel( selectedLayerEdittingColorModel )
	self.colorGradientMixerContainer.colorMixer:setModel( selectedLayerEdittingColorModel )
end

function EmblemGradient_ShowSwatchContainer( self, element, controller )
	local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
	local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	if self.colorGradientContainer.gradientColor0:isInFocus() then
		self.colorGradientContainer:setState( "Color0State" )
	elseif self.colorGradientContainer.gradientColor1:isInFocus() then
		self.colorGradientContainer:setState( "Color1State" )
	end
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	EmblemGradient_SetupSwatchLastSavedColor( self, element, controller )
	CoD.SwapFocusableElements( controller, self.colorGradientContainer, self.colorGradientSwatchContainer )
	if isColor0NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		CoD.SwapFocusableElements( controller, self.colorGradientSwatchContainer.lastSavedColor, self.colorGradientSwatchContainer.noColor )
		self.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	elseif isColor1NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( controller, self.colorGradientSwatchContainer.lastSavedColor, self.colorGradientSwatchContainer.noColor )
		self.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	end
	self.colorGradientSwatchContainer:show()
end

function EmblemGradient_BackFromColorPicker( self, element, controller )
	EmblemChooseColor_SetupSelectedLayerColorModel( controller )
	if self.colorGradientSwatchContainer.m_focusable then
		CoD.SwapFocusableElements( controller, self.colorGradientSwatchContainer, self.colorGradientContainer )
		self.colorGradientContainer:show()
		self.colorGradientSwatchContainer:hide()
	elseif self.colorGradientMixerContainer.m_focusable then
		CoD.SwapFocusableElements( controller, self.colorGradientMixerContainer, self.colorGradientContainer )
		self.colorGradientContainer:show()
		self.colorGradientMixerContainer:hide()
	end
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	self.colorGradientContainer:setState( "DefaultState" )
	if colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( controller, self.colorGradientContainer.gradientColor0, self.colorGradientContainer.gradientColor1 )
		self.colorGradientContainer.gradientColor0.m_focusable = true
	end
	local gradientSlider = EmblemChooseColor_GetGradientSliderElement( self, controller )
	EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
end

function EmblemGradient_UpdateAngleByStep( self, element, angleStep, controller )
	Engine.ExecNow( controller, "emblemUpdateGradientAngle " .. angleStep )
end

function EmblemGradient_ToggleGradientType( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleGradientType" )
end

function EmblemGradient_UpdateGradientFillByStep( self, element, step, controller )
	Engine.ExecNow( controller, "emblemUpdateGradientFill " .. step )
	local gradient_fill = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.gradient_fill" ) )
	local normalized_gradient_fill = gradient_fill / CoD.emblem.MAX_GRADIENT_SLIDER_VALUE
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColor1 = Engine.GetSelectedLayerColor1( controller )
	EmblemChooseColor_SetPointerPosition( element, normalized_gradient_fill )
	if selectedColor ~= nil and selectedColor1 ~= nil then
		element.bar:setShaderVector( 0, selectedColor.red, selectedColor.green, selectedColor.blue, selectedColor.alpha )
		element.bar:setShaderVector( 1, selectedColor1.red, selectedColor1.green, selectedColor1.blue, selectedColor1.alpha )
		element.bar:setShaderVector( 2, normalized_gradient_fill, 0, 0, 0 )
	end
end

function EmblemGradient_BackFromGradientPicker( self, element, controller )
	local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
	local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
	if isColor0NoColor == 1 and isColor1NoColor == 1 then
		Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " 1 1 1" )
	end
end

function EmblemSelect_Back( self, element, controller )
	CoD.perController[controller].selectedEmblemModel = nil
	CoD.CraftUtility.Emblems.CachedEmblems = {}
end

function EmblemSelect_SetAsEmblem( self, element, controller )
	Engine.ExecNow( controller, "emblemsetprofile" )
end

function EmblemSelect_GainFocus( self, element, controller )
	CoD.perController[controller].selectedEmblemModel = element:getModel()
	local emblemIndexModel = element:getModel( controller, "emblemIndex" )
	local emblemIndex = Engine.GetModelValue( emblemIndexModel )
	Engine.SetupEmblemData( controller, emblemIndex )
end

function EmblemSelect_ChooseEmblem( self, element, controller )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( controller, customizationType, "type" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, 0 )
	local validEmblemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.validEmblemNameEntered" )
	if Emblem_IsOccupied( element, controller ) then
		Engine.SetModelValue( validEmblemNameModel, true )
	else
		Engine.SetModelValue( validEmblemNameModel, false )
	end
end

function EmblemSelect_RenameEmblem( self, element, controller )
	local emblemModel = self:getModel()
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemIndex" ) )
	local emblemName = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemName" ) )
	CoD.CraftUtility.Emblems.RenameEmblem( controller, emblemIndex, emblemName )
end

function EmblemSelect_HandleRenameKeyboardComplete( self, element, controller, event )
	local selectedEmblemModel = self:getModel()
	local emblemNameModel = nil
	if not selectedEmblemModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		emblemNameModel = Engine.GetModel( selectedEmblemModel, "emblemName" )
	end
	if emblemNameModel then
		Engine.SetModelValue( emblemNameModel, event.input )
	end
end

function EmblemSelect_ClearEmblem( self, element, controller )
	local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemIndex" ) )
	CoD.CraftUtility.Emblems.ClearEmblem( controller, emblemIndex )
	Engine.UploadEmblemData( controller, emblemIndex )
	CoD.CraftUtility.Emblems.ParseDDL( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
	ClearMenuSavedState( self )
	local baseMenu = GoBackMultiple( self, controller, 2 )
	baseMenu.emblemList:updateDataSource( true )
	local firstFocusable = baseMenu.emblemList:getFirstSelectableItem()
	baseMenu.emblemList:setActiveItem( firstFocusable )
end

function PaintshopWeaponList_TabChanged( self, element, controller )
	DataSources.Unlockables.setCurrentFilterItem( element.filter )
	self.weaponList:updateDataSource( true )
	local firstFocusable = self.weaponList:getFirstSelectableItem()
	self.weaponList:setActiveItem( firstFocusable )
	local category_index = self.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.SetCustomization( controller, category_index, "category_index" )
end

function PaintshopWeaponList_Back( self, element, controller )
	CoD.perController[controller].selectedpaintjobModel = nil
	CoD.perController[controller].paintshopWeaponListIndex = nil
	CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
end

function PaintshopWeaponList_GainFocus( self, element, controller )
	local weaponIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	local category_index = self.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.SetCustomization( controller, category_index, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( controller )
end

function PaintshopWeaponList_PressBackOnPaintjobsSelector( self, element, controller )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( controller )
	self:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST, element )
	local firstFocusable = self.paintjobSelector.paintjobsList:getFirstSelectableItem()
	self.paintjobSelector.paintjobsList:setActiveItem( firstFocusable )
end

function PaintshopWeaponList_ChooseWeapon( self, element, controller )
	self:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS, element )
	CoD.perController[controller].paintshopWeaponListIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	self.paintjobSelector.paintjobsList:updateDataSource( true )
	local firstFocusable = self.paintjobSelector.paintjobsList:getFirstSelectableItem()
	self.paintjobSelector.paintjobsList:setActiveItem( firstFocusable )
end

function FeaturedCardsActionButtonHandler( self, element, controller, param, menu )
	local menu = self:getParentMenu()
	local card = nil
	local action = ""
	if self.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget ~= nil then
		card = Engine.GetFeaturedCard( self.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget.gridInfoTable.zeroBasedIndex )
		action = string.lower( card.action )
	end
	if action == "openwelcome" then
		OpenOverlay( menu, "WelcomeMenu", controller )
	elseif action == "store" then
		OpenStore( self, element, controller, "FeaturedWidget", menu )
	elseif action == "opengroups" then
		OpenGroups( self, element, controller, param, menu )
	elseif action == "openCRM" then
		
	elseif action == "openmotd" then
		OpenMOTDPopup( self, element, controller, "FeaturedWidget", menu )
	end
end

function FeaturedCardsResetTimer( self, element, controller, param, menu )
	if self.LeftContainer.FEFeaturedCardsContainer.CarouselTimer ~= nil then
		self.LeftContainer.FEFeaturedCardsContainer.CarouselTimer:reset()
	end
end

function FeaturedCardsGetNextCard( self, element, controller, param, menu )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	local cardSequence = Engine.GetModelValue( Engine.GetModel( rootModel, "CardSequence" ) )
	Engine.SetModelValue( Engine.GetModel( rootModel, "CardSequence" ), cardSequence + 1 )
end

function FeaturedCardsGetPreviousCard( self, element, controller, param, menu )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	local cardSequence = Engine.GetModelValue( Engine.GetModel( rootModel, "CardSequence" ) )
	Engine.SetModelValue( Engine.GetModel( rootModel, "CardSequence" ), cardSequence - 1 )
end

function FeaturedCardsUpdateCRMMessage( self, element, controller, param, menu )
	Engine.UpdateFeaturedCardsCRMMessage( controller )
end

function OpenPopularShowcase( self, element, controller, param, menu )
	menu:openOverlay( "MyShowcase", controller )
end

function FileshareGetSlots( self, element, controller )
	Engine.FileshareStartup( controller )
end

function OpenMyShowcase( self, element, controller, param, menu )
	menu:openOverlay( "MyShowcase", controller )
end

function OpenShowcasePaintjobs( self, element, controller, param, menu )
	CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( true )
	menu:openOverlay( "MyShowcase_Paintjobs", controller )
end

function OpenShowcaseVariants( self, element, controller, param, menu )
	CoD.FileshareUtility.SetCurrentCategory( "variant" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( true )
	menu:openOverlay( "MyShowcase_Variants", controller )
end

function OpenShowcaseEmblems( self, element, controller, param, menu )
	CoD.FileshareUtility.SetCurrentCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( true )
	menu:openOverlay( "MyShowcase_Emblems", controller )
end

function OpenShowcaseManager( self, element, controller, param, menu )
	CoD.FileshareUtility.SetCurrentCategory( "" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( false )
	menu:openPopup( "Fileshare_ShowcaseManager", controller )
end

function FilesharePublishedTabChanged( self, element, controller )
	if element.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( element.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	if element.fileshareKey ~= nil and element.fileshareVal ~= nil then
		CoD.FileshareUtility.SetCurrentFilter( element.fileshareKey, element.fileshareVal )
	else
		CoD.FileshareUtility.SetCurrentFilter( "", "" )
	end
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareShowcaseManagerTabChanged( self, element, controller )
	if element.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( element.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareSetSelectedItem( self, element, controller )
	local elementModel = element:getModel()
	CoD.FileshareUtility.SetSelectedItem( elementModel )
end

function FileshareHandleKeyboardComplete( self, element, controller, event )
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		CoD.FileshareUtility.SetPublishName( event.input )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		CoD.FileshareUtility.SetPublishDescription( event.input )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS then
		CoD.FileshareUtility.SetPublishTags( event.input )
	end
end

function FileshareEnterPublishName( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME" )
end

function FileshareEnterPublishDescription( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION" )
end

function FileshareEnterPublishTags( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS" )
end

function FileshareResetPublishingModel( self, element, controller )
	CoD.FileshareUtility.ResetPublishingModel()
end

function FileshareToggleAllowDownload( self, element, controller )
	if CoD.FileshareUtility.GetPublishAllowDownload() then
		CoD.FileshareUtility.SetPublishAllowDownload( false )
	else
		CoD.FileshareUtility.SetPublishAllowDownload( true )
	end
end

function FileshareDeleteCurrentItem( self, element, controller, param, menu )
	CoD.FileshareUtility.Delete( self, element, controller, param, menu, true )
end

function FileshareDeleteDone( self, element, controller, param, menu )
	CoD.FileshareUtility.DeleteDone( self, element, controller, param, menu )
end

function PaintjobSelector_UpdateSlotCount( self, element, controller )
	local totalUsedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
	local totalAllowedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
	return element:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", totalUsedPaintjobs, totalAllowedPaintjobs ) )
end

function PaintjobSelector_GainFocus( self, element, controller )
	CoD.perController[controller].selectedpaintjobModel = element:getModel()
	CoD.perController[controller].viewIndex = 1
	local customizationType = CoD.Paintshop.View[CoD.perController[controller].viewIndex].customization_type
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
	Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( controller, paintjobIndex, paintjobSlot )
end

function PaintjobSelector_ChoosePaintjob( self, element, controller )
	CoD.perController[controller].viewIndex = 1
	local view_name = CoD.Paintshop.View[CoD.perController[controller].viewIndex].view_name
	local customizationType = CoD.Paintshop.View[CoD.perController[controller].viewIndex].customization_type
	local customizationStringRef = CoD.Paintshop.View[CoD.perController[controller].viewIndex].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, weaponIndex )
	local validPaintjobNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.validPaintjobNameEntered" )
	if Paintjobs_IsOccupied( element, controller ) then
		Engine.SetModelValue( validPaintjobNameModel, true )
	else
		Engine.SetModelValue( validPaintjobNameModel, false )
	end
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, view_name )
	Engine.SendMenuResponse( controller, "paintshop_light", "far" )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function FilesharePublish( self, element, controller )
	CoD.FileshareUtility.Publish( controller )
end

function SteamWorkshopPublish( self, element, controller )
	CoD.SteamWorkshopUtility.Publish( self, element, controller )
end

function SteamWorkshopOpenAgreement( self, element, controller )
	CoD.SteamWorkshopUtility.OpenAgreement( self, element, controller )
end

function SteamWorkshopOpenFAQ( self, element, controller )
	CoD.SteamWorkshopUtility.OpenFAQ( self, element, controller )
end

function SteamWorkshopOpenItem( self, element, controller )
	CoD.SteamWorkshopUtility.OpenItemOnSteam( self, element, controller )
end

function SteamWorkshopViewWorkshop( self, element, controller )
	CoD.SteamWorkshopUtility.ViewWorkshop( self, element, controller )
end

function PaintjobSelector_ClearPaintjob( self, element, controller )
	local paintjobModel = self:getModel()
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	CoD.CraftUtility.Paintjobs.ClearPaintjob( controller, paintjobSlot, paintjobIndex )
	CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	ClearMenuSavedState( self )
	local baseMenu = GoBackMultiple( self, controller, 2 )
	baseMenu.paintjobSelector.paintjobsList:updateDataSource( true )
	local firstFocusable = baseMenu.paintjobSelector.paintjobsList:getFirstSelectableItem()
	baseMenu.paintjobSelector.paintjobsList:setActiveItem( firstFocusable )
	ForceNotifyModel( controller, "Paintshop.UpdateDataSource" )
end

function PaintjobSelector_RenamePaintjob( self, element, controller )
	local paintjobModel = self:getModel()
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	local paintjobName = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobName" ) )
	CoD.CraftUtility.Paintjobs.RenamePaintjob( controller, paintjobSlot, paintjobIndex, paintjobName )
end

function PaintjobSelector_HandleRenameKeyboardComplete( self, element, controller, event )
	local selectedPaintjobModel = self:getModel()
	local paintjobNameModel = nil
	if not selectedPaintjobModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		paintjobNameModel = Engine.GetModel( selectedPaintjobModel, "paintjobName" )
	end
	if paintjobNameModel then
		Engine.SetModelValue( paintjobNameModel, event.input )
	end
end

function PaintjobEditor_ChangeViewRightBumper( self, element, controller )
	local view_index = CoD.CraftUtility.Paintjobs.GetNextViewIndex( controller )
	CoD.perController[controller].viewIndex = view_index
	local view_name = CoD.Paintshop.View[view_index].view_name
	local customizationType = CoD.Paintshop.View[view_index].customization_type
	local customizationStringRef = CoD.Paintshop.View[view_index].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, weaponIndex )
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, view_name )
	self.layerCarousel:updateDataSource()
end

function PaintjobEditor_ChangeViewLeftBumper( self, element, controller )
	local view_index = CoD.CraftUtility.Paintjobs.GetPrevViewIndex( controller )
	CoD.perController[controller].viewIndex = view_index
	local view_name = CoD.Paintshop.View[view_index].view_name
	local customizationType = CoD.Paintshop.View[view_index].customization_type
	local customizationStringRef = CoD.Paintshop.View[view_index].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, weaponIndex )
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, view_name )
	self.layerCarousel:updateDataSource()
end

function PaintjobEditor_HandleKeyboardComplete( self, element, controller, event )
	local selectedpaintjobModel = element:getModel()
	local paintjobTextEntryModel = nil
	if not selectedpaintjobModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		paintjobTextEntryModel = Engine.GetModel( selectedpaintjobModel, "paintjobTextEntry" )
	end
	if paintjobTextEntryModel then
		Engine.SetModelValue( paintjobTextEntryModel, event.input )
		local validPaintjobNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.validPaintjobNameEntered" )
		Engine.SetModelValue( validPaintjobNameModel, true )
	end
end

local PaintJobEditor_RecordComScoreEvent = function ( self, controller, model, operation )
	local duration = 0
	if self.occludedMenu and self.occludedMenu.openTime then
		duration = Engine.milliseconds() - self.occludedMenu.openTime
	end
	local paintjobNameModel = Engine.GetModel( model, "paintjobName" )
	local paintjobName = Engine.GetModelValue( paintjobNameModel )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( model, "weaponIndex" ) )
	local assets_used = nil
	LUI.CoDMetrics.PaintshopEvent( controller, operation, duration, weaponIndex, paintjobName, assets_used )
end

function PaintjobEditor_SavePaintjob( self, element, controller )
	local selectedPaintjobModel = self:getModel()
	local paintjobTextEntry = Engine.GetModelValue( Engine.GetModel( selectedPaintjobModel, "paintjobTextEntry" ) )
	local paintjobNameModel = Engine.GetModel( selectedPaintjobModel, "paintjobName" )
	Engine.SetModelValue( paintjobNameModel, paintjobTextEntry )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.CraftUtility.Paintjobs.UploadPaintjob( controller, selectedPaintjobModel )
	CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	PaintJobEditor_RecordComScoreEvent( self, controller, selectedPaintjobModel, "save" )
	local paintshopMenu = GoBack( self, controller )
	EmblemEditor_HandleBackInBrowseMode( paintshopMenu, element, controller, selectedPaintjobModel )
	ClearSavedState( paintshopMenu, controller )
end

function PaintjobEditor_DiscardChanges( self, element, controller )
	local selectedPaintjobModel = self:getModel()
	local paintshopMenu = GoBack( self, controller )
	PaintJobEditor_RecordComScoreEvent( self, controller, selectedPaintjobModel, "discard" )
	EmblemEditor_HandleBackInBrowseMode( paintshopMenu, element, controller, selectedPaintjobModel )
	ClearSavedState( paintshopMenu, controller )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
end

function PaintjobEditor_SaveChangesBack( self, element, controller )
	local selectedPaintjobModel = self:getModel()
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( selectedPaintjobModel, "weaponIndex" ) )
	if weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		local paintjobTextEntryModel = Engine.GetModel( selectedPaintjobModel, "paintjobTextEntry" )
		Engine.SetModelValue( paintjobTextEntryModel, Engine.Localize( "MENU_ENTER_PAINTJOB_NAME" ) )
		local validPaintjobNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.validPaintjobNameEntered" )
		Engine.SetModelValue( validPaintjobNameModel, false )
	end
end

function SetSocialTab( self, element, controller )
	local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local tabModel = Engine.GetModel( socialRootModel, "tab" )
	Engine.SetModelValue( tabModel, element.tabId )
end

function FetchOnlineFriendsData( self, element, controller )
	if "friends" == element.tabId then
		Engine.UpdateFriends( controller, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
	end
end

function OpenPlatformProfile( self, element, controller, params, menu )
	Engine.ShowPlatformProfile( params.controller, params.xuid, params.gamertag )
end

function SocialJoin( self, element, controller, params, menu )
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid ) then
			CoD.QuitGame( controller )
			Engine.LobbyVM_CallFunc( "InGameJoin", params )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", params )
	end
	local previousMenu = GoBack( self, controller )
	GoBackToMenu( previousMenu, controller, "Lobby" )
end

function CacheSocialOnlinePlayersListModels( self, element, controller )
	local socialRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	local tabModel = Engine.CreateModel( socialRootModel, "tab" )
	local lastSelected = Engine.GetModelValue( tabModel )
	if lastSelected == "party" then
		return 
	end
	local cacheXuid, cacheGametype, cacheMapid, cachePlaylist, cacheDifficulty, cacheParty, cachePartyUpdate, cachePartyTotal, cachePartyAvailable, cachePartyLeader, cachePartyGamertags = nil
	if self.cacheRootModel ~= nil then
		cacheGametype = self.cacheGametype
		cacheXuid = self.cacheXuid
		cacheMapid = self.cacheMapid
		cacheDifficulty = self.cacheDifficulty
		cachePlaylist = self.cachePlaylist
		cacheParty = self.cacheParty
		cachePartyUpdate = self.cachePartyUpdate
		cachePartyGamertags = self.cachePartyGamertags
		cachePartyTotal = self.cachePartyTotal
		cachePartyAvailable = self.cachePartyAvailable
		cachePartyLeader = self.cachePartyLeader
	else
		local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local cacheModel = Engine.CreateModel( socialRootModel, "cache" )
		cacheXuid = Engine.CreateModel( cacheModel, "xuid" )
		cacheGametype = Engine.CreateModel( cacheModel, "gametype" )
		cacheMapid = Engine.CreateModel( cacheModel, "mapid" )
		cacheDifficulty = Engine.CreateModel( cacheModel, "difficulty" )
		cachePlaylist = Engine.CreateModel( cacheModel, "playlist" )
		cacheParty = Engine.CreateModel( socialRootModel, "party" )
		cachePartyUpdate = Engine.CreateModel( cacheParty, "update" )
		cachePartyTotal = Engine.CreateModel( cacheParty, "total" )
		cachePartyAvailable = Engine.CreateModel( cacheParty, "avalaible" )
		cachePartyLeader = Engine.CreateModel( cacheParty, "leader" )
		Engine.SetModelValue( cacheXuid, Engine.StringToXUIDDecimal( "0" ) )
		cachePartyGamertags = {}
		for i = 1, 18, 1 do
			local pm = Engine.CreateModel( self.cacheParty, "pm_" .. i )
			cachePartyGamertags[i] = Engine.CreateModel( pm, "gamertag" )
			Engine.SetModelValue( cachePartyGamertags[i], "" )
		end
	end
	Engine.SetModelValue( cacheXuid, element.xuid )
	Engine.SetModelValue( cacheGametype, element.gametype )
	Engine.SetModelValue( cacheMapid, element.mapid )
	Engine.SetModelValue( cachePlaylist, element.playlist )
	Engine.SetModelValue( cacheDifficulty, element.difficulty )
	Engine.SetModelValue( cachePartyTotal, element.party.total )
	Engine.SetModelValue( cachePartyAvailable, element.party.available )
	Engine.SetModelValue( cachePartyLeader, element.party.leader )
	if element.party ~= nil and element.party.members ~= nil then
		for i = 1, #cachePartyGamertags, 1 do
			local model = cachePartyGamertags[i]
			if element.party.members[i] ~= nil then
				Engine.SetModelValue( model, element.party.members[i].gamertag )
			end
		end
		local update = Engine.GetModelValue( cachePartyUpdate )
		if update < 100000 then
			update = update + 1
		else
			update = 0
		end
		Engine.SetModelValue( cachePartyUpdate, update )
	end
end

function RefreshSocialPlayerParty( self, controller )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.party.update" )
	local update = Engine.GetModelValue( cachePartyUpdate )
	if update < 100000 then
		update = update + 1
	else
		update = 0
	end
	Engine.SetModelValue( cachePartyUpdate, update )
end

function SetSelectedFriendXUID( self, element, controller )
	local xuid = nil
	if element ~= nil then
		local xuidModel = element:getModel( controller, "xuid" )
		if xuidModel ~= nil then
			xuid = Engine.GetModelValue( xuidModel )
			local controllerModel = Engine.GetModelForController( controller )
			local selectedFriendModel = Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" )
			Engine.SetModelValue( selectedFriendModel, xuid )
			local gamertagModel = element:getModel( controller, "gamertag" )
			local selectedFriendGamertagModel = Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" )
			Engine.SetModelValue( selectedFriendGamertagModel, Engine.GetModelValue( gamertagModel ) )
			local activityModel = element:getModel( controller, "activity" )
			local activity = Engine.GetModelValue( activityModel )
			local selectedFriendInTitleModel = Engine.CreateModel( controllerModel, "Social.selectedFriendInTitle" )
			Engine.SetModelValue( selectedFriendInTitleModel, activity > Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE )
		end
	end
end

function OpenSocialPlayerPopup( self, element, controller )
	local popup = OpenPopup( self, "Social_PlayerDetailsPopup", controller )
	popup.playerInfo:setModel( element:getModel() )
end

function SocialToggleSorting( self, element, controller )
	local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local sortModel = Engine.GetModel( socialRootModel, "sort" )
	local sortValue = Engine.GetModelValue( sortModel )
	if sortValue == Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT then
		Engine.SetModelValue( sortModel, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
		Engine.SortFriends( controller, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
	elseif sortValue == Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL then
		Engine.SetModelValue( sortModel, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
		Engine.SortFriends( controller, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
	end
end

function UpdateFriends( self, element, controller )
	local menu = self
	Engine.UpdateFriends( controller, 2 )
end

function SetFriendsTabName( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local friendsModel = Engine.GetModel( perControllerModel, "friends" )
	local tabModel = Engine.GetModel( friendsModel, "tab" )
	Engine.SetModelValue( tabModel, element.tabId )
end

function UpdateFriendsData( self, element, controller )
	if "friends" == element.tabId then
		Engine.UpdateFriends( controller, 2 )
	elseif element.tabId == "inbox" then
		Engine.UpdateMessages( controller, 1 )
	end
end

function FriendsInboxOnMessageClick( self, element, controller )
	local xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
	if xuid ~= nil then
		Engine.ReadMessages( controller, 0 )
	end
end

function GetProcessingGroupTaskModel( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local processingGroupTaskModel = Engine.CreateModel( groupsModel, "processingTask" )
	return processingGroupTaskModel
end

function GroupNotifyPopupButtonAction( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local error = Engine.GetModelValue( Engine.CreateModel( groupsModel, "notificationError" ) )
	local isProcessing = IsProcessingGroupTask( controller )
	if isProcessing then
		return 
	elseif not error then
		if self.onSuccessAction then
			self:onSuccessAction( element, controller )
		end
		local menu = self.occludedMenu
		if menu and menu.menuName ~= "Groups" then
			GoBack( menu, controller )
		end
	end
	GoBack( self, controller )
end

local SetGroupsNotifyInformation = function ( controller, title, message, isError )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationTitle" ), title )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationMessage" ), message )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationError" ), isError )
end

function OpenGroupsNotifyPopup( self, element, controller, isProcessing, eventHandlerName, onSuccessAction )
	local menu = OpenGenericSmallPopup( self, controller, "$(groups.notificationTitle)", "$(groups.notificationMessage)", "MENU_OK", GroupNotifyPopupButtonAction )
	local event = {
		controller = controller
	}
	menu.customGoBackAction = function ( self, controller )
		GroupNotifyPopupButtonAction( self, nil, controller )
	end
	
	menu.onSuccessAction = onSuccessAction
	if isProcessing then
		menu:setState( "Processing" )
		menu:registerEventHandler( eventHandlerName, function ( dialog, waitingEvent )
			menu:setState( "DefaultState" )
			local taskModel = GetProcessingGroupTaskModel( controller )
			Engine.SetModelValue( taskModel, false )
		end )
	else
		menu:setState( "DefaultState" )
	end
end

function ProcessLeaveSelectedGroup( self, element, controller )
	element.gridInfoTable.parentGrid.menu:OpenModalDialog( self, controller, "GROUPS_LEAVE_SELECTED_GROUP_TITLE", "", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			local groupId = Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" ) )
			Engine.LeaveGroup( controller, groupId )
			OpenGroupsNotifyPopup( self, element, controller, true, "leave_group_task_complete", function ( self, element, controller )
				ClearSelectedGroup( self, element, controller )
			end )
		end
	end )
end

function ProcessJoinSelectedGroup( self, element, controller )
	local menu = self:getParentMenu()
	menu:OpenModalDialog( self, controller, "GROUPS_JOIN_SELECTED_GROUP_TITLE", "", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( modalResult )
		if modalResult == 0 then
			local groupBufferType = Engine.GetModelValue( element:getModel( controller, "groupBufferType" ) )
			local groupId = Engine.GetModelValue( element:getModel( controller, "groupId" ) )
			Engine.JoinGroup( controller, groupBufferType, groupId )
			OpenGroupsNotifyPopup( self, element, controller, true, "join_group_task_complete" )
			return true
		else
			
		end
	end )
end

function HandleGroupHeadquartersKeyboardComplete( self, element, controller, event )
	local selectedGroupModel = CoD.perController[controller].selectedGroup
	local model = nil
	if not selectedGroupModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_NAME then
		model = Engine.GetModel( selectedGroupModel, "name" )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_MESSAGE then
		model = Engine.GetModel( selectedGroupModel, "message" )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_DESCRIPTION then
		model = Engine.GetModel( selectedGroupModel, "description" )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_CLAN_TAG then
		model = Engine.GetModel( selectedGroupModel, "clanTag" )
	end
	if model then
		Engine.SetModelValue( model, event.input )
	end
end

function EditSelectedGroupName( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_NAME" )
end

function EditSelectedGroupMessage( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_MESSAGE" )
end

function EditSelectedGroupDescription( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
end

function EditSelectedGroupClanTag( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_CLAN_TAG" )
end

function EditSelectedGroupEmblem( self, element, controller )
	local menu = self:getParentMenu()
	menu:OpenModalDialog( self, controller, "GROUPS_SET_GROUP_EMBLEM_TITLE", "GROUPS_SET_GROUP_EMBLEM_DESC", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			Engine.SetGroupEmblem( controller )
			return true
		else
			
		end
	end )
end

function OpenGroupHeadquarters( self, element, controller )
	local isNotAMember = IsNotAGroupMember( element, controller )
	if isNotAMember then
		ProcessJoinSelectedGroup( self, element, controller )
	else
		CoD.perController[controller].selectedGroup = element.model
		local groupId = Engine.GetModelValue( Engine.GetModel( element.model, "groupId" ) )
		local groupBufferType = Engine.GetModelValue( Engine.GetModel( element.model, "groupBufferType" ) )
		Engine.SetSelectedGroup( controller, groupBufferType, groupId )
		local menu = self:getParentMenu()
		NavigateToMenu( menu, "GroupHeadquarters", true, controller )
		local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
		if leaderboardIndex ~= nil and leaderboardIndex > 0 then
			local leaderboardDefName = CoD.Leaderboard_MP.GetLeaderboardDefName( leaderboardIndex, sortColumn, isHardcore )
			Engine.LoadLeaderboard( leaderboardDefName, timeFrame )
			Engine.RequestLeaderboardData( controller, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		else
			local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
			local sortColumn = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, "SCORE" )
			local leaderboardDefName = CoD.Leaderboard_MP.GetLeaderboardDefName( leaderboardIndex, sortColumn, false )
			Engine.LoadLeaderboard( leaderboardDefName, Enum.LbTrackType.LB_TRK_ALLTIME )
			Engine.RequestLeaderboardData( controller, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		end
	end
end

function ClearSelectedGroup( self, element, controller )
	CoD.perController[controller].selectedGroup = nil
	Engine.ClearSelectedGroup()
end

function SetGroupHeadquarterTabName( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupHqTabName = Engine.CreateModel( groupsModel, "grouphqtabname" )
	Engine.SetModelValue( groupHqTabName, element.tabId )
end

function SearchGroups( self, element, controller )
	Engine.FindGroups( controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
end

function InitializeGroups( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	Engine.CreateModel( groupsModel, "processingTask" )
	Engine.CreateModel( groupsModel, "grouphqtabname" )
	Engine.CreateModel( groupsModel, "createGroup" )
	local leaderboardMakerModel = Engine.CreateModel( groupsModel, "leaderboardmaker" )
	Engine.CreateModel( leaderboardMakerModel, "startingState" )
	Engine.CreateModel( leaderboardMakerModel, "state" )
	Engine.CreateModel( leaderboardMakerModel, "lbIndex" )
	Engine.CreateModel( leaderboardMakerModel, "lbSortColumn" )
	Engine.CreateModel( leaderboardMakerModel, "lbTimeFrame" )
	Engine.CreateModel( groupsModel, "notificationTitle" )
	Engine.CreateModel( groupsModel, "notificationMessage" )
	Engine.CreateModel( groupsModel, "notificationError" )
end

function OpenCreateGroupMenu( self, element, controller )
	local menu = self:getParentMenu()
	NavigateToMenu( menu, "CreateGroup", true, controller )
end

function InitializeCreateGroup( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local createGroupModel = Engine.GetModel( perControllerModel, "groups.createGroup" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "name" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "default_name" ), Engine.Localize( "GROUPS_DEFAULT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "privacy" ), "GROUPS_PRIVACY_PUBLIC" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "default_description" ), Engine.Localize( "GROUPS_DEFAULT_DESCRIPTION" ) )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "emblem" ), "uie_t7_medal_baked" )
	Engine.ExecNow( controller, "emblemgetprofile" )
end

function CreateNewGroupFlow( self, element, controller )
	InitializeCreateGroup( self, element, controller )
	OpenCreateGroupMenu( self, element, controller )
end

local ValidateCreateGroupInformation = function ( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local name = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.name" ) )
	local description = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.description" ) )
	if name == "" then
		OpenGenericSmallPopup( self, controller, "GROUPS_MISSING_GROUP_NAME_TITLE", "GROUPS_MISSING_GROUP_NAME_TEXT", "MENU_OK" )
		return false
	else
		return true
	end
end

function ProcessCreateGroup( self, element, controller )
	if ValidateCreateGroupInformation( self, element, controller ) then
		local perControllerModel = Engine.GetModelForController( controller )
		local name = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.name" ) )
		Engine.CreateGroup( controller, name )
		OpenGroupsNotifyPopup( self, element, controller, true, "create_group_task_complete" )
	end
end

function SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
	local selectedGroupModel = CoD.perController[controller].selectedGroup
	if not selectedGroupModel then
		return 
	else
		Engine.SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbIndex" ), leaderboardIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbSortColumn" ), sortColumnIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbTimeFrame" ), timeFrameIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbHardcore" ), hardcore )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbInitialized" ), true )
	end
end

function SetDefaultCareerLeaderboard( self, element, controller )
	local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
	local sortColumnIndex = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, "SPM" )
	local timeFrameIndex = Enum.LbTrackType.LB_TRK_ALLTIME
	local hardcore = false
	SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
	DataSources.LeaderboardHeader.getModel( controller )
	if self.UpdateNavigation then
		self:UpdateNavigation( controller )
	end
end

function OpenLeaderboardMaker( self, element, controller, startingState )
	if startingState == nil then
		error( "OpenLeaderboardMaker(): Invalid starting state specified" )
		return 
	else
		local perControllerModel = Engine.GetModelForController( controller )
		Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.startingState" ), startingState )
		Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), startingState )
		local menu = self:getParentMenu()
		menu:openPopup( "LeaderboardMaker", controller )
	end
end

function ProcessRemoveGroupLeaderboard( self, element, controller )
	self:OpenModalDialog( element, "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_TITLE", "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_SUBTITLE", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			SetGroupLeaderboardInfo( controller, 0, 0, 0, false )
			GoBack( self, controller )
			return true
		else
			
		end
	end )
end

function ProcessLeaderboardMakerBack( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local startingState = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.startingState" ) )
	local stateModel = Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" )
	local state = Engine.GetModelValue( stateModel )
	if state == startingState or state == "SelectAction" then
		Engine.SetModelValue( stateModel, "" )
		GoBack( self, controller )
	elseif state == "ChooseBaseLeaderboard" then
		Engine.SetModelValue( stateModel, "SelectAction" )
	elseif state == "ChooseDefaultSort" then
		Engine.SetModelValue( stateModel, "ChooseBaseLeaderboard" )
	elseif state == "ChooseTimeFrame" then
		Engine.SetModelValue( stateModel, "ChooseDefaultSort" )
	end
end

function ProcessEditGroupLeaderboard( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseBaseLeaderboard" )
end

function ProcessChooseBaseLeaderboard( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( element.btnId )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ), leaderboardIndex )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseDefaultSort" )
end

function ProcessChooseDefaultSort( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ) )
	local sortColumnIndex = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, element.btnId )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbSortColumn" ), sortColumnIndex )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseTimeFrame" )
end

function ProcessChooseTimeFrame( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ) )
	local sortColumnIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbSortColumn" ) )
	local isHardcore = false
	local timeFrameData = CoD.Leaderboard_MP.GetTimeFrameDataFromName( element.btnId )
	local timeFrameValue = timeFrameData.value
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbTimeFrame" ), timeFrameValue )
	SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameValue, isHardcore )
	local leaderboardDefName = CoD.Leaderboard_MP.GetLeaderboardDefName( leaderboardIndex, sortColumnIndex, isHardcore )
	Engine.LoadLeaderboard( leaderboardDefName, timeFrameValue )
	Engine.RequestLeaderboardData( controller, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
	SetGroupsNotifyInformation( controller, Engine.Localize( "GROUPS_CONGRATULATIONS_CAPS_TITLE" ), Engine.Localize( "GROUPS_LBMAKER_UPDATE_SUCCESS" ), false )
	OpenGroupsNotifyPopup( self, element, controller, false )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "" )
end

function JoinSessionInProgressOnGroupMember( self, element, controller )
	local menu = GoBack( self, controller )
	GoBack( menu, controller )
	LobbyQuickJoin( menu, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, false )
end

function SpectateSelectedPlayer( self, element, controller )
	local clientNum = Engine.GetModelValue( Engine.GetModel( element:getModel(), "clientNum" ) )
	Engine.SendMenuResponse( controller, "spectate", clientNum )
end

function SetShoutcastHighlightedPlayer( self, element, controller )
	local clientNum = Engine.GetModelValue( Engine.GetModel( element:getModel(), "clientNum" ) )
	Dvar.shoutcastHighlightedClient:set( clientNum )
end

function ToggleCodCasterQuickSettings( self, element, controller )
	if not element.profileVar then
		return 
	end
	local value = CoD.ShoutcasterProfileVarBool( controller, element.profileVar )
	if not value then
		CoD.SetShoutcasterProfileVarValue( controller, element.profileVar, 1 )
	else
		CoD.SetShoutcasterProfileVarValue( controller, element.profileVar, 0 )
	end
	Engine.SetModelValue( Engine.GetModel( element:getModel(), "profileVarValue" ), CoD.ShoutcasterProfileVarBool( controller, element.profileVar ) )
	if Engine.IsInGame() and element.profileVar == "shoutcaster_qs_thirdperson" then
		Engine.ExecNow( controller, "shoutcaster_thirdperson " .. CoD.ShoutcasterProfileVarValue( controller, element.profileVar ) )
	end
end

function SetCodCasterProfileValue( self, element, controller, profileVar, value )
	CoD.SetShoutcasterProfileVarValue( controller, profileVar, value )
end

function HandleTeamIdentityKeyboardComplete( self, element, controller, event )
	local model, profileVarName = nil
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local teamIdentityInformationModel = DataSources.TeamIdentityInformation.getModel( controller, team )
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME then
		model = Engine.GetModel( teamIdentityInformationModel, "teamName" )
		profileVarName = "shoutcaster_fe_" .. team .. "_name"
	end
	if model then
		Engine.SetModelValue( model, event.input )
		CoD.SetShoutcasterProfileVarValue( controller, profileVarName, event.input )
	end
end

function SetTeamIdentityProfileValue( self, element, controller, key )
	if not key or key == "" then
		return 
	else
		local idModel = Engine.GetModel( element:getModel(), "id" )
		if not idModel then
			return 
		else
			local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
			local id = Engine.GetModelValue( idModel )
			local profileVarName = "shoutcaster_fe_" .. team .. "_" .. key
			CoD.SetShoutcasterProfileVarValue( controller, profileVarName, id )
		end
	end
end

function SetTeamIdentityTeamLogo( self, element, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local teamIdentityInformationModel = DataSources.TeamIdentityInformation.getModel( controller, team )
	local teamLogo = Engine.GetModelValue( Engine.GetModel( element:getModel(), "ref" ) )
	local teamLogoName = Engine.GetModelValue( Engine.GetModel( element:getModel(), "name" ) )
	Engine.SetModelValue( Engine.GetModel( teamIdentityInformationModel, "teamLogo" ), teamLogo )
	Engine.SetModelValue( Engine.GetModel( teamIdentityInformationModel, "teamLogoName" ), teamLogoName )
end

function SetTeamIdentityTeamColor( self, element, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local teamIdentityInformationModel = DataSources.TeamIdentityInformation.getModel( controller, team )
	local teamColor = Engine.GetModelValue( Engine.GetModel( element:getModel(), "color" ) )
	Engine.SetModelValue( Engine.GetModel( teamIdentityInformationModel, "teamColor" ), teamColor )
end

function UpdateSelectedTeamIdentityColorElement( self, element, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local profileVarName = "shoutcaster_fe_" .. team .. "_color"
	local previousSelectedColorIndex = CoD.ShoutcasterProfileVarValue( controller, profileVarName )
	local newSelectedColorIndex = Engine.GetModelValue( Engine.GetModel( element:getModel(), "id" ) )
	local previousSelectedElement = self.TeamColorList:findItem( {
		id = previousSelectedColorIndex
	} )
	if previousSelectedElement then
		local selectedModel = Engine.GetModel( previousSelectedElement:getModel(), "selected" )
		Engine.SetModelValue( selectedModel, false )
	end
	Engine.SetModelValue( Engine.GetModel( element:getModel(), "selected" ), true )
end

function SaveShoutcasterSettings( self, element, controller )
	Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
end

function ChangeAbilityWheelItems( controller, menu, expressionArg )
	local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" )
	local newType = (Engine.GetModelValue( typeModel ) + expressionArg + 3) % 3
	Engine.SetModelValue( typeModel, newType )
	DataSources.AbilityWheel.getModel( controller )
	menu.updateButtonStates( nil, newType + 1 )
end

function SetFileShareOverrideXuid( self, element, controller )
	local xuidModel = element:getModel( controller, "xuid" )
	if xuidModel ~= nil then
		local xuid = Engine.GetModelValue( xuidModel )
		Dvar.fshRecentsXUID:set( xuid )
		OpenGenericSmallPopup( self, controller, "Theater Player Overriden", "You will now be able to view fileshare as " .. tostring( xuid ), "MENU_OK" )
	end
end

function OpenPCQuit( self, element, controller )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( controller, self, "QuitPCGamePopup" )
	end
end

function OpenPCResetControlsPopup( self, element, controller )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( controller, self, "ResetPCControls" )
	end
end

function ResetPCControlsToDefault( self, element, controller )
	if Dvar.ui_execdemo_gamescom:get() then
		Engine.ExecNow( controller, "resetprofilecommon" )
		Engine.ExecNow( controller, "updategamerprofile" )
		Engine.ExecNow( controller, "storagereset stats_mp_offline" )
	end
	Engine.SetProfileVar( controller, "input_invertpitch", 0 )
	Engine.SetProfileVar( controller, "gpad_rumble", 1 )
	Engine.SetProfileVar( controller, "gpad_sticksConfig", CoD.THUMBSTICK_DEFAULT )
	Engine.SetProfileVar( controller, "gpad_buttonsConfig", CoD.BUTTONS_DEFAULT )
	Engine.SetProfileVar( controller, "input_viewSensitivity", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( controller, "input_viewSensitivityHorizontal", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( controller, "input_viewSensitivityVertical", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( controller, "mouseSensitivity", 5 )
	Engine.ExecNow( controller, "defaultbindings" )
	Engine.ExecNow( controller, "execcontrollerbindings" )
	Engine.SyncHardwareProfileWithDvars()
	self:dispatchEventToRoot( {
		name = "options_refresh",
		controller = controller
	} )
end

function OpenPCApplyGraphicsPopup( self, element, controller )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( controller, self, "ApplyPCGraphics" )
	end
end

function ApplyPCGraphicsOptions( self, element, controller )
	Engine.SaveHardwareProfile()
	Engine.ApplyHardwareProfileSettings()
	Engine.Exec( nil, "r_applyPicmip" )
	Engine.Exec( nil, "vid_restart" )
	Engine.Exec( nil, "snd_restart" )
end

function ToggleDropDownListInUse( self, controller )
	self.inUse = not self.inUse
	if self.DropDownList then
		MakeFocusable( self.DropDownList )
		SetFocusToElement( self, "DropDownList", controller )
	end
end

function SetVerticaListSpacerHeight( self, model )
	if model then
		local height = Engine.GetModelValue( model )
		if height then
			self:setTopBottom( true, false, 0, height )
		end
	end
end

function ToggleMouse( self, controller )
	self:toggleMouse()
end

function ToggleHandleMouse( self, controller )
	self:toggleHandleMouse()
end

function EnableMouseButton( self, controller )
	self:setHandleMouseButton( true )
end

function DisableMouseButton( self, controller )
	self:setHandleMouseButton( false )
end

function ToggleHandleMouseButton( self, controller )
	self:toggleHandleMouseButton( controller )
end

function EnableMouseMove( self, controller )
	self:setHandleMouseMove( true )
end

function DisableMouseMove( self, controller )
	self:setHandleMouseMove( false )
end

function ToggleHandleMouseMove( self, controller )
	self:toggleHandleMouseMove()
end

function EnableMouseButtonOnElement( element, controller )
	element:setHandleMouseButton( true )
end

function DisableMouseButtonOnElement( element, controller )
	element:setHandleMouseButton( false )
end

function ToggleDropdownListInUse_Console( self, controller )
	self.inUse = not self.inUse
	if self.inUse == true then
		if self.DropdownList then
			MakeFocusable( self.DropdownList )
			SetLoseFocusToElement( self, "DropdownRoot", controller )
			SetFocusToElement( self, "DropdownList", controller )
		end
	elseif self.DropdownList then
		SetState( self, "DefaultState" )
		MakeNotFocusable( self.DropdownList )
		MakeFocusable( self.DropdownRoot )
		SetLoseFocusToElement( self, "DropdownList", controller )
		SetFocusToElement( self, "DropdownRoot", controller )
	end
end

function DropDownListItemClick_Console( self, element, controller )
	
end

function Gunsmith_TabChanged( self, element, controller )
	DataSources.Unlockables.setCurrentFilterItem( element.filter )
	CoD.perController[controller].weaponCategory = element.filter
	self.weaponList:updateDataSource( true )
	local firstFocusable = self.weaponList:getFirstSelectableItem()
	self.weaponList:setActiveItem( firstFocusable )
	if CoD.perController[controller].gunsmithWeaponCategoryRestored == true then
		local category_index = self.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
		CoD.SetCustomization( controller, category_index, "category_index" )
	end
end

function Gunsmith_Back( self, element, controller )
	CoD.perController[controller].gunsmithWeaponCategoryRestored = nil
	CoD.perController[controller].gunsmithWeaponListIndex = nil
	CoD.perController[controller].gunsmithAttachmentType = nil
	CoD.perController[controller].gunsmithAttachmentModel = nil
	CoD.perController[controller].gunsmithCamoIndexModel = nil
	CoD.perController[controller].gunsmithVariantModel = nil
	CoD.perController[controller].gunsmithAttachmentVariantModel = nil
	CoD.CraftUtility.Gunsmith.CachedVariants = {}
end

function Gunsmith_GainFocus( self, element, controller )
	local weaponIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	local category_index = self.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.SetCustomization( controller, category_index, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( controller )
end

function Gunsmith_ChooseWeaponList( self, element, controller )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	self:updateMode( Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST, element )
	local firstFocusable = self.variantSelector.variantList:getFirstSelectableItem()
	self.variantSelector.variantList:setActiveItem( firstFocusable )
end

function Gunsmith_BrowseVariants( self, element, controller )
	self.variantSelector.variantList:updateDataSource( true )
	self:updateMode( Enum.GunsmithMode.GUNSMITHMODE_VARIANTS, element )
	CoD.perController[controller].gunsmithWeaponListIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.perController[controller].gunsmithWeaponCategoryRestored = false
	CoD.perController[controller].gunsmithAttachmentType = "attachment"
end

function Gunsmith_HandleKeyboardComplete( self, element, controller, event )
	local selectedVariantModel = element:getModel()
	local variantTextEntryModel = nil
	if not selectedVariantModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		variantTextEntryModel = Engine.GetModel( selectedVariantModel, "variantTextEntry" )
	end
	if variantTextEntryModel then
		Engine.SetModelValue( variantTextEntryModel, event.input )
		local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
		Engine.SetModelValue( validVariantNameModel, true )
	end
end

function Gunsmith_CreateVariantNameBack( self, element, controller )
	local selectedVariantModel = self:getModel()
	local variantTextEntryModel = Engine.GetModel( selectedVariantModel, "variantTextEntry" )
	Engine.SetModelValue( variantTextEntryModel, Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	Engine.SetModelValue( validVariantNameModel, false )
end

function Gunsmith_FocusOccupiedVariant( self, element, controller )
	CoD.perController[controller].gunsmithVariantModel = element:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
end

function Gunsmith_ChooseEmptyVariant( self, element, controller )
	CoD.perController[controller].gunsmithVariantModel = element:getModel()
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	Engine.SetModelValue( validVariantNameModel, false )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
end

function Gunsmith_ConfirmVariantName( self, element, controller )
	local selectedVariantModel = self:getModel()
	local variantTextEntry = Engine.GetModelValue( Engine.GetModel( selectedVariantModel, "variantTextEntry" ) )
	local variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
	Engine.SetModelValue( variantNameModel, variantTextEntry )
	local baseMenu = GoBack( self, controller )
	if baseMenu then
		baseMenu:openOverlay( "GunsmithCustomizeVariant", controller )
		local variantNameBigModel = Engine.GetModel( selectedVariantModel, "variantNameBig" )
		Engine.SetModelValue( variantNameBigModel, variantTextEntry )
	end
end

function Gunsmith_SetWeaponAttachmentType( self, element, attachmentType, attachmentNum, controller )
	CoD.perController[controller].gunsmithAttachmentType = attachmentType
	CoD.perController[controller].gunsmithAttachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
	CoD.perController[controller].gunsmithAttachmentVariantModel = self:getModel( controller, "attachmentVariant" .. attachmentNum )
	local attachmentTypeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" )
	Engine.SetModelValue( attachmentTypeModel, attachmentType )
end

local Gunsmith_ClearItemName = function ( controller )
	local itemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
	Engine.SetModelValue( itemNameModel, "" )
end

function Gunsmith_ClearAttachmentSlot( self, element, attachmentNum, controller )
	local attachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
	Engine.SetModelValue( attachmentModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	local attachmentVariantModel = self:getModel( controller, "attachmentVariant" .. attachmentNum )
	Engine.SetModelValue( attachmentVariantModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Gunsmith_ClearItemName( controller )
	local variantModel = self:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

function Gunsmith_ClearCamo( self, element, controller )
	local camoIndexModel = self:getModel( controller, "camoIndex" )
	Engine.SetModelValue( camoIndexModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Gunsmith_ClearItemName( controller )
	local variantModel = self:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

function Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
	local paintjobSlotModel = self:getModel( controller, "paintjobSlot" )
	local paintjobIndexModel = self:getModel( controller, "paintjobIndex" )
	Engine.SetModelValue( paintjobSlotModel, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	Engine.SetModelValue( paintjobIndexModel, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	Gunsmith_ClearItemName( controller )
	local variantModel = self:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

function Gunsmith_SelectAttachment( self, element, controller )
	local elementModel = element:getModel()
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if elementModel and variantModel then
		local attachmentID = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentIndex" ) )
		local acvIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "acvIndex" ) )
		local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
		local selectedAttachmentIndex = 0
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local equippedAttachmentIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "attachment" .. attachmentIndex ) )
			local attachmentTableID = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, attachmentID, Enum.eModes.MODE_MULTIPLAYER )
			local attachmentTableEquippedIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, equippedAttachmentIndex, Enum.eModes.MODE_MULTIPLAYER )
			if attachmentTableEquippedIndex > 0 and attachmentTableID ~= attachmentTableEquippedIndex and not Engine.AreAttachmentsCompatible( weaponIndex, attachmentTableID, attachmentTableEquippedIndex, Enum.eModes.MODE_MULTIPLAYER ) then
				selectedAttachmentIndex = equippedAttachmentIndex
				break
			end
		end
		if selectedAttachmentIndex > 0 then
			CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( controller, variantModel, selectedAttachmentIndex )
		end
		CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( controller, variantModel, attachmentID )
		local variantAttachmentModel = self:getModel()
		Engine.SetModelValue( variantAttachmentModel, attachmentID )
		local attachmentVariantModel = CoD.perController[controller].gunsmithAttachmentVariantModel
		Engine.SetModelValue( attachmentVariantModel, acvIndex )
	end
end

function Gunsmith_FocusAttachment( self, element, controller )
	local selectedattachmentIndexModel = element:getModel( controller, "attachmentIndex" )
	local focusAttachmentID = Engine.GetModelValue( selectedattachmentIndexModel )
	local attachmentRef = Engine.GetAttachmentRefByIndex( focusAttachmentID )
	local variantAttachmentModel = self:getModel()
	local variantAttachmentID = Engine.GetModelValue( variantAttachmentModel )
	local variantAttachmentRef = Engine.GetAttachmentRefByIndex( variantAttachmentID )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local camera = "select01"
	local weaponNamePlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
	if variantAttachmentID > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and attachmentRef ~= variantAttachmentRef then
		weaponNamePlusAttachments = string.gsub( weaponNamePlusAttachments, "+" .. variantAttachmentRef, "" )
	end
	weaponNamePlusAttachments = weaponNamePlusAttachments .. "+" .. attachmentRef
	local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( controller, variantModel )
	local focusAttachmentFound = CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( controller, variantModel, focusAttachmentID )
	if not focusAttachmentFound then
		local focusACVIndex = Engine.GetModelValue( Engine.GetModel( element:getModel(), "acvIndex" ) )
		local focusACVInfo = attachmentRef .. "," .. focusACVIndex
		attachmentVariantString = attachmentVariantString .. focusACVInfo
	end
	local weaponOptions = "none"
	if weaponNamePlusAttachments and weaponNamePlusAttachments ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_focus", loadoutSlot, weaponNamePlusAttachments, attachmentRef, weaponOptions, attachmentVariantString )
	end
end

function Gunsmith_Attachment_ToggleVariant( self, element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local weaponName = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
	local elementModel = element:getModel()
	local variantAttachmentModel = self:getModel()
	local variantAttachmentID = Engine.GetModelValue( variantAttachmentModel )
	if elementModel then
		local acvIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "acvIndex" ) )
		local focusAttachmentID = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentIndex" ) )
		if weaponIndex then
			local attachmentNameModel = Engine.GetModel( elementModel, "name" )
			local attachmentImageModel = Engine.GetModel( elementModel, "image" )
			local acvValue = CoD.CACUtility.EmptyItemIndex
			if acvIndex == 0 then
				local acv = Engine.GetAttachmentCosmeticVariant( weaponName, focusAttachmentID )
				if acv then
					Engine.SetModelValue( attachmentNameModel, acv.name )
					Engine.SetModelValue( attachmentImageModel, acv.image )
					Engine.SetModelValue( Engine.GetModel( elementModel, "acvIndex" ), 1 )
					acvValue = 1
				end
			else
				local defaultName = Engine.GetAttachmentNameByIndex( focusAttachmentID )
				Engine.SetModelValue( attachmentNameModel, defaultName )
				local defaultImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, weaponIndex, focusAttachmentID )
				Engine.SetModelValue( attachmentImageModel, defaultImage )
				Engine.SetModelValue( Engine.GetModel( elementModel, "acvIndex" ), 0 )
			end
			if CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( controller, variantModel, focusAttachmentID ) then
				CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant( controller, variantModel, focusAttachmentID, acvValue )
			end
			Gunsmith_FocusAttachment( self, element, controller )
		end
	end
end

function Gunsmith_FocusCamo( self, element, controller )
	local selectedItemIndexModel = element:getModel( controller, "itemIndex" )
	local camoIndex = Engine.GetModelValue( selectedItemIndexModel )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel, false, false, false, camoIndex )
end

function Gunsmith_SetWeaponCamoModel( self, element, controller )
	CoD.perController[controller].gunsmithCamoIndexModel = self:getModel( controller, "camoIndex" )
	local baseWeaponSlot = "primary"
	local notetrack = "select01"
	Engine.SendClientScriptNotify( controller, "cam_customization_focus", baseWeaponSlot, notetrack )
end

function Gunsmith_SelectCamo( self, element, controller )
	local selectedItemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = Engine.GetModelValue( selectedItemIndexModel )
	local camoModel = self:getModel()
	Engine.SetModelValue( camoModel, itemIndex )
end

function Gunsmith_SetSelectedItemName( self, element, slotType, attachmentNum, controller )
	local variantModel = element:getModel()
	local itemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
	local attachmentTypeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" )
	Engine.SetModelValue( attachmentTypeModel, slotType )
	Engine.SetModelValue( itemNameModel, "" )
	if slotType == "attachment" or slotType == "optic" then
		local attachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
		local attachmentIndex = Engine.GetModelValue( attachmentModel )
		if attachmentIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
			local attachmentVariantModel = self:getModel( controller, "attachmentVariant" .. attachmentNum )
			local attachmentVariantID = Engine.GetModelValue( attachmentVariantModel )
			if attachmentVariantID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local weaponName = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
				local cosmeticVariant = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentIndex )
				attachmentName = cosmeticVariant.name
			end
			Engine.SetModelValue( itemNameModel, attachmentName )
		end
	elseif slotType == "camo" and attachmentNum == "" then
		local camoIndexModel = self:getModel( controller, "camoIndex" )
		local camoIndex = Engine.GetModelValue( camoIndexModel )
		local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
		if camoIndex ~= CoD.CraftUtility.Gunsmith.CAMO_NONE and weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
			local optionInfoModel = Engine.GetWeaponOptionsInfoModelByIndex( controller, camoIndex, "WeaponOptions", weaponItemIndex, 0, Enum.eModes.MODE_MULTIPLAYER )
			local camoNameModel = Engine.GetModel( optionInfoModel, "name" )
			if camoNameModel then
				local camoName = Engine.GetModelValue( camoNameModel )
				Engine.SetModelValue( itemNameModel, camoName )
			end
		end
	elseif slotType == "paintjob" and attachmentNum == "" then
		local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
		local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
		local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
		local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
		if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			local paintjobName = CoD.CraftUtility.Paintjobs.GetPaintjobName( controller, paintjobSlot, paintjobIndex )
			Engine.SetModelValue( itemNameModel, paintjobName )
		end
	end
end

function Gunsmith_ClearVariant( self, element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	CoD.CraftUtility.Gunsmith.ClearVariant( controller, variantIndex )
	ClearMenuSavedState( self )
	local baseMenu = GoBackMultiple( self, controller, 2 )
	baseMenu.variantSelector.variantList:updateDataSource( true )
	local firstFocusable = baseMenu.variantSelector.variantList:getFirstSelectableItem()
	baseMenu.variantSelector.variantList:setActiveItem( firstFocusable )
end

function Gunsmith_RenameVariant( self, element, controller )
	local variantModel = self:getModel()
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	local variantName = Engine.GetModelValue( Engine.GetModel( variantModel, "variantName" ) )
	CoD.CraftUtility.Gunsmith.RenameVariant( controller, variantIndex, variantName )
end

function Gunsmith_HandleRenameKeyboardComplete( self, element, controller, event )
	local selectedVariantModel = self:getModel()
	local variantNameModel, variantNameBigModel = nil
	if not selectedVariantModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
		variantNameBigModel = Engine.GetModel( selectedVariantModel, "variantNameBig" )
	end
	if variantNameModel then
		Engine.SetModelValue( variantNameModel, event.input )
	end
	if variantNameBigModel then
		Engine.SetModelValue( variantNameBigModel, event.input )
	end
end

function Gunsmith_SaveChangesButtonAction( self, element, buttonAction, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if buttonAction == "save" then
		CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( controller, self:getModel() )
	end
	local customizeVariantMenu = GoBack( self, controller )
	local gunsmithMenu = GoBack( customizeVariantMenu, controller )
	ClearMenuSavedState( customizeVariantMenu )
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	gunsmithMenu.variantSelector.variantList:updateDataSource( true )
	gunsmithMenu.attachmentList:updateDataSource( true )
	gunsmithMenu.variantSelector.variantList:findItem( {
		variantIndex = variantIndex
	}, nil, true, nil )
end

function Gunsmith_PaintjobSelector_GainFocus( self, element, controller )
	CoD.perController[controller].selectedpaintjobModel = element:getModel()
	CoD.perController[controller].viewIndex = 1
	local customizationType = CoD.Paintshop.View[CoD.perController[controller].viewIndex].customization_type
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel, false, paintjobSlot, paintjobIndex, nil )
	SetHeadingKickerText( "MENU_GUNSMITH_CAPS" )
end

function Gunsmith_OpenPaintjobSelector( self, element, controller )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( self, element, controller )
	local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
	local variantPaintjobSlotModel = self:getModel( controller, "paintjobSlot" )
	local variantPaintjobIndexModel = self:getModel( controller, "paintjobIndex" )
	local variantPaintjobSlotAndIndexModel = self:getModel( controller, "paintjobSlotAndIndex" )
	Engine.SetModelValue( variantPaintjobSlotModel, paintjobSlot )
	Engine.SetModelValue( variantPaintjobIndexModel, paintjobIndex )
	Engine.SetModelValue( variantPaintjobSlotAndIndexModel, paintjobSlot .. " " .. paintjobIndex )
end

function Gunsmith_ClearCACWithUpdatedVariant( self, controller )
	
end

function CopyModelFindElement( menu, element, stringArg )
	local newElement = element
	while newElement and not newElement[stringArg] do
		newElement = newElement:getParent()
	end
	if newElement and newElement[stringArg] then
		newElement[stringArg]:setModel( element:getModel() )
	end
end

function StartMenuGoBack_ListElement( self, element, controller, actionParam, menu )
	StartMenuGoBack( menu, controller )
end

function StartMenuGoBack( menu, controller )
	StartMenuResumeGame( menu, controller )
	GoBack( menu, controller )
end

function StartMenuResumeGame( menu, controller )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	if Engine.IsInGame() then
		Engine.SetActiveMenu( controller, CoD.UIMENU_NONE )
	end
end

function CloseStartMenu( menu, controller )
	local startMenu = GoBackToMenu( menu, controller, "StartMenu_Main" )
	if startMenu.menuName == "StartMenu_Main" or startMenu.menuName == "DOA_INGAME_PAUSE" then
		StartMenuGoBack( startMenu, controller )
	end
end

function RefreshLobbyRoom( menu, controller )
	if Engine.IsInGame() then
		return 
	end
	local lobbyGameModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" )
	local lobbyMainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	local roomModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	if roomModel then
		local room = Engine.GetModelValue( roomModel )
		if room == "auto" then
			local mode = Engine.GetMostRecentPlayedMode( controller )
			room = Engine.GetAbbreviationForMode( mode )
			if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
				room = room .. "_local"
			end
			if IsCustomLobby() then
				room = room .. "_custom"
			end
		end
		SendCustomClientScriptMenuStateChangeNotify( controller, "Main", true, room )
		menu.previousRoom = room
	end
end

function UpdatePlayerInspection( self, element, controller )
	Engine.SendClientScriptNotify( controller, "inspect_player", Engine.UInt64ToString( element.xuid ) )
end

function UpdateGamerprofile( self, element, controller )
	Engine.Exec( controller, "updategamerprofile" )
end

function OpenPaintshop( self, element, controller, param, menu )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	Engine.SetModelValue( paintshopModeModel, Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if parsingDone then
		menu:openOverlay( "Paintshop", controller )
	end
end

function OpenEmblemSelect( self, element, controller, menu )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	Engine.ExecNow( controller, "emblemgetprofile" )
	local parsingDone = CoD.CraftUtility.Emblems.ParseDDL( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
	if parsingDone then
		menu:openOverlay( "EmblemSelect", controller )
	end
end

function OpenGunsmith( self, element, controller, param, menu )
	local gunsmithModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithModeModel, Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local variantParsingDone = CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local paintjobParsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if variantParsingDone and paintjobParsingDone then
		menu:openOverlay( "Gunsmith", controller )
	end
end

function OpenCallingCards( self, element, controller, param, menu )
	
end

function OpenGroups( self, element, controller, param, menu )
	if IsGroupsEnabled() then
		CoD.LobbyBase.OpenGroups( menu, controller )
	end
end

function OpenPersonalizeCharacter( self, element, controller, param, menu )
	CoD.LobbyBase.OpenPersonalizeCharacter( menu, controller )
end

function OpenChooseCharacterLoadout( self, element, controller, param, menu )
	CoD.perController[controller].customizationMode = Enum.eModes.MODE_MULTIPLAYER
	CoD.LobbyBase.OpenChooseCharacterLoadout( menu, controller )
end

function EditClanTag( self, element, controller, param, menu )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CLAN_TAG" )
end

function OpenControlerSettings( self, element, controller, param, menu )
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "OptionsMenu", controller )
	menu:close()
end

function ProcessStartMenuButtonPress( self, element, controller )
	if element.currentMode == CoD.HeroCarouselItemStates.Inspecting then
		if element.cardFront and element.cardFront.selectionList and element.cardFront.selectionList.activeWidget and not IsDisabled( self, element.cardFront.selectionList.activeWidget, {
			controller = controller
		} ) then
			ProcessListAction( self, element.cardFront.selectionList.activeWidget, controller )
		end
	elseif CoD.CCUtility.Heroes.edittingLoadoutForWidget then
		local element = CoD.CCUtility.Heroes.edittingLoadoutForWidget
		if element.cardBack and element.cardBack.selectionList and element.cardBack.selectionList.activeWidget and not IsDisabled( self, element.cardBack.selectionList.activeWidget, {
			controller = controller
		} ) then
			EquipHeroLoadoutItem( element, element.cardBack.selectionList.activeWidget, controller )
		end
	end
end

function OpenMenuByNameParam( self, element, controller, param, menu )
	NavigateToMenu( self, param, true, controller )
end

function OpenPopupMenuByNameParam( self, element, controller, param, menu )
	menu:openPopup( param, controller )
end

function StartMenuUploadClip( self, element, controller, param, menu )
	local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
	if downloadProgress < 100 then
		local titleText = Engine.Localize( "MENU_NOTICE" )
		local messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( downloadProgress ) )
		CoD.Menu.OpenDemoErrorPopup( self, {
			controller = event.controller,
			titleText = titleText,
			messageText = messageText
		} )
		return 
	else
		CoD.DemoPopup.isClipSaveScreen = true
		CoD.perController[controller].fileshareSaveCategory = "clip"
		CoD.perController[controller].fileshareSaveIsCopy = false
		CoD.perController[controller].fileshareSaveIsPooled = false
	end
end

function StartMenuOpenManageSegments( self, element, controller, param, menu )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "ManageSegments", controller )
	menu:close()
end

function StartMenuOpenCustomizeHighlightReel( self, element, controller, param, menu )
	OpenPopupMenuByNameParam( self, element, controller, "CustomizeHighlightReel", menu )
end

function StartMenuJumpToStart( self, element, controller, param, menu )
	Engine.Exec( controller, "demo_jumptostart" )
	GoBack( self, controller )
end

function StartMenuEndDemo( self, element, controller, param, menu )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "EndDemoPopup" )
end

function GetSelectedSegmentModel()
	local segmentCount = Engine.GetDemoSegmentCount()
	local demoSegmentsModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if demoSegmentsModel then
		for i = 1, segmentCount, 1 do
			local segmentModel = Engine.GetModel( demoSegmentsModel, i - 1 )
			if segmentModel then
				local selectedModel = Engine.GetModel( segmentModel, "selected" )
				if selectedModel and Engine.GetModelValue( selectedModel ) == true then
					return segmentModel
				end
			end
		end
	end
	return nil
end

function ManageSegmentsRefresh( menu )
	local demoSegmentsRefreshModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
	local refreshCount = Engine.GetModelValue( demoSegmentsRefreshModel )
	Engine.SetModelValue( demoSegmentsRefreshModel, refreshCount + 1 )
end

function ManageSegmentsPreviewFilm( self, element, controller, param, menu )
	CoD.InGameMenu.CloseAllInGameMenus( self, {
		name = "close_all_ingame_menus",
		controller = controller
	} )
	Engine.Exec( controller, "demo_previewclip" )
end

function ManageSegmentsFilmOptions( self, element, controller, param, menu )
	OpenPopupMenuByNameParam( self, element, controller, "NewClipOptions", menu )
end

local ManageSegmentsClipOptions = function ( self, element, controller, param, menu )
	CoD.perController[controller].selectedSegment = element:getModel()
	OpenPopupMenuByNameParam( self, element, controller, "NewSegmentOptions", menu )
end

local ManageSegmentPlaceSegment = function ( self, element, controller, success, menu )
	local selectedSegmentModel = GetSelectedSegmentModel()
	local selectedSegmentNumber = Engine.GetModelValue( Engine.GetModel( selectedSegmentModel, "segmentNumber" ) )
	if success then
		local segmentNumber = Engine.GetModelValue( element:getModel( controller, "segmentNumber" ) )
		local fromSegmentIndex = selectedSegmentNumber - 1
		local toSegmentIndex = segmentNumber - 1
		if fromSegmentIndex ~= toSegmentIndex then
			Engine.ExecNow( menu:getOwner(), "demo_movesegment " .. fromSegmentIndex .. " " .. toSegmentIndex )
		end
	end
	Engine.SetModelValue( Engine.GetModel( selectedSegmentModel, "selected" ), false )
	CoD.perController[controller].selectedSegment = nil
	ManageSegmentsRefresh( menu )
	CoD.ManageSegments_Timeline_RefreshStateAfterMove( menu, element:getModel(), selectedSegmentModel, success )
end

function ManageSegmentsGoBack( self, element, controller )
	if GetSelectedSegmentModel() then
		ManageSegmentPlaceSegment( self, element, controller, false, self )
	else
		GoBack( self, controller )
	end
end

function ManageSegmentsSelectAction( self, element, controller )
	if GetSelectedSegmentModel() then
		ManageSegmentPlaceSegment( self, element, controller, true, self )
	else
		ManageSegmentsClipOptions( self, element, controller, nil, self )
	end
end

function ManageSegmentsUpdateTimeline( self, element, controller, param, menu )
	local focussed = nil
	if param == "gain_focus" then
		focussed = true
	else
		focussed = false
	end
	CoD.ManageSegments_Timeline_RefreshState( menu, element:getModel(), focussed )
end

function IncreaseSafeAreaVertical( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentVertical = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_vertical" ) )
	local newVertical = currentVertical + CoD.SafeArea.AdjustAmount
	if newVertical <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( controller, "safeAreaTweakable_vertical", newVertical )
	end
end

function DecreaseSafeAreaVertical( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentVertical = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_vertical" ) )
	local newVertical = currentVertical - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= newVertical then
		Engine.SetProfileVar( controller, "safeAreaTweakable_vertical", newVertical )
	end
end

function IncreaseSafeAreaHorizontal( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentHorizontal = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_horizontal" ) )
	local newHorizontal = currentHorizontal + CoD.SafeArea.AdjustAmount
	if newHorizontal <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( controller, "safeAreaTweakable_horizontal", newHorizontal )
	end
end

function DecreaseSafeAreaHorizontal( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentHorizontal = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_horizontal" ) )
	local newHorizontal = currentHorizontal - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= newHorizontal then
		Engine.SetProfileVar( controller, "safeAreaTweakable_horizontal", newHorizontal )
	end
end

function EquipScorestreak( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			local classModel = CoD.perController[controller].classModel
			local attachedSlot = CoD.CACUtility.GetAttachedItemSlot( classModel, itemIndex, CoD.CACUtility.KillstreakNameList )
			if not attachedSlot then
				local newSlot = CoD.CACUtility.FindFirstEmptySlotInList( classModel, CoD.CACUtility.KillstreakNameList )
				if newSlot then
					CoD.SetClassItem( controller, 0, newSlot, itemIndex )
					CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
					menu:processEvent( {
						name = "update_state",
						menu = menu
					} )
				else
					local popup = OpenPopup( menu, "ScorestreakOverCapacity", controller )
					popup:setModel( classModel )
					if popup.updateSelectedImage then
						popup:updateSelectedImage( itemIndex )
					end
					LUI.OverrideFunction_CallOriginalFirst( popup, "close", function ()
						if popup.lastRemovedSlot then
							CoD.SetClassItem( controller, 0, popup.lastRemovedSlot, itemIndex )
							CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
							menu:processEvent( {
								name = "update_state",
								menu = menu
							} )
						end
					end )
				end
			end
		end
	end
end

function RemoveScorestreak( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			local classModel = menu:getModel()
			local attachedSlot = CoD.CACUtility.GetAttachedItemSlot( classModel, itemIndex, CoD.CACUtility.KillstreakNameList )
			if attachedSlot then
				menu.lastRemovedSlot = attachedSlot
				CoD.SetClassItem( controller, 0, attachedSlot, CoD.CACUtility.EmptyItemIndex )
				CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
				menu:processEvent( {
					name = "update_state",
					menu = menu
				} )
			end
		end
	end
end

function RemoveAllScorestreaks( menu, controller )
	local classModel = menu:getModel()
	for _, loadoutSlot in ipairs( CoD.CACUtility.KillstreakNameList ) do
		CoD.SetClassItem( controller, 0, loadoutSlot, CoD.CACUtility.EmptyItemIndex )
	end
	CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
	menu:processEvent( {
		name = "update_state",
		menu = menu
	} )
end

function OpenAARIfNeeded( menu, controller )
	if AutomaticallyOpenAAR( controller ) and CanShowAAR( controller ) then
		local menuOpeningTimer = LUI.UITimer.new( 1000, "open_aar", true, menu )
		menu:registerEventHandler( "open_aar", function ( menu, event )
			if Engine.IsMultiplayerGame() then
				local aarType = ""
				if IsCustomLobby() then
					aarType = "custom"
				elseif IsLAN() then
					aarType = "lan"
				else
					aarType = "public"
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "aarType" ), aarType )
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ), true )
			end
			if CoD.isZombie then
				OpenOverlay( menu, "ZMAAR", controller )
			elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( controller ) then
				OpenOverlay( menu, "RewardsOverlay", controller )
			else
				OpenOverlay( menu, "MPAAR", controller )
			end
			local stats = CoD.GetPlayerStats( controller )
			stats.AfterActionReportStats.lobbyPopup:set( "" )
		end )
		menu:addElement( menuOpeningTimer )
	end
end

function OpenAAR( menu, controller )
	if CoD.isZombie then
		OpenOverlay( menu, "ZMAAR", controller )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ), true )
		if CoD.AARUtility.AnyRewardsEarnedDuringMatch( controller ) then
			OpenOverlay( menu, "RewardsOverlay", controller )
		else
			OpenOverlay( menu, "MPAAR", controller )
		end
	end
end

function SetStableStatsBuffer( controller )
	Engine.MakeStableStatsBufferForController( controller )
end

function OpenMOTDPopup( self, element, controller, param, menu )
	if param ~= nil then
		local controllerModel = Engine.GetModelForController( controller )
		Engine.SetModelValue( Engine.CreateModel( controllerModel, "MOTDMenu.ActionSource" ), param )
	end
	local overlay = menu:openOverlay( "MOTD", controller )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsMOTD" )
	overlay.crm_message_id = Engine.GetModelValue( Engine.GetModel( model, "messageID" ) )
	if not ShouldPresentRegistration( controller ) and not ShouldPresentMOTDBanner( controller, overlay ) then
		overlay.motdFooter:close()
	end
end

function MOTDPopupAcceptAction( self, element, controller, param, menu )
	local crm_message_name = "motd"
	Engine.ReportMarketingMessageViewed( controller, crm_message_name )
	LUI.CoDMetrics.CRMMessageImpression( self, controller, crm_message_name )
	local model = Engine.CreateModel( Engine.GetModelForController( controller ), "MOTDMenu.ActionSource" )
	local actionSource = Engine.GetModelValue( model )
	if actionSource == "FeaturedWidget" then
		GoBack( menu, controller )
		return 
	elseif Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( self, nil, controller, nil, self )
		else
			NavigateToLobby_FirstTimeFlowMP( self, nil, controller, menu )
		end
	else
		NavigateToLobby( self, "ModeSelect", false, controller )
	end
	SendClientScriptMenuChangeNotify( controller, menu, false )
	Close( self, controller )
end

function BubbleGumBuffSelectTabChanged( self, element, controller )
	local itemGroup = element.filter
	CoD.perController[controller].weaponCategory = itemGroup
	DataSources.Unlockables.setCurrentFilterItem( itemGroup )
	self.selectionList:updateDataSource()
end

function EquipBubblegumPack( self, element, controller )
	local bgbPackIndexModel = element:getModel( controller, "bgbPackIndex" )
	local bgbPackIndex = Engine.GetModelValue( bgbPackIndexModel )
	Engine.EquipBubbleGumPack( controller, bgbPackIndex )
end

function EquipBubblegumBuff( self, element, controller )
	local bgbPackIndex = Engine.GetEquippedBubbleGumPack( controller )
	local bgbIndex = CoD.perController[controller].bgbIndex
	local itemIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	local swapItemIndex, swapBGBIndex = nil
	for currentBGBIndex = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		local equippedItemIndex = Engine.GetBubbleGumBuff( controller, bgbPackIndex, currentBGBIndex )
		if equippedItemIndex == itemIndex then
			swapBGBIndex = currentBGBIndex
			swapItemIndex = Engine.GetBubbleGumBuff( controller, bgbPackIndex, bgbIndex )
			break
		end
	end
	Engine.SetBubbleGumBuff( controller, bgbPackIndex, bgbIndex, itemIndex )
	if swapBGBIndex then
		Engine.SetBubbleGumBuff( controller, bgbPackIndex, swapBGBIndex, swapItemIndex )
	end
end

function ShowBubblegumBuffModel( self, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = Engine.GetModelValue( itemIndexModel )
	local slotName = Engine.GetItemGroup( itemIndex )
	local camera = "select01"
	local modelName = "p7_" .. Engine.GetItemRef( itemIndex )
	Engine.SendClientScriptNotify( controller, "CustomClass_update", slotName, modelName, camera )
end

function SelectBubblegumBuff( self, element, controller )
	local bgbIndex = Engine.GetModelValue( element:getModel( controller, "bgbIndex" ) )
	CoD.perController[controller].bgbIndex = bgbIndex
end

function MegaChewFactoryFocusChanged( self, element, controller )
	local machineIndexModel = element:getModel( controller, "index" )
	if machineIndexModel then
		Engine.SendClientScriptNotify( controller, "mega_chew_update", "focus_changed", Engine.GetModelValue( machineIndexModel ) )
	end
end

function MegaChewFactoryMachineSelect( self, element, controller )
	local machineIndexModel = element:getModel( controller, "index" )
	if machineIndexModel then
		Engine.SendClientScriptNotify( controller, "mega_chew_update", "selected", Engine.GetModelValue( machineIndexModel ) )
	end
end

function MegaChewFactoryPurchase( self, element, controller )
	local machinePriceModel = element:getModel( controller, "price" )
	if machinePriceModel then
		local machinePrice = Engine.GetModelValue( machinePriceModel )
		local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
		for bgbCount = 1, machinePrice, 1 do
			local f733_local2 = bgbCount
			local randomBGBIndex = math.random( 216, 234 )
			local consumablesGained = currentStats.ItemStats[randomBGBIndex].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:get()
			currentStats.ItemStats[randomBGBIndex].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:set( consumablesGained + 1 )
			DebugPrint( "Obtained bgb " .. randomBGBIndex )
			Engine.SendClientScriptNotify( controller, "mega_chew_update", "purchased", Engine.GetModelValue( machinePriceModel ), randomBGBIndex )
		end
		local tokenCount = Engine.GetBGBTokensGained( controller )
		tokenCount = tokenCount - machinePrice
		Engine.SetBGBTokensGained( controller, tokenCount )
		local controllerModel = Engine.GetModelForController( controller )
		Engine.SetModelValue( Engine.GetModel( controllerModel, "MegaChewTokens.remainingTokens" ), tokenCount )
	end
end

function MegaChewFactoryPrintBGBs( self, element, controller )
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
	for bgbCount = 216, 234, 1 do
		local consumablesGained = currentStats.ItemStats[bgbCount].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:get()
		if consumablesGained > 0 then
			DebugPrint( "Have " .. consumablesGained .. " of bgb " .. bgbCount )
		end
	end
end

function FocusWeaponBuildKit( self, element, controller )
	Gunsmith_GainFocus( self, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	if not weaponIndex then
		return 
	else
		local variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( weaponIndex )
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantList[#variantList].variantIndex )
		local variantModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitVariant" )
		DataSources.GunsmithVariantList.createVariantModel( controller, variant, 1, variantModel )
		CoD.perController[controller].gunsmithVariantModel = variantModel
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
	end
end

function SelectWeaponBuildKit( self, element, controller )
	Gunsmith_BrowseVariants( self, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	if not weaponIndex then
		return 
	end
	local variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( weaponIndex )
	local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantList[#variantList].variantIndex )
	local variantModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitVariant" )
	DataSources.GunsmithVariantList.createVariantModel( controller, variant, 1, variantModel )
	CoD.perController[controller].gunsmithVariantModel = variantModel
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
	if not CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( variant.variantIndex ) then
		local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
		Engine.SetModelValue( validVariantNameModel, false )
		local variantTextEntryModel = Engine.GetModel( variantModel, "variantTextEntry" )
		if variantTextEntryModel then
			Engine.SetModelValue( variantTextEntryModel, "" )
			local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
			Engine.SetModelValue( validVariantNameModel, true )
		end
		local variantTextEntry = Engine.GetModelValue( variantTextEntryModel )
		local variantNameModel = Engine.GetModel( variantModel, "variantName" )
		Engine.SetModelValue( variantNameModel, variantTextEntry )
	end
	OpenOverlay( self, "WeaponBuildKitsCustomizeVariant", controller )
	Gunsmith_ChooseWeaponList( self, element, controller )
end

function SaveWeaponBuildKit( self, element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( controller, self:getModel() )
	local customizeVariantMenu = self
	local gunsmithMenu = GoBack( customizeVariantMenu, controller )
	ClearMenuSavedState( customizeVariantMenu )
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	gunsmithMenu.variantSelector.variantList:updateDataSource( true )
	gunsmithMenu.variantSelector.variantList:findItem( {
		variantIndex = variantIndex
	}, nil, true, nil )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel )
end

function CreateDefaultHeroRendersForMP( self, element, controller )
	Engine.CreateDefaultHeroRendersForMP()
end

function SetMap( controller, mapName )
	Engine.ExecNow( controller, "lobby_setmap " .. mapName )
	if CoD.isCampaign then
		if mapName == "cp_doa_bo3" then
			Engine.SetDvar( "mantle_enable", "0" )
			Engine.SetGametype( "doa" )
		elseif mapName == "cp_codfu" then
			Engine.SetDvar( "mantle_enable", "0" )
			Engine.SetGametype( "codfu" )
		else
			Engine.SetDvar( "mantle_enable", "1" )
		end
	end
	Engine.SetProfileVar( controller, CoD.profileKey_map, mapName )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( controller )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	if CoD.isCampaign then
		Engine.SetDvar( "cp_queued_level", "" )
	end
end

function MapSelected( element, controller )
	SetMap( controller, element.mapName )
end

function GameModeSelected( element, controller )
	Engine.Exec( controller, "resetCustomGametype" )
	local oldTeamBased = CoD.IsGametypeTeamBased()
	Engine.SetGametype( element.gametype )
	local newTeamBased = CoD.IsGametypeTeamBased()
	if oldTeamBased ~= newTeamBased then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
		Engine.SetDvar( "bot_difficulty", 1 )
	end
	Engine.Exec( controller, "xupdatepartystate" )
	Engine.SetProfileVar( controller, CoD.profileKey_gametype, element.gametype )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( controller )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.Exec( controller, "lobby_setgametype " .. element.gametype )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function PlaylistSelected( menu, element, controller )
	local filter = CoD.PlaylistCategoryFilter or ""
	Engine.SetPlaylistID( element.playlist.index )
	Engine.SetProfileVar( controller, "playlist_" .. filter, tostring( element.playlist.index ) )
	Engine.PartyHostClearUIState()
	CoD.LobbyBase.SetPlaylistName( element.playlist.name )
	local occludedMenu = menu.occludedMenu
	GoBack( menu, controller )
	if occludedMenu then
		occludedMenu:processEvent( {
			name = "playlist_selected",
			controller = controller,
			itemInfo = element.playlist
		} )
	end
end

function BlockGameFromKeyEvent( controller )
	Engine.BlockGameFromKeyEvent()
end

function ToggleScoreboardClientMute( element, controller )
	Engine.BlockGameFromKeyEvent()
	local clientNumModel = element:getModel( controller, "clientNum" )
	if not clientNumModel then
		return 
	end
	local clientNum = Engine.GetModelValue( clientNumModel )
	if clientNum and clientNum >= 0 and Engine.GetClientNum( controller ) ~= clientNum then
		Engine.TogglePlayerMute( controller, clientNum )
		UpdateScoreboardClientMuteButtonPrompt( element, controller )
	end
end

function UpdateScoreboardClientMuteButtonPrompt( element, controller )
	local clientNumModel = element:getModel( controller, "clientNum" )
	if not clientNumModel then
		return 
	end
	local clientNum = Engine.GetModelValue( clientNumModel )
	local scoreboardButtonPromptVisibleModel = Engine.CreateModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" )
	local scoreboardButtonPromptTextModel = Engine.CreateModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptText" )
	Engine.SetModelValue( scoreboardButtonPromptVisibleModel, false )
	if clientNum and clientNum >= 0 then
		if Engine.GetClientNum( controller ) == clientNum then
			return 
		end
		Engine.SetModelValue( scoreboardButtonPromptVisibleModel, true )
		if Engine.IsPlayerMutedByClientNum( controller, Enum.LobbyType.LOBBY_TYPE_GAME, clientNum ) then
			Engine.SetModelValue( scoreboardButtonPromptTextModel, "MENU_UNMUTE_CAPS" )
		else
			Engine.SetModelValue( scoreboardButtonPromptTextModel, "MENU_MUTE_CAPS" )
		end
	end
end

function AdjustBrightness( element, controller )
	if element.gridInfoTable and element.gridInfoTable.zeroBasedIndex then
		local range = 8
		local index = element.gridInfoTable.zeroBasedIndex + 1
		local interval = 1 / range
		local value = interval * (index - range + 1)
		if value < -1 then
			value = -1
		end
		if value > 1 then
			value = 1
		end
		local baseRGB = 29
		local newRGB = 2 * (index - range + 1) + baseRGB
		local colorValue = newRGB .. " " .. newRGB .. " " .. newRGB
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "brightnessSelector.imageColor" ), colorValue )
		Engine.SetProfileVar( controller, "r_sceneBrightness", value )
		Engine.Exec( controller, "updategamerprofile" )
	end
end

function AddToPlayerInventory( self, element, controller )
	local skuIdModel = element:getModel( controller, "skuId" )
	if skuIdModel then
		local skuId = Engine.GetModelValue( skuIdModel )
		Engine.AddItemToInventory( controller, skuId )
		if Engine.GetMarketplaceSize() == 0 then
			self.MarketplaceList:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self.PlayerInventoryList:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
	end
end

function RemoveFromPlayerInventory( self, element, controller )
	local itemIdModel = element:getModel( controller, "itemId" )
	if itemIdModel then
		local itemId = Engine.GetModelValue( itemIdModel )
		local itemQuantity = 1
		Engine.RemoveItemFromInventory( controller, itemId, itemQuantity )
		if Engine.GetPlayerInventorySize( controller ) == 0 then
			self.MarketplaceList:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self.PlayerInventoryList:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
		end
	end
end

function ReportItemUsageTime( self, element, controller )
	local usageTimeSeconds = 10
	Engine.ReportItemUsageTime( controller, usageTimeSeconds )
end

function AccountLink_SetAccountLinkViewed( self, element, controller )
	Engine.SetAccountLinkViewed( controller, true )
end

function AccountLink_HandleLoginKeyboardComplete( self, element, controller, event )
	local loginModel = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local emailModel, passwordModel = nil
	if not loginModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_EMAIL then
		emailModel = Engine.GetModel( loginModel, "email" )
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_PASSWORD then
		passwordModel = Engine.GetModel( loginModel, "password" )
	end
	if emailModel then
		Engine.SetModelValue( emailModel, event.input )
	end
	if passwordModel then
		Engine.SetModelValue( passwordModel, event.input )
		local s = ""
		for i = 0, string.len( event.input ) - 1, 1 do
			local f751_local2 = i
			s = s .. "*"
		end
		Engine.SetModelValue( Engine.GetModel( loginModel, "stars" ), s )
	end
end

function AccountLink_Login( self, element, controller )
	local previousMenu = GoBack( self, controller )
	local spinner = previousMenu:openOverlay( "Spinner", controller )
	spinner:registerEventHandler( "optin_success", function ( self, event )
		CoD.OverlayUtility.CreateOverlay( controller, self, "OptInSuccess" )
		self:close()
	end )
	spinner:registerEventHandler( "registration_failure", function ( self, element, event )
		FinishRegistrationFlow( self, controller, self )
	end )
	local loginModel = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local password = Engine.GetModelValue( Engine.GetModel( loginModel, "password" ) )
	local email = Engine.GetModelValue( Engine.GetModel( loginModel, "email" ) )
	Engine.AccountLinkLogin( controller, tostring( email ), tostring( password ) )
end

function AccountLink_HandleRegisterKeyboardComplete( self, element, controller, event )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	local firstNameModel, lastNameModel, zipCodeModel, usernameModel, emailModel, passwordModel, confirmPassModel = nil
	if not registerModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_FIRST_NAME then
		firstNameModel = Engine.GetModel( registerModel, "firstName" )
		if firstNameModel then
			Engine.SetModelValue( firstNameModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_LAST_NAME then
		lastNameModel = Engine.GetModel( registerModel, "lastName" )
		if lastNameModel then
			Engine.SetModelValue( lastNameModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_ZIP_CODE then
		zipCodeModel = Engine.GetModel( registerModel, "zipCode" )
		if zipCodeModel then
			Engine.SetModelValue( zipCodeModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_USERNAME then
		usernameModel = Engine.GetModel( registerModel, "username" )
		if usernameModel then
			Engine.SetModelValue( usernameModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_EMAIL then
		emailModel = Engine.GetModel( registerModel, "email" )
		if emailModel then
			Engine.SetModelValue( emailModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_PASSWORD then
		passwordModel = Engine.GetModel( registerModel, "password" )
		if passwordModel then
			Engine.SetModelValue( passwordModel, event.input )
			local s = ""
			for i = 0, string.len( event.input ) - 1, 1 do
				local f755_local2 = i
				s = s .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( registerModel, "stars" ), s )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_CONFIRM_PASSWORD then
		confirmPassModel = Engine.GetModel( registerModel, "confirmPass" )
		if confirmPassModel then
			Engine.SetModelValue( confirmPassModel, event.input )
			local s = ""
			for i = 0, string.len( event.input ) - 1, 1 do
				local f755_local2 = i
				s = s .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( registerModel, "confirmStars" ), s )
		end
	end
end

function AccountLink_SelectRegion( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "itemName" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "region" ), val )
end

function AccountLink_SelectGender( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "gender" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "gender" ), val )
end

function AccountLink_SelectMonth( self, element, controller )
	local string = Engine.GetModelValue( element:getModel( controller, "month" ) )
	local index = Engine.GetModelValue( element:getModel( controller, "monthIndex" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "month" ), string )
	Engine.SetModelValue( Engine.GetModel( registerModel, "monthIndex" ), index )
end

function AccountLink_SelectDay( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "day" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "day" ), val )
end

function AccountLink_SelectYear( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "year" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "year" ), val )
end

function AccountLink_Register( self, element, controller )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	local fname = Engine.GetModelValue( Engine.GetModel( registerModel, "firstName" ) )
	local lname = Engine.GetModelValue( Engine.GetModel( registerModel, "lastName" ) )
	local zip = Engine.GetModelValue( Engine.GetModel( registerModel, "zipCode" ) )
	local region = Engine.GetModelValue( Engine.GetModel( registerModel, "region" ) )
	local username = Engine.GetModelValue( Engine.GetModel( registerModel, "username" ) )
	local email = Engine.GetModelValue( Engine.GetModel( registerModel, "email" ) )
	local password = Engine.GetModelValue( Engine.GetModel( registerModel, "password" ) )
	local confirmPassword = Engine.GetModelValue( Engine.GetModel( registerModel, "confirmPass" ) )
	local gender = Engine.GetModelValue( Engine.GetModel( registerModel, "gender" ) )
	local month = Engine.GetModelValue( Engine.GetModel( registerModel, "monthIndex" ) )
	local day = Engine.GetModelValue( Engine.GetModel( registerModel, "day" ) )
	local year = Engine.GetModelValue( Engine.GetModel( registerModel, "year" ) )
	local registerInfo = {
		firstName = tostring( fname ),
		lastName = tostring( lname ),
		zipCode = tostring( zip ),
		region = tostring( region ),
		username = tostring( username ),
		email = tostring( email ),
		password = tostring( password ),
		confirmPass = tostring( confirmPassword ),
		gender = tostring( gender ),
		month = month,
		day = day,
		year = year
	}
	if fname == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid first name", "Specific Name Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif lname == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid last name", "Specific Name Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif region == nil then
		OpenGenericSmallPopup( self, controller, "Please select a region", "Please select a region", "MENU_OK", GoBack )
		return 
	elseif zip == nil or string.len( zip ) ~= 5 then
		OpenGenericSmallPopup( self, controller, "Please enter a valid zip code", "Specific Zip Code Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif username == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid username", "Specific Username Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif password == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid password", "Specific Password Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif confirmPassword == nil or password ~= confirmPassword then
		OpenGenericSmallPopup( self, controller, "Please confirm your password", "Please confirm your password.", "MENU_OK", GoBack )
		return 
	elseif gender == nil then
		OpenGenericSmallPopup( self, controller, "Please select a gender", "Please select a gender.", "MENU_OK", GoBack )
		return 
	elseif month == nil then
		OpenGenericSmallPopup( self, controller, "Please select a month", "Please select a month.", "MENU_OK", GoBack )
		return 
	elseif day == nil then
		OpenGenericSmallPopup( self, controller, "Please select a day", "Please select a day.", "MENU_OK", GoBack )
		return 
	elseif year == nil then
		OpenGenericSmallPopup( self, controller, "Please select a year", "Please select a year.", "MENU_OK", GoBack )
		return 
	else
		Engine.AccountLinkRegister( controller, registerInfo )
	end
end

function OpenRegistrationFlow( self, element, controller, menu )
	if Dvar.live_useInGameRegistration:exists() and Dvar.live_useInGameRegistration:get() and Engine.GetRegistrationStatus then
		local status = Engine.GetRegistrationStatus( controller )
		local data = Engine.GetMarketingMessage( controller, "registration" )
		local action = nil
		if data == nil then
			data = Engine.GetMarketingMessage( controller, "motd" )
			if data ~= nil and data.bannerAction ~= nil then
				action = data.bannerAction
			end
		elseif data.action ~= nil then
			action = data.action
		end
		if action ~= nil then
			if action == "registration" and status == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_NEW_USER then
				local previousMenu = GoBack( self, controller )
				local overlay = previousMenu:openOverlay( "InGameRegistration", controller )
				overlay.crm_message_id = data.messageID
				LUI.CoDMetrics.CRMMessageInteraction( self, controller, "registration" )
			elseif action == "opt-in" and status == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_OPTED_OUT then
				local previousMenu = GoBack( self, controller )
				local overlay = previousMenu:openOverlay( "InGameOptIn", controller )
				overlay.crm_message_id = data.messageID
				LUI.CoDMetrics.CRMMessageInteraction( self, controller, "registration" )
			elseif action == "store" then
				local previousMenu = GoBack( self, controller )
				OpenStore( self, element, controller, previousMenu.name, previousMenu )
			end
		end
	end
end

function OpenRegistrationBrowser( self, element, controller, menu )
	local previousMenu = GoBack( self, controller )
	local spinner = previousMenu:openOverlay( "Spinner", controller )
	spinner:registerEventHandler( "registration_success", function ( self, event )
		CoD.OverlayUtility.CreateOverlay( controller, self, "RegistrationSuccess" )
		self:close()
	end )
	spinner:registerEventHandler( "registration_failure", function ( self, element, event )
		FinishRegistrationFlow( self, controller, self )
	end )
	Engine.OpenRegistrationBrowser( controller )
end

function OptInToEmailMarketing( self, element, controller, menu )
	local previousMenu = GoBack( self, controller )
	local spinner = previousMenu:openOverlay( "Spinner", controller )
	spinner:registerEventHandler( "optin_success", function ( self, event )
		CoD.OverlayUtility.CreateOverlay( controller, self, "OptInSuccess" )
		self:close()
	end )
	spinner:registerEventHandler( "registration_failure", function ( self, element, event )
		FinishRegistrationFlow( self, controller, self )
	end )
	Engine.OptInToEmailMarketing( controller )
end

function FinishRegistrationFlow( self, controller, menu )
	local crm_message_name = "registration"
	Engine.ReportMarketingMessageViewed( controller, crm_message_name )
	LUI.CoDMetrics.CRMMessageImpression( self, controller, crm_message_name )
	if Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( self, nil, controller, nil, menu )
		else
			local currentLobbyMenu = LobbyData:GetCurrentMenuTarget()
			if currentLobbyMenu.id == LobbyData.UITargets.UI_MAIN.id then
				NavigateToLobby_FirstTimeFlowMP( self, nil, controller, menu )
			else
				GoBackToMenu( menu, controller, "Lobby" )
			end
		end
	else
		NavigateToLobby( self, "ModeSelect", false, controller )
	end
	SendClientScriptMenuChangeNotify( controller, menu, false )
	Close( self, controller )
end

function ChatClientEntriesFocused( self, element, controller )
	local channel = Engine.ChatClient_InputChannelGet( controller )
end

function ChatClientInputStart( self, element, controller, stringArg )
	if not ChatClientIsAvailable( self, element, controller ) then
		return 
	else
		ChatClientInputChannelSet( self, element, controller, stringArg )
		Engine.ChatClient_InputStart( controller )
	end
end

function ChatClientInputChannelSet( self, element, controller, stringArg )
	local channel = CoD.ChatClientUtility.GetChannelFromString( stringArg )
	if channel ~= nil then
		Engine.ChatClient_InputChannelSet( controller, channel )
	end
end

function ChatClientHandleEscape( self, element, controller )
	if not IsPrimaryControllerIndex( controller ) or IsGlobalModelValueTrue( element, controller, "lobbyRoot.hideMenusForGameStart" ) then
		return 
	end
	local shouldHide = false
	local model = CoD.ChatClientUtility.GetMenuInputChannelShowModel()
	if model ~= nil then
		local modelValue = Engine.GetModelValue( model )
		shouldHide = modelValue > 0
	end
	if not shouldHide then
		model = CoD.ChatClientUtility.GetMenuSettingsShowModel()
		if model ~= nil then
			local modelValue = Engine.GetModelValue( model )
			shouldHide = modelValue > 0
		end
	end
	if shouldHide then
		CoD.ChatClientUtility.ResetSettingsMenu()
		CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
	else
		local parent = self:getParent()
		LobbyGoBack( parent, controller )
	end
end

function ChatClientInputArrangeText( self, element, controller )
	if self and self.arrangeText ~= nil then
		self:arrangeText()
		return 
	end
	local parent = self:getParent()
	if parent and parent.arrangeText ~= nil then
		parent:arrangeText()
	end
end

function ChatClientInputTextFieldUpdatePrompt( self, element, controller )
	if Engine.ChatClient_IsChatting( controller ) then
		local channel = Engine.ChatClient_InputChannelGet( controller )
		local channelString = Engine.Localize( Engine.ChatClient_ChannelStringGet( channel ) ) .. ": "
		local channelColor = Engine.ChatClient_ChannelColorGet( controller, channel )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), channelColor )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), channelString )
		return 
	else
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
		if Engine.IsInGame() then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
			return 
		elseif not ChatClientIsAvailable( self, element, controller ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_NOT_AVAILABLE" ) )
			return 
		elseif IsElementInFocus( element ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_ENTER_TO_CHAT" ) )
			return 
		else
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_CLICK_TO_ENTER_CHAT" ) )
		end
	end
end

function ChatClientInputTextFocusChanged( self, element, controller )
	ChatClientInputTextFieldUpdatePrompt( self, element, controller )
end

function ChatClientFilterChannelSet( self, element, controller, stringArg, expressionArg )
	local channel = CoD.ChatClientUtility.GetChannelFromString( stringArg )
	local modelValue = Engine.GetModelValue( expressionArg )
	if channel ~= nil and modelValue ~= nil then
		Engine.ChatClient_FilterChannelSet( controller, channel, modelValue )
	end
end

function ChatClientShowTimestampsSet( self, element, controller, expressionArg )
	local modelValue = Engine.GetModelValue( expressionArg )
	return Engine.ChatClient_ShowTimestampsSet( controller, modelValue )
end

function ChatClientShowChannelSet( self, element, controller, expressionArg )
	local modelValue = Engine.GetModelValue( expressionArg )
	return Engine.ChatClient_ShowChannelSet( controller, modelValue )
end

function ChatClientSettingsHide( self, element, controller )
	CoD.ChatClientUtility.ResetSettingsMenu()
end

function ChatClientInputChannelSelectorHide( self, element, controller )
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientResetState( self, element, controller )
	Engine.ChatClient_ResetState( controller )
end

function ResetControlsToDefault( self, element, controller, menu )
	Engine.Exec( controller, "resetprofilecommon" )
	Engine.Exec( controller, "updategamerprofile" )
	Engine.Exec( controller, "storagereset stats_mp_offline" )
	CoD.OverlayUtility.AddSystemOverlay( "ResetControlsToDefault", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_RESET_TO_DEFAULT_CAPS",
		description = "MENU_RESET_TO_DEFAULTS_SUCCESSFUL",
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.TestPopup_List = DataSourceHelpers.ListSetup( "ResetControlsToDefault_List", function ( controller )
				return {
					{
						models = {
							displayText = "Yes"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetControlsToDefault_List"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "ResetControlsToDefault" )
end

local GetCurrentySelectedLanguage = function ()
	return "english"
end

function ChangeLanguage( self, element, controller, param, menu )
	if param == GetCurrentySelectedLanguage() then
		GoBackAndOpenOverlayOnParent( self, "WelcomeMenuMain", controller )
		return 
	else
		
	end
end

function ChangeAutoScrollStartDelay( element, expr_StartDelayMS )
	element.autoScrollStartDelay = expr_StartDelayMS
end

function ChangeAutoScrollEndDelay( element, expr_EndDelayMS )
	element.autoScrollEndDelay = expr_EndDelayMS
end

function ChangeAutoScrollSpeed( element, expr_Speed )
	element.autoScrollSpeed = expr_Speed
end

function ChangeRightStickScrollSpeed( element, expr_Speed )
	element.rightStickScrollSpeed = expr_Speed
end

function EnableAutoScrolling( element, booleanArg )
	element.allowAutoScrolling = booleanArg
end

function EnableRightStickScrolling( element, booleanArg )
	element.allowRightStickScrolling = booleanArg
end

