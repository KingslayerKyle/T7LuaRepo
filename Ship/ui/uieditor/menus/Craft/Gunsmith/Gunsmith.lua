-- 383f6c15c05abe76badd2a9e14391356
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameNoFooter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWeaponList" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantSelector" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSlotsFull" )
require( "ui.uieditor.widgets.CAC.cac_CustomClassDecscription" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

local f0_local0 = function ( f1_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "Gunsmith.Mode" ) )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "Gunsmith.Mode" ), f2_arg1 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = 1
	if CoD.perController[f3_arg1].gunsmithWeaponListIndex ~= nil then
		f3_local0 = CoD.perController[f3_arg1].gunsmithWeaponListIndex
	end
	local f3_local1 = f3_arg0.weaponList:getItemAtPosition( f3_local0, 1, false )
	if f3_local1 then
		f3_arg0.weaponList:setActiveItem( f3_local1 )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = 2
	local f4_local1 = CoD.GetCustomization( f4_arg1, "category_index" )
	if f4_local1 ~= nil then
		f4_local0 = f4_local1
	end
	CoD.perController[f4_arg1].gunsmithWeaponCategoryRestored = true
	local f4_local2 = f4_arg0.tabList.Tabs.grid:getItemAtPosition( 1, f4_local0, false )
	if f4_local2 then
		f4_arg0.tabList.Tabs.grid:setActiveItem( f4_local2 )
	end
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	f5_arg0.disableDarkenElement = true
	f5_arg0.disableBlur = true
	CoD.SetCustomization( f5_arg1, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	f5_arg0.updateMode = function ( f6_arg0, f6_arg1, f6_arg2 )
		f0_local1( f5_arg1, f6_arg1 )
		if f6_arg1 == Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST then
			f6_arg0.tabList.Tabs.m_disableNavigation = false
			f6_arg0.weaponList:setMouseDisabled( false )
			f0_local3( f6_arg0, f5_arg1 )
			CoD.SwapFocusableElements( f5_arg1, f6_arg0.variantSelector, f6_arg0.weaponList )
			f0_local2( f6_arg0, f5_arg1 )
			f6_arg0:setState( "DefaultState" )
		elseif f6_arg1 == Enum.GunsmithMode.GUNSMITHMODE_VARIANTS then
			f6_arg0.tabList.Tabs.m_disableNavigation = true
			f6_arg0.weaponList:setMouseDisabled( true )
			CoD.SwapFocusableElements( f5_arg1, f6_arg0.weaponList, f6_arg0.variantSelector )
			f6_arg0:setState( "ShowVariants" )
		end
	end
	
	f5_arg0:updateMode( f0_local0( f5_arg1 ) )
end

local PreLoadFunc = function ( self, controller )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.UpdateDataSource" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.UpdateDataSource" ), function ( model )
		local f8_local0 = CoD.perController[controller].gunsmithVariantModel
		if f8_local0 then
			local f8_local1 = Engine.GetModelValue( Engine.GetModel( f8_local0, "variantIndex" ) )
			if self.variantSelector ~= nil then
				self.variantSelector.variantList:updateDataSource( true )
				self.attachmentList:updateDataSource( true )
				self.variantSelector.variantList:findItem( {
					variantIndex = f8_local1
				}, nil, true, nil )
			end
		end
	end )
end

