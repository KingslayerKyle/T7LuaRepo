require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )

local PostMouse = function ( self, controller )
	if not CoD.useMouse then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
			if IsSelfInState( self, "SelectingMap" ) then
				self.mapList:setMouseDisabled( false )
				self.mapCategoriesList:setMouseDisabled( true )
				self.m_categorySet = false
			else
				self.mapList:setMouseDisabled( true )
				self.mapCategoriesList:setMouseDisabled( false )
			end
		end )
		self.mapList:setMouseDisabled( true )
		self.mapList:registerEventHandler( "leftclick_outside", function ( element, event )
			if IsSelfInState( self, "SelectingMap" ) and self.m_categorySet then
				CoD.PCUtil.SimulateButtonPress( controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			end
			self.m_categorySet = true
			return true
		end )
	end
end

local PostLoadFunc = function ( self, controller )
	PostMouse( self, controller )
end

local ChangeMapCategoriesPrepare = function ( controller )
	local categories = {}
	local categoryMapPackTypeIndex = CoD.BaseUtility.GetMapValue( Engine.GetDvarString( "ui_mapname" ), "dlc_pack", Enum.dlcIndex_t.CONTENT_ORIGINAL_MAP_INDEX )
	local createMapCategory = function ( categoryName, categoryType )
		return {
			models = {
				text = Engine.Localize( "MPUI_MAP_CATEGORY_" .. categoryName .. "_CAPS" ),
				buttonText = Engine.Localize( "MPUI_MAP_CATEGORY_" .. categoryName .. "_CAPS" ),
				image = "playlist_map",
				description = Engine.Localize( "MPUI_MAP_CATEGORY_" .. categoryName .. "_DESC" )
			},
			properties = {
				category = categoryType,
				selectIndex = categoryMapPackTypeIndex == categoryType
			}
		}
	end
	
	CoD.mapsTable = Engine.GetGDTMapsTable()
	local hasAnyDLCMaps = function ()
		for id, mapData in pairs( CoD.mapsTable ) do
			if mapData.session_mode == CoD.gameModeEnum and mapData.dlc_pack > 0 and (ShowPurchasableMap( controller, id ) or Engine.IsMapValid( id )) then
				return true
			end
		end
		return false
	end
	
	if CoD.isCampaign == true then
		table.insert( categories, createMapCategory( "missions", Enum.dlcIndex_t.CONTENT_ORIGINAL_MAP_INDEX ) )
		table.insert( categories, createMapCategory( "dev", Enum.dlcIndex_t.CONTENT_DEV_MAP_INDEX ) )
	else
		table.insert( categories, createMapCategory( "standard", Enum.dlcIndex_t.CONTENT_ORIGINAL_MAP_INDEX ) )
		if not Dvar.ui_execdemo:get() and hasAnyDLCMaps() then
			table.insert( categories, createMapCategory( "dlc", nil ) )
		end
	end
	return categories
end

DataSources.ChangeMapCategories = DataSourceHelpers.ListSetup( "ChangeMapCategories", ChangeMapCategoriesPrepare, true )
local ChangeMapMapsPrepare = function ( controller, list )
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
		elseif not Engine.IsMapValid( m ) and not ShowPurchasableMap( controller, m ) then
			return false
		else
			local f12_local0
			if CoD.mapsTable[m].dlc_pack ~= CoD.perController[controller].mapCategory and (CoD.mapsTable[m].dlc_pack <= 0 or CoD.perController[controller].mapCategory ~= nil) then
				f12_local0 = false
			else
				local shouldAddMap = true
			end
		end
		if Dvar.ui_execdemo:get() and f12_local0 then
			f12_local0 = isMapInDemo( m )
		end
		if Engine.IsMpStillDownloading() and f12_local0 then
			f12_local0 = isMapInInitial( m )
		end
		if IsFreeRunMap( m ) then
			return false
		end
		return f12_local0
	end
	
	local maps = CoD.mapsTable
	local isOffline = Engine.SessionModeIsMode( Enum.eNetworkModes.MODE_NETWORK_OFFLINE )
	local index = 1
	local currentMap = Engine.GetDvarString( "ui_mapname" )
	if isOffline == false then
		for id, map in LUI.IterateTableBySortedKeys( maps, sortMaps, filterMaps ) do
			local f8_local4 = table.insert
			local f8_local5 = mapsList
			local f8_local6 = {
				models = {
					text = Engine.Localize( map.mapName ),
					buttonText = Engine.Localize( CoD.StoreUtility.PrependPurchaseIconIfNeeded( controller, id, map.mapName ) ),
					image = map.previewImage,
					description = Engine.Localize( CoD.StoreUtility.AddUpsellToDescriptionIfNeeded( controller, id, map.mapDescription ) )
				}
			}
			local f8_local7 = {
				mapName = id,
				selectIndex = id == currentMap
			}
			local f8_local3 = Engine.IsMpStillDownloading()
			if f8_local3 then
				f8_local3 = not map.isFreeRunMap
			end
			f8_local7.disabled = f8_local3
			f8_local7.purchasable = not Engine.IsMapValid( id )
			f8_local6.properties = f8_local7
			f8_local4( f8_local5, f8_local6 )
		end
	end
	CoD.StoreUtility.AddListDLCListener( list )
	return mapsList
end

DataSources.ChangeMapMaps = DataSourceHelpers.ListSetup( "ChangeMapMaps", ChangeMapMapsPrepare, true )
LUI.createMenu.ChangeMap = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChangeMap" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeMap.buttonPrompts" )
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
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local mapCategoriesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapCategoriesList:makeFocusable()
	mapCategoriesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				return IsMenuInState( menu, "SelectingMap" ) and IsDisabled( element, controller )
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return IsMenuInState( menu, "SelectingMap" )
			end
		}
	} )
	mapCategoriesList:linkToElementModel( mapCategoriesList, "disabled", true, function ( model )
		self:updateElementState( mapCategoriesList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	mapCategoriesList:setLeftRight( 0, 0, 100, 520 )
	mapCategoriesList:setTopBottom( 0, 0, 216, 464 )
	mapCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	mapCategoriesList:setVerticalCount( 5 )
	mapCategoriesList:setDataSource( "ChangeMapCategories" )
	mapCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	mapCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( mapCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetElementPropertyOnPerControllerTable( controller, "mapCategory", element, "category" )
		UpdateElementDataSource( self, "mapList" )
		SetMenuState( menu, "SelectingMap" )
		SetLoseFocusToElement( self, "mapCategoriesList", controller )
		MakeElementNotFocusable( self, "mapCategoriesList", controller )
		MakeElementFocusable( self, "mapList", controller )
		SetFocusToElement( self, "mapList", controller )
		PlaySoundSetSound( self, "list_action" )
		UpdateSelfElementState( menu, self.mapCategoriesList, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( mapCategoriesList )
	self.mapCategoriesList = mapCategoriesList
	
	local mapList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapList:makeFocusable()
	mapList:mergeStateConditions( {
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
	mapList:linkToElementModel( mapList, "disabled", true, function ( model )
		self:updateElementState( mapList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	mapList:setLeftRight( 0, 0, 430, 850 )
	mapList:setTopBottom( 0, 0, 222, 970 )
	mapList:setWidgetType( CoD.List1Button_Playlist )
	mapList:setVerticalCount( 15 )
	mapList:setDataSource( "ChangeMapMaps" )
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
		if not IsElementPropertyValue( element, "purchasable", true ) then
			MapSelected( element, controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			PlaySoundSetSound( self, "action" )
			return true
		else
			OpenPurchaseMapPackConfirmation( controller, element, menu )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( mapList )
	self.mapList = mapList
	
	local categoryInfo = CoD.matchSettingsInfo.new( self, controller )
	categoryInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	categoryInfo:setLeftRight( 0, 0, 900.5, 1575.5 )
	categoryInfo:setTopBottom( 0, 0, 214.5, 1039.5 )
	categoryInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
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
	mapInfo:setTopBottom( 0, 0, 215, 1179 )
	mapInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	self:addElement( mapInfo )
	self.mapInfo = mapInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	categoryInfo:linkToElementModel( mapCategoriesList, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	mapInfo:linkToElementModel( mapList, nil, false, function ( model )
		mapInfo:setModel( model, controller )
	end )
	mapCategoriesList.navigation = {
		right = mapList,
		down = mapList
	}
	mapList.navigation = {
		left = mapCategoriesList,
		up = mapCategoriesList
	}
	self.resetProperties = function ()
		mapList:completeAnimation()
		mapInfo:completeAnimation()
		categoryInfo:completeAnimation()
		mapList:setAlpha( 1 )
		mapInfo:setLeftRight( 0, 0, 900, 1824 )
		mapInfo:setTopBottom( 0, 0, 215, 1179 )
		mapInfo:setAlpha( 1 )
		categoryInfo:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				mapList:completeAnimation()
				self.mapList:setAlpha( 0 )
				self.clipFinished( mapList, {} )
				mapInfo:completeAnimation()
				self.mapInfo:setAlpha( 0 )
				self.clipFinished( mapInfo, {} )
			end
		},
		SelectingMap = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 0 )
				self.clipFinished( categoryInfo, {} )
				mapInfo:completeAnimation()
				self.mapInfo:setLeftRight( 0, 0, 900, 1824 )
				self.mapInfo:setTopBottom( 0, 0, 214, 1156 )
				self.clipFinished( mapInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeElementNotFocusable( self, "mapList", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			GoBack( self, controller )
			return true
		else
			SetPerControllerTableProperty( controller, "mapCategory", nil )
			SetMenuState( menu, "DefaultState" )
			SetLoseFocusToElement( self, "mapList", controller )
			MakeElementNotFocusable( self, "mapList", controller )
			MakeElementFocusable( self, "mapCategoriesList", controller )
			SetFocusToElement( self, "mapCategoriesList", controller )
			PlaySoundSetSound( self, "menu_go_back" )
			UpdateSelfElementState( menu, self.mapCategoriesList, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	frame:setModel( self.buttonModel, controller )
	mapCategoriesList.id = "mapCategoriesList"
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
		self.mapCategoriesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.frame:close()
		self.mapCategoriesList:close()
		self.mapList:close()
		self.categoryInfo:close()
		self.mapInfo:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeMap.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

