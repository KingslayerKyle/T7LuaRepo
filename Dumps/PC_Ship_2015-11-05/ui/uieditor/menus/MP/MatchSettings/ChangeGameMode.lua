require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

DataSources.ChangeGameModeModes = DataSourceHelpers.ListSetup( "ChangeGameModeModes", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Engine.GetGametypesBase()
	local f1_local2 = Engine.DvarString( nil, "ui_gametype" )
	for f1_local6, f1_local7 in pairs( f1_local1 ) do
		if f1_local7.category == "standard" then
			table.insert( f1_local0, {
				models = {
					text = f1_local7.name,
					image = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f1_local7.gametype, "image" ),
					description = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f1_local7.gametype, "description" )
				},
				properties = {
					gametype = f1_local7.gametype,
					selectIndex = f1_local7.gametype == f1_local2
				}
			} )
		end
	end
	return f1_local0
end, true )
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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, true, -45, 35 )
	LeftPanel:setTopBottom( true, true, -43, 102 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
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
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( self, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local gameModeList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gameModeList:makeFocusable()
	gameModeList:setLeftRight( true, false, 67, 347 )
	gameModeList:setTopBottom( true, false, 143, 651 )
	gameModeList:setDataSource( "ChangeGameModeModes" )
	gameModeList:setWidgetType( CoD.List1Button_Playlist )
	gameModeList:setVerticalCount( 15 )
	gameModeList:linkToElementModel( gameModeList, "disabled", true, function ( model )
		local f5_local0 = gameModeList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gameModeList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	gameModeList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( gameModeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			GameModeSelected( element, controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	gameModeList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsParentListInFocus( element ) then
					f10_local0 = IsDisabled( element, controller )
				else
					f10_local0 = false
				end
				return f10_local0
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
		self:updateElementState( gameModeList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( gameModeList )
	self.gameModeList = gameModeList
	
	local gameModeInfo = CoD.matchSettingsInfo.new( self, controller )
	gameModeInfo:setLeftRight( true, false, 600, 1050 )
	gameModeInfo:setTopBottom( true, false, 143, 693 )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	gameModeInfo:linkToElementModel( gameModeList, nil, false, function ( model )
		gameModeInfo:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
				gameModeList:completeAnimation()
				self.gameModeList:setAlpha( 1 )
				self.clipFinished( gameModeList, {} )
				gameModeInfo:completeAnimation()
				self.gameModeInfo:setAlpha( 1 )
				self.clipFinished( gameModeInfo, {} )
			end
		}
	}
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f16_local0 = nil
		SetElementStateByElementName( self, "frame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "frame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f16_local0 then
			f16_local0 = self:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	frame:setModel( self.buttonModel, controller )
	gameModeList.id = "gameModeList"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.frame:close()
		element.gameModeList:close()
		element.gameModeInfo:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

