require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemIconNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local GetSelectedDecalCategory = function ( self, controller )
	local selectedIconID = CoD.perController[controller].selectedLayerIconID
	if selectedIconID ~= CoD.CraftUtility.EMBLEM_INVALID_ID then
		for key, tabData in ipairs( CoD.CraftUtility.EMBLEM_DECALTABS ) do
			if Engine.GetEmblemIconIndexInCategory( controller, tabData.category, selectedIconID ) ~= CoD.CraftUtility.EMBLEM_INVALID_ID then
				return tabData.category
			end
		end
		
	else
		return CoD.CraftUtility.EMBLEM_DECALTABS[1].category
	end
end

local FindTabIDForSelectedDecal = function ( controller )
	for key, tabData in ipairs( CoD.CraftUtility.EMBLEM_DECALTABS ) do
		if tabData.category == CoD.perController[controller].selectedDecalCategory then
			return key + 1
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( self )
		local selectedIconID = CoD.perController[controller].selectedLayerIconID
		if selectedIconID ~= CoD.CraftUtility.EMBLEM_INVALID_ID then
			CoD.perController[controller].selectedDecalCategory = GetSelectedDecalCategory( self, controller )
			local decalCategoryWidget = self.tabList.Tabs.grid:getItemAtPosition( 1, FindTabIDForSelectedDecal( controller ), false )
			if decalCategoryWidget then
				self.tabList.Tabs.grid:setActiveItem( decalCategoryWidget )
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

if CoD.isPC then
	require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
end
local SetupPC = function ( self, controller, menu )
	self.emblemIconList:setVerticalScrollbar( CoD.verticalScrollbar )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

