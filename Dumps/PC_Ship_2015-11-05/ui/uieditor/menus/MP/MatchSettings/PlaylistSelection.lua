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
				CoD.PCUtil.SimulateButtonPress( f1_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			end
			f1_arg0.m_playlistSet = true
			return true
		end )
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f0_local0( f4_arg0, f4_arg1 )
end

local f0_local2 = function ( f5_arg0 )
	if 0 < f5_arg0 then
		return true
	elseif Dvar.groupZeroCountsVisible:exists() == true and Dvar.groupZeroCountsVisible:get() == true then
		return true
	else
		return false
	end
end

function FindPlaylistCategory( f6_arg0, f6_arg1 )
	for f6_local6, f6_local7 in ipairs( f6_arg0 ) do
		for f6_local3, f6_local4 in ipairs( f6_local7.playlists ) do
			if f6_local4.index == f6_arg1 then
				return f6_local7
			end
		end
	end
	return nil
end

DataSources.PlaylistCategories = DataSourceHelpers.ListSetup( "PlaylistCategories", function ( f7_arg0 )
	local f7_local0 = {}
	local f7_local1 = Engine.GetPlaylistCategories()
	local f7_local2 = CoD.PlaylistCategoryFilter or ""
	local f7_local3 = FindPlaylistCategory( f7_local1, Engine.ProfileInt( f7_arg0, "playlist_" .. f7_local2 ) )
	local f7_local4 = 0
	for f7_local8, f7_local9 in ipairs( f7_local1 ) do
		if f7_local9.filter == f7_local2 then
			f7_local4 = f7_local4 + f7_local9.playerCount
		end
	end
	f7_local5 = function ( f8_arg0 )
		local f8_local0 = ""
		if f0_local2( f7_local4 ) then
			if Dvar.groupCountsVisible:get() == true then
				f8_local0 = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( f8_arg0.playerCount ), CoD.separateNumberWithCommas( f7_local4 ) )
			else
				f8_local0 = Engine.Localize( "MENU_CATEGORY_USER_PERCENT", math.floor( f8_arg0.playerCount / f7_local4 * 100 + 0.5 ) )
			end
		end
		local f8_local1 = IsZombies()
		if f8_local1 then
			f8_local1 = #f8_arg0.playlists == 1
		end
		local f8_local2 = f8_arg0.playlists[1]
		local f8_local3 = {
			models = {
				text = Engine.ToUpper( f8_arg0.name ) or "",
				image = f8_arg0.icon or "playlist_standard",
				description = f8_arg0.description or "",
				playlistCount = f8_local0
			}
		}
		local f8_local4 = {
			id = f8_arg0.ref,
			category = f8_arg0,
			autoPlay = f8_local1,
			playlist = f8_local2,
			selectIndex = f8_arg0 == f7_local3
		}
		local f8_local5 = f8_local1
		local f8_local6
		if f8_local2 then
			f8_local6 = Engine.IsPlaylistLocked( f7_arg0, f8_local2.index )
		else
			f8_local6 = f8_local5 and true
		end
		f8_local4.disabled = f8_local6
		f8_local3.properties = f8_local4
		return f8_local3
	end
	
	for f7_local9, f7_local10 in ipairs( f7_local1 ) do
		if f7_local10.filter == f7_local2 then
			table.insert( f7_local0, f7_local5( f7_local10 ) )
		end
	end
	return f7_local0
