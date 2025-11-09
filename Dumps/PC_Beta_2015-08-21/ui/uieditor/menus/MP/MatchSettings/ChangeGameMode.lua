require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local f0_local0 = {
	party = "playlist_party",
	saved = "playlist_party"
}
DataSources.ChangeGameModeCategories = DataSourceHelpers.ListSetup( "ChangeGameModeCategories", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Engine.DvarString( nil, "ui_gametype" ), "groupname" )
	local f1_local2 = function ( f2_arg0, f2_arg1 )
		return {
			models = {
				text = "MPUI_CATEGORY_" .. f2_arg0 .. "_CAPS",
				image = f0_local0[f2_arg0] or "playlist_standard",
				description = "MPUI_CATEGORY_" .. f2_arg0 .. "_DESC"
			},
			properties = {
				category = f2_arg0,
				selectIndex = f1_local1 == f2_arg0,
				disabled = f2_arg1
			}
		}
	end
	
	if CoD.isCampaign == true then
		table.insert( f1_local0, f1_local2( "missions" ) )
		table.insert( f1_local0, f1_local2( "sidemissions" ) )
		table.insert( f1_local0, f1_local2( "dev" ) )
	elseif CoD.isZombies == true then
		table.insert( f1_local0, f1_local2( "zclassic" ) )
		table.insert( f1_local0, f1_local2( "zsurvival" ) )
		table.insert( f1_local0, f1_local2( "zencounter" ) )
	elseif LuaUtils.IsGamescomBuild() then
		table.insert( f1_local0, f1_local2( "standard" ) )
	else
		table.insert( f1_local0, f1_local2( "standard" ) )
		table.insert( f1_local0, f1_local2( "saved" ) )
	end
	return f1_local0
