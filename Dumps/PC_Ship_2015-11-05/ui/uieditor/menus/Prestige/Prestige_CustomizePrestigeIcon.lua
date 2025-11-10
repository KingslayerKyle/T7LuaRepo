require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Prestige.Prestige_PrestigeIconButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Prestige.Prestige_PrestigeIconProfiler" )

local f0_local0 = function ( f1_arg0 )
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		if f1_arg0 == 11 then
			return Engine.Localize( "MENU_ZM_PRESTIGE_ICON_DESC_MASTER" )
		else
			return Engine.Localize( "MENU_ZM_PRESTIGE_ICON_DESC_" .. tostring( f1_arg0 ) )
		end
	else
		return "Black Ops 3 Prestige " .. tostring( f1_arg0 ) .. " icon. Awarded for completing Prestige Level " .. tostring( f1_arg0 ) .. " in Black Ops 3."
	end
end

DataSources.PrestigeIconButtonList = DataSourceHelpers.ListSetup( "PrestigeIconButtonList", function ( f2_arg0 )
	local f2_local0 = {}
	for f2_local1 = 1, 11, 1 do
		local f2_local4 = "t7_icon_rank_" .. CoD.PrestigeUtility.GetPrestigeGameModeString() .. "_prestige_0" .. tostring( f2_local1 )
		if f2_local1 >= 10 then
			f2_local4 = "t7_icon_rank_" .. CoD.PrestigeUtility.GetPrestigeGameModeString() .. "_prestige_" .. tostring( f2_local1 )
		end
		table.insert( f2_local0, {
			models = {
				buttonTitle = Engine.Localize( "MPUI_PRESTIGE_N", f2_local1 ),
				icon = f2_local4,
				iconTitle = Engine.Localize( "MPUI_PRESTIGE_N", f2_local1 ),
				gameTitle = Engine.Localize( "MENU_PRESTIGE_ICONS_GAME_BO3" ),
				description = f0_local0( f2_local1 ),
				isLocked = false
			}
		} )
	end
	return f2_local0
end )
LUI.createMenu.Prestige_CustomizePrestigeIcon = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Prestige_CustomizePrestigeIcon" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Prestige_CustomizePrestigeIcon.buttonPrompts" )
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
	BlackBG:setAlpha( 0.65 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, -11, 1285 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 115.91, 733.91 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
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
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -275, -236 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( true, false, 0, 2560 )
	tabList:setTopBottom( true, false, 83, 124 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	self:addElement( tabList )
	self.tabList = tabList
	
	local PrestigeIconList = LUI.UIList.new( self, controller, 5, 0, nil, true, false, 0, 0, false, true )
	PrestigeIconList:makeFocusable()
	PrestigeIconList:setLeftRight( true, false, 104, 438 )
	PrestigeIconList:setTopBottom( true, false, 145.13, 592.13 )
	PrestigeIconList:setDataSource( "PrestigeIconButtonList" )
	PrestigeIconList:setWidgetType( CoD.Prestige_PrestigeIconButton )
	PrestigeIconList:setHorizontalCount( 3 )
	PrestigeIconList:setVerticalCount( 4 )
	PrestigeIconList:setSpacing( 5 )
	PrestigeIconList:setVerticalCounter( CoD.verticalCounter )
	self:addElement( PrestigeIconList )
	self.PrestigeIconList = PrestigeIconList
	
	local PrestigeIconProfiler = CoD.Prestige_PrestigeIconProfiler.new( self, controller )
	PrestigeIconProfiler:setLeftRight( true, false, 735.5, 1035.5 )
	PrestigeIconProfiler:setTopBottom( true, false, 145.13, 445.13 )
	PrestigeIconProfiler:subscribeToGlobalModel( controller, "PerController", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			PrestigeIconProfiler.RankText:setText( Engine.Localize( GetMPLevelStringPerController( controller, xuid ) ) )
		end
	end )
	PrestigeIconProfiler:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		}
	} )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconProfiler, "isLocked", true, function ( model )
		self:updateElementState( PrestigeIconProfiler, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	self:addElement( PrestigeIconProfiler )
	self.PrestigeIconProfiler = PrestigeIconProfiler
	
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, nil, false, function ( model )
		PrestigeIconProfiler:setModel( model, controller )
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "iconTitle", true, function ( model )
		local iconTitle = Engine.GetModelValue( model )
		if iconTitle then
			PrestigeIconProfiler.IconTitle:setText( Engine.Localize( iconTitle ) )
		end
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "gameTitle", true, function ( model )
		local gameTitle = Engine.GetModelValue( model )
		if gameTitle then
			PrestigeIconProfiler.GameTitle:setText( Engine.Localize( gameTitle ) )
		end
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			PrestigeIconProfiler.Description:setText( Engine.Localize( description ) )
		end
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			PrestigeIconProfiler.PrestigeIcon:setImage( RegisterImage( GetRankIconLarge( icon ) ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f13_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not f13_local0 then
			f13_local0 = self:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		ClosePermanentUnlockMenu( self, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	PrestigeIconList.id = "PrestigeIconList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.PrestigeIconList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEButtonPanelShaderContainer0:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.FEMenuLeftGraphics:close()
		element.tabList:close()
		element.PrestigeIconList:close()
		element.PrestigeIconProfiler:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Prestige_CustomizePrestigeIcon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

