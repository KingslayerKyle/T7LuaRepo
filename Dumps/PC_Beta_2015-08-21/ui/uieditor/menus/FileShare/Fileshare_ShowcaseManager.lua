require( "ui.uieditor.widgets.FileShare.FileshareSelectorList" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.FileShare.FileshareCategoryQuotas" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

LUI.createMenu.Fileshare_ShowcaseManager = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Fileshare_ShowcaseManager" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_ShowcaseManager.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TabBG = LUI.UIImage.new()
	TabBG:setLeftRight( true, false, 44.94, 1289 )
	TabBG:setTopBottom( true, false, 122.5, 653.5 )
	TabBG:setRGB( 0.08, 0.08, 0.08 )
	self:addElement( TabBG )
	self.TabBG = TabBG
	
	local FileshareSelectorList0 = CoD.FileshareSelectorList.new( self, controller )
	FileshareSelectorList0:setLeftRight( true, false, 68.34, 988.34 )
	FileshareSelectorList0:setTopBottom( true, false, 124, 652 )
	self:addElement( FileshareSelectorList0 )
	self.FileshareSelectorList0 = FileshareSelectorList0
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -5, 83 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
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
	
	local tabList = CoD.craftTabList.new( self, controller )
	tabList:setLeftRight( true, false, 39, 1129 )
	tabList:setTopBottom( true, false, 84, 120 )
	tabList:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	tabList.grid:setDataSource( "FileshareShowcaseManagerTabs" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f2_local0 = nil
		FileshareShowcaseManagerTabChanged( self, element, controller )
		return f2_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0, 0, 0 )
	HelpBacking0:setAlpha( 0 )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local FileshareCategoryQuotas0 = CoD.FileshareCategoryQuotas.new( self, controller )
	FileshareCategoryQuotas0:setLeftRight( true, false, 759, 1129 )
	FileshareCategoryQuotas0:setTopBottom( true, false, 156.5, 404.5 )
	self:addElement( FileshareCategoryQuotas0 )
	self.FileshareCategoryQuotas0 = FileshareCategoryQuotas0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSelectorList0:close()
		element.TitleDotsWidget0:close()
		element.tabList:close()
		element.ElemsSideList:close()
		element.FileshareCategoryQuotas0:close()
		element.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_ShowcaseManager.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

