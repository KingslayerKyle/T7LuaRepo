-- 1f7a6fa611211873c67d1aa1c2cb47c5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemIconNew" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

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
			local f4_local1 = f4_arg0.tabList.Tabs.grid:getItemAtPosition( 1, f0_local1( controller ), false )
			if f4_local1 then
				f4_arg0.tabList.Tabs.grid:setActiveItem( f4_local1 )
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

if CoD.isPC then
	require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
end
local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0.emblemIconList:setVerticalScrollbar( CoD.verticalScrollbar )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local3( self, controller, menu )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemChooseIcon.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local editorBackground = LUI.UIImage.new()
	editorBackground:setLeftRight( true, true, 0, 0 )
	editorBackground:setTopBottom( true, true, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0.75 )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( f7_local1, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0.49 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f7_local1, controller )
	LeftPanel:setLeftRight( true, false, 57, 567 )
	LeftPanel:setTopBottom( true, false, 78, 679 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local MenuFrame = CoD.GenericMenuFrame.new( f7_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local emblemIconList = LUI.UIList.new( f7_local1, controller, 4, 0, nil, true, false, 0, 0, false, false )
	emblemIconList:makeFocusable()
	emblemIconList:setLeftRight( true, false, 64, 560 )
	emblemIconList:setTopBottom( true, false, 140, 636 )
	emblemIconList:setWidgetType( CoD.EmblemIconNew )
	emblemIconList:setHorizontalCount( 5 )
	emblemIconList:setVerticalCount( 5 )
	emblemIconList:setSpacing( 4 )
	emblemIconList:setVerticalCounter( CoD.verticalCounter )
	emblemIconList:setDataSource( "EmblemIconList" )
	emblemIconList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f8_local0 = nil
		if IsElementInState( element, "New" ) then
			EmblemChooseIcon_SelectionChanged( self, element, controller )
			Emblems_SetIconOld( f7_local1, element, controller )
			UpdateSelfElementState( f7_local1, element, controller )
		else
			EmblemChooseIcon_SelectionChanged( self, element, controller )
		end
		return f8_local0
	end )
	self:addElement( emblemIconList )
	self.emblemIconList = emblemIconList
	
	local emblemDraw = CoD.EmblemDrawWidgetNew.new( f7_local1, controller )
	emblemDraw:setLeftRight( true, false, 696.67, 1154.67 )
	emblemDraw:setTopBottom( true, false, 153, 433.5 )
	emblemDraw:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		MakeNotFocusable( element )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( emblemDraw )
	self.emblemDraw = emblemDraw
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( f7_local1, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -73.33, 504.67 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -6, 140 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -273, -234 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setAlpha( 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local CategoryListPanel0 = LUI.UIImage.new()
	CategoryListPanel0:setLeftRight( false, false, -640, 640 )
	CategoryListPanel0:setTopBottom( false, false, -275, -236 )
	CategoryListPanel0:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel0 )
	self.CategoryListPanel0 = CategoryListPanel0
	
	local tabList = CoD.FE_TabBar.new( f7_local1, controller )
	tabList:setLeftRight( true, false, 0, 2497 )
	tabList:setTopBottom( true, false, 86, 127 )
	tabList.Tabs.grid:setHorizontalCount( 7 )
	tabList.Tabs.grid:setDataSource( "EmblemDecalTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f10_local0 = nil
		EmblemChooseIcon_TabChanged( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return f10_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f7_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local decalBMDescription = CoD.cac_PrimaryWeaponDescription.new( f7_local1, controller )
	decalBMDescription:setLeftRight( true, false, 696.67, 1165.67 )
	decalBMDescription:setTopBottom( true, false, 498, 520 )
	decalBMDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MPUI_DECAL" ) )
	decalBMDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	decalBMDescription:linkToElementModel( decalBMDescription, "isBMClassified", true, function ( model )
		f7_local1:updateElementState( decalBMDescription, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( decalBMDescription )
	self.decalBMDescription = decalBMDescription
	
	local EmblemName = CoD.WeaponNameWidget.new( f7_local1, controller )
	EmblemName:setLeftRight( true, false, 696.67, 1154.67 )
	EmblemName:setTopBottom( true, false, 446.5, 480.5 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local f7_local16 = nil
	if IsPC() then
		f7_local16 = CoD.XCamMouseControl.new( f7_local1, controller )
	else
		f7_local16 = LUI.UIElement.createFake()
	end
	f7_local16:setLeftRight( true, false, 1314.73, 1368.73 )
	f7_local16:setTopBottom( true, false, 597, 657.5 )
	if IsPC() then
		self:addElement( f7_local16 )
	end
	self.XCamMouseControl = f7_local16
	emblemDraw:linkToElementModel( emblemIconList, nil, false, function ( model )
		emblemDraw:setModel( model, controller )
	end )
	decalBMDescription:linkToElementModel( emblemIconList, nil, false, function ( model )
		decalBMDescription:setModel( model, controller )
	end )
	EmblemName:linkToElementModel( emblemIconList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			EmblemName.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	emblemIconList.navigation = {
		right = emblemDraw
	}
	emblemDraw.navigation = {
		left = emblemIconList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0.75 )
				self.clipFinished( editorBackground, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				decalBMDescription:completeAnimation()
				self.decalBMDescription:setLeftRight( true, false, 696.67, 1165.67 )
				self.decalBMDescription:setTopBottom( true, false, 489, 511 )
				self.clipFinished( decalBMDescription, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setLeftRight( true, false, 699.4, 1155.67 )
				self.EmblemName:setTopBottom( true, false, 446.5, 480.5 )
				self.clipFinished( EmblemName, {} )
				f7_local16:completeAnimation()
				self.XCamMouseControl:setLeftRight( true, false, 1314.73, 1368.73 )
				self.XCamMouseControl:setTopBottom( true, false, 597, 657.5 )
				self.clipFinished( f7_local16, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0.75 )
				self.clipFinished( editorBackground, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				decalBMDescription:completeAnimation()
				self.decalBMDescription:setLeftRight( true, false, 696.67, 1165.67 )
				self.decalBMDescription:setTopBottom( true, false, 489, 511 )
				self.clipFinished( decalBMDescription, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setLeftRight( true, false, 699.4, 1155.67 )
				self.EmblemName:setTopBottom( true, false, 446.5, 480.5 )
				self.clipFinished( EmblemName, {} )
				f7_local16:completeAnimation()
				self.XCamMouseControl:setLeftRight( true, false, 1314.73, 1368.73 )
				self.XCamMouseControl:setTopBottom( true, false, 597, 657.5 )
				self.clipFinished( f7_local16, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0 )
				self.clipFinished( editorBackground, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 57, 567 )
				self.LeftPanel:setTopBottom( true, false, 78, 679 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				emblemDraw:completeAnimation()
				self.emblemDraw:setAlpha( 0 )
				self.clipFinished( emblemDraw, {} )
				decalBMDescription:completeAnimation()
				self.decalBMDescription:setLeftRight( true, false, 578.5, 1047.67 )
				self.decalBMDescription:setTopBottom( true, false, 183, 205 )
				self.clipFinished( decalBMDescription, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setLeftRight( true, false, 580, 1038.1 )
				self.EmblemName:setTopBottom( true, false, 143, 177 )
				self.clipFinished( EmblemName, {} )
				f7_local16:completeAnimation()
				self.XCamMouseControl:setLeftRight( true, false, 586, 1201 )
				self.XCamMouseControl:setTopBottom( true, false, 217, 636 )
				self.clipFinished( f7_local16, {} )
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
		local f21_local0 = self
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CoD.Menu.AddNavigationHandler( f7_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f22_local0 = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( f7_local1 )
		elseif IsPaintshop( controller ) then
			EmblemChooseIcon_SetPreviewDecalCamera( self, element, controller )
			ShowHeaderKickerAndIcon( f7_local1 )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not f22_local0 then
			f22_local0 = element:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsEmblemEditor( f23_arg2 ) then
			EmblemChooseIcon_SelectionRejected( self, f23_arg0, f23_arg2 )
			GoBack( self, f23_arg2 )
			ClearSavedState( self, f23_arg2 )
			return true
		elseif IsPaintshop( f23_arg2 ) then
			EmblemChooseIcon_SelectionRejected( self, f23_arg0, f23_arg2 )
			EmblemChooseIcon_RevertPreviewDecalCamera( self, f23_arg0, f23_arg2 )
			GoBack( self, f23_arg2 )
			ClearSavedState( self, f23_arg2 )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if IsEmblemEditor( f24_arg2 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsPaintshop( f24_arg2 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if IsEmblemEditor( f25_arg2 ) and not IsSelfModelValueTrue( f25_arg0, f25_arg2, "isBMClassified" ) then
			EmblemChooseIcon_SelectionAccepted( self, f25_arg0, f25_arg2 )
			EmblemEditor_SetEditMode( f25_arg2 )
			GoBack( self, f25_arg2 )
			ClearSavedState( self, f25_arg2 )
			return true
		elseif IsPaintshop( f25_arg2 ) and not IsSelfModelValueTrue( f25_arg0, f25_arg2, "isBMClassified" ) then
			EmblemChooseIcon_SelectionAccepted( self, f25_arg0, f25_arg2 )
			EmblemEditor_SetEditMode( f25_arg2 )
			EmblemChooseIcon_RevertPreviewDecalCamera( self, f25_arg0, f25_arg2 )
			GoBack( self, f25_arg2 )
			ClearSavedState( self, f25_arg2 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if IsEmblemEditor( f26_arg2 ) and not IsSelfModelValueTrue( f26_arg0, f26_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "Menu_Select" )
			return true
		elseif IsPaintshop( f26_arg2 ) and not IsSelfModelValueTrue( f26_arg0, f26_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "Menu_Select" )
			return true
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if IsPaintshop( f27_arg2 ) then
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if IsPaintshop( f28_arg2 ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.emblemIconList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleDotsWidget0:close()
		element.LeftPanel:close()
		element.MenuFrame:close()
		element.emblemIconList:close()
		element.emblemDraw:close()
		element.cac3dTitleIntermediary0:close()
		element.tabList:close()
		element.FEMenuLeftGraphics:close()
		element.decalBMDescription:close()
		element.EmblemName:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemChooseIcon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

