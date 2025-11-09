require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "menu_opened", function ()
		return true
	end )
	f1_arg0.disableLeaderChangePopupShutdown = true
	if CoD.isCampaign then
		f1_arg0:setModel( Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "StartMenu_Main" ) )
	end
	if CoD.isZombie then
		f1_arg0.disableDarkenElement = true
	end
	f1_arg0:registerEventHandler( "open_migration_menu", function ( element, event )
		CloseAllOccludingMenus( element, f1_arg1 )
		StartMenuResumeGame( element, event.controller )
		GoBack( element, event.controller )
	end )
	if CoD.isSafehouse and CoD.isOnlineGame() then
		SetGlobalModelValue( "combatRecordMode", "cp" )
	end
	SetControllerModelValue( f1_arg1, "forceScoreboard", 0 )
end

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
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( self, controller )
	StartMenuCampaignBG:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBG:setTopBottom( true, true, 0, 0 )
	StartMenuCampaignBG:setAlpha( 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( true, true, 0, 0 )
	MenuTitleBackground:setTopBottom( false, false, -336, -276 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
	TitleText:setAlpha( 0 )
	TitleText:setText( Engine.Localize( "Menu" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( true, true, -3.63, 0 )
	ButtonBarBackground:setTopBottom( false, false, 302, 332 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setAlpha( 0 )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( false, false, -574, 576 )
	TabFrame:setTopBottom( false, false, -221, 299 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MENU_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MENU_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( true, true, 0, 0 )
	CategoryListPanel:setTopBottom( false, false, -274, -235 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local FETabBar = CoD.FE_TabBar.new( self, controller )
	FETabBar:setLeftRight( true, true, 0, 1217 )
	FETabBar:setTopBottom( true, false, 85, 126 )
	FETabBar.Tabs.grid:setHorizontalCount( 8 )
	FETabBar.Tabs.grid:setDataSource( "StartMenuTabs" )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( self, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -653.81, -449.81 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 37, 67 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	TabFrame:linkToElementModel( FETabBar.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 1 )
				self.clipFinished( StartMenuBackground0, {} )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 0.9 )
				self.clipFinished( BlackBG, {} )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 0 )
				self.clipFinished( StartMenuCampaignBG, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
			end
		},
		IsFrontEnd = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 1 )
				self.clipFinished( StartMenuBackground0, {} )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 0.9 )
				self.clipFinished( BlackBG, {} )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 0 )
				self.clipFinished( StartMenuCampaignBG, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 1 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
			end
		},
		Zombies = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.9 )
				self.clipFinished( StartMenuBackground0, {} )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 0.6 )
				self.clipFinished( BlackBG, {} )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 0 )
				self.clipFinished( StartMenuCampaignBG, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 0 )
				self.clipFinished( BlackBG, {} )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 1 )
				self.clipFinished( StartMenuCampaignBG, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
			end
		},
		Ingame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f19_local0 = nil
		PlaySoundSetSound( self, "menu_enter" )
		FileshareGetSlots( self, self, controller )
		SetHeadingKickerTextToGameMode( "" )
		PrepareOpenMenuInSafehouse( controller )
		if not f19_local0 then
			f19_local0 = self:dispatchEventToChildren( event )
		end
		return f19_local0
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
	TabFrame.id = "TabFrame"
	MenuFrame:setModel( self.buttonModel, controller )
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
		element.StartMenuBackground0:close()
		element.StartMenuCampaignBG:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.FETabBar:close()
		element.StartMenuCurrencyCounts:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

