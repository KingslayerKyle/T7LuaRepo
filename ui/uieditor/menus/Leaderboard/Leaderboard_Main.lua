-- 7391ff4cf671fcd56d634fc549cf80e7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.menus.Leaderboard.Leaderboard_GameMode" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:linkToElementModel( f1_arg0.tabList.Tabs.grid, nil, false, function ( model )
		SetGlobalModelValue( "leaderboardCategoryName", Engine.GetModelValue( Engine.GetModel( model, "tabCategory" ) ) )
		if f1_arg0.ButtonList ~= nil then
			UpdateDataSource( f1_arg0, f1_arg0.ButtonList, f1_arg1 )
		end
	end )
end

LUI.createMenu.Leaderboard_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Leaderboard_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Leaderboard_Main.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f3_local1, controller )
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
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, -11, 1285 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 115.91, 733.91 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -275, -236 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local ButtonList = LUI.UIList.new( f3_local1, controller, 6, 0, nil, true, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 71, 1195 )
	ButtonList:setTopBottom( true, false, 149.5, 596.5 )
	ButtonList:setWidgetType( CoD.Leaderboard_GameModeButton )
	ButtonList:setHorizontalCount( 5 )
	ButtonList:setVerticalCount( 3 )
	ButtonList:setSpacing( 6 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "LeaderboardGameModeButton" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	f3_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		Leaderboard_SetLeaderboardDef( self, f7_arg0, f7_arg2 )
		OpenOverlay( self, "Leaderboard_GameMode", f7_arg2, "", "" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_LEADERBOARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_LEADERBOARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	MenuFrame:registerEventHandler( "menu_opened", function ( element, event )
		local f9_local0 = nil
		ShowHeaderIconOnly( f3_local1 )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f3_local1, controller )
	SelfIdentityBadge:setLeftRight( true, false, 871, 1216 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local tabList = CoD.FE_TabBar.new( f3_local1, controller )
	tabList:setLeftRight( true, false, 0, 2560 )
	tabList:setTopBottom( true, false, 83, 124 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "LeaderboardTabType" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f12_local0 = nil
		Leaderboard_TabChanged( self, element, controller )
		return f12_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 92, 709.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		GoBack( self, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	ButtonList.id = "ButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEButtonPanelShaderContainer0:close()
		element.ButtonList:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.tabList:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Leaderboard_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

