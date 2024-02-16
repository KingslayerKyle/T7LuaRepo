-- 419d61330c113a325ed3d75f8d1e9794
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = {
		mp_sector = 1,
		mp_apartments = 2,
		mp_ethiopia = 3,
		mp_stronghold = 4
	}
	local f1_local2 = {
		mp_freerun_01 = 1,
		mp_freerun_02 = 2,
		mp_freerun_03 = 3,
		mp_freerun_04 = 4
	}
	local f1_local3 = function ( f2_arg0 )
		return f1_local1[f2_arg0] ~= nil
	end
	
	local f1_local4 = function ( f3_arg0 )
		return f1_local2[f3_arg0] ~= nil
	end
	
	local f1_local5 = function ( f4_arg0, f4_arg1 )
		if Dvar.ui_execdemo:get() then
			if f1_local3( f4_arg0 ) and f1_local3( f4_arg0 ) then
				return f1_local1[f4_arg0] < f1_local1[f4_arg1]
			else
				
			end
		else
			return CoD.mapsTable[f4_arg0].unique_id < CoD.mapsTable[f4_arg1].unique_id
		end
	end
	
	local f1_local6 = function ( f5_arg0 )
		if CoD.gameModeEnum ~= CoD.mapsTable[f5_arg0].session_mode then
			return false
		end
		local f5_local0 = true
		if Dvar.ui_execdemo:get() and f5_local0 then
			f5_local0 = f1_local3( f5_arg0 )
		end
		if Engine.IsMpStillDownloading() and f5_local0 then
			f5_local0 = f1_local4( f5_arg0 )
		end
		if not IsFreeRunMap( f5_arg0 ) then
			return false
		end
		return f5_local0
	end
	
	local f1_local7 = CoD.mapsTable
	local f1_local8 = 1
	local f1_local9 = Engine.DvarString( nil, "ui_mapname" )
	for f1_local14, f1_local15 in LUI.IterateTableBySortedKeys( f1_local7, f1_local5, f1_local6 ) do
		local f1_local16 = table.insert
		local f1_local17 = f1_local0
		local f1_local18 = {
			models = {
				text = Engine.Localize( f1_local15.mapName ),
				buttonText = Engine.Localize( f1_local15.mapName ),
				image = f1_local15.previewImage,
				description = Engine.Localize( f1_local15.mapDescription ),
				location = f1_local15.mapLocation,
				bestTime = CoD.MapUtility.GetBestTimeForFreerunMap( f1_arg0, f1_local14 )
			}
		}
		local f1_local19 = {
			mapName = f1_local14,
			selectIndex = f1_local14 == f1_local9
		}
		local f1_local13 = Engine.IsMpStillDownloading()
		if f1_local13 then
			f1_local13 = not f1_local15.isFreeRunMap
		end
		f1_local19.disabled = f1_local13
		f1_local18.properties = f1_local19
		f1_local16( f1_local17, f1_local18 )
	end
	return f1_local0
end

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

DataSources.FreerunPlaylist = DataSourceHelpers.ListSetup( "FreerunPlaylist", f0_local0, true )
LUI.createMenu.Freerun_ChangeMap = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Freerun_ChangeMap" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Freerun_ChangeMap.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f7_local1, controller )
	LeftPanel:setLeftRight( true, true, -45, 35 )
	LeftPanel:setTopBottom( true, true, -43, 102 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f7_local1, controller )
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
		f7_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( f7_local1, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_CHANGE_COURSE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHANGE_COURSE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local mapList = LUI.UIList.new( f7_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	mapList:makeFocusable()
	mapList:setLeftRight( true, false, 70, 350 )
	mapList:setTopBottom( true, false, 142, 650 )
	mapList:setDataSource( "FreerunPlaylist" )
	mapList:setWidgetType( CoD.List1Button_Playlist )
	mapList:setVerticalCount( 15 )
	mapList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	mapList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	f7_local1:AddButtonCallbackFunction( mapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		MapSelected( f12_arg0, f12_arg2 )
		GoBack( self, f12_arg2 )
		ClearSavedState( self, f12_arg2 )
		PlaySoundSetSound( self, "action" )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	mapList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsParentListInFocus( element ) then
					f14_local0 = IsDisabled( element, controller )
				else
					f14_local0 = false
				end
				return f14_local0
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
		f7_local1:updateElementState( mapList, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( mapList )
	self.mapList = mapList
	
	local mapInfo = CoD.matchSettingsInfo.new( f7_local1, controller )
	mapInfo:setLeftRight( true, false, 600, 1216 )
	mapInfo:setTopBottom( true, false, 143, 787 )
	mapInfo.Description:setAlpha( 0 )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f7_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	mapInfo:linkToElementModel( mapList, nil, false, function ( model )
		mapInfo:setModel( model, controller )
	end )
	mapInfo:linkToElementModel( mapList, "bestTime", true, function ( model )
		local bestTime = Engine.GetModelValue( model )
		if bestTime then
			mapInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( bestTime ) )
		end
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		GoBack( self, f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.mapList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.frame:close()
		element.mapList:close()
		element.mapInfo:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Freerun_ChangeMap.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

