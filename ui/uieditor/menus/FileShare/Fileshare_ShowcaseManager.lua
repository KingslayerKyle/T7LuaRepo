-- a10353726d0b152cdcf9f1061d4d93f1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FileshareSelectorList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.FileShare.FileshareCategoryQuotas" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_ShowcaseManager.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local TabBG = LUI.UIImage.new()
	TabBG:setLeftRight( true, true, 3, 0 )
	TabBG:setTopBottom( true, false, 122.5, 684 )
	TabBG:setRGB( 0, 0, 0 )
	TabBG:setAlpha( 0 )
	self:addElement( TabBG )
	self.TabBG = TabBG
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 82.21, 384.21 )
	BG:setTopBottom( true, false, 119, 680.5 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.6 )
	BG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BG:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BG )
	self.BG = BG
	
	local FileshareSelectorList0 = CoD.FileshareSelectorList.new( f2_local1, controller )
	FileshareSelectorList0:setLeftRight( true, false, 62.34, 982.34 )
	FileshareSelectorList0:setTopBottom( true, false, 139, 679 )
	self:addElement( FileshareSelectorList0 )
	self.FileshareSelectorList0 = FileshareSelectorList0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 89.88, 707.13 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -5, 83 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( f2_local1, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local tabList = CoD.FE_TabBar.new( f2_local1, controller )
	tabList:setLeftRight( true, false, 0, 2496 )
	tabList:setTopBottom( true, false, 84, 125 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "FileshareShowcaseManagerTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f3_local0 = nil
		FileshareShowcaseManagerTabChanged( self, element, controller )
		return f3_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0, 0, 0 )
	HelpBacking0:setAlpha( 0 )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local FileshareCategoryQuotas0 = CoD.FileshareCategoryQuotas.new( f2_local1, controller )
	FileshareCategoryQuotas0:setLeftRight( true, false, 805.34, 1175.34 )
	FileshareCategoryQuotas0:setTopBottom( true, false, 166, 414 )
	self:addElement( FileshareCategoryQuotas0 )
	self.FileshareCategoryQuotas0 = FileshareCategoryQuotas0
	
	local QuotaListHeader = LUI.UIImage.new()
	QuotaListHeader:setLeftRight( true, false, 805.34, 1175.34 )
	QuotaListHeader:setTopBottom( true, false, 147, 166 )
	QuotaListHeader:setRGB( 0, 0, 0 )
	QuotaListHeader:setAlpha( 0.8 )
	self:addElement( QuotaListHeader )
	self.QuotaListHeader = QuotaListHeader
	
	local QuotaListHeaderLabel = LUI.UITightText.new()
	QuotaListHeaderLabel:setLeftRight( true, false, 812.82, 1180.34 )
	QuotaListHeaderLabel:setTopBottom( true, false, 148, 165 )
	QuotaListHeaderLabel:setText( Engine.Localize( "MENU_FILESHARE_QUOTA_HEADER_CAPS" ) )
	QuotaListHeaderLabel:setTTF( "fonts/escom.ttf" )
	QuotaListHeaderLabel:setLetterSpacing( 1 )
	self:addElement( QuotaListHeaderLabel )
	self.QuotaListHeaderLabel = QuotaListHeaderLabel
	
	local MenuFrame = CoD.GenericMenuFrame.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
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
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f2_local1, true )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		FileshareCloseShowcaseManager( self, f5_arg0, f5_arg2 )
		GoBack( self, f5_arg2 )
		ClearSavedState( self, f5_arg2 )
		SendClientScriptMenuChangeNotify( f5_arg2, f5_arg1, false )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.FileshareSelectorList0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSelectorList0:close()
		element.FEMenuLeftGraphics:close()
		element.TitleDotsWidget0:close()
		element.tabList:close()
		element.FileshareCategoryQuotas0:close()
		element.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_ShowcaseManager.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