end, true )
local f0_local1 = LuaEnums.createEnum( "tdm", "ctf", "koth", "dom", "conf", "sd", "dem", "ball", "escort" )
DataSources.ChangeGameModeModes = DataSourceHelpers.ListSetup( "ChangeGameModeModes", function ( f3_arg0 )
	local f3_local0 = {}
	local f3_local1 = function ( f4_arg0 )
		return f0_local1[f4_arg0] ~= nil
	end
	
	local f3_local2 = Engine.GetGametypesBase()
	local f3_local3 = Engine.DvarString( nil, "ui_gametype" )
	for f3_local12, f3_local13 in pairs( f3_local2 ) do
		if f3_local13.category == CoD.perController[f3_arg0].gameModeCategory then
			local f3_local7 = table.insert
			local f3_local8 = f3_local0
			local f3_local9 = {
				models = {
					text = f3_local13.name,
					image = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", f3_local13.gametype, "image" ),
					description = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", f3_local13.gametype, "description" )
				}
			}
			local f3_local10 = {
				gametype = f3_local13.gametype,
				selectIndex = f3_local13.gametype == f3_local3
			}
			local f3_local11 = Dvar.ui_execdemo:get()
			if f3_local11 then
				f3_local11 = not f3_local1( f3_local13.gametype )
			end
			f3_local10.disabled = f3_local11
			f3_local9.properties = f3_local10
			f3_local7( f3_local8, f3_local9 )
		end
	end
	return f3_local0
end, true )
LUI.createMenu.ChangeGameMode = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChangeGameMode" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, -44.67, 1315.33 )
	LeftPanel:setTopBottom( true, false, 71.5, 822.5 )
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
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local gameModeCategoriesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gameModeCategoriesList:makeFocusable()
	gameModeCategoriesList:setLeftRight( true, false, 71, 351 )
	gameModeCategoriesList:setTopBottom( true, false, 142, 310 )
	gameModeCategoriesList:setDataSource( "ChangeGameModeCategories" )
	gameModeCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	gameModeCategoriesList:setVerticalCount( 5 )
	gameModeCategoriesList:linkToElementModel( gameModeCategoriesList, "disabled", true, function ( model )
		local f8_local0 = gameModeCategoriesList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gameModeCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	gameModeCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( gameModeCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			SetElementPropertyOnPerControllerTable( controller, "gameModeCategory", element, "category" )
			UpdateElementDataSource( self, "gameModeList" )
			SetMenuState( menu, "SelectingGameMode" )
			SetLoseFocusToElement( self, "gameModeCategoriesList", controller )
			MakeElementNotFocusable( self, "gameModeCategoriesList", controller )
			MakeElementFocusable( self, "gameModeList", controller )
			SetFocusToElement( self, "gameModeList", controller )
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
	gameModeCategoriesList:mergeStateConditions( {
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
	gameModeCategoriesList:linkToElementModel( gameModeCategoriesList, "disabled", true, function ( model )
		self:updateElementState( gameModeCategoriesList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( gameModeCategoriesList )
	self.gameModeCategoriesList = gameModeCategoriesList
	
	local gameModeList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gameModeList:makeFocusable()
	gameModeList:setLeftRight( true, false, 395, 675 )
	gameModeList:setTopBottom( true, false, 141, 649 )
	gameModeList:setDataSource( "ChangeGameModeModes" )
	gameModeList:setWidgetType( CoD.List1Button_Playlist )
	gameModeList:setVerticalCount( 15 )
	gameModeList:linkToElementModel( gameModeList, "disabled", true, function ( model )
		local f16_local0 = gameModeList
		local f16_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f16_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gameModeList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	gameModeList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( gameModeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			GameModeSelected( element, controller )
			GoBack( self, controller )
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
	gameModeList:mergeStateConditions( {
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
	gameModeList:linkToElementModel( gameModeList, "disabled", true, function ( model )
		self:updateElementState( gameModeList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( gameModeList )
	self.gameModeList = gameModeList
	
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
	
	local gameModeInfo = CoD.matchSettingsInfo.new( self, controller )
	gameModeInfo:setLeftRight( true, false, 756, 1303 )
	gameModeInfo:setTopBottom( true, false, 143, 693 )
	gameModeInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( gameModeInfo )
	self.gameModeInfo = gameModeInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	categoryInfo:linkToElementModel( gameModeCategoriesList, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	gameModeInfo:linkToElementModel( gameModeList, nil, false, function ( model )
		gameModeInfo:setModel( model, controller )
	end )
	gameModeCategoriesList.navigation = {
		right = gameModeList
	}
	gameModeList.navigation = {
		left = gameModeCategoriesList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
				gameModeList:completeAnimation()
				self.gameModeList:setAlpha( 0 )
				self.clipFinished( gameModeList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 1 )
				self.clipFinished( categoryInfo, {} )
				gameModeInfo:completeAnimation()
				self.gameModeInfo:setAlpha( 0 )
				self.clipFinished( gameModeInfo, {} )
			end
		},
		SelectingGameMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
				gameModeList:completeAnimation()
				self.gameModeList:setAlpha( 1 )
				self.clipFinished( gameModeList, {} )
				categoryInfo:completeAnimation()
				self.categoryInfo:setAlpha( 0 )
				self.clipFinished( categoryInfo, {} )
				gameModeInfo:completeAnimation()
				self.gameModeInfo:setAlpha( 1 )
				self.clipFinished( gameModeInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f30_local0 = nil
		MakeElementNotFocusable( self, "gameModeList", controller )
		if not f30_local0 then
			f30_local0 = self:dispatchEventToChildren( event )
		end
		return f30_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			GoBack( self, controller )
			return true
		else
			SetPerControllerTableProperty( controller, "gameModeCategory", nil )
			SetMenuState( menu, "DefaultState" )
			SetLoseFocusToElement( self, "gameModeList", controller )
			MakeElementNotFocusable( self, "gameModeList", controller )
			MakeElementFocusable( self, "gameModeCategoriesList", controller )
			SetFocusToElement( self, "gameModeCategoriesList", controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	frame:setModel( self.buttonModel, controller )
	gameModeCategoriesList.id = "gameModeCategoriesList"
	gameModeList.id = "gameModeList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.gameModeCategoriesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FadeForStreamer:close()
		element.frame:close()
		element.gameModeCategoriesList:close()
		element.gameModeList:close()
		element.categoryInfo:close()
		element.gameModeInfo:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

