require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlaylistDLC1CRM" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistCategoryMatchSettingsInfo" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistMatchSettingsInfo" )

local PostMouse = function ( self, controller )
	if not CoD.useMouse then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
			if IsSelfInState( self, "SelectingPlaylist" ) then
				self.playlistList:setMouseDisabled( false )
				self.playlistCategoriesList:setMouseDisabled( true )
				self.m_playlistSet = false
			else
				self.playlistList:setMouseDisabled( true )
				self.playlistCategoriesList:setMouseDisabled( false )
			end
		end )
		self.playlistList:setMouseDisabled( true )
		self.playlistList:registerEventHandler( "leftclick_outside", function ( element, event )
			if IsSelfInState( self, "SelectingPlaylist" ) and self.m_playlistSet then
				CoD.PCUtil.SimulateButtonPress( controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			end
			self.m_playlistSet = true
			return true
		end )
	end
end

local PostLoadFunc = function ( self, controller )
	PostMouse( self, controller )
	self:registerEventHandler( "occlusion_change", function ( self, event )
		UpdateElementState( self, "PlaylistDLC1CRM", controller )
		CoD.Menu.OcclusionChange( self, event )
	end )
end

local ShowGroupCountInfo = function ( value )
	if 0 < value then
		return true
	elseif Dvar.groupZeroCountsVisible:exists() == true and Dvar.groupZeroCountsVisible:get() == true then
		return true
	else
		return false
	end
end

local PlaylistCategoriesPrepare = function ( controller )
	local categoryItems = {}
	local categories = Engine.GetPlaylistCategories()
	local filter = CoD.PlaylistCategoryFilter or ""
	local profile_playlist = Engine.ProfileInt( controller, "playlist_" .. filter )
	local profile_category = FindPlaylistCategory( categories, profile_playlist )
	local totalCategoryPlayerCounter = 0
	for index, category in ipairs( categories ) do
		if category.filter == filter then
			totalCategoryPlayerCounter = totalCategoryPlayerCounter + category.playerCount
		end
	end
	local createPlaylistCategory = function ( category )
		local playlistCountString = ""
		if ShowGroupCountInfo( totalCategoryPlayerCounter ) then
			if Dvar.groupCountsVisible:get() == true then
				playlistCountString = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( category.playerCount ), CoD.separateNumberWithCommas( totalCategoryPlayerCounter ) )
			else
				if totalCategoryPlayerCounter <= 0 then
					totalCategoryPlayerCounter = 1
				end
				playlistCountString = Engine.Localize( "MENU_CATEGORY_USER_PERCENT", math.floor( category.playerCount / totalCategoryPlayerCounter * 100 + 0.5 ) )
			end
		end
		local f8_local0 = IsZombies()
		if f8_local0 then
			f8_local0 = #category.playlists == 1
		end
		local firstPlayList = category.playlists[1]
		local f8_local1 = {
			models = {
				text = Engine.ToUpper( category.name ) or "",
				buttonText = CoD.StoreUtility.PrependPurchaseIconIfNeeded( controller, category.ref, Engine.ToUpper( category.name ) ) or "",
				image = category.icon or "playlist_standard",
				description = category.description or "",
				playlistCount = playlistCountString
			}
		}
		local f8_local2 = {
			id = category.ref,
			category = category,
			autoPlay = f8_local0,
			playlist = firstPlayList,
			selectIndex = category == profile_category
		}
		local f8_local3 = f8_local0
		local f8_local4
		if firstPlayList then
			f8_local4 = Engine.IsPlaylistLocked( controller, firstPlayList.index )
		else
			f8_local4 = f8_local3 and true
		end
		f8_local2.disabled = f8_local4
		f8_local1.properties = f8_local2
		return f8_local1
	end
	
	for index, category in ipairs( categories ) do
		if category.filter == filter then
			table.insert( categoryItems, createPlaylistCategory( category ) )
		end
	end
	return categoryItems
end

