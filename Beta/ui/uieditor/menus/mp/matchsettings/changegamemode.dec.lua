require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.List1Button_Playlist" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local customGameModeIcons = {
	party = "playlist_party",
	saved = "playlist_party"
}
local ChangeGameModeCategoriesPrepare = function ( controller )
	local categories = {}
	local gametypeName = Engine.DvarString( nil, "ui_gametype" )
	local gametypeCategory = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametypeName, "groupname" )
	local createGameModeCategory = function ( categoryName, disabled )
		return {
			models = {
				text = "MPUI_CATEGORY_" .. categoryName .. "_CAPS",
				image = customGameModeIcons[categoryName] or "playlist_standard",
				description = "MPUI_CATEGORY_" .. categoryName .. "_DESC"
			},
			properties = {
				category = categoryName,
				selectIndex = gametypeCategory == categoryName,
				disabled = disabled
			}
		}
	end
	
	if CoD.isCampaign == true then
		table.insert( categories, createGameModeCategory( "missions" ) )
		table.insert( categories, createGameModeCategory( "sidemissions" ) )
		table.insert( categories, createGameModeCategory( "dev" ) )
	elseif CoD.isZombies == true then
		table.insert( categories, createGameModeCategory( "zclassic" ) )
		table.insert( categories, createGameModeCategory( "zsurvival" ) )
		table.insert( categories, createGameModeCategory( "zencounter" ) )
	elseif LuaUtils.IsGamescomBuild() then
		table.insert( categories, createGameModeCategory( "standard" ) )
	else
		table.insert( categories, createGameModeCategory( "standard" ) )
		table.insert( categories, createGameModeCategory( "saved" ) )
	end
	return categories
end

DataSources.ChangeGameModeCategories = DataSourceHelpers.ListSetup( "ChangeGameModeCategories", ChangeGameModeCategoriesPrepare, true )
local demoBuildGameModes = LuaEnums.createEnum( "tdm", "ctf", "koth", "dom", "conf", "sd", "dem", "ball", "escort" )
local ChangeGameModeModesPrepare = function ( controller )
	local gameModesList = {}
	local isGameModeInDemo = function ( gameMode )
		return demoBuildGameModes[gameMode] ~= nil
	end
	
	local gameModes = Engine.GetGametypesBase()
	local currentGameMode = Engine.DvarString( nil, "ui_gametype" )
	for index, gameMode in pairs( gameModes ) do
		if gameMode.category == CoD.perController[controller].gameModeCategory then
			local f3_local3 = table.insert
			local f3_local4 = gameModesList
			local f3_local5 = {
				models = {
					text = REG9.name,
					image = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", REG9.gametype, "image" ),
					description = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", REG9.gametype, "description" )
				}
			}
			local f3_local6 = {
				gametype = REG9.gametype,
				selectIndex = REG9.gametype == currentGameMode
			}
			local f3_local7 = Dvar.ui_execdemo:get()
			if f3_local7 then
				f3_local7 = not isGameModeInDemo( REG9.gametype )
			end
			f3_local6.disabled = f3_local7
			f3_local5.properties = f3_local6
			f3_local3( f3_local4, f3_local5 )
		end
	end
	return gameModesList
end

DataSources.ChangeGameModeModes = DataSourceHelpers.ListSetup( "ChangeGameModeModes", ChangeGameModeModesPrepare, true )
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
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, -44.67, 1315.33 )
	LeftPanel:setTopBottom( true, false, 71.5, 822.5 )
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
	frame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local gameModeCategoriesList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gameModeCategoriesList:makeFocusable()
	gameModeCategoriesList:setLeftRight( true, false, 71, 351 )
	gameModeCategoriesList:setTopBottom( true, false, 142, 310 )
	gameModeCategoriesList:setDataSource( "ChangeGameModeCategories" )
	gameModeCategoriesList:setWidgetType( CoD.List1Button_Playlist )
	gameModeCategoriesList:setVerticalCount( 5 )
	gameModeCategoriesList:linkToElementModel( "disabled", true, function ( model )
		local element = gameModeCategoriesList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gameModeCategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	gameModeCategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( gameModeCategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	gameModeCategoriesList:linkToElementModel( "disabled", true, function ( model )
		menu:updateElementState( gameModeCategoriesList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( gameModeCategoriesList )
	self.gameModeCategoriesList = gameModeCategoriesList
	
	local gameModeList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	gameModeList:makeFocusable()
	gameModeList:setLeftRight( true, false, 395, 675 )
	gameModeList:setTopBottom( true, false, 141, 649 )
	gameModeList:setDataSource( "ChangeGameModeModes" )
	gameModeList:setWidgetType( CoD.List1Button_Playlist )
	gameModeList:setVerticalCount( 15 )
	gameModeList:linkToElementModel( "disabled", true, function ( model )
		local element = gameModeList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	gameModeList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	gameModeList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( gameModeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	gameModeList:linkToElementModel( "disabled", true, function ( model )
		menu:updateElementState( gameModeList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:addElement( gameModeList )
	self.gameModeList = gameModeList
	
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
	
	local gameModeInfo = CoD.matchSettingsInfo.new( menu, controller )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( menu, controller )
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeElementNotFocusable( self, "gameModeList", controller )
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
		menu = menu
	} )
	if not self:restoreState() then
		self.gameModeCategoriesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FadeForStreamer:close()
		self.frame:close()
		self.gameModeCategoriesList:close()
		self.gameModeList:close()
		self.categoryInfo:close()
		self.gameModeInfo:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeGameMode.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

