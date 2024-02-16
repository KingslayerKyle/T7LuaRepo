require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local ChangeMapCategoriesPrepare = function ( controller )
	local categories = {}
	local categoryMapPackTypeIndex = CoD.GetMapValue( Engine.DvarString( nil, "ui_mapname" ), "dlc_pack", CoD.CONTENT_ORIGINAL_MAP_INDEX )
	local createMapCategory = function ( categoryName, categoryType )
		return {
			models = {
				text = "MPUI_MAP_CATEGORY_" .. categoryName .. "_CAPS",
				image = "playlist_map",
				description = "MPUI_MAP_CATEGORY_" .. categoryName .. "_DESC"
			},
			properties = {
				category = categoryType,
				selectIndex = categoryMapPackTypeIndex == categoryType
			}
		}
	end
	
	local hasAnyDLCMaps = function ()
		for _, mapData in pairs( CoD.mapsTable ) do
			if mapData.session_mode == CoD.gameModeEnum and REG4.dlc_pack > 0 then
				return true
			end
		end
		return false
	end
	
	if CoD.isCampaign == true then
		table.insert( categories, createMapCategory( "missions", CoD.CONTENT_ORIGINAL_MAP_INDEX ) )
		table.insert( categories, createMapCategory( "dev", CoD.CONTENT_DEV_MAP_INDEX ) )
	else
		table.insert( categories, createMapCategory( "standard", CoD.CONTENT_ORIGINAL_MAP_INDEX ) )
		if not Dvar.ui_execdemo:get() and hasAnyDLCMaps() then
			table.insert( categories, createMapCategory( "dlc", nil ) )
		end
	end
	return categories
end

DataSources.ChangeMapCategories = DataSourceHelpers.ListSetup( "ChangeMapCategories", ChangeMapCategoriesPrepare, true )
local ChangeMapMapsPrepare = function ( controller )
	local mapsList = {}
	local demoBuildMaps = {
		mp_sector = 1,
		mp_apartments = 2,
		mp_ethiopia = 3,
		mp_stronghold = 4
	}
	local isMapInDemo = function ( mapName )
		return demoBuildMaps[mapName] ~= nil
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
		local f7_local0 = CoD.mapsTable[m].dlc_pack == CoD.perController[controller].mapCategory
		if Dvar.ui_execdemo:get() and f7_local0 then
			f7_local0 = isMapInDemo( m )
		end
		return f7_local0
	end
	
	local maps = CoD.mapsTable
	local isOffline = Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE )
	local index = 1
	local currentMap = Engine.DvarString( nil, "ui_mapname" )
	if isOffline == false then
		for id, map in LUI.IterateTableBySortedKeys( maps, sortMaps, filterMaps ) do
			table.insert( mapsList, {
				models = {
					text = map.mapName,
					image = REG14.previewImage,
					description = REG14.mapDescription
				},
				properties = {
					mapName = id,
					selectIndex = REG13 == currentMap
				}
			} )
		end
	end
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeMap.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, -44.67, 1315.33 )
	LeftPanel:setTopBottom( true, false, 69.5, 822.5 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( menu, controller )
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
		menu:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( menu, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local mapCategoriesList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapCategoriesList:makeFocusable()
	mapCategoriesList:setLeftRight( true, false, 71, 351 )
	mapCategoriesList:setTopBottom( true, false, 142, 310 )
	mapCategoriesList:setDataSource( "ChangeMapCategories" )
	mapCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	mapCategoriesList:setVerticalCount( 5 )
	mapCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( mapCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetElementPropertyOnPerControllerTable( controller, "mapCategory", element, "category" )
		UpdateElementDataSource( self, "mapList" )
		SetMenuState( menu, "SelectingMap" )
		SetLoseFocusToElement( self, "mapCategoriesList", controller )
		MakeElementNotFocusable( self, "mapCategoriesList", controller )
		MakeElementFocusable( self, "mapList", controller )
		SetFocusToElement( self, "mapList", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	mapCategoriesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsParentListInFocus( element ) then
					f15_local0 = IsDisabled( element, controller )
				else
					f15_local0 = false
				end
				return f15_local0
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	mapCategoriesList:linkToElementModel( "disabled", true, function ( model )
		menu:updateElementState( mapCategoriesList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( mapCategoriesList )
	self.mapCategoriesList = mapCategoriesList
	
	local mapList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapList:makeFocusable()
	mapList:setLeftRight( true, false, 395, 675 )
	mapList:setTopBottom( true, false, 142, 650 )
	mapList:setDataSource( "ChangeMapMaps" )
	mapList:setWidgetType( CoD.List1Button_Playlist )
	mapList:setVerticalCount( 15 )
	mapList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( mapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		MapSelected( element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	mapList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f22_local0
				if not IsParentListInFocus( element ) then
					f22_local0 = IsDisabled( element, controller )
				else
					f22_local0 = false
				end
				return f22_local0
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	mapList:linkToElementModel( "disabled", true, function ( model )
		menu:updateElementState( mapList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( mapList )
	self.mapList = mapList
	
	local categoryInfo = CoD.matchSettingsInfo.new( menu, controller )
	categoryInfo:setLeftRight( true, false, 756, 1303 )
	categoryInfo:setTopBottom( true, false, 143, 693 )
	categoryInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
	local mapInfo = CoD.matchSettingsInfo.new( menu, controller )
	mapInfo:setLeftRight( true, false, 756, 1303 )
	mapInfo:setTopBottom( true, false, 143, 693 )
	mapInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( mapInfo )
	self.mapInfo = mapInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( menu, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	categoryInfo:linkToElementModel( mapCategoriesList, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	mapInfo:linkToElementModel( mapList, nil, false, function ( model )
		mapInfo:setModel( model, controller )
	end )
	mapCategoriesList.navigation = {
		right = mapList
	}
	mapList.navigation = {
		left = mapCategoriesList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
				mapList:completeAnimation()
				self.mapList:setAlpha( 0 )
				self.clipFinished( mapList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 1 )
				self.clipFinished( categoryInfo, {} )
				mapInfo:completeAnimation()
				self.mapInfo:setAlpha( 0 )
				self.clipFinished( mapInfo, {} )
			end
		},
		SelectingMap = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
				mapList:completeAnimation()
				self.mapList:setAlpha( 1 )
				self.clipFinished( mapList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 0 )
				self.clipFinished( categoryInfo, {} )
				mapInfo:completeAnimation()
				self.mapInfo:setAlpha( 1 )
				self.clipFinished( mapInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeElementNotFocusable( self, "mapList", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
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
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = menu
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

