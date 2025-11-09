require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistCategoryMatchSettingsInfo" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistMatchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlaylistDLC1CRM" )
require( "ui.uieditor.widgets.DLC_Free_weekend" )
require( "ui.uieditor.widgets.Party_Double_promo" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if not CoD.useMouse then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
			if IsSelfInState( f1_arg0, "SelectingPlaylist" ) then
				f1_arg0.playlistList:setMouseDisabled( false )
				f1_arg0.playlistCategoriesList:setMouseDisabled( true )
				f1_arg0.m_playlistSet = false
			else
				f1_arg0.playlistList:setMouseDisabled( true )
				f1_arg0.playlistCategoriesList:setMouseDisabled( false )
			end
		end )
		f1_arg0.playlistList:setMouseDisabled( true )
		f1_arg0.playlistList:registerEventHandler( "leftclick_outside", function ( element, event )
			if IsSelfInState( f1_arg0, "SelectingPlaylist" ) and f1_arg0.m_playlistSet then
				CoD.PCUtil.SimulateButtonPress( f1_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			end
			f1_arg0.m_playlistSet = true
			return true
		end )
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f0_local0( f4_arg0, f4_arg1 )
	f4_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		UpdateElementState( element, "PlaylistDLC1CRM", f4_arg1 )
		CoD.Menu.OcclusionChange( element, event )
	end )
end

local f0_local2 = function ( f6_arg0 )
	if 0 < f6_arg0 then
		return true
	elseif Dvar.groupZeroCountsVisible:exists() == true and Dvar.groupZeroCountsVisible:get() == true then
		return true
	else
		return false
	end
end

function FindPlaylistCategory( f7_arg0, f7_arg1 )
	for f7_local6, f7_local7 in ipairs( f7_arg0 ) do
		for f7_local3, f7_local4 in ipairs( f7_local7.playlists ) do
			if f7_local4.index == f7_arg1 then
				return f7_local7
			end
		end
	end
	return nil
end

DataSources.PlaylistCategories = DataSourceHelpers.ListSetup( "PlaylistCategories", function ( f8_arg0 )
	local f8_local0 = {}
	local f8_local1 = Engine.GetPlaylistCategories()
	local f8_local2 = CoD.PlaylistCategoryFilter or ""
	local f8_local3 = FindPlaylistCategory( f8_local1, Engine.ProfileInt( f8_arg0, "playlist_" .. f8_local2 ) )
	local f8_local4 = 0
	for f8_local8, f8_local9 in ipairs( f8_local1 ) do
		if f8_local9.filter == f8_local2 then
			f8_local4 = f8_local4 + f8_local9.playerCount
		end
	end
	f8_local5 = function ( f9_arg0 )
		local f9_local0 = ""
		if f0_local2( f8_local4 ) then
			if Dvar.groupCountsVisible:get() == true then
				f9_local0 = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( f9_arg0.playerCount ), CoD.separateNumberWithCommas( f8_local4 ) )
			else
				if f8_local4 <= 0 then
					f8_local4 = 1
				end
				f9_local0 = Engine.Localize( "MENU_CATEGORY_USER_PERCENT", math.floor( f9_arg0.playerCount / f8_local4 * 100 + 0.5 ) )
			end
		end
		local f9_local1 = IsZombies()
		if f9_local1 then
			f9_local1 = #f9_arg0.playlists == 1
		end
		local f9_local2 = f9_arg0.playlists[1]
		local f9_local3 = false
		for f9_local7, f9_local8 in ipairs( f9_arg0.playlists ) do
			if LuaUtils.PlaylistRulesIncludes( Engine.GetPlaylistInfoByID( f9_local8.index ), "ui_showBonusIcon 1" ) then
				f9_local3 = true
				break
			end
		end
		f9_local4 = {
			models = {
				text = Engine.ToUpper( f9_arg0.name ) or "",
				buttonText = CoD.StoreUtility.PrependPurchaseIconIfNeeded( f8_arg0, f9_arg0.ref, Engine.ToUpper( f9_arg0.name ) ) or "",
				image = f9_arg0.icon or "playlist_standard",
				description = f9_arg0.description or "",
				hasBonusIcon = f9_local3,
				playlistCount = f9_local0
			}
		}
		f9_local5 = {
			id = f9_arg0.ref,
			category = f9_arg0,
			autoPlay = f9_local1,
			playlist = f9_local2,
			selectIndex = f9_arg0 == f8_local3
		}
		local f9_local9 = f9_local1
		if f9_local2 then
			f9_local6 = Engine.IsPlaylistLocked( f8_arg0, f9_local2.index )
		else
			f9_local6 = f9_local9 and true
		end
		f9_local5.disabled = f9_local6
		f9_local4.properties = f9_local5
		return f9_local4
	end
	
	for f8_local9, f8_local10 in ipairs( f8_local1 ) do
		if f8_local10.filter == f8_local2 and #f8_local10.playlists > 0 then
			table.insert( f8_local0, f8_local5( f8_local10 ) )
		end
	end
	return f8_local0
