require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CustomGames.CustomGameOfficial" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot", false )
	Engine.CreateModel( rootModel, "dirty", false )
end

local ChangeGameModeModesPrepare = function ( controller )
	local gameModesList = {}
	local gameModes = Engine.GetGametypesBase()
	local currentGameMode = Engine.GetDvarString( "ui_gametype" )
	if IsLive() then
		CoD.FileshareUtility.SetCurrentCategory( "customgame" )
		table.insert( gameModesList, {
			models = {
				text = Engine.Localize( "MENU_TAB_COMMUNITY_CAPS" ),
				buttonText = Engine.Localize( "MENU_TAB_COMMUNITY_CAPS" ),
				image = "uie_t7_mp_icon_header_customgames_large",
				description = Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" )
			},
			properties = {
				community = true
			}
		} )
		table.insert( gameModesList, {
			models = {
				text = Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ),
				buttonText = Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ),
				image = "uie_t7_mp_icon_header_customgames_large",
				description = Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ),
				category = "customgame"
			},
			properties = {
				showcase = true
			}
		} )
	end
	for index, gameMode in pairs( gameModes ) do
		if gameMode.category == "standard" then
			local gameTypeInfo = Engine.GetGameTypeInfo( gameMode.gametype )
			table.insert( gameModesList, {
				models = {
					text = Engine.Localize( gameMode.name ),
					buttonText = Engine.Localize( gameMode.name ),
					image = gameTypeInfo.image,
					description = Engine.Localize( gameTypeInfo.descriptionRef )
				},
				properties = {
					gametype = gameMode.gametype,
					selectIndex = gameMode.gametype == currentGameMode
				}
			} )
		end
	end
	return gameModesList
end

