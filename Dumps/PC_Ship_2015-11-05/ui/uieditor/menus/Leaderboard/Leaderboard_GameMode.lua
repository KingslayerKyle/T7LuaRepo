require( "ui.uieditor.menus.Leaderboard.Leaderboard_Filters" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeTabWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:linkToElementModel( f1_arg0.GameModeTabs.Internal.Tabs, nil, false, function ( model )
		if not model then
			return 
		else
			SetGlobalModelValue( "leaderboardDef", Engine.GetModelValue( Engine.GetModel( model, "lbDef" ) ) )
			f1_arg0.GameModeTabs.Internal.IndicatorsGrid:updateDataSource()
			LoadLeaderboard( f1_arg0, f1_arg1 )
		end
	end )
	f1_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "FilterInfo" ), function ( model )
		f1_arg0.CurrentFilterInfo:setText( Engine.GetModelValue( model ) )
		f1_arg0.TabFrame:changeFrameWidget( "CoD." .. f1_arg0.TabFrame.framedWidget.id )
	end )
end

LUI.createMenu.Leaderboard_GameMode = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Leaderboard_GameMode" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Leaderboard_GameMode.buttonPrompts" )
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
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, -11, 1285 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 115.91, 733.91 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( false, false, -574, 576 )
	TabFrame:setTopBottom( false, false, -225, 295 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -275, -236 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setAlpha( 0.5 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_barracks_leaderboard" ) )
	MenuFrame:subscribeToGlobalModel( controller, "LeaderboardMenuTitle", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			MenuFrame.titleLabel:setText( Engine.Localize( title ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "LeaderboardMenuTitle", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( title ) )
		end
	end )
	MenuFrame:registerEventHandler( "menu_opened", function ( element, event )
		local f8_local0 = nil
		ShowHeaderIconOnly( self )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( true, false, 871, 1216 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local GameModeTabs = CoD.Leaderboard_GameModeTabWidget.new( self, controller )
	GameModeTabs:setLeftRight( true, false, 86, 375 )
	GameModeTabs:setTopBottom( true, false, 85, 125 )
	GameModeTabs.Internal.IndicatorsGrid:setDataSource( "LeaderboardGameModeTabs" )
	GameModeTabs.Internal.Tabs:setDataSource( "LeaderboardGameModeTabs" )
	self:addElement( GameModeTabs )
	self.GameModeTabs = GameModeTabs
	
	local CurrentFilterInfo = LUI.UIText.new()
	CurrentFilterInfo:setLeftRight( true, false, 655.5, 855.5 )
	CurrentFilterInfo:setTopBottom( true, false, 91.91, 115.91 )
	CurrentFilterInfo:setText( Engine.Localize( "MPUI_X_SLASH_Y" ) )
	CurrentFilterInfo:setTTF( "fonts/escom.ttf" )
	CurrentFilterInfo:setLetterSpacing( 0.5 )
	CurrentFilterInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CurrentFilterInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CurrentFilterInfo )
	self.CurrentFilterInfo = CurrentFilterInfo
	
	TabFrame:linkToElementModel( GameModeTabs.Internal.Tabs, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f10_local0 = nil
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		if not f10_local0 then
			f10_local0 = self:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( element, menu, controller, model )
		OpenPopup( self, "Leaderboard_Filters", controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LB_CHANGE_FILTER" )
		return true
	end, false )
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
		element.FEButtonPanelShaderContainer0:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.GameModeTabs:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Leaderboard_GameMode.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