LUI.createMenu.Gunsmith = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Gunsmith" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.buttonPrompts" )
	local f9_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( true, true, 0, 0 )
	BlackTransition:setTopBottom( true, true, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, -9, 5 )
	TitleBacking0:setTopBottom( true, false, -1, 85 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local MenuFrame = CoD.GenericMenuFrameNoFooter.new( f9_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GUNSMITH" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	MenuFrame:registerEventHandler( "menu_opened", function ( element, event )
		local f10_local0 = nil
		ShowHeaderIconOnly( f9_local1 )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f9_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, true, 78, -53 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( true, true, 0, 0 )
	TabBacking:setTopBottom( true, false, 124, 83 )
	TabBacking:setRGB( 0, 0, 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local weaponList = LUI.UIList.new( f9_local1, controller, 7, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 76.5, 356.5 )
	weaponList:setTopBottom( true, false, 137, 634 )
	weaponList:setWidgetType( CoD.GunsmithWeaponList )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:setDataSource( "CraftWeaponList" )
	weaponList:linkToElementModel( weaponList, "isBMClassified", true, function ( model )
		local f11_local0 = weaponList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:linkToElementModel( weaponList, "isContractClassified", true, function ( model )
		local f12_local0 = weaponList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isContractClassified"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f13_local0 = nil
		Gunsmith_GainFocus( self, element, controller )
		return f13_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	f9_local1:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not IsSelfModelValueTrue( f16_arg0, f16_arg2, "isBMClassified" ) and not IsSelfModelValueTrue( f16_arg0, f16_arg2, "isContractClassified" ) then
			Gunsmith_BrowseVariants( self, f16_arg0, f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isBMClassified" ) and not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isContractClassified" ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local weaponAttributes = CoD.WeaponAttributes.new( f9_local1, controller )
	weaponAttributes:setLeftRight( true, false, 449.5, 877.5 )
	weaponAttributes:setTopBottom( false, true, -167, -63 )
	weaponAttributes:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local variantSelector = CoD.GunsmithVariantSelector.new( f9_local1, controller )
	variantSelector:setLeftRight( true, false, 72, 428 )
	variantSelector:setTopBottom( true, false, 129, 655 )
	variantSelector:setAlpha( 0 )
	self:addElement( variantSelector )
	self.variantSelector = variantSelector
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f9_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 86, -16.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, 13 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local itemName = CoD.InfoPaneItemName.new( f9_local1, controller )
	itemName:setLeftRight( true, false, 388, 769 )
	itemName:setTopBottom( true, false, 137, 171 )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( itemName )
	self.itemName = itemName
	
	local attachmentList = LUI.UIList.new( f9_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 450, 754 )
	attachmentList:setTopBottom( true, false, 183, 215 )
	attachmentList:setAlpha( 0 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, -11, 13 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f9_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local f24_local0 = nil
		SizeToSafeArea( element, controller )
		if not f24_local0 then
			f24_local0 = element:dispatchEventToChildren( event )
		end
		return f24_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local tabList = CoD.FE_TabBar.new( f9_local1, controller )
	tabList:setLeftRight( true, true, 0, 1216 )
	tabList:setTopBottom( true, false, 85, 120 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "GunsmithWeaponTabType" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f25_local0 = nil
		Gunsmith_TabChanged( self, element, controller )
		return f25_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local slotsTracker = CoD.GunsmithSlotsFull.new( f9_local1, controller )
	slotsTracker:setLeftRight( true, false, 449.5, 567.5 )
	slotsTracker:setTopBottom( true, false, 594.25, 648 )
	slotsTracker:setAlpha( 0 )
	slotsTracker:subscribeToGlobalModel( controller, "PerController", "Gunsmith.UpdateDataSource", function ( model )
		UpdateSelfElementState( f9_local1, slotsTracker, controller )
	end )
	slotsTracker:mergeStateConditions( {
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
			end
		}
	} )
	self:addElement( slotsTracker )
	self.slotsTracker = slotsTracker
	
	local weaponDescription = CoD.cac_CustomClassDecscription.new( f9_local1, controller )
	weaponDescription:setLeftRight( true, false, 388, 747 )
	weaponDescription:setTopBottom( true, false, 183, 205 )
	self:addElement( weaponDescription )
	self.weaponDescription = weaponDescription
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 388, 644 )
	categoryName:setTopBottom( true, false, 114.5, 133.5 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setAlpha( 0 )
	categoryName:setText( LocalizeToUpperString( "MENU_VARIANT" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f9_local1, controller )
	XCamMouseControl:setLeftRight( false, true, -820, 0 )
	XCamMouseControl:setTopBottom( true, true, 227, -73 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local weaponVerticalCounter = CoD.verticalCounter.new( f9_local1, controller )
	weaponVerticalCounter:setLeftRight( true, false, 116, 316 )
	weaponVerticalCounter:setTopBottom( true, false, 640, 665 )
	weaponVerticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f28_local0 = nil
		SetAsListVerticalCounter( self, element, "weaponList" )
		if not f28_local0 then
			f28_local0 = element:dispatchEventToChildren( event )
		end
		return f28_local0
	end )
	self:addElement( weaponVerticalCounter )
	self.weaponVerticalCounter = weaponVerticalCounter
	
	local LockIcon = CoD.cac_LockBig.new( f9_local1, controller )
	LockIcon:setLeftRight( false, false, 159, 255 )
	LockIcon:setTopBottom( true, false, 14, 684 )
	LockIcon:setAlpha( 0 )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, "isBMClassified", true, function ( model )
		f9_local1:updateElementState( LockIcon, {
			name = "model_validation",
			menu = f9_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	itemName:linkToElementModel( weaponList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	itemName:linkToElementModel( variantSelector.variantList, "variantNameBig", true, function ( model )
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			itemName.weaponNameWithVariant.variantName.itemName:setText( variantNameBig )
		end
	end )
	attachmentList:linkToElementModel( variantSelector.variantList, "listDataSource", true, function ( model )
		local listDataSource = Engine.GetModelValue( model )
		if listDataSource then
			attachmentList:setDataSource( listDataSource )
		end
	end )
	weaponDescription:linkToElementModel( weaponList, nil, false, function ( model )
		weaponDescription:setModel( model, controller )
	end )
	weaponDescription:linkToElementModel( weaponList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			weaponDescription.weaponDescTextBox:setText( Engine.Localize( description ) )
		end
	end )
	LockIcon:linkToElementModel( weaponList, nil, false, function ( model )
		LockIcon:setModel( model, controller )
	end )
	weaponList.navigation = {
		right = variantSelector,
		down = variantSelector
	}
	variantSelector.navigation = {
		left = weaponList,
		up = weaponList,
		right = attachmentList
	}
	attachmentList.navigation = {
		left = variantSelector
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				BlackTransition:completeAnimation()
				self.BlackTransition:setAlpha( 0 )
				self.clipFinished( BlackTransition, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				self.clipFinished( TabBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 387.5, 815.5 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				self.weaponAttributes:setAlpha( 1 )
				self.clipFinished( weaponAttributes, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setAlpha( 0 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 387.5, 768.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName:setAlpha( 1 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 1 )
				self.clipFinished( CategoryListLine0, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( true, false, 388, 506 )
				self.slotsTracker:setTopBottom( true, false, 593.25, 647 )
				self.slotsTracker:setAlpha( 0 )
				self.clipFinished( slotsTracker, {} )
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( true, false, 387.5, 746.5 )
				self.weaponDescription:setTopBottom( true, false, 183, 205 )
				self.weaponDescription:setRGB( 1, 1, 1 )
				self.weaponDescription:setAlpha( 1 )
				self.clipFinished( weaponDescription, {} )
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 0 )
				self.clipFinished( categoryName, {} )
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 1 )
				self.clipFinished( weaponVerticalCounter, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 11 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 428 )
					LeftPanel:setTopBottom( true, true, 85, -53 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, true, 85, -53 )
				LeftPanelFrame2( LeftPanel, {} )
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
					end
					TabBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TabBacking, event )
					else
						TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				TabBackingFrame2( TabBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				weaponListFrame2( weaponList, {} )
				local weaponAttributesFrame2 = function ( weaponAttributes, event )
					if not event.interrupted then
						weaponAttributes:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponAttributes:setLeftRight( true, false, 449, 877 )
					weaponAttributes:setTopBottom( false, true, -167, -63 )
					if event.interrupted then
						self.clipFinished( weaponAttributes, event )
					else
						weaponAttributes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 388, 816 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				weaponAttributesFrame2( weaponAttributes, {} )
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( true, false, 77, 416 )
					variantSelector:setTopBottom( true, false, 129, 622 )
					variantSelector:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, -314, 3 )
				self.variantSelector:setTopBottom( true, false, 129, 622 )
				self.variantSelector:setAlpha( 0 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 449, 830 )
					itemName:setTopBottom( true, false, 137, 171 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 388, 769 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				tabListFrame2( tabList, {} )
				local slotsTrackerFrame2 = function ( slotsTracker, event )
					if not event.interrupted then
						slotsTracker:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					slotsTracker:setLeftRight( true, false, 450, 567.5 )
					slotsTracker:setTopBottom( true, false, 594.25, 648 )
					slotsTracker:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( slotsTracker, event )
					else
						slotsTracker:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( true, false, 388, 506 )
				self.slotsTracker:setTopBottom( true, false, 593.25, 647 )
				self.slotsTracker:setAlpha( 0 )
				slotsTrackerFrame2( slotsTracker, {} )
				local weaponDescriptionFrame2 = function ( weaponDescription, event )
					if not event.interrupted then
						weaponDescription:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
					end
					weaponDescription:setLeftRight( true, false, 418.5, 777.5 )
					weaponDescription:setTopBottom( true, false, 183, 205 )
					weaponDescription:setRGB( 1, 1, 1 )
					weaponDescription:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponDescription, event )
					else
						weaponDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( true, false, 388, 747 )
				self.weaponDescription:setTopBottom( true, false, 183, 205 )
				self.weaponDescription:setRGB( 1, 1, 1 )
				self.weaponDescription:setAlpha( 1 )
				weaponDescriptionFrame2( weaponDescription, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( true, false, 449.5, 706 )
						categoryName:setTopBottom( true, false, 114.5, 133.5 )
						categoryName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( categoryName, event )
						else
							categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryNameFrame3( categoryName, event )
						return 
					else
						categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						categoryName:setLeftRight( true, false, 418.75, 675 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 388, 644 )
				self.categoryName:setTopBottom( true, false, 114.5, 133.5 )
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
				local weaponVerticalCounterFrame2 = function ( weaponVerticalCounter, event )
					if not event.interrupted then
						weaponVerticalCounter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponVerticalCounter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponVerticalCounter, event )
					else
						weaponVerticalCounter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 1 )
				weaponVerticalCounterFrame2( weaponVerticalCounter, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 14 )
				local BlackTransitionFrame2 = function ( BlackTransition, event )
					local BlackTransitionFrame3 = function ( BlackTransition, event )
						if not event.interrupted then
							BlackTransition:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BlackTransition:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BlackTransition, event )
						else
							BlackTransition:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackTransitionFrame3( BlackTransition, event )
						return 
					else
						BlackTransition:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						BlackTransition:registerEventHandler( "transition_complete_keyframe", BlackTransitionFrame3 )
					end
				end
				
				BlackTransition:completeAnimation()
				self.BlackTransition:setAlpha( 1 )
				BlackTransitionFrame2( BlackTransition, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				self.clipFinished( TabBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 387.5, 815.5 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				self.weaponAttributes:setAlpha( 1 )
				self.clipFinished( weaponAttributes, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setAlpha( 0 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 387.5, 768.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName:setAlpha( 1 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 1 )
				self.clipFinished( CategoryListLine0, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( true, false, 388, 506 )
				self.slotsTracker:setTopBottom( true, false, 593.25, 647 )
				self.slotsTracker:setAlpha( 0 )
				self.clipFinished( slotsTracker, {} )
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( true, false, 387.5, 746.5 )
				self.weaponDescription:setTopBottom( true, false, 183, 205 )
				self.weaponDescription:setRGB( 1, 1, 1 )
				self.weaponDescription:setAlpha( 1 )
				self.clipFinished( weaponDescription, {} )
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 0 )
				self.clipFinished( categoryName, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 449.5, 877.5 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				self.clipFinished( weaponAttributes, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, 77, 416 )
				self.variantSelector:setTopBottom( true, false, 129, 622 )
				self.variantSelector:setAlpha( 1 )
				self.clipFinished( variantSelector, {} )
				FEMenuLeftGraphics:completeAnimation()
				self.FEMenuLeftGraphics:setAlpha( 1 )
				self.clipFinished( FEMenuLeftGraphics, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 449.5, 830.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( true, false, 449.5, 567.5 )
				self.slotsTracker:setTopBottom( true, false, 594.25, 648 )
				self.slotsTracker:setAlpha( 1 )
				self.slotsTracker:setScale( 1 )
				self.clipFinished( slotsTracker, {} )
				weaponDescription:completeAnimation()
				self.weaponDescription:setAlpha( 0 )
				self.clipFinished( weaponDescription, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 449.5, 705.5 )
				self.categoryName:setTopBottom( true, false, 114.5, 133.5 )
				self.categoryName:setAlpha( 1 )
				self.categoryName:setText( LocalizeToUpperString( "MENU_VARIANT" ) )
				self.clipFinished( categoryName, {} )
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 0 )
				self.clipFinished( weaponVerticalCounter, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 12 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 368 )
					LeftPanel:setTopBottom( true, true, 78, -53 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				LeftPanelFrame2( LeftPanel, {} )
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					TabBacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TabBacking, event )
					else
						TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 0 )
				TabBackingFrame2( TabBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				weaponListFrame2( weaponList, {} )
				local weaponAttributesFrame2 = function ( weaponAttributes, event )
					if not event.interrupted then
						weaponAttributes:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponAttributes:setLeftRight( true, false, 388, 816 )
					weaponAttributes:setTopBottom( false, true, -167, -63 )
					if event.interrupted then
						self.clipFinished( weaponAttributes, event )
					else
						weaponAttributes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 442, 870 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				weaponAttributesFrame2( weaponAttributes, {} )
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( true, false, -312.87, 4.13 )
					variantSelector:setTopBottom( true, false, 129, 622 )
					variantSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, 77, 416 )
				self.variantSelector:setTopBottom( true, false, 129, 622 )
				self.variantSelector:setAlpha( 1 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 388, 769 )
					itemName:setTopBottom( true, false, 137, 171 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 449.5, 830.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				itemNameFrame2( itemName, {} )
				local attachmentListFrame2 = function ( attachmentList, event )
					if not event.interrupted then
						attachmentList:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
					end
					attachmentList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( attachmentList, event )
					else
						attachmentList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 1 )
				attachmentListFrame2( attachmentList, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				tabListFrame2( tabList, {} )
				local slotsTrackerFrame2 = function ( slotsTracker, event )
					local slotsTrackerFrame3 = function ( slotsTracker, event )
						if not event.interrupted then
							slotsTracker:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						slotsTracker:setLeftRight( true, false, 388, 506 )
						slotsTracker:setTopBottom( true, false, 593.25, 647 )
						slotsTracker:setAlpha( 0 )
						slotsTracker:setScale( 1 )
						if event.interrupted then
							self.clipFinished( slotsTracker, event )
						else
							slotsTracker:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						slotsTrackerFrame3( slotsTracker, event )
						return 
					else
						slotsTracker:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						slotsTracker:setLeftRight( true, false, 418.75, 536.75 )
						slotsTracker:setTopBottom( true, false, 593.75, 647.5 )
						slotsTracker:setAlpha( 0 )
						slotsTracker:registerEventHandler( "transition_complete_keyframe", slotsTrackerFrame3 )
					end
				end
				
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( true, false, 449.5, 567.5 )
				self.slotsTracker:setTopBottom( true, false, 594.25, 648 )
				self.slotsTracker:setAlpha( 1 )
				self.slotsTracker:setScale( 1 )
				slotsTrackerFrame2( slotsTracker, {} )
				local weaponDescriptionFrame2 = function ( weaponDescription, event )
					if not event.interrupted then
						weaponDescription:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponDescription:setLeftRight( true, false, 387.5, 706.5 )
					weaponDescription:setTopBottom( true, false, 183, 205 )
					weaponDescription:setRGB( 1, 1, 1 )
					weaponDescription:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponDescription, event )
					else
						weaponDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( true, false, 449.5, 808.5 )
				self.weaponDescription:setTopBottom( true, false, 183, 205 )
				self.weaponDescription:setRGB( 1, 1, 1 )
				self.weaponDescription:setAlpha( 0 )
				weaponDescriptionFrame2( weaponDescription, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( true, false, 388, 636.5 )
						categoryName:setTopBottom( true, false, 114.5, 133.5 )
						categoryName:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( categoryName, event )
						else
							categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryNameFrame3( categoryName, event )
						return 
					else
						categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						categoryName:setLeftRight( true, false, 418.75, 667.25 )
						categoryName:setAlpha( 0 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 449.5, 698 )
				self.categoryName:setTopBottom( true, false, 114.5, 133.5 )
				self.categoryName:setAlpha( 1 )
				categoryNameFrame2( categoryName, {} )
				local weaponVerticalCounterFrame2 = function ( weaponVerticalCounter, event )
					if not event.interrupted then
						weaponVerticalCounter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponVerticalCounter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponVerticalCounter, event )
					else
						weaponVerticalCounter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 0 )
				weaponVerticalCounterFrame2( weaponVerticalCounter, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" ), function ( model )
		local f71_local0 = self
		local f71_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.Mode"
		}
		CoD.Menu.UpdateButtonShownState( f71_local0, f9_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( f9_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f72_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f9_local1, true )
		ShowHeaderIconOnly( f9_local1 )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerText( "MENU_GUNSMITH" )
		SetPerControllerTableProperty( controller, "editingWeaponBuildKits", nil )
		if not f72_local0 then
			f72_local0 = element:dispatchEventToChildren( event )
		end
		return f72_local0
	end )
	f9_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
		if IsModelValueEqualTo( f73_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			SendClientScriptMenuChangeNotify( f73_arg2, f73_arg1, false )
			GoBack( self, f73_arg2 )
			Gunsmith_Back( self, f73_arg0, f73_arg2 )
			ClearSavedState( self, f73_arg2 )
			SendClientScriptNotifyForAdjustedClient( f73_arg2, "CustomClass_closed", "" )
			return true
		elseif IsModelValueEqualTo( f73_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			Gunsmith_ChooseWeaponList( self, f73_arg0, f73_arg2 )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( f74_arg0, f74_arg1, f74_arg2 )
		if IsModelValueEqualTo( f74_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			CoD.Menu.SetButtonLabel( f74_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif IsModelValueEqualTo( f74_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			CoD.Menu.SetButtonLabel( f74_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		else
			return false
		end
	end, false )
	f9_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
		return true
	end, function ( f76_arg0, f76_arg1, f76_arg2 )
		CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f9_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
		return true
	end, function ( f78_arg0, f78_arg1, f78_arg2 )
		CoD.Menu.SetButtonLabel( f78_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	f9_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
		if AlwaysFalse() then
			UpdateState( self, event )
			return true
		else
			
		end
	end, function ( f80_arg0, f80_arg1, f80_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f80_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_GUNSMITH_VARIANT_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	weaponList.id = "weaponList"
	variantSelector.id = "variantSelector"
	attachmentList.id = "attachmentList"
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f9_local1
	} )
	if not self:restoreState() then
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.LeftPanel:close()
		element.weaponList:close()
		element.weaponAttributes:close()
		element.variantSelector:close()
		element.FEMenuLeftGraphics:close()
		element.itemName:close()
		element.attachmentList:close()
		element.feFooterContainerNOTLobby:close()
		element.tabList:close()
		element.slotsTracker:close()
		element.weaponDescription:close()
		element.XCamMouseControl:close()
		element.weaponVerticalCounter:close()
		element.LockIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