end, true )
local f0_local3 = LuaEnums.createEnum( "tdm", "ctf", "koth", "dom", "conf" )
DataSources.PlaylistModes = DataSourceHelpers.ListSetup( "PlaylistModes", function ( f10_arg0 )
	local f10_local0 = {}
	if CoD.perController[f10_arg0].playlistCategory then
		local f10_local1 = Engine.GetPlaylistCategories()
		local f10_local2 = CoD.PlaylistCategoryFilter or ""
		local f10_local3 = 0
		for f10_local7, f10_local8 in ipairs( f10_local1 ) do
			if f10_local8.filter == f10_local2 then
				f10_local3 = f10_local3 + f10_local8.playerCount
			end
		end
		f10_local5 = Engine.ProfileInt( f10_arg0, "playlist_" .. (CoD.PlaylistCategoryFilter or "") )
		for f10_local25, f10_local26 in ipairs( CoD.perController[f10_arg0].playlistCategory.playlists ) do
			local f10_local9 = ""
			if f0_local2( f10_local3 ) then
				if Dvar.groupCountsVisible:get() == true then
					f10_local9 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( f10_local26.playerCount ), CoD.separateNumberWithCommas( f10_local3 ) )
				else
					if f10_local3 <= 0 then
						f10_local3 = 1
					end
					f10_local9 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( f10_local26.playerCount / f10_local3 * 100 + 0.5 ) )
				end
			end
			local f10_local10 = Engine.GetPlaylistInfoByID( f10_local26.index )
			local f10_local11 = f10_local10.playlist.usedDLCMask
			local f10_local12 = Engine.IsPlaylistLocked( f10_arg0, f10_local26.index )
			if f10_local12 then
				if f10_local11 & CoD.GetKnownDLCBits() ~= f10_local11 or f10_local11 & Engine.GetDLCBits() == f10_local11 then
					f10_local12 = false
				else
					f10_local12 = true
				end
			end
			local f10_local13 = f10_local12 and ShowPurchasableMapForDLCBit( f10_arg0, f10_local11 )
			local f10_local14 = f10_local26.name or ""
			local f10_local15 = Enum.dlcIndex_t.CONTENT_ORIGINAL_MAP_INDEX
			if f10_local13 then
				f10_local14 = Engine.Localize( "MENU_PURCHASE_ICON_AND_TEXT", f10_local14 )
				f10_local15 = CoD.DLCIndexFromBit[f10_local11]
			end
			local f10_local16 = LuaUtils.PlaylistRulesIncludes( f10_local10, "xpGroups group_party2" )
			local f10_local17 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				f10_local17 = Enum.LobbyModule.LOBBY_MODULE_HOST
			end
			local f10_local18 = Engine.GetLobbyClientCount( f10_local17, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
			local f10_local19 = Engine.GetLobbyClientCount( f10_local17, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_GUEST )
			local f10_local20 = table.insert
			local f10_local21 = f10_local0
			local f10_local22 = {}
			local f10_local23 = {
				text = f10_local26.name or "",
				image = f10_local26.icon or "blacktransparent",
				buttonText = f10_local14,
				description = f10_local26.description or "",
				playlistCount = f10_local9,
				hasDoubleCryptokeys = LuaUtils.PlaylistRulesIncludes( f10_local10, "lootxp_multiplier 2.0" )
			}
			local f10_local24 = LuaUtils.PlaylistRulesIncludes( f10_local10, "scr_xpscalemp 2" )
			if f10_local24 then
				if f10_local16 and f10_local18 - f10_local19 < 2 then
					f10_local24 = false
				else
					f10_local24 = true
				end
			end
			f10_local23.hasDoubleXP = f10_local24
			f10_local23.hasDoubleWeaponXP = LuaUtils.PlaylistRulesIncludes( f10_local10, "scr_gunxpscalemp 2" )
			f10_local23.hasBonusIcon = LuaUtils.PlaylistRulesIncludes( f10_local10, "ui_showBonusIcon 1" )
			f10_local23.dlcIndex = f10_local15
			f10_local22.models = f10_local23
			f10_local22.properties = {
				id = tostring( f10_local26.index ),
				playlist = f10_local26,
				selectIndex = f10_local26.index == f10_local5,
				disabled = Engine.IsPlaylistLocked( f10_arg0, f10_local26.index ) and not f10_local13,
				purchasable = f10_local13
			}
			f10_local20( f10_local21, f10_local22 )
		end
	end
	return f10_local0
end, true, nil, function ( f11_arg0, f11_arg1, f11_arg2 )
	f11_arg1.lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	if f11_arg1.updateSubscription then
		f11_arg1:removeSubscription( f11_arg1.updateSubscription )
	end
	f11_arg1.updateSubscription = f11_arg1:subscribeToModel( Engine.GetModel( f11_arg1.lobbyRootModel, "privateClient.update" ), function ()
		f11_arg1:updateDataSource( false )
	end, false )
end )
LUI.createMenu.PlaylistSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PlaylistSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, true, -4, 7 )
	LeftPanel:setTopBottom( true, true, 0, 0 )
	LeftPanel:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:setLeftRight( true, true, 0, 0 )
	FadeForStreamer:setTopBottom( true, true, 0, 0 )
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
	frame.titleLabel:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local playlistCategoriesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistCategoriesList:makeFocusable()
	playlistCategoriesList:setLeftRight( true, false, 67, 347 )
	playlistCategoriesList:setTopBottom( true, false, 143, 481 )
	playlistCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	playlistCategoriesList:setVerticalCount( 10 )
	playlistCategoriesList:setDataSource( "PlaylistCategories" )
	playlistCategoriesList:linkToElementModel( playlistCategoriesList, "disabled", true, function ( model )
		local f16_local0 = playlistCategoriesList
		local f16_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f16_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	playlistCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( playlistCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and IsElementPropertyValue( element, "autoPlay", true ) then
			PlaylistSelected( menu, element, controller )
			ClearSavedState( self, controller )
			return true
		elseif not IsDisabled( element, controller ) then
			PlaylistCategorySelected( menu, element, controller )
			PlaySoundSetSound( self, "list_action" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) and IsElementPropertyValue( element, "autoPlay", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	playlistCategoriesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f21_local0
				if not IsParentListInFocus( element ) then
					f21_local0 = IsDisabled( element, controller )
				else
					f21_local0 = false
				end
				return f21_local0
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	playlistCategoriesList:linkToElementModel( playlistCategoriesList, "disabled", true, function ( model )
		self:updateElementState( playlistCategoriesList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( playlistCategoriesList )
	self.playlistCategoriesList = playlistCategoriesList
	
	local playlistList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistList:makeFocusable()
	playlistList:setLeftRight( true, false, 287, 567 )
	playlistList:setTopBottom( true, false, 143, 651 )
	playlistList:setWidgetType( CoD.List1Button_Playlist )
	playlistList:setVerticalCount( 15 )
	playlistList:setDataSource( "PlaylistModes" )
	playlistList:linkToElementModel( playlistList, "disabled", true, function ( model )
		local f24_local0 = playlistList
		local f24_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f24_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistList:registerEventHandler( "gain_focus", function ( element, event )
		local f25_local0 = nil
		if element.gainFocus then
			f25_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f25_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f25_local0
	end )
	playlistList:registerEventHandler( "lose_focus", function ( element, event )
		local f26_local0 = nil
		if element.loseFocus then
			f26_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f26_local0 = element.super:loseFocus( event )
		end
		return f26_local0
	end )
	self:AddButtonCallbackFunction( playlistList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and not IsElementPropertyValue( element, "purchasable", true ) then
			PlaylistSelected( menu, element, controller )
			ClearSavedState( self, controller )
			return true
		elseif not IsDisabled( element, controller ) then
			OpenPurchaseMapPackConfirmation( controller, element, "MPPublicGamePlaylistSelect", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) and not IsElementPropertyValue( element, "purchasable", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	playlistList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f29_local0
				if not IsParentListInFocus( element ) then
					f29_local0 = IsDisabled( element, controller )
				else
					f29_local0 = false
				end
				return f29_local0
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	playlistList:linkToElementModel( playlistList, "disabled", true, function ( model )
		self:updateElementState( playlistList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( playlistList )
	self.playlistList = playlistList
	
	local categoryInfo = CoD.playlistCategoryMatchSettingsInfo.new( self, controller )
	categoryInfo:setLeftRight( true, false, 600, 1216 )
	categoryInfo:setTopBottom( true, false, 143, 693.25 )
	categoryInfo:setAlpha( 0.6 )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
	local playlistInfo = CoD.playlistMatchSettingsInfo.new( self, controller )
	playlistInfo:setLeftRight( true, false, 600, 1216 )
	playlistInfo:setTopBottom( true, false, 143, 669 )
	self:addElement( playlistInfo )
	self.playlistInfo = playlistInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local PlaylistDLC1CRM = CoD.PlaylistDLC1CRM.new( self, controller )
	PlaylistDLC1CRM:setLeftRight( true, false, 600, 1050 )
	PlaylistDLC1CRM:setTopBottom( true, false, 542.38, 671.38 )
	PlaylistDLC1CRM:mergeStateConditions( {
		{
			stateName = "dlc4",
			condition = function ( menu, element, event )
				return ShouldShowDLCWidget( controller, "mp_city" )
			end
		},
		{
			stateName = "dlc3",
			condition = function ( menu, element, event )
				return ShouldShowDLCWidget( controller, "mp_arena" )
			end
		},
		{
			stateName = "dlc2",
			condition = function ( menu, element, event )
				return ShouldShowDLCWidget( controller, "mp_aerospace" )
			end
		},
		{
			stateName = "dlc1",
			condition = function ( menu, element, event )
				return ShouldShowDLCWidget( controller, "mp_rise" )
			end
		}
	} )
	self:addElement( PlaylistDLC1CRM )
	self.PlaylistDLC1CRM = PlaylistDLC1CRM
	
	local PlaylistDLC1CRMContextual = CoD.PlaylistDLC1CRM.new( self, controller )
	PlaylistDLC1CRMContextual:setLeftRight( true, false, 600, 1050 )
	PlaylistDLC1CRMContextual:setTopBottom( true, false, 542.38, 671.38 )
	PlaylistDLC1CRMContextual:mergeStateConditions( {
		{
			stateName = "dlc4",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "controller", Enum.dlcIndex_t.CONTENT_DLC4_INDEX )
			end
		},
		{
			stateName = "dlc3",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "controller", Enum.dlcIndex_t.CONTENT_DLC3_INDEX )
			end
		},
		{
			stateName = "dlc2",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "dlcIndex", Enum.dlcIndex_t.CONTENT_DLC2_INDEX )
			end
		},
		{
			stateName = "dlc1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "dlcIndex", Enum.dlcIndex_t.CONTENT_DLC1_INDEX )
			end
		}
	} )
	PlaylistDLC1CRMContextual:linkToElementModel( PlaylistDLC1CRMContextual, "controller", true, function ( model )
		self:updateElementState( PlaylistDLC1CRMContextual, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "controller"
		} )
	end )
	PlaylistDLC1CRMContextual:linkToElementModel( PlaylistDLC1CRMContextual, "dlcIndex", true, function ( model )
		self:updateElementState( PlaylistDLC1CRMContextual, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "dlcIndex"
		} )
	end )
	self:addElement( PlaylistDLC1CRMContextual )
	self.PlaylistDLC1CRMContextual = PlaylistDLC1CRMContextual
	
	local DLCFreeweekend = CoD.DLC_Free_weekend.new( self, controller )
	DLCFreeweekend:setLeftRight( true, false, 72, 470 )
	DLCFreeweekend:setTopBottom( true, false, 487, 653 )
	DLCFreeweekend.DLCFreeTitleAndText.Title:setText( Engine.Localize( "MENU_DLC1_TRY_AWAKENING_FREE" ) )
	DLCFreeweekend.DLCFreeTitleAndText.Body:setText( Engine.Localize( "MENU_DLC1_TRY_AWAKENING_FREE_DESC" ) )
	DLCFreeweekend:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f42_local0 = IsDvarValueEqualTo( "ui_freeDLC1", "1" )
				if f42_local0 then
					f42_local0 = ShouldShowDLCWidget( controller, "mp_rise" )
					if f42_local0 then
						f42_local0 = AlwaysFalse()
					end
				end
				return f42_local0
			end
		}
	} )
	self:addElement( DLCFreeweekend )
	self.DLCFreeweekend = DLCFreeweekend
	
	local PartyDoublePromo = CoD.Party_Double_promo.new( self, controller )
	PartyDoublePromo:setLeftRight( true, false, 72, 484 )
	PartyDoublePromo:setTopBottom( true, false, 487, 653 )
	PartyDoublePromo.DLCFreeTitleAndText.Title:setText( Engine.Localize( "MPUI_PARTY_DOUBLE_PROMO" ) )
	PartyDoublePromo.DLCFreeTitleAndText.Body:setText( Engine.Localize( "MPUI_PARTY_DOUBLE_PROMO_DESC" ) )
	self:addElement( PartyDoublePromo )
	self.PartyDoublePromo = PartyDoublePromo
	
	categoryInfo:linkToElementModel( playlistCategoriesList, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	playlistInfo:linkToElementModel( playlistList, nil, false, function ( model )
		playlistInfo:setModel( model, controller )
	end )
	PlaylistDLC1CRMContextual:linkToElementModel( playlistList, nil, false, function ( model )
		PlaylistDLC1CRMContextual:setModel( model, controller )
	end )
	playlistCategoriesList.navigation = {
		right = playlistList
	}
	playlistList.navigation = {
		left = playlistCategoriesList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				playlistList:completeAnimation()
				self.playlistList:setAlpha( 0 )
				self.clipFinished( playlistList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 1 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setAlpha( 0 )
				self.clipFinished( playlistInfo, {} )
				PlaylistDLC1CRM:completeAnimation()
				self.PlaylistDLC1CRM:setAlpha( 1 )
				self.clipFinished( PlaylistDLC1CRM, {} )
				PlaylistDLC1CRMContextual:completeAnimation()
				self.PlaylistDLC1CRMContextual:setAlpha( 0 )
				self.clipFinished( PlaylistDLC1CRMContextual, {} )
			end
		},
		SelectingPlaylist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, true, -5.5, 5.5 )
				self.LeftPanel:setTopBottom( true, true, 0, 0 )
				self.clipFinished( LeftPanel, {} )
				playlistList:completeAnimation()
				self.playlistList:setAlpha( 1 )
				self.clipFinished( playlistList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 0 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setAlpha( 1 )
				self.clipFinished( playlistInfo, {} )
				PlaylistDLC1CRM:completeAnimation()
				self.PlaylistDLC1CRM:setAlpha( 0 )
				self.clipFinished( PlaylistDLC1CRM, {} )
				PlaylistDLC1CRMContextual:completeAnimation()
				self.PlaylistDLC1CRMContextual:setAlpha( 1 )
				self.clipFinished( PlaylistDLC1CRMContextual, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f48_local0 = nil
		MakeElementNotFocusable( self, "playlistList", controller )
		SetElementStateByElementName( self, "frame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "FEMenuLeftGraphics",
			clipName = "Intro"
		}, controller )
		if not f48_local0 then
			f48_local0 = self:dispatchEventToChildren( event )
		end
		return f48_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			GoBack( self, controller )
			return true
		else
			SetPerControllerTableProperty( controller, "playlistCategory", nil )
			SetMenuState( menu, "DefaultState" )
			SetLoseFocusToElement( self, "playlistList", controller )
			MakeElementNotFocusable( self, "playlistList", controller )
			MakeElementFocusable( self, "playlistCategoriesList", controller )
			SetFocusToElement( self, "playlistCategoriesList", controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if ShouldSquareOpenStore( menu, controller, "PlaylistDLC1CRMContextual" ) then
			OpenDLCStore( self, element, controller, "MPPublicGamePlaylistSelect", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ShouldSquareOpenStore( menu, controller, "PlaylistDLC1CRMContextual" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	frame:setModel( self.buttonModel, controller )
	playlistCategoriesList.id = "playlistCategoriesList"
	playlistList.id = "playlistList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.playlistCategoriesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.frame:close()
		element.playlistCategoriesList:close()
		element.playlistList:close()
		element.categoryInfo:close()
		element.playlistInfo:close()
		element.FEMenuLeftGraphics:close()
		element.PlaylistDLC1CRM:close()
		element.PlaylistDLC1CRMContextual:close()
		element.DLCFreeweekend:close()
		element.PartyDoublePromo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

