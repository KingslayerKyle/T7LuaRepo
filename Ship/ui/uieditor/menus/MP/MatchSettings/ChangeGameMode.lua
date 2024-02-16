-- 632c9b0af46410ba10c3de04c08bcb63
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CustomGames.CustomGameOfficial" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot", false ), "dirty", false )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.originalOcclusionChange = f2_arg0.m_eventHandlers.occlusion_change
	f2_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetShowCreateButton( false )
		end
		element:originalOcclusionChange( event )
	end )
end

DataSources.ChangeGameModeModes = DataSourceHelpers.ListSetup( "ChangeGameModeModes", function ( f4_arg0 )
	local f4_local0 = {}
	local f4_local1 = Engine.GetGametypesBase()
	local f4_local2 = Engine.DvarString( nil, "ui_gametype" )
	if IsLive() then
		CoD.FileshareUtility.SetCurrentCategory( "customgame" )
		table.insert( f4_local0, {
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
		table.insert( f4_local0, {
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
	for f4_local6, f4_local7 in pairs( f4_local1 ) do
		if f4_local7.category == "standard" and CoD.AllowGameType( f4_local7.gametype ) then
			table.insert( f4_local0, {
				models = {
					text = Engine.Localize( f4_local7.name ),
					buttonText = Engine.Localize( f4_local7.name ),
					image = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f4_local7.gametype, "image" ),
					description = Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f4_local7.gametype, "description" ) )
				},
				properties = {
					gametype = f4_local7.gametype,
					selectIndex = f4_local7.gametype == f4_local2
				}
			} )
		end
	end
	return f4_local0
end, true )
local f0_local2 = function ( f5_arg0, f5_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f5_arg0, "setState", function ( element, controller )
		if IsSelfInState( f5_arg0, "Secondary" ) then
			f5_arg0.gameModeList:setMouseDisabled( true )
			f5_arg0.gamesList:setMouseDisabled( false )
			f5_arg0.m_modeSet = false
		else
			f5_arg0.gameModeList:setMouseDisabled( false )
			f5_arg0.gamesList:setMouseDisabled( true )
		end
	end )
	f5_arg0.gamesList:setMouseDisabled( true )
	f5_arg0.gamesList:registerEventHandler( "leftclick_outside", function ( element, event )
		if IsSelfInState( f5_arg0, "Secondary" ) and f5_arg0.m_modeSet then
			CoD.PCUtil.SimulateButtonPress( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		end
		f5_arg0.m_modeSet = true
		return true
	end )
end

local PostLoadFunc = function ( f8_arg0, f8_arg1 )
	if CoD.isPC then
		f0_local2( f8_arg0, f8_arg1 )
	end
	f0_local1( f8_arg0, f8_arg1 )
end

LUI.createMenu.ChangeGameMode = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChangeGameMode" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" )
	local f9_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f9_local1, controller )
	LeftPanel:setLeftRight( true, true, -45, 35 )
	LeftPanel:setTopBottom( true, true, -43, 102 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f9_local1, controller )
	FadeForStreamer:setLeftRight( true, false, 0, 1280 )
	FadeForStreamer:setTopBottom( true, false, 0, 720 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		f9_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f9_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( f9_local1, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local gameModeList = LUI.UIList.new( f9_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gameModeList:makeFocusable()
	gameModeList:setLeftRight( true, false, 64, 344 )
	gameModeList:setTopBottom( true, false, 109, 651 )
	gameModeList:setWidgetType( CoD.List1Button_Playlist )
	gameModeList:setVerticalCount( 16 )
	gameModeList:setDataSource( "ChangeGameModeModes" )
	gameModeList:linkToElementModel( gameModeList, "disabled", true, function ( model )
		local f12_local0 = gameModeList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gameModeList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		return nil
	end )
	gameModeList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f14_local0 = nil
		SetCurrentUIGameType( element, controller )
		SetElementModelToFocusedElementModel( self, element, "gameModeInfo" )
		return f14_local0
	end )
	gameModeList:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f15_local0
	end )
	gameModeList:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	f9_local1:AddButtonCallbackFunction( gameModeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if IsElementPropertyValue( f17_arg0, "showcase", true ) then
			CustomGamesOpenMyShowcase( self, f17_arg2 )
			return true
		elseif IsMenuInState( f17_arg1, "DefaultState" ) then
			SetState( self, "Secondary" )
			SetLoseFocusToElement( self, "gameModeList", f17_arg2 )
			MakeElementNotFocusable( self, "gameModeList", f17_arg2 )
			MakeElementFocusable( self, "gamesList", f17_arg2 )
			SetFocusToElement( self, "gamesList", f17_arg2 )
			return true
		elseif not IsDisabled( f17_arg0, f17_arg2 ) and AlwaysFalse() then
			GameModeSelected( f17_arg0, f17_arg2 )
			GoBack( self, f17_arg2 )
			ClearSavedState( self, f17_arg2 )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsElementPropertyValue( f18_arg0, "showcase", true ) then
			return true
		elseif IsMenuInState( f18_arg1, "DefaultState" ) then
			return true
		elseif not IsDisabled( f18_arg0, f18_arg2 ) and AlwaysFalse() then
			return true
		else
			return false
		end
	end, true )
	gameModeList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f19_local0
				if not IsParentListInFocus( element ) then
					f19_local0 = IsDisabled( element, controller )
				else
					f19_local0 = false
				end
				return f19_local0
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	gameModeList:linkToElementModel( gameModeList, "disabled", true, function ( model )
		f9_local1:updateElementState( gameModeList, {
			name = "model_validation",
			menu = f9_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( gameModeList )
	self.gameModeList = gameModeList
	
	local gamesList = LUI.UIList.new( f9_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gamesList:makeFocusable()
	gamesList:setLeftRight( true, false, 375, 655 )
	gamesList:setTopBottom( true, false, 109, 651 )
	gamesList:setWidgetType( CoD.List1Button_Playlist )
	gamesList:setVerticalCount( 16 )
	gamesList:setDataSource( "CustomGamesList" )
	gamesList:linkToElementModel( gamesList, "disabled", true, function ( model )
		local f22_local0 = gamesList
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gamesList:linkToElementModel( gamesList, "isOfficial", true, function ( model )
		local f23_local0 = gamesList
		local f23_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOfficial"
		}
		CoD.Menu.UpdateButtonShownState( f23_local0, f9_local1, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	gamesList:linkToElementModel( gamesList, "isCommunityOption", true, function ( model )
		local f24_local0 = gamesList
		local f24_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isCommunityOption"
		}
		CoD.Menu.UpdateButtonShownState( f24_local0, f9_local1, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	gamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f25_local0 = nil
		SetSelectedCustomGame( element, controller )
		CustomGameSelectorLoseFocus( self, element, controller, f9_local1 )
		UpdateElementState( self, "CustomGameOfficial", controller )
		SetElementModelToFocusedElementModel( self, element, "gameModeInfo" )
		return f25_local0
	end )
	gamesList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f26_local0 = nil
		UpdateElementState( self, "CustomGameOfficial", controller )
		return f26_local0
	end )
	gamesList:registerEventHandler( "gain_focus", function ( element, event )
		local f27_local0 = nil
		if element.gainFocus then
			f27_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f27_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f9_local1, controller, Enum.LUIButton.LUI_KEY_START )
		return f27_local0
	end )
	gamesList:registerEventHandler( "lose_focus", function ( element, event )
		local f28_local0 = nil
		if element.loseFocus then
			f28_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f28_local0 = element.super:loseFocus( event )
		end
		return f28_local0
	end )
	f9_local1:AddButtonCallbackFunction( gamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		if IsCustomGameCommunityOption() then
			ProcessListAction( self, f29_arg0, f29_arg2 )
			return true
		elseif not IsDisabled( f29_arg0, f29_arg2 ) then
			LoadCustomGame( f29_arg0, f29_arg2 )
			SetCurrentCustomGame( f29_arg0, f29_arg2 )
			GameModeSelected( f29_arg0, f29_arg2 )
			SetPrimaryControllerPerControllerTableProperty( "gamesettingsUpdated", true )
			GoBack( self, f29_arg2 )
			ClearSavedState( self, f29_arg2 )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		if IsCustomGameCommunityOption() then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsDisabled( f30_arg0, f30_arg2 ) then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	f9_local1:AddButtonCallbackFunction( gamesList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if not IsSelfModelValueTrue( f31_arg0, f31_arg2, "isOfficial" ) and not IsSelfModelValueTrue( f31_arg0, f31_arg2, "isCommunityOption" ) then
			CustomGamesOpenOptions( self, f31_arg2, f31_arg1 )
			return true
		else
			
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		if not IsSelfModelValueTrue( f32_arg0, f32_arg2, "isOfficial" ) and not IsSelfModelValueTrue( f32_arg0, f32_arg2, "isCommunityOption" ) then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	gamesList:subscribeToGlobalModel( controller, "CustomGamesRoot", "dirty", function ( model )
		UpdateDataSource( self, gamesList, controller )
	end )
	gamesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f34_local0
				if not IsParentListInFocus( element ) then
					f34_local0 = IsDisabled( element, controller )
				else
					f34_local0 = false
				end
				return f34_local0
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	gamesList:linkToElementModel( gamesList, "disabled", true, function ( model )
		f9_local1:updateElementState( gamesList, {
			name = "model_validation",
			menu = f9_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( gamesList )
	self.gamesList = gamesList
	
	local gameModeInfo = CoD.matchSettingsInfo.new( f9_local1, controller )
	gameModeInfo:setLeftRight( true, false, 687, 1137 )
	gameModeInfo:setTopBottom( true, false, 109, 659 )
	gameModeInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	gameModeInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( gameModeInfo )
	self.gameModeInfo = gameModeInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f9_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CustomGameOfficial = CoD.CustomGameOfficial.new( f9_local1, controller )
	CustomGameOfficial:setLeftRight( true, false, 687, 817 )
	CustomGameOfficial:setTopBottom( true, false, 615.53, 635.53 )
	CustomGameOfficial:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f38_local0 = IsCustomMPLobby()
				if f38_local0 then
					f38_local0 = IsSelfModelValueTrue( element, controller, "isOfficial" )
					if f38_local0 then
						f38_local0 = IsWidgetInFocus( self, "gamesList", event )
					end
				end
				return f38_local0
			end
		}
	} )
	CustomGameOfficial:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		f9_local1:updateElementState( CustomGameOfficial, {
			name = "model_validation",
			menu = f9_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CustomGameOfficial:linkToElementModel( CustomGameOfficial, "isOfficial", true, function ( model )
		f9_local1:updateElementState( CustomGameOfficial, {
			name = "model_validation",
			menu = f9_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOfficial"
		} )
	end )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
				gameModeList:completeAnimation()
				self.gameModeList:setAlpha( 1 )
				self.clipFinished( gameModeList, {} )
				gamesList:completeAnimation()
				self.gamesList:setAlpha( 0 )
				self.clipFinished( gamesList, {} )
				gameModeInfo:completeAnimation()
				self.gameModeInfo:setAlpha( 1 )
				self.clipFinished( gameModeInfo, {} )
			end
		},
		Secondary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamesList:completeAnimation()
				self.gamesList:setAlpha( 1 )
				self.clipFinished( gamesList, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f9_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f45_local0 = nil
		SetElementStateByElementName( self, "frame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "frame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f45_local0 then
			f45_local0 = element:dispatchEventToChildren( event )
		end
		return f45_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f46_local0 = nil
		MakeElementNotFocusable( self, "gamesList", controller )
		if not f46_local0 then
			f46_local0 = element:dispatchEventToChildren( event )
		end
		return f46_local0
	end )
	f9_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		if IsMenuInState( f47_arg1, "Secondary" ) then
			SetElementState( self, f47_arg0, f47_arg2, "DefaultState" )
			SetState( self, "DefaultState" )
			SetLoseFocusToElement( self, "gamesList", f47_arg2 )
			MakeElementNotFocusable( self, "gamesList", f47_arg2 )
			MakeElementFocusable( self, "gameModeList", f47_arg2 )
			SetFocusToElement( self, "gameModeList", f47_arg2 )
			return true
		else
			GoBack( self, f47_arg2 )
			ClearSavedState( self, f47_arg2 )
			return true
		end
	end, function ( f48_arg0, f48_arg1, f48_arg2 )
		CoD.Menu.SetButtonLabel( f48_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f9_local1
	} )
	if not self:restoreState() then
		self.gameModeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.frame:close()
		element.gameModeList:close()
		element.gamesList:close()
		element.gameModeInfo:close()
		element.FEMenuLeftGraphics:close()
		element.CustomGameOfficial:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