DataSources.PlaylistCategories = DataSourceHelpers.ListSetup( "PlaylistCategories", PlaylistCategoriesPrepare, true )
local demoBuildGameModes = LuaEnum.createEnum( "tdm", "ctf", "koth", "dom", "conf" )
local PlaylistModesPrepare = function ( controller )
	local playlists = {}
	if CoD.perController[controller].playlistCategory then
		local filter = CoD.PlaylistCategoryFilter or ""
		local profile_playlist_index = Engine.ProfileInt( controller, "playlist_" .. filter )
		for index, playlist in ipairs( CoD.perController[controller].playlistCategory.playlists ) do
			local f9_local3 = ""
			local f9_local4 = CoD.perController[controller].playlistCategory.playerCount
			if ShowGroupCountInfo( f9_local4 ) then
				if Dvar.groupCountsVisible:get() == true then
					f9_local3 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( playlist.playerCount ), CoD.separateNumberWithCommas( f9_local4 ) )
				else
					if f9_local4 <= 0 then
						f9_local4 = 1
					end
					f9_local3 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( playlist.playerCount / f9_local4 * 100 + 0.5 ) )
				end
			end
			table.insert( playlists, {
				models = {
					text = playlist.name or "",
					image = playlist.icon or "blacktransparent",
					buttonText = playlist.name or "",
					description = playlist.description or "",
					playlistCount = f9_local3
				},
				properties = {
					id = tostring( playlist.index ),
					playlist = playlist,
					selectIndex = playlist.index == profile_playlist_index,
					disabled = Engine.IsPlaylistLocked( controller, playlist.index )
				}
			} )
		end
	end
	return playlists
end

local UpdateList = function ( controller, list, listModel )
	list.lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( Engine.GetModel( list.lobbyRootModel, "privateClient.update" ), function ()
		list:updateDataSource( false )
	end, false )
end

