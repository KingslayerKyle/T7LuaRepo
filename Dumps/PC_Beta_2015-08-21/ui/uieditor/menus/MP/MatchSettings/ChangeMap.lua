require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

DataSources.ChangeMapCategories = DataSourceHelpers.ListSetup( "ChangeMapCategories", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = CoD.GetMapValue( Engine.DvarString( nil, "ui_mapname" ), "dlc_pack", CoD.CONTENT_ORIGINAL_MAP_INDEX )
	local f1_local2 = function ( f2_arg0, f2_arg1 )
		return {
			models = {
				text = "MPUI_MAP_CATEGORY_" .. f2_arg0 .. "_CAPS",
				image = "playlist_map",
				description = "MPUI_MAP_CATEGORY_" .. f2_arg0 .. "_DESC"
			},
			properties = {
				category = f2_arg1,
				selectIndex = f1_local1 == f2_arg1
			}
		}
	end
	
	local f1_local3 = function ()
		for f3_local3, f3_local4 in pairs( CoD.mapsTable ) do
			if f3_local4.session_mode == CoD.gameModeEnum and f3_local4.dlc_pack > 0 then
				return true
			end
		end
		return false
	end
	
	if CoD.isCampaign == true then
		table.insert( f1_local0, f1_local2( "missions", CoD.CONTENT_ORIGINAL_MAP_INDEX ) )
		table.insert( f1_local0, f1_local2( "dev", CoD.CONTENT_DEV_MAP_INDEX ) )
	else
		table.insert( f1_local0, f1_local2( "standard", CoD.CONTENT_ORIGINAL_MAP_INDEX ) )
		if not Dvar.ui_execdemo:get() and f1_local3() then
			table.insert( f1_local0, f1_local2( "dlc", nil ) )
		end
	end
	return f1_local0
end, true )
DataSources.ChangeMapMaps = DataSourceHelpers.ListSetup( "ChangeMapMaps", function ( f4_arg0 )
	local f4_local0 = {}
	local f4_local1 = {
		mp_sector = 1,
		mp_apartments = 2,
		mp_ethiopia = 3,
		mp_stronghold = 4
	}
	local f4_local2 = function ( f5_arg0 )
		return f4_local1[f5_arg0] ~= nil
	end
	
	local f4_local3 = function ( f6_arg0, f6_arg1 )
		if Dvar.ui_execdemo:get() then
			if f4_local2( f6_arg0 ) and f4_local2( f6_arg0 ) then
				return f4_local1[f6_arg0] < f4_local1[f6_arg1]
			else
				
			end
		else
			return CoD.mapsTable[f6_arg0].unique_id < CoD.mapsTable[f6_arg1].unique_id
		end
	end
	
	local f4_local4 = function ( f7_arg0 )
		if CoD.gameModeEnum ~= CoD.mapsTable[f7_arg0].session_mode then
			return false
		end
		local f7_local0 = CoD.mapsTable[f7_arg0].dlc_pack == CoD.perController[f4_arg0].mapCategory
		if Dvar.ui_execdemo:get() and f7_local0 then
			f7_local0 = f4_local2( f7_arg0 )
		end
		return f7_local0
	end
	
	local f4_local5 = CoD.mapsTable
	local f4_local6 = Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE )
	local f4_local7 = 1
	local f4_local8 = Engine.DvarString( nil, "ui_mapname" )
	if f4_local6 == false then
		for f4_local12, f4_local13 in LUI.IterateTableBySortedKeys( f4_local5, f4_local3, f4_local4 ) do
			table.insert( f4_local0, {
				models = {
					text = f4_local13.mapName,
					image = f4_local13.previewImage,
					description = f4_local13.mapDescription
				},
				properties = {
					mapName = f4_local12,
					selectIndex = f4_local12 == f4_local8
				}
			} )
		end
	end
	return f4_local0
end, true )
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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, -44.67, 1315.33 )
	LeftPanel:setTopBottom( true, false, 69.5, 822.5 )
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
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local mapCategoriesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapCategoriesList:makeFocusable()
	mapCategoriesList:setLeftRight( true, false, 71, 351 )
	mapCategoriesList:setTopBottom( true, false, 142, 310 )
	mapCategoriesList:setDataSource( "ChangeMapCategories" )
	mapCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	mapCategoriesList:setVerticalCount( 5 )
	mapCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	mapCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( mapCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	mapCategoriesList:linkToElementModel( mapCategoriesList, "disabled", true, function ( model )
		self:updateElementState( mapCategoriesList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( mapCategoriesList )
	self.mapCategoriesList = mapCategoriesList
	
	local mapList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapList:makeFocusable()
	mapList:setLeftRight( true, false, 395, 675 )
	mapList:setTopBottom( true, false, 142, 650 )
	mapList:setDataSource( "ChangeMapMaps" )
	mapList:setWidgetType( CoD.List1Button_Playlist )
	mapList:setVerticalCount( 15 )
	mapList:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	mapList:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	self:AddButtonCallbackFunction( mapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	mapList:linkToElementModel( mapList, "disabled", true, function ( model )
		self:updateElementState( mapList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( mapList )
	self.mapList = mapList
	
	local categoryInfo = CoD.matchSettingsInfo.new( self, controller )
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
	
	local mapInfo = CoD.matchSettingsInfo.new( self, controller )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f31_local0 = nil
		MakeElementNotFocusable( self, "mapList", controller )
		if not f31_local0 then
			f31_local0 = self:dispatchEventToChildren( event )
		end
		return f31_local0
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
		menu = self
	} )
	if not self:restoreState() then
		self.mapCategoriesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.frame:close()
		element.mapCategoriesList:close()
		element.mapList:close()
		element.categoryInfo:close()
		element.mapInfo:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeMap.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

