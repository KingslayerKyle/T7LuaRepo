require( "ui.uieditor.menus.StartMenu.T4StartMenu_GameOptions_ZM" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "menu_opened", function ()
		return true
	end )

	self.disableLeaderChangePopupShutdown = true

	if CoD.isCampaign then
		self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Main" ) )
	end

	if CoD.isZombie then
		self.disableDarkenElement = false
		self.disablePopupOpenCloseAnim = true
	end

	self:registerEventHandler( "open_migration_menu", function ( element, event )
		CloseAllOccludingMenus( element, controller )
		StartMenuResumeGame( element, event.controller )
		GoBack( element, event.controller )
	end )

	if CoD.isSafehouse and CoD.isOnlineGame() then
		SetGlobalModelValue( "combatRecordMode", "cp" )
	end

	SetControllerModelValue( controller, "forceScoreboard", 0 )
end

DataSources.StartMenuTabs = ListHelper_SetupDataSource( "StartMenuTabs", function ( controller )
	local tabList = {}

    if Engine.IsInGame() then
        if Engine.IsZombiesGame() then
			table.insert( tabList, {
				models = {
					tabName = "MENU_START_MENU_CAPS",
					tabWidget = "CoD.T4StartMenu_GameOptions_ZM",
					tabIcon = ""
				},
				properties = {
					tabId = "gameOptions"
				}
			} )
        end
    end

	return tabList
end, true )

LUI.createMenu.StartMenu_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Main" )

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	self.Background1 = LUI.UIImage.new()
	self.Background1:setLeftRight( true, true, 0, 0 )
	self.Background1:setTopBottom( true, false, 0, 97.5 )
	self.Background1:setImage( RegisterImage( "$white" ) )
	self.Background1:setRGB( 0, 0, 0 )
	self:addElement( self.Background1 )

	self.Background2 = LUI.UIImage.new()
	self.Background2:setLeftRight( true, true, 0, 0 )
	self.Background2:setTopBottom( true, false, 97.5, 628 )
	self.Background2:setImage( RegisterImage( "$white" ) )
	self.Background2:setRGB( 0.025, 0.025, 0.025 )
	self.Background2:setAlpha( 0.75 )
	self:addElement( self.Background2 )

	self.Background3 = LUI.UIImage.new()
	self.Background3:setLeftRight( true, true, 0, 0 )
	self.Background3:setTopBottom( true, false, 628, 720 )
	self.Background3:setImage( RegisterImage( "$white" ) )
	self.Background3:setRGB( 0, 0, 0 )
	self:addElement( self.Background3 )

	self.DividerTop = LUI.UIImage.new()
	self.DividerTop:setLeftRight( true, true, 0, 0 )
	self.DividerTop:setTopBottom( true, false, 95.5, 97.5 )
	self.DividerTop:setImage( RegisterImage( "$white" ) )
	self.DividerTop:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.DividerTop:setShaderVector( 0, 0.2, 0.2, 0.2, 0.2 )
	self.DividerTop:setRGB( 0.4, 0.4, 0.4 )
	self:addElement( self.DividerTop )

	self.DividerBottom = LUI.UIImage.new()
	self.DividerBottom:setLeftRight( true, true, 0, 0 )
	self.DividerBottom:setTopBottom( true, false, 628, 630 )
	self.DividerBottom:setImage( RegisterImage( "$white" ) )
	self.DividerBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.DividerBottom:setShaderVector( 0, 0.2, 0.2, 0.2, 0.2 )
	self.DividerBottom:setRGB( 0.4, 0.4, 0.4 )
	self:addElement( self.DividerBottom )

	self.FETabBar = CoD.FE_TabBar.new( self, controller )
	self.FETabBar:setLeftRight( true, true, 0, 0 )
	self.FETabBar:setTopBottom( true, true, 0, 0 )
	self.FETabBar.FETabIdle00:setScale( 0 )
	self.FETabBar.Tabs.grid:setHorizontalCount( 8 )
	self.FETabBar.Tabs.grid:setDataSource( "StartMenuTabs" )
	self.FETabBar.Tabs.grid:setWidgetType( CoD.basicTabList )
	self.FETabBar.FETabIdle0:setScale( 0 )
	self:addElement( self.FETabBar )

	self.TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	self.TabFrame:setLeftRight( true, true, 0, 0 )
	self.TabFrame:setTopBottom( true, true, 0, 0 )
	self.TabFrame:linkToElementModel( self.FETabBar.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )

		if tabWidget then
			self.TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self:addElement( self.TabFrame )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		IsFrontEnd = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Zombies = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ingame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "IsFrontEnd",
			condition = function ( menu, element, event )
				return InFrontend()
			end
		},
		{
			stateName = "Zombies",
			condition = function ( menu, element, event )
				return IsZombies()
			end
		},
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		},
		{
			stateName = "Ingame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )

	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )

	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		
		PlaySoundSetSound( self, "menu_enter" )
		FileshareGetSlots( self, element, controller )
		SetHeadingKickerTextToGameMode( "" )
		PrepareOpenMenuInSafehouse( controller )

		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end

		return retVal
	end )

	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		RefreshLobbyRoom( menu, controller )
		StartMenuGoBack( menu, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )

		return true
	end, false )
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		RefreshLobbyRoom( menu, controller )
		StartMenuGoBack( menu, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )

		return true
	end, false )

	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		PlaySoundSetSound( self, "list_action" )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )

		return true
	end, false )

	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		if IsInGame() and not IsLobbyNetworkModeLAN() and not IsDemoPlaying() then
			OpenPopup( self, "Social_Main", controller, "", "" )

			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInGame() and not IsLobbyNetworkModeLAN() and not IsDemoPlaying() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_SOCIAL" )

			return true
		else
			return false
		end
	end, false )

	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "ESCAPE", function ( element, menu, controller, model )
		RefreshLobbyRoom( menu, controller )
		StartMenuGoBack( menu, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
		
		return true
	end, false, true )

	self.TabFrame.id = "TabFrame"

	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )

	self:processEvent( {
		name = "update_state",
		menu = self
	} )

	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background1:close()
		element.Background2:close()
		element.Background3:close()
		element.DividerTop:close()
		element.DividerBottom:close()
		element.FETabBar:close()
		element.TabFrame:close()

		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Main.buttonPrompts" ) )
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end
