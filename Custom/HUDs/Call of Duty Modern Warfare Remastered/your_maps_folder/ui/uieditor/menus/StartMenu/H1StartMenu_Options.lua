require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "menu_opened", function ()
		return true
	end )

	self.disableLeaderChangePopupShutdown = true

	if CoD.isCampaign then
		self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "H1StartMenu_Options" ) )
	end

	if CoD.isZombie then
		self.disableDarkenElement = true
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

DataSources.StartMenuOptionsTabs = ListHelper_SetupDataSource( "StartMenuOptionsTabs", function ( controller )
	local tabList = {}

	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )

    if Engine.IsInGame() then
        if Engine.IsZombiesGame() then
			table.insert( tabList, {
				models = {
					tabName = "MENU_OPTIONS_CONTROLS_CAPS",
					tabWidget = "CoD.StartMenu_Options",
					tabIcon = ""
				},
				properties = {
					tabId = "options"
				}
			} )
        end
    end
    
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )

	return tabList
end, true )

LUI.createMenu.H1StartMenu_Options = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "H1StartMenu_Options" )

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "H1StartMenu_Options.buttonPrompts" )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, true, 0, 0 )
	self.Background:setTopBottom( true, true, 0, 0 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self.Background:setRGB( 0, 0, 0 )
	self.Background:setAlpha( 0.5 )
	self:addElement( self.Background )
	
	self.FETabBar = CoD.FE_TabBar.new( self, controller )
	self.FETabBar:setLeftRight( true, true, 0, 1217 )
	self.FETabBar:setTopBottom( true, false, 85, 126 )
	self.FETabBar.Tabs.grid:setHorizontalCount( 8 )
	self.FETabBar.Tabs.grid:setDataSource( "StartMenuOptionsTabs" )
	self.FETabBar.Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	self:addElement( self.FETabBar )

	self.TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	self.TabFrame:setLeftRight( false, false, -574, 576 )
	self.TabFrame:setTopBottom( false, false, -221, 299 )
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
		GoBack( menu, controller )

		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )

		return true
	end, false )
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		GoBack( menu, controller )

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
		GoBack( menu, controller )

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
		element.Background:close()
		element.FETabBar:close()
		element.TabFrame:close()

		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "H1StartMenu_Options.buttonPrompts" ) )
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end
