-- d88bf4a3d0c615f3d78c0cd5b4406ed0
-- This hash is used for caching, delete to decompile the file again

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
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f4_local1, controller )
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
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( f4_local1, controller )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TabFrame = LUI.UIFrame.new( f4_local1, controller, 0, 0, false )
	TabFrame:setLeftRight( false, false, -574, 576 )
	TabFrame:setTopBottom( false, false, -221, 299 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MENU_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MENU_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f4_local1, controller )
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
	
	local FETabBar = CoD.FE_TabBar.new( f4_local1, controller )
	FETabBar:setLeftRight( true, true, 0, 1217 )
	FETabBar:setTopBottom( true, false, 85, 126 )
	FETabBar.Tabs.grid:setHorizontalCount( 8 )
	FETabBar.Tabs.grid:setDataSource( "StartMenuTabs" )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( f4_local1, controller )
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
		f4_local1:updateElementState( self, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f19_local0 = nil
		PlaySoundSetSound( self, "menu_enter" )
		FileshareGetSlots( self, element, controller )
		SetHeadingKickerTextToGameMode( "" )
		PrepareOpenMenuInSafehouse( controller )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		RefreshLobbyRoom( f20_arg1, f20_arg2 )
		StartMenuGoBack( f20_arg1, f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		RefreshLobbyRoom( f22_arg1, f22_arg2 )
		StartMenuGoBack( f22_arg1, f22_arg2 )
		return true
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		PlaySoundSetSound( self, "list_action" )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if IsInGame() and not IsLobbyNetworkModeLAN() and not IsDemoPlaying() then
			OpenPopup( self, "Social_Main", f26_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if IsInGame() and not IsLobbyNetworkModeLAN() and not IsDemoPlaying() then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_SOCIAL" )
			return true
		else
			return false
		end
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "ESCAPE", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		RefreshLobbyRoom( f28_arg1, f28_arg2 )
		StartMenuGoBack( f28_arg1, f28_arg2 )
		return true
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
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
		menu = f4_local1
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