DataSources.ChangeGameModeModes = DataSourceHelpers.ListSetup( "ChangeGameModeModes", ChangeGameModeModesPrepare, true )
LUI.createMenu.ChangeGameMode = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChangeGameMode" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 1, -68, 52 )
	LeftPanel:setTopBottom( 0, 1, -65, 153 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	FadeForStreamer:setLeftRight( 0, 0, 0, 1920 )
	FadeForStreamer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( self, controller )
	frame:setLeftRight( 0, 1, 0, 0 )
	frame:setTopBottom( 0, 1, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local gameModeList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gameModeList:makeFocusable()
	gameModeList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller ) and IsMenuInState( menu, "Secondary" )
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return IsMenuInState( menu, "Secondary" )
			end
		}
	} )
	gameModeList:linkToElementModel( gameModeList, "disabled", true, function ( model )
		self:updateElementState( gameModeList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	gameModeList:setLeftRight( 0, 0, 96, 516 )
	gameModeList:setTopBottom( 0, 0, 175, 923 )
	gameModeList:setWidgetType( CoD.List1Button_Playlist )
	gameModeList:setVerticalCount( 15 )
	gameModeList:setDataSource( "ChangeGameModeModes" )
	gameModeList:linkToElementModel( gameModeList, "disabled", true, function ( model )
		local element = gameModeList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gameModeList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		return retVal
	end )
	gameModeList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetCurrentUIGameType( element, controller )
		SetElementModelToFocusedElementModel( self, element, "gameModeInfo" )
		return retVal
	end )
	gameModeList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	gameModeList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( gameModeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsElementPropertyValue( element, "showcase", true ) then
			CustomGamesOpenMyShowcase( self, controller )
			return true
		elseif IsMenuInState( menu, "DefaultState" ) then
			SetState( self, "Secondary" )
			SetLoseFocusToElement( self, "gameModeList", controller )
			MakeElementNotFocusable( self, "gameModeList", controller )
			MakeElementFocusable( self, "gamesList", controller )
			SetFocusToElement( self, "gamesList", controller )
			UpdateSelfElementState( menu, self.gameModeList, controller )
			return true
		elseif not IsDisabled( element, controller ) and AlwaysFalse() then
			GameModeSelected( element, controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if IsElementPropertyValue( element, "showcase", true ) then
			return true
		elseif IsMenuInState( menu, "DefaultState" ) then
			return true
		elseif not IsDisabled( element, controller ) and AlwaysFalse() then
			return true
		else
			return false
		end
	end, true )
	self:addElement( gameModeList )
	self.gameModeList = gameModeList
	
	local gamesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gamesList:makeFocusable()
	gamesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	gamesList:linkToElementModel( gamesList, "disabled", true, function ( model )
		self:updateElementState( gamesList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	gamesList:setLeftRight( 0, 0, 562, 982 )
	gamesList:setTopBottom( 0, 0, 175, 923 )
	gamesList:setWidgetType( CoD.List1Button_Playlist )
	gamesList:setVerticalCount( 15 )
	gamesList:setDataSource( "CustomGamesList" )
	gamesList:linkToElementModel( gamesList, "disabled", true, function ( model )
		local element = gamesList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gamesList:linkToElementModel( gamesList, "isOfficial", true, function ( model )
		local element = gamesList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOfficial"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	gamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetSelectedCustomGame( element, controller )
		CustomGameSelectorLoseFocus( self, element, controller, self )
		UpdateElementState( self, "CustomGameOfficial", controller )
		SetElementModelToFocusedElementModel( self, element, "gameModeInfo" )
		return retVal
	end )
	gamesList:registerEventHandler( "lose_list_focus", function ( element, event )
		local retVal = nil
		UpdateElementState( self, "CustomGameOfficial", controller )
		return retVal
	end )
	gamesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	gamesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( gamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsCustomGameCommunityOption() then
			ProcessListAction( self, element, controller )
			return true
		elseif not IsDisabled( element, controller ) then
			LoadCustomGame( element, controller )
			SetCurrentCustomGame( element, controller )
			GameModeSelected( element, controller )
			SetPrimaryControllerPerControllerTableProperty( "gamesettingsUpdated", true )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsCustomGameCommunityOption() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( gamesList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isOfficial" ) then
			CustomGamesOpenOptions( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isOfficial" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	gamesList:subscribeToGlobalModel( controller, "CustomGamesRoot", "dirty", function ( model )
		local element = gamesList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( gamesList )
	self.gamesList = gamesList
	
	local gameModeInfo = CoD.matchSettingsInfo.new( self, controller )
	gameModeInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	gameModeInfo:setLeftRight( 0, 0, 1030.5, 1705.5 )
	gameModeInfo:setTopBottom( 0, 0, 214.5, 1039.5 )
	gameModeInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	self:addElement( gameModeInfo )
	self.gameModeInfo = gameModeInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CustomGameOfficial = CoD.CustomGameOfficial.new( self, controller )
	CustomGameOfficial:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f31_local0 = IsCustomMPLobby()
				if f31_local0 then
					f31_local0 = IsSelfModelValueTrue( element, controller, "isOfficial" )
					if f31_local0 then
						f31_local0 = IsWidgetInFocus( self, "gamesList", event )
					end
				end
				return f31_local0
			end
		}
	} )
	CustomGameOfficial:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( CustomGameOfficial, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CustomGameOfficial:linkToElementModel( CustomGameOfficial, "isOfficial", true, function ( model )
		self:updateElementState( CustomGameOfficial, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOfficial"
		} )
	end )
	CustomGameOfficial:setLeftRight( 0, 0, 1030.5, 1225.5 )
	CustomGameOfficial:setTopBottom( 0, 0, 923, 953 )
	self:addElement( CustomGameOfficial )
	self.CustomGameOfficial = CustomGameOfficial
	
	gameModeInfo:linkToElementModel( gameModeList, nil, false, function ( model )
		gameModeInfo:setModel( model, controller )
	end )
	CustomGameOfficial:linkToElementModel( gamesList, nil, false, function ( model )
		CustomGameOfficial:setModel( model, controller )
	end )
	gameModeList.navigation = {
		right = gamesList
	}
	gamesList.navigation = {
		left = gameModeList
	}
	self.resetProperties = function ()
		gamesList:completeAnimation()
		gamesList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				gamesList:completeAnimation()
				self.gamesList:setAlpha( 0 )
				self.clipFinished( gamesList, {} )
			end
		},
		Secondary = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "frame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "frame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeElementNotFocusable( self, "gamesList", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "Secondary" ) then
			SetElementState( self, element, controller, "DefaultState" )
			SetState( self, "DefaultState" )
			UpdateSelfElementState( menu, self.gameModeList, controller )
			SetLoseFocusToElement( self, "gamesList", controller )
			MakeElementNotFocusable( self, "gamesList", controller )
			MakeElementFocusable( self, "gameModeList", controller )
			SetFocusToElement( self, "gameModeList", controller )
			return true
		else
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, true )
	frame:setModel( self.buttonModel, controller )
	gameModeList.id = "gameModeList"
	gamesList.id = "gamesList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.gameModeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.frame:close()
		self.gameModeList:close()
		self.gamesList:close()
		self.gameModeInfo:close()
		self.FEMenuLeftGraphics:close()
		self.CustomGameOfficial:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

