require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistCategoryMatchSettingsInfo" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistMatchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local FindPlaylistCategory = function ( categories, playlistId )
	for index, category in ipairs( categories ) do
		for pindex, playlist in ipairs( category.playlists ) do
			if playlist.index == playlistId then
				return REG6
			end
		end
	end
	return nil
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
			totalCategoryPlayerCounter = totalCategoryPlayerCounter + REG11.playerCount
		end
	end
	local createPlaylistCategory = function ( category )
		local playlistCountString = ""
		if totalCategoryPlayerCounter > 0 then
			if Engine.DvarBool( nil, "groupCountsVisible" ) == true then
				playlistCountString = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( category.playerCount ), CoD.separateNumberWithCommas( totalCategoryPlayerCounter ) )
			else
				playlistCountString = Engine.Localize( "MENU_CATEGORY_USER_PERCENT", math.floor( category.playerCount / totalCategoryPlayerCounter * 100 + 0.5 ) )
			end
		end
		return {
			models = {
				text = Engine.ToUpper( category.name ) or "",
				image = category.icon or "playlist_standard",
				description = category.description or "",
				playlistCount = playlistCountString
			},
			properties = {
				id = category.ref,
				category = category,
				selectIndex = category == profile_category
			}
		}
	end
	
	for index, category in ipairs( categories ) do
		if category.filter == filter then
			table.insert( categoryItems, createPlaylistCategory( REG12 ) )
		end
	end
	return categoryItems
end

DataSources.PlaylistCategories = DataSourceHelpers.ListSetup( "PlaylistCategories", PlaylistCategoriesPrepare, true )
local demoBuildGameModes = LuaEnums.createEnum( "tdm", "ctf", "koth", "dom", "conf" )
local PlaylistModesPrepare = function ( controller )
	local playlists = {}
	if CoD.perController[controller].playlistCategory then
		local filter = CoD.PlaylistCategoryFilter or ""
		local profile_playlist_index = Engine.ProfileInt( controller, "playlist_" .. filter )
		for index, playlist in ipairs( CoD.perController[controller].playlistCategory.playlists ) do
			local f4_local3 = ""
			if CoD.perController[controller].playlistCategory.playerCount > 0 then
				if Engine.DvarBool( nil, "groupCountsVisible" ) == true then
					f4_local3 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( REG8.playerCount ), CoD.separateNumberWithCommas( CoD.perController[controller].playlistCategory.playerCount ) )
				else
					f4_local3 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( REG8.playerCount / CoD.perController[controller].playlistCategory.playerCount * 100 + 0.5 ) )
				end
			end
			table.insert( playlists, {
				models = {
					text = REG8.name or "",
					image = REG8.icon or "blacktransparent",
					description = REG8.description or "",
					playlistCount = f4_local3
				},
				properties = {
					id = tostring( REG8.index ),
					playlist = REG8,
					selectIndex = REG8.index == profile_playlist_index,
					disabled = Engine.IsPlaylistLocked( controller, REG8.index )
				}
			} )
		end
	end
	return playlists
end

DataSources.PlaylistModes = DataSourceHelpers.ListSetup( "PlaylistModes", PlaylistModesPrepare, true )
LUI.createMenu.PlaylistSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PlaylistSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, -44.67, 1315.33 )
	LeftPanel:setTopBottom( true, false, 16.5, 822.5 )
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
	frame.titleLabel:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local playlistCategoriesList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistCategoriesList:makeFocusable()
	playlistCategoriesList:setLeftRight( true, false, 71, 351 )
	playlistCategoriesList:setTopBottom( true, false, 142, 480 )
	playlistCategoriesList:setDataSource( "PlaylistCategories" )
	playlistCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	playlistCategoriesList:setVerticalCount( 10 )
	playlistCategoriesList:linkToElementModel( "disabled", true, function ( model )
		local element = playlistCategoriesList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( playlistCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			SetElementPropertyOnPerControllerTable( controller, "playlistCategory", element, "category" )
			UpdateElementDataSource( self, "playlistList" )
			SetMenuState( menu, "SelectingPlaylist" )
			SetLoseFocusToElement( self, "playlistCategoriesList", controller )
			MakeElementNotFocusable( self, "playlistCategoriesList", controller )
			MakeElementFocusable( self, "playlistList", controller )
			SetFocusToElement( self, "playlistList", controller )
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
	playlistCategoriesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsParentListInFocus( element ) then
					f13_local0 = IsDisabled( element, controller )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	playlistCategoriesList:linkToElementModel( "disabled", true, function ( model )
		menu:updateElementState( playlistCategoriesList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( playlistCategoriesList )
	self.playlistCategoriesList = playlistCategoriesList
	
	local playlistList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistList:makeFocusable()
	playlistList:setLeftRight( true, false, 395, 675 )
	playlistList:setTopBottom( true, false, 142, 650 )
	playlistList:setDataSource( "PlaylistModes" )
	playlistList:setWidgetType( CoD.List1Button_Playlist )
	playlistList:setVerticalCount( 15 )
	playlistList:linkToElementModel( "disabled", true, function ( model )
		local element = playlistList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( playlistList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			PlaylistSelected( menu, element, controller )
			ClearSavedState( self, controller )
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
	playlistList:mergeStateConditions( {
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
	playlistList:linkToElementModel( "disabled", true, function ( model )
		menu:updateElementState( playlistList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( playlistList )
	self.playlistList = playlistList
	
	local categoryInfo = CoD.playlistCategoryMatchSettingsInfo.new( menu, controller )
	categoryInfo:setLeftRight( true, false, 755, 1096 )
	categoryInfo:setTopBottom( true, false, 142, 650 )
	categoryInfo:setAlpha( 0.6 )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
	local playlistInfo = CoD.playlistMatchSettingsInfo.new( menu, controller )
	playlistInfo:setLeftRight( true, false, 755, 1216 )
	playlistInfo:setTopBottom( true, false, 142, 669 )
	self:addElement( playlistInfo )
	self.playlistInfo = playlistInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( menu, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	categoryInfo:linkToElementModel( playlistCategoriesList, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	playlistInfo:linkToElementModel( playlistList, nil, false, function ( model )
		playlistInfo:setModel( model, controller )
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
				self:setupElementClipCounter( 3 )
				playlistList:completeAnimation()
				self.playlistList:setAlpha( 0 )
				self.clipFinished( playlistList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 1 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setAlpha( 0 )
				self.clipFinished( playlistInfo, {} )
			end
		},
		SelectingPlaylist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playlistList:completeAnimation()
				self.playlistList:setAlpha( 1 )
				self.clipFinished( playlistList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 0 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setLeftRight( true, false, 755, 1171 )
				self.playlistInfo:setTopBottom( true, false, 142, 650 )
				self.playlistInfo:setAlpha( 1 )
				self.clipFinished( playlistInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeElementNotFocusable( self, "playlistList", controller )
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
			SetPerControllerTableProperty( controller, "playlistCategory", nil )
			SetMenuState( menu, "DefaultState" )
			SetLoseFocusToElement( self, "playlistList", controller )
			MakeElementNotFocusable( self, "playlistList", controller )
			MakeElementFocusable( self, "playlistCategoriesList", controller )
			SetFocusToElement( self, "playlistCategoriesList", controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
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
		menu = menu
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

