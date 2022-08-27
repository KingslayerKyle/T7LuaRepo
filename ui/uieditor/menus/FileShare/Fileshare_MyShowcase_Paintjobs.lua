-- 30b96550d75ab7439f62d0241d06d782
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.FileShare.FileshareSelector" )

LUI.createMenu.Fileshare_MyShowcase_Paintjobs = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Fileshare_MyShowcase_Paintjobs" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_MyShowcase_Paintjobs.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local HelpBacking00 = LUI.UIImage.new()
	HelpBacking00:setLeftRight( true, true, 0, 0 )
	HelpBacking00:setTopBottom( false, false, 292, 294 )
	HelpBacking00:setRGB( 0.01, 0.02, 0.02 )
	HelpBacking00:setAlpha( 0.7 )
	self:addElement( HelpBacking00 )
	self.HelpBacking00 = HelpBacking00
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -5, 83 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( f1_local1, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f1_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 447 )
	LeftPanel:setTopBottom( true, false, 91, 680 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local tabList = CoD.craftTabList.new( f1_local1, controller )
	tabList:setLeftRight( true, false, 39, 1129 )
	tabList:setTopBottom( true, false, 84, 120 )
	tabList:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	tabList.grid:setDataSource( "FilesharePublishedPaintjobTabs" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f2_local0 = nil
		FilesharePublishedTabChanged( self, element, controller )
		return f2_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( f1_local1, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.25, 506.75 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -5.5, 140.5 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_PAINTJOBS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
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
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( f1_local1, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local MyShowcaseBG = LUI.UIImage.new()
	MyShowcaseBG:setLeftRight( true, false, 64, 181 )
	MyShowcaseBG:setTopBottom( true, false, 11, 32.5 )
	MyShowcaseBG:setAlpha( 0 )
	self:addElement( MyShowcaseBG )
	self.MyShowcaseBG = MyShowcaseBG
	
	local MyShowcase = LUI.UITightText.new()
	MyShowcase:setLeftRight( true, false, 68, 160 )
	MyShowcase:setTopBottom( true, false, 9.5, 34.5 )
	MyShowcase:setRGB( 0, 0, 0 )
	MyShowcase:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	MyShowcase:setTTF( "fonts/default.ttf" )
	self:addElement( MyShowcase )
	self.MyShowcase = MyShowcase
	
	local FileshareSelector0 = CoD.FileshareSelector.new( f1_local1, controller )
	FileshareSelector0:setLeftRight( true, false, 64, 984 )
	FileshareSelector0:setTopBottom( true, false, 140.5, 668.5 )
	self:addElement( FileshareSelector0 )
	self.FileshareSelector0 = FileshareSelector0
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		ShowHeaderKickerAndIcon( f1_local1 )
		SetHeadingKickerText( "MENU_SHOWCASE" )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	FileshareSelector0.id = "FileshareSelector0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.FileshareSelector0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleDotsWidget0:close()
		element.LeftPanel:close()
		element.tabList:close()
		element.cac3dTitleIntermediary0:close()
		element.ElemsSideList:close()
		element.FileshareSelector0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_MyShowcase_Paintjobs.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

