require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareCategoryQuotas" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local PreLoadFunc = function ( self, controller )
	CoD.FileshareUtility.SetInShowcaseManager( controller, true )
	CoD.FileshareUtility.SetShowCreateButton( FileshareCanBuyMoreSlots( controller ) )
end

LUI.createMenu.Fileshare_ShowcaseManager = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Fileshare_ShowcaseManager" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_ShowcaseManager.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TabBG = LUI.UIImage.new()
	TabBG:setLeftRight( 0, 1, 4, 0 )
	TabBG:setTopBottom( 0, 0, 184, 1026 )
	TabBG:setRGB( 0, 0, 0 )
	TabBG:setAlpha( 0 )
	self:addElement( TabBG )
	self.TabBG = TabBG
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 123, 576 )
	BG:setTopBottom( 0, 0, 179, 1021 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.6 )
	BG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BG:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BG )
	self.BG = BG
	
	local FileshareSelectorList0 = CoD.FileshareSelectorList.new( self, controller )
	FileshareSelectorList0:setLeftRight( 0, 0, 94, 1474 )
	FileshareSelectorList0:setTopBottom( 0, 0, 209, 1019 )
	self:addElement( FileshareSelectorList0 )
	self.FileshareSelectorList0 = FileshareSelectorList0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 135, 1061 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( 0, 1, 0, 0 )
	TitleBacking0:setTopBottom( 0, 0, -8, 124 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( 0, 0, 5, 793 )
	TitleDotsWidget0:setTopBottom( 0, 0, -97.5, 139.5 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -414, -356 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( 0, 0, 0, 3744 )
	tabList:setTopBottom( 0, 0, 126, 188 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "FileshareShowcaseManagerTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		FileshareShowcaseManagerTabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( 0, 1, 0, 0 )
	HelpBacking0:setTopBottom( 1, 1, -102, 0 )
	HelpBacking0:setRGB( 0, 0, 0 )
	HelpBacking0:setAlpha( 0 )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local FileshareCategoryQuotas0 = CoD.FileshareCategoryQuotas.new( self, controller )
	FileshareCategoryQuotas0:setLeftRight( 0, 0, 1208.5, 1763.5 )
	FileshareCategoryQuotas0:setTopBottom( 0, 0, 249, 621 )
	self:addElement( FileshareCategoryQuotas0 )
	self.FileshareCategoryQuotas0 = FileshareCategoryQuotas0
	
	local QuotaListHeader = LUI.UIImage.new()
	QuotaListHeader:setLeftRight( 0, 0, 1208, 1763 )
	QuotaListHeader:setTopBottom( 0, 0, 221, 249 )
	QuotaListHeader:setRGB( 0, 0, 0 )
	QuotaListHeader:setAlpha( 0.8 )
	self:addElement( QuotaListHeader )
	self.QuotaListHeader = QuotaListHeader
	
	local QuotaListHeaderLabel = LUI.UITightText.new()
	QuotaListHeaderLabel:setLeftRight( 0, 0, 1219, 1770 )
	QuotaListHeaderLabel:setTopBottom( 0, 0, 222.5, 247.5 )
	QuotaListHeaderLabel:setText( Engine.Localize( "MENU_FILESHARE_QUOTA_HEADER_CAPS" ) )
	QuotaListHeaderLabel:setTTF( "fonts/escom.ttf" )
	QuotaListHeaderLabel:setLetterSpacing( 1 )
	self:addElement( QuotaListHeaderLabel )
	self.QuotaListHeaderLabel = QuotaListHeaderLabel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FILESHARE_SHOWCASE_MANAGER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FILESHARE_SHOWCASE_MANAGER_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	FileshareSelectorList0.navigation = {
		up = FileshareCategoryQuotas0,
		right = FileshareCategoryQuotas0
	}
	FileshareCategoryQuotas0.navigation = {
		left = FileshareSelectorList0,
		down = FileshareSelectorList0
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		FileshareCloseShowcaseManager( self, element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	FileshareSelectorList0.id = "FileshareSelectorList0"
	FileshareCategoryQuotas0.id = "FileshareCategoryQuotas0"
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
		self.FileshareSelectorList0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareSelectorList0:close()
		self.FEMenuLeftGraphics:close()
		self.TitleDotsWidget0:close()
		self.tabList:close()
		self.FileshareCategoryQuotas0:close()
		self.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_ShowcaseManager.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

