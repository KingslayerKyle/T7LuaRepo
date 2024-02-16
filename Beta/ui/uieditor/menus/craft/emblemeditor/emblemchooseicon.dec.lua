require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemIconNew" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChooseIconName" )

local GetSelectedDecalCategory = function ( self, controller )
	local selectedIconID = CoD.perController[controller].selectedLayerIconID
	if selectedIconID ~= CoD.emblem.INVALID_ID then
		for key, tabData in ipairs( CoD.emblem.DECALTABS ) do
			if Engine.GetEmblemIconIndexInCategory( controller, tabData.category, selectedIconID ) ~= CoD.emblem.INVALID_ID then
				return REG7.category
			end
		end
		
	else
		return CoD.emblem.DECALTABS[1].category
	end
end

local FindTabIDForSelectedDecal = function ( controller )
	for key, tabData in ipairs( CoD.emblem.DECALTABS ) do
		if tabData.category == CoD.perController[controller].selectedDecalCategory then
			return REG4 + 1
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( self )
		local selectedIconID = CoD.perController[controller].selectedLayerIconID
		if selectedIconID ~= CoD.emblem.INVALID_ID then
			CoD.perController[controller].selectedDecalCategory = GetSelectedDecalCategory( self, controller )
			local decalCategoryWidget = self.tabList.grid:getItemAtPosition( 1, FindTabIDForSelectedDecal( controller ), false )
			if decalCategoryWidget then
				self.tabList.grid:setActiveItem( decalCategoryWidget )
				local totalIcons = Engine.EmblemFilterCount( controller, 0, CoD.perController[controller].selectedDecalCategory )
				local emblemIconListModel = Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemIconList" )
				local focusedWidget = self.emblemIconList:findItem( {
					iconID = selectedIconID
				}, nil, false )
				if focusedWidget then
					self.emblemIconList:processEvent( {
						name = "gain_focus",
						controller = controller,
						selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex
					} )
				end
			end
			return true
		else
			return false
		end
	end
	
end

LUI.createMenu.EmblemChooseIcon = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemChooseIcon" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemChooseIcon.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( menu, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0.49 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local TempBackdrop = LUI.UIImage.new()
	TempBackdrop:setLeftRight( true, false, 0, 1280 )
	TempBackdrop:setTopBottom( true, false, 0, 720 )
	TempBackdrop:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tempbackdrop" ) )
	self:addElement( TempBackdrop )
	self.TempBackdrop = TempBackdrop
	
	local emblemIconList = LUI.UIList.new( menu, controller, 4, 0, nil, true, false, 0, 0, false, false )
	emblemIconList:makeFocusable()
	emblemIconList:setLeftRight( true, false, 91, 587 )
	emblemIconList:setTopBottom( true, false, 153, 649 )
	emblemIconList:setDataSource( "EmblemIconList" )
	emblemIconList:setWidgetType( CoD.EmblemIconNew )
	emblemIconList:setHorizontalCount( 5 )
	emblemIconList:setVerticalCount( 5 )
	emblemIconList:setSpacing( 4 )
	emblemIconList:setVerticalScrollbar( CoD.verticalScrollbar )
	emblemIconList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemChooseIcon_SelectionChanged( self, element, controller )
		return retVal
	end )
	self:addElement( emblemIconList )
	self.emblemIconList = emblemIconList
	
	local emblemDraw = CoD.EmblemDrawWidgetNew.new( menu, controller )
	emblemDraw:setLeftRight( true, false, 696.67, 1154.67 )
	emblemDraw:setTopBottom( true, false, 153, 433.5 )
	emblemDraw:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeNotFocusable( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( emblemDraw )
	self.emblemDraw = emblemDraw
	
	local tabList = CoD.basicTabList.new( menu, controller )
	tabList:setLeftRight( true, false, 64, 776 )
	tabList:setTopBottom( true, false, 84.5, 115.5 )
	tabList.grid:setDataSource( "EmblemDecalTabs" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 7 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		EmblemChooseIcon_TabChanged( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 78, 86 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( menu, controller )
	ElemsSideList:setLeftRight( true, false, 6, 73.87 )
	ElemsSideList:setTopBottom( true, false, 44, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -73.33, 504.67 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -6, 140 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local MenuFrame = CoD.GenericMenuFrame.new( menu, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local PaintshopChooseIconName0 = CoD.PaintshopChooseIconName.new( menu, controller )
	PaintshopChooseIconName0:setLeftRight( true, false, 696.67, 934.67 )
	PaintshopChooseIconName0:setTopBottom( true, false, 446.5, 481.5 )
	self:addElement( PaintshopChooseIconName0 )
	self.PaintshopChooseIconName0 = PaintshopChooseIconName0
	
	emblemIconList.navigation = {
		right = emblemDraw
	}
	emblemDraw.navigation = {
		left = emblemIconList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( menu )
		elseif IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( menu )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		EmblemChooseIcon_SelectionRejected( self, element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EmblemChooseIcon_SelectionAccepted( self, element, controller )
		EmblemEditor_SetEditMode( controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "Menu_Select" )
		return true
	end, false )
	emblemIconList.id = "emblemIconList"
	emblemDraw.id = "emblemDraw"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.emblemIconList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleDotsWidget0:close()
		self.emblemIconList:close()
		self.emblemDraw:close()
		self.tabList:close()
		self.ElemsSideList:close()
		self.cac3dTitleIntermediary0:close()
		self.MenuFrame:close()
		self.PaintshopChooseIconName0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemChooseIcon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

