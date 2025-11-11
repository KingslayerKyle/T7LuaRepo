require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )

local PlaylistModesPrepare = function ( controller )
	local mapsList = {}
	local demoBuildMaps = {
		mp_sector = 1,
		mp_apartments = 2,
		mp_ethiopia = 3,
		mp_stronghold = 4
	}
	local initialMaps = {
		mp_freerun_01 = 1,
		mp_freerun_02 = 2,
		mp_freerun_03 = 3,
		mp_freerun_04 = 4
	}
	local isMapInDemo = function ( mapName )
		return demoBuildMaps[mapName] ~= nil
	end
	
	local isMapInInitial = function ( mapName )
		return initialMaps[mapName] ~= nil
	end
	
	local sortMaps = function ( a, b )
		if Dvar.ui_execdemo:get() then
			if isMapInDemo( a ) and isMapInDemo( a ) then
				return demoBuildMaps[a] < demoBuildMaps[b]
			else
				
			end
		else
			return CoD.mapsTable[a].unique_id < CoD.mapsTable[b].unique_id
		end
	end
	
	local filterMaps = function ( m )
		if CoD.gameModeEnum ~= CoD.mapsTable[m].session_mode then
			return false
		end
		local shouldAddMap = true
		if Dvar.ui_execdemo:get() and shouldAddMap then
			shouldAddMap = isMapInDemo( m )
		end
		if Engine.IsMpStillDownloading() and shouldAddMap then
			shouldAddMap = isMapInInitial( m )
		end
		if not IsFreeRunMap( m ) then
			return false
		end
		return shouldAddMap
	end
	
	local maps = CoD.mapsTable
	local index = 1
	local currentMap = Engine.GetDvarString( "ui_mapname" )
	for id, map in LUI.IterateTableBySortedKeys( maps, sortMaps, filterMaps ) do
		local f1_local4 = table.insert
		local f1_local5 = mapsList
		local f1_local6 = {
			models = {
				text = Engine.Localize( map.mapName ),
				buttonText = Engine.Localize( map.mapName ),
				image = map.previewImage,
				description = Engine.Localize( map.mapDescription ),
				location = map.mapLocation,
				bestTime = CoD.MapUtility.GetBestTimeForFreerunMap( controller, id )
			}
		}
		local f1_local7 = {
			mapName = id,
			selectIndex = id == currentMap
		}
		local f1_local3 = Engine.IsMpStillDownloading()
		if f1_local3 then
			f1_local3 = not map.isFreeRunMap
		end
		f1_local7.disabled = f1_local3
		f1_local6.properties = f1_local7
		f1_local4( f1_local5, f1_local6 )
	end
	return mapsList
end

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

DataSources.FreerunPlaylist = DataSourceHelpers.ListSetup( "FreerunPlaylist", PlaylistModesPrepare, true )
LUI.createMenu.Freerun_ChangeMap = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Freerun_ChangeMap" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Freerun_ChangeMap.buttonPrompts" )
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
	frame.titleLabel:setText( Engine.Localize( "MENU_CHANGE_COURSE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHANGE_COURSE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local mapList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapList:makeFocusable()
	mapList:mergeStateConditions( {
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
	mapList:linkToElementModel( mapList, "disabled", true, function ( model )
		self:updateElementState( mapList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	mapList:setLeftRight( 0, 0, 105, 525 )
	mapList:setTopBottom( 0, 0, 220, 968 )
	mapList:setWidgetType( CoD.List1Button_Playlist )
	mapList:setVerticalCount( 15 )
	mapList:setDataSource( "FreerunPlaylist" )
	mapList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	mapList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( mapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		MapSelected( element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		PlaySoundSetSound( self, "action" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( mapList )
	self.mapList = mapList
	
	local mapInfo = CoD.matchSettingsInfo.new( self, controller )
	mapInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	mapInfo:setLeftRight( 0, 0, 900, 1824 )
	mapInfo:setTopBottom( 0, 0, 215, 1181 )
	mapInfo.Description:setAlpha( 0 )
	self:addElement( mapInfo )
	self.mapInfo = mapInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	mapInfo:linkToElementModel( mapList, nil, false, function ( model )
		mapInfo:setModel( model, controller )
	end )
	mapInfo:linkToElementModel( mapList, "bestTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			mapInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	frame:setModel( self.buttonModel, controller )
	mapList.id = "mapList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.mapList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.frame:close()
		self.mapList:close()
		self.mapInfo:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Freerun_ChangeMap.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

