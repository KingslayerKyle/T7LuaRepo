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

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.perController[f1_arg1].selectedLayerIconID
	if f1_local0 ~= CoD.emblem.INVALID_ID then
		for f1_local4, f1_local5 in ipairs( CoD.emblem.DECALTABS ) do
			if Engine.GetEmblemIconIndexInCategory( f1_arg1, f1_local5.category, f1_local0 ) ~= CoD.emblem.INVALID_ID then
				return f1_local5.category
			end
		end
		
	else
		return CoD.emblem.DECALTABS[1].category
	end
end

local f0_local1 = function ( f2_arg0 )
	for f2_local3, f2_local4 in ipairs( CoD.emblem.DECALTABS ) do
		if f2_local4.category == CoD.perController[f2_arg0].selectedDecalCategory then
			return f2_local3 + 1
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( f4_arg0 )
		local f4_local0 = CoD.perController[controller].selectedLayerIconID
		if f4_local0 ~= CoD.emblem.INVALID_ID then
			CoD.perController[controller].selectedDecalCategory = f0_local0( f4_arg0, controller )
			local f4_local1 = f4_arg0.tabList.grid:getItemAtPosition( 1, f0_local1( controller ), false )
			if f4_local1 then
				f4_arg0.tabList.grid:setActiveItem( f4_local1 )
				local f4_local2 = Engine.EmblemFilterCount( controller, 0, CoD.perController[controller].selectedDecalCategory )
				local f4_local3 = Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemIconList" )
				local f4_local4 = f4_arg0.emblemIconList:findItem( {
					iconID = f4_local0
				}, nil, false )
				if f4_local4 then
					f4_arg0.emblemIconList:processEvent( {
						name = "gain_focus",
						controller = controller,
						selectIndex = f4_local4.gridInfoTable.zeroBasedIndex
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
	self.anyChildUsesUpdateState = true
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
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
	
	local emblemIconList = LUI.UIList.new( self, controller, 4, 0, nil, true, false, 0, 0, false, false )
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
		local f6_local0 = nil
		EmblemChooseIcon_SelectionChanged( self, element, controller )
		return f6_local0
	end )
	self:addElement( emblemIconList )
	self.emblemIconList = emblemIconList
	
	local emblemDraw = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDraw:setLeftRight( true, false, 696.67, 1154.67 )
	emblemDraw:setTopBottom( true, false, 153, 433.5 )
	emblemDraw:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		MakeNotFocusable( element )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( emblemDraw )
	self.emblemDraw = emblemDraw
	
	local tabList = CoD.basicTabList.new( self, controller )
	tabList:setLeftRight( true, false, 64, 776 )
	tabList:setTopBottom( true, false, 84.5, 115.5 )
	tabList.grid:setDataSource( "EmblemDecalTabs" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 7 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f8_local0 = nil
		EmblemChooseIcon_TabChanged( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return f8_local0
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
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 6, 73.87 )
	ElemsSideList:setTopBottom( true, false, 44, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -73.33, 504.67 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -6, 140 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local PaintshopChooseIconName0 = CoD.PaintshopChooseIconName.new( self, controller )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f9_local0 = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( self )
		elseif IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not f9_local0 then
			f9_local0 = self:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		EmblemChooseIcon_SelectionRejected( self, element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
		menu = self
	} )
	if not self:restoreState() then
		self.emblemIconList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleDotsWidget0:close()
		element.emblemIconList:close()
		element.emblemDraw:close()
		element.tabList:close()
		element.ElemsSideList:close()
		element.cac3dTitleIntermediary0:close()
		element.MenuFrame:close()
		element.PaintshopChooseIconName0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemChooseIcon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

