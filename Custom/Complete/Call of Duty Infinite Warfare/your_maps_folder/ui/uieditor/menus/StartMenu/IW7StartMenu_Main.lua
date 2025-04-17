require( "ui.uieditor.menus.StartMenu.IW7StartMenu_GameOptions_ZM" )
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

DataSources.StartMenuTabs = ListHelper_SetupDataSource( "StartMenuTabs", function ( controller )
	local tabList = {}

    if Engine.IsInGame() then
        if Engine.IsZombiesGame() then
			table.insert( tabList, {
				models = {
					tabName = "MENU_START_MENU_CAPS",
					tabWidget = "CoD.IW7StartMenu_GameOptions_ZM",
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

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, true, 0, 0 )
	self.Background:setTopBottom( true, true, 0, 0 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self.Background:setRGB( 0, 0, 0 )
	self.Background:setAlpha( 0.5 )
	self:addElement( self.Background )

	self.Circle = LUI.UIImage.new()
	self.Circle:setLeftRight( false, false, -290, 290 )
	self.Circle:setTopBottom( false, false, -290 - 30, 290 - 30 )
	self.Circle:setImage( RegisterImage( "zm_tix_arcane_spinner" ) )
	self:addElement( self.Circle )

	self.BottomDiagSlice = LUI.UIImage.new()
	self.BottomDiagSlice:setLeftRight( true, true, -100, 100 )
	self.BottomDiagSlice:setTopBottom( false, true, -130, 130 )
	self.BottomDiagSlice:setImage( RegisterImage( "$white" ) )
	self.BottomDiagSlice:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.BottomDiagSlice:setRGB( 0, 0, 0 )
	self.BottomDiagSlice:setZRot( 12 )
	self.BottomDiagSlice:setAlpha( 0.5 )
	self:addElement( self.BottomDiagSlice )

	self.BottomDiagSliceOutline = LUI.UIImage.new()
	self.BottomDiagSliceOutline:setLeftRight( true, true, -100 - 3, 100 - 3 )
	self.BottomDiagSliceOutline:setTopBottom( false, true, -130 - 3, -129 - 3 )
	self.BottomDiagSliceOutline:setImage( RegisterImage( "$white" ) )
	self.BottomDiagSliceOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.BottomDiagSliceOutline:setRGB( 0, 1, 0 )
	self.BottomDiagSliceOutline:setZRot( 12 )
	self.BottomDiagSliceOutline:setAlpha( 0.5 )
	self:addElement( self.BottomDiagSliceOutline )

	self.TopDiagSlice = LUI.UIImage.new()
	self.TopDiagSlice:setLeftRight( true, true, -100, 100 )
	self.TopDiagSlice:setTopBottom( true, false, -( 61 * 3 ), 61 )
	self.TopDiagSlice:setImage( RegisterImage( "$white" ) )
	self.TopDiagSlice:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.TopDiagSlice:setRGB( 0, 0, 0 )
	self.TopDiagSlice:setZRot( 12 )
	self.TopDiagSlice:setAlpha( 0.5 )
	self:addElement( self.TopDiagSlice )

	self.TopDiagSliceOutline = LUI.UIImage.new()
	self.TopDiagSliceOutline:setLeftRight( true, true, -100 + 3, 100 + 3 )
	self.TopDiagSliceOutline:setTopBottom( true, false, 60 + 3, 61 + 3 )
	self.TopDiagSliceOutline:setImage( RegisterImage( "$white" ) )
	self.TopDiagSliceOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.TopDiagSliceOutline:setRGB( 0, 1, 0 )
	self.TopDiagSliceOutline:setZRot( 12 )
	self.TopDiagSliceOutline:setAlpha( 0.5 )
	self:addElement( self.TopDiagSliceOutline )
	
	self.ZombiesLogoBlood = LUI.UIImage.new()
	self.ZombiesLogoBlood:setLeftRight( true, false, 60, 477.5 )
	self.ZombiesLogoBlood:setTopBottom( true, false, -45.5, 292 )
	self.ZombiesLogoBlood:setImage( RegisterImage( "cp_menu_zombies_blood_splats_large" ) )
	self.ZombiesLogoBlood:setAlpha( 0.5 )
	self:addElement( self.ZombiesLogoBlood )

	self.ZombiesLogo = LUI.UIImage.new()
	self.ZombiesLogo:setLeftRight( true, false, 69, 517.5 )
	self.ZombiesLogo:setTopBottom( true, false, 25, 288 )
	self.ZombiesLogo:setImage( RegisterImage( "cp_menu_zombies_logo" ) )
	self:addElement( self.ZombiesLogo )

	self.PausedTextShadow = LUI.UIText.new()
	self.PausedTextShadow:setLeftRight( true, false, 193, 0 )
	self.PausedTextShadow:setTopBottom( true, false, 200 + 12, 270 + 12 )
	self.PausedTextShadow:setTTF( "fonts/zm_clean.ttf" )
	self.PausedTextShadow:setText( Engine.Localize( "PAUSED" ) )
	self.PausedTextShadow:setRGB( 0, 0, 0 )
	self:addElement( self.PausedTextShadow )

	self.PausedText = LUI.UIText.new()
	self.PausedText:setLeftRight( true, false, 190, 0 )
	self.PausedText:setTopBottom( true, false, 200 + 9, 270 + 9 )
	self.PausedText:setTTF( "fonts/zm_clean.ttf" )
	self.PausedText:setText( Engine.Localize( "PAUSED" ) )
	self.PausedText:setRGB( 0.80, 0.05, 0.02 )
	self:addElement( self.PausedText )

	self.DevilBG1 = LUI.UIImage.new()
	self.DevilBG1:setLeftRight( false, false, -120, 120 )
	self.DevilBG1:setTopBottom( false, false, -120 - 30, 120 - 30 )
	self.DevilBG1:setImage( RegisterImage( "zm_wc_triangle" ) )
	self.DevilBG1:setScale( 1.6 )
	self.DevilBG1:setAlpha( 0.2 )
	self:addElement( self.DevilBG1 )

	self.DevilBG2 = LUI.UIImage.new()
	self.DevilBG2:setLeftRight( false, false, -120, 120 )
	self.DevilBG2:setTopBottom( false, false, -120 - 30, 120 - 30 )
	self.DevilBG2:setImage( RegisterImage( "zm_wc_triangle" ) )
	self:addElement( self.DevilBG2 )

	self.DevilBottom = LUI.UIImage.new()
	self.DevilBottom:setLeftRight( false, false, -97, 103 )
	self.DevilBottom:setTopBottom( false, false, -49 - 30, 151 - 30 )
	self.DevilBottom:setImage( RegisterImage( "zm_wc_devil_head_bottom" ) )
	self:addElement( self.DevilBottom )

	self.DevilTop = LUI.UIImage.new()
	self.DevilTop:setLeftRight( false, false, -100, 100 )
	self.DevilTop:setTopBottom( false, false, -135 - 30, 65 - 30 )
	self.DevilTop:setImage( RegisterImage( "zm_wc_devil_head_top" ) )
	self:addElement( self.DevilTop )
	
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
	self.TabFrame:setLeftRight( true, true, 191.5, 0 )
	self.TabFrame:setTopBottom( true, true, 283.5, 0 )
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
				self:setupElementClipCounter( 2 )

				local BackgroundAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 30000, false, false, CoD.TweenType.Linear )
					end

					element:setRGB( 0, 0, 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local BackgroundAnimationStage1 = function ( randomFloat1, randomFloat2, randomFloat3, element, event )
					if event.interrupted then
						BackgroundAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 30000, false, false, CoD.TweenType.Linear )

						element:setRGB( randomFloat1, randomFloat2, randomFloat3 )

						element:registerEventHandler( "transition_complete_keyframe", BackgroundAnimationStage2 )
					end
				end

				local randomFloat1 = math.random( 1, 100 ) / 100
				local randomFloat2 = math.random( 1, 100 ) / 100
				local randomFloat3 = math.random( 1, 100 ) / 100

				self.Background:completeAnimation()
				self.Background:setRGB( 0, 0, 0 )
				BackgroundAnimationStage1( randomFloat1, randomFloat2, randomFloat3, self.Background, {} )

				local CircleAnimationStage1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 60000, false, false, CoD.TweenType.Linear )
					end

					element:setZRot( 360 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.Circle:completeAnimation()
				self.Circle:setZRot( 0 )
				CircleAnimationStage1( self.Circle, {} )

				self.nextClip = "DefaultClip"
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
		element.Background:close()
		element.Circle:close()
		element.BottomDiagSlice:close()
		element.BottomDiagSliceOutline:close()
		element.TopDiagSlice:close()
		element.TopDiagSliceOutline:close()
		element.ZombiesLogoBlood:close()
		element.ZombiesLogo:close()
		element.PausedTextShadow:close()
		element.PausedText:close()
		element.DevilBG1:close()
		element.DevilBG2:close()
		element.DevilBottom:close()
		element.DevilTop:close()
		element.FETabBar:close()
		element.TabFrame:close()

		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Main.buttonPrompts" ) )
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end
