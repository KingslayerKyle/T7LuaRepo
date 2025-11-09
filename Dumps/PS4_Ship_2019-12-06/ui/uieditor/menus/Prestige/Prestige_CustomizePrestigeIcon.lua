require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Prestige.Prestige_PrestigeIconButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Prestige.Prestige_PrestigeIconProfiler" )

DataSources.PrestigeIconButtonList = DataSourceHelpers.ListSetup( "PrestigeIconButtonList", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = CoD.PrestigeUtility.GetPrestigeGameMode()
	local f1_local2 = Engine.GetParagonIconTable( f1_local1 )
	local f1_local3 = Engine.GetPlayerStats( f1_arg0, CoD.STATS_LOCATION_NORMAL, f1_local1 )
	local f1_local4 = f1_local3.PlayerStatsList.PARAGON_RANK.StatValue:get()
	local f1_local5 = f1_local3.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
	if f1_local5 == CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
		f1_local5 = CoD.PrestigeUtility.DEFAULT_PARAGON_ICON_ID
	end
	for f1_local10, f1_local11 in pairs( f1_local2 ) do
		local f1_local9 = Engine.Localize( f1_local11.description )
		local f1_local12 = f1_local4 < f1_local11.unlockParagonLvl
		if f1_local12 then
			f1_local9 = Engine.Localize( "PERKS_UNLOCKED_AT_LV", Engine.GetParagonRankDisplayLevel( f1_local11.unlockParagonLvl, f1_local1 ) )
		end
		table.insert( f1_local0, {
			models = {
				iconId = f1_local11.id,
				buttonTitle = Engine.Localize( f1_local11.iconTitle ),
				icon = f1_local11.imageName,
				iconTitle = Engine.Localize( f1_local11.iconTitle, f1_local11.plevel ),
				gameTitle = Engine.Localize( f1_local11.gameTitle ),
				description = f1_local9,
				isLocked = f1_local12
			},
			properties = {
				selectIndex = f1_local11.id == f1_local5
			}
		} )
	end
	return f1_local0
end, true )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

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
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local PrestigeIconList = LUI.UIList.new( self, controller, 5, 0, nil, true, false, 0, 0, false, true )
	PrestigeIconList:makeFocusable()
	PrestigeIconList:setLeftRight( true, false, 104, 438 )
	PrestigeIconList:setTopBottom( true, false, 145.13, 592.13 )
	PrestigeIconList:setWidgetType( CoD.Prestige_PrestigeIconButton )
	PrestigeIconList:setHorizontalCount( 3 )
	PrestigeIconList:setVerticalCount( 4 )
	PrestigeIconList:setSpacing( 5 )
	PrestigeIconList:setVerticalCounter( CoD.verticalCounter )
	PrestigeIconList:setDataSource( "PrestigeIconButtonList" )
	PrestigeIconList:linkToElementModel( PrestigeIconList, "isLocked", true, function ( model )
		local f7_local0 = PrestigeIconList
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	PrestigeIconList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	PrestigeIconList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( PrestigeIconList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isLocked" ) then
			SetParagonIcon( self, element, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isLocked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PrestigeIconList )
	self.PrestigeIconList = PrestigeIconList
	
	local PrestigeIconProfiler = CoD.Prestige_PrestigeIconProfiler.new( self, controller )
	PrestigeIconProfiler:setLeftRight( true, false, 735.5, 1035.5 )
	PrestigeIconProfiler:setTopBottom( true, false, 145.13, 445.13 )
	PrestigeIconProfiler:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			PrestigeIconProfiler.RankText:setRGB( SetToParagonColorIfPrestigeMasterFromStorage( controller, "mp", 148, 162, 165, statsMp ) )
		end
	end )
	PrestigeIconProfiler:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			PrestigeIconProfiler.RankText:setText( LevelStringFromStorage( controller, "mp", statsMp ) )
		end
	end )
	PrestigeIconProfiler:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			PrestigeIconProfiler.PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromStorage( controller, "mp", statsMp ) )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
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
		element.PrestigeIconList:close()
		element.PrestigeIconProfiler:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Prestige_CustomizePrestigeIcon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