DataSources.PlaylistModes = DataSourceHelpers.ListSetup( "PlaylistModes", PlaylistModesPrepare, true, nil, UpdateList )
LUI.createMenu.PlaylistSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PlaylistSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 1, 0, 0 )
	LeftPanel:setTopBottom( 0, 1, 0, 0 )
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
	FadeForStreamer:setLeftRight( 0, 1, 0, 0 )
	FadeForStreamer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local frame = CoD.GenericMenuFrame.new( self, controller )
	frame:setLeftRight( 0, 1, 0, 0 )
	frame:setTopBottom( 0, 1, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local playlistCategoriesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistCategoriesList:makeFocusable()
	playlistCategoriesList:mergeStateConditions( {
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
	playlistCategoriesList:linkToElementModel( playlistCategoriesList, "disabled", true, function ( model )
		self:updateElementState( playlistCategoriesList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	playlistCategoriesList:setLeftRight( 0, 0, 100, 520 )
	playlistCategoriesList:setTopBottom( 0, 0, 219, 717 )
	playlistCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	playlistCategoriesList:setVerticalCount( 10 )
	playlistCategoriesList:setDataSource( "PlaylistCategories" )
	playlistCategoriesList:linkToElementModel( playlistCategoriesList, "disabled", true, function ( model )
		local element = playlistCategoriesList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	playlistCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( playlistCategoriesList )
	self.playlistCategoriesList = playlistCategoriesList
	
	local playlistList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistList:makeFocusable()
	playlistList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f23_local0
				if not IsParentListInFocus( element ) then
					f23_local0 = IsDisabled( element, controller )
				else
					f23_local0 = false
				end
				return f23_local0
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
	playlistList:setLeftRight( 0, 0, 430, 850 )
	playlistList:setTopBottom( 0, 0, 222, 970 )
	playlistList:setWidgetType( CoD.List1Button_Playlist )
	playlistList:setVerticalCount( 15 )
	playlistList:setDataSource( "PlaylistModes" )
	playlistList:linkToElementModel( playlistList, "disabled", true, function ( model )
		local element = playlistList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	playlistList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( playlistList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			PlaylistSelected( menu, element, controller )
			ClearSavedState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( playlistList )
	self.playlistList = playlistList
	
	local categoryInfo = CoD.playlistCategoryMatchSettingsInfo.new( self, controller )
	categoryInfo:setLeftRight( 0, 0, 900, 1824 )
	categoryInfo:setTopBottom( 0, 0, 215, 1040 )
	categoryInfo:setAlpha( 0.6 )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
	local playlistInfo = CoD.playlistMatchSettingsInfo.new( self, controller )
	playlistInfo:setLeftRight( 0, 0, 900, 1824 )
	playlistInfo:setTopBottom( 0, 0, 215, 1004 )
	self:addElement( playlistInfo )
	self.playlistInfo = playlistInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local PlaylistDLC1CRM = CoD.PlaylistDLC1CRM.new( self, controller )
	PlaylistDLC1CRM:setLeftRight( 0, 0, 900.5, 1575.5 )
	PlaylistDLC1CRM:setTopBottom( 0, 0, 813, 1007 )
	self:addElement( PlaylistDLC1CRM )
	self.PlaylistDLC1CRM = PlaylistDLC1CRM
	
	categoryInfo:linkToElementModel( playlistCategoriesList, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	playlistInfo:linkToElementModel( playlistList, nil, false, function ( model )
		playlistInfo:setModel( model, controller )
	end )
	playlistCategoriesList.navigation = {
		right = playlistList,
		down = playlistList
	}
	playlistList.navigation = {
		left = playlistCategoriesList,
		up = playlistCategoriesList
	}
	self.resetProperties = function ()
		playlistList:completeAnimation()
		categoryInfo:completeAnimation()
		playlistInfo:completeAnimation()
		PlaylistDLC1CRM:completeAnimation()
		playlistList:setAlpha( 1 )
		categoryInfo:setLeftRight( 0, 0, 900, 1824 )
		categoryInfo:setTopBottom( 0, 0, 215, 1040 )
		categoryInfo:setAlpha( 0.6 )
		playlistInfo:setLeftRight( 0, 0, 900, 1824 )
		playlistInfo:setTopBottom( 0, 0, 215, 1004 )
		playlistInfo:setAlpha( 1 )
		PlaylistDLC1CRM:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				playlistList:completeAnimation()
				self.playlistList:setAlpha( 0 )
				self.clipFinished( playlistList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setLeftRight( 0, 0, 900, 1580 )
				self.categoryInfo:setTopBottom( 0, 0, 215, 1040 )
				self.categoryInfo:setAlpha( 1 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setLeftRight( 0, 0, 960, 1574 )
				self.playlistInfo:setTopBottom( 0, 0, 215, 1004 )
				self.playlistInfo:setAlpha( 0 )
				self.clipFinished( playlistInfo, {} )
			end
		},
		SelectingPlaylist = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				categoryInfo:completeAnimation()
				self.categoryInfo:setLeftRight( 0, 0, 900, 1824 )
				self.categoryInfo:setTopBottom( 0, 0, 214.5, 974.5 )
				self.categoryInfo:setAlpha( 0 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setLeftRight( 0, 0, 900.5, 1575.5 )
				self.playlistInfo:setTopBottom( 0, 0, 215, 1040 )
				self.clipFinished( playlistInfo, {} )
				PlaylistDLC1CRM:completeAnimation()
				self.PlaylistDLC1CRM:setAlpha( 0 )
				self.clipFinished( PlaylistDLC1CRM, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeElementNotFocusable( self, "playlistList", controller )
		SetElementStateByElementName( self, "frame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "FEMenuLeftGraphics",
			clipName = "Intro"
		}, controller )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if ShouldShowDLCWidget( controller, "mp_rise" ) and IsMenuInState( menu, "DefaultState" ) then
			SetElementProperty( element, "mapName", "mp_rise" )
			OpenPurchaseMapPackConfirmation( controller, element, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ShouldShowDLCWidget( controller, "mp_rise" ) and IsMenuInState( menu, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.frame:close()
		self.playlistCategoriesList:close()
		self.playlistList:close()
		self.categoryInfo:close()
		self.playlistInfo:close()
		self.FEMenuLeftGraphics:close()
		self.PlaylistDLC1CRM:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