LUI.createMenu.EmblemChooseIcon = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemChooseIcon" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemChooseIcon.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local editorBackground = LUI.UIImage.new()
	editorBackground:setLeftRight( 0, 1, 0, 0 )
	editorBackground:setTopBottom( 0, 1, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0.75 )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( 0, 0, 5, 793 )
	TitleDotsWidget0:setTopBottom( 0, 0, -97.5, 139.5 )
	TitleDotsWidget0:setAlpha( 0.49 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 85, 850 )
	LeftPanel:setTopBottom( 0, 0, 117, 1019 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local emblemIconList = LUI.UIList.new( self, controller, 6, 0, nil, true, false, 0, 0, false, false )
	emblemIconList:makeFocusable()
	emblemIconList:setLeftRight( 0, 0, 96, 840 )
	emblemIconList:setTopBottom( 0, 0, 210, 954 )
	emblemIconList:setWidgetType( CoD.EmblemIconNew )
	emblemIconList:setHorizontalCount( 5 )
	emblemIconList:setVerticalCount( 5 )
	emblemIconList:setSpacing( 6 )
	emblemIconList:setVerticalCounter( CoD.verticalCounter )
	emblemIconList:setDataSource( "EmblemIconList" )
	emblemIconList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsElementInState( element, "New" ) then
			EmblemChooseIcon_SelectionChanged( self, element, controller )
			Emblems_SetIconOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
		else
			EmblemChooseIcon_SelectionChanged( self, element, controller )
		end
		return retVal
	end )
	self:addElement( emblemIconList )
	self.emblemIconList = emblemIconList
	
	local emblemDraw = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDraw:setLeftRight( 0, 0, 1045, 1732 )
	emblemDraw:setTopBottom( 0, 0, 229, 650 )
	emblemDraw:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeNotFocusable( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( emblemDraw )
	self.emblemDraw = emblemDraw
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -109.5, 757.5 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, -9.5, 209.5 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -409, -351 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setAlpha( 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local CategoryListPanel0 = LUI.UIImage.new()
	CategoryListPanel0:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel0:setTopBottom( 0.5, 0.5, -412, -354 )
	CategoryListPanel0:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel0 )
	self.CategoryListPanel0 = CategoryListPanel0
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( 0, 0, 0, 3746 )
	tabList:setTopBottom( 0, 0, 129, 191 )
	tabList.Tabs.grid:setHorizontalCount( 7 )
	tabList.Tabs.grid:setDataSource( "EmblemDecalTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		EmblemChooseIcon_TabChanged( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local decalBMDescription = CoD.cac_PrimaryWeaponDescription.new( self, controller )
	decalBMDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	decalBMDescription:linkToElementModel( decalBMDescription, "isBMClassified", true, function ( model )
		self:updateElementState( decalBMDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	decalBMDescription:setLeftRight( 0, 0, 1045, 1749 )
	decalBMDescription:setTopBottom( 0, 0, 747.5, 780.5 )
	decalBMDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MPUI_DECAL" ) )
	self:addElement( decalBMDescription )
	self.decalBMDescription = decalBMDescription
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( 0, 0, 1045, 1732 )
	EmblemName:setTopBottom( 0, 0, 669.5, 720.5 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	emblemDraw:linkToElementModel( emblemIconList, nil, false, function ( model )
		emblemDraw:setModel( model, controller )
	end )
	decalBMDescription:linkToElementModel( emblemIconList, nil, false, function ( model )
		decalBMDescription:setModel( model, controller )
	end )
	EmblemName:linkToElementModel( emblemIconList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	emblemIconList.navigation = {
		right = emblemDraw
	}
	emblemDraw.navigation = {
		left = emblemIconList
	}
	self.resetProperties = function ()
		LeftPanel:completeAnimation()
		decalBMDescription:completeAnimation()
		EmblemName:completeAnimation()
		emblemDraw:completeAnimation()
		editorBackground:completeAnimation()
		Background:completeAnimation()
		LeftPanel:setAlpha( 1 )
		decalBMDescription:setLeftRight( 0, 0, 1045, 1749 )
		decalBMDescription:setTopBottom( 0, 0, 747.5, 780.5 )
		EmblemName:setLeftRight( 0, 0, 1045, 1732 )
		EmblemName:setTopBottom( 0, 0, 669.5, 720.5 )
		emblemDraw:setAlpha( 1 )
		editorBackground:setAlpha( 0.75 )
		Background:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				decalBMDescription:completeAnimation()
				self.decalBMDescription:setLeftRight( 0, 0, 1045, 1749 )
				self.decalBMDescription:setTopBottom( 0, 0, 733.5, 766.5 )
				self.clipFinished( decalBMDescription, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setLeftRight( 0, 0, 1049.5, 1733.5 )
				self.EmblemName:setTopBottom( 0, 0, 669.5, 720.5 )
				self.clipFinished( EmblemName, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				decalBMDescription:completeAnimation()
				self.decalBMDescription:setLeftRight( 0, 0, 1045, 1749 )
				self.decalBMDescription:setTopBottom( 0, 0, 733.5, 766.5 )
				self.clipFinished( decalBMDescription, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setLeftRight( 0, 0, 1049.5, 1733.5 )
				self.EmblemName:setTopBottom( 0, 0, 669.5, 720.5 )
				self.clipFinished( EmblemName, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0 )
				self.clipFinished( editorBackground, {} )
				emblemDraw:completeAnimation()
				self.emblemDraw:setAlpha( 0 )
				self.clipFinished( emblemDraw, {} )
				decalBMDescription:completeAnimation()
				self.decalBMDescription:setLeftRight( 0, 0, 868, 1572 )
				self.decalBMDescription:setTopBottom( 0, 0, 274.5, 307.5 )
				self.clipFinished( decalBMDescription, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setLeftRight( 0, 0, 870, 1557 )
				self.EmblemName:setTopBottom( 0, 0, 214.5, 265.5 )
				self.clipFinished( EmblemName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmblemEditor",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller )
			end
		},
		{
			stateName = "Paintshop",
			condition = function ( menu, element, event )
				return IsPaintshop( controller )
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( self )
		elseif IsPaintshop( controller ) then
			EmblemChooseIcon_SetPreviewDecalCamera( self, element, controller )
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsEmblemEditor( controller ) then
			EmblemChooseIcon_SelectionRejected( self, element, controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsPaintshop( controller ) then
			EmblemChooseIcon_SelectionRejected( self, element, controller )
			EmblemChooseIcon_RevertPreviewDecalCamera( self, element, controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEmblemEditor( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif IsPaintshop( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsEmblemEditor( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			EmblemChooseIcon_SelectionAccepted( self, element, controller )
			EmblemEditor_SetEditMode( controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsPaintshop( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			EmblemChooseIcon_SelectionAccepted( self, element, controller )
			EmblemEditor_SetEditMode( controller )
			EmblemChooseIcon_RevertPreviewDecalCamera( self, element, controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEmblemEditor( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "Menu_Select", nil )
			return true
		elseif IsPaintshop( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "Menu_Select", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if IsPaintshop( controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPaintshop( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	emblemIconList.id = "emblemIconList"
	emblemDraw.id = "emblemDraw"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleDotsWidget0:close()
		self.LeftPanel:close()
		self.MenuFrame:close()
		self.emblemIconList:close()
		self.emblemDraw:close()
		self.cac3dTitleIntermediary0:close()
		self.tabList:close()
		self.FEMenuLeftGraphics:close()
		self.decalBMDescription:close()
		self.EmblemName:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemChooseIcon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

