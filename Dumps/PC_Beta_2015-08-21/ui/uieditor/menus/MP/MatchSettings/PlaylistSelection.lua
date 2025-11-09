require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistCategoryMatchSettingsInfo" )
require( "ui.uieditor.widgets.MP.MatchSettings.playlistMatchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

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
				local f3_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "ButtonBits." .. Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
				if f3_local0 then
					Engine.SetModelValue( f3_local0, Enum.LUIButtonFlags.FLAG_DOWN )
				end
			end
			f1_arg0.m_playlistSet = true
			return true
		end )
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f0_local0( f4_arg0, f4_arg1 )
end

local f0_local2 = function ( f5_arg0, f5_arg1 )
	for f5_local6, f5_local7 in ipairs( f5_arg0 ) do
		for f5_local3, f5_local4 in ipairs( f5_local7.playlists ) do
			if f5_local4.index == f5_arg1 then
				return f5_local7
			end
		end
	end
	return nil
end

DataSources.PlaylistCategories = DataSourceHelpers.ListSetup( "PlaylistCategories", function ( f6_arg0 )
	local f6_local0 = {}
	local f6_local1 = Engine.GetPlaylistCategories()
	local f6_local2 = CoD.PlaylistCategoryFilter or ""
	local f6_local3 = f0_local2( f6_local1, Engine.ProfileInt( f6_arg0, "playlist_" .. f6_local2 ) )
	local f6_local4 = 0
	for f6_local8, f6_local9 in ipairs( f6_local1 ) do
		if f6_local9.filter == f6_local2 then
			f6_local4 = f6_local4 + f6_local9.playerCount
		end
	end
	f6_local5 = function ( f7_arg0 )
		local f7_local0 = ""
		if f6_local4 > 0 then
			if Engine.DvarBool( nil, "groupCountsVisible" ) == true then
				f7_local0 = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( f7_arg0.playerCount ), CoD.separateNumberWithCommas( f6_local4 ) )
			else
				f7_local0 = Engine.Localize( "MENU_CATEGORY_USER_PERCENT", math.floor( f7_arg0.playerCount / f6_local4 * 100 + 0.5 ) )
			end
		end
		return {
			models = {
				text = Engine.ToUpper( f7_arg0.name ) or "",
				image = f7_arg0.icon or "playlist_standard",
				description = f7_arg0.description or "",
				playlistCount = f7_local0
			},
			properties = {
				id = f7_arg0.ref,
				category = f7_arg0,
				selectIndex = f7_arg0 == f6_local3
			}
		}
	end
	
	for f6_local9, f6_local10 in ipairs( f6_local1 ) do
		if f6_local10.filter == f6_local2 then
			table.insert( f6_local0, f6_local5( f6_local10 ) )
		end
	end
	return f6_local0
end, true )
local f0_local3 = LuaEnums.createEnum( "tdm", "ctf", "koth", "dom", "conf" )
DataSources.PlaylistModes = DataSourceHelpers.ListSetup( "PlaylistModes", function ( f8_arg0 )
	local f8_local0 = {}
	if CoD.perController[f8_arg0].playlistCategory then
		local f8_local1 = Engine.ProfileInt( f8_arg0, "playlist_" .. (CoD.PlaylistCategoryFilter or "") )
		for f8_local6, f8_local7 in ipairs( CoD.perController[f8_arg0].playlistCategory.playlists ) do
			local f8_local5 = ""
			if CoD.perController[f8_arg0].playlistCategory.playerCount > 0 then
				if Engine.DvarBool( nil, "groupCountsVisible" ) == true then
					f8_local5 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( f8_local7.playerCount ), CoD.separateNumberWithCommas( CoD.perController[f8_arg0].playlistCategory.playerCount ) )
				else
					f8_local5 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( f8_local7.playerCount / CoD.perController[f8_arg0].playlistCategory.playerCount * 100 + 0.5 ) )
				end
			end
			table.insert( f8_local0, {
				models = {
					text = f8_local7.name or "",
					image = f8_local7.icon or "blacktransparent",
					description = f8_local7.description or "",
					playlistCount = f8_local5
				},
				properties = {
					id = tostring( f8_local7.index ),
					playlist = f8_local7,
					selectIndex = f8_local7.index == f8_local1,
					disabled = Engine.IsPlaylistLocked( f8_arg0, f8_local7.index )
				}
			} )
		end
	end
	return f8_local0
end, true )
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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, -44.67, 1315.33 )
	LeftPanel:setTopBottom( true, false, 16.5, 822.5 )
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
	frame.titleLabel:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local playlistCategoriesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playlistCategoriesList:makeFocusable()
	playlistCategoriesList:setLeftRight( true, false, 71, 351 )
	playlistCategoriesList:setTopBottom( true, false, 142, 480 )
	playlistCategoriesList:setDataSource( "PlaylistCategories" )
	playlistCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	playlistCategoriesList:setVerticalCount( 10 )
	playlistCategoriesList:linkToElementModel( playlistCategoriesList, "disabled", true, function ( model )
		local f12_local0 = playlistCategoriesList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	playlistCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	self:AddButtonCallbackFunction( playlistCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
				local f17_local0
				if not IsParentListInFocus( element ) then
					f17_local0 = IsDisabled( element, controller )
				else
					f17_local0 = false
				end
				return f17_local0
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
	playlistList:setLeftRight( true, false, 395, 675 )
	playlistList:setTopBottom( true, false, 142, 650 )
	playlistList:setDataSource( "PlaylistModes" )
	playlistList:setWidgetType( CoD.List1Button_Playlist )
	playlistList:setVerticalCount( 15 )
	playlistList:linkToElementModel( playlistList, "disabled", true, function ( model )
		local f20_local0 = playlistList
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistList:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f21_local0
	end )
	playlistList:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
	end )
	self:AddButtonCallbackFunction( playlistList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
				local f25_local0
				if not IsParentListInFocus( element ) then
					f25_local0 = IsDisabled( element, controller )
				else
					f25_local0 = false
				end
				return f25_local0
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
	categoryInfo:setLeftRight( true, false, 755, 1096 )
	categoryInfo:setTopBottom( true, false, 142, 650 )
	categoryInfo:setAlpha( 0.6 )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
	local playlistInfo = CoD.playlistMatchSettingsInfo.new( self, controller )
	playlistInfo:setLeftRight( true, false, 755, 1216 )
	playlistInfo:setTopBottom( true, false, 142, 669 )
	self:addElement( playlistInfo )
	self.playlistInfo = playlistInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f32_local0 = nil
		MakeElementNotFocusable( self, "playlistList", controller )
		if not f32_local0 then
			f32_local0 = self:dispatchEventToChildren( event )
		end
		return f32_local0
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

