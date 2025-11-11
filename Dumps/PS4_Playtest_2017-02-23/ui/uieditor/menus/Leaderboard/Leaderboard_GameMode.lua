require( "ui.uieditor.menus.Leaderboard.Leaderboard_Filters" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_GameModeTabWidget" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_WarningText" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local PostLoadFunc = function ( self, controller )
	self:linkToElementModel( self.GameModeTabs.Internal.Tabs, nil, false, function ( model )
		if not model then
			return 
		else
			local leaderboardDefModel = Engine.GetModel( model, "lbDef" )
			local leaderboardDef = Engine.GetModelValue( leaderboardDefModel )
			SetGlobalModelValue( "leaderboardDef", leaderboardDef )
			self.GameModeTabs.Internal.IndicatorsGrid:updateDataSource()
			LoadLeaderboard( self, controller )
		end
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "FilterInfo" ), function ( model )
		local filterInfo = Engine.GetModelValue( model )
		self.CurrentFilterInfo:setText( filterInfo or "" )
		self.TabFrame:changeFrameWidget( "CoD." .. self.TabFrame.framedWidget.id )
	end )
end

LUI.createMenu.Leaderboard_GameMode = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Leaderboard_GameMode" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Leaderboard_GameMode.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( 0, 0, -16, 1928 )
	FEButtonPanelShaderContainer0:setTopBottom( 0, 0, 174, 1101 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( 0.5, 0.5, -861, 864 )
	TabFrame:setTopBottom( 0.5, 0.5, -338, 442 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -412, -354 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setAlpha( 0.5 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_barracks_leaderboard" ) )
	MenuFrame:subscribeToGlobalModel( controller, "LeaderboardMenuTitle", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuFrame.titleLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "LeaderboardMenuTitle", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	MenuFrame:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 0, 0, 1306, 1824 )
	SelfIdentityBadge:setTopBottom( 0, 0, 35, 125 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local GameModeTabs = CoD.Leaderboard_GameModeTabWidget.new( self, controller )
	GameModeTabs:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsLobbyLeaderboard( controller )
			end
		}
	} )
	GameModeTabs:setLeftRight( 0, 0, 128.5, 623.5 )
	GameModeTabs:setTopBottom( 0, 0, 128, 188 )
	GameModeTabs.Internal.IndicatorsGrid:setDataSource( "LeaderboardGameModeTabs" )
	GameModeTabs.Internal.Tabs:setDataSource( "LeaderboardGameModeTabs" )
	GameModeTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		LoadLeaderboard( self, controller )
		return retVal
	end )
	self:addElement( GameModeTabs )
	self.GameModeTabs = GameModeTabs
	
	local CurrentFilterInfo = LUI.UIText.new()
	CurrentFilterInfo:setLeftRight( 0, 0, 983, 1283 )
	CurrentFilterInfo:setTopBottom( 0, 0, 138, 174 )
	CurrentFilterInfo:setText( Engine.Localize( "MPUI_X_SLASH_Y" ) )
	CurrentFilterInfo:setTTF( "fonts/escom.ttf" )
	CurrentFilterInfo:setLetterSpacing( 0.5 )
	CurrentFilterInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CurrentFilterInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CurrentFilterInfo )
	self.CurrentFilterInfo = CurrentFilterInfo
	
	local LeaderboardWarningText = CoD.Leaderboard_WarningText.new( self, controller )
	LeaderboardWarningText:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsMPGameModeLeaderboard( controller )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LeaderboardWarningText:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ), function ( model )
		self:updateElementState( LeaderboardWarningText, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboardDef"
		} )
	end )
	LeaderboardWarningText:setLeftRight( 0, 1, 0, 0 )
	LeaderboardWarningText:setTopBottom( 1, 1, -129, -54 )
	LeaderboardWarningText.Text:setText( Engine.Localize( "" ) )
	LeaderboardWarningText:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( LeaderboardWarningText )
	self.LeaderboardWarningText = LeaderboardWarningText
	
	TabFrame:linkToElementModel( GameModeTabs.Internal.Tabs, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TabFrame:changeFrameWidget( modelValue )
		end
	end )
	TabFrame.navigation = {
		up = SelfIdentityBadge
	}
	SelfIdentityBadge.navigation = {
		down = TabFrame
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsLobbyLeaderboard( controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerText( "MENU_CUSTOM_LOBBY_LEADERBOARDS" )
			PlaySoundAlias( "uin_paint_decal_nav" )
		else
			ShowHeaderKickerAndIcon( self )
			CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
			PlaySoundAlias( "uin_paint_decal_nav" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		OpenPopup( self, "Leaderboard_Filters", controller, "", "" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LB_CHANGE_FILTER", nil )
		return true
	end, false )
	TabFrame.id = "TabFrame"
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEButtonPanelShaderContainer0:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.GameModeTabs:close()
		self.LeaderboardWarningText:close()
		self.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Leaderboard_GameMode.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

