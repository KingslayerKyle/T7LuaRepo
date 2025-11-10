require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if not CoD.useMouse then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
			if IsSelfInState( f1_arg0, "SelectingMap" ) then
				f1_arg0.mapList:setMouseDisabled( false )
				f1_arg0.mapCategoriesList:setMouseDisabled( true )
				f1_arg0.m_categorySet = false
			else
				f1_arg0.mapList:setMouseDisabled( true )
				f1_arg0.mapCategoriesList:setMouseDisabled( false )
			end
		end )
		f1_arg0.mapList:setMouseDisabled( true )
		f1_arg0.mapList:registerEventHandler( "leftclick_outside", function ( element, event )
			if IsSelfInState( f1_arg0, "SelectingMap" ) and f1_arg0.m_categorySet then
				CoD.PCUtil.SimulateButtonPress( f1_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			end
			f1_arg0.m_categorySet = true
			return true
		end )
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f0_local0( f4_arg0, f4_arg1 )
end

DataSources.ChangeMapCategories = DataSourceHelpers.ListSetup( "ChangeMapCategories", function ( f5_arg0 )
	local f5_local0 = {}
	local f5_local1 = CoD.GetMapValue( Engine.DvarString( nil, "ui_mapname" ), "dlc_pack", CoD.CONTENT_ORIGINAL_MAP_INDEX )
	local f5_local2 = function ( f6_arg0, f6_arg1 )
		return {
			models = {
				text = "MPUI_MAP_CATEGORY_" .. f6_arg0 .. "_CAPS",
				image = "playlist_map",
				description = "MPUI_MAP_CATEGORY_" .. f6_arg0 .. "_DESC"
			},
			properties = {
				category = f6_arg1,
				selectIndex = f5_local1 == f6_arg1
			}
		}
	end
	
	CoD.mapsTable = Engine.GetGDTMapsTable()
	local f5_local3 = function ()
		for f7_local3, f7_local4 in pairs( CoD.mapsTable ) do
			if f7_local4.session_mode == CoD.gameModeEnum and f7_local4.dlc_pack > 0 and Engine.IsMapValid( f7_local3 ) then
				return true
			end
		end
		return false
	end
	
	if CoD.isCampaign == true then
		table.insert( f5_local0, f5_local2( "missions", CoD.CONTENT_ORIGINAL_MAP_INDEX ) )
		table.insert( f5_local0, f5_local2( "dev", CoD.CONTENT_DEV_MAP_INDEX ) )
	else
		table.insert( f5_local0, f5_local2( "standard", CoD.CONTENT_ORIGINAL_MAP_INDEX ) )
		if not Dvar.ui_execdemo:get() and f5_local3() then
			table.insert( f5_local0, f5_local2( "dlc", nil ) )
		end
	end
	return f5_local0
end, true )
DataSources.ChangeMapMaps = DataSourceHelpers.ListSetup( "ChangeMapMaps", function ( f8_arg0 )
	local f8_local0 = {}
	local f8_local1 = {
		mp_sector = 1,
		mp_apartments = 2,
		mp_ethiopia = 3,
		mp_stronghold = 4
	}
	local f8_local2 = {
		mp_freerun_01 = 1,
		mp_freerun_02 = 2,
		mp_freerun_03 = 3,
		mp_freerun_04 = 4
	}
	local f8_local3 = function ( f9_arg0 )
		return f8_local1[f9_arg0] ~= nil
	end
	
	local f8_local4 = function ( f10_arg0 )
		return f8_local2[f10_arg0] ~= nil
	end
	
	local f8_local5 = function ( f11_arg0, f11_arg1 )
		if Dvar.ui_execdemo:get() then
			if f8_local3( f11_arg0 ) and f8_local3( f11_arg0 ) then
				return f8_local1[f11_arg0] < f8_local1[f11_arg1]
			else
				
			end
		else
			return CoD.mapsTable[f11_arg0].unique_id < CoD.mapsTable[f11_arg1].unique_id
		end
	end
	
	local f8_local6 = function ( f12_arg0 )
		if CoD.gameModeEnum ~= CoD.mapsTable[f12_arg0].session_mode then
			return false
		elseif not Engine.IsMapValid( f12_arg0 ) then
			return false
		else
			local f12_local0
			if CoD.mapsTable[f12_arg0].dlc_pack ~= CoD.perController[f8_arg0].mapCategory and (CoD.mapsTable[f12_arg0].dlc_pack <= 0 or CoD.perController[f8_arg0].mapCategory ~= nil) then
				f12_local0 = false
			else
				f12_local0 = true
			end
		end
		if Dvar.ui_execdemo:get() and f12_local0 then
			f12_local0 = f8_local3( f12_arg0 )
		end
		if Engine.IsMpStillDownloading() and f12_local0 then
			f12_local0 = f8_local4( f12_arg0 )
		end
		if IsFreeRunMap( f12_arg0 ) then
			return false
		end
		return f12_local0
	end
	
	local f8_local7 = CoD.mapsTable
	local f8_local8 = Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE )
	local f8_local9 = 1
	local f8_local10 = Engine.DvarString( nil, "ui_mapname" )
	if f8_local8 == false then
		for f8_local15, f8_local16 in LUI.IterateTableBySortedKeys( f8_local7, f8_local5, f8_local6 ) do
			local f8_local17 = table.insert
			local f8_local18 = f8_local0
			local f8_local19 = {
				models = {
					text = f8_local16.mapName,
					image = f8_local16.previewImage,
					description = f8_local16.mapDescription
				}
			}
			local f8_local20 = {
				mapName = f8_local15,
				selectIndex = f8_local15 == f8_local10
			}
			local f8_local14 = Engine.IsMpStillDownloading()
			if f8_local14 then
				f8_local14 = not f8_local16.isFreeRunMap
			end
			f8_local20.disabled = f8_local14
			f8_local19.properties = f8_local20
			f8_local17( f8_local18, f8_local19 )
		end
	end
	return f8_local0
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeMap.buttonPrompts" )
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
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local mapCategoriesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapCategoriesList:makeFocusable()
	mapCategoriesList:setLeftRight( true, false, 67, 347 )
	mapCategoriesList:setTopBottom( true, false, 143, 311 )
	mapCategoriesList:setDataSource( "ChangeMapCategories" )
	mapCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	mapCategoriesList:setVerticalCount( 5 )
	mapCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	mapCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
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
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	mapCategoriesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f20_local0
				if not IsParentListInFocus( element ) then
					f20_local0 = IsDisabled( element, controller )
				else
					f20_local0 = false
				end
				return f20_local0
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
	mapList:setLeftRight( true, false, 287, 567 )
	mapList:setTopBottom( true, false, 143, 651 )
	mapList:setDataSource( "ChangeMapMaps" )
	mapList:setWidgetType( CoD.List1Button_Playlist )
	mapList:setVerticalCount( 15 )
	mapList:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f23_local0
	end )
	mapList:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		return f24_local0
	end )
	self:AddButtonCallbackFunction( mapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		MapSelected( element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		PlaySoundSetSound( self, "action" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	mapList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f27_local0
				if not IsParentListInFocus( element ) then
					f27_local0 = IsDisabled( element, controller )
				else
					f27_local0 = false
				end
				return f27_local0
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
	categoryInfo:setLeftRight( true, false, 600, 1050 )
	categoryInfo:setTopBottom( true, false, 143, 693 )
	categoryInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
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
	mapInfo:setLeftRight( true, false, 600, 1216 )
	mapInfo:setTopBottom( true, false, 143, 786 )
	mapInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
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
				self.categoryInfo:setLeftRight( true, false, 600, 1050 )
				self.categoryInfo:setTopBottom( true, false, 143, 693 )
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
				self.mapInfo:setLeftRight( true, false, 600, 1216 )
				self.mapInfo:setTopBottom( true, false, 143, 770.84 )
				self.mapInfo:setAlpha( 1 )
				self.clipFinished( mapInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f36_local0 = nil
		MakeElementNotFocusable( self, "mapList", controller )
		if not f36_local0 then
			f36_local0 = self:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f37_local0 = nil
		SetElementStateByElementName( self, "frame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "frame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f37_local0 then
			f37_local0 = self:dispatchEventToChildren( event )
		end
		return f37_local0
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