end, true )
local f0_local3 = LuaEnums.createEnum( "tdm", "ctf", "koth", "dom", "conf" )
DataSources.PlaylistModes = DataSourceHelpers.ListSetup( "PlaylistModes", function ( f9_arg0 )
	local f9_local0 = {}
	if CoD.perController[f9_arg0].playlistCategory then
		local f9_local1 = Engine.ProfileInt( f9_arg0, "playlist_" .. (CoD.PlaylistCategoryFilter or "") )
		for f9_local6, f9_local7 in ipairs( CoD.perController[f9_arg0].playlistCategory.playlists ) do
			local f9_local5 = ""
			if f0_local2( CoD.perController[f9_arg0].playlistCategory.playerCount ) then
				if Dvar.groupCountsVisible:get() == true then
					f9_local5 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( f9_local7.playerCount ), CoD.separateNumberWithCommas( CoD.perController[f9_arg0].playlistCategory.playerCount ) )
				else
					f9_local5 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( f9_local7.playerCount / CoD.perController[f9_arg0].playlistCategory.playerCount * 100 + 0.5 ) )
				end
			end
			table.insert( f9_local0, {
				models = {
					text = f9_local7.name or "",
					image = f9_local7.icon or "blacktransparent",
					description = f9_local7.description or "",
					playlistCount = f9_local5
				},
				properties = {
					id = tostring( f9_local7.index ),
					playlist = f9_local7,
					selectIndex = f9_local7.index == f9_local1,
					disabled = Engine.IsPlaylistLocked( f9_arg0, f9_local7.index )
				}
			} )
		end
	end
	return f9_local0
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlaylistSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, true, 0, 0 )
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
	playlistCategoriesList:setDataSource( "PlaylistCategories" )
	playlistCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	playlistCategoriesList:setVerticalCount( 10 )
	playlistCategoriesList:linkToElementModel( playlistCategoriesList, "disabled", true, function ( model )
		local f13_local0 = playlistCategoriesList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	playlistCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( playlistCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and IsElementPropertyValue( element, "autoPlay", true ) then
			PlaylistSelected( menu, element, controller )
			ClearSavedState( self, controller )
			return true
		elseif not IsDisabled( element, controller ) then
			PlaylistCategorySelected( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) and IsElementPropertyValue( element, "autoPlay", true ) then
			return true
		elseif not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	playlistCategoriesList:mergeStateConditions( {
		{
			stateName = "Disabled_NoListFocus",
			condition = function ( menu, element, event )
				local f18_local0
				if not IsParentListInFocus( element ) then
					f18_local0 = IsDisabled( element, controller )
				else
					f18_local0 = false
				end
				return f18_local0
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
	playlistList:setDataSource( "PlaylistModes" )
	playlistList:setWidgetType( CoD.List1Button_Playlist )
	playlistList:setVerticalCount( 15 )
	playlistList:linkToElementModel( playlistList, "disabled", true, function ( model )
		local f21_local0 = playlistList
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	playlistList:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	playlistList:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
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
				local f26_local0
				if not IsParentListInFocus( element ) then
					f26_local0 = IsDisabled( element, controller )
				else
					f26_local0 = false
				end
				return f26_local0
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
				self.categoryInfo:setLeftRight( true, false, 600, 1053 )
				self.categoryInfo:setTopBottom( true, false, 143, 693.25 )
				self.categoryInfo:setAlpha( 1 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setLeftRight( true, false, 640, 1049 )
				self.playlistInfo:setTopBottom( true, false, 143, 669 )
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
				self.categoryInfo:setLeftRight( true, false, 600, 1216 )
				self.categoryInfo:setTopBottom( true, false, 143, 650 )
				self.categoryInfo:setAlpha( 0 )
				self.clipFinished( categoryInfo, {} )
				playlistInfo:completeAnimation()
				self.playlistInfo:setLeftRight( true, false, 600, 1050 )
				self.playlistInfo:setTopBottom( true, false, 143, 693.25 )
				self.playlistInfo:setAlpha( 1 )
				self.clipFinished( playlistInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f33_local0 = nil
		MakeElementNotFocusable( self, "playlistList", controller )
		SetElementStateByElementName( self, "frame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "FEMenuLeftGraphics",
			clipName = "Intro"
		}, controller )
		if not f33_local0 then
			f33_local0 = self:dispatchEventToChildren( event )
		end
		return f33_local0
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

